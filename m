Return-Path: <chaitanya.vadrevu@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAF4FC07E8A
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 18:35:10 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.97])
 by mx.groups.io with SMTP id smtpd.web11.168357.1692210905532472429
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Aug 2023 11:35:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ni.com header.s=selector1 header.b=NBS7dvvg;
 spf=pass (domain: ni.com, ip: 40.107.94.97, mailfrom: chaitanya.vadrevu@ni.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NOo0ejUI65TNxNbpdDe3oQ7PWxsHsQoIbKHYFCvtUqUJYwGNM/Y+2U7UOkXtX1Bn82WUb2sHK7gqXxcsCXL4Ou5GLXErC/7sQKAwgETEUFzee33FUHSoVcIy4jz2K204wI1F+t4A8iDnVvPMXBMLsw1REzlMJ9EIL5eeDX4QGKj3BV5tuFo2Ru9y3QAeygatlE7gzmy3d9fAKFa/OuHkTakKwHY+BUJUaVQgwu8WcStq1uoMVOgBGrbfgI9C5av14RujKa8zC7Iiz6NvgI0DTglYvsgBFOnJ7s/Q20iJ8TtsIEDuTpGe+o7Nv1pHJCt4eR1AGwrsDv4ujd64TaBvHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EAcRkUdaCSYEcU7cBpxXBQMZdtMjklIQWDyBKxBazLg=;
 b=isJAKcZ2yIOMbu6dIi/o0dqNs3+NepQVYuCXMs98y8DZOi1Ri7m/CnvOaIgf/OXXxnMiXTh2SaPU3zCJkULS+ejp7Jz3BfN/Abx/S6IPWe+xYR7IRFwHd2yM2IHOWAjb353+MCrLU7ydWMiJfoEwNXuJTLJoq6TVo5QU3f2XC07HxGssXIrEas6c9dxdzNjzml/au/OQqoE7zyDJQUC7SolPvS5xhXu+VoYCFggEscnIa/+iblhU+q/54C9jtgUmrr6SkdUXipKDbeGuRw6058klvzXyY49exKob2c+LwteF+5lZwOdmpTZ1ap22ZfiCyPzLD22R8xUsZoz9QpQ89g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 130.164.94.74) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ni.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=ni.com; dkim=none
 (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EAcRkUdaCSYEcU7cBpxXBQMZdtMjklIQWDyBKxBazLg=;
 b=NBS7dvvgCsdv/GHKH6D05pXlXTasJZldg1709cvJgFp0d/dgoMK9brqRXMeGGaa6kShcmoBA4PNBXpMcBWiNc7mJeckZ9DoqORexPbZHH3eAWpDybv5fF4U6RNVKgfT4GgbvBe++8gtbHR129ybuX0tfMHpMJ9tK8wIYeudg/qM=
Received: from SA0PR13CA0010.namprd13.prod.outlook.com (2603:10b6:806:130::15)
 by MN2PR04MB7133.namprd04.prod.outlook.com (2603:10b6:208:1f0::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.30; Wed, 16 Aug
 2023 18:35:02 +0000
Received: from SN1NAM02FT0056.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:130:cafe::34) by SA0PR13CA0010.outlook.office365.com
 (2603:10b6:806:130::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.14 via Frontend
 Transport; Wed, 16 Aug 2023 18:35:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 130.164.94.74)
 smtp.mailfrom=ni.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ni.com;
Received-SPF: Pass (protection.outlook.com: domain of ni.com designates
 130.164.94.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=130.164.94.74; helo=us-aus-excas-p2.ni.corp.natinst.com; pr=C
Received: from us-aus-excas-p2.ni.corp.natinst.com (130.164.94.74) by
 SN1NAM02FT0056.mail.protection.outlook.com (10.97.4.111) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.15 via Frontend Transport; Wed, 16 Aug 2023 18:35:01 +0000
Received: from us-aus-excas-p1.ni.corp.natinst.com (130.164.68.17) by
 us-aus-excas-p2.ni.corp.natinst.com (130.164.68.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 16 Aug 2023 13:35:01 -0500
Received: from cvadrevu-p620.amer.corp.natinst.com (172.18.68.32) by
 us-aus-excas-p1.ni.corp.natinst.com (130.164.68.17) with Microsoft SMTP
 Server id 15.2.1118.26 via Frontend Transport; Wed, 16 Aug 2023 13:35:01
 -0500
From: Chaitanya Vadrevu <chaitanya.vadrevu@ni.com>
To: <openembedded-devel@lists.openembedded.org>, <raj.khem@gmail.com>
CC: Chaitanya Vadrevu <chaitanya.vadrevu@ni.com>
Subject: [meta-oe][PATCH v2] recipes-bsp: Add bolt
Date: Wed, 16 Aug 2023 13:34:37 -0500
Message-ID: <20230816183437.1903299-1-chaitanya.vadrevu@ni.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1NAM02FT0056:EE_|MN2PR04MB7133:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ae222e1-b5fb-4c80-7594-08db9e878071
x-ni-monitor: EOP Exclude NI Domains ETR True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	LwpRMQ7OhjIt+DMJ6DguAZUSmLw6ykRVR4xFelfPJilL7UAyUAvSgfYdwiZ0IgtUael6qSqgQzSm+HO9yCe4+0KIqJQaP3DYkSseQbvm4T9L5n2Fq3f7fuj54eO/wn/PW1Zrby25GeUyMboXW85egC2KWn1oT8ANGnDaIkaZ/n01qxN9yhXcvqrV7QaPiN8ByyeEk/UPgV/BDbMjfajjuEDjsMmct+ckClQQuO1zBf7hrNjgovg81l6Q/oYDbR9Lj0Kwt3DDgOTrldl/lAD0vfx5VgpXzeGCfOrdyYguYo/wQp+fagoZ89LZ/fqx4meV9xUzbS0/gKa4RQllRLOyg1zAc/ZQtW0nN8ESITGvnvOktYnWoLDaEGUu6OrJkciDxyO59cgfdq43x3NQiphPR65Xjj46phcjJBaB8/r2k0LWrEf19eoQJBmDvQzAj9HXo7d1DQOREhep/lAGbe5fZVs+EqyNhXxDp4zBSy8FRyBV+ROP9XGUADvBdpgpsHJfoUs5vdk9LVwKX/eqEdEAnT5UJ5oJey0CtP2XjOf7qWfK/VKobnsnvnT6RVFnJeJ452DmRGDV5kLovJIDSwAqixiWZ/1JKCUTGM6JcSY6EzYlKCkhlg8oG/RmajrG2cEhqJSsR5BkLLE127uHdebHrlMNAz6BCoSm+Rpdr8uOZoog/ChWKxdxqaRtGPWazZXm+rsrfXLkeSZXESNwhh1y043rdHZJAXfdMr4djjuP0omGIGSPz6jhXvzZOz26KDPi
X-Forefront-Antispam-Report: 
	CIP:130.164.94.74;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:us-aus-excas-p2.ni.corp.natinst.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230031)(4636009)(396003)(346002)(39860400002)(376002)(136003)(186009)(451199024)(1800799009)(82310400011)(46966006)(40470700004)(36840700001)(36756003)(86362001)(40460700003)(40480700001)(83380400001)(8936002)(4326008)(8676002)(5660300002)(2906002)(41300700001)(1076003)(26005)(6666004)(2616005)(44832011)(36860700001)(47076005)(336012)(110136005)(316002)(478600001)(82740400003)(81166007)(356005)(70206006)(70586007)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2023 18:35:01.5281
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ae222e1-b5fb-4c80-7594-08db9e878071
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=87ba1f9a-44cd-43a6-b008-6fdb45a5204e;Ip=[130.164.94.74];Helo=[us-aus-excas-p2.ni.corp.natinst.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1NAM02FT0056.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB7133
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 18:35:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104439

bolt is used for managing thunderbolt devices.

Signed-off-by: Chaitanya Vadrevu <chaitanya.vadrevu@ni.com>
---
Changes in v2:
 * Removed redundant cmake-native from DEPENDS
 * Set REQUIRED_DISTRO_FEATURES to polkit as polkit is always needed for
   bolt

 meta-oe/recipes-bsp/bolt/bolt_0.9.5.bb | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta-oe/recipes-bsp/bolt/bolt_0.9.5.bb

diff --git a/meta-oe/recipes-bsp/bolt/bolt_0.9.5.bb b/meta-oe/recipes-bsp/b=
olt/bolt_0.9.5.bb
new file mode 100644
index 0000000000..b6ad6337ce
--- /dev/null
+++ b/meta-oe/recipes-bsp/bolt/bolt_0.9.5.bb
@@ -0,0 +1,19 @@
+SUMMARY =3D "Thunderbolt user-space management tool"
+DESCRIPTION =3D "Userspace system daemon to enable security levels for Thu=
nderbolt on GNU/Linux"
+HOMEPAGE =3D "https://gitlab.freedesktop.org/bolt/bolt"
+LICENSE =3D "LGPL-2.1-only"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd255951079008b364516=
c"
+
+DEPENDS =3D "udev polkit dbus"
+REQUIRED_DISTRO_FEATURES =3D "polkit"
+
+SRC_URI =3D "git://gitlab.freedesktop.org/bolt/bolt.git;protocol=3Dhttps;b=
ranch=3Dmaster"
+SRCREV =3D "5a8a5866a847561566499847d46a97c612b4e6dd"
+
+S =3D "${WORKDIR}/git"
+
+inherit cmake pkgconfig meson features_check
+
+FILES:${PN} +=3D "${datadir}/dbus-1/* \
+                ${datadir}/polkit-1/* \
+               "
--=20
2.34.1


