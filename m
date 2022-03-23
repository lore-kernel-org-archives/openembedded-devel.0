Return-Path: <trevor.gamblin@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E671C433EF
	for <webhook@archiver.kernel.org>; Wed, 23 Mar 2022 17:34:00 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.160.1648056833721455900
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Mar 2022 10:33:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=E+w7CW7i;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=00811796c1=trevor.gamblin@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 22NDeW2s014831
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Mar 2022 17:33:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=rZrEnb5PdYnBA+By9vygHuXUlPVG5jn+/74jJhpTsfY=;
 b=E+w7CW7iyUpVY3NJPycRe7679LTvY/H4biMcFb5WyUIikDR5BW9j5mQSt5RrlH1a9IRo
 zvWo/0iJWz/YUVgcl7Bln350tCJsrUUOxI+XlcYk8UB8FMe/JkIyzFJ4FhAD8f0qqyCM
 qEG68fGN6o1XYelfTcWplCiOcCpGctljoxNP+TdYMVYWJF7/VXDn9cs9HSXFkkmU89SX
 k2I5RePDf4F9HqSqkkeD05VgW1CxX3CZSDpywNKSEP1tO0YnOU6DhVDlGqBRbA1l+9k5
 VQ2PVc2KwTWSbmGVKAIYn8KVJEiXkdGyKcLSkC+OEGHMPjHI/zS38WytmCdTlBG5jglk mg==
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2102.outbound.protection.outlook.com [104.47.58.102])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ew4d03qup-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Mar 2022 17:33:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kSFPsp8GKIRHUW115us0T7+0f/3ixL4ZDfPcPCf/CJpAOubZjC4NNa4Du1pIUxj0tIBYliua3t+ECY+EX43imrp0C9xwFmI82SjHlor67r8MiEuLJK3oHoYu1byn8i3k7HUs9feVVWnaodf4P/75ZqyqYc8EeO9bYbPd+IarxeD2Ao0RyY/BAk3T8ZTJeWGmKDGau5Ii+NfQJhp8UzWve4n+LoTesN+/zhmYb4Elym/Dx4jq1XXDl0N/JOKjOFoDXO/bHNpm8qePV+ueWy53JC8uMAsRd0+L0dQBQYEvKP+y1iYag0yl6s/JrJv+r0fKPBifgBapw62LvCT1xrbeyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rZrEnb5PdYnBA+By9vygHuXUlPVG5jn+/74jJhpTsfY=;
 b=PXhP1gBf2s5Qci6qQp0X33Uu2U9Emy80Cg1Xha0flvPjYupJ0FnbsW6vxxpEL0tVhO9ik9TveybYX+BQRdEzZWkhCgXDlgr+rHUITFyEqMvOkKI5QHOdSobqjEO81B8OJnbAkngK2fT0lMM9R4UxyBNk0rOO4qjFUdy+AgB5K9JBRRKZRBi8K5NrpAHxLN5uHpOAQr7nZY2xowwKVvmcnqygwmUYg+NRXjuzfZ9HndDITUk8q93bAeKC/o6TS0mmhAtmZeg3xPRiC/gAeZERS/GxarTJeRIuKJjxry4oxsXev6581FaoSUr3zml3qF2dp8wwbG40rs0VnwZahO3tEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BN8PR11MB3844.namprd11.prod.outlook.com (2603:10b6:408:91::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.15; Wed, 23 Mar
 2022 17:33:48 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::c1c7:209:c28f:67dc]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::c1c7:209:c28f:67dc%3]) with mapi id 15.20.5081.023; Wed, 23 Mar 2022
 17:33:48 +0000
From: Trevor Gamblin <trevor.gamblin@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][hardknott][PATCH 1/2] python3-django: upgrade 2.2.24 ->
 2.2.27
Date: Wed, 23 Mar 2022 13:33:31 -0400
Message-Id: <20220323173332.16576-1-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.33.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YQBPR0101CA0141.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:e::14) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c1d9f7c2-b6be-4d42-b51b-08da0cf34938
X-MS-TrafficTypeDiagnostic: BN8PR11MB3844:EE_
X-Microsoft-Antispam-PRVS: 
	<BN8PR11MB38447B0BCAA645EE0DDF68239F189@BN8PR11MB3844.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	SxGOIrdSIp+JJ9wHoQlUug+gCCrkOx/+HY0sEHYhxa3Ik2uopnWoZBXyoXTsqLsO1OOhL8GxjQIuQ6PQuWxQWhx8T3yPIN2MWvjbnRo9GYvDw8CC+3DrMAkIDPFYBHfKjlM6DMN05+F5u4RZ0iEK7YvoeELh2Br2wifD55glTwgJuKsrVhXZy86dKwiIH0kkKW3J6tpP7reCdOvWirIfIBBmeWh+WDQwiY2PxYWY2J9OTfP7Rg21nCvVtziiGFelKhyfVtoHfD5FPFCUx1LGz0SjhFN/IMPDjGTDrDtmphvJM+QQjFx7lPPNo3QF8sZzYdk1bk346VPUTUkN9y2a0sRiINdQT2xwQ54Ani//Ei4lnan4qAfhAealM/o+8djLFK+DbqnODfAIHnUQG6NlkjprodSDkVfBcyIB2CX/K/WbcZZrUTnQD6r4K3gvXosKelhZWmV2N4l4BfktiHdJYlyHHEsYRa/uMwc+KkvtI+B9Ktcu7cMQ5pALJUdGZT704vISJeq3VXq0w0IG6Rweqd1EkkbNNAwYOGvJ8ksU3UrBvBWkqSbInr20yv8VupairlHq+kNcD8wTQiRzeyaNi6nHEs0szDhl04rGuB9v+pEzWQFhVV2bJu5vfNRNLT+4X73p/3Z+gBMBDbMSWr26ed9vjWzqjwhKAHw61dcRvqKlDtR67mUJKkXDAnK/yCH/ZIbVqDThVkOZ7xxgs1tC2g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(316002)(6916009)(66556008)(66476007)(8676002)(66946007)(1076003)(36756003)(6486002)(8936002)(5660300002)(44832011)(508600001)(86362001)(26005)(186003)(2906002)(38100700002)(6666004)(38350700002)(6512007)(6506007)(52116002)(2616005)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?PLBMokOVcT5WhNzrPtVe1QuNQ4F1cuR8R6j8q7cLoKvdZPFN05AgBwxf3FwN?=
 =?us-ascii?Q?R35ItzfukzR5xw0/zApAPm1jLmBnIRVur75x7J9wI6zchXwHnrmen6/PzMMT?=
 =?us-ascii?Q?j9I4fnvVaAAG0GKzLKJFvgJ4i+BJgDEj070GtLn2OuohipC33lwHCBctClQQ?=
 =?us-ascii?Q?FN5KJMfuvsgNvlyO/XGITU3RQC3lSRBFJE2fddGXO+zQYvUrT80SOcptWuyY?=
 =?us-ascii?Q?b3J0yPBDk0jlm9OiTbGDfGzsncpv+beT8l2ltbgDdf96MBqK98bTGKOY99a6?=
 =?us-ascii?Q?EwDy+fqZFiEAUUF8fRkEippZUo8ZYgyTSkOL+qMiyWjns3v1KOCpskO2Gl3P?=
 =?us-ascii?Q?53PEFJ9a8R0N9Jv9HpbfpLbSO1lB4CGu8HRy98JtdNoXbL0W85yl24CM93SG?=
 =?us-ascii?Q?8KTQEXo6V0J0Ej0E4eiYsQfCEOzSOzCGuhUv2klkQZyZbH/nBl1JTrQWaEHz?=
 =?us-ascii?Q?pSX9bZFg32rID74yey6vpxpVaNFuGbWYK7Z/0qxSY9WIskZO/61oPoN64n0J?=
 =?us-ascii?Q?55m7nFzf/xcqy42t72B2tXdpQrgr/1b30m1N6IG2IGPupWw8C4Ma/uqJ4Crg?=
 =?us-ascii?Q?S6RICgRm2qnEheNtNyWCxS8oYg9AjCK6elk5DYRwy693msV1zxKxRvCyx8OH?=
 =?us-ascii?Q?X8uyy2ZwZixL/YLRnG7jzMrzDjCwSL9Elhkw85fKQ7/3z2r8VOBGcnxV4bTK?=
 =?us-ascii?Q?9fVRuOFDqrpcPc8Uq8XuMUCwO8foPk5i6Y9sU4erwFf27UD9XLia1BpA1Xiw?=
 =?us-ascii?Q?BBR+Wa7fi5wB6m41kF+o4GoeVXrAlsa/v7zsWizcqNDvZnLc9dpDRLyJpEmm?=
 =?us-ascii?Q?hMujrgcZCoLnWplknHT6IJ/91do9IxVgYGV9CIMwUGplvCTgrED2ZeHwmiBD?=
 =?us-ascii?Q?jHChjzInIxwQmVXqXlCvd3JtB43nofof97v5WPBYvuDnRuUbNIEbVSWb6Suo?=
 =?us-ascii?Q?Y9mJE0w7KoHT5ixTE8nv+ynlgIo8L5AWMa8B2/kiI5XmyNFmEZDGnK7yU4Q6?=
 =?us-ascii?Q?elguRV+2/Bbt048Mp138TfH7uuq6fzuA41ufgL9jvJTofc6Sgt8EA51YzlrO?=
 =?us-ascii?Q?BcBNmEVhY63G6fVl3whti5IPvqOV0YcyDgv2rzViVQKD9QiW2tEirPCfmMXg?=
 =?us-ascii?Q?ETiZODwyb/is1tpTX2c4rWUuDiTd4Ht6wSzVGaqPaRG9tPoTsykSkEafn1ip?=
 =?us-ascii?Q?42xs4EmQ/L9kvGDgSeh5YMEDHDCD3TQNK9JyYpjtB868XLZDxxwDbAFKUESb?=
 =?us-ascii?Q?0Pg+Lv1qf8hQsqtKYsyTUzUvQJ/GtdtyOL2h2B4WX+cSx1g4c9Ar946dCNsy?=
 =?us-ascii?Q?T/RrWtY0Mvrf/DC5BrBnXnNRD9EW6DEPUOyAUlIeSSLUA+2rbVnV+KwI7OE4?=
 =?us-ascii?Q?aHy6UVPPAJiBD0ujbw9XotJ7d6MN/pzDJHP2frfvjxKWHrTCRs9ztbHZlvkl?=
 =?us-ascii?Q?/OanHI030hVGl3Pk9D2+v9ExPJRJYiL+HYcZpGnLqmMthcaL5CjpOA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c1d9f7c2-b6be-4d42-b51b-08da0cf34938
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2022 17:33:48.0603
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Qb+PzjP+jRkLyIQr2iQtCyHy3MUWudmod68igf6DsnKuan6H3hUbXCKzsAw8MV3HU+c3h5aobegL6nqjyaYFnU8y07aRUcW8EHkk41yhyIU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR11MB3844
X-Proofpoint-GUID: 0I-tQ1x-QugrpsbYaJiNDe76oJgVNpui
X-Proofpoint-ORIG-GUID: 0I-tQ1x-QugrpsbYaJiNDe76oJgVNpui
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-23_07,2022-03-23_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 mlxscore=0 malwarescore=0 mlxlogscore=999 spamscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203230093
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Mar 2022 17:34:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96164

The delta between 2.2.24 and 2.2.27 contain numerous CVE and other
bugfixes. git log --oneline 2.2.24..2.2.27 shows:

e541f2d05b (tag: 2.2.27) [2.2.x] Bumped version for 2.2.27 release.
c477b76180 [2.2.x] Fixed CVE-2022-23833 -- Fixed DoS possiblity in file uploads.
c27a7eb9f4 [2.2.x] Fixed CVE-2022-22818 -- Fixed possible XSS via {% debug %} template tag.
4cafd3aacb [2.2.x] Added stub release notes 2.2.27.
77d0fe5868 [2.2.x] Added CVE-2021-45115, CVE-2021-45116, and CVE-2021-45452 to security archive.
e085d46e4b [2.2.x] Post-release version bump.
44e7cca623 (tag: 2.2.26) 2.2.x] Bumped version for 2.2.26 release.
4cb35b384c [2.2.x] Fixed CVE-2021-45452 -- Fixed potential path traversal in storage subsystem.
c9f648ccfa [2.2.x] Fixed CVE-2021-45116 -- Fixed potential information disclosure in dictsort template filter.
2135637fdd [2.2.x] Fixed CVE-2021-45115 -- Prevented DoS vector in UserAttributeSimilarityValidator.
03b733d8a8 [2.2.x] Added stub release notes for 2.2.26 release.
b87820668e [2.2.x] Refs #33365, Refs #30530 -- Doc'd re_path() behavior change in Django 2.2.25, 3.1.14, and 3.2.10.
573e70ea48 [2.2.x] Added CVE-2021-44420 to security archive.
8439938602 [2.2.x] Post-release version bump.
79d8dcefb2 (tag: 2.2.25) [2.2.x] Bumped version for 2.2.25 release.
7cf7d74e8a [2.2.x] Fixed #30530, CVE-2021-44420 -- Fixed potential bypass of an upstream access control based on URL paths.
0007a5f9fa [2.2.x] Added requirements.txt to files ignored by Sphinx builds.
fac0fdd95d [2.2.x] Added stub release notes for 2.2.25.
4bc10b7955 [2.2.x] Fixed crash building HTML docs since Sphinx 4.3.
5289fcfffe [2.2.x] Configured Read The Docs to build all formats.
9a4a2b2089 [2.2.x] Refs #33247 -- Corrected configuration for Read The Docs.
029c830b71 [2.2.x] Fixed #33247 -- Added configuration for Read The Docs.
12141e3116 [2.2.x] Refs #32856 -- Clarified that psycopg2 < 2.9 is required.
cf63dd5c1b [2.2.x] Added 'formatter' to spelling wordlist.
05bc1c81aa [2.2.x] Fixed #33082 -- Fixed CommandTests.test_subparser_invalid_option on Python 3.9.7+.
a9c0aa11e7 [2.2.x] Refs #31676 -- Updated technical board description in organization docs.
66008c2af0 [2.2.x] Refs #31676 -- Added Mergers and Releasers to organization docs.
d4d1c2b3db [2.2.x] Refs #31676 -- Removed Core team from organization docs.
8f59f72a20 [2.2.x] Refs #31676 -- Removed Django Core-Mentorship mailing list references in docs.
837ffcfa68 [2.2.x] Refs #32856 -- Doc'd that psycopg2 < 2.9 is required.
dc43667eab [2.2.x] Fixed docs header underlines in security archive.
3e7bb564be [2.2.x] Added CVE-2021-33203 and CVE-2021-33571 to security archive.
48bde7cab4 [2.2.x] Post-release version bump.

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 .../recipes-devtools/python/python3-django_2.2.24.bb     | 9 ---------
 .../recipes-devtools/python/python3-django_2.2.27.bb     | 9 +++++++++
 2 files changed, 9 insertions(+), 9 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-django_2.2.24.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-django_2.2.27.bb

diff --git a/meta-python/recipes-devtools/python/python3-django_2.2.24.bb b/meta-python/recipes-devtools/python/python3-django_2.2.24.bb
deleted file mode 100644
index 964ca6ba0..000000000
--- a/meta-python/recipes-devtools/python/python3-django_2.2.24.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require python-django.inc
-inherit setuptools3
-
-SRC_URI[md5sum] = "ebf3bbb7716a7b11029e860475b9a122"
-SRC_URI[sha256sum] = "3339ff0e03dee13045aef6ae7b523edff75b6d726adf7a7a48f53d5a501f7db7"
-
-RDEPENDS_${PN} += "\
-    ${PYTHON_PN}-sqlparse \
-"
diff --git a/meta-python/recipes-devtools/python/python3-django_2.2.27.bb b/meta-python/recipes-devtools/python/python3-django_2.2.27.bb
new file mode 100644
index 000000000..7a50a6928
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-django_2.2.27.bb
@@ -0,0 +1,9 @@
+require python-django.inc
+inherit setuptools3
+
+SRC_URI[md5sum] = "4af3aeed9e515ccde107ae6a9804c31f"
+SRC_URI[sha256sum] = "1ee37046b0bf2b61e83b3a01d067323516ec3b6f2b17cd49b1326dd4ba9dc913"
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-sqlparse \
+"
-- 
2.33.0


