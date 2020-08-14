Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
 by mx.groups.io with SMTP id smtpd.web10.12562.1597383420872286336
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2020 22:37:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ibiZ3eBf;
 spf=pass (domain: gmail.com, ip: 209.85.210.194, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f194.google.com with SMTP id y206so4000135pfb.10
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2020 22:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9PFDNGPWNgsywDlonJaqDWxwYlr3cGv4ruvXmux4TJo=;
        b=ibiZ3eBfBuxxx4rU/lpGZEX+MG90M34/DCohnrFuBrCsf+YEw9HDEhZICKTM543h0o
         KKKxPnoSW9e3eCoHcqtJ/3DM57plio+Y+B349QTYGs7HJYBC6ydknSBkthH9gnR8Y81r
         yp0NnR5HBA4MHbvaRshyPXEciGI0GuWsT0thhRanE+Dmtu2Ba/g3xqUSYxCK0llvqB27
         U4wNGCzGTY0A17C7l7/rLXhk7vVrUF1gEmWgB/p9y6uKDlG6lUbdmrbz1b1G/o95Omo/
         NF5tTNcv8Dr4kQXWfTDe0aFjRV05mg97mvgkVJeJ51JMGR/OiwiB/Y8nTjYTsiEZmTvm
         jghg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9PFDNGPWNgsywDlonJaqDWxwYlr3cGv4ruvXmux4TJo=;
        b=WgUpmQgRRF9+PN9eqXTul8po0SFdSNDGzBxC4OXWh5/QCwpTRLU7KIBCLWeFlgb9GB
         rbS87ZJJwHJF4N//rUChtGD9SCn3r9tQeSd53UDYnQnYY5Hb4U36f+HfEctk9IJm3cbq
         EiloQ10niyiP8risg7lg1HJbONTNQqQYp/hXs/UYUDIHlYyWdFpXu9qZ8glLQL4ItV7M
         BaUw/+C5HK+eMamFCEufeEdeETSj4VZl+AGKeMCxQJzdxKTJ7CxgKw7sBJGxbXYVE38y
         VJ6O+KF4oWDUUE2U59LY5/XdMzt2txTgZc4yPQdett2h8lAWrw3wt0wD0yhJSmkfkA4R
         A6Xw==
X-Gm-Message-State: AOAM532bwd4QPKzaHFEcpsV07oJAFHtWIx+XZt2PFL6r01r+T43d3bqX
	EdeL3CmSj0aSQjNLdQY76UFslXmR68G1FQ==
X-Google-Smtp-Source: ABdhPJwETQvts1Eo5oUotHnCIbuJPqjz6oVDuOB97qTQQ4T6JjMIVDdXG98PcUfggANSkE9G+NyppA==
X-Received: by 2002:aa7:9569:: with SMTP id x9mr693390pfq.16.1597383419782;
        Thu, 13 Aug 2020 22:36:59 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e60c])
        by smtp.gmail.com with ESMTPSA id k21sm7013974pgl.0.2020.08.13.22.36.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2020 22:36:59 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 01/21] sharutils: Fix build with -fno-common
Date: Thu, 13 Aug 2020 22:36:37 -0700
Message-Id: <20200814053657.1701247-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

GCC 10 defaults to -fno-common that results into errors on multiple
global variable definitions

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Fix-building-with-GCC-10.patch       | 98 +++++++++++++++++++
 ...ot-include-lib-md5.c-into-src-shar.c.patch | 40 ++++++++
 .../sharutils/sharutils_4.15.2.bb             |  2 +
 3 files changed, 140 insertions(+)
 create mode 100644 meta-oe/recipes-support/sharutils/sharutils/0001-Fix-building-with-GCC-10.patch
 create mode 100644 meta-oe/recipes-support/sharutils/sharutils/0002-Do-not-include-lib-md5.c-into-src-shar.c.patch

diff --git a/meta-oe/recipes-support/sharutils/sharutils/0001-Fix-building-with-GCC-10.patch b/meta-oe/recipes-support/sharutils/sharutils/0001-Fix-building-with-GCC-10.patch
new file mode 100644
index 0000000000..9e2ebe7564
--- /dev/null
+++ b/meta-oe/recipes-support/sharutils/sharutils/0001-Fix-building-with-GCC-10.patch
@@ -0,0 +1,98 @@
+From b7dd97708b9d0ed09d8d7ac435f8b25eadbf6487 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Petr=20P=C3=83=C2=ADsa=C3=85=E2=84=A2?= <address@hidden>
+Date: Thu, 13 Aug 2020 11:20:38 -0700
+Subject: [PATCH 1/2] Fix building with GCC 10
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+GCC 10 defaults to -fno-common that results into errors on multiple
+global variable definitions:
+
+/usr/lib64/gcc/x86_64-suse-linux/9/../../../../x86_64-suse-linux/bin/ld:
+shar-opts.o:(.data.rel.ro.local+0x0): multiple definition of
+`program_name'; shar.o:(.rodata+0x10): first defined here
+
+This patch fixes it by changing the definitions in header files into extern
+declarations.
+
+<https://lists.gnu.org/archive/html/bug-gnu-utils/2020-01/msg00001.html>
+
+Signed-off-by: Petr PÃ­saÅ™ <address@hidden>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/shar-opts.h     | 2 +-
+ src/shar-std.def    | 2 +-
+ src/unshar-opts.h   | 2 +-
+ src/uudecode-opts.h | 2 +-
+ src/uuencode-opts.h | 2 +-
+ 5 files changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/src/shar-opts.h b/src/shar-opts.h
+index 172676f..f6e4e79 100644
+--- a/src/shar-opts.h
++++ b/src/shar-opts.h
+@@ -352,7 +352,7 @@ extern "C" {
+  *  global exported definitions
+  */
+ #include "local.h"
+-char const * const program_name;
++extern char const * const program_name;
+ 
+ extern bool initialization_done;
+ extern int optidx;
+diff --git a/src/shar-std.def b/src/shar-std.def
+index ed06b77..a28f61c 100644
+--- a/src/shar-std.def
++++ b/src/shar-std.def
+@@ -41,7 +41,7 @@ no-misuse-usage;
+ usage-message;
+ die-code;
+ 
+-export  = '#include "local.h"'"\nchar const * const program_name;";
++export  = '#include "local.h"'"\nextern char const * const program_name;";
+ 
+ #shell
+ echo "include = 'char const * const program_name = \"${progname}\";';"
+diff --git a/src/unshar-opts.h b/src/unshar-opts.h
+index 568ffca..aa85833 100644
+--- a/src/unshar-opts.h
++++ b/src/unshar-opts.h
+@@ -192,7 +192,7 @@ extern "C" {
+ extern size_t       separator_str_len;
+ 
+ #include "local.h"
+-char const * const program_name;
++extern char const * const program_name;
+ 
+ 
+ /* * * * * *
+diff --git a/src/uudecode-opts.h b/src/uudecode-opts.h
+index 5b74419..289a366 100644
+--- a/src/uudecode-opts.h
++++ b/src/uudecode-opts.h
+@@ -170,7 +170,7 @@ extern "C" {
+  *  global exported definitions
+  */
+ #include "local.h"
+-char const * const program_name;
++extern char const * const program_name;
+ 
+ 
+ /* * * * * *
+diff --git a/src/uuencode-opts.h b/src/uuencode-opts.h
+index 1a5b7bc..f2df0a8 100644
+--- a/src/uuencode-opts.h
++++ b/src/uuencode-opts.h
+@@ -166,7 +166,7 @@ extern "C" {
+  *  global exported definitions
+  */
+ #include "local.h"
+-char const * const program_name;
++extern char const * const program_name;
+ 
+ 
+ /* * * * * *
+-- 
+2.28.0
+
diff --git a/meta-oe/recipes-support/sharutils/sharutils/0002-Do-not-include-lib-md5.c-into-src-shar.c.patch b/meta-oe/recipes-support/sharutils/sharutils/0002-Do-not-include-lib-md5.c-into-src-shar.c.patch
new file mode 100644
index 0000000000..d4a8d6fbae
--- /dev/null
+++ b/meta-oe/recipes-support/sharutils/sharutils/0002-Do-not-include-lib-md5.c-into-src-shar.c.patch
@@ -0,0 +1,40 @@
+From ab981e1a973e83edb6ea19e6e84102f43ded0dcb Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 13 Aug 2020 11:22:40 -0700
+Subject: [PATCH 2/2] Do not include lib/md5.c into src/shar.c
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+ib/md5.o is part of libgnu.a that is linked to shar. There is no
+point in linking md5.o twice into shar executable. Moreover SuSE
+reports that this triggers a linking error with GCC 10:
+
+/usr/lib64/gcc/x86_64-suse-linux/9/../../../../x86_64-suse-linux/bin/ld:
+../lib/libgnu.a(md5.o): in function `md5_stream':
+[   30s] md5.c:(.text+0x15d): multiple definition of `md5_stream';
+shar.o:shar.c:(.text+0x28): first defined here
+
+<https://lists.gnu.org/archive/html/bug-gnu-utils/2020-01/msg00001.html>
+
+Signed-off-by: Petr PÃ­saÅ™ <address@hidden>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/shar.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/src/shar.c b/src/shar.c
+index 11cbada..6d7ed1d 100644
+--- a/src/shar.c
++++ b/src/shar.c
+@@ -53,7 +53,6 @@ static const char cright_years_z[] =
+ 
+ #include "inttostr.h"
+ #include "liballoca.h"
+-#include "md5.c"
+ #include "md5.h"
+ #include "quotearg.h"
+ #include "xalloc.h"
+-- 
+2.28.0
+
diff --git a/meta-oe/recipes-support/sharutils/sharutils_4.15.2.bb b/meta-oe/recipes-support/sharutils/sharutils_4.15.2.bb
index 930922ed48..48eb268939 100644
--- a/meta-oe/recipes-support/sharutils/sharutils_4.15.2.bb
+++ b/meta-oe/recipes-support/sharutils/sharutils_4.15.2.bb
@@ -10,6 +10,8 @@ SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.gz \
            file://0001-Fix-build-with-clang.patch \
            file://CVE-2018-1000097.patch \
            file://0001-Fix-build-with-recent-gettext.patch \
+           file://0001-Fix-building-with-GCC-10.patch \
+           file://0002-Do-not-include-lib-md5.c-into-src-shar.c.patch \
            "
 SRC_URI[md5sum] = "32a51b23e25ad5e6af4b89f228be1800"
 SRC_URI[sha256sum] = "ee336e68549664e7a19b117adf02edfdeac6307f22e5ba78baca457116914637"
-- 
2.28.0

