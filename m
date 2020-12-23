Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.72])
 by mx.groups.io with SMTP id smtpd.web12.4127.1608691690585483041
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Dec 2020 18:48:11 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=lxQ+ju4+;
 spf=pass (domain: windriver.com, ip: 40.107.94.72, mailfrom: mingli.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FgO20SXMv3m/e9cw/xL4JnkjY27a6NmRVf3dKokeEl1VDgo4RgrO7eVsxcPFGf3UAYFLdxaW4a4kT5uBk8z62junOTQ4gmfXK29X73oARDhzN5RG59TOUEJ+avYOWVXgFAwns5d9iQ/xgxASNTR6UaWnERVYnSuiJe3TJwZljg5+6/HJiVPgUqjWscpjLmExR4fYIq9pDj68ue3XXe2P5mZyJi6wjD/A1BpAwl/Sam4ilcMwj9XxwWb9f7ZOubr5IdkwCb3Kyob8afbtfArVPZM9iMRuhNypXRP7snHizrFDAprSvr55EiurSIXR2qqMwcycwkrTACXPHXYkoytPQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y50jqUWP3G2Kh7UpltmNjz9vo3niz9IyYuQhSRpXsRI=;
 b=Mr3LHRpGEOYZk3X5LZvyICThuYX1MZ9kM/ggs0aIyQEaaHqwtKAigKt8rLyEmqShinN+Oyhb0/WWM/KASMRkvL9ZXFUQqvIpeodekjPfd40kZFj2CDZQ6SLYFxKaRaHKcieeiLupWyz/BurSji/c76EJLv/BEIPQYnzMVdIP3pL7ShM8lbLhop4uleX/Q8YuzizHVWRgtylArtaRPW90zu667vqpOJcEv2iSYXUmk4gkLJf73iBmJLPa/smqWHZ98ltEtMd9bbZWk7Dk9Gj50/LxHOwRwOyrbnxJhMGlNcQGxl+Uz+45j9lXhnvXDINCWTfbYaXyTYctcsmhJW6nBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y50jqUWP3G2Kh7UpltmNjz9vo3niz9IyYuQhSRpXsRI=;
 b=lxQ+ju4+YHjX9bcgGQCXOce9GSBwEa/tHE8R/QwdlHnnpjPkLMNWL05K3ZAy9uOt2bEjP4sXsWpl0G3QBk2LwVdHQc2oKElieHNm7JMeScw0bCps7FS+6hRfCBXr9XN37YdtZqfaOmbz4XGR4yqi7AgEWiOksKzRO3aiwfDUFiQ=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by CO1PR11MB4978.namprd11.prod.outlook.com (2603:10b6:303:91::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27; Wed, 23 Dec
 2020 02:48:08 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::80fa:a14:ee1b:c46f]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::80fa:a14:ee1b:c46f%7]) with mapi id 15.20.3676.033; Wed, 23 Dec 2020
 02:48:08 +0000
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH] python3-astor: switch to python3
Date: Wed, 23 Dec 2020 10:47:25 +0800
Message-ID: <20201223024725.32317-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.26.2
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: SLXP216CA0064.KORP216.PROD.OUTLOOK.COM
 (2603:1096:100:5::26) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
Return-Path: mingli.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core2.corp.ad.wrs.com (60.247.85.82) by SLXP216CA0064.KORP216.PROD.OUTLOOK.COM (2603:1096:100:5::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27 via Frontend Transport; Wed, 23 Dec 2020 02:48:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7568562b-12fd-409b-ab98-08d8a6ed2dee
X-MS-TrafficTypeDiagnostic: CO1PR11MB4978:
X-Microsoft-Antispam-PRVS: 
	<CO1PR11MB4978FB22A7F446F7534E3C30F1DE0@CO1PR11MB4978.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1265;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	XfnPjsn7kep2ldp1sgqPmD80/VGFVKgDBdk71pQjmNBDAqtcc3gsBZFwDf1iOawbYNOeSgVCTNQr0jPp7F5wvhJj+MPTIEmCdKngXuMEuMHL+VHCJNpIgPCwCq0aAZHCpyhRCJC77J9uF8LqHr8ilsyoWbByGCQ360De1hLdZKDgbTSNws1zLM5V8awFTzmKpNx8NIYrGqChWZkr6bqcZdDxk0dCJcZ4x0nAtrX35Gw/DnQ2/o5H7U3mhIkNCPooLKtW8Hoz3WLHrFF+V8Tj2wGdoDQ/jaluJojl5KtR7jlKhwH/4ZwxhbqsBBRnpD/MSp7lB+BvTU2KO5BwolMJgo6a1Z9uFFNLHL1yMzLy7xfek160KRgdalGPlRcRuk+FgKcnaCdgpoISk9rWlTrNtO+xOaEPMuSO+meERBzYmiSB3XQi7VQKJi2l4qcKmmnuXdTk9rzN0dDp1LpGvr9DhQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(39840400004)(376002)(396003)(346002)(478600001)(6512007)(6486002)(52116002)(6916009)(8936002)(9686003)(86362001)(83380400001)(316002)(66946007)(6666004)(66556008)(66476007)(16526019)(6506007)(186003)(26005)(5660300002)(2616005)(36756003)(2906002)(1076003)(8676002)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?gJdXdUz05vo3k5FNAOOw+esAE/z3Ugynsb+6YzQQuNTAg2kNXaAcSPFGSZSn?=
 =?us-ascii?Q?UTLmcxem1wRSE7UTMWCNWAorZewEKqbgOzClfCwW7+CbYUbk9n+5jlTJ8eJg?=
 =?us-ascii?Q?5BrN9G8nBc4SvrpZsXP8c1YzhphiNK3uQZvJ5GJNGFtvaD4CWeL/f7ZHbDAS?=
 =?us-ascii?Q?Vf7gouTk7H84QeGuPhsfNCgb3rWnr0RKULoXK8Cmyd/FBoDHcSwQlFnnv6R2?=
 =?us-ascii?Q?Wl/YtXkz+gIsCP+tAris5plBlCst36CJgZTKeJbsN/LZuFtcsBijUG7rvtWD?=
 =?us-ascii?Q?yKnREpswu1qQJbXuCHd07/y8QMP/nQb42OmTcpYWzkjGe4oodGBFSjE0VMta?=
 =?us-ascii?Q?lbQaykeYeD9TCE3YBtY9YUgaeV3BQz3laO4s3aHDQ3VxjIZYi5jWC0GQOrnj?=
 =?us-ascii?Q?CWZU7/jWHS+GPCKL8P+oSpyJ13zV3CWq8AKcB2dLs4rGKm65OIgodf3mgblv?=
 =?us-ascii?Q?ZdsANnosG4y4LSXgIWrcjwh1HHAiBbsmdqDH9Slw+UD5lh9bAcOk+xlW6jEb?=
 =?us-ascii?Q?Tm8TqSGmv0JsB7oHhS91IPG8oZPoPWYAZidnvS4LRTWse2TsioBH7hDlzd66?=
 =?us-ascii?Q?3iuLqL9wA+yVZIdmo3CCq5abNLofAp11jNulsaoxH/Midy03regrWjTDr1Yu?=
 =?us-ascii?Q?9NLGp9RNoyp8FpVp6WxaUlPHTD/jWjiJbFIoMv+liJFqXEEWnN4O6dAHpck/?=
 =?us-ascii?Q?a/HdGA6mqMbzOA3/KFTYpP+B9jrEZnM8YKaiqVIfzKTsvMy8LfWbe3ONE5Pb?=
 =?us-ascii?Q?/ZqqAtyBr9iT04q/uxzI5YTQcI3LYKxS3czVXM3Z3MYhwmqxGH48KABlIdoI?=
 =?us-ascii?Q?PFZ1sT2ifOgAgUnm+ApNgJUz59dCfgIu6wZMf+phB4Exmfv7FabU6gwISjCp?=
 =?us-ascii?Q?P+vGIjvTGsmYU82Ug76owp01c2hazxrSvrH/t0wsCEo7b86jobgJARhP8X7p?=
 =?us-ascii?Q?vCjaOiFNWbemKG9Y2NhNlmsju16E2oajEVUZDh1UX1JO4BwENSHDumw0K+vF?=
 =?us-ascii?Q?wl0E?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2020 02:48:07.9139
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: 7568562b-12fd-409b-ab98-08d8a6ed2dee
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1bjMF8QLk33RrNS0mLk1+0yTq9Y9zPYHTBfMyJCeYW+XQ8YUf7KK/ZhLLr3h9lV8TUkIV8ODuXrFvvsM5CwYGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4978
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

As python2 reached end of life(EOL), so convert rtrip.py to python3.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../0001-rtrip.py-convert-to-python3.patch    | 36 +++++++++++++++++++
 .../python/python3-astor_0.8.1.bb             |  4 ++-
 2 files changed, 39 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-astor/0001-=
rtrip.py-convert-to-python3.patch

diff --git a/meta-python/recipes-devtools/python/python3-astor/0001-rtrip.p=
y-convert-to-python3.patch b/meta-python/recipes-devtools/python/python3-as=
tor/0001-rtrip.py-convert-to-python3.patch
new file mode 100644
index 000000000..009951864
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-astor/0001-rtrip.py-conve=
rt-to-python3.patch
@@ -0,0 +1,36 @@
+From 1a477968593a14ee9c8597c1ed4e8b61a7731e15 Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Wed, 23 Dec 2020 02:23:13 +0000
+Subject: [PATCH] rtrip.py: convert to python3
+
+As Python 2 reached end of life (EOL), so convert rtrip.py to python3.
+
+Upstream-Status: Submitted [https://github.com/berkerpeksag/astor/pull/192=
]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ astor/rtrip.py | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/astor/rtrip.py b/astor/rtrip.py
+index 8b108e7..e2e30a6 100755
+--- a/astor/rtrip.py
++++ b/astor/rtrip.py
+@@ -1,4 +1,4 @@
+-#! /usr/bin/env python
++#! /usr/bin/env python3
+ # -*- coding: utf-8 -*-
+ """
+ Part of the astor library for Python AST manipulation.
+@@ -160,7 +160,7 @@ def usage(msg):
+=20
+         Usage:
+=20
+-            python -m astor.rtrip [readonly] [<source>]
++            python3 -m astor.rtrip [readonly] [<source>]
+=20
+=20
+         This utility tests round-tripping of Python source to AST
+--=20
+2.26.2
+
diff --git a/meta-python/recipes-devtools/python/python3-astor_0.8.1.bb b/m=
eta-python/recipes-devtools/python/python3-astor_0.8.1.bb
index 125a0236e..5048e5bec 100644
--- a/meta-python/recipes-devtools/python/python3-astor_0.8.1.bb
+++ b/meta-python/recipes-devtools/python/python3-astor_0.8.1.bb
@@ -4,7 +4,9 @@ SECTION =3D "devel/python"
 LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D561205fdabc3ec52cae2d30815b8ade=
7"
=20
-SRC_URI =3D "git://github.com/berkerpeksag/astor.git "
+SRC_URI =3D "git://github.com/berkerpeksag/astor.git \
+           file://0001-rtrip.py-convert-to-python3.patch \
+"
 SRCREV ?=3D "c7553c79f9222e20783fe9bd8a553f932e918072"
=20
 inherit setuptools3
--=20
2.26.2

