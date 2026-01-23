Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14CCCD625E5
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 06:48:46 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.62820.1769150916515457981
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Jan 2026 22:48:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ABu6IZQI;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=54833b6d62=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60N603ak3073829
	for <openembedded-devel@lists.openembedded.org>; Thu, 22 Jan 2026 22:48:36 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=l0EbLqTlT9amJ2ykkQm4
	fxJRD7PrxcF4Su6svWi1liw=; b=ABu6IZQIqoY8CwKb2FRQx/rIZ6Y2D7FNZ78x
	nMEIv2cO9gmNW2iLwzGlYN49hpQa6kKDBYRmwtarvNTz94u3OxdcLC3gJhKiwIDR
	SqVZvs5qS2fPdxpyoc4i5Gb5oSBa77Sx2GlHSSy8UHphjOP4ZL1BASiqlSkCwFiW
	mlaqJhoACq0Bf+JIpqAXG1gW5qrKTBA5AOlco7gnkaP18jvpb0YhBbSZkUxmQe2d
	H+5SnJnau9ONuTvFcbWdbtbAonLnOKiSuBYY1lVqP7yNkRl+P28gkNY7tw6LTxyP
	vQe+Io8gi+xCsmxcHL0uHanP6R8GRxiPaLSqcP/TyfatPx4sOA==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012040.outbound.protection.outlook.com [52.101.43.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4btnd73te8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 22 Jan 2026 22:48:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uUyxtzoqMaZwJrMY2m+CyuZn5f34dh64OXGSp0L/1nj8taCoWk83wUG4RmBVV2zHT/+saTF2QeXelelbrqavVlZwhkhvLUiK3jzisDssJKUhqPbpt6uCMWQgjf4t9uhRrt+d+PkVrjeI9yxp8R225S3ICQAO/CU8x3LbrSnCFjynKVjqn2QbQCP25a+Y0WsHuwvB3Cvq/E+oXKLNKSHIyb1UVUa4J6O2BrDyQSCFA05GPUjIXaF78bxZRDobjFLYmETHuJVLOeVz1wVuXTzpjBYKCc/T3io3/f71BTKFk25A0PLuX7PFdt+cp7Rq7pH2zzuV7kT+FzRJ6s5ZWEemJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l0EbLqTlT9amJ2ykkQm4fxJRD7PrxcF4Su6svWi1liw=;
 b=W//Xp6nevtkh+CHG6txIFqX4w8twJ7F3+lfvLjsnwdsxALGqEquuP5EDYpVnnxeHhBqME73fpdgPlvUt7qrDWg2ezHCKHg5Xg+owyTeql7T1ixevs/XlTPwg9mRhY3U0h/7w79BnA6dAC3PyYQLrA6JJisIJFM/VO6DotaWgx/k18uRFbFkVGYD49nnqiDImOGyCT7mNbk4KrAfnJyBqgyboI0QEKXPeN31McsbaHj0B8SOn4NbIyBNJgRLlRw3XpwXdLkJjpALQ/qQuvJgcFUrkHmOJodE/LQN7ghJkyGbK0SA7zvB3EnZLGSuuFOspu7ltMWU/Xrn0eYr4gJgLEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 PH8PR11MB6925.namprd11.prod.outlook.com (2603:10b6:510:227::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.9; Fri, 23 Jan 2026 06:48:33 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::3432:2eb3:d0a5:7831]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::3432:2eb3:d0a5:7831%6]) with mapi id 15.20.9542.010; Fri, 23 Jan 2026
 06:48:33 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] onboard: add recipe
Date: Fri, 23 Jan 2026 14:48:18 +0800
Message-Id: <20260123064818.1475439-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0026.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::18) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|PH8PR11MB6925:EE_
X-MS-Office365-Filtering-Correlation-Id: d0e018e7-855e-42fe-33d2-08de5a4b6d0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?X96cw8qLicGJT60dbJ5sYjK873NTh4H6Tz1zuBGCUuH0eB8Q+lc6VIKGDPu2?=
 =?us-ascii?Q?mlSBMW4cXjNqfAgUE2dIkW9cFkLPKonzoJG8OByCGvl0WqmYPdpD8ViW2SKM?=
 =?us-ascii?Q?ZWMW4+GabT0bph2XE9ohDLm8cNEJaj7Zi3vgbEtjLC9jmxQfTtPmrwJXvI3z?=
 =?us-ascii?Q?riAGJJiUdNN3/GR6Y8H+tZ8IfkbRBKeWfkXUB8ItLE/8DBf6avoXYETL4iHl?=
 =?us-ascii?Q?m0ZZaDmVhqNqY2zqgvAyM0gEFhRhZ1JRI0Dok/+51mux0vqPh5GL/RjtYhYg?=
 =?us-ascii?Q?+3cZj845/z8TZzYszodce92Cy7rfvH5DJbd45DnJgyYbiLyl8+mXCy5zVd6M?=
 =?us-ascii?Q?m4emrodDFxHEUsqMWfotqOUrM+ohpV6CvSMpLc/Qu2H5tsFMvH6sTHRCbTzc?=
 =?us-ascii?Q?miavDRdEDZ6zbKuRoifue7WudzonKMZc3QyVVX59HflrmvDpRkBuXC2E0yBB?=
 =?us-ascii?Q?H2S6iZFyrAjHHRqhn0JRSBXSyg5S6zeJBfEToViaFtjZEo3rvc88nqtbfVMl?=
 =?us-ascii?Q?mFecRPZQmGN9CxIGAJETcUg6Kzs99uDS/L9tFZAB2ioLE2b2j+5fMam3LvPH?=
 =?us-ascii?Q?7V3MBTtG75fXu9sKbchWAuXAlIrIfrjxBv9G4p85Li7ApWInzI7AKM2U3npC?=
 =?us-ascii?Q?dWit/0vMIhOeKrgX1nVyJb+vYvNrqCxJMYxDevGgrZ0fS7BvXjtiYDaTjjDA?=
 =?us-ascii?Q?hgvca7+gheF1F4H6sNmk2+H2PL61wGkGJhRkBJOAL22e4ggxQ7Wxg9h7Jdza?=
 =?us-ascii?Q?IJbWM0wguoHKSfbYHQnuNuiQWnJHgtNL4HA/4qA/63EU2q6zVFc34I4FeWZg?=
 =?us-ascii?Q?OhZoMj4OcUDFjeGZJQm80OW2VknPpYHwSA8WO4I5tlJ6Z5briVjPGyi/Z4Qo?=
 =?us-ascii?Q?b2upzO8xtV5y9uOMsbDzkzd3NPCJVShKamEdnCFkuYY3r0lka9dvg5eBmDVM?=
 =?us-ascii?Q?LOygBMD+5gE7izv+a1p+ljlcvunrizPg8tmdZQdpXI8mpS8fHcHEpuwlMg8a?=
 =?us-ascii?Q?5ce5j2uCvFozxkgmx9Kkds4DL3yZACRnY8Y+ZXkbprHt7eCI4w27DpuoxF+2?=
 =?us-ascii?Q?yJip8U2Yvtr51sgIf1cf75yINyQSmlNPvbcIRkpSAGBwzrM97JgoywUPkoST?=
 =?us-ascii?Q?m3yE6GMZUM6AemvHaxcPuLSF25O33F8/AF2eYAwNb/E+2K6m2LZz9qgm0Ocq?=
 =?us-ascii?Q?+XyzqoJ5LA2OkXhfU5E7Epk7VursubUdGsA5ymzbUWJMtTnBMPx4VOdcrdAT?=
 =?us-ascii?Q?a07A40AnVIiRnNIokRkxJM0eVjTopn83Dn/vmdeHq5yi3QgG7e0Vo+GHGWXS?=
 =?us-ascii?Q?LST196w86hWMtK0b/ukB3U0bIoyzYDY9bsU3B2xHeydVnohmRcT99VDF1uoe?=
 =?us-ascii?Q?IjBQ5KX3ysSO1WR6LN9Fmftx83cxrm7Y0kyjjqVZ1t8FF1pgJqFheo2915tf?=
 =?us-ascii?Q?XEaZ0zVd5/eyjfJb/lWPJVAw/KX+1qEBfSIFU+PIwSR5twhniwq1vDETqwYY?=
 =?us-ascii?Q?62k98wGt0YHHYOqR6V/jvgG+HXxHFLAV2eNKqS2aslCTwobueBCpw54KWrUJ?=
 =?us-ascii?Q?MgwcMdbCY07ZIobaLFFCkPPvKhBjXjjhHdS3RDpor3jwfX7//FglAF5k3+OF?=
 =?us-ascii?Q?K4FTKiN7octUMpbYi0+gampSFvVggVhMJHupgctJrz+w?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?qgsJnc31SBELwqRMHL1PttMPGpYgr8VWV14PnGkGOAulX36aXU9BSnX8KuIB?=
 =?us-ascii?Q?vJ0zBKmiKDSydZZGRpOYd+BqCfTXs2n+sqtZe6MrT6Yx3scoq7t5Q1dPMY35?=
 =?us-ascii?Q?dpDoZ4fFwNPH4xjy+ueY5IbZECj7JbZOrmlLuGMKudYz5VAiYqG7w+ErjoeS?=
 =?us-ascii?Q?xvxchiq9t+/vvzeWbahuEwu7c3ByvkLEazUyf53085erZ+H0NJZ6JvTvVkRv?=
 =?us-ascii?Q?e2cgARKvyUOpT/1GZAealeDMOQk51sm55xKfBMZifnS1f8E7KlvJWdmI6mXC?=
 =?us-ascii?Q?Kr/MfkopI0RgFxUhREBXUUX4gtRmphmstNPrvVjXJbi/l9EfDua1+FuHohyZ?=
 =?us-ascii?Q?t+877fP7AUfizQyIoEfxjwavNARU/akZqPqHPW8iI4zm1gONi3aKLe9q7Jys?=
 =?us-ascii?Q?+xQawUM0MeWV5BalkE+RtHLqAT0qHdlX3kYyIZPPLrSYEfrH2VuDYAFhfAg8?=
 =?us-ascii?Q?AIRIlnONheZXns6bA7arYYAg7UkOmfPh33zGseal0JPB9P36Xkwmb9QO+MNO?=
 =?us-ascii?Q?Ju1B/lXY4Oya0Yxk4D/kYmGyVDEwoQLr2UX6k0tuEI5drtLrDx2TMp1w0LSD?=
 =?us-ascii?Q?Idv+p/oxBE1NG3R4q1I5vfD8h+m1TsAcWloVQOb7CWxjn3gnfhdID6XI6pOG?=
 =?us-ascii?Q?F99SNQ5D6KVWjyguzAvGytIYra/KiDQDmUZ49CJS2iWlMOr4MHMcCTRpxBtR?=
 =?us-ascii?Q?VfYOnxACEVy2aJ3DA+fIrUR/Fl1iiHX6occAMKa24GZYWaomeMBx3BPi+aMA?=
 =?us-ascii?Q?AP2S7+IZ6m0dlmayUhX6mKSfsz0O3r2wtsr3nlGjmZsjhpkMh3F5NYjCY+D4?=
 =?us-ascii?Q?yIPA19Lj5xb56Coo5nH1VPQRGG14IWzrkY4UdwvC8wsh7oICF1JqPmfroO5I?=
 =?us-ascii?Q?KIPCY99O3t1v9txQgVhhZG3YS8wZyMYLgvs1dV/6iCEtti6ybGDNxWu9EID5?=
 =?us-ascii?Q?BMIEa1CdvGr2DzkFEz9jmVQPyp2gfnojb2LzgutBD1nN5S9/fN4yzAIQItpG?=
 =?us-ascii?Q?ABNVfUAH8SjxNo2iRFLdF6KOReBYho3P1K/yB21hO2xUjJ1IsMV4iruYgT9S?=
 =?us-ascii?Q?4UaBoPS1wB6L36l7h6zdN+iS/dUULLX6GIDPrJtLF9pZPvHOrVa2SSsJ+T4j?=
 =?us-ascii?Q?xoUEs4fhYOTJcQJIK1/6WqsoNcRvYxNLl3lPA5OGrjkYmSq5Gpl5a9S2wD2r?=
 =?us-ascii?Q?LXERuIY6fJ0bYBR04DbCY10A3/Nw7h5pDtvzSOMsw1mKIbinbRs6/zJTepIB?=
 =?us-ascii?Q?ej6FWK/YLAUj6q0SW0zN3h3Fzu3+wa9HYoRiDtoFfQdmHxISSExo2hUk76kt?=
 =?us-ascii?Q?v2vXRbmfcTaKnsE999rnolgoA+K878JJdhBctU4T36Y37fOOP9zShf22Vazw?=
 =?us-ascii?Q?Z9LOIbcvB1/xnAwHjqwJSK3GQ6UQ6EicY+t5NJaEKX6K8zbjjYr5AUPxgAia?=
 =?us-ascii?Q?cJkmWlhIlut+alESvvlmzkmkcand/6m/a0FdCiplxFGjXEPtfG61aPBfR4GU?=
 =?us-ascii?Q?OpBSWltgUCyIPl1C03apnFJrVhYjAio5COJOAAiYGyNJ4E46TrMDvO2eosDu?=
 =?us-ascii?Q?ke2YQ0+ZQGqkWOgnC6raJiovifREG+a4BCH1DHKbsZZp1diQy66jsA+5XVHm?=
 =?us-ascii?Q?CNZVyV5mTWXWRyXvAOECYHX+L1YXM7iJ09Oeu6dTJ8GG8z38mdzOvF5EPK7T?=
 =?us-ascii?Q?vinmgNytZsp0rdw5hkKTvJ/RJIJg25zRv6Ch9OxOlXNcaWTwkit6gED1hEhZ?=
 =?us-ascii?Q?9sv6mbeOPQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0e018e7-855e-42fe-33d2-08de5a4b6d0a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 06:48:33.3393
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CsuBBHVOCyeT4CFcRJeyGQNdp4/LYTEfCbpaN9OqFhlrpBXz+0iLVhmowKw8gyO6Z9LZ15vsmVypwwPJXg+pHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6925
X-Proofpoint-ORIG-GUID: 1pQayb6tdutrb5eiBNriSlrSNYmg7ndF
X-Proofpoint-GUID: 1pQayb6tdutrb5eiBNriSlrSNYmg7ndF
X-Authority-Analysis: v=2.4 cv=U++fzOru c=1 sm=1 tr=0 ts=697319c4 cx=c_pps
 a=cXHsTeABgwIgPhuKzetQTw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=mDV3o1hIAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8
 a=F-DBt0akDBidK83N59EA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDA1MCBTYWx0ZWRfX41n5yXJHC0HZ
 qnYlCaDYahIxO6kItrCkUkZsywVMecBYZGkYZ9JcH3zsTRd23kulhuxZE2KlNgvlhBVAta6YEBQ
 MocRwEQpm1A+aeuYYYyo9xQSQ417nEmfdtv89z9DjrVOzAp8j0E3F3Ts5U99EgdvPOCLAGmzkYh
 hqZ7nMtkUdXDLxx/e/1DkQ5m4Ok6OTRelcUVGd9jPomO64wygZ8zKU7x5UJNPSXoXDQi3xPWVRT
 ChFegm3BarS7kIGB/X2xntV4zxXak0/GFReq+s6v+beBW4SonSd/zdXqL170CELanlmW97ZVCvT
 VGwKzjE8qJTMFYyzArnGihbtaRrw/uy5EhFz4JeuMEJqIeSRRInPpR9xCWiLcctafpJi1L+WpR6
 ahvTPJHWDynC9JSH37x10zf+/ZrCTy/Es2XnC0ShJn+B9GEhpIen2zh6Fz94XRS6wGEtnp4neHN
 Nf79Z7kkh9ySrlrXGeg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_06,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601230050
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Jan 2026 06:48:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123769

Onboard is an onscreen keyboard useful for everybody that cannot use a
hardware keyboard; for example Tablet-PC users or mobility impaired
users. It has been designed with simplicity in mind and can be used
right away without the need of any configuration, as it can read the
keyboard layout from the X server.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...ine-error-API-if-platform-does-not-h.patch | 69 +++++++++++++++++++
 ...overclick-use-bin-sh-default-shell-i.patch | 29 ++++++++
 .../onboard/onboard_1.4.3-9.bb                | 39 +++++++++++
 3 files changed, 137 insertions(+)
 create mode 100644 meta-gnome/recipes-support/onboard/onboard/0001-pypredict-lm-Define-error-API-if-platform-does-not-h.patch
 create mode 100644 meta-gnome/recipes-support/onboard/onboard/0002-toggle-onboard-hoverclick-use-bin-sh-default-shell-i.patch
 create mode 100644 meta-gnome/recipes-support/onboard/onboard_1.4.3-9.bb

diff --git a/meta-gnome/recipes-support/onboard/onboard/0001-pypredict-lm-Define-error-API-if-platform-does-not-h.patch b/meta-gnome/recipes-support/onboard/onboard/0001-pypredict-lm-Define-error-API-if-platform-does-not-h.patch
new file mode 100644
index 0000000000..9fb2cd6814
--- /dev/null
+++ b/meta-gnome/recipes-support/onboard/onboard/0001-pypredict-lm-Define-error-API-if-platform-does-not-h.patch
@@ -0,0 +1,69 @@
+From 71804c06c7179333f44b57e04ba268f37fe54f62 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 13 Jul 2017 09:01:04 -0700
+Subject: [PATCH] pypredict/lm: Define error API if platform does not have it
+
+error() API is not implemented across all libcs on linux
+e.g. musl does not provide it.
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Onboard/pypredict/lm/lm.cpp         |  1 -
+ Onboard/pypredict/lm/lm.h           | 13 +++++++++++++
+ Onboard/pypredict/lm/lm_dynamic.cpp |  2 --
+ 3 files changed, 13 insertions(+), 3 deletions(-)
+
+diff --git a/Onboard/pypredict/lm/lm.cpp b/Onboard/pypredict/lm/lm.cpp
+index 2e642965..37ae241e 100644
+--- a/Onboard/pypredict/lm/lm.cpp
++++ b/Onboard/pypredict/lm/lm.cpp
+@@ -19,7 +19,6 @@
+ 
+ #include <stdlib.h>
+ #include <stdio.h>
+-#include <error.h>
+ #include <algorithm>
+ #include <cmath>
+ #include <string>
+diff --git a/Onboard/pypredict/lm/lm.h b/Onboard/pypredict/lm/lm.h
+index ed4164a4..b8b63ee8 100644
+--- a/Onboard/pypredict/lm/lm.h
++++ b/Onboard/pypredict/lm/lm.h
+@@ -32,6 +32,19 @@
+ #include <algorithm>
+ #include <string>
+ 
++#if defined(HAVE_ERROR_H)
++#include <error.h>
++#else
++#include <err.h>
++#define _onboard_error(S, E, F, ...) do { \
++       if (E) \
++               err(S, F ": %s", ##__VA_ARGS__, strerror(E)); \
++       else \
++               err(S, F, ##__VA_ARGS__); \
++} while(0)
++
++#define error _onboard_error
++#endif
+ 
+ // break into debugger
+ // step twice to come back out of the raise() call into known code
+diff --git a/Onboard/pypredict/lm/lm_dynamic.cpp b/Onboard/pypredict/lm/lm_dynamic.cpp
+index 7c628240..e7c7f40e 100644
+--- a/Onboard/pypredict/lm/lm_dynamic.cpp
++++ b/Onboard/pypredict/lm/lm_dynamic.cpp
+@@ -17,8 +17,6 @@
+  * along with this program. If not, see <http://www.gnu.org/licenses/>.
+  */
+ 
+-#include <error.h>
+-
+ #include "lm_dynamic.h"
+ 
+ using namespace std;
+-- 
+2.34.1
+
diff --git a/meta-gnome/recipes-support/onboard/onboard/0002-toggle-onboard-hoverclick-use-bin-sh-default-shell-i.patch b/meta-gnome/recipes-support/onboard/onboard/0002-toggle-onboard-hoverclick-use-bin-sh-default-shell-i.patch
new file mode 100644
index 0000000000..b4bbe7c023
--- /dev/null
+++ b/meta-gnome/recipes-support/onboard/onboard/0002-toggle-onboard-hoverclick-use-bin-sh-default-shell-i.patch
@@ -0,0 +1,29 @@
+From d68300ca8c7c518abd404873a8201b71988e492d Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Fri, 23 Jan 2026 09:28:56 +0800
+Subject: [PATCH] toggle-onboard-hoverclick: use /bin/sh default shell
+ interpreter
+
+checkbashism reports no issues, therefore using /bin/sh instead of
+/bin/bash should be safe.
+
+Upstream-Status: Pending
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ scripts/toggle-onboard-hoverclick | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/scripts/toggle-onboard-hoverclick b/scripts/toggle-onboard-hoverclick
+index 7ee3b024..48636225 100755
+--- a/scripts/toggle-onboard-hoverclick
++++ b/scripts/toggle-onboard-hoverclick
+@@ -1,4 +1,4 @@
+-#!/bin/bash
++#!/bin/sh
+ STATUS=$(gsettings get org.gnome.desktop.a11y.mouse dwell-click-enabled)
+ case $STATUS in
+     true )
+-- 
+2.34.1
+
diff --git a/meta-gnome/recipes-support/onboard/onboard_1.4.3-9.bb b/meta-gnome/recipes-support/onboard/onboard_1.4.3-9.bb
new file mode 100644
index 0000000000..d544f169f8
--- /dev/null
+++ b/meta-gnome/recipes-support/onboard/onboard_1.4.3-9.bb
@@ -0,0 +1,39 @@
+SUMMARY = "An onscreen keyboard"
+HOMEPAGE = "https://github.com/onboard-osk/onboard"
+DESCRIPTION = "Onboard is an onscreen keyboard useful for everybody \
+that cannot use a hardware keyboard. It has been designed with simplicity \
+in mind and can be used right away without the need of any configuration, \
+as it can read the keyboard layout from the X server."
+
+LICENSE = "GPL-3.0-or-later & BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://COPYING.GPL3;md5=8521fa4dd51909b407c5150498d34f4e \
+                    file://COPYING.BSD3;md5=f56403ae5b2d6b82ad136d753c05a82e \
+                   "
+
+SRC_URI = "git://github.com/onboard-osk/onboard.git;protocol=https;branch=main \
+           file://0001-pypredict-lm-Define-error-API-if-platform-does-not-h.patch \
+           file://0002-toggle-onboard-hoverclick-use-bin-sh-default-shell-i.patch \
+          "
+SRCREV = "350f7643576bc8c5f2cff9c6ddce0e1e7cff995d"
+
+inherit features_check setuptools3 pkgconfig gtk-icon-cache gsettings mime-xdg
+
+REQUIRED_DISTRO_FEATURES = "x11"
+
+DEPENDS = "gtk+3 hunspell libcanberra libxkbfile dconf hicolor-icon-theme python3-distutils-extra-native intltool-native glib-2.0-native"
+
+FILES:${PN} += " \
+    ${datadir}/dbus-1 \
+    ${datadir}/icons \
+    ${datadir}/gnome-shell \
+    ${datadir}/help \
+"
+
+RDEPENDS:${PN} += " \
+    ncurses \
+    librsvg-gtk \
+    python3-dbus \
+    python3-pycairo \
+    python3-pygobject \
+    python3-image \
+"
-- 
2.34.1


