Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E68D4CD13D8
	for <webhook@archiver.kernel.org>; Wed, 12 Nov 2025 13:44:56 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13531.1762955092548408793
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Nov 2025 05:44:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=rRQLvDdi;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3411d85ce0=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AC6oo601853338
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 05:44:52 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=eykKBorNRdE611Y5gTjHR8GZGoHO/F39bPhSBZYv4kU=; b=rRQLvDdiswYv
	II3RgPkFmjZRX7EnUUvGv1g1rh9le7W6YaAowQBbcOX1bD5YIkie08ouqFG465CB
	8ZaqQZZ0zEUrWlMSxQc9lVr+J0hshbfw3qi3qYPmZwAHthtujMWtzXmE6CDC0szF
	kPuN9yiKFP8NIJXTcIRtXH+4tSeovGGfrrEonai19x/qifbwL2wHFabz0Ezl/WRZ
	do7B/kxkIYKYhUSenhh4g9YzunMZZq+0lwE0vDKLyrqCjwzAJAkjxINBs6hh9tr9
	U7ouKT+mbXBObULHdx1Tun/rUbuGyK9EP7UotO0sz335eRDcj4g+vhCJ8w0GHP2T
	bCofpctqIw==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011071.outbound.protection.outlook.com [40.107.208.71])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aa213548q-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 05:44:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l9rOuiKWyyVi0FjkZ7DhOWjNna8yaD+BvsxYl2/lBHeijW0Lepy2VBfbLF/10AVPJDQHHhzf+1iDP5cUfjMm22EYVRtNFjfAsqOtl6juytfA2gX39ruc5yfc2ln1tCvGisLalaxzctiXfL/lN+kKhhRCwhmH74qZWJE2YRI95gBxJdpmOOEEpjkTVNATpi4FZc7YAtYeMaRgwmLP3TUgy3Cik7g1JdlP81chsqCqkIGbXJBCPUit//AdO2TfKZVTicYrYw/150IrNZ8Bqkn+byQsRC0xGr55Qnb8/TFBvFQ63wZoXkL1UKi3IRaTzjgxF7iwQwiA4CoXoqNqobUOOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eykKBorNRdE611Y5gTjHR8GZGoHO/F39bPhSBZYv4kU=;
 b=H+/zeb/YZe9oYLHq60ucsC9jud34xwGBcY0Qefg0cGvZRM679r9XGogOUESiGOFMcynbYqk5HFCHaPJ6L2/0BnaUIcPwsQxNOnP+FbYzaKJwT19hYwCvsjuuAODX2xFUQa3OWwNMHtTAiTamOY1O4iEo68jFW5WJKeQBShQgcqex3YLeUlI8uCUPnTGmwHPSOO62yQxYeEbowkfSIBP48zM4myj01TFjBd9G3J1z9wEOtzYB1I2bOn2llP9mz971Gk1+6mkFnJSG0kgaJNoBt9w7KKOxYQWmeBNrpAJKzOPJ/2fjFrgWxdMdHTldByP0uTOeEUfVd94WUPRxuXxGsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 CY8PR11MB7241.namprd11.prod.outlook.com (2603:10b6:930:94::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.16; Wed, 12 Nov 2025 13:44:47 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 13:44:47 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 17/19] protobuf: update UPSTREAM_CHECK_GITTAGREGEX
Date: Wed, 12 Nov 2025 21:44:03 +0800
Message-Id: <20251112134405.3706508-17-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251112134405.3706508-1-yi.zhao@windriver.com>
References: <20251112134405.3706508-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0125.apcprd03.prod.outlook.com
 (2603:1096:4:91::29) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|CY8PR11MB7241:EE_
X-MS-Office365-Filtering-Correlation-Id: 38869440-9eb9-404e-10a7-08de21f1a506
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?k35kllcD6merEKq1s5a9ghRSQmWAlPrSrlFOc7PLLDe/dySjA2zn2bB9JNUQ?=
 =?us-ascii?Q?Yxp/7JeCJkBR1mjYhmW6EF12wFmZ1oMwAIZouqwtw8Mk1zNzt4xyGBoegn/m?=
 =?us-ascii?Q?/Bx934Hy5FIjwlLWeFcVPov/MyeGdmsX1j73toHSh4J/RTuF44cXa7LhuHlL?=
 =?us-ascii?Q?rRBqnXVn4o0fZ29Tm55Uyf3RMdPIR+m/mdl2QbW/qGGIvD45PtpMvoii9F9a?=
 =?us-ascii?Q?PHL6LX6zeVOZKQefzCPyCuRHxqQdHtriaxdB3e7Dk1ANKbkyF4OarAM9bgTk?=
 =?us-ascii?Q?bqXS4GI/GE644g7jHPnZDT37XVmXhCFBmpk0RbXVRjYP05r13lH8vM3qnoR4?=
 =?us-ascii?Q?MuZ5M2arip+O3k+qXfoAbbdAIEkxmX/lEzYIgC+K9UOu7CUTVdt4K+Zz60Hu?=
 =?us-ascii?Q?t7920AQod897m4y2d+wBlRbQYejce/m4eALLaB3lr7ZbHsGgAmdhosE7YxwP?=
 =?us-ascii?Q?RcDvLO8/8DPEgtQ8mT83H/eadcPkYvKjLkiAkY9GhgdA8c4Pm13bHRe6x9vz?=
 =?us-ascii?Q?wrS3+Nv5dW1J/XuEInLFs79czey40Gyim7R+ZPV2TZl4qJTIduLIOQ4TTUNA?=
 =?us-ascii?Q?8VI+5x8vR7M1eIGzT74nldBA20qdpTkX2bHXrV6naOcARE/20QQFePsZoGHC?=
 =?us-ascii?Q?26cVQB6iJCakVKkQETPAz0fzgcVboAZj2zhxWgriL0LAqlUhuMRnjLpvGgwr?=
 =?us-ascii?Q?eZpQ3aCD1qimxyd8POTWYRaiQDtZKwJ4E1edRpQeQTk5r4nvj5KgNk3W+p3G?=
 =?us-ascii?Q?rSSwmB7pxIZPnVBGWlq9EgC34HoASnkOQJs3nf/IVkuzsICtTq8lapMAUDa+?=
 =?us-ascii?Q?lSnL2ey893gduikLky9Y2PyBgXq3R35yfMpESkOqNGf2UoayIRQu6V1XBbTb?=
 =?us-ascii?Q?+Qe1v/dieVAVCjR1uqnv+K6uJuPHjBsX9mhvR9yEsMZUopIOR6yTOOKv/Uhp?=
 =?us-ascii?Q?CHZuOru7Wn9r0UVs0JEOlISnagLIwL8AV5gPSgSu0p7qsty8EIOqt7MIhPeV?=
 =?us-ascii?Q?3HqegVe7ARWNS/ZCaOMhD3M+F5+JAX3TtMC5UvYVJgVMGP+bHkJ+gBuBnmlY?=
 =?us-ascii?Q?DymDTsvG3cBJAybL9H5xbTOGMeKGBFm4a7YJvGSyquiS/uJRvWfcgZ381g8B?=
 =?us-ascii?Q?vEuW3oCEWRR2j+OlkGkH4KtfJXilYr8NYaRJL2PstGr7yK36v1WY0e4lMexC?=
 =?us-ascii?Q?DGR2rGobSsVzjLHgKN8RrhmecWhkDk8b+O+FdRXHyL3IxiazB8B1UWSqriA3?=
 =?us-ascii?Q?w7eIJTNGEexy4pJNzj2fu91ZqPbV/JfNY+k1gZqrKI0L5CGnUOdg75pMSy/X?=
 =?us-ascii?Q?YZWI5ukHiqXBOa7fmTrJXf6360Sq2D2AsgLDpPcxvpIfgweomimK0Jkt2VR4?=
 =?us-ascii?Q?7VB1SfVxCNpeteWR5e8N2Q3VxCA+2uuXa0gfovjJXoIOYrucvhEctdWoAgvH?=
 =?us-ascii?Q?Frqxe5UXApw/PkqNFeFHQRQIGQp2LqN9sMRUxnsOB6P+63Zpi+sj3iPwCy3P?=
 =?us-ascii?Q?dw1kO7mOm6K2joE2JU+ZP8cGQSFXNBv6l+jx?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?BuDD+QfyHBru5JOJYqVHe4Mf6GgH7URoP5pExLa0DjsiIbSjVXHZpi2lXOI3?=
 =?us-ascii?Q?C2ld2kYWxHSUFAlakoB4OP85qmxFWPlCRrBFWc5OZh0ggpy1VN/rhr99T7h0?=
 =?us-ascii?Q?RwvsTNn2kWXrjx5Yek9/5gFbGyiTAbN9qlKhGyFZOZ0bP2xWOAMovJeAxIdK?=
 =?us-ascii?Q?yv6N4W13scKBQLmW7BpUqi691j7q6Fac/uZQ1BqwNpHgD8HaXzJPU71mp8Rm?=
 =?us-ascii?Q?uA6/JI1lSVfOOl9kGl1tFlb42RbUsJ5Pfdn6o4gjr0j3Xzj+j+uiu8Ai2uK0?=
 =?us-ascii?Q?DQCpRwSXlB9ik1akWWrY+AVGVc1ywjTBqRmtYA7D8rSS4KekSOevzmcVKJXn?=
 =?us-ascii?Q?G5Ma9uGTISoNKQG5UlCwTxRE0DkcdvJ/oHbh3V2l85lIRC31Y0B+Yf9wjSX0?=
 =?us-ascii?Q?PkyRwFGrVdfcGIw4JwLJCsoeP1jcP4ahS3sMOFwvApz3QIwD4BT3EhX03gte?=
 =?us-ascii?Q?uk+Mwv9f0tVQpeQWTWYG5NHGZ9eTmqG/9xzeWH1m4vfBqa3s0d1mIF0GE0j4?=
 =?us-ascii?Q?bMEaFQ15Z73pN9JYMAfEBCLZ3LL2BnvynntTxQndJmUohcH/3SAX952vKs7c?=
 =?us-ascii?Q?8yieSkWSyX+X9VYieTpO7RO2TUDwjxGMz2iMg2Z+3HjOmq3MHPukCXG/zL8K?=
 =?us-ascii?Q?2RImoXBoZlPbAKvkAl9hxOCPOgHQizpZaRBMdtxENeZbMRwKD7CdgYIbr/dS?=
 =?us-ascii?Q?Oatc7PQZwonJS+sBNpglpRhASnRovAL+7dk3Uqn0fmlQIrFvkJGAag2rDn5x?=
 =?us-ascii?Q?GZdM9I0rT9vF8PJIXvyK0PPhVmfAVMiKM0xhwtCAV52AKf4Ht6Qwwjwk7VQC?=
 =?us-ascii?Q?gHLfKLXrNtGLqLU0ws6WDFokQ6x0AP29Qw4HQ6ChBTSe42HR/bCSdfyNotVI?=
 =?us-ascii?Q?OUwkoP2lSVI07C9bwW5yk8il/nTU//EiOxpWRNYN9dy60nMAF+03+THthOhg?=
 =?us-ascii?Q?ILu+14QMwtcxgF5tbO6jGMBRkY2dEzh14KDASJNJO4r85RlaQuBKqiG6MG4V?=
 =?us-ascii?Q?lqii8DIZWDHANQ6lzhYyih+4f5zc4hyW7is3DUaSFF8Y05ed9VHfs5NZCC/y?=
 =?us-ascii?Q?pHZ6UqMDQfFqVM2TF7saALvfVIpHjTJfFN48dbNpi92PY9lJTSuubL/PpxwR?=
 =?us-ascii?Q?w/KZVbrPhNuNaUl6LDtI4CkwT8JPktVE1JRJCuRayD5PJqIvFI7d2+U/aTGD?=
 =?us-ascii?Q?4kAwLL+y4BsNjNy7KRLzBfQFzQBmRP8rn87X/pk6NrzZJVZA+CJuPFoQ1oE7?=
 =?us-ascii?Q?ZMD1N4uixlaf1HdlwWOLHStOarqvySnutBqxYEc512+zUhdvMI5Fcff/5ULG?=
 =?us-ascii?Q?JvkAI/pyIclrOE3ZCsiV4Um4OiwZDy/dooGVDZM6/JgwEwlt7MGm/1fd1Zh7?=
 =?us-ascii?Q?nb3o9kh2Ehzr0mSBilZvM7Q7XL6A48OGyjd3WD1Tp0yszcWuYFkTi/ZgsB5Q?=
 =?us-ascii?Q?8WhoSl3tk4LA8Su0hRV3tt1eg+4BuxxGStJn3ukEFSZDP4/0+KyLwE2cWgY6?=
 =?us-ascii?Q?vAmkTWPzsZNezKge6EWLe4HRAjkF9B4z4TJNnDo17ju/ACLFORQWqwuhHvju?=
 =?us-ascii?Q?A2k+3ArM0cFqAF1bdloqsq74uH56eWSwj+G3L0vq?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38869440-9eb9-404e-10a7-08de21f1a506
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 13:44:47.5788
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eC7tpGFuIkte56zPTUle1/KrPYEYFwddBU+R93zeS2JogLvWxhuY6bZ5SIPuZsWVNuPnh1JlvR/AWy1NgIikRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7241
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDExMSBTYWx0ZWRfX8Cz0O0iTFQnA
 FkWlEyAnW9hNTaFsClieoPD8Zt6qKEM6qKddo4s9NCnhgZ1GjeAToV21ZKwqUyUHICIaAp3/p43
 eKFpDhWD8DQF4E6OXdfB6AMXpSlie54jsZNysnvNDo8OhAUpWMMxJW1BbLp45U0/iATEV1M8PST
 MFlkzdA3JNMXeNlGuQEjcsrRy3LJhqCGQzkNAFFySt6x+XKhlzx34po/AUiiJ06PSdE1LcoHqdK
 UwbJhlPGK4qIb9WNZtC/4ug+eZA7AuA3yMwu/txqXTWHaXxdYAZuxqidXOi1SOcipyk77B4OYBo
 aAYaZPPfAWiXmJcDSOgTnisrLTlsSZsOdRBzK8dTGRyEAJi0OUhBwcMiMjGxANSAMa9dBjDXaPv
 66Nhw22PIeND6mD63OM/8COs3Zs3iw==
X-Proofpoint-ORIG-GUID: oU5StPdOV6Jy6HhrZwxe3z_DwX2OZChP
X-Authority-Analysis: v=2.4 cv=XPA9iAhE c=1 sm=1 tr=0 ts=69148f54 cx=c_pps
 a=cgmL7KMsZDthlzKGM6UXqw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8 a=qGR9oC7-4wTYETT7tfkA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: oU5StPdOV6Jy6HhrZwxe3z_DwX2OZChP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_03,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 adultscore=0 bulkscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511120111
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 13:44:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121546

Update UPSTREAM_CHECK_GITTAGREGEX to check the correct latest stable
verison.

Before the patch:
$ devtool latest-version protobuf
INFO: Current version: 6.31.1
INFO: Latest version:

After the patch:
$ devtool latest-version protobuf
INFO: Current version: 6.31.1
INFO: Latest version: 6.31.1
INFO: Latest version's commit: 74211c0dfc2777318ab53c2cd2c317a2ef9012de

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-oe/recipes-devtools/protobuf/protobuf_6.31.1.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_6.31.1.bb b/meta-oe/recipes-devtools/protobuf/protobuf_6.31.1.bb
index 90be1179aa..37b26b610d 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf_6.31.1.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf_6.31.1.bb
@@ -22,8 +22,7 @@ SRC_URI = "git://github.com/protocolbuffers/protobuf.git;branch=31.x;protocol=ht
            "
 SRC_URI:append:mipsarcho32:toolchain-clang = " file://0001-Fix-build-on-mips-clang.patch "
 
-UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.(25\.(\d+)))"
-
+UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d\.\d+\.\d+)"
 
 CVE_PRODUCT = "google:protobuf protobuf:protobuf google-protobuf protobuf-cpp"
 
-- 
2.34.1


