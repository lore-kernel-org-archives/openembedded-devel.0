Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED936C04A68
	for <webhook@archiver.kernel.org>; Thu, 28 Jul 2022 03:57:04 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.138])
 by mx.groups.io with SMTP id smtpd.web10.28671.1658980624071195705
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Jul 2022 20:57:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@leica-geosystems.com
 header.s=selector1 header.b=vGUr7pXM;
 spf=permerror,
 err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}:
 invalid domain name (domain: leica-geosystems.com, ip: 40.107.22.138,
 mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DZo1j74D8yepmKGsb02FLGSVV9AC14rpYCmN0f3m04+mpZKM3I6vJ8BvTjprGS3L15/qi0zS4tAorUooXC2NNiqklQt/n29Sp5xzbsGASMuOY8jJ1kI9cjEmliAwyKJQjLBtYrzNUy/td0yapMJY2CgmVZSHFs7N7Xj6a2Uk3Mq3HsMrG2LxG6f7REXLIUMcfW+Ncfj85AjupMeCGYkG274BxLC+3J2u/t8Q1T/QP+qPAJ8XQPYPe3Buww/KvQUVQ2vP5m1lQuEbzXpiLIz+a2jEAkYUV6NcKt388sRdXwDDqG8TxN++RXGKHQBNA5WDUORZqMf4Dw4Yg8a8e7iEEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QqGtlv1KZpc+3mciwf9udYYa6sQYs9vJIZB9+eUlk4A=;
 b=gXynbDMWAJ+Q0a7smZp9rZTnK7N7QjcIow65Yxe/jDCA0lxz2wrGeoxLJpkGO87x8K3Bsy9CQ7kbkkDNmH86dnApz14p3FA8QR1HWnVGgrCUh5yOEMy6fO7a5i6m7P5xyIS25DmBPP2OLNLmfVWPPcB1N9Gyzx3jXzSqQ/CntBzup/0qFy27wNFJZx9y3lP0HxHeW/pMZTY3IRoCltMG3xaEWaySXRfNyPi0ktlckoTjrZ5nlrDz4l7StchBq2jW02CTOP3Mj15vVK0d2tyVl7qI511CpRVEkkdUlVkx4io3yvVPZGr4gZ/npD1BsLHShQDhasaT4Bz6an3R6CusnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=temperror (sender ip
 is 193.8.40.94) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=temperror action=none
 header.from=leica-geosystems.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QqGtlv1KZpc+3mciwf9udYYa6sQYs9vJIZB9+eUlk4A=;
 b=vGUr7pXMj7DcZJbcrKGP2osnlkNVa9yd84v0XhLMK986BgbZKHLNWMViXAdG7G9SnUjCk46zFD7Z5tgA4W7rq/GTlO+noh6BT7A/J2ti/tyUmxRszgjV/AJoge49eCfCgSL1piafIbvQCzlN12qro33AJcLHJKHZ8XkG5DdCLJI=
Received: from AS9PR04CA0108.eurprd04.prod.outlook.com (2603:10a6:20b:50e::25)
 by VI1PR06MB4142.eurprd06.prod.outlook.com (2603:10a6:802:5b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23; Thu, 28 Jul
 2022 03:57:00 +0000
Received: from AM5EUR02FT081.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:20b:50e:cafe::c0) by AS9PR04CA0108.outlook.office365.com
 (2603:10a6:20b:50e::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.12 via Frontend
 Transport; Thu, 28 Jul 2022 03:56:59 +0000
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=temperror action=none header.from=leica-geosystems.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of leica-geosystems.com: DNS Timeout)
Received: from aherlnxbspsrv01.lgs-net.com (193.8.40.94) by
 AM5EUR02FT081.mail.protection.outlook.com (10.152.8.217) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5482.11 via Frontend Transport; Thu, 28 Jul 2022 03:56:57 +0000
From: Johannes Schneider <johannes.schneider@leica-geosystems.com>
To: openembedded-devel@lists.openembedded.org
CC: Johannes Schneider <johannes.schneider@leica-geosystems.com>
Subject: [meta-python][PATCH v2] python3-pystemd: Upgrade 0.8.0 -> 0.10.0:
Date: Thu, 28 Jul 2022 05:56:55 +0200
Message-ID: <20220728035655.934290-1-johannes.schneider@leica-geosystems.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 3c4b1a5a-228d-4947-a906-08da704d3802
X-MS-TrafficTypeDiagnostic: VI1PR06MB4142:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Y8AYhe950+WkQf/KGple4Ta3Arfv8+i2QF2zfmUYJFK+L4Ohg11fu79ST2/7qnueYaeo1//oRvh/LAS9oLJHapKiTd5YGZfrWNK32TE/YqgC0v/wQmyoCjnPQ4J0ck6lz7YtQD7fxpJMZfikavIItWTaVpE0kw8w7Bh1DcKyT46CgH+hTKJgcUUrC3kohis0/J3/9TSP8AqAjgcM6Uw9VCxmsqok/3nSVMGkJZHUmn9DU9mubeMAeUOcAabTkY2jXMFMw2qSx54eBh1fM1/1NYHVtecD/4fkYFK/yH5VeOSxKEquQsOV8RuHPLOF3RBv6OrnDi4gOvRGDAXs0DpObc1LeivwOOyqiU9LspT/xL38WQnDnb3zRsYMP20Qxq2R0OTnI6SUP7jUDLAHBr1VkykYf4QiUbLEZjSO8u60DlHH+o5ATtldguGEzL3sj7IGESeiVzuNWg4rLhQ0g1LQyPNF95Rc5lFS3qcilOAH4bpIZelZjspyUqkiKlRQ1GDR+dChkhUHjBt5/HUUSrlswh0iMd9GpJSbYANpHiGC3+UIzCpdFFRKV27Ix6NWES0gHg8ej5bLnpmFFEmtgY8esO1WF4vV4w0HeBGuhVGvaINXVCm7m781e7fu7tEuO3ZtujzY+r4Glxt8BcrvjCTJnxT/QFY+eogqCp4FkaY/iUS5ZQMQnsSWRk2w50nR32tnA1np8i+8kAQyH4Qwo7/1mqaw+P6WO5C7kpAI0XXjeNSjF3tPzE4l8mItexJ5mOks0o8V8wjKvDQzYu0ZSJDpDjvbVKK1W5ZVIupm0JtnQKzUKX38PRtPnClrhcHSWixS
X-Forefront-Antispam-Report: 
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:aherlnxbspsrv01.lgs-net.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(346002)(376002)(136003)(396003)(40470700004)(46966006)(36840700001)(26005)(5660300002)(9316004)(8936002)(118246002)(1076003)(40480700001)(86362001)(2906002)(4326008)(8676002)(44832011)(36756003)(6916009)(186003)(82310400005)(70586007)(316002)(36736006)(107886003)(2616005)(478600001)(70206006)(6486002)(6512007)(41300700001)(40460700003)(82740400003)(47076005)(36860700001)(336012)(356005)(63350400001)(63370400001)(83380400001)(81166007)(956004)(6506007);DIR:OUT;SFP:1102;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2022 03:56:57.9900
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 3c4b1a5a-228d-4947-a906-08da704d3802
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[aherlnxbspsrv01.lgs-net.com]
X-MS-Exchange-CrossTenant-AuthSource: 
 AM5EUR02FT081.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR06MB4142
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 28 Jul 2022 03:57:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98030

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
 .../{python3-pystemd_0.8.0.bb =3D> python3-pystemd_0.10.0.bb}  | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pystemd_0.8.0.bb =3D> =
python3-pystemd_0.10.0.bb} (62%)

diff --git a/meta-python/recipes-devtools/python/python3-pystemd_0.8.0.bb b=
/meta-python/recipes-devtools/python/python3-pystemd_0.10.0.bb
similarity index 62%
rename from meta-python/recipes-devtools/python/python3-pystemd_0.8.0.bb
rename to meta-python/recipes-devtools/python/python3-pystemd_0.10.0.bb
index 0056a794f..da263fe94 100644
--- a/meta-python/recipes-devtools/python/python3-pystemd_0.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pystemd_0.10.0.bb
@@ -2,13 +2,12 @@ SUMMARY =3D "Python bindings for interacting with systemd=
 over DBus"
 LICENSE =3D "LGPL-2.1-only"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D4fbd65380cdd255951079008b364516=
c"
=20
-SRC_URI[md5sum] =3D "f993739eca645749f18d4ccfd4a0fbf3"
-SRC_URI[sha256sum] =3D "cac2e42043ab28d43adf33dab493c6a3cf8a99794f824ae8af=
6d9cd6458b9972"
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


