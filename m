Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41D9DC02181
	for <webhook@archiver.kernel.org>; Wed, 22 Jan 2025 05:00:28 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.35988.1737522026565603886
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Jan 2025 21:00:26 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=31172c7a84=yogita.urade@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50M3wIgp016447
	for <openembedded-devel@lists.openembedded.org>; Tue, 21 Jan 2025 21:00:26 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44aqjg84px-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 21 Jan 2025 21:00:26 -0800 (PST)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Tue, 21 Jan 2025 21:00:23 -0800
From: yurade <yogita.urade@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][scarthgap][PATCH 1/1] poppler: fix CVE-2024-56378
Date: Wed, 22 Jan 2025 05:00:04 +0000
Message-ID: <20250122050004.1172584-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: FOjV7Dq0BCTJ8QaDHikRA_rL3UWn8dll
X-Proofpoint-ORIG-GUID: FOjV7Dq0BCTJ8QaDHikRA_rL3UWn8dll
X-Authority-Analysis: v=2.4 cv=d7QPyQjE c=1 sm=1 tr=0 ts=67907b6a cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=HCiNrPZc1L8A:10 a=VdSt8ZQiCzkA:10 a=PYnjg3YJAAAA:8 a=e5mUnYsNAAAA:8 a=t7CeM3EgAAAA:8 a=3fyaaF4VAAAA:8
 a=6VemWM0d_1GYB7LaR6kA:9 a=Vxmtnl_E_bksehYqCbjh:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-22_01,2025-01-21_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 bulkscore=0 mlxlogscore=796 mlxscore=0 phishscore=0 clxscore=1015
 suspectscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2501220035
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Jan 2025 05:00:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115012

From: Yogita Urade <yogita.urade@windriver.com>

libpoppler.so in Poppler through 24.12.0 has an out-of-bounds
read vulnerability within the JBIG2Bitmap::combine function
in JBIG2Stream.cc.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2024-56378

Upstream patch:
https://gitlab.freedesktop.org/poppler/poppler/-/commit/ade9b5ebed44b0c15522c27669ef6cdf93eff84e

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 .../poppler/poppler/CVE-2024-56378.patch      | 77 +++++++++++++++++++
 .../poppler/poppler_23.04.0.bb                |  1 +
 2 files changed, 78 insertions(+)
 create mode 100644 meta-oe/recipes-support/poppler/poppler/CVE-2024-56378.patch

diff --git a/meta-oe/recipes-support/poppler/poppler/CVE-2024-56378.patch b/meta-oe/recipes-support/poppler/poppler/CVE-2024-56378.patch
new file mode 100644
index 000000000..f94b8fed1
--- /dev/null
+++ b/meta-oe/recipes-support/poppler/poppler/CVE-2024-56378.patch
@@ -0,0 +1,77 @@
+From ade9b5ebed44b0c15522c27669ef6cdf93eff84e Mon Sep 17 00:00:00 2001
+From: Albert Astals Cid <aacid@kde.org>
+Date: Tue, 17 Dec 2024 18:59:01 +0100
+Subject: [PATCH] JBIG2Bitmap::combine: Fix crash on malformed files
+
+Fixes #1553
+
+CVE: CVE-2024-56378
+Upstream-Status: Backport [https://gitlab.freedesktop.org/poppler/poppler/-/commit/ade9b5ebed44b0c15522c27669ef6cdf93eff84e]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ poppler/JBIG2Stream.cc | 15 +++++++++------
+ 1 file changed, 9 insertions(+), 6 deletions(-)
+
+diff --git a/poppler/JBIG2Stream.cc b/poppler/JBIG2Stream.cc
+index 77ffeb2..bdc51d0 100644
+--- a/poppler/JBIG2Stream.cc
++++ b/poppler/JBIG2Stream.cc
+@@ -765,7 +765,7 @@ void JBIG2Bitmap::duplicateRow(int yDest, int ySrc)
+
+ void JBIG2Bitmap::combine(JBIG2Bitmap *bitmap, int x, int y, unsigned int combOp)
+ {
+-    int x0, x1, y0, y1, xx, yy;
++    int x0, x1, y0, y1, xx, yy, yyy;
+     unsigned char *srcPtr, *destPtr;
+     unsigned int src0, src1, src, dest, s1, s2, m1, m2, m3;
+     bool oneByte;
+@@ -812,14 +812,17 @@ void JBIG2Bitmap::combine(JBIG2Bitmap *bitmap, int x, int y, unsigned int combOp
+     oneByte = x0 == ((x1 - 1) & ~7);
+
+     for (yy = y0; yy < y1; ++yy) {
+-        if (unlikely((y + yy >= h) || (y + yy < 0))) {
++        if (unlikely(checkedAdd(y, yy, &yyy))) {
++            continue;
++        }
++        if (unlikely((yyy >= h) || (yyy < 0))) {
+             continue;
+         }
+
+         // one byte per line -- need to mask both left and right side
+         if (oneByte) {
+             if (x >= 0) {
+-                destPtr = data + (y + yy) * line + (x >> 3);
++                destPtr = data + yyy * line + (x >> 3);
+                 srcPtr = bitmap->data + yy * bitmap->line;
+                 dest = *destPtr;
+                 src1 = *srcPtr;
+@@ -842,7 +845,7 @@ void JBIG2Bitmap::combine(JBIG2Bitmap *bitmap, int x, int y, unsigned int combOp
+                 }
+                 *destPtr = dest;
+             } else {
+-                destPtr = data + (y + yy) * line;
++                destPtr = data + yyy * line;
+                 srcPtr = bitmap->data + yy * bitmap->line + (-x >> 3);
+                 dest = *destPtr;
+                 src1 = *srcPtr;
+@@ -872,7 +875,7 @@ void JBIG2Bitmap::combine(JBIG2Bitmap *bitmap, int x, int y, unsigned int combOp
+
+             // left-most byte
+             if (x >= 0) {
+-                destPtr = data + (y + yy) * line + (x >> 3);
++                destPtr = data + yyy * line + (x >> 3);
+                 srcPtr = bitmap->data + yy * bitmap->line;
+                 src1 = *srcPtr++;
+                 dest = *destPtr;
+@@ -896,7 +899,7 @@ void JBIG2Bitmap::combine(JBIG2Bitmap *bitmap, int x, int y, unsigned int combOp
+                 *destPtr++ = dest;
+                 xx = x0 + 8;
+             } else {
+-                destPtr = data + (y + yy) * line;
++                destPtr = data + yyy * line;
+                 srcPtr = bitmap->data + yy * bitmap->line + (-x >> 3);
+                 src1 = *srcPtr++;
+                 xx = x0;
+--
+2.40.0
diff --git a/meta-oe/recipes-support/poppler/poppler_23.04.0.bb b/meta-oe/recipes-support/poppler/poppler_23.04.0.bb
index e57760d85..e76692bbe 100644
--- a/meta-oe/recipes-support/poppler/poppler_23.04.0.bb
+++ b/meta-oe/recipes-support/poppler/poppler_23.04.0.bb
@@ -11,6 +11,7 @@ SRC_URI = "http://poppler.freedesktop.org/${BP}.tar.xz \
            file://CVE-2023-34872.patch \
            file://CVE-2024-6239-0001.patch \
            file://CVE-2024-6239-0002.patch \
+           file://CVE-2024-56378.patch \
            "
 SRC_URI[sha256sum] = "b6d893dc7dcd4138b9e9df59a13c59695e50e80dc5c2cacee0674670693951a1"
 
-- 
2.40.0


