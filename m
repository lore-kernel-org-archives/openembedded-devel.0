Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C67D6C98321
	for <webhook@archiver.kernel.org>; Fri, 25 Sep 2026 11:44:44 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.61])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6182.1790336677654680294
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Sep 2026 04:44:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=G82nyjBW;
 spf=pass (domain: est.tech, ip: 52.101.69.61, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ASu+hNLNEe/6S3SEfgLVOmKrBS60IcxAz/mYBEx2diW6Wd9KiCKNzcZcUferALoayjLE6xZ7ccIME14UKiJH6Pecxk6+pWxmcfMpIY2bg+UykYtUv7vrphu70Oe4xPdRfRj8YO/fy0HDmMhFKAIAC+eGIg+YeAK5C62bNZNFEh43vd/DF0hTrMmqy5V/pUoSKrsK5y7Aujy4wuV7KE6EdULg+ivWAvNHLhDczeuGcP1ca7bbuYyAQ+A1BydIgQ83aDvqqhuThuefoGXQqkR2p8scG4U/86nrxm9toEoBvih8UGHCLITYPvgQUZdvccZVnSPDCV8ZVY6Nd9DEivu6VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oN6u/Ifz4ED04PF2pZjYLucy58Z4RA018bGSAsvBPpk=;
 b=TXDwQmUfSFJSi6CE+gZis8DKq3dgb1fM7iUEP00bwCHUNHztqlaWLVfMJTmqIa0jLfbiNt08ocHxbhA/dipcsxydE/tw5pbERxuan0V92SG8usV8cMQOIFXGrvEw3P3UcwpXswGBd1/qxC+uBgeLvX9QhRZq1CoJX7ZgT5XHtaaG7hFBpdsR3tFoGPyf/kjsJv7dHegLwuH+ad+jL3g0XaBgsMBz2uspxC9tPys2CmoBi6lbvYi+U9CFCJWr7f2G/CF+yEsuw6a1uNhkrpnzPmqQAZr5OdtmXwUxrrekr1i86pOoBfSbeXf4CHhDPFErklgogvBDC0grmig71sKUjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oN6u/Ifz4ED04PF2pZjYLucy58Z4RA018bGSAsvBPpk=;
 b=G82nyjBWivY1MADI7Jw/b+f1wfUspqd0U7d8P8smlYPCYdw/oQ21i8DF1rzeY4pN0eJ8HiDtU7lFH7EfeMgvvQFVPIVipaV776qQ/+Ywh4RU56jNC8BabnVt7Tc7PDaf1/c5mZSSvfNxGLdZmy4vEjJP7eoVYE3SzTzolzoVq695HyFdu+YhnmewDRzSInSI2mrioXlXcfv66jDabGVfTs41Yugczm1o9+v41dqzxNcui5Q3vLf+bAGzc+APYteeWkzcOwNoxYfriZCXLjUrEmiBEowHFk/VXkCrd6fA2vH5h+s+rGJESg8PfkrcYbkQNZbMSuqCIstjk6UQ6/JVTg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by GV2P189MB2984.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:269::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Fri, 25 Sep
 2026 11:44:31 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0451.014; Fri, 25 Sep 2026
 11:44:31 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-devel@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [PATCH 0/4] netfilter: add repo.or.cz as premirror
Date: Fri, 25 Sep 2026 13:44:23 +0200
Message-ID: <20260925114427.2889-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU2PR04CA0086.eurprd04.prod.outlook.com
 (2603:10a6:10:232::31) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|GV2P189MB2984:EE_
X-MS-Office365-Filtering-Correlation-Id: 248a0d11-93f8-4a0c-73f6-08df1afa5ce1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|10067099003|56012099006|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info: 
	75pQs7A4/GbP+vkSjWlCbtOHzdSfkuz7AuBxLGI27Pg5C+LpA+GmqIzm1Ggvb5phIziYzlTQKOoBo/tKnRnplkue4MK7RsyAh3OzxSq8IUipGPYZFiimNzXUm+O/YqKWJqmHLO1wW5ZvHfzeOZb2H4tWaYbQcra8cn20bFpycHOMkS3pvhxjWuDJSnkudYv1o/6HQ1rjcHkjES/9UBYugYvYNDcPtl1CU5V95lwMqs4a5pFjuFKpfQM+UQPGPwAz99pK3QZTp0wewywCs3URKJDjdu1OhrPZq58c/DRpF4TJ1SnrArKvHLyrQxDCYzQwV8VCsHVFjZ2CgYspSpTm6qG8ieIwEGqTkfWMxWBU3IxGRUe8YCMhdG8XVaQRsKo65H6R9mHgYi/zbmJEgREsqpz4R6n5iDMQ+y3NJ+oHJIv3mZp3hhBaI/hKb4jQ3+5tnakdG7dCuPM7sYXEzwR+e37G2VQotYpxL6qNUFMJTjnJR1m3EAlzXvD1uYphEB5NjzC1jy2ehTmlr3UFUqAc904CJbPGAzW383iycx+Xe6OEvaUFPGvb4oqpmxAeqsML06/63l757Eg9mRnxAap6qJc2f69qLKTBJ66ZY9V2eKk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(10067099003)(56012099006)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Sit18B9TUVqpZP5oMuQq/s4fAvF/NT7ni2JO3Gu69wmq0X1wTDeQcU5uTbM5?=
 =?us-ascii?Q?ELLs6mVTy3nrI3Q8rmLoY3mGqAaA6ow7Ctb21J9TwsFnPB8ZqVBTgZ9HpvY3?=
 =?us-ascii?Q?uHrkGKSqNY1GTTydAFBV+21d9qD1NMSfrmFusU5VkhTe+jQHsD3pfY3u2Fvn?=
 =?us-ascii?Q?nxKggENc7WQJAeX3fDpz9KFL7c/RmXPDtWv0E8kyve00Q7P+4sJIqM4lsF4V?=
 =?us-ascii?Q?0EHuBE4jJ40BLPBbjp53z1xe0gwfkbciTI98PkyHFfJP5AFmchJSx8vu+z8s?=
 =?us-ascii?Q?bJuBtJJr7Smbs+QeXHnshtVplXZOjY37A479AqcPGJkmwMn3RYf6+111h2tX?=
 =?us-ascii?Q?X7v/S5dsynZOoEXhW9O5nYR1YEo6n0CEjk/PCCVjENbk2vmta9A4APp91LVs?=
 =?us-ascii?Q?f6pU+96nJdYyESU6vGWMr7BQD3tes60GCpvH2Xp53RvhIgRHJq49sBHnG58k?=
 =?us-ascii?Q?Q3EqRt3G4IesNWJyCduzRH//XK1WEYvSz6KJI/rhVb4sFPblMWNhFinp8eTF?=
 =?us-ascii?Q?fpUJV8Vckn2nZs+DKtW944KnR4GSak92a9GNDYClzo5D0zGpragMQWSMW4gC?=
 =?us-ascii?Q?RYCUNZmsmgMPhCD4Z5JvIQ4T0lTAeFmznrTEEnE3hXPjW+HxUq3Ah9qKNRyj?=
 =?us-ascii?Q?0xaZdD4+N95xg3B8iXPkshxjmzCuBTGp4pKni3wRnTrVB7af+TmInMUe/9ub?=
 =?us-ascii?Q?bryUiiK3sEezH0ks/EhiJp20JLpZdr07zx2bnqjxAeedimS1aWTEysB8IOCy?=
 =?us-ascii?Q?raB+CZMxk05gys2ym6dmPGjc7b4Q6elRH7N5a8NiMJBrBTTaVmtOphAzOlsg?=
 =?us-ascii?Q?ZSznRB9vU/Q5rARByX08kFdsiP0ojLSKtq/zpyHcyJmJ7oXAZyVYfppkYu92?=
 =?us-ascii?Q?jjsz1P571gl9mXhvAS088rn5Z5TBwEzYuoEXZjzBSbDm+IFNrpS56JVZa6an?=
 =?us-ascii?Q?iX+Y3YXH7B4+WDYrNsaAFzJhsgu/YvUUnACwQ0y0Bn6qjU97ja09GQrr2SrN?=
 =?us-ascii?Q?/01q+HnNl4NDjgV+Lslq+v1510s5ncVSzmL+ZWvMSss1mlVl5UmX5qKEWC32?=
 =?us-ascii?Q?0CmiS/dFFaIh55+GFDxXF+AqOzIYTx0T+qmsOn5j4eYaEG0ynDTxTApR7IgY?=
 =?us-ascii?Q?WrBMkx3fryfeFouav1BMejtHRgjtZ3kTZG1zwa0MZLr1THl1ICuOiUKlkHKf?=
 =?us-ascii?Q?JutNz3ZiVJEcI7pZyxY1GfavC6Ytwfcc48goGntZgvok+6LeTsY7Chb2BfiT?=
 =?us-ascii?Q?7s39l/wMhX0aW2w1E8GR+1NsedSzyJWH1qikMJmfKqNcqfK32OyH4B+mNaNh?=
 =?us-ascii?Q?L0J01wesr8Hwyzvk7n/g0fanF45V7RoDQBzYzlKVGisMWBtZQ2iL77vdU+cV?=
 =?us-ascii?Q?9tY7+0BUVcrk9wW62kRXvgavcK8GWKYp3+YbcTGpp4VbCMAfkEivoWxW+msZ?=
 =?us-ascii?Q?ubNbKZTws6AM5gteBnhDw5YhA3vEILFRmdc9nlpcxE7LjO5oFGy6U0vZ9pR6?=
 =?us-ascii?Q?F+SrRDk6CRIMhAhXbeY7Awl2MHtLPD4hBR1E/ujSWlQFiXuCAvBDINCGhIKA?=
 =?us-ascii?Q?zEzrqe+Jy/bpZPHHXMYqM0bytLWcshpT/1A0OHTyQRX67Naq5JBF7lKZqubb?=
 =?us-ascii?Q?KaMnyHKrOKlqZaQ45zYYl8nCMtb4Ko+Ap1lRWiKH3AiKtl50lFHfI+8Tgof8?=
 =?us-ascii?Q?U5rAVoBUo1cARrV63MG9UbXluI5hTnqiYyUer6ZGYZ81mItIh9kSEnkSaGkS?=
 =?us-ascii?Q?YaAbthRw2ah7L0qnPM+KXir+kqaIc3M=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 248a0d11-93f8-4a0c-73f6-08df1afa5ce1
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 11:44:31.3993
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ShKOkG0AgqFa/BiWBMp96gsqSmM2qipl/o2tSU//ylhv7QIiFtAbfz/wwGkA0BYGmSingjc5d4i56cUlDpia87IAzHbzX7YjXGiDpyPYUDM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2P189MB2984
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 25 Sep 2026 11:44:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130295

Due to a recent surge in automated AI agent traffic, git.netfilter.org
has been experiencing increased load.=20
The Netfilter project has announced an official mirror at repo.or.cz to
help take some of the load off.
This series adds repo.or.cz as a premirror for the four
meta-networking recipes that fetch from git.netfilter.org, keeping the
canonical URL in SRC_URI as a fallback.

See https://www.netfilter.org/mirrors.html#git
Link: https://lore.kernel.org/netfilter-devel/arVpqySeeTQ7ZA06@orbyte.nwl.c=
c/

Jaipaul Cheernam (4):
  libnetfilter-log: add repo.or.cz as premirror
  libnetfilter-queue: add repo.or.cz as premirror
  libnftnl: add repo.or.cz as premirror
  ulogd2: add repo.or.cz as premirror

 .../recipes-filter/libnetfilter/libnetfilter-log_1.0.2.bb      | 3 +++
 .../recipes-filter/libnetfilter/libnetfilter-queue_1.0.5.bb    | 3 +++
 meta-networking/recipes-filter/libnftnl/libnftnl_1.3.1.bb      | 3 +++
 meta-networking/recipes-filter/ulogd2/ulogd2_2.0.9.bb          | 3 +++
 4 files changed, 12 insertions(+)


