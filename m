Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 0F0727EEBF
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Jul 2019 13:09:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45shm44h5zz6l
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Jul 2019 15:09:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1563800996;
	bh=T45W6sIFY2mmJRFEiMylRB5fzipERKnhXxLbJdYgYpU=;
	h=From:To:Subject:Date:From;
	b=KOKAYI/gjPKDCWt8a+/VIiKeNN+p2rF5hbuIof9SlxOcMhVhSEHuc69CQdGxTkRrm
	TIRWtpcOrrvcph+jTpvB8suXsQmaniZy3qujCGBqtpizAtueGrkku9eEb0+kGOACWW
	i42C171/ub87SB8kV04ODdvIi9RqTgYpGGw2JCGA7P9ZTOIKvj23RcI26V8lvKHZ7p
	MDPI48xTbXjPRGi0ryUSrxjkrkt2rFiZow1ZryTZ/30/4y56b/JtHWjmrx7fndnI0q
	WK6FkhrdVPCxnOPOGsrEaNcGYhvL2SePD+Dm5cFsuAVDItO/DEkuyg5HzMHbtJnMJA
	Yy6edk92SR+Ictw27fJyyij5+NKdgzmkniZOEsbaz2paB2NrSl8f9O0GPoxHV8+M+p
	N/n9D/u7H5wjGsJa9nqIlC+V07+8jBKyPJ6wFVP1oY3keRzdCn0b8KiOiOm1+COQUk
	JSkFOSKLMwS7akHYctd3pB8tJcyU2CZy+epmb3qAchxRilMAu8+hBNiZG+ADOi7Bi7
	AitM2m+eJniH2SKTSqjYdDnHkxHoBvYvSSorufxKgMnuaKsIxClxcpGJVU6vmGk0TW
	fl1mgUupWbNF4wpLIjACVlGwkT5dUivOv12g8DicVDj8dn4Avcdvi7QMvrPkLgoeTT
	JhTSL9Kjv+hhn5xtyrg6UW5A=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Jul 2019 16:09:52 +0300
Message-Id: <20190722130952.10623-2-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-multimedia][PATCH] meta-multimedia: Remove GNOME_COMPRESS_TYPE = "xz" in recipes
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
X-List-Received-Date: Mon, 22 Jul 2019 13:09:56 -0000

This is the default value.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta-multimedia/recipes-connectivity/rygel/rygel_0.37.0.bb  | 1 -
 meta-multimedia/recipes-support/libmediaart/libmediaart.inc | 2 --
 2 files changed, 3 deletions(-)

diff --git a/meta-multimedia/recipes-connectivity/rygel/rygel_0.37.0.bb b/meta-multimedia/recipes-connectivity/rygel/rygel_0.37.0.bb
index 4869d866f..0adc721d8 100644
--- a/meta-multimedia/recipes-connectivity/rygel/rygel_0.37.0.bb
+++ b/meta-multimedia/recipes-connectivity/rygel/rygel_0.37.0.bb
@@ -12,7 +12,6 @@ DEPENDS = "libxml2 glib-2.0 gssdp gupnp gupnp-av gupnp-dlna gstreamer1.0 gstream
 RDEPENDS_${PN} = "gstreamer1.0-plugins-base-playback shared-mime-info"
 RRECOMMENDS_${PN} = "rygel-plugin-media-export"
 
-GNOME_COMPRESS_TYPE = "xz"
 SRC_URI[archive.md5sum] = "f897167ad82e2e741582f2c393a76843"
 SRC_URI[archive.sha256sum] = "dfd3d885da3ac383ba0cfbf119995f4a0c2bca2cc8f8cfcd3df10cfec8f35cd7"
 
diff --git a/meta-multimedia/recipes-support/libmediaart/libmediaart.inc b/meta-multimedia/recipes-support/libmediaart/libmediaart.inc
index 57dca9c17..c7b368de3 100644
--- a/meta-multimedia/recipes-support/libmediaart/libmediaart.inc
+++ b/meta-multimedia/recipes-support/libmediaart/libmediaart.inc
@@ -7,8 +7,6 @@ LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=4fbd65380cdd255951079008b364516c \
 
 DEPENDS = "glib-2.0 gdk-pixbuf"
 
-GNOME_COMPRESS_TYPE = "xz"
-
 inherit gnomebase gtk-doc gobject-introspection
 
 EXTRA_OECONF = "--disable-qt --enable-gdkpixbuf"
-- 
2.17.1


