Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B3D7C3ABB2
	for <webhook@archiver.kernel.org>; Fri, 30 May 2025 04:43:00 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.3856.1748580176488576942
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 May 2025 21:42:56 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=82456d971c=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54U3vqFe006910
	for <openembedded-devel@lists.openembedded.org>; Fri, 30 May 2025 04:42:55 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2061.outbound.protection.outlook.com [40.107.244.61])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46u53964vs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 30 May 2025 04:42:55 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gDooRhCr8ylw+y9EEnI7lwisuW4IM3iTDHtcIItgzfM4R/jEyStusYVQSbRnqtHylFADh+IpUbav67j6c5+Cp1DbYy/P52ro2raQw/+564UYj4J31CVukpNfhalOlIO8Ht4eSiOsCKu3EfF+6/qDUc7mZTnortxus9OSyLx6+pKpOwfMwiDiGjQOYXKXbYof8bdB63tSW8Xph3glq0SXjW29ZWBp6tDCXbG35etL7wb7xm6EuVAkt28YgoArx8fpTM9i+VBk/5PIC2PU56CVZRvnweEDStfe5IObUUwwrMNV3wfMu2r50CLokPZaT1sfYEM8rPJdmYohzCMw7sGYRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H+WlEmk+Ff4Ws5HkmF3NE6YzT58cEwLOAoSQ6f/is5g=;
 b=ElUHeIMACjgT+KFLLkZ/Fih7atPSLqhfDh0XAVcGL/PEBzsX6JwUFZtJmZ7tEehCPPsAvf4W00J7GRtLXSl+3srS/4gxvFm0+PXSRrLsGqlHXggTZ0aGVqYkHymEkTIUBMBkX/rOVBDjy5CkP9AIVhidxRbgEqNkrXpW0EhyI3vqokx24gool4Kui7DqCt3tU/IEx98FUOsnPMCuVfb4aTfBjG5PMh85hBFfyy4BkTa7XFM+EyA5uLhm6RDiKU2m55nYjaelE8uzV7016dw9wj5fYO+6KFAUKN6dkufQ97eZLI6Rv0p8A+n5jsbSLneSbqXhliDraD5K2noyCrF51g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by MW3PR11MB4762.namprd11.prod.outlook.com (2603:10b6:303:5d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Fri, 30 May
 2025 04:42:51 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%4]) with mapi id 15.20.8769.031; Fri, 30 May 2025
 04:42:51 +0000
From: Qi.Chen@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH 2/3] Revert "recipes: adapt to qemu.bbclass refactoring"
Date: Fri, 30 May 2025 12:42:23 +0800
Message-Id: <20250530044224.2445187-2-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250530044224.2445187-1-Qi.Chen@windriver.com>
References: <20250530044224.2445187-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4PR01CA0024.jpnprd01.prod.outlook.com
 (2603:1096:405:2bf::18) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|MW3PR11MB4762:EE_
X-MS-Office365-Filtering-Correlation-Id: 0904e7a6-8730-4a8a-409c-08dd9f346f9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?0ViUPm7Sch9OufbypvdNJ0CmGsqlCGPpZdsz3CTaCmsE/cyFJvHhYrhdD0zm?=
 =?us-ascii?Q?Z2AKKxOGdMo2FjFzNXQUc+B0ZarimqOOLLApfLUs90DqtyGQ049YlBTl+Rv2?=
 =?us-ascii?Q?SC/84RSLM0UCtlyH4C0+rHvxQDKpSgUXvxwLsCN/7I6A8TTNzHinID8Njla2?=
 =?us-ascii?Q?mN5FBwG850h1DnGV+Izwtk4l4rQo5bziRts3orhxiFUwdxKfP+4hrRMUFtAd?=
 =?us-ascii?Q?Tur2RAqWyspTvCmEBnroxiLdiy0sVXbd7xCsGgz4MS6XyLkyk+Kn1JAQ/cRS?=
 =?us-ascii?Q?LWbj0PuFrEbG9NVRte69RhUVWh/Hhz6kfciv0fFt9F6Uun/DBjgIVYu+pxDB?=
 =?us-ascii?Q?sMfcIefkdOElw+8DPI/PfFHx4NQJrrwz9aHtbVAP2eTIqexpi5vP3L+o+uMd?=
 =?us-ascii?Q?2NumiTpNixquBQbohnQje6FphhZ3qdrbiAUecE/aGKIH0ck99wbwv/J9Z4Ve?=
 =?us-ascii?Q?amT8s5DhGCgbwNu7bxS/mjS2HwS2hU0Drw4pHCrjeHPPT4TAha6fL5PivYWp?=
 =?us-ascii?Q?mE4MeUc7/bey9atH12RH3khyfpecxDWoYqc/QALKnt4W7iMtExjAySCEuTdm?=
 =?us-ascii?Q?61uFu6ZjfXQuYAXmpGEf3TgTkAEy8Rys8bN5qJV1GaSesEO3nCS4G6Nx+J3y?=
 =?us-ascii?Q?zVnx2BW8TPPSyKAe1paIhqEzFjgKF/DKGrfrl0ZijE4v+PIBK7VeaKuD1M+y?=
 =?us-ascii?Q?9pCn/+amkWr/GX4+h9tP8KLRc2uw06LOlvqusRde68z7jxnYDuT3oPvyTBdC?=
 =?us-ascii?Q?MKsLmDaAeIOPt5UozyF4FFzWWs6kYJe4isk/mBzxW5oXYOovNDGS1kOppGus?=
 =?us-ascii?Q?EUVMlyJdt7fjQx1TzO5Hw1NU+ZaWvXUJ2B50Dqm7ycZ6wLHYhgwOKK9hV46D?=
 =?us-ascii?Q?iLkhFI8wpSDwI/nSE+/oL7QBf8J9oFzCecUmr9CbHI3dfl8TGgZRgTVAQBS8?=
 =?us-ascii?Q?jrFAzejRWrJXucWTZxLdYGjMnf1K+c9QrwYBtkTsXi51jAApH+P7Ls32AIno?=
 =?us-ascii?Q?lyEl7wfZW6d7XoyN5f19bfRUeF3vbyJPLzzjEb30BanA6tNo8yIlBxF9UvlK?=
 =?us-ascii?Q?Htr4ba0oEouLMBI8bsLOs424Df4CuOB3R8/08JhkzhwveUSnRBFijGtW7bk+?=
 =?us-ascii?Q?9kFXLz4EMsc35ezn29ZPMN9eET7uXN8EwrdzUW7FvRVR974eMs3IOrA2Fv6G?=
 =?us-ascii?Q?dwYOWUQKV5Xp3Yq5wPIJnYHbOFzbXS8Vw/yZOHwYWctjbX3Z41YypL5akFFE?=
 =?us-ascii?Q?ofQsVfe+bps3DpdgpTugPe/1T+YkwK0e3ZJBVKs+MQmT2xfWEaTDuZrs6CFn?=
 =?us-ascii?Q?9iGJYQutoN/7g4kY8J4LS692ek1uDo/MigSrvDZ/FwLf8TfX2OSVmMQkqfYj?=
 =?us-ascii?Q?mEEgUDy8JhgtXeq6wBr/IRF9CidMiXQOxwL7k9VCTwUp3HNlGn2TrR8thopL?=
 =?us-ascii?Q?gojYO6DkOF8=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?At4Ae1PayUJ1CKvLAcM9rzu2zLWWn1kM4c0ZTFVlS6Kb1w1XsX0GOwC/liHH?=
 =?us-ascii?Q?NXXXTh9OoFWtdc76Y64RwB+Xpym897OV2otnBAuJ1ZXlI0oQYcTAtrTwtUvn?=
 =?us-ascii?Q?Y82orm3hCV1+hczW6fEnK65yW4daBrAo/zUDS7oX94gK9FfPlqmHAJ8MHjSe?=
 =?us-ascii?Q?MjyxpjRrKzDmn4EBcaC/57kyinBvT1EtMtVJlql+AFd5S6I4wTmDtkddXYcL?=
 =?us-ascii?Q?wntXHwogid1w/apnaYlLjkFXIAANxLMuqXRBNpUtOD4r+L/fz5lv2iVA9oVv?=
 =?us-ascii?Q?e5uLUlVeMX101X9WHdmayyFUuy6Lr7f2Yp2KFoWDJeP7RjMFkNSWsniEGFxY?=
 =?us-ascii?Q?npt3hwmQCza99kGcSsjvGLgtkPQjLQfrmeuvKDQ/0Qdq4x3b5s/4Fd9RGcU2?=
 =?us-ascii?Q?I3u3kAxrMJ1J08fJw6Kq1JR9piZ5IfyqziwqvsSNsztXlJr0qVFyH18wSaET?=
 =?us-ascii?Q?9UmXITZqasoiuW+QTNMWOdqqgb6lLqy2WOPm52q7kotOkNmmkbUy1mdmq3fc?=
 =?us-ascii?Q?fOvJ5hHonI/SAZrmTxnlqrtjhU824cM13B+48jCS0x59T2KsyhGastnn7f/1?=
 =?us-ascii?Q?/cmVQXb4iVE//tKj8rbthCsMwhhUx5VmlH1EsryJujtSfdefGIF2ULSVgFX7?=
 =?us-ascii?Q?mo8KxdpFECBUOPwsqn7M9E4yogxPEUftw8PrcPHCkhcUDvde0a8UBtlDCV9s?=
 =?us-ascii?Q?F8q7EG/N50tZk8HXdrhnBYtBvGWXn4WOZGgJDyj4qMISHcGzLi8p0uSUySL9?=
 =?us-ascii?Q?du0e9BQdZMfCnMZBmlx+zVRUndAGVjdUgHJWWI2ol9oG/h+Kmv3jhutvBrUt?=
 =?us-ascii?Q?YL8ByTMnaO1h4zsFYvpYghyDgxCmSlxC0PDLzCYfhtoWAj42PRwvbMxMKkdH?=
 =?us-ascii?Q?yn9KuhJ/AcwmUR18H1MY9FcUMKMjbk8BKR+0DyRkIZ/vKmBLc3XmbYbiH6ND?=
 =?us-ascii?Q?WtRwMQQv+uc8E7a9SVWNGqIUnY07VU08aUlPvtnquoz1YWXOrESaCsd8WbDa?=
 =?us-ascii?Q?sii924PaCE2Q5kzD3a/PyYFMjx6b+Ry8eCDVAYqKazaDXwFBp8KLcrrnAzFR?=
 =?us-ascii?Q?PTc5YSJfJ/mHivu7Psg827lGj+Mq66838y5GD3ou/wF0od0YQxq0bUS37eTP?=
 =?us-ascii?Q?mKdsTRlNz0HvRXiyZMRZJpd5wFqfZ3stPmk+Chrnz6dCGbJBjvUiTsvYYK2n?=
 =?us-ascii?Q?WQ81mqq70rCa65mGO2ind7HF/rT1Mk+bcIjApUutT7qB4mmXifB0gS6lsLYg?=
 =?us-ascii?Q?K3cSmx9CBlQvwtsrUyP3YxxxdRM6NwI8SKSfGRH8dJiMJQLC1mY88/UIruck?=
 =?us-ascii?Q?U9KbdUYg4yItxY/aAZ08eqJc7QG4H8A5t9nv40dyJWOnmtQiQowhx7tZztIF?=
 =?us-ascii?Q?efCC17vLHnsIf7s9kVPDvAKTggue04+sUqfn2i1Bb9npqrnHg8aJArex/pA8?=
 =?us-ascii?Q?DFQYUCAdFwRCT9ClfMWR/6QNFeyONOdPl4bXydL2MHl5rrBUtqjtRPAhb/nC?=
 =?us-ascii?Q?uw7H1HEAi0j9jfyP4h8wVem1WgOpR0YaxE53aPZ7AjGtwZc0BaxVVlHjDYRg?=
 =?us-ascii?Q?xZRD1ocBY08xK6R7lTbA2nu9QPk40yhnLB93tns9?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0904e7a6-8730-4a8a-409c-08dd9f346f9c
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 04:42:51.8455
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1ASlm/DsUbVooOarLDMhzUy/zsDInus2rRWwjXySHXxVcSVIl1Zsg9RIF5zfKhJ58NWmQR6gfHJHNllnjb4a5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4762
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDAzNyBTYWx0ZWRfX+Cmry/tOeQB8 sOg9waNXbzQgSCoOkTH+qwLzc3KUCmdR+YS1dHDD+rcR6OW8gn04qe9ITskZeXkCpWuHCnddR3S OMcOg202lEEQbyOB/rTVb5V7k8E5thkCjVmBSZzKGppaXPgfWJCGoPvNpPMWqhA04CNKf6xDNUq
 kfPal0iPXXDwQz6VHSfIgdyMdcuVkdxc+OHWvXW/fyUti5libj1wF9oGTBeJqVxq0FJQvPEW/8V 7d2Nl7Nhs3oFDay3yjgWPEpbGL9SCItfC7ROu6fdvlrZXv/4tPHXmSSjwmoTbHELy2QwXyOr234 AJnbmoKH2Xh3l83r52Q8TH8qQ+vYfCmBAr6qRbblR+uBnsYD0vBlCf7JmHV45K1ZzsI41jklG6G
 l3QLCqSfWIxYWmxzZTD+rITaN78xLz4oMON9MRTgTpYayWRo9GTwjFZPAAHmZuZx8SSGCfg/
X-Authority-Analysis: v=2.4 cv=NsDRc9dJ c=1 sm=1 tr=0 ts=6839374f cx=c_pps a=39de9MFdLn04CM8BGbcX0Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10 a=NEAV23lmAAAA:8 a=p0WdMEafAAAA:8 a=OGsvooznAAAA:8 a=t7CeM3EgAAAA:8 a=Vx67Z-VKHrIevtutq1IA:9 a=B5HV4OX4S3AA:10 a=Ro9wbLpunPwA:10 a=_MKx33s3DjsVgJzmPKfz:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: yhHD22O8KLlOQBkitBPuMbWukpe4qSnY
X-Proofpoint-GUID: yhHD22O8KLlOQBkitBPuMbWukpe4qSnY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_01,2025-05-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 impostorscore=0 mlxscore=0 spamscore=0 adultscore=0 malwarescore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505160000
 definitions=main-2505300037
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 30 May 2025 04:43:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117666

From: Chen Qi <Qi.Chen@windriver.com>

This reverts commit 24ff52ba3b73757cc0255a5b19822e2e4d3d4e0a.

The original patch was my bad. The patches for oe-core were re-worked,
but I forgot the recall this patch.

In fact, inheriting qemu is needed because it sets a clear barriar
for people to use qemu user mode. And the QEMU_OPTIONS settings
are also in qemu.bbclass.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta-oe/classes/check-version-mismatch.bbclass       |  4 +++-
 meta-oe/recipes-devtools/mpich/mpich_4.3.0.bb        |  4 ++--
 meta-oe/recipes-devtools/nodejs/nodejs_22.16.0.bb    |  6 +++---
 meta-oe/recipes-extended/icewm/icewm_3.7.4.bb        |  4 ++--
 meta-oe/recipes-graphics/graphviz/graphviz_12.2.1.bb |  6 +++---
 meta-oe/recipes-support/espeak/espeak_1.48.04.bb     |  4 ++--
 meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb        |  4 ++--
 meta-oe/recipes-support/uim/uim_1.9.0.bb             | 12 ++++++------
 meta-oe/recipes-support/unixodbc/unixodbc_2.3.12.bb  |  4 ++--
 9 files changed, 25 insertions(+), 23 deletions(-)

diff --git a/meta-oe/classes/check-version-mismatch.bbclass b/meta-oe/classes/check-version-mismatch.bbclass
index e83cfec756..8e0b613162 100644
--- a/meta-oe/classes/check-version-mismatch.bbclass
+++ b/meta-oe/classes/check-version-mismatch.bbclass
@@ -1,10 +1,12 @@
+inherit qemu
+
 ENABLE_VERSION_MISMATCH_CHECK ?= "${@'1' if bb.utils.contains('MACHINE_FEATURES', 'qemu-usermode', True, False, d) else '0'}"
 DEBUG_VERSION_MISMATCH_CHECK ?= "1"
 CHECK_VERSION_PV ?= ""
 
 DEPENDS:append:class-target = "${@' qemu-native' if bb.utils.to_boolean(d.getVar('ENABLE_VERSION_MISMATCH_CHECK')) else ''}"
 
-QEMU_EXEC ?= "${@oe.qemu.qemu_wrapper_cmdline(d, '${STAGING_DIR_HOST}', ['${STAGING_DIR_HOST}${libdir}','${STAGING_DIR_HOST}${base_libdir}', '${PKGD}${libdir}', '${PKGD}${base_libdir}'])}"
+QEMU_EXEC ?= "${@qemu_wrapper_cmdline(d, '${STAGING_DIR_HOST}', ['${STAGING_DIR_HOST}${libdir}','${STAGING_DIR_HOST}${base_libdir}', '${PKGD}${libdir}', '${PKGD}${base_libdir}'])}"
 
 python do_package_check_version_mismatch() {
     import re
diff --git a/meta-oe/recipes-devtools/mpich/mpich_4.3.0.bb b/meta-oe/recipes-devtools/mpich/mpich_4.3.0.bb
index af15ce61a3..6babba3de7 100644
--- a/meta-oe/recipes-devtools/mpich/mpich_4.3.0.bb
+++ b/meta-oe/recipes-devtools/mpich/mpich_4.3.0.bb
@@ -28,13 +28,13 @@ PACKAGECONFIG[fortran] = "--with-cross=${WORKDIR}/cross_values.txt --enable-fort
 LDFLAGS:append:x86-64 = " -lgcc"
 LDFLAGS:append:x86 = " -lgcc"
 
-inherit autotools gettext pkgconfig
+inherit autotools gettext pkgconfig qemu
 
 DEPENDS += "qemu-native"
 
 do_configure() {
     if [ "${@bb.utils.contains('PACKAGECONFIG', 'fortran', '1', '', d)}" = "1" ]; then
-        qemu_binary="${@oe.qemu.qemu_wrapper_cmdline(d, d.getVar('STAGING_DIR_HOST'), [d.expand('${STAGING_DIR_HOST}${libdir}'),d.expand('${STAGING_DIR_HOST}${base_libdir}')])}"
+        qemu_binary="${@qemu_wrapper_cmdline(d, d.getVar('STAGING_DIR_HOST'), [d.expand('${STAGING_DIR_HOST}${libdir}'),d.expand('${STAGING_DIR_HOST}${base_libdir}')])}"
         cat > ${WORKDIR}/qemuwrapper << EOF
 #!/bin/sh
 $qemu_binary "\$@"
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_22.16.0.bb b/meta-oe/recipes-devtools/nodejs/nodejs_22.16.0.bb
index c2bf3b6bd3..43d9b99fd8 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_22.16.0.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_22.16.0.bb
@@ -9,7 +9,7 @@ DEPENDS = "openssl openssl-native file-replacement-native python3-packaging-nati
 DEPENDS:append:class-target = " qemu-native"
 DEPENDS:append:class-native = " c-ares-native"
 
-inherit pkgconfig python3native ptest siteinfo
+inherit pkgconfig python3native qemu ptest siteinfo
 
 COMPATIBLE_MACHINE:armv4 = "(!.*armv4).*"
 COMPATIBLE_MACHINE:armv5 = "(!.*armv5).*"
@@ -107,8 +107,8 @@ python do_create_v8_qemu_wrapper () {
     on the host."""
     qemu_libdirs = [d.expand('${STAGING_DIR_HOST}${libdir}'),
                     d.expand('${STAGING_DIR_HOST}${base_libdir}')]
-    qemu_cmd = oe.qemu.qemu_wrapper_cmdline(d, d.getVar('STAGING_DIR_HOST'),
-                                            qemu_libdirs)
+    qemu_cmd = qemu_wrapper_cmdline(d, d.getVar('STAGING_DIR_HOST'),
+                                    qemu_libdirs)
 
     if d.getVar("HOST_AND_TARGET_SAME_WIDTH") == "1":
         qemu_cmd = ""
diff --git a/meta-oe/recipes-extended/icewm/icewm_3.7.4.bb b/meta-oe/recipes-extended/icewm/icewm_3.7.4.bb
index 77160b5b51..fa76f2e34e 100644
--- a/meta-oe/recipes-extended/icewm/icewm_3.7.4.bb
+++ b/meta-oe/recipes-extended/icewm/icewm_3.7.4.bb
@@ -10,7 +10,7 @@ SRC_URI[sha256sum] = "e248e299616f417f5051423ea65a15668b71c1fdc9b5e477b47b1e80db
 UPSTREAM_CHECK_URI = "https://github.com/ice-wm/${BPN}/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
 
-inherit autotools pkgconfig gettext perlnative features_check update-alternatives
+inherit autotools pkgconfig gettext perlnative features_check qemu update-alternatives
 REQUIRED_DISTRO_FEATURES = "x11"
 
 EXTRA_OECONF += "--with-libdir=${datadir}/icewm \
@@ -31,7 +31,7 @@ do_compile:prepend:class-target() {
     cd ${B}
     oe_runmake -C src genpref
 
-    qemu_binary="${@oe.qemu.qemu_wrapper_cmdline(d, '${STAGING_DIR_TARGET}',['${B}/src/.libs','${STAGING_DIR_TARGET}/${libdir}','${STAGING_DIR_TARGET}/${base_libdir}'])}"
+    qemu_binary="${@qemu_wrapper_cmdline(d, '${STAGING_DIR_TARGET}',['${B}/src/.libs','${STAGING_DIR_TARGET}/${libdir}','${STAGING_DIR_TARGET}/${base_libdir}'])}"
     cat >qemuwrapper <<EOF
 #!/bin/sh
 ${qemu_binary} src/genpref "\$@"
diff --git a/meta-oe/recipes-graphics/graphviz/graphviz_12.2.1.bb b/meta-oe/recipes-graphics/graphviz/graphviz_12.2.1.bb
index cb04a1b24a..cccbbe75f7 100644
--- a/meta-oe/recipes-graphics/graphviz/graphviz_12.2.1.bb
+++ b/meta-oe/recipes-graphics/graphviz/graphviz_12.2.1.bb
@@ -16,7 +16,7 @@ DEPENDS = " \
 DEPENDS:append:class-target = " ${BPN}-native"
 DEPENDS:append:class-nativesdk = " ${BPN}-native"
 
-inherit autotools-brokensep pkgconfig gettext
+inherit autotools-brokensep pkgconfig gettext qemu
 
 SRC_URI = "https://gitlab.com/api/v4/projects/4207231/packages/generic/${BPN}-releases/${PV}/${BP}.tar.xz \
            "
@@ -84,7 +84,7 @@ SYSROOT_PREPROCESS_FUNCS:append:class-native = " graphviz_sstate_postinst"
 pkg_postinst:${PN} () {
     if [ -n "$D" ]; then
         if ${@bb.utils.contains('MACHINE_FEATURES', 'qemu-usermode', 'true', 'false', d)}; then
-            ${@oe.qemu.qemu_run_binary(d, '$D', '${bindir}/dot')} -c
+            ${@qemu_run_binary(d, '$D', '${bindir}/dot')} -c
         fi
     else
         dot -c
@@ -96,7 +96,7 @@ pkg_postrm:${PN} () {
     rmdir --ignore-fail-on-non-empty $D${libdir}/graphviz
 }
 
-PACKAGE_WRITE_DEPS += "qemuwrapper-cross"
+PACKAGE_WRITE_DEPS += "qemu-native"
 
 PACKAGES =+ "${PN}-python ${PN}-perl ${PN}-demo"
 
diff --git a/meta-oe/recipes-support/espeak/espeak_1.48.04.bb b/meta-oe/recipes-support/espeak/espeak_1.48.04.bb
index 363fffbc05..b4812d59d6 100644
--- a/meta-oe/recipes-support/espeak/espeak_1.48.04.bb
+++ b/meta-oe/recipes-support/espeak/espeak_1.48.04.bb
@@ -13,7 +13,7 @@ SRC_URI[sha256sum] = "bf9a17673adffcc28ff7ea18764f06136547e97bbd9edf2ec612f09b20
 S = "${WORKDIR}/espeak-${PV}-source"
 
 DEPENDS = "portaudio-v19 qemu-helper-native"
-inherit siteinfo
+inherit siteinfo qemu
 
 
 CXXFLAGS += "-DUSE_PORTAUDIO"
@@ -31,7 +31,7 @@ do_compile() {
     oe_runmake
 
     cd "${S}/platforms/big_endian"
-    qemu_binary="${@oe.qemu.qemu_wrapper_cmdline(d, '${STAGING_DIR_TARGET}', ['${S}/platforms/big_endian', '${STAGING_DIR_TARGET}${base_libdir}'])}"
+    qemu_binary="${@qemu_wrapper_cmdline(d, '${STAGING_DIR_TARGET}', ['${S}/platforms/big_endian', '${STAGING_DIR_TARGET}${base_libdir}'])}"
     cat >qemuwrapper <<EOF
 #!/bin/sh
 $qemu_binary "\$@"
diff --git a/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb b/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb
index 4ffc875cec..f34e5f183d 100644
--- a/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb
+++ b/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb
@@ -7,7 +7,7 @@ SECTION = "libs"
 LICENSE = "HDF5"
 LIC_FILES_CHKSUM = "file://COPYING;md5=adebb1ecf1b3b80c13359e18ef67301e"
 
-inherit cmake siteinfo multilib_header multilib_script
+inherit cmake siteinfo qemu multilib_header multilib_script
 
 DEPENDS += "qemu-native zlib"
 
@@ -30,7 +30,7 @@ EXTRA_OECMAKE:prepend:class-target = "-DCMAKE_CROSSCOMPILING_EMULATOR=${WORKDIR}
 gen_emu() {
         # Write out a qemu wrapper that will be used by cmake
         # so that it can run target helper binaries through that.
-        qemu_binary="${@oe.qemu.qemu_wrapper_cmdline(d, d.getVar('STAGING_DIR_HOST'), [d.expand('${STAGING_DIR_HOST}${libdir}'),d.expand('${STAGING_DIR_HOST}${base_libdir}')])}"
+        qemu_binary="${@qemu_wrapper_cmdline(d, d.getVar('STAGING_DIR_HOST'), [d.expand('${STAGING_DIR_HOST}${libdir}'),d.expand('${STAGING_DIR_HOST}${base_libdir}')])}"
         cat > ${WORKDIR}/qemuwrapper << EOF
 #!/bin/sh
 $qemu_binary "\$@"
diff --git a/meta-oe/recipes-support/uim/uim_1.9.0.bb b/meta-oe/recipes-support/uim/uim_1.9.0.bb
index a7857b2487..cb3aee3f0d 100644
--- a/meta-oe/recipes-support/uim/uim_1.9.0.bb
+++ b/meta-oe/recipes-support/uim/uim_1.9.0.bb
@@ -25,7 +25,7 @@ LEAD_SONAME = "libuim.so.1"
 COMPATIBLE_HOST:riscv64 = "null"
 COMPATIBLE_HOST:riscv32 = "null"
 
-inherit features_check autotools pkgconfig gettext gtk-immodules-cache
+inherit features_check autotools pkgconfig gettext qemu gtk-immodules-cache
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
@@ -120,10 +120,10 @@ FILES:uim-skk = "${libdir}/uim/plugin/libuim-skk.* \
     ${datadir}/uim/skk*.scm \
 "
 
-PACKAGE_WRITE_DEPS += "qemuwrapper-cross"
+PACKAGE_WRITE_DEPS += "qemu-native"
 pkg_postinst:uim-anthy() {
     if test -n "$D"; then
-        ${@oe.qemu.qemu_run_binary(d, '$D', '${bindir}/uim-module-manager')} --register anthy --path $D${datadir}/uim
+        ${@qemu_run_binary(d, '$D', '${bindir}/uim-module-manager')} --register anthy --path $D${datadir}/uim
     else
 		uim-module-manager --register anthy --path ${datadir}/uim
     fi
@@ -131,7 +131,7 @@ pkg_postinst:uim-anthy() {
 
 pkg_prerm:uim-anthy() {
     if test -n "$D"; then
-        ${@oe.qemu.qemu_run_binary(d, '$D', '${bindir}/uim-module-manager')} --path $D${datadir}/uim --unregister anthy
+        ${@qemu_run_binary(d, '$D', '${bindir}/uim-module-manager')} --path $D${datadir}/uim --unregister anthy
     else
 		uim-module-manager --path ${datadir}/uim --unregister anthy
     fi
@@ -139,7 +139,7 @@ pkg_prerm:uim-anthy() {
 
 pkg_postinst:uim-skk() {
     if test -n "$D"; then
-        ${@oe.qemu.qemu_run_binary(d, '$D', '${bindir}/uim-module-manager')} --register skk --path $D${datadir}/uim
+        ${@qemu_run_binary(d, '$D', '${bindir}/uim-module-manager')} --register skk --path $D${datadir}/uim
     else
 		uim-module-manager --register skk --path ${datadir}/uim
     fi
@@ -147,7 +147,7 @@ pkg_postinst:uim-skk() {
 
 pkg_postrm:uim-skk() {
     if test -n "$D"; then
-        ${@oe.qemu.qemu_run_binary(d, '$D', '${bindir}/uim-module-manager')} --path $D${datadir}/uim --unregister skk
+        ${@qemu_run_binary(d, '$D', '${bindir}/uim-module-manager')} --path $D${datadir}/uim --unregister skk
     else
 		uim-module-manager --path ${datadir}/uim --unregister skk
     fi
diff --git a/meta-oe/recipes-support/unixodbc/unixodbc_2.3.12.bb b/meta-oe/recipes-support/unixodbc/unixodbc_2.3.12.bb
index ce02535c95..0927f5c904 100644
--- a/meta-oe/recipes-support/unixodbc/unixodbc_2.3.12.bb
+++ b/meta-oe/recipes-support/unixodbc/unixodbc_2.3.12.bb
@@ -18,14 +18,14 @@ SRC_URI[sha256sum] = "f210501445ce21bf607ba51ef8c125e10e22dffdffec377646462df5f0
 UPSTREAM_CHECK_URI = "https://www.unixodbc.org/download.html"
 UPSTREAM_CHECK_REGEX = "unixODBC-(?P<pver>\d+(\.\d+)+)\.tar"
 
-inherit autotools-brokensep multilib_header
+inherit autotools-brokensep multilib_header qemu
 
 S = "${WORKDIR}/unixODBC-${PV}"
 
 EXTRA_OEMAKE += "LIBS=-lltdl"
 EXTRA_OECONF += "--enable-utf8ini"
 DEPENDS:append:class-target = "${@' qemu-native' if bb.utils.contains('MACHINE_FEATURES', 'qemu-usermode', True, False, d) else ''}"
-QEMU_WRAPPER = "${@oe.qemu.qemu_wrapper_cmdline(d, '${STAGING_DIR_HOST}', ['${STAGING_DIR_HOST}/${libdir}','${STAGING_DIR_HOST}/${base_libdir}'])}"
+QEMU_WRAPPER = "${@qemu_wrapper_cmdline(d, '${STAGING_DIR_HOST}', ['${STAGING_DIR_HOST}/${libdir}','${STAGING_DIR_HOST}/${base_libdir}'])}"
 
 do_configure:prepend() {
     # old m4 files will cause libtool version don't match
-- 
2.34.1


