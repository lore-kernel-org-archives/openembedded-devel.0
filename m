Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD8F9CF34A9
	for <webhook@archiver.kernel.org>; Thu,  3 Oct 2024 12:43:13 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.105])
 by mx.groups.io with SMTP id smtpd.web11.10398.1727959388976526076
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Oct 2024 05:43:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=kKTbQFqN;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.241.105, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y5mmclwzL3znSpDdznksW0ApICaTTDOZgWAnEiA+qyQQ1DfdB1/676kAlL/g6lGnCmwczTrOgBo5rrgirzJVrl2UC0WoNTsHpuWBLeTJmYeqNEudpwtl2oGek9c3ba3iZ2U4H7FsL+mpNYsffCIN3ovN8ka0KWV6UHRBeSd8r+Lzyf6SwWuuxBt+BGj+sd7FQ3HAE5aaALpfhTR3YdlNAc7W1f8pWaORZ1dpms8jzHkKiU46IgCLUYl9Hxd0S6xc2R++DwdIEv5Yh0zz1C+VpDtejp1m0f6xjwucjrRcPyV6oETjwbHUzHGKMy5oishO/SuVJgHcBS98nAUdvchD9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jniKAUvWvaSM+mg+55nDFF/hsqnLIDULFjn/o9pWnt0=;
 b=xcXZaqsmK7QPqwHZuNkxTwmuT5Bzo9fC6G5xgEl5caJotS0mp5esC60L7hCntdLxBaItUtqXn6DsYFIddihDk+O4utzYKIc59spBHm1zktge0AQelW/m+yYaKDh6ZnTVP800EAYSXRkfStQH3b2t6ZbOB5djNjI0QbeLKghjq38+6+/ofUz+HHoJHenip2YrvgDNsQ/ujjHoLORsICPXankCvsybsrjkb6vuJe2FJ/y/Z4zTjmokJ/8TkujCxZ8JsZ4ZVGY8rao/DwZn7NYCRmcw6wPpuzNXFYwBeZsOPGNzUsuD9AxkstT0x3beuVczpZWlHz35cG5edY6JYZM8og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jniKAUvWvaSM+mg+55nDFF/hsqnLIDULFjn/o9pWnt0=;
 b=kKTbQFqNe9FzLZWmW5Vp7cA7Mj1BrF4aVzjwZJtGEvmHi3f6mvALd04SHGIreiBchr6D+Dp9JkSVaHxe/+897KQ00YKRr5gxA3+AxFg1a+Mv/OhYhnlBO+GsdYPzz86ta7OvQ+5v+NRy/AB1a93uhK8TsG1vGRn/0aEs8n0DlSU2hA3VjX3FbIZzPftFM0BlpI9IAITHo8gXeK1hdUFuJgOylkWydpHwjDCM1t1PZYZNjdZ2KDqeoVdzKL/CQ3MKxYMoNCTOBvJ0Jo085sU9NUTWnS5xcqIWEX08snosdKnYAtz+l2vKrnYLtSVbVjjhSnd6CFy+TXhZQY74yQWrRg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by PA1PR06MB9517.eurprd06.prod.outlook.com (2603:10a6:102:45f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16; Thu, 3 Oct
 2024 12:43:05 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%6]) with mapi id 15.20.8026.014; Thu, 3 Oct 2024
 12:43:05 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: raj.khem@gmail.com,
	Niko Mauno <niko.mauno@vaisala.com>
Subject: [meta-oe][PATCH 1/3] packagegroup-meta-oe: Remove duplicate value
Date: Thu,  3 Oct 2024 12:42:41 +0000
Message-ID: <20241003124243.2411621-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV3PEPF0000366D.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::390) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|PA1PR06MB9517:EE_
X-MS-Office365-Filtering-Correlation-Id: b6b4613e-82d8-454d-530a-08dce3a8ed4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?FV2cMjCc0r+UkwP3M5iQfwRlp5hzwtfxNF759wRQYhKtZWoJiJtBhCBxFPRU?=
 =?us-ascii?Q?nOf2r5H3fJipU494BU3Wmi/jYWUdSvHGg1DlPSAdWG04UYXoV3nJWmuynU4F?=
 =?us-ascii?Q?A+KTAk6t9E5axWA25ro/pwRhabZojJG7WzOqExTHIyD3HqLJ2G7DE1cNsLY8?=
 =?us-ascii?Q?c9sswFvsbqRIZ13r8Xj6ZT4d7b149mZQ3T0Uw2NaWFmb+tToXKHYIs/EPrUd?=
 =?us-ascii?Q?+4XCs1Q851jJOJ7lYQzTUg70UYzqQ6bAPVsEF1ajXigAOpyap8kB/oWtBAuO?=
 =?us-ascii?Q?lcXCG+y7x4FONz5dDc8uzvkgxSiBFeKMwSp9RGyJBj20Q54YOBYHxotR5H73?=
 =?us-ascii?Q?phci7ChVLnYKzY2ATCxcXqqXZJ8h17DbcDk1KM34FIRENV5pv9a2TW6r3T2+?=
 =?us-ascii?Q?S1NFbIDgfvvbXNRc1acLUfo1jEyHaZlGWWoUgnJcf6jZMoOyrK+mk/nkaVKD?=
 =?us-ascii?Q?tiQx8ulMRyhoTdcr7ir5+/5Qd8hGVDv+ybXlrCig+TVR6TMDSul8qmG6D+A0?=
 =?us-ascii?Q?oeRGmHIEucyyrBs98g47GLJvVuY+z5KJNYZ9HQDQ8JnBIMmVm48v+xsL82ya?=
 =?us-ascii?Q?/qwxxZscb8nzwKJIxPwUEbHN7JtOdvqAa6QALmsWX8M7l6F/bjPahF6RjKJ7?=
 =?us-ascii?Q?0BwDFflOZpRmSCLw63awiSoxyTVA/QuvsadGATJ/p3IBfObUcYAoMCc3XGqg?=
 =?us-ascii?Q?cqP7ZAl5SVdvwfxzCqA13Os1vHnuGaUDyeChyiHj/2z3378iiqnr94HYzGFB?=
 =?us-ascii?Q?63/RClWhx8P5VPyoKk+BuxCDFkaVqT7rFZD/fKKy8/LTjwG0OaUqhRZsWRBQ?=
 =?us-ascii?Q?q9ZCk6yjD7cB9aaaQ9qta+a61H2030YBVeY+041CSnGnjunTq5ibtcnHXtEO?=
 =?us-ascii?Q?NAiOE+6gfPsTrhnN6kX4MhBBkRt/B3MESg6DUVzdcwZPXYV4wv2i4s3inxEi?=
 =?us-ascii?Q?+/+55GoAEPKZk6iaGGnP1zFyvUQyK4BQIF6GH54hjaZvCNKfAqky5IjfiKLP?=
 =?us-ascii?Q?UXtWq4j8yfOZJKk8BojWqv78J71bR/E1KPI9CEEACOWN5WrqeEmZ50tm7VVb?=
 =?us-ascii?Q?tl8LX13A/tGsolPfz5C9Al9gaxAthCZWutM/VCCzpjYoiZ7eTILSoX77DnPA?=
 =?us-ascii?Q?9K6UrxLnTGkZAp7mdl/slYnoWCsef6ej/Dp1uRKAz58Ph3gFW8RLiUz8XcIR?=
 =?us-ascii?Q?/dWFl+UTocNxHy3+NE+zDV5IPrfVH1Y4x5JWMx2B7/uKPJGaVmGHuT6+L5Q2?=
 =?us-ascii?Q?0O4/BfJSXkJy2yw5aEdqUhmYYJty8Pe0KVXEbV9s7OVlL7EnOIVgxbyAcp3i?=
 =?us-ascii?Q?Rcp4UyCTUM8dss5uJSL6Qs+nDH6RJKxOGWiVb8KWhsKELw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?cqnZWg6pMYd9HMaTQWvLurNA1RUPoHgVqYi9K/FVuDCxXYTpcZ1P4Zgk8tZ+?=
 =?us-ascii?Q?j6d8xw283tC09d57/+2xqHGa77uXwWqxe5SyHHHUpnYUoLi9NPfTbCHBUaiN?=
 =?us-ascii?Q?3+DNMRUL/XqIisRpuKIPkh2dFQ9mfhcAjAEEQ6VrsX9PZ8nxmlaS5D3Yydmg?=
 =?us-ascii?Q?ayGrKnqRHZT3uSPsSWBSIE5Osn7p+4tb6M1vqucD9KzEl79PaPF+xqy71kye?=
 =?us-ascii?Q?TAiGTqxn/a+rqbUWyqNn5OPFIpKiQZw55Bx6UWhe6MOtn4Vpb4+6rYhijrTh?=
 =?us-ascii?Q?mpumep3gW1+i8dN4ejl664HyskUwbHeNWYw+98G2Bscc1/BNAY/e6syjITBI?=
 =?us-ascii?Q?YG43jKEyImgs8r4/HAN7qAosEjRRulkaGGzwSulKLF79GwoO30mnEVYtKYsW?=
 =?us-ascii?Q?qY+tKJ1vLZ+hGlm1D6ANnwuLukVJEDA+DfduJcEKwX9o4JACy5ge7ZSJIANa?=
 =?us-ascii?Q?My5wLsHYHShBIyt3PxWNXuhufuHf0n3fU7Ds9d4fOekt5Mgiwc+8WnaZEUmf?=
 =?us-ascii?Q?1WKGKQ5U4oPz+ZIo7NvT3XA8WSzweUzsndlYUkkmzaMfdEd6vLwVi+zOUEWe?=
 =?us-ascii?Q?HVBQ+SzjrXMAGWqnxhQLPXtkHv7+rja6ZUhe9xUbmVUhAEtsan+rHVTOK+7/?=
 =?us-ascii?Q?IRYclkbJboLxjvLu9Btm28lsaLV8eBI3saxAIAGG0RMdZb3i5VLUjpo3+oxw?=
 =?us-ascii?Q?sjenmP9BB9We5N4/NtKS5mxB9b4PwpQukLNa88yivL33XdmkKooU6DVIqknj?=
 =?us-ascii?Q?M9tBUL/vhUvhBoTklUkJ30hyzsYkyo9xwKJHroGOVuaCvnncoKSCA48V/nq3?=
 =?us-ascii?Q?RT6A6r4oLMYVRWdwHzD2cSv4slyczjhY2aByIaafiUe1xMTvRIBexUafuHDi?=
 =?us-ascii?Q?o/0HhH+3koUhs3cO3l8F/P20dFcJh058lL2PGTyAMGh5r6RMFjrQMpEaOtrm?=
 =?us-ascii?Q?XuIB54/wbDvQGdHBFsGJZKKOzsbwO3rcyUjrrvcQFpWcXF/TeIWJW5WNc7al?=
 =?us-ascii?Q?S3kzENHq+oLMMcbtJhL/Hsx7QMxjVcQXUtZd0LQGh5IlduQWX/prDm4Y992S?=
 =?us-ascii?Q?/I9LrDELMaUG2B3nC+Owx0+17Sl3W+hTXraPWWT3LpEX9qTccWp8OjVsHBUW?=
 =?us-ascii?Q?sn5c+KcgXT+fyIqPeX2aBcdghGJTok1uSRQm5CzAw+ve9fHz9Ue9p8HOOzh9?=
 =?us-ascii?Q?JFrJmJtlHeSM02GVFguzp2dxv5Z3yKlgTNEaCow2ReTAe6drgBv81lVYj0ar?=
 =?us-ascii?Q?03q35HMFU9tSIb3ndJBoJaEoY3b79Q/E3PkGxDMu+UbiRKYsy1SIFRADA5qV?=
 =?us-ascii?Q?MA6zKG41rbN+nOGreHycre44n4eal9AkdqDTq1ZC4up2ZBOhp/q9slZxn0jK?=
 =?us-ascii?Q?j9si6qJP5y+x2kTqZWbsgAdQQE2D8l+SjEw+axR36N7RNNRB8ssxEK/Oo/TB?=
 =?us-ascii?Q?A4v7fvYJpRyPRabayHwHpVI6RcuEpW5MyolFCV7BXbvmwnX9Xay3p78Dw4gG?=
 =?us-ascii?Q?I+iH0oCOYpR80XLJyoPJgvFbv1PN2nWje1o+Se5B4Fh4NzYaVMIBPYrqqSFe?=
 =?us-ascii?Q?rIjmK1ObrKf8T+vxeqllylq8JGpVQwjMXEpMgDFsf3rhz8QjpF6vxVdotE3e?=
 =?us-ascii?Q?Gw=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6b4613e-82d8-454d-530a-08dce3a8ed4d
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2024 12:43:05.6624
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pSAMUygckvm5xeIzXxxfkAkIyJ+AeNCsibwHk7zhyHNDRk9fyl+w5jouZVg/RHp5jKSss29gQOka+GiBtdT1bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR06MB9517
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Oct 2024 12:43:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112647

Remove the duplicate 'yajl' entry from value of
RDEPENDS:packagegroup-meta-oe-devtools variable.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/m=
eta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index e5cf8ef2a..1ff53757e 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -257,7 +257,6 @@ RDEPENDS:packagegroup-meta-oe-devtools =3D"\
     jsoncpp \
     jsonrpc \
     yajl \
-    yajl \
     kconfig-frontends \
     libgee \
     libsombok3 \
--=20
2.39.2


