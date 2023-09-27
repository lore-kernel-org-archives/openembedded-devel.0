Return-Path: <narpat.mali@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EEC2E80AA2
	for <webhook@archiver.kernel.org>; Wed, 27 Sep 2023 07:42:37 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.12698.1695800555899109092
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Sep 2023 00:42:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=C3cLHtCT;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7634d97629=narpat.mali@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 38R60dM0032304;
	Wed, 27 Sep 2023 07:42:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=MWoKp
	bxZYoq2bgTtPl6fHQGutRTBwPauN7TFDoU0GiY=; b=C3cLHtCTSSR64d50n9tCQ
	p5lLjAyCb+jEaUuDijmTKVjwq+WFolyTAbaY21+FrwAhw0gp/Edv9fujhtTYEAzb
	izci/ohC9vY49nME7162lDbgnO2fVRfFhzyg+zb4PC8m3235bCtp4e3MMai3/rji
	JKLj2jXrUfzYFNVXSaLK3QPr08bp+1xZx97juprMBrrdXVOXHlmyUPm++hqNCH7f
	rpzWVBKQfb/Qp34dGvCmJa775Va4QG5WqeEl3PWExYMWpF/rYRMAk0WetPVGSTpa
	U+Mk7tkiWlAMiQP9ZUxQDhSI83DYFz2tm+BLRzlmsuKyi0TNHq2nS1IEXuN2l9In
	Q==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3t9n7x3pn0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 27 Sep 2023 07:42:34 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 27 Sep 2023 00:42:31 -0700
From: nmali <narpat.mali@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <akuster808@gmail.com>
Subject: [meta-python][kirkstone][PATCH 1/1] python3-django: upgrade 4.2.3 -> 4.2.5
Date: Wed, 27 Sep 2023 07:42:11 +0000
Message-ID: <20230927074211.1049355-1-narpat.mali@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: KX4paTznG8OnWj5jADuqV6WM9NXYphPO
X-Proofpoint-GUID: KX4paTznG8OnWj5jADuqV6WM9NXYphPO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-27_03,2023-09-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 mlxlogscore=999 impostorscore=0 spamscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2309180000 definitions=main-2309270061
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Sep 2023 07:42:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105173

From: Narpat Mali <narpat.mali@windriver.com>

The delta between 4.2.3 and 4.2.5 contains the CVE-2023-41164 fix
and other bugfixes. git log --oneline 4.2.3..4.2.5 shows:

b8b2f74512 (tag: 4.2.5) [4.2.x] Bumped version for 4.2.5 release.
9c51b4dcfa [4.2.x] Fixed CVE-2023-41164 -- Fixed potential DoS in django.utils.encoding.uri_to_iri().
acfb427522 [4.2.x] Fixed #34803 -- Fixed queryset crash when filtering againts deeply nested OuterRef annotations.
55a0b9c32e [4.2.x] Added stub release notes and release date for 4.2.5, 4.1.11, and 3.2.21.
8e8c318449 [4.2.x] Avoided counting exceptions in AsyncClient docs.
dcb9d7a0e4 [4.2.x] Improved formset docs by using a set instead of a list in the custom validation example.
f55b420277 [4.2.x] Fixed #34781 -- Updated logging ref docs for django.server's request extra context value.
46b2b08e45 [4.2.x] Fixed #34779 -- Avoided unnecessary selection of non-nullable m2m fields without natural keys during serialization.
d34db6602e [4.2.x] Fixed #34773 -- Fixed syncing DEFAULT_FILE_STORAGE/STATICFILES_STORAGE settings with STORAGES.
a22aeef555 [4.2.x] Fixed #15799 -- Doc'd that Storage._open() should raise FileNotFoundError when file doesn't exist.
936afc2deb [4.2.x] Refs #34754 -- Added missing FullResultSet import.
3a1863319c [4.2.x] Fixed #34754 -- Fixed JSONField check constraints validation on NULL values.
951dcbb2e6 [4.2.x] Fixed #34756 -- Fixed docs HTML build on Sphinx 7.1+.
a750fd0d7f [4.2.x] Added stub release notes for 4.2.5.
a56c46642d [4.2.x] Post-release version bump.
6f4c7c124a (tag: 4.2.4) [4.2.x] Bumped version for 4.2.4 release.
e53d6239df [4.2.x] Added release date for 4.2.4.
8808d9da6b [4.2.x] Fixed #34750 -- Fixed QuerySet.count() when grouping by unused multi-valued annotations.
2ef2b2ffc0 [4.2.x] Corrected pycon formatting in some docs.
8db9a0b5a0 [4.2.x] Fixed warnings per flake8 6.1.0.
739da73164 [4.2.x] Fixed #34748 -- Fixed queryset crash when grouping by a reference in a subquery.
a52a2b6678 [4.2.x] Fixed #34749 -- Corrected QuerySet.acreate() signature in docs.
12ebd9a1ac [4.2.x] Refs #34712 -- Doc'd that defining STORAGES overrides the default configuration.
1f9d00ef9f [4.2.x] Added missing backticks in docs.
c99d935600 [4.2.x] Fixed typo in docs/ref/models/querysets.txt.
da92a971a0 [4.2.x] Refs #30052 -- Clarified that defer() and only() do not work with aggregated fields.
7a67b065d7 [4.2.x] Fixed #34717 -- Fixed QuerySet.aggregate() crash when referencing window functions.
c646412a75 Added reference to TypedChoiceField in ChoiceField docs.
f474ba4cb5 [4.2.x] Fixed #34309 -- Doc'd how to fully delete an app.
e54f711d42 [4.2.x] Fixed #33405, Refs #7177 -- Clarified docs for filter escapejs regarding safe and unsafe usages.
047844270b [4.2.x] Added stub release notes for 4.2.4.

Release Notes: https://docs.djangoproject.com/en/dev/releases/4.2.5/

Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
---
 .../{python3-django_4.2.3.bb => python3-django_4.2.5.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-django_4.2.3.bb => python3-django_4.2.5.bb} (61%)

diff --git a/meta-python/recipes-devtools/python/python3-django_4.2.3.bb b/meta-python/recipes-devtools/python/python3-django_4.2.5.bb
similarity index 61%
rename from meta-python/recipes-devtools/python/python3-django_4.2.3.bb
rename to meta-python/recipes-devtools/python/python3-django_4.2.5.bb
index 1b6ae83fa..7b81d427c 100644
--- a/meta-python/recipes-devtools/python/python3-django_4.2.3.bb
+++ b/meta-python/recipes-devtools/python/python3-django_4.2.5.bb
@@ -1,7 +1,7 @@
 require python-django.inc
 inherit setuptools3
 
-SRC_URI[sha256sum] = "45a747e1c5b3d6df1b141b1481e193b033fd1fdbda3ff52677dc81afdaacbaed"
+SRC_URI[sha256sum] = "5e5c1c9548ffb7796b4a8a4782e9a2e5a3df3615259fc1bfd3ebc73b646146c1"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-sqlparse \
@@ -9,5 +9,5 @@ RDEPENDS:${PN} += "\
 
 # Set DEFAULT_PREFERENCE so that the LTS version of django is built by
 # default. To build the 4.x branch, 
-# PREFERRED_VERSION_python3-django = "4.2.3" can be added to local.conf
+# PREFERRED_VERSION_python3-django = "4.2.5" can be added to local.conf
 DEFAULT_PREFERENCE = "-1"
-- 
2.40.0


