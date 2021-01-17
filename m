Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web12.21052.1610905007169488199
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Jan 2021 09:36:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=G4F+aRNB;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id e9so3182705plh.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 17 Jan 2021 09:36:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=OEEpzpo5hndMjMA1VILS6Z3uHqD6e92Do9qHbiHntls=;
        b=G4F+aRNB2XDCDF32ERnnr7JOpbna3NVW7l45FIOfVyqg0ote0+jJ/MwxbBc0p5AC6o
         +B6a2BWBjmFhv7FzrEoeWOgHKO6YIqWLd05oXZW1G9zq5aCULL+wpSw/6AcnsH+oyeQm
         VF1ue/weZzX36VjT5rRNbWOripOUsueZmGwNRoeq9+or6K4lTl5ixPsPilyO9Xdj/ohy
         vNuVBt7SEbzEBRSHMmIHhD45QTFlpMaGwNl8P5Euf7aT1FT0idYcvXjXMmMqNfEvn6fI
         tUEWeTY3GsXWgK7xbshgr1GiFIFvC9GmD/d/RgU/H7QB5f2r99QyNx+9CxqgwrHOKDZF
         PneA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=OEEpzpo5hndMjMA1VILS6Z3uHqD6e92Do9qHbiHntls=;
        b=hQgfd3WmSF6dyBFW1XxSlsk4l3KFRDwq9sJSpnNhHNh1EqMYgX6Dw1XPLTyfdZ2IQv
         52tLeel6riYWdWEp1F7Y2em4H4avToALlOq+QWvZVaEwIFF6wGqetvmqmUIGPa3KNKZM
         zhbotlx2z2ErI7YV9sCsb/8hgJkNXK07YH+Ug6msMGdCYx4OEehO4daE02m52Zch5pf3
         u+gZh31P6NIlGCSbyRyAgP0KJ3KVkj6UbaP4qE5Bz6C/KYhEywIkYcSZXCrfm2YDj4BD
         YJoMm1QFjxbw7bFbaiDCyxoi/XgtklgyXyrPVhLqV59KErDPeblDAgCTEudAYp1vSqqO
         4s7A==
X-Gm-Message-State: AOAM533SAyt1Z1YYkhkKb3IvaOV4bb3OAngSCueR2VaTGi0d7RNYgwt2
	vh2Lcn4gKh+B7hiNBJyyrNU49njAdj8Yog==
X-Google-Smtp-Source: ABdhPJyaYw83qw13VuaH6uxpTXGBL8tEJiuYwO5v+6HojbtjpoLGH2Aj/LLPEp5ip9ySwMpx0NN73Q==
X-Received: by 2002:a17:90a:2a43:: with SMTP id d3mr10277213pjg.44.1610905006557;
        Sun, 17 Jan 2021 09:36:46 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:ed67:500f:ea8f:e947])
        by smtp.gmail.com with ESMTPSA id t4sm13661338pfe.212.2021.01.17.09.36.45
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jan 2021 09:36:46 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [gatesgarth 06/31] php: CVE-2020-7069
Date: Sun, 17 Jan 2021 09:36:11 -0800
Message-Id: <992e09f09a40e7a8d03c7c4b5adf40f821ed3774.1610904793.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1610904792.git.akuster808@gmail.com>
References: <cover.1610904792.git.akuster808@gmail.com>

From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>

Security Advisory

References
https://nvd.nist.gov/vuln/detail/CVE-2020-7069
https://bugs.php.net/patch-display.php?bug_id=79601&patch=openssl_aes_ccm_iv_fix&revision=latest

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit fa80193468745a11bc12d5845f66412a0d62e0e2)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../php/php/CVE-2020-7069.patch               | 158 ++++++++++++++++++
 meta-oe/recipes-devtools/php/php_7.4.9.bb     |   1 +
 2 files changed, 159 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/php/php/CVE-2020-7069.patch

diff --git a/meta-oe/recipes-devtools/php/php/CVE-2020-7069.patch b/meta-oe/recipes-devtools/php/php/CVE-2020-7069.patch
new file mode 100644
index 0000000000..0cf4d5ed60
--- /dev/null
+++ b/meta-oe/recipes-devtools/php/php/CVE-2020-7069.patch
@@ -0,0 +1,158 @@
+Subject: Fix bug #79601 (Wrong ciphertext/tag in AES-CCM encryption
+ for a 12 bytes IV)
+
+---
+ ext/openssl/openssl.c                      | 10 ++++-----
+ ext/openssl/tests/cipher_tests.inc         | 21 +++++++++++++++++
+ ext/openssl/tests/openssl_decrypt_ccm.phpt | 22 +++++++++++-------
+ ext/openssl/tests/openssl_encrypt_ccm.phpt | 26 ++++++++++++++--------
+ 4 files changed, 57 insertions(+), 22 deletions(-)
+
+diff --git a/ext/openssl/openssl.c b/ext/openssl/openssl.c
+index 04cb9b0f..fdad2c3b 100644
+--- a/ext/openssl/openssl.c
++++ b/ext/openssl/openssl.c
+@@ -6521,11 +6521,6 @@ static int php_openssl_validate_iv(char **piv, size_t *piv_len, size_t iv_requir
+ {
+ 	char *iv_new;
+ 
+-	/* Best case scenario, user behaved */
+-	if (*piv_len == iv_required_len) {
+-		return SUCCESS;
+-	}
+-
+ 	if (mode->is_aead) {
+ 		if (EVP_CIPHER_CTX_ctrl(cipher_ctx, mode->aead_ivlen_flag, *piv_len, NULL) != 1) {
+ 			php_error_docref(NULL, E_WARNING, "Setting of IV length for AEAD mode failed");
+@@ -6534,6 +6529,11 @@ static int php_openssl_validate_iv(char **piv, size_t *piv_len, size_t iv_requir
+ 		return SUCCESS;
+ 	}
+ 
++	/* Best case scenario, user behaved */
++	if (*piv_len == iv_required_len) {
++		return SUCCESS;
++	}
++
+ 	iv_new = ecalloc(1, iv_required_len + 1);
+ 
+ 	if (*piv_len == 0) {
+diff --git a/ext/openssl/tests/cipher_tests.inc b/ext/openssl/tests/cipher_tests.inc
+index b1e46b41..779bfa85 100644
+--- a/ext/openssl/tests/cipher_tests.inc
++++ b/ext/openssl/tests/cipher_tests.inc
+@@ -1,5 +1,26 @@
+ <?php
+ $php_openssl_cipher_tests = array(
++    'aes-128-ccm' => array(
++        array(
++            'key' => '404142434445464748494a4b4c4d4e4f',
++            'iv'  => '1011121314151617',
++            'aad' => '000102030405060708090a0b0c0d0e0f',
++            'tag' => '1fc64fbfaccd',
++            'pt'  => '202122232425262728292a2b2c2d2e2f',
++            'ct'  => 'd2a1f0e051ea5f62081a7792073d593d',
++        ),
++        array(
++            'key' => '404142434445464748494a4b4c4d4e4f',
++            'iv'  => '101112131415161718191a1b',
++            'aad' => '000102030405060708090a0b0c0d0e0f' .
++                     '10111213',
++            'tag' => '484392fbc1b09951',
++            'pt'  => '202122232425262728292a2b2c2d2e2f' .
++                     '3031323334353637',
++            'ct'  => 'e3b201a9f5b71a7a9b1ceaeccd97e70b' .
++                     '6176aad9a4428aa5',
++        ),
++    ),
+     'aes-256-ccm' => array(
+         array(
+             'key' => '1bde3251d41a8b5ea013c195ae128b21' .
+diff --git a/ext/openssl/tests/openssl_decrypt_ccm.phpt b/ext/openssl/tests/openssl_decrypt_ccm.phpt
+index a5f01b87..08ef5bb7 100644
+--- a/ext/openssl/tests/openssl_decrypt_ccm.phpt
++++ b/ext/openssl/tests/openssl_decrypt_ccm.phpt
+@@ -10,14 +10,16 @@ if (!in_array('aes-256-ccm', openssl_get_cipher_methods()))
+ --FILE--
+ <?php
+ require_once __DIR__ . "/cipher_tests.inc";
+-$method = 'aes-256-ccm';
+-$tests = openssl_get_cipher_tests($method);
++$methods = ['aes-128-ccm', 'aes-256-ccm'];
+ 
+-foreach ($tests as $idx => $test) {
+-    echo "TEST $idx\n";
+-    $pt = openssl_decrypt($test['ct'], $method, $test['key'], OPENSSL_RAW_DATA,
+-        $test['iv'], $test['tag'], $test['aad']);
+-    var_dump($test['pt'] === $pt);
++foreach ($methods as $method) {
++    $tests = openssl_get_cipher_tests($method);
++    foreach ($tests as $idx => $test) {
++        echo "$method - TEST $idx\n";
++        $pt = openssl_decrypt($test['ct'], $method, $test['key'], OPENSSL_RAW_DATA,
++            $test['iv'], $test['tag'], $test['aad']);
++        var_dump($test['pt'] === $pt);
++    }
+ }
+ 
+ // no IV
+@@ -32,7 +34,11 @@ var_dump(openssl_decrypt($test['ct'], $method, $test['key'], OPENSSL_RAW_DATA,
+ 
+ ?>
+ --EXPECTF--
+-TEST 0
++aes-128-ccm - TEST 0
++bool(true)
++aes-128-ccm - TEST 1
++bool(true)
++aes-256-ccm - TEST 0
+ bool(true)
+ 
+ Warning: openssl_decrypt(): Setting of IV length for AEAD mode failed in %s on line %d
+diff --git a/ext/openssl/tests/openssl_encrypt_ccm.phpt b/ext/openssl/tests/openssl_encrypt_ccm.phpt
+index fb5dbbc8..8c4c41f8 100644
+--- a/ext/openssl/tests/openssl_encrypt_ccm.phpt
++++ b/ext/openssl/tests/openssl_encrypt_ccm.phpt
+@@ -10,15 +10,17 @@ if (!in_array('aes-256-ccm', openssl_get_cipher_methods()))
+ --FILE--
+ <?php
+ require_once __DIR__ . "/cipher_tests.inc";
+-$method = 'aes-256-ccm';
+-$tests = openssl_get_cipher_tests($method);
++$methods = ['aes-128-ccm', 'aes-256-ccm'];
+ 
+-foreach ($tests as $idx => $test) {
+-    echo "TEST $idx\n";
+-    $ct = openssl_encrypt($test['pt'], $method, $test['key'], OPENSSL_RAW_DATA,
+-        $test['iv'], $tag, $test['aad'], strlen($test['tag']));
+-    var_dump($test['ct'] === $ct);
+-    var_dump($test['tag'] === $tag);
++foreach ($methods as $method) {
++    $tests = openssl_get_cipher_tests($method);
++    foreach ($tests as $idx => $test) {
++        echo "$method - TEST $idx\n";
++        $ct = openssl_encrypt($test['pt'], $method, $test['key'], OPENSSL_RAW_DATA,
++            $test['iv'], $tag, $test['aad'], strlen($test['tag']));
++        var_dump($test['ct'] === $ct);
++        var_dump($test['tag'] === $tag);
++    }
+ }
+ 
+ // Empty IV error
+@@ -32,7 +34,13 @@ var_dump(strlen($tag));
+ var_dump(openssl_encrypt('data', $method, 'password', 0, str_repeat('x', 16), $tag, '', 1024));
+ ?>
+ --EXPECTF--
+-TEST 0
++aes-128-ccm - TEST 0
++bool(true)
++bool(true)
++aes-128-ccm - TEST 1
++bool(true)
++bool(true)
++aes-256-ccm - TEST 0
+ bool(true)
+ bool(true)
+ 
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-devtools/php/php_7.4.9.bb b/meta-oe/recipes-devtools/php/php_7.4.9.bb
index bc58b5792e..25b8137924 100644
--- a/meta-oe/recipes-devtools/php/php_7.4.9.bb
+++ b/meta-oe/recipes-devtools/php/php_7.4.9.bb
@@ -31,6 +31,7 @@ SRC_URI_append_class-target = " \
             file://0001-opcache-config.m4-enable-opcache.patch \
             file://xfail_two_bug_tests.patch \
             file://CVE-2020-7070.patch \
+            file://CVE-2020-7069.patch \
           "
 
 S = "${WORKDIR}/php-${PV}"
-- 
2.17.1

