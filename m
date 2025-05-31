Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D96AC5B543
	for <webhook@archiver.kernel.org>; Sat, 31 May 2025 11:33:05 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.27])
 by mx.groups.io with SMTP id smtpd.web11.4007.1748691180535602007
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 31 May 2025 04:33:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@leica-geosystems.com header.s=selector1 header.b=eEAtLdnk;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 52.101.72.27, mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r9eyADpmbxhtdtEDvhUA+uuYX1YyHAvqENwYJcxF6DeJ++qjeqT7APO3IiRQy8bgbyGqZBa3jKvcOZ21vq/9wD5WZkxNP/HH21PjS7qhtmKEiwGFlOhOkoT4DtnRgHLHj+Xvoy8m/wr26yNQsfWmF3itM8goSY8nxTrSNBAAXLHsU4kVK+z/FlLJ/DQT+6aqx77igYJCFjM0nGw7uvmNPCYeh6IcX/4bEpoxdbIn8nbYiF6ngIsgdL0zzBrVIxgexSGblE3dKJmQXP6Grq2mfmjbTOpUlbP1lRgphUiqIaTP5Gbj1yUFK1CV07BNuZnmDX8WJUnpapOJUkyRkJ628g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fdglauII033HQlF27qvJ+oYsZd2HuM5PdzG5wKQ7Gjg=;
 b=OG/3S98wl42mBBmlmC4yXJrqO/m86GZpaORs74co1hveLQPmrrvbkmqU9nbTmr4RTQcoog2WYrnu01To2Zf38W94W/ACwRPPcH1Ua7GFv76CZtlk25e98Y2QFFDRTAx1VWEvX42fCFI5lEXf2zjpEhUndPu+T0azKp0Y1aBPTw9G5/FwnIOSWrf2nYsADSLpX1JMLrTjq/MqNxM6EBSsKVFonSTexWTyhK/MiBKj6r2ZlPZ+pEeDtsBsN9YIrzo5pbdvx0b9vFpcsiq9qaBMGNqVuwOC6GU4hgeWGKCouTZoFAPAFb57nQwqZTm3IB7Gbp0FpQtnNxmfMvuBGfARyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fdglauII033HQlF27qvJ+oYsZd2HuM5PdzG5wKQ7Gjg=;
 b=eEAtLdnk8ejYwyg4x5dvvQoUUCZUxEWiVb1dMtaEKSXf6Qr/+l+EbnFfcni+QDWG9QuD8WXH3v465+sr3luptEh1SFlwbvzpfr9xBxnn9kv7f8t9QrSLui5BeBCQ829rLVrvb/pmkGda0gLTKjnLh4f0drMeKa+sPYJg7WrBYbI=
Received: from PR2PR09CA0002.eurprd09.prod.outlook.com (2603:10a6:101:16::14)
 by PA1PR06MB9131.eurprd06.prod.outlook.com (2603:10a6:102:464::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.29; Sat, 31 May
 2025 11:32:56 +0000
Received: from AMS0EPF000001B5.eurprd05.prod.outlook.com
 (2603:10a6:101:16:cafe::e4) by PR2PR09CA0002.outlook.office365.com
 (2603:10a6:101:16::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.29 via Frontend Transport; Sat,
 31 May 2025 11:32:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.94 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.94; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.94) by
 AMS0EPF000001B5.mail.protection.outlook.com (10.167.16.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8792.29 via Frontend Transport; Sat, 31 May 2025 11:32:56 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.60.34.116]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Sat, 31 May 2025 13:32:53 +0200
From: Johannes Schneider <johannes.schneider@leica-geosystems.com>
To: openembedded-devel@lists.openembedded.org,
	raj.khem@gmail.com,
	jlu@pengutronix.de
CC: bsp-development.geo@leica-geosystems.com,
	customers.leicageo@pengutronix.de,
	Johannes Schneider <johannes.schneider@leica-geosystems.com>
Subject: [meta-oe][PATCH v2 6/6] signing.bbclass: remove signing_import_cert_chain_from_pem
Date: Sat, 31 May 2025 13:32:52 +0200
Message-ID: <20250531113252.3889951-7-johannes.schneider@leica-geosystems.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250531113252.3889951-1-johannes.schneider@leica-geosystems.com>
References: <20250531113252.3889951-1-johannes.schneider@leica-geosystems.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-OriginalArrivalTime: 31 May 2025 11:32:53.0981 (UTC) FILETIME=[BFB6D0D0:01DBD21F]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001B5:EE_|PA1PR06MB9131:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 4710298e-816c-4334-57fa-08dda036e3eb
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?X2pxVenJY1ewVfZRJFA/a1DEbXQ6dEghA7Uh7fRM0UAsNeKcztI+uEbxNe1w?=
 =?us-ascii?Q?l/NHDAa8eiedXMbJIL9HeSkyZuaQgZqPmq/sXSauUyzPnPOLHKG+An8lgKrr?=
 =?us-ascii?Q?81eZJPnp4ngdd5n8JhfKZSbXf4wlGUyDSk24M+WKH7CYNCifR6kSzGgnCstd?=
 =?us-ascii?Q?3P5KPLTdHjS3cj8GCAnoR0zexov8Haw6uJxX44xRF8bme6if4gjinBbA0Ajl?=
 =?us-ascii?Q?yD0UDZbbaxu+ayBomioVeP7aMm/emfmltBLZPLVSZwmRgMykLfqTthmB764P?=
 =?us-ascii?Q?OmA3A0Hji8po2HTCwFklVrC0cKOJj3XLcYF34IGU2gUDRgsuKYM0yPldcN4e?=
 =?us-ascii?Q?j7FYeDw0AabIAnVy+TZrFbz/CrhwZ7M9h2jGgdK9O5gUzu/BlB+vZpu3kTZD?=
 =?us-ascii?Q?XZ0mbBAe/DoJDJBsW/V8Ofx8tNeYTqmzjQuqCGdJJ9FePTCz2qxaK7ppemHM?=
 =?us-ascii?Q?OvIBVKgtZVcWkAzMbbfTK9b8gJLYLxTXvfpnOizhpB5pfQKlmJXkzbSSRJIQ?=
 =?us-ascii?Q?+9EWsEpTqhLm7FOlsMFYAmPBwYUAb08KZdsblbJq157aZAZC3DmqQ4pV0yQG?=
 =?us-ascii?Q?YG/ULS8yWdccJaqN9eUuuNLRIZM0s4IQjDwCZ/kEXemZ8TAdad+e1oR895hZ?=
 =?us-ascii?Q?rgXh5IWvWtaHShZnpD+ynNQDWrNN4ozMma3/WDVOdfzK9rFxRz0hNTdAFfsI?=
 =?us-ascii?Q?KDTFYiyZS8MZI7LKNZO11QuLwk1yFZ2OeGSEOizWgRSTrflzk+EXDS47l0i2?=
 =?us-ascii?Q?6F+RCCDNSnitlno+bcCJRfGVJYvfyVbUzljvlOYSfjzKlW5heSFxJ4Id+nZU?=
 =?us-ascii?Q?S9AU2zzwLaKzTbz/nCfBad2yJNfoXpEdcjlL8/Aj4V5BGzW4Sbb8OCKvjtbG?=
 =?us-ascii?Q?m9WqB6AeQmOiyJN5g+VMwQBiywet37OYG+ScQaEaVZb+E359k69o+ZfObOgL?=
 =?us-ascii?Q?7BR6TrLBh2teAhdG8X+IOxth2UaLIQvJBNRWcoob+pLOPfg/aXq0ksjHwOYP?=
 =?us-ascii?Q?Ioq6GO5h5TZeoBU5P815rH8HxXbhbKJ5ABNE1nXFRBgVXzVIjdQ1dydi8e70?=
 =?us-ascii?Q?ZMb8/BsRPjpfDxCufmoo5JnMV5j62iN1GmIYBAH1Efa/T2n6Uywwl6DEOpTn?=
 =?us-ascii?Q?tYy7SCHDJroD0lBHatAQtnu6IKVEfmMgX7NLT63PAe+uyanpEsq8vhgo925/?=
 =?us-ascii?Q?S8TlA3QCJouBJDyrMSdTMAggm289UKjLeIncDHWhbe0DfZ2KMZZhwZM7KaIg?=
 =?us-ascii?Q?f5tyAPTGv3L6FYu9iPT+hRuJJj5aSCcxZv/OMS1L8ZDyVqg+LN9+Da5VGlDR?=
 =?us-ascii?Q?sO8xfJAaNjMFzO0ExG8bmvXJqmb/pKSqFAzUYPtkO8ZrmbRwYAkQ5VW6tIGN?=
 =?us-ascii?Q?cnZ48YJnuNrMS6oaek8v6PiWUFicf0alLwtn8pAPje8NUoHwcGXD8tc1Cm4R?=
 =?us-ascii?Q?7yl+FXrIwov5XyD6A8Y7UBCdPwDML4QrI002VZYQMoDmEf7uJBeLnWN0rJ9l?=
 =?us-ascii?Q?btz9NbkuV8VZjjbIGbEiPJ4FZqHBztqUUOy2?=
X-Forefront-Antispam-Report: 
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2025 11:32:56.8667
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4710298e-816c-4334-57fa-08dda036e3eb
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001B5.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR06MB9131
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 31 May 2025 11:33:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117686

With the now available set|get|has_ca functions to establish a CA link
between roles during their import, the
signing_import_cert_chain_from_pem can now be removed.  As it had the
shortcoming of dynamically creating roles, which are harder to handle
then the manually/specifically setup CA roles.

This effectively reverts:
a825b853634 signing.bbclass: add certificate ca-chain handling

Signed-off-by: Johannes Schneider <johannes.schneider@leica-geosystems.com>
---
 meta-oe/classes/signing.bbclass | 29 -----------------------------
 1 file changed, 29 deletions(-)

diff --git a/meta-oe/classes/signing.bbclass b/meta-oe/classes/signing.bbcl=
ass
index 1f50e89d1e..c9759e9198 100644
--- a/meta-oe/classes/signing.bbclass
+++ b/meta-oe/classes/signing.bbclass
@@ -217,35 +217,6 @@ signing_get_root_cert() {
     echo "${cert_name}"
 }
=20
-# signing_import_cert_chain_from_pem <role> <pem>
-#
-# Import a certificate *chain* from a PEM file to a role.
-# (e.g. multiple ones concatenated in one file)
-#
-# Due to limitations in the toolchain:
-#   signing class -> softhsm -> 'extract-cert'
-# the input certificate is split into a sequentially numbered list of role=
s,
-# starting at <role>_1
-#
-# (The limitations are the conversion step from x509 to a plain .der, and
-# extract-cert expecting a x509 and then producing only plain .der again)
-signing_import_cert_chain_from_pem() {
-    local role=3D"${1}"
-    local pem=3D"${2}"
-    local i=3D1
-
-    cat "${pem}" | \
-        while openssl x509 -inform pem -outform der -out ${B}/temp_${i}.de=
r; do
-            signing_import_define_role "${role}_${i}"
-            signing_pkcs11_tool --type cert \
-                                --write-object  ${B}/temp_${i}.der \
-                                --label "${role}_${i}"
-            rm ${B}/temp_${i}.der
-            echo "imported ${pem} under role: ${role}_${i}"
-            i=3D$(awk "BEGIN {print $i+1}")
-        done
-}
-
 # signing_import_cert_from_pem <cert_name> <pem>
 #
 # Import a certificate from PEM file to a cert_name.
--=20
2.34.1


