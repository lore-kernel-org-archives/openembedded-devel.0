Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 055C0C5B543
	for <webhook@archiver.kernel.org>; Sat, 31 May 2025 11:00:35 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.39])
 by mx.groups.io with SMTP id smtpd.web11.3640.1748689232928352476
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 31 May 2025 04:00:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@leica-geosystems.com header.s=selector1 header.b=AcdvW4I2;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 52.101.69.39, mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gJMMGGfps0iGeKQdQCdzfzA/sQ+uRFxxEXLn4K3dY/Q/5/Xn2Kvl3Gq6k8ZGtqehncGzyrgxqbcOqXpXChXVmlZmBJwtEH1YhCNgVXfn7ffNiWoi2Igiy1TTSxPZddvmxSxKN1aGX6Qu8rR7/u3gt9B+p+YjN8ug09B1ZbQ+w8pex/EUHy4yCHT6cxDDDxv21aGUjTYwj3NzPPbSrw09Xhl+uo8oMCJCgqWGsm5FRyH4f9QDGVgs8bvVDoVOhct3Rqd4UICBUeo9gZYRaOUOF3PH19ogX5IN4ixWZMI8cq/okBzB3pBelJ+PbiQHs8KLxLYcws+OXNDFPvxqsamkPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zTbSjCocZzKk+q0H2kJSq4rsRTPgJmnppInWTkyWLJU=;
 b=kSKaKktlRSqscoOtAOjFSmNeg4GXm7clxB+6QGgQuiJAy6VC07NHNbkv5psKbNCehRRSDC9cES86YYS7Hh0LJ6mfb2YwW1ajTzeH29HB6AueI26rJhkrfJU+b1RGp67S9l0nCQVfjIKPrhcRwHrPeF5j34zAnqD3kxsK5LppQ9wc888WtsLT11A9MIzNigu7lDk+yb/tRcmTb8PElPUURWANmL+Y6wzc5qsP38Jmgal0yp3BI6SbOOxdKjn+l2ASJYloA69GPltZ9sKh7bI3bOCN4/F9ZuNTTMAvWJkIBqWgeuUD76eUQIqe7lkEAJ/Zq1+972bOExgkMCWhDFtqJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zTbSjCocZzKk+q0H2kJSq4rsRTPgJmnppInWTkyWLJU=;
 b=AcdvW4I2tm5K9ta2a4uH5bHmIxE0iVsgv7PVYWXsq+AdwLwZm4XuwTMte5BhbS+7N4UKiHniIoUBoXjMYy7pVbjQJcYxEfumVoUZu61sqfmRyiPErpFLO3s2VS63ipXki2XWsmcW//Oor8Y3egE83wyvuGQD78Kvr6bbbESF4L8=
Received: from DB7PR05CA0056.eurprd05.prod.outlook.com (2603:10a6:10:2e::33)
 by DB9PR06MB7754.eurprd06.prod.outlook.com (2603:10a6:10:251::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.32; Sat, 31 May
 2025 11:00:27 +0000
Received: from DB1PEPF0003922F.eurprd03.prod.outlook.com
 (2603:10a6:10:2e:cafe::13) by DB7PR05CA0056.outlook.office365.com
 (2603:10a6:10:2e::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.26 via Frontend Transport; Sat,
 31 May 2025 11:00:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.94 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.94; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.94) by
 DB1PEPF0003922F.mail.protection.outlook.com (10.167.8.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8792.29 via Frontend Transport; Sat, 31 May 2025 11:00:27 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.60.34.116]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Sat, 31 May 2025 13:00:27 +0200
From: Johannes Schneider <johannes.schneider@leica-geosystems.com>
To: openembedded-devel@lists.openembedded.org,
	raj.khem@gmail.com,
	mikko.rapeli@linaro.org,
	erik@riscstar.com
CC: bsp-development.geo@leica-geosystems.com,
	Johannes Schneider <johannes.schneider@leica-geosystems.com>
Subject: [meta-oe][PATCH v1 0/3] add support for building "system extension images"
Date: Sat, 31 May 2025 13:00:19 +0200
Message-ID: <20250531110022.3843938-1-johannes.schneider@leica-geosystems.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-OriginalArrivalTime: 31 May 2025 11:00:27.0059 (UTC) FILETIME=[37421830:01DBD21B]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF0003922F:EE_|DB9PR06MB7754:EE_
X-MS-Office365-Filtering-Correlation-Id: c02ca171-c477-4b91-3080-08dda03259f2
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?lRnpSz/lg+bPzm3YDh1udTodExro6Z5yS2Q71XSfibEufLo3mi4f7XCyhaT+?=
 =?us-ascii?Q?1oG+ZWeSKguJbYHQcn55lNQXWSq0fw3AjYUcqvPRqr5m3th1v0CyRv2UvSIz?=
 =?us-ascii?Q?1LJdiG1YgED9EenWjFwpyNUXNUO09OEsoR6P2npOyc7UWlcKKq5Xwq0Eci8X?=
 =?us-ascii?Q?Gc3S5g4P20vcR83C5FwlMberYHsgjXJ8aI+UeQKljnKr/nX9R5ZjU4az7/f0?=
 =?us-ascii?Q?gHJ7JXzkeMYJdhadua7/rfTpQ6Mh1AZYpUGG0CrOp7xNhFrx/JTum6VP5+Rp?=
 =?us-ascii?Q?oGl2yZuMY1w4j8+OT26Gz+DRMsqSNYgRzb9QAIWkHR/wjKSHsQrcIiN4WD/Q?=
 =?us-ascii?Q?N9OlhQT7FDwPwDJ7sPmgJd3zCKFayDzfOYgk5l0/dZPijgLrYW9dOftGZtZY?=
 =?us-ascii?Q?NNvg7UDaGE27zz9vfr/TM7xfJKaNJgiAsYUsCf9RgAKTnOVERF88/uYFiQn2?=
 =?us-ascii?Q?KkPxIO9CFiTIwXVV39i2+9zXVo7LPtbfeSA1XgLNdV9XaPz0eL36xX1vuiMa?=
 =?us-ascii?Q?QjAJfuxFKkYvb9E0H3kgtC/X5an11eXXTsfpRS4mux72ilYZkhe1sw9zIih+?=
 =?us-ascii?Q?Py/RHUKfszdK9gQoC4n08WYIHls5Ku0SaFobU/Iz2UwZTpAn218I7Hf5C9Qa?=
 =?us-ascii?Q?rb4QaGNwGk4BCpFsGZNzQFHQJ88l7qP6wQyQq55qgCtizPNJB5vbKH+6fNW/?=
 =?us-ascii?Q?asYZOOOlAJ2GwCP/alNmS7ShfPG/yz05HSTAqfRhldCEwuIEQOwlE2TRtkSJ?=
 =?us-ascii?Q?RpH1p2ob1bwjgryAv6UIWs8IXn0mOP/CJLZxkalbCh0wFkluQssRl4YtD8uk?=
 =?us-ascii?Q?WeDc1pNneT+YbSNkR5As2cN1nmLXg+Naf5sZg1Q47msdT3xW0UiGRIh8f4Hq?=
 =?us-ascii?Q?7nzOQdWu/l7WgDq4zdvGeL492zhS2YjxPvs9AQ5WiKSOkrZcumFWkndiol0y?=
 =?us-ascii?Q?8gAKTY1/yGI+Gf/JcG7kJZYfIon+xBYSTE/VSHGh2FKefJYscCxU4kcdy079?=
 =?us-ascii?Q?b+qCAQIQ7s8in5mDKSbQsgXFybfGEPoLgK2ITRgoyEtMaHXlliXu4J6vnX84?=
 =?us-ascii?Q?z2Nkgqgs9UZNfgnM3pFfcnucvgE9qe9/LWqO+NzpSTtyuMoby9fmVgjJir7I?=
 =?us-ascii?Q?hmS5qxxQ9IbLE5lSKT4ZRIZSBdLYH2pdnUDhTSel0HTsBXfpwUrvITJPYKEc?=
 =?us-ascii?Q?R1jjM5+yxUdBerFfjsAtfhpgQf5VsGH4stIer7H2HQ+24IG7D5DTKMSUNr5D?=
 =?us-ascii?Q?pYjTMAL19nMLofUkQ7rJBbcSCwW94Rhl3UDvQVFyMe5YeE6t63KQUNOEXyRS?=
 =?us-ascii?Q?QxNTmy8N7pN4IjR4/mAbMJKYNWcPmVbWEkyAH1RzVycpMP/ke09Jdf6c0NnR?=
 =?us-ascii?Q?A+546OrKUMPHPceai5HDq4IgufBGnkYRjTilcfNbOCNveU9oPu7tKcfE/f7c?=
 =?us-ascii?Q?2Lx0eUxBtXvpw3uynYOYhS08VL+YlqtLHmNJyq6lX0wUuXNjvTMm8Q=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2025 11:00:27.3699
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c02ca171-c477-4b91-3080-08dda03259f2
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF0003922F.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR06MB7754
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 31 May 2025 11:00:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117678

This patch-stack adds support for building "system extension images" to met=
a-oe - to quote the man-page [1]:
"The primary use case for system images are immutable environments where de=
bugging and development tools shall optionally be made available, but not i=
ncluded in the immutable base OS image itself (e.g. strace(1) and gdb(1) sh=
all be an optionally installable addition in order to make debugging/develo=
pment easier). System extension images should not be misunderstood as a gen=
eric software packaging framework, as no dependency scheme is available: sy=
stem extensions should carry all files they need themselves, except for tho=
se already shipped in the underlying host system image. Typically, system e=
xtension images are built at the same time as the base OS image =E2=80=94 w=
ithin the same build system."

Link: https://www.freedesktop.org/software/systemd/man/latest/systemd-sysex=
t.html

These patches are added to meta-oe - instead of oe-core - because systemd-r=
epart-native requires 'cryptsetup' to build discoverable-disk-images with v=
erity and optional signature partitions - and cryptsetup is currently only/=
still in meta-oe.

Note that erofs-utils and systemd-repart-native have to be of a recent vers=
ion, to support features like compression and signing through PKCS#11 (e.g.=
 as provided by the classes/signing.bbclass)

As an example consider this simple image recipe:
SUMMARY =3D "An example image to showcase a system extension image."
LICENSE =3D "MIT"
inherit discoverable-disk-image sysext-image
IMAGE_FEATURES =3D ""
IMAGE_LINGUAS =3D ""
IMAGE_INSTALL =3D "gdb"

After building, the resulting 'extension-image-example-*sysext.rootfs.ddi' =
can be deployed to an embedded system (running from a RO rootfs) and 'merge=
d' into the OS by following steps:
place a symlink into the systemd-sysext image search path:
$> mkdir /run/extensions
$> ln -s /tmp/extension-example.sysext.ddi /run/extensions/example.raw
list all available extensions:
$> systemd-sysext list
and enable the found extensions:
$> SYSTEMD_LOG_LEVEL=3Ddebug systemd-sysext merge

