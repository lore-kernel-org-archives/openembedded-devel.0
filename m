Received: from vms173003pub.verizon.net ([206.46.173.3])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1Oy8t5-0000Sf-45
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Sep 2010 21:52:23 +0200
Received: from gandalf.denix.org ([unknown] [71.255.228.135])
	by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0L9400KFM4IKZGY1@vms173003.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	21 Sep 2010 14:52:02 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 8F13714AF64; Tue,
	21 Sep 2010 15:51:56 -0400 (EDT)
Date: Tue, 21 Sep 2010 15:51:56 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20100921195156.GF11562@denix.org>
References: <AANLkTimJj=8JDVsumZDSzNrpWcf6t1t4FA5WrGgWofDX@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <AANLkTimJj=8JDVsumZDSzNrpWcf6t1t4FA5WrGgWofDX@mail.gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.3
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: SRC_URI_arch override. error?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 21 Sep 2010 19:52:24 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Sep 08, 2010 at 04:52:20PM +0200, Frans Meulenbroeks wrote:
> Hi,
> 
> I have an issue with the linux-libc-headers recipe for nios2.
> Maybe I am trying to do something what is not possible.
> 
> The recipe contains:
> SRC_URI = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar.bz2 \
> 	  "
> 
> SRC_URI_nios2 =
> "ftp://opensource.axon.nl/mirror/git_sopc.et.ntust.edu.tw.linux-2.6.git_a32ca88c4f3f3850c5c9789db2afab2530c6856d.tar.gz;name=nios2tarball
> \
> 	  "
> 
> I was under the assumption that when building with TARGET_ARCH set to
> "nios2" (e.g. for machine neek) I would get the 2nd uri.
> However actually the system seems to concatenate these two URI's.
> 
> I have locally modified classes/base.bbclass function base_do_unpack
> do dump some info:
> python base_do_unpack() {
>     from glob import glob
> 
>     srcurldata = bb.fetch.init(d.getVar("SRC_URI", True).split(), d, True)
>     bb.note("unpacking SRC_URI %s" % d.getVar("SRC_URI", True))
>     bb.note("unpacking SRC_URI split %s" % d.getVar("SRC_URI", True).split())
>     bb.note("unpacking srcurldata %s" % srcurldata)

Frans,

Are you still facing this issue?

Looks like I'm in the same boat with you on this one - I have an amended 
recipe in a local overlay, which slightly modifies the source tarball name in 
SRC_URI. It used to work fine before, but lately it tries to call do_unpack() 
on both - the source tarball with the name from amend.inc, as well as the 
source tarball with the name from the original SRC_URI. Since it doesn't do 
do_fetch() for both, only do_unpack(), it fails if the other tarball was not 
previously downloaded into DL_DIR...

I was able to trace the problem down to the do_unpack() rewrite commit:

http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=900cc29b603691eb3a077cb660545ead3715ed54

Before this commit, SRC_URI used to behave properly, even with modifications 
and amendments. I'm still trying to debug the new code to see where the 
problem happens.

Maybe, Chris, as the author of that code, can spot the issue sooner. Thanks.

-- 
Denys

> This generates the following output
> 
> NOTE: unpacking SRC_URI
> ftp://opensource.axon.nl/mirror/git_sopc.et.ntust.edu.tw.linux-2.6.git_a32ca88c4f3f3850c5c9789db2afab2530c6856d.tar.gz;name=nios2tarball
> NOTE: package linux-libc-headers-2.6.34-r1: task do_distribute_sources: Started
> NOTE: unpacking SRC_URI split
> ['ftp://opensource.axon.nl/mirror/git_sopc.et.ntust.edu.tw.linux-2.6.git_a32ca88c4f3f3850c5c9789db2afab2530c6856d.tar.gz;name=nios2tarball']
> NOTE: unpacking srcurldata
> {'ftp://opensource.axon.nl/mirror/git_sopc.et.ntust.edu.tw.linux-2.6.git_a32ca88c4f3f3850c5c9789db2afab2530c6856d.tar.gz;name=nios2tarball':
> <bb.fetch.FetchData object at 0x12786610>,
> 'http://kernel.org/pub/linux/kernel/v2.6/linux-2.6.34.tar.bz2':
> <bb.fetch.FetchData object at 0x12786590>}
> NOTE: unpacking url
> /mirror/git_sopc.et.ntust.edu.tw.linux-2.6.git_a32ca88c4f3f3850c5c9789db2afab2530c6856d.tar.gz
> NOTE: Unpacking
> ../downloads/git_sopc.et.ntust.edu.tw.linux-2.6.git_a32ca88c4f3f3850c5c9789db2afab2530c6856d.tar.gz
> to ../tmp/work/nios2-linux/linux-libc-headers-2.6.34-r1/
> NOTE: package linux-libc-headers-2.6.34-r1: task
> do_distribute_sources: Succeeded
> NOTE: unpacking url /pub/linux/kernel/v2.6/linux-2.6.34.tar.bz2
> ...
> 
> The odd thing is that the first two debug statements deliver exactly
> what I expect.
> However srcurldata seems to create fetch objects for both url's.
> I didn't manage yet to debug bb.fetch.init, but maybe someone has
> already an idea on this (or on how to debug this).
> Anyway, any help is appreciated.
> 
> Frans.
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


