Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E1E6EC01D2
	for <webhook@archiver.kernel.org>; Mon, 23 Mar 2026 11:42:13 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15350.1774266130538097868
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Mar 2026 04:42:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=XOVtdJ1v;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7542b98c32=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N5kqHG3731459
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Mar 2026 04:42:10 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=N2ytm2/R24h8QzXU2EIuzZ3b/Cqa2RzxuthdwIAwwRE=; b=XOVtdJ1v4zkJ
	YX5uILqPAhskDD08gegsOg0wFLickhjBoo/DW3zmpwSMaFn6004E5khktkkR7FsJ
	YtuBurLKbaECK592A/KjQTLZCkTJjuj66Ut9sHg0hFfYZS/+FgmQhM8DU9Nvadzn
	Gj3KR7v9rYrR4MSro3wNJ37pNXskdu3HnMxSA8r3XaijwysmcLN4i+loXZhuSIHE
	J4aKocMrhZPerdwfL2iBbMeGDQkhXgI+mG3BXrXj1tOrbj6X56SpiMEl/Ih0Wsfp
	gB7iCN8GoCvZHqZw/UJuNXyxtUOeaHsfG/3ZAXsRG74vKrMUcqhO29pEeSWF0/3Z
	CNkr+pYaSg==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012003.outbound.protection.outlook.com [52.101.43.3])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4d1pky9k2h-3
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Mar 2026 04:42:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ES7lJksDwIM7oky/zsMZ5ctm1vqBSQObvPrNJrQJEmuTQXMnn59DyJbiKNNoqVH8LHU0ykWOaholQXkeai6zjTGoCI/FW3cOCcmlBDNFT5slaWScAffs8ZBXa1uxo/4kYtDx8E2FVrIPK775xMd4MrTnwGYkH4Uq9SYFc4gmqsEPeVUyiDK7EYgYPd3xYkS2ofwvuDIb2zKPxzw3+gdeuIQ/sOWroFI79vgRcXQSmfHiwAiC9CiKS5uhZIrni2HEqY1MVIi9+LZBQjTAYsHgux3emR48bisI/MZLhlJmoeGnX4h+j8GF8YL85s3c5ZwCdtkORN8ec3/ZTTjDtIRoCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N2ytm2/R24h8QzXU2EIuzZ3b/Cqa2RzxuthdwIAwwRE=;
 b=VYDJGg82qdF6o9Rj8dnojyVOEsk5jKD5okBF5nTe6Bsv8bEXFQlk31CTgRCIdbC/2mQuLwNtM9FeqhU1PUZIlMhHGGQ9s0rOhKfDyFEZDJeKHa/p/idfhcd8s6hG16K76gX/r6HGl/rnwML5pRVj1Mb9L+5JgUctSlFkMHgnytcIT/GPvBllFCwoPHCcCKTNUJukJbh2M7YXswUoLIDgsRmSDyn098pqrvsy/evtM4xMsBpH7Psw7i9owS8ht2cySGpfpiUzrvZTVdJhL/wZ+hKWvJBoFG+b9lnPvxuOv3AeUMyoke8gHYp/6oBUpb/lf2T14n+lGX4tK6DlURwo+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by CH3PR11MB7763.namprd11.prod.outlook.com (2603:10b6:610:145::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.10; Mon, 23 Mar
 2026 11:42:06 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484%5]) with mapi id 15.20.9745.007; Mon, 23 Mar 2026
 11:42:04 +0000
From: peng.zhang1.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][PATCH 01/15] libxfce4ui: upgrade 4.20.2 -> 4.21.7
Date: Mon, 23 Mar 2026 19:41:38 +0800
Message-Id: <20260323114152.4178269-2-peng.zhang1.cn@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: 4f8f8a15-5dfa-4bed-e648-08de88d1349b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|1800799024|376014|38350700014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	c1rrdXV9cbdZxEovbSS06tbcktYSMqulKP0m+DL6y6VQB1YdGT/QInaMdmMkIU2KKH1mKpc2HLG/xzAczX+pPtctfx6UWphllb1Wp7NC5Bw+fSkd5E+pFWRhIWACCuosPeOI3O2vlgvaeyjUlL0jZiM8Uo9gyfDb0hqaL+2ARtIG/hfz5k+aNCFmoAJgbi5R5ROlGdHMNtiHTsaE/ypQ74PZHALsiaYrSGsNgGO9fOLzO/7B2lnzwUX0ha2NEM8KLvzNJBMPh7Xzzey4thMs2137c1xwwJOcxs2uJH1MaXcb5+BGpKCGwVb4fWtMPPGlcZ5Zt/SSbKFfkg0i+N2e6uLvRNBfc84x4VojqpYTG4N1gf2WwsJeLabDAHQJyyvxtrMbb9Qp0Qo9tXAGjpHl9HDWRQTfM+/Ums8O6xn3vs58NS3J1UPWdMy5yytvn2qwxSjVvMZ6puumNdUQeRjGnEOBr1YopyBYZ1pFUdoYfbto5/ESCX2y4PO5ro2/+hqYeqBHY2+xUNBcB5IlFjk0K0Ca8KGgWBNM0BlfLCJI4l0miDD++ue+43GSFsv+FC3EN7YPma+ZQ3ElY8V8mrp0z75Iybw/ne4awNztnkimsdzO4qbU5f8p0ks9E5IlF69qzX7KvGSkaXH4l2Z6ZuDOxCpXBwTDzQo6ZHqFMuEgm2ibC19cLflMjM6Ypntas1ak3JE351wJeZJ4EfJo7PY2beMxJT8DAf2jmuQ5piIcnb7mvro66shQRKzJOHZIv3OY
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(376014)(38350700014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?zy5AlfKO7DCrWfPxQzRV0i/fI/PHKHNDPPdNftpUv5nZecFgLyHoBvXyBNyO?=
 =?us-ascii?Q?paz0Z79DBk2jtwuDJpQHdP/yH0VFOwYYsKACfeOutwlTveDXpbWRu+mpZAP9?=
 =?us-ascii?Q?tekle6enGkjqlMpDuHfB84djtdJ8e8HBlQ/nf31BjIoAxDs13DPHE+3wPzmx?=
 =?us-ascii?Q?/gx3RX28/lZUAuFEhJzsIZ+S6bs9cpxCRshdhoGzSyejKXkKpqk3KIet9Jmv?=
 =?us-ascii?Q?Rn2mjEdSBPJfxosYoIqHROnQXTGhCaj78ReAxUspZUAd3dM/CLmYLlFJ4ULm?=
 =?us-ascii?Q?SO6+dDGsxORXfDSTELLMH6oXoOygcBpcuDvVJbvd/M8lCYadiaOxSqCnLyqV?=
 =?us-ascii?Q?fXFlSYjbGq4y32m+cIWO2h6lXm1f+ctYfPWfObkVVdK+D6X6/Jf+I9UhHDlK?=
 =?us-ascii?Q?FGYpOSLfg9PkFDfapRj1kWZ0+C2r4/Ioi5uKMaT9lTCfUBVeWsyq3XIpu9TH?=
 =?us-ascii?Q?Kn2VnJ+lye4yVaCRmC2meZtIrO624uOnyoo3V4+I+2/y5erpw+WUWCmq280a?=
 =?us-ascii?Q?/gO7acb6k+8Y7mreNp4U54EKuKuChgwumcqnXlsO3nERVNqe8Opw+/R+g1Vr?=
 =?us-ascii?Q?YmMejUmQZpVAxaq2bvlXE2QJfr2Of8lVgD7ce2Kv6nEFeB1Iy8L9l8gcROS5?=
 =?us-ascii?Q?6G5YUAai4oKHt/N2PsblXr9XJqIrGgYPeJRB0j5cZMusZm6NbpZK9ms9qeXt?=
 =?us-ascii?Q?EUzDxZZBrbQ98c10BTPnxjjjakxmoLZz/WjtW288cqtERe2jkANcM8wGPygc?=
 =?us-ascii?Q?0E6meJsBRJ0GYIaUVcBo+sp+tUylRVTgWS3N7fPGgxgWA1kOWVotGHFzqd93?=
 =?us-ascii?Q?pmXUnhYIC2qsMKIKhBdkbHeLi7zw32C7k4JDn/GR2oNJK02J2J/vOE9tBRBn?=
 =?us-ascii?Q?8dnsAbjDfLEnYu1hMADDBgqb2rHv4ObY8I9mjuhJ/6uivarzZMz/iuUc5LnV?=
 =?us-ascii?Q?KbUY34OWCdDXwyNGU+ajaSdKaA9i5Rn4oqfA/U6TfeF0S6WQzYhnaeoUZ3oR?=
 =?us-ascii?Q?ERd6eRBOwSsPmtRn2Ikm5FZ4RJtQwrueTfBtaOXxoSdJDDYZMVrneDA0M04c?=
 =?us-ascii?Q?T8k2fESkDakntZjyLSMn3nJcBlmcK3DoGuwVr/gn3k56TSr6BzCoI2U2cmDC?=
 =?us-ascii?Q?qmIZPJ3oYK0wTm/AXgU5pIsiFy+oBFXyri33K/aN3ubHSvLAYJJhrWU0VWu8?=
 =?us-ascii?Q?s/3ICCXNnQXXbvjLGMfeP7fJDVtH+Nggz1thiNY6YAJjtAXOoe8Sa6UUEIUM?=
 =?us-ascii?Q?nKKUy7QAum+SBGOOcnRrJGZBrNyfnj7+0WVYGXz4HWK/S/ONUcjWwmXea3E/?=
 =?us-ascii?Q?J/+HAjpixncnKlaypvjCh1svhQJfwL4zdwipCWpjH0lUgJ1fNvwfy6SUQuq6?=
 =?us-ascii?Q?4VuAAsodvNWLtrafYeUtbjJWph6RlhXPKT3nyka4PCJ7L4KrkKt+UGOvTLF5?=
 =?us-ascii?Q?6XXRfvxwnzmIF0qxw+v5n5T0bXcPgQtTRW6ZXPkorizoj8gdWvFp3I+RURYv?=
 =?us-ascii?Q?77hTRnsXSIQhwo//zNPjufzU965tkC9HW2RTcOO108LlH8FjPeQnqh/jZlKw?=
 =?us-ascii?Q?LOPhfQZ5UeY5Lw+0+ZF03OGU7miRuDwZDSKU2saShsUN+7n/+kI4kWOSUqXU?=
 =?us-ascii?Q?zeHIb0lczCrIbype8msQhkfpM1YQCsZ3XoO4qpeRMVzuek2EQ4eke4S6IbpX?=
 =?us-ascii?Q?AZAMRH4/YOc6GjB7fZmJrxGEunx+07cWFDdprH4fV7hCINgGMCCtLhbsD4ah?=
 =?us-ascii?Q?PtbcyFW5OXpYJmYcK6wjR4u7LrXRQNs=3D?=
X-Exchange-RoutingPolicyChecked: 
	CXksiD0dZNnrL4Xd4gtawRQznOtXRkRIuG6CGLe2s1Cc4eH1moS2vjirv4HvbYwTp1ssQtfWJTzM2HsSgqFIHVDnR12biIimEkxYBQL4zZJhKK2M9UJYYHf0+iExUQXvazLwt1pJaj4YOg+Xdb4Ut3AIYznOxw14Ln84+0AzOxmkYjvuObRmMjzCM7TNAARazfkbLpVyc2h4HPijgSdcL7HXjP3CZ9/iuLu6rCJvoFgTGFW9zgSJtpMM46m1tA/b/gjwtXC5aIVtB4QFcmL1dAYQsKZ2aJ0yl4FgM4M5bBdjxntA7obm7arjrQ+y+gtOffWBiPNJ5BSnn/t6XckGlw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f8f8a15-5dfa-4bed-e648-08de88d1349b
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 11:42:04.7331
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6WuP3xGXdBp79HsUBcumnp4q7YBoorWmKdBWfvr450Wj2nCkeCc9wJwcZhlVyw64tRkBELAy4kLUWSKV3VcFs93CNaeSk6S/tiVKFeEUbSo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7763
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA5MSBTYWx0ZWRfX09TJWAsTmkkb
 3S65XtWGL2wHBe4hZEtbZ1KhH1lQ1mojJ2RfmYlUad7KIsIqSS7YzsjmwJUR1n1lJ9RveQHC8FW
 VLAHbjIqDXDbKDclZSf8F49BtSJN82vgZXeBO2n2JqTU0IZH4XcqMS9T2MwIamFeKM9KSg1bBtN
 C2o9xcqFselj3HJLovSPu2wbg/wwGWxbJt4IjY8ZxlfRsYbXpJvEm/zd+EYNZ44IH+pOnB4yERA
 YV/CDXpcK69pBzZkuAux52jFTYNYcqGhPBu7+uLC8XhYzHiGKd80qx0ltca4rlSFbxP4R+lDzW7
 sy7yrm8tqucwLQ/Y2hDKixFWj3yJvW4GQ72U8V/YqjMlCIJtwj8ukLxEWG8Ga/6w/tIOn1g9h5+
 qcfVoRG6nTEG4fQobVgJU2pgPjGHQAYJ8X9vhiI4v2W7ikRUAMLETLFMXkF6GSYCzr5xPBY0fhD
 vWUnhurhSMb0KPaGiNQ==
X-Proofpoint-ORIG-GUID: Ln7GExjNRMRsdEfcgOZpj9qi-RoX3fwt
X-Authority-Analysis: v=2.4 cv=Scr6t/Ru c=1 sm=1 tr=0 ts=69c12712 cx=c_pps
 a=ayBBURk7jZ4GzqZFlR2IhQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=O24Aq5uEAAAA:8
 a=t7CeM3EgAAAA:8 a=Sn6jEhcweQRtqmlGX_EA:9 a=SYBONWESK5muIIdMMRMZ:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: Ln7GExjNRMRsdEfcgOZpj9qi-RoX3fwt
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125506

From: Zhang Peng <peng.zhang1.cn@windriver.com>

ChangeLog:
https://gitlab.xfce.org/xfce/libxfce4ui/-/tags/libxfce4ui-4.21.7
https://gitlab.xfce.org/xfce/libxfce4ui/-/tags/libxfce4ui-4.21.6
https://gitlab.xfce.org/xfce/libxfce4ui/-/tags/libxfce4ui-4.21.5
https://gitlab.xfce.org/xfce/libxfce4ui/-/tags/libxfce4ui-4.21.4
https://gitlab.xfce.org/xfce/libxfce4ui/-/tags/libxfce4ui-4.21.3
https://gitlab.xfce.org/xfce/libxfce4ui/-/tags/libxfce4ui-4.21.2
https://gitlab.xfce.org/xfce/libxfce4ui/-/tags/libxfce4ui-4.21.1
https://gitlab.xfce.org/xfce/libxfce4ui/-/tags/libxfce4ui-4.21.0

Backport upstream patch to fix full buildpath in headers issues.

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
---
 ...splay-full-path-in-generated-headers.patch | 36 +++++++++++++++++++
 ...xfce4ui_4.20.2.bb => libxfce4ui_4.21.7.bb} | 25 +++++++------
 2 files changed, 48 insertions(+), 13 deletions(-)
 create mode 100644 meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui/0001-build-Do-not-display-full-path-in-generated-headers.patch
 rename meta-xfce/recipes-xfce/libxfce4ui/{libxfce4ui_4.20.2.bb => libxfce4ui_4.21.7.bb} (58%)

diff --git a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui/0001-build-Do-not-display-full-path-in-generated-headers.patch b/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui/0001-build-Do-not-display-full-path-in-generated-headers.patch
new file mode 100644
index 0000000000..d04f62193a
--- /dev/null
+++ b/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui/0001-build-Do-not-display-full-path-in-generated-headers.patch
@@ -0,0 +1,36 @@
+From b8bf147d621739a1b8a4d1cc8398d1c90288e9d6 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Ga=C3=ABl=20Bonithon?= <gael@xfce.org>
+Date: Mon, 16 Mar 2026 16:21:51 +0100
+Subject: [PATCH] build: Do not display full path in generated headers
+
+Fixes: #144
+
+Upstream-Status: Backport [https://gitlab.xfce.org/xfce/libxfce4ui/-/commit/b8bf147d621739a1b8a4d1cc8398d1c90288e9d6]
+---
+ libxfce4ui/meson.build | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/libxfce4ui/meson.build b/libxfce4ui/meson.build
+index 8cac84eb..ca5ac927 100644
+--- a/libxfce4ui/meson.build
++++ b/libxfce4ui/meson.build
+@@ -102,7 +102,7 @@ libxfce4ui_enums += gnome.mkenums(
+   install_dir: libxfce4ui_install_dir,
+   sources: libxfce4ui_enum_headers,
+   fhead: '#if !defined(_LIBXFCE4UI_INSIDE_LIBXFCE4UI_H) && !defined(LIBXFCE4UI_COMPILATION)\n#error "Only <libxfce4ui/libxfce4ui.h> can be included directly, this file is not part of the public API."\n#endif\n\n#ifndef __LIBXFCE4UI_ENUM_TYPES_H__\n#define __LIBXFCE4UI_ENUM_TYPES_H__\n#include <glib-object.h>\n\nG_BEGIN_DECLS\n\n',
+-  fprod: '/* enumerations from "@filename@" */\n\n',
++  fprod: '/* enumerations from "@basename@" */\n\n',
+   vhead: 'GType @enum_name@_get_type(void) G_GNUC_CONST;\n#define XFCE_TYPE_@ENUMSHORT@ (@enum_name@_get_type())\n\n',
+   ftail: 'G_END_DECLS\n\n#endif /* !__LIBXFCE4UI_ENUM_TYPES_H__ */',
+ )
+@@ -111,7 +111,7 @@ libxfce4ui_enums += gnome.mkenums(
+   install_header: false,
+   sources: libxfce4ui_enum_headers,
+   fhead: '#include "libxfce4ui-enums.h"\n#include "xfce-gtk-extensions.h"\n#include "libxfce4ui-enum-types.h"\n#include "libxfce4ui-visibility.h"\n\n',
+-  fprod: '/* enumerations from "@filename@" */\n\n',
++  fprod: '/* enumerations from "@basename@" */\n\n',
+   vhead: 'GType\n@enum_name@_get_type(void)\n{\n    static GType type = 0;\n\n    if(!type) {\n        static const G@Type@Value values[] = {',
+   vprod: '            { @VALUENAME@, "@VALUENAME@", "@valuenick@" },',
+   vtail: '            { 0, NULL, NULL }\n\t};\n\ttype = g_@type@_register_static("@EnumName@", values);\n    }\n\n    return type;\n}\n\n',
+--
+2.34.1
diff --git a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.20.2.bb b/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.21.7.bb
similarity index 58%
rename from meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.20.2.bb
rename to meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.21.7.bb
index d485abc19a..a407b6dd99 100644
--- a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.20.2.bb
+++ b/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.21.7.bb
@@ -5,28 +5,27 @@ LICENSE = "LGPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4cf66a4984120007c9881cc871cf49db"
 DEPENDS = "intltool-native perl-native gtk+3 libxfce4util xfce4-dev-tools xfconf"
 
+XFCE_COMPRESS_TYPE = "xz"
+XFCEBASEBUILDCLASS = "meson"
+
 inherit xfce gtk-doc gobject-introspection features_check
 
+# libxfce4ui uses 'gtk-doc' instead of 'docs' for meson option
+GTKDOC_MESON_OPTION = "gtk-doc"
+
 # xfce4 depends on libwnck3. gtk+3 and libepoxy need to be built with x11 PACKAGECONFIG.
 # cairo would at least needed to be built with xlib.
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
 # TODO: Check if 0001-... can go
-SRC_URI += "file://0001-libxfce4kbd-private-xfce4-keyboard-shortcuts.xml-fix.patch"
-SRC_URI[sha256sum] = "5d3d67b1244a10cee0e89b045766c05fe1035f7938f0410ac6a3d8222b5df907"
+SRC_URI += "file://0001-libxfce4kbd-private-xfce4-keyboard-shortcuts.xml-fix.patch \
+            file://0001-build-Do-not-display-full-path-in-generated-headers.patch \
+            "
+SRC_URI[sha256sum] = "a72a7af39cf183819bcfb61b1747d425261e966ccb172b2fc28f1494f524bd17"
 
-EXTRA_OECONF += "--with-vendor-info=${DISTRO}"
-EXTRA_OECONF += "--disable-vala"
+EXTRA_OEMESON = "-Dvala=disabled -Dvendor-info=${DISTRO}"
 
 PACKAGECONFIG ??= " \
        ${@bb.utils.contains('DISTRO_FEATURES', 'opengl','x11', "", d)} \
 "
-PACKAGECONFIG[gladeui2] = "--enable-gladeui2,--disable-gladeui2,glade"
-PACKAGECONFIG[x11] = "--enable-startup-notification,--disable-startup-notification,libepoxy libice libsm startup-notification"
-
-
-PACKAGES += "${PN}-glade"
-FILES:${PN}-glade = " \
-    ${libdir}/glade \
-    ${datadir}/glade \
-"
+PACKAGECONFIG[x11] = "-Dstartup-notification=enabled,-Dstartup-notification=disabled,libepoxy libice libsm startup-notification"
-- 
2.34.1


