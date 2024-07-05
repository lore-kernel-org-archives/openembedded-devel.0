Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2440C30658
	for <webhook@archiver.kernel.org>; Fri,  5 Jul 2024 09:44:36 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.120])
 by mx.groups.io with SMTP id smtpd.web11.14018.1720172668024898057
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Jul 2024 02:44:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=NsqXWjHi;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.20.120, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OnXMcjbq7bYf7ZghtH7JMTC0xr7XbJ5F4cmNKaymF7G/HCi6bRhDetiL+fmt2wKhPx1k+3HQTv4DVLMALow++Qm/zzSbJBXwnsMMkqdycKJeH+EnfhfPFFxow4eOOlWnPgB7wRI8cH3opxSNf9FGePQYv5lvlkiTCBl2PJFW35m4YOhtipx0uNVxyiKwASxBlE3NQ3oBaeoEqLI+Z8sSDJ03UctotvPeZDDoAg4juqoN+zuf/0issgSw5g59bWHleth7ULvc8mjZGZM6Mnbz6DM0WlPnj0EP4+xKFxg5QTjlDuEJt+YbIWnw73TS6etkna0gGTMq7FckUQk/9/CGAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T2gNaFYkJDbFxEGM16RxrcUI7BmcQ2NzQ7EIOjMqjMA=;
 b=HX1f2x1aysa08RX3KY78UNE6LAElKfep7WyGaNgYfRQtDOtVYgTRtdAolx6UKU40d/driD9JjNyGXqemuK1EIoOxn7P16MuHDpSpT/+lElQTvDmEpo692vtLSO8rePAl1iYRPS36mXZV5s3VByw5cCItiXNhgY3jJFJxvTM6jgzZqW5C0NLZdhJQKborp8kRxCmg2QMupgWb+kqlZiRPHFD/6LgDzj5xEly08xtcw89lhs913UPGIEvNn4rgbUY3Rvug3LOVsu/fEkklth+CR8BOMxTBaoY5/DZX4defdbDrkktbIk+IDfyysRKem9ela1wbzRjXYDckKXScX1/8jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T2gNaFYkJDbFxEGM16RxrcUI7BmcQ2NzQ7EIOjMqjMA=;
 b=NsqXWjHixr4zOl0XT5dEaaXF7e5ez2NBLemk+SHEQvbsDc0DJR1zCCvIAvgig/REpRGcdr017Z3atqM9Dmi+GeIu4IX4KsMuUWaufDMaK1dMtTRbfMnbyRidmg+GJsl5ZRsTj5kYb7wBaryMP+ExGDmFH9q66gVpm53NWkkOIuZ7S35K1nhfTeixIn9zI39lfSmPhTZBcWIa2KAB/kVvGZbE9ZgdWYEW7Q3h1lvaaBK/gGsmoRj47wqqrbYf/GUWTL/VLdteWtOexSaR1WhC9f55Jczn8Vza1JsKR/d6YabT8M9DUwX5DWTdOhex5MU2OzisMHFsx0JNDbr5KFXHxg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by AS8PR06MB8290.eurprd06.prod.outlook.com (2603:10a6:20b:421::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.29; Fri, 5 Jul
 2024 09:44:25 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%5]) with mapi id 15.20.7741.027; Fri, 5 Jul 2024
 09:44:25 +0000
From: niko.mauno@vaisala.com
To: openembedded-devel@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>
Subject: [meta-oe][PATCH] pkcs11-provider: Upgrade 0.3 -> 0.5
Date: Fri,  5 Jul 2024 09:43:44 +0000
Message-ID: <20240705094344.1595555-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0091.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:8::25) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|AS8PR06MB8290:EE_
X-MS-Office365-Filtering-Correlation-Id: fa405bb8-5f8f-4b14-7493-08dc9cd70e4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?jAr5EB6iMMiXWsIxbxhj+TfiSkFmgCfjPUoqlHonjFikZc0Z4mbJ7vj4spBl?=
 =?us-ascii?Q?5akWKw3Y3R98ZwVFAl3NKuTH90DHrAhsyu3SHdyRvez7wXSuxmR2Ft77er7T?=
 =?us-ascii?Q?m/rNYizRyaMmo6YlXt+PZjLOA91EeD6O+nrStbiOw5RS4nvwuBa7z/Vio+UY?=
 =?us-ascii?Q?p4GZ/MqYa6KRdkZaQ/MyEafH7ClMVAaqmkQms+PC8Baet6kGq9UDRr7GueoO?=
 =?us-ascii?Q?3TOam6J4BHeNoG2jgi9k5oYoksAUaQ9i41Lm0Gc+Z/W1+Mr7m4mJQAOFJSrY?=
 =?us-ascii?Q?QPUm0gJCV3O3clvVhG+bWDBCaiDxubftQzWBmGURSA1V1PpTa2R+vOVQNWqh?=
 =?us-ascii?Q?vrh6UvSi/5+QXS4Kl+u9TEufqDXs3fzYN0UE2+ZtTXCks2Jd+HwAoAPCOaRL?=
 =?us-ascii?Q?Mvd5/aaVU2Ryz9cK8N4uZpc+qhyLIH2CZZL9XPKgND6EuEIW9cVNmHY60FK5?=
 =?us-ascii?Q?h20A+E9Z0w0XL7I/g/P4yLyGMFAkoh+A8hCHML+GGxtYIOEfKvaTXWPo6c9K?=
 =?us-ascii?Q?clkCPFczcNlp8doi2Cvxa5aIve0yTJkMEwUaQdTAUv/rhQm4yeU4RHsjsb17?=
 =?us-ascii?Q?vDErlURxKmIoiqyaf3WnmXGDEiF8Cb8ZlCNh+XFNwTFmsjeFC/mvdbnkiz7E?=
 =?us-ascii?Q?amAeeNhCdQ7685vkLANIs/WLtZa3IdVKUcvFMkaY8dCQKjOCMGo15S/2oi5C?=
 =?us-ascii?Q?XMgYVaboHSiVXw0Kg2NiBH5USXOw2uHaJXf2cgT+A51bWNoNRcTgxKrMG2ZJ?=
 =?us-ascii?Q?smAD3d68BXQ7KbWpPlHAc+PioBn1Ef/7AaeHI/xJ1Y6wK+Ks+dyaGglCOBAi?=
 =?us-ascii?Q?++Hw1y5iui3IUTGCd7F6D29t63SbxWYqKvcm2EZlhMp6rNxMyBXOZopp08dC?=
 =?us-ascii?Q?MSPRVXwsmRH1BSEA4PwK5uAG6LazgkGgBVptwBMp9pt4qzbD2dNdpXUSdJ9N?=
 =?us-ascii?Q?8xcsg02rhq5YSIMw046lkYwalXj+T3bznav7vqdGlbpp5ppWx3A/8Bz6BeeQ?=
 =?us-ascii?Q?UT5Yo0/6P8A9+y6iGXFMs9SPhSqQe/pFWbyrXK50HAQbElGxnoz3BnAeW8+S?=
 =?us-ascii?Q?37AnAQgwnIiGYOYUA8TbcunIO0HR+qt4+YMi5/OpOh2NME4PzBP4DQDZldZQ?=
 =?us-ascii?Q?4mhFLQictuBbLEy/da2k8O79vBPf66JDl1W7P4SmJYfdmfXlWPs74Q/GEItN?=
 =?us-ascii?Q?llwWb96Sm0QKQ1UZRp4MG1oGAL0o2bAAQFXndR5OWXPIg4vz8GfNaTZKqXwF?=
 =?us-ascii?Q?CgGFdLfPIBU5+NSznT5KZfR/9qhubBjJuIlPHqMJdYCgvHXK6VGSK+RkrnPo?=
 =?us-ascii?Q?U1VYPJ4Q4n5HrqvdhiLfqUO8vFIWBJf53L64v6YfbCU/F2GCE+bxs5jtNwiR?=
 =?us-ascii?Q?z3X5wLk=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?1pQ02RE+V/HB57WsRflqVxyD7TRbWiaHgh5Sf2EJ96/7FAfsBzf0DSYawZYN?=
 =?us-ascii?Q?a0O7Pz991x5xe5Vb0rrbtZ6hpzNLVfiqm72q21Ci1CoGBUmBsfX48M14GMYu?=
 =?us-ascii?Q?ZomuIA2PnRAxQ3No+0rylHavgICY6O36NNjn41zeYzzm3CmNtVNBMQ05+Nd7?=
 =?us-ascii?Q?dxDj7MLih+bpitRTdoII8Dd14Sks78nJGBTQ6U/dEzuYol9Yt22qpwe7apoF?=
 =?us-ascii?Q?U/rO4Rt8FRxa1XClJV5c291s/GSvRyOozE7V8Ue7UjPRqk37Ue5OJm13k0Dr?=
 =?us-ascii?Q?NdHhDszNlG/Slg52T67Nycni5SwjH8DtZhAqYR6hHiw/zHqaoHSKN+JN/Qrl?=
 =?us-ascii?Q?59NpB4sccYW7bFtSUSKwsVJkA2FwSKqb6yQfQAb41tCl6GxNxZoPcYvzGmJZ?=
 =?us-ascii?Q?+H60XYbOyOI+3ab7FCpQ8645PwHvnqCTI7gDhZFz7Tvl7HGKcCyme5em4Z5l?=
 =?us-ascii?Q?q5T+GyM0505f7UQ0XB2gTxYn42T4CPrNuM/0EYlcX0WaaUwCqpJcy17gvxNT?=
 =?us-ascii?Q?cZgyr4ub/uFGi4rQObQBsdIrgS9m91qK9zsL/Zvz0WuRFPyG5NbPCLeSQAhV?=
 =?us-ascii?Q?Rwuuzgi6RKUEZrT5tnOoXkZ2AvhiYUPXLb8I0vWwfv6jd6FZTNExvmuLIYTx?=
 =?us-ascii?Q?N5YII13rfg1O1ZATLu70KOVqtcYUKGgyVVtirgG04FGSudYh/Itz/9jVmLgO?=
 =?us-ascii?Q?L6nKxo6wJeDbqBkwKta/s1hkR53s3elYD5wDyaOscO+/nJReIl+TfaZhV2dB?=
 =?us-ascii?Q?rhZxDVCcElRiUBAUUgakF7DC5SBjPRA/M+HOXcCPskUPbepmNJbIg2Rxd1u/?=
 =?us-ascii?Q?tKBpVNzGIUUwMpE/8CYqjGzaVL2NUa5vF8lp5GxMKXz64KjCPGhrZ2s8KkBo?=
 =?us-ascii?Q?5J/n2nvhB4otm4XSaIblnSvPU5ncB621cIJo2pU8Ug3Af0i//P1cu0iwW2d/?=
 =?us-ascii?Q?GL2QqWzOR7l8Hfyi2DRfQDEZA2rOwp//y99GPUy9H4Fgy+aaXj3CoBwr1jEc?=
 =?us-ascii?Q?t/0n3d1YhBYtl7Wk2j6SxX+sxATpBRzDefeQB7mc6/oJuT3m6d6d82Db4wgg?=
 =?us-ascii?Q?PAW9KAcJH3wEXk5PmvYOuUlTsxh+Q7BjdcYc8Lnuys8P4eqfG7Zn85u1rmBn?=
 =?us-ascii?Q?xcwtz+9bjua81PpZMPu96rUD6JRinczSI9mzeoRQIfNDDvuZokmgnHjiueuO?=
 =?us-ascii?Q?eI7C3yoRMhrTdn7HH/6A8IbElB/TYscCrrUpQTCgGpGX4LBL5FIKvczl53Ug?=
 =?us-ascii?Q?UxeX8ukWxbrQIjQ+9NnTdYHzuXa9HZf1djuWjwKzrwy/Za6j9wzHj6v1cN7g?=
 =?us-ascii?Q?I9aw4RlnrC0qglmBieWtcXlRZW9yqeNwFUl0gedtLis8gET+pfw4Jha/APxL?=
 =?us-ascii?Q?wsEkDtqYleQ2TvQPWdEhIGFk4N8yiWzbC+lOTe1+FXX7JuQztyId1VpD9NjW?=
 =?us-ascii?Q?wjAbwnxmCC79pDPvgRflu6XNKVkC7r5RqsqGH7szgerXusvYfbFExu85NFG9?=
 =?us-ascii?Q?sQvSKKDwWebxLXZ1a38ZZQS5YC3bRXTB2P6KpnX2OSN0FAq/pOL8DtFP2o6L?=
 =?us-ascii?Q?XqB80jbpC4KKOJQJE48rSv8Mo6voGBCeOFqEVAlNwtfXVSRj46UY24hXzPYq?=
 =?us-ascii?Q?UA=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa405bb8-5f8f-4b14-7493-08dc9cd70e4f
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2024 09:44:25.4270
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rAolTZ7t/2sP7JWNjX42ky17ivQeKD7j1q2SHIKOt6YqPdOwvNMSvxyXPJAbGoMk3CVq+EkuF2lwMKDsAEpjVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR06MB8290
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 05 Jul 2024 09:44:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111257

From: Niko Mauno <niko.mauno@vaisala.com>

Changelogs:
 - https://github.com/latchset/pkcs11-provider/releases/tag/v0.4
 - https://github.com/latchset/pkcs11-provider/releases/tag/v0.5

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 .../{pkcs11-provider_0.3.bb =3D> pkcs11-provider_0.5.bb} | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)
 rename meta-oe/recipes-support/pkcs11-provider/{pkcs11-provider_0.3.bb =3D=
> pkcs11-provider_0.5.bb} (81%)

diff --git a/meta-oe/recipes-support/pkcs11-provider/pkcs11-provider_0.3.bb=
 b/meta-oe/recipes-support/pkcs11-provider/pkcs11-provider_0.5.bb
similarity index 81%
rename from meta-oe/recipes-support/pkcs11-provider/pkcs11-provider_0.3.bb
rename to meta-oe/recipes-support/pkcs11-provider/pkcs11-provider_0.5.bb
index 816ee967c..6c19b6616 100644
--- a/meta-oe/recipes-support/pkcs11-provider/pkcs11-provider_0.3.bb
+++ b/meta-oe/recipes-support/pkcs11-provider/pkcs11-provider_0.5.bb
@@ -10,18 +10,14 @@ HOMEPAGE =3D "https://github.com/latchset/pkcs11-provid=
er"
 SECTION =3D "libs"
 LICENSE =3D "Apache-2.0"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db53b787444a60266932bd270d1cf2d4=
5"
-DEPENDS =3D "\
-    autoconf-archive \
-    openssl \
-    p11-kit \
-"
+DEPENDS =3D "openssl"
=20
-SRCREV =3D "58040b4e32975cc1d7f39e424ee7b0097cd11311"
+SRCREV =3D "3a4fdd2a2e5643af2a0f857b66a19b9fa109d40f"
=20
 SRC_URI =3D "git://github.com/latchset/${BPN}.git;branch=3Dmain;protocol=
=3Dhttps"
=20
 S =3D "${WORKDIR}/git"
=20
-inherit autotools pkgconfig
+inherit meson pkgconfig
=20
 FILES:${PN} +=3D "${libdir}/ossl-modules/pkcs11.so"
--=20
2.39.2


