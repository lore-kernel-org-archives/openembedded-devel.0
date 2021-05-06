Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web10.516.1620330571956202019
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 May 2021 12:49:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=sCMKDF7Y;
 spf=pass (domain: gmail.com, ip: 209.85.215.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id c21so5487557pgg.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 06 May 2021 12:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VT+Dvk8ry5XsHCSLKQNaAQhYiE/8Ry5xEtqqnHen44o=;
        b=sCMKDF7Y4o8JYOkSTE/riae91GOJ6Rr/OjYvKgMM4koiX0maF3A/OBr1YUJ0QgPrZ3
         BsM4ugmfYdmpRE+9R2IFASkSs0sUpc1Qxf7xlr9I9DBZqunOkil8GgFeL5ns3zTl7m6h
         tK/Wnyd7veSLZ9EWZx42Zf0i74YL/Sfq38sE9X7HHDU6HBibN+6i3IheBYlzuPr1XTHc
         vIZjuQnR6BTZlRGe98UAbOcHZAQjYyxkzQWy9llTfFAaLIrCdF6HOi974Tg4ZE62W+ja
         fnxTAGbaSQIs5LUT9OnE17hxkyB5SE+4PfNa7EjfWTQvuoJpyR4LG8kdQFXtIerjkc2Z
         0d/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VT+Dvk8ry5XsHCSLKQNaAQhYiE/8Ry5xEtqqnHen44o=;
        b=Pt3+ThnCwFhrvBByMJX2jcUPEXeAZpsloIngKDvj/OfkCHfQ2GZeBzt+Xjq1ELx/V1
         xSuYLqSSspjSHU+5h0anT2k9M2AN6P9csZLsRtBQZQKnhxWEzJAg2Ao9AfDEoRpBihz0
         RF8knBt4ZDdRGHNZF5sIxeldOAcnrgtX7xUzMZ4Pogsq8oQLZHJ2C1fcxjqOnzmgMIss
         cRJw6J8d9L7AaCMKqnmKON0lpe02ZyZB/3sFoEyjkocbaJj6ks/C9QdXgDBK/BzhuU08
         MiU9LfcWIDDye9aFhi9hVQfb9x9Jp3wvZ5eKrgHH6itMCsmvpLHEU9FwKQwgt9Q6oS3a
         tb1w==
X-Gm-Message-State: AOAM531/V9bGCZEhTBNM7Nkj6w+2PcRdlve3lumvV6r3mupl7OZAktAE
	8CC2Fne5fKo8iiFfB4MWhZGNtodXGX2CEA==
X-Google-Smtp-Source: ABdhPJy/C8uN1+VJLqoVm/ZUjdlXP3j7S5OUQ93bw6sJykaD/JUW+BPrCWgavnZ1hqvGzLgMnw12sw==
X-Received: by 2002:a63:ed17:: with SMTP id d23mr6052828pgi.107.1620330571193;
        Thu, 06 May 2021 12:49:31 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::308d])
        by smtp.gmail.com with ESMTPSA id i22sm2498776pgj.90.2021.05.06.12.49.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 May 2021 12:49:30 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] icewm: Upgrade to 2.3.3
Date: Thu,  6 May 2021 12:49:29 -0700
Message-Id: <20210506194929.2560839-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Do not check for C++11, since it is a runtime check, wont work during
cross compile, in anycase our compilers do support C++11 and default to
c++ or newer std, so this check is redundant for OE toolchains

Add new required build time deps on fribidi and imlib2

Changes are [1]

[1] https://github.com/ice-wm/icewm/releases/tag/2.3.3

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...p-running-test-program-when-cross-co.patch | 31 ++++++++++++++-----
 .../icewm/{icewm_1.6.5.bb => icewm_2.3.3.bb}  |  4 +--
 2 files changed, 26 insertions(+), 9 deletions(-)
 rename meta-oe/recipes-extended/icewm/{icewm_1.6.5.bb => icewm_2.3.3.bb} (89%)

diff --git a/meta-oe/recipes-extended/icewm/icewm/0001-configure.ac-skip-running-test-program-when-cross-co.patch b/meta-oe/recipes-extended/icewm/icewm/0001-configure.ac-skip-running-test-program-when-cross-co.patch
index 7943948550..c5e210afcd 100644
--- a/meta-oe/recipes-extended/icewm/icewm/0001-configure.ac-skip-running-test-program-when-cross-co.patch
+++ b/meta-oe/recipes-extended/icewm/icewm/0001-configure.ac-skip-running-test-program-when-cross-co.patch
@@ -10,11 +10,9 @@ Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
  configure.ac | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
-diff --git a/configure.ac b/configure.ac
-index c5e3ca03..4b89396a 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -140,7 +140,7 @@ AC_CHECK_FUNC([getloadavg],[AC_DEFINE([HAVE_GETLOADAVG2], 1, [getloadavg() is av
+@@ -160,7 +160,7 @@ AC_CHECK_FUNCS([backtrace_symbols_fd mem
  AC_FUNC_SELECT_ARGTYPES
  
  AC_MSG_CHECKING([for strlcpy])
@@ -23,7 +21,7 @@ index c5e3ca03..4b89396a 100644
                 char a[2];
                 if (strlcpy(a, "yes", 2) != 3)
                     return 1;]])],
-@@ -156,7 +156,7 @@ AC_RUN_IFELSE([AC_LANG_PROGRAM([[#include <string.h>]],[[
+@@ -176,7 +176,7 @@ AC_RUN_IFELSE([AC_LANG_PROGRAM([[#includ
                ])
  
  AC_MSG_CHECKING([for strlcat])
@@ -32,6 +30,25 @@ index c5e3ca03..4b89396a 100644
                 char a[4] = "no";
                 if (strlcat(a, "yes", 4) != 5)
                     return 1;]])],
--- 
-2.17.1
-
+@@ -191,21 +191,6 @@ AC_RUN_IFELSE([AC_LANG_PROGRAM([[#includ
+                            [Define to 1 if you have the strlcat function.])
+               ])
+ 
+-AC_MSG_CHECKING([for C++11 by default])
+-AC_RUN_IFELSE([AC_LANG_PROGRAM([[#include <regex>]],[[
+-               if (__cplusplus < 201103L) return 1;]])],
+-              [AC_MSG_RESULT([yes])],
+-              [AC_MSG_RESULT([no])
+-               AC_MSG_CHECKING([for C++11 when forced])
+-               CXXFLAGS="$CXXFLAGS -std=c++11"
+-               AC_RUN_IFELSE([AC_LANG_PROGRAM([[#include <regex>]],[[
+-                              if (__cplusplus < 201103L) return 1;]])],
+-                             [AC_MSG_RESULT([yes])],
+-                             [AC_MSG_RESULT([no])
+-                              AC_MSG_ERROR([Need C++11. Please set CXXFLAGS.])
+-                             ])
+-              ])
+-
+ PKG_CHECK_MODULES([CORE],[fontconfig xrender xcomposite xdamage xfixes xext x11])
+ AC_SUBST([CORE_CFLAGS])
+ AC_SUBST([CORE_LIBS])
diff --git a/meta-oe/recipes-extended/icewm/icewm_1.6.5.bb b/meta-oe/recipes-extended/icewm/icewm_2.3.3.bb
similarity index 89%
rename from meta-oe/recipes-extended/icewm/icewm_1.6.5.bb
rename to meta-oe/recipes-extended/icewm/icewm_2.3.3.bb
index 241a2b30f3..abc3e098c5 100644
--- a/meta-oe/recipes-extended/icewm/icewm_1.6.5.bb
+++ b/meta-oe/recipes-extended/icewm/icewm_2.3.3.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4a26952467ef79a7efca4a9cf52d417b"
 SRC_URI = "https://github.com/ice-wm/${BPN}/releases/download/${PV}/${BPN}-${PV}.tar.lz \
            file://0001-configure.ac-skip-running-test-program-when-cross-co.patch \
            "
-SRC_URI[sha256sum] = "d41e6abf842ff3f8705a81d352be7c5b181c587549c183de0641c3820234a7b2"
+SRC_URI[sha256sum] = "4162565cf7566d78d786e4ecf4b0639451b8464bcb24e761b1f08ef43e95e513"
 
 UPSTREAM_CHECK_URI = "https://github.com/ice-wm/${BPN}/releases"
 
@@ -19,7 +19,7 @@ EXTRA_OECONF += "--with-libdir=${datadir}/icewm \
                 --enable-xinerama \
                 --enable-shape"
 
-DEPENDS = "asciidoc-native fontconfig gdk-pixbuf libxft libxpm libxrandr \
+DEPENDS = "asciidoc-native fontconfig fribidi gdk-pixbuf imlib2	libxft libxpm libxrandr \
     libxinerama libice libsm libx11 libxext libxrender libxcomposite libxdamage \
     libxfixes"
 DEPENDS_append = " qemu-native"
-- 
2.31.1

