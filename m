Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43B35C8300F
	for <webhook@archiver.kernel.org>; Fri, 27 Jun 2025 05:40:34 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.5])
 by mx.groups.io with SMTP id smtpd.web11.6718.1751002823808913910
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Jun 2025 22:40:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@leica-geosystems.com header.s=selector1 header.b=T2LPxlYh;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 40.107.159.5, mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z38ipSNJB7eZTkiVVGRnGsNHpma3+ug/iYR2CNgWK7Q7yI48JuzeOPs7PT9ZWUmfKCmx4hxmvlfifm9fuJUdgeGUmiPp/9MzWROlqnM9wx2N1yNiR8hNWFc2rE3QtF93x06hnXc/vUiPrPKAvXTqO2XrGPDmpZ26jCtDb3PF8ZQEFSJ97mJSqFA9lgE0thUsfoZDZLfPexdgKySHdTvafhdRzgOMPrnvVzusPgbhhMr4bkaDBwQ2BJEgJd0ElBnTK14Q6ljDOgV4XtJaL/vu/hcFjSrS/Uk8W53WmtTrn4fWOgrLq7L6M95lKZxwxAh5h0w2mCMorjvN/rBO11Hvkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R+qUpTYjp0Zut5i1svfbyeUE1Pj21XrYVC+1wfocC6g=;
 b=A+TgnXv04nUmRdatfzFCJ0BB7gZQi/BE4s+1HHVscqDzz/OjXHoMeXklTthNl4naJmnvJptydx+stM0jxK0Mqs8W0+SbI5Kv/72mvSkDGO+X972VmCxTKiTlsfG41Z2p/jIHQxgAv3fdFmB0OkS4EoZM7+ipmw9HAXMQJOofByxkIxRKCSOzCsbGjOv6m4GVIJgRMXf9Ku+GtNZYzPwKnhEqW9PYQ48HNUEPAdfbX5tAwvAA1rpyRGvYkV8LdWFZZJ0BO5i/0/RE+i+u/KYKDn5nfk5acTPVcGRZxle6Nd5NLnJbh2gYngVHUe3fozx9nOUbzUG2xGkBGqqDlgrElw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R+qUpTYjp0Zut5i1svfbyeUE1Pj21XrYVC+1wfocC6g=;
 b=T2LPxlYhDapkLh9xpJHvglaHPc9BREi1tXcEgI7a5EQLZAdJv4zQkws8tWn2zoTJYdpQnqZN9/GqGjkoQ6ZsrtCfsFLGawEGP/2EoyPye22mAsKm55cUSow9atQj4nJW/xaP+8iVUmHrW6wKHcWIl++vibsSi3CYFME4b5Xn9mY=
Received: from PR1P264CA0097.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:2cf::12)
 by VI0PR06MB9229.eurprd06.prod.outlook.com (2603:10a6:800:23e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.33; Fri, 27 Jun
 2025 05:40:18 +0000
Received: from AM4PEPF00025F95.EURPRD83.prod.outlook.com
 (2603:10a6:102:2cf:cafe::c2) by PR1P264CA0097.outlook.office365.com
 (2603:10a6:102:2cf::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.23 via Frontend Transport; Fri,
 27 Jun 2025 05:40:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.94 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.94; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.94) by
 AM4PEPF00025F95.mail.protection.outlook.com (10.167.16.4) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.1 via Frontend Transport; Fri, 27 Jun 2025 05:40:18 +0000
Received: from [127.0.1.1] ([10.60.34.121]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Fri, 27 Jun 2025 07:40:17 +0200
From: Johannes Schneider <johannes.schneider@leica-geosystems.com>
Date: Fri, 27 Jun 2025 07:40:15 +0200
Subject: [PATCH meta-oe v3 1/6] signing.bbclass: refactor
 signing_import_cert_from_*
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250627-signing-set-ca-v3-1-030812797c6a@leica-geosystems.com>
References: <20250627-signing-set-ca-v3-0-030812797c6a@leica-geosystems.com>
In-Reply-To: <20250627-signing-set-ca-v3-0-030812797c6a@leica-geosystems.com>
To: jlu@pengutronix.de
Cc: bsp-development.geo@leica-geosystems.com, 
 openembedded-devel@lists.openembedded.org, raj.khem@gmail.com, 
 Johannes Schneider <johannes.schneider@leica-geosystems.com>
X-Mailer: b4 0.13.0
X-OriginalArrivalTime: 27 Jun 2025 05:40:17.0563 (UTC) FILETIME=[F6A8DEB0:01DBE725]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00025F95:EE_|VI0PR06MB9229:EE_
X-MS-Office365-Filtering-Correlation-Id: f713f56d-95aa-453c-9edd-08ddb53d19c9
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TzRjcEpmNFY1b3lwUnAwekF0OUVZVnFTY08rNXpDWEZUanNtbXFTakdXcEhy?=
 =?utf-8?B?WklsWDRPWUZrUVAxU3JKWFlnVGN1T2phYU90NS93MmV0SlVQQ1FuTnVZSVBZ?=
 =?utf-8?B?RkRiZlYxNXZQNXdEV1ZqY00vSk5jendnbWs5aHdUU2RiNkpHK2pidlRGSkFX?=
 =?utf-8?B?SVZJSjlTeGRVcStzRjlLSW5lZ0UzNC9IWDRyaDZmekxud2ljc0JURzRIemRH?=
 =?utf-8?B?SEcwcU8xVERiS0k3SnZWVFJ5WWtYUGt0TktZR1RybmIrRXIxRUNwNmdWbzdv?=
 =?utf-8?B?Uk0vQXc3djBveitkRXIyN0pCdGxsdmo2VmxPM0oybXJZenNjaTV3N3c0Mzln?=
 =?utf-8?B?aDkzSG0yd2huQnJ3NkZBaDJWeElmV0hhVkw5aHZYZXR1eVU2eWhrdERVdXRU?=
 =?utf-8?B?RXYwbkQyZWU4cXlwbkIzS0UxSncyZGo2ZjZkWnJOVWFNMTc0YTVhdjIyTmtH?=
 =?utf-8?B?Q3FoRTU1TUJGaWJHbzZnWHBkM2NiQ3Z2cnBCeFJ3aVVjWm82T2UxTmN3RCtq?=
 =?utf-8?B?VkoydHZMKzlDbnlqeDBWVHcwWmZScmdOd3pweTlFOWxzQmJxSWlCSzlpb1dH?=
 =?utf-8?B?NTczVFptWTdkTnhUOVJsdDhGSktYVThha1Rldm1BYk5vLzRBWGsvbkRtZGxJ?=
 =?utf-8?B?bXQ5cG1KYW01UEt0MlRCT2M5YTNkYTd5TmgwdmxrQmxaVTRsVFRQcTBOREw2?=
 =?utf-8?B?Y0hKeS9BVFYwcGlWajREM1ZnOStyMXFGVW1Ya3R5N1Y0QWpUUSt3S0V6M1cx?=
 =?utf-8?B?bWNMUFVzSmtHYlhocXpYTjNrSmhPYXdZUzRJZ0puci9pNTl1VHlqdmlFaGRm?=
 =?utf-8?B?ZTBic3drTEQ5VHVxNllIVEVmbGZMdkRlWWxpdnIxdmV3c2JVcGczcXNIWllt?=
 =?utf-8?B?L2pDZVNqdmNpTE85R1hmb21CRmFMVVVPQXJBV3dnRnRlV1E3dnQzVS8zMUM2?=
 =?utf-8?B?OGxuemtvcm1WdW9vUDhXRXhKLzUvQWc1MDRpUVM0Nmk1L2xFTHBlSFo2QjFh?=
 =?utf-8?B?TDJEMDIwWjNld0N6YTRkbkVkdDlGMFBRN0dmZFQ3MWlFVEZZLzRYZ1djeTNp?=
 =?utf-8?B?VG82ZGx4aC9MYkpxaTR2Z1UwTGlaTi9mSE9xU1c4OExXQnBickpuY2pYR3pQ?=
 =?utf-8?B?Y1A0VXo4VU5vZ2tsNVA1cURGeU9oM0NRWndYVkdMUEU0OTNxTFRFNEF3VnYw?=
 =?utf-8?B?dzJSai9GcHYxN084NW0zWnZLejRxTUZDN3kybWRKemIzTE1RSUVyZDZSNW8z?=
 =?utf-8?B?M1htU0V1TWd5YWN3Q09xQ2syNmtvSWZOdWExZUpaSnorZzRPZ1JOdStRd2V3?=
 =?utf-8?B?T2NCc3doZWlhU0g3TklXSE01SThpQXNTVTZNdUtyVDlybVlqK1ZPVm0zTzBo?=
 =?utf-8?B?RU0xSXF0ZE1sZ0pHYXA3TlRXandWUUhTNWZsaVR6YnNzc291RHJxZDRnZGlH?=
 =?utf-8?B?bkREcUxPVEN0Zk9RemRGS3ZGaTEzMVRRN3o4YmN1ZGw0Mmtab1lOZEQzNzcr?=
 =?utf-8?B?bGdXa0ZZdXVIbGVHd2hSc25GakUzQkUzVFFuRU4rSys2VE0vZ3NMeTJBR2hi?=
 =?utf-8?B?Wnc5eXVRbmpXWjY0YVRsOFlKaVo2UTltRkhmTlBDWWJqWVdMWXYyazk0N2wx?=
 =?utf-8?B?a2pWL2lJdE1tdzN1T0NEcXdQdXZXUFF6elBwWTBMbEdGOHpDcWhtWUtET2Rp?=
 =?utf-8?B?cDdvMUdlUFpHckw1R2d0dHhWblRiM1NXaUF4eDFqR0pzY05jQXdVTU13VmJj?=
 =?utf-8?B?UGJYV0M4UU9BR1p0d1B4bUNkM1VQTXRkZVNhcDRQUnpma2JmMSs1cUFxTEJR?=
 =?utf-8?B?bEFPTHRWaFpUbmxQb1dXdkhHSlFvQllrZjJXYmNqdVQ3WjVackdmVmRrUjNn?=
 =?utf-8?B?M2poME9HdnBYMHBqUFhPZWVweWhuMmdMTEpzd1BSZ0NTaHdvMjlzMHNOWTVm?=
 =?utf-8?B?ZEpqVlhVMVlhc2doaVYxSkxxWjRNRUFiTXIycUVaVDVsT2VzcnUyRkhIRWpP?=
 =?utf-8?B?L3BXdFFRYWxrNGUxeUw1c0o5OFhlM0pJRWRLZU0yTWsrV0RXa1RSWi85eTdY?=
 =?utf-8?Q?eoHuGd?=
X-Forefront-Antispam-Report: 
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2025 05:40:18.6410
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f713f56d-95aa-453c-9edd-08ddb53d19c9
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00025F95.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR06MB9229
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Jun 2025 05:40:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118134

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


