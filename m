Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C11CCC4332F
	for <webhook@archiver.kernel.org>; Tue,  7 Nov 2023 07:13:11 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.45])
 by mx.groups.io with SMTP id smtpd.web11.5149.1699341186835934511
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Nov 2023 23:13:07 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=Aqr0fEy7;
 spf=pass (domain: axis.com, ip: 40.107.22.45, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TIXrYfs69AJhDKQlq1bC55o1WDwXfHzocMq8dYvfOdlVBUvt1gPh1Ry/rXT5Pmz3DFBLB2ZVrjwdSQNTiCmksaBY+eBC+Bcr79bbFUDJP8q0PZffkWZizrNTESODt7VPSPTAvGs+bsOKcZIzH+Y3Go6IqmmqRuxCQ9gmfHhZXd66zJ8g6pXnIweln7pxUXv1Vi2ARZU+Z7v06c/7ZKO8RihgnEWLoAulxfjHdJlDaPrquEcXZgcUULr5CusL466LKNwNRUo0SnewmxZE1QNhIlCb+GWZsxztzIZVvQlEp2WtIOJgLUdPqqUe96xne1Yz70atrbe6A/gB+RP6f+B5dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LfjqpZI49xLnzP05X4S7cptHV8Hywx9XDKk8SNMrQLw=;
 b=Z03lKFeuU6ws0luwXUwlY8Poc5SHJ2uI9Pk5op5gynqXQ4KDh2HRaRTxpBrGYLrF8LNWBo9uXLz2RCFMRkYy3U/JmWSBoGUy9S6+ugCe+EfoS2M+ZQSbqa/jysexALqRCF3SzcudNn9uEw3fLCc3kxWATaBQs6zqwdIK3xmwqxoa6L4VT5OXom0lWxGwOwOMe5eoLvDZKDGODF6JWTqv3RU0fssG2P2KkvTnBhFtQz3io8lRIKu2uiu/LPrQQxFPDneual/DJqBfCU4inw17tu9c2BxabiBZlv5DnQEcyKJIe4tEd7JQzgjnJm8QZNd0IdWKp3ec//i4/YJHw0mq8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LfjqpZI49xLnzP05X4S7cptHV8Hywx9XDKk8SNMrQLw=;
 b=Aqr0fEy7ePG6m1mx5efuO/MQ8QWP7Fxxvt5Oh6oM0BQ69uOBaWPLyXvdrIGvqGOxSr1TK8JSaIUMLmFj6ZlFL5vpCAH/n2ZfrUgIuUUX1waos8w/kg5CVeXpFslbwwxsmh9bg4nNmj3ihf2IaPmMlnYep00uswMWOw7xPH4EMwY=
Received: from AS9PR06CA0705.eurprd06.prod.outlook.com (2603:10a6:20b:49f::6)
 by DB3PR0202MB9228.eurprd02.prod.outlook.com (2603:10a6:10:429::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29; Tue, 7 Nov
 2023 07:12:50 +0000
Received: from AM4PEPF00027A64.eurprd04.prod.outlook.com
 (2603:10a6:20b:49f:cafe::1) by AS9PR06CA0705.outlook.office365.com
 (2603:10a6:20b:49f::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29 via Frontend
 Transport; Tue, 7 Nov 2023 07:12:50 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=axis.com;
Received-SPF: Fail (protection.outlook.com: domain of axis.com does not
 designate 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com;
Received: from mail.axis.com (195.60.68.100) by
 AM4PEPF00027A64.mail.protection.outlook.com (10.167.16.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6977.16 via Frontend Transport; Tue, 7 Nov 2023 07:12:50 +0000
Received: from se-mail02w.axis.com (10.20.40.8) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 7 Nov
 2023 08:12:49 +0100
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 7 Nov 2023 08:12:49 +0100
Received: from saur (saur.se.axis.com [10.92.3.10])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 33699FBD
	for <openembedded-devel@lists.openembedded.org>; Tue,  7 Nov 2023 08:12:49 +0100 (CET)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur (8.17.1/8.15.2) with ESMTPS id 3A77CnSj1519703
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 7 Nov 2023 08:12:49 +0100
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 3A77CnAT1519702
	for openembedded-devel@lists.openembedded.org; Tue, 7 Nov 2023 08:12:49 +0100
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH 03/16] neatvnc: Specify the version in the recipe file name
Date: Tue, 7 Nov 2023 08:12:27 +0100
Message-ID: <20231107071240.1519631-3-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231107071240.1519631-1-pkj@axis.com>
References: <20231107071240.1519631-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A64:EE_|DB3PR0202MB9228:EE_
X-MS-Office365-Filtering-Correlation-Id: c3b89162-2ce5-4114-ae16-08dbdf60f3cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/e1h+VYqGHw35+FRU0Mg7/WsYlp917qBM00Q0DXdBtFYrme+WAsJFwMHbJPhtfj7YUqlrgiX0pFsf7uy3s5cZmYLoK/jUADzV24rP+Zkt7CW+QCStZ7Z3iR3g1LpBa5RqlZophDBH+JgQDsr3Iv3U131Do5w/991C/PxlwgEzNLBo0ik6GtMTzhW1cs9k6dbOCgHHJPbwWqYzrAbN5gXCRLfnJ9Uw/xPNwxIKTnByiuTRgjkcA2cPRaXsTR+tJlpsUJFrsUG0eQChJf9hHCsRdK4stVAV43AVAkZ9riF2PIEPuCif5yWIVPr+myU+yYuP9Ll5ZnAp9c7Uf/rIvJVXM7NBWjU3SpCGwWzg5AoJNYl64npGT1Q6yKsXrphY+eG7IxuXjayWAoqduVwpfYg5+OZQepgj4a3Z0AxfFcZd1moqmcmFNXn9IP52i1Q3ZEHj3tqf/Mx/OYSCll7ei+omAHqr9IokPDKTN9U0TLneiyNWSP+5mzBIWE2D37CzBXcQM/Egfr6D4u9J7KUFVm3ljsg5atYa7Fbsd0EtpRxjaEJXlNPQ5He5M3TKQJ2JI5/tZ1dXKDye1ia/3s4C5B172oAhRi0w7sr8PyzwI+hZepJWiwFs3Pdvo3SmLGb4BravqGziCxcHfDg0+GkWQnqYUsXdxOALNU5dI3Z5MqBZfMyJA6reg0KzXKsdpFsTesNK4+LStMTPwsQ3m4nRurUvuyLzWz+EztPXoi6XPqzrHQNtRwEL7Wy6jA/eG+ltbrZDahVT6fxhAjANMfVriW3zA==
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(346002)(396003)(39860400002)(136003)(230922051799003)(1800799009)(82310400011)(451199024)(186009)(64100799003)(36840700001)(46966006)(40470700004)(5660300002)(47076005)(8676002)(8936002)(40480700001)(6916009)(316002)(81166007)(42186006)(4744005)(83380400001)(356005)(36756003)(41300700001)(2906002)(36860700001)(336012)(426003)(40460700003)(26005)(70206006)(70586007)(2616005)(1076003)(6666004)(82740400003)(478600001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2023 07:12:50.2654
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c3b89162-2ce5-4114-ae16-08dbdf60f3cb
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00027A64.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0202MB9228
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Nov 2023 07:13:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106437

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 .../neatvnc/{neatvnc_git.bb =3D> neatvnc_0.7.0.bb}                | 2 --
 1 file changed, 2 deletions(-)
 rename meta-oe/recipes-graphics/neatvnc/{neatvnc_git.bb =3D> neatvnc_0.7.0=
.bb} (98%)

diff --git a/meta-oe/recipes-graphics/neatvnc/neatvnc_git.bb b/meta-oe/reci=
pes-graphics/neatvnc/neatvnc_0.7.0.bb
similarity index 98%
rename from meta-oe/recipes-graphics/neatvnc/neatvnc_git.bb
rename to meta-oe/recipes-graphics/neatvnc/neatvnc_0.7.0.bb
index 0c95f7e4c..c8ac09f23 100644
--- a/meta-oe/recipes-graphics/neatvnc/neatvnc_git.bb
+++ b/meta-oe/recipes-graphics/neatvnc/neatvnc_0.7.0.bb
@@ -8,8 +8,6 @@ SRC_URI =3D "git://github.com/any1/neatvnc;branch=3Dv0.7;pr=
otocol=3Dhttps"
=20
 SRCREV =3D "112391140a76f0b362fa0df92fc1183c4a48ef3d"
=20
-PV =3D "0.7.0"
-
 S =3D "${WORKDIR}/git"
=20
 DEPENDS =3D "libdrm pixman aml zlib"

