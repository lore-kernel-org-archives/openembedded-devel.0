Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1A35C79FB8
	for <webhook@archiver.kernel.org>; Mon,  5 Jan 2026 18:14:02 +0000 (UTC)
Received: from mx0a-000eb902.pphosted.com (mx0a-000eb902.pphosted.com [205.220.165.212])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.70768.1767636394648311096
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Jan 2026 10:06:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@garmin.com header.s=pps1 header.b=yCx4uXkE;
 dkim=pass header.i=@garmin.com header.s=selector2 header.b=ZLeeALsi;
 spf=pass (domain: garmin.com, ip: 205.220.165.212, mailfrom: prvs=6465f1319b=colin.mcallister@garmin.com)
Received: from pps.filterd (m0220295.ppops.net [127.0.0.1])
	by mx0a-000eb902.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 605H27Rp009435
	for <openembedded-devel@lists.openembedded.org>; Mon, 5 Jan 2026 12:06:34 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps1; bh=P6bsO
	YeXm3bBNawHYFNFu4PUTCpaxoCukXjn2RMZN7Y=; b=yCx4uXkEBvt+MTGAhPOOY
	7G9V0aY7DDdWtE/30pR+IwurweGBzRvGuqH164uLgwaHCyqMxmyKgSBSUwCtZpAk
	98YnHNPd0m5ANKcNmfIxQTcal+RlUeqwYqeF1U+T/2y6Se52Jg+CKeqytXfKho9P
	3FK112jLPiy0bM3CfWCU68F/ydfM0lTwZ+NJaDLTorbl92JhC5QvInr3Qb56aOUI
	fgenYtKRNyVik7UF1yxA+4EOLrcd/9q4O5/5Bc6nn2Oo6ll2uyfKdt/6XShjhQAZ
	brnBUlJzjELleAS54a3Fu9v0RtTaXV6luwN3ZdfSpul3CzRI1VMAB8i0SMVVNUgQ
	A==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11020099.outbound.protection.outlook.com [40.93.198.99])
	by mx0a-000eb902.pphosted.com (PPS) with ESMTPS id 4bexev3d75-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 05 Jan 2026 12:06:34 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kssKoPX8Rj09vOa041wBOyF9Z+IJqvxtgRoXR/SlD6Cjk/4Oh1qCXY8EyOtOmYvkwoO5Hk7QeSSjh7HcH/rH9aOm1EKvz+jCNiDgW8Vi8/3XuUFebrAfTS78ZivqP1CI1VuiATk3Kww8hDIfYtb0DdSj5p0QWj2qqJOeNZQ4lKFAHnyvIjQd0teW/6boOs+H/0UOJB1PuKUOqt0hPm2XL0bStWvCzV39fcopmMm+moNIaIRT7rmwy6GPxW/9nNA0cB4aVVrA3049d1GIpP0Xy+i5/pDaBnhkCZ0NPL26N1l1SHWAdIkoWJIBApNo4W0KdgPJF1oHnjwivtdvJNk5Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P6bsOYeXm3bBNawHYFNFu4PUTCpaxoCukXjn2RMZN7Y=;
 b=D5GnXcU5CHFgcuPKqJJ0ofxPYGwcu/hwTe4YvE4eKcAoHBNti5CFnWxZZwIUofs9ukFIGRLSm3juVswv92yrYM4v0h+q3oPKEIDD7mK3Yo7WSWxCsvGTWMvDzXbQJtH0n9Y6mpzBLBpy0/7RhO7aI+5XyLTndS5bqrhizTjypp9z4CwNJaIzAUWX/bMugR1sBsXn5hknCgTk168IeFohZcZWkc7z92LgTDmxh/5zWCsB3xTLFmI+lUhMg3ySC59WDS8BwvBpvFx/rj3Rg/VkNYfL51ILidHk63TwtDcqRQoMHY2lx9CJBqx6lxzGmTWeGeplrws5Dzkos7Ln5awvDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 204.77.163.244) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=garmin.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=garmin.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P6bsOYeXm3bBNawHYFNFu4PUTCpaxoCukXjn2RMZN7Y=;
 b=ZLeeALsiMoJkB3bGBJdSUEj2cTeKD9uH4HX5IuGJ7N0FGp5OhDDm6rbQKLavAtcfTKMKArlapYoOme86djF55PwD8zMe9uevwhJsHAMHNtsZqciP85RnefjVOGSHCHSrCmBpqRtv1v9DyEkeEJyIZPfrsx1XpNHFBDn83TKeqwWas5vFOTbKAzXTIFuzzca2AmQE2FdRI5vSLTQpynnzyEDwQBA1PKg+8binsJJ2mgLQxYoxaUR2nZQ2b2zeKI/z1Xu/I3n1XGy4PIfOQHAJFhwLYjR9zlamsZbm1wCqNqv+bHYdQtLCRcZWJB53xgANL1O/EnmODMjffDi1LJFcFQ==
Received: from CH0PR13CA0050.namprd13.prod.outlook.com (2603:10b6:610:b2::25)
 by DS4PR04MB9746.namprd04.prod.outlook.com (2603:10b6:8:278::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 18:06:28 +0000
Received: from DS2PEPF0000343D.namprd02.prod.outlook.com
 (2603:10b6:610:b2:cafe::2e) by CH0PR13CA0050.outlook.office365.com
 (2603:10b6:610:b2::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.1 via Frontend Transport; Mon, 5
 Jan 2026 18:06:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 204.77.163.244)
 smtp.mailfrom=garmin.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=garmin.com;
Received-SPF: Pass (protection.outlook.com: domain of garmin.com designates
 204.77.163.244 as permitted sender) receiver=protection.outlook.com;
 client-ip=204.77.163.244; helo=edgetransport.garmin.com; pr=C
Received: from edgetransport.garmin.com (204.77.163.244) by
 DS2PEPF0000343D.mail.protection.outlook.com (10.167.18.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Mon, 5 Jan 2026 18:06:28 +0000
Received: from KC3WPA-EXSE03.ad.garmin.com (10.65.32.86) by cv1wpa-edge1
 (10.60.4.255) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 5 Jan
 2026 12:06:08 -0600
Received: from cv1wpa-exmb1.ad.garmin.com (10.5.144.71) by
 KC3WPA-EXSE03.ad.garmin.com (10.65.32.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.17; Mon, 5 Jan 2026 10:06:10 -0800
Received: from cv1wpa-exmb1.ad.garmin.com (10.5.144.71) by
 CV1WPA-EXMB1.ad.garmin.com (10.5.144.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.57; Mon, 5 Jan 2026 12:06:10 -0600
Received: from ola-jnrkg73.ad.garmin.com (10.5.209.17) by smtp.garmin.com
 (10.5.144.71) with Microsoft SMTP Server id 15.1.2507.57 via Frontend
 Transport; Mon, 5 Jan 2026 12:06:10 -0600
From: "Colin McAllister" <colin.mcallister@garmin.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Colin Pinnell McAllister <colin.mcallister@garmin.com>
Subject: [meta-webserver][scarthgap][PATCH v2 1/2] nginx: upgrade 1.25.4 -> 1.25.5
Date: Mon, 5 Jan 2026 12:06:05 -0600
Message-ID: <20260105180606.2192902-2-colin.mcallister@garmin.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260105180606.2192902-1-colin.mcallister@garmin.com>
References: <20251231153607.3978985-1-colin.mcallister@garmin.com>
 <20260105180606.2192902-1-colin.mcallister@garmin.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343D:EE_|DS4PR04MB9746:EE_
X-MS-Office365-Filtering-Correlation-Id: 0173a9a0-fc3d-42ca-1276-08de4c8525ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?injwdydt+0zn0JFqlIhOSDoh0l+Z4SamW0Gg+bHDHRA87A1bmeCSALPUToQ8?=
 =?us-ascii?Q?dmM8Xti8p3fKkT/cDh0Yciov4fgLFMjYX/O4BAFF27NK2VvsyYGNc6uldkBS?=
 =?us-ascii?Q?5ahBnj83Mm3S6S5rCW+GLzL2FkxbNCJxw55Ul3Cfbhvj30mFSqUqvUiAMAxq?=
 =?us-ascii?Q?ezWz2dGePEqFJ8jZnXoXQSvQCJiJ0kR4xxwAIL/wx8UiAquWL7Vw2NdW54Tk?=
 =?us-ascii?Q?RDprgi6Tza8nnGfEwRUBmaVvTW5/XbG7YmJx74CD5FB1zuM2iaNZUHsdLEaj?=
 =?us-ascii?Q?NieRFgVmlnRkDGSomZI3MeUB+P2XNG1ZvM56myKU7FjDI0exZgk2KrKqoEJl?=
 =?us-ascii?Q?c1DY2LUxRbZa07hERuU7dZqXsoyipDWp9Cy6REUP8VcY4JA+etUl9RQGkbVk?=
 =?us-ascii?Q?/NCkOYHw6lf2Fi/O089ogk6737J7z/N2LLiECIUOmmCkwEXGQ2CnvZVKPJv+?=
 =?us-ascii?Q?fF6SXioY8zZuUpVFKhtC5ArwThGqGhDWu2IuaGjpJL2OR+qjxtx7b8qpH/Bg?=
 =?us-ascii?Q?idqdRDSEHT4iMD9lRDjw5L5jtR9ct/9w6ljrihMApx3fKRiKO9VrpU5NyV81?=
 =?us-ascii?Q?AK8e81lZ/qdYRao2WiwYvkdBvTAC5pDggiTJYrpqUWTNmbQ22KfNKnZ1CRFz?=
 =?us-ascii?Q?8ZvSxKRlLcTY1GxPzJTSeaRNVemO2eQ+fPfWdlnbp4a8tFRD3IQneQOAumxg?=
 =?us-ascii?Q?vaPMtj9XWFZQXYJpRZasiimnopQS1eLgZbxvy3sh0ylgbj+uURxGxnIMtfJn?=
 =?us-ascii?Q?k1RbpEh1FTtCEpBxsbsYNitfuziz/Ano/AkilxYQYdEkBxbIdCdoTO0TA0FR?=
 =?us-ascii?Q?7GNeaDcQQBEreK5Oj1EnU22GcraewQvhffsJKBmsdpvauRsFc1SU89UNQa1A?=
 =?us-ascii?Q?/ITjFOKyjCzuaYTEXvVjNQA+TgHHQBkrBdywIhxTpyrk+PstfzLLoYIDKjtn?=
 =?us-ascii?Q?hQTU/s379fBFD4273p7aJRqCnZhRabAdkcN42OwEYT2H9j0LAePYrNHbdNEz?=
 =?us-ascii?Q?QCSXdXz2RaUcy5FxmbIZFfiCBJdpvg5ZZOCY/gvuLNQrpCPdpP987xoQWGm7?=
 =?us-ascii?Q?5g9zAcexyxYt7CLoB/avsgEypEa7phKzyCeCvn4H9qLpIBXrOzsuSFr+meNv?=
 =?us-ascii?Q?F/rjvmG+2UuJ/uXrRLM+1D25WHvUywxwOxANohxVbwW7u5T74TK6A230psoA?=
 =?us-ascii?Q?THmd3ZjhksHfyuhUP7/69YtG/rIMqgC8btQwTKSdXy4DHfJjR6oEbrKBfFnn?=
 =?us-ascii?Q?+p5iveKEe9JICPQ7AwjayI8a19x0j3sgorEnteAG3BLG5AMeG/gz4DVwCFh4?=
 =?us-ascii?Q?OxLYfGHaudLankF3Ka6AhDrqrixaIQ+c08O/dQ5annuFjMQb1qa0Hnpfx/MV?=
 =?us-ascii?Q?2FePXqLa7jShpGVBIw50LdRUg7/xtiHPisuQfQTj+5BnQWNpurtMrzPaWWaL?=
 =?us-ascii?Q?sQM+N/wT4GD18+i0dUWXvD3339G5PQz0u1FxmknTh9WNhejZk8u90eyV7MbB?=
 =?us-ascii?Q?w6VrxPFal72FU372iBTB2abtk+6kSiddhYxz6ByfNyC8mX9jk7lsgHFa7YuQ?=
 =?us-ascii?Q?+oaJL+If3C+lnv4OisY=3D?=
X-Forefront-Antispam-Report: 
	CIP:204.77.163.244;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:edgetransport.garmin.com;PTR:extedge.garmin.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: garmin.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 18:06:28.2423
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0173a9a0-fc3d-42ca-1276-08de4c8525ff
X-MS-Exchange-CrossTenant-Id: 38d0d425-ba52-4c0a-a03e-2a65c8e82e2d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38d0d425-ba52-4c0a-a03e-2a65c8e82e2d;Ip=[204.77.163.244];Helo=[edgetransport.garmin.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS2PEPF0000343D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR04MB9746
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDE1NyBTYWx0ZWRfXxJjXlDL9xoLA xKo4U9H6tP0WGcjxLl1qCUHGPKhC+tUwfrAmY6BzVFTLFl6q9OfCBZ5/R5drQUfn0SDrNzsE3bL mvdXNFSy08vHyhCAdT915nUeR8p5PNmA08L55PNVSQXUqidrtDsPtLUNbx8td1G1/1ifOdyHpOl
 9LYy+6C+MyGNQVQrG+fpAP8NvMFbOLNUH53WGIxtuira7T2Y1ByLV1Wa7msIFWhBtmuSBUHyp8A A0jvA3nRxnzafwyHCONU3YbChkgw8rTYl26HzWjpiiHA5z3FpmATjZTA9eIKNhGFdwpAYXz7Mav zk4v4OuXAb5ay2cF0yQLSeCa/y6wynKd61hQI7odGF2WAv+HsYKf4aB3LL0HHsszLVWE/RnYed+
 Csmsv05dAwF0sbH8XfAN4+kPOQFfWwXwIh/+KMFxkANpay+EHju0ebeaPOQ7DhzlIJyjpzf/SU3 CZovPUg0XkivLRz54nrNskuKSdB6xamajz6rbUDE=
X-Proofpoint-ORIG-GUID: NssxrGTqVU8rSf4uET90aJ9DpLOkA8xY
X-Authority-Analysis: v=2.4 cv=YJmSCBGx c=1 sm=1 tr=0 ts=695bfdaa cx=c_pps a=GknEWMF7HrfbFJOd498rxg==:117 a=YA0UzX50FYCGjWi3QxTvkg==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=vUbySO9Y5rIA:10 a=qm69fr9Wx_0A:10 a=VkNPw1HP01LnGYTKEx00:22 a=9bLDTSi9AAAA:8
 a=NbHB2C0EAAAA:8 a=b246G4cK6kZ7vuBO_y4A:9 cc=ntf
X-Proofpoint-GUID: NssxrGTqVU8rSf4uET90aJ9DpLOkA8xY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc=notification
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2512120000
 definitions=main-2601050157
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 Jan 2026 18:14:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123160

Changelog:
==========
https://nginx.org/en/CHANGES

*) Feature: virtual servers in the stream module.

*) Feature: the ngx_stream_pass_module.

*) Feature: the "deferred", "accept_filter", and "setfib" parameters of
the "listen" directive in the stream module.

*) Feature: cache line size detection for some architectures.

*) Feature: support for Homebrew on Apple Silicon.

*) Bugfix: Windows cross-compilation bugfixes and improvements.

*) Bugfix: unexpected connection closure while using 0-RTT in QUIC.

Signed-off-by: Colin Pinnell McAllister <colin.mcallister@garmin.com>
---
 .../recipes-httpd/nginx/{nginx_1.25.4.bb => nginx_1.25.5.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-httpd/nginx/{nginx_1.25.4.bb => nginx_1.25.5.bb} (74%)

diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.25.4.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.25.5.bb
similarity index 74%
rename from meta-webserver/recipes-httpd/nginx/nginx_1.25.4.bb
rename to meta-webserver/recipes-httpd/nginx/nginx_1.25.5.bb
index 5ea2f5726e..b8ab1ef59e 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.25.4.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.25.5.bb
@@ -6,5 +6,5 @@ DEFAULT_PREFERENCE = "-1"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a6547d7e5628787ee2a9c5a3480eb628"
 
-SRC_URI[sha256sum] = "760729901acbaa517996e681ee6ea259032985e37c2768beef80df3a877deed9"
+SRC_URI[sha256sum] = "2fe2294f8af4144e7e842eaea884182a84ee7970e11046ba98194400902bbec0"
 
-- 
2.52.0


