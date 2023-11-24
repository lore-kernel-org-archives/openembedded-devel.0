Return-Path: <ceggers@arri.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42C07C61D97
	for <webhook@archiver.kernel.org>; Fri, 24 Nov 2023 07:39:55 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.112])
 by mx.groups.io with SMTP id smtpd.web11.131214.1700811591333008143
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Nov 2023 23:39:52 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arri.de header.s=selector1 header.b=ZgOD4C70;
 spf=pass (domain: arri.de, ip: 40.107.104.112, mailfrom: ceggers@arri.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NBV9H4zsv2srFduQ2oZQYZ4E0Y2Be0io46pQEvC2Tdl9QrJHP54hBMEP/3xTgfZAzGyIuHf/HirCVeeBJUfhoFGcsa49BkUwleFR0SOXow7aYoYt2w1kb1AL7zq7F+6l00wc4wRHUwwGEP3KUqMgbSzSZ9dwSpTojqPxQb+ijtl+NJqmEVy3Hek82gLSwnCcg+Nuxe9UAtCrlqWjrkl04HpvU+/yrWRXbZG0Px/6HMcOwWLLhh8PgBmfA+vdrtesprCUFrscQ/Pci1cMehOj2q4xps6aAm4a1Om4T2rL363ziSwxMUjwUvcmwXy1nyYmWmErxRKJyu5C4U8ZMvkMBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g81zHPyARHJgwxCKbY2TiX+rjYX14UYr7+aewXjYMms=;
 b=VRCFAedl7CMSK774uaQDGoGyE9X6u358ABFRUAG07nD2BJQP569IzQC+MbCSXKeBGwjyUbLZUtcoytfiUGs51p1VGtIQJz1g0gjEIbYhXw8NtMwvSS3a4AZR3CLIsQ/6hGGKg59N5Ju7hp84v69Juc7xRgtb+hyxgUvz7o6C8/TFWgKU7dOO/TJR0Noa3Rc9qokqH7kkR65xINryNqv3lm6PrH6/eXFm64YgEt0+f8R//RrXKhCx1p3OwDPfhf6/B5VbRAZLzN4HXSWjDgPa4qqGsdEURkWXj8zceOeHno6dYDbxlFJwOUy6RY0tlLEqTrK2WcgL1YRz2cbWDB0qkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 217.111.95.7) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arri.de;
 dmarc=none action=none header.from=arri.de; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arri.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g81zHPyARHJgwxCKbY2TiX+rjYX14UYr7+aewXjYMms=;
 b=ZgOD4C70PUCBxs/sJ1JQmVywBDiPKGgQ1cyg0edXQJVgLoie/00gWTCgGavE0t1PweLuPyp94uSGPuMxuvGATxtZOU8xV5DCWl2L94A0YhTOOA85XfMP0MRKji+1u9dR4O8yU1hihCOzwiTFKMPbvtMuEtojRF/SltAq0sRERUk=
Received: from AM0PR04CA0059.eurprd04.prod.outlook.com (2603:10a6:208:1::36)
 by VI1PR07MB6511.eurprd07.prod.outlook.com (2603:10a6:800:188::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.20; Fri, 24 Nov
 2023 07:39:47 +0000
Received: from AM3PEPF00009BA0.eurprd04.prod.outlook.com
 (2603:10a6:208:1:cafe::fe) by AM0PR04CA0059.outlook.office365.com
 (2603:10a6:208:1::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.28 via Frontend
 Transport; Fri, 24 Nov 2023 07:39:47 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 217.111.95.7)
 smtp.mailfrom=arri.de; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arri.de;
Received-SPF: Fail (protection.outlook.com: domain of arri.de does not
 designate 217.111.95.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=217.111.95.7; helo=mta.arri.de;
Received: from mta.arri.de (217.111.95.7) by
 AM3PEPF00009BA0.mail.protection.outlook.com (10.167.16.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7025.12 via Frontend Transport; Fri, 24 Nov 2023 07:39:46 +0000
Received: from N95HX1G2.arri.de (192.168.54.82) by mta.arri.de (10.10.18.5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 24 Nov
 2023 08:39:46 +0100
From: Christian Eggers <ceggers@arri.de>
To: <openembedded-devel@lists.openembedded.org>
CC: Christian Eggers <ceggers@arri.de>
Subject: [meta-python][nanbield][PATCH] python3-gcovr: switch to main branch
Date: Fri, 24 Nov 2023 08:39:32 +0100
Message-ID: <20231124073932.11735-1-ceggers@arri.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [192.168.54.82]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF00009BA0:EE_|VI1PR07MB6511:EE_
X-MS-Office365-Filtering-Correlation-Id: 42c4f996-62a0-414a-1556-08dbecc0882f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	75wySZbfdB35gYrnl7biCiSVzNw5QK3UzElUoP28aEMU4M08KQCyFE9duaEquEfBgOEaylBaHjyB2hAm9zb3hGPPcoB/7qXltf9wz6p89PXIivoNqlBMJ1t6Db8MdX+wHSuNBe7TtHjOGNrlWEGIxeOG1BvfJahMZfISAr6H1v7nFDANtE4KprSSzNw5bb/8O/1Fvdg49ctjriD85tTD/gGWM2ZLuMI8mkjBZeRT/sldgfYqsptWZYd71wr9H94zpOu8hGRfOKmeR+oChXybB2as2HydPbewLPZx3PNxp9/nNE0ihCcWK96iPwopl2P27hVDdnaiAgnZUYnO+ru02Ki6Mv0m9r3o3EtaLIsr0HIgmjL4ffUFOT3afDuwVKBI9hPgrLGDAlwVJNgLWObhHbRntJfpsMIOZTYK9ejk7TINSltFFLfuu819AOEAqBNVNE4czoF9ipWDgw55RTWrtKDlSTcC0fInEqVNq/fwR0wJF2Ml74gdeOyDpaiBebgaAIx+mzzJ3megjyl5hdjApJVTYf+nmB4wvYTbdtMrx/Nq21s8vvE2gmAz57qjiCFOxB7aOoBksiZprzjoYdQDldffgvNcbDmowbapA3u5qe20MCa5uLnDjlzmMO5d57gIth3XOIHevYSNCcXRmgyIO8XEt7bkLBnhE6QyAcO0aOx4mH7ZRI09PCOD11i0EJko2msRJYPrwQVprWAVZhOl+5qW7aVdnuD7f6hGQRWrAx9I0M5Jn0iK0+xhRJR1jm+0PE6GvqluDt1Gqtn1esLYtm7GFwHf/eRfm1+3Bb/BnZk=
X-Forefront-Antispam-Report: 
	CIP:217.111.95.7;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mta.arri.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(376002)(39850400004)(396003)(346002)(230922051799003)(186009)(82310400011)(64100799003)(1800799012)(451199024)(46966006)(36840700001)(40480700001)(26005)(70586007)(70206006)(107886003)(82740400003)(36756003)(356005)(81166007)(86362001)(83380400001)(6666004)(36860700001)(336012)(426003)(2616005)(7696005)(2906002)(478600001)(1076003)(6916009)(16526019)(316002)(4744005)(5660300002)(8936002)(47076005)(4326008)(8676002)(41300700001)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: arri.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2023 07:39:46.5407
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 42c4f996-62a0-414a-1556-08dbecc0882f
X-MS-Exchange-CrossTenant-Id: e6a73a5a-614d-4c51-b3e3-53b660a9433a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e6a73a5a-614d-4c51-b3e3-53b660a9433a;Ip=[217.111.95.7];Helo=[mta.arri.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF00009BA0.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR07MB6511
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Nov 2023 07:39:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107044

Branch "master" has been renamed to "main".

Signed-off-by: Christian Eggers <ceggers@arri.de>
---
 meta-python/recipes-devtools/python/python3-gcovr_6.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-gcovr_6.0.bb b/met=
a-python/recipes-devtools/python/python3-gcovr_6.0.bb
index 21c36687e263..bfb0aaf5e79b 100644
--- a/meta-python/recipes-devtools/python/python3-gcovr_6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-gcovr_6.0.bb
@@ -4,7 +4,7 @@ SECTION =3D "devel/python"
 LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D6542fc4ce5904ffb741ef56f8fe=
33452"
=20
-SRC_URI =3D "git://github.com/gcovr/gcovr.git;branch=3Dmaster;protocol=3Dh=
ttps"
+SRC_URI =3D "git://github.com/gcovr/gcovr.git;branch=3Dmain;protocol=3Dhtt=
ps"
 SRCREV =3D "1221ef62ff0de15bbeaf79e68e08a65d62c73ff4"
=20
 S =3D "${WORKDIR}/git"
--=20
2.35.3


