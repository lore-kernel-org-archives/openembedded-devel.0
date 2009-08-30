Received: from [209.85.223.195] (helo=mail-iw0-f195.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1MhguX-00068M-T5
	for openembedded-devel@lists.openembedded.org;
	Sun, 30 Aug 2009 11:41:22 +0200
Received: by iwn33 with SMTP id 33so1376263iwn.24
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 Aug 2009 02:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=bsSoMDTjj60B9roVqy9gGhiGck1kuMkgDfjSMSM46nQ=;
	b=KSxlixBLVnbqdHyUCp8w7XZVad5B0F6kcsGoz4fQQ23vU1owtycp/CwIUMBo1b1JxB
	cHU6abJ3U9vt8w9ME4WLPSPKOIReIdraFW9Tt/mkqnYoIFbsFC/S86syWE1JSjEsGOd5
	OHWQJfIrFU1340ZgUpBkPSvrY4FJBLC7WGmHc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=UMADpjt1guraI9hQ38l9W/OXJU/PP8D7fL+mraICJZzIjT0+hWhDzUPW1zB691Q5VX
	ohVlQR8BeSs0WRwoIzTov7v7A7rSAzWiwk+H8MA2XECx2W16bRxbiZcsTGrs2lMMT2nC
	2Wz7yfagK8Rr6CuDHww2uNiLoVF+z1aWeqnV8=
Received: by 10.231.40.227 with SMTP id l35mr4358301ibe.28.1251624177167;
	Sun, 30 Aug 2009 02:22:57 -0700 (PDT)
Received: from gmail.com (adsl-71-146-29-169.dsl.pltn13.sbcglobal.net
	[71.146.29.169])
	by mx.google.com with ESMTPS id 23sm175012pzk.4.2009.08.30.02.22.55
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 30 Aug 2009 02:22:56 -0700 (PDT)
Date: Sun, 30 Aug 2009 02:22:50 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090830092250.GA16275@gmail.com>
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
X-List-Received-Date: Sun, 30 Aug 2009 09:41:22 -0000
X-Groupsio-MsgNum: 12861
Content-Type: multipart/mixed; boundary="WIyZ46R2i8wDzkSu"
Content-Disposition: inline

--WIyZ46R2i8wDzkSu
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

based upon your idea in last email. Here is something I put together
seems to work. It will need testing ofcourse

What do you think about this one ?

Thanks

-Khem

--WIyZ46R2i8wDzkSu
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
index cebe77b..7279936 100644
--- a/conf/distro/include/sane-toolchain.inc
+++ b/conf/distro/include/sane-toolchain.inc
@@ -137,6 +137,38 @@ ENABLE_BINARY_LOCALE_GENERATION_armv7a = "0"
 #qemu has taken a dislike to armeb as well
 ENABLE_BINARY_LOCALE_GENERATION_armeb = "0"
 
+python detect_arm_abi () {
+	if bb.data.getVar("TARGET_ARCH", d, 1) in [ 'arm', 'armeb' ]:          
+		if bb.data.getVar('MACHINE',d) in ['collie','h3600', 'h3800', 'simpad', 'htcwallaby']:
+			return "oabi"
+		return "eabi"
+	else
+		return ""
+}
+
+python compute_os_portion_of_target_triplet () {
+
+	if bb.data.getVar('TARGET_ARCH',d,1) in ['bfin']:
+		os_suffix = "uclinux"
+	else
+  		os_suffix = "linux"
+
+	arm_abi	= detect_arm_abi(d)
+  	if bb.data.getVar("LIBC", d, 1) == "uclibc":
+    		libc_suffix = "uclibc"
+	else
+		libc_suffix = "gnu"
+	
+  	if arm_abi == "eabi":
+    		abi_suffix = "eabi"
+  	if bb.data.getVar('TARGET_ARCH',d,1) in ['ppc', 'powerpc'] and
+	bb.data.getVar('MACHINE',d) in ['calamari', 'tqm8540'] and 
+	bb.data.getVar('DISTRO_FEATURES',d) in ['spe']:
+    		abi_suffix = "spe"
+    	target_os = "%s-%s%s" % (os_suffix, libc_suffix, abi_suffix)
+	return target_os
+}
 # This is needed to get a correct PACKAGE_ARCH for packages that have PACKAGE_ARCH = ${MACHINE_ARCH}
-ARM_ABI ?= "${@['','oabi'][bb.data.getVar('MACHINE',d) in ['collie','h3600', 'h3800', 'simpad', 'htcwallaby']]}"
+ARM_ABI ?= "${@detect_arm_abi(d,1)}"
+TARGET_OS ?= "${@compute_os_portion_of_target_triplet (d, 1)}"
 include conf/distro/include/sane-toolchain-${ARM_ABI}.inc

--WIyZ46R2i8wDzkSu--
