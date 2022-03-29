Return-Path: <potin.lai@quantatw.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85D46C433EF
	for <webhook@archiver.kernel.org>; Tue, 29 Mar 2022 02:49:22 +0000 (UTC)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (APC01-TYZ-obe.outbound.protection.outlook.com [40.107.117.126])
 by mx.groups.io with SMTP id smtpd.web11.2203.1648522157612197583
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Mar 2022 19:49:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@quantacorp.onmicrosoft.com
 header.s=selector2-quantacorp-onmicrosoft-com header.b=fYvz7b2Q;
 spf=pass (domain: quantatw.com, ip: 40.107.117.126,
 mailfrom: potin.lai@quantatw.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W4qEycvzved6QJoW/pCc3Emn7HQo0pa53/gz2PWHle+8iSXhV6ntduVARpJOMAs1z8x50WB7d89f5kGRwOQN1viZg8LFNpDgUi+z2IMUL+RLo6ekr66VFVh+kFh1RqhINuhI190PhpQgH4e02LxuYResi7YcJ1JouUQGK7Dx0tFr7ZnC/Uzj1ccjl4BLGPcrB5S2tnge1Lea2VGQl2So13wqC8q+yGtWBwSJ8z/S/Pv+/1NmuNzY7iifg1tZ0jaiObd6Nc8NssvaPA+xtwsbbeeU6oj7OG7zbDE1p3//9fLnkg0SDbWLW4yl1evxlFT4606+Vp5OqFPqRaMwcqy9kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x9rM1tm6PSUt4Ww8AzmfY2wF2cE4fC5AqaaV+eXSdyM=;
 b=kp6M/HbIoHpt/YZuO3AfoJ1k7x2MHsHM8wiFv0H127BEk/IIIKMY1evDNITi0Z9KicZkviPp8v5qd3gRWXB60lhXula6tI1B7fpOAM386aJ/9jaNhxc4XbB68h8wvvQWZP4q5j9mTf+r+3AHwTz5zogg8KulNQrWQaTE12apffQ1y/LZz9UgEp/0/KwIA+a9WmEtqo7qli9uUxH0WHyXbN1IBA07WkWmrXM2d+MIq3QW3qcfEPxcs3l2Qt0riQx0wG0hqiO+N36EX9FF/JLEGNL/3qUlXTWcWjScnvMXf9mnhYDR1LOpSqLdE4xwNdE1levb3QlnyFOAxlX9SK7XnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quantatw.com; dmarc=pass action=none header.from=quantatw.com;
 dkim=pass header.d=quantatw.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x9rM1tm6PSUt4Ww8AzmfY2wF2cE4fC5AqaaV+eXSdyM=;
 b=fYvz7b2QBtAmN4yng6hWhN5pv39QoMBZfsB2jGnWHgdfhGaOCSOv5C30RR+A8fUlVKgwLewGw1OTE0oC9G4gShXg8l7Hnxuemay3gYqOX7GdPE5bvUnAdx9itfz7pxnZNBAGlUHaXSS4tnde4I/aRr4ToIXC+P4Hk/xl/CtGz4Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quantatw.com;
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com (2603:1096:203:89::17)
 by SG2PR04MB2395.apcprd04.prod.outlook.com (2603:1096:4:6::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5102.22; Tue, 29 Mar 2022 02:49:15 +0000
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::7cfe:c9ba:7793:f42]) by HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::7cfe:c9ba:7793:f42%7]) with mapi id 15.20.5102.023; Tue, 29 Mar 2022
 02:49:15 +0000
From: Potin Lai <potin.lai@quantatw.com>
To: openembedded-devel@lists.openembedded.org
Cc: Potin Lai <potin.lai@quantatw.com>
Subject: [meta-oe][PATCH 3/3] idevicerestore: add recipe
Date: Tue, 29 Mar 2022 10:48:56 +0800
Message-Id: <20220329024856.27349-4-potin.lai@quantatw.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220329024856.27349-1-potin.lai@quantatw.com>
References: <20220329024856.27349-1-potin.lai@quantatw.com>
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0136.apcprd02.prod.outlook.com
 (2603:1096:202:16::20) To HK0PR04MB3282.apcprd04.prod.outlook.com
 (2603:1096:203:89::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c9e4cb1e-d421-4cfd-c499-08da112eb5c2
X-MS-TrafficTypeDiagnostic: SG2PR04MB2395:EE_
X-Microsoft-Antispam-PRVS: 
	<SG2PR04MB2395C4B8B93C7E7F6CB88AFC8E1E9@SG2PR04MB2395.apcprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	q6IG8zRH2yc30KgNRlxT8o0kBheGggopxPL8YwxEUQol8+Unv3oPDOyEmN2KJxUjmVnZZHR3VZ7MWYj7WfOrLYX1yNthZ7gKhteL2dyu/0Br9nl038sGVG+me7LVunyj10VRlYkLVlTPSJdB1GPUQ76hpBoBpdjQE/Z6/lJUxwqRbGT4ZqUrqKfxEXKX3B3rRG0JYQwqIrNVCalM8f7zYMMkC5JVgzow3tRhuN8535YbvPCXSvoOOG8UNK/6LeVO/incQuyUZTkX19Y7GWC2DAUNH7HRgmd39ltQRUL4FO0PfNQHg9qbbeSD1Unj0VK/5OE2QI/5WoGI28KYoHfwsOrAMHshysLBcHJb2nsKuRo03QtRoxibfOLCV4ATrqsNY4O9JnhTyDGjJrArIvhB4PLND6tLFTZvqeaXASXE4DMpS2nzMROKY4bb/gnd1WgwhD6Fphs1tC2SYhvdnXOiIVGXMieNeOZiRcu/UKZoNWpqmwccKX63eu/WRxFk+3n/37oIJ6+vifydhXYQE5xin3JqoEh0+36zgwGkGa/bG5MH6dbJIaNpDpJLgzpreC6/SP5mEYZUjqBMxeG8ObRdpryhISKuc28dE6vEc7F914ay2RVwCl1jXtDG3nUtbmeJkhqgVUurJTeuWRf+2A4VY56XpGuu3URATRRt22eC78LY++sluHpaD39a0xEEVKnerpieZGivMCWo5OUDjQR7X5nXnyhpOw+TJlOx6tdGr0dRBupKhaWdWso9erHptqqBM8T+te1/wlnkO3YJOytehwOYWY6anqaZZ51mY9EvVbs=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HK0PR04MB3282.apcprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6916009)(66556008)(316002)(186003)(508600001)(26005)(66946007)(107886003)(52116002)(66476007)(2906002)(8936002)(83380400001)(86362001)(6486002)(5660300002)(1076003)(44832011)(2616005)(38350700002)(36756003)(38100700002)(6666004)(4326008)(6506007)(6512007)(8676002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?AnCr0i+nIkxKHgGXQS2KODZ7d42rjIeTawU68Gnc7SjiobyMUOOE4koztdlW?=
 =?us-ascii?Q?TMISdSzgQxcCZgjf3Kqv/GxtrONadZ+4VKkj5YzbnjaaEd2dAaGJkqiMNdZF?=
 =?us-ascii?Q?ChEr+P38dKB3GmNXpzqpOvGN1BSTSYMvi5lCH7jpjw9exx/fTRT0g7HMQ6xg?=
 =?us-ascii?Q?6JfMfxv6vbvxhreMZq9eUkguD48oC5I9k/caX2n5yz9qk8vrauILojAOFIS5?=
 =?us-ascii?Q?UMEu7Ul2BwbTIh9DuQE4+ETToBmsm+0lMJFP0FnfFMjy3xYihgYXpqAUSIH6?=
 =?us-ascii?Q?xMU53MZLngb/CoOYHdzWqQvDpXMnlBcyipGEEcN34nGfIb/rOAW4RtzhQ617?=
 =?us-ascii?Q?64ztvuWMQ0gPUIl1aAcZol3O/jZJfYHxQ7nlrZLmjKoaTsS8YAsLP2UU5AEE?=
 =?us-ascii?Q?QHrFkxzl6s2x9gQfQqbVWMttKOKVlKDlv34UndW0Q2C7rh7ij4NGbfS8yv6l?=
 =?us-ascii?Q?hlHBkBn6qOXDa8aFittMHRg5isIBDEtIShCnTRG/H2nv0mR+L8mkIUF3uwGS?=
 =?us-ascii?Q?ek9Ug6L4IrNgFNALLVhUrgMwYBfH7UjLhBk0UQqx/yiWh07ksTMDtwNsPc0X?=
 =?us-ascii?Q?MzEDXS3lTpxWrmIz5yVh8SnP4eU1A1RwZNo79ySiYlhYbVUrfNdbFyaQlz1O?=
 =?us-ascii?Q?A4TbfanlC9+jF10/ARbwgIURg49AyYGVlD6rgCGT7EGsz6WadJmbq3T0A3B7?=
 =?us-ascii?Q?n5OPQZRZwuhXvHTGtnAbCdkEEfSGD+O8+OxaOONf3JuZ9yNzECWoStlIb0PO?=
 =?us-ascii?Q?U30+ICVvyBtrxqpK+xbr0oU54WEAjtcTY8QLI5tnVCLnqSmE7lQXRLW/jJlI?=
 =?us-ascii?Q?PyW8fgZIPqGuUXjmhaVMl3hjpprlLB58UWXiXx9tGagDf88AeHxU/mj5BHD5?=
 =?us-ascii?Q?MizOV6skwBYcIcMOKRbl0pWDqZTp2T6xbnwZUQ3+WzqeLlv4NTub7Ux0VjhN?=
 =?us-ascii?Q?N2pi01w7td4T1WszaQXTk7EbMPvjDZDm7ECWTXSF8/l4oajG+xmlbZQ9t/y4?=
 =?us-ascii?Q?00FCyV+PZ/kXDuFXZpJsOJ73N+rNTnzJyd2XcCYCjOz/IRj7w372rTGhOWbd?=
 =?us-ascii?Q?rWJUXAnsDb41CFWTakBBDQogwhj5r+Z7u1umrojsou7RxLgHFo3W94DBa6t/?=
 =?us-ascii?Q?T4qz/WTo6yc9exjVM+4PvK9JTB+VHatF+JcoIDyKtszk1rm+zhWquMe5gygk?=
 =?us-ascii?Q?5pQ80wCOWgV2fkPOdqTRPdgrrhTj8+VhvUOtz0sHur26x/ophQV0gJS0sVT2?=
 =?us-ascii?Q?iE1FZo/H3jVH/gpWy9iMe2cWp7tEnlJ99bSG2ALyQt29cgfrZ7yZVjeDFZfh?=
 =?us-ascii?Q?dM/1hXdDoqYSwgPsvhnme7RlWp3VnH7ziuqwEHAzY5qavdaS6Y0loBsHuvUB?=
 =?us-ascii?Q?Y5Db5/wphDq2a6ZtSbtWThp+ROfUPXLBxdVXOfF28oqIeMI4EkObk6bgryp9?=
 =?us-ascii?Q?RjEnV22RtA0co+0Z2LA2WFbvM+enOYgSufTaFy3GKxZ4ETSVI+A8IbiKRVje?=
 =?us-ascii?Q?KfWOqCDuRjoGY3r7AFyvZuSuDu/piwwgGWHM5OE9FnEQQf05GmtbM9doinUO?=
 =?us-ascii?Q?I/leQW5OniaRovlMqsJ1IyY86MhGpVrQjlueMH5Bygnq/bzicrdnVddExnyK?=
 =?us-ascii?Q?AXzKgm9pxheEBnXlYD+HDrGExKVPTP+gaX/1Vwsrih2/XUM+eiZ1fjushTQ1?=
 =?us-ascii?Q?7fBLgToaLAAznUieJaklPqIclLi3M42pNaIQLhvy9iBGI5oy+THSjTUGPi4C?=
 =?us-ascii?Q?lW8rYLyIMDyt3o9fwdEYqiUTme+SK8c=3D?=
X-OriginatorOrg: quantatw.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c9e4cb1e-d421-4cfd-c499-08da112eb5c2
X-MS-Exchange-CrossTenant-AuthSource: HK0PR04MB3282.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2022 02:49:14.3360
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 9mpMWiOl0OMLocGfNZelgBuGr7Vgoedvni2IcBAROWDhwWvgRWxcrdicli9pu+eJFTMYnW7PFgsOuVws80NeMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR04MB2395
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Mar 2022 02:49:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96250

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


