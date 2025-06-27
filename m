Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 337D7C7EE39
	for <webhook@archiver.kernel.org>; Fri, 27 Jun 2025 05:40:34 +0000 (UTC)
Received: from AS8PR03CU001.outbound.protection.outlook.com (AS8PR03CU001.outbound.protection.outlook.com [52.101.71.25])
 by mx.groups.io with SMTP id smtpd.web10.6809.1751002827340400205
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Jun 2025 22:40:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@leica-geosystems.com header.s=selector1 header.b=faEt4oTE;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 52.101.71.25, mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GAXDwk0BbI/nvHntfyv19EtfHyPxNsW3wLftLuYWnGqdVUS4BK/RXw5cYITlw062G6cnJv+vxe0XVhQRnpQW2hXOS5uIDyYl+lWxnTNUOvUXLpZE3JXRyqC+xoRj/crveg9R0/1S1AD7H6oE09x9SgUsYKksN+ZcnXNwY8ymvH9hscjlzVd6mqBoCcpqrn/3ipa/Z7AfBPjv+HS3gE4pvYVtqZ8GgXqdyI0gbA5Qf98x731M3E2eXXjgvlY+CClLXUYDMzHA+hW/k0lnz596h0efJCVYxGvLxryMfgk5+ULhaMtrmZnYRc32D1nhKLQ5280DAkLaF9vr9RPbFD2S+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Pz0KBrpt6XhOwefffJ9Z2noBIDY+W4HKY9YWrIQcFI=;
 b=aNJeC05GAMQqPEMOTwSi5lglLioYHrJvaKmZOVVPru9fNZx2JVClVRPvoilj3Gx8/k6ofwy96evIU1Y+6G//YR4TLLvpv4NVH1juC4/X+jH2L/qDf3xt0YsDkV+4nN7FTU0DPQ2q4IMNBkaNYa+P1sWb1QoV/OgJHV7wD77lO7zd8febgVJ4y8C7oYi4qVnDRiOlPXaRd8eOzRhI0nfNQxrHXEQa8R2OZSGnrzFUAqMmVoVJThIdXIaxAsJXeJgIE/aROZXetMRugx6SiUNRRy53BswfDhKrdTkPEsI6+Oo8k8b30TDysURqCHSx9MYkT7lHsqAHqizwpnatbInqFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Pz0KBrpt6XhOwefffJ9Z2noBIDY+W4HKY9YWrIQcFI=;
 b=faEt4oTEFjQT6XevH2sRuW9qR5+99ykMQeTcXLp/NZyut/aaPBaaYve1IZsYlYRuBNGTgLirbck9cyC8vUIue7LaLDIyMizmBu31HUczfhqX09np2LGzTsbjWLl7hyiNiXBzWuc0MSkTyfzqeOb/XpByuNXiKd2mBrB0uesNonc=
Received: from PR1P264CA0100.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:2cf::17)
 by GV4PR06MB10039.eurprd06.prod.outlook.com (2603:10a6:150:296::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.30; Fri, 27 Jun
 2025 05:40:21 +0000
Received: from AM4PEPF00025F95.EURPRD83.prod.outlook.com
 (2603:10a6:102:2cf:cafe::61) by PR1P264CA0100.outlook.office365.com
 (2603:10a6:102:2cf::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.21 via Frontend Transport; Fri,
 27 Jun 2025 05:40:21 +0000
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
Date: Fri, 27 Jun 2025 07:40:20 +0200
Subject: [PATCH meta-oe v3 6/6] signing.bbclass: remove
 signing_import_cert_chain_from_pem
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250627-signing-set-ca-v3-6-030812797c6a@leica-geosystems.com>
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
X-MS-TrafficTypeDiagnostic: AM4PEPF00025F95:EE_|GV4PR06MB10039:EE_
X-MS-Office365-Filtering-Correlation-Id: b2d7267b-ff62-4cd6-ce1f-08ddb53d1b16
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?MktTTFFRNDVSb1o0dUMxRExZTTBIcG9QREhNZ0NYMmlhQjVuTjFqWDZUQXla?=
 =?utf-8?B?NjRsYS9XS1cxY2JtVGU0YlFRcFdvTlFVaHE5alRWTGhaRFUzZ1pkTjcxM0hS?=
 =?utf-8?B?TW9LbnhaSDBLUFZFcmdwbHRKT1JnR0VmaE9sblMwWStJeXRrSGFMcjNydnJQ?=
 =?utf-8?B?dGI3OFFnSmlpZXBhRlN3WnJHdXJxTllCWjhoaG9QTU12TTFJejBCT0FDKzR3?=
 =?utf-8?B?Z1dLWEYxRzZyYWlUUmNYUjlrL21RaUp0dDZoaFk5Z1lvNEZBVTIwZzYvNWFQ?=
 =?utf-8?B?SEFCYWJwTGZPZ0RrYi9JN1kxdjZpZVRkUEZQY2NYekNmY0lUU0lLc1lwT1hn?=
 =?utf-8?B?VUdBbUxRYjZkZDNkNGlPeGlWU09PQXZwL0xXTmhvUkNoYlFjL1k0NmJNT0JX?=
 =?utf-8?B?WGJ2M3pYeDJCRGp0d3JXRVlzb2FVTzRJS1cySXQ1dTk4MS91Rzh3cjBZNG05?=
 =?utf-8?B?QitJcGZlYUMraTcrZkVkRkxDS1pNaEw2cWN4cDNjdXU0OFRVbkhqdnFsZUhL?=
 =?utf-8?B?RkxVYUdFRkFNTXBqSkdVMVF0Um0yYUpISGdlekw5VlAvanJqR3RDbEg3UE5W?=
 =?utf-8?B?WFprSncwbDV0NjNuQnNqb1lET00rWGF5VS91cG1IZHBWYlljcUgrZUp2aGdO?=
 =?utf-8?B?aEQxV0VwcS9CcllidWVYQ0tVMk1XbHRkeGIvak9hSTNwazZUaElaUHBqdFZh?=
 =?utf-8?B?VmhsckJiSEg5SGVJZHFOUVZUbVZGYkVFdXFqK1dJb3FOSXhFRmJZZ0M2SFNk?=
 =?utf-8?B?UWwvb004bWY2RGl0TlpYQTc5Skk0WEFDeXhlR0pGU2FQY1JHNTVQREtCanM0?=
 =?utf-8?B?cVp5L1dxWmErTk9mN05IUkRKcTdKdWZJKytyQ29GWWZ2YWZtdDNNMVUyem5C?=
 =?utf-8?B?czBKcDh6Zk1tVXlOaFJSVEJtMTBtR0RTWFFtbU1KREpEZDlxOVR4N0FiZHA5?=
 =?utf-8?B?ZTNCb0hMckMrdDZuUHc3TXl5WXlwbTg0YXBibG9HeWhpaDJsaElxVUkzQklB?=
 =?utf-8?B?eGJiS3BMWDJtYlVQSzZ0ZlNLODFDd1Q5cFR0bEgydFJKeVNWVGdZZ0prZnE3?=
 =?utf-8?B?UlNOTHpIcUxkY2N3Z1M4RjRnRlpYbzZpV20ydUh2dXhjY3JZc1ZUaWVtS3FV?=
 =?utf-8?B?SlVZZGZ5am0yUjlQL2VVb0Vtc2k5UzV5YXQrUWlzRjUyZXp6UG5WUTN5Z0xy?=
 =?utf-8?B?c05BL2x4ZDhHejJHcFluclc1WmlMZWxvYWs3bm0raTRMWEppakJXS0FvZUNK?=
 =?utf-8?B?eU9OL2Rka2JCT1o5c2NzYWtMSFBJeUVIVXErRHBOcExVZ0RyTC82SXZXNnFk?=
 =?utf-8?B?MU84K3BkSU1KQVFabkVUSnczczdzbXA0U1RsOVRybHdERkYxMGtSM0wrL2VH?=
 =?utf-8?B?bHI5WXdrbCsraTRxMHpnSitwNG1BeVU5ZE5ZU2xLVnZBQ3UwNW95dXZpTEVU?=
 =?utf-8?B?NFgrOS9yOFZmK2pBL2FxZnBCc1BPWUtKdlFNcFowMlhwWFhhY3VraEdyVTE0?=
 =?utf-8?B?Q2xWT1VHSElBaGVmc0c0UDdtQWpHUTdZRXdvb1cyc0ViZkFpRUtIbk8xK1oz?=
 =?utf-8?B?T0piWHpDOWV0YjhCVzYxcW5mUjFJSEdSN0xHRzBLckoydUtwWG1LOFlYTE53?=
 =?utf-8?B?Z2IyTy9qa1l4OHo2UGVKOVFYZWZzTG81Vkh0a0Y5SlJNbG5hcVRndWs4VXEy?=
 =?utf-8?B?NWFwVC9QS3R6RFBWQjFycTJRRXBERHp3VzI2M0sxWklSQkFEUWtZWGRVUmh1?=
 =?utf-8?B?SkFBR255STNqeVlZaGlmd3Fkcy8ra003eVVLdEdQenVhbjY0Nk04WGhta1hl?=
 =?utf-8?B?eGw0NXlQcjExVTRKTlJHUGFKUWpjV3Jkc0xUbnRtYXZnZTN4YzhJdzhoeSt4?=
 =?utf-8?B?OUdENlA1YmQzOTRScm5oNjZqOG5lbTVTQlQxUnBVd3pNeUdiNWZIRFlVVzV2?=
 =?utf-8?B?WHY2WDhUK25VbmlYbzQyOWJmZEw2OGxuUmZydEJ5K2ZKbGVxYmVoaFZJNXZm?=
 =?utf-8?B?dzFmaFk3cTFiS3BTTGFnM3VjQ202TTRhdUtzZGowaXZQc0FOSklLRzlKYVlW?=
 =?utf-8?Q?g6ARzH?=
X-Forefront-Antispam-Report: 
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2025 05:40:20.8248
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b2d7267b-ff62-4cd6-ce1f-08ddb53d1b16
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00025F95.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR06MB10039
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Jun 2025 05:40:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118137

With the now available set|get|has_ca functions to establish a CA link
between roles during their import, the
signing_import_cert_chain_from_pem can now be removed.  As it had the
shortcoming of dynamically creating roles, which are harder to handle
then the manually/specifically setup CA roles.

This effectively reverts:
a825b853634 signing.bbclass: add certificate ca-chain handling

Reviewed-by: Jan Luebbe <jlu@pengutronix.de>
Signed-off-by: Johannes Schneider <johannes.schneider@leica-geosystems.com>
---
 meta-oe/classes/signing.bbclass | 29 -----------------------------
 1 file changed, 29 deletions(-)

diff --git meta-oe/classes/signing.bbclass meta-oe/classes/signing.bbclass
index 6fde22bf22..5068360ca7 100644
--- meta-oe/classes/signing.bbclass
+++ meta-oe/classes/signing.bbclass
@@ -231,35 +231,6 @@ signing_get_root_cert() {
     echo "${cert_name}"
 }
 
-# signing_import_cert_chain_from_pem <role> <pem>
-#
-# Import a certificate *chain* from a PEM file to a role.
-# (e.g. multiple ones concatenated in one file)
-#
-# Due to limitations in the toolchain:
-#   signing class -> softhsm -> 'extract-cert'
-# the input certificate is split into a sequentially numbered list of roles,
-# starting at <role>_1
-#
-# (The limitations are the conversion step from x509 to a plain .der, and
-# extract-cert expecting a x509 and then producing only plain .der again)
-signing_import_cert_chain_from_pem() {
-    local role="${1}"
-    local pem="${2}"
-    local i=1
-
-    cat "${pem}" | \
-        while openssl x509 -inform pem -outform der -out ${B}/temp_${i}.der; do
-            signing_import_define_role "${role}_${i}"
-            signing_pkcs11_tool --type cert \
-                                --write-object  ${B}/temp_${i}.der \
-                                --label "${role}_${i}"
-            rm ${B}/temp_${i}.der
-            echo "imported ${pem} under role: ${role}_${i}"
-            i=$(awk "BEGIN {print $i+1}")
-        done
-}
-
 # signing_import_cert_from_pem <cert_name> <pem>
 #
 # Import a certificate from PEM file to a cert_name.

-- 
2.43.0


