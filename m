Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A078C982E1
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 06:49:48 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43710.1789973383488403344
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Sep 2026 23:49:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=jFn9D0MJ;
 spf=pass (domain: konsulko.com, ip: 209.85.128.49, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49e73e541d7so3088985e9.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 20 Sep 2026 23:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1789973382; x=1790578182; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eMUNFgDxz/LzmsM6+ULXcfkxXq9A94WtGBdsRLFQeGo=;
        b=jFn9D0MJsd84xvI7C9QyvcTyvY+DCSYI6rR+icgAr5UvjHYBOihzTNXcSjjz/DsPB6
         ErJ2/sw+gC2xXVt0nGuIe1oIRsNNpezR8iK449B/USb9dP2CaPeXY7CvYLsX8IW0iE03
         U75F4vmhFisxlYhUug9KP9QiX2Wr0FhYbnhV0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789973382; x=1790578182;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eMUNFgDxz/LzmsM6+ULXcfkxXq9A94WtGBdsRLFQeGo=;
        b=tWrnEQ1fMcCIw6a5n4tAXzLdqy1EuzfAYfoUa/ckjko1aMc1ldTj5Zdb/t80g8ZZrl
         p8e+hXzInvy2xo62PqEnL7ioLct+R24Lu/U/VprOi93n9tS2vRkEUOboCjJ2cWP8Ky20
         vNdNyPJ7d62KetgBYzXWOlkwqFkTwvJgtfJgWvovDvVojd/ARAprfFQn85fLJMp34j6I
         M1Y8kT+Ma9jgHJZIWKu1ymgCyM4Q/eUivV2jagrPFruJd8tvhPxtr8xTR8zwx8mxEaEE
         7j3G4iT0oj21TMIDXxHK/6G/htPWRFd+BvmSiz4AvMjbWyxRdRRa1TyUqvI52YVdAlnU
         uFgQ==
X-Gm-Message-State: AFuF++n0yYAXxnchVY6IecsO004zONKBfnqZ/1ihhh9jvAWtmUaWnpRh
	zjg9Ei2mBbvennTK65G7n6dT+7RBjurtD0bMmWZG3/YCLPj2OITvXxLuGuTu1M9NrHDd1u7uw0V
	aGf96
X-Gm-Gg: AYBFou010hRk+TMjl2W/GeIqP1+8WDm/jEkCXnEsbw9p0YWxWLafDwvbijieMiUrllI
	5V9xHpYvC7dvllgtiyxLfrev0f9RvfN66pY2LQ3aVBa3SVoG0h2LyknPGkp65ljUEArRHTpPivn
	Xva+2StyWuCIHxwZ6/n2PSYSSD1yxe+ajtLTmvb3jitnhfd6AoHuX94Ah784hYXVFqKQXo+Bej+
	0kc44xJLt3VL/sxU4vbMwEAK9UEVr1zR4SzPHiKKyCyJI3Rb2PI8nC4O9zG12dGy1cs/1iYFojL
	zVpJRwOFOuC8MvHSfXKHDokRbK4MoRsHnGwotqFk+ud52DhO+70j09Tqt7DQhsvfF9RQXwtcxDj
	xiIqMDrnkSVuZkOKSQ2OH1c5qTkamrfYpbLJS9YNUaQpESR26eqXILouLHgjwp0gsP7fY65cqPg
	G9gyEN6jSH48lpYIjhhjkng1j3RhxC8MKCFW7qRixy7ooK5IhLlUcQKH9fWfPx84LH7p9KJW6ov
	JZC8dQDGu6PMzgNaXO3YJ6QpeZN9w0c2JsT6vmJpIhcyoaBnD1Q5fvVKxTArlqaL/IAUMDCMm0G
	QXgb0UqOvEk/7QNGRWC+4ie8
X-Received: by 2002:a05:600c:c043:b0:49d:265e:eda6 with SMTP id 5b1f17b1804b1-49fbd1b1490mr170223365e9.2.1789973381474;
        Sun, 20 Sep 2026 23:49:41 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48724460964sm21692237f8f.7.2026.09.20.23.49.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 23:49:41 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-oe][PATCHv2] postgresql: Upgrade 18.4 -> 18.6
Date: Mon, 21 Sep 2026 09:49:38 +0300
Message-ID: <20260921064938.2202018-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Sep 2026 06:49:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130129

Upgrade to release 18.6. It does not require a dump/restore when
upgrading from another 18.x release. However, it brings numerous
security fixes and the first three security entries below describe
configuration adjustments and data cleanups that you may need to
make after updating:

- Restrict logical decoding output plugins to the set specified by
  a new server parameter output_plugin_libraries (Jacob Champion)
  The PostgreSQL Project thanks Shishir Sharma for reporting
  this problem. (CVE-2026-14663)

- Fix psql to skip in-line data following a scripted COPY ... FROM
  STDIN command, even if the COPY fails before sending
  PGRES_COPY_IN (Tom Lane)
  The PostgreSQL Project thanks Alexander Lakhin for
  reporting this problem. (CVE-2026-6464)

- Cross-check the output row type of a portal running EXECUTE or
  FETCH (Robert Haas)
  The PostgreSQL Project thanks Ben Morris (in collaboration with
  Claude and Anthropic Research) and Peter Geoghegan for reporting
  this problem. (CVE-2026-16239)

- Fix buffer overrun in regexp match/split functions (Masahiko
  Sawada)
  The PostgreSQL Project thanks Francesco Verardi for reporting
  this problem. (CVE-2026-14664)

- Fix various places that mistakenly assumed they would not have
  to deal with more than FUNC_MAX_ARGS function arguments
  (Tom Lane)
  The PostgreSQL Project thanks Zheng Yu, ylwangtju, and Masahiko
  Sawada for reporting these problems. (CVE-2026-14679)

For more details and the full changelog have a look at:
https://www.postgresql.org/docs/release/18.6/

Note: 18.5 was never released, due to a regression discovered
post-wrap.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../files/0001-Add-support-for-RISC-V.patch     | 14 ++++++--------
 .../files/0001-tcl.m4-Recognize-tclsh9.patch    |  3 ++-
 .../files/0002-Improve-reproducibility.patch    |  5 +++--
 ....ac-bypass-autoconf-2.69-version-check.patch |  9 ++++-----
 ...04-config_info.c-not-expose-build-info.patch |  9 +++++----
 ...stgresql-fix-ptest-failure-of-sysviews.patch | 17 +++++++++--------
 .../postgresql/files/not-check-libperl.patch    |  7 ++++---
 .../{postgresql_18.4.bb => postgresql_18.6.bb}  |  2 +-
 8 files changed, 34 insertions(+), 32 deletions(-)
 rename meta-oe/recipes-dbs/postgresql/{postgresql_18.4.bb => postgresql_18.6.bb} (87%)

diff --git a/meta-oe/recipes-dbs/postgresql/files/0001-Add-support-for-RISC-V.patch b/meta-oe/recipes-dbs/postgresql/files/0001-Add-support-for-RISC-V.patch
index ebd3e03685..8ab8f0970b 100644
--- a/meta-oe/recipes-dbs/postgresql/files/0001-Add-support-for-RISC-V.patch
+++ b/meta-oe/recipes-dbs/postgresql/files/0001-Add-support-for-RISC-V.patch
@@ -1,21 +1,22 @@
-From ba079b8d6a50796db41bb0ddf4c22bfe022ef898 Mon Sep 17 00:00:00 2001
+From b61d11e4cd29671b88f43d114c69306639135e2f Mon Sep 17 00:00:00 2001
 From: "Richard W.M. Jones" <rjones@redhat.com>
 Date: Sun, 20 Nov 2016 15:04:52 +0000
-Subject: [PATCH 1/5] Add support for RISC-V.
+Subject: [PATCH] Add support for RISC-V.
 
 The architecture is sufficiently similar to aarch64 that simply
 extending the existing aarch64 macro works.
 
 Upstream-Status: Pending
+Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
 ---
  src/include/storage/s_lock.h | 5 +++--
  1 file changed, 3 insertions(+), 2 deletions(-)
 
 diff --git a/src/include/storage/s_lock.h b/src/include/storage/s_lock.h
-index c9fa84c..9b491e8 100644
+index 2f73f9f..04b0f8a 100644
 --- a/src/include/storage/s_lock.h
 +++ b/src/include/storage/s_lock.h
-@@ -252,11 +252,12 @@ spin_delay(void)
+@@ -243,11 +243,12 @@ spin_delay(void)
  
  /*
   * On ARM and ARM64, we use __sync_lock_test_and_set(int *, int) if available.
@@ -29,7 +30,7 @@ index c9fa84c..9b491e8 100644
  #ifdef HAVE_GCC__SYNC_INT32_TAS
  #define HAS_TEST_AND_SET
  
-@@ -290,7 +291,7 @@ spin_delay(void)
+@@ -287,7 +288,7 @@ spin_delay(void)
  
  #endif	 /* __aarch64__ */
  #endif	 /* HAVE_GCC__SYNC_INT32_TAS */
@@ -38,6 +39,3 @@ index c9fa84c..9b491e8 100644
  
  
  /* S/390 and S/390x Linux (32- and 64-bit zSeries) */
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-dbs/postgresql/files/0001-tcl.m4-Recognize-tclsh9.patch b/meta-oe/recipes-dbs/postgresql/files/0001-tcl.m4-Recognize-tclsh9.patch
index 445a6d4910..91d5c74fe9 100644
--- a/meta-oe/recipes-dbs/postgresql/files/0001-tcl.m4-Recognize-tclsh9.patch
+++ b/meta-oe/recipes-dbs/postgresql/files/0001-tcl.m4-Recognize-tclsh9.patch
@@ -1,4 +1,4 @@
-From ab23817b4f4a02de21f63800adc30d6236c15c8b Mon Sep 17 00:00:00 2001
+From 015a37e2e0bbf4e404e921e804ac5a5ca4343180 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 3 Nov 2024 15:50:50 -0800
 Subject: [PATCH] tcl.m4: Recognize tclsh9
@@ -7,6 +7,7 @@ Add missing support to recognize tclsh9 as supported
 
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
 ---
  config/tcl.m4 | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
diff --git a/meta-oe/recipes-dbs/postgresql/files/0002-Improve-reproducibility.patch b/meta-oe/recipes-dbs/postgresql/files/0002-Improve-reproducibility.patch
index e0605347e3..1fa3594b26 100644
--- a/meta-oe/recipes-dbs/postgresql/files/0002-Improve-reproducibility.patch
+++ b/meta-oe/recipes-dbs/postgresql/files/0002-Improve-reproducibility.patch
@@ -1,4 +1,4 @@
-From 736c190e0c8a1c5ce3dc84292d066292e969d81e Mon Sep 17 00:00:00 2001
+From b01a1303d4be1ef5fbfc355752146ce275f869a5 Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Mon, 28 Dec 2020 16:38:21 +0800
 Subject: [PATCH] Improve reproducibility,
@@ -18,12 +18,13 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 
 update patch for v13.1
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
+Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
 ---
  src/common/Makefile | 3 ---
  1 file changed, 3 deletions(-)
 
 diff --git a/src/common/Makefile b/src/common/Makefile
-index 3d83299..e14cda6 100644
+index 2c720ca..c3d889c 100644
 --- a/src/common/Makefile
 +++ b/src/common/Makefile
 @@ -31,9 +31,6 @@ include $(top_builddir)/src/Makefile.global
diff --git a/meta-oe/recipes-dbs/postgresql/files/0003-configure.ac-bypass-autoconf-2.69-version-check.patch b/meta-oe/recipes-dbs/postgresql/files/0003-configure.ac-bypass-autoconf-2.69-version-check.patch
index 8d1263432e..a874db39ff 100644
--- a/meta-oe/recipes-dbs/postgresql/files/0003-configure.ac-bypass-autoconf-2.69-version-check.patch
+++ b/meta-oe/recipes-dbs/postgresql/files/0003-configure.ac-bypass-autoconf-2.69-version-check.patch
@@ -1,4 +1,4 @@
-From 29289c6f5b665ed9943bb7701a542fcdf64c4a22 Mon Sep 17 00:00:00 2001
+From 1709916e66485e9220526fbbefcdd5dd45acaed6 Mon Sep 17 00:00:00 2001
 From: Yi Fan Yu <yifan.yu@windriver.com>
 Date: Fri, 5 Feb 2021 17:15:42 -0500
 Subject: [PATCH] configure.ac: bypass autoconf 2.69 version check
@@ -8,17 +8,18 @@ for upgrade to autoconf 2.71
 Upstream-Status: Inappropriate [disable feature]
 
 Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
+Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
 ---
  configure.ac | 4 ----
  1 file changed, 4 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 636ba54..14dc382 100644
+index 3081ad7..3a0fc92 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -19,10 +19,6 @@ m4_pattern_forbid(^PGAC_)dnl to catch undefined macros
  
- AC_INIT([PostgreSQL], [18.4], [pgsql-bugs@lists.postgresql.org], [], [https://www.postgresql.org/])
+ AC_INIT([PostgreSQL], [18.6], [pgsql-bugs@lists.postgresql.org], [], [https://www.postgresql.org/])
  
 -m4_if(m4_defn([m4_PACKAGE_VERSION]), [2.69], [], [m4_fatal([Autoconf version 2.69 is required.
 -Untested combinations of 'autoconf' and PostgreSQL versions are not
@@ -27,5 +28,3 @@ index 636ba54..14dc382 100644
  AC_COPYRIGHT([Copyright (c) 1996-2025, PostgreSQL Global Development Group])
  AC_CONFIG_SRCDIR([src/backend/access/common/heaptuple.c])
  AC_CONFIG_AUX_DIR(config)
--- 
-2.25.1
diff --git a/meta-oe/recipes-dbs/postgresql/files/0004-config_info.c-not-expose-build-info.patch b/meta-oe/recipes-dbs/postgresql/files/0004-config_info.c-not-expose-build-info.patch
index 1514c223c1..25a9bff52c 100644
--- a/meta-oe/recipes-dbs/postgresql/files/0004-config_info.c-not-expose-build-info.patch
+++ b/meta-oe/recipes-dbs/postgresql/files/0004-config_info.c-not-expose-build-info.patch
@@ -1,4 +1,4 @@
-From e4b32033827ed73c95e6e6aa26dd45e828ffc18b Mon Sep 17 00:00:00 2001
+From 108ab3c18b41883867fbdfa589687db3ef7397d6 Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
 Date: Mon, 1 Aug 2022 15:44:38 +0800
 Subject: [PATCH] config_info.c: not expose build info
@@ -8,16 +8,17 @@ Don't collect the build information to fix the buildpaths issue.
 Upstream-Status: Inappropriate [oe specific]
 
 Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
 ---
  configure.ac             |  2 +-
  src/common/config_info.c | 70 +---------------------------------------
  2 files changed, 2 insertions(+), 70 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 646394c..f5a5590 100644
+index 3a0fc92..88b8f1c 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -23,7 +23,7 @@ AC_COPYRIGHT([Copyright (c) 1996-2024, PostgreSQL Global Development Group])
+@@ -23,7 +23,7 @@ AC_COPYRIGHT([Copyright (c) 1996-2025, PostgreSQL Global Development Group])
  AC_CONFIG_SRCDIR([src/backend/access/common/heaptuple.c])
  AC_CONFIG_AUX_DIR(config)
  AC_PREFIX_DEFAULT(/usr/local/pgsql)
@@ -27,7 +28,7 @@ index 646394c..f5a5590 100644
  [PG_MAJORVERSION=`expr "$PACKAGE_VERSION" : '\([0-9][0-9]*\)'`]
  [PG_MINORVERSION=`expr "$PACKAGE_VERSION" : '.*\.\([0-9][0-9]*\)'`]
 diff --git a/src/common/config_info.c b/src/common/config_info.c
-index 89c1ccb..a2206de 100644
+index 113a8a6..b8f21c8 100644
 --- a/src/common/config_info.c
 +++ b/src/common/config_info.c
 @@ -38,7 +38,7 @@ get_configdata(const char *my_exec_path, size_t *configdata_len)
diff --git a/meta-oe/recipes-dbs/postgresql/files/0005-postgresql-fix-ptest-failure-of-sysviews.patch b/meta-oe/recipes-dbs/postgresql/files/0005-postgresql-fix-ptest-failure-of-sysviews.patch
index 7aab99e32e..4e9b1a27c2 100644
--- a/meta-oe/recipes-dbs/postgresql/files/0005-postgresql-fix-ptest-failure-of-sysviews.patch
+++ b/meta-oe/recipes-dbs/postgresql/files/0005-postgresql-fix-ptest-failure-of-sysviews.patch
@@ -1,4 +1,4 @@
-From 220b65291734b81a3c232877cf5fced20fe773e3 Mon Sep 17 00:00:00 2001
+From 89302f7b17f70504ca3613c08307ea16a722b388 Mon Sep 17 00:00:00 2001
 From: Manoj Saun <manojsingh.saun@windriver.com>
 Date: Wed, 22 Mar 2023 08:07:26 +0000
 Subject: [PATCH] postgresql: fix ptest failure of sysviews
@@ -15,17 +15,19 @@ Rebased on 18.4: context shifted (offset only, same single-line change).
 Upstream-Status: Inappropriate [oe specific]
 
 Signed-off-by: Manoj Saun <manojsingh.saun@windriver.com>
+Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
 ---
  src/test/regress/expected/sysviews.out | 2 +-
  src/test/regress/sql/sysviews.sql      | 2 +-
  2 files changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/src/test/regress/expected/sysviews.out b/src/test/regress/expected/sysviews.out
+index 83228cf..c378012 100644
 --- a/src/test/regress/expected/sysviews.out
 +++ b/src/test/regress/expected/sysviews.out
-@@ -66,7 +66,7 @@
+@@ -66,7 +66,7 @@ and c1.path[c2.level] = c2.path[c2.level];
  (1 row)
-
+ 
  -- At introduction, pg_config had 23 entries; it may grow
 -select count(*) > 20 as ok from pg_config;
 +select count(*) > 13 as ok from pg_config;
@@ -33,16 +35,15 @@ diff --git a/src/test/regress/expected/sysviews.out b/src/test/regress/expected/
  ----
   t
 diff --git a/src/test/regress/sql/sysviews.sql b/src/test/regress/sql/sysviews.sql
+index 66179f0..0f15661 100644
 --- a/src/test/regress/sql/sysviews.sql
 +++ b/src/test/regress/sql/sysviews.sql
-@@ -43,7 +43,7 @@
+@@ -43,7 +43,7 @@ where c2.name = 'CacheMemoryContext'
  and c1.path[c2.level] = c2.path[c2.level];
-
+ 
  -- At introduction, pg_config had 23 entries; it may grow
 -select count(*) > 20 as ok from pg_config;
 +select count(*) > 13 as ok from pg_config;
-
+ 
  -- We expect no cursors in this test; see also portals.sql
  select count(*) = 0 as ok from pg_cursors;
---
-2.43.0
diff --git a/meta-oe/recipes-dbs/postgresql/files/not-check-libperl.patch b/meta-oe/recipes-dbs/postgresql/files/not-check-libperl.patch
index 1142ff4878..0a1406bc8d 100644
--- a/meta-oe/recipes-dbs/postgresql/files/not-check-libperl.patch
+++ b/meta-oe/recipes-dbs/postgresql/files/not-check-libperl.patch
@@ -1,4 +1,4 @@
-From 29e76cad362c7154920aa49aa0137e1773c4d3ec Mon Sep 17 00:00:00 2001
+From d7c047b2b1f6080b1012ffd765d778e9fe638157 Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Tue, 27 Nov 2018 13:25:15 +0800
 Subject: [PATCH] not check libperl under cross compiling
@@ -15,15 +15,16 @@ Signed-off-by: Roy Li <rongqing.li@windriver.com>
 
 update patch to version 11.1
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
+Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
 ---
  configure.ac | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index ce0966f..856b091 100644
+index 527437e..3081ad7 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2340,7 +2340,7 @@ Use --without-tcl to disable building PL/Tcl.])
+@@ -2354,7 +2354,7 @@ Use --without-tcl to disable building PL/Tcl.])
  fi
  
  # check for <perl.h>
diff --git a/meta-oe/recipes-dbs/postgresql/postgresql_18.4.bb b/meta-oe/recipes-dbs/postgresql/postgresql_18.6.bb
similarity index 87%
rename from meta-oe/recipes-dbs/postgresql/postgresql_18.4.bb
rename to meta-oe/recipes-dbs/postgresql/postgresql_18.6.bb
index 6bd09b7c1c..278d42ce3d 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql_18.4.bb
+++ b/meta-oe/recipes-dbs/postgresql/postgresql_18.6.bb
@@ -12,6 +12,6 @@ SRC_URI += "\
    file://0001-tcl.m4-Recognize-tclsh9.patch \
    "
 
-SRC_URI[sha256sum] = "81a81ec695fb0c7901407defaa1d2f7973617154cf27ba74e3a7ab8e64436094"
+SRC_URI[sha256sum] = "555610c24d53e4316da5b7d3fc25c279d96856d5e0e23ee308c328c5fa881d9f"
 
 CVE_STATUS[CVE-2017-8806] = "not-applicable-config: Doesn't apply to our configuration of postgresql so we can safely ignore it."
-- 
2.47.3


