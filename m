Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 68555719C1
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Oct 2016 09:19:34 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id b201so1977713wmb.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Oct 2016 02:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=9fr1FRm/xrs4gzokiAJf2EIbLSu24C/ldmjm2922lVc=;
	b=zGawvgT1fzbwQVZqQiWzZCubbYrrLW+/SGKznBkDEExZH40iLHmdFJg2FMQQpiE70g
	YIYLp6w++zCqHsRv20naUSBUP/OaSBEiEdhCBEuvU64tGpwWsfogyyWfCug8EaKK9TuU
	gLFiccYJjNr6CkuwuDfbMRemDmeWiF8Y3w+5eTBz/L+hNHVlUCppSN8Lx82gmXbMaMyS
	rhvqQs34CSK6XnFNmgP2Ki46IWEwiV8bqMTiMQa+2toliwbB6m2Pm1wiEDbOKr9KKbu4
	1xamZbwRhO1cj1QFz7PzzdMFOzKhoGooVB30K9zIjjFA8dLyFZkCEDvyB2xuiknxJRCR
	CjYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=9fr1FRm/xrs4gzokiAJf2EIbLSu24C/ldmjm2922lVc=;
	b=k6E35NRKS9RtSH9V+Ix7jMpOmbBkooqE/zhq6hakosvfYsR1osaOJb7xAGtJBPsAGp
	GSH7pYA3+R/yMwEGTKt90S5btTbCZsSySszxFioJIeSf90/cYCsnP9i0NLqfJbwdVlz/
	FXSofLIm6qAfm5DJWahChvIsP7G7ZmR1aX2yazEE5KncxcBxMSneBcrTzDGYK3VQ0XcF
	Uf0H57I3RIXNU6yR7tGxnhxx3PGiOA8NAHODa/t0VATTewQBg2gYCvzMkzXEWMql7j1V
	mUaim2tnVof2t339rjONeKdXYrcbFasgkrWcDvChZDC9QneOCCCHC3SYKUI0jwZrgO1l
	8WKg==
X-Gm-Message-State: AA6/9Rkol/MueKyFmTq/xR+dJClDGBCGpeb/0a3B8EawP7nnhNjENnb+gKKcPvQyd6T6uQ==
X-Received: by 10.28.19.194 with SMTP id 185mr27867723wmt.51.1475831974924;
	Fri, 07 Oct 2016 02:19:34 -0700 (PDT)
Received: from mueller-a-nb-linux.zera.local
	(ip-95-222-156-64.hsi15.unitymediagroup.de. [95.222.156.64])
	by smtp.googlemail.com with ESMTPSA id
	jn7sm18657184wjb.5.2016.10.07.02.19.34
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 07 Oct 2016 02:19:34 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  7 Oct 2016 11:19:23 +0200
Message-Id: <1475831964-1993-4-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1475831964-1993-1-git-send-email-schnitzeltony@googlemail.com>
References: <1475831964-1993-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 4/5] florence: update 0.6.3
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
X-List-Received-Date: Fri, 07 Oct 2016 09:19:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* patches were either leftovers or do not match the code
* DESCRIPTION -> shortened SUMMARY

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../florence/files/0001-Fix-glib-includes.patch    | 33 ----------------------
 .../florence/files/fix-no-atspi-compile.patch      | 30 --------------------
 .../{florence_0.5.4.bb => florence_0.6.3.bb}       | 15 +++++-----
 3 files changed, 7 insertions(+), 71 deletions(-)
 delete mode 100644 meta-gnome/recipes-support/florence/files/0001-Fix-glib-includes.patch
 delete mode 100644 meta-gnome/recipes-support/florence/files/fix-no-atspi-compile.patch
 rename meta-gnome/recipes-support/florence/{florence_0.5.4.bb => florence_0.6.3.bb} (51%)

diff --git a/meta-gnome/recipes-support/florence/files/0001-Fix-glib-includes.patch b/meta-gnome/recipes-support/florence/files/0001-Fix-glib-includes.patch
deleted file mode 100644
index 83e598e..0000000
--- a/meta-gnome/recipes-support/florence/files/0001-Fix-glib-includes.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From c8419ef05ff92ffa3de2e626eb6acd5d2df3baa1 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
-Date: Tue, 15 May 2012 13:40:05 +0200
-Subject: [PATCH] Fix glib includes
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-Upstream-Status: unknown
-
-Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
----
- src/trace.c |    5 +----
- 1 files changed, 1 insertions(+), 4 deletions(-)
-
-diff --git a/src/trace.c b/src/trace.c
-index 5ea5c13..774c56d 100644
---- a/src/trace.c
-+++ b/src/trace.c
-@@ -21,10 +21,7 @@
- 
- #include "trace.h"
- #include "system.h"
--#include <glib/gprintf.h>
--#include <glib/gutils.h>
--#include <glib/gslist.h>
--#include <glib/gstrfuncs.h>
-+#include <glib.h>
- #include <stdio.h>
- #include <stdarg.h>
- 
--- 
-1.7.6.5
-
diff --git a/meta-gnome/recipes-support/florence/files/fix-no-atspi-compile.patch b/meta-gnome/recipes-support/florence/files/fix-no-atspi-compile.patch
deleted file mode 100644
index 0bb5dee..0000000
--- a/meta-gnome/recipes-support/florence/files/fix-no-atspi-compile.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-diff --git a/src/florence.c b/src/florence.c
-index b27c31b..feadefe 100644
---- a/src/florence.c
-+++ b/src/florence.c
-@@ -44,12 +44,6 @@
- /* exit signal */
- static int flo_exit=FALSE;
- 
--#ifdef ENABLE_AT_SPI2
--void flo_check_show (struct florence *florence, AtspiAccessible *obj);
--#else
--void flo_check_show (struct florence *florence, Accessible *obj);
--#endif
--
- /* Called on destroy event (systray quit or close window) */
- void flo_destroy (void)
- {
-@@ -61,6 +55,12 @@ void flo_destroy (void)
- }
- 
- #ifdef AT_SPI
-+#ifdef ENABLE_AT_SPI2
-+void flo_check_show (struct florence *florence, AtspiAccessible *obj);
-+#else
-+void flo_check_show (struct florence *florence, Accessible *obj);
-+#endif
-+
- /* Called to destroy the icon */
- void flo_icon_destroy (GtkWidget *widget, gpointer user_data)
- {
diff --git a/meta-gnome/recipes-support/florence/florence_0.5.4.bb b/meta-gnome/recipes-support/florence/florence_0.6.3.bb
similarity index 51%
rename from meta-gnome/recipes-support/florence/florence_0.5.4.bb
rename to meta-gnome/recipes-support/florence/florence_0.6.3.bb
index dfdb6bd..4c08b9f 100644
--- a/meta-gnome/recipes-support/florence/florence_0.5.4.bb
+++ b/meta-gnome/recipes-support/florence/florence_0.6.3.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Florence is a virtual keyboard (also called on-screen-keyboard), which allows the user to input text through a touchscreen."
+SUMMARY = "Florence is a virtual keyboard for touch screens"
 HOMEPAGE = "http://florence.sourceforge.net/english.html"
 
 #NOTICE: If florence can't find its gconf settings, you need to start florence with --config for one time and save the configuration once.
@@ -6,15 +6,14 @@ HOMEPAGE = "http://florence.sourceforge.net/english.html"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
-PR = "r1"
+DEPENDS = "gtk+ libxml2 libglade librsvg libxtst gconf cairo intltool-native gnome-doc-utils libnotify gstreamer1.0"
 
-DEPENDS = "gtk+ libxml2 libglade librsvg libxtst gconf cairo intltool-native gnome-doc-utils libnotify gstreamer"
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/florence/florence/${PV}-gtk2/florence-${PV}.tar.bz2 \
-           file://fix-no-atspi-compile.patch"
-SRC_URI[md5sum] = "8d5c2367a28485bfcf577650b0badab7"
-SRC_URI[sha256sum] = "26d33aa20d5fbf34ceeded4c41cb922d2988b6082e33d9acc46dd7bfe56d31a1"
+SRC_URI = "${SOURCEFORGE_MIRROR}/project/${PN}/${PN}/${PV}/${PN}-${PV}.tar.bz2"
+SRC_URI[md5sum] = "8775051d7352f75dec5a86dc9964e8e0"
+SRC_URI[sha256sum] = "422992fd07d285be73cce721a203e22cee21320d69b0fda1579ce62944c5091e"
 
 inherit gettext autotools gconf pkgconfig
 
 EXTRA_OECONF = "--disable-scrollkeeper --without-docs --without-at-spi --without-panelapplet --without-xrecord"
+
+FILES_${PN} += "${datadir}/glib-2.0/schemas"
-- 
2.7.4


