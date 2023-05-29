Return-Path: <narpat.mali@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B423CC77B7A
	for <webhook@archiver.kernel.org>; Mon, 29 May 2023 14:44:44 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.51077.1685371478986752052
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 May 2023 07:44:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=LufIAGFQ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=55133302bd=narpat.mali@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34TCCXH6023090
	for <openembedded-devel@lists.openembedded.org>; Mon, 29 May 2023 07:44:38 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=Wo+TasfzNsQ4Z8SQbSzPUC91Lc3+/9IdV5HXhBHo9zg=;
 b=LufIAGFQJI7uXaquWFlhdlNjko4eLjTyuGHQCnn0pFU/6PvgVB/Nk9vZz29vhHcEEh4B
 3X+m7CWbJs3D39E1Y5CjsSNLd73wUwYXpeXkdC0K4J59Ki0jCfsAb8W2hPi6+EUCdwTw
 TfDBemlN749HGqLsbNevq8GLagt95OJp3lFITbhWsYhi5PuXveQyPFZl3Z3almk6iBp/
 LAHknYblDNz/i7VZTqzTHQdyKLK8uGBzVXmZ9Cpbu9cS5zmx8oA1Zb5twX+/Wdq2fnT3
 l4kvnvu/+uhcifu1ftV0VK4g99nwdmF4LXhAFMUz53dTI6RRJ9BksNoVmAp3cfADDYYS 6A== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3qud539mj8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 29 May 2023 07:44:38 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 29 May 2023 07:44:36 -0700
From: nmali <narpat.mali@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <hari.gpillai@windriver.com>
Subject: [meta-python][kirkstone][PATCH 1/1] python3-django: upgrade 3.2.12 -> 3.2.19
Date: Mon, 29 May 2023 14:44:14 +0000
Message-ID: <20230529144414.597336-1-narpat.mali@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: BLg536OPTS2CGcz0JjJgTX-AN9_giXSy
X-Proofpoint-ORIG-GUID: BLg536OPTS2CGcz0JjJgTX-AN9_giXSy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-29_10,2023-05-25_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 spamscore=0
 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 mlxscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305290124
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 May 2023 14:44:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102893

From: Narpat Mali <narpat.mali@windriver.com>

The delta between 3.2.12 and 3.2.19 contain numerous CVEs and other
bugfixes. git log --oneline 3.2.12..3.2.19 shows:

fc42edd2e6 (tag: 3.2.19) [3.2.x] Bumped version for 3.2.19 release.
eed53d0011 [3.2.x] Fixed CVE-2023-31047, Fixed #31710 -- Prevented potential bypass of validation when uploading multiple files using one form field.
007e46d815 [3.2.x] Added missing backticks in docs/releases/1.7.txt.
a37e4d5d6e [3.2.x] Added stub release notes for 3.2.19.
963f24cff2 [3.2.x] Added CVE-2023-24580 to security archive.
e34a2283f2 [3.2.x] Post-release version bump.
722e9f8a38 (tag: 3.2.18) [3.2.x] Bumped version for 3.2.18 release.
a665ed5179 [3.2.x] Fixed CVE-2023-24580 -- Prevented DoS with too many uploaded files.
932b5bd52d [3.2.x] Added stub release notes for 3.2.18.
c35a5788f4 [3.2.x] Added CVE-2023-23969 to security archive.
9bd8db3940 [3.2.x] Post-release version bump.
aed1bb56d1 (tag: 3.2.17) [3.2.x] Bumped version for 3.2.17 release.
c7e0151fdf [3.2.x] Fixed CVE-2023-23969 -- Prevented DoS with pathological values for Accept-Language.
9da46345d8 [3.2.x] Fixed inspectdb.tests.InspectDBTestCase.test_custom_fields() on SQLite 3.37+.
4c2b26174f [3.2.x] Removed 'tests' path prefix in a couple tests.
d21543182d [3.2.x] Adjusted release notes for 3.2.17.
4e31d3ea55 [3.2.x] Added stub release notes for 3.2.17.
238e8898ac [3.2.x] Corrected passenv value for tox 4.0.6+.
b381ab4906 [3.2.x] Disabled auto-created table of contents entries on Sphinx 5.2+.
f6f0699d01 [3.2.x] Removed obsolete doc reference to asyncio.iscoroutinefunction.
accdd0576d [3.2.x] Added CVE-2022-36359 to security archive.
7190b38b8d [3.2.x] Post-release version bump.
4c85beca9d (tag: 3.2.16) [3.2.x] Bumped version for 3.2.16 release.
5b6b257fa7 [3.2.x] Fixed CVE-2022-41323 -- Prevented locales being interpreted as regular expressions.
33affaf0b6 [3.2.x] Added stub notes 3.2.16 release.
777362d74a [3.2.x] Added CVE-2022-36359 to security archive.
eb5bdb461e [3.2.x] Post-release version bump.
653a7bd7b7 (tag: 3.2.15) [3.2.x] Bumped version for 3.2.15 release.
b3e4494d75 [3.2.x] Fixed CVE-2022-36359 -- Escaped filename in Content-Disposition header.
cb7fbac9f8 [3.2.x] Fixed collation tests on MySQL 8.0.30+.
840d009c06 [3.2.x] Fixed inspectdb and schema tests on MariaDB 10.6+.
a5eba20f40 Adjusted release notes for 3.2.15.
ad104fb50f [3.2.x] Added stub release notes for 3.2.15 release.
22916c8c1f [3.2.x] Fixed RelatedGeoModelTest.test08_defer_only() on MySQL 8+ with MyISAM storage engine.
e1cfbe58b7 [3.2.x] Added CVE-2022-34265 to security archive.
605cf0d3f6 [3.2.x] Post-release version bump.
746e88cc63 (tag: 3.2.14) [3.2.x] Bumped version for 3.2.14 release.
a9010fe555 [3.2.x] Fixed CVE-2022-34265 -- Protected Trunc(kind)/Extract(lookup_name) against SQL injection.
3acf156be3 [3.2.x] Fixed GEOSTest.test_emptyCollections() on GEOS 3.8.0.
4a5d98ee0a [3.2.x] Bumped minimum Sphinx version to 4.5.0.
1a9098166e [3.2.x] Fixed docs build with sphinxcontrib-spelling 7.5.0+.
37f4de2deb [3.2.x] Added stub release notes for 3.2.14.
7595f763a9 [3.2.x] Fixed test_request_lifecycle_signals_dispatched_with_thread_sensitive with asgiref 3.5.1+.
2dc85ecf3e [3.2.x] Fixed CoveringIndexTests.test_covering_partial_index() when DEFAULT_INDEX_TABLESPACE is set.
a23c25d84a [3.2.x] Fixed #33753 -- Fixed docs build on Sphinx 5+.
e01b383e02 [3.2.x] Added CVE-2022-28346 and CVE-2022-28347 to security archive.
ac2fb5ccb6 [3.2.x] Post-release version bump.
08e6073f87 (tag: 3.2.13) [3.2.x] Bumped version for 3.2.13 release.
9e19accb6e [3.2.x] Fixed CVE-2022-28347 -- Protected QuerySet.explain(**options) against SQL injection on PostgreSQL.
2044dac5c6 [3.2.x] Fixed CVE-2022-28346 -- Protected QuerySet.annotate(), aggregate(), and extra() against SQL injection in column aliases.
bdb92dba0b [3.2.x] Fixed #33628 -- Ignored directories with empty names in autoreloader check for template changes.
70035fb044 [3.2.x] Added stub release notes for 3.2.13 and 2.2.28.
7e7ea71a8d [3.2.x] Reverted "Fixed forms_tests.tests.test_renderers with Jinja 3.1.0+."
610ecc9053 [3.2.x] Fixed forms_tests.tests.test_renderers with Jinja 3.1.0+.
754af45773 [3.2.x] Fixed typo in release notes.
6f309165e5 [3.2.x] Added CVE-2022-22818 and CVE-2022-23833 to security archive.
1e6b555c92 [3.2.x] Post-release version bump.

Release Notes: https://docs.djangoproject.com/en/3.2/releases/

Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
---
 .../{python3-django_3.2.12.bb => python3-django_3.2.19.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-django_3.2.12.bb => python3-django_3.2.19.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-django_3.2.12.bb b/meta-python/recipes-devtools/python/python3-django_3.2.19.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-django_3.2.12.bb
rename to meta-python/recipes-devtools/python/python3-django_3.2.19.bb
index adbc498bdf..0c2fc10e63 100644
--- a/meta-python/recipes-devtools/python/python3-django_3.2.12.bb
+++ b/meta-python/recipes-devtools/python/python3-django_3.2.19.bb
@@ -1,7 +1,7 @@
 require python-django.inc
 inherit setuptools3
 
-SRC_URI[sha256sum] = "9772e6935703e59e993960832d66a614cf0233a1c5123bc6224ecc6ad69e41e2"
+SRC_URI[sha256sum] = "031365bae96814da19c10706218c44dff3b654cc4de20a98bd2d29b9bde469f0"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-sqlparse \
-- 
2.40.0


