Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f173.google.com (mail-we0-f173.google.com
	[74.125.82.173])
	by mail.openembedded.org (Postfix) with ESMTP id 022C96FD1F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jun 2014 09:17:04 +0000 (UTC)
Received: by mail-we0-f173.google.com with SMTP id t60so2052452wes.32
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jun 2014 02:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=UEyNOMhXP1D8hYZ+bwlEnUYOWEjg81pICWpLAmsjuvQ=;
	b=UKPjNtJ30Os69y0PzTL2iNTCnAIHASobXQph1gQBGrMFefxyqNKycg5kyPxTE3iELL
	gPSHR+4gSAQYnQumKdw/GMW+qkbjrqh3xGtDv5H/fcCw41E0h6LOTG2NXb0T+9RqR6S5
	E1w7sczDVrS3vnC1sDRF/JCEbGQRGriDKZxyFkW5ANovME/aZeBA6ZpTh9gP3xIpgRLX
	X7ZV41TBTWZKmNSmZ18ltCPwiwYfnw1azaif0voR0ztdpY4rGO3ETPgDoWeQLJ5sLuRv
	VJoGn37EvNJnU/3p6n/ue1F5ANvbcHUdSYFrS0MvEzZgEGxtlSK1abJcwRwWr8x70rnR
	Uv+A==
X-Received: by 10.194.83.39 with SMTP id n7mr3725698wjy.58.1403169425005;
	Thu, 19 Jun 2014 02:17:05 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ht5sm7433106wjb.49.2014.06.19.02.17.04 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 19 Jun 2014 02:17:04 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Jun 2014 11:16:10 +0200
Message-Id: <1403169370-25266-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.0
Subject: [meta-oe][WIP][PATCH] libgsf, gnumeric, wv, goffice: Blacklist because of broken libgsf after glib upgrade
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
X-List-Received-Date: Thu, 19 Jun 2014 09:17:08 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-gnome/gnumeric/gnumeric_1.12.0.bb | 2 ++
 meta-gnome/recipes-gnome/libgsf/libgsf_1.14.26.bb    | 2 ++
 meta-gnome/recipes-gnome/wv/wv_1.2.0.bb              | 2 ++
 meta-gnome/recipes-support/goffice/goffice_0.10.1.bb | 2 ++
 4 files changed, 8 insertions(+)

diff --git a/meta-gnome/recipes-gnome/gnumeric/gnumeric_1.12.0.bb b/meta-gnome/recipes-gnome/gnumeric/gnumeric_1.12.0.bb
index 3c7d92f..955148d 100644
--- a/meta-gnome/recipes-gnome/gnumeric/gnumeric_1.12.0.bb
+++ b/meta-gnome/recipes-gnome/gnumeric/gnumeric_1.12.0.bb
@@ -5,6 +5,8 @@ S = "${WORKDIR}/gnumeric-${PV}"
 DEPENDS = "gdk-pixbuf libgsf gtk+3 libxml2 libglade libart-lgpl intltool-native libgnomecanvas libgnomeprint libbonoboui orbit2-native goffice"
 SUMMARY = "Gnumeric spreadsheet for GNOME"
 
+PNBLACKLIST[gnumeric] = "BROKEN: depends on broken libgsf"
+
 GNOME_COMPRESS_TYPE = "xz"
 
 inherit gnome
diff --git a/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.26.bb b/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.26.bb
index d08552a..7d7776c 100644
--- a/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.26.bb
+++ b/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.26.bb
@@ -7,6 +7,8 @@ SECTION = "libs"
 
 DEPENDS= "libxml2 bzip2 glib-2.0 zlib"
 
+PNBLACKLIST[libgsf] = "BROKEN: since glib upgrade error: implicit declaration of function 'g_memmove' [-Werror=implicit-function-declaration]"
+
 inherit autotools pkgconfig gnome gconf
 
 SRC_URI[archive.md5sum] = "3c5a4fbd16a727c36974078e6d0e9575"
diff --git a/meta-gnome/recipes-gnome/wv/wv_1.2.0.bb b/meta-gnome/recipes-gnome/wv/wv_1.2.0.bb
index 1e385d3..c125696 100644
--- a/meta-gnome/recipes-gnome/wv/wv_1.2.0.bb
+++ b/meta-gnome/recipes-gnome/wv/wv_1.2.0.bb
@@ -3,6 +3,8 @@ HOMEPAGE = "http://wvware.sourceforge.net/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6cbca01f1c9178aca280e8ff64d85b2f"
 
+PNBLACKLIST[wv] = "BROKEN: depends on broken libgsf"
+
 DEPENDS = "libgsf glib-2.0 libpng"
 PR = "r5"
 
diff --git a/meta-gnome/recipes-support/goffice/goffice_0.10.1.bb b/meta-gnome/recipes-support/goffice/goffice_0.10.1.bb
index 24c4d0f..b64119d 100644
--- a/meta-gnome/recipes-support/goffice/goffice_0.10.1.bb
+++ b/meta-gnome/recipes-support/goffice/goffice_0.10.1.bb
@@ -3,6 +3,8 @@ DESCRIPTION="Gnome Office Library"
 LICENSE="GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6dc33ff21e1ba1ac1a2a1069d361e29e"
 
+PNBLACKLIST[goffice] = "BROKEN: depends on broken libgsf"
+
 DEPENDS = "libxml-parser-perl-native glib-2.0 gtk+3 pango cairo libgsf libpcre libxml2 libart-lgpl librsvg"
 
 inherit gnomebase pkgconfig perlnative
-- 
2.0.0


