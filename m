Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6A09CA1016
	for <webhook@archiver.kernel.org>; Tue,  9 Sep 2025 02:52:40 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.3361.1757386350943495317
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Sep 2025 19:52:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=AmB9e8dI;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1347883a23=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5891YbfT936889
	for <openembedded-devel@lists.openembedded.org>; Mon, 8 Sep 2025 19:52:30 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=cDMklApkt
	4vTjOj1aGFlHh0bgRVCvA4uDfBVpgXib90=; b=AmB9e8dIW+5LFFQSU6+mRc9xe
	gzqwhXAdN++byAl3ISqUvvI4A8Y6ubpiRsGRB/bdN+HQzhbQvFbI8jV2P6iV1oyi
	NxD5Jib9oPS6FhCWycoltRo2qq6Jk2lYHmdQLnreC8vOyfj8neigePg/2oTIx43n
	Fm73bRwcHFsU3DYUKZXj5xLLKy+g3RQSfEznw5B0bqFIrosL6CpCinT35c9Fo9vC
	U3HuPRXF0qZGrPvoxjsBo+421SRfEJW0WXr7MmJmSkgoTyiMYz4riGIxJlGsMB/h
	cus0j2MmlM33LiCT2E2WAzTPt+JrZai6XK8i2+cRGRLv1riR0CbgIKULQsjAg==
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2047.outbound.protection.outlook.com [40.107.244.47])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 490mfg27vv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 08 Sep 2025 19:52:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g3Vinldvbl4ngZmlrGgVEIRoZc2zPPtoy1VFKdQ0pDaC7UkiP++q5T5yKi7E2OhfM0tuEi9epaEZi3fTi9+2t2TK6mOD2rLGugD2QHtVjERTflVMaNbCs6uhOJQ/0p2x8I36zwcIOtVa6oHQpxp3kp8PpT7gjbjS8apU6zSMRou4yjN1uL5EdNNjOoN9cIPODm6SWFGg91n5Rr3SYN/TGrnDjIaFNAr5TKxVJrUlhex2OiO4ONFjZfBqp6R1JYFnmmBSNYVG2mUNx7QLwOVvga1kBCC6BLdwVB1pRrVhgEqIJhSeIHHV/Tp9s0JWv9cCrrDsSEr7BM66mZj40bIgZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cDMklApkt4vTjOj1aGFlHh0bgRVCvA4uDfBVpgXib90=;
 b=sSy3iTzayM3xNnUWg4Ytdu5cZpiZ5/SjR5JIZZzeK7VoXVa/QSl5AwFs3eHb0A3Y/qjAd4V5QrFFl+CZr8kl7UfM999QAaItNxGnGcbdHIIVX/lKRCfGsMelULbZXRd1zHSxD2OrZGzzQ+v1sJlNDdtJPIKtTFYM2vW6MNO6qWwwsqUCxCjB8Gjve00915eTLeA6JWx6mBes6NgY1R1N+54kVp5TiMg5AI3u/p/50wZyuib4RqvXhCF+GCoiuoEBu2xciV16d6fm5+tmtCnkpDfJwxmxeDBDJjXTV2FxEO+a/FXVGyAONd1NVhTkC5PUG8Hfk2b51RR8pIkGRnj84g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7901.namprd11.prod.outlook.com (2603:10b6:8:f4::20) by
 PH3PPF307806035.namprd11.prod.outlook.com (2603:10b6:518:1::d13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 02:52:27 +0000
Received: from DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::9fa:eb3f:cf26:264d]) by DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::9fa:eb3f:cf26:264d%7]) with mapi id 15.20.9094.021; Tue, 9 Sep 2025
 02:52:21 +0000
From: sunilkumar.dora@windriver.com
To: openembedded-devel@lists.openembedded.org
Cc: raj.khem@gmail.com, sunilkumar.dora@windriver.com,
        Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        Liezhi.Yang@windriver.com, Wentao.Zhang@windriver.com
Subject: [meta-oe][PATCH] layer.conf: add bpftrace to NON_MULTILIB_RECIPES
Date: Mon,  8 Sep 2025 19:51:57 -0700
Message-ID: <20250909025157.21102-1-sunilkumar.dora@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0009.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::14) To DS0PR11MB7901.namprd11.prod.outlook.com
 (2603:10b6:8:f4::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7901:EE_|PH3PPF307806035:EE_
X-MS-Office365-Filtering-Correlation-Id: 32fef611-d001-4da1-d01e-08ddef4be568
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?3+u+B4W3daReX8QFUt90IXtEhPB4oO8ZAuYLmh+4Anqmt7rzeSDPiHlpLEx/?=
 =?us-ascii?Q?1Y5u6nOSkbEg9GbEWCDxSrw3CmrOSsW4S9ZHv9lh2IlURRCVtJVsc5s+rFxo?=
 =?us-ascii?Q?MgLDgxKORdC4b3hpGgS8Dw+0UnQgTnPwyrI+JyoZCnL6L6iKPtkHAsAVOdqh?=
 =?us-ascii?Q?RS+w740zK/5SmGnVEq1nOqSnP8cNVBWWtgrZUIk7Ag+ml8bCRyl/5s7VOE+S?=
 =?us-ascii?Q?avr7drbIEgC/F8NhKkQyvMvAPOWCY8jYXgLnk/u3hwDSbyfRtXECL+WxUpkx?=
 =?us-ascii?Q?1wZS6kBmmVwuQ9SLvr0iWhXig5s/5nktXxiVz5vL3UYelgF+NSQGr8uQeTuf?=
 =?us-ascii?Q?6NAnwpHdSTky2nEGMvwmrBdAV0Z8tkezYSsh/k2GLCJOIEvoPX6kP1vPQbnj?=
 =?us-ascii?Q?yzxMjz4qL1T/IzmUUOFoAmuTzcZ5BOd9bdtQN9XgcH1sHFqtdVaVquRiegza?=
 =?us-ascii?Q?YkS7Wz74mG68GPmlD5pW0tWn6E1xeXJehTmN0NIU73qS69i0+0UpiVUanL1j?=
 =?us-ascii?Q?nW+12RbTO1FCiTKn7xRzPhfNNLZXZwGMKjX5Y6OVl6jfZxuNBHafHNXYLEfq?=
 =?us-ascii?Q?jvjWnqm5WvCloDEFiQjOZHycaHD3Hv/+eODtb6GlQPyT3X5Nkr8H5kCeT5WF?=
 =?us-ascii?Q?9jy9yCk0EywdwY/xYvfIVi33TmHJg7+tbIcKEgdGTdOuO0oGxGWXysJoA3HH?=
 =?us-ascii?Q?pPFFYfBQ49JBIRYp16ecVMESF1oW5VkvLDK+Mo+Kngu9WkDk43f7Rjl3ebRg?=
 =?us-ascii?Q?xNdd6vkLCfhi4316F+AuR0ZDDRzb0wjywfIP5aO4NNDWwIJBuUAMFjSgOFAN?=
 =?us-ascii?Q?0cu8ykUPZZE+Hh5bwLf1N6ANVGlhbiSOWy3rHE5HpQfRoLcme8sTMeAcGHkI?=
 =?us-ascii?Q?CYrseML6YkkyhACzEWNHOHk+5fhNqTvq+STS6omk1GevX6UwKkag7PUZgvS7?=
 =?us-ascii?Q?ZrkHas1ibfziRv2Sld0SJd3tFHRp6UANLMbcX+ixUdvvmQkzu83hf0SfMZLU?=
 =?us-ascii?Q?kFkKTMJHCrJg58PXi4nuz0FWIl1wdW+g2jzbcAtaxafDm7nEa2ypEn4mec5k?=
 =?us-ascii?Q?egrEnbLeLeAtfYevWpHwacsmccxpOMnsHPmWs+Tw7raHf0dKtkJgG11WXefE?=
 =?us-ascii?Q?pSb8LFZgMD/ZcKaiaf4mvUvEyDX4FKF7IIqwV33F+/Y8pp4Pdbx78zZEeA3d?=
 =?us-ascii?Q?k8f/OoYSvnkjDUOVT1g6QDUMEh2qJwxlvnuPm+PGcu0PIB35V9WhLGfcpWnE?=
 =?us-ascii?Q?3Pcda6xn+KZK6+uPGOoCgNrj5c25C1X5LGroLOxajFCvPh8nNoIDUiXYyaUb?=
 =?us-ascii?Q?ynj0IDdHK117dMiVQzgFgluGvhaKZHstoLfnTrAbZKvgPmvlFDKq3cao2cAQ?=
 =?us-ascii?Q?9Mx9Dewo3P0XOxWtb/tvYfJKFaSiWxrXGYsDDkOoOAessFwVzC323HxeMvw+?=
 =?us-ascii?Q?7R+Z5ckgHRfjoWgvjAByUpboKsVQC36kvP4Lay1sU0Vak3e3p9hkcKGII12h?=
 =?us-ascii?Q?roHoTKEm0nSumbw=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7901.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?yt6ixCPz9YOHz23PobWcos3KVZX26I7QL3JE09VM3L3czRZyn+B7rmO/GA6I?=
 =?us-ascii?Q?GbkQyIOQiQ1EtwcESDhDyeUiZj8UA7RWQuzNulYh/VxOWERUxNbsx6NkvVHC?=
 =?us-ascii?Q?wP9tbPAg7K7DpAcK8UUpsLejbo+GSty5FC7vBoUJQBJmq33sOKoLo3hZouWF?=
 =?us-ascii?Q?y38yeJZSKvRhF/NdrhUPtfM9nVnvBCe69OwhkZcsTZwLrXBVG5OXL/2Y1VO8?=
 =?us-ascii?Q?nwrxHDCAqOnesxTcDIuzobjyDns/mK9NKqoDgarXqPFBD8oDWkcS9dd3nsIY?=
 =?us-ascii?Q?QbP7y+QcyPE8FB+Ui9ooxLQa6hZbKWBBPxj5odWl+AGdFuc3MOx9c6GFAKL6?=
 =?us-ascii?Q?gBGHTTtTWHwPGJWqfwENBNKJye1/rGEUoa1lfzqJyJXA0fo+kaDcysirAYFb?=
 =?us-ascii?Q?yXmLeIesrwB+fQorFYmBPg6eMbguF6ca9VEX/BpkAAqY/utirOMiTbIrQ2Zp?=
 =?us-ascii?Q?By/fNhqGQ9ygxzqqVnEGg5qs46MK5J7UZNhgtX6W15TkwYzLvNv5ZsyRiEua?=
 =?us-ascii?Q?CnpJESOskEU+HwXoETXjOa+Bf74tF35mqYIODbQ5+F/myQOYGRQ/uBJoKeXj?=
 =?us-ascii?Q?Oefsqk6QCSv233Jrf7IyErt+c7E2wL9/wkQ/F8q7E31iwhGezCicyk3et7si?=
 =?us-ascii?Q?z8Dl1kcHrLypqSId1CXqXmrCh4J/IV084xuQb8Rlui8SPbzpMkS7j7nU0g1m?=
 =?us-ascii?Q?BaLRtzsAva4nNB1+3coCSAtOnO6ulCFANrTFCGkk99eanOglIzWDDFBrO1ut?=
 =?us-ascii?Q?HpgzG3RFS4LRwP7WKBYm4m2gz7bLVJ1/caVCyb40fH+/Q12yiAXb1u0T404v?=
 =?us-ascii?Q?FCiUtdaFyRHgoJNmLEQhbHSPAJduoyL3PT1y4HjA2qgzcvbHZtoMlSVgng7m?=
 =?us-ascii?Q?Z49GJcSjJ1AB03ECUpoAB+Z3Oa5jeIY83Uyp3jLlF50RnjxXBK3oDPw1vKsl?=
 =?us-ascii?Q?M/JbfBjFPMqSNpOoM3owZo8HAu/OvvtIABfyxmSiMBXSU7cBwsMMjAUvdJ2O?=
 =?us-ascii?Q?fFZAsvjN8ZuOTWCqVI/l/WPytKgUZoMYv+rRtvYBFHkBlqUufos3vXIeAL/A?=
 =?us-ascii?Q?EOB/68QUqsdQ9G3STpbzOHMmAI3iRee17BaNv5hSAl2YxSzLMk9lgLv8F7iQ?=
 =?us-ascii?Q?FiCTmICi5c1FRfn5Y51ICCsnIPBdLB23lWl53OoxiFWyD9NYbGwimpuvTQKa?=
 =?us-ascii?Q?PGCCfKPudWImDR0qBpLrczUhJvTcAqzjmeMs7QDIPUUZZElGLQMbUIasWMN4?=
 =?us-ascii?Q?dE/53brEiFExe9cpmrRNcmI9DXKIRH8eAoA3GTw2d8gB63limTEZfNQJey/m?=
 =?us-ascii?Q?8LTqPeWMHv46JwU9ht1V9T3jjZg8xHwMcJZmsON/SQWmeqYK+lxLFJJ7wUtx?=
 =?us-ascii?Q?PFGaWaUv/tRyu1CQbuxGwaNyaN0Fj7T0NirDThFa2PDa0r3UxpOsq7KNvTEE?=
 =?us-ascii?Q?8AJzQVOfsFfRFjjS+sJkiW6FDdcn1DnG55pVPCeL3R36Vpgws4hBP0wN4OLl?=
 =?us-ascii?Q?mVv71K3zcm4tOUqxvfzcsVAh53xUR8wnBHjyu+7A0nTnJlX/X87BnYXUvqmj?=
 =?us-ascii?Q?rl+Do2zayM5yQP1uGZdh4Xilirfku0n6B3o7ochNZjnc+zxQMRheJHRikRti?=
 =?us-ascii?Q?rw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32fef611-d001-4da1-d01e-08ddef4be568
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7901.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2025 02:52:21.0044
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vLb/8xTh7fQYReYeZTEdTvtUZjyzz+F1bPyuHeWaU7dhlLkBkAvrGbaQHethIkVdDHS5goX30DigzyNFdcwXWC0AyWX9pdFWJOUjlelK3ws=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF307806035
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: HMmxsUfgdXSc_SHJ9p--BPMERO1KKUvZ
X-Authority-Analysis: v=2.4 cv=d+v1yQjE c=1 sm=1 tr=0 ts=68bf966e cx=c_pps
 a=00uhA2iMQE1K7v6Psv3cpQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10 a=t7CeM3EgAAAA:8 a=Y7BqFZQdhNh1JCg1PW0A:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA5MDAyNyBTYWx0ZWRfX1d9qfLMi2XZU
 7gZk5kb8Ar0pvBm7g+wQb5RuMCHFSFXdruwQ6mQNxJbBH4MEMYzpT0+Ct8ooy8mz2R4YL0UkFOc
 Yz8tEqUxI7hQbLWq59RcpmB7uP+S0QvzN1mR4OeGIou2JTxoSss3JICRcAFdgyZ8DZdExECc2oW
 N8VcOcOYIpnBBpoljH3QW9APioU5TKjjOzE9yRZuAbcSp6Sc3OP4X1d5XiZ/hOdUXOOJtjDbZVh
 ApaQQlJnrPKJwk4Nu3mx/ufZjy/Y4Zh41ELHT8+1weqU/wCS0IYCRfj7xzgQ2wuZaTnFE6iN5ov
 rvgVjbkfVXj9rXUvYhV1U6wIJAwJ46CtcyShTpywJLZD9EC5OvqkG35CRwlMTQ=
X-Proofpoint-ORIG-GUID: jInCl5vkozQRDIVipjC0M6Kk_ZIzsMeP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 impostorscore=0 clxscore=1011 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Sep 2025 02:52:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119340

From: Sunil Dora <sunilkumar.dora@windriver.com>

bpftrace need line up with kernel architecture type,
so add it to NON_MULTILIB_RECIPES.

bpftrace must be built with the same architecture (32-bit/64-bit) as the kernel
to ensure compatibility when tracing kernel functions and using eBPF features.

Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
---
 meta-oe/conf/layer.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
index 5501e4315f..bddfabc219 100644
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


