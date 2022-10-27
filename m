Return-Path: <eero.aaltonen@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B913BECAAA1
	for <webhook@archiver.kernel.org>; Thu, 27 Oct 2022 13:30:19 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.73])
 by mx.groups.io with SMTP id smtpd.web12.6427.1666877408419195651
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Oct 2022 06:30:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=T6Una2xo;
 spf=pass (domain: vaisala.com, ip: 40.107.249.73, mailfrom: eero.aaltonen@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C1Zc5+dIUG/b39aZ9ohXub7clW/KY+r4olqDRaKmvzcZUZU3plpvoUVM5rROrR7/ktKcDTUv79KV8ezPmWFt4xFQ+cBTEYRdbQy3i7Y43wA1cVTSxNosKkMtroAUOqXW3qlKs/iI3CYv3ydNORScVYyM/sTJHg3XIxOk7/VJ+v/N0b6kBC+6xkMOSe26geMtyjqYru3u7x7cjXwk/5/smuy/NEiD+o6X6m1eS2AbnpO7OBRIXnitQ2soCTUFPT7chhYQRrskFz6DZjh/4lCAtdayBq8emW58MyioSEkxy69WFhwryZTdYL2/IzKWqgXIcDBUXlAKEw5ND/QFMC1mzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vgBQN8Ejq29jAqiOv3/ldSv568xJAKZentk3P94cdT8=;
 b=ieSJnBTmqGU/Pe3RehRiG63Ahv3UeVFa5LEZknIo+tV8alT5mAlA0C3mjwwf/sogcgfCBJvzfQmKpsutu93yyERYpHvDQH/n0P6vwZ11TqnooGd3D3wP1vzq+zISOFCGKX32ddPbgZfaH491WQwxeE+eL4t/3P2gkvNK/JkGIn5xDBSpJltkxtweEjqWVkQQKiHwemhyT43lyyfFzET6Px8wTY4wlJ3HyhFMUCxaRaxu04Sn2miAZqasICrytBu8RDdOg1NvzQTgV9xXjXuBATObIyFaY2FnFJ6mxngUfPXf9NrLYRhx0eOmWnlpoDBd1CiPaQNRZzY3LBQejd8g5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vgBQN8Ejq29jAqiOv3/ldSv568xJAKZentk3P94cdT8=;
 b=T6Una2xoyKWPn9A9YfNAzdaVoXYtDjyOJy2/bqDAgZ7UowtvUZml9ztBINb5fqtmwV7Y9fenCYpNfAhW0fzuLI6keSslbMQxv3AI90Pjo89NGK5ufPJOhcvXy2FV36BK2ahssgGL3WiSeMFlMlCmrCvBrb1OGnoOSyQSjGDS63nqNpQSHIuGSf3zLkcurqVlX7QfR8ZVREA2gnS6ClI8/GolZjfHBr2sAZJj7s+XchV7qOzJlUp9S2W0IVG0IALyo4ZPPrGnUdFqnyLqjIFvxK5W9IilFoX3Up3bQHD4dxOkKN1x/pWvR/e3KSp/4PblmZmdk4Nl53EnN+NcQsqzqQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from HE1PR0601MB2361.eurprd06.prod.outlook.com (2603:10a6:3:97::9)
 by AM7PR06MB6501.eurprd06.prod.outlook.com (2603:10a6:20b:122::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15; Thu, 27 Oct
 2022 13:30:05 +0000
Received: from HE1PR0601MB2361.eurprd06.prod.outlook.com
 ([fe80::b98d:390e:3a17:e9f9]) by HE1PR0601MB2361.eurprd06.prod.outlook.com
 ([fe80::b98d:390e:3a17:e9f9%10]) with mapi id 15.20.5746.028; Thu, 27 Oct
 2022 13:30:05 +0000
From: Eero Aaltonen <eero.aaltonen@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: Eero Aaltonen <eero.aaltonen@vaisala.com>
Subject: [meta-oe][PATCH] valijson: use install task from CMakeLists.txt
Date: Thu, 27 Oct 2022 16:29:31 +0300
Message-ID: <20221027132931.149976-1-eero.aaltonen@vaisala.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0033.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:9::26) To HE1PR0601MB2361.eurprd06.prod.outlook.com
 (2603:10a6:3:97::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HE1PR0601MB2361:EE_|AM7PR06MB6501:EE_
X-MS-Office365-Filtering-Correlation-Id: 112d0ade-0684-43c6-de2e-08dab81f5bdb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	qRUzpI1vg2z0O4YR+iGPIFeyqDH4wXTG887UtHsTC5oQczsfIPDYF0F8dgC0HtLISd9YC6mVTGyc88B+uxRd5bb+dvjTvTFixfn9IJ6FoplY8RUjukxkG10Lzlj6o1rM2Kviy5SgNuWncR0oc9mpM/o0sqUzfz/RIVRvd8dCZ3wMiiddTUnUMfXRm1CsfnVc5mDHViXZz1hEIESv1vF7XFDCmPaaFkZztaTeU/fRkURupN0tCUb83lXU7/ZpiRkLtd1jOwJHeuEOdlQnHpIC6+BlvU/MBy1ngmrUUt09Y4wxHNCcA6B7ShZ/XoBaegmr+f2th3cSCiJxV4iTeEkte9b1/MMjVG7yk/HzkdC65NWF8ogndW3Nd+9WUtd3RLYqjXfMhL6bKXD85ER4Fx1dgwDzsXzjLLsSL6qi55hHTWcUihMNmmi3SG+wMpoP3borwPiDVcoOThTuPy7mQpFqpu679KmpYFQFx+ioC7r6ocBFqCbIw2x1dib4rQaAnv5V/5ig+uXGllXE4FR6nUqZCPwMBRv9osGoSFGGdGR5eD2fCUuXORqhKxfyeN2Utj/KZWcLBfhvQGtqP5VXrVJsbOaWbmCXdw/C+ymPsLzE6ouvm9tu0qBI152p9EFl77LKGb8Ve2idK2hZ40qJ6HBWc88KhSanTkETWg/YVEUFv6L//AqyKziBsrIf0aD8+sxHfcvSxCNHQdnbYk3BKLxvoNq3Bu0CFQp8VE86lJacGgi7QjjYoNzwCoge8xlatXHgbUQkSSMTldM+pZyU4MBU0Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR0601MB2361.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(376002)(39860400002)(346002)(396003)(136003)(451199015)(6506007)(52116002)(66946007)(66556008)(4326008)(66476007)(8676002)(44832011)(5660300002)(2616005)(2906002)(1076003)(186003)(36756003)(83380400001)(41300700001)(8936002)(26005)(6512007)(38350700002)(86362001)(38100700002)(6486002)(478600001)(6916009)(316002)(107886003)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?rME4kmCTs8ZvUu+8XXkr8RN1qq0WfzoxQVyGMIDgXrK76Z99inRj7ZdXu1YR?=
 =?us-ascii?Q?JyZy1spMWPTQxQc3Wi22sSativthBnJ3m5FEMV6YVGzSHLh4Hd8RLwPDVUcf?=
 =?us-ascii?Q?2kRFsm+0BdhxvYOHJDoR9DekgS7UnXHGD1U7BAau271wH4CIWq9oTPiA2m1S?=
 =?us-ascii?Q?e7VYeJoVOrxN9rOJQ3UDLKoHNd8/MO8tmahIAiwYX0Br1PPA6hfaJ3mqPAlC?=
 =?us-ascii?Q?rxS+LOT17J/C1+CT1CApXr2aHCL3E74aq7lZ3BMELNKQm/qc71uj1VSh63tv?=
 =?us-ascii?Q?Jhrj5AF3eANK8ceT3NQt2bSgGKQ00Mcp0Wi4K4/x1UDCorlyYveBCM5MpNJ1?=
 =?us-ascii?Q?gjeSszOa6RJCm7qUTc8T7zy1fFvUcY8epQUKwiSIk2l0f39Q0/8OihRPBfRY?=
 =?us-ascii?Q?cHGP2v3gnxBX5347xaBIWwfiJo3ldiO9dT1Yd9NzAbLwsV0s1WIzZJ5X042x?=
 =?us-ascii?Q?2FvbJTVWwo72S+1TdZvNJy/u2FspCYXh1nW2z+hCWcyF7oEoBzSiCtA1z0zf?=
 =?us-ascii?Q?eaKCTthzQj/V2XoolMcKTWdhhyRW0oyMtGNoHoyUDGbMgxGPzFvdnwPA8cyS?=
 =?us-ascii?Q?/zJ1dxjinL7eYVL8T+oqxsaAxyjQiVhNWNOJN3kqImDCX7zsP2OKjkVPxyo3?=
 =?us-ascii?Q?Edn7ZjL9lX+/oP3AjktadbFhREx3ZDeZQ7fjncSEopzIyVGoskKK4kPYSwPY?=
 =?us-ascii?Q?xfRV1+nWGMdgd4U/o9s7WppfpqtsKPujzZ3LtFAvD9xlo66us3w9+r5t5NMp?=
 =?us-ascii?Q?QklBq6q/JG572G4sOWP+26x8wvTGNFT1K7mT9zaIlSinQt7u4lGQTAdwm8bq?=
 =?us-ascii?Q?8apiIR9FSm79upQJIH5sSbWZ3Yf/KISJ2BYNuOGk+tu2SqkT9qfESVUDskTj?=
 =?us-ascii?Q?EWSGcc8IIRivJjVBENtgNE8TUSBaHD28heu3T584e96ST43ryq1jrZA6nxsD?=
 =?us-ascii?Q?U9vCskfL/mNbQReCQ6aAipKQ5jZbqaFFYN2quyjKeH1FRD/Sg7KXJN3rfkL6?=
 =?us-ascii?Q?NhJCCSPnNd7kMDuvqo42uOtRRNnBey5YvIy5sDVBCvSvQQbQPZGIh790psA7?=
 =?us-ascii?Q?8VcpdN5yJlQ+O4ymdz7TIAowm0737MU60vdwqht7Nw/aWLknBbT6ZYWYy+2S?=
 =?us-ascii?Q?78dAXbcEMJmuBISXJSPPQiOVlc/5isZhlNlAAbHxriV1V8/49Z2H6niHZNP2?=
 =?us-ascii?Q?2Vilf7q1ln37gY7JNg3y6OFJaAH1CLkUsh7JxJtdABKS+x094CeEEH/N5hPC?=
 =?us-ascii?Q?GofOZX7EDoVPm5vs861kUW4EF5JLBGwUq5vj2w84mdTfmpincZuyU7xZj41K?=
 =?us-ascii?Q?NXpVkwHXfWbJzKN0Gp2xQM2n1IIsCCZyhxxo5NSxZt3vZ733acsGZ76OjOc3?=
 =?us-ascii?Q?fd6z+PsvUs8B6MN5RE/mHrG7IgqoAJcQWGnVkr6x5GFVN3AwPUK+9glECuMl?=
 =?us-ascii?Q?l23eBiwPDnuxgzKu9DnqviQcCkDF5R30RB1IXa7HYpq3g6IsfuN82efl1J73?=
 =?us-ascii?Q?3FJXkqOAiNcPUx+Pv3NX+km99wjq5AvYpev//Vqw98+ss8Z+o4tXU2TVcfJ6?=
 =?us-ascii?Q?o8gH0GevUYTWX2TnSEHYPRNCEEyOOJViRFd0RvpwMxBgdbvTU3DHeZmxcXXC?=
 =?us-ascii?Q?zA=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 112d0ade-0684-43c6-de2e-08dab81f5bdb
X-MS-Exchange-CrossTenant-AuthSource: HE1PR0601MB2361.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2022 13:30:05.2854
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VbKmBIvRFFhIOyV6hRD64qyqR4eURHW8SmBE+WEB4iQw/KHyozLDHKoHJdZfEznHfQcXOWrtMhuH6ylajbcLyZjfnWd+ZDDi1nDRRyRz8j8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR06MB6501
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Oct 2022 13:30:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99320

Upstream CMakeLists.txt has improved and in version 0.7 install both
the headers and a config-file package to
packages-split/valijson-dev/usr/lib/cmake/valijson/valijsonConfig.cmake
, so drop the custom `do_install` task and use the CMake install task
directly instead.

Signed-off-by: Eero Aaltonen <eero.aaltonen@vaisala.com>
---
 .../recipes-devtools/valijson/valijson_0.7.bb    | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/meta-oe/recipes-devtools/valijson/valijson_0.7.bb b/meta-oe/re=
cipes-devtools/valijson/valijson_0.7.bb
index 51b2bb9e0..3bb89ee8f 100644
--- a/meta-oe/recipes-devtools/valijson/valijson_0.7.bb
+++ b/meta-oe/recipes-devtools/valijson/valijson_0.7.bb
@@ -20,19 +20,3 @@ PACKAGECONFIG[tests] =3D "-Dvalijson_BUILD_TESTS=3DTRUE,=
-Dvalijson_BUILD_TESTS=3DFALSE
 RDEPENDS:${PN}-dev =3D ""
=20
 BBCLASSEXTEND =3D "native nativesdk"
-
-do_install() {
-    install -d ${D}${includedir}/compat
-    install -d ${D}${includedir}/valijson
-    install -d ${D}${includedir}/valijson/adapters
-    install -d ${D}${includedir}/valijson/constraints
-    install -d ${D}${includedir}/valijson/internal
-    install -d ${D}${includedir}/valijson/utils
-
-    install -m 0644 ${S}/include/compat/* ${D}${includedir}/compat
-    install -D -m 0644 ${S}/include/valijson/*.hpp -t ${D}${includedir}/va=
lijson
-    install -D -m 0644 ${S}/include/valijson/adapters/*.hpp -t ${D}${inclu=
dedir}/valijson/adapters
-    install -D -m 0644 ${S}/include/valijson/constraints/*.hpp -t ${D}${in=
cludedir}/valijson/constraints
-    install -D -m 0644 ${S}/include/valijson/internal/*.hpp -t ${D}${inclu=
dedir}/valijson/internal
-    install -D -m 0644 ${S}/include/valijson/utils/*.hpp -t ${D}${included=
ir}/valijson/utils
-}
--=20
2.25.1


