Return-Path: <mark.jonas@de.bosch.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11975C2BBCA
	for <webhook@archiver.kernel.org>; Fri, 28 Jun 2024 09:15:25 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.53])
 by mx.groups.io with SMTP id smtpd.web11.13266.1719566116113551873
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Jun 2024 02:15:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@de.bosch.com header.s=selector2 header.b=r1OqCNnF;
 spf=pass (domain: de.bosch.com, ip: 40.107.247.53, mailfrom: mark.jonas@de.bosch.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iQDn5JOvmPPXg7AJRTPdvfa9sEpPGmJfDcbaO9KQwv8S5ttCpAtWYpMtAiIQFEx2kWDXGmCKoUGYGafoitauCjCWoi0nDpvFCSEd2VKerdADCN+bXUOyMU13Gpi/ZPTCFfvQWzvYlreiSiAxJ+oQaMMVxheUL6S4kT4zhCx+lZiiaq5tGHS+Yr60fGahDOgdnxe1S4Jltn9UE1anYIMaGQnoR+si9+E95BH2LipEIx2d4BzJYf52x79fbYd9XlwUiWtSV0oEymYQA0dgCkCqPriGyykptmGuCJv1/vaPonP3Aszez9fJpUPKoR8GtI2z5aw018kyinnQu+34BO+NCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LS26QV2pzbkN0zA23uckp4uD3PozOIIctbSedwfHC2M=;
 b=lFUOe4dITVBB2dfx75qfnl9ciZiDAEC6Wmb8GcgXy4xTr+XjFJGcq+dssPdGnNg9Yza0GvGRlGpFP2gy87SRsdrR8u8SjnDVTkxkwiwSAgm+GMlINhpcR0UtBn4fVpQraXtQ7lnxjpk6mMxfg6qds33xlZawhVENDKcneb6kkPdimpARBbdPN4M04cfQ5p5IsSTfq+GUn7RuL4gwXXCG8gcCOdONOWWsf7/RGx24mPnmt4uE0RPY0ZvjMu6hzMpbvgGTmw5Vhd6DOmZn8jWTvNHJz8utUhscadBYNtw15mNiIl27zkPVwlPjYHOawcr+mZtsJG5MHxin5ZGDwsuMEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.206) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=de.bosch.com; dmarc=pass (p=reject sp=none pct=100) action=none
 header.from=de.bosch.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LS26QV2pzbkN0zA23uckp4uD3PozOIIctbSedwfHC2M=;
 b=r1OqCNnFPweskJet4IZw9RBYUPLm/hpsdhX+mtOumNn4YY/hxa/36By00DIFzM1kr91E+qa3JsAKSC58WJxEnAARf8HdO1UIyDGCgQzvWtwhNyJ4ZRhp15TApGqAjjEcftNb+e2lxI+5YbmlUh/feC1erANeY8pp3ITk9ykP6gCFHfyPJnsC5WhlZJnZggVVR+pxGuGX8bsej0npbXSNGLT81Z/d+urvJX0T/bhDrGk7lp//NC7zuAVkML/oig6n4z71gKQ6Bq1OtuhU0j2Hq3nxkfr6y5/15UcZof4hVXKA6R+yaCGQrzonWfR0Fmz1vUs+cp0pxMQlqqd//vhLOw==
Received: from DB7PR02CA0028.eurprd02.prod.outlook.com (2603:10a6:10:52::41)
 by AS2PR10MB6927.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:579::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.26; Fri, 28 Jun
 2024 09:15:12 +0000
Received: from DU6PEPF0000B621.eurprd02.prod.outlook.com
 (2603:10a6:10:52:cafe::92) by DB7PR02CA0028.outlook.office365.com
 (2603:10a6:10:52::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.38 via Frontend
 Transport; Fri, 28 Jun 2024 09:15:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.206)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.206 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.206; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.206) by
 DU6PEPF0000B621.mail.protection.outlook.com (10.167.8.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7677.15 via Frontend Transport; Fri, 28 Jun 2024 09:15:12 +0000
Received: from SI-EXCAS2001.de.bosch.com (10.139.217.202) by eop.bosch-org.com
 (139.15.153.206) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 28 Jun
 2024 11:15:04 +0200
Received: from GRB-C-0009M.ot.de.bosch.com (10.139.217.196) by
 SI-EXCAS2001.de.bosch.com (10.139.217.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 28 Jun 2024 11:15:04 +0200
From: <mark.jonas@de.bosch.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <raj.khem@gmail.com>, Ricardo Simoes <ricardo.simoes@pt.bosch.com>, "Mark
 Jonas" <mark.jonas@de.bosch.com>, Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH] magic-enum: Disable unused-value warning in tests
Date: Fri, 28 Jun 2024 11:12:56 +0200
Message-ID: <20240628091256.9644-1-mark.jonas@de.bosch.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [10.139.217.196]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000B621:EE_|AS2PR10MB6927:EE_
X-MS-Office365-Filtering-Correlation-Id: 48bdd5ca-dbfe-491e-a570-08dc9752d0d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?2oEZvDH93YLNxBeHca1xHwh7yBE8NvcARSL5UOS7p+Opgt66WD230lvUP/tR?=
 =?us-ascii?Q?PGwlwuILSNo5wfnMW7elidgJAEr14CG7ATk3f49klMOJ/jXnkxgTSZoZyyGH?=
 =?us-ascii?Q?xbBUDN+V4xASAPImBYz+dl9OzKlGQxvmrp532x1Q3z9zziZ6/vKmKQudDRwL?=
 =?us-ascii?Q?yOQO5oW+f/9eXSwK9ZRyby+e3QElq30yelivhzcldpl7hozEe4bcvUvG58yZ?=
 =?us-ascii?Q?eCYxhi8OcKk/IYPdCUR50tIDRMrDQhXzLxAdyMVKmxjYH6xK9lZJ61Bd82rD?=
 =?us-ascii?Q?whvDJek4Q5kKsuG1SoaNIQqO5+FWc4KuJqiIENfSNgDIFDBKqZuIdDKGwOGY?=
 =?us-ascii?Q?SnMakLg7+oH+k0Lf0NXnQwInL8cdTRH/3WkH0HWzgH//PPeKSS9IOCmtqIXE?=
 =?us-ascii?Q?JesZWghApto+StMJMlyBtXC7UlWQYsyk5ZDORTgUYq5DfBqPiKtg0PX/L4ui?=
 =?us-ascii?Q?LqOudMm9nx8okVYLI/wVGFtH9LogdvzGGnPrSHgvFIWlzNjr0D3FWB47hwAO?=
 =?us-ascii?Q?X/xhkJ9qJjB6eG9WQs+kQ7gQdTcQQPyFGUR5mm26JpbxpdLwZo8+UTwJCpGi?=
 =?us-ascii?Q?5RfJwITNTEB2iSKQNco2s00M2B4q6RVqGffQKIfpNqfabr4KyLLQHq3yiZMO?=
 =?us-ascii?Q?2Z8PwCcQjtNm0aTXhpprZ9YhWuuxfCu5TDlykmDhXDu8WppOaYfk8C66iGZe?=
 =?us-ascii?Q?Fg6HOW5TCg5npl/Qk2ZPIQSe/obv/pcjeDfGMhlyjYs/QT9KDI8UHBdR6MYi?=
 =?us-ascii?Q?yE3WbXKbN/Qy3sJHKEwL5IhAAYsAKkLfa7CHSG35rs/aPP+Kgg7v57jtl9Qt?=
 =?us-ascii?Q?VvmElttsHUOLLgtNO1mBeyL4l2Lq+x1DgnOgq0lMN8I4LHW5jTCZTN71INqC?=
 =?us-ascii?Q?rWiSHZ1UcDLpimxx5iZnlceyMM7BktW0nLR4J7qPU3LihwqhA+i2Png9BIqK?=
 =?us-ascii?Q?+m18uc8zus2bRYblvUPQTwEGWV/EDPR4lzVv7hBQz4h6vA3jCr2ptpDRrz1N?=
 =?us-ascii?Q?ARxLDrcYV7RfHehh1DS9y1ufLo6zGMCHJu1s+XOtC9a0HD/085NfsB+USzeZ?=
 =?us-ascii?Q?WoBnu5U9bwiPnNlyiTWQSRzVfWv/DYrtIerGa3tV9dk0GLxGQoRqxP5Om4lf?=
 =?us-ascii?Q?e8/72cKp+F8DkuOJumK1mJW/l5C5HVhRNc9+CeoAjD0XrCuSvIv1lTnHdsM8?=
 =?us-ascii?Q?waIcjzIPuzI3G9aJbD2vdpfIW+Mhbxv83TiOEx246PAltjrUb1EzfzVdf8HZ?=
 =?us-ascii?Q?k31VmO7oB5R2CoynI/a/NO9gnVZBk0eW8blzHE29KPExBa7eqgl4YagPcJn8?=
 =?us-ascii?Q?3zu+FLJkqsqJSOHW+Ks61AyIN3z9v3fcs6yHsYBx37onGuWij8y9TBKrik/w?=
 =?us-ascii?Q?q7VgA47xnbg5yxZuw9aaoGKV17vV79i7GDQDmysY8T0pTPDoIhOeOYMd0SET?=
 =?us-ascii?Q?Kxwu0A2Y6gVFYItBecM2Xis7/y1zpDfW?=
X-Forefront-Antispam-Report: 
	CIP:139.15.153.206;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2024 09:15:12.5507
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 48bdd5ca-dbfe-491e-a570-08dc9752d0d3
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.206];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000B621.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB6927
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Jun 2024 09:15:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111147

From: Ricardo Simoes <ricardo.simoes@pt.bosch.com>

With gcc 14.1.0, there is one compilation warning found in the
unit tests which cause ptest builds to fail:

test_containers.cpp:290:89: error:
value computed is not used [-Werror=3Dunused-value]
  290 |   magic_enum::containers::set color_set_not_const {Color::RED,
Color::GREEN, Color::BLUE};
      |

This is the same behavior as described in [1]. Thus, we can safely treat
this specific warning not as an error until the gcc bug is fixed.

[1] https://gcc.gnu.org/bugzilla/show_bug.cgi?format=3Dmultiple&id=3D114970

Signed-off-by: Ricardo Simoes <ricardo.simoes@pt.bosch.com>
Signed-off-by: Mark Jonas <mark.jonas@de.bosch.com>
Reported-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta-oe/recipes-extended/magic-enum/magic-enum_0.9.5.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-extended/magic-enum/magic-enum_0.9.5.bb b/meta=
-oe/recipes-extended/magic-enum/magic-enum_0.9.5.bb
index 096f869c3..ee547f634 100644
--- a/meta-oe/recipes-extended/magic-enum/magic-enum_0.9.5.bb
+++ b/meta-oe/recipes-extended/magic-enum/magic-enum_0.9.5.bb
@@ -30,6 +30,9 @@ do_install_ptest () {
     install -m 0755 ${B}/test/test_* ${D}${PTEST_PATH}/tests
 }
=20
+# Workaround for bug 114970 reported for gcc 14.1.0
+CXXFLAGS +=3D "-Wno-error=3Dunused-value"
+
 # Add catkin and colcon (ROS build system) support
 FILES:${PN}-dev +=3D "\
     ${datadir}/magic_enum/package.xml \
--=20
2.34.1


