Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57389C7115C
	for <webhook@archiver.kernel.org>; Sat, 21 Jun 2025 20:47:06 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.20])
 by mx.groups.io with SMTP id smtpd.web10.14978.1750538815773840661
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 21 Jun 2025 13:46:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@leica-geosystems.com header.s=selector1 header.b=MFISNh5s;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 40.107.159.20, mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PuthH5+JOdvGl0z6mUogms7bhn1uJ8Ptsn5ohpqMHE13hGBGAGE7BErFkk2+N24WUVDijh75DhgIxuvZmuSPBNIsFgXNrGk2ACQAzGk0Av+JO9xzF4rWA2CuMasSLA6nTM37ki95FXL+wiieTmQ6epJ+ycj6OcQVddRiRZw4Z7jY7CmjBqb9WlnFJZlJq4uONp7GXgfJOB8rKrHUbGd0WmmZ5PWqzhUH1jScedJrJZh6vC9IDVGvRoPWYq7UAm6qjVdwItwCOlW5HX8YlyXcXgTqDZa4jno2MgIgRqyxppR7ekqNQ03cyLx3JS0bqOgDOvZSl7x0M5FEdTulBuHqyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bz5PraUsv85pzidLV0l80cuwqvMCjQmxFASP9y1EonM=;
 b=Oac1KgkG3Px23R/WDG8ehdMKxgPJ4OtdHbcT3B19kRjcFZ8iKVnL9Ncpd/xhltIm9Ha41TDuRQGPKKOqu3TrzVKnGNppn8D1fPqDRZA8O4ExxIicdiQPVKRxGfZbOtEeavv7eN7gT1n3s+ae6Ac31/0niAz2lItjZO4GeRkqY2wPCkoiarF8VtJcJCuNKKnFXIr5P4CIJm0TD2f+tfr9n5hwL2f6ZdB8nDl9+tEp767Y7fhimIeL/DDlTND6iOnmXqd63TP9/DX+1nlUKIy0xoN1AyYKf5CvPYiPE7oD/oUEo0rhSHsBGPcZJMxAhlYBv6QntHGnf/ET53XTFCVUdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bz5PraUsv85pzidLV0l80cuwqvMCjQmxFASP9y1EonM=;
 b=MFISNh5sAV8PE/vwfKioquPSV/sT374QzK2kZxYh1up7Qkh84c7tV08z/Z3vWoLq7efbYtDdl58sNrC8PLv4YHt5ti6guoi9WDt9IQsqkaifJvAKJI4xmFehlp/XI2biFu+lyWYEYMXwgRB5PwdiO6AzMehKDU5jH2tcSNeiUCM=
Received: from AM0PR03CA0035.eurprd03.prod.outlook.com (2603:10a6:208:14::48)
 by PA4PR06MB8547.eurprd06.prod.outlook.com (2603:10a6:102:2aa::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.26; Sat, 21 Jun
 2025 20:46:50 +0000
Received: from AM4PEPF00027A6A.eurprd04.prod.outlook.com
 (2603:10a6:208:14:cafe::25) by AM0PR03CA0035.outlook.office365.com
 (2603:10a6:208:14::48) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.27 via Frontend Transport; Sat,
 21 Jun 2025 20:46:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.94 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.94; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.94) by
 AM4PEPF00027A6A.mail.protection.outlook.com (10.167.16.88) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8880.14 via Frontend Transport; Sat, 21 Jun 2025 20:46:50 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.60.34.116]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Sat, 21 Jun 2025 22:46:42 +0200
From: Johannes Schneider <johannes.schneider@leica-geosystems.com>
Date: Sat, 21 Jun 2025 22:46:30 +0200
Subject: [PATCH meta-oe v2 3/3] classes: add a systemd-sysext image class
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Message-ID: <20250621-discoverable-disk-image-v2-3-52df3053fc1f@leica-geosystems.com>
References: <20250621-discoverable-disk-image-v2-0-52df3053fc1f@leica-geosystems.com>
In-Reply-To: <20250621-discoverable-disk-image-v2-0-52df3053fc1f@leica-geosystems.com>
To: openembedded-devel@lists.openembedded.org
CC: =?utf-8?q?Enrico_J=C3=B6rns?= <ejo@pengutronix.de>, raj.khem@gmail.com, 
 mikko.rapeli@linaro.org, erik@riscstar.com, 
 bsp-development.geo@leica-geosystems.com, 
 Johannes Schneider <johannes.schneider@leica-geosystems.com>
X-Mailer: b4 0.14.2
X-OriginalArrivalTime: 21 Jun 2025 20:46:42.0656 (UTC) FILETIME=[9838FE00:01DBE2ED]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A6A:EE_|PA4PR06MB8547:EE_
X-MS-Office365-Filtering-Correlation-Id: 2217136e-f69b-416e-53d3-08ddb104bf3d
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?/Wjjh2aMnJzRBUTPBKy/K2WgSl6b42/TkdNehN85HnKRgoO1Zh5TUQw7bhUu?=
 =?us-ascii?Q?ysYESD4vOhionDv8NQ6JaBJCiP86EdyhWt6GnQOzBkqWv+W2aUQDrPmLRRtq?=
 =?us-ascii?Q?BPuAyqFMFlAYnTYCsnsH7lqNCOmmtN1XV3ocjiWDND+79WPj7fOajm/yb5lJ?=
 =?us-ascii?Q?sBW2VwP9G9ePxCVSIMTF9W0m17Ii7KZiEb9F578TJ2g7x1DGlkmNMw8wq/qw?=
 =?us-ascii?Q?VYac/bT2uEbHjanYovkQx+Rzf+D8+8Wvcm9LkAgxfUowds4832qpKTBap4E/?=
 =?us-ascii?Q?gv49t+RveES+1AoySZsBfHUerdglEuDBArCWGVWI98zFuHOyX5PKVfsBfqIC?=
 =?us-ascii?Q?a0U7dFqgAq7y+RLj4FueRPonFiwL/1rxXSj99A7jzOu76WxGZvY59GlfwSXT?=
 =?us-ascii?Q?eCZHB8jlrb9+rh2xsyyLMryp/3uV/HMwb0/rIR2ZgbpgSIEBJK98E5ImGc+W?=
 =?us-ascii?Q?ezDHL8FLsqhX2Aq3MF2RTT3agYAzYrAZiT8CGf7rK50a3tVYFVEcAycWjUFz?=
 =?us-ascii?Q?EZ5uH4RLjTe1hHV7dZG/MHlmy9eBq7JzJC8trmz5e5GPFujWYEMvthHvgcS+?=
 =?us-ascii?Q?KBYCom0wzcctlyJ12n55mnByHGfeZfGPfKD4myp3GjNGJq4KFNtIknp776Tf?=
 =?us-ascii?Q?NmvanqtmnNqxfsQtl1sTHE2ddh8So5Pcx9hDsGqVjgdC58f9pLJkdYNfZHJO?=
 =?us-ascii?Q?sMlSVgq46GiEe3OKikwpz2ztpbKpmFv1SE+e8jWhaTs0tMZWF8xo98s/ZjZK?=
 =?us-ascii?Q?bbctp2JtfNqAiSlyJGTjQC99WDbacEC31O8LYQO8kY7xhCPN8SIelM8klVp1?=
 =?us-ascii?Q?M39e9cyMDGl9w0RxM2iXLCt+bQb4/GZ5loVaCgQjnomyQYeXSGSlzxfDu8nj?=
 =?us-ascii?Q?7VSQLiccHF0ZmyVYKhkANvR2VsxgVKU8vqmsz1BZoVRoa01KYovGcdLl1HbT?=
 =?us-ascii?Q?HCS5u03KRi1i0/Upro8BMJmMtXaTDAsO3BtTGGvP3Hig5lzW3Ah6mokehTZP?=
 =?us-ascii?Q?rXWD/8GQ8Ddon3q1BIhhz7HvpaTTVwNIS6POhBxQLKQdJVTjUfx+aPbr2Jtw?=
 =?us-ascii?Q?zJzcjcdTrysNKc3IxDFtNcDdJ0qz5DnsWzuHK1GNuvYRyfX7A2SxGKxlvSwC?=
 =?us-ascii?Q?YjrRO6RR9p3pzvAs43GnvcS+wSTX9ss0uwuMXPcqMChDBhunRdygAq16zhyr?=
 =?us-ascii?Q?iy6G04P0QnwtRQj3AsErS0EAIwlAIxnubKgRKSTLml1kP5Xeaz7SCQpd9k8a?=
 =?us-ascii?Q?THmlLWkwLHi8Fez8IRpeT4VBxkD/+NJ85rEiJy7kyXQMn4eZZFoq0nJmmaun?=
 =?us-ascii?Q?vlCHKhJRTF7oxhI+JoTCLCkc7QUC3jIBwN3hRuIQXwm8m1Ae3PlSNJ9Lg1w6?=
 =?us-ascii?Q?RtvGb4utUHamNvbp+RZC8NsHqje/fcgod/L/PcZVTzaA+v94fvRROrkrolWt?=
 =?us-ascii?Q?ywDJDTzzt6OQsl++Tku1nKL84TTE8KlTOJgTqOn+JAfXoN8ljNfP2w=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2025 20:46:50.2591
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2217136e-f69b-416e-53d3-08ddb104bf3d
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00027A6A.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR06MB8547
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 21 Jun 2025 20:47:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118017

systemd-sysext can load a raw-image containing usr/ and opt/ folders
to mount them as RO overlay over the rootfs, to "extend" the systems.

This class provides the necessary changes/additions to the enclosed
filesystem so that systemd-sysext accepts the extension for "merge"
into the rootfs.

With such a created image, placed into the correct folder (see [1]),
`systemd-sysext list` should be able to list the "extension" and
`systemd-sysext merge` should enable the overlay. On both commands a
preceding "SYSTEMD_LOG_LEVEL=3Ddebug" can aide in figuring out what is
amiss.

Link: https://www.freedesktop.org/software/systemd/man/latest/systemd-sysex=
t.html
Link: https://0pointer.net/blog/testing-my-system-code-in-usr-without-modif=
ying-usr.html
Signed-off-by: Johannes Schneider <johannes.schneider@leica-geosystems.com>
---
 meta-oe/classes/sysext-image.bbclass | 87 ++++++++++++++++++++++++++++++++=
++++
 1 file changed, 87 insertions(+)

diff --git a/meta-oe/classes/sysext-image.bbclass b/meta-oe/classes/sysext-=
image.bbclass
new file mode 100644
index 0000000000000000000000000000000000000000..3771236c6ea35d8152b676ca915=
b14da57c38372
--- /dev/null
+++ b/meta-oe/classes/sysext-image.bbclass
@@ -0,0 +1,87 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+# System extension images may =E2=80=93 dynamically at runtime =E2=80=94 e=
xtend the
+# /usr/ and /opt/ directory hierarchies with additional files. This is
+# particularly useful on immutable system images where a /usr/ and/or
+# /opt/ hierarchy residing on a read-only file system shall be
+# extended temporarily at runtime without making any persistent
+# modifications.
+
+## Example usage:
+# extension-image-example.bb
+#SUMMARY =3D "An example image to showcase a system extension image."
+#LICENSE =3D "MIT"
+#inherit discoverable-disk-image sysext-image
+#IMAGE_FEATURES =3D ""
+#IMAGE_LINGUAS =3D ""
+#IMAGE_INSTALL =3D "gdb"
+#
+## After building, the resulting 'extension-image-example-*sysext.rootfs.d=
di'
+# can be deployed to an embedded system (running from a RO rootfs) and
+# 'merged' into the OS by following steps:
+## 1. place a symlink into the systemd-sysext image search path:
+# $> mkdir /run/extensions
+# $> ln -s /tmp/extension-example.sysext.ddi /run/extensions/example.raw
+## 2. list all available extensions:
+# $> systemd-sysext list
+## 3. and enable the found extensions:
+# $> SYSTEMD_LOG_LEVEL=3Ddebug systemd-sysext merge
+
+# Note: PACKAGECONFIG:pn-systemd needs to include 'sysext'
+
+# systemd-sysext [1] has a simple mechanism for version compatibility:
+# the extension to be loaded has to contain a file named
+# /usr/lib/extension-release.d/extension-release.NAME
+# with "NAME" part *exactly* matching the filename of the extensions
+# raw-device filename/
+#
+# From the extension-release file the "ID" and "VERSION_ID" fields are
+# matched against same fields present in `os-release` and the extension
+# is "merged" only if values in both fields from both files are an
+# exact match.
+#
+# Link: https://www.freedesktop.org/software/systemd/man/latest/systemd-sy=
sext.html
+
+inherit image
+
+# Include '.sysext' in the deployed image filename and symlink
+IMAGE_NAME =3D "${IMAGE_BASENAME}${IMAGE_MACHINE_SUFFIX}${IMAGE_VERSION_SU=
FFIX}.sysext"
+IMAGE_LINK_NAME =3D "${IMAGE_BASENAME}${IMAGE_MACHINE_SUFFIX}.sysext"
+EXTENSION_NAME =3D "${IMAGE_LINK_NAME}.${IMAGE_FSTYPES}"
+
+# Base extension identification fields
+EXTENSION_ID_FIELD ?=3D "${DISTRO}"
+EXTENSION_VERSION_FIELD ?=3D "${DISTRO_VERSION}"
+
+sysext_image_add_version_identifier_file() {
+    # Use matching based on Distro name and version
+    echo 'ID=3D${EXTENSION_ID_FIELD}' > ${WORKDIR}/extension-release.base
+    # os-release.bb does "sanitise_value(ver)", which needs to be done her=
e too
+    echo 'VERSION_ID=3D${EXTENSION_VERSION_FIELD}' \
+        | sed 's,+,-,g;s, ,_,g' \
+        >> ${WORKDIR}/extension-release.base
+
+    # Instruct `systemd-sysext` to perform re-load once extension image is=
 verified
+    echo 'EXTENSION_RELOAD_MANAGER=3D1' >> ${WORKDIR}/extension-release.ba=
se
+
+    install -d ${IMAGE_ROOTFS}${nonarch_libdir}/extension-release.d
+    install -m 0644 ${WORKDIR}/extension-release.base \
+        ${IMAGE_ROOTFS}${nonarch_libdir}/extension-release.d/extension-rel=
ease.${EXTENSION_NAME}
+
+    # systemd-sysext expects an extension-release file of the exact same n=
ame as the image;
+    # by setting a xattr we allow renaming of the extension image file.
+    # (Kernel: this requires xattr support in the used filesystem)
+    setfattr -n user.extension-release.strict -v false \
+        ${IMAGE_ROOTFS}${nonarch_libdir}/extension-release.d/extension-rel=
ease.${EXTENSION_NAME}
+}
+
+ROOTFS_POSTPROCESS_COMMAND +=3D "sysext_image_add_version_identifier_file"
+
+# remove 'os-release' from the packages to be installed into the image.
+# systemd-sysext otherwise raises the error:
+# Extension contains '/usr/lib/os-release', which is not allowed, refusing=
.
+PACKAGE_EXCLUDE +=3D "os-release"

--=20
2.34.1


