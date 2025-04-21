Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3A7AC369AB
	for <webhook@archiver.kernel.org>; Mon, 21 Apr 2025 10:39:36 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.12469.1745231973501381363
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Apr 2025 03:39:33 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=620617753d=yogita.urade@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53LA0UJU001879
	for <openembedded-devel@lists.openembedded.org>; Mon, 21 Apr 2025 03:39:32 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 464bbk9c5c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 21 Apr 2025 03:39:32 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Mon, 21 Apr 2025 03:39:30 -0700
From: yurade <yogita.urade@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][kirkstone][PATCH 1/2] poppler: fix CVE-2025-32364
Date: Mon, 21 Apr 2025 10:39:08 +0000
Message-ID: <20250421103909.1474917-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: cOQXhRGI-e5Jqvm0h3-b-qGMQ_GX65au
X-Proofpoint-ORIG-GUID: cOQXhRGI-e5Jqvm0h3-b-qGMQ_GX65au
X-Authority-Analysis: v=2.4 cv=P446hjAu c=1 sm=1 tr=0 ts=68062064 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=HCiNrPZc1L8A:10 a=XR8D0OoHHMoA:10 a=PYnjg3YJAAAA:8 a=e5mUnYsNAAAA:8 a=t7CeM3EgAAAA:8 a=3fyaaF4VAAAA:8
 a=tW0ZLbnoa10BR6g73WMA:9 a=Vxmtnl_E_bksehYqCbjh:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-21_05,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 impostorscore=0 clxscore=1015
 suspectscore=0 priorityscore=1501 mlxlogscore=803 malwarescore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504210082
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Apr 2025 10:39:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117002

From: Yogita Urade <yogita.urade@windriver.com>

A floating-point exception in the PSStack::roll function of
Poppler before 25.04.0 can cause an application to crash when
handling malformed inputs associated with INT_MIN.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2025-32364

Upstream patch:
https://gitlab.freedesktop.org/poppler/poppler/-/commit/d87bc726c7cc98f8c26b60ece5f20236e9de1bc3

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 .../poppler/poppler/CVE-2025-32364.patch      | 28 +++++++++++++++++++
 .../poppler/poppler_22.04.0.bb                |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta-oe/recipes-support/poppler/poppler/CVE-2025-32364.patch

diff --git a/meta-oe/recipes-support/poppler/poppler/CVE-2025-32364.patch b/meta-oe/recipes-support/poppler/poppler/CVE-2025-32364.patch
new file mode 100644
index 0000000000..fa4310e6af
--- /dev/null
+++ b/meta-oe/recipes-support/poppler/poppler/CVE-2025-32364.patch
@@ -0,0 +1,28 @@
+From d87bc726c7cc98f8c26b60ece5f20236e9de1bc3 Mon Sep 17 00:00:00 2001
+From: Albert Astals Cid <aacid@kde.org>
+Date: Mon, 24 Mar 2025 00:44:54 +0100
+Subject: [PATCH] PSStack::roll: Protect against doing int = -INT_MIN
+
+CVE: CVE-2025-32364
+Upstream-Status: Backport [https://gitlab.freedesktop.org/poppler/poppler/-/commit/d87bc726c7cc98f8c26b60ece5f20236e9de1bc3]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ poppler/Function.cc | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/poppler/Function.cc b/poppler/Function.cc
+index b97ad71..3ee99d6 100644
+--- a/poppler/Function.cc
++++ b/poppler/Function.cc
+@@ -1066,7 +1066,7 @@ void PSStack::roll(int n, int j)
+     PSObject obj;
+     int i, k;
+
+-    if (unlikely(n == 0)) {
++    if (unlikely(n == 0 || j == INT_MIN)) {
+         return;
+     }
+     if (j >= 0) {
+--
+2.40.0
diff --git a/meta-oe/recipes-support/poppler/poppler_22.04.0.bb b/meta-oe/recipes-support/poppler/poppler_22.04.0.bb
index af6ee67496..2bbf542eaa 100644
--- a/meta-oe/recipes-support/poppler/poppler_22.04.0.bb
+++ b/meta-oe/recipes-support/poppler/poppler_22.04.0.bb
@@ -11,6 +11,7 @@ SRC_URI = "http://poppler.freedesktop.org/${BP}.tar.xz \
            file://CVE-2024-6239-0001.patch \
            file://CVE-2024-6239-0002.patch \
            file://CVE-2024-56378.patch \
+           file://CVE-2025-32364.patch \
            "
 SRC_URI[sha256sum] = "813fb4b90e7bda63df53205c548602bae728887a60f4048aae4dbd9b1927deff"
 
-- 
2.40.0


