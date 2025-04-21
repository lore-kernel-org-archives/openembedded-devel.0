Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9022BC369C2
	for <webhook@archiver.kernel.org>; Mon, 21 Apr 2025 10:39:46 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.12470.1745231976378799276
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Apr 2025 03:39:36 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=620617753d=yogita.urade@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53L9kdEq031223
	for <openembedded-devel@lists.openembedded.org>; Mon, 21 Apr 2025 10:39:35 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 464121hr0t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 21 Apr 2025 10:39:35 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Mon, 21 Apr 2025 03:39:32 -0700
From: yurade <yogita.urade@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][kirkstone][PATCH 2/2] poppler: fix CVE-2025-32365
Date: Mon, 21 Apr 2025 10:39:09 +0000
Message-ID: <20250421103909.1474917-2-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250421103909.1474917-1-yogita.urade@windriver.com>
References: <20250421103909.1474917-1-yogita.urade@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Authority-Analysis: v=2.4 cv=QZNmvtbv c=1 sm=1 tr=0 ts=68062067 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=HCiNrPZc1L8A:10 a=XR8D0OoHHMoA:10 a=PYnjg3YJAAAA:8 a=e5mUnYsNAAAA:8 a=t7CeM3EgAAAA:8 a=3fyaaF4VAAAA:8
 a=MqtIDRdRqMlizm5S7zgA:9 a=Vxmtnl_E_bksehYqCbjh:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: o23rdl_fp-D4GfVySVz7R_TYL5SvVCRo
X-Proofpoint-ORIG-GUID: o23rdl_fp-D4GfVySVz7R_TYL5SvVCRo
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-21_05,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 mlxlogscore=999 suspectscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 mlxscore=0 bulkscore=0 spamscore=0
 phishscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504210082
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Apr 2025 10:39:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117003

From: Yogita Urade <yogita.urade@windriver.com>

Poppler before 25.04.0 allows crafted input files to trigger
out-of-bounds reads in the JBIG2Bitmap::combine function in
JBIG2Stream.cc because of a misplaced isOk check.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2025-32365

Upstream patch:
https://gitlab.freedesktop.org/poppler/poppler/-/commit/1f151565bbca5be7449ba8eea6833051cc1baa41

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 .../poppler/poppler/CVE-2025-32365.patch      | 41 +++++++++++++++++++
 .../poppler/poppler_22.04.0.bb                |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta-oe/recipes-support/poppler/poppler/CVE-2025-32365.patch

diff --git a/meta-oe/recipes-support/poppler/poppler/CVE-2025-32365.patch b/meta-oe/recipes-support/poppler/poppler/CVE-2025-32365.patch
new file mode 100644
index 0000000000..d8cda9c1c3
--- /dev/null
+++ b/meta-oe/recipes-support/poppler/poppler/CVE-2025-32365.patch
@@ -0,0 +1,41 @@
+From 1f151565bbca5be7449ba8eea6833051cc1baa41 Mon Sep 17 00:00:00 2001
+From: Albert Astals Cid <aacid@kde.org>
+Date: Mon, 31 Mar 2025 14:35:49 +0200
+Subject: [PATCH] Move isOk check to inside JBIG2Bitmap::combine
+
+CVE: CVE-2025-32365
+Upstream-Status: Backport [https://gitlab.freedesktop.org/poppler/poppler/-/commit/1f151565bbca5be7449ba8eea6833051cc1baa41]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ poppler/JBIG2Stream.cc | 8 +++++---
+ 1 file changed, 5 insertions(+), 3 deletions(-)
+
+diff --git a/poppler/JBIG2Stream.cc b/poppler/JBIG2Stream.cc
+index b9a62e1..9cc3b82 100644
+--- a/poppler/JBIG2Stream.cc
++++ b/poppler/JBIG2Stream.cc
+@@ -767,6 +767,10 @@ void JBIG2Bitmap::combine(JBIG2Bitmap *bitmap, int x, int y, unsigned int combOp
+     unsigned int src0, src1, src, dest, s1, s2, m1, m2, m3;
+     bool oneByte;
+
++    if (unlikely(!isOk())) {
++        return;
++    }
++
+     // check for the pathological case where y = -2^31
+     if (y < -0x7fffffff) {
+         return;
+@@ -2198,9 +2202,7 @@ void JBIG2Stream::readTextRegionSeg(unsigned int segNum, bool imm, bool lossless
+             if (pageH == 0xffffffff && y + h > curPageH) {
+                 pageBitmap->expand(y + h, pageDefPixel);
+             }
+-            if (pageBitmap->isOk()) {
+-                pageBitmap->combine(bitmap.get(), x, y, extCombOp);
+-            }
++            pageBitmap->combine(bitmap.get(), x, y, extCombOp);
+
+             // store the region bitmap
+         } else {
+--
+2.40.0
diff --git a/meta-oe/recipes-support/poppler/poppler_22.04.0.bb b/meta-oe/recipes-support/poppler/poppler_22.04.0.bb
index 2bbf542eaa..494308b8a5 100644
--- a/meta-oe/recipes-support/poppler/poppler_22.04.0.bb
+++ b/meta-oe/recipes-support/poppler/poppler_22.04.0.bb
@@ -12,6 +12,7 @@ SRC_URI = "http://poppler.freedesktop.org/${BP}.tar.xz \
            file://CVE-2024-6239-0002.patch \
            file://CVE-2024-56378.patch \
            file://CVE-2025-32364.patch \
+           file://CVE-2025-32365.patch \
            "
 SRC_URI[sha256sum] = "813fb4b90e7bda63df53205c548602bae728887a60f4048aae4dbd9b1927deff"
 
-- 
2.40.0


