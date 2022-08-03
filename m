Return-Path: <mingli.yu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F524C19F28
	for <webhook@archiver.kernel.org>; Wed,  3 Aug 2022 05:28:11 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web12.5290.1659504488651844919
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Aug 2022 22:28:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=HtmrRUF6;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=52140db50b=mingli.yu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 2735S7Bs010413
	for <openembedded-devel@lists.openembedded.org>; Wed, 3 Aug 2022 05:28:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=nThTeTiP/L+sXDnXgDn51mUKNkIAuhxukKMuX+tsIEs=;
 b=HtmrRUF6luCZdnpdW8E4xuYUIz8X0oS6TYi3JgPaq5kUgKNt16IQsEM29R0gZcEpwzYc
 eqlztt6XsEc05BiwcrwRY7NsMvegIlLlMGl2KTEHGqWhXxDIsD0W5PHx7w+bbWSAvO0x
 Py9f5y9HaPPK7RXJKEXSGau2ce579qPPfZjFAybXcHXib+3FdrdjeJEqYbPXsUkMsNLy
 Riyu+YIwNa1WOIxdnkbzdW9BSo9JYCNnwnfYTFNtE7tWBxtfk65y7yxfrW0KrAqa7wM5
 fxPuUtG1gI9PXO1WQy5vzt+/bJFxLIZuH7CBRkKveqER36pZFTnqTx0CVFe/41SHMh0s Nw==
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com
 [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hqdbvr61u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Aug 2022 05:28:07 +0000
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 2 Aug 2022 22:28:06 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 2 Aug 2022 22:28:05 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Tue, 2 Aug 2022 22:28:05 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-webserver][PATCH] apache2: Fix the buildpaths issue
Date: Wed, 3 Aug 2022 13:28:04 +0800
Message-ID: <20220803052804.1012950-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: qU25c5U-vFU83Vpu_R6BR6ptgbWmG95C
X-Proofpoint-GUID: qU25c5U-vFU83Vpu_R6BR6ptgbWmG95C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-03_03,2022-08-02_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 bulkscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 impostorscore=0 mlxscore=0 malwarescore=0 spamscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2208030028
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Aug 2022 05:28:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98105

From: Mingli Yu <mingli.yu@windriver.com>

Fixes:
   WARNING: apache2-2.4.54-r0 do_package_qa: QA Issue: File /usr/src/debug/apache2/2.4.54-r0/build/server/exports.c in package apache2-src contains reference to TMPDIR [buildpaths]

Before the patch:
  # cat ./build/server/exports.c
  [snip]
  #include "mpm_fdqueue.h"

  const void *ap_ugly_hack = NULL;

  /*
   * /buildarea/build/tmp-glibc/work/core2-32-wrs-linux/apache2/2.4.54-r0/httpd-2.4.54/include/ap_expr.h
   */
  const void *ap_hack_ap_expr_exec = (const void *)ap_expr_exec;
  [snip]

After the patch:
  # cat ./build/server/exports.c
  [snip]
  #include "mpm_fdqueue.h"

  const void *ap_ugly_hack = NULL;

  /*
   * ap_expr.h
   */
  const void *ap_hack_ap_expr_exec = (const void *)ap_expr_exec;
  [snip]

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ...make_exports.awk-not-expose-the-path.patch | 32 +++++++++++++++++++
 .../recipes-httpd/apache2/apache2_2.4.54.bb   |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta-webserver/recipes-httpd/apache2/apache2/0001-make_exports.awk-not-expose-the-path.patch

diff --git a/meta-webserver/recipes-httpd/apache2/apache2/0001-make_exports.awk-not-expose-the-path.patch b/meta-webserver/recipes-httpd/apache2/apache2/0001-make_exports.awk-not-expose-the-path.patch
new file mode 100644
index 000000000..78f23f0f2
--- /dev/null
+++ b/meta-webserver/recipes-httpd/apache2/apache2/0001-make_exports.awk-not-expose-the-path.patch
@@ -0,0 +1,32 @@
+From 5b5eae9cdf3bae91756c717349f2f33a31888f24 Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Wed, 3 Aug 2022 12:35:16 +0800
+Subject: [PATCH] make_exports.awk: not expose the path
+
+Don't print the full path in the comment line.
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ build/make_exports.awk | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/build/make_exports.awk b/build/make_exports.awk
+index 1cf0568..44d93c5 100644
+--- a/build/make_exports.awk
++++ b/build/make_exports.awk
+@@ -47,7 +47,9 @@ function push(line) {
+ 
+ function do_output() {
+     printf("/*\n")
+-    printf(" * %s\n", FILENAME)
++    file = FILENAME
++    sub("([^/]*[/])*", "", file)
++    printf(" * %s\n", file)
+     printf(" */\n")
+     
+     for (i = 0; i < stackptr; i++) {
+-- 
+2.25.1
+
diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.54.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.54.bb
index c5f014b3c..4f30eca59 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.54.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.54.bb
@@ -15,6 +15,7 @@ SRC_URI = "${APACHE_MIRROR}/httpd/httpd-${PV}.tar.bz2 \
            file://0007-apache2-allow-to-disable-selinux-support.patch \
            file://0008-Fix-perl-install-directory-to-usr-bin.patch \
            file://0009-support-apxs.in-force-destdir-to-be-empty-string.patch \
+           file://0001-make_exports.awk-not-expose-the-path.patch \
           "
 
 SRC_URI:append:class-target = " \
-- 
2.25.1


