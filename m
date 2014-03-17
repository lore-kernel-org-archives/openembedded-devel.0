Return-Path: <stephen.arnold42@gmail.com>
Received: from mail-pb0-f48.google.com (mail-pb0-f48.google.com
	[209.85.160.48])
	by mail.openembedded.org (Postfix) with ESMTP id EB31B6E752
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Mar 2014 00:43:26 +0000 (UTC)
Received: by mail-pb0-f48.google.com with SMTP id md12so4954803pbc.21
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Mar 2014 17:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=fou04Kc/2z3w+/6r0456HpyGzEbU7cCy7MyqD9RvzNc=;
	b=dy9hCRz4Gqt9KlnhJYAsxOOsMZy6jaLUl//6IDLDQaU30gOZVtOHaguOVuH7Klsv1T
	gziJrmkRyZfMzgx6tEjeSHpc+oh/Hvu3TvZaNlYCYhf8KRzWAC3g9U4zoakD54tyYvGz
	uQBkNBtDxunJtnyCGVL8Q6g4uHF+OlAkMp+hbkTIi6WtX7p8uexx8eNXdqMaQfcnLKUl
	D9H0Y3bQSL+ud5p74gBe1EgezcWVXce/TcYR50//+MuTrPPWQfPuHX5ycoeNcMcXV9aj
	eHjIFgFVgpIXKSnTHKqzYd7vid3W0eno8nwS3jHQh12ranpeq7h4hD6U5r9W0MWf8YJF
	EmRw==
X-Received: by 10.68.194.65 with SMTP id hu1mr111349pbc.158.1395017007363;
	Sun, 16 Mar 2014 17:43:27 -0700 (PDT)
Received: from archimedes.arnolds.bogus
	(dsl-66-59-252-223.static.linkline.com. [66.59.252.223])
	by mx.google.com with ESMTPSA id x9sm37948338pbu.1.2014.03.16.17.43.25
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 16 Mar 2014 17:43:26 -0700 (PDT)
From: Stephen Arnold <stephen.arnold42@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 16 Mar 2014 17:43:15 -0700
Message-Id: <1395016995-19191-1-git-send-email-stephen.arnold42@gmail.com>
X-Mailer: git-send-email 1.8.5.3
Subject: [meta-xfce][PATCH v2 1/1] recipes-xfce/libxfce4ui: build fixes
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
X-List-Received-Date: Mon, 17 Mar 2014 00:43:29 -0000

From: "Stephen Arnold" <stephen.arnold42@gmail.com>

libxfce4ui build fixes:
 - updated depends
 - set SRCREV to 4.10.0 tag
 - added missing inherit 
 - added pre-config task

Signed-off-by: Stephen Arnold <stephen.arnold42@gmail.com>

---
 .../recipes-xfce/libxfce4ui/libxfce4ui_4.10.0.bb   | 23 ++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.10.0.bb b/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.10.0.bb
index cc63a9f..b17ebc1 100644
--- a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.10.0.bb
+++ b/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.10.0.bb
@@ -2,23 +2,28 @@ SUMMARY = "Xfce4 Widget library and X Window System interaction"
 SECTION = "x11/libs"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=252890d9eee26aab7b432e8b8a616475"
-DEPENDS = "gtk+ intltool libxfce4util startup-notification xfconf glade3"
+DEPENDS = "perl-native glib-2.0 gtk+ intltool libxfce4util xfconf xfce4-dev-tools virtual/libx11 libsm libice"
 
-inherit xfce
+inherit autotools gettext xfce
 
 SRC_URI = " \
     git://git.xfce.org/xfce/libxfce4ui;protocol=git \
     file://0001-libxfce4kbd-private-xfce4-keyboard-shortcuts.xml-fix.patch \
-    file://0002-configure.ac.in-remove-optional-gtk3-support.patch \
 "
-SRCREV = "530b72f50fcbd8cb4b970fcc97be0321bf78183e"
-PV = "4.10.0+git${SRCPV}"
+
+SRCREV = "cf85eac7804e09b24f3e8fb4165f60b1c9f8cf49"
+PV = "4.10.0"
 S = "${WORKDIR}/git"
 
-EXTRA_OECONF += "--enable-maintainer-mode --disable-debug"
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[gladeui] = "--enable-gladeui,--disable-gladeui,glade3"
+PACKAGECONFIG[startup-notification] = "--enable-startup-notification,--disable-startup-notification,startup-notification"
+
+EXTRA_OECONF += "--enable-maintainer-mode --disable-debug --with-vendor-info=${DISTRO}"
 
-do_configure_prepend() {
-       NOCONFIGURE=yes ./autogen.sh
+do_patch_extra() {
+    sed -i /GTK3/d ${S}/configure.ac.in
+    NOCONFIGURE=yes ./autogen.sh
 }
 
 FILES_${PN}-dbg += "${libdir}/glade3/modules/.debug"
@@ -27,3 +32,5 @@ FILES_${PN}-dev += "${libdir}/glade3/modules/*.la \
 PACKAGES += "${PN}-glade"
 FILES_${PN}-glade = "${libdir}/glade3 \
                      ${datadir}/glade3"
+
+addtask do_patch_extra before do_configure after do_patch
-- 
1.8.5.3


