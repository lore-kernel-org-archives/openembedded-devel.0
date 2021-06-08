Received: from IND01-BO1-obe.outbound.protection.outlook.com (IND01-BO1-obe.outbound.protection.outlook.com [40.107.139.40])
 by mx.groups.io with SMTP id smtpd.web09.8284.1623126675386587760
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Jun 2021 21:31:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=kGcdq5uU;
 spf=pass (domain: kpit.com, ip: 40.107.139.40, mailfrom: akash.hadke@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y+8yV7QFsKZInsaOm9n8Nry/Cf8+dTMonaXc8oD8rhiIwpTrUOIT+R3J8MEUES2l2m7iNQjwAzGg0YjbGzL1kb2LXP7AfH0hS/OwoCFkmqU2ppdYhdgXG/S1P3fidHzmmdN1z7fEekh+0H3iLwJ9Ah7aQo2M4QrnWA+dnOst5UjfdQLRhHdWX0VNUC3GXL0DITabWVJHDOKSn96YdCrK3C+pu/v3wKDXigYMnBNhqTNUKwRVWfVDdNQ+UOcQVQyuNsahwG39QmKhs2zW8JXzj1U9muQ4yxEZ724awcquMWqA8+NLxGNQJogzrfotwp6AowFWz++01EX4yEDuucbN5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D8rTYnKxu+YgSZby4o3PPm+/9siIhkNfI/cca5kXbU8=;
 b=NVQnXA0Augys2tldCYpzHV9hmqPRC+EXNRma2LrSY9+cTFQzpLNgFIeEIZe3H6LiHOpsbUQhL20YOFWO8eJpBY52A6PzEVpSYj3M8oXLw6riuOirVOvlA2zQyf2cfbqBjp/JKh2s+R27/PVPYjIo0dlhOTRTNe79qaWpE7nmgGUDl1poEenpDEjprEbticURTG5lPhsOnDyH2rl2lkVAk/s5TTFjH2/JX6bdRlu8kQPowMNpOX+eztQwnVs3/iJkUw6WPYP1EcUb77yH9mxn9RIVzxESBt2af6V+/LCcE+sJVE6xWSaNHZKSIPFoiDw5Qxkl5RTUNk6RgP4eB43YJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D8rTYnKxu+YgSZby4o3PPm+/9siIhkNfI/cca5kXbU8=;
 b=kGcdq5uUaOlR900vD8Az/65KBfNNT3QFbm4q1QkBt8Kt2Zxmi9zyu6944lmRs8G/s2gnsOFxMgk9B6ZBiGLXdlhAR07EORuacQUO1Tp8g+1zRpwQKZtD3YNZii3ILKAx3HrDfNgHXiaklQNnT6/qmCLmUnD7iO3ecnztx+KqCps=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
Received: from PN2PR01MB4619.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:a::14)
 by PN2PR01MB4891.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.29; Tue, 8 Jun
 2021 04:31:04 +0000
Received: from PN2PR01MB4619.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::c962:e30e:1f2:44e7]) by PN2PR01MB4619.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::c962:e30e:1f2:44e7%7]) with mapi id 15.20.4195.030; Tue, 8 Jun 2021
 04:31:04 +0000
From: "akash hadke" <akash.hadke@kpit.com>
To: openembedded-devel@lists.openembedded.org
Cc: nisha.parrakat@kpit.com,
	harpritkaur.bhandari@kpit.com,
	Mikko Rapeli <mikko.rapeli@bmw.de>
Subject: [meta-gnome][dunfell][PATCH] tracker-miners: enable ffmpeg dependency only if its whitelisted
Date: Tue,  8 Jun 2021 10:00:46 +0530
Message-Id: <1623126646-9867-1-git-send-email-akash.hadke@kpit.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [2402:3a80:cb1:1876:861f:8f19:371b:f6bc]
X-ClientProxiedBy: BM1PR0101CA0034.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:1a::20) To PN2PR01MB4619.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:a::14)
Return-Path: akash.hadke@kpit.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2402:3a80:cb1:1876:861f:8f19:371b:f6bc) by BM1PR0101CA0034.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:1a::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.4195.21 via Frontend Transport; Tue, 8 Jun 2021 04:31:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d24b2efa-7c7c-4665-565f-08d92a3639eb
X-MS-TrafficTypeDiagnostic: PN2PR01MB4891:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<PN2PR01MB489162D902D38857EA3564378E379@PN2PR01MB4891.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	rSETFaS9XKABlIYn7F1IOE3y0CkQw5DAH0RK1JFA6JU4rCGmLj+cO+Mrxn6qrbtWZYNqeS3O5op+ijYNNNHT+rGHTJfdsbhavtz/ydgg0S6hUtGF57SDliK78aiVi15uAN/O+tyBRKCYZW5TsP12UBqIMfXnrxuxcYTG6Xf4lvBuwuA9FWwDn6aEq2vaOgbGSBom0KpUpyy8q5+qTHZv5lm0ruZ6zTb4eUJEJonegw0UmvhcARE8vJ69sbGV4qILlNh1B+D3oJbrMjNGZJCnqXIdVSByOH7KiMODRL1THxaSF8P0GPXzFlriUtgiwBixq9mYG3nGXmUVzlUdI/U2Yp3aE/skhPBT1U4QPZyMMhxi3AujHmFMTqzJs6GlRuzg61tOWf3T9ag55lVKeYGF1+Fca+nlqvIqSGR+GGQl98O/zf93ZTZyqTN9yltRo21bf7ydUA/EYTSQwcQQ8XLtio+WbRl2/gJEIM6Ga92YnPVo3MNvWA1pzsSLXRLCjDOoRriD8vZR3GPnHlPWra55jC1/67elvqg33O+YpA+5EF4TuZFZrUaXhzxbBjVuxxvy3ceFmBiAMxZyLZMjqqnxoF2HphZONkj2cmKeOBd4ZhufWcsFj1F9kMugcDXma0j7jSPx6LMGBW8k1pfllqsQTSwe5X1W040nbNCMwQybbcw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN2PR01MB4619.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(396003)(136003)(376002)(366004)(346002)(36756003)(6486002)(4326008)(52116002)(2616005)(6666004)(6916009)(186003)(6506007)(16526019)(6512007)(316002)(86362001)(2906002)(38100700002)(478600001)(8676002)(5660300002)(8936002)(83380400001)(66476007)(66946007)(66556008)(69590400013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?yxpJ5xqDYc7qLMBKcjk34aNdtfklEhTrppPVM4t6ac91gE+5fhuI/NN+lG05?=
 =?us-ascii?Q?LSGYNbKfvhizxhzV0gGI8/fNNAcakPuxmhVWm6J3yjaRD/6K4BsjBz/kmTcF?=
 =?us-ascii?Q?toRQX/jFL1BeD46ch7znUnKfdB2o1UrjsABjPFC4wDO19YCmAn6YrIearYzq?=
 =?us-ascii?Q?Ce6dUeutsuS1cMu+1zwtG8TeKDY5MGF4+1OUKsxlXG3vFBeQcys3wf2sUiDP?=
 =?us-ascii?Q?Gmz4fmUFeruR898aBMaBDzLwTyEgJ3mo0s1gyMcMqipBUvHJVcktjnGcllPR?=
 =?us-ascii?Q?sn1+kAnezeidKXqt52sMPaKlmrJRbo3XPXNbriDWmyt4M2Tj555zpLmxvs1E?=
 =?us-ascii?Q?4AEY1/OFZqUmFXLNiv8D0qx+t0o6ZMVYyQGrsVdUfzjqvCojFRccG6ghwtRw?=
 =?us-ascii?Q?8cNJuaajymd5Hy+DCAs2uPCRdg03ciquWmCTWPcPEF+ZCXpgx2Muusy7ERMm?=
 =?us-ascii?Q?yweWGyB+kuXDqesy1QU/qGBlg1Y9MiXaayz+u1378DbiKNwfQbNFFkDDS0/i?=
 =?us-ascii?Q?mcQ+j2Grbp3BLNlBAyZgq6YKhROaJ7bnodXllkYMlUt83301Iw6gX8jpDegs?=
 =?us-ascii?Q?9VQ+ul8txxMWf2BEEl/pGvfWoRMI1+nGOi0VWX6NdQTd90BZ6PiK8AukQqo4?=
 =?us-ascii?Q?D0WA9oUZ9Topl7Fo4Z4W8m+heiBb+ksqp7apdpuefAyF6spBec2dW3ZLz1tN?=
 =?us-ascii?Q?TVDRRB20WeLjgKTGp16vYlAYKX2lenI71cJ98dLOwzNDLE6vLdS0nB0rxMxe?=
 =?us-ascii?Q?TK/jz4z4ccAwup94/aAZ6hCZbgbU596WBnmjJxZzsbcvQxkJ5KJFLgra+pW0?=
 =?us-ascii?Q?Rg/BWDKl4Lp1D2QMbqlOmuz8egvkSkpDWJTI9A0ciIBd1TkU4z6ehDJS0d1U?=
 =?us-ascii?Q?42b7b5kmN10W7YFwfSirr4sCYVNfx4WMC2M/WK9YBDENipcRWjFAIY32M8XY?=
 =?us-ascii?Q?m6PAKhkYSuvvProE/UCEOlozSPpTD/GMYbj7/Lb57aQKgInBGQu7rLQ4eiys?=
 =?us-ascii?Q?njVEMk2T7iQ3OURo9vYP+Bj4vLXv8oz7u+ACGyOTVL0EAh1cRKj5x8CXjSrU?=
 =?us-ascii?Q?hJ1tGfRavwzDh42xH6HlGE1XYt3aYZhdAE+0WpZAKK2snqfXzhZCMGLhk7jb?=
 =?us-ascii?Q?1YDsFDAjtJ2EAH1yFNHin9bPrcn2/zIQnY5CB0M27JWJJtW35TRoXL7NQqlH?=
 =?us-ascii?Q?Kv4xsXqEadXxCNtYIcX9XxoSR4uZHDACLRAJH2wZ3ce0A9b0ZMYQ3zqT/GFU?=
 =?us-ascii?Q?DVbI3Rmvk+/7wudJKeMEG2czLt9DQR2DmlbeV1UVkTfpAAZkwPZl9zS3Fu6I?=
 =?us-ascii?Q?2tJLbxq41JJ1H58Jim5R4slbkv7CF7A9+FGahLkz9A/pU0n9UVR3mHomev0B?=
 =?us-ascii?Q?kDD2zmi1tTsmKXGK0WgZV9efVuPQ?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d24b2efa-7c7c-4665-565f-08d92a3639eb
X-MS-Exchange-CrossTenant-AuthSource: PN2PR01MB4619.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2021 04:31:04.0659
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /RoiG4lUYH2m2Z21cFr33Qxb3isXF2TzjfFXDZz/gXzmr/IqnSe0HYSwgfXoQkHoP9ML1wX3I15MpkYj1uMwvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2PR01MB4891
Content-Type: text/plain

From: Mikko Rapeli <mikko.rapeli@bmw.de>

ffmpeg isn't enabled by default. Fixes yocto-layer-check error:

ERROR: Nothing PROVIDES 'ffmpeg' (but /home/builder/src/base/meta-openembedded/meta-gnome/recipes-gnome/tracker/tracker-miners_2.3.3.bb DEPENDS on or otherwise requires it)
ffmpeg was skipped: because it has a restricted license 'commercial'. Which is not whitelisted in LICENSE_FLAGS_WHITELIST
ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'tracker-miners', 'ffmpeg']

Summary: There were 2 ERROR messages shown, returning a non-zero exit code.

Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
Signed-off-by: akash hadke <akash.hadke@kpit.com>
---
 meta-gnome/recipes-gnome/tracker/tracker-miners_2.3.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/tracker/tracker-miners_2.3.3.bb b/meta-gnome/recipes-gnome/tracker/tracker-miners_2.3.3.bb
index e2ced39..ccd22a0 100644
--- a/meta-gnome/recipes-gnome/tracker/tracker-miners_2.3.3.bb
+++ b/meta-gnome/recipes-gnome/tracker/tracker-miners_2.3.3.bb
@@ -24,7 +24,7 @@ REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
 UNKNOWN_CONFIGURE_WHITELIST_append = " introspection"
 
 PACKAGECONFIG ??= " \
-    ffmpeg \
+    ${@bb.utils.contains_any('LICENSE_FLAGS_WHITELIST', 'commercial', 'ffmpeg', '', d)} \
     flac \
     gexiv2 \
     gstreamer \
-- 
2.7.4

