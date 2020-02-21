Return-Path: <Li.Zhou@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E149961629
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Feb 2020 09:16:17 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 01L9GI58024247
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Feb 2020 01:16:18 -0800 (PST)
Received: from pek-lpggp2.wrs.com (128.224.153.75) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Fri, 21 Feb 2020 01:16:05 -0800
From: Li Zhou <li.zhou@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 21 Feb 2020 17:15:31 +0800
Message-ID: <1582276531-249476-1-git-send-email-li.zhou@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [128.224.153.75]
Subject: [meta-oe][PATCH] php: Security Advisory - php - CVE-2020-7059
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 21 Feb 2020 09:16:18 -0000
Content-Type: text/plain

Backport the patch <http://git.php.net/?p=php-src.git;a=commit;
h=0f79b1bf301f455967676b5129240140c5c45b09> to solve CVE-2020-7059.
Because of the version context, this porting mainly refers to the
version merging commit <http://git.php.net/?p=php-src.git;a=commit;
h=a8a6242db7c01bb2d87f29e9b8d5ff3f0f847645>

Signed-off-by: Li Zhou <li.zhou@windriver.com>
---
 .../recipes-devtools/php/php/CVE-2020-7059.patch   | 86 ++++++++++++++++++++++
 meta-oe/recipes-devtools/php/php_7.3.11.bb         |  1 +
 2 files changed, 87 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/php/php/CVE-2020-7059.patch

diff --git a/meta-oe/recipes-devtools/php/php/CVE-2020-7059.patch b/meta-oe/recipes-devtools/php/php/CVE-2020-7059.patch
new file mode 100644
index 0000000..f7d3ab6
--- /dev/null
+++ b/meta-oe/recipes-devtools/php/php/CVE-2020-7059.patch
@@ -0,0 +1,86 @@
+From 1adaab3aa81fa9b48e351b5644d9fee70f2fe73f Mon Sep 17 00:00:00 2001
+From: Li Zhou <li.zhou@windriver.com>
+Date: Thu, 20 Feb 2020 02:05:52 -0800
+Subject: [PATCH] Fix #79099: OOB read in php_strip_tags_ex
+
+Upstream-Status: Backport
+CVE: CVE-2020-7059
+Signed-off-by: Li Zhou <li.zhou@windriver.com>
+---
+ ext/standard/string.c                 |  6 +++---
+ ext/standard/tests/file/bug79099.phpt | 32 ++++++++++++++++++++++++++++++++
+ 2 files changed, 35 insertions(+), 3 deletions(-)
+ create mode 100644 ext/standard/tests/file/bug79099.phpt
+
+diff --git a/ext/standard/string.c b/ext/standard/string.c
+index dde97fa..2213d8d 100644
+--- a/ext/standard/string.c
++++ b/ext/standard/string.c
+@@ -5163,7 +5163,7 @@ state_1:
+ 			}
+ 
+ 			lc = '>';
+-			if (is_xml && *(p -1) == '-') {
++			if (is_xml && p >= buf + 1 && *(p -1) == '-') {
+ 				break;
+ 			}
+ 			in_q = state = is_xml = 0;
+@@ -5195,7 +5195,7 @@ state_1:
+ 			goto reg_char_1;
+ 		case '!':
+ 			/* JavaScript & Other HTML scripting languages */
+-			if (*(p-1) == '<') {
++			if (p >= buf + 1 && *(p-1) == '<') {
+ 				state = 3;
+ 				lc = c;
+ 				p++;
+@@ -5205,7 +5205,7 @@ state_1:
+ 			}
+ 			break;
+ 		case '?':
+-			if (*(p-1) == '<') {
++			if (p >= buf + 1 && *(p-1) == '<') {
+ 				br=0;
+ 				state = 2;
+ 				p++;
+diff --git a/ext/standard/tests/file/bug79099.phpt b/ext/standard/tests/file/bug79099.phpt
+new file mode 100644
+index 0000000..a1f2a33
+--- /dev/null
++++ b/ext/standard/tests/file/bug79099.phpt
+@@ -0,0 +1,32 @@
++--TEST--
++Bug #79099 (OOB read in php_strip_tags_ex)
++--FILE--
++<?php
++$stream = fopen('php://memory', 'w+');
++fputs($stream, "<?\n\"\n");
++rewind($stream);
++var_dump(@fgetss($stream));
++var_dump(@fgetss($stream));
++fclose($stream);
++
++$stream = fopen('php://memory', 'w+');
++fputs($stream, "<\0\n!\n");
++rewind($stream);
++var_dump(@fgetss($stream));
++var_dump(@fgetss($stream));
++fclose($stream);
++
++$stream = fopen('php://memory', 'w+');
++fputs($stream, "<\0\n?\n");
++rewind($stream);
++var_dump(@fgetss($stream));
++var_dump(@fgetss($stream));
++fclose($stream);
++?>
++--EXPECT--
++string(0) ""
++string(0) ""
++string(0) ""
++string(0) ""
++string(0) ""
++string(0) ""
+-- 
+1.9.1
+
diff --git a/meta-oe/recipes-devtools/php/php_7.3.11.bb b/meta-oe/recipes-devtools/php/php_7.3.11.bb
index e7fb847..ec5fb3b 100644
--- a/meta-oe/recipes-devtools/php/php_7.3.11.bb
+++ b/meta-oe/recipes-devtools/php/php_7.3.11.bb
@@ -18,6 +18,7 @@ SRC_URI = "http://php.net/distributions/php-${PV}.tar.bz2 \
            file://0001-Use-pkg-config-for-libxml2-detection.patch \
            file://debian-php-fixheader.patch \
            file://CVE-2019-6978.patch \
+           file://CVE-2020-7059.patch \
           "
 
 SRC_URI_append_class-target = " \
-- 
1.9.1


