Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB38ACD4F43
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 02:59:34 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15357.1763002765014446838
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Nov 2025 18:59:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Vy3nW9Aq;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3412a946d8=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AD0VH7n1240296
	for <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 02:59:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=HtBGi2FZONa/Hk7nbPI+moIUX646AiyZFpgBrMLnSD8=; b=Vy3nW9AqFC+r
	fRIEkAiBPf/mHe6K/uY4begeRB9h8uEqmQFeLS8sXQCFW2qTv2sUGgd/mLWp5OGi
	txjOrCwbzDXZhpjTJd1Y+qoOXHlX9vQcXQSCQG9h4LJpBkkqw2XtdpJv9jJ2YXWO
	6WIKds/USPOAXIlnjQcnDEN5cW9O2HfJyODunaSGhi2spIz5TX3u0gHabhNuABYp
	m7dNuK7FWfyBtvVKbJzSCg1OTFelA2L+GvpNxzSAO5IGnkfb0nrStdESvECXnds8
	WVAmvxOzrXkffRyhHj8tdhDGKyj+eV5baHJJUByXKEvUgric82ij9FmP2Yh8HaWl
	pOY14BOzbA==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013043.outbound.protection.outlook.com [40.107.201.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a9u2x6pxg-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 02:59:21 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nJ+KenoRrblbCI5tA6vDeuNvcog1MJVifHd9peTX3S7tUzYBsYDcINsDJb1y8CK5lyxnZ3fA96WBmVJn0DvYyVQ4z/YMjXiAKwYoUUIpgp8Tr2wHWDhbIbB1BLzhB2CVTj5UDObR+srNvM4y7xZLr8bMSFHKJmKROFgkJ2/d5lvWZs9FwvZw7NK6ydQYMmtBBmfD0wX3M4x6T/4aLgqG3ubKz7b5GeyKimwT8T3orlHxzfiTai1sTxGX4v1oCmaKinasl7Sra3HB7rPwPPx0zl9lDCFWeYzns/GWJieajCmYRXGD96dFhnV4AXU9c1cGRnIQ9nMf/UAVN/glQdmvQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HtBGi2FZONa/Hk7nbPI+moIUX646AiyZFpgBrMLnSD8=;
 b=onnUMVq7HFjuQyqkugMLwJLLCTuVqRuqK9+rfcRalLL5vJsZjAnGmGs/t4X9G68MRVL6lGQnr/NPs6rU/0qW6X3gYXCjf4QOkrwjfEZmSdaDsSCmZ5MFKBIlWeu/sGFpHA4jclLiMf87gX3A/4bHA2PT67Tl/XOZwLmFu68oyTO17oqrVB/6iR2iL+6pyQfwjgxi4W/oDkIGDS9xnrxqr4BAOp06k8QUBpQud4GbZTYu6V8pCDamEow5UvYpKMPuEchIu67Ax7sZMS4347ou5nEmE3SZxKiRMaa35LPXG3iKKtKUcsiDJqB+vR67TZOP3Wl5kxb0fpnUItDSlarf/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 PH7PR11MB7570.namprd11.prod.outlook.com (2603:10b6:510:27a::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.16; Thu, 13 Nov 2025 02:59:20 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 02:59:20 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 09/11 v2] python3-pytest-xdist: add UPSTREAM_CHECK_PYPI_PACKAGE
Date: Thu, 13 Nov 2025 10:58:53 +0800
Message-Id: <20251113025855.1520038-9-yi.zhao@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: 7d4d9843-7247-454c-4cd5-08de2260a408
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?xy4ddDBdqdkgup8lc3f7VDPckjCrplN6uKdNUeQhmf1hzgAQmTY2WDXPkt9U?=
 =?us-ascii?Q?Xb8qX5PCHxE3P248KpJfuZ/+oLWMLmZJVDouwKmnxGVXyTztIzg/SU4cT2jH?=
 =?us-ascii?Q?YHrD11cV0SfPvX7QUNiSPgC6XNZxwHJTBHlpj6vfSzViKvMrW+YUOzWE1xWO?=
 =?us-ascii?Q?quO3tu1qEIxhX0ugxP2jrGK6+31Hk0+imHLqCm/mnO8YQbfXyBSu/0nxEUpl?=
 =?us-ascii?Q?hC/AhkDaN0PDRvPmkd8n0yWb68y8OGWJGlvLpXlrk7opdJ7+HhrIiivjgkcP?=
 =?us-ascii?Q?zItRnzLhKCkjGCAJDjlVmCTyDrZsRzeh0vLx7057tUMIZ1i7AsGHR8goYdgD?=
 =?us-ascii?Q?idtSpzDl+CC7kxFsUxyQHj02eIxUP45wZZcoSNUloWP59RNufQ6lCybr9dji?=
 =?us-ascii?Q?MKAMGG2xr5pqfkTFz9fMOTQT7bqUBZTro0DsuGjT/UgCkLOPrbquwjeQwjxm?=
 =?us-ascii?Q?9JK+C3ys1iO8ZN2RCxTB9pa8rtRl15eKHcRsXtBSTDnMlc6T1w6D9s/tmI8x?=
 =?us-ascii?Q?rX7KVzCxYhEsCkOGCAPEpxnUFgL7xjZd7Zir73ei9lfNOXNrmRgw/Z6hWTn8?=
 =?us-ascii?Q?Kc8mCJ2kchPIGIv8Ceo7qc/N8wcOtftJYv46yEgrnCXY4VKRsBSnYqW8COTE?=
 =?us-ascii?Q?1m8iAGzyOGx8Jh0yXQgQQRcIKdtz2fYE1PZOKMjpvI7UHNme7nN3IWGQU2Cw?=
 =?us-ascii?Q?AstyOBBULQjIAHD9eF7kOlY/zOSOHLJ9fooIue6mIPfDD2PSXUrmcevk4C+N?=
 =?us-ascii?Q?REqgS87IvNvgWZMqRHXKEYnsOgzazKM4SCxnLvCxfAfbzjsN+tp5L6UB+OBx?=
 =?us-ascii?Q?ghPEqgbjmHtMkYoMxZwgAvkLqpPfoUg29zR3f+TvtRjRylb6WrBzWfkK//m4?=
 =?us-ascii?Q?ZaOls6UvYTt/RRNxL4PApsvb5t5QrTZT5815MYw+H9XBsT1jUu2/+4wsv65h?=
 =?us-ascii?Q?ktkftsW+vJ71YbcfvZ2cTEOzJPLypU6fRRD9RJK6oIk5VWBYd/+eBc+zOGGu?=
 =?us-ascii?Q?keR734hXsonbvPYRoIu6o5ptu/lxNPkrhOG4TOfT2OLQPb3ZftzNYDgvbKNj?=
 =?us-ascii?Q?B/MlMjOLYW2jpo1dv7smWQBq7gi4h5yV8l1J9FKzR9ROHVkOns2ZtadR5nkp?=
 =?us-ascii?Q?GCPG/dPEIG6U62k5o6E60bWJrp8jQyzFLKNK8yGSo1VN23DigH8MGX4NNkwi?=
 =?us-ascii?Q?9H+p0eGp9aYUeBb5PpdHELWTL/sdtKVUlzkBdGo3pdiiDLBjay1QAevj9dle?=
 =?us-ascii?Q?S8ophD876S5uPDjLqVzRCzGxx2wDFIXwQ5gAUE6QI4CTq0ZhfzdZvJcATY40?=
 =?us-ascii?Q?XwXW3EAUCPNOHObaP/WzZ8jOWBXsOxfg7xFk99bm24CucEiC6EX23T2nteL9?=
 =?us-ascii?Q?ysIwDsbuvZ0qc4ofaNl4Qxq/RVfND1Cnn+PIk1/IvKDl2MxNuMXrHTrFCLgb?=
 =?us-ascii?Q?JvNu9Bib3qM5h/tvi4EwW5KxryZ3tvO+tq7NDSu7Ao1/0YL3+uTlEU0n0Aja?=
 =?us-ascii?Q?qFxCKsSXYdV7qcpREHYEtSyT0PGeyunmvgBu?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?HC0yGHlpEtQiMpHQ+ZI9klviwUFq03M8Pc/qEewV0O3wf5oI8PoMIu491jQC?=
 =?us-ascii?Q?2EjmyfQQdzuh2hdZX8Jl/pbpZc2gNnhidLUI6HGoy33pvLwMFe9wF+8a/5Jh?=
 =?us-ascii?Q?6m0OtRVaKssPLQ8RF6/MhZpsyObw0QprX90uWDPzM+7Qjt0Qv5lN04EOKdM6?=
 =?us-ascii?Q?Mn3CJfUD3cyvG+3DacfQylZoXBKET3LroFTjY5/w8zWfSms2S5mYKprrgF+U?=
 =?us-ascii?Q?fQDHzTMz8PiUSYNUBUeSy0IZ2Vj+xKyR92hJ8tcb/CiYoqMGq430SUFp079w?=
 =?us-ascii?Q?11YCfLc+MIDSbVPrf71aYahA+50YxAW+JxRoF5zo3kZHG+JW1RD+zdiPSuuu?=
 =?us-ascii?Q?cG2hBUORCUo/qNRA2NpdiEjrf24cQoIc0nVppDxGbxLdoHeEEyex//I5DktM?=
 =?us-ascii?Q?VxiIg+2PWqLpc9fcSf9AFEI3KSaYih+0sYdWI6Mwx7o7pXTSCuLuoqhot5KQ?=
 =?us-ascii?Q?9v4k63LdruncVTj30zQlU9yWj7F8k7QWdTpNzVxTEBz+xyMKZmxLZMUAUZI5?=
 =?us-ascii?Q?Jzz0grrmmwSG9lvmPDKEojIW1ZLCwLIGR/cPDqq21gdJxvnDKJcDJfpGvqyv?=
 =?us-ascii?Q?UBu2u28r0Sr1zSOvYsFTuWM9QY/hohwc7k4v+7aWr/tJFar5bn9TnFV5X9C/?=
 =?us-ascii?Q?1JSV4Iti0KYloPQ3LRMkVMmpk5Qr/ebwewa7bgVdJ1l8c/oeEhRwrP6qE9xJ?=
 =?us-ascii?Q?Jm29NABfpECgdXQMeUCpVb+k6INwsksjjcsjymjMkwOHxjLK1ePVRNpm7nDZ?=
 =?us-ascii?Q?QDVoSXv3Ef1/yPFvrbllhDm+nCXmStNf9QoqyjR8iVarRhuVYTemVzgEA7pR?=
 =?us-ascii?Q?paEMuXh4dlrly4KCvZ9g5NeYMSqYNI3E0Xsc7+dc/5WrEaOiAU2itHEkhOGV?=
 =?us-ascii?Q?tNoZHChhf9khzPHtSHNVeNl4hJHOWZtrR+zHMso5xnJf7L4zUnjjJdnIn3Gi?=
 =?us-ascii?Q?ORRPcoKdHW7i1ekdWXxUWTWnUn/kIMIsJMM1nptWQtHpl2md22a7VkzwSc9z?=
 =?us-ascii?Q?LjuzSXiUtfcWQrR8jvkXLSdRcBK5hDxYNUU8laKgAoATeRh208ugy7PlQbQr?=
 =?us-ascii?Q?+aI/4lahcdhmWewyQoxy1ALWyEJK/Rphsz9/SqAahauWb90SmMfg6Kz04Xfp?=
 =?us-ascii?Q?xDUuyvMeXgsUQCPFxzKtNmcs9tqXPaYZv9L0QkNSjUhObg3rVhC0sTzvYhgY?=
 =?us-ascii?Q?jNZcYeadFIz7Vifuph1PiKEBqcU80XLbJnakm7VldVyxWEOTitfUuOwaBiGF?=
 =?us-ascii?Q?vLl3/2VOt4KEeu4JKUolpzMqDgLt9Q4l1UKjO8VXqL2S10n7zGqFxnzZuNKz?=
 =?us-ascii?Q?4wXOVltdStLORB2beGmrt6RvpzP/MJx/kWdsEgr5BZyka8tgH6ADghNwcLCI?=
 =?us-ascii?Q?dvvHIBcCRZisxt/odQBTs0rRhsnPdlgX8jyuZTpaZ+k6Ei8MAsicWlfY/5Js?=
 =?us-ascii?Q?Uq58IBKHrZZ64uXjcxa4E8ojAEJOt2PEHgaINva3TK3TA0afOuP8GZVB9G8X?=
 =?us-ascii?Q?pH78ZSsg6JQpPkDQkJkUrnhICea0d4JmxK3l1WiKnVHtcGX6KIjoNNMfsKYA?=
 =?us-ascii?Q?2ZLg+p00776fJaobE6wdTENg8Zyeq67IYiIxjpR2?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d4d9843-7247-454c-4cd5-08de2260a408
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 02:59:19.9905
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: am6EOy5MXCe6jgFBPG20yQD8q9JgFhIOnblo1lGtyp9Ff4Gfh51OAskGMJfhMwWqb7LONJYwsYRzkQhjEsx01g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7570
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDAyMCBTYWx0ZWRfX2lxjgHB7W5Ke
 bxK52zWBy098UmPe1spge4AOMycY9D2fK2zPzEFPMJn0sqSNVjXxpOQXLtp4P9Lnvg70W+RJRbB
 NOGiUyX//BGICpIOI1EK/gcVF4tzDfgbZt2JIts31L7K89ETt7lunPVTSEbbZbfWUna35SqjklQ
 zgmLBPDu+jojtLsM4NN+tVQVLLT25GZrQdVxq5zZ9Zy9U0Y6j7Kyw3mEs8fRovzA4Rt+NHcTOBx
 elh5k5q3IidIIXQgZP2ilTCc/TMX1qjFPfRUDrq3NBHs5mcwuoBYrN7h8sFFhxQh5/6LkL8Bz7i
 YC8OuP+XE82YY4PlFlCbIBvKatOPTOxPasrUnZhLlD/GB0ybq5QOfFcpXzvA/cxzqBeyhjEmywD
 owFhJiDxdcw1ANWo8x2CuilVm33qPA==
X-Proofpoint-GUID: fh1YmhPQi1feZo_JJW_xQV9JdXE1ptZk
X-Authority-Analysis: v=2.4 cv=Uvpu9uwB c=1 sm=1 tr=0 ts=69154989 cx=c_pps
 a=+LMkLzjU88PdHoliF3eHPQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=6FjINJM3k8saSAfyhy4A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: fh1YmhPQi1feZo_JJW_xQV9JdXE1ptZk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_06,2025-11-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511130020
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 02:59:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121595

Add UPSTREAM_CHECK_PYPI_PACKAGE to check the correct latest stable
verison.

Before the patch:
$ devtool latest-version python3-pytest-xdist
INFO: Current version: 3.8.0
INFO: Latest version: 3.5.0

After the patch:
$ devtool latest-version python3-pytest-xdist
INFO: Current version: 3.8.0
INFO: Latest version: 3.8.0

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../recipes-devtools/python/python3-pytest-xdist_3.8.0.bb        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-xdist_3.8.0.bb b/meta-python/recipes-devtools/python/python3-pytest-xdist_3.8.0.bb
index 7b340e8920..3527539f6f 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-xdist_3.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-xdist_3.8.0.bb
@@ -15,3 +15,4 @@ RDEPENDS:${PN} += " \
 "
 
 PYPI_PACKAGE = "pytest_xdist"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
-- 
2.34.1


