Received: from [209.85.146.181] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Micjs-00032A-OX
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Sep 2009 01:26:14 +0200
Received: by wa-out-1112.google.com with SMTP id m34so56426wag.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Sep 2009 16:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=Mz1oIfj4LLxfvmyK2yW+U1zVNNZM0ULWQYCGOTG6YrI=;
	b=mlaQZpv9p67cmAvW9lk5me6+wA7gqNy78exARi5eS88W+merR4ICvYSYwmVr863QaD
	z568u7B/HJnBj1s4hnYI/uqDB9VrCczMajGLsZYiaw5Voc9ArlIqc9+Sutk9xVuv/DsC
	7iWBnjijpdEmaHEJW2amN8QFTPXb9zRZIYons=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=uxcIDi0xD3OxXML68PI5uZdO3FLOxqU+TkwsQApXtAEXIyzR5mingfK6Cd7Zz6U1ge
	gKxLKiaw/gBFnOoHa8oKCcbWMDKXHb0XcERnAGQEpdHHJ2wRB++jcAXy+QFeHyWiC9JM
	1orQWxddJ8iDkVYseuzjNUtwhAWiTUHkORdWg=
Received: by 10.114.252.30 with SMTP id z30mr2931278wah.76.1251846452554;
	Tue, 01 Sep 2009 16:07:32 -0700 (PDT)
Received: from gmail.com (adsl-71-146-29-169.dsl.pltn13.sbcglobal.net
	[71.146.29.169])
	by mx.google.com with ESMTPS id m31sm1311790wag.62.2009.09.01.16.07.29
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 01 Sep 2009 16:07:31 -0700 (PDT)
Date: Tue, 1 Sep 2009 16:07:22 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090901230722.GA25864@gmail.com>
References: <1251504044-2315-1-git-send-email-raj.khem@gmail.com>
	<1251620948.4215.673.camel@lenovo.internal.reciva.com>
	<20090830094809.GB26823@gmail.com>
	<200908311333.20189.marcin@juszkiewicz.com.pl>
	<20090901055731.GA22534@gmail.com>
	<57768.87.139.24.177.1251793302.squirrel@home.opfer.tk>
	<20090901153102.GA12420@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20090901153102.GA12420@gmail.com>
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
X-List-Received-Date: Tue, 01 Sep 2009 23:26:16 -0000
X-Groupsio-MsgNum: 12912
Content-Type: multipart/mixed; boundary="LZvS9be/3tNcYl/X"
Content-Disposition: inline

--LZvS9be/3tNcYl/X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (01/09/09 08:31), Khem Raj wrote:
> On (01/09/09 10:21), Dirk Opfer wrote:
> > >
> > > Attached implementation is based on this suggestion. I have not done
> > > wholesale change to distro confs only for micro and minimal.
> > >
> > > I tested this patch with
> > >
> > >
> > > for targ in `ls openembedded/conf/machine/*.conf|cut -d '/' -f 4|cut -d
> > > '.' -f 1`; do echo -n "$targ "; MACHINE=$targ DISTRO=minimal bitbake -e
> > > |grep TARGET_OS=\"; done
> > >
> > > and all machine confs were giving correct values for TARGET_OS
> > > also I repeated same test with DISTRO=minimal-uclibc
> > >
> > > Comments ?
> > 
> > e300 doesn't implement the signal processing engine (SPE).
> > Only e500v1 and e500v2 supports these instructions.
> 
> yes thats right. Thanks for pointing it out.
> -Khem


As discussed further on IRC here is another implementation which adds
eabi to be a DISTRO_FEATURE and depends on BASE_PACKAGE_ARCH to find
the machine arch which can support eabi. For SPE there is no choice
left to distro. 

Sample change for distro I have done for minimal and micro. We might
create new distro for oabi like micro-oabi and minimal-oabi similarily 
a uclibc variant if needed. For now the micro and minimal distros ask
for eabi feature.

Another change it has it changing linux-uclibcgnueabi to
linux-uclibceabi and -linux to -linux-gnu

I have built a console image successfully with this

Comments ?

Thanks

-Khem



--LZvS9be/3tNcYl/X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=diff

diff --git a/classes/insane.bbclass b/classes/insane.bbclass
index 606270d..c41b84a 100644
--- a/classes/insane.bbclass
+++ b/classes/insane.bbclass
@@ -73,7 +73,7 @@ def package_qa_get_machine_dict():
                         "arm" :       (40,     0,    0,          True,          True),
                         "armeb" :     (40,     0,    0,          False,         True),
                       },
-            "linux-uclibcgnueabi" : {
+            "linux-uclibceabi" : {
                         "arm" :       (40,     0,    0,          True,          True),
                         "armeb" :     (40,     0,    0,          False,         True),
                       },
diff --git a/classes/qmake_base.bbclass b/classes/qmake_base.bbclass
index 5eccfa4..50d8bb5 100644
--- a/classes/qmake_base.bbclass
+++ b/classes/qmake_base.bbclass
@@ -33,7 +33,7 @@ oe_qmake_mkspecs () {
 
 qmake_base_do_configure() {
 	case ${QMAKESPEC} in
-	*linux-oe-g++|*linux-uclibc-oe-g++|*linux-gnueabi-oe-g++|*linux-uclibcgnueabi-oe-g++)
+	*linux-oe-g++|*linux-uclibc-oe-g++|*linux-gnueabi-oe-g++|*linux-uclibceabi-oe-g++)
 		;;
 	*-oe-g++)
 		die Unsupported target ${TARGET_OS} for oe-g++ qmake spec
diff --git a/classes/siteinfo.bbclass b/classes/siteinfo.bbclass
index e51d7ab..2bacd69 100644
--- a/classes/siteinfo.bbclass
+++ b/classes/siteinfo.bbclass
@@ -22,21 +22,27 @@ def get_siteinfo_list(d):
 
        targetinfo = {\
                "armeb-linux":             "endian-big bit-32 common-linux common-glibc arm-common",\
+               "armeb-linux-gnu":         "endian-big bit-32 common-linux common-glibc arm-common",\
                "armeb-linux-gnueabi":     "endian-big bit-32 common-linux common-glibc arm-common armeb-linux",\
                "armeb-linux-uclibc":      "endian-big bit-32 common-linux common-uclibc arm-common",\
-               "armeb-linux-uclibcgnueabi": "endian-big bit-32 common-linux common-uclibc arm-common armeb-linux-uclibc",\
+               "armeb-linux-uclibceabi":  "endian-big bit-32 common-linux common-uclibc arm-common armeb-linux-uclibc",\
                "arm-darwin":              "endian-little bit-32 common-darwin",\
                "arm-darwin9":             "endian-little bit-32 common-darwin",\
                "arm-linux":               "endian-little bit-32 common-linux common-glibc arm-common",\
+               "arm-linux-gnu":           "endian-little bit-32 common-linux common-glibc arm-common",\
                "arm-linux-gnueabi":       "endian-little bit-32 common-linux common-glibc arm-common arm-linux",\
                "arm-linux-uclibc":        "endian-little bit-32 common-linux common-uclibc arm-common",\
-               "arm-linux-uclibcgnueabi": "endian-little bit-32 common-linux common-uclibc arm-common arm-linux-uclibc",\
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
@@ -50,22 +56,34 @@ def get_siteinfo_list(d):
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
index cebe77b..9375e1d 100644
--- a/conf/distro/include/sane-toolchain.inc
+++ b/conf/distro/include/sane-toolchain.inc
@@ -136,7 +136,58 @@ ENABLE_BINARY_LOCALE_GENERATION_armv7a = "0"
 
 #qemu has taken a dislike to armeb as well
 ENABLE_BINARY_LOCALE_GENERATION_armeb = "0"
+def detect_arm_abi (d):
+    	import bb
+	if bb.data.getVar('DISTRO_FEATURES',d) is None:
+		if bb.data.getVar('TARGET_ARCH', d, 1) in [ 'arm', 'armeb' ]:
+			return "oabi"
+		else:
+			return ""
+	if bb.data.getVar('TARGET_ARCH', d, 1) in [ 'arm', 'armeb' ]:          
+		if 'eabi' in bb.data.getVar('DISTRO_FEATURES',d).split():
+			return "eabi"
+		return "oabi"
+	return ""
+
+def compute_os_portion_of_target_triplet (d):
+	import bb
+	arm_eabi_supporting_arches = "armv6 armv6-novfp armv5te \
+       	iwmmxt armv7a armv7 armv6 armv5teb armv5te armv4t"
+	ppc_spe_supporting_arches = "ppce500v2 ppce500"
+
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
+	bparch = bb.data.getVar('BASE_PACKAGE_ARCH', d)
+
+	if bb.data.getVar('DISTRO_FEATURES',d) is not None and \
+	bparch is not None:
+		if 'eabi' in bb.data.getVar('DISTRO_FEATURES',d).split() and \
+		bb.data.getVar('TARGET_ARCH', d, 1) in [ 'arm', 'armeb' ]:
+			if bparch not in \
+			arm_eabi_supporting_arches.split():
+				bb.fatal("DISTRO requested EABI but selected machine does not support EABI")
+			else:
+				abi_suffix = "eabi"
+		elif bparch in ppc_spe_supporting_arches.split():
+			abi_suffix = "spe"
+		else:
+			abi_suffix = ""
+	else:
+		bb.note("DISTRO_FEATURES is not set abi suffix not set")
+		abi_suffix = ""
+	return os_suffix + "-" + libc_suffix + abi_suffix
 
 # This is needed to get a correct PACKAGE_ARCH for packages that have PACKAGE_ARCH = ${MACHINE_ARCH}
-ARM_ABI ?= "${@['','oabi'][bb.data.getVar('MACHINE',d) in ['collie','h3600', 'h3800', 'simpad', 'htcwallaby']]}"
+ARM_ABI = "${@detect_arm_abi(d)}"
+TARGET_OS = "${@compute_os_portion_of_target_triplet(d)}"
 include conf/distro/include/sane-toolchain-${ARM_ABI}.inc
diff --git a/conf/distro/micro.conf b/conf/distro/micro.conf
index 2d45425..ed3be5e 100644
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
+DISTRO_FEATURES = "eabi"
 
 #############################################################################
 # LIBRARY NAMES
diff --git a/conf/distro/minimal.conf b/conf/distro/minimal.conf
index fa2a926..edaf5cf 100644
--- a/conf/distro/minimal.conf
+++ b/conf/distro/minimal.conf
@@ -25,6 +25,8 @@ DISTRO_CHECK := "${@bb.data.getVar("DISTRO_VERSION",d,1) or bb.fatal('Remove thi
 DISTRO_BLUETOOTH_MANAGER = "bluez4"
 # We want images supporting the following features (for task-base)
 DISTRO_FEATURES = "nfs smbfs wifi ppp alsa ext2 vfat pcmcia usbgadget usbhost pci"
+# Following features are for ARM and E500 based machines
+DISTRO_FEATURES += "eabi"
 
 #############################################################################
 # LIBRARY NAMES
diff --git a/conf/machine/include/tune-strongarm.inc b/conf/machine/include/tune-strongarm.inc
index 5745c36..2a583fe 100644
--- a/conf/machine/include/tune-strongarm.inc
+++ b/conf/machine/include/tune-strongarm.inc
@@ -5,5 +5,5 @@
 ARM_ABI = "oabi"
 TARGET_CC_ARCH = "-march=armv4 -mtune=strongarm"
 FEED_ARCH = "arm-oabi"
-
+PACKAGE_BASE_ARCH = "armv4" 
 PACKAGE_EXTRA_ARCHS += "armv4 "
diff --git a/conf/machine/include/tune-xscale.inc b/conf/machine/include/tune-xscale.inc
index 79d22bc..7fa6447 100644
--- a/conf/machine/include/tune-xscale.inc
+++ b/conf/machine/include/tune-xscale.inc
@@ -3,7 +3,7 @@ FEED_ARCH =  "${@['armv5teb', 'armv5te'][bb.data.getVar('SITEINFO_ENDIANESS', d,
 TARGET_CC_ARCH = "-march=armv5te -mtune=xscale"
 TARGET_CC_KERNEL_ARCH = "-march=armv5te -mtune=xscale"
 PACKAGE_EXTRA_ARCHS += "${@['armv4b armv4tb armv5teb', 'armv4 armv4t armv5te'][bb.data.getVar('SITEINFO_ENDIANESS', d, 1) == 'le']}"
-BASE_PACKAGE_ARCH = "${@['armv5teb', 'armv5te'][bb.data.getVar('SITEINFO_ENDIANESS', d, 1) == 'le']}"
+BASE_PACKAGE_ARCH := "${@['armv5teb', 'armv5te'][bb.data.getVar('SITEINFO_ENDIANESS', d, 1) == 'le']}"
 
 # Include tune file for thumb support, it defaults to off so DISTROs can turn it on if they wish
 require conf/machine/include/tune-thumb.inc
diff --git a/recipes/alsa/alsa-utils_1.0.13.bb b/recipes/alsa/alsa-utils_1.0.13.bb
index 1e6af1e..e77c2d9 100644
--- a/recipes/alsa/alsa-utils_1.0.13.bb
+++ b/recipes/alsa/alsa-utils_1.0.13.bb
@@ -12,7 +12,7 @@ SRC_URI = "ftp://ftp.alsa-project.org/pub/utils/alsa-utils-${PV}.tar.bz2"
 # please close bug and remove this comment when properly fixed
 #
 EXTRA_OECONF_linux-uclibc = "--disable-nls"
-EXTRA_OECONF_linux-uclibcgnueabi = "--disable-nls"
+EXTRA_OECONF_linux-uclibceabi = "--disable-nls"
 
 inherit autotools
 
diff --git a/recipes/avahi/avahi.inc b/recipes/avahi/avahi.inc
index f5e68e2..cefb2be 100644
--- a/recipes/avahi/avahi.inc
+++ b/recipes/avahi/avahi.inc
@@ -25,7 +25,7 @@ AVAHI_PYTHON = "--disable-python"
 AVAHI_GTK = "--disable-gtk"
 
 LDFLAGS_append_linux-uclibc = " -lintl"
-LDFLAGS_append_linux-uclibcgnueabi = " -lintl "
+LDFLAGS_append_linux-uclibceabi = " -lintl "
 LDFLAGS_append_uclinux-uclibc = " -lintl"
 
 PACKAGES =+ "avahi-daemon avahi-discover libavahi-common libavahi-core libavahi-client avahi-dnsconfd libavahi-glib libavahi-ui avahi-discover-standalone avahi-autoipd avahi-utils"
diff --git a/recipes/diffutils/diffutils_2.8.1.bb b/recipes/diffutils/diffutils_2.8.1.bb
index b979fa8..590d7f4 100644
--- a/recipes/diffutils/diffutils_2.8.1.bb
+++ b/recipes/diffutils/diffutils_2.8.1.bb
@@ -15,7 +15,7 @@ inherit autotools update-alternatives
 # because it uses __mempcpy, there are other things (TBD:
 # see diffutils.mk in buildroot)
 EXTRA_OECONF_linux-uclibc = "--without-included-regex"
-EXTRA_OECONF_linux-uclibcgnueabi = "--without-included-regex"
+EXTRA_OECONF_linux-uclibceabi = "--without-included-regex"
 
 do_install_append () {
         mv ${D}${bindir}/diff ${D}${bindir}/diff.${PN}
diff --git a/recipes/eibd/eibd.inc b/recipes/eibd/eibd.inc
index f021d96..e509764 100644
--- a/recipes/eibd/eibd.inc
+++ b/recipes/eibd/eibd.inc
@@ -5,7 +5,7 @@ PRIORITY = "optional"
 LICENSE = "GPLv2"
 DEPENDS = " pthsem libxml2"
 DEPENDS_append_linux-uclibc = " argp-standalone "
-DEPENDS_append_linux-uclibcgnueabi = " argp-standalone "
+DEPENDS_append_linux-uclibceabi = " argp-standalone "
 
 SRC_URI += " file://eibd "
 
diff --git a/recipes/gcc/gcc-configure-canadian-sdk.inc b/recipes/gcc/gcc-configure-canadian-sdk.inc
index 738b120..83ae6f5 100644
--- a/recipes/gcc/gcc-configure-canadian-sdk.inc
+++ b/recipes/gcc/gcc-configure-canadian-sdk.inc
@@ -1,7 +1,7 @@
 require gcc-configure-common.inc
 
 USE_NLS = '${@base_conditional( "TARGET_OS", "linux-uclibc", "no", "", d )}'
-USE_NLS = '${@base_conditional( "TARGET_OS", "linux-uclibcgnueabi", "no", "", d )}'
+USE_NLS = '${@base_conditional( "TARGET_OS", "linux-uclibceabi", "no", "", d )}'
 
 #
 # We need to override this and make sure the compiler can find staging
diff --git a/recipes/gcc/gcc-configure-common.inc b/recipes/gcc/gcc-configure-common.inc
index 9363585..1c605a1 100644
--- a/recipes/gcc/gcc-configure-common.inc
+++ b/recipes/gcc/gcc-configure-common.inc
@@ -9,7 +9,7 @@ JAVA_arm ?= ""
 JAVA_armeb ?= ""
 JAVA_mipsel ?= ""
 JAVA_sh3 ?= ""
-OBJC_linux-uclibcgnueabi ?= ""
+OBJC_linux-uclibceabi ?= ""
 OBJC_linux-uclibc ?= ""
 OBJC_avr ?= ""
 OBJC ?= ",objc"
@@ -41,7 +41,7 @@ EXTRA_OECONF = "${@['--enable-clocale=generic', ''][bb.data.getVar('USE_NLS', d,
 EXTRA_OECONF_append_linux               = " --enable-__cxa_atexit"
 EXTRA_OECONF_append_linux-gnueabi       = " --enable-__cxa_atexit"
 EXTRA_OECONF_append_linux-uclibc        = " --disable-__cxa_atexit"
-EXTRA_OECONF_append_linux-uclibcgnueabi = " --disable-__cxa_atexit"
+EXTRA_OECONF_append_linux-uclibceabi    = " --disable-__cxa_atexit"
 EXTRA_OECONF_FPU = "${@get_gcc_fpu_setting(bb, d)}"
 CPPFLAGS = ""
 
diff --git a/recipes/gcc/gcc-configure-sdk.inc b/recipes/gcc/gcc-configure-sdk.inc
index d04f608..205b106 100644
--- a/recipes/gcc/gcc-configure-sdk.inc
+++ b/recipes/gcc/gcc-configure-sdk.inc
@@ -2,7 +2,7 @@ require gcc-configure-common.inc
 
 # The two lines below conflict, this needs fixing - RP
 USE_NLS = '${@base_conditional( "TARGET_OS", "linux-uclibc", "no", "", d )}'
-USE_NLS = '${@base_conditional( "TARGET_OS", "linux-uclibcgnueabi", "no", "", d )}'
+USE_NLS = '${@base_conditional( "TARGET_OS", "linux-uclibceabi", "no", "", d )}'
 
 EXTRA_OECONF_PATHS = "--with-sysroot=${prefix}/${TARGET_SYS} \
                       --with-build-time-tools=${CROSS_DIR}/${TARGET_SYS}/bin \
diff --git a/recipes/gettext/gettext_0.14.1.bb b/recipes/gettext/gettext_0.14.1.bb
index 30fb92d..b383525 100644
--- a/recipes/gettext/gettext_0.14.1.bb
+++ b/recipes/gettext/gettext_0.14.1.bb
@@ -15,7 +15,7 @@ SRC_URI = "${GNU_MIRROR}/gettext/gettext-${PV}.tar.gz \
            file://disable_java.patch;patch=1"
 
 SRC_URI_append_linux-uclibc = " file://gettext-error_print_progname.patch;patch=1"
-SRC_URI_append_linux-uclibcgnueabi = " file://gettext-error_print_progname.patch;patch=1"
+SRC_URI_append_linux-uclibceabi = " file://gettext-error_print_progname.patch;patch=1"
 
 PARALLEL_MAKE = ""
 
diff --git a/recipes/gettext/gettext_0.17.bb b/recipes/gettext/gettext_0.17.bb
index 04dee4c..9f9f695 100644
--- a/recipes/gettext/gettext_0.17.bb
+++ b/recipes/gettext/gettext_0.17.bb
@@ -14,7 +14,7 @@ SRC_URI = "${GNU_MIRROR}/gettext/gettext-${PV}.tar.gz \
 	  "
 
 SRC_URI_append_linux-uclibc = " file://gettext-error_print_progname.patch;patch=1"
-SRC_URI_append_linux-uclibcgnueabi = " file://gettext-error_print_progname.patch;patch=1"
+SRC_URI_append_linux-uclibceabi = " file://gettext-error_print_progname.patch;patch=1"
 
 PARALLEL_MAKE = ""
 
diff --git a/recipes/klibc/klibc-common.inc b/recipes/klibc/klibc-common.inc
index b66bc61..3b0eb1c 100644
--- a/recipes/klibc/klibc-common.inc
+++ b/recipes/klibc/klibc-common.inc
@@ -31,7 +31,7 @@ ARM_INSTRUCTION_SET = "arm"
 
 SRC_URI_append_linux-gnueabi = "file://klibc-config-eabi.patch;patch=1 \
 				"
-SRC_URI_append_linux-uclibcgnueabi = "file://klibc-config-eabi.patch;patch=1 \
+SRC_URI_append_linux-uclibceabi = "file://klibc-config-eabi.patch;patch=1 \
 				      "
 
 EXTRA_OEMAKE = "'KLIBCARCH=${KLIBC_ARCH}' \
diff --git a/recipes/libffi/libffi_2.0+gcc4.3.2.bb b/recipes/libffi/libffi_2.0+gcc4.3.2.bb
index be98050..3b59b6a 100644
--- a/recipes/libffi/libffi_2.0+gcc4.3.2.bb
+++ b/recipes/libffi/libffi_2.0+gcc4.3.2.bb
@@ -50,7 +50,7 @@ EXTRA_OECONF_PATHS = "--with-local-prefix=${prefix}/local \
 EXTRA_OECONF_append_linux               = " --enable-__cxa_atexit"
 EXTRA_OECONF_append_linux-gnueabi       = " --enable-__cxa_atexit"
 EXTRA_OECONF_append_linux-uclibc        = " --disable-__cxa_atexit"
-EXTRA_OECONF_append_linux-uclibcgnueabi = " --disable-__cxa_atexit"
+EXTRA_OECONF_append_linux-uclibceabi    = " --disable-__cxa_atexit"
 EXTRA_OECONF_FPU = "${@get_gcc_fpu_setting(bb, d)}"
 
 #Somehow gcc doesn't set __SOFTFP__ when passing -mfloatabi=softp :(
diff --git a/recipes/libffi/libffi_3.0.8.bb b/recipes/libffi/libffi_3.0.8.bb
index cef09ae..d24e971 100644
--- a/recipes/libffi/libffi_3.0.8.bb
+++ b/recipes/libffi/libffi_3.0.8.bb
@@ -46,7 +46,7 @@ EXTRA_OECONF_PATHS = "--with-local-prefix=${prefix}/local \
 EXTRA_OECONF_append_linux               = " --enable-__cxa_atexit"
 EXTRA_OECONF_append_linux-gnueabi       = " --enable-__cxa_atexit"
 EXTRA_OECONF_append_linux-uclibc        = " --disable-__cxa_atexit"
-EXTRA_OECONF_append_linux-uclibcgnueabi = " --disable-__cxa_atexit"
+EXTRA_OECONF_append_linux-uclibceabi = " --disable-__cxa_atexit"
 EXTRA_OECONF_FPU = "${@get_gcc_fpu_setting(bb, d)}"
 
 #Somehow gcc doesn't set __SOFTFP__ when passing -mfloatabi=softp :(
diff --git a/recipes/linknx/linknx.inc b/recipes/linknx/linknx.inc
index ff2492f..1feb2b7 100644
--- a/recipes/linknx/linknx.inc
+++ b/recipes/linknx/linknx.inc
@@ -7,7 +7,7 @@ LICENSE = "GPL"
 
 DEPENDS = " pthsem lua5.1 curl libesmtp"
 DEPENDS_append_linux-uclibc = " argp-standalone"
-DEPENDS_append_linux-uclibcgnueabi = " argp-standalone"
+DEPENDS_append_linux-uclibceabi = " argp-standalone"
 
 SRC_URI += "file://configure-libcurl.patch;patch=1 \
             file://linknx.start "
diff --git a/recipes/linux/ep93xx-kernel_2.6.17+2.6.18-rc1.bb b/recipes/linux/ep93xx-kernel_2.6.17+2.6.18-rc1.bb
index 79d90bc..b233dd7 100644
--- a/recipes/linux/ep93xx-kernel_2.6.17+2.6.18-rc1.bb
+++ b/recipes/linux/ep93xx-kernel_2.6.17+2.6.18-rc1.bb
@@ -27,7 +27,7 @@ do_configure() {
         fi
 
 
-        if [ "${TARGET_OS}" == "linux-gnueabi" -o  "${TARGET_OS}" == "linux-uclibcgnueabi" ]; then
+        if [ "${TARGET_OS}" == "linux-gnueabi" -o  "${TARGET_OS}" == "linux-uclibceabi" ]; then
 		echo "CONFIG_AEABI=y"                   >> ${S}/.config
                 echo "CONFIG_OABI_COMPAT=y"             >> ${S}/.config
         else
diff --git a/recipes/linux/ep93xx-kernel_2.6.19+2.6.20-rc7.bb b/recipes/linux/ep93xx-kernel_2.6.19+2.6.20-rc7.bb
index 642b13f..9aab5d8 100644
--- a/recipes/linux/ep93xx-kernel_2.6.19+2.6.20-rc7.bb
+++ b/recipes/linux/ep93xx-kernel_2.6.19+2.6.20-rc7.bb
@@ -26,7 +26,7 @@ do_configure() {
         fi
 
 
-        if [ "${TARGET_OS}" == "linux-gnueabi" -o  "${TARGET_OS}" == "linux-uclibcgnueabi" ]; then
+        if [ "${TARGET_OS}" == "linux-gnueabi" -o  "${TARGET_OS}" == "linux-uclibceabi" ]; then
 		echo "CONFIG_AEABI=y"                   >> ${S}/.config
                 echo "CONFIG_OABI_COMPAT=y"             >> ${S}/.config
         else
diff --git a/recipes/linux/gumstix-linux.inc b/recipes/linux/gumstix-linux.inc
index 50111cb..030abf2 100644
--- a/recipes/linux/gumstix-linux.inc
+++ b/recipes/linux/gumstix-linux.inc
@@ -17,7 +17,7 @@ do_deploy[dirs] = "${S}"
 do_configure_prepend() {
         echo "" > ${S}/.config
 
-        if [ "${TARGET_OS}" == "linux-gnueabi" -o  "${TARGET_OS}" == "linux-uclibcgnueabi" ]; then
+        if [ "${TARGET_OS}" == "linux-gnueabi" -o  "${TARGET_OS}" == "linux-uclibceabi" ]; then
                 echo "CONFIG_AEABI=y"                   >> ${S}/.config
                 echo "CONFIG_OABI_COMPAT=y"             >> ${S}/.config
         else
diff --git a/recipes/linux/ixp4xx-kernel.inc b/recipes/linux/ixp4xx-kernel.inc
index 8ec06e2..910819e 100644
--- a/recipes/linux/ixp4xx-kernel.inc
+++ b/recipes/linux/ixp4xx-kernel.inc
@@ -192,7 +192,7 @@ do_configure_prepend() {
 		echo 'CONFIG_CPU_BIG_ENDIAN=y' >>'${S}/.config'
 	fi
 
-        if [ "${TARGET_OS}" == "linux-gnueabi" -o  "${TARGET_OS}" == "linux-uclibcgnueabi" ]; then               
+        if [ "${TARGET_OS}" == "linux-gnueabi" -o  "${TARGET_OS}" == "linux-uclibceabi" ]; then               
                 echo "CONFIG_AEABI=y"                   >> ${S}/.config               
                 echo "CONFIG_OABI_COMPAT=y"             >> ${S}/.config       
         else
diff --git a/recipes/linux/linux-bd-neon-2.6_2.6.22.bb b/recipes/linux/linux-bd-neon-2.6_2.6.22.bb
index 400fe78..3fca851 100644
--- a/recipes/linux/linux-bd-neon-2.6_2.6.22.bb
+++ b/recipes/linux/linux-bd-neon-2.6_2.6.22.bb
@@ -22,7 +22,7 @@ ALLOW_EMPTY = "1"
 do_configure() {
         cp arch/arm/configs/neon_defconfig .config || die "No default configuration for ${MACHINE} available."
 
-#        if [ "${TARGET_OS}" == "linux-gnueabi" -o  "${TARGET_OS}" == "linux-uclibcgnueabi" ]; then
+#        if [ "${TARGET_OS}" == "linux-gnueabi" -o  "${TARGET_OS}" == "linux-uclibceabi" ]; then
 #                echo "CONFIG_AEABI=y"                   >> ${S}/.config
 #                echo "CONFIG_OABI_COMPAT=y"             >> ${S}/.config
 #        else
diff --git a/recipes/linux/linux-hackndev-2.6_git.bb b/recipes/linux/linux-hackndev-2.6_git.bb
index 2f9f902..5c093a1 100644
--- a/recipes/linux/linux-hackndev-2.6_git.bb
+++ b/recipes/linux/linux-hackndev-2.6_git.bb
@@ -27,7 +27,7 @@ do_configure() {
 			|| die "No default configuration for ${MACHINE} available."
 	fi
 
-	if [ "${TARGET_OS}" == "linux-gnueabi" -o  "${TARGET_OS}" == "linux-uclibcgnueabi" ]; then
+	if [ "${TARGET_OS}" == "linux-gnueabi" -o  "${TARGET_OS}" == "linux-uclibceabi" ]; then
                 echo "CONFIG_AEABI=y"                   >> ${S}/.config
                 echo "CONFIG_OABI_COMPAT=y"             >> ${S}/.config
         else
diff --git a/recipes/linux/linux-handhelds-2.6.inc b/recipes/linux/linux-handhelds-2.6.inc
index 5270c14..fe48283 100644
--- a/recipes/linux/linux-handhelds-2.6.inc
+++ b/recipes/linux/linux-handhelds-2.6.inc
@@ -50,7 +50,7 @@ do_configure() {
 		echo "CONFIG_INITRAMFS_SOURCE=\"${WORKDIR}/initramfs.cpio\"" >> ${S}/.config
 	fi
 
-	if [ "${TARGET_OS}" == "linux-gnueabi" -o  "${TARGET_OS}" == "linux-uclibcgnueabi" ]; then
+	if [ "${TARGET_OS}" == "linux-gnueabi" -o  "${TARGET_OS}" == "linux-uclibceabi" ]; then
 		echo "CONFIG_AEABI=y"                   >> ${S}/.config
 		echo "CONFIG_OABI_COMPAT=y"             >> ${S}/.config
 	else
diff --git a/recipes/linux/linux-navman_2.6.18.bb b/recipes/linux/linux-navman_2.6.18.bb
index b37b68e..2c9aef9 100644
--- a/recipes/linux/linux-navman_2.6.18.bb
+++ b/recipes/linux/linux-navman_2.6.18.bb
@@ -26,7 +26,7 @@ do_configure() {
         fi
 
 
-        if [ "${TARGET_OS}" == "linux-gnueabi" -o  "${TARGET_OS}" == "linux-uclibcgnueabi" ]; then
+        if [ "${TARGET_OS}" == "linux-gnueabi" -o  "${TARGET_OS}" == "linux-uclibceabi" ]; then
 		echo "CONFIG_AEABI=y"                   >> ${S}/.config
                 echo "CONFIG_OABI_COMPAT=y"             >> ${S}/.config
         else
diff --git a/recipes/linux/linux-nokia800.inc b/recipes/linux/linux-nokia800.inc
index 0fc4740..0f52b7c 100644
--- a/recipes/linux/linux-nokia800.inc
+++ b/recipes/linux/linux-nokia800.inc
@@ -14,7 +14,7 @@ do_configure_prepend() {
 
 	rm -f ${S}/.config || true
 
-        if [ "${TARGET_OS}" = "linux-gnueabi" -o  "${TARGET_OS}" = "linux-uclibcgnueabi" ]; then
+        if [ "${TARGET_OS}" = "linux-gnueabi" -o  "${TARGET_OS}" = "linux-uclibceabi" ]; then
                 echo "CONFIG_AEABI=y"                   >> ${S}/.config
                 echo "CONFIG_OABI_COMPAT=y"             >> ${S}/.config
         else
diff --git a/recipes/linux/linux-palm-omap1_2.6.22-omap1.bb b/recipes/linux/linux-palm-omap1_2.6.22-omap1.bb
index 786e490..16fe38b 100644
--- a/recipes/linux/linux-palm-omap1_2.6.22-omap1.bb
+++ b/recipes/linux/linux-palm-omap1_2.6.22-omap1.bb
@@ -25,7 +25,7 @@ do_configure() {
 	fi
 	
 
-	if [ "${TARGET_OS}" == "linux-gnueabi" -o  "${TARGET_OS}" == "linux-uclibcgnueabi" ]; then
+	if [ "${TARGET_OS}" == "linux-gnueabi" -o  "${TARGET_OS}" == "linux-uclibceabi" ]; then
                 echo "CONFIG_AEABI=y"                   >> ${S}/.config
                 echo "CONFIG_OABI_COMPAT=y"             >> ${S}/.config
         else
diff --git a/recipes/linux/linux-rp.inc b/recipes/linux/linux-rp.inc
index bdeb9f3..041a095 100644
--- a/recipes/linux/linux-rp.inc
+++ b/recipes/linux/linux-rp.inc
@@ -105,7 +105,7 @@ do_configure() {
 
 	echo "CONFIG_CMDLINE=\"${CMDLINE}\"" >> ${S}/.config
 
-	if [ "${TARGET_OS}" = "linux-gnueabi" -o "${TARGET_OS}" = "linux-uclibcgnueabi" ]; then
+	if [ "${TARGET_OS}" = "linux-gnueabi" -o "${TARGET_OS}" = "linux-uclibceabi" ]; then
 		echo "CONFIG_AEABI=y"                   >> ${S}/.config
 		if [ "${ARM_KEEP_OABI}" = "1" ] ; then
 			echo "CONFIG_OABI_COMPAT=y"             >> ${S}/.config
diff --git a/recipes/linux/linux-tornado-omap2_2.6.16.16.bb b/recipes/linux/linux-tornado-omap2_2.6.16.16.bb
index a9ebee1..9c6e133 100644
--- a/recipes/linux/linux-tornado-omap2_2.6.16.16.bb
+++ b/recipes/linux/linux-tornado-omap2_2.6.16.16.bb
@@ -24,7 +24,7 @@ do_configure() {
         fi
 
 
-        if [ "${TARGET_OS}" == "linux-gnueabi" -o  "${TARGET_OS}" == "linux-uclibcgnueabi" ]; then
+        if [ "${TARGET_OS}" == "linux-gnueabi" -o  "${TARGET_OS}" == "linux-uclibceabi" ]; then
                 echo "CONFIG_AEABI=y"                   >> ${S}/.config
                 echo "CONFIG_OABI_COMPAT=y"             >> ${S}/.config
         else
diff --git a/recipes/linux/linux.inc b/recipes/linux/linux.inc
index 3dbb1ec..044d413 100644
--- a/recipes/linux/linux.inc
+++ b/recipes/linux/linux.inc
@@ -68,7 +68,7 @@ do_configure_prepend() {
         #
         # oabi / eabi support
         #
-        if [ "${TARGET_OS}" = "linux-gnueabi" -o  "${TARGET_OS}" = "linux-uclibcgnueabi" ]; then
+        if [ "${TARGET_OS}" = "linux-gnueabi" -o  "${TARGET_OS}" = "linux-uclibceabi" ]; then
                 echo "CONFIG_AEABI=y"                   >> ${S}/.config
                 if [ "${ARM_KEEP_OABI}" = "1" ] ; then
                         echo "CONFIG_OABI_COMPAT=y"             >> ${S}/.config
diff --git a/recipes/linux/mx21ads-kernel_2.6.19rc6.bb b/recipes/linux/mx21ads-kernel_2.6.19rc6.bb
index 47f363d..bc8e624 100644
--- a/recipes/linux/mx21ads-kernel_2.6.19rc6.bb
+++ b/recipes/linux/mx21ads-kernel_2.6.19rc6.bb
@@ -26,7 +26,7 @@ RPROVIDES_kernel-image += "hostap-modules"
 do_configure_prepend() {
 	install -m 0644 ${WORKDIR}/mx21ads_defconfig ${S}/defconfig
 
-        if [ "${TARGET_OS}" == "linux-gnueabi" -o  "${TARGET_OS}" == "linux-uclibcgnueabi" ]; then
+        if [ "${TARGET_OS}" == "linux-gnueabi" -o  "${TARGET_OS}" == "linux-uclibceabi" ]; then
                 echo "CONFIG_AEABI=y"                   >> ${S}/.config
                 echo "CONFIG_OABI_COMPAT=y"             >> ${S}/.config
         else
diff --git a/recipes/linux/netbook-pro-kernel_2.6.17.bb b/recipes/linux/netbook-pro-kernel_2.6.17.bb
index 1d24646..37704dc 100644
--- a/recipes/linux/netbook-pro-kernel_2.6.17.bb
+++ b/recipes/linux/netbook-pro-kernel_2.6.17.bb
@@ -27,7 +27,7 @@ do_configure() {
         fi
 
 
-        if [ "${TARGET_OS}" == "linux-gnueabi" -o  "${TARGET_OS}" == "linux-uclibcgnueabi" ]; then
+        if [ "${TARGET_OS}" == "linux-gnueabi" -o  "${TARGET_OS}" == "linux-uclibceabi" ]; then
                 echo "CONFIG_AEABI=y"                   >> ${S}/.config
                 echo "CONFIG_OABI_COMPAT=y"             >> ${S}/.config
         else
diff --git a/recipes/make/make.inc b/recipes/make/make.inc
index 8a43f40..af21861 100644
--- a/recipes/make/make.inc
+++ b/recipes/make/make.inc
@@ -11,7 +11,7 @@ SRC_URI = "${GNU_MIRROR}/make/make-${PV}.tar.bz2 \
 inherit autotools
 
 do_configure_prepend() {
-	if [ "${TARGET_OS}" = "linux-uclibc" -o "${TARGET_OS}" = "linux-uclibcgnueabi" ]; then
+	if [ "${TARGET_OS}" = "linux-uclibc" -o "${TARGET_OS}" = "linux-uclibceabi" ]; then
 		export make_cv_sys_gnu_glob="no" 
 		export GLOBINC=-I`pwd`/glob
 		export GLOBLIB=glob/libglob.a
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
diff --git a/recipes/perl/perl_5.8.8.bb b/recipes/perl/perl_5.8.8.bb
index 521cdf6..8d97199 100644
--- a/recipes/perl/perl_5.8.8.bb
+++ b/recipes/perl/perl_5.8.8.bb
@@ -63,7 +63,7 @@ do_configure() {
         done
 
         # Fixups for uclibc
-        if [ "${TARGET_OS}" = "linux-uclibc" -o "${TARGET_OS}" = "linux-uclibcgnueabi" ]; then
+        if [ "${TARGET_OS}" = "linux-uclibc" -o "${TARGET_OS}" = "linux-uclibceabi" ]; then
                 sed -i -e "s,\(d_crypt_r=\)'define',\1'undef',g" \
                        -e "s,\(crypt_r_proto=\)'\w+',\1'0',g" \
                        -e "s,\(d_getnetbyname_r=\)'define',\1'undef',g" \
diff --git a/recipes/qmake/qmake-native_1.07a.bb b/recipes/qmake/qmake-native_1.07a.bb
index a80bb1b..bb3e79b 100644
--- a/recipes/qmake/qmake-native_1.07a.bb
+++ b/recipes/qmake/qmake-native_1.07a.bb
@@ -18,7 +18,7 @@ EXTRA_OEMAKE = "-e"
 
 do_configure() {
 	# Install the OE build templates
-	for template in linux-oe-g++ linux-uclibc-oe-g++ linux-gnueabi-oe-g++ linux-uclibcgnueabi-oe-g++
+	for template in linux-oe-g++ linux-uclibc-oe-g++ linux-gnueabi-oe-g++ linux-uclibceabi-oe-g++
 	do
 		install -d ${S}/mkspecs/$template
 		install -m 0644 ${WORKDIR}/linux-oe-qmake.conf ${S}/mkspecs/$template/qmake.conf
diff --git a/recipes/qmake/qmake2-native.inc b/recipes/qmake/qmake2-native.inc
index f84da2a..9908200 100644
--- a/recipes/qmake/qmake2-native.inc
+++ b/recipes/qmake/qmake2-native.inc
@@ -26,7 +26,7 @@ do_configure() {
     # Make sure we regenerate all Makefiles 
     find ${S} -name "Makefile" | xargs rm
     # Install the OE build templates
-    for template in linux-oe-g++ linux-uclibc-oe-g++ linux-gnueabi-oe-g++ linux-uclibcgnueabi-oe-g++
+    for template in linux-oe-g++ linux-uclibc-oe-g++ linux-gnueabi-oe-g++ linux-uclibceabi-oe-g++
     do
         install -d ${S}/mkspecs/$template
         install -m 0644 ${WORKDIR}/linux-oe-qmake.conf ${S}/mkspecs/$template/qmake.conf
diff --git a/recipes/qte/qte-common_2.3.10.inc b/recipes/qte/qte-common_2.3.10.inc
index 6f0b134..f24a265 100644
--- a/recipes/qte/qte-common_2.3.10.inc
+++ b/recipes/qte/qte-common_2.3.10.inc
@@ -116,8 +116,8 @@ do_configure() {
 			> `dirname $f`/`basename $f | sed -e 's,linux-,linux-uclibc-,'`
 		sed -e 's,-linux-,-linux-gnueabi-,g' < $f \
 			> `dirname $f`/`basename $f | sed -e 's,linux-,linux-gnueabi-,'`
-		sed -e 's,-linux-,-linux-uclibcgnueabi-,g' < $f \
-			> `dirname $f`/`basename $f | sed -e 's,linux-,linux-uclibcgnueabi-,'`
+		sed -e 's,-linux-,-linux-uclibceabi-,g' < $f \
+			> `dirname $f`/`basename $f | sed -e 's,linux-,linux-uclibceabi-,'`
 	done
 	echo yes | ./configure ${EXTRA_OECONF} || die "Configuring qte failed. EXTRA_OECONF was ${EXTRA_OECONF}"
 }
diff --git a/recipes/samba/samba_3.0.34.bb b/recipes/samba/samba_3.0.34.bb
index d43c50d..5ef9da5 100644
--- a/recipes/samba/samba_3.0.34.bb
+++ b/recipes/samba/samba_3.0.34.bb
@@ -4,7 +4,7 @@ require samba-basic.inc
 SRC_URI += "file://configure.patch;patch=1 \
             "
 SRC_URI_append_linux-uclibc        = "file://uclibc-strlcpy-strlcat.patch;patch=1"
-SRC_URI_append_linux-uclibcgnueabi = "file://uclibc-strlcpy-strlcat.patch;patch=1"
+SRC_URI_append_linux-uclibceabi = "file://uclibc-strlcpy-strlcat.patch;patch=1"
 
 PR = "r5"
 
diff --git a/recipes/tasks/task-sdk-bare.bb b/recipes/tasks/task-sdk-bare.bb
index 85d3626..9c78cfa 100644
--- a/recipes/tasks/task-sdk-bare.bb
+++ b/recipes/tasks/task-sdk-bare.bb
@@ -23,7 +23,7 @@ GLIBC_PKGS = "\
 LIBC_PKGS_linux = "${GLIBC_PKGS}"
 LIBC_PKGS_linux-gnueabi = "${GLIBC_PKGS}"
 LIBC_PKGS_linux-uclibc = "uclibc uclibc-dev uclibc-thread-db"
-LIBC_PKGS_linux-uclibcgnueabi = "uclibc uclibc-dev uclibc-thread-db"
+LIBC_PKGS_linux-uclibceabi = "uclibc uclibc-dev uclibc-thread-db"
 
 RDEPENDS_${PN} = "\
     ${LIBC_PKGS} \
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
 
diff --git a/recipes/util-linux-ng/util-linux-ng_2.14.bb b/recipes/util-linux-ng/util-linux-ng_2.14.bb
index d7eafd3..7385324 100644
--- a/recipes/util-linux-ng/util-linux-ng_2.14.bb
+++ b/recipes/util-linux-ng/util-linux-ng_2.14.bb
@@ -6,6 +6,6 @@ SRC_URI += "file://util-linux-ng-uclibc-versionsort.patch;patch=1 \
 	    file://util-linux-ng-replace-siginterrupt.patch;patch=1 \
 	   "
 LDFLAGS_append_linux-uclibc = " -lintl"
-LDFLAGS_append_linux-uclibcgnueabi = " -lintl "
+LDFLAGS_append_linux-uclibceabi = " -lintl "
 LDFLAGS_append_uclinux-uclibc = " -lintl"
 

--LZvS9be/3tNcYl/X--
