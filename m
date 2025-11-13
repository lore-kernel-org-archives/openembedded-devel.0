Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BF36CD4F42
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 02:59:24 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15568.1763002755825188647
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Nov 2025 18:59:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ascCGbir;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3412a946d8=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AD2vgQe114160
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 18:59:15 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=prITK1gTcD3uehuz5BJiBIv/g/hDUtHPmHW0roSxnV0=; b=ascCGbirFO+Y
	l7B7KT7ENhHMM8+7bKXtvw6gbXswqBqCP6abm+X98b1ZxRf0Uootuii25k6hXrV+
	rtesw7z5AUx0zYMA85xZ/AZHfsHyeK/uaPMXKXHO/GDId4Dbh8ZYbW4YP9MCbvBT
	si6er1OZgj6o1I57XD0BMIuRTq1KRYVajiAP+QwL4aiqY3++hraKg/GSyh2cr4xq
	ZaddKoK+Ac8mlh7haznTp7UPgco9pW8dLg4v2Lt7b1jYi+6PdnCw8VL1uZGrwcaQ
	VaPQY9VjfbB/NmslX9LCyVCIqOX8aM3I6sp/6pYcHkQI0jfYRn0wOTkZO84h99B9
	lHskAt7xQA==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013009.outbound.protection.outlook.com [40.107.201.9])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aa2136f2n-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 18:59:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pEjduwBU63t8Dp9iI80pvCclviXOWQ5p57sgJ+YwcsVdXnRzQ2kyCNgitC/zfgvxkBQim04FiHlOYy018j7nz+tp+6wswYPqRXJK+3TgokMJ1MRZLGbZagkbKlwuTy2zZD4awe8id5bZAwJh4LMQ2VAaRxFTQidvrbhrN1XAr6WaBowZ++LkJTdKYfVQCl8yHmP6hUtmf5rlE7hscvCUkES8EDw8bLi/ugakqj2tE+pvO24JXO7i/cFbthCTR48JWkUHTsNUrK/sOU/AIvUlpfJ8U3ymynO9YDSFdBEH2H7DmoZF59ANQVJZWPdYUNKsKQfDsPFjYRIoCmHGDfPZow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=prITK1gTcD3uehuz5BJiBIv/g/hDUtHPmHW0roSxnV0=;
 b=KtOPiRYG8+2xVPqMGMcsvBvhwA1FStrOKHryO1AkLgkPrnygSX7J7MEXVtEv2R/0/SEHrZ4YNIPO3YPEYBd/FKrMy3cw7DH1wV5odIJRgQiWxG/AbYdwdjR+7Dno4SfWKdk+iixuNGgTptYctVZhsmzIQKkZsf74D3kI9x3RpqnRw0K/ZYY3R6Fdr0uOMOFPDKdiOgt2knMQv11RQoNHncS9aeBatLbkAr1oLUQRLqX1uKka1dhw1Rxl/K+exptCgYQUZRsPXRsYW5mD+Yr4e2cfPj/Tqfc1iTAvFodpKjZaE+ZO43uZpTofwAS44QevWBJQJaIWrZENfqE0tFU8Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 PH7PR11MB7570.namprd11.prod.outlook.com (2603:10b6:510:27a::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.16; Thu, 13 Nov 2025 02:59:11 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 02:59:10 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 02/11 v2] python3-gpt-image: add UPSTREAM_CHECK_PYPI_PACKAGE
Date: Thu, 13 Nov 2025 10:58:46 +0800
Message-Id: <20251113025855.1520038-2-yi.zhao@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: 68ba97de-563b-42e9-acc0-08de22609e91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Ujg107ytgodR8xYrBBnkKEOpvbBhtUxGieCvXadIAlNQAi0y2IlNaSqwiYqJ?=
 =?us-ascii?Q?B5EPlcxuV7DDG53jzLWd9hDFJRUU0UD+uEFpLIlfimCRwUP1qe8WaC7yYeVq?=
 =?us-ascii?Q?GAgrXA1FdkmJfyN93DO+l2hEm7v+qE7KeTPWtGnDtmpFIcDIjwh8VsqxeDz2?=
 =?us-ascii?Q?NnQROu9i9GcqSD/BKvsG9Qw27V4Ti+BRzsWOXp1fijJacAIkkbwSleau6cIV?=
 =?us-ascii?Q?m4shc82t8bJlNjf6c/LlCGq9DTfXzszUSu0fyNwhrY3ocKQ1tT1hSkW44c8c?=
 =?us-ascii?Q?UX23X1JMMPazJbwDVFpRGauNsrx7Lxs0XIdmTBufoo1wYA+zzc/fbE3Sdw8N?=
 =?us-ascii?Q?DId2G1NrY2D54u7WzpFd+l1edGnd/+2j4lglmQ0xzbKQ/nuQPdo+LOkOTcu6?=
 =?us-ascii?Q?aWJ2Y8BxHSQCaaCCh4DxRnppdT72CZJDM5Fi9UlEGTHW6MjZOVrPSk0/wB1S?=
 =?us-ascii?Q?uoZJsGOarY4TLTdkFQ1mXHj92jYDphe70/J1WVtwC6dN8PtVlBT1ce5RXE7z?=
 =?us-ascii?Q?KWBRa3k+yjDjat7WP2OHpu6CpR9pUenQDqorhIXryFeV/MkMBxOIRg6cChcQ?=
 =?us-ascii?Q?D8QdVyyCTvXX4lKef2BzK/x0e/hNmoORbcnGb82jKmK0dRXs5acwO/1PIR2x?=
 =?us-ascii?Q?F/TVABPwbYRsiIgZk0Wlwgp/4hP+I9+iPq66PUdQpZ+OQKRNcJXyYCi9hTry?=
 =?us-ascii?Q?pff2qcx0g6w2a3I2WmwRWHjLn4IWDcuQPdNBTsjcR92H0q7mdfpnoZtmewiH?=
 =?us-ascii?Q?4stD7k9ReENa6QEt/TXDZBnF2xMtttK+2uG6amSgWXjO6vIjC3uGvfpAo3ym?=
 =?us-ascii?Q?3ZgL0edzn0ntJUU151SNBw/+Jgn1dXD0BtuvwL6Q7eXsLq+y+UtRx3hRZKOo?=
 =?us-ascii?Q?GUtnf3bAVIke1MQd3riKQeAp9dPCgVd+GYnUjaAfcX6/I9oFy+qSzXGr2wNa?=
 =?us-ascii?Q?XhUL+ZnxAWjVN1v/FHbXTxdHJupYTpG7jiosEiVkfayULcOSd8nYgmxVbpNK?=
 =?us-ascii?Q?3HPkCa3RbBZwyg0CU5z15ZUU3lGda8/uOKCekE64JzixqK6VrMUtk/8W8kon?=
 =?us-ascii?Q?EYeZHsjp1rNG6tjk3pP7evsSSI3zXbJzCXEI3U/BR6TqnjfT8yJzVoUGxR3W?=
 =?us-ascii?Q?fh3bXYO33CoRssGD/8ZNjLX+zkp8TsfPtUWQc4ZlqNhXNYm5VE1eMrBNDcQy?=
 =?us-ascii?Q?Sge1UubiRqFK9AP2u8lwX8FdaO+/sDlDh8Oo+xAmvVSuPEFDoipGdLmjWo+4?=
 =?us-ascii?Q?QfjU+FXLS1DWSoRYPu/9Cyy0Ilrd9Fml7mCUWNvU0M+IxC/xU3YnkZnCLCDM?=
 =?us-ascii?Q?x7+mD9nyKjvVQvf/NJZUDz2cZUqqPzBmQogIq+6bGV0a8tx1aLnm2//etmtJ?=
 =?us-ascii?Q?CUg3fG9ddMPs8IFQcjpoScIFMykj2Msh4g5fcyzWtsNmIDywwmUxbH2hmZ0W?=
 =?us-ascii?Q?xa6e2WE+BPFSByW24dINwb+Vur1S6cBPXR1AaGyZjQXndb7PhD7jiNGR0ThR?=
 =?us-ascii?Q?cfLhS69ImXMo68XLwgzbgGGyeiZq2Vzb6WMN?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?dEU1HGccwUOd5TDYukdao3stbtZU1FF56jX0APTHBVCGa9kjbSoQc2L1gLER?=
 =?us-ascii?Q?Z7M7yHkQ6hXbG2d/g8yG1dlT3ksO/eFpyj1PvH/m/AMoZCySzIc2t3hgud4p?=
 =?us-ascii?Q?cDpuu0nKsKEBNtDkRNFU2ZJLwXhD1tPWyCanUyRseA/eor6o315jJ0NSeXyo?=
 =?us-ascii?Q?YXljzNMJZFS43eu0Qr187UQjfmhAIsWu4Odbm71R19vSHKLGZqxmJrjm6i2G?=
 =?us-ascii?Q?zcNrceANkiHIVE3XHRqSgAGNpNUgX47kt5Hv7gTfLrSAqlEK/oz23ZDkjPTM?=
 =?us-ascii?Q?4RbsVsm0vCzYvj9R0aipKT7LfSUs+PRop12DjoNaCYJ48hnf7W0Aklv6Aqy+?=
 =?us-ascii?Q?S84PUa0GhV+9Eml4a+nOHSNndPLFDNmFKOL4L4NI92gCyjOvaFNxkni/k0q+?=
 =?us-ascii?Q?tfBTHz5dXzwW9LBtWK0AcSkURAstd5BNx64jR1jJOWcQND3SslSjC4URFekB?=
 =?us-ascii?Q?ohBBwnfM8tjSE+Rg60Zi4pGNttwUQrk14gXAc9x5djJCBuE4aoMRDV2Fu9E7?=
 =?us-ascii?Q?b1mhPDLgFlsrH//gc/IT2EVpMgi7JmRgvE3qR4FUR1EGSKi4B7W2YVmQFoQg?=
 =?us-ascii?Q?NrVjkFB92n+aT50NrN+YTN/n2zfjFCzLpFGvikKPD4+zp88IKgGL2RsIU+YK?=
 =?us-ascii?Q?iOHN1RTR7o6qWCaftvdMf6HXCZQs7sTkhZsSd4sp81+MkNE6akkdi7gQWjEQ?=
 =?us-ascii?Q?8xrS9EFbvEa/b4vGOMvs1zGJJQOeprZNG7Y4L4pKU9e+hBSBVNkdgxo2Dko+?=
 =?us-ascii?Q?9UFNk85SEGJBcVvScDa6SJE0S1IRedqY0WDqaPw1v4tvMZtrgmz/ioYe/cs1?=
 =?us-ascii?Q?2w6/JY4LnsPatXPT+MC+PN7uU3peJL0QrgsI5KCV5Zq+ujBXJiE2R/P2pBr2?=
 =?us-ascii?Q?IbpS7HMgDpOA56l5rh3yfuLeAVV9QY3X/CNmtyB+1Hx2oeRq+KcoalayS1Mv?=
 =?us-ascii?Q?8VGkI2f5qbMU27fcgXMKE4UQ1o9tCH/crPceb7pZJ5zjjna75LzpQcRWqCKy?=
 =?us-ascii?Q?AIKmk4x5Kzh/4U6jH2j/z6/qePt9ln0H9UCJbXDoIP2FVZCst4irpCnX4O5s?=
 =?us-ascii?Q?qHTiVUYfirc79FCd9P65+4qepoaHdBk36fgr1cJOlBZOt8psICznnyGBpiH0?=
 =?us-ascii?Q?cNquyv2jDCPZy/ahHg7m6D1TY11PvCMFFcBtqwCS1R1ShakUFDEO7MzKS/uD?=
 =?us-ascii?Q?03VX2GvsRYFqFYULnk8DfR6LQ3hqUKkDZuX6gw0TPp52G7YTH1qU1/WGC1gq?=
 =?us-ascii?Q?OqofsqhHs6undpioHU2pHgfZtUESMzA5N6ltPuROShobUWjSVzcAgioeLGVo?=
 =?us-ascii?Q?CYYBhQWOCa9cwkR2qGfdcUWJHe5/r8p3WjXdufhFhHPRSNXYQ0Jbk5QSwT1O?=
 =?us-ascii?Q?JQaRfm8lrvd6jE+uhwyCM2wQBVdPyYTYXva1k+emwyFi5emAppkbaAZZTEUw?=
 =?us-ascii?Q?Y/+iYDutrD/7eagQBPI5CI9276WJh/FfhswSOIILm49Li4kinrBL8ic7q3vv?=
 =?us-ascii?Q?VVioh/dNBxG43U8Rl6w056s3LKO1CrcAF7GOVbmvzgN5t+nvYFlNOlyaeV58?=
 =?us-ascii?Q?3hQ9kxiavCsTMHmBHIULxUuje9Fimitk2RSezJY4?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68ba97de-563b-42e9-acc0-08de22609e91
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 02:59:10.8395
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5Ipj+KmZnS1yL77e8Qkka0a3Qyd8wEjA0sBwwoqsTTGOFOAasVIe1kuUoZnuaKJ/nbgkvRs9ZwEgkWxrs9pAuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7570
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDAyMCBTYWx0ZWRfXxgmHAi8NxQ92
 ZCz2UrE4hjdB4kZRjIJprklMpOkb3TH3/kjpHTgHdQVgFgnee6IiPoOeXvuf35g3txEhDxj1iZN
 0YsLncm7n+a2cI/5hLauwWcLZJA21K2oRM9Elm5fnG/cOKBMyHQ/bQTsW8A9DMdu9TJWz/uZ7vt
 Q2zCUq828hs/N5wLimKY+Nlr3y4bytswN5PTdfl+d09HvHLq8t/bpBeZms1gU5aTCtjoNyW1cHC
 xGx8vl0T/zZfHxNhEf0UAOvy6r0MlVC03cfqsLgxXGIDIgVy0zwhwCzyfroI8IUpf8Ny1lDgOJp
 oMbzBIGSJoxzg5Fi6D6oMChrXr/REIUD7OV56XNAgbZOca45Oy3KYpwXuPNgmOdyIA01uRNgihG
 +B1TjTXNISFmHjWplMWgvbAT8OlmYw==
X-Proofpoint-ORIG-GUID: 1VQ56Y0DyiRZ3UMceRU2sAQYFhgszZu1
X-Authority-Analysis: v=2.4 cv=XPA9iAhE c=1 sm=1 tr=0 ts=69154983 cx=c_pps
 a=xBk5Uq5DOFf1FlsSGvIvFQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=2XR1s-g4qegJnIwB2xIA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 1VQ56Y0DyiRZ3UMceRU2sAQYFhgszZu1
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121586

Add UPSTREAM_CHECK_PYPI_PACKAGE to check the correct latest stable
verison.

Before the patch:
$ devtool latest-version python3-gpt-image
INFO: Current version: 0.9.0
INFO: Latest version: 0.8.1

After the patch:
$ devtool latest-version python3-gpt-image
INFO: Current version: 0.9.0
INFO: Latest version: 0.9.1

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
V2 change: use UPSTREAM_CHECK_PYPI_PACKAGE instead of UPSTREAM_CHECK_REGEX

 .../python3-gpt-image/python3-gpt-image_0.9.0.bb                | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-extended/python3-gpt-image/python3-gpt-image_0.9.0.bb b/meta-python/recipes-extended/python3-gpt-image/python3-gpt-image_0.9.0.bb
index a4870de113..90b77cdfea 100644
--- a/meta-python/recipes-extended/python3-gpt-image/python3-gpt-image_0.9.0.bb
+++ b/meta-python/recipes-extended/python3-gpt-image/python3-gpt-image_0.9.0.bb
@@ -8,6 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=db5f8de88d13d0917db21293d0e82e1d"
 DEPENDS += "python3-pip"
 
 PYPI_PACKAGE = "gpt_image"
+UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
+
 SRC_URI[sha256sum] = "c06d8efc7cf8d6f3954c1c3d8544f494aa95da37fe04e38a9699ad3f57455f7e"
 
 inherit pypi python3native python_setuptools_build_meta ptest-python-pytest
-- 
2.34.1


