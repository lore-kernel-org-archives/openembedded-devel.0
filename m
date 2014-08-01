Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f181.google.com (mail-we0-f181.google.com
	[74.125.82.181])
	by mail.openembedded.org (Postfix) with ESMTP id 3516C706D2
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Aug 2014 13:35:14 +0000 (UTC)
Received: by mail-we0-f181.google.com with SMTP id k48so4389501wev.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Aug 2014 06:35:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=SjqFeZ/cVCkPysENdN7YmG5gpRc3hsD+xfJm2a4PIrQ=;
	b=GIg7vk24HoGKFBOZWlb1Yeue4/puHlsC/Zjdw2aRjHh/plpi2oL5i6S+INiNk3L0yK
	aTa0EW/gyUbPXiuXbWZj5DwBEiGwxYfEMKTJsVVvZbfqRnZLfXMtK2naMr0wuzHxRK5Y
	gyvOT+7C3Z5FXz752K9GfkHRHxp8TapV++EnhHJnJoJshD86sRJh7bbiM/optc85Xlhg
	365ax2mmnpQWX2Q0k+8JjCWjfnTtQgZArCsspfdfh0pjHoL61zPVskEbym4MN98SHp4a
	tSqZjocwLNb3kOnNuBHk/hnnLgGwYUIcPi1dbQByefqeCySq+6QKgLe6RUJFbPav2+TS
	nA0g==
X-Gm-Message-State: ALoCoQlnqz93zRH4+T9YmxATOTah+FySKwsAHeN/tYKicZs+HUK9zJihZEX1p8SP79sOFF/l/ilV
X-Received: by 10.180.96.33 with SMTP id dp1mr7017218wib.20.1406900115692;
	Fri, 01 Aug 2014 06:35:15 -0700 (PDT)
Received: from localhost ([2001:610:612:0:beee:7bff:fe9e:ae56])
	by mx.google.com with ESMTPSA id gl4sm8771918wib.19.2014.08.01.06.35.14
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 01 Aug 2014 06:35:14 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  1 Aug 2014 15:34:52 +0200
Message-Id: <1406900096-31368-6-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <1406900096-31368-1-git-send-email-koen@dominion.thruhere.net>
References: <1406900096-31368-1-git-send-email-koen@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-gnome][PATCH 06/10] wv: update to 1.2.4
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
X-List-Received-Date: Fri, 01 Aug 2014 13:35:16 -0000

Also fix automake foreign problems.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 ...se-foreign-mode-to-avoid-errors-with-miss.patch | 29 ++++++++++++++++++++++
 .../wv/{wv-1.2.0 => wv-1.2.4}/pkgconfig.patch      |  0
 .../recipes-gnome/wv/{wv_1.2.0.bb => wv_1.2.4.bb}  | 12 ++++-----
 3 files changed, 35 insertions(+), 6 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/wv/wv-1.2.4/0001-configure-use-foreign-mode-to-avoid-errors-with-miss.patch
 rename meta-gnome/recipes-gnome/wv/{wv-1.2.0 => wv-1.2.4}/pkgconfig.patch (100%)
 rename meta-gnome/recipes-gnome/wv/{wv_1.2.0.bb => wv_1.2.4.bb} (57%)

diff --git a/meta-gnome/recipes-gnome/wv/wv-1.2.4/0001-configure-use-foreign-mode-to-avoid-errors-with-miss.patch b/meta-gnome/recipes-gnome/wv/wv-1.2.4/0001-configure-use-foreign-mode-to-avoid-errors-with-miss.patch
new file mode 100644
index 0000000..a8c5bc7
--- /dev/null
+++ b/meta-gnome/recipes-gnome/wv/wv-1.2.4/0001-configure-use-foreign-mode-to-avoid-errors-with-miss.patch
@@ -0,0 +1,29 @@
+From eebe1f27f4b27b05eb4b9b55f9df1124acf4d092 Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Fri, 1 Aug 2014 12:25:24 +0200
+Subject: [PATCH] configure: use 'foreign' mode to avoid errors with missing
+ NEWS/AUTHORS/etc
+
+Upstream-status: Pending
+
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 3d7eef6..1784bdd 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -41,7 +41,7 @@ VERSION=$WV_VERSION
+ PACKAGE=wv
+ 
+ dnl Initialize automake stuff
+-AM_INIT_AUTOMAKE($PACKAGE, $VERSION)
++AM_INIT_AUTOMAKE([foreign])
+ 
+ # Specify a configuration file
+ AM_CONFIG_HEADER(config.h)
+-- 
+1.9.0
+
diff --git a/meta-gnome/recipes-gnome/wv/wv-1.2.0/pkgconfig.patch b/meta-gnome/recipes-gnome/wv/wv-1.2.4/pkgconfig.patch
similarity index 100%
rename from meta-gnome/recipes-gnome/wv/wv-1.2.0/pkgconfig.patch
rename to meta-gnome/recipes-gnome/wv/wv-1.2.4/pkgconfig.patch
diff --git a/meta-gnome/recipes-gnome/wv/wv_1.2.0.bb b/meta-gnome/recipes-gnome/wv/wv_1.2.4.bb
similarity index 57%
rename from meta-gnome/recipes-gnome/wv/wv_1.2.0.bb
rename to meta-gnome/recipes-gnome/wv/wv_1.2.4.bb
index c125696..6489c6f 100644
--- a/meta-gnome/recipes-gnome/wv/wv_1.2.0.bb
+++ b/meta-gnome/recipes-gnome/wv/wv_1.2.4.bb
@@ -3,15 +3,15 @@ HOMEPAGE = "http://wvware.sourceforge.net/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6cbca01f1c9178aca280e8ff64d85b2f"
 
-PNBLACKLIST[wv] = "BROKEN: depends on broken libgsf"
-
 DEPENDS = "libgsf glib-2.0 libpng"
-PR = "r5"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/wvware/wv-${PV}.tar.gz \
-           file://pkgconfig.patch"
-SRC_URI[md5sum] = "b6319d5e75611fe2210453b5feb82c0c"
-SRC_URI[sha256sum] = "a76f44468e78591e6d510d326702e7c3999d2b9dd3ab8ab8c1c9811fd5b111e4"
+           file://pkgconfig.patch \
+           file://0001-configure-use-foreign-mode-to-avoid-errors-with-miss.patch \
+          "
+
+SRC_URI[md5sum] = "c1861c560491f121e12917fa76970ac5"
+SRC_URI[sha256sum] = "673109910e22d4cf94cc8be4dcb9a0c41b5fbdb1736d4b7bdc7778894d57c2d6"
 
 inherit autotools pkgconfig
 
-- 
1.9.0


