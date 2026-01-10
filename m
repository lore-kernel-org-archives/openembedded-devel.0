Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55B18D277EC
	for <webhook@archiver.kernel.org>; Sat, 10 Jan 2026 13:38:34 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8555.1768052311034092638
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 10 Jan 2026 05:38:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=k3ibCv6O;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=54702d1050=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60ADbgmN1104298
	for <openembedded-devel@lists.openembedded.org>; Sat, 10 Jan 2026 05:38:30 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=9+Vlq55hp4Sd1c0g8S48PzkLmxUKHvwoFoyQDmuEKkM=; b=k3ibCv6Oz+9W
	azyhoP6VIZn6kwHQ4CQQd9yYPMw0Tk1wAB0XaXhg9p9CPK8ZtVin5Yg1EYZapUf+
	6v+5MbChfjhgLAJGJWhEn1eegXSmW3GeX4jRBTNSjA8k+IBGkfVszi6j6yDSp7Gz
	ybf5EUZOH76EmfLWg7fHEY4Dc4AE/jd5cd3enLX5nOXkoH7YaBuBxZ/i62TUfG9u
	P0FNmiXa1fFTWttHaC1Jo0HYHD2oQcnI5lLYF2Z8w5PONo+gd+4u/AqzLKWrF9kN
	rDGb810JzcAaanwVPmJrCCtirwhSifReUN1eqgNne+kPyox1C2clNVWuxjqV8aGb
	dSDB/L1GkA==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012059.outbound.protection.outlook.com [40.107.200.59])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bkjx0r50m-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sat, 10 Jan 2026 05:38:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pk2KaEV6tKRxc4hCOw/3hgHZ810LDBHdT0j0e7seq9nIRieFqd+fmLBZWCGkXxKe1YMTl/ZmbZEP1ZZfz/V6wAYsRrc6uiy15COD7grDJXV6w5MnB3WTtVh5d9FdRWrHLLWcN/gWym9x3TiuhqES5ZlekHw9gRKzG6BKrAivFFhH2fEqu1B0QAYBreHLK8oIKbGCgzrMRp6QQbsPiWeHNu+yoWCyR/RsKvTJEPkRBY3zyWvu8GQ0XZCUIV/3xzitCo2/EorYp8KKHGWDifpSPi71IWC0RTOaqvPTsNHcLSs/zaVx9eACnFmL9KwOvdWoeB8QN6GICiGLUsiNBXfz6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9+Vlq55hp4Sd1c0g8S48PzkLmxUKHvwoFoyQDmuEKkM=;
 b=UnsDWBTLwREuEJgXKyPLIx/mvGGipKPebL4H7ssdpkN8GLbGmXHVo+gqUI1uuZD6zwtoHJQOsqFW8vxVUwznTl5fwyjHKvj1UKp7CT/CX/jpQeDLcoPB2AYPWI+BqCw9TZufJsm3iCtjpD78dsJd4YMLGuI3P8A+iULFWYbCWWHQOlwgFcIOptMs90EAI4NhSz1hF18B/ch/32vhJ+3iTbdY6ZkSDrvh6jO/nTEXJL98cEnXhiynYkO9a4Ds8qun7gBfYyBtlGWHHaxPqCezEsRX+fruVXEa2Qc8KrjAeME1mfoCMlbNhGZFKPUmyjv2JkkId+QBTvPVcOFOxCaslQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 CYYPR11MB8385.namprd11.prod.outlook.com (2603:10b6:930:c1::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.6; Sat, 10 Jan 2026 13:38:29 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::3432:2eb3:d0a5:7831]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::3432:2eb3:d0a5:7831%6]) with mapi id 15.20.9499.005; Sat, 10 Jan 2026
 13:38:28 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 3/4] nng: upgrade 1.7.3 -> 1.11
Date: Sat, 10 Jan 2026 21:38:09 +0800
Message-Id: <20260110133810.515672-3-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260110133810.515672-1-yi.zhao@windriver.com>
References: <20260110133810.515672-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0044.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::8) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|CYYPR11MB8385:EE_
X-MS-Office365-Filtering-Correlation-Id: 60b03770-4aae-4ba5-166f-08de504d89b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?5wER826yJwKlPh5aQBdq1vaSIqt14cSSI7tCsqteeYj9ZVCry4ZV0yHN4dQ7?=
 =?us-ascii?Q?P7/AhQSAsXzd9eOvCym29uUQc7VvV3CDfnBtz2g9PRBzrFpHgLj1BBOVjJYm?=
 =?us-ascii?Q?Y5K6UpHnAdwhrfUVhw8CKvb7ZJGOQyEbe6w/P4fH3f5Bse1pk1rw6Y9QImO/?=
 =?us-ascii?Q?BsSs+0Jxmo8YXn4zvZd/1ow5HiC1h+CdDeaMqMBimiL5uvgUS3WLu/AAGz8V?=
 =?us-ascii?Q?VW9QKH/fzQ0cifiWnRyZxIeVksLyvPN3To/0uYpBQc4P7r+DG5t2DFSFrXvK?=
 =?us-ascii?Q?Wpj1VqSdaiOzW4h2+fCNz9hdEZEd6cnTEMp4MLBIDstfunmdApKjmSmHzjdj?=
 =?us-ascii?Q?CZYyFPjJW35aO0zX57R4ZUGJ4i5panjyFutk8VuWyFPL3TqQOBzBBKuX4LbY?=
 =?us-ascii?Q?4H5Y7HsBNrdq/iJhh/g8alcekiXrAfmtFf5J3CB7wxGNirH0t+iGwZia9MlG?=
 =?us-ascii?Q?iZPCs2DAjYOo0YGtirxUVnOQRWl/zqK2egdG0sM/+8Qf13k+k1hUX09GqrQF?=
 =?us-ascii?Q?GvYBoL76tqbhbxdCF9OjE/OSHv55l19ztrYz81Rf75D9rhg8FdbaIQb7GTkM?=
 =?us-ascii?Q?i/IwJTMahFQajdgSULVDrevLD5sV1SI+UU6p4jbfJzkS64zPmcPHagMLXpZo?=
 =?us-ascii?Q?a1iRHI2JRSe4uCBzLROmNYLkPogJBPZMJSpf0dow/C/kI/6Lb02AVe4TE20Z?=
 =?us-ascii?Q?aaN3kIflLukP65Ea/hodo0cdaJP6HpLJkbrqd8kZJYzWKA8rTkhFJHDMXpW+?=
 =?us-ascii?Q?jV90iZtAdg3Jmcm2781XrD8VYujl4he9cGTxxdb82t97eRL6kjsjTmcRsw5a?=
 =?us-ascii?Q?lzPoFHIfAQBL86+L304GrrpjSwIo2pjJiS2+Jmf0fuVBG9nUPqRwOyMiVmME?=
 =?us-ascii?Q?y7xfz/Bxymoqj/m+CiV6k+PQC72LyokED4QOpjVkhW/4ATu4G5vxgjYmUwzx?=
 =?us-ascii?Q?QlJWZ2YAggjBCg/yUu1JZ5T7dXELH5zsxjC8oFF1GcrFmDk4JQblUL1Uh9Yw?=
 =?us-ascii?Q?phIjCs6Z8LI3Z0q9RtXw+WgjH3YrKfVsvZFeIaUM+s6SLiEDWz6b7BaU/fgA?=
 =?us-ascii?Q?b9V+DiBXIU5J9IIuT8zbL+rM+fdMFdY034//OkGGVWssxzShMzDgoVg6Nl+3?=
 =?us-ascii?Q?zZSItIGDYXPVnOXZjNc/bqRaerwSMKitUFCwl/IzcNyZVcjepGC/bFYVf5/m?=
 =?us-ascii?Q?yY2P25s+xLvS/lE+mV+kq2xdo6zJo6Khp1salR+uYWe/MHfktWfO2yzymJsp?=
 =?us-ascii?Q?/vlOrmzZhG3oVGF+j9pdlAVIHDc80NmULvqW6y2IDsGwXWw/xOKy2T5F7MOl?=
 =?us-ascii?Q?QU+JeZMYN1YwFfbd4ypFkOIqLQ8nkGY6wUX2Yzp+6g+rN7ej6LTcdpbhL0yQ?=
 =?us-ascii?Q?lvkmTLCRJe68kP2vzypn9ePeS54JIytvoS4NpfLZGifsAUjc22F4Pgzg/jQQ?=
 =?us-ascii?Q?wEZtMMvquUD0KdiuvgfTlmS9M2KQ8Q+z8B6Qa6vs1xXClXX0wwIH27myzkho?=
 =?us-ascii?Q?1Y2xZQ5GO04bLsEhUCkcOFqFPn9p3O66e1DynQtvBnsrPsUBRiFL7aOYkg?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?5Lsiubz5neLMVV/9U7bY11UNKkB6ZmCeABh3LC71OemsNU0oMKE671IlbI6n?=
 =?us-ascii?Q?lyAmfNY9Z5q56hEILN2DNpvEPu2oyIQY6Wf1uvS151VdTfcYfaB8M6x4J8KL?=
 =?us-ascii?Q?gDXHqHbW6UC68qkKn0ZIRaeRwjJBAKLN+UVOGYybTPoiubvKFSUa3/Ojv+/T?=
 =?us-ascii?Q?/6dAwQ01xFdO7/c5zvSFcUWXEKonMzhkvFQsFqDRlFjYexZgu14OCWXhrjjh?=
 =?us-ascii?Q?dWegcTOSl2sKCP3hiwRzY3ppBarnxaWniLAg7cT8QHmPCbRXQ29G1t7l/Dzu?=
 =?us-ascii?Q?ohC1J2gq5o+DP6oQdM8uVoVCvtDlqaI/IIH4I0mboQF1ZWvONlTVXHm3dQY4?=
 =?us-ascii?Q?0hLFCoFc7ujzBW2vvk+OFzN6IPr1TufNvY4ZYd5JBp2DWpM7jDakleYGfMml?=
 =?us-ascii?Q?0hIvSJ+PVYnAVlN4D9gexWYGXoFFKI4/9kOBmjHh+cWECUJ8/lfOkhBN3faZ?=
 =?us-ascii?Q?fVzNHgFTxme70YfMODd4NZwRNlCTKmfMQABSus7OHazn2Y4GsB1Lhf/Ng+gl?=
 =?us-ascii?Q?GF1MX17AShLkV5G9g4xNfsezblKNLddcMyl3euuHeJbhWC73Vx4BjabfQSdl?=
 =?us-ascii?Q?cPvJ2/hxPsO3TXY4SS/kq/A0a/eNBCEB8BSHiMsg68GIKAzWQFDYHIe5umVa?=
 =?us-ascii?Q?gh68aelBGHTed7/A5YzKxQc2EqcqYROzwOww6DCifOBGqGXjTIuiVmFYvdFA?=
 =?us-ascii?Q?wOrW0mzdzvm62O1TXv1x2r3d4MxJG3/tZbJ5+M4zJmQDmipGJ+VASapd/6eC?=
 =?us-ascii?Q?fyujiymBhvAGTv5fX/V17/m6OURgVQ+eEa00CtcAM5w8LBnV5OZAEXq+tPjE?=
 =?us-ascii?Q?ALggqGLWpPI6xBtj7jsLIKDiq5qg+TaYGhwapjuSG96usUge0sNU26p071PI?=
 =?us-ascii?Q?dumlSsmjbLaE86It9uMFhM3THERRJSXDaA0P0nzT2//ZnNOpKYVPLHgzq45q?=
 =?us-ascii?Q?ghmWSoFlpwtBqNPfbdDDFI7V3RmOD88T4wB8yND4q1QwVhlyWb6A4v+oWrgl?=
 =?us-ascii?Q?vNf47PdFCvvIYOdl9tq2QxIXTzGlbuUiQ4XAIPWFNuwrW47NUEH13NwfVUwN?=
 =?us-ascii?Q?c9ME/Uh5NLNruqabXQn7E6lg/Ti30fALVUiTqi6HnAfzK8OLCyU8aad6UesQ?=
 =?us-ascii?Q?Orq0PBJ221zBcTuWWcTy2YLN7jTmgh7QUhwUf0zheKzeMmrJkdAogEFhXfPi?=
 =?us-ascii?Q?0ep/qz8tsY6nH2svc1fZ1kSyvH66TdpgkzP+49wNG/Bw+SUXtgUDAmERWRWU?=
 =?us-ascii?Q?CqikDHEjFmLFkn2XH8eW9J76zSGA9+f6qx9QQAFBHbZERQgeXy44EhVzLqH9?=
 =?us-ascii?Q?wpYli63+Mxxy7M7lsHxxhxW9AFgjG6x3ysrATnPf0pCGmg1c99c55ts1b14S?=
 =?us-ascii?Q?txzdMptTHld6qjNYJ6sNpGs3pQRDHiPNphN0JB4FhIEJjeefVnoH2GE6NRBB?=
 =?us-ascii?Q?hW+honodVjGJudOayUta818LHe9Qgd4VrIvtkHxoJpP12AUAAVbAaDWySyln?=
 =?us-ascii?Q?S2k8vXp3jeVIjXBMAb80XoL94WhIEPmKGgbpD/kUn4J22muTdmev0cVWZiO/?=
 =?us-ascii?Q?+H3Rz7QC6hgLAUBYLEa7Lx6yJi25cF957e4M2IMA5pc2Uqwz4dejFeSn2nrr?=
 =?us-ascii?Q?ISF8X38Dixpjfg86mQbzalKxMwKzcoqT6JFJb0n6N/GP7jbqHH9al4/ln6wI?=
 =?us-ascii?Q?zTjobKE2bG/juyRSqSzLUj3zaROsbBWp9kfjyG+no+dWbtAW/0o+yDwSi+NC?=
 =?us-ascii?Q?u5YmxAycPQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60b03770-4aae-4ba5-166f-08de504d89b0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2026 13:38:28.8949
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L3t0va3byuSrSrbGtXdPRqOo41a5jr6Y+PWtb0de5Oq4ybaoyJFZwNKPLJPf4s9RTE++WGsK/+xWkuqoXxksWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8385
X-Proofpoint-GUID: MjxRqv16unRO01To6pmr0raZA1F_aDJN
X-Authority-Analysis: v=2.4 cv=e5ULiKp/ c=1 sm=1 tr=0 ts=69625656 cx=c_pps
 a=+/t0CT+QaJpOasvqRK9qOg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=wqlnfJ6xpcjmOdXT1ekA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEwMDExOCBTYWx0ZWRfX0ETb5vpG2EWd
 8s2zyIEwna0HVquA0Yfb7okLXEQETynZglPnITHUefqp84HU0/JGnyzb+ga3x8YhzurC2ToqYTs
 Qe5UfhB4DLNbOWfq+pN0UAgAOhr2Mr3D4AxTNP4WG/6D4vu360GR4JZbsUtQPEOjJ4xFswjHGjJ
 5UdaOrizRFP2lxLgUnAxn8AZDA30ImgVNNhI69FwiYptTNYnUMSxNcuPwP3kcpKYVGLyZoqhk6g
 eRcazbXGX1UEDzY943vCTVsjAPeWDTMaOoebpQBSPjhYjD2xkanncgjiyasPxoFpMqwZb6ISD/Z
 +jNLNbBD6RICHqk9Rzc8COzCDll1cKL9SQdwlGWP+rnLGLn2TOkxSpdH+3LE5oS7mo469oFn9AQ
 tGfl0b63XfwEHXNCLz7TDzV8pVNDJ3qAOcscC9raFILLmAlLK5sp9HWUHEjhvdi5Dpc37trx7gK
 ajzS0zfOkOgnEItqIdw==
X-Proofpoint-ORIG-GUID: MjxRqv16unRO01To6pmr0raZA1F_aDJN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-10_04,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601100118
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 10 Jan 2026 13:38:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123328

ChangeLog:
https://github.com/nanomsg/nng/releases/tag/v1.11
https://github.com/nanomsg/nng/releases/tag/v1.10
https://github.com/nanomsg/nng/releases/tag/v1.9.0
https://github.com/nanomsg/nng/releases/tag/v1.8.0

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../nanomsg/{nng_1.7.3.bb => nng_1.11.bb}                    | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-networking/recipes-connectivity/nanomsg/{nng_1.7.3.bb => nng_1.11.bb} (85%)

diff --git a/meta-networking/recipes-connectivity/nanomsg/nng_1.7.3.bb b/meta-networking/recipes-connectivity/nanomsg/nng_1.11.bb
similarity index 85%
rename from meta-networking/recipes-connectivity/nanomsg/nng_1.7.3.bb
rename to meta-networking/recipes-connectivity/nanomsg/nng_1.11.bb
index 8d681f495e..e59b7f34e2 100644
--- a/meta-networking/recipes-connectivity/nanomsg/nng_1.7.3.bb
+++ b/meta-networking/recipes-connectivity/nanomsg/nng_1.11.bb
@@ -5,9 +5,8 @@ SECTION = "libs/networking"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a41e579bb4326c21c774f8e51e41d8a3"
 
-SRC_URI = "git://github.com/nanomsg/nng.git;branch=main;protocol=https"
-SRCREV = "85fbe7f9e4642b554d0d97f2e3ff2aa12978691a"
-
+SRC_URI = "git://github.com/nanomsg/nng.git;branch=stable;protocol=https"
+SRCREV = "84aa701f42968bf536141a24e826da66963b571a"
 
 inherit cmake pkgconfig
 
-- 
2.34.1


