Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF70DC02192
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 16:48:11 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.124])
 by mx.groups.io with SMTP id smtpd.web10.92852.1738601283247600422
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Feb 2025 08:48:04 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=JQDAqmnY;
 spf=pass (domain: navimatix.de, ip: 40.107.241.124, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ycQdrpMvjmSOQNamolPd5hX2EPPOceaQfzmAscmRmPyhrNqE1z/t207/VTHNrGfCxN2sGs04YQ7Z1nbuy0WTq14uO6NhEFwiJixef6LrtaEyOgQrR1iGGqP0Uk0Pb0FiVPlD1LeWq2x2uOQfQaSece6kSH8J93rnN3dt6scbNameygfP9R7iB6j2+2BWG9nZLeZJhVadGbUkPKdODFXFQa35CcOhiJrPhjeqXv8fmNNwi3hGxx575sbU/ZkRgTpbw0Zmh0Lrf9pANT8dwiB0CqljhxnJ2mSMECBl/GR4cZYnNqRhI8qhMGd7wI+YXG6frjRbFAQilfaX4rSf3aeF+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0mCJ5euwGaADwZpKLxOMoDiypxlvvTvtXS1suE1NRUI=;
 b=Lo5KCUiAF8O5LAn3f4vhbBjYU3YdVJS2LIieklkU3JUZvMmdxz3VymZcotikM+vxqnlotQBb4X0kXnVpSAkKka4zMmlOgMPDkydKdsLxWUJ8+KuFXCKu+8UXZZp1M6wV2KxIK+ZED75YVaR4gzYyBh5bL7AtZF0wiR5+20Z6WeuLHT+JGp0TnuYa5bDg8waxghAnpx7tMFlaH7NUoiVPLqFz97cEWcTODERQHWj/FQJ7um7PatkeM6zDHEA/C+2HWXrq1aUzyJIwatWkRVMsLotnPmGyiPtYolr0Vj2tAy21LKoFwlN6CZ9r1SmGF1f5VWDl6QaaIvSV06tZTaRvgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0mCJ5euwGaADwZpKLxOMoDiypxlvvTvtXS1suE1NRUI=;
 b=JQDAqmnYh+FWxNLIfwv1OCdJGb3LIL4i1KBmw/im+jgWYOmuTFRn/UAfkVmkAvcoJcn/lknwpPMqAA8a5QDUajWsy7dTiBShBJsxuR38AsP8dHUPMyMPAiXePpUQVbVKOpO4KZ8+3gsF44b1TibcnFe/4wLkY109oaRj4lawgBg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5) by AS8PR01MB8290.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:421::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Mon, 3 Feb
 2025 16:47:59 +0000
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7]) by DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7%4]) with mapi id 15.20.8398.021; Mon, 3 Feb 2025
 16:47:59 +0000
Date: Mon, 3 Feb 2025 17:47:56 +0100
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: thakur.virendra1810@gmail.com
CC: openembedded-devel@lists.openembedded.org, 
	Virendra Thakur <virendrak@kpit.com>
Subject: Re: [oe] [meta-oe][kirkstone][PATCH] libssh: Add ptest
Message-ID: <5bvglj7uv2pq7n7l642r7ddpxxodsys5rkhm4p5u7vnm65pabc@acdzrd4nliko>
References: <20250203075610.238451-1-thakur.virendra1810@gmail.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250203075610.238451-1-thakur.virendra1810@gmail.com>
X-ClientProxiedBy: BE1P281CA0217.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:88::20) To DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR01MB8293:EE_|AS8PR01MB8290:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ec9e00e-bb7e-4cc5-aa32-08dd4472840a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?VMXWJZTkF7XXBXiT1jyA8G0yfmulM2K1/lTKotzBNbvBsEoplpgBPIAJkQaO?=
 =?us-ascii?Q?M2AdheoSpv1Zlhs/YBMGbWjAvcFtb8Aa4VNOQuC68WwN+FzK/EdGwQVvt23X?=
 =?us-ascii?Q?ZwmPPDwO7TJNjVhEagWsmhFercg94MUdJCN81+c44afJEwkAu042NyYP2Bu3?=
 =?us-ascii?Q?24IyZg9F+ZWSXq5XxXu+Yz4l3TOH061kPs7oIw4g66DI056Y4tl6JJEJpvj0?=
 =?us-ascii?Q?zyIpa0nOK0XZJRBqEGIuQvffW+4QpbchD9g5wM97CaRDwzP+ThTixVT/fPT+?=
 =?us-ascii?Q?/pi/emx90ln+lqTnd4ZXWsvP9Ev5im972QLNgVM2TlYC78wpykWLtjyWtMRj?=
 =?us-ascii?Q?xekaey0J2kkehS4sbfvQqiz9/6Z6nIWg5vtrj9l/fVeRf/DmwY7MfV2WSvlC?=
 =?us-ascii?Q?FfWtv9pmQJBMpRL0PFTk+0oFkQLDtVU3mkxS3xcw9MZSF3KnOLK/vbtMWOwA?=
 =?us-ascii?Q?D+wWm5jDxgMf07s7hib8Y0OJVPA0SPR3D2yaKC4DrcZkx7TIhf2258pZ3ioo?=
 =?us-ascii?Q?fzsTslcFIv8zlzj+4HN+6ZzB/rSGgvcdI9QWhGKW/1BQ8BM/fzsefwZ9p73F?=
 =?us-ascii?Q?M+Ykx2EOFrZnW8uiEL6Mm+J5y4m5Yl7CDTGVWUuYz6miULU+ZkdGHZ3HPC+m?=
 =?us-ascii?Q?N6VIB+BFz3o+2Vj2KjTWKpQ7c8GQI0uwRxOgN6XG14gJX5lrrPQ3Wwxp80fI?=
 =?us-ascii?Q?RXuYLYaVkkFAmkV8z+CsLtYv2guYFgLLSz9AR4eFsSXmTXIlmG3ueiAdXNJW?=
 =?us-ascii?Q?6xkRi9w1eGKdzXIE9NJhi3dGFckgxX3bh63WXyFwIgux2xaHWu3QwJVzn2KJ?=
 =?us-ascii?Q?ZtpjlrN8nyOpMXX4bMyuwmWfWnpuqUGPRbCrI2pjuccRQXvhZSV1+qNg6jjQ?=
 =?us-ascii?Q?bd9VZX6r5MKh84Ls6Q6W2WQ8vpmdJD/AeXkda8mYlT9hCJjUWiXBrFHz6wXz?=
 =?us-ascii?Q?kFl++/NftKX1O+DkeIkJpXm180x2Vb73SMTlUmRBKiv+4bh+jaD3et1/2aO/?=
 =?us-ascii?Q?G1j+9Df7CUzFIVv2wWJd0Jdvq/irIkDa2fZjET0PURwRqTBiIECNGYGYQv5k?=
 =?us-ascii?Q?VeUxotq0ryzy1v9HKqoiN+Nyy7cu1AxOMOV4hEP7CPBvWv1YbZyOZza+uKoS?=
 =?us-ascii?Q?NY38h+PRGmGz4zaFTvjJE+lFFaOexEVDD6xniAxMHUi8haZj9fCVTfl3+lIS?=
 =?us-ascii?Q?ZWTXFNnqzWcFfVYLqhiaugZd4Qi5xa8TqkhkgldQM5vpMRev1/wskEYCZuKQ?=
 =?us-ascii?Q?dR2HVUVw7Wp2qPOe8g5Oq7lzjsZlEwKdt7ju1ijjT5b4aJZQfvM5zVZCPjcX?=
 =?us-ascii?Q?tyfyTQFUju0leJj+OAS6mBsX?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR01MB8293.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?GH5mvSf60/FWzbnQWhQQvorIj3CQqQ+rZkYAioJLQyBNUbUgaAMYLXopV/01?=
 =?us-ascii?Q?cMHe7XoSF6jxAZ8HE4r1mKSpXeR/t/ksk3nRfrFI6H/23GD7bhKpjQ7/HIKG?=
 =?us-ascii?Q?N/pWbRluYBM+rpJub1/ry9IaGVp7Bjnpsx0Wncb6Gm7dDnAwm39VM97TbNML?=
 =?us-ascii?Q?9txd2H+ogtf/wQen/Cdflp+WbbIvVBMjRuRe8v8s1wZrk6Nx3JkD91ai1Ua9?=
 =?us-ascii?Q?WSRtvlKGJCMxhx8hUzedgDYm+o6hx87Yrw7wg6nW2WDv71IPANv7/VY6YJPz?=
 =?us-ascii?Q?Tyex+aro9mFECqiet2f7aRbEk8WHZHen+sb2cxuIakS6QA9Wb3tSEn3i1JK/?=
 =?us-ascii?Q?0HAB/Dod87Qz21Nlnx0gubE14WMWfNu8/YZRy6VyPqLfpqcwkLDs7nW523Hs?=
 =?us-ascii?Q?EgUCJs2fPVgivh3Won45V95vn5JBREIeM/c+/c/JjmhQGNGOmXzEyW6nWQYe?=
 =?us-ascii?Q?kCgP5sH9W2Yi24kKV4Oqp7EU47+wLn3ciwYfZ29rqJVt+N4TXfSLOgr2FMVE?=
 =?us-ascii?Q?mv57nhxOtBHUJUS4lUizP/tYfxeOisS9+W/xDVfR0nEXG+DAsUJ9mT6qqpMX?=
 =?us-ascii?Q?OVnEHzo4U95UblrilyWI6/mI0LLAzsq7iRIZ4VL4Wz3Z3YplL1lQZZ9cxfE8?=
 =?us-ascii?Q?1E/UHZA23ABZ1bcFow/uHpAE6NkXwUc4GUe2rWmF8xc+3z8uZauo5bGba/As?=
 =?us-ascii?Q?RzKW8TmDPYvmdLikSEkRzkAqxKMiKCQmMV3tJgz/LjMnNWHJLyV919oc8yE0?=
 =?us-ascii?Q?A2SUCe2gjouUEr5++qLaNuL3RNlmIqtY0YCCkv5PiBL+qCCxldg8s06oLoDJ?=
 =?us-ascii?Q?jBGYgi9vMgnWrRISQpv66fyadElM/Z5N0FoMjYyn+pzfuacDoLO4KDO5Ebis?=
 =?us-ascii?Q?zxrOh3mKqxYLEq0Kgu+f5qcyO18wRDqwy2bXRRXqAQUnfiwqity6GQ8ATMO/?=
 =?us-ascii?Q?ndAFdVe3+A0wQENDU18Rw2QKvuckx7B/DME0K0sY+d5ldTDCbr4JuoX5XJZF?=
 =?us-ascii?Q?h9J/u3MfcVxtZkzKh6xE4coXI6FVfYwu8YDevubozcsTT3OiEgosOkIspLVW?=
 =?us-ascii?Q?Hv4JzvTRyOmVAVaAoya8lIGLsoqeCDShtN8y9yO9jQSOur8No6cFAlrpCnDn?=
 =?us-ascii?Q?agrZs+2vN88azZ9nYE97k4N27e48qRuSZ8KY9meqwfm/NlfGNucUuiZjRmKo?=
 =?us-ascii?Q?8RRWUUEARZaqcRARSu1B70/yYe9gNZHIuCHrlgPg5Mznz89oQXpslmqG8zfa?=
 =?us-ascii?Q?8xoXhIpZpGaWPiszifdqEJ/psmuZpLrx1gkvJWYyUfgHFDVCjcg+D89ETU1A?=
 =?us-ascii?Q?FJ3fmq0se3+q4PRZrW8BfX8nwdKe8C8n1uxRcFWi7L5y5BDATgrZVa2Iw/bk?=
 =?us-ascii?Q?OgO6YqeSginKAbfUrIhoIu7qp9pqKkksQXVwhaJWnrji6HXzDoouer/ywUvV?=
 =?us-ascii?Q?werqyu0iCc7gjls7G5Mc4XS8dVGHUT/la8zQ7QWcoKu5OUICdeVRheFeVdO5?=
 =?us-ascii?Q?npOwjZndllv/ZV034QULq87/b5VJEjRRE8A06HNN5DUJ1XPp8Ufi+N+CLwrC?=
 =?us-ascii?Q?rORxAZwCyGZzSLLYg6uhnIkxXpoxHTWLVZ0eDU8C4+5En+7XheCoiww16mZd?=
 =?us-ascii?Q?3Q=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ec9e00e-bb7e-4cc5-aa32-08dd4472840a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR01MB8293.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2025 16:47:59.0249
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /4fh3k03hdT/koHvNEROZKpejBNeiQLRiO6F7EXNNyB41DEZK0kIdI40uE/h2E5D9qn5AcAo1XnnFWGqC+7Qk3/6oU3GQ4WsLt1Tr2ik3/w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR01MB8290
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Feb 2025 16:48:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115240

virendra thakur via lists.openembedded.org schrieb am Mo 03. Feb, 13:26 (+0=
530):
> diff --git a/meta-oe/recipes-support/libssh/libssh_0.8.9.bb b/meta-oe/rec=
ipes-support/libssh/libssh_0.8.9.bb
> index 98910d3068..7d0fc2d32f 100644
> --- a/meta-oe/recipes-support/libssh/libssh_0.8.9.bb
> +++ b/meta-oe/recipes-support/libssh/libssh_0.8.9.bb
> @@ -18,17 +18,19 @@ SRC_URI =3D "git://git.libssh.org/projects/libssh.git=
;protocol=3Dhttps;branch=3Dstable
>             file://004_CVE-2023-6004.patch \
>             file://005_CVE-2023-6004.patch \
>             file://006_CVE-2023-6004.patch \
> +           file://0001-tests-CMakeLists.txt-do-not-search-ssh-sshd-comma=
nds.patch \
> +           file://run-ptest \
>            "
>  SRCREV =3D "04685a74df9ce1db1bc116a83a0da78b4f4fa1f8"
> =20
>  S =3D "${WORKDIR}/git"
> =20
> -inherit cmake
> +inherit cmake ptest
> =20
> -PACKAGECONFIG ??=3D "gcrypt"
> +PACKAGECONFIG ??=3D "gcrypt ${@bb.utils.contains('PTEST_ENABLED', '1', '=
tests', '', d)}"

Would `oe.utils.vartrue()` be better?


Regards J=F6rg


--=20
MCSE =3D Minesweeper Consultant & Solitaire Expert

Navimatix GmbH           T: 03641 - 327 99 0
Tatzendpromenade 2       F: 03641 - 526 306
07745 Jena               www.navimatix.de

Gesch=E4ftsf=FChrer: Steffen Sp=E4the, Jan Rommeley
Registergericht: Amtsgericht Jena, HRB 501480

