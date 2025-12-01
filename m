Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA468D116F8
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 09:00:28 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17357.1764579619444820079
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Dec 2025 01:00:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=lz/ZbX+z;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4430d93b62=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B18s4MK1575484
	for <openembedded-devel@lists.openembedded.org>; Mon, 1 Dec 2025 01:00:19 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=ezPdFQTXz5Nx+MV2K2pbM5aNRsoBPpkh3vUZLfOFf/0=; b=lz/ZbX+zvVwx
	EZwjgwUUMk73oIMhjdleZYo1twbvnmszZunhJ/KFhnMF2V5DGvJFc3CrBOGAcITQ
	4sb/buiAE/ZwX1BU4+Yv6EqXPd9goJe2gkpEl8hvtvsULXi5ivzlVGnqTah80ymS
	SCXIO0/lHCdniKecA8DNZvGZR7ZzaMzbRzp9ai0BHObeMumiVa5y7MIDOglE7+53
	jSD4/a1J6DgVIFK6WXtI1LXKNxB3+dvhECmkDcOTWX1CvDzO641m+CgzzcnBblMP
	mLzch2Cg81FzaWvtblj3JqcQEQa8djlvPp/Q9UDvrkOVvIPMlkZQlKkcLEabGQau
	2MyCtRL5ng==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aqw05hfay-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 01 Dec 2025 01:00:18 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Mon, 1 Dec 2025 01:00:18 -0800
Received: from pek-lpg-core1.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Mon, 1 Dec 2025 01:00:17 -0800
From: <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH 4/4] python3-svglib: Add it
Date: Mon, 1 Dec 2025 17:00:12 +0800
Message-ID: <ee6c2b22bcde13e22d03359f8ecb604f6a54fd31.1764579434.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.44.3
In-Reply-To: <cover.1764579434.git.liezhi.yang@windriver.com>
References: <cover.1764579434.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: QJLxYFSe2wt_ZQsNkTkIObCksExUS2ba
X-Authority-Analysis: v=2.4 cv=ddyNHHXe c=1 sm=1 tr=0 ts=692d5922 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8
 a=h_7jPTo1en-hAqBVujgA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: QJLxYFSe2wt_ZQsNkTkIObCksExUS2ba
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAxMDA3MSBTYWx0ZWRfX1Qr/ftQTMh3D
 N+kJUt83KSCxsqnVSfHtDgQSObEIyiYu2tQKF18NLVKRh9osKYDMae6+tImSqPG3qaTxi/R/9tb
 dNODjom/wki3JJ79mjiFp0WQgxji6J/omRR/SljXdqve7qFoIMowtRVP2kqtfpPptcsF7UAlje6
 iv75JHKT2uDDc4EAb7mAFA+k12/+Qm2tXh54G3QiaoO6+3tCORaQO09akZXhYv/GY1n5GZD7kLN
 aMYSWhInkEk6WBtWjnhfBgVgWssvzKyThCiQ+eQY94fvEqsowon54tMaRJIfsmrgqCzlozjywRz
 xxB//osMu8sSJTe5SzJCh/54drieUL8MCN55zuTIdLPfYOMo4xsvfn35NpinrCxqmRN6dg+YPue
 OxllLVrqlDyJySdqdPEBdf986EVeqg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512010071
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Dec 2025 09:00:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122198

From: Robert Yang <liezhi.yang@windriver.com>

Svglib is a Python library for reading SVG files and converting them (to a
reasonable degree) to other formats using the ReportLab Open Source toolkit.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../python/python3-svglib_1.6.0.bb               | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-svglib_1.6.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-svglib_1.6.0.bb b/meta-python/recipes-devtools/python/python3-svglib_1.6.0.bb
new file mode 100644
index 0000000000..67c072c9a1
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-svglib_1.6.0.bb
@@ -0,0 +1,16 @@
+SUMMARY = "A pure-Python library for reading and converting SVG."
+DESCRIPTION = "Svglib is a Python library for reading SVG files and \
+    converting them (to a reasonable degree) to other formats using the \
+    ReportLab Open Source toolkit."
+
+LICENSE = "LGPL-3.0-or-later"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b52f2d57d10c4f7ee67a7eb9615d5d24"
+
+SRC_URI[sha256sum] = "4c38a274a744ef0d1677f55d5d62fc0fb798819f813e52872a796e615741733d"
+
+inherit pypi python_hatchling
+
+BBCLASSEXTEND = "native nativesdk"
+
+RDEPENDS:${PN} = "python3-pillow python3-html python3-cssselect2 python3-webencodings \
+    python3-lxml"
-- 
2.44.3


