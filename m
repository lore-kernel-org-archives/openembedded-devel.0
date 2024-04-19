Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B576AC04FFE
	for <webhook@archiver.kernel.org>; Fri, 19 Apr 2024 13:22:52 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.21005.1713532971432241295
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Apr 2024 06:22:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=o4XJK8BR;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=483981f7a8=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43JCqXOI005658
	for <openembedded-devel@lists.openembedded.org>; Fri, 19 Apr 2024 13:22:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=jJWxX
	Am9N6HUbh/wlpzYXVTWidY4zrHA6n79axFj6ng=; b=o4XJK8BRaSc2Fo4HusDGj
	3eY9Ag94w+amHkglVwA5QRWvTwdb5gfQ5VlXpgyaSlSImziWakZunR2uWAAIjDcX
	1q3aAtZ1Gn/5znWYe3MMnV+0/NtX3R2rEU6UGvzKaxV0PAAH/dt8PCxAhL+rzag8
	0mMdfU6mKb0ZR8v+KmkEJFd05CswuRN9ZvF/T+bJ356VhVVhIwuuKfRp5VS4Faaz
	+ujaPvyXeBSYUsL4oTEONVHaRn1R8CsAeaPqrX+wHg4mHxqWaOCZvRmvya1kZm78
	kasKr1DJg3LTelUxqMy13eKB4R7q1A61x/+oNvw//D35buEhlY/K0BgjTMo7X2d9
	g==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3xfh16p2j1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 19 Apr 2024 13:22:50 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Fri, 19 Apr 2024 06:22:48 -0700
From: ssambu <soumya.sambu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][PATCH 1/1] apache2: Upgrade v2.4.58 -> v2.4.59
Date: Fri, 19 Apr 2024 13:22:31 +0000
Message-ID: <20240419132231.2631375-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: NR6b69PAEV1ZjT5Ch6p8jzetlhxqT1go
X-Proofpoint-GUID: NR6b69PAEV1ZjT5Ch6p8jzetlhxqT1go
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-19_09,2024-04-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 suspectscore=0 impostorscore=0 bulkscore=0 mlxscore=0 lowpriorityscore=0
 clxscore=1011 phishscore=0 priorityscore=1501 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2404010003
 definitions=main-2404190100
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 19 Apr 2024 13:22:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110058

From: Soumya Sambu <soumya.sambu@windriver.com>

This upgrade incorporates the fixes for CVE-2024-27316,
CVE-2024-24795,CVE-2023-38709 and other bugfixes.

Adjusted 0004-apache2-log-the-SELinux-context-at-startup.patch
and 0007-apache2-allow-to-disable-selinux-support.patch to
align with upgraded version.

Changelog:
https://downloads.apache.org/httpd/CHANGES_2.4.59

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 ...he2-log-the-SELinux-context-at-startup.patch | 17 +++++++++--------
 ...ache2-allow-to-disable-selinux-support.patch | 10 +++++-----
 .../{apache2_2.4.58.bb => apache2_2.4.59.bb}    |  2 +-
 3 files changed, 15 insertions(+), 14 deletions(-)
 rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.58.bb => apache2_2.4.59.bb} (99%)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2/0004-apache2-log-the-SELinux-context-at-startup.patch b/meta-webserver/recipes-httpd/apache2/apache2/0004-apache2-log-the-SELinux-context-at-startup.patch
index 3b080f54f..1abbe0c41 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2/0004-apache2-log-the-SELinux-context-at-startup.patch
+++ b/meta-webserver/recipes-httpd/apache2/apache2/0004-apache2-log-the-SELinux-context-at-startup.patch
@@ -8,17 +8,16 @@ Log the SELinux context at startup.
 Upstream-Status: Inappropriate [other]
 
 Note: unlikely to be any interest in this upstream
-
 ---
  configure.in  |  5 +++++
  server/core.c | 26 ++++++++++++++++++++++++++
  2 files changed, 31 insertions(+)
 
 diff --git a/configure.in b/configure.in
-index ea6cec3..92b74b7 100644
+index 352711a..f58620f 100644
 --- a/configure.in
 +++ b/configure.in
-@@ -491,6 +491,11 @@ getloadavg
+@@ -514,6 +514,11 @@ gettid
  dnl confirm that a void pointer is large enough to store a long integer
  APACHE_CHECK_VOID_PTR_LEN
  
@@ -27,11 +26,11 @@ index ea6cec3..92b74b7 100644
 +   APR_ADDTO(AP_LIBS, [-lselinux])
 +])
 +
- AC_CACHE_CHECK([for gettid()], ac_cv_gettid,
- [AC_TRY_RUN(#define _GNU_SOURCE
- #include <unistd.h>
+ if test $ac_cv_func_gettid = no; then
+   # On Linux before glibc 2.30, gettid() is only usable via syscall()
+   AC_CACHE_CHECK([for gettid() via syscall], ap_cv_gettid,
 diff --git a/server/core.c b/server/core.c
-index 4da7209..d3ca25b 100644
+index 30b317e..81f145f 100644
 --- a/server/core.c
 +++ b/server/core.c
 @@ -65,6 +65,10 @@
@@ -45,7 +44,7 @@ index 4da7209..d3ca25b 100644
  /* LimitRequestBody handling */
  #define AP_LIMIT_REQ_BODY_UNSET         ((apr_off_t) -1)
  #define AP_DEFAULT_LIMIT_REQ_BODY       ((apr_off_t) 1<<30) /* 1GB */
-@@ -5126,6 +5130,28 @@ static int core_post_config(apr_pool_t *pconf, apr_pool_t *plog, apr_pool_t *pte
+@@ -5139,6 +5143,28 @@ static int core_post_config(apr_pool_t *pconf, apr_pool_t *plog, apr_pool_t *pte
      }
  #endif
  
@@ -74,3 +73,5 @@ index 4da7209..d3ca25b 100644
      return OK;
  }
  
+--
+2.40.0
diff --git a/meta-webserver/recipes-httpd/apache2/apache2/0007-apache2-allow-to-disable-selinux-support.patch b/meta-webserver/recipes-httpd/apache2/apache2/0007-apache2-allow-to-disable-selinux-support.patch
index 3ff689440..7163dc2b8 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2/0007-apache2-allow-to-disable-selinux-support.patch
+++ b/meta-webserver/recipes-httpd/apache2/apache2/0007-apache2-allow-to-disable-selinux-support.patch
@@ -11,10 +11,10 @@ Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
  1 file changed, 10 insertions(+), 4 deletions(-)
 
 diff --git a/configure.in b/configure.in
-index 76811e7..4df3ff3 100644
+index f58620f..b5971b7 100644
 --- a/configure.in
 +++ b/configure.in
-@@ -491,10 +491,16 @@ getloadavg
+@@ -514,10 +514,16 @@ gettid
  dnl confirm that a void pointer is large enough to store a long integer
  APACHE_CHECK_VOID_PTR_LEN
  
@@ -33,8 +33,8 @@ index 76811e7..4df3ff3 100644
 +    ])
 +fi
  
- AC_CACHE_CHECK([for gettid()], ac_cv_gettid,
- [AC_TRY_RUN(#define _GNU_SOURCE
+ if test $ac_cv_func_gettid = no; then
+   # On Linux before glibc 2.30, gettid() is only usable via syscall()
 -- 
-2.25.1
+2.40.0
 
diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.58.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.59.bb
similarity index 99%
rename from meta-webserver/recipes-httpd/apache2/apache2_2.4.58.bb
rename to meta-webserver/recipes-httpd/apache2/apache2_2.4.59.bb
index a6cdfd165..b96e8b4e1 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.58.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.59.bb
@@ -27,7 +27,7 @@ SRC_URI:append:class-target = " \
            "
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bddeddfac80b2c9a882241d008bb41c3"
-SRC_URI[sha256sum] = "fa16d72a078210a54c47dd5bef2f8b9b8a01d94909a51453956b3ec6442ea4c5"
+SRC_URI[sha256sum] = "ec51501ec480284ff52f637258135d333230a7d229c3afa6f6c2f9040e321323"
 
 S = "${WORKDIR}/httpd-${PV}"
 
-- 
2.40.0


