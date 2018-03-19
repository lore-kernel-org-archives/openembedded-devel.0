Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id C5928789D7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Mar 2018 20:29:25 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id f19so4953424wmc.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Mar 2018 13:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=pHx5p0x4XvFk+kxgpRQYg53qdZEByYSazN0IsZl7gkU=;
	b=BeSovCyMpzBmYe+8NYCgCKPxUCTt2fvHkzamhEHWuoFEmUrnvbSZ/LxnAOK22M2P9q
	+RKOwKPyTazvnCE0Wla+zJzwo6PvDpM2p6w1uLFfsoFBHd7Uc5ZdXArYKGGX3QRqYhzF
	M8inNmQYqIid5tm926JO1hiFqwRE7vm6750GT7aEXBvXkUUbgpgmuLBYLgxh+GSDT+l0
	R0meV/R+UyVjQ4gSLjtThCxSBy6CMYViBKUgzujfnnfcSyDSp5fpkQysth+OQ/ZgASYw
	V4oaMe6bBeAeNvYunlXgu4Jh1G0csitWgSfZ6KSEvJXYowyGgFEuNdY3KMDPmhhe4Edj
	xzGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=pHx5p0x4XvFk+kxgpRQYg53qdZEByYSazN0IsZl7gkU=;
	b=aDoj7XfpuNJYxdYLbFrhZsE1snyM8ta7PZvvz+GZOUTn44Fv7TVIPmV7wWeXBtj7tH
	6sqIbtFlYmQH0NbFPSwEeLfJ2UYHVkcVm0FSlPPk2KxDHcV1CIwdKNbwwwJRK2VYG+2u
	pga4uXXGcxklB5zXYBZFiyjtmwGT1NosUzN2Y+pMhZnAuX7hwLXMmMNZYna+GVxruJgh
	1VeH+PLRiMip0BTIlivlkIwmlnYwRwiCkQKaIMzQ5K8MSheTuloTHlowNS54L+3n30cK
	eBG13PmMQY58ZXtoPVsGYFVnIjzq0PqYkHFP6+8t1Tx5RfRiJQAvwDhFnywmzbS/H/z4
	Rgpg==
X-Gm-Message-State: AElRT7GxnCX8/ftQBfo0F6qW2pMZoi6gpSTqOX4+Msb1jdJsRIZX69DG
	kfun5rhWzTgGHcqGOONqtFE2/A==
X-Google-Smtp-Source: AG47ELukqZbKloHVXwVQT+QynuuicyyfMVe9zQ0JBbw8ZOtjS5osGa38Yogf+aTbc7XKFE88Jw4Xcg==
X-Received: by 10.28.164.3 with SMTP id n3mr68227wme.121.1521491366146;
	Mon, 19 Mar 2018 13:29:26 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p200300F07BC08B501E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc0:8b50:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id j42sm47589wre.55.2018.03.19.13.29.25
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 19 Mar 2018 13:29:25 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 19 Mar 2018 21:28:57 +0100
Message-Id: <20180319202911.30760-4-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180319202911.30760-1-schnitzeltony@gmail.com>
References: <20180319202911.30760-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 03/17] libgnomecanvas: remove
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
X-List-Received-Date: Mon, 19 Mar 2018 20:29:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* it depends on removed libglade
* project is dead - last release in 2011

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../libgnome/libgnomecanvas_2.30.3.bb              | 22 ----------------------
 1 file changed, 22 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/libgnome/libgnomecanvas_2.30.3.bb

diff --git a/meta-gnome/recipes-gnome/libgnome/libgnomecanvas_2.30.3.bb b/meta-gnome/recipes-gnome/libgnome/libgnomecanvas_2.30.3.bb
deleted file mode 100644
index f21cc5ed9..000000000
--- a/meta-gnome/recipes-gnome/libgnome/libgnomecanvas_2.30.3.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-SUMMARY = "A powerful object-oriented display"
-LICENSE = "LGPLv2"
-LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=55ca817ccb7d5b5b66355690e9abc605"
-SECTION = "x11/gnome/libs"
-
-inherit distro_features_check gnomebase gtk-doc
-
-REQUIRED_DISTRO_FEATURES = "x11"
-
-# intltool to provide IT_PROG_INTLTOOL
-# configure: line 12654: syntax error near unexpected token `0.35.0'
-# configure: line 12654: `IT_PROG_INTLTOOL(0.35.0)'
-DEPENDS = "gtk+ libglade libart-lgpl xineramaproto intltool-native gnome-common-native"
-
-SRC_URI[archive.md5sum] = "ffcbb719c671ff5cd86e59aeba8d0b92"
-SRC_URI[archive.sha256sum] = "859b78e08489fce4d5c15c676fec1cd79782f115f516e8ad8bed6abcb8dedd40"
-GNOME_COMPRESS_TYPE="bz2"
-
-FILES_${PN} += "${libdir}/libglade/*/libcanvas.so"
-FILES_${PN}-dbg += "${libdir}/libglade/*/.debug/"
-FILES_${PN}-dev += "${libdir}/libglade/*/libcanvas*.la"
-FILES_${PN}-staticdev += "${libdir}/libglade/*/libcanvas*.a"
-- 
2.14.3


