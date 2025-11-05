Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D64DFCCF9F8
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 05:08:03 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2397.1762319277879468235
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Nov 2025 21:07:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=fghYnHL2;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3404044f81=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A54dbcP1506741
	for <openembedded-devel@lists.openembedded.org>; Tue, 4 Nov 2025 21:07:57 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=qEIryAjhoD/U13JxEbNa
	6raHw8RZolawDPl6Bzt6/Go=; b=fghYnHL2GbKns0ekPw7NG3PC+zRGBKPYzc9W
	XNfJJDFHMjcJ1OCkC+cgMW9J7vQGZLWq0qD/cXLaYWFC2jJi++7LTB+IiuRVN/a2
	z/Dribr94wiIVdCABKQQ/PnA+O8Ckt3U8i7p6qr8+UvwI460MhtRvtJB1qlpTtBK
	OEGBVjpqt0XkjbPWvKXSOlo+B4aJobmjN9axLOoeyL51fpVG/Lxce39xzhMPBeQw
	MVyAObdILLVqEIEniaXueYIlCk0fjRzn45R5O7Iyjd5x8zplciwkazPA48knGxmc
	9KyYntFd3q0Rwb24iA8q6pqVGslN7sYnXbxk7H+59d8Qp8zdSQ==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013043.outbound.protection.outlook.com [40.93.196.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a7wd7g3y3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 04 Nov 2025 21:07:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lWMUTG61gJ3+8oY45ucWZJUDJRflO7MoyKQwM/jI3aiYoupvebIla/NTNcEq03K3zo3oc10TCxwyMLKtWPbIpnVq1A7hPXL6X7woi4ohTlwwiE4//VzoL2/uUv9N1YB+P4IykY0+4AlAXqIWw5FL+Dk2wm3Ur4EYhnKF6JJ5uSQuUkgSMGFUfS+v4HoWO7zz2XZHsmn7IHgwk4HbovCp8h4Ig3v5/lTQFAmEFrH/9pX1s2CFqnO9ChsSabRs1KBPTPZ2iUYqnkDrhr7dkD/8WDXFa3/GQk8z1VTwISmQhCo+Z4Sd9xEi7L1eiwqPwq2rcVvnDmAPJIMONTogvNCOzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qEIryAjhoD/U13JxEbNa6raHw8RZolawDPl6Bzt6/Go=;
 b=AxDMf/svj8NFp958EysQbTLbOKDYvLvecyQhD8SQJzBCzYM8oEA00U/q8H79roXlTAcHSPDoJtvP+GUXPraTSlTAo+AHBriaMEAeCzV4Tt+GufF0YmFTkXvGIrdWLTtBiYpQHTOzPNGFCfqFcT8Lft0VBv0D9OMihQU/xtZu0mSPt7L0lNl54t7d98fQ4syP0P6Vlsu3kFeeJ/yKHZ9SvuwK38eJT0uD6oHSY8WXZSZwu8BNEADPCNVWatkLzMf2MFANF1BsrzT7kuUf0vPTxWBfS0jUMd3SAfvXG1CUcz1oP39aRM7kmYaRK55ob7T2OS+6uHP8N3SQu/59X2Bvlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CY8PR11MB7242.namprd11.prod.outlook.com (2603:10b6:930:95::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Wed, 5 Nov
 2025 05:07:54 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%4]) with mapi id 15.20.9275.015; Wed, 5 Nov 2025
 05:07:54 +0000
From: Qi.Chen@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-python][PATCH V2] python3-systemd: fix build failure caused by race condition
Date: Wed,  5 Nov 2025 13:07:30 +0800
Message-Id: <20251105050730.2595280-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0039.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::9) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|CY8PR11MB7242:EE_
X-MS-Office365-Filtering-Correlation-Id: 43d266c9-ef82-4f26-cfb0-08de1c294708
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?XTqC+iKFvA6duPLuECawS14Xy9QNJLAzDsP5pUiwCMNHAY1oA3cdkx5DotPs?=
 =?us-ascii?Q?CDxwUMAzy/H3IB+g/cwsEYdU3CEksAjWiclMY2q5w+vSRfh6Flkjhr49P1Q7?=
 =?us-ascii?Q?3HGvb6d2QqU8ne4+x1c4CPuOuDE6aDKWwmFo6L3fBf7Kvfj2A8IOLHnCb1bM?=
 =?us-ascii?Q?ykGI5mrbXA9Ha1ugUMPzc9oe/BKR4ABFoI9JSuX8tSp1Kf/CS0T9L/7tF2Yt?=
 =?us-ascii?Q?+a0RdljU6j9bAcyYULIzMMWEnL9Ie4p3F3LcpHnR0QRQ2tMieOEzXPS1FGcy?=
 =?us-ascii?Q?na9vlrqck7/tYKxjMmuzhawZ7qtm5aLhWuLGjLduF9LnOPVSnbDwbg4MLcVQ?=
 =?us-ascii?Q?0QuBak98hSsPYfxQ+tbDKgCpO2vODtOQYflEJFTS6z27VY08k68cV2P4pS3I?=
 =?us-ascii?Q?KX1jm4+UQ/OE7ExYa0VTeAYtCcUJdS7sKW64OEqySnFAzh2X2P438eFdHuGM?=
 =?us-ascii?Q?oA0usw7BKSeK/fg7J0T6Dx+3smRYImIj0idGwvVKAVZt/Zb6jImQxlOYfItf?=
 =?us-ascii?Q?eT16kZ1BriJsWxctVSwi4c4S06xA5LrPb4Br5sdt16UYFL73KIP4CUTT/NbH?=
 =?us-ascii?Q?WXj+sa9yOummIqx4R+TnFfpiaUG9S7F0p+yczLr2dFM5H7+DABK8vFtj0TQc?=
 =?us-ascii?Q?1SJEPi8kY7fxXVrnuJu4uMTTvkTdsUaEZaUdoA5k3iiITF1uqyYUXGEYCZMH?=
 =?us-ascii?Q?8nN/ATfrsRWS55g/dfGf+7tt/tmLO2kS7Fck7c3Ji/kX3YQWuvZQhsx5bIVy?=
 =?us-ascii?Q?uHfNrpIks4rMIYVLZi2lFeynBIZ7DA7ICBCmREUX6k8OQeK9Ekud3t3zMWFd?=
 =?us-ascii?Q?uChA1cR/m/ADdeoKPABMAAX2tPQc8KaX3oWo3HfPVEcZuayDMgL7VVlkCGrj?=
 =?us-ascii?Q?Glee5cCBI7YgmVfEQeYLLbFkTwo5reyq9r9LoP+CZ56HOhLVy65RP+OY8ajG?=
 =?us-ascii?Q?hdApY4gYwQ9Mh/DsSu1fyigQJyPaEv13n25d79d7lRMOvUEx6Lyk2sMvaRye?=
 =?us-ascii?Q?+h5bxA9AFMefk8wYiUIqWKfcz2RxLOUm2JFJadbS/M6/MFJXTpvEwPLHFv43?=
 =?us-ascii?Q?UyaRAO6jLZG5Wf15zRtuADdqMMIvKRWs8m2ydyEauHcV1YOCk6lRyvm0T1++?=
 =?us-ascii?Q?NqF/pJhqoYjXNJ7ovR7teWgaXV3xC+zvU//NOK18NS2v8JMciQZvHtKTWWh2?=
 =?us-ascii?Q?x/2rTiCgfOGqZxOf/h+ry1T7lZpGebyd0swJvfXoB03UD8elc2DraQTFDCdn?=
 =?us-ascii?Q?xIVESSXCG1jZJfnb84nOTGJ+gGjQAgr1OGeKzVvIVLXtVZlFLL4UkGv48Rc9?=
 =?us-ascii?Q?zPtg09SY5m5NP9dFqdrgky1KMCkkBpAW6Zor38dNjIUCCK/iMGj8s0utXule?=
 =?us-ascii?Q?p5aU3wxw/U+KwWNDIQrl22eLQyqPcla0cp8VZ7bGW2ChSYEDftXDz3m9eLTu?=
 =?us-ascii?Q?8RveDhkpeJEtxV37xtvY9/sB6eJrvot+dNES8e8QezahoJY6/nAyJvK5Xq6s?=
 =?us-ascii?Q?i30PXptfXteQ5NU+8a2GFJWgrsSGXT2HR80A?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?vBtoRClK0JOsoXwrSvdEUsleF1qGCFsLkGJh4PCKs7JG27l0e8eIxlaNU0CV?=
 =?us-ascii?Q?bXlsZ6Co+oNC76+QCpfbEqdxIASvQnnCw7QE7SGem1pDCCfKjl1CneRzeJpV?=
 =?us-ascii?Q?fyYmS9RJrAhZL6BaOsBaL9tMOFd2Bg+8Ef5s9J3ZFvsoHTpkuSlhTuIufi/i?=
 =?us-ascii?Q?DoL+urepM+JqfR0ZGKcQQh0e/jxn9+dC1RSPRwyxzK1fnDgOtDJGxGCPRwW2?=
 =?us-ascii?Q?zCj5m+XU6epONLaAB00V3gKO6n1Dam8MPs6+t27WgTqBtTSOycYT2OusAQOG?=
 =?us-ascii?Q?fsyGTgXVvE4Hskgw6r6Efl7AualCQC8g7J+wFYXDwkGPag+JCXUn5LmW6S/4?=
 =?us-ascii?Q?O+kUJAS6HpV3OT98J2IWT9Vo/wb2mkM/X+28Tr2sM0HSHis139aqGjWsQjdf?=
 =?us-ascii?Q?I23Dl8TygRpEkyS+dMUAMlMtgjTk9XSNpfA/BifQMr2CKrcYIkvkPFtfq05/?=
 =?us-ascii?Q?KRyp+VeoAr9NLtNEUCNK9GYPhpljWdBfAHM517qnMGLK+NulCCHXQTDRSgoM?=
 =?us-ascii?Q?fY5yxwSiRlcrNRh4/HW9/5LrWT1SeDZ3cc9s3OnQSzgMf0NBu5T+pFEHq4Ah?=
 =?us-ascii?Q?CVPbri9Kpm1InUA+w166xd9uqTpW9fcufC5zSPZPq4/zGVA9es3E3tdQanSK?=
 =?us-ascii?Q?K3XvFjPFiIuBZzWMEYRHPxcPr6P3QRMNcQMdbkR/V9/wFMvEzujK4KvLHbcI?=
 =?us-ascii?Q?n+i6oPZUBigqRlAl1UlikvzQ0Iu74uNPzLOe+a73lcVIBUN2VFrJB6+cKCJV?=
 =?us-ascii?Q?jany2UksbWtcRRwW0DQNTiV+WdlPKRhNq/AEn/Kh9KZ5K2D0pZO5N0Wcpb/f?=
 =?us-ascii?Q?pdy+3jdLwVwmoCfZoYHxDav8MY9mj/xjmHB7x2MAfRJeCsI4M4nZ1KYVWoqE?=
 =?us-ascii?Q?DVtRqq+Y5QJUapNIeLng600cCLpf7Ik9Q1bxODpQY4Sz4Twks4af+so0JqpZ?=
 =?us-ascii?Q?Wgi/Ed2GIkyFtPGh6UMfGQI4FHz9EAh4f1zvwXMWEsV6AiJ3BR2KMaxEr0zz?=
 =?us-ascii?Q?93m1cZz8DDTNWE0kGbIctw28HsRu+WbH6vHBkCb/5B8OSGUFF5ItHtGkGspA?=
 =?us-ascii?Q?QwviRjTnYjyQqyrcPZYIrKdXBs36ItINdqp20HIM1q9XamjO+YGbMaINU1XC?=
 =?us-ascii?Q?l2LtmiJiSYe1U4Q8bnkyP7DKGWDy3GQMfJqWCcBTMeQl5EY1eUd7UcNJC+Dl?=
 =?us-ascii?Q?gNETfGJsc7HDJPRLM25cSCbIO3r6Kt5KIZOn+y2Sh9pnD+5rrWbP/rpl46I5?=
 =?us-ascii?Q?2fC/7VDGk17B2lXJobOIWGc7njdcfmz2PSIq7H1uiuYHK9ch6DFNBnT+MB6H?=
 =?us-ascii?Q?3oG7K5xke4Oq0w1GEUPzvCilvVPh9pfd4/Nmr8MnXOSMP+6rZcLN5S/YyO9+?=
 =?us-ascii?Q?AWO2trIlwVT4Zvq951vVRD+NTjsWBLsfsmEH89oVFEYjEcPoG/bRT+dssXmD?=
 =?us-ascii?Q?gjMB5MEeD4Oht6u49f0Csz58QMMZYUQhujX/otx6yQLDvkLKzBH45w9TZWyt?=
 =?us-ascii?Q?rHxElkRKXLLWqV14W9aP83iqk4sdr1aBSzcWVbfi6AWkLUda3Am5yNCGj6DW?=
 =?us-ascii?Q?fvC0ZE74yDig+SYmavzywG8boQg9Ft+TBbDBFKDT?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43d266c9-ef82-4f26-cfb0-08de1c294708
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 05:07:54.8025
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZvbCSaqYSXQaJiyRBL9Xnjs03Feh5x2PHwvkcvTSEMfs6uM4ct/Bu8CJRTItQuCE1fcRGslWkVA0iHpnXpEnFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7242
X-Proofpoint-GUID: PLiTWMM9gJqhELCkVdKnu5Eu-VUf-lhh
X-Authority-Analysis: v=2.4 cv=Dacaa/tW c=1 sm=1 tr=0 ts=690adbad cx=c_pps
 a=uW7feKH+bNkESiv0jeW3sA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=XlCiLC4QaC34ana_LRIA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: PLiTWMM9gJqhELCkVdKnu5Eu-VUf-lhh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDAzMyBTYWx0ZWRfXxcu6JU2Ep6jl
 NozP2fCnjolQNSJIXSF2/pBepHcrjRtqUUMUrLKrYPFkh3rbp0HS+/aqKlzkGjUroqquGUU1G0x
 V8KyAEVrdtSkvkvsGtgJz+MlyE5PIjBZ3r4NtHa+GprJRXv4Tr5uoakwLvt2zkv8dZN1SlKgrxo
 u+/rcLZBgUqCuZNsh5bo5TsGLZiG8QRcU0WBw76xk5XVf0rrUQkvYxCdzxLCHXvZN99XB6g5nI3
 JTuU9z/8A2SRo0BdRdzmNTDR3UA7YnK3AbUAVNqApp4Fc0DNlNcKkAE+QHjOlgU8faoGYtthBhv
 B6npukZhPx6z/FQSq/obK0ta+TW52FLANBZonLblG9dqpz8s5JMayoxF+VQNawRw45dqhqIW93Z
 1afRbNlnWS/ZyW/K1TLSn2UZQW1cig==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_02,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511050033
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Nov 2025 05:08:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121318

From: Chen Qi <Qi.Chen@windriver.com>

For now, building python3-systemd sometimes reports error:

  pyutil.o not found

This is because its setup.py is not written in a way to handle
race condition. Multiple modules are using the same .c file,
resulting in the corresponding .o file generated multiple times.

The latest release of python3-systemd is 235, and the latest codes
have switched away from setup.py. So we'd better not patch setup.py.
Instead, we handle this issue by making its modules compile one by
one. It only has 5 modules, so there should be little impact on
building time.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta-python/recipes-devtools/python/python3-systemd_235.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-systemd_235.bb b/meta-python/recipes-devtools/python/python3-systemd_235.bb
index 6b44751df7..269e175cc5 100644
--- a/meta-python/recipes-devtools/python/python3-systemd_235.bb
+++ b/meta-python/recipes-devtools/python/python3-systemd_235.bb
@@ -15,3 +15,6 @@ inherit pypi features_check pkgconfig setuptools3
 REQUIRED_DISTRO_FEATURES = "systemd"
 
 RDEPENDS:${PN} += "systemd python3-syslog python3-logging python3-syslog"
+
+# v235's setup.py is not written in a way to avoid race condition
+PARALLEL_MAKE = "-j 1"
-- 
2.34.1


