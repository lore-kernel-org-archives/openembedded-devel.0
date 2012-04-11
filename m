Received: from sanddollar.geekisp.com ([216.168.135.167])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philip@balister.org>) id 1SI6wv-0004eg-N6
	for openembedded-devel@openembedded.org; Thu, 12 Apr 2012 01:27:41 +0200
Received: (qmail 17068 invoked by uid 1003); 11 Apr 2012 23:11:41 -0000
Received: from unknown (HELO localhost.localdomain)
	(philip@balister.org@157.22.28.13)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	11 Apr 2012 23:11:41 -0000
From: philip@balister.org
To: openembedded-devel@openembedded.org
Date: Wed, 11 Apr 2012 16:11:31 -0700
Message-Id: <1334185891-25460-6-git-send-email-philip@balister.org>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <1334185891-25460-1-git-send-email-philip@balister.org>
References: <1334185891-25460-1-git-send-email-philip@balister.org>
Cc: Philip Balister <philip@opensdr.com>
Subject: [meta-oe 5/5] gnuradio : Remove old files.
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
X-List-Received-Date: Wed, 11 Apr 2012 23:27:42 -0000

From: Philip Balister <philip@opensdr.com>

Left the buildsys patch for now. It does not apply, but I have only
built this with gcc-4.6 from toolchain layer, not gcc from Angstrom.
The patch does not apply, but I am saving it to remind me how to fix
the problem.

Signed-off-by: Philip Balister <philip@opensdr.com>
---
 meta-oe/recipes-connectivity/gnuradio/gnuradio.inc |   48 --------------------
 ...-all-traces-of-volk-from-configure-for-OE.patch |   42 -----------------
 2 files changed, 0 insertions(+), 90 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/gnuradio/gnuradio.inc
 delete mode 100644 meta-oe/recipes-connectivity/gnuradio/gnuradio/0001-volk-Remove-all-traces-of-volk-from-configure-for-OE.patch

diff --git a/meta-oe/recipes-connectivity/gnuradio/gnuradio.inc b/meta-oe/recipes-connectivity/gnuradio/gnuradio.inc
deleted file mode 100644
index 144d588..0000000
--- a/meta-oe/recipes-connectivity/gnuradio/gnuradio.inc
+++ /dev/null
@@ -1,48 +0,0 @@
-DESCRIPTION = "GNU Radio"
-HOMEPAGE = "http://gnuradio.org"
-LICENSE = "GPLv3"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
-
-DEPENDS = "uhd virtual/libsdl gsl guile-native fftwf python alsa-lib boost cppunit swig-native python-numpy"
-
-INC_PR = "r1"
-
-inherit distutils-base autotools pkgconfig
-
-export BUILD_SYS
-export HOST_SYS="${MULTIMACH_TARGET_SYS}"
-
-EXTRA_OECONF = " \
-  --program-prefix= \
-  --disable-gr-atsc \
-  --enable-gr-audio-alsa  \
-  --disable-gr-audio-jack \
-  --disable-html-docs \
-  --with-boost=${STAGING_DIR_TARGET}/usr \
-  --disable-usrp1 \
-  --disable-usrp2 \
-  --with-pythondir=${PYTHON_SITEPACKAGES_DIR} \
-  PYTHON_CPPFLAGS=-I${STAGING_INCDIR}/${PYTHON_DIR} \
-"
-
-RDEPENDS_${PN} = "python-core python-audio python-threading python-codecs python-lang python-textutils \
-                  python-shell python-pickle python-compiler python-pkgutil python-pydoc python-mmap \
-                  python-netclient python-unittest python-difflib python-pprint python-numpy \
-"
-
-PACKAGES =+ "\
-  ${PN}-examples \
-  ${PN}-grc \
-  ${PN}-conf \
-"
-
-FILES_${PN}-examples = "${datadir}/gnuradio/examples"
-FILES_${PN}-grc = "${datadir}/gnuradio/grc"
-FILES_${PN}-conf = "${sysconfdir}/gnuradio"
-
-FILES_${PN} += "${datadir}/gnuradio"
-FILES_${PN} += "${PYTHON_SITEPACKAGES_DIR}/gnuradio/*"
-FILES_${PN}-dbg += "${PYTHON_SITEPACKAGES_DIR}/gnuradio/.debug \
-                    ${PYTHON_SITEPACKAGES_DIR}/gnuradio/*/.debug \
-		   "
-
diff --git a/meta-oe/recipes-connectivity/gnuradio/gnuradio/0001-volk-Remove-all-traces-of-volk-from-configure-for-OE.patch b/meta-oe/recipes-connectivity/gnuradio/gnuradio/0001-volk-Remove-all-traces-of-volk-from-configure-for-OE.patch
deleted file mode 100644
index e2f674b..0000000
--- a/meta-oe/recipes-connectivity/gnuradio/gnuradio/0001-volk-Remove-all-traces-of-volk-from-configure-for-OE.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 857c38eb8201e2a34b524fcabea21b1accbdb288 Mon Sep 17 00:00:00 2001
-From: Philip Balister <philip@opensdr.com>
-Date: Fri, 13 May 2011 12:26:14 -0400
-Subject: [PATCH] volk : Remove all traces of volk from configure for OE builds.
-
-Signed-off-by: Philip Balister <philip@opensdr.com>
----
- Makefile.common |    4 ++--
- configure.ac    |    2 +-
- 2 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/Makefile.common b/Makefile.common
-index 20b8a78..aeda1dd 100644
---- a/Makefile.common
-+++ b/Makefile.common
-@@ -92,8 +92,8 @@ GRUEL_INCLUDES = @gruel_INCLUDES@
- GRUEL_LA = @gruel_LA@
- 
- # How to link in the VOLK library from inside the tree
--VOLK_INCLUDES = @volk_INCLUDES@
--VOLK_LA = @volk_LA@
-+#VOLK_INCLUDES = @volk_INCLUDES@
-+#VOLK_LA = @volk_LA@
- 
- # How to link in the USRP library from inside the tree
- USRP_INCLUDES = @usrp_INCLUDES@
-diff --git a/configure.ac b/configure.ac
-index 73ebbd6..e5cf7a2 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -349,7 +349,7 @@ AC_ARG_ENABLE(
- 
- build_dirs="config"
- GRC_GRUEL                       dnl must come first
--GRC_VOLK
-+dnl GRC_VOLK
- GRC_GCELL
- GRC_GNURADIO_CORE
- GRC_USRP
--- 
-1.7.3.4
-
-- 
1.7.7.6



