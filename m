Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web12.2504.1631156763581530229
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Sep 2021 20:06:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@fujitsu.com header.s=170520fj header.b=FYhfQWKy;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1631156761; i=@fujitsu.com;
	bh=XyxbU7mhKyfR6pw0xI64WBIYqjGle8NhbHdQiNSK5A0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	b=FYhfQWKy7VASp6d1qsMYa5od+FA+YJID6SAzBm5bmAjoMJ51lNGphsIqI2s120Gm7
	 7mI/9U37ZhTC7WXOv+hAPv1IVg9h/TJswrMZcxqj6TtYbYpigMocusi3hEtk86rHoL
	 3/DbjDaB7dbmbeZiCQ1yCp6j7YBQ0pYtWMYyBZNdkyV/6ZxvfSPvcV56We7ObpFskG
	 02rP27VDKDFmoAWPNJTMym0qXqh2tmyKHptwyGfWAY/HGHr1dUSAkQnE9ZU8WNFjHg
	 kZZozRJRhhc0ohT66vIs7dz+wHWWZ1CbEdsVKuBRvBkeRzZXDymj6LsH+ESHzK2ySK
	 WIIiTlBaX3WBw==
Received: from [100.113.3.88] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-central-1.aws.symcld.net id 8A/8C-24763-81A79316; Thu, 09 Sep 2021 03:06:00 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrEIsWRWlGSWpSXmKPExsViZ8MxVVeiyjL
  R4NNBAYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNeNtx0mmgqNGFQ8XvWJqYHyh1cXIxSEkMItJ
  4sCOY8xdjJxAzm5GiX13K0BsNgFdiXOP17KD2CIC+hJLZ+8BquHgEBZwlphxQBckzCKgInF19
  VYWEJtXwEPi6OsXYOUSAgoSUx6+Z4aIC0qcnPkErIZZQFWi+8hTJghbXqJ562ywkRICihKzp8
  tDtFZIvD58iXkCI+8sJN2zkHTPQtK9gJF5FaNlUlFmekZJbmJmjq6hgYGuoaGxrqGukZGZXmK
  VbqJeaqlucmpeSVEiUFYvsbxYr7gyNzknRS8vtWQTIzDoUgoZH+1gPP36g94hRkkOJiVR3gZh
  y0QhvqT8lMqMxOKM+KLSnNTiQ4wyHBxKErwHK4BygkWp6akVaZk5wAiASUtw8CiJ8H4oA0rzF
  hck5hZnpkOkTjEqSonzPgXpEwBJZJTmwbXBou4So6yUMC8jAwODEE9BalFuZgmq/CtGcQ5GJW
  He/yBTeDLzSuCmvwJazAS02PeaBcjikkSElFQDk5TuF89l9+etjnxw1rzwl4G87rxfc2/+U9v
  uvIhtojDP+mSWxatE89VMO7msQo3/lbKvvjFl6W2xkDAbAYf3u6JmLt1z77Nl99vPqzN+3nos
  rqT4LKVlhm7+x5WXX8SmKNs9fX0pW/jd46fXJHYuORBbdSrn974jGru6V6fle98T7UyMPZUj6
  t5y6+bCZ+75pRM/JKXs/f/MteRFu8XJPaf9kvlPv7aWVaypkfwf+Xr3xg9abifyptx3f2E1W/
  nXKt4/zSIsn/h2fylqs350hZGJ2WRH+9aqaYWf59ZwMnqr9l3uY2fJnzMlWW5K0U6/uTVNt24
  uKxL6eibgw709L6WyXzxJETYsKWH8cMXn6BYlluKMREMt5qLiRAB7DJFqNQMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-12.tower-226.messagelabs.com!1631156759!15843!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 1415 invoked from network); 9 Sep 2021 03:06:00 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-12.tower-226.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 9 Sep 2021 03:06:00 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 18935xfW005612
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 9 Sep 2021 04:05:59 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Thu, 9 Sep 2021 04:05:58 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] poppler: upgrade 21.08.0 -> 21.09.0
Date: Wed, 8 Sep 2021 08:16:22 +0800
Message-ID: <1631060182-96164-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain; charset="y"
Content-Transfer-Encoding: quoted-printable

refresh 0001-Do-not-overwrite-all-our-build-flags.patch

Release 21.09.0:
    core:
     * Splash: Massive speed improvement on files that use lots of save/restore (q/Q) operators
     * Correct decoding of signature properties Reason & Location when they are Unicode
     * Fix issues with malformed files
     * MSVC build fixes

    build system:
     * Call cmake_minium_required() before project()
     * Always append to CMAKE_{C,CXX}_FLAGS_${CMAKE_BUILD_TYPE}
     * correctly forward user-provided flags to try_compile()

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 ...Do-not-overwrite-all-our-build-flags.patch | 52 +++++++++----------
 ...{poppler_21.08.0.bb =3D> poppler_21.09.0.bb} |  2 +-
 2 files changed, 27 insertions(+), 27 deletions(-)
 rename meta-oe/recipes-support/poppler/{poppler_21.08.0.bb =3D> poppler_21.09.0.bb} (96%)

diff --git a/meta-oe/recipes-support/poppler/poppler/0001-Do-not-overwrite-all-our-build-flags.patch b/meta-oe/recipes-support/poppler/poppler/0001-Do-not-overwrite-all-our-build-flags.patch
index afb0b5df08..e07da387b2 100644
--- a/meta-oe/recipes-support/poppler/poppler/0001-Do-not-overwrite-all-our-build-flags.patch
+++ b/meta-oe/recipes-support/poppler/poppler/0001-Do-not-overwrite-all-our-build-flags.patch
@@ -10,46 +10,46 @@ Upstream-Status: Inappropriate [embedded specific]
 
 Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
 ---
- cmake/modules/PopplerMacros.cmake | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
+ cmake/modules/PopplerMacros.cmake | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
 
+diff --git a/cmake/modules/PopplerMacros.cmake b/cmake/modules/PopplerMacros.cmake
+index 2aed028..3c30f3f 100644
 --- a/cmake/modules/PopplerMacros.cmake
 +++ b/cmake/modules/PopplerMacros.cmake
-@@ -104,14 +104,14 @@ if(CMAKE_COMPILER_IS_GNUCXX)
+@@ -117,13 +117,13 @@ if(CMAKE_COMPILER_IS_GNUCXX)
+   set(DEFAULT_COMPILE_WARNINGS "${_warn}")
    set(DEFAULT_COMPILE_WARNINGS_EXTRA "${_warn} ${_warnx}")
-
-   set(_save_cxxflags "${CMAKE_CXX_FLAGS}")
+ 
 -  set(CMAKE_CXX_FLAGS                "-fno-exceptions -fno-check-new -fno-common -fno-operator-names -D_DEFAULT_SOURCE")
 +  set(CMAKE_CXX_FLAGS                "-fno-exceptions -fno-check-new -fno-common -fno-operator-names -D_DEFAULT_SOURCE ${_save_cxxflags}")
-   set(CMAKE_CXX_FLAGS_RELWITHDEBINFO "-O2 -g ${_save_cxxflags}")
-   set(CMAKE_CXX_FLAGS_RELEASE        "-O2 -DNDEBUG ${_save_cxxflags}")
-   set(CMAKE_CXX_FLAGS_DEBUG          "-g -O2 -fno-reorder-blocks -fno-schedule-insns -fno-inline ${_save_cxxflags}")
-   set(CMAKE_CXX_FLAGS_DEBUGFULL      "-g3 -fno-inline ${_save_cxxflags}")
-   set(CMAKE_CXX_FLAGS_PROFILE        "-g3 -fno-inline -ftest-coverage -fprofile-arcs ${_save_cxxflags}")
-   set(_save_cflags "${CMAKE_C_FLAGS}")
+   set(CMAKE_CXX_FLAGS_RELWITHDEBINFO "-O2 -g")
+   set(CMAKE_CXX_FLAGS_RELEASE        "-O2 -DNDEBUG")
+   set(CMAKE_CXX_FLAGS_DEBUG          "-g -O2 -fno-reorder-blocks -fno-schedule-insns -fno-inline")
+   set(CMAKE_CXX_FLAGS_DEBUGFULL      "-g3 -fno-inline")
+   set(CMAKE_CXX_FLAGS_PROFILE        "-g3 -fno-inline -ftest-coverage -fprofile-arcs")
 -  set(CMAKE_C_FLAGS                  "-std=3Dc99 -D_DEFAULT_SOURCE")
 +  set(CMAKE_C_FLAGS                  "-std=3Dc99 -D_DEFAULT_SOURCE ${_save_cflags}")
-   set(CMAKE_C_FLAGS_RELWITHDEBINFO   "-O2 -g ${_save_cflags}")
-   set(CMAKE_C_FLAGS_RELEASE          "-O2 -DNDEBUG ${_save_cflags}")
-   set(CMAKE_C_FLAGS_DEBUG            "-g -O2 -fno-reorder-blocks -fno-schedule-insns -fno-inline ${_save_cflags}")
-@@ -149,7 +149,7 @@ if ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "Clang")
+   set(CMAKE_C_FLAGS_RELWITHDEBINFO   "-O2 -g")
+   set(CMAKE_C_FLAGS_RELEASE          "-O2 -DNDEBUG")
+   set(CMAKE_C_FLAGS_DEBUG            "-g -O2 -fno-reorder-blocks -fno-schedule-insns -fno-inline")
+@@ -161,14 +161,14 @@ if ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "Clang")
+   set(DEFAULT_COMPILE_WARNINGS "${_warn}")
    set(DEFAULT_COMPILE_WARNINGS_EXTRA "${_warn} ${_warnx}")
-
-   set(_save_cxxflags "${CMAKE_CXX_FLAGS}")
+ 
 -  set(CMAKE_CXX_FLAGS                "-fno-exceptions -fno-check-new -fno-common -D_DEFAULT_SOURCE")
 +  set(CMAKE_CXX_FLAGS                "-fno-exceptions -fno-check-new -fno-common -D_DEFAULT_SOURCE ${_save_cxxflags}")
-   set(CMAKE_CXX_FLAGS_RELWITHDEBINFO "-O2 -g ${_save_cxxflags}")
-   set(CMAKE_CXX_FLAGS_RELEASE        "-O2 -DNDEBUG ${_save_cxxflags}")
+   set(CMAKE_CXX_FLAGS_RELWITHDEBINFO "-O2 -g")
+   set(CMAKE_CXX_FLAGS_RELEASE        "-O2 -DNDEBUG")
    # clang does not support -fno-reorder-blocks -fno-schedule-insns, so do not use -O2
-@@ -157,7 +157,7 @@ if ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "Clang")
-   set(CMAKE_CXX_FLAGS_DEBUGFULL      "-g3 -fno-inline ${_save_cxxflags}")
-   set(CMAKE_CXX_FLAGS_PROFILE        "-g3 -fno-inline -ftest-coverage -fprofile-arcs ${_save_cxxflags}")
-   set(_save_cflags "${CMAKE_C_FLAGS}")
+   set(CMAKE_CXX_FLAGS_DEBUG          "-g")
+   set(CMAKE_CXX_FLAGS_DEBUGFULL      "-g3 -fno-inline")
+   set(CMAKE_CXX_FLAGS_PROFILE        "-g3 -fno-inline -ftest-coverage -fprofile-arcs")
 -  set(CMAKE_C_FLAGS                  "-std=3Dc99 -D_DEFAULT_SOURCE")
 +  set(CMAKE_C_FLAGS                  "-std=3Dc99 -D_DEFAULT_SOURCE ${_save_cflags}")
-   set(CMAKE_C_FLAGS_RELWITHDEBINFO   "-O2 -g ${_save_cflags}")
-   set(CMAKE_C_FLAGS_RELEASE          "-O2 -DNDEBUG ${_save_cflags}")
+   set(CMAKE_C_FLAGS_RELWITHDEBINFO   "-O2 -g")
+   set(CMAKE_C_FLAGS_RELEASE          "-O2 -DNDEBUG")
    # clang does not support -fno-reorder-blocks -fno-schedule-insns, so do not use -O2
---
+-- 
 2.25.1
 
diff --git a/meta-oe/recipes-support/poppler/poppler_21.08.0.bb b/meta-oe/recipes-support/poppler/poppler_21.09.0.bb
similarity index 96%
rename from meta-oe/recipes-support/poppler/poppler_21.08.0.bb
rename to meta-oe/recipes-support/poppler/poppler_21.09.0.bb
index 1fc3bf3f46..0ecf199732 100644
--- a/meta-oe/recipes-support/poppler/poppler_21.08.0.bb
+++ b/meta-oe/recipes-support/poppler/poppler_21.09.0.bb
@@ -7,7 +7,7 @@ SRC_URI =3D "http://poppler.freedesktop.org/${BP}.tar.xz \
            file://0001-Do-not-overwrite-all-our-build-flags.patch \
            file://basename-include.patch \
            "
-SRC_URI[sha256sum] =3D "e9cf5dc5964bce4bb0264d1c4f8122706c910588b421cfc30abc97d6b23e602d"
+SRC_URI[sha256sum] =3D "5a47fef738c2b99471f9b459a8bf8b40aefb7eed92caa4861c3798b2e126d05b"
 
 DEPENDS =3D "fontconfig zlib cairo lcms glib-2.0"
 
-- 
2.25.1

