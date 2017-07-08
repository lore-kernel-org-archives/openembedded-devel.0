Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f47.google.com (mail-pg0-f47.google.com [74.125.83.47])
	by mail.openembedded.org (Postfix) with ESMTP id D84B2780A0
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  8 Jul 2017 13:17:58 +0000 (UTC)
Received: by mail-pg0-f47.google.com with SMTP id u62so29225552pgb.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 08 Jul 2017 06:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=nXSGrCBe/fn54vD89VC4LOj3HtzfnDMM5b0ZVjR573g=;
	b=uZdS6M3ppRJnjd73yl+ACNDpiNY+xrc5N/cTAv7QMFDAbJlhhXvFO7/LfBt9xPiYG3
	cYFV2aQyXqabvp7mFjlw4ve9cpDrH68ZhYuEjAfeM+i6T//sqyW/Y0NM8ysOtG0iV2tS
	ykqTqOen6vnHA2+3jwlMqGyuyqhtuAT0Yutlne+vKDqX1lRivmQRo8knUxtRtC6LJtvq
	byTCix5tShF0bnrYFmfy8EjX84yADGfr0DmBEU87I3AhyciUjxjJnqBPhvqNumSeWBj5
	dZ7vAecVV/Ej/awgbPsClhN4ZB5udxmYq3pxpxr2tAMfaF5cQRQqveLjQrPJJSWhFdSt
	C55g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=nXSGrCBe/fn54vD89VC4LOj3HtzfnDMM5b0ZVjR573g=;
	b=i8ZELBLl/nSPTf5wYZy5dwcJ2twsGtNGgjI6/KlZj3+WnrqbCmMt8ksAzISBIkDagC
	0tsLvha4dG7vpDFaORPe2Gp4XAC3I8s4We+9BRr+4Hx/akwZcrRHHMKo8N3qwqmv0VhK
	vZKT12kzGKqRWyJ3j2JUwqkEbBrqFaiEkcEWXl4Ey0pbc2D9s727BTZGzvUQ9jLN8L0f
	uZcTgvCK+G1D/G+jHP1ghD4YYVhCfv8OXh0wziygAqmzD4OqTA8rMSFHeSHvE3YF5DBM
	+ZYqkIjIVEhsI7aOax/J/5AfOP98Qnrba2O45QN53sxPHDPM2n04o3ZP2o0lA7hgPozU
	HNig==
X-Gm-Message-State: AIVw113lnUcy2zPoeEVQFBVZKEhaLH4JrIXVVtK3GIpbr2ylbmGpnF0+
	6o0ODBrvPwkEYJLo
X-Received: by 10.99.100.193 with SMTP id y184mr6269561pgb.211.1499519879649; 
	Sat, 08 Jul 2017 06:17:59 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::7028])
	by smtp.gmail.com with ESMTPSA id
	o73sm13277185pfi.2.2017.07.08.06.17.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 08 Jul 2017 06:17:58 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  8 Jul 2017 06:17:40 -0700
Message-Id: <20170708131744.33927-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
Subject: [meta-oe][PATCH 1/5] libdbus-c++: Fix build with gcc7 and unblacklist
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
X-List-Received-Date: Sat, 08 Jul 2017 13:17:59 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-pipe.c-Use-a-string-instead-of-char.patch | 27 ++++++++++++++++++++++
 meta-oe/recipes-core/dbus/libdbus-c++_0.9.0.bb     | 20 ++++++++--------
 2 files changed, 36 insertions(+), 11 deletions(-)
 create mode 100644 meta-oe/recipes-core/dbus/libdbus-c++-0.9.0/0001-pipe.c-Use-a-string-instead-of-char.patch

diff --git a/meta-oe/recipes-core/dbus/libdbus-c++-0.9.0/0001-pipe.c-Use-a-string-instead-of-char.patch b/meta-oe/recipes-core/dbus/libdbus-c++-0.9.0/0001-pipe.c-Use-a-string-instead-of-char.patch
new file mode 100644
index 000000000..6883f9a0b
--- /dev/null
+++ b/meta-oe/recipes-core/dbus/libdbus-c++-0.9.0/0001-pipe.c-Use-a-string-instead-of-char.patch
@@ -0,0 +1,27 @@
+From 6bcb58bd69c38b9200e8ec6c382247167571189d Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 1 Jul 2017 16:44:15 -0700
+Subject: [PATCH] pipe.c: Use a string instead of char
+
+Fixes
+error: invalid conversion from 'char' to 'const void*' [-fpermissive]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/pipe.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/pipe.cpp b/src/pipe.cpp
+index 45c2ba6..1303c2d 100644
+--- a/src/pipe.cpp
++++ b/src/pipe.cpp
+@@ -83,5 +83,5 @@ ssize_t Pipe::read(void *buffer, unsigned int &nbytes)
+ void Pipe::signal()
+ {
+   // TODO: ignoring return of read/write generates warning; maybe relevant for eventloop work...
+-  ::write(_fd_write, '\0', 1);
++  ::write(_fd_write, "", 1);
+ }
+-- 
+2.13.2
+
diff --git a/meta-oe/recipes-core/dbus/libdbus-c++_0.9.0.bb b/meta-oe/recipes-core/dbus/libdbus-c++_0.9.0.bb
index 4412716a6..4cc133301 100644
--- a/meta-oe/recipes-core/dbus/libdbus-c++_0.9.0.bb
+++ b/meta-oe/recipes-core/dbus/libdbus-c++_0.9.0.bb
@@ -6,15 +6,15 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
 DEPENDS = "dbus expat glib-2.0 libpcre"
 
-SRC_URI = "\
-    ${SOURCEFORGE_MIRROR}/project/dbus-cplusplus/dbus-c++/${PV}/${BP}.tar.gz \
-    file://fix-missing-unistd.h-include.patch \
-    file://remove-CXX_FOR_BUILD-stuff.patch \
-    file://0001-src-eventloop.cpp-use-portable-method-for-initializi.patch \
-    file://0002-tools-generate_proxy.cpp-avoid-possibly-undefined-ui.patch \
-    file://0003-Fixed-undefined-ssize_t-for-clang-3.8.0-on-FreeBSD.patch \
-    file://0004-use-POSIX-poll.h-instead-of-sys-poll.h.patch \
-"
+SRC_URI = "${SOURCEFORGE_MIRROR}/project/dbus-cplusplus/dbus-c++/${PV}/${BP}.tar.gz \
+           file://fix-missing-unistd.h-include.patch \
+           file://remove-CXX_FOR_BUILD-stuff.patch \
+           file://0001-src-eventloop.cpp-use-portable-method-for-initializi.patch \
+           file://0002-tools-generate_proxy.cpp-avoid-possibly-undefined-ui.patch \
+           file://0003-Fixed-undefined-ssize_t-for-clang-3.8.0-on-FreeBSD.patch \
+           file://0004-use-POSIX-poll.h-instead-of-sys-poll.h.patch \
+           file://0001-pipe.c-Use-a-string-instead-of-char.patch \
+           "
 SRC_URI[md5sum] = "e752116f523fa88ef041e63d3dee4de2"
 SRC_URI[sha256sum] = "bc11ac297b3cb010be904c72789695543ee3fdf3d75cdc8225fd371385af4e61"
 
@@ -27,5 +27,3 @@ PACKAGE_BEFORE_PN = "${PN}-tools"
 FILES_${PN}-tools = "${bindir}"
 
 BBCLASSEXTEND = "native"
-
-PNBLACKLIST[libdbus-c++] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130644/ - the recipe will be removed on 2017-09-01 unless the issue is fixed"
-- 
2.13.2


