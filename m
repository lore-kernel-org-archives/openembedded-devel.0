Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE839CD13D3
	for <webhook@archiver.kernel.org>; Wed, 12 Nov 2025 13:44:46 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13705.1762955081455418015
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Nov 2025 05:44:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=hh9DPJxu;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3411d85ce0=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AC16kLb1293390
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 05:44:41 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=z5q3ZpNNDy9WEIEUSKOAS+2IZIKVJq8v1I7tr2zxjAY=; b=hh9DPJxukO30
	7EG6FeQy7ktipgheiDu3+lDWwhBK2eYlqYtHyZowBl0eIitW84YlrtpTthqlMq1B
	afShNriyEOgWL4S52/4azQWaaAzRPKSINsZVdQbSPoxNCtHGhphwGUW2RsdeZDXG
	GgmgdGjmCadS/S5kPw7LoDqvbyJqd7Uy3GVvWvhv5x2KVt8KWk2LHi7n07uzU23z
	zePJdWXdyTcaXqO9QbAO/kQGh2oHg+ZscQv952QggL50esONYAQGTT+4h7P0YaRN
	HCKkQAyY9PpqGrB0Fk7AK2mbdShxwAF3Usft0RM0DDaEdfv2bBDgVHOHw5vmp21v
	DHiMWL0eaw==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011029.outbound.protection.outlook.com [40.107.208.29])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aa213547e-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 05:44:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XGaeTTw6YHbHHMJ8T+MTS7z8MPY4QIska2O0cf3VtFJ6dvSx+Z+JuJBcckGNUjcgLRVFkjZLRx1VtK90D1Y2bliV2bRCxxsh7BE41bECZjfMKxiLqhWzE+ddOpAwIT3T90JInBYf7YGWeN8znHibQP9tq3H36BFn+ARsvAJXl7azsI9Wfabpq3PJX+/7LLqAUb5RNAgYha2h+hiyz1BXDmwZJ7vc7/XetiLKG77axdAkYABEglMr2khdYm1FRSQpK7+21XezKvJS/XcUllQdn40NW9OfqCLjvuoIFQRPEpoiwkKKnyVc/8MVgLY5qNmRUXtQZHFXtbYif5452roq/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z5q3ZpNNDy9WEIEUSKOAS+2IZIKVJq8v1I7tr2zxjAY=;
 b=tRwV7FAWPQSNzkSrAWp9MM4iiJcQ6ZLW2fGY+zIZcwAIUxXe56HgmDlNMJr16IyV/M6dxXcEvBDv3Mci17HaKLA+LdmaMXQsPWXBb1dc2zMx4F5qiJGzBumMzNqwUjZVwbPoAsse1443fYejyV+nR6z1++LVs89uyEBe4dv1gbuBH/ax5Ty5sXdgyIttGTcM9m+8EbgLOomgKeFZuYDqIDWkjEW9xSP+ZE+YqLpQ5fwVySndpxAJui5eXk0uyeqN8mKMkMdBFpssr0ofBB9vga4CnddOxh3nYayTcMvndEVn/0kPVw5WvbHK9BVB9J6+Hi7rVmx7kvP/NPEIqQN3uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 DS4PPFABF58482A.namprd11.prod.outlook.com (2603:10b6:f:fc02::45) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Wed, 12 Nov
 2025 13:44:40 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 13:44:39 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 12/19] lmsensors: add UPSTREAM_CHECK_GITTAGREGEX
Date: Wed, 12 Nov 2025 21:43:58 +0800
Message-Id: <20251112134405.3706508-12-yi.zhao@windriver.com>
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
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|DS4PPFABF58482A:EE_
X-MS-Office365-Filtering-Correlation-Id: d6bf6d90-416e-420d-0a6c-08de21f19ffc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?OW3dRtQLn5hgAk75jxzIz/lhu/sS1+ogoP/RGCOIDXpvLMRw4lnsQ/uXTFhR?=
 =?us-ascii?Q?9MoaUQfhz/KQ/MrN01AoHizXJUMy4tc+kPGt17h01qler78sXm3tbrpZe2b9?=
 =?us-ascii?Q?2fgs45Y8s/SHWPdSexzt7LR7fdKloKEjTVSmRYIyM8OhjALX88YL5xRx+iZn?=
 =?us-ascii?Q?9adsGEX6IxmYh30SeMUBGNX6FX/jNM6ZGQsT6GMHrC2NBY0wUJ7mhHFpRxjT?=
 =?us-ascii?Q?LBzCdnDV5kFWmLyRql/FcJda/QmvMTRlANTiT8Pb+bkz+NPhj8E3jKbzWaDC?=
 =?us-ascii?Q?LvxkGusjcVkX82DYMvCH04NKG9ZmbUv1oywpAbeZ6LB/83YPhHhb6g6qHZDs?=
 =?us-ascii?Q?a9v7MWyLIYAltCaK9+KO+MK9vro46NZ/dAF2M+y1mI61bl8xCJsXwBHXk7cJ?=
 =?us-ascii?Q?pBH6cH2Rb57oKr6VaGQgFxwlhXhRkNnZZMBBqFacX2xnStalFKck6sNvYbyh?=
 =?us-ascii?Q?Z8+BREoxUJhFv5hmgTASPT/R2lctqgfhnlPOJ8N0j1Ir86isVF8aXRPSeuEQ?=
 =?us-ascii?Q?QYaBVbUINFGmDJdKd7LsfO6AjGz1ooyMzIQW+cm3iBh8sKw0DrlzU72phbEI?=
 =?us-ascii?Q?gpopBvOCYM51d8VO4ON7zDlvce+5YWBlB3v1Uei5XL55DpG8buWudoJHNAOS?=
 =?us-ascii?Q?+ZKMJSDW44DkFD214PWxm9n+xX2tzYDjNoWDODn9yPzUo7KRkIbC9Lc2l/XY?=
 =?us-ascii?Q?UZplZ5wdxURJwbQ/+JU7Z5NpWKcr/wpLg8v1pZ+GBEQ+r70df1Y30OlKCpcK?=
 =?us-ascii?Q?IMeLbIvvvB5kBABcLORePc3SUl8mJqIiNYz40baIoe2uan6+ajVKz/zjYxyG?=
 =?us-ascii?Q?rXnSOeDlSHlBvWOh72RZowIL7bCuwZUhet6shsQDFP2K0Qa7r9/DBTIW2krL?=
 =?us-ascii?Q?YDVBAqaD25A6q5XUDL631jn75m97ojSFiS63FbXs3AlxjdJcs7fEhNQDKK4d?=
 =?us-ascii?Q?qNF0JXH4dRS+hwb5ZNFWo8kQV54MvW3JUAe9bRbQN8che+La76TZ+ZgLoL+R?=
 =?us-ascii?Q?2sD7gtyuX97FUnGOZz1WH2Jt2QiQyB3TKIAHytR+k3CU3+O3I931GMSOaUH/?=
 =?us-ascii?Q?t2iUCp1lye0Xsyu3NFcMBxTx0OWJAHQadXmNwVMn3Y6iFmRLVJ/+D6qZvp5j?=
 =?us-ascii?Q?0OwRW5KOavpPWH04T3p09b+2IqcE1gRe4WO6l9B7BOOFAPdo/aCJXV4nq/17?=
 =?us-ascii?Q?Di8CicE/9mi2YMwQ677PTpihAxc3hwXapBFoDO4A6egIRwIj0s+qcikWZocP?=
 =?us-ascii?Q?Tq/xBM8AZBu/JQ2C4P6y6It4rJby/EJ58AIVeFyoZU7Knil/jSsieFAA3Pbi?=
 =?us-ascii?Q?kFOFzp/1XW6ZEyokAhphA56LwSSfmGDsKLXkBimei6Czr5UMbZT2B3FjGUYW?=
 =?us-ascii?Q?vefKhkeutCJMGlf3DYk8go+nuna9aTzJmnLPCz3llp8EqiS94cCe3T97JrOe?=
 =?us-ascii?Q?EF7Yth0RXKhxGFwAowCfrSH+rdoqn5upzcBuqdAWmd0NGAozCZ6+2480LTMb?=
 =?us-ascii?Q?zGhlbNzgM+dpJRLYMAP0t/lfoz5dzkghFbpS?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ITseldevkkrgeETCzL6GRot1UZBxME4UcMcY/Tahcd+imhGSoIOX577twyA6?=
 =?us-ascii?Q?/Bpt/EjNl2DFAAulmF5hRuEXf9onTK7n+/5xYDGNc6yd+wkekIUkEewxgt87?=
 =?us-ascii?Q?ICAr05EdWcWvoeHW610lrkTAFqmJgRMfrUuNcJMueoZcQV/qiUM9dLLGQpPv?=
 =?us-ascii?Q?53+WJ5t9WiNFC7eUPfS/rMqdzyATnqI2LiXofinW2wj7ixSRptwXDbTfpepg?=
 =?us-ascii?Q?qU+yoB62b6zAPqtxhbwhVO4xoKEr6ug0+zVQqQUPz/YOGfLsIXu1/dVoLnD6?=
 =?us-ascii?Q?uuWxEsybPJhgM3V30m7ZUUAI2dHYWRNAVyNWiOyYRTtOx8uH8Asw1io3bcse?=
 =?us-ascii?Q?h6e71UOzTNw8VuYL27umm5UIM0M/Md+JSEr1Yn962HkVzIqK/ZYNGlwWVq6w?=
 =?us-ascii?Q?x+TsLPNBcA7Ak9etZpRDCY8QHvWoZAbf6rP4vhkvHz0owSr+whvU8mWEYNlf?=
 =?us-ascii?Q?GNW/lmYVt78Gj22B6WbEhOvaE8MaN5RQNbSs2bg0K02ZdhP7AyKRbdwvu+Lc?=
 =?us-ascii?Q?fbZLWidtqryyUzMzQeIm8nj1i/L7ixU6h609GzKGjoXkgRqDdwkMwVOlXx6Z?=
 =?us-ascii?Q?/W6oHJZiEDgPET+cAF37c/K2v32A6auiwTgRXDhbGlU9qvNG2/QlBpMrTpM0?=
 =?us-ascii?Q?jnXuNToJH710lQ1GWzNnOm+CkOqXtT+JKr080L4DC3asKNe0glERVFlZxpu9?=
 =?us-ascii?Q?L96uIGLQBxSg/PIrUHGupK1kcXKWIUomzxNn4bF4PBHUG49EXNJscPQHVEU/?=
 =?us-ascii?Q?EiCtcBc/pyCGHw8iP8m65xxpS3Jb0Iiss0bzVvDhPw9jfTXEd4WfvVc7j0p4?=
 =?us-ascii?Q?8fmFOc3qQ5pD74vSUqUxXi2ZWpbYbT+niaZMIccP8doUCeX80DG8u13uDGcZ?=
 =?us-ascii?Q?r4GspdHAUUdH7cwvRIYktpR17L07o66XDYzHwIeAlOMx2O8rd7Pr6sKJ+FYq?=
 =?us-ascii?Q?1e1zIZShCiVqsZvaBZ8Ed/GvJ5pWl+xLc6gxXIcgM+WLUtuQsRZ14W1a43jr?=
 =?us-ascii?Q?Tgx3ifTHITbsogmwg4/KPUck0Zod5r1jgL+EI+Qfrdnobshfgfe6I0A2ljeg?=
 =?us-ascii?Q?zPER5xUoeDWg/qiDo5Oxfu2AQRPd7La9hfDz/yRj4iaFvdyrtoexlhftubrD?=
 =?us-ascii?Q?q9WxbMi8evPfNHntvDIUdzsvYYHk5tfvTSQhz0w5ndmbStBymigXiGI1D7KD?=
 =?us-ascii?Q?y8CqqaJl87AzRcXRNvR0938GpYkdw7wNcmQBU1z+InPioI5uBUrF8Fs5Ijo8?=
 =?us-ascii?Q?EEnBtfcswIEhHvtBo4WKeIJujfftZJ9bZ34KbZan+zNm70l5o+qnv3v4WQGa?=
 =?us-ascii?Q?Xd+rst6PRfAT3eaE6jTTs21/gOyEPAzjMBQJZw2Hg8+y5YeQhOHW79joy+HG?=
 =?us-ascii?Q?sIiEXl/M+A/xTpTfKILkebESS1qmMZRSveqcvj4IBtx8EgvkRAcHGv/FWcBb?=
 =?us-ascii?Q?of3sSCk/J4lkKz0wpqjMFHrl/tjwAi0OmnL5xv1dyYKc4mKiGGqFsCKfnDFq?=
 =?us-ascii?Q?NvioMQDyO8BmkZ2NTma/Jtv9Z0pwzniV8qC2EFeIbqlQcH90hoLwcptQfsyD?=
 =?us-ascii?Q?5QH5bhqpYLx/3IAZ1Q8TSjJ0iwV96hW0gJ0QoSB6?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6bf6d90-416e-420d-0a6c-08de21f19ffc
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 13:44:39.9404
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5rERU11vLUCwGNAhIJeMH4Y8HLpr8iRSE28jUMmQobeUelHbGwFxKLRaFpdES4m4Rgqn7ckLA2tD204I70AxwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFABF58482A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDExMSBTYWx0ZWRfX5b5pCPslYKuu
 JhowU0rKJFHqBfOW5kyoF2fKaPtSENAH3VOuuAviiFHuGSvPcYcMwCiiauBvPsrr1uzJpZScEzg
 R/eq5iKZ+laPoq6pKk32x25RrN/H0VuL425zl4cgKM2yH18tvutbCU0WK0kHcUFsTQsce+74jNE
 lLfvUAOUfuxa9jsZv19J2hXJGDRmI6m/rXFe3iS4vY29hTtam3DWDUuDy8SX79y9MHXPkEdiL7H
 RtkbpOVCJQQbmTIlOjamELBdEYH3rZFjaeq90rU1IGGYaZH8HobWNfz5rndY622sts9WebnR//h
 ca07XQ1R0g6WHvCC0tckG63QpUFZL2mVjf+HQr64uRMLc82Aj07LRwyAnwhl8JXSapX5ID+bS+L
 oEvBn53aI18KXzVPGELWlzBquf2PYg==
X-Proofpoint-ORIG-GUID: G8o8sVDLKfre2ixlIl7Vmj_w_yRorifU
X-Authority-Analysis: v=2.4 cv=XPA9iAhE c=1 sm=1 tr=0 ts=69148f49 cx=c_pps
 a=WFfob/tpvpsU+KY5JpTU8Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8 a=QEyorn-SO34MElFpQHAA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: G8o8sVDLKfre2ixlIl7Vmj_w_yRorifU
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
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 13:44:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121541

Add UPSTREAM_CHECK_GITTAGREGEX to check the correct latest stable
verison.

Before the patch:
$ devtool latest-version lmsensors
INFO: Current version: 3.6.0
INFO: Latest version: 3
INFO: Latest version's commit: 1667b850a1ce38151dae17156276f981be6fb557

After the patch:
$ devtool latest-version lmsensors
INFO: Current version: 3.6.0
INFO: Latest version: 3-6-0
INFO: Latest version's commit: 1667b850a1ce38151dae17156276f981be6fb557

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb b/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb
index af0f5a7999..d5cd2cd195 100644
--- a/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb
+++ b/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb
@@ -18,6 +18,8 @@ SRC_URI = "git://github.com/lm-sensors/lm-sensors.git;protocol=https;branch=mast
 "
 SRCREV = "1667b850a1ce38151dae17156276f981be6fb557"
 
+UPSTREAM_CHECK_GITTAGREGEX = "V(?P<pver>\d+(-\d+)+)"
+
 inherit update-rc.d systemd
 
 RDEPENDS:${PN}-dev = ""
-- 
2.34.1


