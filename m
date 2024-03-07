Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1F32C48BF6
	for <webhook@archiver.kernel.org>; Thu,  7 Mar 2024 15:59:40 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.87])
 by mx.groups.io with SMTP id smtpd.web10.26838.1709827178673470231
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Mar 2024 07:59:39 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=lBf8QTmn;
 spf=pass (domain: axis.com, ip: 40.107.104.87, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O+DmQI+vWRDQ9ER6c+b695rWR/p/DLUbQBoKiM/qgsBK3jvnt9Kytl7GrpFma4FYgNyjGmAnB3J2UPDSn+75kgftOGEoLiZwavBD9hVKLOZWs/nLSGD/i7ugbBTzpPaRqk8FGgUSbHyoM8HcwA6oshyLodCFOIPbBz8yOcChCD0+VpdCEUbsvN0fMrAVzxMc+yQIou35WmpJBDrftXwIpTmAABfACd4LKKk6zNHqIRFnHwAYd+P+r5ICkWtdK519GzdeLUsBuzOaFjviCvm/zs4BIb+TFSyXecP3JPP3Uk5cfQu7R1cpcsNlBtai2OXirMtjVQGDv/5Bd2p9tDYaKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=heJXi0l/WV+izQKBG/xYQAGR4Vx9N+gjqZa/hMK/lOk=;
 b=epXenU/bxBduS6dQSCfxKmatZSP1Q3qYsl4jh4rpBYRUP/NgzckL3iNvI9Ax1k/JDOJn5hifbsZxTt+4dGM6+PC4pPIuemJdlvtGh7NALElaQEyOXY0QMHGn0tFbONTFtVyhplRixJk5F8w4pF9oIIYquoSAiKcOk4+YCJDrx/0x2I6CvIBw9u3Ue2tm2DYLzxUfPzmRd2r3I3Y+K+8+6rnmSgnjjpi8PF4sYoV7j4qnX0iU0fPBErISRtllNszsXGc9uOGqBctgTgq2ceWhD7ThhbMPAk5Qlm1+UFaelQQTBNdJFhnaW/TWJ83LDAWHyiIvJUYYT8cvgmHIY6u5ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=heJXi0l/WV+izQKBG/xYQAGR4Vx9N+gjqZa/hMK/lOk=;
 b=lBf8QTmnUWcLGXq5MtvgVxt+1sxpm81ctWsM6ZnVg8NqjGG5ihvqTreLaI0Z1t2arP5u3oyo0XgWHn706/JV9w6sm5cpm4Cn6w4Sp8ciE2WWxy45SRqD7SvGGpxXqTu4+vCCKzV55MM3YrdfpVEBULuFPkP7YNjHivKt/OAaH4w=
Received: from DB7PR05CA0057.eurprd05.prod.outlook.com (2603:10a6:10:2e::34)
 by AS8PR02MB9139.eurprd02.prod.outlook.com (2603:10a6:20b:5b3::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.39; Thu, 7 Mar
 2024 15:59:35 +0000
Received: from DU2PEPF00028D11.eurprd03.prod.outlook.com
 (2603:10a6:10:2e:cafe::bc) by DB7PR05CA0057.outlook.office365.com
 (2603:10a6:10:2e::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.39 via Frontend
 Transport; Thu, 7 Mar 2024 15:59:35 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=axis.com;
Received-SPF: Fail (protection.outlook.com: domain of axis.com does not
 designate 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com;
Received: from mail.axis.com (195.60.68.100) by
 DU2PEPF00028D11.mail.protection.outlook.com (10.167.242.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Thu, 7 Mar 2024 15:59:35 +0000
Received: from se-mail02w.axis.com (10.20.40.8) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 7 Mar
 2024 16:59:34 +0100
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 7 Mar 2024 16:59:34 +0100
Received: from saur.se.axis.com (saur.se.axis.com [10.92.3.10])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id CB21815D4C
	for <openembedded-devel@lists.openembedded.org>; Thu,  7 Mar 2024 16:59:34 +0100 (CET)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur.se.axis.com (8.17.1/8.15.2) with ESMTPS id 427FxY5o3626432
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 7 Mar 2024 16:59:34 +0100
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 427FxYu03626431
	for openembedded-devel@lists.openembedded.org; Thu, 7 Mar 2024 16:59:34 +0100
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] libnice: Disable the examples and the tests
Date: Thu, 7 Mar 2024 16:59:29 +0100
Message-ID: <20240307155929.3626419-1-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D11:EE_|AS8PR02MB9139:EE_
X-MS-Office365-Filtering-Correlation-Id: 40f9f29c-cb10-46a9-387e-08dc3ebf95d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	SH2c2rREYk0pDZ9/AH9hLkIYmw0D3e89K0GPNVK7l66MBpRxhgEnlX6RyXMLs/jxYqlJn62Xb5BSc460nE7+NX3KvKHXPtWnlVQEEV/nj+6+NtxP/rctp5XmzBfRxe5cVnhT9Whfz6JRMrbtb9mbRbjGUyW/XSmmj7n/QqsKT5QgU+8KmSjcC2W739PIp7gJP81k1SyF3zpDdVmOxtK7VEAe9monnzT2kQSctNntu8JvHMUeMXUyCiypH+1FWMs2wmUSo32kF7INx9m7snTKTDOZA48s0slb+7F1s5pQJU+q5NXX38gSHxf5a9vX+WmcDI0ZzfqzctO0SpqlgatZuLJ/HGyBRdannmEvASZshnEWCoxJetmWyIdaYvYL8r9xGKcoP8Z5//uuJV0h8ikqwmda2Mbrd2zkWMaTl1GIU6Kl4S+hYIL8fZOL66PQrj2b8D0FfO1roimnoUdmBJmwLm0XNV13+dqPif5KlGLppTujMZfFnMtBfbIEpdDs8NOrF6FOIS00inYb0+WTKlQgcGJRxaWBJw/RLl+ITR5qOJoqoRN8HsKNWlveRZriQQeLGnCpPyJfSEzs8U5RM/krp6xqYLQNTkfYS1MMwaawaBg8/zB/ntS8s5f8TmVz7UKFv2UoFW1CdFiXtqfWGTDVHheY6G7fkQOlPg2wHxyTR7DoNUpDOrmtfacN6tXoPYEHN5N22+L09NHT6CRyvJGluLeFyKbpiHvCg1uSMo04Kx3mhalYQw5MUTakKzVG7Zkr
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(82310400014)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2024 15:59:35.2506
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 40f9f29c-cb10-46a9-387e-08dc3ebf95d6
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D11.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB9139
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Mar 2024 15:59:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109199

They are not used, and if the `gstreamer` PACKAGECONFIG is enabled, the
tests require gstreamer-check-1.0 to be available, which it isn't if
gstreamer-1.0 is built without the `check` PACKAGECONFIG.

Also remove adding -Dgstreamer=3Ddisabled to EXTRA_OEMESON as it is
already covered by the `gstreamer` PACKAGECONFIG.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta-oe/recipes-support/farsight/libnice_0.1.21.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/farsight/libnice_0.1.21.bb b/meta-oe/r=
ecipes-support/farsight/libnice_0.1.21.bb
index 4a5227f20..646dcb28c 100644
--- a/meta-oe/recipes-support/farsight/libnice_0.1.21.bb
+++ b/meta-oe/recipes-support/farsight/libnice_0.1.21.bb
@@ -18,14 +18,14 @@ PACKAGECONFIG[gupnp] =3D "-Dgupnp=3Denabled,-Dgupnp=3Dd=
isabled,gupnp"
 PACKAGECONFIG[gstreamer] =3D "-Dgstreamer=3Denabled,-Dgstreamer=3Ddisabled=
,gstreamer1.0"
 PACKAGECONFIG[introspection] =3D "-Dintrospection=3Denabled,-Dintrospectio=
n=3Ddisabled,"
=20
-EXTRA_OEMESON =3D "-Dgstreamer=3Ddisabled"
-
 GTKDOC_MESON_OPTION =3D "gtk_doc"
 GTKDOC_MESON_ENABLE_FLAG =3D "enabled"
 GTKDOC_MESON_DISABLE_FLAG =3D "disabled"
=20
 inherit meson gtk-doc gobject-introspection
=20
+EXTRA_OEMESON =3D "-Dexamples=3Ddisabled -Dtests=3Ddisabled"
+
 FILES:${PN} +=3D "${libdir}/gstreamer-1.0/*.so"
 FILES:${PN}-dev +=3D "${libdir}/gstreamer-1.0/*.la"
 FILES:${PN}-staticdev +=3D "${libdir}/gstreamer-1.0/*.a"

