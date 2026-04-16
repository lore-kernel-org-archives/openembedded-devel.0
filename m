Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 762DFF8DFCC
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 21:30:14 +0000 (UTC)
Received: from mx0a-000eb902.pphosted.com (mx0a-000eb902.pphosted.com [205.220.165.212])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.26731.1776374836754562530
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Apr 2026 14:27:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@garmin.com header.s=pps1 header.b=AVRxMfjo;
 dkim=pass header.i=@garmin.com header.s=selector2 header.b=imJLX3kE;
 spf=pass (domain: garmin.com, ip: 205.220.165.212, mailfrom: prvs=9566ee895a=colin.mcallister@garmin.com)
Received: from pps.filterd (m0220296.ppops.net [127.0.0.1])
	by mx0a-000eb902.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63GJDflD2704991;
	Thu, 16 Apr 2026 16:27:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps1; bh=zIYFTY2UzvS1F5ShcCcw0gGvFkn
	4lFJ0+hRSSoRzJEo=; b=AVRxMfjo73okIpkGurDGAW8EdAH0sEbl/EbVT7UQsYI
	CDgipJXFxLJqDmA++//akBH3zQTBhN52HZLIIcWDdcmXRp8qfdoApXoSEGxvtxUo
	2VdbeTd4CGultCIVSP25NW+Tx91nerDuieKwWrYPWPuI4GKraVeb9NqmF94/RsCM
	XUWJqYzebjx67Usmif/QTc8loHGFRkLL6cA6lN+crh+ZsOTMKW/gEmeljdiiCghM
	TrFGuXFRFTeKOiztYpHv1+o1n+sdvyyXg6g1c0HL+EcxsLfjLmHFoznOS/uuPhkU
	fXzD+ieopAfow2oycX0PfQgL4v1LTMxzjAMGtzXnrnw==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11020091.outbound.protection.outlook.com [52.101.85.91])
	by mx0a-000eb902.pphosted.com (PPS) with ESMTPS id 4djrkmsu4w-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 16 Apr 2026 16:27:15 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pEhHMhjwfGfr92z25ZNfGKvMtXTvovNP1mihC2X/BcUkL6Vsr0yEHWmRLx9xwWa1KMbJf4ccar7HFsphzDzeDN+/qQ8kT1NxxhuHPfkmbElLAbEOP0InDgL3wN05SfCRMYEy7QJtuwmS407dbAkfih65zIJHFjrVtNdVxouKorhM6VAGO8FwKFyA7PSiXKBujq0rWwU8w23NyPQQKkGEzQMTF7j1x8EPxmcAl6hVVok47BIP4N3wTDOx0OTRZJYb4x9o5Iw4GNNfY12oYnNpg4u+5muQPoKyE0PRDpaWO8quzmadxrPDXAHIdtUhfTQ624RUz5Rw9no0FKyYzIPusw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zIYFTY2UzvS1F5ShcCcw0gGvFkn4lFJ0+hRSSoRzJEo=;
 b=F9S/H2LncIOrMLp+ydnZMRT/e0Y43nxZO5oPnM1ACLpo5fPu9evi8okTL9JbyY/TQm508AikSzxgcPMjh1nOcKXjfwKkkqm2SspUDUFGwXmwl/hS0ch8a7ffcmOynJ5NRZnIA6CaZjsa/h5lm3z5+iOkQc2/PU7FEJ5cumgB3pWCpprw2kBOB9Ph5eV6em5BRvSNiBcGxxiDxV5OwBSe+hPqL4Zn+byjhIuJrVEm8/sp3wGbGlk5xCd1SOYgXRtNkmIJHSaWXnllXdTZOAAPmMB5mlCYhmSFpd67pOFCMiF0dZQOa2YYpDKSEn2eFnX+c74zFIiSK+YABdralhZLZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 204.77.163.244) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=garmin.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=garmin.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zIYFTY2UzvS1F5ShcCcw0gGvFkn4lFJ0+hRSSoRzJEo=;
 b=imJLX3kEzVDkeXm88JOd+Lwh0vSbZBhzdu7NXgR4LMgV6M+dDIqRhwhMeE+TK62qrHjdhcRbld8JN1jSApwlz38AjGpJsKndAYCXhNObdK2gK03faeLdfaVlVcRwwXw2SbGnPVaxLvkGdlG6gp5Mn2GGJcd7FWB2Bz0kSTk/BtbvLY8eDicau/lc9U0BAsa9qR1MYdcGjwBSjdmVjHfJ4rGh5JCO6wy2ZAHVxnl7y8KbVxkhAn5L6GIQxUAmj2aW1kagcMiHAfdAVcIVj/jwlQGTSF2A6jNx0zsRpBzbHC8u9ZFkV2QCdCA7cBDqlfLBBm+tN50A7tGY+gKpfxpePw==
Received: from CH5P221CA0024.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:1f2::18)
 by SJ0PR04MB8406.namprd04.prod.outlook.com (2603:10b6:a03:3d3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Thu, 16 Apr
 2026 21:27:12 +0000
Received: from CH2PEPF0000014A.namprd02.prod.outlook.com
 (2603:10b6:610:1f2:cafe::90) by CH5P221CA0024.outlook.office365.com
 (2603:10b6:610:1f2::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.52 via Frontend Transport; Thu,
 16 Apr 2026 21:27:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 204.77.163.244)
 smtp.mailfrom=garmin.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=garmin.com;
Received-SPF: Pass (protection.outlook.com: domain of garmin.com designates
 204.77.163.244 as permitted sender) receiver=protection.outlook.com;
 client-ip=204.77.163.244; helo=edgetransport.garmin.com; pr=C
Received: from edgetransport.garmin.com (204.77.163.244) by
 CH2PEPF0000014A.mail.protection.outlook.com (10.167.244.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Thu, 16 Apr 2026 21:27:12 +0000
Received: from KC3WPA-EXSE03.ad.garmin.com (10.65.32.86) by cv1wpa-edge1
 (10.60.4.254) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 16 Apr
 2026 16:27:25 -0500
Received: from KC3WPA-EXSE04.ad.garmin.com (10.65.32.87) by
 KC3WPA-EXSE03.ad.garmin.com (10.65.32.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.17; Thu, 16 Apr 2026 14:27:09 -0700
Received: from ola-jnrkg73.ad.garmin.com (10.5.209.17) by smtp.garmin.com
 (10.65.32.87) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 16 Apr 2026 14:27:09 -0700
From: "Colin McAllister" <colin.mcallister@garmin.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Gyorgy Sarvari <skandigraun@gmail.com>, Khem Raj <raj.khem@gmail.com>,
        Colin Pinnell McAllister <colin.mcallister@garmin.com>
Subject: [meta-webserver][kirkstone][PATCH] nginx: set CVE_PRODUCT
Date: Thu, 16 Apr 2026 16:27:08 -0500
Message-ID: <20260416212708.3561325-1-colin.mcallister@garmin.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000014A:EE_|SJ0PR04MB8406:EE_
X-MS-Office365-Filtering-Correlation-Id: bec514e8-6082-4590-d18c-08de9bfeec68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700016|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	O9+E8cZ1gXDjkZWC+pRQNV2BlzmnFIVNowQGMhpz7TQddE66zWE4Q0X40UJGAtKu/kjJS8c3tTwjLekOSxfqnt8+at+IsXNxbM1ZOnYUbzWGRaE+vihYPggdrpmAEP0oMGfTySQ7ClmUctSnF10WY/xvdCQajEjEpGlebdS9K5i+/qUAQH6V+WQWWjKROizUL5GWfIox1ulT1XDYhnhD/IdUzrzAfINrHmc+qNTHzhtztS2d1mJJr8wudikghIQxQjU1ahhWD21fPJnDUH2lxOkeGI61Y+9jv+UX/fnB2WAW57oodMRfuIiFU6xy4VDym0bMUujQax2bQmfwIra+YvzazWqa062OiXeDLLEePNOyy0GqO7hcgsNRCysRGmSuyeRF06k4xKYC7vyrm9ThL/d1EdqhkWDdfWZx49kEX9ux8giDGbVAd0nY7UmN9HbUZL1v4AdqzZLEry3E9iSmzBYky2c2Fo7mTUbC/2+Nke8wgGisxjdNq9kwHQy7XP4mIkjEgtyjBz9lzuG9loFISeE3EntMfOCQ8/v6/HMuid0D3lv/BkZll8LeEFsajAujqqkW4xv5LU41+Zdq6UPzjf1FTodnRbETSGPEx+T72OQfm705+PZ5hLTu1CVHg6C1cOCAMaq0wnoGr7Os0XI1W6ezwYTEH65cnlvOFPvjwoj5WdY+2Bl8u+zsPN0EaUtrK5bAzwpOd3P/owd9+hXIgG/yk4zUzQoyl4OjA1WKaLQsvBFKZsqwQCxLTx8wq/8cXJ/ofNP5av4IQ7xyLVULZw==
X-Forefront-Antispam-Report: 
	CIP:204.77.163.244;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:edgetransport.garmin.com;PTR:extedge.garmin.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700016)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	NcyyAYrmBOqD9hvRodzSNmYTL3x2+nP4pvxfvgBFvBrBXT3uuNzG1/xsp9ugFWUHjv3XLgWyTVmI5+l8OPR4snxIEJuInmpk846f0ACijjN47MZxKODa7B6epaXX/UgTFc3eIO6KpItxp0IwGfQ69jKo0ePqui7T2FXi+04UaTCFhZUr+FamZE3txtvzfEonW3MzokmTOi+eAMU/lqIQWezDhXdOwOlXKBMPQDzDqUDZNE+UORmVied6wsLgjclQPoN7qZjFylmaICxKSEOyR6t5Abl3E+OOAlXgouOLy+D3oWc4ELEFv26JxxxeiFqoEMpVjkCIJLF8XParRTtWNq+k6z7uMVVQEoh00+V4yBvxCqpqpWvFqnU2D6JDOHzwdrwL17UwtgyiPERWIudDzxw9eQG3V70XATeNJGUrx1NCUYzH69qXsE8LzfUG2Ws4
X-Exchange-RoutingPolicyChecked: 
	f8Yy7FndHi7SBMH2XDpaqSn9moqQE9qbCzHlIa6Z4l8ig1P8FnxgE12bWnlRAFclM4UAO3+em3nmMw1uNBCLEUOBTdowaoobgEXBmT6ld9sGFY2MCi6OE2FincpxnZFiPcKjUM8PoZnoJfkC6eH7azzPAAMuKmg3+2hVJWSzxWdHcW50WpUiZH9VUMA42i5FqD9Og0Ink73BBRShKqAkR0s1nRhnVOJBnAm9d3u61kNAXvtBAisXoqWYn6jdj5vA0iNuDwyonDQB1qrpt3ph7i3BeqA/sdX7AteJtjd2kuZX/3kRCSqPlQKfE5iM9SlKjYaSy1VmGvqQL2RKafeMyQ==
X-OriginatorOrg: garmin.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2026 21:27:12.2453
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bec514e8-6082-4590-d18c-08de9bfeec68
X-MS-Exchange-CrossTenant-Id: 38d0d425-ba52-4c0a-a03e-2a65c8e82e2d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38d0d425-ba52-4c0a-a03e-2a65c8e82e2d;Ip=[204.77.163.244];Helo=[edgetransport.garmin.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH2PEPF0000014A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR04MB8406
X-Proofpoint-GUID: 0b6TuJXo5kgMWupt2b4702pXLzxwpUcR
X-Authority-Analysis: v=2.4 cv=SvigLvO0 c=1 sm=1 tr=0 ts=69e15433 cx=c_pps
 a=kkQK6hjpUACXm7ua2zl0Pg==:117 a=YA0UzX50FYCGjWi3QxTvkg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=A5OVakUREuEA:10 a=qm69fr9Wx_0A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=mT958ORwFhrKhj1UMJhN:22 a=Pc8f8dTiIK3equxv0BZ8:22
 a=pGLkceISAAAA:8 a=NbHB2C0EAAAA:8 a=zckbM_QPzA4zu9iQjgAA:9 cc=ntf
X-Proofpoint-ORIG-GUID: 0b6TuJXo5kgMWupt2b4702pXLzxwpUcR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDIwMiBTYWx0ZWRfXxHrRM45ypuve
 bRctLTcPZSY+tD7hdZI3gM1CQIMpKT3tkYfsfmDqLMOJD0X63yWNDW6Mq7ewVcYzxQeq+v9EuDe
 Ogf92AhopdGG2jkrjDVYUcsLYk9e9Psw8MTPHVc6qSyiVTyT4XY7OA0LeEmpn6ln/WL0hwk2spo
 RsgF+LW7gnjyGNRUWK7SYo2SCKEDxeCMYhK2qDaQuEJMW0auHtS69Hn5PTi3/5mjq2FS3L1l+b5
 FyKqGg6Vj7Xtpdwm2eqRMnIr2dAOHFqWMD2vntuPXsPHYLbhT4u8KliXOzAIdYsyv9Ny0huIpXF
 lkpzjlb6e2FBl+QU9qfXAVlgRUN8GjQ7+7CIimyI8094h4biOfFXZqIotEn+0qwxXxIO7nOz/Ea
 eW3pKWe3Yt2CJiZmOIq2YGTBI8R1TUDLL+9/Ykd3ZuLxA13FbZw1TnytzJoxnrhLBVn66lKNXav
 nw7SdExvOY8kYMwCJ/J2ljUGxJH71M1FaudZUXL0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_03,2026-04-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 bulkscore=0 impostorscore=0 malwarescore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=notification
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604160202
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Apr 2026 21:30:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126417

From: Gyorgy Sarvari <skandigraun@gmail.com>

nginx has a long history, and has used multiple CPEs
over time. Set CVE_PRODUCT to reflect current and historic
vendor:product pairs.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit d25aadbbb53d54382b4b82b1f78a69d4d117fd28)
Signed-off-by: Colin Pinnell McAllister <colin.mcallister@garmin.com>
---
 meta-webserver/recipes-httpd/nginx/nginx.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-webserver/recipes-httpd/nginx/nginx.inc b/meta-webserver/recipes-httpd/nginx/nginx.inc
index 6a53a50505..ec64f80cab 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx.inc
+++ b/meta-webserver/recipes-httpd/nginx/nginx.inc
@@ -190,3 +190,5 @@ USERADD_PARAM:${PN} = " \
     --home ${NGINX_WWWDIR} \
     --groups www-data \
     --user-group ${NGINX_USER}"
+
+CVE_PRODUCT = "nginx:nginx f5:nginx_open_source f5:nginx"
-- 
2.53.0


