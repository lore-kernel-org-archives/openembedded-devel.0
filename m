Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F98EC7EE31
	for <webhook@archiver.kernel.org>; Fri, 27 Jun 2025 05:40:24 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.52])
 by mx.groups.io with SMTP id smtpd.web10.6807.1751002823170584814
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Jun 2025 22:40:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@leica-geosystems.com header.s=selector1 header.b=hmqbwlYk;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 52.101.69.52, mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dS9eajhLesaVNV7FDCGYcb/afalYkabVvLrQSoZBZ+2NSfaCQNOwOoxTovVzvYp2jD/nrg2o8EkMwztwiDU0tCcyb9FjMBYGGfIc3arWpSbv79Z0r/oWFP3E1M+GhF5/8WoSfVEDngNFkF81GOeSLgj8yiKK+ykUP0kEVvl2IUsFpt+WzSVDSs/LxrJXCE7z4Ffvdx+IsUw7dOEMNk6LLBPE7ba1ysV697I5zqU7bmiihYuPbVCuCZQ8LbdgGJh3S/GVC6i1cvSA7kO5Rnaa67DKCIvEBIWj9H0oXUHOQEe+RXmptOjQ1Dg1d6Gkl/oSRZhmtE0ulU/yukfcDJL7UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=McXBW71QelBenXG7niF8IzZULndSUTMtfH22RlLb9ec=;
 b=a++TTp8qTBZaMWDE4f+njxQmcM8mYekHE/BV8bYAmm50mLWpOks13AJuZb3ix2U/Oy2WEXmZw0wl700W+9TphtsXBswdqJcDzNuzbbPMCsy01yKmzqpzfi7GyVULB26uV5+LFKXb6E6QWnEeF2mjWyY1P5uFXoK1s8b8glJdBYoehHSu96vXLGf+dob2UGCl3+kO0j1QPhEaAB11RA0yAbL4YfmWzPUwKzrWiPp+9CpDYCxmJ9FEbz4qAn2zpR6xgPvNoc6lplNkBUMx6q8RjJs47qaYXivsRJlo4wBiYtPD6TD5GoCx64e4xoJ8+v9eEKfVmiZiqfcUi68uRVu4iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=McXBW71QelBenXG7niF8IzZULndSUTMtfH22RlLb9ec=;
 b=hmqbwlYkRP9ZjIZgq6F5UN1XNw6ufQLg/HEG6eDv49JHLopHTYUdvkNPr2t9PcUvYtT1OYkjrvnoVtoFSgdGo2PY961zibMhBvVvZ0Yt2GCnS1Ra3OFkRQlQKB/gbNpW3p64mlCyTtYbmU4Ui5jTTB6Jh+suUmQtaiOwFmKOl5Y=
Received: from PR1P264CA0098.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:2cf::7)
 by PAWPR06MB8932.eurprd06.prod.outlook.com (2603:10a6:102:38e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.27; Fri, 27 Jun
 2025 05:40:20 +0000
Received: from AM4PEPF00025F95.EURPRD83.prod.outlook.com
 (2603:10a6:102:2cf:cafe::c0) by PR1P264CA0098.outlook.office365.com
 (2603:10a6:102:2cf::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.23 via Frontend Transport; Fri,
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
Date: Fri, 27 Jun 2025 07:40:18 +0200
Subject: [PATCH meta-oe v3 4/6] signing.bbclass: add
 signing_get_intermediate_certs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250627-signing-set-ca-v3-4-030812797c6a@leica-geosystems.com>
References: <20250627-signing-set-ca-v3-0-030812797c6a@leica-geosystems.com>
In-Reply-To: <20250627-signing-set-ca-v3-0-030812797c6a@leica-geosystems.com>
To: jlu@pengutronix.de
Cc: bsp-development.geo@leica-geosystems.com, 
 openembedded-devel@lists.openembedded.org, raj.khem@gmail.com, 
 Johannes Schneider <johannes.schneider@leica-geosystems.com>
X-Mailer: b4 0.13.0
X-OriginalArrivalTime: 27 Jun 2025 05:40:17.0578 (UTC) FILETIME=[F6AB28A0:01DBE725]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00025F95:EE_|PAWPR06MB8932:EE_
X-MS-Office365-Filtering-Correlation-Id: a45b28ce-4400-45c0-45a0-08ddb53d1acb
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?SUp1YXVSY25YUmxlZkRkTXd0UVF4Q3JRT3RGa2FOcmV4RVRtZmk5dTJwUSs1?=
 =?utf-8?B?MkVPeUxDVXVkK1p2NWNUUDFkVGxpM3VsTndaVTlLMm5zeFg5WGgwR2c3VzlJ?=
 =?utf-8?B?eUp5c0dxbWpFUVVPem1GRjNPL3l6aElldHBpRTR5U212RHh1MDBXWExUMjBU?=
 =?utf-8?B?Y2VyTlZjNGV5eHBkQndkem53US85eWlnbWlSMW9lN1owanRuZWNDMVp0YUtC?=
 =?utf-8?B?RHFPTUtVbHVBb0M5b1FMUll0bWVDNGo5RzZHWHF4VCtEREhlekxCdXAvb3kr?=
 =?utf-8?B?cUVaYk9rTTNyd215UnpOWEdRVzJzTFN2ZDVESmJSL2I1eGYrblR1UVp5Y2FX?=
 =?utf-8?B?OGllM0JaODhOeW0xeFRvWWh1T1kwcjRJRUVhWlQybWdXWkc2Mis2UFhkMnA3?=
 =?utf-8?B?azFuK3g0VGtHcCtWc01yNnRwcnRCRTBUUjl3aGhPVnkrdDJyMjVwS1RHMlBX?=
 =?utf-8?B?VkhEQUd2QXhmN2h2VW1UU3RlcTl0Q1NWZS9UR3hnbXhPTS9CalprTW1GL1Ro?=
 =?utf-8?B?OThPTVczOHp2cG1MaW5ObDdlRVR2dHBpZ2hDQ2RKV0VQc1BmakovOXl1VmVP?=
 =?utf-8?B?VTVmeVlRZll4MUdFTSsrZG5tU3R3SFBjRW5XUEdmcG5qbERzL3VNVEcxc3E0?=
 =?utf-8?B?Qmk2NjhkK1J3ai9WYzhvQ0xGRitaZkFjVldKYjFUUm40cmFJNXRaTENNMWRu?=
 =?utf-8?B?eFd3YVYvODFpWDFOeGJsNWNJWWFwbWNnbGVNY2RWbUR3SG9xTWlMTjkzSGVH?=
 =?utf-8?B?YnJ5bzdBSG04bjJ4bml3WkdhUzU1amlWMWtQVm41c0VITHduK2xIOTVuaGxo?=
 =?utf-8?B?WHVuQjhNTFNuUDlQVU4zbk5VRlhKNitKUGoyOU43ek91RmcrTURxMW1iUVlM?=
 =?utf-8?B?MzkvcVlHTkhSWi9DL1UyYlIzc0xkRDJ2WmRPMmR3YTFFQXhwbjhGUXdzdmpH?=
 =?utf-8?B?cEFXUVpLUm4rUk9HVjBOVTNVaVpJZ1ZNMGt3Ti9VV1VIQTByQnVRelkreWhv?=
 =?utf-8?B?RWhwT1MveHNoY3ZwSm9kNDNhMlZ1K2VZUThkeS9ZOWRLM0N0dko4T20wZ0xW?=
 =?utf-8?B?SGtjNS8zWXM3YVJVZVhaeXJwM09zUlBzOEVxRDdVQWpGaXVKVi9WaG1RS25U?=
 =?utf-8?B?dTkrb3F6TDB5OWs5alBZUmpuK002UEFuYSthV05OK3pEbGtVdkNsVkc3Mm1W?=
 =?utf-8?B?UUJyUGRUWUlsbmtPSnV5T1hWbkE3R00rZ1ZxYmxrYWdMbmIxVmM1VENSSGJi?=
 =?utf-8?B?OFozVkVuL0lTaU04RGhERFplRk5hVUZ6a1NDUUlSbUw4azZCZWYwOXhvOC9s?=
 =?utf-8?B?eEdOdmwrUzlqWmsxaStFVy8xSHdUSlQ0UWJVZXNLalhZUlkwQ1FLWm5FTjUv?=
 =?utf-8?B?blZ0cjZhTTZDQXJaWXd0K09vTS8yUHBiVVZrdDBwM1FPcHZ5SkovbUR1WE12?=
 =?utf-8?B?cm8wQlJIbHVUNGl1bTJadHQ4NTc1Rjk1OUdyMGs5MENJV2hubG8raGR6Vm1p?=
 =?utf-8?B?UE5QWlpFcVBDbE11eDNpUXJIaHBrczd6aUFCaEt2V2VoVjBLTmd0MmpSOE41?=
 =?utf-8?B?MFVvTW8yV2w1c3Z2RkZyYkNkSFErd0pOVlp6Zmpvb2NyU1o3VE93QXM5M3hx?=
 =?utf-8?B?NnBhOFdTRThyWFFHQjdQc1c5NFl6TzhiMEdsaXpZcitGcmdqQ01kd05USWJl?=
 =?utf-8?B?Z0xYcWt0K1BXRElxQ0svb1k3S24yNXkzNHA1dkovcHQ0WTA0Y3N6Wk4zdTNW?=
 =?utf-8?B?QStSQnZDMi83TjZoWHd0bjhENzI4SEdCVkhEcWQ1cFN2ZUx2b2tXQWozQ0pY?=
 =?utf-8?B?RXJzQzI0WWlaK3QvNmYvQlFtSHJueUdvNWZsUGhFMi9PdzYxRUg5akRyWSs3?=
 =?utf-8?B?WDV0cXhta2JaWVIwaTdIb2JBU2FvNkRqMStaalVpK0gyYnZ4MWlsckpFWDU1?=
 =?utf-8?B?bVo4WW1ZaGpXd05leUZGMDRvSzlqT2szREpSV212MkVxc3BrNlBUc0RuYm82?=
 =?utf-8?B?YmJHUXFUNkNaREludHU0UHJ2REdUdDg0aFJBTWxwK1JyZWs1OEJXMEhPb0dE?=
 =?utf-8?Q?yKjIiB?=
X-Forefront-Antispam-Report: 
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2025 05:40:20.3298
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a45b28ce-4400-45c0-45a0-08ddb53d1acb
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00025F95.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR06MB8932
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Jun 2025 05:40:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118132

Add a method that returns a list of intermediary CA roles.

When using a complex PKI structure with for example "openssl cms",
these roles can then be iterated over adding in turn a '-certificate'.
Pseudo-code example:
  for intermediate in $(signing_get_intermediate_certs 'FooBaa'); do
     signing_extract_cert_pem $intermediate $intermediate.pem
     CMD+=" --certificate=$intermediate.pem"
  done

The typical use-case would be adding these intermediate certificates
to the CMS structure so that the relying party can build the chain
from the signing leaf certificate to the locally stored trusted CA
certificate.

Reviewed-by: Jan Luebbe <jlu@pengutronix.de>
Signed-off-by: Johannes Schneider <johannes.schneider@leica-geosystems.com>
---
 meta-oe/classes/signing.bbclass | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git meta-oe/classes/signing.bbclass meta-oe/classes/signing.bbclass
index 2a94f5f5b3..248c6400ed 100644
--- meta-oe/classes/signing.bbclass
+++ meta-oe/classes/signing.bbclass
@@ -194,6 +194,27 @@ signing_has_ca() {
     return $?
 }
 
+# signing_get_intermediate_certs <cert_name>
+#
+# return a list of role/name intermediary CA certificates for a given
+# <cert_name> by walking the chain setup with signing_import_set_ca.
+#
+# The returned list will not include the the root CA, and can
+# potentially be empty.
+#
+# To be used with SoftHSM.
+signing_get_intermediate_certs() {
+    local cert_name="${1}"
+    local intermediary=""
+    while signing_has_ca "${cert_name}"; do
+        cert_name="$(signing_get_ca ${cert_name})"
+        if signing_has_ca "${cert_name}"; then
+            intermediary="${intermediary} ${cert_name}"
+        fi
+    done
+    echo "${intermediary}"
+}
+
 # signing_get_root_cert <cert_name>
 #
 # return the role/name of the CA root certificate for a given

-- 
2.43.0


