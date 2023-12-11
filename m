Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFCFDC4332F
	for <webhook@archiver.kernel.org>; Tue, 12 Dec 2023 19:43:35 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.1508.1702325380644092758
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Dec 2023 12:09:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=jee+ezCZ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0709e76507=william.lyu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BBBbULG007980
	for <openembedded-devel@lists.openembedded.org>; Mon, 11 Dec 2023 20:09:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=xqd76DAIWnmnCypSM8
	yRNvyH5kGJUqOSz/BS76ENpqg=; b=jee+ezCZtznRky+HoczHhNIqQPHUKawpZT
	oEz0QhImBhkAHO/NA3ulihTn9ZOMyFtQhQUxdhTGSYFXxhA+oh1CScURXNag2y29
	b5Mit78SEEG5EaC891zL5Q8WGjQ2G8DDsnY+xDrezV0RQgprD87WLBaEhpmklAT7
	6YznEVF6Dg3Ro7pnlVD18NP9IfNjTByUcICtiwywkq1wzRAHLB7Flv0vHht/txTS
	rt1fsqhOPxUPR+nkXdyPq9m403WJcLkh7SXZASZEabqrQ3vqgNU/Wz5XlF1QPc/l
	Cgi97nAleGiyIDfnNXHgYl5BH9txP7a3XA4PwaFfbFaaWPMCWbrw==
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2041.outbound.protection.outlook.com [104.47.74.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3uvdext7q6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 11 Dec 2023 20:09:39 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NuGg8RJlreIaZGMjtFEustNIZQxJITuGlAhDzndMK0l7lWz0ga6Y+iOwlsBkqzbNTOwCqM908CLuqdXUgyOvR5Ou5vLj61p9/SLbNYCZdbDaSCHzJCY9fY3kEw+jDf7ZZbT6fGaLaD0CDJ2E7mbrVNAI3IPnXMFB5kIM4Um3Fslrv1PmZ2uCG6+hDVSSGFQwnB2fdLo46CA1VE52uE57YCkaCLAFBF32VjHiNs+SMcKqPEqk7NB0ILIHTzSJWVpARExBO70eoFfgA6vpDCpcEp43EPMtnjDp2CDJUfH7694GQj9Dqk4ThS4fVrHWtVkU3x4ZCf6lLxEZfh2xvaX06w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xqd76DAIWnmnCypSM8yRNvyH5kGJUqOSz/BS76ENpqg=;
 b=n6KkZ6OSeFr/Oy8ciDmVHqXKKoMM9VraV8+NP3iWfXboI+kskeFa8YyePaTpJnOWsSrH4dtAAxn3lxNJHJW/eSR4Ls8N5s/6AAvPPQJhyrt6U2xhdJ6/i6kENechAa1l3UqXvJqW2JJBEiM/SI3O3WzAmC9DLWg1QI8XpFE0xJ2YHBzENFh9Myql/iSEw4j4Hhb1yuhVuBuv6egzsa5xs0ruvfd1Nwdd6Vju5Ehhaue0c5mzLu1Q4nLBlvLyiYbx51uxapGlSq+fWYFgM2rD2URcbwUy03xtD1GyOBf/LOeyW8RM4FWyegAlGP2u0HqnGw7C+EBAXTZLZC6pYPySPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CY5PR11MB6342.namprd11.prod.outlook.com (2603:10b6:930:3d::20)
 by DS0PR11MB7850.namprd11.prod.outlook.com (2603:10b6:8:fe::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32; Mon, 11 Dec
 2023 20:09:37 +0000
Received: from CY5PR11MB6342.namprd11.prod.outlook.com
 ([fe80::dcd6:34af:90b7:15df]) by CY5PR11MB6342.namprd11.prod.outlook.com
 ([fe80::dcd6:34af:90b7:15df%3]) with mapi id 15.20.7068.031; Mon, 11 Dec 2023
 20:09:36 +0000
From: william.lyu@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] networkmanager: Improved SUMMARY and added DESCRIPTION
Date: Mon, 11 Dec 2023 15:09:26 -0500
Message-Id: <20231211200926.1365050-1-William.Lyu@windriver.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: MN2PR19CA0056.namprd19.prod.outlook.com
 (2603:10b6:208:19b::33) To CY5PR11MB6342.namprd11.prod.outlook.com
 (2603:10b6:930:3d::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6342:EE_|DS0PR11MB7850:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b8e34b8-b6e6-4d04-2518-08dbfa85197b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	xHR8kbTTriagtM3O4vDTvDZvOXAVEhjAZdD20rcWZOGOVrv6ifUPbiqoG8jlVlpbqRE/d3UfrgdjEnZ+bYzDhRkr9f9duQia5/BBDETGZ89in7wIqCTj3veO8R6cexyESA1EzqWkkIdfwzJmfOguZ0uqT9Dgz8o4F0niq5wSUFzN6FJFRKrcAgAjyVZ0uwEefasVjAVbrL/C+mAxqhxgJs1V77qEtnrVw9pmY8TFQDcz4Nuh3QFdyiAVYLSl6qalxhhA9IQHSMFOm9Va2knE2mI3RUDLIRULTmXichYiN6lCyvOfgfESFp71oM0A2FU5o2gxoEDPMon7bfG5jZPph1MUNIlNG9KBe4wFw+5RUlEbcLCeKADb5ldJKwaemYMqhzyro3b53ytXMIKMZlqmrC0pydEQPAaoBbU/GeB72WXTtLZuIlNYOGCdPgcV2HNil7BgCgE5Z+4sMsuT+iCbwSkEuNo3AUHpYblHwFqjoYgcVFb4/OHAg8ciNBqxryWVn1t77nt8CLHa3BbAfVeJzTNIi2/VeNb3BGXIMe5vSyQA34KoabtgDH++dXbeFaRalPwABnwhie53/oMgtdKONOCChzFIO7C+m6G9cFVsnFk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6342.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39850400004)(136003)(396003)(366004)(376002)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(9686003)(6512007)(6506007)(1076003)(5660300002)(26005)(2616005)(36756003)(66946007)(6486002)(66476007)(66556008)(6916009)(966005)(2906002)(83380400001)(41300700001)(478600001)(38350700005)(86362001)(52116002)(8936002)(8676002)(316002)(38100700002)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?hHmkx/LNI0KYVLwsx7Wnmf7YWkTCK89xDAywG5zBN09dw65Yc1yw3EwsS2qI?=
 =?us-ascii?Q?+PeZkPQacz6LJLBX1KGCLyIHA3LXggU9tULh+1aEe19tSle91336e7UMDSge?=
 =?us-ascii?Q?MsYPSXtSENnefDSkiHkYu6QRct+6xI90Cc6OFNKtrywgDCVN8ziAQD9dU4Op?=
 =?us-ascii?Q?i2XVRjfu9x9QhyV030Cg+fRe5J8BoXWM8+KH6s1gzKtHIrwLLOQ/KyMByiod?=
 =?us-ascii?Q?bBL5IsCyC4ckQUOJqnNBbznHLz7m+A0JIsvHwBo9hTQ8p1cFtskY0y4UiczY?=
 =?us-ascii?Q?Ga+fdHaui4jBihD+a2MGFaTobDm7mIKAhL/g96QTQfss0LULMfpnIgWqcQ/1?=
 =?us-ascii?Q?Fkz+4Ybm95IVVLMwlU8oiquG3ViW4Uytp3VkCLmAHHkt6hQ+ZPFM3E05sfOq?=
 =?us-ascii?Q?f18Edv18ikcYeUECzm+MzugLz5rjz1d2lO2x90SOKjIEDYLE1epLBvvIzSnG?=
 =?us-ascii?Q?IFSpYLpK6duXjIyjTQymNP15gQ2G3NZCnTvSZuOrj0Dv49YjYI0wZGiZJUKY?=
 =?us-ascii?Q?hmO9yddeKQClr91vbgJ6ZcwaKhuCVwZQm9p/wUIPeb3UeenxW22ce29pNaL/?=
 =?us-ascii?Q?Az/I+BLF5CQ93w9mW9UAnCFWX5OeVtC7zH1ipUi1pSVgn8aA5wf5XYVi5t3y?=
 =?us-ascii?Q?J+YJrExcXM8abts9cnwYqfTAY8euiP2SSiGPUHFPLzeICXLzSg3Dbag+CLSf?=
 =?us-ascii?Q?/BhZs69u/XldgOSNIm/+3C8k6eOSHtmI8zeV4+5fVisKf8dxhC1akAxpCuxo?=
 =?us-ascii?Q?BYm9NHDWaZb1MoIHOYYH7kSQ/xH6HJga0TAtbGR4KctfbAtVSjBFwqCgPthE?=
 =?us-ascii?Q?mj+COYNclqg4ww/N6f5EY6ZyGinKy0aKyfLlFldx5FBQKAVXGBBFb+ltx4q3?=
 =?us-ascii?Q?meApTbg3jWf2ty/R2TYC7j9iBLlPQYcpu5jLM5VV57funCAH7Y7nGj67F85v?=
 =?us-ascii?Q?Erd6WR6L06lmdlGMQVqfGMden4XIf8Zp82vIDAQlSkl+AcL3/zo6aYMhXDeJ?=
 =?us-ascii?Q?vBIMhvOCBu8hvvBdR1y9+FemWA0ZLer2lYjG1IthsSMzlwjcx60fS3IxEGRg?=
 =?us-ascii?Q?nKUMTv3KO1NpHg+JWtArmqL8ab/9+L8mFtnoCieD4k6wsmHB0x3XTPIF7Kp6?=
 =?us-ascii?Q?cpOeQwjYMaH/mr6AgfcHNcYHuVLdmcgWqNIM7OAL9r0pYm0iCtL/HYhCzSYY?=
 =?us-ascii?Q?QRyEvcBWXnQop0qfxrWHpHEZIkCiUd0rOXbXeNqYLecRsepKTkpkPJhlh3C+?=
 =?us-ascii?Q?ree5xfU7w4LTtdb5coXFGjfEiAK14BAiI6JZD+bmdSReET1ogn8xJS3hxgbh?=
 =?us-ascii?Q?T6T/FzeHkfKKekGS2gjxBBkcblOzZKNXmuwCGLe62i3tpvEEk1dUjus3wpfH?=
 =?us-ascii?Q?t9uFAbCqFYiTAKVfo/MFNXQv9ugxqlLdETOf3mujfnFVc8WgZqqM6Ga/v904?=
 =?us-ascii?Q?kUDM+pCxGXYuTl3Mj2iLxkErueDNwnJAMs9YG4AfHp1uNa0JVYKADcL/zE63?=
 =?us-ascii?Q?IyhO40JH9Ti6W+risqYDvkNjXr+aWvAsinC9hibeYdpVfmpl1necodaU0Ka1?=
 =?us-ascii?Q?fEt+N+mZXYcsk4kP20gCUVoXxFLIVdZfVfAn1OFLF1h0rErMFcOOnreeKL32?=
 =?us-ascii?Q?Jw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b8e34b8-b6e6-4d04-2518-08dbfa85197b
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6342.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2023 20:09:36.8866
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ywWqOU5y6N7eDr8XT2ZRyO/0PbZijCLmhi+S/LxhEkXZhLRQxIx9s7ENiupIcY+fbPhRg6Txk3ZkTkFKulR7uopN7OAKoXJ6TQilzf4fvKo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7850
X-Proofpoint-ORIG-GUID: cEVQf5FXRe_5sxeMG03_HFNzaAC8o_SZ
X-Proofpoint-GUID: cEVQf5FXRe_5sxeMG03_HFNzaAC8o_SZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=591 priorityscore=1501 impostorscore=0 bulkscore=0 mlxscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 spamscore=0 phishscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312110166
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 12 Dec 2023 19:43:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107339

From: William Lyu <William.Lyu@windriver.com>

The SUMMARY and DESCRIPTION are taken from Arch Linux wiki page:
https://wiki.archlinux.org/title/NetworkManager

Signed-off-by: William Lyu <William.Lyu@windriver.com>
---
 .../networkmanager/networkmanager_1.44.0.bb                   | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.44.0.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.44.0.bb
index d213ef650..0857d63b1 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.44.0.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.44.0.bb
@@ -1,4 +1,6 @@
-SUMMARY = "NetworkManager"
+SUMMARY = "NetworkManager is a program for providing detection and configuration for systems to automatically connect to networks."
+DESCRIPTION = "NetworkManager is a program for providing detection and configuration for systems to automatically connect to networks. NetworkManager's functionality can be useful for both wireless and wired networks. For wireless networks, NetworkManager prefers known wireless networks and has the ability to switch to the most reliable network. NetworkManager-aware applications can switch from online and offline mode. NetworkManager also prefers wired connections over wireless ones, has support for modem connections and certain types of VPN."
+
 HOMEPAGE = "https://wiki.gnome.org/Projects/NetworkManager"
 SECTION = "net/misc"
 
-- 
2.25.1


