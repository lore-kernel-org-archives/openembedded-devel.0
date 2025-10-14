Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4194ACCD18E
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 10:07:39 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.11771.1760436451520700046
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 03:07:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=EtQBV29g;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=238229c306=yogita.urade@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59E0qfe81587834
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 03:07:31 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=nw4pRgCp/hcPtWC0W6Mm
	tXGtBhrQFluALL2n7cUFJxw=; b=EtQBV29gS9OxOXGXoWuW0cr7aO31yI/DObfP
	idQt2Rqk+3MMsAKi8w86pbss77PKCvqNyihOq82iG5FFROQT0dE4LXVluBRIpNmM
	TZcDHTkg18Z217jO6QrvfyXUxifbwhVvSrhOKCPYekHw/xCT/EQe4LgOPF9bN9dm
	QXQlE9rn/ikupKhp0M5RNH0BiWOy07Df533avTp18K2Bj3UKSqz51CGaWo3A1+SR
	KvAcziJpO9GQcULbucBS6H8MnCCGNxvBoR5r52zq7MYBfxQm6Z3OghH8G+7+si93
	59/HNHBrPzdDeR51ea+jfLD/QFhBcS4AyWa4sPVapETvX9tL0g==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49qprdtnum-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 03:07:30 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Tue, 14 Oct 2025 03:07:29 -0700
From: yurade <yogita.urade@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][kirkstone][PATCH 1/1] poppler: fix CVE-2025-43718
Date: Tue, 14 Oct 2025 15:37:05 +0530
Message-ID: <20251014100705.3102077-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.11.232.110]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (10.11.224.121) To
 ala-exchng01.corp.ad.wrs.com (10.11.224.121)
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE0MDA3OSBTYWx0ZWRfX9oMFIiUYH1C4
 Q8pNRJ0IHOeuxEWuLLJplcrKEcK2RQGKlOEsc1FrXrn3HAhYuzxQ7cSfoCXiZh6dIn68IrqU98a
 ltni7uCbRseDyhhv9a8wNFOsowbU4mUhVZStTp4aIfLL92vxHzY9k+ot0gjkZ7oTVz+rj6pJ6rm
 f5NpsuZKijYOZOwSk4wX42H9IINGWI7c4j+Nh2EMKf9PZ+WllzqqEG4fcFts55697O4pa6DwTD6
 ns4rmWuElWmNGWL9O3CFDyKpqpUViy+/HZ7rrthchuMBSpaBF1fXM35PNYl8sdF/rBGtxLm7ixj
 Iotfwf28Pu4Psq5Xb7sz9UzvFRaj5ATJ9Hwjet3+VVsWdoeHyWnckKwwATYTCfZzxTgQ9x53mpq
 tv340z6lSylMwi77x8jKWcUQzGkNYQ==
X-Proofpoint-GUID: cX_-52ym0lBe6uzOZqHnkgelw18eGidl
X-Authority-Analysis: v=2.4 cv=JaKxbEKV c=1 sm=1 tr=0 ts=68ee20e3 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=gmxlzscTznEA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=PYnjg3YJAAAA:8 a=e5mUnYsNAAAA:8 a=t7CeM3EgAAAA:8 a=3fyaaF4VAAAA:8
 a=lxw-dE6-Go_C1IIk8boA:9 a=Vxmtnl_E_bksehYqCbjh:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: cX_-52ym0lBe6uzOZqHnkgelw18eGidl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 adultscore=0 phishscore=0 clxscore=1015
 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510020000
 definitions=main-2510140079
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 10:07:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120603

From: Yogita Urade <yogita.urade@windriver.com>

Poppler 24.06.1 through 25.x before 25.04.0 allows stack consumption
and a SIGSEGV via deeply nested structures within the metadata (such
as GTS_PDFEVersion) of a PDF document, e.g., a regular expression for
a long pdfsubver string. This occurs in Dict::lookup, Catalog::getMetadata,
and associated functions in PDFDoc, with deep recursion in the regex
executor (std::__detail::_Executor).

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2025-43718

Upstream patch:
https://gitlab.freedesktop.org/poppler/poppler/-/commit/f54b815672117c250420787c8c006de98e8c7408

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 .../poppler/poppler/CVE-2025-43718.patch      | 31 +++++++++++++++++++
 .../poppler/poppler_22.04.0.bb                |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta-oe/recipes-support/poppler/poppler/CVE-2025-43718.patch

diff --git a/meta-oe/recipes-support/poppler/poppler/CVE-2025-43718.patch b/meta-oe/recipes-support/poppler/poppler/CVE-2025-43718.patch
new file mode 100644
index 0000000000..5a1368885c
--- /dev/null
+++ b/meta-oe/recipes-support/poppler/poppler/CVE-2025-43718.patch
@@ -0,0 +1,31 @@
+From f54b815672117c250420787c8c006de98e8c7408 Mon Sep 17 00:00:00 2001
+From: Albert Astals Cid <aacid@kde.org>
+Date: Wed, 26 Mar 2025 11:26:32 +0100
+Subject: [PATCH] Make sure regex doesn't stack overflow by limiting it
+
+Happens with very long pdfsubver strings when compiled with
+-fno-omit-frame-pointer -mno-omit-leaf-frame-pointer -flto=auto
+
+CVE: CVE-2025-43718
+Upstream-Status: Backport [https://gitlab.freedesktop.org/poppler/poppler/-/commit/f54b815672117c250420787c8c006de98e8c7408]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ poppler/PDFDoc.cc | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/poppler/PDFDoc.cc b/poppler/PDFDoc.cc
+index abf6bb6..976bd78 100644
+--- a/poppler/PDFDoc.cc
++++ b/poppler/PDFDoc.cc
+@@ -478,7 +478,7 @@ static PDFSubtypePart pdfPartFromString(PDFSubtype subtype, const std::string &p
+
+ static PDFSubtypeConformance pdfConformanceFromString(const std::string &pdfsubver)
+ {
+-    const std::regex regex("PDF/(?:A|X|VT|E|UA)-[[:digit:]]([[:alpha:]]+)");
++    const std::regex regex("PDF/(?:A|X|VT|E|UA)-[[:digit:]]([[:alpha:]]{1,3})");
+     std::smatch match;
+     PDFSubtypeConformance pdfConf = subtypeConfNone;
+
+--
+2.40.0
diff --git a/meta-oe/recipes-support/poppler/poppler_22.04.0.bb b/meta-oe/recipes-support/poppler/poppler_22.04.0.bb
index c624164560..0c4efab918 100644
--- a/meta-oe/recipes-support/poppler/poppler_22.04.0.bb
+++ b/meta-oe/recipes-support/poppler/poppler_22.04.0.bb
@@ -19,6 +19,7 @@ SRC_URI = "http://poppler.freedesktop.org/${BP}.tar.xz \
            file://CVE-2025-52886-0002.patch \
            file://CVE-2025-52886-0003.patch \
            file://CVE-2025-52886-0004.patch \
+           file://CVE-2025-43718.patch \
            "
 SRC_URI[sha256sum] = "813fb4b90e7bda63df53205c548602bae728887a60f4048aae4dbd9b1927deff"
 
-- 
2.40.0


