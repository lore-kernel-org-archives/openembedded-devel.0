Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED85ECCD195
	for <webhook@archiver.kernel.org>; Fri, 17 Oct 2025 08:31:28 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.10920.1760689885588609513
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Oct 2025 01:31:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=RdRGKgdD;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=238598bdad=yogita.urade@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59H3vpKu1070118
	for <openembedded-devel@lists.openembedded.org>; Fri, 17 Oct 2025 01:31:25 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=2KimHwSQ2ivOuPHPe4mp
	76JUozRnKsqpBf1qh5HtdYU=; b=RdRGKgdDOCySeEZ7ZsAx/1/EYNfXwFFz9MUC
	CszbuVBboxetq3nriTBP70esajE5z32P/CG39XPB6f8T8Ew17cpFLloBZ/RBOGNT
	iMssHUq/fAToqe/rFF//pBr9o68lTFbQ2dCnD6KEm2hkIkg+Z6zvisIxitV2tzlR
	ca4ZD+Q+RsvxGU0tq6a32t7sMskh0tebQs4ZQuw8gOklD/7PSckDGZJT8r6p8bY3
	ZnhRoyMOUMoFtk1/qGKG+VOgQVpkel/Rede5fWbcLaDfbnTbFPL07B58UZRAx12S
	JnchVk2FepbdlmxbnaPxDbHW67h9dqTU9i98eTChLy0Ey3edRQ==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49qprdy15s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 17 Oct 2025 01:31:24 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Fri, 17 Oct 2025 01:31:23 -0700
From: yurade <yogita.urade@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][walnascar][PATCH 1/1] poppler: fix CVE-2025-52885
Date: Fri, 17 Oct 2025 14:01:03 +0530
Message-ID: <20251017083103.1009709-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.11.232.110]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) To
 ala-exchng01.corp.ad.wrs.com (10.11.224.121)
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE3MDA2MiBTYWx0ZWRfXyM66bcdN5mSc
 jwFffErQ6RElQNg/FAEeEDkTZLB5zuttb+duqK5c+JqrdC8lhycrIlYgzJs3I01wUOmHTkY3ezR
 Rcuptk4rKyzQE7PrmD2XY/Bsma4/asyP7KwCvDG1imWAkc9p/uefemTYYIQLjEVWyNxoseqiLLj
 eQDxF0rdQZHOeQepxdmAYl5KmxeOctKDZJMJW2l3pGTHvzVIh9ArUBMb3Il9D40CQztVo8Dpyvr
 Dt6uxetOkNs2gyGGZvhzvgXOXlZzVlocmLbWPd8oKIwdjHIBa0ccsOZ+3+SVHowV7mm11Zh2j9p
 c81y2m29VfX3NcIJo8jqDaqh3reAP86UtDB8A6hcjVltqY6sD6alPKxGPZCOAohD2caUYT6TQL0
 moI+NrQzJeuQlRalMqhdG+DnKDiQmw==
X-Proofpoint-GUID: XZh97yX89KEuf5nXsqzkB1x9CF_z0bVt
X-Authority-Analysis: v=2.4 cv=JaKxbEKV c=1 sm=1 tr=0 ts=68f1fedd cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=gmxlzscTznEA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=PYnjg3YJAAAA:8 a=e5mUnYsNAAAA:8 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8
 a=ctjzhJtuCZY7hVibU10A:9 a=Vxmtnl_E_bksehYqCbjh:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: XZh97yX89KEuf5nXsqzkB1x9CF_z0bVt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 adultscore=0 phishscore=0 clxscore=1015
 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510020000
 definitions=main-2510170062
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Oct 2025 08:31:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120743

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
 .../poppler/poppler_23.04.0.bb                |  1 +
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
diff --git a/meta-oe/recipes-support/poppler/poppler_23.04.0.bb b/meta-oe/recipes-support/poppler/poppler_23.04.0.bb
index c7287f42c5..b56a4cf6b1 100644
--- a/meta-oe/recipes-support/poppler/poppler_23.04.0.bb
+++ b/meta-oe/recipes-support/poppler/poppler_23.04.0.bb
@@ -20,6 +20,7 @@ SRC_URI = "http://poppler.freedesktop.org/${BP}.tar.xz \
            file://CVE-2025-52886-0002.patch \
            file://CVE-2025-50420.patch \
            file://CVE-2025-43718.patch \
+           file://CVE-2025-52885.patch \
            "
 SRC_URI[sha256sum] = "b6d893dc7dcd4138b9e9df59a13c59695e50e80dc5c2cacee0674670693951a1"
 
-- 
2.40.0


