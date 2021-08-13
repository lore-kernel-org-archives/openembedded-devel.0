Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web12.31728.1628821317188817304
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Aug 2021 19:21:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=qBiQBjES;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=38595f8eb2=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 17D1j1qN019591
	for <openembedded-devel@lists.openembedded.org>; Fri, 13 Aug 2021 02:21:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=BjwHOypeukfiH2EE6T4RTSiWDBAjMfS+rc7Gq8hfOwg=;
 b=qBiQBjESKhiBMdDuHlc/Gy9u6Hn+NN+ntA8S/mVK5pMvrrHR9eZtH2jPKeg4dR9f1SmH
 LrsvcucSdr5IlSEYFVzo9gmDvkIK9529k8pDE056KSG8BP0K0SIt1mugYfg7TMHyZHin
 niidlkTwHdOxIXuh+7ZsYoL4BdsbHDM86nIG4CuNQpemY5fxzk6YtiVVBYpVw9Mvi+j4
 bMzjm8B8syBbJCi5YgrmeY8dnLibkm3ZjcVNNGfpeE1Hqn01u4zym0UWDhCiuBlMQW3p
 BP3MoTnoMer4Qivl5MO0gUP019jKiH41CxWIhF6FaksO67rqiLnPiVhSYnx2C6FwuEse Dg== 
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2109.outbound.protection.outlook.com [104.47.55.109])
	by mx0a-0064b401.pphosted.com with ESMTP id 3acra60xuh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 13 Aug 2021 02:21:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BuJP8NZq+r9KRr8NPBgYgHLTO0ZFyGtm9I8cbxezom9AemIrJJdM62DwIPX4AjRzYFAQVaxP02hD7NTzd0ZLpLelAdZIb7pdAyQv/OpMXmcCgEFfpHAnY/t+mDc3SzAAx8HEpyP1rhLlu1kavJvJ2at16dhvnFXUy1zZ7N/nwZzb+dW71vZHiGa2klLtdTOx+vt8BFSlfXlLFglXoo1x60x8eVZOPlPWdHFNcUOouCgkWhs6wQ1lb31Zd98+iOkIKzaCuQewC4hUlseRei3+H4PFMyKRZA8+wwEKGt2kNuQbGWNerX0gwSzA6hIlBgrTLfOaNiQoL8Fyk4Mv6Mp2SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BjwHOypeukfiH2EE6T4RTSiWDBAjMfS+rc7Gq8hfOwg=;
 b=XBa3QQm1uRe5Z41BUHe0UEItKH9VyDxl67ZNv0lb2IGGoDsYBM0NT39XDZpUVch5MLiNE4sCRnkylEpHOPloV9Vmtvo8vF9Y35pQztMjXyZHNMxk/35WnqIo0MgVuD9zofHfEZQCPGsFI5R+OEiW9vN9x0MUuDVvuoM58dCijoZu3BIUnvmT12Cii1XwvRxSZmmch8R3zoiJ0ib6hA+Nant3CRS8kT/Xbc7k9APOzGNYvRetEAa3MByDKDMkKQmxIFMTzO72txUBTWNdZcqQjQMSTENUudn5LfLjnu9d+3jrNqjMaymff5QPoun/qakLEiQUoaVoNHSeBpzxBzS+zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.17; Fri, 13 Aug
 2021 02:21:52 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::fdca:2b03:6e20:2d99]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::fdca:2b03:6e20:2d99%2]) with mapi id 15.20.4394.021; Fri, 13 Aug 2021
 02:21:52 +0000
From: "Yi Zhao" <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] augeas: rename PACKAGECONFIG[libselinux] to PACKAGECONFIG[selinux]
Date: Fri, 13 Aug 2021 10:21:39 +0800
Message-Id: <20210813022139.122456-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: HK2PR02CA0138.apcprd02.prod.outlook.com
 (2603:1096:202:16::22) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-yzhao1-d1.wrs.com (60.247.85.82) by HK2PR02CA0138.apcprd02.prod.outlook.com (2603:1096:202:16::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.14 via Frontend Transport; Fri, 13 Aug 2021 02:21:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 877f77de-8b29-41e3-b73b-08d95e011ce0
X-MS-TrafficTypeDiagnostic: CO1PR11MB4867:
X-Microsoft-Antispam-PRVS: 
	<CO1PR11MB4867A56FBB8707C70EA4B13FF9FA9@CO1PR11MB4867.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1417;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	0WeqZIBSWIuIu5wFLdg2XfTFdEgzMmZxqjT91YG8VfCXGFNQXJI3gkdLTTYH3uTS3Zn0JSxyAXyyzNNX7VpkfBlr9ko4yGQ/eQUFsGnWWqVW2fGhM+B/juhuAWdsTii1hE3/V6EUmwiaVz2A0V/ltl4s/QPCIh6fdfSat4HpfajkBi0s4fCIkdG7QbiBubsBhIAS0GVNDSUBlsVFI782Jt3ydaVQQWvDHFrTaxNm18MP+nH0Ls3ZlK03F3agUJubmZ9BC2g6b1htAUCyKNSOl8nEL3iinTaZhEI8yd+0Q1ApSOjfE9ECtEgEhIxIG/ScuSF1+hn9PzCYITxgMrGm9XXPr1HTyFzfpWXQE6Ie5C6i+cbKeZF+Xi2uMOfNNo67MjipMNR1HJX3l4ISB95ttYdd1m/roj9Uj5f/r2hPq+VW4FA2UlPeje9MhHc5axdCrbDzVFcqdQthIyOOfPIcCPmI3Jr0Z7Z+QT4op0hc5hFYtIx4hSX51cEpZWryLIrerHaxHWVDYKSaf52TxzHJ4DOxFRChVVfYBhhuAxJs0UD81TMeoEUxb2zl2wHTUSwUxZ8ZCHPkuGlER0YRXlwLZmObMR5m36N6aDo6JTX2pSu06INQw0WpRHw1rov/12ghPQt/895oZ9BIjg4BVyjilAG5Lkya82/fpJ0jlEg3acZrWXSQhzxVVU/X50uNyktKqMiQJfDgdfBqXrQmkhfsrw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(396003)(366004)(39850400004)(376002)(6486002)(83380400001)(186003)(38100700002)(6916009)(5660300002)(38350700002)(8936002)(4744005)(36756003)(1076003)(478600001)(86362001)(66946007)(6506007)(52116002)(66476007)(956004)(6666004)(26005)(8676002)(66556008)(6512007)(2616005)(316002)(2906002)(44832011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?s/+jjt7TTocxp1ufQlDE4jVGq76LJrKgrnCNUhyvMfGtK+qbP4/Tu4s/BcKz?=
 =?us-ascii?Q?bkVlMwr0cei6I8kDkfwCemz7DN/6pI+igkg8hdUFE09ikydkJH86wZUfX2vf?=
 =?us-ascii?Q?7KSvlcz6bzJ8NHI9uoO7FwcUDM+GGIp7GKxAvHKIXf0x2QET1NwPwd2heUqZ?=
 =?us-ascii?Q?d6OxDA6LcwKFJQFmdPpGUfLNHBDP+z7jS6VTgVyaQ+kbjupN75XmfGRi6SrB?=
 =?us-ascii?Q?9m5BdN8WzIjU/vRmqdJoMS2RP2gJBXzPHAl74Pgdbht3SBpz2zs5rNZh2g4d?=
 =?us-ascii?Q?dm6ddqHG9YBwu3bnMfS5uAUeAp4p+3gWmuP3eSr7DJVvjSM5UBx7LtZ5E91q?=
 =?us-ascii?Q?6enJyyIsBTEVN67WoPhMyn4bkHrLHEHYKHEDB0oIm0+v+lxu8Ol4vvfOQZQL?=
 =?us-ascii?Q?wI/MZCJOU/9+sWupNVUMDHiBQ0VjfMQJ0EU8y46zjay2DENnKdCv4UBN7iLD?=
 =?us-ascii?Q?1E7Hsktu5tAeQQ4Ets5gjyODS7XLVidiMyuVFEMJxQIzQxf5URbpX9PZFMG1?=
 =?us-ascii?Q?pihEoVlrV0/ZhE8RCyy8jNn+kLkxX5gA6dL4JenkCRo5ZKucqVXw1zC1PwNJ?=
 =?us-ascii?Q?dTjxy7TC9LMeWV5QS/J7mg6til69SS5Fbbib3XcqQ3aMqSMnpQviqzaJRHzv?=
 =?us-ascii?Q?qirqsZLFAI3xBQoG+w6c0mKOEialionc00Yr/RSL2X2qLUOiPriq4fMEXL12?=
 =?us-ascii?Q?eBsnx3TlNqDdQRqbYfwDhp9y8vup3c+DJgh5Yudaip25cWq+ThD84Ih4Y+90?=
 =?us-ascii?Q?5We/D0iuUJ6Dl8VsrnGVX2ysh0Ex/NvtETz3eCaMRlPkrT7jJYf2IHGZWnQM?=
 =?us-ascii?Q?AdZ51UpacCGyv14KIT8vhZmaLlRoqAG+hBJM9qd7rIoFa09Z2OXXpdbyTay/?=
 =?us-ascii?Q?qaBuPKpHcjva69+34fENZwWMPKA9KE/dFjyKEzdJihJmBrgcmrkwIq9OjOBd?=
 =?us-ascii?Q?+M6V+GSGTyz593Y63DNkg6GppDBQDJmgj+Osig+sAY2p3m7wpn5rgp70VO/C?=
 =?us-ascii?Q?JMpmnBX6nFQcFInCwrjYQfEXE2An+gbEFL8H76U1ILBZqQ0mI8KV7DKB3rxX?=
 =?us-ascii?Q?U+fXRwksGB4yFG7Rshulg1fomnO7z7EJsduqh8QZn1WTusoTI5ES60SldFOG?=
 =?us-ascii?Q?Mh4ST0cWofvJUnwf0qvSJqb8IQIBAKrkBoKcvRDwiX8BQDx7oZaK83BANovz?=
 =?us-ascii?Q?9igif32xu65HbvGXDhu+LyJziLp3m5c46MSPL1Je8ux6R+APoiSIhX1AEOHU?=
 =?us-ascii?Q?3wXrUOYneUsdr9lmwBGwebBWjAGthyKXfASt0V56UsK/qbkrT3xdrZsUKcLw?=
 =?us-ascii?Q?P6NXjj9Dnn8R3KZNFMyJ/e5Y?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 877f77de-8b29-41e3-b73b-08d95e011ce0
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2021 02:21:52.5727
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ngmNkg6RR6pQHGYSxglK9X/iOr87jNUht17DIfhSpPQG5id89QtBybFGlcEydf7lZ9AtVerUSGXyPyRo8IEQ6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4867
X-Proofpoint-ORIG-GUID: MaL940MRVg7uN1V-TABBMwUCOQAMQv9d
X-Proofpoint-GUID: MaL940MRVg7uN1V-TABBMwUCOQAMQv9d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-08-12_06,2021-08-12_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 mlxscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 spamscore=0 mlxlogscore=660 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108130012
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Usually we use PACKAGECONFIG[selinux] rather than
PACKAGECONFIG[libselinux] for selinux distro feautre.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-oe/recipes-support/augeas/augeas.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/augeas/augeas.inc b/meta-oe/recipes-support/augeas/augeas.inc
index 077a2db5e..23a057135 100644
--- a/meta-oe/recipes-support/augeas/augeas.inc
+++ b/meta-oe/recipes-support/augeas/augeas.inc
@@ -28,6 +28,6 @@ do_install:append() {
 }
 
 PACKAGECONFIG ??= ""
-PACKAGECONFIG[libselinux] = "--with-selinux,--without-selinux,libselinux"
+PACKAGECONFIG[selinux] = "--with-selinux,--without-selinux,libselinux"
 
 EXTRA_AUTORECONF += "-I ${S}/gnulib/m4"
-- 
2.25.1

