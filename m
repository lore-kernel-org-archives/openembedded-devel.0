Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OtM1Q-0006I0-3u
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Sep 2010 16:53:15 +0200
Received: by pxi11 with SMTP id 11so56193pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Sep 2010 07:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=buN2DwM8MsUi12ScEpalk3GF0wk22StfM/YC7xC924E=;
	b=WjZC4wxKm2sVQ9oZMVdJQgi+J7Dm2h/tYpGjD256HG4iEOEDhqkm3hZL/vAKo43BiR
	qT1TmO7TFAkDtu7SKAewhuGnhhMjlY8FiilKkwfbTrIxP0wUVEMaG4/P5+nyQejkMXeG
	9xGbrsjlmzAAm3ZYkzmS2tGia0SBbL60mVpeI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=dvS++GmuMSrl5OKp9otk3SICOjVuwE5zdeo6LeZHlaDlMaWhcj4gI5p1W4Lf2ZmIU+
	5WxWw9kqiBz/PxNi5xO1EriloI7pOHeIRU5HeJuDrghc+zDL2dyGoNF9KVWb/BlSF72t
	4LmuWB1xXlY7aOTsG9d1chK4uNrzi/Z1korcA=
MIME-Version: 1.0
Received: by 10.114.67.8 with SMTP id p8mr75797waa.102.1283957542237; Wed, 08
	Sep 2010 07:52:22 -0700 (PDT)
Received: by 10.231.208.17 with HTTP; Wed, 8 Sep 2010 07:52:20 -0700 (PDT)
Date: Wed, 8 Sep 2010 16:52:20 +0200
Message-ID: <AANLkTimJj=8JDVsumZDSzNrpWcf6t1t4FA5WrGgWofDX@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: SRC_URI_arch override. error?
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
X-List-Received-Date: Wed, 08 Sep 2010 14:53:30 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

I have an issue with the linux-libc-headers recipe for nios2.
Maybe I am trying to do something what is not possible.

The recipe contains:
SRC_URI = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar.bz2 \
	  "

SRC_URI_nios2 =
"ftp://opensource.axon.nl/mirror/git_sopc.et.ntust.edu.tw.linux-2.6.git_a32ca88c4f3f3850c5c9789db2afab2530c6856d.tar.gz;name=nios2tarball
\
	  "

I was under the assumption that when building with TARGET_ARCH set to
"nios2" (e.g. for machine neek) I would get the 2nd uri.
However actually the system seems to concatenate these two URI's.

I have locally modified classes/base.bbclass function base_do_unpack
do dump some info:
python base_do_unpack() {
    from glob import glob

    srcurldata = bb.fetch.init(d.getVar("SRC_URI", True).split(), d, True)
    bb.note("unpacking SRC_URI %s" % d.getVar("SRC_URI", True))
    bb.note("unpacking SRC_URI split %s" % d.getVar("SRC_URI", True).split())
    bb.note("unpacking srcurldata %s" % srcurldata)

This generates the following output

NOTE: unpacking SRC_URI
ftp://opensource.axon.nl/mirror/git_sopc.et.ntust.edu.tw.linux-2.6.git_a32ca88c4f3f3850c5c9789db2afab2530c6856d.tar.gz;name=nios2tarball
NOTE: package linux-libc-headers-2.6.34-r1: task do_distribute_sources: Started
NOTE: unpacking SRC_URI split
['ftp://opensource.axon.nl/mirror/git_sopc.et.ntust.edu.tw.linux-2.6.git_a32ca88c4f3f3850c5c9789db2afab2530c6856d.tar.gz;name=nios2tarball']
NOTE: unpacking srcurldata
{'ftp://opensource.axon.nl/mirror/git_sopc.et.ntust.edu.tw.linux-2.6.git_a32ca88c4f3f3850c5c9789db2afab2530c6856d.tar.gz;name=nios2tarball':
<bb.fetch.FetchData object at 0x12786610>,
'http://kernel.org/pub/linux/kernel/v2.6/linux-2.6.34.tar.bz2':
<bb.fetch.FetchData object at 0x12786590>}
NOTE: unpacking url
/mirror/git_sopc.et.ntust.edu.tw.linux-2.6.git_a32ca88c4f3f3850c5c9789db2afab2530c6856d.tar.gz
NOTE: Unpacking
../downloads/git_sopc.et.ntust.edu.tw.linux-2.6.git_a32ca88c4f3f3850c5c9789db2afab2530c6856d.tar.gz
to ../tmp/work/nios2-linux/linux-libc-headers-2.6.34-r1/
NOTE: package linux-libc-headers-2.6.34-r1: task
do_distribute_sources: Succeeded
NOTE: unpacking url /pub/linux/kernel/v2.6/linux-2.6.34.tar.bz2
...

The odd thing is that the first two debug statements deliver exactly
what I expect.
However srcurldata seems to create fetch objects for both url's.
I didn't manage yet to debug bb.fetch.init, but maybe someone has
already an idea on this (or on how to debug this).
Anyway, any help is appreciated.

Frans.


