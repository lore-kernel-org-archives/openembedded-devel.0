Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA636CD13CF
	for <webhook@archiver.kernel.org>; Wed, 12 Nov 2025 13:44:56 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13708.1762955088240810462
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Nov 2025 05:44:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=lRGIULpx;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3411d85ce0=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AC7a7hX1928398
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 05:44:48 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=+4lGqRtF84LiRYoYOR+1P4zsMEhz8BlXwJiR5souxeg=; b=lRGIULpxMg7l
	LQS+B6QOor5eco1dUU6jLHDouWqNIACDXkJPi7FpKfD49ezQsOAAU/KpGA5WPdUj
	3np4Z6BoVDwssQOea64Q29h0QIH7J0kqkQP8UrBxNnj3woBy2sHJGA4LTHw5uWNs
	4NCBbqpK8tMj/aXOL51sZp1GwxqbUw+uXxePRzsmfHSG3CZRpvp/hAkLIK4vmtTs
	hS0w520MVpx54LWuMbAn6+a/oAhk/xamU3GtkitTqnZRMTpq1qBQtXWbwqo6Cgu9
	NZyzCNsXtNiSYPFI83T4D3BYKm7MZnaUahFccm4qHCfRwhN8Sr0UsLnOK2a6rtmi
	OLa50DQEgQ==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011011.outbound.protection.outlook.com [40.107.208.11])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aa2135488-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 05:44:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AlNHGgsASE1z9tPX/qjLwR8mwmFGecW5t26NubE9OigDaomkHjfA1lzWYFPYqb8k3Y1m/V2Wk6ywjZrcMYV8l1KIN/w3OhzpDHfxfI1SPAdBra865qhFnA146exM6xI8JhE4pCF0mamWSY3YWPZDMv3pYs0DksbArt8hxH0Sd6CoB5ZiFSz5hs3FSBEsbRP3Q4NIhmZPVEaF6TcgXYai98+ixra6vWP4kJuXnqsiS8NAgDCxhLHHdv4V4scKc7HcK85T+GI+phEA/aRGPLz7gF5A4sKTksBfn/P5zXEMwV7UHppOIhFRx/E220kp17+CJTRYabJOoM67z7YgD3qdTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+4lGqRtF84LiRYoYOR+1P4zsMEhz8BlXwJiR5souxeg=;
 b=rVHpmXwDEmWEyEoXb3tF8a2KfAUtcZkc801VoR/FBZU1SKilz9Ag/rAgy3nrmqwYwLtCAJwyL4+WYLHvlgi3/KWzHH/wB1G5T8v8dWn9IBsDNSc3+tbhBMtoMpKUMn1A+Apb6g0PWK+k9uhQuJgzNYW4+JAyvEsMuELRUIheJFV7BwmYUtxvGFaa1vE9PkPp/uN2N8vW6YMKRGwslLaO44NDbbCVXOkJ0MbBS9eGqtufZZ1Zc+mMihpOcrI4bwl5Ahl3GA3kyjQ+1HC0L96V2z+iKOFzfeg35WcnVCYkE4mVNKjw/9qCL1zp9PMSgxfOxffORTsPtQYphD8PGhxp+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 CY8PR11MB7241.namprd11.prod.outlook.com (2603:10b6:930:94::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.16; Wed, 12 Nov 2025 13:44:44 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 13:44:44 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 15/19] php: add UPSTREAM_CHECK_URI
Date: Wed, 12 Nov 2025 21:44:01 +0800
Message-Id: <20251112134405.3706508-15-yi.zhao@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: 4ee35cf7-8433-4f1c-72d7-08de21f1a333
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?FnZNAfKV7GOahKnBL1BN6FEi7D1MxSlllTV/BigDHIFSlJEp0/3+NBKaNKH2?=
 =?us-ascii?Q?PMxksudA6ITN4VwGN8gNERWVq2oWh4PkflYZP6LLvxntlYQ0KPGfaJb1EKrs?=
 =?us-ascii?Q?5k/Siu30yDq66lklhioqR93Fmn0nC4BRoDDuDt1URQlE2nFU8NMdCL/qXmfW?=
 =?us-ascii?Q?aq3rzr//Dff/PGwiOmCCmfTldAvwKoFNKca28rmj363CX2aG6gm1LqT6ahRm?=
 =?us-ascii?Q?T0TgGGf/CpWPeL7t0QGU/xCo2RoPTWi3al6z0jvsOMozuUqMpzr7RVuS5IWz?=
 =?us-ascii?Q?7sTyfrgB0ZMb2StPzrzUPrLyV2l3hAwW2OIfr6D5RdV3g8IbsU7YxUAvzchZ?=
 =?us-ascii?Q?1ML7qWCeIFSjVHHLCXL1dwGKunTK0SjCENNpHXEFgDux4jhzY+f74IObNdPQ?=
 =?us-ascii?Q?rfBeg9CSLococ+9DcBznYiUUCbhUHLCotrcVzqWiZzkBywXQ7xnvTz6BDjZZ?=
 =?us-ascii?Q?YHjkKTOiTa+UL8m9156CkKYW5vlcwNrPo/0QcObBAvL5lhTU6vn4rWoT7Dsx?=
 =?us-ascii?Q?41EvfAoXChj558PISl4vSD1Jb6EsbSQzMfhVcnx6VmBH22t8iG1azjziqfz4?=
 =?us-ascii?Q?CDyUNBtNSQtr+LnQWYoRZz/AM40Mh2zS0Diyh24cj9ivUR8fpuI1XSCdQGRP?=
 =?us-ascii?Q?OdyPSlIJ+D7sGB07ube5kTjbuht/2CJ0dlIomZdr4tOBLJLyintlTchjVd8/?=
 =?us-ascii?Q?iiCX9mhR6UodEGKucm8BDcSE2a8zV8J+apT0FneNw+P5M4cSI21ijwmlYsaB?=
 =?us-ascii?Q?9piO7QBOnRuPnq6ybaTZ1jLxldBBC6XVMcD7A//CMGuQ0zNGt6+iQQ/W4Kqg?=
 =?us-ascii?Q?iGo5Eo2uZXxZRLpc9vOtPE9c8t2n7G++OS8KjqsKMwzCEpIxXixQ7qNBxocU?=
 =?us-ascii?Q?pOU7cI/OmTvi9oMYURtLfiPEinsyT0OkrD0VYM/eXcCOdsTyGGZik5OPm00D?=
 =?us-ascii?Q?YEd4VbZ6PjCHEBemDW3bNM0eeJEpBgU5aL16FuJs6BiwzoAKvHuHlVdCjQDa?=
 =?us-ascii?Q?UMAwouyKxcUEMV07/hlMoh290mKMNMByO3p8BNJmvEQ+URBoZkVftSNhkNhi?=
 =?us-ascii?Q?beYYpbgSgrazNBAxj+yBY/WJieaCDfqXlDWlYhRpLjBUvKOQu7hNUCejBLJ+?=
 =?us-ascii?Q?YnvzuISJa0498noOIUuF/v8OkkRTIFNaVdQ/OQ1n80erzYqfAfWVhRW+bWrI?=
 =?us-ascii?Q?dzI4Bh8Obe3xB3bX+TfKpT693HEgKQhwTUpaOTuCkbjbW7ef9r54cGd8Ohsi?=
 =?us-ascii?Q?RPXOdY3hTD76rCtx8gyZoiJ25dVnwNoiyga5MYvX2S5OdrCJIFqwpyqilZ1q?=
 =?us-ascii?Q?l4Zzc38uyR2ajMYQAeGViBTzua0yDTrFLgAVg8mbCxfAjWVjJc5M0OV1jTrv?=
 =?us-ascii?Q?6As3OkuiP74UooLpjfLNTSWAw4JvSzYOw/9S8UHXYJEqsDSiP0qYE9B3Qsdz?=
 =?us-ascii?Q?ilBdSOZ9l63O57hyTCcV3TAwpksI3BfbNek/Y3/9hokjTdQ5eWP0Xx8599EE?=
 =?us-ascii?Q?jhxENtQXGDgpGxOOSa5pdNFefjs7CWuf396b?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?yTNF8NHkMCIlIXsT+UKmG5zbZwY3zOeSp/fU+H3nQIPyQjJ8HWLJZ2DHyjWc?=
 =?us-ascii?Q?j5B5FXv8D1y7s89bigxeqPrS68EOOKSjt1BIDLGu+LvTt8AAW9bsQtS2JaZ8?=
 =?us-ascii?Q?Tz++eeobBSzq9TH5/PEOJSKl8y7X8C268D8bKnP+aH4sXGuCw9xPz+4PKp5y?=
 =?us-ascii?Q?aGsYUMhIyEK0ALlu5xf8Tat4P46aI3FllH4NO+nxkwK5TmrCwCOh7gFCYWYt?=
 =?us-ascii?Q?mUdYOcG7GQcrKNJJE/F/C2JMwuPAaRif3B+B6myCT4qerOhh3/1WOomnLYCV?=
 =?us-ascii?Q?be8LTxRRiG4C/cjHZbjX4hzTJ+DK/sM0SemEHVNjGgpR7V60saIlDG8kw9mX?=
 =?us-ascii?Q?ujFjLa1H0z4zex48bkUOZHVGlhYyU1ya1KEnfc5BPC3dlV9AIowJGJwVO10b?=
 =?us-ascii?Q?9SNHcBAg4ITtgh3a5t5+m6WX+bu5XhMEpnIQ1zFe8ckfa1gXzOJwIdu6y/eS?=
 =?us-ascii?Q?YHRlgqQoEJcVsfQXPi/krEhWKtXK0RwBXdYpzz3XD3YwFIsOaKWi1Bt40kty?=
 =?us-ascii?Q?KRmCPiPgHZGTVhZ3xR5W6DD9dBGBmpAW4pX73Ii5zBxfWNlvwnVBpDOC+ROx?=
 =?us-ascii?Q?zOpfZsakRENNGW9YuCWVbqc4K/+JvJ5vsJvS33SSUjZOxlwN8b6lVfi0rE/3?=
 =?us-ascii?Q?EuGY28UsfTvGZVoHwLZs/EXTTVXLuvdurzr3dW+LjH6XVKFZ4VjTFKHfvODR?=
 =?us-ascii?Q?mpTQ5YmAMhPeE4BE/Cn3ySwKB7MYdfukus81/wZDcRJZP5hzYZyYOpMpCsbq?=
 =?us-ascii?Q?jkHpECbrOCwKLqvhVE7vJRyZxdfh+Y9qlNOddU5Zg+pSy38mRO5k0qQmPl0O?=
 =?us-ascii?Q?3EPdTBB4yYfGTFM0Vn+kwX4ZwMZX+gZbXBANErmCtXTbinCKltgH9jmTsWsy?=
 =?us-ascii?Q?CuP1tY6Xod7IJ3CTu9Bj/37JpHPbXeI5o548kwG07TXkeBf+5rqmU9RtLhEc?=
 =?us-ascii?Q?WNz0yd8Jzv4ctVRkngLloygZlsjxTrkePygoaEax8xKWdXm10nt8ou8W/Fg/?=
 =?us-ascii?Q?SB5KuHMZqHREksK+ZxbwEBa1m8wZBZgxmxVXc2BXpDQgunjCuocEsLB/AncE?=
 =?us-ascii?Q?zW3SWI9MJ5LD8hA0u5JL2Zm7Fx6LE9a6vSlPLDnwapB12dSTeHmVQ46+5zXE?=
 =?us-ascii?Q?y+m+Vq8nS9zKr9hFxJsVD6ZVXy7ZIAaME/855lT9SawylLOaxvbBpZA8kfCE?=
 =?us-ascii?Q?c2PVa7mC9jaIZcYfZkDxnvZM5HC2tBXtikxAyLDq1oTyCW2n9dGW5OIJrCOZ?=
 =?us-ascii?Q?WyakJngv5j0F5VMhBATiedlFkoiR6i19iU/XZxvcLksIpUTp1yRoFdibhpbt?=
 =?us-ascii?Q?CZyiM+O7r1DN7pTGQtiCGc5LWUI+Yj2zBwPKkSG4WVQT275uZRnxW3u4kEEw?=
 =?us-ascii?Q?mzcSb/8pEaHHKu9V6UYOTZQSWG3FHwQrh3EOqkeKzrjHbeHsxgCr0csc9YD7?=
 =?us-ascii?Q?+9gPVWfnUuz0fuqP01lmcFcXPE3qn4aj39rIOQn5fsSqZTbli5jLMdnyATfu?=
 =?us-ascii?Q?0hYm3to4Sp+qNOiLgn/8sXsxRwIPQyfmjHt9YaJ739R7bmHXgl9db/A8T/4R?=
 =?us-ascii?Q?aYTWZldV0bU9wohoKRzDvtRC1BHnCzBqXId0ZpQA?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ee35cf7-8433-4f1c-72d7-08de21f1a333
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 13:44:44.5294
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KmNcBK80NBS7TdT+7nRn6iGZ9VNnDHaGIAbyQ3u5JHPRsbrQPmdl1MlEPnsL22+hdq7Wgm9ZlO5oHTXrVrvsjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7241
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDExMSBTYWx0ZWRfX6hrSj/TGF3/q
 b5Rilz7NLn3VUScV9d5mnlZht6sh+R9luWrnjvX0WA4uTlEZV0O0c/2c6Qj6hZkJz+toZ7HPR/i
 35UnD/wnkv0YnQnVRP/hUJAHbUoR21WF+IJFDsUj7GEehbiPtdQchZ39i7rFdHbpVjrxuIgABx2
 /iB0ViOPPWHSMrRAXayRy/Qu2/o0W7aKcMmaJve0i/GguiB1FnjFVu7r1f9rioOpmtbm9eL4YHp
 7nfAFir2Dl1GQpMhAiYDLRKhc7lwCbA3/AaRg3083gDUqBYio6P1R8MM+nH8ILNHkoZbjvAln5P
 eOs3tpk/oUlT3HeF6zQc4i8D4kx62gan/XjkLUnExt8lVLSLpgZ6ovSJQ4PBF7ipyYYKQ+TKlaK
 G48koLAvDKY4mlvX8lAZXmUWICeFlg==
X-Proofpoint-ORIG-GUID: n9A2yeADXiKb7p7aQfcyCPyVxTquztLY
X-Authority-Analysis: v=2.4 cv=XPA9iAhE c=1 sm=1 tr=0 ts=69148f4f cx=c_pps
 a=cvmpvQQCsZncHh92cDAFKQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=pdiXyuuSogtXPmL8gmEA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: n9A2yeADXiKb7p7aQfcyCPyVxTquztLY
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121544

Add UPSTREAM_CHECK_URI and UPSTREAM_CHECK_REGEX to check the correct
latest stable verison.

Before the patch:
$ devtool latest-version php
INFO: Current version: 8.4.14
INFO: Latest version:

After the patch:
$ devtool latest-version php
INFO: Current version: 8.4.14
INFO: Latest version: 8.4.14

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-oe/recipes-devtools/php/php_8.4.14.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-devtools/php/php_8.4.14.bb b/meta-oe/recipes-devtools/php/php_8.4.14.bb
index 483ba19ddd..ecec5ae04d 100644
--- a/meta-oe/recipes-devtools/php/php_8.4.14.bb
+++ b/meta-oe/recipes-devtools/php/php_8.4.14.bb
@@ -27,6 +27,9 @@ SRC_URI:append:class-target = " \
             file://php-fpm.service \
           "
 
+UPSTREAM_CHECK_URI = "https://github.com/php/php-src/releases"
+UPSTREAM_CHECK_REGEX = "releases/tag/php-(?P<pver>\d+(\.\d+)+)"
+
 S = "${UNPACKDIR}/php-${PV}"
 
 SRC_URI[sha256sum] = "f2139ce4cb7a6c5643ee98caa34e5c32ba841c2ba293e34a3d0357faa84bb3e7"
-- 
2.34.1


