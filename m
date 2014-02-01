Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f45.google.com (mail-ee0-f45.google.com [74.125.83.45])
	by mail.openembedded.org (Postfix) with ESMTP id 12DF16E9A6
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  1 Feb 2014 07:36:59 +0000 (UTC)
Received: by mail-ee0-f45.google.com with SMTP id b15so2652823eek.32
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jan 2014 23:37:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=9/DwL5T6kFwCbzmy20Ap/tLxt2uiwM6axydeJsZ3OMs=;
	b=T8QwGGCUSiwukFoF9vPplyPZDS16Opd94U/40A//IWyHH1yu0kV7/7a6REcOp1N2d0
	HAcBwEIsOOO2BBoBTL71/60XcRCDBdr6exq0rCH58z9r+KH6zbtJOm5F35gFxm8A4LiW
	o+9Jk3fta9M1ksEa0egIOjnlgd+iu4TVxFFr9ISzIEduf7pbilXD5XAzoWyDirbAUIhf
	UAvugvRFGashT6bV18ZNvxhc1NKsGaQWSNfpRG1fIcWb1SZFimhse6DfUQUdw7dThJv0
	qIcZuTBF6Fs61krC3zmVgWznUeYhTshXoo0vN1HBdU/X6QERoS8sCIDy9CNl9N7cOBte
	8iFg==
X-Received: by 10.14.173.68 with SMTP id u44mr140430eel.102.1391240220806;
	Fri, 31 Jan 2014 23:37:00 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id 8sm46471985eeq.15.2014.01.31.23.36.59
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 Jan 2014 23:37:00 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  1 Feb 2014 08:37:01 +0100
Message-Id: <1391240222-2020-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.5.3
Subject: [PATCH][meta-multimedia 1/2] vlc: fix build with kernel headers 3.9 and newer
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
X-List-Received-Date: Sat, 01 Feb 2014 07:37:00 -0000

* V4L2_CID_HCENTER and V4L2_CID_VCENTER removed from linux v3.9

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...orizontal-and-vertical-center-controls-ob.patch | 53 ++++++++++++++++++++++
 .../recipes-multimedia/vlc/vlc_1.1.11.bb           |  2 +
 2 files changed, 55 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/vlc/vlc/0001-V4L2-mark-horizontal-and-vertical-center-controls-ob.patch

diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc/0001-V4L2-mark-horizontal-and-vertical-center-controls-ob.patch b/meta-multimedia/recipes-multimedia/vlc/vlc/0001-V4L2-mark-horizontal-and-vertical-center-controls-ob.patch
new file mode 100644
index 0000000..81233bf
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc/0001-V4L2-mark-horizontal-and-vertical-center-controls-ob.patch
@@ -0,0 +1,53 @@
+From 4da99e58bd1b06267793ef728a368e4032789376 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?R=C3=A9mi=20Denis-Courmont?= <remi@remlab.net>
+Date: Sat, 1 Oct 2011 22:58:21 +0300
+Subject: [PATCH] V4L2: mark horizontal and vertical center controls obsolete
+
+Upstream-Status: Backport
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+
+They were deprecated in Linux version 2.6.26.
+---
+ modules/access/v4l2/controls.c |  2 --
+ modules/access/v4l2/video.c    | 12 ++----------
+ 2 files changed, 2 insertions(+), 12 deletions(-)
+
+diff -uNr vlc-1.1.11.orig/modules/access/v4l2.c vlc-1.1.11/modules/access/v4l2.c
+--- vlc-1.1.11.orig/modules/access/v4l2.c	2011-06-03 19:59:40.000000000 +0200
++++ vlc-1.1.11/modules/access/v4l2.c	2014-02-01 07:38:28.905142516 +0100
+@@ -159,12 +159,6 @@
+ #define VFLIP_TEXT N_( "Vertical flip" )
+ #define VFLIP_LONGTEXT N_( \
+     "Flip the video vertically (if supported by the v4l2 driver)." )
+-#define HCENTER_TEXT N_( "Horizontal centering" )
+-#define HCENTER_LONGTEXT N_( \
+-    "Set the camera's horizontal centering (if supported by the v4l2 driver)." )
+-#define VCENTER_TEXT N_( "Vertical centering" )
+-#define VCENTER_LONGTEXT N_( \
+-    "Set the camera's vertical centering (if supported by the v4l2 driver)." )
+ 
+ #define AUDIO_VOLUME_TEXT N_( "Volume" )
+ #define AUDIO_VOLUME_LONGTEXT N_( \
+@@ -351,10 +345,8 @@
+                  HFLIP_LONGTEXT, true )
+     add_integer( CFG_PREFIX "vflip", -1, NULL, VFLIP_TEXT,
+                  VFLIP_LONGTEXT, true )
+-    add_integer( CFG_PREFIX "hcenter", -1, NULL, HCENTER_TEXT,
+-                 HCENTER_LONGTEXT, true )
+-    add_integer( CFG_PREFIX "vcenter", -1, NULL, VCENTER_TEXT,
+-                 VCENTER_LONGTEXT, true )
++    add_obsolete_integer( CFG_PREFIX "hcenter" ) /* since Linux 2.6.26 */
++    add_obsolete_integer( CFG_PREFIX "vcenter" ) /* since Linux 2.6.26 */
+     add_integer( CFG_PREFIX "audio-volume", -1, NULL, AUDIO_VOLUME_TEXT,
+                 AUDIO_VOLUME_LONGTEXT, true )
+     add_integer( CFG_PREFIX "audio-balance", -1, NULL, AUDIO_BALANCE_TEXT,
+@@ -518,8 +510,6 @@
+     { "gain", V4L2_CID_GAIN },
+     { "hflip", V4L2_CID_HFLIP },
+     { "vflip", V4L2_CID_VFLIP },
+-    { "hcenter", V4L2_CID_HCENTER },
+-    { "vcenter", V4L2_CID_VCENTER },
+     { NULL, 0 }
+ };
+ 
diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc_1.1.11.bb b/meta-multimedia/recipes-multimedia/vlc/vlc_1.1.11.bb
index 11ecaa4..e88e964 100644
--- a/meta-multimedia/recipes-multimedia/vlc/vlc_1.1.11.bb
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc_1.1.11.bb
@@ -5,6 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=ed7e492ee44e70125a5d42e118354a13"
 
 require vlc.inc
 
+SRC_URI += "file://0001-V4L2-mark-horizontal-and-vertical-center-controls-ob.patch"
+
 PR = "r4"
 
 # work around build failure
-- 
1.8.5.3


