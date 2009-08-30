Received: from [209.85.211.200] (helo=mail-yw0-f200.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1MhhIz-000787-S6
	for openembedded-devel@lists.openembedded.org;
	Sun, 30 Aug 2009 12:06:38 +0200
Received: by ywh38 with SMTP id 38so4436483ywh.20
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 Aug 2009 02:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=Wwz6wttL2UJ0dNsNwC1twJB+6diOsYMpwVibTxwddX0=;
	b=iTpA6CMZsURuG6TM6tZvXXdYkpFrQUgy/bFPqeIO9M8UezYPVflFfgAawQoX6jt2co
	d0zPYtiJyxaiDRBCjU0JR1TtENjECSDpYVko5AX1k5aQW3xs67//eiUdzJoyBya9lPVq
	5Z56TGkhimL9LtbMCGqbxvkxE+roUQxtE3mmc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=XvFwGcBZLmysnCH2kzo/MkL/14KWhP4yQHkZfQVEdJ8sJjA0K1ZYxcobnz5UVrcac4
	AuSDRC0z+8JCJGPP+CsKei/6mmhk8Xt1jwMsKqb7oRaTE2mYHhF8O/o6eAeREIv9XAiM
	KtH2hNRbaV5GXcyK1IZ5dyAAukODNT0LGVmZs=
Received: by 10.150.237.4 with SMTP id k4mr6346152ybh.93.1251625693222;
	Sun, 30 Aug 2009 02:48:13 -0700 (PDT)
Received: from gmail.com (adsl-71-146-29-169.dsl.pltn13.sbcglobal.net
	[71.146.29.169])
	by mx.google.com with ESMTPS id 20sm547069pzk.1.2009.08.30.02.48.11
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 30 Aug 2009 02:48:12 -0700 (PDT)
Date: Sun, 30 Aug 2009 02:48:09 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090830094809.GB26823@gmail.com>
References: <1251504044-2315-1-git-send-email-raj.khem@gmail.com>
	<20090829020254.GC6785@smtp.west.cox.net>
	<19c1b8a90908290050q60b6d47dw7b559087e343dc41@mail.gmail.com>
	<20090830012244.GA5033@gmail.com>
	<1251619852.4215.666.camel@lenovo.internal.reciva.com>
	<1251620948.4215.673.camel@lenovo.internal.reciva.com>
MIME-Version: 1.0
In-Reply-To: <1251620948.4215.673.camel@lenovo.internal.reciva.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH] sane-toolchain-eglibc.inc: Set TARGET_OS	= linux-gnuspe for e500
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
X-List-Received-Date: Sun, 30 Aug 2009 10:06:38 -0000
X-Groupsio-MsgNum: 12863
Content-Type: multipart/mixed; boundary="bg08WKrSYDhXBjb5"
Content-Disposition: inline

--bg08WKrSYDhXBjb5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (30/08/09 09:29), Phil Blundell wrote:
> On Sun, 2009-08-30 at 09:10 +0100, Phil Blundell wrote:
> > On Sat, 2009-08-29 at 18:22 -0700, Khem Raj wrote:
> > > We can override only for powerpc second time around. So changing it
> > to 
> > > 
> > > TARGET_OS_powerpc =
> > > "linux${@['','-gnuspe'][bb.data.getVar('TARGET_ARCH',d,1) in ['ppc',
> > > 'powerpc'] and bb.data.getVar('MACHINE',d) in ['calamari',
> > 'tqm8540']]}"
> > > 
> > > will that be ok ?
> > 
> > That's better, but it still doesn't seem terribly elegant.  I also
> > remain slightly unconvinced that the eglibc-specific file is,
> > conceptually, the right place for this logic. 
> 
> Actually, there is still a bigger problem with this change: it will
> cause the ABI to change in a semi-random way depending on the selected
> MACHINE and this will screw up people who are trying to do multimachine
> builds.
> 
> For example, if I set MACHINE=calamari and then bitbake micro-image, it
> will select linux-gnuspe and I will presumably get the SPE ABI.  But
> then, if I set MACHINE=efika, say, and build another package in the same
> tree, it'll now select regular linux and the ABI will change, although
> this won't be reflected in the naming of the output packages: they'll
> all just be named "powerpc".  Worse, if eglibc itself happens to be
> version-bumped while I am building for efika, my C library will be
> quietly recompiled with a different ABI and, presumably, lose in a
> fairly serious way.
> 

attaching the patch that actually will get further than parsing.

Thx

-Khem

> p.
> 
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--bg08WKrSYDhXBjb5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=diff

diff --git a/conf/distro/include/sane-toolchain-eglibc.inc b/conf/distro/include/sane-toolchain-eglibc.inc
index 006f1d6..4c5f44f 100644
--- a/conf/distro/include/sane-toolchain-eglibc.inc
+++ b/conf/distro/include/sane-toolchain-eglibc.inc
@@ -3,10 +3,6 @@
 # eglibc:
 # [23:00] oxo: glibc (any version) on sparc does not like (repeat me) "-Os"
 
-TARGET_OS = "linux${@['','-gnueabi'][bb.data.getVar('TARGET_ARCH',d,1) in ['arm', 'armeb'] and bb.data.getVar('MACHINE',d) not in ['collie','h3600', 'h3800', 'simpad', 'htcwallaby']]}"
-
-TARGET_OS_powerpc = "linux${@['','-gnuspe'][bb.data.getVar('TARGET_ARCH',d,1) in ['ppc', 'powerpc'] and bb.data.getVar('MACHINE',d) in ['calamari', 'tqm8540']]}"
-
 FULL_OPTIMIZATION = "-fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os"
 FULL_OPTIMIZATION_pn-perl = "-fexpensive-optimizations -fomit-frame-pointer -frename-registers -O1"
 FULL_OPTIMIZATION_sparc = "-fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2"
diff --git a/conf/distro/include/sane-toolchain-glibc.inc b/conf/distro/include/sane-toolchain-glibc.inc
index f3da7c3..f029c6f 100644
--- a/conf/distro/include/sane-toolchain-glibc.inc
+++ b/conf/distro/include/sane-toolchain-glibc.inc
@@ -2,8 +2,6 @@
 
 # glibc:
 
-TARGET_OS = "linux${@['','-gnueabi'][bb.data.getVar('TARGET_ARCH',d,1) in ['arm', 'armeb'] and bb.data.getVar('MACHINE',d) not in ['collie','h3600', 'h3800', 'simpad', 'htcwallaby']]}"
-
 #mess with compiler flags to use -Os instead of -O2
 #Please see http://free-electrons.com/doc/embedded_linux_optimizations/img47.html for some more info
 # perl has some problems, see http://bugs.openembedded.net/show_bug.cgi?id=1616
diff --git a/conf/distro/include/sane-toolchain-uclibc.inc b/conf/distro/include/sane-toolchain-uclibc.inc
index 04935fe..3069820 100644
--- a/conf/distro/include/sane-toolchain-uclibc.inc
+++ b/conf/distro/include/sane-toolchain-uclibc.inc
@@ -15,9 +15,6 @@ USE_NLS_glib-2.0 = "yes"
 USE_NLS_glib-2.0-native = "yes"
 USE_NLS_gcc-cross = "no"
 
-TARGET_OS_UC = "linux${@['-uclibc','-uclibcgnueabi'][bb.data.getVar('TARGET_ARCH',d,1) in ['arm', 'armeb'] and bb.data.getVar('MACHINE',d) not in ['collie','h3600', 'h3800', 'simpad', 'htcwallaby']]}"
-TARGET_OS = "${@['${TARGET_OS_UC}', 'uclinux-uclibc'][bb.data.getVar('TARGET_ARCH',d)  in ['bfin']]}"
-
 #mess with compiler flags to use -Os instead of -O2
 #Please see http://free-electrons.com/doc/embedded_linux_optimizations/img47.html for some more info
 FULL_OPTIMIZATION = "-fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os"
diff --git a/conf/distro/include/sane-toolchain.inc b/conf/distro/include/sane-toolchain.inc
index cebe77b..ac4c657 100644
--- a/conf/distro/include/sane-toolchain.inc
+++ b/conf/distro/include/sane-toolchain.inc
@@ -137,6 +137,38 @@ ENABLE_BINARY_LOCALE_GENERATION_armv7a = "0"
 #qemu has taken a dislike to armeb as well
 ENABLE_BINARY_LOCALE_GENERATION_armeb = "0"
 
+def detect_arm_abi (d):
+    	import bb
+	if bb.data.getVar("TARGET_ARCH", d, 1) in [ 'arm', 'armeb' ]:          
+		if bb.data.getVar('MACHINE',d) in ['collie','h3600', 'h3800', 'simpad', 'htcwallaby']:
+			return "oabi"
+		return "eabi"
+	else:
+		return ""
+
+def compute_os_portion_of_target_triplet (d):
+	import bb
+	if bb.data.getVar('TARGET_ARCH',d,1) in ['bfin']:
+		os_suffix = "uclinux"
+	else:
+  		os_suffix = "linux"
+
+	arm_abi	= detect_arm_abi(d)
+  	if bb.data.getVar("LIBC", d, 1) == "uclibc":
+    		libc_suffix = "uclibc"
+	else:
+		libc_suffix = "gnu"
+	
+  	if arm_abi == "eabi":
+    		abi_suffix = "eabi"
+  	if bb.data.getVar('TARGET_ARCH',d,1) in ['ppc', 'powerpc'] and \
+		bb.data.getVar('MACHINE',d) in ['calamari', 'tqm8540'] and  \
+		bb.data.getVar('DISTRO_FEATURES',d) in ['spe']:
+    		abi_suffix = "spe"
+    	target_os = "%s-%s%s" % (os_suffix, libc_suffix, abi_suffix)
+	return target_os
+
 # This is needed to get a correct PACKAGE_ARCH for packages that have PACKAGE_ARCH = ${MACHINE_ARCH}
-ARM_ABI ?= "${@['','oabi'][bb.data.getVar('MACHINE',d) in ['collie','h3600', 'h3800', 'simpad', 'htcwallaby']]}"
+ARM_ABI ?= "${@detect_arm_abi(d)}"
+TARGET_OS ?= "${@compute_os_portion_of_target_triplet(d)}"
 include conf/distro/include/sane-toolchain-${ARM_ABI}.inc

--bg08WKrSYDhXBjb5--
