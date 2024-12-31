Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6A01E7718B
	for <webhook@archiver.kernel.org>; Tue, 31 Dec 2024 08:59:17 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.79689.1735635552171511155
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 31 Dec 2024 00:59:12 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3095ea9653=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BV7gNWU010181
	for <openembedded-devel@lists.openembedded.org>; Tue, 31 Dec 2024 08:59:11 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2172.outbound.protection.outlook.com [104.47.73.172])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43t8a82da7-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 31 Dec 2024 08:59:11 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lnc97IdcCB7ViGeNzfYlk2KOCuBaSGr3yf0l27CpMvs08pQEJR7lFuWYDBvTA9wRHHuumYPjTtz0gHdJRYJNh4uqD4HQSgLkd0nBtzENQCN77TxDARGGPPpJOL9Y3w8nERThITELWhKy3K1bVlosN43AfEXSg7HVboLftYFpQ8TsrPU/i3t529lQg23oss+Jr/xrTXFJzKwbSvddFiRXAcg4R9OSkmUbv8rVr+ZjHAqKMSpjZTqmVxRQDiDo0W97OkrD2MvVVI1YTlVJtuXuXMrw1HOT+Gbn/M0GS5DdNPeX1NT35G9REn18S2tllFc68OTqnUF6U0M+X861aFZAzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wSAzAjRcJh0cJ8Fiu1MpUEwVb/3Uzf5ooJ2mC1RtFk8=;
 b=BQea01hyns6Eiw7tYX0gvDUE3kb3l+uI3Ib0NsTpW/z1rHmQ0mb4sDCZqxn2i+MIvNuSR3vug7D+5fWQzcaLPzgvYGxqTAgkTtouE6Y87iPf5fIS1Z1jSwG6rmDxYnaVPbyhBTx+Y+bmXfMyNsnHEIkYdV82WMuWPzET0Wk1Q2vnWU0a6SH2ZSsDDzVyT7aGnccpoDuUK/QqYVK9ofH2gBZ/MltitTEbL+lDhXjYQsW5VvSgPM6ShIaiwcNXEDHK6b7yPaoqkktuWm4YyW7axeNxhoIFF8rEDV0aQQNf+fu6vudisWlmARb4FBbqTDslLUFDyNtRyiVTYCFc1Yx3IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 BL4PR11MB8846.namprd11.prod.outlook.com (2603:10b6:208:5aa::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.18; Tue, 31 Dec
 2024 08:59:04 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%7]) with mapi id 15.20.8314.011; Tue, 31 Dec 2024
 08:59:04 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] tigervnc: upgrade 1.14.0 -> 1.14.1
Date: Tue, 31 Dec 2024 16:58:46 +0800
Message-Id: <20241231085846.4022015-3-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241231085846.4022015-1-yi.zhao@windriver.com>
References: <20241231085846.4022015-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0019.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::6)
 To DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|BL4PR11MB8846:EE_
X-MS-Office365-Filtering-Correlation-Id: adb889b1-9f02-495a-56ba-08dd29796054
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?XrWeK4qqjTPHqRXRNakgpRHwP993OFQQidzgvCOcPPooGMgU/T9fdGZNgAO/?=
 =?us-ascii?Q?929yscO2IVLVhRKhkLavJY28l/P0kiBsW8QjIR26a3mQpEKCXVAqiOnpB8yf?=
 =?us-ascii?Q?W9frQ/qTQn1HXEzcK6xDaDICVSdYiE+RyqYzrpzfJsUPmrK2qTBA/jplOjIM?=
 =?us-ascii?Q?ftjt7ogR3ZT1XoGULCoRK3m5sUUQ8eflpahnpo97cGWHXIHTATYz3yrpTQIL?=
 =?us-ascii?Q?pRtbqmHO1CYg5GBOaMCoXejirJK5J2NSyYHnf5JqlhdPLArAufjqvaBdk1Q7?=
 =?us-ascii?Q?Cbw50coyAk+sdBWNm7cOvNCLbqaJ/7LKIU92PuOddO1W3Yj+RJLY9AIAIYIV?=
 =?us-ascii?Q?7apEAPp4Q3q5eSn0t2fW3n6VZVUnlYW/bIdfJOyHo7tMFzeomsh4lUXpViat?=
 =?us-ascii?Q?W3J2FDe7IV+hFBz2N+63GKKAYgvohuMqn2nvmZ+rHdni1iyq0rU8vBXVcwL7?=
 =?us-ascii?Q?4pBfeP4rWX7O6If0yRiXop4pJm5nEhUaF5901aI1f943PGzh6pM03Pml7JWq?=
 =?us-ascii?Q?YJ5mN33M6az3bxWhgAI5rl35NPTk5LOqxWJ4Ui5zAasTpZaNoTnPqBrUEzZr?=
 =?us-ascii?Q?LbAwRBBgc2PMkSD5E17MADfw2uhweIZ+w5z3xZ/MKuHQ9TNWV+3hPlt+RyAW?=
 =?us-ascii?Q?9DrsxyrY79L0XgxehwttpG4TjZLvb6ABaTOkr4/pImvQA3Hdd1AWKp5u54zg?=
 =?us-ascii?Q?8uB6vPKbzorDYZFy7ESo6vTR5c7Js8mWqXSJTPg2h2G0u1lxBGKA0xBoZYHJ?=
 =?us-ascii?Q?gPoHRQ7aGe2qirXmQ6helvHpHF9r9C7xy978LUu8VqQ2h3mhy4uBQudhnY+R?=
 =?us-ascii?Q?LLNw8P84wwHsyDrq+Ap2pCBErIFKuXnNlvJtfjpiCsV8zHvqzDk4g5dA+2Rt?=
 =?us-ascii?Q?U6QnIelHKFY7gq5vVsIPerU8z81mfEUDEKD/P4ZOBWRNVvAHJLEVmo+R+si/?=
 =?us-ascii?Q?fNOqKjqszTOL9xU8N1jZ0MWNkhdiceQKOA1p2WuiLLcDkN9lBQpV7PNq/5XK?=
 =?us-ascii?Q?Ji5dyDD2G3ZMuQnrDP4e5f58LPRiE4duURMWD4kMqEOKRoYLkwqzTyDdsnWQ?=
 =?us-ascii?Q?a/x9ISy8Mi+c+wJn4G06YTyum2jkEm4mh2CPq6YbMpNEvX/vgukGRDo8AYo4?=
 =?us-ascii?Q?17kf4DUP1AkuoVOKzVKeVPmcrmrQdVkth6loKJC34+K7m3PG2GryvAxd0F0f?=
 =?us-ascii?Q?0KXCWIC+pt6Uzu3xIhdV+VgkzX780lOX3ruU/9JsYzFxZ74pjU3AJdOxD60Z?=
 =?us-ascii?Q?B1RgphBB+tjQL7qdOk3Yp/wspO+/LzXcBshE6CJMkqmANgJY+Wfv5pLxaz8U?=
 =?us-ascii?Q?Fc9grMHcdYmROqw3VLn2RrLRbZQHj+wFPyKLT5viTmbC+Qe+AMlVRRQNxqZC?=
 =?us-ascii?Q?42XPJ50ZTd8fgkFXHuDSjxDEpgGPH9Sbp34kK1c8uQbfibbrbyGGV0hhn7HQ?=
 =?us-ascii?Q?kLKvXVU7T7+xVnwUis0xGZukq2MWYBdE?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?poI/pAc7r7kYuKMiB1fpfEd6AdVTvK5MXxBEGopKkKZCuTSDCOubzNCgksCw?=
 =?us-ascii?Q?5hhdfDakxt/zu/dhd5TWiaJJgw0KJjc5h1hpJTmBa+Ev77imQlRIZ7shXtfP?=
 =?us-ascii?Q?tUH0qET7LF1zj0jlI/RWtTXfLQWIvhN9BIDvtgt7Nn44TAwBTkf1d/IkPTi5?=
 =?us-ascii?Q?7F+zO3HG7XXGDowaS4qToSQB4561FTjgFxXBVwPoILITv26a7bl5Ffd3Fx6v?=
 =?us-ascii?Q?yG9QbwbO/RmDa9Y561XnxFEYJQ4FU+qDj4lWCarSn2F+u1wsA49D5/ZjMSyA?=
 =?us-ascii?Q?/MHKKSuERxiqlYk8lgaMA0o2+0YG+DsPJOq73/Uh/WesBzSLjI/HGUIgLvkA?=
 =?us-ascii?Q?V4WIbSejnHu/GzzezFiuLwSEbB+n0OV1UjjzsX1iMbcwK3zeYPqlWOLpZSyD?=
 =?us-ascii?Q?Cy49MJ+vQz1/RP2HkbBUatTPZkhuk1ai3AOMprhKsTkbAtQgzSNukkKbHoKB?=
 =?us-ascii?Q?tfOTXQwcW1haDh+oVU9kPpIOaXk8j+IJX8n3FqSnHOtEO9fzBNV44wMRGXob?=
 =?us-ascii?Q?OUl1RAmRy+rxiRdN69vlfb525eytr4cUbmbYC+qTVnHWuS3oj+uT8WwcV5ts?=
 =?us-ascii?Q?t00rXCxyQHAezc0Q5yWYfoXqO1AurGmk5PMUTQeg88ePl/kPjDanwlIVYFnh?=
 =?us-ascii?Q?RtmJAvVJwr0oL7MXOAylOVFKSZNVk6DttKJOkA6stwmPdLPYKbzHYVo52Nd4?=
 =?us-ascii?Q?mxADygtX8Jq6dB9bncQWoRlgWPlwS6ytecnO9jTkT60XciIY+MfdfbLPQMmi?=
 =?us-ascii?Q?TkH32JDGLllmEoR3+kHFmRZYHtVeDNc+KzKfu6ByGdd2FnlxNEUrhhJ5pJWh?=
 =?us-ascii?Q?yve4wxv6ol7s5pMdFxKHGBHpTZ3dRe2QuXyK0YlM6hXENK4HwKbS8YWTskSZ?=
 =?us-ascii?Q?VW49yroiwSgApOPCrdu8eNFbJ9fyteoWclsSpv+CtB96b8iggyN09bzOEAiN?=
 =?us-ascii?Q?6aKukHMczX/QjTH4nXr8FqgjihMrY3yn4fart6MCqDNjdIWcAS0zrVnF+MA7?=
 =?us-ascii?Q?Qofqk/K2ya10i2htuchhec2oB5N+hCTv7VmfblNWTnlxFC590DD+NKetg/IA?=
 =?us-ascii?Q?tcENf4eJOEURcAH4Hg2Jnx2cE5Ql7WGPuSUv1wSvGb5A5TpSfBfv9OL8IzRB?=
 =?us-ascii?Q?cnVFrpQOjYKbQ83eA0oGO5jljYQqZJ+55jqZV8b3u8lSviORrHYiFgcXnAbt?=
 =?us-ascii?Q?SqvwCUiCjLxVkfPEwYBl9Jfzlogyh8lnwvANIXvLjMGmG2NoGr+MVk+2WMRb?=
 =?us-ascii?Q?oRMnmPN/dT4eLT3142lSATlcGLC+EslBTKXbt9noN4rtByUnoigwDKgWx/QL?=
 =?us-ascii?Q?hh0PEKXTyw+3ljGWGlTNY7xsfbokZykGHtKhrUODBi3nuK0Pw1GzeZhxBL4T?=
 =?us-ascii?Q?OSJNk2xG4f1gt7/5xCV2oqzDxsGki+ZMI2HS5f6FVZoBLdZsaKDVGjFrjUM5?=
 =?us-ascii?Q?i/rUykKxB1JILYPtXqjUTFpLodGSyEA4qTjJftDkIRho7rQs6LvuNY+SD4od?=
 =?us-ascii?Q?sxF1xLzU8/s5Hp29EGHH9PsZxxajlKNF0Htr76IMPM0RQc1zuSRapxgOYlMs?=
 =?us-ascii?Q?mSPgNYzF/Q61rESZemP9ckHuA/2uGFS8vNaq4tiM?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: adb889b1-9f02-495a-56ba-08dd29796054
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2024 08:59:04.1887
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dScpIGgyH/z/M029zFBWtgWxp/NPGieUU1mUTS9qWGzZ8c0lNA5eTryHjvYOTQoE0NI9I7HI2w0+NAsE1qZRhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR11MB8846
X-Proofpoint-GUID: j4_eIAgRHs7ppoUJKQeU5ryVxKY-46cK
X-Proofpoint-ORIG-GUID: j4_eIAgRHs7ppoUJKQeU5ryVxKY-46cK
X-Authority-Analysis: v=2.4 cv=f8qyBPyM c=1 sm=1 tr=0 ts=6773b25f cx=c_pps a=LJpgAVzrtcldLI4wrjuEkA==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=RZcAm9yDv7YA:10 a=bRTqI5nwn0kA:10 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=EV9XhuBB3s_60eEHtccA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-31_03,2024-12-24_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 mlxlogscore=999 lowpriorityscore=0
 mlxscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2412310075
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 31 Dec 2024 08:59:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114604

ChangeLog:
https://github.com/TigerVNC/tigervnc/releases/tag/v1.14.1

* Update xorg-server to 21.1.15

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../tigervnc/{tigervnc_1.14.0.bb => tigervnc_1.14.1.bb}     | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-graphics/tigervnc/{tigervnc_1.14.0.bb => tigervnc_1.14.1.bb} (96%)

diff --git a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.14.0.bb b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.14.1.bb
similarity index 96%
rename from meta-oe/recipes-graphics/tigervnc/tigervnc_1.14.0.bb
rename to meta-oe/recipes-graphics/tigervnc/tigervnc_1.14.1.bb
index c5268fd2b3..47f59c69cf 100644
--- a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.14.0.bb
+++ b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.14.1.bb
@@ -15,7 +15,7 @@ REQUIRED_DISTRO_FEATURES = "x11 pam"
 
 B = "${S}"
 
-SRCREV = "4a09a96661624dff14662d6e9849e06a6c70ae03"
+SRCREV = "1b4af5c586eb7a30a38c82fd088c1fa47a83e72f"
 
 SRC_URI = "git://github.com/TigerVNC/tigervnc.git;branch=1.14-branch;protocol=https \
            file://0001-do-not-build-tests-sub-directory.patch \
@@ -25,10 +25,10 @@ SRC_URI = "git://github.com/TigerVNC/tigervnc.git;branch=1.14-branch;protocol=ht
 
 # Keep sync with xorg-server in oe-core
 XORG_PN ?= "xorg-server"
-XORG_PV ?= "21.1.13"
+XORG_PV ?= "21.1.15"
 SRC_URI += "${XORG_MIRROR}/individual/xserver/${XORG_PN}-${XORG_PV}.tar.xz;name=xorg"
 XORG_S = "${UNPACKDIR}/${XORG_PN}-${XORG_PV}"
-SRC_URI[xorg.sha256sum] = "b45a02d5943f72236a360d3cc97e75134aa4f63039ff88c04686b508a3dc740c"
+SRC_URI[xorg.sha256sum] = "841c82901282902725762df03adbbcd68153d4cdfb0d61df0cfd73ad677ae089"
 
 # It is the directory containing the Xorg source for the
 # machine on which you are building TigerVNC.
-- 
2.25.1


