Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qc0-f172.google.com (mail-qc0-f172.google.com
	[209.85.216.172])
	by mail.openembedded.org (Postfix) with ESMTP id C6B2E71630
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Feb 2015 01:44:10 +0000 (UTC)
Received: by mail-qc0-f172.google.com with SMTP id x3so603659qcv.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Feb 2015 17:44:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=oReuMthlJUsZEUbWhbKyEmMg0ba1g3XJrGkjHvfP5fo=;
	b=bO/54g969ENp66HpgaEuG41CFXkZi+CLlGcO0KGrw7DuqsxsiG29KnmeKbYZXUFk0i
	dx7PKzUlfuTIcvoP1SvOB3EesYFRQDtr+/2lCp2rwQHVXWmtFOfTdrTQn29C2AxX+KKX
	7/CFOvL6yyskQ0jSWo/o41hsr1QVXR+lDdObJpgYufSdOgTyiAovzeJDonX6uf91MceY
	KxA1jxVKk5T4JfSVLcb50xe8J1TdB61NjxOSywu8JCVBElVtGLBRmksYgKzVfu8W+CQf
	n8KAZqsd2i7U7xfpX3CkpMXddbU4+OMM65Zx/G1Vr23fwswCsidcwptKCMIkl6IRqJBJ
	tcuQ==
X-Received: by 10.140.98.141 with SMTP id o13mr37527406qge.81.1423619051688;
	Tue, 10 Feb 2015 17:44:11 -0800 (PST)
Received: from centrium.lab.ossystems.com.br ([177.100.225.47])
	by mx.google.com with ESMTPSA id
	n13sm17222934qaa.25.2015.02.10.17.44.09
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 10 Feb 2015 17:44:10 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Tue, 10 Feb 2015 23:43:34 -0200
Message-Id: <1423619019-17403-3-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1423619019-17403-1-git-send-email-otavio@ossystems.com.br>
References: <1423619019-17403-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-qt5][PATCH v2 3/8] qtmultimedia: Use 'qtCompileTest' mechanism for GStreamer
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
X-List-Received-Date: Wed, 11 Feb 2015 01:44:11 -0000

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


