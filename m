Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 12B6C7F300
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Aug 2019 15:39:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 462zML0Z6Qz65
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Aug 2019 17:39:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1565105950;
	bh=iBug3DwtY3uBYk7sPIu9ojUj+BisBNxYxeanq5Y4EGU=;
	h=From:To:Subject:Date:From;
	b=ee+90G+qTnwexh5WjGxFXMAi93JAzbWKU+DmDQ1dReByAgHcYbmY4nuolzZ2BFCKs
	IPkxXgIrqoU6e8a9Ule1cDFBfkg/F+LBfXsHy/2L7qAghZ/PHn2OpFZfR7Om0pPLRU
	zOffV4EAcPWnrCR/+mdpnTfRYmyFNBYydpik79JvoKNqO880TQW3VeoW0CIQZBQtSr
	PU3tyu/ByhNqmXsf/Ny1ox5h3NUSbghxhBPcywTpk774bD7RfRElsx0u1JoIPwxBU6
	eZiPdzgX/qwXhau0KpToxnyrjgSXTr+Gd9HefLAKf9CMbbrz0U/BiStL4vaf/S8C3B
	zcBwOF4zcErYKOL8z2tAIYdUhPtBxdy6VUlHuC2qAp5ITlmaAoabU0Hf340A5+rAQC
	CWWo33V5MG7H2V+S3sFPrDUyBkxu1YvZhbOhTo9GEOG1C4vqYnSwtZfMsT2KZcqARa
	L2hZlvAxNjTLQ12EmPYtd05bxl4PgP9PSY23MO+UspgSCzbHrDiT0iNW1auung9CZI
	H1HxrUN+vOMLi9bCmfLxXCIGIegZk0KAEERe5yNAqcutQeMac7Z5QJ/S8vLbV6ziTK
	uUwQAGYtOZYNtcpfeqNL7LdTOohF5/+jC8PwSNXEG1UxUVeADz0MJLRfu7tFYjSLMb
	N6f8PQQ+voRskNEZHfgSjqEU=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  6 Aug 2019 18:39:09 +0300
Message-Id: <20190806153909.5965-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] modemmanager: Use a simpler workaround for the clang build
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
X-List-Received-Date: Tue, 06 Aug 2019 15:39:10 -0000

The check whether the compiler understands an option is broken
in m4/compiler_warnings.m4, but if we are just workarounding it
then do a minimal workaround without patching.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 ...-not-set-Wno-unused-but-set-variable.patch | 30 -------------------
 .../modemmanager/modemmanager_1.10.0.bb       |  3 +-
 2 files changed, 1 insertion(+), 32 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/modemmanager/modemmanager/0001-Do-not-set-Wno-unused-but-set-variable.patch

diff --git a/meta-oe/recipes-connectivity/modemmanager/modemmanager/0001-Do-not-set-Wno-unused-but-set-variable.patch b/meta-oe/recipes-connectivity/modemmanager/modemmanager/0001-Do-not-set-Wno-unused-but-set-variable.patch
deleted file mode 100644
index dcbe01d5e..000000000
--- a/meta-oe/recipes-connectivity/modemmanager/modemmanager/0001-Do-not-set-Wno-unused-but-set-variable.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From d4f73b037d11d20f080e74c05df28853fb833075 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 7 Dec 2018 22:59:47 -0800
-Subject: [PATCH] Do not set Wno-unused-but-set-variable
-
-This is gcc specific warning, not implemented by  pretending to be  gcc
-like compilers e.g. clang.
-
-We will pass this option from recipe
-
-Upstream-Status: Inappropriate [OE-Specific]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- m4/compiler_warnings.m4 | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/m4/compiler_warnings.m4 b/m4/compiler_warnings.m4
-index f498a28..e65e97f 100644
---- a/m4/compiler_warnings.m4
-+++ b/m4/compiler_warnings.m4
-@@ -11,7 +11,7 @@ if test "$GCC" = "yes" -a "$set_more_warnings" != "no"; then
- 		      -Wdeclaration-after-statement -Wstrict-prototypes \
- 		      -Wno-unused-parameter -Wno-sign-compare \
- 		      -Wno-deprecated-declarations \
--		      -Wno-unused-but-set-variable -Wformat-security; do
-+		      -Wno-unused -Wformat-security; do
- 		SAVE_CFLAGS="$CFLAGS"
- 		CFLAGS="$CFLAGS $option"
- 		AC_MSG_CHECKING([whether gcc understands $option])
diff --git a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.10.0.bb b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.10.0.bb
index 1ad19e8f7..ef5af3a57 100644
--- a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.10.0.bb
+++ b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.10.0.bb
@@ -12,7 +12,6 @@ inherit gnomebase gettext systemd vala gobject-introspection bash-completion
 DEPENDS = "glib-2.0 libgudev intltool-native libxslt-native"
 
 SRC_URI = "http://www.freedesktop.org/software/ModemManager/ModemManager-${PV}.tar.xz \
-           file://0001-Do-not-set-Wno-unused-but-set-variable.patch \
            "
 SRC_URI[md5sum] = "92d25176d0cc9d588ca29700b33c7d98"
 SRC_URI[sha256sum] = "fd0f39996025dac96995daea8a58ec7dd571582f7563a8ae0d5f65b571b76ee2"
@@ -33,7 +32,7 @@ PACKAGECONFIG[qmi] = "--with-qmi,--without-qmi,libqmi"
 EXTRA_OECONF = " \
     --with-udev-base-dir=${nonarch_base_libdir}/udev \
 "
-CFLAGS_append_toolchain-gcc = " -Wno-unused-but-set-variable"
+EXTRA_OECONF_append_toolchain-clang = " --enable-more-warnings=no"
 
 FILES_${PN} += " \
     ${datadir}/icons \
-- 
2.17.1


