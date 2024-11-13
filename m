Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7019ED41C2A
	for <webhook@archiver.kernel.org>; Wed, 13 Nov 2024 09:47:20 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.132])
 by mx.groups.io with SMTP id smtpd.web10.8328.1731491232966214361
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Nov 2024 01:47:14 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=QgDvlK2u;
 spf=pass (domain: navimatix.de, ip: 40.107.247.132, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sSV/8LscbBcgXdYu/wZmI97pO3nbybxf/Tst6KpefKE5tCQbMbBBwkWXEFxMBv+YSEWyW43qyT/dcbDVKWGOPXZpITAPM7v3mRaE4ZCaryOrU2b8p0h87t4/fef7jaJke6w6hP1rM+wzBPIZEHWFehPkR8BnBJagzPrDc+ZGx0ZESrOhy/USSmIx5Sa9FxHXwyBSQe8FLDIGH7VvadvdDEIBolr14SV3ipLOC2EB+AOamisi9NyvuAHb6M+cFq5H7NmaZHQQB9+RnmnfV9tBdSEABb1d8jJFFDpSyRixUxvUjGyUPadz/GcLuZfRS3l0kZ9etnqbUej08ocWn+Q8mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VKQo5LxtSZfxEmN3qVElgVZv9KT5t4cAa9dA8bUp1Ac=;
 b=NnKnwLwTxXCu3csNLuEGeWJbpyJtDmFONfTfx7vSVLhDBLcX97UgpZC//c04sE9ZmItGQ7q7GgZdBGTG99v0b7oW43FQ4DpLsV3e/UtS6hdBiTIsFSXKFFuMPeCjSoVmw95i0jOJOO3+61Me2NHcUxWQ+U79ur86ZGIjneshLyDPtqKgOvEpTfl/gddY7On+vJ5YSZovRIB6Zn28POeeSkJHj/LVG8uACiXWCjsYCL7UTLKWVE+ViStdqAgpxjyUhRyHR45kJTRBA0PhBPq3KLMRUJoRDAl+uwqZprd2BLTb459tbaetp2Q6b0kXq27hcBtFBgPu8yereSRQ+ag07w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VKQo5LxtSZfxEmN3qVElgVZv9KT5t4cAa9dA8bUp1Ac=;
 b=QgDvlK2uPxbiqkFPLhloOfGhfIXyNxC4PJx38BhP1akhKNsgPFq8/38PcIOhU9yQwKulfaKA2Y4ePF77HcgVgr3lNGMvg8q2Pw0FZDucRj5CFjU/Of8WWldxHxTokxW3CK3ToHfHaLC5/j7Hg2kYAAPmHvoDdM9Kmr3IYMQAyMQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5) by DBAPR01MB6647.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:181::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.29; Wed, 13 Nov
 2024 09:47:08 +0000
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7]) by DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7%6]) with mapi id 15.20.8137.027; Wed, 13 Nov 2024
 09:47:08 +0000
Date: Wed, 13 Nov 2024 10:47:06 +0100
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: Haixiao.Yan.CN@windriver.com
CC: openembedded-devel@lists.openembedded.org
Subject: Re: [oe][meta-networking][kirkstone][PATCH v2 1/1] openvpn: upgrade
 2.5.6 -> 2.5.11
Message-ID: <urka7yjk24traq7vlsurflua4hwd5muhvmgvd5el6nhxulvglg@caaulbuwj2jg>
References: <20241113093121.2520563-1-haixiao.yan.cn@windriver.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241113093121.2520563-1-haixiao.yan.cn@windriver.com>
X-ClientProxiedBy: BE1P281CA0416.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:83::20) To DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR01MB8293:EE_|DBAPR01MB6647:EE_
X-MS-Office365-Filtering-Correlation-Id: 34c31583-ea5e-404a-15bd-08dd03c823cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Vm6a5yNOidu+U2qXWBxyI7MslQTgmA322uD8PmotBsp2N5gO0yjswb8WLtf6?=
 =?us-ascii?Q?wOxr9IeT573PngbYxEpAaipS3aCKvowi7PfijhdpXpom02IVTLr7VRGDX+Uk?=
 =?us-ascii?Q?mq0J0RfjanktkO2bREa6Km5fmGCrQFn41PWKffQWifTvB2zk6WFtLi21jQHX?=
 =?us-ascii?Q?EBpObXbfbcfhLkfyCETESKbmseDSykbe245FqF3vNPWhl8kD2Dp22+TuF4u3?=
 =?us-ascii?Q?otd0Ry+ShQQRsbQmwbzlx7U2IeJSPza7wYe7pV6wjKLkEglDWqZGMj5G9Zd1?=
 =?us-ascii?Q?Y4cpXuNJxnUGEuuOfObe5SA9cMKHbNMhv0N/JDJ08FTYcOwI1/BSqqOFAAgx?=
 =?us-ascii?Q?mmTY+tdrH3rPCxQM84BIXaYDan+tu9oKCmGI99YJSd5Kt4mWPIQAHIyTAyiA?=
 =?us-ascii?Q?V2l3IG1k087V6rTjT7Adz9EbasNZeHhD9UwExt9hQRhAjAkzC1SAoLm5bCDn?=
 =?us-ascii?Q?2s/iyZDOviplkj52s4ZrRHZvj3vuTQIEO3OLZUfhkKzkCJG/KO/ljtAOQrR0?=
 =?us-ascii?Q?ajxYS0iBX0oCOJw2KyTIxk2iI8m4/SNbqXezg3QhaUvWTEQFZBsYhWyVcqKT?=
 =?us-ascii?Q?DfBXLfe7fvrHLge6pF4LR3MYo1JF/9+8EYR+l1VJ2o7myoXBenjU9KDPmBmj?=
 =?us-ascii?Q?14xtjA/xgopfVrEXpBlW0X4wXePzfe/F54+FtFw+yKH7Prs9S+nsr1rkXOlf?=
 =?us-ascii?Q?5E0WqlKIbYQ/4/flbcHJZi4WeOPULQTN0r/aR6vMJU7dRN8wu+CGeDEDVgv7?=
 =?us-ascii?Q?vKmcM0JFfQgJsyODsgLtdEQxpYrqwxd3obYO2jNFuKoOmZZnIce6rZUcIfCJ?=
 =?us-ascii?Q?pbwjmN1PXFxSWJgQgRW8fzItT7HKCDXSh+Kenb2QHMjPwAMFcPPtmu2iJjMJ?=
 =?us-ascii?Q?KXjtJcbGNhVIQ3ZnhFt7W7kAi7sfxx1VhZjUVt9ivqf3J20+kWNO0aYyz6nl?=
 =?us-ascii?Q?BvQ49jbtIUJ27RIAa0ZdBxexVcsS4Q6pD3b12U0pblQB4vEcD6a4ocNwQePt?=
 =?us-ascii?Q?XfIinnqi+JhwMU9LhvyYM/d+XaT38Mtkf+W3/I2AXLtR+nhU9dptEIO2k02z?=
 =?us-ascii?Q?b3hOmUv6rKJgrtf5I66piOj2hYpVFd5eCelum/Criv6BMLDA87BRIFrHQrsa?=
 =?us-ascii?Q?WS+2pLFom7xjNskhEYGL9JlHFL/2mNR5Nw7lrqpduQXvNnndQ0us3Hv2PaIm?=
 =?us-ascii?Q?xdHMC+GsBAeyZCkvVPzBL78yfp6imiTbSTWrVRm18ctghlKl6v4/VJrCsc0e?=
 =?us-ascii?Q?tYXojIQ1a1YE4aarDgEv3cMzuUSWjh3GasR/DR+VpqvXNBM+n+hJjjnhY3iM?=
 =?us-ascii?Q?R34=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR01MB8293.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?IHunRSOxjFU1Ni1pDvat8AwF8NRoBZ6q2R8eR/XYvj/OeI8YghQ6Vfaqobu2?=
 =?us-ascii?Q?XrJvu+sUKPY8rTiXhRXnSlR3FNjKGqgW7FZqwIuuAB0gXOixF3LyMMDc0zzL?=
 =?us-ascii?Q?5dgDm5D4J4RYzHsT6HX8j2+wxBjrEmLdJ/XndxYOgpfXBLd+sDjYLpGMHlxw?=
 =?us-ascii?Q?wJwc/RggecL2dYFgFeS/k1/MoL6g0pv6nOUSo9vV3I+N2TowWuDA9AHBlrTn?=
 =?us-ascii?Q?SdsWRYxB8EpbGp61cHDxCTvl78/NexYAn0zPOJvjan800YN1oO/XDLcELPeH?=
 =?us-ascii?Q?WtQCA7YYuOtDmdP3Vudtw1daQlI/P1ljxAWRv7BntNPbpufzedgAJwX0zKgx?=
 =?us-ascii?Q?SYr7nUqUh4wrplfHFBbE9jJhy72AXtc7NzNeDdN5G9atQ0pjVeL7WWAFBy/F?=
 =?us-ascii?Q?jrXyfd+0EBVESQYvFc+Unie1O9nKxANSVY3kQHiDwUkKIYfDs4C5+fcKvukT?=
 =?us-ascii?Q?XgGa0gljnUqx/fo/G57WHxJ1AsN5fkytb3Gz/9RyddUE5wz+YKUIMAbWK2Ei?=
 =?us-ascii?Q?E1JdgSfrvqZhCt3rzKa+oGt05bFfsXisPeNbnyMq2P48HhWMCcMZauVNkGZP?=
 =?us-ascii?Q?ViVx1rKw7zYGxc77FJLMDMRE0+bj4H2T+N87g9fWel+X9ZN3K/TyIprxbdmr?=
 =?us-ascii?Q?SLdPD8wub4+Lu/xTKniaQ3uXhbWbjyBd+l2GHrxFaYySCvG4+jzFkwD+SXBU?=
 =?us-ascii?Q?YOSbgllVPD7EabqdiI6+MtV536w/MNyXJ+DbqvCFn+XsX8U6lvIdCUTcOLnk?=
 =?us-ascii?Q?iZcPbjXhzdHlB/iuJFu6mmVrF4RUIHbwAlU3HrJ437pdgX7oV+qJiEoYMfRP?=
 =?us-ascii?Q?EJS9dUFXNAaG2EisSYPOKC7hWd9L/PuBlWLWJYpkNyl6XNsqB11l0+A+KZtB?=
 =?us-ascii?Q?wjvfulDvGieCYgN+YgAQ93bDaVi2RMygdiVFYYV8Bna9gplpuO0sB5ZrC3+Y?=
 =?us-ascii?Q?Ixl6ZcLE2KN7kagwnF8cQ32TkHq3oZmTPipgNxhQdZMwiIebdta24OKiGl2t?=
 =?us-ascii?Q?DO+yMtO1ollba/IuyLLTI8NHMG2zUvpvbY5Bm0Ky2Qq7/iwr/A/a28aazGQJ?=
 =?us-ascii?Q?PKQ+RgT6qXzWk/i7dfeCJ0Aj5mDvIOQ+ho6ruv3Y0HvBbpB4Pnqn8mjT9oZ+?=
 =?us-ascii?Q?YDHRVPaGbHJA6YVWEeEQFZY8qSmnsilrrj3T/g8XyQo2DKoWmeCzy24eeY/h?=
 =?us-ascii?Q?94Gk+3wzsXzj6Jup9/ZH8A/pSDbgWZwNol+Nb2d5TQoGVmAn4QNQMKGWpyXP?=
 =?us-ascii?Q?yIhyvifTUwfKIFXBHRJ7ErSb0WcddhxcAuwFQaKeYAZCk20bcT0i1qwqanAa?=
 =?us-ascii?Q?wt/OaHn2taNiEFLydt1xcgQ/7LglLINiA2sXfiZbcNjHpOeCQRuLbwky3tMA?=
 =?us-ascii?Q?GhfDAzSKXapBK8oQhtYuz1nPOe0YM32z6lS3NictAnA85eetO5LfkwNQNArr?=
 =?us-ascii?Q?B8YL/fBGQ+aM1UusAMWSWP0XgGVN0q+n1+4JCVKQKhVzYGCLxSTpRPUjjzL+?=
 =?us-ascii?Q?ckK8SXYzW6IUNOxMxQPkb2SZTUDHQvIK9DS1dw78G4aCauq1qQvPk5okKBAj?=
 =?us-ascii?Q?+xrm4ARKWk/qqJ2ULIqPrjwUTIM5OgCDR4jjLxew8xv49c/NdCyTsT777pQB?=
 =?us-ascii?Q?RA=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 34c31583-ea5e-404a-15bd-08dd03c823cd
X-MS-Exchange-CrossTenant-AuthSource: DU2PR01MB8293.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2024 09:47:08.7368
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0h2k3L7BZQyxWXvXrsEhl8c8w2crb1bagVpkshK5U1Jq3kGoNzaFzw1bbdBKV/qMORzRkDS097i3adq580w30nSnS6VydBfa5FS2nE7tPMg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR01MB6647
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 Nov 2024 09:47:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113805

Yan, Haixiao (CN) via lists.openembedded.org schrieb am Mi 13. Nov, 17:31 (=
GMT):
> From: Haixiao Yan <haixiao.yan.cn@windriver.com>
>=20
> License-Update: Add Apache2 linking with for new commits [1]
                                      ^^^^^^^^
                                      Is this spelling correct?


Regards, J=F6rg

