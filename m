Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9B7FC54735
	for <webhook@archiver.kernel.org>; Mon, 26 Aug 2024 09:41:10 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.116])
 by mx.groups.io with SMTP id smtpd.web11.48814.1724665264692466530
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Aug 2024 02:41:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=T7avcIuo;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.249.116, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OP3O7EWfCoJ75A4tdySYfoq8u6BNppLGpT1nGziLgpjzUN4Q8xgHmKk1rNmG1XhEM1wPXTBXHH7mAB5fUJ1Q70ul9mItVc+IhvIlzgqGCq0GVo6p30qLMisq2vkEDbi6ERnevsRYfuZFc0jpATLGLqRRkxf98e/rxh0kMYp0Kl4BQSxsFyRT0dOmL68hzZ7v707BJWOjNYSdEGRVPHLO+uml1bX3IjJ6c5u85eYvbd803DeW9zxx6QWgo8JJS+WDesmLt+e2BAvVl0vP0y4UdECekYEWTS4j1hRPlDYIt9qZFkErbxlsydkEGEtv5csEdEF7iQoIwijbNp7xkpgr1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E6xaK4PN61bbxt+gdRUck4F6kT1SiQZa8vqviIxsAqA=;
 b=Vgcy1mPYUdk4I4Ln1Y0GI5oKXUxzqFy4mupbBPKuUPo+yEWWYGgISKxmu4vNGyjGVmbsNxMXKU6IXGp4Cu4Rs6atCC/ySwJN5mD8HCagJW+1pikz9DOLNe9GxsqoNZHV1+mModIT5JtrrzntcQ3Sx8L6I7LwLpMWLJu5DwvxS2c5Q1jtGAmygr1C9AzdrvYIo2+Dot8Pr+QmoRZ/Rc5rcQ/SQu9c6dcamTXZhvlKzx+DEBGWnjWlKCK5V7DfRx7aBXPvRoeUGFkI+WZZJY7L2PczUKNLR8TXdBbHtV655lEgJ4unkTQsZy09JUMTgoAGtKzFbQA7g3Kq98mNf3voqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E6xaK4PN61bbxt+gdRUck4F6kT1SiQZa8vqviIxsAqA=;
 b=T7avcIuoEcCfYlaQSQMRQmcvtzD/wYOXVBJ8PXL0KKz0axIkRnX5ovsPSbapQog1otapRV6EkxD49uJs55q5UhwY5PsBNck80e6jCoVWsFZSAHJCIDs8RE3kWw31yIXk4sT47djCPGlu8R1tapGd9Lhp+BrG40Z8F90cHhNuJfAK2N2gkSuEGEcFcGq/vIxys6UEst5mNw9wSAYdBPJH9W6CfbZ+bBXeyBka9wIgUv4VhWwhNsRd20wWmprv2EIbeMk2/AOJEUpFKpkHoAI4X3wbEOmf6I7BeJL3wYmnDEghNO9XhIJB+ITFhsK1sipC2NuV5VaFIDeown8tGL04VA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by GV1PR06MB8418.eurprd06.prod.outlook.com (2603:10a6:150:25::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 26 Aug
 2024 09:40:59 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%5]) with mapi id 15.20.7897.021; Mon, 26 Aug 2024
 09:40:53 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>
Subject: [meta-python][PATCH 01/21] python3-xlsxwriter: Fix LICENSE
Date: Mon, 26 Aug 2024 09:40:01 +0000
Message-ID: <20240826094021.2744296-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV3PEPF00003668.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::384) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|GV1PR06MB8418:EE_
X-MS-Office365-Filtering-Correlation-Id: 681df21b-b4bb-4a22-95c2-08dcc5b32dac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?iiPQXdvAJh02kwo41tZq+tRshhvLDWKuiuya0nJVdcXlHcrUkr1l4nVY4T/z?=
 =?us-ascii?Q?81PXz+qCx9NfW2uHRq73y4oNMud3xfuL7lO0QSdySmGJss35JfoPn20DA4hd?=
 =?us-ascii?Q?hqF03s2dSuInoXKb/0f6Zeyng1zgBdRMbKXOfdSckQKJPRZC+WcmuV/wzA5F?=
 =?us-ascii?Q?3TPdjpqtDrT93lxvnaXOmGA23galWQP4f0ryh649GkzSRpbAor+zzVPPYdRS?=
 =?us-ascii?Q?DiVZjKA3jBZokdbdnpil8eeObcwoeb9L8JALG8htzo4WrYipjey/SwPQvs5M?=
 =?us-ascii?Q?txbldD/lbvrCRU8loBa4CXV8tWyiAlyrnnVnMwaReXxjFvSnsfjzsJkmH0Ip?=
 =?us-ascii?Q?aROCGAXmz2w0fCKf2OXyHbxGtCZKPcP+d1/P5u9kC0xi1X5cvmlAX4fQvQYX?=
 =?us-ascii?Q?9QzbrPhoLKC55pBvhw1etmZ3BwP3Zu/RtvBkGbdSKSGhOYTBOLKF1zeLo4MD?=
 =?us-ascii?Q?5+DDsXZLFGsSOzQYL6xlMsqobBoHt+IlONpVq4LIZXi4z9xvgkEyZ59Spc9a?=
 =?us-ascii?Q?2QZTPCo8EPgEN4XhZuk3CUSP/CT74PDO0+d1rj+m+/F1q9hao0ogHA8Vn6ZV?=
 =?us-ascii?Q?weyQ6dbYISiM7Uiy04i9/Jd5rYLwS7izshAAsEnwkz2s5P6EZqXxIQBSf4tx?=
 =?us-ascii?Q?COpqGJUTMXJ2ZO42JUrbBlbfLalo6ZubYvU+Kr/uKxLddFwbW9MFWS1B6GfG?=
 =?us-ascii?Q?LQJe6oGSvqrdEmtIJDCpDCP0DAP/uZFXRo6e7yB7KsmZiOiSPizez3FdtLY/?=
 =?us-ascii?Q?P5WYo4sEAzte54lfe0sNJCo2RGjNA0mJCm/dETyBIP7nmtZw9ECOYVDJ9oTK?=
 =?us-ascii?Q?8iObTJWQFCPEQUt/Vu2Kz74Ls3S3oUPI7avzqRZXFKq5UkontbAwSPi9lXZn?=
 =?us-ascii?Q?b2O5y/MJCArn9OBjyxRCwvOFS94HNRBpXHv8jQMf/MzE0TTdCO1YybmXwW1P?=
 =?us-ascii?Q?JlDUJjkxE5CRn3mLgW5uiK4YxuhQCzaAI0mvUx1MeQf1nnfaCId8g9Lb/sRf?=
 =?us-ascii?Q?J5SuxtEuR9VFqHl1SYLWyLZHnZl6kNUjFhn6HYWZM2HC7DwiCTcA+3PXMlqD?=
 =?us-ascii?Q?+VzL/i19wUMa1GGj5Wq1F9ZqPsF4h4eOYgHATeZSE7M5tRIxv68S+K+YSKgd?=
 =?us-ascii?Q?4Vlb0hT0nCHAgyu7lDlcmyzBF+fi2DGe9svp6vu03eSBUhO4X97DYS/wSOdW?=
 =?us-ascii?Q?nO6k9u43R2+3e1nkwIkVoJR7O3pxMB7t6hGmt0Yrz2RYezRhMCU63O7vUhw0?=
 =?us-ascii?Q?JH8PzSHWMFIOVXy1LGdkyZeRvYZtEVEuO7dXmHzFZv5Oa+V7fwPZvZr0qTv5?=
 =?us-ascii?Q?NLseBRTUdLHrqviGzkQBQrBcGdhNC103cPtxzUxvSv+b3Q=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ezdVgJZiacQCNy7MPIX8fi63ET+hINQy22MKgaIyb0AOuN2L+CH2LivILZ2J?=
 =?us-ascii?Q?eYNrLGAgRVTf/kUkuDIbl0l552ot5I47P3baw0x4IIp0NQtBGqvYByzUsHpC?=
 =?us-ascii?Q?TfZSihH43ZP8QzX3POSaYP823aI0ULLGuiJ7hSBCSQG7+sesrKhfAjf+ty7K?=
 =?us-ascii?Q?hZ1wcCnBoORZVIZf2Wfa6f1YJbPHxYFwsmlzyMe8sISIuJAYyKfalWexICLk?=
 =?us-ascii?Q?AD1xMxzVohGolOf2PwC2BwLWaoHMZYid919Pxl6W85zBaS5Sci0UbZcx41m2?=
 =?us-ascii?Q?OjzWrVH7QAMK1jw0CPnicRhh1UsdteLwIysa+6m56vOZgGGnXBIHYjd6Mt/n?=
 =?us-ascii?Q?cunHBizs/YPX2KgIvQRR09XHw07PMNVUFBz/2c5Nt9inJyEeukYgC/I6r4DD?=
 =?us-ascii?Q?+KIrnD/6FMIk65OFKPhvDGVu2UVvl7HoCKOkrwmyPA1hzy46rISCkLTjAda6?=
 =?us-ascii?Q?B9IqNWFM3vIIz5zOesG4277o/NrfYKfTNYJiCw3+8rUKaxbucLt9feZZgITU?=
 =?us-ascii?Q?RtMrgUMh/a6AnGuYvuU6Yp/XYehU3neYjQmIfwP25YTOMIgPeJJgvWxqEXRz?=
 =?us-ascii?Q?Mb+t5Y4mUDKK0PIStiD/hfqcAGGZzqVrhwGiTu+QVfmDsmxDpNyPHCNpUJzE?=
 =?us-ascii?Q?SFtCcAQpAjdJcyo9IeLXT2bLKsESCzFAGK9RU58y95sQqXV59j04zFODmbTp?=
 =?us-ascii?Q?KYWu8/4CY38j1nG5aHKPH2RkcOadBeL48VSf/UIjFUJYvSEWNAL9mAaA/jzO?=
 =?us-ascii?Q?mJD9F585ps+a3IXtS4KH7IaPZPF72hFX9/v5EJ+w5kJevptoupEYvOgyr0HQ?=
 =?us-ascii?Q?FezkcXkrW/AY5X0AaIFesIoSORwOOwWZI5qDYB1U9bR3A8bFrdiRxXdWg9ek?=
 =?us-ascii?Q?JByYIVfrvr4lYmcKgSiVGbfaM3d7FZTt+nhpNQsg8AmSbOeB0tt42jy5alpx?=
 =?us-ascii?Q?0TVJg6nG4xG2Jt9+k5Jh7k81/CKFsGFzt0e6q/qbmEZsCVoG8iDoBQkdo+ek?=
 =?us-ascii?Q?LyrpsbGnvrysxK1k2WHU9x64cI0jslPPmz2uJ4wCmw8mZZvVFdKnhivr/FPC?=
 =?us-ascii?Q?8FDqiIlwbWqEa/3G5L4VQ5r72PRKMNXt12p9VUfxZzLvN+rptru7rDQQkIwZ?=
 =?us-ascii?Q?NdagkkZ9YTylNU/3o9F9sktPH+UCbyyD1T02Wm8Jal9gvHZMM6Gxx4yS7AQQ?=
 =?us-ascii?Q?LJsI5atXhrD5uCB2/Bv0J+Nl7Zr0F++n6u6K56gCl3ht9z6XG4DFuyiZY8bf?=
 =?us-ascii?Q?EVZ1LOlZul/Q+1jZQp8t6uwu6q4MclDLeQuJwTz23KcRbzHTOLxkT6ECnN10?=
 =?us-ascii?Q?aRTTKejjgGMtZo0fSZyg6h2JJBtbx4xxug/peBYXS7ReOD2Gb8/wtK668lKq?=
 =?us-ascii?Q?yht69h6nqBaoc/uVkfPpbQw71RRmOCgjOy47JbGf3DRTr8slA1oXv06d8nEj?=
 =?us-ascii?Q?7zi8BBLG7RjnQvtZpZRZHtecP33FGOeNNnkg86XlvLCZQiwCPEMRD2Rh/Ac6?=
 =?us-ascii?Q?SvJHYEITiUWGHQ9plvNG3TrAhdMg7cIg8FSaE5rcnQZBDTHOkJeVcjvv0C2k?=
 =?us-ascii?Q?v8kXDz8Vs9WIxxck4/xvza0aRBMcbbBAiJyfdBfQYahHAHxqT52aS1OgP9b4?=
 =?us-ascii?Q?sQ=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 681df21b-b4bb-4a22-95c2-08dcc5b32dac
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 09:40:53.7383
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bN986rp94gUbd+Lxc4u3lvvZFIpObn5UvdG3HZgkKDJjtAak4XLjLGzwBvYDNllD6pBOJyFXkGYyDYr4d4bHfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR06MB8418
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 26 Aug 2024 09:41:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111949

According to homepage https://xlsxwriter.readthedocs.io/license.html
and pypi page https://pypi.org/project/XlsxWriter/ as well as
https://github.com/jmcnamara/XlsxWriter/blob/RELEASE_3.2.0/LICENSE.txt
the module is licensed under BSD-2-Clause.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta-python/recipes-devtools/python/python3-xlsxwriter_3.2.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-xlsxwriter_3.2.0.b=
b b/meta-python/recipes-devtools/python/python3-xlsxwriter_3.2.0.bb
index 93ca5525b..6e8f1b24d 100644
--- a/meta-python/recipes-devtools/python/python3-xlsxwriter_3.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-xlsxwriter_3.2.0.bb
@@ -1,7 +1,7 @@
 SUMMARY =3D "Python 2 and 3 compatibility library"
 HOMEPAGE =3D "https://xlsxwriter.readthedocs.io"
 SECTION =3D "devel/python"
-LICENSE =3D "MIT"
+LICENSE =3D "BSD-2-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Da4bab8df34a9a138b4e0ca56b85=
59a05"
=20
 inherit pypi setuptools3
--=20
2.39.2


