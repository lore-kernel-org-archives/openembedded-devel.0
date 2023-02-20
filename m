Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47ADFC636D6
	for <webhook@archiver.kernel.org>; Mon, 20 Feb 2023 07:42:38 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web10.7925.1676878949126497815
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Feb 2023 23:42:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=QKZ6315w;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1676878947; i=@fujitsu.com;
	bh=3ceS39aMuNfbfmYaUv50OKIHeRaeXMHX5xCeTcA3Xtk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=QKZ6315wR7mPCXUkl6pspnY4Ol14pKnHS/1REgawF6BSWNxRVFmUyUFyWVhtRDaHB
	 6ssFWuovrADQ26iqBMgfqSv0zHY8gCcDA9wD2kvZooETzcQNk2ysWwKOVwPko8+tn6
	 w9LI+HTvqBJK9LShE0vsDioGr1FIb8lL40VdFp8oufO8sQnyHU2SKZ5r+YfpswPpX+
	 8CppaKkJUG6W+3usd0mylAbqgR5POm5TGHWQIBup1AbHDAtKq0unlShK7ReXx3DBwS
	 gMbpk/ee8QJmDDH77P1UGCs1OpVKXXFSVrReGZHqNq5tNeqYSAU6frVZsaXFDGNqSG
	 u86K5N+S8yAwg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrIIsWRWlGSWpSXmKPExsViZ8ORpJuk8jn
  Z4NMsI4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPvkxmMBd8NKza9LmhgPKHTxcjFISTwkFHi
  9NttzBDOVSaJWw9+skE4exkl5s++A5Th5GATkJK4cf8/G4gtIqAvsXT2HrA4s4CKxIvfPewgt
  rCAg8SWrS/BalgEVCXePb4DFOfg4BVwkpj9JRskLCGgIDHl4XuwVk4BZ4nHGy+xgJQIAZU0fe
  EBCfMKCEqcnPmEBWK6hMTBFy+YIVoVJWZfbmaBsCslWj/8grLVJK6e28Q8gVFwFpL2WUjaFzA
  yrWI0L04tKkst0jU01EsqykzPKMlNzMzRS6zSTdRLLdXNyy8qydA11EssL9ZLLS7WK67MTc5J
  0ctLLdnECAzdlOK04zsYX/b91TvEKMnBpCTKu0n4c7IQX1J+SmVGYnFGfFFpTmrxIUYZDg4lC
  d4qRaCcYFFqempFWmYOMI5g0hIcPEoivNLSQGne4oLE3OLMdIjUKUZdjk37ug4wC7Hk5eelSo
  nzKigDFQmAFGWU5sGNgMX0JUZZKWFeRgYGBiGegtSi3MwSVPlXjOIcjErCvMdBLuHJzCuB2/Q
  K6AgmoCPcf3wAOaIkESEl1cCkFDuT1SFt5oMTq6K7Hwuor3/7oGhGUpu+/a6FrYyKKTs41iw4
  5bT7UHrJ7v3WBa5unVxhNtoHbRqq829de6L4e6aa176NTqnqQgkpXyv4DKSe117fdyNll7xaY
  PTTnNsnvRcGNM07ymPB3sY+Zffjmsx7bBeYQ7k4X4XMmNcvIRA/7fHjjv0qu1OPpb88klAm/X
  LK/IdMT5MOBW7x1OGvi32rfVx3cpvrypUO+UlcR+vcT63ovb4478/PQ4tOrJovdMXSqzto1u+
  Oy86bH85QUtlpmTzbOJ+1QceESbxm6/tLeaIygQkdNvkrK471twfKOCqYsGvdY2NLkvipFZRV
  lsG/n2+fsmOs0i9DByWW4oxEQy3mouJEAG45CFxkAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-732.messagelabs.com!1676878946!166268!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 32305 invoked from network); 20 Feb 2023 07:42:26 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-3.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 20 Feb 2023 07:42:26 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 45E7A1B5
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Feb 2023 07:42:26 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 39DC01AD
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Feb 2023 07:42:26 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 20 Feb 2023 07:42:24 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] postgresql: upgrade 14.5 -> 15.2
Date: Mon, 20 Feb 2023 15:41:50 +0800
Message-ID: <1676878912-15532-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1676878912-15532-1-git-send-email-wangmy@fujitsu.com>
References: <1676878912-15532-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Feb 2023 07:42:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101161

From: Wang Mingyu <wangmy@fujitsu.com>

0001-Add-support-for-RISC-V.patch
0001-configure.ac-bypass-autoconf-2.69-version-check.patch
refreshed for 15.2.

remove_duplicate.patch
removed since it's included in 15.2.

License-Update: Copyright year updated to 2023.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../files/0001-Add-support-for-RISC-V.patch   | 15 ++++----
 ...c-bypass-autoconf-2.69-version-check.patch | 10 +++--
 .../postgresql/files/remove_duplicate.patch   | 38 -------------------
 ...{postgresql_14.5.bb => postgresql_15.2.bb} |  5 +--
 4 files changed, 16 insertions(+), 52 deletions(-)
 delete mode 100644 meta-oe/recipes-dbs/postgresql/files/remove_duplicate.patch
 rename meta-oe/recipes-dbs/postgresql/{postgresql_14.5.bb => postgresql_15.2.bb} (63%)

diff --git a/meta-oe/recipes-dbs/postgresql/files/0001-Add-support-for-RISC-V.patch b/meta-oe/recipes-dbs/postgresql/files/0001-Add-support-for-RISC-V.patch
index 90b741949..8ba685cfe 100644
--- a/meta-oe/recipes-dbs/postgresql/files/0001-Add-support-for-RISC-V.patch
+++ b/meta-oe/recipes-dbs/postgresql/files/0001-Add-support-for-RISC-V.patch
@@ -6,11 +6,11 @@ Subject: [PATCH] Add support for RISC-V.
 The architecture is sufficiently similar to aarch64 that simply
 extending the existing aarch64 macro works.
 ---
- src/include/storage/s_lock.h | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
+ src/include/storage/s_lock.h | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/src/include/storage/s_lock.h b/src/include/storage/s_lock.h
-index dccbd29..ad60429 100644
+index 4d3ffc7..22e27bf 100644
 --- a/src/include/storage/s_lock.h
 +++ b/src/include/storage/s_lock.h
 @@ -317,11 +317,12 @@ tas(volatile slock_t *lock)
@@ -27,15 +27,16 @@ index dccbd29..ad60429 100644
  #ifdef HAVE_GCC__SYNC_INT32_TAS
  #define HAS_TEST_AND_SET
  
-@@ -338,7 +339,7 @@ tas(volatile slock_t *lock)
- #define S_UNLOCK(lock) __sync_lock_release(lock)
+@@ -355,8 +356,7 @@ spin_delay(void)
  
+ #endif	 /* __aarch64__ || __aarch64 */
  #endif	 /* HAVE_GCC__SYNC_INT32_TAS */
 -#endif	 /* __arm__ || __arm || __aarch64__ || __aarch64 */
+-
 +#endif	 /* __arm__ || __arm || __aarch64__ || __aarch64 || __riscv */
  
- 
- /*
+ /* S/390 and S/390x Linux (32- and 64-bit zSeries) */
+ #if defined(__s390__) || defined(__s390x__)
 -- 
 2.34.1
 
diff --git a/meta-oe/recipes-dbs/postgresql/files/0001-configure.ac-bypass-autoconf-2.69-version-check.patch b/meta-oe/recipes-dbs/postgresql/files/0001-configure.ac-bypass-autoconf-2.69-version-check.patch
index 4a576d717..467b5c4f5 100644
--- a/meta-oe/recipes-dbs/postgresql/files/0001-configure.ac-bypass-autoconf-2.69-version-check.patch
+++ b/meta-oe/recipes-dbs/postgresql/files/0001-configure.ac-bypass-autoconf-2.69-version-check.patch
@@ -8,23 +8,25 @@ for upgrade to autoconf 2.71
 Upstream-Status: Inappropriate [disable feature]
 
 Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
-
 ---
  configure.ac | 4 ----
  1 file changed, 4 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index ffe878e..c39799b 100644
+index 48d7256..9bee38f 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -19,10 +19,6 @@ m4_pattern_forbid(^PGAC_)dnl to catch undefined macros
  
- AC_INIT([PostgreSQL], [14.5], [pgsql-bugs@lists.postgresql.org], [], [https://www.postgresql.org/])
+ AC_INIT([PostgreSQL], [15.2], [pgsql-bugs@lists.postgresql.org], [], [https://www.postgresql.org/])
  
 -m4_if(m4_defn([m4_PACKAGE_VERSION]), [2.69], [], [m4_fatal([Autoconf version 2.69 is required.
 -Untested combinations of 'autoconf' and PostgreSQL versions are not
 -recommended.  You can remove the check from 'configure.ac' but it is then
 -your responsibility whether the result works or not.])])
- AC_COPYRIGHT([Copyright (c) 1996-2021, PostgreSQL Global Development Group])
+ AC_COPYRIGHT([Copyright (c) 1996-2022, PostgreSQL Global Development Group])
  AC_CONFIG_SRCDIR([src/backend/access/common/heaptuple.c])
  AC_CONFIG_AUX_DIR(config)
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-dbs/postgresql/files/remove_duplicate.patch b/meta-oe/recipes-dbs/postgresql/files/remove_duplicate.patch
deleted file mode 100644
index 92a3dcc71..000000000
--- a/meta-oe/recipes-dbs/postgresql/files/remove_duplicate.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-Remove duplicate code for riscv
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
---- a/src/include/storage/s_lock.h
-+++ b/src/include/storage/s_lock.h
-@@ -341,30 +341,6 @@ tas(volatile slock_t *lock)
- #endif	 /* HAVE_GCC__SYNC_INT32_TAS */
- #endif	 /* __arm__ || __arm || __aarch64__ || __aarch64 || __riscv */
- 
--
--/*
-- * RISC-V likewise uses __sync_lock_test_and_set(int *, int) if available.
-- */
--#if defined(__riscv)
--#ifdef HAVE_GCC__SYNC_INT32_TAS
--#define HAS_TEST_AND_SET
--
--#define TAS(lock) tas(lock)
--
--typedef int slock_t;
--
--static __inline__ int
--tas(volatile slock_t *lock)
--{
--	return __sync_lock_test_and_set(lock, 1);
--}
--
--#define S_UNLOCK(lock) __sync_lock_release(lock)
--
--#endif	 /* HAVE_GCC__SYNC_INT32_TAS */
--#endif	 /* __riscv */
--
--
- /* S/390 and S/390x Linux (32- and 64-bit zSeries) */
- #if defined(__s390__) || defined(__s390x__)
- #define HAS_TEST_AND_SET
diff --git a/meta-oe/recipes-dbs/postgresql/postgresql_14.5.bb b/meta-oe/recipes-dbs/postgresql/postgresql_15.2.bb
similarity index 63%
rename from meta-oe/recipes-dbs/postgresql/postgresql_14.5.bb
rename to meta-oe/recipes-dbs/postgresql/postgresql_15.2.bb
index 1551d3405..befb0caec 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql_14.5.bb
+++ b/meta-oe/recipes-dbs/postgresql/postgresql_15.2.bb
@@ -1,17 +1,16 @@
 require postgresql.inc
 
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=75af6e3eeec4a06cdd2e578673236fc3"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=c31f662bb2bfb3b4187fe9a53e0ffe7c"
 
 SRC_URI += "\
    file://not-check-libperl.patch \
    file://0001-Add-support-for-RISC-V.patch \
    file://0001-Improve-reproducibility.patch \
    file://0001-configure.ac-bypass-autoconf-2.69-version-check.patch \
-   file://remove_duplicate.patch \
    file://0001-config_info.c-not-expose-build-info.patch \
 "
 
-SRC_URI[sha256sum] = "d4f72cb5fb857c9a9f75ec8cf091a1771272802f2178f0b2e65b7b6ff64f4a30"
+SRC_URI[sha256sum] = "99a2171fc3d6b5b5f56b757a7a3cb85d509a38e4273805def23941ed2b8468c7"
 
 CVE_CHECK_IGNORE += "\
    CVE-2017-8806 \
-- 
2.34.1


