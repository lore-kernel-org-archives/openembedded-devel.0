Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA3EDC7EE32
	for <webhook@archiver.kernel.org>; Fri, 27 Jun 2025 12:18:46 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.13])
 by mx.groups.io with SMTP id smtpd.web10.12233.1751026717570247290
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Jun 2025 05:18:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@leica-geosystems.com header.s=selector1 header.b=n+jXR4Ud;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 52.101.84.13, mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vzg2kLvvTam4uckyBtK/naVzvyCQ12IscAowB89hHqPxMMFSO2Sg2C2OwSgEp/sWdLtMHnZdENOl/zNoVmP37oZ/GCDGSQwXUHBdJmQuYKlL5nw/y95PfOeZUxYcOBId6aBHD4lQsgXRwh0m1iyPMuhKeevVOlOYoIV5eskEZO+17Zn+Rr66uvNCji3zkF5oWsNi2PgpJxj1wdaQxwHHVnx/aYt4RHN9aatIQKJOfxVNb9qiq7gnNgszh2RhDGQXe3pYDQWrFysz72xQA4T41HBFKydbnpUU/TnRglvfR2a40Meq0WUBQfa+gxPpr3ZQU+03DYdSyyGqMG6rToHX0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0R3NfOv3xf4/+/cAjl3TuLCsXi9tZtOOyHupojwPQf0=;
 b=ZKtA76H7HCHpDFnFoTSchfYqUlgmAOVQb3L4ti6jTMSTs07jNSweBEnrA3WZOnBxdeeIA6DjffybiG192IAu0utvQLJ/Q+cthEIwGe3B5WswvXFqeXz07FMabC0syAcPdG2pAABuck34bO26EfjOSVJ+baDO/7NiA2harZ3T9zHcF9S5uEaOn73nw4Mt7iChjWWFV1o6eAenFnWzqtwW8PT1n+YrL/W/CaVaFz9egAQtAWKkVsGhmQ70Xz7R9r7+NJr728HD4JCSNukhB+g4OtKvjBsBa8dO1gJzfjp7FFUAwlKlKFcYnJgrEkxeAJ3khYJroDZXErw5h9OLObBfaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0R3NfOv3xf4/+/cAjl3TuLCsXi9tZtOOyHupojwPQf0=;
 b=n+jXR4UdM1SA/ULSF1rpJqKr2I9I2hUO79AWdoKSlpqMajhgNSgdOlVlN9kan4XdDaRMVOv3vT+W55yRyiXBVe477MpwBWp8NKd8LW2V9/nKypJjkb3FxRqgXnUtUUGwnzvTphoTUmvCKgfDZJvB5ixUjLmUCQp26FHnP1UZPzw=
Received: from ZR0P278CA0004.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:16::14)
 by DUZPR06MB8848.eurprd06.prod.outlook.com (2603:10a6:10:4d3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Fri, 27 Jun
 2025 12:18:35 +0000
Received: from DU6PEPF0000B620.eurprd02.prod.outlook.com
 (2603:10a6:910:16:cafe::ec) by ZR0P278CA0004.outlook.office365.com
 (2603:10a6:910:16::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.23 via Frontend Transport; Fri,
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
 15.20.8880.14 via Frontend Transport; Fri, 27 Jun 2025 12:18:34 +0000
Received: from [127.0.1.1] ([10.60.34.121]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Fri, 27 Jun 2025 14:18:31 +0200
From: Johannes Schneider <johannes.schneider@leica-geosystems.com>
Date: Fri, 27 Jun 2025 14:18:18 +0200
Subject: [PATCH meta-oe v4 2/6] signing.bbclass: add set|get|has_ca
 functions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250627-signing-set-ca-v4-2-b8fe358664c6@leica-geosystems.com>
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
X-MS-TrafficTypeDiagnostic: DU6PEPF0000B620:EE_|DUZPR06MB8848:EE_
X-MS-Office365-Filtering-Correlation-Id: 528e4914-e5d7-4354-986d-08ddb574bce8
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?OER1NWJESnZ4ZGduMEpOUC9YdVo2Zy9sYTNMNWtMaSt2RzNyanpZZ09aRTJz?=
 =?utf-8?B?MTNBeU9QOGVmL252anZQOG0vREw4b1E4NGJ4R1B0a3RKRDl3TEMxMXJpRlBa?=
 =?utf-8?B?YmpLRkVTVkdLeGlTa1g1UHpqY0UwNXdZdXV5YW5YMkxMV2dHZGYybGtjMytm?=
 =?utf-8?B?THZOUU1BRC9KT3BmU0ZuYW9YY3hNZ0hkd3ZaK1IzOGV6MEgzSm5IVlRwODN1?=
 =?utf-8?B?ekVHalQ3aVQ0VU5rTFVFTnNJSVVBb2JhZk5KTmRkRjNCY3ViQWZkTkxDTEs5?=
 =?utf-8?B?dHNQZUxCSUs0ZTBkWENRRElJTWJwVFdSNk1XMENaVjFMenpzbkJ3ZEdHNng0?=
 =?utf-8?B?THRjeVkvL3Q4aWVoRDhNbDRhZnE4VU9GT0x5SjgwQUd6YWRFbjF6V3BJVGJM?=
 =?utf-8?B?eFo2Ymw2V2FaQnBnT1dmbUVyNVNLNGE5aUxybDNRMzdMby9vZFVlZExDVjJt?=
 =?utf-8?B?bmV6Wld0WXJCdkZTRGtWbkxGZFJ1MW9VcC9NS3NFa1owVXlQeWFBUkswUlFC?=
 =?utf-8?B?MlpDeEZWblc5UTlRbXNQVStySG93d09WcTlKVFZsekY1WmI5ajduNnFBcWFk?=
 =?utf-8?B?NHk1WWVhRHhScDNqQXhIRW9rUGVrMlVXaXZJS0xVQXZnay9BNEtKWDJlaDFr?=
 =?utf-8?B?czhBQURJNGhGWU9JR3JNc1d2N3JveHJwWUJGVkV0VjBFY0tOWEV4dnhnWHd4?=
 =?utf-8?B?dFVSTDk3ZE55aG1FSUJnNVFGd3laak1XMWo1bnhNSEFKd1REZEg4RVRFWVN2?=
 =?utf-8?B?Q0xySWxwbDhzMUoyb29SUkE3ZzA3cGVUd21SSHlpOUxsYkdPR2E4V1Vsamth?=
 =?utf-8?B?OE9BVGdwRGtqUVZoZWNyRCtuYnRuYjFqMGZ5RTVsVkx2akhtZURxbWlteGNs?=
 =?utf-8?B?K3IwUXptd0VXZndCcEV3V2N1RjNLSjNpdWlLajJzSUlWSlAyL1V3U2E5R0Va?=
 =?utf-8?B?aUVVN0EyR0kwYmN4TVA1eGJWSHVDLzlPbXord2RwTlhWdDd4YkkxRGhqZTRP?=
 =?utf-8?B?eFBob0YzTkJJRGlLTUVpaGhtcm80dXRZMHJEUmtUem5WYmM3akZreXBZbGU3?=
 =?utf-8?B?Q05KZkxZZzVkb05LMDJFWUZncmMxNFlPWW1mY2JGYyt0L085L0doSlF6SFNy?=
 =?utf-8?B?dVNtS01vWkJWOVBNbWY5anJvUkxJbUorVFBFR203SWR3SE54SWFWenNCWU5V?=
 =?utf-8?B?ZGlwMUlhSUlaMmhUUjhNaWJZUzY1cXlQUDNnUGJpQWhzSHpWSlM4WGN0aERU?=
 =?utf-8?B?WEM5QWdDLzA3UW5USWJCdDdqN1RpYlVydXZ5OGtjRUJ4ektKZkJtcTVuNDlr?=
 =?utf-8?B?QVZsMmJtTzZRS2pCTXdzRTN1RW5rWW0vY2lsc056ZHJsNnhERmpUcWg5eDF2?=
 =?utf-8?B?MldHWDJIdHFEU2NNZ3h2SGJOWnJtUk1pdnVsR2NyZUgzeFRFNFJwZUM4Yi9n?=
 =?utf-8?B?ckcvQnh2SUtPcUFPY0ZoeWZhOTNrdU01Z1JvQmRJYnV4VzNUOUFCRWp1aFJ0?=
 =?utf-8?B?OUFoRFJvWVNwWFB1dGtJeDR4VFlGbk1nQmFYRklqU21VQUNuZDlvT1BCeUdv?=
 =?utf-8?B?R1dyVkpSelhtMENHVGJFV0pMNTBRdm9tZWpsSjVkQnBUNmhoU09XNFZvL016?=
 =?utf-8?B?OGllTC9aQ3pkTldLN1IyQkRDTTZmYjlVUys3NG1zVDdKTlUxL2ZXQXYreHVx?=
 =?utf-8?B?cFJodUhTeU4vUG5PeEJOQVNBaHdwU1M0WStrOTh6TlY5a3lUVDlCeEdBUU96?=
 =?utf-8?B?elg4eEhIK3Jqajd3SllaTldiSmNLSGFPNEN5SmpDdnZyQjhlc1VVb0Qva0tu?=
 =?utf-8?B?cGFlTTVVeVJvQkl6blFYN2VMcW14Sjh1a2x5MG9LT2ZGYnd5eS9TWmpXZk03?=
 =?utf-8?B?R3hYWE1VdnAzTCtkUDZ6Ym9IRFBqa3J4ZGpYNTJLY2syNXJld1VhZ1JVL2RL?=
 =?utf-8?B?MnJUTVJEdm9LUHVJRG8vakN2dWVHR2RPL1orYmE0aWdEdEVCZmkwRmIwcjBR?=
 =?utf-8?B?bit0VmI2dUJHcU8wTVB6SGNYVkd5T2s4UnBvdXBLd0dxYlFLRzlZK045SXhW?=
 =?utf-8?Q?cROzh1?=
X-Forefront-Antispam-Report: 
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2025 12:18:34.6037
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 528e4914-e5d7-4354-986d-08ddb574bce8
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000B620.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR06MB8848
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Jun 2025 12:18:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118148

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


