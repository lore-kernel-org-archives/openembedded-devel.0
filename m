Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 301C173175
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Feb 2016 08:31:42 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id p63so16984434wmp.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Feb 2016 00:31:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=RBdAvZ93OmpfbB9r+py8IU9IMQQ5pq3JK9n2OOi7uIc=;
	b=B2wIrKEhl8hf8nsJjpdSGn3tXqro2Lzc5QBbsAWEf7I0JwWEJLCzJDtCyAKoYg/ciu
	4+IDMbbVsxzcD33aSyjrr3jV6eZrV2lSaAs6g5tf+LvZ8oQNp+sTk5+rZjjxO8cAqsPW
	uLu3ZDjNcTVN0+uZ3NGCzmB9StoH5VTRmdnPy1HamxuibZz79K/CgRSdUVJ6xktA9Hbm
	OGZabAeUImqG+32GO5jRK1QCZcEjP7DHcu0iP4dxlpC8nYKcx84PaLYB0mEX18PYEzKc
	rMDk+K/QsTFKhZWpltu3OcIfVBIDSuZbNumum/ly8ZHQscohWkXUrPb6hoB+ONwKkBKJ
	utIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-type:content-transfer-encoding;
	bh=RBdAvZ93OmpfbB9r+py8IU9IMQQ5pq3JK9n2OOi7uIc=;
	b=Bml2UzxT4bKcIiWV75Qv9rwNzTDZnmFkICvcI00KKPYBK3YNNsNFd/XJkv76g0L1Ot
	ZNufa6lsam5WAzixxmuPSfOVOc/1mr6bnseKQVt2AVp6PfZkGl/8PwLhicIkJrM0KJTi
	MiYgyq7OkxEa2DLzadSflQxwM629HL6sDc11pu/zH28JffF2QvXDLv4lvTwVo0LUsIFc
	pzMbTV2Eqd0HnkB2P3XyB7z7X0kfyvv4t5P+X8TY2zoHG427quU76nDCvyVbhXySCzQM
	jEegwBsz3rp0O2ttnq6q6phcVfhhndTe8DewmDVZxtBlbHx7nQrx34gWIScsSpupwKlI
	CuTw==
X-Gm-Message-State: AG10YOSd6iyZG80nTmUrXrqesLCm1vJsNcxtT0+tko8R3goz8kmpKhJNGJDGWYeAnFbZfg==
X-Received: by 10.194.175.104 with SMTP id bz8mr36568000wjc.8.1455093103015;
	Wed, 10 Feb 2016 00:31:43 -0800 (PST)
Received: from localhost.localdomain
	(ip-176-198-253-155.hsi05.unitymediagroup.de. [176.198.253.155])
	by smtp.googlemail.com with ESMTPSA id
	r10sm1817724wjz.24.2016.02.10.00.31.42
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 10 Feb 2016 00:31:42 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 10 Feb 2016 09:31:13 +0100
Message-Id: <1455093073-10531-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Subject: [PATCH] lxdm: update to 0.5.3
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
X-List-Received-Date: Wed, 10 Feb 2016 08:31:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* we go back to released sources
* parts of patch 0002.. were applied - have tried to discuss with project's
  maintainer without success

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../lxdm/0002-let-autotools-create-lxdm.conf.patch | 29 +---------------------
 .../lxdm/{lxdm_git.bb => lxdm_0.5.3.bb}            |  8 +++---
 2 files changed, 4 insertions(+), 33 deletions(-)
 rename meta-oe/recipes-graphics/lxdm/{lxdm_git.bb => lxdm_0.5.3.bb} (93%)

diff --git a/meta-oe/recipes-graphics/lxdm/lxdm/0002-let-autotools-create-lxdm.conf.patch b/meta-oe/recipes-graphics/lxdm/lxdm/0002-let-autotools-create-lxdm.conf.patch
index 43f542a..75dc10c 100644
--- a/meta-oe/recipes-graphics/lxdm/lxdm/0002-let-autotools-create-lxdm.conf.patch
+++ b/meta-oe/recipes-graphics/lxdm/lxdm/0002-let-autotools-create-lxdm.conf.patch
@@ -14,36 +14,9 @@ Upstream-Status: submitted [1]
 
 Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
 ---
- configure.ac      | 1 +
- data/Makefile.am  | 5 -----
  data/lxdm.conf.in | 2 +-
- 3 files changed, 2 insertions(+), 6 deletions(-)
+ 1 file changed, 2 insertions(+), 2 deletions(-)
 
-diff --git a/configure.ac b/configure.ac
-index f28c89a..a2fff5b 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -183,6 +183,7 @@ AC_CONFIG_FILES([
- 	data/PreReboot
- 	data/PreShutdown
- 	data/LoginReady
-+	data/lxdm.conf
- ])
- AC_CONFIG_FILES([data/lxdm], [chmod +x data/lxdm])
- AC_OUTPUT
-diff --git a/data/Makefile.am b/data/Makefile.am
-index 9500da9..ad64b11 100644
---- a/data/Makefile.am
-+++ b/data/Makefile.am
-@@ -1,8 +1,3 @@
--FULL_LIBEXECDIR=$(libexecdir)
--
--lxdm.conf: lxdm.conf.in
--	cat lxdm.conf.in | sed 's,@FULL_LIBEXECDIR@,$(FULL_LIBEXECDIR),' > $@
--
- NULL=
- 
- sbin_SCRIPTS = lxdm
 diff --git a/data/lxdm.conf.in b/data/lxdm.conf.in
 index d93f280..6206262 100644
 --- a/data/lxdm.conf.in
diff --git a/meta-oe/recipes-graphics/lxdm/lxdm_git.bb b/meta-oe/recipes-graphics/lxdm/lxdm_0.5.3.bb
similarity index 93%
rename from meta-oe/recipes-graphics/lxdm/lxdm_git.bb
rename to meta-oe/recipes-graphics/lxdm/lxdm_0.5.3.bb
index 29b8dc5..2277092 100644
--- a/meta-oe/recipes-graphics/lxdm/lxdm_git.bb
+++ b/meta-oe/recipes-graphics/lxdm/lxdm_0.5.3.bb
@@ -3,15 +3,15 @@ HOMEPAGE = "http://blog.lxde.org/?p=531"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 SRC_URI = " \
-    git://lxde.git.sourceforge.net/gitroot/lxde/${BPN};branch=master \
+    ${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}%20${PV}/${BPN}-${PV}.tar.xz \
     file://lxdm.conf \
     ${@base_contains('DISTRO_FEATURES', 'pam', 'file://lxdm-pam file://lxdm-pam-debug', '', d)} \
     ${@base_contains("DISTRO_TYPE", "debug", "", "file://0001-lxdm.conf.in-blacklist-root-for-release-images.patch",d)} \
     file://0002-let-autotools-create-lxdm.conf.patch \
 "
+SRC_URI[md5sum] = "061caae432634e6db38bbdc84bc6ffa0"
+SRC_URI[sha256sum] = "4891efee81c72a400cc6703e40aa76f3f3853833d048b72ec805da0f93567f2f"
 
-SRCREV = "bf90ec7df5ff6745f703500c5792c344fbaef301"
-PV = "0.5.0+git${SRCPV}"
 PE = "1"
 
 DEPENDS = "virtual/libintl intltool-native cairo dbus gdk-pixbuf glib-2.0 gtk+ virtual/libx11 libxcb pango iso-codes"
@@ -24,8 +24,6 @@ inherit autotools pkgconfig gettext systemd distro_features_check
 # depends on virtual/libx11
 REQUIRED_DISTRO_FEATURES = "x11"
 
-S = "${WORKDIR}/git"
-
 CFLAGS_append = " -fno-builtin-fork -fno-builtin-memset -fno-builtin-strstr "
 
 EXTRA_OECONF += "--enable-gtk3=no --enable-password=yes --with-x -with-xconn=xcb \
-- 
2.5.0


