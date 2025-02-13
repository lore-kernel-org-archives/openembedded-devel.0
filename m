Return-Path: <mark.jonas@de.bosch.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D8F6C021A0
	for <webhook@archiver.kernel.org>; Thu, 13 Feb 2025 11:59:11 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.10])
 by mx.groups.io with SMTP id smtpd.web10.9526.1739447941119922441
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Feb 2025 03:59:01 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@de.bosch.com header.s=selector2 header.b=rA7rFdUE;
 spf=pass (domain: de.bosch.com, ip: 52.101.70.10, mailfrom: mark.jonas@de.bosch.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rjjqnGUje4GLMS71fHyMfG4j9AMbl48mJUX+AtirHWsWMQBjLmApX0/LFcok3B1xYe0w1UMdJ98D779fsLberi+Z1rp5VPYXQCrbF0TMQjbBfdCLQX9K8WsEI4nEhMJrseo+6bHrzd/a42df8ATF8UPW5mQod5P4VLivgmJfdM7yXbPxWff3hNCG/Ayr/qYJeylihMO2vIjFN3xMEJcQJ7v4d7VGHkUI4GEFzCgjtZGi/gzaFwv1GNFT0CImC0IZLwfSAAMyK/xz7v7raFznR4nEX7bC4KdYHi8QM87vwsLnC4RXAj9zNPfRYmpwy5/h3DCgL0buyEJNzeTDG41h/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K/6B8bVj9r2DukOAWyif9uRakBS70xG33PlCFLb6V8o=;
 b=MZ7B7jXhAPLQ2zh+RPWQtF3geLEcv516nnnfEx3Ok/xBRkXwB6sDkQ3bqyNnfsONxzQKXpjG7Z7XrM3VRDw2ozaJw2MZqxt5QgiYCl3FWrvOFe6RYNQjWc2J50sVOvmJthDPgMhR54JdYtyqhhBlVU5USG2PmSFz4LoH1Gwy9nfHC8Vbj+vlVUK4ppzM2Ml4+blweY/gvULjdYgj40SArXcXzbpeKA5T0LbCDFlpkD3MUE/XGk0+A6b+YsCNPLDpPLzxfIPLDcIRLvSFDohLvlCkzIbgQ1J59krh/REbdeLiFA4zihz2voC5+Mf7gAJMA0fqbom7z8xQ/YsY5nU9wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.205) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=de.bosch.com; dmarc=pass (p=reject sp=none pct=100) action=none
 header.from=de.bosch.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K/6B8bVj9r2DukOAWyif9uRakBS70xG33PlCFLb6V8o=;
 b=rA7rFdUEt2+EMs7KxtHHivQabmNchnCg+SXU64zPSNPOMrS9XAM/3dbjZHDc9neRAn+Skcwq+vUUTlDNQxVt+S5H13X6e6x6oYg2JThbnNfq6+BShTdwo1kCcJn+EwA3nRrDiFNM5SPIAZSjl4hTSUpVTp1viH29JcTEjOZRcmWQvgAdf0aTxZAb71qqW/j+ROMK/3p8WyOQ99pJNl4sNxCqmjCKEaiMrE7+umBpN1EskT4Lo/Aq0ZWap/eupnDLA6p8MkE/kzYoiTbkylgM7zfwNLxlfKwwBdH3jB1pNIg7m6q74xcD+Cv9jlM8F5c3QXnyo6v1uQdfSlymgjhEiQ==
Received: from AS9PR05CA0174.eurprd05.prod.outlook.com (2603:10a6:20b:496::6)
 by DB9PR10MB5236.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:33b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.11; Thu, 13 Feb
 2025 11:58:54 +0000
Received: from AM2PEPF0001C70E.eurprd05.prod.outlook.com
 (2603:10a6:20b:496:cafe::55) by AS9PR05CA0174.outlook.office365.com
 (2603:10a6:20b:496::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8445.14 via Frontend Transport; Thu,
 13 Feb 2025 11:58:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.205)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.205 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.205; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.205) by
 AM2PEPF0001C70E.mail.protection.outlook.com (10.167.16.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8445.10 via Frontend Transport; Thu, 13 Feb 2025 11:58:53 +0000
Received: from SI-EXCAS2001.de.bosch.com (10.139.217.202) by eop.bosch-org.com
 (139.15.153.205) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.13; Thu, 13 Feb
 2025 12:58:53 +0100
Received: from GRB-C-0009M.ot.de.bosch.com (10.139.217.196) by
 SI-EXCAS2001.de.bosch.com (10.139.217.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.43; Thu, 13 Feb 2025 12:58:53 +0100
From: <mark.jonas@de.bosch.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <raj.khem@gmail.com>, <wangmy@fujitsu.com>, <socketcan@hartkopp.net>,
	<mkl@blackshift.org>, Ricardo Simoes <ricardo.simoes@pt.bosch.com>, "Mark
 Jonas" <mark.jonas@de.bosch.com>
Subject: [meta-oe][PATCH 1/2] can-utils: Upgrade 2023.03 -> 2025.01
Date: Thu, 13 Feb 2025 12:58:25 +0100
Message-ID: <20250213115826.38194-2-mark.jonas@de.bosch.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250213115826.38194-1-mark.jonas@de.bosch.com>
References: <20250213115826.38194-1-mark.jonas@de.bosch.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [10.139.217.196]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF0001C70E:EE_|DB9PR10MB5236:EE_
X-MS-Office365-Filtering-Correlation-Id: 7088c2ca-be92-4bc1-1efa-08dd4c25c9cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?uEzHBKa3lZPGxdKNZ8vqQnUzO3c4c87pUXBbSGrNYDobPHMtjEbULPfIECog?=
 =?us-ascii?Q?JCuNeyR1vKqE1OU0i+gamAXOEQpDgfC5VCMevVUQvTfahZoTZ0wzOwJF8vzp?=
 =?us-ascii?Q?mfD8sVFPqlAy0x4hYB9z3f/3drOQmOE8Jh2xS/V79KyJiewsvW4xbzTwuAxd?=
 =?us-ascii?Q?HVWj96yZQfu6R2pfm98J6oyZ4zpGhw9Zax7dcCwQgoBWIW4MCBbchHRXpLYV?=
 =?us-ascii?Q?hi9g1el8wUGTyTsj8IO+0q2jQFLicdvBdmOyfJlm9k2wyCBXkV7Kpdqm7maB?=
 =?us-ascii?Q?VDkutt1zfl+oRd9890ReEgwl/bjJCNHLSchIuuJdozNQ9A8MUzkJuCCNFrw0?=
 =?us-ascii?Q?RE56U9Ocg0xQBSywAbF7E7ZneEvgZhGHscFMIsmt9O4gUxiVIb1QmDtJPxUD?=
 =?us-ascii?Q?zZVW2hOoKdAPN9hu54UaN3w/uvwmCe+wOuagsHm5mBjf/ceSCPKsKRalaGqD?=
 =?us-ascii?Q?RAhpdv6IXfs6k3UT/5QkHYpI+UatvATNMQjh1MPJLEWEAVorC7YNoz4mCT1Y?=
 =?us-ascii?Q?Tl0x6wse5JVcxp5K/AUUJGlIo1tSe7EjvKLtdj3mQE+o4yO60syQxFBgIg4N?=
 =?us-ascii?Q?4jwqZ8VEHf8beZ5vIZ5rl8WsOlVZHHrOXU0LHj9Ti8K5CD3lkI7enS9qYIoO?=
 =?us-ascii?Q?4eDhUQUJahhvYOFM9BVdbOQqvFZXsuEyEipcxZC6qO4EFRYV9y0MCEopiC+T?=
 =?us-ascii?Q?ap6e05YpC6eZI6gDFgDpRs24v4s/IpLCRAvjyNvFXjnWxgERRMrmnhQS6Cds?=
 =?us-ascii?Q?oGn1SXggSLkFaxk0PUT67rnMKahw9sBk+Si4D5BQgc6Uka5SUhKnwdRkFNSQ?=
 =?us-ascii?Q?G1UYAfKM8yBF/5Rm1XJ3MDw5+bjJY2DDrMeElE2ZIIDaKtZEPJwNZEzRA2DS?=
 =?us-ascii?Q?uRTTnFDOnFbsuuN8FNTC9vFW/4enzMxbqz+SEAjF9h9mj0vfuft7ieu3mGgA?=
 =?us-ascii?Q?GiEVAZAYuK5znL45ofGF1Kzp2e8Ne1/8EY7GF7xsBTNgjzhewBllmi6bQ9P4?=
 =?us-ascii?Q?ExYs/xVRn/Ct9D7NgQh5Ywbtb6xxif+yAO3UAm2DpLRKGv8yiyV5sCW/vsVA?=
 =?us-ascii?Q?mY6vAJnPIyn8OV1fd7H7qT1aamjt8qVB4/VSl3UATXu5jY0xc1Om4esEDJ9s?=
 =?us-ascii?Q?Vowp2BMvfuJPkCdNNIyRQIazrm+6eXftqgRI5LCueXtWqOidk9UIMx7kxyod?=
 =?us-ascii?Q?KTooE4lHcV0+g6LBq9eW5+0i3mjZaoLNVjiSekJ6JY/x2+pcl4sk1XP2pqYI?=
 =?us-ascii?Q?Dnv1oRr6VBH5gzyYTQnXiiFl8Gt7Utb2RVD3fV6xtTY+ci7oD7kdWS1VTdod?=
 =?us-ascii?Q?Zcv6P7psQXs2+9/3nE4vZVeq+osBFen/DVQ87A7TZpJeVWCVy2cdEd/83frV?=
 =?us-ascii?Q?sSQYBki0Dezb1fvIK/v9uezAlAdf3PVz7sbE7uENjTbss/EbHSURKTzl8Uxb?=
 =?us-ascii?Q?YckfF3E54gU=3D?=
X-Forefront-Antispam-Report: 
	CIP:139.15.153.205;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2025 11:58:53.9148
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7088c2ca-be92-4bc1-1efa-08dd4c25c9cf
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.205];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM2PEPF0001C70E.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB5236
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Feb 2025 11:59:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115464

From: Ricardo Simoes <ricardo.simoes@pt.bosch.com>

Changelog: https://github.com/linux-can/can-utils/releases/tag/v2025.01

Signed-off-by: Ricardo Simoes <ricardo.simoes@pt.bosch.com>
Signed-off-by: Mark Jonas <mark.jonas@de.bosch.com>
---
 ...-utils_2023.03.bb =3D> can-utils_2025.01.bb} | 40 ++++++++++++++-----
 1 file changed, 29 insertions(+), 11 deletions(-)
 rename meta-oe/recipes-extended/socketcan/{can-utils_2023.03.bb =3D> can-u=
tils_2025.01.bb} (72%)

diff --git a/meta-oe/recipes-extended/socketcan/can-utils_2023.03.bb b/meta=
-oe/recipes-extended/socketcan/can-utils_2025.01.bb
similarity index 72%
rename from meta-oe/recipes-extended/socketcan/can-utils_2023.03.bb
rename to meta-oe/recipes-extended/socketcan/can-utils_2025.01.bb
index 51d6327b75..cad41944ec 100644
--- a/meta-oe/recipes-extended/socketcan/can-utils_2023.03.bb
+++ b/meta-oe/recipes-extended/socketcan/can-utils_2025.01.bb
@@ -6,13 +6,22 @@ DEPENDS =3D "libsocketcan"
=20
 SRC_URI =3D "git://github.com/linux-can/${BPN}.git;protocol=3Dhttps;branch=
=3Dmaster"
=20
-SRCREV =3D "cfe41963f3425e9adb01a70cfaddedf5e5982720"
+SRCREV =3D "01083a64ebf28cc716efe2d2fd51c141042ae34b"
=20
 S =3D "${WORKDIR}/git"
=20
-inherit autotools pkgconfig update-alternatives
+inherit cmake pkgconfig update-alternatives
=20
-PACKAGES =3D+ "${PN}-access ${PN}-isotp ${PN}-j1939 ${PN}-cantest ${PN}-sl=
can ${PN}-log"
+PACKAGES =3D+ " \
+    ${PN}-access \
+    ${PN}-cantest \
+    ${PN}-isobusfs \
+    ${PN}-isobusfs-dev \
+    ${PN}-isotp \
+    ${PN}-j1939 \
+    ${PN}-log \
+    ${PN}-slcan \
+"
=20
 FILES:${PN}-access =3D " \
     ${bindir}/cangw \
@@ -22,6 +31,22 @@ FILES:${PN}-access =3D " \
     ${bindir}/cannelloni \
 "
=20
+FILES:${PN}-cantest =3D " \
+    ${bindir}/canbusload \
+    ${bindir}/can-calc-bit-timing \
+    ${bindir}/canfdtest \
+"
+
+FILES:${PN}-isobusfs =3D " \
+    ${bindir}/isobusfs-cli \
+    ${bindir}/isobusfs-srv \
+    ${libdir}/libisobusfs.so \
+"
+
+FILES:${PN}-isobusfs-dev =3D " \
+    ${includedir}/isobusfs* \
+"
+
 FILES:${PN}-isotp =3D "${bindir}/isotp*"
=20
 FILES:${PN}-j1939 =3D " \
@@ -29,16 +54,10 @@ FILES:${PN}-j1939 =3D " \
     ${bindir}/testj1939 \
 "
=20
-FILES:${PN}-cantest =3D " \
-    ${bindir}/canbusload \
-    ${bindir}/can-calc-bit-timing \
-    ${bindir}/canfdtest \
-"
+FILES:${PN}-log =3D "${bindir}/*log*"
=20
 FILES:${PN}-slcan =3D "${bindir}/slcan*"
=20
-FILES:${PN}-log =3D "${bindir}/*log*"
-
 ALTERNATIVE:${PN} =3D "candump cansend cansequence"
 ALTERNATIVE_LINK_NAME[candump] =3D "${bindir}/candump"
 ALTERNATIVE_LINK_NAME[cansend] =3D "${bindir}/cansend"
@@ -47,4 +66,3 @@ ALTERNATIVE_LINK_NAME[cansequence] =3D "${bindir}/cansequ=
ence"
 # busybox ip fails to configure can interfaces, so we need iproute2 to do =
so.
 # See details in http://www.armadeus.com/wiki/index.php?title=3DCAN_bus_Li=
nux_driver.
 RRECOMMENDS:${PN} +=3D "iproute2-ip"
-
--=20
2.34.1


