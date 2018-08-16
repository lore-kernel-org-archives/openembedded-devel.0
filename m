Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
	[209.85.221.45])
	by mail.openembedded.org (Postfix) with ESMTP id 15CB87928B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Aug 2018 18:28:09 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id e7-v6so4969738wrs.9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Aug 2018 11:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=wXCR+RjbybLulnXF+0m/PC1qLohJFJn9V04H56Q72a4=;
	b=bb0UGE2azXCGRo8nNbrSwQs4wlksuietv/ZApqMjVuWF3ykPN2BNx67ktqXN0vI4JU
	Obniy2JVWgmsr1Av7hvtTO4puh6nR2lpo57tgEecZDacQJhslcin5vZg8dqlPlXg6iOR
	CWTx3En42+vZNHgpSddvcdqKUAhSmYw4tMUC0iUY0UFRJtLUtZk6CWPozpCXklyTobhg
	/CDrpGiiH6Z6Bst+IHNr4DLcLgSuYc6wgL8jXxsjkmkQGq31VV1NplNhEu+8Cqvy4KU8
	D2NAQzIYrOjSQXvIFlKEwW+xTO/dwJZmg64vCQ2X4AfZXJV/8aRxX6j+yKlOvigvyhWe
	OGxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=wXCR+RjbybLulnXF+0m/PC1qLohJFJn9V04H56Q72a4=;
	b=RQHIYf0wdgp/b67D2S2VkfgqW3j4cWOo51pzHCsHDPqLCzMJzldCqO//Pm67TtJhel
	kvboKj72s+sU19lV38ckC+LLkuSkfGFuXGblCkfkjH7YAqClGIF+0t08al9/iuAysPVI
	fgsTUx7sacM4hU6yHwrc+crZY/zeK6hXutcGoAHDd87ir4dYbhqa03lA4FfKLvpT5+o3
	q+ghXTOFe/vJbuQKPp1B419toE2dZcplY6YzTd6GtVekWNT8+nMWYlHrrukSoBGQdkjT
	dgrlMjQBrQEC5s+Zgc5mZxSyRSPw3eWWn6DTU5jJhMikeIDY21EV8BQVlpI/4c7QM+e3
	DB3Q==
X-Gm-Message-State: AOUpUlHrCy4X7n9eSIHasnCbc0RL2XXo6TSiHadELoFXhZKiKf9d4cwE
	VUHf9JSnTnvJWU6+vqE/Bc6LLsQI
X-Google-Smtp-Source: AA+uWPyO8Eu8jhL0YVZRwCqeopOl3yCTyWAW4m4SGF0a6E64wopAiyCziHnuSLsD95YH2Bwp0bW6HQ==
X-Received: by 2002:adf:b519:: with SMTP id
	a25-v6mr21361942wrd.273.1534444089617; 
	Thu, 16 Aug 2018 11:28:09 -0700 (PDT)
Received: from localhost.localdomain
	(p200300F07BC4D1601E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc4:d160:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	g10-v6sm26040224wrv.90.2018.08.16.11.28.08
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 16 Aug 2018 11:28:08 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Aug 2018 20:27:45 +0200
Message-Id: <20180816182748.2400-14-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.4
In-Reply-To: <20180816182748.2400-1-schnitzeltony@gmail.com>
References: <20180816182748.2400-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 13/16] libsdl-net: initial add 1.2.8
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
X-List-Received-Date: Thu, 16 Aug 2018 18:28:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is a cleaned up version of libsdl-net in meta-games. Once applied, a patch
to remove there will be send out.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../libsdl/libsdl-net/am_foreign.patch              | 11 +++++++++++
 .../libsdl/libsdl-net/libtool2.patch                | 21 +++++++++++++++++++++
 meta-oe/recipes-graphics/libsdl/libsdl-net_1.2.8.bb | 20 ++++++++++++++++++++
 3 files changed, 52 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/libsdl/libsdl-net/am_foreign.patch
 create mode 100644 meta-oe/recipes-graphics/libsdl/libsdl-net/libtool2.patch
 create mode 100644 meta-oe/recipes-graphics/libsdl/libsdl-net_1.2.8.bb

diff --git a/meta-oe/recipes-graphics/libsdl/libsdl-net/am_foreign.patch b/meta-oe/recipes-graphics/libsdl/libsdl-net/am_foreign.patch
new file mode 100644
index 000000000..fb3ff7e68
--- /dev/null
+++ b/meta-oe/recipes-graphics/libsdl/libsdl-net/am_foreign.patch
@@ -0,0 +1,11 @@
+diff -Nurd SDL_net-1.2.8/Makefile.am SDL_net-1.2.8/Makefile.am
+--- SDL_net-1.2.8/Makefile.am	2012-01-15 18:20:10.000000000 +0200
++++ SDL_net-1.2.8/Makefile.am	2014-08-01 21:18:52.720815807 +0300
+@@ -1,5 +1,7 @@
+ # Makefile.am for the SDL sample image loading library and viewer
+ 
++AUTOMAKE_OPTIONS = foreign
++
+ lib_LTLIBRARIES = libSDL_net.la
+ 
+ libSDL_netincludedir = $(includedir)/SDL
diff --git a/meta-oe/recipes-graphics/libsdl/libsdl-net/libtool2.patch b/meta-oe/recipes-graphics/libsdl/libsdl-net/libtool2.patch
new file mode 100644
index 000000000..9718a3b94
--- /dev/null
+++ b/meta-oe/recipes-graphics/libsdl/libsdl-net/libtool2.patch
@@ -0,0 +1,21 @@
+From f9417c864183a0f6d0e90f66f5254a63b04a041a Mon Sep 17 00:00:00 2001
+From: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
+Date: Wed, 17 Oct 2012 20:51:51 +0200
+
+---
+ configure.in | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/configure.in b/configure.in
+index c42bd0c..71a4825 100644
+--- a/configure.in
++++ b/configure.in
+@@ -44,6 +44,8 @@ AC_CANONICAL_HOST
+ dnl Setup for automake
+ AM_INIT_AUTOMAKE(SDL_net, $VERSION)
+ 
++dnl got macros
++AC_CONFIG_MACRO_DIR([acinclude])
+ dnl Check for tools
+ AC_PROG_LIBTOOL
+ AC_PROG_CC
diff --git a/meta-oe/recipes-graphics/libsdl/libsdl-net_1.2.8.bb b/meta-oe/recipes-graphics/libsdl/libsdl-net_1.2.8.bb
new file mode 100644
index 000000000..b021e565e
--- /dev/null
+++ b/meta-oe/recipes-graphics/libsdl/libsdl-net_1.2.8.bb
@@ -0,0 +1,20 @@
+DESCRIPTION = "Simple DirectMedia Layer networking library."
+SECTION = "libs/network"
+
+LICENSE = "Zlib"
+LIC_FILES_CHKSUM = "file://COPYING;md5=9cf3de2d872bf510f88eb20d06d700b5"
+
+inherit autotools pkgconfig
+
+DEPENDS = "virtual/libsdl"
+
+SRC_URI = " \
+  https://www.libsdl.org/projects/SDL_net/release/SDL_net-${PV}.tar.gz \
+  file://libtool2.patch \
+  file://am_foreign.patch \
+"
+
+S = "${WORKDIR}/SDL_net-${PV}"
+
+SRC_URI[md5sum] = "20e64e61d65662db66c379034f11f718"
+SRC_URI[sha256sum] = "5f4a7a8bb884f793c278ac3f3713be41980c5eedccecff0260411347714facb4"
-- 
2.14.4


