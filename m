Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B60D8C71157
	for <webhook@archiver.kernel.org>; Wed, 18 Jun 2025 14:35:23 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.44])
 by mx.groups.io with SMTP id smtpd.web10.355.1750257314529622136
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Jun 2025 07:35:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@leica-geosystems.com header.s=selector1 header.b=q6XtkBHn;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 52.101.69.44, mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nZgL9e60V/3b9wX3AxiMtgyZWcFocl+qnN1tYBxc0Y+mzFIIBk9S9BscBRKKsuONASGuE86dLRcV8VUhD/snd49XYJ5bdlrGJqyVlGNk9sxPYfkal2BbHMl19ltft8FBRzu469Hp1yMKm79o8Xu77QeaScPPU4m4WlzROGVa2qaTVclvsjif9Jw+Y/Y1JJYikhh7WniHG9ZgPjVZ4awkWrWKOX2roD2Tle8dnJ9hQ0xCjnf/MKZehsBF/yMZ5nQ7uO1xROjXJoWUWvjRU/5ALcgP873U3odCzcTKgeuISOw279d9u6fC8sPYqz7ZR1qwbwFaRy5UW4RgpsIdF9runQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3jrlj4vitG7JS4pQgukiUBmDP0l3vLVMTSKrKVr+9q8=;
 b=Wyka42AzSPWruBDE5iyiazamLFGB5d0r0jnBh15A963QRZYrvui56pkrED8W96FKPpunwMOi9G9aTq1HFK5spZsrY7wEqPbeQidaAIvPMeDsi38zWo1eTxvwCWnTl4PIYnBlDkhpQiSUSRLY82oVfO8BZeaFVycbhOCfzHt9dZ3o+QSKhLq67IYkyUQATZqtoeTJmJvX5li+QqYRJpX06bGXdWLMw/1Yu3oaeudaH7KsN1ZzZ3yu/iXlPMVRWb3lveB3L2PQqHSNChp0XA2t1+zsKLqLWsjZRcWv4uRRbGPQvpKvcZGNmLhy/VYnHxeeAJ3BJVMXiSm8D3LyJZiJVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3jrlj4vitG7JS4pQgukiUBmDP0l3vLVMTSKrKVr+9q8=;
 b=q6XtkBHngN8dlKu21BMnD+cBrA2X4PKdENaCtdF1nj/bZUmW11oHbYD+C5TOR0n9ono8VA+avZfWMeSnLzdRa+D6XaOW9rZ5Qa1HseXUdr1f2Y4/1mnvBWw2cI84lDpYqGWjsECKmCpkXqcoY29UMj6KzQTfqSyuzcZ6ENkmI2U=
Received: from DBBPR09CA0013.eurprd09.prod.outlook.com (2603:10a6:10:c0::25)
 by DBAPR06MB6664.eurprd06.prod.outlook.com (2603:10a6:10:18b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.25; Wed, 18 Jun
 2025 14:35:10 +0000
Received: from DU2PEPF00028D10.eurprd03.prod.outlook.com
 (2603:10a6:10:c0:cafe::cc) by DBBPR09CA0013.outlook.office365.com
 (2603:10a6:10:c0::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.29 via Frontend Transport; Wed,
 18 Jun 2025 14:35:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.94 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.94; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.94) by
 DU2PEPF00028D10.mail.protection.outlook.com (10.167.242.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8857.21 via Frontend Transport; Wed, 18 Jun 2025 14:35:09 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.60.34.116]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Wed, 18 Jun 2025 16:35:07 +0200
From: Johannes Schneider <johannes.schneider@leica-geosystems.com>
Date: Wed, 18 Jun 2025 16:35:04 +0200
Subject: [PATCH meta-oe v3 1/6] signing.bbclass: refactor
 signing_import_cert_from_*
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250618-signing-set-ca-v3-1-4ba014735f0e@leica-geosystems.com>
References: <20250618-signing-set-ca-v3-0-4ba014735f0e@leica-geosystems.com>
In-Reply-To: <20250618-signing-set-ca-v3-0-4ba014735f0e@leica-geosystems.com>
To: openembedded-devel@lists.openembedded.org, raj.khem@gmail.com, 
 jlu@pengutronix.de
Cc: bsp-development.geo@leica-geosystems.com, 
 Johannes Schneider <johannes.schneider@leica-geosystems.com>
X-Mailer: b4 0.14.2
X-OriginalArrivalTime: 18 Jun 2025 14:35:07.0513 (UTC) FILETIME=[300AE690:01DBE05E]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D10:EE_|DBAPR06MB6664:EE_
X-MS-Office365-Filtering-Correlation-Id: ac560415-f8cb-4f0f-4b84-08ddae755376
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?dUp4RWlvVjFYMG9wUVpib010NThCK2xyYkZiTGI2aVgyaU1zYkxKZm53Rklu?=
 =?utf-8?B?NGVJekRscXRhK0I5MEU2aXppQ3RRRXd2NmZDanhBQURvSEhsaFJ5Yk4wcGJm?=
 =?utf-8?B?UkxaSVBpaUdJNWUxVEcvaC8ybGFXWnpLd1k1SWdYZ2dSdFhnNCtlRVB4aWhw?=
 =?utf-8?B?WllyT3h6R2ltUFpJUmlkbFhuQzlxZ1ZBTU41YkxGeEFJK0RITmkrbUVwdTBO?=
 =?utf-8?B?djNESEluUGJydWpOdld0UWVwckxkRmsxTlBqNWVvTDJ3d2Rqdm5SL3RyOFhR?=
 =?utf-8?B?eWRhRHhTdGgyWmtYeStzUVRxUjd2R005SXZPQ0F2SCt4MDRjNjVaWmNWQmFG?=
 =?utf-8?B?c2RpUzNhWlZ0eHFEWmVTQW16TlNMR2IrQVVDOFUwenVNWUdkTm1uaHJEcUFT?=
 =?utf-8?B?NXc1NWpoaDQ3djQrSFZkdVBBcVhBdmNIUlJsZGFVamdxNDdvR2liVVp1MVVU?=
 =?utf-8?B?U05TdXpKbng5bkd4ekNvT2RoWWlTRWZoYW9SVXRVcjQ4S0tmUy9RMDg2OW1J?=
 =?utf-8?B?VWdFa3l2bU5WckVaZGtxT3Y3WjNPMFRJZkpBbG1GUnB4Vng3K1gxREg5cjZq?=
 =?utf-8?B?Vk4wTXVUaG9ELzZNajRidVNrYVg0SWxIaWpURnhURWNGc3k1NDZLSjdObkdB?=
 =?utf-8?B?NU9MeGF3Nk0rSHZaak9NK2xUc2ppZHBKMHBleTdMbmhXYlo5b0YzTXNhamFI?=
 =?utf-8?B?MkFMQTBWUU5IUGlscHNMZEVSQzVCZHRDb2pXanlpMGtDQVRTNkh2ekd1NTlx?=
 =?utf-8?B?K1hDbTFwUXNCc1NTTFlWdHNLZVlROHllV2FNTG0rV2Z1SkdKWk5sc2ZrdHVw?=
 =?utf-8?B?d2laT2g2MEp5ZkNBbEVndTlDeFVSKzJxWm1hMnVxSHVIVEs2b0pzOTlDUTZ0?=
 =?utf-8?B?a1phWXJjTnM1OVlvSkJ6UTJQWGpIZnhRMWJob0hjNjBYMXE3VFhMMVFYRlox?=
 =?utf-8?B?a1gwbGdHdUkxWEU4ZnBETld2aVRld1BURld4WkdxRWlSa2czMEJ6SXJwNlVJ?=
 =?utf-8?B?bnRjOXRtU0FMMUFRU0YvamtaMi9tSENRMDJwZlJwNVFsUTd2aWh1MUcySUZm?=
 =?utf-8?B?OFo4Wk94dloxRWMxd1NVU2NzRTlwZ0FvNjNmeW81ZE1LQThuYUF1clZOWnFZ?=
 =?utf-8?B?UGs4R1F2NnZVbW9kQ0xOU3M4V2VFVm94NXRLRGxZd0VwTDl5Qm94Zk1aNHRl?=
 =?utf-8?B?VjRtQ1lEWU8yZlFYZEZOM2Qva0dxWDdDMzFJbVM1SXVhcUJJWlArZGUrSTd6?=
 =?utf-8?B?WmNqRFcvTnRPRU0xWitRTktFdFN2OXBOUXJTcGlCT0o2cVFzQnBJc29Tazl4?=
 =?utf-8?B?MFlCVXVkV1liR2Flb28rWEJLellnWlkzNkIxUit0bWszaEJkRGpMSEU1RWg0?=
 =?utf-8?B?RjdWUW1iZzJnZFdSQTR0Y24wLzZocng2dVFRcy9MVlRyQVNMeW1GdXg3QitG?=
 =?utf-8?B?TEhDWmNvSDNUdEdKM09LS01hZU9YbjUxMmc5WlAvNjNHTGtDWER4QXpJRnpV?=
 =?utf-8?B?ZXdFZ3pEQy9veHlVVzRmS2hNSGtUUGt1ZlNFSUU1SG5GQTlGTG93TnljYWhj?=
 =?utf-8?B?bTV1bWVvaUR4ZHBEbEIzemc3Z0V2S3N2UmtWSU9RM3hNZVU4WlRLdXAxSHlk?=
 =?utf-8?B?ZzV4aWQ0YmhTZTRiTXFGK0VJaEllTndhQkZsaDVTQU1mY1hpUi9pUkgzelY5?=
 =?utf-8?B?UkY5TWNITXI5VTRydFJwVHdMTmFXZ3FUVDBhYmlRbHR6WldGNFRlaVJDUDdm?=
 =?utf-8?B?NkxOamJmYk9lQzh3Q3dYU2w2UU12SllwblA5WmYvanptUXh1TU5tZnEzMnR6?=
 =?utf-8?B?eG9waUhYTUVhYk05ek9mVlphS0ZheVl4NVNKYkEycVdTaWFHTjc0YTU2eUNl?=
 =?utf-8?B?N0tHU3FOdDNsMU44SmdRbnA5ZjIwTy8vZW9DTjFmSjRZck1TOU5uVmxZS3pZ?=
 =?utf-8?B?QkhyYmtFK2xKaXJ5QkpRa25QaW9ET0puVzk0VDFLUEpLMTlQVENVRXZwTUky?=
 =?utf-8?B?QUpqLytjSGtyaXZvbnIrUmQ0NENkVEk2QkRPTGJlUS9OM25MMStKWGNGWnZ1?=
 =?utf-8?Q?oGxnwX?=
X-Forefront-Antispam-Report: 
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 14:35:09.0439
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ac560415-f8cb-4f0f-4b84-08ddae755376
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D10.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR06MB6664
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 18 Jun 2025 14:35:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117938

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

diff --git a/meta-oe/classes/signing.bbclass b/meta-oe/classes/signing.bbclass
index 8af7bbf8e0190767175250aa8132f182a677ce09..c76837115192dc2b26756a47608caf7ecca1f727 100644
--- a/meta-oe/classes/signing.bbclass
+++ b/meta-oe/classes/signing.bbclass
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
2.34.1


