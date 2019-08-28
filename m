Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
	[209.85.221.51])
	by mail.openembedded.org (Postfix) with ESMTP id 803897F2F0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Aug 2019 22:54:41 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id h7so83349wrt.13
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Aug 2019 15:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=bfCpsMpGTrl1CgwI8AOUa67zOYoFvfSKc+BMtCiC0P4=;
	b=jq+5Yslkp/ZvX/N3zRrOshecvMxCmi+KAI3vJEwkEG7VxiweTH8op20SlbzgUG9rQR
	cTjk0fB0l9naQ0BgX9rmL8FFm0HPdgZLSX0lvSmIMNIg0D5/P6FuWTdPMWPITyj7VSa+
	3jfBDARSo0APpEaDXu4TWU1U4UF7VUn+b5wzXpjGkj1tkl/aLp7qhUmJbV9t7ev8Omxf
	A64cWQTUUdBRkytovxOPtTE+seYRui5tCcXiLeSySL16rQJYX+uOiIYUdMaxMZsVeGGV
	IXEnz2yLOmNh+W2qP6j0mIGmh14+zhGFZN0b71dO4et5y0GLYURVUgCzHmxzLWeBMX72
	GfBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=bfCpsMpGTrl1CgwI8AOUa67zOYoFvfSKc+BMtCiC0P4=;
	b=EMxQaWkEjQq01uMj6dtVMsCjvfpEE8vy4zdKOj/qSVNkg+EhOgbKAZJm11FbV9hHeE
	0n58OeM+j6iHSPdHB+34BFeFzmJWL0Dl5M2sbDvd1RjsRySyRns+KBiPxaiLiKM4HdZ5
	wSbEnJ4FVskRPtaQzp2dvh6k9A8SHsrC3XTtMl6+WsHtsg9L9h7M9CF8BFdRce2RBVd4
	B/5ylcjtBGz4a/BWhzagJPXkcARBxJ3almcWKos3a7prcJGnrMCsFSw0iNroJllIf8mH
	wj7VK8vqO/oBfkbBOVDtlYbwD4W/rfHoHUIppZrR+yPYl//60+VH15KnMCODfGy2J6bT
	e5Vg==
X-Gm-Message-State: APjAAAVsK7f5k14ix9YzGojukHkzOTUH+IGUqiOSvtbGLdfB5XIkjzPx
	cb7QIYC2uan8mlH+kusFOD/Z0NB8
X-Google-Smtp-Source: APXvYqwjzUuPYwutbfIS03Fjj8+L/HllkG2Uq081/RbyrjRBHC1ey5fmaDce4f/HxoedL9bQg47EPA==
X-Received: by 2002:a5d:51c6:: with SMTP id n6mr7497070wrv.206.1567032881998; 
	Wed, 28 Aug 2019 15:54:41 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F43161224192BDF21814B6B.dip0.t-ipconnect.de.
	[2003:f0:7f43:1612:2419:2bdf:2181:4b6b])
	by smtp.gmail.com with ESMTPSA id a7sm1095886wra.43.2019.08.28.15.54.40
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 28 Aug 2019 15:54:41 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Aug 2019 00:54:28 +0200
Message-Id: <20190828225428.15322-3-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190828225428.15322-1-schnitzeltony@gmail.com>
References: <20190828225428.15322-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] evolution-data-server: remove unused gconf dep and pythonnative dep
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
X-List-Received-Date: Wed, 28 Aug 2019 22:54:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* gconf is orphaned (last release 2013) and we should get rid of it
* pythonnative does not seem to miss - did not find any trace it is required

Notes:
* The only diff buildhistory reports are missing RRECOMMENDS on gconf-dev for
  the (many) dev-packages
* Had to disable introspection: quemu runs at 100% on one CPU and never finishes

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-gnome/recipes-gnome/eds/evolution-data-server_3.32.4.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/eds/evolution-data-server_3.32.4.bb b/meta-gnome/recipes-gnome/eds/evolution-data-server_3.32.4.bb
index a9c84d7a6..429dd53d8 100644
--- a/meta-gnome/recipes-gnome/eds/evolution-data-server_3.32.4.bb
+++ b/meta-gnome/recipes-gnome/eds/evolution-data-server_3.32.4.bb
@@ -10,11 +10,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6a6e689d19255cf0557f3fe7d7068212 \
 
 DEPENDS = " \
     intltool-native gperf-native glib-2.0-native \
-    glib-2.0 gtk+3 gconf libgnome-keyring libgdata libcanberra icu \
+    glib-2.0 gtk+3 libgnome-keyring libgdata libcanberra icu \
     dbus db virtual/libiconv zlib libsoup-2.4 libical nss libsecret \
 "
 
-inherit gnomebase cmake gtk-doc gettext gobject-introspection perlnative pythonnative upstream-version-is-even vala
+inherit gnomebase cmake gtk-doc gettext gobject-introspection perlnative upstream-version-is-even vala
 
 SRC_URI += "file://0001-CMakeLists.txt-Remove-TRY_RUN-for-iconv.patch \
             file://0002-CMakeLists.txt-remove-CHECK_C_SOURCE_RUNS-check.patch \
-- 
2.21.0


