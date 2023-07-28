Return-Path: <narpat.mali@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C5EEC0015E
	for <webhook@archiver.kernel.org>; Fri, 28 Jul 2023 14:48:57 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.33902.1690555735039996034
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Jul 2023 07:48:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=aQ6vsu4U;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=757328b575=narpat.mali@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 36SCmcjH003486;
	Fri, 28 Jul 2023 14:48:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=a8oPe
	eFp27rVp+5WW7wirK6jMY/SMNynDy7hF15ngsM=; b=aQ6vsu4UMkidB4bBlFaNM
	sc6KC6x0XS/TxH+eD4s4qVsRasVcOn3f8WPtPTnLn3ETcv1Wx6vUUArhN2yISCJq
	TfmCpnLMcIEWML8GDjjFw2y4dVxkYEXjN6WNGhqkHOkhnR8i8iNi22oEtAW+nWRS
	YUlUgKCaDpnGwo3uG5nmj5IhKdhOB3YklJ//rdjyB+ixaHfNDqwDBQVhPjqcHdlm
	zPU1Ba1M6tl9cHbwU0QZ2wMmsAtiM5YKSi/qBkwyTA0QB/xba3M+ag1p7wJcf32u
	reijMx0gEl+gk0y1iFcKeQ6XR2Uk3Tbnc2pNL3tlY+ugkKJ9eemx8aO2r7B8rTgj
	Q==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3s1a78vndw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 28 Jul 2023 14:48:53 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 28 Jul 2023 07:48:50 -0700
From: nmali <narpat.mali@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <akuster808@gmail.com>
CC: <hari.gpillai@windriver.com>
Subject: [meta-python][kirkstone][PATCH 1/1] python3-django: upgrade 4.2.1 -> 4.2.3
Date: Fri, 28 Jul 2023 14:48:34 +0000
Message-ID: <20230728144834.3831938-1-narpat.mali@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: rEQ-dwBJmIO4Q76BZP0-ZwrGcIOFo9Jt
X-Proofpoint-GUID: rEQ-dwBJmIO4Q76BZP0-ZwrGcIOFo9Jt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-27_10,2023-07-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 mlxlogscore=999 mlxscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 phishscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2306200000
 definitions=main-2307280136
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Jul 2023 14:48:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104072

From: Narpat Mali <narpat.mali@windriver.com>

The delta between 4.2.1 and 4.2.3 contains the CVE-2023-36053 fix
and other bugfixes. git log --oneline 4.2.1..4.2.3 shows:

1651351386 (tag: 4.2.3) [4.2.x] Bumped version for 4.2.3 release.
b7c5feb35a [4.2.x] Fixed CVE-2023-36053 -- Prevented potential ReDoS in EmailValidator and URLValidator.
1ea11365f6 [4.2.x] Fixed typo in docs/intro/tutorial08.txt.
7b45fe01ab [4.2.x] Added dedicated section for output_field in query expressions docs.
67fe092a85 [4.2.x] Fixed typo in docs/ref/models/querysets.txt.
9ab56e64de [4.2.x] Added stub release notes and release date for 4.2.3, 4.1.10, and 3.2.20.
a18e0f44d5 [4.2.x] Corrected admin.E013 check message in docs.
fabd0510a0 [4.2.x] Fixed typo in docs/topics/db/fixtures.txt.
4b433ef236 [4.2.x] Refs #30220 -- Bumped required version of Selenium to 3.8.0.
9e9a286bed [4.2.x] Fixed #34638 -- Fixed admin change list selected row highlight on editable boolean fields.
31d1fc36b3 [4.2.x] Fixed #34645 -- Restored alignment for admin date/time timezone warnings.
eb84c068ed [4.2.x] Fixed #30355 -- Doc'd interaction between custom managers and prefetch_related().
b2355a8df3 [4.2.x] Added stub release notes for 4.2.3.
10de214055 [4.2.x] Post-release version bump.
6218ed3454 (tag: 4.2.2) [4.2.x] Bumped version for 4.2.2 release.
e84d38ab36 [4.2.x] Added release date for 4.2.2.
87a4cd559b [4.2.x] Fixed #34620 -- Fixed serialization crash on m2m fields without natural keys when base querysets use select_related().
66d9fa4371 [4.2.x] Refs #23528 -- Made cosmetic edits to swappable_dependency() docs.
92ad551afd [4.2.x] Fixed #23528 -- Doc'd django.db.migrations.swappable_dependency().
738386470d [4.2.x] Fixed #34612 -- Fixed QuerySet.only() crash on reverse relationships.
dae052d823 [4.2.x] Fixed #34595 -- Doc'd that format_string arg of format_html() is not escaped.
dca5f5d58a [4.2.x] Fixed #34600 -- Removed references to bleach in docs.
25bd9faf32 [4.2.x] Fixed #34574 -- Noted unexpected outcomes in autoescape/escape docs.
91f8df5c2e [4.2.x] Fixed #34590 -- Reverted "Refs #33308 -- Improved adapting DecimalField values to decimal."
a44e974412 [4.2.x] Corrected documentation of Log database function.
bf5249fc8e [4.2.x] Refs #34118 -- Fixed FunctionalTests.test_cached_property_reuse_different_names() on Python 3.12+.
c78a4421de [4.2.x] Fixed #34551 -- Fixed QuerySet.aggregate() crash when referencing subqueries.
57f499e412 [4.2.x] Refs #34551 -- Fixed QuerySet.aggregate() crash on precending aggregation reference.
b4563cdd23 [4.2.x] Fixed #34579 -- Added Django Forum to contributing guides.
37ba4c3a94 [4.2.x] Fixed references to django.core.cache in docs.
6b76481fb9 [4.2.x] Fixed #34588 -- Removed usage of nonexistent stylesheet in the 'Congrats' page.
e1c00f8b36 [4.2.x] Fixed #34580 -- Avoided unnecessary computation of selected expressions in SQLCompiler.
cdd970ae22 [4.2.x] Fixed #34568 -- Made makemigrations --update respect --name option.
2b5c5e54de [4.2.x] Updated broken links in docs.
201d29b371 [4.2.x] Fixed #34570 -- Silenced noop deferral of many-to-many and GFK.
9c301814b0 [4.2.x] Fixed #34539 -- Restored get_prep_value() call when adapting JSONFields.
ddccecee91 [4.2.x] Fixed #34556 -- Doc'd that StreamingHttpResponse accepts memoryviews and strings iterators.
dbe263751c [4.2.x] Clarified database connections lifetime outside HTTP requests.
e50fe33e13 [4.2.x] Made explicit the location of locally-built HTML docs.
e0d8981139 [4.2.x] Fixed #34544 -- Avoided DBMS_LOB.SUBSTR() wrapping with IS NULL condition on Oracle.
dc3b8190ed [4.2.x] Fixed #34545 -- Corrected the number of months in installation FAQ.
bcf66f1355 [4.2.x] Corrected code-block directive in docs/ref/templates/builtins.txt.
4eaed191b6 [4.2.x] Corrected code-block directives in docs.
9ec1ff7879 [4.2.x] Fixed MultipleFileFieldTest.test_file_multiple_validation() test if Pillow isn't installed.
2756c69601 [4.2.x] Added CVE-2023-31047 to security archive.
110919987b [4.2.x] Added stub release notes for 4.2.2.
00152276e9 [4.2.x] Post-release version bump.

Release Notes: https://docs.djangoproject.com/en/dev/releases/4.2.3/

Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
---
 .../{python3-django_4.2.1.bb => python3-django_4.2.3.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-django_4.2.1.bb => python3-django_4.2.3.bb} (61%)

diff --git a/meta-python/recipes-devtools/python/python3-django_4.2.1.bb b/meta-python/recipes-devtools/python/python3-django_4.2.3.bb
similarity index 61%
rename from meta-python/recipes-devtools/python/python3-django_4.2.1.bb
rename to meta-python/recipes-devtools/python/python3-django_4.2.3.bb
index 4daca65eb5..1b6ae83fa9 100644
--- a/meta-python/recipes-devtools/python/python3-django_4.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-django_4.2.3.bb
@@ -1,7 +1,7 @@
 require python-django.inc
 inherit setuptools3
 
-SRC_URI[sha256sum] = "7efa6b1f781a6119a10ac94b4794ded90db8accbe7802281cd26f8664ffed59c"
+SRC_URI[sha256sum] = "45a747e1c5b3d6df1b141b1481e193b033fd1fdbda3ff52677dc81afdaacbaed"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-sqlparse \
@@ -9,5 +9,5 @@ RDEPENDS:${PN} += "\
 
 # Set DEFAULT_PREFERENCE so that the LTS version of django is built by
 # default. To build the 4.x branch, 
-# PREFERRED_VERSION_python3-django = "4.0.2" can be added to local.conf
+# PREFERRED_VERSION_python3-django = "4.2.3" can be added to local.conf
 DEFAULT_PREFERENCE = "-1"
-- 
2.40.0


