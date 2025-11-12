Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BF48CD13DD
	for <webhook@archiver.kernel.org>; Wed, 12 Nov 2025 14:54:32 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15251.1762959269636696785
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Nov 2025 06:54:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=joXtEz03;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3411d85ce0=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AC53dYQ3492130
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 14:54:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=bICagXpfsEdZeYjvWOJLD6dHbcQLQSOJo896Jg5AKsc=; b=joXtEz03puSW
	89FAn1AUksw72J5yrzOIr8z/N1tyBkNBdNoLAJU5Gxi0URoVAS/nIDRod9hry3Zl
	M4mcV3nEBuKKQdvjTo4szPHzSEUh9ekF3S7zo+/VesTndsJKVJ1dUGeSNf05aofL
	J9ivfyRP6p3A1pvHbouBO/RrYtl2Brxl8WPDrNCeCKXIygzv95U+pXrHRpbX1TZD
	GaMouAqyQB2chgUT6KM/hlYCm1gVzV5Mw0eZDwuYib4yoxNa6t3uGAhRV4L013fN
	6u2kynAfv3UMjJpYY7SBzCEZq6XbsN54vhp0/B3xXz61f8bwudMeuCkwR+o//hI1
	OHBVHVTQVA==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010056.outbound.protection.outlook.com [52.101.46.56])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a9u2x5fvx-3
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 14:54:28 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QZwDjGUqDoj8AcbzVKVFyPzJdQ88HR+XB9bGw3YOXYt5BUil1sFLCVmkjP5EliOIkpFLym0nK0rWjeIG6N+YzxbsXXFJE8ux/3Ly8dphiZUxuDL18PpmuYsUyIAI+g2QgQCDG+CiR+inr/vpWE2ucZ91qun+2pEgUXVxRcL5oqKbzAX8zyyOWoynWTThwRXXIzXkw3uRJBYi5/iwm9RxOdDVbFnHtxQkAICxCnVg7fSPw0oRT/RcnegV0VlniyHVMp6vFiK3fZqcfPo7Wl1voo4YdPMtAocQC0S4tC2CH2XAILKfUqMoi91WP6kG2YZjuW6HTo02+Kr1vOOwppLQ/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bICagXpfsEdZeYjvWOJLD6dHbcQLQSOJo896Jg5AKsc=;
 b=F1wyqfdIAqeirzyXiLCSmSad2Vbv+zSKJ23MjkBwWtRZYg5FQdnSjE3H6JKTlp8YiI8ASNL/zLU6ji4C7N/AUY1YoCA+dUD0w9BXF1PYSabgkgPH6uDbkJuRiiIonW7fUx9aGIsOZY1sWhDth5s+YwcMyd+HrnutzYDrWYDAyWrqlBvZvRpzu5ZJo7Pz5eOiXqLyUlg8FdyUnIDcxxqdYKLYagPV1MMESOO03haZHr2C17UkfVsx+6FXw7pVQkZVEuF3uhi36cMU6860HWk+Eg+Kvu1yY5dhzmk9B85mFCF+gW3oyLc8v0aEyQj1MKwsyHOpqtyu4qVP+NvEb1m1FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 SJ2PR11MB7598.namprd11.prod.outlook.com (2603:10b6:a03:4c6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Wed, 12 Nov
 2025 14:54:19 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 14:54:19 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 04/11] python3-paho-mqtt: add UPSTREAM_CHECK_REGEX
Date: Wed, 12 Nov 2025 22:53:50 +0800
Message-Id: <20251112145357.3788595-4-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251112145357.3788595-1-yi.zhao@windriver.com>
References: <20251112145357.3788595-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0128.apcprd02.prod.outlook.com
 (2603:1096:4:188::20) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|SJ2PR11MB7598:EE_
X-MS-Office365-Filtering-Correlation-Id: d2b0e135-8674-4a51-02b5-08de21fb5b95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ANU43a8HHewFPRLTyV+jIoClYhcxWPIyCUhpwbvneG2eQYuwK1dr4Rqi+GVq?=
 =?us-ascii?Q?90N7c1Sh92s0au60NBOcThSNgn/R+kQ3u2lJnmWlHaId4MOwJXC769sQYjFL?=
 =?us-ascii?Q?KQT/oYT2L0v9qusqBoNxAI72d38m0xXHwmhlxsafhy9Nm7ATKCDTiufYAdIZ?=
 =?us-ascii?Q?SoLZpm++C54vqYSXKWWPaOiwdMvZbwuM/mhAgdhPvyt0ACfjhq49rXb/kK1u?=
 =?us-ascii?Q?OuRKY8tceLgueNWfcKBT8GC8giyczwqDCOP4cQBBjyQLb507LcBSurPap1y9?=
 =?us-ascii?Q?uDNU7AlD2vpCWCOCc4mjpqG0u4Vpl1FkLCQkxcs+DtuKlD5kRDI/ORzgNiHS?=
 =?us-ascii?Q?Fo3APCT1sB7CjL1xoUBilHuPKaqt8AJfiOn4PRq1B3GfRKt8PnbkHwbSITXU?=
 =?us-ascii?Q?FOtoNGdasP2KK1oZSbTDtl6xKF6NevCChf2nOKEEIWoidMd6hBwwl2XU9THF?=
 =?us-ascii?Q?kYXzNe7Ym67M14QkCbpEMcpVtVUmZgPF8ISbZXErie0uVKu58NYRqS9NjAKS?=
 =?us-ascii?Q?8CdPOONJ9qaSdlYT5ag7viFzzBBRJTQMdv+HpW+3/dya8R3pmLFkL3O/y/Z5?=
 =?us-ascii?Q?FMynFvXgIo+A62ZmVCxFsxGqBiMcBjXEROHUs8oD6Td3C7ybceOq/Hd0MWac?=
 =?us-ascii?Q?enUDdFFwpkuCeE45G3c+MpDzfIXzMpHjF1h/4WLiryikjXMxbGXSX6x4RJhi?=
 =?us-ascii?Q?E9UslYrSYZxfApryep0+F+jtbUu/T/loP0QztZm+NaWYOtv8GorWZ0nYOh/W?=
 =?us-ascii?Q?j7/pR8CuPUXX7jlp/kgV5tnSf2iBFwQHM3PZgWy32lUDB2AQseaJsOo7hFtx?=
 =?us-ascii?Q?Inbd5Nl4brleeu2DAcZxbPa2irUgMaRQ7xX1ZJvqygNDvStlQg0ciyl5buje?=
 =?us-ascii?Q?cEGGHl/ma7H/6kQOlJxEmXDjKb9c/B63dsntMOL7Q9VBuNDPEuvUzJfpyY+E?=
 =?us-ascii?Q?oWdjHXdLYxAndYLjh+ABFNHgEz834Sm5/VKYl5d0HUustubTZsCSAQKylWHy?=
 =?us-ascii?Q?cexvUv+04lT31Xvu5f+6uLXgd3D+W1fYzlZNyK/N7tJ7nRGLJggxLYmVVNdR?=
 =?us-ascii?Q?bG6ZcTxB22OJJB64zBL3ZEa5G0eOubE7KItj+9GpkVGBbdV/W3G7a+9WA2xV?=
 =?us-ascii?Q?buZhbBdM6pag9UloAITamSkspG0dbej/Gh1UOzC5fTyPSJO3D2sBZRSrCtzZ?=
 =?us-ascii?Q?XnofEzTeK1ocOwP0H5iqPlH+4hI9C/540z+B12So3M8eWreWQ19lg/TZpd1P?=
 =?us-ascii?Q?BFYdaTRt3RPg5iy5KCCP4ybvE5K0nM602SuocAqJQPa4LWrKIbIwQTuBKX7w?=
 =?us-ascii?Q?5HGub/WP2Xk4JJHBjQ3KnlJEgIFTZVzFXF6ht1CeAOAT4pC/tSxIAp94z7z1?=
 =?us-ascii?Q?Hs7cbUcFstQLE9zk2tyiHuDtE9iOqUNydnzkK/l4y7PY8dycQGlgiR8kCOuc?=
 =?us-ascii?Q?iLo2DER488qpzGidHoFyjBa5i/DDDi03ejOrHcoYxGFGZpDCGxOv96R8tnPO?=
 =?us-ascii?Q?hA54zhR1fbk5Lgt2RH2qSjsvIoy1Va5DmL5b?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?tB8iT9aRPPx025yIF5GsKDMTYpEd5kOSnMPsdG5uLFwjAT4mZw0qg6yfxKk6?=
 =?us-ascii?Q?knw3fOIT8G1YWHW3yXiuy+Vpf5rjgcy58UX3fJILFk0kx8JPUywprzrjieyg?=
 =?us-ascii?Q?reoaenAlt42bTFae5WPFArM6V8c+KEDAMdTV+GJB/MgDzXWGA4Mj4EXLMuEs?=
 =?us-ascii?Q?N6zgl2r9Z8qF51tiVTEBJ6+41lUzi7ykrOnLEUDoHWosNi9gfJDK6zh/rEy3?=
 =?us-ascii?Q?MN8yT63ZQhKr0u1jYkstNYBDLqwP5jaB/xKa4nsjha1E2nSJ/L9hzw13GA4Y?=
 =?us-ascii?Q?JHwI4SRLwdTCupvPxr3pKAEa1UbOgS5y8L0Fzq3fftBAsha0jZyPxDz2dMQM?=
 =?us-ascii?Q?spvwuDP6rJLZvqqk9Qq9PLdjCHk4NAPxZcMUiJqbswjIskuKtggczykl5+XX?=
 =?us-ascii?Q?PK+D6c6uc00KS2YfHtPRGj6Y8s0yCJffh+JUo8xuO6nLj0kbeek21+k1lHD1?=
 =?us-ascii?Q?AGLpZgF3+vqrrwxP8JWqU726l/nhu4ZHixl/68WNHzfqgsxgRHgWQWW21Ue8?=
 =?us-ascii?Q?AvkJbOX06Y2GSRhIRjcVQzocKZRMrE3mUdfIyjt40I3nGXywOnmBQ0+/XzwB?=
 =?us-ascii?Q?RrTQnCtcGgDmizkGFrUDfE3W6fBD/G8s1ufP56yo4jRBzWenjSWFoYhEy5Or?=
 =?us-ascii?Q?rDAbiOHArttyR56XtOQvAc/Pz0CGAzID51LD46SYYzCAzO+2pZVedBBB2BjR?=
 =?us-ascii?Q?BrGqd8LxBZBp5VLoDttro34ntVtescxtDl4AQX+JyALYBXEIVZ/YrxeYL5Ex?=
 =?us-ascii?Q?gIrDIQ1ykCdxgrbpf83f3bMoFKSWMKKKRfFaBFyjmI7OeOfqFVW/uMBXR0En?=
 =?us-ascii?Q?9EmjggwTE0iTZDqVWtOds2lYfv9lhjGUd+yJ7J9j3XP9D8ypdoAjIvyOKckt?=
 =?us-ascii?Q?Y+VxfTaNzdJxZKkzi9ncdPKi68cS78tk9xIEvEAorA1Q5tfdUycG6VUKjFSr?=
 =?us-ascii?Q?eewzmEen8MvO/LgoeMLfmcw9FnEF0hN9IG9TFk9jA0Vufj85ALMsIvl9e/Ew?=
 =?us-ascii?Q?CJ94FCwSkjvVZCjKl/31CQkh7Nc9E3IjyT2j5pcmCJTFLnxfZjLHIA2Tmbvm?=
 =?us-ascii?Q?1+V2/S+9z6WMNvVvdtnF3cUCEHvOg4/tC3YGRwhTGFvucA4FCvyTWRL+f2j9?=
 =?us-ascii?Q?WttBCjzsOjRXMLy3lFmfTa7BQUfXCxR37Tf5CDgHtzF2dH4aMWxh7w2/oJBQ?=
 =?us-ascii?Q?3dPGuk3AQXOE1zJycmkHMRjbtf/Cdmbo/fwyBcAVsVAqvn2EeosN0S84oQcz?=
 =?us-ascii?Q?Zj5wFr8Gbtbxpw6wnNKZU5v/2767KGSIhCIutLVRny1Je43Q8S4tMdlx65I9?=
 =?us-ascii?Q?oKnc0Iqmwi3PBdmKmDeX17OekWOduvYBHOMBHan4VWKu7iJA1Vjb9V2ygfUe?=
 =?us-ascii?Q?L0yOtAsMF4fRiZbb4Vhg2BnKJBeSYNkyTENib8r7o2Ncz55hIfbtrpTRVc+a?=
 =?us-ascii?Q?LRXeFBxCj7t5euDq2UvxTlSpEjjU/nHUsTY3ZCKsFCRHBXH9udT953f+VfaD?=
 =?us-ascii?Q?H9Yz+jrCI7oNZTjQ65QZ+Siz6aUqJwvTMwBseuIb7yRYW57TutwrGq0IJcWL?=
 =?us-ascii?Q?SQZW25u4+D8fituMlPmFb1YUBeBk27F441v9mRnf?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2b0e135-8674-4a51-02b5-08de21fb5b95
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 14:54:19.2156
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y4hqPEpDMpaWO2BiRdJCWcY8KXvJDMAM/tFn3tI4101hoUK1D8BLMtnkdK7ZCiiBVAd+sHiAGleCIR+QuEcHSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7598
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDEyMCBTYWx0ZWRfX9HInhLrr4pAa
 nJSI4gda6dXxE0cexO8WqrzEnESSKA9J5yHY3mzC0Eyx8c7zb7tdAEHn+gJ0X5Hrqz+uw+bJGC/
 s7TXkFslRczjARQhLRkMejYsaJo7w2ViiLIzhZF1LUX49VLZ7FkP4Z/eYt0+R59qh5Fl3O2CRSY
 vDjpIB3qquRDRGhZwZw/1zRC4eVqt2G/LvfUawGsad3ANZnO5QRbX1PDzpTepiOBQHxkdkA7DS3
 6Ev43Dz/4R7ffQ/QrPMsmFe0U6WmaD0dii8STp6dtIiTr+wHe6Q5BD3WZ3zHWR1Yq40XnJAtT4U
 KRC0l+OxHrKXAbxCbw8nc2dJZdiEh1tX7ZwSE4FYijOa645S+lmei6MrWo5CyToXV2nIP9DC2li
 Qvy3fySxz+eI2lZwhGPODgk6L2xbEg==
X-Proofpoint-GUID: qU-g4C8QOxZeIVSClWCWuULLlynkoSxd
X-Authority-Analysis: v=2.4 cv=Uvpu9uwB c=1 sm=1 tr=0 ts=69149fa4 cx=c_pps
 a=0PDhd3HO6khzWhHQYbQRQA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=HbzeB9StAAAA:8 a=t7CeM3EgAAAA:8 a=9kXZMM3XHxg2l0ZskGoA:9
 a=i9oqPCtDvve8OcjLCTCP:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: qU-g4C8QOxZeIVSClWCWuULLlynkoSxd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_04,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511120120
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 14:54:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121552

Add UPSTREAM_CHECK_REGEX to check the correct latest stable
verison.

Before the patch:
$ devtool latest-version python3-paho-mqtt
INFO: Current version: 2.1.0
INFO: Latest version: 1.6.1

Before the patch:
$ devtool latest-version python3-paho-mqtt
INFO: Current version: 2.1.0
INFO: Latest version: 2.1.0

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-python/recipes-devtools/python/python3-paho-mqtt_2.1.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-paho-mqtt_2.1.0.bb b/meta-python/recipes-devtools/python/python3-paho-mqtt_2.1.0.bb
index 86cf034394..1a9223a9cf 100644
--- a/meta-python/recipes-devtools/python/python3-paho-mqtt_2.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-paho-mqtt_2.1.0.bb
@@ -11,6 +11,8 @@ SRC_URI[sha256sum] = "12d6e7511d4137555a3f6ea167ae846af2c7357b10bc6fa4f7c3968fc1
 
 PYPI_SRC_URI = "https://files.pythonhosted.org/packages/39/15/0a6214e76d4d32e7f663b109cf71fb22561c2be0f701d67f93950cd40542/paho_mqtt-${PV}.tar.gz"
 
+UPSTREAM_CHECK_REGEX = "paho_mqtt-(?P<pver>\d+(\.\d+)+)"
+
 S = "${UNPACKDIR}/paho_mqtt-${PV}"
 
 DEPENDS += "python3-pytest-runner-native"
-- 
2.34.1


