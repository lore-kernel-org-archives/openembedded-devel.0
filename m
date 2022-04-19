Return-Path: <andrej.valek@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FDF7C4167B
	for <webhook@archiver.kernel.org>; Tue, 19 Apr 2022 14:22:18 +0000 (UTC)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (EUR02-VE1-obe.outbound.protection.outlook.com [40.107.2.74])
 by mx.groups.io with SMTP id smtpd.web11.1288.1650350437737447170
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Apr 2022 23:40:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@siemens.com
 header.s=selector2 header.b=j3+65u7G;
 spf=pass (domain: siemens.com, ip: 40.107.2.74,
 mailfrom: andrej.valek@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a8I1Am1pHdNZLABVf00W2SlY5lPfomdZCa/LNuwImdBTtuPE6q8E++wxg+Neeb5EfkAsL7QjhMDWx+S+5CdoFKOy8CUXTBxPZV8H/t1uixw+5miD7mdjuCdHF+vTgY3o9x+klqTDIszMcvK2mT/DoZPStoplaN9aqB0CmNLM6XEtpaO0Zyu9na5DoH3srolRQUm7mqE2L4uzH1snvPAvqzEERUm7+mKRLQHvUgTpEUJA+CTohCOs7ehp96P2y9MiOAjBLHcBkRNYJtAwfP6wie/6mCWy86n/iiq/0gTGPdStICzQdu9BJpmtnI1ZyrU73S7GBYJFdpQwU5z2HoDQLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yc7EkDQzO9xCpr5T3WE2kLVjLm+7gV36L/oTjMmnR4w=;
 b=c33TZGWWJAZvJkCi5FQWMlUYfGzuPC9rcF7Djnbv/ggx03iCkMBQ5qk9t4RdHgB+3xZ5GB+j/6/mH9LBY/cbCdkTV3KVVZmx70gxU3B+pnCNW9hPwfbiOC5yLV+7u7TJ4f1nKLA6LZKiHTSG0u5DYp+49Hj8Yg+3UpIvLW4MvVjZYTzFmnH5yGdxIhGhDeha4paaSMkoBpe4Dl0GmCenWSiet2OeAY4Ofpl2O4GzAGEYafmk5rTGuzz0cMUe6/CC2KGPFFEhj2IHXxf7ELNLUVdlNGU2dyegEAGT9TScNIK+GJFmpKEQOnnOS5LQoy1p9jyR9hP70rGhh6ISST4qyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=temperror (sender ip
 is 194.138.21.70) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=siemens.com; dmarc=temperror action=none
 header.from=siemens.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yc7EkDQzO9xCpr5T3WE2kLVjLm+7gV36L/oTjMmnR4w=;
 b=j3+65u7GavbGl5kwWgjkiSa7xyr0JSJ1JbLogjIuYlhhT/b6WSRsBIYNdgZTgRymsi5Pc3omUtvxbi/CijyEPdYQvL5LQanESkWgAOsPFeoiqGNjPYbAjJL+DELSOp4Tlb9vpsGQI8oGg1Vz8oOufq9SvJzxzboWxirwlQGKybOrWUizZnwQ7ARHbIkl5LuHHUnKz4e9O18VlBOesGtYxCnciZEuhAcghB9bmq95DCJFT8BPaEJ8Jkq/eMxpSTzywcziuuJV/7ZS7dkUKF9s/+CoerFylTxkPWCoIBCWyykN6qroof0mvw0i5VI3U3IMOXaGjTLq5+7+6+A9Xs9LMA==
Received: from AM6P191CA0095.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8a::36)
 by AM6PR10MB1992.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:35::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Tue, 19 Apr
 2022 06:40:34 +0000
Received: from HE1EUR01FT036.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:209:8a:cafe::b5) by AM6P191CA0095.outlook.office365.com
 (2603:10a6:209:8a::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20 via Frontend
 Transport; Tue, 19 Apr 2022 06:40:34 +0000
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 194.138.21.70) smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=temperror action=none header.from=siemens.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of siemens.com: DNS Timeout)
Received: from hybrid.siemens.com (194.138.21.70) by
 HE1EUR01FT036.mail.protection.outlook.com (10.152.1.30) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5164.19 via Frontend Transport; Tue, 19 Apr 2022 06:40:33 +0000
Received: from DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) by
 DEMCHDC9SJA.ad011.siemens.net (194.138.21.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 19 Apr 2022 08:40:32 +0200
Received: from md3hr6tc.ad001.com (167.87.72.125) by
 DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 19 Apr 2022 08:40:32 +0200
From: Andrej Valek <andrej.valek@siemens.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Andrej Valek <andrej.valek@siemens.com>
Subject: [meta-oe][PATCH v2] poco: upgrade 1.11.1 -> 1.11.2
Date: Tue, 19 Apr 2022 08:39:54 +0200
Message-ID: <20220419063954.64186-1-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220419060436.54655-1-andrej.valek@siemens.com>
References: <20220419060436.54655-1-andrej.valek@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [167.87.72.125]
X-ClientProxiedBy: DEMCHDC8A0A.ad011.siemens.net (139.25.226.106) To
 DEMCHDC8A0A.ad011.siemens.net (139.25.226.106)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 65dd4dd1-57c2-4f13-feb0-08da21cf810f
X-MS-TrafficTypeDiagnostic: AM6PR10MB1992:EE_
X-Microsoft-Antispam-PRVS: 
	<AM6PR10MB19923BC98D997E1FE49570D492F29@AM6PR10MB1992.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	XpU7bPTk0xOG/XMtMgOKYnq8BMctrDKsEGTRM+5oeamoHFEGs7xUbuQi4f4osd3hVXisyMOztIHbkFE9QudQA8xZ5aKEmeolMaH7qrjEgISwvFojIGVUBfVOWj5Hi5N+OTJ1k5/9Bh/YJlXSZwGd5xwe9sHucXmmIAqIJmCgOzOc1mofVyCSkQksxqJgzXRhhCQwM5hqyTpLh64Lt4J8VpN+Kw4KS60KRPLdcIDCVhCKTRcBW+PBRX7fDDLk4uHdcxBa/cimKFQUjm23PB75IXF72sBx0XQZM5jZH93hFsIbwFNqD14brRVPgjcYb5v1kH932xlA0wueNsq0AM561PYh5CeJfep6Ygys6SUVcS3AsR4fsKJn/CuNwVBqggtqZKcaUD3PbpHBPXDujj7w3/KxKvIrwYVz3nQ2YcOt3V6whLMTJ/01QDCtUAZxVJhHwhtNZPL6PqPUzDNZ8EBkjXOGiMnd6cZWyiN6dZjXcNBv2aJio7kYhzkOMro0YyzV68kIBBMCXlI/JsmO2oieMwcnTJcxO6OgvcMcEy7aY1LNIC0t7sfHjFslOt1RUDZFqytnu15D/6ZzjgwPXt+nEn8HJ4TEe1We4U6jTbWQvdsur4W51c45D0q/HPW8wH/WOaib0s7D36bnVobUDUQZHw8Ukw8slxkCME/YzZzfYSa+ZnoltCKQenTGc5K6+YCD
X-Forefront-Antispam-Report: 
	CIP:194.138.21.70;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:hybrid.siemens.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(186003)(26005)(36756003)(63350400001)(83380400001)(86362001)(5660300002)(70206006)(70586007)(336012)(44832011)(356005)(6666004)(1076003)(2906002)(6916009)(63370400001)(956004)(2616005)(40460700003)(47076005)(4744005)(82960400001)(107886003)(82310400005)(36860700001)(7636003)(7596003)(8936002)(4326008)(8676002)(498600001)(16526019);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2022 06:40:33.2665
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 65dd4dd1-57c2-4f13-feb0-08da21cf810f
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.70];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	HE1EUR01FT036.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR10MB1992
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Apr 2022 14:22:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96690

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
---
 meta-oe/recipes-support/poco/{poco_1.11.1.bb =3D> poco_1.11.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/poco/{poco_1.11.1.bb =3D> poco_1.11.2.bb} (=
98%)

diff --git a/meta-oe/recipes-support/poco/poco_1.11.1.bb b/meta-oe/recipes-=
support/poco/poco_1.11.2.bb
similarity index 98%
rename from meta-oe/recipes-support/poco/poco_1.11.1.bb
rename to meta-oe/recipes-support/poco/poco_1.11.2.bb
index 3cfd49fcd..8694983e7 100644
--- a/meta-oe/recipes-support/poco/poco_1.11.1.bb
+++ b/meta-oe/recipes-support/poco/poco_1.11.2.bb
@@ -12,7 +12,7 @@ SRC_URI =3D " \
     git://github.com/pocoproject/poco.git;branch=3Dmaster;protocol=3Dhttps=
 \
     file://run-ptest \
    "
-SRCREV =3D "de61f0049175a941cc83c2615c3bdc5e947b89f9"
+SRCREV =3D "9d1c428c861f2e5ccf09149bbe8d2149720c5896"
=20
 UPSTREAM_CHECK_GITTAGREGEX =3D "poco-(?P<pver>\d+(\.\d+)+)"
=20
--=20
2.34.1


