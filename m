Received: from EUR02-HE1-obe.outbound.protection.outlook.com (EUR02-HE1-obe.outbound.protection.outlook.com [40.107.1.84])
 by mx.groups.io with SMTP id smtpd.web10.984.1610044824416483280
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Jan 2021 10:40:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@spinetix.com header.s=selector2 header.b=dWHD3umM;
 spf=pass (domain: spinetix.com, ip: 40.107.1.84, mailfrom: diego.santacruz@spinetix.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S2rU4MpfOC2DUCQW5EljLalSQ7FGNRl1NXDCmb1/Q8Rak2vQDZNagkNpE62tJiY920PntWFY/acmjU+n8uTtvSRZFR8DvR1EsWF2OxkVsZjrQu8LIoZ3tFKaGjg/o2TOc5QqEzG53tGwi7t9OQuQJE56yFYMtwzxLVPQ40SumVBpF5nvkIEBjQPkL8kacCM5SHccWzONVf+tI8dfHDlKz+wF7nyvx3TlQ3xRBW+63w5UYChSCSA7PUfpihW1wFbiLi4m183eu6gpTT3Y/CHp2gdAaSHwWy6pXZtHtG1PfRQwoo0edir0j1cJCTkcl2ywimOS4L/2oGeugXa/as+OQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ec0+/4BuSSU7xciuc148ZqBxTNxH6REDr3NTRaTmNpQ=;
 b=NxTc2XY35wVYHoFWXlyJR0TQomDW8oNjHFpNYhmC3NA005v2gEd8xMQY9MFNbehqLMtsxZGgtDNrCX3pBodYytTHSaZIxJ0pwYgod31ryIeluAb3DtJCA1TAy0ZMOC+shM8yU6k4oTOT1G8/PVXBu6BUDZnFIA1d35qPhM4WdfN+KMRjtL7lF5TRHXOQzHqGt69mAkafMXM65Es5M238VfnrYApnSgRd8Un8MJ9ixol9YZk9ctHayl6cmBlc3tIENgI4ZWxEVWVDmlKD1Y1nGcuoE9q5od3SOQW1UsIG4sI9PDuPgxcuMk6i9C4a8BV2yNAGdCGtxKDJMHe8DIYE9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=spinetix.com; dmarc=pass action=none header.from=spinetix.com;
 dkim=pass header.d=spinetix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=spinetix.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ec0+/4BuSSU7xciuc148ZqBxTNxH6REDr3NTRaTmNpQ=;
 b=dWHD3umMjCM9ZSjiHPimTcM8iohqeNHSbhlI9/FZI3br5E4fNULJDZnJ76jxD0xZaOELW6hPQJDZ4txIoyXcK3r7F3evLnUItH426uXem0G0/BhlK9kJgYSA1iMvbGrbizEBRrIoQgNWQfzkzSCOAuRcDom/JxB2NYs+bIGGpsc=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=spinetix.com;
Received: from DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
 (2603:10a6:6:e::19) by DBAPR01MB6677.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:181::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Thu, 7 Jan
 2021 18:40:22 +0000
Received: from DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
 ([fe80::c880:793c:c5b1:c7a8]) by
 DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
 ([fe80::c880:793c:c5b1:c7a8%5]) with mapi id 15.20.3742.006; Thu, 7 Jan 2021
 18:40:22 +0000
From: "Diego Santa Cruz" <diego.santacruz@spinetix.com>
To: openembedded-devel@lists.openembedded.org
Cc: Diego Santa Cruz <Diego.SantaCruz@spinetix.com>
Subject: [dunfell][meta-multimedia][PATCH 1/2] gssdp: Upgrade to 1.2.2 -> 1.2.3
Date: Thu,  7 Jan 2021 19:39:57 +0100
Message-Id: <20210107183958.29151-1-Diego.SantaCruz@spinetix.com>
X-Mailer: git-send-email 2.18.4
X-Originating-IP: [46.14.255.78]
X-ClientProxiedBy: ZR0P278CA0073.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:22::6) To DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
 (2603:10a6:6:e::19)
Return-Path: Diego.SantaCruz@spinetix.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from prefix.spinetix.local (46.14.255.78) by ZR0P278CA0073.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:22::6) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend Transport; Thu, 7 Jan 2021 18:40:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a0dfda24-1556-4494-b98a-08d8b33bb0a7
X-MS-TrafficTypeDiagnostic: DBAPR01MB6677:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DBAPR01MB6677DD92CDF9889DFCA293F288AF0@DBAPR01MB6677.eurprd01.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:462;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	TjLEitqRS2KT3gXSZfccy3otiOSET4aGQ7y7BO9nazsiKqMphrgTU23w1FVryRrx711ndrMS8nasLbl7ox+OyO+5KhoGBj7OLak5iU9ZUrLtCTT3RxabheAF+2cN1yEX27dfT/RiKjIbutxJi6p9a2/9gnODfNgqR51rPw6d+claLlKiTRj+XO9wkUb/HZiJDpOrURdi0er842hgxt+leJO/2uMqyuURVBzE+bg0uyIZm+ufCTX6CoJ+GDpqDZeZaSPkd5xGtDVEMpKJp4CIGtn/07DaexDyxnB+igroONKe/Gsojbr3kj0b5ZRYtqO/wBfY6t5Zo8yywOjGpmlPZT/Qey87AGAMzs83AEka7BLZ2IMNum+3z2zY3SXE1BtXRXftxrcANIAFMOSYllKYhw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0102MB2630.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(39830400003)(136003)(366004)(346002)(8936002)(36756003)(52116002)(956004)(316002)(5660300002)(66476007)(66556008)(66946007)(6666004)(1076003)(478600001)(2906002)(6916009)(8676002)(83380400001)(16526019)(4326008)(6512007)(107886003)(6486002)(186003)(6506007)(86362001)(2616005)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?bn9FiW/N9yAF30Rqb5sM2K1IKkIei4DxIDK86sNP17xtLVd/1+TNumwgTK3j?=
 =?us-ascii?Q?kYaFx4KQciCEUlUVSPSiQACGSUi5ToaOeMZnQh/G6fhvzE9ep96rnj6DN907?=
 =?us-ascii?Q?npQ4q1N61t1X94aobwX4y6nRiVGCOeZCVI/+zNukyzTzD+ZropRaJ3bKmCNf?=
 =?us-ascii?Q?C0vIvrqsQmIEPLXReb2dVNdrZKcazEpeTGiXehUIBr/97ukCAQOphPKzKdH+?=
 =?us-ascii?Q?1p2GVcxxyQc8eksKZBNTpeuZkKEcRWjG5FY9D4ipzTGUDIc2uvr6rMvjpDx5?=
 =?us-ascii?Q?huc7ZthFxjZV3KtRfN4HNghcuAounof8me4qDEndwLNAFTRpz/qQP/mgFlH1?=
 =?us-ascii?Q?pz1Dk1xIHZM0tW1SEwU8aCeGqVkHe3Pa5eTZeXjiGMPj4KQImsjUz1fTmUNs?=
 =?us-ascii?Q?TELX43yRAAk6T+Gz/uKzozFY1EBCAUtxKAhGZO5DaV6xpk1Bc8bbOHPBrb6b?=
 =?us-ascii?Q?cjSzIn6i3ElELjxzyCOh29SwfDyKGcGmtdgHmZuTWTnG1TmMGZiqBjISGDgz?=
 =?us-ascii?Q?OjcETYf23l5S4IR+GHhAlcVqAPDoS4D9zKv4DZK9FJ9pq8Rb5tPr/f6X7kYV?=
 =?us-ascii?Q?vfiW3vBVbZ9/FHVEwYVFLLGfGpKV5mq0qtNvCKNcFvcqMDGMbWHR6HTVG4og?=
 =?us-ascii?Q?yJzHSg6OUJyWrKV/ov4rSmdnTkf+l/xCmP+ajEzO/IOLhWdFPhEySWZuhxGU?=
 =?us-ascii?Q?LsDH3r7uYC9rSej1pnUurhH4f/gw8mI79aB8UDU2oZU27DNCTDHz03qLBexm?=
 =?us-ascii?Q?CGe8yyJcED4WQ2XkyakTijlbb8Jxr/eIM7gD7/HoMGV4r61NNolZSBB2ebAM?=
 =?us-ascii?Q?Y1f31ENwchnPSbQaQYpyhc5Sia/e5qPqr+KvduYmo7vUeuwODNfl3twwhV9p?=
 =?us-ascii?Q?ndwJSHa+DA2n1DHnU1BYzkjI9S5HSwEyr/zzMgngIRmnrel7G4FnsO2t44h0?=
 =?us-ascii?Q?9v9sTcJGX4sUqFqB2yH50GQ1AjCyNhXSOxBu1cL2dMGDIJ0ms0H473DO1ELH?=
 =?us-ascii?Q?+lkD?=
X-OriginatorOrg: spinetix.com
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2021 18:40:22.0120
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5f4034fa-ed2d-4840-a93f-acb1e9633b93
X-MS-Exchange-CrossTenant-Network-Message-Id: a0dfda24-1556-4494-b98a-08d8b33bb0a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mffGQ9RU+K2jELk7aOb7PLSkRm12jfYOtJ8b6Atqzaomy4/OlbisruiU0Gg1LagfOh5qgSvLv06cQ1XZh7BIaV82Hf6zCGiC9oouMdLA41w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR01MB6677
Content-Type: text/plain

Dependency of gupnp 1.2.3

Signed-off-by: Diego Santa Cruz <Diego.SantaCruz@spinetix.com>
---
 .../gupnp/{gssdp_1.2.2.bb => gssdp_1.2.3.bb}                  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-multimedia/recipes-connectivity/gupnp/{gssdp_1.2.2.bb => gssdp_1.2.3.bb} (83%)

diff --git a/meta-multimedia/recipes-connectivity/gupnp/gssdp_1.2.2.bb b/meta-multimedia/recipes-connectivity/gupnp/gssdp_1.2.3.bb
similarity index 83%
rename from meta-multimedia/recipes-connectivity/gupnp/gssdp_1.2.2.bb
rename to meta-multimedia/recipes-connectivity/gupnp/gssdp_1.2.3.bb
index ddaddd209..7d82c3e2e 100644
--- a/meta-multimedia/recipes-connectivity/gupnp/gssdp_1.2.2.bb
+++ b/meta-multimedia/recipes-connectivity/gupnp/gssdp_1.2.3.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
 DEPENDS = "glib-2.0 libsoup-2.4"
 
 SRC_URI = "${GNOME_MIRROR}/${BPN}/1.2/${BPN}-${PV}.tar.xz"
-SRC_URI[md5sum] = "f00a470ebcba96f34def8f83ac5891ed"
-SRC_URI[sha256sum] = "cabb9e3b456b8354a55e23eb0207545d974643cda6d623523470ebbc4188b0a4"
+SRC_URI[md5sum] = "ef3295a965c06ce0f683522391fbb910"
+SRC_URI[sha256sum] = "a263dcb6730e3b3dc4bbbff80cf3fab4cd364021981d419db6dd5a8e148aa7e8"
 
 GTKDOC_MESON_OPTION = 'gtk_doc'
 
-- 
2.18.4

