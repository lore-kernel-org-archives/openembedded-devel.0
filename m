Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DCA5C28B20
	for <webhook@archiver.kernel.org>; Sun, 30 Mar 2025 10:31:43 +0000 (UTC)
Received: from AS8PR03CU001.outbound.protection.outlook.com (AS8PR03CU001.outbound.protection.outlook.com [52.101.71.98])
 by mx.groups.io with SMTP id smtpd.web10.28244.1743330693592790054
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Mar 2025 03:31:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=MvhSrtyp;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 52.101.71.98, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sHFCByJEwbGzVty3nXRDIRf/jinPflR4K0ftfp13c71aHgjC9QTQRQRmpVErq7/k2xzGZq4uMXcqPQLInQPT3Ujj23nh66Ha2Yem1bB688vLJUGg4wk8FB0+reYYMR7G3Yy2hsSsMmxrQc+3HPhwPPtgxX2gy6n346JRi1AKtrcTEPIC+9BD1jF6OoMX/lqFaHPCL1os/8YcfVmSheq7uNoURCcowe4S13SOXtqLg/DUzi7Ighrg9Mk3Dl2T5QGRRDxI/XFtYGAFbwoq2F4cFH00OEJMmSv96JwZuRHwePqjBML2uXVh8Y4FQ+5SMF+2PS3MawCV6A9/XDoNTiKmGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Fr8VB1YQFnvU+4dkB/3hvZ6XlD7CgkzA3WH8W67e+w=;
 b=deXJfHEFEQj8mCpR/Z+UFT7B2p7kjakn7V46H24uzssamFZZFzpoK2R11HHsZCHNgiGrZr3kx7sXJNQcQkxyiIHfag7xgn5M5yuYkSvzs2L2yq0gJkc37bBSk+0CvkBr/+4gkVoabjsZjyqmgNgcDBxZ5LC5qBIX4eZ/gYqjwIr9jLydYRr02nFONdEJgIiN8T8xEO5aNAulPNYquXa6sh46TcVFBxPeQ9p9zHiTmsIkwRGjtXlKsik8rIiBL8k2eohmmAEJoR3KL9CP9vAxE9Ix8zWRyXCsIeI/w99BS0+Dm+rEH4y2NY5ZYzE41XxGh0sdrBzEOXcgrcepORwx2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Fr8VB1YQFnvU+4dkB/3hvZ6XlD7CgkzA3WH8W67e+w=;
 b=MvhSrtypKDNosGexv24oUZexUcbEcQSAkOtljYiyIVxEZsmg0rZpa+hg3Pfzz7BP+SpaNSBhHGiVo2cWSMhjTfztNIjuAeEAdCtMbhdT/C0j2RnOMquNkb8RM3FuKIfeUNm2OTYIqRmY1VArko2uLYzDe17m/+1LHjVRvZdamiMjebXkAI1CuDpaG1jVGu8vx52d3NpVMEbrEu3QG1bRSmWwR7mtoNmsDWMCX9NFIg9LXySE9IAswys30/N3NA+3UaBsOfxgE7/zH2KIryVVhRg7MpyRfDB36O2ohd4uw+Vcc45ZJ2ezooqklEE4Tbu/LK9GIfdIZQzOHj2GuYr9cg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by PR3PR06MB7100.eurprd06.prod.outlook.com (2603:10a6:102:8f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Sun, 30 Mar
 2025 10:31:30 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%3]) with mapi id 15.20.8534.048; Sun, 30 Mar 2025
 10:31:30 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>
Subject: [meta-multimedia][PATCH 1/2] vlc: Remove dangling patch file
Date: Sun, 30 Mar 2025 10:31:15 +0000
Message-ID: <20250330103116.405060-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.5
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GVZP280CA0007.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:273::11) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|PR3PR06MB7100:EE_
X-MS-Office365-Filtering-Correlation-Id: 4238fde2-27a0-4265-96fa-08dd6f7608f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?1o1GHhjxbggRM4o/sc7avgN4dI0HsjzlUoGf6nsKza8k2SRgcTdStLBhOCuO?=
 =?us-ascii?Q?uha6pg2ukQ3dDelWXpfRVAiO6yJ4Sn7DUWcJsHD6M37DbpFGGqFbkiURLMUL?=
 =?us-ascii?Q?gGQUz0XDk8CTLk9zsmR3gNO+j6LE9SjSext9G4Z52hd3XHZYOwWa9jf7kqXj?=
 =?us-ascii?Q?2UUsWnhIpaaJzlZgNIBWwFtO3AAesv5WSRIsu/xjFDPRsD8r87sNlg1dMuYy?=
 =?us-ascii?Q?HemEhwBK8CVXMq+K3xEi50Lv5N1kkWUnRXMGaPOpr7yBx3H0d4G0MRChrT1p?=
 =?us-ascii?Q?+n6dGoHANlGbPB7U1LFtHvvvK98KEzYvDadH5TK4s14kVrhlnXa0VC8HX+nh?=
 =?us-ascii?Q?UXryF383PFJXT26ZdKr4GcXTB3YLFqGYyhSgAo/uL+Z/FsoID3McUd2dfHaU?=
 =?us-ascii?Q?bbrsZmidenf+tD4A3K8WueDJRftGq5INEIQIzztDl/bG+heVGfkPdSNY7Frs?=
 =?us-ascii?Q?vGwc3wFYwY31y7rvYFlE/P0hPdgU1cp2GUk1240fJJRkh0Yy8eu4aLmHzqsO?=
 =?us-ascii?Q?fcaKDSLM8K/7ychN5cze/g4lSvH8AnJ8NyTgKuaf7xStrUnmJ9bMpGu14QJY?=
 =?us-ascii?Q?0IzMhoG99Qa7tNf/PHPubnGNhIx5G3Z8/TmwbWOZUxv+9J2pRA0NAZ2lRidZ?=
 =?us-ascii?Q?/dXIHLK7jq0SUOkdAWyWWiMrey7IPavEHMBSKFf5PijejAXgalrSWT4XtGp3?=
 =?us-ascii?Q?Q83UPHE9AXwSPLfeZo9KpJ+mzlRMpXwNvVodjOEpjCg6c13NhS0keceUH1I6?=
 =?us-ascii?Q?cFxt9UqDue3LoYNpkaU5WgXR6b2guUbhunoXWaoHmkvcsKL2uFY7K2xch7QS?=
 =?us-ascii?Q?+lIUK+QoNzuPgnE9HiMNp6VS3Ru2ew16pX+dBhv7YAgVAXv7ixfbaAArze4B?=
 =?us-ascii?Q?+r7cn+3CueNCi3gkCg+PFXwgYQgcGU0idsfjR1zgtPpUjfd+YPMrqjUdZCF8?=
 =?us-ascii?Q?l4HaMUT+6Gxqi2izmIAkVqfalD5j9V9R1et948mDt1wU9Qciuh0RumnvQlIq?=
 =?us-ascii?Q?atTom8S2m4InrnBf3opxPoYAOQkwHPOcr4zTYIf5SBKXeLMSfSokun9eqd8s?=
 =?us-ascii?Q?qqoR9oPm8cSoxW/qBfhQiXsAwLYpSo50f75VbkwMSU/zRtwAyYpscjIlVT35?=
 =?us-ascii?Q?YApGFx0bLrHGlhXMSAxBGX07cNfMLyC/6qUppRq6DiefQ0dhPXKF5qDWKrh7?=
 =?us-ascii?Q?QzBcmNu5GmFqbClYnDJfr7AQF7iCGNXlLYHNDvvbnjJ3j8pfaW6zWdba7T5G?=
 =?us-ascii?Q?8b8+eBC6CQenxVGHNvwJAC8LOFQHrxeIM1/3SKEXfjCRjXpNg9t+jjYjZItw?=
 =?us-ascii?Q?hJGXafbxEcgqrmMEsofX8U5kArzEAK87diuQbpGKmUOmnwpjXGQudKY1mt0d?=
 =?us-ascii?Q?mbVr3HhOMvnr8DaeK9bnUh56m8P8?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?rCtDZIoWzvJKzB1TEZdDG3Lz+jRZ/L9HDo3lN0rl2GZZHAIU6IHbXIrT3+kb?=
 =?us-ascii?Q?HXEoEEPguxujNCoFtPnml00KD9w6Hsqk3iYP3lEUPPt5K8Fq90qvQMvRxI1N?=
 =?us-ascii?Q?QFe2L5xsM8zJXbxTem+9RHCWAskl/BLNNCoZvs08C/4tYMlSYGc44Yuf6+lb?=
 =?us-ascii?Q?NNBOeVpTlia6KIBcasCO2Zbf8r9q1GyiInSXuzfnCyELPGuM9chsLTqF8gLy?=
 =?us-ascii?Q?lbYMCMgn41Pt1q1IK3EB4MrErlwyuuAQw0TtmOFjxC6LLqdmtmWwBR4Pdox/?=
 =?us-ascii?Q?f++RxVMeVvP3oXqYUX1l+2agrRnH2e+sCCzK6iaIZQG1FT/HdLTZAnIfIjo3?=
 =?us-ascii?Q?e4jBBbmiv7x8at+Zm6fJWwatS7GBXAByHTsa/YG/bs78UKVXWKq0o7lAntLz?=
 =?us-ascii?Q?fcl1TZLLjUjGbLXXOZUPVMgt3Ls3Q1uPcFFVESlCOsO4vPf4oxn9TMhuR5uj?=
 =?us-ascii?Q?/RZA7mG2J4n34xNcm3F01T492HERcqPXHBuWeBLa8IyA6N0d8dbgzOkAt+t6?=
 =?us-ascii?Q?Kek8ntKhNLLLaiRX/rcws3DI7cVhXGWopPg6pmbGEbUm+Xa3kg9z+EkCfkkX?=
 =?us-ascii?Q?LwYh7RYSWZqwg0RToOL0hoxh2Fl/OkY2Wl90lardDV4p1IwAPGMg1S3CxkgD?=
 =?us-ascii?Q?m+e++UeFWcneP1n2gimLo8CKLcPLy8XCjdDFm10RthF9DI5rYBRqD9NYznM2?=
 =?us-ascii?Q?B2vZqenpFvWZKS0TsVXJT7VGPBBdKXwxOp3Rn8CrHqGWNl/0M1Gm64X3tso5?=
 =?us-ascii?Q?ciuI233rkSMqODuoqEP4Kva2DDaCzFqY4fzYWKxgzoJMJIH7wOwEyEgsosaM?=
 =?us-ascii?Q?zp+6AmTyZ2wvIb/lWiYUfa3QOqoOygTpeBj4QI/4o4ru28L7TXJJKr/dkiHE?=
 =?us-ascii?Q?y8nVFNZpO6AqC8R7f8e0LG9q00yI3zeSRQYBXWR6o4p/+RLxS1kkqAuWkzjF?=
 =?us-ascii?Q?OiQ3afkew/UeyzuX6096lP5d2V+A2KSMA2iGrMyYN0WULSxX/2yhiUyvxVNL?=
 =?us-ascii?Q?UH4ibdvkjEwTSpZggFiw0wZiUzbzxCMZCgpXhNlwRVl9bBQnL3gHPS/G17Fo?=
 =?us-ascii?Q?64TuCAmfTihk1X47DlYuqUSv3n61ECZCtMl4EJXL9q1EISfp9SZTz4t33Kmh?=
 =?us-ascii?Q?ImP+DUElOKB2nXtQA9ixhlUo2BOQT/7Z2SdvwN2tgbMA6jdKJpUHnvwoGIuq?=
 =?us-ascii?Q?0TsqBwww9bspyqXhEpYvJ5TWySxTOaLYar/SYOzOLHltImzonFUqGwrvUom8?=
 =?us-ascii?Q?eXmSp8QUVTF1L6IJNZNpCcnC2ezbR1VYMD9iQobUAaat2I3wPShSm1t4klHa?=
 =?us-ascii?Q?8zcKg9GpQtVaT9lm5vJMBKyIfN1d43DmxoFm0yu2mKkIw1NlK8o4ZLmxRgwP?=
 =?us-ascii?Q?BAZt5DFxaX/OR6q0ZOngYhWrPgzzqubN7+GvMmCN6h6xRe99hzfp94Yu78nr?=
 =?us-ascii?Q?f2cahRz+eCyS1W/g3bObnqXdQu0UFtX7OAW+OC3m7eaFab5wiM/zazuxFUd3?=
 =?us-ascii?Q?yuk2V7qSFMBa4dLeDhSgy4NQzzfISy0cEORcaEICBAvNFahzwxUg64OD+Knv?=
 =?us-ascii?Q?0lg70FfeN7Qkpv15YCHrc6vsXQOSnpeBG9Z1Od3IaGxsYC1ypr7E3HioTs+9?=
 =?us-ascii?Q?wg=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4238fde2-27a0-4265-96fa-08dd6f7608f3
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2025 10:31:30.4316
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yl1dTj+KxfjessN8iRB4f+ZNPOODwntC89QkUt0sloCR+pUQejQHOBDqQqhR3hcJb3kNQomEQ+Mv9eZBaR6Qmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR06MB7100
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 30 Mar 2025 10:31:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116388

Not referenced since commit 22c255b2e9bb8a8a97ded018f5ee0bc702b11f6f
("vlc: Upgrade to 3.0.20").

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 ...nvalid-.oc-translation-format-string.patch | 44 -------------------
 1 file changed, 44 deletions(-)
 delete mode 100644 meta-multimedia/recipes-multimedia/vlc/vlc/0001-po-Fix-=
invalid-.oc-translation-format-string.patch

diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc/0001-po-Fix-invalid=
-.oc-translation-format-string.patch b/meta-multimedia/recipes-multimedia/v=
lc/vlc/0001-po-Fix-invalid-.oc-translation-format-string.patch
deleted file mode 100644
index 866ed03294..0000000000
--- a/meta-multimedia/recipes-multimedia/vlc/vlc/0001-po-Fix-invalid-.oc-tr=
anslation-format-string.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From fc4bd86bea0b81da0b6fa5be0a352aecc8fa690a Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 9 Sep 2023 20:13:55 -0700
-Subject: [PATCH] po: Fix invalid .oc translation format string
-
-gettext can validate format strings now [1] with 0.22 and newer release
-
-[1] https://savannah.gnu.org/bugs/index.php?64332#comment1
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- po/oc.po | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/po/oc.po b/po/oc.po
-index 667696cfe7..ddb1677d8a 100644
---- a/po/oc.po
-+++ b/po/oc.po
-@@ -5298,18 +5298,18 @@ msgstr "Comanda+"
- #: src/misc/update.c:482
- #, c-format
- msgid "%.1f GiB"
--msgstr "%.lf Gio"
-+msgstr "%.1f Gio"
-=20
- #: src/misc/update.c:484
- #, c-format
- msgid "%.1f MiB"
--msgstr "%.lf Mio"
-+msgstr "%.1f Mio"
-=20
- #: src/misc/update.c:486 modules/gui/macosx/VLCPlaylistInfo.m:138
- #: modules/gui/macosx/VLCPlaylistInfo.m:140
- #, c-format
- msgid "%.1f KiB"
--msgstr "%.lf Kio"
-+msgstr "%.1f Kio"
-=20
- #: src/misc/update.c:488
- #, c-format
---=20
-2.42.0
-
--=20
2.39.5


