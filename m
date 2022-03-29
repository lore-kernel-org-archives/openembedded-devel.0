Return-Path: <potin.lai@quantatw.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B061AC433EF
	for <webhook@archiver.kernel.org>; Tue, 29 Mar 2022 02:49:19 +0000 (UTC)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (APC01-TYZ-obe.outbound.protection.outlook.com [40.107.117.126])
 by mx.groups.io with SMTP id smtpd.web11.2203.1648522157612197583
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Mar 2022 19:49:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@quantacorp.onmicrosoft.com
 header.s=selector2-quantacorp-onmicrosoft-com header.b=ck5nnuOR;
 spf=pass (domain: quantatw.com, ip: 40.107.117.126,
 mailfrom: potin.lai@quantatw.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HX8RDEvEqw5GdCR8H28t/28Y6h7kIRuqQxkG4Q1V77NJ9ZX+87OYkZajyFr6/6Jy/n6bVygHnUU7+9vpmO1G9BCBz2bfsAKY5S8idutvmbVjyPVKRxMknoMVujGMZcLNRNX8BZrVl97i91WRXCGPeyQdafOn0JmCCEbPvsbxfzFr0GYVxVYz6hO1eqVfY0XTMRKPMpP9Ep4m8EWQlHMvPzdEzxmsm5uSq3dBqYUvbPx1O5sUrwQkiVO2WlTuEuY4sDnZ5mowO3rzQAC6DcnNNiA0SUoT9OVkn71KM0lEdKx9rSlJSQaAt+LNVE0lqNdjMUkZcOWL82W/oI7W+/zS+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SiRnQ7Owpq4e5E/Sbx69Xsq6fVpm6+IUyQ664JKocrc=;
 b=ZqIYeCaSBf2cw4HPt6UUftx2QVjK9UzcKe79vbuWyUMM3SpHS9ut5jNEGowcLhHXpFm0fC6IfDO4td2l/336Is3Cfq8gJtR9VWLlGU0sPTCAITeE1gRYWOw9ItZl48Dx0VrNVyFgkc3bOM3aueuY0Y8nvgSB6Grd85eddQ41ZNDx+NWlO05M6dZRosMgUuxSg+qZD21nvQMZmVjEb4YO/FHaCqCaxu4nWFNKKmRPsj+SIt1OJPMYTbDWBFy6RRmktiA3aV71WqbErs5APZGgVIgAwJsufKa4S60GXioleDw1F9lA05VvzwH6Z6/k1561+L56NAWkr4gsNXrF0td+pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quantatw.com; dmarc=pass action=none header.from=quantatw.com;
 dkim=pass header.d=quantatw.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SiRnQ7Owpq4e5E/Sbx69Xsq6fVpm6+IUyQ664JKocrc=;
 b=ck5nnuOR4adVWWDNer8ZbRcxcSLROm8pYMkLDQz5dtkPLlAknSQJZWnbpQzUhH057HJZ73a/9AgIb/1b7jxqIZoHxlte8lELYfcofeE7K/y6v5ev1N26ZFykyaJyAfN6FllhClre9Nfb4sRh9kaay5PVoD4j8ifQm0kZyeAzxcE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quantatw.com;
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com (2603:1096:203:89::17)
 by SG2PR04MB2395.apcprd04.prod.outlook.com (2603:1096:4:6::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5102.22; Tue, 29 Mar 2022 02:49:13 +0000
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::7cfe:c9ba:7793:f42]) by HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::7cfe:c9ba:7793:f42%7]) with mapi id 15.20.5102.023; Tue, 29 Mar 2022
 02:49:13 +0000
From: Potin Lai <potin.lai@quantatw.com>
To: openembedded-devel@lists.openembedded.org
Cc: Potin Lai <potin.lai@quantatw.com>
Subject: [meta-oe][PATCH 0/3] add idevicerestore support
Date: Tue, 29 Mar 2022 10:48:53 +0800
Message-Id: <20220329024856.27349-1-potin.lai@quantatw.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0136.apcprd02.prod.outlook.com
 (2603:1096:202:16::20) To HK0PR04MB3282.apcprd04.prod.outlook.com
 (2603:1096:203:89::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: afa735aa-11a7-425b-1e13-08da112eb517
X-MS-TrafficTypeDiagnostic: SG2PR04MB2395:EE_
X-Microsoft-Antispam-PRVS: 
	<SG2PR04MB23958A71FB9643791E31967C8E1E9@SG2PR04MB2395.apcprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	KGUZdqjjw2MmV25ql7ZFnrV5mp05Pj5/rJpGxlHOzAi3F9mjr5g/7y4GWiQ60z0psYOHdXFDz9sAMzzEU2fUi+R7EezI4EYa3YdP6WCxhznonBFZV/0hc76xZ1scfyKLbFcAHTBKAy2B+aUdDp9MtRtT5JW9RX08F0fWvM0QYjIDGQHIyDd7RhCvjj+G2Y6boCYDT89OOFgQLhSYS8ftaNxZoNPu/ojvyRiUSHYT2FqEwJ02ZUhymgUbKplTLN1qrIy214U+NaWG7PCV6KrJSLQwK2HrrRLycDiU0tTB2xfUozu1KPN2iKfdFrBJbp+PVrUrYCEniWXy/62zbjTFiGib7gvQo0og00h8bMwOgn4JAQ1cPUL9/v8xVtvGfXGJWBwoeFUBeJAE66i13pZ/VypHwxWtT3ulb9Q6Mvbkd9nHN9nGwVrQBaINUW9gFQ1licZ0XfNQnoStNLuqEmHjcX3sX0zZn2MPuiTGoSUCkxTT7gRNpUqj5Qy3oxx73uVjdNwk2L1gOSeJ15KvZEMu2eNZDPf7GIZLx9tM1E+05zWH2s9XujW/XSrD1BlZr4iXbAqiU237SlJ/wNTmks5731EOG3we6O8RM6Wfl0PSro8XLYUk2+C2p3KfMIPsmyabHawOev1lx/S4V+9sUvukQ7mnumiyPgJPXl6kmpAnZezPIuHvzoYpv0+QttA23tWJ6frqDJd0G7WjC4NrnNEySQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HK0PR04MB3282.apcprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6916009)(66556008)(316002)(186003)(508600001)(26005)(66946007)(107886003)(52116002)(66476007)(2906002)(8936002)(83380400001)(86362001)(6486002)(4744005)(5660300002)(1076003)(44832011)(2616005)(38350700002)(36756003)(38100700002)(6666004)(4326008)(6506007)(6512007)(8676002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?DY5j1xOwl6SqxnzQ3lPG169/HPzKPEY5oRHsOiTPlbIswyTMLheiySGiEg0A?=
 =?us-ascii?Q?nvVVaUsOsBuBgW8X2OjvYFTZC67fy4T39irabA2wwrKLaiea7QEBYE4MXwLb?=
 =?us-ascii?Q?DQ4DEEsnlAIwrETRcquRVBbsRjjdyfBMH975zQdYDs0FjytLAV6mYZA2RMqE?=
 =?us-ascii?Q?WRLC3tT5FamLES1P0i7Hxb9bm3C6kQPBpqoHvYpIemkyo591wUCvW+/lH9PF?=
 =?us-ascii?Q?Y2sFjhQ3N5+KhFPKKlCwYv+TnywACd/B2lGH84IfeMjXtfECDSj730JKOWEs?=
 =?us-ascii?Q?b3Bwyx1R7Ni+sMcTOEZz/jto0zJPcWYsmRTt6zSyr2RdRw3MtvjIwNmD1YGl?=
 =?us-ascii?Q?rucZxgZeAaT15UmBLhrZoLqBx2sXXDldhrT5kcM4B4rAMWg02vlfZYyPBaQ1?=
 =?us-ascii?Q?sMlPqg1QvEiSuS6ZbbY1ZPo8JMWu+J2DESJJCeWSredIPgbdWDdq/YiQYbmS?=
 =?us-ascii?Q?nvBPiuOXJhg+nsZBT6Hl0h2aENbVctb5KQvyQQARVdaKmLoXnfzeQUtM2JDW?=
 =?us-ascii?Q?RehJe9qXUh6FHDcTSg7iXR+eQCWlT6BlkUzOZslQ1iud7qmS7KLzhp/G/7DR?=
 =?us-ascii?Q?U2pOCibcyxDCxO6j2LsmmaGw2W2HSEFLrHD9dsoi/J3snmELRFwAxY9TWtim?=
 =?us-ascii?Q?p0FD+DVn58QxeEpZRsliczIhPiOYUtQyKnREdinmf6qAGoWRn1Ejzvu1ZTu8?=
 =?us-ascii?Q?+Vv71S/jozcGZ9cgl5oYqgdAE6MTSeIteSv1Z1WZCT3JEu5dkN0V9uR6IJ6y?=
 =?us-ascii?Q?irCFvrZJzpQibzho0kxGWAfPvuyX+TNrS0YYAvmJDXbfkOcCxQKgAdhT3YRY?=
 =?us-ascii?Q?rf2KEjhqpL1g25zlkwZlW9tfbBuLBJoQNLGXNRmdjxBQWALLABucUjhBAUBh?=
 =?us-ascii?Q?xX5/ZRUi+IHv8AQlGhZMY1SKUPyVrQVxU0a6zvEG4pHp+JtrADrXqwGZcMuz?=
 =?us-ascii?Q?90IgVYeysu70uad0UmjHZ9zRS2EApCmv+sVlCSC80JdGh8AAfxPam6HjXk1Q?=
 =?us-ascii?Q?f5F1WiRJk4ifESg3C5kvvyX/t3FQ/K8ox9mCaKLv47bmmNusvpsG/RNjH9ii?=
 =?us-ascii?Q?OHId7Isr78w1GL8m+FZ54qeTAal9Px+tmJAAMBjVnn3FHrD51F/X2OxlojWA?=
 =?us-ascii?Q?wu/ULSrPklKirJadU8SxtNEEhSsaE32wyYfGb8Tvku/4GkKgUA2p0MFAexaK?=
 =?us-ascii?Q?JVe+keBTCDAXJPUbOqPDqPMUJ/aSyBHDIIG6Tz/3aadvjA41EwuzA5XPi6Bo?=
 =?us-ascii?Q?9eejoa1gsKQWG6c7T2yVVrxYQXSQUMBDX4aSlTtw13t3KbLT1wzsqr3BYjoV?=
 =?us-ascii?Q?ZW8t0zoSni8rdn2huWSNuobqi10yKuhPrl7b8RZWL9e/DC4b9PqxkLtprnkT?=
 =?us-ascii?Q?6PSHhx+Q50ImnkyRtqTSwbrNGHhSq9pJr7yxL5UTS2l9nCVHOXfi/ZXL6H8G?=
 =?us-ascii?Q?rrUcfw4aDWnwfoMvxJY5mMP28z+Q7mtO5YkTg/Nj9ZXjjg91WG607VmeayEJ?=
 =?us-ascii?Q?KKQ5FtbHjNo6QsMr65WyFl6buFkjpz+JzT+sXeLq7xght1xiWxAGhs2WaHRl?=
 =?us-ascii?Q?VWoXRtvqkXaFH29ecLSU7blTGwzQzbOmTRslmoFjaZhDzB9Y29gh9b6ETL4t?=
 =?us-ascii?Q?eKpwhk1xg16FDmUQO2Tm2RrAmkHjYGrxejCc3JW7o5zt38HdDNM9VQd+8Dab?=
 =?us-ascii?Q?VKwV5ZHHaSVIZI9GgCNcpD4hDL70a1WkPU6tf4NTJSNvNfnhCtjEPgyyE4oh?=
 =?us-ascii?Q?MFJk8FV/O8aq5FFpnVzIpbCVMntv5Ag=3D?=
X-OriginatorOrg: quantatw.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 afa735aa-11a7-425b-1e13-08da112eb517
X-MS-Exchange-CrossTenant-AuthSource: HK0PR04MB3282.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2022 02:49:13.1799
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Aqezlf/TbMCrXmbAcvEhiEAVwe6CEbrMjjVmlJBzRG4fXOosA5K3sKEUzZXfdRKdsfoTm5j5bfSN0FbxK9+tQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR04MB2395
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Mar 2022 02:49:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96247

This patch series adds idevicerestore package and dependent libraries.

Potin Lai (3):
  libimobiledevice-glue: add recipe
  libirecovery: add recipe
  idevicerestore: add recipe

 .../libimobiledevice-glue_git.bb                  | 15 +++++++++++++++
 .../libirecovery/libirecovery_git.bb              | 15 +++++++++++++++
 .../idevicerestore/idevicerestore_git.bb          | 15 +++++++++++++++
 3 files changed, 45 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/libimobiledevice-glue/libimobiledevice-glue_git.bb
 create mode 100644 meta-oe/recipes-connectivity/libirecovery/libirecovery_git.bb
 create mode 100644 meta-oe/recipes-support/idevicerestore/idevicerestore_git.bb

-- 
2.17.1


