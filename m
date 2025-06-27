Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1C41C77B7F
	for <webhook@archiver.kernel.org>; Fri, 27 Jun 2025 12:18:46 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.26])
 by mx.groups.io with SMTP id smtpd.web10.12237.1751026719352877037
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Jun 2025 05:18:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@leica-geosystems.com header.s=selector1 header.b=jILoEvkV;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 52.101.70.26, mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kXMAPE9hxkagM8Yo/dKsmBAWgmJuw7+2+ZXDlxLrMGTRWYmeOiI6D9CznaQk3RnZa7BeczASaaqhn3/Q6zaLAk3sY2GS/EmZgG/b+vprZ77Soozkt+ef/KpZ8Rh0p4PxcItE+QC5Wx8itOdRcOzAfG1Ex/1sbhaDM6mqewpaiVB2QQjjZv+vdxlSlRzxrfZD4kIYiaqYhQ9En5r7vklxg+j2Zy0Ls2drihZ0wjDJUsp5rbZDMLGq5IP8SAcHH9HaKR0tCjVC8DyDwxXpgzPAGO8wAos32CG6vPawaC+KGoWSQNFmjyzEGLwF/V7M3wU0M47GRxWNcE7STHQGHgxqkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mrIJ8R5u1SR1VFVeVowntyvoGrhrIKJisI6lVy/ROe8=;
 b=G48EMViioUXowXDKPmiYT8ML8YVfFA6GGsnW5pz+mghzZP5TFgE5PHRfTeEiVo3WpYYVX0OEQBl4vLIeUm9CAbSn4UJcXsTbANSdZE8HywxqDmIwLGI0teDI7T1KN82TNRT+jcSCFqU5+hku5TFG1SrX8AWcyMrZbOGpPjgVn0i336vlppmP68AD9XBFZ8cPCzd4LzXQt+2sREGuRf9+gncvlE8t/v9W56Y1qTbP9zwPYiObIRhFOxwyfV8gMKKdYeAKLHTYhIQ7UVQC6GtNGM3X4XvgcyadzHiqZW1vZFX0yxFSx9sh9mOmAi5j3S/iwaEoR9t+UTGXKs0H4j4RTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mrIJ8R5u1SR1VFVeVowntyvoGrhrIKJisI6lVy/ROe8=;
 b=jILoEvkVfx8W0JqFPoTLktCoW957t0pEfE9fBn8k12FmtHLXiWCiK9GArZUiIDP1tVu8+ymPAhnRHr2sarwpIaEYfaeHa2WRjcwBLipQhHBwdaFC6nTueQCnCTLiz8CC/Uk9dXgdckdl0FFyk5oJXfbDwMXneo+bFd4s+s31bsM=
Received: from ZR0P278CA0016.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:16::26)
 by AS8PR06MB8215.eurprd06.prod.outlook.com (2603:10a6:20b:3d2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.30; Fri, 27 Jun
 2025 12:18:36 +0000
Received: from DU6PEPF0000B620.eurprd02.prod.outlook.com
 (2603:10a6:910:16:cafe::fe) by ZR0P278CA0016.outlook.office365.com
 (2603:10a6:910:16::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.21 via Frontend Transport; Fri,
 27 Jun 2025 12:18:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.94 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.94; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.94) by
 DU6PEPF0000B620.mail.protection.outlook.com (10.167.8.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8880.14 via Frontend Transport; Fri, 27 Jun 2025 12:18:36 +0000
Received: from [127.0.1.1] ([10.60.34.121]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Fri, 27 Jun 2025 14:18:31 +0200
From: Johannes Schneider <johannes.schneider@leica-geosystems.com>
Date: Fri, 27 Jun 2025 14:18:21 +0200
Subject: [PATCH meta-oe v4 5/6] signing.bbclass: add signing_extract_cert
 helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250627-signing-set-ca-v4-5-b8fe358664c6@leica-geosystems.com>
References: <20250627-signing-set-ca-v4-0-b8fe358664c6@leica-geosystems.com>
In-Reply-To: <20250627-signing-set-ca-v4-0-b8fe358664c6@leica-geosystems.com>
To: jlu@pengutronix.de
Cc: bsp-development.geo@leica-geosystems.com, 
 openembedded-devel@lists.openembedded.org, raj.khem@gmail.com, 
 Johannes Schneider <johannes.schneider@leica-geosystems.com>
X-Mailer: b4 0.13.0
X-OriginalArrivalTime: 27 Jun 2025 12:18:31.0490 (UTC) FILETIME=[988CCA20:01DBE75D]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000B620:EE_|AS8PR06MB8215:EE_
X-MS-Office365-Filtering-Correlation-Id: c9b9d764-1925-4175-f048-08ddb574be20
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bkFnUWU5eVhCZFJYc1BvTnpKZk9kRmRnRFptT002Zjh2OGtzRjcySU5TUWJn?=
 =?utf-8?B?MzBtSTBMT1FSYjJDQklsK2piWFNMeXJJSTlnWVZUWmpWOHhlRkZVdlRTTStS?=
 =?utf-8?B?eHN4ZFo2eWRxdm5zM2FWakgwR3NGbHdKRk5iL1RCOG9NS0dYL0twWDI0UDRQ?=
 =?utf-8?B?N2RNNUs2d3J5VXBMR3kyOVpER0pJTDdBTVVPazUrK1JtbE85QkhZajZqS0pK?=
 =?utf-8?B?aTJwdXNTR3R0UUZMbXdSOC91dkhkUU9QLzFUYmZCdmRkbXAycFFReUlCM0Ur?=
 =?utf-8?B?RzZQaDkrTW10aHlXVlM5V2x4VTZPQm5qakhMNW5NOWhwVDFWMGxpZWc4UVU3?=
 =?utf-8?B?Q3V5TjFYUHpBbWdUMm9MYzVORTRkNFE2UEtzY29iZlMzdkNhQ2JTZWwranhD?=
 =?utf-8?B?NTdwanp1QW4xUm5hV3RPVS8yejJrL3R6U09QK3JZYTZra0duUkpJL21xZzJV?=
 =?utf-8?B?WTVFMVZNK005TUF2eHhsRkF0L1dPd1FMRmtsSThacHlyUkg1V3lidWZDS1hP?=
 =?utf-8?B?ZXMwbDErcXE1RDk5eGh0cytYem1WMUZVQ2pCalN1aGZVVzhZTGludWRxcFVo?=
 =?utf-8?B?LzJnL1cxOVpjTS8yV1l0RXMrT2ZGakRDUU4zTlU3OTQvOFJKSTJkVld4OEk1?=
 =?utf-8?B?WmtZZEt1aXh2V3B3bi9ybW8zbjZFN2dHOU9EZUpQYTYzVjhIdjRkOEJxbnpp?=
 =?utf-8?B?STNjNVZlMlR0YWM3TVRtSE1tOHQ5M3N6RFkxL210T0RKRUp4Vy9xZXdWbm0v?=
 =?utf-8?B?bHozb3JxMU9EcHpxQkJWdlErSWZsMVVJbkVBOS82SC9BTGNmNnVGaEVlaUps?=
 =?utf-8?B?NW44ZEduc0JRZkVlZ3JxVWVFaGgvLzhPOFFRbFNsNnlDbmFRMVpBTitHQU5T?=
 =?utf-8?B?YWZkaG1FYkpZTmtZSDZFVkJQK2tyV0RhSkdQaWFWY2dzWWxnOTJ4NUpkbk9Y?=
 =?utf-8?B?dDk5MGREVzBPUjN2SWZxSjY2Vng3THZrRXlkZWRzc0EwRWdqVWZzaHV5MlM4?=
 =?utf-8?B?VDZvazJBU0ttSnlZNjBtSXFsZy9zblYzdlpiejkyeEVTa0dHSmx1emlpdU85?=
 =?utf-8?B?Sm5kY21pQW82YUxSNFJFRmFTVXMyUUpVdGJ4OW9QODJKNzdCK2ppcUZ6R0xx?=
 =?utf-8?B?UXMwMFhtTEdNcGYvbWg2ZEQ0YmFic2dId3JFekFjaURRRXB2Sk1wRmxrNFdp?=
 =?utf-8?B?Rzk0TlVlbVN3T0ZNVitZcTcwazY5Vmk5cnhsWlpGelp3TVdOQURLeHpVVTl1?=
 =?utf-8?B?Q2VoRUFMR3NvYW8rNXBvMkg0eEZwcm1XNVVlM0Vhcy9aMWVjMUprSmtUTVdG?=
 =?utf-8?B?eXphdzhwS2UxQ2trRWdJNWZsR21LMUJSdHlRZ1hucjh5enpnQ01iY01YLzV5?=
 =?utf-8?B?Ky9TaDVFbHF1RVRmRlp5RnhCMEtUb2lPaHBZN2VCQjZ0ZDFGTEw3N241TDA4?=
 =?utf-8?B?SnVJUEU4MXlSVCt2akhlZENSYWNWUGp6TnZnMXlMbnV2bGltanQ2WFBhWGd5?=
 =?utf-8?B?WXREbi9qT3gzSWFzS093SWFUR0VuWWVwd3hTY0FUdVlQYUcxd05PbTdCaStY?=
 =?utf-8?B?YVRmS3piby9ZKzc3ampXVzE3MmpNZXNYdVNKN2JCT2FqWnhYYUU2MDZBSCt4?=
 =?utf-8?B?c1NzL0hQelZ5c0U1SEwxckVoNUxVMmRYcDg1WUF1aXdmVEtlUXpCa3AxTmln?=
 =?utf-8?B?Y2xiRW8xQnd1VWx6bjF3VGw1Q2hkSU40MHprdDJMUHY2eW1ad2o1Y1FjTU1S?=
 =?utf-8?B?Vkk5SWZETVU2L28yVE8wcTYxVjlLNVZKZjVoQ2ZMb1FXallaZE5lNzF1ZzdN?=
 =?utf-8?B?VGd3Ty9RQnFzeXpXMlZNdUprQStuWENmdkVieW4xNmxaSmpocjlwK2lBdkc1?=
 =?utf-8?B?L1FzUTlFbm9YNlhMRnRoeDViTFRzMW5paU5HdmV0ZWtEekcrelhZWWpqOHJj?=
 =?utf-8?B?c3c4M2o3akE5Z3BtM1NwZWhzYUNzTFJrQ0FkUDFmUWRMSVlvR2ZLcWhqWHFB?=
 =?utf-8?B?RTFxcmdrV1krZXh1OFEzbXhpeXNwVk00RENZMWd1dmdDczVpdXJmaFE4WG1H?=
 =?utf-8?Q?0wYSxj?=
X-Forefront-Antispam-Report: 
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2025 12:18:36.6507
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c9b9d764-1925-4175-f048-08ddb574be20
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000B620.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR06MB8215
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Jun 2025 12:18:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118151

Add extract-cert wrapping helper functions, to easily extract
certificates again that had been previously imported into the softhsm.

Reviewed-by: Jan Luebbe <jlu@pengutronix.de>
Signed-off-by: Johannes Schneider <johannes.schneider@leica-geosystems.com>
---
 meta-oe/classes/signing.bbclass | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git meta-oe/classes/signing.bbclass meta-oe/classes/signing.bbclass
index 248c6400ed..6fde22bf22 100644
--- meta-oe/classes/signing.bbclass
+++ meta-oe/classes/signing.bbclass
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
2.43.0


