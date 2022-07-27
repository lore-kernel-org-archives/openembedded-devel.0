Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAFB9C04A68
	for <webhook@archiver.kernel.org>; Wed, 27 Jul 2022 09:46:09 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.135])
 by mx.groups.io with SMTP id smtpd.web12.17716.1658915161540066297
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Jul 2022 02:46:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@leica-geosystems.com
 header.s=selector1 header.b=ut1l2VWN;
 spf=permerror,
 err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}:
 invalid domain name (domain: leica-geosystems.com, ip: 40.107.22.135,
 mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hMk4RfX6KjQ7t/LO76xLvkwn4yskZHmuJ9wuzkW5WFBgHFXb/oNPgJvXmY/ypSIocTQBxr0Ikd+4M2LV+ulWM3vkagqaga0imWNUNeq04w0JUKjgnoWa7EQP53ku+kln3dpAb++aTZLX9ohBJHpnX/zr0DjxDhZLID5SAwbCJqVQ2CiGzyWd0s/7HW6dIKHBq/oGueLSM878V1MDFw+O5oCBs1YuSrQ82FC1RC1KVF+W6cc8+WJ1IMD+GilpNIXLSZW0qrx0/DW6ebFJ8s4/3fTvyCOW/i6JT9o2v17RLeF4gU7cIZmA7k09/mkjf2iE3Sxxfx6G+3PA21tqGlf8qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u7w9KoWsZpGAJgOVgQyM9tbabrHiHbTvsniWDpNFn9c=;
 b=NDT2x8IGt7PePFJhXUKJGkvGTZkyzTt8DkWtydHss2uRy6DGVk2+xdQ6my45X2X8pBFCJEywH4YXUFYWyYy2Zyfy2zjPwi8wsT2nZBuip68dWpTudGuzX1WKRH5UM5dcDpTn7/UAaN/zJIPWfFFnmYTPBJpFgo/XFgOkF5ULo/uKXTHZZ7tA70eeRPndRtQ6KNBArf0KmwRwpTicQT0nY8+XgRaq+/ntEpMbhOG6VLTfeZqWewtv3BsES9yjdXTPUK6Auo+yHVeazJgfutqbZF91YkYUUCCW1ai0UirSxj43Wpp5buC4yycC0iwu5E+DZJMe2M2muCEN8D6jwnKQNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=quarantine sp=quarantine
 pct=100) action=none header.from=leica-geosystems.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u7w9KoWsZpGAJgOVgQyM9tbabrHiHbTvsniWDpNFn9c=;
 b=ut1l2VWNsLK+ZdYSz1PB3JDFaI0LCb+mb1x+mFpjZty6p4uGkZG8UJygkFwNa+ZA5O4rLrEifvUlfU06lHKY/s46o9WDanseAANcCcygM7FzV/Y5DiOmwEJUEaROOu57DC3T1sZQ6MH5oau1z4yNXpjLWJvO+IqjAXb16awZ8qQ=
Received: from FR0P281CA0136.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:96::10)
 by PA4PR06MB8476.eurprd06.prod.outlook.com (2603:10a6:102:2a7::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.24; Wed, 27 Jul
 2022 09:45:58 +0000
Received: from VE1EUR02FT050.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:d10:96:cafe::9f) by FR0P281CA0136.outlook.office365.com
 (2603:10a6:d10:96::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.1 via Frontend
 Transport; Wed, 27 Jul 2022 09:45:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.94 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.94; helo=aherlnxbspsrv01.lgs-net.com; pr=C
Received: from aherlnxbspsrv01.lgs-net.com (193.8.40.94) by
 VE1EUR02FT050.mail.protection.outlook.com (10.152.13.198) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5482.10 via Frontend Transport; Wed, 27 Jul 2022 09:45:58 +0000
From: Johannes Schneider <johannes.schneider@leica-geosystems.com>
To: openembedded-devel@lists.openembedded.org
CC: Johannes Schneider <johannes.schneider@leica-geosystems.com>
Subject: [meta-python][PATCH v1] python3-pystemd: Upgrade 0.8.0 -> 0.10.0:
Date: Wed, 27 Jul 2022 11:45:50 +0200
Message-ID: <20220727094550.2519009-1-johannes.schneider@leica-geosystems.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 51690cbc-1468-4446-5556-08da6fb4cee7
X-MS-TrafficTypeDiagnostic: PA4PR06MB8476:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	P/JQZqILP+Vx9mMFR4q793lrlJtGgl0waASXesY33SFy+pmcyk9YLlxrPvNeb0YJulh3v17gY9QUEW1wVQWIw+hdDlmaad308+W3wrRnmrbievKNnorsmmhoUi+++xFZgCWOeSL8tkeF4jLBHnIwRxkDJk4FWn1HSX2AaL9vdAwF8/ZbBfkbMeHE34bH34nWAGbbAQo5NOu3A6QkaSy5s99GcpTsFJ8KUv2jndGy591W03K+wT37SSPNNg8kXJpOf3gqb6UTTqxRXksFChiwfu2ZDGO1zP/KAc0cd1qhtIykOt6xv1ZOcYQ9lqgWnnE9/98vGBfP5agmMKhaHQ8XJwny3//cHp9YpSSf/7A5BEVuCrNLHlqErYUn5eqgD0nAu0FI6VBDP9RYxKec8YD7MRg6r2LynfAJKSgECwlKAk6Iqf0vmQpuY5Y3+RrBxvafNbDtMvnsuhkACcexV06Xx61NsMaRIE1MLXAiAc47zoQExb8kRvsT/Gyipm+l1XPL8n9UCi435txPNwTDImvm6x6T6qe0ZPMy2jbibKtGTkPh3hXzPY2WTVtnl6rzmM66ELzY4msXux+nxygfFyjkLuCIzyQ818nFJs3+eZoYGTCeg2O6tBV7Hv1H4jH6GYNlGTQ4fuv9MtcMQkJYXbCL59deNqAY2K8YJ8AYgR2TH+xE1rgtkAGtGgV7oBH5JVomI46pDF/X15JVgKLyXTZY4DnkkLH379f5+YAYjAUkTq8biqm/Za9Ghv1MMPYzXJ7/My8ZAWoAU6tZh/6C/MlqFgShu0kgI7BnFm8SStxPJdtgzl/1qhqp/e9J5auTM7oN
X-Forefront-Antispam-Report: 
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:aherlnxbspsrv01.lgs-net.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(396003)(136003)(346002)(376002)(40470700004)(36840700001)(46966006)(36860700001)(8936002)(356005)(82740400003)(83380400001)(44832011)(81166007)(6486002)(5660300002)(118246002)(2906002)(478600001)(26005)(6916009)(40460700003)(40480700001)(47076005)(2616005)(70206006)(8676002)(41300700001)(107886003)(70586007)(316002)(956004)(186003)(1076003)(6666004)(336012)(9316004)(82310400005)(6512007)(4326008)(6506007)(86362001)(36736006)(36756003);DIR:OUT;SFP:1102;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2022 09:45:58.1491
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 51690cbc-1468-4446-5556-08da6fb4cee7
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[aherlnxbspsrv01.lgs-net.com]
X-MS-Exchange-CrossTenant-AuthSource: 
 VE1EUR02FT050.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR06MB8476
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Jul 2022 09:46:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98002

most important fix: version 0.8.0 errors out on dbus-lib interaction,
which is fixed with the most recent commit

505e2b5 (tag: v.0.10.0) add interactive_authorization options for buses
2d90700 pystemd: add copyright boilerplate to typing stubs
5b95888 pystemd: update branch name in github workflow
16817d2 Add type stub for pystemd.run
410fd77 (tag: v.0.9.0) update changelog for 0.9.0
71aae43 GetProcesses() - info about systemd version (#59)
fcafd08 Also include .pxd and .pxi in the source distribution
475cd2f also support 3.9
ea98275 some formatting options and start pystemd 0.9 development
eb7d225 pystemd: update install instructions in README
6fdf2c8 Daily `arc lint --take BLACK`
50e61b7 add a LIBSYSTEMD_VERSION macro for gating new functions (#58)

Signed-off-by: Johannes Schneider <johannes.schneider@leica-geosystems.com>
---
 .../{python3-pystemd_0.8.0.bb =3D> python3-pystemd_0.10.0.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pystemd_0.8.0.bb =3D> =
python3-pystemd_0.10.0.bb} (61%)

diff --git a/meta-python/recipes-devtools/python/python3-pystemd_0.8.0.bb b=
/meta-python/recipes-devtools/python/python3-pystemd_0.10.0.bb
similarity index 61%
rename from meta-python/recipes-devtools/python/python3-pystemd_0.8.0.bb
rename to meta-python/recipes-devtools/python/python3-pystemd_0.10.0.bb
index 0056a794f..0b8216e87 100644
--- a/meta-python/recipes-devtools/python/python3-pystemd_0.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pystemd_0.10.0.bb
@@ -2,13 +2,13 @@ SUMMARY =3D "Python bindings for interacting with systemd=
 over DBus"
 LICENSE =3D "LGPL-2.1-only"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D4fbd65380cdd255951079008b364516=
c"
=20
-SRC_URI[md5sum] =3D "f993739eca645749f18d4ccfd4a0fbf3"
-SRC_URI[sha256sum] =3D "cac2e42043ab28d43adf33dab493c6a3cf8a99794f824ae8af=
6d9cd6458b9972"
+SRC_URI[md5sum] =3D "c8c7337d21a0e9a2e62d1708caf4bdbe"
+SRC_URI[sha256sum] =3D "d74a814bfda01085db1a8ad90be3cb27daf23a51ab6b03e7e2=
9ec811fa2ae859"
=20
 DEPENDS =3D "systemd"
 RDEPENDS:${PN} +=3D "python3-xml python3-pprint"
 REQUIRED_DISTRO_FEATURES =3D "systemd"
=20
-inherit pypi setuptools3 features_check
+inherit pypi setuptools3 features_check pkgconfig
=20
 BBCLASSEXTEND =3D "native"
--=20
2.25.1


