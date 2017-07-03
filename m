Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 0E75B6FFA4
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Jul 2017 15:11:22 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id s66so26173146pfs.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Jul 2017 08:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=nXSGrCBe/fn54vD89VC4LOj3HtzfnDMM5b0ZVjR573g=;
	b=ofqrixUeHRfq3EfAG5v+txjvuu6a1pzL4WDV73BHaup/dyosFZeBBYZWOcPMR4arun
	sdDXsKl5NIoai4v6h0FKzpdoqZFfKfOm6fzf58ujMh5EfxrF0rvJirxWtzipTq8y8iWo
	9mRYHJbYIUE0XQ3oZ6ELH4UYVuwmSbBXm7s31JvOHLDqeYZJHyjYIr1eqVyzGuPXi6k+
	z7mPimRgyeP0jxJm3yGrk9DVAF8NR469SkA+qA0a+a+70fg1nW50BqN92Gm/pEXADWvv
	KzWP2KQXWhgx8TQeTK4tc9zSd8BDRFVI1xudyahryDymyGyb0h41ae5gkAFbQD5NFbOi
	ldzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=nXSGrCBe/fn54vD89VC4LOj3HtzfnDMM5b0ZVjR573g=;
	b=Op6Dc7MW0N+Lb2kK8QDxSxvDRvESXZV9V0gDmenZ6cZLR1G8cHlq7hr57q44Zry0gW
	01YHVqR+QEnV7xTtFmiD67sTiYA9qo9gEvYQg+5nniSnq20aBZ2SQd4U5OQPHuJbF9Yc
	HWq6yC18JdIJRCCIWoFb722tE3x/kfVfADzwADroTUMp1Ex+hPB8jcrleWOn1PtX8/k3
	cLrbFZW9t1nlwq77anXuqT+/TmueCdaQbNCmjAb586NO2Bde5I1S+WXDAFoTOIogh9uR
	slNlDUtMh8jMF13AJI48jiL3wV3Pm+zjC0N+MfZOpcKP3scUlNiANv2fUcICgqgtUuA8
	PHow==
X-Gm-Message-State: AIVw112qFKXS8mOI8O1aRUItm369WQ68Q3TysxPxSyjN6NvwWx6Dd6mI
	I2MyjSOqS+GjCRlS
X-Received: by 10.84.196.131 with SMTP id l3mr11009845pld.232.1499094682761;
	Mon, 03 Jul 2017 08:11:22 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::3df3])
	by smtp.gmail.com with ESMTPSA id
	k67sm12295707pfg.37.2017.07.03.08.11.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 03 Jul 2017 08:11:21 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  3 Jul 2017 08:11:06 -0700
Message-Id: <20170703151107.35350-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
Subject: [meta-oe][PATCH 1/2] libdbus-c++: Fix build with gcc7 and unblacklist
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
X-List-Received-Date: Mon, 03 Jul 2017 15:11:26 -0000

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


