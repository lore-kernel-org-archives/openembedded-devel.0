Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE626CAC5A5
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 10:34:36 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.9405.1758710069720496910
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Sep 2025 03:34:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=HuMcAX/v;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1362e8e79a=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58O9tvf31303017
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 03:34:29 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=L0NYBjd9w
	sYwsR1+Tj1eKoDjBgU+N1J7FU7tBgkPP84=; b=HuMcAX/vPTIM83hRyjYjo4uSZ
	taUxFPNA+1Lt9bVMZnAIY1NYk4uf7oopRpg/vuOKXOUeck8KVvVDfpW/9wYKuNhF
	f0zdIP603jBfCf1Qs2vo5TMUiHbKckf1qlIE51q3u6iiR+eST1jhTipMO5PBXfaa
	llviHMLxeFzd7Ihz8L4XngVaOjhjWXVioQwi7gKDvVAuzTZN98Hmqyk6PN81F1N3
	nIIk7pXTVxBG9ZtjKE4wS92HG1RZ0wl3esezNDpsZTM0YxREi+Y705WXLOO9BA/f
	Xe5ZNknPC+jD+YNsMJN9HSatBQF2FpGG4md13cr/t9lZdZQuCdvY7hbgBZphQ==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012028.outbound.protection.outlook.com [52.101.48.28])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 499qj2vjq2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 24 Sep 2025 03:34:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gi4SZnezdagf6hGbUhXw5a+9Rkbh+JQQCAb1UOYFIr5yGCVt21XDKoxyY2inG7Mfym2VmRY4vI3MRnrfkQzu3wfrir9CcDUNjvQChWLoSh4ujNi8jO7LNUA9ySMG9Q/ypzq+qfrSO5qyw0AHMXRxROFUSUc16Mvp0lzJvDXA3ydvkcLsn0pcR/WoyqGTw24iO+iB322dprjbDcqACZ7FchEYHKW1Iw8b0qIMbq5w+poCUDvn9DhLRnWlMF9c1QzU0kpNI1qxQ+SH7Ja4soTfBEMNdIYQzwCHakZBRS/sJZqfuXrbvk1IBy45CarjnzshxCQTGkm2slfS+l/p/RqPUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L0NYBjd9wsYwsR1+Tj1eKoDjBgU+N1J7FU7tBgkPP84=;
 b=la0oDmxN2EI7823gwY9AcykxwPyLvC3Xdjpv9he/Dlm8zbI/QcX7m0udLy58CLiBAD6d3k3+ufqYRXOdvK5NO1/m1rO+YHw1kMJEt27vD/EGyn9h2/0Oz11vlmu7RyLunTuYja6qrFdm6XARllggGHfav4AW7jWUFEYrG06ar+/RgwAm2NCnRUfSoEqokUp9tsRN85cFha4kw3pL0bEW43HBUZpazi6UbY0Zzdrl0r3dNQieugGeAGuDPN8xpW9go0d1FfE2ulZ5qc79uKxOJeiykgPOPENWMDIYpF1jt664ksxbBW84/wIv8IuFzSOyYAcPewD1FxUAgTmFhYPYtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7901.namprd11.prod.outlook.com (2603:10b6:8:f4::20) by
 IA1PR11MB7869.namprd11.prod.outlook.com (2603:10b6:208:3f6::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.19; Wed, 24 Sep 2025 10:34:25 +0000
Received: from DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::9fa:eb3f:cf26:264d]) by DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::9fa:eb3f:cf26:264d%7]) with mapi id 15.20.9137.018; Wed, 24 Sep 2025
 10:34:25 +0000
From: sunilkumar.dora@windriver.com
To: openembedded-devel@lists.openembedded.org
Cc: skandigraun@gmail.com, Sundeep.Kokkonda@windriver.com, raj.khem@gmail.com
Subject: [meta-oe][walnascar][PATCH] layer.conf: add bpftrace to NON_MULTILIB_RECIPES
Date: Wed, 24 Sep 2025 03:34:06 -0700
Message-ID: <20250924103406.4152290-1-sunilkumar.dora@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0221.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::16) To DS0PR11MB7901.namprd11.prod.outlook.com
 (2603:10b6:8:f4::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7901:EE_|IA1PR11MB7869:EE_
X-MS-Office365-Filtering-Correlation-Id: 27b64e4d-6005-4398-5ed1-08ddfb55ee67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?jgtztYVapmxxciYs74MMtxKBgcdZaKtx3Pew6/hXGoORKDHIBxFkBaFKMqFB?=
 =?us-ascii?Q?kQsfW++Opb7MH6sKi9x4vk1LP54HDsqqeZp5Pqzfu/3IixE+Y0vNp0rS/oOJ?=
 =?us-ascii?Q?L1UB5flSWNS7d8wsh9yKjAkoMztC7WNyjO3u5dNJ9C9ABLv262EtiSRl0hpg?=
 =?us-ascii?Q?1d/ErOMCrR2z6ZhUkPLakn6q1czNul0Ta7ChAx923F879TeJT918NcLhFFxu?=
 =?us-ascii?Q?OGh6JxKVLpnJtrVByWNPlW8vTOBqFdZcAg3Mpeb7tB2f0wAs5pXO1u4jfN0t?=
 =?us-ascii?Q?OT8AKm+jx3imYWub1zV0oWvW2KukaF3E2XtDSsceCOzwVO2IvkRZ/SlQUojX?=
 =?us-ascii?Q?+yaPafmcxN++IjoJUBR/7UN/HTiMzGcbQdrqNqyvAz+MqAIvWdCZzpf2MVRk?=
 =?us-ascii?Q?/5jX8YDSytsGmFRigyPrDPyT3TygkNvQnQLdKMWFRdc1PLe47a9BVjcgEdkG?=
 =?us-ascii?Q?iCbyOCFTDUtkY5dfocg7ZoxeTjFM30mb6qfGCXlZ9rrIujrIVcklvPVL1wHr?=
 =?us-ascii?Q?PWQqPYF6zbqDR3KdGbTFcr7mDLoWMn+Syzkb5FCsQtTfwR6NWJUSpHgK7mnT?=
 =?us-ascii?Q?AN+tQ97fexjzQkr1zl30yX6wH0mdbrRrZ9/auCadbFI5tLxbgHRPFX3jeLK5?=
 =?us-ascii?Q?m4rYZsf8gix9oOf/G7fulQIPssDU+jSJbTfqTSMqZmF/ZzE0zYtUlJEr/Rnr?=
 =?us-ascii?Q?Mrbnh4UhdB99INQAsy6GyO6QkndXu5pQLyMuY84xmjHBkrF0Dj8rj337zjAQ?=
 =?us-ascii?Q?j58UkUpaOUb52cS51BeErYRj3mvjGaHDVwtUwF/UaTLKQ2RqV0S8Az9oet/v?=
 =?us-ascii?Q?+KR0EgM0S094BODda+wzeCalgIhiVkpdv+T6oVPqRiZ0W1ho/1y8klBTC3vO?=
 =?us-ascii?Q?PfrkmXSvit6T8J3wroFlTO6J2QKbqjNhYx5nl40LT6LqRONcNCbj2Xt/HuDm?=
 =?us-ascii?Q?HezC5QBKWTNXhTZ5cpozvZJDMBBx4yjq5CjVNmh+HRU58cxru2VoMahGqecr?=
 =?us-ascii?Q?CJEn2PMQgS+z4lCX9jh+iT9wB84/b7S6uJNJcaQmJg24PxsQI4z3wZqlPmX4?=
 =?us-ascii?Q?j+S3Es1XH9FIgMfi5d1wHt+Ns/TfPDvEynbv+yb1c7gVqn6Py5axsGxocrhU?=
 =?us-ascii?Q?ivOh7m/MqWoykzEBYGazfCnaQSog3P3QNI6gUCnuwDiMAU3D8BNzT4mHRkpU?=
 =?us-ascii?Q?pKHctfrovLP98xBL3WiJIUC22eydxvLuqf6QP4EsJgp5dfexJkGya080N3bJ?=
 =?us-ascii?Q?0p41UBgKRChfEwdYS7KLRnEOmFcvHsKav0EB7+pr6YvZCQ4OB1SiF70eCVPO?=
 =?us-ascii?Q?TBwsyARYEvQ3Ev4HgFubTGVbfidxtuUlV6jXZ7ctDTuJVwERY2mMDiJyOnjx?=
 =?us-ascii?Q?S7wGJAdpwmYlk4RgHdz6iuXTGYycRXl57wlpR7zxkoxTXc8KjC78O0gc1+Pn?=
 =?us-ascii?Q?4I/8XLKVGzSbv9+Kjh7n1Kd+me93ASghbFSfjOK1a8v0EbNAMyF8Bw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7901.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?07xDmoCLxN7uytX/NO9aEaCUo1Z4AYnk5QWpziPkwzp545kIl2bBtnY0DnL7?=
 =?us-ascii?Q?kr81VAKxYnA6xe7x//5rTxLm1k2Ia3MDZQAVFicp9UyFMj7vqw3zjoOMSPwa?=
 =?us-ascii?Q?5Jg7PdjmLEuAM6c1qz/M4TPPnXDMCSRBVqEjkaxLsOwj/4rcS+K0H9kHzXFX?=
 =?us-ascii?Q?kPoXKf7YvsLk2tn6VNcAMvwyL7FmF8219zkQOpF/0sjFOjhfxKgH4PmApDLG?=
 =?us-ascii?Q?f2/I832n1witcJn/QzpGcFu4DcU9PiMl3kj+Wd+OVBHrWt33P656oDeqGRda?=
 =?us-ascii?Q?bAbguyzRLN1grlvw7IL9yf8pZ1vgO46/yyqMR94/X176jLXxk/Wl1VulTmIq?=
 =?us-ascii?Q?Rm2kcswd3ehnztLNWiYKU5Mkaw6qYUHhQQ6sNae47Tg7ectj/DhYiMxksnWf?=
 =?us-ascii?Q?M+eyWPJVSLrXHhawb/adxStrHkHYjKOkk0zKWc6eRJUY40LcSZwAfEFF+AXQ?=
 =?us-ascii?Q?LTQBq7rt5XX2oJTyF7zeBW4T+5qBZ0qDpKoB6DP0hJcI+bY3/rvQB2OHR5fV?=
 =?us-ascii?Q?eaZ9DdcYgLIz9J2GkI7wPJc/67cRFUigK36xSGRQqH9eYlm7CHeRFf2yx+4A?=
 =?us-ascii?Q?ZJyzihG5AAFJnLXNcXIaGFFLmZLPcp44W0WtdckYlE8hnHmu5/atKjML4GuQ?=
 =?us-ascii?Q?bDB52CXhqvcGzw5K/DDCao12ey5rPpp8ss5UEqBMbjx2aHEE4/L7qY+emgk8?=
 =?us-ascii?Q?W0MnNCVtiI1e+YuqKzEBEmGGalO/LdUXH9X3ZI5yy9RamOxluWe8uGm9I/cO?=
 =?us-ascii?Q?7XiEZfItMXw+mT8sOqa0ZzJ+cWZaJJ72TXkO8MerRLEqY+kMJ3QYqNsvPM9w?=
 =?us-ascii?Q?+BSV1umAswPFi4BsHgFJsSZW9556jeeiOdDEBP0g4iWmiY0Qvw3s/Odtf+tn?=
 =?us-ascii?Q?cAX/97E3ry+COXqwSlUezOt6cuN9CBRaPLHFlcm/5oRDR+q3ZQbEQStvCOjs?=
 =?us-ascii?Q?CKKX5A+/1NqHRlmdfu85D1Nc+CMbbbnoZPp4dRS9Cz2iRwrpwQ5ijNiaZ+BS?=
 =?us-ascii?Q?EdI589MHIOht7fsLyuBD6hKCwggfauuLXsrJBgINZZuctIR7+a2sej/vtTeC?=
 =?us-ascii?Q?9gIlVfk5eWNcl2O4s+aF5DQKYW0emzZNAjnWaTZD0NivAdHqZRzQ0qNrJpNb?=
 =?us-ascii?Q?Oi155VbMBoywqx/Qv0OZDWzLnDy90OVc4CZwws9WVGbaCTrerWEmXNrDE/gk?=
 =?us-ascii?Q?HcUWq9HYiUoMQB/96L/pBV1DfAsE9el2wOHQpzKM3Dx0VFlImePnRvEHr3dy?=
 =?us-ascii?Q?QAoWJwGfcUNhvBYJWkhsaViDfonGmx6283EzbS2yGaQMRnfC+/zyTQqVqR1b?=
 =?us-ascii?Q?zgVF+EIAWKQjlgJ3Dta/Wvbw3ZZjcReML8ir8aIHPb05i6j3ZhQ7OnspmYT4?=
 =?us-ascii?Q?S6C8ubVviJqG3AG9HJT7gPeh7yqWTFz0FqjomMRTWB6CKLGFT/IMtgXV5r/a?=
 =?us-ascii?Q?0LQjBlGINDzX+m1BvN4vcYPp0FSJEkKrG8hwA04WeYT6d81QoXninaQEAD/X?=
 =?us-ascii?Q?infcSewAt930aNMDlY2ZNNdOxWAcg127nCAaGd/5j3O+0dxNIGgj96h7REIb?=
 =?us-ascii?Q?3C/XJr12CTcuo8gLFunwZ1DKSiJ3eOCMiECbfpoip4mMccT3UB/R4uG87dWL?=
 =?us-ascii?Q?rQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27b64e4d-6005-4398-5ed1-08ddfb55ee67
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7901.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 10:34:24.9502
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mSvr3kCx2FN8Gc3AZ/dorWUcQvQl2OKaIinRYipeiMq9Gx+rzrUvEbrSNF6j0icbQzb8LRmv8WfwOoT2wDwDXNKG8403ggNhONBomY+T4l8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7869
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI0MDA5MSBTYWx0ZWRfX+X7krUnirZ8V
 4OenYdp6KuDD6zgBH23UJc51yrEdUaer1ts+PspqQiiD1uKA51Ax3ovt3TOUWd4jKK4Hzx6q0kH
 1tcwaNSKCeA4CAuYp0LLvbMsr60Id8Ro6p5+iQHlSrGnYT5TtPAfJqkGCbGLKBkxOXcTqyhot9o
 hMX9EUSV1bHEbcKex1b82I7gXk2acyu9izM24C91qvNSkKKbKErOrxocf2wrMB29eYOo2FdUle6
 dOoHj7hVHEnrohuBAGircNuMVKQeyrlHpX+M6W0bm02mZPiMr0F1/uAQ7P6pnIID/+RgajYyGi6
 WBB+h8qAXQXkicCkUjQVO3+ogE+fWvVaISoMeUx8SLHdUgn6avpX1Onjyz8ta0=
X-Authority-Analysis: v=2.4 cv=btpMBFai c=1 sm=1 tr=0 ts=68d3c935 cx=c_pps
 a=4FhRDsKUqNVV+vA+egT0Jw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10 a=t7CeM3EgAAAA:8 a=ToliOdm6Xv3mqA58rcUA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: f_66hT4_y7pC3-4evZf27Tc8r2FoHp29
X-Proofpoint-ORIG-GUID: haSJ0J_G3sG9lEstBWtOHnvgnbaFEnO8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_03,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 phishscore=0 suspectscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 10:34:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119800

From: Sunil Dora <sunilkumar.dora@windriver.com>

bpftrace need line up with kernel architecture type,
so add it to NON_MULTILIB_RECIPES.

bpftrace must be built with the same architecture (32-bit/64-bit) as the kernel
to ensure compatibility when tracing kernel functions and using eBPF features.

(cherry-picked from f8498f26991fbd8ea996dcf7c63d1c79e9c034a7 in master )

Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
---
 meta-oe/conf/layer.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
index 2f4b9c4027..98d32c2fbf 100644
--- a/meta-oe/conf/layer.conf
+++ b/meta-oe/conf/layer.conf
@@ -119,7 +119,7 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
 
 DEFAULT_TEST_SUITES:pn-meta-oe-ptest-image = " ${PTESTTESTSUITE}"
 
-NON_MULTILIB_RECIPES:append = " crash pahole libbpf"
+NON_MULTILIB_RECIPES:append = " crash pahole libbpf bpftrace"
 
 NON_MULTILIB_RECIPES:remove:x86 = "libbpf"
 NON_MULTILIB_RECIPES:remove:x86-64 = "libbpf"
-- 
2.49.0


