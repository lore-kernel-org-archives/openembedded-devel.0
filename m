Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 605F2CA0FED
	for <webhook@archiver.kernel.org>; Fri,  1 Sep 2023 17:18:56 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.1222.1693588732707792238
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 01 Sep 2023 10:18:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=SNkSHX40;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=760814c0ff=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 381ABOZ0011550
	for <openembedded-devel@lists.openembedded.org>; Fri, 1 Sep 2023 17:18:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=NW7W+
	kTgL58H0y6C4G4zxV5qb5Ipm6DIYLexgjUC9Ts=; b=SNkSHX40FfEGaiC2DAK6/
	jEWHvqmTaQkD08rTI8/fwE/vsy2GHKC5OGfJsgTW6p0oo5rkzemzw8PXM0SDwBS5
	7jnR1ChaehRKh0tA2ZM8fVC5C2eyJ3gHV83CeoZVrYA/89NFxAUasMsVge7764B/
	jXKk6QRcaTwz4E0hwF2lbPO2pyp4l0ZKbMgSsC+jKFaDJGc8Fcv9jv90wm+D9Spk
	auM+ZbflgHju3G7ZRXR0viedsxe2cvlugFkVD2Wf/10d6GipkTm85nObeNAXkoRu
	mmq0jdTuMriloLx4aOATHmKy3obhYFZ+1s2EPpvJAjnCpQazNXCFga9GxAZU8qzk
	w==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sq6kwp49f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 01 Sep 2023 17:18:51 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 1 Sep 2023 10:18:47 -0700
From: ssambu <soumya.sambu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][PATCH 1/1] krb5: Upgrade 1.20.1 -> 1.20.2
Date: Fri, 1 Sep 2023 17:18:32 +0000
Message-ID: <20230901171832.276070-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: GGd6_HFbj-Ua5RWcWt5hXLYrKy9dPPtQ
X-Proofpoint-ORIG-GUID: GGd6_HFbj-Ua5RWcWt5hXLYrKy9dPPtQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-01_14,2023-08-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 mlxlogscore=999 priorityscore=1501 phishscore=0
 adultscore=0 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2309010162
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 01 Sep 2023 17:18:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104694

From: Soumya Sambu <soumya.sambu@windriver.com>

Release Notes:
https://web.mit.edu/kerberos/krb5-1.20/krb5-1.20.2.html
- Fix potential uninitialized pointer free in kadm5 XDR parsing [CVE-2023-36054].
- Fix read overruns in SPNEGO parsing.
- Compatibility fix for autoconf 2.72.

License-Update: Update copyright years to 2023
[https://github.com/krb5/krb5/commit/a273d4d1987dba088e51001d4119759b32b89190]

Removed patch - 0001-Fix-aclocal.m4-syntax-error-for-autoconf-2.72.patch as it is fixed in upgraded version.

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 ...al.m4-syntax-error-for-autoconf-2.72.patch | 40 -------------------
 .../krb5/{krb5_1.20.1.bb => krb5_1.20.2.bb}   |  7 ++--
 2 files changed, 3 insertions(+), 44 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/krb5/krb5/0001-Fix-aclocal.m4-syntax-error-for-autoconf-2.72.patch
 rename meta-oe/recipes-connectivity/krb5/{krb5_1.20.1.bb => krb5_1.20.2.bb} (96%)

diff --git a/meta-oe/recipes-connectivity/krb5/krb5/0001-Fix-aclocal.m4-syntax-error-for-autoconf-2.72.patch b/meta-oe/recipes-connectivity/krb5/krb5/0001-Fix-aclocal.m4-syntax-error-for-autoconf-2.72.patch
deleted file mode 100644
index 9d0b066b1..000000000
--- a/meta-oe/recipes-connectivity/krb5/krb5/0001-Fix-aclocal.m4-syntax-error-for-autoconf-2.72.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 0aa127afa52fd265a4f1bbded1623201390ae96a Mon Sep 17 00:00:00 2001
-From: Julien Rische <jrische@redhat.com>
-Date: Thu, 17 Nov 2022 15:01:24 +0100
-Subject: [PATCH] Fix aclocal.m4 syntax error for autoconf 2.72
-
-An incorrect closure inside KRB5_AC_INET6 is innocuous with autoconf
-versions up to 2.71, but will cause an error at configure time with
-the forthcoming autoconf 2.72.
-
-[ghudson@mit.edu: added more context to commit message]
-
-ticket: 9077 (new)
-tags: pullup
-target_version: 1.20-next
-target_version: 1.19-next
-
-Upstream-Status: Backport [https://github.com/krb5/krb5/commit/d864d740d019fdf2c640460f2aa2760c7fa4d5e9]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/aclocal.m4 | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/aclocal.m4 b/src/aclocal.m4
-index 9920476..3d66a87 100644
---- a/src/aclocal.m4
-+++ b/src/aclocal.m4
-@@ -409,8 +409,8 @@ else
-       [[struct sockaddr_in6 in;
-         AF_INET6;
-         IN6_IS_ADDR_LINKLOCAL(&in.sin6_addr);]])],
--    [krb5_cv_inet6=yes], [krb5_cv_inet6=no])])
--fi
-+    [krb5_cv_inet6=yes], [krb5_cv_inet6=no])
-+fi])
- AC_MSG_RESULT($krb5_cv_inet6)
- if test "$krb5_cv_inet6" = no && test "$ac_cv_func_inet_ntop" = yes; then
- AC_MSG_CHECKING(for IPv6 compile-time support with -DINET6)
--- 
-2.40.0
-
diff --git a/meta-oe/recipes-connectivity/krb5/krb5_1.20.1.bb b/meta-oe/recipes-connectivity/krb5/krb5_1.20.2.bb
similarity index 96%
rename from meta-oe/recipes-connectivity/krb5/krb5_1.20.1.bb
rename to meta-oe/recipes-connectivity/krb5/krb5_1.20.2.bb
index 10fff11c2..54e6b778b 100644
--- a/meta-oe/recipes-connectivity/krb5/krb5_1.20.1.bb
+++ b/meta-oe/recipes-connectivity/krb5/krb5_1.20.2.bb
@@ -14,7 +14,7 @@ DESCRIPTION = "Kerberos is a system for authenticating users and services on a n
 HOMEPAGE = "http://web.mit.edu/Kerberos/"
 SECTION = "console/network"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${S}/../NOTICE;md5=1d31018dba5a0ef195eb426a1e61f02e"
+LIC_FILES_CHKSUM = "file://${S}/../NOTICE;md5=3c7414a99de5452b8f809ae2753b0855"
 
 inherit autotools-brokensep binconfig perlnative systemd update-rc.d pkgconfig
 
@@ -22,7 +22,6 @@ SHRT_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 SRC_URI = "http://web.mit.edu/kerberos/dist/${BPN}/${SHRT_VER}/${BP}.tar.gz \
            file://debian-suppress-usr-lib-in-krb5-config.patch;striplevel=2 \
            file://crosscompile_nm.patch \
-           file://0001-Fix-aclocal.m4-syntax-error-for-autoconf-2.72.patch;striplevel=2 \
            file://etc/init.d/krb5-kdc \
            file://etc/init.d/krb5-admin-server \
            file://etc/default/krb5-kdc \
@@ -30,8 +29,8 @@ SRC_URI = "http://web.mit.edu/kerberos/dist/${BPN}/${SHRT_VER}/${BP}.tar.gz \
            file://krb5-kdc.service \
            file://krb5-admin-server.service \
 "
-SRC_URI[md5sum] = "73f5780e7b587ccd8b8cfc10c965a686"
-SRC_URI[sha256sum] = "704aed49b19eb5a7178b34b2873620ec299db08752d6a8574f95d41879ab8851"
+SRC_URI[md5sum] = "7ac456e97c4959ebe5c836dc2f5aab2c"
+SRC_URI[sha256sum] = "7d8d687d42aed350c2525cb69a4fc3aa791694da6761dccc1c42c2ee7796b5dd"
 
 CVE_PRODUCT = "kerberos"
 CVE_VERSION = "5-${PV}"
-- 
2.40.0


