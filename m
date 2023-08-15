Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2583C2FC14
	for <webhook@archiver.kernel.org>; Thu, 17 Aug 2023 12:04:28 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.98])
 by mx.groups.io with SMTP id smtpd.web11.143023.1692127003373040900
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Aug 2023 12:16:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ni.com header.s=selector1 header.b=Y0aYLZ7t;
 spf=pass (domain: ni.com, ip: 40.107.244.98, mailfrom: chaitanya.vadrevu@ni.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KW8I0jchKqL2vsHWmNDbr0SYhbbk0deYsCqNNpVq+Lxds7f6+eewZw4ND9hfCZ8fCGONgxruTvk2za5BTGTo99ItIxpJTZCOzZlvOt3m60wiVp931qeU++qw7lZWWx3N13wKud+kXpXAM4FxhOWYG/e9YxdY8zoD1+6Ah43d00Tvg3gdgnawtwhBecLW7ZgtYvq5N6U6/MAGpVIsSAv9hTSxPEvPHW6PueQlV5mPynxs9YU1V5O0Eh2RQN4U8G0bHXuO0MoIAxovLwPVp4GJklpZtEATEhrFKOLtjX2qJQlM4U7dSuzHGgOeDgOWhm3TYow9eNVgraBxPOu94oSUFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EAcRkUdaCSYEcU7cBpxXBQMZdtMjklIQWDyBKxBazLg=;
 b=Hjg5/O6IGYsMLEUV+kR13DqaMDVt3Q6NOT7hmgNJrAZdaToA/t39oKIORdVoFeg6CscOh9l2BIt5UJEinLCoCGT1yGSmjBW8HCer4vXcPna5Q9MRzk2CCPYTO9tC63VuHB+PSCRYDdx+vm6VUpN9AmIu4d4bm9yOR07tYgaAkzlSRcjAIedvo+VlrNHPX91Ui1FlrDDk5x38utKl45jhn3p7L2hxPcyNJgo9CnpABtt0n10f3ojuqX12LSKVXINvZ0oOy3bQb2H/4w3eCHti+ExtlEjWgO5ht1dMQgWNOY4BMNZFPfMvi6vdBeRP4wW3zDU4DEIUlMAOp13Bdfyt/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 130.164.94.73) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ni.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=ni.com; dkim=none
 (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EAcRkUdaCSYEcU7cBpxXBQMZdtMjklIQWDyBKxBazLg=;
 b=Y0aYLZ7trTi5CCIH1EBTErKLG/lTuJaZuuPZfgAmo21wlpk06sxcXu2NIDm/Fi8w/jDGE0sqachIFFaadw84/sTiedFAb+5f2N9FlFBFCpKxmAuaS8spNekxTFvSA5dU1zY6SAoFizRPHbNPhTbMFWdYaK717r7KWXtRkyFfJRM=
Received: from SA9PR13CA0072.namprd13.prod.outlook.com (2603:10b6:806:23::17)
 by DM6PR04MB6297.namprd04.prod.outlook.com (2603:10b6:5:1f0::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Tue, 15 Aug
 2023 19:16:39 +0000
Received: from SN1NAM02FT0029.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:23:cafe::d3) by SA9PR13CA0072.outlook.office365.com
 (2603:10b6:806:23::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.14 via Frontend
 Transport; Tue, 15 Aug 2023 19:16:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 130.164.94.73)
 smtp.mailfrom=ni.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ni.com;
Received-SPF: Pass (protection.outlook.com: domain of ni.com designates
 130.164.94.73 as permitted sender) receiver=protection.outlook.com;
 client-ip=130.164.94.73; helo=us-aus-excas-p1.ni.corp.natinst.com; pr=C
Received: from us-aus-excas-p1.ni.corp.natinst.com (130.164.94.73) by
 SN1NAM02FT0029.mail.protection.outlook.com (10.97.4.175) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.14 via Frontend Transport; Tue, 15 Aug 2023 19:16:38 +0000
Received: from us-aus-excas-p1.ni.corp.natinst.com (130.164.68.17) by
 us-aus-excas-p1.ni.corp.natinst.com (130.164.68.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 15 Aug 2023 14:16:37 -0500
Received: from cvadrevu-p620.amer.corp.natinst.com (172.18.68.32) by
 us-aus-excas-p1.ni.corp.natinst.com (130.164.68.17) with Microsoft SMTP
 Server id 15.2.1118.26 via Frontend Transport; Tue, 15 Aug 2023 14:16:37
 -0500
From: "Chaitanya Vadrevu" <chaitanya.vadrevu@ni.com>
To: <openembedded-devel@lists.openembedded.org>, <raj.khem@gmail.com>
CC: Chaitanya Vadrevu <chaitanya.vadrevu@ni.com>
Subject: [meta-oe][PATCH v2] recipes-bsp: Add bolt
Date: Tue, 15 Aug 2023 14:16:05 -0500
Message-ID: <20230815191605.1207311-1-chaitanya.vadrevu@ni.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CAMKF1sp3Nv+gQ0onYU43oj1YHzHuN+UGowkvWvqvxvY+z_1_Gw@mail.gmail.com>
References: <CAMKF1sp3Nv+gQ0onYU43oj1YHzHuN+UGowkvWvqvxvY+z_1_Gw@mail.gmail.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1NAM02FT0029:EE_|DM6PR04MB6297:EE_
X-MS-Office365-Filtering-Correlation-Id: d51a3a30-75c0-41c5-c593-08db9dc4262b
x-ni-monitor: EOP Exclude NI Domains ETR True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	0aKyoUMaLLl9aPNO+yCKTN0NdszgyKuw9G2iCD+mUpOrAuNu8jmJpQLDZ8OhjZRJ/LLrcGHdp13De6K80ZeGcfI1+wxpxE1fagdAM+Fp33kf6D2b3XMZ/kGllNeLcYv9jyty2jfq/otxSp4kBp4PVoiBZEpHVB0pWtur4CLRPGvl33r248ILdh0pUrLVZJ/gmYKl4TzMAtVmqHFmH+mrextdqvCGHx4OZOyuMWtyutYHp89ZoV8enb7oIVip0XmO8UDLZ2lUCdZdcZ/6MWXfHQ0F4WZLBXAGK+Id1n/KNhOk1PDySZb/pcb9VbIR+yLQi78jcbPlhqea6D3Sgi4LKss7Xs0ICg8wk2h925xS/6t90H6rgquL4uRSu3mparhcB1eVmZB8Ay4piC+NvE52NGZOGCdhubRVH0r4MxRudygdiBSdQirNOVK7DczS9Cv2GjXY6zkFFKOMhyRO6mfWg0VnC/fQnCFsfET3xjgJeJ5L1K/LiawFca53pIU8/ymdSqbddZvdLsuyzGXS8PptdONeDFqffgAIjFXUTLWCJ/gbjf6GKsXyICYe8b2cVa7spagzlQ0d6IxjnIj1QdwUnh/wYOfw39umNCL8oNdzt9roC93NQi8cb9EZme8qhGYGu45rp1z18+NA7HgYDglJheBBybLS68KLZ1ZmW/mmF3W7gMuGL7GUkLwMKDIMbtYRSLcLHg1ln2tBjRXN/aVrdtTEUhaCS5M7I5iOEQz2HlqsEM6eDur2ZSNaau9upw03
X-Forefront-Antispam-Report: 
	CIP:130.164.94.73;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:us-aus-excas-p1.ni.corp.natinst.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230031)(4636009)(396003)(376002)(136003)(39860400002)(346002)(451199024)(1800799009)(186009)(82310400011)(40470700004)(36840700001)(46966006)(26005)(1076003)(6666004)(336012)(40460700003)(356005)(70206006)(86362001)(36860700001)(36756003)(316002)(5660300002)(44832011)(47076005)(81166007)(478600001)(70586007)(40480700001)(8936002)(8676002)(82740400003)(4326008)(83380400001)(41300700001)(2906002)(2616005)(110136005)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2023 19:16:38.2142
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d51a3a30-75c0-41c5-c593-08db9dc4262b
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=87ba1f9a-44cd-43a6-b008-6fdb45a5204e;Ip=[130.164.94.73];Helo=[us-aus-excas-p1.ni.corp.natinst.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1NAM02FT0029.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB6297
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Aug 2023 12:04:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104459

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


