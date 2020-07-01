Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.10727.1593562050435729557
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Jun 2020 17:07:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ehOQgFOm;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id g17so9152317plq.12
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2020 17:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=43SnV9wJx86xHppM/vhMnEyGnjHTJ+4YwD9zn1BtF6Q=;
        b=ehOQgFOmC1IXxLT0JnrTi1bP55EJW3Hui81lybTMHN5BG93ZI4cNZtVj1RsI58RtPF
         1bDPXij7GA2vo9YuXHufbarSH04vBVZOlnawW9vbYOJDj5ZL12wS5ZZ/8YngRcgvDUkl
         DCGND6NBLv1gRuXWCn6PBgNfFHru68h7bPdfIT3p4hVWBJ8Wx9hsUb6CaXT4wrWn0AzY
         S4A/zpg8bn16AlAO/s2UynSvDMt21R3mb6pPj49uPxJE2EZOe16irRyUlCj/jP98VYts
         KYKFMitME6VALGwl30pja7aCqB/EgGFnnFitrRoYTRNMWMdIUdOz7lgZrUFNKvanTy08
         1NOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=43SnV9wJx86xHppM/vhMnEyGnjHTJ+4YwD9zn1BtF6Q=;
        b=oyFFKdBJR0+esLXMjCjOUMmlboRFSy3QRQzYqmd8i2iaFi7n5miXLa0633NnJgBNHS
         k82wAJlKlO4vDzOPNGdzb1Q9vILBj41gl+6iRgp3M0Gt1bOKBFatiqpnhWJzD05M+o98
         HYmcuFT/Rsi8UkNV98cyO7evCN29EAnUigeo+qKuJRwfsih8ux8AmwH1SnHSJ8HWZ3FL
         Jx1tBMxnD7J75b7NS4N5gNJ+wJrIbZlv6GY5A0CAjLiwcO08/PnAakyCDtV1yqP0PKPP
         MJzNOH2OF9hG4OdV81ySHxVhKQMeuqlR3s8jVEBKN2YOLdvfiLX3uJCBmKOmXKJ5Y6Co
         XG/w==
X-Gm-Message-State: AOAM5301Hyljts52r7x5A5L7BTWi2A54EN+Yx0jyiNauCb/AJLDF2AFb
	XbN93G1uPrLCFMVe/HmnNaYF8LpulHM=
X-Google-Smtp-Source: ABdhPJw3gdscmdw//Uu2dT+i5xfJPUUuJ3pRRBWxH3WX/J+BG7xDJuRrm/f9mVt6zI7uqYlIWLhCzg==
X-Received: by 2002:a17:90a:2dcb:: with SMTP id q11mr18078244pjm.135.1593562049619;
        Tue, 30 Jun 2020 17:07:29 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:c85d:3ce:5443:9164])
        by smtp.gmail.com with ESMTPSA id z2sm3940544pff.36.2020.06.30.17.07.28
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2020 17:07:29 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfel 07/32] postgresql: 12.2 -> 12.3
Date: Tue, 30 Jun 2020 17:06:52 -0700
Message-Id: <85cde1293581a4d523547b09a0f2016d2d5fb766.1593561840.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1593561840.git.akuster808@gmail.com>
References: <cover.1593561840.git.akuster808@gmail.com>

From: Wang Mingyu <wangmy@cn.fujitsu.com>

0001-Use-pkg-config-for-libxml2-detection.patch
removed since it is not available in 12.3

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 04dc1ffc16eaa2eca6299341b2a86e56b9e98367)
[Bug fix only update]
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...Use-pkg-config-for-libxml2-detection.patch | 50 -------------------
 meta-oe/recipes-dbs/postgresql/postgresql.inc |  1 -
 ...{postgresql_12.2.bb => postgresql_12.3.bb} |  4 +-
 3 files changed, 2 insertions(+), 53 deletions(-)
 delete mode 100644 meta-oe/recipes-dbs/postgresql/files/0001-Use-pkg-config-for-libxml2-detection.patch
 rename meta-oe/recipes-dbs/postgresql/{postgresql_12.2.bb => postgresql_12.3.bb} (63%)

diff --git a/meta-oe/recipes-dbs/postgresql/files/0001-Use-pkg-config-for-libxml2-detection.patch b/meta-oe/recipes-dbs/postgresql/files/0001-Use-pkg-config-for-libxml2-detection.patch
deleted file mode 100644
index 84cd5c1579..0000000000
--- a/meta-oe/recipes-dbs/postgresql/files/0001-Use-pkg-config-for-libxml2-detection.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From d3ee8c8df5808b63e86f40831f2ba62cbb33d291 Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Wed, 8 Aug 2018 09:18:27 +0800
-Subject: [PATCH] postgresql: Use pkg-config for libxml2 detection.
-
-Upstream-Status: Inappropriate [configuration]
-
-xml2-config does not work. Use pkgconfig to set CPPFLAGS and LIBS.
-
-Signed-off-by: Philip Balister <philip@balister.org>
-
-update to version 10.4
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
-
-Update for version 12.0
-Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
----
- configure.in | 16 ++--------------
- 1 file changed, 2 insertions(+), 14 deletions(-)
-
-diff --git a/configure.in b/configure.in
-index 6942f81..7fd3e78 100644
---- a/configure.in
-+++ b/configure.in
-@@ -923,20 +923,8 @@ PGAC_ARG_BOOL(with, libxml, no, [build with XML support],
-               [AC_DEFINE([USE_LIBXML], 1, [Define to 1 to build with XML support. (--with-libxml)])])
- 
- if test "$with_libxml" = yes ; then
--  PGAC_PATH_PROGS(XML2_CONFIG, xml2-config)
--  AC_ARG_VAR(XML2_CONFIG, [path to xml2-config utility])dnl
--  if test -n "$XML2_CONFIG"; then
--    for pgac_option in `$XML2_CONFIG --cflags`; do
--      case $pgac_option in
--        -I*|-D*) CPPFLAGS="$CPPFLAGS $pgac_option";;
--      esac
--    done
--    for pgac_option in `$XML2_CONFIG --libs`; do
--      case $pgac_option in
--        -L*) LDFLAGS="$LDFLAGS $pgac_option";;
--      esac
--    done
--  fi
-+    CPPFLAGS="$CPPFLAGS `pkg-config --short-errors --print-errors --cflags "libxml-2.0" 2>&1`"
-+    LIBS="`pkg-config --short-errors --print-errors --libs "libxml-2.0" 2>&1` $LIBS"
- fi
- 
- AC_SUBST(with_libxml)
--- 
-2.7.4
-
diff --git a/meta-oe/recipes-dbs/postgresql/postgresql.inc b/meta-oe/recipes-dbs/postgresql/postgresql.inc
index d35711c1e5..5b20098a72 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql.inc
+++ b/meta-oe/recipes-dbs/postgresql/postgresql.inc
@@ -29,7 +29,6 @@ SRC_URI = "http://ftp.postgresql.org/pub/source/v${PV}/${BP}.tar.bz2 \
     file://postgresql.pam \
     file://postgresql-setup \
     file://postgresql.service \
-    file://0001-Use-pkg-config-for-libxml2-detection.patch \
 "
 
 LEAD_SONAME = "libpq.so"
diff --git a/meta-oe/recipes-dbs/postgresql/postgresql_12.2.bb b/meta-oe/recipes-dbs/postgresql/postgresql_12.3.bb
similarity index 63%
rename from meta-oe/recipes-dbs/postgresql/postgresql_12.2.bb
rename to meta-oe/recipes-dbs/postgresql/postgresql_12.3.bb
index 0613e50c72..cc7e3ff52b 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql_12.2.bb
+++ b/meta-oe/recipes-dbs/postgresql/postgresql_12.3.bb
@@ -8,5 +8,5 @@ SRC_URI += "\
    file://0001-Improve-reproducibility.patch \
 "
 
-SRC_URI[md5sum] = "a88ceea8ecf2741307f663e4539b58b7"
-SRC_URI[sha256sum] = "ad1dcc4c4fc500786b745635a9e1eba950195ce20b8913f50345bb7d5369b5de"
+SRC_URI[md5sum] = "a30c023dd7088e44d73be71af2ef404a"
+SRC_URI[sha256sum] = "94ed64a6179048190695c86ec707cc25d016056ce10fc9d229267d9a8f1dcf41"
-- 
2.17.1

