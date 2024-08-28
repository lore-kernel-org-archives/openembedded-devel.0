Return-Path: <mark.jonas@de.bosch.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBE4AC5474A
	for <webhook@archiver.kernel.org>; Wed, 28 Aug 2024 07:22:10 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.78])
 by mx.groups.io with SMTP id smtpd.web10.7765.1724829720565611728
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Aug 2024 00:22:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@de.bosch.com header.s=selector2 header.b=kpGmDLMt;
 spf=pass (domain: de.bosch.com, ip: 40.107.21.78, mailfrom: mark.jonas@de.bosch.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g09HZdYDrK4SS6sNGQH1BQaSHESfbKbc8ZmxbLf3O/5BAfQPaNvNv41ASySlghKbFlqsdLZ0Kp9Vx1Bqa+lIzuw2NnTvxGqI65SIUyEsPpUONa1fw6cynOMiezuj+uXfKIhaD+7NqkT0G/8IM8R7xUkhqXs34wWL4eEZM31X3iVSIgNEWKlnMFex/KVwepd2BKjJhDcgRkh3mkweDlohkbBno4Cj82zwk3URLR+T6vu7prvUD2GavBukJ0IbXoqvos2MOE45HUHjZMy+ELjjt46SoXlb6Ophazox9EIqqYryqs3aRm+diqkMh7usECLZ52SDM/BS7+KC5XUrsjPGlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bH/sAYcVGrQeYmsouK8smfLyshMvsMk0J5A5Bg0dqz8=;
 b=ndjtUhzA8/qronZTW1XKnhi8haNQU3wTvWP8cphIidz7sacoAk8zwV4cFlGkto6eJax4U3MtgbbZQGn6s6jrTqEYok4kUUo9PxFQUWKc7HqPbK0mC1sBuRu9u4mZYYR+MTAnDv+dpMkZKDzksU8Mge8BAARXY9qcj/ehuMd0QYuYqxK+RbFVLlipxxfOBA93i5Y8qPN+y1RmPZAXIhQiFsnXtglUJz3dpt3W74JVF6YAg/e2Ti7RXepIetm30TS2h2H5zij+KRvVeQKoYZ/plKeWmZ7ZT8LRpPslXolcd4er32jEDy/wncoZ+uKkaoaC4eKEroTCq8Fl3iohlHr9jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.205) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=de.bosch.com; dmarc=pass (p=reject sp=none pct=100) action=none
 header.from=de.bosch.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bH/sAYcVGrQeYmsouK8smfLyshMvsMk0J5A5Bg0dqz8=;
 b=kpGmDLMtA8AdW2qUnDabGkxoOv/oTfHjsO6z/JnVu90FObpJsr3ar4z8YW12Ar39gF4V3L4VLF994A6Z1RnMfn7KvQGhFcQH43fZbefAQUuTYV0joGLIBijKWFUXEmGn4SbEIW+yaBGSS2KLHym1SIQ5NplFlhZ/fWSmikbvfMMRNgDvjKHDVIBIOJSWEdMBdU7YxzUnO+L0l+E6Hz+KcIXVvx77Rw5RhmOfVr/pkxldmEoAgBcQ1d3aqWzKDQPkC8xUR3Ur1YC5EpwoD+mkeUVYA8BBfST7iOSfPAQAUwPxxxputSwEF86eVBqGVdu2fTyEntIz9b8/Q/QuCvIWFA==
Received: from DUZPR01CA0311.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4ba::12) by PA2PR10MB8364.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:414::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.27; Wed, 28 Aug
 2024 07:21:56 +0000
Received: from DB5PEPF00014B90.eurprd02.prod.outlook.com
 (2603:10a6:10:4ba:cafe::84) by DUZPR01CA0311.outlook.office365.com
 (2603:10a6:10:4ba::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.27 via Frontend
 Transport; Wed, 28 Aug 2024 07:21:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.205)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.205 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.205; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.205) by
 DB5PEPF00014B90.mail.protection.outlook.com (10.167.8.228) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7918.13 via Frontend Transport; Wed, 28 Aug 2024 07:21:56 +0000
Received: from FE-EXCAS2001.de.bosch.com (10.139.217.200) by eop.bosch-org.com
 (139.15.153.205) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 28 Aug
 2024 09:21:46 +0200
Received: from GRB-C-0009M.ot.de.bosch.com (10.139.217.196) by
 FE-EXCAS2001.de.bosch.com (10.139.217.200) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 28 Aug 2024 09:21:46 +0200
From: <mark.jonas@de.bosch.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <raj.khem@gmail.com>, Ricardo Simoes <ricardo.simoes@pt.bosch.com>, "Mark
 Jonas" <mark.jonas@de.bosch.com>
Subject: [meta-oe][PATCH] magic-enum: Upgrade v0.9.5 -> v0.9.6
Date: Wed, 28 Aug 2024 09:21:38 +0200
Message-ID: <20240828072138.3032-1-mark.jonas@de.bosch.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [10.139.217.196]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B90:EE_|PA2PR10MB8364:EE_
X-MS-Office365-Filtering-Correlation-Id: f6553d51-6105-46d1-fffb-08dcc7321901
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?fZq66Poc927Tv4mTmNTHEiTqcDQSO+HVwQvA6NxOg8nGocm2umkfPWB/mNtd?=
 =?us-ascii?Q?ovRdfuuHPVg9APxqGofNWFJbzwZvyM2GIVPELKDjQvgWgQADo4EleLZvnM9h?=
 =?us-ascii?Q?OI0RjuyrWaZrSMemxyjWU/VhRKojxhEMWG7dusHum341Kg3NRhT1f2akxcz6?=
 =?us-ascii?Q?+QlKketX1+7MoeZRG3CHuC0AfK0t/XLLHCwVJD4+LImlFNhhObxQZ2vZPOkl?=
 =?us-ascii?Q?t1Z/rfiY5v2hhYn/nw9iIwwevIciKoY1W/uT7Ei6wCxCbM2wXj3+5xlE+GvZ?=
 =?us-ascii?Q?J2recTCEdkQh96g31oUYwT7Ub3j24IxL7puR/LRWJNYUa+NBMzMoLvLhflxc?=
 =?us-ascii?Q?QZmAOSbJ1Zi2kQhlZocs/Cdmy8jlE9tVc8MXZ2UiSVwCd9aGd+tDPWV+PAK2?=
 =?us-ascii?Q?CS64oqdmQ/hQj5f3CEeYvT4nRQ3HCHfzbHIeKv5jR+i7ELs/DOWjAhe8QLA0?=
 =?us-ascii?Q?hmEX0OVxuWVz6vbZS0wZytpADriewkcQQ1/V/J2c49rH/AFl+Ip38kT9jPLr?=
 =?us-ascii?Q?D5KOTw9NrWs40hXGwtzla1+sclymiy11vWGuUWoNCLVxfDIfzyMsc5636A2C?=
 =?us-ascii?Q?4sNB4zZjlBglaqGFnaBSMOmSg7kVUKuHQ5o0WtqsIeg+mTpda8b4yzkhONQX?=
 =?us-ascii?Q?mN63k8l/my/2N87Qy/aiu181f5AlEhOYW47VQEKJiRhtAjJ+wWnVCf6V9L1Z?=
 =?us-ascii?Q?t9AbCcS+O62XjpEXPEaylIDDMxQOoafLESoGbHKOH+5K91Zti4RQdfj8rT7X?=
 =?us-ascii?Q?jaz75JZoRR6BNdFmAo68seWFG/GSKyQfMm6Z3xxQwKV1WshnajP3wpZ46k9O?=
 =?us-ascii?Q?8pU+59UnbcMWcDHlEstWra3mmvN4hS7tpb7S7oNtwi7TKvRlzzmZIKe6M8WW?=
 =?us-ascii?Q?WOLI3vecp1GXJUr2R7r5scBYN2kOUFZiYAVZJt78FTTH0k7UiqlhMJE5v2cQ?=
 =?us-ascii?Q?2ZplcG1Y/ZJYSsFNOsZ106dWpKysqaPkae7K9smS/U3xf11u89QU4NJbbPCc?=
 =?us-ascii?Q?171rDvSpMJAliUSs0S/zLrL8xGk5T1zMibfhVdt8I3wHBHejmJoye+yLHhHu?=
 =?us-ascii?Q?luoUJXBgwIjidYsvr+r0L3KfQ4oWDIMpl4xRPQgMvIiBLDc5Dbd3NSdCnPgn?=
 =?us-ascii?Q?Q720NLUUl4qs/sFXxoWjMvnnKOlZ9WfnIB4PxTEDukGo7sZAFfYt0mgIE/q1?=
 =?us-ascii?Q?/ljSqpgTUKFOOBAN4IEIIXiLH9MUzGNRGleVrGFo1tIgyYPicYD//5Qjjwxz?=
 =?us-ascii?Q?6nDfhrm3/lPUJF2pP7j6kB8Jbv3an7BAVabuA1nRVVeYxrlqlKdKGdQRMcVy?=
 =?us-ascii?Q?dI90FmcDEvQtsD5Soau0XtafHMSHKeSq3obPcHvhJji/5r9DZb/yHJiki9Ut?=
 =?us-ascii?Q?+vHhNLlNqmyyvIMkNXe3pgOfM6xdxqzo7gPhE2eX5cyCohT8rg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:139.15.153.205;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2024 07:21:56.0684
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f6553d51-6105-46d1-fffb-08dcc7321901
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.205];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B90.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR10MB8364
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 07:22:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111978

From: Ricardo Simoes <ricardo.simoes@pt.bosch.com>

In version 0.9.6 issue #362 was fixed. Thus, the tweak in the compile
flags is no longer needed.

The checksum of the LICENSE file changed because the copyright range
was updated.

Changelog: https://github.com/Neargye/magic_enum/releases/tag/v0.9.6

Signed-off-by: Ricardo Simoes <ricardo.simoes@pt.bosch.com>
Signed-off-by: Mark Jonas <mark.jonas@de.bosch.com>
---
 .../{magic-enum_0.9.5.bb =3D> magic-enum_0.9.6.bb}           | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-extended/magic-enum/{magic-enum_0.9.5.bb =3D> magic=
-enum_0.9.6.bb} (83%)

diff --git a/meta-oe/recipes-extended/magic-enum/magic-enum_0.9.5.bb b/meta=
-oe/recipes-extended/magic-enum/magic-enum_0.9.6.bb
similarity index 83%
rename from meta-oe/recipes-extended/magic-enum/magic-enum_0.9.5.bb
rename to meta-oe/recipes-extended/magic-enum/magic-enum_0.9.6.bb
index ee547f634..01a134a5b 100644
--- a/meta-oe/recipes-extended/magic-enum/magic-enum_0.9.5.bb
+++ b/meta-oe/recipes-extended/magic-enum/magic-enum_0.9.6.bb
@@ -9,14 +9,14 @@ BUGTRACKER =3D "https://github.com/Neargye/magic_enum/iss=
ues"
 HOMEPAGE =3D "https://github.com/Neargye/magic_enum"
=20
 LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Db15f48588464ec8ef87d2b560aad2ca=
a"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D7e7717cf723eb72f57e80fdb651cb31=
8"
=20
 SRC_URI =3D " \
     git://github.com/Neargye/magic_enum.git;protocol=3Dhttps;branch=3Dmast=
er \
     file://run-ptest \
 "
=20
-SRCREV =3D "e55b9b54d5cf61f8e117cafb17846d7d742dd3b4"
+SRCREV =3D "dd6a39d0ba1852cf06907e0f0573a2a10d23c2ad"
 S =3D "${WORKDIR}/git"
=20
 inherit cmake ptest
@@ -30,9 +30,6 @@ do_install_ptest () {
     install -m 0755 ${B}/test/test_* ${D}${PTEST_PATH}/tests
 }
=20
-# Workaround for bug 114970 reported for gcc 14.1.0
-CXXFLAGS +=3D "-Wno-error=3Dunused-value"
-
 # Add catkin and colcon (ROS build system) support
 FILES:${PN}-dev +=3D "\
     ${datadir}/magic_enum/package.xml \
--=20
2.34.1


