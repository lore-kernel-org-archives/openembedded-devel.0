Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BA54C83000
	for <webhook@archiver.kernel.org>; Fri, 27 Jun 2025 05:40:34 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.57])
 by mx.groups.io with SMTP id smtpd.web11.6720.1751002824875521010
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Jun 2025 22:40:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@leica-geosystems.com header.s=selector1 header.b=IRraICbq;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 52.101.69.57, mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iWY1zE51xi7bJKKooPvm+ZUmOhHF0jzmQtkPgY3XQgMddbMu9bee38erhfSdGCuL3+znCSe4wVn7iPQrpJHh9Ox1Ndzf53hMsJin85ntG4kUH/CeI3Cp/KBegA3GVWeb2RnKQ11jdP2ALMxtzHCO0TpscTKSf8W/6OVmPlowzKeaHdy/l1dyxrKMTs0Ih29dCpJ5Pdi35VodiHm+pqJVAm1orgJViPYOgr6d6rpuV/NjawKtf85ehir6I7kNC5BlgUchTrv1cnDZ/xlvsYv2/K3cNGf66/m3A191rn2hal7u5RdjBwLvMC4lY6D0KkAMnjXi0u0DlIpE120qbbFeqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mrIJ8R5u1SR1VFVeVowntyvoGrhrIKJisI6lVy/ROe8=;
 b=ixbXtgLgPVHvoA8Q0hIKV0uGFvCX2aT5gTY3OVPVu3EXJE2SCaHijYpCrrTJvqH0W5bsV33zMXpvZYk1MyhXKhSeizC4TeX7pnfEji1wegoZaGG/+GLJwpTiOUpxkUKh05ZqrHg2SYSecz6aIrK/bCBAGqB+qc6bz2PzRu21onevkY8psPY6r5i1nQKlmtzOTwD47ykPsqsozYtI5agcV+i8xf4fdbKhwf6NHOYqc4iUh0my/nrwhMwod/TOVpvqqhz/w6Hck3y27bnW0+ITh09ixX4v0IVfaFDn6Hw5OtXb8tOwIk8rOLqfYO4AHF2Gp2T4hVYSfC1UIYsml+v1GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mrIJ8R5u1SR1VFVeVowntyvoGrhrIKJisI6lVy/ROe8=;
 b=IRraICbqpOghK36Ft1aYD0ZMA9rm48CbrE1nIMuY2PPkgXzHUcQmF8VO9ulVJK0UKOAT4jVAk7J8BoiR6TiQIRA1FOdR2wtqUqDyWvJsp5JxflotUPXvJAwr2dUFXTzfsyDp6Piy6XKm64xz/8NQu/VMd658hoVEyvovs73h+Hc=
Received: from PR1P264CA0103.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:2cf::10)
 by AM8PR06MB7700.eurprd06.prod.outlook.com (2603:10a6:20b:316::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.23; Fri, 27 Jun
 2025 05:40:20 +0000
Received: from AM4PEPF00025F95.EURPRD83.prod.outlook.com
 (2603:10a6:102:2cf:cafe::61) by PR1P264CA0103.outlook.office365.com
 (2603:10a6:102:2cf::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.21 via Frontend Transport; Fri,
 27 Jun 2025 05:40:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.94 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.94; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.94) by
 AM4PEPF00025F95.mail.protection.outlook.com (10.167.16.4) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.1 via Frontend Transport; Fri, 27 Jun 2025 05:40:20 +0000
Received: from [127.0.1.1] ([10.60.34.121]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Fri, 27 Jun 2025 07:40:17 +0200
From: Johannes Schneider <johannes.schneider@leica-geosystems.com>
Date: Fri, 27 Jun 2025 07:40:19 +0200
Subject: [PATCH meta-oe v3 5/6] signing.bbclass: add signing_extract_cert
 helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250627-signing-set-ca-v3-5-030812797c6a@leica-geosystems.com>
References: <20250627-signing-set-ca-v3-0-030812797c6a@leica-geosystems.com>
In-Reply-To: <20250627-signing-set-ca-v3-0-030812797c6a@leica-geosystems.com>
To: jlu@pengutronix.de
Cc: bsp-development.geo@leica-geosystems.com, 
 openembedded-devel@lists.openembedded.org, raj.khem@gmail.com, 
 Johannes Schneider <johannes.schneider@leica-geosystems.com>
X-Mailer: b4 0.13.0
X-OriginalArrivalTime: 27 Jun 2025 05:40:17.0594 (UTC) FILETIME=[F6AD99A0:01DBE725]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00025F95:EE_|AM8PR06MB7700:EE_
X-MS-Office365-Filtering-Correlation-Id: 4053028f-3bf9-4c3e-5973-08ddb53d1aeb
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?SjdJR3F4Y1F0bGUzVjFDQlFTZ1drWlVYNVNkU0szcExTNVc2eHkxek8xOXd1?=
 =?utf-8?B?OU1xYUZCb1pVbUdCZTFDUEhZZGNneEtHeHRXQnpQVjhDU2xXR0FuQkxhYnpy?=
 =?utf-8?B?RHdVZEFHeHVGTmc4SmxLZXRhVFVPajhKOVdlUVNEVk50clU4eXQzdnJrWlU4?=
 =?utf-8?B?Q1RPMExTVFB1ZXdTMjd4SmhOSUVOQ096MUVPNnRtcVg1V1kwek1zYnRMV05u?=
 =?utf-8?B?c0dyY0lzYUEyYnVSY3JkZ083UEUxcVZSOHJXWnplV3NkUTIrVnhFUkZBYTdy?=
 =?utf-8?B?cGh1UHgrOHo4dU5CZllKVExHV0RtMGQ1ZmRaVmFWckpxakN4cHgvTlhDU3d4?=
 =?utf-8?B?VkoxMlJxYmFwODdqVlZocHBOZy9STVF6RklWeXFJN1NpOEh5ZTEyNjZlaStX?=
 =?utf-8?B?SlJBd01JVEdBdTN1MS8rQ0xWNDVacHhxZkM2NURKcTBoOGFJSy9KU0lybEtU?=
 =?utf-8?B?SDZiU3AxU0ZGckZmQUVwS3ZOMEhmMFU3djNIejJWc2hXVzRFcUdiTHdIMVJ2?=
 =?utf-8?B?bzNUckVpUldIWnJyeWJnS0NSMjV2bjZKSnNLM0N5RmloT1BoemdmbG00dFZw?=
 =?utf-8?B?QURZRXY1OXdtck54K0tneFprZlo2eXMyVG5hQWVCKzhnM1BsSEVKRmpsSHR4?=
 =?utf-8?B?ZnB2QUE3UmxCaTc0S25iREQxMU1DTEtSY3lHcDVZcnBTOFhKRTljMFJWMVdn?=
 =?utf-8?B?MXZOL1hzSy83di9oS3dlbTNkM3ZDS1U3OXlkcURZS2FtMVNIZ2E3YjhSWmZx?=
 =?utf-8?B?SENxRnJ3YTR0MW03NS9FWlhoTmllUVNsODR2UDhaYk1leEZMaUxnWVg0bE5P?=
 =?utf-8?B?T2tLUHZIQUkxb0JYSjFISFAycFFlMWlvSHE5VUtPa2MxUUpGR1p3NnpqaEw3?=
 =?utf-8?B?SDZzMmk3cU1SblJsUngwd0NNTGlpajFEc2ZYOHlIdVdPb29nSE56Wkx1b081?=
 =?utf-8?B?TlJuV0luOWJvcWtYSjlEN1VNMGpDV0NXS3o5MENaY1drTXVIS2lsTXlWYUVC?=
 =?utf-8?B?QU51ZXpVbmNYWndnKyswbnh5clpFUGQ5RnN4WkZFdFBsZXJkUTZDWmhKemNL?=
 =?utf-8?B?Q2lRUnJwUER2Qld6d2dRT0o0bnVEL2lNMVg2MmxuR1ZmNlYwMlRyUHhtcW5C?=
 =?utf-8?B?bGdFanAvVFBnSjk0OWNMZnVRaGdIV0ZnSm1jNlpwMmhZa2xtemk2Y0NEOEtn?=
 =?utf-8?B?RHVFTXBiZEExVzRKeDZzMzFWSFFRaXV4VkpUTlZySFg2dzRGNzdzbGxVL2RD?=
 =?utf-8?B?c011dkNkUGlvNWp4N0VzQzFxcWFKVmtHZk4xVDBLcFpCQkxKYnpxUXpCRHR4?=
 =?utf-8?B?cVZ5MUgxa3lVYng0VjlENjBxa001eVBqMWx1YUVlRVluSDVvYy9RdXprYU9t?=
 =?utf-8?B?cWVPbU5HaTZ3b0JsbFdHN1FqK0pYeVFPanVzQk45YTFZM1lFay9lZEdhb1BK?=
 =?utf-8?B?cXdzNHpYN045UWppaWlOUWFLVE9OeFJmK2pyUlJYczdFQVlqc0xyemI2ZFdR?=
 =?utf-8?B?c1RPaWFYdzl2VGpvUzIzSkZkWHFXZ2MwM0M5aHhFNnFwQUpUZ0dkZ2VJUGll?=
 =?utf-8?B?RHhkN0dVT0dEU3VmU29MS21MSC96bVlTSy9DS3k0QU51Qk01Y2lkOTRTQUVL?=
 =?utf-8?B?bWdsVUxFdDE0ck1PaXYzRHEwTGVyeHpNYnc2bDM2UUtxVG14L3lwYmxhcGZk?=
 =?utf-8?B?U3BqZlN3WVR3Wllqa1JTNDd2d0VUVlgzRTNZT3l5dmNybmtMUURuYWcyOGZN?=
 =?utf-8?B?WVUzY3FDd2JaZ29QVm91UG9RZmR5OWFOeFkxVE5ldWpZaGMzOWpVanMxNUVs?=
 =?utf-8?B?WktqNzhVMlBDVUhma214VWRlT0JQWTIwRmdSdU9sSkJmV0NpVEJuVHlSTjFP?=
 =?utf-8?B?SVpnNUs2eVdscm5YUjQvTWEwaVBFcmpqZzBMbElNelhsY2Q5QzFsUzZhVkRU?=
 =?utf-8?B?R2lJa2dhRE9oRXhrd3JqaU15TjgyWkRnT083MkdoZXp3UkJzSHhZQmVmYnJB?=
 =?utf-8?B?QXZRZzIxN3FSd1B5RFlwWTJFQ0ExZUNxSHBWV0o4V2hUSzVoSkM4TjdyenR0?=
 =?utf-8?Q?I04ZX3?=
X-Forefront-Antispam-Report: 
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2025 05:40:20.5400
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4053028f-3bf9-4c3e-5973-08ddb53d1aeb
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00025F95.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR06MB7700
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Jun 2025 05:40:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118135

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


