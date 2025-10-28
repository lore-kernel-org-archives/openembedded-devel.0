Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88972CCF9E0
	for <webhook@archiver.kernel.org>; Tue, 28 Oct 2025 15:01:19 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.14095.1761663679173992453
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Oct 2025 08:01:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=dqb4+Rah;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3396a95da7=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59SA2hNm3682113
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Oct 2025 08:01:18 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=KhVVus6ml+LsCWGB+r9n
	wE1tESAVNOT5a1wp5GCKh8s=; b=dqb4+RahLxFmlxH8KPSUt7gGtcUCQQXkq+QN
	T0bK+zfUzTcJ4qyloIHU7vX3Lcyj+n/rnQ/XDsYUSbrqN0SXNYe8evb+n5th4Nlp
	1LP+T++TSu8cRz9q4zFcCtW7jKNX6RXiy3XVe/Qh41n2dKPjvPLbeqAC7FYNDTo7
	ERSUC3je9FidH2WeJpys0aIQ1fqyGJNk+93omMNB0ij2xMBM7X+J5SCdfcJACKXK
	CbFW7sxhI4S0eM62wV60UivoJRqQJWHb1yk9OjrRl23VftHs5G8OWPCFhYfdqb/M
	lBPu78C61Ftl8v1zTBud61AOM2RmD3yHUIyWy0GoLiF74P15FA==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010070.outbound.protection.outlook.com [52.101.46.70])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a0su1k71m-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Oct 2025 08:01:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wrYubdw0TinFG1TwzPYXPkV5BI1ZhehzyGYW/q175tbEyoZ3ehLkS7IueJMwMCkZ8z+88ZyvttyZZ6EA0F7Sez7idYLEFCOpADQI4RIotfd+L1kx0i1gt/u8hV5Uf94797DUgvkBK/33tUIthB0yw56Lst4h+9aIu2UrEBSMKeVFXDFHl56u80jok9zbNVFXg1fn6r/tNNsu9O0H3bKZgHBEBnSS3N36uS0rVvCC4M65KNGksAnsc1zrd64OLWDjlE954CskVmu8k1BZX7M+RjT0DWy52tbHm5qQNv080Ens6W5/C2rOnzfv75Qtvh2jIDQT4/FVvz3q22X+Uhv6kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KhVVus6ml+LsCWGB+r9nwE1tESAVNOT5a1wp5GCKh8s=;
 b=BlQrqPTBgpNEeu/M8TO32sLaQ+vbWWbChwSKzt2h/R0PCRISakiPTSP00lVYDJdxWuLN3kuJwllbrfISUVxsJp2b1wblyKFIZRBh/SUKoH9YdnF5jgy6CgZQsDYR8JFLFNoCZCj+kx/+XYbMeokIszmnlWKvkJgh1Kgu3sfw9EXum2cIDPAGJOEkkjNc69D7ukinNTLnkvd2J2QRfE14v3LltyEwcE/+XOGlQlOwLCN/QpQSMPYkTk9+sWByA544dyNc0U2WEECdTddtZzWC5IBC4rbwbc/AWoArpWvgPF2quUQc9dq7bhlsHHQRjJe8V4zgKA4gkLBXdGTIxlBNKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 SJ5PPF6E07EBAE7.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::832) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Tue, 28 Oct
 2025 15:01:10 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.9253.017; Tue, 28 Oct 2025
 15:01:10 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][walnascar][PATCH] valkey: Upgrade 8.1.3 -> 8.1.4
Date: Tue, 28 Oct 2025 23:00:54 +0800
Message-Id: <20251028150054.2514198-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR06CA0009.apcprd06.prod.outlook.com
 (2603:1096:4:186::17) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|SJ5PPF6E07EBAE7:EE_
X-MS-Office365-Filtering-Correlation-Id: bcd151c5-cc76-443d-de2e-08de1632d466
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?JPHseYNBEAns3IG4M7PegHt2kSN2Ot3GPAE9glw5gLabqlJmbuomojSzS3j3?=
 =?us-ascii?Q?hn6FJFCWgRnGSCBvrgQIgJeXapXbq2d3+ktNM+yr6/dG/GiICZyGHZyzp+iq?=
 =?us-ascii?Q?bnSmOA3zlqJ1U295Oru5SjDLYU9joRwgz/yJeo3DPHY28WeRYBZ+HjCiTuRl?=
 =?us-ascii?Q?4yqxEOq3hzPnOapvakhvHnSvOssfkXdqbKGlGvPrNhqvFLYeCVnbSp7yLLz7?=
 =?us-ascii?Q?stJ2K5knmTwDp/tuD39M9eNHpFgYkxpdrAlVQ+llNPhHbiJjZbWDoALRBlAx?=
 =?us-ascii?Q?ESM+n7m3NmfYtHjoGGmo04Kf17bPW/WYn9CNb2uXiTho/1x2F9B+YhXpEECQ?=
 =?us-ascii?Q?c4vykYam5YKI7M51KnG/M4YabQO7kyP1hgbmlA4jEtGNNy/vDDxbxwMnQyLJ?=
 =?us-ascii?Q?cld6BYsaNrNUETCwJlDbVcoiYcn6f+OzvvgUOJ380yhHhQtYswWjOZMkInDi?=
 =?us-ascii?Q?HiVDnnAn+jlDb8qIShQ8DOMf0SkNCKrmD4l+/9Lah6Q7pTOWAIcXEtPSWNN4?=
 =?us-ascii?Q?1KdIqemZyTOzLV6NsqFNrih8HFpmkmDdZrV3P1jqfny1eo599nch+cKC7yHu?=
 =?us-ascii?Q?czB0AoHsSRAKHvCmzRC9n4wxL5VarIEf0ViRNjlFjvdsbB/qsvkoDPMSZoFB?=
 =?us-ascii?Q?w6nS8sx4EPbWMP0vqkGIq1j8/YF+ojCQ6WA2xNwG303KZL78elSZxHXAniT/?=
 =?us-ascii?Q?zZ3ZohZ9I53gnX3iZ1oC0vQh+yiM/WQR+9GoGnt+nWlBC8jcwtYmJG3Po7cr?=
 =?us-ascii?Q?I3zlb6Jj6ACmZwYlUgSDGI1xXdyBiVAC1tHfiQo+TxBcV0gXyNnsclQb7NDs?=
 =?us-ascii?Q?y4uQ+RiUVn5JnboeqUmApwJtvBbyJeZC3OUChhT5vItJt7HHRm6XsWfgSBHk?=
 =?us-ascii?Q?rXFlbEpB4Zc1Qfhapqz6+kv1hFKp0R5lmats1R9Zl1PK7QKhhMnQESh6HP3M?=
 =?us-ascii?Q?MT6WiEgBLTc7Dqpb44Fq99zeP2+jdZ3HY3qR67q4IjW1VqHammcNmwJ/72sq?=
 =?us-ascii?Q?sea2tDdCyXXcvxZ9+tFKm4gwPq+UacKkazNa4xOcJ2asubBtvnWBpMZp2HkU?=
 =?us-ascii?Q?hIrBxYCHkjmpG8BfwOa/5xAACm8YBKBDQi0KtEtfsAxUeJPKKvtaw3L3r/2s?=
 =?us-ascii?Q?MD3JpSYn1L+21PwlJWJ72n0ThCESb/mWNt3AYPdWrYyLVAPyrKZCt5a5L3I8?=
 =?us-ascii?Q?eOPab068h0m1rnBBj6iiQ0iqTosutnN9FScQl/53vjpr/0ljzbWXI4hPBseU?=
 =?us-ascii?Q?jalmjlaNf6W7TbCKWZuKNNYBpuxrmvOV38rYX17L5bUjL7BkIqSFQIuJvNcX?=
 =?us-ascii?Q?W5AcctT17o49DM/6Bbz/jOmWpEguZYbYH25PfklCvcEFR4E5sMfxC6qSIaeC?=
 =?us-ascii?Q?IIrOegBUTNHPlmmwbgZ/WbcBhEbMEAle3BkgKb19eIRXQVXJ/W9xhfUDejyy?=
 =?us-ascii?Q?M6uUPnbu9ohwz/y00NQBosvbgjLNpb67F4jVO1qpZShDVEUJRm1Vs0pldwT0?=
 =?us-ascii?Q?R4Q2SwKltZ+tIFMUnHizmAThruaDMtu6/VoY?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?BRMHigDHjU/ZOyl8BAmNYN6Moai6RI6Sq2Tz6mEDie3I7TPaBatHgKqLMQG2?=
 =?us-ascii?Q?4pZIsSZ4SfrGIG+T+RPe6HYiSj+FAvzjUtn0uQjy6spdooMt5VTeQhGG/ISh?=
 =?us-ascii?Q?wcq2NbOYhkZ+fzHQ9L1HB0QWhuR2vExb0koCAd2dZWSpeoRVeejocMXFaqff?=
 =?us-ascii?Q?SILg5e09f/VUbQ8sLtl8P90aJv2Xr2SoQVQw5RjCnF30klfXZ2nW9gVG2ADp?=
 =?us-ascii?Q?BTSVF8/KBAUrKmgyafPgU5e6wimL/AuLJsESYfKpABeyQ95ypAdWLI77mzdO?=
 =?us-ascii?Q?y4GaMVJP6ORZliiurbgeWC0WZTH0zxnpnZvtmP8DpnmV3A5v+O36rpx5X5L9?=
 =?us-ascii?Q?rnUKYIj6N3QrQPg4tm4H/UkLNOwUmMkyMhUG82D2prOmKZqHpn7M1vqiYA9y?=
 =?us-ascii?Q?E54Epy4orniJgXsdpSoTpRI+lGHY6fOut94CrkKqma1Rcq6okgfFKr1WAqQc?=
 =?us-ascii?Q?fG7aw/EUEZRxbC7nV7i/clfdS+60CIcZGyuKDGA6CJC1TNZJRMSKCVFrS0sh?=
 =?us-ascii?Q?h5EEeYaG8rMJ4Nxktk0CxMJZ8IgQ04xi6vsLuBDpseuEU0ULEYaTSSwPxOQO?=
 =?us-ascii?Q?cITtFfXcZPPfs/3Tw9+SCjTK5qoT/TFs7ROzM1ykEUYPOT2gvjl174DnxVv1?=
 =?us-ascii?Q?wCXBB5coBgC4SG7bVIQbns3H27KILydH71H2SrlEtQ+7iMVHlBNbBitpayzx?=
 =?us-ascii?Q?1Q5zlp275wxWdv5VC/sygDjcVq2X8F7PnSmhqf87B2Saez0PvF8/060IBlAC?=
 =?us-ascii?Q?Gv+Md4ipMuRqSwhex9gWUnlP9DO1nH6YtwKVs+UNW19ih69gF8MYyuitbDrI?=
 =?us-ascii?Q?jkX+sKUs0jvsmVeVzgwoRrfMIaaOHFFlCcIkQQfXZZwI1x3ZOsvrVrsQPcLD?=
 =?us-ascii?Q?cH2ZdykXAS9CBKnu29Kn9on9y8mud+4nLRzJZ5HWtpJW9o0wRDlFdGzdq8wN?=
 =?us-ascii?Q?95b6oohl3u54sO2GMndyDFn13s5Ym/6i2fYEfd8sq8Ns+DOVKhRb+bftFnhf?=
 =?us-ascii?Q?RSo40F2+zkHcqXBWZAI4O72joNtg42pzWoeLWXXJA9yhPoHiD4Y9FxV+m5kk?=
 =?us-ascii?Q?LAiQUa5VP+buqypeVPJU3L1C5QrQ1gTHDgHduXR8eTSaypYFhIGrW0xR+pwB?=
 =?us-ascii?Q?Z8SStW2k77uMiciCLcYVFWf/RXXlasIn+ahdEId3xKimRKNwvVDkXFi/WEHl?=
 =?us-ascii?Q?nSuqd681BwL+DHtWbLI6H16MITydlr/C769eb0oyaArsVllxTk8fEAiFrucO?=
 =?us-ascii?Q?BiuwILrrip8z9kS/Do08+ygFFJMQNVca5GP1fyh+FIeEzu9vbW89/PwnXXjH?=
 =?us-ascii?Q?xdVVPvrWaVJ73gRf1dH1kMZs4pb2UtGpEJs5ar02WWP+bbmBKgFQ4bvbcvYV?=
 =?us-ascii?Q?RuArz2Bx52T4EfDPnS52yIZREhGBO6Oy71JEsWQrp7drIj5NHg+LNd1Rq8ia?=
 =?us-ascii?Q?i84G6mtt4zI0Kh2jdiK5Cg0X5stB4fJM4kjWUtuq2b46eYEoORyEFT1HyOQ5?=
 =?us-ascii?Q?h04jdIN5gSbzTtRGgAQc/pjxcy6NRTOOwLxa8I3Hjg9K7vGOcOtuamEIQPhn?=
 =?us-ascii?Q?jETiLhmFlODPuCBWCSdNTm1H0zaRgK8/eYp5zmJZ?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bcd151c5-cc76-443d-de2e-08de1632d466
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 15:01:10.3867
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dYltGLqEt/P7IPrnPGbLa/B/vNkYlUTsgnnI/a89Z+URWJyrfkcUbF5lphYn00AF0AV35AP3DxiGbZ1+8JovrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF6E07EBAE7
X-Authority-Analysis: v=2.4 cv=SuadKfO0 c=1 sm=1 tr=0 ts=6900daba cx=c_pps
 a=DyUboiW8/Fjv5kZUpInndg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=k-42gJp3AAAA:8 a=pGLkceISAAAA:8 a=t7CeM3EgAAAA:8 a=yNo3mosV5m-V4fZbuHkA:9
 a=uCSXFHLys93vLW5PjgO_:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDEyNiBTYWx0ZWRfXyahFDMgblx3R
 vs20M64AlLav2ZE7qKogyvR84QmkqhzM/sQ3asb2rKmlToORwx5xCr4QrvusLQdobmsTvsuE0S4
 cEM/3lxth/zUj7d2YB6qxgUPpVct1/eeNIDwDHOGXZa0c9gZ4vAF6BIffUg7/uIO1QhUaq2JpAp
 WS2PAUpzzuwj4/dahFJgtiChH3OhJJECW95VwzMtt4CeoOQESz363LNCXl7y+32370upw+67Qxo
 XsJsZhYBHnrBHfr9VcZl1BuuhZiYNaE2Wyijl05/UE0rE1s7ACFIWEgTk7hFAySnGhZqRoKw6hB
 qYbOgNxSnBiVZsVGCoKD8XBCBrG5Osf+qYfMKuXxQ==
X-Proofpoint-GUID: Gq7N4PBK05AU5ZQG1kP5MnbY9SISlxxw
X-Proofpoint-ORIG-GUID: Gq7N4PBK05AU5ZQG1kP5MnbY9SISlxxw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_05,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2510020000 definitions=main-2510280126
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Oct 2025 15:01:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121093

From: Leon Anavi <leon.anavi@konsulko.com>

Upgrade to release 8.1.4:

Security fixes:
- (CVE-2025-49844) A Lua script may lead to remote code execution
- (CVE-2025-46817) A Lua script may lead to integer overflow and
  potential RCE
- (CVE-2025-46818) A Lua script can be executed in the context of
  another user
- (CVE-2025-46819) LUA out-of-bound read

Bug fixes:
- Fix accounting for dual channel RDB bytes in replication stats
- Fix EVAL to report unknown error when empty error table is
  provided
- Fix use-after-free when active expiration triggers hashtable
  to shrink
- Fix MEMORY USAGE to account for embedded keys
- Fix memory leak when shrinking a hashtable without entries
- Prevent potential assertion in active defrag handling large
  allocations
- Prevent bad memory access when NOTOUCH client gets unblocked
- Converge divergent shard-id persisted in nodes.conf to primary's
  shard id
- Fix client tracking memory overhead calculation
- Fix RDB load per slot memory pre-allocation when loading from RDB
  snapshot
- Don't use AVX2 instructions if the CPU doesn't support it
- Fix bug where active defrag may be unable to defrag sparsely
  filled pages

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../valkey/{valkey_8.1.3.bb => valkey_8.1.4.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/valkey/{valkey_8.1.3.bb => valkey_8.1.4.bb} (98%)

diff --git a/meta-oe/recipes-extended/valkey/valkey_8.1.3.bb b/meta-oe/recipes-extended/valkey/valkey_8.1.4.bb
similarity index 98%
rename from meta-oe/recipes-extended/valkey/valkey_8.1.3.bb
rename to meta-oe/recipes-extended/valkey/valkey_8.1.4.bb
index b5de7ed7e2..828ef53102 100644
--- a/meta-oe/recipes-extended/valkey/valkey_8.1.3.bb
+++ b/meta-oe/recipes-extended/valkey/valkey_8.1.4.bb
@@ -17,7 +17,7 @@ SRC_URI = " \
 	file://0001-src-Do-not-reset-FINAL_LIBS.patch \
 	file://GNU_SOURCE-7.patch \
 "
-SRCREV = "d063dff523340e5a075f7ddc436e0c2a43d04061"
+SRCREV = "5f4bae3ea10174a7c872cc099c953b0e91afa93a"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


