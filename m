Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F252CD13DA
	for <webhook@archiver.kernel.org>; Wed, 12 Nov 2025 14:54:32 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15254.1762959271488421796
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Nov 2025 06:54:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=sb0n/puH;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3411d85ce0=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ACAvtj21576230
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 06:54:31 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=K93WncyOJmWaZr/og+vdBvbLMwATmUvrAxpMC4/t8/A=; b=sb0n/puH0z1l
	lYxBHdz+W9JK5PnnUNjwJD43UfWbuNw73OflXfY8qnlAZLU6oLHMVBLuVNSZGW+a
	LlPb8pwsJbZCdZxKEoBGcNRyPPFQ0pmE1R1XcfgqJFS5hX7A8Bfj84DIw6xsJ3+D
	2hoJAo1b4zjndgsYa4uXuCFLw3R7rQqvtGOkcOn6E4ujG2fMc0cbyPbwSNwBI8g/
	FDAdH14mDaUqrvIvX0ukpnls6olvlc6xgMlKaTFoNAEkfrLPyx24FFF6r6FnCIxy
	09PxCcd1rRQ+/PhUlwaP0My2PnhRy8XxKncw+wPdSgQfSaFgsGopiXE3AszeQA8Q
	Ce8p3E+wUA==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012041.outbound.protection.outlook.com [52.101.53.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aa68jn2cv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 06:54:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iycEwH7h/HH0w7N8oDPLGQpvsxb25ULM8YxaJQzV9TLX6gEyIFcOWSg/yKn+D4JaHVIu0P+j3axt6fD96/HwvcAFDZUU0TII56IgPolGYViaR4jtWSaNM+PjHzYeOYH0k/SpJboDPIMNKWfSFVDSniOtKHuII0rNEzrdOlKKsEd582GG+P9RjJuHUuoJZeBLO4jl7OMZBQaUcDk5tQtFqVV6902WT9SdIgbNgtCo1tuxmBaJqOUGvbTYXRg/bFqbLPFSpebGlclTgiYatjT1KvOQV3c+bim4M7w9FEGuOOFLV68+PYV8y9Mjj3Cja7H3d4bVckaGkezmjbDcTUtK/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K93WncyOJmWaZr/og+vdBvbLMwATmUvrAxpMC4/t8/A=;
 b=ZVQcQftrViN+sDmXhtpQWnY3N8IgauZSjOimLLqzcol5glFampdps7NuXUV2zuR4+1ZT2NIAOIC3g9/hb3hUZjYaenxypsultfciRTFR+vjM0y3OhpON+z38AcwZnovdmhH93qtGRxn5PMJsjLAGKF8xw1Y2k9nZd/ks7fRyPTjWSMrKVg4B4DKMzu3FvHdKLig1JTU21+C4P3C/1o2MlMHL7JWY/OKjqqgKupH93waKgxl6D8U+ijFz92WY5gbpi+RnV8TwnLElRIjzd0a9YCsAqqSKnW7Qk8Hfb/aPbiVglWzpPZrJfpXpAsa2LADXx4wTkpCbBMLvxxvhb4U8yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 SA1PR11MB6822.namprd11.prod.outlook.com (2603:10b6:806:29f::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.16; Wed, 12 Nov 2025 14:54:27 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 14:54:27 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 08/11] python3-pytest-timeout: add UPSTREAM_CHECK_REGEX
Date: Wed, 12 Nov 2025 22:53:54 +0800
Message-Id: <20251112145357.3788595-8-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251112145357.3788595-1-yi.zhao@windriver.com>
References: <20251112145357.3788595-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0128.apcprd02.prod.outlook.com
 (2603:1096:4:188::20) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|SA1PR11MB6822:EE_
X-MS-Office365-Filtering-Correlation-Id: 788acf45-69d7-4bfa-3bc2-08de21fb6006
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?YrMj7/H8JWBVsmJa81XufTYeO59mOlbNDfA5RH9353x4JgnbNcGPdQXiOXbe?=
 =?us-ascii?Q?3n2a1DSeBfIccYXMDWYnJq5BvHLgnexst2lm0TWs9ohdquGbD9yIw3Y+rExM?=
 =?us-ascii?Q?tu9shpAydALOg7LSnvDTsNrf6vvWSr1BVv/TWLa3pUCqKW4jPURPuRc7IzJU?=
 =?us-ascii?Q?AfxEQwZnIYVOYKLpIJiKuWln49m+MHaqfHCl3xNpgHvhtxCTRsfCk4Pvs5oK?=
 =?us-ascii?Q?KaGkmsHkXPEcscwRKH/UV1/bU/PmlEouG/Dxa22K//jlBjoptrduX+PJUVB6?=
 =?us-ascii?Q?BrX9mn9snNYYc69NTjwy13z0Hwr0IqfT/8EFR8Lg4WDcsGeDd6+9aso5vENq?=
 =?us-ascii?Q?PN4wV8+o2rOyl6hCg67BvE5bPymsexlQx5EL9bCpSCqCcpsyONJcHBH/ST7s?=
 =?us-ascii?Q?/2UatbOjQC0gznNChInk1DxnNPEH8ITq1F7GtCgJSKoR17yy2kFGGqY1qdWH?=
 =?us-ascii?Q?KKzChNzxAIvOXKzN8EFs0LzH9HuWpB4ZJhS4kYXYPEwW7ajcjZprxWf0PdPU?=
 =?us-ascii?Q?gc34fgh1HQyHmUfpbGZreltqOvvcgZHpv6Fo6SfACoHXSxTxk0np2lFUuikU?=
 =?us-ascii?Q?0/wELCPtxLUkxXdlfziiaGL5HFUo8EUkXUap6pQhThMwQQ1vrneixbDbLZf6?=
 =?us-ascii?Q?XPrAE/eDNylcNUaFZ0kXD/jf13ztl3bOS5cCP0++mYs0FoVqRFxi9U0jf18q?=
 =?us-ascii?Q?UL53GRZN2ULwhNNZpFMYwyVQ2hvm2EAmlvmmylcO4c2PMQXTvTEYdvLP5+Wo?=
 =?us-ascii?Q?y5K7I+uo+lagSMWYMKzNEHRTHBrN/OcnDr0EDk0CgDou6BCd4ghiPa0zQwX8?=
 =?us-ascii?Q?1L8fRo+oovbYXxpnSj+m6FeE7EqZuv+j1q7pLMQNzmPP/HJI5dBsiviEd/TO?=
 =?us-ascii?Q?uogDNjY04Ed5OgLQmMX77PbySQtFcTbgVojlC9yBshDSMYQQqp7CW2HGpRWB?=
 =?us-ascii?Q?AJY+mm6yRSinNoks48ZD/07YlSFaxlRunhWgdJO4IZtJJrnlbVxrQthDhJt5?=
 =?us-ascii?Q?9GhAFDMrH40m0C8VuSnv2b5Ub0pXz+7aerm6IexZiB7Tq57FBFVKQTUZEPo8?=
 =?us-ascii?Q?uYV1ki9voltdNuE2lRYNrBhCXYLfpBo/qr/n/jQaVsL4Q4MiKRJmRToOLwzI?=
 =?us-ascii?Q?i4pKZVrp4vH2IPIuXyR/Gex76VrAQXgyV5p4K5GhMicQpxNLJBxnBEJcvqRp?=
 =?us-ascii?Q?SCJhfXjg68obQ8b7Hvi4U+Bn3pZJ39dCDiEqlgRhltN2TB0qKIg1ayheUceE?=
 =?us-ascii?Q?x4nFePc5NXP7AIWJN2WIVbDcHub3XEjbDZiG2UDqj+oyLIZSNBHN7D+5Xsfa?=
 =?us-ascii?Q?/dED1KweDfV2ngRNlsPR8sDuue0rvGV8mJijyqs++b+E3Hd4Klnxik4IZ5Vy?=
 =?us-ascii?Q?1Q8WfHZriEfH2KMcu+rvZM1j3udtqcJC6RbU6wXYRv4vXoMUatj5IO3zYJVl?=
 =?us-ascii?Q?hNjmmhp9oEHbTrn1RR9WAmDSWrHuGEQEJjnGlN/wI3H+rRZxPRxbrDga5vDF?=
 =?us-ascii?Q?kbCQS4adahapEUnfKNxiCWJ9yhDKcd1gnUfG?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?hXJbPSloejzKjIp4xyuh93GB/TIsZAPZnHKWQdMyrgnj4ds3UeAln6PN1koQ?=
 =?us-ascii?Q?/qefaAcJa+uBegNOcWau4lAfSSWd+yQlDtIW3IJqPvoqxjHBwXLHBGHYKaU7?=
 =?us-ascii?Q?JaBzMV4btGsjOqwMY6d1YD8PxW7WhRjFl3kAdwMoKB/LYmL5HoIuAgIlUKbq?=
 =?us-ascii?Q?GiB8o7LfdDh3TnKTzJmpWxrACsYcp0jpMinSX4jGRHd4PRPKlO9+0fzj3crH?=
 =?us-ascii?Q?YL5jSLj+LXOOUpwts1rja0h05rze6CJS+mx7js9ofx6PhKBPwplINtw9piY4?=
 =?us-ascii?Q?QiHgFaTWwXNT4RXEgFry+fOKlgduyaAK3iEGKF3kk1OxL8uo38xn9NNKtrwj?=
 =?us-ascii?Q?BYVz7buBWFMLKaInd+wvFTaFY4dZysur7uLpmus4pTfIUXbam1DO94G58DCB?=
 =?us-ascii?Q?puuNg+UkMkpa/6T2Yl9PFhxfsgmeDvRvnzEvOSqJeY7/OeJDKTk/0oMNd08O?=
 =?us-ascii?Q?r100uroX3Nat9DruTqf0fmUHcyTVgFebSsruuHsgAifIFllxYtSss4ZHlJx5?=
 =?us-ascii?Q?FOJEwU6bNIxNKS7QKeQKvVCc6JxR0ECHaKyoh7DTGR24HwaB39xeW0Sy11t7?=
 =?us-ascii?Q?Qw8aEY13cp48fWsLNef6R5UA5W0pbA4GxWHBRiSAwhkjJyG2Ov9dsqf2zfuk?=
 =?us-ascii?Q?xdTe3a1Up6xmP7tUNzNi5YfQrXyurqcwuw5kXh/J4dTdWtoDah2iuNPHJjz9?=
 =?us-ascii?Q?ghlRYvHmVjHh5t4GCuqECRKrwAXtDO+FAVlIenKbGcEc1Ww5vbCiOBWG0e/t?=
 =?us-ascii?Q?/tXaCH5vYZsFLGNbpXwUTAMMQcb42Mq8mnO6l83FBWkGFyp+bDc3ehmMe22I?=
 =?us-ascii?Q?HzKGpVT0oH6cTg7gpQPeTS50Uppp8EbDtUCp/udHBYW5AIOAeBfwe/OM/djV?=
 =?us-ascii?Q?spDBXWsx/MkVYEUcqOzir4vyA+zoJnx17jBzXF5g6AywFX8mhBY1Z98RqAmT?=
 =?us-ascii?Q?/2muZFt4ov2b1s43E+cREX0Apcxt/vIE3T64fe+J3LbJDjofgbs97PXDJ6Sr?=
 =?us-ascii?Q?m9BPOyFnqVQdo8hUWmIoQamOVqDVMNYCRPhodjqdwCRRtyYF6wAmcJPN8nC5?=
 =?us-ascii?Q?eX4lgkjPRXasWFBaY0FyimGY3kV/N+i4jgvD6o060cmVqNLku4AEpJjIWZ62?=
 =?us-ascii?Q?ZJe9JB2voc2azHBR721rQLW3V9AbycoJ+ca2ROm/oNdokKCKi4xhzIHZopH0?=
 =?us-ascii?Q?Wt9OP5ba6jzT1pw3j0AD8ejPbBwyBKjuwQRDTcgXOaLKChuK1g4iFfm/z5dd?=
 =?us-ascii?Q?SnzGCyDPvXsVIpr0KnF/dCdfrEeDtQFEWyIOE02K1cK4QRwcJ35Az3+knYZb?=
 =?us-ascii?Q?zNVjV91lqw8+9J87mZ8iPDAtGDhy6HQQJZO93y2g1hBN8F/zkJtT7uxDQofF?=
 =?us-ascii?Q?fJprA3dtH7/nba5QkvcxmtqIG44nqfkc/BWikhQxvBXh3k9CwPKxzb9QKov3?=
 =?us-ascii?Q?bRoZdR+lXAoYrSH4GmDPBdUDwGqbSZc1pQ3brY4YvWdupG9zBbA3fbZFgf71?=
 =?us-ascii?Q?sQilPL04/cARqoH+m7vBWdlDTHsjGqjBby5RvQn0coz+oGChwC3QKA9usHqY?=
 =?us-ascii?Q?4lZZqYFpkwecYbQJ2ahUDY0D0HotR+tQrMMS7bVZ?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 788acf45-69d7-4bfa-3bc2-08de21fb6006
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 14:54:26.8096
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TfZ2KohxGI9BaGHwtgCXPU4RMblArlsweQoJyz13vqklszlXh8C+dC8uszCcKTnyGxpEAswfFtFXwQGIDXpwVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6822
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDEyMCBTYWx0ZWRfX39sDt0sAeZdo
 lZpUKMYST5h6L1EJli8QAe0ZZdrG1RYPVByKM/r8VKzPOPxZzHSZVO9bbq2oFoDZ5clWCHTDm+O
 erL9dft/+veTD9ZO00Y/47mPizDMhOc29dEicmkam+7xBg3YeO2oGr3u7IQzaVx1GWZUXy1F2Fb
 aaJ6acXVRVOcCDYFOABZaa2XUW3hDpabZG9965nZ6omViXxTO+mY3IAxsy+u+B18PKFkLg+sQTv
 DacxsEgKGnA/YeSGjuCplOmRg1VMj60fG5GKahStDP/o3hVx9Xd4mJlfq4GvRlvjKhMkpJR5uyM
 BIetg08HVUOxD4bI4ue63zlwz1Nr7gpW77nfYJVl5tiAL+UradIVT19vV5s/sJ8vzNzG29SvatK
 4HzJLh0t32odj9qttXZRNXHoQOIiCg==
X-Proofpoint-GUID: P8XrQivwzdAip5RqKHdqKfTaCuaP5LDA
X-Proofpoint-ORIG-GUID: P8XrQivwzdAip5RqKHdqKfTaCuaP5LDA
X-Authority-Analysis: v=2.4 cv=ef0wvrEH c=1 sm=1 tr=0 ts=69149fa7 cx=c_pps
 a=yZuzC5SkKTYVmguxKPWuow==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=xSI7OE36uldQWmmXDN0A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_04,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511120120
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 14:54:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121556

Add UPSTREAM_CHECK_REGEX to check the correct latest stable
verison.

Before the patch:
$ devtool latest-version python3-pytest-timeout
INFO: Current version: 2.4.0
INFO: Latest version: 2.3.1

After the patch:
$ devtool latest-version python3-pytest-timeout
INFO: Current version: 2.4.0
INFO: Latest version: 2.4.0

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../recipes-devtools/python/python3-pytest-timeout_2.4.0.bb     | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-timeout_2.4.0.bb b/meta-python/recipes-devtools/python/python3-pytest-timeout_2.4.0.bb
index a376d02e38..3c99da4a36 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-timeout_2.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-timeout_2.4.0.bb
@@ -5,6 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=d8048cd156eda3df2e7f111b0ae9ceff"
 
 SRC_URI[sha256sum] = "7e68e90b01f9eff71332b25001f85c75495fc4e3a836701876183c4bcfd0540a"
 
+UPSTREAM_CHECK_REGEX = "pytest_timeout-(?P<pver>\d+(\.\d+)+)"
+
 inherit pypi python_setuptools_build_meta
 
 RDEPENDS:${PN} = "python3-pytest"
-- 
2.34.1


