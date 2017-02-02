Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id C5F78605B3
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Feb 2017 23:54:09 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id u63so419056wmu.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Feb 2017 15:54:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=TdQVE3eSTT8mIlQZrfDNS6tS0K+iWHc7Xh/4PWIxjfE=;
	b=lNNMKaGdcgw5QStLikN2kSHZsE/cIIbFNTbjlARNUcjxsGd9wOpuEc2x+G1bAe2Rru
	lAY2F8AoVDzJ0aCS5isizJqtcvi91kRblmVaRNTAM8H1lhEqikQhujCSya498RxNmLsl
	91C+PCRVgBJGygCVkQSqGN1r8yKAfTik75wPLEQzDchZQJNF8SV1kVWDNVa5FT4XYWVr
	rKWgSM0ClYH9Vwxuh3Yk0AyQUJe3r4ARQAM8zmKGRpOjQws9sh29Hz1VhxA+uctdBVHe
	r34+Knxh28UtbBcL+3P6rjeKybt/njnwzjbeYn0Dg4y+rRx/MNgnUX6ZglhQvZ18IHYV
	FHtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=TdQVE3eSTT8mIlQZrfDNS6tS0K+iWHc7Xh/4PWIxjfE=;
	b=O1zbO0N/Z7e6RGH2DGqQ1pgID05QO0onAyCcrLFko5Y2R19TvFZyCbsZoDZpaj6mwu
	GebSOlmHQK7GqBFSZH3QMjrGk9/BB2e6GK345rk8HUAy2EFI0xox0BtuiTSTKNeBEQd3
	tSWdpQhfOPMPDQBAAy+4rYo6oy1F8V565Q+GylU3F7IYVdSjsmYJWgWHuo92Gfyqo7uS
	EIbul5OO0GraOhksMTezPOA9wD8OaEBQlv/Fnvrnjvq/tJTqQh98a/WoaRz1/CRr5RFg
	41g3bEToytFbKrYMbXR2CnWIqGLkPyyyITbdPObnwsQJI/jfGpbUERCL6kAkGUqn0V4O
	b+jA==
X-Gm-Message-State: AMke39kurNg4fL5wfhFE7dMNe7z0PyUdqAPtNWkjFDfflHYzWhhV3/3wDVYsPiaNBYKD7g==
X-Received: by 10.28.35.65 with SMTP id j62mr88361wmj.31.1486079649435;
	Thu, 02 Feb 2017 15:54:09 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	r24sm5870655wrr.34.2017.02.02.15.54.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 02 Feb 2017 15:54:08 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  3 Feb 2017 00:54:00 +0100
Message-Id: <20170202235401.10297-3-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20170202235401.10297-1-Martin.Jansa@gmail.com>
References: <20170202235401.10297-1-Martin.Jansa@gmail.com>
Subject: [PATCH][meta-qt5 3/4] qtwayland: fix build without xkbcommon-evdev
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 02 Feb 2017 23:54:10 -0000

* xkbcommon-evdev isn't enabled in default qtbase PACKAGECONFIG
* use patch from https://bugreports.qt.io/browse/QTBUG-57767

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../0001-fix-build-without-xkbcommon-evdev.patch   | 44 ++++++++++++++++++++++
 recipes-qt/qt5/qtwayland_git.bb                    |  3 ++
 2 files changed, 47 insertions(+)
 create mode 100644 recipes-qt/qt5/qtwayland/0001-fix-build-without-xkbcommon-evdev.patch

diff --git a/recipes-qt/qt5/qtwayland/0001-fix-build-without-xkbcommon-evdev.patch b/recipes-qt/qt5/qtwayland/0001-fix-build-without-xkbcommon-evdev.patch
new file mode 100644
index 0000000..e1e978e
--- /dev/null
+++ b/recipes-qt/qt5/qtwayland/0001-fix-build-without-xkbcommon-evdev.patch
@@ -0,0 +1,44 @@
+From c93dbe53e8a1b2203c750a66c7efe6fc9a326903 Mon Sep 17 00:00:00 2001
+From: Raphael Freudiger <raphael.freudiger@siemens.com>
+Date: Thu, 22 Dec 2016 13:54:31 +0100
+Subject: [PATCH] fix build without xkbcommon-evdev
+
+Signed-off-by: Raphael Freudiger <raphael.freudiger@siemens.com>
+---
+ src/compositor/compositor_api/qwaylandkeyboard.cpp | 13 +++++++------
+ 1 file changed, 7 insertions(+), 6 deletions(-)
+
+diff --git a/src/compositor/compositor_api/qwaylandkeyboard.cpp b/src/compositor/compositor_api/qwaylandkeyboard.cpp
+index 55381b4..5c054c6 100644
+--- a/src/compositor/compositor_api/qwaylandkeyboard.cpp
++++ b/src/compositor/compositor_api/qwaylandkeyboard.cpp
+@@ -338,12 +338,6 @@ void QWaylandKeyboardPrivate::createXKBState(xkb_keymap *keymap)
+     xkb_state = xkb_state_new(keymap);
+ }
+ 
+-uint QWaylandKeyboardPrivate::toWaylandXkbV1Key(const uint nativeScanCode)
+-{
+-    const uint offset = 8;
+-    Q_ASSERT(nativeScanCode >= offset);
+-    return nativeScanCode - offset;
+-}
+ 
+ void QWaylandKeyboardPrivate::createXKBKeymap()
+ {
+@@ -373,6 +367,13 @@ void QWaylandKeyboardPrivate::createXKBKeymap()
+ }
+ #endif
+ 
++uint QWaylandKeyboardPrivate::toWaylandXkbV1Key(const uint nativeScanCode)
++{
++    const uint offset = 8;
++    Q_ASSERT(nativeScanCode >= offset);
++    return nativeScanCode - offset;
++}
++
+ void QWaylandKeyboardPrivate::sendRepeatInfo()
+ {
+     Q_FOREACH (Resource *resource, resourceMap()) {
+-- 
+2.1.4
+
diff --git a/recipes-qt/qt5/qtwayland_git.bb b/recipes-qt/qt5/qtwayland_git.bb
index 21abd54..d42d80a 100644
--- a/recipes-qt/qt5/qtwayland_git.bb
+++ b/recipes-qt/qt5/qtwayland_git.bb
@@ -43,4 +43,7 @@ EXTRA_QMAKEVARS_CONFIGURE += "${PACKAGECONFIG_CONFARGS}"
 
 SRCREV = "0e2a950895805457a45abe860bc91a7cc4ba405e"
 
+# From https://bugreports.qt.io/browse/QTBUG-57767
+SRC_URI += "file://0001-fix-build-without-xkbcommon-evdev.patch"
+
 BBCLASSEXTEND =+ "native nativesdk"
-- 
2.10.2


