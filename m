Return-Path: <narpat.mali@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07879C07CA9
	for <webhook@archiver.kernel.org>; Thu, 30 Nov 2023 12:24:13 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.70911.1701347047860534281
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Nov 2023 04:24:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=rmBq5ByU;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0698061647=narpat.mali@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3AUCINgJ005460;
	Thu, 30 Nov 2023 12:24:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PPS06212021; bh=j3MjJjLYlhGj0hN5HcrR6joStUJznAP4aYGcyJjklkI=; b=
	rmBq5ByUBrFIjjBTrcIn9wvVcuANAU96LOFDHVyd21so0ESL9zc8qVWTVQIXu2HZ
	VoRQ1VMfxHYEqZMRd5tEF1RkWlHq826unCTuWTzFm2XVMe/+/Uu3JnXThuvY9iw8
	ghcr8WINDPJzI89zB4RQdjcifu7rGA7fC4u9JvIssTsjfeRaWdzRKs392hIsrHKH
	XE43kijk+UcFWsmJghCq388D0jduxIbrOtv8PB5Ky7oqPaY6ELvz0gjGLB1pRSxi
	fnCgS6nzmOXCY+t6xGY68WA/331V5K9o2cJN1DPwosHeorACx6bI+jxX+MBYbnMr
	QXO6vIkiPRHYit29oVfGEA==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3uph108g07-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 30 Nov 2023 12:24:06 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 30 Nov 2023 04:24:11 -0800
From: nmali <narpat.mali@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <akuster808@gmail.com>
Subject: [meta-python][kirkstone][PATCH 3/3] python3-django: upgrade 4.2.5 -> 4.2.7
Date: Thu, 30 Nov 2023 12:23:39 +0000
Message-ID: <20231130122339.363700-3-narpat.mali@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20231130122339.363700-1-narpat.mali@windriver.com>
References: <20231130122339.363700-1-narpat.mali@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: 1gSZVVL1xhp-L-QjgYfNI5rRNfvqUFpy
X-Proofpoint-GUID: 1gSZVVL1xhp-L-QjgYfNI5rRNfvqUFpy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxscore=0
 mlxlogscore=999 malwarescore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311060001 definitions=main-2311300092
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Nov 2023 12:24:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107175

From: Narpat Mali <narpat.mali@windriver.com>

The delta between 4.2.5 and 4.2.7 contains the fixes for
CVE-2023-43665, CVE-2023-46695 and other bugfixes.

git log --oneline 4.2.5..4.2.7 shows:

d254a54e7f (tag: 4.2.7) [4.2.x] Bumped version for 4.2.7 release.
048a9ebb6e [4.2.x] Fixed CVE-2023-46695 -- Fixed potential DoS in UsernameField on Windows.
3fae5d92da [4.2.x] Refs #30601 -- Fixed typos in docs/topics/db/transactions.txt.
a8aa94062b [4.2.x] Refs #15578 -- Made cosmetic edits to fixtures docs.
109f39a38b [4.2.x] Fixed #34932 -- Restored varchar_pattern_ops/text_pattern_ops index creation when deterministic collaction is set.
61612990d8 [4.2.x] Fixed typos in docs/ref/models/expressions.txt.
696fbc32d6 [4.2.x] Fixed #30601 -- Doc'd the need to manually revert all app state on transaction rollbacks.
ffba63180c [4.2.x] Fixed typo in docs/ref/contrib/gis/geos.txt.
43a3646070 [4.2.x] Fixed #15578 -- Stated the processing order of fixtures in the fixtures docs.
0cd8b867a0 [4.2.x] Added stub release notes and release date for 4.2.7, 4.1.13, and 3.2.23.
510a512119 [4.2.x] Fixed typo in docs/releases/4.2.txt.
b644f8bc1f [4.2.x] Corrected note about using accents in writing documentation contributing guide.
a576ef98ae [4.2.x] Refs #34900, Refs #34118 -- Updated assertion in test_skip_class_unless_db_feature() test on Python 3.12.1+.
803caec60b [4.2.x] Fixed #34798 -- Fixed QuerySet.aggregate() crash when referencing expressions containing subqueries.
caec4f4a6f [4.2.x] Refs #34840 -- Improved release note describing index regression.
b6bb2f8099 [4.2.x] Refs #34840 -- Fixed test_validate_nullable_textfield_with_isnull_true() on databases that don's support table check constraints.
e8fe48d3a0 [4.2.x] Fixed #34808 -- Doc'd aggregate function's default argument.
830990fa6c [4.2.x] Reorganized tutorial's part 4 to better understand changes needed in URLConf.
0cbc92bc3a [4.2.x] Refs #26029 -- Improved get_storage_class() deprecation warning with stacklevel=2.
9c7627da30 [4.2.x] Refs #34043 -- Clarified how to test UI changes.
0bd53ab86a [4.2.x] Added backticks to setuptools in docs.
99dcba90b4 [4.2.x] Refs #32275 -- Added scrypt password hasher to PASSWORD_HASHERS setting docs.
6697880219 [4.2.x] Refs #31435 -- Doc'd potential infinite recursion when accessing model fields in __init__.
a9a3317a95 [4.2.x] Corrected wrap_socket() reference in docs/ref/settings.txt.
9962f94a97 [4.2.x] Added CVE-2023-43665 to security archive.
b2d95bb301 [4.2.x] Added stub release notes for 4.2.7.
08d54f83a9 [4.2.x] Post release version bump.
c22017bd1d (tag: 4.2.6) [4.2.x] Bumped version for 4.2.6 release.
be9c27c4d1 [4.2.x] Fixed CVE-2023-43665 -- Mitigated potential DoS in django.utils.text.Truncator when truncating HTML text.
39fc3f46a8 [4.2.x] Added stub release notes and release date for 4.2.6, 4.1.12, and 3.2.22.
dd0bf63d3e [4.2.x] Added warning about flatpages and untrusted users.
fec4ed0a25 [4.2.x] Refs #34320 -- Skipped SchemaTests.test_rename_field_with_check_to_truncated_name on MariaBD 10.5.2+.
a148461f1f [4.2.x] Fixed #34840 -- Avoided casting string base fields on PostgreSQL.
b08f53ff46 [4.2.x] Refs #34808 -- Doc'd that aggregation functions on empty groups can return None.
c70f08c4aa [4.2.x] Added updating the Django release process on Trac to release steps.
d485aa2732 [4.2.x] Fixed typo in docs/howto/custom-file-storage.txt.
ff26e6ad84 [4.2.x] Corrected QuerySet.prefetch_related() note about GenericRelation().
866122690d [4.2.x] Doc'd  HttpResponse.cookies.
97e8a2afb1 [4.2.x] Fixed #34821 -- Prevented DEFAULT_FILE_STORAGE/STATICFILES_STORAGE settings from mutating the main STORAGES.
39cb3b08bc [4.2.x] Bumped checkout version in Github actions configuration.
592ebd8920 [4.2.x] Added stub release notes for 4.2.6.
a1dd785139 [4.2.x] Added CVE-2023-41164 to security archive.
a9686cb871 [4.2.x] Post-release version bump.

Release Notes: https://docs.djangoproject.com/en/dev/releases/4.2.7/

Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
---
 .../{python3-django_4.2.5.bb => python3-django_4.2.7.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-django_4.2.5.bb => python3-django_4.2.7.bb} (61%)

diff --git a/meta-python/recipes-devtools/python/python3-django_4.2.5.bb b/meta-python/recipes-devtools/python/python3-django_4.2.7.bb
similarity index 61%
rename from meta-python/recipes-devtools/python/python3-django_4.2.5.bb
rename to meta-python/recipes-devtools/python/python3-django_4.2.7.bb
index 7b81d427c4..580592d702 100644
--- a/meta-python/recipes-devtools/python/python3-django_4.2.5.bb
+++ b/meta-python/recipes-devtools/python/python3-django_4.2.7.bb
@@ -1,7 +1,7 @@
 require python-django.inc
 inherit setuptools3
 
-SRC_URI[sha256sum] = "5e5c1c9548ffb7796b4a8a4782e9a2e5a3df3615259fc1bfd3ebc73b646146c1"
+SRC_URI[sha256sum] = "8e0f1c2c2786b5c0e39fe1afce24c926040fad47c8ea8ad30aaf1188df29fc41"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-sqlparse \
@@ -9,5 +9,5 @@ RDEPENDS:${PN} += "\
 
 # Set DEFAULT_PREFERENCE so that the LTS version of django is built by
 # default. To build the 4.x branch, 
-# PREFERRED_VERSION_python3-django = "4.2.5" can be added to local.conf
+# PREFERRED_VERSION_python3-django = "4.2.7" can be added to local.conf
 DEFAULT_PREFERENCE = "-1"
-- 
2.40.0


