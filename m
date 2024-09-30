Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FF49CF6491
	for <webhook@archiver.kernel.org>; Mon, 30 Sep 2024 06:33:38 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.48277.1727678011371597467
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 29 Sep 2024 23:33:31 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0003229e10=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48U5OP16007279
	for <openembedded-devel@lists.openembedded.org>; Sun, 29 Sep 2024 23:33:31 -0700
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41xhakheu4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 29 Sep 2024 23:33:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N7QMmS7Vxdt59siBsKi6RpqbmsIR0+EPrzFBNNnd4tj2yZakSFX1MNWYSmewJNBpIqOglq9EHo0I6YNMKcQKWU7j8sJ42/uoGY/6aEYnPf7+kOOjbRgII3eCwNCehLR68FNxqq5oMsp3ebvNQFBqQO1uQTgQ4PTxG/+XCg5ktHyVDiZjuTMs7nQtBwwy8QwghTnNNZtdK0L3gqFZT94q00tvBViGm74eQOcYiM8IJ1uBlSo2X+I7wCeZ5MFZ7b0ycmO6RVC/ZBIoMaiAs3mFLCMcyk29ErOBA1nUMGBXD3tFxc8pa0xSKM1TFu3aHkB2j7xJvkE8kAvLZ46dDGusCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oMTRLrWW1OameaLVolj3DqmhfVqnoiy2y3Zazzm2Rng=;
 b=y3JNzpjCaXNNcY7BSejzUbIoVFzl+xc06+rYfkKf4mWpVbfjuhrLajBN+d7UcUQZsJkBbefVh6gL7t5pdGeEyMrMVNYHxJyqKKSC04DFO4/oabwRWKYdO9z4upT+tmLiwg0kJMLKv9/3YRc06ayqmQ/NlhEhtyT0iBDbeNaqbh6AUEc7+6qzqVmgvRwuRPw2dFPoiF3RSwevghmr9rLrrhxaphJV+Z+DbbtzGzz4IQhHcbwzpSUq8XyhOWzm36JGzP5//MnrFGJBKtN0hZ/YITc4NlxLTIviR4cPSE3vJQX6abIc8dj6/dX9XbxDeM39U5dFdv/irI/zPLAuWZa+Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 PH7PR11MB6605.namprd11.prod.outlook.com (2603:10b6:510:1b0::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.26; Mon, 30 Sep
 2024 06:33:27 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%5]) with mapi id 15.20.8005.024; Mon, 30 Sep 2024
 06:33:27 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v2] pahole: upgrade 1.25 -> 1.27
Date: Mon, 30 Sep 2024 14:33:13 +0800
Message-Id: <20240930063313.1984232-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY2PR0101CA0030.apcprd01.prod.exchangelabs.com
 (2603:1096:404:8000::16) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|PH7PR11MB6605:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ab4606a-fcba-4972-fc57-08dce119caaa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?8ly/5/34ncApt2uz3x+1lwN7zewRYY9iEeJDc/AvtQpFh+G/mIrKagb4x2lA?=
 =?us-ascii?Q?YdhKgVqtJNeIoCtc6qWP7GwC5/FCNeImD6cLf4AI9k07tn95ZiImksQbCaIn?=
 =?us-ascii?Q?6KKowZuWCuybFGKqXi8olqA29/cKrTTqR9EpNLZP0+4wTKeCXSK6zVoRDimv?=
 =?us-ascii?Q?xvVDffZKBEgj30ksAIkrE888QYfYVZiZVP0s9wm5V95+O3nDpGOlus+N6dbk?=
 =?us-ascii?Q?0XG4wpFPPD/lhRbRdLx2E9spCMy2PqUFn1ts1nCwHqaNvNtDT9SUiVuTy9tQ?=
 =?us-ascii?Q?LEJ5DhIjH6j660G8+8OhDoWRjrv7034tBjgNX+iWGnM55POE37use/AlnxSZ?=
 =?us-ascii?Q?abJMukUaA+GM46ON2XdvQceRQkHk2ArH98bwikZDZ2mMMZJFlJR9Mb0ErQlt?=
 =?us-ascii?Q?BPxNAmD6+28HyJcQCegoTww+x48Lsp62KnEVUa5KxQksxub0hSpF/Wk5nOdk?=
 =?us-ascii?Q?c278I7QrANt8jTfLxx0ooqNFAmHNc8XzFGOARsXLT7NjP4M4ZK0W4YldEWfK?=
 =?us-ascii?Q?LTw/1wUlPoQVGRK2O8jSQl8JEsPILX05C9aiyOQ1duQEv8BdYzhmckeHd1i+?=
 =?us-ascii?Q?F5LqMckP/8DOiTno7mo7X4Hgqw70QFDo5qoUkBeXR+b2VaDVe92pG7V7YxAU?=
 =?us-ascii?Q?Ll7kNHNkd65bpvT8PStsUlCjRVSEJ3t7zbTtG81OEom+kTQvkNK/f9JLwxxx?=
 =?us-ascii?Q?DQOQfN+D+EjCc4js0yLV4Hf30UadK/UmM6Rm1iLwIPxgIigbCJNLDbZlti3H?=
 =?us-ascii?Q?3ye0SUaoBX9VvZO+Mk4E1aPEaUP0e9Vqzp2iZVqC1xN7nQj86kQnt4tXdPJq?=
 =?us-ascii?Q?9FSCDGCDqspt+Jvx7+wO0gw5RWfXu7w9F+EtQaH2241S4zwlZMFzQM4LUC2/?=
 =?us-ascii?Q?1UqSKSgMTsm9RM+etzLuRPG3ymlE6y3Tl6a8XSWiOrwPTh+f01gwoDJ3/R5g?=
 =?us-ascii?Q?kees2aBNVeay0N24xpKNvOiQB+5n1/3/e2rjL4dJiQq8efUCcegDkhfyCG/q?=
 =?us-ascii?Q?yl4kjUCVzzycgoIuMu0uvpHPvNNatvDs0nCOpgmTcQCkcj49Ti7lFM55TS/I?=
 =?us-ascii?Q?zqllB7A4Bu8EWxEW7yRwkRjPeYBZitRapgv9/bl8a/+nieym78iRVrVm045S?=
 =?us-ascii?Q?t1ZJsWXpmNA6uv555sW19xsi4MHl8W812P1eWrJiEWurU1tXV9vCyAx24/1G?=
 =?us-ascii?Q?jD777yrPQ0NVbVVCE/YF8I7Klm3qNr2USEGqbh1uZ/vTzSoG26Ovv1DzHHZ3?=
 =?us-ascii?Q?iXEPecG1cFad1Ro+TmE2S2T985p1KdSLB89ekYjpfBw6Gu/MrPsu/UyZ8dK+?=
 =?us-ascii?Q?tIIlD8TkgVER18xC1kx1Hk4wwuQOYMdJdMwCKgMNirm5ZUVrtJ+s/5r9qaRc?=
 =?us-ascii?Q?Fr3gWP6JXB0XmWeERLH2AJbTWAbq4SYzSaDRBgU/YRsFsfl80QnrAgi4y45Q?=
 =?us-ascii?Q?VcBzrZwq4Hg=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?zBC3j3JeWXhs4Q6FgmgTpMZgdJ13EEgRuF5NUZMslj4bmAEjTsm0pfD+1oL/?=
 =?us-ascii?Q?olx7oqPHqGiEz9VgMGEeiiLdBYVjm6Kzb7U+kVBxqnm40aqP9ztSxuddshcS?=
 =?us-ascii?Q?g8CXKfbTDHYJVNntvuwTYzcmvf81s0DpJa4lt00daOKYUlMeoYVqbC6XfUMS?=
 =?us-ascii?Q?RYs9xSUyhqFlgQlDZ1LqGHTB/AtsNk95ObqsLvtjRplX523WdtqFUf2u6183?=
 =?us-ascii?Q?BOA+qdXELcCmU/PGlekwF63xWoAndbJTllSui6lEHREhDuc0Yi5nGQuBWzd2?=
 =?us-ascii?Q?Z8P2OlXhwWXp1Vq+Ji1dsvpLIAMgBiI6TRY+VCqkAmIU0X5H69KMoUqlQvU6?=
 =?us-ascii?Q?D8fcOD8KB70D2xOtkrXiagQnWOYRy83GG5vk+CIak53aIO8/4IbW6pwmQO+V?=
 =?us-ascii?Q?NHz+YZt6HSXrvu42bZyCChxNpbU5rv65drnByYu/DJQf63kO3xu7n0XuPaNe?=
 =?us-ascii?Q?85Gbq+nLWR9ELsVOx7p3dyTrGyRQV74Ez5Dk+fb+xgHDgEgc0aM3GdHZ1r/+?=
 =?us-ascii?Q?/lHbwDnEh+v4sLjqFw2M+tvpT/J64682LA3VOzJTGjmgXdujFiwA77lYoMWW?=
 =?us-ascii?Q?Oy0bqnLzB3UXc5MJ8OnqcUSCMqgvZbHrFNXgUnY70mOVNx4G4BSRBQE4D1N7?=
 =?us-ascii?Q?6AksvCcU3xDU8jhK7IhaBtPeRxYuO4k8Lmgt51ASxiM5Xff2/k2H0Pzy3Wxv?=
 =?us-ascii?Q?gXrkZWBOdwL+/GRBaqRrhI8NQtxQdr8VELOMMK9NLyorQOjlbgpk3pAN+brK?=
 =?us-ascii?Q?wtHfy9FXvxb2xmbd+oN26xe2Ap8peVafk7lG6/1US6N3xECCUQnPiMXR4oLD?=
 =?us-ascii?Q?M3h8DEZgQsjnSUekYT2yUkEXNNMNYM42f/qN720Ijq8qYQb6dEgtERAKjuat?=
 =?us-ascii?Q?ytv9gRYeQzOMd9ajAsnffOaX2TLoODUGWaLxKTDqLOaXfIJmyEj8RJgQKidr?=
 =?us-ascii?Q?1ursyCeDHjVHXMEdbPOZRw/cN4B1iqMW24O88bvyRQMyA5zpCMM6mRbhRXuj?=
 =?us-ascii?Q?Rp+eIp3mTBzpLqikryX4fsgRJQjQ8Cm9frKtOg8d3mwGP2DSHalTW0SILJMU?=
 =?us-ascii?Q?cYsWGNUELxOMzSEBPMDoDN76fdwQqOpx+UfbBIschgnCBXb65eA43jj/WFcU?=
 =?us-ascii?Q?Jz7Tw31zu176kgp6PLTZ6EHnFMtKj/339f189RUPA5skbSGpvgArvM/0+0mb?=
 =?us-ascii?Q?E8pJq9EVfHmsdjiV1AFyCsAECvpf0JtKuSXdRgKeia+mjz7V+Uy3+ymEcEUv?=
 =?us-ascii?Q?SOIyEkNiCQ9jXW7jt687rfWv/VY3BDPVz0LXeTv4rFRbmLlXHTtYyZNmHG6A?=
 =?us-ascii?Q?JMWEuduXoxzYYXZTVfuL6uNfmbsxNdHWC1E2gxWSwO4cEVvmrkKonftNp1gF?=
 =?us-ascii?Q?Fb+1g4s6I3VUiuC6bluCQKxQHDDlsigdqX8HUOLo5Ev+J4/TK6ZV6d7FipuS?=
 =?us-ascii?Q?L3xXzkLaCsQlmnZKoatD+88GDGM1V8ieZmMEPdfpt3hzErkbpvJDhwMAdQh5?=
 =?us-ascii?Q?L4SY8VGFvCaDlNWNU7CBQNvu7MvkUiMA1wqJ0SgMaGi3YweDFpF5g1BKiVFB?=
 =?us-ascii?Q?bJQ6Y0OFJshncOvUkIolRa9cNQkb7AyK+GF0nyFs?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ab4606a-fcba-4972-fc57-08dce119caaa
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2024 06:33:27.2051
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O2J04S+BSEOOzPTwOCtHCcwJ9swruhn4/h6hAAwHsPoLViXkTMYdSzl0m3H9TYCsijcLP/iCPp9l2s0h3F4wOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6605
X-Authority-Analysis: v=2.4 cv=YOLNygGx c=1 sm=1 tr=0 ts=66fa463a cx=c_pps a=+kc2f53xTGsvuL7uaCOpcA==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=EaEq8P2WXUwA:10 a=bRTqI5nwn0kA:10 a=VwQbUJbxAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=1P9CV7W3nvdAgWqK8eQA:9 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: l6bOH4L-QCXu23qemsc8NjOD6eOZ0Wnp
X-Proofpoint-ORIG-GUID: l6bOH4L-QCXu23qemsc8NjOD6eOZ0Wnp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-30_06,2024-09-27_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=907 clxscore=1015 suspectscore=0 priorityscore=1501
 spamscore=0 bulkscore=0 malwarescore=0 adultscore=0 phishscore=0
 impostorscore=0 mlxscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2408220000 definitions=main-2409300046
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 06:33:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112560

ChangeLog:
https://git.kernel.org/pub/scm/devel/pahole/pahole.git/tree/changes-v1.26?h=v1.27
https://git.kernel.org/pub/scm/devel/pahole/pahole.git/tree/changes-v1.27?h=v1.27

Add more architectures to COMPATIBLE_HOST, as libbpf is now allowed to
be built on more architectures[1].

[1] https://git.openembedded.org/meta-openembedded/commit/?id=bb8049afe96db57707afc259743e288bec456117

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...usr-bin-env-python3-instead-of-just-usr-bin-pyth.patch} | 1 -
 .../pahole/{pahole_1.25.bb => pahole_1.27.bb}              | 7 ++++---
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-devtools/pahole/files/{0002-Use-usr-bin-env-python3-instead-of-just-usr-bin-pyth.patch => 0001-Use-usr-bin-env-python3-instead-of-just-usr-bin-pyth.patch} (99%)
 rename meta-oe/recipes-devtools/pahole/{pahole_1.25.bb => pahole_1.27.bb} (83%)

diff --git a/meta-oe/recipes-devtools/pahole/files/0002-Use-usr-bin-env-python3-instead-of-just-usr-bin-pyth.patch b/meta-oe/recipes-devtools/pahole/files/0001-Use-usr-bin-env-python3-instead-of-just-usr-bin-pyth.patch
similarity index 99%
rename from meta-oe/recipes-devtools/pahole/files/0002-Use-usr-bin-env-python3-instead-of-just-usr-bin-pyth.patch
rename to meta-oe/recipes-devtools/pahole/files/0001-Use-usr-bin-env-python3-instead-of-just-usr-bin-pyth.patch
index 4f7dfd4cc..7dc18d7aa 100644
--- a/meta-oe/recipes-devtools/pahole/files/0002-Use-usr-bin-env-python3-instead-of-just-usr-bin-pyth.patch
+++ b/meta-oe/recipes-devtools/pahole/files/0001-Use-usr-bin-env-python3-instead-of-just-usr-bin-pyth.patch
@@ -4,7 +4,6 @@ Date: Wed, 15 Sep 2021 17:54:01 +0200
 Subject: [PATCH] Use /usr/bin/env python3 instead of just /usr/bin/python3
 
 Upstream-Status: Inappropriate [OE specific]
-
 ---
  ostra/ostra-cg        | 2 +-
  ostra/python/ostra.py | 2 +-
diff --git a/meta-oe/recipes-devtools/pahole/pahole_1.25.bb b/meta-oe/recipes-devtools/pahole/pahole_1.27.bb
similarity index 83%
rename from meta-oe/recipes-devtools/pahole/pahole_1.25.bb
rename to meta-oe/recipes-devtools/pahole/pahole_1.27.bb
index 1334c850e..b899684eb 100644
--- a/meta-oe/recipes-devtools/pahole/pahole_1.25.bb
+++ b/meta-oe/recipes-devtools/pahole/pahole_1.27.bb
@@ -7,11 +7,12 @@ DEPENDS = "elfutils zlib libbpf"
 
 # Depends on MACHINE_ARCH libbpf
 PACKAGE_ARCH = "${MACHINE_ARCH}"
-COMPATIBLE_HOST = "(x86_64|i.86|aarch64).*-linux"
+COMPATIBLE_HOST:mips = "null"
+COMPATIBLE_HOST:riscv32 = "null"
 
-SRCREV = "81558a5a996005df0d607dd33f74ec5b7bdb619d"
+SRCREV = "3e265dac5ec85b956c664464072196c37d2af4f3"
 SRC_URI = "git://git.kernel.org/pub/scm/devel/pahole/pahole.git;branch=master \
-           file://0002-Use-usr-bin-env-python3-instead-of-just-usr-bin-pyth.patch"
+           file://0001-Use-usr-bin-env-python3-instead-of-just-usr-bin-pyth.patch"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


