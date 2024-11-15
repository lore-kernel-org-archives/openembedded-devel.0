Return-Path: <benjamin.bouvier@ekinops.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA346D6DDE0
	for <webhook@archiver.kernel.org>; Fri, 15 Nov 2024 07:22:40 +0000 (UTC)
Received: from PAUP264CU001.outbound.protection.outlook.com (PAUP264CU001.outbound.protection.outlook.com [40.107.160.133])
 by mx.groups.io with SMTP id smtpd.web10.15164.1731655346448737526
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Nov 2024 23:22:26 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ekinops.com header.s=selector2 header.b=CuC/V/L4;
 spf=pass (domain: ekinops.com, ip: 40.107.160.133, mailfrom: benjamin.bouvier@ekinops.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IzayRBob86y4cjCj91ANXMLCBhNJZeMdjL7G63VVn6WJzNzTlIYv5Zw9s2Y6S4hyOaLzeF2W1lKtyl3Hn2MV4cR/KPFpEUUET/kqBjgylNDmUrtrvV5DQQGiCm9eFh7rwskzRgvXrmJ31lVCTBJMl/IfqWJlkUfHTIZA5YKtTJVFtn9ju+4obWQszoOqkRX9/IIO5oHfjV7/Vc9JoX2WpKPI2NSDznSHsOpiDWleqkv4jbhDO+10ZtBLvNxMdZOGBW1iOJme8nhAkxIFmc96sSqgdcrbqdJrF8kjco0HxL7xB0CSmAQ/4kzEC3jYXISzPch+Hq4yoWPN5ZRFFzgjUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZZNiNByKg2kl0DUZFSUHMl7VJwN5+vXx/Wio6IKE4sc=;
 b=GmTfPghfdaiMVoFBTLSmTybwwJruXC9cjzDt5H8Qn0OF+4PoUCMzvkdJJmNnYyqYga1f5olec/ojGgAr7s7XHLMXB23F4F6i6ACVBkNxPfU/1d31WvqLEQo0to+C8gRmCjEG0MdxTfy2cc7aR02IFZ0m1026iJYWilzUl+9sgT56vwYF/X250VMxPbLzQaxsFJZGBd22yLaUOv1JhBhk0ipqf0p4fAzIZ8OLVeazRgc3TB/UGSfmoGvQK4wqZsc8q4tGA+1TYs91YFpFkNTCRm+bxYiqEB2F6eIT9wEjVTeOqEgUSfDGPJSvsAuoR9vGUl2pGQs7BD1WhkXaRw/4yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ekinops.com; dmarc=pass action=none header.from=ekinops.com;
 dkim=pass header.d=ekinops.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ekinops.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZZNiNByKg2kl0DUZFSUHMl7VJwN5+vXx/Wio6IKE4sc=;
 b=CuC/V/L4uPAdiZJwd2DhOcIPKwtpY08kZdYjOSKB1pFM0ZmEG5c6HDNlbp2fT1MTh0vpeuRf+we/NXOX63FsPjuwIiFdaVKTerNBeajqZSibOf0VUs+yrQaELefXX6dSLW/oWfWS/8kjRE8S2I0fTylXNmQ2G36InM8apC3eERc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ekinops.com;
Received: from PAYP264MB4350.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:11c::11)
 by PR0P264MB3340.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:144::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.19; Fri, 15 Nov
 2024 07:22:22 +0000
Received: from PAYP264MB4350.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cea:c378:fb53:82cc]) by PAYP264MB4350.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cea:c378:fb53:82cc%5]) with mapi id 15.20.8158.017; Fri, 15 Nov 2024
 07:22:22 +0000
From: Benjamin Bouvier <benjamin.bouvier@ekinops.com>
To: openembedded-devel@lists.openembedded.org
CC: Benjamin Bouvier <benjamin.bouvier@ekinops.com>
Subject: [meta-oe][PATCH 0/4] Add exact CPE name including vendor to several components.
Date: Fri, 15 Nov 2024 08:21:46 +0100
Message-ID: <20241115072150.102677-1-benjamin.bouvier@ekinops.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: PA7P264CA0420.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:39b::28) To PAYP264MB4350.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:11c::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAYP264MB4350:EE_|PR0P264MB3340:EE_
X-MS-Office365-Filtering-Correlation-Id: f5c6b2c8-fc43-4fdb-9e69-08dd05463f73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?zDM1203E2kqAikanQoVsiRdpCgbBWYVM4cVWUF519MOBf6GU0BMN4gPGayf2?=
 =?us-ascii?Q?9B2YdcoB3H8QRZ4cB4r6m3kCW08h5IJvGSdhCwBSjmtzbe8ep3V45n1AIbs8?=
 =?us-ascii?Q?BfJXoYObtsv8TJKLv5tRB8ihXGNXu6t1i3tobhdRFeTfzXk3z9AUkcUuJbgU?=
 =?us-ascii?Q?xx3YbQP4YQqJ5N0q1XiXWiOT/wb1iWC+MobYROKmRZixwQmsAqmo9HIe2ZAM?=
 =?us-ascii?Q?3K6avScKfnZ2e1frIZ7JmKJDhhtyWpzYCfo+/uySCihJ+74TAFV+jCQVL2br?=
 =?us-ascii?Q?uX4GFQb714iIm1eH80/wYPfg+LcUYWkHuz8C/zYQLVpAwmI8GbJjF3uJY46a?=
 =?us-ascii?Q?Boz2QnxNjSdfRkSTZi0842eF0b8YXzzIQaP12Dmlambxm+UhhrPsf/QzvP55?=
 =?us-ascii?Q?rMn1nwHCez3ah1TXoZsMW7Q/mTqTFqOjXKvkK7zrJMvv0ONQLUjZWMgBYV0m?=
 =?us-ascii?Q?lkBG/nt7J26yeXbqdLa4BZOloZPnzEAndcx76nWWlNAkslUr0jg2GgBUWLQE?=
 =?us-ascii?Q?wDxFEee+KcsmCgNy1+sj1OKDAJQsVlwe2hSEihJq7Rva+855JSvtNVHMLntk?=
 =?us-ascii?Q?nqCL9nn2wwJEIRSmI4B3kxJtIXw0dRWK2dheVdUhe+AbivPZHDyVUc9B7kE4?=
 =?us-ascii?Q?hxpCib199UefM68T85uwphji6hEoWc1vLjL8JJWGKCN94PXkGzGXzFt9cWXT?=
 =?us-ascii?Q?KBL47BA2htsr7558mRG+3kbOtKGCcGBVhuyppexCk8sRx3TrA0a82Qgbe+J7?=
 =?us-ascii?Q?xX0p6IyKPDhv31+m+cDeAvdA5Og3dE93gEaqFlXqZt7Gqa1MC51ab8QQ4jiY?=
 =?us-ascii?Q?B64A0KY0xOr99PdFGCWgRdf/i8mdH9W29Eih3rcRLbi+gaZFiyHPb6oSy3wC?=
 =?us-ascii?Q?voHcr/TXon4z24QfJyoSXrVJXEGEopJplMqzx7j8PWfjAvC9AFvGfDvZel/R?=
 =?us-ascii?Q?mdpTOOlq2z3nN/a5jPlv5N40xLYxSoqCLEwAeiEx5c1lxphL+ZBSR5+H8LPz?=
 =?us-ascii?Q?0XAiPBKT1aT/8LTT+7jtTYY9JSGGAOGJ5ks5XY4EZN2RUsfjuTnA2F/dmscz?=
 =?us-ascii?Q?2KTF7nBMxFkbVibHYtkEPnz64YIvHnYOLbJrhAlVfSF2XCEc5daN6jAFbLu8?=
 =?us-ascii?Q?gTRuRcxkMKzfD6aAx+GsyPOnbNd+QTCeprvmY6Vb+nV3lfiSTwrlnS+GxnnH?=
 =?us-ascii?Q?O+NkQBdPZUbuKWQYSTySk7q9Pq2DzhePYuCYGO51n+M0AhyihE6ZATff71qX?=
 =?us-ascii?Q?ClFwGqVbVVTX3O5mXgi9xGpB9NvmxbSC8X45SsCZgHUbaXOejwkNXgRgKUOs?=
 =?us-ascii?Q?JYmXpinBOnc829+NR//j2xmGR6Sl9swdvWuNS7q/AZLfp5oK4k/93DyReEJ3?=
 =?us-ascii?Q?g3cGB5c=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAYP264MB4350.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?0msR4PHq3MB/uFJHBT43t6LsEmVKAzWH5ASXxRRjU31+VP6BT7vJv+XnCUwN?=
 =?us-ascii?Q?hXcPBbC+HqpdfcS3YeCm5Rl0NGjIwUougn9dnwoPGsPSse+O0W8i6JWJ/hSE?=
 =?us-ascii?Q?69mbNSJFLtTgIE/3DO6aiWz01JTCtmXQI5Pl5c61ryScLBthaEVBnvthRGJa?=
 =?us-ascii?Q?PoZrHf/RLCa1yTrNRcuA4vEJzA37AqjIqUtoiH/TFkxLEnTsjROHvhEwUX/+?=
 =?us-ascii?Q?svoxm1q2nORXa/9Tfe6rtkf/1MDoGSz/KwY2rHBAm1wx9m6VmaU0YbIC4RlW?=
 =?us-ascii?Q?rhYwgq2xt6DaXaAKDhc3WsOWbJMoLj9I5bJRdSDFnvmetmeOzM2UxwBUVgrS?=
 =?us-ascii?Q?X+cC41c3fbG+lxN4aWdGdpq0ZVQRHUI/7jGNGUT5hSvnvivuh61MFuF6+6Dm?=
 =?us-ascii?Q?YW7+Y/c5mL1Ee6gpjsgDeE0J9sqx/FoCG5ogJpL+g/kPtE/HSLNnRJy7n1Nj?=
 =?us-ascii?Q?gBJFkI9TMJJY7P0EAEZwiNJn90Z9qH9t8roeSXRzHrAbn4KBy4jL2O5U5lUV?=
 =?us-ascii?Q?7PdZkstjLKt9Fdn43d0Rp4fvVAqhrGxqInSEK4Wrj14UaKH7hZ1riCfbdN2a?=
 =?us-ascii?Q?cQ2/8b84BbH6Rfz4qTf3ZAEmppJyMeJ5ys2p5RJ0FmZ0yWV1Jo5dXSzZ+v4X?=
 =?us-ascii?Q?bxLkTTMiFESFoZvb/5ukFdbTF1p7Xhbxx4h+n5X7Pccg1cFe7z6j9VvPID7e?=
 =?us-ascii?Q?bt8W3KRpKTC3uH7D9z/nT/aK4xLe1zXKKXTepnjWQSZavCZ+QQQM2i7AqtSy?=
 =?us-ascii?Q?V8zx8ZVU9LoyVEHcVSJAB9qkRhtfWKMm5vjm+b1fx1J6r0U/IOnmrY0ubQm7?=
 =?us-ascii?Q?nM3kCs+qU+cou3MS3/FfZzRJsHT6bL6mRIrSZiOBn38cSQe8EO2sO4PjN/tJ?=
 =?us-ascii?Q?ud+T4ZUw9llADtZUs5rsH081ldUJ3ISbwgbcw/5UmOVte2+UGVm3BC5f9IL2?=
 =?us-ascii?Q?fqflQhrBXCWOpPpUjmrUUQsC9pRLzCKfEFHMFLKoxCsEa1unKYUkCtLnGdg0?=
 =?us-ascii?Q?F14Hn+S5PgGRWe3U3torhShxKvBIKMbBdVgy2+9MheFX3O5G/YyOe56BWCo3?=
 =?us-ascii?Q?yszMbzx7xIkNSiwq2chYGnSFfYPYHz0KKJq26VPj5qrv5in1Xj6Ng56lEinK?=
 =?us-ascii?Q?wEHGbop7OUPRzEx5d6LNsz0EgeYvONi03bsphps4qqBW3/yxTDxuj8wCUGYH?=
 =?us-ascii?Q?mS3CGjlLZKIKgATd2eZn82vGLlHpdDTX6UihdRwEE4jVV6F4i0xbIeQtNLPT?=
 =?us-ascii?Q?CpVEymeApfO8cDogb7l4+c0Rw+DUGxhMam/RUJVvJJMcSmSuqJ74vNvWGYmr?=
 =?us-ascii?Q?BiE5XsDL8VAuBELSJrU2XVD5aLeX90wkw9VF2TaBwEaX62jSTHdArdDi28b3?=
 =?us-ascii?Q?f2eQKR5WGfdAt4oknXrIsETgzayYdssWks+ZIBtvWl+b2SrfexmOaWmIwk3W?=
 =?us-ascii?Q?niVH4Om3niEZF3tn66bswQUFEUpX1y0/ETrfIxKDGvodZUeD6IF5DwsDSeYX?=
 =?us-ascii?Q?UBZD3DhQgYb0TxMU6d37lSkIoQx3xvQod6TZyM0WUN9pam6FBU4zz1hOmCNT?=
 =?us-ascii?Q?4+mPkO9DuiGrf542y/EXK00Nqfyom7gFJdGKoirOR0xbL2yVDrOt9JabasKa?=
 =?us-ascii?Q?6Q=3D=3D?=
X-OriginatorOrg: ekinops.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5c6b2c8-fc43-4fdb-9e69-08dd05463f73
X-MS-Exchange-CrossTenant-AuthSource: PAYP264MB4350.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2024 07:22:22.8125
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f57b78a6-c654-4771-a72f-837275f46179
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yhHB/4srGs53I3567QfdSQTYmPGRYlZmOtp1gwRVfsvIJn7CrOYCEly60hPuM7NEfR+qXBZVznB7UCrQv2Tll+haZ6KCkeybAb2aVzXG6Gs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB3340
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Nov 2024 07:22:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113846


Benjamin Bouvier (4):
  libfastjson: add CVE_PRODUCT
  rsyslog: add CVE_PRODUCT
  librelp: add CVE_PRODUCT
  libestr: add CVE_PRODUCT

 meta-oe/recipes-extended/rsyslog/libfastjson_1.2304.0.bb | 2 ++
 meta-oe/recipes-extended/rsyslog/librelp_1.11.0.bb       | 2 ++
 meta-oe/recipes-extended/rsyslog/rsyslog_8.2408.0.bb     | 2 ++
 meta-oe/recipes-support/libestr/libestr_0.1.11.bb        | 2 ++
 4 files changed, 8 insertions(+)

--=20
2.34.1


