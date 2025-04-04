Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 195D0C369A4
	for <webhook@archiver.kernel.org>; Fri,  4 Apr 2025 10:54:53 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.112])
 by mx.groups.io with SMTP id smtpd.web11.8085.1743764082344333991
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Apr 2025 03:54:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=AydMADUP;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 52.101.72.112, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kGd1b6QMyu35ft2Mljlpdd3zLqiIWd2oOWwrizc8D61trnB+70FCSWInGoMgBfN6l2+DcNMtBPkYpr0+APr4bAAoc4q6jmfSX6vhwbi+lP7YUHKBljmW4zUmVA44WzVrHHodDK/ddulqbqnds+NxvJi3FHiLllq+uoB1AngF6HOXDbsz0jrflM76yHUXkmWQ9JPegb9cb9UvYyMBlr0a/sXXxT+XHyzY+KPS7ov3qxB4p9/aFTp28VFvRIFCqENOGSoB0bQUu8WGkg+ldp8JLxGeHJx67p5J+JKGSUHVM7D3qa36HQnjZiwRL8le/ZgnPqVGaE7htXczugxayb/YAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/DpjSNh4OzIKv5LqQP00dqLlNjOFimYVAdFrYKPLdtY=;
 b=ak7ibr9fUJ1bLSPIzjwhxbEjTCicoHK2CCpZTZAicnrRMQjL5nU0XL1ysdVB8Iydb8Q+dOgWEGITdumLhn2hnybFH4d681Ih8Pk7MyZf8dEIX5fq+nMR1LsUr5PxrYWmX4lCe1mavOPQ2k9n/L+x+1kkqlMrbQ0FLBdqHb2s3wqRYTIPu590F9RjLnSRiW0LfmeyBC29uRungCoyqP+SPHUvoS11/X2yJp5RM7Ljnft3nYaxBQv3A2EkxIYLPPYgll4ElJqBSyhgX01HnvlBQSQ7192jx/UsYYvLk3Pf93PSBjj6h/3ot56PNUcEpmZNN0XNUpMd2W2XPwQtCDeIkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/DpjSNh4OzIKv5LqQP00dqLlNjOFimYVAdFrYKPLdtY=;
 b=AydMADUPdqXlRiPgojCDRMHb2sjvwFm3Je88NLWUrCXmtwnkJZ4982ukaDMdyuZInkRldKz5Ej5J9rkz5kIKDZum2iW7kOnB/UlKysLborURMvm8I1aRf+8k1BF7hAiDA4dph6O4c5sSJOLtXyuLxCaKoeDBxtz7jbQr1jLhlXkvKaB7Xs5NX9LcwYdy32YybqgXtC4yTmias2EHRFqaqspf5K/5sd4eiMcAob0zinlOrAHOyZmG2fzMnzWDKZXhTcf2+P4APggJ4Wvp0fWsYNEUlJSFFiLjoxS9Ak48SoSfxJbCoUROSJBTMzDDKG1ar25lEXiK6J7U0K/4Fs+cHg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by AS8PR06MB8167.eurprd06.prod.outlook.com (2603:10a6:20b:3c1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.42; Fri, 4 Apr
 2025 10:54:37 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%3]) with mapi id 15.20.8534.048; Fri, 4 Apr 2025
 10:54:36 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: raj.khem@gmail.com,
	Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCH v3 10/11] system-config-printer: Update D-Bus runtime dependency declaration
Date: Fri,  4 Apr 2025 10:51:49 +0000
Message-ID: <20250404105150.870898-10-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250404105150.870898-1-niko.mauno@vaisala.com>
References: <20250404105150.870898-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AM0PR06CA0133.eurprd06.prod.outlook.com
 (2603:10a6:208:ab::38) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|AS8PR06MB8167:EE_
X-MS-Office365-Filtering-Correlation-Id: a4d7ceeb-e008-49eb-b2a6-08dd7367175b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?9a77DDj07Pl5FyHNQN0diEr9AKi5QrKZ2994f+W1pyUKQ4LdWyKGHQNCAItE?=
 =?us-ascii?Q?PhGBIV+mjPk5pu4f7VMgviPIAjvK+VA/QqwI7TzrcJUCr+QOtGrDuCzo37AE?=
 =?us-ascii?Q?jcX6A9iBkoCwFbnP7pJ3ihxV0N2EC5RhE7Wdyh8mQoHxnCnE8nyJQ9pF6+Zn?=
 =?us-ascii?Q?ugaLwy+UzmaeG2nrz8CuKnRcaAFY9Zi0QYoZWXrsjd66VsPijNaHLbMUOeiK?=
 =?us-ascii?Q?YmvIhEyoEmZCpFKkC1ep4Ze/ip6ILORyeOyCCCg3w/c/spKRGRst2H7OBgTn?=
 =?us-ascii?Q?OwjbTl3P77Ls0bjCb5EcZjeMeoLsHnd3qLfDajMzP2TPp3vwDu9+qbtmYFKq?=
 =?us-ascii?Q?mYevCoVPGN3kN/4Pkwna9oB94PyFfc6iDzrnph301oyz+pfBaPVU4vibgsMv?=
 =?us-ascii?Q?7gP5YQue67cmiPnylto4JGYRrpqGcAc3E+jtfCrNZmD+LZa2EW2cmeYCsHkf?=
 =?us-ascii?Q?KTXd4On3w/BnitwQo0gFU++GvWk7AmTv+UDAycZur1WkntAZYSWDFfFCdZTX?=
 =?us-ascii?Q?Ji891+OP/fj8/Ekk85J6lVpDLo4oVpu4JREK3THsbiCpwntEuoa7Xfl305TF?=
 =?us-ascii?Q?4Asgm2GtOlmjDgdUFNdahQ5ho78YU07wYKDiQGj+CHiexfReoOBBZxxwUPVB?=
 =?us-ascii?Q?vfwasLQkwLryYm2f7eTMbTSzfR+md6gBkTGyKxV0PanQ3jJmzMMqQnoUM67Y?=
 =?us-ascii?Q?ekKKm1SXTPYCB3aLK6hO40jHExJEz2CgwPlJ5+wT/XaRfK1ybliFsmfI6G3f?=
 =?us-ascii?Q?1QL5BWKZmI6hOqR156bC5XGXhHbsAdG8TtquclxjiCIz5uQMAY5iPLSCATn0?=
 =?us-ascii?Q?Fi733SIdgeicP+CTUX8y1z7E6I3sODcZ+rPOE6UJSXhpvGaDEfXfJvNnWRxx?=
 =?us-ascii?Q?JSU3fPVz71A/rK7EvJFCVfcnVEu5X4GD8YEPI5oOZPzHn67MSTiFKzyIfNM6?=
 =?us-ascii?Q?ru304xFgnWt7ARO5/xlCaYfNZCdGsBVVkPllOFQikLNKP2AgjrSuCV0G5+Wm?=
 =?us-ascii?Q?XmerdLf64QqSLGYyqrDw7zm8gSE307uCwXYiPtCk/PgjtGYHc1XALo3A43zI?=
 =?us-ascii?Q?yzq4Rhct9uAuMJskJqGRbiUALNkORm9E3bdh+LXejhoy7FEIcx+GXadms7P1?=
 =?us-ascii?Q?o5q4pYuJeOkEJsY4IFrrabehb2FovHmXKoWBj1bG2Bgrzv/8nO7nhlQ/APeB?=
 =?us-ascii?Q?M9BrCwf0Hbpw8vHkHTuNgPkZ4GBHvb7ujEgTPLDhu4Yb+d2CFKhAJiDZKMPN?=
 =?us-ascii?Q?ndLHwTUK4iEHXLMGgzsYPmRYYHI71+Jw5eaqWjTEFZevwM1y2MBb/EaQT8Uv?=
 =?us-ascii?Q?zUykblwFEzhAiIkAWiJwHJkYJ2PkCTuiuGRHBSBpUgT0+KW23Ng9TNBSGSE5?=
 =?us-ascii?Q?7Jlz/8cfP0KG9ZNCyupNGlgN5wFFZjqv36mr/ZzBEoQxMmnYFXFWpndjA2lJ?=
 =?us-ascii?Q?7kSYI2Y8+CpK+En1IpyOBmiXozaf1/Ns?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?hOjFDZq9aAmsK5git0kWFJXYY290s2zL34ucgEh5aNDEnCb5sxLqQ+xUIqh5?=
 =?us-ascii?Q?oxdzOGSMlVmbOEeRns/t3Y36ElNej+ti1giPztT6A99OWBkUU0+TPdop+y6s?=
 =?us-ascii?Q?5azCIjH18aq+bh3yI7UvdTYa/Wg572E47Aq1SiI0gw9iiERfoT7ULRhSCYFu?=
 =?us-ascii?Q?RlxUW0ph/4SgdaTvnaX8h6cMgu5v+8vpClXw150j7yKRF035L2Y9rxJmNgEI?=
 =?us-ascii?Q?0fp6kpZ05RJE5Kda0U5eoL6X4+hRcj2m45rkGCAm7UDDTM1xzMhkLevW3Ym5?=
 =?us-ascii?Q?XdZyYq3f6KCCBO/o0r3JO1AWLf/UoQua4JT/ZdQTVHRh9okHvj+HAo4KIdyF?=
 =?us-ascii?Q?5UtrY4xUqU0puhA9FD4vOLNhQiwgXqbP+vBbrEZBwHFQe4/TWa+qNiOD+G/i?=
 =?us-ascii?Q?hCHcUjJel1kFNrppzUDwzh06kU9xAl8gvXvNXPnMcvxlV8aGjrCEXzFZGscB?=
 =?us-ascii?Q?zVTEfcoghYX6V1OckoQaoppRA1dwyRoMiF+J+U0f4vV5yrTsFxd+VoLU7Bk+?=
 =?us-ascii?Q?+/oY5MEHGT7T8AKYDpx+oe2c2Qz/sYHKENFM/osREcLphf6c+9JsgBbnV8jQ?=
 =?us-ascii?Q?mNGT+eSkvoX4YlqAYoTaf3wu4Fb76GZ9VyISqfuXzIbXbmASq3Wcu1JKS1Gm?=
 =?us-ascii?Q?7zKsTNs4ks0jA7bRtBNCdSTY6FgVYZgNkuLnsRo9HYfywLlAaAyXnNfnSWay?=
 =?us-ascii?Q?r5Ra5Tb2iwVIbVk6g7t1YeyoFl72LPjkLmRiVsoQklYOsEnPYEE1RL9A1kcV?=
 =?us-ascii?Q?jCz3kWiTC4YZepBoIT1kpgcgKSu0v8QDVUavtCnbTgULs/Jeqz9F9IGYtbJD?=
 =?us-ascii?Q?QvUCaSsXRyaSD5VdQUodEnrPKfdJjsZGP5QLOZbrXBI1PzyC41KgxjHpPzQv?=
 =?us-ascii?Q?1Z4Uhdf3nJhr62Btz7tiz8BK3qBV+xdeMwun7lNDVxp5B0bKam4Usb8o/sXJ?=
 =?us-ascii?Q?2NytA7Dxy0Yd4GBV67YS/ZJKzMoHiADv64EtoLR4JgkJlysmKRyJUdio1usK?=
 =?us-ascii?Q?kPvs5gnKqFBWCabZ4hAzxpgG24QVH/+QqU0ew7oybA7O/60xhtP1fk2In099?=
 =?us-ascii?Q?2HZkSiiQ16w0CZfRDYM8nVfVRy8D6B01ypSnXuKm40AfGxBlAPhu3rIXo8fB?=
 =?us-ascii?Q?B/ewnrMIFndlhALTiCq9uNAn9gkvy++0SlEMB+K0k0FYJ6pcfKszCtxitiND?=
 =?us-ascii?Q?kCNHKLLvdcysTs/qPmHRJHywxGfrTIC7pGepwLVQqNPx7tfq0IlIGBGrXikB?=
 =?us-ascii?Q?+JC0phGA0JJfzb4KCFDBWjCxeNgc1ztIRu3k9HPfzUi07lh2uf4iuAfpjatE?=
 =?us-ascii?Q?HeIuopjEEDvi0KNKJPnGbHaKas2nkPgVm3+4iXiCoGh2fK+Pc9pdoJdlK08G?=
 =?us-ascii?Q?tpF5diFaJk0e/EXe6RVKRMVt9rdopGwLgt+2g8Shx+VKQdbTxDVCNJIMRarF?=
 =?us-ascii?Q?H7qNgnHEawwWpeCF4dOVXMALXiwyQY7Jtk1UFz9lJU8O0ztvUJCNOBU44JT2?=
 =?us-ascii?Q?qdAvdEoo3K02ZMIP0uXAAgF7TArvn9apGkxMnvPNR9dfdUBMPFEhay6NqfIH?=
 =?us-ascii?Q?wyO8FE73VStJj9ffLijEsImCEyOGS8vulR9F/fbCCd2i4zkqgbKNHYI+rE6W?=
 =?us-ascii?Q?OA=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4d7ceeb-e008-49eb-b2a6-08dd7367175b
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2025 10:54:36.8636
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: edgwD5V0iJtorLc1N6F0+uItwwEguxSJrKe0nm6q49T6Zyb9sOvgKENgevCMtTGTRjyQnlEVvyk52wzSdLSEvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR06MB8167
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 04 Apr 2025 10:54:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116581

In order to facilitate users who wish to use e.g. dbus-broker as their
runtime D-Bus implementation, change the Freedesktop.org specific D-Bus
runtime dependency to honor oe-core's new VIRTUAL-RUNTIME_dbus
variable.

With this change we also align with oe-core commit 5dfca64b78
("dbus-glib: depend on dbus, not dbus-x11") which mentions that

  dbus-x11 hasn't existed as a package since 2012[1] and is just a
  RPROVIDES in dbus, so depend on dbus directly instead.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 .../system-config-printer/system-config-printer_1.5.18.bb       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/dynamic-layers/meta-python/recipes-printing/sy=
stem-config-printer/system-config-printer_1.5.18.bb b/meta-networking/dynam=
ic-layers/meta-python/recipes-printing/system-config-printer/system-config-=
printer_1.5.18.bb
index bff16b4412..f9a5e15689 100644
--- a/meta-networking/dynamic-layers/meta-python/recipes-printing/system-co=
nfig-printer/system-config-printer_1.5.18.bb
+++ b/meta-networking/dynamic-layers/meta-python/recipes-printing/system-co=
nfig-printer/system-config-printer_1.5.18.bb
@@ -38,7 +38,7 @@ FILES:${PN} +=3D "${libdir} ${datadir}"
=20
 RDEPENDS:${PN} =3D " \
     cups \
-    dbus-x11 \
+    ${VIRTUAL-RUNTIME_dbus} \
     gtk+3 \
     libnotify \
     python3-core \
--=20
2.39.5


