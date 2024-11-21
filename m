Return-Path: <benjamin.bouvier@ekinops.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84FEFD75BD4
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 08:29:41 +0000 (UTC)
Received: from PAUP264CU001.outbound.protection.outlook.com (PAUP264CU001.outbound.protection.outlook.com [40.107.160.128])
 by mx.groups.io with SMTP id smtpd.web11.6472.1732177773316989998
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Nov 2024 00:29:36 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ekinops.com header.s=selector2 header.b=jmrJC+AG;
 spf=pass (domain: ekinops.com, ip: 40.107.160.128, mailfrom: benjamin.bouvier@ekinops.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DE+M1NXWA/ICiX5TmZ1qhOjOSfpINYmA5CEBpYY4beDp/ngJHltz1N/h4IgXSKEC5CRNjPqv+2abaVJFqZCgkkTr/tLkCFfPkAC+jeqMj4cxKaG9i810q/tEMek42wxIVP4QdttSFTb3YT1Wxv3WonBx0udNRUdkeXbYAjaQJS3kStDeHR2oXs9Zh4URoWIo3dWOjEUQ3yYn7zvE+YaUMxFIangIYEhsyLqHKiCei+pKAkTOcZvkpxj3wy+fAfa2OahYdegktFwj8/BhMwpe1utvO3QlMCFKPFxiI0rOpkoWuZsAY0y5DXLbfrhzDkFe3vrv8xi5VIRtRqxA2xuAmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GsDVcuKwDkN6JX+vsHdTaupjaUesaUkk8Ez2cxNQFeg=;
 b=Ovn/EpDAfi0T76qwqNDsqDmknF4KvW/zHn/o8Pzu0TPMpQDDPNwWWp/b3DwT6idJtpT3+ktVg9w3CUFhvkd2jRKdbCAal4vTShO0ue0AChclGbT2sbXTqzO2jRulSbCj28F5j2vtUOfyJhFrE+rzwEtywmO7ItItHmjl22LPBrbQ5MhlEyNFCXJc2YdSqg3UTQROfNBGBAOUNnww1mVGFdT+YEUfVfJ1IEgnGowVXNhXJFRp84xB+XkXXXJ2JNZ7XLdRehgG7FI91Nd/UgoLmQMpRbkepbe1ukLEhrdYiSSJIzMch9PYYwMsUgQaWUYgSBANZj2G8Yu1lB6pTrYcDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ekinops.com; dmarc=pass action=none header.from=ekinops.com;
 dkim=pass header.d=ekinops.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ekinops.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GsDVcuKwDkN6JX+vsHdTaupjaUesaUkk8Ez2cxNQFeg=;
 b=jmrJC+AG64yLnkTuuuoKKoTOk4BdEorXt1nWfL3tkVLJxxpCOPLnZuA3luYT8jQcbiTXLbhEyJh4o883CPShQdxRl1bXUGcmX8BAA7RpMDqIi91dFSvm0/PfdHY3DoOgzKxpVoRI8K62PvDrKGY+d7GyoWi5LIzyS6uhCQwAmS4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ekinops.com;
Received: from PR1P264MB4342.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:255::23)
 by PASP264MB5740.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:49e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.16; Thu, 21 Nov
 2024 08:29:33 +0000
Received: from PR1P264MB4342.FRAP264.PROD.OUTLOOK.COM
 ([fe80::6d29:2327:f523:aa1]) by PR1P264MB4342.FRAP264.PROD.OUTLOOK.COM
 ([fe80::6d29:2327:f523:aa1%3]) with mapi id 15.20.8182.014; Thu, 21 Nov 2024
 08:29:33 +0000
From: Benjamin Bouvier <benjamin.bouvier@ekinops.com>
To: openembedded-devel@lists.openembedded.org
CC: Benjamin Bouvier <benjamin.bouvier@ekinops.com>
Subject: [meta-networking][PATCH 3/3] tcpdump: add CVE_PRODUCT
Date: Thu, 21 Nov 2024 09:29:01 +0100
Message-ID: <20241121082901.2747720-4-benjamin.bouvier@ekinops.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241121082901.2747720-1-benjamin.bouvier@ekinops.com>
References: <20241121082901.2747720-1-benjamin.bouvier@ekinops.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: PA7P264CA0224.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:374::10) To PR1P264MB4342.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:255::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PR1P264MB4342:EE_|PASP264MB5740:EE_
X-MS-Office365-Filtering-Correlation-Id: 922034f0-cc9c-45ee-0f5d-08dd0a069ef4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?EuQ6rmfmiF6TsWHh/NLUsXSqsz/GlPj7mJLTVlqyQ1YxIv2C1YBGdIC0at1a?=
 =?us-ascii?Q?6XcWFKUUzX4vDFle6tHf6u4ZVVi09XTkfr/Qf6qu6nrxVx1MftrFA5MlhsK/?=
 =?us-ascii?Q?TaN3pMFDSB19txFh0v7y2DNaCe3LXq3CvRWnVCst9TNvtG6lNTW0woJpvABm?=
 =?us-ascii?Q?WafLYKhP+8QLIHG0hJUlSAbIdfKmdv5qjC0MMEt0HOAoRoC5q4TfnlugQabQ?=
 =?us-ascii?Q?gj0zMUBoeR1ydR+HajLviXNCkgW+2RsJ13gj9SpMtXZD16Q+zR774WoKFvqy?=
 =?us-ascii?Q?xUw2Sv7A36CAbBi42ajyMUFguqlAtmAIHiyyZXYAcvvTqxirwnlmT8rWeGUf?=
 =?us-ascii?Q?qw3ECJ3JIbneedrgaDeLJ1aOa0ambXdkmy5h4yZ1ia2Z4QPVn5LvsNu9PC9t?=
 =?us-ascii?Q?VZYb0xgIjHrEia7G0DowKKAoo0k6tcvJyfJYqgPR9N8OPTWM1o3Or8H7CFKI?=
 =?us-ascii?Q?yKQuASMeW1SXwyt3pQnb0j2bXU5HqTVHlRikOAXD0dveODTmO1RFZwjIYlBJ?=
 =?us-ascii?Q?Gvif+Pa6uEIXtpWKHLcs17m9p7srfya/g5gVA/I2CpykTaYJQ0QvY3XvhHyV?=
 =?us-ascii?Q?QSy0NUF55r9kUJuBYo1SOw/CgungcxZklnf5Om+AzveIqJMVu/YLpVLFNooS?=
 =?us-ascii?Q?/XrA++stajz6wO9JqABWmHLjntcJOQ8pz1H9zODvYJFccEo4k99Usdo1x4yE?=
 =?us-ascii?Q?Z1zrBds/mhUXs5JznialhTnQwjLXkC/T3plW5eaZtv2bwV6mh3RGjMdYE7NO?=
 =?us-ascii?Q?OaGAnmH+NY8tm2ofLb1F1BU4wGqSz/mI5IvlAuL8zJWkdE4BceN5IMH9yDlt?=
 =?us-ascii?Q?6AQv57iislpN3XJ8p4VMNyH8f0FKK4r+miZ6lEhUcIQDjS+HxTtAT7rq0mef?=
 =?us-ascii?Q?mxNVs9FMrbPRXB+nW+7CB9dO1HMZr/qkaAeOjJr4OgZcVbdwDaG7AngXxrEz?=
 =?us-ascii?Q?o4ngoINQ/VZlJDjNEHD738IMsaDmXidEbxZ/qpE560+yQ+Xp8hSfmx43o8dh?=
 =?us-ascii?Q?IcDGpRzZXJw4lUbe2aePV6Hu8knji1yt9cyfe9fMP1T41aexMxNCKdYSVlDi?=
 =?us-ascii?Q?6NUuWe7F9IPaOg8om0LArQEoa38O1YHH50jt/ucmrZc0poariovbLQ4t8/ZW?=
 =?us-ascii?Q?RSQ/njlxvftnkSDnsJySltgdson7FjS9JBB6drjaVy2h0Lm7OSKIaiLHkndC?=
 =?us-ascii?Q?SkkWeTg9b5O24TStLZNp9F0eOfKQNboAzPgQYs5naR5RIQ5nG1fKku476Jkp?=
 =?us-ascii?Q?UA33zPuAoVmuQBzrEo7lBaGkjbvdm+0XjTuaay/Ll7PXrVYB9Bwuk72aVC97?=
 =?us-ascii?Q?Xd2enebB+fzeyCbDwRO5mb+QUEIayO4r9x15cTh8oY5+AgafpXfwYxCuO/qg?=
 =?us-ascii?Q?Q7+5Jng=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR1P264MB4342.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?4OQw5DXDGTk+GPTlVmVsqz+FbkSaA6THY8kuwTVYrhb6hXrLGux/3PBMHlxx?=
 =?us-ascii?Q?hrZH3u1S/A6XpUgjSoIWzWyjWN5mwps4aw9T2xLgob06MUHIsu73XsRdYvky?=
 =?us-ascii?Q?FDW3BkW1Qn/DY+yx3JDikf7WIzTujXDSQRrPxRDaCCoOy/UTiDP9IU2ey61t?=
 =?us-ascii?Q?fP8I4tC/DOEoGg7dJ5YqTXlnO/hFDC4ugdHGGUAkhslD+ip7uBcugnmAwZID?=
 =?us-ascii?Q?a1h7+A7MMiaQVNVVZZTQf2wa7kGzjPCrcA9Etpz0TS3xUmflKqMNB2MyY3vX?=
 =?us-ascii?Q?Ww/89HmLDKVzF8fodc4lcamW5niPdkYc2xnswSJR7SMWBKMKAjIMQlFPAhPJ?=
 =?us-ascii?Q?hF68BENu2HhN9WpFewDMwj1uVNmBsXWK+TQDIt6WAeYMRQRRrt4nTinSsMC6?=
 =?us-ascii?Q?oJJiwgofqDCe4kdrP7E42+qU1kfYLiTRWJ/mDX7pLO6QRggegPGgXT0LUYft?=
 =?us-ascii?Q?Ngz12PARHLd7X3+CmOFEGHiomAklOPZKrULgplp4vPBvIPS/9J4lReHPNBdC?=
 =?us-ascii?Q?1is9hlJPqU3nhJ0dhGNTxo5xSNN0rkjKokjX5YUfG/0d7uk2CwEOsicucbaL?=
 =?us-ascii?Q?6lT02sRlj4w3XdwIP35yNcLJLiy8ODVbkklSvskCZhOo/ZgWaG3kXHWyjxa4?=
 =?us-ascii?Q?9xRaGIYn5hh9QeTIJGx5E91Io6IFOuk7YlhAhKjFDd1kkljuQ4eM8J+6lS7o?=
 =?us-ascii?Q?ebkiitDgNLuVQxRCKYpATb0lAeQ0PRZnV6ooR3oYQw+E27ZL/7nOe/FMZto9?=
 =?us-ascii?Q?GKw/LBpx0SbteNsGStg6pip80DO5nVZIuCoYwYJqtHAOOEDXswJAsxzCiemA?=
 =?us-ascii?Q?g2fbZC+2KPYTftDW5pt8Gdf6Mr7aXkI80U+YSvc36q6mgmgWVhrKMTEUcTzF?=
 =?us-ascii?Q?55211k0kiiTGnZXxXroSW299546I7C7ytbZ9wk340CMtBhOKxsUpJzIO7NEz?=
 =?us-ascii?Q?PQEumZ8FqA5g1VbaZUYpnyk/azYLJ9AhZxEbkjRLNGkBqzsOB0U43v1kWYGS?=
 =?us-ascii?Q?bDU7QHgy76Jn7j/A5mtf65hm9lhKZ0O1O7PjThx/e6vl5Xgwx+qQZzxNMSVI?=
 =?us-ascii?Q?2OYf112oZOfMcFKBeRbs+in5H+QsVPdCZkqUuwGgjfTGA/jAK0obueiTqLvv?=
 =?us-ascii?Q?i6qHHRL7tWQM14tXDVuHOcT4tsfH8MVTIt95xOga0WXxSGMsJGOrclRfMaCz?=
 =?us-ascii?Q?ON4Mpn094RWSGdeb+jo6qtDyaTdQBRnOFbtnNZjKmms48cMO9o/TbIvjLKH9?=
 =?us-ascii?Q?SokfncILL0H6nrmbREFvDdNP6RwZVURh38pYvOvlZlWvYJmVKf1s/wqQRB9T?=
 =?us-ascii?Q?LdspfAYgyx35h+KwKyHQiUhE6PxddTvSVXKbVJ1lQKkNBKp7qtDHJUQ94i/T?=
 =?us-ascii?Q?lakWdEKD0WKBDMerGJLnxK0cueL8j4q964n51Dd1DHXuRI6KoE0qzbZxqqsW?=
 =?us-ascii?Q?gCYv6dSbDD2Ni8IbtT6yy+spvC0V+/wmMPryh898IXd8aihYFYfd8LhLHIPp?=
 =?us-ascii?Q?oK/7/E10YZqRFnZqJUdw5zx8oHes867bPb+ym1uD+/AIVy6Rlg03yO80d0hz?=
 =?us-ascii?Q?V9j32jlYQDRToiOJdlvHjGCEDfVkUEsQ4xHECFuGUc/aZlUSpMSNfSTnQst1?=
 =?us-ascii?Q?MQ=3D=3D?=
X-OriginatorOrg: ekinops.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 922034f0-cc9c-45ee-0f5d-08dd0a069ef4
X-MS-Exchange-CrossTenant-AuthSource: PR1P264MB4342.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2024 08:29:31.1166
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f57b78a6-c654-4771-a72f-837275f46179
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UE9UNMOC9qPhGYwJgh9nc8xDjcdHeiwcQHuXFZ2TXDg9mwpCdtQHhFC9cBcQFFRlG35aA6j5zHBItGBQUDX0QN1ji0s6vQlqLUtiC/OLVlg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PASP264MB5740
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Nov 2024 08:29:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113960

Add exact CPE name in CVE_PRODUCT.

Signed-off-by: Benjamin Bouvier <benjamin.bouvier@ekinops.com>
---
 meta-networking/recipes-support/tcpdump/tcpdump_4.99.5.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-support/tcpdump/tcpdump_4.99.5.bb b/me=
ta-networking/recipes-support/tcpdump/tcpdump_4.99.5.bb
index 32b869f24..144a12560 100644
--- a/meta-networking/recipes-support/tcpdump/tcpdump_4.99.5.bb
+++ b/meta-networking/recipes-support/tcpdump/tcpdump_4.99.5.bb
@@ -30,6 +30,8 @@ SRC_URI[sha256sum] =3D "d76395ab82d659d526291b013eee20020=
1380930793531515abfc6e77b
=20
 UPSTREAM_CHECK_REGEX =3D "tcpdump-(?P<pver>\d+(\.\d+)+)\.tar"
=20
+CVE_PRODUCT =3D "tcpdump:tcpdump"
+
 inherit autotools-brokensep pkgconfig ptest
=20
 PACKAGECONFIG ?=3D "openssl"
--=20
2.34.1


