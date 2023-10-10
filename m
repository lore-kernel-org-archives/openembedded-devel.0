Return-Path: <joe.slater@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E11BCD98C4
	for <webhook@archiver.kernel.org>; Tue, 10 Oct 2023 21:14:56 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.1712.1696972487700780679
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Oct 2023 14:14:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=KqWS0JIi;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=86471dd6ef=joe.slater@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 39AHRK6g016612
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Oct 2023 21:14:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=0ZCsE
	o9XRb4CZL/UAa1gJ2oJbQcmLS/V/1tG6Kb6iHE=; b=KqWS0JIiLsUIiYmhITT78
	eiln3pEr8ozIXdu8WH8c0vOUWuvWalPDAB8Gl3yedz6uUpvnHSuAlNiRDJC6uR5U
	MH+gY3ootQhgmFXoe29CRXzt+dsYLDPeet0tLmYCTDOLN7w+vgahT39vo1eEsmGm
	QGCYcBQeyj45Hvz5yZzn2KcN5slcG5HMACi6uRspf+zHVacyHZs0+BWoD8l6uzOX
	MPpRFt6m9cNU3o9DOa9wc0BQhSkSI7J3atIYS9ANjwrC/PxMA66f5HHjRPxBDcLp
	h/KenN5NYlnipY3DtLgqUrSYNGNCF2AMRT7I7tFMv/Fk8NhLhyrVZqyu+2wFImHi
	w==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3tjxa6b54p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Oct 2023 21:14:46 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 10 Oct 2023 14:14:44 -0700
Received: from ala-jslater-lx2.corp.ad.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.32 via Frontend Transport; Tue, 10 Oct 2023 14:14:44 -0700
From: <joe.slater@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <joe.slater@windriver.com>, <randy.macleod@windriver.com>
Subject: [kirkstone][meta-webserver][PATCH 1/1] nginx: add configure option
Date: Tue, 10 Oct 2023 14:14:45 -0700
Message-ID: <20231010211445.1166872-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: jdVKh0zy8iOsBcooroL4rK4VU9ePeEuH
X-Proofpoint-ORIG-GUID: jdVKh0zy8iOsBcooroL4rK4VU9ePeEuH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-10_17,2023-10-10_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 mlxlogscore=974 malwarescore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2309180000 definitions=main-2310100164
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Oct 2023 21:14:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105418

From: Joe Slater <joe.slater@windriver.com>

Support --with-http_xslt_module configure option via a PACKAGECONFIG
option.  The option is not added to the defaults.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit e0ac8eec48ddddc93751cfcdef2557998bfe91c8)
---
 .../files/0001-configure-libxslt-conf.patch   | 39 +++++++++++++++++++
 meta-webserver/recipes-httpd/nginx/nginx.inc  |  3 ++
 2 files changed, 42 insertions(+)
 create mode 100644 meta-webserver/recipes-httpd/nginx/files/0001-configure-libxslt-conf.patch

diff --git a/meta-webserver/recipes-httpd/nginx/files/0001-configure-libxslt-conf.patch b/meta-webserver/recipes-httpd/nginx/files/0001-configure-libxslt-conf.patch
new file mode 100644
index 0000000000..7ba2a1fb85
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/files/0001-configure-libxslt-conf.patch
@@ -0,0 +1,39 @@
+From 0c3c669464a514cf8d0cac08282ecb2b486f440f Mon Sep 17 00:00:00 2001
+From: Joe Slater <joe.slater@windriver.com>
+Date: Tue, 3 Oct 2023 19:21:17 +0000
+Subject: [PATCH] configure: libxslt conf
+
+Modify to find libxslt related include files under sysroot.
+
+Upstream-Status: Pending
+
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+---
+ auto/lib/libxslt/conf | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/auto/lib/libxslt/conf b/auto/lib/libxslt/conf
+index 3063ac7..eb77886 100644
+--- a/auto/lib/libxslt/conf
++++ b/auto/lib/libxslt/conf
+@@ -12,7 +12,7 @@
+                       #include <libxslt/xsltInternals.h>
+                       #include <libxslt/transform.h>
+                       #include <libxslt/xsltutils.h>"
+-    ngx_feature_path="/usr/include/libxml2"
++    ngx_feature_path="=/usr/include/libxml2"
+     ngx_feature_libs="-lxml2 -lxslt"
+     ngx_feature_test="xmlParserCtxtPtr    ctxt = NULL;
+                       xsltStylesheetPtr   sheet = NULL;
+@@ -100,7 +100,7 @@ fi
+     ngx_feature_name=NGX_HAVE_EXSLT
+     ngx_feature_run=no
+     ngx_feature_incs="#include <libexslt/exslt.h>"
+-    ngx_feature_path="/usr/include/libxml2"
++    ngx_feature_path="=/usr/include/libxml2"
+     ngx_feature_libs="-lexslt"
+     ngx_feature_test="exsltRegisterAll();"
+     . auto/feature
+-- 
+2.35.5
+
diff --git a/meta-webserver/recipes-httpd/nginx/nginx.inc b/meta-webserver/recipes-httpd/nginx/nginx.inc
index 231c1d1ec9..9f93c7051d 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx.inc
+++ b/meta-webserver/recipes-httpd/nginx/nginx.inc
@@ -22,6 +22,7 @@ SRC_URI = " \
     file://nginx-volatile.conf \
     file://nginx.service \
     file://nginx-fix-pidfile.patch \
+    file://0001-configure-libxslt-conf.patch \
 "
 
 inherit siteinfo update-rc.d useradd systemd
@@ -45,6 +46,8 @@ PACKAGECONFIG[ssl] = "--with-http_ssl_module,,openssl"
 PACKAGECONFIG[http-auth-request] = "--with-http_auth_request_module,,"
 PACKAGECONFIG[stream] = "--with-stream,,"
 
+PACKAGECONFIG[xslt] = "--with-http_xslt_module,,libxslt"
+
 do_configure () {
     if [ "${SITEINFO_BITS}" = "64" ]; then
         PTRSIZE=8
-- 
2.25.1


