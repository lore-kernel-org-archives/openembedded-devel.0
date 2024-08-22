Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86F68C3DA4A
	for <webhook@archiver.kernel.org>; Thu, 22 Aug 2024 16:51:44 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.117])
 by mx.groups.io with SMTP id smtpd.web10.18319.1724345495358068721
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Aug 2024 09:51:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=kfRpz0A5;
 spf=pass (domain: navimatix.de, ip: 40.107.241.117, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I2Te2lIcSXIssaXBLwmoFskocO9TwSuoDK98Ao5fB11eMGoNrc4DgZotmELj40K7mSeY0KtK9s3X1GIsOJvVhWHgVpIS1ATf2pOy1wsrp6/4Mr3Q8dUAYbzVrHx8KwCgoD5b7R81buaTK0qUbQTKymO0pzO4DIIELzBP2QymHDwL+l3zIRVCGGG/TEFn7WvJD3P/gTonpYcOIvnKcG5InxCywRsEQgcVtcCh9A7eBmSuZi+L3a0flqL2aLBh9wgaETTJwQ8K39PYecj/VTTUHbojqwJPNEGStUSdJBL+IUWBb46rrqzMwQDCeRTRbASOJyDPsHpfT/MY/TeeEEYHHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cVbuLaUtR7GMJsJIOUIh7Q67Y825RqJ17LvyhOlvxjU=;
 b=MZCeuYggnNYf2pFhFX4XOrquuJvX4+qFxDL4V7fpUYFmfZU66iObo4QsSpxgf0PNxdWqDlocNaVrqXr5v+7x2NDR14O0HeLDccq03KR93YmBxqnRwcTCH8QJ874JmHHgVi/xBTXIldroxjP5FtIKBNdjlE1waraBUuyjTRinxo2EpTDIvZ/kS8v5siXc4Hgi8163vjBQsQYyGT1ZPImt0sYOsBFSQSvSqk/iY0K+9C1ykKYxXlzFfop+owIqFsf7AeSN02QBpVTW7SPS/wvmJw6yJoLQL1W2PXBrhZqu/jY/dIOy1vyNs+GqdrNSUh7dXAMWfWu7lxJbGedhX7lDHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cVbuLaUtR7GMJsJIOUIh7Q67Y825RqJ17LvyhOlvxjU=;
 b=kfRpz0A5WMXhLuGtsv3/dPZcoJgjsRX2WbDNtkG5uwK9mnfJN2gkbzjL0jBwNvj/bFZaYxRQgrsRZQR/evHi1Vze6AcOJtEKkdS5kcW07/7979TE/TVO8L5mkIoUtyD8DZTshBRjjio5tJuTkVZiphaVLmKFRemrUMHLRAlsTJE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5) by GVXPR01MB11205.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:216::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.18; Thu, 22 Aug
 2024 16:51:29 +0000
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7]) by DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7%4]) with mapi id 15.20.7897.014; Thu, 22 Aug 2024
 16:51:29 +0000
Date: Thu, 22 Aug 2024 18:51:27 +0200
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-devel@lists.openembedded.org, joerg.sommer@navimatix.de
CC: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [PATCH] zsh: update 5.8 -> 5.9
Message-ID: <18cbb26e53adb423c71a7f74b130cf1f84ac098d.1724345484.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0167.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:66::17) To DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR01MB8293:EE_|GVXPR01MB11205:EE_
X-MS-Office365-Filtering-Correlation-Id: e0079f35-37a1-4ced-5a6b-08dcc2caab04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?L+2c8tBrmBX+/hxVSPY2/ksEbIkRQciM8FOjaBtnT0VdIUXw5Bo3z9xUjV7l?=
 =?us-ascii?Q?rLgEzSIYuMlriT2qYcGqmRFf66545+CJb53giKbhIjQ1jiUAE1+XDKZqD89G?=
 =?us-ascii?Q?rWpwFk1VYyB7k1n3Me4Liqo2JBfeJhPsbiq+cBAx6S4bngm1dOeMI/IthrMk?=
 =?us-ascii?Q?4Khmw0roVzU1yjWq7M2a/zu7IQ+kA7sly3Id0PFA3lh4pc47RyaZS10ZGfo5?=
 =?us-ascii?Q?lvEs0bdVbxTedqr1c8gGomOhP1aHHLaBP3WueA3erWs/+Ppl4LRoscMRggf5?=
 =?us-ascii?Q?V+kJhytAI2EaE2Br0EaH9S3deA0th/xebgBiqH/g/HWvMr/bfYztwjODiR/y?=
 =?us-ascii?Q?7OK/4Fn/1oU/BbhCVpL8z0rlAXT3/kqN/xKUJoGuG9NU0D+jLc8YhoxCMssw?=
 =?us-ascii?Q?XyeusmIJpBhBdoTJGAY5SD/EJc5rHtmQfgacpypJbsNzAWuIxDBS6kkVwXua?=
 =?us-ascii?Q?dEzXNFf0QoyIWwnR7P5wDgn7vDoHhETvrhCVo+UVYcD4ydtuhqo5OCkrUBQI?=
 =?us-ascii?Q?jarxGbdooYIJQyNyBMtZlwxML75ScWrRJsh8jWp86Fvw+XO5b8f6Pq8wlyQW?=
 =?us-ascii?Q?vYoAogWC3fRU1VeXSMNhzb4O9j6C3i7lRSTRA0fngfTDppAuJmlSKZe2WTGr?=
 =?us-ascii?Q?V99YHAd9Z6riqJTBnU5x+LG70x76I04Rx/uDiN8WCLZSvdJMk6XVKybM8UtL?=
 =?us-ascii?Q?9F85J0TfYkTquzgKRiuy3LkV6Y0OSG3qPpvllSiVKwiCAYl6bbkkJ0V8wuMp?=
 =?us-ascii?Q?Aqf2QKB0Kx9pGdTBwcz3uqRLmIkWBazoiZROoApIT1Fq1z0V+fZTX8AeX4hA?=
 =?us-ascii?Q?1GeNokIrHTfyU9jSeLh6soo1tIE3xO+EH/46qbSZi+8Ptw5MFM/7vRjllHSk?=
 =?us-ascii?Q?rz3n/gbe1MjvsIRIwNGJCveoBkubi2UHJ0PmEJxNyd00VAeYZp/3Bbb3o4Kh?=
 =?us-ascii?Q?DLFr+CZXStDgKCk5fJKFVeRm2xSPRIa5ir1IEbX9449TGBHsGzAn62Nhdrzt?=
 =?us-ascii?Q?HuQ9c+t7x01Wz/fbviPEOMXqB1bLKp4WzEO8ivQvbpN0cg6rRZ92AfujOlSI?=
 =?us-ascii?Q?flAH/zviLq8yIy9jsOiqDmg6GxaW7BAuX0WDZRjKqhfjAkklRpHIYyLQN+19?=
 =?us-ascii?Q?yILwwX1txt+VJY5TmBJTzcT9RIsUiamBqTaPYaetqZQ0BB4R4ofDRxQVgoQa?=
 =?us-ascii?Q?/fHpFt7UCLTEnmBwSlZ44bTdA0Fda2ZI61fgrcQAr5FT30Gb9BDnPhFN4xB0?=
 =?us-ascii?Q?urUNiI4u9D9Kn7Y2DOIPoS4pQVpxWTM13vo0oB3uejXXNg59AQ2JNbWDUoLu?=
 =?us-ascii?Q?wrKYP+FsgA3RV1VsZTiS/xc3IlVieB+DTB7gaHc3IeiZEw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR01MB8293.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?kUfOWljQb9v0QtTUSHTSYeeTKQCJo523XWcNTaIPFlDqF8p+Qzkg0rsDvieG?=
 =?us-ascii?Q?1m5YnT3Q5upXq/2Ys8iw0wUxrTYk8FsGSXcFthgvExA3xKvAMNsWmerr7PWA?=
 =?us-ascii?Q?I9AtMMP5mR1DFW5rBopCDzgZNXI5K13M5w+EADvh9bUy6IGOFdT+oPPPkyBw?=
 =?us-ascii?Q?eglG1ZRod8yKdM1b+y+i7Io+aCH+puDn9Hg+vmudqPhn0iHxVuGVQohuKhn6?=
 =?us-ascii?Q?cMg3I6F379ONeC5sj22rBnQ4hhiXB/FECmzVlhBJIK7ehFpySQE5uHLVNqgI?=
 =?us-ascii?Q?j/CqDJlwTq/91G3pN7gF3sLnqZ/mch1u2UL314qtF/IqVXLyclNSX1Kv/0PR?=
 =?us-ascii?Q?D2MJZZPOucSsb51I0Jpt+GJxwR0uoj5dKpOaoWxWzvW00xhzAG7zP3hsBICD?=
 =?us-ascii?Q?iMBV/0LaG8JpEOFOHbrv6sLOe/qNEMWGCEJ3RA1HhCXFfS8FV491+98oTQRo?=
 =?us-ascii?Q?yhOGD2hQQCAriERMY3bhSvJjtf1d/RPjD6Oe/gQ9ovLJqddSyJfrmgU/mpcd?=
 =?us-ascii?Q?1eWTpniXsRMKC/vH+rtLidtZmNpfqOENtJW2DE3W9VrxnPEDr8s3r162nqXC?=
 =?us-ascii?Q?QnPbQTgRyB2NxuXfBVZulX+VI/Hb/OKBMF8xTeeBIm/2q3hQVpwm2TDEP4yr?=
 =?us-ascii?Q?imLx2DAbTiqnay7qgdaowbf9x3Eu57o+I9L/yQXiXaxp4c1VzTo9joBQhyQ/?=
 =?us-ascii?Q?89H0LC9gEtlyf4yxDsK7Ayr1riskF9xFeTByPpSM6jjG52t7AXxNed4l+Ur2?=
 =?us-ascii?Q?ccpWXUGGKIrTopzzNikICsSBwkTaiVtHehSdVcZ+juAv3pkPkhXiqaR8Be2E?=
 =?us-ascii?Q?Hs4dV/Hawmdm4Rx0kssBuqr6OSv9rOf3rD+UAB00eIxjiN9tLJACnKTP4zCc?=
 =?us-ascii?Q?K2dCGk8zkSTmB5rXLVDzOa68uRa5SgUETdqK747fH3K57nWYv0JIFUzuXzBo?=
 =?us-ascii?Q?It3V9SPgLxil+4IuYzauz60Neg3aIdLWnLsi2GjeZTI0oZUNovJUfgGtmuWY?=
 =?us-ascii?Q?NirSZvUXvDFvgrzfgmi0tSWpRiHwDqiPPaRuilYN8EGQsuAMabNU/iR1JFXE?=
 =?us-ascii?Q?KhTH9bLNk06wnEkgWFQtO8k5X2IAE864dQYSVyfxsyj/ubgf6cHs/u6Cffqp?=
 =?us-ascii?Q?U7uuYI2A4QFNr3Du3LVmnWDtHieV/IWMIS6ARdssAMdhqgk30tJFjrMS/GsE?=
 =?us-ascii?Q?rDND1OGBH/mf98nL+ohcvoLWwjKygRjUdiXTbiJc/Ww60Tz+/s5YVJHAApEQ?=
 =?us-ascii?Q?mqxFz4GhdCi+q763BM3KxmtEPdPhFa+MJI2TRGBBOyCu4y/QCYuwr2CbAlqG?=
 =?us-ascii?Q?pmAVuK3Kg1rvmYtr53ULuYTBdd3IFreb09n9PApRWHrZg/eo870RGEsw3RaY?=
 =?us-ascii?Q?Iqdav05UytLhXfikM90o1F9/YvRF3/3sawFLsXHUsNDW/Pj80i2Bq66gmlQf?=
 =?us-ascii?Q?7+pgg6NQQCKD/5ol49Nx3gbXTsK4D1vkcLq/NQbzTxg7fj4SRiP2AYO1Sjru?=
 =?us-ascii?Q?ugD2Jv7wVOFYb5IfloiBiCYv2IO2wwmc51kXRMT5i9qMgsXkUADKWOjCTVqS?=
 =?us-ascii?Q?iXf/OJYkH4Dc5J/aPPsvJ/EDsT1hsI/kVw6MCxt8tQJc0ZiqA2ER/tu253xF?=
 =?us-ascii?Q?dQ=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: e0079f35-37a1-4ced-5a6b-08dcc2caab04
X-MS-Exchange-CrossTenant-AuthSource: DU2PR01MB8293.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 16:51:28.9437
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0zcPj2V842NiwJfivCZPFd6oS5FVn5U3aM4j0v0KXIk8UaNzyFrhdifFpVTacFZa275IkfrgKp6BWjpUeJu84Zw/ve36SLRLjKg+2s2x1oY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR01MB11205
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 22 Aug 2024 16:51:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111905

From: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>

The patches for CVE-2021-45444 were applied upstream on 2022-02-12.

Signed-off-by: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
---
 .../zsh/zsh/CVE-2021-45444_1.patch            |  60 --------
 .../zsh/zsh/CVE-2021-45444_2.patch            | 140 ------------------
 .../zsh/zsh/CVE-2021-45444_3.patch            |  77 ----------
 .../zsh/{zsh_5.8.bb =3D> zsh_5.9.bb}            |   8 +-
 4 files changed, 2 insertions(+), 283 deletions(-)
 delete mode 100644 meta-oe/recipes-shells/zsh/zsh/CVE-2021-45444_1.patch
 delete mode 100644 meta-oe/recipes-shells/zsh/zsh/CVE-2021-45444_2.patch
 delete mode 100644 meta-oe/recipes-shells/zsh/zsh/CVE-2021-45444_3.patch
 rename meta-oe/recipes-shells/zsh/{zsh_5.8.bb =3D> zsh_5.9.bb} (88%)

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
similarity index 88%
rename from meta-oe/recipes-shells/zsh/zsh_5.8.bb
rename to meta-oe/recipes-shells/zsh/zsh_5.9.bb
index 7602ff9f6..036a200ca 100644
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
--=20
2.34.1


