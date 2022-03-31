Return-Path: <potin.lai@quantatw.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30BF2C433FE
	for <webhook@archiver.kernel.org>; Thu, 31 Mar 2022 02:17:09 +0000 (UTC)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (APC01-TYZ-obe.outbound.protection.outlook.com [40.107.117.97])
 by mx.groups.io with SMTP id smtpd.web11.2397.1648693026246624368
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Mar 2022 19:17:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@quantacorp.onmicrosoft.com
 header.s=selector2-quantacorp-onmicrosoft-com header.b=zZe8yy+d;
 spf=pass (domain: quantatw.com, ip: 40.107.117.97,
 mailfrom: potin.lai@quantatw.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mUUPJ4vX2mAna5wgySWKiA4SzUekfcG7j0UTrxZcs/8ObFfzhQ29P1cfdnf7157a+L6vmSEWaxu5kk/Z9avvnxXM7NjTvU6YMJcijIrsMI7gyirhZbl1sfTE2sODQ9ICaDlr1Ed2NwfG981+Uz+Habk+5kLPYJtQd5WYt8g2PJ1widoZQ/UQfmapU8XcNyfo1eJmmXI5sxzglvMEztcfb/ULkKdQmxqDtO/Uv78HUg4szGux4tw0CL0tHpviWUbdiUkPXIRSh6TiJ2MVMP+MJPLLAjlq+kCgH94in6R79F/HJvp8DBnPSZ0EHp5errRzbBKpdYKwdcpqd0aole4Wpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x9rM1tm6PSUt4Ww8AzmfY2wF2cE4fC5AqaaV+eXSdyM=;
 b=Jqn36ONc/1UXvns+4bR6AH91HUcoWtLUf/goOMMBksssE0qUokC4lA0wybqhVM/w3B9iImoCVkBsZx6whITjc43qqoV9DaRYSlunIK0gvrgGYEWeNKZrE76ToGSerUBloiYee6pRMZnmGRsF9gK2YLpc0QY0DA0ZIIZoXQi/BFJmp+u8+WSgBC5j1QmFuCaxmf65/T6OUbK+Sc1QQ20RV3ck2E2bDfuMZ3j1lnM8UO+kEGlmibjmn0+UnS3z+XZamdd+NJBfjsqjQuuYyVuYWiHTuIL2/uiUnOXixFQqshBLTrbK5B4HxwuuAfRfe9nQubBBkmSkQhOCLV6yFLg3jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quantatw.com; dmarc=pass action=none header.from=quantatw.com;
 dkim=pass header.d=quantatw.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x9rM1tm6PSUt4Ww8AzmfY2wF2cE4fC5AqaaV+eXSdyM=;
 b=zZe8yy+dcqk1w+wQ9ghRjzsVM902HKBcL9RiFWUAavMZL6HrbNY/JQ8WZZrZSxsfYsuqSoWrwlVgs+TcL/1wSZXkoX0m6jwA0+K4P35c7MLk26KRHr3huse/pEfRlJmSv0+JIw8IV+Q90uMnOe76ML7uS6ktQ11q9b7L2gkmwZk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quantatw.com;
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com (2603:1096:203:89::17)
 by TY2PR04MB3984.apcprd04.prod.outlook.com (2603:1096:404:8002::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.21; Thu, 31 Mar
 2022 02:17:03 +0000
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::7cfe:c9ba:7793:f42]) by HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::7cfe:c9ba:7793:f42%7]) with mapi id 15.20.5102.023; Thu, 31 Mar 2022
 02:17:03 +0000
From: Potin Lai <potin.lai@quantatw.com>
To: openembedded-devel@lists.openembedded.org,
	raj.khem@gmail.com
Cc: patrick@stwcx.xyz,
	Potin Lai <potin.lai@quantatw.com>
Subject: [meta-oe][PATCH v2 4/4] idevicerestore: add recipe
Date: Thu, 31 Mar 2022 10:16:48 +0800
Message-Id: <20220331021648.16582-5-potin.lai@quantatw.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220331021648.16582-1-potin.lai@quantatw.com>
References: <20220331021648.16582-1-potin.lai@quantatw.com>
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0150.apcprd02.prod.outlook.com
 (2603:1096:202:16::34) To HK0PR04MB3282.apcprd04.prod.outlook.com
 (2603:1096:203:89::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e1062b02-04ea-415a-14fc-08da12bc8b09
X-MS-TrafficTypeDiagnostic: TY2PR04MB3984:EE_
X-Microsoft-Antispam-PRVS: 
	<TY2PR04MB39843DC9CA21B8F51465FDBE8EE19@TY2PR04MB3984.apcprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	tFTqnLBFjmnmrniOj8heE1dyr1qbngg7qItUYDdjtK2IMJnI1ayuFkTI3Islz2yr/Jd63ZWNUy33zQnODxR9ACSrhhPonpvA8Hke4nmdspbBaDvMhYcnvMcWAJDEqMvYIQ7DSo6ctjaoNV8uTS/Z12XQ3IOswIIU/1FavryafdPlObOZzhdrqpcChkv5pMw0xXLIq61XzTI2lBy1gntm58eiEgyf1M7uFsbq5fxLW/5+06pcI+WBWPBIqaNioeCcZF7xERdypGpyVteefLJegZDvqGbGR3F59Nj6cAEPACKhQkYh7qknaBu+UHgK7XQTn9CmKHlkalUDDUpwxnpQqlQGFCLW/jwPtTTZa5nNXMtnRGb55LybZrFdTUEgrx4fe0clQYIJkkBiM08PA0hGoiFStileCbEZ/TcTRVnTw62ZIpOr7wPd//c3q7g5chT0pbiGsSE85B2dLvokXBjGRLlv+Cc62aplLLsoMQKbwApY8J7Zmew0Cpdo4iM0hlEc3w9GLCR0ADNtclQpnPJm0oeGk7G8u16yhIFyzEzW0zi+5b/1sBVguepwAqGp4Uw500n5mUQA1PwV+fgZRUFRA8UvCmYQOVLrVMcUjNcMg3wGZxfKtaggj9CLtEPFV9dvekZ8i0qBZJBnZHkzDH4x//1O5AN7p4Kn85OXJmvmERGrJXN22e1LfgtJZXR4iTwtnTtW/jmWHkH+iLvijvJcv4LNvYEeaq1WorXoPsbadj8AdybDSQ+vf2IlGsOP0+b8AG2SVRE7ssayrwk8o82TNAzJ30VIxVtTB5q+FHja8Vw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HK0PR04MB3282.apcprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2906002)(52116002)(316002)(86362001)(6506007)(6666004)(6512007)(38100700002)(66476007)(38350700002)(2616005)(83380400001)(26005)(4326008)(107886003)(1076003)(186003)(8936002)(44832011)(8676002)(66946007)(5660300002)(66556008)(6486002)(508600001)(36756003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?OYqM94pEVFAArz0P++dVLuFr/NQk0+wh+FXJHBaxV0YFZiU2xKPF+VVRHEZk?=
 =?us-ascii?Q?kSg73RJwD5qnkEGqBu4Iw6/DBJ7kCf9O6cOGQEg+6FHADonXnkhYBVudu8h9?=
 =?us-ascii?Q?sHvi4yA+AJSDWQyvXzjwRg6m2ewLAUTWgut+8SJPelO4SQ04UFvC+6YuTXqo?=
 =?us-ascii?Q?5KvL9SJ6iNI30XwDSUR968q7wRhwXpHS1Dc0vDAeV0Y9RnO1iXBgbSJjXkZR?=
 =?us-ascii?Q?PsvYq/JVXbwf9yMD/U/gUiCVibZBNTn/JXXU86Ns921bht31gFKG9vZVqLek?=
 =?us-ascii?Q?m0U5UJx0yeISm/lzPYxITSwveq7Sn3d7kkhYO5UDD9eTMmInremke5EAWAzD?=
 =?us-ascii?Q?UgNT9kNooSiIX4RhbVS1sRflEUrZMynsmtU2b6XhBBKbgUnnoHXVb/fsQg5S?=
 =?us-ascii?Q?z356c47gAgaajbwwhL1QVb4xmiz8os9sGL0s4F7BB/CnFzqjDg9tYbkoP1RV?=
 =?us-ascii?Q?Z5cxj5J1zF/5dGYHndckUlfHMlXFQQeRlbnuL5D+RTieq37Yyn1nO/AKTYRi?=
 =?us-ascii?Q?q2EhbEBpwMc9vaOsebc2RF1ZZGyiY6/0wTN+MwO91e1pVrAresjC91RrtLHo?=
 =?us-ascii?Q?XhpnKBwvVJakrXrS/BEiwHHQSmAhBcjHwFwHxm2V/0o/DWYzWBZXBoaV21+w?=
 =?us-ascii?Q?jlU7Z7nktvGUPeU9Qb9F3uExPGTsTUaNS5XWGwGluDANMqOiwIW4dGIflp2n?=
 =?us-ascii?Q?l1W7vw56f3QGMaERYGPefidW5iXmEdWAia0c/17EwQ97swTzsFgzd6OF5Tgr?=
 =?us-ascii?Q?9ITjG7PE03LVtWlAtyLquaEE39T4LpS4CT10jn8Z2iBuZwYyO1CVZ9TGcmWm?=
 =?us-ascii?Q?yyBlvWyC/T46jMrd3hrTld8eAsB86yMXSvM8PNixxNa57Et68/bO67B2iW81?=
 =?us-ascii?Q?je+25RN3fvU6OZAjc+644cEUgUfGaSI/kwxtrpsUmowWzXUH41PNW/LJsWlC?=
 =?us-ascii?Q?d8BUPD2TeJ677r4zT4f/QcCvCKmYV36d88SdXD2lpxff/RfM+lgjurtRelap?=
 =?us-ascii?Q?KdJtrdNdrGFZFOud/Bfjorfq4s9+sWcfjM1M7VkC/EBung5oA8cdGF9sFLBX?=
 =?us-ascii?Q?pEP4DGW97YWMUh+udAYn2QoQtc5Ir7PigGLUpMLlQUdi5nismVqdfYkxes/V?=
 =?us-ascii?Q?4enxfur8DrxOUkUBlX/fdccYjQYtHlbzbfqv2sWCBpKOl2ncBbQsd69H/teN?=
 =?us-ascii?Q?IrzA+OWy0WeuiCrsggl8DnOIIagCpW2KFWLv7uWquaQiKe3lWgd4xjkYdq3c?=
 =?us-ascii?Q?JeuDkAcGNDLIjrqiOQsmkBoxZXQmVfjBEbIRM5QmP9REgvRf7a0okmR/3hZW?=
 =?us-ascii?Q?9y99VY55p0lfCvu9iMetpufgJ8kWtjVqscvX9H/xWZuruENCIABvtENS0Jhq?=
 =?us-ascii?Q?x8R5982E6yzsCnaZwbbrsAjJp6dhfIE7ehOHzmPx4xhRIP3zDsL2mNxsHYMy?=
 =?us-ascii?Q?qp0qY3QrJ1+V3jEEVT3hwznXFhLgGKUTlfer961GJEQ6QyY3tm9FXlOp1SgH?=
 =?us-ascii?Q?tGWxRJVSoS64oGy9PTpPii/pOAGTSm0peQeshMykHmnsIYwOKCLuwhKmrrB6?=
 =?us-ascii?Q?kuUJFQcbRY1tPjLmJsJQLbnLUVSHzXGcwuRkTjFVEHnzzri7h9mQomrGn6JM?=
 =?us-ascii?Q?23w+r1cJvwUdJRrC9wCyq7ZVFKB3wz/oxsHePPpZ7DUfxUq+0Xqs8/2JdycD?=
 =?us-ascii?Q?OzayNl+CT03craFQAheGy/B9xORjC0BV6SIcz2UObwzvVFXxo3Y1aEEUmrdg?=
 =?us-ascii?Q?9g/Z5I93sBbLMZQQ192ZUFQzLI84gSQ=3D?=
X-OriginatorOrg: quantatw.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e1062b02-04ea-415a-14fc-08da12bc8b09
X-MS-Exchange-CrossTenant-AuthSource: HK0PR04MB3282.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2022 02:17:02.3844
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 TW30aAvyWe7MyhKasxpB71SmJoUGpFXPz4jObQ0EJVX5JYBPZ6ZkuunzTC861T8URf/plPm/Os/O+IdUOHNOyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR04MB3984
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 31 Mar 2022 02:17:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96279

A command-line application to restore firmware files to iOS devices.

Signed-off-by: Potin Lai <potin.lai@quantatw.com>
---
 .../idevicerestore/idevicerestore_git.bb          | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-oe/recipes-support/idevicerestore/idevicerestore_git.bb

diff --git a/meta-oe/recipes-support/idevicerestore/idevicerestore_git.bb b/meta-oe/recipes-support/idevicerestore/idevicerestore_git.bb
new file mode 100644
index 000000000..8fedb6447
--- /dev/null
+++ b/meta-oe/recipes-support/idevicerestore/idevicerestore_git.bb
@@ -0,0 +1,15 @@
+SUMMARY = "A command-line application to restore firmware files to iOS devices"
+LICENSE = "LGPL-3.0"
+LIC_FILES_CHKSUM = "\
+    file://COPYING;md5=e6a600fd5e1d9cbde2d983680233ad02 \
+"
+
+HOMEPAGE = "http://www.libimobiledevice.org/"
+
+DEPENDS = "libirecovery libimobiledevice libzip curl"
+
+SRCREV = "280575bb95977241e240ed081a2602d68746443e"
+SRC_URI = "git://github.com/libimobiledevice/idevicerestore;protocol=https;branch=master"
+
+S = "${WORKDIR}/git"
+inherit autotools pkgconfig
-- 
2.17.1


