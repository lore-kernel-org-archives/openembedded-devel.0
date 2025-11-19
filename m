Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45C40CF2599
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 07:55:05 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1912.1763538902408020146
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Nov 2025 23:55:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=EzjNYT7n;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=34186c0f38=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJ6uRS52772481
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Nov 2025 07:55:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=p6rGG6iHgIdJ/YeP5oqB
	HNjJNo44Li//MTG0+YXzRg0=; b=EzjNYT7ndzU165Okb40LJJMBrrzrXN2f/9bd
	hkAr3WY0YPZ9xci3U7e9L0wC5Mo9cmZqzRxuJut7MnGyEF5QEFi0S0n4qhPCK9VV
	ypAwj9Xd58amBskDTl5oTMY47HmeazPz/SlNQKy2DjxTmJgPI1Fx0LRy5R5KabJH
	/VnxJ65LBtsb8ls/rxcTmnF93R9mLFcEwiB6nhXVnOA/WqKFKEwKSZTZhefOU6Sf
	Z2KWulq+tuMqoDpasu9fEhlJDjgmviQzYDusVjlnbFQl52NZ/iyy706XcWtKDVu/
	mAicGLViHIVbwEd+kGAQMoA38+OMGnQJtLFMYlfW1IyJU+QLyw==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012002.outbound.protection.outlook.com [40.107.209.2])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aegg8cpuf-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Nov 2025 07:55:01 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hRiaOrFZ90GrCfgBnKwJYxKPoMIHdA8ct/801t0g2UrXoErObYXqMdQIctm+oAzZTO2vVURLMOTxyhxJ3hbk/7CVYtQot3emR83jP8YXffC2jx8/I/HXsZem1dGPSl42nZgXoqmd0c3rX9mfuGoNo+5/xMJCSyFjy3gGUaH4ivvloKduCOkAavV03FAMpRYDpLVhqT2+qtAtbr0AIGaoDGxG/aiPafLM8zVFp5Vey54X1hxRuDXuO/C2J4m3CaTMyTcUM2qZxAZ4nIIOQHyIlcfS3vf1drvX0sDodLQJNQcy0eTDO6mc1Ix5QpbLAwMRpbCiQPu2H5iRB/3A669HOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p6rGG6iHgIdJ/YeP5oqBHNjJNo44Li//MTG0+YXzRg0=;
 b=IiyFVvPh4EEf2RxKbHclOT+AJekzTtFWH/hzOBGb2UJO/Ymrgt2p1x7WvPX1JlfCsl0l7lUKjZ28pIPrxiTa9JjHuyi0iPHHlxMdSf1cYZcz64n/tXWDCW9RO96gxACgLtPdT7K8XQ7Dg9/GNNcjeah5igGndf7q1BGTY18jX6b7MdFX9es3BLn5PIdL9YxQ//sFNjhg9LtVliI/UOBkPxTc4hzwvJ4pw51LtHsbBLtIOEv5OeP2eoEiFmpu2/wkJmFAkQtLr1hV/bRdfAu1Lmon/RD/lQ1NKmO/FrAbUPl5wqb1zGP07k0OYV3DrxHGXN0sVoLAUGogUfg/jJYIQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by MN6PR11MB8241.namprd11.prod.outlook.com (2603:10b6:208:473::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.18; Wed, 19 Nov
 2025 07:54:58 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484%5]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 07:54:58 +0000
From: peng.zhang1.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH] wxwidgets: fix CVE-2024-58249
Date: Wed, 19 Nov 2025 15:54:46 +0800
Message-ID: <20251119075447.77173-1-peng.zhang1.cn@windriver.com>
X-Mailer: git-send-email 2.50.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0119.apcprd03.prod.outlook.com
 (2603:1096:4:91::23) To CH3PR11MB8562.namprd11.prod.outlook.com
 (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|MN6PR11MB8241:EE_
X-MS-Office365-Filtering-Correlation-Id: 33ed3f85-3488-48fd-88b7-08de2740ef89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?nS50vcUH3VzCBIzO9YyZIFT1A6jGUeBZEGb+a9gj2m/WxMsJcyu/3SNfkZa7?=
 =?us-ascii?Q?gr1K2iNOAJdI2oazHslPbGuaf4ebiwSbtpF6laeORREIV6xaop+YTg8c6Tzx?=
 =?us-ascii?Q?dyquJ1zLHkbNFfH6PIwOMqepvdRs2TuwC66Wzv9+c+cKyeeqFMXNappNPAIx?=
 =?us-ascii?Q?ESnXuB/GZW3L/8qmiix/6WA7LPe+VJRkU5tuuVz2BMSFw3cCGBF5aolnzIoG?=
 =?us-ascii?Q?ktpoJVBdVIfvajp62aOuETDNz0Hw/PfUVbzezq8dIDi4x9khNCXIyFtHYc06?=
 =?us-ascii?Q?vdDQ9QXOjPyOTtgYaPVviyIR24z2iYBmC/iXf/qDGtDweWFKG/Ra2moTcu2n?=
 =?us-ascii?Q?0NxocSteSHXHqyp2Dwi6SgOAftP56OC01g6BR6JDpCLRwuUER4cr0OwL5XA/?=
 =?us-ascii?Q?BjNKqXvc2u2nBWbwxYxNxEWKusn//GI/tT/qKdx45Nu3PtQOiwuroudlmYcy?=
 =?us-ascii?Q?413++kP4GMRuQpc1Yq/oCJb3Uc58H754Ami1tkvvI8Z4JwVTMK7ObE6/PPb1?=
 =?us-ascii?Q?e/JohA/C/O3fbpcLres04DKL4IzcoZ1Pu95Fo7Z7/zB2/2S8nw012/HWrZNJ?=
 =?us-ascii?Q?Ys2jgOR+AQUY6YujQfFujt8L5eutmVme4vOBYCLxYwmbek5jTpT+oTXkJEV0?=
 =?us-ascii?Q?3WQd58yU/dG5xDerx/VlYX/W0Z5R1VbpjrAVJIHH5tY3YmQMZ/0G1gzR0yDL?=
 =?us-ascii?Q?RXBvnEFFBOS/bXGbalZNrhZbvuT799cPjNlGuzFlBMJpMBLLB/Nq5Zr3QdIx?=
 =?us-ascii?Q?2Co2GZCHWJxHi+lYgH8HxWVqLIFPansQTkc1Tbj3WmnCdfT37fydTb93MRaN?=
 =?us-ascii?Q?P4dASb02uApKUTuTvlRgaF7rklfV729vuiiuyMSNtBYBnte+YoJQsJAP9sQt?=
 =?us-ascii?Q?GP8bCPu/AHRk65BM7N5w+EN+CA2+bNplfhWroD6stDI1L3lFpHGPu2I2c0iU?=
 =?us-ascii?Q?eQjtnAricyFeKqs+CgO3mv0Pz9ZLTaZd7PXfHvl94lCMuZKfNE4lskTaWnL3?=
 =?us-ascii?Q?LB4dQYf5R2I/+CS2jR1W5yp1Sie5+s2Vc5GP1F6ufAnhGXaHjFlRWF/2D8Of?=
 =?us-ascii?Q?siTclxVkb+QTzmoeeA6JUZTaSyMwSp5WXxLEf/VpzYgPWxEM3EiUEYD0Ev8U?=
 =?us-ascii?Q?J/mM6DV/WFIbpXn7ZM70MNSz8iBchbl9Xajv5UtCSlvf7HWhMAIH1a0IkGdH?=
 =?us-ascii?Q?eiCBDnwQ+QNUokNHVP9Lr208P/XDWF3eOxxrgnILwKhsI5+kZpGhhuWZAOOt?=
 =?us-ascii?Q?UIabh2GEJO2mcH5mdjgu6gHbZxsCGw2dhVVVLfehPEBzQGwNYOXVeX8l+iQw?=
 =?us-ascii?Q?Fyty9XEWvbzEf+OdBUfW29FuA6TIy/t/8dcwapUjNDKEwlLoJqKTCOVtl9lx?=
 =?us-ascii?Q?GfSDd4qJf+TEFbCfnDT0xezUZ3k8sbCfjoLG7UWHJYoQtxC5uDSngz3jHvzK?=
 =?us-ascii?Q?d/qwka6A11z2WhM5hqENh2JsTOSlVmGJNdepACG4obrIgbzuPcLWx6bqER0w?=
 =?us-ascii?Q?k2v1OjxCbu2vuGByuldY2LfyCGTfu/yZQSIcfWDLf/8FF1XerTuPufdt5Q?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Qe1LGCizPGj2G/veOtQ18w8rc/zGVofnmb7fRmFAGh5V5Mh/4eP6Iw4k6rNP?=
 =?us-ascii?Q?zz5V7DA7Z2CeKUp3ooX2RwnNYEL56wvebL4NR8/XS3nBtrj6D1DdxaTt7t+r?=
 =?us-ascii?Q?upuUyN+A3LcDA9LCrwkaoHQg8rLI37oic9iMl9y27Y5XCC3ewolIGacM2jm/?=
 =?us-ascii?Q?1GFHqGXXyNaS6QeKPcoRl208pB9cpvvgQNz9h7AqYL9zfASbZ3T/7ZyupLNC?=
 =?us-ascii?Q?NDNOrCHks2jNyIhUwEr4D3UIbmiE/HyrCd+TsNJVYki3LU+RPWg6dV32c/8D?=
 =?us-ascii?Q?BhwYXAX8jBK9cS1ralJUMCjyYw4k0GZ4oDp92QT4RQltFqRrZ8ONjbZi1+Bb?=
 =?us-ascii?Q?GFWme2IsUvsYGXEu0shx5EGtAEXm3lrNEMbgtJm/WUhXsgc6mP9pcLMpu+cf?=
 =?us-ascii?Q?/iWA5+3E5edXweCmkEgWUOSDv3A3lGO/y7GYmMFU+B+nF28jOm6qnK4V5N4G?=
 =?us-ascii?Q?Rg425J0lX/IQerqXMdWLXeyzG20kyc4a2W5fOl6xFt1bz8UFQc6emNnXhj2a?=
 =?us-ascii?Q?Rpay2L1zMCCJb1/z8pwc5G9Pw8xcwr4xFzkQ96YnOXeq+j4wSX+h2OQVig73?=
 =?us-ascii?Q?A7LFecmVYF3aF6nGkX3A3Zbod7GRI0+YSlKjE/0WwLgpJLT0qBDoDhL9nNjA?=
 =?us-ascii?Q?SVxTlROsmZDHogUDg2sIW3ZJDMJG3DQeixJcAOO+UbGSuONigTWgI6Mtpp2I?=
 =?us-ascii?Q?lagPV1omGUqdvormrrHLxKNjpnJxGdLQmtPxSd6NQTZ92PebhADCcSntZ0L/?=
 =?us-ascii?Q?Ttcm/i+IHH+mS1LDX4n25XNbarMyfz0lXUua9nxYZCwJ7uUP6hjcVCDCz60L?=
 =?us-ascii?Q?Wq357lcCZ3j6gsNnJDU1+UVS40AON//u5or7T01JLfrIaY8vg6RBBfLefgNA?=
 =?us-ascii?Q?OvOoVykY05bOoPXwno29jgPk1/SuTc1YSKB/Qw+y9JIM9IU8TKGLQZ6vA/fS?=
 =?us-ascii?Q?Kbtg6BejLOChOdO36L52sw21p9YiTx2WXiUz4q6zh7xT3l8iZ0+P6bA1KQ9j?=
 =?us-ascii?Q?1GAVAKB39680mDHBp8XER+p70KxC/PcKWbj/E1krHbzkrg+nmg7OQ1ZT9Um2?=
 =?us-ascii?Q?3ebhXmdNdS+RX8nNQn8cdLXwjWb9NVZ6R9uyn6C2kq1eT9NTmq/DHknOJQT+?=
 =?us-ascii?Q?npSS47Vz+GpIYNHzvjuczC5FACPlVYQL1ojBeRAwWuhALUPZO4PewQeXCvdj?=
 =?us-ascii?Q?tPzM8hYrJvkcRKaJy0MrKt+Jg4xK2Gjew131uVM1IksHzRjwf5boAjayXx+C?=
 =?us-ascii?Q?+JoF88JBrJoeQ/c+NexR5OzH3F7W7mpyrw/H3D1BptvO1QMTT+WXgaYUvHxA?=
 =?us-ascii?Q?IDBU6XES8YQWfgf5dbQp1aAhOkH13sx6FM84+F+GV7zSC93XydSgzAFUBlE+?=
 =?us-ascii?Q?8bAqu9VU+EqYwDGVrTz7Byx2vcDOCqFbyYdmBzVC6+uZSCvDYpxyRrT9xPZP?=
 =?us-ascii?Q?vm1VhWimqqDERsXzr7/LfPSq8hJA03zhE2co3kjCtq+onDGVFK1nRRk3EMiR?=
 =?us-ascii?Q?zMMZOBPgYRsA69GJHD8/wxQcg1PIVd1oGUYsHiBhmLDiqYtSMVE9kPEel2FP?=
 =?us-ascii?Q?3sw6N7pWcMUHUYVq9IQ8qbB+QJ/clDJiRmzGOZM7lfRcfB/SFT+HnZ8DnAsm?=
 =?us-ascii?Q?ZQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33ed3f85-3488-48fd-88b7-08de2740ef89
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 07:54:58.5609
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7CjYA+lDgvdyReoALqhrxJ3hP8r6kED7U4aRxKCwdFdJiermG+vUVKvnfIfOsDb6cg0fwQjTgUC2ddfKm+9ywv7Ncpj3gl4CdABOkk1sPcw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8241
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDA1OSBTYWx0ZWRfX+QsrkfRt7RDa
 RY7AVurvus2buL6gK/NKNDpyxGTck4l6+wnMuKe5bPly7o+Uzd/pHZPicgblVl9mXbf+gwKdb1N
 WKvJcgDd4hPZNfZY3rx2jt9++cv7oWGEgTF/KNEFnio+bM5TqT0OVSksjRSkP3dpbIWMeRTRcbe
 lBdXhJG/uu1gJLxlzogONpoGhw183V9C0Jn6iPt2Df0JvaVpuilNCk4RRM+4Juo3xglojC1dXxm
 5n3ChYEGdP4X49jndRd7I4Nf24aMvelfxI6WN8LnerqB/f/DpziU0HCOTtS0AFnyOb4kZ/YHdqh
 f6YmYdLQvQus8LmpO6stVQbw0LZYdjVQigEjJydmNmH5YzFQV0+TRFksyE0UgCEwXCv6+itsR/i
 0e8DMV3mXu5APrn1Nz0ZFAsAeWD1vQ==
X-Authority-Analysis: v=2.4 cv=U+CfzOru c=1 sm=1 tr=0 ts=691d77d5 cx=c_pps
 a=ziZy7zD1dJq8wwEro8zYwA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=IFCbucT4AAAA:8
 a=3epcOkmVbHiDymNTJPUA:9 a=FdTzh2GWekK77mhwV6Dw:22 a=cnuYUo6HLIWjuL6tXTi5:22
X-Proofpoint-ORIG-GUID: tD76zNy7DsxG26JRo7f-PpNApo-IWg-j
X-Proofpoint-GUID: tD76zNy7DsxG26JRo7f-PpNApo-IWg-j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_01,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511190059
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Nov 2025 07:55:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121888

From: Zhang Peng <peng.zhang1.cn@windriver.com>

CVE-2024-58249:
In wxWidgets before 3.2.7, a crash can be triggered in wxWidgets apps when
connections are refused in wxWebRequestCURL.

References:
[https://nvd.nist.gov/vuln/detail/CVE-2024-58249]

Upstream patch:
[https://github.com/wxWidgets/wxWidgets/commit/f2918a9ac823074901ce27de939baa57788beb3d]

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
---
 .../wxwidgets/wxwidgets/CVE-2024-58249.patch  | 177 ++++++++++++++++++
 .../wxwidgets/wxwidgets_3.1.5.bb              |   1 +
 2 files changed, 178 insertions(+)
 create mode 100644 meta-oe/recipes-extended/wxwidgets/wxwidgets/CVE-2024-58249.patch

diff --git a/meta-oe/recipes-extended/wxwidgets/wxwidgets/CVE-2024-58249.patch b/meta-oe/recipes-extended/wxwidgets/wxwidgets/CVE-2024-58249.patch
new file mode 100644
index 0000000000..7e165f571e
--- /dev/null
+++ b/meta-oe/recipes-extended/wxwidgets/wxwidgets/CVE-2024-58249.patch
@@ -0,0 +1,177 @@
+From b60061bb25eb9fb552489185d3e6095106c39755 Mon Sep 17 00:00:00 2001
+From: Vadim Zeitlin <vadim@wxwidgets.org>
+Date: Sun, 27 Oct 2024 00:56:21 +0200
+Subject: [PATCH] Fix crash when connection is refused in wxWebRequestCURL
+
+Avoid deleting wxEventLoopSourceHandler which may be still in use, as is
+the case when we get write IO notification just before an error one: if
+we delete the handler while handling the former, we crash when getting
+the latter one.
+
+Use a hack to avoid deleting the handlers for which write notification
+is being processed and delete them later, when we get the error one.
+
+See #24885.
+
+(cherry picked from commit 4e0fca8ab9756989598d07b41e672af86eac7092)
+
+CVE: CVE-2024-58249
+Upstream-Status: Backport [https://github.com/wxWidgets/wxWidgets/commit/f2918a9ac823074901ce27de939baa57788beb3d]
+Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
+---
+ src/common/webrequest_curl.cpp | 80 +++++++++++++++++++++++++---------
+ 1 file changed, 60 insertions(+), 20 deletions(-)
+
+diff --git a/src/common/webrequest_curl.cpp b/src/common/webrequest_curl.cpp
+index 91a8aec4ac..b5ffe7a061 100644
+--- a/src/common/webrequest_curl.cpp
++++ b/src/common/webrequest_curl.cpp
+@@ -685,10 +685,13 @@ SocketPollerImpl* SocketPollerImpl::Create(wxEvtHandler* hndlr)
+ 
+ // SocketPollerSourceHandler - a source handler used by the SocketPoller class.
+ 
++class SourceSocketPoller;
++
+ class SocketPollerSourceHandler: public wxEventLoopSourceHandler
+ {
+ public:
+-    SocketPollerSourceHandler(wxSOCKET_T, wxEvtHandler*);
++    SocketPollerSourceHandler(curl_socket_t sock, SourceSocketPoller* poller)
++        : m_socket(sock), m_poller(poller) {}
+ 
+     void OnReadWaiting() wxOVERRIDE;
+     void OnWriteWaiting() wxOVERRIDE;
+@@ -697,16 +700,9 @@ public:
+ private:
+     void SendEvent(int);
+     wxSOCKET_T m_socket;
+-    wxEvtHandler* m_handler;
++    SourceSocketPoller* const m_poller;
+ };
+ 
+-SocketPollerSourceHandler::SocketPollerSourceHandler(wxSOCKET_T sock,
+-                                                     wxEvtHandler* hndlr)
+-{
+-    m_socket = sock;
+-    m_handler = hndlr;
+-}
+-
+ void SocketPollerSourceHandler::OnReadWaiting()
+ {
+     SendEvent(SocketPoller::READY_FOR_READ);
+@@ -722,14 +718,6 @@ void SocketPollerSourceHandler::OnExceptionWaiting()
+     SendEvent(SocketPoller::HAS_ERROR);
+ }
+ 
+-void SocketPollerSourceHandler::SendEvent(int result)
+-{
+-    wxThreadEvent event(wxEVT_SOCKET_POLLER_RESULT);
+-    event.SetPayload<wxSOCKET_T>(m_socket);
+-    event.SetInt(result);
+-    m_handler->ProcessEvent(event);
+-}
+-
+ // SourceSocketPoller - a SocketPollerImpl based on event loop sources.
+ 
+ class SourceSocketPoller: public SocketPollerImpl
+@@ -741,6 +729,8 @@ public:
+     void StopPolling(wxSOCKET_T) wxOVERRIDE;
+     void ResumePolling(wxSOCKET_T) wxOVERRIDE;
+ 
++    void SendEvent(curl_socket_t sock, int result);
++
+ private:
+     WX_DECLARE_HASH_MAP(wxSOCKET_T, wxEventLoopSource*, wxIntegerHash,\
+                         wxIntegerEqual, SocketDataMap);
+@@ -749,11 +739,25 @@ private:
+ 
+     SocketDataMap m_socketData;
+     wxEvtHandler* m_handler;
++
++    // The socket for which we're currently processing a write IO notification.
++    curl_socket_t m_activeWriteSocket;
++
++    // The sockets that we couldn't clean up yet but should do if/when we get
++    // an error notification for them.
++    wxVector<curl_socket_t> m_socketsToCleanUp;
+ };
+ 
++// This function must be implemented after full SourceSocketPoller declaration.
++void SocketPollerSourceHandler::SendEvent(int result)
++{
++    m_poller->SendEvent(m_socket, result);
++}
++
+ SourceSocketPoller::SourceSocketPoller(wxEvtHandler* hndlr)
+ {
+     m_handler = hndlr;
++    m_activeWriteSocket = 0;
+ }
+ 
+ SourceSocketPoller::~SourceSocketPoller()
+@@ -803,9 +807,7 @@ bool SourceSocketPoller::StartPolling(wxSOCKET_T sock, int pollAction)
+     }
+     else
+     {
+-        // Otherwise create a new source handler.
+-        srcHandler =
+-            new SocketPollerSourceHandler(sock, m_handler);
++        srcHandler = new SocketPollerSourceHandler(sock, this);
+     }
+ 
+     // Get a new source object for these polling checks.
+@@ -839,6 +841,15 @@ bool SourceSocketPoller::StartPolling(wxSOCKET_T sock, int pollAction)
+ 
+ void SourceSocketPoller::StopPolling(wxSOCKET_T sock)
+ {
++    if ( sock == m_activeWriteSocket )
++    {
++        // We can't clean up the socket while we're inside OnWriteWaiting() for
++        // it because it could be followed by OnExceptionWaiting() and we'd
++        // crash if we deleted it already.
++        m_socketsToCleanUp.push_back(sock);
++        return;
++    }
++
+     SocketDataMap::iterator it = m_socketData.find(sock);
+ 
+     if ( it != m_socketData.end() )
+@@ -852,6 +863,35 @@ void SourceSocketPoller::ResumePolling(wxSOCKET_T WXUNUSED(sock))
+ {
+ }
+ 
++void SourceSocketPoller::SendEvent(curl_socket_t sock, int result)
++{
++    if ( result == SocketPoller::READY_FOR_WRITE )
++    {
++        // Prevent the handler from this socket from being deleted in case we
++        // get a HAS_ERROR event for it immediately after this one.
++        m_activeWriteSocket = sock;
++    }
++
++    wxThreadEvent event(wxEVT_SOCKET_POLLER_RESULT);
++    event.SetPayload<curl_socket_t>(sock);
++    event.SetInt(result);
++    m_handler->ProcessEvent(event);
++
++    m_activeWriteSocket = 0;
++
++    if ( result == SocketPoller::HAS_ERROR )
++    {
++        // Check if we have any sockets to clean up and do it now, it should be
++        // safe.
++        for ( size_t n = 0; n < m_socketsToCleanUp.size(); ++n )
++        {
++            StopPolling(m_socketsToCleanUp[n]);
++        }
++
++        m_socketsToCleanUp.clear();
++    }
++}
++
+ void SourceSocketPoller::CleanUpSocketSource(wxEventLoopSource* source)
+ {
+     wxEventLoopSourceHandler* srcHandler = source->GetHandler();
+-- 
+2.50.0
+
diff --git a/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.1.5.bb b/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.1.5.bb
index 6b57cb54cb..73c55222c1 100644
--- a/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.1.5.bb
+++ b/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.1.5.bb
@@ -25,6 +25,7 @@ SRC_URI = " \
     file://respect-DESTDIR-when-create-link.patch \
     file://not-append-system-name-to-lib-name.patch \
     file://wx-config-fix-libdir-for-multilib.patch \
+    file://CVE-2024-58249.patch \
 "
 SRCREV= "9c0a8be1dc32063d91ed1901fd5fcd54f4f955a1"
 S = "${WORKDIR}/git"
-- 
2.50.0


