Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3F8EC761AE
	for <webhook@archiver.kernel.org>; Wed, 18 Jun 2025 14:35:23 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.0])
 by mx.groups.io with SMTP id smtpd.web10.363.1750257319344590877
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Jun 2025 07:35:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@leica-geosystems.com header.s=selector1 header.b=br775Fxa;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 52.101.70.0, mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r60W2owM0T283NjDKb3nkVbNyTRDnLzTHL6JbQ6WB1Lu6+Sh6cZlj6E6DBIpwBOmhuRfSXC6nLA0KC+ds1DjtpyRK5JRZ6zb7BA1YP1IP+g+TrVlbi7WxPnVUGCiuqob6iYq6ldeMJiKzqnTiQVkok4ZsZFjGEbCZ1kp2Hz6GbGVpJ/Hxmrgl+dZfCStvR2kCWLAJQTenoO4miU87wJ9UlBq4GC0IAJrHfFTdYT6PI85MFcnde9iZ8rG/0diVnpJ9+ReUWbHUXeVbLSDCnvMgkHQP2yjhxM3efxek/AV7HtVYFhvKNRmcmoeH93bgDGWWrJgDfQ2QSoeW2RfuazcIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YgN+U2oyyBnEaXr20sIIgqDb7Qfcr6JvUcr9iNaZzaw=;
 b=Y3T+KQDJHErPZ+vFkAi7HBlQ8vva1bpybSRbMCsJ5OJU8J3C7u49HLU6aSnjNqeCthSWrwhDMLzy9TxsNvN4DXKDV1gkdfQZTHmWv543Gqu3u0BqJC5pi4TROLp82vO/7MikUf58Ogn8JdpC5f7ZB7gbUqAgCi7RT9NpAETgkkUwkG7/2FqJxKsgpTGQ3kUnnmCfb4w39K9foz7c/OE+w31MbR+8QU6mtcYf5hKKt9T+n34j8W9GlzOLFar/upg1/2XbNDZ6A4w3Xp4fxZOpgdbC2RCjbP4fkaI84ZQg0BjOu8jV9kQeoqYwPXrd9mCdr6Zh5U10PJB5c87IcinM6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YgN+U2oyyBnEaXr20sIIgqDb7Qfcr6JvUcr9iNaZzaw=;
 b=br775FxaF9ix+RbZdwtzgbt81TtKk4o0VRCo/uhE6GeMbjl9V0JYOWGUqk2pLRav2WdrZ61UWYNS2gFW60ByB1+U4Pf9CcmcR2WmCJSxy0ei90zRa7auInLRSqlxGPhQdHU4qliKzVwodQZR7rHTk6QfW67czyCJoKVJhz91XR0=
Received: from DBBPR09CA0009.eurprd09.prod.outlook.com (2603:10a6:10:c0::21)
 by VI1PR06MB8615.eurprd06.prod.outlook.com (2603:10a6:800:1dc::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Wed, 18 Jun
 2025 14:35:14 +0000
Received: from DU2PEPF00028D10.eurprd03.prod.outlook.com
 (2603:10a6:10:c0:cafe::99) by DBBPR09CA0009.outlook.office365.com
 (2603:10a6:10:c0::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.29 via Frontend Transport; Wed,
 18 Jun 2025 14:35:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.94 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.94; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.94) by
 DU2PEPF00028D10.mail.protection.outlook.com (10.167.242.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8857.21 via Frontend Transport; Wed, 18 Jun 2025 14:35:12 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.60.34.116]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Wed, 18 Jun 2025 16:35:07 +0200
From: Johannes Schneider <johannes.schneider@leica-geosystems.com>
Date: Wed, 18 Jun 2025 16:35:09 +0200
Subject: [PATCH meta-oe v3 6/6] signing.bbclass: remove
 signing_import_cert_chain_from_pem
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250618-signing-set-ca-v3-6-4ba014735f0e@leica-geosystems.com>
References: <20250618-signing-set-ca-v3-0-4ba014735f0e@leica-geosystems.com>
In-Reply-To: <20250618-signing-set-ca-v3-0-4ba014735f0e@leica-geosystems.com>
To: openembedded-devel@lists.openembedded.org, raj.khem@gmail.com, 
 jlu@pengutronix.de
Cc: bsp-development.geo@leica-geosystems.com, 
 Johannes Schneider <johannes.schneider@leica-geosystems.com>
X-Mailer: b4 0.14.2
X-OriginalArrivalTime: 18 Jun 2025 14:35:07.0560 (UTC) FILETIME=[30121280:01DBE05E]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D10:EE_|VI1PR06MB8615:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b286f3c-c5d6-43e9-82e8-08ddae7555bd
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RGVkdHhCOVVuUGFXZUZjZ0RPQm1wRCtsdUVNZm1YNTZLMXQyTXE4T2tSTkRm?=
 =?utf-8?B?K2lCU3MxV0JlSHRyTVNsQmtyaEdvOFk2dk84azRLZ1lHWVg4aEl2a0t6L1FI?=
 =?utf-8?B?RDdxemRleDd6Q3p4TXZ0YTBabHhBazhsM2ozWXI4b2oraGgyalJrOEJUUExx?=
 =?utf-8?B?M050SjdLNmJYcFo1VXlSY1RSODc3djNrdlQ2V0JYbi9CcHhkbGpHNkhnQmVw?=
 =?utf-8?B?Z2VrVkh3aCt2TC84NjVGOEtKdDlLZEV1MlFESk5ITjZGNFg2VUozMnJURU9y?=
 =?utf-8?B?bFExSmcrZDR5VUkweE55amc2MXQvblUyMWQ0NENsR21vWWw2dmNUTnlLZzc1?=
 =?utf-8?B?S3UrbC9uSG5Zb2xhT0haYis2UXVJakdub1pXbG1hdFZaem9aVm84dzlaSkNZ?=
 =?utf-8?B?VG1oc0pkQlpkNEJHQUVuTmVqM20xaG9RQjBDS09DNWRtanduQit4OGlHM1ow?=
 =?utf-8?B?c2h6Q1MxUTh2TFZUZWwrN1JlM0NVM3dBcFdVb0ozK3A2WldTRXI2U2x6TUlr?=
 =?utf-8?B?d2h2TVJ1MjJ2UWxCWXUySjI0ZVBJblc2SzR1b2ZEWE4yWUdhZW92cmY2NFlX?=
 =?utf-8?B?QlFhVkUyRmpiajREd05sSGNNMHZVOXRnY2hkcjhEZ1FJTHNya3c2QWdVdkZp?=
 =?utf-8?B?aDRxeVpIMUxXa01IM0RqZkJpZWMyTnJ3alVaWVZubGpHemV3ZDJRUWRiSk16?=
 =?utf-8?B?b0kwY3k3MU1TcjVkWlluMTAwb3JoYUlqWUkyMWpROTNYYkFScVRtOENCcVlP?=
 =?utf-8?B?UVpwSXlNakJ6K1NRVklUdFkwWU53U0hoMlpRUlQ0Ulh0emZzU2pkOU1UNEdx?=
 =?utf-8?B?TDhPckxNZHFSYVE1cDI3Z2FUVUI2aEI2NmdYRzhWY1NrYXZZakNpNGMzblpW?=
 =?utf-8?B?NWN1ZFYrT3dwUWlveS81U3pzVXpFbU9QQWJZYUFrZm5OTStveDBSNmxybFl6?=
 =?utf-8?B?bFlnUjVybk5yNzVzaVdyZllzNTNrLytTaS9sRTRSbERGb0NoZU1ENmQrOFZo?=
 =?utf-8?B?UEh3N3NvTXc5UlVjTGNDRU1BaVE3Y3A1MG0xQ3doeU9DT0JOOG9Wd3JnRlFH?=
 =?utf-8?B?M29rSVNEbGJXelZaRlNDS0t5ZU9ndTFpUmFpblArd0lUT3FQSG9sOWQxWllD?=
 =?utf-8?B?QTFNWEFXTVVKOUp4aW0ydVlIcUpaVDRwekZaR093NVNtaXVwQnFWSnZ6cGhL?=
 =?utf-8?B?YkRVaGhhOFNVYWYwbHhTOXcra1dFUko0LzFlQ21xUE9JbHVnZjRSR1dVVklQ?=
 =?utf-8?B?cDNRTVQ1NU5CQW1ZMXZtWjJmWEgrdENlQkEzRGNqMjlGWDRYdjZ6RFlLU2pT?=
 =?utf-8?B?THZ5SHVxbzZBSHlMRW1WcTNJWlozbWthVEtvcmIvQ0pyYmU5aXpTZnExMVpX?=
 =?utf-8?B?OFQ1bXNkSGF5UHpwMjFkbldlb0xiZ09RaG5RcHlKQUY0NDYrVTliM3dNVCsx?=
 =?utf-8?B?cVNZQXpYTEQ2SU1FN29lWjdYVTBoUDBHTWFBcG8zemZHV0NydXc3ZDRVRWRi?=
 =?utf-8?B?NFRaTWxnZ0lCVFdnZFJxd0ZLRzl0QVUyV1FIRXI1anpPTnE4MVlXZTBFSFhy?=
 =?utf-8?B?RGRqbXhoT2k5S2JVTzltZ2gzaHZZVE5YUXRtOUFGQTdGV0dtMnpRQ0NQVWM0?=
 =?utf-8?B?ZlFvRUlJSkhJNFNZYWtpS1BMQitwdzlzZlNCQVE1YkxQaVNWYnN1dXc2b1Ew?=
 =?utf-8?B?UnBBdG0vOXhYMkdHZEY5eXVGOWhGSCtLYVdnUFdxa2Z1YlJCakVpWWRGMEJ4?=
 =?utf-8?B?eHI5Ui8rTzh5ZXVlZmlUWE5wWmN1eWpUMzBaLzdweE5tNkNjaU9SSWhBd1hI?=
 =?utf-8?B?NndwVEE1SitjNU1lcU5pVEZFT01Tam9BbU0xSUIxdTFxQ2hqRHFzT0Jacklt?=
 =?utf-8?B?MFdob3BVbVNrdmg3cFF1Mnl3RnlMM1FXWjlEcUdIZEhhS2Q5RjRmY0t4YzFK?=
 =?utf-8?B?NVBEZ2ZFUmZEeHRjWVRrYURnSFVEdVlCNmZDc0xJWTdNTnB0d2VWS1RGeXZM?=
 =?utf-8?B?bG1oRm5WQ080TjhVSnB2T1h6RHNCeW01TUhsY1h3emQwMVFjV2NSNk04eVZI?=
 =?utf-8?Q?KUS7L1?=
X-Forefront-Antispam-Report: 
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 14:35:12.8730
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b286f3c-c5d6-43e9-82e8-08ddae7555bd
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D10.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR06MB8615
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 18 Jun 2025 14:35:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117942

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

diff --git a/meta-oe/classes/signing.bbclass b/meta-oe/classes/signing.bbclass
index 6fde22bf22ace34ba720d7564caba176f4de4d39..5068360ca74d766c5d28da12219840bb560164a1 100644
--- a/meta-oe/classes/signing.bbclass
+++ b/meta-oe/classes/signing.bbclass
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
2.34.1


