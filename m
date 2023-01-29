Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 521F8C61D97
	for <webhook@archiver.kernel.org>; Sun, 29 Jan 2023 09:48:20 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.62])
 by mx.groups.io with SMTP id smtpd.web10.13375.1674985694218392172
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 29 Jan 2023 01:48:14 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=hLpekfHJ;
 spf=pass (domain: vaisala.com, ip: 40.107.6.62, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=emY7d+KoCv9X+88ajnEHumQ47/8TrK19CcrN7PfFpu92dmADM/pbwYtAPeQHyQt1kJWoqxbJknqk2bI/9vbLYaBhLGRphKhXjbI4xhzF/LyNPRnFNxUIgX7jGhLBceLMktiijjvPtvlth0PG7yd7ePMNDI25ZbpUeG1Wgd0NVVDFxQgxReIcHCYKRDX8jEq684V2M6/YG11rmt23SuDwVMqjIYVxruwJxRC4w45ShWTq7gtMJIuCE4MuHafkHYKrZCpTqtacIfFzmRRqQ7eTdOTJtjgnWLtc50HMcFsStEa79/Q67QDhnzLWgeKc2D42EIUih3/6hyGy9dnRdc9w5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wklZNSoE6YEZCgmriNwUmxcRD8tZetvg77vPNR3W8Mc=;
 b=n59g1lkNt4yPj6YgOmClyZhTqdaEVo7gVUAZk5kmh6VNCAfYjjXO73PfD9TydE3KTyrd2TKdVQuWIy0lOT36yl1MZ/0ZW5WC7CVrK1Fi2hWoziYvAIze8Uh1G6MwycbRWVTgUQrAcJYx9mH/I3DpK0/uh0GEoXNpjvFVd6akTgjRExTGhBNqbPKVHah8VolPIQqi304H+qH/0d5gCNXLPR2jQK2a6euLLROZ45CuEQt0drsJITC8cogi6/vX2V3zsJCZH/tiD8s+G7k4Amkz4xOgtVgiIAUGhDHV2tD+vYSkjJwYaaXUOljn2pAeDrECa46yQ1heQ3DoxnoDFrYVHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wklZNSoE6YEZCgmriNwUmxcRD8tZetvg77vPNR3W8Mc=;
 b=hLpekfHJKFukVRb/S5ycTpkSUeyFlQrUma6tLWeiq6UHhTE4AFrELKFdB94T43qb5Bx9GFBk/SFGZj6rIw+0ft1ZRt4Ui9xwNT9/vhN+WZ7p6r7foogdTxk8MVk5G++smobJ5ezT9i5P8eJ7JG0tbhJsH3RFBUBVmYy80GSm5VueVDSQICfUVtuTc8rn/oRgBeu9YA2IuIyvRPQ4nzsZv/9Ee352O8cFuu7AcJEBOQxjERQpOxBIpdSoeXwApT/dpIlepzo0Ct+AZiFcLWXZrqfbvALxgwfliP6e8f3QOOuZb8PB3ZHJF7wxDI8aqAJEyjYqDv9HT3CjUik3NxsYjA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from PAXPR06MB8579.eurprd06.prod.outlook.com (2603:10a6:102:2b3::22)
 by VE1PR06MB6848.eurprd06.prod.outlook.com (2603:10a6:800:1b1::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.33; Sun, 29 Jan
 2023 09:48:11 +0000
Received: from PAXPR06MB8579.eurprd06.prod.outlook.com
 ([fe80::ce6:3fa7:e565:c049]) by PAXPR06MB8579.eurprd06.prod.outlook.com
 ([fe80::ce6:3fa7:e565:c049%4]) with mapi id 15.20.6043.028; Sun, 29 Jan 2023
 09:48:11 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][kirkstone][PATCH] nftables: Fix missing leading whitespace with ':append'
Date: Sun, 29 Jan 2023 09:47:47 +0000
Message-ID: <20230129094747.168437-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.35.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0066.SWEP280.PROD.OUTLOOK.COM (2603:10a6:150:a::9)
 To PAXPR06MB8579.eurprd06.prod.outlook.com (2603:10a6:102:2b3::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR06MB8579:EE_|VE1PR06MB6848:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f8fd556-8c19-46e1-41e9-08db01ddef0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	cO2lflmkNwyw0+mEYY/PpMowMi8e11eCW6wMqsz1zvTG1D7GFJzNxrRXRP9tweQr+48kq4Hised3nhKF3LkZUjrPs16GHWa2EUEuKBWUITO6tfVZApWI8IEDysMd/+572FORmNGYlPivzOuui3sCnkUUs683Fk8hNQ22D2syaeNts6SLAC7PGDgw4/pGI2TXJz/QlKgRpsC9I1gI5+7t4hXRvJJ5cBDM/M5I5GhijlySo/jyClpPUcrpBJY10nc2QiRBYgRammp933YcbS18w79UitGe240XsGeEaleL01jMPf8V7cQRKi5A43DwUGSZ2lJJ8wcKwmBBoaViEtzvuksx++48GRb0LgXWKwswxrFNFig/bMuYECf82A9OG9WtTCFZZnEWYPNH7wgEwPrLc6VKBboSSrIlJbqdz4WK1YPbHoLu1LwDfmGfzmM4++uf+q6RgXB7H79u0ZPfhdmx4pEbXrQMRI4Ytaw1mGrnLFObC1SY5ruXVsa8XSvOSozyasqBv9BFn42QnqpMd5fIGfpECep816FvvBSt5u5bLgU3H5TaIhoRzesAhP9IkI9m0pp5GSapNZSeY64UdevB7YlJsjorpFWSLXUdhM0eTnIzZYHDREBR9fmk+9/zQX6RL5snz+E1SVABB6KhYLyAIVbQ0OTpcBY1mrE/x9r0FKAl77pgsELiDoK3qqlAuaugCahJ+RdvyPuHV+o7YGEa7Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR06MB8579.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(396003)(346002)(136003)(39840400004)(376002)(451199018)(66946007)(66476007)(6916009)(66556008)(2616005)(4326008)(38100700002)(38350700002)(36756003)(86362001)(54906003)(316002)(5660300002)(44832011)(2906002)(83380400001)(8936002)(8676002)(41300700001)(6512007)(26005)(478600001)(186003)(6486002)(6506007)(1076003)(6666004)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?KjpaQzgi3QSP7nTvO5iIA/sYdJmqx9e2/zaSpoHxO47NH1a1XydR7e6xRtIE?=
 =?us-ascii?Q?Dq2ZOchx4mqHbPv7YFX3TiQUUKhGX4ikMbGHkMgDNP+pfscVm06kMwx6PP44?=
 =?us-ascii?Q?L+8J4n3TvffN1qDzSRJkuevrGBwpypkq7GRZM015I3UfrE6Aco9NwNw0rDne?=
 =?us-ascii?Q?OoNtnYeQjs9B+TNC+1ifPRdFZzbwF7u+gGtlGwHE/oAd3pHyOLKGWPnUug44?=
 =?us-ascii?Q?geSGlosVxgOOxMtmmFyvnqFz3aZ0Q2tfNGpNRfe9UpJJRdhhWX5Mlg1I7aZT?=
 =?us-ascii?Q?nOeAyBqxHAbJ3O4lUB4ApbrW++JqMw0zBuWu7qm1AVy4j0B+cT72RAFNnYM3?=
 =?us-ascii?Q?XDimMuHCtcsyVLE9/5JyHP3n93Gawx9B9UBP3Z/Xf3GasTJdXmSxSKCT3q93?=
 =?us-ascii?Q?UbnJrQD6AF6Z2c349MILhkQwKeBxpop1IJ8FF3c75Xumbfgj0VqgXXwur/eH?=
 =?us-ascii?Q?f9YAcR8/uiIkxYz171+xBDsx71p35VP2tJEBBzfPzBSwdqg6wHnXLjyY9gKq?=
 =?us-ascii?Q?w8ybSG8fnixXDN8wZpXzLcxz7psulVk01et/9IU/J6e1BXhSJRsio9drdOQu?=
 =?us-ascii?Q?HTfUDOhxMCPrAhONowHtTab4ZNvn1lMlL8KonBO2NcxXQXNFKYlmmSAfSZP9?=
 =?us-ascii?Q?765lj7s/s5UYJzTdIguM2/s7AeNI2KIxlmOuhjHd49ZRBnUMqxbv2nvHthnq?=
 =?us-ascii?Q?C+/YxNdhUhr7she4ez9pVLGlJ4x9espUJWQFEUDTMqDJ/PN+g1f0s+6PI0Vj?=
 =?us-ascii?Q?BekPxoX2C4vbBtxchKP7iBpd0EXE6SWUJq5ZtU5dKD515aAcD6LuNQ95Hw0d?=
 =?us-ascii?Q?/1YAn3kj7POZdcTNJ9u/06eY+QEePuy6PJVKkBUXBcxjSq6rzdSwZuGHSXmS?=
 =?us-ascii?Q?JDq/bRvGmgZshIxnft2k4J61j25IAq880sir1K3yIsdMUAYP0u0t//rx9d9o?=
 =?us-ascii?Q?4+YtjIt9x3P0VEM5cAFqgPqpbAdzgksswIwVORNSG7VuM1UnwD2N3xZUUYGE?=
 =?us-ascii?Q?+PXeB9wUXcfPTFspPgZK65FxRWJjQR4nMUb4gXLeaTUyHnsE/Id7CkcMWD61?=
 =?us-ascii?Q?GlG1c46RfiIevYWl218ZrYMYFkON9encZwyaESXTxo/3ruahiK+fFw1iacNX?=
 =?us-ascii?Q?wa3yGEnvOhowlxNCNBU5CvidU9HvO/ClCOVjQNPFF6hE/kxnienjmXYh3UaM?=
 =?us-ascii?Q?rXDVHJKkUVTitjtzunlAb5OBfx7szIEie6Z33AyQg7QNOeJhgkWL27k0iqWE?=
 =?us-ascii?Q?ojvk4XZXuwSFhLnwgZTQQPH/DUDZ6yZxCLmJt3REd6oIov1EQLDWsXK6RZ4a?=
 =?us-ascii?Q?x6NeT5DektClsjyiFjO8uBO+dveHfdtV/gmUqvPZ0l/xDtUBYg1aobeb0tLo?=
 =?us-ascii?Q?0FiApdJNeoYtr8iLfpTzoB1cpXFoA1lu0jRneP9MUbnrzCIE4hztTak6yDRp?=
 =?us-ascii?Q?FPPftMTtGEUmKAsqSOfh1VLi9NRER8iGKGpfvfhXN+QE4xQJIRHYVEPdPsrr?=
 =?us-ascii?Q?rIdrymCimTnXkWxy1lleYepY5lFqcWWW2vnkTGtRIMcSEmKEDXQSOfIH61Td?=
 =?us-ascii?Q?0BYI/eouZ7bjEhyIybJVJwVl3rAH3rpEc18YiJ0ntdLY23OTAjxMaV7FYHT2?=
 =?us-ascii?Q?gw=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f8fd556-8c19-46e1-41e9-08db01ddef0e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR06MB8579.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2023 09:48:11.5021
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6ITKpOiGUM+rXT+5kv5aAvLO7wr3boPnsW26Gh6E5cJ4rNa1qpJ/E+vhTIyUlz1NuxW6cE98l7M8aZMuQjVwvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR06MB6848
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 29 Jan 2023 09:48:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100830

Mitigate occurence where ':append' operator is used and leading
whitespace character is obviously missing, risking inadvertent
string concatenation.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit d25967208bc8c4b1e2099e34150a67508744e4b9)
Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta-networking/recipes-filter/nftables/nftables_1.0.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-filter/nftables/nftables_1.0.2.bb b/me=
ta-networking/recipes-filter/nftables/nftables_1.0.2.bb
index e078be79a..080a0ed85 100644
--- a/meta-networking/recipes-filter/nftables/nftables_1.0.2.bb
+++ b/meta-networking/recipes-filter/nftables/nftables_1.0.2.bb
@@ -38,7 +38,7 @@ RDEPENDS:${PN}-ptest +=3D " make bash python3-core python=
3-ctypes python3-json pyt
=20
 TESTDIR =3D "tests"
=20
-PRIVATE_LIBS:${PN}-ptest:append =3D "libnftables.so.1"
+PRIVATE_LIBS:${PN}-ptest:append =3D " libnftables.so.1"
=20
 do_install_ptest() {
     cp -rf ${S}/build-aux ${D}${PTEST_PATH}
--=20
2.35.1


