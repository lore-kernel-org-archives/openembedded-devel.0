Received: from EUR03-VE1-obe.outbound.protection.outlook.com (EUR03-VE1-obe.outbound.protection.outlook.com [40.107.5.70])
 by mx.groups.io with SMTP id smtpd.web10.955.1610044713802248329
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Jan 2021 10:38:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@spinetix.com header.s=selector2 header.b=a2Wkt+RN;
 spf=pass (domain: spinetix.com, ip: 40.107.5.70, mailfrom: diego.santacruz@spinetix.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fmZcniuSehsT9/UUqOEpVUS5fdapjBhgADm5tj+QxdqEBebdiOZ3wqGJ288N9AWn4VqrYIhvep05GxenZwiebd1M0+pkZQpidRIeTN8+S7GVG5KRA/cSWKu+FC0ejzRlCkXL6Pvv2UXwRgZ54AwKMJem7hZfvo1pcw20skNpOFxRTMzoHwy+6qzdnhnh9xA66E8hvqQkfWYRdQpXxiIQMyR2ndw02cMiskzXg9xHDEdbSVcYuXcRP5Ht50eoLIFcS3Ltg3Xq1r5i+n786En9x7OJ/JfHIOvZtFOphqTPDFISc4+ihd3xJo3XCl3e+yQZwzA0AVS5Yv/phn5FH5KizA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bkxOT03NsYbIfgldP43cLNHHkhFek2rAOHtVDgz+RW0=;
 b=mkffopuj+NfG1qbHdOf0Euw1tJ70Y4ZUglHEUtLW+N1HzI/8BW2NGRYbhQOpEdFw2wyo8VtB6tHVA3+X/UCRKX+xP789jgwDxiBzw2GOi43epbGInkMG7MwyW8iQXIIVWCMnPq3GLrKwEu46I5OaytQ3HjUvvpq40zaZB/DD/AnKh65gv/aJZ+1FDaBHc3aLZbTqOwQdVm6UPJlP94r0oVvnKeDvRQVETIP3MyZvLwUCA7N3eyE9yDxfN6I9nbGh/cZARfhAeqnEwh+hkdnyyIms6mP9nZ9ZTcGF0WP9ouom+oymSn0EWg31SqY5ngybU5VGfwGjU5kjYNBwiaPnFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=spinetix.com; dmarc=pass action=none header.from=spinetix.com;
 dkim=pass header.d=spinetix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=spinetix.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bkxOT03NsYbIfgldP43cLNHHkhFek2rAOHtVDgz+RW0=;
 b=a2Wkt+RNGjZHZjEU69X/Dx7Q15hc5UGVWB24d6GiyFmW3j13dSBaayZNmzMS1piUz1rMXF0fGptrVUThArH0zOl98OZDOnnOWmCxGb1gR1ZxLMe031ltThrIcxzDzWX9Nf401NHYddP1MxKMRAqZZZ/Ehf4poaqvMcvgRIVZDx0=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=spinetix.com;
Received: from DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
 (2603:10a6:6:e::19) by DBAPR01MB6677.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:181::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Thu, 7 Jan
 2021 18:38:29 +0000
Received: from DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
 ([fe80::c880:793c:c5b1:c7a8]) by
 DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
 ([fe80::c880:793c:c5b1:c7a8%5]) with mapi id 15.20.3742.006; Thu, 7 Jan 2021
 18:38:29 +0000
From: "Diego Santa Cruz" <diego.santacruz@spinetix.com>
To: openembedded-devel@lists.openembedded.org
Cc: Diego Santa Cruz <Diego.SantaCruz@spinetix.com>
Subject: [gatesgarth][meta-multimedia][PATCH 2/2] gupnp: Upgrade to 1.2.2 -> 1.2.4
Date: Thu,  7 Jan 2021 19:37:43 +0100
Message-Id: <20210107183743.28823-2-Diego.SantaCruz@spinetix.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20210107183743.28823-1-Diego.SantaCruz@spinetix.com>
References: <20210107183743.28823-1-Diego.SantaCruz@spinetix.com>
X-Originating-IP: [46.14.255.78]
X-ClientProxiedBy: ZR0P278CA0021.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1c::8) To DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
 (2603:10a6:6:e::19)
Return-Path: Diego.SantaCruz@spinetix.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from prefix.spinetix.local (46.14.255.78) by ZR0P278CA0021.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:1c::8) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend Transport; Thu, 7 Jan 2021 18:38:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2ba54137-32ec-49b8-1771-08d8b33b6da6
X-MS-TrafficTypeDiagnostic: DBAPR01MB6677:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DBAPR01MB667736C226396AF581DAB03988AF0@DBAPR01MB6677.eurprd01.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1923;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	2Pvg/04wI9OyjTEpJOhUZ1cPTfca3CgYqWoz7laeo/xjDgO6Edhjyj6HZLCz4gyniu2v3HVVV0tBn27ZG22Gt+3vf3tyA8k7jfMu87FcgjZsnEvDDzl8w4UylmLxKEgDdGlB12VzOCaa7X1CV2yoOXLnhyyW7IKoFfmO8I0DXjpYc1B0mLMYR2ryE3Okxgm1xA4gSYQ4cDvEJqLWJCTx3HN0BwQd/rVpSLs8yaSnO3gmXNFT0Gz9343kSrNhsRpDjxJWZQ5LJ6D5dDobgCLIllxWvrNA/3N1xHvScHABv7JKQhD98wBOLYnhr0GFtHQHl1iH4J8CKTTdA4vWPBk3wYK+pgN3F0dc0dlRtKExJTiGKFO6/hPC6cRCMFQrxH3XESwsJNk2SWZAaxVXF13Y3g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0102MB2630.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(39830400003)(136003)(366004)(346002)(8936002)(36756003)(52116002)(956004)(316002)(5660300002)(66476007)(66556008)(66946007)(6666004)(1076003)(478600001)(2906002)(6916009)(8676002)(83380400001)(16526019)(4326008)(6512007)(107886003)(6486002)(186003)(6506007)(86362001)(2616005)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?2fHgET+paKaa4CpuvzZlnyfwEaqAuuocdemcIsWx/JaeNECN89XCEhl/5Kvq?=
 =?us-ascii?Q?qWbJbD94K5FYBdJlbFq2SYTMGV0aPXO10WFwM8XkrujVuYMh3HP6NUgZrhwU?=
 =?us-ascii?Q?l80XmeweJDtMia0MTLcKsLmgh+uFs0vMJAggBcv7XJiD391mmT0j1Qy9Tq3e?=
 =?us-ascii?Q?4dxcYCH9jgdKX2M8yuu+XCmzXGeW4J8PIxalS0YJoxomgIhOQjbxszDGdeEh?=
 =?us-ascii?Q?mSSFAi9bcKoATVMqTIcf4C9tQmUay9wtAVZ1PTWzAfPICuddKsSStQ9t4diR?=
 =?us-ascii?Q?mZpqH4xQZevMag/OKxH8mJRoO8BG81bPMlFnmxkFR63e2cXq+wXLCnnKCR2G?=
 =?us-ascii?Q?jzXJ8kaVR0ThSCIXc02V5topVamNOHSfJ/9N30Ezi6sbzjfNOTdUXn8duJS8?=
 =?us-ascii?Q?HGKP4DCjXa6gYzK0uVH7fxQQtlyD6blWf0cO9lxrXemI0o/FcqSe0/TkyoyZ?=
 =?us-ascii?Q?UR78MbDiYiQyeGIEI40znrJcro/NACsvLwh+ihDiwCc3aArCgPCko0d/WN0w?=
 =?us-ascii?Q?PHaAgR1bUrRH/gxGP7Yy9e66a2bs7IjQ2vbrt73L95rV0uib/Mc8RtAQis5j?=
 =?us-ascii?Q?K/2LA7dVFXg4MANgoWseODv/4xSqXPraqL/xNVyo1qsSJ3DbiFFMQw+YEa/F?=
 =?us-ascii?Q?SoqkWfdMGbZJDSj5Pe9C1m+nQAsvv4LPSBVgR9nAfA3INYMkwwXEVE2pINOW?=
 =?us-ascii?Q?HnxlDk5iPSwy0JXz/homIulHExQy9K28I9eQiwJx9wVvnoUdzmVFuJZ1+UhR?=
 =?us-ascii?Q?8HSVyatFJn9kjrQMS3eFb3vuLnYf7DS5zUytnBtccvoYfxQ1Swuv/ep/afna?=
 =?us-ascii?Q?BuzwFdQ0pN1yqZgW568u5XTd6fKXEMt6Yg1/W5GKI4HOIICnToa+u0mr6E6u?=
 =?us-ascii?Q?llKcYUgZ6sgtghke579adlsAEdTJpNcWlq2HzDx7C0e3gknovH8sQueIK02n?=
 =?us-ascii?Q?ormBaw0mvBVnd5ub7YQAT9p7huHAz4Dazp8oRY9InnJsLmQ/qFcun0NhmVmt?=
 =?us-ascii?Q?jyL8?=
X-OriginatorOrg: spinetix.com
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2021 18:38:29.6309
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5f4034fa-ed2d-4840-a93f-acb1e9633b93
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ba54137-32ec-49b8-1771-08d8b33b6da6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PKgzr/8hOJPOv+IsxJZSYLmkptdfNEjWR1VEXCeKtjuNJ7kGSxx/R5+Uesm872pK5d0e42+G8X2HBMAXAN8XM4Yftlx09Tw2IuwPyjnnthc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR01MB6677
Content-Type: text/plain

gupnp 1.2.3 adds mitigation for CVE-2020-12695 (CallStranger)

Signed-off-by: Diego Santa Cruz <Diego.SantaCruz@spinetix.com>
---
 .../gupnp/{gupnp_1.2.2.bb => gupnp_1.2.4.bb}                  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-multimedia/recipes-connectivity/gupnp/{gupnp_1.2.2.bb => gupnp_1.2.4.bb} (64%)

diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp_1.2.2.bb b/meta-multimedia/recipes-connectivity/gupnp/gupnp_1.2.4.bb
similarity index 64%
rename from meta-multimedia/recipes-connectivity/gupnp/gupnp_1.2.2.bb
rename to meta-multimedia/recipes-connectivity/gupnp/gupnp_1.2.4.bb
index e60349716..c7b330fa0 100644
--- a/meta-multimedia/recipes-connectivity/gupnp/gupnp_1.2.2.bb
+++ b/meta-multimedia/recipes-connectivity/gupnp/gupnp_1.2.4.bb
@@ -1,8 +1,8 @@
 require gupnp.inc
 
 SRC_URI = "${GNOME_MIRROR}/${BPN}/1.2/${BPN}-${PV}.tar.xz"
-SRC_URI[md5sum] = "2ade3d29c624ad98d70113e6e93908a5"
-SRC_URI[sha256sum] = "9a80bd953e5c8772ad26b72f8da01cbe7241a113edd6084903f413ce751c9989"
+SRC_URI[md5sum] = "7c9c7cd80e36d9fb1e5b0267571fc17d"
+SRC_URI[sha256sum] = "f7a0307ea51f5e44d1b832f493dd9045444a3a4e211ef85dfd9aa5dd6eaea7d1"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
                     file://libgupnp/gupnp.h;beginline=1;endline=20;md5=d78a69d9b6e63ee2dc72e7b674d97520"
-- 
2.18.4

