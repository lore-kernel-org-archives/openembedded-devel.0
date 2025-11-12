Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77AC3CCF9E3
	for <webhook@archiver.kernel.org>; Wed, 12 Nov 2025 14:55:12 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15465.1762959305617358380
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Nov 2025 06:55:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=VQ8XYmw6;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3411d85ce0=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AC51N5U3489586
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 14:55:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=ulzx9cIheIa0VaZvB4U1pzRzQerDeKKQl9ZIGKXuwOA=; b=VQ8XYmw6QBfD
	A4pHjB/9PWY9A/sJetrd0m4pA2xTB0q4sPARRaA3abevUnaSGj11klBaEwdNaiJE
	QmVQjNXpYkmCM64Uh8PrD/nlCbQ0/i20dDnoAzgtf1ONCKEWLUUm3cNaPP1QONxy
	LB8kQ29JNBOf2r/KNGGBqsV1am0fLXXbVL7tvtu/8exTZ/u8BkhTZjBkmD716Fep
	1yvIUpEjKRYSi3JER2VpuGQKe6tGiesKcJecLbMdeV/e3rO0t6eXnWhTOQTJtetD
	M8bRmIBLjui6tGpcpvm2hBhiWhC8yznsWTYxrNJX5IkZsksM3iwXyzq/OiwM4vXv
	h21PisCqDQ==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010034.outbound.protection.outlook.com [52.101.61.34])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a9u2x5fx0-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 14:55:04 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q57QkSPqXpw4fO7Nh4S9FTf8Ck7LIfOO9SOArHdGIK7T/7dmRSOMPUE/SCxbXKW8Hx7lNXxdE5XTAHNsNCDEEtyg1GL4v4Lt1mcISi3kRSub1r+JNRMQMxNYHlM6u4ooCZiSrVVwjQWd5FdJCB0xnpCUeJ7Ps41Lu5iy+U3ZnpPK/aeIU8J9NIbOXr3YG5gCN1ZDlTUPkol2Wu/aKjkhbsDzY/+xQOiRMhbh3DAG82zgpaY5AkEd8D9+Sd0LfXAFmI4MvbKW6XamnK69gAtwEmQYwB+a11T/4dLoyEDbLurEoR0sRA/H1j96jlwgprpx0JJVYWZwsPnhwiXJaTbV9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ulzx9cIheIa0VaZvB4U1pzRzQerDeKKQl9ZIGKXuwOA=;
 b=hLTFrOCaYhBYelVZEgpE5YmNbtXowYypdgqGRE6Oq2pF6UebXride8zPICoACVrcOfZaK/rkwf81FwqvCbeJ8VC+h4eK0gQaT6HazsR5PeQgGnt4B87PEb/9mV7QGMVEE/lrOn+DUHoxVxUeMx2QkOgo9hrtLD+ROtdzGBLNjQiGnP1JtgDbp629c/bg7isV2PqHfT5X6VpgP8B5mtNZOqjdHdpWwaT8T591f9hQp2PNR3Estyx7eZ1AtLiTHk6ftEyisfgHOdk5keDO3CTGYtvUCdVl2Yzl0GJoIIgmvbk/qF82uxLvCnvkUL6so96vYgT+XDz28Z0mCh4M+WVSyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 SJ2PR11MB7598.namprd11.prod.outlook.com (2603:10b6:a03:4c6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Wed, 12 Nov
 2025 14:54:32 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 14:54:32 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 11/11] python3-types-psutil: add UPSTREAM_CHECK_REGEX
Date: Wed, 12 Nov 2025 22:53:57 +0800
Message-Id: <20251112145357.3788595-11-yi.zhao@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: d871c0a5-4128-4b23-1a9a-08de21fb6302
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?+nFyrp8XWwqppxPE7QMe4F4LDYjax8PaRVJIhswlhA08jKV4t6Bjrn8MwfUW?=
 =?us-ascii?Q?rBZIkqFL47nOfOrIhe/8emhdbGF2qER2p04qCrpkd1NcaYRQEpHskncj42Ka?=
 =?us-ascii?Q?IBBdcszqH0Yc4L8xI9M0F6AV3c0dUB4hu/1z1bZTd8A/X838NJC9OIqbYGZ4?=
 =?us-ascii?Q?fsXcQWkDWaf5IM6YN4cWKIYDTEV8i59/ZQN0Qfl48nUtyCGTr7EUdzdVysy2?=
 =?us-ascii?Q?nXutEvmK4EzQBnjSf5lCWgA9CLz9hJUjh842nHZcosLI6BRxWipeqHs4FfCJ?=
 =?us-ascii?Q?WYnIekbLZN9uOZ2JanVEwHJ/8YQ4661orY6uBb7Hgi/SRAPbtJVcYDviGxhv?=
 =?us-ascii?Q?dO/SGmpfBI8q0J5PGGJh4reKzcwrEKlfOtomfbRpzPeEvS1TFT9HeUiGS45f?=
 =?us-ascii?Q?zIMNL8B++3HHb5+SqqyCq0H5F/uvgBHQXVhfJLB6kvfR2xjnXWksIwbpmftU?=
 =?us-ascii?Q?NvyEvTle4tspOx+VvOuJh+JhzzirYOxI+fuXryhGsy1zEoHaNlFSL9QSHmB6?=
 =?us-ascii?Q?ZJHkS/AUmacGYS6yBW3t4DOPoC2ahCg2ctWvnbAEduAJ5j3G3is+J8YEvdZ/?=
 =?us-ascii?Q?Xv2zIpK3LHSnK97aUR5/bzaB//+OPy5j0C08QMVLgC34LhsjTadiP1uANr/k?=
 =?us-ascii?Q?LVMd6n4I9I96eFNBgaToAfMGEOg7XjE8vlo1e/tfIWEX6+O/uzvy3gzRsoXL?=
 =?us-ascii?Q?K0GwFWqYGfPtoddneSfHaerhYjlQEtd05JbGYkdPJ9x157oF5CfaugG84GRs?=
 =?us-ascii?Q?kwELETULTewWAYx6Mje1+wLKk+DQrNfa1FHlRIxq55sc7ZGAlkSM8ahJKtau?=
 =?us-ascii?Q?BzXhuWaoomI27rEIbVEDdpuP2UIhJ//u54MFaceCwz1/Eqm818sC7YqKA3OE?=
 =?us-ascii?Q?1A0PJlg5r+/bcbimgc4BkAEfXFYwUoDCABzgQOn9dTxJM5IHwl0n/D7hDH4h?=
 =?us-ascii?Q?x8vUrC3XN3ZXPHZeKV/5yCYdEah7xCeZ4NkHQlszZQIJyBxBVaeyGDX9nzp4?=
 =?us-ascii?Q?9g3akI8M0s3ySef5ynWKjNVyDyLlQ60Uie30I/7oo7KCee+SR8A+5/IaveT4?=
 =?us-ascii?Q?7fss5dijNDd+Sd4rR+Y2fKlUNVe3Tj9jwTRD/lXZ8hGnCjlkO8x1wqJ2R+uO?=
 =?us-ascii?Q?nGgkbsZco0oM0b2lowlKhEggr0/UUihsi6pLX8QP/1cxL5W4oeRI6cpOBlA/?=
 =?us-ascii?Q?w2V/vg4U3CgWM6xrryrozGdaeiRgVH5T98CH+EhHrvPejzUF0cA3XyK4ckjf?=
 =?us-ascii?Q?g63kYGD7dVZl1qO6WlxgRf+qnZ0ErF4bmIvm+2aFajO+ZuzfwEz6YbyXMG4Z?=
 =?us-ascii?Q?ZlcEdnesxLD+fIC79tM9K+epAQ+AHCP6Xb+pfPf96bMY8mcGyDOQWRLPilqM?=
 =?us-ascii?Q?pczQRGWrbgnlQ6XfqBs06ktNl81RTz2VthSC9mzdWCeCzgFRSGHrnv59F5KH?=
 =?us-ascii?Q?YwLo/nvQB0t4KASiGyIvOM2/yGwk6RargIkivwGh3kdDiAPLEgrDRMFPC6E7?=
 =?us-ascii?Q?OeNT9fYXUkl5vX6akrI5VOmDtfx62KIcGgId?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?abS0vW1wzkh3vzD1T6XXu+Ptv5HQ9cyiKRihOjUf0Ajx0T42mNs3czSsZDHB?=
 =?us-ascii?Q?rfmtzyFzr8+WeYxX29WP8GbnW70coUTqcuGaDPnAuubQCtyPXrmB3DhqKm3e?=
 =?us-ascii?Q?KaE5hL8uRDxzHBrJfUt5HnAIc9hCza1vVJvex5SusdNmvbcAVipjyo0sTo01?=
 =?us-ascii?Q?3HRwVdMrPJsz5bmo0q3vSTdJdfqotnG4QoLOkYRakYZ+h3M3x1lnTU6/DsBt?=
 =?us-ascii?Q?HFOx2yvylTp6azICNPi4BXLCx62Sde1klTry/jV9EtWBNzeh5rhfJ2Vgwm22?=
 =?us-ascii?Q?3wNHBfV4ejV328OIlX4rni3SSBcoaGXvOaBCQuIo/Bi5/00JOKvxmujYUlfD?=
 =?us-ascii?Q?oWKT+rIkiuvg2X/DnRIqRnz3Z4T0Rjasdmsm6vPAYAQRpG5E99sMzMvppl8C?=
 =?us-ascii?Q?OEZTXIAiKXmhupJvDxfsSQl2SixCUyI9M7Sp0Dl0V8vTF6GZQ/3n3/K1vg4t?=
 =?us-ascii?Q?Vq35tua6YdUl7bfbN7+KOeXbx+gEyJR/Qy5gREl7+Qtog3lpzA2yBNj2DoCG?=
 =?us-ascii?Q?U7OWckhMLwZBuL7NPS+LjwjsnFCaWlWpz63R2UkCPr51YF+wIsjHoEYGpdP/?=
 =?us-ascii?Q?2bE26vq/6b/E9C+oI4lkDpUP8TxFLjUhfB13lkb0ChfmS14y+k9hllaMKrVe?=
 =?us-ascii?Q?7cV+0eSUhg4W8+Gpysc5V5xRcN7V2n/ZP7TKkE1VpO2N+ro2SuxcEyH0+uBS?=
 =?us-ascii?Q?xinLO45eVuz43veiO9+E0TTgzfa2umdFkjW1iLAXHCJ+zFsdPrtjmCvGoKLh?=
 =?us-ascii?Q?jn6Onbo5JZz1e9OGaNY4liRjowN4y9l6c2QwWtG4JCqF+CEnV5URLJ02Vh/h?=
 =?us-ascii?Q?T7/kkD3MVhgRn9E6d6e0AuokLXn7CcDlncChEmeBSTjcWF6K0Sttun2WMP7T?=
 =?us-ascii?Q?sHiSfQBVcSxE2+i5vlI5lpIYnyZHfg28S215qVCbVcHLIKYxYApORaG3P8TR?=
 =?us-ascii?Q?Dw821SGaaGtvb3FNy5pyUiGMNypsYUS8CMKFObFgBJ7DP8jjJQOwXpBwD8kr?=
 =?us-ascii?Q?RYYIHswEy9y0JaWu4800Om2dIxNaVGTYQr8u4JtZLelrNUX6Y0yXmcUEneNZ?=
 =?us-ascii?Q?UyPa3aRb6OGVDURFCy9qXz0rwPAa0FTtr1lhK4Ksl/58qt2IBFmNbi1WWGc4?=
 =?us-ascii?Q?eu4Na7+d+IEKGj7ADmVSB8ID+z3XnpSkOtFw3n26nAWPvCEKYq9JC40OSAAc?=
 =?us-ascii?Q?3FuLc6mtExZJV1aZ7HLJAMhve4pCkyND/lmOOZKv0xTZBxGiIqeFOWKlF1mO?=
 =?us-ascii?Q?gilKApIWUt7DZw9ENls9rKTqqLSvMybnAknCUhxj1U3No/aaH3KvMsHRioCJ?=
 =?us-ascii?Q?6qzFq1s8x0vrWlHJ26NKNWhOrE12c6Mg571dSOSyQoEE/vjl6UxIB5Z+fGNv?=
 =?us-ascii?Q?m4RDZ3Vfrr9VYUntSKw/GCbNdFt1nyJmDAG59+dEFjmB+EdSlvFcHsTHRV3D?=
 =?us-ascii?Q?rbOSGQA01feS/Ocgd2RmHbFTHXDVpxdzIYOuRvFdnZLmO1jS5znWqo+inPyu?=
 =?us-ascii?Q?RZGbdnz1Ls8wfejMsMwgck2IMjDWKmImA9ahmM+RhPuxYsKBsD8zLYyRls/o?=
 =?us-ascii?Q?zutpr/k4ZzpTCZI5NGU7PM22bEuhNssnKIHNp3B7?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d871c0a5-4128-4b23-1a9a-08de21fb6302
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 14:54:31.9834
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7yuB92hVv9ue2cqszay4MUVzAt4XvfMWNHo6gQTc4F9khhk7bRA2LiSVasT1B7FGjdS/unvppwYD5SxBg59DgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7598
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDEyMCBTYWx0ZWRfX8Utfy/3A/SFO
 Bst1uUFZFxIJFabeqBObc6Qsm3pxofsc9fvorvJZsQfNwYe56nVie0QucsdoIXMMznB02NE15u9
 DZawNX6xNIPd2z1g2FCLFJCz3O0xXC6C0mjOfwXuT1Qg2gpdUkgHHyxNczOGjqyJlbGo9vSGS0l
 mOiET/iqh6cqLfqA+teF+Sq6h+/1LOtnM5CD5DqOZYSLdLnV/LR8BKbP9uOOir3nBWEk9dR8h8a
 hDXSXXpf2Aslx9oxheDjVqsXUzOn2rlsaXApXw/du7PHe9XfnISM4iq96co7k+S2ZMiN++1cB2F
 ynDh+v0rMFocZzxof2uy8s2em9NvtkOeERpwYANmd4RHndAY1i3MzRBlbat6q/ksa1+w+POptXU
 2uFYYl+SC8X1P9g7A0AJqH2MUxiAKA==
X-Proofpoint-GUID: HXaMCGXE7YwLiilMS59LIDNPEekVb1sT
X-Authority-Analysis: v=2.4 cv=Uvpu9uwB c=1 sm=1 tr=0 ts=69149fc8 cx=c_pps
 a=IMbvhL78Fdh+aiPumIwVPQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=NaVOVnlncg-4HZGvjiwA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: HXaMCGXE7YwLiilMS59LIDNPEekVb1sT
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
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 14:55:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121559

Add UPSTREAM_CHECK_REGEX to check the correct latest stable
verison.

Before the patch:
$ devtool latest-version python3-types-psutil
INFO: Current version: 7.0.0.20250601
INFO: Latest version: 6.1.0.20241102

After the patch:
$ devtool latest-version python3-types-psutil
INFO: Current version: 7.0.0.20250601
INFO: Latest version: 7.0.0.20251111

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../python/python3-types-psutil_7.0.0.20250601.bb               | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-types-psutil_7.0.0.20250601.bb b/meta-python/recipes-devtools/python/python3-types-psutil_7.0.0.20250601.bb
index 146361c5fd..ecc714264c 100644
--- a/meta-python/recipes-devtools/python/python3-types-psutil_7.0.0.20250601.bb
+++ b/meta-python/recipes-devtools/python/python3-types-psutil_7.0.0.20250601.bb
@@ -5,6 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=ec038232ab86edd7354b091c54e190e2"
 
 PYPI_PACKAGE = "types_psutil"
 
+UPSTREAM_CHECK_REGEX = "types_psutil-(?P<pver>\d+(\.\d+)+)"
+
 inherit pypi python_setuptools_build_meta
 
 SRC_URI[sha256sum] = "71fe9c4477a7e3d4f1233862f0877af87bff057ff398f04f4e5c0ca60aded197"
-- 
2.34.1


