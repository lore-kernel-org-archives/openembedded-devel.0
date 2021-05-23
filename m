Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.5123.1621732290130632371
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 22 May 2021 18:11:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4EC6640C1C;
	Sun, 23 May 2021 01:11:29 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JFKVqj2RfwNX; Sun, 23 May 2021 01:11:29 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 251A340A28;
	Sun, 23 May 2021 01:11:27 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 798EA16C044; Sat, 22 May 2021 21:11:26 -0400 (EDT)
Date: Sat, 22 May 2021 21:11:26 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: akuster808 <akuster808@gmail.com>
Cc: openembedded-devel@lists.openembedded.org,
	Khem Raj <raj.khem@gmail.com>
Subject: Re: [dunfell][PATCH] linuxptp: Fix cross build
Message-ID: <20210523011126.GN1528@denix.org>
References: <1620078960-57111-1-git-send-email-denis@denix.org>
 <20210517164640.GF1528@denix.org>
 <ab9aa6d7-6b7a-c67f-26d8-71b52b655375@gmail.com>
MIME-Version: 1.0
In-Reply-To: <ab9aa6d7-6b7a-c67f-26d8-71b52b655375@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Thanks! Saw it dunfell-dut and your pull request.

On Sat, May 22, 2021 at 04:16:04PM -0700, akuster808 wrote:
> in dunfell-next. waiting for merge.
> 
> -armin
> 
> On 5/17/21 9:46 AM, Denys Dmytriyenko wrote:
> > ping.
> >
> > On Mon, May 03, 2021 at 05:56:00PM -0400, Denys Dmytriyenko wrote:
> >> From: Khem Raj <raj.khem@gmail.com>
> >>
> >> Adjust incdefs.sh to use cross tools to poke for system functionality
> >> Re-enable using incdefs.sh
> >> export KBUILD_OUTPUT to point to recipe sysroot
> >>
> >> (From meta-oe rev: b6022761d6880382c5e6ffa4b3dc6f1ec2ae1e73)
> >>
> >> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> Signed-off-by: Denys Dmytriyenko <denis@denix.org>
> >> ---
> >>  .../linuxptp/Use-cross-cpp-in-incdefs.patch        | 26 +++++++++++++++++++
> >>  .../linuxptp/no-incdefs-using-host-headers.patch   | 29 ----------------------
> >>  .../recipes-connectivity/linuxptp/linuxptp_2.0.bb  |  7 +++---
> >>  3 files changed, 30 insertions(+), 32 deletions(-)
> >>  create mode 100644 meta-oe/recipes-connectivity/linuxptp/linuxptp/Use-cross-cpp-in-incdefs.patch
> >>  delete mode 100644 meta-oe/recipes-connectivity/linuxptp/linuxptp/no-incdefs-using-host-headers.patch
> >>
> >> diff --git a/meta-oe/recipes-connectivity/linuxptp/linuxptp/Use-cross-cpp-in-incdefs.patch b/meta-oe/recipes-connectivity/linuxptp/linuxptp/Use-cross-cpp-in-incdefs.patch
> >> new file mode 100644
> >> index 0000000..8760886
> >> --- /dev/null
> >> +++ b/meta-oe/recipes-connectivity/linuxptp/linuxptp/Use-cross-cpp-in-incdefs.patch
> >> @@ -0,0 +1,26 @@
> >> +From 8a4cad5e2f2cbb6a34bdc6e877fe499502b8c4c8 Mon Sep 17 00:00:00 2001
> >> +From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> >> +Date: Fri, 23 Dec 2016 18:12:29 +0100
> >> +Subject: [PATCH] linuxptp: Use cross cpp in incdefs
> >> +
> >> +Use cross cpp incdefs.sh shell script since we are doing cross compiling
> >> +we need to ensure we use correct setttings from toolchain
> >> +
> >> +Upstream-Status: Inappropriate [OE-Specific]
> >> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> +---
> >> +
> >> + makefile | 2 +-
> >> + 1 file changed, 1 insertion(+), 1 deletion(-)
> >> +
> >> +--- a/incdefs.sh
> >> ++++ b/incdefs.sh
> >> +@@ -27,7 +27,7 @@ user_flags()
> >> + 	printf " -D_GNU_SOURCE"
> >> + 
> >> + 	# Get list of directories searched for header files.
> >> +-	dirs=$(echo "" | ${CROSS_COMPILE}cpp -Wp,-v 2>&1 >/dev/null | grep ^" /")
> >> ++	dirs=$(${CPP} -Wp,-v -xc /dev/null 2>&1 >/dev/null | grep ^" /")
> >> + 
> >> + 	# Look for clock_adjtime().
> >> + 	for d in $dirs; do
> >> diff --git a/meta-oe/recipes-connectivity/linuxptp/linuxptp/no-incdefs-using-host-headers.patch b/meta-oe/recipes-connectivity/linuxptp/linuxptp/no-incdefs-using-host-headers.patch
> >> deleted file mode 100644
> >> index 02dbb23..0000000
> >> --- a/meta-oe/recipes-connectivity/linuxptp/linuxptp/no-incdefs-using-host-headers.patch
> >> +++ /dev/null
> >> @@ -1,29 +0,0 @@
> >> -From 8a4cad5e2f2cbb6a34bdc6e877fe499502b8c4c8 Mon Sep 17 00:00:00 2001
> >> -From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> >> -Date: Fri, 23 Dec 2016 18:12:29 +0100
> >> -Subject: [PATCH] linuxptp: no incdefs using host headers
> >> -
> >> -Avoid using host headers via incdefs.sh shell script.
> >> -
> >> -Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> >> ----
> >> -
> >> - makefile | 2 +-
> >> - 1 file changed, 1 insertion(+), 1 deletion(-)
> >> -
> >> -diff --git a/makefile b/makefile
> >> -index 8cdbd15..85174b8 100644
> >> ---- a/makefile
> >> -+++ b/makefile
> >> -@@ -33,7 +33,7 @@ OBJECTS	= $(OBJ) hwstamp_ctl.o phc2sys.o phc_ctl.o pmc.o pmc_common.o \
> >> - SRC	= $(OBJECTS:.o=.c)
> >> - DEPEND	= $(OBJECTS:.o=.d)
> >> - srcdir	:= $(dir $(lastword $(MAKEFILE_LIST)))
> >> --incdefs := $(shell $(srcdir)/incdefs.sh)
> >> -+#incdefs := $(shell $(srcdir)/incdefs.sh)
> >> - version := $(shell $(srcdir)/version.sh $(srcdir))
> >> - VPATH	= $(srcdir)
> >> - 
> >> --- 
> >> -2.9.3
> >> -
> >> diff --git a/meta-oe/recipes-connectivity/linuxptp/linuxptp_2.0.bb b/meta-oe/recipes-connectivity/linuxptp/linuxptp_2.0.bb
> >> index 930c667..e80abc7 100644
> >> --- a/meta-oe/recipes-connectivity/linuxptp/linuxptp_2.0.bb
> >> +++ b/meta-oe/recipes-connectivity/linuxptp/linuxptp_2.0.bb
> >> @@ -4,15 +4,16 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> >>  
> >>  SRC_URI = "http://sourceforge.net/projects/linuxptp/files/v${PV}/linuxptp-${PV}.tgz \
> >>             file://build-Allow-CC-and-prefix-to-be-overriden.patch \
> >> -           file://no-incdefs-using-host-headers.patch \
> >> +           file://Use-cross-cpp-in-incdefs.patch \
> >>             file://time_t_maybe_long_long.patch \
> >>             "
> >>  
> >>  SRC_URI[md5sum] = "d8bb7374943bb747db7786ac26f17f11"
> >>  SRC_URI[sha256sum] = "0a24d9401e87d4af023d201e234d91127d82c350daad93432106284aa9459c7d"
> >>  
> >> -EXTRA_OEMAKE = "ARCH=${TARGET_ARCH} \
> >> -    EXTRA_CFLAGS='-D_GNU_SOURCE -DHAVE_CLOCK_ADJTIME -DHAVE_POSIX_SPAWN -DHAVE_ONESTEP_SYNC ${CFLAGS}'"
> >> +EXTRA_OEMAKE = "ARCH=${TARGET_ARCH} EXTRA_CFLAGS='${CFLAGS}'"
> >> +
> >> +export KBUILD_OUTPUT="${RECIPE_SYSROOT}"
> >>  
> >>  do_install () {
> >>      install -d ${D}/${bindir}
> >> -- 
> >> 2.7.4
> >>
> 
