Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5EC7C5AE59
	for <webhook@archiver.kernel.org>; Sat, 31 May 2025 11:00:44 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.46])
 by mx.groups.io with SMTP id smtpd.web11.3642.1748689238740352089
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 31 May 2025 04:00:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@leica-geosystems.com header.s=selector1 header.b=Eq9r0j0J;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 52.101.70.46, mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HTVCe3cFu1cGEqcANq32PFddVMxd/aWq1NNmB8731fyEE6gHjTFsBJ6vl8CXxiqrKajhbaLwGjSv7/lYCIin7iRz8MdOp0/RaKauCQMpg7g1nlFyhX0NEPTBb2tRJeeUQSp+bMtc16FHOk7emcV4PUeSlCWPrrQr70AG0ZoV11n2DWigQQo6No0QLOHu5shZ6NF/GKBlDDTUgS65Cn9GAmtDCWJF31+bUlUBItP0J2au3egkfRXp6liavuRvRF/ag+bvU9VSp0uiKDvC+PKz5sUwmfkdx7ET7NKaBx6bJS7kkOEGoEJ2tM4s1hsmZ/pnRT9zTRFMBG2uDr/tOD7Qfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=90IHeF/pMe/IBc9dti9g2umYzQEiez637B6Fm+iXHpo=;
 b=Mp3vHdVVrV1bbaoqeE7cwoeE6WZ3evuvdFhk9uBcxoOknSZQtkN3ijwU8DmrnPt3sgviOVl5p/NqUtT2/juw6N2E7rCEmDi4IqYqGyzGdj8I6DHs0d5JF1/QZfkOyTSYQGZjNsyx8OWFZnMoETsZlpt/VUTmKIBX4MSeV1QBE9IoUvEPhaBHjh/7pV/byABvwG4dj/4n+2ux28UrxeJK5xwUin6odX4+AtdH52u/BA4d/5qZ6S1QqgUInzzYz7bloe8Yr949CM0F7C1WxE7ezuo2DhX9dLnntElp/6eOINhevl5/1hwSfn/j9i17U9l2tj9ZYGI+AxrO4jk5oEC8tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=90IHeF/pMe/IBc9dti9g2umYzQEiez637B6Fm+iXHpo=;
 b=Eq9r0j0JfM0gdDkU6uB8xMhCtjAS9GOr9Ae1XBCAqFbGJovBhgQhImHdnniNPMiyvPtk4pShCyLhWtfCt3jnEJ8+2gPifjtqi8JnLmZx8nHbY2kLXU1OLg3F3mDnxi7BJq4qYX4gxhBwzsEfG57tQYhkFcF405KofQqcd9UaSbo=
Received: from DU7P189CA0019.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:552::19)
 by AS5PR06MB8704.eurprd06.prod.outlook.com (2603:10a6:20b:67c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.31; Sat, 31 May
 2025 11:00:32 +0000
Received: from DB1PEPF00039230.eurprd03.prod.outlook.com
 (2603:10a6:10:552:cafe::86) by DU7P189CA0019.outlook.office365.com
 (2603:10a6:10:552::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.24 via Frontend Transport; Sat,
 31 May 2025 11:00:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.94 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.94; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.94) by
 DB1PEPF00039230.mail.protection.outlook.com (10.167.8.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8792.29 via Frontend Transport; Sat, 31 May 2025 11:00:30 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.60.34.116]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Sat, 31 May 2025 13:00:30 +0200
From: Johannes Schneider <johannes.schneider@leica-geosystems.com>
To: openembedded-devel@lists.openembedded.org,
	raj.khem@gmail.com,
	mikko.rapeli@linaro.org,
	erik@riscstar.com
CC: bsp-development.geo@leica-geosystems.com,
	Johannes Schneider <johannes.schneider@leica-geosystems.com>
Subject: [meta-oe][PATCH v1 1/3] systemd: add recipe for systemd-repart-native 257.6
Date: Sat, 31 May 2025 13:00:20 +0200
Message-ID: <20250531110022.3843938-2-johannes.schneider@leica-geosystems.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250531110022.3843938-1-johannes.schneider@leica-geosystems.com>
References: <20250531110022.3843938-1-johannes.schneider@leica-geosystems.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-OriginalArrivalTime: 31 May 2025 11:00:30.0340 (UTC) FILETIME=[3936BC40:01DBD21B]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF00039230:EE_|AS5PR06MB8704:EE_
X-MS-Office365-Filtering-Correlation-Id: a9a7b543-c6f4-497d-4216-08dda0325be0
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Lo0fA0qehJsx5VkqpRvySvPpPUu6p7gZwXFYWjDwUGXNCx/y8ukmL/OUPI+j?=
 =?us-ascii?Q?PZvgk09sdP8hPgBw1tehDLfkCQxp3cJZdCrm3U7lmndRIFVbkhZiVTeUUo6a?=
 =?us-ascii?Q?vCaAYA4HdakBN0yaJD3fkhN5b2aAfjOXlZNbpueMhUBglmpvK8fTT8DVtB12?=
 =?us-ascii?Q?WTITeTqS+0XJYOESz+/NWFWWiwOPGMlMAS0zaEFAJQZ/bJtw+VtgG2AE0B2a?=
 =?us-ascii?Q?MCkWK2EyMlQvXc1diWhRVlT/HgpqIVOSmbLWKfGaABV5aF7zDR7PNNzwLIeb?=
 =?us-ascii?Q?4IlHGCcQcorwLEkaHWNiq4ihD9Y8qWY62rM8phzyCS0Pk3eP5gugQV9m7oeA?=
 =?us-ascii?Q?1piBZCJT7ETEauAbvBEkjS0tE4TIybu0qyBEhBQ5Rv0/zTZAnWPYh49LLzdI?=
 =?us-ascii?Q?QY8mtx9145snIzdF/p6z+4KOAeuUIfMeLtKZJBa+kCU3GSF3/3XMYMs7yH0u?=
 =?us-ascii?Q?He4AJ7i7pHTJXV+kYMvhcrukpTt1y8IK1oeA2CZH9m8QO9SmnyMjLyrnRy4O?=
 =?us-ascii?Q?tfe+V3Gg6mLjGzD/u0o5wVRWEF4I/Ivx05yKKY9P4F+283s4Sp4A0ngg/Saw?=
 =?us-ascii?Q?52fwfgtmesmIWi1eHYIsh9T1eTBUD4JYi+y5IYSi/DnYoXnYKdOFsw6d0yc0?=
 =?us-ascii?Q?hGga+7h3aMXmT3QhF0I1CbJKNeCz+j2X/IEkB3jF+W3oiB0OWsxVYS4SRuqJ?=
 =?us-ascii?Q?AmHJn4c1gR6la6EbCFiSeJ+T0qEDecMYmtpg/6bWmn6xNuKF/VvsXjSwfzc5?=
 =?us-ascii?Q?8TWEad+5W9ujdaAmgc8WShWBuBX+zRDLmObPhZIQtdDLmlle3XJIKZccLzS/?=
 =?us-ascii?Q?bCtfvekws3LTSQqm5F8WSgkf+5T8Mmt+s6623uVm3BcrTMBlyEDJBlSyA6tI?=
 =?us-ascii?Q?ODiWdyd4sG8Z7qqe/6j0jJcdDeIVof8rP7M/tgmt0aYhv5xCtTlhKyo0tKsX?=
 =?us-ascii?Q?YnYlu63EvfVRHz/q3YtHPr6Hgqa+CmLj7L5VZb9qIsLaMmvTwd3sl1h+tJeV?=
 =?us-ascii?Q?Y9ig9alEvqSmKbYupgxIqt24i9Q7HHOGOzc4NGQkdCJBr5lsm8MWbIdB9VgY?=
 =?us-ascii?Q?r19olEJfQqfU3EG2+mmQH37Ktms64/B8fmqVMa/60khyy2uwrAe7EN4t19JM?=
 =?us-ascii?Q?8+LwafpruBViwnx4hsv9viy5Mp99idtdSzN8Azn33bL3sChtfxLiSo2n+O4m?=
 =?us-ascii?Q?Y83bcuI9d2gQUeZSYVjS3SUViUjJ4cXCmLUejvfQF3KD+HinjxDLxaXZhBy0?=
 =?us-ascii?Q?gvB1NrrpizfuN35OzjkCJt475BpkvMNC5/T7uay44yjySa3M3t7GajmW6MSR?=
 =?us-ascii?Q?NU0nKwqjfrHAsJWTis4PsEBTQJwvB6uEzS8ivhlFbs1/WAc3W3t1BUNwaMnm?=
 =?us-ascii?Q?xmUvJw6155sHlvl8Wnijo52PW0m1+kc5Bnrsfd8jYKWJF6c1S1CHk80JysPJ?=
 =?us-ascii?Q?3c+nwliFrXvvwSPz18nEdLW3f+KWCCGc5p2uKbmKmTSoti1bWFs6Yw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2025 11:00:30.6068
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a9a7b543-c6f4-497d-4216-08dda0325be0
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF00039230.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR06MB8704
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 31 May 2025 11:00:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117679

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
 .../systemd/systemd-repart-native_257.6.bb    | 59 +++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 meta-oe/recipes-core/systemd/systemd-repart-native_257.=
6.bb

diff --git a/meta-oe/recipes-core/systemd/systemd-repart-native_257.6.bb b/=
meta-oe/recipes-core/systemd/systemd-repart-native_257.6.bb
new file mode 100644
index 0000000000..15b60af02e
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


