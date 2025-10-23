Return-Path: <m.schwan@phytec.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 881A7CCF9E6
	for <webhook@archiver.kernel.org>; Thu, 23 Oct 2025 09:47:11 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.113])
 by mx.groups.io with SMTP id smtpd.web11.16436.1761212821021939442
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Oct 2025 02:47:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@phytec.de header.s=selector2 header.b=S9CMfDkL;
 spf=pass (domain: phytec.de, ip: 52.101.66.113, mailfrom: m.schwan@phytec.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D22H16WU0pkrqrXxb5rCZdMsHeMdEqT2cWb7xsCEYA/Vuwy7UvW1xKafI2mNrRUdsO/eWM6eCYRQP4jaAeFuOf8ykV9KMqM8Wjup/vS6fVW5cwtYB56CKJs0i9Thm6wwl/B/i10i6hi6U3w29Wzh14NAXRzv6BhapYLMDTFgNpd8mjed42G+N0fIDD/ZxO06HeyVU0hj0HWsiYgbYyW9DbGlASyGuOPufsdIcJRmfulPuY+Monri24ZfA1qk9cNWFjD4mxlDnM371mnr22qWIpN2XYidJFdT0COHJETBKp6An3bdUj+KipHMnL8pDuw/hrr3BTzf2/Nctd3MB5jgsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jmL7rpefQ7ZME6aMML/cVmMlhX7G9fVHuNeiC7TrR+E=;
 b=w2CDHDkPztWsmU98Un3P/bxG29D1K8ROk1FSfrB/yWIqlwfq5NSejXefnpu2iKScsxPhLTFg1FNlVnqyOWy+M63LfJCjgPZgov8feCXP3gOKHJ98yIj/y4vFEMjBSxxgJBFJ6EFEI/ZEnwXNHlMS0PLYYJh4CFBJuoS9+j5I8wKISZlYo76FGYamUoHbz26Uog6ejiu/H2njIe0f0MoDAK/3bH+CtFsrNmKFdGdil3oeYSfKWgeXmJXq3paeE9pciMoqPCale8WyUTrLNzmSdccJK73JSYn+j/o0k+oEKPbu48QlWWJ7ohF/PhY6+QYs24EZncjJGnDMbAmFzr0FhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=fujitsu.com smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jmL7rpefQ7ZME6aMML/cVmMlhX7G9fVHuNeiC7TrR+E=;
 b=S9CMfDkLIEOo8nEx69hVs6OvEq5yWl+BkKLBGGPeM88Jx2GpSBjWcCqoI11mtntCUCIlNSGUnXOnNSqAiTRm3pwvRMgC7+vEfXMNkQGXUfmJorfMcFKOjCP1F+l4jM2McmDiClU3n5JMq9R0mTciT8uLLERyWivoXAE2SfK4WbYwbXcLz1S70AKkMwVccVg6BWnE1KDfU33hvE0MvGA4RXYCr8Njbd2Lx6b9jvSMtJvKKGOA7mfLXjnGYQFunDdGHMHLBA+WFBu+ZR+q7gkxZNKtrKU64pVI5bYs+clNQfAZo965o1d/Ti6SjQ0HO24Uc3SK/riIHx3HN5jiV8q+rQ==
Received: from DUZPR01CA0056.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:469::7) by AS1P195MB1594.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:4ae::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Thu, 23 Oct
 2025 09:46:56 +0000
Received: from DB1PEPF000509FA.eurprd03.prod.outlook.com
 (2603:10a6:10:469:cafe::f5) by DUZPR01CA0056.outlook.office365.com
 (2603:10a6:10:469::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.13 via Frontend Transport; Thu,
 23 Oct 2025 09:47:22 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 DB1PEPF000509FA.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.7 via Frontend Transport; Thu, 23 Oct 2025 09:46:56 +0000
Received: from augenblix2.phytec.de (172.25.0.51) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 23 Oct
 2025 11:46:55 +0200
From: Martin Schwan <m.schwan@phytec.de>
Date: Thu, 23 Oct 2025 11:46:31 +0200
Subject: [PATCH 3/8] python3-pybase64: Add recipe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251023-wip-thingsboard-gateway-master-v1-3-570de0ecafb2@phytec.de>
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
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FA:EE_|AS1P195MB1594:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bdf10dc-51a9-4c00-79a5-08de12191ad4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?cFQ4ZUhndWtCWmxmMWdKR3BpQXUwV1E2NEt4N3pHUC9NMnN2dDJRTFB5TkFT?=
 =?utf-8?B?Zmp5dTdIUy9NRmVDb2VycVh0T0c0VVluKytrRFZFanR0eHVXWlR0a2d5cXI2?=
 =?utf-8?B?UHkrV0ovcVk1TXVFVys5ei8vakNsdUNvZzJhVHpwTDU5K3ppT2xaMGlPU1RR?=
 =?utf-8?B?TDdEWWY5L01GOVN5bTBTWnladU56dnF1aEpVNGdmL0txeDlyanJXdkk5dXpt?=
 =?utf-8?B?dnNFR1JuN3RVUFUxaXI3VkNuZlBocnQ2dnRnMmYzK0lDc3FMb0E3RTNTb3pl?=
 =?utf-8?B?bk1PUm5SbkcwbnpZeUt3c3lRVnF2RTJ4WTY4ZmY5azhoQU5ZZ1FFRm1jcUxP?=
 =?utf-8?B?K2pTVGh6QTdoUWpUa0lPQ3FieVBkNno0QjlwVUNzWUFpVWlMY21oWkdCUUlt?=
 =?utf-8?B?VzM1SHpIR0lTc1EwVGxxVTBZKzAwYmFTbi9IWUdHbTN3OTNiQnNRYUkrb0ti?=
 =?utf-8?B?SzJtR3AyUnZlWUk0MnBRQkVaeEtoMXh0OGZBVVdhUGovdUN3VG1CSXpxQ3p5?=
 =?utf-8?B?RlpUL1ZKUkpqSW1GUUtqL09Ia2dYZVB2My9BellqODJ5U0YxUXFUV3hySVl6?=
 =?utf-8?B?azdjNFEyOXRKV2FDTlVnNUsvajZXVVZDcFZqVHoxVEd5RWkya2dZaEo5UmRK?=
 =?utf-8?B?bmdScU5yTHordHRlZ2Q4M0pOK2lyS084M1dnbjhqV3ZCTW4vaS9mVFdVcXEx?=
 =?utf-8?B?Y1pyc0Z5a3V0S0NjTFhEVUFFZ0wwRTJpcXNwc3BLbmRVMHE5aDRGaVYwM1E0?=
 =?utf-8?B?RFRRa2ZzSzFOeWxDbS9sWk1aWHJBcndIMCtQN3hsMkdXWm1LZWVQSldhYjVF?=
 =?utf-8?B?L1ZkTzcyaHdWRko1RWxLNzlsenhoMFltc1k4K2JqZFJyNnNEbnN2REZIcExZ?=
 =?utf-8?B?TEo2b09jUnRIK1EvVE9VNUI0MER5dWhzRUtxSDdtZzVZaWx5cDloWkdnbXlG?=
 =?utf-8?B?eUFDV1EzVi9Bdk9BS1hQTXBqSzdrZjNkK2JJTGtNU0gxTTlvMVQzeGxPR2dE?=
 =?utf-8?B?S0t0MGtEL0xUeUhKUEpyKzRqUFl2bnRzeG9NVmNCZHBRemJIM1c5MW1QSXoy?=
 =?utf-8?B?VDBPVXVDelFlRXdTN1dyRklUaC95cFNYN0lWWFdHRnh3Z1JwaVllQjhwK0p5?=
 =?utf-8?B?MGNlUHEyNnlrT3h4RVVIRkh2YUU2N2Z0THl2T05VdWRxZnFEZ1ZraWtZb0RB?=
 =?utf-8?B?Y3prY0IxL2RMVVBzc1hGNFFWNEZaVFgrT0tqRVVKbXJHTjJGSzdNcC9qcnMy?=
 =?utf-8?B?c3A3ejNMUjhvMXJrUGdEMGw0dENNcS9SWkc0NVJLazNuaUZxWWJzQUFEaWtU?=
 =?utf-8?B?aGM4czFhcEY1M09vN3l0cXQ0eUdXL3V2MkVyUzlUMUF4Y2cwQ1Nhcjg0ZVVa?=
 =?utf-8?B?RG8xaHVudTgrTXNLR2g2ZlU0WUFhOUxwRWkwUFc2WnRpZFRxdE8yVm14clJF?=
 =?utf-8?B?b0lPVWx5UlBLclFXbjVaQ3M1ZXNzWlVkYm14aFhIUUdlcHVSNUdOMzhkYWdt?=
 =?utf-8?B?ZXBnSElnL1prOXJhbzc1U2ZwQ2RUSWl2VVFEYUIyZWpWSVNxRmdrWStYZWFi?=
 =?utf-8?B?blVLYlo2U2Q1T01IcGUyM1ZqcHlIZzU0NUludGo1emJqSTQvQlJnakNJZ053?=
 =?utf-8?B?QXNFUGl6Yis1SUhQT1JsUHZiNEVNQXJlWEFkR2hGUjFWcTRGNnZJNnlObTVK?=
 =?utf-8?B?QXVCKytxcklnb3dYSmNoT1BxMlgzVnNZblJRb2M0VVZZQ2lwSHI1TUp1NSth?=
 =?utf-8?B?U1QrN3dTOHNRSnhvWEhsazVFc1lxYXY4M0JLVVhFd0hQNlJKL3FNQnh3aXkw?=
 =?utf-8?B?RnN5dVdNeCt3MHJCeEtqaExGbTY4d2o3VFY0aXcyV3NPSmU3aHpiT2F3aUo3?=
 =?utf-8?B?VFNNZloxS3l1RmhwYmtobmdCSHVpYmlYUXpNcm8zTUpKM205Rlcvc3Fod0tF?=
 =?utf-8?B?UHhzV2VOSGRQZElzY0VCeUpXQSttVkJEM1VqRmVzdFRCdGFUOVJLaDVWbktJ?=
 =?utf-8?B?TGEzeS9vbE5uZFVCR2xSS29ER1JnbnZFU1gxaXp1bGsramM4ZVV3bWRUYnR4?=
 =?utf-8?B?ZzNkZVIwVVNQYTN3VzVrMVdTc1pOcFYrTGI3czVIZ00vaUgxV0N3OFVoZlhO?=
 =?utf-8?Q?45p4=3D?=
X-Forefront-Antispam-Report: 
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013)(13003099007);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 09:46:56.6084
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bdf10dc-51a9-4c00-79a5-08de12191ad4
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509FA.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1P195MB1594
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Oct 2025 09:47:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120921

Fast Base64 encoding/decoding in Python.

Signed-off-by: Martin Schwan <m.schwan@phytec.de>
---
 meta-python/recipes-devtools/python/python3-pybase64_1.4.2.bb | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-pybase64_1.4.2.bb b/meta-python/recipes-devtools/python/python3-pybase64_1.4.2.bb
new file mode 100644
index 0000000000000000000000000000000000000000..a551034168fe525dafd33d822463137d38060d97
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pybase64_1.4.2.bb
@@ -0,0 +1,10 @@
+SUMMARY = "Fast Base64 encoding/decoding in Python"
+HOMEPAGE = "https://github.com/mayeut/pybase64"
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=84b11fa55a5d83cf6fa202fd3b49c7e8"
+
+inherit pypi setuptools3
+
+SRC_URI[sha256sum] = "46cdefd283ed9643315d952fe44de80dc9b9a811ce6e3ec97fd1827af97692d0"
+
+BBCLASSEXTEND = "native nativesdk"

-- 
2.25.1


