Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2471EC01D3
	for <webhook@archiver.kernel.org>; Mon, 23 Mar 2026 11:42:13 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15256.1774266131556093084
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Mar 2026 04:42:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=o9stptun;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7542b98c32=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N5kqHI3731459
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Mar 2026 04:42:11 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=v9Di4Awxz+hOLGrGPLxATlqBI3E5rI0CWqOrYQ8AwW0=; b=o9stptungfUM
	pc7X/Vc5J57E3kFJjrJPzLBQBXgx8aIZSFk2TQzOBh8w6rYo013Us6pB+aEPRU+c
	K1hL1O7oWuHegrE/ybmVYRTxyqhIoklV2p+NKwF0okpQ5JlJmmNa++oTmbrEP10I
	g3fFgIRY1BvBqQVsJNUn/J2wKoO+wyCGBmznYD1wWm9nfFniHnBaqpct2ucOwgNp
	8Pr52jf7QNA5qkrSWKeLCh+qbCGi6XcEGn/nDgpdi6+9fRg4FCdZUlL1ZOYjeYee
	/8Ls6J2FwziG2O+Qw8FuxBxSIKMNpIQPfw64kb/mo+kwGRDAKJ2Up36Npw0xvi3C
	NpVIHhcd6A==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012003.outbound.protection.outlook.com [52.101.43.3])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4d1pky9k2h-5
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Mar 2026 04:42:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gES8L2MMx8iI/wapBaClUtm9nnHxVmL2ZnMfEMrdgk5BfMQabhz64pnGkhrewiCkE7RKlMHu6V6ULv/sEi21kVcUcq7m1XplGC0ztAOjHAFlHThlYxN3soaWBhryZuTedT9POa+nG1aJMhO0vTHGwmVV4SJ+0arsd+0hq/mDK7wkR869NTysCo3v6hbZaifGgjo4URAhLZL5UVppyFaGi8FV3d0PSQzHu4clhiYqJoT4X7OT3kl/T4rjP1ceJ1dHN7XEOF87vE3FUJc3Xx9lR43aHk0vtY4Kj3QbsXluu7TZZi8JorQ0LqjuIqNooiVTDDndsnvY4UXNddddrigQdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v9Di4Awxz+hOLGrGPLxATlqBI3E5rI0CWqOrYQ8AwW0=;
 b=LMJrOslM2smILbRHQuVYUpZHgoA9eFmNQX7F7KJVzgJ8u0eHDdRdxCQNVDIaAn8N4HXPlnDE0tT3FoowGgt8fnNfFPvWpNKp9trn2+IJgAH+lYdmGj696Js2vkz4828coF5QF2YfuI53HCX31Oo/XwB0MvEJXNhTAfdHjON9t3Mt+14+W/hDBNcrC8I0Cdd4ZsuHM0nOlEsQEY+kg7a32hfKhb6jOQQJkcwgtpzWhQ1xR97LO0riqR6D2W+Yaw5jB9YvFQlkYm6YRHc2nxEmGaZEcBZE7UjQi0wLUq5fByKHtcldQBG31xY0qwidHNK7hOVQ/tJEhbiaSLejPuxoFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by CH3PR11MB7763.namprd11.prod.outlook.com (2603:10b6:610:145::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.10; Mon, 23 Mar
 2026 11:42:08 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484%5]) with mapi id 15.20.9745.007; Mon, 23 Mar 2026
 11:42:08 +0000
From: peng.zhang1.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][PATCH 04/15] xfce4-power-manager: upgrade 4.20.0 -> 4.21.1
Date: Mon, 23 Mar 2026 19:41:41 +0800
Message-Id: <20260323114152.4178269-5-peng.zhang1.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260323114152.4178269-1-peng.zhang1.cn@windriver.com>
References: <20260323114152.4178269-1-peng.zhang1.cn@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0108.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::14) To CH3PR11MB8562.namprd11.prod.outlook.com
 (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|CH3PR11MB7763:EE_
X-MS-Office365-Filtering-Correlation-Id: 61e506b8-1729-4766-9442-08de88d136d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|1800799024|376014|38350700014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	6gQRpghjiVz+lwEjo5aG92+CXfdNOxBdNpN8GhqH5GRV8sfmmSI6SO9IOhDAYHd8isc+JzyDcmk19IH4LPrss9ZASpIotRn1KeJXQ/ncb1Sm9P/TNyAOuteDqNx0RpG027pZT3baLlPfwRwzGsZl8YG2SD6yUAZszbOMgW5BdxyrpXYumeCHY24Iqie5tE4O750Ik4sRNLATM70dyBsJuZccjtE7uW7I83p0fd66UQEW+vxLg4PGKrl25OcPgpzUk8yweGbcyW5X7UtVIxSyrWZT3llGN7zTRE+mO+Z9/DUKfR6ZU+8TtJjt9ycL5xhCyaQ7DQiIOHYy117rb1CIJ9KS5lds8T97EiYeDAWWgI8nW/+09IovKHz7nAZiZf+odEHS6CfQgyX5tZY9PO577rrqfTxz7UHrWB7t7oEz91aeqfTYNwbCj5j18Sg5jGt1xsoVZ+83E6jBarWgi7RV2CIIuxwhvAQhckijsJoR/E7wEUEhNfv2jYd976KfLclwNy7avXQzTPafdPNrRCkqycRi4N/rEuNGts2o64/dCOjguBe7qEQCzJrgJJPsVWs/40SzkFsc0TimP2UVG8yUGm35ZkNKUH6sXD3ymM3bDIKM8PyRA7CssfPd3fdC0Gt/awjxIZEJnDHp/mxv6Z22PnWGz8UMQXatTSfUQMe+zw/N7cuG1M2Aj54J7i+FJNwctZvuUz+6fA4L5Le4uVXOVmoB6FobeiKEKhMyMXUmARkCTSss0Xr1jkSgtBKaI+oS
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(376014)(38350700014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?rUyqjO5Y8mDpSQ9mzqc36kUxjX2hVM3jp+UTLxVrcxXMgCIYKf1D8WbozO+u?=
 =?us-ascii?Q?yXWGv2Iznvs4rQOtIOq6H0tk2YuxT8i7691Md759BojHgzWO7HTwXfgL2B1R?=
 =?us-ascii?Q?DXflm3B+c0RFiouOS2WxzHNXmnELEIYoBcJhx6U1eca47icLO8LEs0cTFwQH?=
 =?us-ascii?Q?b/zKN4GZsx9BP4FXYhi2gDbrlRc5XCUmjAQaSszw916+GGC0ix2E2VCrgdYy?=
 =?us-ascii?Q?wBiXsP5+LMjcSxq4QfhxBE9kR+NS2Xu3Zc59UDI+05q8Qo2ZkpEdz1cNY7SI?=
 =?us-ascii?Q?BbuL2iwWW7S41JXdh6jXhZfw2I+R8A0kIAFs/GthzOLKh9niiAYeK4ltx6lF?=
 =?us-ascii?Q?SHRK4eSFvBcMPY/SbAEw3JJkoesckKGtUdZnvGTKFqAYl+CuqyxkyDBHaYLd?=
 =?us-ascii?Q?+aA6cfwbhRfmA0ZvODi63WYjBCIBJqfF8Rn569IuTUYeSwfD5InwGA9CsFwd?=
 =?us-ascii?Q?2BTYiy8N1zSs3i98rUuJ8I3OjqqjxBgE4yuorfl6x1EU73mR9gmd3yPhwp+Y?=
 =?us-ascii?Q?LPISyJ10EE/m59KZoOkDZ20ue+x7ORObA1I9YAig+P+gKAdClrgBZC5+TBw+?=
 =?us-ascii?Q?C/fdi9Yo/nBQusfRuL6rgKcShGMRppVLnOgeN8IIEVCtMCfoF++wRn8iiGln?=
 =?us-ascii?Q?wAy5izOQ9svdqwMVN+pvfbmmGiP/6yKS7jl4ev/APomfbvoEXWongThgj0cw?=
 =?us-ascii?Q?1Py9pfJkmjqAsYbiwmDD5P5UN5f8RBl31/2ATWV+A4oJYrcNgZYo8TPH21Ms?=
 =?us-ascii?Q?+H6LPNhqWVrTlB+amBsZtZ05TsBa+UqIAgNA9c1HjZNjHGMuKzRSok7aioZF?=
 =?us-ascii?Q?zZFi0wD2hia6B3CBcAQ0tMqQzfqcz9YC3BSTTiykgN7KXYWd0QUfM1Bn4y4u?=
 =?us-ascii?Q?JeArIreaUCFbg98x+X3+8UAwkdl4+cd/WEjYfbV8+04PRg3AsYcExu8ZNXE7?=
 =?us-ascii?Q?aM5qsatA9fz+BJ/NqmNTOZX3O6zTyc7GZ6JFpPSSdpOzSiaSwc8gCAnJKMKk?=
 =?us-ascii?Q?aJWmO4Alv3avbWI4Yw+PtepMVg+lYGqPpZ5Y4T37xP8XrmFSXcoDIpSWvtPr?=
 =?us-ascii?Q?ifV40/6KJ4bUet6QCtwamC2XesGnY14bQ1duo8kLHjz6DKJEzIz+CtB/BTO4?=
 =?us-ascii?Q?4oskCicbcBsxYj8ytZK6dYEE1jvWAOoZO6yPdPQyAVv4n6Vk3wtODf1hXG1a?=
 =?us-ascii?Q?daL12GOz3Alp14VtH7t8KIuR53ux4EGWmuwir4icd8IAgdsJ4cScNEagyXsm?=
 =?us-ascii?Q?fCyhRB7FgExC/rfxG6hLZKTlSuW1CUrqg0X9TUeGhI6LgEYVYws7i03Myhr/?=
 =?us-ascii?Q?RXHrI/EYEvGFklWCIsMdxgTYvn0n6WbnHdgFPOWGnzOYKbSqsoBzeWmbiORv?=
 =?us-ascii?Q?sujOb0N0qzUSft+dVzbSCTrNxqqX14I8mW4J2ASOobG7LaNvHGfRTVqOVwO2?=
 =?us-ascii?Q?FrjItqK9LmpeD42o/Uj4xajSKCRwXasyrA3lm6X9/tev/HYxy8wl5HDDW/jV?=
 =?us-ascii?Q?/hTWW8qRjiNppbcjkEEwHjtCsDD0rSFLj7PXijhHopOyG99NZXCeIFCvKH2g?=
 =?us-ascii?Q?RcCF15d5Li9UpFfwsMi4oL6UH/V9KNJfa0UpmaszG5Lsk2JXIV+OvknPSjrF?=
 =?us-ascii?Q?Hf1+sFJIAxi2IE5+2VvV5TdXMBQKgWD3CwzI2o2j9fJjdEdQ16SKW9zTUpJZ?=
 =?us-ascii?Q?y+UcwDDcKiWQSsipewR3NlaeWuqrIkresMpyO3QUCGeYs4GHlmRF66r3kARQ?=
 =?us-ascii?Q?pHQ/adwhHZkI3Zc+Hs+z7G7plmLPiEk=3D?=
X-Exchange-RoutingPolicyChecked: 
	IjIVlp+860hkhpi94XfzINU2PX46Ro41KnRppOJ1gu887FkoY0IFl7yHZRB1Drj4Z7/E8tF/RIaEbMPrLAN59ka8IHRyfreyvWQkcUG9Qh4yWsnv7PHYzY3oY1xXrAMlliaw/wOZvPZhqPSdTy/u0iI4ewvCWT+4BZyYw8bSVhDQQ3YzRbvDXJ4hG+UsNl3UFuwzZ+UwhlkGolKf/4NtJRF8VPxmiV9joiVQ8+4vRecU7Pqb+DLfZtEQ5JxVTBRTBtSlZq+8DVk+V/2N6Ye5zWWwdPUGQ7kurJu4OyG0dqKmsv4HtRR28gt3HBC11ogflBUcUbGk7sF3p1I7TmAqbA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61e506b8-1729-4766-9442-08de88d136d9
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 11:42:08.4706
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2XcrxBBKu7tFx24DkevGioMd88iYWjmXivB9HTGTgmt7aWP9cUyJX48NuMRLx4s7fc4Ma2jCuZOyRZ4jy+WKUDGprZIn19MmTOGr3SufRU0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7763
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA5MSBTYWx0ZWRfX8ryyqfpsYGrN
 YsIXE3liFuNYJM2RVpKt3RzHIJtj6/9NtbZvoThwbIVdnZV9VeIODfb2TI1tp5VQyG10HDuzJem
 9/Hnv3y+2G2jychgKzPlwwjqmosjkueOO8G3jrnFXQaFIWuXLhKGf1G83JS5W3IZtjwrao/7bT5
 I7Cm/K03rs96WXfB+zVkwXewdnUkCxNV4st0c2lqwb/xKJBgEfNSleseIlh61RhYhPzn/ClXFgc
 IqwRXQS3fsNvHSrL2U9Im0tCr+mrhgos7He//xdCqIe8dphE9VQxY8tGWpLCTjKUDmuEIFSac5P
 AyYBCvA75BTtv7506G5O5NcD90kDhYeHGctYXxKyT+VBZ8+y6hjyB33BL8WsrnYhx6t1FO0Jgni
 Pa8OPsYCFN8VC6FIb0I1vLnkzfoHchHXdGNgMXo9y85UJub+vyYPKA1cYbiRNqklyqDWH3cUJ/Q
 jx/Dnf7j9o57zxBbPig==
X-Proofpoint-ORIG-GUID: plRT7uzJmcOZmQ3kBJGfoWhuVdOe7IL9
X-Authority-Analysis: v=2.4 cv=Scr6t/Ru c=1 sm=1 tr=0 ts=69c12713 cx=c_pps
 a=ayBBURk7jZ4GzqZFlR2IhQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=O24Aq5uEAAAA:8
 a=t7CeM3EgAAAA:8 a=zRr0LGfZ5qhMSheOc08A:9 a=SYBONWESK5muIIdMMRMZ:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: plRT7uzJmcOZmQ3kBJGfoWhuVdOe7IL9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0
 suspectscore=0 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230091
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Mar 2026 11:42:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125504

From: Zhang Peng <peng.zhang1.cn@windriver.com>

ChangeLog:
https://gitlab.xfce.org/xfce/xfce4-power-manager/-/blob/xfce4-power-manager-4.21.1/NEWS?ref_type=tags

Add patch to fix absolute buildpath in generated enum files.

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
---
 ...splay-full-path-in-generated-headers.patch | 34 +++++++++++++++++++
 ....20.0.bb => xfce4-power-manager_4.21.1.bb} | 13 ++++---
 2 files changed, 40 insertions(+), 7 deletions(-)
 create mode 100644 meta-xfce/recipes-xfce/xfce4-power-manager/files/0001-build-Do-not-display-full-path-in-generated-headers.patch
 rename meta-xfce/recipes-xfce/xfce4-power-manager/{xfce4-power-manager_4.20.0.bb => xfce4-power-manager_4.21.1.bb} (77%)

diff --git a/meta-xfce/recipes-xfce/xfce4-power-manager/files/0001-build-Do-not-display-full-path-in-generated-headers.patch b/meta-xfce/recipes-xfce/xfce4-power-manager/files/0001-build-Do-not-display-full-path-in-generated-headers.patch
new file mode 100644
index 0000000000..fa401fd977
--- /dev/null
+++ b/meta-xfce/recipes-xfce/xfce4-power-manager/files/0001-build-Do-not-display-full-path-in-generated-headers.patch
@@ -0,0 +1,34 @@
+From 3f69abae74f4c0ad41c8fa2886148db834ddb9f1 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Ga=C3=ABl=20Bonithon?= <gael@xfce.org>
+Date: Mon, 16 Mar 2026 16:46:52 +0100
+Subject: [PATCH] build: Do not display full path in generated headers
+
+Upstream-Status: Backport [https://gitlab.xfce.org/xfce/xfce4-power-manager/-/commit/3f69abae74f4c0ad41c8fa2886148db834ddb9f1]
+---
+ common/meson.build | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/common/meson.build b/common/meson.build
+index 7f71309f..cdae226f 100644
+--- a/common/meson.build
++++ b/common/meson.build
+@@ -37,7 +37,7 @@ common_sources += gnome.mkenums(
+   install_header: false,
+   sources: 'xfpm-enum-glib.h',
+   fhead: '#ifndef _XFPM_ENUM_TYPES_H\n#define _XFPM_ENUM_TYPES_H\n#include <glib-object.h>\nG_BEGIN_DECLS\n',
+-  fprod: '/* enumerations from "@filename@" */\n',
++  fprod: '/* enumerations from "@basename@" */\n',
+   vhead: 'GType @enum_name@_get_type (void);\n#define XFPM_TYPE_@ENUMSHORT@ (@enum_name@_get_type())\n',
+   ftail: 'G_END_DECLS\n\n#endif /* _XFPM_ENUM_TYPES_H__ */',
+ )
+@@ -46,7 +46,7 @@ common_sources += gnome.mkenums(
+   install_header: false,
+   sources: 'xfpm-enum-glib.h',
+   fhead: '#include "xfpm-enum-types.h"\n#include "xfpm-enum-glib.h"\n\n',
+-  fprod: '\n/* enumerations from "@filename@" */\n',
++  fprod: '\n/* enumerations from "@basename@" */\n',
+   vhead: 'GType\n@enum_name@_get_type (void)\n{\n\tstatic GType type = 0;\n\tif (type == 0) {\n\tstatic const G@Type@Value values[] = {',
+   vprod: '\t{ @VALUENAME@, "@VALUENAME@", "@valuenick@" },',
+   vtail: '\t{ 0, NULL, NULL }\n\t};\n\ttype = g_@type@_register_static ("@EnumName@", values);\n  }\n\treturn type;\n}\n',
+--
+2.34.1
diff --git a/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_4.20.0.bb b/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_4.21.1.bb
similarity index 77%
rename from meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_4.20.0.bb
rename to meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_4.21.1.bb
index c6eed849be..65b8f84e27 100644
--- a/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_4.20.0.bb
+++ b/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_4.21.1.bb
@@ -11,18 +11,17 @@ REQUIRED_DISTRO_FEATURES = "x11"
 
 DEPENDS += "libnotify libxrandr virtual/libx11 libxext xfce4-panel upower libxscrnsaver"
 
-SRC_URI[sha256sum] = "971391cef63352833bdd92df28957392e17e1f2b3d486c0f57294fd204d6ed29"
+XFCE_COMPRESS_TYPE = "xz"
+XFCEBASEBUILDCLASS = "meson"
 
-EXTRA_OECONF = " \
-    GDBUS_CODEGEN=${STAGING_BINDIR_NATIVE}/gdbus-codegen \
-    --enable-panel-plugins \
-"
+SRC_URI += "file://0001-build-Do-not-display-full-path-in-generated-headers.patch"
+SRC_URI[sha256sum] = "bb89be7b1be431b29e765e2c632e98fb20a688e495e4ef18495bd70c1524767a"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'polkit', d)} \
                    ${@bb.utils.filter('DISTRO_FEATURES', 'wayland', d)} \
                    "
-PACKAGECONFIG[polkit] = "--enable-polkit, --disable-polkit, polkit"
-PACKAGECONFIG[wayland] = "--enable-wayland, --disable-wayland, wayland-native"
+PACKAGECONFIG[polkit] = "-Dpolkit=enabled,-Dpolkit=disabled,polkit"
+PACKAGECONFIG[wayland] = "-Dwayland=enabled,-Dwayland=disabled,wayland-native"
 
 PACKAGES += "xfce4-powermanager-plugin"
 
-- 
2.34.1


