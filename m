Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A150DC54798
	for <webhook@archiver.kernel.org>; Tue,  5 Mar 2024 06:34:52 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.16151.1709620487330414622
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Mar 2024 22:34:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=aFUM4jPO;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=37941debd1=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4254LRpZ020948
	for <openembedded-devel@lists.openembedded.org>; Mon, 4 Mar 2024 22:34:47 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=XcbKC
	2ECi9T8Bszqka+FrsXl5JzUy/2MpkxP/KNo27U=; b=aFUM4jPOMG3CIKjZDEkvo
	y/HzWBNtvgzTHyt5gZjyJrcAFgH+ISkonGlBk8Na9wJbFqfHMEmvgaJBtpUaGf8Y
	KfNZPDH1XqagW/e1wxL7jq8OpAbIUX/Lgzxnl671EGD40IiWy3HaTk7k4vtVYnEC
	10K5wO04IWAKYef8Z/RFzVjb/1cplxI10k44smc7rlUcay4AbE4LOpuDYwx2qUGI
	wNSkDxdTq2SzlVzmZLJOMhcJ3tO3TE2N8IOVxWMBCQBCn9o1cVa6s3AlJ1adf6Dp
	V/HC1WohVFzwwpqILdt8M0SEIvRNnBOTsRG9imkQRQW7E82uwdVbMAk93UcIJsix
	A==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wm4gm271e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 04 Mar 2024 22:34:46 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 4 Mar 2024 22:34:46 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Mon, 4 Mar 2024 22:34:44 -0800
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] postgresql: upgrade 15.5 -> 16.2
Date: Tue, 5 Mar 2024 14:34:43 +0800
Message-ID: <20240305063443.729868-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: Ge6KDuw-bXKLqWaNeJmeQ4Bt47e9-uVh
X-Proofpoint-GUID: Ge6KDuw-bXKLqWaNeJmeQ4Bt47e9-uVh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-05_03,2024-03-04_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 mlxlogscore=999 suspectscore=0 impostorscore=0 mlxscore=0 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403050049
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Mar 2024 06:34:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109112

From: Changqing Li <changqing.li@windriver.com>

License-Update: Update lincense year to 2024

In version 16.2, ICU support is enabled by default, add PACKAGECONFIG
icu to align with upstream, enable icu by default. And fix buildpaths
QA warning.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../files/0001-Add-support-for-RISC-V.patch   | 31 +++++++++----------
 ...tch => 0002-Improve-reproducibility.patch} |  8 ++---
 ...-bypass-autoconf-2.69-version-check.patch} | 10 +++---
 ...config_info.c-not-expose-build-info.patch} | 20 ++++++------
 ...resql-fix-ptest-failure-of-sysviews.patch} | 15 ++++++---
 meta-oe/recipes-dbs/postgresql/postgresql.inc | 13 +++++++-
 .../recipes-dbs/postgresql/postgresql_15.5.bb | 16 ----------
 .../recipes-dbs/postgresql/postgresql_16.2.bb | 16 ++++++++++
 8 files changed, 72 insertions(+), 57 deletions(-)
 rename meta-oe/recipes-dbs/postgresql/files/{0001-Improve-reproducibility.patch => 0002-Improve-reproducibility.patch} (89%)
 rename meta-oe/recipes-dbs/postgresql/files/{0001-configure.ac-bypass-autoconf-2.69-version-check.patch => 0003-configure.ac-bypass-autoconf-2.69-version-check.patch} (75%)
 rename meta-oe/recipes-dbs/postgresql/files/{0001-config_info.c-not-expose-build-info.patch => 0004-config_info.c-not-expose-build-info.patch} (83%)
 rename meta-oe/recipes-dbs/postgresql/files/{0001-postgresql-fix-ptest-failure-of-sysviews.patch => 0005-postgresql-fix-ptest-failure-of-sysviews.patch} (71%)
 delete mode 100644 meta-oe/recipes-dbs/postgresql/postgresql_15.5.bb
 create mode 100644 meta-oe/recipes-dbs/postgresql/postgresql_16.2.bb

diff --git a/meta-oe/recipes-dbs/postgresql/files/0001-Add-support-for-RISC-V.patch b/meta-oe/recipes-dbs/postgresql/files/0001-Add-support-for-RISC-V.patch
index 7a4ba9897..34d34ecad 100644
--- a/meta-oe/recipes-dbs/postgresql/files/0001-Add-support-for-RISC-V.patch
+++ b/meta-oe/recipes-dbs/postgresql/files/0001-Add-support-for-RISC-V.patch
@@ -1,21 +1,19 @@
-From 780fd27ea6f7f2c446c46a7a5e26d94106c67efd Mon Sep 17 00:00:00 2001
+From ba079b8d6a50796db41bb0ddf4c22bfe022ef898 Mon Sep 17 00:00:00 2001
 From: "Richard W.M. Jones" <rjones@redhat.com>
 Date: Sun, 20 Nov 2016 15:04:52 +0000
-Subject: [PATCH] Add support for RISC-V.
+Subject: [PATCH 1/5] Add support for RISC-V.
 
 The architecture is sufficiently similar to aarch64 that simply
 extending the existing aarch64 macro works.
 ---
-Upstream-Status: Pending
-
- src/include/storage/s_lock.h | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
+ src/include/storage/s_lock.h | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
 
 diff --git a/src/include/storage/s_lock.h b/src/include/storage/s_lock.h
-index 4d3ffc7..22e27bf 100644
+index c9fa84c..9b491e8 100644
 --- a/src/include/storage/s_lock.h
 +++ b/src/include/storage/s_lock.h
-@@ -317,11 +317,12 @@ tas(volatile slock_t *lock)
+@@ -252,11 +252,12 @@ spin_delay(void)
  
  /*
   * On ARM and ARM64, we use __sync_lock_test_and_set(int *, int) if available.
@@ -24,21 +22,20 @@ index 4d3ffc7..22e27bf 100644
   * We use the int-width variant of the builtin because it works on more chips
   * than other widths.
   */
--#if defined(__arm__) || defined(__arm) || defined(__aarch64__) || defined(__aarch64)
-+#if defined(__arm__) || defined(__arm) || defined(__aarch64__) || defined(__aarch64) || defined(__riscv)
+-#if defined(__arm__) || defined(__arm) || defined(__aarch64__)
++#if defined(__arm__) || defined(__arm) || defined(__aarch64__) || defined(__riscv)
  #ifdef HAVE_GCC__SYNC_INT32_TAS
  #define HAS_TEST_AND_SET
  
-@@ -355,8 +356,7 @@ spin_delay(void)
+@@ -290,7 +291,7 @@ spin_delay(void)
  
- #endif	 /* __aarch64__ || __aarch64 */
+ #endif	 /* __aarch64__ */
  #endif	 /* HAVE_GCC__SYNC_INT32_TAS */
--#endif	 /* __arm__ || __arm || __aarch64__ || __aarch64 */
--
-+#endif	 /* __arm__ || __arm || __aarch64__ || __aarch64 || __riscv */
+-#endif	 /* __arm__ || __arm || __aarch64__ */
++#endif	 /* __arm__ || __arm || __aarch64__ || __riscv */
+ 
  
  /* S/390 and S/390x Linux (32- and 64-bit zSeries) */
- #if defined(__s390__) || defined(__s390x__)
 -- 
-2.34.1
+2.25.1
 
diff --git a/meta-oe/recipes-dbs/postgresql/files/0001-Improve-reproducibility.patch b/meta-oe/recipes-dbs/postgresql/files/0002-Improve-reproducibility.patch
similarity index 89%
rename from meta-oe/recipes-dbs/postgresql/files/0001-Improve-reproducibility.patch
rename to meta-oe/recipes-dbs/postgresql/files/0002-Improve-reproducibility.patch
index 02f4c9e51..b3e87cbc4 100644
--- a/meta-oe/recipes-dbs/postgresql/files/0001-Improve-reproducibility.patch
+++ b/meta-oe/recipes-dbs/postgresql/files/0002-Improve-reproducibility.patch
@@ -1,7 +1,7 @@
-From bbba8a5261a99e79c9cd4693ef56021014a9856b Mon Sep 17 00:00:00 2001
+From 084cc44215c1d5e6d33bc3d2e1d24da4fc98bdcd Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Mon, 28 Dec 2020 16:38:21 +0800
-Subject: [PATCH] Improve reproducibility,
+Subject: [PATCH 2/5] Improve reproducibility,
 
 Remove build patch from binaries which pg_config do
 not record var-CC, var-CFLAGS, and configure
@@ -23,7 +23,7 @@ Signed-off-by: Changqing Li <changqing.li@windriver.com>
  1 file changed, 3 deletions(-)
 
 diff --git a/src/common/Makefile b/src/common/Makefile
-index 880722f..7a9b9d4 100644
+index 113029b..58842a6 100644
 --- a/src/common/Makefile
 +++ b/src/common/Makefile
 @@ -31,9 +31,6 @@ include $(top_builddir)/src/Makefile.global
@@ -37,5 +37,5 @@ index 880722f..7a9b9d4 100644
  override CPPFLAGS += -DVAL_LDFLAGS="\"$(STD_LDFLAGS)\""
  override CPPFLAGS += -DVAL_LDFLAGS_EX="\"$(LDFLAGS_EX)\""
 -- 
-2.34.1
+2.25.1
 
diff --git a/meta-oe/recipes-dbs/postgresql/files/0001-configure.ac-bypass-autoconf-2.69-version-check.patch b/meta-oe/recipes-dbs/postgresql/files/0003-configure.ac-bypass-autoconf-2.69-version-check.patch
similarity index 75%
rename from meta-oe/recipes-dbs/postgresql/files/0001-configure.ac-bypass-autoconf-2.69-version-check.patch
rename to meta-oe/recipes-dbs/postgresql/files/0003-configure.ac-bypass-autoconf-2.69-version-check.patch
index ab578056f..d76d1991b 100644
--- a/meta-oe/recipes-dbs/postgresql/files/0001-configure.ac-bypass-autoconf-2.69-version-check.patch
+++ b/meta-oe/recipes-dbs/postgresql/files/0003-configure.ac-bypass-autoconf-2.69-version-check.patch
@@ -1,7 +1,7 @@
-From d44c83ed0f30462a31930d6d925762b3f8412ce2 Mon Sep 17 00:00:00 2001
+From 30b1b37d309f67ba6d58f2197bd917107bc7d56c Mon Sep 17 00:00:00 2001
 From: Yi Fan Yu <yifan.yu@windriver.com>
 Date: Fri, 5 Feb 2021 17:15:42 -0500
-Subject: [PATCH] configure.ac: bypass autoconf 2.69 version check
+Subject: [PATCH 3/5] configure.ac: bypass autoconf 2.69 version check
 
 for upgrade to autoconf 2.71
 
@@ -13,18 +13,18 @@ Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
  1 file changed, 4 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index e988503..d1b2cfd 100644
+index 401ce30..27f382d 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -19,10 +19,6 @@ m4_pattern_forbid(^PGAC_)dnl to catch undefined macros
  
- AC_INIT([PostgreSQL], [15.5], [pgsql-bugs@lists.postgresql.org], [], [https://www.postgresql.org/])
+ AC_INIT([PostgreSQL], [16.2], [pgsql-bugs@lists.postgresql.org], [], [https://www.postgresql.org/])
  
 -m4_if(m4_defn([m4_PACKAGE_VERSION]), [2.69], [], [m4_fatal([Autoconf version 2.69 is required.
 -Untested combinations of 'autoconf' and PostgreSQL versions are not
 -recommended.  You can remove the check from 'configure.ac' but it is then
 -your responsibility whether the result works or not.])])
- AC_COPYRIGHT([Copyright (c) 1996-2022, PostgreSQL Global Development Group])
+ AC_COPYRIGHT([Copyright (c) 1996-2023, PostgreSQL Global Development Group])
  AC_CONFIG_SRCDIR([src/backend/access/common/heaptuple.c])
  AC_CONFIG_AUX_DIR(config)
 -- 
diff --git a/meta-oe/recipes-dbs/postgresql/files/0001-config_info.c-not-expose-build-info.patch b/meta-oe/recipes-dbs/postgresql/files/0004-config_info.c-not-expose-build-info.patch
similarity index 83%
rename from meta-oe/recipes-dbs/postgresql/files/0001-config_info.c-not-expose-build-info.patch
rename to meta-oe/recipes-dbs/postgresql/files/0004-config_info.c-not-expose-build-info.patch
index 52ca276da..ff0582ab8 100644
--- a/meta-oe/recipes-dbs/postgresql/files/0001-config_info.c-not-expose-build-info.patch
+++ b/meta-oe/recipes-dbs/postgresql/files/0004-config_info.c-not-expose-build-info.patch
@@ -1,7 +1,7 @@
-From b92eebe8b0760fee7bd55c6c22318620c2c07579 Mon Sep 17 00:00:00 2001
+From 5be3ffdf767c1efcbfd2d1be87aa83f2e37e348e Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
 Date: Mon, 1 Aug 2022 15:44:38 +0800
-Subject: [PATCH] config_info.c: not expose build info
+Subject: [PATCH 4/5] config_info.c: not expose build info
 
 Don't collect the build information to fix the buildpaths issue.
 
@@ -10,14 +10,14 @@ Upstream-Status: Inappropriate [oe specific]
 Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
 ---
  configure.ac             |  2 +-
- src/common/config_info.c | 68 ----------------------------------------
- 2 files changed, 1 insertion(+), 69 deletions(-)
+ src/common/config_info.c | 70 +---------------------------------------
+ 2 files changed, 2 insertions(+), 70 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 0eb595b..508487b 100644
+index 27f382d..3dd6bb1 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -23,7 +23,7 @@ AC_COPYRIGHT([Copyright (c) 1996-2021, PostgreSQL Global Development Group])
+@@ -23,7 +23,7 @@ AC_COPYRIGHT([Copyright (c) 1996-2023, PostgreSQL Global Development Group])
  AC_CONFIG_SRCDIR([src/backend/access/common/heaptuple.c])
  AC_CONFIG_AUX_DIR(config)
  AC_PREFIX_DEFAULT(/usr/local/pgsql)
@@ -27,19 +27,19 @@ index 0eb595b..508487b 100644
  [PG_MAJORVERSION=`expr "$PACKAGE_VERSION" : '\([0-9][0-9]*\)'`]
  [PG_MINORVERSION=`expr "$PACKAGE_VERSION" : '.*\.\([0-9][0-9]*\)'`]
 diff --git a/src/common/config_info.c b/src/common/config_info.c
-index e72e729..b482c20 100644
+index 09e78a6..86e4230 100644
 --- a/src/common/config_info.c
 +++ b/src/common/config_info.c
-@@ -38,7 +38,7 @@
+@@ -38,7 +38,7 @@ get_configdata(const char *my_exec_path, size_t *configdata_len)
  	int			i = 0;
  
  	/* Adjust this to match the number of items filled below */
 -	*configdata_len = 23;
 +	*configdata_len = 14;
- 	configdata = (ConfigData *) palloc(*configdata_len * sizeof(ConfigData));
+ 	configdata = palloc_array(ConfigData, *configdata_len);
  
  	configdata[i].name = pstrdup("BINDIR");
-@@ -123,74 +123,6 @@
+@@ -123,74 +123,6 @@ get_configdata(const char *my_exec_path, size_t *configdata_len)
  	configdata[i].setting = pstrdup(path);
  	i++;
  
diff --git a/meta-oe/recipes-dbs/postgresql/files/0001-postgresql-fix-ptest-failure-of-sysviews.patch b/meta-oe/recipes-dbs/postgresql/files/0005-postgresql-fix-ptest-failure-of-sysviews.patch
similarity index 71%
rename from meta-oe/recipes-dbs/postgresql/files/0001-postgresql-fix-ptest-failure-of-sysviews.patch
rename to meta-oe/recipes-dbs/postgresql/files/0005-postgresql-fix-ptest-failure-of-sysviews.patch
index 4db36d26f..af36da492 100644
--- a/meta-oe/recipes-dbs/postgresql/files/0001-postgresql-fix-ptest-failure-of-sysviews.patch
+++ b/meta-oe/recipes-dbs/postgresql/files/0005-postgresql-fix-ptest-failure-of-sysviews.patch
@@ -1,7 +1,7 @@
-From 9f81377dddfe32d950844d7053020a36b40fce08 Mon Sep 17 00:00:00 2001
+From 1a8b94140988d2ee5ff987b0bb3e7c3e936b8c01 Mon Sep 17 00:00:00 2001
 From: Manoj Saun <manojsingh.saun@windriver.com>
 Date: Wed, 22 Mar 2023 08:07:26 +0000
-Subject: [PATCH] postgresql: fix ptest failure of sysviews
+Subject: [PATCH 5/5] postgresql: fix ptest failure of sysviews
 
 The patch "0001-config_info.c-not-expose-build-info.patch" hides the debug info
 in pg_config table which reduces the count of rows from pg_config and leads to
@@ -18,9 +18,11 @@ Signed-off-by: Manoj Saun <manojsingh.saun@windriver.com>
  src/test/regress/sql/sysviews.sql      | 2 +-
  2 files changed, 2 insertions(+), 2 deletions(-)
 
+diff --git a/src/test/regress/expected/sysviews.out b/src/test/regress/expected/sysviews.out
+index 001c6e7..8256898 100644
 --- a/src/test/regress/expected/sysviews.out
 +++ b/src/test/regress/expected/sysviews.out
-@@ -29,7 +29,7 @@ select name, ident, parent, level, total
+@@ -29,7 +29,7 @@ select name, ident, parent, level, total_bytes >= free_bytes
  (1 row)
  
  -- At introduction, pg_config had 23 entries; it may grow
@@ -29,9 +31,11 @@ Signed-off-by: Manoj Saun <manojsingh.saun@windriver.com>
   ok 
  ----
   t
+diff --git a/src/test/regress/sql/sysviews.sql b/src/test/regress/sql/sysviews.sql
+index 351e469..84c113e 100644
 --- a/src/test/regress/sql/sysviews.sql
 +++ b/src/test/regress/sql/sysviews.sql
-@@ -18,7 +18,7 @@ select name, ident, parent, level, total
+@@ -18,7 +18,7 @@ select name, ident, parent, level, total_bytes >= free_bytes
    from pg_backend_memory_contexts where level = 0;
  
  -- At introduction, pg_config had 23 entries; it may grow
@@ -40,3 +44,6 @@ Signed-off-by: Manoj Saun <manojsingh.saun@windriver.com>
  
  -- We expect no cursors in this test; see also portals.sql
  select count(*) = 0 as ok from pg_cursors;
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-dbs/postgresql/postgresql.inc b/meta-oe/recipes-dbs/postgresql/postgresql.inc
index 15ecdeeb2..868a2e443 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql.inc
+++ b/meta-oe/recipes-dbs/postgresql/postgresql.inc
@@ -54,7 +54,7 @@ pkg_postinst:${PN} () {
 
 PACKAGECONFIG ??= " \
     ${@bb.utils.filter('DISTRO_FEATURES', 'pam systemd', d)} \
-    openssl python uuid libxml tcl perl zlib \
+    openssl python uuid libxml tcl perl zlib icu \
 "
 PACKAGECONFIG[tcl] = "--with-tcl --with-tclconfig=${STAGING_BINDIR_CROSS},--without-tcl,tcl tcl-native,"
 PACKAGECONFIG[perl] = "--with-perl,--without-perl,perl,perl"
@@ -69,6 +69,7 @@ PACKAGECONFIG[libxslt] = "--with-libxslt,--without-libxslt,libxslt"
 PACKAGECONFIG[zlib] = "--with-zlib,--without-zlib,zlib"
 PACKAGECONFIG[lz4] = "--with-lz4,--without-lz4,lz4"
 PACKAGECONFIG[openssl] = "--with-ssl=openssl,ac_cv_file__dev_urandom=yes,openssl"
+PACKAGECONFIG[icu] = "--with-icu,--without-icu,icu,icu"
 
 EXTRA_OECONF += "--enable-thread-safety --disable-rpath \
     --datadir=${datadir}/${BPN} \
@@ -229,6 +230,16 @@ do_install:append() {
 SSTATE_SCAN_FILES += "Makefile.global"
 SSTATE_SCAN_FILES:remove = "*_config"
 
+postgresql_fix_sources () {
+	for f in ${PKGD}${TARGET_DBGSRC_DIR}/src/pl/plperl/Util.c \
+			${PKGD}${TARGET_DBGSRC_DIR}/src/pl/plperl/SPI.c; do
+		if [ -e $f ]; then
+			sed -i -e 's#${B}/../${P}#${TARGET_DBGSRC_DIR}#g' $f
+		fi
+	done
+}
+PACKAGESPLITFUNCS =+ "postgresql_fix_sources"
+
 PACKAGES =+ "${PN}-client ${PN}-server-dev ${PN}-timezone \
     libecpg-compat libecpg-compat-dev \
     libecpg libecpg-dev libecpg-staticdev libecpg-doc \
diff --git a/meta-oe/recipes-dbs/postgresql/postgresql_15.5.bb b/meta-oe/recipes-dbs/postgresql/postgresql_15.5.bb
deleted file mode 100644
index cb90ff930..000000000
--- a/meta-oe/recipes-dbs/postgresql/postgresql_15.5.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-require postgresql.inc
-
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=c31f662bb2bfb3b4187fe9a53e0ffe7c"
-
-SRC_URI += "\
-   file://not-check-libperl.patch \
-   file://0001-Add-support-for-RISC-V.patch \
-   file://0001-Improve-reproducibility.patch \
-   file://0001-configure.ac-bypass-autoconf-2.69-version-check.patch \
-   file://0001-config_info.c-not-expose-build-info.patch \
-   file://0001-postgresql-fix-ptest-failure-of-sysviews.patch \
-"
-
-SRC_URI[sha256sum] = "8f53aa95d78eb8e82536ea46b68187793b42bba3b4f65aa342f540b23c9b10a6"
-
-CVE_STATUS[CVE-2017-8806] = "not-applicable-config: Ddoesn't apply to out configuration of postgresql so we can safely ignore it."
diff --git a/meta-oe/recipes-dbs/postgresql/postgresql_16.2.bb b/meta-oe/recipes-dbs/postgresql/postgresql_16.2.bb
new file mode 100644
index 000000000..31f83a564
--- /dev/null
+++ b/meta-oe/recipes-dbs/postgresql/postgresql_16.2.bb
@@ -0,0 +1,16 @@
+require postgresql.inc
+
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=89afbb2d7716371015101c2b2cb4297a"
+
+SRC_URI += "\
+   file://not-check-libperl.patch \
+   file://0001-Add-support-for-RISC-V.patch \
+   file://0002-Improve-reproducibility.patch \
+   file://0003-configure.ac-bypass-autoconf-2.69-version-check.patch \
+   file://0004-config_info.c-not-expose-build-info.patch \
+   file://0005-postgresql-fix-ptest-failure-of-sysviews.patch \
+"
+
+SRC_URI[sha256sum] = "446e88294dbc2c9085ab4b7061a646fa604b4bec03521d5ea671c2e5ad9b2952"
+
+CVE_STATUS[CVE-2017-8806] = "not-applicable-config: Ddoesn't apply to out configuration of postgresql so we can safely ignore it."
-- 
2.25.1


