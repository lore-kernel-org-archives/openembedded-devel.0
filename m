Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41D8CCEF15C
	for <webhook@archiver.kernel.org>; Tue,  8 Oct 2024 11:55:51 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.67])
 by mx.groups.io with SMTP id smtpd.web10.7340.1728388542008375763
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Oct 2024 04:55:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=CkmXKvrE;
 spf=pass (domain: axis.com, ip: 52.101.70.67, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FjsMCoX9xpsDyH8TnOCR1Vtzl/1kMCJbbX3OjFXr3/LndsCRnlnqGopHfulApR4SRIeQUufHNwP5PVROn1tSg1wkyfBXJsSiKDx1GO8YVL3UEQkecCD/vuPK46SAE01jQTDjzAUjPh0Tolp/LKRH+VUAHUNc5HeJOqxoQqDp6YQc/EYA4id09WVyI48EC0T9wItX31+fFwUV+pmGd9k1ORbuaTFaPctUlBho2Al3Oc/kApcsJdA9k7f/EnR7CF4kW3OJ/tbNSi6k+HCITIY7lulJiKOFYpoNym3cZg+NfZsB0adtAYupU0V0oQxYiwd9hcQgvGjHeQlWG3F5lSYXhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R1VBGFguWWBtuxhqqVFacwhoXxcHikt5bIN2Dh/Kd6I=;
 b=ZzW43pWc5ApDx4wEKUU3d20AQK0LroPgwv0V5oGg8v/X4sXJp+buFLywpSeVrqS30oudmCuVKBIxexubH+Xe7yuLQukH8mgRLe2/CSKlZkup3DGQa7MAXLUx6JRoRSx5FPIm0wu6tgkloN0MzfEZ5+p8O2NPik//TcZNmgqdbEGck7+jwZUcRlRnMNEWX3EGYus+00ttBfkgNjgjA4y8ubaB9NhTJbNWSGzHf0/PrWvf9+jK+PSjNMnxYWuZNYI/Xrois0SDyzxuI6IfEYC8sIffLPmZhT2ZnHnfSfd/MuPa4ZfQvsiR9TpKFSHOC2KKrNqyjBtGSUxe1l6YRBEFWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R1VBGFguWWBtuxhqqVFacwhoXxcHikt5bIN2Dh/Kd6I=;
 b=CkmXKvrEDguir/NzTbkCY7g6yjYrCeTXTXrOMlUYnW25jl2YZBtBu9+xJ98NUTomLvNrHyZXIDr7NOxBSjTGd140w3tKLxktsn+WmsWtyfJakrZsbqWPCTJ8vjXxUaw4VkhFZudv+Wlw+DnotZG6K+oDV11alDvfbNznqxqgm+Y=
Received: from AM0PR05CA0085.eurprd05.prod.outlook.com (2603:10a6:208:136::25)
 by VI1PR02MB6288.eurprd02.prod.outlook.com (2603:10a6:800:190::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16; Tue, 8 Oct
 2024 11:55:35 +0000
Received: from AMS1EPF00000047.eurprd04.prod.outlook.com
 (2603:10a6:208:136:cafe::cc) by AM0PR05CA0085.outlook.office365.com
 (2603:10a6:208:136::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.34 via Frontend
 Transport; Tue, 8 Oct 2024 11:55:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AMS1EPF00000047.mail.protection.outlook.com (10.167.16.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8048.13 via Frontend Transport; Tue, 8 Oct 2024 11:55:35 +0000
Received: from se-mail01w.axis.com (10.20.40.7) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Oct
 2024 13:55:34 +0200
Received: from se-intmail02x.se.axis.com (10.0.5.60) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 8 Oct 2024 13:55:34 +0200
Received: from saur.se.axis.com (saur.se.axis.com [10.92.3.10])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id C8B5B259
	for <openembedded-devel@lists.openembedded.org>; Tue,  8 Oct 2024 13:55:34 +0200 (CEST)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur.se.axis.com (8.17.1/8.15.2) with ESMTPS id 498BtYlf931386
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 8 Oct 2024 13:55:34 +0200
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 498BtYqp931385
	for openembedded-devel@lists.openembedded.org; Tue, 8 Oct 2024 13:55:34 +0200
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH 1/1] lvm2: Remove the lvm2-udevrules package
Date: Tue, 8 Oct 2024 13:55:25 +0200
Message-ID: <20241008115525.931363-1-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000047:EE_|VI1PR02MB6288:EE_
X-MS-Office365-Filtering-Correlation-Id: c11b61f2-2fa4-4462-fbf4-08dce7901ea0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?rjt3yv4NQAmey/NaAlPbmc8akJ6VBKYKsdiOCb8s2jw1av+iajiIrajqyjbj?=
 =?us-ascii?Q?FqIPkfmlNSQqpNMHoutjapOiMCUm32cBeO18KBFcn2tjQu40qBomohCXfaC+?=
 =?us-ascii?Q?QSuO1LTmJeSih0SDW1tSOjKxYRuW27NGXSjt4HGsX4oob8XU3NuxXcrcduLs?=
 =?us-ascii?Q?nyrAVETtBBEgX2orKUfbCC8YIpECUhWR/ygZj+iX7hmZ3a7HtW1wY1qWo5dj?=
 =?us-ascii?Q?6nFOGpgER9acvjGoOUtZ4VLK/NIPW8JNIQs+fjZGvMO+r/liqii8BQTwKlKi?=
 =?us-ascii?Q?CFCf4wC4Kl3ZZjMF0+Jknd1smRcAPvcDXnVY0MMeYtoZ+w2apBUcuJS6p/XK?=
 =?us-ascii?Q?SVWlVdUvX8zPZQXenNPy3ggKJj0yzVbEow9wZ+WcyzB6PjT0U9pg0zkXjVt8?=
 =?us-ascii?Q?C/f2wm7PObFC/OO3wqwZeu25QtG7V71QnFlg3TRD4XHJczPawlzDDTy/ZZpx?=
 =?us-ascii?Q?jTXNQVPVN6dXlPO39qOMMduZWXVCZOeEUKwBqwc6MRw4sQ+GltZcOfuM766O?=
 =?us-ascii?Q?5/Zi2mYUGei9UvduilbjPSAbYAo1RwF4KpcsYUAZPTD+oE9jmXVsCYK6Q5Rd?=
 =?us-ascii?Q?NO8Nlkvsg/LuDD7qRSK8MgOp426WJ2n1bsWKKBw9n08ceRTH0NpXdp+RBUY6?=
 =?us-ascii?Q?3uraGy0Y0K+i7DRMxvm3HUkENzjGYicdhgsr49n6lssx3PraT3dBA/NM0ePC?=
 =?us-ascii?Q?T04Uz6IlDfBpC1//4IZc1jOHsHbLnghYoHdS6Gs6OHyyuxVYImTsbE74oKpB?=
 =?us-ascii?Q?fgbBhejMRJAE4nCwzzgU2KgYbQ7mChQkoF0iGTkJUzE3my2j/rrLkmdMJXvV?=
 =?us-ascii?Q?qzZeBD9M6h9rsBxFkl9zlEg5TKKWEKGO1mJiF4bimHLwKFDfMMJgFWoeU1sz?=
 =?us-ascii?Q?rvFCXtDDUC1by4y0Iwnw1ITpjInV/XDMTnKPdixpppWN9bkVLtG0hC0lNSdE?=
 =?us-ascii?Q?7LrxOXe1FUBrPg0AC64RtAKIz6eCG6flDojR3CP7lcRAbybNXp6DOAkWD2lW?=
 =?us-ascii?Q?395BstcvTKdokOditkcUF7GxpfoBTsLA0WlS2+MLN2z3D39r1wbWEN2SgErq?=
 =?us-ascii?Q?UTYoG3Kj7fvlIckX/DdOPc3n2cSfnHsNtMn/PhSM3JuQE3huGzAY8zx7nflm?=
 =?us-ascii?Q?gOT9q8q7OypYsrzu5vtWujFB5qUE2U4DNlJ/G4OxPqQFymgLSXrjEorVVXlv?=
 =?us-ascii?Q?NJekq//k9IwZlpYtvGEVDpLsPKZWF32QCyGMKds4RdsE/A5hgOd10RdJWGva?=
 =?us-ascii?Q?FZi38DWVk4bslvV0X3UtkmlRcM8hg2mH4H7hl4wzRIZL9DhB4U9JDnitkJ7i?=
 =?us-ascii?Q?oT2Q125d9baLphsOUplx9tZt2RzMpA4vAoVXEyTNMZtrUbv++ztU7mmpsRCm?=
 =?us-ascii?Q?/Zsvwyw=3D?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 11:55:35.4628
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c11b61f2-2fa4-4462-fbf4-08dce7901ea0
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF00000047.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR02MB6288
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Oct 2024 11:55:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112710

From: Fredrik Hugosson <fredrik.hugosson@axis.com>

Add the specific udev rules needed for device mapper notifications to
the libdevmapper package. This is needed to get notifications for
device mapping to work with systemd.

Move the remaining udev rules files to the lvm2 package as there is no
real reason to have them packaged separately.

List all udev files explicitly in the FILES variables so that someone
will have to make an active decision where to package any new udev files
added in the future.

Co-authored-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Fredrik Hugosson <fredrik.hugosson@axis.com>
Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta-oe/recipes-support/lvm2/lvm2.bb | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-support/lvm2/lvm2.bb b/meta-oe/recipes-support=
/lvm2/lvm2.bb
index f1a1aae2cd..f905a5ac9e 100644
--- a/meta-oe/recipes-support/lvm2/lvm2.bb
+++ b/meta-oe/recipes-support/lvm2/lvm2.bb
@@ -57,13 +57,16 @@ LVM2_PACKAGECONFIG:append:class-target =3D " \
 "
=20
 PACKAGECONFIG[dbus] =3D "--enable-dbus-service,--disable-dbus-service,,pyt=
hon3-dbus python3-pyudev"
-PACKAGECONFIG[udev] =3D "--enable-udev_sync --enable-udev_rules --with-ude=
vdir=3D${nonarch_base_libdir}/udev/rules.d,--disable-udev_sync --disable-ud=
ev_rules,udev,${PN}-udevrules"
+PACKAGECONFIG[udev] =3D "--enable-udev_sync --enable-udev_rules --with-ude=
vdir=3D${nonarch_base_libdir}/udev/rules.d,--disable-udev_sync --disable-ud=
ev_rules,udev,"
=20
 PACKAGES =3D+ "libdevmapper"
 FILES:libdevmapper =3D " \
     ${libdir}/libdevmapper.so.* \
     ${sbindir}/dmsetup \
     ${sbindir}/dmstats \
+    ${nonarch_base_libdir}/udev/rules.d/10-dm.rules \
+    ${nonarch_base_libdir}/udev/rules.d/13-dm-disk.rules \
+    ${nonarch_base_libdir}/udev/rules.d/95-dm-notify.rules \
 "
=20
 FILES:${PN} +=3D " \
@@ -71,7 +74,13 @@ FILES:${PN} +=3D " \
     ${systemd_system_unitdir} \
     ${PYTHON_SITEPACKAGES_DIR}/lvmdbusd \
     ${datadir}/dbus-1/system-services/com.redhat.lvmdbus1.service \
+    ${nonarch_base_libdir}/udev/rules.d/11-dm-lvm.rules \
+    ${nonarch_base_libdir}/udev/rules.d/69-dm-lvm.rules \
 "
+# Remove /lib/udev from FILES:${PN} so that any new rules files that are a=
dded
+# upstream will have to be explicitly added to either FILES:${PN} or
+# FILES:libdevmapper.
+FILES:${PN}:remove =3D "${nonarch_base_libdir}/udev"
=20
 FILES:${PN}-scripts =3D " \
     ${sbindir}/blkdeactivate \
@@ -79,11 +88,8 @@ FILES:${PN}-scripts =3D " \
     ${sbindir}/lvmconf \
     ${sbindir}/lvmdump \
 "
-# Specified explicitly for the udev rules, just in case that it does not g=
et picked
-# up automatically:
-FILES:${PN}-udevrules =3D "${nonarch_base_libdir}/udev/rules.d"
+
 RDEPENDS:${PN} =3D "bash"
-RDEPENDS:${PN}-udevrules =3D "libdevmapper"
 RDEPENDS:${PN}:append:class-target =3D " libdevmapper"
 RDEPENDS:${PN}:append:class-nativesdk =3D " libdevmapper"
=20

