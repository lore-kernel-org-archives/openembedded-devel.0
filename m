Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr0-f173.google.com (mail-wr0-f173.google.com
	[209.85.128.173])
	by mail.openembedded.org (Postfix) with ESMTP id B7137746D8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Mar 2018 13:32:09 +0000 (UTC)
Received: by mail-wr0-f173.google.com with SMTP id y55so8061724wry.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Mar 2018 06:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=71qVGTs0Ze7dezGUB2Zuj+y7BjxPGJI5K2RsB8Lz5KA=;
	b=Yu4PsUH/WzHOJh7+FZN5g2NLhcWMz7Er/lFrtdHJ0AMJnDz/zT1t0l6n6Ro/OL68lG
	PKjT9SA6mc1G8IdGt9ZATybYGXnK1cTlUkooSXvEFcAWCq4vX3CK/Cpo/dMoG7lfyS8i
	VUoevopw1x8iBNiDyDJinkf9p8O+QDa43ByFLmrOUuLcJfKFui0pygMnBGD7pmVtU1u0
	GRI4cKLjCuRJvYRA6MoQrErCepJFPLapB1n0ngViScabmWJySJKmxPFQ2RFzYMPHYpt0
	7vC4/iNx34Tj5ak6pHK8Wawu7Av5Tvj1r4geaAFyIljWdFUzIBE0+VuCCwLUCDsnexGI
	tgBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=71qVGTs0Ze7dezGUB2Zuj+y7BjxPGJI5K2RsB8Lz5KA=;
	b=RXNAlTY411GFiB1JWgmuT1VCeD1kWL8IRw1KZk6tIiStEhP5xCcxIzhoBcvXqGj/iF
	TEkb9r4QNsbYoP4lE739fHFtGp1Ybzp8qF6fTPaIoLVJg2wkq943LGSLWBhkywB5WD4v
	YqHb9nxZFwn43E/Dz3ebbTrD1QpXRfRC4sZSt1CBjGRKGx5oJqJxMru1lhTW6v0gR2lH
	8HwdeADmMpsCMfBdvMoXwgfrvM/DtjBgydGfSgI6pr0xyt87Vpp/sEHQWVNoEWY3JomB
	Mk258BbZh+3XTYfupfvGYW7G9FnTxdLQKZ4rnCCX8sC3hfmlA1gJNSHy7WH62VCnbEXe
	zIfQ==
X-Gm-Message-State: AElRT7G3hWI/GYvXmRQ9D+Khr5gO4UBVv0FMozsvVBpWFCWU5HQrHFmu
	Ru6KP0QfpUCzD+r2wGaBKqZbjA==
X-Google-Smtp-Source: AIpwx49DNkOnpuwsAPImQjyfnqAdiQtHjFOBfRrwgQ0hkVkXrgnlOh6F5kr9YoZw4z5hp+Cly3sRvQ==
X-Received: by 10.223.196.204 with SMTP id o12mr9649872wrf.121.1522416729828; 
	Fri, 30 Mar 2018 06:32:09 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p200300F07BC180221E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc1:8022:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	93sm10468396wrh.46.2018.03.30.06.32.08
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 30 Mar 2018 06:32:09 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Mar 2018 15:31:16 +0200
Message-Id: <20180330133151.25882-5-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180330133151.25882-1-schnitzeltony@gmail.com>
References: <20180330133151.25882-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 04/39] libgnome: remove
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
X-List-Received-Date: Fri, 30 Mar 2018 13:32:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

project is dead - last release was 2011

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...nome-Makefile.am-allow-deprecated-symbols.patch | 35 --------------------
 .../libgnome/libgnome/05_fix_invalid_utf8.patch    | 26 ---------------
 .../recipes-gnome/libgnome/libgnome_2.32.1.bb      | 38 ----------------------
 3 files changed, 99 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/libgnome/libgnome/0001-libgnome-Makefile.am-allow-deprecated-symbols.patch
 delete mode 100644 meta-gnome/recipes-gnome/libgnome/libgnome/05_fix_invalid_utf8.patch
 delete mode 100644 meta-gnome/recipes-gnome/libgnome/libgnome_2.32.1.bb

diff --git a/meta-gnome/recipes-gnome/libgnome/libgnome/0001-libgnome-Makefile.am-allow-deprecated-symbols.patch b/meta-gnome/recipes-gnome/libgnome/libgnome/0001-libgnome-Makefile.am-allow-deprecated-symbols.patch
deleted file mode 100644
index b6583034f..000000000
--- a/meta-gnome/recipes-gnome/libgnome/libgnome/0001-libgnome-Makefile.am-allow-deprecated-symbols.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From ce1cd20fceea7dbcc5b983d94de771461eccf7cf Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
-Date: Mon, 29 Apr 2013 14:17:13 +0200
-Subject: [PATCH] libgnome/Makefile.am: allow deprecated symbols
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-fixes:
-
-| gnome-program.c: In function 'gnome_program_init_common':
-| gnome-program.c:2067:2: error: implicit declaration of function 'g_atexit' [-Werror=implicit-function-declaration]
-
-Upstream-Status: Inappropriate [configuration]
-
-Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
----
- libgnome/Makefile.am |    1 -
- 1 files changed, 0 insertions(+), 1 deletions(-)
-
-diff --git a/libgnome/Makefile.am b/libgnome/Makefile.am
-index 9c8cd3e..aa01f6c 100644
---- a/libgnome/Makefile.am
-+++ b/libgnome/Makefile.am
-@@ -17,7 +17,6 @@ INCLUDES = \
- 	-I$(srcdir)/..						\
- 	$(WARN_CFLAGS)						\
- 	$(LIBGNOME_CFLAGS)					\
--	-DG_DISABLE_DEPRECATED					\
- 	-DLIBGNOME_PREFIX=\""$(prefix)"\"			\
- 	-DLIBGNOME_LIBDIR=\""$(libdir)"\"			\
- 	-DLIBGNOME_DATADIR=\""$(datadir)"\"			\
--- 
-1.7.6.5
-
diff --git a/meta-gnome/recipes-gnome/libgnome/libgnome/05_fix_invalid_utf8.patch b/meta-gnome/recipes-gnome/libgnome/libgnome/05_fix_invalid_utf8.patch
deleted file mode 100644
index cd90b8ed9..000000000
--- a/meta-gnome/recipes-gnome/libgnome/libgnome/05_fix_invalid_utf8.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 33313713c4f5c1de500859ff128d6fd7e3af5722 Mon Sep 17 00:00:00 2001
-From: Colin Walters <walters@verbum.org>
-Date: Mon, 7 Aug 2017 12:57:43 -0400
-Subject: gnome-config.h: Fix invalid UTF-8 in header
-
-This breaks the new Python `glib-mkenums`.
----
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
- libgnome/gnome-config.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libgnome/gnome-config.h b/libgnome/gnome-config.h
-index 0c3dfe6..b9d659d 100644
---- a/libgnome/gnome-config.h
-+++ b/libgnome/gnome-config.h
-@@ -270,7 +270,7 @@ void gnome_config_clean_key_ (const char *path, gboolean priv);
- #define gnome_config_private_clean_key(path) \
- 	(gnome_config_clean_key_((path),TRUE))
- 
--/* returns the true filename of the config file�*/
-+/* returns the true filename of the config file */
- #define gnome_config_get_real_path(path) \
- 	(g_build_filename (gnome_user_dir_get(),(path),NULL))
- #define gnome_config_private_get_real_path(path) \
diff --git a/meta-gnome/recipes-gnome/libgnome/libgnome_2.32.1.bb b/meta-gnome/recipes-gnome/libgnome/libgnome_2.32.1.bb
deleted file mode 100644
index 94fcf2e8c..000000000
--- a/meta-gnome/recipes-gnome/libgnome/libgnome_2.32.1.bb
+++ /dev/null
@@ -1,38 +0,0 @@
-SUMMARY = "Gnome application programming libraries"
-LICENSE = "LGPLv2"
-LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=55ca817ccb7d5b5b66355690e9abc605"
-SECTION = "x11/gnome/libs"
-
-inherit gnome lib_package
-
-PR = "r2"
-
-SRC_URI[archive.md5sum] = "a4345e6087ae6195d65a4674ffdca559"
-SRC_URI[archive.sha256sum] = "b2c63916866485793b87398266dd7778548c1734923c272a94d84ee011b6f7a4"
-SRC_URI += "file://0001-libgnome-Makefile.am-allow-deprecated-symbols.patch \
-            file://05_fix_invalid_utf8.patch \
-"
-GNOME_COMPRESS_TYPE="bz2"
-
-DEPENDS += "libcanberra gconf-native gnome-vfs libbonobo esound intltool-native gnome-common-native"
-
-EXTRA_OECONF += "--disable-gtk-doc"
-
-do_configure_prepend() {
-    sed -i -e s:docs::g ${S}/Makefile.am
-    echo "EXTRA_DIST = version.xml" > gnome-doc-utils.make
-    echo "EXTRA_DIST = version.xml" > gtk-doc.make
-}
-
-FILES_${PN} += "${libdir}/bonobo/servers ${libdir}/bonobo/monikers/*.so \
-                ${datadir}/gnome-background-properties ${datadir}/pixmaps"
-FILES_${PN}-dev += "${libdir}/bonobo/monikers/*.la"
-FILES_${PN}-staticdev += "${libdir}/bonobo/monikers/*.a"
-
-PACKAGES =+ "gnome-common-schemas"
-
-FILES_gnome-common-schemas = "${datadir}/gnome-background-properties ${datadir}/pixmaps ${sysconfdir}"
-
-RDEPENDS_${PN} = "gnome-common-schemas"
-
-FILES_${PN}-dbg += "${libdir}/bonobo/monikers/.debug"
-- 
2.14.3


