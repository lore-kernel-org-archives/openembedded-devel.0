Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 071C1C43458
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 17:08:16 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.69])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37563.1782739809966677462
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Jun 2026 06:30:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=MpLXn5CF;
 spf=pass (domain: axis.com, ip: 40.107.159.69, mailfrom: adam.x.nilsson@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AnQRwmH7HVnukvFksGTvWWgkMzhxlJehqdUzwKVxSFJfD49zd8i626D9QPCKUbd2RYCykChYnhx7xpkueb015iZHYzsKcXWJqcnqsh2wmBosZffaqQkZQVPAMy8kgbDsjiprQRfhGA9UOop9X3riJuX9hW7UDS1e8lYhjTTlZJ0gQ8CcckFCrOTY8cFqhN1v8GUOmRtsHwZ93O+4EHBtEb2i95VaiHTjn+RWQEe9qoICyVYykx4J3nsoHCdNKZeOBEchg5sJhemZ8G37iKozB8oAFGeky+b7rENkJI1cVRBXchvnYXZ+BaBvACf66qEFSETh8XohmzfWfjxmXTNO1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H9TB1bBUn1LLxpKTKtFZQjqLOYtkpMPrG8/MIZlu+zQ=;
 b=Xs4J78EH+ixzhBafe+AiQuX1Sfv4Nyoql+fROIHyxlDA+FFU9rW0SazXfOqu62YfpejZCNllfmBa3wXNoXjp7hMPg7gcdlLFjdWzPv96yQP3TuXhvmGX/zXCkWO0SEleFIRvzqZ90TRvj5wXL1j0ImKARup6EtrqrqZtLNJJCvTjn+2dSjodLMPMoeg8JmjYAnvqzJrxEJn+vzkHZF44z5UsLYa1zWh0L9bFDerxshH6BwiZrnLAfItHrNXPWXd7YOFAeLiqHWDYrfinjGGqerM8ygvQXNTdN2X2ttQe0Ts/vxbGnvUhXptlQ7FEm5Qg0T4TkNhssUPZLWNQhU6Y0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H9TB1bBUn1LLxpKTKtFZQjqLOYtkpMPrG8/MIZlu+zQ=;
 b=MpLXn5CFZs8xYITYNqluXfGWlESjiNZl+YPd0YsVM1xdyLu8tibwtc0ffARC5tZdYYdUUol5VU3LHq3kfZ1FXJJOg5z1/RJPB0PzhjxwWN5pRId+F0y+P5/3U6todVppl8X4L74yc9KctJWYNXkxkcRX8ZcVD7sPrGSsaRq10Dc=
Received: from DB9PR06CA0006.eurprd06.prod.outlook.com (2603:10a6:10:1db::11)
 by PA1PPF051856775.eurprd02.prod.outlook.com (2603:10a6:108:1::244) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.12; Mon, 29 Jun
 2026 13:30:01 +0000
Received: from DB5PEPF00014B96.eurprd02.prod.outlook.com
 (2603:10a6:10:1db:cafe::90) by DB9PR06CA0006.outlook.office365.com
 (2603:10a6:10:1db::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.19 via Frontend Transport; Mon,
 29 Jun 2026 13:30:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB5PEPF00014B96.mail.protection.outlook.com (10.167.8.234) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Mon, 29 Jun 2026 13:30:00 +0000
Received: from se-mail11w.axis.com (10.20.40.11) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Mon, 29 Jun
 2026 15:29:58 +0200
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Mon, 29 Jun 2026 15:29:58 +0200
Received: from pc51388-2240.se.axis.com (pc51388-2240.se.axis.com [10.86.130.217])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id C4DA7C66;
	Mon, 29 Jun 2026 15:29:58 +0200 (CEST)
Received: by pc51388-2240.se.axis.com (Postfix, from userid 11596)
	id C3BD4608544F; Mon, 29 Jun 2026 15:29:58 +0200 (CEST)
From: "Adam Nilsson" <Adam.X.Nilsson@axis.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Adam x Nilsson <Adam.x.Nilsson@axis.com>, Adam Nilsson
	<Adam.X.Nilsson@axis.com>
Subject: [meta-oe][PATCH 2/2] lvgl-demo-fb: Update to 9.5.0
Date: Mon, 29 Jun 2026 15:28:46 +0200
Message-ID: <20260629132844.2894190-5-Adam.X.Nilsson@axis.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260629132844.2894190-3-Adam.X.Nilsson@axis.com>
References: <20260629132844.2894190-3-Adam.X.Nilsson@axis.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B96:EE_|PA1PPF051856775:EE_
X-MS-Office365-Filtering-Correlation-Id: 703cf7a1-b4f2-42b1-2f97-08ded5e28518
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|376014|23010399003|82310400026|1800799024|22082099003|18002099003|3023799007|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 
	DdpgUatfPpHTNxS3+1W8GMw7BdNmo1b8jRtfkee//i61z7JHkNmPOBbOufKwfC+gGbUYYEqPh6NQTwcVH8ndQbnlWMatV93SqppYLRj68mL3E88HTsG5dM2BjaAkFB2C3HSzOECOJADUHoAqOS2BaPfi76rJefwe4df28YPqxR3HvrYbtRZQXTjxEkoJsa1KfvL49MJQ5ZaxNeMwJWnXBYuzqOWtZzhuidin03/ixO91Hi5k1RZJEqjIHrI6wkpX/UCUqE+24IG7OpmDwVBvbDUGjEvZhvKGhlGJRC/bOcc4E4qIuIW9cQlRGBG4k9670rtPICF+boxiFHi3GUTvEFzIM8o5SQerD9StoHU4JB2WwHkw40mxPSv6fSmuAKs7oPWwfwKvnLp/I+5kgHYn5PusfwofX7sXg46lUj0T1B7DWotBIncLEFZtn+bDMgd3ae1wxXUD8vlgHDfqb+RqjhRMA6z9AainT3v1upg20MkznWCqcbCG+f7rEWys+u//+GljPMD9aJyzlcs4RzqdcnB4bEJXO2x66tOd2K6jrczB9Sj7nym5baBvujsIzjph3OUpKKYPcTTaoLHWAf3HFHuBs/J9azaP6ZpJsU3qLLJ5cuEqNkbwAXz7m+72RZNN6cTY7cSqnYnHEzvlyY+TT7MroOXhbKIgMlUvpkb+2H7k7H2L3hhoVcbaBAcPC4L/V7EttaZEyjvtj6Tb25Fdvw==
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(23010399003)(82310400026)(1800799024)(22082099003)(18002099003)(3023799007)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	0EvoSryts697P9vdNQ4389av3R2jv5MzC/PRfiPRoJDh+2iM2T+P3KcuWfa9i2OZiCvwnmBanbEy57DTHivOHB6iLWbhvj4twFMvvN5zA5nJtAUhMtPRIsBn8xjEeRMPG/KlU9zE87L7t/Z7GxASnfsX7o+8pKjgt4j2IlSNAClOVdPI/6kyX+5WvaAJfgc0Yl9fufJVgs6JWksgYGrBZtg7UT06E9ECB3vXkl2QV7Jt3hu8f3znBRTKG0eNNOswxvL6dND2qLqgNX/TXbubFkW6FvI02xdEP+IqisWY55vC/w3ExbE+UhVyTP8ugNHewY/iat9wFigwOH9rEOauZG9hN1ILQUg1sCJbtTzLbCxzc5FbIaruNx6WCtzHINtxnVFseS/AT+D9xFjzVgtaFWmIhjgsiHqbs+YBTPXKTFC3lbTgiNF6KHYl/mXWnUQk
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 13:30:00.4987
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 703cf7a1-b4f2-42b1-2f97-08ded5e28518
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B96.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PPF051856775
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Jun 2026 17:08:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127941

From: Adam x Nilsson <Adam.x.Nilsson@axis.com>

Signed-off-by: Adam Nilsson <Adam.X.Nilsson@axis.com>
---
 .../lvgl/{lvgl-demo-fb_9.4.0.bb =3D> lvgl-demo-fb_9.5.0.bb} | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-graphics/lvgl/{lvgl-demo-fb_9.4.0.bb =3D> lvgl-demo=
-fb_9.5.0.bb} (76%)

diff --git a/meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_9.4.0.bb b/meta-oe/=
recipes-graphics/lvgl/lvgl-demo-fb_9.5.0.bb
similarity index 76%
rename from meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_9.4.0.bb
rename to meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_9.5.0.bb
index 660031b68f..02ef8ed4a7 100644
--- a/meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_9.4.0.bb
+++ b/meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_9.5.0.bb
@@ -10,12 +10,12 @@ DEPENDS =3D "python3-pcpp-native"
 PV .=3D "+git"

 SRC_URI =3D "\
-    git://github.com/lvgl/lv_port_linux_frame_buffer.git;protocol=3Dhttps;=
branch=3Drelease/v9.4;name=3Ddemo \
-    git://github.com/lvgl/lvgl;protocol=3Dhttps;branch=3Drelease/v9.4;tag=
=3Dv9.4.0;name=3Dlvgl;subdir=3D${BB_GIT_DEFAULT_DESTSUFFIX}/lvgl \
+    git://github.com/lvgl/lv_port_linux_frame_buffer.git;protocol=3Dhttps;=
branch=3Drelease/v9.5;name=3Ddemo \
+    git://github.com/lvgl/lvgl;protocol=3Dhttps;branch=3Drelease/v9.5;tag=
=3Dv9.5.0;name=3Dlvgl;subdir=3D${BB_GIT_DEFAULT_DESTSUFFIX}/lvgl \
 "

-SRCREV_demo =3D "71050624acd8a52ab7d365d0d12acf9bf5fe41db"
-SRCREV_lvgl =3D "c016f72d4c125098287be5e83c0f1abed4706ee5"
+SRCREV_demo =3D "045137cf0fa1781483cb796261a11b5eb21e99d9"
+SRCREV_lvgl =3D "85aa60d18b3d5e5588d7b247abf90198f07c8a63"
 SRCREV_FORMAT =3D "demo_lvgl"

 inherit cmake pkgconfig

