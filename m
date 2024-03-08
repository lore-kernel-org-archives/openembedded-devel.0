Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C16BC5475B
	for <webhook@archiver.kernel.org>; Fri,  8 Mar 2024 09:28:26 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.17993.1709890097439503251
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 Mar 2024 01:28:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=jBZpAt4j;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3797c483d2=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4289Cvos027739
	for <openembedded-devel@lists.openembedded.org>; Fri, 8 Mar 2024 09:28:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=SeS0P
	+3Kx5FNUfMXctN8WPlX/8h+4Ob7tPaSYTbaiPE=; b=jBZpAt4jCMkHcH0IliNCS
	B6Kzf/WQXN27RppAh4T/qTZRZzocx5WXoGVz0D32Pt5NIojqfyBroqQncsUXSxl6
	WCJkwXg+cuxf4iEbwPy8T/OX5XpN4pjTR9wWX8Jz230O5JOMKuPlXTUZPjrvP8Vv
	bcObZaMz8zNqkRqYwICxcTHCeUtWYO0Y4J/WJyzmBIcLt8ZPCCJx/7wri5mzw2CY
	XO7vxZ8h0EyfQT6ZhvLuwH05xAc77KrEPYcticrGPaxZlXwWMEYeIBEV7KTv6Dmv
	4Pxu/m+BKH9Kg4pc7HUP5T3o9EF0fmVVO2YFZ8w5+npmrHx8a36cAeg0zkWdLvD5
	w==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wku36e6sa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 08 Mar 2024 09:28:16 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 8 Mar 2024 01:28:15 -0800
Received: from ala-lpggp7.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Fri, 8 Mar 2024 01:28:15 -0800
From: <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-filesystems][PATCH 1/1] yaffs2-utils: Upgrade to 20221209
Date: Fri, 8 Mar 2024 01:28:15 -0800
Message-ID: <20240308092815.1217224-1-liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: AopydiwQY_B6zcKiY2MUb22H3DpCGxj2
X-Proofpoint-GUID: AopydiwQY_B6zcKiY2MUb22H3DpCGxj2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-08_06,2024-03-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 spamscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0
 mlxlogscore=999 suspectscore=0 impostorscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403080073
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 08 Mar 2024 09:28:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109227

From: Robert Yang <liezhi.yang@windriver.com>

* The 20221209 is the commit date of SRCREV since this recipe has no version.
* Add 0001-yaffs_guts.h-define-YTIME_T-if-not-already-defined.patch to fix
  build error:
  yaffs_guts.h:501:9: error: unknown type name 'YTIME_T'

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 ...efine-YTIME_T-if-not-already-defined.patch | 34 +++++++++++++++++++
 .../yaffs2/yaffs2-utils_git.bb                |  6 ++--
 2 files changed, 38 insertions(+), 2 deletions(-)
 create mode 100644 meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils/0001-yaffs_guts.h-define-YTIME_T-if-not-already-defined.patch

diff --git a/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils/0001-yaffs_guts.h-define-YTIME_T-if-not-already-defined.patch b/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils/0001-yaffs_guts.h-define-YTIME_T-if-not-already-defined.patch
new file mode 100644
index 000000000..98c27d265
--- /dev/null
+++ b/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils/0001-yaffs_guts.h-define-YTIME_T-if-not-already-defined.patch
@@ -0,0 +1,34 @@
+From 05cc2b958090f96d6fa128da43aa69669625e529 Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Tue, 5 Mar 2024 12:03:23 +0000
+Subject: [PATCH] yaffs_guts.h: define YTIME_T if not already defined
+
+Fixed:
+yaffs_guts.h:501:9: error: unknown type name 'YTIME_T'
+  501 |         YTIME_T yst_uid;
+
+Upstream-Status: Pending
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ yaffs_guts.h | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/yaffs_guts.h b/yaffs_guts.h
+index 74ded0b..598271b 100644
+--- a/yaffs_guts.h
++++ b/yaffs_guts.h
+@@ -487,6 +487,10 @@ struct yaffs_obj {
+ 
+ 	YCHAR short_name[YAFFS_SHORT_NAME_LENGTH + 1];
+ 
++#ifndef YTIME_T
++#define YTIME_T     time_t
++#endif
++
+ #ifdef CONFIG_YAFFS_WINCE
+ 	//these are always 64 bits
+ 	u32 win_ctime[2];
+-- 
+2.35.5
+
diff --git a/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git.bb b/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git.bb
index 7228172b8..ca5e3302b 100644
--- a/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git.bb
+++ b/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git.bb
@@ -9,7 +9,8 @@ LIC_FILES_CHKSUM = "file://utils/mkyaffs2image.c;beginline=11;endline=13;md5=5f5
                     file://utils/mkyaffsimage.c;beginline=10;endline=12;md5=5f5464f9b3e981ca574e65b00e438561 \
                     "
 
-PV = "0.0+git"
+# The commit date of SRCREV
+PV = "20221209"
 
 DEPENDS = "mtd-utils"
 
@@ -17,9 +18,10 @@ DEPENDS = "mtd-utils"
 SRC_URI = "git://www.aleph1.co.uk/yaffs2;protocol=git;branch=master \
            file://makefile-add-ldflags.patch \
            file://0001-define-loff_t-if-not-already-defined.patch \
+           file://0001-yaffs_guts.h-define-YTIME_T-if-not-already-defined.patch \
            "
 
-SRCREV = "9a6f486e56f927eeb8dc7e4e0d84f6bb95eeaa0f"
+SRCREV = "613a901a229e8a701c18f003dd0aee18453e0670"
 
 UPSTREAM_CHECK_COMMITS = "1"
 
-- 
2.42.0


