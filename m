Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8B9DC7EE31
	for <webhook@archiver.kernel.org>; Fri, 27 Jun 2025 12:18:46 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.9])
 by mx.groups.io with SMTP id smtpd.web10.12236.1751026718524774320
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Jun 2025 05:18:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@leica-geosystems.com header.s=selector1 header.b=l5axdJzK;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 52.101.70.9, mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fBI+vfmc+cwyKQ0ksb1CvhvGU4PwSI3Ph5NWfNeIPh7C11dwNsxqJRVB/aJVxFYAksMBNQ6vN0NBRP8R7FFEQ5lUiWUqVyE0lexcRxCnQnOtgQPOaul383xxFe+hFBCU6hP5fJQpxkTDtL4EUrn4OkDEanuq/ayjEhdIs/ulq1pZ2kaxxAMweElfXE3LC/x6lE5TGtKg7sEQo03pq808peX2cQKUXYBr7vvwzByMI6O4/T2zvE84DQkhVmDg2OwqnRTn80Hn4RlRZHFmlKtQWZzErJf8V2UjsxzvNkrTt5H/wAPXmNFhhHQgCtIWry8pflE1cSFTl8dnUGZ3nPzRLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RBBUI3xJQGpOGlhig8qCUo0IIL52X7R1MSFGQEudruY=;
 b=lUcO7F5NPpP0d36fUFdVnmsIwbRfWbKLJzyp7To67V7HzUlkWOnUxITjmAf+qdK6GPXzaaPdI9aMSbRKn0fgOQCIRWEi8fk6WKNnYY/LxBzxFD5v4VsIIwO6dkRG05aRygEtfBVkC5s8zYMKfi/Zw+jmJlCVdOBjoGecaQzvs5qud9r7oZjX6hlmhAcpK+c12QBXYKykyKqgwwfq1/S5gQCkS1xlDuljeuz8Yn8OR8bte+WNMC9JQih7RjYoukrfP1KtBZFkLqMxGgIlpIRKKwH5s0Z5aE6PZ+FEgoih7JDGydld++utj2AgQxmECZMqPI196bh7mvMLxeGfL0XFow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RBBUI3xJQGpOGlhig8qCUo0IIL52X7R1MSFGQEudruY=;
 b=l5axdJzKnyofTkgV5WwzaY4/U/o9jIYM/ohc3NMVbcxRhiSvvjjo+rzK/0I1uiTO0rSClW1K5OX2kBOABJKm++8rIqixg5NH/FzDfHzkeQsaWT4OyqujFGdmiGyumxuxFoMGQcm3A73DuMIhdyPs5MrwOmD4NZypqyxpdvDD92c=
Received: from ZR0P278CA0002.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:16::12)
 by PR3PR06MB6825.eurprd06.prod.outlook.com (2603:10a6:102:60::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.16; Fri, 27 Jun
 2025 12:18:35 +0000
Received: from DU6PEPF0000B620.eurprd02.prod.outlook.com
 (2603:10a6:910:16:cafe::38) by ZR0P278CA0002.outlook.office365.com
 (2603:10a6:910:16::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.29 via Frontend Transport; Fri,
 27 Jun 2025 12:18:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.94 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.94; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.94) by
 DU6PEPF0000B620.mail.protection.outlook.com (10.167.8.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8880.14 via Frontend Transport; Fri, 27 Jun 2025 12:18:35 +0000
Received: from [127.0.1.1] ([10.60.34.121]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Fri, 27 Jun 2025 14:18:31 +0200
From: Johannes Schneider <johannes.schneider@leica-geosystems.com>
Date: Fri, 27 Jun 2025 14:18:19 +0200
Subject: [PATCH meta-oe v4 3/6] signing.bbclass: add get_root_cert
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250627-signing-set-ca-v4-3-b8fe358664c6@leica-geosystems.com>
References: <20250627-signing-set-ca-v4-0-b8fe358664c6@leica-geosystems.com>
In-Reply-To: <20250627-signing-set-ca-v4-0-b8fe358664c6@leica-geosystems.com>
To: jlu@pengutronix.de
Cc: bsp-development.geo@leica-geosystems.com, 
 openembedded-devel@lists.openembedded.org, raj.khem@gmail.com, 
 Johannes Schneider <johannes.schneider@leica-geosystems.com>
X-Mailer: b4 0.13.0
X-OriginalArrivalTime: 27 Jun 2025 12:18:31.0427 (UTC) FILETIME=[98832D30:01DBE75D]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000B620:EE_|PR3PR06MB6825:EE_
X-MS-Office365-Filtering-Correlation-Id: dd6111ad-6d35-4412-f084-08ddb574bd66
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TXJUSnRqN0VxbFZsbktsNzFtZTUzNDlKN3lOS1NEaGdOVlFWWjI2ZHhySWFD?=
 =?utf-8?B?NkdmbUZjR3RPYi9FZXFVdFRLSS8yZHJhbFZQNGZ5bGJxY3pjcFduWkFhZ2Z2?=
 =?utf-8?B?cFlNVkcray9LUWFmbkZwTXlFeUpWOTFucmVUclYxZWhnMVovRW9DYUJ3MkNx?=
 =?utf-8?B?ajNQWW9XRHRWZ0dIRmZON2praW04WGVoMDV4bk9ydHZHeTBMUEYwSHI2K0xS?=
 =?utf-8?B?VEZmZXdxWDBPbkhSUWJnenhhMjhrenhxMkVMcG0vNFc2d21RUXBaUW9wNEd2?=
 =?utf-8?B?dFRPLzFXakhadFBUOVNiTWkzTlo5WGM5d0lKY1ZyUVRZaUZycC9HcGt4UW5C?=
 =?utf-8?B?QXQrUFRTN1JlNzA3cGFBU21DM3l4MTJrUGR1TDlhOEhvcGlYUVJrSDQwb2Vm?=
 =?utf-8?B?ejZaQ2FCelZmQlNsQ1VRYnZaTTAvNzF2cmc1LzU1Y01IS0hkMXU3MW40L0xw?=
 =?utf-8?B?RjdSak9BdGdOalFObWxWem1ZM1J4ZTB3NloxYndMMlJHOUpjcU5LZTNuY05D?=
 =?utf-8?B?ZGNVYmlTdlY0Q0xoSWdKL3dtUWhMY25vMG51Y2NGODJqWlZtOHJtbzcxNW9o?=
 =?utf-8?B?Ky9hRG1wWTlCOWNYUStmVGk1UGN5aWVHM3ArZXJFNlMrNzAweGNKd0E0TGZM?=
 =?utf-8?B?TUhEQms4Z3lORit4US9hTW8zSm5JTnlRdE1BNWdnVUkyeUQ1R0ptQjZyWDBj?=
 =?utf-8?B?YklmbWFpcndQRExaRHZocFlyU3VVVVhVOENZdjIyMlF0Mm1tQXNqUFlFblIv?=
 =?utf-8?B?aUxoZnhHZzlqTGxkaGkrV3lVMFgrd2VOS2o1N2FIQnNndkNpK3RVa1ZhRzFt?=
 =?utf-8?B?WVNNRTJFL3FqK01wWDZ3aG9PcVhhdVZlOW1MZ2hBUnhtOFcwZGFWcGdyc3Zr?=
 =?utf-8?B?SkR2QVpqQk9OZDdiNVNSUSthTkVwR0pTMUs5VmRnQktHUkp3WjZ3ZWk4ajV2?=
 =?utf-8?B?SnFzeWlUajN3b1VqZUx2cW9YM0tmcms2SVZVYkp1MEx2SlJBQ0YxMVcwVnBR?=
 =?utf-8?B?TURoWVBnbXEwc1pVdjcrN2tEZUZBeU9QalNPdzY0dmc3YWNSWGFTVmVXVXB0?=
 =?utf-8?B?OVFaN0JmWjRSeWQ1VzRyNEptQnF3RjhmdFo4WWZYdndTZExtM2crOUw5L3Jr?=
 =?utf-8?B?RjFETHdRWUxrb0poWlNoZzRmR2tzcDZmWVNVWmgxMkNFK0VZWENjdUptZ3A0?=
 =?utf-8?B?SVBneVFDNFZvd1FyZFIvL1ZVMWdaK3ZQc0syUTJFNFFOREpTdktXRWVxY3Nz?=
 =?utf-8?B?dVJXZDFuNDk4alhQQmdxalFkTHZiT1djTHhZckxtWVVVdVdGcWhyS29XTGk3?=
 =?utf-8?B?VjBrSEZJSS9BdXQrdU8vOEN1a29HRm8vYmRGZWZMM25FdFFUS3FTVlUyVEJU?=
 =?utf-8?B?SmNFZFFKR2Yxa2xYUS9DWkpZNVBWSytRVzlBWENlYnFNMm1pNGx3ZjdnbTBJ?=
 =?utf-8?B?dFZWNFBleDlrV2t6OUJhdDVzRWo5czZ2eDJQc0s3dlNFMmU3VVhRVzlVQkJp?=
 =?utf-8?B?UkNtWWNPYXNKTHNNWXVDM0o5SU1LdTR0elV6MEI5UnhyV2FSR2hxTW8wZHZX?=
 =?utf-8?B?SHJsYlRCSVFQUktvRVU0ZkVPY1ZDbDlpd2t6Si9kZ28xM3cxdzUwWWtWbm5H?=
 =?utf-8?B?eXZybWN6cjNyY1NHc0NwTVZDZW5RbWVPNUpsa1ljbSthT21WaGlsRVM0eFRF?=
 =?utf-8?B?RlpmbGovcnZJQ1pVc2lwSlJTbWRrcEx1WWM5czhOLzVtZ00yZktCa3dCMTlT?=
 =?utf-8?B?VDJ4Tm9IdkNCMnMyY2ZURnY4SGJaeDJYM2lqN3ovbEpGcnlZQnFKS3owRS9X?=
 =?utf-8?B?cnd3a09pUXJMMXB4NGdmUmc2STNhdEpvZ2RLOW03MTQ5UjliY3FQWUZYTFc5?=
 =?utf-8?B?WjJNaW9WNVJTQkhrZW9JZzY4OXJMaXFMdjl5anByWWRhaldtbUd1ekxycS9Z?=
 =?utf-8?B?cEsrZlIrK25aQmJ1dHU1ZkNQb3B2WE9yS2lCZ0c2a3BxSVQ0MktkeCtBNm5N?=
 =?utf-8?B?SzI0VFJ5UkNkcDR3V29pL1JFUnFEV3k2ZTZLWnd6YktYb1prWGhiOXRwc3NB?=
 =?utf-8?Q?YFi8Lf?=
X-Forefront-Antispam-Report: 
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2025 12:18:35.4319
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dd6111ad-6d35-4412-f084-08ddb574bd66
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000B620.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR06MB6825
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Jun 2025 12:18:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118150

Add a helper method to retrieve the root CA certificate for a given
role, by walking the chain that has been setup with
signing_import_set_ca up to the last element - which is the root.

Reviewed-by: Jan Luebbe <jlu@pengutronix.de>
Signed-off-by: Johannes Schneider <johannes.schneider@leica-geosystems.com>
---
 meta-oe/classes/signing.bbclass | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git meta-oe/classes/signing.bbclass meta-oe/classes/signing.bbclass
index 04bd92bc03..2a94f5f5b3 100644
--- meta-oe/classes/signing.bbclass
+++ meta-oe/classes/signing.bbclass
@@ -194,6 +194,22 @@ signing_has_ca() {
     return $?
 }
 
+# signing_get_root_cert <cert_name>
+#
+# return the role/name of the CA root certificate for a given
+# <cert_name>, by walking the chain setup with signing_import_set_ca
+# all the way to the last in line that doesn't have a CA set - which
+# would be the root.
+#
+# To be used with SoftHSM.
+signing_get_root_cert() {
+    local cert_name="${1}"
+    while signing_has_ca "${cert_name}"; do
+        cert_name="$(signing_get_ca ${cert_name})"
+    done
+    echo "${cert_name}"
+}
+
 # signing_import_cert_chain_from_pem <role> <pem>
 #
 # Import a certificate *chain* from a PEM file to a role.

-- 
2.43.0


