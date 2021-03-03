Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.71])
 by mx.groups.io with SMTP id smtpd.web08.2082.1614741509928631639
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Mar 2021 19:18:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=M6vPgIJN;
 spf=pass (domain: windriver.com, ip: 40.107.244.71, mailfrom: mingli.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZmjIFax1iPjomHj0IlvHBDQQ4T2WvYMs+RZaPGcyH1TSK7Fibe014mWgCDuCU+ym3E18bXvjjSyJl3Rxg9hRYUUbOXEt/KOcsngcJm4CGAX53CL763HrLEPr8rnL4gTP8xTfXcTzCpVwiBcFMF/bcFMXWTKzKjjaj0hFsQTQ5sUywI2sLS+6UuwSDxHGdeMGCPbf65+cXB331bRJnkx9ER4hAM/fFyPFjVcDgfzBUpvOMzlxNvW+nD+EbnDZhKAQ5lTTwikzQ44/bPtwGlf9UZ379bg7PJJIUEl1i9il6cywY6Y6LTBvxxlMecOSU5bVbYH41hraeed1rssWmM3MLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QiErAUiS/tYH3paitdp/Bg0aihGotUswkMd2WMLY0lo=;
 b=l+VgATILZ222kqEaDntkKBZZFhXBukdApr4L2fmuZOpoOrOCzbG4svvRtDoWYVxaJvAAGuSBVh3y/5LSyfc+wBAXG18I+33aojcuXAJzM3lWz8Se+xg5kLh0nVVsR+MP/IbEDi1JbehFi/XsTFO1kUsSMdFQyUPqv3FqIJT653VpNUG8dV4aRdqnlsjfqwQ2UyWYcB1dApAWBj3CSFtrlE9m8wApBzYlC7FnGU2G9osXmoU3zoOUp5BN9UAgqy5Phfo48upsJhxa2mJghVl4rKZb02FWzB1Eils348TeM4ij5GqBhHxweAOKF++0UhvOc0wu+5+J7PscQxR2yivjgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QiErAUiS/tYH3paitdp/Bg0aihGotUswkMd2WMLY0lo=;
 b=M6vPgIJNdihA55NVHU9+cacwLLPULnAxE8g05mfa7KW6c0C2+Mh37moya5JuEppvpkCmtHiIgm/RwiYSt8zPnArDQ52apE7XMW65VzlqPQ49IK3Ggum+JsqfFoxawy99QXv1EEwjEF90+wxBRpeqwp4PNJPfmccTw93m5ixGtPE=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by MWHPR11MB2000.namprd11.prod.outlook.com (2603:10b6:300:2b::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19; Wed, 3 Mar
 2021 03:18:28 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::45:697c:a699:df64]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::45:697c:a699:df64%7]) with mapi id 15.20.3912.017; Wed, 3 Mar 2021
 03:18:28 +0000
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] mcelog: Upgrade to 175
Date: Wed,  3 Mar 2021 11:18:10 +0800
Message-Id: <20210303031810.665-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK0PR03CA0117.apcprd03.prod.outlook.com
 (2603:1096:203:b0::33) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
Return-Path: mingli.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core2.corp.ad.wrs.com (60.247.85.82) by HK0PR03CA0117.apcprd03.prod.outlook.com (2603:1096:203:b0::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.20 via Frontend Transport; Wed, 3 Mar 2021 03:18:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6b2cfd8f-81a3-492d-aa7f-08d8ddf303c6
X-MS-TrafficTypeDiagnostic: MWHPR11MB2000:
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB20000D17B1B3FF2E92A914EBF1989@MWHPR11MB2000.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	XU2dRMIDwtxiJAX5I9BiDLV4xxbzEjJOsFp4kh6qWcSr5ArRgs29fdoggAnJaMLTtVA3HuOtbf0lLP5NY/jE2Qp9Zom3xFFDs5tJBqthZWEwdOQxpH/0ChhnAKfK7x4ixpKn60MJ4BKHkkQQxoQiZpIi1YdYE4uS7veCKCCep73FqHHFYR5Qmg0knOV3Tpz8GtN2qZ4UFMg6rBL21H1J9Ypz81VWkDscAlXROMdx494Wuy0ZUcFNgZkN+omQuUSFmFlLM+ugMUYR6gER6PbW3jTnVgXHd6G4TQHtSpa39JQbuWcU1GyOWfDITWlUBGARFizmMnyzvF1W3HUn9tZuXRwAjbwok57x2clzjuww0JHirzb20ca7Mqo3ghbv0etxZhneNu7Nze20LRctz5yBkEOzCpfCgVRGqL4YAIKnuFd2uxPVRADVE5fIenoMSSUH7zMDllyLO3rX0kJzPS2t4zkMxnaJaOKdTGYNDyGYw+qSqfr0iCUJQIW/W87ezFGyAkM6f1rtuVodCbU2GOESCg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(366004)(346002)(376002)(396003)(136003)(66476007)(66556008)(2906002)(1076003)(6506007)(6666004)(5660300002)(478600001)(26005)(6512007)(9686003)(66946007)(16526019)(86362001)(316002)(6916009)(36756003)(83380400001)(8936002)(52116002)(6486002)(8676002)(2616005)(956004)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?p4BJRqi5cOPQhgZO5nVK5afIF2dmlbvxBQWUvdxc1jkdnQAQDs/Qde9yAOxV?=
 =?us-ascii?Q?1ePYNrgT8ZcFYCEqOrUX9m8vLuif7dyiZvh+4m4wKqVsBiwVh/cqfI4YMqH4?=
 =?us-ascii?Q?JfHTWPndVX/Q4YtKEffIQAmh/mZc6PAWpximNpxybJ3JhE3r9LEeHnv4qmQl?=
 =?us-ascii?Q?LliHKFYkBV/dvVmeK5sc2naaxAYF6TzFnHKOZiRJpOvPzOaOoS8YzUQ4+BNu?=
 =?us-ascii?Q?YU6r8WXEy1AqQtsoDlSIWtbkOa3OtElyxQacHhP3Qsj0Gu1igWhQCaIVjecE?=
 =?us-ascii?Q?kAM2rkU2lOItUtZGuq+M23HD3KFJrb/USDckK6rFxY2bIUUpRCLJDnDU9vde?=
 =?us-ascii?Q?fb0SKEnZjFUexU+FmZCDz1mjQ3sFyqyET1mdy6v4AXVR7kZsUDfDgIE2IwvP?=
 =?us-ascii?Q?4leIW8dyA4lZ6g02gjSrilmSTmCPsM0/aZtkzO058s+78MgAtSf4rCDtyHdn?=
 =?us-ascii?Q?Z0HpFJ5ibEFRQovyQ0YZdMxmlTTx6eOvv6y/T06NOJ56b6HantceY3jZdLJI?=
 =?us-ascii?Q?1VrVgk2OH6qGUMI0g/vcGkzyYSf0zh+F+T358i8a9/fBAmNjbPVJCecCPXCz?=
 =?us-ascii?Q?nPTFFRLMdMcv2ZdO3nbbb8uIhBtV4CNUq93K+c43sXRfUSf7ssszl2RogJDz?=
 =?us-ascii?Q?4Mss3e7nbqZ+E9qbXUb2PeQMMFQfQtkLWNey45c9c22fn/NICrLaxGeM6HRc?=
 =?us-ascii?Q?otQN+uohdHLL1cw8sJ7zweFpGdwhsHbyKB60IoiDribzGR6r51JZpM8dL02Q?=
 =?us-ascii?Q?tWZgD9Oh59cRaQjRv4itRbTmA8uk79/lwkcdk5rkv4DMURR7eiw3vyGLZT84?=
 =?us-ascii?Q?TckDQ4moPw5UmOcLueoSwXgY9LieXXCqNCvVhJJNph0I1dt0NJD+BEgOyzIS?=
 =?us-ascii?Q?KMkcQVXicg6IH2s0aWvSGHHFZ7m+S+tTy6cyFGHuubFV6noHCSMtL9VVfTs5?=
 =?us-ascii?Q?ZJ9FNauxQpinA80mEHYtgZvJ0eMsog1KDjPoK9UuA8MbUpWSWrKNApcaqbxI?=
 =?us-ascii?Q?fMMgQunKXUg6iVVZnNCZ5uCvaXmpvE2ItYjJj8XfYqBaFBUccm4jIhC5YBii?=
 =?us-ascii?Q?TndcQ5Wm1gK8qp4ivd4vpY585N2jlB0ukzI//1JbKLo59qA4qH8ybMYE07gF?=
 =?us-ascii?Q?5rzXM2PWf61xl1GZthA2bxp1A0OyIbZdxBrCIJD9H4MqxuPeeGiP8BP25mAm?=
 =?us-ascii?Q?IP41zfRfuy5p6GTU/LvF5tgDkE3jwYg0Wq1avYTT25ezB+CosQqugjKt3SPN?=
 =?us-ascii?Q?JESN1tIw9oIUVMTZPDdYXqMrcbUwNBXAmf718m5Q7job4k2jMhE5/Z+WidGo?=
 =?us-ascii?Q?QoVpTCyG30CLKVnGn2wLuL0q?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b2cfd8f-81a3-492d-aa7f-08d8ddf303c6
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2021 03:18:28.5447
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JOS8h6GIvTKUhJhUuE/tAI3FkQ5ua/3BZZ5rvoh3rSJR14k9Go5YA6eDb2hfIW9RChWKe2Av0U9ES/CkDl9KSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB2000
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Rebase 0001-test-avoid-the-pfa-test-hang.patch to the new version.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../mcelog/0001-test-avoid-the-pfa-test-hang.patch | 14 +++++++-------
 .../mcelog/{mcelog_170.bb => mcelog_175.bb}        |  2 +-
 2 files changed, 8 insertions(+), 8 deletions(-)
 rename meta-oe/recipes-support/mcelog/{mcelog_170.bb => mcelog_175.bb} (95%)

diff --git a/meta-oe/recipes-support/mcelog/mcelog/0001-test-avoid-the-pfa-test-hang.patch b/meta-oe/recipes-support/mcelog/mcelog/0001-test-avoid-the-pfa-test-hang.patch
index 83c29a651..03bcc451d 100644
--- a/meta-oe/recipes-support/mcelog/mcelog/0001-test-avoid-the-pfa-test-hang.patch
+++ b/meta-oe/recipes-support/mcelog/mcelog/0001-test-avoid-the-pfa-test-hang.patch
@@ -1,6 +1,6 @@
-From 139177715a2d66ccd3e099be5d9d4dc86db30055 Mon Sep 17 00:00:00 2001
+From 3765b3a4cabf76f55c1c126ac64780a8c117d1d9 Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
-Date: Tue, 12 Jan 2021 03:05:38 +0000
+Date: Tue, 12 Jan 2021 10:30:13 +0800
 Subject: [PATCH] test: avoid the pfa test hang
 
 Per [1], the pfa test needs to install page-types and the pfa test
@@ -18,13 +18,13 @@ Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
  1 file changed, 3 insertions(+)
 
 diff --git a/tests/test b/tests/test
-index 9623f4a..7c552a9 100755
+index 020ae2b..320f57f 100755
 --- a/tests/test
 +++ b/tests/test
-@@ -45,6 +45,9 @@ for conf in `ls *.conf`
- do
- 	log=`echo $conf | sed "s/conf/log/g"`
- 	./inject $conf
+@@ -47,6 +47,9 @@ do
+ 	# Inject mce records and run mcelog in parallel.
+ 	# So that the mce records can be consumed by mcelog in time (avoid mce record overflow).
+ 	./inject $conf &
 +	if [ "$1" = "pfa" ] ; then
 +		which page-types > /dev/null 2>&1 || continue
 +	fi
diff --git a/meta-oe/recipes-support/mcelog/mcelog_170.bb b/meta-oe/recipes-support/mcelog/mcelog_175.bb
similarity index 95%
rename from meta-oe/recipes-support/mcelog/mcelog_170.bb
rename to meta-oe/recipes-support/mcelog/mcelog_175.bb
index f3e018d4a..ae810eff8 100644
--- a/meta-oe/recipes-support/mcelog/mcelog_170.bb
+++ b/meta-oe/recipes-support/mcelog/mcelog_175.bb
@@ -10,7 +10,7 @@ SRC_URI = "git://git.kernel.org/pub/scm/utils/cpu/mce/mcelog.git;protocol=http;
     file://run-ptest \
 "
 
-SRCREV = "391abaac9bdff385934b18134789bcc98b0adeb7"
+SRCREV = "7b776a8c005b60572f49797e81287540f99fff1f"
 
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://README.md;md5=74bb47b9a68850cb398665cf78b31de6"
-- 
2.17.1

