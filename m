Received: from [85.214.48.103] (helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1MhKlK-0001fk-28
	for openembedded-devel@lists.openembedded.org;
	Sat, 29 Aug 2009 12:02:28 +0200
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 573D822001D8
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Aug 2009 11:44:06 +0200 (CEST)
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id E82312200126
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Aug 2009 11:44:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.2.5
Received: from rhein.familie-heinold.de (g225144089.adsl.alicedsl.de
	[92.225.144.89]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Aug 2009 11:44:04 +0200 (CEST)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id E99B33C327; Sat, 29 Aug 2009 11:44:03 +0200 (CEST)
Date: Sat, 29 Aug 2009 11:44:03 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090829094403.GA27158@rhein.zuhause.netz>
MIME-Version: 1.0
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: [PATCH] ffmpeg: fix installations of x264-presets files
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
X-List-Received-Date: Sat, 29 Aug 2009 10:02:37 -0000
X-Groupsio-MsgNum: 12840
Content-Type: multipart/mixed; boundary="BXVAT5kNtrzKuDFl"
Content-Disposition: inline

--BXVAT5kNtrzKuDFl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would like to get an ack for the
attached patch.

Bye Henning

--BXVAT5kNtrzKuDFl
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="0001-ffmpeg-fix-installations-of-x264-presets-files.patch"

From 717332f424ba55673d76d5d881916752ab1b54f5 Mon Sep 17 00:00:00 2001
From: Henning Heinold <heinold@inf.fu-berlin.de>
Date: Sun, 23 Aug 2009 22:54:11 +0200
Subject: [PATCH] ffmpeg: fix installations of x264-presets files
 * now x264-presets files are only installed when libx264 is available
 * bump PR


Signed-off-by: Henning Heinold <heinold@inf.fu-berlin.de>
---
 recipes/ffmpeg/ffmpeg.inc               |    5 +----
 recipes/ffmpeg/ffmpeg_0.5.bb            |    5 +++--
 recipes/ffmpeg/ffmpeg_git.bb            |    5 +++--
 recipes/ffmpeg/files/x264-presets.patch |   28 ++++++++++++++++++++++++++++
 4 files changed, 35 insertions(+), 8 deletions(-)
 create mode 100644 recipes/ffmpeg/files/x264-presets.patch

diff --git a/recipes/ffmpeg/ffmpeg.inc b/recipes/ffmpeg/ffmpeg.inc
index cdb3f7e..7d7d957 100644
--- a/recipes/ffmpeg/ffmpeg.inc
+++ b/recipes/ffmpeg/ffmpeg.inc
@@ -80,16 +80,13 @@ FILES_${PN}-vhook = "${libdir}/vhook"
 FILES_${PN}-vhook-dbg += "${libdir}/vhook/.debug"
 
 
-PACKAGES += "ffmpeg-x264-presets \
-             libavcodec  libavcodec-dev  libavcodec-dbg \
+PACKAGES += "libavcodec  libavcodec-dev  libavcodec-dbg \
              libavdevice libavdevice-dev libavdevice-dbg \
              libavformat libavformat-dev libavformat-dbg \
              libavutil   libavutil-dev   libavutil-dbg \
              libpostproc libpostproc-dev libpostproc-dbg \
              libswscale  libswscale-dev  libswscale-dbg"
 
-FILES_ffmpeg-x264-presets = "${datadir}/*.ffpreset"
-
 FILES_${PN}-dev = "${includedir}"
 FILES_libavcodec = "${libdir}/libavcodec*.so.*"
 FILES_libavcodec-dev = "${libdir}/libavcodec*.so ${libdir}/pkgconfig/libavcodec.pc ${libdir}/libavcodec*.a"
diff --git a/recipes/ffmpeg/ffmpeg_0.5.bb b/recipes/ffmpeg/ffmpeg_0.5.bb
index b80fa88..1347bdf 100644
--- a/recipes/ffmpeg/ffmpeg_0.5.bb
+++ b/recipes/ffmpeg/ffmpeg_0.5.bb
@@ -3,14 +3,15 @@ require ffmpeg.inc
 DEPENDS += "schroedinger libgsm"
 
 PE = "1"
-PR = "r5"
+PR = "r6"
 
 DEFAULT_PREFERENCE = "1"
 
 SRCREV_libswscale = "b2e1c8222eeef74b0ca8053b400957dd69e18e4d"
 SRC_URI = "http://ffmpeg.org/releases/ffmpeg-${PV}.tar.bz2 \
 	   file://armv4.patch;patch=1 \
-       file://ffmpeg-arm-update.diff;patch=1 \
+           file://ffmpeg-arm-update.diff;patch=1 \
+	   file://x264-presets.patch;patch=1 \
 	  "
 
 #S = "${WORKDIR}/git"
diff --git a/recipes/ffmpeg/ffmpeg_git.bb b/recipes/ffmpeg/ffmpeg_git.bb
index bc17596..2d34b0c 100644
--- a/recipes/ffmpeg/ffmpeg_git.bb
+++ b/recipes/ffmpeg/ffmpeg_git.bb
@@ -4,7 +4,7 @@ DEPENDS += "schroedinger libgsm"
 
 PE = "1"
 PV = "0.5.0+${PR}+gitr${SRCREV}" 
-PR = "r0"
+PR = "r1"
 
 DEFAULT_PREFERENCE = "-1"
 DEFAULT_PREFERENCE_armv7a = "1"
@@ -17,7 +17,8 @@ SRCREV = "d886804643d7427debfa70d824de7e53ae8e3e83"
 SRCREV_arm = "d886804643d7427debfa70d824de7e53ae8e3e83"
 SRCREV_libswscale = "b2e1c8222eeef74b0ca8053b400957dd69e18e4d"
 SRC_URI = "git://git.mansr.com/ffmpeg.mru;protocol=git;branch=${FFBRANCH} \
-"
+           file://x264-presets.patch;patch=1 \
+          "
 
 S = "${WORKDIR}/git"
 B = "${S}/build.${HOST_SYS}.${TARGET_SYS}"
diff --git a/recipes/ffmpeg/files/x264-presets.patch b/recipes/ffmpeg/files/x264-presets.patch
new file mode 100644
index 0000000..55bad63
--- /dev/null
+++ b/recipes/ffmpeg/files/x264-presets.patch
@@ -0,0 +1,28 @@
+Index: ffmpeg-0.5/Makefile
+===================================================================
+--- ffmpeg-0.5.orig/Makefile	2009-02-21 19:41:52.000000000 +0100
++++ ffmpeg-0.5/Makefile	2009-08-23 22:45:29.417512541 +0200
+@@ -24,7 +24,9 @@
+ 
+ FFLIBS := avdevice avformat avcodec avutil
+ 
+-DATA_FILES := $(wildcard $(SRC_DIR)/ffpresets/*.ffpreset)
++ifeq ($(CONFIG_LIBX264),yes)
++DATA_FILES := $(wildcard $(SRC_DIR)/ffpresets/libx264-*.ffpreset)
++endif
+ 
+ include common.mak
+ 
+@@ -133,9 +135,12 @@
+ 	install -d "$(BINDIR)"
+ 	install -c -m 755 $(PROGS) "$(BINDIR)"
+ 
++
+ install-data: $(DATA_FILES)
++ifneq ($(DATA_FILES),)
+ 	install -d "$(DATADIR)"
+ 	install -m 644 $(DATA_FILES) "$(DATADIR)"
++endif
+ 
+ install-man: $(MANPAGES)
+ 	install -d "$(MANDIR)/man1"
-- 
1.6.3.3


--BXVAT5kNtrzKuDFl--
