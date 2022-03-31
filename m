Return-Path: <potin.lai@quantatw.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33DB3C433FE
	for <webhook@archiver.kernel.org>; Thu, 31 Mar 2022 02:17:07 +0000 (UTC)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (APC01-TYZ-obe.outbound.protection.outlook.com [40.107.117.97])
 by mx.groups.io with SMTP id smtpd.web11.2397.1648693026246624368
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Mar 2022 19:17:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@quantacorp.onmicrosoft.com
 header.s=selector2-quantacorp-onmicrosoft-com header.b=3rxV/F3x;
 spf=pass (domain: quantatw.com, ip: 40.107.117.97,
 mailfrom: potin.lai@quantatw.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oh+qaDXol8LZS/GU2KO73emOdrHO/kvlJuM6BBsURq6kEl6T/ZeKOZ8NLxfdjOoRg7Kdbl7q6FCxO+P8kDaI7wZqB1Q1pu+PpovJya2rG1rE4Xyv8ifyWDyNvK0Q3mboaCOtcPOUtTy9e9d0/3BYLIb9sdKX9H4HtyTUpwHRPDzDuJr+G3bXZI4ebh+tCJqNfRAsJBr3N3QbOvWywoUvGsGXOhGQ0EuOSPomrgRkJsyv0gM/LjDFbDCX8ddzv9UX6Q/dioUk+s2ZX6oB48WETtA33UjUdA8Qt0Y+Khjnh9gu2pp6Hmy1Si0oz/9iLbg9d82gNU2202FbOCM1zK6Uuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FVDQX8gh1HLReuuYqhZ7CUJjkkLJXtX8iXXDrkY9yFs=;
 b=XYRSsxRclpq3irDl/7bp4NZ4f6ZlyggkdKX96b+n6Cm+8PsY+oojaASIVDfnvVUfsuniGL4MBpUQmr8GtE6e1EOcGN1EzRu9LqXpnSG5zglUyrHhTGUMTEXAiw/23tTNCdwrgpPQr0Ua/EXiqxw/AvmPIUA7O2txmz5qn0l1Zmc0/KT23X4eT5nO7XZV62qmGgTkrcUxFK2fJy4LdIw1uh8kEyp4jVGcfpmunN3oyQ2dG2rZ57C6ZjCD1ntqfjfaV9WUykw4qfBeeRELIfxLySf0iygHdf13/LSQVlQ7X2wRrkPKONlLjokQhCN39f7w9e5E7zgzFJnT7Aexx+RAGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quantatw.com; dmarc=pass action=none header.from=quantatw.com;
 dkim=pass header.d=quantatw.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FVDQX8gh1HLReuuYqhZ7CUJjkkLJXtX8iXXDrkY9yFs=;
 b=3rxV/F3xV5LHFb7jGyQ9JbHpl/G0VzzvS+4M7S9+we5TiLxJeHUuUvtKbpgrop00uAe1BCkpAyk+xPj+h7l4WEmDJeBccVBZszTDDq1TBqykUKb7u2Pm7QTnsKCRwmnClXOQr7orWwfQNj27pHpRlr3NYtkYdmhh9aaTR+0MWPQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quantatw.com;
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com (2603:1096:203:89::17)
 by TY2PR04MB3984.apcprd04.prod.outlook.com (2603:1096:404:8002::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.21; Thu, 31 Mar
 2022 02:17:02 +0000
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::7cfe:c9ba:7793:f42]) by HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::7cfe:c9ba:7793:f42%7]) with mapi id 15.20.5102.023; Thu, 31 Mar 2022
 02:17:02 +0000
From: Potin Lai <potin.lai@quantatw.com>
To: openembedded-devel@lists.openembedded.org,
	raj.khem@gmail.com
Cc: patrick@stwcx.xyz,
	Potin Lai <potin.lai@quantatw.com>
Subject: [meta-oe][PATCH v2 2/4] libimobiledevice-glue: fix undefined bswap
 error
Date: Thu, 31 Mar 2022 10:16:46 +0800
Message-Id: <20220331021648.16582-3-potin.lai@quantatw.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220331021648.16582-1-potin.lai@quantatw.com>
References: <20220331021648.16582-1-potin.lai@quantatw.com>
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0150.apcprd02.prod.outlook.com
 (2603:1096:202:16::34) To HK0PR04MB3282.apcprd04.prod.outlook.com
 (2603:1096:203:89::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6547b5a4-1715-42b5-45aa-08da12bc8a75
X-MS-TrafficTypeDiagnostic: TY2PR04MB3984:EE_
X-Microsoft-Antispam-PRVS: 
	<TY2PR04MB39840A2482598212990A33948EE19@TY2PR04MB3984.apcprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	M3XRrQSem9K+1CpLFgna71hNZzWMM8Ojhjs4f2q01xGmAgKUeDQFDqBgYkRYpHturEw7KxW4tXO4jaJIPOlu1f3VABXrREkWSzp6cbjiOfXda8PbWrx6YxHrijSqIwfJ1Ry33FgSLo/uxNa7BPa7gU3wwrN/7f4SuxVQAbdcZmtjlfcPeeVEnc9JxX1txMYbzh7eg5wvM5LeHQBzIVDmq1fHZQADveZFPCFahaBAFaDesvzXGzvKE+B//y//Blr0nlJ3yXxwe7Yizy3Ffi18B7Ip4TkeVLdIYAkX17qcR6rwgAvzpSF5OK8DTPHb7Oz1Vr9C8dvR2ZHfadb6Yze1eyBm4vSPKFjpkDlT19ivyfmybADJA4y24wchFaZQSkxRWhUpcZYZzyp2h4NRiwkJdm0F969a525W+iA2wvEP+jdLRM7TO3Ibk5cClrG8ZSDq6pmyYPiKe75Q5An1wAc6kl8mcKoNpHl7LU0dUYOKPZm4NLzMErx7hWh0iBHzGa0zkFE680kDg6BVo+Q+zCbIIw3aLTvcnIjqRBTVIpWZilXNzQxOFIQ+q5ES/6nc7fawG8YAd8Sdw4ZibbBa+gRPUSLiiGmnUagekpQkALkK8LVCBlthMXbhtTMk++zVB4aFC99Ypecs5O7jzMoJBVjp96hudeKNCh2KlnYRaw8B5rlqfkCJ7k3pL1C8pNQDeit7A9kw9zDs+2D1R8E40RxH6MEGKK2/VmAdDfA6w0F5HSU/ZZHdRrd45uVuDRBzkCnVPfF23NT55fOAjCAhaj6TTOy48ymgGXgLW6Dig6mVE44=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HK0PR04MB3282.apcprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2906002)(52116002)(316002)(86362001)(6506007)(6666004)(6512007)(38100700002)(66476007)(38350700002)(2616005)(83380400001)(26005)(4326008)(107886003)(1076003)(186003)(8936002)(44832011)(8676002)(66946007)(5660300002)(66556008)(6486002)(508600001)(36756003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?9dKM9qYcs/gNdzqFoyLhfJ0kYzCWGqAmlCa+CRGPlniKpKRdSMJEsOFOkwcs?=
 =?us-ascii?Q?Ixscx+hax71CB0D79o4e5pV2+/7OJ75AUEDn8NC5MgUL0hwHOnjOry4LhoHx?=
 =?us-ascii?Q?6tZhAVHcWhtKCyvEMTwvKJE3F6b4vtHNidV8plqOJLhEKJdDrnuCkHClTfCZ?=
 =?us-ascii?Q?a+QM7uN8DQE6ZG0C1mkjSuPP7LFR3jQEaltFugf1+Z9sLpr/+r4G1Y7IS2+9?=
 =?us-ascii?Q?QWCONpYHC3TH75pS4candh0SmqF5pM4r4AXexqIlVNM2OE5gK5RqlR4Y7gVN?=
 =?us-ascii?Q?JvQf31bJ19Qt27wU+vPOTTOmiy8C5MUUn5LXvbdoS8KZAznAWdv+VHSXEekl?=
 =?us-ascii?Q?/k3Sg3XpS44WNXU9lCAmF6/fbtywPssNaU3M7cZa8QTUCfyra08XdUeSTbtt?=
 =?us-ascii?Q?ABvXkJONipZVRj/M9qPVLUTbAzu4EXS+8WoXPkG50yAUckNSUtUykfRbmYig?=
 =?us-ascii?Q?l8gsCW4kUzX8jt4Ucd5zdgsrPSMduzzcRCkz3+fNWZLSuidXA8C2uQZ0bpq/?=
 =?us-ascii?Q?Jq1f5zbvaMNaYBZCsmrrP2XYtQjotzNDqQvOrfxGdQY2aaWRi3JAaS/I2Ync?=
 =?us-ascii?Q?PekaCPbewsHUbfJaLcUIKef9sRAb8brAJESmgVFKIBkMnSIiZCH0kIk1lMYf?=
 =?us-ascii?Q?0BbdnDLTtEyVHjT3rY8cALs9YyHpFiEnIaQYLQ/TO3saz3ITudw4OWUFyrju?=
 =?us-ascii?Q?cB0q5xhOvbDGCdK03ReoObT4+6WP9xkesL1izGgHSio+CrBsSSIyUWueBTf0?=
 =?us-ascii?Q?nH8+a3h5KkRj/cY1i2GNQ5w5GhzD1NABJvHhhk4MipZ0+lBsRAhVoxrZp1H8?=
 =?us-ascii?Q?P1lm2X9L/n4yIwWV4dUrxk5ewKU+zuHAYH8bMW6zAZvmJc+vZ/plgomA2k1v?=
 =?us-ascii?Q?85KkzgRJmao4laSn30488rmXZYcvFH7v8Bjmar72ObM/s9bO/pukq4JW0a9C?=
 =?us-ascii?Q?rxfa/Oh1y1/+8As18dHOx6rvhd6e1dl1orq5HrctQYDVUrgjApV2oDIi+Rai?=
 =?us-ascii?Q?SMrZ6wtBw4gPPwJvJfSoFERs/1JFbqJqoYZZUWXb3FoF58/KRT8PV36ngsFZ?=
 =?us-ascii?Q?f2fDiRtGsVwPGC1+6EuXwV6aMy+mdhP6VsqvaK1o/ZxUuaaeSwl9oWdTx/2/?=
 =?us-ascii?Q?h65BDdrFz76XxR+ViIDTgp/cA88qY/iSyPpflVRIwpLi89ilNVqvGOod24mO?=
 =?us-ascii?Q?UEHPgUcM4wkH1StgrLhfKNkg6Xw7HAbMaNoZ3+1lbw0c3jB90GtTIB20ptxq?=
 =?us-ascii?Q?Ns/0Dh3RK4i8Dok1E/M9GJPbRRnEn5BMTVqWlfINmnWv3oXcpIJuqbrRkQAv?=
 =?us-ascii?Q?CYZHx1cLP+ih2DBJKTkC9sA+Mik4wbI+KJNnp74HGyd59dEJ0YFmy+8BuA4y?=
 =?us-ascii?Q?5c/fV/KToXwW1XZX59BlI0QQPwXLPFjPu2u5kTz0XoyvlUobkswvviQ8wXhI?=
 =?us-ascii?Q?uCTDYT6TSm0THZZGMx2B8HQWy9StKirmpzcLpioSEjsNUg7UwkOqtylnGWxj?=
 =?us-ascii?Q?phOkQMKi6HxG0wx2XVV4hBjhE7WgqEsYAIlQ6NHfHGZkj1mtygKXYIwaA1FH?=
 =?us-ascii?Q?uM0wRKNk6asY58XjzehBjnYIflo6Z87VdLINl2a975opyfLLHFyKDCG7odwl?=
 =?us-ascii?Q?9q2gS1/u+gxN1UdQ/XWl40QDoMayj4CTwx/EZlgGYcjLLWshrLIZDCmYxpeD?=
 =?us-ascii?Q?tP0ybREmORYcbrfCmXM5KOuoCfuoZ5gOeywcOrfbnVvbBCXDdhOdAcDoKcjZ?=
 =?us-ascii?Q?5NoSFlrAPl8X9VJhGMHt2rzaMBQSewQ=3D?=
X-OriginatorOrg: quantatw.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6547b5a4-1715-42b5-45aa-08da12bc8a75
X-MS-Exchange-CrossTenant-AuthSource: HK0PR04MB3282.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2022 02:17:01.4470
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 4GHtt8uN8/Nlm0iN8FLjoHAPZiIaam4ZXn/rRMZniCApTB93gIwEPVNPPDU7KAwK6EUtz3FxM4Znbgz8Ut+7eA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR04MB3984
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 31 Mar 2022 02:17:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96277

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
index 28303d082..297a7d427 100644
--- a/meta-oe/recipes-connectivity/libimobiledevice-glue/libimobiledevice-glue_git.bb
+++ b/meta-oe/recipes-connectivity/libimobiledevice-glue/libimobiledevice-glue_git.bb
@@ -9,7 +9,10 @@ HOMEPAGE = "http://www.libimobiledevice.org/"
 DEPENDS = "libplist"
 
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


