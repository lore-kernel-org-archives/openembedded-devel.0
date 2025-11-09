Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 210A8CD13D2
	for <webhook@archiver.kernel.org>; Sun,  9 Nov 2025 13:41:06 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24799.1762695663103855350
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 09 Nov 2025 05:41:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=f4vWUxA3;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3408a6cb6d=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A9DQqXQ3085644
	for <openembedded-devel@lists.openembedded.org>; Sun, 9 Nov 2025 05:41:02 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=0IX2D85z/C7pblsQVmvODAf1/WSC0MolkDvvJZOXts4=; b=f4vWUxA3x0Ji
	3uTU84Y/FdtDIdLDSMIQ+fQLMibIqKvQgqQ7LEFYZQAjCELlfaASyQkMdfYcCNV6
	QO/IQ2UQcd6d09WLHDIPkPn4o2BEp5lXubkX4ZwGqdKzRO12d+RQdl3nTJlfdy8x
	YOLdu6OWglIIXcIXkDM1CS3m5+xvRUhsve6K8L9ispKeQlUnblaljVCine9ugR2E
	Yq3UqCS42FEbOPfYHKPgnjAwHxzpRI60HZ1fLuY0xEww/laYDu67Zx+rJnL46Dn9
	BmnvFnKEDrAmevRjjGJQ2KXDN8rnar49eA+qGCAnz40/ifSLBZ6xThFxtr12eLfO
	ItlDgl9+Iw==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012069.outbound.protection.outlook.com [52.101.48.69])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aa68jgnxk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 09 Nov 2025 05:41:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bkNKv66CqiH9XEal534sy/Velx5vs6UVHYED4o6HrD54R5x9aQCw7J8UBFlkvwBCC7Zk62XLiMGz+w/ZEz9hwvbjYHIC1TUrezR5NwTKgolihm0JPU2H31ZQhFiPRgE8HJGX46dttmJUSPJPtcySDsZGhxOKv+JSVksCfIk1IDmCMesIVj39sxlNoO27NNPYeWgigs4xrdLVPDbV7tWwb0CH3L77EQGCKC+ESPPPD0c0COXGWx4mOw5TVARzbOJ7YxaohzsHQEcwpfI1GgYsmiv398/FliS8/awkDeE3fvFMQbft7eDNJOG/g+UjeNv0LJefm3OtEZtDo0v7DipxFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0IX2D85z/C7pblsQVmvODAf1/WSC0MolkDvvJZOXts4=;
 b=lbUXiQQY1YNu3wIxN0SXWYZS/4XKY8L1b7yWOd80Eg6qeY8HUKhkTvtHB/dX+Z+zXPYb3/18RhyeNKjtKk1kIC1jduGvVZDUFYrtivVKgTeQ0HzSYtl+kMfJBFbWGLXeeoce1Sgxh2TFmdxO6ZyrcHm5eA4XjgtN32IGhomQ9h+zhXlLq3/babm3ou8y8EX0CJrMggQBLJrnleVVF9cjvDI+fcvtw8UUq5Ji2A8MI4crpfLF+oOeGUVgKzl3H30chzkRsMkt9ALpi5PrdmcIZ5CeEmyyHlSeKecP+cI80dFpgNCU6jYNy7UPMXqrj541yGI0VGkc69TasHsLReVDlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 LV2PR11MB5999.namprd11.prod.outlook.com (2603:10b6:408:17d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.15; Sun, 9 Nov
 2025 13:41:01 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.9298.015; Sun, 9 Nov 2025
 13:41:01 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 8/8] tunctl: inherit sourceforge-releases class
Date: Sun,  9 Nov 2025 21:40:35 +0800
Message-Id: <20251109134035.2741548-8-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251109134035.2741548-1-yi.zhao@windriver.com>
References: <20251109134035.2741548-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0173.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::29) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|LV2PR11MB5999:EE_
X-MS-Office365-Filtering-Correlation-Id: a1703d5d-4dd1-41de-4ff1-08de1f959ebe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?na95Cn/n00aCvpY8X1rMlZpEBlz2tEPOnqGvc1m+Uz7oCeY68r+3FQ1ss4WE?=
 =?us-ascii?Q?ONHb2o1JDbI4t+p30i4nOzBX5alT7NzKx+v6aE6vfKi29DCrIDSqEiI1DUgL?=
 =?us-ascii?Q?YlJ06lOQev4QEjAPweXkPNerqVQfjKCI4od9KlFEiAekXNi29NkUAIVhyLEi?=
 =?us-ascii?Q?2okp8RzuTXw1JQS9TuF+nziQRWKnNnQQoR43xLRs+ubgqe6KpxMY2gUCQjgD?=
 =?us-ascii?Q?N8ks3T+g8wUnfmOcIhMrvh/+OTihnRhF8duqpKrtKPW21un47bloceWpVzVW?=
 =?us-ascii?Q?oXMkk7GFADA/JgWYTTsA2aHyQj1pGsv3bsImyv680X4FkUh+21XV0TBtl2oZ?=
 =?us-ascii?Q?x0y+2dev1iaR/lqc57ub/2nbcicsEZlZ5EP3Q5T+nc+PcHAr7BMcuxTWdZYO?=
 =?us-ascii?Q?OpPZGpxm6G08SfeltkfS0q6U6UP49EEgFfwTv71isF+XofzYMrru/goEecV7?=
 =?us-ascii?Q?i51SIRAWS80N3drUznNhXxqU/orWsDLJPv66cuOwqa1Mlqb1R0NluMYI4dPh?=
 =?us-ascii?Q?Uk2ur72eKH7fkH5zWfo1behec8u19dnKO38GoEfGd5LU+dJfMff5ZGQqn6/b?=
 =?us-ascii?Q?X8F98IcdJCkp5rpmpEsF1WZeD5LvmZNHL15761XJ6WLXD52yyWobc4WGt6jb?=
 =?us-ascii?Q?BrAddcw1OSFtxamVoQNTI1a2pmy01FuojT4ELSkJdxAaALwGuC6CEvpYrPvX?=
 =?us-ascii?Q?u2vpYT2bfIFYPKAeAmJNBGnkC9T4AQUx+55oyqJSl1wtcR9gU4d/Eu9f5FPu?=
 =?us-ascii?Q?U3h+VbLpUgVVLSOJ5Q5/c1rhNf/JlERKIxo1cF4jPZF7hM7UzAa98MW013z7?=
 =?us-ascii?Q?ezaX/JTR1G+Gu6tChVWvp4UCX8NcSEGvtRgxr5tq3GMxWDCpmArzyi/Qy2H3?=
 =?us-ascii?Q?T63D8SzHa+DheG0awneUEGXrL15fZ4qz3HGdE7f+bk+cB6NIu3wc4nuW6Fy4?=
 =?us-ascii?Q?F3XKreKoNHRUm+O96vKVKdtVmfDEPtE2DveBOAazDchAitNSS7mgFVSS7pM1?=
 =?us-ascii?Q?RDXwSqY/h9zamGKwPyCbMmMvE/bTPlkQIKqHTCocX+rQzM8g21KlaRjDxiXu?=
 =?us-ascii?Q?znAyaCTvPNqoDqADYiqJdkyzyf02KJi6PTuVm/W56x2xrOFqLGRhrLkzkuWg?=
 =?us-ascii?Q?To7/RzC9gWlKrwUZc6ON5bQbWuHnYCozjZH03DqMJGC/gBvxvgr1fXGPztrl?=
 =?us-ascii?Q?kSoOvY682CWtDRmMqY4i4O64rRceUBIXwhduWgQFUYzSt0MAMF9h2YbHj+mQ?=
 =?us-ascii?Q?6gqIlBY9gLBOaB87SDzvo8pDgV/OBICjN3+svjLR2+bmptY1BfsnRlmvySu+?=
 =?us-ascii?Q?dNi1HsOhrXX8ymapuC7kQcMuqXwz0Edk0ca3F8huBY3o638F5IuXnA7XyD7+?=
 =?us-ascii?Q?42++1I4+X/tfTbhLCwtvbUTA2EvZkSyDo1g8bDmP0MdC421+MPCwF7W60THF?=
 =?us-ascii?Q?nDFnGTBj2RSKrgtlk4jToc6JDMwpuZKpYU26MTdvwXXUPDckD6BaVSMI2Que?=
 =?us-ascii?Q?oCGG/nUW2qkx7lzC+VCV66uGT+STNImO2QyL?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?vqyQZ+60q+qkQOPj6X7JBNSA/HISeFxpkD1SXf1Ji1wgNRWSWG1D8vyq+xjg?=
 =?us-ascii?Q?MTbcnvUe6y4PZpHY2JHtuyUeGm32y+b+C/kI7sCMyRBoHawCTpWB819HcQKs?=
 =?us-ascii?Q?h05vVNMWHxC0bWqO0mVRX6HmrSvYMkEdKn00zKlt41YvgvMpu1PnNWNc6CHo?=
 =?us-ascii?Q?GjexwbTKX+ekSHDQIzY5yWXVZO89gfCsfHJloLXqbMrtTskdZ/d/YkR8M96B?=
 =?us-ascii?Q?Bri4L0V7h/z+1Ae9egF4PmCyU8E3t4QUQoTgBg/Kdsg7jcCnlu7jds615Fw7?=
 =?us-ascii?Q?fJ1LHrUG/ghVdzjT0lfgFxAoA4c4Iidb9YWUQLxbj+SjaLkKhxPsax6JBAeG?=
 =?us-ascii?Q?NSidLj7uDAvt4TfgrNtg0bWtA5wQg48sxHXnb9GuF3hhrecqOH6snrHPwF9j?=
 =?us-ascii?Q?T0jnXWPwSpPrO+Ns45m3BLhEOlyROWfsYciMz31XDhQqSDSVqquqwrsAONH1?=
 =?us-ascii?Q?L95KsAAyl1/hHj88FoPjG/P9nZ7L+Y9B5MARfI7WSb5l48N3hD/SP9HN0WSu?=
 =?us-ascii?Q?6PRZUcY8vUhMO9qprR6eOrB8wLG+Lwlpct4XvccnXGLpGxOl+1ND2gPNwU/a?=
 =?us-ascii?Q?JJs9/GgfwfK4qncOJressQE5xK0tdQPUXtA3gXMRdrnRYz70CAQ6CW2g7ejJ?=
 =?us-ascii?Q?fcGdaG6+yaTUULfAT8NhsK/2DCWchUr+YQ8dFLrnvGMvpiS3gw6ME5awUavQ?=
 =?us-ascii?Q?ysR+FJBeemGNjjVftPru2Wf2kiHeuRJ32AVdU++smpFKmSL5wdiuToYbEH5X?=
 =?us-ascii?Q?9nCXmLycGA6ICzr2cayn2n6kGixsFkS8G9cV2S3I8vxXf2rLZM4ujAJQuETz?=
 =?us-ascii?Q?oOM1pOq/4zhe/BsQYbRPd6xviE3oDbZcsNtezo2fx0aR0SKjCtysbvxt4P9J?=
 =?us-ascii?Q?dBJrtTMvUn4OZWo6NvmlELtjxX1NrtoxbSbSawxCrmWq0AB7f9MuSyeyyCy6?=
 =?us-ascii?Q?VHAWOxh2PPIt/Hgb7OBcYv2gwCzHu3lS4KdP/jodXawIdyo7pMUE8etn9My0?=
 =?us-ascii?Q?e4oZ97iEykTJ+pJQ/LYppSrjglZ7fDBqkk51F/eszd3AlOEhPAv2QmL7gc8b?=
 =?us-ascii?Q?WIE5fT0FN8WW9n/RHDdh+dAT1KEhPIHTQBCoQ99SZSRHp7I3GhSPHWYoV0M0?=
 =?us-ascii?Q?uUdlKz1m6g6VXg63bZZ2mHcgxxyCf40zxcAIRd+Poy5zEiusWAT4QrbLF8JY?=
 =?us-ascii?Q?zWthBUSPREIUYUFcSFhem3KcVBPhdrmFpJ6TcyHnTNNIXM6fu/PYOpjgcjKS?=
 =?us-ascii?Q?8HcT2ux/DN29Qyc1vLSaNu8crlcYhbmF61vn/FR6kkMugD/WzAlDxNexLkDD?=
 =?us-ascii?Q?4yxWDSz7i6r4mLUJxtlwyJImjatgs/chlAloYGF9DO+YCgEt3fQ4bs3Gz3wP?=
 =?us-ascii?Q?il7ijIGNheXV1q9qbgAPFns73Xbzm2JTDcFhFZpYThyQHcbFXeMtnw6wEyhg?=
 =?us-ascii?Q?RZAyC9E1GL4L0jh9AsBT4+nK/XG21XJOcfrwPctJaLvaajUFTwP8cQnWI66K?=
 =?us-ascii?Q?hsRtq+9dwBHUbSKcOUvgiJpJMesohrw5OstKlPb1tWuzf1N/lfXXrLEMjv8M?=
 =?us-ascii?Q?KJ4dxclemBN6OUp6x8QjBssCCfYKagUzHRsgxg1Z?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1703d5d-4dd1-41de-4ff1-08de1f959ebe
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2025 13:41:01.0112
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wN4qHhDoL7TzJF4Al7+tSy/tMZpMLVrStbjDMIMXXiP36u2Mp6hjrhZlDFwjfmn0CnilTNaGxc1TZ1zoKAiC9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB5999
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA5MDEyMSBTYWx0ZWRfXxj7leVGI6HA9
 AUZe6pCOkirJMqbKME66eVXhIDed1jrcFcmAUpcz1R9zzwFSWJfPr02ANZy57S582h1cB0+l1OG
 NhVz0OB4ZtOyw3b2em65HWRgAXJAIO6vpY6lsIr+dyhrKx324zCX45K7K9xtcIFrZASUJAjPIws
 Z89Lffrx6SSXuo/47+BFOZ27xl4PolbuHpfa5MX1JGG5js4FsFtUYC0r3FW2D8xUu2N9YsJI3+B
 CzGcuOTvP3aQ6AxrgRZVSaBD4D/FdZwAjjpcvL6vzMtGwzVqR+5zBWISk8DgkBJuKQWGXwW/A2n
 0gtb9TwqQPP/bgOugpxNYsOQp8+3ySY5M1cxKTH1BsBMWMmrOIhrAtRn9MsbB2wGeltseHkh/z2
 2Jl113TgFeEgHV/U5rppNBGaQlHI3A==
X-Proofpoint-GUID: xsoYgHRrCFtT0bcahdZOiraYbjwIOJeh
X-Proofpoint-ORIG-GUID: xsoYgHRrCFtT0bcahdZOiraYbjwIOJeh
X-Authority-Analysis: v=2.4 cv=ef0wvrEH c=1 sm=1 tr=0 ts=691099ee cx=c_pps
 a=fm8IUWXzr0h7QqFIpCBYEQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=uQKLEWH0rvJv3wXi5p8A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-09_06,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511090121
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 09 Nov 2025 13:41:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121414

Inherit sourceforge-releases class to check the correct latest stable
verison.

Before the patch:
$ devtool latest-version tunctl
INFO: Current version: 1.5
INFO: Latest version:

After the patch:
$ devtool latest-version tunctl
INFO: Current version: 1.5
INFO: Latest version: 1.5

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-networking/recipes-support/tunctl/tunctl.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-support/tunctl/tunctl.inc b/meta-networking/recipes-support/tunctl/tunctl.inc
index 07e6dc217d..5b759d32b6 100644
--- a/meta-networking/recipes-support/tunctl/tunctl.inc
+++ b/meta-networking/recipes-support/tunctl/tunctl.inc
@@ -7,6 +7,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/tunctl/tunctl-${PV}.tar.gz \
            file://makefile-add-ldflags.patch \
           "
 
+inherit sourceforge-releases
+
 do_compile() {
     oe_runmake tunctl
 }
-- 
2.34.1


