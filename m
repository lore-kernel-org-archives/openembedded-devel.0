Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CB12C5B556
	for <webhook@archiver.kernel.org>; Sat, 31 May 2025 11:33:05 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.56])
 by mx.groups.io with SMTP id smtpd.web11.4006.1748691180447518251
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 31 May 2025 04:33:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@leica-geosystems.com header.s=selector1 header.b=kD+sP4j/;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 52.101.69.56, mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I/BYfKEtQZQAJvTxO+ytxYnvUt/aumEumUnn1IsojLh5O2Z2vLApg6utw23Tix6iceuxxTboZAg9xwdH6UkVm9t5cMgrA1ak9KHiJrz1PLv1tjpANUdJUOqc6nsLoLQvMU2JlfGfOOaVJxYYIyWqu/bTTH7T1k++Kh9vlsB0XezLyAiIJ+J1IPU8oN32jrScSY/X2Wj7xlDb0wJR8XYabnZUeQfxNYRKaFwftqImel53RYZu3+5h/P5uf9WK93ylPeaPwP3wDl7ILawpmRbIgrK9N+T28xdaYhMIlNlKDTjFXggqCSBFnAscZIUx14A+ymHHV2+hyQglV0FxJ240WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TtHvIPVSI/9iWvHBejzLOrXPhITknPxEIcf9amQeDGM=;
 b=WJLrb6yAd89dNnE2vKU6buQN2klHXUjk1iyyCFPkXiewmWeqgBpmjELO07q5coezCYxt2SifyzNO7ADZQG/UexKABNHqhc4ER5tddwUb0gYgP4kfPR7gxQnT4JoLs1XF9SE2J6D0w60tiJO6DlSBLaMPVJNSAYKA9U/+vN9aggFJZAg10thsSb7NPDYEO0W/k0QPL8Pop2+VFbytoh0X8auDW6USH2JTSg0cksy5cKcHl7lx5SKM3NkWW2HfF2NSTWqo3wi9IsLG45UeRWbUziNcwxn7uVAhwo6VkDoYc+ZKB8wweZVhQP0Zt+0CiGhZXT0tNk7HPC0u4Ee+RY0TFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TtHvIPVSI/9iWvHBejzLOrXPhITknPxEIcf9amQeDGM=;
 b=kD+sP4j/fGglw/Wr2+W1pR7LycJSEZ8jHo93odTEmO5QBZWYn7lQADbMMk/bmhtHPLpFVBd8uRCfGe1IFwJECQNIaefXoecDocNpSawxoM14OSiZjCi7pKT+RhHpyEc5cXmqa4EP1dMso3XMRisDjDgtFtvRyJpBeBIaP/ce+e8=
Received: from PR2PR09CA0012.eurprd09.prod.outlook.com (2603:10a6:101:16::24)
 by PAXPR06MB8160.eurprd06.prod.outlook.com (2603:10a6:102:199::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.34; Sat, 31 May
 2025 11:32:56 +0000
Received: from AMS0EPF000001B5.eurprd05.prod.outlook.com
 (2603:10a6:101:16:cafe::bd) by PR2PR09CA0012.outlook.office365.com
 (2603:10a6:101:16::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.27 via Frontend Transport; Sat,
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
Subject: [meta-oe][PATCH v2 5/6] signing.bbclass: add signing_extract_cert helpers
Date: Sat, 31 May 2025 13:32:51 +0200
Message-ID: <20250531113252.3889951-6-johannes.schneider@leica-geosystems.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250531113252.3889951-1-johannes.schneider@leica-geosystems.com>
References: <20250531113252.3889951-1-johannes.schneider@leica-geosystems.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-OriginalArrivalTime: 31 May 2025 11:32:53.0965 (UTC) FILETIME=[BFB45FD0:01DBD21F]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001B5:EE_|PAXPR06MB8160:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 049685a6-5e6d-4f74-b0c8-08dda036e3bb
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?iwPMUtHo17LBXZ40aBZGKRypahd0x9bms1lMOeyEj1tVRNntL+YnI9pML609?=
 =?us-ascii?Q?Ao4SpsVE7JMa2ZT6z03h7XwoFTw1KrOdqKjVqjeIWBfqkx0lf30hikdzdImI?=
 =?us-ascii?Q?QorQ3luv3j/DDGb975roo6C6g215qaj0ZCd4ZF0BJD4Cle5QbZJlWKH+fHmR?=
 =?us-ascii?Q?QRzLgoScohyiidwCFFRRH4ihStsL7HNDhScL+0INNRgu7Gs1yi22HxquD/HL?=
 =?us-ascii?Q?4DWST7DAL7xaxdE9z8tihO6fab7OFG4avssgBUfvLaB1mY+yUd4I/NIEUzPi?=
 =?us-ascii?Q?03GAg8/cZDzg41YooaT/4RuJpII98sjP8SWmcAJHMO6abYXKaGciMPMba1/I?=
 =?us-ascii?Q?HYlhH07WA3/hRxfc43lnJucu8ZWkyTNtFsCHCJ8p+tk8lM9ad2hDapzXC9Nl?=
 =?us-ascii?Q?AzeAUiwE8fUbi9U5feP55ckfB/48QEAzC1LEjYokgCgPcdIB3FzRRcJ7hkkR?=
 =?us-ascii?Q?zyPMvU0ovRln+zMH8rzLRl/uyUkvQQc66fLyvRfvh5fa3zOTqoR2uT/HKHtO?=
 =?us-ascii?Q?IOSu+wmfcpEOoeEpwL/obiphIe0+lh5ty5GrLheV8WCAnLsdE9KfEmL/wTs8?=
 =?us-ascii?Q?O5etlhpXhyggM04LybqCYLMQ2unkzQLfU0xm/c8IVOHO7L+JgKidYGH2uetc?=
 =?us-ascii?Q?l75UYFizRgQDcDaJCNqnff/Y39I0i1HZE5U51SekJwTGASog2LiEuV+TF4Gw?=
 =?us-ascii?Q?G+jTv3nW5dEjgfI9rRX+/juy9U/WvHqyILSO9VrN10Ju2fqcAY1sC0zhaQ06?=
 =?us-ascii?Q?+w5wX3ae6il/VETLmWjhityi8hA9Wk6fYtjJgCxg+8MBpABDcXs7wpSjPuXY?=
 =?us-ascii?Q?KAVumEBiPHLRStGGzmNAiyQwoHo7z8Tj8Eip3IYBoruJh63pUt2ZxLJafGcx?=
 =?us-ascii?Q?/D6N6iVquErzpLQobOAXeuXsowu1TZV2jL3Iko2g+UPJ03Eyg+2mnIfAWsLs?=
 =?us-ascii?Q?9zhvGKlWhCL3JqeShnIt1dyOD1j40L9jRW8DJyQEqFbvthLGT4Bz+0LTHfE1?=
 =?us-ascii?Q?U/G9Cqj3+HK4PEZqeYehXnkNMHNHnnGYvr8+0TjJjxRy0dZ/oe5RN62eejvG?=
 =?us-ascii?Q?5F8A2uTz2qusRg+T9NNuPEgcL8uBrTR3DkNXs1lndzz2jcjHwy+fsc6S8mHB?=
 =?us-ascii?Q?CdSpin0sCiLOJfjeejT8KT/uZ/Q15vput1dwnLmaUywjEoVOsqZ/hKniuXz3?=
 =?us-ascii?Q?QnQTSMPFSGFX1WHrustA/1U8nOccgN6ijz/VPkO72Wn+g7jYyf4LjB54tuvG?=
 =?us-ascii?Q?1MO+9elEx4kObMV9+0p2ey44Ig8sUgv67OJrI+ozm5dYqUjF1IRGhmEgUAHq?=
 =?us-ascii?Q?PA0CHwjNmaXBQmFMSP6kjPCc0ZA+4uDn2TYLLI0zmxqBE6mD24Mc+gC/g8UW?=
 =?us-ascii?Q?HMSfxjsmsI2vAunOLwcL+Q1VwZFYao7WK6ldv4NZBuaYfbMeKBg1nEP0ctTS?=
 =?us-ascii?Q?uxtKdUUByOpo0FQsWBbh2y2dE9i5sQcjhkC4fJ4KPIy+KqpOlptfeiPKe/cR?=
 =?us-ascii?Q?Szc5wTksrdHaLMAVVE4XH3wED8+l+2MsLoPa?=
X-Forefront-Antispam-Report: 
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2025 11:32:56.5542
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 049685a6-5e6d-4f74-b0c8-08dda036e3bb
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001B5.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR06MB8160
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 31 May 2025 11:33:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117685

Add extract-cert wrapping helper functions, to easily extract
certificates again that had been previously imported into the softhsm.

Signed-off-by: Johannes Schneider <johannes.schneider@leica-geosystems.com>
---
 meta-oe/classes/signing.bbclass | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/meta-oe/classes/signing.bbclass b/meta-oe/classes/signing.bbcl=
ass
index 7bc3e7cb12..1f50e89d1e 100644
--- a/meta-oe/classes/signing.bbclass
+++ b/meta-oe/classes/signing.bbclass
@@ -54,7 +54,7 @@
 SIGNING_PKCS11_URI ?=3D ""
 SIGNING_PKCS11_MODULE ?=3D ""
=20
-DEPENDS +=3D "softhsm-native libp11-native opensc-native openssl-native"
+DEPENDS +=3D "softhsm-native libp11-native opensc-native openssl-native ex=
tract-cert-native"
=20
 def signing_class_prepare(d):
     import os.path
@@ -439,6 +439,30 @@ signing_get_module() {
     fi
 }
=20
+# signing_extract_cert_der <role> <der>
+#
+# Export a certificate attached to a role into a DER file.
+# To be used with SoftHSM.
+signing_extract_cert_der() {
+    local role=3D"${1}"
+    local output=3D"${2}"
+
+    extract-cert "$(signing_get_uri $role)" "${output}"
+}
+
+# signing_extract_cert_pem <role> <pem>
+#
+# Export a certificate attached to a role into a PEM file.
+# To be used with SoftHSM.
+signing_extract_cert_pem() {
+    local role=3D"${1}"
+    local output=3D"${2}"
+
+    extract-cert "$(signing_get_uri $role)" "${output}.tmp-der"
+    openssl x509 -inform der -in "${output}.tmp-der" -out "${output}"
+    rm "${output}.tmp-der"
+}
+
 python () {
     signing_class_prepare(d)
 }
--=20
2.34.1


