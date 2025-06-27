Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF4FBC83010
	for <webhook@archiver.kernel.org>; Fri, 27 Jun 2025 12:18:46 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.12])
 by mx.groups.io with SMTP id smtpd.web10.12238.1751026720819086532
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Jun 2025 05:18:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@leica-geosystems.com header.s=selector1 header.b=BadEngxo;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 52.101.65.12, mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P2TrzVqPgpU3u73xjngDalhhvhsBkvojjNCuCfH1a6mh9yvkZzHxUUla0GDrWFybiNRret8KsN+YnUQGaYOQ5p/3GLb57j4ZSPQhUd4vVG9hmVl8yRr/gyatD+9ogxVE2R9FnRhX8jGWd3wd8IlhDLYcq9fKE5t4fmWQ9vXWaZHqif4S8Wvem0BgEgqR/7pEUu7zPzxd6nIzRMlpQ1rm8hWYCeSlO7Wg/QJOpGR2NnZjQG3IXUV3FUcY/PYymOGn1OMutAGATlVXtu0ya0kcZRJhln042A6pq85PaKghkeRwJWkPhOvbvFZY0pUUBZNaaPgwXCmIp3d2zD07ClPsFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Pz0KBrpt6XhOwefffJ9Z2noBIDY+W4HKY9YWrIQcFI=;
 b=vAcuSqBRyUsk5dEbAPzueQWe76m9ghfhJxJPJ/DJgeMIpltLFXNT+Qymj3hHkFgDCtdsnJSA6ItytFfNWLFQCfotAc7Orfb8ySQB1M7dhz30DzoaScZsGYgKVD96/usJnrAFxdEAsHrdZSjyJtCanKVmV8jURR4IsufhS/OuWls4O457sVm6hI+VaZxwdPeAQQY3NmJRDLcdUwe6jYPvkwCNvgz3/PSjL7sw0+VrEeeiovDP3qaHGIu2jkOISCKjQuJAPaz7ZKisXlnorLoS70b/kwoiUiJgOjZBkMKdXj0fwMQ47iJZY/1SxylLYi0uZhcvq6x5S55SGsExG3C90Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Pz0KBrpt6XhOwefffJ9Z2noBIDY+W4HKY9YWrIQcFI=;
 b=BadEngxogDWcR8mGGPxtkW1zEiF2V9sQWvouMLq4jnKj+B+lfTP4hedHRMelAaNHNJLyW6CgiTgK53G7It5SFP2YWf7jc9JoJ7dM1KV/X3J+WVLGNnihKkqSmzVB1k9GTjf2eJAXqhAi0zqKOfrfQKIlnMhuHiOTwDU/bUNi+is=
Received: from ZR0P278CA0006.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:16::16)
 by AM9PR06MB7284.eurprd06.prod.outlook.com (2603:10a6:20b:2d0::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.16; Fri, 27 Jun
 2025 12:18:37 +0000
Received: from DU6PEPF0000B620.eurprd02.prod.outlook.com
 (2603:10a6:910:16:cafe::4c) by ZR0P278CA0006.outlook.office365.com
 (2603:10a6:910:16::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.16 via Frontend Transport; Fri,
 27 Jun 2025 12:18:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.94 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.94; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.94) by
 DU6PEPF0000B620.mail.protection.outlook.com (10.167.8.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8880.14 via Frontend Transport; Fri, 27 Jun 2025 12:18:37 +0000
Received: from [127.0.1.1] ([10.60.34.121]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Fri, 27 Jun 2025 14:18:31 +0200
From: Johannes Schneider <johannes.schneider@leica-geosystems.com>
Date: Fri, 27 Jun 2025 14:18:22 +0200
Subject: [PATCH meta-oe v4 6/6] signing.bbclass: remove
 signing_import_cert_chain_from_pem
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250627-signing-set-ca-v4-6-b8fe358664c6@leica-geosystems.com>
References: <20250627-signing-set-ca-v4-0-b8fe358664c6@leica-geosystems.com>
In-Reply-To: <20250627-signing-set-ca-v4-0-b8fe358664c6@leica-geosystems.com>
To: jlu@pengutronix.de
Cc: bsp-development.geo@leica-geosystems.com, 
 openembedded-devel@lists.openembedded.org, raj.khem@gmail.com, 
 Johannes Schneider <johannes.schneider@leica-geosystems.com>
X-Mailer: b4 0.13.0
X-OriginalArrivalTime: 27 Jun 2025 12:18:31.0505 (UTC) FILETIME=[988F1410:01DBE75D]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000B620:EE_|AM9PR06MB7284:EE_
X-MS-Office365-Filtering-Correlation-Id: 7cbb921a-1429-4c11-fef3-08ddb574be71
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?eFpsWVhvbE4xWVVDVW10RlZNN3hqaVE4THpDazI2NUNnS3FBWUp5VkV2MXhG?=
 =?utf-8?B?WUVBWEs4S1ZIRk9pbEpKL3pvTlQ3YVd2aWJEUGtWQ3d2RjNpbzVWaUFjYkp5?=
 =?utf-8?B?bnlIa3JXWXJNWkFPSkFhRzV1Zk5DRUNMckR2MjlGTFJ1dlJMK3VMU0dGS2xO?=
 =?utf-8?B?cEsxc1VERG9SUlkwOU1QSFhpUmpmWjNNMEFpU0Z2N1VDam5vVjJFelJpWmJH?=
 =?utf-8?B?YnluZDYvTW83MDBOZmNzSWorQ2F1QnBmMnJFVWpmcURLcWQyTlRrQVd6NFYw?=
 =?utf-8?B?QzF6ZU0wdVI0M3Y4Z2ZXb2tpZG84M1NZZGtHd2NFRnUrelREU2l1NXkzWVRR?=
 =?utf-8?B?N2hLWFAxd1ZleENwcVBkWTBHdUMyWUdwN0p6UllNRDI3VmRkUjdKUktMbnB5?=
 =?utf-8?B?bko3a0xQa3JFSWhZS0pCQlBnZEpOaldodXU0TU1JU1JuVEhXQ0ZxK3lDcllh?=
 =?utf-8?B?U1E3U2gvNm1aRHFaSlkvQldIZzJpNGxMUzJLUEVtU2lFck5naFd2YUxWM3Rr?=
 =?utf-8?B?OEt1TCtRbVpDU1VjcXNSWGg0UytPdG9wTy9rNEF3UHRZZHdvaG5Bblh5K2Vz?=
 =?utf-8?B?eVI3aHI1VmV6NGpWSHo0L2hJbzhuaWtnWXNZSDBScEMyOXZwQXVzQ0tQOFND?=
 =?utf-8?B?YVRGdjhzSThOQW5oM0p6Y043VzhJV3g5cDJNQmJZYitjUTNGWjFJOExuVlNQ?=
 =?utf-8?B?TnBiendmZzRjejFxN3R2Q0pGUlI0VVhudEdYSFdFamQ4WGc3WXVKVDlKdlpl?=
 =?utf-8?B?aHZvQ3djWURKaTNuclJtVkYrOXMyUnpUbE1LakUvcStKREpTUVR2dk4xRS9y?=
 =?utf-8?B?VmlqYWtmMkw5Y3lVcndpditqcUwxYlptamR3UTU1SDZGUDNlYytmK0YrUjV1?=
 =?utf-8?B?NFllTUxFcWUwUi9aeGx4UGhUZnA2V2M2YkpzaHE5cFRhMkFBdzA0WHFHRk5S?=
 =?utf-8?B?OWNiVDN3TE9oWDNUbG1SZmRtRVdLNExmb2E1cjRqWldZMnZ3dkVRaXltZzZG?=
 =?utf-8?B?aFhmTjhBMy85RDhkZEx4RVlzb1NuZllSelo4akkzMmdxR3ZwTkpIN1NHb3Q3?=
 =?utf-8?B?RC95Ym5pMHhydmJoRGtiR3VSOTZUMjRnTXhEdzJsNStGMlMzdUIyR0xNbEgv?=
 =?utf-8?B?UEdySHlwcU1reFRISElCcHVDcWNoait5UHZCY0w0Z2Q3WCtpM0hqZ3pzbFpr?=
 =?utf-8?B?T0VINXNuNkxFb1lYMGpGRFEwU3VYY0tLUTJSd2RiZzkzZ2hyY3Q2NndnUzg1?=
 =?utf-8?B?N1VYOTk0cDcwQUhOVkplT3o4MHFqK0VvV2EyOTRrVnVMQ3VLcmhJejNJWXpF?=
 =?utf-8?B?WjNnZ1ZXa09pYlVNZFlUTVltSmpxaDJYaXdMazRsWldhUGVrdmFvbXJock1q?=
 =?utf-8?B?U0VFY1A3THp4TlIwaDU1UlhQVGNSQTBhUWw4WmhLYkIxOG81UExYdjlabDg1?=
 =?utf-8?B?YjlDT05qRThyOVlmMUl4dTViVVBINFpHeW4xMnpZb1dqL21hQkQ3RXRZOVQ0?=
 =?utf-8?B?aU5TbWlJUU1ySU5Qa25xNnJJUGdkSzdUNHlkMjVIOW5aZU16V2piczdoTGND?=
 =?utf-8?B?bUZlSnczK0lCSTh4UXN1TWhkZmZhbXVXUHo2SWNDMlBORlVjNEdUZElrTjJz?=
 =?utf-8?B?Vm12TXVDYmdXOGlOSzRhZk1PbUR4MmpBVmV2S2RBWGg3ZDhwYzFlTnNHV05k?=
 =?utf-8?B?YUp3QVQ5MkNFeWxEa1NaYUVkalZhTW8xTElDcWJQVHlhN3dNWC9QWGg5a1c5?=
 =?utf-8?B?YzBJQVpjZWRidUpzKzA2VWczbjliajdCZkE4bnZwZmppZFJKRzZXcWYvZWNE?=
 =?utf-8?B?dVZ5VUExUG5VckJBMENNOUloQ0JUVkdyYmZwT3J3eFFFT3RkTnA2L0FIVXJW?=
 =?utf-8?B?NW83WE9UcXdLajZNRXp0K2R6WWc0SUZ4dE5Zck1XMVBra2w2ZXI4MXlzMExo?=
 =?utf-8?B?bDVsQ0JwZzRDb2lqNnpUU3ZXL1JwZjNlelA0Sy9GdUEyUlcxYXdCTW5BcTh2?=
 =?utf-8?B?YXFoS00yQ3ZYMC91enJjQ3hkazlFVlRxWVhtUmRvdnV2UkNaOUE0K3FQZzVk?=
 =?utf-8?Q?53BCor?=
X-Forefront-Antispam-Report: 
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2025 12:18:37.1820
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cbb921a-1429-4c11-fef3-08ddb574be71
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000B620.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR06MB7284
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Jun 2025 12:18:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118153

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


