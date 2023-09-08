Return-Path: <jhaller.oss@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4E13EE7FEF
	for <webhook@archiver.kernel.org>; Fri,  8 Sep 2023 12:46:46 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.114])
 by mx.groups.io with SMTP id smtpd.web11.38089.1694177203116944710
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 Sep 2023 05:46:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@Philips.onmicrosoft.com header.s=selector2-Philips-onmicrosoft-com header.b=MxuMJ/go;
 spf=pass (domain: bbl.ms.philips.com, ip: 40.107.22.114, mailfrom: jhaller@bbl.ms.philips.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V9z9Z6ZAH23tpy+JQMk75D+l0DQ1KN4WrJaGLyP9mhuRSCs9XNnHzSsG9cl9t2ErumKDMZ2jXRS1tRrft6L8HwuhUUfBXOGkIoMKdAeEEE+tx/vP99c/9npTPNaITn8u9kcW9MSvFOHpmaUF3LGucfK8MoVR95wu6v0ySNXP47fwK9nfXmdmTNG2WkxLdm+0Ft6pqb+RkSxlye9pUhu5qUtLv9jTRGPISPuHTHRbqerXEvZG9sLdZVT2PkjKxE4XFS9algv02IjhD3WAW3wk0hGxbyd956JEaLdhiF4gazUdVt5ZeiK3ozTx0uQeGt1Ea9leAFEJa4OCFD8H0/lGUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lgENBrSZcUEKqP2Bv0ZtwoDHxrCI0Xj/Y7l8khHXnNM=;
 b=I/QDynvbyyY6kWh4Un7D8qcSMsf6tGjjXHry+lBWxd32kqhIoUfgNOc1UhOeTQb8c8JE9aAxK2+G157xRdrVYW/HmZGCkX975sQrE+Glnnfm6wlvXGlOrG0ItEad/aff9IW8eg+ahTNrsfppR5BVOl+y+WV626bpgKFb5dquHbfl63ermwDBJ+CW2gR7MyCa2XBbIhpSf+mImsmmI0mGLlVMocKxODyef7CWVYMdrb8BTqQypuqCTKeX7Qmx2rqG1YBNYniWvYA6SaKc+cxll5wUh9RIHJgz1ANChXHogUTFOSlaBNketZJ4jC0mwawWx+do8kD1dc3mllR5cH30gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 212.159.232.72) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=bbl.ms.philips.com; dmarc=fail (p=none sp=quarantine pct=100)
 action=none header.from=gmail.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Philips.onmicrosoft.com; s=selector2-Philips-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lgENBrSZcUEKqP2Bv0ZtwoDHxrCI0Xj/Y7l8khHXnNM=;
 b=MxuMJ/goxdHPjlEuRJ0kFWTHM1WuUqyAmtXxgGGIZtAsTxY8pe+Lq8DRQE2jcJgog4AYhDS5FmFz5ChD7aI8+DVHl7e56NdeYp47agAcDSuXMP7cPDKQwglmivNCz+KPKpPngEF+QXMf7cqlhIoYhefQ7tjySblTeIQYp3bngnw=
Received: from AM0PR04CA0079.eurprd04.prod.outlook.com (2603:10a6:208:be::20)
 by VI1P122MB0205.EURP122.PROD.OUTLOOK.COM (2603:10a6:800:176::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.36; Fri, 8 Sep
 2023 12:46:39 +0000
Received: from AM3PEPF00009B9E.eurprd04.prod.outlook.com
 (2603:10a6:208:be:cafe::d6) by AM0PR04CA0079.outlook.office365.com
 (2603:10a6:208:be::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.30 via Frontend
 Transport; Fri, 8 Sep 2023 12:46:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 212.159.232.72)
 smtp.mailfrom=bbl.ms.philips.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=gmail.com;
Received-SPF: Pass (protection.outlook.com: domain of bbl.ms.philips.com
 designates 212.159.232.72 as permitted sender)
 receiver=protection.outlook.com; client-ip=212.159.232.72;
 helo=ext-eur1.smtp.philips.com; pr=C
Received: from ext-eur1.smtp.philips.com (212.159.232.72) by
 AM3PEPF00009B9E.mail.protection.outlook.com (10.167.16.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6768.25 via Frontend Transport; Fri, 8 Sep 2023 12:46:39 +0000
Received: from smtprelay-eur1.philips.com ([130.144.57.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 256/256 bits)
	(Client did not present a certificate)
	by ext-eur1.smtp.philips.com with ESMTP
	id eTqcqg9PoxYR8eashq1svt; Fri, 08 Sep 2023 14:46:39 +0200
Received: from mail.bbl.ms.philips.com ([130.143.87.230])
	by smtprelay-eur1.philips.com with ESMTP
	id eashq5lOcYxEZeashqFI9n; Fri, 08 Sep 2023 14:46:39 +0200
X-CLAM-Verdict: legit
X-CLAM-Score: ??
X-CLAM-Description: ??
Received: from bbl2xr12.bbl.ms.philips.com (bbl2xr12.bbl.ms.philips.com [130.143.222.238])
	by mail.bbl.ms.philips.com (Postfix) with ESMTP id 29774181D0A
	for <openembedded-devel@lists.openembedded.org>; Fri,  8 Sep 2023 14:46:39 +0200 (CEST)
Received: by bbl2xr12.bbl.ms.philips.com (Postfix, from userid 1876)
	id 1FD0A2A0D2D; Fri,  8 Sep 2023 14:46:39 +0200 (CEST)
From: jhaller.oss@gmail.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] openct: Fix typo in SUMMARY variable
Date: Fri,  8 Sep 2023 14:46:39 +0200
Message-ID: <20230908124639.992639-1-jhaller.oss@gmail.com>
X-Mailer: git-send-email 2.25.1
Reply-To: Julian Haller <julian.haller@philips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF00009B9E:EE_|VI1P122MB0205:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 0a319b43-3ca7-4212-ebab-08dbb069a542
X-MS-Exchange-SenderADCheck: 0
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	NzKekbZaXrsmKTe14mOeESJix8i6ZLDL+5J5Aw8Z9cYwrU7mTezdmMqbv73Af+GappNTMGIr6VQ4W234jZPAR3fSWIl23SDAs8+BNg43ughW0KgVaFhWWboGUBbQ10Lg3Wij7vcVMFjOWnHjrL6buVcYWOWM78OzmPdINpOs+JDKOftoLFJiYcLaI9cfBSSQtsR8nqW+5iLahxGCHcr40/0gSf0be5eNrju+OFT8UoY3q3aO4BusT91J3rigmmFC/4xUJy+1c2EQEWavg+KvN/zpxvdq/dOZW9bdZI82iA2kpaywJd01nKT2X+sCyVy6cenBfWPr7/hDIDvnuGJ3pG5xL1Ip67vtIqDOcC69F0nmqoH9kGhg7CzqgyOss1e9owWM2EH3wYHN8HIZ1lC6fQJmMHQgR+G8icuPlG0v6Otl9ii9ee+paL7Le3pihep1YzgeVMpCQhSOA7d88PZHGt0VMYAa1YkoTJcdMZkv4RES5yv4jYLikR+IT5jIYA5pmSOMz0aOJ8uIFJj1yy+ho2rHEznDOiBmieQbLTlH5EOJtDQEXV5Qs0uxAiCDieUhsoRp7FesDCNi12GqyzziB2Kw7yGac0yCfiAo7Cmrah8DWAFd6hfyq7eA31U5X+zQG2JYTHa0WbYZjgVWu5/czim0MqXIUFnJd8z79tPS3bHB846yxnKh2urpN6ITdE8g+rLYyLnzWAA39/bKWbGzm4WZqgDu6C+7bxOa2S1iepFPh0XnbE8IedaYYHfOkf3X+rDHNXu/pw5+FU7qzgybF3YVTYoCo7S7e6/QGlv+neI=
X-Forefront-Antispam-Report: 
	CIP:212.159.232.72;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:ext-eur1.smtp.philips.com;PTR:ext-eur1.smtp.philips.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(396003)(376002)(346002)(136003)(82310400011)(48200799006)(451199024)(61400799006)(186009)(36840700001)(46966006)(40470700004)(316002)(6916009)(70206006)(42186006)(70586007)(41300700001)(76482006)(40480700001)(478600001)(82740400003)(7636003)(7596003)(356005)(82960400001)(40460700003)(2906002)(4744005)(55446002)(36756003)(5660300002)(8676002)(8936002)(26005)(82202003)(83380400001)(42882007)(73392003)(6266002)(336012)(1076003)(2616005)(36860700001)(47076005)(83170400001)(9686003)(35450700002);DIR:OUT;SFP:1102;
X-OriginatorOrg: ms.philips.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2023 12:46:39.3581
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a319b43-3ca7-4212-ebab-08dbb069a542
X-MS-Exchange-CrossTenant-Id: 1a407a2d-7675-4d17-8692-b3ac285306e4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1a407a2d-7675-4d17-8692-b3ac285306e4;Ip=[212.159.232.72];Helo=[ext-eur1.smtp.philips.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF00009B9E.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1P122MB0205
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 08 Sep 2023 12:46:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104806

From: Julian Haller <julian.haller@philips.com>

Signed-off-by: Julian Haller <julian.haller@philips.com>
---
 meta-oe/recipes-support/openct/openct_0.6.20.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/openct/openct_0.6.20.bb b/meta-oe/reci=
pes-support/openct/openct_0.6.20.bb
index 0d3ea4186..4a1a0f568 100644
--- a/meta-oe/recipes-support/openct/openct_0.6.20.bb
+++ b/meta-oe/recipes-support/openct/openct_0.6.20.bb
@@ -1,4 +1,4 @@
-Summanry =3D "Middleware framework for smart card terminals"
+SUMMARY =3D "Middleware framework for smart card terminals"
 HOMEPAGE =3D "https://github.com/OpenSC/openct/wiki"
 DESCRIPTION =3D " \
 OpenCT implements drivers for several smart card readers. \
--=20
2.25.1


