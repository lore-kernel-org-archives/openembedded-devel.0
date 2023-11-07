Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F5EBC4167B
	for <webhook@archiver.kernel.org>; Tue,  7 Nov 2023 07:13:01 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.88])
 by mx.groups.io with SMTP id smtpd.web10.5513.1699341175651680506
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Nov 2023 23:12:56 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=ddqAGzGP;
 spf=pass (domain: axis.com, ip: 40.107.21.88, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MnJUoV5pPr6vnO5Ucvhv4+swNoZn26yY/iT0eH0NC3Fr1wCikUMhqsL/UzmAap1I6iUMSPL8JIkuTFxqQ2R2rnCsVWGu/FhWIBwEBWHlsrUdcDV9WlNTXJpJcNclok15Gzfr8dfONHuNeGEPosqjZoGOnLE4RjIE5AoeYY4e+8FcK5MEmiNttaXMlgy3Z1nyw25vyMt8yzqd9Q4Eg7wsYfIq5s+6foPPGCgXiV5D8t89sxBPz23YRTVF516ByIOtfRbrNFDmZw1+11sX2ao62FDt5swXC4CozuC7WzrUbChYGNyqxxzgvFgTe/MqbC87062HX+faXGbPKjXA9Gi7lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sl2mdBa+VbCxWRV/SS1vebndB2aCIcHLYj466pX4GDI=;
 b=S7xoXdXFuvpvjNtnHD//Ux987945y/Y7K2f1hLcPcdcoeHwmssBWrVJFjNMz0nJ0ffny5aQj5QeYXR/vrqHS3ww9TLFPe7oVHc7wB5/G11w9cXYZrKbToc6QM8NnIUlvWNoPGSYTIc5GJyPiDtcyoWMzkx0K8jxsbAmVA6Ss+r2wKZ86gENom9ZqgNnLZoNjFcVWhcFey/X2Pl7yH/Bin0rJfalTbFbzjJVNEWJqJ47QXffmMykb3FDiwwIYHz15HPeDb+tLeRZysQAj5trLkKgD2nU87Gq0a2QjC+6LUm3JRy079Dec+eK59heCSFrRXsvL/FEFA0UioHoye5/Tpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sl2mdBa+VbCxWRV/SS1vebndB2aCIcHLYj466pX4GDI=;
 b=ddqAGzGPjTyOG2U/ypQUzagDFNgerSVNMy2SvOZCJBsKojHkxSua8rFCovV1FD0TXcNr8qKkKC7/iGCtDNFAamBfchVIHdsDvLlHB/Xic3WRBcyYOHKBq8FCFGc2QnFX/Gzs/e4DnQc2CecFx+MmEo41AziVwC+fGhOUloIpiKA=
Received: from AS9PR06CA0482.eurprd06.prod.outlook.com (2603:10a6:20b:49b::7)
 by GV1PR02MB8260.eurprd02.prod.outlook.com (2603:10a6:150:63::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Tue, 7 Nov
 2023 07:12:52 +0000
Received: from AMS1EPF00000040.eurprd04.prod.outlook.com
 (2603:10a6:20b:49b:cafe::d8) by AS9PR06CA0482.outlook.office365.com
 (2603:10a6:20b:49b::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29 via Frontend
 Transport; Tue, 7 Nov 2023 07:12:52 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=axis.com;
Received-SPF: Fail (protection.outlook.com: domain of axis.com does not
 designate 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com;
Received: from mail.axis.com (195.60.68.100) by
 AMS1EPF00000040.mail.protection.outlook.com (10.167.16.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6977.16 via Frontend Transport; Tue, 7 Nov 2023 07:12:52 +0000
Received: from se-mail01w.axis.com (10.20.40.7) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 7 Nov
 2023 08:12:51 +0100
Received: from se-intmail02x.se.axis.com (10.0.5.60) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 7 Nov 2023 08:12:51 +0100
Received: from saur (saur.se.axis.com [10.92.3.10])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id 14C281C96
	for <openembedded-devel@lists.openembedded.org>; Tue,  7 Nov 2023 08:12:51 +0100 (CET)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur (8.17.1/8.15.2) with ESMTPS id 3A77CopK1519760
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 7 Nov 2023 08:12:50 +0100
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 3A77CoVC1519759
	for openembedded-devel@lists.openembedded.org; Tue, 7 Nov 2023 08:12:50 +0100
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH 16/16] python3-pytest-mock: Only set SRCREV once
Date: Tue, 7 Nov 2023 08:12:40 +0100
Message-ID: <20231107071240.1519631-16-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231107071240.1519631-1-pkj@axis.com>
References: <20231107071240.1519631-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000040:EE_|GV1PR02MB8260:EE_
X-MS-Office365-Filtering-Correlation-Id: 645deae2-964c-4493-3f0e-08dbdf60f50d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	O5Jo7VmHoAkKRj1/je7VUPk6fXJDsbToBl3mmBZbQx1WXmfPbl8V8AKwujE8keWCiSs6izwNBaXmvyOpeeZxe7gYErHZnj9NYxXWARiyyIPDYoubxvsrPfIYDAOGiMCOfztlIlLo1y7fMMJl55rVdbiTIKf5gKnuVAzB8QzF72ZEScQqxEl8hfULXl5q5gAKQ3Phc9TxqXKaZ+0XmVbhbif4T5ApoVsOlQBNkCnANLZzQxm6nDBQ1FOWoiPKxZYKTYxIPrLRRxFNQyUTcc0R5O61miurEqQCEHrTXxBFSS5ksGLqLktK0T6t5wHhmV3gXsvWBa3RLnICxQ9Ew0kG58cOHBKcDDNDul1wahGFCu02xwLjyXx+OH3vOiTiyBIZmQBvzNHkSu+O9AVi79We26z2LYydg7OqRxwyZfBJCmUIbnJy3x+K+ecJzhxfEx165jppSgORB3zF8XzBgH90K+0GKzKROD+kJzlNdqvnlD/ZrtfkDBwbVTIkAm0X97NkhSDM/YGnXhONaz9BA+oD/tQmGdEiyG0jaLthxaqy0T/KSLtrhaKlDEGuGG1elqJN39/HFqpCUfnIVZtwlSHaW+Ia8vhGGYamTT0hPB2HM7r0TY4sNcwwjRpv3drBcV6haRNM9ljJZK4rx8mMeT/QYMEJOUuBZhHOBIzek7unwV3qygU0RGPSymNJJo3F18+iy2Nl3wlH3V6cIxlDmF30yB1zAHt2R5vUcbNWv5YDPw/CuiCUXyddQJ4kqHHIDr7dgsBErhGQwzIRJlCp7vdhzw==
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(396003)(346002)(136003)(39860400002)(230922051799003)(82310400011)(64100799003)(1800799009)(451199024)(186009)(40470700004)(46966006)(36840700001)(478600001)(41300700001)(47076005)(2616005)(6666004)(336012)(8936002)(4744005)(83380400001)(8676002)(426003)(2906002)(5660300002)(36860700001)(1076003)(26005)(6916009)(316002)(42186006)(70586007)(70206006)(81166007)(356005)(82740400003)(36756003)(40480700001)(40460700003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2023 07:12:52.3885
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 645deae2-964c-4493-3f0e-08dbdf60f50d
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF00000040.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR02MB8260
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Nov 2023 07:13:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106430

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 .../recipes-devtools/python/python3-pytest-mock_3.12.0.bb     | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-mock_3.12.0=
.bb b/meta-python/recipes-devtools/python/python3-pytest-mock_3.12.0.bb
index f95ebecdd..ac6f8e831 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-mock_3.12.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-mock_3.12.0.bb
@@ -11,7 +11,7 @@ SRC_URI =3D " \
     file://0001-test_pytest_mock-skip-args-introspection-tests.patch \
 "
=20
-SRCREV ?=3D "d3e73f2e93f7b93eba0a36e17e43bafd969da4fe"
+SRCREV =3D "69adc6f76c1a7baf4e7a728da9eec38741d5783e"
=20
 SRC_URI[sha256sum] =3D "fbbdb085ef7c252a326fd8cdcac0aa3b1333d8811f131bdcc7=
01002e1be7ed4f"
=20
@@ -32,5 +32,3 @@ do_install_ptest() {
     install -d ${D}${PTEST_PATH}/tests
     cp -rf ${S}/tests ${D}${PTEST_PATH}/
 }
-
-SRCREV =3D "69adc6f76c1a7baf4e7a728da9eec38741d5783e"

