Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E57ACC7EE3A
	for <webhook@archiver.kernel.org>; Fri, 27 Jun 2025 12:18:46 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.4])
 by mx.groups.io with SMTP id smtpd.web11.12142.1751026719533623902
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Jun 2025 05:18:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@leica-geosystems.com header.s=selector1 header.b=kiuxV+Fz;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 52.101.84.4, mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NeThv+zeN0TGbFs/7Q1nxJreeljhPEBChIRNJVPj5W0Uc/BQ0kU8vYBctPWJqT2PLv3xAKKhT10o75hwO4yLfOcJBd4qcu4WpXt5pzpB5Tgkte4Yd4vpbOUOLVui+DsNDNMRo1unWzma1lcy+QKuUKfOBj5hWoV4YHK+hwA59NeV2/4owFFBxYEGzAp48ISt+bZEQV0cH5Fvvc6y3x5VV750gHg2+9GFfWhn2u99zKA3d6irjtpiZykrTJNs3BNxZzkRyIzGR1aIwbcO/MNPdfZKGDEPXxJjEogvv0Tx43pn+lDMxrfAGQ3xvUrOxfEuztqT6kKgd+Pu2kBNP01H+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=McXBW71QelBenXG7niF8IzZULndSUTMtfH22RlLb9ec=;
 b=RlfLOf0CjjVnkBElBHU26IqsppIIGM3ZkuKoVMa9/2WJHwOy+OgXfb3tqyQMS7OfkCO/Vxd7/tiegn8IpCKb9iQsQTFBe0uVY/QOtRJK6e9bcVHqW9mc8tFuGoTsZcMXh+96DUd8y3TaUuGsIkDxB7zd7mUAL/VU8lTXj2AWlBMaiVDi/F57vs0ml+oStOpsOdmwY0A3wAeTygbHG1xXoXvf4PoLDXqz30BOyVEdEhzQaus35RAwk3Jr4nLuGOUYDqY31mqRsDkbMmDGht1ABhm43Cum2WZ2gW2C+B4jfyC1w9A+cvBgV5lIeThvE7yypjqvxvuWikAFY8B15ab6wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=McXBW71QelBenXG7niF8IzZULndSUTMtfH22RlLb9ec=;
 b=kiuxV+FzY5wUORagkDAdaxjKTckJGkzSsz8pVMxQxMz9Sb9lKd9rFLGp107+6PxIREieMpQ9YPxRkOzQxH37dfXGRf2aIrtOcaM1Y3GmgX1vWel30oJtSG2utzEynooKiatmN3uauO82cuoggpARVFPnkWTzEZEfc+M8UrViJQ0=
Received: from ZR0P278CA0001.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:16::11)
 by AM7PR06MB6673.eurprd06.prod.outlook.com (2603:10a6:20b:1ad::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.27; Fri, 27 Jun
 2025 12:18:36 +0000
Received: from DU6PEPF0000B620.eurprd02.prod.outlook.com
 (2603:10a6:910:16:cafe::b1) by ZR0P278CA0001.outlook.office365.com
 (2603:10a6:910:16::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.23 via Frontend Transport; Fri,
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
Date: Fri, 27 Jun 2025 14:18:20 +0200
Subject: [PATCH meta-oe v4 4/6] signing.bbclass: add
 signing_get_intermediate_certs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250627-signing-set-ca-v4-4-b8fe358664c6@leica-geosystems.com>
References: <20250627-signing-set-ca-v4-0-b8fe358664c6@leica-geosystems.com>
In-Reply-To: <20250627-signing-set-ca-v4-0-b8fe358664c6@leica-geosystems.com>
To: jlu@pengutronix.de
Cc: bsp-development.geo@leica-geosystems.com, 
 openembedded-devel@lists.openembedded.org, raj.khem@gmail.com, 
 Johannes Schneider <johannes.schneider@leica-geosystems.com>
X-Mailer: b4 0.13.0
X-OriginalArrivalTime: 27 Jun 2025 12:18:31.0458 (UTC) FILETIME=[9887E820:01DBE75D]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000B620:EE_|AM7PR06MB6673:EE_
X-MS-Office365-Filtering-Correlation-Id: ab104e62-53ba-4b06-f3ed-08ddb574bdc3
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Y3dUOG5HaytwYnBjKzM2T3ZEdGZ3c2U0QWpjb05RMU9iMm1RRDVLK3R2NkNu?=
 =?utf-8?B?SW9KQjg5SCtlR0ZGUVpoaGZTL1NzTXJGbnRwTFFvbmpSNmpUTlFrYnFNSVBU?=
 =?utf-8?B?OWs1YzNGblI2UmRTRU9RbFBwcHNLU1RvK3IvbDRmaXBuN0NSSFVtVng0RWRF?=
 =?utf-8?B?b3NwMENwdlRzaEtYcmxkSVNnU1pBazEwY0pSL2FEdTNrLzg0aE9HcXhtOXRB?=
 =?utf-8?B?MmkxNnU4ZFlSaUFMZmJWNjNCVlJSdkFrWjNBVXEzenlqaU93Q0pPaE1xbkhx?=
 =?utf-8?B?KzZJNGoxNk9uTk1HMDl0V3h0RTBrQ3BCTytGaUtGR1hteThKWGJNcmlTeExo?=
 =?utf-8?B?cXdReG9OVkpOdms0OGRaaTYzditkTlFsVVV3LzQzQjlvUmhaQnBGd0V5Mi92?=
 =?utf-8?B?MU5idWtKVmZXeHNTUjhFckw0U0JCd3JxQnRjTGxPeXNYUjFTZ2tJNnNIV2Iy?=
 =?utf-8?B?SmhwNkJOdHo1ZTRUSEE3OUVrQ1RINU05em1reTJDR1AzUDZ3L2N0NERGWHhJ?=
 =?utf-8?B?NzNPNDEySGQvM3I5aVI1dUxDelFKMUFNMlN6Wk9qejRSY29FMnBGYmdwSlFS?=
 =?utf-8?B?M2RaUnNRU3MxRjQxa1hZeDUwVDE3Zm51K3pTbkhaWXl6cWRjMWI0S0lNRVgw?=
 =?utf-8?B?ZVBKQnl0NjN5eUEzbXFRa3ZHbzU2VHBLaUpwaURZRVlRbjV5WUZ6WXdlRTdm?=
 =?utf-8?B?QXRXQ2FBQ1JrS0pLb0p5YzlWUmNMaU9pK3QzRWIwMDQzRVpGZlVyRGVGcEU1?=
 =?utf-8?B?YXEvd1BtMk04N2k5aWJvUzFDbFpqclhSUGJXOEhvRk14Y2pkMzZwK0dJb2ww?=
 =?utf-8?B?b29YaGFUQnBSN2dGNHV2Z1BXRTJQTExmYmVSYWY5c2pWOUVzYU9EdERXTWcz?=
 =?utf-8?B?Zm9La1h4UTFzVktZWEZ4Y3o1QUtTOWEzdlN2czhNQkZFak9LbHRnQ081dmV2?=
 =?utf-8?B?RjVSY1RleDlZMHExcGlKdUhZZnV5UXlUUU5OVm9LOVlIWFVvbTh1eElnY3hZ?=
 =?utf-8?B?VlAzYjhEZXhIRTR5cGxacUxFbW1oZEFLSVkxV0toSHI1Umh3bU53czlGb1M1?=
 =?utf-8?B?eHlCbzBuUGp4RjV4dDlYVGJIcjUvL005UjBmLytwRFNDWW9RU2JrSlh1R3RM?=
 =?utf-8?B?SXYya3FxUXVTRGpQQ2syQmRiUzZhNlNpVktkK2JYRi96NVhoOXZiUnFLTmF2?=
 =?utf-8?B?aFZCa0g3SWFjWWgxajF2QWRoVUoxL2RhYlJzZVAvOE5VWkJ2ZWFCdjQ1NXM5?=
 =?utf-8?B?U0tTSThDNXBqKzV2Uld1VTd1QVMzYWE0a2NONlloVTFuZ3I4dVVGVUVxUEdI?=
 =?utf-8?B?WXJHVWp0bVd3OXRROWkyTHZBVFdMZTlGRml1bW1mMFlSd0kvVExwSEFRcFcv?=
 =?utf-8?B?Z3M4MzhpcGV5aXBLZisxM0tEOUlEQUdtaWZqMDRjUklCUkNENVZnRkY3WWR0?=
 =?utf-8?B?ZlpkL1F4OEllWGg4NVVXV3BjaGM5R1B0VVZDazR4M25PdEx3aUJwdDQva21L?=
 =?utf-8?B?NzdDNDhuQWtrbHlSZThINDA0b2Z0ekdpK1BaSWhtMlRnRy9tSGNBc2EyckdQ?=
 =?utf-8?B?YUxMd0gzL3cyME9ESW1aY2hVcW0yN2tSRFI4OVk5ZzBqN0xmRGhOZmpzeXZ2?=
 =?utf-8?B?ME0wS3YvU3kzYmo5VkgyenZPdFcvdUVNN0RPc1NNdm0rYW1STzVWNVI3L2ty?=
 =?utf-8?B?RzluZk81bEswMXBBQ05ETFZXVU96VXFBYzZFOTlNU1FkY3BodWMxazBLMjVh?=
 =?utf-8?B?bmN4VzdCdGVGb0pjd0pSK1Q5VXRmWkh5b0tobGlGQTlqc0pHc1RuLzlqZGgy?=
 =?utf-8?B?WGpUM3pBK1NRc3NBaW1EYjJ6a3FIdEZwNnJ0T2lRTVA2V2s2SVM1MHBEeVJM?=
 =?utf-8?B?M0FCbmlRcitpV2NtaG43d1RqVEhIQ0NtcnNxN1hydC9mcHMyTXFQUlV0MkpD?=
 =?utf-8?B?V1V4QWZidVhRSGxGcjVXSFBNYXMzYTAyT1RUSVJ6ZXp5Ly9QSENXeTV2aTdy?=
 =?utf-8?B?K29MdXQ2ZEtjNEhpbHBtUDRSL0JiMXFEcm9OMUJBU29OWlY1TWlEakw1UktP?=
 =?utf-8?Q?3KNT2X?=
X-Forefront-Antispam-Report: 
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2025 12:18:36.0413
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ab104e62-53ba-4b06-f3ed-08ddb574bdc3
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000B620.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR06MB6673
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Jun 2025 12:18:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118152

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


