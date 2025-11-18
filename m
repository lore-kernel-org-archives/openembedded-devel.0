Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B9F0CED259
	for <webhook@archiver.kernel.org>; Tue, 18 Nov 2025 09:28:29 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8633.1763458098776155912
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Nov 2025 01:28:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=bGxOF2Vl;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3417ae58e6=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AI6A2ed1543533
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 09:28:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=o1ptui+wh2lbxDsXa5hl
	tgd0B9eXYIQjz/3SAyadWAA=; b=bGxOF2Vlc7PyNCt1YmqEAH9hNhxGGxdaDEXf
	Y6iar3ZsuhES4LIkF9Vf/Bqs9wIKYS/iJSISSqqOf7yYUF4ZdaPFTFPpPVnVtgaM
	ZB9M8Spr9MlKB8hp61VkKXWb/T1HfxLSJcnjuvUd5fnQIP+ZCgR3QXCFOiX2ZV2B
	WVhmZrSY/s9XedEf4Jj79jMN5DSq3pq7wlvJAWM7hQbKZ6kYrGNaSY0oAXiAuZPv
	V/zJ43SMn9OU1DOP+mGIKVpOuJjf6Ir9jvg5gbSavTMcaLRzLL5CbPlahsPwGaPj
	L2THzCyHObostqrQaSzl3IajCr2ZUhF9zn6F5A+CNh6kU9Mo2A==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aeeqwk9pv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 09:28:17 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Tue, 18 Nov 2025 01:28:16 -0800
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Tue, 18 Nov 2025 01:28:16 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH 1/2] php: remove php-phar to support reproducible build
Date: Tue, 18 Nov 2025 17:28:14 +0800
Message-ID: <20251118092815.1068882-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA3NCBTYWx0ZWRfX8pNRyWRCvTgx
 dIy0L7gPE1x/ilzMF2lzCCZoF4x0PReXnXX/tblx/P2UtsATAcMvkuW0HNHPkyI+j+jcT1egccF
 p5JNFyMnQn7UfMv7+8IDWoxksERVsDfc8NfwnyXH1lT9LpH9Kr/aQBeRLM7qQpayf/GOiBfnmhW
 ynE8ICBDNwQJG6tbDlhMhngxXpk74BvRYHYev/lAE+saphqFZXxyGQEGK36byLuxxkOL79OJhVO
 0C2K2R3WaKYgxONAhaH+0BtnqRprJny1FXVm8ZlrvdAj4fydAd906lHmZ/F0T4K9g1FL1ALpd/M
 8xxlMIB4eIiKRRXRtjwVhRJrNcPlUBV29w5Rr8eTkGE5ibGoF7fQy6NCpzh3ZltIgJK1azlWI3d
 CVuopP/9broviFWnkKp6YSZ0hjRobg==
X-Proofpoint-GUID: c89nPh1GQ3tRML_0-hke2kgUcEfSR2Ly
X-Authority-Analysis: v=2.4 cv=OuxCCi/t c=1 sm=1 tr=0 ts=691c3c31 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=67BIL_jfAAAA:8
 a=t7CeM3EgAAAA:8 a=svO6gwnVAAAA:8 a=rNEljuEgxIFLpR9CG1gA:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=5awQwY9Y38-QVGG67zo_:22
X-Proofpoint-ORIG-GUID: c89nPh1GQ3tRML_0-hke2kgUcEfSR2Ly
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511180074
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 09:28:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121842

According to [1][2], generate phar.php during cross-compile can't be
done, but upstream test res of $(TEST_PHP_EXECUTABLE) is not suitable
for Yocto.

Explicitly set TEST_PHP_EXECUTABLE_RES = "1" to not generate phar.php
for target recipe

Drop 0005-sapi-cli-config.m4-fix-build-directory.patch which is obsolete
for generating phar.php

After apply this commit
...log.do_compile...
Generating phar.php
Skipping phar.php generating during cross compilation
Generating phar.phar
Skipping phar.phar generating during cross compilation
...log.do_compile...

Then php supports reproducible build

[1] https://github.com/php/php-src/issues/11099
[2] https://github.com/php/php-src/commit/93fa9613e162d1a0e8479ba83c4b6a399846e209

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-oe/conf/layer.conf                       |  1 -
 ...enerate-phar.php-during-cross-compil.patch | 35 +++++++++++++++++++
 ...pi-cli-config.m4-fix-build-directory.patch | 35 -------------------
 meta-oe/recipes-devtools/php/php_8.4.14.bb    |  6 ++--
 4 files changed, 37 insertions(+), 40 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/php/php/0005-explicitly-not-generate-phar.php-during-cross-compil.patch
 delete mode 100644 meta-oe/recipes-devtools/php/php/0005-sapi-cli-config.m4-fix-build-directory.patch

diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
index 83b790fa18..1f55f5bee1 100644
--- a/meta-oe/conf/layer.conf
+++ b/meta-oe/conf/layer.conf
@@ -231,7 +231,6 @@ OEQA_REPRODUCIBLE_EXCLUDED_PACKAGES += " \
     pcp-src \
     perfetto \
     perfetto-dbg \
-    php-phar \
     pidgin \
     pidgin-dbg \
     pim435-staticdev \
diff --git a/meta-oe/recipes-devtools/php/php/0005-explicitly-not-generate-phar.php-during-cross-compil.patch b/meta-oe/recipes-devtools/php/php/0005-explicitly-not-generate-phar.php-during-cross-compil.patch
new file mode 100644
index 0000000000..469d26e06b
--- /dev/null
+++ b/meta-oe/recipes-devtools/php/php/0005-explicitly-not-generate-phar.php-during-cross-compil.patch
@@ -0,0 +1,35 @@
+From 41c8c5821fc74efea8b086927a17aa3bc7aef6bb Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Tue, 18 Nov 2025 16:25:28 +0800
+Subject: [PATCH] explicitly not generate phar.php during cross-compile
+
+According to [1][2], Generating phar.php during cross-compile
+can't be done, explicitly set TEST_PHP_EXECUTABLE_RES = 1
+for target recipe to not generate phar.php for cross-compile
+
+[1] https://github.com/php/php-src/issues/11099
+[2] https://github.com/php/php-src/commit/93fa9613e162d1a0e8479ba83c4b6a399846e209
+
+Upstream-Status: Inappropriate [OE specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ ext/phar/Makefile.frag | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/ext/phar/Makefile.frag b/ext/phar/Makefile.frag
+index 09d577d7..2f85847c 100644
+--- a/ext/phar/Makefile.frag
++++ b/ext/phar/Makefile.frag
+@@ -19,7 +19,7 @@ $(builddir)/phar/phar.inc: $(srcdir)/phar/phar.inc
+ 	-@test -f $(builddir)/phar/phar.inc || cp $(srcdir)/phar/phar.inc $(builddir)/phar/phar.inc
+ 
+ TEST_PHP_EXECUTABLE = $(shell $(PHP_EXECUTABLE) -v 2>&1)
+-TEST_PHP_EXECUTABLE_RES = $(shell echo "$(TEST_PHP_EXECUTABLE)" | grep -c 'Exec format error')
++TEST_PHP_EXECUTABLE_RES = "1"
+ 
+ $(builddir)/phar.php: $(srcdir)/build_precommand.php $(srcdir)/phar/*.inc $(srcdir)/phar/*.php $(SAPI_CLI_PATH)
+ 	-@(echo "Generating phar.php"; \
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-devtools/php/php/0005-sapi-cli-config.m4-fix-build-directory.patch b/meta-oe/recipes-devtools/php/php/0005-sapi-cli-config.m4-fix-build-directory.patch
deleted file mode 100644
index e551f19a48..0000000000
--- a/meta-oe/recipes-devtools/php/php/0005-sapi-cli-config.m4-fix-build-directory.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 581751f8b612c381a4a7914a33bfc4130853d305 Mon Sep 17 00:00:00 2001
-From: Claude Bing <cbing@cybernetics.com>
-Date: Tue, 9 Nov 2021 13:08:06 -0500
-Subject: [PATCH 5/5] sapi/cli/config.m4: fix build directory
-
-Upstream-Status: Inappropriate
-
-update patch to version 7.4.4
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
-
-update patch to version 8.0.12
-Signed-off-by: Claude Bing <cbing@cybernetics.com>
-
-update patch for version 8.4.4
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- sapi/cli/config.m4 | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/sapi/cli/config.m4 b/sapi/cli/config.m4
-index 76c2d64e8..0c7436fd9 100644
---- a/sapi/cli/config.m4
-+++ b/sapi/cli/config.m4
-@@ -50,7 +50,7 @@ if test "$PHP_CLI" != "no"; then
-     ])
- 
-   dnl Set executable for tests.
--  PHP_EXECUTABLE="\$(top_builddir)/\$(SAPI_CLI_PATH)"
-+  PHP_EXECUTABLE="${PHP_NATIVE_DIR}/php"
- 
-   PHP_SUBST([PHP_EXECUTABLE])
-   PHP_SUBST([SAPI_CLI_PATH])
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-devtools/php/php_8.4.14.bb b/meta-oe/recipes-devtools/php/php_8.4.14.bb
index ecec5ae04d..086e7114fb 100644
--- a/meta-oe/recipes-devtools/php/php_8.4.14.bb
+++ b/meta-oe/recipes-devtools/php/php_8.4.14.bb
@@ -20,7 +20,7 @@ SRC_URI = "http://php.net/distributions/php-${PV}.tar.bz2 \
 SRC_URI:append:class-target = " \
             file://0003-iconv-fix-detection.patch \
             file://0004-pear-fix-Makefile.frag-for-Yocto.patch \
-            file://0005-sapi-cli-config.m4-fix-build-directory.patch \
+            file://0005-explicitly-not-generate-phar.php-during-cross-compil.patch \
             file://php-fpm.conf \
             file://php-fpm-apache.conf \
             file://70_mod_php${PHP_MAJOR_VERSION}.conf \
@@ -230,11 +230,10 @@ php_sysroot_preprocess () {
 
 MODPHP_PACKAGE = "${@bb.utils.contains('PACKAGECONFIG', 'apache2', '${PN}-modphp', '', d)}"
 
-PACKAGES = "${PN}-dbg ${PN}-cli ${PN}-phpdbg ${PN}-cgi ${PN}-fpm ${PN}-fpm-apache2 ${PN}-pear ${PN}-phar ${MODPHP_PACKAGE} ${PN}-dev ${PN}-staticdev ${PN}-doc ${PN}-opcache ${PN}"
+PACKAGES = "${PN}-dbg ${PN}-cli ${PN}-phpdbg ${PN}-cgi ${PN}-fpm ${PN}-fpm-apache2 ${PN}-pear ${MODPHP_PACKAGE} ${PN}-dev ${PN}-staticdev ${PN}-doc ${PN}-opcache ${PN}"
 
 RDEPENDS:${PN} += "libgcc"
 RDEPENDS:${PN}-pear = "${PN}"
-RDEPENDS:${PN}-phar = "${PN}-cli"
 RDEPENDS:${PN}-cli = "${PN}"
 RDEPENDS:${PN}-modphp = "${PN} apache2"
 RDEPENDS:${PN}-opcache = "${PN}"
@@ -254,7 +253,6 @@ FILES:${PN}-dbg =+ "${bindir}/.debug \
 FILES:${PN}-doc += "${PHP_LIBDIR}/php/doc"
 FILES:${PN}-cli = "${bindir}/php"
 FILES:${PN}-phpdbg = "${bindir}/phpdbg"
-FILES:${PN}-phar = "${bindir}/phar*"
 FILES:${PN}-cgi = "${bindir}/php-cgi"
 FILES:${PN}-fpm = "${sbindir}/php-fpm ${sysconfdir}/php-fpm.conf ${datadir}/fpm ${sysconfdir}/init.d/php-fpm ${sysconfdir}/php-fpm.d/www.conf.default"
 FILES:${PN}-fpm-apache2 = "${sysconfdir}/apache2/conf.d/php-fpm.conf"
-- 
2.34.1


