Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DF4CCA1010
	for <webhook@archiver.kernel.org>; Fri,  5 Sep 2025 06:18:24 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.14962.1757053103623928538
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Sep 2025 23:18:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Rqpo5xg2;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=134374454b=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5855oeXE1527304
	for <openembedded-devel@lists.openembedded.org>; Thu, 4 Sep 2025 23:18:23 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=SwgPuKtJNOuH4qH4Bq6/
	P9gPYuHY+hyBGjW9bdRfXJ8=; b=Rqpo5xg2pmI6GTaxFCMd/vqGuup38l3+S5CR
	Cn49x2e2BvEOyRYir9hmGYapkzd2v/qdetteY1RLhlixeWz668UCdpk7Y0ouvUZG
	jIXxZ57vT78g9Osdcs6PyiJoED7lWu/vI/+1SGsAjLlcjDnjxVjgifd/cn4ob0a5
	xVQIT8wfJU+8PdvgztOpTYnWcORG/bcXF5DAMz2uTz9DSxFGRWx/4tPgiU07IF2R
	Zq77nH18zbaTkBl5ykp2uV3O4gSqICEziIl1IamrwI0C+xIuq5dDJ7MTJmoJmILQ
	OXS/TRClCF8BnP6e29P/bUbumpMwW7p+7hf+HtdGnCowrgYg3g==
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02on2074.outbound.protection.outlook.com [40.107.212.74])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48y7kkhdhr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 04 Sep 2025 23:18:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X/gYfzsurLuLbjZvkx4OsTAK3DNwuHTPo3lZ7l7aKY2ONXRTjrUBYYrrasxZzijc1dHBXCiUAYkfd8VvL0/BDZZ4UdRHxTf1rfePe+kDQWATghbvifyk3jprYuFjfB3Q2Ht9K2760yYX4Sye6MJun1Mo30Igf8JglXTc0C8Jwlfwazy8oJUxgUnO5d3zq+SDUU/1nNzUGjJRVPC7+rRyGkklQCMkqhy/HDdi1ZdknT1Yqia0DWpPiS1pQnl8bWsri/jVDPoRy7y/JhwRU6wKtD+nY5Z/tog4Eh9B25hUQyWKEVS3N/aVhlV7KMYU3+mnwBBMoHh0O/7HgMsry0VYwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SwgPuKtJNOuH4qH4Bq6/P9gPYuHY+hyBGjW9bdRfXJ8=;
 b=RQhlm9hwzBel0mjPkXqPCeHtD91cvfT2guWvG3kQxG6Ms8C7zABsWNVyaGb4G24g5kVibygV/1otdfXuhh9Fqgow51wMl58Gc6nej4WgZir8QAs4PoTXwtwwMmVPe+LX+/r3dBui0vVothIFOo1kvZYDnuLBtgC7CQ5PoLuvP5WKW49uak+z8EFXcRK0g6kPLzZlriWa/yreNCcT5DpnrvQsIAaFV+o9l8FvZsp2mlEmv+h7sJQwBUixIDsfrKNkkFhP0LlRtU+1aycBVX6uAXz5DllOFpmcGc4TyQSFb2RK/kzm1cST9YbY3q4WqxeZiI1m1ROfCu4CphjKfL/eEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 SJ2PR11MB8371.namprd11.prod.outlook.com (2603:10b6:a03:543::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.19; Fri, 5 Sep
 2025 06:18:20 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%4]) with mapi id 15.20.9094.017; Fri, 5 Sep 2025
 06:18:20 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] tk8: upgrade 8.6.15 -> 8.6.17
Date: Fri,  5 Sep 2025 14:18:02 +0800
Message-Id: <20250905061802.500766-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0264.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:455::15) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|SJ2PR11MB8371:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b385a8b-28ea-4b0d-aa13-08ddec4402af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Dw22e1Q1JNdGHgRVhX24hhtQxTr23GCWU2RFSSzsolRjfn05j2lqv/yTWQHy?=
 =?us-ascii?Q?yr3V3uUlTcU9pUFy8XQnVJDZuJ108hugLZWX3JWCz99oooAoVJ6oGKI2WL7/?=
 =?us-ascii?Q?zvgZOLoZrcjo08Py+rQVW5PWfGinI/HVORlnzqGXdW5S94psSNB07y2bFnCu?=
 =?us-ascii?Q?F1/EBawAfdI3A4boyf9IiavbhBrF/NjvuPMawdhOz2CLGcwkMFPwanhAhLFQ?=
 =?us-ascii?Q?1YMGxF8iwL3SrFi6VrnVjQN7k6iSQbvaSCLtgVirVfK81TEldjX7lospBSGL?=
 =?us-ascii?Q?dM3jM1tO9wn/7LPAtCR0WUy2W/o27riAPEZyraO8071LX+NrrigKSh94WGTl?=
 =?us-ascii?Q?RvZTqDVGtRUX01wc2tYSVrLMth3HFKDn9kQJERhh5rGTX57wlM145i2Rbd80?=
 =?us-ascii?Q?1wt6KvXrU+FeOwTfXtrHJ1yEMm2+RSYCAFRPLneDS2gTdz0K/9yiXcmNBIxt?=
 =?us-ascii?Q?1Ks6lCRjgy6zP4/mczmmslQ6+c6eUNoOFs6RLtE6SaEMbilOQR1vSPzEXDvy?=
 =?us-ascii?Q?JDQUynuMDSdxsgSARD0y4U3MmjIYQBGo2VCX+3Htczyt5ZeDXMkV9r00gTHY?=
 =?us-ascii?Q?0+BZrHkS3ELAbD0qaiecXEzs4mOBXM7eU4pSy2eOfdNc0MIc+3DDM1VTCEQW?=
 =?us-ascii?Q?mFmfbAxAIpBVtb4IKMYSdFEA4b0tTNMy+Pp3jP9Yu9kiW09M2I9lQ4Bp8F9S?=
 =?us-ascii?Q?mmX+CaGpJzjUfJyd5Zr++XfJMLhQRG4spwkIhxi0aiLXN3bVvTXh4eOHZ1n0?=
 =?us-ascii?Q?/Sl+oWOXSzIAwsrpZI4p9VjntYUtzolMxXj6iHOMNypoXyKxGvW5kQmA/q8r?=
 =?us-ascii?Q?o6h9uI9u10+RkAkX87/bUstyPwFJfSFwkP5A4Rtec3yfyMPphbCqW48RNmfy?=
 =?us-ascii?Q?e6quhUtHxvUKlrfF6xqzidGbUG5ZalSceybL6UO1ELAcMqHbHdNQJmaJKmmf?=
 =?us-ascii?Q?0PoJ6L6yjabeAXo6bsfN2gIcPA4MC7LVCwzKVTg7x6SvSKU7Wh3HmF78+yyZ?=
 =?us-ascii?Q?WnyTxG3rS43ajqQazk0fp02IluqEYfW++fxBYTiREM8fu9QFIXuqfqlG8PyV?=
 =?us-ascii?Q?LR1gWJnk2NdJ4xk8GvZRVgRlccxoJVRLS9jwFfIYtuSzDr1N/l6DfzREXsb0?=
 =?us-ascii?Q?pWH67vesSK9qcAN1f4aUEJYzBK4wtq1lGtmXdKCeYT17Ow8aMoTUoQLgNuR3?=
 =?us-ascii?Q?/ga5ZN2ppNc+wbAWaLO8Q4QVOtNe1QI9lox3xGJkH5PYRGrBKQ4UADeBZuQg?=
 =?us-ascii?Q?FN4doCkijTjbAtDovAZA+WHcSuKzwnx4Ru7GnMzV441YCanKP1IvD2x/utzc?=
 =?us-ascii?Q?TIX4pRLgHgDtzji2g/61+II0vgVWeZIGlrxYVse5MOSLq3svKjU7GmoZG9mP?=
 =?us-ascii?Q?G4SHKfs32HY1BYe8aFBmmnkCHdRbtjTsJTJK/J0O/lBDVK88IXPBXdz/9fGX?=
 =?us-ascii?Q?RSmba0FaXlx1wxnDOiJAGe95cNwMqFtEV01/RPdekzXiaAinl+rlIg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?l5GsJ/UeDTVYl5mgrz6r29J0b352b2QjodUplSV2xCmgWBJAGS8rd0i7/9Up?=
 =?us-ascii?Q?bBHuRXP/zFGlOj+lmXFMfsu4+5xFy+GFfqg/s9C5J/5jSuCLTGIvs/UpH16a?=
 =?us-ascii?Q?tmdXJijzRqWdGvOa3RN9vR7XojeyrYz4UCqpSNTpmxf13HGLfEsSru+E3IXT?=
 =?us-ascii?Q?ATfYiaPoTgGmAFHtHwb5rgnE1rDxE0MLOoAZ0lYjK7tMxJPrHfts2lW6+dhu?=
 =?us-ascii?Q?lkn3uJMr+3xlUiLrr2glQ3Oh5RWZZdVHS9cXylcvA0NCiSDgoUyk8VSCXM8X?=
 =?us-ascii?Q?XW8fs30vJV7DLYUxxQSyaP27Vckty1gkGqRtWv1Fz17CfWOa0SEQJV3eCXsO?=
 =?us-ascii?Q?TAuKe10zBXkcIjHE9H2RRlWWuqM3NWtAxNUQm1cCo0scOleA3O5sDHfY3sdk?=
 =?us-ascii?Q?6f5WIQRYHYn/9SGYjrJ+7wBct900M+lxqvtPJjeT5pzG/8bfYcS9KjX7IUV/?=
 =?us-ascii?Q?frsQN9IQwalok614oRFkZ0fVkKsmajjFqhnK3r43b2loCq3IK8SARUjLxKGP?=
 =?us-ascii?Q?lgJ+4NjD/hSL+7D7aOLSoT1ThBgRue4FBGbCfPtEVjQ4l4ucG4k/aj2sPaTo?=
 =?us-ascii?Q?/Tc+zsJ4vgPQEuEBhrZ3FH4kv4b2/D2O/r2Ry9w6wvxu0BuHYcS1TtmCB3vh?=
 =?us-ascii?Q?wyTt6yW6ItzSPOoueIJLmdxQTlFbs8JjzJiZ51EEZKIhhMDnWhIyqB4ydBnD?=
 =?us-ascii?Q?OQHVp0kYjHMZWw0BeG8c0BEQqg5d3cO+/h3rR+vriJEf7KuYrCbud8K/3B0u?=
 =?us-ascii?Q?fGr9UcMiax8qxoAQYCoPkfbiaF5WnpW0AyTKVfT8x9Qq9IW6ZNINarI/vA2i?=
 =?us-ascii?Q?lU3PeP8jc4shBTImqCOfWf1mYh5+OAPxoCQQQu2QlDWig1n84njQKZbtE90H?=
 =?us-ascii?Q?YT43Gd6KREi27pVdcXv0IZpyR5Ehph8vw/lZ1ggzK2KS2h3f13SjGWZvd8/n?=
 =?us-ascii?Q?akEGP2HbqKv43vdqg/j9VwY6WH/sJNG9Fbr9OVfv5mFCLN59iyeJL0B8ZkFe?=
 =?us-ascii?Q?+wMfl70JtJ1sFxCv2qnHdSQYKUt6qo4QiH36X01BRrHLoO+dti5JS2jRgRPR?=
 =?us-ascii?Q?BvljYazH49FesX4xNJuuxKZPIQXQL4F1ZBehJPVAHWw9NBrrC6HnR56T4fRX?=
 =?us-ascii?Q?j1revh08LGe5AG9NHsxMHvxYps2T/dL63HSnHQkK+SbZVSEtwA6hZVRE7bbL?=
 =?us-ascii?Q?YY5T/JfS3ZKW95jozB6FzB4Od+1f0xt9KFxy1TcWSXhp6QqF9qw67zJRZPWK?=
 =?us-ascii?Q?9Wg3OaPVCB0hAU86WyF0KEi0TexlQCbD0caJRP/uBHHjx3lV/A4612DZKwe0?=
 =?us-ascii?Q?R6gHoOfejUjhPOsvYydF9hZtdEPto9bbNlPfunxDq5O2+npH+wIQ5UZVG+EF?=
 =?us-ascii?Q?nwf6kgIu5MiFvs9D7GWkqo4aBuVpBTOYCtJYiIEVphATfOyQs30zFfMLjQ/n?=
 =?us-ascii?Q?ZWRm5TnjZV3kUgL9Z9hvCbszc7Ixgr8f+wbSv9Tkwfqs/4MUViIHUd9zZq4b?=
 =?us-ascii?Q?pbyUU+/2qdjzRIpPTdOPCGnKntEqdPXqwBxlOhpEsJoSWbv8eEGWUKy6P1PY?=
 =?us-ascii?Q?U5pnNdnXIhhaqpZ2ubSiZgltBo3/TaTTGsbLV8HY?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b385a8b-28ea-4b0d-aa13-08ddec4402af
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2025 06:18:20.5660
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I8/C1kPag5x+9O4VgRPb4MLsEceVy1YJd4EOjHk7L9RbsSd2yzUwGG05FO/dkq0QwDMCmoTjln0bDSUgcTAwUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8371
X-Authority-Analysis: v=2.4 cv=bMAWIO+Z c=1 sm=1 tr=0 ts=68ba80af cx=c_pps
 a=2B8SwtIiMkeKkMQ5OzRnDQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10 a=FP58Ms26AAAA:8 a=t7CeM3EgAAAA:8
 a=ABMyJ8l_rwh63oH8DmsA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 0HfXesMjhR26Nu7BdoeAdPLioIdluSuk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA1MDA1OCBTYWx0ZWRfX4gQs01Ix/faN
 NFEMPJhCEqg/2k6bRF73rv/r4YSRKa7vAiypT9pubX3RBOybixyl8M1x6qbPYdrV7VxYWKpbvfb
 NhFjeSO3GoFNe5tIc4o2ovcLyGfA1JBUAOgzWNgbAsG+x754YIq2ESO1rXOD6b1ii+E7K7UWFyG
 4CVmiB9X/gcmj6rKM0K+ReM8zGdoqB12oOIc+ZeFSQc7kblcd61iS82mx7ySkQCPLorYZ+cLjiX
 zZK14osBfImlf24/e4gVg46QQ6aKyW7EYLeNWgA972xn2PsxzdF7D0UNGFqV7oZHbXU1hcg65eH
 y/N7fyyLqE/cu5ekPHT22i248DPNO7nfsHCUYQ8LwEWalI/TvAQ59J5BWXQJE4=
X-Proofpoint-ORIG-GUID: 0HfXesMjhR26Nu7BdoeAdPLioIdluSuk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_02,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 impostorscore=0
 adultscore=0 clxscore=1015 phishscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 05 Sep 2025 06:18:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119310

ChangeLog:
  2024-12-19 (bug) [844c0b] Menu entry underline does not consider
             activeborderwidth
  2025-01-03 (bug) [13ac26] wm iconbitmap does not correctly set the
             icon pixmap hint on macOS
  2025-01-27 (bug) [080a28] Aqua: tk_getOpenFile crash
  2025-01-28 (bug) [c99266] console menu zh_cn translations
  2025-03-17 (bug) [159aa5] MS-Win: Incorrect system menu entries for
             transient toplevels
  2025-03-17 (bug) [91d0e9] MS-Win: Withdrawn Tk transient windows can
             reappear in Windows taskbar preview
  2025-04-26 (bug) [111f66] Aqua: cannot iconify all windows
  2025-05-17 (bug) [7231bf99] Setting ttk state may change the variable
             passed by value
  2025-05-29 (feature) [17b509] Win: support PNG images in icon files.
  2025-06-01 (bug) [5d0bc3] block cursor size on a tab is too large
  2025-07-03 (bug) [6b0f77] gcc 14 breaks configure test for bigendian
             leading to broken floating point
  2025-07-14 (bug) [d25b72] error popup on ttk::scale with invisible
             trough
  2025-07-16 (bug) [770fa0]  loading windows dll's in Cygwin doesn't
             work with high-entropy-va
  2025-07-25 (bug) [3d13f8,e90e8c] Aqua: dark mode improvements
  2025-07-25 (bug) [e94c8b] interop with clipboard managers
  2025-08-11 (bug) [dc38c9] Aqua: NSHighResolutionCapable should be a
             Boolean value
  2025-08-11 (bug) [4e1e10] Aqua: CGRect/NSRect type mismatch on 32-bit

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-oe/recipes-devtools/tcltk/{tk8_8.6.15.bb => tk8_8.6.17.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/tcltk/{tk8_8.6.15.bb => tk8_8.6.17.bb} (97%)

diff --git a/meta-oe/recipes-devtools/tcltk/tk8_8.6.15.bb b/meta-oe/recipes-devtools/tcltk/tk8_8.6.17.bb
similarity index 97%
rename from meta-oe/recipes-devtools/tcltk/tk8_8.6.15.bb
rename to meta-oe/recipes-devtools/tcltk/tk8_8.6.17.bb
index 8cb9f6cb5e..d82d36dfdb 100644
--- a/meta-oe/recipes-devtools/tcltk/tk8_8.6.15.bb
+++ b/meta-oe/recipes-devtools/tcltk/tk8_8.6.17.bb
@@ -24,7 +24,7 @@ SRC_URI = "\
     file://fix-xft.diff \
 "
 
-SRC_URI[sha256sum] = "550969f35379f952b3020f3ab7b9dd5bfd11c1ef7c9b7c6a75f5c49aca793fec"
+SRC_URI[sha256sum] = "e4982df6f969c08bf9dd858a6891059b4a3f50dc6c87c10abadbbe2fc4838946"
 
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/tcl/files/Tcl/"
 UPSTREAM_CHECK_REGEX = "Tcl/(?P<pver>\d+(\.\d+)+)/"
-- 
2.34.1


