Return-Path: <OmkarAbaji.Patil@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75754C624D0
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 12:12:44 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10987.1788351158362957101
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2026 05:12:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=bpSd/832;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3705188636=omkarabaji.patil@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6829NNkV104031
	for <openembedded-devel@lists.openembedded.org>; Wed, 2 Sep 2026 05:12:38 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=+qZOl9NdzqQdX/kfFwRkC8MM51k4Jx0aosUPtg5MJek=; b=bpSd/832lcNQ
	tMlVTkARpGN2b8MbuxwnJgCjQotogvZg+MY3VSHFii2Fpx7B59s7pFPUM3H7q4Bz
	+49Gl+tH0BCewknlZGRcfp/Y70aA9CHlNPALwL4xjlTf6/58MkHh10l8YOWXnCAn
	3xAN46CmmsKXVPbSqE1v1rZFIOZ9/MVdQFQFbBD1Ga0dSk63CY+oYaOHuc3EI5/4
	wNB0YhPyQ9KWHbiBsJFcIH9yegoLIBCs+1qz4gLYIDJLCuMCrAtX4BYYAgRwSlSq
	RXsoXzNC1HQy9QOtFSM2I6Bg7p00jqXf7BmkVflSIY3GMtVFkXev0i8nN3ZjJirB
	ecbokQOF/A==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11020120.outbound.protection.outlook.com [40.93.198.120])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4gbxxee3cv-3
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2026 05:12:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GVw5DrOeeu1Ikp2SC6arzl7mBP5r+ZAa6qJBJgAxg36Il6vo4mfCbK/FcqdL3Q+yY8kvvL6VKkHEwlM3oSjb5wnW7LTFeilDqv4IxxF1EC2eGAatO+Px/Ogt6kppiXTGCy9p/r/1iLqLN1O4ieeauRXdYVSZ0siQRIhhb2YOWjqyCFLFwpMfKdSwWD8IZGIbhdYWI9cMbej3oCSx+5mtk9PgBv6isK0thQO0gffe45Se2EE+KFLS5VOyKgugqzWXwHhsI0KF7q1sKvlKhpnx9qqz8tkPzQp3Cobf064wqW7U2oVx8Sh8tZXX84zqZz8g7FQ5h+lrVcAkvrsHr+AvcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+qZOl9NdzqQdX/kfFwRkC8MM51k4Jx0aosUPtg5MJek=;
 b=Qa+YicvdFZ1PucUkvFGDtjnaRQL4EekO691KioTQCVjTyKA3PUfQeVxSt0fpnwpZuNlFoUoydFkkUv6Nuq/jBQnm8773KnG4eynHAzBPl0SVCoPEQ8SKSKXcRCFckVxbT4jU4Qqf0qIz7O54DxxYP5LjOxEeVAHcQyC1QzZcoZivRc12hlmEVz2A3ergURtxsfSbosFPS6bJ24sUp3GFVkQRbMvNBAK2fIoZsw6xUywcrHk0D7/XGMvzPmJ+cMFRdWXG6tRZWUhEdrXfWMdVNgkPHH/bIaL/4rNCmnQJX7+rdWmTtZcS4W07wXbZNyQtyD3faVNOqzFPxvuMmIMXQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH3PPF3ECB6A513.namprd11.prod.outlook.com
 (2603:10b6:518:1::d19) by CH3PR11MB8442.namprd11.prod.outlook.com
 (2603:10b6:610:1ae::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Wed, 2 Sep
 2026 12:12:34 +0000
Received: from PH3PPF3ECB6A513.namprd11.prod.outlook.com
 ([fe80::c5c6:cca3:ec27:580d]) by PH3PPF3ECB6A513.namprd11.prod.outlook.com
 ([fe80::c5c6:cca3:ec27:580d%8]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 12:12:34 +0000
From: Omkar Patil <OmkarAbaji.Patil@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH][wrynose 2/2] openvpn: upgrade 2.7.0 -> 2.7.5
Date: Wed,  2 Sep 2026 17:42:08 +0530
Message-Id: <20260902121208.3587748-3-OmkarAbaji.Patil@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20260902121208.3587748-1-OmkarAbaji.Patil@windriver.com>
References: <20260902121208.3587748-1-OmkarAbaji.Patil@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0051.apcprd02.prod.outlook.com
 (2603:1096:4:196::10) To PH3PPF3ECB6A513.namprd11.prod.outlook.com
 (2603:10b6:518:1::d19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH3PPF3ECB6A513:EE_|CH3PR11MB8442:EE_
X-MS-Office365-Filtering-Correlation-Id: 25141d16-f577-47c7-c4e5-08df08eb78b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|52116014|376014|366016|38350700014|6133799003|29003799003|56012099006|11063799006|10067099003|12006099003|25016099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	3msF8u3Yyx6G9kLQOX5R8OIx5hwD6ToGQdf1M8gWLkicWAMMEEoK1LqQKfCV/ovUmCaxf7v/Yv0bKIDrbguQMwtK7lD4LFRlbOpxlRCsRFoXFV2tovPJI+C6q4/9IsW86wZNDa5wlLpmhxDJrivRyHCRXN1tIwsXVDor/PvFyGVWSz3hmSz9AK1gkvA5jjLG+xhwXzjw8INa4vd96lOX54rzzvFQ9B3JHtq0rDyrMKWYQjvA2W1+eB7uCxJQGzBkSN4FC3qpjF+Ml+PBvdb4vI+4zfa4RUj8T/BqTKytcBl7KH4QXeYfpNo0VFZ/4RZ3dwkI8HOhS2kUKBs4tKzr8WSDbwSNIZvjiFmeJHqEMYuNdDMi9DlFlwY2ocGU6kAk0Ky5rAdeX5mW5q5NaUThHXo3q5Z7gLTXk+8fsCP+BobUsTS9gnw6o6AtvWo5pLQ1ZMDrGU7WHiolrlFnbToA9+qdN4r03lZRA+d9gSqPur/C2QvVCUfcxnTp7RvODEbzOYzTW3G+P1YXD4hrZMivCVAewLdMsTyQ9Y3CVecHDFZDl6tH68Ype51T0nqk2jL4qqDfmZw2kQVz7Bw/h+A3C5KevMaP1wN10RzKzNlu32RIrA7ZoZ0HQdvhKyz3R4fCWVzCAjObr/6kqdSpfTi4KRe7tKe9bWStO4DqcS/4sKA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH3PPF3ECB6A513.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(52116014)(376014)(366016)(38350700014)(6133799003)(29003799003)(56012099006)(11063799006)(10067099003)(12006099003)(25016099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?2rQ4DecahdoUqhyFfHDubmBjhWkVbCADIs9jNU+9dGuwSoC12tcd/zjntCPN?=
 =?us-ascii?Q?BrrbVva8kiAILbMHBad0K6126S1SbFlJiadnRrc8CwwXSA9v0+OMz2Rev2js?=
 =?us-ascii?Q?y3vA31QECqpyK5BMaJMmunNACV7oX50U9FXlOB7NVmCjOPlGZBJyoOeSKGsT?=
 =?us-ascii?Q?rsGv8jsQXVMrjIrTzK/UnjqH/CV7/FH7ioLtzo6EAfjNY2FAorR11aMUAGaf?=
 =?us-ascii?Q?f+CPbKmO9L3j41pYrWfC1citmxfRwx9YaFDwcm3+R6ByJHc3SlEvhFMlGzHQ?=
 =?us-ascii?Q?vM4If88bZi0lTkf+mjWGAyYtZjPZi45TG3bw3NWxA9zBFJSnPW5dY7K1VUt3?=
 =?us-ascii?Q?ujWyyCQ+328BeOczew7xW5gpzMrTZImIZ9XQiILmwV+Ncbal6hQLVjXMftQN?=
 =?us-ascii?Q?DtfRiKZ46I9NtLxqy6zwhj+ZPLrvtKV5+xHBiEWFhSycdWuRY/PquJtCYq6/?=
 =?us-ascii?Q?gaUUYAhW/DvEF0UiQqTrNAyiWkeS+7bHD7pWAq8FAaCKPyJw/8FAKZ1V0mmJ?=
 =?us-ascii?Q?wHCofd0brLYPqDUW9uVll9Bf7sfIA6pz1TRwEZcaDgTHdumIPClD2lKtOx6U?=
 =?us-ascii?Q?sO2KLojZnoM5XK8v3bhHpIu0mnuaHFK2ZL8CnhF1OjCej+F21Fyne1AKUBCt?=
 =?us-ascii?Q?pIYUZJjbtyVn504XLfHdu79rI7HwAM48mECExqwtsNm0yo7/1qhcsJEBCifw?=
 =?us-ascii?Q?EG2HhJ/N4KbPo2edBWWPu92RHLYDFP0C+QaAsH76SqpycMSou6N2z+7AYoYw?=
 =?us-ascii?Q?yo37nnuKFGYmOFlu7yZckqzflnwMexR+oDytKyaia+LoHHTovm3nceE6oqBF?=
 =?us-ascii?Q?M8+Ih6X8Wf0kDlnN9+Hc/a8pYRZ7ys9LHC99yllD4yABcvevzRV8j1wYsIro?=
 =?us-ascii?Q?vT3Zg1t3qv2eoTrEsqae0knJLyPgJbUvtdvxn1QiBgC/cL+kuDAr1dW89lOh?=
 =?us-ascii?Q?Y0SvlMDV4AdEBPZJUvBpvbPxLhw0xfyyBzHrt9/p8Kp7oRAdqCdMcJaeDTIU?=
 =?us-ascii?Q?c1t5HV2ShjjE1lnRtkD2GSe/S7yS7jElIiyIxZ+PNvnAMGgWCd95/rIvxWhP?=
 =?us-ascii?Q?dsMo9XZ2L9gBIm0tUi969ALTjzPskEAQq4V4QxgKY/45H2a2HrIsElYm1wJi?=
 =?us-ascii?Q?+ZHKAajpMDPs2zsFepLLxKofKshO5fgdhsD6C1zRa1LDjIxS3EFUnkyaN4I6?=
 =?us-ascii?Q?avHtD5fJVeShSsiOVsMCsnNbsc8HV1OCnXqBaLla7mAsoxuNB0PwWvoNDx/q?=
 =?us-ascii?Q?EDoLeHtXeK2dmHtkLmpIHY0dPDuWVgrsXj+TuRsWTVbI3jWEFB5H0q/CObj0?=
 =?us-ascii?Q?lPxE6YN7RTiJ9v9FwW/SS52lJXUPPrIlJetI2eCvk84dXpqpoRAccmKqnO3N?=
 =?us-ascii?Q?FYSFRnVSwKiGVusTJuoxAPsnjBJKvCbZRC87tWX8LA1onj7Ypr0+doqoLOBe?=
 =?us-ascii?Q?Awk0UuMe+yLVmZsr5HZL6vW6Y46ddo3OIyv1Lun+ramLbjyKE68VEVqSBMYm?=
 =?us-ascii?Q?69jF6IUNzPH7JII0AGUMyTwik2+eoTrkR+S8MNLmt3ljvRwMJlkWWRBco7BU?=
 =?us-ascii?Q?TgFVRknyCdr2QYNl0FvfRNdTyKG7NaqLwhyaLQ8YGVSTeuGj3dBQrqnBadmm?=
 =?us-ascii?Q?p2YCymiHQ2sG4i9a9SeDqfESM3Jq0LfskCNHDjXKSXcn0CJPNzwuffImf+XW?=
 =?us-ascii?Q?47S3SQWAXwav4Zx5EBWLrDTvhygNngJCOOfhLNJuCUezlXtCE2JYHme+iaKV?=
 =?us-ascii?Q?GKbtJohJun8on5ud5C8uROkSkR5WPgQ=3D?=
X-Exchange-RoutingPolicyChecked: 
	2AlgFnC/dJtanLzIQ1cJtVzBmgNSDk1hUnllwkO9315dbkc01hNYlja4SaGJ9aY9LmYgjvwoe2HzlmseaawzDoNU8+kJ5hrYOaqKzAlwRa1hpGGFaYq7qBerksowrlSGQqKPD1B064I1XYDFWvJkwmtP4cerlR8/5VPo6AiT0Uo+4Knr67tj9l/vsoa8p03NQCKciviKNhmQEMC/SP2pDxhctl2v4SDwhIUcXGo4cqrRCNwO98aELAlpWsYOB5KG+iJApUxC2H/1boiDuGM7h5s3ZC34LSb+YFGTtajggGMt18Kpb2f5d2wA/f/JwkO1o2I8v5k8Oge/gX3SppYKoA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25141d16-f577-47c7-c4e5-08df08eb78b3
X-MS-Exchange-CrossTenant-AuthSource: PH3PPF3ECB6A513.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 12:12:34.6140
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sGQ/Tdgj5alpRBZHjaDBrw4oUHLfyum/PQk10sYRNfgVdvV7F32XsvcECfvhIOuGBjrBsj/6iuLeTYzFXxXN5SESsa5MPU7QPKqXCBJJvvk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8442
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDEwOCBTYWx0ZWRfX4xd+DTEJVShz
 5Npgoljm7TLLLtnFoh6mAfGn2Ok66gSPicsiYDhP17+yZf/Jetms/6f/F7PiFBH0J3qJ7lShquM
 COCR3W9ZwppRJvgshakZhzPoD5iNlTafGGuoD6F9gXvzzYM1El2w10kvR3vV6mz0GKMUwpJBv6A
 ceczYfP/PNdShtF8WBvqK21aP2ElwEwb2AfREUfOgl70NNhOjBEl7BSkwhz9DklKYfTuQyPzyEh
 vCqs6aiXt8pOvGlcexkwglu8Upsd3BinR90b2XoE7inHeN3n0Uj4sFy4V+46S9yadsOsQ3Rg81e
 vfgkDUmLr8rSzd+2Xs+iytuTauvESMDoNo5z6LAuwWpxZr16dG3X0Nd49j7CSuLx3VzypHdnC5S
 XGvdObcULEesM8o2ZIsT+FfKFrDh6+r7oKD1tMisf8QYiCc44fYH1uCpDxzTiQlFbJW34Kw/ZaH
 SuVF1U7kwLjYE56a2Jw==
X-Authority-Analysis: v=2.4 cv=BJaDalQG c=1 sm=1 tr=0 ts=6a9812b5 cx=c_pps
 a=OsHIvx7z5txkqQhXuj38dg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=aX25-iPZAAAA:20
 a=NEAV23lmAAAA:8 a=9dNbsytUAAAA:8 a=uDo-SIiEAAAA:8 a=EUspDBNiAAAA:8
 a=omOdbC7AAAAA:8 a=t7CeM3EgAAAA:8 a=FqYEshwvAAAA:8 a=pGLkceISAAAA:8
 a=xeC3QtFAAAAA:8 a=GvQkQWPkAAAA:8 a=TyYgJJx3BB2W2if4R-YA:9
 a=gPpeecpFUKP6j8iU7U-x:22 a=Rkhf4GTZPwEC63LfVcCP:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=whVU-vuORgf30j0UdIXk:22 a=9XEOD9pWidfRTSXZEhnp:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDEwOCBTYWx0ZWRfX9/pDyt5X0dc1
 Uf/iJgviFtr8OKQdnyAGNeSQseueUdk9GLUyfMTaB5feZfwTKpkh8QcFMcekHKffYYc1LOfnOjX
 8vItCrZD0bDPNrrN6qSUw4w9d3pOaK4ZWfjb4zyVDR1aCbcR/aXS
X-Proofpoint-ORIG-GUID: QibIEJml_CwmC3XRm45Sx988VHGLelMq
X-Proofpoint-GUID: QibIEJml_CwmC3XRm45Sx988VHGLelMq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_02,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 impostorscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020108
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2026 12:12:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129695

From: Khem Raj <khem.raj@oss.qualcomm.com>

Upgrade openvpn from 2.7.0 to 2.7.5.

Changes:
* Drop 0001-tests-skip-test-execution-when-cross-compiling.patch
  This release already guards the auth-pam unit test TESTS assignment with
  "if !CROSS_COMPILING" in tests/unit_tests/plugins/auth-pam/Makefile.am
* Drop CVE-2026-40215.patch - fixed upstream in 2.7.2.
* Drop CVE-2026-13117.patch - fixed upstream in 2.7.5.

Security fixes included in this upgrade:

Fixed in 2.7.2:
* CVE-2026-40215: race condition in TLS handshake that could leak
  packet data from a previous handshake
* CVE-2026-35058: server ASSERT() on a malformed packet with a valid
  tls-crypt-v2 key

Fixed in 2.7.5:
* CVE-2026-13379: openvpnserv (Windows) DNS SearchList state pollution
* CVE-2026-12996: use-after-free in ack_write_buf()
* CVE-2026-13117: use-after-free in tls_wrap_reneg()
* CVE-2026-13122: server crash on malformed auth-token
* CVE-2026-12932: memory leak in tls-crypt-v2 client key handling
* CVE-2026-11771: 1-byte buffer overrun on NTLMv2 proxy responses
* CVE-2026-13698: memory leak on tls-crypt-v2 packets

Release notes:
https://github.com/openvpn/openvpn/releases

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
Signed-off-by: Omkar Patil <OmkarAbaji.Patil@windriver.com>
---
 ...-test-execution-when-cross-compiling.patch | 34 -----------
 .../openvpn/openvpn/CVE-2026-13117.patch      | 46 ---------------
 .../openvpn/openvpn/CVE-2026-40215.patch      | 59 -------------------
 .../{openvpn_2.7.0.bb => openvpn_2.7.5.bb}    |  5 +-
 4 files changed, 1 insertion(+), 143 deletions(-)
 delete mode 100644 meta-networking/recipes-support/openvpn/openvpn/0001-tests-skip-test-execution-when-cross-compiling.patch
 delete mode 100644 meta-networking/recipes-support/openvpn/openvpn/CVE-2026-13117.patch
 delete mode 100644 meta-networking/recipes-support/openvpn/openvpn/CVE-2026-40215.patch
 rename meta-networking/recipes-support/openvpn/{openvpn_2.7.0.bb => openvpn_2.7.5.bb} (95%)

diff --git a/meta-networking/recipes-support/openvpn/openvpn/0001-tests-skip-test-execution-when-cross-compiling.patch b/meta-networking/recipes-support/openvpn/openvpn/0001-tests-skip-test-execution-when-cross-compiling.patch
deleted file mode 100644
index f8f2d2907f..0000000000
--- a/meta-networking/recipes-support/openvpn/openvpn/0001-tests-skip-test-execution-when-cross-compiling.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 93f7f6ca0c916427d28610d3e263fa556587532d Mon Sep 17 00:00:00 2001
-From: Haixiao Yan <haixiao.yan.cn@windriver.com>
-Date: Thu, 26 Mar 2026 13:43:50 +0800
-Subject: [PATCH] tests: skip test execution when cross-compiling
-
-The auth-pam unit test Makefile.am unconditionally assigns the TESTS variable,
-causing test execution to fail during cross-compilation because the target
-binaries are not executable on the build host.
-
-Upstream-Status: Pending
-
-Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
----
- tests/unit_tests/plugins/auth-pam/Makefile.am | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/tests/unit_tests/plugins/auth-pam/Makefile.am b/tests/unit_tests/plugins/auth-pam/Makefile.am
-index ba32013ac920..7da299ccde92 100644
---- a/tests/unit_tests/plugins/auth-pam/Makefile.am
-+++ b/tests/unit_tests/plugins/auth-pam/Makefile.am
-@@ -4,8 +4,10 @@ AM_TESTSUITE_SUMMARY_HEADER = ' for $(PACKAGE_STRING) auth_pam Plugin Unit-Tests
- 
- if ENABLE_PLUGIN_AUTH_PAM
- check_PROGRAMS = auth_pam_testdriver
-+if !CROSS_COMPILING
- TESTS = $(check_PROGRAMS)
- endif
-+endif
- 
- auth_pam_testdriver_SOURCES = test_search_and_replace.c  $(top_srcdir)/src/plugins/auth-pam/utils.h $(top_srcdir)/src/plugins/auth-pam/utils.c
- auth_pam_testdriver_CFLAGS  = @TEST_CFLAGS@ -I$(top_srcdir)/src/plugins/auth-pam
--- 
-2.43.0
-
diff --git a/meta-networking/recipes-support/openvpn/openvpn/CVE-2026-13117.patch b/meta-networking/recipes-support/openvpn/openvpn/CVE-2026-13117.patch
deleted file mode 100644
index ea2e32bdcb..0000000000
--- a/meta-networking/recipes-support/openvpn/openvpn/CVE-2026-13117.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 3ce0242e68527fd1e8d378aecb57c466e8058b44 Mon Sep 17 00:00:00 2001
-From: Max Fillinger <maximilian.fillinger@sentyron.com>
-Date: Fri, 22 May 2026 14:34:57 +0200
-Subject: [PATCH] Fix tls_wrap_reneg use after free
-
-When dynamic tls-crypt is active, it is possible for tls_multi_process
-to set to_link to session->tls_wrap_reneg.work and later free that
-session, leaving to_link.data pointing to freed memory.
-
-This is not caught by the function check_session_buf_not_used because it
-checks only tls_wrap, not tls_wrap_reneg. This commit adds that check.
-
-CVE: 2026-13117
-Github: OpenVPN/openvpn-private-issues#119
-Github: OpenVPN/openvpn-private-issues#125
-Reported-By: Trace37 Labs (https://github.com/trace37labs)
-Github: OpenVPN/openvpn-private-issues#131
-Reported-By: Haiyang Huang <huanghaiyang83@gmail.com>
-Signed-off-by: Max Fillinger <maximilian.fillinger@sentyron.com>
-Acked-By: Arne Schwabe <arne@rfc2549.org>
-(cherry picked from commit 2745768d6181c1d54ebfc5ef81f924a127f4f015)
-
-CVE: CVE-2026-13117
-Upstream-Status: Backport [https://github.com/OpenVPN/openvpn/commit/3ce0242e68527fd1e8d378aecb57c466e8058b44]
-Signed-off-by: Omkar Patil <OmkarAbaji.Patil@windriver.com>
----
- src/openvpn/ssl.c | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/src/openvpn/ssl.c b/src/openvpn/ssl.c
-index c0ab6d3dfbe..d7e93bd41ab 100644
---- a/src/openvpn/ssl.c
-+++ b/src/openvpn/ssl.c
-@@ -3154,6 +3154,12 @@ check_session_buf_not_used(struct buffer *to_link, struct tls_session *session)
-                     "still in use (tls_wrap.work.data)");
-         goto used;
-     }
-+    if (session->tls_wrap_reneg.work.data == dataptr)
-+    {
-+        msg(M_INFO, "Warning buffer of freed TLS session is "
-+                    "still in use (tls_wrap_reneg.work.data)");
-+        goto used;
-+    }
- 
-     for (int i = 0; i < KS_SIZE; i++)
-     {
diff --git a/meta-networking/recipes-support/openvpn/openvpn/CVE-2026-40215.patch b/meta-networking/recipes-support/openvpn/openvpn/CVE-2026-40215.patch
deleted file mode 100644
index e1bd0c99df..0000000000
--- a/meta-networking/recipes-support/openvpn/openvpn/CVE-2026-40215.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From 4a2c827c2536aa03a1d6c7cc916689a46c067187 Mon Sep 17 00:00:00 2001
-From: Arne Schwabe <arne@rfc2549.org>
-Date: Fri, 10 Apr 2026 16:59:53 +0200
-Subject: [PATCH] Ensure that buffer of freed session are not used
-
-In a race condition an old TLS session could still try to send a packet but
-also get replaced by a new session. In this case, the buffer of the new
-session is still referenced. Add the check_session_buf_not_used function
-to mitigate this problem.
-
-Also make the check if the to_link pointer is in one of the memory
-regions a bit better even though this not make a difference with the
-way we use these structs. But better safe than sorry.
-
-A better solution to remove the TM_INITIAL state and handle reconnecting
-session in their own complete tls_multi is a more involved fix that requires
-a lot more refactoring.
-
-CVE: 2026-40215
-Reported-By: XlabAI Team of Tencent Xuanwu Lab (xlabai@tencent.com)
-Reported-By: Guannan Wang (wgnbuaa@gmail.com
-Reported-By: Zhanpeng Liu (pkugenuine@gmail.com)
-Reported-By: Guancheng Li (lgcpku@gmail.com)
-Signed-off-by: Arne Schwabe <arne@rfc2549.org>
-
-Change-Id: I7c5fa2a7a2563b7a8955d386411f3ceffe5b092f
-Private-URL: https://github.com/OpenVPN/openvpn-private-issues/issues/112
-Acked-by: Gert Doering <gert@greenie.muc.de>
-
-CVE: CVE-2026-40215
-Upstream-Status: Backport [https://github.com/OpenVPN/openvpn/commit/4a2c827c2536aa03a1d6c7cc916689a46c067187]
-
-Signed-off-by: Gert Doering <gert@greenie.muc.de>
-(cherry picked from commit b2a15fb84d85790eeae4a2e12b431cbfd0b0302f)
-Signed-off-by: Omkar Patil <OmkarAbaji.Patil@windriver.com>
----
- src/openvpn/ssl.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/src/openvpn/ssl.c b/src/openvpn/ssl.c
-index b188b4e9b32..a63d142ec46 100644
---- a/src/openvpn/ssl.c
-+++ b/src/openvpn/ssl.c
-@@ -3280,6 +3280,7 @@ tls_multi_process(struct tls_multi *multi, struct buffer *to_link,
-                 if (i == TM_ACTIVE && ks_lame->state >= S_GENERATED_KEYS
-                     && !multi->opt.single_session)
-                 {
-+                    check_session_buf_not_used(to_link, session);
-                     move_session(multi, TM_LAME_DUCK, TM_ACTIVE, true);
-                 }
-                 else
-@@ -3353,6 +3354,7 @@ tls_multi_process(struct tls_multi *multi, struct buffer *to_link,
-      */
-     if (TLS_AUTHENTICATED(multi, &multi->session[TM_INITIAL].key[KS_PRIMARY]))
-     {
-+        check_session_buf_not_used(to_link, &multi->session[TM_ACTIVE]);
-         move_session(multi, TM_ACTIVE, TM_INITIAL, true);
-         tas = tls_authentication_status(multi);
-         msg(D_TLS_DEBUG_LOW,
diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.7.0.bb b/meta-networking/recipes-support/openvpn/openvpn_2.7.5.bb
similarity index 95%
rename from meta-networking/recipes-support/openvpn/openvpn_2.7.0.bb
rename to meta-networking/recipes-support/openvpn/openvpn_2.7.5.bb
index 5cf7735eea..0aea6b7e74 100644
--- a/meta-networking/recipes-support/openvpn/openvpn_2.7.0.bb
+++ b/meta-networking/recipes-support/openvpn/openvpn_2.7.5.bb
@@ -9,16 +9,13 @@ inherit autotools systemd update-rc.d pkgconfig ptest
 
 SRC_URI = "http://swupdate.openvpn.org/community/releases/${BP}.tar.gz \
            file://0001-configure.ac-eliminate-build-path-from-openvpn-versi.patch \
-           file://0001-tests-skip-test-execution-when-cross-compiling.patch \
            file://openvpn \
            file://run-ptest \
-           file://CVE-2026-40215.patch \
-           file://CVE-2026-13117.patch \
           "
 
 UPSTREAM_CHECK_URI = "https://openvpn.net/community-downloads"
 
-SRC_URI[sha256sum] = "2f0e10eb272be61e8fb25fe1cfa20875ff30ac857ef1418000c02290bd6dfa45"
+SRC_URI[sha256sum] = "c6864b3c7d4e059c7d6ce22d1b5fa646c8b379a06af872eeb9792b6083a44ac4"
 
 CVE_STATUS[CVE-2020-27569] = "not-applicable-config: Applies only Aviatrix OpenVPN client, not openvpn"
 
-- 
2.40.0


