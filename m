Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04DB2CCFA13
	for <webhook@archiver.kernel.org>; Sat,  8 Nov 2025 14:16:08 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6269.1762611356380260618
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 08 Nov 2025 06:15:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=QAzvb2oo;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3407a683bf=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A8DwG5r1530814
	for <openembedded-devel@lists.openembedded.org>; Sat, 8 Nov 2025 06:15:56 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=ZFfwMB+BIqQI+nBN/ps1eS3GMrDN23nkUoPftvxa2S4=; b=QAzvb2oo5aQB
	dnl2ir6D5J9653LcD8J9JBd1vtPycMSqvoy34hGw4wgWP21attkfe9AGHHCsPgKX
	ZGSP4IFkUQFrirckpLLnompZIlykrcixjxePyfcrEyo1DxZANkUB6rRwepBjUeAR
	IfMiTqubxWG7uzb5l5LImtDYy70Zrz75JBWdRWkNeJx4zhTRZ+seA87XOfyJiXeL
	w45V0I5EiFNB1dQicR87tRlQg99svlLDi+uiq4C9+7Q1ZSPfnN9jVXzaqskoU1Ct
	YWm8NkuZ3ep8CvKYckaWsae4wGISb1C9LTl+7eaecL3/cuf573DcXBklKa4K6eqH
	ckWAsKBtMQ==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011011.outbound.protection.outlook.com [52.101.62.11])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aa21305ve-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sat, 08 Nov 2025 06:15:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ktQTEtM8FLiSHlqpLMjAi8lPH6V9hcL84/NRZw2UUGmn1+8sHXEyZ1TGzJS7is11N6rrHmeRoB+FgQQfCFgrBFs6wE1LQ4S3Zi0Quf++MHj6LiK05mbUsfo/ZX/8Y25LQn4Uyn5Q6uCan2LuWtP5Hl1BXFgPcwqirlHSu6BMTzEg0xUxAbrjbyosUenFNs2DJhFJ7u7bfWPI2pQ8zImPy2KrZmDuR+PW3Qcq6y4dO+4j2MyZ9N2IqVYavB6wqmoLLawWb83H8SfVHfp/yxp2+vMrpbh5NY4Dap/yBFjBdmJlPK0WrVqDjuxsxwQ4iX7Ppo3iIMQYydA7VzNboZdmvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZFfwMB+BIqQI+nBN/ps1eS3GMrDN23nkUoPftvxa2S4=;
 b=Qi0Zjf+V33fYkkXvB16bsunKNApUE2wxZwX+jTKpsxei41DRh0ImCfcSpsUOgWokGc7bxQScIgnCqByJk+MpnJyMDyFYnlMOjZbui6mrwUdMw3VuVDnJblAsHQPdvNR3+s8eQvA0yYCl0x6q+0Svkb/qZQl/Q7EkQADi5iHVPuC5uq7cf/lga1BIrl+7OXb7h792kkpufbSCEWy/vfOVgzd7cLgWX21K74OdlgSvz9SihSP0OKMAxIRUTzuNhqpFGrVZlfr9EP8ZyvKNig8pb5X/c6n4hY4yPi+5G/xPBTFxoER1Jp9bYoiOgDt26CRWpAAEsEDZrcpzumhgZS25QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 DM3PPFD5EE188BF.namprd11.prod.outlook.com (2603:10b6:f:fc00::f53) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.14; Sat, 8 Nov
 2025 14:15:54 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.9298.012; Sat, 8 Nov 2025
 14:15:53 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 2/2] libtimezonemap: add UPSTREAM_CHECK_URI
Date: Sat,  8 Nov 2025 22:15:33 +0800
Message-Id: <20251108141533.97228-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251108141533.97228-1-yi.zhao@windriver.com>
References: <20251108141533.97228-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0044.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::8) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|DM3PPFD5EE188BF:EE_
X-MS-Office365-Filtering-Correlation-Id: 7772e587-5bb8-4ee6-b45e-08de1ed151f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?I8d+ViA9ZWjnf8l1uWDB1RTGkMPEodJbyjE6GSoPFw33+SUQLtdstof39Yn2?=
 =?us-ascii?Q?iKMIeqqrXocmWKlStjptzdhsu8UPPcicaAfN+8x6Y4RG/0mx1rsJ8m89JR7p?=
 =?us-ascii?Q?TPKC4su+gUa1iMIR6nnzBVMk80gPKXV7ON17fe9H7RpdkL7M1effEZpiinkF?=
 =?us-ascii?Q?AHb9BQWuXW6vzPl7HwVWgaqQBEHvlEO43zSaChiCnoJr6g+qhyoRAScuDjGi?=
 =?us-ascii?Q?bkBCgRltJvZTlGubUu3oIayI3L2g4EhQfNmkdU0TgWE9LMz9dd47nwSNLac1?=
 =?us-ascii?Q?WH4IrwzlypJpdyO1gSzSJ2sqcFaVz+uiTg7m/9bftmWQG9MdwnaiKtS58QGg?=
 =?us-ascii?Q?LoQYUM3auvEnLj0RNDrVxPVseHeb4QygbfQO+i8rl7DSEHGU2Tt9GUHWTM7W?=
 =?us-ascii?Q?DacYk51a2mEpQXIXd4k7m555amyUMBTDNoajJDbjfKORSuy+PDED61pqOv/I?=
 =?us-ascii?Q?hZIzmGwsDyydTO5qd6VTvqcZ9/avl6FTp5jPpzzeOhedciGJsamgZ8m5zLZ5?=
 =?us-ascii?Q?bvOzU+QfWm4Q82+4LAx+eH2Xp/meNDDl7kESYPva0JJhIOCENXDKKOhRl8Zu?=
 =?us-ascii?Q?5HrWPfk+ckhDdwPNMOCtJai9EY3oCkoPjzYocUTmj9EOVj0yxPkIGcROq76G?=
 =?us-ascii?Q?FPS3m1Skzn+sC9FSBCSFVntiKuk5Ox4qqlq0swS3pW+rdI9bJMfr+neEY1jX?=
 =?us-ascii?Q?kuzdsUP/8U7kGgP+2Xn0iPiGLvLp+a3FMvagPoe2UChCxKovG9LOyi6/oqxG?=
 =?us-ascii?Q?QLEQ9H8GtHBD2ZJjQJc6svAsy0hgUZLzyTlglEE26FK6jtZlWFJPlhYt99/6?=
 =?us-ascii?Q?NX7oyjPv9+DGUD1jLxWI8Zi/zjKt4J+rksSmhH7pSwNQROvIsJVcmF5qJEVU?=
 =?us-ascii?Q?s5nMLau4KhNqKoBMrUqnTgAw4ZpsGU2ymWwpORwVi67YS0BfvGYuJjhsQpm5?=
 =?us-ascii?Q?zjczpUc93oOuOrHe3mxhpJAhKMA1domZi3mW2KhbyhT/pvNu6BVfnDZAANA4?=
 =?us-ascii?Q?7uaFsmeJ/Zg2iVIO/WshGYDJ78bZ6YRLMQjeO+8ADO3vcKtOd4NLzJtoQKra?=
 =?us-ascii?Q?aE9D4ERQ4EADLzd5Cfw3m9cza2a5vYuAlo/O0jC9zA7vmtfobeZI7XR9pB6S?=
 =?us-ascii?Q?6zelH5ICVPcex0ja7OJXc1j9wfS55eGxH0pgV3wZgzjDeTw+IM9jpICJcH8k?=
 =?us-ascii?Q?3gcKqwfRHGQ7YKTW3NU+7UfZvoJcGbqupAvLgeM+S9eXMCyTh9u+4d5GKYdt?=
 =?us-ascii?Q?Xe/tCdpekjFi7wFjfQw7GDmbWGWmc6FRb1Bqy0QOLPM86TPgh4XSXgx65HBr?=
 =?us-ascii?Q?uO3YlTF2RA1dXHxnyY/2tjBtkIvnPi6ugtB2nHZyCy6UPEgyhU5VF2hgRGtE?=
 =?us-ascii?Q?JKKLb7NDIwhsgr277C6wJ72NH2P32ZK1/FNLFWMIG3hpIyv6yLy5zv211Iwr?=
 =?us-ascii?Q?UwxA/vHP/QjYiih9XBFiU9GVU7jjDY4qVjgosrXCaxsJl6ge+/4dQRQj9lng?=
 =?us-ascii?Q?kN+AKzwjk/duZXqsHt+kuPmOBEMzKHkKcoYb?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?N5agNbMfDUFiJNe4WP/DKkDGSjzcbzPSoaUnoet9ebCjG4C4EU4zybOrXt/X?=
 =?us-ascii?Q?TrVBkQyBxwkw/0u8r6PJhruHDiadfQZ7yx396HY3+KzM1uED6UxYdqy9F8n9?=
 =?us-ascii?Q?I7rjq3RxF6TOMc2msAy8oJzifF/V9YWLokyb3ijkwRp9lOWBbq2B5bhYNo+M?=
 =?us-ascii?Q?nB+SAVhEZEhwmobtxZADoc3AUIt+Uu0vm3KdfoOLjDizgUX+qf/QKcsiCAhQ?=
 =?us-ascii?Q?9Ksk8/1+aljzroWj/twVnB5fgd/KVsi6sQQRowFi1yKgraKpmiyjWENONFrX?=
 =?us-ascii?Q?MOaTJgR5Ias+go6we5z0ekc8P/EJdoGJRjK3a8yCYFN/rOGA9OXl3dzYPLbG?=
 =?us-ascii?Q?UX+ZG3h8FmJGzZWCELaSeqoqOZyD/myuLDGn9aEp1UFyQero9HyXdQbtOxKm?=
 =?us-ascii?Q?/u0lpIzrYguTLOUgiUVo+B2K2TgzfzSV+nZ2ksb9ewgC1pN9JrJnhVrMr8h0?=
 =?us-ascii?Q?4abBMw42RGZe7Df+uZhvSxwRZAHAESrreDNV5uq4iMssSWYxn9BrCOx2RFAZ?=
 =?us-ascii?Q?1SF92jDZ8vARpLtKah5qf487MICo+s8Xplkmdqhr5bebyM4sveqeeWYwXYxF?=
 =?us-ascii?Q?viM+u5IptrjOk6jrcg1Olcg4KUzrv9rr8HyMbiVdeDQzvVK8X3XEs96cU6jJ?=
 =?us-ascii?Q?DySIz7wj2rrqNlRueptPHVyhg75817U021EvOi9IPdwfW9JnorPQYPOTP21b?=
 =?us-ascii?Q?R6wVUrS47vH2GBIJifGHjK5ZTbe/aYO+7hJ0Ta5uqo/XFP9aRUtMMcz56R5V?=
 =?us-ascii?Q?wfpv/9VyxMFgdMK7wlsVJVUDz0C2ZrjRJDLNX3bVXhke+fMojyiVN2nDv5j6?=
 =?us-ascii?Q?EGToHSzLw5+3u9c3Qtsf7WgMUnmCY2iVX2YZVjLyUna7C56ucK/+SarjfTbt?=
 =?us-ascii?Q?cx1hhfYOjA5uXlPBQFq6KHszlDKNDXmtyxgVRkISHXDu2QSf4EhYhL6O5Ixe?=
 =?us-ascii?Q?d/ZmaBdiDcKgpsADJe0Ub1pJFXUCE7p7mc/etj9byzpRiwFJ4Glqb+d+lYhP?=
 =?us-ascii?Q?EHgxsyL4swnG1tjOhM8+8G+hg9d8XpgEireN8vvoDVyTpZ1AxspNpVGzQr3j?=
 =?us-ascii?Q?HejIZ/NQ9TpiUBLjSPVyNh4bYl1/I1Fww1baPuWXUph3n3QxZbE86M1KBjrr?=
 =?us-ascii?Q?NU9/gRgWgXJSJFZLIIPRq5dPUf3rkY1nJtK4CJAr75nrWm/WKWGNtbzIFO0a?=
 =?us-ascii?Q?6cKgiGCb7WqTjaTtaWC83t8cd1xRveLSuAlt45ZNvrIhSXH6ntwR2jacG1oK?=
 =?us-ascii?Q?Wiavp5IHXwWWHHMlfsU3See8UoE4JBQvS5xBq8oIGQEBo93dIEB7FiIwUw4u?=
 =?us-ascii?Q?HfEtmqLrCn54YoIefOF8CiRt8w97bLD7MoVecbDNnKpD564z8pTPl0f522km?=
 =?us-ascii?Q?HCZzuSggS14HZYO/j7q2Otey1CH+kpXMZwBdk2w5DeHBDayGOhz5x6Ztr2K4?=
 =?us-ascii?Q?cLeWcJiMEG+i9lvOeG8vQ9t+BcC/+JyxbSYvSNAsw41Y9i/8ePV6oaW+STvM?=
 =?us-ascii?Q?tc4oip/0dqpe49npCguJWcG+MxZ1//wpLi8EfEEF0ud261TcnICeUkWJk2IY?=
 =?us-ascii?Q?RAHL1pmCqAGV+173fIcVQoaGwojQU24GJ8QhO7rS?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7772e587-5bb8-4ee6-b45e-08de1ed151f8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2025 14:15:53.6806
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zZeD1sfn8SG2wQu1BK1G2m8Btd1lIjKv6WTAtobrVWxTALvx3ff3wg0N4BT7SUz4TaSJfTPPUzYBCr24+eCMbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFD5EE188BF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA4MDExNCBTYWx0ZWRfXz06XvA7bxjxB
 cKadWbJtU5tI+pzKQydBwD0HX+Qda1iQ4eMEa6TGneuwry9O37tprof7UJxMaGfUQDF+DRe6RuX
 8mRPiU5fLnMWOwNA5vp9ko2BHa37WI5MZoJTKIEAROX4twBSy8SzEdwsivJw9ZYGv3bXKOezIhn
 LVJbW4QIeYKDxzzzIu8d/XwGdJyqfKcw7ixfGzUWVxxgMw5tA/VEZQ0xvttRjby2He8yEa9uMV3
 n/ySa9HAAdFkD6Oc09foVi8KcHaYYH9KUtT9nv8H7W8s9Gsxml+n1P5RokjmK+e8wcxL7KITzjW
 db61ny0tFEGIQBidqqgVWIunyGc9eMbx7VOwNkZQM9IHGRauuvAjcImDIVhAH2QRVNIluLiW/Au
 8a3FX9LwY+7wvBmDsYxZcTGyR2hbEw==
X-Proofpoint-ORIG-GUID: qV7hjj8I4tsUVaIxfM-6YEUKPbUUXC5S
X-Authority-Analysis: v=2.4 cv=XPA9iAhE c=1 sm=1 tr=0 ts=690f509b cx=c_pps
 a=TuoCv7SfN2yFw/uhdbj5/Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=NKijumAlAxkRJFwRJYMA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: qV7hjj8I4tsUVaIxfM-6YEUKPbUUXC5S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-08_03,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 adultscore=0 bulkscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511080114
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 08 Nov 2025 14:16:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121385

Add UPSTREAM_CHECK_URI and UPSTREAM_CHECK_REGEX to check the correct
latest stable verison.

Before the patch:
$ devtool latest-version libtimezonemap
INFO: Current version: 0.4.6
INFO: Latest version:

After the patch:
$ devtool latest-version libtimezonemap
INFO: Current version: 0.4.6
INFO: Latest version: 0.4.6

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../recipes-gnome/libtimezonemap/libtimezonemap_0.4.6.bb       | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-gnome/recipes-gnome/libtimezonemap/libtimezonemap_0.4.6.bb b/meta-gnome/recipes-gnome/libtimezonemap/libtimezonemap_0.4.6.bb
index 3f37890e8d..7c8e410b09 100644
--- a/meta-gnome/recipes-gnome/libtimezonemap/libtimezonemap_0.4.6.bb
+++ b/meta-gnome/recipes-gnome/libtimezonemap/libtimezonemap_0.4.6.bb
@@ -8,6 +8,9 @@ SRC_URI = "${DEBIAN_MIRROR}/main/libt/${BPN}/${BPN}_${PV}.orig.tar.gz;downloadfi
            file://0001-configure.ac-correct-the-version.patch"
 SRC_URI[sha256sum] = "0d634cc2476d8f57d1ee1864bd4f442180ae4bf040a9ae4bf73b66bbd85d7195"
 
+UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/libt/libtimezonemap"
+UPSTREAM_CHECK_REGEX = "libtimezonemap_(?P<pver>\d+(\.\d+)+)"
+
 DEPENDS = "gtk+3 gdk-pixbuf libsoup-2.4 json-glib gnome-common-native"
 
 B = "${S}"
-- 
2.34.1


