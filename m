Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFE24C3601E
	for <webhook@archiver.kernel.org>; Mon, 14 Apr 2025 07:04:30 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web11.44034.1744614263332022628
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Apr 2025 00:04:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gzBzfTen;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ac7bd86f637so991370266b.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 14 Apr 2025 00:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744614262; x=1745219062; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g0I3aOFNrlJleKJd1kNy0J/wRii5inaVN0iAKRRW7q4=;
        b=gzBzfTen9mwrnOQYnSfDp4/q/1EDpvuoc/e/OVHE38GskkBLUVB4Qx41fanB6DUm1C
         ZqxL4BNruhP7BJHQAJ0nkyaZj5/cA4Ah9DD1kcs4C3/EHDTzrVyDlrG21EIar8M4IePf
         oF6SaUSNttMblvGQuaF+r2nw9CvblBM+U0KEoyrB0o/I7DByRLeh9uPiaFS/1a9I0/zm
         sD7Xa3aKwDYyOT9bvG+TXwNzaMNRT/hLNBiTczNRoIsOxYF7zikUWl9knupfuJ/YqC1r
         qnD9Izdw2Fzz0hi6CSlY9/O2aZ0Thyw1NfLyiDUwpgKUug+W0ZkNa8OHKdY/P0nz6W8q
         aGSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744614262; x=1745219062;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g0I3aOFNrlJleKJd1kNy0J/wRii5inaVN0iAKRRW7q4=;
        b=pxWJzDzKOkUI/9xNH9wSN0rHjZiv+TT2khOAR5T14qtoImQ8D4H2LRlGZ/nhxnpDX3
         31zlLPqtxmKGzRb0WgKIencYau5fmv5D/IJsX+ZZfVOS+1XTj+9m3a3gO/7zOsu8lg8y
         PJyYNvXDRzm7s2XYLV4x7O/uOGLHvUlFwkY+7v5xomfal7IWcGnXHjLyPbvjbBhnm4Kn
         pQpn0FqngA3l6dgVJVoqABzh97ZzCTATwJtQ8bc3D70bn5ZRUoI3D9Kaa47dk9Tik9Qo
         UBFyCGFLLJyxCculmV7AnH2eXkapOwRJW/k+dzksVTtHpx3DEVuz/vsHe3MO4ZEO0Yul
         eLKQ==
X-Gm-Message-State: AOJu0Yxws8t6vlsv9EsvENl0jYEmjf78bAy/o9go6I0wSe4aKswcPuEN
	B6UFsjEsnpUxWwzkA2D+SRvSxfTkrasRYNx71ChRU/Hv6UbE/nVBHWSs/RRM
X-Gm-Gg: ASbGncsDcBw4KV62jGr1o2r08YIBO4WFts3ALMtqhClDyTkbqr02jkulRcCw4dQbT1S
	ezT/rKUWUxna/9yfYsKwuDtSTHC+AUoR1A6420uPCaEmE03HYYvU9zYIKiBqFqe2shXIzIF4FqW
	Y+gDEGV8RipC9Tkud8sqwoLVqGy6WsffcIR1XglqOMg8N3DBL1j/mEBaZ0U57DVp0K+SVn6DzzW
	gC5grJd8vXKxGaZ4y7nSZXcr7Gd5c7lGoSbnlRFedANllT8lX1BgwioaZjmOqj8KDHNvLYfr73z
	3+/PDQVQEnPHOUnXYxjcC6Mp3QBENjge2hFoRAPCK0tPE7PC1fxKw0K4GEEoQDC5eo0AvUv7Koj
	A85+69QtO
X-Google-Smtp-Source: AGHT+IEhpl7oMnOnouAZEIHJl/KosmWFbidc6uwO0vv6vk1siTw+hwxA42E0JMDthmxsk4bHHF9RRg==
X-Received: by 2002:a17:907:8694:b0:aca:95eb:12e with SMTP id a640c23a62f3a-acad17d0177mr1017256966b.24.1744614261305;
        Mon, 14 Apr 2025 00:04:21 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-acaa1ccd1cfsm857097466b.138.2025.04.14.00.04.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 00:04:20 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH] qhull: pass LIB_INSTALL_DIR to fix builds with multilib
Date: Mon, 14 Apr 2025 09:04:18 +0200
Message-ID: <20250414070418.760168-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Apr 2025 07:04:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116844

From: Martin Jansa <martin.jansa@gmail.com>

* fixes:
ERROR: QA Issue: lib32-qhull: Files/directories were installed but not shipped in any package:
  /usr/lib/libqhull_r.so.8.0.2
  /usr/lib/libqhullcpp.a
  /usr/lib/libqhull_r.so.8.0
  /usr/lib/libqhullstatic_r.a
  /usr/lib/libqhullstatic.a
  /usr/lib/libqhull_r.so
  /usr/lib/cmake
  /usr/lib/pkgconfig
  /usr/lib/cmake/Qhull
  /usr/lib/cmake/Qhull/QhullTargets.cmake
  /usr/lib/cmake/Qhull/QhullTargets-noconfig.cmake
  /usr/lib/cmake/Qhull/QhullConfig.cmake
  /usr/lib/cmake/Qhull/QhullConfigVersion.cmake
  /usr/lib/pkgconfig/qhullcpp.pc
  /usr/lib/pkgconfig/qhullstatic_r.pc
  /usr/lib/pkgconfig/qhullstatic.pc
  /usr/lib/pkgconfig/qhull_r.pc
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
lib32-qhull: 17 installed and not shipped files. [installed-vs-shipped]

as well as lib32-python3-matplotlib failures which won't find qhull as /usr/lib
isn't staged by lib32-qhull.

Run-time dependency qhull_r found: NO (tried pkgconfig and cmake)
Check usable header "libqhull_r/qhull_ra.h" : YES

../matplotlib-3.10.1/extern/meson.build:28:19: ERROR: C shared or static library 'qhull_r' not found

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 ...DIR-for-cmake-and-pkgconfig-files-to.patch | 35 +++++++++++++++++++
 .../recipes-extended/qhull/qhull_2020.2.bb    |  5 ++-
 2 files changed, 39 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-extended/qhull/qhull/0001-Use-LIB_INSTALL_DIR-for-cmake-and-pkgconfig-files-to.patch

diff --git a/meta-oe/recipes-extended/qhull/qhull/0001-Use-LIB_INSTALL_DIR-for-cmake-and-pkgconfig-files-to.patch b/meta-oe/recipes-extended/qhull/qhull/0001-Use-LIB_INSTALL_DIR-for-cmake-and-pkgconfig-files-to.patch
new file mode 100644
index 0000000000..7003dd76c2
--- /dev/null
+++ b/meta-oe/recipes-extended/qhull/qhull/0001-Use-LIB_INSTALL_DIR-for-cmake-and-pkgconfig-files-to.patch
@@ -0,0 +1,35 @@
+From f72312ae0becb581cd428d17dbbcdf1b6f02ebee Mon Sep 17 00:00:00 2001
+From: Orion Poplawski <orion@nwra.com>
+Date: Tue, 4 Oct 2022 21:56:58 -0600
+Subject: [PATCH] Use ${LIB_INSTALL_DIR} for cmake and pkgconfig files to
+ support multi-lib on Fedora/RedHat
+
+Upstream-Status: Backport [https://github.com/qhull/qhull/commit/67d231c872aa1bae892e5da9646a10b303477039]
+
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+---
+ CMakeLists.txt | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index f50b187..c2248f9 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -709,7 +709,7 @@ configure_file(${PROJECT_SOURCE_DIR}/build/config.cmake.in
+   @ONLY
+ )
+ 
+-set(ConfigPackageLocation lib/cmake/Qhull)
++set(ConfigPackageLocation ${LIB_INSTALL_DIR}/cmake/Qhull)
+ install(EXPORT QhullTargets
+   FILE
+     QhullTargets.cmake
+@@ -728,7 +728,7 @@ install(
+     Devel
+ )
+ 
+-set(PkgConfigLocation lib/pkgconfig)
++set(PkgConfigLocation ${LIB_INSTALL_DIR}/pkgconfig)
+ foreach(pkgconfig IN ITEMS "${qhull_SHAREDR};Qhull reentrant shared library"
+                            "${qhull_STATIC};Qhull static library"
+                            "${qhull_STATICR};Qhull reentrant static library"
diff --git a/meta-oe/recipes-extended/qhull/qhull_2020.2.bb b/meta-oe/recipes-extended/qhull/qhull_2020.2.bb
index 4533b0a337..13638c391b 100644
--- a/meta-oe/recipes-extended/qhull/qhull_2020.2.bb
+++ b/meta-oe/recipes-extended/qhull/qhull_2020.2.bb
@@ -4,13 +4,16 @@ SECTION = "libs"
 LICENSE = "Qhull"
 LIC_FILES_CHKSUM = "file://COPYING.txt;md5=484ee0cacf0472e8b40225b116f6296c"
 
-SRC_URI = "http://www.qhull.org/download/qhull-2020-src-8.0.2.tgz"
+SRC_URI = "http://www.qhull.org/download/qhull-2020-src-8.0.2.tgz \
+    file://0001-Use-LIB_INSTALL_DIR-for-cmake-and-pkgconfig-files-to.patch \
+"
 SRC_URI[sha256sum] = "b5c2d7eb833278881b952c8a52d20179eab87766b00b865000469a45c1838b7e"
 
 CFLAGS += "-fPIC"
 
 EXTRA_OECMAKE += "\
     -DCMAKE_SKIP_RPATH=ON \
+    -DLIB_INSTALL_DIR=${baselib} \
 "
 
 inherit cmake

