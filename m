Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D656C52D7F
	for <webhook@archiver.kernel.org>; Mon, 12 Aug 2024 20:09:17 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.65.43])
 by mx.groups.io with SMTP id smtpd.web11.56151.1723493353714074908
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Aug 2024 13:09:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=lbpYwm2R;
 spf=pass (domain: axis.com, ip: 52.101.65.43, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xUl3nZWZS30UxC2fzYy3AnK/IOfwwyHJ0OXw8MIR2EO681GQKkbIr1Yd3hFqVbfTeQrhKT1m+HuZty5STr51ExPW5EzJCOXuOS9f9vV4j3daPjZMJ/AlmTExaKTzY4TlvpfeSRTYeuXuTBxkCg2mVcxq2ApqS+t5HbwNTlkhobsGLNadDP42TdXOgDBKwoOEWzDrhdk0sTlP5kdQa2u7tvE4k9Epgn86paj57QnJLXRiidUe7N/lrU7fubTvtAVKRbGgosDnnVJyrR6XGZu4xJaBPhmWuL2vYQ3Ac78KB0McB1W4j66j2VNWsyngSJVcOD+kqsu/IlMjjmer1nFySg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o76OUz0+u6wEWCvzjV+gHrVC4zIraPnUSYp3pv5yI7A=;
 b=IC8nDr+Q0TzJaq+jHE6Hp8XLWE0CtL/VkWkUB5/3gm0y97X2SjdOPGUNQ4iEbIpWMs3K73oAd212+owftjF/jBfdtOWVYFTVK9pQgwHb/4RbpIsrMBrKoGjvuQpPzAqGi9gDFSoN3GmcC9tKB6wbVUYj2dbdjqt0Ate49Tmh/89//yqAyK+ThPkx00ra1Jw5AMMHLCb6LHktSgLuUBRyp4a6N/ITKj38sLFryotoQssxmIwu1CO1uOLIyQC2suHya2LW1UzuRXOXkXgWWBrYHEJ5ZeITpTOTc7pGEfn37kdYCuq8QHIKrSp64TI0pm0Wcvo3FogJzZgWmbVslvo7kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o76OUz0+u6wEWCvzjV+gHrVC4zIraPnUSYp3pv5yI7A=;
 b=lbpYwm2RaaIZFe/OJGyeplyYuoSgOB5Fjmtv6JzI+LpUjgsSb1Ced7C21qaxL56NQTJJ8ROtrMcPDnILWgM6IIEJgbZSKyCOoM8vkCCoeHnKrmEGf/N+5i+B2x+pJ+ONvZDISvppsteguElL9SOU0vyIBCKicZPtzDLYDYlEFNo=
Received: from AS9PR04CA0145.eurprd04.prod.outlook.com (2603:10a6:20b:48a::15)
 by DU5PR02MB10780.eurprd02.prod.outlook.com (2603:10a6:10:526::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.20; Mon, 12 Aug
 2024 20:09:10 +0000
Received: from AM1PEPF000252DA.eurprd07.prod.outlook.com
 (2603:10a6:20b:48a:cafe::7d) by AS9PR04CA0145.outlook.office365.com
 (2603:10a6:20b:48a::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.22 via Frontend
 Transport; Mon, 12 Aug 2024 20:09:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AM1PEPF000252DA.mail.protection.outlook.com (10.167.16.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7849.8 via Frontend Transport; Mon, 12 Aug 2024 20:09:10 +0000
Received: from se-mail02w.axis.com (10.20.40.8) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 12 Aug
 2024 22:09:08 +0200
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 12 Aug 2024 22:09:08 +0200
Received: from saur (saur.se.axis.com [10.92.3.10])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 127B933A
	for <openembedded-devel@lists.openembedded.org>; Mon, 12 Aug 2024 22:09:08 +0200 (CEST)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur (8.17.1/8.15.2) with ESMTPS id 47CK97R53077960
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 12 Aug 2024 22:09:08 +0200
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 47CK97rG3077959
	for openembedded-devel@lists.openembedded.org; Mon, 12 Aug 2024 22:09:07 +0200
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [scarthgap][meta-oe][PATCH 1/3] hostapd: Support running "devtool modify hostapd"
Date: Mon, 12 Aug 2024 22:08:52 +0200
Message-ID: <20240812200854.3077901-2-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240812200854.3077901-1-pkj@axis.com>
References: <20240812200854.3077901-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM1PEPF000252DA:EE_|DU5PR02MB10780:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c4e664a-e922-4093-d74b-08dcbb0aa10a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?TcvNik14YAnh7ziSTyzCMoM3AKh62YhMob/n8kIpJPXtnxgIKiPDzQh7IKH6?=
 =?us-ascii?Q?jqomJaq3ZZnvHO5LnB20DoihlwEg2CI1eLfnVvFOl6glQWEdO2jHJ/B0+5Gb?=
 =?us-ascii?Q?yIiBQ8y5cNSKleqHXi3FmKhjNSAo9/wEpVDTBvHHfMtwD0i1dv9SMnsAZ6J3?=
 =?us-ascii?Q?J6+Vv9LiaHJXleNpxU/T8GoxbZzq3E8zcrq8pwWFdzE7fU3NAfGUXS3SIf/E?=
 =?us-ascii?Q?0/f6OvIYavqjSpvbOPIRTQl8dYwTJfcki9gVHZRk//Jb3nYMPi3FsuIlx9jF?=
 =?us-ascii?Q?nPzwaUTNLVFNnnSqXiRhw0ez5/gdaIPhUHcK7UGXQvbPXNmP+J3ZFRcqoVck?=
 =?us-ascii?Q?0R/QdIpDtQFTqQdIEG1xcrB0BHVk+oP+UIjAL0hf53efS9+UOx0D3QtoxQvG?=
 =?us-ascii?Q?K5uX/PgAgqmskTAIuGoZR7zs1upY07pd4+Sl1wP6I0eZYX/UehvlAOVnWA5W?=
 =?us-ascii?Q?e6oQwSWE/qrd3AHm+Z4Bh0v/uWb27jw/rr6mB3Pr/zfhT2YULohz/kRCjRAe?=
 =?us-ascii?Q?SVbRepWK33fdblUvLVNYBPy+aKMz1oDWU9sgv8YzW+3XgUyQ/ZJntSgS5JVX?=
 =?us-ascii?Q?OZXx5FgIiIfW7myWxKcsChZ+2xBPpbUuyYDhzjR5ZNLkBa4vcDbxFJgXoa6u?=
 =?us-ascii?Q?LFiOPlWZA3foeQDqgJ3s7nAzHliTovTI+yQ2UHWKrDtufrz3M3gZXPKaeaTv?=
 =?us-ascii?Q?Vy5dsPAJATDGug8oDrrqCZglxwRPrFHsXwOac7ntWxuc2y4eNbAN4jWfYLne?=
 =?us-ascii?Q?7mf0NqKYyyGqwPydVVCbCXjktAk7grLY7/Q1YL5uL7o0yyQPoXLECxEVLTrg?=
 =?us-ascii?Q?LZkIc9vecR+TQU7vekSX8K7SzlNKtDLdlnY3GZ69ZCIgahynRYiDfgWjhy7h?=
 =?us-ascii?Q?AcFz/RZlb9GR2CZzJ2xMfqvs9X3quCsD3Lbv6RKAoGAIBS9GYX5tUF1KbX7+?=
 =?us-ascii?Q?R6R4hMRW8E9GDMx5durq/yJ8BUsj6ZKFLIG2p77c2OiCZ7pXPl9vwTnksx7M?=
 =?us-ascii?Q?DcTg98rZaYd3mWtET97jM9xPo1tkwlxgsXZPimgnNXXGiN80PFcpribuFoY0?=
 =?us-ascii?Q?IHbY9tq3mBeu9D31EFUx37s8fbpLXtGAKg9T+9/9tiEcCGUC0oqwxl0FOZJI?=
 =?us-ascii?Q?AnM1LEngGa8fu8pc166CXixqn1+fy4SjGJuyEbs+ZuMQzEW8ojCZHQG/+zty?=
 =?us-ascii?Q?592nFZsS1T4xjTj1yKajTKvdkaEPh/eX9DsPgAQ6KoWA1BNSADbmiAJK4F90?=
 =?us-ascii?Q?4rG3i/Y90tHY+48i1UiMp7dSP8qeX0XXp1bl0rhBfc5lPAjnQUlD8BrgMxzZ?=
 =?us-ascii?Q?kDFi32I6wq8Vx49ekbKY+VBuQbMsqkF0VKkFAgr1OJx6ROh6f14C/Jo9DZ84?=
 =?us-ascii?Q?xKYzfGqYI2XFKnUJXDngNh1yWqP2ITUt7iZFdVAI5/nFFZYPo6VlWrPX5gPw?=
 =?us-ascii?Q?VrXl8KQW7feMCmKr57PONWWONzw9CFV/?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2024 20:09:10.5208
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c4e664a-e922-4093-d74b-08dcbb0aa10a
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM1PEPF000252DA.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR02MB10780
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Aug 2024 20:09:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111777

For "devtool modify" to work correctly, ${B} needs to match ${S}.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 .../recipes-connectivity/hostapd/hostapd_2.10.bb    | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd_2.10.bb b/meta-oe=
/recipes-connectivity/hostapd/hostapd_2.10.bb
index dbdc5c1bd..3383f6cac 100644
--- a/meta-oe/recipes-connectivity/hostapd/hostapd_2.10.bb
+++ b/meta-oe/recipes-connectivity/hostapd/hostapd_2.10.bb
@@ -16,9 +16,6 @@ SRC_URI =3D " \
=20
 SRC_URI[sha256sum] =3D "206e7c799b678572c2e3d12030238784bc4a9f82323b0156b4=
c9466f1498915d"
=20
-S =3D "${WORKDIR}/hostapd-${PV}"
-B =3D "${WORKDIR}/hostapd-${PV}/hostapd"
-
 inherit update-rc.d systemd pkgconfig features_check
=20
 CONFLICT_DISTRO_FEATURES =3D "openssl-no-weak-ciphers"
@@ -29,20 +26,20 @@ SYSTEMD_SERVICE:${PN} =3D "hostapd.service"
 SYSTEMD_AUTO_ENABLE:${PN} =3D "disable"
=20
 do_configure:append() {
-    install -m 0644 ${WORKDIR}/defconfig ${B}/.config
+    install -m 0644 ${WORKDIR}/defconfig ${B}/hostapd/.config
 }
=20
 do_compile() {
     export CFLAGS=3D"-MMD -O2 -Wall -g"
     export EXTRA_CFLAGS=3D"${CFLAGS}"
-    make V=3D1
+    make -C hostapd V=3D1
 }
=20
 do_install() {
     install -d ${D}${sbindir} ${D}${sysconfdir}/init.d ${D}${systemd_unitd=
ir}/system/
-    install -m 0644 ${B}/hostapd.conf ${D}${sysconfdir}
-    install -m 0755 ${B}/hostapd ${D}${sbindir}
-    install -m 0755 ${B}/hostapd_cli ${D}${sbindir}
+    install -m 0644 ${B}/hostapd/hostapd.conf ${D}${sysconfdir}
+    install -m 0755 ${B}/hostapd/hostapd ${D}${sbindir}
+    install -m 0755 ${B}/hostapd/hostapd_cli ${D}${sbindir}
     install -m 755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/hostapd
     install -m 0644 ${WORKDIR}/hostapd.service ${D}${systemd_unitdir}/syst=
em/
     sed -i -e 's,@SBINDIR@,${sbindir},g' -e 's,@SYSCONFDIR@,${sysconfdir},=
g' ${D}${systemd_unitdir}/system/hostapd.service

