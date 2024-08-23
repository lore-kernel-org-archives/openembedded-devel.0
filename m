Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40363C531DC
	for <webhook@archiver.kernel.org>; Fri, 23 Aug 2024 10:48:22 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.120])
 by mx.groups.io with SMTP id smtpd.web11.13464.1724410097079929825
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Aug 2024 03:48:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=ryQku3gT;
 spf=pass (domain: navimatix.de, ip: 52.101.69.120, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e/fRNfbqwLGw2yNr/TJ0LgXrMlF0UVBjCpmcJM0gdfXtGo9jhFWhCB8H1Op6mrLvh1bcXweqiiGlSGI9tD6W9r5HOhOUo58927RLWPfn7jB9B+BJFLdTjQCJu2onCqv8fHn2HZOk7Ag55gubKqENy/3m2xjqUebn6IMZahnZS6dW59rb0xxw6quVPjHu2xAkfu2lZ8qG/LR3Ae6xAcoN5g6huOGSetb+WqblOhBDRPwrQGo3nOZ8lpa6Awzqp58n2WoxOBeTiMTX1klkv/nl46VX6CYoMqxOiYZbIakbEIrNynrpysSibJhdKXnM9k68F8ovV6cridLDcyUUvJalww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zzL03eGvwsNrQayzeXaIj07EhRYOj8A7Gctp1QL13kg=;
 b=iA7ncUKwQW85AnCTEQFKsEQbPiYMH0sO+ebBlYs+KB/+L0IolMGySdyDVWVkvFDxPlPskHv03btSBCJ7T/eTX5wV+bn2GUGQ6h0OUiCvrrk10yRDjEyI7uSx0cRtVW19N1Vfl9Ske8RBpZkNVZDTQRcSrzoeL3nUUIyu7h58pA+/3QVtKH9hLNlhrzzLs5BMuGdFfUJwYH5tISsl/yWm/Bl6AFen7sRZ9jEhDrljSoc3OOqeSH61hHGlDVjL1LbGSAhHwaD5wZWBLKy2uZOL33TMCO2in52ZR91dTmSh+seJi91awkq4O2XbOM7EJsW4UjGP1kKSQ2GK6+gzm2XtAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zzL03eGvwsNrQayzeXaIj07EhRYOj8A7Gctp1QL13kg=;
 b=ryQku3gTTfK5ey3Z9N4DNQR1JGDMViu40hkXuF2EZAIaQFAxSAHqkmjXrNzTTNX2YYn0kzJMFQfeZNQiRemiCec5v1kdcosda0aoj6DWOIfUuVRycyw8B9jUx1zB+xdhBZXAO7ZXhj4AjCD2TIylCvXXhH3dJNZMWvvZxfklX98=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5) by DU5PR01MB10485.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:51b::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.18; Fri, 23 Aug
 2024 10:48:12 +0000
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7]) by DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7%4]) with mapi id 15.20.7897.014; Fri, 23 Aug 2024
 10:48:12 +0000
Date: Fri, 23 Aug 2024 12:48:11 +0200
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-devel@lists.openembedded.org, joerg.sommer@navimatix.de
CC: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [PATCH v2] zsh: update 5.8 -> 5.9
Message-ID: <74582799aabab370cdc4643ddd45544438f17aea.1724410090.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0239.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:8c::14) To DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR01MB8293:EE_|DU5PR01MB10485:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b80e072-3530-4fa2-f6bf-08dcc36115c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?F28aoUh+CBYVfHRa9jAyDSpQC3T9J5Nlyf7JYIE253rlRSbpp2KtgZ9nj8Bb?=
 =?us-ascii?Q?PWzZlJCRdD/rt7wc4DbadbY7WJJ7KEMFiToBYbJ9cBNQGMWu6XLsC337Bc+q?=
 =?us-ascii?Q?EkbfhttIeyJJyJi7Zj3nJYU6UgSDWsE7UVUbQVOUlpnzyM4uF2RBjAkZ5X7D?=
 =?us-ascii?Q?mgz1biHeZTUZ7sIDsHVQkJq6Q5td3DIly+HJZ48q44Gk7lAuybW6AJfwKpO2?=
 =?us-ascii?Q?68KXaS+fBqV+A5Rsnc5l0O4gUsjr8zjE2Gfw6BxRUgUR/BQAMGHReY4ThRrk?=
 =?us-ascii?Q?DEFZ+GcRIi8zfHFq+oAiNsnZASbkp5UYe0L7OVHHYG7PjXaiv/7iMbkvDCbf?=
 =?us-ascii?Q?nA6MXeqhTzrsLlbyPktm48tm1YMGYl61xF5Xck1A4Fmt4PQrQqhJesobabQB?=
 =?us-ascii?Q?9EPWZ9ws+Fr/1qKToJfb0WxCwDAQb2JE0EsN5I1LBDsyNfZHxwFblyEsJNBb?=
 =?us-ascii?Q?sONZIUAwY7UQ8zrKmWV0Yr0k53rq1gjpbYUbYvwg6mkmSFL0DeQislp23GNi?=
 =?us-ascii?Q?01eo0inIXfla1jcCrNZ4l8kyaEyDT8fypmDLi+qK686DSMFezoodsrlMY37A?=
 =?us-ascii?Q?KOX9y9QrZ3C+66y6LsfLkZFDIM8+FP9CiyWbF4uF/HGBy41+Rh2T4nmck7z5?=
 =?us-ascii?Q?+wuKjoPcGz8HzazU+cX90+uZ5fgoA8qovULeSYLyiyXjTFye75mF5L/7b+el?=
 =?us-ascii?Q?vqfsIPoyJkIltRxuj7P3tdN+O0txxdMchqJqtnrKtebZtt2xKVwLtfGmUm4K?=
 =?us-ascii?Q?CbTC0GNRwp213cn48VK2f/1WFzJioBpWcpJYA56qozlFS3DuKHL/pipPywAb?=
 =?us-ascii?Q?3wxr9UMVrImSpP8/MVBA6jBeyDxwEQzqOfchR3VyVqAuDFgV0ZHv6kx4Zx+K?=
 =?us-ascii?Q?T8wW0m8GonP9BJ0V/ra4sEhG3bfH3Sst5CvZ7Kt9lBM5nrE6aEfDH02MCLFZ?=
 =?us-ascii?Q?ImkprEOYjlOWY0HtFhFO2yoBHFM//570lLMnv97shMAeBJ8PaHxbp1irX/ys?=
 =?us-ascii?Q?ME1X5bQBa3eUgzHGyDTa4HMcRlRLPnxeo+gdeRDHzBzfnXOpwIoG7YEMJkHH?=
 =?us-ascii?Q?i4WMOFdpxEABXdIMf5TNq4OperH7ZQXCWzGSnbKhB2oFMfNkY6o00E11t6Uk?=
 =?us-ascii?Q?xUzWM3wThbxCpBIL3f8dDp59WJjdW/9p6lEFLHuDHLxct/htDoJR1DOmeonU?=
 =?us-ascii?Q?fCYLlt5a1cVUzGnNKRaA4crXlqlJqHjC7JdA35v1TGCth9QK8iOVY6Blk2IH?=
 =?us-ascii?Q?jJcwNwsc+qW1UbjezABmjrfJlQy1uC1LZJU8ouzRaaY1YT/szh8t82+ZJ4BY?=
 =?us-ascii?Q?cSg=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR01MB8293.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?lm0PtCIDJr1rX0645jdx7NKh3J5AeEhYyU4jfB+VvlM5AlI1zRKJLWIodclY?=
 =?us-ascii?Q?ZNDLJz9K3tM60doIszfJV9drDgXppRAQ6lpNDWDknEzfOMvHNBU62HkI06IR?=
 =?us-ascii?Q?J/onYcWBRSbLNKm4jvUjXBmKYZgcVto+rXT1boVQkZlD2uvFtWHz0vdL56uN?=
 =?us-ascii?Q?nt/i4cClsLqTbdhhqfLeEhjUdLJ8K3JYQh6+BRj0iqWm+deU3jM3XQP/yt69?=
 =?us-ascii?Q?VqSJjrkYdDhEhmzDT835MAgy80OYHg167OZ1CH+SBZl2MYAcMzJ12qxj4d5t?=
 =?us-ascii?Q?WgkyMW3jI0K1wpjWdxbGgKhX5Y+t4HPjIE2xjMt+WLESo97GUfkx+nH1QpCx?=
 =?us-ascii?Q?7odGogcwdWD05xfp3yebnM4oauXbLJqqpHBQw0/2W3jwKSHYguYiS5QSZLP4?=
 =?us-ascii?Q?qZPe89CC5M1H6ZSNVDJcJ9rMFMWZ/wujmfxnEgAc4Z+KlVD2EmxKXAFwEzFl?=
 =?us-ascii?Q?FIoxC4VOYyRpUUuzcBNRoKxQFtvc9vVA2QOXn4NCwUKw/X5sol/DG+6BwYzC?=
 =?us-ascii?Q?ONQPlKZNYGna8cDqIBy1iLqcF0+fgt7TafDgy9U3Pzoytjv85PNbSGv/Rg75?=
 =?us-ascii?Q?SyHuP43RZAdYVal7D+HnwOxOI6xxm3Sc9B7HotXRmGpW2zcMlVVeFV/4ROXt?=
 =?us-ascii?Q?O3JwDhCFW4GXCUw/VGwgw346KoQNnuM+BF9HRe+Y4QCuVRPSWsUHDh7AJ9yy?=
 =?us-ascii?Q?2k1ktdlAweDTVODlMfMi3lukhAHG1rc6IZxJGnGkckta0KiTzZiibkU6ZcQR?=
 =?us-ascii?Q?Y+4A2VU7VbpZ0Sw1hADL4y462LnSt6flLpvaR04Fx+MQNFiATFXJ4vqVyia0?=
 =?us-ascii?Q?QkjVw9+BGfZ+UBsz8/EkbzltwyO7AATQB8HIBxvEgdi69cmttp/k7tqycI+A?=
 =?us-ascii?Q?fV4LrY6hMz7MXTqptoiEF/5cHm13iQQkqncCQ4fQVcXaHiEhMSVbi2l+X3LZ?=
 =?us-ascii?Q?adoputJC6oe/gH/y4j0MB+fpfkJR/IjScKqWppt7bsfHRdsY6UIYJDsxnqzP?=
 =?us-ascii?Q?ry/HNCX9Dcl58UhveO5iCE25YeDKOJOhqaNAJp+cAO7ggDjbwiVQCbmLGu9H?=
 =?us-ascii?Q?hcJEVh+ccPsiSBobm07trevA3y9FX+ExsJ09dFffBHoZRENjqWJw6iC04Jr4?=
 =?us-ascii?Q?6SsNkgtN8mrLnnNUpUdl558k1eNknDhIHe1hujC/r3BM7X2dehVKOcl6OO3X?=
 =?us-ascii?Q?nI6COdOODCSwST2TR4XXTzRCWgPkKMk6c2bKnS12Lzf3bzoLHxItc/VLY66M?=
 =?us-ascii?Q?JPct0i3aezR2vG1hszhm7lStWP9op0zWScTar3ULsQH9pTUlDmayyOwZVt8Z?=
 =?us-ascii?Q?HCSlcnPis9o3zttIZ64fbGqEU6olFPCMnVF62KmPjB2Z/wo3rIKoVeffoYm4?=
 =?us-ascii?Q?Q/FyUnfseb7NySuVMHNbAXJ7JEiMbvlKJdfpFEHuCRiAexkkb3PsxMn1DI/Y?=
 =?us-ascii?Q?NwpMIVOpMvA5i3u/jj4hbmdR1gtlhgvplH4Wo5duYq+vLNiAYKh19E6bWn1y?=
 =?us-ascii?Q?KEklQdd5T5irBO2YEr9eSCDzBsw7OulXEhDb3UoNZuisahxrv91FEa/Tqpgc?=
 =?us-ascii?Q?maOO+teqAPmNGEMNfcGoDd9gxO68Ldlu6qDQrSq4gNIryAgt+zvSYopBHZ7j?=
 =?us-ascii?Q?8w=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b80e072-3530-4fa2-f6bf-08dcc36115c4
X-MS-Exchange-CrossTenant-AuthSource: DU2PR01MB8293.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 10:48:12.5685
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f1IXxk4hePz8QH7G1Rzqmky5bvSfPSPZVhFyESpo3TOB8lJhjeRcm1Sc1bRFtmU1d/3PGE0mkO3RieAjSw8tjHzUpVfPqcmih8xIxR0eF1E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR01MB10485
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Aug 2024 10:48:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111912

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
index 7602ff9f6..033feb208 100644
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
+    grep -q "bin/zsh" $D${sysconfdir}/shells || echo /bin/zsh \
+        ${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', '/usr/bin/zsh'=
, '', d)} \
+        >> $D${sysconfdir}/shells
+    grep -q "bin/sh" $D${sysconfdir}/shells || echo /bin/sh \
+        ${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', '/usr/bin/sh',=
 '', d)} \
+        >> $D${sysconfdir}/shells
+}
--=20
2.34.1


