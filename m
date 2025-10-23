Return-Path: <m.schwan@phytec.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79709CCF9E5
	for <webhook@archiver.kernel.org>; Thu, 23 Oct 2025 09:47:11 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.97])
 by mx.groups.io with SMTP id smtpd.web11.16435.1761212820808700986
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Oct 2025 02:47:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@phytec.de header.s=selector2 header.b=m8AD+xES;
 spf=pass (domain: phytec.de, ip: 40.107.162.97, mailfrom: m.schwan@phytec.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Euu5mWp/73RnhX0ZHKqQ0A0opcQeiMCY3f8lXc9ywXKxoCr/7DdS+nm1lnpOi3ku++CI2yaQRZrLZRaizAjWTFFWSWRwJIvvbDCO4Y6KLpmGSmyPL3uZraWXrb4sWUf61wHK3UTlywrGrkWz65WYnE5P879hGPYcsJaAVv0Y/JBSZNQOYeTYwkZqncQ+u2eYlFHid5xWj9zaEPDN6JhFhoCpMLuqFGiQ3V+cwkrdurQHxIGi7HTbVYCyT8zV0Tj+35u7+aAeyyWAV5pvSnUla19qOc+4syuqy9bzutwjRX0lIikgvnigFoOQJaf97MoyezN1koASapBkq/SJo1bC6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VBnzpyKww+TeuKILOSkTjymhSJYqf+mkDW1AQpgnQiw=;
 b=BIwwvmTIV7cVLE6hiwrmQ3DoJ6M67LVPRqyFbyUO72GlgYz3EK4WSNrP6IFGYcfEf8AjmRpt/pvWYWJ/sYgr+UtT9zB/DPiHwwN+NLGsJuQy+isgLv8d8k7EdiJYLo5OCIBLRZ+4y1vMIm6Jh82QrmLkEYxpl6+OOW3Ysfu/0L1llAnC7+674IeFVYN8v+PTsU16oNitP9uDXjf01BydKUIymQGk8Fms1ACwQO8NVRvFG06fehBzJ7dwCAF4VV0xlLQmIC5bbPaRc7PWNcCVyoH3j/ZXen2rthyVjgSyX5ZY0+6N/WxrXHorMTFxTwtC1hOFNJp+jrIMA14eUtuF7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=fujitsu.com smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VBnzpyKww+TeuKILOSkTjymhSJYqf+mkDW1AQpgnQiw=;
 b=m8AD+xESpXacbGG+RbCLQPb5miqvLT7whQnJB77mdC3muMUyXOY38dVZ3kmiROZ8mYusl1jYsuvzHsNw7WgFveeBGMZgUrgl5L2iZI1U6glhcg0rp6XtUis7tWd+ftomFNrQfOttTI/CG4u9kiRlVKA+3yBtPlNPHMIfvBwdpczzrOFe1/nguqfD2wM5yOfOf+ZLnMCUEYgMlK4+gX3rfFT13jm1D5PGcVeTH0TJcHAyOGNahDVaCjf8Uzdr9ngkcqNydYjLkBbRc/s1mV8HQYlhcsZU5eKgyP8xtIoBMBu1oYQPtgm+5yUKmDR4zVCO8jf3hvIBVYx/299b69dBOg==
Received: from DUZPR01CA0060.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:469::18) by AM4P195MB3039.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:6e2::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Thu, 23 Oct
 2025 09:46:57 +0000
Received: from DB1PEPF000509FA.eurprd03.prod.outlook.com
 (2603:10a6:10:469:cafe::6) by DUZPR01CA0060.outlook.office365.com
 (2603:10a6:10:469::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.13 via Frontend Transport; Thu,
 23 Oct 2025 09:47:24 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 DB1PEPF000509FA.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.7 via Frontend Transport; Thu, 23 Oct 2025 09:46:57 +0000
Received: from augenblix2.phytec.de (172.25.0.51) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 23 Oct
 2025 11:46:55 +0200
From: Martin Schwan <m.schwan@phytec.de>
Date: Thu, 23 Oct 2025 11:46:32 +0200
Subject: [PATCH 4/8] python3-pyfiglet: Add recipe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251023-wip-thingsboard-gateway-master-v1-4-570de0ecafb2@phytec.de>
References: <20251023-wip-thingsboard-gateway-master-v1-0-570de0ecafb2@phytec.de>
In-Reply-To: <20251023-wip-thingsboard-gateway-master-v1-0-570de0ecafb2@phytec.de>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>, Khem Raj <raj.khem@gmail.com>,
	<upstream@lists.phytec.de>, Martin Schwan <m.schwan@phytec.de>
X-Mailer: b4 0.14.2
X-Originating-IP: [172.25.0.51]
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FA:EE_|AM4P195MB3039:EE_
X-MS-Office365-Filtering-Correlation-Id: 467ba21e-496f-44e4-c64b-08de12191b15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?YWVIemtJaXRiQVZPWEY3Q24vckhNRUNoV2J5UnJidWU0UGNCV1RTaTk4ZXZS?=
 =?utf-8?B?UVM4L010aGYzZG05UmxKYzhYbWdHWnlNQ21LS1d0c1gxaWhXSTZndFV3anJz?=
 =?utf-8?B?Unl5OGZ0YTVXc3NSSFBZbUhUMHU4MUZqWHJNZzdXcHloWm43elMveWZ2T2FC?=
 =?utf-8?B?YVFEdzhZdmd6eGZmdnlhdjBHTisxS3RDYlQ5aE5RcjdTdVVzV1gyYjVPZ3B0?=
 =?utf-8?B?bHBrUnFpVHV4UDA1RWRGYkZpbUIyd0hRUVVZQlN5aUxyTU5OZURxdXFCN01w?=
 =?utf-8?B?eTRaWUE5Q2VnM1p3MEF5cXd6T0RPb2FlcmVlMlFhalFMOFkwV1RlTGZGYmIz?=
 =?utf-8?B?cGVNUzg3c0oyTFVzQkVGVzZqMGZRbndxZ0w5MjE0SzlrTm5Wa1ZCWFU2ejBm?=
 =?utf-8?B?djhuZTh6YlNJUFljd1pCdEltaXE2RWhrYVgwTURaRHFSNXE3ZThHUVlCWDdq?=
 =?utf-8?B?dlk1d2xhUkFzWWNxV2hkc0dWNlpzZUIxNDYwK2ZjbU1RSEhPdTJXNWlCSUdW?=
 =?utf-8?B?a3QyUU12TVhGT1B4TlZRWnRCNWpLQWNvckRDLzRWZU1LZ3VUMVVqTmV4QUJZ?=
 =?utf-8?B?MFFEZlBtUHZVakhGdWtzaC8wb3E3Vmd5dHFkZC85ZnpUb3hTNU9POGVodXBu?=
 =?utf-8?B?Z2xRNmNuUjRydXUyNDhSY3JveHNUcDVqdjFhN3dTQ2I3ZnVlZjZjUno4RnhF?=
 =?utf-8?B?cDZNZnZUQm9XRWM1RGhZU1VBTllqV2hQc1gwVC80cUJFZnZDWmYrRTQ5R1pY?=
 =?utf-8?B?eUJVZmVqYU9mVStzZXJqQWRtU2V1a0JvZUNDVjVSbDNTMFNMRGd1SS9vNklX?=
 =?utf-8?B?RzFjRUlTN2puSHd6UHI3bUY0aEtDYzNPSzhrRnJZUTdSVHZpZ1p5ZFNjOCtU?=
 =?utf-8?B?bTlzbkdSV3NnUWxZY2pBVkRXd25KanhUNzl3YVhTd0hXQjJvWTJvZk1EUUZI?=
 =?utf-8?B?M2NwZGVoRGZTMGVPeVhaaFNhd05acVdsZlh3dDVxOGhIdHdFMFprY3BVOFZs?=
 =?utf-8?B?Yy9aRGltNFNhb0Q5Z0J6bG9SQVN2WmxGcVFpOWxRUk9HYXZycUVPcWdPbXR5?=
 =?utf-8?B?VFpET2xFNzU0VitTQ0tMZnMzNlJZWndBb3VkR2N2WUxxTDUwUUV2cHBIclhB?=
 =?utf-8?B?UUpzWk1GRVlkYS9Xc2pkUEdOLzM2ak9MaHBhOVE2MS9LRFFJMHc0VmduVlIw?=
 =?utf-8?B?bVFZMmRIRnkxbEdoUmROQzhLUkxpNjFqWi9BSmNBQ2VkOEQyWjd5YWY5N1k1?=
 =?utf-8?B?dnY3enE0d0ErS1hhY211M2hIbStIMlZ3T3gwSkdBNXF5SGJiMitYVDRGWlEz?=
 =?utf-8?B?cUJFQjVsRDJlblVXS1JYcEhKN1dkTmxXa1EyV2JjV01WZ3N2N1JONkpYMTly?=
 =?utf-8?B?d0M0VmxKaVBWbUVGOUVyUDZ1c2JsbzJHUy9CTWhoUURTUFpmMlJ2VkdRZmJO?=
 =?utf-8?B?K2htaHF4aDVnQTVaU1JaNmw3M1FFbDdwN2RNUnFxVFN1RmIrdmpQMGdTVzdw?=
 =?utf-8?B?K0xVc0pQMUFyWjQweFVobzQ2NzZPb0wrZTZOMjhvbWhiQ2hhUlE3WmJJNUdl?=
 =?utf-8?B?UmRWeE5UM3NHTml6alVtWldOY1hIVjRHOWlBWldEWEE5d2FOY2NQYXd0VGtY?=
 =?utf-8?B?TStQTTR3eHBDWW9BR000MlNnaDE0R0pEemJ6Q01QRnV4YkdLL0Z6aTlQSmVz?=
 =?utf-8?B?aSttcTVqaGt3V0ZrV2xJZEg1TzdlRmRwcHZtd2VjcXpYNzBMdENMOEdyMk84?=
 =?utf-8?B?Q2JnbEgrMndidU5USHNwS2c4T3VNZFJqRnhxZ0hibkFudnVLdGhMK3dPSkhF?=
 =?utf-8?B?RkoxcDYyMmZuR1Ztc2dGMkFGbWtBemgwWDNCUnQyU3dVR1dYYVZWd0RZcFVY?=
 =?utf-8?B?V1dWbjh3Z1hCTmlzNkJFMEk2YXAxR05kdVRPbG53Ump3OTRQb2ZWU0NMRWpo?=
 =?utf-8?B?UGJUL3YrQmw0aVdKN0hlWU5UVG5jYWVpaGk5ZXgwQWtySGpybE1JeWFTRnI4?=
 =?utf-8?B?a3I0T2JWWi9TQzJlMElZdEtyeHJySktvUVJoQk1OcFpycVNNT2FvT2M5ZEx3?=
 =?utf-8?B?RGRKT2JWd2Q0dzlUTlp2UnkxUFBEdXlHQ3RkQkFudmZiNFRnWXo0aE9iUm1o?=
 =?utf-8?Q?iKrA=3D?=
X-Forefront-Antispam-Report: 
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014)(13003099007);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 09:46:57.0365
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 467ba21e-496f-44e4-c64b-08de12191b15
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509FA.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4P195MB3039
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Oct 2025 09:47:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120920

An implementation of figlet written in Python.

Signed-off-by: Martin Schwan <m.schwan@phytec.de>
---
 meta-python/recipes-devtools/python/python3-pyfiglet_1.0.4.bb | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-pyfiglet_1.0.4.bb b/meta-python/recipes-devtools/python/python3-pyfiglet_1.0.4.bb
new file mode 100644
index 0000000000000000000000000000000000000000..948bac56dfd2d4debf30bff200a6f0a52869a818
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pyfiglet_1.0.4.bb
@@ -0,0 +1,10 @@
+SUMMARY = "An implementation of figlet written in Python"
+HOMEPAGE = "https://github.com/pwaller/pyfiglet"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=f37a72c457e560fc4853ae67f3f9cc0e"
+
+inherit pypi python_setuptools_build_meta
+
+SRC_URI[sha256sum] = "db9c9940ed1bf3048deff534ed52ff2dafbbc2cd7610b17bb5eca1df6d4278ef"
+
+BBCLASSEXTEND = "native nativesdk"

-- 
2.25.1


