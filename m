Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web08.7336.1618975393019611882
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Apr 2021 20:23:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: mingli.yu@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 13L3NBhs021899
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Apr 2021 20:23:11 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Tue, 20 Apr 2021 20:23:10 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.4 via Frontend Transport; Tue, 20 Apr 2021 20:23:10 -0700
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] php: Upgrade to 7.4.16
Date: Wed, 21 Apr 2021 11:23:09 +0800
Message-ID: <20210421032309.21904-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

License-Update: License updated (year updated)

Fix some security issues such as CVE-2021-21702 and remove two
cve patches which already included in the new version.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../php/php/CVE-2020-7069.patch               | 158 ------------------
 .../php/php/CVE-2020-7070.patch               |  24 ---
 .../php/{php_7.4.9.bb => php_7.4.16.bb}       |   7 +-
 3 files changed, 2 insertions(+), 187 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/php/php/CVE-2020-7069.patch
 delete mode 100644 meta-oe/recipes-devtools/php/php/CVE-2020-7070.patch
 rename meta-oe/recipes-devtools/php/{php_7.4.9.bb => php_7.4.16.bb} (97%)

diff --git a/meta-oe/recipes-devtools/php/php/CVE-2020-7069.patch b/meta-oe/recipes-devtools/php/php/CVE-2020-7069.patch
deleted file mode 100644
index 0cf4d5ed6..000000000
--- a/meta-oe/recipes-devtools/php/php/CVE-2020-7069.patch
+++ /dev/null
@@ -1,158 +0,0 @@
-Subject: Fix bug #79601 (Wrong ciphertext/tag in AES-CCM encryption
- for a 12 bytes IV)
-
----
- ext/openssl/openssl.c                      | 10 ++++-----
- ext/openssl/tests/cipher_tests.inc         | 21 +++++++++++++++++
- ext/openssl/tests/openssl_decrypt_ccm.phpt | 22 +++++++++++-------
- ext/openssl/tests/openssl_encrypt_ccm.phpt | 26 ++++++++++++++--------
- 4 files changed, 57 insertions(+), 22 deletions(-)
-
-diff --git a/ext/openssl/openssl.c b/ext/openssl/openssl.c
-index 04cb9b0f..fdad2c3b 100644
---- a/ext/openssl/openssl.c
-+++ b/ext/openssl/openssl.c
-@@ -6521,11 +6521,6 @@ static int php_openssl_validate_iv(char **piv, size_t *piv_len, size_t iv_requir
- {
- 	char *iv_new;
- 
--	/* Best case scenario, user behaved */
--	if (*piv_len == iv_required_len) {
--		return SUCCESS;
--	}
--
- 	if (mode->is_aead) {
- 		if (EVP_CIPHER_CTX_ctrl(cipher_ctx, mode->aead_ivlen_flag, *piv_len, NULL) != 1) {
- 			php_error_docref(NULL, E_WARNING, "Setting of IV length for AEAD mode failed");
-@@ -6534,6 +6529,11 @@ static int php_openssl_validate_iv(char **piv, size_t *piv_len, size_t iv_requir
- 		return SUCCESS;
- 	}
- 
-+	/* Best case scenario, user behaved */
-+	if (*piv_len == iv_required_len) {
-+		return SUCCESS;
-+	}
-+
- 	iv_new = ecalloc(1, iv_required_len + 1);
- 
- 	if (*piv_len == 0) {
-diff --git a/ext/openssl/tests/cipher_tests.inc b/ext/openssl/tests/cipher_tests.inc
-index b1e46b41..779bfa85 100644
---- a/ext/openssl/tests/cipher_tests.inc
-+++ b/ext/openssl/tests/cipher_tests.inc
-@@ -1,5 +1,26 @@
- <?php
- $php_openssl_cipher_tests = array(
-+    'aes-128-ccm' => array(
-+        array(
-+            'key' => '404142434445464748494a4b4c4d4e4f',
-+            'iv'  => '1011121314151617',
-+            'aad' => '000102030405060708090a0b0c0d0e0f',
-+            'tag' => '1fc64fbfaccd',
-+            'pt'  => '202122232425262728292a2b2c2d2e2f',
-+            'ct'  => 'd2a1f0e051ea5f62081a7792073d593d',
-+        ),
-+        array(
-+            'key' => '404142434445464748494a4b4c4d4e4f',
-+            'iv'  => '101112131415161718191a1b',
-+            'aad' => '000102030405060708090a0b0c0d0e0f' .
-+                     '10111213',
-+            'tag' => '484392fbc1b09951',
-+            'pt'  => '202122232425262728292a2b2c2d2e2f' .
-+                     '3031323334353637',
-+            'ct'  => 'e3b201a9f5b71a7a9b1ceaeccd97e70b' .
-+                     '6176aad9a4428aa5',
-+        ),
-+    ),
-     'aes-256-ccm' => array(
-         array(
-             'key' => '1bde3251d41a8b5ea013c195ae128b21' .
-diff --git a/ext/openssl/tests/openssl_decrypt_ccm.phpt b/ext/openssl/tests/openssl_decrypt_ccm.phpt
-index a5f01b87..08ef5bb7 100644
---- a/ext/openssl/tests/openssl_decrypt_ccm.phpt
-+++ b/ext/openssl/tests/openssl_decrypt_ccm.phpt
-@@ -10,14 +10,16 @@ if (!in_array('aes-256-ccm', openssl_get_cipher_methods()))
- --FILE--
- <?php
- require_once __DIR__ . "/cipher_tests.inc";
--$method = 'aes-256-ccm';
--$tests = openssl_get_cipher_tests($method);
-+$methods = ['aes-128-ccm', 'aes-256-ccm'];
- 
--foreach ($tests as $idx => $test) {
--    echo "TEST $idx\n";
--    $pt = openssl_decrypt($test['ct'], $method, $test['key'], OPENSSL_RAW_DATA,
--        $test['iv'], $test['tag'], $test['aad']);
--    var_dump($test['pt'] === $pt);
-+foreach ($methods as $method) {
-+    $tests = openssl_get_cipher_tests($method);
-+    foreach ($tests as $idx => $test) {
-+        echo "$method - TEST $idx\n";
-+        $pt = openssl_decrypt($test['ct'], $method, $test['key'], OPENSSL_RAW_DATA,
-+            $test['iv'], $test['tag'], $test['aad']);
-+        var_dump($test['pt'] === $pt);
-+    }
- }
- 
- // no IV
-@@ -32,7 +34,11 @@ var_dump(openssl_decrypt($test['ct'], $method, $test['key'], OPENSSL_RAW_DATA,
- 
- ?>
- --EXPECTF--
--TEST 0
-+aes-128-ccm - TEST 0
-+bool(true)
-+aes-128-ccm - TEST 1
-+bool(true)
-+aes-256-ccm - TEST 0
- bool(true)
- 
- Warning: openssl_decrypt(): Setting of IV length for AEAD mode failed in %s on line %d
-diff --git a/ext/openssl/tests/openssl_encrypt_ccm.phpt b/ext/openssl/tests/openssl_encrypt_ccm.phpt
-index fb5dbbc8..8c4c41f8 100644
---- a/ext/openssl/tests/openssl_encrypt_ccm.phpt
-+++ b/ext/openssl/tests/openssl_encrypt_ccm.phpt
-@@ -10,15 +10,17 @@ if (!in_array('aes-256-ccm', openssl_get_cipher_methods()))
- --FILE--
- <?php
- require_once __DIR__ . "/cipher_tests.inc";
--$method = 'aes-256-ccm';
--$tests = openssl_get_cipher_tests($method);
-+$methods = ['aes-128-ccm', 'aes-256-ccm'];
- 
--foreach ($tests as $idx => $test) {
--    echo "TEST $idx\n";
--    $ct = openssl_encrypt($test['pt'], $method, $test['key'], OPENSSL_RAW_DATA,
--        $test['iv'], $tag, $test['aad'], strlen($test['tag']));
--    var_dump($test['ct'] === $ct);
--    var_dump($test['tag'] === $tag);
-+foreach ($methods as $method) {
-+    $tests = openssl_get_cipher_tests($method);
-+    foreach ($tests as $idx => $test) {
-+        echo "$method - TEST $idx\n";
-+        $ct = openssl_encrypt($test['pt'], $method, $test['key'], OPENSSL_RAW_DATA,
-+            $test['iv'], $tag, $test['aad'], strlen($test['tag']));
-+        var_dump($test['ct'] === $ct);
-+        var_dump($test['tag'] === $tag);
-+    }
- }
- 
- // Empty IV error
-@@ -32,7 +34,13 @@ var_dump(strlen($tag));
- var_dump(openssl_encrypt('data', $method, 'password', 0, str_repeat('x', 16), $tag, '', 1024));
- ?>
- --EXPECTF--
--TEST 0
-+aes-128-ccm - TEST 0
-+bool(true)
-+bool(true)
-+aes-128-ccm - TEST 1
-+bool(true)
-+bool(true)
-+aes-256-ccm - TEST 0
- bool(true)
- bool(true)
- 
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-devtools/php/php/CVE-2020-7070.patch b/meta-oe/recipes-devtools/php/php/CVE-2020-7070.patch
deleted file mode 100644
index e5b527f98..000000000
--- a/meta-oe/recipes-devtools/php/php/CVE-2020-7070.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-Subject: Patch fix-urldecode for HTTP related Bug #79699
-
----
- main/php_variables.c | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/main/php_variables.c b/main/php_variables.c
-index 1a40c2a1..cbdc7cf1 100644
---- a/main/php_variables.c
-+++ b/main/php_variables.c
-@@ -514,7 +514,9 @@ SAPI_API SAPI_TREAT_DATA_FUNC(php_default_treat_data)
- 		}
- 
- 		val = estrndup(val, val_len);
--		php_url_decode(var, strlen(var));
-+		if (arg != PARSE_COOKIE) {
-+			php_url_decode(var, strlen(var));
-+		}
- 		if (sapi_module.input_filter(arg, var, &val, val_len, &new_val_len)) {
- 			php_register_variable_safe(var, val, new_val_len, &array);
- 		}
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-devtools/php/php_7.4.9.bb b/meta-oe/recipes-devtools/php/php_7.4.16.bb
similarity index 97%
rename from meta-oe/recipes-devtools/php/php_7.4.9.bb
rename to meta-oe/recipes-devtools/php/php_7.4.16.bb
index e19d5dd21..821d9cd04 100644
--- a/meta-oe/recipes-devtools/php/php_7.4.9.bb
+++ b/meta-oe/recipes-devtools/php/php_7.4.16.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.php.net"
 SECTION = "console/network"
 
 LICENSE = "PHP-3.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=7e571b888d585b31f9ef5edcc647fa30"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=99532e0f6620bc9bca34f12fadaee33c"
 
 BBCLASSEXTEND = "native"
 DEPENDS = "zlib bzip2 libxml2 virtual/libiconv php-native lemon-native"
@@ -30,13 +30,10 @@ SRC_URI_append_class-target = " \
             file://phar-makefile.patch \
             file://0001-opcache-config.m4-enable-opcache.patch \
             file://xfail_two_bug_tests.patch \
-            file://CVE-2020-7070.patch \
-            file://CVE-2020-7069.patch \
           "
 
 S = "${WORKDIR}/php-${PV}"
-SRC_URI[md5sum] = "e68a66c54b080d108831f6dc2e1e403d"
-SRC_URI[sha256sum] = "2e270958a4216480da7886743438ccc92b6acf32ea96fefda88d07e0a5095deb"
+SRC_URI[sha256sum] = "85710f007cfd0fae94e13a02a3a036f4e81ef43693260cae8a2e1ca93659ce3e"
 
 inherit autotools pkgconfig python3native gettext
 
-- 
2.29.2

