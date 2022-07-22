Return-Path: <radovan.scasny@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6C4FC43334
	for <webhook@archiver.kernel.org>; Fri, 22 Jul 2022 14:46:06 +0000 (UTC)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (EUR02-HE1-obe.outbound.protection.outlook.com [40.107.1.49])
 by mx.groups.io with SMTP id smtpd.web09.8665.1658501162539187132
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Jul 2022 07:46:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@siemens.com
 header.s=selector2 header.b=CBgLLmuF;
 spf=pass (domain: siemens.com, ip: 40.107.1.49,
 mailfrom: radovan.scasny@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OY+fes6xsYDcIWWJHJrZ+VrVPF6GDFcF7PkpLjxlFwAZx+NBJg7zz+jtYq5uTqfXm6aDB/6Lbe16fr7+uVL5P+3mSYx1ScrA/pjI2SiaI3WrPhVs70n7aisK3WuH+JNJ93gbdvykkQbWXE+NEflq/WJHTdXQRhTTKbHp61mNzUUvIiwV4Kln4STWafeuuLfoSx4/wmbC35Q4GpiGA3HN4pE++Z/kfdTU8IpP8nIqz0OKw5TI+QdW0gJGWMgKoK1W+NKmpVEHojThxJMKwYaPSWme9NmzjBzm4VRQK2IB/pTqgpfeJEGr4Zs02fHePXpRT/tkIYB/aYC2JOMmPN1CyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZX+DZGnyKUJ8mTL6f2+HFrBnYciwsHIAC+ZKHNfHkdA=;
 b=bX7uiHCbY22qIRNBHQqD9Pk7Q54RDY3kBw+krkwgDfBt4RFYhyKHjVM0057Ar1gX+BBWzUDVJ/qf32Chq+S+G6CGWMxPx9rXMa+9YsviDXCejLmeoSipeJxQoMjo1U5x8OItmlEezSFn+2JRnonaa/zn/ZN+xl+ZH8cO9Pp4LFwWXd3Qp5u6QCQNNqRMhlH8WiKMPYAdG/J47LqwBs4457P+bT2/WiirUVAsp0xrHjCO8ikOEyis/HKscOKZsVcrpGj4nQLQYpjlcza40kr9jlLsYJ1bM89HsNatyTudUA4TKKh9LXHUP0srytJxW02t3CbzqZ+E5DJ1aFWvusDL/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.70) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=siemens.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=siemens.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZX+DZGnyKUJ8mTL6f2+HFrBnYciwsHIAC+ZKHNfHkdA=;
 b=CBgLLmuF1TKAVAsfjtPS2jybQq6GHTOTAJHksebyxo6VOZFgH/9mP7RrDvgvh1zvD8fGtH+XyH63PPFnpp/SOXrQTXJr6wPieArRVEEwg41YcW81UcaWZqgibMthEAcOh7C5oFh0Qw7GA7g26yEyACfx4fnQ3FYOX4MlCI0rP55SNL8gIdQNoHsex5KPX0+IOFB2r6Ax/1/NpdlrGnUvN2jys7FnQaWL7ppFdr9B7LWV3g3+TOrgxpFFNZJvOABFLlF9RM53JYWgBocWis7Galm6+OrXyXQfUzDUix7c1JB3Zes+JFoBIAy6lO6SiOWg0vlNW74gl4M56UegRQYTzQ==
Received: from OS6P279CA0050.NORP279.PROD.OUTLOOK.COM (2603:10a6:e10:31::8) by
 GV1PR10MB6012.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:5f::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5458.19; Fri, 22 Jul 2022 14:45:59 +0000
Received: from HE1EUR01FT102.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:e10:31:cafe::3f) by OS6P279CA0050.outlook.office365.com
 (2603:10a6:e10:31::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19 via Frontend
 Transport; Fri, 22 Jul 2022 14:45:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.70)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.70 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.70; helo=hybrid.siemens.com; pr=C
Received: from hybrid.siemens.com (194.138.21.70) by
 HE1EUR01FT102.mail.protection.outlook.com (10.152.1.64) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5458.17 via Frontend Transport; Fri, 22 Jul 2022 14:45:58 +0000
Received: from DEMCHDC89XA.ad011.siemens.net (139.25.226.103) by
 DEMCHDC9SJA.ad011.siemens.net (194.138.21.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.9; Fri, 22 Jul 2022 16:45:58 +0200
Received: from dev.localdomain (163.242.52.226) by
 DEMCHDC89XA.ad011.siemens.net (139.25.226.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.9; Fri, 22 Jul 2022 16:45:57 +0200
From: Radovan Scasny <radovan.scasny@siemens.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Radovan Scasny <radovan.scasny@siemens.com>
Subject: [meta-oe][PATCH v2] libwebsockets: update to version 4.3.2
Date: Fri, 22 Jul 2022 16:45:47 +0200
Message-ID: <20220722144547.12435-1-radovan.scasny@siemens.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [163.242.52.226]
X-ClientProxiedBy: DEMCHDC89XA.ad011.siemens.net (139.25.226.103) To
 DEMCHDC89XA.ad011.siemens.net (139.25.226.103)
X-TM-AS-Product-Ver: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-AS-Result: No-10--10.975300-8.000000
X-TMASE-MatchedRID: ZpedOW41UV1grYx6ioZiu5r/fMPB4M8r7VrXqiqnwHUItCy6ZX/lL7gZ
	IOJjEsJdtmTuCy5+VUol0xNl2ezMqmTFTmKAtyeuFvqzeB993ZESUfqXUQ9E2DsKXyzHgcEbwEM
	6ofA+CGPfc2Xd6VJ+ykE8NsLEEcuFfwBiuMCJwTJ+lccVhYJB16PFjJEFr+olwXCBO/GKkVr3FL
	eZXNZS4KBkcgGnJ4WmN5u4kkUqEElh6oxbKNO9n1ddJFixE8cTbYInQ6NMssF+3BndfXUhXQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--10.975300-8.000000
X-TMASE-Version: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-SNTS-SMTP: 
 646462F80B91347CC1B6B34253480ADBDA7190E3178DF3BDE1CAFB6212F080532000:8
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 864cede1-099d-4341-f9eb-08da6bf0e422
X-MS-TrafficTypeDiagnostic: GV1PR10MB6012:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	kmIEMGrJ9YxKkfncMxNMemM+TraDYYdWGBcCbYKrkEWxPblb7JjeoB+x/eAP7AlOxe4NxC9jFFlkaTnXD6ySbsxjtmbQ/XF++ihY7NbbUDYwG0CMVuyvQx8ZCK0X3bYQRKl/Lth6lrmhvMc1/Ne6wZ9bz3QFsi5umfrMeztPT73kXmdL0SoC3MVxVow3YdWy0zXCQfzU5llUxj+dpnXcneqOc75ThSmG9mmEpl3mGyrKLbPO0DFJLDCN9HmF1uWzfCd39Dgk5oXn6j611m6hx3hjem4cyKTF6m+0kfAJR2aLeCtOZKFdCNKotsucM5n+NmksScVBmiQG2QQQdL4sTl4IfObzYhs5+ojubddFhr8S+lhYUW2bE0Hkg3rwkxhxpwN2hkPqeGMFcpNvr6lYSJ6T2r/OvNnsYEepLd2KKil4Y1dL9SCcfifC0smGyR552Cj0GX49w7e0ROyLGbugqT9TzvF2+44DVOhNky6gyDxtF+uk6O/a7JqT3grlhkmZZK9eKiG5+zxrdzygG4UJpmZNZnrVIr2ATEx+yCjml7Flxk6CHq6o7paV1IAIWYqFD9lhRIdx0iCjLL4i6AfQuLxVBhSObmpAh/SKSYSbXU5syH1Ra73NBfWUyXLLivViM/n0lku2qmPnKM9MzYO9nV8oDReQrfbCAWvgiz2eMYWmKV3ZfTW2DLtoo8yTcIn2zFeisoRykwvx0AeQTouuy6tWcjQJobDHPc3Ym5x/S3s4otrVaKBgI20ZdwBGpZ1qokMob4J2cDgDvqRVEj8SuqwbzBf4WIP2WcqUnp6WDOjg13kU9/HK+s+wEVcjz+oixgHobTAGjVT4YUW0TAKgXg==
X-Forefront-Antispam-Report: 
	CIP:194.138.21.70;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:hybrid.siemens.com;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(346002)(376002)(136003)(396003)(46966006)(40470700004)(36840700001)(6916009)(40480700001)(36756003)(70586007)(70206006)(8676002)(40460700003)(4326008)(5660300002)(86362001)(44832011)(8936002)(36860700001)(478600001)(316002)(41300700001)(82310400005)(7596003)(16526019)(956004)(6666004)(7636003)(2906002)(186003)(82960400001)(26005)(356005)(82740400003)(1076003)(47076005)(2616005)(83380400001)(336012)(107886003);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2022 14:45:58.9343
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 864cede1-099d-4341-f9eb-08da6bf0e422
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.70];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	HE1EUR01FT102.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB6012
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Jul 2022 14:46:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97954

License was changed by adding BSD-2-Clause in ieeehalfprecision.c

Signed-off-by: Radovan Scasny <radovan.scasny@siemens.com>
---
 .../{libwebsockets_4.2.2.bb =3D> libwebsockets_4.3.2.bb}    | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-connectivity/libwebsockets/{libwebsockets_4.2.2.bb =
=3D> libwebsockets_4.3.2.bb} (90%)

diff --git a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.2.2=
.bb b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.3.2.bb
similarity index 90%
rename from meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.2.2.=
bb
rename to meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.3.2.bb
index 2a3a4ebd0..da6fd9293 100644
--- a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.2.2.bb
+++ b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.3.2.bb
@@ -1,13 +1,13 @@
 SUMMARY =3D "Canonical libwebsockets.org websocket library"
 HOMEPAGE =3D "https://libwebsockets.org/"
-LICENSE =3D "MIT & Zlib & BSD-3-Clause & Apache-2.0"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc8bea43a2eb5d713c338819a0be0779=
7"
+LICENSE =3D "MIT & Zlib & BSD-3-Clause & Apache-2.0 & BSD-2-Clause"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D382bfdf329e774859fd401eaf850d29=
b"
=20
 DEPENDS =3D "zlib"
=20
 S =3D "${WORKDIR}/git"
-SRCREV =3D "8d605f0649ed1ab6d27a443c7688598ea21fdb75"
-SRC_URI =3D "git://github.com/warmcat/libwebsockets.git;protocol=3Dhttps;b=
ranch=3Dv4.2-stable"
+SRCREV =3D "b0a749c8e7a8294b68581ce4feac0e55045eb00b"
+SRC_URI =3D "git://github.com/warmcat/libwebsockets.git;protocol=3Dhttps;b=
ranch=3Dv4.3-stable"
=20
 UPSTREAM_CHECK_URI =3D "https://github.com/warmcat/${BPN}/releases"
 UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>\d+(\.\d+)+)"
--=20
2.20.1


