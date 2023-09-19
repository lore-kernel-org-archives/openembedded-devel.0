Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C72DECD54A7
	for <webhook@archiver.kernel.org>; Tue, 19 Sep 2023 08:03:09 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.2892.1695110585162268426
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Sep 2023 01:03:05 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="112058295"
X-IronPort-AV: E=Sophos;i="6.02,158,1688396400"; 
   d="scan'208";a="112058295"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 17:03:02 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id AA5ADDB4D5
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 17:03:00 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id D7FC7D5EAC
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 17:02:59 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id DE8B186E47;
	Tue, 19 Sep 2023 17:02:58 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] xmlsec1: upgrade 1.2.37 -> 1.3.1
Date: Tue, 19 Sep 2023 16:02:21 +0800
Message-Id: <1695110541-8515-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27884.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27884.006
X-TMASE-Result: 10--9.864900-10.000000
X-TMASE-MatchedRID: NSUiViEAzXSjz0nOeth/yTo39wOA02LhQRlUSJjs8Z/9wRnyxuPjhLYH
	qiG3BlJoMEiQlkRQZB0kAC9UeVU55m2cVk8C+vI+l2fRVpVyo6TCmgWHFde40FoJuH6vaNCzg7c
	fJQw9FscHfklSbQowABK4lG1JTzij4KdJbWzbHtvNgrlT5Ajc7jeXamXCCu1YMHDHnR8cUQIhS0
	ofkAkz2SL637QCIVpiytuC65NNIO5MGF0Ua9spp5VRzPxemJL0FbxpnsAk1QJGMe+tDjQ3FlKCS
	V79DbqwNREI2+5CsCBjkBmtMrv8Ml0ieHN50/kHuLt50vtxBA7hEXiLZlbM8UukIs3g1HjeRg13
	d2dSV66r1jKm0SUrl1pQ8H4V7LBHBAF1SBaD5qSVd49c0zgWM/Od2ImQcUyEQkz7hHwAeTvsWiB
	RDS9X2HzRXXQCJIIjq5UJ2wehuDcgdDqyZU3r4xMxKDqgAFSzWNQbDj7ezS0Pa94jf+HCbyP+FD
	9UJZFv7QHQxPxLQSSAMuqetGVetr9k4V4N5ceA3QfwsVk0Ubv+efAnnZBiL8z+Ba7+nv3u1tlR/
	hOPPXi2k6VfVHA7vCNxc22dgb36nzIJyhfJA3x+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 08:03:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105001

From: Wang Mingyu <wangmy@fujitsu.com>

0001-xmldsigverify-Include-xmlsec-parser.h.patch
removed since it's included in 1.3.1

Changelog:
==========
-Added "--with-libltdl" option for ./configure to allow custom libltdl installations and deprecated "--enable-crypto-dl" option.
-Added support for cclang compiler on non-MacOSX platforms.
-(xmlsec-openssl) Restored support for LibreSSL and bumped minimum required version to 3.5.0.
-(xmlsec-nss) Restored minimum supported NSS version to 3.35.
-Several other small fixes (more details).

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...mldsigverify-Include-xmlsec-parser.h.patch | 43 -------------------
 .../{xmlsec1_1.2.37.bb => xmlsec1_1.3.1.bb}   | 19 ++++----
 2 files changed, 9 insertions(+), 53 deletions(-)
 delete mode 100644 meta-oe/recipes-support/xmlsec1/xmlsec1/0001-xmldsigverify-Include-xmlsec-parser.h.patch
 rename meta-oe/recipes-support/xmlsec1/{xmlsec1_1.2.37.bb => xmlsec1_1.3.1.bb} (80%)

diff --git a/meta-oe/recipes-support/xmlsec1/xmlsec1/0001-xmldsigverify-Include-xmlsec-parser.h.patch b/meta-oe/recipes-support/xmlsec1/xmlsec1/0001-xmldsigverify-Include-xmlsec-parser.h.patch
deleted file mode 100644
index 4347e925a3..0000000000
--- a/meta-oe/recipes-support/xmlsec1/xmlsec1/0001-xmldsigverify-Include-xmlsec-parser.h.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 30e1afe60820c18c89cd10e9dcb7208ad5676d1d Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 19 Jan 2023 15:06:35 -0800
-Subject: [PATCH] xmldsigverify: Include xmlsec/parser.h
-
-this ensures that xmlSecParserSetDefaultOptions definition is made
-available
-
-Fixes
-| xmldsigverify.c:275:5: error: call to undeclared function 'xmlSecParserSetDefaultOptions'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
-|     xmlSecParserSetDefaultOptions(XML_PARSE_NOENT | XML_PARSE_NOCDATA |
-|     ^
-
-Upstream-Status: Submitted [https://github.com/lsh123/xmlsec/pull/463]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- examples/xmldsigverify.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/examples/xmldsigverify.c b/examples/xmldsigverify.c
-index ed538c70..ff68120e 100644
---- a/examples/xmldsigverify.c
-+++ b/examples/xmldsigverify.c
-@@ -25,6 +25,7 @@
- #include <xmlsec/xmldsig.h>
- #include <xmlsec/crypto.h>
- 
-+#include <xmlsec/parser.h>
- /* #define XMLDSIGVERIFY_DEFAULT_TRUSTED_CERTS_FOLDER   "/etc/httpd/conf/ssl.crt" */
- #define XMLDSIGVERIFY_DEFAULT_TRUSTED_CERTS_FOLDER      "/var/www/cgi-bin/keys-certs.def"
- #define XMLDSIGVERIFY_KEY_AND_CERTS_FOLDER              "/var/www/cgi-bin/keys-certs"
-@@ -36,7 +37,7 @@ int verify_request(xmlSecKeysMngrPtr mngr);
- int url_decode(char *buf, size_t size);
- 
- int
--main(int , char **) {
-+main() {
-     xmlSecKeysMngrPtr mngr;
- #ifndef XMLSEC_NO_XSLT
-     xsltSecurityPrefsPtr xsltSecPrefs = NULL;
--- 
-2.39.1
-
diff --git a/meta-oe/recipes-support/xmlsec1/xmlsec1_1.2.37.bb b/meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.1.bb
similarity index 80%
rename from meta-oe/recipes-support/xmlsec1/xmlsec1_1.2.37.bb
rename to meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.1.bb
index a3da770943..934e81a3c3 100644
--- a/meta-oe/recipes-support/xmlsec1/xmlsec1_1.2.37.bb
+++ b/meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.1.bb
@@ -13,17 +13,16 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=352791d62092ea8104f085042de7f4d0"
 SECTION = "libs"
 
 SRC_URI = "http://www.aleksey.com/xmlsec/download/${BP}.tar.gz \
-    file://fix-ltmain.sh.patch \
-    file://change-finding-path-of-nss.patch \
-    file://makefile-ptest.patch \
-    file://xmlsec1-examples-allow-build-in-separate-dir.patch \
-    file://0001-nss-nspr-fix-for-multilib.patch \
-    file://run-ptest \
-    file://ensure-search-path-non-host.patch \
-    file://0001-xmldsigverify-Include-xmlsec-parser.h.patch \
-    "
+           file://fix-ltmain.sh.patch \
+           file://change-finding-path-of-nss.patch \
+           file://makefile-ptest.patch \
+           file://xmlsec1-examples-allow-build-in-separate-dir.patch \
+           file://0001-nss-nspr-fix-for-multilib.patch \
+           file://run-ptest \
+           file://ensure-search-path-non-host.patch \
+           "
 
-SRC_URI[sha256sum] = "5f8dfbcb6d1e56bddd0b5ec2e00a3d0ca5342a9f57c24dffde5c796b2be2871c"
+SRC_URI[sha256sum] = "10f48384d4fd1afc05fea545b74fbf7c152582f0a895c189f164d55270400c63"
 
 inherit autotools-brokensep ptest pkgconfig
 
-- 
2.34.1


