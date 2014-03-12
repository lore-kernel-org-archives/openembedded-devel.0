Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id 3EE9B6EF8A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Mar 2014 04:44:50 +0000 (UTC)
Received: by mail-pa0-f47.google.com with SMTP id lj1so550026pab.20
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Mar 2014 21:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=vk9rlatXUQwkFjAG3ysmsEYZVhbueRYm7p7XGtN1eic=;
	b=kuSmZa3zSdhcif+qliD+w9rTXRF8VitDcNVXUR16o2JzZTgq1/kEI+nJlt0B4kN4cT
	qx+I/FvN5+s1sw2gFVycDLuO/icexfp2OK+/3TRrD1G4uVpletzUYavJ0/pfbUXCRQaB
	8c2/t6LZhXpPTBEbChEjP7zX26BodW8/ECYgwiWhDZhADMfpc7Jjd0uSZC8FU/2iIdhb
	759hcr1Gvb4KYf9Y30gN8nEzo3iS/puJPC2NT7Gc8W8jMuBbbiWMiwzuX33fVmOj+nyU
	YHp8L/IV+CHpb87pBdAxnGAm/mpkaKOXwzZCtv7dHHqhjexbktaMAtOEbc1gMhNLBk1Z
	HYGg==
X-Received: by 10.67.11.12 with SMTP id ee12mr2300339pad.132.1394599491294;
	Tue, 11 Mar 2014 21:44:51 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-140-30.lightspeed.sntcca.sbcglobal.net. [99.57.140.30])
	by mx.google.com with ESMTPSA id yx3sm2779191pbb.6.2014.03.11.21.44.50
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 11 Mar 2014 21:44:50 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Mar 2014 21:46:21 -0700
Message-Id: <1394599581-26844-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.9.0
Subject: [meta-browser][RFT][PATCH] chromium: Upgrade 29 -> 35
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
X-List-Received-Date: Wed, 12 Mar 2014 04:44:52 -0000

Removed already applied patches

License year changed thats why there is change in checksum

-// Copyright 2014 The Chromium Authors. All rights reserved.
+// Copyright (c) 2013 The Chromium Authors. All rights reserved.

we see

rpm/bin/debugedit: canonicalization unexpectedly shrank by one character

so we add PACKAGE_DEBUG_SPLIT_STYLE = "debug-without-src"

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ..._focus_tracker_notify_deprecated_since_ATK_2_9_4.patch |  0
 .../{chromium-29.0.1518.2 => chromium}/armv6/include.gypi |  0
 .../armv6/oe-defaults.gypi                                |  0
 .../armv7a/include.gypi                                   |  0
 .../armv7a/oe-defaults.gypi                               |  0
 .../{chromium-29.0.1518.2 => chromium}/google-chrome      |  0
 .../google-chrome.desktop                                 |  0
 .../{chromium-29.0.1518.2 => chromium}/i586/include.gypi  |  0
 .../i586/oe-defaults.gypi                                 |  0
 .../secitem_array.patch                                   |  0
 .../uninitialised-warning.patch                           |  6 +++---
 .../{chromium-29.0.1518.2 => chromium}/unistd-2.patch     |  0
 .../x86-64/include.gypi                                   |  0
 .../x86-64/oe-defaults.gypi                               |  0
 .../{chromium_29.0.1518.2.bb => chromium_35.0.1883.0.bb}  | 15 ++++++++-------
 15 files changed, 11 insertions(+), 10 deletions(-)
 rename recipes-browser/chromium/{chromium-29.0.1518.2 => chromium}/001-atk_focus_tracker_notify_deprecated_since_ATK_2_9_4.patch (100%)
 rename recipes-browser/chromium/{chromium-29.0.1518.2 => chromium}/armv6/include.gypi (100%)
 rename recipes-browser/chromium/{chromium-29.0.1518.2 => chromium}/armv6/oe-defaults.gypi (100%)
 rename recipes-browser/chromium/{chromium-29.0.1518.2 => chromium}/armv7a/include.gypi (100%)
 rename recipes-browser/chromium/{chromium-29.0.1518.2 => chromium}/armv7a/oe-defaults.gypi (100%)
 rename recipes-browser/chromium/{chromium-29.0.1518.2 => chromium}/google-chrome (100%)
 rename recipes-browser/chromium/{chromium-29.0.1518.2 => chromium}/google-chrome.desktop (100%)
 rename recipes-browser/chromium/{chromium-29.0.1518.2 => chromium}/i586/include.gypi (100%)
 rename recipes-browser/chromium/{chromium-29.0.1518.2 => chromium}/i586/oe-defaults.gypi (100%)
 rename recipes-browser/chromium/{chromium-29.0.1518.2 => chromium}/secitem_array.patch (100%)
 rename recipes-browser/chromium/{chromium-29.0.1518.2 => chromium}/uninitialised-warning.patch (96%)
 rename recipes-browser/chromium/{chromium-29.0.1518.2 => chromium}/unistd-2.patch (100%)
 rename recipes-browser/chromium/{chromium-29.0.1518.2 => chromium}/x86-64/include.gypi (100%)
 rename recipes-browser/chromium/{chromium-29.0.1518.2 => chromium}/x86-64/oe-defaults.gypi (100%)
 rename recipes-browser/chromium/{chromium_29.0.1518.2.bb => chromium_35.0.1883.0.bb} (84%)

diff --git a/recipes-browser/chromium/chromium-29.0.1518.2/001-atk_focus_tracker_notify_deprecated_since_ATK_2_9_4.patch b/recipes-browser/chromium/chromium/001-atk_focus_tracker_notify_deprecated_since_ATK_2_9_4.patch
similarity index 100%
rename from recipes-browser/chromium/chromium-29.0.1518.2/001-atk_focus_tracker_notify_deprecated_since_ATK_2_9_4.patch
rename to recipes-browser/chromium/chromium/001-atk_focus_tracker_notify_deprecated_since_ATK_2_9_4.patch
diff --git a/recipes-browser/chromium/chromium-29.0.1518.2/armv6/include.gypi b/recipes-browser/chromium/chromium/armv6/include.gypi
similarity index 100%
rename from recipes-browser/chromium/chromium-29.0.1518.2/armv6/include.gypi
rename to recipes-browser/chromium/chromium/armv6/include.gypi
diff --git a/recipes-browser/chromium/chromium-29.0.1518.2/armv6/oe-defaults.gypi b/recipes-browser/chromium/chromium/armv6/oe-defaults.gypi
similarity index 100%
rename from recipes-browser/chromium/chromium-29.0.1518.2/armv6/oe-defaults.gypi
rename to recipes-browser/chromium/chromium/armv6/oe-defaults.gypi
diff --git a/recipes-browser/chromium/chromium-29.0.1518.2/armv7a/include.gypi b/recipes-browser/chromium/chromium/armv7a/include.gypi
similarity index 100%
rename from recipes-browser/chromium/chromium-29.0.1518.2/armv7a/include.gypi
rename to recipes-browser/chromium/chromium/armv7a/include.gypi
diff --git a/recipes-browser/chromium/chromium-29.0.1518.2/armv7a/oe-defaults.gypi b/recipes-browser/chromium/chromium/armv7a/oe-defaults.gypi
similarity index 100%
rename from recipes-browser/chromium/chromium-29.0.1518.2/armv7a/oe-defaults.gypi
rename to recipes-browser/chromium/chromium/armv7a/oe-defaults.gypi
diff --git a/recipes-browser/chromium/chromium-29.0.1518.2/google-chrome b/recipes-browser/chromium/chromium/google-chrome
similarity index 100%
rename from recipes-browser/chromium/chromium-29.0.1518.2/google-chrome
rename to recipes-browser/chromium/chromium/google-chrome
diff --git a/recipes-browser/chromium/chromium-29.0.1518.2/google-chrome.desktop b/recipes-browser/chromium/chromium/google-chrome.desktop
similarity index 100%
rename from recipes-browser/chromium/chromium-29.0.1518.2/google-chrome.desktop
rename to recipes-browser/chromium/chromium/google-chrome.desktop
diff --git a/recipes-browser/chromium/chromium-29.0.1518.2/i586/include.gypi b/recipes-browser/chromium/chromium/i586/include.gypi
similarity index 100%
rename from recipes-browser/chromium/chromium-29.0.1518.2/i586/include.gypi
rename to recipes-browser/chromium/chromium/i586/include.gypi
diff --git a/recipes-browser/chromium/chromium-29.0.1518.2/i586/oe-defaults.gypi b/recipes-browser/chromium/chromium/i586/oe-defaults.gypi
similarity index 100%
rename from recipes-browser/chromium/chromium-29.0.1518.2/i586/oe-defaults.gypi
rename to recipes-browser/chromium/chromium/i586/oe-defaults.gypi
diff --git a/recipes-browser/chromium/chromium-29.0.1518.2/secitem_array.patch b/recipes-browser/chromium/chromium/secitem_array.patch
similarity index 100%
rename from recipes-browser/chromium/chromium-29.0.1518.2/secitem_array.patch
rename to recipes-browser/chromium/chromium/secitem_array.patch
diff --git a/recipes-browser/chromium/chromium-29.0.1518.2/uninitialised-warning.patch b/recipes-browser/chromium/chromium/uninitialised-warning.patch
similarity index 96%
rename from recipes-browser/chromium/chromium-29.0.1518.2/uninitialised-warning.patch
rename to recipes-browser/chromium/chromium/uninitialised-warning.patch
index fac12bb..afdd784 100644
--- a/recipes-browser/chromium/chromium-29.0.1518.2/uninitialised-warning.patch
+++ b/recipes-browser/chromium/chromium/uninitialised-warning.patch
@@ -30,10 +30,10 @@ Make gcc 4.8 happy. It complains about uninitialized symbols
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 Upstream-Status: Unknown
-Index: chromium-29.0.1518.2/webkit/glue/webclipboard_impl.cc
+Index: chromium-29.0.1518.2/content/renderer/webclipboard_impl.cc
 ===================================================================
---- chromium-29.0.1518.2.orig/webkit/glue/webclipboard_impl.cc
-+++ chromium-29.0.1518.2/webkit/glue/webclipboard_impl.cc
+--- chromium-29.0.1518.2.orig/content/renderer/webclipboard_impl.cc
++++ chromium-29.0.1518.2/content/renderer/webclipboard_impl.cc
 @@ -73,7 +73,7 @@ uint64 WebClipboardImpl::getSequenceNumb
  }
  
diff --git a/recipes-browser/chromium/chromium-29.0.1518.2/unistd-2.patch b/recipes-browser/chromium/chromium/unistd-2.patch
similarity index 100%
rename from recipes-browser/chromium/chromium-29.0.1518.2/unistd-2.patch
rename to recipes-browser/chromium/chromium/unistd-2.patch
diff --git a/recipes-browser/chromium/chromium-29.0.1518.2/x86-64/include.gypi b/recipes-browser/chromium/chromium/x86-64/include.gypi
similarity index 100%
rename from recipes-browser/chromium/chromium-29.0.1518.2/x86-64/include.gypi
rename to recipes-browser/chromium/chromium/x86-64/include.gypi
diff --git a/recipes-browser/chromium/chromium-29.0.1518.2/x86-64/oe-defaults.gypi b/recipes-browser/chromium/chromium/x86-64/oe-defaults.gypi
similarity index 100%
rename from recipes-browser/chromium/chromium-29.0.1518.2/x86-64/oe-defaults.gypi
rename to recipes-browser/chromium/chromium/x86-64/oe-defaults.gypi
diff --git a/recipes-browser/chromium/chromium_29.0.1518.2.bb b/recipes-browser/chromium/chromium_35.0.1883.0.bb
similarity index 84%
rename from recipes-browser/chromium/chromium_29.0.1518.2.bb
rename to recipes-browser/chromium/chromium_35.0.1883.0.bb
index 1c62f1e..6a03d6b 100644
--- a/recipes-browser/chromium/chromium_29.0.1518.2.bb
+++ b/recipes-browser/chromium/chromium_35.0.1883.0.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Chromium browser"
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=d2d164565cc10f298390174d9cb6d18d"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=537e0b52077bf0a616d0a0c8a79bc9d5"
 DEPENDS = "xz-native pciutils pulseaudio xextproto cairo nss gtk+ zlib-native libav libxi libgnome-keyring libxss cups ninja-native gconf"
 SRC_URI = "\
         http://gsdview.appspot.com/chromium-browser-official/${P}.tar.xz \
@@ -9,12 +9,9 @@ SRC_URI = "\
         file://unistd-2.patch \
         file://google-chrome \
         file://google-chrome.desktop \
-        file://uninitialised-warning.patch \
-	file://001-atk_focus_tracker_notify_deprecated_since_ATK_2_9_4.patch \
-	file://secitem_array.patch;striplevel=2 \
 "
-SRC_URI[md5sum] = "2480c3fd109ef000575629acb8a906ca"
-SRC_URI[sha256sum] = "7f08624f7d9bd120de0043da7ee09985ae6b6990d22d8c1b1f7c66fd4ed681a1"
+SRC_URI[md5sum] = "c0659bc3c6b540e106e043fd27f54358"
+SRC_URI[sha256sum] = "666d5948c6508072f9f5d6acff82290fa5939e1da1b94b042a1e05daf3357b61"
 
 # include.gypi exists only for armv6 and armv7a and there isn't something like COMPATIBLE_ARCH afaik
 COMPATIBLE_MACHINE = "(-)"
@@ -60,8 +57,9 @@ do_install() {
 
 	install -d ${D}${bindir}/chrome/
 	install -m 0755 ${S}/out/Release/chrome ${D}${bindir}/chrome/chrome
-	install -m 0644 ${S}/out/Release/chrome.pak ${D}${bindir}/chrome/
 	install -m 0644 ${S}/out/Release/resources.pak ${D}${bindir}/chrome/
+	install -m 0644 ${S}/out/Release/content_resources.pak ${D}${bindir}/chrome/
+	install -m 0644 ${S}/out/Release/keyboard_resources.pak ${D}${bindir}/chrome/
 	install -m 0644 ${S}/out/Release/chrome_100_percent.pak ${D}${bindir}/chrome/
 	install -m 0644 ${S}/out/Release/product_logo_48.png ${D}${bindir}/chrome/
 	install -m 0755 ${S}/out/Release/libffmpegsumo.so ${D}${bindir}/chrome/
@@ -72,3 +70,6 @@ do_install() {
 
 FILES_${PN} = "${bindir}/chrome/ ${bindir}/google-chrome ${datadir}/applications"
 FILES_${PN}-dbg = "${bindir}/chrome/.debug/"
+
+PACKAGE_DEBUG_SPLIT_STYLE = "debug-without-src"
+
-- 
1.9.0


