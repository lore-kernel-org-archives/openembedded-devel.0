Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75BFAC7EE2A
	for <webhook@archiver.kernel.org>; Sat, 21 Jun 2025 20:46:56 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.11])
 by mx.groups.io with SMTP id smtpd.web11.14958.1750538811274934565
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 21 Jun 2025 13:46:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@leica-geosystems.com header.s=selector1 header.b=kPiEFdQW;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 40.107.130.11, mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ri+zD72ZH6FtbfFqvuPjwYcaqSb+QM0djuY5Bweip7Ld8CsY1yYT73tByG6dL205sA92XK7rtQQmz/tgumc6R8sjJZpDTc+/L9pw64bsdtsUBUJzex78ux+pOB2diH/95HP97YIm0ZlGqVWIMQk9kwz3YBHx5CHQOHeu7dVh96zJHsp6Eh4mMZSlE614kmA6uFKivpvdkXLOUyHd+76bzFMCadLNoZCphJHTsU/RIQ45+wK1kRKsSgMbbCGs/IvynrnhSbRA0bBgDIFJWK4LmIkzGkLtxmBbqR6Bx98G+Wwo6tIGwD1CKx1g0ZsdMP/Z6xqlCCpBdL1FgTv4dCF9tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kFtYi5TWOGea4UuqN3fAw45WgKdwfHf+ptEwUgVFUTs=;
 b=I+XbTiF6IUu+RXIkKX3ODuZ61zWgKOdD1uzKEhhVW/OK34DJjSKzuUiCyXikg2WbHbpZBm1+WUTPX0x6zs0AsCr1gomHOr/fxN8unGpVGaipGkWwVB/fQCXhpnpTVh2X8W+F8rhj0WQcMRVHUhlTgGLr315mnecwBdgIQRbQr6/d0VhQ+IKA9E+G0bK4dAZhcaBfcCue4s/cIwbJ1u2ih2G0rDLSEfp+MFFWuwxv0TYiHwA8YiCmwV4u8gcoC/6pZHVj5RfeZ0WY1+cni9uMMtis6WUqqRgorV9L+7KF9SYJKx94R0c/QLJJ35+/MmSaWJ43MahzcDt5hf6mjfpxvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kFtYi5TWOGea4UuqN3fAw45WgKdwfHf+ptEwUgVFUTs=;
 b=kPiEFdQW04RleYATFYMqSIcEeIcEJI+Icr/wNBYaE69GSZenVSc8dvvwL8tQcj1qSmtHGe6r4Vbc2evepFAxrPQa6i2n80qSUnNAUO92gvcK64OrfcBtnbN5CVA/vLyRBWqACv/9ttUZFR1DH2acZGIH08jGemC4vNklpcSCG88=
Received: from AM0PR03CA0008.eurprd03.prod.outlook.com (2603:10a6:208:14::21)
 by PA2PR06MB9246.eurprd06.prod.outlook.com (2603:10a6:102:409::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.25; Sat, 21 Jun
 2025 20:46:46 +0000
Received: from AM4PEPF00027A6A.eurprd04.prod.outlook.com
 (2603:10a6:208:14:cafe::41) by AM0PR03CA0008.outlook.office365.com
 (2603:10a6:208:14::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.27 via Frontend Transport; Sat,
 21 Jun 2025 20:46:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.94 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.94; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.94) by
 AM4PEPF00027A6A.mail.protection.outlook.com (10.167.16.88) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8880.14 via Frontend Transport; Sat, 21 Jun 2025 20:46:45 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.60.34.116]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Sat, 21 Jun 2025 22:46:42 +0200
From: Johannes Schneider <johannes.schneider@leica-geosystems.com>
Date: Sat, 21 Jun 2025 22:46:28 +0200
Subject: [PATCH meta-oe v2 1/3] systemd: add recipe for
 systemd-repart-native 257.6
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Message-ID: <20250621-discoverable-disk-image-v2-1-52df3053fc1f@leica-geosystems.com>
References: <20250621-discoverable-disk-image-v2-0-52df3053fc1f@leica-geosystems.com>
In-Reply-To: <20250621-discoverable-disk-image-v2-0-52df3053fc1f@leica-geosystems.com>
To: openembedded-devel@lists.openembedded.org
CC: =?utf-8?q?Enrico_J=C3=B6rns?= <ejo@pengutronix.de>, raj.khem@gmail.com, 
 mikko.rapeli@linaro.org, erik@riscstar.com, 
 bsp-development.geo@leica-geosystems.com, 
 Johannes Schneider <johannes.schneider@leica-geosystems.com>
X-Mailer: b4 0.14.2
X-OriginalArrivalTime: 21 Jun 2025 20:46:42.0641 (UTC) FILETIME=[9836B410:01DBE2ED]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A6A:EE_|PA2PR06MB9246:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f37b73f-8e50-4a6f-069f-08ddb104bc5b
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?L4TcokDZJjkDlGgSxtopMF12djFVPLtpI1bdQYkrVRPUVllMW41t0tY+jAdz?=
 =?us-ascii?Q?q5H9y6qoMAPeYNeG/X0ecFj+0Qvd116LdhYllc4kAwgMpJjbdRB/HD8lEBDj?=
 =?us-ascii?Q?zkyWReLru+U7+t9fMBgw8WJO8l+CPor3xMeXdyZ+DBmMDEdq1WBeIzsXNSu/?=
 =?us-ascii?Q?ebQBINF1WXxYI+e9Ect+INJHu0rB6rQ9J7LEw8qSoIiyhgvogwJWx8116FK+?=
 =?us-ascii?Q?WtUK3eel8WGxyfLh6UI/RrOirX1ee81q5Zbdpr9NBAb5XagaH2bnow8It/PI?=
 =?us-ascii?Q?kf874a61p7TWHMQwhz7foW1yBy8G5UElJY1bS0Z3VlDpYuMdz/HN1LVUhlsz?=
 =?us-ascii?Q?BMIFAorkC6wN7LQKCSAxBGlmeAaJ6r/IxklCRwRcNnude41jgln0kE949Bg/?=
 =?us-ascii?Q?obvOUMxzTRmAR3mXiDlqcm3Bd+Q+4SrQQX4YAZUpV2lRvhOsuEzfysc4YQ9y?=
 =?us-ascii?Q?P+ZFAdT90ih4DSi1ZuKQDH0m6RokODu2ZelNGlbKNV5wQfJctFMk0YA+95Aj?=
 =?us-ascii?Q?cMsEkUtRnA3vPrctCJlYQssR7mOYJTse0Jpfm7+gftHCB3FOqiM4nDPZXE96?=
 =?us-ascii?Q?fRsVdlX5BPlOCGebKIuSGknEkDaCsLTVdmfrpFBAyiMPrSPSkljj7FEG/bTg?=
 =?us-ascii?Q?WKbma3WwWcYFUiStpyXXYZU9odG8tOTBldmnv7/lPt0pMVUKhjcqoMwPN/OL?=
 =?us-ascii?Q?9yVZEsVHGme3R2b1MiqXlcfxqv0CHpQnDW39JXYN5ElH9egIPzzeJjDpevNN?=
 =?us-ascii?Q?6ZPJklrALCnSq/Bnu24piNJgZD7jjYEBoTo4DAJaXUFByrdjV9XWeIGMCJd5?=
 =?us-ascii?Q?PsGtJp75N9YToks6TmzennfpjtadBfRc3CI8mKyckStz8UhiguoAPS9YGmfY?=
 =?us-ascii?Q?Gu6EnZncrIJE+PruaMD17IiiJ131hC4vkuaF27Y9LBdFftEa0mRJlWnScL2O?=
 =?us-ascii?Q?n0N3iR+NJuEmkGQMqEj3C8vDktBprLhBPdQjMXGLJh6a0SI81FNRpOBFsmr0?=
 =?us-ascii?Q?kxLw6J7I8pMM1XklndXEgH6OyKW2Ck4/PJsZSk6jjcK2o0jqjrfbGEtY2D64?=
 =?us-ascii?Q?+IhYLRKk51/y1DSbikUJnIIrLw4jKJqSFb6aerVnmyQ7bczX6Ti2afPfdDfz?=
 =?us-ascii?Q?B31rPg0lioD/jrNQaMQIhXCeUWqyAbxjn1GoXjOTijKSq+nqeqKB4kHcdJth?=
 =?us-ascii?Q?2P3ObhwANC79AHcgwf++itWjyHRCW5iWbc7Fi7RoZBe38wtyprn0lnNB4avF?=
 =?us-ascii?Q?Iih3S/RAwYxLmh3yVWlP5zx1wNSwIPQLWr4+vvZx7EUlVyMMw50BI2aZDunJ?=
 =?us-ascii?Q?FMsL6IydIt+yYfAXFVh6Ydig256TyJrqWz2znDeAb5aDxUBbmCS+pcrHyZKF?=
 =?us-ascii?Q?TzlJlVb5UBIsrD1bODxVHl6nvEYihOxO62/TZNh90Azsx5OvPrp7LBVgYk8c?=
 =?us-ascii?Q?5E5u5t3gSl+sZ+XwUKlaP3zq7SBr2WQHa9G1C803xqSdOGVvMu2SkA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2025 20:46:45.4204
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f37b73f-8e50-4a6f-069f-08ddb104bc5b
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00027A6A.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR06MB9246
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 21 Jun 2025 20:46:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118014

Add a recipe to build systemd-repart-native.
The chosen version is a relatively recent one, to support:

1) PKCS#11 uris [1] to pass in the private key when creating a
discoverable disk image (as=C2=B7--private-key-source).

2) setting Compression=3D/CompressionLevel=3D in the configuration [2],
which is then passed over to a (recent version of) mkfs.erofs

The recipe was adapted from an incomplete 'systemd-tools' patch [3]
that is floating upstream.

Link: [1]: https://github.com/systemd/systemd/commit/0a8264080a5d4b5e13e65e=
ed80ac98a476f7fe43
Link: [2]: https://github.com/systemd/systemd/commit/27cacec939a46f61706d7b=
48a51b6f5880be4662
Link: [3]: https://lists.openembedded.org/g/openembedded-core/topic/1082239=
84#msg204065
Signed-off-by: Johannes Schneider <johannes.schneider@leica-geosystems.com>
---
 .../systemd/systemd-repart-native_257.6.bb         | 59 ++++++++++++++++++=
++++
 1 file changed, 59 insertions(+)

diff --git a/meta-oe/recipes-core/systemd/systemd-repart-native_257.6.bb b/=
meta-oe/recipes-core/systemd/systemd-repart-native_257.6.bb
new file mode 100644
index 0000000000000000000000000000000000000000..15b60af02ede966aa8266048cff=
1f1a4e7ddba21
--- /dev/null
+++ b/meta-oe/recipes-core/systemd/systemd-repart-native_257.6.bb
@@ -0,0 +1,59 @@
+# SPDX-License-Identifier: MIT
+#
+# Copyright Leica Geosystems AG
+#
+
+SUMMARY =3D "systemd-repart"
+DESCRIPTION =3D "systemd-repart grows and adds partitions to a partition t=
able, based on the configuration files described in repart.d(5), or generat=
es a Discoverable Disk Image (DDI) for a system extension (sysext, see syst=
emd-sysext(8))."
+HOMEPAGE =3D "http://www.freedesktop.org/wiki/Software/systemd"
+
+LICENSE =3D "GPL-2.0-only & LGPL-2.1-or-later"
+LICENSE:libsystemd =3D "LGPL-2.1-or-later"
+LIC_FILES_CHKSUM =3D "file://LICENSE.GPL2;md5=3D751419260aa954499f7abaabaa=
882bbe \
+                    file://LICENSE.LGPL2.1;md5=3D4fbd65380cdd255951079008b=
364516c"
+
+SRCREV =3D "00a12c234e2506f5cab683460199575f13c454db"
+SRCBRANCH =3D "v257-stable"
+SRC_URI =3D "git://github.com/systemd/systemd.git;protocol=3Dhttps;branch=
=3D${SRCBRANCH}"
+
+S =3D "${WORKDIR}/git"
+
+DEPENDS =3D " \
+    cryptsetup-native \
+    gperf-native \
+    libcap \
+    python3-jinja2-native \
+    util-linux \
+"
+
+inherit meson pkgconfig gettext native
+
+MESON_TARGET =3D "systemd-repart"
+
+# Helper variables to clarify locations. This mirrors the logic in systemd=
's
+# build system.
+rootprefix ?=3D "${root_prefix}"
+rootlibdir ?=3D "${base_libdir}"
+rootlibexecdir =3D "${rootprefix}/lib"
+
+EXTRA_OEMESON +=3D "-Dnobody-user=3Dnobody \
+    -Dnobody-group=3Dnogroup \
+    -Drootlibdir=3D${rootlibdir} \
+    -Drootprefix=3D${rootprefix} \
+    -Ddefault-locale=3DC \
+    -Dmode=3Drelease \
+    -Dsystem-alloc-uid-min=3D101 \
+    -Dsystem-uid-max=3D999 \
+    -Dsystem-alloc-gid-min=3D101 \
+    -Dsystem-gid-max=3D999 \
+"
+
+do_install() {
+    install -d ${D}${bindir}/
+    install -m 0755 ${B}/systemd-repart ${D}${bindir}/systemd-repart
+    install -d ${D}${libdir}/
+    install -m 0644 ${B}/src/shared/libsystemd-shared-257.so ${D}${libdir}=
/libsystemd-shared-257.so
+
+    install -d ${D}${libdir}/systemd/repart/
+    cp -r ${S}/src/repart/definitions ${D}${libdir}/systemd/repart/
+}

--=20
2.34.1


