Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10534CA0EDC
	for <webhook@archiver.kernel.org>; Wed, 20 Aug 2025 10:11:41 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.52])
 by mx.groups.io with SMTP id smtpd.web10.16408.1755684695924875807
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Aug 2025 03:11:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@leica-geosystems.com header.s=selector1 header.b=QBBdYjhI;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 40.107.159.52, mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qEzNCsGwfoHZjsr3qEMLFkRQlBoEwosvgcr4khz0ujH73qVLgszox+FuMsOc+VILMPU4mrYyNbjIqbl71ZOkmXstxH6TBXobEdA8yaK6nr5S0KFAjnb6TfenXj3gAPsQQR90381xj0daeJi31F/oPfmMllWsWtllx5ExpOltHZw8K3az9VvCdaC/9wKo4INCibFHrz9gez8W2H6C5qBd3URDDjmjHaEtwwo8Yx1YLhIg2i8OJC5YthpwobMKCLUSGaHO4C1yoaDFtNSjJZcHkERdPJGK15NUlbFtq8fH/nJqDf7ndt7AmwHX1DiSwV4ANpHCrhc3+tIalIoj/4JHzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y+GGMqrCmjuzND0r6gprwsQvXLd6la0d9IXGk0etDLA=;
 b=FDYdZc8G+vxnNlpnP1C4pBMQcTsKJNlrLo0bprKyKFmWhzkXEoOm7qJ7nXWbdsET/kVntn7OmaK2eSaJSxqikhqlxE4/K9DWPkT0y4ZBNcbmXP3MXmd+HxRRl6HNWOAHdvUvH7XvP2H0qrC7t8tmGiXXKT61fhx1lZuyGEyeJEa3WS8ggk9g10i8j/Bfu1Q3JTk20iHmqI4fYUODILJRxwSDKNb2k8Tru/nAu4K5sy5l9uRtB+dDOvw05NQ8Xv7aWF4dsJm5fFV+NhDmfLTwrmn+CpqX/Rzrr9JPCY49hXoB89pX4xpGwB5YozTbD4KkcTu4730f4APx8R2l3Wb8sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.99) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y+GGMqrCmjuzND0r6gprwsQvXLd6la0d9IXGk0etDLA=;
 b=QBBdYjhI2943KKDtCheWZH1EzjYOg12PX7rOB0QyfBGDYHKPEi9hM0/MC93s2v47jyShif41Yr8Y3wHuaNb7mn3G/0V0x3CCPM5m06EjADYIh5Fs/YT5T5nZ7hthq/TAVLaaq1QQz0tO0endYop46ucXHs+fwzPxdZx53RgmbM0=
Received: from DU7PR01CA0007.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50f::7) by PAWPR06MB8812.eurprd06.prod.outlook.com
 (2603:10a6:102:38c::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Wed, 20 Aug
 2025 10:11:31 +0000
Received: from DB5PEPF00014B9A.eurprd02.prod.outlook.com
 (2603:10a6:10:50f:cafe::c7) by DU7PR01CA0007.outlook.office365.com
 (2603:10a6:10:50f::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.14 via Frontend Transport; Wed,
 20 Aug 2025 10:11:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.99)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.99 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.99; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.99) by
 DB5PEPF00014B9A.mail.protection.outlook.com (10.167.8.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9052.8 via Frontend Transport; Wed, 20 Aug 2025 10:11:30 +0000
Received: from GEO-H84s5E2W8Pk.lgs-net.com ([10.60.34.93]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Wed, 20 Aug 2025 12:11:29 +0200
From: Johannes Schneider <johannes.schneider@leica-geosystems.com>
To: openembedded-devel@lists.openembedded.org
CC: ejo@pengutronix.de,
	jlu@pengutronix.de,
	Johannes Schneider <johannes.schneider@leica-geosystems.com>
Subject: [meta-oe][PATCH] signing.bbclass: create env with 0x600
Date: Wed, 20 Aug 2025 12:11:28 +0200
Message-ID: <20250820101128.47638-1-johannes.schneider@leica-geosystems.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-OriginalArrivalTime: 20 Aug 2025 10:11:29.0773 (UTC) FILETIME=[CBF591D0:01DC11BA]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B9A:EE_|PAWPR06MB8812:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 90c0e73e-5568-4ea6-6530-08dddfd1eea2
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?iEJlWC6+B2HrC3H87dEfyZBwtd42IhEBkJ/Q76G4pnb4hwdAj0pCsrbJKGfy?=
 =?us-ascii?Q?9r3etEOqO8PNfPEAzVQDbI6CF8TAt1UZddsa8h+ArBGLzigDUZdScFbwWqmw?=
 =?us-ascii?Q?caL9+qJlvK0IPQW6sDMcquobEZJw/RcKbnX4Mu7JeM/U2wVUi90DeWXU39ln?=
 =?us-ascii?Q?8W1SotMw7OBbEQEjSdsQbCPnaEMnlCw2MFAICSI7Zr3xbs67owkiTZT6wfMB?=
 =?us-ascii?Q?m7UxHs7pOVmjkpT4bKqpGJAG+B/Ms5v0Hr7Q7Lb0BSNAhJ42Hl7celK0mMhk?=
 =?us-ascii?Q?TFo0VZDYtSq+MYkmrODPGUeJdWyoDitmTMXMPqWO1JkT77TuEfJ+X39DkRUI?=
 =?us-ascii?Q?nmn6H1wSKYznH23c0EzMBYrkPRWd5h5GlAsNwRKQX/jGH3wwYbyW84AJBV+/?=
 =?us-ascii?Q?+Uk4kY5xp2laHf2lrY/DwA3l0WeDCjWNI7QEg1lGO2cideaeNroo69Wnphy7?=
 =?us-ascii?Q?h1rdn6ZXIivDWLdIys6hCgqcw0lBdJC9fXQrgHnakAvoc1J7FNraJd//ub32?=
 =?us-ascii?Q?KOHcXc9n3aQ03HWXH3LyGN8savPfAlRUNRYbNzlp65rRW0KZHeXFUahcp73V?=
 =?us-ascii?Q?yerdbi3eWHgyMaSodrzNrxTuVKyW8sx8nvoAaQE9Nc5heikknXo+ZRPOjr3Y?=
 =?us-ascii?Q?KEGEVHp8VMBJ9mLaJVVwi7SSSopik63L1+aKSrWf/0ThSRH4lajo2B8eKKdH?=
 =?us-ascii?Q?EZ+04B1Wgu0qWF/gxBD3/1mj0aUEzleY5JaGhu8bkbZs8UBE+PFQDZezNzqx?=
 =?us-ascii?Q?CPgwb+j0Ed9XeC9rp/VdKP09u9frg40Rnm9VoxfeZgu6XFPVfQSC2XhAla6Z?=
 =?us-ascii?Q?0uWvnQ+8NYforb1pGge2AKDWOGrI5rClLolPZABExtEYPQCQPn0fK2FOL8rR?=
 =?us-ascii?Q?ZSjji9ksCxcN1xy4YZ28bDiJv6BGQ/sl5aEt+r9l4QsZK6zE74sKZPRZCh8b?=
 =?us-ascii?Q?qyX1A5eM24ac5UXs1JRDybco0mHRRwg/G6o5GnXHFegdY83WqXvkiO5Xv8e2?=
 =?us-ascii?Q?8A5Qq4SkoENqACZ+ig4ERg2VTU9vUe1QOndcerX1XFBhGCDFAXwG4GnVEfUA?=
 =?us-ascii?Q?KsMM2WRwhH+o2ZqcBfv6jCDfmy+tfSPlOLP3dF9lR0O2eA3T6e118oKaM464?=
 =?us-ascii?Q?VBrj9GuzbQhVwlS2ZTAxYjRfGpUxg8Gh8DA/gyZZL85kmNZD67BocOLMBOv/?=
 =?us-ascii?Q?Iiy+ZUGJX1V7c6yiO4hQJYF08J8zzwcfJcwn/ow/OrL7DxDZLQkmvpVKVtpq?=
 =?us-ascii?Q?ZTPJ1cbk2jZvkbJXig/e7qua/2+CSpDwLhErKtKAD/+D46curqjIHf4Mx1HH?=
 =?us-ascii?Q?bhKsTUCw0WCKuf8rL3mHaxsnDMOWs8mI0/vx7nrsadaVPjVhjYEnG0nJZ3ML?=
 =?us-ascii?Q?Ut/qwL9iAHOLrJhT7w/NswBvh56lASkdaQD1a3B6iozX3uBkMBEN0zGACFR1?=
 =?us-ascii?Q?pUfsilYtGaMmyocFRni9G34hlYS1bVFI0LNqE/xfTOjqwoUaWTOiN9LcEyeO?=
 =?us-ascii?Q?RJvbbEIol/nv2ybpnmYmu1X3CyHQJ0WewH4a?=
X-Forefront-Antispam-Report: 
	CIP:193.8.40.99;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom51.leica-geosystems.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2025 10:11:30.0613
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 90c0e73e-5568-4ea6-6530-08dddfd1eea2
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.99];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B9A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR06MB8812
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Aug 2025 10:11:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119043

The env file holds the PKCS#11 uris, which include the pin to access
the database - in plaintext. Directly create the file (after it has
been remove) with the proper 'user RW only' permissions, to give only
the build-user access to this somewhat "security sensitive" file.

Note that the softhsm/sqlite3.db* is already 0x600.

Signed-off-by: Johannes Schneider <johannes.schneider@leica-geosystems.com>
---
 meta-oe/classes/signing.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/classes/signing.bbclass b/meta-oe/classes/signing.bbcl=
ass
index 26d1b592e3..b35184398a 100644
--- a/meta-oe/classes/signing.bbclass
+++ b/meta-oe/classes/signing.bbclass
@@ -104,6 +104,7 @@ signing_import_prepare() {
=20
     export _SIGNING_ENV_FILE_=3D"${B}/meta-signing.env"
     rm -f "$_SIGNING_ENV_FILE_"
+    install -m 600 /dev/null "$_SIGNING_ENV_FILE_"
=20
     export SOFTHSM2_CONF=3D"${B}/softhsm2.conf"
     export SOFTHSM2_DIR=3D"${B}/softhsm2.tokens"
@@ -331,7 +332,7 @@ signing_import_install() {
     install -d ${D}${localstatedir}/lib/softhsm/tokens/${PN}
     install -m 600 -t ${D}${localstatedir}/lib/softhsm/tokens/${PN} ${B}/s=
ofthsm2.tokens/*/*
     install -d ${D}${localstatedir}/lib/meta-signing.env.d
-    install -m 644 "${B}/meta-signing.env" ${D}${localstatedir}/lib/meta-s=
igning.env.d/${PN}
+    install -m 600 "${B}/meta-signing.env" ${D}${localstatedir}/lib/meta-s=
igning.env.d/${PN}
 }
=20
 signing_prepare() {
--=20
2.43.0


