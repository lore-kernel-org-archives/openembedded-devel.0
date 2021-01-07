Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.81])
 by mx.groups.io with SMTP id smtpd.web08.951.1610044703561603688
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Jan 2021 10:38:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@spinetix.com header.s=selector2 header.b=z8rmi2JW;
 spf=pass (domain: spinetix.com, ip: 40.107.15.81, mailfrom: diego.santacruz@spinetix.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rkn0OlWmed9emXxNKOihygGmsJokiOY+eZr1CtvVcNU9dMUiJ09QaoihfWEQoc0+TKg7mGXuxfql8+GCSuw9mO84dQ3/DSx0zVxFeH15TSDo2/F3AH7pEV4bUGvKGxzndVBjm1X4t9Vfn6+rJJ8cU5cWO6Lk0AiPzMmvD0I2hRb9js4Snp9BJpcXMQh+r0PUZ5Ah+FSa5VvmKC1b7MkhyczWHThntpIYUTjTd+Zw1q30I+grFxfNajEuTxpVV0TNdFv9nYijUiRr2jAHqwEFVkyHJaXBUZnSjEnZ5HPSBX2E2gv4uJHHxC//09v7gGwUPIpSDyNg5fRj5ATIFuRlpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ec0+/4BuSSU7xciuc148ZqBxTNxH6REDr3NTRaTmNpQ=;
 b=lNEomLB5/yvDOXP/X6PLA/NKG5+2G6P/d1AEmPXqFchBG+VbO4pODpQUaIdRbe9/vzdcgthceUWYVeWCPYZgVp7LeeoqQ4BnYX9/SGdBsij5IHa83XBfUXnKANLC81JMiVZrd7+2cDUGh8wgduP5LFeMM41u9EFHvpz8Btihm/qTDkHbbZNf/orVb7QtbhBtdvyp6L0/iXKiiSoQy3+HNlSmDD+xe3Em6DA6n86GUjlwR0XBrRcXVGEhslgeReWBEDCFjaj2xkfWNH4JHO80UAYNQPEx9a7zFY0vqpZlZaisWEu0luO3ydeGzAL59wZRdJx4b/i3Y31CmWe5iroqWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=spinetix.com; dmarc=pass action=none header.from=spinetix.com;
 dkim=pass header.d=spinetix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=spinetix.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ec0+/4BuSSU7xciuc148ZqBxTNxH6REDr3NTRaTmNpQ=;
 b=z8rmi2JW5ACI3CVjcD+AzhrbEqV6Q1Ju/B2pMq4Yupge57CubMiwGvt9KYI86D+z+Fy9ZZd5RtH5mwNxZnf/YI5V2MtLpucV87ehNWdBVD5eaQOpEACG6F1VQWly0Zr4rzofAsMMJL51JxiNYH5u5rz+imtjEDcU5kdE8KGtkZg=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=spinetix.com;
Received: from DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
 (2603:10a6:6:e::19) by DB6PR0101MB2166.eurprd01.prod.exchangelabs.com
 (2603:10a6:4:45::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Thu, 7 Jan
 2021 18:38:21 +0000
Received: from DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
 ([fe80::c880:793c:c5b1:c7a8]) by
 DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
 ([fe80::c880:793c:c5b1:c7a8%5]) with mapi id 15.20.3742.006; Thu, 7 Jan 2021
 18:38:21 +0000
From: "Diego Santa Cruz" <diego.santacruz@spinetix.com>
To: openembedded-devel@lists.openembedded.org
Cc: Diego Santa Cruz <Diego.SantaCruz@spinetix.com>
Subject: [gatesgarth][meta-multimedia][PATCH 1/2] gssdp: Upgrade to 1.2.2 -> 1.2.3
Date: Thu,  7 Jan 2021 19:37:42 +0100
Message-Id: <20210107183743.28823-1-Diego.SantaCruz@spinetix.com>
X-Mailer: git-send-email 2.18.4
X-Originating-IP: [46.14.255.78]
X-ClientProxiedBy: ZR0P278CA0021.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1c::8) To DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
 (2603:10a6:6:e::19)
Return-Path: Diego.SantaCruz@spinetix.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from prefix.spinetix.local (46.14.255.78) by ZR0P278CA0021.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:1c::8) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend Transport; Thu, 7 Jan 2021 18:38:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2f17a5ad-031a-4c31-5a0d-08d8b33b6880
X-MS-TrafficTypeDiagnostic: DB6PR0101MB2166:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DB6PR0101MB2166F80209FEEAB8D98BF3F788AF0@DB6PR0101MB2166.eurprd01.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:462;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	YBwEyh8RSAWB5fMFEMuPYlyiuCx//QBB0ZjpBqS9G8CawDbvFyRKniCRq8oEkFxSZzxE5XZfOLQdsAL8WZNhM7VQJv7MVhnHTeG5wg6Emee4VhnG6I1KN0JJgN2jCvKC++8eV36MlzPnj1k25IRmoMYiL8Kmd8aI2Oigo5xpk/4QInIe24g8U258TZqaETZC+CludSutvYKDjC4YW2SVx/ddbzztlrsliqZqBKZplO0Qz8RM5mnPc6i0pK1Ef6Iq86crpxJMuc0Evdv0gCG3mDtX2oJyC1YdzFcq5d9wgFF2jlJ2vDbZQx2+IWZs4wL6wV5dRtu2+rmCkwMQ1YarTtlpllFuVcBW1QJY0glfNgRYnovh4qOlCgvWRK3DvII8PxQYvVQFOnN1nsWhf+8iZg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0102MB2630.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(39830400003)(136003)(346002)(376002)(6506007)(4326008)(6666004)(186003)(16526019)(478600001)(26005)(1076003)(107886003)(86362001)(5660300002)(6916009)(66476007)(6512007)(66556008)(66946007)(83380400001)(316002)(36756003)(8676002)(2906002)(8936002)(52116002)(2616005)(956004)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?h/jj6wq++crRVC666bIki8MbZ9tUpQxetNKnZQJXRYCQph50PyWYI3qN97m+?=
 =?us-ascii?Q?S2f8nJCFGJ3DtABJjG+7Q7TY3rEZ+vMRsGZ6/iHorIttimsc80nnws7TqAz/?=
 =?us-ascii?Q?Q762gTNb2nPA/m4pIJU1r+MiobBLvVUYMe9WJZyVo9g5jgMsImWARpZN1Ewu?=
 =?us-ascii?Q?bPFT5JkHhIc8dNjjk3tBFSXGcKohuaIXER+jPwCZo4mmr/QlQiuOHgn6ngZo?=
 =?us-ascii?Q?DtcM+nqi+lv+w8dz9wPqjsznUOXlmP/xxU2J5Jo22bEry78fPriD2MmY4+xz?=
 =?us-ascii?Q?kosCo3BuO1mjURGu0AAi9OpCVnfBicKDe+YjCCHzSpZuuEivr7K5iqbESJnN?=
 =?us-ascii?Q?oizpbkgxU/64WamXRyeMgqfk9XKBwRswTi+M3Vfk3gPft9imMFCziMhPR3MR?=
 =?us-ascii?Q?RogR2C+mtLpkzwrmpWyQuFr0xJ6Q+d1eboijSYiUNvTcRQgA6dghGFIfNB08?=
 =?us-ascii?Q?rMd8GyQHHF1rHYI0R194owjarxmIDBTZHKa3O1VOCpZyGSBwpjSWPQjqCmxU?=
 =?us-ascii?Q?7KxKla8RAHcHGSePxbpdCJ5KXFIzF3ACdri7WSTIddFeX8crcMtFvEaATR0h?=
 =?us-ascii?Q?pLEu0ly5fGh9MfVYeDVRtaYzP8Oyvd7ULJ68iUbucKZkOosj2Ghst84374yX?=
 =?us-ascii?Q?GQsxo7EUSLzBklf2nrBr7MEQL8OBNEv2qltSocCPtsx63rGogAqYIrTeLQ3g?=
 =?us-ascii?Q?vUPA9wjrMmBYjb2Rli7heKsyRT+vViwbwB3WaKZjlwIBCS3uABP6h/1pA+kW?=
 =?us-ascii?Q?PEeMgxAwq/Xc9Y+SJ3B2WHwYyHgAQ1E5okiHoCwHUJcm8xa4tPjGW/sHqku8?=
 =?us-ascii?Q?jtPmQmyHR/vdXiuh3ph6b98qV6KVOmAbq+JW6AgKA79lHsLCfl+nuUYiXyaW?=
 =?us-ascii?Q?Z3AK5007aisE8CnebznaMSLJ6xxYHY5d9+d4Md6HsFmB/Kmn/JJaRM5ryad4?=
 =?us-ascii?Q?PEwdcIYyRmHfv1PoF/xTeP+170bK+r7yN1UX5CWE2OOCda4W3fwIQOgQVOBH?=
 =?us-ascii?Q?QkcV?=
X-OriginatorOrg: spinetix.com
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2021 18:38:20.8201
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5f4034fa-ed2d-4840-a93f-acb1e9633b93
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f17a5ad-031a-4c31-5a0d-08d8b33b6880
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FT/L152O3E/5i14pkV35emuWXB6nR/L8jBfvDUQKla+VSUcf8RYhWdCSAWSAPVJ1M0fWRQHmXa1V7lhvpzEdTqdKF6mVJOrUaM5YdIKZ/1k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0101MB2166
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

