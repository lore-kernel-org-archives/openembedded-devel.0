Return-Path: <narpat.mali@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08AABC46CA0
	for <webhook@archiver.kernel.org>; Thu, 30 Nov 2023 12:24:13 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.70932.1701347045935600850
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Nov 2023 04:24:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=C1uulelA;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0698061647=narpat.mali@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3AU8qqe2005932;
	Thu, 30 Nov 2023 12:24:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PPS06212021; bh=cLh0JmuOQHakWHoO8Vv2BP2oKMh/i5xM7O0NAIb5KIU=; b=
	C1uulelANdYZh8lNe3776r8j5HRizxtNXFZggT5g3FmMvoaLjQyTIHw7MhIoqwK1
	1mSfp8dchgEVud5ZRNK5qwMr2WlYKRdYGvEO8g5MXzgpO/6xOL45HADTRLqpd6yM
	WFM7IaGFriHevt71wsvOrXZxlO2xXuIyFKdtE/MOhCQf8PIXxUC6UDGq0uQQNnGx
	OR+DtP3UcuhzSDmKnT+yJrGKZJddCYsMCz6+QiC03w2cqx2AH7cfNMWqraR9u0yy
	Ia2WFfVT7ivymL4NIC3amGjpdsUBwbhgK5KC3/UC70mCxw0E9AJ3StAPKfFTNlOi
	tcUl5R8/rw+jgc9cVH7ARA==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3uph0w8g88-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 30 Nov 2023 12:24:04 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 30 Nov 2023 04:24:09 -0800
From: nmali <narpat.mali@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <akuster808@gmail.com>
Subject: [meta-python][kirkstone][PATCH 2/3] python3-django: upgrade 3.2.21 -> 3.2.23
Date: Thu, 30 Nov 2023 12:23:38 +0000
Message-ID: <20231130122339.363700-2-narpat.mali@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20231130122339.363700-1-narpat.mali@windriver.com>
References: <20231130122339.363700-1-narpat.mali@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: N7ZISndSVWVdJ19gBhlTBwAdedC64h2o
X-Proofpoint-GUID: N7ZISndSVWVdJ19gBhlTBwAdedC64h2o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 spamscore=0 mlxlogscore=999 impostorscore=0 bulkscore=0
 phishscore=0 clxscore=1015 suspectscore=0 adultscore=0 lowpriorityscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311060001 definitions=main-2311300092
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Nov 2023 12:24:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107174

From: Narpat Mali <narpat.mali@windriver.com>

The delta between 3.2.21 and 3.2.23 contains the fixes for
CVE-2023-43665, CVE-2023-46695 and other bugfixes.

git log --oneline 3.2.21..3.2.23 shows:

60e648a7ae (tag: 3.2.23) [3.2.x] Bumped version for 3.2.23 release.
f9a7fb8466 [3.2.x] Fixed CVE-2023-46695 -- Fixed potential DoS in UsernameField on Windows.
e6d2591d9e [3.2.x] Added stub release notes for 3.2.23.
3c04b74293 [3.2.x] Added CVE-2023-43665 to security archive.
86a14d653f [3.2.x] Post release version bump.
3106e94e52 (tag: 3.2.22) [3.2.x] Bumped version for 3.2.22 release.
ccdade1a02 [3.2.x] Fixed CVE-2023-43665 -- Mitigated potential DoS in django.utils.text.Truncator when truncating HTML text.
6caf7b313d [3.2.x] Added stub release notes for 3.2.22.
9e814c3a5e [3.2.x] Added CVE-2023-41164 to security archive.
4b439dcd05 [3.2.x] Post-release version bump.

Release Notes: https://docs.djangoproject.com/en/dev/releases/3.2.23/

Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
---
 .../{python3-django_3.2.21.bb => python3-django_3.2.23.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-django_3.2.21.bb => python3-django_3.2.23.bb} (61%)

diff --git a/meta-python/recipes-devtools/python/python3-django_3.2.21.bb b/meta-python/recipes-devtools/python/python3-django_3.2.23.bb
similarity index 61%
rename from meta-python/recipes-devtools/python/python3-django_3.2.21.bb
rename to meta-python/recipes-devtools/python/python3-django_3.2.23.bb
index 1148669860..beecaa607c 100644
--- a/meta-python/recipes-devtools/python/python3-django_3.2.21.bb
+++ b/meta-python/recipes-devtools/python/python3-django_3.2.23.bb
@@ -1,7 +1,7 @@
 require python-django.inc
 inherit setuptools3
 
-SRC_URI[sha256sum] = "a5de4c484e7b7418e6d3e52a5b8794f0e6b9f9e4ce3c037018cf1c489fa87f3c"
+SRC_URI[sha256sum] = "82968f3640e29ef4a773af2c28448f5f7a08d001c6ac05b32d02aeee6509508b"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-sqlparse \
@@ -9,5 +9,5 @@ RDEPENDS:${PN} += "\
 
 # Set DEFAULT_PREFERENCE so that the LTS version of django is built by
 # default. To build the 3.x branch, 
-# PREFERRED_VERSION_python3-django = "3.2.21" can be added to local.conf
+# PREFERRED_VERSION_python3-django = "3.2.23" can be added to local.conf
 DEFAULT_PREFERENCE = "-1"
-- 
2.40.0


