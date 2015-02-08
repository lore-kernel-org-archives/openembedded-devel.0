Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qc0-f170.google.com (mail-qc0-f170.google.com
	[209.85.216.170])
	by mail.openembedded.org (Postfix) with ESMTP id B8CFC72E91
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  8 Feb 2015 21:34:36 +0000 (UTC)
Received: by mail-qc0-f170.google.com with SMTP id i8so5773993qcq.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 Feb 2015 13:34:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=oReuMthlJUsZEUbWhbKyEmMg0ba1g3XJrGkjHvfP5fo=;
	b=blRc0THZhAZp0XW1+3dBkA/+IRO3RMNliOhilAUokW5fdVQwJdT7cqyPXs0xI2GkpZ
	VI+NI3mDeBuX8FHJV7bqlF/HQDrNVTXlHEZgSdUEgnhh6TDONpVttRcoP57hAPBFVHkl
	OmeLke6ynKiBrHW18hEQq05Yt/PIxMzRC7BrY8YSKHz79DnSLeZdLQgIXldseGVlXcux
	ADOd4CCSsg31PLoGHgNuV0gem+5jV+hXA1NxhRw4C9Oe93i+/qmQfDmo9xjjIF4E8/Dv
	Mrw9BrzNvJSDBSzemM/us477IG7Plqe9Bj44CUH6Fod5iNk9Rj//AAuR0a3vlWf+UM1E
	UhoQ==
X-Received: by 10.224.173.7 with SMTP id n7mr9811076qaz.102.1423431277453;
	Sun, 08 Feb 2015 13:34:37 -0800 (PST)
Received: from centrium.lab.ossystems.com.br ([177.100.225.47])
	by mx.google.com with ESMTPSA id 103sm9794660qgg.11.2015.02.08.13.34.35
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 08 Feb 2015 13:34:36 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Sun,  8 Feb 2015 19:34:35 -0200
Message-Id: <1423431280-890-3-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1423431280-890-1-git-send-email-otavio@ossystems.com.br>
References: <1423431280-890-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-qt5][PATCH 3/8] qtmultimedia: Use 'qtCompileTest' mechanism for GStreamer
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 08 Feb 2015 21:34:39 -0000

We can use the 'done_config_openal' and 'done_config_gstreamer' trick
to avoid the respective features it to be enabled.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 recipes-qt/qt5/qtmultimedia.inc                    |  5 +-
 ...a.pro-Respect-OE_GSTREAMER_ENABLED-OE_GST.patch | 53 ----------------------
 2 files changed, 2 insertions(+), 56 deletions(-)
 delete mode 100644 recipes-qt/qt5/qtmultimedia/0002-qtmultimedia.pro-Respect-OE_GSTREAMER_ENABLED-OE_GST.patch

diff --git a/recipes-qt/qt5/qtmultimedia.inc b/recipes-qt/qt5/qtmultimedia.inc
index e85d202..cd89583 100644
--- a/recipes-qt/qt5/qtmultimedia.inc
+++ b/recipes-qt/qt5/qtmultimedia.inc
@@ -11,12 +11,11 @@ PACKAGECONFIG[gstreamer010] = ",,gstreamer gst-plugins-base gst-plugins-bad"
 
 EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'alsa', '', 'CONFIG+=done_config_alsa', d)}"
 EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'pulseaudio', '', 'CONFIG+=done_config_pulseaudio', d)}"
-EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'openal', 'CONFIG+=OE_OPENAL_ENABLED', '', d)}"
-EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'gstreamer010', 'CONFIG+=OE_GSTREAMER010_ENABLED', '', d)}"
+EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'openal', '', 'CONFIG+=done_config_openal', d)}"
+EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'gstreamer010', 'GST_VERSION=0.10', 'done_config_gstreamer', d)}"
 
 SRC_URI += "\
     file://0001-Initial-porting-effort-to-GStreamer-1.0.patch \
-    file://0002-qtmultimedia.pro-Respect-OE_GSTREAMER_ENABLED-OE_GST.patch \
 "
 
 LICENSE += "| GPL-2.0"
diff --git a/recipes-qt/qt5/qtmultimedia/0002-qtmultimedia.pro-Respect-OE_GSTREAMER_ENABLED-OE_GST.patch b/recipes-qt/qt5/qtmultimedia/0002-qtmultimedia.pro-Respect-OE_GSTREAMER_ENABLED-OE_GST.patch
deleted file mode 100644
index 1654e00..0000000
--- a/recipes-qt/qt5/qtmultimedia/0002-qtmultimedia.pro-Respect-OE_GSTREAMER_ENABLED-OE_GST.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From b5c058f62a79efa213e4492ac7209b3a92f45e3b Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Sat, 5 Jul 2014 09:10:02 +0200
-Subject: [PATCH 2/2] qtmultimedia.pro: Respect
- OE_GSTREAMER_ENABLED,OE_GSTREAMER010_ENABLED and OE_OPENAL_ENABLED
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- qtmultimedia.pro | 21 ++++++++++++---------
- 1 file changed, 12 insertions(+), 9 deletions(-)
-
-diff --git a/qtmultimedia.pro b/qtmultimedia.pro
-index 109dd81..54b67a8 100644
---- a/qtmultimedia.pro
-+++ b/qtmultimedia.pro
-@@ -1,7 +1,7 @@
- requires(qtHaveModule(gui))
- 
- load(configure)
--qtCompileTest(openal)
-+OE_OPENAL_ENABLED:qtCompileTest(openal)
- win32 {
-     qtCompileTest(directshow) {
-         qtCompileTest(wshellitem)
-@@ -18,14 +18,17 @@ win32 {
-     qtCompileTest(alsa)
-     qtCompileTest(pulseaudio)
-     !done_config_gstreamer {
--        gstver=1.0
--        cache(GST_VERSION, set, gstver);
--        qtCompileTest(gstreamer) {
--            qtCompileTest(gstreamer_photography)
--            qtCompileTest(gstreamer_encodingprofiles)
--            qtCompileTest(gstreamer_appsrc)
--            qtCompileTest(linux_v4l)
--        } else {
-+        OE_GSTREAMER_ENABLED {
-+            gstver=1.0
-+            cache(GST_VERSION, set, gstver);
-+            qtCompileTest(gstreamer) {
-+                qtCompileTest(gstreamer_photography)
-+                qtCompileTest(gstreamer_encodingprofiles)
-+                qtCompileTest(gstreamer_appsrc)
-+                qtCompileTest(linux_v4l)
-+            }
-+        }
-+        !OE_GSTREAMER_ENABLED:OE_GSTREAMER010_ENABLED {
-             gstver=0.10
-             cache(GST_VERSION, set, gstver);
-             # Force a re-run of the test
--- 
-2.1.3
-
-- 
2.1.4


