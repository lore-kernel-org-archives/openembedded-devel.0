Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA530C73C66
	for <webhook@archiver.kernel.org>; Wed, 18 Jun 2025 14:35:23 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.2])
 by mx.groups.io with SMTP id smtpd.web11.339.1750257316700452018
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Jun 2025 07:35:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@leica-geosystems.com header.s=selector1 header.b=bxH54GEZ;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 52.101.70.2, mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hc3EHuAcFbTrkeXdDsxXziMZ16Gu0gVv6Ev+STlsOM+clg5PwVpTyf8f68HIYx3Tih/iEOQxWrgitTX0myYQ5Zhf3aOEmTzbcjGynksQlC9PVJioEYsxXG+bAQ/+/wOBVTyPllUePfjW/lAWK9bw9Ylw59JY1gPUNZzK2Op6xPhCAgEmezfAV1LuVQK656esW8WYnUv6/6QfdZT9OqbvGdWjE3r24uSPNNHZFX+UkwrtkvMU/zkZU2NbVcLC9CxkIC+OIuqljTPu4YRynQDRsLK6YADc9uVPpPv2B3IrqkrOREpJwBWo0wAbsYSGIZW7VCu/76xRM92zSa6YNIvRig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yVHzrN34J+HoaOP1g5ukbkRqVPlQabutZYClk/u1Ytw=;
 b=UmtE9UnQvyzY6NkLL9Lal8fz469JWZr1Fn4VKHQSEs85POcp2InAm6EqbNEtajwHSGgz/qBNbVnPXsZPYEtA2zdr72dU0Lrg509XlZhzWW4hhP52K5PzAbt+k08hk12NmvBaOZSAF7zcIXRSOSSNdxZOS9jKlfoAHR/zARSQcdA4xoDP5xI+bYtOOnyodqz9aXGvsI9hMqNuifKI19XAU15EPMs0PwTwxsO0mocYxvbW61aRUFc1yxGrplA/rmZ+q1tuEX+59qKjTpw+40XMRCZ+jS8GSIlm0TssyJBdL8MsbH0cQct4lnVofCb6pvarh9M4T6mVHf2w7Vj9UYaxfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yVHzrN34J+HoaOP1g5ukbkRqVPlQabutZYClk/u1Ytw=;
 b=bxH54GEZ91e+RNRpxgkkwRVl8YEvTgyqoo4vHqKoyoLXcmu4TY/6RHt6cBWVT2IvjIfkVQRaSGXqvtwSQyy4PU/5kHAGhOp5Gj/L08zn9xUkDAl8S5U480+f/XkAcJub5Hta+D4h5x8Ov92+UwWC1qUmSPWilnaY+P8GWNxqKLs=
Received: from DBBPR09CA0017.eurprd09.prod.outlook.com (2603:10a6:10:c0::29)
 by PAXPR06MB7472.eurprd06.prod.outlook.com (2603:10a6:102:154::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Wed, 18 Jun
 2025 14:35:12 +0000
Received: from DU2PEPF00028D10.eurprd03.prod.outlook.com
 (2603:10a6:10:c0:cafe::6) by DBBPR09CA0017.outlook.office365.com
 (2603:10a6:10:c0::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.32 via Frontend Transport; Wed,
 18 Jun 2025 14:35:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.94 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.94; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.94) by
 DU2PEPF00028D10.mail.protection.outlook.com (10.167.242.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8857.21 via Frontend Transport; Wed, 18 Jun 2025 14:35:12 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.60.34.116]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Wed, 18 Jun 2025 16:35:07 +0200
From: Johannes Schneider <johannes.schneider@leica-geosystems.com>
Date: Wed, 18 Jun 2025 16:35:08 +0200
Subject: [PATCH meta-oe v3 5/6] signing.bbclass: add signing_extract_cert
 helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250618-signing-set-ca-v3-5-4ba014735f0e@leica-geosystems.com>
References: <20250618-signing-set-ca-v3-0-4ba014735f0e@leica-geosystems.com>
In-Reply-To: <20250618-signing-set-ca-v3-0-4ba014735f0e@leica-geosystems.com>
To: openembedded-devel@lists.openembedded.org, raj.khem@gmail.com, 
 jlu@pengutronix.de
Cc: bsp-development.geo@leica-geosystems.com, 
 Johannes Schneider <johannes.schneider@leica-geosystems.com>
X-Mailer: b4 0.14.2
X-OriginalArrivalTime: 18 Jun 2025 14:35:07.0544 (UTC) FILETIME=[300FA180:01DBE05E]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D10:EE_|PAXPR06MB7472:EE_
X-MS-Office365-Filtering-Correlation-Id: 2eb3f394-6b5e-4eeb-5a12-08ddae755545
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bllNMnd5LytXaGM2UFBhUUFEN1JKRHNDYWtjMm5wV2pFS2MzK1dFUkVDTzk0?=
 =?utf-8?B?dzA2ZEZ1QlRGTWZTbys2SXdrbkFPcGplYXE3QXY4RkJ0OXBvYldCSE5Tcm5C?=
 =?utf-8?B?Vm1LUURRck5jTjJEdjlzcXk1a3F0aEkvWElOcyt5WncybmV5akYyeE9zelhZ?=
 =?utf-8?B?V0l2RTN2djlPZDBXMEZ0dEdsbVkrcVRjYSs4akNkckN2b2R6YTF2c3V4T2x5?=
 =?utf-8?B?OGd1eE5zSXJMeWcrOHZ0VkwrdGFpRkZSS2tnbDFCc0lwZm04UDFnQjk1UWJH?=
 =?utf-8?B?UllDOVdXdDVGcWtjdnhlZXZNdDl4Z1FQTmk5eGpWbXhRWUI2d0Qxc055azht?=
 =?utf-8?B?cHArMElNYmZFZ1ZIV0ZtRzdzNDRzaVVpTm1EYTdySjBNNGhPY2c1TlJQcURm?=
 =?utf-8?B?YVdIQWZLWWdZbFBhV1JEb3oxQWVpbENaUWdmdHhOeFdmQTBxbStNZlpYRXdT?=
 =?utf-8?B?SmZ0MHVzZktrNGlrTURoVzUya0M1VDZSMmJ1ekprWE5BU2tPWHMyNm1qWk11?=
 =?utf-8?B?a0EwRTNKdEdPT3dZSXVkU0U1bmpuSjhhZnhMRGNwQXJtVXlKa2huWUVpS2U2?=
 =?utf-8?B?M0c5S2RRWDFBNmpuSmlodVhrMkNJdnhaYmNGZWl6RXlmUWZtaGxNWWNXREpN?=
 =?utf-8?B?WHArOWIvdEpGcUdhS3pQcWNyQkZ4Mm1peC8ySkpNaWtJWUFLNmw0UWlsVzhK?=
 =?utf-8?B?U0t4KzU3QnVVc25WT2l6SEx0REFPZ2dRelV0Mk14MnZrUThyYldWWGNKYmV0?=
 =?utf-8?B?eUNUZHVGMzVHTzZydDBYdnlYWkFrN3EyVDl2R1AxWTRLZHZhMGh5R0E0eFli?=
 =?utf-8?B?SjRYY1ZXSjQwSkJkK3loc1Bvd3FkbkpGUU0wcTZGLzMvNUtZNHVEdjRwKzZy?=
 =?utf-8?B?UWRBZW00dmhYbXRRdWk5N3hybWZpdGZXQm1pdkxvTVRDeHlybk5uTUxSMjRv?=
 =?utf-8?B?U244Q29na2FTbHYyYml6eDR4dXhjVTI3dXEzS3VjbTA4UGczQXBEQU9QZmpN?=
 =?utf-8?B?K3F0MWk5eFVFZGw5WE5oVTU5RUQ0NUdiY2JRMDMrekZLc0NKZzhYMlFHMFlq?=
 =?utf-8?B?V0NVN2RyVFJlWVMxdlk1cUVRcUtwRVQ3Nld4UFhhVWx5bkx2Skdpb0N2N0gy?=
 =?utf-8?B?cVhSYWlyTUFBYXl0ZkUwMUJtRzFoVkdOYy9jMjIrU0xFMUxCT283SVF6MkQw?=
 =?utf-8?B?alYveXdDY05Pa0xucXRQWldtcUw1QlEvcjF4UlRjL2dQZ1hDTDdKNEtVT0Iv?=
 =?utf-8?B?Zjg4MTQyb3Jpb09td0R4dVZNdDNYbWpMaU42RnFFTUJMNFhnNG8vSFJ1SFJX?=
 =?utf-8?B?NG10UTBoREEvNE9vUy8zNDZGTkpnWUhIUFNhektrTW4xSU1nTTNlM0U0Y2Ex?=
 =?utf-8?B?TE5vYVc2MmNjZUxGUjBWQ0xvTE1rclpYTGhMbzB2SThaTG8zc3ZMa05MNGpp?=
 =?utf-8?B?WENzb2JWSEMzcURrRWR2ZkFGeVdYVVVlOUUxR1lsUy9TMFdPbG1DVXZzZE5z?=
 =?utf-8?B?NHM0NDE5TlNYTm5MbjlhVTFPU3gxUFpQSDBySlJ6b0JXckltWWpudzJZZEhQ?=
 =?utf-8?B?WjdYVGMzeTYxVEdiRmxDU2VoVTdTL2FrU2FQQTBrM2duc2xUWFQ5VS9uVkJY?=
 =?utf-8?B?Q3RtSU5MNFBVZEVLTE5JelFBaWJ6dWkyUzNDN1ZVdFJNS3NYMFpZWkx3ZVpD?=
 =?utf-8?B?L0dDT0FDa0NaYmRvU05RRXZ6cVhjNGlLMG5oTTJQcGx6RnVGSEVaWllkRHY1?=
 =?utf-8?B?VDZLeFJ1QnRHejJPRnI5TWxJNmNmU1NGRkxjTzZ5YTcwTFdIZEE5QWtwNWJp?=
 =?utf-8?B?MW5ibThMNXczQXUzdEFTeGs3K3Y2WC94cFU1NFl4Ynk3SlI1bEtFbm55RVg2?=
 =?utf-8?B?QmtTZEp6OXd3YU9kQUUzdzR2TUd5bVZsclBNMGp4bWthdDVjc1hNSjN3SnQ4?=
 =?utf-8?B?WERFdTZHTHNLRzZQRnJLTWRySlpzTk1DMFFsdDVxRVlHZ1NEb0ExUUs4WVVp?=
 =?utf-8?B?OStkSnduZDd6enlnSkRTM3NRZnhPZWNCQVhLVGNiNC80WDJTcWgvTTd1ZEN1?=
 =?utf-8?Q?phDcnC?=
X-Forefront-Antispam-Report: 
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 14:35:12.0853
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2eb3f394-6b5e-4eeb-5a12-08ddae755545
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D10.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR06MB7472
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 18 Jun 2025 14:35:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117941

Add extract-cert wrapping helper functions, to easily extract
certificates again that had been previously imported into the softhsm.

Reviewed-by: Jan Luebbe <jlu@pengutronix.de>
Signed-off-by: Johannes Schneider <johannes.schneider@leica-geosystems.com>
---
 meta-oe/classes/signing.bbclass | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/meta-oe/classes/signing.bbclass b/meta-oe/classes/signing.bbclass
index 248c6400ed720e7131e618322314be9bb24a760e..6fde22bf22ace34ba720d7564caba176f4de4d39 100644
--- a/meta-oe/classes/signing.bbclass
+++ b/meta-oe/classes/signing.bbclass
@@ -54,7 +54,7 @@
 SIGNING_PKCS11_URI ?= ""
 SIGNING_PKCS11_MODULE ?= ""
 
-DEPENDS += "softhsm-native libp11-native opensc-native openssl-native"
+DEPENDS += "softhsm-native libp11-native opensc-native openssl-native extract-cert-native"
 
 def signing_class_prepare(d):
     import os.path
@@ -453,6 +453,30 @@ signing_get_module() {
     fi
 }
 
+# signing_extract_cert_der <role> <der>
+#
+# Export a certificate attached to a role into a DER file.
+# To be used with SoftHSM.
+signing_extract_cert_der() {
+    local role="${1}"
+    local output="${2}"
+
+    extract-cert "$(signing_get_uri $role)" "${output}"
+}
+
+# signing_extract_cert_pem <role> <pem>
+#
+# Export a certificate attached to a role into a PEM file.
+# To be used with SoftHSM.
+signing_extract_cert_pem() {
+    local role="${1}"
+    local output="${2}"
+
+    extract-cert "$(signing_get_uri $role)" "${output}.tmp-der"
+    openssl x509 -inform der -in "${output}.tmp-der" -out "${output}"
+    rm "${output}.tmp-der"
+}
+
 python () {
     signing_class_prepare(d)
 }

-- 
2.34.1


