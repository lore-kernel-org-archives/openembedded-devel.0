Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9229C531DC
	for <webhook@archiver.kernel.org>; Fri, 23 Aug 2024 20:39:50 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.65.77])
 by mx.groups.io with SMTP id smtpd.web11.623.1724445585614046856
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Aug 2024 13:39:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=jP1zgRVe;
 spf=pass (domain: navimatix.de, ip: 52.101.65.77, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lEIB//aSu5IeGISSKA7cixWIUtruQI7XNbouneXwqR23nfMDZZqcCTbjqAaz0QCCNmNz8c01FmpLXTSoCirJkswoYebhKbd30pO4vW5+4sz3/7aAsf1L37UEAqEazZJyl4NgYLk3Ar6F40GWjThaoYmhvWnpz17EY2Ihw4zjyK9Jv6CFl/wtIVVgNqfbCTqw2bGdU1B7wG7Oi3L0LkB5okVGQesjZHES80rv1ntiiJWKHXwWzYMxvHDf0RwqZUTuNJ6/LzXAKP3eXFZPlFY764vBJ32PKUtqEqVjNcfZUu2QEFQzA2UWj7n+JArR62rOHKqTkWZW2DYG55ZROClnPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zGN2O9VIlJtP9r1ClWTAlzpl/i/0VSRorJezlAvCpuE=;
 b=s61L8wh+RPuIMjzMfehTAUEtw15yhhKHopTqEx48qHJ+3DobbUrCpAMpOAztT+WgPcScDQGVMos+uP2Rue/7NuTUf7If56xoTJpTvxYZsmxj4UD7A/9FwcW8tmA6CRcoQPqbQ3AZMqKUOHMpBxgYikbaGPpD9xTV1RQlIJZaLz2tQCa7JqRaAz8/EfMe3Z081j0YTilogbfoPW9QbAuzhEiG4nDIkMGCSvXGM2SzhIuVvl0DPvkdr9bBdVYF1EoabrK97EEnBJgfepOHVIZH0WMFn1Qo1kHxJKMcFjqFerRWidkF8r9xpDF9C1F7n77EhA7L4kVr9PRVymmoeGlmyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zGN2O9VIlJtP9r1ClWTAlzpl/i/0VSRorJezlAvCpuE=;
 b=jP1zgRVeqoW++Rfis8R7qzHBj6Askx/Zonwv2XLMbkKmYzAYH8outl9XuVAjRQ6+s+UL0yKnhmpdd5PvG42N9f3UVJz2d2GbaXpScyrbe8rOHeZnHymeMOMSr7uCdk9tyRASsaE6Gvtv48DJ8MWBL0zY2a9U9mev1OSkOjRsLmI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5) by DU4PR01MB11256.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:58c::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Fri, 23 Aug
 2024 20:39:41 +0000
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7]) by DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7%4]) with mapi id 15.20.7897.014; Fri, 23 Aug 2024
 20:39:40 +0000
Date: Fri, 23 Aug 2024 22:39:38 +0200
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-devel@lists.openembedded.org, joerg.sommer@navimatix.de
CC: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [PATCH v3] zsh: update 5.8 -> 5.9
Message-ID: <d777db2dd965302a90b66de1a08191ef0a8f630f.1724445577.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE0P281CA0033.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:14::20) To DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR01MB8293:EE_|DU4PR01MB11256:EE_
X-MS-Office365-Filtering-Correlation-Id: b283f97e-36ea-433f-0af4-08dcc3b3b629
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?KZDshb64s8kRqjC+NUYjQJpywQ93PPeyATCYv8XmQmf06/6Ighzze87kRQNh?=
 =?us-ascii?Q?/0tGYQ38MpC+pmKvOxgfJXMfUa35DgKPYrlXcHPrLGDsdmt+iD94HirCid6j?=
 =?us-ascii?Q?AtCqeI5HNaKmTOg+T7B/kf99kn0y2YXViMiMsmcQN9ZOZEKPGwAvxwmGjXom?=
 =?us-ascii?Q?VnmJLCtsfQ65Lf1MWAlesF3tiFR+hhj4ZGM4rMuVZ6BmD17yiJV/tithssKt?=
 =?us-ascii?Q?T8T8DIox26dc9MpmmIU4C3LZPvwQNqbS06javwn3wtj7s5VyO/Sx7Kl3yAt/?=
 =?us-ascii?Q?YMiTa1ya47sB/H2BPW+jGIMYf+6pzHrputq+duDlc1yc9kjGrIps8M/0lZFA?=
 =?us-ascii?Q?jTmlE0zddlwqFSpAdT7mL5AnhYRBiXZWbLz67ZarFYTmQEk1Il4onlePYOf0?=
 =?us-ascii?Q?GeRhu2o/MowiBYbrGjLiD9pZubu3eRelp4D4+crQIwoVY7eOcM5MK0rDXcfF?=
 =?us-ascii?Q?jYcj3sBjI+fjK5+qXJqXH9Jark5uDVJ/CgctMouxU6hr8izN45Hjfk5tnLyA?=
 =?us-ascii?Q?TXus62LRuN/44sEqKl7uZ7jgZ6lN7Q+DDlQmb9Lae5GLC0h60/d5jrVrzy0T?=
 =?us-ascii?Q?zhlq4D7w42PvfRlbq8RAjS+05wVoEnRaVh0WX6mGGdUaJKeoslANTDtru+Hc?=
 =?us-ascii?Q?gtrWvU3AS8dPKT32zziZy4ish2EOqnI3slVvbnSklzdjiC0O4wontiojfc9L?=
 =?us-ascii?Q?A6MHqF6OaECVO+MeCzwNwlBS47Tz+6cSEVKubUGtZEV7Y00+b/Pm4Q36Wwh8?=
 =?us-ascii?Q?NN5jvSu4IVNhH0Vc67lpUHbna2Myj97diXYsPFfzob/rBg2fYRmNg6FzgJFr?=
 =?us-ascii?Q?WXLjMuPE5z9W0tNsRfcJwF/z0BAcjJ0wdhuiUimcirNySgVZeawIN7Ywq/3h?=
 =?us-ascii?Q?xkRMOuHv9HQxBgtRxEcqEwJtmRJLH2nyCgibD3Ct7XS+R08cvP0tGKGa52x2?=
 =?us-ascii?Q?EKgcSnvrMaOqD9FIpmK/qbDfIz4QVU+ehsuhZx8y+RFsa6ft3aprtFfgyKEk?=
 =?us-ascii?Q?O77Gfc/ROjKwONRNZp7dcJ2XS5TQIzZA8L+kahn12J6GFa6mQuenJyhBgmdP?=
 =?us-ascii?Q?RNETbvWwoUrb96TMRHCBu027hrlFEdUbRusN4HGD++B6vNegGe42ODlhsiB7?=
 =?us-ascii?Q?jjGF/F6LNTML/MNT1QKfTlviGeRWrAFwqOPwGF/ZOwMDS5LLWFzCDRS2uovL?=
 =?us-ascii?Q?isRWpdTmggm7eAGq4nHjbTBSF43MCX4vrT7VeP3gg8cZrgeCYm4nNSoMk8lb?=
 =?us-ascii?Q?y9dswihCKSwtBq6jCcYKuE5fEXbUh1KCrvIhzhMgRKci6MC/2wsTyEGkmerJ?=
 =?us-ascii?Q?BO4=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR01MB8293.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?/WSbzmHBwyLLikPuoiK3agx9VtlSzIPLMxdhchINNZLqtHnC7Q9YRFH1+gom?=
 =?us-ascii?Q?+BpaPlG4/tn4qFe53IrNRTQtc1YkRwHqRY4oGIRwbEY6pZAy4DG5ONodBv35?=
 =?us-ascii?Q?DCSr2UqLN738x8cDk13kBPsI8rIQg8Tf1pkHV83lVRyN/SXgwHCRjFZkKfGg?=
 =?us-ascii?Q?LN80enwREhoctEiOR6Vl/KPzWUf2re0ktkfT6xu3dVNAoidXXh+VT9+B5AoI?=
 =?us-ascii?Q?bFOlr8evm2PmBGtWHlSTzfaqHoqQpLCkW8KPBW7vtECqO6f+vqS6oETkzCK4?=
 =?us-ascii?Q?lI+y6VW/zFKhOOqMaT86vV11P9TEAio6gupDYueY3N7OP+8sMGN7C1Odu+eC?=
 =?us-ascii?Q?VeBRgvULrwXMQ3LxB4Suyuv8a3Cmji9Z1wnRFOfQ8f9JKgS6yd83aeKykq5j?=
 =?us-ascii?Q?B0JY8dSaAyIudRsQJo8oyWVlszbK2j+/Sda3gnw+NiiWVzt7LPunflXjAS0V?=
 =?us-ascii?Q?DYTs9CT1RDJCOxkVsqDrMsUp68afuug15DxyIkzXXN4M14j+HljT6sM0j9nM?=
 =?us-ascii?Q?oTAqdZBW/MfEYE10aRndLuCmDeFYXXsDgybsXsT6R1ziwOes6no6FjgqLpSv?=
 =?us-ascii?Q?nb4TJfLZeSvd8TNlT1ZHsYJAXd6zTGlgu/6TT3bmvbp8BawfU2w11UoJge2W?=
 =?us-ascii?Q?U5Bezx++JhJAlCuLBRLf47lF28g1RamBvEyhbkVpka/ZFA7DtecUVA6J8yZE?=
 =?us-ascii?Q?TO0OTq8xltx6o73+ZHKwqcanCT9BqJWvjeyMzi84mZuaBWjU/wB8wwCpBCIW?=
 =?us-ascii?Q?iCXbDL27g57b1UUzHkyvwzfXB//e78NlxCFxonMy+Yj+x41mAaP4ahwUiNnB?=
 =?us-ascii?Q?RtHutyc7rpAKd2F7BL2c186JvntcKq5pAg5xrM624WlnfkMAWYuNY/ZV/4Sv?=
 =?us-ascii?Q?D/X3fB5MJIjpE6f1+n5Dt1o9M18TMJryuTQ16M3jzggYTOl8pJ3doykurqjf?=
 =?us-ascii?Q?GCm5W92FdeoyOf8QYN1TzUab3tciTqL/yrQ4kU8Oc8+diX5CJyiO+oxoMhjm?=
 =?us-ascii?Q?kQiKstHMvT8W4IHjh8C8MYNpVgalxoaBp9pidfrM535VZ3rbKrnjLOp7NbSR?=
 =?us-ascii?Q?2On1/6x8tbYZqkwIpnClm8OkdcF3YSdQi227Zc3dCGYbn1LQ8+qm3LP5EeBJ?=
 =?us-ascii?Q?7iz95PAyl6X3rA0VaaN/Vw7fdTn97in1VqvKL/LQdIEvVQ0RFrlrzg0FBK0L?=
 =?us-ascii?Q?7IAD4dDny4Mw/VPoB0wzF5PQxkmH07Gs3AuXPWpDYtdi1adVynbKfgg4oKEC?=
 =?us-ascii?Q?TjH1CGrlzBdQzkFLXI/UAD9wSMwhmFjiUEPzvL0XvVB4SexE+bt/EPQEzgWQ?=
 =?us-ascii?Q?doTieExZz9f59jstkj0WXGS/WQ2cTA93pHbOEhNA9moj4n77seqfNawOqGBO?=
 =?us-ascii?Q?DDyWyfJ03hKXIeHVKqXtw+ZP/ZKaQjc7/fxrfa8NqHZk6JG7sjdhmbL9Hx2R?=
 =?us-ascii?Q?2bWaJFPJLn47f2O5SBJckPYvzssaJAWx5Br7eF58YIdId8m0TB9o2SCEPc7z?=
 =?us-ascii?Q?mUgp71feuNQhTwZNd3RqNX3DV/SX8cksCAEHxAVthKtTOdRZq4AdgTNKg6K2?=
 =?us-ascii?Q?Yi1kmAegPxdebVLgM9eIHN6mdIe8PHODWQcGeH972n1aNFm6T4q0lukW6lWL?=
 =?us-ascii?Q?sg=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: b283f97e-36ea-433f-0af4-08dcc3b3b629
X-MS-Exchange-CrossTenant-AuthSource: DU2PR01MB8293.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 20:39:40.4702
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hoip//D5pXKXhnV5wfeVtcLikn4ojLYOB6SrMHsMFy30coxBLQ5CmW6v7mlXApN3RspTqDv7BbeYMcAJzXWyidrOPrAWACqz35Hhlzue1ZY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR01MB11256
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Aug 2024 20:39:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111915

From: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>

The patches for CVE-2021-45444 were applied upstream on 2022-02-12.

The snipped for do_install was taken from
https://salsa.debian.org/debian/zsh/-/blob/8cc745c38fba1d4ec3e5d66cffbeadd8=
b492c2ce/debian/rules#L132

Signed-off-by: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
---
 .../zsh/zsh/CVE-2021-45444_1.patch            |  60 --------
 .../zsh/zsh/CVE-2021-45444_2.patch            | 140 ------------------
 .../zsh/zsh/CVE-2021-45444_3.patch            |  77 ----------
 .../zsh/{zsh_5.8.bb =3D> zsh_5.9.bb}            |  28 ++--
 4 files changed, 14 insertions(+), 291 deletions(-)
 delete mode 100644 meta-oe/recipes-shells/zsh/zsh/CVE-2021-45444_1.patch
 delete mode 100644 meta-oe/recipes-shells/zsh/zsh/CVE-2021-45444_2.patch
 delete mode 100644 meta-oe/recipes-shells/zsh/zsh/CVE-2021-45444_3.patch
 rename meta-oe/recipes-shells/zsh/{zsh_5.8.bb =3D> zsh_5.9.bb} (61%)

diff --git a/meta-oe/recipes-shells/zsh/zsh/CVE-2021-45444_1.patch b/meta-o=
e/recipes-shells/zsh/zsh/CVE-2021-45444_1.patch
deleted file mode 100644
index fb8fa3427..000000000
--- a/meta-oe/recipes-shells/zsh/zsh/CVE-2021-45444_1.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-Origin: commit c187154f47697cdbf822c2f9d714d570ed4a0fd1
-From: Oliver Kiddle <opk@zsh.org>
-Date: Wed, 15 Dec 2021 01:56:40 +0100
-Subject: [PATCH 1/9] security/41: Don't perform PROMPT_SUBST evaluation on
- %F/%K arguments
-
-Mitigates CVE-2021-45444
-
-https://salsa.debian.org/debian/zsh/-/raw/debian/5.8-6+deb11u1/debian/patc=
hes/cherry-pick-CVE-2021-45444_1.patch?inline=3Dfalse
-Upstream-Status: Backport
-CVE: CVE-2021-45444
-Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
----
- ChangeLog    |  5 +++++
- Src/prompt.c | 10 ++++++++++
- 2 files changed, 15 insertions(+)
-
-diff --git a/ChangeLog b/ChangeLog
-index 8d7dfc169..eb248ec06 100644
---- a/ChangeLog
-+++ b/ChangeLog
-@@ -1,3 +1,8 @@
-+2022-01-27  dana  <dana@dana.is>
-+
-+	* Oliver Kiddle: security/41: Src/prompt.c: Prevent recursive
-+	PROMPT_SUBST
-+
- 2020-02-14  dana  <dana@dana.is>
-=20
- 	* unposted: Config/version.mk: Update for 5.8
-diff --git a/Src/prompt.c b/Src/prompt.c
-index b65bfb86b..91e21c8e9 100644
---- a/Src/prompt.c
-+++ b/Src/prompt.c
-@@ -244,6 +244,12 @@ parsecolorchar(zattr arg, int is_fg)
- 	bv->fm +=3D 2; /* skip over F{ */
- 	if ((ep =3D strchr(bv->fm, '}'))) {
- 	    char oc =3D *ep, *col, *coll;
-+	    int ops =3D opts[PROMPTSUBST], opb =3D opts[PROMPTBANG];
-+	    int opp =3D opts[PROMPTPERCENT];
-+
-+	    opts[PROMPTPERCENT] =3D 1;
-+	    opts[PROMPTSUBST] =3D opts[PROMPTBANG] =3D 0;
-+
- 	    *ep =3D '\0';
- 	    /* expand the contents of the argument so you can use
- 	     * %v for example */
-@@ -252,6 +258,10 @@ parsecolorchar(zattr arg, int is_fg)
- 	    arg =3D match_colour((const char **)&coll, is_fg, 0);
- 	    free(col);
- 	    bv->fm =3D ep;
-+
-+	    opts[PROMPTSUBST] =3D ops;
-+	    opts[PROMPTBANG] =3D opb;
-+	    opts[PROMPTPERCENT] =3D opp;
- 	} else {
- 	    arg =3D match_colour((const char **)&bv->fm, is_fg, 0);
- 	    if (*bv->fm !=3D '}')
---=20
-2.34.1
diff --git a/meta-oe/recipes-shells/zsh/zsh/CVE-2021-45444_2.patch b/meta-o=
e/recipes-shells/zsh/zsh/CVE-2021-45444_2.patch
deleted file mode 100644
index e5b6d7cdc..000000000
--- a/meta-oe/recipes-shells/zsh/zsh/CVE-2021-45444_2.patch
+++ /dev/null
@@ -1,140 +0,0 @@
-From 8a4d65ef6d0023ab9b238529410afb433553d2fa Mon Sep 17 00:00:00 2001
-From: Marc Cornell=C3=A0 <hello@mcornella.com>
-Date: Mon, 24 Jan 2022 09:43:28 +0100
-Subject: [PATCH 2/9] security/89: Add patch which can optionally be used t=
o
- work around CVE-2021-45444 in VCS_Info
-Comment: Updated to use the same file name without blanks as actually
- used in the final 5.8.1 release.
-
-
-https://salsa.debian.org/debian/zsh/-/blob/debian/5.8-6+deb11u1/debian/pat=
ches/cherry-pick-CVE-2021-45444_2.patch
-Upstream-Status: Backport
-CVE: CVE-2021-45444
-Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
----
- ChangeLog                                    |  5 +
- Etc/CVE-2021-45444-VCS_Info-workaround.patch | 98 ++++++++++++++++++++
- 2 files changed, 103 insertions(+)
- create mode 100644 Etc/CVE-2021-45444-VCS_Info-workaround.patch
-
-diff --git a/ChangeLog b/ChangeLog
-index eb248ec06..9a05a09e1 100644
---- a/ChangeLog
-+++ b/ChangeLog
-@@ -1,5 +1,10 @@
- 2022-01-27  dana  <dana@dana.is>
-=20
-+	* Marc Cornell=C3=A0: security/89:
-+	Etc/CVE-2021-45444-VCS_Info-workaround.patch: Add patch which
-+	can optionally be used to work around recursive PROMPT_SUBST
-+	issue in VCS_Info
-+
- 	* Oliver Kiddle: security/41: Src/prompt.c: Prevent recursive
- 	PROMPT_SUBST
-=20
-diff --git a/Etc/CVE-2021-45444-VCS_Info-workaround.patch b/Etc/CVE-2021-4=
5444-VCS_Info-workaround.patch
-new file mode 100644
-index 000000000..13e54be77
---- /dev/null
-+++ b/Etc/CVE-2021-45444-VCS_Info-workaround.patch
-@@ -0,0 +1,98 @@
-+From 972887bbe5eb6a00e5f0e73781d6d73bfdcafb93 Mon Sep 17 00:00:00 2001
-+From: =3D?UTF-8?q?Marc=3D20Cornell=3DC3=3DA0?=3D <hello@mcornella.com>
-+Date: Mon, 24 Jan 2022 09:43:28 +0100
-+Subject: [PATCH] security/89: Partially work around CVE-2021-45444 in VCS=
_Info
-+MIME-Version: 1.0
-+Content-Type: text/plain; charset=3DUTF-8
-+Content-Transfer-Encoding: 8bit
-+
-+This patch is a partial, VCS_Info-specific work-around for CVE-2021-45444=
,
-+which is mitigated in the shell itself in 5.8.1 and later versions. It is
-+offered for users who are concerned about an exploit but are unable to up=
date
-+their binaries to receive the complete fix.
-+
-+The patch works around the vulnerability by pre-escaping values substitut=
ed
-+into format strings in VCS_Info. Please note that this may break some use=
r
-+configurations that rely on those values being un-escaped (which is why i=
t was
-+not included directly in 5.8.1). It may be possible to limit this breakag=
e by
-+adjusting exactly which ones are pre-escaped, but of course this may leav=
e
-+them vulnerable again.
-+
-+If applying the patch to the file system is inconvenient or not possible,=
 the
-+following script can be used to idempotently patch the relevant function
-+running in memory (and thus must be re-run when the shell is restarted):
-+
-+
-+# Impacted versions go from v5.0.3 to v5.8 (v5.8.1 is the first patched v=
ersion)
-+autoload -Uz is-at-least
-+if is-at-least 5.8.1 || ! is-at-least 5.0.3; then
-+  return
-+fi
-+
-+# Quote necessary $hook_com[<field>] items just before they are used
-+# in the line "VCS_INFO_hook 'post-backend'" of the VCS_INFO_formats
-+# function, where <field> is:
-+#
-+#   base:       the full path of the repository's root directory.
-+#   base-name:  the name of the repository's root directory.
-+#   branch:     the name of the currently checked out branch.
-+#   revision:   an identifier of the currently checked out revision.
-+#   subdir:     the path of the current directory relative to the
-+#               repository's root directory.
-+#   misc:       a string that may contain anything the vcs_info backend w=
ants.
-+#
-+# This patch %-quotes these fields previous to their use in vcs_info hook=
s and
-+# the zformat call and, eventually, when they get expanded in the prompt.
-+# It's important to quote these here, and not later after hooks have modi=
fied the
-+# fields, because then we could be quoting % characters from valid prompt=
 sequences,
-+# like %F{color}, %B, etc.
-+#
-+#  32   =E2=94=82 hook_com[subdir]=3D"$(VCS_INFO_reposub ${hook_com[base]=
})"
-+#  33   =E2=94=82 hook_com[subdir_orig]=3D"${hook_com[subdir]}"
-+#  34   =E2=94=82
-+#  35 + =E2=94=82 for tmp in base base-name branch misc revision subdir; =
do
-+#  36 + =E2=94=82     hook_com[$tmp]=3D"${hook_com[$tmp]//\%/%%}"
-+#  37 + =E2=94=82 done
-+#  38 + =E2=94=82
-+#  39   =E2=94=82 VCS_INFO_hook 'post-backend'
-+#
-+# This is especially important so that no command substitution is perform=
ed
-+# due to malicious input as a consequence of CVE-2021-45444, which affect=
s
-+# zsh versions from 5.0.3 to 5.8.
-+#
-+autoload -Uz +X regexp-replace VCS_INFO_formats
-+
-+# We use $tmp here because it's already a local variable in VCS_INFO_form=
ats
-+typeset PATCH=3D'for tmp (base base-name branch misc revision subdir) hoo=
k_com[$tmp]=3D"${hook_com[$tmp]//\%/%%}"'
-+# Unique string to avoid reapplying the patch if this code gets called tw=
ice
-+typeset PATCH_ID=3Dvcs_info-patch-9b9840f2-91e5-4471-af84-9e9a0dc68c1b
-+# Only patch the VCS_INFO_formats function if not already patched
-+if [[ "$functions[VCS_INFO_formats]" !=3D *$PATCH_ID* ]]; then
-+  regexp-replace 'functions[VCS_INFO_formats]' \
-+    "VCS_INFO_hook 'post-backend'" \
-+    ': ${PATCH_ID}; ${PATCH}; ${MATCH}'
-+fi
-+unset PATCH PATCH_ID
-+
-+
-+---
-+ Functions/VCS_Info/VCS_INFO_formats | 4 ++++
-+ 1 file changed, 4 insertions(+)
-+
-+diff --git a/Functions/VCS_Info/VCS_INFO_formats b/Functions/VCS_Info/VCS=
_INFO_formats
-+index e0e1dc738..4d88e28b6 100644
-+--- a/Functions/VCS_Info/VCS_INFO_formats
-++++ b/Functions/VCS_Info/VCS_INFO_formats
-+@@ -32,6 +32,10 @@ hook_com[base-name_orig]=3D"${hook_com[base_name]}"
-+ hook_com[subdir]=3D"$(VCS_INFO_reposub ${hook_com[base]})"
-+ hook_com[subdir_orig]=3D"${hook_com[subdir]}"
-+=20
-++for tmp in base base-name branch misc revision subdir; do
-++    hook_com[$tmp]=3D"${hook_com[$tmp]//\%/%%}"
-++done
-++
-+ VCS_INFO_hook 'post-backend'
-+=20
-+ ## description (for backend authors):
-+--=20
-+2.34.1
---=20
-2.34.1
diff --git a/meta-oe/recipes-shells/zsh/zsh/CVE-2021-45444_3.patch b/meta-o=
e/recipes-shells/zsh/zsh/CVE-2021-45444_3.patch
deleted file mode 100644
index adfc00ae5..000000000
--- a/meta-oe/recipes-shells/zsh/zsh/CVE-2021-45444_3.patch
+++ /dev/null
@@ -1,77 +0,0 @@
-From 4abf2fc193fc2f3e680deecbf81289a7b02e245b Mon Sep 17 00:00:00 2001
-From: dana <dana@dana.is>
-Date: Tue, 21 Dec 2021 13:13:33 -0600
-Subject: [PATCH 3/9] CVE-2021-45444: Update NEWS/README
-
-https://salsa.debian.org/debian/zsh/-/blob/debian/5.8-6+deb11u1/debian/pat=
ches/cherry-pick-CVE-2021-45444_3.patch
-Upstream-Status: Backport
-CVE: CVE-2021-45444
-Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
----
- ChangeLog |  2 ++
- NEWS      | 20 ++++++++++++++++++++
- README    |  6 ++++++
- 3 files changed, 28 insertions(+)
-
-diff --git a/ChangeLog b/ChangeLog
-index 9a05a09e1..93b0bc337 100644
---- a/ChangeLog
-+++ b/ChangeLog
-@@ -1,5 +1,7 @@
- 2022-01-27  dana  <dana@dana.is>
-=20
-+	* CVE-2021-45444: NEWS, README: Document preceding two changes
-+
- 	* Marc Cornell=C3=A0: security/89:
- 	Etc/CVE-2021-45444-VCS_Info-workaround.patch: Add patch which
- 	can optionally be used to work around recursive PROMPT_SUBST
-diff --git a/NEWS b/NEWS
-index 964e1633f..d34b3f79e 100644
---- a/NEWS
-+++ b/NEWS
-@@ -4,6 +4,26 @@ CHANGES FROM PREVIOUS VERSIONS OF ZSH
-=20
- Note also the list of incompatibilities in the README file.
-=20
-+Changes since 5.8
-+-----------------
-+
-+CVE-2021-45444: Some prompt expansion sequences, such as %F, support
-+'arguments' which are themselves expanded in case they contain colour
-+values, etc. This additional expansion would trigger PROMPT_SUBST
-+evaluation, if enabled. This could be abused to execute code the user
-+didn't expect. e.g., given a certain prompt configuration, an attacker
-+could trick a user into executing arbitrary code by having them check
-+out a Git branch with a specially crafted name.
-+
-+This is fixed in the shell itself by no longer performing PROMPT_SUBST
-+evaluation on these prompt-expansion arguments.
-+
-+Users who are concerned about an exploit but unable to update their
-+binaries may apply the partial work-around described in the file
-+'Etc/CVE-2021-45444 VCS_Info workaround.patch' included with the shell
-+source. [ Reported by RyotaK <security@ryotak.me>. Additional thanks to
-+Marc Cornell=C3=A0 <hello@mcornella.com>. ]
-+
- Changes since 5.7.1-test-3
- --------------------------
-=20
-diff --git a/README b/README
-index 7f1dd5f92..c9e994ab3 100644
---- a/README
-+++ b/README
-@@ -31,6 +31,12 @@ Zsh is a shell with lots of features.  For a list of so=
me of these, see the
- file FEATURES, and for the latest changes see NEWS.  For more
- details, see the documentation.
-=20
-+Incompatibilities since 5.8
-+---------------------------
-+
-+PROMPT_SUBST expansion is no longer performed on arguments to prompt-
-+expansion sequences such as %F.
-+
- Incompatibilities since 5.7.1
- -----------------------------
-=20
---=20
-2.34.1
diff --git a/meta-oe/recipes-shells/zsh/zsh_5.8.bb b/meta-oe/recipes-shells=
/zsh/zsh_5.9.bb
similarity index 61%
rename from meta-oe/recipes-shells/zsh/zsh_5.8.bb
rename to meta-oe/recipes-shells/zsh/zsh_5.9.bb
index 7602ff9f6..7940970e4 100644
--- a/meta-oe/recipes-shells/zsh/zsh_5.8.bb
+++ b/meta-oe/recipes-shells/zsh/zsh_5.9.bb
@@ -10,12 +10,8 @@ LIC_FILES_CHKSUM =3D "file://LICENCE;md5=3D1a4c4cda3e809=
6d2fd483ff2f4514fec"
=20
 DEPENDS =3D "ncurses bison-native libcap libpcre gdbm groff-native"
=20
-SRC_URI =3D "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}/5.8/${BP}.tar.xz =
\
-	file://CVE-2021-45444_1.patch \
-	file://CVE-2021-45444_2.patch \
-	file://CVE-2021-45444_3.patch \
-	"
-SRC_URI[sha256sum] =3D "dcc4b54cc5565670a65581760261c163d720991f0d06486da6=
1f8d839b52de27"
+SRC_URI =3D "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}/${PV}/${BP}.tar.x=
z"
+SRC_URI[sha256sum] =3D "9b8d1ecedd5b5e81fbf1918e876752a7dd948e05c1a0dba10a=
b863842d45acd5"
=20
 inherit autotools-brokensep gettext update-alternatives manpages
=20
@@ -50,13 +46,17 @@ do_configure () {
     oe_runconf
 }
=20
-pkg_postinst:${PN} () {
-    touch $D${sysconfdir}/shells
-    grep -q "bin/zsh" $D${sysconfdir}/shells || echo /bin/zsh >> $D${sysco=
nfdir}/shells
-    grep -q "bin/sh" $D${sysconfdir}/shells || echo /bin/sh >> $D${sysconf=
dir}/shells
+do_install:append() {
+    sed -i -e '1!b; s:^#!.*[ /]zsh:#!${bindir}/zsh:; s#/usr/local/bin#${bi=
ndir}#;' \
+        `find ${D}/usr/share/zsh/${PV}/functions -type f`
 }
=20
-# work around QA failures with usrmerge installing zsh in /usr/bin/zsh ins=
tead of /bin/zsh
-# ERROR: QA Issue: /usr/share/zsh/5.8/functions/zed contained in package z=
sh requires /bin/zsh, but no providers found in RDEPENDS:zsh? [file-rdeps]
-# like bash does since https://git.openembedded.org/openembedded-core/comm=
it/?id=3D4759408677a4e60c5fa7131afcb5bc184cf2f90a
-RPROVIDES:${PN} +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', =
'/bin/zsh', '', d)}"
+pkg_postinst:${PN} () {
+    touch $D${sysconfdir}/shells
+    for i in zsh sh
+    do
+        grep -q "bin/$i" $D${sysconfdir}/shells || \
+            printf >> $D${sysconfdir}/shells \
+            "${bindir}/$i\n${@bb.utils.contains('DISTRO_FEATURES', 'usrmer=
ge', '/bin/$i\n', '', d)}"
+    done
+}
--=20
2.34.1


