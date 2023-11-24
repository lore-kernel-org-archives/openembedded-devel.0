Return-Path: <ceggers@arri.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45A73C61DF4
	for <webhook@archiver.kernel.org>; Fri, 24 Nov 2023 07:45:45 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.129])
 by mx.groups.io with SMTP id smtpd.web11.131262.1700811935439473597
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Nov 2023 23:45:36 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arri.de header.s=selector1 header.b=PeIksCYO;
 spf=pass (domain: arri.de, ip: 40.107.14.129, mailfrom: ceggers@arri.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UEg8f/ZXk0XHixrPyheFHINp5GMyRpuxfCvVNCMy7qva9Jk3+y/pypIPn/zS4hdQGY3qYDjKzWRRyEkG3QEDzIj+DgmudcZkzxhreJ+H6VU2RHnjJ9CN7i9JgOZalsI4C/lzxdlkkBY/fmLf80if4QkC6p4aFlL68DoGqH1RqTV+TXQbw9Idi50b3iIHu17z/icSQglL5vJtT20Hk9I1c2wS/3n3Bqr0+s9IwrASRSnW2WsBjSkyzqERw0lXd8labhN/Ngm4pg2qPmUUDphO6jitJm3T2lDXuJZrdw3HMwAkuwRgC70fMd2fHV3JA61wR3LEKu95R2Opr2dwln1jBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7d3freSTOXj2kxr4okeUf0JJxRTb+sD/tH5Z1vsTzds=;
 b=RPDjbhFb01GsZdfZzszHrXCnPqoyJzT83oqYcTqfXm7RyYoV1NkgoxncI3Q4zVsBTMk5bOr+KJCpxvXHd6bSjCcFlY4feTHAUj8iG3EqPtxrUZABZyrAEFd16v0uKWMwBeKTBVPP44xa/z8I/+MRgIs+WCs3A7ykxDf6uf09MuINeHZCcm7GKB8VWk4pXIyyUsK3nj90i+XpSuB7tw8Whi/Pzf9hFdSzYUWnF9u6+5UHMzmpr6hiK5WRTI86tDuF/ZKu405SH1bJx5OmwjGSb4xeMRcN+jYnex6rKXBtR5cRDBHtGdLY1DWSpGNuZwaJMKO7SsJ9TPAxYnDbauT0Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 217.111.95.7) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arri.de;
 dmarc=none action=none header.from=arri.de; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arri.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7d3freSTOXj2kxr4okeUf0JJxRTb+sD/tH5Z1vsTzds=;
 b=PeIksCYO9FPpaeeLo8lhBhS6eMNIrS9bNRJIUEP6nIVla3Ls/R+tTF5MRU5FTcINVpyOkLDtfL03vGmvKFnQHldxFHqy9J4TLEK3jLuqQB8mKoCFB2TV6eKCvqDaC8rYtilfbBQiL11yYJpTE3QXwKrbrHrcVrpnvix3A2kYA+I=
Received: from AS4P189CA0044.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5dd::13)
 by VI1PR07MB6525.eurprd07.prod.outlook.com (2603:10a6:800:188::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.21; Fri, 24 Nov
 2023 07:45:29 +0000
Received: from AM3PEPF00009B9E.eurprd04.prod.outlook.com
 (2603:10a6:20b:5dd:cafe::6c) by AS4P189CA0044.outlook.office365.com
 (2603:10a6:20b:5dd::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.21 via Frontend
 Transport; Fri, 24 Nov 2023 07:45:29 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 217.111.95.7)
 smtp.mailfrom=arri.de; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arri.de;
Received-SPF: Fail (protection.outlook.com: domain of arri.de does not
 designate 217.111.95.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=217.111.95.7; helo=mta.arri.de;
Received: from mta.arri.de (217.111.95.7) by
 AM3PEPF00009B9E.mail.protection.outlook.com (10.167.16.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7025.13 via Frontend Transport; Fri, 24 Nov 2023 07:45:28 +0000
Received: from N95HX1G2.arri.de (192.168.54.82) by mta.arri.de (10.10.18.5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 24 Nov
 2023 08:45:27 +0100
From: Christian Eggers <ceggers@arri.de>
To: <openembedded-devel@lists.openembedded.org>
CC: Christian Eggers <ceggers@arri.de>
Subject: [meta-python][kirkstone][PATCH] python3-gcovr: switch to main branch
Date: Fri, 24 Nov 2023 08:45:15 +0100
Message-ID: <20231124074515.12988-1-ceggers@arri.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [192.168.54.82]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF00009B9E:EE_|VI1PR07MB6525:EE_
X-MS-Office365-Filtering-Correlation-Id: 2aab5b4a-ffa8-4d53-ed30-08dbecc15442
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ed1EzTO1uwQ7y34YFodpJseOgTLH+ejHZsGYuoct5xCfygSy255p/YsfvVwhykcw6rbGeodfmQRfy/mzlFmGAIQ5zcY5mrY3Ofe/orIBIGzXrQJGhp7P4Qwkw3NdVJk4xqK3aOJqzqkeWT57JaUS2dnrz0wYq7yu+fNOYj+zJYw0nF3ZbsDWrcdXdIFkzE5ePOGlxPFvJjWT5380DrpOt9YrKvOfCqS6FlgPPGlS8QhwBUFJTxzIwLXkFHo+d/9x6flgJBgzauAthwXGe3bIsvFbMokne5uV0NVP5+GysrBTIhctmEfo7X3iIhmTHQ8uKKHIcMJ+8XmxLzWr0QFx1CAx1nmju19GjUOgS3TkK982qhf/hXwijhioLxJkbWQZtBKD6ennVQUV4nKnMiiwO3+793a/Px7kNTZparKbJYhknErFFMl1ErSbjU6efj0GMFvjbAqqLMnNs19X+cCtc91UTaqZVfjhGG8RoW67ZyVwwO3kNfUewzuHQEnLZ8kk1bitXPo7Mp/Mv2Wg9qB2T4JVV+CICL19aUo2RfuWk1mYn5IaSzxoT6UR2iAy0yFlaEYzu6Px00wVMT2fl12QwASfadWNMY8dLlgjwEuUh1ug1jTXDO8TrWnotn/r1P4BYmwsYr9Mz16e/jhak55kAw7O66f/xmhGYbWjvg8tBXjCnsnvS3Nc54ypCVp2k2+sFR8xb+Csv7gkw5efCAS4OdzNeJOHPFbgNWTLymOw0nSNe8TT9a6l3RANAZIdx4ZgkzuG6j2pbmYmdow+12Qpt936OvPkhyVPejhCMquN7iQ=
X-Forefront-Antispam-Report: 
	CIP:217.111.95.7;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mta.arri.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39850400004)(396003)(376002)(136003)(346002)(230922051799003)(82310400011)(1800799012)(451199024)(64100799003)(186009)(36840700001)(46966006)(41300700001)(40480700001)(4744005)(2906002)(5660300002)(8676002)(8936002)(4326008)(6916009)(316002)(70206006)(70586007)(478600001)(7696005)(36756003)(356005)(16526019)(26005)(426003)(336012)(107886003)(1076003)(2616005)(6666004)(47076005)(83380400001)(36860700001)(82740400003)(81166007)(86362001)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: arri.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2023 07:45:28.9260
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2aab5b4a-ffa8-4d53-ed30-08dbecc15442
X-MS-Exchange-CrossTenant-Id: e6a73a5a-614d-4c51-b3e3-53b660a9433a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e6a73a5a-614d-4c51-b3e3-53b660a9433a;Ip=[217.111.95.7];Helo=[mta.arri.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF00009B9E.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR07MB6525
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Nov 2023 07:45:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107046

Branch "master" has been renamed to "main".

Signed-off-by: Christian Eggers <ceggers@arri.de>
---
 meta-python/recipes-devtools/python/python3-gcovr_5.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-gcovr_5.1.bb b/met=
a-python/recipes-devtools/python/python3-gcovr_5.1.bb
index 9ab8aa9a8948..5dcd9496c5a9 100644
--- a/meta-python/recipes-devtools/python/python3-gcovr_5.1.bb
+++ b/meta-python/recipes-devtools/python/python3-gcovr_5.1.bb
@@ -4,7 +4,7 @@ SECTION =3D "devel/python"
 LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D08208c66520e8d69d5367483186=
d94ed"
=20
-SRC_URI =3D "git://github.com/gcovr/gcovr.git;branch=3Dmaster;protocol=3Dh=
ttps"
+SRC_URI =3D "git://github.com/gcovr/gcovr.git;branch=3Dmain;protocol=3Dhtt=
ps"
 SRC_URI +=3D "file://0001-Fix-parsing-of-gcov-metadata-601.patch"
 SRCREV =3D "e71e883521b78122c49016eb4e510e6da06c6916"
=20
--=20
2.35.3


