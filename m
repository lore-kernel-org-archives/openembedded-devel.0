Return-Path: <narpat.mali@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99410C4167B
	for <webhook@archiver.kernel.org>; Mon,  4 Dec 2023 15:51:02 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.72128.1701705052674723431
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Dec 2023 07:50:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=j21SPtFV;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=07023930c9=narpat.mali@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3B4Bn4IG005859;
	Mon, 4 Dec 2023 15:50:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=gg945
	x5eyw7bGZCQ1qhrzHjsFWS37AOa0lE835dFDNQ=; b=j21SPtFV1piw3RwyedjR8
	H9esECF/BNk8I/7FH579VOtFGtXjrY/4jlE+7a8rThaZ+SeEaCBY4EdUSkytKkiT
	3+DtmiNNj19vuNL6Sr6M76Zn8iWDpBjsNT/SGutZ7gQ5nAEtmvHmz6vE//hj4xdX
	3L/QHyj8EJAV5onQdYcuZZ+Jpp3AbHVcXC6zhDLzNei5kBjIbm2Cno7sTMsGV5rZ
	0CBtG4kKyDyevRrtuF1IgInOPfzKcYbE/tru/pwcUeFtARCXz6aqhVHT0XI1FgFk
	3PS6N1EiRHCvMJjHDVSJuSYQ2eppABafc45JrPYd1hjeAEO+BZzRcy8RFY5O/JtT
	g==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3us4d5gns8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 04 Dec 2023 15:50:50 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 4 Dec 2023 07:50:51 -0800
From: nmali <narpat.mali@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <akuster808@gmail.com>
Subject: [meta-oe][kirkstone][PATCH 1/1] apache2: upgrade 2.4.57 -> 2.4.58
Date: Mon, 4 Dec 2023 15:48:47 +0000
Message-ID: <20231204154847.1422638-1-narpat.mali@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: sE9nhA2vBXMknT3twKlaZo1cOoAvuTd7
X-Proofpoint-GUID: sE9nhA2vBXMknT3twKlaZo1cOoAvuTd7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0
 mlxlogscore=999 lowpriorityscore=0 spamscore=0 bulkscore=0 suspectscore=0
 mlxscore=0 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311060001 definitions=main-2312040118
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 04 Dec 2023 15:51:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107208

From: Narpat Mali <narpat.mali@windriver.com>

This upgrade incorporates the CVE-2023-31122, CVE-2023-43622 &
CVE-2023-45802 fixes and other bugfixes.

The "0011-modules-mappers-config9.m4-Add-server-directory-to-i.patch"
is no longer needed as it's included in this upgrade.

Changelog:
https://downloads.apache.org/httpd/CHANGES_2.4.58

References:
https://httpd.apache.org/security/vulnerabilities_24.html
https://security-tracker.debian.org/tracker/CVE-2023-31122
https://security-tracker.debian.org/tracker/CVE-2023-43622
https://security-tracker.debian.org/tracker/CVE-2023-45802

Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
---
 ...config9.m4-Add-server-directory-to-i.patch | 31 -------------------
 .../{apache2_2.4.57.bb => apache2_2.4.58.bb}  |  3 +-
 2 files changed, 1 insertion(+), 33 deletions(-)
 delete mode 100644 meta-webserver/recipes-httpd/apache2/apache2/0011-modules-mappers-config9.m4-Add-server-directory-to-i.patch
 rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.57.bb => apache2_2.4.58.bb} (98%)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2/0011-modules-mappers-config9.m4-Add-server-directory-to-i.patch b/meta-webserver/recipes-httpd/apache2/apache2/0011-modules-mappers-config9.m4-Add-server-directory-to-i.patch
deleted file mode 100644
index 996eabf586..0000000000
--- a/meta-webserver/recipes-httpd/apache2/apache2/0011-modules-mappers-config9.m4-Add-server-directory-to-i.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 5c9257fa34335ff83f7c01581cf953111072a457 Mon Sep 17 00:00:00 2001
-From: Valeria Petrov <valeria.petrov@spinetix.com>
-Date: Tue, 18 Apr 2023 15:38:53 +0200
-Subject: [PATCH] * modules/mappers/config9.m4: Add 'server' directory to
- include path if mod_rewrite is enabled.
-
-Upstream-Status: Accepted [https://svn.apache.org/viewvc?view=revision&revision=1909241]
-
----
- modules/mappers/config9.m4 | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/modules/mappers/config9.m4 b/modules/mappers/config9.m4
-index 55a97ab993..7120b729b7 100644
---- a/modules/mappers/config9.m4
-+++ b/modules/mappers/config9.m4
-@@ -14,6 +14,11 @@ APACHE_MODULE(userdir, mapping of requests to user-specific directories, , , mos
- APACHE_MODULE(alias, mapping of requests to different filesystem parts, , , yes)
- APACHE_MODULE(rewrite, rule based URL manipulation, , , most)
- 
-+if test "x$enable_rewrite" != "xno"; then
-+    # mod_rewrite needs test_char.h
-+    APR_ADDTO(INCLUDES, [-I\$(top_builddir)/server])
-+fi
-+
- APR_ADDTO(INCLUDES, [-I\$(top_srcdir)/$modpath_current])
- 
- APACHE_MODPATH_FINISH
--- 
-2.25.1
-
diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.57.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.58.bb
similarity index 98%
rename from meta-webserver/recipes-httpd/apache2/apache2_2.4.57.bb
rename to meta-webserver/recipes-httpd/apache2/apache2_2.4.58.bb
index 00f8aaa415..f7376fc58a 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.57.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.58.bb
@@ -16,7 +16,6 @@ SRC_URI = "${APACHE_MIRROR}/httpd/httpd-${PV}.tar.bz2 \
            file://0008-Fix-perl-install-directory-to-usr-bin.patch \
            file://0009-support-apxs.in-force-destdir-to-be-empty-string.patch \
            file://0001-make_exports.awk-not-expose-the-path.patch \
-           file://0011-modules-mappers-config9.m4-Add-server-directory-to-i.patch \
           "
 
 SRC_URI:append:class-target = " \
@@ -28,7 +27,7 @@ SRC_URI:append:class-target = " \
            "
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bddeddfac80b2c9a882241d008bb41c3"
-SRC_URI[sha256sum] = "dbccb84aee95e095edfbb81e5eb926ccd24e6ada55dcd83caecb262e5cf94d2a"
+SRC_URI[sha256sum] = "fa16d72a078210a54c47dd5bef2f8b9b8a01d94909a51453956b3ec6442ea4c5"
 
 S = "${WORKDIR}/httpd-${PV}"
 
-- 
2.40.0


