Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D641E9A03E
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 10:20:30 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9068.1771410027960352944
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Feb 2026 02:20:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LnhRcgud;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-81df6a302b1so5122849b3a.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 18 Feb 2026 02:20:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771410027; x=1772014827; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wlKfGSpkrC5ltCa7EW8fQSZl/BMFxSMBeNftNk4JhQM=;
        b=LnhRcgud4khauep5aJOrKSTS8a5Gudk6qv5bA6PJry9gOGVGZqJqk6ngNJG4VmMcez
         BSkFZkVEprKbw8nln8PdMhDE4wgmFaYxQMKSDKsrT6z4V2IoMNejYvh8KKpCKI7CzQgi
         lQkXGe7DLOV56Y6hBjeBa9UJdxT5aqc4IsPjRi5Av6AE49NKwvq3qlwfvBV3ycjLm+ip
         X81biZojvfX6XLS1+uRoLe/FFhGRYDhZ5KlnghOMAItVDemjiDFNCaQn1lKRuVAtV3bH
         mohhlpwUYqTybJDgZ91xTKuEq0LN+1n8zJ3mlhVf4n9NSMJzrVWjgTTR6E3+u9kIltpG
         XDRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771410027; x=1772014827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wlKfGSpkrC5ltCa7EW8fQSZl/BMFxSMBeNftNk4JhQM=;
        b=wYanTth/+zE8/MXl0Cx46qSD5MBfcW0OIMDCfuewE89+Z7I/B1ShUF5WSCgLvfminJ
         oa3kf2mFsblbwolMhKQot2oNJw5PbV5msz9PUeGFXSvSxAqUnprQfGZWilYogJTdBQBJ
         jhZ3hLAf5H+Ocf8GsdBVM6U/L9cBgWa6NX26C8HAjRI4iNOLXOcU7N4V39qVbpy/k5tp
         zxJ4KqSktz3uUwdDLdISsRyXLPc3G6pKQv7PeUjf17IR4dZ/5NWBftGw+3ygl3O6DYCx
         3e3QHx5O2RR+DhBAP0N/JyhOSQGwkkjgVk5/oE5/7mhJodl41HWAuHo3cMo/i2VvGWUK
         qXLA==
X-Gm-Message-State: AOJu0Yx+pcX7c2zvUl3vXtOhCjbTs0Np3ai4tsiH8NlEHvY557sSb5uw
	2Ym9GRexEyOB96cMKhNGcwUqXztJSS2+g1effPQ00ji9e6y0NyA/jVZNd5JhYg==
X-Gm-Gg: AZuq6aJOE3BHskX7Id6yG9Eb1iep+C4kEPA5C3hrKv0ijPEtf2zngf43bXcWbpAwbI1
	7lc6q6+vEPPJNzNpABF5E3BJJu07PPxmqAHmvhkizPCksW7dk3OZIgeeI7DxhPSEb08+j/3PTcQ
	Job2sE/VNK9jWxLh7BGAvXTwWAw20x5mgxkfhZLfHjAeZhRqv/+SPa+1f21lGpypcMhrEkigJZS
	516FdNFd0Qp1Djw/8hp+e4/Z8IyteZKY0f0JUDr7b83Y6D/C49GdEZdiZKtT6bT7LjZenDke9VC
	7J6zNRmftktey0/NBAzE3b4wydEEBTccu+GanI6h2enBGpJGrWC5tQbRLqYzVLNepxMVsYinOX6
	YAZ3PA+Zw/VlcBCqD+bGDuhp/y3meJNNEodwU6ZzJIyFhfZt4JOsvx1ZhDOjtXsTTfpxpc0uatX
	bmFYiVvstJO88FtlWSRWke4mLWUgmJCk84PkBHCpRpqZ5D7Q==
X-Received: by 2002:a05:6a21:4982:b0:394:a0f8:f803 with SMTP id adf61e73a8af0-394a0f8fb7fmr9659883637.49.1771410026628;
        Wed, 18 Feb 2026 02:20:26 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.33])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6e531e6dccsm11826670a12.19.2026.02.18.02.20.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 02:20:26 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 2/2] postgresql: upgrade 17.7 -> 17.8
Date: Wed, 18 Feb 2026 23:20:03 +1300
Message-ID: <20260218102003.3812885-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260218102003.3812885-1-ankur.tyagi85@gmail.com>
References: <20260218102003.3812885-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 18 Feb 2026 10:20:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124472

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

License-Update: Update license year to 2026

Refreshed patches for version 17.8

Includes fix for CVE-2026-2003, CVE-2026-2004, CVE-2026-2005, CVE-2026-2006

Release Notes:
https://www.postgresql.org/docs/release/17.8/

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../postgresql/files/0001-tcl.m4-Recognize-tclsh9.patch  | 2 +-
 .../postgresql/files/0002-Improve-reproducibility.patch  | 9 +++------
 ...configure.ac-bypass-autoconf-2.69-version-check.patch | 6 +++---
 .../files/0004-config_info.c-not-expose-build-info.patch | 4 ++--
 .../0005-postgresql-fix-ptest-failure-of-sysviews.patch  | 5 +----
 .../recipes-dbs/postgresql/files/not-check-libperl.patch | 6 +++---
 .../{postgresql_17.7.bb => postgresql_17.8.bb}           | 4 ++--
 7 files changed, 15 insertions(+), 21 deletions(-)
 rename meta-oe/recipes-dbs/postgresql/{postgresql_17.7.bb => postgresql_17.8.bb} (76%)

diff --git a/meta-oe/recipes-dbs/postgresql/files/0001-tcl.m4-Recognize-tclsh9.patch b/meta-oe/recipes-dbs/postgresql/files/0001-tcl.m4-Recognize-tclsh9.patch
index 89a509087f..445a6d4910 100644
--- a/meta-oe/recipes-dbs/postgresql/files/0001-tcl.m4-Recognize-tclsh9.patch
+++ b/meta-oe/recipes-dbs/postgresql/files/0001-tcl.m4-Recognize-tclsh9.patch
@@ -1,4 +1,4 @@
-From f0d8240dbf594e6dfab31fd7d70ce340ac365a65 Mon Sep 17 00:00:00 2001
+From ab23817b4f4a02de21f63800adc30d6236c15c8b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 3 Nov 2024 15:50:50 -0800
 Subject: [PATCH] tcl.m4: Recognize tclsh9
diff --git a/meta-oe/recipes-dbs/postgresql/files/0002-Improve-reproducibility.patch b/meta-oe/recipes-dbs/postgresql/files/0002-Improve-reproducibility.patch
index b3e87cbc46..e0605347e3 100644
--- a/meta-oe/recipes-dbs/postgresql/files/0002-Improve-reproducibility.patch
+++ b/meta-oe/recipes-dbs/postgresql/files/0002-Improve-reproducibility.patch
@@ -1,7 +1,7 @@
-From 084cc44215c1d5e6d33bc3d2e1d24da4fc98bdcd Mon Sep 17 00:00:00 2001
+From 736c190e0c8a1c5ce3dc84292d066292e969d81e Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Mon, 28 Dec 2020 16:38:21 +0800
-Subject: [PATCH 2/5] Improve reproducibility,
+Subject: [PATCH] Improve reproducibility,
 
 Remove build patch from binaries which pg_config do
 not record var-CC, var-CFLAGS, and configure
@@ -23,7 +23,7 @@ Signed-off-by: Changqing Li <changqing.li@windriver.com>
  1 file changed, 3 deletions(-)
 
 diff --git a/src/common/Makefile b/src/common/Makefile
-index 113029b..58842a6 100644
+index 3d83299..e14cda6 100644
 --- a/src/common/Makefile
 +++ b/src/common/Makefile
 @@ -31,9 +31,6 @@ include $(top_builddir)/src/Makefile.global
@@ -36,6 +36,3 @@ index 113029b..58842a6 100644
  override CPPFLAGS += -DVAL_CFLAGS_SL="\"$(CFLAGS_SL)\""
  override CPPFLAGS += -DVAL_LDFLAGS="\"$(STD_LDFLAGS)\""
  override CPPFLAGS += -DVAL_LDFLAGS_EX="\"$(LDFLAGS_EX)\""
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-dbs/postgresql/files/0003-configure.ac-bypass-autoconf-2.69-version-check.patch b/meta-oe/recipes-dbs/postgresql/files/0003-configure.ac-bypass-autoconf-2.69-version-check.patch
index ce19bacc47..b91228aedd 100644
--- a/meta-oe/recipes-dbs/postgresql/files/0003-configure.ac-bypass-autoconf-2.69-version-check.patch
+++ b/meta-oe/recipes-dbs/postgresql/files/0003-configure.ac-bypass-autoconf-2.69-version-check.patch
@@ -1,4 +1,4 @@
-From 30b1b37d309f67ba6d58f2197bd917107bc7d56c Mon Sep 17 00:00:00 2001
+From 29289c6f5b665ed9943bb7701a542fcdf64c4a22 Mon Sep 17 00:00:00 2001
 From: Yi Fan Yu <yifan.yu@windriver.com>
 Date: Fri, 5 Feb 2021 17:15:42 -0500
 Subject: [PATCH] configure.ac: bypass autoconf 2.69 version check
@@ -13,12 +13,12 @@ Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
  1 file changed, 4 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 642dbde..af37179 100644
+index 856b091..646394c 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -19,10 +19,6 @@ m4_pattern_forbid(^PGAC_)dnl to catch undefined macros
  
- AC_INIT([PostgreSQL], [17.7], [pgsql-bugs@lists.postgresql.org], [], [https://www.postgresql.org/])
+ AC_INIT([PostgreSQL], [17.8], [pgsql-bugs@lists.postgresql.org], [], [https://www.postgresql.org/])
  
 -m4_if(m4_defn([m4_PACKAGE_VERSION]), [2.69], [], [m4_fatal([Autoconf version 2.69 is required.
 -Untested combinations of 'autoconf' and PostgreSQL versions are not
diff --git a/meta-oe/recipes-dbs/postgresql/files/0004-config_info.c-not-expose-build-info.patch b/meta-oe/recipes-dbs/postgresql/files/0004-config_info.c-not-expose-build-info.patch
index d94f028036..1514c223c1 100644
--- a/meta-oe/recipes-dbs/postgresql/files/0004-config_info.c-not-expose-build-info.patch
+++ b/meta-oe/recipes-dbs/postgresql/files/0004-config_info.c-not-expose-build-info.patch
@@ -1,4 +1,4 @@
-From 62733bdc9346651637d9e5ac7cbf8d7311ef5d97 Mon Sep 17 00:00:00 2001
+From e4b32033827ed73c95e6e6aa26dd45e828ffc18b Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
 Date: Mon, 1 Aug 2022 15:44:38 +0800
 Subject: [PATCH] config_info.c: not expose build info
@@ -14,7 +14,7 @@ Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
  2 files changed, 2 insertions(+), 70 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index f0fa973..8ccd8bc 100644
+index 646394c..f5a5590 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -23,7 +23,7 @@ AC_COPYRIGHT([Copyright (c) 1996-2024, PostgreSQL Global Development Group])
diff --git a/meta-oe/recipes-dbs/postgresql/files/0005-postgresql-fix-ptest-failure-of-sysviews.patch b/meta-oe/recipes-dbs/postgresql/files/0005-postgresql-fix-ptest-failure-of-sysviews.patch
index 8219fc80e9..753cd1bb97 100644
--- a/meta-oe/recipes-dbs/postgresql/files/0005-postgresql-fix-ptest-failure-of-sysviews.patch
+++ b/meta-oe/recipes-dbs/postgresql/files/0005-postgresql-fix-ptest-failure-of-sysviews.patch
@@ -1,4 +1,4 @@
-From d1fb37569b5a8c21968f69164e8bc6e4bb0185eb Mon Sep 17 00:00:00 2001
+From 220b65291734b81a3c232877cf5fced20fe773e3 Mon Sep 17 00:00:00 2001
 From: Manoj Saun <manojsingh.saun@windriver.com>
 Date: Wed, 22 Mar 2023 08:07:26 +0000
 Subject: [PATCH] postgresql: fix ptest failure of sysviews
@@ -44,6 +44,3 @@ index b047fb5..d1e3999 100644
  
  -- We expect no cursors in this test; see also portals.sql
  select count(*) = 0 as ok from pg_cursors;
--- 
-2.34.1
-
diff --git a/meta-oe/recipes-dbs/postgresql/files/not-check-libperl.patch b/meta-oe/recipes-dbs/postgresql/files/not-check-libperl.patch
index a2f0500a8c..1142ff4878 100644
--- a/meta-oe/recipes-dbs/postgresql/files/not-check-libperl.patch
+++ b/meta-oe/recipes-dbs/postgresql/files/not-check-libperl.patch
@@ -1,4 +1,4 @@
-From 1a9416bae71aa935797add3fa11407732ad010c0 Mon Sep 17 00:00:00 2001
+From 29e76cad362c7154920aa49aa0137e1773c4d3ec Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Tue, 27 Nov 2018 13:25:15 +0800
 Subject: [PATCH] not check libperl under cross compiling
@@ -20,10 +20,10 @@ Signed-off-by: Changqing Li <changqing.li@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index f398184..493d5cd 100644
+index ce0966f..856b091 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2336,7 +2336,7 @@ Use --without-tcl to disable building PL/Tcl.])
+@@ -2340,7 +2340,7 @@ Use --without-tcl to disable building PL/Tcl.])
  fi
  
  # check for <perl.h>
diff --git a/meta-oe/recipes-dbs/postgresql/postgresql_17.7.bb b/meta-oe/recipes-dbs/postgresql/postgresql_17.8.bb
similarity index 76%
rename from meta-oe/recipes-dbs/postgresql/postgresql_17.7.bb
rename to meta-oe/recipes-dbs/postgresql/postgresql_17.8.bb
index 81b096194c..ad1e9704cc 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql_17.7.bb
+++ b/meta-oe/recipes-dbs/postgresql/postgresql_17.8.bb
@@ -1,6 +1,6 @@
 require postgresql.inc
 
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=08b6032a749e67f6e3de84ea8e466933"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=55760ee57ce4e51e4b57f0801ff032dd"
 
 SRC_URI += "\
    file://not-check-libperl.patch \
@@ -12,6 +12,6 @@ SRC_URI += "\
    file://0001-tcl.m4-Recognize-tclsh9.patch \
 "
 
-SRC_URI[sha256sum] = "ef9e343302eccd33112f1b2f0247be493cb5768313adeb558b02de8797a2e9b5"
+SRC_URI[sha256sum] = "a88d195dd93730452d0cfa1a11896720d6d1ba084bc2be7d7fc557fa4e4158a0"
 
 CVE_STATUS[CVE-2017-8806] = "not-applicable-config: Doesn't apply to our configuration of postgresql so we can safely ignore it."

