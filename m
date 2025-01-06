Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33B1BE77199
	for <webhook@archiver.kernel.org>; Mon,  6 Jan 2025 08:22:20 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.55405.1736151735275426671
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Jan 2025 00:22:15 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3101692a3d=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 506610W6027302
	for <openembedded-devel@lists.openembedded.org>; Mon, 6 Jan 2025 00:22:15 -0800
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2174.outbound.protection.outlook.com [104.47.58.174])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43y1569c1m-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 06 Jan 2025 00:22:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sar8xLbHlryhWrQLY7XPYrkKrE1gOmZW0jRT+QaxImf7Rrq+SJXHxGEVDRL/DiXX0LwziE4VKIi4aXT+gVgUYaTB/3Qt0ZUG/+0kranl3al9ExLCe1TqBKW+SCIZ2Ok03u2oef05zcHWRWW71XOJmg4jsG+W4X+6Oizx3u6a9tvk1wRuYNQA49CC6FUzBzoZeLxVSBkGSVjyHdyXCF3lV1vF7+mRIINwcQr8QluxvFIvvOEFGmuJPjKnBoLYYlc6GeF80O5zeUPAVtxX24lpsHl98DbzwfJiJxZzwY4rNPyPzgwYUKUhZVzqeDBwbDPUrq39OtPQQpBja1/e0HDQ+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gp31hljFPvGLmMNGA+zlfzmx7VYR58ZXrwP6RajM6Eg=;
 b=M6QJvsUnMnuUcNewKWxKKn/U5bdbE24tbuCB0/uPKYUZfL1Hmv1R4N1GocdJiKpxPq55z/53sBnVvIWnTo58UcxM81T6rhjIIfaWEbUXqE4MoaI7ulmlNGXJNbxZG6gz2KgYZFcaqdp9baBuAvBQlGMRNFScAPPcZh/UfjBmGI5f7meV1nl205eHihXMFDWWz1Pj2zUJNNgpMGp43EM6leO/P3DbsuOi18H8B271bH0x7KkwYXT/V5AoSRBrVYhuSU+yKyDIWRGceFjLFft/+dzSnAGikwQZLhkwKzcAR+FvD+R2/DBMPVcVQUQyfLNWH+MNhyzq9JMxjA6oJ0XEsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 PH8PR11MB8061.namprd11.prod.outlook.com (2603:10b6:510:250::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Mon, 6 Jan
 2025 08:22:09 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%7]) with mapi id 15.20.8314.015; Mon, 6 Jan 2025
 08:22:09 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 3/5] malcontent: set pam module path to ${base_libdir}/security
Date: Mon,  6 Jan 2025 16:21:50 +0800
Message-Id: <20250106082152.882222-3-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250106082152.882222-1-yi.zhao@windriver.com>
References: <20250106082152.882222-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYAPR01CA0028.jpnprd01.prod.outlook.com
 (2603:1096:404:28::16) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|PH8PR11MB8061:EE_
X-MS-Office365-Filtering-Correlation-Id: 0df90d27-4bdc-42b7-9906-08dd2e2b3659
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|1800799024|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?2Gv+joW3ust82HbK4EHV5Bb5+nshiWLrDZFI5qu2CL47zimwz4Z4UISOJSNh?=
 =?us-ascii?Q?0Q6vRmzTQGw+4xTGbT9Z9IZlCiOFTQ3SfyhoFZV0WNKCNQYnaMnLn6WqX6P4?=
 =?us-ascii?Q?5Gpfu9B6Kj6vvaV63pftlcRx5ToH0eYxXwM0dOBArh0uTylPoXHhL2fq4jlb?=
 =?us-ascii?Q?vWMuR57Mw2hdcRL8SrUfQi6DGfZFGDjOLM1LnP6D5mtVW/KCJ9Pd5SD1ImrN?=
 =?us-ascii?Q?OU2+fGQQDZKZ+b75uutZXWdCP8aXzwcByDR/Ang+2G+BNe2n08IoUDe66fZ4?=
 =?us-ascii?Q?2lo9mu9TkQ9vkNeWdv1ogGVjQ4B91SlgjZpT6WMs8PDVzaNKaD7l7KvvOQ/w?=
 =?us-ascii?Q?mtoplGQD8g9UT4MWR6C8hmnmeu/6V9S5toB3HGCsZp8gyGeIcuiSoHlQpp4D?=
 =?us-ascii?Q?uID6gmlSJZHmwoDIOA0GkroO25Tmn8++Bnl8NFBw+nD/7XC58JQyc787k8Iw?=
 =?us-ascii?Q?d/p1ptrmYgZPUEWEESVe5veBGmpnXFnK0M/zOK6DH2T3hsiKpul+41FjZbZH?=
 =?us-ascii?Q?3eey1Bqr80QfMBAKBKlLA+XGl4V3y0jTOIFxi70Wr9EaCQWBo/v++zNKp1D7?=
 =?us-ascii?Q?MUup+FTA+6Fst2VNEWzvTRUHi64/TGTQBKCCd2kjzXXRlJhI//s6VTIyeKfy?=
 =?us-ascii?Q?fmLPAHc6XpbW5e/beGeCHbmVVy9lwLzvr1KPUcEXC3uIx1Am6j7sgoLz8OOB?=
 =?us-ascii?Q?srWc+ikjxLe18QybmpvklgO0Xkqgg2vv46KiwJo+82fr32C7XeJ54eR6rfGf?=
 =?us-ascii?Q?bBKG1Y3ob6hsMbYWLhS5Ty35TU/GGPFtbVsqSWD3PLjya/UwlKZBGpcADBD0?=
 =?us-ascii?Q?7GZBunOaU22wLMKLjukFDw5N61M9QFvnnvud+vNdD4/2g8QRqve3PV/12O2X?=
 =?us-ascii?Q?RF646BtpByb+B0QBrlkRBVL9vGkv4K/Ks/LHWnaRorD/PmrWpPvmOSH15u4L?=
 =?us-ascii?Q?oCoXyq83VuZl/Tnuq9eRnxNR4+h3NQBjqG72wS2HC+8Ja6WFYSS+vuWzFULc?=
 =?us-ascii?Q?nuqjnPc0VNbE/r6PPyMl4xslL/9lu619tuxKDF/X8ce65iW/b8+3xiIUZPXE?=
 =?us-ascii?Q?B37/kGzlcwcVN20le93dngoVLusRi7Ir9pkTo/yN1RC2ojBQzwx4/2ihNSjR?=
 =?us-ascii?Q?lTlCgWxb6t6ox04jRhthDtnHtc4qD++g2bTeF9pK6zTQx6j/ROMXy7oX0ieV?=
 =?us-ascii?Q?povRVrkmo9uKzsqeQatxyL3er4Q6z+WztVo61gPXoRiVTMjNX8oaZMdzWw++?=
 =?us-ascii?Q?O0/BScbJ+SsT+8EmUUdV/4+9ZO7S6Iuxdw7ytyiDaj1HGDk0PF2Yr7clMLdT?=
 =?us-ascii?Q?DCQ4HPHpeEh+aKE0zQ+j6rHKoDeY+B2tPZMnkKgu5INT0RnAbFzJTRoUx69a?=
 =?us-ascii?Q?ASolmBbRltgvsqaIPlean5qkI/UCTRl6b66Yw4/ZE72+zWQ5zgLAVKNb3qu1?=
 =?us-ascii?Q?wNUxO7iVIOygG1M9bY2EcvcGtR7U8h3o?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?z6QyA8oLpMz8W6g1n/x8dwaSLeSjvAOPugb/jgHMmGxwMd1hG2jOh5tgHYON?=
 =?us-ascii?Q?haHrJaR+KV9D2OZf4xutIcd+ydxuAtp7xSckFVPW7JxPSN7EOfXi3SeomGLa?=
 =?us-ascii?Q?Ect7eu8EzVYxpZ0opZg/u927Rt9UXqv0Et2gZ/R0zLl0IQT+4nqTS5jtOTzh?=
 =?us-ascii?Q?7+a31+G7rLMqjZ8Q3Rt+qEaoQYy0CxIQ0gIcvd3E/te58YfQ+YR3ALrBWxVN?=
 =?us-ascii?Q?/L6laklRSBTggsrFSO7qRX2Tviy3dfgK4Yz+1kZ25mGl38l6wr2UNy3NqtzT?=
 =?us-ascii?Q?UMxKjD5c6r/gUOtH20IhL3bwTPnlwwJSrpF3XvUuVrUvqJGa0pK2HYSCrb8k?=
 =?us-ascii?Q?LkYLUAyHLR/+BBxSynZY6OkFuBC6Oin6o4uRZp5ZVo3nS4ovkPB2i1NC1mVu?=
 =?us-ascii?Q?ny9pZ+e9sABLQWJvidCsvOzZ3LyXfTg6OMjyMhQ8Wv81dXJQB/sCLjF5G8TO?=
 =?us-ascii?Q?O1V1q4925ToMMOERK1l+VsypLGkvC/oo3YNj8aiordpBrQ3KD9xnQIwJgwRX?=
 =?us-ascii?Q?BjY68468sRB0QKYFRWkDt9C+bmt0Gl8fET2Qu7ktJWs3kxuaGszsK9VxdjvI?=
 =?us-ascii?Q?tnY45duSW8dsVcrqnFZKJeG0XiDpo8xV2YpjzBRogezZNKciL7nhwIMeF4WP?=
 =?us-ascii?Q?f9Q6UqYKE/Qq1W1h/ZHrOmazEAe0WiYgzpXQsfvwZPdlTrdGpZkLmsd5FNJz?=
 =?us-ascii?Q?ZYZusHVVtMV0nlBk4ylv0/N+CCc0QrIt1OAQQrOKKDa1EulBLhxuhyBVmciQ?=
 =?us-ascii?Q?lmQrBUUTQWXcLaiHxji1CATLYavWJfKyNyZXhsm+7SM9sCaAWQbTc+PpNfgH?=
 =?us-ascii?Q?Nde8t9qYC2T7BpHkPZjEiYsFHbJIK3WYn3qF/KYtipCjhcK/Xkq5lUx0zUUo?=
 =?us-ascii?Q?ezcdcJVw5/EjSrF9w7tKPz/KihE1Art7PmzvZOqKuIAOZaBkz9n3iRq4Znk+?=
 =?us-ascii?Q?x1rCN4ZsW4lTfnqc+9fjaoUVkhIMz+Jw/AXXlh5FJDbIGhLHjeDjpJT+yyWQ?=
 =?us-ascii?Q?wI5GQSpPLZBFpHQZmSrEGFy/h8mqvNd2YlfZaRrGqtLkFN0b6AYD9mWDlcrQ?=
 =?us-ascii?Q?KKS9j9Kdmncfmg6+ctXM7awpzoRdKvXPv8df31c6SbpbO8Tml6eVGnBOs+j1?=
 =?us-ascii?Q?hEGvqKd5dfkZLy0RhdjMQKoudEF3exBCDuUu4KpbTaRaFUmT2fPOoKuFXyYn?=
 =?us-ascii?Q?ti/FSzthjVTy/z23Hz8vKlVGrp6AdXNAop4lKP9fwAj+nCQOtzcufmaaA5fi?=
 =?us-ascii?Q?JzGz6EdhkLq5jxJmEeMDr2DI/1Nz6eDHpg6d1eyuO/b3N9jG9V1/s5AjhA76?=
 =?us-ascii?Q?5dMIg6QkuXT04hOOBVYa4KjQMHk9ISAAJ6V7W5EoU2jk3kb2T0EzLqSLHAbQ?=
 =?us-ascii?Q?SWVPjZ+CG80KxTlk4ILbygsG7pIGKlLtd9SyoAYx5iWMjni8Pxw5Mqa4Ara2?=
 =?us-ascii?Q?XOslyQNwk4GiC72xy7JBhiJGW0iCbC6lLcL4XNwvgdWErR9BpmrWXlXWPNE+?=
 =?us-ascii?Q?vE9xcJmYYegCeHllyH1ENZQ98mkTBcDP3ptNZkOSpQxrhr0bH2EhDJeivLlK?=
 =?us-ascii?Q?pfcBKZwGn/dD/3i8PQTcwZHY+1/y6FFDm9dIMvJY?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0df90d27-4bdc-42b7-9906-08dd2e2b3659
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2025 08:22:08.9395
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mXTBy8g3sqsP3dmNLPWzrCRUAKgFXdKHHi5Wa0vhlng6WI8goif9fXvY1CGrlhRm0aseyqza6GRUQhB7YxMYdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8061
X-Authority-Analysis: v=2.4 cv=PMT1+eqC c=1 sm=1 tr=0 ts=677b92b6 cx=c_pps a=qvBKVd3KFl3zkoLf5jvq7Q==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VdSt8ZQiCzkA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8
 a=YrvPrq4puIgL09KnsKgA:9 a=ZXulRonScM0A:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: ja3oyfxayb3oiXPCEk-dFd7W1Zo6qkmG
X-Proofpoint-ORIG-GUID: ja3oyfxayb3oiXPCEk-dFd7W1Zo6qkmG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-02_03,2025-01-06_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 spamscore=0
 priorityscore=1501 mlxscore=0 mlxlogscore=812 suspectscore=0 clxscore=1015
 phishscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2501060073
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Jan 2025 08:22:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114657

Set pam module path to ${base_libdir}/security as this is the default
path in libpam.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-oe/recipes-gnome/malcontent/malcontent.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-gnome/malcontent/malcontent.bb b/meta-oe/recipes-gnome/malcontent/malcontent.bb
index b30d85080b..9da95329a8 100644
--- a/meta-oe/recipes-gnome/malcontent/malcontent.bb
+++ b/meta-oe/recipes-gnome/malcontent/malcontent.bb
@@ -24,10 +24,10 @@ REQUIRED_DISTRO_FEATURES = "pam polkit gobject-introspection"
 PACKAGECONFIG ?= "ui"
 PACKAGECONFIG[ui] = ",,,malcontent-ui"
 
-EXTRA_OEMESON = "-Dui=disabled"
+EXTRA_OEMESON = "-Dui=disabled -Dpamlibdir=${base_libdir}/security"
 
 FILES:${PN} += " \
-	${libdir}/security/pam_malcontent.so \
+	${base_libdir}/security/pam_malcontent.so \
 	${datadir}/accountsservice \
 	${datadir}/help \
 	${datadir}/dbus-1 \
-- 
2.25.1


