Return-Path: <narpat.mali@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41C69E7E641
	for <webhook@archiver.kernel.org>; Tue, 26 Sep 2023 14:30:44 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.20659.1695738640303677828
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Sep 2023 07:30:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=DmebNfQ5;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7633797b0d=narpat.mali@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 38QD1IEl013026;
	Tue, 26 Sep 2023 07:30:36 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=+COwy
	YnwREljWXuhk//jStOAnw5k2jXkcS/tFA90Hgc=; b=DmebNfQ5ALHsFmeNkJqCl
	GrFXVsUcm3j5hBKu2AphvRO1kU92FB+CbHr2P5WSKP94ERroo6uPVQpb/Js59/3z
	VEjpBsw642l0EEs0XnkcV0wl5C3l3iNgSymtRW39AW7BmX89DibQn/x56alAUeam
	SbMRk8eR3VY2BN925DvFUQC3wE6tuGjc2GRkMnEhVmLT4DWENE5BveYqOCkYuZ6c
	Yfh2fL3YIc9AOMkv2xH4cJwwkUJxgel1M/s/nXv5nEqOmSVGfJecjsf9t+Aqy+vF
	WS6Fmw+Kl7Kd0RuekYbiS8lgAatJUpTKwrdpN61+2CyYe1MPJejD3rzWu37run45
	g==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3t9yhgjhka-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 26 Sep 2023 07:30:35 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 26 Sep 2023 07:30:32 -0700
From: nmali <narpat.mali@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <akuster808@gmail.com>
Subject: [meta-python][kirkstone][PATCH 1/1] python3-django: upgrade 3.2.20 -> 3.2.21
Date: Tue, 26 Sep 2023 14:29:43 +0000
Message-ID: <20230926142943.2924070-1-narpat.mali@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: HqGnzCrgHByjZLXT-ix3EnKm3HSEKm5R
X-Proofpoint-ORIG-GUID: HqGnzCrgHByjZLXT-ix3EnKm3HSEKm5R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-26_10,2023-09-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 impostorscore=0
 mlxlogscore=999 phishscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 spamscore=0 mlxscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2309180000
 definitions=main-2309260126
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Sep 2023 14:30:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105144

From: Narpat Mali <narpat.mali@windriver.com>

The delta between 3.2.20 and 3.2.21 contains the CVE-2023-41164 fix
and other bugfixes. git log --oneline 3.2.20..3.2.21 shows:

fd0ccd7fb3 (tag: 3.2.21) [3.2.x] Bumped version for 3.2.21 release.
6f030b1149 [3.2.x] Fixed CVE-2023-41164 -- Fixed potential DoS in django.utils.encoding.uri_to_iri().
73350a6369 [3.2.x] Added stub release notes for 3.2.21.
75418f8c0e [3.2.x] Fixed #34756 -- Fixed docs HTML build on Sphinx 7.1+.
848fe70f3e [3.2.x] Added CVE-2023-36053 to security archive.
4012a87a58 [3.2.x] Post-release version bump.

Release Notes: https://docs.djangoproject.com/en/dev/releases/3.2.21/

Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
---
 .../{python3-django_3.2.20.bb => python3-django_3.2.21.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-django_3.2.20.bb => python3-django_3.2.21.bb} (61%)

diff --git a/meta-python/recipes-devtools/python/python3-django_3.2.20.bb b/meta-python/recipes-devtools/python/python3-django_3.2.21.bb
similarity index 61%
rename from meta-python/recipes-devtools/python/python3-django_3.2.20.bb
rename to meta-python/recipes-devtools/python/python3-django_3.2.21.bb
index b5224b41c..114866986 100644
--- a/meta-python/recipes-devtools/python/python3-django_3.2.20.bb
+++ b/meta-python/recipes-devtools/python/python3-django_3.2.21.bb
@@ -1,7 +1,7 @@
 require python-django.inc
 inherit setuptools3
 
-SRC_URI[sha256sum] = "dec2a116787b8e14962014bf78e120bba454135108e1af9e9b91ade7b2964c40"
+SRC_URI[sha256sum] = "a5de4c484e7b7418e6d3e52a5b8794f0e6b9f9e4ce3c037018cf1c489fa87f3c"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-sqlparse \
@@ -9,5 +9,5 @@ RDEPENDS:${PN} += "\
 
 # Set DEFAULT_PREFERENCE so that the LTS version of django is built by
 # default. To build the 3.x branch, 
-# PREFERRED_VERSION_python3-django = "3.2.20" can be added to local.conf
+# PREFERRED_VERSION_python3-django = "3.2.21" can be added to local.conf
 DEFAULT_PREFERENCE = "-1"
-- 
2.40.0


