Return-Path: <benjamin.bouvier@ekinops.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FFE5D6DDDB
	for <webhook@archiver.kernel.org>; Fri, 15 Nov 2024 07:22:31 +0000 (UTC)
Received: from PAUP264CU001.outbound.protection.outlook.com (PAUP264CU001.outbound.protection.outlook.com [40.107.160.133])
 by mx.groups.io with SMTP id smtpd.web10.15164.1731655346448737526
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Nov 2024 23:22:28 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ekinops.com header.s=selector2 header.b=di/ZipV2;
 spf=pass (domain: ekinops.com, ip: 40.107.160.133, mailfrom: benjamin.bouvier@ekinops.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rJixtC0aCTKzF7NtdxAYTA8jviwxGGzscQng6SP7Y5WRDpRM+Q5tAKWSWUrGAJoE7qDL0xnBCqz6RjHDYUlq0K2nfoCEO0UGbg4z4IU/xAX22RFZ0lWTUsIM/1F72MGbzZ84+zUM9Y6J5O7dz4TrqWJErs6HPTqFyy9dD0Raoly/QiHPT6IbhB1qsnlbQLbqsB1UEA9omrxdPbO4KmbmT8eN12QCIql9FL3ATGgZh96pJGY06XBC3cwpHY4Ilqol/9fEUfu0zLvIiCBWx9Jv59Taocq+Fmt3BrFBeHC2KGG6/8Jt/D4Oo5azY+9+xv5tBprmCfcnWwERxN1++tnHTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eceWz6vgEBPIvghYEx3k5Xg677yavpDcLE9Ol2wDfFk=;
 b=XIYv+wg5h1oavaY0rGX0PyAXbrgXci61nR5qmAy1LzTCSj4vlglXaq/xbNPafAp8J/FAggWed6m1+DpyJhRER43/jDno1xILL2LSTDk0z158iIDm4cLfQLiNCn7KDyn7jMEEHS0j53QBaQ1Fw1LA4KBHXOIKjPI4sbYTeaXV+z1gyA76buPdu4JBfa6E9upvvqgmh2yeKLYTrAbMD3Q6e3DE7ppap9JZccrctceQLVno4nXB+NaTowkj2HZEfR3c5SrB5zB1fkebtxt4aOIIoKtOmvJgPL4PentshZb5EGhC+lV6LPfj/zsuZVsTxfO9jYqa4wYcKBipa7mITmL4qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ekinops.com; dmarc=pass action=none header.from=ekinops.com;
 dkim=pass header.d=ekinops.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ekinops.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eceWz6vgEBPIvghYEx3k5Xg677yavpDcLE9Ol2wDfFk=;
 b=di/ZipV2st+WLpWIzKdon38HJzqhIMKT/BEwBDAN6sE915gkNqqGNOKdfXlXIsgOjmPCxjTnnXdKA0VmS7XUYQ1L83ajZUHu+yEiZDaXC8qrQEhPnZx9gX60S/QUTKl3wP+x4sYIo+cvObT3sGkjxYS6AhANjGTKx58qyHf/Cp0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ekinops.com;
Received: from PAYP264MB4350.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:11c::11)
 by PR0P264MB3340.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:144::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.19; Fri, 15 Nov
 2024 07:22:23 +0000
Received: from PAYP264MB4350.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cea:c378:fb53:82cc]) by PAYP264MB4350.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cea:c378:fb53:82cc%5]) with mapi id 15.20.8158.017; Fri, 15 Nov 2024
 07:22:23 +0000
From: Benjamin Bouvier <benjamin.bouvier@ekinops.com>
To: openembedded-devel@lists.openembedded.org
CC: Benjamin Bouvier <benjamin.bouvier@ekinops.com>
Subject: [meta-oe][PATCH 2/4] rsyslog: add CVE_PRODUCT
Date: Fri, 15 Nov 2024 08:21:48 +0100
Message-ID: <20241115072150.102677-3-benjamin.bouvier@ekinops.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241115072150.102677-1-benjamin.bouvier@ekinops.com>
References: <20241115072150.102677-1-benjamin.bouvier@ekinops.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: PA7P264CA0420.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:39b::28) To PAYP264MB4350.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:11c::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAYP264MB4350:EE_|PR0P264MB3340:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c6f222e-2808-4778-043a-08dd05463fd6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?s3O3RLANR5K12KxkrkvEXDOEEa39zfC3qOJxly0Ba34ibD62fSjoNUfvQUF+?=
 =?us-ascii?Q?Mzg8OwO7dUPT0k8ZJqId7ONNUHLyyUKgnwA4d5JYGYhPcgRWVBM/mWp+SWrb?=
 =?us-ascii?Q?VSqkyIRJdFRKHXi00fXLGpmK1N+D9VlISG4FRo5171dwNh3XkAQrt1B1nhDr?=
 =?us-ascii?Q?ergmlu7UyzCDbP2CKy8dZo/JwZUathCPRopj9oALREh9SF8PXFBOPf9q4MO9?=
 =?us-ascii?Q?Rm2Jc4r75fXZYYeuPgVDRlg+aSrm7noZ6gQhdRWciwDhbyhhyEro9XTCyavl?=
 =?us-ascii?Q?ZWO8+2JIBe1Uw4wJZAvA9i/EOwWunB4poFEWBvGRNeWQ8cX6R0isv7cQb/ae?=
 =?us-ascii?Q?mb0+ipRUpWXlnh4Mmn4d1pIt2f8ujiDEJq5RBfMUnFRe4by57gnOChuz5nmr?=
 =?us-ascii?Q?hFsGAWyE7823rbrILqcKWBjtraWfHP1bj3sjuKXdTIE5WSYniO7XPWX+1sfQ?=
 =?us-ascii?Q?6X2h5pDCs5dX2Z31DU/Rrh0PyQx9NCNh9ZO4pcszcg978mOg9cufo1lfMsFG?=
 =?us-ascii?Q?iKgccdHIE+5Soyo8KGg6WbL0BLGZeXVf8VhqAfUMAB9Z9WEtjEVQsT3slnGq?=
 =?us-ascii?Q?zhUmt79k4hOYAXXx2tcWa4Taxf2v11VqPgoblBMg+xQkLSF83ZFCRqB4zWUa?=
 =?us-ascii?Q?nd4NNWsG0+B9ib6dOcvOnv/cwicY2sFPAIN/H+WTHttQyRwFGR/wnzGKu4lk?=
 =?us-ascii?Q?E9DikcEQGhzYYXgkBhb9FmzLmYZGi1CBqF5MV00CJghqf1WCUb77w9PZ0qWy?=
 =?us-ascii?Q?/sWtWH0bOlz7GUHtyOtd870fLH9Za+qczeyPHalVtyzgegji53KwkWPNMTTw?=
 =?us-ascii?Q?49yLlDs3ZKjMDFu8BzauFndI9ZBAMGMF4K86fesnIYhGVCjXZdOiDg8sjX5I?=
 =?us-ascii?Q?MVnGa55I+y6LiTuMnv20CUchqzB64u33yjwD78EpesplJE8vgcFHlZRfuL//?=
 =?us-ascii?Q?7Ku/ZYTgiLZnxOB68/EgZbJ6UVh+t21fH8jKwM4OQqJPOmRjTuXu0qIQmA7m?=
 =?us-ascii?Q?5BkAiQudhYkxpdZRDAMhUyJSbvLd1Ant5+Pskzxy8vMPVkuecl6pTrUqsOUJ?=
 =?us-ascii?Q?NSrs/Mah86CevLEGvIVGar6rvVNc1X+LP9fUYuMJaR/PVg/DDEeg+c+p6361?=
 =?us-ascii?Q?pY4YBNmwvxasQJOPVMgDV5h80frztJ2fBohxHWiftXV41d3ulZhDvgw8szWA?=
 =?us-ascii?Q?EnzznoCyGU98nKoHDmag0Iv7pezIkntxdCp5VW07Y8SsqyjEem4Qaw401ZV4?=
 =?us-ascii?Q?BGXaWJ719T47/TbNvFuZf6XnmUJQ9+QO21Wi7iTn1qDryo/vYvS5YKGvLufi?=
 =?us-ascii?Q?SI9Q3sC6Pch1OLcO5OKAy7i4?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAYP264MB4350.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?CN3vbaIJQa3ybwSBWDrpmQ4MKkaVoZNa8U8sWsq6yk8/AoebWTDpc8rPJoFC?=
 =?us-ascii?Q?d/nvO+QYCz8EswFGXcLMaHZiLOT7qg3EEAd5OW8siq4m5+kskESY3QQW4rdC?=
 =?us-ascii?Q?XSX988lbHxyH++rvyN6RuIlszaMb9Rvt3GYEs7hCASeGOwSV/9F3AdV6vU35?=
 =?us-ascii?Q?kzZec+OiiJ6j0D9RYKTfmWOz7/UbqHh3xGQtT1ZnIppEmoOoF1spxhsX/oPa?=
 =?us-ascii?Q?Gau+zQwSGu38L9NVga2VV1NRds/n1KG913QUnHQD0QIKE4n7XsulHQJzddqn?=
 =?us-ascii?Q?mHpKP4T6T27KYKWuG7skUSWjb4uAC4zyNCMxpOCmHB/08v7Zuv2aiyiVFCxw?=
 =?us-ascii?Q?tZ13V7bZIfh1GgLr9HGXvz0DIAtEfCt55KlPycknTPSwtmTgUs/fi85x0oIu?=
 =?us-ascii?Q?l7oyB4rQk0TzC4BJuHTOWrk64OKErXwoQnnBfY6pYVhvMm/b5oOrxV57ZzR9?=
 =?us-ascii?Q?9vy2FCSSEEuHQoTh38Wl1/AXn18mSXG4q1M1sfz4ofmnZm4jh28w9DlBnOlI?=
 =?us-ascii?Q?4pT/GFaoe/jXkNEmv9RLqMOMwd/s9d6QGDOhh95PIvLTUtivlksVA8AeEw+y?=
 =?us-ascii?Q?gs30HqJsouOmh0u9WAiuCnRMMPRPIUPkgJsjDuN2iaxRSo/egMCMx9OWsNn5?=
 =?us-ascii?Q?1aXGRb1LQxAXNM7VPGPbxnp50Kx8VbdvChdejkKV4PuLJdDXWATyD1Ur/bh2?=
 =?us-ascii?Q?LMhLqOAP/BaYJvXqa8JQHTkAxnNbro4ZxgJm9qpuHeQ5QNz+1Jm+Id6Es1tm?=
 =?us-ascii?Q?mOUZ7Ss36yj24nRenMX1XuC9JF5QuMHdg6B3dC1nwvsbS2gRN+svotYldS9k?=
 =?us-ascii?Q?nXHCIqGTo7qYluDfmF3hFW8EQmvrWsnQQaPrRoOXYBmviqD/rMpAGJgyNCJ2?=
 =?us-ascii?Q?eRzrWgggBRq/XZCp9QZIp8nJbgprFaWxIaaQLTuOT6AnZC2ea4RgFqD1mMvM?=
 =?us-ascii?Q?Ocn6UX3epdw+RkSNJoNQkQM8rnpE01Zs0oLWFE52eeILUvx1DPeAn5HX3C8u?=
 =?us-ascii?Q?VGFvFXpjPkUrNJ1LHAQFXF8gKGXWSJag5Il1YOYrWeuhNGTdhmFqyCrMUAuY?=
 =?us-ascii?Q?8oiraqW0piVHT+O8mOl3jWNzZuHY3CI2E6qzH/BhujyuxdqwVCYutTalBFbQ?=
 =?us-ascii?Q?Tg1tKM681kqrvTO8qmaU9KkF2e+VR9ieLP2ZUivp0B8c5WFwaQyU1gXfYsi2?=
 =?us-ascii?Q?3G9C2MvdN940eukpy2Q3ZSUXVHfi1GG4I1gIV9rutIQTa7v6VVuAe7semXOk?=
 =?us-ascii?Q?Jgm/dZojVme8IvpwDE7jR0W1yHJKehdygheaORxZz8wQ1qcHFod4Jv7uhwN9?=
 =?us-ascii?Q?WQQwfmlSpt39bPm9C7bqh7yrDcm15C0d8t5BTl8oJYfhlDOaelZewuCwCelE?=
 =?us-ascii?Q?bxBGXSy2YcPRNeOvJNS+wiFkHjYzoODc1S3tOazuThs52KwEOHOzEhHWPPbV?=
 =?us-ascii?Q?NFLNieZL6s/WSlyyVc+hocUBsJNAHcMm0Ott4DX8HM9ydnBc1yku9nY9ZukY?=
 =?us-ascii?Q?qqzn4YxnwhCYmocreHfsZQmBPc1fso6c74AaIUligsrVIyeBYksj2glOK4oy?=
 =?us-ascii?Q?P5CJIsLm2hTOrMZhH5YeknW5PnllOzfky/sPSZJFw98fiu2ar8u7c0SszlSz?=
 =?us-ascii?Q?9g=3D=3D?=
X-OriginatorOrg: ekinops.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c6f222e-2808-4778-043a-08dd05463fd6
X-MS-Exchange-CrossTenant-AuthSource: PAYP264MB4350.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2024 07:22:23.4781
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f57b78a6-c654-4771-a72f-837275f46179
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jQ/uU8X8hna3825VlN/8YkLP2CD5kDVayhzvU1u4V4Wnb3gEXEIYZNH4ihNiE80ZXnUjyDEMzRb2DSEocLL0CCEw8uKxuC/UwuUi7mNVlJc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB3340
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Nov 2024 07:22:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113848

Add exact CPE name in CVE_PRODUCT.

Signed-off-by: Benjamin Bouvier <benjamin.bouvier@ekinops.com>
---
 meta-oe/recipes-extended/rsyslog/rsyslog_8.2408.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2408.0.bb b/meta-oe=
/recipes-extended/rsyslog/rsyslog_8.2408.0.bb
index cf833de22..5fc6de68d 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2408.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2408.0.bb
@@ -37,6 +37,8 @@ SRC_URI[sha256sum] =3D "8bb2f15f9bf9bb7e635182e3d3e370bfc=
39d08bf35a367dce9714e186f
 UPSTREAM_CHECK_URI =3D "https://github.com/rsyslog/rsyslog/tags"
 UPSTREAM_CHECK_REGEX =3D "(?P<pver>\d+(\.\d+)+)"
=20
+CVE_PRODUCT =3D "rsyslog:rsyslog"
+
 inherit autotools pkgconfig systemd update-rc.d ptest
=20
 EXTRA_OECONF +=3D "--enable-imfile-tests ${ATOMICS}"
--=20
2.34.1


