Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1U62LN-00063O-75
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Feb 2013 18:12:23 +0100
Received: from puchatek.dom (87-206-60-225.dynamic.chello.pl [87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 9D4EED22B4;
	Thu, 14 Feb 2013 17:55:33 +0100 (CET)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 14 Feb 2013 17:55:28 +0100
Message-Id: <1360860928-2466-1-git-send-email-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 1.8.1.2
Subject: [meta-oe][PATCH] python-numpy: update to 1.7.0
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
X-List-Received-Date: Thu, 14 Feb 2013 17:12:27 -0000

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 .../python/python-numpy/aarch64.patch              | 41 ----------------------
 ...hon-numpy_1.7.0rc1.bb => python-numpy_1.7.0.bb} | 17 ++++-----
 2 files changed, 7 insertions(+), 51 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/python/python-numpy/aarch64.patch
 rename meta-oe/recipes-devtools/python/{python-numpy_1.7.0rc1.bb => python-numpy_1.7.0.bb} (81%)

diff --git a/meta-oe/recipes-devtools/python/python-numpy/aarch64.patch b/meta-oe/recipes-devtools/python/python-numpy/aarch64.patch
deleted file mode 100644
index 8d66615..0000000
--- a/meta-oe/recipes-devtools/python/python-numpy/aarch64.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 7d7a5939dcf5821d9f381d57bfa2012568ef6b82 Mon Sep 17 00:00:00 2001
-From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
-Date: Thu, 10 Jan 2013 21:49:01 +0100
-Subject: [PATCH] Added support for AArch64 architecture
-
-Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
-
-Upstream-Status: backport
----
- numpy/core/include/numpy/npy_cpu.h    | 2 ++
- numpy/core/include/numpy/npy_endian.h | 1 +
- 2 files changed, 3 insertions(+)
-
-diff --git a/numpy/core/include/numpy/npy_cpu.h b/numpy/core/include/numpy/npy_cpu.h
-index 8a29788..9707a7a 100644
---- a/numpy/core/include/numpy/npy_cpu.h
-+++ b/numpy/core/include/numpy/npy_cpu.h
-@@ -66,6 +66,8 @@
-     #define NPY_CPU_MIPSEL
- #elif defined(__MIPSEB__)
-     #define NPY_CPU_MIPSEB
-+#elif defined(__aarch64__)
-+    #define NPY_CPU_AARCH64
- #else
-     #error Unknown CPU, please report this to numpy maintainers with \
-     information about your platform (OS, CPU and compiler)
-diff --git a/numpy/core/include/numpy/npy_endian.h b/numpy/core/include/numpy/npy_endian.h
-index aa5ed8b..4e3349f 100644
---- a/numpy/core/include/numpy/npy_endian.h
-+++ b/numpy/core/include/numpy/npy_endian.h
-@@ -25,6 +25,7 @@
-             || defined(NPY_CPU_IA64)    \
-             || defined(NPY_CPU_ALPHA)   \
-             || defined(NPY_CPU_ARMEL)   \
-+            || defined(NPY_CPU_AARCH64) \
-             || defined(NPY_CPU_SH_LE)   \
-             || defined(NPY_CPU_MIPSEL)
-         #define NPY_BYTE_ORDER NPY_LITTLE_ENDIAN
--- 
-1.8.0
-
diff --git a/meta-oe/recipes-devtools/python/python-numpy_1.7.0rc1.bb b/meta-oe/recipes-devtools/python/python-numpy_1.7.0.bb
similarity index 81%
rename from meta-oe/recipes-devtools/python/python-numpy_1.7.0rc1.bb
rename to meta-oe/recipes-devtools/python/python-numpy_1.7.0.bb
index 2e4bd6a..bbe4e63 100644
--- a/meta-oe/recipes-devtools/python/python-numpy_1.7.0rc1.bb
+++ b/meta-oe/recipes-devtools/python/python-numpy_1.7.0.bb
@@ -2,14 +2,10 @@ DESCRIPTION = "A sophisticated Numeric Processing Package for Python"
 SECTION = "devel/python"
 LICENSE = "PSF"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=f87832d854acbade6e9f5c601c8b30b1"
-PR = "r0"
-PV = "1.6.99+1.7.0rc1"
-REALPV = "1.7.0rc1"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/numpy/numpy-${REALPV}.tar.gz \
-           ${CONFIGFILESURI} \
-           file://aarch64.patch \
-	  "
+SRC_URI = "${SOURCEFORGE_MIRROR}/numpy/numpy-${PV}.tar.gz \
+           ${CONFIGFILESURI} "
+
 CONFIGFILESURI ?= ""
 
 CONFIGFILESURI_aarch64 = "file://config.h \
@@ -22,7 +18,7 @@ CONFIGFILESURI_mipsel = "file://config.h \
 	   file://numpyconfig.h \
 	  "
 
-S = "${WORKDIR}/numpy-${REALPV}"
+S = "${WORKDIR}/numpy-${PV}"
 
 inherit distutils
 
@@ -36,8 +32,9 @@ do_compile_prepend() {
 }
 
 FILES_${PN}-staticdev += "${PYTHON_SITEPACKAGES_DIR}/numpy/core/lib/*.a"
-SRC_URI[md5sum] = "a4719f5a1853bc0f8892a5956d5c4229"
-SRC_URI[sha256sum] = "45ea23622f72d86bc3614446d668ee962c0475ee7b91a93ef85a5e0493962de5"
+
+SRC_URI[md5sum] = "4fa54e40b6a243416f0248123b6ec332"
+SRC_URI[sha256sum] = "f4fa70b7edbab65ee6432eb63743f5489f1919c614632b20b2fb45aa7e682ac6"
 
 # install what is needed for numpy.test()
 RDEPENDS_${PN} = "python-unittest \
-- 
1.8.1.2



