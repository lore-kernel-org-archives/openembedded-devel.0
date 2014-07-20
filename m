Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id 64E6E70518
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Jul 2014 19:43:46 +0000 (UTC)
Received: by mail-wi0-f169.google.com with SMTP id n3so3298409wiv.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Jul 2014 12:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=liImO7m9lwZuIqhKlhmYrqthQd0XwhE+t222D5shDrw=;
	b=oR1aT8ifI+bc7xUOlz6rSiOgYdsZLLjUdzjH+/VUEQCdNgSJ4b7c7Hg7dfuwlvmbkz
	2erzohVH3qIsuEWdKxzAZnKwVVIhZTy5mpqO2j76KlOg2cYscMvflUhezJV+EW8ZJJdb
	Ee4ZV544uK645JwlAaccWnV/sdA+AwaUB4hpGABOurwMmCmX2NiXtMXmCWWake8Ze5ez
	3qrQ5JvPu0lv4b1qmoMyqVhu5XaYsvmj4jtGnNnYYrgCrBgIe7oeeuy/13+dqnNBXiw+
	cjaxk8+yN+fOJMnKuEMAFtKqTjZwuN0u6uPOJBvu3UqZdpMgDSaIUlSBJTZWEY8nAA1P
	E76Q==
X-Received: by 10.180.36.238 with SMTP id t14mr27459809wij.38.1405885427523;
	Sun, 20 Jul 2014 12:43:47 -0700 (PDT)
Received: from localhost ([89.176.104.3]) by mx.google.com with ESMTPSA id
	fb8sm33319490wib.15.2014.07.20.12.43.46 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 20 Jul 2014 12:43:46 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 20 Jul 2014 21:43:57 +0200
Message-Id: <1405885437-17668-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.0
Subject: [meta-oe][WIP][PATCH] pidgin: upgrade to 2.10.9 and fold pidgin.inc into it
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
X-List-Received-Date: Sun, 20 Jul 2014 19:43:47 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../pidgin/{pidgin.inc => pidgin_2.10.9.bb}        | 41 +++++++++++++++-------
 meta-oe/recipes-support/pidgin/pidgin_2.7.9.bb     | 23 ------------
 2 files changed, 28 insertions(+), 36 deletions(-)
 rename meta-oe/recipes-support/pidgin/{pidgin.inc => pidgin_2.10.9.bb} (77%)
 delete mode 100644 meta-oe/recipes-support/pidgin/pidgin_2.7.9.bb

diff --git a/meta-oe/recipes-support/pidgin/pidgin.inc b/meta-oe/recipes-support/pidgin/pidgin_2.10.9.bb
similarity index 77%
rename from meta-oe/recipes-support/pidgin/pidgin.inc
rename to meta-oe/recipes-support/pidgin/pidgin_2.10.9.bb
index 8eac64a..b635352 100644
--- a/meta-oe/recipes-support/pidgin/pidgin.inc
+++ b/meta-oe/recipes-support/pidgin/pidgin_2.10.9.bb
@@ -2,23 +2,38 @@ DESCRIPTION = "multi-protocol instant messaging client"
 SECTION = "x11/network"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
-DEPENDS = "python startup-notification avahi gtk+ ncurses gnutls virtual/libintl gstreamer dbus intltool-native"
-INC_PR = "r3"
+DEPENDS = "python startup-notification avahi gtk+ ncurses gnutls virtual/libintl gstreamer dbus intltool-native farsight2 libidn"
 
 inherit autotools gettext pkgconfig gconf perlnative
 
+SRC_URI = "\
+    ${SOURCEFORGE_MIRROR}/pidgin/pidgin-${PV}.tar.bz2 \
+    file://sanitize-configure.ac.patch \
+    file://pidgin.desktop-set-icon.patch \
+    file://purple-OE-branding-25.patch \
+    file://pidgin-cross-python-265.patch \
+"
+
+SRC_URI[md5sum] = "10a4a69d077893f6dd3438cd8af94e81"
+SRC_URI[sha256sum] = "dc362ed8577f623eea4554a79e917073aa726825074fea402f2e515f0f51f319"
+
 EXTRA_OECONF = " \
-        --enable-vv \
-        --disable-perl \
-        --disable-tcl \
-        --disable-gevolution \
-        --disable-schemas-install \
-        --x-includes=${STAGING_INCDIR} \
-        --x-libraries=${STAGING_LIBDIR} \
-        --enable-gnutls=yes \
-        --with-ncurses-headers=${STAGING_INCDIR} \
-        --with-gnutls-includes=${STAGING_INCDIR} \
-        --with-gnutls-libs=${STAGING_LIBDIR} \
+    --enable-vv \
+    --disable-perl \
+    --disable-tcl \
+    --disable-gevolution \
+    --disable-schemas-install \
+    --x-includes=${STAGING_INCDIR} \
+    --x-libraries=${STAGING_LIBDIR} \
+    --enable-gnutls=yes \
+    --with-ncurses-headers=${STAGING_INCDIR} \
+    --with-gnutls-includes=${STAGING_INCDIR} \
+    --with-gnutls-libs=${STAGING_LIBDIR} \
+    --disable-gtkspell \
+    --disable-meanwhile \
+    --disable-nm \
+    --disable-screensaver \
+    --enable-nss=no \
 "
 
 do_configure_prepend() {
diff --git a/meta-oe/recipes-support/pidgin/pidgin_2.7.9.bb b/meta-oe/recipes-support/pidgin/pidgin_2.7.9.bb
deleted file mode 100644
index 3ce3cc3..0000000
--- a/meta-oe/recipes-support/pidgin/pidgin_2.7.9.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-require pidgin.inc
-PR = "${INC_PR}.3"
-
-DEPENDS += "farsight2 libidn"
-
-SRC_URI = "\
-    ${SOURCEFORGE_MIRROR}/pidgin/pidgin-${PV}.tar.bz2 \
-    file://sanitize-configure.ac.patch \
-    file://pidgin.desktop-set-icon.patch \
-    file://purple-OE-branding-25.patch \
-    file://pidgin-cross-python-265.patch \
-"
-
-SRC_URI[md5sum] = "9bc6cf953ed7d383b215fa8487bf8829"
-SRC_URI[sha256sum] = "9722d7f199a6704e29900c80f270d9409d5c28caab77f495b68108d81ba3e19e"
-
-EXTRA_OECONF += "\
-    --disable-gtkspell \
-    --disable-meanwhile \
-    --disable-nm \
-    --disable-screensaver \
-    --enable-nss=no \
-"
-- 
2.0.0


