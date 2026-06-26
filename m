Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83D38C43458
	for <webhook@archiver.kernel.org>; Fri, 26 Jun 2026 16:23:48 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38727.1782491022542201775
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Jun 2026 09:23:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=dujS3ZB/;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=UwWRKc3f;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: a-christidis@ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 65QFhor22047016;
	Fri, 26 Jun 2026 11:23:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=VQSZuReX0io7DW8Bk24L0+GzkyoxiA9whN68DpE4l
	6g=; b=dujS3ZB/OxarZws5fNJtaIkM+qOJl2RdlWM+iyY59OEpqXMD+7svMQ187
	kIFddYf5u6pD09zWl8Y0GhsdWfegijFxaKPCHT1pTv4aW1f4/HEslDW1mxor7zgr
	1kschvxcZ7/olxBIpNdOnjq7VMCmEMLtY4uuOfYdRryY0gQxMfcQ9GNWWnxfpmS5
	eYzzg9SUblAuGQVls/TEdIHXcYszdlVP664UPYXlJQjoTqEfnsGBG9KMxnf8mZ0c
	C95y7unhya8R+B710oFUU+/ZLoj5NC7qcvI7A3W/r54mrPy06cKxDor/oZVIj6Ft
	tjCgawiz1teSVy9JK1/AvyfL9Cs0Q==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011002.outbound.protection.outlook.com [52.101.62.2])
	by m0380145.ppops.net (PPS) with ESMTPS id 4f1rc51q0w-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 26 Jun 2026 11:23:41 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xmML0Rlj8fGkgZetpBZhvEZJE4hw96nPxv0Gt3JuohqtCfj9EBrTc0XTg/BFouCLT/IcfZp/8DjjgKfjKb2qlskqbFeqoV2GU6h6XGQQGI9I1W6aUxAx9Yruq3Z963/JpNeB5ingaVwCDj/UGXL3JN4tGVr2hhHEAHOFO83u3SvhVCfKAgphkluEtRVxaWHUbqqH0g5p/XfYe4gRpGXqeQqELiVxIKSoswVeltKKghdxIK0dNz1UQ/rRVHlfD/fFdUV9NCGg9SbWgC5YIHUq9RFumrndcuyAyJIm4uk2dOtgUByzYnfY/R5iys10a0t4B4bPredPA0jSf+gtVYx2MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VQSZuReX0io7DW8Bk24L0+GzkyoxiA9whN68DpE4l6g=;
 b=wwz9MZhMDGSnjigpbSxs/FdKHPCCtgiSTUhnCQbuxxXx6tKDz0laIJ0CcOG1g+WC3BB9Sy4CKK5tIMSCSp2XuWl+e7PteP6/Ciidy+xjNv9RAGE/m6gOAo1UMJ9wj02CDE+Y6H+OS/cjWuPxsvFpgiwZt6hbCT6Q1fDfQ9pZS4U7nJ735CPafhphk4G4FFlwTv6Lg3ku0hrbFXFpUXYrl9kgrSj42Vx7gLBYSeOMFqqJiiiGFf26TrcY8fRUQwJWa2qtfHOq+aVQ6NrOfzKchuw5933FqoZQ+1UzB+bDhPANPZfBuG7JSlYs90YFnu45EriwpPejX+LeB17xrqi3Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VQSZuReX0io7DW8Bk24L0+GzkyoxiA9whN68DpE4l6g=;
 b=UwWRKc3fkevsDycrEHR5d+R/XV5Edt6TV8kbQcYnxm5PwC6cgJD3Qgg9/BMSO8BAfkZuvGNuLqH0GVReN/n0Lh3Ns4n+WS7srKMyLg06nD3M7HUPnLgaUf13Zw9TGEDTKssX6Ucne4/PVpVsRQvaDcXqGakoOIzv+MY/OSt5VfY=
Received: from PH0PR07CA0012.namprd07.prod.outlook.com (2603:10b6:510:5::17)
 by CY8PR10MB7148.namprd10.prod.outlook.com (2603:10b6:930:71::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.17; Fri, 26 Jun
 2026 16:23:34 +0000
Received: from SN1PEPF000252A2.namprd05.prod.outlook.com
 (2603:10b6:510:5:cafe::99) by PH0PR07CA0012.outlook.office365.com
 (2603:10b6:510:5::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.17 via Frontend Transport; Fri,
 26 Jun 2026 16:23:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SN1PEPF000252A2.mail.protection.outlook.com (10.167.242.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Fri, 26 Jun 2026 16:23:34 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 26 Jun
 2026 11:23:27 -0500
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 26 Jun
 2026 11:23:27 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 26 Jun 2026 11:23:27 -0500
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.75.243])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65QGNRmR1979658;
	Fri, 26 Jun 2026 11:23:27 -0500
From: <a-christidis@ti.com>
To: <khem.raj@oss.qualcomm.com>
CC: <reatmon@ti.com>, <openembedded-devel@lists.openembedded.org>
Subject: [meta-to][master][PATCH 2/2] opencl-cts: enforce -Werror flags and fix upstream build warnings
Date: Fri, 26 Jun 2026 11:23:27 -0500
Message-ID: <20260626162327.1416326-3-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260626162327.1416326-1-a-christidis@ti.com>
References: <20260626162327.1416326-1-a-christidis@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A2:EE_|CY8PR10MB7148:EE_
X-MS-Office365-Filtering-Correlation-Id: 00583e29-a84d-4fac-b8e1-08ded39f4501
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|23010399003|82310400026|376014|1800799024|6133799003|22082099003|18002099003|56012099006|3023799007|13003099007;
X-Microsoft-Antispam-Message-Info: 
	jC2imE1Pke7LaqgkirDWI9G3kLR1C16t+Bbc75h974ULv4MzGV+x2Hu9HBDCX+eqajvF4IxVmZ9S6Hh19Yfpkc2flF0jOooAflkjGZvltP5AA8pT/a4yg0xav7ovWATu3vQVMPEvPGEXKspziIbkRTUjstaGQyXZUjFtQ0pVIjfJmy1/0wh4riL1CIspIya5hG6KX4CC+gMQ2y/fODy3Y0FRueU1x0OXjHUE3CwGcjlJ6NFem+XwUAAbMhNA5pmj40d8pkpmM/wx/CGy0U0bW7tpL6GbZDVJ9wD08EY0Q3Fr0+IwwSkyaOAqLj8FFQNWdBmAHJm4ldvGSfbI4dV9pLsE4GoAklJvIHvf6iXtFjFV2szazjyk/NDntqup4LHJSVfhs9GjtkwXXnJ5SqwsuoZUv2LR7aH35765XWsQh2x4xwN0SOykEeuucU5WYv90Kf/zTkQSWJZJvRQ7fzAq2IFrSlvdN3Z5W+sy64tdthXUcnm+sPHflG4F0+tYe8Wd6vd+VFUq498p52pxoHM+JePZow8HNylTtSLq0tcJEjZcG1hPem0JfMsgB57kuOvsplyzKaDKpbHTtXyBDa7CLMnAz93jeMDFKvrJZsUgjG6wOQdyMO+r+zSnPeLX1Nw3frdDZ5GKJDeJeCvEV3eDDe3DGE7cao7gk3w20VRCuRKUOaT1iXXyRwc0F2g96cDBKyzpW9mkYPu5HxMocs3d8w==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(82310400026)(376014)(1800799024)(6133799003)(22082099003)(18002099003)(56012099006)(3023799007)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	m4i+M0apEbvy9JcYF1HUzNHwd9BvSaosdrmB8VJcuFd2lFvPCiAHlIp74vuw1RhnQ1b4rj4nQnAGJaTurXBL/REGW/oJ4v6d5eMjUsIvs/DiomWxl5uPGxYSeS9seDMBGbrnjybT97hA0ubgkQ6KlpYqqIjUiktq3Isbi7O5BoUo+Mk1+ccKoIwa1SqhvawM/UOR5fk9RBV6ooPOhVeiV0hx+AoGaUo4eh9ou72BldedTor/wtROuGL/POeBZRHZk65Zv2TpYXYaaqELheul0dgwbK7EYnyIdkalIxVaBIOkXsxs70DQS9lpW189fXCW1I55PsDVO4ttZ8JZJxx2mKy69dJtitHTLh4+6Eyho0+I7FPvhbGOmizaSp9I34sTUCibnznSTnuEZFq1ntwHoH9ih3NLJRBAB5wKAGrQ+O7RvV8B8U4kWlU9nbCqH+rq
X-Exchange-RoutingPolicyChecked: 
	kYQrzP9HeYXJwwWv/9v1EsoqseSDRIyp5EI8S0g0ZgC4HXq/z45rbEmYEsN4FRVcW0ILsFPr1vOLP2Dw+b6d+bsZGq0VWVEb88hQBR2xJ7HSWQy2Bh5zEVtWanFJUdyJJc9HAGZemZ1/vfZhStnAOXsbx4+L+TuMdRCqIVT86GhrxZX2SdSKd5XFn7eXfVpK0PIEhjH8foLHAmelU1keEybmfsOGPYQABr6/3momzwyM8qFGKsaHV11cJkIpVL/DiYR5I6KyoILZLQ+p3RSqwxqvb22OSprMHzxFRkleAzRnQiGOY40YooPcHoV22FUAfPq2PFXpluvASfX6Muha9g==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 16:23:34.3465
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 00583e29-a84d-4fac-b8e1-08ded39f4501
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF000252A2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7148
X-Authority-Analysis: v=2.4 cv=DcInbPtW c=1 sm=1 tr=0 ts=6a3ea78e cx=c_pps
 a=wqOHD3zG9oVgxNNyXktjPA==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=NEAV23lmAAAA:8 a=sozttTNsAAAA:8
 a=W8fHem_6D8jFpgcCQNYA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDEzNiBTYWx0ZWRfX/1bCSxpEKSnj
 WaADRgujo44cKHYvtPkZIGombDDbMqg1/JP72V4Q7aXXzYXZHsAFsFIe+R0me+WNri+TXd1Okcw
 tix4ghiec82G+lV1a/QPWW6xC0gG6zI=
X-Proofpoint-ORIG-GUID: Fk3CopfzUHXEgDjIjaPBel-uZDLlnGHJ
X-Proofpoint-GUID: Fk3CopfzUHXEgDjIjaPBel-uZDLlnGHJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDEzNiBTYWx0ZWRfX0GzeiSntw9lJ
 vhbTFF2kk+yOTmpF2UJRhkRhO8EK/YR3EI1RKALNZN+mWvBTT5rVc8eowdS4BbZcH4pVBsYD8aN
 ZrUhnrI6pmkF7w4RY/5RQz16DeZ3Ixk5qNiXBqP3WvwvMLZr65/QA6oKw4jXSbgvIVzqIPNAHfr
 w2P8qD1Gc9LuLPtKvrdjXNb0+nHFnwt1y23FFwhqEaF15K61cRRAJqK5+QUNW/bfLxmKDAPiLMc
 BPw/rzSHNHUwhMR84Wn/Y36bFowk5ddYsWMhlOo+oHG9o5mG64JkH+uDeN3scZPbnSX+SvTy9Xs
 TWgtKoNSRrPKAnLDMBlDeCEFz6kZC6RT0tbBCbYw4kLOPHnizlJ/9FBTLyZdrDmTRGFLG1H2RCS
 hgg0nBWP+u+M3vZCu+h3XDlLW1obRKkR4BYgcSd/1Uv80CDNZc9LTJnjJgsP+vbGy1UbmSlKPXA
 KBAtfPYVayYm9xe/Y+Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 bulkscore=0 spamscore=0 adultscore=0
 clxscore=1011 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606260136
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Jun 2026 16:23:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127807

From: Antonios Christidis <a-christidis@ti.com>

The recipe was suppressing errors by including
'--compile-no-warning-as-error' and removing '-Werror=format-security'
from SECURITY_STRINGFORMAT. Remove both workarounds and carry upstream
patches that fix the underlying warnings instead.

Signed-off-by: Antonios Christidis <a-christidis@ti.com>
---
 ...pe-mismatches-across-function-templa.patch | 209 ++++++++++++++++++
 ...st_unary_fn-Remove-unused-variable-j.patch |  40 ++++
 ...rintf-Fix-out-of-bounds-pattern-arra.patch |  32 +++
 ...002-commonfns-Remove-Wno-format-flag.patch |  30 +++
 ...3-c11_atomics-Remove-Wno-format-flag.patch |  29 +++
 .../opencl/opencl-cts_2026.06.18.bb           |  11 +-
 6 files changed, 347 insertions(+), 4 deletions(-)
 create mode 100644 meta-oe/recipes-core/opencl/opencl-cts/0001-commonfns-fix-type-mismatches-across-function-templa.patch
 create mode 100644 meta-oe/recipes-core/opencl/opencl-cts/0001-test_unary_fn-Remove-unused-variable-j.patch
 create mode 100644 meta-oe/recipes-core/opencl/opencl-cts/0002-command_buffer_printf-Fix-out-of-bounds-pattern-arra.patch
 create mode 100644 meta-oe/recipes-core/opencl/opencl-cts/0002-commonfns-Remove-Wno-format-flag.patch
 create mode 100644 meta-oe/recipes-core/opencl/opencl-cts/0003-c11_atomics-Remove-Wno-format-flag.patch

diff --git a/meta-oe/recipes-core/opencl/opencl-cts/0001-commonfns-fix-type-mismatches-across-function-templa.patch b/meta-oe/recipes-core/opencl/opencl-cts/0001-commonfns-fix-type-mismatches-across-function-templa.patch
new file mode 100644
index 0000000000..34ce2c3213
--- /dev/null
+++ b/meta-oe/recipes-core/opencl/opencl-cts/0001-commonfns-fix-type-mismatches-across-function-templa.patch
@@ -0,0 +1,209 @@
+From ab834418e4250715868ba2b7d551c3c0e341a449 Mon Sep 17 00:00:00 2001
+From: Antonios Christidis <a-christidis@ti.com>
+Date: Wed, 24 Jun 2026 15:10:17 -0500
+Subject: [PATCH 1/2] commonfns: fix type mismatches across function templates
+
+Across multiple function templates within commonfns, format compilation
+errors are showing up. These errors are originating from print statements,
+where there is a type mismatch between the format specifier and variable
+provided. The variable provided inherits its type from the function
+template, and when the type does not match the expected format specifier
+the error shows.
+
+As an example:
+
+test_step_fn<T> template calls verify_step<T> template with T being int.
+Within verify_step<T>, local variable r is also of type T.  Later on in the
+function when going down either of the two log_error paths r gets printed
+using %a which expects a double. But r is of type int, so use conv_to_dbl()
+to convert.
+
+Upstream-Status: Submitted [https://github.com/KhronosGroup/OpenCL-CTS/pull/2728]
+
+Signed-off-by: Antonios Christidis <a-christidis@ti.com>
+---
+ test_conformance/commonfns/test_binary_fn.cpp  | 14 ++++++++++----
+ test_conformance/commonfns/test_clamp.cpp      |  4 +++-
+ test_conformance/commonfns/test_mix.cpp        |  9 ++++++---
+ test_conformance/commonfns/test_smoothstep.cpp |  8 +++++---
+ test_conformance/commonfns/test_step.cpp       |  7 +++++--
+ test_conformance/commonfns/test_unary_fn.cpp   | 12 ++++++++----
+ 6 files changed, 37 insertions(+), 17 deletions(-)
+
+diff --git a/test_conformance/commonfns/test_binary_fn.cpp b/test_conformance/commonfns/test_binary_fn.cpp
+index 8ad347aa..4a86310a 100644
+--- a/test_conformance/commonfns/test_binary_fn.cpp
++++ b/test_conformance/commonfns/test_binary_fn.cpp
+@@ -220,12 +220,15 @@ int max_verify(const T* const x, const T* const y, const T* const out,
+                               "(index %d is "
+                               "vector %d, element %d, for vector size %d)\n",
+                               k, conv_to_flt(x[k]), l, conv_to_flt(y[l]), k,
+-                              conv_to_flt(out[k]), v, k, i, j, vecSize);
++                              conv_to_flt(out[k]), conv_to_flt(v), k, i, j,
++                              vecSize);
+                 else
+                     log_error("x[%d]=%g y[%d]=%g out[%d]=%g, expected %g. "
+                               "(index %d is "
+                               "vector %d, element %d, for vector size %d)\n",
+-                              k, x[k], l, y[l], k, out[k], v, k, i, j, vecSize);
++                              k, conv_to_flt(x[k]), l, conv_to_flt(y[l]), k,
++                              conv_to_flt(out[k]), conv_to_flt(v), k, i, j,
++                              vecSize);
+                 return -1;
+             }
+         }
+@@ -251,12 +254,15 @@ int min_verify(const T* const x, const T* const y, const T* const out,
+                               "(index %d is "
+                               "vector %d, element %d, for vector size %d)\n",
+                               k, conv_to_flt(x[k]), l, conv_to_flt(y[l]), k,
+-                              conv_to_flt(out[k]), v, k, i, j, vecSize);
++                              conv_to_flt(out[k]), conv_to_flt(v), k, i, j,
++                              vecSize);
+                 else
+                     log_error("x[%d]=%g y[%d]=%g out[%d]=%g, expected %g. "
+                               "(index %d is "
+                               "vector %d, element %d, for vector size %d)\n",
+-                              k, x[k], l, y[l], k, out[k], v, k, i, j, vecSize);
++                              k, conv_to_flt(x[k]), l, conv_to_flt(y[l]), k,
++                              conv_to_flt(out[k]), conv_to_flt(v), k, i, j,
++                              vecSize);
+                 return -1;
+             }
+         }
+diff --git a/test_conformance/commonfns/test_clamp.cpp b/test_conformance/commonfns/test_clamp.cpp
+index 298811e2..0c272829 100644
+--- a/test_conformance/commonfns/test_clamp.cpp
++++ b/test_conformance/commonfns/test_clamp.cpp
+@@ -138,7 +138,9 @@ int verify_clamp(const T *const x, const T *const minval, const T *const maxval,
+             {
+                 log_error(
+                     "%d) verification error: clamp( %a, %a, %a) = *%a vs. %a\n",
+-                    i, x[i], minval[i], maxval[i], t, outptr[i]);
++                    i, conv_to_flt(x[i]), conv_to_flt(minval[i]),
++                    conv_to_flt(maxval[i]), conv_to_flt(t),
++                    conv_to_flt(outptr[i]));
+                 return -1;
+             }
+         }
+diff --git a/test_conformance/commonfns/test_mix.cpp b/test_conformance/commonfns/test_mix.cpp
+index ae543d0d..239a3380 100644
+--- a/test_conformance/commonfns/test_mix.cpp
++++ b/test_conformance/commonfns/test_mix.cpp
+@@ -82,7 +82,9 @@ int verify_mix(const T *const inptrX, const T *const inptrY,
+                 {
+                     log_error("%d) verification error: mix(%a, %a, %a) = *%a "
+                               "vs. %a\n",
+-                              i, inptrX[i], inptrY[i], inptrA[i], r, outptr[i]);
++                              i, conv_to_flt(inptrX[i]), conv_to_flt(inptrY[i]),
++                              conv_to_flt(inptrA[i]), r,
++                              conv_to_flt(outptr[i]));
+                     return -1;
+                 }
+             }
+@@ -111,8 +113,9 @@ int verify_mix(const T *const inptrX, const T *const inptrY,
+                         log_error(
+                             "{%d, element %d}) verification error: mix(%a, "
+                             "%a, %a) = *%a vs. %a\n",
+-                            ii, j, inptrX[vi], inptrY[vi], inptrA[i], r,
+-                            outptr[vi]);
++                            ii, j, conv_to_flt(inptrX[vi]),
++                            conv_to_flt(inptrY[vi]), conv_to_flt(inptrA[i]), r,
++                            conv_to_flt(outptr[vi]));
+                         return -1;
+                     }
+                 }
+diff --git a/test_conformance/commonfns/test_smoothstep.cpp b/test_conformance/commonfns/test_smoothstep.cpp
+index 6aaa800d..4a42513a 100644
+--- a/test_conformance/commonfns/test_smoothstep.cpp
++++ b/test_conformance/commonfns/test_smoothstep.cpp
+@@ -84,7 +84,8 @@ int verify_smoothstep(const T *const edge0, const T *const edge1,
+                     log_error(
+                         "%d) verification error: smoothstep(%a, %a, %a) = "
+                         "*%a vs. %a\n",
+-                        i, x[i], edge0[i], edge1[i], r, outptr[i]);
++                        i, conv_to_flt(x[i]), conv_to_flt(edge0[i]),
++                        conv_to_flt(edge1[i]), r, conv_to_flt(outptr[i]));
+                     return -1;
+                 }
+             }
+@@ -115,8 +116,9 @@ int verify_smoothstep(const T *const edge0, const T *const edge1,
+                     {
+                         log_error("{%d, element %d}) verification error: "
+                                   "smoothstep(%a, %a, %a) = *%a vs. %a\n",
+-                                  ii, j, x[vi], edge0[i], edge1[i], r,
+-                                  outptr[vi]);
++                                  ii, j, conv_to_flt(x[vi]),
++                                  conv_to_flt(edge0[i]), conv_to_flt(edge1[i]),
++                                  r, conv_to_flt(outptr[vi]));
+                         return -1;
+                     }
+                 }
+diff --git a/test_conformance/commonfns/test_step.cpp b/test_conformance/commonfns/test_step.cpp
+index e3a6fdf6..a98086bf 100644
+--- a/test_conformance/commonfns/test_step.cpp
++++ b/test_conformance/commonfns/test_step.cpp
+@@ -81,12 +81,15 @@ int verify_step(const T *const inptrA, const T *const inptrB,
+                             "Failure @ {%d, element %d}: step(%a,%a) -> *%a "
+                             "vs %a\n",
+                             ii, j, conv_to_flt(inptrA[ii]),
+-                            conv_to_flt(inptrB[i]), r, conv_to_flt(outptr[i]));
++                            conv_to_flt(inptrB[i]), conv_to_dbl(r),
++                            conv_to_flt(outptr[i]));
+                     else
+                         log_error(
+                             "Failure @ {%d, element %d}: step(%a,%a) -> *%a "
+                             "vs %a\n",
+-                            ii, j, inptrA[ii], inptrB[i], r, outptr[i]);
++                            ii, j, conv_to_flt(inptrA[ii]),
++                            conv_to_flt(inptrB[i]), conv_to_dbl(r),
++                            conv_to_flt(outptr[i]));
+                     return -1;
+                 }
+             }
+diff --git a/test_conformance/commonfns/test_unary_fn.cpp b/test_conformance/commonfns/test_unary_fn.cpp
+index 599067d2..ecd24822 100644
+--- a/test_conformance/commonfns/test_unary_fn.cpp
++++ b/test_conformance/commonfns/test_unary_fn.cpp
+@@ -82,7 +82,8 @@ int verify_degrees(const T *const inptr, const T *const outptr, int n)
+                 else
+                     log_error(
+                         "%d) Error @ %a: *%a vs %a  (*%g vs %g) ulps: %f\n", i,
+-                        inptr[i], r, outptr[i], r, outptr[i], error);
++                        conv_to_flt(inptr[i]), r, conv_to_flt(outptr[i]), r,
++                        conv_to_flt(outptr[i]), error);
+                 return 1;
+             }
+         }
+@@ -98,7 +99,8 @@ int verify_degrees(const T *const inptr, const T *const outptr, int n)
+         log_info("degrees: Max error %f ulps at %d, input %a: *%a vs %a  (*%g "
+                  "vs %g)\n",
+                  max_error, max_index, conv_to_flt(inptr[max_index]), max_val,
+-                 outptr[max_index], max_val, outptr[max_index]);
++                 conv_to_flt(outptr[max_index]), max_val,
++                 conv_to_flt(outptr[max_index]));
+ 
+     return 0;
+ }
+@@ -131,7 +133,8 @@ int verify_radians(const T *const inptr, const T *const outptr, int n)
+                 else
+                     log_error(
+                         "%d) Error @ %a: *%a vs %a  (*%g vs %g) ulps: %f\n", i,
+-                        inptr[i], r, outptr[i], r, outptr[i], error);
++                        conv_to_flt(inptr[i]), r, conv_to_flt(outptr[i]), r,
++                        conv_to_flt(outptr[i]), error);
+                 return 1;
+             }
+         }
+@@ -147,7 +150,8 @@ int verify_radians(const T *const inptr, const T *const outptr, int n)
+         log_info("radians: Max error %f ulps at %d, input %a: *%a vs %a  (*%g "
+                  "vs %g)\n",
+                  max_error, max_index, conv_to_flt(inptr[max_index]), max_val,
+-                 outptr[max_index], max_val, outptr[max_index]);
++                 conv_to_flt(outptr[max_index]), max_val,
++                 conv_to_flt(outptr[max_index]));
+ 
+     return 0;
+ }
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-core/opencl/opencl-cts/0001-test_unary_fn-Remove-unused-variable-j.patch b/meta-oe/recipes-core/opencl/opencl-cts/0001-test_unary_fn-Remove-unused-variable-j.patch
new file mode 100644
index 0000000000..a0f810b860
--- /dev/null
+++ b/meta-oe/recipes-core/opencl/opencl-cts/0001-test_unary_fn-Remove-unused-variable-j.patch
@@ -0,0 +1,40 @@
+From 51cab19be5be5f011705e75dcef3c360163f41a1 Mon Sep 17 00:00:00 2001
+From: Antonios Christidis <a-christidis@ti.com>
+Date: Wed, 24 Jun 2026 13:59:09 -0500
+Subject: [PATCH 1/3] test_unary_fn: Remove unused variable j
+
+Remove unused variable j within verify_degrees and verify_radians function
+templates.
+
+Upstream-Status: Submitted [https://github.com/KhronosGroup/OpenCL-CTS/pull/2727]
+
+Signed-off-by: Antonios Christidis <a-christidis@ti.com>
+---
+ test_conformance/commonfns/test_unary_fn.cpp | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/test_conformance/commonfns/test_unary_fn.cpp b/test_conformance/commonfns/test_unary_fn.cpp
+index 599067d2..5bdc0270 100644
+--- a/test_conformance/commonfns/test_unary_fn.cpp
++++ b/test_conformance/commonfns/test_unary_fn.cpp
+@@ -61,7 +61,7 @@ int verify_degrees(const T *const inptr, const T *const outptr, int n)
+     double r, max_val = NAN;
+     int max_index = 0;
+
+-    for (int i = 0, j = 0; i < n; i++, j++)
++    for (int i = 0; i < n; i++)
+     {
+         r = (180.0 / M_PI) * conv_to_dbl(inptr[i]);
+
+@@ -110,7 +110,7 @@ int verify_radians(const T *const inptr, const T *const outptr, int n)
+     double r, max_val = NAN;
+     int max_index = 0;
+
+-    for (int i = 0, j = 0; i < n; i++, j++)
++    for (int i = 0; i < n; i++)
+     {
+         r = (M_PI / 180.0) * conv_to_dbl(inptr[i]);
+
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-core/opencl/opencl-cts/0002-command_buffer_printf-Fix-out-of-bounds-pattern-arra.patch b/meta-oe/recipes-core/opencl/opencl-cts/0002-command_buffer_printf-Fix-out-of-bounds-pattern-arra.patch
new file mode 100644
index 0000000000..e1052d49a9
--- /dev/null
+++ b/meta-oe/recipes-core/opencl/opencl-cts/0002-command_buffer_printf-Fix-out-of-bounds-pattern-arra.patch
@@ -0,0 +1,32 @@
+From d06f56310e07e99d2450dbe728c37f3b34f966a3 Mon Sep 17 00:00:00 2001
+From: Antonios Christidis <a-christidis@ti.com>
+Date: Wed, 24 Jun 2026 14:26:32 -0500
+Subject: [PATCH 2/3] command_buffer_printf: Fix out of bounds pattern array
+
+The way .back method works, is container.size() - 1, which can evaluated to
+-1 if size is 0. Since pattern_length >=1, (std::max(min_pattern_length,
+rand() % max_pattern_length), use that to post pend the null terminator.
+
+Upstream-Status: Submitted [https://github.com/KhronosGroup/OpenCL-CTS/pull/2727]
+
+Signed-off-by: Antonios Christidis <a-christidis@ti.com>
+---
+ .../extensions/cl_khr_command_buffer/command_buffer_printf.cpp  | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/test_conformance/extensions/cl_khr_command_buffer/command_buffer_printf.cpp b/test_conformance/extensions/cl_khr_command_buffer/command_buffer_printf.cpp
+index fee14571..ab0078aa 100644
+--- a/test_conformance/extensions/cl_khr_command_buffer/command_buffer_printf.cpp
++++ b/test_conformance/extensions/cl_khr_command_buffer/command_buffer_printf.cpp
+@@ -283,7 +283,7 @@ struct CommandBufferPrintfTest : public BasicCommandBufferTest
+                 std::max(min_pattern_length, rand() % max_pattern_length);
+
+             std::vector<cl_char> pattern(pattern_length + 1, pattern_character);
+-            pattern.back() = '\0';
++            pattern[pattern_length] = '\0';
+             enqueue_passes[i] = {
+                 pattern,
+                 { cl_int(i * offset), cl_int(pattern_length) },
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-core/opencl/opencl-cts/0002-commonfns-Remove-Wno-format-flag.patch b/meta-oe/recipes-core/opencl/opencl-cts/0002-commonfns-Remove-Wno-format-flag.patch
new file mode 100644
index 0000000000..4c285bf32d
--- /dev/null
+++ b/meta-oe/recipes-core/opencl/opencl-cts/0002-commonfns-Remove-Wno-format-flag.patch
@@ -0,0 +1,30 @@
+From 8c9d444083b6ca4f7e9bebf6ab3b8a252cdbfec6 Mon Sep 17 00:00:00 2001
+From: Antonios Christidis <a-christidis@ti.com>
+Date: Wed, 24 Jun 2026 14:49:23 -0500
+Subject: [PATCH 2/2] commonfns: Remove -Wno-format flag
+
+There are no longer issue with format.
+
+Remove -Wno-format compiler flag for files within commonfns.
+
+Upstream-Status: Submitted [https://github.com/KhronosGroup/OpenCL-CTS/pull/2728]
+
+Signed-off-by: Antonios Christidis <a-christidis@ti.com>
+---
+ test_conformance/commonfns/CMakeLists.txt | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/test_conformance/commonfns/CMakeLists.txt b/test_conformance/commonfns/CMakeLists.txt
+index e7752474..bea20cf5 100644
+--- a/test_conformance/commonfns/CMakeLists.txt
++++ b/test_conformance/commonfns/CMakeLists.txt
+@@ -10,6 +10,4 @@ set(${MODULE_NAME}_SOURCES
+     test_binary_fn.cpp
+ )
+
+-set_gnulike_module_compile_flags("-Wno-format")
+-
+ include(../CMakeCommon.txt)
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-core/opencl/opencl-cts/0003-c11_atomics-Remove-Wno-format-flag.patch b/meta-oe/recipes-core/opencl/opencl-cts/0003-c11_atomics-Remove-Wno-format-flag.patch
new file mode 100644
index 0000000000..5903831b0d
--- /dev/null
+++ b/meta-oe/recipes-core/opencl/opencl-cts/0003-c11_atomics-Remove-Wno-format-flag.patch
@@ -0,0 +1,29 @@
+From e0439fd5cc889d64864c66b62ccf2d4e5accade0 Mon Sep 17 00:00:00 2001
+From: Antonios Christidis <a-christidis@ti.com>
+Date: Wed, 24 Jun 2026 16:02:02 -0500
+Subject: [PATCH 3/3] c11_atomics: Remove -Wno-format flag
+
+Remove -Wno-format compiler flag for files within c11_atomics.
+
+Upstream-Status: Submitted [https://github.com/KhronosGroup/OpenCL-CTS/pull/2727]
+
+Signed-off-by: Antonios Christidis <a-christidis@ti.com>
+---
+ test_conformance/c11_atomics/CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/test_conformance/c11_atomics/CMakeLists.txt b/test_conformance/c11_atomics/CMakeLists.txt
+index 25f0ba39..da39f5c2 100644
+--- a/test_conformance/c11_atomics/CMakeLists.txt
++++ b/test_conformance/c11_atomics/CMakeLists.txt
+@@ -8,6 +8,6 @@ set(${MODULE_NAME}_SOURCES
+     inclusive_scopes.cpp
+ )
+
+-set_gnulike_module_compile_flags("-Wno-sign-compare -Wno-format")
++set_gnulike_module_compile_flags("-Wno-sign-compare")
+
+ include(../CMakeCommon.txt)
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-core/opencl/opencl-cts_2026.06.18.bb b/meta-oe/recipes-core/opencl/opencl-cts_2026.06.18.bb
index f29a0b6876..98181071c8 100644
--- a/meta-oe/recipes-core/opencl/opencl-cts_2026.06.18.bb
+++ b/meta-oe/recipes-core/opencl/opencl-cts_2026.06.18.bb
@@ -11,11 +11,16 @@ DEPENDS += "opencl-headers virtual/libopencl1 spirv-headers spirv-tools-native"
 RDEPENDS:${PN} += "python3-core python3-io"
 
 
-SRC_URI = "git://github.com/KhronosGroup/OpenCL-CTS.git;protocol=https;branch=main;lfs=0"
+SRC_URI = "git://github.com/KhronosGroup/OpenCL-CTS.git;protocol=https;branch=main;lfs=0 \
+           file://0001-test_unary_fn-Remove-unused-variable-j.patch \
+           file://0002-command_buffer_printf-Fix-out-of-bounds-pattern-arra.patch \
+           file://0003-c11_atomics-Remove-Wno-format-flag.patch \
+           file://0001-commonfns-fix-type-mismatches-across-function-templa.patch \
+           file://0002-commonfns-Remove-Wno-format-flag.patch "
 
 SRCREV = "8d8f3d272dbd3f0a84156be7890835c4b6deff8e"
 
-EXTRA_OECMAKE:append = " --compile-no-warning-as-error -DSPIRV_INCLUDE_DIR=${STAGING_EXECPREFIXDIR} -DCL_INCLUDE_DIR=${STAGING_INCDIR} -DCL_LIB_DIR=${STAGING_LIBDIR} -DOPENCL_LIBRARIES=OpenCL"
+EXTRA_OECMAKE:append = " -DSPIRV_INCLUDE_DIR=${STAGING_EXECPREFIXDIR} -DCL_INCLUDE_DIR=${STAGING_INCDIR} -DCL_LIB_DIR=${STAGING_LIBDIR} -DOPENCL_LIBRARIES=OpenCL"
 
 PACKAGECONFIG = " \
 	${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'opengl gles', '', d)} \
@@ -25,8 +30,6 @@ PACKAGECONFIG[opengl] = "-DGL_IS_SUPPORTED=ON,-DGL_IS_SUPPORTED=OFF,virtual/libg
 PACKAGECONFIG[gles] = "-DGLES_IS_SUPPORTED=ON,-DGLES_IS_SUPPORTED=OFF,virtual/egl virtual/libgles2"
 PACKAGECONFIG[vulkan] = "-DVULKAN_IS_SUPPORTED=ON,-DVULKAN_IS_SUPPORTED=OFF,vulkan-headers glslang-native"
 
-SECURITY_STRINGFORMAT:remove = "-Werror=format-security"
-
 do_install() {
         install -d ${D}${bindir}/opencl_test_conformance
         cp -r ${B}/test_conformance/* ${D}${bindir}/opencl_test_conformance
-- 
2.34.1


