Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6A0ACEDDAB
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 01:41:25 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.33875.1728524482071528037
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Oct 2024 18:41:22 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=00130c5401=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49A0EWoV024568
	for <openembedded-devel@lists.openembedded.org>; Wed, 9 Oct 2024 18:41:21 -0700
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2175.outbound.protection.outlook.com [104.47.55.175])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4234ykvs0n-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 09 Oct 2024 18:41:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xf6CAm0FLVlwK70WPLCpOeaZSo9D9CFLJKiYtGepiya8Q3y8+ntcyaWraUBXf3CX5LaePOv0Mz9IBUa5YHcdu/I+BAvHTiyjHLwMsFL3ZEdtNJtIRXQbeRiHQ/94Sy+O9AB0vNuyhfl73LpXe48Yo6s0IsO/9+/agBrYrmSKae+5krxsVDW+pV3QgH7B7QFz2EQqDbizIwx1o0zxk94Y7vtsh+Y/f7cQeDI7mnAJy7NYSpz8p5dnwxC2VjrYjI5FsoZiRodrC89rNoxz3WG1LO2naLsw9u7ey6cEfjJh1iifQ/yW5FUnD9udPFmcneBlwr4gEgWMzXZqKKhKlV3zCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IwnpjgFtbhhgaBWGqYOWWIc+hov0ydbR9LGxYWS7vfU=;
 b=l49jmLkybwZIQhr7JKk71mWAtjMQKx89IrBt5f1vSkjn0+wdkhoIDx9OLy+jD8GPdHRlyJPnU2eIUGUw14xqAuCBs4H/ZcR8l1d9e2wh+aMRvWKNqAyEyi6LcgkD50jM6SNCtk65APdUk3srXdhE/FnkSUowXYy/BR4QVwyb6M+8qwIYRKsl0nB6MWmveUdVnX01ji0ZonNNC+ARaZCCfTxHqS8CW8YdGNnQ8svGC39KgVRPlh1W0gQBInLUESpd6yhDaJ5Q0GnE7sr2XXbGzmRC2HcKOAWRujPUveuefv+aVHLnigoyeDnVX1hSvUbbwGngHKQvzajlORuuKyHMIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 DS0PR11MB8718.namprd11.prod.outlook.com (2603:10b6:8:1b9::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8048.16; Thu, 10 Oct 2024 01:41:16 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%5]) with mapi id 15.20.8026.020; Thu, 10 Oct 2024
 01:41:16 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/4] haveged: upgrade 1.9.18 -> 1.9.19
Date: Thu, 10 Oct 2024 09:38:13 +0800
Message-Id: <20241010013816.4084737-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0174.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c6::15) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|DS0PR11MB8718:EE_
X-MS-Office365-Filtering-Correlation-Id: c6a55d8d-fe9f-4b42-94d2-08dce8cc409b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?C9uJXbZVhFNjhOIdermGTdT7QdKjLMrxUfU4LRa/SEmaVtpV/0ffjTM3h8MM?=
 =?us-ascii?Q?77MFCpp8WHMVgi1Om+nttM0kTy781fvWGhI3DCKG+QMQI2S4/96AULLShjHb?=
 =?us-ascii?Q?b8mvAWndSaYLycimyYQ/bq/nIfuDjzjil4Jvz2a6k3TdTP59Jp3KbqaN4Xip?=
 =?us-ascii?Q?LMN22lLPWaFJ6ShUfvFzt1C5EFQdUsE+9gEac27DSctzVMH2rGZYuQdaW99s?=
 =?us-ascii?Q?Kap5qtrRdJaFD1/XLqEM6gpzTWTCIzWpXfzqCcqpkAAZjUaojtsE3MtHkjic?=
 =?us-ascii?Q?ehLsNpA/lDA2/Nj497zPvDna1sz49bPVtSD/1Wl0W+R6s8oq8Wbhc7iwlqBT?=
 =?us-ascii?Q?Ei/yaGJ6CI+AAA1w1P/2GRLdsZtPKVlmKqlLa0d8P24pDDlO6v7w4we2bHBP?=
 =?us-ascii?Q?jLmkt96GvMCrWt5bis3GDlyCS4Y9AmkbwAnhEiNOSPZ+VitwyeerfnpkfWI1?=
 =?us-ascii?Q?MVLiXL4oBN2ifFORCJF9tGTLHVbA9fA6MCpVGo81cPeSLLYKhm8iMtkA0CBh?=
 =?us-ascii?Q?NGujWXd3SBNM8NcceyOhzlxertLvjglLF9YAkj1+b6ZevdpLx9zbCGTUPYLS?=
 =?us-ascii?Q?qevsa5Mt04Rt8frTSvFCvg0aw/fBiKc2RnURNOWmz+l70pq8jSzI4lBnotcq?=
 =?us-ascii?Q?t6npMf1Dx7pKjJyWjfoQ5YhWVETrMm21sCJEgrYHvFumsUVlxLk/TwBO5PX4?=
 =?us-ascii?Q?kC4Q9p2/O7sBBBjkCmK+CauDoo9csiMJSgBuyrye738DknrYrjK9i2l/1uE8?=
 =?us-ascii?Q?NyfvXFKy7crv/dX7AIPoR8aFqRG9/4r21YrFSemDN38rwBfRRk+nZhyyFvIE?=
 =?us-ascii?Q?oUotyACYpsohZuHFeG591iDUoI4bIXRJluO54+IResS33ZDy4DVghGX03uwA?=
 =?us-ascii?Q?dFJjvhrMWJxLRTm+6zLw9ok/OuaTrdNPNcoYly71XjTlCgVi6+u3tRZZlZVM?=
 =?us-ascii?Q?DEgw2+POIr9zI23CWJsl8Vw5srf8PxykB7GWOSq/gy65trE7mV+AuHLZMAxX?=
 =?us-ascii?Q?silpr50csvQQNyRzchQ0nDdbYKjBrODPhdDaRtLlv/s98edYZViNq+gWnh4Z?=
 =?us-ascii?Q?gn9Qd0Vbks97UKQD8NfFD12nsJpG07oORCN85DYav+DrBHo7PAV5osJMNsVB?=
 =?us-ascii?Q?lBqUkhvyVN/da89ZdmBveMDeb3HC9S0IB2HrE4ebW7IUaPxBz0cnXW6wXxi2?=
 =?us-ascii?Q?fgPnd5Uaw2jmn9Ht/sYeeqdPqdBZg7nmfGu2mm2mj3XxJbIISN1Ftviylv55?=
 =?us-ascii?Q?juOfGWcV16IaiaAJgrmaXyGBoHeZRKDufK3ON5xEew=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ZXbdpows/jZChyobf3u3PXe063DUGpuaDsVbLJZkf0s5WMgAtl1Nd67fQWbb?=
 =?us-ascii?Q?pz59+QJPCeu/2HL5jrmfILms4lnawr2KHuwlzCVgk24gp/wpyOUW0eBWOY7n?=
 =?us-ascii?Q?ITvZfiMYsYU3x+/dH75xIWUWbhNW0cjr4At5/buMn2RbvoZyv/FopNT7B6X2?=
 =?us-ascii?Q?tYHf6Vez81m2aRPGugf92+fz3OemLHgP7f7c/+P/RMMgFJKxC+TKd+fjrl/M?=
 =?us-ascii?Q?4NAIK9nPLQjjIzaYRCOdoXzHLjujAfE9MNYYs0cxV3eLHVgAisQZs5B0hn6p?=
 =?us-ascii?Q?UpHBk/dLrdu0z9B/tXNg89J8b3CJi+qH7zEuh7uuKCbQbCxwDwO5GftqQ20a?=
 =?us-ascii?Q?8IHZynexYcmLKLXk6NB2FRHGWS01EppFJIfs7GkbyvyDioPQDjSL5wUSUU+g?=
 =?us-ascii?Q?171yJDGshf0rSWN5D8lMT5/P1YQi/bHvGdBH/ln93DHKEGvbTE5Dd7ojMFLO?=
 =?us-ascii?Q?4yIMf/ho29d3zFJwK/rpnNL2KH7r4GfDdCIcnqovVXouEyinWAAQSZQSS1R+?=
 =?us-ascii?Q?INJ919krCn6N4WenLFQbcfsiBmfXl9xaYT7NZEmsKOnCTmF7pLah9qamonjd?=
 =?us-ascii?Q?LMSxdtwvhKiQanI6WRZ6g991Qn4fLR6khthpYFH3dPYIDq589E6J3y0RFl5K?=
 =?us-ascii?Q?VfJKKmlWuF3TvKJXWzuE16+HXVfyId4Pmd0f8uzjsX/JM1nS7zdFytO5Y5ag?=
 =?us-ascii?Q?2HNzTgvSulA0SbvrwFx69XwDsrbcjIMlroicDF00DThEfn3476CbnjBPvBqJ?=
 =?us-ascii?Q?/9lo68R+sovx/CQ5f3ZmmiLaXyfzGdCRA2MvlE4EyD8sl86S1HG7l34zYc06?=
 =?us-ascii?Q?1C9x0T9ANJ3RGP+Ik5qN2JC10abM86o8jje+qsigZtSLiJnV5Z6Sy/LzUOOB?=
 =?us-ascii?Q?CE0mWmoetyQKvTu/lxIQUEKzzMW7OqKBb/oEdt7adsiNSvnBFmQpPCrgHfuQ?=
 =?us-ascii?Q?gBsXLCireDp6LB6ogzvdVFL7Xivss/DwqBNNqRKWyNHHIbLp3d7GoEYR95q8?=
 =?us-ascii?Q?w1xv0DHiBdYgXQM7dRIujE3+oyRRQj/9ARZOBTIPaXB62NM3J3Lodha398Kd?=
 =?us-ascii?Q?G92BbdnFYi37TtQv7dRiyeUXg3ovC7YYKEt9CKO85UfrTBBE2/R62jOPae7M?=
 =?us-ascii?Q?hX9Z9thya1lfwAe14lb/BmWY7rDxtX2vQKYGhQAU1uKa48pRs/hXzTSQsqlk?=
 =?us-ascii?Q?xsfc3cOFnUmsZ+J+2aTAbACM02rOH/rVU4kaULKbw/75IgxHYTzNXtQsQ60R?=
 =?us-ascii?Q?ZisufdCB3RKe9s8ainxmf9jq1Kj83KWOq2jxsSXtCXeybs0Epn6huXZfpgnz?=
 =?us-ascii?Q?IEGNgVqkHo11midXGcB9zjMlLTUXuf2IulyucxIdu4oplMTTabshFueGG9WJ?=
 =?us-ascii?Q?VrfKBQhLJLkIuENHmh3cv56ttXuIhfB/z836fCw5n1dhNYAg9JIrPEAglgWx?=
 =?us-ascii?Q?UQYAbziGwQpIKZXTMFgJH1zdvGJOGIOKSnLCut/JrmhiPNT/XRh6JIrOg8Jt?=
 =?us-ascii?Q?V/X5sX/LM+P3sL/JxRKKCD8iZ48MRKJhXWXgNdDUStSwK9EAA0B8XVe7DBlM?=
 =?us-ascii?Q?+joTwwBFN1NIFhhRsRR6J+DTxLcsyH9XJtmOIHIM?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6a55d8d-fe9f-4b42-94d2-08dce8cc409b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2024 01:41:16.3112
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LqD264ZG81UfpsLZNhUyIwfP3L9xAN4o8pJSYQ5esqb5J0NlFszjtOKaxRaZsI1EfHdizqv7rDfmGkSmF6bhUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8718
X-Authority-Analysis: v=2.4 cv=AKB5nO5v c=1 sm=1 tr=0 ts=670730c1 cx=c_pps a=F+2k2gSOfOtDHduSTNWrfg==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=DAUX931o1VcA:10 a=bRTqI5nwn0kA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=kh0PQnTzAAAA:8
 a=I8hKSwkB8UvX3jgex0oA:9 a=FdTzh2GWekK77mhwV6Dw:22 a=4Y7iCZ2k6v-lWCGmfGXo:22
X-Proofpoint-GUID: Ak_coiWeF_2H1iAomSAtUsK_OiTotoul
X-Proofpoint-ORIG-GUID: Ak_coiWeF_2H1iAomSAtUsK_OiTotoul
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-09_23,2024-10-09_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 clxscore=1015 spamscore=0
 adultscore=0 priorityscore=1501 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.21.0-2409260000
 definitions=main-2410100009
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Oct 2024 01:41:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112751

ChangeLog:
https://github.com/jirka-h/haveged/releases/tag/v1.9.19

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../haveged/{haveged_1.9.18.bb => haveged_1.9.19.bb}           | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-oe/recipes-extended/haveged/{haveged_1.9.18.bb => haveged_1.9.19.bb} (93%)

diff --git a/meta-oe/recipes-extended/haveged/haveged_1.9.18.bb b/meta-oe/recipes-extended/haveged/haveged_1.9.19.bb
similarity index 93%
rename from meta-oe/recipes-extended/haveged/haveged_1.9.18.bb
rename to meta-oe/recipes-extended/haveged/haveged_1.9.19.bb
index 97c354aba..ba897cc71 100644
--- a/meta-oe/recipes-extended/haveged/haveged_1.9.18.bb
+++ b/meta-oe/recipes-extended/haveged/haveged_1.9.19.bb
@@ -6,8 +6,7 @@ HOMEPAGE = "https://www.issihosts.com/haveged/index.html"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM="file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-# v1.9.17
-SRCREV = "80ee9289569bc13efff4e0b5db3661cb513802b2"
+SRCREV = "0ef7dd915ee8be4ca2bb10b5cc2bee92b8ede61d"
 SRC_URI = "git://github.com/jirka-h/haveged.git;branch=master;protocol=https \
 "
 S = "${WORKDIR}/git"
-- 
2.25.1


