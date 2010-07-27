Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OddyO-0001Ob-FR
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Jul 2010 08:49:14 +0200
Received: by iwn34 with SMTP id 34so3565424iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jul 2010 23:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=aOCdy6o16Wx/Vey1JDFZwRh2Kurzz6FJWWMglfJPnpE=;
	b=F1Ar6P5fwaNk03xmJqnv/iIxqckH+/FsH2VBBv/88dxJ5Ei+iPk1mjE314XC6I1mHs
	yoSqEggIO2+Lv3O/XSYfP9rGE9+rc4oLDgxa2V6BDZ+q710WWoTpLLteNnGUaFEs616r
	ILA2B+yjcfmOAATNw+QZ4mS0yfjlsnrXUoYEc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=XQUEHKhXTm49lmN2P/2leboMgsSweT6gxPUl71kSpygqSVd86YHUQT9wCyp9dW0NzL
	CYP/Xh0MEpDh22unLvQ8WUMguYFij2jCXe0ocXGlCrDphdj2sRlwPP928oTwx4sC+lmN
	8Vj4bTu/wbVEmBXVoUqcgDjTvbArHV1bKpA+w=
Received: by 10.231.191.6 with SMTP id dk6mr9890037ibb.51.1280213332787;
	Mon, 26 Jul 2010 23:48:52 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id n20sm4506941ibe.5.2010.07.26.23.48.51
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 26 Jul 2010 23:48:52 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 26 Jul 2010 23:48:34 -0700
Message-Id: <1280213315-5513-8-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1280213315-5513-1-git-send-email-raj.khem@gmail.com>
References: <1280213315-5513-1-git-send-email-raj.khem@gmail.com>
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS,
	UPPERCASE_50_75 autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 7/8] recipes: Replace usage of MULTIMACH_TARGET_SYS with CURRENT_TARGET_SYS
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
X-List-Received-Date: Tue, 27 Jul 2010 06:49:14 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes/gnuradio/gnuradio-libusb-compat.inc     |    2 +-
 recipes/gnuradio/gnuradio.inc                   |    2 +-
 recipes/opencv/opencv-dsp-acceleration_svn.bb   |    2 +-
 recipes/ti/README                               |    3 +-
 recipes/ti/ti-paths.inc                         |   34 +++++++++++-----------
 recipes/ti/ti-staging.inc                       |    4 +-
 recipes/xapian/xapian-bindings-python_1.0.14.bb |    2 +-
 7 files changed, 24 insertions(+), 25 deletions(-)

diff --git a/recipes/gnuradio/gnuradio-libusb-compat.inc b/recipes/gnuradio/gnuradio-libusb-compat.inc
index efe2b88..aa4d41a 100644
--- a/recipes/gnuradio/gnuradio-libusb-compat.inc
+++ b/recipes/gnuradio/gnuradio-libusb-compat.inc
@@ -8,7 +8,7 @@ INC_PR = "r7"
 inherit distutils-base autotools autotools_stage pkgconfig
 
 export BUILD_SYS
-export HOST_SYS=${MULTIMACH_TARGET_SYS}
+export HOST_SYS
 
 CXXFLAGS_powerpc += "-lstdc++"
 
diff --git a/recipes/gnuradio/gnuradio.inc b/recipes/gnuradio/gnuradio.inc
index 6eaf119..1a08930 100644
--- a/recipes/gnuradio/gnuradio.inc
+++ b/recipes/gnuradio/gnuradio.inc
@@ -8,7 +8,7 @@ INC_PR = "r7"
 inherit distutils-base autotools autotools_stage pkgconfig
 
 export BUILD_SYS
-export HOST_SYS=${MULTIMACH_TARGET_SYS}
+export HOST_SYS
 
 CXXFLAGS_powerpc += "-lstdc++"
 
diff --git a/recipes/opencv/opencv-dsp-acceleration_svn.bb b/recipes/opencv/opencv-dsp-acceleration_svn.bb
index 788e8e2..1a2d7bb 100644
--- a/recipes/opencv/opencv-dsp-acceleration_svn.bb
+++ b/recipes/opencv/opencv-dsp-acceleration_svn.bb
@@ -22,7 +22,7 @@ export OPENCV_PATH = "${STAGING_INCDIR}"
 export DSPLIB_PATH = "${DSPLIB_INSTALL_DIR}"
 
 # You need to extract the imglib from the .exe manually and place it in /OE/tmp (or somewhere else and change the patch below)
-export IMGLIB_PATH = "${STAGING_DIR}/${MULTIMACH_TARGET_SYS}${installdir}/imglib_v201"
+export IMGLIB_PATH = "${STAGING_DIR}/${MACHINE_SYS}${installdir}/imglib_v201"
 
 do_configure() {
 	echo "-l ${DSPLIB_INSTALL_DIR}/dsplib64plus.lib" >> ${S}/beagle/server/opencv_unitserver_evm3530/link.cmd
diff --git a/recipes/ti/README b/recipes/ti/README
index 2fbb9f1..9a36f70 100644
--- a/recipes/ti/README
+++ b/recipes/ti/README
@@ -29,13 +29,12 @@ Since most of the recipes in this directory deal with a DSP (e.g OMAP3) or accel
 The complete unpacked trees are staged to staging/machine/usr/share/ti/${PN}(-tree) and all the _INSTALL_DIR vars will point to that. To make this work there is a ti-staging.inc which contains:
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
-BASEPKG_HOST_SYS = "${MULTIMACH_HOST_SYS}"
 PACKAGE_STRIP = "no"
 
 The 'BASEPKG_HOST_SYS' bit is what makes it work, but cause trouble is you want to read from it, so ti-paths.inc does:
 
 export CODEGEN_INSTALL_DIR_RECIPE    = "${installdir}/ti-cgt6x"
-export CODEGEN_INSTALL_DIR    = "${STAGING_DIR}/${MULTIMACH_TARGET_SYS}/${CODEGEN_INSTALL_DIR_RECIPE}"
+export CODEGEN_INSTALL_DIR    = "${STAGING_DIR}/${MACHINE_SYS}/${CODEGEN_INSTALL_DIR_RECIPE}"
 
 Which will point it to the machine specific staging like we want it to.
 
diff --git a/recipes/ti/ti-paths.inc b/recipes/ti/ti-paths.inc
index 27400a1..de8893a 100644
--- a/recipes/ti/ti-paths.inc
+++ b/recipes/ti/ti-paths.inc
@@ -22,23 +22,23 @@ export BIOSPSP_INSTALL_DIR_RECIPE    = "${installdir}/ti-biospsp-tree"
 export AUDIO_SOC_INSTALL_DIR_RECIPE  = "${installdir}/ti-audio-soc-example-tree"
 
 # This is where the tools will end up in staging provided PACKAGE_ARCH = ${MACHINE_ARCH} is set
-export CODEGEN_INSTALL_DIR    = "${STAGING_DIR}/${MULTIMACH_TARGET_SYS}${CODEGEN_INSTALL_DIR_RECIPE}"
-export XDC_INSTALL_DIR        = "${STAGING_DIR}/${MULTIMACH_TARGET_SYS}${XDC_INSTALL_DIR_RECIPE}"
-export XDAIS_INSTALL_DIR      = "${STAGING_DIR}/${MULTIMACH_TARGET_SYS}${XDAIS_INSTALL_DIR_RECIPE}"
-export BIOS_INSTALL_DIR       = "${STAGING_DIR}/${MULTIMACH_TARGET_SYS}${BIOS_INSTALL_DIR_RECIPE}"
-export SYSBIOS_INSTALL_DIR    = "${STAGING_DIR}/${MULTIMACH_TARGET_SYS}${SYSBIOS_INSTALL_DIR_RECIPE}"
-export BIOSUTILS_INSTALL_DIR  = "${STAGING_DIR}/${MULTIMACH_TARGET_SYS}${BIOSUTILS_INSTALL_DIR_RECIPE}"
-export FC_INSTALL_DIR         = "${STAGING_DIR}/${MULTIMACH_TARGET_SYS}${FC_INSTALL_DIR_RECIPE}"
-export CE_INSTALL_DIR         = "${STAGING_DIR}/${MULTIMACH_TARGET_SYS}${CE_INSTALL_DIR_RECIPE}"
-export EDMA3_LLD_INSTALL_DIR  = "${STAGING_DIR}/${MULTIMACH_TARGET_SYS}${EDMA3_LLD_INSTALL_DIR_RECIPE}"
-export LINUXUTILS_INSTALL_DIR = "${STAGING_DIR}/${MULTIMACH_TARGET_SYS}${LINUXUTILS_INSTALL_DIR_RECIPE}"
-export CMEM_INSTALL_DIR       = "${STAGING_DIR}/${MULTIMACH_TARGET_SYS}${CMEM_INSTALL_DIR_RECIPE}"
-export LINK_INSTALL_DIR       = "${STAGING_DIR}/${MULTIMACH_TARGET_SYS}${LINK_INSTALL_DIR_RECIPE}"
-export LPM_INSTALL_DIR        = "${STAGING_DIR}/${MULTIMACH_TARGET_SYS}${LPM_INSTALL_DIR_RECIPE}"
-export DMAI_INSTALL_DIR       = "${STAGING_DIR}/${MULTIMACH_TARGET_SYS}${DMAI_INSTALL_DIR_RECIPE}"
-export CODEC_INSTALL_DIR      = "${STAGING_DIR}/${MULTIMACH_TARGET_SYS}${CODEC_INSTALL_DIR_RECIPE}"
-export DSPLIB_INSTALL_DIR     = "${STAGING_DIR}/${MULTIMACH_TARGET_SYS}${DSPLIB_INSTALL_DIR_RECIPE}"
-export BIOSPSP_INSTALL_DIR    = "${STAGING_DIR}/${MULTIMACH_TARGET_SYS}${BIOSPSP_INSTALL_DIR_RECIPE}"
+export CODEGEN_INSTALL_DIR    = "${STAGING_DIR}/${CURRENT_TARGET_SYS}${CODEGEN_INSTALL_DIR_RECIPE}"
+export XDC_INSTALL_DIR        = "${STAGING_DIR}/${CURRENT_TARGET_SYS}${XDC_INSTALL_DIR_RECIPE}"
+export XDAIS_INSTALL_DIR      = "${STAGING_DIR}/${CURRENT_TARGET_SYS}${XDAIS_INSTALL_DIR_RECIPE}"
+export BIOS_INSTALL_DIR       = "${STAGING_DIR}/${CURRENT_TARGET_SYS}${BIOS_INSTALL_DIR_RECIPE}"
+export SYSBIOS_INSTALL_DIR    = "${STAGING_DIR}/${CURRENT_TARGET_SYS}${SYSBIOS_INSTALL_DIR_RECIPE}"
+export BIOSUTILS_INSTALL_DIR  = "${STAGING_DIR}/${CURRENT_TARGET_SYS}${BIOSUTILS_INSTALL_DIR_RECIPE}"
+export FC_INSTALL_DIR         = "${STAGING_DIR}/${CURRENT_TARGET_SYS}${FC_INSTALL_DIR_RECIPE}"
+export CE_INSTALL_DIR         = "${STAGING_DIR}/${CURRENT_TARGET_SYS}${CE_INSTALL_DIR_RECIPE}"
+export EDMA3_LLD_INSTALL_DIR  = "${STAGING_DIR}/${CURRENT_TARGET_SYS}${EDMA3_LLD_INSTALL_DIR_RECIPE}"
+export LINUXUTILS_INSTALL_DIR = "${STAGING_DIR}/${CURRENT_TARGET_SYS}${LINUXUTILS_INSTALL_DIR_RECIPE}"
+export CMEM_INSTALL_DIR       = "${STAGING_DIR}/${CURRENT_TARGET_SYS}${CMEM_INSTALL_DIR_RECIPE}"
+export LINK_INSTALL_DIR       = "${STAGING_DIR}/${CURRENT_TARGET_SYS}${LINK_INSTALL_DIR_RECIPE}"
+export LPM_INSTALL_DIR        = "${STAGING_DIR}/${CURRENT_TARGET_SYS}${LPM_INSTALL_DIR_RECIPE}"
+export DMAI_INSTALL_DIR       = "${STAGING_DIR}/${CURRENT_TARGET_SYS}${DMAI_INSTALL_DIR_RECIPE}"
+export CODEC_INSTALL_DIR      = "${STAGING_DIR}/${CURRENT_TARGET_SYS}${CODEC_INSTALL_DIR_RECIPE}"
+export DSPLIB_INSTALL_DIR     = "${STAGING_DIR}/${CURRENT_TARGET_SYS}${DSPLIB_INSTALL_DIR_RECIPE}"
+export BIOSPSP_INSTALL_DIR    = "${STAGING_DIR}/${CURRENT_TARGET_SYS}${BIOSPSP_INSTALL_DIR_RECIPE}"
 
 DSPSUFFIX_omapl137 = "x674"
 DSPSUFFIX_omapl138 = "x674"
diff --git a/recipes/ti/ti-staging.inc b/recipes/ti/ti-staging.inc
index 593f094..c32f01c 100644
--- a/recipes/ti/ti-staging.inc
+++ b/recipes/ti/ti-staging.inc
@@ -1,10 +1,10 @@
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 # Allow staging into machine specific dir
-BASEPKG_HOST_SYS = "${MULTIMACH_HOST_SYS}"
+HOST_SYS = "${CURRENT_TARGET_SYS}"
 
 # Search archdir for shlibs instead of machine dir due to above BASEPKG_HOST_SYS
-SHLIBSDIR = "${STAGING_DIR}/${BASE_PACKAGE_ARCH}${HOST_VENDOR}-${HOST_OS}/shlibs"
+SHLIBSDIR = "${STAGING_DIR}/${HOST_SYS}/shlibs"
 
 PACKAGE_STRIP = "no"
 
diff --git a/recipes/xapian/xapian-bindings-python_1.0.14.bb b/recipes/xapian/xapian-bindings-python_1.0.14.bb
index ae97779..6c24e2d 100644
--- a/recipes/xapian/xapian-bindings-python_1.0.14.bb
+++ b/recipes/xapian/xapian-bindings-python_1.0.14.bb
@@ -18,7 +18,7 @@ EXTRA_OECONF = "--with-python --without-php --without-ruby --without-tcl \
                 --without-csharp --without-java"
 
 do_configure () {
-        BUILD_SYS=${BUILD_SYS} HOST_SYS=${MULTIMACH_HOST_SYS} \
+        BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
         autotools_do_configure
 }
 
-- 
1.7.1



