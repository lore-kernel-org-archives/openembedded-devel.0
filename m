Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 250AFC7EE2A
	for <webhook@archiver.kernel.org>; Tue, 24 Jun 2025 08:58:17 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.3908.1750755489130448904
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Jun 2025 01:58:09 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8270701add=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55O5dPke020719
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Jun 2025 01:58:08 -0700
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2080.outbound.protection.outlook.com [40.107.244.80])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47dr14tr47-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Jun 2025 01:58:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fIW5Ou2MG9+LiRuHb1ay/ngFpgViOh4zUgbWBUSDtGs4H8U9WVWPZwjGufEDc/2TUTOtHVBEX4J9Uh4AxjbGrss+G2lnMviO85x9PxwVSrJnzOHuIs3FvV93nVWSBBVk9/DbH0lGWQ/8ih4VapgmxR1rI9PbYxTYvTQgmzEApGZTsfFc0ZRHPbfbeYzMyM5jmVg/q0xJldLPFGi5pBVn5obJVxCt2T4rk6z5tACa4/IbmfRjOdt6ngsCUriaVIecH/FPE9dBKR3bqQ8nscu/WSFOGydOfRFFZPB0J0Dk6xeJOfa4YQO0qqs7Zh7fXFMXeEUbYQdr7CMR5B5Ye+QruQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E8C8sP8+cFbLTr58XG023HXgXIkPeJRk607z6AbcAh0=;
 b=GrV8JsviucJZQOnbIQiM2KFwCaxOc9rr7f67nZ/zYSsKtsgqVQr9EN8o2fax5fPkGMJUadBVWjWQNEv3wlxF5oL0zYHdJZiBBQzs6YaJSPwdrO3fxFvV1SqbsZCNHQWnnS8Qd4UhitoDyv9Dr9j0e2LPOxJs7ckEJaIC/eQxD15RaQk04T6rePCNEufXck5RL8+AeofefLiRrW8vds+jXgclrAZsqst2r/ozHu/bX8uxjBPAQC9Jpq8q6v8tXzT3kA2AOFN8Z4s3EwqYCJhfNMSqgaEY/KrHK6ELypaVLMKkIT0sXAgpwCixahqFjLXgxyjBFtzqnL/W42/BYfOvtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by DM4PR11MB8129.namprd11.prod.outlook.com (2603:10b6:8:183::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.25; Tue, 24 Jun
 2025 08:58:07 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%4]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 08:58:07 +0000
From: Qi.Chen@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][kirkstone][PATCH 3/3] protobuf: fix CVE-2025-4565
Date: Tue, 24 Jun 2025 16:57:48 +0800
Message-Id: <20250624085748.3060194-3-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250624085748.3060194-1-Qi.Chen@windriver.com>
References: <20250624085748.3060194-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0246.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:456::12) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|DM4PR11MB8129:EE_
X-MS-Office365-Filtering-Correlation-Id: d9e13ff5-e4ed-421c-ee6a-08ddb2fd3ca6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?NNUF4gMHEmxLnb2lW3Tqgp+AMdOI/89nc+RDU2KAFzTWzilfaHB21+ehJmN8?=
 =?us-ascii?Q?iFILoS9LUN7UlyiKGVuPf9JD4qsNvFECVVLiGAby+f0hj6LDs35U5Nkv74K8?=
 =?us-ascii?Q?t/EWev2w/r4ZYQkWhHbtCB/Oi03wjLQXYgNeSP97au2NmzG86mUxykVuy4/+?=
 =?us-ascii?Q?NXsDyQRzx6/FXR9zQGKwO5HAYnNAYZmDfN6CjfcrAJpiA1j023ApGeAIwFd0?=
 =?us-ascii?Q?oxBRJ/HYavKxyHfmRjfHNn0MY6f7BaTDeksz9MYQ5nDbgbYviFawrJVmMwo7?=
 =?us-ascii?Q?z8XPABrYNM3ohh8cr2uCVFfbftqfrtkI4pjYYlY1BplTR4ImT0gWh6mj1faH?=
 =?us-ascii?Q?6MDPoaswSSN4bIfOZvwJka6Zb78rW9kN4P+HwiVAEkUr7eQI6Y7iH9mPcg9D?=
 =?us-ascii?Q?hr9Izaq8L1JrPO6Ydl2dD1pf5HaN7m9nINB2wTRJyrvi+D1t+Q9XJpYJCjmV?=
 =?us-ascii?Q?g27kigaubhJDlwPNYwL/f4p5qI3dL7j9IXzOe9SYgcurToiX73SpQN2RxCB8?=
 =?us-ascii?Q?YxNiFltHfSuvxrANoJNZqQxWLQEFlL4SEROhufQwy1EsjX5HVn9/OsIeCxKM?=
 =?us-ascii?Q?nyPwMwwdS6ofvd4knHNvMyPiIShDbleo0cTs/l10aThPIfD6gczRnpLLc3FT?=
 =?us-ascii?Q?pGb31/oGIxEyX8vqKLt7xn0MHGyzx/GGhdCCNMzsedHYEsbkbu2BfbxWS9Dn?=
 =?us-ascii?Q?VeBflz+njJhPhCcPa1w2Vb3gVDKb0hqO0+qrUh0nGkb8ybCpRqEsKkOYEu8K?=
 =?us-ascii?Q?izyO+g2paRIiAWO0uR080rNOb8p/G3aBBz8qp8xsjz0wJSF71bRwwCGb3cWk?=
 =?us-ascii?Q?w031kRsA6CGiGRFhRf3ip5zA3Ib5HZ7iJdHvoab+rgA+fYtgU6xA3Lk1Pybj?=
 =?us-ascii?Q?aU6bteDhaxh80wPD5/GB+uAiTCQz/lI8DQX7wxCx2Z09k1DOmJs8wGxkpzHw?=
 =?us-ascii?Q?FK6vWX4Yo59lLgYLP5UuvTHm99arYsPP8nsgq5qzVn8/Wo1oo5xVuj8VQgZZ?=
 =?us-ascii?Q?8AEXFZoEwvaQr/nQZsr/EDFDouDLy2oHC7DxRSyGJp+hB97vnvPi8+GVu4Eh?=
 =?us-ascii?Q?OIXJemXuZgxLTe1A/Yti3CiDzoFgQ5iRbMR+gFeIH0atF5aCPYolyMLe66kg?=
 =?us-ascii?Q?dpeM9DXuyzpgVoSo+hPW6l+LON+uDGFrI89LAFtdILFMT1uZFaHFFkKzOujE?=
 =?us-ascii?Q?wfiguD1VWzgoa7/FhnsOu94Zc28F3V1NeY8H9uKeC7NrON6ON2Fbxqr0TNnK?=
 =?us-ascii?Q?lSOp1rm/n89JOGZKywcXIEArwJ7s42Qri43//YbKHA+u1TGsXsAME2qFge1F?=
 =?us-ascii?Q?A0AEAUR2LZaf+NOUXeoDK+m0pQk0l1xX6DVeL6y+ONW8p5OtGSKqOsgmfKWs?=
 =?us-ascii?Q?xgI/+0JHMG4DgqDATdQRU3FUybSM4KscKgn8BnTr8AFBOP/J7V6bwlAjY3ik?=
 =?us-ascii?Q?0bWDV7o0ZaoEoCWbv6FuqCYlIWTvVl4sowx7t+OzGXkEbwjB4MZnponh9MeG?=
 =?us-ascii?Q?x53GuDbW5jHvqKo=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?RvCAqL6avwgR6fVDunELTcasltqS3LT1qsrc/ghMa3gSf2bOAYar5O83ngLV?=
 =?us-ascii?Q?msT82MCPgcmx1X2DX+6Di+TDS84muZM7wWPREzheWqsP1TYYQTwhRYphtUYc?=
 =?us-ascii?Q?s8fNyRyqf/4ZSf06oC8F62s2xttUGsLNcJK74EEsnyZk8UvdF5a+vzGx6YDm?=
 =?us-ascii?Q?Li138FBFppab7M7/rlEMQlXegcF2cKK0CnIT1oqtugQ42Q9iKc3wjYA7f1Kg?=
 =?us-ascii?Q?6HjYVzGm7kWA/2h0lzkV9HkFC6XEVedsRA0EKQrOAcDjzMe88PlUgyVPAbtS?=
 =?us-ascii?Q?1aYrQD6WZ6mqCd9N/O1LYh9GMmlAjlvMoG4PzFrr6hezvD2a1eY9WllJGFrK?=
 =?us-ascii?Q?nhJE/3uukliaPNly4HGZYouLMdH5gGJAZVIC6e5EKNpTv+cdEKA6ET8zQ8qk?=
 =?us-ascii?Q?HIqN3n22zXIk5jUupft+okf22RYMJVWXuZLIFrBYXFN1NZmc+wKuG1WIVAs4?=
 =?us-ascii?Q?VWC/OoYhpSz7m/kUFv47bSu/Fq1V5HYuE4mfFjeBA0GCor82tYPQiKCz3Ev9?=
 =?us-ascii?Q?GudgVLbUQDkhuYmGKlEPB3kfEgZpvieJzV7sp3I8r14uagcboRzetVNRmRwm?=
 =?us-ascii?Q?3ZH85h/7uwLbWmjdRPZLp68hD+uBzCtL1nDgxFYVm8vGeuaobAwtvCGN2lZT?=
 =?us-ascii?Q?QaQI+9D7m07Shiu/cvko+oIR8UjYhdKMggaXBS7uGtkV43LLyyjmnsqclJny?=
 =?us-ascii?Q?RLa02crgCHSe0GwgBy5Qz5angfAYL1kZ7lcdXOvJ8HdCuseHGyAdgPVmil0F?=
 =?us-ascii?Q?H9XVS8iAu4DW1gETW3m/7T5bNNHS6GN8iRJ6GaDEcTWPyKOTATG43I+h5yJH?=
 =?us-ascii?Q?TWoAhiQiWW1gCo7KI/sN8bWyS6v/tJBsXH4kZnkaitNmVsWpqitUrn7XFJUn?=
 =?us-ascii?Q?hILHAZoH9A4yo0AtFFjfUWFuCG0Igw0Bx/s+agfc61vW47qQI69Ohsl6SyQi?=
 =?us-ascii?Q?KKked73+TwNR0KjpILQbRmQYJB5jAzi0mRGubOyZOFQ2TBuOnUafBljQ6KVY?=
 =?us-ascii?Q?Uwxqd3cQukONrQWMi4z3wyedNqpLijyqh9LYKH3tPSTH8of+b6tsgsXexxPX?=
 =?us-ascii?Q?JYIxbTlKN2/B0MQfwBfsp09e40HvLjaYThLS6Do+cvoL4r0vwMpBv3gkTtdm?=
 =?us-ascii?Q?/oBQGB7uID8ZMe7Ig6/yxYy8gCuLm4Mxy+GkrUCV//yWtllE0+RecLTMLfzH?=
 =?us-ascii?Q?YqmwT/PDFuIt61YcvKlcgfNS90zDk9JD9+23XkWJ2IAnghXpGLV44NPuXPET?=
 =?us-ascii?Q?giySiJlbLNo1SeFLKTjy9TDyxlZa17jI1+9pFg98w0VD0k0W0iD3eugRGkeh?=
 =?us-ascii?Q?+H6ANi9HdO1Jl/gWOxpcjysfQkMIPdLVnRsV5e4IVXLFq6IQzgd3ERifSplV?=
 =?us-ascii?Q?E1CLVbBL/qXUaHUfwU+nJedEWYVev0bL/wnOgKrioMOnyMM6cPi+N6vDL8RX?=
 =?us-ascii?Q?vq5or02w/FbrW8+WEmsP7+6z7K83uiky3DTxglEbGTAqmXdLTJJVxKt/Xto3?=
 =?us-ascii?Q?/XfnKQApLZqZ2FJZZ/5JveCHSsklUBh3JiIq2riXGCZztVYHv6wvLu+uZ8/f?=
 =?us-ascii?Q?SOQMiSFTSvZ7B2TYlwwR9c89EG1cpohjgQ46qfbJ?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9e13ff5-e4ed-421c-ee6a-08ddb2fd3ca6
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 08:58:07.3190
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V0MJdyE9bE7oNa/GeE3eXZkJjJodr25ekZ4dwu3pwBC/pEGDpK4bKYw9S9tsn0FTMIlg9TP9F1FZIat1dsp+fw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8129
X-Proofpoint-ORIG-GUID: BXOtuweubEd-8WWyYenmuyd4UYGqV3ES
X-Proofpoint-GUID: BXOtuweubEd-8WWyYenmuyd4UYGqV3ES
X-Authority-Analysis: v=2.4 cv=XYKJzJ55 c=1 sm=1 tr=0 ts=685a68a0 cx=c_pps a=9tBfwoQ6/+n2CpjoB+3+cg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=1XWaLZrsAAAA:8 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8 a=ZaJENrgKT2JGq3tFfHMA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDA3NiBTYWx0ZWRfX6adI6RaCctEN U7lZsqkaj9HjS2JLTRxOcUeCNdLbVmGbJy3xCA6d2ofstPhrf+2QYCqOIbPifQTAJeMKJdk9pZm Cp6+euq/aMtF2Y1xBOGyE0dEG3zXsqcGW01RH8YJ6VOyMtB3AZH7Rb19jSRnKWxhnE/giUD/xfv
 yu/l5/8DRGOVXKB9rx7hWvN2noKIW2seURIeoO3+BTqZ2RFmNSlf7EyVt1VViOqcmtAL0ju1g7l zHjs9hAq86XtF/6nXSHqXsu3CgY5e/jO+Fj+Rx+GgPYJiTksMhmS9UGznq87IbItrOFiFjadvj+ YGi7cXGFXXKqqCQbTFbeTmTdgK/vQ2dY9LV22vmq7+sNQ1Tp+TPbWvni5vYdRJLUOdX3+rDZIxB
 +9Lcn4aRQr/Az3jq07IYUKk2V3I1by3HGrhtceKKfPysno1zSOBO9HwKHaGpSDuBD7ozk9oV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_03,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 mlxscore=0 impostorscore=0 phishscore=0 mlxlogscore=999
 malwarescore=0 suspectscore=0 clxscore=1015 adultscore=0 bulkscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506240076
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Jun 2025 08:58:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118101

From: Chen Qi <Qi.Chen@windriver.com>

Backport patch with adjustments for 3.19.6 version to fix
CVE-2025-4565.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../protobuf/protobuf/CVE-2025-4565.patch     | 376 ++++++++++++++++++
 .../protobuf/protobuf_3.19.6.bb               |   1 +
 2 files changed, 377 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/protobuf/protobuf/CVE-2025-4565.patch

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf/CVE-2025-4565.patch b/meta-oe/recipes-devtools/protobuf/protobuf/CVE-2025-4565.patch
new file mode 100644
index 0000000000..acc9a87008
--- /dev/null
+++ b/meta-oe/recipes-devtools/protobuf/protobuf/CVE-2025-4565.patch
@@ -0,0 +1,376 @@
+From 0b48d64d7fcfd34514b6fa9b046d40457ed3e4b9 Mon Sep 17 00:00:00 2001
+From: shaod2 <shaod@google.com>
+Date: Wed, 21 May 2025 14:30:53 -0400
+Subject: [PATCH] Manually backport recursion limit enforcement to 25.x
+
+CVE: CVE-2025-4565
+
+Upstream-Status: Backport [d31100c9195819edb0a12f44705dfc2da111ea9b]
+Adjusted for the 3.19.6 version, resolving conflicts and removing
+unused testing codes.
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ python/google/protobuf/internal/decoder.py    | 110 ++++++++++++++----
+ .../protobuf/internal/python_message.py       |   6 +-
+ .../protobuf/internal/self_recursive.proto    |  17 +++
+ 3 files changed, 106 insertions(+), 27 deletions(-)
+ create mode 100644 python/google/protobuf/internal/self_recursive.proto
+
+diff --git a/python/google/protobuf/internal/decoder.py b/python/google/protobuf/internal/decoder.py
+index bc1b7b785..445c1d0d2 100644
+--- a/python/google/protobuf/internal/decoder.py
++++ b/python/google/protobuf/internal/decoder.py
+@@ -195,7 +195,10 @@ def _SimpleDecoder(wire_type, decode_value):
+                       clear_if_default=False):
+     if is_packed:
+       local_DecodeVarint = _DecodeVarint
+-      def DecodePackedField(buffer, pos, end, message, field_dict):
++      def DecodePackedField(
++          buffer, pos, end, message, field_dict, current_depth=0
++      ):
++        del current_depth # unused
+         value = field_dict.get(key)
+         if value is None:
+           value = field_dict.setdefault(key, new_default(message))
+@@ -214,7 +217,10 @@ def _SimpleDecoder(wire_type, decode_value):
+     elif is_repeated:
+       tag_bytes = encoder.TagBytes(field_number, wire_type)
+       tag_len = len(tag_bytes)
+-      def DecodeRepeatedField(buffer, pos, end, message, field_dict):
++      def DecodeRepeatedField(
++          buffer, pos, end, message, field_dict, current_depth=0
++      ):
++        del current_depth # unused
+         value = field_dict.get(key)
+         if value is None:
+           value = field_dict.setdefault(key, new_default(message))
+@@ -231,7 +237,8 @@ def _SimpleDecoder(wire_type, decode_value):
+             return new_pos
+       return DecodeRepeatedField
+     else:
+-      def DecodeField(buffer, pos, end, message, field_dict):
++      def DecodeField(buffer, pos, end, message, field_dict, current_depth=0):
++        del current_depth # unused
+         (new_value, pos) = decode_value(buffer, pos)
+         if pos > end:
+           raise _DecodeError('Truncated message.')
+@@ -375,7 +382,9 @@ def EnumDecoder(field_number, is_repeated, is_packed, key, new_default,
+   enum_type = key.enum_type
+   if is_packed:
+     local_DecodeVarint = _DecodeVarint
+-    def DecodePackedField(buffer, pos, end, message, field_dict):
++    def DecodePackedField(
++        buffer, pos, end, message, field_dict, current_depth=0
++    ):
+       """Decode serialized packed enum to its value and a new position.
+ 
+       Args:
+@@ -388,6 +397,7 @@ def EnumDecoder(field_number, is_repeated, is_packed, key, new_default,
+       Returns:
+         int, new position in serialized data.
+       """
++      del current_depth # unused
+       value = field_dict.get(key)
+       if value is None:
+         value = field_dict.setdefault(key, new_default(message))
+@@ -428,7 +438,9 @@ def EnumDecoder(field_number, is_repeated, is_packed, key, new_default,
+   elif is_repeated:
+     tag_bytes = encoder.TagBytes(field_number, wire_format.WIRETYPE_VARINT)
+     tag_len = len(tag_bytes)
+-    def DecodeRepeatedField(buffer, pos, end, message, field_dict):
++    def DecodeRepeatedField(
++        buffer, pos, end, message, field_dict, current_depth=0
++    ):
+       """Decode serialized repeated enum to its value and a new position.
+ 
+       Args:
+@@ -441,6 +453,7 @@ def EnumDecoder(field_number, is_repeated, is_packed, key, new_default,
+       Returns:
+         int, new position in serialized data.
+       """
++      del current_depth # unused
+       value = field_dict.get(key)
+       if value is None:
+         value = field_dict.setdefault(key, new_default(message))
+@@ -469,7 +482,7 @@ def EnumDecoder(field_number, is_repeated, is_packed, key, new_default,
+           return new_pos
+     return DecodeRepeatedField
+   else:
+-    def DecodeField(buffer, pos, end, message, field_dict):
++    def DecodeField(buffer, pos, end, message, field_dict, current_depth=0):
+       """Decode serialized repeated enum to its value and a new position.
+ 
+       Args:
+@@ -482,6 +495,7 @@ def EnumDecoder(field_number, is_repeated, is_packed, key, new_default,
+       Returns:
+         int, new position in serialized data.
+       """
++      del current_depth # unused
+       value_start_pos = pos
+       (enum_value, pos) = _DecodeSignedVarint32(buffer, pos)
+       if pos > end:
+@@ -563,7 +577,10 @@ def StringDecoder(field_number, is_repeated, is_packed, key, new_default,
+     tag_bytes = encoder.TagBytes(field_number,
+                                  wire_format.WIRETYPE_LENGTH_DELIMITED)
+     tag_len = len(tag_bytes)
+-    def DecodeRepeatedField(buffer, pos, end, message, field_dict):
++    def DecodeRepeatedField(
++        buffer, pos, end, message, field_dict, current_depth=0
++    ):
++      del current_depth # unused
+       value = field_dict.get(key)
+       if value is None:
+         value = field_dict.setdefault(key, new_default(message))
+@@ -580,7 +597,8 @@ def StringDecoder(field_number, is_repeated, is_packed, key, new_default,
+           return new_pos
+     return DecodeRepeatedField
+   else:
+-    def DecodeField(buffer, pos, end, message, field_dict):
++    def DecodeField(buffer, pos, end, message, field_dict, current_depth=0):
++      del current_depth # unused
+       (size, pos) = local_DecodeVarint(buffer, pos)
+       new_pos = pos + size
+       if new_pos > end:
+@@ -604,7 +622,10 @@ def BytesDecoder(field_number, is_repeated, is_packed, key, new_default,
+     tag_bytes = encoder.TagBytes(field_number,
+                                  wire_format.WIRETYPE_LENGTH_DELIMITED)
+     tag_len = len(tag_bytes)
+-    def DecodeRepeatedField(buffer, pos, end, message, field_dict):
++    def DecodeRepeatedField(
++        buffer, pos, end, message, field_dict, current_depth=0
++    ):
++      del current_depth # unused
+       value = field_dict.get(key)
+       if value is None:
+         value = field_dict.setdefault(key, new_default(message))
+@@ -621,7 +642,8 @@ def BytesDecoder(field_number, is_repeated, is_packed, key, new_default,
+           return new_pos
+     return DecodeRepeatedField
+   else:
+-    def DecodeField(buffer, pos, end, message, field_dict):
++    def DecodeField(buffer, pos, end, message, field_dict, current_depth=0):
++      del current_depth # unused
+       (size, pos) = local_DecodeVarint(buffer, pos)
+       new_pos = pos + size
+       if new_pos > end:
+@@ -646,7 +668,9 @@ def GroupDecoder(field_number, is_repeated, is_packed, key, new_default):
+     tag_bytes = encoder.TagBytes(field_number,
+                                  wire_format.WIRETYPE_START_GROUP)
+     tag_len = len(tag_bytes)
+-    def DecodeRepeatedField(buffer, pos, end, message, field_dict):
++    def DecodeRepeatedField(
++        buffer, pos, end, message, field_dict, current_depth=0
++    ):
+       value = field_dict.get(key)
+       if value is None:
+         value = field_dict.setdefault(key, new_default(message))
+@@ -655,7 +679,13 @@ def GroupDecoder(field_number, is_repeated, is_packed, key, new_default):
+         if value is None:
+           value = field_dict.setdefault(key, new_default(message))
+         # Read sub-message.
+-        pos = value.add()._InternalParse(buffer, pos, end)
++        current_depth += 1
++        if current_depth > _recursion_limit:
++          raise _DecodeError(
++              'Error parsing message: too many levels of nesting.'
++          )
++        pos = value.add()._InternalParse(buffer, pos, end, current_depth)
++        current_depth -= 1
+         # Read end tag.
+         new_pos = pos+end_tag_len
+         if buffer[pos:new_pos] != end_tag_bytes or new_pos > end:
+@@ -667,12 +697,16 @@ def GroupDecoder(field_number, is_repeated, is_packed, key, new_default):
+           return new_pos
+     return DecodeRepeatedField
+   else:
+-    def DecodeField(buffer, pos, end, message, field_dict):
++    def DecodeField(buffer, pos, end, message, field_dict, current_depth=0):
+       value = field_dict.get(key)
+       if value is None:
+         value = field_dict.setdefault(key, new_default(message))
+       # Read sub-message.
+-      pos = value._InternalParse(buffer, pos, end)
++      current_depth += 1
++      if current_depth > _recursion_limit:
++        raise _DecodeError('Error parsing message: too many levels of nesting.')
++      pos = value._InternalParse(buffer, pos, end, current_depth)
++      current_depth -= 1
+       # Read end tag.
+       new_pos = pos+end_tag_len
+       if buffer[pos:new_pos] != end_tag_bytes or new_pos > end:
+@@ -691,7 +725,9 @@ def MessageDecoder(field_number, is_repeated, is_packed, key, new_default):
+     tag_bytes = encoder.TagBytes(field_number,
+                                  wire_format.WIRETYPE_LENGTH_DELIMITED)
+     tag_len = len(tag_bytes)
+-    def DecodeRepeatedField(buffer, pos, end, message, field_dict):
++    def DecodeRepeatedField(
++        buffer, pos, end, message, field_dict, current_depth=0
++    ):
+       value = field_dict.get(key)
+       if value is None:
+         value = field_dict.setdefault(key, new_default(message))
+@@ -702,18 +738,27 @@ def MessageDecoder(field_number, is_repeated, is_packed, key, new_default):
+         if new_pos > end:
+           raise _DecodeError('Truncated message.')
+         # Read sub-message.
+-        if value.add()._InternalParse(buffer, pos, new_pos) != new_pos:
++        current_depth += 1
++        if current_depth > _recursion_limit:
++          raise _DecodeError(
++              'Error parsing message: too many levels of nesting.'
++          )
++        if (
++            value.add()._InternalParse(buffer, pos, new_pos, current_depth)
++            != new_pos
++        ):
+           # The only reason _InternalParse would return early is if it
+           # encountered an end-group tag.
+           raise _DecodeError('Unexpected end-group tag.')
+         # Predict that the next tag is another copy of the same repeated field.
++        current_depth -= 1
+         pos = new_pos + tag_len
+         if buffer[new_pos:pos] != tag_bytes or new_pos == end:
+           # Prediction failed.  Return.
+           return new_pos
+     return DecodeRepeatedField
+   else:
+-    def DecodeField(buffer, pos, end, message, field_dict):
++    def DecodeField(buffer, pos, end, message, field_dict, current_depth=0):
+       value = field_dict.get(key)
+       if value is None:
+         value = field_dict.setdefault(key, new_default(message))
+@@ -722,11 +767,14 @@ def MessageDecoder(field_number, is_repeated, is_packed, key, new_default):
+       new_pos = pos + size
+       if new_pos > end:
+         raise _DecodeError('Truncated message.')
+-      # Read sub-message.
+-      if value._InternalParse(buffer, pos, new_pos) != new_pos:
++      current_depth += 1
++      if current_depth > _recursion_limit:
++        raise _DecodeError('Error parsing message: too many levels of nesting.')
++      if value._InternalParse(buffer, pos, new_pos, current_depth) != new_pos:
+         # The only reason _InternalParse would return early is if it encountered
+         # an end-group tag.
+         raise _DecodeError('Unexpected end-group tag.')
++      current_depth -= 1
+       return new_pos
+     return DecodeField
+ 
+@@ -844,7 +892,8 @@ def MapDecoder(field_descriptor, new_default, is_message_map):
+   # Can't read _concrete_class yet; might not be initialized.
+   message_type = field_descriptor.message_type
+ 
+-  def DecodeMap(buffer, pos, end, message, field_dict):
++  def DecodeMap(buffer, pos, end, message, field_dict, current_depth=0):
++    del current_depth # unused
+     submsg = message_type._concrete_class()
+     value = field_dict.get(key)
+     if value is None:
+@@ -926,8 +975,16 @@ def _SkipGroup(buffer, pos, end):
+       return pos
+     pos = new_pos
+ 
++DEFAULT_RECURSION_LIMIT = 100
++_recursion_limit = DEFAULT_RECURSION_LIMIT
++
++
++def SetRecursionLimit(new_limit):
++  global _recursion_limit
++  _recursion_limit = new_limit
++
+ 
+-def _DecodeUnknownFieldSet(buffer, pos, end_pos=None):
++def _DecodeUnknownFieldSet(buffer, pos, end_pos=None, current_depth=0):
+   """Decode UnknownFieldSet.  Returns the UnknownFieldSet and new position."""
+ 
+   unknown_field_set = containers.UnknownFieldSet()
+@@ -937,14 +994,14 @@ def _DecodeUnknownFieldSet(buffer, pos, end_pos=None):
+     field_number, wire_type = wire_format.UnpackTag(tag)
+     if wire_type == wire_format.WIRETYPE_END_GROUP:
+       break
+-    (data, pos) = _DecodeUnknownField(buffer, pos, wire_type)
++    (data, pos) = _DecodeUnknownField(buffer, pos, wire_type, current_depth)
+     # pylint: disable=protected-access
+     unknown_field_set._add(field_number, wire_type, data)
+ 
+   return (unknown_field_set, pos)
+ 
+ 
+-def _DecodeUnknownField(buffer, pos, wire_type):
++def _DecodeUnknownField(buffer, pos, wire_type, current_depth=0):
+   """Decode a unknown field.  Returns the UnknownField and new position."""
+ 
+   if wire_type == wire_format.WIRETYPE_VARINT:
+@@ -958,7 +1015,12 @@ def _DecodeUnknownField(buffer, pos, wire_type):
+     data = buffer[pos:pos+size].tobytes()
+     pos += size
+   elif wire_type == wire_format.WIRETYPE_START_GROUP:
+-    (data, pos) = _DecodeUnknownFieldSet(buffer, pos)
++    print("MMP " + str(current_depth))
++    current_depth += 1
++    if current_depth >= _recursion_limit:
++      raise _DecodeError('Error parsing message: too many levels of nesting.')
++    (data, pos) = _DecodeUnknownFieldSet(buffer, pos, None, current_depth)
++    current_depth -= 1
+   elif wire_type == wire_format.WIRETYPE_END_GROUP:
+     return (0, -1)
+   else:
+diff --git a/python/google/protobuf/internal/python_message.py b/python/google/protobuf/internal/python_message.py
+index 2921d5cb6..c7fec8c1c 100644
+--- a/python/google/protobuf/internal/python_message.py
++++ b/python/google/protobuf/internal/python_message.py
+@@ -1141,7 +1141,7 @@ def _AddMergeFromStringMethod(message_descriptor, cls):
+   local_SkipField = decoder.SkipField
+   decoders_by_tag = cls._decoders_by_tag
+ 
+-  def InternalParse(self, buffer, pos, end):
++  def InternalParse(self, buffer, pos, end, current_depth=0):
+     """Create a message from serialized bytes.
+ 
+     Args:
+@@ -1179,7 +1179,7 @@ def _AddMergeFromStringMethod(message_descriptor, cls):
+         # TODO(jieluo): remove old_pos.
+         old_pos = new_pos
+         (data, new_pos) = decoder._DecodeUnknownField(
+-            buffer, new_pos, wire_type)  # pylint: disable=protected-access
++            buffer, new_pos, wire_type, current_depth)  # pylint: disable=protected-access
+         if new_pos == -1:
+           return pos
+         # pylint: disable=protected-access
+@@ -1192,7 +1192,7 @@ def _AddMergeFromStringMethod(message_descriptor, cls):
+             (tag_bytes, buffer[old_pos:new_pos].tobytes()))
+         pos = new_pos
+       else:
+-        pos = field_decoder(buffer, new_pos, end, self, field_dict)
++        pos = field_decoder(buffer, new_pos, end, self, field_dict, current_depth)
+         if field_desc:
+           self._UpdateOneofState(field_desc)
+     return pos
+diff --git a/python/google/protobuf/internal/self_recursive.proto b/python/google/protobuf/internal/self_recursive.proto
+new file mode 100644
+index 000000000..2a7aacb0b
+--- /dev/null
++++ b/python/google/protobuf/internal/self_recursive.proto
+@@ -0,0 +1,17 @@
++// Protocol Buffers - Google's data interchange format
++// Copyright 2024 Google Inc.  All rights reserved.
++//
++// Use of this source code is governed by a BSD-style
++// license that can be found in the LICENSE file or at
++// https://developers.google.com/open-source/licenses/bsd
++
++syntax = "proto2";
++
++package google.protobuf.python.internal;
++
++message SelfRecursive {
++  optional group RecursiveGroup = 1 {
++    optional RecursiveGroup sub_group = 2;
++    optional int32 i = 3;
++  };
++}
+\ No newline at end of file
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_3.19.6.bb b/meta-oe/recipes-devtools/protobuf/protobuf_3.19.6.bb
index 9bcd208acb..95a76514a5 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf_3.19.6.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf_3.19.6.bb
@@ -20,6 +20,7 @@ SRC_URI = "git://github.com/protocolbuffers/protobuf.git;branch=3.19.x;protocol=
            file://0001-Fix-linking-error-with-ld-gold.patch \
            file://0001-Lower-init-prio-for-extension-attributes.patch \
            file://0001-Add-recursion-check-when-parsing-unknown-fields-in-J.patch \
+           file://CVE-2025-4565.patch \
            "
 SRC_URI:append:mips:toolchain-clang = " file://0001-Fix-build-on-mips-clang.patch "
 SRC_URI:append:mipsel:toolchain-clang = " file://0001-Fix-build-on-mips-clang.patch "
-- 
2.34.1


