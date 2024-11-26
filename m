Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62AF4D5A6E2
	for <webhook@archiver.kernel.org>; Tue, 26 Nov 2024 04:41:20 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.38891.1732596073756570637
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Nov 2024 20:41:13 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=106056d748=yogita.urade@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AQ2k5Ij007788
	for <openembedded-devel@lists.openembedded.org>; Tue, 26 Nov 2024 04:41:13 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 433491avf1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 26 Nov 2024 04:41:12 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Mon, 25 Nov 2024 20:41:10 -0800
From: yurade <yogita.urade@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][master][scarthgap][PATCH 1/1] php: upgrade 8.2.20 -> 8.2.24
Date: Tue, 26 Nov 2024 04:40:52 +0000
Message-ID: <20241126044052.525009-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Authority-Analysis: v=2.4 cv=W4ZqVgWk c=1 sm=1 tr=0 ts=67455168 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=JhMfiyDoiLEA:10 a=HCiNrPZc1L8A:10 a=VlfZXiiP6vEA:10 a=67BIL_jfAAAA:8 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8
 a=ZgU6DmHzig3f5syPRCgA:9 a=zWsmoVtUA9YA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 6drA0uT0MMNq-cSsMinXBF-D3604lgQ_
X-Proofpoint-ORIG-GUID: 6drA0uT0MMNq-cSsMinXBF-D3604lgQ_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-11-26_03,2024-11-25_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 bulkscore=0
 adultscore=0 mlxscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 mlxlogscore=999 impostorscore=0
 phishscore=0 spamscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2409260000 definitions=main-2411260037
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Nov 2024 04:41:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114057

From: Yogita Urade <yogita.urade@windriver.com>

Includes fix for CVE-2024-8925, CVE-2024-8926, CVE-2024-8927
and CVE-2024-9026

Changelog:
https://www.php.net/ChangeLog-8.php#8.2.24

Rebase 0001-ext-opcache-config.m4-enable-opcache.patch to new version

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 ...001-ext-opcache-config.m4-enable-opcache.patch | 15 +++++++++------
 .../php/{php_8.2.20.bb => php_8.2.24.bb}          |  2 +-
 2 files changed, 10 insertions(+), 7 deletions(-)
 rename meta-oe/recipes-devtools/php/{php_8.2.20.bb => php_8.2.24.bb} (99%)

diff --git a/meta-oe/recipes-devtools/php/php/0001-ext-opcache-config.m4-enable-opcache.patch b/meta-oe/recipes-devtools/php/php/0001-ext-opcache-config.m4-enable-opcache.patch
index c743697469..496213540b 100644
--- a/meta-oe/recipes-devtools/php/php/0001-ext-opcache-config.m4-enable-opcache.patch
+++ b/meta-oe/recipes-devtools/php/php/0001-ext-opcache-config.m4-enable-opcache.patch
@@ -1,6 +1,6 @@
-From 889583912ddd7abc628f2703892ec4884db6419a Mon Sep 17 00:00:00 2001
-From: Soumya Sambu <soumya.sambu@windriver.com>
-Date: Tue, 7 May 2024 08:39:16 +0000
+From aa99f9db92817358d6b91040cc555f5ca31b727c Mon Sep 17 00:00:00 2001
+From: Yogita Urade <yogita.urade@windriver.com>
+Date: Mon, 25 Nov 2024 07:07:38 +0000
 Subject: [PATCH 01/11] ext/opcache/config.m4: enable opcache
 
 We can't use AC_TRY_RUN to run programs in a cross compile
@@ -23,12 +23,15 @@ Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
 
 update patch to version 8.2.18
 Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+
+update patch to version 8.2.24
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
 ---
  ext/opcache/config.m4 | 204 ++----------------------------------------
  1 file changed, 8 insertions(+), 196 deletions(-)
 
 diff --git a/ext/opcache/config.m4 b/ext/opcache/config.m4
-index 6bf07ad3..5d645b86 100644
+index b3929382..ba1a9aff 100644
 --- a/ext/opcache/config.m4
 +++ b/ext/opcache/config.m4
 @@ -113,209 +113,21 @@ if test "$PHP_OPCACHE" != "no"; then
@@ -247,8 +250,8 @@ index 6bf07ad3..5d645b86 100644
 +  have_shm_mmap_posix=yes
 +  PHP_CHECK_LIBRARY(rt, shm_unlink, [PHP_ADD_LIBRARY(rt,1,OPCACHE_SHARED_LIBADD)])
  
-   PHP_NEW_EXTENSION(opcache,
- 	ZendAccelerator.c \
+   AX_CHECK_COMPILE_FLAG([-Wno-implicit-fallthrough],
+     [PHP_OPCACHE_CFLAGS="$PHP_OPCACHE_CFLAGS -Wno-implicit-fallthrough"],,
 -- 
 2.40.0
 
diff --git a/meta-oe/recipes-devtools/php/php_8.2.20.bb b/meta-oe/recipes-devtools/php/php_8.2.24.bb
similarity index 99%
rename from meta-oe/recipes-devtools/php/php_8.2.20.bb
rename to meta-oe/recipes-devtools/php/php_8.2.24.bb
index f306b16931..22bc92278b 100644
--- a/meta-oe/recipes-devtools/php/php_8.2.20.bb
+++ b/meta-oe/recipes-devtools/php/php_8.2.24.bb
@@ -34,7 +34,7 @@ SRC_URI:append:class-target = " \
           "
 
 S = "${WORKDIR}/php-${PV}"
-SRC_URI[sha256sum] = "5dec6fa61c7b9c47aa1d76666be651f2642ed2bcf6cd8638c57e3571ce2aac61"
+SRC_URI[sha256sum] = "4cc76ec644eee97d17c92bfe8d0e84714fedf299a538b7dfadc0639dd0dc432f"
 
 CVE_STATUS_GROUPS += "CVE_STATUS_PHP"
 CVE_STATUS_PHP[status] = "fixed-version: The name of this product is exactly the same as github.com/emlog/emlog. CVE can be safely ignored."
-- 
2.40.0


