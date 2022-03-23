Return-Path: <trevor.gamblin@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED2AAC433EF
	for <webhook@archiver.kernel.org>; Wed, 23 Mar 2022 16:17:08 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.162.1648052227798077309
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Mar 2022 09:17:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=W0IfAuLD;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=00811796c1=trevor.gamblin@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 22NCuivl019356
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Mar 2022 16:17:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=K9LIJqBFKP6USKPCE1xxqU0RAXYnnPel4G+gu+vxHVQ=;
 b=W0IfAuLDdlFhxOR6+LL3Ncw947+yQ2QBRdSjyHwnjtsxMg7A4xRW1400h7ClUrxdpOOv
 KJ1YhZLhLvY4eee85Nodsko20kMYERL5X9IOI4ZcYQflSLbndp+qJH7/4oXdD9+tkz0B
 AMCYN1p9zeGgDQFhckNY5DXQtKTTzUVx8TcOA4Uao3bfLAeFI5V34g4lRIO6iaoTjiWx
 avrXvUwROpNbJvyjfbPSf3F9AyaHDoLo62qX+57dVCtCnM9m2JPgXD6bKOttCdkZEK9X
 2Tf3Co480TOTqj81TH+9aUlvPbhbww31idEVayARGP4OUtbceS6fhtqY8jnt9TRA9xse VA==
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2177.outbound.protection.outlook.com [104.47.56.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ew657bkm0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Mar 2022 16:17:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iJ2xs3mmawZcoahkaenvSSrNYzrhQl84XPQjFaEmJ+TOlMe/eCLaLLxmlqMIkoB1yCS8PZzhwTuh+gIgaBPYj+SnmTw+x+s/XW+RKnFBLm4mCpskYg4UfaTG/t5HE6yDYG0bsU6u5WfpnS6HvZ1G/Zk/vEV9Yu1thEwBnaE8W2Fx5JrktibNaCb8PXjU1SXjgXY5vD0NoBaWN2zh3GVBFGnRgHXtoKLnbYr2GLrgTx4nV/KoDocD2+Ck7CMllIrC9Sn4vFNmcag1ymfjg3R1yaFJWUeaFyhOiuYM/oldF6RPC8cEZV1WotbRDGMP2X+aF7dwo93JLBmPugTnIKM7BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K9LIJqBFKP6USKPCE1xxqU0RAXYnnPel4G+gu+vxHVQ=;
 b=g9JM3wFwVPTZ549iOAgFRYDbQ7kB3AYY0je2YYw6cTTYl+Ad2CBX7PuuwX08KKYwHsxGqm3a/gYauQbk40TZ/o87N0KVTEzsuikLyc4t68xOUlpeq3tCL1AC9qDCqwsLI7aonol1GJ/N7bknQdG4cG+HnQVrDCyps5rHE+GbUrhtwckfg1hqoc1bsokpu/KyrLCuLiLLrPPkBwz/KjFcD8dENeU8OEM+0O37KeXDCbQqSx8lMabXp416+yxmRDVbLjnEnN6iKJzGG/YkFYCHSshHKa3tWMm0l2YgDAJ0RlpwwaNNDJSlfjDY/s6F7x/HK+FE8t807F6KVuA7lYcTTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by DM6PR11MB4514.namprd11.prod.outlook.com (2603:10b6:5:2a3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.16; Wed, 23 Mar
 2022 16:17:02 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::c1c7:209:c28f:67dc]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::c1c7:209:c28f:67dc%3]) with mapi id 15.20.5081.023; Wed, 23 Mar 2022
 16:17:02 +0000
From: Trevor Gamblin <trevor.gamblin@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][honister][PATCH 1/2] python3-django: upgrade 2.2.24 ->
 2.2.27
Date: Wed, 23 Mar 2022 12:16:45 -0400
Message-Id: <20220323161646.37413-1-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.33.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YQBPR0101CA0208.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:67::31) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d7d6f7f1-f842-46db-08bc-08da0ce8906c
X-MS-TrafficTypeDiagnostic: DM6PR11MB4514:EE_
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB45140F3C6A392BFA0B406D4F9F189@DM6PR11MB4514.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	UHGfhAOTlo3uXSEeFFfHyTrL8lvzOjoZRAKJuPV9HnzI7PHjEN9Cn7Ixm7kZ8kmWKpri+iRZgyg6XIqUAjS2OSmxVbdCbsHC9OnNj7FkK5PmXTEHWh7Hjj2Mq4ii4aTev0jsQZEIbep1itVk8jPBcgeay+R2mE9m4dik7Qk60LFeJFnomu7omCDYG/+3bRkR7nXykCOBPD8xIC+WzlQEXVoYmwUuTaiMSJul64k1m8NFVmmVOzQz9mh4aCSRWV9N6pt0kw3YehbIZxxXME/mRrIlGt1i1L6xsd1Xo4acoy9qJ1x8GSfFa/vNFKsteVmX5nectDXqbgliApYJp0oz1c8HjJsUCMuI3az6vD3zNij4FsZNg0I4v0tVnlKZoCxkzC/oDOV2QhwGQWSJqamzuMCipQd4DV+dQhqWXTHNbGC6lLWMhXQa/XOGHz94GTX097pOvBS1nU5HK1/MzTex3qaAXismDGE6FUrOCXoZWoSbPYKCNnoq9ozHi0ePZVMvB8ViqE/ek7/9x9jLuHFH+ETwbk1mnvBWRl02Db7bCHU4WGf6x//bUz+iTg5kGhpxZzCg1JMYPUDc1fBMYDuQICZswdiBbxwyvOvqgcxj+Qca5CbQBFiQXrjM7YrNspfEtzkn0F1kfr4anjfwsXxHQUy7jwCyJsve28ZkINgkjbRwKHbyO60oEtKLyPNspNPXIGFI5gwcPlps9r4chOWNtA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8936002)(52116002)(36756003)(6512007)(6506007)(2616005)(186003)(26005)(5660300002)(44832011)(1076003)(83380400001)(2906002)(66946007)(66476007)(66556008)(38100700002)(38350700002)(8676002)(316002)(6666004)(86362001)(6486002)(508600001)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?N1CBKo3IiNR8rtJqiHgvzJOMc5JntiokvCUwBvcVag434yJj005Z4auwFDr9?=
 =?us-ascii?Q?EOfpwXmUGe78Tr+4sOLQxeB2cKhQiCdygBi5/gVun/J9BtI72Za9Ni57r5c4?=
 =?us-ascii?Q?qY31KBPLpICq9/W42L5Q26qUJCkBPSNytZcChGcFk91l0L/gLOPtt2UnCkse?=
 =?us-ascii?Q?onmdyraZmTyy/rFuSr4wiRykcklAaTSLWAC3YTfE3DH/2/IFZIzvzLedlA12?=
 =?us-ascii?Q?4gN9+jvI3GmI+e/LQZdTdV7F2Q9VvQsRDAuqpbW4RD/MXHnNTjfLzj2WSE4q?=
 =?us-ascii?Q?AHIrcu2xbvnWVNJ0jKjFwOeYIgVJooHtBG/X3DpfY+SEUU8fpgMRrVLrnF8I?=
 =?us-ascii?Q?P8UYSVrlfP1IWJRcAVG0p8HafkfZg1HsLTV14cMjrdu2cvB7AOW7+vM6s5HW?=
 =?us-ascii?Q?ydL6eyRo4n5ZOz2oRQjisrd9hvdTzCJ1SLPdTi1HDQhccSL3WmJQMf3SbTCA?=
 =?us-ascii?Q?Sd09saMePZ02Md5Tzb+6Fs29ES3EmvRxwsQF7kzsis4HTDl7ENHds4tCZA5G?=
 =?us-ascii?Q?tmMkX6dzN3lh1rVwCbZlAZ9tZWK5q1s/GKYpjE3mMW/lqNSpP4fU1Ax2rCi/?=
 =?us-ascii?Q?qyScztYmmcfAE0AdauuDxKkCuzg6YskOCiaVgu4S+F2QhyS0waW00g+05P+O?=
 =?us-ascii?Q?Q0pX8SMxql+QVgtE/uC3NOq+/Zx2kAmi8+3F0zYdYNE95DJEGDM4QCimHG2R?=
 =?us-ascii?Q?QXk0eNl82bKHIQeUOxAZrJiO3Z3vaab0Di1AR4h+5VvOqYBCPcrx4lfSTlR8?=
 =?us-ascii?Q?nnSxelJ/pN9GACZNlB7EwMItcJqdLnBkOL25x7MaRnlrwc2odY/vIvla7JWI?=
 =?us-ascii?Q?oGDhcnUby6Jxq6hZs9XhX7tGMibt709uEbm7ZGe0pY+/Y38MlpPAmhKfbKue?=
 =?us-ascii?Q?+3BnW/yE9RgXXB3GHtu4r8/7Yj/HPtSvewpKj4F+g3JCIRLp27T22KFCB3Ap?=
 =?us-ascii?Q?ViQ8YfNHYNmGYxQun/MtUdvDqEtZIrxToFWaJFF86gn1M6m8XGeKn7QSidPL?=
 =?us-ascii?Q?ICuo8OIN4hK5BwOE9s6frSAgOrenkbJ5B5N/lg9o1ZWfKX0V6Ic91u8cgnV7?=
 =?us-ascii?Q?Tnywj2hy/iuZyqDnHhrljQDBnWFYVtorfGLxV0kdUptPPs6YuHpK4iYenNB2?=
 =?us-ascii?Q?hBZhqkgoWtWZH+P/6IF6xWQyL2YM/nAyuXLq6xhz/wfw6XfYCFR2v1TEp/TE?=
 =?us-ascii?Q?fq6tOXly1GIU+g1eztq41c4AttRe3fASsqLSONQsCRMlQufRiTlkADDvk/Cd?=
 =?us-ascii?Q?Z1rM8yD+9mvOZbaZp5d7fWxJ4S0KUNoWfiggtHHcZ8NZyiRorj3LT9l3k45U?=
 =?us-ascii?Q?av4InrEBmbFFQ3sYRreuZ2C8sH9zrwRIrM2DAk46IpCcCFqXEoRk3zdo6NYB?=
 =?us-ascii?Q?EXdG/N0rrBZI1+/GK73aFfyweXAXK0+XpdPKlKjKT5DEp9F+WNUCBn40c8Y6?=
 =?us-ascii?Q?6VjhlQeBO603pH7tkReYj4xX+RN3NlVuffZ9jtOlD/qicyLl+tL8Jw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d7d6f7f1-f842-46db-08bc-08da0ce8906c
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2022 16:17:02.4416
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 2LIA3sPqNv1DbSMgmlTe8haHXTBOUPE1UWNucwwPGnAzl+BQQbCDJPreNusOWrRejkaCVdVQNn4jQnXigPuloSEJdNQ38YwdNMeR6jQ5xUM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4514
X-Proofpoint-GUID: 6VgX8AbYhEejahZRTaYDcR9HvaRjPVOB
X-Proofpoint-ORIG-GUID: 6VgX8AbYhEejahZRTaYDcR9HvaRjPVOB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-23_07,2022-03-23_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 mlxscore=0 suspectscore=0 spamscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=999
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203230086
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Mar 2022 16:17:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96161

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
 .../{python3-django_2.2.24.bb => python3-django_2.2.27.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-django_2.2.24.bb => python3-django_2.2.27.bb} (60%)

diff --git a/meta-python/recipes-devtools/python/python3-django_2.2.24.bb b/meta-python/recipes-devtools/python/python3-django_2.2.27.bb
similarity index 60%
rename from meta-python/recipes-devtools/python/python3-django_2.2.24.bb
rename to meta-python/recipes-devtools/python/python3-django_2.2.27.bb
index 982362bdd..80e7de624 100644
--- a/meta-python/recipes-devtools/python/python3-django_2.2.24.bb
+++ b/meta-python/recipes-devtools/python/python3-django_2.2.27.bb
@@ -5,8 +5,8 @@ UPSTREAM_CHECK_REGEX = "/${PYPI_PACKAGE}/(?P<pver>(2\.2\.\d*)+)/"
 
 inherit setuptools3
 
-SRC_URI[md5sum] = "ebf3bbb7716a7b11029e860475b9a122"
-SRC_URI[sha256sum] = "3339ff0e03dee13045aef6ae7b523edff75b6d726adf7a7a48f53d5a501f7db7"
+SRC_URI[md5sum] = "4af3aeed9e515ccde107ae6a9804c31f"
+SRC_URI[sha256sum] = "1ee37046b0bf2b61e83b3a01d067323516ec3b6f2b17cd49b1326dd4ba9dc913"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-sqlparse \
-- 
2.33.0


