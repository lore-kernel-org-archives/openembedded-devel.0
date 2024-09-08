Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3326ECE57E
	for <webhook@archiver.kernel.org>; Sun,  8 Sep 2024 15:34:46 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.100])
 by mx.groups.io with SMTP id smtpd.web11.32164.1725809673142184746
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Sep 2024 08:34:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=Xbn6ovSU;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.104.100, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rohUi79vbHayzfsb3SNjVppwamUE/9BG7VQHS1TycqiuxmKbn5vM+BoYlyQXK4/NlXHjzD8jnF3b748/Zl4dcjybIRDHnMrhGKrmVyGGtAefyNWj4dY6Fz2stj1RP7QMyIUm+/22cDu5Qw3ONb1nHLFR9JwoLACDvY9MYQWejsnIEeDjnuIcOj6MExWtluz/YA/uaHBbuCJBd3GmGbV/wJeUN+oSmAz3OYTEduYyeWSRMHQBPKnjXAVmUikD6aR1x8zUXoJGE6mfJgQxSxQ8fzw7QMezinVACCI5fo/S56Dl10R9PxERswP+F1SN0ZYCO4eSjAxJlUdek6dw0sKPwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XOZTxY17wbij/XXPb+ZRh2OzJ4pNjt3wZRQmcPipi80=;
 b=TZM+K3QjVb0c6YerxqOJeoUaWVg1wbefGWPLE6hF/y7n8NM4a8/CR40tBA0Fv5hO6xAKcjaBXx3otdfOm/MESyGKT8Tyh+6GZU/NG1KjU+ti5p8AghDF3V8GQ2sOwnKm/VjbIJzZQT3sKEso66PqGtgHe0jU54jviSVBk4hNjuyLYsdDfLDU3szTV4Xa44hWFKRua/oLhlmSELoTxnGKThpMGrts4DyHG8As+sEAjeNmu7eP4XAdDxchAVPKxZnee2IjLZ5RtbHBAsSa71R20vVJ+UdbV0+oRfGHlluZFQorXldTTNYrAQLzw1kEcxpG8Z0PLY5a3xJnUkcgmk/gZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XOZTxY17wbij/XXPb+ZRh2OzJ4pNjt3wZRQmcPipi80=;
 b=Xbn6ovSUApKmrq+VmxXA2BhODiqi1v/IXkCXTtEZQAe8dSez/TajJT5MngWfkaY7QXENO50H572fZ51TXlfHUI+CkC+zXFb4WrW6B2flqZdEuEyk3koDHP+/U56oa89Zkz3jxKyvbc2PZzBFt+BWyD1QDNWI9We/3G0TMDvdmpuyCBfYBFln+WMp06bOOYMiJx/pm+y0+Nbnh51gGYhBrwmyp4sGaveToDH87mwRIM0ci3YmEo090KafPNBsjkoo+LfSiS20S95Ei4onpuHxFidveAollnz0ShdMf4Oar5FocRcn7wZmp37Un/jydEOea+ob36K6KMohm4WbgsvDdQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by DBAPR06MB7095.eurprd06.prod.outlook.com (2603:10a6:10:1a2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.22; Sun, 8 Sep
 2024 15:34:35 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%4]) with mapi id 15.20.7939.022; Sun, 8 Sep 2024
 15:34:35 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: akuster808@gmail.com,
	Niko Mauno <niko.mauno@vaisala.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][scarthgap][PATCHv4 12/19] python3-fann2: Fix LICENSE
Date: Sun,  8 Sep 2024 15:34:01 +0000
Message-ID: <20240908153408.4114753-12-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240908153408.4114753-1-niko.mauno@vaisala.com>
References: <20240908153408.4114753-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0011.SWEP280.PROD.OUTLOOK.COM (2603:10a6:150:b::7)
 To AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|DBAPR06MB7095:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a6a63b0-7c43-4119-da54-08dcd01bbdaf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?32stLN2leP9hCUUX1jz0xqLgtn7ug5GdJz3rGnH0942uJXuTmnYzvYR7Sgxv?=
 =?us-ascii?Q?35Elcr7UU7e8Xm/sbT5xk/XThdT1GkYeNz24iuqCxzQEjq80KOt9SUDCQ2Lb?=
 =?us-ascii?Q?WfegFQupQlMnldf42sHznz4QuyM9K5y5aIIdyXfRVg+dHXYbi5DWt4zH7tJZ?=
 =?us-ascii?Q?KB/6uS7qjslyd+vy8MCNtGV9t+Nte8YZpAkmXAQki5UgRqNQW2bdR0eeZLX2?=
 =?us-ascii?Q?UP+j2VJSU19OhZy3ikHBJyvpgCDDyblB359I+jjmMmwZcElLzfRAmrLTz5Mn?=
 =?us-ascii?Q?PxGR3qMj4Aq8cUWxewlkS4W6z5poQRZL9GUJjTNkZLcTtJLgJfJFn/gpvhJC?=
 =?us-ascii?Q?tT2wCOCRctxS6qDtY+UN3tzVmmuhfG2EdrM3EsB+zo8Lt4+EYPDquPYsCJJr?=
 =?us-ascii?Q?cAerCtMTjO2FFD4/q9Tqwqi5nc/AXXsxfSwUbfOiIpQ8Tglrn0wn7KwK04Iy?=
 =?us-ascii?Q?IGZlzksmyKBQQzS7iLqUR6h/VMeYmj1OaZxlnez5KWcqiJSze0hHeJdS9nMA?=
 =?us-ascii?Q?6WTOos4yO6+h+B8zYRU8s9MBy2S0cKDGA292Ab90XRDzIARZvacbZ2EsPYjw?=
 =?us-ascii?Q?OFFCchzDqQfDsFl0cI1b1cjITs6lxKHCwThFaRlZe9jp7NkVV3+PNKn2PG3i?=
 =?us-ascii?Q?FSurz741HtTHby4CKNOsVl5LWUgjQL1PHSrzroOnrafnS5y280RCchDXNCON?=
 =?us-ascii?Q?qvkPCFkwWQMq0gD7mhTWI0ysXuTK8Io3d493dc6EUZbv8u8Q9a5P90HwSpSz?=
 =?us-ascii?Q?XNAB8uDrnMhzNdxRzjlzAbBqHAXlhjaW9MgvSCpYzN0IbY24005xodcPxLz7?=
 =?us-ascii?Q?jmtrqSvkTI9nm7mUuO7on198C1foQ4BdlOhYf008tqWJwHlVs75VIEJpOwB7?=
 =?us-ascii?Q?4DA3g0whS51c9vnYoqjQs7Mj2EECO8enlIZlOucPzQAJ74ciiqXgtwerGh3F?=
 =?us-ascii?Q?Si+FnRxT496vkDKqWj1tS9QsgUmLYthjUTMmWPuJtYP2/kqO0Spwngg4BvZD?=
 =?us-ascii?Q?B4W7XIoKe+IXoW4hfTrjjOGWeMH3Mcxf6ojEQ14Rvf2IRVymeJ7i+cXbdMK2?=
 =?us-ascii?Q?gMJD0iebgv+qW4iV4+wh7SV8og7nTHHXytZyP7wJnzcD2FmU2s3814D7UlqR?=
 =?us-ascii?Q?7yPghCqEtx4vvZobrFXicZMvGZJrt9UlW55VoXtIPNP9RGqozJ1He2bhJoH+?=
 =?us-ascii?Q?5jrwlbEamRxLYnHOGe6X7PflPLHFYcUwnO2C3X/CmkyhQlF/sKfZ7GFkVxyV?=
 =?us-ascii?Q?0+EgYjr3Z8pFA5XDnvm6xVdWvEm0yZ+Zk9DIrNjkK0DcX7Lf/HJj1gkBh7Uk?=
 =?us-ascii?Q?HjKzXzjsGAD9kaNIoHkNpBEjLBRR+pJ8vekn/m2Vm3VnxOC5hD4clbnPrHzq?=
 =?us-ascii?Q?W2dSWtg=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?BHuMj9glyXOC5I5BqAEtg+mL+rK+vDiLga5aXXQdwljwambCMvar1chxSmO9?=
 =?us-ascii?Q?2NiLP6U+1TT9RDUfWGJewgEr0UWruHRyTB0nWB2eNydSc35NromWJFV8h5rK?=
 =?us-ascii?Q?4fDF7wF0PGlt5EEvlVtakn10BW01D9Ov8qzWAmmUlcCaUwNOGM6Z6HnV5kQd?=
 =?us-ascii?Q?d26vz9FlQ0M4Zr7VcmNea8V6RKkQB2NLUJtxiUum/Lm5eT3YZt4hmyNm5c+m?=
 =?us-ascii?Q?63CoJY54Az7v4wGf0R9s5nLOIg33kcDZY8mq67pDjlD0EY1lJwb8M/8O+Ih5?=
 =?us-ascii?Q?jQBJBf5/A3rjux3bYXYIVZbV/IrK8IFDv+ZOki5d9Rj43JP+ww3JspP+wTjU?=
 =?us-ascii?Q?B29/2DzR7Kjvp4hok3dqNB10V2YQY/eWI2ugiuR4MPmmZiFJxrTVvyS+Sjlk?=
 =?us-ascii?Q?LR38EcMl909zYYrewQfLWSfR1GdYzLcxs6A65u6dkZ4jpaEPPDi6STb49/Ek?=
 =?us-ascii?Q?tR4o4M5IP8l+NHlSWuEoV4nRs92uAfsNeRzVHFNp5vRcywOYZksQz9dmbfBy?=
 =?us-ascii?Q?xlvJyMBvjzsIVmP4QARgzNXiISlzEMvJQ1cp5IClCrtXi1qBWUgiry6zTRMp?=
 =?us-ascii?Q?Y5wgyFyk+zNw7XRdkHUjFau3/WFzoarGJ8XGfjx9bGV4j8ko1VOUpOVxYezL?=
 =?us-ascii?Q?OR4acCIx1pMFLc2cCkssSTbBHzxUco486koxRAbBhrPxFrMJnnRFbK0XS/JL?=
 =?us-ascii?Q?rs6mo2zTo8xUvJy31NsSympzgeOX1fO/49DDMeyCkTMXjAjmel+TVi6u8jvO?=
 =?us-ascii?Q?kQQh1m1ZqRtvWuih7BSlN1F5Dd/ItCSfY9ElXJRGuf9tUCFvyaKYMd4EzHGc?=
 =?us-ascii?Q?DxtP0ADgr1AO1yiErkuI8Zyr6ceHfxVQrdLMUZyoQvaeONP+3Vs8y3/7fgwQ?=
 =?us-ascii?Q?zMkF9sAm+iROtKwhy7V/JBeGrLayKmHWNk0WLmDacCfbWE/V5N4VXgKEvEAY?=
 =?us-ascii?Q?f8GPYZDwisLY+3xqDPv3N+Z9BkT3i3XqHDJ7H370Zfg0X05q0n9sDKE0U+BC?=
 =?us-ascii?Q?gVT5KaGmjJCxdjXr1nbsXXP50zPjXOfLDnFYypDlKXabCZebJmUlOv6Qqzon?=
 =?us-ascii?Q?UN6rmIG1XEbPkCLR9BoLLgCFZoFUSWeMRPQZwc8v5QlWZAqtvCaVbt+hOgms?=
 =?us-ascii?Q?353ALVDqWFttmw4yjUrULRbKCo/y2Q+BNoYbr7DSAoKKsf3YecKZZBhSCwe4?=
 =?us-ascii?Q?sLY3j1rGjPdVCou1JiLYf7/zn/xHIsjALazM6d59UyV7mXboZ2/w9soZEg55?=
 =?us-ascii?Q?b1fx5UctvsLkHytqhwfOy1Dt/32JEzM4f7aTiTKcFBeyUwLYljHbRhKFibg4?=
 =?us-ascii?Q?3xrQLGx9+/iXuUI7EV8+O+3BZiWrsnBwps9MDu9a22qapIVClpOy1RJNEBV9?=
 =?us-ascii?Q?JOHgxvZR2VakQQN1gxnYArrF7X35Zm8Oe0+Az5HxscoyNPWyfK9UjGL1mZNj?=
 =?us-ascii?Q?CuxdrezdpQZbo6/dKjH+ahiTN1gmm52KiqDVXcfNjyXDL4nj6fdDnjV+qKfW?=
 =?us-ascii?Q?H1Vfs58Ic3wHNO+28jHv24E9o7j+rRUXDHfUl1lHSxun+yfLx0Iq/mET+ayR?=
 =?us-ascii?Q?8u8Fn7Rh1frxi+g68mwYtA3UCfCGCfG7LMDcpKWIcf9pj6EIRmTGLpvf2Hlh?=
 =?us-ascii?Q?xg=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a6a63b0-7c43-4119-da54-08dcd01bbdaf
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2024 15:34:34.6215
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8yC1yggb0Nwicy10afPEnZ0UFD5jK3zD9Pyt3L+4bSu2+dVRWshkZ3zbT4ROibPiN6iw2GG3+PKcupujtlJs5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR06MB7095
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Sep 2024 15:34:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112152

According to
https://github.com/FutureLinkCorporation/fann2/tree/1.1.2?tab=3Dreadme-ov-f=
ile#license
and https://github.com/FutureLinkCorporation/fann2/blob/1.1.2/LICENSE
this project is subject to LGPL-2.1-only license.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-fann2_1.1.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-fann2_1.1.2.bb b/m=
eta-python/recipes-devtools/python/python3-fann2_1.1.2.bb
index 2fbc27713..2099d791d 100644
--- a/meta-python/recipes-devtools/python/python3-fann2_1.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-fann2_1.1.2.bb
@@ -1,6 +1,6 @@
 SUMMARY =3D "Python bindings for Fast Artificial Neural Networks 2.2.0 (FA=
NN >=3D 2.2.0)"
 SECTION =3D "devel/python"
-LICENSE =3D "LGPL-2.0-only"
+LICENSE =3D "LGPL-2.1-only"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc73b943dc75f6f65e007c56ac6515c8=
f"
=20
 SRC_URI[md5sum] =3D "0b85b418018746d63ed66b55465697a9"
--=20
2.39.2


