Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04487C83026
	for <webhook@archiver.kernel.org>; Fri, 27 Jun 2025 12:18:47 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.24])
 by mx.groups.io with SMTP id smtpd.web11.12141.1751026717548549022
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Jun 2025 05:18:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@leica-geosystems.com header.s=selector1 header.b=T4mxEDQC;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 40.107.130.24, mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QudYr7+xENYWfQ8785P2eD8jMw8u8bC0ZreRYcXPNqvoI0ksfWImPfPnEge7WyIcJ61Kpa6mUpNuASlGc0z1CvC3e1wQ+QSDhsej3A9gIX38+xE9C9MHE2E6lCI91llsUlDpx4zSke/V55rMLK8E4hLqcSy/WlWe+53f6k7LJnfH4Nf4+5OL6Ehn6tbyXRCokWRZeuG/g3h9Z3gjM77qKIM48UYQqmAij4nDGvaL82RPXEHs6eXa2WmXvWT/uwgHk1IQt3NRDUCw4r0SjILfHwlCQQHBDIoHetsZ6NrJXhFiicNX1F67ifDNpzhtV3ktoCvRlgOlJMT7ziE2OepBbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R+qUpTYjp0Zut5i1svfbyeUE1Pj21XrYVC+1wfocC6g=;
 b=RKZ6nzgMamJFl3av+rzndyHu7f+eetKom6KX8RrAyqWckXUa3ZWAklZrC9KTho3jh5VPxDxaIOxzgrx37fBvRgrld1KGwxVpCs5g9I2FlCbFp6aB0L0+q5S7fprzAGwKA/iD2dNcETTAmgsRdUzzM3VN1MK0iSZTN4K5S4McCnVreTM2WjpmN8qYrhP/Ia8zKaQyf7LhHMCN9jO73OSJboORmggY/cHF01g8oICBzw9A8h/MnnYW75SqvrlvOkQXTAUpTq3pQ2fO1uwDcPx8siI07ZPPKZbKOfacfUjCNy7baPdZU0mnwpohQtDBQDGf6pL0zrfveeaRiz9Pf2lJ6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R+qUpTYjp0Zut5i1svfbyeUE1Pj21XrYVC+1wfocC6g=;
 b=T4mxEDQC5r/BZjXqH6vI7TII1BBwRwNWr74Z0LY2mR61WFe1EMNs+krycdVCnzIXVYeJJ9MMd3gbwQB1aNMpcZ0a6zoh+6GyBWS0ofAyFbp/fOvrcUScFwWHqMWS9H3G4zy1IMtTRSSkfPnAsffcpfMk/Ts07ZDcW/NcuT7AuXY=
Received: from ZR0P278CA0015.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:16::25)
 by PA1PR06MB9250.eurprd06.prod.outlook.com (2603:10a6:102:467::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.30; Fri, 27 Jun
 2025 12:18:34 +0000
Received: from DU6PEPF0000B620.eurprd02.prod.outlook.com
 (2603:10a6:910:16:cafe::d0) by ZR0P278CA0015.outlook.office365.com
 (2603:10a6:910:16::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.21 via Frontend Transport; Fri,
 27 Jun 2025 12:18:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.94 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.94; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.94) by
 DU6PEPF0000B620.mail.protection.outlook.com (10.167.8.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8880.14 via Frontend Transport; Fri, 27 Jun 2025 12:18:33 +0000
Received: from [127.0.1.1] ([10.60.34.121]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Fri, 27 Jun 2025 14:18:31 +0200
From: Johannes Schneider <johannes.schneider@leica-geosystems.com>
Date: Fri, 27 Jun 2025 14:18:17 +0200
Subject: [PATCH meta-oe v4 1/6] signing.bbclass: refactor
 signing_import_cert_from_*
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250627-signing-set-ca-v4-1-b8fe358664c6@leica-geosystems.com>
References: <20250627-signing-set-ca-v4-0-b8fe358664c6@leica-geosystems.com>
In-Reply-To: <20250627-signing-set-ca-v4-0-b8fe358664c6@leica-geosystems.com>
To: jlu@pengutronix.de
Cc: bsp-development.geo@leica-geosystems.com, 
 openembedded-devel@lists.openembedded.org, raj.khem@gmail.com, 
 Johannes Schneider <johannes.schneider@leica-geosystems.com>
X-Mailer: b4 0.13.0
X-OriginalArrivalTime: 27 Jun 2025 12:18:31.0396 (UTC) FILETIME=[987E7240:01DBE75D]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000B620:EE_|PA1PR06MB9250:EE_
X-MS-Office365-Filtering-Correlation-Id: b75fbd24-8f8b-4ec3-1d58-08ddb574bc87
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?K0ZtNStwdTFja1BhdU4zVTkwS3M3RmREdGdjTEVuUlVLV2thdVU2NnRSQ1VK?=
 =?utf-8?B?RzNPK0dwSmlWTVl4QlRlalY2Q3JLSXNtaEFxTWljVVNvbUpkbDNpY09hTGxH?=
 =?utf-8?B?aFg2aTAxbXd2N0pqSHJZZTFLK0I0a2Y4SGVqQjhadDhJTllSUXlzZlZ0NUYz?=
 =?utf-8?B?bUFMNndjVXAxNllXbUJvWjZUMjk1aEdTak9TUzBTNWI3R1g4RUFkUzQrOGtU?=
 =?utf-8?B?WGtZSmgyaFJiVGhrbDlQT1E2cmVQSFNTRU1tRHgyV25nVDU3Zm1kZ1liSHJk?=
 =?utf-8?B?TmR2YUptVmw2RmlablY4OU9lTjVYTFJMWm5xVFJ4eXFJN1lDVVRUa3pVT2R4?=
 =?utf-8?B?V0dDR1A0V0ZTL01iSitZMjdNL3BkU25GZ1V5Y0FNTU9TWTROWThIUUZrNGt6?=
 =?utf-8?B?WXB1WGFpc2pvOUl3K1RkUjJkNUdJR01Md3kycDFOUk5kTHpObjJHMWtHdW93?=
 =?utf-8?B?akhldzVaa3BmemE5SURjb2lmVEU4bDFPaEZZMGJCQ0RGaTlpNWJrT1hla2Mz?=
 =?utf-8?B?SjdaYnVuNkJqWTNCYTFPanRXK3djbVVxb0tWb0JCYW9MWXNVSnRLMkNqWlZR?=
 =?utf-8?B?bU9VTnZBMWFmOW9yZmFqbWt0SlY1eEpqT3ZiQ1NDcm13S3lEYmRncjBtcGxW?=
 =?utf-8?B?TFFDV0RJdkQwcnVwUjMrWjNIdGFzcmxDcFNhelBONzdJTXVDU2VLVUVkeC9m?=
 =?utf-8?B?bDhsclh1UVE3NC91SDRKZnV0K2s4ZUN4em11T05ESGhnS2w2THFTZnFHbzho?=
 =?utf-8?B?VGQxVmhaNnlUWXl5Zkd2MHR5MzRCL2lrMkxTRDJJQzhKZXh1QzVrbC83QTZy?=
 =?utf-8?B?U3RSZVVRVFJqY3BUckUrSmtOZmhYUS9aN1pFaDZvQjFDa01NcFNIeUVaemlH?=
 =?utf-8?B?QVdtRVg0Mk9uS3RRTzBrOHB0TGJmQVZvb1lHMWhPcFVjMGt1cW90Z28xSk9h?=
 =?utf-8?B?bm9OV2R5NDdPSktvOEJvc1ZVMk0vOUpBRC96QVJzSTBaV0NhR01BZVBOZWxm?=
 =?utf-8?B?QzhjZHdneVh5YXJ4VzhrZE5KNWRFTGZtck5XT3I4blFVRFFWajczd0pJYkZz?=
 =?utf-8?B?cEI4d1owbmYwS0JISmtUUFBUMEpZRGN3dnY4YXEvblVFU09MMkdrZ3FTeGZw?=
 =?utf-8?B?Vk5KMklkc281N3gxWi90MjFSWkZ3dEpNM1hCL1h5Zy82OXpMNWg1VkVOZ2JW?=
 =?utf-8?B?NWVUTU1ocGN1NW1TVm5wdzM5WlQ5NnprMHpXSlVhb0xtbTREd0dQa0xRV3Vj?=
 =?utf-8?B?K0dwOWNDWVVSY1VjRDV2dERGYURjQVpDVTV3ZUdpdmwrOC9QekdqMko5akhT?=
 =?utf-8?B?VEVyQ1dwTVJlMnR2aFE4TG1MamlPUUpnSitEbWxRc0Y3UVc5NG5ZQ1JLSTZj?=
 =?utf-8?B?THZzM3Vid3E3WGZGb2xsOExRZEJyNHJaQXJFRkdoSDdYcTZsaHhTc08ySUQ0?=
 =?utf-8?B?bWo4MmhiMlJUQkRZbVoxNWFYcS9LYlJFYmxTTVhGSlRSUU5PdDJiSFlqTjJL?=
 =?utf-8?B?ZmxwMk9kOEVicjluZENyc3VSUmFTb0w0L04zc0t5NmcwbjZGRFdLMEhGZUpN?=
 =?utf-8?B?YmYycXlqK2xVRHVzQkE3N1ZRQm5meFI5T21YNHBkV0NkZktya0xLMmNVUnJL?=
 =?utf-8?B?YUdkSmsvMWlpdjJUVGIxcVo2a0gyRFAwNmFCemliaGJFcGpHaXNjWkpvMUpp?=
 =?utf-8?B?YVkxcnhYOHo2NURySXBieWVNQ0YzeDA3dEVLS3M5b05BZFQ4S0NKTUgraFZ6?=
 =?utf-8?B?eTJrY3VFdEVNek9YS3U1YXFjV1FvTnVsWlRjc1d0U3VDSVBsTHdVVEovc0lw?=
 =?utf-8?B?OUVvaU1YS05HU2tUUURWa0laYm5YK1kyWlVCdEtxSlROYVpVa3R2QnNYbmtj?=
 =?utf-8?B?L3k2YWNWTUVacmZhdFUwYjNGTTA4TXRTL2pobC84N1JFSmFlbFJWVGF4ZWN6?=
 =?utf-8?B?dWoxQTdqNjhWK01qSllia0NUQTJoSHJoYnRkdDBEcC9EZGpMTEJZMWJTYkZw?=
 =?utf-8?B?S2NZZ1hqWkpNVnBGelpFTjYwa1dBSG5yemd2eHE2dUVkWnR0VnhkR1o3SmFM?=
 =?utf-8?Q?O/gb0l?=
X-Forefront-Antispam-Report: 
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2025 12:18:33.9632
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b75fbd24-8f8b-4ec3-1d58-08ddb574bc87
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000B620.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR06MB9250
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Jun 2025 12:18:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118149

Refactor the two methods to import certificates from PEM/DER to be
usable independently from keymaterial that is linked to a role.

By having the import_cert_from methods create a storage location (aka
role) in the softhsm dynamically.  This way certificates can - but
don't have to - be linked to a key, or can stand on their own if chain
of certificates from a PKI has to be managed.

Reviewed-by: Jan Luebbe <jlu@pengutronix.de>
Signed-off-by: Johannes Schneider <johannes.schneider@leica-geosystems.com>
---
 meta-oe/classes/signing.bbclass | 42 +++++++++++++++++++++++++++++++----------
 1 file changed, 32 insertions(+), 10 deletions(-)

diff --git meta-oe/classes/signing.bbclass meta-oe/classes/signing.bbclass
index 8af7bbf8e0..c768371151 100644
--- meta-oe/classes/signing.bbclass
+++ meta-oe/classes/signing.bbclass
@@ -123,15 +123,26 @@ signing_import_define_role() {
     echo "_SIGNING_PKCS11_MODULE_${role}_=\"softhsm\"" >> $_SIGNING_ENV_FILE_
 }
 
-# signing_import_cert_from_der <role> <der>
+# signing_import_cert_from_der <cert_name> <der>
 #
-# Import a certificate from DER file to a role. To be used
-# with SoftHSM.
+# Import a certificate from DER file to a cert_name.
+# Where the <cert_name> can either be a previously setup
+# signing_import_define_role linking the certificate to a signing key,
+# or a new identifier when dealing with a standalone certificate.
+#
+# To be used with SoftHSM.
 signing_import_cert_from_der() {
-    local role="${1}"
+    local cert_name="${1}"
     local der="${2}"
 
-    signing_pkcs11_tool --type cert --write-object "${der}" --label "${role}"
+    # check wether the cert_name/role needs to be defined first,
+    # or do so otherwise
+    local uri=$(siging_get_uri $cert_name)
+    if [ -z "$uri" ]; then
+        signing_import_define_role "$cert_name"
+    fi
+
+    signing_pkcs11_tool --type cert --write-object "${der}" --label "${cert_name}"
 }
 
 # signing_import_cert_chain_from_pem <role> <pem>
@@ -164,17 +175,28 @@ signing_import_cert_chain_from_pem() {
         done
 }
 
-# signing_import_cert_from_pem <role> <pem>
+# signing_import_cert_from_pem <cert_name> <pem>
 #
-# Import a certificate from PEM file to a role. To be used
-# with SoftHSM.
+# Import a certificate from PEM file to a cert_name.
+# Where the <cert_name> can either be a previously setup
+# signing_import_define_role linking the certificate to a signing key,
+# or a new identifier when dealing with a standalone certificate.
+#
+# To be used with SoftHSM.
 signing_import_cert_from_pem() {
-    local role="${1}"
+    local cert_name="${1}"
     local pem="${2}"
 
+    # check wether the cert_name/role needs to be defined first,
+    # or do so otherwise
+    local uri=$(siging_get_uri $cert_name)
+    if [ -z "$uri" ]; then
+        signing_import_define_role "$cert_name"
+    fi
+
     openssl x509 \
         -in "${pem}" -inform pem -outform der |
-    signing_pkcs11_tool --type cert --write-object /proc/self/fd/0 --label "${role}"
+    signing_pkcs11_tool --type cert --write-object /proc/self/fd/0 --label "${cert_name}"
 }
 
 # signing_import_pubkey_from_der <role> <der>

-- 
2.43.0


