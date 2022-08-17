Return-Path: <Saul.Wold@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6C55C32772
	for <webhook@archiver.kernel.org>; Wed, 17 Aug 2022 15:09:35 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.29773.1660748967189038049
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Aug 2022 08:09:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=D6FyKtJ+;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=522867605f=saul.wold@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 27HCsb0N027924
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Aug 2022 08:09:27 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=16QGD2az5sq5w/fRxbtnxIo+iB5f5Mt1+EQwXNqhaa4=;
 b=D6FyKtJ+RrPuWZnqbiZeKhswxZ6go0tQEIWndiBVAKFYhJC+V/1+f2jUiXKcEuLd9Z1Y
 C1RDBvipKFlYbR8dU7nPTf0LOsv8sHlgkbBpZMIY8HRvJK+9aYnNpg8P2lXx5aVqHS9K
 cAc8AeLWefbftnOXOufp25crb6fHiOAFALaPRZIs8Z2cpCMIykdaKb/9u/eyFVzac3g3
 E+pw9QwwgRnDbS4C1c0ZxZQ+b3vheeEdR1dH3O5yvNOyM80U+rTdVZvMvwRKDh2GMrSA
 Ol5O9rYYfGF7US6t3n9lI1LM2qAh/YRAHu7V3r16rhvW+Ym6UyzpAIBu0wDl9zN4/Bh1 2Q==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hxbfjk9gg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Aug 2022 08:09:26 -0700
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27HF9Qac017296
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Aug 2022 08:09:26 -0700
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2173.outbound.protection.outlook.com [104.47.56.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hxbfjk9gb-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Aug 2022 08:09:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d67eigWgJiZ0JaMHz/dM8HojwpHGWaJnNXLy4Aqronje1AdDgQaCmwRj1Wa2OQcEu3QLOq5ZGOc5Xd3b4fAEVID1JUKjgIH7kyK7wVAUkf0TCT6R8QSp+VXPjYCd8Ze0SixFCT646LKFMLCno3RESle33n8yXaIK/e4ceJ2TfaDNMmQ5IXywECATf/t8bPpXx8TbHAKB/y6upHHvhj/iouX+hqmXwdTtLwcv2YxwOgkfKdviVhdklrlkxVRYQNrfze87hSws3OPoeYZXXD+4gS2RYkuDVrOQ7FLXivjPxcG3fOkRB2mwbaOHa4eY/hycim+CI7J24Db0WzPGljn1jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=16QGD2az5sq5w/fRxbtnxIo+iB5f5Mt1+EQwXNqhaa4=;
 b=H4b0ROYfm2FWL78XVysD7CgSWAvNRXCMt1+Lh3C//bNz6RbSRfPRrOiQ85rYohVeR6a3Wfb1nx3o5e1FyHPmzMH4BlvfqDrqDKBZd2w4PiLEGW3A3x29fivUs4FVoIfbKUnjK7q5lHXpkq3cZZyB0GXUaXAbc4uMCc2moV3jbPXonHGMEL68HlbhaeQHDcJkrqJ4dAu/WuwJbXNuhpG4fnVPrUeOW0slPKY22xyawrHDPtIOkHCd/vcnuB7wgK6Ba9RTPUf2nM2objk88CZ12wFHtlfX7k7KWAuGQ5Q9LxYr3Lce9rSZvcGGmoM+Le20Zc1L53xODilzRvHPPOmrJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB5818.namprd11.prod.outlook.com (2603:10b6:510:132::11)
 by MN2PR11MB4493.namprd11.prod.outlook.com (2603:10b6:208:190::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Wed, 17 Aug
 2022 15:09:17 +0000
Received: from PH7PR11MB5818.namprd11.prod.outlook.com
 ([fe80::2db4:2f02:b7de:e4d8]) by PH7PR11MB5818.namprd11.prod.outlook.com
 ([fe80::2db4:2f02:b7de:e4d8%8]) with mapi id 15.20.5504.027; Wed, 17 Aug 2022
 15:09:16 +0000
From: Saul Wold <saul.wold@windriver.com>
To: openembedded-devel@lists.openembedded.org, raj.khem@gmail.com
Subject: [oe][meta-perl][PATCH 03/10] libdigest-sha1-perl: Fix LICENSE string
Date: Wed, 17 Aug 2022 08:08:46 -0700
Message-Id: <20220817150853.2823101-4-saul.wold@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220817150853.2823101-1-saul.wold@windriver.com>
References: <20220817150853.2823101-1-saul.wold@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR04CA0035.namprd04.prod.outlook.com
 (2603:10b6:303:6a::10) To PH7PR11MB5818.namprd11.prod.outlook.com
 (2603:10b6:510:132::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2d0278e2-3e7c-4f6a-7bde-08da80626f58
X-MS-TrafficTypeDiagnostic: MN2PR11MB4493:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	VrCkLskGqPp3+QG1AiVjbzpkIEcJqHxoFyokwGijoWAJKAlcaibpyTdb8x0aaXKN/irsitxlHQideHiL6Qn1uu92qOOOQpTY4+GUx6qywXo0GiSA+y4fslHdYfZOIIfp1mLpzy/h0t7LHxLD5jtljG5HBFz5KHcJ2DHTQ/nOVx115Oc9Dbv42yeRxVT2Qol4l+bSPALZffejLQyb6zG7MZXnUIuzRODGTAB8C+9hgtAQgmxu53tSpgF1IsM47oBcYr7arKf15qv6QNRcPNpM7cJeUPhdoYUrJ7NPSbzhEC85gTAR6210D+KMu0hLpJtdmpnsLW0OxTumgw/zL6IHHseC0DgAALnoGZrOFM7yLagRv4CVUR0TkOBC3fiOE0O89W6rLD/zRzUt9gWXy5p/qhl3vDVwJ4kEES8gQd81UPhMS6v44kDMqwukMWY4MTjwBJZYm60RJ1g19VQVp48FHP2li/p9y7Np+3S5PodBGH/7U5mQ36QpAdqIfx0GMRuYWP35DUKCFvhBZtWK8OsJ9pm5Fh1i6LXwmS0+rtIr5hnxtZbjmRiVA6eLhkJyLpmcMqxuCSr/NyqtwSTOxhGzE0GFD6xACFBgbtVrIYMBLd5vuudBWzeaxTUDjBoCNEEEfK/GBX5fsxerJrO7ScBnME4ZWQZo4uL5TOhXlARQSZxYwDRthJuetNvkO7AEYgLFpEuvx5K2WA3D5znf6w/WiiYbaFWwLKrxYl+4t7hXq/MOItTJT876NOWzWBYOhnZmtdY5NTJMwnGbb/6SP7jkwisovpcpIp2NqzCpvdDOkTSJs3aWWk8XNzEShHKcD30g
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB5818.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(136003)(346002)(366004)(396003)(39850400004)(41300700001)(316002)(478600001)(38350700002)(38100700002)(6486002)(66946007)(8676002)(5660300002)(66476007)(8936002)(66556008)(44832011)(26005)(2906002)(36756003)(186003)(86362001)(6506007)(1076003)(6666004)(2616005)(52116002)(83380400001)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?3rNydWD4TveI5Bj+gFGnCpsugc82gYO9Apg/vsa7dg8c9oqmbTnxVd4ozNAp?=
 =?us-ascii?Q?F4MmMun3rF1JVu2sWcXoX01O1gLDbqpnRGFCWDXKluVuBLwe8v3Bfz3Antue?=
 =?us-ascii?Q?mHAC/ChsH82tZbwHTjW6H6eN+JWqeRtpuoRRgVCaMQXeKOLYe2tOUVA7X5Bh?=
 =?us-ascii?Q?+QYPDD8g6FcCrX3XY+7KQV4g4UT6iM3pLh6QaL4fYBMCiufy/+bp5Sy+IgUr?=
 =?us-ascii?Q?KodCrxIougXPoMZIeBho5kNJ5MEKg3AyCHjMoVRVlOSL5Fre2sMC9R4AalJT?=
 =?us-ascii?Q?lnK92s5P1M7k9N9yQYe3OHopKe4FkOs6LJdGL2BjN205m0K93HCMIqvBdFYp?=
 =?us-ascii?Q?vnLDrmjyMA7TjSgw+7A0YdAaau7TNHxIcpjADp0wKz0eujsfI+j0IAC+wRP5?=
 =?us-ascii?Q?RDkd/Qkl2KrXNmfn16bTQzkDAZ98cJ16lcbs9u9CD1OV6G6Ixf8xGFCPZyQD?=
 =?us-ascii?Q?nddVX6WIEE03oXB9OCw4sjM+9vQ3/XH8Vuwxm1OEGCf6UwHNvlGljy8699j0?=
 =?us-ascii?Q?zNQ7OccUJQYflK8rH1VcBtkx5JGK0yWrZQBBuW7HwyTZggNTSUpPbQqFI/QM?=
 =?us-ascii?Q?ajU0t//3+c+pVBfS6eBqv4ErvFuVNml9GUS+uxjpPRh6ddFcNhlyWSryI6jC?=
 =?us-ascii?Q?5m5oJ7AywTGVh5J6rUz5t6kk+lQecd6ERZunDHVTDO6lqGeE2bUGE3Xa1OuX?=
 =?us-ascii?Q?DDkJBidekCfnGV4lgGdjCPSqau6Vu3vLhP+/r0ldnUfB3KTzYtwTSIt0qJa5?=
 =?us-ascii?Q?fqxZ9/RpX/H3Fs6l8ACfB4GLP5FbzzllPl8l4wQR0aX/ddYtkSfGv+1TwVUE?=
 =?us-ascii?Q?rMDb+EKvcRirpVgpBxtoojTt9zfXYWNSikYgJcMTY8/q5MSGdbT+U9Pd0pB/?=
 =?us-ascii?Q?go2ji0wYIY5XkaoL+g4NgbXGX0T4Au5AY6mE9hg/fbBA6Pdrr2uCND8nzAcY?=
 =?us-ascii?Q?Hf6uJnUUCCvU3G0Rk1/1MBBfaeDZpnF6jEpOAA4DC4Ni/xBNrbz2vNR1CC8a?=
 =?us-ascii?Q?7ebo6Q1/wCSS929vGxsxBfy6VzvHKk4TF/aWx0JuNSTEekTJgeE55Yb23/u/?=
 =?us-ascii?Q?5NFH+irDc5Z8TCXpk8b9b57IeZav4SdDOm7BTuEUxksp0X8CxraZZYwmkxPl?=
 =?us-ascii?Q?N9XStqgTIEQe5FyKpoZHgE1i11hWmDR1d9Cz3jK81JAFt7b+BBdKognEx3vj?=
 =?us-ascii?Q?di48XYLXifqCcUHVy7VvLXLfdP/yIolvW8MmRvxJAqmOhvOc7Zvi4XVFhA4K?=
 =?us-ascii?Q?+Pm9hEwN8OvVW4IgVnGjpnFBrznOmHScDnHjRYnHYjpdU2rPKKg501FNmWmO?=
 =?us-ascii?Q?LO8vLJ0jXS6JA+4PhM7vDRBg5hz8LaOnD4EMJrku79gOBj3K4Z3KLN+MNHR8?=
 =?us-ascii?Q?hSDqOFAIWrpYYkgDpjrJunjzjjefl4LccUYZsLOsOR688gQJUehwhUn/blfM?=
 =?us-ascii?Q?fn/xnBxBt4y7uQyq2lvdD0d54TMyyPka+tArk9ZnIKH2cZYA1lAr/kZbJ6au?=
 =?us-ascii?Q?YmRmVxx9xiO9EUVD+fq2hw7ZZYVF5ucTGST/su+tjEoTp8wORe8zjGBObZqS?=
 =?us-ascii?Q?pOFeJ2fDp3Vb4aJmZy5OKnfo7QRRqBzRK4L8YVT+cPZj267hGGruJgAjeYiq?=
 =?us-ascii?Q?5Q=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 2d0278e2-3e7c-4f6a-7bde-08da80626f58
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB5818.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2022 15:09:09.1910
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 q052P9Cxj8TgZo+FR701vqYb8bRs2YT3+g0NVR/8x4xoLJGFxHW110s0ncbuqUZ94yyjLy3W23Zdn05T1SM+xg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4493
X-Proofpoint-GUID: 1VTPsBDrxc5tGBb6k2c97J7ydNWgYNkV
X-Proofpoint-ORIG-GUID: FitsB1UxvkpoQhB8Gab6LSXGj_R5PSmF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-17_09,2022-08-16_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0
 mlxlogscore=999 clxscore=1015 phishscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 lowpriorityscore=0 mlxscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2208170058
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Aug 2022 15:09:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98297

The create_spdx bbclass does not currently handle the lack of
spaces around the op (| or &). For now fix the LICENSE string.

Signed-off-by: Saul Wold <saul.wold@windriver.com>
---
 meta-perl/recipes-perl/libdigest/libdigest-sha1-perl_2.13.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libdigest/libdigest-sha1-perl_2.13.bb b/meta-perl/recipes-perl/libdigest/libdigest-sha1-perl_2.13.bb
index cd6367512..df89c9bcd 100644
--- a/meta-perl/recipes-perl/libdigest/libdigest-sha1-perl_2.13.bb
+++ b/meta-perl/recipes-perl/libdigest/libdigest-sha1-perl_2.13.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Digest::SHA1 - Perl interface to the SHA-1 algorithm"
 HOMEPAGE = "http://search.cpan.org/~gaas/Digest-SHA1-2.13/"
 SECTION = "libs"
 
-LICENSE = "Artistic-1.0|GPL-1.0-or-later"
+LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://README;beginline=10;endline=14;md5=ff5867ebb4bc1103a7a416aef2fce00a"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/G/GA/GAAS/Digest-SHA1-${PV}.tar.gz \
-- 
2.25.1


