Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71DFDC001B0
	for <webhook@archiver.kernel.org>; Tue, 15 Aug 2023 06:10:18 +0000 (UTC)
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (NAM04-DM6-obe.outbound.protection.outlook.com [40.107.102.100])
 by mx.groups.io with SMTP id smtpd.web10.120070.1692049017196862683
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Aug 2023 14:36:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ni.com header.s=selector1 header.b=l9CcclSl;
 spf=pass (domain: ni.com, ip: 40.107.102.100, mailfrom: chaitanya.vadrevu@ni.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U7KTS93gAqbfrHmkDmxAi1ggdwkconUOAC+4X1LiioxCz9XsIdczXduwpQln1309lPjkq1iHIdU6cTN7OS0SFH04gjTzmEAiCgCJzbI+MblIIv1Nzx8kp5ULQFSOB9PxPQr5GX8mxfbo1MxFdOUOkL5AlxmzkpFom3j3L3NhnSUYbzd2Y7sEn5UYbq+h3k/u97EaHDUm7NWrFAWd00f1Fp2YZtFZIm5wI4sIR/xNcjO+3Eka7JkDawdu6qCb1Wr3jbJqUlLdoJAlb4t4t6SMEWrQE80Ss7I1SY9xW9at+NDOQqWOGUOuom+c7g36m7s7954V/j4HpaPOI3F8FHxBZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eL3SZVqCa4dD3+FwvXdIIro1pI5SeUnmGYM7wtrEtjc=;
 b=ZA+ZKJFOZQZV4MJLhnmKRRoavRwXukeIjP8CiBerVRzNP5RD7iuqZMVc+1rulcV9nvIaDTmmupy8tjMT7L09NVCyyZMJ0iPPZcaaHrPivETxzQPrZ+vUzfihCRWrEJPUT3cNmVlMVAY6q05vViI3omwzap3BqkFOQPi7UGZTlAuVHAleiEr8MXnJEUPme7WXpCZv8ooGFCbInbDeRjjtd8x8Ag1s7qt3Lsm7f+blTksRoayG4uVnLu7Wdp7n+t77snXdP+6DZ3MnQJXoTuiitwJDJv3cOzIC1c1zlzrRmbG6pO1d2A+OSn500yrU+UU08YyY+RL9yIiXnX+DDSsmpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 130.164.94.74) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ni.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=ni.com; dkim=none
 (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eL3SZVqCa4dD3+FwvXdIIro1pI5SeUnmGYM7wtrEtjc=;
 b=l9CcclSl4N/ERAshtlEkpEm7FiCQeVm7LF/375nCptrF+5Cb1X4G41bwkPGZA5ZUpdpQOUgjNgSJanZXR/BmDiOZCDgkzt6T4ufxnnSiUrW3eAIK20U/U4Zx8azeaWIMv+f4qktxSXn4DozqJhJ2Sp2juTbQCT7xf15n0A5rIU8=
Received: from SN6PR01CA0008.prod.exchangelabs.com (2603:10b6:805:b6::21) by
 SJ0PR04MB7360.namprd04.prod.outlook.com (2603:10b6:a03:293::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.24; Mon, 14 Aug
 2023 21:36:52 +0000
Received: from SN1NAM02FT0056.eop-nam02.prod.protection.outlook.com
 (2603:10b6:805:b6:cafe::1e) by SN6PR01CA0008.outlook.office365.com
 (2603:10b6:805:b6::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.33 via Frontend
 Transport; Mon, 14 Aug 2023 21:36:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 130.164.94.74)
 smtp.mailfrom=ni.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ni.com;
Received-SPF: Pass (protection.outlook.com: domain of ni.com designates
 130.164.94.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=130.164.94.74; helo=us-aus-excas-p2.ni.corp.natinst.com; pr=C
Received: from us-aus-excas-p2.ni.corp.natinst.com (130.164.94.74) by
 SN1NAM02FT0056.mail.protection.outlook.com (10.97.4.111) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.14 via Frontend Transport; Mon, 14 Aug 2023 21:36:51 +0000
Received: from us-aus-excas-p1.ni.corp.natinst.com (130.164.68.17) by
 us-aus-excas-p2.ni.corp.natinst.com (130.164.68.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 14 Aug 2023 16:36:51 -0500
Received: from cvadrevu-p620.amer.corp.natinst.com (172.18.68.32) by
 us-aus-excas-p1.ni.corp.natinst.com (130.164.68.17) with Microsoft SMTP
 Server id 15.2.1118.26 via Frontend Transport; Mon, 14 Aug 2023 16:36:51
 -0500
From: "Chaitanya Vadrevu" <chaitanya.vadrevu@ni.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Chaitanya Vadrevu <chaitanya.vadrevu@ni.com>
Subject: [meta-oe][PATCH] recipes-bsp: Add bolt
Date: Mon, 14 Aug 2023 16:36:31 -0500
Message-ID: <20230814213631.535375-1-chaitanya.vadrevu@ni.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1NAM02FT0056:EE_|SJ0PR04MB7360:EE_
X-MS-Office365-Filtering-Correlation-Id: bfa066d6-cdfd-4d7a-851c-08db9d0e92b5
x-ni-monitor: EOP Exclude NI Domains ETR True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	fYiyn1AnSEfk+fPyb8rPFHSxGljjlUVK40VpVt1IFfoQkHoPdD6qolaHy6k77Gf280jqQ5H9cxi7A2xbqJiYgBeodyRtJUbm/bohJBmtlW2hXkUXEtoCeNYr70DUO9FYg+xtTqDeWI8tAQec0jTROBZK8TTKQb4UoVqB1nNfc1gzJXeeQ7Ro5EkoW85cawkLiiFESSuhd9Vwp9kyTyP+MYwiUNXjPREyARh28o3iGSBi5IGzGm4pv8b9//2Y0c4uoDykaYFCvPu6UthgpiwUlaCN9BmK4ytIuqNj6ZyAzTN/uZDhFm/z7eco/XztUMwADO1/2dA5zUInF6KQ1pAQEYF6IGlUEbgxc7LDq2boLS/Ao3RgAKQ0Y/vcIYmeUzM5mrc60EeZcpIF85xLMHJOUMBVmj5JwNr1e6QPlCLbkw5opstDmd0tiHY0AOppYCsGn6xCADnWPztOxqQo9XCuyOlb5fOkHIXX9YigAYJNa28Qh9TRJsMR7N3GZwdKFtaOt0q05/0ZM3ta0SYMAe/31H44f4e4hcdAaZDgydhWM3U3a4Qg4KrqTEJ4pe1WZ/iZSBxWanhLApQebtevBqEgVd7+d33ueU23pr1vuohfXbwFyG3u6RcOPRa7swgcXCw9trQnUhiH2rLK3PXyl5hdG459b4vYZC2Y+uDgOs7kV1o3atzd3yQ+GC6XNBrNGq4Kft/l0hYM88RNaQBRbO/AMR0m8gaaSFB7LbBO1MBRY6WWsPz82E3MQU8SdDeBhhmc
X-Forefront-Antispam-Report: 
	CIP:130.164.94.74;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:us-aus-excas-p2.ni.corp.natinst.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(396003)(136003)(39860400002)(82310400008)(451199021)(186006)(1800799006)(36840700001)(40470700004)(46966006)(36756003)(5660300002)(86362001)(2906002)(44832011)(40460700003)(40480700001)(36860700001)(6916009)(4326008)(316002)(70206006)(70586007)(41300700001)(26005)(1076003)(2616005)(336012)(47076005)(8936002)(8676002)(6666004)(83380400001)(356005)(82740400003)(478600001)(81166007)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2023 21:36:51.9061
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bfa066d6-cdfd-4d7a-851c-08db9d0e92b5
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=87ba1f9a-44cd-43a6-b008-6fdb45a5204e;Ip=[130.164.94.74];Helo=[us-aus-excas-p2.ni.corp.natinst.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1NAM02FT0056.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR04MB7360
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Aug 2023 06:10:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104355

bolt is used for managing thunderbolt devices.

Signed-off-by: Chaitanya Vadrevu <chaitanya.vadrevu@ni.com>
---
 meta-oe/recipes-bsp/bolt/bolt_0.9.5.bb | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-oe/recipes-bsp/bolt/bolt_0.9.5.bb

diff --git a/meta-oe/recipes-bsp/bolt/bolt_0.9.5.bb b/meta-oe/recipes-bsp/b=
olt/bolt_0.9.5.bb
new file mode 100644
index 0000000000..f9f1b026f4
--- /dev/null
+++ b/meta-oe/recipes-bsp/bolt/bolt_0.9.5.bb
@@ -0,0 +1,16 @@
+SUMMARY =3D "Thunderbolt user-space management tool"
+DESCRIPTION =3D "Userspace system daemon to enable security levels for Thu=
nderbolt on GNU/Linux"
+HOMEPAGE =3D "https://gitlab.freedesktop.org/bolt/bolt"
+LICENSE =3D "LGPL-2.1-only"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd255951079008b364516=
c"
+
+DEPENDS =3D "cmake-native udev polkit dbus"
+
+SRC_URI =3D "git://gitlab.freedesktop.org/bolt/bolt.git;protocol=3Dhttps;b=
ranch=3Dmaster"
+SRCREV =3D "5a8a5866a847561566499847d46a97c612b4e6dd"
+
+S =3D "${WORKDIR}/git"
+
+inherit cmake pkgconfig meson
+
+FILES:${PN} +=3D "${datadir}/dbus-1/* ${datadir}/polkit-1/*"
--=20
2.34.1


