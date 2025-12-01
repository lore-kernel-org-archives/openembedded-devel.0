Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0585D116F9
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 09:00:18 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17354.1764579617457461124
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Dec 2025 01:00:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=LjcraN6B;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4430d93b62=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B18HDpp1516604
	for <openembedded-devel@lists.openembedded.org>; Mon, 1 Dec 2025 01:00:17 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=4qcubzO4AQWyycOQx7GbAkt2hhwtBY1cMK4DCG+Kelk=; b=LjcraN6B4jBU
	QWr3pa9onNWvrBAaP0P7TqY7VRl/QvEMoAF7PsoqaTSUbTWLBVcDRN6Q1EJ86sDF
	aXljU2y/GYf9hOgG5SiSnSsrqyTvRmgfT+ybgqd+Uo/aUl/JuYaUROAooG6ehh6x
	1EDoG0ifFL04Uro5LOIEDn1FXAISpElDDfM5St9dgyHCZqv3u1bBDtQxiuDIa6SX
	jMu3HGQpmO3shegVdBSU3fNECc8uVG1qEyl12fglVuABc5gMwtl+4YEe1tUjOxZ+
	FUbuLgm6kOHpbCXQhhW+qeXCGeUhvPeKMVwuiC7LUmmjE5CYsVzjsqlDIHiR0JG9
	VDa+U8ZOPw==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aqw05hfav-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 01 Dec 2025 01:00:16 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Mon, 1 Dec 2025 01:00:16 -0800
Received: from pek-lpg-core1.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Mon, 1 Dec 2025 01:00:15 -0800
From: <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH 2/4] python3-tinycss2: Add it for python3-cssselect2
Date: Mon, 1 Dec 2025 17:00:10 +0800
Message-ID: <07fd13d7e60c18d4d042e3bade1a52e2f4e2fd4f.1764579434.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.44.3
In-Reply-To: <cover.1764579434.git.liezhi.yang@windriver.com>
References: <cover.1764579434.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: IcopXT8TRlkWekdr-s0QdXbgasATETFn
X-Authority-Analysis: v=2.4 cv=ddyNHHXe c=1 sm=1 tr=0 ts=692d5920 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8
 a=IpicNcrxtlnwOPdi3tsA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: IcopXT8TRlkWekdr-s0QdXbgasATETFn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAxMDA3MSBTYWx0ZWRfX5X3esXgsOZyi
 9eihMB0CKtoU5H2mb1ekHxq6FdcdQufb73y70ESWmsHZvyU+h6nLONbuHqBuBeYrpSC+OVXAt24
 3FjSfsQztj2t2FMxQ0zwGqFfAkP0DKH2FNRAPWl9Ceg9v6C6LQu5i4e/C6cjZB1ASYp5UBgGWSf
 1j+VhNyae4XRz080rCy8RuQ2bxrw64WUcccg80Xs+lIFtXdxaTMlDAepm+6GRuNygeVTiaQKEJe
 wmTQZTB//TM0QjUSQFQy0OlGx6bKPWor/8xD7klGJJgwTW2cIKZC7r04G5XabZDSc6ZQE7KAiU3
 SCs9pO6o+u1kSugYVym/7a9OYsvJYm6uJRIXfdGhv0p4NbtjJH69aJWO4G3140TpLyvrSvFv71W
 g1zoolWyZYmv6JizBxJ83t4mT+YtgQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 phishscore=0
 clxscore=1011 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512010071
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Dec 2025 09:00:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122196

From: Robert Yang <liezhi.yang@windriver.com>

Tinycss2 is a low-level CSS parser and generator written in
Python: it can parse strings, return objects representing tokens and blocks,
and generate CSS strings corresponding to these objects.
---
 .../python/python3-tinycss2_1.5.1.bb                | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-tinycss2_1.5.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-tinycss2_1.5.1.bb b/meta-python/recipes-devtools/python/python3-tinycss2_1.5.1.bb
new file mode 100644
index 0000000000..c75c741368
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-tinycss2_1.5.1.bb
@@ -0,0 +1,13 @@
+SUMMARY = "A tiny CSS parser"
+DESCRIPTION = "Tinycss2 is a low-level CSS parser and generator written in \
+Python: it can parse strings, return objects representing tokens and blocks, \
+and generate CSS strings corresponding to these objects."
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1d072d7e30e34f33f8ae956ada04fa2c"
+
+SRC_URI[sha256sum] = "d339d2b616ba90ccce58da8495a78f46e55d4d25f9fd71dfd526f07e7d53f957"
+
+inherit pypi python_setuptools_build_meta
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.44.3


