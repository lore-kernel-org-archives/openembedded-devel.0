Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EA26C001B2
	for <webhook@archiver.kernel.org>; Tue,  7 Nov 2023 07:13:01 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.42])
 by mx.groups.io with SMTP id smtpd.web10.5512.1699341175042709176
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Nov 2023 23:12:55 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=hKk1jexN;
 spf=pass (domain: axis.com, ip: 40.107.22.42, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CRq+d9mBXi49BaNk7dCRTRkab46Qe3ZzsBbDipcupQOGi8FFy2Xw5d9cWWBu5xFH61zaN4yszXEwygpnRQOiifnMsNrA/KUSYo+QSaWUGGczrEk2dRFtuiuxKUqfZ9FMRuDfj3lff7JKlrftzw/dSAH3N4D2YVtd4y+0/kaYpJnybTb8NyfMWD+S81e8oG4d9LDaGguvJb6QbdgsREy/lgRKb/VwDcORhOCKlXXNj3Rxw4SgUAwYeBTtIgCI6IRUYWxJjtP5INo2lDDcrdnrcvDl8uo06cmfYiMWMp1cC15i1rTDKWu5oigXVa0lwIH6zgBMvLV77i1GYdaAre+k/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xnz/WQ5adXfhN+amnkoIXn0aEdAC3TjY11twopl4GDA=;
 b=cocghfxj2AKkw50fB4wWlxmaQXPp2rkLtB14XGtTOx9JsR9K34ceZ5aWXIZPp1zAuXS78/4wmHClekqWCuasN8R6ppBfOQk77gUCaLNWso5SKRVGc2/gZsZaiyYHadKd5/QrSzuaU9RNKAwi34ZPtt1i/OzqyUO9h9rhlBuX/k62Vtzj/9Fh90iYthgk3imPEGd9okcD39tnag3B5k9zXSzrh292uJzXUEplVJi65QI4jNsTwCCfz/dJ5AJdzEDZYb9Ql3lpxHfsWHLPiWwpUeY1wGR1yQqkJ8GX9dqG1EHXw+OuQyyDSWXpNuvzMZgqaU4H3ZLMsuiwprPbz9yYfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xnz/WQ5adXfhN+amnkoIXn0aEdAC3TjY11twopl4GDA=;
 b=hKk1jexNBYGD6sZjDd6zfUKJcfZA2ubJ37blq46EMua5sHWW4TH1DbEuauopclV95myHM3+BO3B3lyeoKDuYZen0pkZfF5QAr0SOGCJoW3DRU5Bji9jtgRdA0Ks3k9KzNgWxaY5EhznNJU7jpRpC1ShYHH9MwMvqcj9PdidLrLQ=
Received: from AS9PR06CA0491.eurprd06.prod.outlook.com (2603:10a6:20b:49b::15)
 by DU2PR02MB10160.eurprd02.prod.outlook.com (2603:10a6:10:49b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Tue, 7 Nov
 2023 07:12:52 +0000
Received: from AMS1EPF00000040.eurprd04.prod.outlook.com
 (2603:10a6:20b:49b:cafe::e2) by AS9PR06CA0491.outlook.office365.com
 (2603:10a6:20b:49b::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28 via Frontend
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
 2023 08:12:50 +0100
Received: from se-intmail02x.se.axis.com (10.0.5.60) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 7 Nov 2023 08:12:50 +0100
Received: from saur (saur.se.axis.com [10.92.3.10])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id C9EF51C96
	for <openembedded-devel@lists.openembedded.org>; Tue,  7 Nov 2023 08:12:50 +0100 (CET)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur (8.17.1/8.15.2) with ESMTPS id 3A77CoRE1519752
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 7 Nov 2023 08:12:50 +0100
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 3A77CoBM1519751
	for openembedded-devel@lists.openembedded.org; Tue, 7 Nov 2023 08:12:50 +0100
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH 14/16] python3-greenlet: Avoid duplicate URI in SRC_URI
Date: Tue, 7 Nov 2023 08:12:38 +0100
Message-ID: <20231107071240.1519631-14-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231107071240.1519631-1-pkj@axis.com>
References: <20231107071240.1519631-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000040:EE_|DU2PR02MB10160:EE_
X-MS-Office365-Filtering-Correlation-Id: c98a95af-b030-40be-691c-08dbdf60f4d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	TDD40bTc3lUefrS9bQtMve+l1hgDcSwU9ZdVvbtCdVRIPZ108ty/t5KHSsvx2qx1Xs8zjcJ2b5jqlDlFWN0eEQlWpRx6rPAQk5ATFTT/8PtZcA91lPT9EDCOpGgMV5pfyT1o+RrRI1nPLbhH9PuQjlaEt7T1HMv2e2XejrOL2nvxZpmVu9S80/Mf14cH9oN+7s1n3Co0UBbQzXV5t4ywfscb7gCrRpLDXIJsjwFN217naumLwDdsyoXvGAe1yelli9XL/O/UtmBIHj7TnLYGNJjP5XnETlJtGhds4uRTyD/tXsi/asGzcLsSZJ4uArcAYbl9/dJcJVVT3FyBIojVvyOnk6+Aq7fBHixdxScO6i/zGNvxIO4ohl0+kB++Baa7ZbStHqh2rDvWl4Ww1ro28NcyNiODt3gM3o9hSXR/2zjWg9kCh4q4ZD2d7sEq+P7Oo3H4hJVcEAwcDW/gSGKczhtTRZQ7Awn6b6GgirRYeYNEG+yOovBtGy0fkSExfLts8tye8yslBaHzc1eq0UTdzz6H47QoDYkDyJatSO7uw4/GHqpcAQP10JvOItAcYUDWUz0kBOXCIWCdHqLeXkZNvzZNHF3oZ8dPySdinwu675a7RljEek/ZTgkyalYJNSI2BCgROLKVc4n5vJE6pYyN5W8PydUuYuFpc7rE7wtmxP7Ib0dz5JG+zJaIY/Z3i3II5JhnqJNHRaLmSSz80l+17oSsqFmPJkyFEBakbWy81oKn8wLVINWV0ph0PJt5iCxh8JBSVbeZ0vP3COSS3Jo3qA==
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(39860400002)(346002)(376002)(136003)(230922051799003)(451199024)(82310400011)(1800799009)(64100799003)(186009)(40470700004)(46966006)(36840700001)(8936002)(8676002)(6916009)(36756003)(40480700001)(41300700001)(2906002)(36860700001)(5660300002)(356005)(316002)(42186006)(47076005)(4744005)(81166007)(70586007)(70206006)(83380400001)(336012)(40460700003)(26005)(82740400003)(2616005)(1076003)(426003)(6666004)(478600001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2023 07:12:52.0291
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c98a95af-b030-40be-691c-08dbdf60f4d6
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF00000040.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR02MB10160
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Nov 2023 07:13:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106429

${PYPI_SRC_URI} is prepended to SRC_URI by the pypi class so there is no
reason to also do it in the recipe.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta-python/recipes-devtools/python/python3-greenlet_3.0.1.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-greenlet_3.0.1.bb =
b/meta-python/recipes-devtools/python/python3-greenlet_3.0.1.bb
index fbabf12a3..523c2b6b2 100644
--- a/meta-python/recipes-devtools/python/python3-greenlet_3.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-greenlet_3.0.1.bb
@@ -4,7 +4,6 @@ LICENSE =3D "MIT & PSF-2.0"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3De95668d68e4329085c7ab3535e6a7ae=
e \
                     file://LICENSE.PSF;md5=3Dc106931d9429eda0492617f037b8f=
69a"
=20
-SRC_URI +=3D "${PYPI_SRC_URI}"
 SRC_URI[sha256sum] =3D "816bd9488a94cba78d93e1abb58000e8266fa9cc2aa9ccdd6e=
b0696acb24005b"
=20
 inherit pypi setuptools3

