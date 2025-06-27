Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 438E7C7EE3A
	for <webhook@archiver.kernel.org>; Fri, 27 Jun 2025 05:40:34 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.2])
 by mx.groups.io with SMTP id smtpd.web10.6808.1751002825139606535
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Jun 2025 22:40:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@leica-geosystems.com header.s=selector1 header.b=beH8tGQ/;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 40.107.130.2, mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NA66x3o6WNdShS66P0gUCTXXTAqOgTwDgHuvRnzJ6Qn4dGHlVdOG+yJDKI/Hs8rmeoWmdj5vzVh9/ehLvKhfgthPtgXdRsRvNqSXuLxHCc+ESw+5Y9ag26gfK9OTJJ0CXGRtIY9hXXjxMsj8Lv4pHm82i4f7PS/mlxm4tfpCWvSxXTW4Wkbq2ImEEDNsE0e6mY1MqwtVyy9nY3mN9fSqIPrN3jv1y3xOYZHDXI/6+wdNRc+nPXZyV368frMiU0xey9m5AbWJZyPxC2VB+McMkEdPruobMcMwL3Mp/O7DYDDJ5IKjRSzjIsdzN/dARmR8a1ZoQQnPccGKRrAVRf9qSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0R3NfOv3xf4/+/cAjl3TuLCsXi9tZtOOyHupojwPQf0=;
 b=VZ57YHigGRx3uYF1JSoceXs1//p8ApLEcBYKdU5+nhus33wuT54ejua2sgurtQ1kk1DDnLr1qL3uTWnNjidsyLBG20Q4scNbts08aZkqrReWX1A3MxjusCHWOs6l3L6eWgsywDQhKkodC9P96MAd6ZrWq8wKX5XwqHjYGwRouDz2oW4thUdyx9rk61w1Uu707j7kb6QjOlVXjYuYE1dmMxysWjMI30L+khXyndtsuR0jC4frOkKi83y9FkXPnKvCUdUZehRm7t4JRu1J+UfzTbYfZYX5agvF7NOXCJAcVTpxbEQa89aBXVuVaX2B5PnoJE2y9VRHB2ntGoyWCY7ddg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0R3NfOv3xf4/+/cAjl3TuLCsXi9tZtOOyHupojwPQf0=;
 b=beH8tGQ/xba2FUOy8CgzqbFiHTGmpEqxS83IW9ymtytBsYgCZo2bZgoc4PPXKIY6a72DHoKK5yQNv+pcukl3WqkxXuDRlVKCwoD5apFbcUdM7UAfyrppezbDfdzOzXBgQ3QD62OSNP+viNPjgW2s5GrPwUfZ2SJW8faX3MQRorE=
Received: from PR1P264CA0103.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:2cf::10)
 by AM9PR06MB8001.eurprd06.prod.outlook.com (2603:10a6:20b:3a4::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.30; Fri, 27 Jun
 2025 05:40:19 +0000
Received: from AM4PEPF00025F95.EURPRD83.prod.outlook.com
 (2603:10a6:102:2cf:cafe::72) by PR1P264CA0103.outlook.office365.com
 (2603:10a6:102:2cf::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.21 via Frontend Transport; Fri,
 27 Jun 2025 05:40:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.94 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.94; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.94) by
 AM4PEPF00025F95.mail.protection.outlook.com (10.167.16.4) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.1 via Frontend Transport; Fri, 27 Jun 2025 05:40:19 +0000
Received: from [127.0.1.1] ([10.60.34.121]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Fri, 27 Jun 2025 07:40:17 +0200
From: Johannes Schneider <johannes.schneider@leica-geosystems.com>
Date: Fri, 27 Jun 2025 07:40:16 +0200
Subject: [PATCH meta-oe v3 2/6] signing.bbclass: add set|get|has_ca
 functions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250627-signing-set-ca-v3-2-030812797c6a@leica-geosystems.com>
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
X-MS-TrafficTypeDiagnostic: AM4PEPF00025F95:EE_|AM9PR06MB8001:EE_
X-MS-Office365-Filtering-Correlation-Id: 9416bb85-7226-4b8d-5b04-08ddb53d1a54
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?NmZIR1lKQmZHaFkzclJZRVlqOTJqTHF1a0ZPNTZlRFYybTdyQ1c2RVV2akhs?=
 =?utf-8?B?eHVKTU1pTE92ZERzbldaVzNYOXovQ1pNM2NUVVNMWG1LVFE2bmo5ejlYd1F2?=
 =?utf-8?B?WDRsbThpVXkyQzdIRldBVjZ1VVdYQ3ZtVVdiY3U3NElRVU1UT3Vrb0pwVjhZ?=
 =?utf-8?B?WDZpOXpWb1NZTk9ZTHhvcVoxcGhhbC8xeGFTUDcwcDA0cmhPWWZ4NjlCZTJR?=
 =?utf-8?B?L3B5bCtHU0c5R1g1VnJEZlFiZUYyajB1bWZyOWQ2ZVpweERYNzdEbVFPQzBq?=
 =?utf-8?B?KzR2R1hUY0NqUDY2eDlZUVc5ZTRiYlNYSnNjazZsVXY1TjkvajRWdis3TmNR?=
 =?utf-8?B?VGVkdzdxbFFISXVVVjhjcXZkbHYyWUI0eC9hRG1OWWh2Si9VbUF4c01NVits?=
 =?utf-8?B?VVdYclNVdjM0MUdDZnJkUFBVOFQ2THZMNU5Pa1lyakF4TFB5K2JJKzlSaDh0?=
 =?utf-8?B?aENlQ2JPWVorV0lCNzg0S2VmdFZjQVlrTS9meWhOaEw5dHFCeSt4K2RGTHpW?=
 =?utf-8?B?TEtNS1pWUjk4enZLbUNGTUZKT2tGQnJ1NFpnWUlRV3RHbmZqWU9oaFdXbnNY?=
 =?utf-8?B?UVVvejl1SXBWVmhMUmNLQTdmUFNwcjZ6YkJGdXF5TTZ4YmhFZGZueFBXeFVt?=
 =?utf-8?B?bjQ1Y3I2dVU5NkNGWFhaUTRvc0JIcDVwYmg0TDJCcDNNUFdLOU53N01XTDRW?=
 =?utf-8?B?QUZQMGwyOGdBcks2d0tCenRleHNXT3BjOFlOMmRlUTVLL0RTaG1HQ1p1Vkoy?=
 =?utf-8?B?SkwwZlprVm9hU3BmM0UzdzNsQ2hWdXp1S0tPdDlUSGVCVFZReTJLeTByUXlS?=
 =?utf-8?B?NUJWeGVlQVQ1c0JCaUFNdVhPbVJIYzYwNm9RZGJOS2RvTXhzUFFnUTB0VW85?=
 =?utf-8?B?bVZuYVdGMnhDenhTUWFDVUovVHdyclk0QmN1cnFTcEowTWliR1hHQnU5SDB2?=
 =?utf-8?B?MVdDNklrOGhEb1JGcE5jaEt3MmVYS3F5YjBNdFZxRnpwNVEwV0RsK0x6azIz?=
 =?utf-8?B?SVNIazc2YTF4SHFieGJnM1ZrSWpqOGMzc3B3eUlWSGQ0UlZhMzJCNGg1UHlD?=
 =?utf-8?B?ek9INDRJNnFVZ3F3KysvRHh0QUJpNjM5anlIcTZrZWE2REFRS2NJTWJuaUhB?=
 =?utf-8?B?dmZIRHBvcFRXUytMdXo1YlRlYUo4WkZZdVhNanBIc3ArVDA4UGlUUU1ZZ3J0?=
 =?utf-8?B?TmdodmFBZG1EU1EwMGU0Zmo5UUtwZEZNT1NpWWNISmlObFVDUG15aldPWkNI?=
 =?utf-8?B?WXRtZ2lEaFpVc0xSRkg2MU4vYTZEQkwrRGQ2eCtnTUthTncvdzZmWEQ1OUpw?=
 =?utf-8?B?RkkwaEFNcG4rdHVSbzJqN1RNMmRiV0ZibHRHa0thY3ppWUdFbDFpWVRtMWU4?=
 =?utf-8?B?Qm5TTmZlMGVINnU3RXRxV01BTzI4VlBqb3NvTlNRRE4yQkFHem50OUhqaWNR?=
 =?utf-8?B?VEdGWVdVVzZkWU03eDNtZUhuSTl4NkphMnl3OVBFZTJMeU13amFNRkd2M0VB?=
 =?utf-8?B?RUJ5Mit5WEF0NkIyNWxyT2dWazFkc0RRRTlicWdDTEpickpkeFJXY3ZETkQ4?=
 =?utf-8?B?NzloeGF4V3BmYzZtbVNBTkRuWnZGNm9BWEx3YXZ2YkNxaGtsY2hrZXZxMzlD?=
 =?utf-8?B?TDEvam9lblgzbGZRSkFUbjIrWWY5UGtPcE82ejRQSGdVdVQ3d09KT1Z0NFE0?=
 =?utf-8?B?ZnVLTTRyWk1wdEkwYlZLZk9HbWRhdCtYTTNRTFBQS3c5QWI2eSt6bzdxeHlt?=
 =?utf-8?B?Uk83Z1B4aysyeG50bSsrbUZFVjM5UW1hRGcrVHNJVTl0UjNTdmVnZTJyKzdV?=
 =?utf-8?B?VGtyRDdqZVhzRTh5djlOcElyVTc1OTZpNHgwMEh4Um9zcDNyZmt3RXB1Q0xQ?=
 =?utf-8?B?MGtTVW10OW9aK1dGT2lSTkxEb05nUzNsYnBCM0R2b1ZmWWwzdDZUVDd4WTNY?=
 =?utf-8?B?Mnc4ampQL2tOeGxXdlBFZ0U3aFg0bXB6MWlEWEd3RHVlV2ExOUtaMWlPMDdm?=
 =?utf-8?B?eHBxajkwbFVQTTE0eGNLMjV3T3BmNTlSakRYUEZHMlRDOFhVQTBjS3dLRzdK?=
 =?utf-8?Q?JjsH1s?=
X-Forefront-Antispam-Report: 
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2025 05:40:19.5506
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9416bb85-7226-4b8d-5b04-08ddb53d1a54
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00025F95.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR06MB8001
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Jun 2025 05:40:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118136

Add a mechanism to establish a (metadata) link between roles and signer
certificates, in the form of a new 'ca' variable.  It must point from one
role or cert to the signer certificate to preserve the leaf->intermediary->
root certificate relation.

With this additional mechanism, it would be now possible to import a
complex PKI tree of certificates and then later during usage of one
role, reconstruct the certificate chain from the leaf, through
multiple intermediary, and up to the root certificate.

Reviewed-by: Jan Luebbe <jlu@pengutronix.de>
Signed-off-by: Johannes Schneider <johannes.schneider@leica-geosystems.com>
---
 meta-oe/classes/signing.bbclass | 50 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 49 insertions(+), 1 deletion(-)

diff --git meta-oe/classes/signing.bbclass meta-oe/classes/signing.bbclass
index c768371151..04bd92bc03 100644
--- meta-oe/classes/signing.bbclass
+++ meta-oe/classes/signing.bbclass
@@ -87,6 +87,11 @@ def signing_class_prepare(d):
         export(role, "SIGNING_PKCS11_URI_%s_", pkcs11_uri)
         export(role, "SIGNING_PKCS11_MODULE_%s_", pkcs11_module)
 
+        # there can be an optional CA associated with this role
+        ca_cert_name = d.getVarFlag("SIGNING_CA", role) or d.getVar("SIGNING_CA")
+        if ca_cert_name:
+            export(role, "SIGNING_CA_%s_", ca_cert_name)
+
 signing_pkcs11_tool() {
     pkcs11-tool --module "${STAGING_LIBDIR_NATIVE}/softhsm/libsofthsm2.so" --login --pin 1111 $*
 }
@@ -145,9 +150,52 @@ signing_import_cert_from_der() {
     signing_pkcs11_tool --type cert --write-object "${der}" --label "${cert_name}"
 }
 
-# signing_import_cert_chain_from_pem <role> <pem>
+# signing_import_set_ca <cert_name> <ca_cert_name>
 #
+# Link the certificate from <cert_name> to its issuer stored in
+# <ca_cert_name> By walking this linked list a CA-chain can later be
+# reconstructed from the involed roles.
+signing_import_set_ca() {
+    local cert_name="${1}"
+    local ca_cert_name="${2}"
 
+    echo "_SIGNING_CA_${cert_name}_=\"${ca_cert_name}\"" >> $_SIGNING_ENV_FILE_
+    echo "added link from ${cert_name} to ${ca_cert_name}"
+}
+
+# signing_get_ca <cert_name>
+#
+# returns the <ca_cert_name> that has been set previously through
+# either signing_import_set_ca;
+# or a local.conf override SIGNING_CA[role] = ...
+# If none was set, the empty string is returned.
+signing_get_ca() {
+    local cert_name="${1}"
+
+    # prefer local configuration
+    eval local ca="\$SIGNING_CA_${cert_name}_"
+    if [ -n "$ca" ]; then
+        echo "$ca"
+        return
+    fi
+
+    # fall back to softhsm
+    eval echo "\$_SIGNING_CA_${cert_name}_"
+}
+
+# signing_has_ca <cert_name>
+#
+# check if the cert_name links to another cert_name that is its
+# certificate authority/issuer.
+signing_has_ca() {
+    local ca_cert_name="$(signing_get_ca ${1})"
+
+    test -n "$ca_cert_name"
+    return $?
+}
+
+# signing_import_cert_chain_from_pem <role> <pem>
+#
 # Import a certificate *chain* from a PEM file to a role.
 # (e.g. multiple ones concatenated in one file)
 #

-- 
2.43.0


