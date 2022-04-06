Return-Path: <potin.lai@quantatw.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CC21C47081
	for <webhook@archiver.kernel.org>; Wed,  6 Apr 2022 16:33:19 +0000 (UTC)
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (APC01-PSA-obe.outbound.protection.outlook.com [40.107.255.114])
 by mx.groups.io with SMTP id smtpd.web12.6101.1649233528853574613
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Apr 2022 01:25:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@quantacorp.onmicrosoft.com
 header.s=selector2-quantacorp-onmicrosoft-com header.b=WC1U7GVy;
 spf=pass (domain: quantatw.com, ip: 40.107.255.114,
 mailfrom: potin.lai@quantatw.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WIgokEwvy8ZBlvHP10kDNcbvOzNIIzpXXwn3xw9nvYeNd/cWCfqYt/VjfLDbv/Dws8gIEFdNSd91QQHId1/r8CDgwl+aBxPFQCh5d2tWIQZC1tfn4UUha0p1ewXLh6J+Lb9GUqaw6y/DWsFyU9RApngEonfo8uy14KAASuSJCJECvRGluJNcGmTOmmogVQv5bpX8eikQcPNhnMvG1LBvljaoyYkvsT5cwCXgt9AQ1dtk9FphArOPLxHBGEadcUhY4Yb9iiC8VQhBnvMZZTN9s5Xhy+VFCgbAlV7fvkCf6KFrpZNS1BLTBgCzLeG0PeOqYvQ7ccNn8IZELCB9DfKncw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gsrh1asFve8jkrFR8Aqdd8gSMS8esNyVlfj/5Wdq5z8=;
 b=TmCcaSQka5/PcRT3c2c5L6lkvg6fXFLdYhXWS17j25VW640z48fE6fPGpIPaVpEyzaGXQ8jYWLBZoxvygP6Er8bowrp54gkywRNDwnu6DDYVg7ARh66n6+bvTlTx6T/fc9o8AdwPbbssUTWHi2y5+mXsX8xDcNJcM5fljz2lRlMxqe5ALKr0Jg3qtkRs4FkGmFgcRjgnPsPrMbOMQhVzTOi2aZ2sCC6+CRqy9E4bmhHzLU8BAc+oIsWFz46DyG2bunBXEvMQzKzv3dDKw+qLiWwFYDRbVhFTnBS2UgsiQv+BYpsrCgdpJhe962B5gnqK2fCL3MVRFi+vCMWcjthn7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quantatw.com; dmarc=pass action=none header.from=quantatw.com;
 dkim=pass header.d=quantatw.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gsrh1asFve8jkrFR8Aqdd8gSMS8esNyVlfj/5Wdq5z8=;
 b=WC1U7GVypekPCbVNjYOffk/vipLQNGfMobIHQK5VSsIkrsiEGT/smXTihQmqOTBc58x5UUVq1kvNAfaF6iUoutdpSxsrFZj6QiYb4er9mHWuaJ8aoz5ASqPNAejmutLHJnF8Ny7lWtZBHcri0SAW5NHGq1BKPisBfZkjEVHAWSU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quantatw.com;
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com (2603:1096:203:89::17)
 by HK2PR04MB3587.apcprd04.prod.outlook.com (2603:1096:202:30::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Wed, 6 Apr
 2022 08:25:11 +0000
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::9c61:c8e7:d1ad:c65f]) by HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::9c61:c8e7:d1ad:c65f%6]) with mapi id 15.20.5123.031; Wed, 6 Apr 2022
 08:25:11 +0000
From: Potin Lai <potin.lai@quantatw.com>
To: openembedded-devel@lists.openembedded.org,
	Khem Raj <raj.khem@gmail.com>
Cc: Patrick Williams <patrick@stwcx.xyz>,
	Potin Lai <potin.lai@quantatw.com>
Subject: [PATCH 1/1] libimobiledevice-glue: update recipe
Date: Wed,  6 Apr 2022 16:24:56 +0800
Message-Id: <20220406082456.20813-1-potin.lai@quantatw.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0144.apcprd02.prod.outlook.com
 (2603:1096:202:16::28) To HK0PR04MB3282.apcprd04.prod.outlook.com
 (2603:1096:203:89::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 52a20556-c73e-44a1-d552-08da17a6f7a3
X-MS-TrafficTypeDiagnostic: HK2PR04MB3587:EE_
X-Microsoft-Antispam-PRVS: 
	<HK2PR04MB358732CFBD58D5F7383E6EEC8EE79@HK2PR04MB3587.apcprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	70XIG9WXnxtW9XtXJn+OD8N5tIlDyO7ZbWSbMcdjfn96h9nXFrluVTjYGT/OJ9G7PvFnk0yf0/mj7L1YtgpPq9mC2mMLUvOoSgiJ9sclsviAvvLsmdzj5aJkeW7OGNAfx1Bo2br9RMbMP36pR7oRTjxYZhGBuNHqc7e5gFKGoylt6Yr3KQyAAMGqSU+HEvT1wjx7hinJgvxf2Otld/9xnBhsqt9pydEeGMaR0sfdGXViT4ga5RUpPn3lNq8bDOZeq8+MDG6knTvDtg1k8zsQaxeHpzXdyBhBbW4ULADPsqJkdzeefc3wLf+MBAYpVY45hccOl7Ia2GKRJQI3EBbNCxYJVp1QbYZRj0L1XbmN+sMwysjI7Dh2JcLbGn+r+2Cfg0RCWGaTa8l7IOK9STaAHaboVDlH4/K6xPN7uROxviLlQZ9Q5Usv2VZ6Wh6cNnWDFElv3wBV8NgZEDp65HCWU/z0ELkfBzu+3UwBj58vbBSO+0UMOtdfsEkGP1SF2O5ls81PXePyfJ7/hoDHX1aAdQBAYulhY9JQPwLO/jxP5sd5tZO4FsI7WNkyO1mLxYxnEPZ1PDEfgkQPxKWk8ZOSvdOYmeh7NidpXt3tLHJH8wv6uCVt7kyjcyCji2p04TDFgC7/vJ6pCqFmG4yUxZ7bea8ZDqOVBneCC5bB6J1A4yJrNQrY8te3x3chku/rUQbtH4xEMnhtyE0xOxowajzfgM9bdftOgs4Wvhs7IcVvoBHYkMXg2H1Vrc+PmXlqu6XiPL9Tl5IOaxEWv3UelO/1nJaQmu1HGAFqo+4c1seCngg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HK0PR04MB3282.apcprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(86362001)(54906003)(6512007)(6666004)(8676002)(2906002)(66556008)(83380400001)(52116002)(316002)(66946007)(6916009)(36756003)(4326008)(6506007)(66476007)(15650500001)(508600001)(5660300002)(6486002)(44832011)(2616005)(186003)(26005)(1076003)(8936002)(38350700002)(107886003)(38100700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?6nyugIS6CIo9kQ1iUg4HCwQoUARIiZMSaGXHit9ZOUtM8WsqG7AQ4jHDPYdQ?=
 =?us-ascii?Q?UbpC3mQ+HO7LXzK6ZpEvffKNsmdmQqzAA7RGAPMd+N+r1IAvgE0XTSnVUJdW?=
 =?us-ascii?Q?7HSdTNcAsVZXIgEmzw7L31E4Kyk9BjXxGIs8lBq0RzdbQu5mYs5nE0zx08Wu?=
 =?us-ascii?Q?2yJSQfJ5q32IxbBrbZCNXS9dIzFdV9qpvTLAkTQ3VJ+/zcRGijhurugzfl65?=
 =?us-ascii?Q?dlFz7+rRPU0dpBKh7KulHrli/k41e3RiV5Maf7HwcKOVFxFPz2QjF5AOA4Fc?=
 =?us-ascii?Q?USqwdp2Zv1BTJVfNFuyniWke746eJceHlplD/nm3+RrCuV/3HepOWQKNfoO4?=
 =?us-ascii?Q?oPZfYMn/UzgsCnRk+B+OFLAOVusK4/zKxajVZwtrrJtpyPPDTvM/eVUj/ixK?=
 =?us-ascii?Q?VX5FdBZALZcHn6yPvtBkc+PEV/3kRZkeoAWJv5jjEAmvGhTXwF24AIIKpUoF?=
 =?us-ascii?Q?PpsowSoLjXZ3gErmnt8prD8eFr27sNky3yIbuohXhVlzwymPTZctt7XrQuT9?=
 =?us-ascii?Q?XcVZkQIf2nPIG2/F/DcG9eWYsZOb5QAbVWzpyq/JYCakV14PEJ1yMgXNvEZk?=
 =?us-ascii?Q?UcvtLJ6mEIGQA2Behha+1AMRDa3IOFrYhxBnCUqtvQ2Fjx7vWaGH+VqVvJjN?=
 =?us-ascii?Q?nDA9/3BcyuZQ94OoUN0t+rto48g1Us5hs8nvFyCI+c93vrxWN0NoGv6nWaoz?=
 =?us-ascii?Q?bqWLAF6VbcETo1nXzIqnHEb+vuyp7RrAf7zM2ymLQX2hCAf3teGJciT/z3B9?=
 =?us-ascii?Q?zytOqRyfMILfYQMovKmUS755XIcD5zuXfJQgXN0Q10RzgdQhckg7w8YoijM3?=
 =?us-ascii?Q?wxWocwlw5kKp0yOcVnsoMaYBktIeTDS18OnMqABfLYagPiVh1OlJAZKP9Zge?=
 =?us-ascii?Q?volnO5m06I1cLZDop2ptfr9rwtGt4SxenY4jLUWZ/M/J+O7y5oUu+lwPXhqU?=
 =?us-ascii?Q?fmpFgiaUjzdPzxjH7QVWWb4IJzJcQ7Izbq/dw+oFsIazXB9LKrsPHyDxc3Xu?=
 =?us-ascii?Q?rBlLnR5RfPgBT3zwUpblMQ1FGrEHp1+Bq4dkEY8pPmEQ9qwdQi6HG2EkTShr?=
 =?us-ascii?Q?7Exu0xbx/41dmK4cpg+h9/ZOFOpMDf+Vn2olZjgQIeHdgbnH085fMP7Z9DLc?=
 =?us-ascii?Q?baLQlb453/D3i34t8UcJO4PPm1jjPXeIRgkA9YHY0HDvH3N4D37xj4RF34/d?=
 =?us-ascii?Q?J91+MGBNtTf0jWARt99gnQgZZ4BiKMN3J1FcQccbs81eAKKuyd03MDHaHHQN?=
 =?us-ascii?Q?F7nkqVlKiPzuPRN4KzV1RnJCEqkmvPk6aNqiJ8Qr/uVTRf/7ri4wwEibmZPv?=
 =?us-ascii?Q?yaIBHXAPKozfhmaRLtRzNgHImwgNnEi/q97YkgHmHq1NcbVlgKxtkGD56Yjt?=
 =?us-ascii?Q?sSyEDo6FPJTbCKO0+ys7G3fvSLFVIgrmvK00L0OCiiuC7WA+igCT+T3RsBJd?=
 =?us-ascii?Q?/CycLfVG/G+4Uv0B/iAftbH6VVH6q3Er+wAd9Ku6A6EVdgkAnweFJSZuUsqs?=
 =?us-ascii?Q?mNLOlXFGk59vsQrHSscFCa+nEJnXV0MdQYZNtMw6KxbQnKT+fDbmbcoSqEdb?=
 =?us-ascii?Q?VpzU0Dw72vMbZV5R1+BODrKwgObBd2X3e4SAN+CyToSFM271d+QVrebM4E2Y?=
 =?us-ascii?Q?bHYlFNBTmvFPP8moQusb4XcS0WKHp0AgkwnkDnXWa14LbS70dWNAFCz3OVNz?=
 =?us-ascii?Q?QS2Djarz/pVymdZZU2sqeMgIcYDHimU9zUMsIkjn2AyWAw0PiKWhOwIaaT4C?=
 =?us-ascii?Q?7przrL9uunq54wqY079Wdx3Sb9BAEGE=3D?=
X-OriginatorOrg: quantatw.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 52a20556-c73e-44a1-d552-08da17a6f7a3
X-MS-Exchange-CrossTenant-AuthSource: HK0PR04MB3282.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2022 08:25:11.4471
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 V9D9b+bifuoxh8iXThztjAYMvitUko71bj7DyxbLyed/TFhmHZg4NTmphqZuL9MycAOMM7BwYmmyqmXIYZkD2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR04MB3587
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Apr 2022 16:33:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96437

remove patch 0001-fix-undefined-bswap32-and-bswap64-errors-for-MIPS-ma.patch
  Upstream Status: Accepted [https://github.com/libimobiledevice/libimobiledevice-glue/commit/17a2b964ca9c94f6615994ba2179bf4228e31236]

subtree update: ecb0996fd2..bc6c44b920

Nikias Bassen (4):
  [github-actions] Use windows-2019 instead of windows-latest for now
  socket: Add socket_get_socket_port function
  utils: Close file if buffer allocation fails in
    buffer_read_from_filename()
  Updated README with pkg-config requirement

Potin Lai (1):
  Fix undefined bswap32 and bswap64 for MIPS machine

Signed-off-by: Potin Lai <potin.lai@quantatw.com>
---
 ...wap32-and-bswap64-errors-for-MIPS-ma.patch | 32 -------------------
 .../libimobiledevice-glue_git.bb              |  7 ++--
 2 files changed, 2 insertions(+), 37 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/libimobiledevice-glue/files/0001-fix-undefined-bswap32-and-bswap64-errors-for-MIPS-ma.patch

diff --git a/meta-oe/recipes-connectivity/libimobiledevice-glue/files/0001-fix-undefined-bswap32-and-bswap64-errors-for-MIPS-ma.patch b/meta-oe/recipes-connectivity/libimobiledevice-glue/files/0001-fix-undefined-bswap32-and-bswap64-errors-for-MIPS-ma.patch
deleted file mode 100644
index cff37fb5d..000000000
--- a/meta-oe/recipes-connectivity/libimobiledevice-glue/files/0001-fix-undefined-bswap32-and-bswap64-errors-for-MIPS-ma.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 73fcf0b54f4c1fc07a2aa003dddaeb5a97177cce Mon Sep 17 00:00:00 2001
-From: Potin Lai <potin.lai@quantatw.com>
-Date: Thu, 31 Mar 2022 08:44:31 +0800
-Subject: [PATCH 1/1] fix undefined bswap32 and bswap64 errors for MIPS machine
-
-Replace bswap32 and bswap64 with internal defined version (__bswap_X)
-
-Upstream Status: Submitted [libimobiledevice-devel@libimobiledevice.org]
-
-Signed-off-by: Potin Lai <potin.lai@quantatw.com>
----
- include/endianness.h | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/include/endianness.h b/include/endianness.h
-index 099877a..88b63db 100644
---- a/include/endianness.h
-+++ b/include/endianness.h
-@@ -113,8 +113,8 @@
-      && !defined(__FLOAT_WORD_ORDER__)) \
-  || (defined(__FLOAT_WORD_ORDER__) \
-      && __FLOAT_WORD_ORDER__ == __ORDER_BIG_ENDIAN__)
--#define float_bswap64(x) bswap64(x)
--#define float_bswap32(x) bswap32(x)
-+#define float_bswap64(x) __bswap_64(x)
-+#define float_bswap32(x) __bswap_32(x)
- #else
- #define float_bswap64(x) (x)
- #define float_bswap32(x) (x)
--- 
-2.17.1
-
diff --git a/meta-oe/recipes-connectivity/libimobiledevice-glue/libimobiledevice-glue_git.bb b/meta-oe/recipes-connectivity/libimobiledevice-glue/libimobiledevice-glue_git.bb
index d5d90ea13..6d872b9f8 100644
--- a/meta-oe/recipes-connectivity/libimobiledevice-glue/libimobiledevice-glue_git.bb
+++ b/meta-oe/recipes-connectivity/libimobiledevice-glue/libimobiledevice-glue_git.bb
@@ -10,11 +10,8 @@ DEPENDS = "libplist"
 
 PV = "1.0.0+git${SRCPV}"
 
-SRCREV = "ecb0996fd2a3b0539153dd3ef901d137bf498ffe"
-SRC_URI = "\
-    git://github.com/libimobiledevice/libimobiledevice-glue;protocol=https;branch=master \
-    file://0001-fix-undefined-bswap32-and-bswap64-errors-for-MIPS-ma.patch \
-"
+SRCREV = "bc6c44b92091c9587a9bed0ed3f2c3248bfd13b3"
+SRC_URI = "git://github.com/libimobiledevice/libimobiledevice-glue;protocol=https;branch=master"
 
 S = "${WORKDIR}/git"
 inherit autotools pkgconfig
-- 
2.17.1


