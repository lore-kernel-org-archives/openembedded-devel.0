Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.6469.1619384088316792033
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 25 Apr 2021 13:54:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EyTc4OCT;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id a12so37617657pfc.7
        for <openembedded-devel@lists.openembedded.org>; Sun, 25 Apr 2021 13:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=fObbw6ClLP5/sHDBK6VhrL6R56lyZxINCtIjUBI20EI=;
        b=EyTc4OCTX+rbBMdcbXBik8lulLer4Umhn5z+Sqz1xrpkfpkUUvWzdIsTciHOUI0NXe
         BDr6+D7Ik8o/3cO8QH/npdMVTpb8sEBAUcsjQETH+RbbVgWjPWdBQCL45QGmO4BRkpjk
         a0ZhZaQnU36TxZ8tGLy9rA/qN9zVdNp4sZLPEsPkPh/Pn5JYfCv4rQc7i2jAq0uLEA8M
         Gac6lteZ50iCoRcU8uI87nh+19SJ7+6jBak8XT/tWIRQ/+GR+aP6RdfmKKm22MXA9RJc
         9LqSlwg0XnwCjsTaq5pm6cz78krLd+KiJOn64XTcOKc2YfATmliDrXAPQA0yzs+hLFDn
         a5fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=fObbw6ClLP5/sHDBK6VhrL6R56lyZxINCtIjUBI20EI=;
        b=SFGBLoOb1ICXa8gLANfXaPSEB870M/nUxge+9JH1B2T4ubpnWqeBbBVFAshTBg6vz3
         F3KkiNdFILWgZ3HPPH/QwA97uMUfCGFz0dZ+8DXj/fBFKtcQEk7avIBCf3FQAMwZy/Bl
         8uRQqKiT8wRZDoTAp0z7qvL/r9a/o4ATyCjCA0LJlyK2tbIB7XS37aOjKitb6DGBEpbb
         uPmp2zMT3RN8LAvK0TnlMfCihh76OhSujKjXDEujmZsZhTATEQ6tMNGkMcJMAIbqhKAx
         29/EPexR37J3qawgh0gRqfUzgmDKwJtCpD0zK7Y563/ioobqxUNOnawouftWtq7jh4Kh
         6opw==
X-Gm-Message-State: AOAM5316nqvpSQ2fa6GPaDG7W1vEVrZ+6lfgyZMSadn7eJrJ6f2n7OE3
	0/21SOxYpIYS226+zr3qs3PAWCnSSJK8yw==
X-Google-Smtp-Source: ABdhPJxn7PJctTWjXrSiFg7095Q6wKQ5yw3fzbN6GDPRy8c5ZEn0QM3RcNr1TAK55fqnDc8D1AEiIQ==
X-Received: by 2002:a63:dc49:: with SMTP id f9mr13670086pgj.361.1619384087434;
        Sun, 25 Apr 2021 13:54:47 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:880e:6a48:f6c3:8404? ([2601:202:4180:a5c0:880e:6a48:f6c3:8404])
        by smtp.gmail.com with ESMTPSA id u189sm9255548pfb.151.2021.04.25.13.54.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Apr 2021 13:54:46 -0700 (PDT)
Subject: Re: [oe] [meta-oe][hardknott][PATCH 1/2] php: Upgrade to 7.4.16
To: "Yu, Mingli" <mingli.yu@windriver.com>,
 openembedded-devel@lists.openembedded.org
References: <1678669C913490A8.14065@lists.openembedded.org>
 <67b43873-0bfb-b7ee-d8c9-509061869841@windriver.com>
From: "Armin Kuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <398fc81c-50cc-2a80-7ea9-3c72ab9d9909@gmail.com>
Date: Sun, 25 Apr 2021 13:54:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <67b43873-0bfb-b7ee-d8c9-509061869841@windriver.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 4/25/21 12:46 AM, Yu, Mingli wrote:
> Ping.
this is in stable/hardknott-nut.  Things take time to work themselves
through my build systems.

-armin
>
> Thanks,
>
> On 4/23/21 1:48 PM, Yu, Mingli wrote:
>> From: Mingli Yu <mingli.yu@windriver.com>
>>
>> License-Update: License updated (year updated)
>>
>> Fix some security issues such as CVE-2021-21702 and remove two
>> cve patches which already included in the new version.
>>
>> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>   .../php/php/CVE-2020-7069.patch               | 158 ------------------
>>   .../php/php/CVE-2020-7070.patch               |  24 ---
>>   .../php/{php_7.4.9.bb => php_7.4.16.bb}       |   7 +-
>>   3 files changed, 2 insertions(+), 187 deletions(-)
>>   delete mode 100644
>> meta-oe/recipes-devtools/php/php/CVE-2020-7069.patch
>>   delete mode 100644
>> meta-oe/recipes-devtools/php/php/CVE-2020-7070.patch
>>   rename meta-oe/recipes-devtools/php/{php_7.4.9.bb => php_7.4.16.bb}
>> (97%)
>>
>> diff --git a/meta-oe/recipes-devtools/php/php/CVE-2020-7069.patch
>> b/meta-oe/recipes-devtools/php/php/CVE-2020-7069.patch
>> deleted file mode 100644
>> index 0cf4d5ed6..000000000
>> --- a/meta-oe/recipes-devtools/php/php/CVE-2020-7069.patch
>> +++ /dev/null
>> @@ -1,158 +0,0 @@
>> -Subject: Fix bug #79601 (Wrong ciphertext/tag in AES-CCM encryption
>> - for a 12 bytes IV)
>> -
>> ----
>> - ext/openssl/openssl.c                      | 10 ++++-----
>> - ext/openssl/tests/cipher_tests.inc         | 21 +++++++++++++++++
>> - ext/openssl/tests/openssl_decrypt_ccm.phpt | 22 +++++++++++-------
>> - ext/openssl/tests/openssl_encrypt_ccm.phpt | 26 ++++++++++++++--------
>> - 4 files changed, 57 insertions(+), 22 deletions(-)
>> -
>> -diff --git a/ext/openssl/openssl.c b/ext/openssl/openssl.c
>> -index 04cb9b0f..fdad2c3b 100644
>> ---- a/ext/openssl/openssl.c
>> -+++ b/ext/openssl/openssl.c
>> -@@ -6521,11 +6521,6 @@ static int php_openssl_validate_iv(char
>> **piv, size_t *piv_len, size_t iv_requir
>> - {
>> -     char *iv_new;
>> -
>> --    /* Best case scenario, user behaved */
>> --    if (*piv_len == iv_required_len) {
>> --        return SUCCESS;
>> --    }
>> -- 
>> -     if (mode->is_aead) {
>> -         if (EVP_CIPHER_CTX_ctrl(cipher_ctx, mode->aead_ivlen_flag,
>> *piv_len, NULL) != 1) {
>> -             php_error_docref(NULL, E_WARNING, "Setting of IV length
>> for AEAD mode failed");
>> -@@ -6534,6 +6529,11 @@ static int php_openssl_validate_iv(char
>> **piv, size_t *piv_len, size_t iv_requir
>> -         return SUCCESS;
>> -     }
>> -
>> -+    /* Best case scenario, user behaved */
>> -+    if (*piv_len == iv_required_len) {
>> -+        return SUCCESS;
>> -+    }
>> -+
>> -     iv_new = ecalloc(1, iv_required_len + 1);
>> -
>> -     if (*piv_len == 0) {
>> -diff --git a/ext/openssl/tests/cipher_tests.inc
>> b/ext/openssl/tests/cipher_tests.inc
>> -index b1e46b41..779bfa85 100644
>> ---- a/ext/openssl/tests/cipher_tests.inc
>> -+++ b/ext/openssl/tests/cipher_tests.inc
>> -@@ -1,5 +1,26 @@
>> - <?php
>> - $php_openssl_cipher_tests = array(
>> -+    'aes-128-ccm' => array(
>> -+        array(
>> -+            'key' => '404142434445464748494a4b4c4d4e4f',
>> -+            'iv'  => '1011121314151617',
>> -+            'aad' => '000102030405060708090a0b0c0d0e0f',
>> -+            'tag' => '1fc64fbfaccd',
>> -+            'pt'  => '202122232425262728292a2b2c2d2e2f',
>> -+            'ct'  => 'd2a1f0e051ea5f62081a7792073d593d',
>> -+        ),
>> -+        array(
>> -+            'key' => '404142434445464748494a4b4c4d4e4f',
>> -+            'iv'  => '101112131415161718191a1b',
>> -+            'aad' => '000102030405060708090a0b0c0d0e0f' .
>> -+                     '10111213',
>> -+            'tag' => '484392fbc1b09951',
>> -+            'pt'  => '202122232425262728292a2b2c2d2e2f' .
>> -+                     '3031323334353637',
>> -+            'ct'  => 'e3b201a9f5b71a7a9b1ceaeccd97e70b' .
>> -+                     '6176aad9a4428aa5',
>> -+        ),
>> -+    ),
>> -     'aes-256-ccm' => array(
>> -         array(
>> -             'key' => '1bde3251d41a8b5ea013c195ae128b21' .
>> -diff --git a/ext/openssl/tests/openssl_decrypt_ccm.phpt
>> b/ext/openssl/tests/openssl_decrypt_ccm.phpt
>> -index a5f01b87..08ef5bb7 100644
>> ---- a/ext/openssl/tests/openssl_decrypt_ccm.phpt
>> -+++ b/ext/openssl/tests/openssl_decrypt_ccm.phpt
>> -@@ -10,14 +10,16 @@ if (!in_array('aes-256-ccm',
>> openssl_get_cipher_methods()))
>> - --FILE--
>> - <?php
>> - require_once __DIR__ . "/cipher_tests.inc";
>> --$method = 'aes-256-ccm';
>> --$tests = openssl_get_cipher_tests($method);
>> -+$methods = ['aes-128-ccm', 'aes-256-ccm'];
>> -
>> --foreach ($tests as $idx => $test) {
>> --    echo "TEST $idx\n";
>> --    $pt = openssl_decrypt($test['ct'], $method, $test['key'],
>> OPENSSL_RAW_DATA,
>> --        $test['iv'], $test['tag'], $test['aad']);
>> --    var_dump($test['pt'] === $pt);
>> -+foreach ($methods as $method) {
>> -+    $tests = openssl_get_cipher_tests($method);
>> -+    foreach ($tests as $idx => $test) {
>> -+        echo "$method - TEST $idx\n";
>> -+        $pt = openssl_decrypt($test['ct'], $method, $test['key'],
>> OPENSSL_RAW_DATA,
>> -+            $test['iv'], $test['tag'], $test['aad']);
>> -+        var_dump($test['pt'] === $pt);
>> -+    }
>> - }
>> -
>> - // no IV
>> -@@ -32,7 +34,11 @@ var_dump(openssl_decrypt($test['ct'], $method,
>> $test['key'], OPENSSL_RAW_DATA,
>> -
>> - ?>
>> - --EXPECTF--
>> --TEST 0
>> -+aes-128-ccm - TEST 0
>> -+bool(true)
>> -+aes-128-ccm - TEST 1
>> -+bool(true)
>> -+aes-256-ccm - TEST 0
>> - bool(true)
>> -
>> - Warning: openssl_decrypt(): Setting of IV length for AEAD mode
>> failed in %s on line %d
>> -diff --git a/ext/openssl/tests/openssl_encrypt_ccm.phpt
>> b/ext/openssl/tests/openssl_encrypt_ccm.phpt
>> -index fb5dbbc8..8c4c41f8 100644
>> ---- a/ext/openssl/tests/openssl_encrypt_ccm.phpt
>> -+++ b/ext/openssl/tests/openssl_encrypt_ccm.phpt
>> -@@ -10,15 +10,17 @@ if (!in_array('aes-256-ccm',
>> openssl_get_cipher_methods()))
>> - --FILE--
>> - <?php
>> - require_once __DIR__ . "/cipher_tests.inc";
>> --$method = 'aes-256-ccm';
>> --$tests = openssl_get_cipher_tests($method);
>> -+$methods = ['aes-128-ccm', 'aes-256-ccm'];
>> -
>> --foreach ($tests as $idx => $test) {
>> --    echo "TEST $idx\n";
>> --    $ct = openssl_encrypt($test['pt'], $method, $test['key'],
>> OPENSSL_RAW_DATA,
>> --        $test['iv'], $tag, $test['aad'], strlen($test['tag']));
>> --    var_dump($test['ct'] === $ct);
>> --    var_dump($test['tag'] === $tag);
>> -+foreach ($methods as $method) {
>> -+    $tests = openssl_get_cipher_tests($method);
>> -+    foreach ($tests as $idx => $test) {
>> -+        echo "$method - TEST $idx\n";
>> -+        $ct = openssl_encrypt($test['pt'], $method, $test['key'],
>> OPENSSL_RAW_DATA,
>> -+            $test['iv'], $tag, $test['aad'], strlen($test['tag']));
>> -+        var_dump($test['ct'] === $ct);
>> -+        var_dump($test['tag'] === $tag);
>> -+    }
>> - }
>> -
>> - // Empty IV error
>> -@@ -32,7 +34,13 @@ var_dump(strlen($tag));
>> - var_dump(openssl_encrypt('data', $method, 'password', 0,
>> str_repeat('x', 16), $tag, '', 1024));
>> - ?>
>> - --EXPECTF--
>> --TEST 0
>> -+aes-128-ccm - TEST 0
>> -+bool(true)
>> -+bool(true)
>> -+aes-128-ccm - TEST 1
>> -+bool(true)
>> -+bool(true)
>> -+aes-256-ccm - TEST 0
>> - bool(true)
>> - bool(true)
>> -
>> ---
>> -2.25.1
>> -
>> diff --git a/meta-oe/recipes-devtools/php/php/CVE-2020-7070.patch
>> b/meta-oe/recipes-devtools/php/php/CVE-2020-7070.patch
>> deleted file mode 100644
>> index e5b527f98..000000000
>> --- a/meta-oe/recipes-devtools/php/php/CVE-2020-7070.patch
>> +++ /dev/null
>> @@ -1,24 +0,0 @@
>> -Subject: Patch fix-urldecode for HTTP related Bug #79699
>> -
>> ----
>> - main/php_variables.c | 4 +++-
>> - 1 file changed, 3 insertions(+), 1 deletion(-)
>> -
>> -diff --git a/main/php_variables.c b/main/php_variables.c
>> -index 1a40c2a1..cbdc7cf1 100644
>> ---- a/main/php_variables.c
>> -+++ b/main/php_variables.c
>> -@@ -514,7 +514,9 @@ SAPI_API
>> SAPI_TREAT_DATA_FUNC(php_default_treat_data)
>> -         }
>> -
>> -         val = estrndup(val, val_len);
>> --        php_url_decode(var, strlen(var));
>> -+        if (arg != PARSE_COOKIE) {
>> -+            php_url_decode(var, strlen(var));
>> -+        }
>> -         if (sapi_module.input_filter(arg, var, &val, val_len,
>> &new_val_len)) {
>> -             php_register_variable_safe(var, val, new_val_len, &array);
>> -         }
>> ---
>> -2.25.1
>> -
>> diff --git a/meta-oe/recipes-devtools/php/php_7.4.9.bb
>> b/meta-oe/recipes-devtools/php/php_7.4.16.bb
>> similarity index 97%
>> rename from meta-oe/recipes-devtools/php/php_7.4.9.bb
>> rename to meta-oe/recipes-devtools/php/php_7.4.16.bb
>> index e19d5dd21..821d9cd04 100644
>> --- a/meta-oe/recipes-devtools/php/php_7.4.9.bb
>> +++ b/meta-oe/recipes-devtools/php/php_7.4.16.bb
>> @@ -3,7 +3,7 @@ HOMEPAGE = "http://www.php.net"
>>   SECTION = "console/network"
>>     LICENSE = "PHP-3.0"
>> -LIC_FILES_CHKSUM =
>> "file://LICENSE;md5=7e571b888d585b31f9ef5edcc647fa30"
>> +LIC_FILES_CHKSUM =
>> "file://LICENSE;md5=99532e0f6620bc9bca34f12fadaee33c"
>>     BBCLASSEXTEND = "native"
>>   DEPENDS = "zlib bzip2 libxml2 virtual/libiconv php-native
>> lemon-native"
>> @@ -30,13 +30,10 @@ SRC_URI_append_class-target = " \
>>               file://phar-makefile.patch \
>>               file://0001-opcache-config.m4-enable-opcache.patch \
>>               file://xfail_two_bug_tests.patch \
>> -            file://CVE-2020-7070.patch \
>> -            file://CVE-2020-7069.patch \
>>             "
>>     S = "${WORKDIR}/php-${PV}"
>> -SRC_URI[md5sum] = "e68a66c54b080d108831f6dc2e1e403d"
>> -SRC_URI[sha256sum] =
>> "2e270958a4216480da7886743438ccc92b6acf32ea96fefda88d07e0a5095deb"
>> +SRC_URI[sha256sum] =
>> "85710f007cfd0fae94e13a02a3a036f4e81ef43693260cae8a2e1ca93659ce3e"
>>     inherit autotools pkgconfig python3native gettext
>>  
>>
>>
>>
>>
>
> 
>

