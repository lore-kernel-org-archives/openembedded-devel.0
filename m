Return-Path: <jeffrey.pautler@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C027E7C4F3
	for <webhook@archiver.kernel.org>; Wed,  4 Oct 2023 20:14:00 +0000 (UTC)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.111])
 by mx.groups.io with SMTP id smtpd.web10.4968.1696450434197740916
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Oct 2023 13:13:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ni.com header.s=selector1 header.b=asTwXpm8;
 spf=pass (domain: ni.com, ip: 40.107.92.111, mailfrom: jeffrey.pautler@ni.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=URF6A95l1lpM+uw0d3RT1mf9VvWMmUjXpVtKqzgykYfvO0LGSyXQ2K4YA31HN1qTQmrD8V1+aCiNqCUmJp+/R2xYgR/ql0GmVhNmrfQsfqLLjlF3iERSA8Du9W0KZg2YcasOEevV1Av8jotjQHlop08RytL6MQHKk0+rI6spFjhkLmvgVQA7raSSlK/BOx/Rk8es0TleRARUheY5m0e3U/rLm3ZN3HzijkpDV8lhrka4HE3aSZP/pb1CJaLQRuzOh9+2SVEArlyN2o/PNaJy7Pv5qKfaBynFFPyfiU67KCgRFUycStV3EBxrf/gBxun2iUT8kBH5QJlOPfM/yTn56g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LT0OylIlLFZIwK4kKuLPagYNYMyqtgVw5eWxU2ovyFU=;
 b=jbAmfSrSUQqlzkGJWtHazPsKkPJxpnJt9f8fmI3AcLlrJ4A/v2nTD2xIPFCncFH/d+wa0wP4lx+OqqkxOcAW7rJwBjx5v/AtX+3t8cNEpRYUaV7aVTBkuj+XJ/2hMO06hz67qhoZEAzalWQbimgBKfLpXx7n5oOw9onexHJPdbaaaGkOhosFnn6BYaZpqYTAejep3DSVD4xPx1ciTL5oI/a6bV7DmaEEOHX3BvYrxoz7JlxcZlvSe7rl0FocEIKiEnRBOx2mp4+sedw4sE5Noehvb6cEjXCxkpuLnjDQ6AWhy0pcDavIE55cNUhuHMsP+qVcuoKGDsV9RGDsQPBNXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 130.164.94.74) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ni.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=ni.com; dkim=none
 (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LT0OylIlLFZIwK4kKuLPagYNYMyqtgVw5eWxU2ovyFU=;
 b=asTwXpm8yLJXikqpvNbA2pYIFNcBI0lU2W5ciUHBlvnhqcNU1SvtlRtzu6MEWRWlvPtz1BM6EcAoqydhl5WPCtibNvSdrnJ2HBdoHeKfRFFzmU5PHUws8bKdSlMOtZnfrf4ns7pr8MC1kb2JcpsxzpG5Dm87aKhUOdEtqeZvrWA=
Received: from CYXPR03CA0083.namprd03.prod.outlook.com (2603:10b6:930:d3::15)
 by SJ2PR04MB8459.namprd04.prod.outlook.com (2603:10b6:a03:4fa::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.18; Wed, 4 Oct
 2023 20:13:50 +0000
Received: from CY4PEPF0000EE3E.namprd03.prod.outlook.com
 (2603:10b6:930:d3:cafe::ba) by CYXPR03CA0083.outlook.office365.com
 (2603:10b6:930:d3::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.26 via Frontend
 Transport; Wed, 4 Oct 2023 20:13:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 130.164.94.74)
 smtp.mailfrom=ni.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ni.com;
Received-SPF: Pass (protection.outlook.com: domain of ni.com designates
 130.164.94.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=130.164.94.74; helo=us-aus-excas-p2.ni.corp.natinst.com; pr=C
Received: from us-aus-excas-p2.ni.corp.natinst.com (130.164.94.74) by
 CY4PEPF0000EE3E.mail.protection.outlook.com (10.167.242.18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.22 via Frontend Transport; Wed, 4 Oct 2023 20:13:48 +0000
Received: from us-aus-excas-p2.ni.corp.natinst.com (130.164.68.18) by
 us-aus-excas-p2.ni.corp.natinst.com (130.164.68.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.25; Wed, 4 Oct 2023 15:13:48 -0500
Received: from jeff-mint.natinst.com (172.18.68.32) by
 us-aus-excas-p2.ni.corp.natinst.com (130.164.68.18) with Microsoft SMTP
 Server id 15.2.1258.25 via Frontend Transport; Wed, 4 Oct 2023 15:13:48 -0500
From: Jeffrey Pautler <jeffrey.pautler@ni.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Jeffrey Pautler <jeffrey.pautler@ni.com>
Subject: [meta-oe][PATCH] bolt: change product name used for CVE checking
Date: Wed, 4 Oct 2023 15:13:09 -0500
Message-ID: <20231004201309.2250542-1-jeffrey.pautler@ni.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3E:EE_|SJ2PR04MB8459:EE_
X-MS-Office365-Filtering-Correlation-Id: b5ed1da0-fb22-4c7a-ecb6-08dbc5166bba
x-ni-monitor: EOP Exclude NI Domains ETR True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	q5GWLVfJ9aTdEkqQvVgNt5PGicFnXOD93J7VUJdJwim0Y00kMkMDazkRsAuouJgNuW8jxcdHENEAf2OtR5BdcV+pRnBKYj8yZ6KozAYCkakyZ9yR98ox4JqIxpIuWmIc3Xzt2oZf2jjd/ZefsSlXP8XlUw0TH/qDf25jPyIdPSSeZ2KWkB2pWqk88RLTeNvJFaBBbwb37BHWk4zDRCqxpk++fKWqBUdC2Ql7rlwpaVJRMJaj6LZ5dOhRN0wC4ssu5SjkCRManykL7AHQ/ATjnGW/MypS7zxtfB3NcKG7WsdFg2slUr28SHxgRDD/VPZCmnsgMAbbRfdfS37b+0IqJunQEJdrc5Le3b+OuLRB5vFED902EvrbOlS6gJNTDE5aILJbddSWaeFGCFwJPv/fU4JroVaRfae13/2LGE6inSDo1Hv9+WABnaY7yQjWfMrsc8xwp+i89Boo1ZS8zPx3e4sm+zZBr+0QBLPxdoTnYMyZGxb3fH0ukw/c0Rcreot7iy8B9Nfzwn5aIwvFc/qNYq6v2Od7uUaKVwLgQHTmHjofYR+LlRTsQA5IFEd7iNwa6WoSMLNAiFWJ7OxB96bIzGC5lGXuLhP7LNcmbmZL045sXe5nSM7Cp+xCa3jln+Fy45H3QThHz8vkvuaoAOtxJsuCaqBW0VvTqBmXoj+7rr70fXcSfKdwkKI9SjZ3R2calGF9oiPQNQAK/zUvxNTQOvV6JTjQphvs6NLKElCzd0FA5QCMToZZoXiuapIQrQl2aBZP82KMRDXueyAmeLi/FQ==
X-Forefront-Antispam-Report: 
	CIP:130.164.94.74;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:us-aus-excas-p2.ni.corp.natinst.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230031)(4636009)(376002)(39860400002)(396003)(136003)(346002)(230922051799003)(82310400011)(451199024)(64100799003)(186009)(1800799009)(36840700001)(46966006)(40470700004)(2906002)(6916009)(41300700001)(316002)(4744005)(8936002)(36860700001)(70206006)(70586007)(4326008)(8676002)(40480700001)(44832011)(478600001)(2616005)(6666004)(26005)(40460700003)(5660300002)(47076005)(1076003)(81166007)(336012)(86362001)(82740400003)(356005)(36756003)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2023 20:13:48.9484
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b5ed1da0-fb22-4c7a-ecb6-08dbc5166bba
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=87ba1f9a-44cd-43a6-b008-6fdb45a5204e;Ip=[130.164.94.74];Helo=[us-aus-excas-p2.ni.corp.natinst.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000EE3E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR04MB8459
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Oct 2023 20:14:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105343

This bolt product does not currently have an entry in the CVE database.
However, the default cve-check logic that maps recipes to products in
the CVE database is incorrectly matching this package to a different
bolt product made by bolt-cms. As a result, CVE checking incorrectly
reports CVEs for that product for this package.

Signed-off-by: Jeffrey Pautler <jeffrey.pautler@ni.com>
---
 meta-oe/recipes-bsp/bolt/bolt_0.9.5.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-bsp/bolt/bolt_0.9.5.bb b/meta-oe/recipes-bsp/b=
olt/bolt_0.9.5.bb
index b6ad6337c..0cc9d8542 100644
--- a/meta-oe/recipes-bsp/bolt/bolt_0.9.5.bb
+++ b/meta-oe/recipes-bsp/bolt/bolt_0.9.5.bb
@@ -12,6 +12,8 @@ SRCREV =3D "5a8a5866a847561566499847d46a97c612b4e6dd"
=20
 S =3D "${WORKDIR}/git"
=20
+CVE_PRODUCT =3D "freedesktop:bolt"
+
 inherit cmake pkgconfig meson features_check
=20
 FILES:${PN} +=3D "${datadir}/dbus-1/* \
--=20
2.34.1


