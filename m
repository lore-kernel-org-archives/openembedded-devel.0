Return-Path: <akash.hadke@kpit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4004AC433EF
	for <webhook@archiver.kernel.org>; Thu,  3 Mar 2022 03:31:26 +0000 (UTC)
Received: from IND01-BMX-obe.outbound.protection.outlook.com
 (IND01-BMX-obe.outbound.protection.outlook.com [40.107.239.60])
 by mx.groups.io with SMTP id smtpd.web11.7029.1646278284666903291
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Mar 2022 19:31:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=eFsb3rgE;
 spf=pass (domain: kpit.com, ip: 40.107.239.60,
 mailfrom: akash.hadke@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GOabFBhkIJFN+2pp7cdM4sjgAM+gE4Zc0kWMzzG2cJSjP0AL3ztUJJXaE+iFqEJxS0c9Ki0HxwFW3fAYaXgKcC0oLr7fM3AG/zJ1/PAZyzWzixT2x2SomIX2qt2SSQ2Uj2SpBa3EIwFLIZ/HNo/jt0j6KY1e16TgK4wQNhD7ABaCRhdMxYNNOmKS3M814kHNuYxOaGiGCc4+7p+rQScwsUJtZsT4Kis/L1o9VBn1DkCjYbvjuRPhj7lq5wXs9YPTlN8Fj4RHrOWdpUM7fggn7cbl/0K69CAAQ3BtRQQaenW7IiYPvao2lmXZhgQ/ZheWWw80q4rJlQXwA6oW0tZaGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LXrUG63tyCciX48npbXBrLTydukwD+NTLx6icrTFhsA=;
 b=ifenkaxdWtz2fO0frmXsbIoQfYkUnYOKVepF1ASYhdhy5hVxQGd1x9+n71lO63iRmm5gaX97Xz/1uPTicp7gDcFKPslvWDm3IpoHTd/RrP20Hl2FUPsh0xfqr/LqCWaeKD/MbO9qvqUV5FkTd7ZXNNhP5VydcY+3wdSTgcKPJKxYuR5GNkuTMWw6PPyVMBery+s7wurViRV1H5lMSSv+PEu4pancrGERsFjueER3hDCyKKYD03Smk2UmemeiF4/2YtQWgGGshsDl1xQQBU5Tz+geUhiCi0PvuIExpmqt4vvZSrGULdYEbE2GzReUZo2+mg+wjVCGa7jbEUh5hdZd6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LXrUG63tyCciX48npbXBrLTydukwD+NTLx6icrTFhsA=;
 b=eFsb3rgEzuiUt4u6Vc5jPz4nf7TcsY3XaixumzLrNAB3cdHSgX7jCvCJEb2UlYV+VDXgGDow6GR+vukIjOSqKdb+CO+1try+IXuqaOqEZZGKts2n/TgErXvImrLwCBcbspzPf6Xd1F2BrX2F4z4g7sW9+8id8h0n6j84DrZXs6w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kpit.com;
Received: from PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:89::13)
 by MAZPR01MB6691.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:1a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Thu, 3 Mar
 2022 03:31:19 +0000
Received: from PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::f4eb:f19e:e688:229a]) by PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::f4eb:f19e:e688:229a%4]) with mapi id 15.20.5017.027; Thu, 3 Mar 2022
 03:31:18 +0000
From: Akash Hadke <akash.hadke@kpit.com>
To: openembedded-devel@lists.openembedded.org,
	raj.khem@gmail.com
Cc: ranjitsinh.rathod@kpit.com,
	Akash Hadke <hadkeakash4@gmail.com>
Subject: [oe][meta-networking][dunfell][PATCH] tcpreplay: Add fix for
 CVE-2020-24265 and CVE-2020-24266
Date: Thu,  3 Mar 2022 09:01:01 +0530
Message-Id: <1646278261-20278-1-git-send-email-akash.hadke@kpit.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-ClientProxiedBy: BM1PR01CA0097.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00::13)
 To PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:89::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5a92f4dd-bf3f-491e-9ff3-08d9fcc647a2
X-MS-TrafficTypeDiagnostic: MAZPR01MB6691:EE_
X-Microsoft-Antispam-PRVS: 
	<MAZPR01MB6691EDA2CDBC056A5236CC1A8E049@MAZPR01MB6691.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	gCobIFdoyjDhJxDWHJ0vmM2tq87m8t+tTFI6Uk4//OnsVZFz4jYZoafpKlXl+SiUqYs6ppy8auBKAxVu2uhCwqErZmVkePeAlmIj/h9haPbgN0G9Zbm4hPQqUNUyQ3JU+EVjzy1Wft9X4rBSDv+Om7F5W3rhv5P7Jt4ujSWfSHvdOqqQCGrWnKeysuAw0SX7pn5L8PQQKravyGxRNwoWWn/vIXFTVTOWzpxa8zHpdhE0UHy5enbhqb3gte043Zk+Pzb5vUJwJbJ79q3fUwa7n7QoXfLM7vdsDaLwWcuLM4tph3FMFSKe5JF23Is+womO+yDoPpaJUihuukVSWCqjFdSiBRixCmlvLKgoBfIPJ7xKwuI8hXGAkqj1TNeeJCBoOoGXnGVYb5l0EZ3mHlGtkwuCeI82KbiWLivneSTS3HA9sPHg9QCa236dgCeHP0tcUyPwaZ2zc8WNAcr2/8q9Bc4TLiGmed2m3sejpuoYsdITtJwRM844kT/QHVLNjk6SVOHkzJME1BAxNdfmVhalj0m85PzwJf0o1aIPsfLtvbE4qculkgRx3M+keGUgOmEReF9nnFjlZgJ8Mp7mQrlKxUSjqVISRJqy7Yuqx1UsCnGZzyW/tw6mkZeDfGZWXfGbe6rpHbaAmSMvGgOtMM487h1nLrcKN3iSJ2QohNG209U3mFg3yo9KMm1LVhcq2zkQPjSs1gNJNOEyUL6+1qjl9wZll9hUxESL0n12KvNHnVfqFVuZj6K3GCjolmxGW8AvV3I9dh2r5vLxlzR//bRpZA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(83380400001)(19627235002)(52116002)(6512007)(316002)(6506007)(8676002)(6666004)(38100700002)(966005)(6486002)(508600001)(2616005)(2906002)(44832011)(186003)(66476007)(4326008)(86362001)(66556008)(66946007)(8936002)(5660300002)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?1d+uvWSvBeKu7XBSlHkYpR+G6QlC6jT5LlC5SZ8xfkf7ws67vFcMvK15o7l9?=
 =?us-ascii?Q?08hVU8dUQJPOzaie7hPPQYMHFiJJwbpUndbUBpMgWwNcinsLiY7/yo3JQyOQ?=
 =?us-ascii?Q?kgL9s4QzwzR4SckVt9jKkBby4zgLhbDyN+q7oBlupoy/4lGx3ft7F/Dj2RYu?=
 =?us-ascii?Q?rW+jFEx/c0UFqWRrQv/EV5E5zNCiD5sAUYxc9Y79Z8Cf8lhxXXyRertUnB33?=
 =?us-ascii?Q?HGJSenk8vMGq+ERymqxFJDU3ZzGEXtxzBvvhUiGWldsVrC/YsT69v1k9XfJ+?=
 =?us-ascii?Q?9aIOVWvJ4splPJh10gdDPJgyh+KEwXIyH6SbrZ0pnzhWJlZCI8fF4e9zH9dV?=
 =?us-ascii?Q?YwXFmUDuo699N4xwGwaUPvjbk/KrNt7NxcezCZfJIDqqTEpm83p3P2irmIL0?=
 =?us-ascii?Q?XMvG3LW5Ad6dXuKQYZ9ftDB3zA9cjCn8iM7vWj/cMHRRVbUetoe6JbNFWE3l?=
 =?us-ascii?Q?BoO+rTkr4WslGTRJxc3SgyJ+xvW9hU5KVLNtKcTdtFwkH22RgTncjLv2/Xp0?=
 =?us-ascii?Q?ptO79VPV4Zxro7Bpfd5XjeFpbxLDCzp/fq3t5dHDBDMontYPNNWSb3TjvWBT?=
 =?us-ascii?Q?Wd9UlIHIRA4CGgu7DVg1r0pZOr8zsjlGDhtwoxUh9Ksrek6bHF7jmyHrHYQ6?=
 =?us-ascii?Q?5F2c7UVdg8z7ufahJvwbtGEvZg9koD/Z6WOgr3m6C09JYk5PrZpB8NToAJQW?=
 =?us-ascii?Q?U7ty1H3ZCp3up4OzcqTqauNTWmLpM/Fa0CZPPBfGCFsakJ/g5piht6I0Qtv4?=
 =?us-ascii?Q?oZnUVlz2D8/RhtD1yEy3NFdF7SbBmKZj+cmOdao5KivEzkOnyYw6t3vOXvlJ?=
 =?us-ascii?Q?O/Bi/ZJZEcgKpZsV7NhKcnUzezZ9GkAvF29l78XKO1GCksfMw7r12yeXnbyS?=
 =?us-ascii?Q?tBelAjaC1u0yoZA3I5Zd1TX77gMUGfaacoSpX1dMLeNJbPEccW7YTYWzmxM8?=
 =?us-ascii?Q?IsKjVn/2VoNmtVkXZZNO6eayivCL9sahaf/HQiLDo645jpU6Hsp4i7RyykrE?=
 =?us-ascii?Q?t0sxSpHyqiJUxmOxIXZl4MrTLJtEqTjuA39E2iBvbwWMRdidh1XLVZuM4zRQ?=
 =?us-ascii?Q?fy+R7Hn5LMNwhuG46CXFHtGAQ/u084VeLm/lMNLTavhoQZbAA326at48SQQ4?=
 =?us-ascii?Q?Gx4dvwSaFXDwzUsPMjd/nM8U8+bE96tlcp/4tUwJvdL13+lQ+EV6fXI+c9Nv?=
 =?us-ascii?Q?jT9ZuEqJTwJNDqEsr700AVUkpSI5wWxJjhaZPXzshtqB+WjXbZqDjJl9V8hM?=
 =?us-ascii?Q?oznez1nv8DE64VJO1Fmldtdi5wk5g/4KkltLWzJUypJNiplkpKUgTmFk+3U9?=
 =?us-ascii?Q?EAp5I6fx5Cw136nSomWh4Dz11WlcTbE9k445YD5AS/R9vj04NrK76N1pXfAA?=
 =?us-ascii?Q?0BYX/kyVJKXMi/hRohX9RoRMqUlz77LkWgCJTDtvy3HY8eHRKCSoSYWLUmva?=
 =?us-ascii?Q?QUv2hYNcJLExZBNvqER6JFva2t1LzZ9bW4GUkxSy1pOhrM/WXBfP73QC3X5O?=
 =?us-ascii?Q?AtmczA79Zd8JWNK/sf70BMsGO3IkYBNpvQIvxxHshrYBOOLB8xX+C03p0q8O?=
 =?us-ascii?Q?HN0Hj85mhWLMfdVPCV7ot4OSESeENv44jiY7jwLefgmo6UCVlKNmCAA+hEBs?=
 =?us-ascii?Q?QzGfMbpYkbZvm7jl0OAu37mAjPcNmH12+uxJKUnVkwFipWvdI3eQqtE2FkTv?=
 =?us-ascii?Q?YgOtFFvoprmGMiliypr+X2jR6F8=3D?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 5a92f4dd-bf3f-491e-9ff3-08d9fcc647a2
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB6712.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2022 03:31:18.8949
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 c+WpSlgraJMxJhqDyomb6gLSqzyS8GWZkY14jGX6nRZCpBoRW/STws4hKolGONQgSIBVT3lB7e79bX93tGmVGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAZPR01MB6691
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Mar 2022 03:31:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95723

Add below patch to fix CVE-2020-24265 and CVE-2020-24266
CVE-2020-24265-and-CVE-2020-24266.patch
Link: https://github.com/appneta/tcpreplay/commit/d3110859064b15408dbca1294dc7e31c2208504d

Signed-off-by: Akash Hadke <akash.hadke@kpit.com>
Signed-off-by: Akash Hadke <hadkeakash4@gmail.com>
---
 .../files/CVE-2020-24265-and-CVE-2020-24266.patch  | 37 ++++++++++++++++++++++
 .../recipes-support/tcpreplay/tcpreplay_4.3.3.bb   |  3 +-
 2 files changed, 39 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-support/tcpreplay/files/CVE-2020-24265-and-CVE-2020-24266.patch

diff --git a/meta-networking/recipes-support/tcpreplay/files/CVE-2020-24265-and-CVE-2020-24266.patch b/meta-networking/recipes-support/tcpreplay/files/CVE-2020-24265-and-CVE-2020-24266.patch
new file mode 100644
index 0000000..3ca9a83
--- /dev/null
+++ b/meta-networking/recipes-support/tcpreplay/files/CVE-2020-24265-and-CVE-2020-24266.patch
@@ -0,0 +1,37 @@
+From d3110859064b15408dbca1294dc7e31c2208504d Mon Sep 17 00:00:00 2001
+From: Gabriel Ganne <gabriel.ganne@gmail.com>
+Date: Mon, 3 Aug 2020 08:26:38 +0200
+Subject: [PATCH] fix heap-buffer-overflow when DLT_JUNIPER_ETHER
+
+The test logic on datalen was inverted.
+
+Processing truncated packats should now raise a warning like the
+following:
+  Warning: <pcap> was captured using a snaplen of 4 bytes.  This may mean you have truncated packets.
+
+Fixes #616 #617
+
+CVE: CVE-2020-24265
+CVE: CVE-2020-24266
+Upstream-Status: Backport [https://github.com/appneta/tcpreplay/commit/d3110859064b15408dbca1294dc7e31c2208504d]
+
+Signed-off-by: Gabriel Ganne <gabriel.ganne@gmail.com>
+Signed-off-by: Akash Hadke <akash.hadke@kpit.com>
+Signed-off-by: Akash Hadke <hadkeakash4@gmail.com>
+---
+ src/common/get.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/common/get.c b/src/common/get.c
+index f9ee92d3..0517bf0a 100644
+--- a/src/common/get.c
++++ b/src/common/get.c
+@@ -178,7 +178,7 @@ get_l2len(const u_char *pktdata, const int datalen, const int datalink)
+         break;
+ 
+     case DLT_JUNIPER_ETHER:
+-        if (datalen >= 5) {
++        if (datalen < 5) {
+             l2_len = -1;
+             break;
+         }
diff --git a/meta-networking/recipes-support/tcpreplay/tcpreplay_4.3.3.bb b/meta-networking/recipes-support/tcpreplay/tcpreplay_4.3.3.bb
index 39be950..557d323 100644
--- a/meta-networking/recipes-support/tcpreplay/tcpreplay_4.3.3.bb
+++ b/meta-networking/recipes-support/tcpreplay/tcpreplay_4.3.3.bb
@@ -6,7 +6,8 @@ SECTION = "net"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://docs/LICENSE;md5=890b830b22fd632e9ffd996df20338f8"
 
-SRC_URI = "https://github.com/appneta/tcpreplay/releases/download/v${PV}/tcpreplay-${PV}.tar.gz"
+SRC_URI = "https://github.com/appneta/tcpreplay/releases/download/v${PV}/tcpreplay-${PV}.tar.gz \
+           file://CVE-2020-24265-and-CVE-2020-24266.patch"
 
 SRC_URI[md5sum] = "53b52bf64f0b6b9443428e657b37bc6b"
 SRC_URI[sha256sum] = "ed2402caa9434ff5c74b2e7b31178c73e7c7c5c4ea1e1d0e2e39a7dc46958fde"
-- 
2.7.4


