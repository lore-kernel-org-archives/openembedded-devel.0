Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8A37C433F5
	for <webhook@archiver.kernel.org>; Fri, 24 Dec 2021 11:01:38 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (EUR05-VI1-obe.outbound.protection.outlook.com [40.92.90.87])
 by mx.groups.io with SMTP id smtpd.web11.44299.1640343696863120307
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Dec 2021 03:01:38 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com
 header.s=selector1 header.b=EmKABPpS;
 spf=pass (domain: outlook.com, ip: 40.92.90.87,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gA91oq8SU0VKlTYXg+msiTLViNlYyJC6RxHfRSzEjnHQ+t3Nrl/m9HGRp7FdEgRXOMSpBXUc+D6/50fO1BQt9RQKw6w3W+aju70TZUB60BT605GFhAvNq3SwmDk3ZquoDWHfJXe7R0/uP/jQq5LHQ8nExSXMxtemN6GWDlvnvkxbq+4D3J0V6BqIPrd/P5Z5dO1UYMTcI3eGYLc42ADAw/0yQOLrcYyk5OrtsPOjpAa7W08sHSI1uW0MluraVmSbNss/hYoFPOdiCvLdFQhm8lKXwGxKTSSJCxEMUr+8pFdSDsnhomWNKeKj8ZYLEIpLPhDHvZqp1JfvCv2MWKh0Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i1oRzpuG1pFtjIngUmE08z775dVzL8TDd6hIKfuOpXI=;
 b=AnyelqfVlCcWCTQsSkfOoeL0gNIfhtHt4G9i7nGO6XoniMBDKJG3LkN53PhBGROllCM4NL/EvWis99VyA3eZxqSOcEXRyu0ZrueiY8NVHv+5MWH4i/UPrwV7JOcAF1rZFrvvJh7FsKgR353aZb04NwFTeM3WY1rhMogC+pRheQDMV1DL1AUdX23iWN0PYvnHJclH5JEoNk4GogcDr0CqpOkyUQ47owSnfiDPRiNLSaOiXS4bnGrFBx/BF25nCUgfuwkAF3MrTDFANHuYKhCoLrmVt/WAHYAY01d4Pe/WAQWTxZDEdENfNq6eRN9HZ4HNZ92Nm+ZHeIpSyIzUb3/DLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i1oRzpuG1pFtjIngUmE08z775dVzL8TDd6hIKfuOpXI=;
 b=EmKABPpSbmnxpcyPkZOQvGFKMA1nUoAW7+KEtm0zJ/jx6ewAkKu2bZ1YNsz45uEP776rf4kTg5mDuRy1Rg90NfThnOL7NFTbR09AJ8Rd+EUVS7D9WlCON3z91maQabriHDUXb+GJ5DMXBi9W8No+qxusXNCtvL9YW1VWqz7tKusp+Fca2kNpWvOAEtVSeYr313Dng92TRfTHIkZBtLEkbIQRKz+Ss/v45HGzJUoYby3VGrr5IJbnxdm7fCEk+a4yYwacO1/ne/iko0Fi8OtJmwHaIug62WB6w4u2Nqq+zNI2ll8dvxKjWK580orhxYeroKwnY0t+BDKa8Dqta955IA==
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
 by AM0PR09MB4065.eurprd09.prod.outlook.com (2603:10a6:208:1a1::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.19; Fri, 24 Dec
 2021 11:01:34 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::5d18:d92d:2403:1b2e]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::5d18:d92d:2403:1b2e%6]) with mapi id 15.20.4823.021; Fri, 24 Dec 2021
 11:01:34 +0000
From: Konrad Weihmann <kweihmann@outlook.com>
To: openembedded-devel@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [meta-python][PATCH 2/3] python3-execnet: depend on setuptools-scm
Date: Fri, 24 Dec 2021 12:01:17 +0100
Message-ID: 
 <AM9PR09MB464289A3C2D583787C502A5CA87F9@AM9PR09MB4642.eurprd09.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211224110118.1632841-1-kweihmann@outlook.com>
References: <20211224110118.1632841-1-kweihmann@outlook.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-TMN: [HOfpLK2eP4Tqia5ZXQUjTGWLwDgbznW56kWT6g6ZJ9AySuQEv+6VdnMPrJ3W76fI]
X-ClientProxiedBy: FR3P281CA0071.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::7) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
X-Microsoft-Original-Message-ID: 
 <20211224110118.1632841-2-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 867c27b7-97f1-4751-2a03-08d9c6ccbff1
X-MS-Exchange-SLBlob-MailProps: 
	ZTmCor6bjd+hW4gLxOsJl5joX02ZNnAyeRXNoZj8830CguLHQQw3w08sFpjx9MtGUxhzFyt7iw09zcrB5cXbwiguI/8RFvqyl2/ToHeLq/qcfOdL1Y7/2Netwj84DQcTh/bl+YcupLmUz8OFmfmPVY6lFWLPoV0BG70lGnrbZUYsPFlr69wQbeG0uVdAXSt8JDBm/AtTG/OLIly+lnnNRaA07ETbi/kXjr0oLL2sqT83U1txaBHXEccGdfgT73+qbAi1XYuZlYUPcCnH3lrGijqfzlpKPMabucGuhcZXuAxrVTxvAzqc0p8dRKZlUyg5HXCuABXVsd4MyWSndvBrn36TanqI5sEs5cu1B5P0/HiwsWJ2uMenC7gMA8ChYnh0pCbupTroy/FBlq40MsXMNqzReEd4h1ypz4xrKCYjm6POOBNgHCN1aGgty3vfxLtGH7Cz7DiayPZgOZrtzWpmPYxuEdB+ue3r0Ns9kyPYoMNPMz2hVzDiFvt+g7A6ROadBOYJaQC9OsYHd9alwVos7QGaKjt6zXY0vVrg+VgAHlWkfLWTDcvI9ccfRFTzVIN7zfkDAA/42/0sls7zgsMQ/ANBaYjSwnMCgviuqwGUJj6OURajk9z/s03exClz6kSGKAL03UaPnB/wo26o0StU8+IVvN4I1LVym5P774Bu3lOKXZHlCawYcxLCqh4S25LSOGAUhB0S7Yyh3fmBi34Gq/q9nlHidHM6AtOMGKRXwub/6hatM9rD7jBFQjHyTSsI8cVKuDf3fecTiRYurhOUyDoZ7qQChQRcZVS0BNomF0cY6qKYNKdH3r8QuSnBMTwX
X-MS-TrafficTypeDiagnostic: AM0PR09MB4065:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	KioFhjgIg+mEdN9FUccGSSFWzIII3z7IF6RfdrP1l68qVunWdEbp6RebWaZLY3AxODFbjs5bvtSQNHeL5ECtan8k69qAJfunzGuiM+T28W29bMdMwCtB2MI28Go5lVxLQmWhEGDZWzlTJ4izoko3XwQPejamB58ValznXF8o0ZYZQU/i5w+n5NIx/y4Q97XFtKpY7MxK3p8nH68T5PXn7XyHiV2ri30n3fkRYGPlQTg9XPyBqCIAirIZQOiHUouMyKGnAwIV8lrpaUGUzWz2xHy2FEir6JRnoOHHwU5rEuHzHt7bTSW10u3T6ng/URt2X0vgqTARrkU+7SWbHUDOLodhb0DhcvpMCHwAhtL9KbHB/sYXLFJKXmONvW2yIENn4pi/rsfNOAbvsOfWVW2kQOlzLa+mdKlWEQ9ENZFTov02avnnXL2FV4IkoOpEW7Q74L1juFEGAWNkJ3GpR5RUl+urX9EJDs/s4tf1nJP7cT4KXzGno/fdWZu0BU+HllHY30EErO0M3eSvpwjFCaPoWoQYLJu6k34PFctOO9HnFTrEvhO7zzO8W3VLmrlvzUe5VOOOquD49kqtL4V4d2lEmg==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?JsOeVLV53gfNCwPrRf11cqs9EbzxwfWtREiC9xZiRopDjEsI+O5UTXPnSxjN?=
 =?us-ascii?Q?tWHO/Ct64GqiyoN/gB/7EWW7tjb1yRec7qsKxRlczSWblx8w+0LVEF5gHXlo?=
 =?us-ascii?Q?RyMEWCz11ACE92CjWakAMYlxlItnPiMKsJF7BODzeGdDkvsRzc02f0Nhx+7n?=
 =?us-ascii?Q?DZxG+3UjtwhS7La5IoillmrNMlUwQMnmlFaU0edKKBsN5F7bxOlDGfgF52km?=
 =?us-ascii?Q?YeTfo8jQRNr5pW5vdS9nDFD66blNIWFbkjMPNFZRMpkFoRGB0I5NONSJasam?=
 =?us-ascii?Q?nYTYwaG+GtC+dwYKzTTfG/8wNLfNIOPHYIerltCJ1E7YHIXrCJ40E5qhaZrP?=
 =?us-ascii?Q?lDS0OZMzKJL+lOz9Iece3MMIVY+5LvgrriXIBsgG4BWjOubtf6N9d/hx/f3s?=
 =?us-ascii?Q?Ldpoj59GUwgyzB6yUpkJ/+THouEVtTEFmRa2IPjmpTh1LqFvMOMpFD4V/MeC?=
 =?us-ascii?Q?O/26lWW06s59yiXB4jply3xhBMdIkEYHK/5woTlKd/kcrmUEz3alLK+3rAq5?=
 =?us-ascii?Q?eBPLHqqqLMcye1e9vSqsw/yfqp0IWvSzbxIaxuZuGdSQlyX7AjQRSEILxvcy?=
 =?us-ascii?Q?t+/r+Qm/H7Mywtl764nVu2SpJEtkpKu8ca7+x2CY03zCUizXw54La0sT1H2O?=
 =?us-ascii?Q?WNdo3NB9NJEdILB4hVyc9metnoRZh5sSajTzd1+x/d+uTJlIGbTF2VH0ll+c?=
 =?us-ascii?Q?4IkcAVhjMRhCraUX2DTpa2gLJeFv3vMh4JrrAJlWj6PkTviSpNKthmNvPM4g?=
 =?us-ascii?Q?fBqoXk7zU7i8DoepwxYO99Nv2lDHxu4kTomNKHLEX/pqZqxZc4ttY7Zt0ggS?=
 =?us-ascii?Q?yIoMonpOvUpfJrTk69kJ5hY9PGkLgclP5Af/zVdmAiKKiiMZLwLjr+8ohgPK?=
 =?us-ascii?Q?rqmEmTJxGv5UsBChvW6rTC2qH5r4tr+RPXX3yLgZhbFMo74M4/ZPkuL8KlOV?=
 =?us-ascii?Q?hDsaz09608/And7NDQsGl6ycghlgv6sYUOfvsPgAyonFC4vMGxtJKr6ScAYO?=
 =?us-ascii?Q?WF964qcw5LvLrz/OhiC8UXVG+w=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 867c27b7-97f1-4751-2a03-08d9c6ccbff1
X-MS-Exchange-CrossTenant-AuthSource: AM9PR09MB4642.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2021 11:01:34.8485
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR09MB4065
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Dec 2021 11:01:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94493

as this otherwise will be pulled on the fly while compiling

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
 meta-python/recipes-devtools/python/python3-execnet_1.9.0.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-execnet_1.9.0.bb b=
/meta-python/recipes-devtools/python/python3-execnet_1.9.0.bb
index 73bdd7007..ea17e8414 100644
--- a/meta-python/recipes-devtools/python/python3-execnet_1.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-execnet_1.9.0.bb
@@ -6,7 +6,10 @@ HOMEPAGE =3D "https://execnet.readthedocs.io/en/latest/"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D772fcdaca14b378878d05c7d857e6c3=
e"
=20
-DEPENDS +=3D "python3-pip-native"
+DEPENDS +=3D "\
+    python3-pip-native \
+    python3-setuptools-scm-native \
+"
=20
 SRC_URI +=3D "file://run-ptest \
            "
--=20
2.25.1


