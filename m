Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7494BC7115C
	for <webhook@archiver.kernel.org>; Sat, 21 Jun 2025 20:46:56 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.26])
 by mx.groups.io with SMTP id smtpd.web11.14960.1750538811329813006
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 21 Jun 2025 13:46:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@leica-geosystems.com header.s=selector1 header.b=b7w9sXPn;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 52.101.70.26, mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CeMAb0wMEUOBXRLEnZRRdY9mnetjRKJ9uUejr+kmNLoLdQT4d0oIZzEsMQysVtcsanKlGCaiq4Yh+cvghEMTIueYHwz12id8X56YXx7dQFX4rod5Y1qYKBguyJ53/dh8YCXG+xqYCn0xlbM6ysYWgv1eboUb0yZYJvxQbOho2fXjagS6XVu1AFaEnLZJ5UfzL+gAiGR0Bwr80iXDhdpv0T6MXuU4/vD2ssX0CL49KtNCEPnNCWC73Y0W8Lh5Ytzox6mF2Ny7XlfoTi5b3XNUGhphjul0IxlHQDnAYVk15/mgXBnrhhN9FMvnr3B9H6K7vbrGU3evO1z7Z2GmqUzA8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HSVMrCAZlj6kIlTcuq1MezlyHQYo1LnK+NFwaYGKveE=;
 b=Vm+PNAGp6aMao4McnVOXdyrgzh44HIp83kVSDWvLNQEJWGeN4ZAPH0J3ARyvnGx8go0Y1ic8suwi9U6IeifkwBfL7EpdNruxFpUY1v0DsiQGgTmwSsbdoisotvtDWNidJAKJz0fjw5+jW1AQVtza914dPuArYYO1p0jxXwJaKe96nEAe3+7/EvFa8pETkZgRJqaj+zUnRbXFTTrdjaLDI2KdvsFtbZ0Ew+dNFbaw6vRvc6ghYdLyptipqRRvEQP9G1R3fbEsSDRqqblptMv7ygEGP5QRqEPA/9oKZJ7I7YKm+f4IUi9qU7+nZ6mEQ7AAaV11ar1QLdnmwtcGTcOO7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HSVMrCAZlj6kIlTcuq1MezlyHQYo1LnK+NFwaYGKveE=;
 b=b7w9sXPng6+E0ayF4z1TBYiT7GJFusLVPCf0sOOPKCL6pmHacSVlwhmlbYBODgQMFxqq6ImynezqYnWDNLJgK/EQzVNQIuS7+LYzWZh2izqG3Wv7QtwKPU5HOa296OHy3bOT9DVAlN6eYBm7mR8B83txHUj6kFIGzMBkndxEwz4=
Received: from AM0PR03CA0011.eurprd03.prod.outlook.com (2603:10a6:208:14::24)
 by VI1PR06MB6701.eurprd06.prod.outlook.com (2603:10a6:800:182::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.27; Sat, 21 Jun
 2025 20:46:44 +0000
Received: from AM4PEPF00027A6A.eurprd04.prod.outlook.com
 (2603:10a6:208:14:cafe::a1) by AM0PR03CA0011.outlook.office365.com
 (2603:10a6:208:14::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.27 via Frontend Transport; Sat,
 21 Jun 2025 20:46:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.94 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.94; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.94) by
 AM4PEPF00027A6A.mail.protection.outlook.com (10.167.16.88) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8880.14 via Frontend Transport; Sat, 21 Jun 2025 20:46:42 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.60.34.116]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Sat, 21 Jun 2025 22:46:42 +0200
From: Johannes Schneider <johannes.schneider@leica-geosystems.com>
Subject: [PATCH meta-oe v2 0/3] add support for building "system extension
 images"
Date: Sat, 21 Jun 2025 22:46:27 +0200
Message-ID: <20250621-discoverable-disk-image-v2-0-52df3053fc1f@leica-geosystems.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-B4-Tracking: v=1; b=H4sIACMaV2gC/1WMsQ6CQBAFf8Vs7RE4ZeGsPLA1MbbG4oBFL4pLF
 jQmhH/3tLOcvHkzwUDiaYDNYgKhlx88PwLo5QLqq3tcSPkmMOhYpzHqRDV+qPlF4qo7feGmfOe
 CZjBxWZaaKlkjhHcv1Pr3r3yCjkanmOAchla4U+NVyP3Cdp8fjjHuiyzVSW521u50geXKGIvpu
 sRVUaK22z8toqf00sQY9cJNxM/xznyLau5gnj9E88JA0wAAAA==
X-Change-ID: 20250621-discoverable-disk-image-961a7759b146
To: openembedded-devel@lists.openembedded.org
CC: =?utf-8?q?Enrico_J=C3=B6rns?= <ejo@pengutronix.de>, raj.khem@gmail.com, 
 mikko.rapeli@linaro.org, erik@riscstar.com, 
 bsp-development.geo@leica-geosystems.com, 
 Johannes Schneider <johannes.schneider@leica-geosystems.com>
X-Mailer: b4 0.14.2
X-OriginalArrivalTime: 21 Jun 2025 20:46:42.0625 (UTC) FILETIME=[98344310:01DBE2ED]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A6A:EE_|VI1PR06MB6701:EE_
X-MS-Office365-Filtering-Correlation-Id: c3c93b26-c2f3-43ec-1ec4-08ddb104bacf
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?lSZ4i/U8wPTZQ759iAeZlQFBSTvUZGXS3i1DcfIxN+dvGS/s+xsZJiA/NJ/u?=
 =?us-ascii?Q?v3dVgR/GkhGuZzzfMOowVz1mEOShbEdxoXNipvTeLqmFCwn4LlN3r28eni8B?=
 =?us-ascii?Q?5Ju0WdE1zhdw1UKE2HKY6ZZFFFY+MXuOKXsKrQBCwqej2hpDPGc8sUfG3cQQ?=
 =?us-ascii?Q?VCj67O+zgt1tRe1UIuVOglUKLb7fGcurS11W8b8oqPNZLHWO3MUPIm55pH6s?=
 =?us-ascii?Q?ch/5jOiN+4ltCodO2pAeNNUwj3fxXnJiteqOWKW7nVxlP3UDzBnyCC8RqVbU?=
 =?us-ascii?Q?NAfJeXZzaUaUQov49XcWOUkkiQ/c9N4/irzbtEOziQyx86deLo0anmcx3T0/?=
 =?us-ascii?Q?n0tvcAVc2pVmA5NN95EtBY3fyVQ071RrBoEqreMlNRF2d49dxZSmHEs8KAkB?=
 =?us-ascii?Q?sRNL4anDrGIDzr/5J9z342dMJX+XbKN1eWS1+ibZfKYMuU7YsjbTNFFKR6l9?=
 =?us-ascii?Q?cxSdFBL/71Rkv2ZodDYEZbOdTy6LRaG1R8vfioORNy65JzirYvHgU5T5gSRT?=
 =?us-ascii?Q?AgjPe7yKt+TcfDbukhgBpHt5Z22QLawU4VdmHmkzltIN02moIk3+NqRryuKs?=
 =?us-ascii?Q?QaueoskV5BzOp6Py42iP75ab4XE2s0ewyB1Mt5C80ne8u08jWOOL1cYsQEaK?=
 =?us-ascii?Q?39sh2pk8CdxI8ADC2erXJfCEe6QwCJ76YoVFdIiLl3cWwmruAQLaGR5oFeKE?=
 =?us-ascii?Q?L8WuR7w6zFIydljdq5XxwFXhZ1Z5K4xTMJ/UM4IvZiehE3f63Ei3ZBIiTUJ+?=
 =?us-ascii?Q?8HXpaoD6vbfZATttQh5iGUksq32+6luohZvSIMXZYTMw3IOwy6v7OKOid6am?=
 =?us-ascii?Q?7sJIEdgRmkeYbefNHjk2KfryN7DhpO2inaqSS2yiBBrO6hffAXZnlCkm6fBh?=
 =?us-ascii?Q?SOBnih+WniWMmp++b2vjiRCJj8lIvkRsQ2hnh1ZW/Tw/SE3h2e19Pf4JatAs?=
 =?us-ascii?Q?tJu67KVGHLiM/kfbfFuOsD/zwSz9gLSgDPnRaUn7nKR9Ikm/3Cse0L2S9Dnz?=
 =?us-ascii?Q?B0C313qKgdqh0G+CJzdW6MY74z5oUbu00+CaCdnWIeDXsY3jcZFI0NwOLrir?=
 =?us-ascii?Q?GRXMgHaQIEKLIqzVehwp0ZIVqoqFNO5+I8zqDUgyYCS/bF4cC54dQMILWxRO?=
 =?us-ascii?Q?DRY+gjNU+e4kP44R48bnmRGqfB9Smasy0oOdtg6/e1zWRUdfXR+oXDVoA16l?=
 =?us-ascii?Q?Covs0flHQ+6aEsEuLP2W+C5mwCziAbApvIZ/+ecsTnwfFMmuMUCmZsqjjnh3?=
 =?us-ascii?Q?3mQxkk+gmsPEvJ8LGfhaR8HAqWHX7r6PzBfIKWa3+5Cf34px0SR7qnzcEKnB?=
 =?us-ascii?Q?sSosG3+TCQAJ3Gr4lmnrx8Tsb236+iAKEoA4OfZG2fQtoU/1m8VeNLJJOFb3?=
 =?us-ascii?Q?Dp//Y2iEFb2Jxf+ijgQe0TfkpcfMlAYml5CScLpxHEkjKQZdwtaDNiYs6Ut4?=
 =?us-ascii?Q?B+U1WRWpn11DgWTaWmpK34nfIYZyyMm+7lUV1FN8oVXoae/IaWVMzg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2025 20:46:42.8248
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c3c93b26-c2f3-43ec-1ec4-08ddb104bacf
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00027A6A.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR06MB6701
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 21 Jun 2025 20:46:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118015

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

---
Version history:
v1: initial submission
v2: extend inline documentation with examples and clarification
---

To: openembedded-devel@lists.openembedded.org
Cc: Enrico J=C3=B6rns <ejo@pengutronix.de>
Cc: raj.khem@gmail.com
Cc: mikko.rapeli@linaro.org
Cc: erik@riscstar.com
Cc: bsp-development.geo@leica-geosystems.com

---
Johannes Schneider (3):
      systemd: add recipe for systemd-repart-native 257.6
      classes: add discoverable disk image class
      classes: add a systemd-sysext image class

 meta-oe/classes/discoverable-disk-image.bbclass    | 137 +++++++++++++++++=
++++
 meta-oe/classes/sysext-image.bbclass               |  87 +++++++++++++
 .../systemd/systemd-repart-native_257.6.bb         |  59 +++++++++
 3 files changed, 283 insertions(+)
---
base-commit: 820047afe48a0d48056f4752defc3d2803c9d906
change-id: 20250621-discoverable-disk-image-961a7759b146

Best regards,
--=20
Johannes Schneider <johannes.schneider@leica-geosystems.com>


