Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.71])
 by mx.groups.io with SMTP id smtpd.web09.11967.1609956219729095706
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Jan 2021 10:03:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@spinetix.com header.s=selector2 header.b=e7ijfvXp;
 spf=pass (domain: spinetix.com, ip: 40.107.15.71, mailfrom: diego.santacruz@spinetix.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XO1rMVGYsMQDgclBzD43r6b0k+NBnhlIU2GpehS6dNu0wMe6mEF91fEs9Kep2q054QMIkytCVUzbQvsERzk/t/GB7exnklC076e8P7X8phetwjpKjtYLj437v25Nf7cL8k1Ots5x96MpeW/G92cuPQRxFYyedf8PnErelBO8zyZIuzGTn2A7As2CuCW8/Crl3KGrv+UH7UPTFho7865Wsx0q5XXdl6NjDalANjihCdEoKdkNCy+blLLvGiseQGddwQmUaxYG+niFxtKUabrPZ50m9m2LJR3ns8k3fPqf5ashGGEGg0dPZMD8ydlZpdekRuVWHMVcVgdjZsKMmFL5lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ec0+/4BuSSU7xciuc148ZqBxTNxH6REDr3NTRaTmNpQ=;
 b=DaSjBj9MyvvxZKaH9u+hax5NNA1XhX9au7rsy+1kKAZ8c3SYIpKEBqseal3vTG9laHXsX60GWITUr74QeXOxqFovxba8QHD9/g9a7GAwVAG7OCwFHIQ6IfgaLJMJes5mRirYn92HkqPXEnju3ad+Eu5DYbWmchRyQwpdy0J9JvuUfdOhzWH4SeD5XgD5udgUt/iGHey314Smw9R61MNuedhjrTkAGeBHYQuZA7v8Mejg2DjktqY4CYbSbaPxswvTXZ0nEqsaqmrPorQf4zlnXgA1lQxZscjbX6F+U7+i50Oz+JrHaIO62w/tCVAHt4yj9y/YDdZ7qQrTZ2C3UylbdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=spinetix.com; dmarc=pass action=none header.from=spinetix.com;
 dkim=pass header.d=spinetix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=spinetix.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ec0+/4BuSSU7xciuc148ZqBxTNxH6REDr3NTRaTmNpQ=;
 b=e7ijfvXpN/BHlNHY82jrrm2SWoPBNjEgSKPhWGUVKCYiCvzBp6xCAvC4Y15+nhOjgU4jhWysDQYoZkzXofE09nSXGFnJewHMFeE7YRZPxgSV/VOTrg5tRgB1lv0NinfNn5L//WdK9IjW04bOPFLu4MWqGBvr3yPBk7N+wjEhvtc=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=spinetix.com;
Received: from DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
 (2603:10a6:6:e::19) by DB8PR01MB5674.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:10a::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.19; Wed, 6 Jan
 2021 18:03:37 +0000
Received: from DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
 ([fe80::c880:793c:c5b1:c7a8]) by
 DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
 ([fe80::c880:793c:c5b1:c7a8%5]) with mapi id 15.20.3742.006; Wed, 6 Jan 2021
 18:03:35 +0000
From: "Diego Santa Cruz" <diego.santacruz@spinetix.com>
To: openembedded-devel@lists.openembedded.org
Cc: Diego Santa Cruz <Diego.SantaCruz@spinetix.com>
Subject: [meta-multimedia][PATCH 1/2] gssdp: Upgrade to 1.2.2 -> 1.2.3
Date: Wed,  6 Jan 2021 18:59:41 +0100
Message-Id: <20210106175942.18488-1-Diego.SantaCruz@spinetix.com>
X-Mailer: git-send-email 2.18.4
X-Originating-IP: [46.14.255.78]
X-ClientProxiedBy: ZR0P278CA0103.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:23::18) To DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
 (2603:10a6:6:e::19)
Return-Path: Diego.SantaCruz@spinetix.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from prefix.spinetix.local (46.14.255.78) by ZR0P278CA0103.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:23::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend Transport; Wed, 6 Jan 2021 18:03:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 258611be-435d-4859-f01a-08d8b26d632d
X-MS-TrafficTypeDiagnostic: DB8PR01MB5674:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DB8PR01MB567441C686BBB186ECDC0AAC88D00@DB8PR01MB5674.eurprd01.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:462;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	deR1zoU8hG12pIR8GA3+HlP8t8u6Vsdh5kXRQnGYXjj53roWVEC8z7EklsnhcpjXNK3jgBSdvktjexuV1vFzhnQAku/8v4TNwUu4YEIX+vGp3JtBS40JdjIPrAes3m5iLBRHGHZVcotxRc/GbhAOkXzKBR1pyzjTQm/wTX4NaviaGnQkQhpGkR5xJ8jbYKpxBHlfZYNLner4e9JPNJ1dSNYvBpBYGhM1HMNnv0Y7zB3r4kqpQ3nVbU5SqCk0jQJ8/uvwVvwSz+UuDUfmV/CgUZIJ7p6h74yq/hh/25nFjJBJN+o/f7Fpop/9ldYSmYFU4ZtLWf0ttuJ12e9uFQFcFxxcc6dOPbjkkMpzfaa4fsQmrVVwcZqAp2V3NP+Axh1CkMc+5ahs9taMhaOlU3gTdA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0102MB2630.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(346002)(39830400003)(376002)(396003)(8676002)(6486002)(316002)(86362001)(83380400001)(6506007)(52116002)(66946007)(6666004)(66476007)(5660300002)(1076003)(107886003)(2906002)(66556008)(4326008)(956004)(36756003)(8936002)(2616005)(478600001)(6916009)(26005)(16526019)(186003)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?igV6l8QK7xA5QadmPvp9ePNpForx5yYP5zj1uPG9O3eE3jE7MzbCFMdrewSY?=
 =?us-ascii?Q?fImrAisMMYrehiE6uOusDUD0mXSOFnBLBQWGDuSeA+WLkRKpN+KyRs3XTzX1?=
 =?us-ascii?Q?95UdLtRZhuQj4aR2WUYMvSXGf3Z0K3QsGFfSjMQP6RV4idBo83FtWUAwirQz?=
 =?us-ascii?Q?C2iDxVskEvDFr58E0SEYe1um9mCQW7x7uH0kK65j/ThXYyUwEzSSyYBXRPxm?=
 =?us-ascii?Q?fVZbkL4CllqrJpphYp04Jac9/dhiIXsksLWWp6YouTYG4UZyw19K1O1YZCiT?=
 =?us-ascii?Q?/SBvzdslu+W0GYgmAWojvDyrpSlKtJxg/XYet9CCEUY0bnEfJ/Z8kQU142yy?=
 =?us-ascii?Q?ctRZUmyQSvbh0yRZvGRuPZ8InYfYPjAVZqlRygHIDEnQCv8C/UzMOhDUjW8G?=
 =?us-ascii?Q?9I2FfVNBa6DWPNQNxqYkeEekX5bX0nsCZ3f1X8sIJQ7BL6PXaT9eecGMrHPc?=
 =?us-ascii?Q?PPBy5QiOiTe0jCg94Ffoc4i9gPBJ21wgUDSv7CJeYOPVUu1cTqqAFIy/p5/g?=
 =?us-ascii?Q?LJAMdLcHlB9GRdNcedY1x04drKYGhUGqmJbN15Mf/v9Xeoj/P0eC+DBEq8vF?=
 =?us-ascii?Q?8Rnsza9R/WR6r6vYD6uRfT4KPdmUT+6NSiWOblsEJYDTQ4byLOdtPz0ovSwo?=
 =?us-ascii?Q?djGC+cT1Cp+BduiBbqQD7uFBhR2v82x511FhJoWHwVjtrj+jMEVfWYuWkARO?=
 =?us-ascii?Q?yifVD7U0klNstq18EGLJTba8pP5qg8tx1fAlKbrehWEbfvGCSD15ZOD26yjX?=
 =?us-ascii?Q?EIq2oaYQFpJEfBQ2+g0RlodZQxkM+85vKsiONnFZ5TCG0krS0s31zchn9sdw?=
 =?us-ascii?Q?uxtCmD61P4FCc+qIDvQ/tSxtrs73LcG4Z/9Dbpa/95LJbSdghsJ+fOY3QGbY?=
 =?us-ascii?Q?jT+qkM0migzQOG8XMuNvBn2kop+Cf8ORYR09Yl9pszCFaBSKKJ1YUu2tBnOJ?=
 =?us-ascii?Q?4FSbue0e1QWizLaZbB2oLnxK/bl7TLL/i25ikB9hfkiDWFqAjyU9qN4mKahC?=
 =?us-ascii?Q?OSJX?=
X-OriginatorOrg: spinetix.com
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2021 18:03:35.7260
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5f4034fa-ed2d-4840-a93f-acb1e9633b93
X-MS-Exchange-CrossTenant-Network-Message-Id: 258611be-435d-4859-f01a-08d8b26d632d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ez3s8Xl8xQwVmsHweJeOwGX40AKSsK1uQP4y+W49sN8TKZW9P5xSKRmZMmrBlo/tarMq4YS8CRpgpPRR82+ZbM2QIWrQpQt1uxRk86BcP6U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR01MB5674
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

