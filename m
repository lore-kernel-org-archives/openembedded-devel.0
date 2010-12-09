Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <obi@opendreambox.org>) id 1PQjvy-00008p-R4
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Dec 2010 18:05:37 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id 58DA7314B04A
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Dec 2010 18:04:06 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id z-MGXj3YxRFT
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Dec 2010 18:03:58 +0100 (CET)
Received: from pepe.multimedia-labs.de (dreamboxupdate.com [82.149.226.174])
	by mail.multimedia-labs.de (Postfix) with SMTP id 6E060314B8DE
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Dec 2010 18:03:54 +0100 (CET)
Received: by pepe.multimedia-labs.de (sSMTP sendmail emulation);
	Thu, 09 Dec 2010 17:03:54 +0000
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  9 Dec 2010 17:03:46 +0000
Message-Id: <1291914227-25068-7-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <1291914227-25068-1-git-send-email-obi@opendreambox.org>
References: <1291914227-25068-1-git-send-email-obi@opendreambox.org>
X-SA-Exim-Connect-IP: 82.149.226.172
X-SA-Exim-Mail-From: obi@opendreambox.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 7/8] gst-plugins-ugly: remove unpinned versions
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
X-List-Received-Date: Thu, 09 Dec 2010 17:05:37 -0000

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 .../gst-plugins-ugly-sid/gstsid_autofoo_HACK.patch |  107 --------------------
 recipes/gstreamer/gst-plugins-ugly-sid_0.10.7.bb   |   21 ----
 recipes/gstreamer/gst-plugins-ugly_0.10.10.bb      |   21 ----
 recipes/gstreamer/gst-plugins-ugly_0.10.11.bb      |   21 ----
 recipes/gstreamer/gst-plugins-ugly_0.10.14.bb      |   21 ----
 recipes/gstreamer/gst-plugins-ugly_0.10.15.bb      |   20 ----
 6 files changed, 0 insertions(+), 211 deletions(-)
 delete mode 100644 recipes/gstreamer/gst-plugins-ugly-sid/gstsid_autofoo_HACK.patch
 delete mode 100644 recipes/gstreamer/gst-plugins-ugly-sid_0.10.7.bb
 delete mode 100644 recipes/gstreamer/gst-plugins-ugly_0.10.10.bb
 delete mode 100644 recipes/gstreamer/gst-plugins-ugly_0.10.11.bb
 delete mode 100644 recipes/gstreamer/gst-plugins-ugly_0.10.14.bb
 delete mode 100644 recipes/gstreamer/gst-plugins-ugly_0.10.15.bb

diff --git a/recipes/gstreamer/gst-plugins-ugly-sid/gstsid_autofoo_HACK.patch b/recipes/gstreamer/gst-plugins-ugly-sid/gstsid_autofoo_HACK.patch
deleted file mode 100644
index 963ddde..0000000
--- a/recipes/gstreamer/gst-plugins-ugly-sid/gstsid_autofoo_HACK.patch
+++ /dev/null
@@ -1,107 +0,0 @@
-Index: gst-plugins-ugly-0.10.7/m4/gst-sid.m4
-===================================================================
---- gst-plugins-ugly-0.10.7.orig/m4/gst-sid.m4
-+++ gst-plugins-ugly-0.10.7/m4/gst-sid.m4
-@@ -16,14 +16,7 @@ if test $HAVE_SIDPLAY = "yes"; then
- 
-   LIBS="-lsidplay"
- 
--  AC_TRY_RUN([
--    #include <sidplay/player.h>
--    int main()
--    { sidTune tune = sidTune(0);  }
--    ],
--    HAVE_SIDPLAY="yes",
--    HAVE_SIDPLAY="no",
--    HAVE_SIDPLAY="no")
-+  HAVE_SIDPLAY="yes"
- 
-   LIBS="$ac_libs_safe"
- 
-Index: gst-plugins-ugly-0.10.7/ext/Makefile.am
-===================================================================
---- gst-plugins-ugly-0.10.7.orig/ext/Makefile.am
-+++ gst-plugins-ugly-0.10.7/ext/Makefile.am
-@@ -1,67 +1,5 @@
--if USE_A52DEC
--A52DEC_DIR = a52dec
--else
--A52DEC_DIR =
--endif
--
--if USE_AMRNB
-- AMRNB_DIR = amrnb
--else
-- AMRNB_DIR =
--endif
--
--if USE_DVDREAD
-- DVDREAD_DIR = dvdread
--else
-- DVDREAD_DIR =
--endif
--
--if USE_DVDNAV
-- DVDNAV_DIR = dvdnav
--else
-- DVDNAV_DIR =
--endif
--
--if USE_LAME
--LAME_DIR = lame
--else
--LAME_DIR =
--endif
--
--if USE_MAD
--MAD_DIR = mad
--else
--MAD_DIR =
--endif
--
--if USE_MPEG2DEC
--MPEG2DEC_DIR = mpeg2dec
--else
--MPEG2DEC_DIR =
--endif
--
--if USE_SIDPLAY
- SIDPLAY_DIR = sidplay
--else
--SIDPLAY_DIR =
--endif
- 
--SUBDIRS = \
--	$(A52DEC_DIR) \
--	$(AMRNB_DIR) \
--	$(DVDREAD_DIR) \
--	$(DVDNAV_DIR) \
--	$(LAME_DIR) \
--	$(MAD_DIR) \
--	$(MPEG2DEC_DIR) \
--	$(SIDPLAY_DIR)
-+SUBDIRS = sidplay
- 
--DIST_SUBDIRS = \
--	a52dec \
--	amrnb \
--	dvdnav \
--	dvdread \
--	lame \
--	mad \
--	mpeg2dec \
--	sidplay
-+DIST_SUBDIRS = sidplay
-Index: gst-plugins-ugly-0.10.7/Makefile.am
-===================================================================
---- gst-plugins-ugly-0.10.7.orig/Makefile.am
-+++ gst-plugins-ugly-0.10.7/Makefile.am
-@@ -1,7 +1,7 @@
- DISTCHECK_CONFIGURE_FLAGS=--enable-gtk-doc
- 
- SUBDIRS = \
--	gst-libs gst ext docs m4 tests common po
-+	ext docs m4 tests common po
- 
- # include before EXTRA_DIST for win32 assignment
- include $(top_srcdir)/common/win32.mak
diff --git a/recipes/gstreamer/gst-plugins-ugly-sid_0.10.7.bb b/recipes/gstreamer/gst-plugins-ugly-sid_0.10.7.bb
deleted file mode 100644
index 5c446e6..0000000
--- a/recipes/gstreamer/gst-plugins-ugly-sid_0.10.7.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-require gst-plugins.inc
-DEPENDS += "gst-plugins-base libsidplay"
-PROVIDES += "gst-plugin-sid"
-
-PR = "${INC_PR}.1"
-
-SRC_URI = "\
-  http://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.bz2 \
-  file://gstsid_autofoo_HACK.patch \
-"
-S = "${WORKDIR}/gst-plugins-ugly-${PV}"
-
-python() {
-    # Don't build, if we are building an ENTERPRISE distro
-    enterprise = bb.data.getVar("ENTERPRISE_DISTRO", d, 1)
-    if enterprise != "1":
-            raise bb.parse.SkipPackage("gst-plugins-ugly-sid will only build if ENTERPRISE_DISTRO == 1")
-}
-
-SRC_URI[md5sum] = "cff4f55138d12152cf580a3ee71c2519"
-SRC_URI[sha256sum] = "556ba24072bdb32ee568adc682d69add1241d77936bc9563e50cdb953097be35"
diff --git a/recipes/gstreamer/gst-plugins-ugly_0.10.10.bb b/recipes/gstreamer/gst-plugins-ugly_0.10.10.bb
deleted file mode 100644
index e21abc9..0000000
--- a/recipes/gstreamer/gst-plugins-ugly_0.10.10.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-require gst-plugins.inc
-
-PR = "${INC_PR}.1"
-
-DEPENDS += "gst-plugins-base mpeg2dec libsidplay"
-
-SRC_URI += "\
-  file://gstmad_16bit.patch \
-  file://gstsid_autofoo_HACK.patch \
-"
-
-python() {
-    # Don't build, if we are building an ENTERPRISE distro
-    enterprise = bb.data.getVar("ENTERPRISE_DISTRO", d, 1)
-    if enterprise == "1":
-            raise bb.parse.SkipPackage("gst-plugins-ugly will only build if ENTERPRISE_DISTRO != 1")
-}
-
-
-SRC_URI[archive.md5sum] = "031205d5599fce73fc36766f928b2515"
-SRC_URI[archive.sha256sum] = "ced80afedd105cb9b1b72749f8bda29c71fa9eda06120d6b07e7362f705c9987"
diff --git a/recipes/gstreamer/gst-plugins-ugly_0.10.11.bb b/recipes/gstreamer/gst-plugins-ugly_0.10.11.bb
deleted file mode 100644
index c82370b..0000000
--- a/recipes/gstreamer/gst-plugins-ugly_0.10.11.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-require gst-plugins.inc
-
-PR = "${INC_PR}.1"
-
-DEPENDS += "gst-plugins-base mpeg2dec libsidplay"
-
-SRC_URI += "\
-  file://gstmad_16bit.patch \
-  file://gstsid_autofoo_HACK.patch \
-"
-
-python() {
-	# Don't build, if we are building an ENTERPRISE distro
-	enterprise = bb.data.getVar("ENTERPRISE_DISTRO", d, 1)
-	if enterprise == "1":
-		raise bb.parse.SkipPackage("gst-plugins-ugly will only build if ENTERPRISE_DISTRO != 1")
-}
-
-
-SRC_URI[archive.md5sum] = "dfe2e201e066a3e86a9598b6769d9739"
-SRC_URI[archive.sha256sum] = "681d3cf7ae124bff1949187db858e5439a41be162bdad59dd69b52b70fd62dfa"
diff --git a/recipes/gstreamer/gst-plugins-ugly_0.10.14.bb b/recipes/gstreamer/gst-plugins-ugly_0.10.14.bb
deleted file mode 100644
index bc0a3b9..0000000
--- a/recipes/gstreamer/gst-plugins-ugly_0.10.14.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-require gst-plugins.inc
-
-PR = "${INC_PR}.0"
-
-DEPENDS += "gst-plugins-base mpeg2dec libsidplay"
-
-SRC_URI += "\
-  file://gstmad_16bit.patch \
-  file://gstsid_autofoo_HACK.patch \
-"
-
-SRC_URI[archive.md5sum] = "0bc0d27bcce88c73ef6c81e88624e686"
-SRC_URI[archive.sha256sum] = "78dba9963e130cfd09f294b60219e6562459c5d848bc3b38a653db7f21fc850b"
-
-python() {
-	# Don't build, if we are building an ENTERPRISE distro
-	enterprise = bb.data.getVar("ENTERPRISE_DISTRO", d, 1)
-	if enterprise == "1":
-		raise bb.parse.SkipPackage("gst-plugins-ugly will only build if ENTERPRISE_DISTRO != 1")
-}
-
diff --git a/recipes/gstreamer/gst-plugins-ugly_0.10.15.bb b/recipes/gstreamer/gst-plugins-ugly_0.10.15.bb
deleted file mode 100644
index eaefc54..0000000
--- a/recipes/gstreamer/gst-plugins-ugly_0.10.15.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-require gst-plugins.inc
-
-PR = "${INC_PR}.0"
-
-DEPENDS += "gst-plugins-base mpeg2dec libsidplay"
-
-SRC_URI += "\
-  file://gstmad_16bit.patch \
-  file://gstsid_autofoo_HACK.patch \
-"
-SRC_URI[archive.md5sum] = "21c034a762a5da252f91640e53bfe457"
-SRC_URI[archive.sha256sum] = "ceebb7878d957a61cf437c1f93934a0371631fa50e4111ef016691d65866790c"
-
-python() {
-	# Don't build, if we are building an ENTERPRISE distro
-	enterprise = bb.data.getVar("ENTERPRISE_DISTRO", d, 1)
-	if enterprise == "1":
-		raise bb.parse.SkipPackage("gst-plugins-ugly will only build if ENTERPRISE_DISTRO != 1")
-}
-
-- 
1.7.2.3



