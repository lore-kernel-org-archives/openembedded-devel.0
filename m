Return-Path: <trevor.gamblin@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1096C433F5
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 15:00:38 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.11075.1647961238191695533
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Mar 2022 08:00:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=gCaSY79z;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=0080b8e7e1=trevor.gamblin@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 22MDUUf7028067
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Mar 2022 15:00:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=o5BmN86E3kchQMEbxwLaWzNwdxGiD4EYFQz+//8EOT0=;
 b=gCaSY79zFPVsp0cnVRgp6NpNDe38WoPinGopijM7SREdCOzLlw+oAyMd3WiAyKPbCH9N
 dhF9naqOz1+lU65TYDGKQLdx06+/dqQMnkLSjcSkZpCMFtd/SCQxQmq3u2tAPVf5ubSX
 NEfBN5E0V99/TtDOjX1+utNCANfKxBfVq22rYlEko6AG2kD3JEU3rTYb2tXIighYeNWm
 cwFgTZ7OL96puntn7XfsIzlZnCylAR89YZd76RpoJAoLVL/C2WLS2n9AGtlMgZm5BNxd
 dGQxnUZ2mJsHAcc5AqvH1c/1xLyT/GrxWpLdW+iUmwk9NTIWZKjF0R7JJAMM5m61i+4v lg==
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam08lp2047.outbound.protection.outlook.com [104.47.74.47])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ew4d02k1e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Mar 2022 15:00:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fJmTFx0erLIuxxK/iekTMYsBxcVnjUzGIzd0kVykA13rSY2mDY7Tqh3iQrSmvsWKjgRyh2pzOo6xm2NHp0o5EFoh5hXom2ZXj0jy1pgp7AlbD44CGiaMkhAmYS4mBU4HNsR9n1exPByec7WPRwd59iA9b5A1Vw1+cny47+AJiWzslvOlGb8WIIhGODjgey8wmurEYgxlmRiPxZQN+qo01DtvkBs/bz7CN9HcXPQDa6PS7V6lPcouOsrok0JJX2GN1l78183/L+MdIQ3WDj533+kkXNvpeDsB7+vqs0I4hyBiVt8CtFhNq8YyVpNVAJ2n7rqnFtfcYwvlgYia0bmshA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o5BmN86E3kchQMEbxwLaWzNwdxGiD4EYFQz+//8EOT0=;
 b=SkUuuWQKx57J1c5vZHvT572BfH7tbW3WXDGFhNfQ9Spr7p6lK99OOskEIaX2z/sPb4netGyKmQcEVMHXkrUhuFxleORCVdwPpTmn7ZDbI4fxVk8FpGt4zcxXrNOcZVIAw2UJl+7x+gaueuWoFaNK29vpZn4LKH9dmeeBNXI/NevePzI3PB3rYWygpsRF0yU70pLD1HV8bzmm95ysH3h3HXKOQotoV04kIJUwykwmlo8PtIRYHor/gmDz076T4J8gD2Jfv8HQPZMJFoxrcOVZgHXVdQn4v55FepIaPGVwf7v0hM9MBSo4pcUG8AR+gQTX9B9FEgcuYA+N71/9r313JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB3878.namprd11.prod.outlook.com (2603:10b6:a03:182::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.15; Tue, 22 Mar
 2022 15:00:26 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::c1c7:209:c28f:67dc]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::c1c7:209:c28f:67dc%3]) with mapi id 15.20.5081.023; Tue, 22 Mar 2022
 15:00:26 +0000
From: Trevor Gamblin <trevor.gamblin@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] nftables: upgrade v1.0.0 -> v1.0.2
Date: Tue, 22 Mar 2022 11:00:10 -0400
Message-Id: <20220322150010.32030-1-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.33.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YQBPR0101CA0170.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:f::13) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 625623fd-54ac-4676-cb47-08da0c14b2d2
X-MS-TrafficTypeDiagnostic: BY5PR11MB3878:EE_
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB38783BA311E5CC45F4114F799F179@BY5PR11MB3878.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	hocxqdgaL62gpYFx/p6+OHx4bWT2oktlhhrEcPNXybgbAuxmtEGust6A4Kr8chgGOjLnHjfcBx73yMSRRERqVsQxbffj7kEk2qGEzaPHTygITOZOmpUkOR2bF9NmHWvWlKYly3fMKMMHSEhIn07dJWVCyq+E4ZhioVgSQuti3wlZexUHhcvVOekUqHwjswL60n4JeoDaE0s8V1etG0FDDollbLRCmEskgYI4MXzmUJ8RllohgZl4UZioCDwgQuz2uO/OWWFPuP0r7wULmsgikR/kaQIJrS3y2gn+lG0Qoct0RMrS159qiJzjRh+gQXxJNaRWqYWjeU/3B7EXmvKCeQWQVBlF0FUvij2SJWXNjuIBfCn09U9lO5Y9BKWaa2et+BV/exR+bUBYBZYJnYc/KlY1kHUCitJmUglW2JbGldpjUZ4wVfFi0wLIJZeOFy5koszSQ3pCKs9Bj88l/VEp/QYybdIzEVTL4kUt9rc5U2Jem2ynfxCMufwngjPRI2yBxFQGEwNXAbIsnrtPzjIxxpfxYYXbYdpKQgqzjc73+f5+4dA/e0zDqhmsmAi46VvTma/v56ojXYpjbBoBdIjJC6iQgZ1oLkH+UJpZ+j3ma9qYoYu4h64Zy0oTmCS4detP6IZ9UkbVY/s1tVbQeG/n/RBZkMLqcNV/WW+mavbGD9ZQexQ9flFq0KNsx9GD0h4Bvm/JiSQaXn+cNgegn0Gc7IssAr4a74ufsrP5OHk8EDWNSFR6bVORApsrHZMyRrHpDKeaVDg/gAg0XlQeetuSvQ5++wCS//QQuGWpJKdRwEQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66476007)(66556008)(66946007)(8676002)(2906002)(38350700002)(83380400001)(36756003)(38100700002)(52116002)(6512007)(6506007)(508600001)(6666004)(6486002)(186003)(1076003)(6916009)(26005)(5660300002)(316002)(2616005)(86362001)(8936002)(44832011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?/3whcvRIY0SnCQVRUK73kfOz8JfZxXzGI/zCZu7r8USaq0ZrMLXJk3RzJVsW?=
 =?us-ascii?Q?DgAZbOxyBGrpYND/H+UMdnDrCCQbZSqtu701e9Mubhf9zO37z6t8lfqG8QF1?=
 =?us-ascii?Q?FXThT5kg7FyLiQr0sd2NONg7DqwIIxuarXO8JHGh92YrDNhFzD8E2bE020Zq?=
 =?us-ascii?Q?x9wt6Wb6ncrnenpgPZOL3TVpInM2KM678BqU6MnDP4AKzl+eB21DQihSnlNO?=
 =?us-ascii?Q?A/RQAFR+lfWxe7vbw8ZWqey5fzco8Jl3DCqHoOAGdP3QgOq7N7gpaHLlX9XF?=
 =?us-ascii?Q?4PzWbIySNjXzcJNJD9hjy4/NWN44Cu1drAs7FIQxsbOOA1jQZ18X4hkOCxTB?=
 =?us-ascii?Q?v2gZC8w812fJa37oFQew7K+G3m3sq47dOSRel3G3emvYNDSDjiodfQHYJmzT?=
 =?us-ascii?Q?9AG1cA6tLpK26QYMZCPPM+PrhtDv6M6iSMcYe+NJNuzJv2OLxhgmOPg66CEs?=
 =?us-ascii?Q?ffi2qbZmbRYtowsRqbpViHjBlAMZpsHnfBghTdYfUQFvc8pXkm/0baOL0Ubh?=
 =?us-ascii?Q?ZeQ64OaER1qPYHwfYyjNL2FvSV9dIwEetNz1cfABXSDWdJx5/2QMkxVnADQX?=
 =?us-ascii?Q?t9t64VqYoRlAnwIRKQENoDkPboFFFK4Kz0z3tYJeDbbeRi69eMFXYNBYy6ii?=
 =?us-ascii?Q?wsNY+AFA0Z+vxpbCp8kfnDRxvvq0atQbU4bByFd7B2UiXMFnSYxIwqws3g31?=
 =?us-ascii?Q?eAbKaLqFOX1Mf4ms4WNmRqEPUySQmPph7W+VfB3SsRe76cz8fb6563r4THdd?=
 =?us-ascii?Q?FMQxjAP4bDkA5Jx5JE3GszMvHfba5Ay2mIXGwAT494DluH1itYc4pMhF90A9?=
 =?us-ascii?Q?AVCU7PW9pV/hb0FefaaT6TCKj5KBDqnw1KOEslYU/aLBpU1LktglQmXxcts6?=
 =?us-ascii?Q?GifP2Yo1bflYC6dnS3Onp/orGZoJh6Tyx7DfL4PH7v+kBynDU0qKPXrV1fpT?=
 =?us-ascii?Q?pMSAMcQOiF5qTpFswHXWworjyE2bp9C7rmPKCZK4J8MXJxJqi/xWGdqBnvM3?=
 =?us-ascii?Q?lGrZFg9o5jREJG6uFrMAUiYdFrG0sYnopnadZiXeZ49P0FoYEJhelFpC7zxt?=
 =?us-ascii?Q?YPKny5akSGOmH7epMNM45RFZFiEqzdy67mKKQY8St+lBJpZCZq3+FIqkfWZH?=
 =?us-ascii?Q?S5AH3KaxpNmT7duYZl7s0k7e8n6fT9QCae/mNDQuO1fsxZeNw0HYPKk8v3sG?=
 =?us-ascii?Q?YFuZoAXU1sjsWAZ1HEzV0q62F18LeAFzbEUepCJIbo0B7GSQHieDahdhTRv+?=
 =?us-ascii?Q?Z/9373+es+1YvE/ya6kij2RmwbZDWAcswkNTBbqery83tFtq6YMskNNtdwhn?=
 =?us-ascii?Q?dP8ZOB+W7z3k1IYGdLuoozdtABTeEmdJskoXiDib//nOAOb78rhhb+iGmoSI?=
 =?us-ascii?Q?FHCchuJZVZqmughz9QLH7zD6UpqlCIFkmxMIK7DMRRA9eZ2HpimmWYcBMt/g?=
 =?us-ascii?Q?83H/tSpym8wmj8l4MOk5WudpM7o/FzzkEHxfjU4sUYPqBiKdy3CeXg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 625623fd-54ac-4676-cb47-08da0c14b2d2
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2022 15:00:26.6634
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 dGu4UGLH5EWi9gVzhTl01ac0yZoXajRccTfDRdXgd/vvX0ZMyLkxwp3nAv1Oqpe1xvHFkJKgSYaDHOTpoePqYcoJ2UWSx5A6Bk0ccUqkdkQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB3878
X-Proofpoint-GUID: 8vjfr91_ewaIcfaTiHv3Z-D3k0wtRMs1
X-Proofpoint-ORIG-GUID: 8vjfr91_ewaIcfaTiHv3Z-D3k0wtRMs1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-22_06,2022-03-22_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 mlxscore=0 malwarescore=0 mlxlogscore=999 spamscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203220086
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Mar 2022 15:00:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96141

Add libmnl and libnftnl to the RDEPENDS for the recipe. Also add a
patch to remove the "example" directory from the list of build
subdirs in Makefile.am, since this was added in v1.0.2 but it is
breaking the build for content that we don't need in the image.

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 ...e.am-do-not-build-examples-directory.patch | 34 +++++++++++++++++++
 .../{nftables_1.0.1.bb => nftables_1.0.2.bb}  |  8 +++--
 2 files changed, 40 insertions(+), 2 deletions(-)
 create mode 100644 meta-networking/recipes-filter/nftables/nftables/0001-Makefile.am-do-not-build-examples-directory.patch
 rename meta-networking/recipes-filter/nftables/{nftables_1.0.1.bb => nftables_1.0.2.bb} (85%)

diff --git a/meta-networking/recipes-filter/nftables/nftables/0001-Makefile.am-do-not-build-examples-directory.patch b/meta-networking/recipes-filter/nftables/nftables/0001-Makefile.am-do-not-build-examples-directory.patch
new file mode 100644
index 000000000..da568900c
--- /dev/null
+++ b/meta-networking/recipes-filter/nftables/nftables/0001-Makefile.am-do-not-build-examples-directory.patch
@@ -0,0 +1,34 @@
+From 4a0a013647054994e089a024b07d76b25af6ab76 Mon Sep 17 00:00:00 2001
+From: Trevor Gamblin <trevor.gamblin@windriver.com>
+Date: Tue, 22 Mar 2022 10:11:10 -0400
+Subject: [PATCH] Makefile.am: do not build examples directory
+
+v1.0.2 added the "examples" subdir in Makefile.am, but the contents of
+this directory do "#include <nftables/libnftables.h>", which is breaking
+the build. Since we don't need the content in that directory, patch it
+locally to prevent it from being built.
+
+Upstream-Status: Inappropriate (embedded-specific)
+
+Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
+---
+ Makefile.am | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 72fb4e88..4a17424d 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -3,8 +3,7 @@ ACLOCAL_AMFLAGS	= -I m4
+ SUBDIRS = 	src	\
+ 		include	\
+ 		files	\
+-		doc	\
+-		examples
++		doc
+ if HAVE_PYTHON
+ SUBDIRS += py
+ endif
+-- 
+2.35.1
+
diff --git a/meta-networking/recipes-filter/nftables/nftables_1.0.1.bb b/meta-networking/recipes-filter/nftables/nftables_1.0.2.bb
similarity index 85%
rename from meta-networking/recipes-filter/nftables/nftables_1.0.1.bb
rename to meta-networking/recipes-filter/nftables/nftables_1.0.2.bb
index 2c378e8fd..1556b217f 100644
--- a/meta-networking/recipes-filter/nftables/nftables_1.0.1.bb
+++ b/meta-networking/recipes-filter/nftables/nftables_1.0.2.bb
@@ -6,11 +6,15 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d1a78fdd879a263a5e0b42d1fc565e79"
 DEPENDS = "libmnl libnftnl bison-native \
            ${@bb.utils.contains('PACKAGECONFIG', 'mini-gmp', '', 'gmp', d)}"
 
+RDEPENDS:${PN} = "libmnl libnftnl"
+
 # Ensure we reject the 0.099 version by matching at least two dots
 UPSTREAM_CHECK_REGEX = "nftables-(?P<pver>\d+(\.\d+){2,}).tar.bz2"
 
-SRC_URI = "http://www.netfilter.org/projects/nftables/files/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "3ceeba625818e81a0be293e9dd486c3ef799ebd92165270f1e57e9a201efa423"
+SRC_URI = "http://www.netfilter.org/projects/nftables/files/${BP}.tar.bz2 \
+           file://0001-Makefile.am-do-not-build-examples-directory.patch \
+          "
+SRC_URI[sha256sum] = "0b28a36ffcf4567b841de7bd3f37918b1fed27859eb48bdec51e1f7a83954c02"
 
 inherit autotools manpages pkgconfig
 
-- 
2.33.0


