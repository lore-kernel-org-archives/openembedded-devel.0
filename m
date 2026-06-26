Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B860C43211
	for <webhook@archiver.kernel.org>; Fri, 26 Jun 2026 16:23:58 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38972.1782491032938027877
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Jun 2026 09:23:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=nfVvX0qu;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=gEkU9W4U;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: a-christidis@ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 65QFhpIK2047062;
	Fri, 26 Jun 2026 11:23:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=JePC6zUGmIwTvPHfWWs14Yrr+SjLpXyrWOr7/iWes
	ZI=; b=nfVvX0qu65bpMm6XYT2BrhNfn1Yy3BePvkr4q0s7xNPS2MLBYbuCM1BXE
	i7C1IkOV0gkEc2y+UDf7HTBHUxNIz4cosURWpsCSoXijOMddq32wolVogbentuzl
	68KeJoLMd/1oezqr3k5Nrf1n9nNqjq0vzWy4UmitM000410CGuvZUpxJbSkrI8Qs
	Fon1qhSxmY+q+pw1pBOMWsLHhLW0KTtBAgkYh7FkPnRZlpUjyP1pkpyVDs+9DPZ9
	ONrQlNSfZ2xRduZxssQOoWq/wk2ctmBs7o8jQiIzFCrvdXBMOxbdrtI7/DQKYNkZ
	zKimdfnLQdOXDphdgAdRqL7/jrk5Q==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010045.outbound.protection.outlook.com [52.101.46.45])
	by m0380145.ppops.net (PPS) with ESMTPS id 4f1rc51q2t-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 26 Jun 2026 11:23:52 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f9OrUgHho0gACHjZzE4Lw+xHp97uP9Oeb+d1TGaLqL6Ve9LLeL0pWP2jSvQUhOvZmLiOf1fYQ/YOjMi4JuMZyDPDwPaq+PN+sHYVyPp2zipVCwL0QzbFe5PzRL8HHBExEFo7R6uLe89o84HbpHxFyFYG9e0uN8+cBG23Fpuq+HBYExPf7BtQlH+cOmSYxkj/A6eQDVrFI2HqrN98ZUXg4QlFpQ6Ux0k4yAkiBE838WBA7WtcJrXsL2hfvfJuEwxBz3l7s17MC7iSzfGbJHs4g6Zj9YXm3wJX7DDsrXJWSHUN1Gg5IWj4SqQ8dyPgkKHYU8yXM+VKkIz1ayLdVMyVPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JePC6zUGmIwTvPHfWWs14Yrr+SjLpXyrWOr7/iWesZI=;
 b=bJzJryn0h1w+UF8ASJuJRpmHVh4KN876iDSE44huaLZyuaFGrkV1ig4puUz1zmgAmvzrWvxdFY6/ZzC/NdPEDgcKi3GH/j2945Cjbrq6gAcpBm7Wnv8/OK/Vpf8JFGfNFZgeIxsgAQ9LPQKbeWpk/EH+J5cWJMcG/zASCjTlW1S0c9vxvSW5M5L7sghHqvgne23FHXEJM6Ho2zkvnYQnbi1eISgbyLIk2FIlG5gVCGR0oj0mg7WHBuJqjeE8Zbyd/Q25WHcoddY7/JC4+Mtuy4D9LW8UU0+IR3PYm9wyykfF0JcxQREsv3UPrQ/vJ0rSi9Y+VbcP03vDypK1DhCUAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JePC6zUGmIwTvPHfWWs14Yrr+SjLpXyrWOr7/iWesZI=;
 b=gEkU9W4UwkEj1eC6ZGQcUzWlRdy+2peS4flkhcPg6bmrKwlQl63B5pc2wsvjNfhhkO+ia/MXasRK6AnVKdkANlrQIeBnrNWapyuNmkEXvEbk+bOPvIydxTfNF0P37TRRHiG9Hx2nIYtTXAJN6CP4zZM3a68cI6mh5Y72HqMk7tg=
Received: from MW4PR04CA0134.namprd04.prod.outlook.com (2603:10b6:303:84::19)
 by SJ5PPF7F0BE85A1.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::7ad) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.17; Fri, 26 Jun
 2026 16:23:50 +0000
Received: from SJ1PEPF00002314.namprd03.prod.outlook.com
 (2603:10b6:303:84:cafe::a) by MW4PR04CA0134.outlook.office365.com
 (2603:10b6:303:84::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.17 via Frontend Transport; Fri,
 26 Jun 2026 16:23:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF00002314.mail.protection.outlook.com (10.167.242.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Fri, 26 Jun 2026 16:23:49 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 26 Jun
 2026 11:23:42 -0500
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 26 Jun
 2026 11:23:42 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 26 Jun 2026 11:23:42 -0500
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.75.243])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65QGNRmQ1979658;
	Fri, 26 Jun 2026 11:23:27 -0500
From: <a-christidis@ti.com>
To: <khem.raj@oss.qualcomm.com>
CC: <reatmon@ti.com>, <openembedded-devel@lists.openembedded.org>
Subject: [meta-to][master][PATCH 1/2] opencl-cts: Update version 2026.05.05 -> 2026.06.18
Date: Fri, 26 Jun 2026 11:23:26 -0500
Message-ID: <20260626162327.1416326-2-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260626162327.1416326-1-a-christidis@ti.com>
References: <20260626162327.1416326-1-a-christidis@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002314:EE_|SJ5PPF7F0BE85A1:EE_
X-MS-Office365-Filtering-Correlation-Id: 66c64a99-181e-4643-10e8-08ded39f4e27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|23010399003|3023799007|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	4tV57VVp2V+gajWHY3Jrq1rlBW11IHgelRb/9g3Ob5VWoufmaVJ7VfUHnLpKuKvEIQhvqCoFIaZyurIeoXkJe9QmFzdlNNvcoWKA19A2MW1DurziEe7Lbh+bqAC8kxq986Hvw/zixGYm5AhHSxovNMFhLVOftLX/YXNl+a/M66jOd+LqmrFY+Kie/luEM00Yoz962+E0IdAcbfcCXxhIkgdLUO15/jNTe0clhsNcQUWIYUz08O7UpWsg/T1kAXTh+fZHttR7+anmMpA7RIRjDbjj3gbIwQqnF4Cb0+hRY6R+UwJX28StHWVE1N/lgX6lvigKaS5KYnvKOwz2cyH9Wg21WE6/7MCA6Zd42uaAXCzv6aBaFPtwQdjh7X3LUq1sb/jWBD0//GnYBBxzrwvKmO5x8J4HeWuhSr2vDZJME0901zy+KaCCMvBtqNoN8MMQRfdj5dypV3/YJGJXQGl8XYChomDXdhHio5nokJE1g4gN7bgFHTkknrvozEBO1Ar7cDUP1XnFkAWkWxD2EGAjIKnhKr4MAEOpBDXEgse2llEKc3dd0kt2Ko5kOaKIfsqKxwjy4guEzKIWyD1dSryWvrtX+htvJlaC4hevWdoXqo7wN7wNPiX/CDijyrocgZxGJbnPbQ3Qx2tjvBPs8IT95lkEHSPxuziyUTcDy5hHeufvMQpYVacMEIvqdNRTheonPLCAAIgepW4rXJJyQPtEHg==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(23010399003)(3023799007)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	Pl2zXDyoztbF/jvc7OBSpO4EJvwiXsOU/2DIv7zFcstZwL+lP8u0UiN03FXC4Dnb52c/3oVumXxJ41bJGEweIMcxv9xSIkJc4qx5sPDPlrf1qeNDL9SHPQUzQA2RXSkB21ZQ7e7RMbCeTqlgZ/14Bf8YcIk+YPH717JgHXoFMWnugAqA6XLrP2Nww3R4rRFcRubZZP8vugv0Yl8lT9ZuNOSCh2XX0c3LgiY6UUqkArTPHDD421v1b5FsIefmzF0WEsyBbrg6vatMcOhEWrC7d/82x5kdb7IRCN5vfimnx/v9kBP8f3b3g+3NKez6cavYONc8xWCvcBOw4xbnVE36hlh484WwnpfWYX4hp9ylfJKTXAmjpvL1MlZyYiHK2/gbCrjRkgei7tdAElfWTRn5QaSKHHnu/TQtsGAT1+fBeYUZjL+qE++UYXwG6V926rRk
X-Exchange-RoutingPolicyChecked: 
	WZ402hJd4nS2qScCx56aOnzxSEnawnJLDpGYtSFHFKEj79THEVGl36CIGKFMNCusOBE/+QGTpLKA4lObZBhrOa5jQ4rtABmt4hUj4zQhww8U407UvNIyYrzyooVaanHLTxF53kCg1ovo1WlHr5laE1K6d6gISJebYhrpIdbxsXlbr8WCcJbgiXqJKpwaD/Jz52lFUwOnzg1uSgLW0OEcV8h4OBLWNIU5OW02KuiPTgtsPF0e/a/+ukuSUfO5bKNK1HNWoSIQmqjZI5ODBzal4ZnS/7nBOwNi790xs1Dyzsb4Qk02V+Tc5E3eC/fItT0/uiBafasxpqlPIbyvBWLryw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 16:23:49.6342
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 66c64a99-181e-4643-10e8-08ded39f4e27
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00002314.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF7F0BE85A1
X-Authority-Analysis: v=2.4 cv=DcInbPtW c=1 sm=1 tr=0 ts=6a3ea798 cx=c_pps
 a=lEAAG6kgDLZw1ps4cEx4qA==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8 a=NEAV23lmAAAA:8
 a=dob_LeowvEHiGLnBfp0A:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDEzNiBTYWx0ZWRfX7aQXr2hMc44h
 3SvEyipE1IH3EP3Dfq0Afr4Y30DblZeUo3cr1yzZ8teQw+JM/CoJZQ2aMpwTJ7WBLjO0t6LZKPh
 qO/iwtEIp2E9BI6adpKGcX4rh3SwIGU=
X-Proofpoint-ORIG-GUID: qs-7tWTl8BPLf72dcB1vB3HGNGMubMIk
X-Proofpoint-GUID: qs-7tWTl8BPLf72dcB1vB3HGNGMubMIk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDEzNiBTYWx0ZWRfXxTfsEQEJwdwA
 T85H/Fwrli4HqavquFWjSctY3IcrXrQ68R54I6hzJ6yWHGKr/FdnpBmdMtRxuKICjuzngd+rFuM
 9s9d5RF6CANLjCHN+XwzEsSn1l6ryzswF6TA+HaABFdZ/hV6Vx1HoyGjQBgqS+Kiq40AOSBR0Jq
 +6ZyxQ/G1Ocp9ZuHbduVhX5hq9qyXrj6bVDy3k2e1CtjKD+injQiFYkK/nX+5RAYF3VRBco9ibY
 44J9ArEWvM3/ABDx/zz3AIohhLNEo4V3NfEZW0ZpjgLSfpGa9PkfMiKfquWNv2d9QSdZOKljQP7
 nxBp723I9lwEn32PMi6ruKaWzioxx6JUY1V4V59zmHbehvk531TG+B4wEn/54LePWovlgOcFYIZ
 LW/4ZR50+30Px+F2zJYDsZHg3KKJlv2/TTk5E3m4beO2HsNTfxI21tyICQ4QfrV6W84Out4Yh34
 NiZEAzHhdwnzWVmc6dQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 bulkscore=0 spamscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606260136
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Jun 2026 16:23:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127808

From: Antonios Christidis <a-christidis@ti.com>

Update opencl-cts version from 2026.05.05 to 2026.06.18.

Signed-off-by: Antonios Christidis <a-christidis@ti.com>
---
 .../{opencl-cts_2026.05.05.bb => opencl-cts_2026.06.18.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-core/opencl/{opencl-cts_2026.05.05.bb => opencl-cts_2026.06.18.bb} (97%)

diff --git a/meta-oe/recipes-core/opencl/opencl-cts_2026.05.05.bb b/meta-oe/recipes-core/opencl/opencl-cts_2026.06.18.bb
similarity index 97%
rename from meta-oe/recipes-core/opencl/opencl-cts_2026.05.05.bb
rename to meta-oe/recipes-core/opencl/opencl-cts_2026.06.18.bb
index e99c305d9a..f29a0b6876 100644
--- a/meta-oe/recipes-core/opencl/opencl-cts_2026.05.05.bb
+++ b/meta-oe/recipes-core/opencl/opencl-cts_2026.06.18.bb
@@ -13,7 +13,7 @@ RDEPENDS:${PN} += "python3-core python3-io"
 
 SRC_URI = "git://github.com/KhronosGroup/OpenCL-CTS.git;protocol=https;branch=main;lfs=0"
 
-SRCREV = "0979549a997090c0569da4c4e995422b8f73f1fe"
+SRCREV = "8d8f3d272dbd3f0a84156be7890835c4b6deff8e"
 
 EXTRA_OECMAKE:append = " --compile-no-warning-as-error -DSPIRV_INCLUDE_DIR=${STAGING_EXECPREFIXDIR} -DCL_INCLUDE_DIR=${STAGING_INCDIR} -DCL_LIB_DIR=${STAGING_LIBDIR} -DOPENCL_LIBRARIES=OpenCL"
 
-- 
2.34.1


