Return-Path: <t.schmelzer@phytec.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA935CA6011
	for <webhook@archiver.kernel.org>; Thu,  8 Oct 2026 10:06:56 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.137])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12208.1791454014281582528
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Oct 2026 03:06:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@phytec.de header.s=selector2 header.b=Uaj7/8Dk;
 spf=pass (domain: phytec.de, ip: 52.101.69.137, mailfrom: t.schmelzer@phytec.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SyvZ1h0/OovJaP80UW9hFhy/YmI3S9riIugZ9EEIQ9TVv6QD8v9QFKdX9Dpclwag9lTPbKWfCj4beIbdTHg5100pw0LYNAsvOsidzj8iJweS1Koq+67T9w7N/ohMZXN2BVIKzZggd/aW0ZZypceSxsIoHzjXsi+PM7ElYdp4L4ReERdCWqZJoEccszPJdZb3Z0hMYaGhO+tv4BFRJ0NBhePHPt9zxNC72D4mbwUZiT8mFOw/Fot9n6zoyu8Wtf9Fav6hunduME+HriHxtzfMt/MYvlKGbQguEbKnm3IcsXCZMngOJqtYwYGLh4gRVELGRSXyJMxVyvTnPgaAbivGQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AzhbtDToBXBOsVdExHbDG9KKXsKsPGwZCKyL0yPfXLY=;
 b=j49lhkXNDCgJiuKy5FYDu5HiRhFXeyOqbVZ1yqHeUSM5w8Xi4Hi93fYroj+lNxQqU90vD6DlJJjo0N+vRENi7/SUZAwjqNXgdeInLej4ULmN0Jzq2g0SwnhwJwAzT4FiL76UKVToL3AjIDD5gOPO3GQwQ+DO8RtgE1YmJS9NuL990HwqK8uVmSZimUjOKPqB9f7W3rbnxp6jZVEJ3ci2r2i7MYHgXJ3C1/GK7P+9xIIg20EYgjTW3KAwaUdoMLQARKGl0xQ18Mi0sRcud4CVK6QlRaZYNuV7byus27KUJIcZeHqvS/Dkx/vjWb/O3lbqaA+hC/zc/6FEq5F6LQ1i9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=phytec.de; dmarc=fail (p=quarantine sp=quarantine pct=100)
 action=quarantine header.from=phytec.de; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AzhbtDToBXBOsVdExHbDG9KKXsKsPGwZCKyL0yPfXLY=;
 b=Uaj7/8DkSZ57cMj+MIYPNgO5EdVviYJ0zlPXioA/LRj8U7HQ8otJa1OWXuFfBTmnY7crKLQzeSrfUjtrBgmns5x6bOKXkz/VLhvtRthxOzdu2yN/5xcTfrsnPoPDuVJ+jcWK12Fuev9N14VOshJ+ugia0ArWCaFOrIye17VRncuAYk9Dg+iVfVS9hNDbdBNrLIXFtLUnSMhAOgPyKW2cJYaLfHsgwY5aCF+ZGwBn7W/mrtgsWezvIThh3qAPY5SXHv4Kg4BFzCdOh19nYwMdNO88S29MbZs/2UOFm0ej+XUxgaa4huCgAuipTX8afeGXhKkm2jXuFhgm1OejP4egQg==
Received: from DUZPR01CA0354.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b8::6) by GV2P195MB3214.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:150:2d1::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.16; Thu, 8 Oct
 2026 10:06:45 +0000
Received: from MAD0EPF000008BA.eurprd04.prod.outlook.com
 (2603:10a6:10:4b8:cafe::56) by DUZPR01CA0354.outlook.office365.com
 (2603:10a6:10:4b8::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Thu, 8
 Oct 2026 10:06:45 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 91.26.50.189) smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 MAD0EPF000008BA.mail.protection.outlook.com (10.167.241.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.14 via Frontend Transport; Thu, 8 Oct 2026 10:06:45 +0000
Received: from augenblix2.phytec.de (172.25.0.51) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 8 Oct
 2026 12:06:41 +0200
From: Thorsten Schmelzer <t.schmelzer@phytec.de>
To: <openembedded-devel@lists.openembedded.org>
CC: <upstream@lists.phytec.de>
Subject: [meta-oe][PATCH 4/5] lvgl-demo-fb: Update to 9.6.0
Date: Thu, 8 Oct 2026 12:06:25 +0200
Message-ID: <20261008100626.2259941-5-t.schmelzer@phytec.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261008100626.2259941-1-t.schmelzer@phytec.de>
References: <20261008100626.2259941-1-t.schmelzer@phytec.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [172.25.0.51]
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAD0EPF000008BA:EE_|GV2P195MB3214:EE_
X-MS-Office365-Filtering-Correlation-Id: 99232537-0cdf-4809-f28b-08df2523dbd3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|1800799024|23010399003|376014|82310400026|42112799006|56012099006|11063799006|18002099003|22082099003|10067099003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	QdtQyYthJZbaoYMYM23UTYISSlbU9j442Edrh8RfjA46RCn848rIftPSJJjJkZ1xcfdq5XIsj/+z96L86OYbIhGsWZzbjNQIpF6WLPT7D6DmU0Wltd4GZv5LSe75D5KSXocEZBnCSECa2APJNowAdFvs4sjqcN8FKiCx3dnmjSIPqyrFUwBxkSuRuevlpqqbKHMU/GrKyoNzlNxAjRTc4nrOyuFo9kTiM1CIUOEMzbwByQLxCkvebgJ8yOEIuwEVzPx1OqQ4P17ZC7UuVfhL4+vhDxKkySfBPq5P+HZce+/c8L3vSjYgVfoFPhCfTFDEcdtRD8fIhWpLrnygZAnz492a/qv8d45WoK+Xrh0S4n1LkSGVKClMsPYMmMTiSuqne8ef9fdZOsjjqiARdIr8l5SwhHhFmh9Crq9sEtNQerAMR84D7y/F8jSYncZ2ifo5M0lodIjrWoI6ipuTaBg4bh8ugvyqR9VNYtQhEKH1iD9ygO9WmdsGj+sie5I/W5FGrJ2/wRHZ6sIZO6QLFSFVNSOHeJrKJZ1WBx7fadC0fR/uoxYEsv4lS/2s1PFfYR4ds7MrqsWkNeRmuj0Xkn0o1z1VvZ7MqgHlvgE7xoKj6MSgSC5AeJgXEKpGYq8SVH+oOpucfLZYGoXtMJnwu33NBO8zzKFkshuHo5E9JinDh9/XpfIpTyFFmThxuQ9AJZtip6ZuWDhWSODuqEDdv5l45g==
X-Forefront-Antispam-Report: 
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(23010399003)(376014)(82310400026)(42112799006)(56012099006)(11063799006)(18002099003)(22082099003)(10067099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	hayD/9XEcKmXhaDt6gPhDn7gziU0/rvX13CBwOvkoIJaQpLcHe1lxWfnyWxoHdviZIhe+KaJ2EkKXah/yTCdm2vsZSK/iJl6DRZkIDynOgrT5Qr5IhyZDwjU935KPhEcs4zjBljSMzDzOJoSpdQdE0wc0toOh/bArG1S1PsiJaY9F9sdrdmp18y5qcGiqBnNJny2jsjsiuncAa59SmIggUa3mFo2OIaJfT4Zm1hFp2nC+4uGYGtcamcLV+oYFBYbXF644hNtWsj2F0JJ5H9OpStTgXiamJGyYMtOBWdVsFeuZZmUeVQ6keXcuLQHivxZND64avb6wb0JycAIQA1xtFIVUtqlsOS0/jrysDbziX3GJCkXueDmrsqFVzsuyUFS8t5Fw3Dw+1mLlEUsNcNRovjOYeAxhCqQE6tSSl9OkmoL8d0VARhq7ln2aeU+8Uc7
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 10:06:45.1324
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 99232537-0cdf-4809-f28b-08df2523dbd3
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	MAD0EPF000008BA.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2P195MB3214
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Oct 2026 10:06:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130668

Drop setting KCONFIG_CONFIG_ROOTDIR to the lvgl subfolder. The demo repo
has now its own Kconfig file.

Signed-off-by: Thorsten Schmelzer <t.schmelzer@phytec.de>
---
 .../{lvgl-demo-fb_9.5.0.bb =3D> lvgl-demo-fb_9.6.0.bb}   | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)
 rename meta-oe/recipes-graphics/lvgl/{lvgl-demo-fb_9.5.0.bb =3D> lvgl-demo=
-fb_9.6.0.bb} (79%)

diff --git a/meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_9.5.0.bb b/meta-oe/=
recipes-graphics/lvgl/lvgl-demo-fb_9.6.0.bb
similarity index 79%
rename from meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_9.5.0.bb
rename to meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_9.6.0.bb
index cd6441ded701..1389fa958ac7 100644
--- a/meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_9.5.0.bb
+++ b/meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_9.6.0.bb
@@ -10,12 +10,12 @@ DEPENDS =3D "python3-pcpp-native"
 PV .=3D "+git"
=20
 SRC_URI =3D "\
-    git://github.com/lvgl/lv_port_linux_frame_buffer.git;protocol=3Dhttps;=
branch=3Drelease/v9.5;name=3Ddemo \
-    git://github.com/lvgl/lvgl;protocol=3Dhttps;branch=3Drelease/v9.5;tag=
=3Dv9.5.0;name=3Dlvgl;subdir=3D${BB_GIT_DEFAULT_DESTSUFFIX}/lvgl \
+    git://github.com/lvgl/lv_port_linux_frame_buffer.git;protocol=3Dhttps;=
branch=3Drelease/v9.6;name=3Ddemo \
+    git://github.com/lvgl/lvgl;protocol=3Dhttps;branch=3Drelease/v9.6;tag=
=3Dv9.6.0;name=3Dlvgl;subdir=3D${BB_GIT_DEFAULT_DESTSUFFIX}/lvgl \
 "
=20
-SRCREV_demo =3D "045137cf0fa1781483cb796261a11b5eb21e99d9"
-SRCREV_lvgl =3D "85aa60d18b3d5e5588d7b247abf90198f07c8a63"
+SRCREV_demo =3D "0728bc4eff0ff85ef787db3f557a654c5c7c9c41"
+SRCREV_lvgl =3D "80ca777e37a2b176770726a02e07a6fb79ef0b39"
 SRCREV_FORMAT =3D "demo_lvgl"
 # The version check runs against the first SRC_URI (the demo repo), whose =
tags
 # are "vX.Y.Z" but top out at v9.2.2 -- below PV 9.5.0+git, which follows =
the
@@ -28,8 +28,6 @@ inherit cmake pkgconfig
=20
 require lv-conf.inc
=20
-KCONFIG_CONFIG_ROOTDIR =3D "${S}/lvgl"
-
 do_install() {
     install -d ${D}${bindir}
     install -m 0755 ${B}/bin/lvglsim ${D}${bindir}

