Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7F2DC61DBE
	for <webhook@archiver.kernel.org>; Sat, 29 Aug 2026 06:05:48 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2393.1787983545035850654
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Aug 2026 23:05:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=jGX8u+Uk;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=370158628d=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67T5P2ds2077019
	for <openembedded-devel@lists.openembedded.org>; Fri, 28 Aug 2026 23:05:44 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=jKOBbwOjL
	jx/6iyc2N/NfeyH1DtErBq9vvulCp4fyGo=; b=jGX8u+UklGJSInRBLt1A78HAA
	83BHx1oAWgks1HVI4W6Dp7tDP4+lZMWME+fnfvMWs8sx5ZhfNWhjOKFQ1yNtTaN1
	zDS443pR6eA9hHgltwCJAcLwQavck4JxsqA0srXJw1bRbOOmytFlq9b2Ebrzte9q
	tvnAUnH+hHqjodRnCCis+ucuZlcZZtYwZWDv8xx1c5Y2iOVe5qk7inYCJrLBRH1H
	/g98+WijP1jvWOtvmMQ0jg+UKL2/9Q2B0HAFbGjLLVmC0rGf2GfcRGLTxyPbqCTH
	OTZ+ufn3Poz/aH/+5i5EP/oSINUtxnK32R0xtzGaDOjOJXD1Qjovz/fqNJwlQ==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11023142.outbound.protection.outlook.com [40.93.201.142])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4gaay2kmka-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 28 Aug 2026 23:05:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JhFuVUoPlDUIkzgKULF7OxYTjzleqw8AduNNbUv0RdVUTmBXEMTKft5c2NtbfW4UICh2ODG/9Nfxd0z16qo83Fk1MvPJ3jNlILJIUp7+p2UUVPmgfQfZynoq2JMyZB0RUy8DCPUl37C9WBtVZQNnYY53dPcC8VRUiRnNos8RyAGUX+QkJxCSbe9U1cOVjgV+756AFYWj1guoXl2lMfjrZUEtGyyd1RSQfMrpgAf40WUPLwhpum2d26Od6ZQRFMWAg/AXHdfsBvSebvudJ+FFHOswWiCA1lgRTriCEkZU3qCjqhQQv85SKzX0EqJrzKmyIPaubguz/f2aaiUW5WNNVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jKOBbwOjLjx/6iyc2N/NfeyH1DtErBq9vvulCp4fyGo=;
 b=Xz+mF+Zpr6hh6YKK0k8HaqPu1hV2hLwAjdT4i8YtAxsgMvqnJBZF3NYS0kY3NRGDXdmiAQloiRSUL9NUdgnVPfwAuRB0MuuJ1f1zIHCijT6TGisqF7Lx8VOdmz4mPsLWJDoBgyq+OUmzllEnuoZu7w0k12IEtGDXAaZcpg3Eovw0bzmnh1UkuK9qf3OZD+2Rzav4EM024m/wIB7tMQm5/cBsFBnagCMuCjWAMWUOQ8fWEIbnXpcXsFibArrQQHR8qSYsaELSdCtuwJymzSrumDObs2F05ig/DjwvP7rU59XuhK0/v8CH0wSG+2/aNKXdbQgnBSwgWnlEUXl1yIv9Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7901.namprd11.prod.outlook.com (2603:10b6:8:f4::20) by
 DS0PPF0A1E7F360.namprd11.prod.outlook.com (2603:10b6:f:fc02::504) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.12; Sat, 29 Aug
 2026 06:05:40 +0000
Received: from DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f]) by DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f%3]) with mapi id 15.21.0360.008; Sat, 29 Aug 2026
 06:05:40 +0000
From: sunilkumar.dora@windriver.com
To: openembedded-devel@lists.openembedded.org
Cc: raj.khem@gmail.com, deepesh.varatharajan@windriver.com,
        sundeep.kokkonda@windriver.com
Subject: [meta-oe][PATCH 0/2] Fix bcc and castxml builds with LLVM 23
Date: Sat, 29 Aug 2026 11:35:18 +0530
Message-ID: <20260829060520.2905173-1-sunilkumar.dora@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA0PR01CA0098.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::8) To DS0PR11MB7901.namprd11.prod.outlook.com
 (2603:10b6:8:f4::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7901:EE_|DS0PPF0A1E7F360:EE_
X-MS-Office365-Filtering-Correlation-Id: 71b6dfa6-b243-4beb-dc16-08df05938d6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|23010399003|366016|38350700014|6133799003|10067099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	3bA8ADZEtlCH/yAb4ZdNVw7TRpyte9dq8rMx1A+l+y+M4oy4NAGLhUIKpVRovqUGjHJN5BTf1uOzbCrfBmg1UlAD6EQhyuoEeYXA1plz9HorCprXGatY3A7fJUICEHvrzhkcjD60rIxVNSyyvbNElaeVqvD2D0P/jjZGI+IdA72etX60nFYILgYvMldDrSQsU+3hpEvAkIeyXctBX9S5GJiJeK8awZ3Go5cLSlbUR/NsCLmksbZ1yknowpNum/yPMtKiTfNie8Izb5ebvWbSAZLBcwVXYJr8pyWdAoKgr2Hpa+btiWwx5/a8wL0DDB2gsmiRqHIYB+ntFl4Qig7YrCV2X3mB5xh7zuyU+AqNV8VGdBK04VU+ZQ1yCfcsvxWtOAoVtv/ctyjcPHVvUUjK09Nltb7pbPhggkS79XjdB82gNHCF0wmrZYig6JTFwmSaU9IxAxo5vM3y3/45bRaAmOqKrkJkdXY3US9UOLVj4zIFKTPS928j0kHi+Pf15t7SpzmbxAsvr1GQESxmDCfPdJCHbvS25j8LK8ZMcZOBwkNhydovvl2SfiL6M3YBHoTtpGSRbmIANc7y8pUIFmTAW5Lzu7xYDTvDO3tGiSk0/7rBPYeyfibQ8NczS3V1jaKjkKXh7ZAJLYxprYmzc+SZuutW8DAsKKZTHUe9YbcmhZv8PMGkouB74JwxepO6BCy0pUqjfOiXfSGbgECuygRFofenGsFd2SnKqEHGCppwRV4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7901.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(23010399003)(366016)(38350700014)(6133799003)(10067099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ObQTKow7T95hP5xifRIb0A8He8P5yjk2M0WUIp1tnRs4duYgA5OwC+hjbYBQ?=
 =?us-ascii?Q?Hl63sIUVo+cKeqBWqEvRYpe4Q+P6NAmqDTUS7AyzEniPn0dDvs6EATJ4llQd?=
 =?us-ascii?Q?bcmuMJJTrDqtkbyTUdwB+r86935Jzxy54Gnd476FvTvd6iR/5rgyQ8zZCvoM?=
 =?us-ascii?Q?vCmy3TaebaTub7498aXZaCcNGdHx5IGmdyg93AA/k4InapC5Jl2BQwhAgSts?=
 =?us-ascii?Q?Bdf9miY/9ZIKXERA0zKk3+/n4ThaqP8zAGRZFMfVIk3lAg2nKo6/mQ1X+dpb?=
 =?us-ascii?Q?by1XdlpA3GRDY0rCL7qg8ZX8QIUjYANRFMjnRS1X2aeq6NPjInNvjnnUT6gB?=
 =?us-ascii?Q?ecHNTUkrQD6TVBVn09qomm5V3vDpnnpKGJOISL9NnO1z74eYpz5VMHFDd3mZ?=
 =?us-ascii?Q?7vRY1cDRGQXHlMWSUfeS4FplSjVLCVXYcd/RRbGfqvMz09oiuSzjLkPfU8Oz?=
 =?us-ascii?Q?VQj7aW9mwsu9+3Y+b5IRLCoQRylmLw7J9UueQx5NIzkMnJxpO+GOe9IbD7Dq?=
 =?us-ascii?Q?tCuMQAi49Tb4pc3D1NH7eIY/AGK+kGF6/Zoc589u2vonPnMFtbQuK/dCgjza?=
 =?us-ascii?Q?KwByJb5wn4HPh+Tvg9yhz67JHhMtOlfU++kyTRNbmJG9RFXuMFXiBbMMukXj?=
 =?us-ascii?Q?oBjqkZ8K6JMktQMDhHd1AZHVl3mlqzbR6FjenpqyTKVEO0Ig/xczqh/HptPz?=
 =?us-ascii?Q?+ki3Ql1XuVe8zBUPZ9LVUOVScLB7DVd2fLhSDY7tYJgH2lxcWt9TKAdad281?=
 =?us-ascii?Q?u0prWXWnfjXHQm2QfwJcNbXkoKx7psfMaeTVc1K+lUQ7uxIzYEFXVbDM0X5D?=
 =?us-ascii?Q?RIn6Uw3A18CsCT8NAppAZGyL9+icOhrU5oDdnh1kscvc1zbbssAdYqNrKgFW?=
 =?us-ascii?Q?09Z9+jZDTpetSS1HhGaVFZG85dtCfp8iRsMpfKTTIOg8Y2ARPi/UMgA/h71K?=
 =?us-ascii?Q?sAKNBt9Bi6TQKLWSaAXBfg6LPF3o7j0XBphOl5U0pQxT0ZnDd3be+Md8D3DZ?=
 =?us-ascii?Q?LzosKu/5j9WorOiuE/oMGe2/uDI6BxOcMaXHpJusFTu0+J+ZAg7xbx3n1W7u?=
 =?us-ascii?Q?4Tj1y3NPXBFinks/B8rdF0Qou0+emmtD5sLiaziKhmXBt/bPJu3s7x91jXFu?=
 =?us-ascii?Q?N27yhb5zKfn8hcp5PYlQyGKv1LrD8a4o0GPHXXvZ6z+bdOFn/9oYOaFXdXYS?=
 =?us-ascii?Q?8D8PUIcdvykzKAdtXqvzhevnQmmue5ixEdHa/jWLAaRnTYTq2QZqXOsV3kWr?=
 =?us-ascii?Q?tINSTT2R39GXcl7+v3ttw+x3Y7EKzZ6YkElZI76Cj7zGgemSBCg0FPFJGazN?=
 =?us-ascii?Q?59GQLMYOE0/B05qaKwH8d3jJLPzGYW58XJbwoRGWQ8gvKAugQ0uT7fJpE8+X?=
 =?us-ascii?Q?AQktRWCMogaOInttsP+oPQK3ormyhiIUxJfkJkKMGN96NW9CzlsokNd77vqW?=
 =?us-ascii?Q?biRjG6In1PbvZBeBvRnu3uJMIW7idlGwMjsEbCnYaO7688OpTY8mphpdeIl0?=
 =?us-ascii?Q?1fYC6UlWme6lCFZE7LlO+c/4uRwmfxdCz93D3qHtjUcGYqmjK4Va4/vI2GHg?=
 =?us-ascii?Q?j7wNaqoeucyvpyuB+D1u3NFNpTtOpw1WPA39XOvp19nJsJlLoBxFF+khD+iz?=
 =?us-ascii?Q?b/DqXwGyKU3R+BfNucGHMJ4OuVkZ4m0cdojir3cK7UtECquO5fUnB+CCYSnW?=
 =?us-ascii?Q?Kzp0PgK/eRkk9TaqkZQ/WY7dBEg/lVWP6a5kL1Y74b+pdchN6LormwWckgus?=
 =?us-ascii?Q?pq5M9b/od0IHmfIRMfojB7mgslPAPNA=3D?=
X-Exchange-RoutingPolicyChecked: 
	5T97CAkkuyGw/OMVvEg9wCk1NHgfE4ZdSNor+OANWpacXtaKgh6GBTpvacKbj0MiHfiApJbxqUYSWN1YG8OSDP0ebBe4Y4QebvDJIzduSg/+zqaE1fCJ+qVTpaRFLwgHMY257iiRbkTwIKQg/BXiTlXsfOuIoULPvV77NIH6n1brZkguy8b+1gus1pTJTmHDF1sTn0k7sv1smf5iibpNOaWmwC5ZatPI2ivTb9TXQbF9BjY4HMxAe57LLvop0sQf28BYZrDMK+zQ0kci+6q9pcfjFBcMOVN4R+fzsrEilsjTW6FQCm6kcIdKMsSYRtyn4a6g/wp/Ng5vvnF47rW5Fw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71b6dfa6-b243-4beb-dc16-08df05938d6f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7901.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2026 06:05:40.2844
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +YvNU7z2KDeBChLIMjtIPn92RM2HJmarGjLl5kFfBVZilTukDoXx3j9+TK33cyxz5Lm4al4MyPPcLICIPBUAjqsKLA/nBiBfmFlaToa+JMI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PPF0A1E7F360
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=EKU2FVZC c=1 sm=1 tr=0 ts=6a9276b8 cx=c_pps
 a=h/+960zEkKFrtNevg2BoYg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8
 a=Qq4GC0zqYaSpTwm5AGAA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI5MDA1MCBTYWx0ZWRfXxHXyxf1LQdfs
 mwC5oUBk/g8a6lp1Pzs+7ZoyqM6w1XxKRpof0+dlZqW+USS0uBtNPPeXIyDTxvYH9jou5gtw/Sa
 iwryvHWXleAvByVfR2Zwqe6maksv/8paYWsAifl4z9Gp6AwvcApc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI5MDA1MCBTYWx0ZWRfX4gHG9m9BG/V/
 nM9avYdGQcx06BED8+MwdaSWz6UduPb0XnL1I/5rvhSyMPnZA8+lxapUYrJLMoZf8GgX2i8apq4
 y1DHu3PwD7VNt4tapfufmizsRYKqJ5ppMAE03HxQLnclJYGBBwPgiNsKUzkl4++1km261ZfNxgx
 PS/3uhAYGZYoegGNgKz/RsDyslc+hU6qmvn/pSPvxs6OPmCL+h9Ew2//5lbsVEJ55oFJsAKjg6d
 V8V9Zdx9iSlBSGvsteJjpVYdcgeGuHPkoK8EmOmf7qgsggVHjiGBlJoBe2lq6oasWJR1gpQDx1s
 IeZaN4nWcafMjxhXwz0EdgmmG9qgDDhglsNqYPZtOjZl0+mABaqhdxREVrvQoTVOB0p8WPNAM7B
 ct4zTgMH6llyGnkECwECQhYc6HhQw3yaNhipiokGnMZX6tNb2ixepetm7deA7GmvyhqSTKDq+FO
 N4zDVaS5pBJi0lF8Y0g==
X-Proofpoint-ORIG-GUID: rVkxVSDZ6g77--YO-0wOkDfLoSd6OwF7
X-Proofpoint-GUID: C_2Od2eII15_qjeOQ3riFfhVSUUUVjx4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-29_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 malwarescore=0 clxscore=1011
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608290050
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 29 Aug 2026 06:05:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129576

From: Sunil Dora <sunilkumar.dora@windriver.com>

oe-core is moving clang/llvm from 22.1.8 to 23.1.0. Two recipes in
meta-oe do not build against 23, because upstream LLVM and Clang changed
APIs they use:

  castxml  Clang 23 renamed ASTContext::getRawCommentForDeclNoCache to
           getRawCommentNoCache.
  bcc      LLVM 23 changed the MCContext constructor to take MCAsmInfo,
           MCRegisterInfo and MCSubtargetInfo by reference rather than
           by pointer.

Both projects have already fixed this upstream, but neither fix is in a
release yet, and meta-oe is already on the newest tag of both. So these
are backports rather than version bumps.

Both upstream fixes are guarded on LLVM_VERSION_MAJOR, so the recipes
keep building with older Clang.

Both failures also reproduce on the Yocto autobuilder meta-oe world
build run against the oe-core clang/llvm 23.1.0 series.

Tested on qemux86-64 with meta-oe and meta-python on top of the oe-core
clang/llvm 23.1.0 series: castxml and bcc both build, with the default
gcc toolchain and with TOOLCHAIN=clang.

Sunil Dora (2):
  castxml: Fix build with LLVM 23
  bcc: Fix build with LLVM 23

 ...ix-MCContext-constructor-for-LLVM-23.patch | 36 +++++++++++++++++++
 .../recipes-devtools/bcc/bcc_0.37.0.bb        |  1 +
 .../castxml/0001-Port-to-LLVM-Clang-23.patch  | 36 +++++++++++++++++++
 .../recipes-devtools/castxml/castxml_0.7.0.bb |  4 ++-
 4 files changed, 76 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc/0001-src-cc-Fix-MCContext-constructor-for-LLVM-23.patch
 create mode 100644 meta-oe/recipes-devtools/castxml/castxml/0001-Port-to-LLVM-Clang-23.patch

-- 
2.43.0


