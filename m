Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BED35CD13D3
	for <webhook@archiver.kernel.org>; Wed, 12 Nov 2025 13:44:36 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13523.1762955070859956220
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Nov 2025 05:44:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=CV8pOE5T;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3411d85ce0=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AC16kLT1293390
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 05:44:30 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=P9WfuBSxNV8Jz7IOexRKnvd7hPppsbsTx4H9fPFUy8M=; b=CV8pOE5TC7ar
	f6mO84Bmn0dq2HqSMOPYxLqGImwWRtwqW/MhKzdI7RYLoz6pCxD3fCrfPNyTVbip
	oaihw6JtU8Luf0/vEAE3R9wN8LugNvNPIUuO0nipTXTRhMCW8W9rh2tyVbmlnRIB
	UO3KQ+xgjDb0ymW2qvyO6J8GlhVnnZhURDT45P4pbUxh+B9FOPfDL7pREcBVNtYj
	Rw2xEIC8NUcOS7c47FbO0OMqPJjuaAtSVk9Gp6Po939h5J3v4A+EVuF1+jLxCdyC
	TCQP5vo9r2ooDIUHoTiAGFVhJpSaGXbHztUzFlX7vX+Pu4gg0MXd0tiviCAQojT3
	xwg2LLMCcA==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011071.outbound.protection.outlook.com [40.107.208.71])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aa2135463-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 05:44:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uCQzlb1lg6Q029tmOJ10sclPIQTkbojtJOocCa/22IkDrGMsmyMRfGfJ/THRCdsfyBGpD03clZQyrjpAa3Oi2ZW6FwJfMIlDb/Uq3+7qpgJyzrdbf7IiuqmWCHyx7MGvuPMsZF1FtCK4n+96pBpCjypklnLYRbEZCYUBpsN4TvJ8o25O1x+Wr+CZJaObGJqdZxBXPRvlKj6q/XkghTY7C4fpogEwpt2M8Hpn7mBS5y6yVgFzd62+xLyFY0+2uh6X+lvVKSN1lqQsp3rf/qDP5kp/hzeXSO8oV+38YKWXrXfbptoJP5QYny8ia2Wf0alAktvBxlLkJWZwUeVlvJRRkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P9WfuBSxNV8Jz7IOexRKnvd7hPppsbsTx4H9fPFUy8M=;
 b=iE//fE7cQuCqyyRfL9/qbcsN0ZfUtX+BPyzH8mVsi960LlIjYUUhbVSxsa5iWdm7yd3sLvensEtoNmhHhMMUBWmesB+6iDR3pEIZD/UnN9jFEqdcpi0gSZaPgtQmeZJuPUThc7oy4+18Gb/X7gLUxok7Pf7WRutwyu9MunZYzG4yLdx0eRsfWcNxXB94vEG1ekfrgMFoMhAmdaEMFRF1Pr1gqmLMu+8GF2otPA+uOuJMrdtZ1zFKE5ZuLt4p3oUC8oRZJWbw4Ycq0HYcn/2I1nItQxpaVUTB+8M0Qvl8pAA+1mPBepXGIspJEQZ8sUMhOhmtEuvM1DX1JPXPn7PAtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 DS4PPFABF58482A.namprd11.prod.outlook.com (2603:10b6:f:fc02::45) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Wed, 12 Nov
 2025 13:44:29 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 13:44:29 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 06/19] fuse3: update UPSTREAM_CHECK_REGEX
Date: Wed, 12 Nov 2025 21:43:52 +0800
Message-Id: <20251112134405.3706508-6-yi.zhao@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: dfd29f73-bb57-4f46-d6da-08de21f19a15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?d3VODHZIQZaWJegO7iYy0nMen729L+nH9G2dNBzPsllvLpI/k5L4ca+K8o7P?=
 =?us-ascii?Q?n5Fhs1DRcc7EieCbUQ7u7W7R0Sn7seSi2BdJ7qArE/hnr7t/1b/gNvcfdNDd?=
 =?us-ascii?Q?cnn8GGdrIuelZU4canX95gLGZS1TTcYZpOhszGY3UaLjYDDRzldFA9nO/m+A?=
 =?us-ascii?Q?TNe6YMJMGOnraVxm3QvyOsbSlfg4IbjSyQAaUSqq3XhYqImGyrye8TguVzdr?=
 =?us-ascii?Q?BiBorv4v7skNytAv7xv0zzVRZoCpFqgYsqxBhIfEd3a2bcujXrSkDYHVSW31?=
 =?us-ascii?Q?M9qyWPcQ6FmgpM/b9YCoci4pedFFVl6fELLiWd8WvHM2idjxX00sD2UA1uGk?=
 =?us-ascii?Q?efqYLHg2mwGeLOahKXgTE6Kwe50pQ9z5cX+NAv7fjVx1lnAddik6PL7HIEDM?=
 =?us-ascii?Q?dsAG1esXkuAexoNcvSce06gwInuWAZ8++nKLy4PBRAQdKuqDCuVcGx4V4w/S?=
 =?us-ascii?Q?7praCDk/UYi8KKUAG/g+5eLxtpJMm1CkpiXq2NYSUJJMiASFIrry4bHFVpsC?=
 =?us-ascii?Q?rnW/ijo/svGeA8qS47FFwMtBbjtEYHg7zOQFZklYirUB5p8YGbw40Ctm++jt?=
 =?us-ascii?Q?uLZ5n7E5aGZ1f1odJU6tEw6HrK4BdK3+5tBy2kHZ9UpgVYx9ApMK1P5hWVq1?=
 =?us-ascii?Q?Wp/WNoLxMAkogWMVkucwkJjz/EkTYZvRkZYtKIMaAV7sqAVf6TFCvjpDzQdB?=
 =?us-ascii?Q?0pd/kzJ9CST6VD3JHXDIYYoHtS11HNCLOtzXsxnpFLFZTAi6o9Fueb0M8j1U?=
 =?us-ascii?Q?VeQl2Mq09YcdMpbB+DCvq0wH4puW7W5LLc8u4A6TDiv9d792Gc9ltU5fiuOO?=
 =?us-ascii?Q?/TjVvkINdZcmDzCI/j+W+0e8emsIcGZjR57i9SDfy8kAgV8OF9eltGOJCYvW?=
 =?us-ascii?Q?CLm1P3DZhhTstIeZvlcdW+bft+CLfUYBHKrkuTfGYPk05zc9aRGDq5XFjzwx?=
 =?us-ascii?Q?Jt2jS0ew9Vc2pjxDBRczIg4SHLqxWTzOVPpDwNlXUYpJSgbw5AKibWNg/DH3?=
 =?us-ascii?Q?4HeuqNTT3pnYwZBBwelGjgpnWAzgFxlb08MYcD1YqBiX2iH7XDPSHNfOrR/A?=
 =?us-ascii?Q?QD5ItlbtJKrPpA7ck9WsTHCSvBo4HQzUeI8peWdqfm13hrZTsO1SkXmll/pK?=
 =?us-ascii?Q?f9NkJgrec8Ln6T7PhZCdpgwgtsmlyeEXQjcDL9QaXFRufsVi5AwXUMksWJEt?=
 =?us-ascii?Q?OmSqhcV7ElSl2ogERaV0zPaNO3InuirhMcxn1ocT/ILIzFxNF77KqkvXKyKz?=
 =?us-ascii?Q?o+wmqyo7mK0Xlz3U97fli6ogd027QKWMIvXKxChkdoMHxHtKn5dd3r9NCw3D?=
 =?us-ascii?Q?Og32fOGltoWCDChaT4PuWUxNuU23tWE/8dulusgcSZcqLm4Xem51Ulk5Xkr3?=
 =?us-ascii?Q?x7EEtl7IPu++DEuU6FLQo589a2TvouBMlbrRjQ8XDyOhSDR9aTKSq0jvO+oZ?=
 =?us-ascii?Q?H58I9T1UtYDOaWGIgxP0jBDH76okZfEI/8IkSpvvqfQONRYCZWJTiQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Sp6DkHk80NZS7hV61fNgUMzJGt6UXvftuK2OKVJjuNU+SrgncDdlhVrKfI63?=
 =?us-ascii?Q?DtTrzb/rsTpo57bwbZ7TBiy0P4K4xBPR2EvXAXeIvzEy+6D+2JwuEhT9arWu?=
 =?us-ascii?Q?yI2r91VRgVxlspzhya2R0cCMYvtlHGiyoKpbLshKGQk/jo+8dTFiOrP6C8uB?=
 =?us-ascii?Q?AFtQG21ixNyNZGztlm5CdvKdRgn5vOTh/iYYfyTkdUxyUjL8742xIaPkLni3?=
 =?us-ascii?Q?w/YvZngAomq/NV3Xbk6iFUU3CgXqtFn0SYJvxNRFIc1aRpg53631Yj+Yc7e5?=
 =?us-ascii?Q?0JstY/+1p0s2wpqn3hfrOCXN8Mu+P3ZWId/3mKGdHdXfhaD6ZUbzSv8PcpRw?=
 =?us-ascii?Q?giwA7eCsjxCAbHCRnIoBfuhYfupViq5oU39p/2ODxmt/87bfJKSuYgqOZgYW?=
 =?us-ascii?Q?6scZyyKX9CxZBSnSSAt5UCHfzJXu8Aafh+KBbMd9cYjaWxhiDEKc+MiReMmP?=
 =?us-ascii?Q?LtIkZN1ilfOrulceSyRVmM0fOyEPsEVbwsX+gZibCn7omGlg/ARTAf6MDPwH?=
 =?us-ascii?Q?a9UJlyMlYQPTgQZULC1npbxkT9vS9jFO0aSnGsrMqh4AMjeEnriPCK5bw1q7?=
 =?us-ascii?Q?vAhMBNylRoQgLpXp8SJ2j7Pj72DFfVXWTJbXv+dIBt+97Uiv1RDLvmrdBox2?=
 =?us-ascii?Q?osShUMhC6EmRmK5fAX0FMhdpi1bqKRQWCNIS9Hhc6/sdxb3lDK0nQ6DuqRR8?=
 =?us-ascii?Q?cKUNFXWsVpK89snBbWPmWHFFZ7nsoL4sxCFt9nKsieCMD/i6/NHMlZjRL5Gh?=
 =?us-ascii?Q?0tluyoOb4YOgwuc/kBB+WhZCysYi5sfh81njlFwOmSBHwpy/9cv8UQbh90mp?=
 =?us-ascii?Q?pYQQWdjCGQF1TE0TrVF6b94p2vHvZ19ubP4ZK+RWq9Evzd49SasnZ7+A+OHd?=
 =?us-ascii?Q?SS3PX9II1iLK65YjZ/wqsckNzylo0+9rvF+Ec5AxYH/W5JnnqO1c5z6fLtWq?=
 =?us-ascii?Q?wFlqxCPjAlBdO9lfnVwexqBOxb8jozIS8KQ559hZ6QD99nNVJPlZuzbIDajS?=
 =?us-ascii?Q?Hh9tcLIJkNiCglYwmMrDQu+XIzLN0cO46uQjD4cLxz7Hun+XGaxy1ne6fCZh?=
 =?us-ascii?Q?UBnOQRECVMnKZ0RheZjOhP7OqerrjRoWCpx9jmTOdC293e5yR7IJZABjYci+?=
 =?us-ascii?Q?wbfACgs1BrR1oQa0uWhSesALPzLnnyK7W3CoTFcTigmE9ETCzMCD4TLN2iQD?=
 =?us-ascii?Q?ZHgQPOBZALkHvVQZWvee366Cd+M/jX7aHnrf1BOZCKOaMw4ZEjkrTTrqIPDS?=
 =?us-ascii?Q?0DoE0tiUpeZW+OYqs2/pq7ZMAkBlwE3WZur0gVtT43bIEcVUn4PugxitEVvN?=
 =?us-ascii?Q?4cOrIUpP6tWnhAFy/+7Ecdw/OQUqRZdtHTEIYkjMuu7MF+G9UScNt3j0NAaS?=
 =?us-ascii?Q?6lG6NCxaEIQ3h6oFbtvM7Fvj3NTspTCjgLr3qv855RPkXcdBcR79kpAE08le?=
 =?us-ascii?Q?CNNCQuX/jeh8pYfZXCtR71Ero3pPZLXHNGz2R+xO4ir2p3qSY07Wwz/FTZTS?=
 =?us-ascii?Q?qzg1ss89HFmIY632dejYvblQWwGS7SkBEngBQNEEMic+VkiLRzNhNc3bEHDN?=
 =?us-ascii?Q?uqniSBOFGgL5V7aI4Dgl3Qt++5EzvC6iqa19x/K0?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfd29f73-bb57-4f46-d6da-08de21f19a15
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 13:44:29.2580
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rD3ZgeFuja4yzbPppL1qT4qg83WiXJCor7ct36oL9yPVgyKx1MxHxTNPFOztGPzfs3oqBsaL7ztT0Ndcwb9PgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFABF58482A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDExMSBTYWx0ZWRfXxheIp7oo2N97
 yNVHCZnV8dWRDaE4BaLpB3Qyd80DqV4/4brtafN6YOxTuDArWHH67aaUVvphTpDQFaFdBWLX0Js
 L30VoRUb9s+hJbdLNkketgjReB62Amz/kB4kL3F1RTyZmlomWkqkVMaBjwnLRDo6l3o4eS+TUSn
 XgLOpNKe18m/OuDQTJqDm9GJz/An8NC13xk3xEk2ANP36/hsA3q4p13yhvGK2SAtRBBFFkZv/o2
 jynm+ztuMbd6XnsOfOBiYyI5056mEDq0Wj3FMw0wXiu+d0zAhr+XBve58t3ouVNYe+EFl3YSagZ
 wdHO+4M2zG8yYKC3ebkRPSUrFLXjbeVj1D1iFt/IZbk1Dd4NUsHkw4ebbzoL7FPI9+LvYRNGIYJ
 OEyyLqVxztyaA6dT5yDO0xHTJhDoxw==
X-Proofpoint-ORIG-GUID: 0PWEsNVLfd5MOwV06RsChyPmRVNpFrzH
X-Authority-Analysis: v=2.4 cv=XPA9iAhE c=1 sm=1 tr=0 ts=69148f3e cx=c_pps
 a=cgmL7KMsZDthlzKGM6UXqw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=P3XRhbmdhk6NW3V72WUA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 0PWEsNVLfd5MOwV06RsChyPmRVNpFrzH
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
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 13:44:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121535

Update UPSTREAM_CHECK_REGEX to check the correct latest stable verison.

Before the patch:
$ devtool latest-version fuse3
INFO: Current version: 3.16.2
INFO: Latest version:

After the patch:
$ devtool latest-version fuse3
INFO: Current version: 3.16.2
INFO: Latest version: 3.17.4

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-oe/recipes-support/fuse/fuse3_3.16.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/fuse/fuse3_3.16.2.bb b/meta-oe/recipes-support/fuse/fuse3_3.16.2.bb
index 5333c25a9c..1c91a1aa17 100644
--- a/meta-oe/recipes-support/fuse/fuse3_3.16.2.bb
+++ b/meta-oe/recipes-support/fuse/fuse3_3.16.2.bb
@@ -19,7 +19,7 @@ SRC_URI[sha256sum] = "f797055d9296b275e981f5f62d4e32e089614fc253d1ef2985851025b8
 S = "${UNPACKDIR}/fuse-${PV}"
 
 UPSTREAM_CHECK_URI = "https://github.com/libfuse/libfuse/releases"
-UPSTREAM_CHECK_REGEX = "fuse\-(?P<pver>3(\.\d+)+).tar.xz"
+UPSTREAM_CHECK_REGEX = "releases/tag/fuse-(?P<pver>\d+(\.\d+)+)"
 
 CVE_PRODUCT = "fuse_project:fuse"
 
-- 
2.34.1


