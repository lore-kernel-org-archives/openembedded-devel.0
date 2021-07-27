Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web09.6253.1627353360880007697
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Jul 2021 19:36:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=l9DJ+AdK;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id i1so14046431plr.9
        for <openembedded-devel@lists.openembedded.org>; Mon, 26 Jul 2021 19:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Z1gKQq8HAgVJ5JPltHs3ObsHH1T6FFumiYSi2yDfAvw=;
        b=l9DJ+AdKh1Mhf5Sz86ye0eVEZPSV2B1Yny4moZYU6ObNt7bpPH0Bsuhyb9shK9k9nA
         nsJ4lUyDePZMK+0hr7lwjMSrfDLlEB7bhDueW+92U6iXts7u7GLI0Co7iX6J26IdFxVc
         DJ9Myy+OzVWlHv1l+VNsN8KTughQ0I6TYJjqoj7lQ6UKNNBK/4BKTLi/ulQIyZ9ooPU8
         QfA8DnIkNzvYTONIjgYL52owvuks9TFKpzG5Klyo/XuLH0SJPN3HHvJGrpZo0W5fFR97
         YA6mlmy8IJ/Qr2Qx3XlJBV4FwCECaQRCeN6K7klobDTvxzO+84kot9ncnfxGbhrl9Ex2
         IS+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Z1gKQq8HAgVJ5JPltHs3ObsHH1T6FFumiYSi2yDfAvw=;
        b=P0gmJ68VeCln5THGiPUeGPZKPcx7g7dFVZ2J8Zq/9BLVdgc0WS8VXwjPcmxZgQwSCQ
         8KkMlAVTbjkpK+x3Aak12zw+vnHeAX+scKSJgZYFbUBoko03+gHnT/7IvgAqahGPB+Ql
         f2BpTB+cqUPRIHjiDcXatip+qrLFUTKIkV2q+dBb6I3XjdxY4rsevRYgBuXQlMRzNsXM
         csbs3Ui/aqYPfsK3kdpHXn6v8Ofdil1xksmz+I7TCI9bYwk5QUt4or1wMh3GKpGH+/n9
         YdPf+KK6mkXmXMhqFqclPmzL6w63MBMBMfyedME1zj8ojgcbU7q/serYSy/5Fdd5AFD1
         grRQ==
X-Gm-Message-State: AOAM531e4ccaoxw/TzXG7SIR6Ow97u6bWV8K04SxPFEXYco3lixE0Wrh
	8/ndySkjSu2tXDlNJ0aZKnqiEGDNq6NyMQ==
X-Google-Smtp-Source: ABdhPJwKU91Z5PkqwjHnzXb+KPqkNWzpktjZIrqgHcnIIIhiRK+GIuYrWly87QWQckP7tf0KmWzmKg==
X-Received: by 2002:a17:902:8488:b029:129:97e8:16e7 with SMTP id c8-20020a1709028488b029012997e816e7mr17000446plo.39.1627353360239;
        Mon, 26 Jul 2021 19:36:00 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.caveonetworks.com ([2601:202:4180:a5c0:84ca:24f2:48ba:ef1a])
        by smtp.gmail.com with ESMTPSA id y82sm1425340pfb.121.2021.07.26.19.35.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jul 2021 19:35:56 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Mingli Yu <mingli.yu@windriver.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][dunfell][PATCH 3/3] php: Upgrade to 7.4.16
Date: Mon, 26 Jul 2021 19:35:53 -0700
Message-Id: <20210727023553.2223746-3-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210727023553.2223746-1-akuster808@gmail.com>
References: <20210727023553.2223746-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mingli Yu <mingli.yu@windriver.com>

License-Update: License updated (year updated)

Fix some security issues such as CVE-2021-21702 and remove two
cve patches which already included in the new version.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit e418ee4657e084c8b4d42aabf76ff6df99253e91)
[Bug fix only updates plus: CVE-2020-7071 ]
Signed-off-by: Armin Kuster <akuster808@gmail.com>
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
index 0cf4d5ed60..0000000000
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
index e5b527f989..0000000000
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
index dd8404e688..bc0a6b5df3 100644
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
2.25.1

