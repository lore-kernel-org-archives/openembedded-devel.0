Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39E63F55134
	for <webhook@archiver.kernel.org>; Sun,  8 Mar 2026 05:55:10 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24310.1772949299797363611
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 07 Mar 2026 21:55:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=BAf4wZI1;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7527cf9310=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6285swmX3940844;
	Sun, 8 Mar 2026 05:54:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=PKX6rKrT/2/VBc94dgN7buGyxLnpIIwsTkc9MSa6Zxs=; b=
	BAf4wZI1rgH/6CgkeFI/syJ2EOonWpEsP/WVQseSoE1h4tqjXymn4VaVLyYCyt/h
	hgv5RSu0SeBahSQCq+gQIcr39KuLQy9ZIW1A4wAwhXImifwZbeFrqfpi/1pUcHva
	Lybza0ks5ob/5jt12LEZrTPyC8TrSM3X5JR2qn9LRlw/97JRudKlCYStq7prh7xO
	Rxo4Nrj6B3JO8j2hF5miu6VOUb7cz/Yfqdfo5qYaTheja+sizaG1g1HWN1Y+k5YG
	U5YEkNxsJZF8IEkftCJ5zlYWuF9PxpAChe8Ak7FBbvQdD7C02uXCc1rTN0F2CjJC
	GqxhztNuPMPUvyYRSMihZQ==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012041.outbound.protection.outlook.com [52.101.48.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cr97v8vcy-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 08 Mar 2026 05:54:58 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L4IZO0UiqN5DMgmcY7mavXed45yRtLQrPtf8H3n18fncVq1p/6aCqdgaiKWksWhPu74/ZOI7aNAAzG4vRDt609aA9eFpFA7hnudY5H1OzxbEbNUVNkYPBa+N/plDdLO4dcYFUSQP6p92JaFT0MmWxvDZC6IQ3l9NzmpenRziPHF0Qq4lll66MN6DxHEvp7nI4eTiKWT7YtvFFZd6vAmO7xkfJPRYBTbkMF5ftPted82y6cdKovSzN4Yg/aMUFEgqgkj6wylr8hrpjGgdTfG73mJAkIEeSCW+X1WoHR88JYLOiB/dUqi8baCZmWbrir4JZ4Sj9fxFnnt9wuT9rLMsiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PKX6rKrT/2/VBc94dgN7buGyxLnpIIwsTkc9MSa6Zxs=;
 b=YYahucxz8Y8E4+cHAHIs0Z+nxx8QsvwFPuZFGcci1wOZXVswuyb5Njuo60L/uPziJt2sSJUYphv5HmA8ayjvBVurTOmeA1FrI0x/eWPA7PH5d81TMB+yF1tDAagj8MKZuYRKV724Ol0Myj9nf2oRxMP5dP8f62aH/0YM9UJVpW+t+2ktijnRvCSAVD84GwqjzIUno1IpF1rmcOA87yESrVcs6EEa1jCQErM0NHswfTcSjQNtUfm50ZaZ+E54S72v7LoJgcbm08VwRxaAJrU6JBx6cZOszLWXZYGaJsdrGSsH9P1wmK+sXNOqczMYpqQcmOPowUwsHOG35E/KnJXPGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by DS4PPF7CFF9C87C.namprd11.prod.outlook.com (2603:10b6:f:fc02::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.7; Sun, 8 Mar
 2026 05:54:56 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9700.006; Sun, 8 Mar 2026
 05:54:56 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-devel@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
Subject: [meta-oe][PATCH 2/3] bcc: Add riscv syscall prefix detection in C++ API
Date: Sat,  7 Mar 2026 21:54:11 -0800
Message-ID: <20260308055412.2450108-2-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260308055412.2450108-1-Harish.Sadineni@windriver.com>
References: <20260308055412.2450108-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ2PR07CA0020.namprd07.prod.outlook.com
 (2603:10b6:a03:505::19) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|DS4PPF7CFF9C87C:EE_
X-MS-Office365-Filtering-Correlation-Id: 45b8e29d-0bd8-4989-6b1a-08de7cd73a16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	3CBk4wGEq2QKHZ/enExemsRo2JpYTO58UxdKvpNroapPteXIW1adNbzXvskhKgaYGD+GR27+MZlUYvK5/BoumL0dqJ4oytwtFZV5O91ohLK9dXRSP4eVv8PQqcbtCUT72jojE9kUzSxHoWnLZkjEnbwMm2yV4YJLlfX3RIMhIwufJNyXhn/bSmVP21zVVTVILz/QPXtfksO9a0s7k9GroehZTP79sdWBPcem+j4+RVz5NRhBYdZeuztBkT8vT+3VuAM6eSItksoyWHuH/HnPp+3lItuLO2O2b9jg8Q9qhHHtCMa4zqgPPuWfMNb+hc2TXtKNARcS9PjjTJilee6w3jNERV7w13AgGekXoMpb4ytnlEpEFmEPKnvvi0f2hBKdtnGQxR4Bjibe2BeW5H3U5cMdC7DXsK+iBAzOptpeEwBQ09FPsaF6xurRDtfZ5zh7LwB2x29jgaIt9FN7ATPhp2peUC6HVS4cMXjgqDHsI56/kkQ4lP+faAGNk55sRyKbr2VKTBJ6kDrS58Ex7/+q9GDwCp2N898V5AUDJ/vnXtgd3+io2kCWc5vHXaDOZf21NsDukqiYm2oh4hJJGycQkbJELEDXOZD6W08g/1A/QVZ62JAvZ8JsOU/7rqomuk9ImwPc4oskVy8UNj0VThEhWgmoTB3K1UUCSqbzaS5tP3lQYF8AOASQvNLAfBqFUlyjrIltbVa1GHAeeZVg6kWgkTtoZKgY0Ny+hkrpfSFZmc3uqh7H5j8uzr3Wcst8rAY0
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?1o5fDpv8xSch81U4aNFWDLIjYfkh6+oTUWy4Q4IsdHmneYKf7ajFHLZLK0g4?=
 =?us-ascii?Q?2aN1No23PlhbVjS7xiAljHQebyDxWNm6l0+vvjyvlhNQ172gmK+YI3Xj73cN?=
 =?us-ascii?Q?v/iJsME4ghEKPPass0tBNCSgK1hU8qzeQx0kDfIIPDxBSJhyD2zdieIhAXVP?=
 =?us-ascii?Q?/jkSsSjRLjCfEg3NEB2bQLoiINP6bIvh/MWT8++GwkeqPDG26wkNCKWnJJ4S?=
 =?us-ascii?Q?z9AqT/foxnlXzT37Y11RWj2dKrdw+J2h+XICHq5M2RauKycNnPkh0eZy5b3g?=
 =?us-ascii?Q?pAIP1LHQhyw+LIVbpIDqV64CLLgYJNJEJlACwrBmelOdwjef7X1ivuKJx5KH?=
 =?us-ascii?Q?gpVgGVJPuIxqLDq5Ui9fTj1YvtcJ7511cI801Tju+VGU9efJHH3OyHq00MjK?=
 =?us-ascii?Q?jZw3vbriNnDo1mrx44A+WEngEOfIifCdYLGMbDzKryrOa3V/m2ZtbUNkYEn3?=
 =?us-ascii?Q?UOo2/IzZBkoXctePkhdV6NtVmMkpEw3lhmm4oHWOw1rupkvHx1fte5YKTdEG?=
 =?us-ascii?Q?dFtviw8tvyj/mk1L2lg6f6RXn69rPCtg6qWQJlUeGfg3xfgo2sbQFdgBTBgL?=
 =?us-ascii?Q?11APndCJSjn/IvgFZZ2qEJ9MbIbU9uQWNzdMeF517jq7xWr2q2j30eLnBDnx?=
 =?us-ascii?Q?6e2iHFBuZ+zoN69y1odqWocZev7hVHHso59gtX7MNgyG9Su+DOXOOkDZxdIu?=
 =?us-ascii?Q?XhTSbkOqfW7qVgv0hkAAsfxQbmBxaDb6ICN7ME4Qb5jBezdYzvp9rl7888VO?=
 =?us-ascii?Q?DJYw7dyEw6XARgeRPzhHEOfC5WTKjBSSpcypvw2hFbgITC+vPUSLk1LGdIjY?=
 =?us-ascii?Q?sK2SviGq8SGL1yBu+fksnbbLB+uhGTwdt9vWDMZZ2oEDvHxIsutzBffmd3q0?=
 =?us-ascii?Q?q77YtMKYvIWn6l+5DGGdLw+MNaQSfF/QxoUQY1zZjJVM7PmQcD/HigFofOMj?=
 =?us-ascii?Q?bqmc2sqRPqnR/UA2RCMgc9CDEQIAwm7Swq+6K+NcfycqAM1h5sGvhJ+p+pwl?=
 =?us-ascii?Q?Civ0Pi0tA8PyKq0iQGzkwWG9JFutIddgTKT55S65MspWCpnRRGzTFqoBVk0R?=
 =?us-ascii?Q?Z9G9QeTpAZKe+693eLydXqtxhY8nida5abzWFoz9PHbHlGFRsShw3wY6ZeCX?=
 =?us-ascii?Q?vQGbri49cOVhs4ExI/ol44zJX5zm6Tc//QsKFPOkZf5Y82nwiFcNqlBbmcZh?=
 =?us-ascii?Q?i8GNKlEFSajZikMt0e+YQnhdTHRx5xDCGboxkX8aFy6udZWd0rJR0JvfAGJI?=
 =?us-ascii?Q?PTm3ZJcjX2ggPP/vACn4o8uts3TCSU2YyTKL2Z4k9a4DWWHQWkH84IFBred8?=
 =?us-ascii?Q?u4A9GBhILgpBMjjvENitr/WhGS3Bi5zpV/IC/aYnXafhYZchkqocwvG/Eh/W?=
 =?us-ascii?Q?eUUc6wk6b2tkg5Z0fg7XTcVaAIPTFYmALNNTNvQYpfQWWv1wcoxwzPF3/WHj?=
 =?us-ascii?Q?bwvnR3/kM/dnuyNUcUVj3Rhfc67wVNFW0y3N6T5PuxPPTlCVTmbpoBvPsUS+?=
 =?us-ascii?Q?Tgu39YS+2e2zn61cIOAcxA6RBxBBxQTiSlM21R+WMKRylLdNkzswffMUOAE/?=
 =?us-ascii?Q?bhd/ydqkfoTZZb/qOKj67b9zV/7QN873wg8nTJ2ImwB/0WrbbxEUBBYnP1H7?=
 =?us-ascii?Q?NwV/g4/4vOA3BkbzTABpDpSuBVZ87A24SGSmlyi9IpLexjS4AnbnqIg1Nbsr?=
 =?us-ascii?Q?g2FKuuD3NMzbOokBItZh3ovH4MPoiigYraGs46ca1b0hCsCQbSADkKu5RMvz?=
 =?us-ascii?Q?VM+DIOZxMqtGCCR6ZPq627Ps2v/GDrA=3D?=
X-Exchange-RoutingPolicyChecked: 
	iJg7I6CVx1p1nsX9qG7KtWZxHVEPwwcbj0gDAE2/Ubh3NIN9v8ZECgNcOTTjrVrqijVQz1oUfspjgQn7DvzqZbV80xQZMv5dbLcOHYxgENxj+/sGC9/j2oZ3nkmAbWPge+LDUu4zGTP21D55ykvIKRvXQQY6ahHrFRHO0cgRkYr0GJD8Sr+pBduAwe1G6DeYj4frHWxMX5S5iMXnC5tY6n4Rwy4FNXhVpbOQFgTxVJva+1+iLwVYFDSZks1ON2mSfolk0z1G/ElVpWrG6esK5AQKSud4lOUfPESpevyVc489u4JlXPZmdnUpLwwwHKvzwQjqoI4nrpBOY3IS4HV/NQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45b8e29d-0bd8-4989-6b1a-08de7cd73a16
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2026 05:54:56.8367
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HW7BrVOUyS53vqbH5mzGBFfEiEqAR0RwR7vPBuyb2MfOfBTV9oMAHnJxh7kmC7baCol8dO/cWRzihyZexynNRX42k8D0sukJd0q+EZdqFgY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF7CFF9C87C
X-Proofpoint-ORIG-GUID: QIM0IXb0ArNVnjN3SJx8LfJNwSu5VjOz
X-Authority-Analysis: v=2.4 cv=B9a0EetM c=1 sm=1 tr=0 ts=69ad0f32 cx=c_pps
 a=LPv6HZ59J3TLgKTE/qPS5w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=YAonSNTuxu_5m3bfD7sA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA4MDA1MSBTYWx0ZWRfX4hNUUHtnd4f2
 jcNxoO6V2M9xg8sbLLNTJ+xXONHFNkRGuqzuwWoql/vEIWHmOh7f24MNyth9LhXQdv+WUJ2jDOG
 jMUZ9viIzfrPDa6eWRPyL1MM31zoXVXeIONbyk81jqRkY1ij6TZXeXEObmdabGqkcPPKqYgZCMb
 6LJU7lNOEmyfuq/p78BTZ0616wVV708NLX7O2OXgqjNE+ZCaAVZzZIs5RLCMZAzqS/LGVqpE3Ap
 M6P5ebxF4Mi8WpDmvdTdZwQF/NhRLJDaI18+qgMwOHX6/+sQMI/CrKR6JUNmPdKUAVxrDXpco5+
 vlfANIGyiYf+jxE1uAnUja6eScX1yBJJ8kQzSy655XgfDGQsx9gDDtLC4P9buOzKoYZSNnmqnOx
 3R2iVThzUPLRWTk77CE/qvhM7gIxT208fkyUrwXTEkFoE5aUp2pv8f1frYHSvsB87XgWABSBwOH
 kFsEU15szGtcIseRXMg==
X-Proofpoint-GUID: QIM0IXb0ArNVnjN3SJx8LfJNwSu5VjOz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-08_02,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1011 priorityscore=1501 impostorscore=0
 spamscore=0 suspectscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603080051
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Mar 2026 05:55:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124936

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Fixes issue where bpf.get_syscall_fnname() on riscv64 returns bare syscall
name instead of the prefixed _riscv_sys variant, causing kprobe
attachment failures.

Upstream-Status: Submitted [https://github.com/iovisor/bcc/pull/5490]

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 ...cv-syscall-prefix-detection-in-C-API.patch | 32 +++++++++++++++++++
 .../recipes-devtools/bcc/bcc_0.35.0.bb        |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc/0002-Add-riscv-syscall-prefix-detection-in-C-API.patch

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc/0002-Add-riscv-syscall-prefix-detection-in-C-API.patch b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc/0002-Add-riscv-syscall-prefix-detection-in-C-API.patch
new file mode 100644
index 0000000000..78bf1df7c3
--- /dev/null
+++ b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc/0002-Add-riscv-syscall-prefix-detection-in-C-API.patch
@@ -0,0 +1,32 @@
+From da01655f0f335584867b3427005b95384499a020 Mon Sep 17 00:00:00 2001
+From: Harish Sadineni <Harish.Sadineni@windriver.com>
+Date: Sat, 7 Mar 2026 20:20:04 -0800
+Subject: [PATCH 2/2] Add riscv syscall prefix detection in C++ API
+
+Fixes issue where bpf.get_syscall_fnname() on riscv64 returns bare syscall
+name instead of the prefixed _riscv_sys variant, causing kprobe
+attachment failures.
+
+Upstream-Status: Submitted [https://github.com/iovisor/bcc/pull/5490]
+
+Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
+---
+ src/cc/api/BPF.cc | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/cc/api/BPF.cc b/src/cc/api/BPF.cc
+index 11c6c542..e1df8208 100644
+--- a/src/cc/api/BPF.cc
++++ b/src/cc/api/BPF.cc
+@@ -782,6 +782,8 @@ std::string BPF::get_syscall_fnname(const std::string& name) {
+       syscall_prefix_.reset(new std::string("__x64_sys_"));
+     else if (ksym.resolve_name(nullptr, "__arm64_sys_bpf", &addr))
+       syscall_prefix_.reset(new std::string("__arm64_sys_"));
++    else if (ksym.resolve_name(nullptr, "__riscv_sys_bpf", &addr))
++      syscall_prefix_.reset(new std::string("__riscv_sys_"));
+     else
+       syscall_prefix_.reset(new std::string());
+   }
+-- 
+2.49.0
+
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc_0.35.0.bb b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc_0.35.0.bb
index 25528e1b10..3a34f04349 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc_0.35.0.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc_0.35.0.bb
@@ -23,6 +23,7 @@ SRC_URI = "gitsm://github.com/iovisor/bcc;branch=master;protocol=https;tag=v${PV
            file://0001-Vendor-just-enough-extra-headers-to-allow-libbpf-to-.patch \
            file://0001-Fix-a-build-failure-with-clang21-5369.patch \
            file://0001-Add-ARM64-syscall-prefix-detection-in-C-API.patch \
+           file://0002-Add-riscv-syscall-prefix-detection-in-C-API.patch \
            file://run-ptest \
            file://ptest_wrapper.sh \
            file://fix_for_memleak.patch \
-- 
2.49.0


