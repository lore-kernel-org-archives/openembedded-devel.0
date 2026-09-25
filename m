Return-Path: <mark.jonas@de.bosch.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2755CC9830E
	for <webhook@archiver.kernel.org>; Fri, 25 Sep 2026 13:40:28 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.32])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8470.1790343626748305440
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Sep 2026 06:40:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@de.bosch.com header.s=selector2 header.b=B/UV4Y0b;
 spf=pass (domain: de.bosch.com, ip: 52.101.70.32, mailfrom: mark.jonas@de.bosch.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U0Vp47hJ29BlvKPVsBKsIz1eBBQqVAesQBLSjxAa09bKf6zfCLF69BgEWZLi8r/Ko49udoAS14gmA1wDy3e9GwVHhnm3Fd+XVwbXUCDqTfMugoaIy2qqOa64cdMl5wua+ColWjbHjhvAcxrfDbnMLUQOp7yphxyQiPIc3SzqEJiMV9VyGwnaIZkWYO6G+nPp+HcreI7MeM5wa9fdRNjV/Y30IqTp4506sSyybw6wZ1qpRitMAN3qfw3qhIgj9hXPeasbr9nN1ppByBYC9FMkKOe0QvD2zQDlrAirDYOFBmN5Gni3ovcfbFHNu0pa0hWYhw+n3gnfGEVwEkXpMxhB1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L2jRvOTqJa81OAXfam+92vrmJsRw/cWpMv0gDcmVfX0=;
 b=kYQ+tlDBtGcp9SXLdOwq9xLeeQUZW5CQtRS5fVdgZgNE25EJISfmdZg4Uolx85Xj/1abPNfKghwWK651ZKh9cW3DMphHZrRYB7uEDYjHcMb8rB9qtudEpT9QKUEnTdXfm/MVLrmXEIENRbRLY9jLKMIGrX403FXaGJ9F0y5hNhqoUmMY3ecJ3qtTFfa23VHCOI/aIrnbKk3gxrav6icQrF8HjYTys4vG96sBe/gUdC6Xr3aJi6x0OBbvjXNmM9zK5u0JPDuPkBvA6MMI2C+yx7ZFydEMZh4VYbOOgf+tHm7YkSNNDQTLPPdxnQ5yAkIcYScpjWvyZ70cXI4x9ajhbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.206) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=de.bosch.com; dmarc=pass (p=reject sp=none pct=100) action=none
 header.from=de.bosch.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L2jRvOTqJa81OAXfam+92vrmJsRw/cWpMv0gDcmVfX0=;
 b=B/UV4Y0bOTMY1lbwXJ0JPso3IfAYhUQCz0UgDm+WCDr1gW/YMI64Ae0RvjGYMrsXiV/vQ5zxBnWOFjE2D0cbN17AGGpJmcdygvBF37TiCtWj3mXPDgVqwDcwrGTyu2lvka3L7Ue2rYson8kv5Pg1kvIvfcTMBzpLVNCsw0LgX42GYlEfMZ59ttSV9sPyvSIQlFKeOq6tcKxIbSLDE4Lw7DtpXklmctYu2nraLYwARel4/cOn8dGCIxwvM4uhSaylNebl/YP2pu73So0k//Kyn5vLI95kpilmQ4CMB/sVFi0ESswHtJI8ESGIpn2UuCBhmueee5WCuyqHEGqiXAvqiA==
Received: from DUZP191CA0013.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f9::10)
 by AM0PR10MB3490.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:154::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Fri, 25 Sep
 2026 13:40:21 +0000
Received: from DB1PEPF000509FF.eurprd03.prod.outlook.com
 (2603:10a6:10:4f9:cafe::9b) by DUZP191CA0013.outlook.office365.com
 (2603:10a6:10:4f9::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.18 via Frontend Transport; Fri,
 25 Sep 2026 13:40:21 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 139.15.153.206) smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.206 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.206; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.206) by
 DB1PEPF000509FF.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Fri, 25 Sep 2026 13:40:20 +0000
Received: from RNGMBX3003.de.bosch.com (10.124.11.208) by eop.bosch-org.com
 (139.15.153.206) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Fri, 25 Sep
 2026 15:40:17 +0200
Received: from GRB-C-0009M.ot.de.bosch.com (10.22.65.242) by
 smtp.app.bosch.com (10.124.11.208) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 25 Sep 2026 15:40:17 +0200
From: <mark.jonas@de.bosch.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <bartosz.golaszewski@oss.qualcomm.com>, <khem.raj@oss.qualcomm.com>,
	Ricardo Simoes <ricardo.simoes@pt.bosch.com>, Mark Jonas
	<mark.jonas@de.bosch.com>
Subject: [meta-oe][PATCH 1/2] libgpiod: set per-package license assignments
Date: Fri, 25 Sep 2026 15:39:28 +0200
Message-ID: <20260925133929.1991-2-mark.jonas@de.bosch.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260925133929.1991-1-mark.jonas@de.bosch.com>
References: <20260925133929.1991-1-mark.jonas@de.bosch.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [10.22.65.242]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FF:EE_|AM0PR10MB3490:EE_
X-MS-Office365-Filtering-Correlation-Id: f49999c3-2ce3-4082-3b52-08df1b0a8b28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|82310400026|1800799024|36860700016|6133799003|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	e+8yx8OOdWPZ/3nnYjbs7PbdsZbUxOPMY1I68rjNnO8NbSeiXKALDtZ53uqKUElaY4mOlJzX59aqG9I/M8bBddV/2wvVN+X/sA83/E+pMmKJwsisVqPm8hSF5rVyXDjfRtQqLRGpfmkGd5zsNPLCLtNIyID8CqzFi/mZlXGBMtnIaj+CyXTWyVbzDwUxcBVx8jr8gnGG7o3ERtYIf8vISYpQMJlMrqJFUW6HUpIZrIIRDrSt+tRDESK8WO/xg3P0Ji+DXRntEYdxKORzYIEQCebAeTO5LrH6OmufvGO8neIwyThbWQYZXeAPZmB21c7UUujXYYtMijH0xvEpCvNX3Mvn5xws657mdZD7UClLvkV51IylK4yd71GWCQiK8BgZz7o1px455dTWJQyf5Cdy7wm8SlYtn6YH9APB8HL9Nb65a90pv6obOom1fbfXTKIAmXfgbu7L+OljSxWPhufEKfjaka155yHlsaAe5qa0TmVa7t2VUlN72Y1fMPN4y3Kw6PstO7Qluoj9bkPdTZFmM5k96Hmn5RHVcAOWx4DAWkzpz950E+GLCikK/Ne2dRXMXzXlU+j7eL739CanFV9VjVg6YcnhA+X124W/PsLQOHwGmVqQI/j9hxf0kK1FfQQDUIFd8zgWRoCWW1lYgPhLyENqkW3oXycrbkMRNJ3U81nvC7h2sfscexg/MWZX+mVdQnKq0y/yy5XY3b2nyj5JHA==
X-Forefront-Antispam-Report: 
	CIP:139.15.153.206;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(82310400026)(1800799024)(36860700016)(6133799003)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	lsCNhwpgDOBw1y3QgogCPD6dkLEdPcXt+XwcGpHSikF7UaHrrjrwygBIzU3xwYevNlW1bOBY+GDHFiknwDE+zoZdXFQxxc/I80+ToVdvsS9Tco6rBwTJxanZ2hnfEdWo7uY8JvsNS8OFbGhBc61dFo+7O0HHMRZWUWFyb9TN6PSn39kqByvJaCFjyHIG/c43e0DaPm01X6H52Uu8qBFylzP/fQD/d85gwp23TcVSrsUZhTWXkNfL34M1Pb/1wxooqhmnGSXrOG+6D23uqmuSe+nTGb9BKbN305GjoanwzkIi+ubEuX3tcI4QS7DWLT2Q7tj97/IKzziJ+5lhBYjPFQd9kMr+TFLcf1Xo/TqcVZgFwBKNHKMrdYhjIwV7z/TFs9BG1rL9qnZa4OUG+KOu3URM+MweWdusoJCh2Kuhi5LZk6zsscsCDf65XcZFuR6N
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 13:40:20.7178
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f49999c3-2ce3-4082-3b52-08df1b0a8b28
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.206];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509FF.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3490
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 25 Sep 2026 13:40:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130301

From: Ricardo Simoes <ricardo.simoes@pt.bosch.com>

libgpiod 2.x has more complex licensing than its 1.x counterpart, with
multiple licenses applying to different parts of the project. Because
the recipe has no per-package LICENSE statement, a user installing just
the library (LGPL-2.1-or-later) might be led to believe it is also
subject to GPL-2.0-or-later and the other aggregate licenses, which do
not apply to that package.

Thus, to make it clear which licenses apply to which parts of the
project, split the recipe-wide LICENSE into per-package values so that
each generated package reports its actual license instead of the
aggregate expression.

Signed-off-by: Ricardo Simoes <ricardo.simoes@pt.bosch.com>
Signed-off-by: Mark Jonas <mark.jonas@de.bosch.com>
---
 meta-oe/recipes-support/libgpiod/libgpiod_2.3.1.bb | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_2.3.1.bb b/meta-oe/r=
ecipes-support/libgpiod/libgpiod_2.3.1.bb
index b3cb33ac89..977405c2fc 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod_2.3.1.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_2.3.1.bb
@@ -3,6 +3,17 @@ require libgpiod.inc
 inherit meson systemd update-rc.d useradd gobject-introspection
=20
 LICENSE =3D "CC-BY-SA-4.0 AND GPL-2.0-or-later AND LGPL-2.1-or-later"
+LICENSE:${PN} =3D "LGPL-2.1-or-later"
+LICENSE:${PN}-cli =3D "GPL-2.0-or-later"
+LICENSE:${PN}-gpiosim =3D "LGPL-2.1-or-later"
+LICENSE:${PN}-glib =3D "LGPL-2.1-or-later"
+LICENSE:${PN}-manager =3D "GPL-2.0-or-later"
+LICENSE:${PN}-manager-cfg =3D "CC-BY-SA-4.0"
+LICENSE:${PN}-tools =3D "GPL-2.0-or-later"
+LICENSE:libgpiodbus =3D "GPL-2.0-or-later"
+LICENSE:libgpiodcxx =3D "LGPL-2.1-or-later"
+LICENSE:libgpiotools =3D "LGPL-2.1-or-later"
+
 LIC_FILES_CHKSUM =3D " \
     file://LICENSES/GPL-2.0-or-later.txt;md5=3Db234ee4d69f5fce4486a80fdaf4=
a4263 \
     file://LICENSES/LGPL-2.1-or-later.txt;md5=3D4b54a1fd55a448865a0b32d415=
98759d \
--=20
2.34.1


