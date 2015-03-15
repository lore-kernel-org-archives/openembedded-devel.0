Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-we0-f174.google.com (mail-we0-f174.google.com
	[74.125.82.174])
	by mail.openembedded.org (Postfix) with ESMTP id 6DAB16AC43
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Mar 2015 23:33:59 +0000 (UTC)
Received: by wegp1 with SMTP id p1so26854934weg.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Mar 2015 16:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=obP/El/INaoPzBiIOU46FxJar0KkRtAZfe20PVT5S+w=;
	b=y3iLBDl4U6WAAtEqECMERHQ4bkCT8iTw0cRMhsSY7UkHMPcKIv5Ahku7VV4aJmHfB3
	d3DL/UG5Zhf1Hqj7Um0j/0H0Nk71etyG2bptgZU9x+qd7YDH12FWxC9MtalbE6N1pBpX
	LqD9Ym7xoHGS10GSEtLnr2iVM3wkN+UalnxmAJuKD8zDtbRSXmK0P6JxE+Co0cJGlX+c
	M+5FbRbgBsHwBNRsRv/LCxwFmbR7PrvDqy5al0zp5MHMV/vBtdfBPKcdlpCvE0GfMBoB
	8ZSz5/3ckAQmHrbZ44/pJMolCTfWf7XF86WTt7dBDHTPyapdDDz0uQbo88bQ0IIfHS+O
	UAmw==
X-Received: by 10.180.76.147 with SMTP id k19mr84997418wiw.92.1426462440259;
	Sun, 15 Mar 2015 16:34:00 -0700 (PDT)
Received: from localhost.localdomain (p54AA52CC.dip0.t-ipconnect.de.
	[84.170.82.204]) by mx.google.com with ESMTPSA id
	r14sm12804945wiv.13.2015.03.15.16.33.58
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 15 Mar 2015 16:33:59 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Mar 2015 00:33:14 +0100
Message-Id: <1426462419-10173-6-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1426462419-10173-1-git-send-email-schnitzeltony@googlemail.com>
References: <1426462419-10173-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH][meta-xfce 05/30] libxfce4ui: update to 4.12.1
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
X-List-Received-Date: Sun, 15 Mar 2015 23:33:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...> 0002-configure.ac-remove-optional-gtk3-support.patch} | 10 +++++-----
 .../{libxfce4ui_4.10.0.bb => libxfce4ui_4.12.1.bb}         | 14 ++++++--------
 2 files changed, 11 insertions(+), 13 deletions(-)
 rename meta-xfce/recipes-xfce/libxfce4ui/files/{0002-configure.ac.in-remove-optional-gtk3-support.patch => 0002-configure.ac-remove-optional-gtk3-support.patch} (86%)
 rename meta-xfce/recipes-xfce/libxfce4ui/{libxfce4ui_4.10.0.bb => libxfce4ui_4.12.1.bb} (69%)

diff --git a/meta-xfce/recipes-xfce/libxfce4ui/files/0002-configure.ac.in-remove-optional-gtk3-support.patch b/meta-xfce/recipes-xfce/libxfce4ui/files/0002-configure.ac-remove-optional-gtk3-support.patch
similarity index 86%
rename from meta-xfce/recipes-xfce/libxfce4ui/files/0002-configure.ac.in-remove-optional-gtk3-support.patch
rename to meta-xfce/recipes-xfce/libxfce4ui/files/0002-configure.ac-remove-optional-gtk3-support.patch
index a93fabf..e154711 100644
--- a/meta-xfce/recipes-xfce/libxfce4ui/files/0002-configure.ac.in-remove-optional-gtk3-support.patch
+++ b/meta-xfce/recipes-xfce/libxfce4ui/files/0002-configure.ac-remove-optional-gtk3-support.patch
@@ -1,7 +1,7 @@
 From d61dc6718a2abaf70d19f17d34128cb7e161e057 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
 Date: Wed, 18 Sep 2013 20:50:11 +0200
-Subject: [PATCH] configure.ac.in: remove optional gtk3 support
+Subject: [PATCH] configure.ac: remove optional gtk3 support
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
@@ -12,13 +12,13 @@ Upstream-Status: Inappropriate [configuration]
 
 Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
 ---
- configure.ac.in | 6 ------
+ configure.ac | 6 ------
  1 file changed, 6 deletions(-)
 
-diff --git a/configure.ac.in b/configure.ac.in
+diff --git a/configure.ac b/configure.ac
 index e47df04..b6edab1 100644
---- a/configure.ac.in
-+++ b/configure.ac.in
+--- a/configure.ac
++++ b/configure.ac
 @@ -129,12 +129,6 @@ XDT_CHECK_PACKAGE([GOBJECT], [gobject-2.0], [2.28.0])
  XDT_CHECK_PACKAGE([GTK2], [gtk+-2.0], [2.24.0])
  XDT_CHECK_PACKAGE([LIBXFCE4UTIL], [libxfce4util-1.0], [4.10.0])
diff --git a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.10.0.bb b/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.12.1.bb
similarity index 69%
rename from meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.10.0.bb
rename to meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.12.1.bb
index 6534f94..36f42d3 100644
--- a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.10.0.bb
+++ b/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.12.1.bb
@@ -4,18 +4,16 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=252890d9eee26aab7b432e8b8a616475"
 DEPENDS = "perl-native glib-2.0 gtk+ intltool libxfce4util xfconf xfce4-dev-tools virtual/libx11 libsm libice"
 
-inherit autotools gettext gtk-doc xfce xfce-git
+inherit xfce autotools gettext gtk-doc
 
-SRC_URI = " \
-    git://git.xfce.org/xfce/libxfce4ui;protocol=git \
+SRC_URI += " \
     file://0001-libxfce4kbd-private-xfce4-keyboard-shortcuts.xml-fix.patch \
-    file://0002-configure.ac.in-remove-optional-gtk3-support.patch \
+    file://0002-configure.ac-remove-optional-gtk3-support.patch \
 "
-SRCREV = "530b72f50fcbd8cb4b970fcc97be0321bf78183e"
-PV = "4.10.0+git${SRCPV}"
-S = "${WORKDIR}/git"
+SRC_URI[md5sum] = "ea9fad7d059fe8f531fe8db42dabb5a9"
+SRC_URI[sha256sum] = "3d619811bfbe7478bb984c16543d980cadd08586365a7bc25e59e3ca6384ff43"
 
-EXTRA_OECONF += "--enable-maintainer-mode --disable-debug  --with-vendor-info=${DISTRO}"
+EXTRA_OECONF += "--with-vendor-info=${DISTRO}"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[gladeui] = "--enable-gladeui,--disable-gladeui,glade3"
-- 
1.9.3


