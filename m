Return-Path: <hadkeakash4@live.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CC11C77B7A
	for <webhook@archiver.kernel.org>; Thu,  1 Jun 2023 15:19:41 +0000 (UTC)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (APC01-PSA-obe.outbound.protection.outlook.com [40.92.52.95])
 by mx.groups.io with SMTP id smtpd.web10.35111.1685632774126082986
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Jun 2023 08:19:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@live.com header.s=selector1 header.b=YBjwmTKm;
 spf=pass (domain: live.com, ip: 40.92.52.95, mailfrom: hadkeakash4@live.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vo6dN3LitJOJdxjIPLVglIE/ZCIjSMcDL4zQ0TMyVVtotGeA/AAvsGf3FphdNn1f0ImFvkyZlCxcvA5q1PpyQZFGzH8HBm4Vf/OsE4Wkmlzz9XAJShVcSrEFrQnP+yyK2YUn5ukoF0cJoP1b5jQPRstEsXMMkCKu3nMGfraQqXOgoU9/yPdJbjN1+CRsdvQP09tToskipso2Lj1zJAoQ3HDaZxHTcdcXwQFTi+PKvBKb1cVDa8lNQyc5Pqs40iDAowBoqGc8Mx00gQDFmGpaNP/x1qA/LKzCAjV37ZRkJw7HFkhUdwCIRY+X+FzifkOyb4zDg6bQ4TZLROy3GVlC6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g1sShGPaI8XkLhtAI8YJrpnskDhPkf2TV3O/7pcD994=;
 b=Ev69HTwnksBRky1johx/3NXH8lRjpSiMV83i3Hge8tDqosibhPC1i2V79pvbupzD1XCcRXW035M/B/bZbk8R3JEI/n+ydXrcBdoi44v8h3WR50stb9vPsn0E6lMZSKIYS7+PwXPeKBnc58FXcoNr7GUEE9dRqW5RH/jhFAi0mSVH2FsfcCddBxGpITozSV9iydnHWxI/ZHqw7zPUlBxPHINUhU8XIOSPllugybE5PD0wIVz+v95KLQteEUKP6Iud95TmGK7lWXvA3TcmdRE77hjFY3vxCxJjn8fLKZlFiiRgryRRoF3J4wuOcQbwWtvfi0lx/XmIWO2VFG92QcvkqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g1sShGPaI8XkLhtAI8YJrpnskDhPkf2TV3O/7pcD994=;
 b=YBjwmTKmcxUs7o/VI2HkmzVHUKcLeMa2FFotbdau7rbPLd0mK2o7EAd8ePNgC2cIJwnvkA55zsEtNUuly15rInTcJy5hUAlZvMFtLuGx94cHppxDkr5N6ZbLS3PR7WnhimU0BHnQeDQsPuItV/VA2svrT/acWmdn35MraSN0MzNnz5zYVfk9bozuKIAllBUh9nbO4jRLO90KRRDsPFD6umq1+EWzgI/PKJ4lqFG/DL2Qo/J8ZEATVY02+jKpKHX+QXUfq1TwmHe/OIZfYNxY1JZqUBGhqriw5MReVAfL38Snpm0mm/vFC+010uXLiUWFltSJs4Pmf8Es1n6dwXa/wg==
Received: from TYZPR06MB5026.apcprd06.prod.outlook.com (2603:1096:400:1ca::9)
 by PSAPR06MB4183.apcprd06.prod.outlook.com (2603:1096:301:3d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.22; Thu, 1 Jun
 2023 15:19:33 +0000
Received: from TYZPR06MB5026.apcprd06.prod.outlook.com
 ([fe80::acfb:f22e:d0d:fce4]) by TYZPR06MB5026.apcprd06.prod.outlook.com
 ([fe80::acfb:f22e:d0d:fce4%6]) with mapi id 15.20.6433.024; Thu, 1 Jun 2023
 15:19:33 +0000
From: Akash Hadke <hadkeakash4@live.com>
To: openembedded-devel@lists.openembedded.org
Cc: Cameron Miller <cameron.miller@homeaware.com>,
	Akash Hadke <akash.hadke@kpit.com>
Subject: [meta-java][kirkstone][PATCH 3/3] Remove checksum
Date: Thu,  1 Jun 2023 17:18:43 +0200
Message-ID: 
 <TYZPR06MB5026488C0441C9F1E603A13A84499@TYZPR06MB5026.apcprd06.prod.outlook.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230601151843.29599-1-hadkeakash4@live.com>
References: <20230601151843.29599-1-hadkeakash4@live.com>
Content-Type: text/plain
X-TMN: [ZILaAqS/RojGfv9IPkpHnNnhEgvKr2wU]
X-ClientProxiedBy: FR3P281CA0023.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::7) To TYZPR06MB5026.apcprd06.prod.outlook.com
 (2603:1096:400:1ca::9)
X-Microsoft-Original-Message-ID: <20230601151843.29599-3-hadkeakash4@live.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB5026:EE_|PSAPR06MB4183:EE_
X-MS-Office365-Filtering-Correlation-Id: 079a992f-84ec-4923-e17c-08db62b39a67
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	PpT/qUtAK8paP9ccf5RctzQ5yfsNC57NzQdPges0vypUAtTTVqXVuiWf1J41dr2TqwfIHq35WWUzpP/d2JAKbUKSn4ss96BaMD2NfNPm5j9TOKLcN8Vraf/CEHB6vv7TIn4FJ3v3jJyFIZXxmmKozp0r9gFGVRbTNnLCT9zY+D1OMBS/BMLL1FUHvPJSAiAOFFfhE0Q6n3V/xod8Ga3fG6tldK8KftLFD136uROuTTFii7vwRTSZreIvHRkEhCJg3QAVkT5ysS1tJ7dWy+r/QHQtYgJd5wlOt2P0qQQYo2RRx32CNX7ogG44raSFq6hayiCgmElOhItTxjw9QhWoP28reWhl1xLFgy1n0MZCe+pCLIixJebCHaPhaDo44dEPnEn6IdnQob+Omvp5jPOklmATE/0FymRt8pO+Ilm3ezNSqou4RbzKvYMO7sxAeG3gyYs6VzJfzEMn2WoY86uh417K7v2UYridcx+BE3T/IS2/gGJCWUqmd29sqtzYxBOXtUZai4Tj5bNMbTAtfYJPuPz9Hyph2P/3XUFtk6WzMyJPLS9XfVlLAih4wXQ/p6bv
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?qI1oCMNK/uhh+VqOez3yohif5ThEcmVZ09LvHhUay+DUutlkkMwpqM+lVjl1?=
 =?us-ascii?Q?Gz1SZELa5Ng6vPVeZ0J3fPmLlGDMyIPbWqCedCP6Zho2wi0F7eIePNvVDAOh?=
 =?us-ascii?Q?DTOeBlVDHA0yUf9ehchjIHS+rtGTQrcZLQj9fSO0KCJDPnrkU0Uanzh/rTOV?=
 =?us-ascii?Q?hiM+F1A4+RkPQDaWsZRfY2tL1PL5Rhm0YWOh3LgMPv7h/5XiHuNg/lbPBqSk?=
 =?us-ascii?Q?yzTO7PL6I+orO2bcqQj3vUzZ3naSvoT9teDR7R9PaUoP3jsO9CNs8An3Edfh?=
 =?us-ascii?Q?AbEgwcF07uB4FegDwOYsHBSn72EjDCwXRm35ulzhJSaJZiYFF1sl//SNlvPz?=
 =?us-ascii?Q?DeTCa7xQebFuC/KoPGNf9ir0wlibgdH/YOqqk8JG9x8/KJG/p7j6XxJUvVoE?=
 =?us-ascii?Q?IGyw42W6BN83c4vfLYkqedAiC9DPXrrJwFY9YEEEpguixI+WNj0+qeBnRKH8?=
 =?us-ascii?Q?60hf8h2QvZG8VzIaBsZtCfHqGUir/Y5AXm1FqGdKKqv+a8IDGWz454tNjGJW?=
 =?us-ascii?Q?CEce7jxKrz9YrKu9pco5+cEmkF1JHr/DIJAUNEvc+Q6rvxBOUJgpPsCZ6Cqe?=
 =?us-ascii?Q?Of8ULmMiHU7wc5TLb9NEgWu/z3Lmkj9WbFT8Qin17EkNB338aZxVJWvhRUoP?=
 =?us-ascii?Q?7XUnOgWCF8HZlkwAiUDV7iDyPM8lX0RR5yZctisYNamnWqacJcZ4iHygA3G8?=
 =?us-ascii?Q?KcnsPI1cKDq3m+051eeqVJmt3eHLdKG/wPoCI5On/vbDnjPP7MWZqS6t0yTX?=
 =?us-ascii?Q?Maha/BNS+NS8D5gp2GY9IquZSo0m4WaZ8Q4uBpoXZKMVEnVphXFRVUwqAql+?=
 =?us-ascii?Q?diUfKwOCjxXF1DMmAVQu2sLZYSNjKIHajbvrdTeSYP7f8mZFefsnIij0zTEp?=
 =?us-ascii?Q?jFyYm+qFKz4+UDlP9Wo89YvArLnZcqeUF7t6CBb7riUU+XN1hLHJUJ/eCd+W?=
 =?us-ascii?Q?EO+IH7GH/wbGvuyKap+merAVJyFUqjdz/Q6qR036bVod+ubjhdA8OGVE2Gdk?=
 =?us-ascii?Q?766iLQJLVYqFafflqv5rfjwnNu63os/nv0guwwJ96VvJ3QsfF6LGLqYxAEf7?=
 =?us-ascii?Q?ZTmfzDgyP43y46iyyI73JpJ1J/8k5Bbb8GBIL1ho4gbAZyyZBZEjLygFn3M1?=
 =?us-ascii?Q?u7vDOx5iWmzJjrO681jNGBBGi7GYeafkDRnB8ATUN4uYTjMQ0OVv5tRML4Dv?=
 =?us-ascii?Q?+PN4PuS5eOt9o7kybGrj76LQsXAZlpBMqiKCXA=3D=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-3208f.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 079a992f-84ec-4923-e17c-08db62b39a67
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB5026.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2023 15:19:33.7538
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSAPR06MB4183
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 01 Jun 2023 15:19:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103079

From: Cameron Miller <cameron.miller@homeaware.com>

(cherry picked from commit 37f14a397aa553d50ea450eaa614b5760e5d56d9)
Signed-off-by: Akash Hadke <akash.hadke@kpit.com>
Signed-off-by: Akash Hadke <hadkeakash4@live.com>
---
 recipes-core/rhino/rhino_1.7r4.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/recipes-core/rhino/rhino_1.7r4.bb b/recipes-core/rhino/rhino_1.7r4.bb
index 9a580d5..d645e8a 100644
--- a/recipes-core/rhino/rhino_1.7r4.bb
+++ b/recipes-core/rhino/rhino_1.7r4.bb
@@ -46,6 +46,3 @@ do_install:append() {
 	install -m 0755 ${WORKDIR}/rhino ${D}${bindir}
 	install -m 0755 ${WORKDIR}/rhino-jsc ${D}${bindir}
 }
-
-SRC_URI[md5sum] = "1f893577269631703d31e4de9d5dc1f4"
-SRC_URI[sha256sum] = "860965fc611764745b3a4fc5bd4baac07356a9fedd2ce6642e7bb0bd7ef58d07"
-- 
2.17.1


