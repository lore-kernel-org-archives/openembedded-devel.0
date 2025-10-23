Return-Path: <Sana.Kazi@bmwtechworks.in>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC8C2CCD1BC
	for <webhook@archiver.kernel.org>; Thu, 23 Oct 2025 09:52:51 +0000 (UTC)
Received: from MA0PR01CU009.outbound.protection.outlook.com (MA0PR01CU009.outbound.protection.outlook.com [52.101.227.124])
 by mx.groups.io with SMTP id smtpd.web11.16528.1761213165015255768
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Oct 2025 02:52:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bmwtechworks.in header.s=selector1 header.b=tx2IA1mg;
 spf=pass (domain: bmwtechworks.in, ip: 52.101.227.124, mailfrom: sana.kazi@bmwtechworks.in)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nPAaSZX40wMxXdDyrWmYlqWuWktK5WPTnRTFt8mpYoQ3TP8Ph8p1KEfRwKrIAbnrtszsdQNntItC60rFduGQqL//GjhlngZThz24pNVtg7QTvTXsHTNyKwhFhUkhCZy1/63J9vBeB4twSHf+z6MSl+Ppikb/tvZuziYzNSQRjexiQOgsNo5wzC3EKvx9FNe3M7aLCmVrMhRCLAt08bsLE0k8XSc0H/tITVh/LA8e0WGUOYCI32EZxMi0SNtieA+HAOVls+DBn2i/07w8qm6qpPVVSmO4dvotWV7xGFATCi9ziHmsUo2Q+EZgUY3mR3IpxrvBDcSrp+5GOkB6/zlmVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=udxpTuHeBrrVRh3X7N+Qq/+KeCZKDysyAKyNQZ/eXaI=;
 b=TkhkZob/CrK2L9NlpLL1JnbmnBcJGyBnwWjJkcWQnFnECVsfaaDF1+l2uq6WKLdRJSV41olGQHVoFpw2Zg4yuy+K0Z/+TNcc7j+wD23/uMDVvM/EOsETQ2EVPCgiBBf+gL7Ytp/BYZkRk4W+u7T3GfZ4qXXXz42AywsS+J9sUAeWvQYNizBGMC2imoU5GnAWNz6T5IGy4NVPrvTkcGF/ONvyg+JUCZXdYeje0wT4Yoezb9Al8yzK5En8pyN1utNE23ku9FLrnaRC7YHM+WZEM6R3/tmna6NBhDeLRT8aqoyWnWidaO3uVhXdvJ8oafIPt27Xu9dp7a+9M3ACeg6fiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bmwtechworks.in; dmarc=pass action=none
 header.from=bmwtechworks.in; dkim=pass header.d=bmwtechworks.in; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bmwtechworks.in;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=udxpTuHeBrrVRh3X7N+Qq/+KeCZKDysyAKyNQZ/eXaI=;
 b=tx2IA1mgO5r7vYXLd/Pb4pffPmj3+DU33ffiBpcND/viD/UOZjdvlMkmcREix/tnhtRAy+QPCsfHaAK8NezEV86Y7TI/DeZNAFkaJiTDmj4iuguaZKl4E2MwXd+asygIvprhKPWAU464LCptQasz85mIJKPNQM2/8noXJAAOAg4IcFuwzq9ki1vgeQqAgpvQbVHMf1BeKGM9mTWm7xVJkPxUYpY65QdOpBZy7pw74m7BgobwyjVGDsIoKtu8ZjkQdtJ5EP9xUZM76fYXN5axblFXfq2CntN8jUG/XoGsUaXx15ahnQ1rr89B7XqRKdl2zUriZtH3n6eo/7hxnIJDSA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bmwtechworks.in;
Received: from MA5P287MB4602.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:19a::20)
 by PN3P287MB1800.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:19b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Thu, 23 Oct
 2025 09:52:37 +0000
Received: from MA5P287MB4602.INDP287.PROD.OUTLOOK.COM
 ([fe80::478b:23ae:5e3b:de95]) by MA5P287MB4602.INDP287.PROD.OUTLOOK.COM
 ([fe80::478b:23ae:5e3b:de95%7]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 09:52:36 +0000
From: Sana Kazi <Sana.Kazi@bmwtechworks.in>
To: openembedded-devel@lists.openembedded.org,
	sana.kazi@bmwtechworks.in
Subject: [meta-oe][scarthgap][PATCHv2] cryptsetup: Update the license field
Date: Thu, 23 Oct 2025 15:22:27 +0530
Message-ID: <20251023095227.3125258-1-Sana.Kazi@bmwtechworks.in>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: PN2PR01CA0220.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:ea::18) To MA5P287MB4602.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:19a::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA5P287MB4602:EE_|PN3P287MB1800:EE_
X-MS-Office365-Filtering-Correlation-Id: 71cd1edc-2b96-4c5e-d544-08de1219e527
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?53kCw0Y4XJw6s6l/QtbnUkGu02lHiFvhZa08VKsGxDW3OzCT65OKzf3WWJWA?=
 =?us-ascii?Q?zw5NtmhQEuyCchERZ7nHd94JABWW7c8vuRvIoonbNV1mrFFzS5fJb/ZkQP9/?=
 =?us-ascii?Q?9zD/AxkX3QHGEfztbgCW+FaOmBCCO8FHjyrkdA/t5+HW7Vuo2p2O3CjmMl6W?=
 =?us-ascii?Q?vsxLQJgkPxLYpupiFCdV+t6zLoETB63J3y5Aq004rvgiKi6OW+yZ77RFNpci?=
 =?us-ascii?Q?THTbM3jdCLCyyB7aQfLPFXmYkapOLMmHxtDC3Hcme/uI8gl16Tsxe0R/CC8l?=
 =?us-ascii?Q?J6A1HkMeo0435YbBfg3Fv4p5Ton19TR8IkUf88g2Ke3JQDiZ0gOZ4ZLhcuzf?=
 =?us-ascii?Q?p/YFlZNr/wN8o+utFqyiaUu7wg2Aqh55zMoiNqvtrpMYAeuIakTeET8uTPxa?=
 =?us-ascii?Q?fS8R0QCN68vvLtIwta+TsZwcxgR/rP1S+q2eqokYLF96Gsc0FMlVG3uIAqrT?=
 =?us-ascii?Q?+hVk0kt9DlMclZeOaOJoUaGVdmK7jA2A84EBVP6UwFe6DVzzKNYoysw8eIw2?=
 =?us-ascii?Q?Kc9qsS93QECHumD13XeEtA6sJp82H5xv8CpWsR5/uPM3NxBcFcyHZCAfYNO1?=
 =?us-ascii?Q?UCp064kq1SzB5ZIxWaLbh68YXYDfvF/+j/VaCxvk6IMB4d9YjWE7oqLOZnK+?=
 =?us-ascii?Q?xylnQBHUzMKCITr2UbfhYhIMe1JQu9dRreoBYRL0PGSTLBpZ6OezDlfq6+48?=
 =?us-ascii?Q?VoiN1B0/zuWzVpXo1MyxOfEDVsSSrhOzq6S6HYsV7k9ROERnEz/ikrgdOFQO?=
 =?us-ascii?Q?QZC6T0UpL0Djk45RMAmxUBO2HI9msaYiEsQXw0uOajuy8YmWLXvrNn6LKsuQ?=
 =?us-ascii?Q?I0F56Iq51U16Cqo+tjRQ7sptA6Esev7/CVQjTmkIdEpvhDkZQKqS7OwPPdZQ?=
 =?us-ascii?Q?0NW2ngAKSvpFiB6aZl4hY3hS23ufka4hDybRLi4qYuAFsV20ku9fxsJuk6e3?=
 =?us-ascii?Q?k06LP+ytm+DDX7UvFlIZ5C/dpCjQOekV1GHBHj+Yu4JEsLv3YwFHqh+BGt4E?=
 =?us-ascii?Q?KU88ziwbzi1/5ag7IIyO0XXBwKKXr9GdpBC2iol9K/+L7XKIQEeD3WvjslTY?=
 =?us-ascii?Q?HpK0q69YG9Ca4opR1xJEefAraciDnkWFiRuwkatOjBGqXmEhvQPl+iyXLDRf?=
 =?us-ascii?Q?EusE3U9FVthd+bRsLFLIWnq7gwr8aZq82d2n8Gn37lL3dy/iTjRw7uqD6fxk?=
 =?us-ascii?Q?3vMieaT2L+xnBNy55BllRI889sp/TvOR2zLAmCwCrtr8utlqgZwwOpGhZb/6?=
 =?us-ascii?Q?NQU4+39swIHuCuqFADVv4UVCP6Zv9pZyP2pPjWxgSVB+Nlu6nauDjcMiTnX9?=
 =?us-ascii?Q?siEh66/5O1sWbk2ZzxtDye5rpZ0Kf8wWgoz+IWs1v3ofwQG4+xWzrK36uA6s?=
 =?us-ascii?Q?xm+M5Ty8XL8uLOj2OBel4u6MnnJWbhgEapF11n2vXc0gXv7Qd4AQzGsDUbh4?=
 =?us-ascii?Q?YS8wZ4ei/TnwOi5ODyIZ5XoQsQc1KmNQD4JA/oZ6YHLAhwn1jSI5Yf7WjQC8?=
 =?us-ascii?Q?6hDx5qQ01VLAVBzaX0y991heqjn0i9cwHTqJ?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA5P287MB4602.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?GLM/XKweLWcIE8uGz4IlCeksJ2X1rteYkWXE2hLpx37OZT6zdUcgM/kqwizW?=
 =?us-ascii?Q?8lbVUDAeOF2k7a94av1BxzmbEumyojA4Vx47KNGK/AUlqiqruwZuPNG+YdYs?=
 =?us-ascii?Q?7DHf0KehrH3ePhGc+xeKxIf0075rkL8DXGWPFJLscN9fT6e0qp6p3SNeBX/g?=
 =?us-ascii?Q?Grs9cxnXt3S8b+IRz66WSch1V8YB3fKFUr+7kaogixIQV7Fb2kgVVZIFYQpC?=
 =?us-ascii?Q?Et+EK7S2NJdL6/+gRrauGpjn66B85OvJm2i+K0JwU0i+3I8g8Hx7wBitImLk?=
 =?us-ascii?Q?QOMIF0azY1OxGniedIoCwfvS6mbxP+sgPtCggR+YQKh0GjozVtQXj+S9uv5+?=
 =?us-ascii?Q?RAhhHqslmT2qLEblqDjHU1GU8FeFrirl1Jk4Gr9XtCVCcE6p6rEaS4zdRBTj?=
 =?us-ascii?Q?vi0tvzaxiSLEH6uovImjVko9ioA6sOZ/OYx+Lo814MOFtWmXZcSNm12+DuKY?=
 =?us-ascii?Q?BLfIHhySBCXbDjH3ytCBQhVkvShl1qTM9FrrLqWwhDflu/na4jMxlj/xdeUs?=
 =?us-ascii?Q?nei6I4qm6SYY7HnAHsvvVNvuk/xjcdE2WqP0BNIMDk8wlMdfAop7DO2cfdUR?=
 =?us-ascii?Q?rkdAQKsAzW/OZ3UDWYaLS9uFOUWQOs372H9vYQFi4XjyiAC+I3fdB9Z7LyqI?=
 =?us-ascii?Q?Ye4kCK6riJsZEIOPaExrbHAgf06t7UgiyFR02NVZ6sV3y6YKuiqu/gYq9mJT?=
 =?us-ascii?Q?584aX8AiDdn6AKLVkTCT3i5ZHvbyd4Kz38fTcVPT8GeQbcSMM5AwJBOpT03r?=
 =?us-ascii?Q?BufBMffM/88cSG9VUcEhK48vObCFJGN07o65Hxyfe4qWIZyVdYL0MiV8WUb8?=
 =?us-ascii?Q?6BDetdKRf5rFXiWalD+L23fGM9OOV77MMGdvH6uJ6FUkVO6W81ECgfRXRkDF?=
 =?us-ascii?Q?nK28MguqKpxeQ0uGqN6jkfBuQ/kzJAHFvUOljKeL6FeaGPzm87TQEipJPlj6?=
 =?us-ascii?Q?kWF7uFijcuulVylU2aIIs7fFERFpyCHdHlJ+rDvFcaPMZ3ugfSzJnfMEE1WS?=
 =?us-ascii?Q?fwS6heHbKe+cqnwOQkBHJTy755zD1+xZSwLaSij4yxYUkVZOS0B0/mYzIqkB?=
 =?us-ascii?Q?iq+Bhrl0VGx1MQThVax91ogx/CPvyJsQ7kmdgfnO4jZi01VFe8V57FozjuS1?=
 =?us-ascii?Q?nDQFwDfjUfp2BFhH9r3vT0OTxWQE6NNpqPmMskHcPsEG0VJ4ZnivSkVnwKYn?=
 =?us-ascii?Q?wxNbx6HDVRuIimNhtiCdbWcGH89js3Ry4emH7YLOJn1AhVdTnG/h0TwzFtmz?=
 =?us-ascii?Q?I55Ahda/WSXTI5mBCgILt7K47l3P0tti+TGczPXtBypapW3NMla6Bo0w2c4t?=
 =?us-ascii?Q?0+Y1bBkTq9V0yuxXHTC7KFuYL0pOgsH/HYHhzVT2zqrIJSrPYa/7Gstggwq0?=
 =?us-ascii?Q?E+zIUisQpspeXSk7JjHzWFY80FMfDKiTgUH7dvCva9IxvYQGxePvorbQ/iT2?=
 =?us-ascii?Q?bx8L5wY4UBA0fvkvtIo5LT3Lgmvqgu+nVv6noyeSlTJIov/rV46rr+yLzahm?=
 =?us-ascii?Q?fWvYhq6DngD1hTOs+Qr7I+Ony2Zi8trlEn+b7xP2XflcvXlqXUjBAy8wETm6?=
 =?us-ascii?Q?1IKWDuP1sBIhXtZPrAayedjQ1xHvvbfb+9GZfd7q?=
X-OriginatorOrg: bmwtechworks.in
X-MS-Exchange-CrossTenant-Network-Message-Id: 71cd1edc-2b96-4c5e-d544-08de1219e527
X-MS-Exchange-CrossTenant-AuthSource: MA5P287MB4602.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 09:52:36.2180
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 970fa6fd-1031-4cc6-8c56-488f3c61cd05
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VVX3KfQ8Q/+HWleTChwYNXv+V7aUegBsFHOhVKiGheV7g1o/RDdXH4HEtuRn9urXzU9XggX6sE2p2HuQc8XvZtNiY1mI1Z5EsXUJa1Y/Hok=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3P287MB1800
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Oct 2025 09:52:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120928

Cryptsetup code uses Apache-2.0 license also. And the below
reference clearly states that GPL-2.0-with-OpenSSL-exception
is to be used with GPL 2.0 or GPL3.0 and not as a standalone license.

Therefore, update the correct license.

Reference:
https://github.com/aboutcode-org/scancode-licensedb/blob/569d72e13e7c8d14a4=
4380f91e80c5a2d4091f8f/docs/openssl-exception-gpl-2.0.yml#L7

Signed-off-by: Sana Kazi <Sana.Kazi@bmwtechworks.in>
---
 meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.7.2.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.7.2.bb b/meta-o=
e/recipes-crypto/cryptsetup/cryptsetup_2.7.2.bb
index 711e582809..934aa856d2 100644
--- a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.7.2.bb
+++ b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.7.2.bb
@@ -6,8 +6,9 @@ and can hence offer more features than plain dm-crypt. On t=
he other \
 hand, the header is visible and vulnerable to damage."
 HOMEPAGE =3D "https://gitlab.com/cryptsetup/cryptsetup"
 SECTION =3D "console"
-LICENSE =3D "LGPL-2.1-or-later & GPL-2.0-or-later & GPL-2.0-with-OpenSSL-e=
xception"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D32107dd283b1dfeb66c9b3e6be31232=
6"
+LICENSE =3D "LGPL-2.1-or-later & GPL-2.0-or-later & GPL-2.0-with-OpenSSL-e=
xception & Apache-2.0"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D32107dd283b1dfeb66c9b3e6be31232=
6 \
+    file://COPYING.LGPL;md5=3D1960515788100ce5f9c98ea78a65dc52"
=20
 DEPENDS =3D " \
     json-c \
--=20
2.34.1


