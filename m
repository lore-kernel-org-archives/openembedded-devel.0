Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C52CED59D96
	for <webhook@archiver.kernel.org>; Fri, 12 Dec 2025 21:03:43 +0000 (UTC)
Received: from PNYPR01CU001.outbound.protection.outlook.com (PNYPR01CU001.outbound.protection.outlook.com [52.101.225.60])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14821.1765552503557581404
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Dec 2025 07:15:04 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bmwtechworks.in header.s=selector1 header.b=tC6YfM4u;
 spf=pass (domain: bmwtechworks.in, ip: 52.101.225.60, mailfrom: divyanshu.rathore@bmwtechworks.in)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KRfpneNP0c3jalyl1fRxf6s3bi5UNXeHz8b00DosL+nPeZ61hmWLMWAVyXRycZJNB6GOd1cqIpwo8p0zREpcC+DmhYfwa/tAB8CK00lqbQ33BQvjSvuU+/PlFNrRbA/w/Vrz2vdZukT7QWmIikuklAqfmrEsLFK1r/r+sM12qDola4wvpjj7wVOJ0qfvSJ6Ztu9Ll2OgHCq+1PYY8Lbs9AP9fQFWdA51yujkB2EGR9tQvdCtBWjFw9U372ltRfAB0U8Od+js6CriSmK28GClCs0nBDXisjvzM5OegtZLiYUs4JkHRkOokSgYuuTPpJN4e1XFrG+Nu9eSk3vusua/UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6+gHfDrGduZ5gDA4x1P9SLjPJyw7qlWyqniENsbKISQ=;
 b=cT+4cC1G8VCihDRJGXDgnOZhyZFlG3jPl7Fgep8ubCBf9eBIQiNkYvcz5X3+Bv8+G9z2qk2gtcmPMaY23iZOVx1V8Z7R3xtHszar8t8sXioOUrXm8Eo+uj3g2MuiMP6j6olCiLKemEsZiAhaMusFElo7oF2PNVwh7kZgi5joGJfOn1KMu3OBFna/VnGVXsz8cU2wbKOph5RYYMY2IwoqALvsSDhqM5p74y33+LciWV7EhkdW3Nm2TIeL9AhSG55E1HZbyB5bQFPGLzklmFpcvn7d10D6z7x5e+IEYpHtLYX4znJkkrsTiA3JppqJk0Bp9kM181fJcfiLZ+cSZvhThw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bmwtechworks.in; dmarc=pass action=none
 header.from=bmwtechworks.in; dkim=pass header.d=bmwtechworks.in; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bmwtechworks.in;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6+gHfDrGduZ5gDA4x1P9SLjPJyw7qlWyqniENsbKISQ=;
 b=tC6YfM4uawrofAFv6xgVM1/HjfZidogbzzVsH2gOzBXSavCq/NEPyNn0SDUnu92YcfMlBCRoVGL2YXCXijGehY6GFiRMY6EFGblvwvkSBbpsuq+cbBLKKUipqc6gVj9t8BPc4g51hoHyuXoBEhSNbVQsvcS7m/cbdiP3EejeMxg/KS0eoc9HWDiiq1quqeqmXsYL74yE8WNvaH7ZnJ9hJ/3cZIFjFfwnOZKbceVbDEtccaV7kvkyErc9Zi7K97wjKLGmXXR4B8haOYEFwk2Q1fxMPKXmnZOuieSngRYMk0fuG3mAPj/CCM5DzkNSe6jFe7TRerEr1mXgIa0hTtfdIw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bmwtechworks.in;
Received: from MA0P287MB3378.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:143::11)
 by PN4P287MB4723.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:2c6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.10; Fri, 12 Dec
 2025 14:59:57 +0000
Received: from MA0P287MB3378.INDP287.PROD.OUTLOOK.COM
 ([fe80::9a89:c69c:9878:e483]) by MA0P287MB3378.INDP287.PROD.OUTLOOK.COM
 ([fe80::9a89:c69c:9878:e483%6]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 14:59:57 +0000
From: Divyanshu Rathore <Divyanshu.Rathore@bmwtechworks.in>
To: openembedded-devel@lists.openembedded.org
CC: Divyanshu.Rathore@bmwtechworks.in
Subject: [meta-oe][kirkstone][PATCH v2 01/11] ImageMagick: Fix CVE-2025-53014
Date: Fri, 12 Dec 2025 20:29:37 +0530
Message-ID: <20251212145947.7434-1-Divyanshu.Rathore@bmwtechworks.in>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: PN0PR01CA0009.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4f::14) To MA0P287MB3378.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:143::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB3378:EE_|PN4P287MB4723:EE_
X-MS-Office365-Filtering-Correlation-Id: 44797748-e717-4b93-8460-08de398f1d7f
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?4BhGssefwF+Cg1x2hco3dRnoi6zrEh81RJygZdc9/jO3C5OjpZL4p6ZLZalj?=
 =?us-ascii?Q?ge88J82/GLnx46u2n6cgtbH6BOqEtyUjniy2aq3sFPsm2bbqHpnVJKqFYNrq?=
 =?us-ascii?Q?dAmJROmkZGIY9KAfGR1qItJYGKZjo22RqtRKCazvmqnVSXFNCkeSCztFabs3?=
 =?us-ascii?Q?CSXOpR1o+kWhHZTSRSJGbnq8pV2cyi+JSQyvoakBdZLgiSxUJO6DtEo21wlb?=
 =?us-ascii?Q?colv6eanGz0c0u7AUIqrPJ3Q3s2JlO3LECXvltIEUFYufSa4dbXK0CLgXF2h?=
 =?us-ascii?Q?Hal2R4vetbLK6dzidxBQARTJ/gp3tib6Dd5DqRgx31bO90/E0/RFEssn+PFD?=
 =?us-ascii?Q?Radubzwqct3RqD3axxjlr8uMKJsJKKC0tAj0svDH1Hx1EycvVzRJXLsQaa/r?=
 =?us-ascii?Q?jbyTwit44XpgT/LoRUvo9Loh/+KWmS3S760v2l+z76HI9TDVEOjHGyL0q9KE?=
 =?us-ascii?Q?6R3XUdOnaSXZ2LDFAEJwi+BN/xiqi1yDdIaXTL+upChWW+7n1eCAGpGLhN5i?=
 =?us-ascii?Q?TCbt4oeHgNyGXh2W39A/C2zQapJDNHWcD4KiNkLy4mpGCc2FjhTI87LruJ9T?=
 =?us-ascii?Q?DcNrRMxRli/rLICkOG69Ind+LF3U9U3IBnTh4RVRmSmhcGvecs+vkWmPFb4g?=
 =?us-ascii?Q?w2hFtbvODsEhBha4ZA3krZs0PJoqCEW3iCYX5/W/mVqVceUeZx/K/W03OQki?=
 =?us-ascii?Q?6KZoKNxNvcsK/Q+YoRIOua9nAgR5cgv9kQYYpDhCb3eqn9AN1No2IlSdYzZ+?=
 =?us-ascii?Q?m4p4f2reLNmkJbn+dbC4l0539wax+rHZ5LoA6Lu2aA13FlECRosCuj2bA6YJ?=
 =?us-ascii?Q?2AFylkIPtSL8bfRdHsB3GPebwm23ulnWLMcvDZwft2d/1302ytsWFgL6Fbu1?=
 =?us-ascii?Q?1C9rHS8n0GdFC9n7lQfOUpNJ3m0CfTebOx8oIj3BMZRBOdjkt+0ZnylhPqMM?=
 =?us-ascii?Q?X0RRnUcu1G5ucTvcrpJh7xBMsw5EZVrFrS90kmtMJPBDUsdl6xASOysglU+a?=
 =?us-ascii?Q?J7EEqXvj0kw9PY45k+0F8Sm11jnViYHwVGAcH21uhasyk5eRUlvkc0zM+cVz?=
 =?us-ascii?Q?WjJXkiyDA1815B9u/iDwLuBRmR/Ai6FtwdQYE82/7Ncf0Xh9oZe4riDQvL7e?=
 =?us-ascii?Q?F7yltmK5KELhMfB5Jth15uugBCMOE2BgFhTtnNSt/zyfgOSz5LgwHiq03vmW?=
 =?us-ascii?Q?bVvLIxRMjqLwXnV2Dhfq0l8d8IamzRTK8O1C7WlJEFkRoVAQRNjYeZynz7pu?=
 =?us-ascii?Q?TM0zXaOFb/z1WkmEXPUeCDhqtlFnK7fBlXcJ/+3w+3w9VtckDrolHPg0LvlK?=
 =?us-ascii?Q?K4wqX08zMapyjn4gqFrFH/zlIBoGs8+IvEZyG1ubU1KIQp+NB437TGq1RoY6?=
 =?us-ascii?Q?Q41KKYsIlxplreKuom7wdNoZQennq2gTxHLwL9ClM/QjAH7XwPfEGPR73hOG?=
 =?us-ascii?Q?ZHerjcgaILUVnHyD3oxe36bsfSrfWcUVj5pW2lyl3L8JaHzYtSdHkw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA0P287MB3378.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?7gGHjiaxVLcX4xCh7ra3LL0C0BZ8cx6EzRxwNE+cC5izK6Ljrhj2YPo47bXm?=
 =?us-ascii?Q?NbtHEYYcfr1EAnPqTImD0o/iK7sUHKhcJld5mzHdzhtm88Qc3qggNumgO0oL?=
 =?us-ascii?Q?zULpH6ahn4/lmZUKdsn7/fSnc9HBBWX68iZii5TADoFGG61lbD7kzzv6PQVL?=
 =?us-ascii?Q?A1lcklC4ml5eyqDqa0jmvX9PbOAJ16fmcv6q2wwXPYb4Kvr/zclWgAQdmxHY?=
 =?us-ascii?Q?dAqMhHSsxiVZ4HuWbYW7H4BecsbEjq1BD5KOEYeRqfxoWX2zn5d9/8csHIUB?=
 =?us-ascii?Q?o5/r0ZKcjfhZheeaF/B06fA5bWiZZB3/REO8HtDeO9ybycCfmshswYdGlr5I?=
 =?us-ascii?Q?uLo4YYgsgzA1cKYaVNkp4tSdp2Tk34uTcX0KUJDx+Pg8U0o50jkmJy+tBo+G?=
 =?us-ascii?Q?t06bepUyFMovkqrGjeCs8IVqn9Akto4MM5qEQ54NJX0X0OQBk3rUPDGHj+EI?=
 =?us-ascii?Q?1D2vjslpo/lGtyv/FRRJyZttzJzLZpGmFXd84yomyr5rEPCqnbTsx9QkvSRL?=
 =?us-ascii?Q?OUKQ+EOLke3+388w7CRqrxX7uGRhANhjGmD3REsQW1CLFHbxZT/ERO33dVrC?=
 =?us-ascii?Q?4gs36afBIYmMfJdeLTVkGmA1yycpLVmQIftqMOCX0bgPCwK98r9w+1zqt7Pq?=
 =?us-ascii?Q?s6J1hu0n1VHGVvA5NUnDYLyMjIfjvTtDl1SbsyQAMdOfm0JHeplpqwLuY25G?=
 =?us-ascii?Q?U3Gy8MQNv9XvdMiCRebTOGpUcUCYk3Qyab8pTu+/IUDYfHkSjhf76SOo3z5o?=
 =?us-ascii?Q?jm5cE3MeKPQr4w/ZCV2Jynipeo6drZPq1fa7zZWq9ygyDeazjdq8xA3Eumvi?=
 =?us-ascii?Q?trQCjEBiwVsvg1BweIPnpnw0xEUwjWhEmvNRfDzg/T/armLQ50Jyur4sPwpO?=
 =?us-ascii?Q?4P1j7UAnNmGllEVNXJz59uVFPDb4d9f3ZsmN13uymDNSHjkydnulA5pIhF9y?=
 =?us-ascii?Q?EKP6pQFm1onQ4pU4Th6HILj4CqjBzh2e+xHkjBigQOhAbYrpvbo9SK/U+tKN?=
 =?us-ascii?Q?uwW2z/UvESq0khIlU0edL+C1qc6zb1hFmGCFCDV0DDPNEBuO3lK3HBTagxge?=
 =?us-ascii?Q?Benw706UjFeGwU/KI1uHhcQPCMA43IsPGH7pyvKonUS50p2cAE3K4uEA5Qao?=
 =?us-ascii?Q?Zu0h7R01njHnYJ2YzXKjJWXE70FD+jTokuJjq49+OYZq8AI1nRDBW/lf/+Iu?=
 =?us-ascii?Q?GJpDSd2ELxKTKwZf1bGpa6n7r6YirJTqH5ymOmvBEgiJSVYusCaYFMLRjgPV?=
 =?us-ascii?Q?FPm1YJ6m+89+JnlOj3dvTBb6uUkngD9yQO0IpfBN7BIFUfWfwDQLGVnjAgtT?=
 =?us-ascii?Q?tp/qiKIX0ZR9Hq6BQXtANvxAp9a+sn04y8WI4hR67PEEyFVSxJIAqbafjCHI?=
 =?us-ascii?Q?HW9ch5Ogrv4+Yhc7Uc72q9JN7Vcg59WezYjLG2HZTyL04nBatDOASx81e0oP?=
 =?us-ascii?Q?3ttsoB4yLZa+FaIwZN2JpmlOOKbUOItglSI00v0kTQMZ+0NXdRQAAwEw/C6+?=
 =?us-ascii?Q?zD142E6vE0Mco6APk+TjlBPJ1F99313Y406HidSBbTffehaAyrQOiWPmSLz0?=
 =?us-ascii?Q?iNbjt3E+P6HTC42jEPHtcbHQud6jaT8RarqdtKRtThN00Zq3pWXUTBV3yacn?=
 =?us-ascii?Q?5pNfdNJVP4X6PekWdnW7Smw=3D?=
X-OriginatorOrg: bmwtechworks.in
X-MS-Exchange-CrossTenant-Network-Message-Id: 44797748-e717-4b93-8460-08de398f1d7f
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB3378.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 14:59:57.2594
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 970fa6fd-1031-4cc6-8c56-488f3c61cd05
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g0es1MsVMrXn+YkkOOzUZNxPksjVoPtK3y68YX6g3EnUgCC3qEXTiO0MInm/XxauLZX0tQn1uz8+z3bM/vVe1qQXhBY3pykx8hBfI1J52no9PAC0Y8MtX5+CuwmUaedi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN4P287MB4723
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Dec 2025 21:03:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122618

Backport the fix for CVE-2025-53014

Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commi=
t/29d82726c7ec20c07c49ba263bdcea16c2618e03]

Add below patch to fix CVE-2025-53014
0001-ImageMagick-Fix-CVE-2025-53014.patch

Signed-off-by: Divyanshu Rathore <Divyanshu.Rathore@bmwtechworks.in>
---
 .../0001-ImageMagick-Fix-CVE-2025-53014.patch | 32 +++++++++++++++++++
 .../imagemagick/imagemagick_7.0.10.bb         |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta-oe/recipes-support/imagemagick/files/0001-ImageMag=
ick-Fix-CVE-2025-53014.patch

diff --git a/meta-oe/recipes-support/imagemagick/files/0001-ImageMagick-Fix=
-CVE-2025-53014.patch b/meta-oe/recipes-support/imagemagick/files/0001-Imag=
eMagick-Fix-CVE-2025-53014.patch
new file mode 100644
index 0000000000..3230519cd1
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/files/0001-ImageMagick-Fix-CVE-20=
25-53014.patch
@@ -0,0 +1,32 @@
+From a16d86759bd9171fca247c4e764ffeeeb7232d9b Mon Sep 17 00:00:00 2001
+From: Divyanshu Rathore <divyanshu.rathore@bmwtechworks.in>
+Date: Mon, 29 Sep 2025 13:56:59 +0530
+Subject: [PATCH 01/18] ImageMagick: Fix CVE-2025-53014
+
+Correct out of bounds read of a single byte.
+CVE: CVE-2025-53014
+Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/comm=
it/29d82726c7ec20c07c49ba263bdcea16c2618e03.patch]
+
+Comment: Refreshed hunk to match latest kirkstone
+
+Signed-off-by: Divyanshu Rathore <divyanshu.rathore@bmwtechworks.in>
+---
+ MagickCore/image.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/MagickCore/image.c b/MagickCore/image.c
+index 34804e522..fe2a1cb5f 100644
+--- a/MagickCore/image.c
++++ b/MagickCore/image.c
+@@ -1661,7 +1661,7 @@ MagickExport size_t InterpretImageFilename(const Ima=
geInfo *image_info,
+     q=3D(char *) p+1;
+     if (*q =3D=3D '%')
+       {
+-        p=3Dq+1;
++        p++;
+         continue;
+       }
+     field_width=3D0;
+--=20
+2.34.1
+
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb b/me=
ta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
index fcbbd6fca2..bdd6dbe955 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
@@ -24,6 +24,7 @@ SRC_URI =3D "git://github.com/ImageMagick/ImageMagick.git=
;branch=3Dmain;protocol=3Dhtt
     file://CVE-2023-34474.patch \
     file://CVE-2023-5341.patch \
     file://CVE-2022-28463.patch \
+    file://0001-ImageMagick-Fix-CVE-2025-53014.patch \
 "
=20
 SRCREV =3D "35b4991eb0939a327f3489988c366e21068b0178"
--=20
2.34.1


