Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 2F35B7EF63
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Jul 2019 07:09:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45sXm42v2Yz4t
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Jul 2019 09:09:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1563779364;
	bh=E/b0LllKLEL/5oVbq/9ySKb2f7mN7pTbThoOYspud14=;
	h=From:To:Subject:Date:From;
	b=oOhGBy6zRYPnn6df2sRThV2lOkJHHP/lCkkXoe2lpR24TpQtlaRjiWguNGne/FKY5
	AaQ93TOPGStvDFUp+jlsS/KQqXb58JEZUH73RIeSVKjjxKg14M8q2891iqtwo/mWpQ
	j8kHpB/rcUoBW+wknspBWYhlf7Is0NjtGZHjwtNciisuG619jmTbr1bUN03wLB9kQw
	CkELrbV/X8pD/Eszqn+1WOc15dvdtR9L8JWxhhGrsmlaKZ8iemfI/IUYU9gz8uUr0h
	iCHpaN6WebJq02OegzMmHsc2uBUSvb9pHu4MdKviz4+Z/sD/O686hp2ZJyWDUDabYt
	p8nhQvEPyYHj7+CXRRCYFsbTKvdXE3ftwtg0eR5SHphPPFZHhdt0Jm8Pp5Iv6O8/ts
	k3G21n7IvZC5uRoabsyGdg/ECrl+kDBQ+EE0Pdk1HpL+cR+zVuRAzrkp8bMHqIWU4u
	DtbALQueyMb3yZFr4g/2MWHKKf17ejKTdYiI76PA+qfodnFJAjgvs5JWP9wGoeSEbo
	vxFg8p0+l1KvKmlmkYVxCPhZGsjhY/qe0CTvmcQOz64cxrLG9uo3Ykk/ANnLRhWi0+
	xASYLhPbit7cvKlv+oy753/1HDisSBmqIp2gEgk/5W+u2VT6TlMZS2fzbNCKKxWGFP
	d6ghTg7nxfigcTqfw+EnBVic=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Jul 2019 10:09:19 +0300
Message-Id: <20190722070919.27579-2-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-gnome][PATCH] meta-gnome: Remove GNOME_COMPRESS_TYPE = "xz" in recipes
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
X-List-Received-Date: Mon, 22 Jul 2019 07:09:24 -0000

This is the default value.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta-gnome/recipes-gnome/libgnome/libgnomekbd_3.26.1.bb | 2 --
 meta-gnome/recipes-gnome/libgsf/libgsf_1.14.45.bb       | 2 --
 meta-gnome/recipes-gnome/libwnck/libwnck_2.31.0.bb      | 1 -
 3 files changed, 5 deletions(-)

diff --git a/meta-gnome/recipes-gnome/libgnome/libgnomekbd_3.26.1.bb b/meta-gnome/recipes-gnome/libgnome/libgnomekbd_3.26.1.bb
index 3a7379f9e..7babbd0a8 100644
--- a/meta-gnome/recipes-gnome/libgnome/libgnomekbd_3.26.1.bb
+++ b/meta-gnome/recipes-gnome/libgnome/libgnomekbd_3.26.1.bb
@@ -10,8 +10,6 @@ inherit distro_features_check gnome gobject-introspection gettext
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-GNOME_COMPRESS_TYPE = "xz"
-
 SRC_URI[archive.md5sum] = "98040022484406e7ebe25f82cef93344"
 SRC_URI[archive.sha256sum] = "f7ca02631576e9b88aee1b1bae37ac1488b80ee7975f20a97f29e761a7172679"
 
diff --git a/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.45.bb b/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.45.bb
index e63e26e73..08e52241b 100644
--- a/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.45.bb
+++ b/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.45.bb
@@ -14,8 +14,6 @@ SRC_URI += "file://0001-configure.ac-drop-a-copy-paste-of-introspection.m4-m.pat
 SRC_URI[archive.md5sum] = "e45cc8aa9c49516d540b7d7307f755f1"
 SRC_URI[archive.sha256sum] = "5cbc2c0f1dc44d202fa0c6e3a51e9f17b0c2deb8711ba650432bfde3180b69fa"
 
-GNOME_COMPRESS_TYPE = "xz"
-
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[gdk-pixbuf] = "--with-gdk-pixbuf,--without-gdk-pixbuf,gdk-pixbuf"
 
diff --git a/meta-gnome/recipes-gnome/libwnck/libwnck_2.31.0.bb b/meta-gnome/recipes-gnome/libwnck/libwnck_2.31.0.bb
index ea4c8df53..f50b9ceb9 100644
--- a/meta-gnome/recipes-gnome/libwnck/libwnck_2.31.0.bb
+++ b/meta-gnome/recipes-gnome/libwnck/libwnck_2.31.0.bb
@@ -11,7 +11,6 @@ PACKAGECONFIG[startup-notification] = "--enable-startup-notification,--disable-s
 inherit gnomebase gobject-introspection distro_features_check
 REQUIRED_DISTRO_FEATURES = "x11"
 
-GNOME_COMPRESS_TYPE = "xz"
 SRC_URI[archive.md5sum] = "f03e1139296e2a3a92e3b65a3080cd32"
 SRC_URI[archive.sha256sum] = "83f732d20781fc88b22cdc6aaf2d4f388db6d3d4ff28d1a8fd45be9fb7743a9e"
 
-- 
2.17.1


