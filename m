Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B208CA5FBE
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 10:39:17 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10367.1790764752924594946
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Sep 2026 03:39:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=D0qhjCcg;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=47337851c1=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68U7eHjE3868189
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Sep 2026 10:39:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=pBwBZEvLb
	M9x0sfXnP9vytf+Y4CXhQgm5c7mvbUjKi8=; b=D0qhjCcgPkkMebTk9Xp81BGA4
	OBiRspA1qwb0sKOZzR84pyb7zmZDMOMAaVqFon80eooAJE/izhG3RP/RYNw/rq4j
	KkqIa/Huk/ZyJUphZQpGzTfe9edpdY/K52ChsJZdSJhSv5T93uiJlRq4OFR5rvBR
	vAa344eay5Cpd8keTZufUFHmab27uJbUCtAz3UqcvRuDh8CY9NWCuK7sH1KpmkCd
	m2RGTkf0RztWPVAri5SKwS9cWXg+HR6gAiiroPSCw/+JWRZA+jS95P1JF4lix/Eg
	a9Px4qgRRR7YMIRHPyogZumVkHRIQo9HlSsKG3cBa/cIvgSFua+cfx1g9EiHQ==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11023095.outbound.protection.outlook.com [40.93.201.95])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4gx515e88p-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Sep 2026 10:39:11 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fDTa2hwAISHB1bP/WfRLggjoT9rSQji21+KyWHfhx5NPVMVANWdf0cP+vvMVfLJ9KQh59lTPpuKtceA+JetoVUYYb0SsNatZRN8bEFtHaXRozSmpnAyrO3swEohsYZMODdk02KA94Md+IZKFSa0svwcRmhr4pX6ASKpI1bgluD3klYu2m+CAgl7AI1xBshjvZXLI5NhPGFeyNCSGk4gaghCfTrISMAR6i5lU32z+ANyZm/IDQIl198hcHO9Q0ZVONYByClcjPYoyVEcPc5uYQIXbwOAS6esIyXhuZj4wp0lxolW2hBbdvk4hX+HiQBqN7UZ5hDfqLsFe4OhyRbUNlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pBwBZEvLbM9x0sfXnP9vytf+Y4CXhQgm5c7mvbUjKi8=;
 b=vKDGNcF+zvfJLnxRYFXKBS7IlWEinRz+Z4dGPXWRXj+xLe9EEkS75d42iP/GVGlwcDvNyExfyYytaSjuVffvrB0rZ81k4T9ipuDc/TzRA9QAZ0p27ouOm4uaUlHA1BYRh+QmC1FjkEBvbC0oeSMYlvX/EDfBuezlvhGTvv4V9bYBns24lY1ec5FypwHaUj+J3+nitXA+96pbo32UXC18aSFzw5hlhiGUIos7y3KICkyp5C4C2K/G+bAv6qc9iAGAv2Iljdy0DWDyYHHW6mhCpc0CJFupklO5h0dIcZdxh9MRexeb+YIhJGAqGEHhx30+xg2hz8uo2g7vTrshYizTEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from DM4PR11MB7328.namprd11.prod.outlook.com (2603:10b6:8:104::9) by
 CH3PR11MB514151.namprd11.prod.outlook.com (2603:10b6:610:360::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.26; Wed, 30 Sep
 2026 10:39:09 +0000
Received: from DM4PR11MB7328.namprd11.prod.outlook.com
 ([fe80::26e8:ea57:9a33:9a86]) by DM4PR11MB7328.namprd11.prod.outlook.com
 ([fe80::26e8:ea57:9a33:9a86%4]) with mapi id 15.21.0451.026; Wed, 30 Sep 2026
 10:39:08 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-devel@lists.openembedded.org
Cc: Deepesh.Varatharajan@windriver.com
Subject: [meta-oe][PATCH 1/3] fd-find: update 10.4.2 -> 10.5.0
Date: Wed, 30 Sep 2026 03:38:53 -0700
Message-ID: <20260930103856.457219-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0167.namprd05.prod.outlook.com
 (2603:10b6:a03:339::22) To DM4PR11MB7328.namprd11.prod.outlook.com
 (2603:10b6:8:104::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7328:EE_|CH3PR11MB514151:EE_
X-MS-Office365-Filtering-Correlation-Id: 6483d389-8e24-49e0-590c-08df1edf0ea2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|23010399003|366016|1800799024|260925021311599003|260925022911599003|260925021911599003|10067099003|56012099006|11063799006|3023799007|18002099003|6133799003|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	QUXQM9GuHy7DiMbsGyHulPR8KrxzZt6HD9PKaI2tVF6NllaI6LaVZIAP/SH9PbO4zjFWtu6cHCz4cWxZ5qnCOhuwB+MeaN/Q5w3hHzqbd2/qLhK4ZS64gttfxJmqrs64mj/fy2H9tEowfE/1qHKH4K/BS7A01d8R5MjQfyjF1rhq6dyIKV3N46zeDj6OuyB8wyjJ8Lq+P6jMIXwLlHUaRXBYIGfodfBlb80xE12qc3ynJ8Z6goQOSobnnS+kSqkL66IXMXQBiGQeBYn+R6NL87AvMV9PcHlxrQFl56R7RNY3ChDbANe60T0gvgPdYgH1pI1pxbOzi274qaz8M1uGdnfO5InCZscafuG03DaMTJi/yK7an+wh8lE6p3YxsvKwuRkq43kIAAdURsuvoe+BrgtZVm0TBgKYyHBlMnvXnBVYE6Et0//S7pvPDvli1wdlb3eZx+CpAmD4ll1zvq6DQK+xxuFEwbRgKFWDnM7qG5GyCOQUnBaE0RFZqBBoXZDz8CSGjWcmHufjsEOyYSBLX3utuMellrznpcDSxu6+wRdBAdolEeV/Lsi/w4Qs/wsLcAtu6KLYi9fYEAnQYI/jQvKwQQJTe3aIIaGwF8DZ7KG29Ik1bif3uzuP9GJm8XxS1HOn35BgkphWVXfL3eip7FahXF5ATCrcE22RGWZO06/Jb0iuh4cpdavINwaaBtpW5WlUMDIzMx0de5O16rnKvOQVLjHzWKjxYtwcGm9TR8E=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB7328.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(23010399003)(366016)(1800799024)(260925021311599003)(260925022911599003)(260925021911599003)(10067099003)(56012099006)(11063799006)(3023799007)(18002099003)(6133799003)(13003099007)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?5dX32mPezs2YlRAk7c/wsBiKat7eyXVUq68TKWYMyA8XUG5G0xp/jd3W4NHv?=
 =?us-ascii?Q?MW7LU3MjKDVi4rrLVoJWAzlwneL4d27sPLmXqmQawJZGDQR3idx7UiC6+K9b?=
 =?us-ascii?Q?AH/tI+G9YMIF6acdnAzHEJCRbKY5PLqEpqb3b3841lH6x2t0TJ1OorpLOyPD?=
 =?us-ascii?Q?IK2N0GT/+jpAEr6aQntmyYjifH1uEy6B007ZpxocV7m+dNpOjbVNY2UdCGP3?=
 =?us-ascii?Q?J9KJx4Zk4ovK+PbfZiekUjumb9Y9CsjU01wgj9BOCL0WwNyinooBfZgkdP2J?=
 =?us-ascii?Q?V4sHUw8IhpcWt+BQukzcNEYZ0HcvljaIb6MJefZbRZKDWV7kRfr5IqRhzU4D?=
 =?us-ascii?Q?XvjxOArFT6kWd0P2pQc/UmFJE8y9nsIh0/AxZ2gm8tVftEUSNLmyY+0gRo/E?=
 =?us-ascii?Q?HtuOspP5r/auCc5UZy1l6c+PmBNqcgQIT6SC5tqR12rYHU3ovLFXOmL4bRoC?=
 =?us-ascii?Q?3E/1erezBHaTCX4AT2Zpav7rKP5nCvu5fAYrpJJNHCnvnEPBidYgrHoCgXc3?=
 =?us-ascii?Q?Vd4vmMNqF8xPOgdSYs/+lpah7DPtIKO+LhyI3/5ebBtWj9DGhbAeNze0shGy?=
 =?us-ascii?Q?qu3CnH/mG8GdpXHkcEYdM68D+hLeXszeV3e2M0UUgfDAGJ96Wy0skzOC/fyb?=
 =?us-ascii?Q?5raJKjfQhTfO0Gx3n5KBhjGEmGITieFbo/A5TPBVav8VAzcMpD5w5vHW42/L?=
 =?us-ascii?Q?OFY9xJ7X8okjn2LPSZ5Ltniym/8PP4Y6qWXOamIMyXKzcZv/i5QA0JGUBYo/?=
 =?us-ascii?Q?LBHo/YXhoUd3sKFpxiziqA5tZl6ZdHNRSj7D0+1CVkzUBW3kDdz9ReHFHRrp?=
 =?us-ascii?Q?2aEFgd6QEGS/75WUKqRu/ru92I63Xi1GcKc103mNiKiFOS26MPfVJNsWMkmq?=
 =?us-ascii?Q?voyvU6lunKz3+b4+EzBenIAwf8+2v3fSod6O4Cm9PaNVvZBVk2Hih61lj2QH?=
 =?us-ascii?Q?4bmnzr2HVAzqISiVSwMhwqM8HJsNKgBdcqGDhoHv2PnhjY4B2Bf1NXviXTUQ?=
 =?us-ascii?Q?wGk+Ms5iBC6rsjoTZvesuvRW6WbXPDLVpMEtpMjQ3t45ezm4VDSITSLw6b7f?=
 =?us-ascii?Q?i3FGpL2rcGS+Nsos0NKnu4jr4jo8bj3Em1qkvCIhplEtbd8OdASRuoHJq6UR?=
 =?us-ascii?Q?8qihg760jfOdCdkYKPTNbgXVNs/qYXIeGJnXRp1ZRUgeoJOeKeopE2Mq/GsR?=
 =?us-ascii?Q?LabVweQtUnwIrubhdEz2vnXj30jYEfMjxgdkJM7sHs0pfs6QukSwv9PeVBax?=
 =?us-ascii?Q?FLI+EHIpe/ZlH3Yh+3CSWNAHGajHOZrWnQJu/k29O9JhNGj3vlFuiyoc+XlF?=
 =?us-ascii?Q?eD0zKsuMQkeqjm6mG7ZSlfqvdQW8hzhVXPN7sBRE82B7rzKZMVrqLhEBurmE?=
 =?us-ascii?Q?EzG8PDy2GiFSuUsgNZARSYVJ02ANoGqaKxh01zn5W7ab7vIBYeTFQr4Uo6i7?=
 =?us-ascii?Q?wDy5it782RUhK19Z68LHpJcRxuDZkWeCD5Ixgon/R24IsgpUgImgr79ch7pf?=
 =?us-ascii?Q?DBSYqGVZfYQmt7EX7EOggzU76I0LfAqOE2GxSgX57RVBsmOwbzDlymu0GR/s?=
 =?us-ascii?Q?Ss5s9veSYm5jVH5U9R4HQ1fHD+YiOsX5DcE9vKNNj/iOQWLDTGtnsddOoEDc?=
 =?us-ascii?Q?6clxmdv+Lh2HBL+gFGHT2vvGC8+lK+KtQEdQLmPqDwIyyRi5nyt3TJgf+BzF?=
 =?us-ascii?Q?253Ju0YAHWCa1P0t7aP+saaC99J/Q98zSGVxxSgxzre/1a/SF6fxkDUV19Ar?=
 =?us-ascii?Q?HzNmCgip86t8wXwffWwQd/SadEMoaEtdXAtMZKWfpDg5dmhsxSes?=
X-Exchange-RoutingPolicyChecked: 
	xI5vBhAKVWZVHIldeMq7t+EEryDNvrXx2kmg1ytp37BmHv4+dQraF/7vcEI9IkdYUWAgJf30NCasCEbHcYkGv1VMsMnBjgd5poKWoPi8cNUj3u/0HSl2os8b13xumLCMYfJJ3jHcRk+EDySgV9GRiEeRuCDArbPl2DE2PCBYscEqRJkN/dpZ7lV3vTEjFXhTkpU0d6L3i1cQnYi9zTSNY+alLXdCJLTJW9U/CJ5prSmH5jl2JzwczkDjOHJvMrFpHmscUsWHHHZBuyWBpxgTa0BESrhF1KEGjFe8gxUSuF2jf15MmyU4l6zvJsesIS2aQ/eqyX6tCxP90P9yWOS22w==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6483d389-8e24-49e0-590c-08df1edf0ea2
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7328.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 10:39:08.6288
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f5222PnNoi6nLVBn76J3+F7bFdNtIANffGZvNoUyTvBlOJD0XQ9/2YoDnsO98Qn+AY2IaOh21ykuJrNcAvJQn+Uhz0Bmv69Q4y/7bDa3Vduj+3gQPbQ6vC3xn9GpxKwY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB514151
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA0MiBTYWx0ZWRfXycFTLe/0kR93
 H3Tfue1EC4AmWnmokcEZW27o7eR8s31jmhOqoOjI4vW61LdgCMGyzAA8HXDcK/o1z9/j4IpYknW
 mFJVui8pjfa/M3DiVlZj7pe0heWJ7WDBfXgUxdVMY4uB3lWUFO68
X-Proofpoint-ORIG-GUID: PPdWoQ5-rnSOfIljuOIBBbQ9I3ysymhF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA0MiBTYWx0ZWRfX+fhNWL2/Emar
 8jGqR92xHUgkHhDz6fxItvH2oLMY2J3chYM5+ikKGFHLKpym33Li6uyu3bvtY+XqoPioFRGH3xH
 ijl1QMQTTUkpGQClUe/xiUkZeekBQOZLUOlajndaWuM0PZrGfbJ94eHgYxCf8Jgqz1nRyY8HRz2
 AIDvlu+NPkcWeGp30QMNCixMrEALJgGXVw3SmzPtTHKWRrz7dYYZRpQMz0rah/tTc0DZEi63LmL
 1AgXnp+VZUCVaJiDJkRuc5rMet6LvvI4jBMyhETPWXsXCrPbrMu9/9zi2rhJtSviHRJ0Qi/Else
 /8IbXpyIH/QbGrce6ZdoH7pXYxV/MTuet0xCNlqSkZqv/5LA81dzz/COXDOhyH4A0NvXqxeTRJj
 qCKx5BvMtw72H1lseQnvDMFknR4Ceaur1mDXJ3Z3/oM+2QkrnHva8Bxc5QYtioh+vlGufSSWrC1
 JZVb6+MUdJzJk+EawZQ==
X-Proofpoint-GUID: PPdWoQ5-rnSOfIljuOIBBbQ9I3ysymhF
X-Authority-Analysis: v=2.4 cv=S5lMU4sP c=1 sm=1 tr=0 ts=6abce6cf cx=c_pps
 a=ughbxRIXrQd+RLe3kEOXVA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=R58iKcSUOldAgGlzARMA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 phishscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300042
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Sep 2026 10:39:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130520

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

The new release adds --ignore-parent and --exact options and fixes
several issues including terminal output sanitization, invalid working
directory handling, and search pattern path separator handling.

Complete changes can be found here:
https://github.com/sharkdp/fd/compare/v10.4.2...v10.5.0

Drop merged patch:
0001-Define-ALIGNOF_MAX_ALIGN_T-for-riscv32.patch
https://github.com/tikv/jemallocator/commit/f4fde3f8f572b804adf15cf4c68b826109f8c36b

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 .../fd-find/fd-find-crates.inc                | 104 ++++++++++--------
 ...fine-ALIGNOF_MAX_ALIGN_T-for-riscv32.patch |  26 -----
 .../{fd-find_10.4.2.bb => fd-find_10.5.0.bb}  |   3 +-
 3 files changed, 57 insertions(+), 76 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/fd-find/fd-find/0001-Define-ALIGNOF_MAX_ALIGN_T-for-riscv32.patch
 rename meta-oe/recipes-extended/fd-find/{fd-find_10.4.2.bb => fd-find_10.5.0.bb} (84%)

diff --git a/meta-oe/recipes-extended/fd-find/fd-find-crates.inc b/meta-oe/recipes-extended/fd-find/fd-find-crates.inc
index 3ee3a3eb44..6c4ec90150 100644
--- a/meta-oe/recipes-extended/fd-find/fd-find-crates.inc
+++ b/meta-oe/recipes-extended/fd-find/fd-find-crates.inc
@@ -3,12 +3,12 @@
 # from Cargo.lock
 SRC_URI += " \
     crate://crates.io/aho-corasick/1.1.4 \
-    crate://crates.io/anstream/0.6.21 \
+    crate://crates.io/anstream/1.0.0 \
     crate://crates.io/anstyle/1.0.13 \
-    crate://crates.io/anstyle-parse/0.2.7 \
+    crate://crates.io/anstyle-parse/1.0.0 \
     crate://crates.io/anstyle-query/1.1.5 \
     crate://crates.io/anstyle-wincon/3.0.11 \
-    crate://crates.io/anyhow/1.0.102 \
+    crate://crates.io/anyhow/1.0.104 \
     crate://crates.io/argmax/0.4.0 \
     crate://crates.io/bitflags/1.3.2 \
     crate://crates.io/bitflags/2.11.0 \
@@ -17,17 +17,20 @@ SRC_URI += " \
     crate://crates.io/cc/1.2.56 \
     crate://crates.io/cfg-if/1.0.4 \
     crate://crates.io/cfg_aliases/0.2.1 \
-    crate://crates.io/clap/4.5.60 \
-    crate://crates.io/clap_builder/4.5.60 \
-    crate://crates.io/clap_complete/4.5.66 \
-    crate://crates.io/clap_derive/4.5.55 \
+    crate://crates.io/clap/4.6.1 \
+    crate://crates.io/clap_builder/4.6.0 \
+    crate://crates.io/clap_complete/4.6.5 \
+    crate://crates.io/clap_derive/4.6.1 \
     crate://crates.io/clap_lex/1.0.0 \
     crate://crates.io/colorchoice/1.0.4 \
-    crate://crates.io/crossbeam-channel/0.5.15 \
+    crate://crates.io/crossbeam-channel/0.5.16 \
     crate://crates.io/crossbeam-deque/0.8.6 \
     crate://crates.io/crossbeam-epoch/0.9.18 \
     crate://crates.io/crossbeam-utils/0.8.21 \
     crate://crates.io/ctrlc/3.5.2 \
+    crate://crates.io/defmt/1.1.0 \
+    crate://crates.io/defmt-macros/1.1.0 \
+    crate://crates.io/defmt-parser/1.0.0 \
     crate://crates.io/diff/0.1.13 \
     crate://crates.io/dispatch2/0.3.1 \
     crate://crates.io/equivalent/1.0.2 \
@@ -35,49 +38,48 @@ SRC_URI += " \
     crate://crates.io/etcetera/0.11.0 \
     crate://crates.io/faccess/0.2.4 \
     crate://crates.io/fastrand/2.3.0 \
-    crate://crates.io/filetime/0.2.27 \
+    crate://crates.io/filetime/0.2.29 \
     crate://crates.io/find-msvc-tools/0.1.9 \
     crate://crates.io/foldhash/0.1.5 \
     crate://crates.io/getrandom/0.4.2 \
-    crate://crates.io/globset/0.4.18 \
+    crate://crates.io/globset/0.4.19 \
     crate://crates.io/hashbrown/0.15.5 \
     crate://crates.io/hashbrown/0.16.1 \
     crate://crates.io/heck/0.5.0 \
     crate://crates.io/id-arena/2.3.0 \
-    crate://crates.io/ignore/0.4.25 \
+    crate://crates.io/ignore/0.4.31 \
     crate://crates.io/indexmap/2.13.0 \
     crate://crates.io/is_terminal_polyfill/1.70.2 \
     crate://crates.io/itoa/1.0.17 \
-    crate://crates.io/jiff/0.2.23 \
-    crate://crates.io/jiff-static/0.2.23 \
+    crate://crates.io/jiff/0.2.29 \
+    crate://crates.io/jiff-static/0.2.29 \
     crate://crates.io/jiff-tzdb/0.1.6 \
     crate://crates.io/jiff-tzdb-platform/0.1.3 \
     crate://crates.io/leb128fmt/0.1.0 \
-    crate://crates.io/libc/0.2.183 \
-    crate://crates.io/libredox/0.1.14 \
+    crate://crates.io/libc/0.2.189 \
     crate://crates.io/linux-raw-sys/0.12.1 \
     crate://crates.io/log/0.4.29 \
     crate://crates.io/lscolors/0.21.0 \
     crate://crates.io/memchr/2.8.0 \
     crate://crates.io/nix/0.30.1 \
-    crate://crates.io/nix/0.31.2 \
-    crate://crates.io/normpath/1.5.0 \
+    crate://crates.io/nix/0.31.3 \
+    crate://crates.io/normpath/1.5.1 \
     crate://crates.io/nu-ansi-term/0.50.3 \
     crate://crates.io/objc2/0.6.4 \
     crate://crates.io/objc2-encode/4.1.0 \
     crate://crates.io/once_cell/1.21.3 \
     crate://crates.io/once_cell_polyfill/1.70.2 \
-    crate://crates.io/plain/0.2.3 \
     crate://crates.io/portable-atomic/1.13.1 \
     crate://crates.io/portable-atomic-util/0.2.5 \
     crate://crates.io/prettyplease/0.2.37 \
+    crate://crates.io/proc-macro-error-attr2/2.0.0 \
+    crate://crates.io/proc-macro-error2/2.0.1 \
     crate://crates.io/proc-macro2/1.0.106 \
     crate://crates.io/quote/1.0.45 \
     crate://crates.io/r-efi/6.0.0 \
-    crate://crates.io/redox_syscall/0.7.3 \
-    crate://crates.io/regex/1.12.3 \
+    crate://crates.io/regex/1.12.4 \
     crate://crates.io/regex-automata/0.4.14 \
-    crate://crates.io/regex-syntax/0.8.10 \
+    crate://crates.io/regex-syntax/0.8.11 \
     crate://crates.io/rustix/1.1.4 \
     crate://crates.io/same-file/1.0.6 \
     crate://crates.io/semver/1.0.27 \
@@ -88,13 +90,15 @@ SRC_URI += " \
     crate://crates.io/shlex/1.3.0 \
     crate://crates.io/strsim/0.11.1 \
     crate://crates.io/syn/2.0.117 \
-    crate://crates.io/tempfile/3.26.0 \
+    crate://crates.io/tempfile/3.27.0 \
     crate://crates.io/terminal_size/0.4.3 \
     crate://crates.io/test-case/3.3.1 \
     crate://crates.io/test-case-core/3.3.1 \
     crate://crates.io/test-case-macros/3.3.1 \
-    crate://crates.io/tikv-jemalloc-sys/0.6.1+5.3.0-1-ge13ca993e8ccb9ba9847cc330696e02839f328f7 \
-    crate://crates.io/tikv-jemallocator/0.6.1 \
+    crate://crates.io/thiserror/2.0.18 \
+    crate://crates.io/thiserror-impl/2.0.18 \
+    crate://crates.io/tikv-jemalloc-sys/0.7.1+5.3.1-0-g81034ce1f1373e37dc865038e1bc8eeecf559ce8 \
+    crate://crates.io/tikv-jemallocator/0.7.0 \
     crate://crates.io/unicode-ident/1.0.24 \
     crate://crates.io/unicode-xid/0.2.6 \
     crate://crates.io/utf8parse/0.2.2 \
@@ -130,12 +134,12 @@ SRC_URI += " \
 "
 
 SRC_URI[aho-corasick-1.1.4.sha256sum] = "ddd31a130427c27518df266943a5308ed92d4b226cc639f5a8f1002816174301"
-SRC_URI[anstream-0.6.21.sha256sum] = "43d5b281e737544384e969a5ccad3f1cdd24b48086a0fc1b2a5262a26b8f4f4a"
+SRC_URI[anstream-1.0.0.sha256sum] = "824a212faf96e9acacdbd09febd34438f8f711fb84e09a8916013cd7815ca28d"
 SRC_URI[anstyle-1.0.13.sha256sum] = "5192cca8006f1fd4f7237516f40fa183bb07f8fbdfedaa0036de5ea9b0b45e78"
-SRC_URI[anstyle-parse-0.2.7.sha256sum] = "4e7644824f0aa2c7b9384579234ef10eb7efb6a0deb83f9630a49594dd9c15c2"
+SRC_URI[anstyle-parse-1.0.0.sha256sum] = "52ce7f38b242319f7cabaa6813055467063ecdc9d355bbb4ce0c68908cd8130e"
 SRC_URI[anstyle-query-1.1.5.sha256sum] = "40c48f72fd53cd289104fc64099abca73db4166ad86ea0b4341abe65af83dadc"
 SRC_URI[anstyle-wincon-3.0.11.sha256sum] = "291e6a250ff86cd4a820112fb8898808a366d8f9f58ce16d1f538353ad55747d"
-SRC_URI[anyhow-1.0.102.sha256sum] = "7f202df86484c868dbad7eaa557ef785d5c66295e41b460ef922eca0723b842c"
+SRC_URI[anyhow-1.0.104.sha256sum] = "330a5ed07fa54e4702c9d6c4174f74427fc0ef6e214bbd677ae50a5099946470"
 SRC_URI[argmax-0.4.0.sha256sum] = "0144c58b55af0133ec3963ce5e4d07aad866e3bbcfdcddbf4590dbd7ad6ff557"
 SRC_URI[bitflags-1.3.2.sha256sum] = "bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a"
 SRC_URI[bitflags-2.11.0.sha256sum] = "843867be96c8daad0d758b57df9392b6d8d271134fce549de6ce169ff98a92af"
@@ -144,17 +148,20 @@ SRC_URI[bstr-1.12.1.sha256sum] = "63044e1ae8e69f3b5a92c736ca6269b8d12fa7efe39bf3
 SRC_URI[cc-1.2.56.sha256sum] = "aebf35691d1bfb0ac386a69bac2fde4dd276fb618cf8bf4f5318fe285e821bb2"
 SRC_URI[cfg-if-1.0.4.sha256sum] = "9330f8b2ff13f34540b44e946ef35111825727b38d33286ef986142615121801"
 SRC_URI[cfg_aliases-0.2.1.sha256sum] = "613afe47fcd5fac7ccf1db93babcb082c5994d996f20b8b159f2ad1658eb5724"
-SRC_URI[clap-4.5.60.sha256sum] = "2797f34da339ce31042b27d23607e051786132987f595b02ba4f6a6dffb7030a"
-SRC_URI[clap_builder-4.5.60.sha256sum] = "24a241312cea5059b13574bb9b3861cabf758b879c15190b37b6d6fd63ab6876"
-SRC_URI[clap_complete-4.5.66.sha256sum] = "c757a3b7e39161a4e56f9365141ada2a6c915a8622c408ab6bb4b5d047371031"
-SRC_URI[clap_derive-4.5.55.sha256sum] = "a92793da1a46a5f2a02a6f4c46c6496b28c43638adea8306fcb0caa1634f24e5"
+SRC_URI[clap-4.6.1.sha256sum] = "1ddb117e43bbf7dacf0a4190fef4d345b9bad68dfc649cb349e7d17d28428e51"
+SRC_URI[clap_builder-4.6.0.sha256sum] = "714a53001bf66416adb0e2ef5ac857140e7dc3a0c48fb28b2f10762fc4b5069f"
+SRC_URI[clap_complete-4.6.5.sha256sum] = "e0a7a9bfdb35811f9e59832f0f05975114d2251b415fb534108e6f34060fd772"
+SRC_URI[clap_derive-4.6.1.sha256sum] = "f2ce8604710f6733aa641a2b3731eaa1e8b3d9973d5e3565da11800813f997a9"
 SRC_URI[clap_lex-1.0.0.sha256sum] = "3a822ea5bc7590f9d40f1ba12c0dc3c2760f3482c6984db1573ad11031420831"
 SRC_URI[colorchoice-1.0.4.sha256sum] = "b05b61dc5112cbb17e4b6cd61790d9845d13888356391624cbe7e41efeac1e75"
-SRC_URI[crossbeam-channel-0.5.15.sha256sum] = "82b8f8f868b36967f9606790d1903570de9ceaf870a7bf9fbbd3016d636a2cb2"
+SRC_URI[crossbeam-channel-0.5.16.sha256sum] = "d85363c37faeca707aef026efa9f3b34d077bce547e48f770770625c6013679e"
 SRC_URI[crossbeam-deque-0.8.6.sha256sum] = "9dd111b7b7f7d55b72c0a6ae361660ee5853c9af73f70c3c2ef6858b950e2e51"
 SRC_URI[crossbeam-epoch-0.9.18.sha256sum] = "5b82ac4a3c2ca9c3460964f020e1402edd5753411d7737aa39c3714ad1b5420e"
 SRC_URI[crossbeam-utils-0.8.21.sha256sum] = "d0a5c400df2834b80a4c3327b3aad3a4c4cd4de0629063962b03235697506a28"
 SRC_URI[ctrlc-3.5.2.sha256sum] = "e0b1fab2ae45819af2d0731d60f2afe17227ebb1a1538a236da84c93e9a60162"
+SRC_URI[defmt-1.1.0.sha256sum] = "a6e524506490a1953d237cb87b1cfc1e46f88c18f10a22dfe0f507dc6bfc7f7f"
+SRC_URI[defmt-macros-1.1.0.sha256sum] = "f0a27770e9c8f719a79d8b638281f4d828f77d8fd61e0bd94451b9b85e576a0b"
+SRC_URI[defmt-parser-1.0.0.sha256sum] = "10d60334b3b2e7c9d91ef8150abfb6fa4c1c39ebbcf4a81c2e346aad939fee3e"
 SRC_URI[diff-0.1.13.sha256sum] = "56254986775e3233ffa9c4d7d3faaf6d36a2c09d30b20687e9f88bc8bafc16c8"
 SRC_URI[dispatch2-0.3.1.sha256sum] = "1e0e367e4e7da84520dedcac1901e4da967309406d1e51017ae1abfb97adbd38"
 SRC_URI[equivalent-1.0.2.sha256sum] = "877a4ace8713b0bcf2a4e7eec82529c029f1d0619886d18145fea96c3ffe5c0f"
@@ -162,49 +169,48 @@ SRC_URI[errno-0.3.14.sha256sum] = "39cab71617ae0d63f51a36d69f866391735b51691dbda
 SRC_URI[etcetera-0.11.0.sha256sum] = "de48cc4d1c1d97a20fd819def54b890cadde72ed3ad0c614822a0a433361be96"
 SRC_URI[faccess-0.2.4.sha256sum] = "59ae66425802d6a903e268ae1a08b8c38ba143520f227a205edf4e9c7e3e26d5"
 SRC_URI[fastrand-2.3.0.sha256sum] = "37909eebbb50d72f9059c3b6d82c0463f2ff062c9e95845c43a6c9c0355411be"
-SRC_URI[filetime-0.2.27.sha256sum] = "f98844151eee8917efc50bd9e8318cb963ae8b297431495d3f758616ea5c57db"
+SRC_URI[filetime-0.2.29.sha256sum] = "5c287a33c7f0a620c38e641e7f60827713987b3c0f26e8ddc9462cc69cf75759"
 SRC_URI[find-msvc-tools-0.1.9.sha256sum] = "5baebc0774151f905a1a2cc41989300b1e6fbb29aff0ceffa1064fdd3088d582"
 SRC_URI[foldhash-0.1.5.sha256sum] = "d9c4f5dac5e15c24eb999c26181a6ca40b39fe946cbe4c263c7209467bc83af2"
 SRC_URI[getrandom-0.4.2.sha256sum] = "0de51e6874e94e7bf76d726fc5d13ba782deca734ff60d5bb2fb2607c7406555"
-SRC_URI[globset-0.4.18.sha256sum] = "52dfc19153a48bde0cbd630453615c8151bce3a5adfac7a0aebfbf0a1e1f57e3"
+SRC_URI[globset-0.4.19.sha256sum] = "e47d37d2ae4464254884b60ab7071be2b876a9c35b696bd018ddcc76847309cd"
 SRC_URI[hashbrown-0.15.5.sha256sum] = "9229cfe53dfd69f0609a49f65461bd93001ea1ef889cd5529dd176593f5338a1"
 SRC_URI[hashbrown-0.16.1.sha256sum] = "841d1cc9bed7f9236f321df977030373f4a4163ae1a7dbfe1a51a2c1a51d9100"
 SRC_URI[heck-0.5.0.sha256sum] = "2304e00983f87ffb38b55b444b5e3b60a884b5d30c0fca7d82fe33449bbe55ea"
 SRC_URI[id-arena-2.3.0.sha256sum] = "3d3067d79b975e8844ca9eb072e16b31c3c1c36928edf9c6789548c524d0d954"
-SRC_URI[ignore-0.4.25.sha256sum] = "d3d782a365a015e0f5c04902246139249abf769125006fbe7649e2ee88169b4a"
+SRC_URI[ignore-0.4.31.sha256sum] = "7f8a7b8211e695a1d0cd91cace480d4d0bd57667ab10277cc412c5f7f4884f83"
 SRC_URI[indexmap-2.13.0.sha256sum] = "7714e70437a7dc3ac8eb7e6f8df75fd8eb422675fc7678aff7364301092b1017"
 SRC_URI[is_terminal_polyfill-1.70.2.sha256sum] = "a6cb138bb79a146c1bd460005623e142ef0181e3d0219cb493e02f7d08a35695"
 SRC_URI[itoa-1.0.17.sha256sum] = "92ecc6618181def0457392ccd0ee51198e065e016d1d527a7ac1b6dc7c1f09d2"
-SRC_URI[jiff-0.2.23.sha256sum] = "1a3546dc96b6d42c5f24902af9e2538e82e39ad350b0c766eb3fbf2d8f3d8359"
-SRC_URI[jiff-static-0.2.23.sha256sum] = "2a8c8b344124222efd714b73bb41f8b5120b27a7cc1c75593a6ff768d9d05aa4"
+SRC_URI[jiff-0.2.29.sha256sum] = "34f877a98676d2fb664698d74cc6a51ce6c484ce8c770f05d0108ec9090aeb46"
+SRC_URI[jiff-static-0.2.29.sha256sum] = "0666b5ab5ecaca213fc2a85b8c0083d9004e84ee2d5f9a7e0017aaf50986f25f"
 SRC_URI[jiff-tzdb-0.1.6.sha256sum] = "c900ef84826f1338a557697dc8fc601df9ca9af4ac137c7fb61d4c6f2dfd3076"
 SRC_URI[jiff-tzdb-platform-0.1.3.sha256sum] = "875a5a69ac2bab1a891711cf5eccbec1ce0341ea805560dcd90b7a2e925132e8"
 SRC_URI[leb128fmt-0.1.0.sha256sum] = "09edd9e8b54e49e587e4f6295a7d29c3ea94d469cb40ab8ca70b288248a81db2"
-SRC_URI[libc-0.2.183.sha256sum] = "b5b646652bf6661599e1da8901b3b9522896f01e736bad5f723fe7a3a27f899d"
-SRC_URI[libredox-0.1.14.sha256sum] = "1744e39d1d6a9948f4f388969627434e31128196de472883b39f148769bfe30a"
+SRC_URI[libc-0.2.189.sha256sum] = "3eaf3ede3fee6db1a4c2ee091bf8a8b4dccdc6d17f656fb07896ee72867612f2"
 SRC_URI[linux-raw-sys-0.12.1.sha256sum] = "32a66949e030da00e8c7d4434b251670a91556f4144941d37452769c25d58a53"
 SRC_URI[log-0.4.29.sha256sum] = "5e5032e24019045c762d3c0f28f5b6b8bbf38563a65908389bf7978758920897"
 SRC_URI[lscolors-0.21.0.sha256sum] = "d60e266dfb1426eb2d24792602e041131fdc0236bb7007abc0e589acafd60929"
 SRC_URI[memchr-2.8.0.sha256sum] = "f8ca58f447f06ed17d5fc4043ce1b10dd205e060fb3ce5b979b8ed8e59ff3f79"
 SRC_URI[nix-0.30.1.sha256sum] = "74523f3a35e05aba87a1d978330aef40f67b0304ac79c1c00b294c9830543db6"
-SRC_URI[nix-0.31.2.sha256sum] = "5d6d0705320c1e6ba1d912b5e37cf18071b6c2e9b7fa8215a1e8a7651966f5d3"
-SRC_URI[normpath-1.5.0.sha256sum] = "bf23ab2b905654b4cb177e30b629937b3868311d4e1cba859f899c041046e69b"
+SRC_URI[nix-0.31.3.sha256sum] = "cf20d2fde8ff38632c426f1165ed7436270b44f199fc55284c38276f9db47c3d"
+SRC_URI[normpath-1.5.1.sha256sum] = "b9985ef7269fa99f3b12437bb698381da2428743ab90f20393f399fa14cab21a"
 SRC_URI[nu-ansi-term-0.50.3.sha256sum] = "7957b9740744892f114936ab4a57b3f487491bbeafaf8083688b16841a4240e5"
 SRC_URI[objc2-0.6.4.sha256sum] = "3a12a8ed07aefc768292f076dc3ac8c48f3781c8f2d5851dd3d98950e8c5a89f"
 SRC_URI[objc2-encode-4.1.0.sha256sum] = "ef25abbcd74fb2609453eb695bd2f860d389e457f67dc17cafc8b8cbc89d0c33"
 SRC_URI[once_cell-1.21.3.sha256sum] = "42f5e15c9953c5e4ccceeb2e7382a716482c34515315f7b03532b8b4e8393d2d"
 SRC_URI[once_cell_polyfill-1.70.2.sha256sum] = "384b8ab6d37215f3c5301a95a4accb5d64aa607f1fcb26a11b5303878451b4fe"
-SRC_URI[plain-0.2.3.sha256sum] = "b4596b6d070b27117e987119b4dac604f3c58cfb0b191112e24771b2faeac1a6"
 SRC_URI[portable-atomic-1.13.1.sha256sum] = "c33a9471896f1c69cecef8d20cbe2f7accd12527ce60845ff44c153bb2a21b49"
 SRC_URI[portable-atomic-util-0.2.5.sha256sum] = "7a9db96d7fa8782dd8c15ce32ffe8680bbd1e978a43bf51a34d39483540495f5"
 SRC_URI[prettyplease-0.2.37.sha256sum] = "479ca8adacdd7ce8f1fb39ce9ecccbfe93a3f1344b3d0d97f20bc0196208f62b"
+SRC_URI[proc-macro-error-attr2-2.0.0.sha256sum] = "96de42df36bb9bba5542fe9f1a054b8cc87e172759a1868aa05c1f3acc89dfc5"
+SRC_URI[proc-macro-error2-2.0.1.sha256sum] = "11ec05c52be0a07b08061f7dd003e7d7092e0472bc731b4af7bb1ef876109802"
 SRC_URI[proc-macro2-1.0.106.sha256sum] = "8fd00f0bb2e90d81d1044c2b32617f68fcb9fa3bb7640c23e9c748e53fb30934"
 SRC_URI[quote-1.0.45.sha256sum] = "41f2619966050689382d2b44f664f4bc593e129785a36d6ee376ddf37259b924"
 SRC_URI[r-efi-6.0.0.sha256sum] = "f8dcc9c7d52a811697d2151c701e0d08956f92b0e24136cf4cf27b57a6a0d9bf"
-SRC_URI[redox_syscall-0.7.3.sha256sum] = "6ce70a74e890531977d37e532c34d45e9055d2409ed08ddba14529471ed0be16"
-SRC_URI[regex-1.12.3.sha256sum] = "e10754a14b9137dd7b1e3e5b0493cc9171fdd105e0ab477f51b72e7f3ac0e276"
+SRC_URI[regex-1.12.4.sha256sum] = "f1292b7759ae1cb9ec195452d1390a074f0cd8541ab7a5a8c31cd6db45d4a6ba"
 SRC_URI[regex-automata-0.4.14.sha256sum] = "6e1dd4122fc1595e8162618945476892eefca7b88c52820e74af6262213cae8f"
-SRC_URI[regex-syntax-0.8.10.sha256sum] = "dc897dd8d9e8bd1ed8cdad82b5966c3e0ecae09fb1907d58efaa013543185d0a"
+SRC_URI[regex-syntax-0.8.11.sha256sum] = "d6f6ff9a378485b298a5286656da665ba74413d36db0979633275d2e708145d4"
 SRC_URI[rustix-1.1.4.sha256sum] = "b6fe4565b9518b83ef4f91bb47ce29620ca828bd32cb7e408f0062e9930ba190"
 SRC_URI[same-file-1.0.6.sha256sum] = "93fc1dc3aaa9bfed95e02e6eadabb4baf7e3078b0bd1b4d7b6b0b68378900502"
 SRC_URI[semver-1.0.27.sha256sum] = "d767eb0aabc880b29956c35734170f26ed551a859dbd361d140cdbeca61ab1e2"
@@ -215,13 +221,15 @@ SRC_URI[serde_json-1.0.149.sha256sum] = "83fc039473c5595ace860d8c4fafa220ff474b3
 SRC_URI[shlex-1.3.0.sha256sum] = "0fda2ff0d084019ba4d7c6f371c95d8fd75ce3524c3cb8fb653a3023f6323e64"
 SRC_URI[strsim-0.11.1.sha256sum] = "7da8b5736845d9f2fcb837ea5d9e2628564b3b043a70948a3f0b778838c5fb4f"
 SRC_URI[syn-2.0.117.sha256sum] = "e665b8803e7b1d2a727f4023456bbbbe74da67099c585258af0ad9c5013b9b99"
-SRC_URI[tempfile-3.26.0.sha256sum] = "82a72c767771b47409d2345987fda8628641887d5466101319899796367354a0"
+SRC_URI[tempfile-3.27.0.sha256sum] = "32497e9a4c7b38532efcdebeef879707aa9f794296a4f0244f6f69e9bc8574bd"
 SRC_URI[terminal_size-0.4.3.sha256sum] = "60b8cb979cb11c32ce1603f8137b22262a9d131aaa5c37b5678025f22b8becd0"
 SRC_URI[test-case-3.3.1.sha256sum] = "eb2550dd13afcd286853192af8601920d959b14c401fcece38071d53bf0768a8"
 SRC_URI[test-case-core-3.3.1.sha256sum] = "adcb7fd841cd518e279be3d5a3eb0636409487998a4aff22f3de87b81e88384f"
 SRC_URI[test-case-macros-3.3.1.sha256sum] = "5c89e72a01ed4c579669add59014b9a524d609c0c88c6a585ce37485879f6ffb"
-SRC_URI[tikv-jemalloc-sys-0.6.1+5.3.0-1-ge13ca993e8ccb9ba9847cc330696e02839f328f7.sha256sum] = "cd8aa5b2ab86a2cefa406d889139c162cbb230092f7d1d7cbc1716405d852a3b"
-SRC_URI[tikv-jemallocator-0.6.1.sha256sum] = "0359b4327f954e0567e69fb191cf1436617748813819c94b8cd4a431422d053a"
+SRC_URI[thiserror-2.0.18.sha256sum] = "4288b5bcbc7920c07a1149a35cf9590a2aa808e0bc1eafaade0b80947865fbc4"
+SRC_URI[thiserror-impl-2.0.18.sha256sum] = "ebc4ee7f67670e9b64d05fa4253e753e016c6c95ff35b89b7941d6b856dec1d5"
+SRC_URI[tikv-jemalloc-sys-0.7.1+5.3.1-0-g81034ce1f1373e37dc865038e1bc8eeecf559ce8.sha256sum] = "1a2825c78386b4ae0314074867860ba9577875de945f05992c38815cbec327f0"
+SRC_URI[tikv-jemallocator-0.7.0.sha256sum] = "249f09e49ab1609436f34c776e84231bead18d6a955f119f939bdc1d847561bd"
 SRC_URI[unicode-ident-1.0.24.sha256sum] = "e6e4313cd5fcd3dad5cafa179702e2b244f760991f45397d14d4ebf38247da75"
 SRC_URI[unicode-xid-0.2.6.sha256sum] = "ebc1c04c71510c7f702b52b7c350734c9ff1295c464a03335b00bb84fc54f853"
 SRC_URI[utf8parse-0.2.2.sha256sum] = "06abde3611657adf66d383f00b093d7faecc7fa57071cce2578660c9f1010821"
diff --git a/meta-oe/recipes-extended/fd-find/fd-find/0001-Define-ALIGNOF_MAX_ALIGN_T-for-riscv32.patch b/meta-oe/recipes-extended/fd-find/fd-find/0001-Define-ALIGNOF_MAX_ALIGN_T-for-riscv32.patch
deleted file mode 100644
index db191d8250..0000000000
--- a/meta-oe/recipes-extended/fd-find/fd-find/0001-Define-ALIGNOF_MAX_ALIGN_T-for-riscv32.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 7582be50050b36e3275f6d4eacd8eceada8b6afd Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 10 Dec 2025 11:58:21 -0800
-Subject: [PATCH] Define ALIGNOF_MAX_ALIGN_T for riscv32
-
-Long double is 16byte aligned on both rv32 and rv64
-
-Upstream-Status: Backport [https://github.com/tikv/jemallocator/commit/f4fde3f8f572b804adf15cf4c68b826109f8c36b]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/lib.rs | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/lib.rs b/src/lib.rs
-index 165660e..5f6a2a0 100644
---- a/src/lib.rs
-+++ b/src/lib.rs
-@@ -51,6 +51,7 @@ const ALIGNOF_MAX_ALIGN_T: usize = 8;
-     target_arch = "powerpc64",
-     target_arch = "loongarch64",
-     target_arch = "mips64",
-+    target_arch = "riscv32",
-     target_arch = "riscv64",
-     target_arch = "s390x",
-     target_arch = "sparc64"
diff --git a/meta-oe/recipes-extended/fd-find/fd-find_10.4.2.bb b/meta-oe/recipes-extended/fd-find/fd-find_10.5.0.bb
similarity index 84%
rename from meta-oe/recipes-extended/fd-find/fd-find_10.4.2.bb
rename to meta-oe/recipes-extended/fd-find/fd-find_10.5.0.bb
index 408f97f490..134e5763aa 100644
--- a/meta-oe/recipes-extended/fd-find/fd-find_10.4.2.bb
+++ b/meta-oe/recipes-extended/fd-find/fd-find_10.5.0.bb
@@ -12,8 +12,7 @@ LIC_FILES_CHKSUM = " \
 "
 
 SRC_URI = "crate://crates.io/fd-find/${PV};name=fd-find"
-SRC_URI += "file://0001-Define-ALIGNOF_MAX_ALIGN_T-for-riscv32.patch;patchdir=../tikv-jemallocator-0.6.1"
-SRC_URI[fd-find.sha256sum] = "b95ed7d1f53e0446a7d47715801f6bee95f816c4aa33e25b5d89a2734ab00436"
+SRC_URI[fd-find.sha256sum] = "f35becce49c551724fd26d9824ec01d6578868cecbcc4e3d060658f9f8ad1e4d"
 S = "${CARGO_VENDORING_DIRECTORY}/fd-find-${PV}"
 
 inherit cargo cargo-update-recipe-crates
-- 
2.49.0


