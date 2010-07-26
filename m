Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OdTsf-0007HQ-NI
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Jul 2010 22:02:36 +0200
Received: by mail-pz0-f47.google.com with SMTP id 2so1263612pzk.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jul 2010 13:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=FisxBaD9eMtrHuTbj4I6yxsNXq9PSuvkvWURbzv3hFU=;
	b=arFNFnDEbwur+5ejaNOOFrei8Pvxp0mTnMPGyRHjnM4uZSb/ioi0DCtffDJAE4/10b
	KaoZ+G5j8WVkoXvDVEQ63180Gb0aAEdG2LSM5Ui9AKaRFeQAJWEKLQJ+aro37lK0oV19
	tQ4gndKlMVK9UwQYHpr+tqhIFpOW5dA2BGjYk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=r7iWp6iy5H3k6ZmciVm3pQyQ4PoX4s28n0k16gnIJMUVHA0CPw2lg5zlNRjftQSBuX
	ODwO+h5ecLMYBhIPS1XncdQWL9xVjCkhu3IwmYIAFnlxuUXK9SUF2XWWqI5uDMWCMOrq
	6d7bBQxe86I+cmMEQSen3OJh2qdfOF8cm842c=
Received: by 10.142.211.4 with SMTP id j4mr6261134wfg.73.1280174539183;
	Mon, 26 Jul 2010 13:02:19 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id q27sm4573766wfc.18.2010.07.26.13.02.18
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 26 Jul 2010 13:02:18 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 26 Jul 2010 13:02:06 -0700
Message-Id: <1280174528-27682-6-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1280174528-27682-1-git-send-email-raj.khem@gmail.com>
References: <1280174528-27682-1-git-send-email-raj.khem@gmail.com>
X-SA-Exim-Connect-IP: 209.85.210.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 5/7] machines: Add new variable TARGET_SUB_ARCH
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
X-List-Received-Date: Mon, 26 Jul 2010 20:02:37 -0000

* This variable indicates the particular arch that toolchains
  TARGET_SYS and HOST_SYS should be built for.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 conf/bitbake.conf                           |    8 +++++---
 conf/machine/h6300.conf                     |    1 -
 conf/machine/include/tune-arm1136-novfp.inc |    1 +
 conf/machine/include/tune-arm1136jf-s.inc   |    1 +
 conf/machine/include/tune-arm1176jzf-s.inc  |    1 +
 conf/machine/include/tune-arm920t.inc       |    1 +
 conf/machine/include/tune-arm926ejs.inc     |    1 +
 conf/machine/include/tune-arm9tdmi.inc      |    1 +
 conf/machine/include/tune-armv7.inc         |    1 +
 conf/machine/include/tune-at32ap7000.inc    |    1 +
 conf/machine/include/tune-athlonmp.inc      |    1 +
 conf/machine/include/tune-atom.inc          |    3 ++-
 conf/machine/include/tune-c3.inc            |    1 +
 conf/machine/include/tune-cortexa8.inc      |    1 +
 conf/machine/include/tune-cortexa9.inc      |    1 +
 conf/machine/include/tune-cortexm1.inc      |    1 +
 conf/machine/include/tune-cortexm3.inc      |    1 +
 conf/machine/include/tune-cortexr4.inc      |    1 +
 conf/machine/include/tune-ep9312.inc        |    1 +
 conf/machine/include/tune-geode.inc         |    1 +
 conf/machine/include/tune-i486sx.inc        |    1 +
 conf/machine/include/tune-iwmmxt.inc        |    2 +-
 conf/machine/include/tune-pentium.inc       |    1 +
 conf/machine/include/tune-pentium4c.inc     |    1 +
 conf/machine/include/tune-pentiummmx.inc    |    1 +
 conf/machine/include/tune-pentiumpro.inc    |    1 +
 conf/machine/include/tune-ppc405.inc        |    1 +
 conf/machine/include/tune-ppc440.inc        |    1 +
 conf/machine/include/tune-ppc440e.inc       |    1 +
 conf/machine/include/tune-ppc603e.inc       |    1 +
 conf/machine/include/tune-ppce300c2.inc     |    1 +
 conf/machine/include/tune-ppce300c3.inc     |    1 +
 conf/machine/include/tune-ppce500.inc       |    1 +
 conf/machine/include/tune-ppce500v2.inc     |    1 +
 conf/machine/include/tune-ppce600.inc       |    1 +
 conf/machine/include/tune-sh3.inc           |    1 +
 conf/machine/include/tune-sh4.inc           |    1 +
 conf/machine/include/tune-strongarm.inc     |    1 +
 conf/machine/include/tune-supersparc.inc    |    1 +
 conf/machine/include/tune-xscale.inc        |    1 +
 40 files changed, 44 insertions(+), 6 deletions(-)

diff --git a/conf/bitbake.conf b/conf/bitbake.conf
index 2a1f241..66eebf3 100644
--- a/conf/bitbake.conf
+++ b/conf/bitbake.conf
@@ -98,10 +98,10 @@ BUILD_PREFIX = ""
 BUILD_CC_ARCH = ""
 BUILD_EXEEXT = ""
 
-HOST_ARCH = "${TARGET_ARCH}"
+HOST_ARCH = "${TARGET_SUB_ARCH}"
 HOST_OS = "${TARGET_OS}"
 HOST_VENDOR = "${TARGET_VENDOR}"
-HOST_SYS = "${BASEPKG_HOST_SYS}"
+HOST_SYS = "${HOST_ARCH}${HOST_VENDOR}-${HOST_OS}"
 HOST_PREFIX = "${TARGET_PREFIX}"
 HOST_CC_ARCH = "${TARGET_CC_ARCH}"
 HOST_EXEEXT = ""
@@ -109,7 +109,7 @@ HOST_EXEEXT = ""
 TARGET_ARCH ?= "INVALID"
 TARGET_OS = "INVALID"
 TARGET_VENDOR = "${BUILD_VENDOR}"
-TARGET_SYS = "${BASE_PACKAGE_ARCH}${TARGET_VENDOR}${@['-' + bb.data.getVar('TARGET_OS', d, 1), ''][bb.data.getVar('TARGET_OS', d, 1) == ('' or 'custom')]}"
+TARGET_SYS = "${TARGET_SUB_ARCH}${TARGET_VENDOR}${@['-' + bb.data.getVar('TARGET_OS', d, 1), ''][bb.data.getVar('TARGET_OS', d, 1) == ('' or 'custom')]}"
 TARGET_PREFIX = "${TARGET_SYS}-"
 TARGET_CC_ARCH = ""
 TARGET_EXEEXT = ""
@@ -139,6 +139,8 @@ MULTIMACH_HOST_SYS = "${MULTIMACH_ARCH}${HOST_VENDOR}-${HOST_OS}"
 BASEPKG_HOST_SYS = "${BASE_PACKAGE_ARCH}${HOST_VENDOR}-${HOST_OS}"
 BASEPKG_TARGET_SYS = "${BASE_PACKAGE_ARCH}${TARGET_VENDOR}-${TARGET_OS}"
 
+#TARGET_SUB_ARCH = "${BASE_PACKAGE_ARCH}"
+
 # select proper CPU to get binary locales generated
 QEMU_OPTIONS = ""
 QEMU_OPTIONS_iwmmxt  = "-cpu pxa270-c5"
diff --git a/conf/machine/h6300.conf b/conf/machine/h6300.conf
index 08f61b8..97201e8 100644
--- a/conf/machine/h6300.conf
+++ b/conf/machine/h6300.conf
@@ -7,7 +7,6 @@
 #
 TARGET_ARCH = "arm"
 BASE_PACKAGE_ARCH = "arm"
-
 #Use OMAP 1510 cpu specifig arm9tdmi options for gcc
 require conf/machine/include/tune-arm9tdmi.inc
 
diff --git a/conf/machine/include/tune-arm1136-novfp.inc b/conf/machine/include/tune-arm1136-novfp.inc
index 58134b7..cb4f77d 100644
--- a/conf/machine/include/tune-arm1136-novfp.inc
+++ b/conf/machine/include/tune-arm1136-novfp.inc
@@ -5,3 +5,4 @@ TARGET_CC_ARCH = "-march=armv6j -mtune=arm1136jf-s"
 FEED_ARCH = "armv6-novfp"
 BASE_PACKAGE_ARCH = "armv6-novfp"
 PACKAGE_EXTRA_ARCHS += "armv4 armv4t armv5te armv6-novfp"
+TARGET_SUB_ARCH = "v6_novfp"
diff --git a/conf/machine/include/tune-arm1136jf-s.inc b/conf/machine/include/tune-arm1136jf-s.inc
index 2944cc7..4d42b51 100644
--- a/conf/machine/include/tune-arm1136jf-s.inc
+++ b/conf/machine/include/tune-arm1136jf-s.inc
@@ -2,3 +2,4 @@ TARGET_CC_ARCH = "-march=armv6j -mtune=arm1136jf-s -mfpu=vfp -mfloat-abi=softfp"
 FEED_ARCH = "armv6"
 BASE_PACKAGE_ARCH = "armv6"
 PACKAGE_EXTRA_ARCHS += "armv4 armv4t armv5te armv6"
+TARGET_SUB_ARCH = "v6"
diff --git a/conf/machine/include/tune-arm1176jzf-s.inc b/conf/machine/include/tune-arm1176jzf-s.inc
index ee2884b..284c725 100644
--- a/conf/machine/include/tune-arm1176jzf-s.inc
+++ b/conf/machine/include/tune-arm1176jzf-s.inc
@@ -2,3 +2,4 @@ TARGET_CC_ARCH = "-march=armv6j -mtune=arm1176jzf-s -mfpu=vfp -mfloat-abi=softfp
 FEED_ARCH = "armv6"
 BASE_PACKAGE_ARCH = "armv6"
 PACKAGE_EXTRA_ARCHS += "armv4 armv4t armv5te armv6"
+TARGET_SUB_ARCH = "v6vfp"
diff --git a/conf/machine/include/tune-arm920t.inc b/conf/machine/include/tune-arm920t.inc
index fee5c58..23240bc 100644
--- a/conf/machine/include/tune-arm920t.inc
+++ b/conf/machine/include/tune-arm920t.inc
@@ -2,3 +2,4 @@ FEED_ARCH = "armv4t"
 BASE_PACKAGE_ARCH = "armv4t" 
 TARGET_CC_ARCH = "-march=armv4t -mtune=arm920t"
 PACKAGE_EXTRA_ARCHS += "armv4 armv4t"
+TARGET_SUB_ARCH = "v4t"
diff --git a/conf/machine/include/tune-arm926ejs.inc b/conf/machine/include/tune-arm926ejs.inc
index f41e460..03da611 100644
--- a/conf/machine/include/tune-arm926ejs.inc
+++ b/conf/machine/include/tune-arm926ejs.inc
@@ -5,3 +5,4 @@ PACKAGE_EXTRA_ARCHS += "armv4 armv4t armv5te"
 # For gcc 4.x you need:
 TARGET_CC_ARCH = "-march=armv5te -mtune=arm926ej-s"
 BASE_PACKAGE_ARCH = "armv5te"
+TARGET_SUB_ARCH = "v5te"
diff --git a/conf/machine/include/tune-arm9tdmi.inc b/conf/machine/include/tune-arm9tdmi.inc
index d788b53..66b4c71 100644
--- a/conf/machine/include/tune-arm9tdmi.inc
+++ b/conf/machine/include/tune-arm9tdmi.inc
@@ -2,3 +2,4 @@ FEED_ARCH = "armv4t"
 BASE_PACKAGE_ARCH = "armv4t"
 PACKAGE_EXTRA_ARCHS += "armv4 armv4t"
 TARGET_CC_ARCH = "-mcpu=arm9tdmi -mtune=arm9tdmi"
+TARGET_SUB_ARCH = "v4t"
diff --git a/conf/machine/include/tune-armv7.inc b/conf/machine/include/tune-armv7.inc
index 379a3eb..b74ab5f 100644
--- a/conf/machine/include/tune-armv7.inc
+++ b/conf/machine/include/tune-armv7.inc
@@ -5,3 +5,4 @@ TARGET_CC_ARCH = "-march=armv7 -mfpu=vfp -mfloat-abi=softfp"
 FEED_ARCH = "armv7"
 PACKAGE_EXTRA_ARCHS += "armv4 armv4t armv5te armv6 armv7"
 BASE_PACKAGE_ARCH = "armv7"
+TARGET_SUB_ARCH = "v7"
diff --git a/conf/machine/include/tune-at32ap7000.inc b/conf/machine/include/tune-at32ap7000.inc
index 666dd21..d017988 100644
--- a/conf/machine/include/tune-at32ap7000.inc
+++ b/conf/machine/include/tune-at32ap7000.inc
@@ -1,3 +1,4 @@
 TARGET_CC_ARCH = "-march=ap"
 BASE_PACKAGE_ARCH = "avr32"
 FEED_ARCH = "avr32"
+TARGET_SUB_ARCH = "at32"
diff --git a/conf/machine/include/tune-athlonmp.inc b/conf/machine/include/tune-athlonmp.inc
index 9526faa..26825a2 100644
--- a/conf/machine/include/tune-athlonmp.inc
+++ b/conf/machine/include/tune-athlonmp.inc
@@ -2,3 +2,4 @@ TARGET_CC_ARCH = "-march=i686"
 PACKAGE_EXTRA_ARCHS += "i386 i486 i586"
 BASE_PACKAGE_ARCH = "i686"
 FEED_ARCH = "i686"
+TARGET_SUB_ARCH = "athlon"
diff --git a/conf/machine/include/tune-atom.inc b/conf/machine/include/tune-atom.inc
index 44058c1..a355142 100644
--- a/conf/machine/include/tune-atom.inc
+++ b/conf/machine/include/tune-atom.inc
@@ -6,4 +6,5 @@ TARGET_CC_ARCH = "-march=core2"
 #TARGET_CC_ARCH = "-march=i686 -mtune=atom"
 BASE_PACKAGE_ARCH = "i686"
 FEED_ARCH = "i686"
-PACKAGE_EXTRA_ARCHS += "x86 i386 i486 i586"
\ No newline at end of file
+TARGET_SUB_ARCH = "atom"
+PACKAGE_EXTRA_ARCHS += "x86 i386 i486 i586"
diff --git a/conf/machine/include/tune-c3.inc b/conf/machine/include/tune-c3.inc
index 136efa2..b926ffb 100644
--- a/conf/machine/include/tune-c3.inc
+++ b/conf/machine/include/tune-c3.inc
@@ -2,3 +2,4 @@ TARGET_CC_ARCH = "-march=c3 -mtune=c3"
 PACKAGE_EXTRA_ARCHS += "i386 i486"
 BASE_PACKAGE_ARCH = "i586"
 FEED_ARCH = "i586"
+TARGET_SUB_ARCH = "c3"
diff --git a/conf/machine/include/tune-cortexa8.inc b/conf/machine/include/tune-cortexa8.inc
index 096c219..32833b1 100644
--- a/conf/machine/include/tune-cortexa8.inc
+++ b/conf/machine/include/tune-cortexa8.inc
@@ -13,5 +13,6 @@ TARGET_CC_ARCH = "-march=armv7-a -mtune=cortex-a8 -mfpu=neon ${ARM_FP_OPT}"
 
 FEED_ARCH = "armv7a${ARM_FP_PACKAGESUFFIX}"
 BASE_PACKAGE_ARCH = "armv7a${ARM_FP_PACKAGESUFFIX}"
+TARGET_SUB_ARCH = "v7a"
 
 PACKAGE_EXTRA_ARCHS += "armv4 armv4t armv5te armv6 armv7 armv7a${ARM_FP_PACKAGESUFFIX}"
diff --git a/conf/machine/include/tune-cortexa9.inc b/conf/machine/include/tune-cortexa9.inc
index a12494f..4b89f86 100644
--- a/conf/machine/include/tune-cortexa9.inc
+++ b/conf/machine/include/tune-cortexa9.inc
@@ -7,3 +7,4 @@ TARGET_CC_ARCH = "-march=armv7-a -mtune=cortex-a9 -mfpu=neon -mfloat-abi=softfp"
 FEED_ARCH = "armv7a"
 PACKAGE_EXTRA_ARCHS += "armv4 armv4t armv5te armv6 armv7 armv7a"
 BASE_PACKAGE_ARCH = "armv7a"
+TARGET_SUB_ARCH = "v7a"
diff --git a/conf/machine/include/tune-cortexm1.inc b/conf/machine/include/tune-cortexm1.inc
index 6c4a70a..f00d2e2 100644
--- a/conf/machine/include/tune-cortexm1.inc
+++ b/conf/machine/include/tune-cortexm1.inc
@@ -1,3 +1,4 @@
 TARGET_CC_ARCH = "-march=armv7 -mtune=cortex-m1 -mfpu=vfp -mfloat-abi=softfp"
 FEED_ARCH = "armv6"
 BASE_PACKAGE_ARCH = "armv6"
+TARGET_SUB_ARCH = "cortexm1"
diff --git a/conf/machine/include/tune-cortexm3.inc b/conf/machine/include/tune-cortexm3.inc
index 6da9aee..b3e5ea8 100644
--- a/conf/machine/include/tune-cortexm3.inc
+++ b/conf/machine/include/tune-cortexm3.inc
@@ -2,3 +2,4 @@
 TARGET_CC_ARCH = "-march=armv7-m -mtune=cortex-m3 -mfpu=vfp -mfloat-abi=softfp"
 FEED_ARCH = "armv7"
 BASE_PACKAGE_ARCH = "armv7"
+TARGET_SUB_ARCH = "v7m"
diff --git a/conf/machine/include/tune-cortexr4.inc b/conf/machine/include/tune-cortexr4.inc
index b8bb7f5..524cabd 100644
--- a/conf/machine/include/tune-cortexr4.inc
+++ b/conf/machine/include/tune-cortexr4.inc
@@ -2,3 +2,4 @@
 TARGET_CC_ARCH = "-march=armv7-r -mtune=cortex-r4 -mfpu=vfp -mfloat-abi=softfp"
 FEED_ARCH = "armv7"
 BASE_PACKAGE_ARCH = "armv7"
+TARGET_SUB_ARCH = "v7r"
diff --git a/conf/machine/include/tune-ep9312.inc b/conf/machine/include/tune-ep9312.inc
index 7458281..c2d8e26 100644
--- a/conf/machine/include/tune-ep9312.inc
+++ b/conf/machine/include/tune-ep9312.inc
@@ -4,6 +4,7 @@ TARGET_CC_ARCH = "-mcpu=ep9312 -mfpu=maverick -mfloat-abi=softfp"
 PACKAGE_EXTRA_ARCHS += "armv4t ep9312"
 BASE_PACKAGE_ARCH = "ep9312"
 FEED_ARCH = "ep9312"
+TARGET_SUB_ARCH = "maverick"
 
 FULL_OPTIMIZATION = "-fexpensive-optimizations -fomit-frame-pointer -frename-registers -O -fno-signed-zeros"
 DEBUG_OPTIMIZATION = "-O -fno-omit-frame-pointer -g"
diff --git a/conf/machine/include/tune-geode.inc b/conf/machine/include/tune-geode.inc
index eda332a..8922e8d 100644
--- a/conf/machine/include/tune-geode.inc
+++ b/conf/machine/include/tune-geode.inc
@@ -3,3 +3,4 @@ BASE_PACKAGE_ARCH = "geode"
 PACKAGE_EXTRA_ARCHS += "x86 i386 geode"
 
 FEED_ARCH = "geode"
+TARGET_SUB_ARCH = "geode"
diff --git a/conf/machine/include/tune-i486sx.inc b/conf/machine/include/tune-i486sx.inc
index bd80259..326001f 100644
--- a/conf/machine/include/tune-i486sx.inc
+++ b/conf/machine/include/tune-i486sx.inc
@@ -3,6 +3,7 @@ TARGET_CC_ARCH = "-march=i486"
 PACKAGE_EXTRA_ARCHS = "486sx"
 BASE_PACKAGE_ARCH = "486sx"
 FEED_ARCH = "${BASE_PACKAGE_ARCH}"
+TARGET_SUB_ARCH = "sx"
 
 # gcc doesn't understand softfloat:
 # "This target does not support --with-float"
diff --git a/conf/machine/include/tune-iwmmxt.inc b/conf/machine/include/tune-iwmmxt.inc
index f7291be..8e102b3 100644
--- a/conf/machine/include/tune-iwmmxt.inc
+++ b/conf/machine/include/tune-iwmmxt.inc
@@ -4,4 +4,4 @@ TARGET_CC_ARCH = "-march=iwmmxt -mcpu=iwmmxt -mtune=iwmmxt"
 BASE_PACKAGE_ARCH = "iwmmxt"
 PACKAGE_EXTRA_ARCHS += "armv4 armv4t armv5te iwmmxt"
 FEED_ARCH = "iwmmxt"
-
+TARGET_SUB_ARCH = "iwmmxt"
diff --git a/conf/machine/include/tune-pentium.inc b/conf/machine/include/tune-pentium.inc
index 0df6917..7747da3 100644
--- a/conf/machine/include/tune-pentium.inc
+++ b/conf/machine/include/tune-pentium.inc
@@ -2,3 +2,4 @@ TARGET_CC_ARCH = "-march=pentium"
 BASE_PACKAGE_ARCH = "i586"
 FEED_ARCH = "i586"
 PACKAGE_EXTRA_ARCHS += "x86 i386 i486"
+TARGET_SUB_ARCH = "pentium"
diff --git a/conf/machine/include/tune-pentium4c.inc b/conf/machine/include/tune-pentium4c.inc
index 42de0d9..cf25736 100644
--- a/conf/machine/include/tune-pentium4c.inc
+++ b/conf/machine/include/tune-pentium4c.inc
@@ -1,3 +1,4 @@
 TARGET_CC_ARCH = "-march=prescott"
 BASE_PACKAGE_ARCH = "i686p4c"
 PACKAGE_EXTRA_ARCHS += "x86 i386 i486 i586"
+TARGET_SUB_ARCH = "pentium"
diff --git a/conf/machine/include/tune-pentiummmx.inc b/conf/machine/include/tune-pentiummmx.inc
index 33ef631..14f50db 100644
--- a/conf/machine/include/tune-pentiummmx.inc
+++ b/conf/machine/include/tune-pentiummmx.inc
@@ -2,3 +2,4 @@ TARGET_CC_ARCH = "-march=pentium-mmx"
 BASE_PACKAGE_ARCH = "i586"
 FEED_ARCH = "i586"
 PACKAGE_EXTRA_ARCHS += "i386 i486"
+TARGET_SUB_ARCH = "mmx"
diff --git a/conf/machine/include/tune-pentiumpro.inc b/conf/machine/include/tune-pentiumpro.inc
index 9b9a8be..c76813e 100644
--- a/conf/machine/include/tune-pentiumpro.inc
+++ b/conf/machine/include/tune-pentiumpro.inc
@@ -2,3 +2,4 @@ TARGET_CC_ARCH = "-march=pentiumpro"
 BASE_PACKAGE_ARCH = "i686"
 FEED_ARCH = "i686"
 PACKAGE_EXTRA_ARCHS += "x86 i386 i486 i586"
+TARGET_SUB_ARCH = "pentium"
diff --git a/conf/machine/include/tune-ppc405.inc b/conf/machine/include/tune-ppc405.inc
index e5edd68..93ed735 100644
--- a/conf/machine/include/tune-ppc405.inc
+++ b/conf/machine/include/tune-ppc405.inc
@@ -4,3 +4,4 @@ TARGET_CC_ARCH = "-mcpu=405"
 BASE_PACKAGE_ARCH = "ppc405"
 FEED_ARCH = "ppc405"
 PACKAGE_EXTRA_ARCHS += "ppc405"
+TARGET_SUB_ARCH = "405"
diff --git a/conf/machine/include/tune-ppc440.inc b/conf/machine/include/tune-ppc440.inc
index 1c94a34..506d34d 100644
--- a/conf/machine/include/tune-ppc440.inc
+++ b/conf/machine/include/tune-ppc440.inc
@@ -2,3 +2,4 @@ TARGET_CC_ARCH = "-mcpu=440"
 BASE_PACKAGE_ARCH = "ppc440"
 FEED_ARCH = "ppc440"
 PACKAGE_EXTRA_ARCHS += "${BASE_PACKAGE_ARCH} ppc440e"
+TARGET_SUB_ARCH = "440"
diff --git a/conf/machine/include/tune-ppc440e.inc b/conf/machine/include/tune-ppc440e.inc
index 8b6955a..0094ef2 100644
--- a/conf/machine/include/tune-ppc440e.inc
+++ b/conf/machine/include/tune-ppc440e.inc
@@ -2,3 +2,4 @@ TARGET_CC_ARCH = "-mcpu=440fp -mhard-float"
 BASE_PACKAGE_ARCH = "ppc440e"
 FEED_ARCH = "ppc440e"
 PACKAGE_EXTRA_ARCHS += "ppc440e"
+TARGET_SUB_ARCH = "440e"
diff --git a/conf/machine/include/tune-ppc603e.inc b/conf/machine/include/tune-ppc603e.inc
index a1c62ad..a061acd 100644
--- a/conf/machine/include/tune-ppc603e.inc
+++ b/conf/machine/include/tune-ppc603e.inc
@@ -2,3 +2,4 @@ TARGET_CC_ARCH = "-mcpu=603e"
 BASE_PACKAGE_ARCH = "ppc603e"
 FEED_ARCH = "ppc603e"
 PACKAGE_EXTRA_ARCHS += "ppc603e"
+TARGET_SUB_ARCH = "603e"
diff --git a/conf/machine/include/tune-ppce300c2.inc b/conf/machine/include/tune-ppce300c2.inc
index 1524c7c..34f2f9a 100644
--- a/conf/machine/include/tune-ppce300c2.inc
+++ b/conf/machine/include/tune-ppce300c2.inc
@@ -2,3 +2,4 @@ TARGET_CC_ARCH = "-mcpu=e300c2"
 BASE_PACKAGE_ARCH = "ppce300c2"
 FEED_ARCH = "ppce300c2"
 PACKAGE_EXTRA_ARCHS += "ppce300c2"
+TARGET_SUB_ARCH = "e300c2"
diff --git a/conf/machine/include/tune-ppce300c3.inc b/conf/machine/include/tune-ppce300c3.inc
index 467c4cc..317def3 100644
--- a/conf/machine/include/tune-ppce300c3.inc
+++ b/conf/machine/include/tune-ppce300c3.inc
@@ -2,3 +2,4 @@ TARGET_CC_ARCH = "-mcpu=e300c3"
 BASE_PACKAGE_ARCH = "ppce300c3"
 FEED_ARCH = "ppce300c3"
 PACKAGE_EXTRA_ARCHS += "ppce300c3"
+TARGET_SUB_ARCH = "e300c3"
diff --git a/conf/machine/include/tune-ppce500.inc b/conf/machine/include/tune-ppce500.inc
index 44f8742..2204a33 100644
--- a/conf/machine/include/tune-ppce500.inc
+++ b/conf/machine/include/tune-ppce500.inc
@@ -2,3 +2,4 @@ TARGET_CC_ARCH = "-mcpu=8540"
 BASE_PACKAGE_ARCH = "ppce500"
 FEED_ARCH = "ppce500"
 PACKAGE_EXTRA_ARCHS += "ppce500"
+TARGET_SUB_ARCH = "e500"
diff --git a/conf/machine/include/tune-ppce500v2.inc b/conf/machine/include/tune-ppce500v2.inc
index 73d8e92..20628fe 100644
--- a/conf/machine/include/tune-ppce500v2.inc
+++ b/conf/machine/include/tune-ppce500v2.inc
@@ -2,3 +2,4 @@ TARGET_CC_ARCH = "-mcpu=8548 -mspe=yes -mabi=spe -mhard-float -mfloat-gprs=doubl
 BASE_PACKAGE_ARCH = "ppce500v2"
 FEED_ARCH = "ppce500v2"
 PACKAGE_EXTRA_ARCHS += "ppce500v2"
+TARGET_SUB_ARCH = "e500v2"
diff --git a/conf/machine/include/tune-ppce600.inc b/conf/machine/include/tune-ppce600.inc
index 77a7cb8..b5f2d0d 100644
--- a/conf/machine/include/tune-ppce600.inc
+++ b/conf/machine/include/tune-ppce600.inc
@@ -2,3 +2,4 @@ TARGET_CC_ARCH = "-mcpu=7450"
 BASE_PACKAGE_ARCH = "ppce600"
 FEED_ARCH = "ppce600"
 PACKAGE_EXTRA_ARCHS += "ppce600"
+TARGET_SUB_ARCH = "e600"
diff --git a/conf/machine/include/tune-sh3.inc b/conf/machine/include/tune-sh3.inc
index 32801a6..a8b192e 100644
--- a/conf/machine/include/tune-sh3.inc
+++ b/conf/machine/include/tune-sh3.inc
@@ -1,3 +1,4 @@
 TARGET_CC_ARCH = "-ml -m3"
 FEED_ARCH = "sh3"
 BASE_PACKAGE_ARCH = "sh3"
+TARGET_SUB_ARCH = "m3"
diff --git a/conf/machine/include/tune-sh4.inc b/conf/machine/include/tune-sh4.inc
index 5d43e41..ec6b547 100644
--- a/conf/machine/include/tune-sh4.inc
+++ b/conf/machine/include/tune-sh4.inc
@@ -1,3 +1,4 @@
 TARGET_CC_ARCH = "-ml -m4"
 FEED_ARCH = "sh4"
 BASE_PACKAGE_ARCH = "sh4"
+TARGET_SUB_ARCH = "m4"
diff --git a/conf/machine/include/tune-strongarm.inc b/conf/machine/include/tune-strongarm.inc
index fe57c9c..0967fbd 100644
--- a/conf/machine/include/tune-strongarm.inc
+++ b/conf/machine/include/tune-strongarm.inc
@@ -6,3 +6,4 @@ TARGET_CC_ARCH = "-march=armv4 -mtune=strongarm"
 FEED_ARCH = "armv4"
 BASE_PACKAGE_ARCH = "armv4" 
 PACKAGE_EXTRA_ARCHS += "armv4"
+TARGET_SUB_ARCH = "v4"
diff --git a/conf/machine/include/tune-supersparc.inc b/conf/machine/include/tune-supersparc.inc
index a402e7c..699534e 100644
--- a/conf/machine/include/tune-supersparc.inc
+++ b/conf/machine/include/tune-supersparc.inc
@@ -1,3 +1,4 @@
 TARGET_CC_ARCH = "-mcpu=supersparc"
 BASE_PACKAGE_ARCH = "supersparc"
 FEED_ARCH = "supersparc" 
+TARGET_SUB_ARCH = "supersparc"
diff --git a/conf/machine/include/tune-xscale.inc b/conf/machine/include/tune-xscale.inc
index f0f58bc..8cb22cd 100644
--- a/conf/machine/include/tune-xscale.inc
+++ b/conf/machine/include/tune-xscale.inc
@@ -7,3 +7,4 @@ TARGET_CC_ARCH = "-march=armv5te -mtune=xscale"
 TARGET_CC_KERNEL_ARCH = "-march=armv5te -mtune=xscale"
 PACKAGE_EXTRA_ARCHS += "${@['armv4b armv4tb armv5teb', 'armv4 armv4t armv5te'][ bb.data.getVar('TARGET_ARCH', d, 1) == 'arm']}"
 BASE_PACKAGE_ARCH = "${@['armv5teb', 'armv5te'][bb.data.getVar('TARGET_ARCH', d, 1) == 'arm']}"
+TARGET_SUB_ARCH = "${@['v5teb', 'v5te'][bb.data.getVar('TARGET_ARCH', d, 1) == 'arm']}"
-- 
1.7.1



