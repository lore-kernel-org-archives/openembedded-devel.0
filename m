Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0B07C5AD49
	for <webhook@archiver.kernel.org>; Fri,  6 Jun 2025 07:01:18 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.28140.1749193274842493199
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 06 Jun 2025 00:01:14 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8252828ab7=yogita.urade@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5564VQaY004165
	for <openembedded-devel@lists.openembedded.org>; Fri, 6 Jun 2025 00:01:14 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 471g9rw39d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 06 Jun 2025 00:01:13 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Fri, 6 Jun 2025 00:01:11 -0700
From: yurade <yogita.urade@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][walnascar][PATCH 1/1] postgresql: upgrade 17.4 -> 17.5
Date: Fri, 6 Jun 2025 12:30:49 +0530
Message-ID: <20250606070049.1602170-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDA2NCBTYWx0ZWRfX18OEWOPYFbb+ oDyc5vi0u5R8yJVkuTnPRZYkU2sPNZXSHd00IyqvD+09+tVcHxlYCa3aay+wXsIcKRaQaCo0P/2 m0nvZalY5doLLaTwHwXsvlugU1yvtvV6Z5xsM5AE2qjRhd/Zbq6NmaFWXkKGmAYArWsNKW0CXcQ
 wkNC+CDiw3+iYTq0fBIU0C7fuA5SMA7Yi/YD65F/ahg+GKaVvD5Ke4E2JYuJI0wYZix4ySFvELF u9Zc4t8L/5Rl7mvRnFNzU0/vYDadknT5lcnraX6iyNyNqpRuq0ilE9+VSNF3W1JXziB+I8KkHcc xvoI9Yx2/kxl1ZM6Hv7wf9mnLD418u1Ct9Q2IXhcaNkkzmMnK61cP1TyqADTAc52tEWT8jOv1Zl
 PyRmK2s8laNQsNwmX7TVcwagIrmjZ3PC6+gL5WTylsOuAKkgy6d4Cuiv8c6MUp4Uo72+gd2z
X-Authority-Analysis: v=2.4 cv=PvyTbxM3 c=1 sm=1 tr=0 ts=6842923a cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=HCiNrPZc1L8A:10 a=6IFa9wvqVegA:10 a=epTmVMiNAAAA:8 a=omOdbC7AAAAA:8 a=pGLkceISAAAA:8 a=t7CeM3EgAAAA:8
 a=sQvdjrug7g35QjmkKfAA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 9G5rJi0DAtWlIYlvr1oHdeZeMefgT9s5
X-Proofpoint-ORIG-GUID: 9G5rJi0DAtWlIYlvr1oHdeZeMefgT9s5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-06_01,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 bulkscore=0 adultscore=0 mlxscore=0 mlxlogscore=999 impostorscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506060064
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 06 Jun 2025 07:01:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117761

From: Wang Mingyu <wangmy@fujitsu.com>

0003-configure.ac-bypass-autoconf-2.69-version-check.patch
0004-config_info.c-not-expose-build-info.patch
not-check-libperl.patch
refreshed for 17.5

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 ...gure.ac-bypass-autoconf-2.69-version-check.patch |  9 +++------
 .../0004-config_info.c-not-expose-build-info.patch  | 13 +++++--------
 .../postgresql/files/not-check-libperl.patch        |  9 +++------
 .../{postgresql_17.4.bb => postgresql_17.5.bb}      |  2 +-
 4 files changed, 12 insertions(+), 21 deletions(-)
 rename meta-oe/recipes-dbs/postgresql/{postgresql_17.4.bb => postgresql_17.5.bb} (87%)

diff --git a/meta-oe/recipes-dbs/postgresql/files/0003-configure.ac-bypass-autoconf-2.69-version-check.patch b/meta-oe/recipes-dbs/postgresql/files/0003-configure.ac-bypass-autoconf-2.69-version-check.patch
index 92ac335a7b..4382741da9 100644
--- a/meta-oe/recipes-dbs/postgresql/files/0003-configure.ac-bypass-autoconf-2.69-version-check.patch
+++ b/meta-oe/recipes-dbs/postgresql/files/0003-configure.ac-bypass-autoconf-2.69-version-check.patch
@@ -1,4 +1,4 @@
-From 5ce7d8398f6aff41eee8c8c80eeaad2fcb3da1fc Mon Sep 17 00:00:00 2001
+From 84febaf9330fe99802f75bcd0606ac7d86c35b25 Mon Sep 17 00:00:00 2001
 From: Yi Fan Yu <yifan.yu@windriver.com>
 Date: Fri, 5 Feb 2021 17:15:42 -0500
 Subject: [PATCH] configure.ac: bypass autoconf 2.69 version check
@@ -13,12 +13,12 @@ Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
  1 file changed, 4 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index a8a61c5..27c2760 100644
+index 493d5cd..f0fa973 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -19,10 +19,6 @@ m4_pattern_forbid(^PGAC_)dnl to catch undefined macros
  
- AC_INIT([PostgreSQL], [17.4], [pgsql-bugs@lists.postgresql.org], [], [https://www.postgresql.org/])
+ AC_INIT([PostgreSQL], [17.5], [pgsql-bugs@lists.postgresql.org], [], [https://www.postgresql.org/])
  
 -m4_if(m4_defn([m4_PACKAGE_VERSION]), [2.69], [], [m4_fatal([Autoconf version 2.69 is required.
 -Untested combinations of 'autoconf' and PostgreSQL versions are not
@@ -27,6 +27,3 @@ index a8a61c5..27c2760 100644
  AC_COPYRIGHT([Copyright (c) 1996-2024, PostgreSQL Global Development Group])
  AC_CONFIG_SRCDIR([src/backend/access/common/heaptuple.c])
  AC_CONFIG_AUX_DIR(config)
--- 
-2.34.1
-
diff --git a/meta-oe/recipes-dbs/postgresql/files/0004-config_info.c-not-expose-build-info.patch b/meta-oe/recipes-dbs/postgresql/files/0004-config_info.c-not-expose-build-info.patch
index ff0582ab80..d94f028036 100644
--- a/meta-oe/recipes-dbs/postgresql/files/0004-config_info.c-not-expose-build-info.patch
+++ b/meta-oe/recipes-dbs/postgresql/files/0004-config_info.c-not-expose-build-info.patch
@@ -1,7 +1,7 @@
-From 5be3ffdf767c1efcbfd2d1be87aa83f2e37e348e Mon Sep 17 00:00:00 2001
+From 62733bdc9346651637d9e5ac7cbf8d7311ef5d97 Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
 Date: Mon, 1 Aug 2022 15:44:38 +0800
-Subject: [PATCH 4/5] config_info.c: not expose build info
+Subject: [PATCH] config_info.c: not expose build info
 
 Don't collect the build information to fix the buildpaths issue.
 
@@ -14,10 +14,10 @@ Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
  2 files changed, 2 insertions(+), 70 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 27f382d..3dd6bb1 100644
+index f0fa973..8ccd8bc 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -23,7 +23,7 @@ AC_COPYRIGHT([Copyright (c) 1996-2023, PostgreSQL Global Development Group])
+@@ -23,7 +23,7 @@ AC_COPYRIGHT([Copyright (c) 1996-2024, PostgreSQL Global Development Group])
  AC_CONFIG_SRCDIR([src/backend/access/common/heaptuple.c])
  AC_CONFIG_AUX_DIR(config)
  AC_PREFIX_DEFAULT(/usr/local/pgsql)
@@ -27,7 +27,7 @@ index 27f382d..3dd6bb1 100644
  [PG_MAJORVERSION=`expr "$PACKAGE_VERSION" : '\([0-9][0-9]*\)'`]
  [PG_MINORVERSION=`expr "$PACKAGE_VERSION" : '.*\.\([0-9][0-9]*\)'`]
 diff --git a/src/common/config_info.c b/src/common/config_info.c
-index 09e78a6..86e4230 100644
+index 89c1ccb..a2206de 100644
 --- a/src/common/config_info.c
 +++ b/src/common/config_info.c
 @@ -38,7 +38,7 @@ get_configdata(const char *my_exec_path, size_t *configdata_len)
@@ -114,6 +114,3 @@ index 09e78a6..86e4230 100644
  	configdata[i].name = pstrdup("VERSION");
  	configdata[i].setting = pstrdup("PostgreSQL " PG_VERSION);
  	i++;
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-dbs/postgresql/files/not-check-libperl.patch b/meta-oe/recipes-dbs/postgresql/files/not-check-libperl.patch
index 1f735f322b..a2f0500a8c 100644
--- a/meta-oe/recipes-dbs/postgresql/files/not-check-libperl.patch
+++ b/meta-oe/recipes-dbs/postgresql/files/not-check-libperl.patch
@@ -1,4 +1,4 @@
-From 56b830edecff1cac5f8a8a956e7a7eeef2aa7c17 Mon Sep 17 00:00:00 2001
+From 1a9416bae71aa935797add3fa11407732ad010c0 Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Tue, 27 Nov 2018 13:25:15 +0800
 Subject: [PATCH] not check libperl under cross compiling
@@ -20,10 +20,10 @@ Signed-off-by: Changqing Li <changqing.li@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index fba79ee..7170f26 100644
+index f398184..493d5cd 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -2297,7 +2297,7 @@ Use --without-tcl to disable building PL/Tcl.])
+@@ -2336,7 +2336,7 @@ Use --without-tcl to disable building PL/Tcl.])
  fi
  
  # check for <perl.h>
@@ -32,6 +32,3 @@ index fba79ee..7170f26 100644
    ac_save_CPPFLAGS=$CPPFLAGS
    CPPFLAGS="$CPPFLAGS $perl_includespec"
    AC_CHECK_HEADER(perl.h, [], [AC_MSG_ERROR([header file <perl.h> is required for Perl])],
--- 
-2.34.1
-
diff --git a/meta-oe/recipes-dbs/postgresql/postgresql_17.4.bb b/meta-oe/recipes-dbs/postgresql/postgresql_17.5.bb
similarity index 87%
rename from meta-oe/recipes-dbs/postgresql/postgresql_17.4.bb
rename to meta-oe/recipes-dbs/postgresql/postgresql_17.5.bb
index b1c95ed244..b7fce886f8 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql_17.4.bb
+++ b/meta-oe/recipes-dbs/postgresql/postgresql_17.5.bb
@@ -12,6 +12,6 @@ SRC_URI += "\
    file://0001-tcl.m4-Recognize-tclsh9.patch \
 "
 
-SRC_URI[sha256sum] = "c4605b73fea11963406699f949b966e5d173a7ee0ccaef8938dec0ca8a995fe7"
+SRC_URI[sha256sum] = "fcb7ab38e23b264d1902cb25e6adafb4525a6ebcbd015434aeef9eda80f528d8"
 
 CVE_STATUS[CVE-2017-8806] = "not-applicable-config: Ddoesn't apply to out configuration of postgresql so we can safely ignore it."
-- 
2.40.0


