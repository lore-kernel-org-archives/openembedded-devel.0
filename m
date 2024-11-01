Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDEB6E6B24D
	for <webhook@archiver.kernel.org>; Fri,  1 Nov 2024 12:05:34 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.50])
 by mx.groups.io with SMTP id smtpd.web10.36185.1730462733928338468
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 01 Nov 2024 05:05:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@leica-geosystems.com header.s=selector1 header.b=Vg3kWJ5j;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 40.107.21.50, mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G4mE8m9T+KJICqpv34XivgbwTRQXPJomWV3L8wvlGInqaScEYZ4WNbHqm8gYy26k0IhkIgu/NSkewnhbnkvqRFhtuWUDV9yukKY0iiya6RecKtY6pky9Eiv+OAWZthwe4Wfy55mkbbRgh30ft/Y2kRgNSiuPOOlvjPioLfSYo5SKmNJvrb7rAK6VxIvWtRgQbNKGvxZ/Cp5NW+4adhzxR4NpILNGa/hldQznNMXsQMXsri3GuSBgSdmITbZFiF1+JLfeE0FBNXratHiRq60FRRHL3H+puA6lDmYvbuOVTnynfaFt6xrp3ynOVpLYsKE5PNW1HTiG76s5C+oGMe/VUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CqtPkzXvT4eYBBhijvf3tYT8/Z8ft5Hyn1KEQCsNtcw=;
 b=Oq5VgTwOY8fDHYJoL2iAB+u8fP6o6+o8s27FWoYMj/iEr+dQ/7lh51dmgjXn533minM8weAeVDmlEjEN8zZkA7czNo14WZz61Q9E5ipSGeu2l1XkOxIovH98OxV9M4ARvZ8bOfL/S/dajgmV+d2CRrFmnQdlPDwk+MD+g5ZONVBeG0PVIiv/Eq1V8Qdsi7JYSvuXcWfcwRwJJwd26yCj3MkZyYd76y7YHiBeSmiA+saj2LRZ3jsd0JN6FFvf5vUZ8iiqFq2m7rZYQ1skKEC/QFINZn32s1VgPTzinwnyyhTZU3P9hZOo+yEcdGEZf8NP6T8j1CL0l6ZkwW55qz+EFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CqtPkzXvT4eYBBhijvf3tYT8/Z8ft5Hyn1KEQCsNtcw=;
 b=Vg3kWJ5jBO+yKNfWYSKEFVtmUNugT2Kh8ig/E8Pk3D6W6RLRlaUnsA41aGXArbCVxiqc4oJmIcziN+T8fvaDTjjmynqXL2aGKn/MQo0whQJHTCH8GlWNxA9pW2dc6isIfEGnDvp/dkxbJoDlD2unhv2mYzayWqOUkRt+dObfonU=
Received: from DU7P194CA0010.EURP194.PROD.OUTLOOK.COM (2603:10a6:10:553::13)
 by PA4PR06MB8548.eurprd06.prod.outlook.com (2603:10a6:102:2ab::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.20; Fri, 1 Nov
 2024 12:05:30 +0000
Received: from DU2PEPF00028D00.eurprd03.prod.outlook.com
 (2603:10a6:10:553:cafe::3d) by DU7P194CA0010.outlook.office365.com
 (2603:10a6:10:553::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.24 via Frontend
 Transport; Fri, 1 Nov 2024 12:05:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.94 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.94; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.94) by
 DU2PEPF00028D00.mail.protection.outlook.com (10.167.242.184) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8114.16 via Frontend Transport; Fri, 1 Nov 2024 12:05:29 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.60.34.116]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Fri, 1 Nov 2024 13:05:29 +0100
From: Johannes Schneider <johannes.schneider@leica-geosystems.com>
To: openembedded-devel@lists.openembedded.org
CC: Johannes Schneider <johannes.schneider@leica-geosystems.com>
Subject: [meta-oe][PATCH v1] signing.bbclass: add certificate ca-chain handling
Date: Fri,  1 Nov 2024 13:05:13 +0100
Message-ID: <20241101120514.185668-1-johannes.schneider@leica-geosystems.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-OriginalArrivalTime: 01 Nov 2024 12:05:29.0658 (UTC) FILETIME=[583A31A0:01DB2C56]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D00:EE_|PA4PR06MB8548:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 17473465-8547-43b9-00e3-08dcfa6d7ae9
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?gCGJLroo6ztZZjuykTqRVbmmyYlbgUghVFEBcZ8lSOfMT4AytfC/ybg/XS64?=
 =?us-ascii?Q?whnPPxKyGRg8qrLIyoMVYw4X2s3mXw80DlOh8lHGwHCW2Rko0dA2hqWUetZp?=
 =?us-ascii?Q?85FehEtBUOmtTkTd/+uoYuWoEcVXeEZ86UTLjDhanFWhi/OX9yE+Qkn+fjAC?=
 =?us-ascii?Q?riGdkQuv754RNf3NxrtKLJYna+KFAXCbgGmkG4fEEgDmD7u5GzNzbEO8ipee?=
 =?us-ascii?Q?Q6eBvlgONVxfLlSh9v+ydf/3srJdIpvYbsRZlHqtIGERDakeJl2TOadqI1ow?=
 =?us-ascii?Q?CvVAQ7kuojnjR0JADMrywVMsqTjzNfpPttaKVg/s/5lrbK/VVTe2qKBS5ybO?=
 =?us-ascii?Q?mlhi5QaTWnjxboN9SX7HCc2c7DTP5VHFRv/gbBFAfz/OsWcTzBhUW5AevFij?=
 =?us-ascii?Q?Er+IWILSoYvzu4A071vE/kibzjPEdwKJIqCZ+wTQgOiMcpBuqyWmuYAuLiPj?=
 =?us-ascii?Q?Di+wjX4qWNOCGdq/v8tHCl5pohvEAHtpLa56NqUaJge6hjzSBLZ+P8LmYeI7?=
 =?us-ascii?Q?UyYuMP6LVnXImTJ+1dswAzVZR0wpU1BcuBER6NPS+orjK2iupBx92GFRp2yo?=
 =?us-ascii?Q?PXu0uLxpadI2VaYnqjlYSAs3V/xkgbnjLImkmBIwhHt9G2YlsXRUBR56wbns?=
 =?us-ascii?Q?3HTBSNBsGZqPYiT8ZaafKa0aXdiSrPsm/i7Y1Ijpc5GdTMzqKW8pnQnIKBOc?=
 =?us-ascii?Q?0LBIEoN8HoWo3qELL3Lm1bEbEmIFRcNbPy/Yzd+XYzTAaqYGN0iTVZRYuQLf?=
 =?us-ascii?Q?LMMg086k40eBL14+VaIXhQ4p3zxOHIzebGBHUttJGJgqG76R/zbOLuKxOqam?=
 =?us-ascii?Q?JtcSvJPiTpc46IYvG7JPtGe7k7COtcwt+S+Hu7J/IRHucimghYdAn+P1enkc?=
 =?us-ascii?Q?5AmVY8imeDynywx80abQaqtQFOzcBb5SHjTzA6D/jQOZyt+Pd9KUUyTnU7q2?=
 =?us-ascii?Q?Qy7Q7C7xqJePzE/OLvvE4JOagesi3jS3PR9k0IRVlHMwYxlMGblQXe21Mq2k?=
 =?us-ascii?Q?FhYCeZJuuOdgowqgch01lsegXyVsUheYvtj4qeUJW7IMgZSt5MNaQWKdrWwI?=
 =?us-ascii?Q?OWybo4jmGJojettR5MHvJwXZOrC69minIWInRZ4KbKA0FTWA/Zb7w/nmxhqs?=
 =?us-ascii?Q?qPv6WBEzQKh3AcptWF4qi9o4L7p1YxAIlb5aVdiqTRwVZorAu2C3zvK01QMz?=
 =?us-ascii?Q?CY9ZX0KQhwOakPN0sLTkvBclA8vJtYb3SGV2QuJ2EB+GxNVfVVATqYx7qn5w?=
 =?us-ascii?Q?6+NEx2R+M8AejZWfo2UsU8FhtnVHnzWMCaKmky9nOltrZKrY/iMzpDsfX4O9?=
 =?us-ascii?Q?2zprFVXMVTEmL2m4oydxsANYCPjra4Vl8USAu0GCdCfJN89+HR54yAQdow9e?=
 =?us-ascii?Q?Mseps/udS1BBR/TXqTtRm5rzNF2fymvgCgWNEHtPj6nmCv9WSg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2024 12:05:29.9612
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 17473465-8547-43b9-00e3-08dcfa6d7ae9
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D00.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR06MB8548
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 01 Nov 2024 12:05:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113382

Add handling of ca-chains which can consist of more than one
certificate in a .pem file, which need to be split off, processed and
stored separately in the softhsm - as the tool-chain
signing.bbclass::signing_import_cert* -> softhsm -> 'extract-cert'
only supports one-per-file, due to using/expecting "plain" x509
in-/output.

The added signing_import_cert_chain_from_pem function takes a <role>
basename, and iterates through the input .pem file, creating numbered
<role>_1, _2, ... roles as needed.

Afterwards the certificates can be used or extracted one-by-one from
the softhsm, using the numbered roles; the only precondition - or
limitation - is that the PKI structure has to be known beforhand;
e.g. how many certificates are between leaf and root.

Signed-off-by: Johannes Schneider <johannes.schneider@leica-geosystems.com>
---
 meta-oe/classes/signing.bbclass | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/meta-oe/classes/signing.bbclass b/meta-oe/classes/signing.bbcl=
ass
index 3e662ff73..8af7bbf8e 100644
--- a/meta-oe/classes/signing.bbclass
+++ b/meta-oe/classes/signing.bbclass
@@ -134,6 +134,36 @@ signing_import_cert_from_der() {
     signing_pkcs11_tool --type cert --write-object "${der}" --label "${rol=
e}"
 }
=20
+# signing_import_cert_chain_from_pem <role> <pem>
+#
+
+# Import a certificate *chain* from a PEM file to a role.
+# (e.g. multiple ones concatenated in one file)
+#
+# Due to limitations in the toolchain:
+#   signing class -> softhsm -> 'extract-cert'
+# the input certificate is split into a sequentially numbered list of role=
s,
+# starting at <role>_1
+#
+# (The limitations are the conversion step from x509 to a plain .der, and
+# extract-cert expecting a x509 and then producing only plain .der again)
+signing_import_cert_chain_from_pem() {
+    local role=3D"${1}"
+    local pem=3D"${2}"
+    local i=3D1
+
+    cat "${pem}" | \
+        while openssl x509 -inform pem -outform der -out ${B}/temp_${i}.de=
r; do
+            signing_import_define_role "${role}_${i}"
+            signing_pkcs11_tool --type cert \
+                                --write-object  ${B}/temp_${i}.der \
+                                --label "${role}_${i}"
+            rm ${B}/temp_${i}.der
+            echo "imported ${pem} under role: ${role}_${i}"
+            i=3D$(awk "BEGIN {print $i+1}")
+        done
+}
+
 # signing_import_cert_from_pem <role> <pem>
 #
 # Import a certificate from PEM file to a role. To be used
--=20
2.34.1


