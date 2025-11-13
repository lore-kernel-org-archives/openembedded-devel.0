Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B083DCD4F4D
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 02:59:24 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15569.1763002757998408218
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Nov 2025 18:59:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Q48dr6Cw;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3412a946d8=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AD2vgQi114160
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 18:59:17 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=+JJyJwgi6FmhuxS0f+6DqFydVPpKRmqhq37Aw9QHYlU=; b=Q48dr6Cwn2ri
	jVZhcddPGSwCUvWLkM2b0r/TzES4KLpPykkQFN52BX1V3529FRsdBjk977ztwm6+
	0WngjZaN/cPxP9mmnKJuS8SvwR/a3U/nBN3RGQWwbhrKlkrMivKrdhwVFWRXoJc9
	NzD9lakrrQ0XX6E0q1OiifZcdQ8cTzS0RysqP0KYvxTP7nk+UWl+3uTxxg1vxwF2
	5A6fjVTJBq22snS0BDoaepbNKGa38irt1U+Fh29j3zR5HelpSOreZp//kpv5Gz8i
	Ig9H4idAZ4C4atwQ+zHlqKNJEVsa2PPLC6unyd5Vb2ElacoldJ3tFwYDq9YkB8BD
	WjVrCEzPAw==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013009.outbound.protection.outlook.com [40.107.201.9])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aa2136f2n-5
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 18:59:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y5TjoXKzTbKYAodiAQPbNfBvQaL7oVjfOWdTlEGAB/ikJaRabA3Ubxv1WIksQP3UAWhTOx0wsa1wIUkJFIpBYZfTjNl6kKTcDsxlxFjzX5YCuJRgIEPN4lWc34z8//m6pdhuoYKioM0U1O67qvlYHNObANLs/uGauc5ilrVunw/mpzNw+mdjPJB5C5SbmhCQ/84kk6e6l3ve/RWKebi03L90PoQh+c09OMP96diwX/uygmlxFEyVEVrVdZJpEXuqeT5RMaa6jtdW1pWmYBJHl/Kj29vQGL6kxqtIfkIr2jxlWELnZNTS/vHixlIN77G76B8sJwxFgZszzTxJyWw6/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+JJyJwgi6FmhuxS0f+6DqFydVPpKRmqhq37Aw9QHYlU=;
 b=lEix5twNxE8z5wfuJE7E88qDAdKr+OdyTns5gBR/4Nz/MKKbtDtWhLEM1rK6TVZ5iDU7LtKCH6hSySXd2r/f96bGA50xESM2TbzCvA2yfrP2pUiHQCTMbdVQ8Ib5P3wuzHNU3xYt/TAWfpA8xbcg8/1hXbUQtfgU6QsgDtIREs/+vmSnsFokELSR4TJLV7lBbQvbZYXIJ0ZmQ3Ecma8jzuL9jr1iE3O0vXY/Zegp01iCye65esW07JvOS0V0RjYgAnzYgvEvnw7dIRYnYHbuycwPxZIzZaAmxKYtyyvv38Y5Gm5oWn75PgUyYrDmpr/gO+ro/Q7C64oYQ+X4KSOrAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 PH7PR11MB7570.namprd11.prod.outlook.com (2603:10b6:510:27a::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.16; Thu, 13 Nov 2025 02:59:16 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 02:59:16 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 06/11 v2] python3-pytest-cov: add UPSTREAM_CHECK_PYPI_PACKAGE
Date: Thu, 13 Nov 2025 10:58:50 +0800
Message-Id: <20251113025855.1520038-6-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251113025855.1520038-1-yi.zhao@windriver.com>
References: <20251113025855.1520038-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY1PR01CA0197.jpnprd01.prod.outlook.com (2603:1096:403::27)
 To DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|PH7PR11MB7570:EE_
X-MS-Office365-Filtering-Correlation-Id: 7df322b8-0b08-4e25-4aec-08de2260a1b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?YT2Y7qLQKkLTA0aDydg008k1m/DdTOKopmA3t6pIEQBCJSX6KHAL3BPfoAyA?=
 =?us-ascii?Q?v4dgFRjB9tlGGR0h+KKe9NsJAu/Bm8UquwC1HYKJHD6VKkkug0S2g5DPxUdQ?=
 =?us-ascii?Q?iIWvBPFLQg5gQHTR0bHwVuh6mbZsd2bkPLxy9YoKk8ZqBv+deuo+UnBU20oE?=
 =?us-ascii?Q?EUnNZt0+PTo6vuneYZ7e+BInI7BPqy3gizNeXSlHr4SgMy9UpuNilJOaRa1Y?=
 =?us-ascii?Q?yV/HdSMGyYSim+SE+60tY65eXRA8v+agrrMqRR7I6seiBMttMBgrwDZed+00?=
 =?us-ascii?Q?iPJyVNFNJgtZTw5GkqRDCcm5mBfRhlaxKQxTfIhEwcUN8rtciUS7yMMQ4uex?=
 =?us-ascii?Q?x/3+n+z9ZL7wIZIAshqVNjJUuwjJ+vU8y8DHyygRekoqHzlUWRa1c611wEYn?=
 =?us-ascii?Q?0elJjoFxL/7V2Ohg2GS0rYyGqsNcra8jar7olnRHZ2sBu8Y2do7GbIxucXcV?=
 =?us-ascii?Q?BmnjrmoN7pWbcgKTBTNI20RWVOk6ddjtqfEdPOjabHHGfbZHuSfqSqtKdDJx?=
 =?us-ascii?Q?3UwWLbxqaH6LgsJrAItj4MBPIiJwgdwnI7ECb4PJ4z0n5Q/BoTVdMmJdETg8?=
 =?us-ascii?Q?peu/1h4Yy68olrpV2UlXj/tVOvZ3zu0UmVFfIYaqRlQ/wFquosunEWNjN8mL?=
 =?us-ascii?Q?C21NQSmW4wvvOzauBJPP7JL4z/gIxg5cPrlczGq7eKSIpUgtizUYlUKMgXwz?=
 =?us-ascii?Q?ERN9H1F4YgM7MdVOUng+NuFYfGRJegwFKwM9jybXsGPfdEpJiKWCPkEUhwHD?=
 =?us-ascii?Q?UXGhFdI1h+1w4K1D6f51PkTDL4G+NzLPCPl/CVGypPqtv9hNCpvLQFwcHdwS?=
 =?us-ascii?Q?WNbgFCiOPiT6VYscVOxj/qt2Sqdf5p2lqeH0J/6zGP10sZGDTg48nBBSzObm?=
 =?us-ascii?Q?ecwofnSS63PXvkVND4EM7jbZjCfkNCPMQwoulkgpLLryixr27EQ2g4DhHKZq?=
 =?us-ascii?Q?tkQDRRYpJRJZdUSmUVJdAhmPxE73Oq1mnRc1o3pGgJqgGRV/XiItZUYGf/Qe?=
 =?us-ascii?Q?UEFX6p50wc+/k6b+AXy8A94MSsdeh0I1eYzkb4ASz9jb6Cf/VD+Ojhpn8C6S?=
 =?us-ascii?Q?kEcl/WtNKzMf1qno9xNKr464Q8t+6OcyEy4apF7it50k1BcyzWJ75ogOkpYj?=
 =?us-ascii?Q?QdOcT/TLE81e06CggvSu2tbDX4d6OHhKxjpamjtpFCMHMEqA+3JGmnFGcFQM?=
 =?us-ascii?Q?QyG3DCNSt4qrtwWhPlAe63jws247Uu77QBBJFWu+1elT8X4znSH4QOqvuJta?=
 =?us-ascii?Q?qXEaTcs5YTNtCNR4arSQmettpH4vUuuBCqLVWdFJSNtomdMetmbV76Uxl73e?=
 =?us-ascii?Q?e5Lmgx31PPlzn6tSdVE0RaIE63T9vnX5wTYhGu8wIDMBBvT1T0fofrEICbZx?=
 =?us-ascii?Q?t8lZN91jFcixRbStTYzMs9jGgGRB6M2cvPUZZgKiCb8K/HuVtAnWZxnvj+KQ?=
 =?us-ascii?Q?L5iDRf870JYCMza1oZL16Xn06zOzR14ZLXgOrwB8KzOdIQ7WgZLm/5H5RcIN?=
 =?us-ascii?Q?3WGyIOmL2Gj3HJEp4e17nIbnLq1+FHWtTtXI?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?bM//c/1h7/f0HTsUtsEj8jTYFXVDdqvrfyw/K4L8MCiDJ4Vf5nFEY865iwEQ?=
 =?us-ascii?Q?z8/HAnenc29I5NdCgO5NTwmA06fp2jl5r9kZ3Pm5BXyBaVngBGBebhs72+0W?=
 =?us-ascii?Q?B+278TAnBocoJz5eMNf/Ja3CDMQ2N4A9RtfsNRUWjwJ3gb07j7mSeW4NWFMP?=
 =?us-ascii?Q?ofkfpoLtQNP+vxBhBx8zC1xeuXINaJI2CXhHL7T6dcVWmYhDaSlECSUzNkv3?=
 =?us-ascii?Q?n+1dGCsLQkCgMquNFk7JgA22cvIlsWQhs5XX+sUiQAqpamsrJYjAEkPBNP7h?=
 =?us-ascii?Q?9YfRbV35TGgWgUx9rqudayGaJmGkYh++7dwIYcByzoeTI9uxQ2/Yx56w3rsz?=
 =?us-ascii?Q?GbHoio+5ZYWa700QbH3KkCQTx0fBBzlLjNoEXGB2Rlkdyi76t519cZ3zdSn9?=
 =?us-ascii?Q?R7ljmz931bnbR1puv6vnTV+PhdnOcCN2AC0ExnGlJDhlqBba+/Rtd1fAx6AP?=
 =?us-ascii?Q?Sqw3RL3RaYqKHzWOxd3I93UfmSmdA5kqnNUvYxy/lqhn/a1KE5KD5/5w0+we?=
 =?us-ascii?Q?ohHybVBvoGoioLC+0MQ8HMFZa6EVKHHfmWZlg0GLZDQMWiCyBMOKMyzGR1Oj?=
 =?us-ascii?Q?oWbFYPqEeIeWHKtIhnTsk4xT51I/+3S4AUO6u9evbRbZG/L9EQUNRJiYIry4?=
 =?us-ascii?Q?1+ylsCYwWbhFziabAWNVB99UjK1rLftM8q7P8/VZZeKx7gShHYeTzCW9zDDM?=
 =?us-ascii?Q?rR5JTd01aT2Q90OfNf5B0WKN0RRFpU6YrqWFpiRtQfQplWinkuMsXQkjXoVn?=
 =?us-ascii?Q?SZCkW43MYnR1pE8zvTTKsuLA6JgRfsPIRay7p5dj5Cid0RpUGLbgu4HqEIhn?=
 =?us-ascii?Q?2O0rxEi8RW2AldObMR6/OBhemceBIUUHlOWatKEPGcAhbYqklHIF14wYPaaf?=
 =?us-ascii?Q?IpX8cB7ULrS2V2lzPqj+8F8S1V3HVDxGCNlMUufXRbvaNRc2x+NMCrXECv0j?=
 =?us-ascii?Q?i0ErP0gVqo9uTghyWNE/9cDA5itsgE/KQimaf9ULgmT88w0igv+n8zc7QEAe?=
 =?us-ascii?Q?gSgvmOw5AoQnZ0iCt4vOjwp3txoMa2gXh9TOj0PCm8PMypF/AfwnGogKLp+r?=
 =?us-ascii?Q?R6J2dG9Mlx7+6TCo5TGBNYcVECM3df7bVHv78nlC11cyppF68d/ji/RlXlwD?=
 =?us-ascii?Q?q2+H2RNlYiSyM1I8idRTnuClxSfKYd7oor2LJG3KqbWXvFdctRI00PN9N/Kc?=
 =?us-ascii?Q?qTlETrzCpJ8fwN1tQ0WkqiVj5VFM85ZI7y3fyfbY6b6UVY/iP63wX2olzX3g?=
 =?us-ascii?Q?C4lEMUwgJk4OE3XqPlMCjxWilHk8hE1o3R7xMdOCXq0bhROwgiiF6yTNenOv?=
 =?us-ascii?Q?bXvzamrQsZaF183Y+TGN1ttOp4a4msWESMxUqeDWkl3HxuHCWDkcb2gRoWhC?=
 =?us-ascii?Q?UZD7gFwRP45EuWW+GpON6S9XCYTruK0A7F7jzl0Yl9YpzqkJSvwbFs6TQgkA?=
 =?us-ascii?Q?P15IaLbbNYN0EhJ31OQg0rzve2RSIUmZMO0kWel25xkEYPGOv4DWOuYQVk+s?=
 =?us-ascii?Q?OSS7WFkPMRcO6s2V/FqInQB5Z0d3JKpLP0pe819AQYVUXX7ZVOR639HiYMQS?=
 =?us-ascii?Q?JKmC4T1bxp9MMqMM8Vrju6Ra0GSfCqFEckHTlcIB?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7df322b8-0b08-4e25-4aec-08de2260a1b3
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 02:59:16.0931
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kZLNsGeqNcRij1LrUQknE0WnF1flM06++uWzhxf9vmzs97mN8r4mOXnhoTM0o9r2tv0iDEnqaj0/Hxi2ZjE6VQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7570
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDAyMCBTYWx0ZWRfX60fZm7+cz1Be
 xftIk6ZK6G88L6EJS6YwOjQAEsLXapEQgUtx/1EDjIovY4kDud5I2r+2SUfxjBwOZ6wdB+jMOl6
 NDCN9DNuI/piVoqBAldyNgjotSUzS/XB/h/4EpmyQW6o/z0EK+QQdV4iIUsXvWPaAHg7loiIVdW
 ykFr+G0epkgQEGzyYEgmxUi3PsP1OOHbNgPKdhwbzLYN5oiocwpmTix4i1gxCYpsJFeqEeN+3Wk
 6+mp3U3eoghPIumkxn/TPmgZhbjs9HyoVnXzZRouQOBt+3WUby7ctjk0MNIBqQ8INwlaA/fQBB6
 8j8IlVPP9+3N+tYnEM2RUi7c+tmCnRu3qiCzQO5RP5O4EKrk3YMn+yiLNH8XaxwpCeZ0cE3bfk2
 vlDU0D91UHcmfaDTVleEZpkwwof6qQ==
X-Proofpoint-ORIG-GUID: iw3JcZbqE7HZ5N_841dokYMtSmmeNWej
X-Authority-Analysis: v=2.4 cv=XPA9iAhE c=1 sm=1 tr=0 ts=69154985 cx=c_pps
 a=xBk5Uq5DOFf1FlsSGvIvFQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=pxCkoswmnBmdEb8pTFAA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: iw3JcZbqE7HZ5N_841dokYMtSmmeNWej
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_06,2025-11-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 adultscore=0 bulkscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511130020
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 02:59:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121590

Add UPSTREAM_CHECK_PYPI_PACKAGE to check the correct latest stable
verison.

Before the patch:
$ devtool latest-version python3-pytest-cov
INFO: Current version: 6.2.1
INFO: Latest version: 6.0.0

After the patch:
$ devtool latest-version python3-pytest-cov
INFO: Current version: 6.2.1
INFO: Latest version: 7.0.0

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-python/recipes-devtools/python/python3-pytest-cov_6.2.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-cov_6.2.1.bb b/meta-python/recipes-devtools/python/python3-pytest-cov_6.2.1.bb
index f3f4bc3e86..af4ce4b770 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-cov_6.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-cov_6.2.1.bb
@@ -13,5 +13,6 @@ DEPENDS += "python3-setuptools-scm-native"
 RDEPENDS:${PN} += "python3-coverage python3-pytest python3-pluggy"
 
 PYPI_PACKAGE = "pytest_cov"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


