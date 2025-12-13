Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B68FBD59F73
	for <webhook@archiver.kernel.org>; Sat, 13 Dec 2025 04:17:04 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2694.1765599416088161315
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Dec 2025 20:16:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=X4ICggDW;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=44421a18bf=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BD4AvOL473811
	for <openembedded-devel@lists.openembedded.org>; Fri, 12 Dec 2025 20:16:55 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=u9molaKsP
	BEiOmi3XsIY8kSKQE95MetpyUvFostpbdI=; b=X4ICggDWByeM+gfJpUFcKHhUQ
	htvSf+Vp6Hq9U4OeDo2QqlChrYQCZfLCEVXiUZSyLB+ro1c+4KoaTo5fzNHehbpQ
	A3i/cH9tP0kccxtXkM3nGlmNqH9liyFrZkztARoYU5CsuUGpPne3Yb7i1DSiF0AO
	QTegcxGDv83CyyPbE5WP5SVrb+r5HFn2mNlioRH/v8geuOowyfHhZzM3e5P/5zM8
	+fJDKnLV3N7YspN2pCbsnXx1r0g9wcZNYnTd7cvXdC18LXhrih5rQU5Zwq5gZS0/
	EXTr0o3nVT4PE3fo3z9XUnDxRc3AtQpAd90M2vkE6uP+jrn3FwvUgmz9urQQw==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012055.outbound.protection.outlook.com [52.101.43.55])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b0sx4r96h-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 12 Dec 2025 20:16:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=os0n2UCozgeiOnd4+Y/GYqPz6tnTbcOjQu0A5EiNw0JLT/uK0U4Un1INmR7A9SH5iuPh+HPDNqWI6yWaSjq4KFFeJ0Z+hJmkLiGgndZxWIM1H7aUJG0maMyNg87GmqHBX1VGukIb/tqWVAjEOekN5OGOo6Dv8YAb2eQKEmJlxsoKOm6Igau3VjNoETxxHh9QSNWsxet3yBQrwzyDTziZptSCiWs+1Plf0YXhLonsqUIMivUDjtl2MjfEijDd8cJOtS66nnbb8qxaMIRXzlsJTzu3QNGotV8dU9xJ6vloKS74IW9HzX73B5OoeorDspWKXtP0ltgBFaHOilmby7w2Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u9molaKsPBEiOmi3XsIY8kSKQE95MetpyUvFostpbdI=;
 b=anyImwbNOz7KCGVRemGoFwq8OtS1eaVUGlpH7Ra2h2Ml96R5YYd8K2uQeyu7ZfAukEi2oNRHKpX1PzlIJbzK2LVFwN45k6oZIxgAHi7e0TaN1oCzLmBPT0WUW4VjuhM/fKZSq7GQAATWDEIkgOs3dIP6rEVK6LfOeNsFxGpXP+/fjDAuXCM9klXvZzqTZCUF4Lw0/pH3GWkq9LlC2DVfuiV5zvSuMIpHVeBtuOcDKZK1LV9xDOxgBqwIDJupSjFfWEU3FRRG41jJ5f3lmr8FEsIHuay6gdNWwb6fpEgk5s3WnOd+CvdT6+a4ZSxRGJu2gs/8edxxEH6dKJ4zT8rQvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by SJ2PR11MB8537.namprd11.prod.outlook.com (2603:10b6:a03:56f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Sat, 13 Dec
 2025 04:16:52 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%5]) with mapi id 15.20.9412.011; Sat, 13 Dec 2025
 04:16:52 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-devel@lists.openembedded.org
Cc: Deepesh.Varatharajan@windriver.com
Subject: [meta-oe][PATCH] ripgrep: limit libstd-rs DEPENDS to class-target
Date: Fri, 12 Dec 2025 20:16:35 -0800
Message-ID: <20251213041635.3859879-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0100.namprd03.prod.outlook.com
 (2603:10b6:a03:333::15) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|SJ2PR11MB8537:EE_
X-MS-Office365-Filtering-Correlation-Id: 07ecac5b-f3da-40c6-a989-08de39fe7185
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?vDvC9/PsqYBMUsy4Cx4jTgVhbVoZYf3HfsXYmj00AmnoOMMcl5hg9jmbt9Np?=
 =?us-ascii?Q?do8m5AUKraq9QhII/jDwKxVKavbcQREiXZ1xrAVCvuYlLFWLMxaiN/1Tozz0?=
 =?us-ascii?Q?qI+zFPswVCuOZwkf8tp3tYDuLoCqHh4ZG+nGtrJukQitZDvr6/P8rKJai7gE?=
 =?us-ascii?Q?HFo1RFS+FDMQ5945ADMbzLe3Ezl/SMOcHeVRWVuhd/+BQEzvcG8mI3epeFGv?=
 =?us-ascii?Q?4fZtaMp9kBmnLHb11+IWjEZ9sSuhJPopV1EjD9JIkNn6MM4/EnSnf4fwMDnR?=
 =?us-ascii?Q?LMbaac1MNQRtYSjyRWE6Csu5rWBKNqCuxEO3/HL6a73kiK9mJImE/73S9dr2?=
 =?us-ascii?Q?y1VKm7f2rTpr9aQpEvVTNRpzSzsRMyqXKiyMAALaldPedq0T9JD8VZhlwiNE?=
 =?us-ascii?Q?/pRMP7NNvNzvpe7tcVhQkOIHRLNSXUKS2NQfhXXVHOBlM+UwcCrTpuBo20cZ?=
 =?us-ascii?Q?IruIcFHRNI9/X01kBuRaf/E7gUnfUM0fKhrnOzFH0GF6FPHs39BrljpJxNb9?=
 =?us-ascii?Q?Flv4WcpeMJ50WY6aj1tExVUv7s0fd51sGOBCQS/pKrBwRsOdmJGqz3vPKSOs?=
 =?us-ascii?Q?qnZ1ayf7eo6TosdzsRo9msPGv60eWoTh0AE+TWrCym/q3W+bMGAT/NPBDKu0?=
 =?us-ascii?Q?Lw+nwL86RzZsXsIKz64BR83XRAwXz90Qh3b6/cmQDtHhcnm4bqoi7aPqUUr1?=
 =?us-ascii?Q?fiAchDaucQ9wpbbg9f0zxOFX+Qzt+QQL/Ny8zwDqafC/zzOdaFFD/rMYicpc?=
 =?us-ascii?Q?TBRAGIEQTxUHKDKrx72imVYYGCQjqvURxU4UlVKA2/7aQ2M5LkQCaTEvaSDd?=
 =?us-ascii?Q?PT8kOp4epjwSccS2lW53OGFzPBj9oe6qszztmeiUu1ai5b9KhcJSdF/m0eOd?=
 =?us-ascii?Q?WavRCknP26tnAM0HxPpfGprB8LAVMtr0zQKhW2/KclW1CgyoeKJDvqKe1dbQ?=
 =?us-ascii?Q?nOPyF6/2QJ3erJpuhzup70zfCK969i1S/weAMbto6j6rkrvgMmo0pZC6IEzz?=
 =?us-ascii?Q?pp939BVPy/JPjVbLkBQt/ZhtoC+AyiT5Tf5/DO30ExJEw1J1rBZGv3D+FEdF?=
 =?us-ascii?Q?74dkg+IndllI8te9/XHf0W+XVtB7U/00lcPZqBdRKhBwoFgfpcqTls7JbxlF?=
 =?us-ascii?Q?keqOQtn/sLx57IwZM6195knv8HgRyS4lkUPJcqNmKjRbNHOwVHpymXFzSJYh?=
 =?us-ascii?Q?GBx9STZwPqshO9kDlh76XwwzAgP2eFSbnKCbj9/FemwQGTeI6nMZKMzclQqA?=
 =?us-ascii?Q?rbc0d6t9xNVP+1mUJ0Xqued1BdDq9hFlPuEYu+jf1h6ck3VOetwOW3XqzzAT?=
 =?us-ascii?Q?/5S8oVfcZwR9qwHW842n9NC1WLL8tQ7aiEExrC32GnBBHcHJdL+K8rntUde0?=
 =?us-ascii?Q?2rTuoqotqeYX3gG2O3cNXWE/naTPW+3q8JFv1zCF3bThb2vAiEWd8C9SV+gP?=
 =?us-ascii?Q?XQuxx5nRF/tkGKPseh81nPVMTq3gEPdXFxTbm2OfLaDd32+KkkVZEqxYjoJ+?=
 =?us-ascii?Q?WVhXtk1D1hSTGhlXLD1IZjuFnB3H/5e31u36?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?EQ9QgQ81R0g4wFyvQirvF0nneNtaqudLnsg+4y0lZTRQVsCnuBg2CZJQacZ4?=
 =?us-ascii?Q?ML/FKGZB11ZtldyHicCzh/TbjV5pt88cOy7GhZnq7KthbFbv9xupjWJLVEJW?=
 =?us-ascii?Q?ya4NInPgJlslQurN75QTqgVf/0oz5B4x1uQz9MCZlb4Im8iTbMTO4WMK8CRw?=
 =?us-ascii?Q?mY0zrargZjxXAMJc7X9jh3uDeSs+o1tG6To8zLR31Mu0CaNtSS24A7IeI+Gq?=
 =?us-ascii?Q?ziaXrB7zKp+DD3pb4PSGelR+k6b+5yzWFxIKKG62EMWa0F6+eeAyxnjYlahQ?=
 =?us-ascii?Q?GrobagtxnVhhtO6qYPf3l/wmRj66No8Zq4Lt7+zvpjvIIwK/dKumkiYRsL5x?=
 =?us-ascii?Q?KwZLJt5qiI+SU4ANH5sLLCrwZTQsvJd8OJLk9NolbioP9bzZMOqXvwJSlLwR?=
 =?us-ascii?Q?Et49c/OX/+2DCXvdNEb6UUOd3pF6LC8pCYxkla/4kl4AUiJYc1NpZzOurwiE?=
 =?us-ascii?Q?6Qj1iKeUq0voPeUcmVPDSPEZvw3+Wz8Dg52n5Yba6iKpK/sHSCS0tHR3We0T?=
 =?us-ascii?Q?eZuIm1mCA63XpR0kkW6pY+43P4a38F+wzEgOAvEA2R4ggCI/8tIhaYunmimy?=
 =?us-ascii?Q?ZFnjV4gl1Sn2KgTJV19w8WHEad8R822q5aRrKFQXcE0Sc7nMdZyGCWXgDh8M?=
 =?us-ascii?Q?yYkKvT7kg6L8/0d8V1S6ryivuaxCxyE7bz6JoemXuOzhYfefecmrGbgOroaJ?=
 =?us-ascii?Q?XD33tIA5xA3uB3r3UrsLn8lg/gfIMLbzpIqxPqlxJYg5HLL3ICFBtd3IA3ok?=
 =?us-ascii?Q?PmFJ7a5GURjOXb1AbEcSJhb+q7gcSz7mTPfYZStmP/NU5zLYA9tkbxni5vDW?=
 =?us-ascii?Q?ImZV0y3YX1HTCfn3p8Ti9mdGnKMo1IM+t5Udq8bw1m2sOooBF7ZVbFVqDq7w?=
 =?us-ascii?Q?LM6qb1NY4LPxwbSZFctxyJb0ZdsWFWvSshESDoOxvdbRnS52+FTpgl9HgoLe?=
 =?us-ascii?Q?HdNTfJbd98RBxCOBectqE1yAOpYr7ipLalhkldenCA4Xa6ykMfB+g75pqglX?=
 =?us-ascii?Q?cxNnKdEldJjY1hC+BZD4vid+8avtcV7q1RJX7C8kMIH9DpNhb9sY015a7kH5?=
 =?us-ascii?Q?gU7H25dLpduzBh43vGibfwXgWSiFixZOtS86zoBGn8ZmwaZnVgbS1glrL/sL?=
 =?us-ascii?Q?YsXNTgjWKdCdgOYz4DQRmalQKJeBqzk5CWHLLYFONNC0sdk7y6zDpzcjIQGf?=
 =?us-ascii?Q?CdF6xJivDTS5y+SKyNhXTXMMJl6Jc6w2eyO7GN0S1WGshS4L8D+otdBv28jz?=
 =?us-ascii?Q?xg6bE38OnQ/h7119F7rFDwNczKDudrwHyxB0+SWAOPkpB+gFvgz83KaCjBln?=
 =?us-ascii?Q?o/VpEmEQzjzXIBZtc0qR6rVJMOei/+nLV+Ky239i01lWunnu6uUZz9m7e13y?=
 =?us-ascii?Q?4y2HB5fiuxC13jHAEWndO9877jcE5b5mDsIk/L2nMR93kfw+xQPWAHEwsE0Q?=
 =?us-ascii?Q?VmsEC3K5BCpjzJeTgXHAInTerDXvANkqidl/i0QRNiqEUIyI6LJAYBkJ979v?=
 =?us-ascii?Q?ZQ3EySNoEstZ+wvSb8f3UmBof5VCcoOuQCjEmz87/B181kw/GUgFMHk3w87Z?=
 =?us-ascii?Q?FVF0BFkVfCL/sOVRwpy4W0eVAv3MRjY5V8acqZnLNq7qavicm272YYSqzjvY?=
 =?us-ascii?Q?kLyXZ/nMDwtEr9e1AO4/aqk=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07ecac5b-f3da-40c6-a989-08de39fe7185
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2025 04:16:52.6382
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ih5jPteo1eiy1bediiJRQs14tPMyIGzt6X2ZRRWfjjGy4Kv8+JAF0iUZukla6s8q8t0+1FRFhI8aKLw5DlyBlVgXgUOTOWrqFECG8FahRsTdw1GyMXp+E3q3EnaggDfx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8537
X-Proofpoint-GUID: tkRKssAw6T195y2lfgDb57aATbF8TIku
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEzMDAzMiBTYWx0ZWRfX5KoVNUjTIQPF
 yzR2rjBjzUjxpqy/YUXUX4tV119/iLf2LZ8T8xotdGJIeiookZUw7mk+nJLUXJqUao6dJJsJL7N
 CdOZUQxK18NvfrpJ9w83gBBG3CgpntpwC/tPspR3iqzu1PiwOve29mLDulbT7XI+ld7Gz4armZD
 Fqm7QSXTbcK2V5W7DwxGQFxUqpxIDSlvlWsEYUUTHggGp7LaMh0FgmsKFV/OAvtB/szJEgPWt7E
 IzuDWyWo6evz0N9DwQSMPEu+prY8vIajjIvYfJ+eXiCMm6zF3Q3nFI3CmUV5R8/Km9kNWttt2Xb
 UrtmpLw9Y+vDGcvGmQ3XQ7BckIlP542x/c2AlIxBJjxYvfUbvUnnu9sv0rFwjcb+smsDFh+HpLZ
 Ol1KBPp1D5s+b2KTnZdryEbbK18dJg==
X-Authority-Analysis: v=2.4 cv=O7M0fR9W c=1 sm=1 tr=0 ts=693ce8b7 cx=c_pps
 a=tYxZZT+6B+k9mAKHHpnGSQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=WKhaYVCdWR8uvccLi7oA:9 a=zZCYzV9kfG8A:10
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: tkRKssAw6T195y2lfgDb57aATbF8TIku
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-12_07,2025-12-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 spamscore=0 impostorscore=0 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512130032
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 13 Dec 2025 04:17:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122628

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

Avoid pulling in a non-existent libstd-rs-native dependency by
restricting libstd-rs to class-target builds.

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 meta-oe/recipes-extended/ripgrep/ripgrep_15.1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/ripgrep/ripgrep_15.1.0.bb b/meta-oe/recipes-extended/ripgrep/ripgrep_15.1.0.bb
index 7bb6be1cb6..0ef671cf04 100644
--- a/meta-oe/recipes-extended/ripgrep/ripgrep_15.1.0.bb
+++ b/meta-oe/recipes-extended/ripgrep/ripgrep_15.1.0.bb
@@ -15,7 +15,7 @@ S = "${CARGO_VENDORING_DIRECTORY}/ripgrep-${PV}"
 
 inherit cargo cargo-update-recipe-crates
 
-DEPENDS += "libstd-rs"
+DEPENDS:class-target += "libstd-rs"
 
 require ${BPN}-crates.inc
 
-- 
2.49.0


