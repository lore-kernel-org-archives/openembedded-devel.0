Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7052E77199
	for <webhook@archiver.kernel.org>; Thu,  9 Jan 2025 12:25:58 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.46248.1736425553701055104
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Jan 2025 04:25:53 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3104fa28d1=yogita.urade@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 509CGjxC032133
	for <openembedded-devel@lists.openembedded.org>; Thu, 9 Jan 2025 04:25:53 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 441fkp9qtt-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 09 Jan 2025 04:25:53 -0800 (PST)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Thu, 9 Jan 2025 04:25:50 -0800
From: yurade <yogita.urade@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][kirkstone][PATCH 2/2] poppler: fix CVE-2024-56378
Date: Thu, 9 Jan 2025 12:25:27 +0000
Message-ID: <20250109122527.2043624-2-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250109122527.2043624-1-yogita.urade@windriver.com>
References: <20250109122527.2043624-1-yogita.urade@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Authority-Analysis: v=2.4 cv=XZxzzJ55 c=1 sm=1 tr=0 ts=677fc051 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=HCiNrPZc1L8A:10 a=VdSt8ZQiCzkA:10 a=PYnjg3YJAAAA:8 a=e5mUnYsNAAAA:8 a=t7CeM3EgAAAA:8 a=3fyaaF4VAAAA:8
 a=hi-X94-AQt7m0rznYMgA:9 a=Vxmtnl_E_bksehYqCbjh:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: CqZ2ouXGpvSKIkTYfn951kAaK0JmtoVJ
X-Proofpoint-GUID: CqZ2ouXGpvSKIkTYfn951kAaK0JmtoVJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-09_05,2025-01-09_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 adultscore=0 mlxlogscore=837 spamscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2501090098
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Jan 2025 12:25:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114750

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
 .../poppler/poppler/CVE-2024-56378.patch      | 78 +++++++++++++++++++
 .../poppler/poppler_22.04.0.bb                |  1 +
 2 files changed, 79 insertions(+)
 create mode 100644 meta-oe/recipes-support/poppler/poppler/CVE-2024-56378.patch

diff --git a/meta-oe/recipes-support/poppler/poppler/CVE-2024-56378.patch b/meta-oe/recipes-support/poppler/poppler/CVE-2024-56378.patch
new file mode 100644
index 000000000..9f6970241
--- /dev/null
+++ b/meta-oe/recipes-support/poppler/poppler/CVE-2024-56378.patch
@@ -0,0 +1,78 @@
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
+index 2276b5c..b9a62e1 100644
+--- a/poppler/JBIG2Stream.cc
++++ b/poppler/JBIG2Stream.cc
+@@ -762,7 +762,7 @@ void JBIG2Bitmap::duplicateRow(int yDest, int ySrc)
+ 
+ void JBIG2Bitmap::combine(JBIG2Bitmap *bitmap, int x, int y, unsigned int combOp)
+ {
+-    int x0, x1, y0, y1, xx, yy;
++    int x0, x1, y0, y1, xx, yy, yyy;
+     unsigned char *srcPtr, *destPtr;
+     unsigned int src0, src1, src, dest, s1, s2, m1, m2, m3;
+     bool oneByte;
+@@ -809,14 +809,17 @@ void JBIG2Bitmap::combine(JBIG2Bitmap *bitmap, int x, int y, unsigned int combOp
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
+@@ -839,7 +842,7 @@ void JBIG2Bitmap::combine(JBIG2Bitmap *bitmap, int x, int y, unsigned int combOp
+                 }
+                 *destPtr = dest;
+             } else {
+-                destPtr = data + (y + yy) * line;
++                destPtr = data + yyy * line;
+                 srcPtr = bitmap->data + yy * bitmap->line + (-x >> 3);
+                 dest = *destPtr;
+                 src1 = *srcPtr;
+@@ -869,7 +872,7 @@ void JBIG2Bitmap::combine(JBIG2Bitmap *bitmap, int x, int y, unsigned int combOp
+ 
+             // left-most byte
+             if (x >= 0) {
+-                destPtr = data + (y + yy) * line + (x >> 3);
++                destPtr = data + yyy * line + (x >> 3);
+                 srcPtr = bitmap->data + yy * bitmap->line;
+                 src1 = *srcPtr++;
+                 dest = *destPtr;
+@@ -893,7 +896,7 @@ void JBIG2Bitmap::combine(JBIG2Bitmap *bitmap, int x, int y, unsigned int combOp
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
+
diff --git a/meta-oe/recipes-support/poppler/poppler_22.04.0.bb b/meta-oe/recipes-support/poppler/poppler_22.04.0.bb
index f49571caa..af6ee6749 100644
--- a/meta-oe/recipes-support/poppler/poppler_22.04.0.bb
+++ b/meta-oe/recipes-support/poppler/poppler_22.04.0.bb
@@ -10,6 +10,7 @@ SRC_URI = "http://poppler.freedesktop.org/${BP}.tar.xz \
            file://CVE-2023-34872.patch \
            file://CVE-2024-6239-0001.patch \
            file://CVE-2024-6239-0002.patch \
+           file://CVE-2024-56378.patch \
            "
 SRC_URI[sha256sum] = "813fb4b90e7bda63df53205c548602bae728887a60f4048aae4dbd9b1927deff"
 
-- 
2.31.3


