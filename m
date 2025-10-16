Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9343ECCD194
	for <webhook@archiver.kernel.org>; Thu, 16 Oct 2025 06:18:59 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.2037.1760595536955482245
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Oct 2025 23:18:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ZVG4UZrF;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2384195b5c=yogita.urade@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59G5U2Db1089553
	for <openembedded-devel@lists.openembedded.org>; Thu, 16 Oct 2025 06:18:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=QHu7w1VJOKb3MkLXxxgT
	7OS1jMbDU7nru7SjsYjyLRc=; b=ZVG4UZrFNT9zFSZGBeBkF2NRV4qFmNdYSKHF
	B4nmiquKQup96m5tqBTlniLN27eeKvflntveywWFxAkKDhYW4B3bBPXJ1DxpPgFc
	eI2HJF49IaWjFpasIhZy57OxbzBAy/MapX0MMugUSofapxsoc+MTu1VrBpqqvX9R
	LLd9rebAXU6nz7yE4lIFjZQwVQDICxSUqtKHCRtTyAdbtXrGqFHSEG3KnFNCgu92
	zpx2zEZNaqfGnQyuluG38Syq7BbcHPjUXF8hvivtL0aOaR/WVmTUGQ8KF2YKoQbR
	tIkUwXl2hdYxR0FATk54Ss4fXVN3TxegkJ2/PJ/1QMhgfBqEMg==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49qcewny84-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 16 Oct 2025 06:18:55 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Wed, 15 Oct 2025 23:18:53 -0700
From: yurade <yogita.urade@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][kirkstone][PATCH 1/1] poppler: fix CVE-2025-52885
Date: Thu, 16 Oct 2025 11:48:25 +0530
Message-ID: <20251016061825.1514448-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.11.232.110]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) To
 ala-exchng01.corp.ad.wrs.com (10.11.224.121)
X-Proofpoint-GUID: mYus--nvoP-4VhqoqyqxFHoE6aGMY8u_
X-Proofpoint-ORIG-GUID: mYus--nvoP-4VhqoqyqxFHoE6aGMY8u_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE2MDA0NyBTYWx0ZWRfX0fXPkUNvexBj
 apjF8+8b6z5cFs3v2G1O6wtUTIsQYdoSnXHGGFRcdNCNEWI4np75XcEdEI3lkpMlsXq3yBCGPAE
 i7V++BvMc4Ub9vHT6Z39c5QjWeZl2dlwcFLaDPb/9+0c4EPkiJ21M5IswI2k175WeW3p3c+C46c
 HIk7CLtstgBQTTvDnuK81QIq/zz/VDlTAvZSIRACQVCy4nvItrl7QosAe40WQkfdJdWmjZ2xaWq
 QL58S839/4jTNiM6XclwC7epFRJkYafFXJC83QD+nWcoNcllpgLEyedox7ZaFWIA9pG1MPh+FJ7
 uP57NpbyIrXyjMivoH36gBC657QjpHQNEuwLOgTW7aE13/NCZjYI8e5lOktqZAbD4WmGFCqeNnc
 748qvjNA6T23JgGOfhYPhmFZF9JAyA==
X-Authority-Analysis: v=2.4 cv=M+xA6iws c=1 sm=1 tr=0 ts=68f08e4f cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=gmxlzscTznEA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=PYnjg3YJAAAA:8 a=e5mUnYsNAAAA:8 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8
 a=ctjzhJtuCZY7hVibU10A:9 a=Vxmtnl_E_bksehYqCbjh:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-16_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510160047
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Oct 2025 06:18:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120716

From: Yogita Urade <yogita.urade@windriver.com>

Poppler ia a library for rendering PDF files, and examining or
modifying their structure. A use-after-free (write) vulnerability
has been detected in versions Poppler prior to 25.10.0 within the
StructTreeRoot class. The issue arises from the use of raw pointers
to elements of a `std::vector`, which can lead to dangling pointers
when the vector is resized. The vulnerability stems from the way that
refToParentMap stores references to `std::vector` elements using raw
pointers. These pointers may become invalid when the vector is resized.
This vulnerability is a common security problem involving the use of
raw pointers to `std::vectors`. Internally, `std::vector `stores its
elements in a dynamically allocated array. When the array reaches its
capacity and a new element is added, the vector reallocates a larger
block of memory and moves all the existing elements to the new location.
At this point if any pointers to elements are stored before a resize
occurs, they become dangling pointers once the reallocation happens.
Version 25.10.0 contains a patch for the issue.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2025-52885

Upstream patch:
https://gitlab.freedesktop.org/poppler/poppler/-/commit/4ce27cc826bf90cc8dbbd8a8c87bd913cccd7ec0

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 .../poppler/poppler/CVE-2025-52885.patch      | 30 +++++++++++++++++++
 .../poppler/poppler_22.04.0.bb                |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta-oe/recipes-support/poppler/poppler/CVE-2025-52885.patch

diff --git a/meta-oe/recipes-support/poppler/poppler/CVE-2025-52885.patch b/meta-oe/recipes-support/poppler/poppler/CVE-2025-52885.patch
new file mode 100644
index 0000000000..a48b2c01a6
--- /dev/null
+++ b/meta-oe/recipes-support/poppler/poppler/CVE-2025-52885.patch
@@ -0,0 +1,30 @@
+From 4ce27cc826bf90cc8dbbd8a8c87bd913cccd7ec0 Mon Sep 17 00:00:00 2001
+From: Kevin Backhouse <kevinbackhouse@github.com>
+Date: Wed, 3 Sep 2025 14:36:54 +0100
+Subject: [PATCH] Check for duplicate entries
+
+CVE: CVE-2025-52885
+Upstream-Status: Backport [https://gitlab.freedesktop.org/poppler/poppler/-/commit/4ce27cc826bf90cc8dbbd8a8c87bd913cccd7ec0]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ poppler/StructTreeRoot.cc | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/poppler/StructTreeRoot.cc b/poppler/StructTreeRoot.cc
+index 47adac9..10db9aa 100644
+--- a/poppler/StructTreeRoot.cc
++++ b/poppler/StructTreeRoot.cc
+@@ -137,6 +137,10 @@ void StructTreeRoot::parseNumberTreeNode(Dict *node)
+                 }
+                 int keyVal = key.getInt();
+                 std::vector<Parent> &vec = parentTree[keyVal];
++                if (!vec.empty()) {
++                    error(errSyntaxError, -1, "Nums item at position {0:d} is a duplicate entry for key {1:d}", i, keyVal);
++                    continue;
++                }
+
+                 Object valueArray = nums.arrayGet(i + 1);
+                 if (valueArray.isArray()) {
+--
+2.40.0
diff --git a/meta-oe/recipes-support/poppler/poppler_22.04.0.bb b/meta-oe/recipes-support/poppler/poppler_22.04.0.bb
index 0c4efab918..3861bbbb2b 100644
--- a/meta-oe/recipes-support/poppler/poppler_22.04.0.bb
+++ b/meta-oe/recipes-support/poppler/poppler_22.04.0.bb
@@ -20,6 +20,7 @@ SRC_URI = "http://poppler.freedesktop.org/${BP}.tar.xz \
            file://CVE-2025-52886-0003.patch \
            file://CVE-2025-52886-0004.patch \
            file://CVE-2025-43718.patch \
+           file://CVE-2025-52885.patch \
            "
 SRC_URI[sha256sum] = "813fb4b90e7bda63df53205c548602bae728887a60f4048aae4dbd9b1927deff"
 
-- 
2.40.0


