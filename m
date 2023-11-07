Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3DFEC0018C
	for <webhook@archiver.kernel.org>; Tue,  7 Nov 2023 07:13:11 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.89])
 by mx.groups.io with SMTP id smtpd.web10.5517.1699341186214402313
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Nov 2023 23:13:06 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=ftp9B/sD;
 spf=pass (domain: axis.com, ip: 40.107.249.89, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cvNPA8hKRiAymWyzfTLaUnGkwOXOGcrRnZO7RaLKZz8ml0PJhBGCdfXhAPlMJr5A1TeeV86QaVAJL1Os5IXnL0daiUxLcwffmQmnZSow22iT4+WHEPWm9juytr+ZoZUF0RDzJqzTGf0TPmFqAghVN2VAKZZTP32JxJb0RUKnP8UKFoW7ntkzpQiKuXYSfF8zJanthNV/M53uagguauM5i18KCPVanPHmKLu5hp0GU1BI/IykxSiitksyWARjMXEZUA6v8Rr8wtsPpvPR8df4bS2AnUAd2Aw16zmCj9NzR2UL8fLzu0v7FUmrJmjZBr17TEUVnnPDuR1PmUac/E/Ilg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n5qvE7R2qERhLDXs74qTDVh6cmqU1CZmocO1+Dh4Yzo=;
 b=CCOZTDeZbrIvA8K7om2+IYb+Yqnp5C6WGeW9aCFE4m8ErBUwm7qSzVNqREyWk424k9nswt2NM3L4zrCkHhBXiktbVz6UtjcvgfCL3ZvBgAnjSu6ewErT3WTBAcrQXFGQPRsnPA1px+eXKTuDPXduINulAmfTLlzX1MNqaVQ6+IjC8oZJoRnAvwB2YkuuPM64bqMS6/qQs+rSM5ZIpp3i8oM43ycsgm9wUjH2exzzHUSJkDLhOJHFR3tPaqQ7OQOZ554RVpBoQILnJXeV/tXopbG7kB8NwX+k9FKMC84zAosTodbmJejsThO9zS3g0PLaNqxbDKgAiJtvT4o38efGFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n5qvE7R2qERhLDXs74qTDVh6cmqU1CZmocO1+Dh4Yzo=;
 b=ftp9B/sDiB6/rHKINnGtfzS9nIvVmzGD+2E/ilSqiVTRkfxgNauFefWoDrvk7tTVM7uQeHj+apbhVasAkxbE9gWjbzjx3+RFcAukvQvpEAKdPaQ+pxbWZLyKrvU/pz8CAUf8erntP9IE+bAZZ85iu8Dd/TSBDOcnprQ0YKQArfs=
Received: from AS9PR06CA0699.eurprd06.prod.outlook.com (2603:10a6:20b:49f::20)
 by PA6PR02MB10522.eurprd02.prod.outlook.com (2603:10a6:102:3cd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.27; Tue, 7 Nov
 2023 07:13:04 +0000
Received: from AM4PEPF00027A64.eurprd04.prod.outlook.com
 (2603:10a6:20b:49f:cafe::a) by AS9PR06CA0699.outlook.office365.com
 (2603:10a6:20b:49f::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29 via Frontend
 Transport; Tue, 7 Nov 2023 07:13:03 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=axis.com;
Received-SPF: Fail (protection.outlook.com: domain of axis.com does not
 designate 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com;
Received: from mail.axis.com (195.60.68.100) by
 AM4PEPF00027A64.mail.protection.outlook.com (10.167.16.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6977.16 via Frontend Transport; Tue, 7 Nov 2023 07:13:03 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 7 Nov
 2023 08:12:51 +0100
Received: from se-mail02w.axis.com (10.20.40.8) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 7 Nov
 2023 08:12:50 +0100
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 7 Nov 2023 08:12:50 +0100
Received: from saur (saur.se.axis.com [10.92.3.10])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id E19B2FBD
	for <openembedded-devel@lists.openembedded.org>; Tue,  7 Nov 2023 08:12:50 +0100 (CET)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur (8.17.1/8.15.2) with ESMTPS id 3A77CosV1519756
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 7 Nov 2023 08:12:50 +0100
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 3A77Co9l1519755
	for openembedded-devel@lists.openembedded.org; Tue, 7 Nov 2023 08:12:50 +0100
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH 15/16] python3-pylint: Only set SRCREV once
Date: Tue, 7 Nov 2023 08:12:39 +0100
Message-ID: <20231107071240.1519631-15-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231107071240.1519631-1-pkj@axis.com>
References: <20231107071240.1519631-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A64:EE_|PA6PR02MB10522:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ab45865-549d-4bbc-f15a-08dbdf60fbe5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	8CbOA13nCO598BvdcnpwnQSIxULjqz2bX0qXyVW/SoH96rAf0oztBL7bfvkmtrp8wkmHmz/616LMTQiHx0V8fn/cthFCk/nLIas+MS8lJl+cfrx+QRE2UcT003WJw7j8R/Pk5Zn+ExAGr8Dc1yLAr+g//u1mHdjT3rdQzEJXkAddLBOUI/Hor6hg2tFmD79cfA6ktq9GDuolt/krQzd9yiXTJlHrWKmo46p+ZtS2dk5oSoTnZYga1AH1fRel1WSgD7LlmVeBiFH/wShR3d7OEuWPpd/4qsc9JIn8bIuRl6MrawEONdnHcDWVchRuhBdnt1v1u0YUYxlGpJAoja0/oWzSnC1hvBlRJs7lro9PzVGJkAC+Wee6Syx0mhmSamfT6lZpDObfw5SKreEm4gNptT5ExnRRx7YEMTs74Z/npVV2p/VtrqyhXzMa/eNB8vZLg2w5CZWp10JCfTX5HjbLhT/QmrljPdgd8idRfbfhIri5QUbM81Wa7NzC9Cij8QZ5AZZuFZNN/jtwhjfb8HVw8t8Xh8im94xQi+mhallSupEwut98wHFempVVrpCyKMe7+aEmjDFQ6jAWdYnwOBoBuQndAqqWF+z9YkN3cyAuhK//w+D9aqJlqqjnlxO7Uf2FagVC/6mFw2dS2qRBcnJ9r76gy+PclZKEMBPssxpFtci8D84tglaFpEvNRu7W9lO/rUHQhT0ejDra4UDjpkhpA4EUOuhD8C1y6nD05XABsUxDPUrdAnEsoIgJj5kbBenVfElNGfNq2R0L0vrm/nlYmg==
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(346002)(39860400002)(396003)(136003)(230922051799003)(82310400011)(64100799003)(1800799009)(186009)(451199024)(46966006)(40470700004)(36840700001)(41300700001)(478600001)(47076005)(2616005)(6666004)(5660300002)(26005)(426003)(336012)(8936002)(8676002)(83380400001)(70206006)(2906002)(36860700001)(4744005)(1076003)(42186006)(316002)(6916009)(70586007)(356005)(82740400003)(81166007)(40480700001)(36756003)(40460700003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2023 07:13:03.8750
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ab45865-549d-4bbc-f15a-08dbdf60fbe5
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00027A64.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR02MB10522
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Nov 2023 07:13:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106436

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta-python/recipes-devtools/python/python3-pylint_3.0.2.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-pylint_3.0.2.bb b/=
meta-python/recipes-devtools/python/python3-pylint_3.0.2.bb
index 03e878b2b..8af74b7cb 100644
--- a/meta-python/recipes-devtools/python/python3-pylint_3.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pylint_3.0.2.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc107cf754550e657=
55c42985a5d4e9c9"
 SRC_URI +=3D "git://github.com/pylint-dev/pylint;branch=3Dmaintenance/3.0.=
x;protocol=3Dhttps \
            file://run-ptest \
            "
-SRCREV ?=3D "f2cded41f7f3d4b45236cbe107b366b6caf84bde"
+SRCREV =3D "efee9618894795cc8847727108522aa79431ee25"
=20
 inherit python_setuptools_build_meta ptest
=20
@@ -49,5 +49,3 @@ do_install_ptest() {
 }
=20
 BBCLASSEXTEND =3D "native nativesdk"
-
-SRCREV =3D "efee9618894795cc8847727108522aa79431ee25"

