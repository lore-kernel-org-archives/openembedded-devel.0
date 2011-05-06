Received: from arroyo.ext.ti.com ([192.94.94.40])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <pprakash@ti.com>) id 1QIOBq-0006WP-N3
	for openembedded-devel@lists.openembedded.org;
	Fri, 06 May 2011 18:47:43 +0200
Received: from dlep33.itg.ti.com ([157.170.170.112])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id p46GamBK018075
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 6 May 2011 11:36:48 -0500
Received: from localhost.localdomain (localhost [127.0.0.1])
	by dlep33.itg.ti.com (8.13.7/8.13.7) with ESMTP id p46Gamwo015572;
	Fri, 6 May 2011 11:36:48 -0500 (CDT)
From: Punya Prakash <pprakash@ti.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  6 May 2011 08:33:42 -0500
Message-Id: <1304688822-31538-1-git-send-email-pprakash@ti.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH] gst-ffmpeg: Add support for NEON optimization on armv7a
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
X-List-Received-Date: Fri, 06 May 2011 16:47:43 -0000

* Patch gst-ffmpeg configure script to allow passing extra config options
	* without this change parsinig of configuration for FFmpeg/libav fails for parameters like --with-ffmpeg-extra-configure="--extra-cflags='-mfpu=neon -mfloat-abi=softfp'"
* note: this patch has been accepted upstream to the mainline project
	* commit cc9d778844078d0eb2c23c7a11f7f855d013bca5
	* Target Milestone HEAD 0.10.12
---
 ...ac_cs_config-handling-for-RELEASE-0.10.11.patch |   25 ++++++++++++++++++++
 recipes/gstreamer/gst-ffmpeg_0.10.11.bb            |    4 ++-
 2 files changed, 28 insertions(+), 1 deletions(-)
 create mode 100644 recipes/gstreamer/gst-ffmpeg/0001-Fix-ac_cs_config-handling-for-RELEASE-0.10.11.patch

diff --git a/recipes/gstreamer/gst-ffmpeg/0001-Fix-ac_cs_config-handling-for-RELEASE-0.10.11.patch b/recipes/gstreamer/gst-ffmpeg/0001-Fix-ac_cs_config-handling-for-RELEASE-0.10.11.patch
new file mode 100644
index 0000000..e25c046
--- /dev/null
+++ b/recipes/gstreamer/gst-ffmpeg/0001-Fix-ac_cs_config-handling-for-RELEASE-0.10.11.patch
@@ -0,0 +1,25 @@
+From d6a20ee371feb4d6f1d94f7f0e0b012581900007 Mon Sep 17 00:00:00 2001
+From: Punya Prakash <pprakash@ti.com>
+Date: Thu, 5 May 2011 12:24:03 -0500
+Subject: [PATCH] Fix ac_cs_config handling for RELEASE-0.10.11
+
+ * Previously autoconf appended too many additional quotes to parameters like --with-ffmpeg-extra-configure=" --target-os=linux --extra-cflags='-mfpu=neon -mfloat-abi=softfp'"
+---
+ configure.ac |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index c9e5ac5..f7c01c4 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -372,7 +372,7 @@ else
+ 
+      AS_MKDIR_P(["$ac_top_build_prefix"gst-libs/ext/ffmpeg])
+      cd "$ac_top_build_prefix"gst-libs/ext/ffmpeg &&
+-         $confcmd $embffmpeg_configure_args ||
++         eval "$confcmd $embffmpeg_configure_args" ||
+          AC_MSG_ERROR([Failed to configure embedded FFmpeg tree])
+      cd "$origdir"
+     ],
+-- 
+1.7.0.4
+
diff --git a/recipes/gstreamer/gst-ffmpeg_0.10.11.bb b/recipes/gstreamer/gst-ffmpeg_0.10.11.bb
index 563521e..6eac5e8 100644
--- a/recipes/gstreamer/gst-ffmpeg_0.10.11.bb
+++ b/recipes/gstreamer/gst-ffmpeg_0.10.11.bb
@@ -5,11 +5,12 @@ LICENSE = "LGPL"
 HOMEPAGE = "http://www.gstreamer.net/"
 DEPENDS = "ffmpeg gstreamer gst-plugins-base zlib"
 
-PR = "r1"
+PR = "r2"
 
 inherit autotools pkgconfig
 
 SRC_URI = "http://gstreamer.freedesktop.org/src/${PN}/${PN}-${PV}.tar.bz2 \
+	    file://0001-Fix-ac_cs_config-handling-for-RELEASE-0.10.11.patch \
            file://lower-rank.diff \
 "
 
@@ -21,6 +22,7 @@ FILES_${PN}-dbg += "${libdir}/gstreamer-0.10/.debug"
 FILES_${PN}-dev += "${libdir}/gstreamer-0.10/*.la ${libdir}/gstreamer-0.10/*.a"
 
 EXTRA_OECONF = " --with-system-ffmpeg "
+EXTRA_OECONF_armv7a = ' --with-ffmpeg-extra-configure="  --target-os=linux --extra-cflags='-march=armv7-a -mfpu=neon -mfloat-abi=softfp'"'
 
 # We do this because the install program is called with -s which causes it to
 # call "strip" and it then mangles cross compiled stuff..
-- 
1.7.0.4



