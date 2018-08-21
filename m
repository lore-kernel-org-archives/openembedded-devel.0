Return-Path: <Changqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A30DF75260
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Aug 2018 06:01:21 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w7L61M67007269
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Aug 2018 23:01:22 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Mon, 20 Aug 2018 23:01:22 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 21 Aug 2018 14:01:20 +0800
Message-ID: <1534831280-440509-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH][meta-oe] php: fix CVE-2017-9120
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
X-List-Received-Date: Tue, 21 Aug 2018 06:01:21 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../recipes-devtools/php/php/CVE-2017-9120.patch    | 21 +++++++++++++++++++++
 meta-oe/recipes-devtools/php/php_7.2.8.bb           |  1 +
 2 files changed, 22 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/php/php/CVE-2017-9120.patch

diff --git a/meta-oe/recipes-devtools/php/php/CVE-2017-9120.patch b/meta-oe/recipes-devtools/php/php/CVE-2017-9120.patch
new file mode 100644
index 0000000..728f25b
--- /dev/null
+++ b/meta-oe/recipes-devtools/php/php/CVE-2017-9120.patch
@@ -0,0 +1,21 @@
+php: patch for CVE-2017-9120
+
+Upstream-Status: Backport [https://bugs.php.net/bug.php?id=74544]
+
+CVE: CVE-2017-9120
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+
+diff --git a/ext/mysqli/mysqli_api.c b/ext/mysqli/mysqli_api.c
+index 03a39d7..7b88731 100644
+--- a/ext/mysqli/mysqli_api.c
++++ b/ext/mysqli/mysqli_api.c
+@@ -1965,7 +1965,7 @@ PHP_FUNCTION(mysqli_real_escape_string) {
+ 	}
+ 	MYSQLI_FETCH_RESOURCE_CONN(mysql, mysql_link, MYSQLI_STATUS_VALID);
+ 
+-	newstr = zend_string_alloc(2 * escapestr_len, 0);
++	newstr = zend_string_safe_alloc(2, escapestr_len, 0, 0);
+ 	ZSTR_LEN(newstr) = mysql_real_escape_string(mysql->mysql, ZSTR_VAL(newstr), escapestr, escapestr_len);
+ 	newstr = zend_string_truncate(newstr, ZSTR_LEN(newstr), 0);
+ 
diff --git a/meta-oe/recipes-devtools/php/php_7.2.8.bb b/meta-oe/recipes-devtools/php/php_7.2.8.bb
index e8cb7fd..2a7937e 100644
--- a/meta-oe/recipes-devtools/php/php_7.2.8.bb
+++ b/meta-oe/recipes-devtools/php/php_7.2.8.bb
@@ -5,6 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=67e369bc8d1f2e641236b8002039a6a2"
 SRC_URI += "file://change-AC_TRY_RUN-to-AC_TRY_LINK.patch \
             file://0001-acinclude.m4-skip-binconfig-check-for-libxml.patch \
             file://0001-fix-error-caused-by-a-new-variable-is-declared-after.patch \
+            file://CVE-2017-9120.patch \
            "
 SRC_URI_append_class-target = " \
                                 file://pear-makefile.patch \
-- 
2.7.4


