Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [])
 by mx.groups.io with SMTP id smtpd.web10.7823.1608016974141745035
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Dec 2020 23:23:00 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: <nil>, mailfrom: zhengrq.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.78,420,1599494400"; 
   d="scan'208";a="102408349"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 15 Dec 2020 15:22:59 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 2E6784CE6013
	for <openembedded-devel@lists.openembedded.org>; Tue, 15 Dec 2020 15:22:55 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 15 Dec 2020 15:22:54 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe][PATCH] php: CVE-2020-7070
Date: Tue, 15 Dec 2020 15:22:57 +0800
Message-ID: <1608016977-55949-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 2E6784CE6013.A7D35
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Security Advisory

References
https://nvd.nist.gov/vuln/detail/CVE-2020-7070
https://bugs.php.net/patch-display.php?bug=79699&patch=fix-urldecode&revision=1600650364
https://github.com/php/php-src/blob/master/main/php_variables.c

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../php/php/CVE-2020-7070.patch               | 24 +++++++++++++++++++
 meta-oe/recipes-devtools/php/php_7.4.9.bb     |  1 +
 2 files changed, 25 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/php/php/CVE-2020-7070.patch

diff --git a/meta-oe/recipes-devtools/php/php/CVE-2020-7070.patch b/meta-oe/recipes-devtools/php/php/CVE-2020-7070.patch
new file mode 100644
index 000000000..e5b527f98
--- /dev/null
+++ b/meta-oe/recipes-devtools/php/php/CVE-2020-7070.patch
@@ -0,0 +1,24 @@
+Subject: Patch fix-urldecode for HTTP related Bug #79699
+
+---
+ main/php_variables.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/main/php_variables.c b/main/php_variables.c
+index 1a40c2a1..cbdc7cf1 100644
+--- a/main/php_variables.c
++++ b/main/php_variables.c
+@@ -514,7 +514,9 @@ SAPI_API SAPI_TREAT_DATA_FUNC(php_default_treat_data)
+ 		}
+ 
+ 		val = estrndup(val, val_len);
+-		php_url_decode(var, strlen(var));
++		if (arg != PARSE_COOKIE) {
++			php_url_decode(var, strlen(var));
++		}
+ 		if (sapi_module.input_filter(arg, var, &val, val_len, &new_val_len)) {
+ 			php_register_variable_safe(var, val, new_val_len, &array);
+ 		}
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-devtools/php/php_7.4.9.bb b/meta-oe/recipes-devtools/php/php_7.4.9.bb
index 1da560783..bc58b5792 100644
--- a/meta-oe/recipes-devtools/php/php_7.4.9.bb
+++ b/meta-oe/recipes-devtools/php/php_7.4.9.bb
@@ -30,6 +30,7 @@ SRC_URI_append_class-target = " \
             file://phar-makefile.patch \
             file://0001-opcache-config.m4-enable-opcache.patch \
             file://xfail_two_bug_tests.patch \
+            file://CVE-2020-7070.patch \
           "
 
 S = "${WORKDIR}/php-${PV}"
-- 
2.25.1



