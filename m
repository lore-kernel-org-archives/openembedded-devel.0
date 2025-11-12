Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F109CD1297
	for <webhook@archiver.kernel.org>; Wed, 12 Nov 2025 14:54:32 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15255.1762959271864714738
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Nov 2025 06:54:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=BImYSIGc;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3411d85ce0=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ACAvtj31576230
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 06:54:31 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=hmLNQJEUvsPJyTPq+KJKKNeFZEV57mJTOTY56x51ntk=; b=BImYSIGcSstI
	YsFypNf0gsB1GNeOi3mD0TthL6URUGUc8fVrsISRPmpNploADJxfbSb3NuN9JPFc
	ho8ZtScfxgIyGmIFh8b0o9pzPLQx4Ow3AIQwV7mBawV1clY2wuNfUAn4WPmPGNw5
	rLLVU5G67IYnWZZ+1WmnXbdpD85RQ0dOKW4klmAUyk6YjYxSxOTrzYfOFoN9XnNf
	5LRh3ZLCVI2Np25QWnr4LRzVoXyD0Oo4s14eVGLTmdMf9qq60VBUWlpAauTLY4KV
	YdkKqSn8F2x56gqGbBnVFT0dre9qGNajHVSp6pSVC+gl7VJMN3QTdh75OLpH+gbq
	SoQd0jwbMw==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012041.outbound.protection.outlook.com [52.101.53.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aa68jn2cv-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 06:54:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HIR9FgtfgEQCpJK1THrPzbhCHeXegUy7f5y7hpiljjfSh9bM7cGXblfkNpU+k1C8WiA8wXPgqaJ6EjI9hgrvmKMWqc38nZmgl9h4SLaECTV01yZdJraMXX3+5IuXe615UVY0PkqSmI41V4HO5UHaeafdfOykfH+ROlHawIzyIboXr4pznCcuXg5w3kqte0EgBoTJNjn+pbt7Z9D9hgxGQicsWNzHuce7YbIrDUbuZq/2Ry2ZT0im77QqYQZlJsS0GGi7F9gZ4vTiauRIqUSf4EjLTYwe1mOzLfb+kPBQMXPxh6QFpRQtwV0DGyk3e1m+MdMAdkUyS3brLnakro9ZrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hmLNQJEUvsPJyTPq+KJKKNeFZEV57mJTOTY56x51ntk=;
 b=iO0khTatsopSHss15Vxvd8qWcEO6BLDwL2dtFNYGEvIp5EAc6geEkD3R7fDgrVH5d62l05J9UjRcVkn9ZPdlGI0ClBNUGHMU0e7zdLsOPUf3mJsJBqi+Ply7Az6FRYppl9F5gQoig7b3klr/WqODmmwvbrqnTlhF5zdrvqS2kUqScT2R+JR0YjIOsEneRylV7r1qlKdOdjAseXeInhZ+sML3DOqZwOY010/wF506PJoMXt6yIFPSjejVvRM7LEisSvk6MD/OE4W47egSn1G9UkbkL48Q0L/6KsEHXtAZn4r8Kk22l2mwg2ehgQ6gcEh5cUgGfnDc0WrEDFCApqQylQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 SA1PR11MB6822.namprd11.prod.outlook.com (2603:10b6:806:29f::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.16; Wed, 12 Nov 2025 14:54:28 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 14:54:28 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 09/11] python3-pytest-xdist: add UPSTREAM_CHECK_REGEX
Date: Wed, 12 Nov 2025 22:53:55 +0800
Message-Id: <20251112145357.3788595-9-yi.zhao@windriver.com>
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
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|SA1PR11MB6822:EE_
X-MS-Office365-Filtering-Correlation-Id: dc881d88-f123-4e53-a249-08de21fb60f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?1cq57bWCCpxOvyhctzmz6cJ0sQPvW0RJwe5UjFjDbo6eOAOeArx2lBYE0H6M?=
 =?us-ascii?Q?gXsb81Js3zHBfyTq0iaK3v7y0U5mOl2Mn/s9uo0Vy7zz7t3Rb+iJz8/zjtQV?=
 =?us-ascii?Q?DsD7u87YfqKZNKDRQBj4FkFeW/T60Kh0t+54BiUg79sYFybTQi18zJlB893Y?=
 =?us-ascii?Q?XmW9/pRKwCiqkqpS7zwMFlfl2WkH45FOfS57FVCOs9bQSvvL/QsasKwE6DWY?=
 =?us-ascii?Q?dDM7SryDyG8TIKlSdtBNqhwAwf8jnA9q7eHdnl1GtFMq7hJ+8dhG9vGfmqmT?=
 =?us-ascii?Q?a8CGZeRELE+25NX3Hlb1ZJ71BWVEX6BhMPBsjB9MdXxWS6vIrbbvXZqPDJ5z?=
 =?us-ascii?Q?bRH5+uIqkwRMF3CXz4M7kAc+bm38A9k/SwpvE9Qo7ALryxoVd6wCe42hOmOY?=
 =?us-ascii?Q?0R9YCh+8t5C1YiceZBQOX2s0YTaMEOBXDLQWjGMI01Bo7WOBUZme3UpQOcKK?=
 =?us-ascii?Q?St7+HH0hMCiwkgHzc1HstrBMUpnwGOBlOsY7Mh3JPj4t4h/8gusdS4rmRlCW?=
 =?us-ascii?Q?V7oDx2AWv14HWoye3ltD086uyKd+EEEUYQ3Q2yjj5qdcfTbtwubB619D1VfD?=
 =?us-ascii?Q?utE7vbvFEgZ3i25S3q6W/FJ/Y6neJiieoo2oLqBvWzR76cNTcfhAQbPqnQGr?=
 =?us-ascii?Q?dKuFXPWV/5EJF3uWkJrU55KlOeXI8sgM9TPQeD+g4wRjEp5A4OYeBDs1dsEC?=
 =?us-ascii?Q?OCF2zi/hiXf8FffSm46cyVvPeY8XG4/+AphXa2DryClTl7uI+4vR+BQwg+BL?=
 =?us-ascii?Q?SsgezzUdEvdeVCMmPX33+3W2Xz7q1q4MTJT+oODg3kqS5ARxkVbGL8NtVTkK?=
 =?us-ascii?Q?V1blEYxc/mg6VawyXW2NQK5KKQ9dHxlTQVpOq7DldaR5B3XFLS4mMUo+N+JD?=
 =?us-ascii?Q?6OhcW1yunzJpbAExOf63pV+AzD+e3+nHXIZYGRbZlUeycVygclEZO8y8KacN?=
 =?us-ascii?Q?yrArbM49LCO9nhLQeLY5SwPt+pwIJ3Es1lsAyaRldyO0KqwyQmvEQUajcrai?=
 =?us-ascii?Q?9Y6c9y426HWkQRJH2fB1lVmbq/P+nI9E+VqOX0tPM3yCgQPsJ+nhLBfuXNtz?=
 =?us-ascii?Q?2jNnMZ2ZpB6QZqRJpJGhl+kJGhUMn3FW2tGMNfP/ybuWSGACSvEV/IYPW+DZ?=
 =?us-ascii?Q?OGH3PN4Aa7fZP98FEPjvCPM8D2BYOWkwn7NonXQFocBy1OlRViy5SrItW2Wk?=
 =?us-ascii?Q?XJSjIIislfTq82+WSsDdePClOrpICEbz5QlrGrTWhfbazZXyOMdvpuCMcf2/?=
 =?us-ascii?Q?eb59MqQKZA6dQ5HrDGdtBJRy4U4EZ72rgHa4lleuNZ7ZowwWk5NaxRGzOFkH?=
 =?us-ascii?Q?zAZfkKaT4XpWDESqdd5mDE17yFpEh7UQ/JGak4R0DeOpZJItTVHHNmISdj8q?=
 =?us-ascii?Q?AbMGeWkcuH7nJb9q48Du30G8j+9FdfJOgJUorvNpaq/u0UjPyJezu6veO71O?=
 =?us-ascii?Q?/ySSI1kx1HggK6oL2C2DOAXsu1MVYhqN10tdB7SD/MtuK52gUDlQBmO0gr18?=
 =?us-ascii?Q?sGRQvmQnnWMRQFPmJNupDS0v1nvHZOvxjtkV?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?3Ea1L/F8HbrwKanYXH9UZ+oTwBuMEh/ur/E9u4rvB40pZdBr+uc7BKGmcuD0?=
 =?us-ascii?Q?e4CCFnW1P8a72wajW8YwyKLTkf7ux8w6SFSTECDFIyvyxfjPPdmVEtrTXbMm?=
 =?us-ascii?Q?TFndj8MoJvExxGJGOCB69IosuNttrdy+m9IOKHleZm7DXr1IGaD1pVwPde2r?=
 =?us-ascii?Q?FfA/Jf02yaMZM46b0IT1/9zmTnPrEivwP+RE18SFjl2ikITEXqOgdKRs93GV?=
 =?us-ascii?Q?VBmJ3oeECQ7f7aIO/wqH+Otw/lsBoYcF0Z7IteP3CJefALRtbzGXzeHhMMij?=
 =?us-ascii?Q?6RyZIbZ7argBct6srP8gigC8fyN2Vi4iLFcseGH38DSMMxNVm6y/aVJ+PcFn?=
 =?us-ascii?Q?mQMbfYKi+2g/pQWcKmw8b4BxGx9SKf5/RNkByvrvyqiJbMMU4JU237AG2fCn?=
 =?us-ascii?Q?/NCSnBE6gx7S4rCS+0WTRk88Qy1iWGqQ/ICTQh+Ja/YCkCl4hY32ig5K2c5X?=
 =?us-ascii?Q?BEjUpTNXRDmcDwDGjq8BsWJfnAHrLrM41LuNBc+CvKIDLQTiIgHa1So8jGOw?=
 =?us-ascii?Q?w64peKMy0aZfKOVW5wCJJMrmP5is9HMCaCnP4F0Gbjjsqy7u+qPpD3dQ+2Cj?=
 =?us-ascii?Q?0hW3U+PGNezpazi+KrRxvfLwdJIWkyvT95iHhoapKVcDR4KpPBod7Pnx4c4u?=
 =?us-ascii?Q?o+cztPboQtocqdP9pffsHKsr50FckJa9+g9LDXWUEwkJFcdvUt1qzFK/gFU0?=
 =?us-ascii?Q?C6ZDwChb6t2K/bMvtMxaRhShkj44KXIXaVL2IyB03x8YWyVAU3qqwR6TtO/7?=
 =?us-ascii?Q?VsMlxtr9aQ7LC5QNJ3qYUQNeJN2g8E1lRSfmfkjDeYQHJjlyUf8OW452BAUM?=
 =?us-ascii?Q?AIZQzDoF87CQKwhl0dBFp3sW0pmfXwYEUW7H/IvgyqC0tE6fNY07LywZ4ffY?=
 =?us-ascii?Q?z2LsHPsjxaoZilCV2aWvvujIPnjk5AZfWN6osYc8NSawkBQ5PK3zP3JI+cYI?=
 =?us-ascii?Q?ZC8WBwhmav3aWApimkVvzEX63cBNjd9VNHkDwIYC2JL4UeTrAgj0kZ9E36pH?=
 =?us-ascii?Q?8Ce+W1ZFAs7+MGJvedUziq4Bih/oZT/Rfvak8i8jLp4ROCQD0ld6cYReQ8Cd?=
 =?us-ascii?Q?4TitvpTCwNiykonrUZG+GUXVae+euva6j6JuAtvAPhmnsI3moAHVUY9QHsTt?=
 =?us-ascii?Q?xwXert3gLQj+ESkQuwqGOhqLEjmpqGgjTAqeAmudfRfFwAgPO1ahoKHSIVRL?=
 =?us-ascii?Q?ulE5WNG68HToiGkQ2LbanHwcz/6YdunuWal2RQ4RpQkH3jtxPPksQkxdlg5Y?=
 =?us-ascii?Q?+vxzvcHTMV8mTPcU1dIlx4nJQdExZo/vjU9X9WXZwNxncKrGUyJ/oNj3frwq?=
 =?us-ascii?Q?nduuXCWbgA5dLn4zriNU1rbfHhogYNOk/Q8vAQd6gwEtuYWmGrWmYK6SCdTH?=
 =?us-ascii?Q?oAI+4eEEw5tg34b0qu2+0IZQhd2orTybQdIftKbkb2yvmP/P7XyMk2bYUknh?=
 =?us-ascii?Q?RJKgN0bQZFApqlJFz5q7uNN02Y7Y7oKuv8BmW1/XiOjFzlnuu7R/Wp5efPJ7?=
 =?us-ascii?Q?sQ00dRE+NXfqycnSXCEIHEHy0gGGR1EyPRZ8zHEYqMrCziHJacbWtnQAlNWU?=
 =?us-ascii?Q?LqMkpyCaXkbjoapDBRJQbFi3x2NoHIUbhHD9Q8Gv?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc881d88-f123-4e53-a249-08de21fb60f7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 14:54:28.4327
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EXXb32p1W6LuqlssDF5bLb1EJoivgkBQtYM1Ztals0j3Pi3LhlqtXpY4dxLoSYDtnjbW1Yaxo/blokfEEl4jEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6822
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDEyMCBTYWx0ZWRfX2N2uVCveK4nl
 guakgc8V6aZ7LgqCIvoRmVQNpnndzBFsH/W/FlfiO9EVoVzwu7Tm0WpZI8JI1sffitoqvG0RGf6
 pg6G3dmAcmgozmg8nnFNo0gQ/p0TE9HwFDoGSghJzws3FmKxnwxmJaAQq3cRwWmiv6qw/0KJNR0
 DZNIP+P88VoRGK2QDR56/R7O60aI037vL9jm2DVrZ5bOdFna3//7kUBga+Cv5kDGtYfepDnY8z2
 Au7Q1sF3VqQLvl5kx4G/nwBOUKzDyzYlzF7IsJYocdSi+irWsLau+AyD2RR9NmX6M4yFNkmbp/p
 9y2S3n6LaytCZ1YG4bSN1Wcpv1PTAPLh950Cbw+fYXB6Aj70JTmxZxXl6H82UdxnQkPFDYfbuUq
 qJKpmVAePIkV48udaCMl4kbMklclug==
X-Proofpoint-GUID: OUALnxXJOVS47EfJj8o8_sL7QYreIX54
X-Proofpoint-ORIG-GUID: OUALnxXJOVS47EfJj8o8_sL7QYreIX54
X-Authority-Analysis: v=2.4 cv=ef0wvrEH c=1 sm=1 tr=0 ts=69149fa7 cx=c_pps
 a=yZuzC5SkKTYVmguxKPWuow==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=aTI3PDds3uJ7WSN4KvQA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_04,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511120120
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 14:54:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121557

Add UPSTREAM_CHECK_REGEX to check the correct latest stable
verison.

Before the patch:
$ devtool latest-version python3-pytest-xdist
INFO: Current version: 3.8.0
INFO: Latest version: 3.5.0

After the patch:
$ devtool latest-version python3-pytest-xdist
INFO: Current version: 3.8.0
INFO: Latest version: 3.8.0

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../recipes-devtools/python/python3-pytest-xdist_3.8.0.bb       | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-xdist_3.8.0.bb b/meta-python/recipes-devtools/python/python3-pytest-xdist_3.8.0.bb
index 7b340e8920..f172c728ce 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-xdist_3.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-xdist_3.8.0.bb
@@ -5,6 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=fbae836e16c18f4b220f7db6564e8f61"
 
 SRC_URI[sha256sum] = "7e578125ec9bc6050861aa93f2d59f1d8d085595d6551c2c90b6f4fad8d3a9f1"
 
+UPSTREAM_CHECK_REGEX = "pytest_xdist-(?P<pver>\d+(\.\d+)+)"
+
 inherit pypi python_setuptools_build_meta
 
 DEPENDS += "python3-setuptools-scm-native"
-- 
2.34.1


