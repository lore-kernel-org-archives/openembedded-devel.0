Received: from [85.214.48.103] (helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1KMK8R-0002Xc-5h
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Jul 2008 12:02:51 +0200
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 4FE9C8400B0;
	Fri, 25 Jul 2008 12:01:32 +0200 (CEST)
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id D25EB8400AC;
	Fri, 25 Jul 2008 12:01:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.2.4 (2008-01-01) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=AWL,BAYES_20 autolearn=ham
	version=3.2.4
Received: from rhein.familie-heinold.de (e178121022.adsl.alicedsl.de
	[85.178.121.22]) by mail.familie-heinold.de (Postfix) with ESMTP;
	Fri, 25 Jul 2008 12:01:31 +0200 (CEST)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 469153C18C; Fri, 25 Jul 2008 12:01:27 +0200 (CEST)
Date: Fri, 25 Jul 2008 12:01:27 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20080725100127.GA4554@rhein.zuhause.netz>
References: <1216087105.10214.7.camel@isis> <487DACFF.5010504@gmail.com>
	<c384c5ea0807161343s2085dda5ua5f526967583e293@mail.gmail.com>
	<20080720014112.GA13759@oberlord>
	<20080723090416.GB24264@gmail.com>
	<1216890646.6103.5.camel@dax.rpnet.com>
	<1216915506.6103.40.camel@dax.rpnet.com>
	<g6a9vs$hok$1@ger.gmane.org> <20080725073304.GA10944@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20080725073304.GA10944@gmail.com>
User-Agent: Mutt/1.5.18 (2008-05-17)
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: openembedded-devel@openembedded.org
Subject: Re: [RFC]: Toolchain build sequence alteration.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Fri, 25 Jul 2008 10:02:51 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 25, 2008 at 12:33:04AM -0700, Khem Raj wrote:
> On (24/07/08 18:18), Koen Kooi wrote:
> 
> Thank you Koen and RP for testing it out and ACK'ing. I have committed
> the big patch. Let me know of any fallouts and I will try to fix them.
> 
> Happy hacking.

Hi,

I find the first strange think when using angstroem and uclibc with
armoabi. TARGET_OS is configured at

include/distro/angstrom-uclibc.conf

with
TARGET_OS_UC =
"linux${@['-uclibc','-uclibcgnueabi'][bb.data.getVar('TARGET_ARCH',d,1)
in ['arm', 'armeb'] and bb.data.getVar('MACHINE',d) not in
['collie','h3600', 'h3800', 'simpad', 'htcwallaby']]}"

and

TARGET_OS ?= "${@['${TARGET_OS_UC}',
'uclinux-uclibc'][bb.data.getVar('TARGET_ARCH',d)  in ['bfin']]}"

For some reason it dont set TARGET_OS and therefor the sanity checker
bails out.

For now I swtiched back to TARGET_OS = ..., as before and I am able to
build packages again.

Bye,

Henning


