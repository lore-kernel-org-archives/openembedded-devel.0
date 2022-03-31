Return-Path: <potin.lai@quantatw.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7761DC433EF
	for <webhook@archiver.kernel.org>; Thu, 31 Mar 2022 15:49:41 +0000 (UTC)
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (APC01-SG2-obe.outbound.protection.outlook.com [40.107.215.102])
 by mx.groups.io with SMTP id smtpd.web08.8976.1648741778396103384
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 31 Mar 2022 08:49:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@quantacorp.onmicrosoft.com
 header.s=selector2-quantacorp-onmicrosoft-com header.b=TriPaLOW;
 spf=pass (domain: quantatw.com, ip: 40.107.215.102,
 mailfrom: potin.lai@quantatw.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eHR5VYDfyaUpRT73YLxPmc+jG5rr0bicbQE3I/gmIyqjesNcAFaG/xjnMl16rUs1j10dmIA5GXf4vh/zMlqRHxQqHsMxBV8jeQ+ZIgTpdb4yFlzOdtcT1RpVyFT9e55EOf+sRh6QdQtJZKmrAkd5B5zbJD4+3oTzbWXNmsIUXG6TunWDvuYu5+T02ksT38xz/UxO8siY6ofeaYtRRwibE+fFV1Ek5BDdvsX7uSIUGX6r21aGNtUlN+arhHW1AAJOtHS1W4TQaJG15++90SwuN5/7Ufms6BqWkerln41EY5izOWx91l1XEw8cS6eNsmMnMK3A/yTo2GyZ97cdA/QBYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yeJLlsSQvxtv3OrqSZctPwV9Mh1fFKs10VQXC5uD5WU=;
 b=UmcMiGxZXzLVeEuu9TQHJWmPLRPXCgaFqQYOjyea2av9OiQYGI1yLO+C550bvtBzUxbUHl8goEPssKpuLQAAWmpV/phNLKIaNfLLRrou1XdEBVq8VU5Y59EzbgCIHADQuclqd/u/a0OSW/ZF9eYqfAai+3H5QSqfXlZqos6TNXOjcmlA0tx8tGFpspPRjHG4vLJXsH2QWsR7XO3TwRzqV712CFHLzEhe0j+kvWwOIXsG21HQ0vJc5/hwrAZYUzlBIFxYeieexIXV5Pc3lvg/Ua74EV6Buz0dAhvOu2z1G1HL6f3X5ZSYqUdmFX0MuEEerkP2BpRT9WY4mtGA0Eo+Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quantatw.com; dmarc=pass action=none header.from=quantatw.com;
 dkim=pass header.d=quantatw.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yeJLlsSQvxtv3OrqSZctPwV9Mh1fFKs10VQXC5uD5WU=;
 b=TriPaLOWxPi8jO4vJThpxrEcHx9kOoudtsK4C2r/QwcXS0JWAVIIprAs04r8GhUdwwkffHQq8eVOef+IKJKeYgxD3jAkcyZzCfVY1MjgVLFoTvwhElh/3Eedy4fWQweBwWb4S3qkHIVdX6L/JSqlbqh18mo3Qa0ijh7IH8sWDhY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quantatw.com;
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com (2603:1096:203:89::17)
 by HK0PR04MB2785.apcprd04.prod.outlook.com (2603:1096:203:5f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.24; Thu, 31 Mar
 2022 15:49:33 +0000
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::7cfe:c9ba:7793:f42]) by HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::7cfe:c9ba:7793:f42%7]) with mapi id 15.20.5102.023; Thu, 31 Mar 2022
 15:49:33 +0000
From: Potin Lai <potin.lai@quantatw.com>
To: openembedded-devel@lists.openembedded.org,
	Khem Raj <raj.khem@gmail.com>
Cc: Patrick Williams <patrick@stwcx.xyz>,
	Potin Lai <potin.lai@quantatw.com>
Subject: [meta-oe][PATCH v3 2/4] libimobiledevice-glue: fix undefined bswap
 error
Date: Thu, 31 Mar 2022 23:49:10 +0800
Message-Id: <20220331154912.1456-3-potin.lai@quantatw.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220331154912.1456-1-potin.lai@quantatw.com>
References: <20220331154912.1456-1-potin.lai@quantatw.com>
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0148.apcprd02.prod.outlook.com
 (2603:1096:202:16::32) To HK0PR04MB3282.apcprd04.prod.outlook.com
 (2603:1096:203:89::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d1e79ea1-ae4e-43a8-5181-08da132e0caa
X-MS-TrafficTypeDiagnostic: HK0PR04MB2785:EE_
X-Microsoft-Antispam-PRVS: 
	<HK0PR04MB2785EAFDAB3BD0E2A546530D8EE19@HK0PR04MB2785.apcprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	mjQv3kxg3POs11j+3jVWM3JB/2s88d1NUlgDJ1bzuXCvTX8i/3DJ0VXInW/RZT8+lOFH6T7K8GPqArnvEZ7Fm+mZA62K/Fw/8SE4+sJbOK0qCr6SnV8V70C8zxr4Z5r+xN32Cp5v5+dq13I3zSN+NjEqz1Mu7z/c+8Pq1elxSdq6xt1ESvjCbJKh2vCZ7AxfQLWNBJdiNm9Wt/V34B95Cm1UnTJwEaXCNR7vaHMOxEyeq2DFgi4Spf5JfK9o3PogLb2UEko06ujmJHoLZp3zncJH8Lg9Krwuc2M460T9ysplPYbDalWvR9TBHAb/I2c/9mulc819Bnpsm2FuUgKMVnTfkj3aAHqwhfxZWxHjAM6ztYSAiDTcL/CgZEQKUEOIfWlYTZmiJD8H2PpNo8T7nsNwOKUKB93CFKStp5DDH5Au4fH+5WbFSud/F0fDdVNFh53Bg8mjS77Uyfqb/+nQ0awI8gIXaqJxnZhKf/oHiWCN2cwNi7DPTxSnEwWlRFPxPYPu+vq63qiOM3QqOG4PdIYw3b6OsrmKVdD48A00sDYBtGeLROSvGEF2kVvxG89rV717hMLBO51Y8RyOoraql33H1yMulR1F6PBYnaFb43z46iIwn7FP4+YNS/Vw4wVOVt5YFkj5ONU57W+55+IezukAdKOhOVFk7hjZh8tsiJuBfKq1awZ1VZbA2nibBo4y6Dye4o3ZgOHIwkI5LhPHng==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HK0PR04MB3282.apcprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(316002)(6916009)(54906003)(186003)(2616005)(26005)(107886003)(1076003)(86362001)(83380400001)(508600001)(6666004)(6512007)(6506007)(52116002)(8936002)(36756003)(44832011)(4326008)(6486002)(8676002)(5660300002)(38100700002)(38350700002)(2906002)(66476007)(66556008)(66946007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?iw/pREtEPWbFjkI8BGDdiuve7RrW+/A5GWwUovIG+kbhNV1Dq2bYGXQwOPV5?=
 =?us-ascii?Q?RVr9+UgPWuKkz7Q0pXqR0B2XVW8ke51Dio3CZ6MDZ9jVufMVGGiN4fiMDvPL?=
 =?us-ascii?Q?xhF5YxWmplmH7Vbo3Sw63y/q2EeXY47wiPT5Da4i/CSw4r7M6drgs5MejkEM?=
 =?us-ascii?Q?fb/bZaNHHMEZWJ0JuNkkijmTP6wG+tWjzS9wZOjuQjy4L8sqyVyBHcJOFMB+?=
 =?us-ascii?Q?asaTIP19U9OXJUA25w60/nPbbaMbdp/5EKvsj0d6m7hmtVprqYy7Br+lv/pi?=
 =?us-ascii?Q?gSIeOJiP7HsmLo+iFH6M1p2izZhm4z9AmTCcqJTtJAe69axcKnxWWuowwgaT?=
 =?us-ascii?Q?k/w3+B0m2ONmPb08PSO5B7FfpPSmOObgXSWNceWwFcS4GQ9P9yIjNXu9Kkug?=
 =?us-ascii?Q?tWQWm4qqh89LRrQ8RHl/0Xs5Qbxmx1Jx7n7vTlXmc+CysPQidFZCtW9fCICb?=
 =?us-ascii?Q?J7GwCVdqdkOUivXXFMfErPNzRoWVcXuk+9BtQxh4fdP7DY3Wl0Y2FWquF5S2?=
 =?us-ascii?Q?mc7O5TujWIO8STSX8O5RxYdO6OhGW+qPdIPu8YORNZzthKyZfkQnOcX8gmtQ?=
 =?us-ascii?Q?SGhJGiXETvxV+npGNkaVPlkIRqSD5vtP7d8MAo2ktLUmpJQk8L47JhtOyTZJ?=
 =?us-ascii?Q?i2zbW3t/6GgKK8uBPVBm+SwzALOQNfeEDbpF+iYFvyN5SNsXg15PdEX9W/Bg?=
 =?us-ascii?Q?EFMCmzhY33iDYJBfQmCZs35TDK3591FmedF9aQF0s/8zU6GkSCyIZCHyrMxn?=
 =?us-ascii?Q?qayCOmPanw8Oyq45i7nVf7jPPpcPnb4XoyFcwDUuYX/VbfefsFjENXvv+9C+?=
 =?us-ascii?Q?1+ALHuP6zC6jisVC4V+1/xN5nQsfW3wFH3MQ0zUF1hmOPu4sdVrqNgtkOvex?=
 =?us-ascii?Q?iJXz5gLaEM1Ht2dnrP0FFDSHa1Vk6kFqd86uYYknNlRPpqMv9QlkDl/l+Fks?=
 =?us-ascii?Q?JqW31Mk04HK74n6kosbKdoq91FOtLY50EaihT0eQRpzR+eoJxVJfJ46yU4Lz?=
 =?us-ascii?Q?23TRDX5SqiNmCnraJwdTiu6vCTICDQVdm+b6mFacc5SYsdAgHLVpT48mdMsV?=
 =?us-ascii?Q?30+eQiyOtPhVCWMO+kewDotl7JakY7AFc6In8o0p2+J+9/bZ2bji4uynedV3?=
 =?us-ascii?Q?OVNu0SttCr5uz8bmV6GlyhxAY0WAD7fywn6+2AATsGNnOVs7TmuQ4pu5ZlvF?=
 =?us-ascii?Q?4hd6cxuUZbgGvBKrND5NVbP3xfz8c5sIx90xG3Dbq6M5UyeC6+dX2PTru0nv?=
 =?us-ascii?Q?QN/5YnWZ8zGma/lW18LZ3GBMgkDGqszxXQHsNxm4IUgeDsgVlbT5nZEft69x?=
 =?us-ascii?Q?lP6BSiZejl+fM/H7rQwtY6xJiEGwfP8jpkBLdhAuzOfLXWq5T/i07LE1UXX1?=
 =?us-ascii?Q?IPlPS5J6j6529nukfEMspzmViAWT+BmtYILNXG/QUYpFLaVUuAX0XK+aCo5S?=
 =?us-ascii?Q?ceeHvn8bCZzeezDwo4o7vE96kcAFre9R5rBmcUrYN/ZEzTHr7FtWkFACgSyC?=
 =?us-ascii?Q?vKXz4M2/mm6W3Xs58xVKtUcJ+CR7WUbsgvlUSyY4lXszeUjuIdKHHqVciGbB?=
 =?us-ascii?Q?g7mDhRC7ftID50DEYITrljgLDcanrbJEN1AjJ+1GQomyIr+kjtT3gk0e9J3e?=
 =?us-ascii?Q?awvKU2YJifYFEOOPyDWk5v6t4Jqf6qOO/B/x/33S4hn3/blznIATM03M+u+N?=
 =?us-ascii?Q?bfmLDFsTp43AkEbBWbhJkB04v6OnnjHnO+gF7pE9wjXnbr6I5saeY4IV7Q6Y?=
 =?us-ascii?Q?zFnym9Se4Ejg4S9XVxlOYUuTpgNSMeM=3D?=
X-OriginatorOrg: quantatw.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d1e79ea1-ae4e-43a8-5181-08da132e0caa
X-MS-Exchange-CrossTenant-AuthSource: HK0PR04MB3282.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2022 15:49:32.9195
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 k3wjKNG8lW+LyD5+nBv1Roh/5wQHSESXFeTe/hxqw9sB8JeoKd2yuwDWEj0PizLfhTfznGMu8wjoA5TQeVUTYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR04MB2785
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 31 Mar 2022 15:49:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96294

Add patch for fixing undefiened bswap32 & bswap64 error on MIPS machine

Signed-off-by: Potin Lai <potin.lai@quantatw.com>
---
 ...wap32-and-bswap64-errors-for-MIPS-ma.patch | 32 +++++++++++++++++++
 .../libimobiledevice-glue_git.bb              |  5 ++-
 2 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-connectivity/libimobiledevice-glue/files/0001-fix-undefined-bswap32-and-bswap64-errors-for-MIPS-ma.patch

diff --git a/meta-oe/recipes-connectivity/libimobiledevice-glue/files/0001-fix-undefined-bswap32-and-bswap64-errors-for-MIPS-ma.patch b/meta-oe/recipes-connectivity/libimobiledevice-glue/files/0001-fix-undefined-bswap32-and-bswap64-errors-for-MIPS-ma.patch
new file mode 100644
index 000000000..cff37fb5d
--- /dev/null
+++ b/meta-oe/recipes-connectivity/libimobiledevice-glue/files/0001-fix-undefined-bswap32-and-bswap64-errors-for-MIPS-ma.patch
@@ -0,0 +1,32 @@
+From 73fcf0b54f4c1fc07a2aa003dddaeb5a97177cce Mon Sep 17 00:00:00 2001
+From: Potin Lai <potin.lai@quantatw.com>
+Date: Thu, 31 Mar 2022 08:44:31 +0800
+Subject: [PATCH 1/1] fix undefined bswap32 and bswap64 errors for MIPS machine
+
+Replace bswap32 and bswap64 with internal defined version (__bswap_X)
+
+Upstream Status: Submitted [libimobiledevice-devel@libimobiledevice.org]
+
+Signed-off-by: Potin Lai <potin.lai@quantatw.com>
+---
+ include/endianness.h | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/include/endianness.h b/include/endianness.h
+index 099877a..88b63db 100644
+--- a/include/endianness.h
++++ b/include/endianness.h
+@@ -113,8 +113,8 @@
+      && !defined(__FLOAT_WORD_ORDER__)) \
+  || (defined(__FLOAT_WORD_ORDER__) \
+      && __FLOAT_WORD_ORDER__ == __ORDER_BIG_ENDIAN__)
+-#define float_bswap64(x) bswap64(x)
+-#define float_bswap32(x) bswap32(x)
++#define float_bswap64(x) __bswap_64(x)
++#define float_bswap32(x) __bswap_32(x)
+ #else
+ #define float_bswap64(x) (x)
+ #define float_bswap32(x) (x)
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-connectivity/libimobiledevice-glue/libimobiledevice-glue_git.bb b/meta-oe/recipes-connectivity/libimobiledevice-glue/libimobiledevice-glue_git.bb
index 831d32cdb..d5d90ea13 100644
--- a/meta-oe/recipes-connectivity/libimobiledevice-glue/libimobiledevice-glue_git.bb
+++ b/meta-oe/recipes-connectivity/libimobiledevice-glue/libimobiledevice-glue_git.bb
@@ -11,7 +11,10 @@ DEPENDS = "libplist"
 PV = "1.0.0+git${SRCPV}"
 
 SRCREV = "ecb0996fd2a3b0539153dd3ef901d137bf498ffe"
-SRC_URI = "git://github.com/libimobiledevice/libimobiledevice-glue;protocol=https;branch=master"
+SRC_URI = "\
+    git://github.com/libimobiledevice/libimobiledevice-glue;protocol=https;branch=master \
+    file://0001-fix-undefined-bswap32-and-bswap64-errors-for-MIPS-ma.patch \
+"
 
 S = "${WORKDIR}/git"
 inherit autotools pkgconfig
-- 
2.17.1


