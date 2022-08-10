Return-Path: <mingli.yu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52737C00140
	for <webhook@archiver.kernel.org>; Wed, 10 Aug 2022 08:53:14 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.3492.1660121585213400205
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Aug 2022 01:53:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=U3jT4CUk;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=5221def8fc=mingli.yu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 27A8OJIa015557
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Aug 2022 01:53:04 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=EktZf9Y5HtaqRRCaLZQwnwrx8cnmrop3hpA1m0hHUtQ=;
 b=U3jT4CUkbJ6GCuY3DaAku39oq55IUxGeWgmPMI58coREONo5IuBYT4OhhHGP7i8bUz+O
 GkzM/yvI2nReQ9EWDUIHaqDFbeC55tzhMI9n+kIyELu+EfxIciEAmIL/m/k5TT7TlWsA
 xCDQC8nOTeVOd/9pSQPh1eFqdOQfOg4a1AA4OWYLLS2xx7tc0kdQKifBmM5oEjird5uA
 fuBUGzrvj3L7N1wyWNJzXeXaVh8iPVzDC+gFRwuYOt9rzeRr8V0fuSzEW/z2GBj5h/rw
 j8Ed46yf7jpPFSc5ap2udf9EIrEfYimWd7aA5jPZB256f11FqZAzUXT8YGmQfBYvOYdX 7w==
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com
 [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3huwrcgd9s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Aug 2022 01:53:04 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 10 Aug 2022 01:53:04 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Wed, 10 Aug 2022 01:53:03 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] nspr: fix buildpaths issue
Date: Wed, 10 Aug 2022 16:53:02 +0800
Message-ID: <20220810085302.1017014-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: Wo30PQAA25mBSCASdtQTEedinM524bap
X-Proofpoint-ORIG-GUID: Wo30PQAA25mBSCASdtQTEedinM524bap
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-10_03,2022-08-09_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 clxscore=1015 impostorscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 spamscore=0 adultscore=0 mlxlogscore=999 phishscore=0 lowpriorityscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208100026
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Aug 2022 08:53:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98186

From: Mingli Yu <mingli.yu@windriver.com>

Fixes:
  WARNING: nspr-4.29-r0 do_package_qa: QA Issue: File /usr/bin/nspr-config in package nspr-dev contains reference to TMPDIR [buildpaths]

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ...ig-nspr-config.in-don-t-pass-LDFLAGS.patch | 30 +++++++++++++++++++
 meta-oe/recipes-support/nspr/nspr_4.29.bb     |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta-oe/recipes-support/nspr/nspr/0001-config-nspr-config.in-don-t-pass-LDFLAGS.patch

diff --git a/meta-oe/recipes-support/nspr/nspr/0001-config-nspr-config.in-don-t-pass-LDFLAGS.patch b/meta-oe/recipes-support/nspr/nspr/0001-config-nspr-config.in-don-t-pass-LDFLAGS.patch
new file mode 100644
index 000000000..6ebc9c4ae
--- /dev/null
+++ b/meta-oe/recipes-support/nspr/nspr/0001-config-nspr-config.in-don-t-pass-LDFLAGS.patch
@@ -0,0 +1,30 @@
+From 13e9d66c24d1dce5179805ae5e1bf940409b4914 Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Wed, 10 Aug 2022 15:21:07 +0800
+Subject: [PATCH] config/nspr-config.in: don't pass LDFLAGS
+
+Don't pass LDFLAGS to avoid exposing the build env info.
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ config/nspr-config.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/config/nspr-config.in b/config/nspr-config.in
+index 2cb62a0..2bec715 100755
+--- a/config/nspr-config.in
++++ b/config/nspr-config.in
+@@ -136,7 +136,7 @@ if test "$echo_libs" = "yes"; then
+       if test -n "$lib_nspr"; then
+ 	libdirs="$libdirs -lnspr${major_version}"
+       fi
+-      os_ldflags="@LDFLAGS@"
++      os_ldflags="LDFLAGS"
+       for i in $os_ldflags ; do
+ 	if echo $i | grep \^-L >/dev/null; then
+ 	  libdirs="$libdirs $i"
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-support/nspr/nspr_4.29.bb b/meta-oe/recipes-support/nspr/nspr_4.29.bb
index b60de08d2..92c5234c3 100644
--- a/meta-oe/recipes-support/nspr/nspr_4.29.bb
+++ b/meta-oe/recipes-support/nspr/nspr_4.29.bb
@@ -12,6 +12,7 @@ SRC_URI = "http://ftp.mozilla.org/pub/nspr/releases/v${PV}/src/nspr-${PV}.tar.gz
            file://0002-Add-nios2-support.patch \
            file://0001-md-Fix-build-with-musl.patch \
            file://Makefile.in-remove-_BUILD_STRING-and-_BUILD_TIME.patch \
+           file://0001-config-nspr-config.in-don-t-pass-LDFLAGS.patch \
            file://nspr.pc.in \
 "
 
-- 
2.25.1


