Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBDEFC5B543
	for <webhook@archiver.kernel.org>; Sat, 31 May 2025 11:00:44 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.61])
 by mx.groups.io with SMTP id smtpd.web10.3724.1748689241685023080
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 31 May 2025 04:00:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@leica-geosystems.com header.s=selector1 header.b=TRt09mVq;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 40.107.21.61, mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rj/q2knmr2gHUbJWF1GPYpPgA9NdgJziIOCrqRQ6VLN5TuXwEOQMAZhBFR5m2pzpaXaR6BFDqnbH9Upsx6W6yQlPXFmtZ3CC48oyrsb/EntX/yQ9KbF41y3TJPw4OB6rpKxYIuMo8wCdoBf/tva+hmNAwEAc+PCknWCB71iNGGjy4aoP3aZSFtpYISdYR3FuZeEaFmjrri63jOxwy3Y69ElNfJxnL5W3m+X8M5H+cysOn4Y/ke0/7nRiPz4oeYLMdvLBYBGvDxgWjL+V2AIJIWjzSiKsHNTpS5vGZW+HG5GMl7D6OSUx5aSqOT+WVt49Vo10OyUPlQiY/YyKJbj2ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0HqfXlJSrnk+R/mh7gdHOgi3SqwL7ur+oT5MA6+3rio=;
 b=YWwUTiLYEoG0sbALkfuyaetqVKIcZflnQ8Jl5cuhJ+bN4Vou+vluaun7g+cEK/V7KsOzBXLrwis7oz9LjIPaDbYvOY0MT6zmDary65gQjq5kBr6VVn8pPq8OQkuEOAEA7m3HaJpGdOREXDsIrDOLApJEyQuAXhYrlHLZlKFsBl+VpNPlbt8QDPrclNjpGGRCzgB+E3lqHcAEwYLnVeKi4um7v1b+hzlTtIdTxz/tgtbVP5qYqfvoVhS/YEMHFsVxROpAerSovSrOnqF9uCM7cR7zfgEMRvyPLQBhTUO3ItaEvugyrCeHsLgdADJgoJVabZGeISbkNyfQxmTw5yMPyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0HqfXlJSrnk+R/mh7gdHOgi3SqwL7ur+oT5MA6+3rio=;
 b=TRt09mVqTyehy2d179f6fUd0u0V/4ZMR9OvSEzMLPD3otOhRpfH8rSUnnv76gB+c/BKn45jPz5qwjElvc4BYeKEM6BBMJ4Wj1YfIkwxU5xY4+Jp/0A3t+4akII2U0fhWuMdmZMFfqRNzLHgfCULNpSYp97CzRFA0NDN2LNfzPEQ=
Received: from DU7P189CA0004.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:552::20)
 by PA2PR06MB9540.eurprd06.prod.outlook.com (2603:10a6:102:405::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.34; Sat, 31 May
 2025 11:00:36 +0000
Received: from DB1PEPF00039230.eurprd03.prod.outlook.com
 (2603:10a6:10:552:cafe::77) by DU7P189CA0004.outlook.office365.com
 (2603:10a6:10:552::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.24 via Frontend Transport; Sat,
 31 May 2025 11:00:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.94 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.94; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.94) by
 DB1PEPF00039230.mail.protection.outlook.com (10.167.8.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8792.29 via Frontend Transport; Sat, 31 May 2025 11:00:35 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.60.34.116]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Sat, 31 May 2025 13:00:31 +0200
From: Johannes Schneider <johannes.schneider@leica-geosystems.com>
To: openembedded-devel@lists.openembedded.org,
	raj.khem@gmail.com,
	mikko.rapeli@linaro.org,
	erik@riscstar.com
CC: bsp-development.geo@leica-geosystems.com,
	Johannes Schneider <johannes.schneider@leica-geosystems.com>
Subject: [meta-oe][PATCH v1 3/3] classes: add a systemd-sysext image class
Date: Sat, 31 May 2025 13:00:22 +0200
Message-ID: <20250531110022.3843938-4-johannes.schneider@leica-geosystems.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250531110022.3843938-1-johannes.schneider@leica-geosystems.com>
References: <20250531110022.3843938-1-johannes.schneider@leica-geosystems.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-OriginalArrivalTime: 31 May 2025 11:00:31.0621 (UTC) FILETIME=[39FA3350:01DBD21B]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF00039230:EE_|PA2PR06MB9540:EE_
X-MS-Office365-Filtering-Correlation-Id: b038bdb9-06c7-4e3a-8c5a-08dda0325efb
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?COchoCBwaW4aaY4jv+U9RXTv4mUMw3CW4dsDiF2rYprywLUWRsOGAShdoT00?=
 =?us-ascii?Q?tLfJM/SzB9qoNOwv15j/MEGrcg+Mm4Prm4Z+Ix0wQCk5WTkn94tw67gKb4N2?=
 =?us-ascii?Q?idvDUTvzSNQVyTs+NXVcL1G0OqPVPDWFTf10GOM2LNaKgneruY/SmEtuLvrh?=
 =?us-ascii?Q?Gwh++vTe3anAWbq3tsJPv2KCpEUIAF32gwe2WzilFSlXvZE2/2wVYn4qbbSv?=
 =?us-ascii?Q?Wac2M++VS59y7BYJFBL1G2JeVuNV2xWJRWtOwTRNYamO2oBO2HPmDzKM+rqH?=
 =?us-ascii?Q?nc/gzfYC1rvxXe2mOlN7sG5UNLqW+6B0B5RRE7ZvqyjjpFWUoirCqIpry6X0?=
 =?us-ascii?Q?FHi39CWEI0B+bqSudCBnOWQbyf4eDGS4VrFIQ1twKI+gh2mxMoOwoD1B3NCb?=
 =?us-ascii?Q?gIjhwgWbUz8PWwevcJZ8SwlDIAkrJ4zSfYEPA5N3PrDvj9zq2lPIb2aTdLJX?=
 =?us-ascii?Q?AbvbC0bJdxNOPFoUcycWkVHZhLqchwUrL/wzWuSYU9dXSg//VLzdsBFuu3A1?=
 =?us-ascii?Q?J83IEFPPRhBrkOtzTLPwMMYiC3U7bjoy3iolmxY4V+GzixfUoJa2li/NOmby?=
 =?us-ascii?Q?imNJ9vlc+lttFr9S9mHK08jlqVs0wFTw7RamrAqcmFLz8JA3z/bIkr8T+S8E?=
 =?us-ascii?Q?hYPHzJ736Bea7AHrXkI/3t+rfheYHJd/4spyvVV1d81FufBqEdTsLrtA6G+d?=
 =?us-ascii?Q?oNvvLQD0A7ty59zVX0tPd5Rnn6r/zW4WyeO0wMNl/sLc96qQ5Y0bB6rP6RUA?=
 =?us-ascii?Q?WG/SzpMP/u94smwB3nw2MuTbWIILU7hbBzgvyYMggpIaVLpQLPnFsHvfUQEa?=
 =?us-ascii?Q?G7FwcvFa89OpLnTpdJjIXEdoJ2Wbubet9ioRP/Ez/5BVIo/7GrWk7e/EVgZB?=
 =?us-ascii?Q?HDtYl0DEUjzDKE2dZiegNVoZNG9fZR5i1wOyqoRJFVL8bqiKHecWAYUdB2S6?=
 =?us-ascii?Q?W39izvo9q2Y/MnCmEUAI3feYPHsjoYn03yWI3UP07O/o3Z3iQUKHMsMumtiV?=
 =?us-ascii?Q?b1U3Nc1NWf08Zo9W7NoeNBubtqtaeJzjNgMN9EXNACRk2mWcOtR49tT6PnT8?=
 =?us-ascii?Q?QwCOsOamyY1Bd3+jqyZWKfSozgTVlHgRmm+iwh+CgiqsLEB0FhVMuumlfKu2?=
 =?us-ascii?Q?eT3Sw4YVBGRdvCbuPfxuDQ7D9JlNJa6l29kzJmryIgcFUT1nhlIYFVtJAd1x?=
 =?us-ascii?Q?UxKH8JvV9Mg+dvWFwD/Dp04pu6cG4cM9wiAi8s8VtzVplnvVBSLhcn04URmo?=
 =?us-ascii?Q?BwSuVYGDgybjiYNKEY5EbCZqsGsKeWH7jWiL3m61L0W/hFgAzd8VwNO2mLoZ?=
 =?us-ascii?Q?Yjyc8UJ+fpdK256KjTRCV2WyNjIZlvamk00kicI+REFa0XFdvqWD5drY883+?=
 =?us-ascii?Q?xaRiwEJjKA0ZqzLRXhpgRksZ5HJCFPj2VEqjTig4pKDN0cVSG6k/d/UXCzqi?=
 =?us-ascii?Q?dxQn8FRROG7i5IavC0ThLNjg6TG3KaS8uvNgj2kE/q+iUjcfdoM+cg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2025 11:00:35.8203
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b038bdb9-06c7-4e3a-8c5a-08dda0325efb
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF00039230.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR06MB9540
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 31 May 2025 11:00:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117680

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
 meta-oe/classes/sysext-image.bbclass | 76 ++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)
 create mode 100644 meta-oe/classes/sysext-image.bbclass

diff --git a/meta-oe/classes/sysext-image.bbclass b/meta-oe/classes/sysext-=
image.bbclass
new file mode 100644
index 0000000000..4d97b59ce3
--- /dev/null
+++ b/meta-oe/classes/sysext-image.bbclass
@@ -0,0 +1,76 @@
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
+# Example usage:
+## place a symlink into the systemd-sysext image search path:
+# $> mkdir /run/extensions
+# $> ln -s /tmp/extension-example.sysext.ddi /run/extensions/example.raw
+## list all available extensions:
+# $> systemd-sysext list
+## and enable the found extensions:
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


