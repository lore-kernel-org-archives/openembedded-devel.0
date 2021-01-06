Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [])
 by mx.groups.io with SMTP id smtpd.web09.11967.1609956219729095706
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Jan 2021 10:03:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@spinetix.com header.s=selector2 header.b=Zxooqefg;
 spf=permerror, err=parse error for token &{10 18 spf.infomaniak.ch}: parse error for token &{10 18 app.mail.infomaniak.ch}: limit exceeded (domain: spinetix.com, ip: <nil>, mailfrom: diego.santacruz@spinetix.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GFQfpjM+Wcfuh6mN+lBq2lD1eNZJaCjK+Xe8G9x3yzL8YKl1t3mfVvD6u1QJ1fDDSwFRMHnBXk3CzR80zPv+UAFWrJwKX69sC5iGzcqML38OIW3/v5ihUxGbl7x1pUg4KmClSj2xtzBuzDK/GMbT3A5uUW4Qjv6+0PNtZm9WnuD/wgihs2B/BivwFdQ9YCsB/A8ogWXSQg3Blzt+DDH6kP5UdcUjpbxEPy88qfTCeUdudhBWAxiBoyfiw5W2Hea69E9twxRQPiwQiqPJQmtuncfZczmlRk/NLaAH7Tv+ngPGNWAyyIXwBL3yKBGn0iLNEw6MzeV1zfB++W5hg8L46Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bkxOT03NsYbIfgldP43cLNHHkhFek2rAOHtVDgz+RW0=;
 b=EZCt1nMNAmQC08wGNyEizDtuGOnhlxh+xsgkk18jNBG0S6ZSgVH1ENJ6vaAUmhzKPZ7ary4eTI9OpKlPqbbkj51qXnv74QS6iiw4aWfrU9sRObcuNLwYXZ58qqsotkj8FG00RBauUy5JhVLk7+FjTguNc+SSeXYKdBD3FH/jzUDB78bJB4Mr6Opik02n2SF3FL0ane8ALyZnwmhkCCyDYdReXvEt0COBF2k8G/CZBoIiUkaRUuxt/M8sdJgEhLgTgPnc5dLmxVriq1C9e2LSleUsDe15TsK/Hus1j/1IwQuqmUys1mwLdBQ2z0hMWEpg92948vruxntAcOv5VOumGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=spinetix.com; dmarc=pass action=none header.from=spinetix.com;
 dkim=pass header.d=spinetix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=spinetix.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bkxOT03NsYbIfgldP43cLNHHkhFek2rAOHtVDgz+RW0=;
 b=ZxooqefgORkc9TSzQRlPXeywiav2qM8F5ACQErgMljghK15LzAmjHCKh7WPovsEDRMN/AJog8lSl1VpKe2Ss/09yle8qpK7HBm1q1m/HIgFRrl7SD2bKU2kd1aULxz/5KEkfFuYP+OXWtvLst0bleycOAKK8eo+PSlG2s6RHLoA=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=spinetix.com;
Received: from DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
 (2603:10a6:6:e::19) by DB8PR01MB5674.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:10a::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.19; Wed, 6 Jan
 2021 18:03:39 +0000
Received: from DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
 ([fe80::c880:793c:c5b1:c7a8]) by
 DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
 ([fe80::c880:793c:c5b1:c7a8%5]) with mapi id 15.20.3742.006; Wed, 6 Jan 2021
 18:03:39 +0000
From: "Diego Santa Cruz" <diego.santacruz@spinetix.com>
To: openembedded-devel@lists.openembedded.org
Cc: Diego Santa Cruz <Diego.SantaCruz@spinetix.com>
Subject: [meta-multimedia][PATCH 2/2] gupnp: Upgrade to 1.2.2 -> 1.2.4
Date: Wed,  6 Jan 2021 18:59:42 +0100
Message-Id: <20210106175942.18488-2-Diego.SantaCruz@spinetix.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20210106175942.18488-1-Diego.SantaCruz@spinetix.com>
References: <20210106175942.18488-1-Diego.SantaCruz@spinetix.com>
X-Originating-IP: [46.14.255.78]
X-ClientProxiedBy: ZR0P278CA0103.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:23::18) To DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
 (2603:10a6:6:e::19)
Return-Path: Diego.SantaCruz@spinetix.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from prefix.spinetix.local (46.14.255.78) by ZR0P278CA0103.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:23::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend Transport; Wed, 6 Jan 2021 18:03:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a59045aa-b929-4921-9fec-08d8b26d65a1
X-MS-TrafficTypeDiagnostic: DB8PR01MB5674:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DB8PR01MB56746FFE7420BDDD2D420F9288D00@DB8PR01MB5674.eurprd01.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1923;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	KGwleJjjgp8hhkzBSI8yM5y9g6rfIV8UiyGC+zweHwNyiCwqkndGrAnoFMors+OGe1aRWBvB0KSdF6LTNfUlWBVPtFy1GgtqhfmORGqMfgni6lyA4qjRfj/fnuID9W4HcfNRPbGoUcZNerORzofSCs3QeOHER43QpO1GQyLM7E9XkwzPiL5WMKKGOOq2CoHfFQHPaBD7y6shRT5T5vpqef6eAroXQx4KP9GnSxos+Vn0AiVmyETuzR9zlkhg8p9+ObtlW24+OHVcgq9BoTQZNXtE782PHlNzNoo0Sgm6BoVEXs6TYITLXWrJN21dfnRW03+8azt20FndI1BKepa+YTLxRIxlNJrvyAwvNQoNELKFCMrWJ6eU9iT7LkN5B8Y0PKwqHudI/2OYx9GAro7wTw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0102MB2630.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(346002)(39830400003)(376002)(396003)(8676002)(6486002)(316002)(86362001)(83380400001)(6506007)(52116002)(66946007)(6666004)(66476007)(5660300002)(1076003)(107886003)(2906002)(66556008)(4326008)(956004)(36756003)(8936002)(2616005)(478600001)(6916009)(26005)(16526019)(186003)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?2sZ0kgLmqHn/aVJ/uohlXhW7rTt8HwUBijxz2n/ZG6afGtgpsWi0JloPO0ZC?=
 =?us-ascii?Q?uax1rKLVy3e1Pxnm4UOVk/Ei5YUlKnEr0JmUXc/o7gWnuhjIU28Ng/UK7/zL?=
 =?us-ascii?Q?BQLp+kENcnTEiF4sh3L7X3wtR75SZNqM2tCgTzT3onaHYkaxPM/2ccy7cd3N?=
 =?us-ascii?Q?vOfncx/8lt9pVaQmsZsnXNg0qFbYxnBNmYO1jUfSPae93SUCxb25CZhJZLRy?=
 =?us-ascii?Q?yJrgqmSlWF4BarS6NEzONI/aAHLDMbdVxjeugLYwzfbSqs0zHbTWO0uxlC9s?=
 =?us-ascii?Q?XQeRcr9o7ftbiQ++K9easKn0rszWxj23+o5NB2Lk2k2Z8yKA4Bp132Kc82Rj?=
 =?us-ascii?Q?XDE3Emh32xVSiKUctquUPEaDX+68FnMurGcg5ZPkp1WyR0vyDojmz16GxTqt?=
 =?us-ascii?Q?JGVChg1/EbhsnAO9PTxLqqN+hIZ5vPW335ajYK7VoPEX0lVzsebToKADs+BN?=
 =?us-ascii?Q?DoZKw3AFUBx+x+lhgZCojxDlI41F9jiuQ6YVem4mqpLyHz4ZBs9Qtu/Irr+4?=
 =?us-ascii?Q?Yq3OuLxsGiUDuG0l7VFdQ9tuk0x85NH3AGKppFV1OPsWSVpW0ShzipSkeryQ?=
 =?us-ascii?Q?YZ7rSeR3tzCSyhELLL88IVWYGh4N1P/WksdYGyahocGePL8NDM6ltw75zsw4?=
 =?us-ascii?Q?0IYrjcCRu3Z/VggXvXjFkZirBcMu0L7eUzkehrF+y1sF8l5fjA5aycbS+O+Y?=
 =?us-ascii?Q?zgI51a1adiwbj7HMeyednu4ZVa3rdqUd64GLuSLMBzBm796Iywo91RvSWyJG?=
 =?us-ascii?Q?f3F9KbflZPS+g0orThsczPAVvJ2BWYHkQTZRNX1/kNcx5chLg3iPZhj00sAl?=
 =?us-ascii?Q?0N7foi7cZ9Xnu5bd+v2zPWh4Vd5UiQz4XZCdVCn5XNqE8Z3tLWktaoS574Dg?=
 =?us-ascii?Q?Ju0PEvkutopVbalMbpg2OdJos4VBRwV5F8WiK2lrgtSAoUob3pKGW17bokKm?=
 =?us-ascii?Q?POFPQMjcffiWqcBDolDRmC8CJG2nMXDgEgWKop8sAsmbVHUVteCVRCsbYHug?=
 =?us-ascii?Q?WpWm?=
X-OriginatorOrg: spinetix.com
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0102MB2630.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2021 18:03:39.8645
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5f4034fa-ed2d-4840-a93f-acb1e9633b93
X-MS-Exchange-CrossTenant-Network-Message-Id: a59045aa-b929-4921-9fec-08d8b26d65a1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NLW/KMT39mlkbrcnQ6puyPAHD47Gs0Yaj/k1pH+lgkmc671Zmjr0ycGAiZTpoCi348roHr0y3lfYJLzlpninHrrjttThOoetV7kWq52lO3k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR01MB5674
Content-Type: text/plain

gupnp 1.2.3 adds mitigation for CVE-2020-12695 (CallStranger)

Signed-off-by: Diego Santa Cruz <Diego.SantaCruz@spinetix.com>
---
 .../gupnp/{gupnp_1.2.2.bb => gupnp_1.2.4.bb}                  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-multimedia/recipes-connectivity/gupnp/{gupnp_1.2.2.bb => gupnp_1.2.4.bb} (64%)

diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp_1.2.2.bb b/meta-multimedia/recipes-connectivity/gupnp/gupnp_1.2.4.bb
similarity index 64%
rename from meta-multimedia/recipes-connectivity/gupnp/gupnp_1.2.2.bb
rename to meta-multimedia/recipes-connectivity/gupnp/gupnp_1.2.4.bb
index e60349716..c7b330fa0 100644
--- a/meta-multimedia/recipes-connectivity/gupnp/gupnp_1.2.2.bb
+++ b/meta-multimedia/recipes-connectivity/gupnp/gupnp_1.2.4.bb
@@ -1,8 +1,8 @@
 require gupnp.inc
 
 SRC_URI = "${GNOME_MIRROR}/${BPN}/1.2/${BPN}-${PV}.tar.xz"
-SRC_URI[md5sum] = "2ade3d29c624ad98d70113e6e93908a5"
-SRC_URI[sha256sum] = "9a80bd953e5c8772ad26b72f8da01cbe7241a113edd6084903f413ce751c9989"
+SRC_URI[md5sum] = "7c9c7cd80e36d9fb1e5b0267571fc17d"
+SRC_URI[sha256sum] = "f7a0307ea51f5e44d1b832f493dd9045444a3a4e211ef85dfd9aa5dd6eaea7d1"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
                     file://libgupnp/gupnp.h;beginline=1;endline=20;md5=d78a69d9b6e63ee2dc72e7b674d97520"
-- 
2.18.4

