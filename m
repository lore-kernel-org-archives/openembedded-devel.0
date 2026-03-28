Return-Path: <mail@michael-fitzmayer.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F8B710D1489
	for <webhook@archiver.kernel.org>; Sat, 28 Mar 2026 21:31:09 +0000 (UTC)
Received: from mailserv.regfish.com (mailserv.regfish.com [52.57.101.90])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19248.1774733458936693226
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 28 Mar 2026 14:30:59 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=permanent DNS error (domain: michael-fitzmayer.de, ip: 52.57.101.90, mailfrom: mail@michael-fitzmayer.de)
Received: by mailserv.regfish.com (Postfix, from userid 706)
	id 8FD3660781; Sat, 28 Mar 2026 21:30:57 +0000 (UTC)
Received: from DESKTOP-B84SDL6.localdomain (ipservice-092-209-208-070.092.209.pools.vodafone-ip.de [92.209.208.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: 46272-0001)
	by mailserv.regfish.com (Postfix) with ESMTPSA id 6AC8F60770;
	Sat, 28 Mar 2026 21:30:57 +0000 (UTC)
From: Michael Fitzmayer <mail@michael-fitzmayer.de>
To: openembedded-devel@lists.openembedded.org
Cc: Michael Fitzmayer <mail@michael-fitzmayer.de>
Subject: [meta-oe][PATCH] canopenterm: update to version 2.00
Date: Sat, 28 Mar 2026 22:30:55 +0100
Message-ID: <20260328213055.2297968-1-mail@michael-fitzmayer.de>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 28 Mar 2026 21:31:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125803

- Switched to a new versioning scheme: 1.0.13 -> 2.00
- Reworked CAN interface handling by migrating to the CANvenient abstract=
ion layer
- Improved/updated auto-completion using isocline
- Various bug fixes

Signed-off-by: Michael Fitzmayer <mail@michael-fitzmayer.de>
---
 ...o-not-pin-to-c89-constructs-on-linux.patch | 33 -------------------
 ...openterm_1.0.13.bb =3D> canopenterm_2.00.bb} | 12 +++----
 2 files changed, 5 insertions(+), 40 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/canopenterm/canopenterm/0001=
-cmake-Do-not-pin-to-c89-constructs-on-linux.patch
 rename meta-oe/recipes-extended/canopenterm/{canopenterm_1.0.13.bb =3D> =
canopenterm_2.00.bb} (68%)

diff --git a/meta-oe/recipes-extended/canopenterm/canopenterm/0001-cmake-=
Do-not-pin-to-c89-constructs-on-linux.patch b/meta-oe/recipes-extended/ca=
nopenterm/canopenterm/0001-cmake-Do-not-pin-to-c89-constructs-on-linux.pa=
tch
deleted file mode 100644
index e6213c473d..0000000000
--- a/meta-oe/recipes-extended/canopenterm/canopenterm/0001-cmake-Do-not-=
pin-to-c89-constructs-on-linux.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 694563e023a296ecfd4c73fac681509323c14ada Mon Sep 17 00:00:00 2001
-From: Khem Raj <khem.raj@oss.qualcomm.com>
-Date: Tue, 24 Mar 2026 10:01:59 -0700
-Subject: [PATCH] cmake: Do not pin to c89 constructs on linux
-
-This does not work with latest lua
-
-Fixes
-|    91 | #error "POSIX is not compatible with C89"
-|       |  ^
-| 1 error generated.
-| [44/51] Building C object CMakeFiles/crossline.dir/src/crossline/cross=
line.c.o
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
----
- cmake/os_linux.cmake | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/cmake/os_linux.cmake b/cmake/os_linux.cmake
-index 7096cbd..ef18d56 100644
---- a/cmake/os_linux.cmake
-+++ b/cmake/os_linux.cmake
-@@ -56,7 +56,7 @@ if (BUILD_YOCTO)
-     if (LUA_FOUND)
-         include_directories(${LUA_INCLUDE_DIR})
-         set(PLATFORM_LIBS ${PLATFORM_LIBS} ${LUA_LIBRARIES})
--        add_compile_definitions(LUA_USE_C89 LUA_USE_LINUX)
-+        add_compile_definitions(LUA_USE_LINUX)
-     else()
-         message(FATAL_ERROR "Lua not found")
-     endif()
diff --git a/meta-oe/recipes-extended/canopenterm/canopenterm_1.0.13.bb b=
/meta-oe/recipes-extended/canopenterm/canopenterm_2.00.bb
similarity index 68%
rename from meta-oe/recipes-extended/canopenterm/canopenterm_1.0.13.bb
rename to meta-oe/recipes-extended/canopenterm/canopenterm_2.00.bb
index 25c7d97451..1e86a76927 100644
--- a/meta-oe/recipes-extended/canopenterm/canopenterm_1.0.13.bb
+++ b/meta-oe/recipes-extended/canopenterm/canopenterm_2.00.bb
@@ -11,14 +11,12 @@ HOMEPAGE =3D "https://canopenterm.de"
 BUGTRACKER =3D "https://github.com/CANopenTerm/CANopenTerm/issues"
=20
 LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3D5f8a62fabd50ce3f1d7794bc84=
9ae7a5"
+LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3Dbd2edc721b4a0289efe949bdbe=
7dda79"
=20
-DEPENDS =3D "cjson libinih libsdl3 lua libsocketcan pocketpy"
+DEPENDS =3D "canvenient cjson isocline libinih libsdl3 lua pocketpy"
=20
-SRC_URI =3D "git://github.com/CANopenTerm/CANopenTerm.git;protocol=3Dhtt=
ps;branch=3Dmain \
-           file://0001-cmake-Do-not-pin-to-c89-constructs-on-linux.patch=
"
-
-SRCREV  =3D "b0555360e5e8b444a2a9e14088fd253412184eb8"
+SRC_URI =3D "git://github.com/CANopenTerm/CANopenTerm.git;protocol=3Dhtt=
ps;branch=3Dmain"
+SRCREV  =3D "6024d99d1d34f8e3fec20a2150fc44380cf40fb2"
=20
=20
 inherit cmake ptest
@@ -27,4 +25,4 @@ EXTRA_OECMAKE +=3D "-DBUILD_YOCTO=3DON"
=20
 FILES:${PN} +=3D "${bindir}/CANopenTerm ${bindir}/codb2json ${datadir}"
=20
-RDEPENDS:${PN} =3D "cjson libinih libsdl3 lua libsocketcan pocketpy"
+RDEPENDS:${PN} =3D "canvenient cjson libinih libsdl3 lua pocketpy"
--=20
2.47.3


