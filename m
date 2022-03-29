Return-Path: <potin.lai@quantatw.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE6B6C433FE
	for <webhook@archiver.kernel.org>; Tue, 29 Mar 2022 02:49:21 +0000 (UTC)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (APC01-TYZ-obe.outbound.protection.outlook.com [40.107.117.126])
 by mx.groups.io with SMTP id smtpd.web11.2203.1648522157612197583
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Mar 2022 19:49:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@quantacorp.onmicrosoft.com
 header.s=selector2-quantacorp-onmicrosoft-com header.b=B/pQ0njT;
 spf=pass (domain: quantatw.com, ip: 40.107.117.126,
 mailfrom: potin.lai@quantatw.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iUbwXh1Hf2s0yC36/mBjJK4cKr/bHMb///tJ5YPeXeB+6WuN2UXqZfWd2VLI1OZRrwKBEt7AoFV7iwk91yaOQb8uYTXb0y1DoxHuMmxjgNGAY5OSWp/aSJ9PubQK6I8yvEyVzmEoCp7bcQl3ZdmECrRPY4tWZ+RvGG+t8EuM+oG/Mdcx8Gkn32FA+GTjDI2uNDf53BSU/O6crh04krj9cMOfOnyVwKQEpoxJirqDfDsoZI0VgiYjnXTHK3muG4H7Tai2b6M0T/miXdmwZrR18KQ5uJuoZNVxP9GMuFPOgNpo10OsLjHOhRImhtz1hjKmaZRDtxTYE9kjiLjWb8vypg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a7/pX5DLLzhskLf9doJu5OqLkJjXudLB/DWfUP/qzR0=;
 b=UGyMAQrx/XWSDxyFCzmkX/OhPKLkSv5zojOjHzKNWDYCQBrcDTc0UQb32BIRMQeLjHk5B+qCqzovkmP9rm6PirzoUV+qSuerrOoFpGxuvBk1Xt8USmrA8Zn5pCqVGrby8P8u1VmGosdJ02FQjePbFIWvBpUyAZ4YcHMGYTgRpCSbI1uE9ORHK0sXkOx2ByRD8G72LeRpy+CMNhUej9kDcDrPWHzdpcc1ISPkoJkBZjMtw+EBEe1NobamZExbNAlep+ZMFELyLk/aWa+D5jmpuUbqT5PIN7abttpekZ8pUlY0DRwEjijQrdUw7Pf+5cJtCPTPmL3v3Hb8YKxIdhWBzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quantatw.com; dmarc=pass action=none header.from=quantatw.com;
 dkim=pass header.d=quantatw.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a7/pX5DLLzhskLf9doJu5OqLkJjXudLB/DWfUP/qzR0=;
 b=B/pQ0njTG5Py6PFOkczZYiBL3BPW+1ZEHAtMJd/+XPwOA8sywH8vRA2Wob50zHYG48snw/kONoszW+VxtmiUhhOwBh4nz3Vq3uHus/+fudM4zIlNKBPcAHNbicODSZw4X+XKxuxdS0k37anIapb91So6V+Fu1u9cFHrHWMbzHs0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quantatw.com;
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com (2603:1096:203:89::17)
 by SG2PR04MB2395.apcprd04.prod.outlook.com (2603:1096:4:6::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5102.22; Tue, 29 Mar 2022 02:49:14 +0000
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::7cfe:c9ba:7793:f42]) by HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::7cfe:c9ba:7793:f42%7]) with mapi id 15.20.5102.023; Tue, 29 Mar 2022
 02:49:14 +0000
From: Potin Lai <potin.lai@quantatw.com>
To: openembedded-devel@lists.openembedded.org
Cc: Potin Lai <potin.lai@quantatw.com>
Subject: [meta-oe][PATCH 2/3] libirecovery: add recipe
Date: Tue, 29 Mar 2022 10:48:55 +0800
Message-Id: <20220329024856.27349-3-potin.lai@quantatw.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220329024856.27349-1-potin.lai@quantatw.com>
References: <20220329024856.27349-1-potin.lai@quantatw.com>
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0136.apcprd02.prod.outlook.com
 (2603:1096:202:16::20) To HK0PR04MB3282.apcprd04.prod.outlook.com
 (2603:1096:203:89::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e4a95a44-2f04-4152-1655-08da112eb593
X-MS-TrafficTypeDiagnostic: SG2PR04MB2395:EE_
X-Microsoft-Antispam-PRVS: 
	<SG2PR04MB23954AFE20B18E4D3E8031CE8E1E9@SG2PR04MB2395.apcprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	n8dOJQP/0+Lg/lQf7+WD2nwFAHDjRtgTOk5my4D5CZdO/v0AgoztQBuKHS8BKtSTd/KwbufIPpvPAJg3lOnZZrwKjQWTpT/m9G+c1MLYzGvzkzYtod1l/qXvUyGGilgx18F1TdwY5L3vpkuSjg7detIbdsvx6TZcHUHaA44ypGd0cPycgNHAdf0C9vYKu70j+BIEEFKbvLBrMBgOQtAlmk19AID7rZFBnnVCC0p51Sx3CBzzUjChDHECkdxWiy/d/EwH8/pgQg/T2TamrP+IXoCGGdhfh8VlHUJXYc0mpaDgcqda5LdzQrYWmpnF8m61C5+zgmEId1CO+QuXOpjonnAZNHNjmHXAVd3QfVHvgR1Cm9l+Gh5jHhZBmpOJUsYhndDmAeR6XpqR1DMPQODEZpOKXi6ZAdj7WyUUBnpci2UZVzk9pyvG9P/DTCbh14mnG55TBR/kQ1CVf8+ivEq/WVjcUOJa+4fR9I8k7sC6/IIQNi7NvIgVSN2IR/eH9FiQ/zekvTXDV099kN9TJJPqhd4b6XUhTj8Ge326BZXfKI4W9qki5OV8d7UpHcd7xAxO0k66jficPx/68l749FnY/8FVU0QzIoC0fv7fFKHHLu3Zf2schVt8J9m7u8u+HB8S+bTEBG5lzAk+tabtbzTvRa2s8hkX32dc37zpoOm7N+aARRCG2MY7KLU9XfW7YGvbXMHEcqgd3JMM75k53cAPVO6ch7fxhlAA0gL8o7lgmpz/9YtENO+sAx4stAjYNRor5bR5R1IOwv+3ASFx58dlJ2Z46bfSoHdX/43XrPwF/hQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HK0PR04MB3282.apcprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6916009)(66556008)(316002)(186003)(508600001)(26005)(66946007)(107886003)(52116002)(66476007)(2906002)(8936002)(86362001)(6486002)(5660300002)(1076003)(44832011)(2616005)(38350700002)(36756003)(38100700002)(6666004)(4326008)(6506007)(6512007)(8676002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Gh2Bm8x8dVVvIGOqyIBejwMJHSGZgqkDTJqiYs8CQXUHgQSHE4BJYB9H3/D6?=
 =?us-ascii?Q?w/0XiE6s+L/+OQTm6g6QizyR6bH7ZbhWQ9/lswbDvduMWpN2TtkjC4zhR6vb?=
 =?us-ascii?Q?UoAkdNoHdnmKHsyjBWUHfLuCTd6i/EVAModDz041tRY1iI1CvuvdPT0sQXhB?=
 =?us-ascii?Q?dibdfRayWZPFIdoo41cLR33XCsvE1xN7j7MEfxMqd4D3mARpRyCZlhYYIvLw?=
 =?us-ascii?Q?CFlGpDv/K5nX2iDRuIjXhq1ubCLM7G1rW5gv0DQ8bJXRQ6cvS6DKUJVDPn/d?=
 =?us-ascii?Q?SR6FRvRkmj5BMXj4F5f8M4wc/6X7pp21j6+fzwOXKCC/gxhABVile8nKbiCJ?=
 =?us-ascii?Q?nJmXqQK7pPDepqtmFzJ0AdeRExuRRaYk0//RkmaEsAWioD05bBykTVtyAXKa?=
 =?us-ascii?Q?AItlqL+0h1Fb+ic4S3bC9efDKsDOTf6knfsQsMahdzygeDVTNzcpLXCT9cdi?=
 =?us-ascii?Q?t/yaKGdAuS/HRuFROeC+7Ql+JZhTRKGNHXE8BdS+4QiTcSEWjJ4MwI5/tkn2?=
 =?us-ascii?Q?ADbHVMxa3o/XHF/5ub7pLwIO2MTHTazNXd5/+eGQnV78ZOKflNg4gtyaPYLS?=
 =?us-ascii?Q?47i/gpxQN+/4EqIdTL83k+7RXLgmELr61nBF+inoh+0RMi/uElJjX5smIxj2?=
 =?us-ascii?Q?9gzQcB6Fr3A4o+mhokjLdE+v7J0dx5FDA5cRsduGsYe3Z+OsqmExoi/1hw+p?=
 =?us-ascii?Q?b5ii92eV89dAV2tykCVoz07wKS/nHQA6s7+zqH94NWlwas+nOsGg19Qcv4ke?=
 =?us-ascii?Q?o340Ja+8NxEvVoS/Vt2QMfg28VHuJ9Yew18BC9E//nrDjGdiH/t1jhOeDdX6?=
 =?us-ascii?Q?1LFLBZ3+zkkr3uutVEdmHrvcCtV0bxV0kfOhuPTBoL1RoW4dL0EPXfkNEukr?=
 =?us-ascii?Q?fKfIu4hvt9pg/qvaCzLaPCS2Nhee8xn0lsh54ZQ/KgcHFJo7mDrbka+q8MF0?=
 =?us-ascii?Q?HE94iKhtlyfxdOD1MmFBDU7+XuVkcCNPfFqXtlpmxmkjhhnhBHYxTgur6+Tx?=
 =?us-ascii?Q?cqKkbM+wsYRZes5mZwj/W33BU+v1DF0Y/0wZgA2dbH1mpaukXQiJVRchvvdt?=
 =?us-ascii?Q?23+IDRA/uAUF5bXSwAnkCYxowrf4KwRwS6PL9LjeLcbJbUGcUr8nfvT4Nfsm?=
 =?us-ascii?Q?l2cMkonBZv/kYSAi9xetG6ZQwqvSsJfkKYNiNhQ7L4mMN95nEjBxePMdq1ou?=
 =?us-ascii?Q?fLKwdBca17TS4ewQ+RqTBJRzcWF2fj7OgyB+EMwr/ZESxw+1w05aUDa2+00c?=
 =?us-ascii?Q?Z6dN1hrvYYA+nyEmtFPtaOi1FWrBpu7Zvnd+Kv5iqhpp/Z4oZ5ry0KrbU/UA?=
 =?us-ascii?Q?In0AMhWq6PUTqEDxK8AdeaB0p7bZ2IdEi07q0qiV6/hRJeYYCSYKjFpOYzr1?=
 =?us-ascii?Q?sJ9uLtdELTWqNCx9MfzAqfP+6rc3RrQffVR5J63kLzbV8DvL+fwFCx6xLlNz?=
 =?us-ascii?Q?aZzc01lEXxU4zT5KnP8NtfbUrS0Ip23cTeOcNG8Z9D2gJAA/zotZ7Brq68GR?=
 =?us-ascii?Q?5nW7PsYZ6Zm3lGnf1V9Pr5nLrsrT9z7IRpfOUnNadtEF3EwpPR334v4l6JIe?=
 =?us-ascii?Q?gtVJQu9vu/LaA2RHgMYhIfcR9tuRYHHs1CZWXqK5jo4aIKVN5qZz4hLmkQ6Z?=
 =?us-ascii?Q?TBZsQa+RbjQJ5/0fd8anRYej6qQFC8k6zeiTWb3vr+ftxINLijZYEQVIu6fm?=
 =?us-ascii?Q?P6w2XaDJkCUu7M1yrYoMPIpzWUkfibFaad8JeKyEVamV6nqnwnnOsPCJauyn?=
 =?us-ascii?Q?XTJ+UKyCBeQTtOB3Y+xgbwjbD7J9sTU=3D?=
X-OriginatorOrg: quantatw.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e4a95a44-2f04-4152-1655-08da112eb593
X-MS-Exchange-CrossTenant-AuthSource: HK0PR04MB3282.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2022 02:49:13.9767
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 mJYkDy2FO9m1Px7uAVW+9GDjgW6MhtYoCt6570KlXiwLNUxHhGOGOtzr62e9SR3yL7xzV0O1MpGhTHDHgppRQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR04MB2395
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Mar 2022 02:49:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96249

libirecovery is a cross-platform library which implements communication
to iBoot/iBSS found on Apple's iOS devices via USB.

Signed-off-by: Potin Lai <potin.lai@quantatw.com>
---
 .../libirecovery/libirecovery_git.bb              | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/libirecovery/libirecovery_git.bb

diff --git a/meta-oe/recipes-connectivity/libirecovery/libirecovery_git.bb b/meta-oe/recipes-connectivity/libirecovery/libirecovery_git.bb
new file mode 100644
index 000000000..30c633caf
--- /dev/null
+++ b/meta-oe/recipes-connectivity/libirecovery/libirecovery_git.bb
@@ -0,0 +1,15 @@
+SUMMARY = "The libirecovery library allows communication with iBoot/iBSS of iOS devices via USB"
+LICENSE = "LGPL-2.1"
+LIC_FILES_CHKSUM = "\
+    file://COPYING;md5=23c2a5e0106b99d75238986559bb5fc6 \
+"
+
+HOMEPAGE = "http://www.libimobiledevice.org/"
+
+DEPENDS = "libimobiledevice-glue libusb1"
+
+SRCREV = "e19094594552b7bed60418ffe6f46f455e6bb78f"
+SRC_URI = "git://github.com/libimobiledevice/libirecovery;protocol=https;branch=master"
+
+S = "${WORKDIR}/git"
+inherit autotools pkgconfig
-- 
2.17.1


