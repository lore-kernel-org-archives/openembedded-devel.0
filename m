Received: from [209.85.222.199] (helo=mail-pz0-f199.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1MiMfB-000744-80
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Sep 2009 08:16:17 +0200
Received: by pzk37 with SMTP id 37so3699168pzk.17
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Aug 2009 22:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=SO7Y9ms9LXEbRyyoGoTj73NspdjsKOcUJ3otM53NZww=;
	b=GJQdnuWahNH8jn4DcvIo2Q8rpyx8kFOC+pl/8dqs6X3HxqtlbhEN4jX7HPABUzDIxN
	Od9J+UHvh2YkUZO6UGoEUWFMXC5vU4nkA6gDY41f3d98s8kkGKP9oPGMZ/7iZX9vc7HC
	lx+AFqVWJV8P8RWFlSx/3wCYY5eJ48MYoegPM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=LPv+drz6p3as7elROEqTwq3asAwJwxWODY/EVu5129C8uVhgH8rsBbLE0SQMdN8OE7
	QS2T2nE+U5CMR1H6qIN4IFq/Ur4Fv0xzvidLcIMhOJyr2m/hiNck4ZHrbAJpkH6luP2b
	LuX9vqbr1SLRI8BkCxCePRGfVDns6Bus9R7N4=
Received: by 10.115.117.4 with SMTP id u4mr3929730wam.43.1251784659778;
	Mon, 31 Aug 2009 22:57:39 -0700 (PDT)
Received: from gmail.com (adsl-71-146-29-169.dsl.pltn13.sbcglobal.net
	[71.146.29.169])
	by mx.google.com with ESMTPS id l30sm64906waf.35.2009.08.31.22.57.37
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 31 Aug 2009 22:57:38 -0700 (PDT)
Date: Mon, 31 Aug 2009 22:57:31 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090901055731.GA22534@gmail.com>
References: <1251504044-2315-1-git-send-email-raj.khem@gmail.com>
	<1251620948.4215.673.camel@lenovo.internal.reciva.com>
	<20090830094809.GB26823@gmail.com>
	<200908311333.20189.marcin@juszkiewicz.com.pl>
MIME-Version: 1.0
In-Reply-To: <200908311333.20189.marcin@juszkiewicz.com.pl>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH] sane-toolchain-eglibc.inc: Set TARGET_OS?= linux-gnuspe for e500
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
X-List-Received-Date: Tue, 01 Sep 2009 06:16:18 -0000
X-Groupsio-MsgNum: 12896
Content-Type: multipart/mixed; boundary="vkogqOf2sHV7VnPd"
Content-Disposition: inline

--vkogqOf2sHV7VnPd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (31/08/09 13:33), Marcin Juszkiewicz wrote:
> What about using MACHINE_FEATURES (or CPU_FEATURES) for things like eabi/spe?
> 
> TARGET_OS = "linux-"
> if ARCH in [ppc,powerpc] and MACHINE_FEATURES.find('spe') then
> 
>   if LIBC=uclibc then
>     TARGET_OS += "uclibc"
>   fi
> 
>   TARGET_OS += "gnuspe"
> fi
> 
> Same for adding eabi:
> 
> TARGET_OS = "linux-"
> if ARCH in [arm,armeb] and MACHINE_FEATURES.find('eabi') then
> 
>   if LIBC=uclibc then
>     TARGET_OS += "uclibc"
>   fi
> 
>   TARGET_OS += "gnueabi"
> fi
> 
> spe/eabi can be added to MACHINE_FEATURES in conf/machine/include/tune-* files 
> and distros can choose do they support it or not by DISTRO_FEATURES (examples 
> needs to be changed then to use COMBINED_FEATURES variable). This way no one 
> has to change XY files just because he has new board with ppc500v2 core, we do 
> not have to remember about armv4 devices which are not capable of EABI with 
> gcc 4.3.x and older (but if they will support EABI in future we just change 
> tune-strongarm.inc file).

Attached implementation is based on this suggestion. I have not done
wholesale change to distro confs only for micro and minimal. 

I tested this patch with


for targ in `ls openembedded/conf/machine/*.conf|cut -d '/' -f 4|cut -d
'.' -f 1`; do echo -n "$targ "; MACHINE=$targ DISTRO=minimal bitbake -e
|grep TARGET_OS=\"; done

and all machine confs were giving correct values for TARGET_OS
also I repeated same test with DISTRO=minimal-uclibc 

Comments ?

Thanks

-Khem


--vkogqOf2sHV7VnPd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=diff

diff --git a/classes/siteinfo.bbclass b/classes/siteinfo.bbclass
index e51d7ab..2ecf76a 100644
--- a/classes/siteinfo.bbclass
+++ b/classes/siteinfo.bbclass
@@ -22,21 +22,29 @@ def get_siteinfo_list(d):
 
        targetinfo = {\
                "armeb-linux":             "endian-big bit-32 common-linux common-glibc arm-common",\
+               "armeb-linux-gnu":         "endian-big bit-32 common-linux common-glibc arm-common",\
                "armeb-linux-gnueabi":     "endian-big bit-32 common-linux common-glibc arm-common armeb-linux",\
                "armeb-linux-uclibc":      "endian-big bit-32 common-linux common-uclibc arm-common",\
                "armeb-linux-uclibcgnueabi": "endian-big bit-32 common-linux common-uclibc arm-common armeb-linux-uclibc",\
+               "armeb-linux-uclibceabi":  "endian-big bit-32 common-linux common-uclibc arm-common armeb-linux-uclibc",\
                "arm-darwin":              "endian-little bit-32 common-darwin",\
                "arm-darwin9":             "endian-little bit-32 common-darwin",\
                "arm-linux":               "endian-little bit-32 common-linux common-glibc arm-common",\
+               "arm-linux-gnu":           "endian-little bit-32 common-linux common-glibc arm-common",\
                "arm-linux-gnueabi":       "endian-little bit-32 common-linux common-glibc arm-common arm-linux",\
                "arm-linux-uclibc":        "endian-little bit-32 common-linux common-uclibc arm-common",\
                "arm-linux-uclibcgnueabi": "endian-little bit-32 common-linux common-uclibc arm-common arm-linux-uclibc",\
+               "arm-linux-uclibceabi":    "endian-little bit-32 common-linux common-uclibc arm-common arm-linux-uclibc",\
                "avr32-linux-uclibc":      "endian-big bit-32 common-linux common-uclibc avr32-common",\
                "bfin-uclinux-uclibc":     "endian-little bit-32 common-uclibc bfin-common",\
                "i386-linux":              "endian-little bit-32 common-linux common-glibc ix86-common",\
+               "i386-linux-gnu":          "endian-little bit-32 common-linux common-glibc ix86-common",\
                "i486-linux":              "endian-little bit-32 common-linux common-glibc ix86-common",\
+               "i486-linux-gnu":          "endian-little bit-32 common-linux common-glibc ix86-common",\
                "i586-linux":              "endian-little bit-32 common-linux common-glibc ix86-common",\
+               "i586-linux-gnu":          "endian-little bit-32 common-linux common-glibc ix86-common",\
                "i686-linux":              "endian-little bit-32 common-linux common-glibc ix86-common",\
+               "i686-linux-gnu":          "endian-little bit-32 common-linux common-glibc ix86-common",\
                "i386-linux-uclibc":       "endian-little bit-32 common-linux common-uclibc ix86-common",\
                "i486-linux-uclibc":       "endian-little bit-32 common-linux common-uclibc ix86-common",\
                "i586-linux-uclibc":       "endian-little bit-32 common-linux common-uclibc ix86-common",\
@@ -50,22 +58,34 @@ def get_siteinfo_list(d):
                "i586-mingw32":            "endian-little bit-32 common-mingw ix86-common",\
                "i686-mingw32":            "endian-little bit-32 common-mingw ix86-common",\
 	       "ia64-linux":		  "endian-little bit-64 common-linux common-glibc",\
+	       "ia64-linux-gnu":	  "endian-little bit-64 common-linux common-glibc",\
                "mipsel-linux":            "endian-little bit-32 common-linux common-glibc",\
+               "mipsel-linux-gnu":        "endian-little bit-32 common-linux common-glibc",\
                "mipsel-linux-uclibc":     "endian-little bit-32 common-linux common-uclibc",\
                "mips-linux":              "endian-big bit-32 common-linux common-glibc",\
+               "mips-linux-gnu":          "endian-big bit-32 common-linux common-glibc",\
                "mips-linux-uclibc":       "endian-big bit-32 common-linux common-uclibc",\
                "powerpc-darwin":          "endian-big bit-32 common-darwin",\
                "ppc-linux":               "endian-big bit-32 common-linux common-glibc powerpc-common",\ 
+               "ppc-linux-gnu":           "endian-big bit-32 common-linux common-glibc powerpc-common",\ 
                "ppc64-linux":             "endian-big bit-64 common-linux common-glibc powerpc-common",\ 
+               "ppc64-linux-gnu":         "endian-big bit-64 common-linux common-glibc powerpc-common",\ 
 	       "powerpc-linux":           "endian-big bit-32 common-linux common-glibc powerpc-common",\
+	       "powerpc-linux-gnu":       "endian-big bit-32 common-linux common-glibc powerpc-common",\
 	       "powerpc-linux-gnuspe":    "endian-big bit-32 common-linux common-glibc powerpc-common",\
                "powerpc-linux-uclibc":    "endian-big bit-32 common-linux common-uclibc powerpc-common",\
+               "powerpc-linux-uclibcspe": "endian-big bit-32 common-linux common-uclibc powerpc-common",\
                "sh3-linux":               "endian-little bit-32 common-linux common-glibc sh-common",\
+               "sh3-linux-gnu":           "endian-little bit-32 common-linux common-glibc sh-common",\
                "sh4-linux":               "endian-little bit-32 common-linux common-glibc sh-common",\
+               "sh4-linux-gnu":           "endian-little bit-32 common-linux common-glibc sh-common",\
                "sh4-linux-uclibc":        "endian-little bit-32 common-linux common-uclibc sh-common",\
                "sparc-linux":             "endian-big bit-32 common-linux common-glibc",\
+               "sparc-linux-gnu":         "endian-big bit-32 common-linux common-glibc",\
                "viac3-linux":             "endian-little bit-32 common-linux common-glibc ix86-common",\
+               "viac3-linux-gnu":         "endian-little bit-32 common-linux common-glibc ix86-common",\
                "x86_64-linux":            "endian-little bit-64 common-linux common-glibc",\
+               "x86_64-linux-gnu":        "endian-little bit-64 common-linux common-glibc",\
                "x86_64-linux-uclibc":     "endian-little bit-64 common-linux common-uclibc"}
        if target in targetinfo:
                info = targetinfo[target].split()
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
index cebe77b..fa7ef79 100644
--- a/conf/distro/include/sane-toolchain.inc
+++ b/conf/distro/include/sane-toolchain.inc
@@ -136,7 +136,44 @@ ENABLE_BINARY_LOCALE_GENERATION_armv7a = "0"
 
 #qemu has taken a dislike to armeb as well
 ENABLE_BINARY_LOCALE_GENERATION_armeb = "0"
+def detect_arm_abi (d):
+    	import bb
+	if bb.data.getVar('MACHINE_FEATURES',d) is None:
+		return ""
+	if bb.data.getVar("TARGET_ARCH", d, 1) in [ 'arm', 'armeb' ]:          
+		if 'eabi' in bb.data.getVar('MACHINE_FEATURES',d).split():
+			return "eabi"
+		return "oabi"
+	return ""
+
+def compute_os_portion_of_target_triplet (d):
+	import bb
+  	if bb.data.getVar("LIBC", d, 1) == "uclibc":
+    		libc_suffix = "uclibc"
+	else:
+		libc_suffix = "gnu"
+	
+	if bb.data.getVar('TARGET_ARCH',d,1) in ['bfin']:
+		if libc_suffix == "gnu":
+			bb.fatal("bfin is not supported on glibc/eglibc. Please choose uclibc")
+		else:
+			os_suffix = "uclinux"
+	else:
+  		os_suffix = "linux"
+	if bb.data.getVar('MACHINE_FEATURES',d) is not None:
+		if 'eabi' in bb.data.getVar('MACHINE_FEATURES',d).split():
+			abi_suffix = "eabi"
+		elif 'spe' in bb.data.getVar('MACHINE_FEATURES',d).split():
+			abi_suffix = "spe"
+		else:
+			abi_suffix = ""
+	else:
+		bb.note("MACHINE_FEATURES is not set abi suffix not set")
+		abi_suffix = ""
+    	target_os = "%s-%s%s" % (os_suffix, libc_suffix, abi_suffix)
+	return target_os
 
 # This is needed to get a correct PACKAGE_ARCH for packages that have PACKAGE_ARCH = ${MACHINE_ARCH}
-ARM_ABI ?= "${@['','oabi'][bb.data.getVar('MACHINE',d) in ['collie','h3600', 'h3800', 'simpad', 'htcwallaby']]}"
+ARM_ABI = "${@detect_arm_abi(d)}"
+TARGET_OS = "${@compute_os_portion_of_target_triplet(d)}"
 include conf/distro/include/sane-toolchain-${ARM_ABI}.inc
diff --git a/conf/distro/micro.conf b/conf/distro/micro.conf
index 2d45425..21818d1 100644
--- a/conf/distro/micro.conf
+++ b/conf/distro/micro.conf
@@ -16,16 +16,10 @@ DISTRO_NAME = "micro"
 DISTRO_VERSION = "${SRCDATE}"
 
 #############################################################################
-# TARGET OS
-#############################################################################
-# Linux
-TARGET_OS = "linux"
-
-#############################################################################
 # DISTRO FEATURE SELECTION
 #############################################################################
 # No features selected
-DISTRO_FEATURES = ""
+DISTRO_FEATURES = "eabi spe"
 
 #############################################################################
 # LIBRARY NAMES
diff --git a/conf/distro/minimal.conf b/conf/distro/minimal.conf
index fa2a926..35da909 100644
--- a/conf/distro/minimal.conf
+++ b/conf/distro/minimal.conf
@@ -25,6 +25,8 @@ DISTRO_CHECK := "${@bb.data.getVar("DISTRO_VERSION",d,1) or bb.fatal('Remove thi
 DISTRO_BLUETOOTH_MANAGER = "bluez4"
 # We want images supporting the following features (for task-base)
 DISTRO_FEATURES = "nfs smbfs wifi ppp alsa ext2 vfat pcmcia usbgadget usbhost pci"
+# Following features are for ARM and E500 based machines
+DISTRO_FEATURES += "eabi spe"
 
 #############################################################################
 # LIBRARY NAMES
diff --git a/conf/machine/beagleboard.conf b/conf/machine/beagleboard.conf
index 69cdec6..831d742 100644
--- a/conf/machine/beagleboard.conf
+++ b/conf/machine/beagleboard.conf
@@ -13,6 +13,8 @@ XSERVER = "xserver-xorg \
 # Only has DVI connector for external screen
 GUI_MACHINE_CLASS = "bigscreen"
 
+MACHINE_FEATURES = "kernel26 screen apm usbgadget usbhost vfat alsa"
+
 require conf/machine/include/omap3.inc
 
 IMAGE_FSTYPES += "tar.bz2 ubi"
@@ -43,4 +45,3 @@ PREFERRED_VERSION_u-boot = "git"
 
 MACHINE_EXTRA_RRECOMMENDS = " omap3-sgx-modules "
 # and sdio
-MACHINE_FEATURES = "kernel26 screen apm usbgadget usbhost vfat alsa"
diff --git a/conf/machine/include/ixp4xx.inc b/conf/machine/include/ixp4xx.inc
index 192cbb1..cf7f0dd 100644
--- a/conf/machine/include/ixp4xx.inc
+++ b/conf/machine/include/ixp4xx.inc
@@ -22,7 +22,6 @@ IMAGE_FSTYPES ?= "jffs2 tar.gz"
 EXTRA_IMAGECMD_jffs2 = "--pad --eraseblock=0x20000 -n"
 
 require conf/machine/include/tune-xscale.inc
-require conf/machine/include/tune-thumb.inc
 
 #-------------------------------------------------------------------------------
 # Board defaults
diff --git a/conf/machine/include/tune-arm1136-novfp.inc b/conf/machine/include/tune-arm1136-novfp.inc
index e1f7945..9af5294 100644
--- a/conf/machine/include/tune-arm1136-novfp.inc
+++ b/conf/machine/include/tune-arm1136-novfp.inc
@@ -5,6 +5,7 @@ TARGET_CC_ARCH = "-march=armv6j -mtune=arm1136jf-s"
 FEED_ARCH = "armv6-novfp"
 BASE_PACKAGE_ARCH = "armv6-novfp"
 PACKAGE_EXTRA_ARCHS += "armv4 armv4t armv5te armv6-novfp"
+MACHINE_FEATURES += "eabi"
 
 # Include tune file for thumb support, it defaults to off so DISTROs can turn it on if they wish
 require conf/machine/include/tune-thumb.inc
diff --git a/conf/machine/include/tune-arm1136jf-s.inc b/conf/machine/include/tune-arm1136jf-s.inc
index c532b9c..65a3afc 100644
--- a/conf/machine/include/tune-arm1136jf-s.inc
+++ b/conf/machine/include/tune-arm1136jf-s.inc
@@ -2,6 +2,7 @@ TARGET_CC_ARCH = "-march=armv6j -mtune=arm1136jf-s -mfpu=vfp -mfloat-abi=softfp"
 FEED_ARCH = "armv6"
 BASE_PACKAGE_ARCH = "armv6"
 PACKAGE_EXTRA_ARCHS += "armv4 armv4t armv5te armv6"
+MACHINE_FEATURES += "eabi"
 
 # Include tune file for thumb support, it defaults to off so DISTROs can turn it on if they wish
 require conf/machine/include/tune-thumb.inc
diff --git a/conf/machine/include/tune-arm1176jzf-s.inc b/conf/machine/include/tune-arm1176jzf-s.inc
index b7c5291..87f60da 100644
--- a/conf/machine/include/tune-arm1176jzf-s.inc
+++ b/conf/machine/include/tune-arm1176jzf-s.inc
@@ -2,6 +2,6 @@ TARGET_CC_ARCH = "-march=armv6j -mtune=arm1176jzf-s -mfpu=vfp -mfloat-abi=softfp
 FEED_ARCH = "armv6"
 BASE_PACKAGE_ARCH = "armv6"
 PACKAGE_EXTRA_ARCHS += "armv4 armv4t armv5te armv6"
-
+MACHINE_FEATURES += "eabi"
 # Include tune file for thumb support, it defaults to off so DISTROs can turn it on if they wish
 require conf/machine/include/tune-thumb.inc
diff --git a/conf/machine/include/tune-arm920t.inc b/conf/machine/include/tune-arm920t.inc
index 5a373e9..70de841 100644
--- a/conf/machine/include/tune-arm920t.inc
+++ b/conf/machine/include/tune-arm920t.inc
@@ -2,6 +2,7 @@ FEED_ARCH = "armv4t"
 BASE_PACKAGE_ARCH = "armv4t" 
 TARGET_CC_ARCH = "-march=armv4t -mtune=arm920t"
 PACKAGE_EXTRA_ARCHS += "armv4 armv4t"
+MACHINE_FEATURES += "eabi"
 
 # Include tune file for thumb support, it defaults to off so DISTROs can turn it on if they wish
 require conf/machine/include/tune-thumb.inc
diff --git a/conf/machine/include/tune-arm926ejs.inc b/conf/machine/include/tune-arm926ejs.inc
index f6f5064..12f7b1c 100644
--- a/conf/machine/include/tune-arm926ejs.inc
+++ b/conf/machine/include/tune-arm926ejs.inc
@@ -5,6 +5,7 @@ PACKAGE_EXTRA_ARCHS += "armv4 armv4t armv5te"
 # For gcc 4.x you need:
 TARGET_CC_ARCH = "-march=armv5te -mtune=arm926ej-s"
 BASE_PACKAGE_ARCH = "armv5te"
+MACHINE_FEATURES += "eabi"
 
 # Include tune file for thumb support, it defaults to off so DISTROs can turn it on if they wish
 require conf/machine/include/tune-thumb.inc
diff --git a/conf/machine/include/tune-armv7.inc b/conf/machine/include/tune-armv7.inc
index 05ec3da..9f36175 100644
--- a/conf/machine/include/tune-armv7.inc
+++ b/conf/machine/include/tune-armv7.inc
@@ -5,6 +5,7 @@ TARGET_CC_ARCH = "-march=armv7 -mfpu=vfp -mfloat-abi=softfp"
 FEED_ARCH = "armv7"
 PACKAGE_EXTRA_ARCHS += "armv4 armv4t armv5te armv6 armv7"
 BASE_PACKAGE_ARCH = "armv7"
+MACHINE_FEATURES += "eabi"
 
 # Include tune file for thumb support, it defaults to off so DISTROs can turn it on if they wish
 require conf/machine/include/tune-thumb.inc
diff --git a/conf/machine/include/tune-cortexa8.inc b/conf/machine/include/tune-cortexa8.inc
index a2ce7de..2e022ca 100644
--- a/conf/machine/include/tune-cortexa8.inc
+++ b/conf/machine/include/tune-cortexa8.inc
@@ -7,3 +7,4 @@ TARGET_CC_ARCH = "-march=armv7-a -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp"
 FEED_ARCH = "armv7a"
 PACKAGE_EXTRA_ARCHS += "armv4 armv4t armv5te armv6 armv7 armv7a"
 BASE_PACKAGE_ARCH = "armv7a"
+MACHINE_FEATURES += "eabi"
diff --git a/conf/machine/include/tune-cortexa9.inc b/conf/machine/include/tune-cortexa9.inc
index a12494f..4005042 100644
--- a/conf/machine/include/tune-cortexa9.inc
+++ b/conf/machine/include/tune-cortexa9.inc
@@ -7,3 +7,4 @@ TARGET_CC_ARCH = "-march=armv7-a -mtune=cortex-a9 -mfpu=neon -mfloat-abi=softfp"
 FEED_ARCH = "armv7a"
 PACKAGE_EXTRA_ARCHS += "armv4 armv4t armv5te armv6 armv7 armv7a"
 BASE_PACKAGE_ARCH = "armv7a"
+MACHINE_FEATURES += "eabi"
diff --git a/conf/machine/include/tune-cortexm1.inc b/conf/machine/include/tune-cortexm1.inc
index 6c4a70a..b867112 100644
--- a/conf/machine/include/tune-cortexm1.inc
+++ b/conf/machine/include/tune-cortexm1.inc
@@ -1,3 +1,4 @@
 TARGET_CC_ARCH = "-march=armv7 -mtune=cortex-m1 -mfpu=vfp -mfloat-abi=softfp"
 FEED_ARCH = "armv6"
 BASE_PACKAGE_ARCH = "armv6"
+MACHINE_FEATURES += "eabi"
diff --git a/conf/machine/include/tune-cortexm3.inc b/conf/machine/include/tune-cortexm3.inc
index 6da9aee..679f0d1 100644
--- a/conf/machine/include/tune-cortexm3.inc
+++ b/conf/machine/include/tune-cortexm3.inc
@@ -2,3 +2,4 @@
 TARGET_CC_ARCH = "-march=armv7-m -mtune=cortex-m3 -mfpu=vfp -mfloat-abi=softfp"
 FEED_ARCH = "armv7"
 BASE_PACKAGE_ARCH = "armv7"
+MACHINE_FEATURES += "eabi"
diff --git a/conf/machine/include/tune-cortexr4.inc b/conf/machine/include/tune-cortexr4.inc
index b8bb7f5..943548c 100644
--- a/conf/machine/include/tune-cortexr4.inc
+++ b/conf/machine/include/tune-cortexr4.inc
@@ -2,3 +2,4 @@
 TARGET_CC_ARCH = "-march=armv7-r -mtune=cortex-r4 -mfpu=vfp -mfloat-abi=softfp"
 FEED_ARCH = "armv7"
 BASE_PACKAGE_ARCH = "armv7"
+MACHINE_FEATURES += "eabi"
diff --git a/conf/machine/include/tune-ppce300c2.inc b/conf/machine/include/tune-ppce300c2.inc
index 1524c7c..f2a2993 100644
--- a/conf/machine/include/tune-ppce300c2.inc
+++ b/conf/machine/include/tune-ppce300c2.inc
@@ -2,3 +2,4 @@ TARGET_CC_ARCH = "-mcpu=e300c2"
 BASE_PACKAGE_ARCH = "ppce300c2"
 FEED_ARCH = "ppce300c2"
 PACKAGE_EXTRA_ARCHS += "ppce300c2"
+MACHINE_FEATURES += "spe"
diff --git a/conf/machine/include/tune-ppce300c3.inc b/conf/machine/include/tune-ppce300c3.inc
index 467c4cc..3fc094b 100644
--- a/conf/machine/include/tune-ppce300c3.inc
+++ b/conf/machine/include/tune-ppce300c3.inc
@@ -2,3 +2,4 @@ TARGET_CC_ARCH = "-mcpu=e300c3"
 BASE_PACKAGE_ARCH = "ppce300c3"
 FEED_ARCH = "ppce300c3"
 PACKAGE_EXTRA_ARCHS += "ppce300c3"
+MACHINE_FEATURES += "spe"
diff --git a/conf/machine/include/tune-ppce500.inc b/conf/machine/include/tune-ppce500.inc
index 44f8742..1f89a12 100644
--- a/conf/machine/include/tune-ppce500.inc
+++ b/conf/machine/include/tune-ppce500.inc
@@ -2,3 +2,4 @@ TARGET_CC_ARCH = "-mcpu=8540"
 BASE_PACKAGE_ARCH = "ppce500"
 FEED_ARCH = "ppce500"
 PACKAGE_EXTRA_ARCHS += "ppce500"
+MACHINE_FEATURES += "spe"
diff --git a/conf/machine/include/tune-ppce500v2.inc b/conf/machine/include/tune-ppce500v2.inc
index 73d8e92..b6d92cb 100644
--- a/conf/machine/include/tune-ppce500v2.inc
+++ b/conf/machine/include/tune-ppce500v2.inc
@@ -2,3 +2,4 @@ TARGET_CC_ARCH = "-mcpu=8548 -mspe=yes -mabi=spe -mhard-float -mfloat-gprs=doubl
 BASE_PACKAGE_ARCH = "ppce500v2"
 FEED_ARCH = "ppce500v2"
 PACKAGE_EXTRA_ARCHS += "ppce500v2"
+MACHINE_FEATURES += "spe"
diff --git a/conf/machine/include/tune-xscale.inc b/conf/machine/include/tune-xscale.inc
index 79d22bc..d6d1a90 100644
--- a/conf/machine/include/tune-xscale.inc
+++ b/conf/machine/include/tune-xscale.inc
@@ -4,7 +4,7 @@ TARGET_CC_ARCH = "-march=armv5te -mtune=xscale"
 TARGET_CC_KERNEL_ARCH = "-march=armv5te -mtune=xscale"
 PACKAGE_EXTRA_ARCHS += "${@['armv4b armv4tb armv5teb', 'armv4 armv4t armv5te'][bb.data.getVar('SITEINFO_ENDIANESS', d, 1) == 'le']}"
 BASE_PACKAGE_ARCH = "${@['armv5teb', 'armv5te'][bb.data.getVar('SITEINFO_ENDIANESS', d, 1) == 'le']}"
-
+MACHINE_FEATURES += "eabi"
 # Include tune file for thumb support, it defaults to off so DISTROs can turn it on if they wish
 require conf/machine/include/tune-thumb.inc
 
diff --git a/conf/machine/looxc550.conf b/conf/machine/looxc550.conf
index 88a1be3..3e11a51 100644
--- a/conf/machine/looxc550.conf
+++ b/conf/machine/looxc550.conf
@@ -7,7 +7,6 @@
 #
 TARGET_ARCH = "arm"
 
-require conf/machine/include/tune-xscale.inc
 
 ROOT_FLASH_SIZE = "32"
 VOLATILE_STORAGE_SIZE = "64"
@@ -32,4 +31,5 @@ module_autoload_g_ether = "g_ether"
 SERIAL_CONSOLE = "115200 ttyS0 vt100"
 USE_VT = "0"
 
+require conf/machine/include/tune-xscale.inc
 require conf/machine/include/LAB-settings.inc
diff --git a/recipes/openssl/openssl.inc b/recipes/openssl/openssl.inc
index 3972cd3..c4707fd 100644
--- a/recipes/openssl/openssl.inc
+++ b/recipes/openssl/openssl.inc
@@ -32,6 +32,9 @@ do_configure () {
 	if [ "x$os" = "xlinux-uclibc" ]; then
 		os=linux
 	fi
+	if [ "x$os" = "xlinux-uclibceabi" ]; then
+		os=linux
+	fi
 	target="$os-${HOST_ARCH}"
 	case $target in
 	linux-arm)
diff --git a/recipes/uclibc/uclibc.inc b/recipes/uclibc/uclibc.inc
index 2ed7d82..88f62fa 100644
--- a/recipes/uclibc/uclibc.inc
+++ b/recipes/uclibc/uclibc.inc
@@ -146,12 +146,13 @@ do_configure() {
 
    	sed -i -e '/CONFIG_ARM_EABI/d' ${S}/.config
 
-        if [ "${TARGET_OS}" = "linux-gnueabi" -o  "${TARGET_OS}" = "linux-uclibcgnueabi" ]; then
-       		echo "CONFIG_ARM_EABI=y"                >> ${S}/.config
-	else
-		echo "# CONFIG_ARM_EABI is not set"     >> ${S}/.config
+	if [ `echo ${TARGET_ARCH} | grep -e '^arm'` ]; then
+		if [ `echo ${TARGET_OS} | grep -e 'eabi$'` ]; then
+       			echo "CONFIG_ARM_EABI=y"                >> ${S}/.config
+		else
+			echo "# CONFIG_ARM_EABI is not set"     >> ${S}/.config
+		fi
 	fi
-
 	yes '' | oe_runmake oldconfig
 }
 

--vkogqOf2sHV7VnPd--
