Return-Path: <nikhil.r@bmwtechworks.in>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 825D5CD4F2F
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 05:36:35 +0000 (UTC)
Received: from MA0PR01CU012.outbound.protection.outlook.com (MA0PR01CU012.outbound.protection.outlook.com [40.107.57.64])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17343.1763012193899938742
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Nov 2025 21:36:34 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bmwtechworks.in header.s=selector1 header.b=Uy2Dw1Mb;
 spf=pass (domain: bmwtechworks.in, ip: 40.107.57.64, mailfrom: nikhil.r@bmwtechworks.in)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pvgixB8eKPB+WiRdVT936wIkBxp6/YUSNDmB3B5vasQaO1LspUMK5Rnnn49lRBd1MvejvNZ5lpTz0W/GfiljS+VOrQqJT4mV4C0LbfAAlVerv/vnC8Oac67/PmfX8C6SuMcYor4KAHbhsZeQt1w1Sg4TVtTYZSETDchYjvJWg+JlFEXel4uwJkA8v+wzABMShj1OFrvtzcNdeYtM1tvWm1qIo2XDW78rky5S8uBpq4fhcC6WW+pKo1MxfTM3OnPnRjBQhREA75TRAok2aIcYZ4Z1+nHeLA64Avfe1c8FVgl/GzTCDtJ6SJkJ7jezuQH4Fuypu5M2NqZWnzWloKv4yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yvC/H7GRRLSxunY2UcU8SoVlEjJg00MNs4QEarMJYSE=;
 b=QQoEZw0Gfl4hBgwh7VU4Gg+nIspkd0CDO4qouhxaG2YdVMaLT5UmcZyqe9J81Lv+c6AHoxx2TCjyWdavFqItX20kNZiOE2yEbBc4aFv+Y+ImC0x10NqhLUixrtderQW0ttKoxskDbxP7FrC2n16lMnSKFGLgoTkyfgJ4Sn4jUOX/6Oo63hky83xa94x0/entKE74N8bdWbUFCkBfzJrTqCbFDeJO5Sx3487dWjvQpBl8ELzZf4mcMhiOB+y+UKvpadPpyLL9Eqb/Tzww1j7Xt2dQ2BoNmY7/VlIVGkIT8PKTRvPQJgDHVqcXEyfgEkE5FOBlW7Ezhw5/y3mc9cXOlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bmwtechworks.in; dmarc=pass action=none
 header.from=bmwtechworks.in; dkim=pass header.d=bmwtechworks.in; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bmwtechworks.in;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yvC/H7GRRLSxunY2UcU8SoVlEjJg00MNs4QEarMJYSE=;
 b=Uy2Dw1MbW3Svkl7GENEL+VFGt1xwYiRPv1nVn8PToOxRg1OR4peeVfh5UFmTGyibG7msVIEOmsRC1lJxxGwgnUYbfFta++uW96SWdIGpLWL7V922ZfB6ckEM3EWzhpTP8SInzCKF7bWUebesFhw3o4vC2nC9IakXh0aQ0m4EVTCZ2PYKs8ViV/ScvjT+F4V+Xh12e4rA/CNJXx/S4q2oQRgxlC3pOjHGQctvS5UC9bUsacXO1SCTpIoS9MxH6uBWhzxw4LGU3xSaWtuVo9wgTaBAI+siFa8oJIdi0X8dl9VeeolP/MDPX6UAAteKSOw5Ctpjz/Nhx/qBovXmONJ3sw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bmwtechworks.in;
Received: from PN3P287MB1693.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:19c::12)
 by PN2P287MB1600.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1b4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 05:36:25 +0000
Received: from PN3P287MB1693.INDP287.PROD.OUTLOOK.COM
 ([fe80::e15d:4961:f9fe:b7d1]) by PN3P287MB1693.INDP287.PROD.OUTLOOK.COM
 ([fe80::e15d:4961:f9fe:b7d1%3]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 05:36:25 +0000
From: Nikhil R <nikhil.r@bmwtechworks.in>
To: openembedded-devel@lists.openembedded.org
CC: Nikhil R <nikhil.r@bmwtechworks.in>,
	Sana Kazi <Sana.Kazi@bmwtechworks.in>
Subject: [oe][master][PATCH] protobuf: Remove embedded runpath
Date: Thu, 13 Nov 2025 11:06:08 +0530
Message-ID: <20251113053608.809770-1-nikhil.r@bmwtechworks.in>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: PN4P287CA0008.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:26a::9) To PN3P287MB1693.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:19c::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3P287MB1693:EE_|PN2P287MB1600:EE_
X-MS-Office365-Filtering-Correlation-Id: 9efa08ac-c7a2-460f-d3a4-08de22769602
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Up+gZSaMyVcwk83/ixGl4K5lP1rr7qVcF4u59aX632siT07lsuiVYyFnQXQ4?=
 =?us-ascii?Q?af2Dfy0m7/QzgXCIBYUw/YpS504RYLWB242pkJXPZ9+AOkuRlobzLxrDlc/F?=
 =?us-ascii?Q?st2dG8KJUIloE0qCT5NqvcbIqRy5FJ63VJS7ul0jbye4DK+b/1+c9Dg/+PUk?=
 =?us-ascii?Q?o8V1+9HnDiefz5lczi4sOKWioJFySxbuoFkngNyVSYVk3SFgkhIZhPRhkTzs?=
 =?us-ascii?Q?Xv0ueKVYkIXYjfHoU+zlDwNqASSKui9r7qsB/nU6CgidGZxIigLhgQRKA1ea?=
 =?us-ascii?Q?fOifZbyf/CCpJCPivv0yHiBtDi+4oHhED3yZ7oUth8RTqFJ5tklDZ89EnIQk?=
 =?us-ascii?Q?mIXWREbuY9axz+ud+7JlzYPO4Mk3KOONriNnHw/XnHK4NqGa+Zsx/+KBqumM?=
 =?us-ascii?Q?vYevjSz9GilgWBzuVe8VXAvYgJb3bgGAzdSJ5vY+htYOZ21jYjzSTUgeHlq0?=
 =?us-ascii?Q?/Dfqr9IZ42b6ZRBM3TzO832zqudF8yJE3Xb0r0AFAIHYkzLG4T6Xe5AOi1Gj?=
 =?us-ascii?Q?t8L+/o0tA5+Cj7NM+yXZIYXIX8czbd9wNR0klwARuN3WxPS0F/Zp42k6MmxS?=
 =?us-ascii?Q?LyKRrI2FTWjTTyBF5f1Kpi44rCdrGgvgJiYuOUFIsrEDx+54F+poXuZdPBnP?=
 =?us-ascii?Q?rsPqCMVPnqcy6vXgJkOIt4JssgIItezXc0a/9/G7NhkA2nzSHJQYoN1ossC+?=
 =?us-ascii?Q?uaa8nZ+eexoU8vEL9KJNlQb7d2IsfNL8HGFsWCmseyjlW9kc/Q6TKJ8klSq3?=
 =?us-ascii?Q?1LTjjtJfxqBoVhoIdYtrDxeoooBxLepQaIFYU0jk0Ucf07dUPcB2nUYhhxer?=
 =?us-ascii?Q?IMLDxtY63+ZXJIA1v1xLcgxun2Gol3xvoxOJw/Z7/CE5oW9O23btueBEZWE2?=
 =?us-ascii?Q?4ymgHArzzgDYZimeCJl4JLln5eaT1i2QHRDH2VLyeEAk4y3FJ6m0fviMYvde?=
 =?us-ascii?Q?JVgkxQoouZ2cD5/tLC/jCRuQFbfb89YFFi94krtEsoIln0F9aW5DSgqKI54Y?=
 =?us-ascii?Q?t03qDyod/of7tEExG/LGjCQcx8rLxHXaOGNiqu1O2rzX+f+ZEPGIkhrpurxQ?=
 =?us-ascii?Q?S25JiBnk+b+0XmUHtvyS73aOMK5qygReZJKIPC/AE4vVzT4uIGgFmRuZ7wb0?=
 =?us-ascii?Q?e26RdRn23X3TB+VTz33xcC1hekKOfTkOSVUXxgtjXTP3IXpN2GLqjHtvWBwQ?=
 =?us-ascii?Q?rSzy3xWvTorGn+/4+1BipJi956oUT/zhmIUDar7xapAIGzbZkCKeL31wwQCR?=
 =?us-ascii?Q?+G3GAk1hi1Y8g3wuqkwdhcSNE+RB/M71LmYJWvaBOtS43oWtKAisCKwtjA2E?=
 =?us-ascii?Q?fdCS69BsVWpmIBV+jmvpHmzIv9iC2VD97OAMemu6uExHDWhlPU7hCKoGDeCr?=
 =?us-ascii?Q?ZCIvFkLRP3kVCp6AmzEnzQ7V1xNF3Q5ODKwIelVPLZ9ypTcY25xMrAygQ1Xf?=
 =?us-ascii?Q?cEeXvj5+QGxHeeA9/uqy18fVYdcQqT6ZAyOvQ3wllJeOev5L9gJMKvwdNeAo?=
 =?us-ascii?Q?J/yy3ABlBgt4k+FabEwOEfXoYVK6hTbYSkRH?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1693.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ld+9jBJhrubKbEgn+cs56Jhwb7mZ1JIS6jOypOxI7hH6fkkStInu45f53sxQ?=
 =?us-ascii?Q?IglMWgjE5fgBEXXX0DBwaaIzeht4IbJ1UYZRLZlwoL2GiQmT5xXx7HxvN4ao?=
 =?us-ascii?Q?YwKCAjkuA2QZ3zF1UfvYx+KtV9PTRb9GyEF+UKJ75tfP2zfby8BKD7PtabnK?=
 =?us-ascii?Q?es3gb6Kr6/0/L3x8kONJX3KrNYi70sUElquKCSpgi3BMHiVAK467RHsyOP3U?=
 =?us-ascii?Q?8LdDdZP4hLJrgAdBKBCzw8HsjgfX5oeIfQ1V7PMTot4oXSZ+1nydeyeT9IhL?=
 =?us-ascii?Q?2JA88AKVB7c49uSreUh1QjcUEoNWwhv2c0iwaNkKWioHwDQfzz83VY/UVmYW?=
 =?us-ascii?Q?bIXFXKSsArBD6TYpxQI4i6UyQVudEzh/nvvKlL79lxNUFH8p+WHWrQnhYAPG?=
 =?us-ascii?Q?aIxNlsGwmOSh7T6xRERIB3AITAVMaqLNF2mPJQk/th93GW/oDKGiv1FIdghb?=
 =?us-ascii?Q?LBcuU+CvlqPCxnIsU7EQMvuYd+UifSqk72DLmTWdUCGqAd7aETavTPWZUpTh?=
 =?us-ascii?Q?F2apFduXQzk7BAOs/0GA/BYp9aJrYJUgCmwajQy1IL21uUe5NcpfM5cZon9J?=
 =?us-ascii?Q?v0V6/tHSOFu1vVas8msYs2y29y5PUDIDvV3XMFgxCvM0PCx1QnAJpL4aJw6g?=
 =?us-ascii?Q?HfkJ3H8qKyzaVCyxXughAoMKfuiRyxP3qlYSzwYDRjka7kRGIEh9p7QH/cIw?=
 =?us-ascii?Q?2RVRx5ufRPZLhR8tLQ8koE6z6K0bSATnseTZiVZPYleJLYnx3oK19hCyZ9rW?=
 =?us-ascii?Q?9VKz9LNPzGdfvpO9V1Yr+U32cXGHLFFKOOgELgrkgrgMy5ubyNgH+Y6Fk97P?=
 =?us-ascii?Q?0b7h1kLiIjunrKN38ZQgvPl1geJvwhXtAMvqmrgKVXuTeXm7CV4oQCp5Tphj?=
 =?us-ascii?Q?VDSOn9rrDA/xMLmd6EFuUBW2V5cRTEdXRSnGK14XHglYc/pbH19WyieIhKSG?=
 =?us-ascii?Q?vdJXL1KRLUEQ/SDb2po8VdX+whuSnRObwd15UYS5AersYvTaMgQuAfmgaP7a?=
 =?us-ascii?Q?4ukz0tsv2+ibQuiDN4QEqbgbn4LPXUIjRZtDtlHHcD9gLMemBiQkqpY6eahr?=
 =?us-ascii?Q?UR7fj0D/Yv+5mL6VdhX5YXgli1wI7DbFindexW7DnNtRtL0Secz0wkMCYHU8?=
 =?us-ascii?Q?NhEMCGS5YYwMXLl99kBXZTRT4WrCtwF5xgafMNWAnw/h3LQSIDimjVTGQPFS?=
 =?us-ascii?Q?B8ukLSP97+2zUuPZSSM3epCMbZBsT0NfVV9fxejydxiIen2aud63PCneK8eS?=
 =?us-ascii?Q?dAwsWPhtBXGu2Ohj0wCRROOSu7kKZnre+2PvvB1tsZH9rCvCOi9Kp0rtjn2v?=
 =?us-ascii?Q?b0P1vpMLSBrN0unR8M+d4pc7Nl+7a8Bhq2PxgiMObaWl7TSmmdn2pWtfe4gf?=
 =?us-ascii?Q?gTAK3Ojxiw1mcF9jimdnoqxS8aOUGXIG83k4EfFdEzbbfNbZld/LYCPuMrv7?=
 =?us-ascii?Q?8wxXZAO+2N48U02Z5yRj/ab19UNdt9874Q7k11ES8Ytf4+S8Og+enpKi6FJE?=
 =?us-ascii?Q?kCz3lZYJAIpeEl1/W/vjclFf2ipHs5qaXh6Z7Vx/pLEoY2VlKLgm05ZQtrXQ?=
 =?us-ascii?Q?HxYCVkbsyzCq4W1i3mEl4MpPOuHEr7OEk2NPRkxH?=
X-OriginatorOrg: bmwtechworks.in
X-MS-Exchange-CrossTenant-Network-Message-Id: 9efa08ac-c7a2-460f-d3a4-08de22769602
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1693.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 05:36:25.3430
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 970fa6fd-1031-4cc6-8c56-488f3c61cd05
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X7xiPxZNR02DBXf0TdiHAKTMD6vJ1gp9kFtxQVTE9Rj0Ib/eVnz0ZMnrz3fV0TAgQtKxDA20yvWDZlxMsVXWsw7rVXVwIGyRz6nNm/c/byM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB1600
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 05:36:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121597

Remove the runpath embedded in libprotobuf.so.31.1.0 by setting
CMAKE_SKIP_INSTALL_RPATH=3DON
CMAKE_SKIP_BUILD_RPATH=3DON

The embedded runpath can easily enable an attacker
to get malicious code executed if there is some issue
with the file permissions at the specified location.

Signed-off-by: Nikhil R <nikhil.r@bmwtechworks.in>
Signed-off-by: Sana Kazi <Sana.Kazi@bmwtechworks.in>
---
 meta-oe/recipes-devtools/protobuf/protobuf_6.31.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_6.31.1.bb b/meta-oe=
/recipes-devtools/protobuf/protobuf_6.31.1.bb
index 90be1179aa..7479574d93 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf_6.31.1.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf_6.31.1.bb
@@ -42,6 +42,8 @@ EXTRA_OECMAKE +=3D "\
     -Dprotobuf_BUILD_EXAMPLES=3DOFF \
     -Dprotobuf_ABSL_PROVIDER=3D"package" \
     -Dprotobuf_JSONCPP_PROVIDER=3D"package" \
+    -DCMAKE_SKIP_INSTALL_RPATH=3DON  \
+    -DCMAKE_SKIP_BUILD_RPATH=3DON \
 "
=20
 TEST_SRC_DIR =3D "examples"
--=20
2.34.1


