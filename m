Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AFDBCCD193
	for <webhook@archiver.kernel.org>; Wed, 15 Oct 2025 12:33:53 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.15400.1760531629879499067
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Oct 2025 05:33:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=oUtSGPS3;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2383f062e7=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59F4KgAa1035161
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Oct 2025 12:33:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=Xcj5Rhv3uPKzf6KEi6nSLZS38ZB256W4ZYDiDkE+0I0=; b=oUtSGPS3NgJL
	Lxn/kwKlT22844a009n5FZ60GIRqn8qdbGYLAfCh+HSTWca0peWaZ/c7Tphh24NJ
	eJXr7G+hPDlBR2qOJzPR2dnQ0UYfXjNh9YJFJh7ajKHuKK+XBOVP8PeVUYfILmEk
	msQlc7Siem0BCRa02dA235V5n9SPEU7h1RNB5HNdaQ4atVL/bz575Q9yt9pvs+O+
	bckNSL5FfLJFiDQA3c5rWgRwLsIjQWUK78JWwnu65GMgHKbCK6n9RsfyKt324qN2
	T57wkUNOmwBDXRiZYeNPxWUzlIRuPU0eqftUfc6GsJPosbaZC5iR2EPfeZtbbP64
	QLcjxWZAaw==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011041.outbound.protection.outlook.com [52.101.62.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49sthh9cp6-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Oct 2025 12:33:48 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SkNQ7aOVNODmFvk4NL6rBIJjzFSEJ6bW62UH8Oxk6B5I/yUxN6mxwDnChfhUUNy1XWxcIUnTMxEDUcL0HcRp8eTYr4JZvGIROKxbL/W37mBwBFPVuHeKoqQuSuyiQe/5pK1gBm44ptekr3SvyQbDmAowKcjl3igkHwGGM1EgeFtHJC8w6bx3zWFDvPR7mOQSUPev5HWr0MO3ajBENnyUc2Ckuf0QiDgLMIkbmmlcsVKeriDs//btT9ESvy+DUcWLOEc1xoFjQdpixVK6o/8FAxy3PxtVMwvzUr6CiyBj/WG1zqmHwJdQzXNIDSwa8bsY5fGogGl6Ox/tNk76LlvPfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xcj5Rhv3uPKzf6KEi6nSLZS38ZB256W4ZYDiDkE+0I0=;
 b=uQxBFfEBjuROH7Pe3XoGKwvIsB4+i99PxWZyHCJoKUkJo+FJD6vDKvHbkq63nQSaLpbsjNbULQ9aPmEi+TAkj+N+gdAq9PNF5cgNf9YE+ZeaLzawPDDcQGdIFE6UJg5wWrQB4NJPMVlDGldRydVN+lk2qcnDupKK04LvG0E2ey6JeAF6vONbKd7GdcCrH4kLgDQsA2CdbHXSo+pLGLKM5HAUGcr+gVbUFWjY0ZMOfXjKEfzplWmv95zW4y254bks286RrBPquvnGfFRal8wSbr4YAubnjNkerQbFgJ4kBsndDkerGNuNCzso9vkTFuVuS9cqsuCBovzQdylkz2QZQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 PH8PR11MB8258.namprd11.prod.outlook.com (2603:10b6:510:1c1::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.10; Wed, 15 Oct 2025 12:33:46 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.9228.009; Wed, 15 Oct 2025
 12:33:46 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 2/2] samba: upgrade 4.19.8 -> 4.19.9
Date: Wed, 15 Oct 2025 20:33:24 +0800
Message-Id: <20251015123324.732190-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251015123324.732190-1-yi.zhao@windriver.com>
References: <20251015123324.732190-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0178.jpnprd01.prod.outlook.com
 (2603:1096:400:2b2::19) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|PH8PR11MB8258:EE_
X-MS-Office365-Filtering-Correlation-Id: f9778367-79d8-4690-a91e-08de0be71554
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?cSPHNweMUgNEeUyxX0MXwlGC9Atuz2XXo3KYJHK5o3wngxJlipsu3LY/B4ca?=
 =?us-ascii?Q?o5qSJXETRtmnulIjPIZCEqGvleZRVOH7HOts+pTcbjYcyalRIodPI4vNis1t?=
 =?us-ascii?Q?enTvSDENQsZUpkDTXsZtJVcigfyINIOmJsvDntd6tCHQqy1DqKualVqKLSTk?=
 =?us-ascii?Q?8EqazxG5wIP/Po7CJGnQNc3to3d8JA8KfXFoZbRDuyQGeagcQuneIBIT/ZJc?=
 =?us-ascii?Q?4iO6RNhyf0L325l5GGKnlBHuaxk7aDx9DXyJrpXndR71NWmLqU8Ai1bvjZvg?=
 =?us-ascii?Q?OTM1Bo/l8F097z0R57Bh4WOfyCbdd7zXtXqfysP4e0yYkhLKf32+AozXD0La?=
 =?us-ascii?Q?HiUTdH29fYxFYfcOH+KFaIbtNfuTGUYvWBMYy8G9C2iiswyytukV7y+KRV7S?=
 =?us-ascii?Q?Ae2duWSWiqlaa31a9hVmkeV3276Jsy/hgjFX6DToAm9XOWkBnay6C64sprBR?=
 =?us-ascii?Q?ufljPA437SIyz3uBx9wek6zchl3Rop+d4OYcwtI8U3h01bRk38oTM+z/MUpV?=
 =?us-ascii?Q?tI2z/g9ITV4KgpshUWCCJZoHGF/EGpoTSnZEkOOKcAqz9f2tX38kRxSGwsBe?=
 =?us-ascii?Q?d+ImhQspwAua47OgQrpCYvbn36MrckykJ5xvs3nNjnbB+SCZmsW58+5/stQT?=
 =?us-ascii?Q?m5GIcNKC/AJkx4MJkdRj4tsHvV4yAPclwFAwH8evXPCSmGRPrBjl5Q4QgzPi?=
 =?us-ascii?Q?MqIjZFVFoi5eSTYAZXibzduyhq7vqCNnbRjt1uf8swF4LxVn+O1h6l4uBtux?=
 =?us-ascii?Q?+RrajkZsyByMl73zsreyA7gZ76myYNZ0BxTfK29sI4oPj6EDC3s0odXjPLT3?=
 =?us-ascii?Q?/CmBodk+9kynfLbV/gi35K6txp2SIZ9gltiOviQntKmrWtl8+sgMLnDzwwMW?=
 =?us-ascii?Q?gduYtPB0yaCk85VExL4ytqZXERqWwb8eECUjkdYCDVAXw6lFeu3/dWs6Nxyf?=
 =?us-ascii?Q?tNzYTLgT4fE+o2TV5MuOpliUC4hGFU1SeQT7YkSRsnTRZHR99Ov4k1MfCbpo?=
 =?us-ascii?Q?lzsrApikJtdLQQC+gNG+5eDXN3R347KLDtWtby7C77m0kS7wE9D6LxBby2c4?=
 =?us-ascii?Q?F0JL3Wp0hSXFesmYB0WkJyQfjglMwldJrXjrAzA58h70YrAIxg38caHi3q2N?=
 =?us-ascii?Q?OaE3wXjNBtH/JS++xcbTi5sTr5J92WRrq3R8ZJurvD74tFWDQ69T9XCEj9ZM?=
 =?us-ascii?Q?TQgtzlARUjkg3NZGC1sIaJum+7RdLm57vmKEYsUNJT3xiP+OyrUYzXS/qZ6c?=
 =?us-ascii?Q?Lpf7/mbe2Fkdx6PVCvZ7mkAk3PCqqWIkqWVP6S+SmD67xGHqgVyRHdq0Bo51?=
 =?us-ascii?Q?QYCN4sDoEZA9dYqwP+4+wmqb4PUk2K+WSFZhlTdcV2O2G3610DhtDE3m3VFD?=
 =?us-ascii?Q?LyvoP+KFt/7AXQQYD87exjOV67geh56sdMOtN9hBwjCaDCk+w6roT+HEvlSF?=
 =?us-ascii?Q?nvg+0Sye01Tr1RPepqjvrzkDKskvC9YQCsj1TQD+VtBjJMDYnViE/QgxU0+f?=
 =?us-ascii?Q?U44qTm8rphA0YLc5GNMxiUHgoBZVDQV+s/UO?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?6mfqDTDZAbhVq0D9emOdsKsqbUsn65x7YRpnQ5MGz5r23/9eta3Q7qmJgFMf?=
 =?us-ascii?Q?PwZR+F7f+uMiqe3xnOJDLt4NwSyRJsDOyWRJZLynNRzi7wNLJXYbBWJUzOm/?=
 =?us-ascii?Q?C4RPEUW7ZcL7acAH/aiDAxrQf08Z8DrAWWUKBrXGHTUAr+D716+uHo3uN1mf?=
 =?us-ascii?Q?WzS7yIp75F85rHSC94lBPNCKa9hLNrMHj9XtGh8HoZDAUQTPgA+wj57ZhrQx?=
 =?us-ascii?Q?ZZO0Mtr5+ce3dna+pJZrbiA4hQ51tiRC+LBH+dB1+95BXaaZI0AZgxdfzI98?=
 =?us-ascii?Q?P4HM//XGIFPOfqyMsVvCvPtKciZSeblhTT0TVXu+wLD//lDwNn67N0PoUpQz?=
 =?us-ascii?Q?RKM8xqMzUXnIx8B92ZAXHoRV78DMM81b1VGvHI4I7GKaR+fXS2gfWtlY+Lts?=
 =?us-ascii?Q?Aqtl1cclMt0L1qX5d/7AAVQRC034v1FYCKx5ZAs6SjrlXnNbUnoQTpmTJJMe?=
 =?us-ascii?Q?H/Ovcs43XgPKbK/vwH9up8YcoUQeA/5HjcJUPUKHDFICYgi+plvcH3h/ek5B?=
 =?us-ascii?Q?RVBMqFpJ/70Qd6BGAl2UWK6EQMJ7PtwxqFxiLgkVqbNKKet3E6fU3ue0VEB4?=
 =?us-ascii?Q?9+qI6MXqazPGEa+foH0aRxCT5SSjeIdbkfNnfv+2etGEk2E8qbZ4yW3QY31p?=
 =?us-ascii?Q?kI+cyx4G3WnuhgXITzKHgdj8LjET9psQmTqNgAvzqR1O0q1706qX2gWeAiOJ?=
 =?us-ascii?Q?LbowSv+62X4r/EA6Bycn6c25HbKAXQqAQDZ16srrIuFhy/dTcr5iRd5GY0ZU?=
 =?us-ascii?Q?3x5VgmfCMYCGqdXdPW1CjUsbAVG/18KA4EGdnEtqFPwAmPDXWjpboQm3PfiZ?=
 =?us-ascii?Q?yoF10gA71y5vTRvl+PDjbN3+KIb50qhpTbl9UdJ/mPIeXNL/wuB7VnFfV1TT?=
 =?us-ascii?Q?yUf/o0ipiYNflus9U6mUlLF8Hgj84RKacV3ksQg56U9NdjfbwFftFlhodQ5m?=
 =?us-ascii?Q?4cP3uz84SawKWdiyMtnLESiEairR9nnyebJ6PRLV9/GKdJy/i4yR3Bj44bNt?=
 =?us-ascii?Q?u/VZjxVAyxd1U/wUxyiUd6ui62VW6a4AwxY9VBPcOMQNjc8PD3H3cgD4cin4?=
 =?us-ascii?Q?jItyHrdTetvFFc3XnY/Jv1/NrpvY1yOqrBZsIKKfhl1hFUqoIOh7J04F5EkC?=
 =?us-ascii?Q?9vI/xNy3vOVh7val5AMN7gf19LQDxs+/B0VQFi0/1R6B7wUYT/x6QHxzyMWj?=
 =?us-ascii?Q?fgI6iiVQKPlTyDok03LZOMXdsh1xgWBNqzDcMlOnOEETkRho2GTIiL7qS0KT?=
 =?us-ascii?Q?Nrh4szBrAyg7299gY+CcvfcjnPiaAMwIG138XsIDpOD3KxS/rISwxoaDrf/Q?=
 =?us-ascii?Q?4efs0gLvSdG0YNajUUHUmOe0sloQMewd51Esc2gZmtYZWIRxLSoL6yQyhg6q?=
 =?us-ascii?Q?jA5kUsxNFfx3T9v2JAMNQRz1AInpiq7Rc/ukQcshViOOEu5lb+1n/KbQeKGB?=
 =?us-ascii?Q?eP2fx0FC/2tuCi3b4csYj1/8+Hdgct/VpiRZJGf04EX3Uc2TV5MaRFjx605b?=
 =?us-ascii?Q?0ENUG4lqID65zuzcu49rqf0BMVMgEEt1xzjg1LVKx4Lwnz8ILDLt2w6zR9kn?=
 =?us-ascii?Q?IziIa8FXrnacXJZmh4iSuqfdc9XPSHvLFHtyqrzE?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9778367-79d8-4690-a91e-08de0be71554
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 12:33:45.9391
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2Yu7JsB3s38gwvK8sVvq6pIFTV8yVkLsSc/2CuenHrWNI5qWXl5LH4OZlWZ/MYWydPegt6YWKBxhd6WqLEPsWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8258
X-Proofpoint-GUID: eiqe_8s_OLt0OcKOQLTBDOgMJBZ49lxI
X-Proofpoint-ORIG-GUID: eiqe_8s_OLt0OcKOQLTBDOgMJBZ49lxI
X-Authority-Analysis: v=2.4 cv=QLBlhwLL c=1 sm=1 tr=0 ts=68ef94ac cx=c_pps
 a=ouBVT1c3MJkzDXWVqRnxag==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=hGzw-44bAAAA:8 a=t7CeM3EgAAAA:8 a=_BdpDLGd75cCORtptugA:9 a=I8LpRMakDdAA:10
 a=KKRhVU5KZ8wA:10 a=HvKuF1_PTVFglORKqfwH:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE1MDA5OCBTYWx0ZWRfX4g3oEr0r78TS
 ems8VBdLcxkSeVFqRIRrMmQ0f1c7P8kz+JxM9UOYsbF0hM6lxdtNSnRrS9DHeNQkIJX1G4Nl5Dz
 ZlssvD7DtBrdfIZSYsKMDnCuOhdWJVsocr9w6RYIcGo/8Aj92EU9J+QyL0QpnRMQeLbzOKtrLv7
 1iTqLD8ot7u3PBwPzYHTVreEZqlS/4976oXAxzVksynn4ghSaozwWWXFq6miNGNPNsgfu1cjHuN
 b5vRAW0le6BS62Z+Axowqd6TBkAvPDTuRSA/N8jFOB3M4JYjv/JDyPk2P/fWS33P2GZbE8bJ51z
 NA0tC2eGE0UcRpgh+1r/ZnQsO/XTk9O6goWH4tEq36OMA0gz67uOWS0nJYGPvgtSN92e4V03//U
 N+8zMhUl5OGvHtRik0iGc3wZHTIhpw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_05,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510150098
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Oct 2025 12:33:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120710

ChangeLog:
https://www.samba.org/samba/history/samba-4.19.9.html

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../samba/{samba_4.19.8.bb => samba_4.19.9.bb}                  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/samba/{samba_4.19.8.bb => samba_4.19.9.bb} (99%)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.19.8.bb b/meta-networking/recipes-connectivity/samba/samba_4.19.9.bb
similarity index 99%
rename from meta-networking/recipes-connectivity/samba/samba_4.19.8.bb
rename to meta-networking/recipes-connectivity/samba/samba_4.19.9.bb
index a0ef63c958..ae88705668 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.19.8.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.19.9.bb
@@ -32,7 +32,7 @@ SRC_URI:append:libc-musl = " \
            file://samba-4.3.9-remove-getpwent_r.patch \
            "
 
-SRC_URI[sha256sum] = "1aeff76c207f383477ce4badebd154691c408d2e15b01b333c85eb775468ddf6"
+SRC_URI[sha256sum] = "71ed406444714c90bb9d36c576d807b67af15449f297e91106d42b3ca2fa5549"
 
 UPSTREAM_CHECK_REGEX = "samba\-(?P<pver>4\.19(\.\d+)+).tar.gz"
 
-- 
2.34.1


