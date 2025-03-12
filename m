Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 937FDC35FF6
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 01:00:05 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.26665.1741741197261142365
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Mar 2025 17:59:57 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5166cf4169=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52C0w3Xh028772
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Mar 2025 00:59:56 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45au8y09gg-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Mar 2025 00:59:56 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Tue, 11 Mar 2025 17:59:55 -0700
Received: from pek-lpg-core6.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Tue, 11 Mar 2025 17:59:54 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH 3/9] iozone3: upgrade 506 -> 507
Date: Wed, 12 Mar 2025 08:59:46 +0800
Message-ID: <20250312005952.1469547-3-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250312005952.1469547-1-changqing.li@windriver.com>
References: <20250312005952.1469547-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: iZglykq1AsCy9A7bku_Tlge2UiUP0ZL5
X-Proofpoint-ORIG-GUID: iZglykq1AsCy9A7bku_Tlge2UiUP0ZL5
X-Authority-Analysis: v=2.4 cv=ILoCChvG c=1 sm=1 tr=0 ts=67d0dc8c cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=Vs1iUdzkB0EA:10 a=XRIXKuBqAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=xxWLryC8HwwOhbe0AD8A:9 a=i3El-RGGL1J1swoAUsYq:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-11_07,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 mlxlogscore=999 impostorscore=0
 suspectscore=0 mlxscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.21.0-2502280000 definitions=main-2503120005
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Mar 2025 01:00:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115899

From: Changqing Li <changqing.li@windriver.com>

Upgrade to the latest version:
* 0001-let-system-headers-provide-pread64.patch is removed since
the original issue cannot reproduce with new version
* update license content line number

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 ...1-let-system-headers-provide-pread64.patch | 34 -------------------
 .../{iozone3_506.bb => iozone3_507.bb}        |  5 ++-
 2 files changed, 2 insertions(+), 37 deletions(-)
 delete mode 100644 meta-oe/recipes-benchmark/iozone3/iozone3/0001-let-system-headers-provide-pread64.patch
 rename meta-oe/recipes-benchmark/iozone3/{iozone3_506.bb => iozone3_507.bb} (95%)

diff --git a/meta-oe/recipes-benchmark/iozone3/iozone3/0001-let-system-headers-provide-pread64.patch b/meta-oe/recipes-benchmark/iozone3/iozone3/0001-let-system-headers-provide-pread64.patch
deleted file mode 100644
index a61a56a71d..0000000000
--- a/meta-oe/recipes-benchmark/iozone3/iozone3/0001-let-system-headers-provide-pread64.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 64389a67b93a53b9fb7e9e20e905a5ee4613606b Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 15 Jan 2020 17:10:42 -0800
-Subject: [PATCH] let system headers provide pread64()
-
-The signature does not match with system headers anyway
-
-Fixes
-
-iozone.c:1270:9: error: redeclaration of 'pread64' must have the 'overloadable' attribute                                                                       ssize_t pread64();                                                                      ^                                                                       /mnt/b/yoe/build/tmp/work/core2-64-yoe-linux/iozone3/488-r0/recipe-sysroot/usr/include/bits/unistd.h:83:1: note: previous overload of function is here          pread64 (int __fd, void *const __clang_pass_object_size0 __buf,                 ^
-1 error generated.
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- iozone.c | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/iozone.c b/iozone.c
-index 090dd5f..fdea400 100644
---- a/iozone.c
-+++ b/iozone.c
-@@ -1267,7 +1267,6 @@ int pit_gettimeofday();
- #ifdef HAVE_ANSIC_C
- #if defined (HAVE_PREAD) && defined(_LARGEFILE64_SOURCE)
- ssize_t pwrite64(); 
--ssize_t pread64(); 
- #endif
- #if !defined(linux)
- char *getenv();
--- 
-2.25.0
-
diff --git a/meta-oe/recipes-benchmark/iozone3/iozone3_506.bb b/meta-oe/recipes-benchmark/iozone3/iozone3_507.bb
similarity index 95%
rename from meta-oe/recipes-benchmark/iozone3/iozone3_506.bb
rename to meta-oe/recipes-benchmark/iozone3/iozone3_507.bb
index 6ab1121efb..8e229499b1 100644
--- a/meta-oe/recipes-benchmark/iozone3/iozone3_506.bb
+++ b/meta-oe/recipes-benchmark/iozone3/iozone3_507.bb
@@ -3,14 +3,13 @@ HOMEPAGE = "http://www.iozone.org/"
 SECTION = "console/tests"
 LICENSE = "iozone3"
 LIC_FILES_CHKSUM = "file://iozone.c;beginline=37;endline=48;md5=7331260091868dcad0f9edea735b5f4b \
-    file://iozone.c;beginline=276;endline=282;md5=77f9ee51e45b57a7e7519c4fa0b4f00b \
+    file://iozone.c;beginline=317;endline=323;md5=77f9ee51e45b57a7e7519c4fa0b4f00b \
 "
 SRC_URI = "http://www.iozone.org/src/current/${BPN}_${PV}.tar \
     file://parallelism.patch \
-    file://0001-let-system-headers-provide-pread64.patch \
     file://copyright.txt \
 "
-SRC_URI[sha256sum] = "114ce5c071873b9a2c7ba6e73d05d5ef7e66564392acbfcdc0b3261db10fcbe7"
+SRC_URI[sha256sum] = "1e8087ada056f5d8018ee0bc76686d416fc2251ed03038055dbd0af78d1e5ce3"
 
 UPSTREAM_CHECK_REGEX = "iozone3_(?P<pver>\d+).tar"
 
-- 
2.34.1


