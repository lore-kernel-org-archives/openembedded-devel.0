Return-Path: <joe.slater@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BD06E7C4DE
	for <webhook@archiver.kernel.org>; Wed,  4 Oct 2023 16:13:55 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.23058.1696436026386668901
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Oct 2023 09:13:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=o5zuf4Sj;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=864146c999=joe.slater@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 394AO3oW030517
	for <openembedded-devel@lists.openembedded.org>; Wed, 4 Oct 2023 09:13:46 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=kYXNv
	SU8Zny9869hhsTuay2KHBxjbPBHiX8T2/39ZEw=; b=o5zuf4Sj+6/FHsHI9jdtk
	ED2diIxOOG95JUn8XbFC+JhzdRcxgaqwLuOHBbn4h0RT4A95909VL8axY/7ANsj+
	9vIIfh63z0zlUdAMrBtrxeUmaztlOr5bVXpt+xccSlnSgEkpZjo94QqXQ0MlEE65
	Jr/A+oWOfhlM2sveLEaWsvSVl4sy17o2SP4ov9Y1WsEnubgaCubuwpiT19PBawVq
	RoM1+PrzOCnaIaulfeQzq1z1f89mIAXJcmLMHoTi4hbTG2th5Vjbq8oZvTMIaK6T
	ceaGmvDxDXymPTAygbEqS7U2i/p1i9hQ7+o9epIt5vFQLpOZrUpro4uqXrMmE6CL
	w==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3teey0kyjr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 04 Oct 2023 09:13:45 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 4 Oct 2023 09:13:44 -0700
Received: from ala-jslater-lx2.corp.ad.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.32 via Frontend Transport; Wed, 4 Oct 2023 09:13:44 -0700
From: <joe.slater@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <joe.slater@windriver.com>, <randy.macleod@windriver.com>
Subject: [meta-webserver][PATCH 1/1] nginx: add configure option
Date: Wed, 4 Oct 2023 09:13:45 -0700
Message-ID: <20231004161345.322169-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: XCwPjM8L0voBzFvr-rbmfyD5tTVyzV1i
X-Proofpoint-ORIG-GUID: XCwPjM8L0voBzFvr-rbmfyD5tTVyzV1i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-04_07,2023-10-02_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1015
 phishscore=0 spamscore=0 mlxlogscore=939 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 impostorscore=0 adultscore=0
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2309180000 definitions=main-2310040116
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Oct 2023 16:13:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105337

From: Joe Slater <joe.slater@windriver.com>

Support --with-http_xslt_module configure option via a PACKAGECONFIG
option.  The option is not added to the defaults.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
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
index 1ea32f7c94..8890e0bea1 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx.inc
+++ b/meta-webserver/recipes-httpd/nginx/nginx.inc
@@ -22,6 +22,7 @@ SRC_URI = " \
     file://nginx-volatile.conf \
     file://nginx.service \
     file://nginx-fix-pidfile.patch \
+    file://0001-configure-libxslt-conf.patch \
 "
 
 inherit siteinfo update-rc.d useradd systemd
@@ -47,6 +48,8 @@ PACKAGECONFIG[ipv6] = "--with-ipv6,,"
 PACKAGECONFIG[webdav] = "--with-http_dav_module,,"
 PACKAGECONFIG[stream] = "--with-stream,,"
 
+PACKAGECONFIG[xslt] = "--with-http_xslt_module,,libxslt"
+
 do_configure () {
     if [ "${SITEINFO_BITS}" = "64" ]; then
         PTRSIZE=8
-- 
2.25.1


