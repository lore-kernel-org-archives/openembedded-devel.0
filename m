Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2AF2CCF9E3
	for <webhook@archiver.kernel.org>; Sat, 25 Oct 2025 03:18:23 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.33])
 by mx.groups.io with SMTP id smtpd.web11.735.1761362301193517630
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Oct 2025 20:18:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=dqF2GKWo;
 spf=pass (domain: axis.com, ip: 40.107.162.33, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nLvDNu2a1rXKGNJ5v5JZb9GgAeMwdBWGJap6/pshTtVg//OAtDqNjf/7AnehO1u1QhAX+AglwsHxSypsKbf2bn2MGTmfAvkzsu97o2ZHMBcfXmvsqmtDuh5Yo0120HOQZDGiGqWqWwirMKsWhuPGWDkMZxhhiTdjFHtXsHzHDiOi6f1eVyvEHdTJpCZZJo4eyeCwg8jALrV7k4erKK6tPjTw3l+S5qZuQg3X5keM6+0e44TNVabo5EfhPgVaTIgxMJw7vB7EOriktZjFq8kqNZjdkoauokAkfkYWmUwU9kce2uuOyfvK/w2ABybkMDJ/muiVRqghxKvJun1EQbLjXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vIl/1UOkklRs9HXpi3U0YZOeZAO/IKYDhF3kbVBFkDs=;
 b=yPvmcufss/a66tTUQVgcgjYJvTSZWBz6UUmpLBuyUrNItImHni/zuoJlfghNUCHN/hWocuuYRrxnalinwx8KnSDY/2LiAIpL76uEBoKK2raPQl70WndMFhxZBzI0nP7A2bDfOZdkclwadvX7Gs7kYMaZzEfnSe/NnvPhOcwocv5rqOpMCTo793lMNhF23LMeDL+RsH5hC7PuZursrW8XGIw1yzoWCHNGHqNQ7Gs1bvOvaN71RC92G3gy/YzZC+H9fhBsLCzs7DRy6c3Gwl0SC7uWMSG/ahpefsQPPy1ugOubO9Sfn7boObx7E9IzcS3igTtI1UaGGBvS5hVUm/noVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vIl/1UOkklRs9HXpi3U0YZOeZAO/IKYDhF3kbVBFkDs=;
 b=dqF2GKWouRNu1TqiGIfTexe/MwK/ST9KoMPc9D9Y/omB4t67sIJU6J3OnbTFDV5gJrlBhNnHLyL8683TS6ZHb0gmLnQFWWCyg2fQV0ZpK5vplyvMxOza822B0vHczdC1pHIe3iDhD+Y6loBUyln6hyBaMup/ZJXihlw5B31jsmA=
Received: from DU7P251CA0016.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:551::31)
 by DB9PR02MB6842.eurprd02.prod.outlook.com (2603:10a6:10:21d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.15; Sat, 25 Oct
 2025 03:18:15 +0000
Received: from DB5PEPF00014B94.eurprd02.prod.outlook.com
 (2603:10a6:10:551:cafe::9f) by DU7P251CA0016.outlook.office365.com
 (2603:10a6:10:551::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.13 via Frontend Transport; Sat,
 25 Oct 2025 03:18:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB5PEPF00014B94.mail.protection.outlook.com (10.167.8.232) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9253.7 via Frontend Transport; Sat, 25 Oct 2025 03:18:14 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61; Sat, 25 Oct
 2025 05:18:13 +0200
Received: from se-mail01w.axis.com (10.20.40.7) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61; Sat, 25 Oct
 2025 05:18:13 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2507.61 via Frontend
 Transport; Sat, 25 Oct 2025 05:18:13 +0200
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 2EF002C9
	for <openembedded-devel@lists.openembedded.org>; Sat, 25 Oct 2025 05:18:13 +0200 (CEST)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id E30961207A3; Sat, 25 Oct 2025 05:18:11 +0200 (CEST)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH 3/9] lvgl: Update to 9.4.0
Date: Sat, 25 Oct 2025 05:17:42 +0200
Message-ID: <20251025031748.2728416-3-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251025031748.2728416-1-pkj@axis.com>
References: <20251025031748.2728416-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B94:EE_|DB9PR02MB6842:EE_
X-MS-Office365-Filtering-Correlation-Id: 74a67681-2456-4528-37a5-08de137522dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?DSQA+DdX9xxU2G4XKChgaNogYY4jaNF4H4gFlqTusof58eYGUuNF/cJhm8U5?=
 =?us-ascii?Q?GnzzBrJeOMoBLu1eXCIrul85P/iI9R4WNn76DkaTQyFiE5Nl2J6FZ/DzJv/w?=
 =?us-ascii?Q?FixvUjMlhvHPN7D/Z9JSqCfj4FBmejeYwyJ0c77J0w2Io1Z726GUW0wfYb+S?=
 =?us-ascii?Q?4f63RLDfOabFyciYMSVxpMAqpXicOQMW7gQkH4m5GW7PahYy20vpS2Waaymf?=
 =?us-ascii?Q?E7co0k5BIWi0wOWbsEIJ+l1w2rig8JEftlKyLveZ2VGXB0ihOP0ygZ0QgIdV?=
 =?us-ascii?Q?DZwaOp0UaX6syhJ9xuApCJnRI8lmYZC3U7F6OYVvmvRgje4OWNdemjZdBRry?=
 =?us-ascii?Q?wsAymVzybIRXasRW51Uu2/aKyqpjJWddqIrMq6p2PDmSjb2ELQMW+P9nzoKZ?=
 =?us-ascii?Q?y0idS1B2fO/6hsMWYmo3jXEYR0uhurA/caVV7c/jMeVxk7Zamil/oEDkrjYN?=
 =?us-ascii?Q?P7WF+DXNJ5Z+WLWIYuH9KwbQ1IwC2CUtDhP1GQS2NI6T08NMTr7+XiT3DGfy?=
 =?us-ascii?Q?N4bP44fCbqYeepETlTB8yyXS43pUDbNb06xr39OXZSKUq+o7VnJKlTkvHuLk?=
 =?us-ascii?Q?gCFV/66UioxvFweYITwD9J6qSSzk3Kr4HNcFWAHpXb4o/3j2NmatmMsifILP?=
 =?us-ascii?Q?1TLYmNxsYpqx5XrzG2ZPZKGi+xXcvuEZWB8jFOnDtNgIWxu6EsT516/yQChk?=
 =?us-ascii?Q?nZeL0H/DiplhZL8ANAOxhW0vZU9Oxn/RjkfZNziXJfWr96IF7a3gtmSkoi3E?=
 =?us-ascii?Q?TCiYmB6jr8ANZ3ZFl7umwZUl0sYJ3GS3r79K5t0mkN7a282B9O/dzqWKx0B/?=
 =?us-ascii?Q?oay7Vv2IPCfWNq5BuuatEYtMja1fRXZ4+TvYj5f2np+ScGoVGnZJaIJVREXO?=
 =?us-ascii?Q?zQVDmhVrb8O5RQizRCqQkovlSlOmCju4gx4zTkF4hjIi1uhR+6A/U0f4E7Vy?=
 =?us-ascii?Q?JvNN5LNHgu7EecKEHQAZi3qIYY2YwFdm8/pxV6rQfXFaewrwMl1//hkn0iZS?=
 =?us-ascii?Q?+Ld9j5e5/oU0hCf0yQgR6bt66ypQ9DOP/zBWeAAqU48/gGpLkBEcIIjElkhk?=
 =?us-ascii?Q?86IeJiazwR70g+0nyS2S02B83c4c6M80PdZM9AxrXZYKaiat04GSuCFgnntC?=
 =?us-ascii?Q?jHrJLeGfEs62TshfaiIkJ0JkN+Yxt14YHGf6HQvFKq/jz9xy/dWyZ8UDWa13?=
 =?us-ascii?Q?qeI9RlbC8ftu0yx8Cwos015ooDe+8A2cjqjiK8DJsf2hr9zc3d2krx2wzR+h?=
 =?us-ascii?Q?awQV1BU82eHNrjxS+vxHMhleGwXfBLUKijgA/l6+8CyegAr9qjniH7KZvDwW?=
 =?us-ascii?Q?uLCAIRE6NVM63CxxHQOL8KH6jSABDPaSpfrOcNPau8owumIW7erAPrBQq1X9?=
 =?us-ascii?Q?PIVn/V2sZQ1FYlD8rMX7CIOdRIC0XEoyBcx7XNbam2t+esDm7uw2csfklbe6?=
 =?us-ascii?Q?ndkLXKSyr+GuS2iA49me1RjN9FZtQBIWp9PEtj/BObKarqrsHh7IhUNs0i3X?=
 =?us-ascii?Q?bBk73Df0/jv/dDk=3D?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2025 03:18:14.9600
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 74a67681-2456-4528-37a5-08de137522dc
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B94.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR02MB6842
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 25 Oct 2025 03:18:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120982

Drop manual installation of lv_conf.h. It has not been needed since at
least 9.2.2.

License-Update: Copyright year updated to 2025
Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta-oe/recipes-graphics/lvgl/lv-conf.inc   | 12 +++++-----
 meta-oe/recipes-graphics/lvgl/lvgl_9.2.2.bb | 25 ---------------------
 meta-oe/recipes-graphics/lvgl/lvgl_9.4.0.bb | 20 +++++++++++++++++
 3 files changed, 26 insertions(+), 31 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/lvgl/lvgl_9.2.2.bb
 create mode 100644 meta-oe/recipes-graphics/lvgl/lvgl_9.4.0.bb

diff --git a/meta-oe/recipes-graphics/lvgl/lv-conf.inc b/meta-oe/recipes-gr=
aphics/lvgl/lv-conf.inc
index 69e42af922..d341c8a6da 100644
--- a/meta-oe/recipes-graphics/lvgl/lv-conf.inc
+++ b/meta-oe/recipes-graphics/lvgl/lv-conf.inc
@@ -7,7 +7,11 @@ PACKAGECONFIG[thorvg] =3D ",,"
 PACKAGECONFIG[sdl] =3D ",,virtual/libsdl2 libsdl2-image"
=20
 # Add libdrm include if drm is selected in PACKAGECONFIG
-TARGET_CFLAGS +=3D "${@bb.utils.contains('PACKAGECONFIG', 'drm', '-I${STAG=
ING_INCDIR}/libdrm', '', d)}"
+LVGL_FLAGS +=3D " \
+    ${@bb.utils.contains('PACKAGECONFIG', 'drm', '-I${STAGING_INCDIR}/libd=
rm', '', d)} \
+"
+CFLAGS +=3D "${LVGL_FLAGS}"
+CXXFLAGS +=3D "${LVGL_FLAGS}"
=20
 LVGL_CONFIG_USE_DRM =3D "${@bb.utils.contains('PACKAGECONFIG', 'drm', '1',=
 '0', d)}"
=20
@@ -45,11 +49,7 @@ LVGL_CONFIG_USE_FLOAT =3D "${@bb.utils.contains('PACKAGE=
CONFIG', 'thorvg', '1', '0
=20
 DEBUG_BUILD ??=3D "0"
=20
-ALLOW_EMPTY:${PN} =3D "1"
-
-EXTRA_OECMAKE +=3D "-Dinstall:BOOL=3DON -DLIB_INSTALL_DIR=3D${baselib}"
-
-do_configure:append() {
+do_configure:prepend() {
     # If there is a configuration template, start from that
     [ -r "${S}/lv_conf_template.h" ] && cp -Lv "${S}/lv_conf_template.h" "=
${S}/lv_conf.h"
=20
diff --git a/meta-oe/recipes-graphics/lvgl/lvgl_9.2.2.bb b/meta-oe/recipes-=
graphics/lvgl/lvgl_9.2.2.bb
deleted file mode 100644
index 28306a1101..0000000000
--- a/meta-oe/recipes-graphics/lvgl/lvgl_9.2.2.bb
+++ /dev/null
@@ -1,25 +0,0 @@
-# SPDX-FileCopyrightText: Huawei Inc.
-#
-# SPDX-License-Identifier: MIT
-
-HOMEPAGE =3D "https://lvgl.io/"
-DESCRIPTION =3D "LVGL is an OSS graphics library to create embedded GUI"
-SUMMARY =3D "Light and Versatile Graphics Library"
-LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://LICENCE.txt;md5=3Dbf1198c89ae87f043108cea6246=
0b03a"
-
-SRC_URI =3D "\
-	git://github.com/lvgl/lvgl;protocol=3Dhttps;branch=3Drelease/v9.2 \
-    file://0001-thorvg-fix-build-with-gcc-15.patch \
-	"
-SRCREV =3D "7f07a129e8d77f4984fff8e623fd5be18ff42e74"
-
-inherit cmake
-
-EXTRA_OECMAKE =3D "-DLIB_INSTALL_DIR=3D${baselib} -DBUILD_SHARED_LIBS=3DON=
"
-
-require lv-conf.inc
-
-do_install:append() {
-    install -m 0644 "${S}/lv_conf.h" "${D}${includedir}/${BPN}/lv_conf.h"
-}
diff --git a/meta-oe/recipes-graphics/lvgl/lvgl_9.4.0.bb b/meta-oe/recipes-=
graphics/lvgl/lvgl_9.4.0.bb
new file mode 100644
index 0000000000..04ee34a61f
--- /dev/null
+++ b/meta-oe/recipes-graphics/lvgl/lvgl_9.4.0.bb
@@ -0,0 +1,20 @@
+# SPDX-FileCopyrightText: Huawei Inc.
+#
+# SPDX-License-Identifier: MIT
+
+SUMMARY =3D "Light and Versatile Graphics Library"
+DESCRIPTION =3D "LVGL is an OSS graphics library to create embedded GUIs."
+HOMEPAGE =3D "https://lvgl.io/"
+
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://LICENCE.txt;md5=3D4570b6241b4fced1d1d18eb691a=
0e083"
+
+SRC_URI =3D "git://github.com/lvgl/lvgl;protocol=3Dhttps;branch=3Drelease/=
v9.4;tag=3Dv9.4.0"
+
+SRCREV =3D "c016f72d4c125098287be5e83c0f1abed4706ee5"
+
+inherit cmake
+
+EXTRA_OECMAKE +=3D "-DLIB_INSTALL_DIR=3D${baselib} -DBUILD_SHARED_LIBS=3DO=
N"
+
+require lv-conf.inc

