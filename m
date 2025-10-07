Return-Path: <Sana.Kazi@bmwtechworks.in>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9746FCCA476
	for <webhook@archiver.kernel.org>; Tue,  7 Oct 2025 09:21:32 +0000 (UTC)
Received: from MA0PR01CU009.outbound.protection.outlook.com (MA0PR01CU009.outbound.protection.outlook.com [52.101.227.88])
 by mx.groups.io with SMTP id smtpd.web11.14496.1759828882678779437
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Oct 2025 02:21:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bmwtechworks.in header.s=selector1 header.b=ECdQa0ij;
 spf=pass (domain: bmwtechworks.in, ip: 52.101.227.88, mailfrom: sana.kazi@bmwtechworks.in)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mnt+sXoAL0jPhTtLGK7LF/EZo0EeiEf5SWU9cRrszDs3vbPlvOo7mO6lV0JbFVrY40jjRP915AgK85z8SdSXjRPcjJBbIXZ502wUHSg0VQWX3YI5ssvTXiPE0w6AjTaPEvawryfJWHomdYjcjV1P6eCQ5A7zz+iCX7tsidMrPqvZpTXoUCCiNZfTPRGx8hAAtShzpTB1+6Hqrcyd6jme+/h8tUL2Dmd2wpuJQZiUX6qgEqJ2H3bpaOt4VcJHhvDQyownYQIu8h1MkKg9+o1NaU0lZUt0ovsdzPnEFrrj/oemhteBtly9r+kOXolzY/VDtBXXAOjonrnrdxIXlJkZsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d2BrozVi5xOUWvYgr9ymrCSLxTxD5OS6uswPMKYqLSI=;
 b=Sf3Ks3E7Va+hrp+9fca3KNR6l1qPi2ozXMpA3d6wzWzsBCaNqy/Wa/nWWExVRLqvOu99ZkxVNfy0Z/CuomFWVmuUsWUb3/+IhEC7Sg6ErEz5BX7jJ2qSNCBTHL/eQCyej7f0KFKen7XTwI78xD9N1rBX0oXX/ipHcj3GZwXrXDgvEXPqhTS4AZB45AVnET+u1x1daIkCNRRPCdLfTsGxvlTBGFDX+MWvUeIftBUhymDml/BX5zPuUeM7RfIMlKaQ89JFVLKtIu6has9AbwDLaf0dvxuRk3UGC0liotTgdA2yMAw/0PpdzEcO8kksbFJtu5LaveN2QQeSbXJe5jOZlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bmwtechworks.in; dmarc=pass action=none
 header.from=bmwtechworks.in; dkim=pass header.d=bmwtechworks.in; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bmwtechworks.in;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d2BrozVi5xOUWvYgr9ymrCSLxTxD5OS6uswPMKYqLSI=;
 b=ECdQa0ijtiY6odf6GjBVBreC2/YI2McgDfk0cH+FdIMhfusdWdN15/ELQ5ZhmjbbukrYrM3XXD0G6AjZu62wbZDGZDVTc1FNaL5onuxgvamq+Newei7UPw2PnawUAZmEkXGim+3ObYgYkPIQg9DBe3unh2gak7rp4NDb2QsC590smoCAvKNCMoEL4k+6W4Y/ygqM1gs3mKODwl0S3X652s3vk3vbbcHmhgRv1PEmF4oep+bB+8GGAo3nrUzm8kfFqptxzXBMB5hyQL9sQrt3f/NzgF3X6dvg0fcP/klM1QadJT1roddBdw+X9VwCOKb9St79fKFwRbY9DSsPpqwxQA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bmwtechworks.in;
Received: from MA5P287MB4602.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:19a::20)
 by MA0P287MB0764.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:c1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Tue, 7 Oct
 2025 09:21:16 +0000
Received: from MA5P287MB4602.INDP287.PROD.OUTLOOK.COM
 ([fe80::478b:23ae:5e3b:de95]) by MA5P287MB4602.INDP287.PROD.OUTLOOK.COM
 ([fe80::478b:23ae:5e3b:de95%7]) with mapi id 15.20.9182.015; Tue, 7 Oct 2025
 09:21:16 +0000
From: Sana Kazi <Sana.Kazi@bmwtechworks.in>
To: openembedded-devel@lists.openembedded.org,
	sana.kazi@bmwtechworks.in
Subject: [meta-oe][master][PATCH] cryptsetup: Update the license field
Date: Tue,  7 Oct 2025 14:51:07 +0530
Message-ID: <20251007092107.18392-1-Sana.Kazi@bmwtechworks.in>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: PN4P287CA0014.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:269::17) To MA5P287MB4602.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:19a::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA5P287MB4602:EE_|MA0P287MB0764:EE_
X-MS-Office365-Filtering-Correlation-Id: 888c267e-01c2-4092-56e8-08de0582ddcc
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?LQjsofj8C2vuI1OGnHp+222t20LZ8Hruuxb7ZlwMOuax8Lgn25U10tBYaDeo?=
 =?us-ascii?Q?c/gidbLIjUe4MzO9CF6PuSHnkJm/Lww9iUn/D6QhkrilB3is2n17SOU+kohj?=
 =?us-ascii?Q?rhGaTaWUcqpfdxXewDTUcspOJB1EP+2mFxrlAaxPgem/CGoJmlmvJCyRYCmz?=
 =?us-ascii?Q?4KtTSN8RvO7UhA6FHuEHhAXPZjVsp6Aq31ZYKeS6jFA1IwvTl5CO7Wl8PVmI?=
 =?us-ascii?Q?oCSrNGhQnf9kIXjMTsaPQaLnzi7q/ezVy96esZHiRsKz0ZyvpT+QZL7FgpMq?=
 =?us-ascii?Q?siPbrpDEHsYMZvAuSZfTy1QNe83Sjm4Q4X52aEKK/28We6OWIqvCQERLY6zn?=
 =?us-ascii?Q?nDqsJ5pVV4ZjBnWgqcuGBGpJYJIDxtKhXB2233ex89+9aZTzJephB6hfY85O?=
 =?us-ascii?Q?JcUOFsbxmnxS2TY3hvSSJnfam6JWd3N+wHqCHYzA8/8TlAFXBIsdIjzYwewO?=
 =?us-ascii?Q?C+NziYEur+qOoKgtS9ML49JvXTH6SCGiwjOx3tSVwEMtIWH7QxutOeBkXMtC?=
 =?us-ascii?Q?evhfth8lwc3CQCfENVdbvFK+a29PV10s9Zs/726B2XaECgYLckn0/6EA1igF?=
 =?us-ascii?Q?LUiccz1a0zjwqAwaVXGQaotd9TQk6meL1iXvVNHd979GL1RNVVKBMvhpi0c3?=
 =?us-ascii?Q?tEC9OLKevl5Sbu0NTlGAnqAdPNbwARkhL3WRHR92vAxeN2TE3jmcCPjMzbuQ?=
 =?us-ascii?Q?aozUaKFQVQeltLhdM+S77u1nLcSsZo1zaQ5gvHunZFwt1FPnEUUIsvHa9AKd?=
 =?us-ascii?Q?6n/BcffZ63Knn3yu4gxSWLRrPCYiO4/wJ0MysxAv0Z6OTvJru/Ja2VUls1c6?=
 =?us-ascii?Q?5oFO62YsOV7iDt7bXwXtMqEJdO+6mhHqvvTtS7Nda4rGFjHRLoKmW09krm3G?=
 =?us-ascii?Q?G4JagJcpVieMnKQXDE3vzYwxKcbhw/fE2wJwR72xHOB4A864TUqMWfnU9+vw?=
 =?us-ascii?Q?T55p5NyEe7PbIBfJNmrX9Yv+aUA9ZbwKsI5WR8WlQH+G3HTuB37N6Y5kFaLr?=
 =?us-ascii?Q?cVWglVbLoOov+FnCv+kPZc+Fp7gkKByLP1bLmJITu0YcnVaGf04r7GAkA3vT?=
 =?us-ascii?Q?KcNmG63C+p6R/F2lFvMF7IF6f96/QZqdW9+qCesX9J9B4+4BJvhvbQvMiLd4?=
 =?us-ascii?Q?vxNkAjrVGToKxdD2hLWeItbqvy0QhWA1vi3pqCcezEHQuOCLFw3M7hWceNvo?=
 =?us-ascii?Q?C5sX2HzxmkU0ECgRDJoac6skXjbYSQDVwiVis2fUFP2+RUt9WaQrUxBRkfYU?=
 =?us-ascii?Q?KPOaRLCEAoYWpu5J3/J4ZEHr51c/X37X66SWBXZDnCJYvHqM+8YXGep1EH0K?=
 =?us-ascii?Q?h/Ro5gPqeWkFRiQawpVbMIyjU6UkU1XX0y2XnVynoBhUV+WIh0GMAnrdS1Le?=
 =?us-ascii?Q?xpPemhjko7O6Y7f9RUCxCQfUaXjNJGJAU5X4stGLMD2pwWWhwyHu/eq13sFs?=
 =?us-ascii?Q?BZAewzzDh+wPOPcWMp5jo0JZrmmwRBA3?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA5P287MB4602.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?8SI14Z/ECDh5mRl1nWYt7p9aWhIbE67z3GITUdEF/zS6sl1A6BmqCDdQBRah?=
 =?us-ascii?Q?/4h7rAxJjkCqnQLCnUakkjmWd4WWlU8oASu0aGB3HJJgwAs96iDnZt6C1q3S?=
 =?us-ascii?Q?A6ciEY1Lb+pxR48GzRoE/MIcg8jtQ+b49gCkGjTwkM31qHwR8dRRqq20XUJv?=
 =?us-ascii?Q?Azd75YO7JuFws0Bpr/KOxkA8KJET5zYcQJkdiZb8LdhaJqql1S3woug8jeIK?=
 =?us-ascii?Q?WOZqB2nzzzosIv+rzw7gZ5LL+0UUPXL1y/3rFz6hlc7qvr5+NhIP6oYlgKiM?=
 =?us-ascii?Q?l9hnqplcipgFpteouc3t3JAnuXA36MajuwtZtmxmub+q7utQsqt91AbrDt+M?=
 =?us-ascii?Q?95bfm5s/YpkKeF0AXZdd7BVg3JJHGswLUX74IOn257AkCEOwrZPaCip2t9Ng?=
 =?us-ascii?Q?mDIdQu7IkLLaHHvIXq0c3mdTByn/kVAksqz+oxlYg8bUIX5pW/n7SuBb2gHa?=
 =?us-ascii?Q?bChrgKeIShEu4mnsoo9MpAK03a01ZGETHkWHssJv0xumt3MlV8RbtRYUuJp/?=
 =?us-ascii?Q?fv9jqm00H4R268rlBB6hiW7up0glutAqSbXrYJ9Ao8gIl0gMqPHkyhFWfIAA?=
 =?us-ascii?Q?hn75za0qf7mLRhZyOWckutMczOi5Kq4o4PmXGdFch0MtawpJBX+UDWyq/mZn?=
 =?us-ascii?Q?jUB6SNZbEKKB2gNirS7dqu3ConYA//x289ascHep/RmkxBylYVy3WHsx1IDD?=
 =?us-ascii?Q?61v5xiyAtcGa3ecNczY8GBUThd9HlRDCxl53x3XzIVN1djmVJoR5vtRF5CyT?=
 =?us-ascii?Q?jvH6s1Udgg5h5n0/slxKQWiaIMO/nFQ6loBORYxT/JQToXDeifJO/FAhv//P?=
 =?us-ascii?Q?zOlNA4TvRVppg/j4PavGhALteW9CNndRGXGQYt769fC+U75wIxQLjLIIrmhM?=
 =?us-ascii?Q?6Poj9x7ruFyUNW6I/UdgNwXkhQu5CylC5k1988XPc09F1CkyPedqiJ6KG6Mw?=
 =?us-ascii?Q?Ow3mEeZ/y9Wx6+cyEh1XdjeuqfW+wGdW9zOqTbDBdtPm6ydjh58O7Bj8ywaI?=
 =?us-ascii?Q?3FNSZf0XRmupAUc3pJFGzjpg4L3Xwd4JS7byCpOvq2A1M8x1YtbeQYjHEgM5?=
 =?us-ascii?Q?0Ar4HWdCfM2LPPlEKKHQv0ln3/jtvL45p6QhP2L4X0VgOgjDZBKpKEiM6Ty2?=
 =?us-ascii?Q?vX9mrPnsF8wH1JCbPBHMKKnLs+J2sIQA0Qyb2cii/+XAsebQzUOtIfslbxv5?=
 =?us-ascii?Q?R+rcqBFI9MV91U3GHl9mPjht9NrjtjzZdh9YQzBlL9qWof38p/f3KhH0fSy+?=
 =?us-ascii?Q?bgihrRtSIZOysZWFT9g57hvvF55clnJZKju8oPgJ2aCiMpCIDcghX63zqWiH?=
 =?us-ascii?Q?4PcjeB5K4+iVBL7Dz+hXoJINYRarIX4Npzm8MXyNr1ZrN/uwnmy3i1VS4/cY?=
 =?us-ascii?Q?VkXIKF32/jBQ5KFK7jJXyAbnflUB0xsBPkTmkStRM57rtptsFU7W+6+oAScw?=
 =?us-ascii?Q?916UKW0e5wkbk3PukUr78X2xun0ODAiwyJ2svZjOneF+7ncm0zoA6iOPetZS?=
 =?us-ascii?Q?whjhD87ZSCsH4eVkNq5e+zz3/qVfVPEZywTFCHj19h8fgb7WXbkCYbWWCIrz?=
 =?us-ascii?Q?pb+gDajUbvd6p5MYcwoRlGb5wHGOX4s+Udo9dVCp?=
X-OriginatorOrg: bmwtechworks.in
X-MS-Exchange-CrossTenant-Network-Message-Id: 888c267e-01c2-4092-56e8-08de0582ddcc
X-MS-Exchange-CrossTenant-AuthSource: MA5P287MB4602.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2025 09:21:15.9618
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 970fa6fd-1031-4cc6-8c56-488f3c61cd05
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kpq6+/6hlB/BPHu6THg/no5SeZyrjmRyjnahIRG4C5yXMmDbhlAlo+k4RgDvr8ckTgK7uctDNfQB+2DO0f3xEKld4B6wsBp4itbIE2IJgwY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB0764
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Oct 2025 09:21:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120327

The below reference clearly states that GPL-2.0-with-OpenSSL-exception
is to be used with GPL 2.0 or GPL3.0 and not as a standalone license.
Therefore, update the correct license.

Reference:
https://github.com/aboutcode-org/scancode-licensedb/blob/569d72e13e7c8d14a4=
4380f91e80c5a2d4091f8f/docs/openssl-exception-gpl-2.0.yml#L7

Signed-off-by: Sana Kazi <Sana.Kazi@bmwtechworks.in>
---
 meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.8.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.8.1.bb b/meta-o=
e/recipes-crypto/cryptsetup/cryptsetup_2.8.1.bb
index b5be30cbb2..c297de053d 100644
--- a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.8.1.bb
+++ b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.8.1.bb
@@ -6,7 +6,7 @@ and can hence offer more features than plain dm-crypt. On t=
he other \
 hand, the header is visible and vulnerable to damage."
 HOMEPAGE =3D "https://gitlab.com/cryptsetup/cryptsetup"
 SECTION =3D "console"
-LICENSE =3D "GPL-2.0-with-OpenSSL-exception"
+LICENSE =3D "LGPL-2.1-or-later & GPL-2.0-or-later & GPL-2.0-with-OpenSSL-e=
xception"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D32107dd283b1dfeb66c9b3e6be31232=
6"
=20
 DEPENDS =3D " \
--=20
2.34.1


