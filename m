Return-Path: <trevor.gamblin@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0820BC43219
	for <webhook@archiver.kernel.org>; Tue,  1 Feb 2022 16:57:13 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web09.51378.1643734631591029596
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Feb 2022 08:57:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=nmDHko2x;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=90319c0424=trevor.gamblin@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 211FGJXC007773
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 1 Feb 2022 08:57:11 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=f1fBcl8H0ue5KdGYJpHj5vw74wY6vYzN0ZVH1zsoKc8=;
 b=nmDHko2xLGiV0hjETTjCAn0YT6IzkpDqTR5uuFyeR+r6w2S8j0dG+wn5tJWYcH5VJDTy
 NBbqQSo/rMQQ9b4fXqGs6B0RkqecmFXa8Pw7tYd3LA/R0agdcjToGsxP/XnO00fPdJ3P
 poMvaHVb7u6pHgQYnHKTqKdUYjw++p+DP5EDDLr2ZqCneNK+XHkhNP75M1BcbugDwbPa
 mH7EXbREE4NIgNpTcrJe+VtVb9GXWuuTUWJAqokTEa/J4naXcIgX8Gn1SD6zIAaGpOXN
 YAIsMUbUGUh8nuUyhG7fjCkRahnyCbHtZ9nPSLc5uKsOmEIVBf4OZ5++hNczYi+iNVNB yw==
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2177.outbound.protection.outlook.com [104.47.58.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dxk51gs9e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Feb 2022 08:57:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PkJr6USU5jzpjO/SzvmX1fsI0n0ujtO7/34/2ZZ5ikpIRDSEz5FmKl+bmbXlqYiRvmTnG4GO/liC2f/1yvP0J7X8lrw3+R1uaYhzka7Zb3oClFW1hCev0rAasoR/Z48LeCAMkiheKm7/Oxc3f0m8wFtT5Iim+K4hs01oxW/G1YlhvxZpjIxQoacS3N7lN7H4F10A44Eo+7w+fNlPwnZOBQEyhO6clHjqsCrsy2X0M4iMUUbqKLAaEyIQ+Js/PYtbycGfFYZ1t2IYhtHJJDwi30LNsin33xsf1VJ8J0zA121WDGmrjULlzdDuXtOT9GpL6bfYzUQfWorzJV8a9XFpqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f1fBcl8H0ue5KdGYJpHj5vw74wY6vYzN0ZVH1zsoKc8=;
 b=AGRYY/pqWU6s3bnN4OCljvQ3YHNvoKmLfFerHsYE2SPH3M2ks3tGOZNnqxUYz8CniUVIW4tGjmDYjxqKgaPA2wQJZYtoQ9ErOq0iPy8Z5gDcPojK9k/ZIa/iHwLZzCyEW/BJmluvLIiJHBExpEryOJ56CYCK87+jp/PPUQa39ML3tqXy2a83MKzxxwa5hDCPuDeEZqllDYUJectTZE6fwbRafanPGm7s+tfg5/Div3aOj3Ddu9w5ktHjRhw4lICBToLiCSVQ9FEzjQoEtel8OpRljn93Oya9gK195Pg/NF1kZymE+H5uuNqV1RL/n/pS7iwLQy5uB5LGmdMDtcxi6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SN6PR11MB2992.namprd11.prod.outlook.com (2603:10b6:805:d4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.20; Tue, 1 Feb
 2022 16:57:07 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::5185:e1ba:237b:8bb1]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::5185:e1ba:237b:8bb1%3]) with mapi id 15.20.4951.012; Tue, 1 Feb 2022
 16:57:07 +0000
From: Trevor Gamblin <trevor.gamblin@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] phoronix-test-suite: upgrade 9.2.1 -> 10.8.1
Date: Tue,  1 Feb 2022 11:56:51 -0500
Message-Id: <20220201165651.11161-1-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.33.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YT2PR01CA0011.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:38::16) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ea2bc978-62ff-4daf-425e-08d9e5a3e15c
X-MS-TrafficTypeDiagnostic: SN6PR11MB2992:EE_
X-Microsoft-Antispam-PRVS: 
	<SN6PR11MB2992A4B73D58F808F3DF00479F269@SN6PR11MB2992.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	HHx9Q4gUV5aKkLtE8gqxSy6dCBF07a+0mD5EsiPIG3y3qxfSSxHwTcvgUjFuAsbZnhFypKpotHkMFwVvhNdUiTah6jOVM3Zse7Vi9omnY6xnVjjj4pUVLhSCsOm0dGdCG4FHWOq7BgLzQJz5232s6tMl5EbYTQ6BarkK9zf/Topm40wpctRg4XrV9FOBUFOQM1ZGFMvRJUxtHttgesHCKFymUFbLoDFIAGK4hwIXZdR6qu1//rWUO8jcH7kLMUcJiBmjDUYhkdpgABPsOPnqs4l1WvZarylSN+rn1imNrbPXs2LoXLrHGzPZZgOybZCbu2JcxBCR4U082MzGmi7X5pZM8TbTigHkTm24i2vvNrh+BNDMbm3B5vbRGTxqK6OsPUrNejjYMWGqh+gjGnxIolrMypYcCSLYA3uM7tyPfVvC2VrqBUPTVJT0EV84HYv7ARFEFpugkB55KGa66qRdV2ILfwujTbOG3Nwe6jC0ps9m5hPVZLbQZuHjvTWmJiWUG9HX9Hz8a88mfi3wohN7z11hkEAMV+TkzRJXJxwR3QcH4LPKA6iF1jwkT+tsMIjcJAB6APH0ja3l+3hBBbgvilIx/FxeHfHRXcUEwLSc/8GvDkow8Ik8bvpCTR9RPxehipK6jjeHFj4tUIYrpTvZAa+yjHiWXWo2ikVgxabpHXll7NVQxnazT4q/bM/pLJM92Nx/oFt8s807JZDda1zz0X4BBQ0SUmn4fVtS5yGCUnLznciEuBXfPNm61SMbb28WiGsQay4Z5pGbLcrVnAQq2FaF8K94htEyl3d7CbfWNbAdMn2GWaTJkUe3l7GHFyIk
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6512007)(2616005)(1076003)(6506007)(2906002)(5660300002)(86362001)(52116002)(6666004)(8936002)(8676002)(44832011)(66556008)(66476007)(66946007)(26005)(186003)(36756003)(966005)(6486002)(508600001)(316002)(6916009)(83380400001)(38350700002)(38100700002)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?FmWVWehwUtLEVAtRkWEwjaZYsCkF1cYZgkId45UadWHX5JskNOzdcoO22tHK?=
 =?us-ascii?Q?eaSPSLZ/+FTX9iojaiQeR5cj3XLsG8kJq+V5LXRpsx3q+t8srre42yqpHgsp?=
 =?us-ascii?Q?b1TrsBD5lblFtEycUCQej2YxliF19167fscS9gYF1LKRAhkVdiF0eEq10AFr?=
 =?us-ascii?Q?eJBkKzQcV2HOI428gCUf/fskWHzHendMKnfYlkcCE41W4d/YrIQ3DQF8O40J?=
 =?us-ascii?Q?6hmrSKcp1WlNJNJNp8j3mgjxfEP4xk8TxRP3x4buuYEVzxRiq7/Ibs9ARwoU?=
 =?us-ascii?Q?DZbd7PqhdiDFmTtMOVLX7kaMlhKhDv/7UqXxjF2nzqQZeEKhbTkcnkN8YmTK?=
 =?us-ascii?Q?6mhC3ULSCop2iLk/vSxmmO1tiI5fIkyBzjRmzuCFWrYiL7OvU+YNUAp80jOV?=
 =?us-ascii?Q?CAdDaYts1GLaBqinXJ+L+/M13UD6ALiJ6p7aucN1Bc2IWlB5HLcaBBl7iq9l?=
 =?us-ascii?Q?EgIPgYJxzQHN2T1jU6j6sxupnEk9+sNjPz5ziePpLey25UTHUhDGFh2u09nV?=
 =?us-ascii?Q?qk4b0VOPmg6z5m9dM1cftFtwlTSwBaxROFKAVFfEQTvJnoLLIjtHS6VP/rQ3?=
 =?us-ascii?Q?cCmcuupRf1Vh51OPQRJ7N2AeD2sSey4JZNEF/dzeiCjb/rT0+t4WPt01JBpO?=
 =?us-ascii?Q?UGR2XEdq+gNKlsVIKhaiJJF2XOrSzJZ03u4SZP/5gGLRKiA9/EoOMIu2km2C?=
 =?us-ascii?Q?V5G3Y1954dT0xhhoXWqxx4naD8jLgA3okpuyj2bjDW7X2sPi2vyiyjvybW6S?=
 =?us-ascii?Q?ws9x6cJwH+mGsRuODqukPKnM42L7hf85P9hHBb/Cdo7AS/kv7i4yRtkhQKPk?=
 =?us-ascii?Q?mVO5OznXKKIooe0Cn/h+S0THjrC21C/In+6ogaXRcJ4eN/IJJU7wpaxUtBqO?=
 =?us-ascii?Q?CtbD/mb2jzO5psjszONicpxyITrJ9wOzqF23SZx4RnhbErlQzbpNKcR52D7T?=
 =?us-ascii?Q?F24w/IzRH2ql2Z7a/aIe9UNtPlkHYdnJl9T+ZREKVVtjZiMiMKB0hvRERaDD?=
 =?us-ascii?Q?bGpuTxIE+vhvTjX3y2XeGbjqzZVXl6iziYspUAhB1ZJCIAucC8mh0aBiTBPQ?=
 =?us-ascii?Q?JHXq72rxiJX0KBg2U5jNyv1ZYMLuSi+UuYGvRaiFS96FELiNF9eoY5Ic0z+8?=
 =?us-ascii?Q?MjaRxvJZS3SSlZCHACVVLVeuH9hyczmqn2OiXVHM7v30zlTlP9KMY4JR06LP?=
 =?us-ascii?Q?sxBa0SSi0UoOH3PPT8tvaummavOlfnMF6CQGZj+qYKj+KDEQP2FJdl5Z3aHw?=
 =?us-ascii?Q?bMTLWBlYIuU8CQStkTzwgMPTJLdnZX8gA/nAHSpqHmbhiJcQUkd+UdRnjwtT?=
 =?us-ascii?Q?H9TyQCDIXdcJOxoXFCVIOLZwouhFFDhISpoIHM/pf69p3cOk/hIYi4U+z8Uc?=
 =?us-ascii?Q?XujXq2N+q2KgS6hCXuO/d8Rx/Vjx/lkh2krbKB+2gqESzsXqnf4xd3/ZY/Pg?=
 =?us-ascii?Q?RzWfuO7N1lZgTeUCtihQzO4FO3AmBZxeGVHSsIKWHfZu8q/3hU89gUUqacqE?=
 =?us-ascii?Q?/EgERzOPf8y2krVgHMlZJV2JhlCVFfYJDYEjaA7Ednn+hFjas/Ti30gd1WHg?=
 =?us-ascii?Q?Vp8uQdSRW3fVxBsNdBUKzVZ0zM7/ppXbtX/NkkDTPqE2s8PNnuV3ulWQJrj7?=
 =?us-ascii?Q?HVjU/FkTBq97WIWQrDRfp1P5q4T3xTb3B+zc7EX4qYgF46r5yzNT1KI4PmXQ?=
 =?us-ascii?Q?Ff3iSQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ea2bc978-62ff-4daf-425e-08d9e5a3e15c
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2022 16:57:07.4860
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 fHo5dAia1r7O1lT4Rrz0+isi8Fk59ZOuBsarGfqZilC2M8Vind2fZtJhTR/vm5ChIhndzffuf8QDWQKe55LfRDb34rPO/fy6x3rIZZyI1IY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2992
X-Proofpoint-GUID: Ua6dF6A74qh-MBUFYPxHIfgYwrjJZ3QD
X-Proofpoint-ORIG-GUID: Ua6dF6A74qh-MBUFYPxHIfgYwrjJZ3QD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-01_08,2022-02-01_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 mlxlogscore=999 phishscore=0
 malwarescore=0 impostorscore=0 clxscore=1015 suspectscore=0 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202010095
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Feb 2022 16:57:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95201

10.8.1 is the latest release, including fixes for CVE-2022-0196 and
CVE-2022-0197. Since the version jump is significant, the release notes
would be too long to list here. They can be found at
https://github.com/phoronix-test-suite/phoronix-test-suite/releases.

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 ...onix-test-suite_9.2.1.bb => phoronix-test-suite_10.8.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-benchmark/phoronix-test-suite/{phoronix-test-suite_9.2.1.bb => phoronix-test-suite_10.8.1.bb} (91%)

diff --git a/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_9.2.1.bb b/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_10.8.1.bb
similarity index 91%
rename from meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_9.2.1.bb
rename to meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_10.8.1.bb
index c571013a9..a83e09d2b 100644
--- a/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_9.2.1.bb
+++ b/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_10.8.1.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 SECTION = "console/tests"
 
 SRC_URI = "http://www.phoronix-test-suite.com/releases/${BP}.tar.gz"
-SRC_URI[md5sum] = "ad80ed9a5835929138473f764ff0d5db"
-SRC_URI[sha256sum] = "675e7ca96719e2f3b42a6c13421213a398f04da0f8e78f4691fa9261fdeb8501"
+SRC_URI[md5sum] = "9f107c080407b7ac195bb04e6cabb83b"
+SRC_URI[sha256sum] = "3b58ea694419ca608d729fa6ce72ed2b4c51af444729eefbcdc6e670290caa7f"
 
 S = "${WORKDIR}/phoronix-test-suite"
 
-- 
2.33.0


