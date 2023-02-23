Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5828C64ED6
	for <webhook@archiver.kernel.org>; Thu, 23 Feb 2023 12:41:09 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.9449.1677156066241754274
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Feb 2023 04:41:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=ppfsEClc;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=141849fe7d=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31NCWe0R007352
	for <openembedded-devel@lists.openembedded.org>; Thu, 23 Feb 2023 12:41:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=eHtI4d17mUjC6ImyRedLjfuA/I+5RsqGsqEyATsKpT0=;
 b=ppfsEClcn8CxbPoAuigovO7IJqqIN5kOtCHcqIGfejnOK2P6EJy3j7WFFqEfkSR6tArW
 2Mf12YENGxRnfcarhATThqnl95m+b5jEeh/YOD9cnl8VZWXPlqTI/2tYYVam4bTFY5jb
 4o2sIMee8IGC+0H0Ibf9sgHLsd3vidIRRLodpkpN4I7qpGsXeFYxpn++qvck5FIrhYDy
 pPAo5y3D8/oMJ7hda2cJh5ijMUAHH/PEt046x6idwiPuKBkrOmFooaZBeI3Qt+4oDV58
 nnE9n9c0aq4dNjNKpLTdpESm4yDaVzEtWPDO5A5wTig885uvTzDJqdx/LhNNWmlgwMyM UA== 
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2106.outbound.protection.outlook.com [104.47.58.106])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ntpd3vqxb-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 23 Feb 2023 12:41:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MHceIC3+yixrBdaM74k01KJjH0p+1hpwCxTqFx+FtZzkWBccbTWvAqc87yV1YdQmLLSQTRU9X12BgUFMMq01q3uTTJARM2mYjxFPKEv1W5ygZX2RydaQeoUldPVUbmxyMk1yGhVibcTOoYPAzXzGjE077YElKCkR68hAh3+vqoDCQaUJdAzHK2HhzDBeVCwRHzA2LD/wGmy11TbLIYQpC7y5IjMsJj4cib3yY79oXsmVqEKS9ruoRd/jFqfZKdaPwjrSFm1AMhUgGoFiI0cYmJZaP/4wlsJKxD9xsWWHddv2/QHqruPFLLZhGT6aiDYfd1p1VqL2WxSc8oMHrOB6Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eHtI4d17mUjC6ImyRedLjfuA/I+5RsqGsqEyATsKpT0=;
 b=L675zRAnujaA6N5EvGh+yxtOVoSqRtmxEW2+qib+29Hd/t++RDQCuyDm4YaxHaLLPY1ydAA4EGrh0v886RZ/kiScXrfWnFS/KAwsUGLhBoukskvLBTpa9ExL44ORtDJ6Yjwb3lQlmuXuiq9KcxwzC39w+y1/KBuBAmGDp3uhsycHGiMeR6bEuifEv0YFoH2Q8ISFvfSXRYf7vRwusBIh6Lg1L/JOwka+F9Rs7OkV5bzP6N30LT2yE76NBNeQjg7eU7xc9C3UfNvTuHC3vQbhs4qI8ApsVAe1K9diRaRUjFZaaPUZqYzs53fRLWJ/1lVOxHm2Za1P/DF+5gzT0yoL0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by DM4PR11MB7278.namprd11.prod.outlook.com (2603:10b6:8:10a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.20; Thu, 23 Feb
 2023 12:41:04 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::3cb7:edf3:7304:982e]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::3cb7:edf3:7304:982e%2]) with mapi id 15.20.6134.021; Thu, 23 Feb 2023
 12:41:04 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-filesystems][PATCH] fatresize: fix Upstream-Status format
Date: Thu, 23 Feb 2023 20:40:50 +0800
Message-Id: <20230223124050.2282580-4-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230223124050.2282580-1-yi.zhao@windriver.com>
References: <20230223124050.2282580-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR10CA0022.namprd10.prod.outlook.com
 (2603:10b6:a03:255::27) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4867:EE_|DM4PR11MB7278:EE_
X-MS-Office365-Filtering-Correlation-Id: beb37e19-3e23-4ce3-9a45-08db159b39e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	8GEqZxLTnLATCHzel8K0s6js5YXUBXTq1Ry+u8E6qtd225+q6JDTMGdmEHjDabBxheaIM009s8MbkX7ujk5OKFWzhC8I3DLkVRuQxIgOjT9sbrNhItWfMVyQak1D/Zu9RuUj00Y3K9DgiWoZGPDtiqrH8gmIa0WZxYTxIRFQIeaESsZXpU3/sgpWFwexbhwGeW5OJ/w4qtUba8rh82XH+txivcL+jFEm4rYYNG6C7ru6jQ6su7Viv/SSTwyuQD3w1LqXrF6eQf5IGFAiCO0DTl6X+XIcAHf5JvsE+wJrcrzzW0xSYXwQeEy3RHDLRu/xcAAy4G711n9YTwOKGizU53MuV1nbasYOHEBQ4CerMpsAiIHDk4BdaJlQlXHyVNzdHubnosWONG/io+W+JmnGB0fhETO4HfcYZmdFegyfw+kOyAgMCdH5ycP5aYsybbAptgW+EJICylkXhpO4hNXoW18PA7DXNRsDo9dv0/8zlnGBP1rU5Zf6gW71dSm+YmGGu4DCAOZlrlXx/yIicFSFApOmMdoBjUWvCNi8vOZoBcfctdw1PPUEMIlXILvzEUriN0wx0cQiuZHpO6Sr0MJM70G+V4BRlG7qi23QkabNi5ta4Z+souKTyPdH2XKZwSnaphj4mHhFC1Q348Y/cnAsJTIyxFjxaOZNUlQ+ZFnwcbHVRjW0plZrNCApZxMXn3NpFcMzjdX2hZkWZWoslUgrFA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(136003)(366004)(39850400004)(346002)(376002)(451199018)(38350700002)(36756003)(38100700002)(2616005)(66556008)(26005)(6506007)(52116002)(1076003)(316002)(6916009)(6486002)(6512007)(478600001)(2906002)(66946007)(6666004)(66476007)(8676002)(83380400001)(5660300002)(8936002)(4744005)(186003)(86362001)(44832011)(41300700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?vYsLw14GCrVMwKuoZjUd259usnlwLEakSNN9KbYsSUSU7u1z1cINi3KRwu43?=
 =?us-ascii?Q?wFzJeHYQagcS11RetD7Z6IhQoAHfvfqWPx7h7VaBjlEh6q0AcQfGsF5b9b37?=
 =?us-ascii?Q?XKvFmWU7bMfWiwEt/iW13jOYgMW2IVfsM9HMkeJJvZ1w18hdAIH5y5e3CND7?=
 =?us-ascii?Q?vYPuakYLLWH06dN8P1I9BCZJYW+R5wTWm3Wr9spNvMv822ISjRvWN1z2g4A9?=
 =?us-ascii?Q?rOhj6FDFcPOEsaE2W0xR3m60CxihkBiLMYEwoqu2nBQSiVhoQCoC3sGkR/65?=
 =?us-ascii?Q?uP+V71Rw1d0Cv30QBQUW7+ne9qdnoLzPv23yu8RByjbC8pj9lbmwOcr75RJ4?=
 =?us-ascii?Q?wKfMC1sdGp10rQE5DyA9QbArXMgHZCFsOu1Fz+nD0zmGNTrXl//p3L1shMBL?=
 =?us-ascii?Q?8avTzy7v0fjvsSnKFuf12owUVP/ZmMhpG4v3JrAvxFAGjRB9srN5DVgdT5Fb?=
 =?us-ascii?Q?iIDitTuY/PTodr49wm8cfE+h6l5277y9zN17TectiD2n+qwVsCB4b/yX8oTV?=
 =?us-ascii?Q?JWzSP5LJEskjhrkJEPdorxQHd1xHkhoVKyn1nK7HoKubKlcYuSzCpgaQr04p?=
 =?us-ascii?Q?qFTQ8+Dy8Qc5x8GZLL5xR5Mf5xjfaJ8ly6BD0BphQ/2RPQd4zMZ/+l8wkcY1?=
 =?us-ascii?Q?dAzzTQH9ucHXglvVna8E1rjSPbz5DFYNWGlTyRrhTdwoMDwsik18h2yG9cPP?=
 =?us-ascii?Q?hL/HfErcLV2TMBiZwBE0//VRrhZSe7EWlrFok4GIF0n3hc3yfb6vfyg0qnb3?=
 =?us-ascii?Q?mnDB+vRDs7GS/kGxkroYRHotYRYmYGWXkPUTi7ly3ayEgRFf7hd5rdaCCQTF?=
 =?us-ascii?Q?nZnTP2Ah+si6Usbk+pAaBYGItTsQaCyljqgNDsOmWaUrUd8J+/XXMB9HeJc2?=
 =?us-ascii?Q?sSk7YeBXSJLEus7ajut+6UN900qbkC7wq7SRzS10se0Jpun8wkJyWJxnt6qJ?=
 =?us-ascii?Q?XMIGzf0XLTK5rayaXZbOJW4p5sVhSfEX/Xah4qNv5IVwM96jT1wc6Od7zeGN?=
 =?us-ascii?Q?WXvvRC/HqgkBRsO7eylEYAgGklHSkLPmTRMV7sWX7BJvOFcdc7b+QMDEnWBf?=
 =?us-ascii?Q?jjAuCNAz+gGLE/8Zum5VJPg6AyTPwckicAIi/QWDEL4PHzSNRDU08uALdTwT?=
 =?us-ascii?Q?gp6kC5/GEt16IO4NQjRaiOj96ewdnI2/iZ1MmLKw059ySXvsLb9it8VeX0bv?=
 =?us-ascii?Q?PyDp8PgDz5Dk98GzTw5xJCS0Ljmaq+kJ7jggBoB3NkrcNDwIKOnMdjWaZbCZ?=
 =?us-ascii?Q?EHcGSGbhECwRwnI87EGBWM/wQbOIDxEVG+D1/xyZDVTjXflgilOSIkqgadfz?=
 =?us-ascii?Q?2FzXaYPhrGoh7JKkK+DwUglG8XnRIfcnQkmaZLg+6fnzDTT0HFIgR08kUsi1?=
 =?us-ascii?Q?t2o8DXg9/8kfUiImrmVnUynGWBGthYsjAB4g9LiCGUHzRVFmvI6452zIa0fg?=
 =?us-ascii?Q?9/uQh4CBvEsz3RObZmnm9mH2xRXy5RDhgLoI/k0aRr5SXO0wwYs5Shepr1X7?=
 =?us-ascii?Q?tJTcqV5gplau637g6n2IYqxGcK6KtqtXNhVlK0xOVqFt97ksc5WwVesBwo24?=
 =?us-ascii?Q?HvzCV1jYu+Tmk1mGf4+xOGqlOFKXXcmlFpzrfundGutAEurWb+Qnt/LoCK5A?=
 =?us-ascii?Q?eg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: beb37e19-3e23-4ce3-9a45-08db159b39e3
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2023 12:41:04.1981
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q/uR6CdNQUfntJF7ZgSdLfhFfCdEjdriGuKvMyPMwQ+v/k66rHkeYZ++2uLGUZ6ciqPF/rLmYdRRAoEMKbzbkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7278
X-Proofpoint-GUID: _CI86f9r2Rr5JXXGMs7ZUYkoSss8nnWn
X-Proofpoint-ORIG-GUID: _CI86f9r2Rr5JXXGMs7ZUYkoSss8nnWn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-23_06,2023-02-23_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0 malwarescore=0
 mlxlogscore=829 clxscore=1015 lowpriorityscore=0 phishscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302230102
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Feb 2023 12:41:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101227

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../fatresize/0001-build-Do-not-build-.sgml-file.patch          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-filesystems/recipes-utils/fatresize/fatresize/0001-build-Do-not-build-.sgml-file.patch b/meta-filesystems/recipes-utils/fatresize/fatresize/0001-build-Do-not-build-.sgml-file.patch
index c754f21d0..ac16766f6 100644
--- a/meta-filesystems/recipes-utils/fatresize/fatresize/0001-build-Do-not-build-.sgml-file.patch
+++ b/meta-filesystems/recipes-utils/fatresize/fatresize/0001-build-Do-not-build-.sgml-file.patch
@@ -5,7 +5,7 @@ Subject: [PATCH] build: Do not build .sgml file
 
 It needs docbook-to-man tool which we do not have recipe for
 
-Upstream-Status: OE-Specific [needs native docbook-to-man tool]
+Upstream-Status: Inappropriate [needs native docbook-to-man tool]
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
-- 
2.25.1


