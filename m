Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA556C7115B
	for <webhook@archiver.kernel.org>; Wed, 18 Jun 2025 14:35:23 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.59])
 by mx.groups.io with SMTP id smtpd.web11.336.1750257314231910936
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Jun 2025 07:35:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@leica-geosystems.com header.s=selector1 header.b=LhpM5kS/;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 40.107.159.59, mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HZaPlOj3vgpiXjnKN3rSP47wHqAV4DlrCdLFKDSIW4nCFyKWDaLpNeR8pJkqCSYpFSSsK7JgHwSb94PWI85o9rcdddybushBjOumOrtlf9FWDEHP6WDiDD6ZR2VmAchEBcoGkrFzQsZI0+fb0S9yhF46WBh5r6qh/kqsfqziGmRuANB3BWfc9yGPJJToUcAS9rVU1keAbJDzre9lLvmZ0iB84zu8pRa40JnqspHLvzGfHYnyzfLsiOtljlrrLLgWTVD/lVqTaINmikSnjqyREmWTu+CFzu66xd55wUDAtlTRToB7IC/uZ4ebjhHoTrY4qROvpa0GnhU1cpRJgvVP5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MofWRj+NLACeYFuDYDhsSoPt2JcWogIP8AmI+i943lM=;
 b=wdLoqoVTnfDbtRuIrNLlZkhLJ0np0n+gI7/6zVdkCIvkJgIDRyZ4jkZ6SpC0nGDu2cQrpKlAukcdVC1oi2AsRjQ+dhocJWI6ydD12h6llBUhI0Xb99KnF1bi7YEcMyH+1aqpd1d00AVYvEqQfEzCzRYypMNbcS9JL12mayjhvvWx6Ail4qS3rQKBCi8xbNCz7BmkvznAHepCUsPc5CFrtrn0zrRZyH4hJeLIhHbAS4A79aLD12ZzT+tsgGmNdWJsu+NwTnz3bg6fBtukiB6b6bxtlduJC47/oMLHDfZ07wxZzji/k1CraCajze0lGkdfIStpH0k1iY/tn3LPFnWlGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MofWRj+NLACeYFuDYDhsSoPt2JcWogIP8AmI+i943lM=;
 b=LhpM5kS/29HdTDHHwxYSl/RMs1iPhXsUWufpGkepKCTyJdDJnolZq6jCwsaXEL2T0Aqgex5NqWlbwrvOfN0vh1k/8IQdYKd0ma67Mq1G/q6Kf1+e4Qj1DUxNp/sIO6o01uRGn5zjMZ6w7Fq0UKMnheOHhpCaJuWzvqhPqAqKcjo=
Received: from DBBPR09CA0007.eurprd09.prod.outlook.com (2603:10a6:10:c0::19)
 by DB9PR06MB8462.eurprd06.prod.outlook.com (2603:10a6:10:371::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Wed, 18 Jun
 2025 14:35:10 +0000
Received: from DU2PEPF00028D10.eurprd03.prod.outlook.com
 (2603:10a6:10:c0:cafe::de) by DBBPR09CA0007.outlook.office365.com
 (2603:10a6:10:c0::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.34 via Frontend Transport; Wed,
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
 15.20.8857.21 via Frontend Transport; Wed, 18 Jun 2025 14:35:10 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.60.34.116]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Wed, 18 Jun 2025 16:35:07 +0200
From: Johannes Schneider <johannes.schneider@leica-geosystems.com>
Date: Wed, 18 Jun 2025 16:35:05 +0200
Subject: [PATCH meta-oe v3 2/6] signing.bbclass: add set|get|has_ca
 functions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250618-signing-set-ca-v3-2-4ba014735f0e@leica-geosystems.com>
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
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D10:EE_|DB9PR06MB8462:EE_
X-MS-Office365-Filtering-Correlation-Id: 288bf30b-1825-49fb-6222-08ddae75548c
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?M0tRVllpUEczUW0ydEswOE4remRxN3o1UXN3TnZuNG5POG5tQVJRNHgraXhD?=
 =?utf-8?B?R2srMW1KYTMxSThoZU9nWE9CTkFtTGx4L3l0SkdsVWExREZyL3MrR3RlcHQy?=
 =?utf-8?B?U1B2NnFCNFVua1FMOHlEYzVlNGZhYWs4K04vVVowT2hJTk5FUVgxYjF0bTlO?=
 =?utf-8?B?Ly8ycmFGVHlGUC9mR2pTWFIyMElIOC9XNm1zSFJSdjBjSURTZzNrWWR0akJO?=
 =?utf-8?B?bTltU1BJMEszTTFzaDVlK3pmeTJ6V1F5OXFtcVNaQVQ0T0ZnMWZGaWVUQ0ZX?=
 =?utf-8?B?M2hHZll3VWtxVXpPLzQyUDdSNXRYcjJCMHdWbG0rSmNUN1lVM3U3aTZTTlY3?=
 =?utf-8?B?bk9wMTRlNWVtUENaRngxRTFHY0tqQ1kyQXJ3MGU0WHRHU2FiK09Vbm5iODVs?=
 =?utf-8?B?SWNxNUVleWhHRGp6T2Y1bm1ldTh3OHFFcUpMcnYwNElvMXZmVDZmQXBueks5?=
 =?utf-8?B?S0VUd2NhVU9sazY0ZFlLalRKbjRjdElYYWd5Y1VJOGJ6M05DMWNQL3FUSTM2?=
 =?utf-8?B?Zzh2Zm9ibjRWTXBKQUxmc3R4a25QNUtEdExiZXg0UEVFQTZ1NUJOd1h5NzNW?=
 =?utf-8?B?OHBFR2Y2YnZKS3M5Tml5MHFFZUpJcWhFZUVkOVNwWStlMmNZL3hDejh0QWNw?=
 =?utf-8?B?Vk93cUhJc3dBallzNEFLbU1uUFp2dzE1TVA2ZjgrNkRyNUFNNnZkSE5nYTdF?=
 =?utf-8?B?SG51TFFQc2x2MnBDUHRGdnF3alcrUHYwMnU0RVZ0RkdYWnlrWG85S29YcGZo?=
 =?utf-8?B?YW4rSnM0V0FWZzNxYklzQkpVcllkRTVkRnkrQTIzdnMvQUIrM1lqOTVHUm5B?=
 =?utf-8?B?OXUzRjYxWTA2NHNWbkZJd0kzMmp0TGJIR1hIaWY1NC9zVkVIWDJVc0xUcnNW?=
 =?utf-8?B?M0JsTWRMMUdPaVgwd0dlVDg5cDkyOHZhWTFRbDBRWVJzWXdGZDBFVi83b3hi?=
 =?utf-8?B?Q29RZ3U1SWRxNEpFN2RibGNQYStUSVUzbHdrUWJJR1hjUnc4eDR6RWp6MVpo?=
 =?utf-8?B?TGdtbXFORHJuZ1NPeGplSHdOZTlWaGxhRHRjdTJhMmVWbCtHVTlTR2c2M29T?=
 =?utf-8?B?bXJIaEZtaFpUVGhHSnZQUyszWGJXN3RuN3lQb0pTS20za2pKSkk0dnlIbkli?=
 =?utf-8?B?NWxYU0g5MGV3K0ZYYWhSZTNibmFjZzgyRHp6alFmUDd6WkFtdHZUeHNkOVpx?=
 =?utf-8?B?bHpkY1dPblV5b2lFQ2ZaQnlPQzltT2tBS0R6TlBDaEc5Z09jS3MwQXJRQkN6?=
 =?utf-8?B?eEg4bGxHNVlmemRrZHo0N2phVkw3TUowUUVQNHd3NHlqTGVEWWlrMkxMbkFo?=
 =?utf-8?B?S2g0L2xBNGtITFhUQmpTNkthTFF0Uml3dStHb1IwM3pmVVZMSVBUY2J0dnI5?=
 =?utf-8?B?M2xURnB0VFBPbnZTRUpodkh4UHFEV05LUDZDY0ZTRTAySlVoR05mdHdSNUdw?=
 =?utf-8?B?S3hKVEQyY2FyT3lnWG1tTlRKanlhSmZ6U0NuOGkzMXlGdWdnSFZQZHRGY2xQ?=
 =?utf-8?B?UHdHMVF5V29uS0RhcHlwdlNTbGV0MllRaDhSSkZnaGpXN3duY3QxQ3VxMXRV?=
 =?utf-8?B?Yk5ROEhCTzhqa2IvRzBhMFVBaTV6RlJhNm9ON0pCZ0xSa1RrcFZaZDU2S1d1?=
 =?utf-8?B?K1VONGc5a29nTk8xdzh3TmlkdDJ2dlZFNmlGbURjZGJTSjNqeEZlbmMzNTRr?=
 =?utf-8?B?djJaT043a1JsbUZ4dit1OVo0eitUSXlPRFNqT3d3L3IrV2tmVEdzNGI4WlUz?=
 =?utf-8?B?d0RWNVhnMDl5dXd4RDg2Z2dydFNQSEM1QnA2UlVzRnpTRXdGSG52WEhWSjI1?=
 =?utf-8?B?VzNmOVlJUEhCUXo3elFmWTMrK3NOdDEwL3VxSWxGbXk5Q3IxcU1NcFYyT3ov?=
 =?utf-8?B?am1VMnY3bUduVlFTc1VEZEhSTXFnVXFYZHhrMXV0TzVSQ2VTNUtuZFZyRU4v?=
 =?utf-8?B?R3N6b2FNcWRDZnh4RHdUUW9JWnVyVGVCYzJpRVovV280UDJFb2tVem9jVFph?=
 =?utf-8?B?cXV5L3pRN21hVjQxMEVibk5pbUV1UldBcFlSV2NFNVAvOWRuTGdGdDhKQzJh?=
 =?utf-8?Q?aKXxb2?=
X-Forefront-Antispam-Report: 
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 14:35:10.8734
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 288bf30b-1825-49fb-6222-08ddae75548c
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D10.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR06MB8462
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 18 Jun 2025 14:35:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117937

Add a mechanism to establish a (metadata) link between roles and signer
certificates, in the form of a new 'ca' variable.  It must point from one
role or cert to the signer certificate to preserve the leaf->intermediary->
root certificate relation.

With this additional mechanism, it would be now possible to import a
complex PKI tree of certificates and then later during usage of one
role, reconstruct the certificate chain from the leaf, through
multiple intermediary, and up to the root certificate.

Signed-off-by: Johannes Schneider <johannes.schneider@leica-geosystems.com>
---
 meta-oe/classes/signing.bbclass | 50 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 49 insertions(+), 1 deletion(-)

diff --git a/meta-oe/classes/signing.bbclass b/meta-oe/classes/signing.bbclass
index c76837115192dc2b26756a47608caf7ecca1f727..04bd92bc033e8854eac245e399126554dbaa2fea 100644
--- a/meta-oe/classes/signing.bbclass
+++ b/meta-oe/classes/signing.bbclass
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
2.34.1


