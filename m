Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23D7BEFB7FD
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 05:53:48 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14511.1771912414759684161
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Feb 2026 21:53:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=oHNgbQK6;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=651558347f=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61O5V6IG3327197
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Feb 2026 21:53:25 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=ub9jN4IlxpgOK6MgRXma
	oSyibBYUcDVJW5Yjf+5qxJg=; b=oHNgbQK6i2ghIX72Wz0cO06sbWB8dKXCo1bS
	49NLqRp9okXqakhv0blYm1UFYBaWgLniDzrIIS/IDAvekPgTCDbl6NlASBozi/JX
	syBF4k8L6+Buo3koVsCcXU+OkVEukNXhSH5KWHv5geELFMed9pNzn30Psc3DUCTj
	K3kRBmAnqyE3VfQYvjRi8akx1RhbeVtv1wXcWYIfGwH81Beam2TwdcRPXjVKbeOd
	eY1eZgfuDjYVGm7kZ1AEXbFjBOXy3NBZRVltx1RVUxHQhbwL7FRC4r9D4Seu2YRz
	Ygz+7s1BHKE1yw2JUjyrv5ji8Zgq+tPk4zSgRd7E8VwZFLF5Qw==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010071.outbound.protection.outlook.com [52.101.201.71])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cfd3k2fy2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Feb 2026 21:53:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=teqPiLNa3aj+YNUxMlzqExYMiAbhr6I1/26n5Cp2r+59N5T1S0qXCubz9U0Ty8VIEnIwketJZNYIwpOa0MjGK2OWuVX0fmCgP4ml87d+ld6cfW4Cywc6lJShi8Hy5ssV/LNfoWYrKRc4CryKDe2/6m4NvDdqW+SxcuzfpEAeBw9pd80/fPeRU8upQzVJZ1Z2m91KjPwk6U9tBjeto6wSS/jsiLRG1dj2Ye6NGEC/MJ81xTafFQr1KXFO963TQJHkPt2j/4bUICKiWNcZCtZh9OrrbQW0XHAzP3XnD7DmMd50Wou4IzYulQ8uXclYjcwSMXa2lX068KR2cB4PH+9XFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ub9jN4IlxpgOK6MgRXmaoSyibBYUcDVJW5Yjf+5qxJg=;
 b=AynBALDE4vRuOrae+96e5EgGJepWvXtYn1w8Dk7UWnkdDRYgpeJCM2CeBDali7W3duGRiH5FR3ZRVvm25kiMurovzbQrFe1KaAgvl27ZX3S3/dFZBeXsZ3fuySgXI5vGby/rwNqobHLJFC+Tfff5cEpMpCgCepaRV/FS5FE14I3TzsUeskMdLPr8BtqxY6fl56TbF0DMaWAb63QGTIRIJUbWqja7zh9EFzloJphwTxEnQw289nT3+MfbuwNCDFKGnQaBb/6pgmu1aUv3EXkofsB1k8Mb3jN/WPo6VtwFirt7n2lgQT0cCc3AA7Uotw4N8GXNO8wFrWyIYksIFOmoZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 PH8PR11MB7070.namprd11.prod.outlook.com (2603:10b6:510:216::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Tue, 24 Feb
 2026 05:53:21 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::3432:2eb3:d0a5:7831]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::3432:2eb3:d0a5:7831%6]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 05:53:21 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] blueprint-compiler: remove recipe
Date: Tue, 24 Feb 2026 13:53:06 +0800
Message-Id: <20260224055306.158822-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0202.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::27) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|PH8PR11MB7070:EE_
X-MS-Office365-Filtering-Correlation-Id: 46cdeb92-e8ac-4b26-14fb-08de7369040b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?RdpzDqCsDn03Azdhhd0VmkJV6+JsSFrUA1SyzCqe/zCwifU7KQRq8t0cwHhu?=
 =?us-ascii?Q?nJTenIiCSK3YQvXX5Z3QFfMvn0WZt9WyVHRU3NzWwK4UajwwKBw9buFlOrFj?=
 =?us-ascii?Q?P0hqABxzCagkDi8Ar3qdv6tASIoD8ALAJif0q6l6/TCTlRCYMd3pDoTEkjN+?=
 =?us-ascii?Q?vYsULi3tK7Li9UUcaYGiCEoIPTxdThZk0OSLtcIsbZM1yE7kool8sHrZPuRB?=
 =?us-ascii?Q?i47+5P3WSoPiv2UyAXbrrbIfYjDf/DRijGjYoQnZMMZq10OWcgi9cKj79pGH?=
 =?us-ascii?Q?MOI9W0ieuvcg8rFRTxJnm59bLLjdwXFFX0rGw+Xlv+DESdRoEv/9XrRl4RhK?=
 =?us-ascii?Q?KTzUOl1pXhMLNvMSqK+TTM8nh07jdLIj3yNnIIWUVL+LIKIGaJEM0F8VrUsv?=
 =?us-ascii?Q?zNu5kaVw6WFUJmzxOMfAqj9KSDpkvcC2hMJaT0qrmdvwpUrf99qu9vkxm5e3?=
 =?us-ascii?Q?Inuy7fTNLONCW6XYCFbN0fnMhxNV83f+7B/QbitKkzODsjJem0BB8NArkZKl?=
 =?us-ascii?Q?6F+kyre9ZCr+bCEfr9So1wQ6T72B4mrlo+3b/o2aDTRc5dIrtgD7CW9wCLrk?=
 =?us-ascii?Q?m2CLBeLHYWeEs3CNrDjO8TgtFJLteZP5OzaO7jdZVsrqgEaFnU0hDkHK3SSW?=
 =?us-ascii?Q?WB4hsBNH+BU/YB2jrteJZHaBMpGjbkxgcFu2PMjmJCXBfN38tof/xWvEeMiz?=
 =?us-ascii?Q?yEPwgBOlpTc4qtKQ6EipHVCEVAK+u08Z6KgFiXIE0eGCA+Z8kmZcHdEMG0GH?=
 =?us-ascii?Q?0pPAdkGz6hRAmidmh/gF5BlnYFFSNTenkxy9IcTdLzclGTzAz/YzDB60xIF7?=
 =?us-ascii?Q?tfsh+uqsTEiJchdkCWQC90vKtZousS0QUKNa76y0urC7sr3vS0QjnpRjzM3k?=
 =?us-ascii?Q?ECva7dpqfyw67zTULMb4kZXZttluZmG75Mk5gXd/0uSoEixklWwMRplhDYBH?=
 =?us-ascii?Q?xtuxb2LJ0Ppa98AZxoOJpx1ykl0MmBJfu440lXaLuP6mrZ63Y+GpJL7mGywv?=
 =?us-ascii?Q?0STR4WX3XsaXuDneY8bPazQrYhhACf0fvss4sQFrCjwAFvb2DnVURTJRz0aL?=
 =?us-ascii?Q?bvl2nLF2Hm2GtxGR30VWN7K1gsxogwqzUy0gsLJ3X09AmFegbIjns84joGQg?=
 =?us-ascii?Q?Dzkk32nNmVSFAKe9l6ycIy4x6na6A4FeVPBqKUVJKkEyFc04UCJg6x8ES4Ff?=
 =?us-ascii?Q?a5x32AkE5ZillIlxGZSY6XMmLLJYu7KCNbQXMb8OFusjzThWbg+NUSxMjZel?=
 =?us-ascii?Q?myNOJZu+Dg9Tyv85dwAcJCVlH1dn4U5lMz47GNMQ1zXBHrsTpa0C/q3FTIhU?=
 =?us-ascii?Q?6BJ5R/QxMEojWdhAmv6JmPlqkbhtj+aqDxVAcj5S3WioCz51T5r2Ym8vo+hn?=
 =?us-ascii?Q?0UJiqFIbkI+Tqcu7MiQ0wweOQZt2FtWrDKnuOA/Y2UX6MY2B6g9Fugsig88d?=
 =?us-ascii?Q?grShsGwQMM48DhsoYoo7dMM42NZDU1dG47laA618nOghdubAs/G7a+nUXFlF?=
 =?us-ascii?Q?xlA8JEof3dJjf5ATh1iLHwMTkN80GLltYUNOC14mGSdzcCQo78YUZnL8sxDG?=
 =?us-ascii?Q?Lm/S/IMQEyIkY7ZH5Ilviv26LmM0r2k5eRiS0XqD5eIsD/sSrp9wAY4owHsQ?=
 =?us-ascii?Q?avfYJw2cQjPofhEOA5v1sFo=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?6F1SgPFOEBm8zG4FIN3hC1dgEZMZm6tgdXbu4Wp15Htxr3mx/WfY+1h1fnln?=
 =?us-ascii?Q?IZrq8tSRY3ofRjQkeR3cWLKcYjTP5ZQozVgxG1qPLOTi2IbpeyqBpFG9ORq8?=
 =?us-ascii?Q?W7fwbMeEAytNPP5CMJ5gdrr7SoUyPx1BdFuVNp7zSeX2Yh9OgoD3V+5PURaK?=
 =?us-ascii?Q?YX7VSDEyGNJapbRgh/BpQzIwKRyFon0N0a3y7a3NrunQDHaPcMyo7TEUJF/Z?=
 =?us-ascii?Q?XFGmV+6kGKwR1VpOXKgmP+c8phq4AeLvpIDTjU3ZJUwS+ig+TcAhbnKgX2g4?=
 =?us-ascii?Q?wI7/+kzxunLJpBQxkaCUSrWaAut+Hhqs0ZCcs91wVLenjx9yLhJ9ZKXGjMtm?=
 =?us-ascii?Q?io4W+ivXntjycD16OHXnPXs+PdFJqvsu0Lmzqn8zExZOjolIL3LiRsqq8WZZ?=
 =?us-ascii?Q?Ig6zoODAIoEtnxpG9uPzBr0QiSe7AumuOQvvyUmtElGCBTkIfhGNSujRi7XT?=
 =?us-ascii?Q?DPBE00L5U/Wk/GISqlqt5sIV4WouRp9zTuSNUAJh1PYtujQFenWwJcR+zQ4w?=
 =?us-ascii?Q?lDz9AFH7O6pSXJTwjntMODqefXFgYsmbXirUOtFaA9Qdf5fnZkA1HIEgvglQ?=
 =?us-ascii?Q?DX5vlyEK4u0La+0LiZFicJVQyTI7adyv+pgbqdcWOsAhpA//74rKyusG5CTc?=
 =?us-ascii?Q?o0rzWDF0u5foY9KLZ1K4colg0cJa8Dw7NBizfNs8l0lX0nuiA6uDqpezAkLJ?=
 =?us-ascii?Q?s40PTyhZreqBv0rDNmzMn1bW0XDIINf/nWQq5oaUdlLgwiS/tdSy4kvHOXIR?=
 =?us-ascii?Q?edCrDpmuFMUir/Kg4GGzhyhl4MNzWZ5rSL2ZEExdgAZfPBe6z/74gS8OP8fl?=
 =?us-ascii?Q?o0XJcD7z7L9jV2QtMt6KyRH5Oiu10kN2Nz6E9pAWTGXmIYo4dg7HVIJipKbS?=
 =?us-ascii?Q?1rMtS5TWt9wm8egG4GDpM4mkhVCyH/Eau+pwo4xpijN6m7HoLOGXqoQHBLMi?=
 =?us-ascii?Q?AZMaNkNacxUwdlduvIGXFDYfL64wUsWt6050J03afYcV1vS8Q2b0488Wlnu7?=
 =?us-ascii?Q?0Am/uxVeNYYaMkLgaviDoAYp+1zIYhbUhVyQP/FMIB2MP4UlMQZ8YuWFNFMz?=
 =?us-ascii?Q?d56MBfPamWh7KsAZtg6Ir4FPF47SWW1VmARLFoPiozd8DWEqLanE9C6vw5H7?=
 =?us-ascii?Q?jTeQJOvKzWhC+KBTMvzztLtr2mscJ917AcR04baWzOZw3NUnR7fB/2X7N2gB?=
 =?us-ascii?Q?mDqyWpOWT+ZjGyhnlc4LxJFf1czwVIJN9PCyaW3LsXiPVW6xWAWpqH+V1KBp?=
 =?us-ascii?Q?p/NC2rcTdWq2ehgG53/4/JHknWGAkLmueW0bcr7U4bzoIbhDPFCM+c08UCkh?=
 =?us-ascii?Q?JfrEjdS1pxSKKprhi4Q1iNwzE+0q8gd/O5fKXLOyfE8miiduDQbppEATtlYd?=
 =?us-ascii?Q?S7URNczZl6OQA1Amv5tQbvA+f583OMh72LohRXgmvY/Xav2vxu5sjwrLNXxN?=
 =?us-ascii?Q?8x9uKJ7xSaao3aZPdgI4Y7BgXuCV9x3LhLAzqcwNzOwggVR8s6CWX1C0pVuy?=
 =?us-ascii?Q?08vZg+4OQKTn2QXoWjnHJNgLdZrgWp9Q6jibDepaDywkiHiOTj68s+PeaTRi?=
 =?us-ascii?Q?Zo2smoFoYborFa6qoUoO+TOVw/2Plz1DhDwMKqV6CtZmHgmjyD+0E2ATXFIU?=
 =?us-ascii?Q?2Ls/ll6XhJ8t6cIeCzT0MTXAVX5+gdjyLRfvMZP/zdBuseGujxqB9Ku858Cc?=
 =?us-ascii?Q?bQhDIgY4WE55gNNVc/TSFB2epO/+MCzkqvYCjBYYExBl378GJND6ECl/bI2l?=
 =?us-ascii?Q?JFSPmvRFsw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46cdeb92-e8ac-4b26-14fb-08de7369040b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 05:53:21.2198
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5XVC6epctC77M/18VuUdwERGs8s/Og0qSxzyd/Z8obBRNaPe+b8SS0EKJt9mCpTMTYvnlUY1PQDalSJ7PmsNjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7070
X-Proofpoint-GUID: wymFqs1TLOMAntfbXKAvNwjbLt0jt0Nl
X-Authority-Analysis: v=2.4 cv=Bo2QAIX5 c=1 sm=1 tr=0 ts=699d3cd5 cx=c_pps
 a=zi9RuwRnjJAIHZVcFFhnlA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=Q4-j1AaZAAAA:8
 a=GHR8O2WEAAAA:20 a=t7CeM3EgAAAA:8 a=arLEcCHjAhs9KNj6hCAA:9
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: wymFqs1TLOMAntfbXKAvNwjbLt0jt0Nl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDA0OCBTYWx0ZWRfX3ChvUjPBoQqf
 S6wYYZalF7RgMpD0qshJiPv/ePU/mNQGkn/8RX5jLq4HQNhcdOl8Q8c6dux9v7UfVmpdWHQRtLA
 gQP8UZlYbxQWv/BZbr9wJAG9604WXdDv5mnU4v8x4LZkWkbHAPhgSmx9MkbPgupJX7vdni7VWST
 H8ON8KqTpJYtGqoh2SP7L7TbqqZIK8dyZKdswU8y6OXVFR9L8KnznlivtbzDOr9k6ua8oNhvzcn
 FyUiMepr3T92AIpsrR+TKaGEw2T8F0yUTUEIJSB5RXwiG+Grv+KtObphtS/et5A0HZ+gwiF0VHC
 MGY1dO6Ot898jb+zLJdajvW2SeJDdTwYzO3mvqZqz5sH6F4NJDo8UcYKz9EppP2oCueWcT4Yb3g
 rtNF8pwvGM415Af5UenVSWSqJj0CCq5pq0jCFlDp+8Pg+ZV69qUoTaDPW3YdgVI725QjgzTxKEV
 pKeufQiWdZ2Wg7/qwjA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_06,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 adultscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602240048
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Feb 2026 05:53:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124571

The recipe has been moved to oe-core[1].

[1] https://git.openembedded.org/openembedded-core/commit/?id=4212392ca7ebf890e1e192ddd0e7dbe1f8dabcf2

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../blueprint-compiler_0.19.0.bb                 | 16 ----------------
 1 file changed, 16 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/blueprint-compiler/blueprint-compiler_0.19.0.bb

diff --git a/meta-gnome/recipes-gnome/blueprint-compiler/blueprint-compiler_0.19.0.bb b/meta-gnome/recipes-gnome/blueprint-compiler/blueprint-compiler_0.19.0.bb
deleted file mode 100644
index 71f9c2b52d..0000000000
--- a/meta-gnome/recipes-gnome/blueprint-compiler/blueprint-compiler_0.19.0.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-SUMMARY = "A markup language for GTK user interface files."
-HOMEPAGE = "https://gitlab.gnome.org/GNOME/blueprint-compiler"
-LICENSE = "LGPL-3.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=3000208d539ec061b899bce1d9ce9404"
-
-SRC_URI = "git://gitlab.gnome.org/GNOME/blueprint-compiler;protocol=https;branch=main"
-SRCREV = "de8e15f7791bd6243279cef1efc27edf4cb93674"
-
-inherit meson pkgconfig
-
-PACKAGES += "${PN}-python"
-
-FILES:${PN}-python = "${PYTHON_SITEPACKAGES_DIR}"
-RDEPENDS:${PN}-python = "python3-pygobject"
-
-BBCLASSEXTEND = "native"
-- 
2.34.1


