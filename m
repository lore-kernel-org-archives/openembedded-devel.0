Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F486C001DF
	for <webhook@archiver.kernel.org>; Wed,  2 Aug 2023 19:23:07 +0000 (UTC)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
 by mx.groups.io with SMTP id smtpd.web11.5189.1691004186082294987
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Aug 2023 12:23:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=GV3iSyhN;
 spf=pass (domain: baylibre.com, ip: 209.85.210.48, mailfrom: tgamblin@baylibre.com)
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-6bb231f1817so170345a34.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 02 Aug 2023 12:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1691004185; x=1691608985;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MSNbiDsG2f6Lu9BUEqPAEzhTIEHBmeovoIKqFZsHQus=;
        b=GV3iSyhNu3kWfEUJ+doITeYgypiDvSnaoivPI9+zI/R/UICjfG5AWtxFCW+qOKSuYZ
         Q6NFMa8isLrZMwFRQcYYi+Ut8iXOyvguZuSWKGr2g8vvRzBe7A7ZVgp7+9lbcH9q/rGm
         RVxXEWd2oC5D/ZKSxK9u49HdG4P7NngkNENJlUgScAmH+DuUfbZ4XhuFZ9mOaBBy2Chq
         SMmqklRG5Fb2hkkUxVUFKkahnSWWN6lkiUb2d3eofZ9qEcZj+EAmNBGD7PM9HlYD7p0W
         03FkxpfUFWbL2SnWpeX+8hjtMUvKhvaDDLMwdCHKrpO1HHXjQz1cqW8nHcxg+hf/OyZT
         c/Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691004185; x=1691608985;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MSNbiDsG2f6Lu9BUEqPAEzhTIEHBmeovoIKqFZsHQus=;
        b=OLbJQknjtlUdBkTe9P0KTegw6mULhIsY2df343fvxYalJ1f/aowBBcaOD/ICj/NMXU
         SXQlYdwD+pViPawoIc8FPigsL/7BMCLvKrv4RL1Nlm1ucC99/NfIY3vE8GUnc/blzcOo
         B2VCFHPpTJIoyBcNRmR+y/TMd6Ivix/IVXoshiA8DSN6KKFu0An/GJcBVPfoSL/Q72Jn
         3db4XnZXRM/vltEN9subIMQjDBHo4A+1vrjpS3vEeJmfXIIU0nDzw6uedujMFvr2zizC
         sHtIsTnRRXhlKXWFFJsIKM48H/XDZ40vkg873sjQaZKPjYdRc4WajtTb1mnD9hoempsY
         az2A==
X-Gm-Message-State: ABy/qLZ7C5OUmkDrlIUsJD7HfhiQUrN6JaDMtsy+gCPo6Yr/nLGzfsBd
	UIQ/4x8/57zGCxqe9R/h/bBIXw==
X-Google-Smtp-Source: APBJJlF1EtkY8xjpF6Td7ahgJiHaWu9HzYUzrrc96/Z2+2oryG8SXJ85HeLOELw0M3VGAh7dal4xSQ==
X-Received: by 2002:a05:6830:12c8:b0:6b9:a84a:a381 with SMTP id a8-20020a05683012c800b006b9a84aa381mr15184538otq.36.1691004184971;
        Wed, 02 Aug 2023 12:23:04 -0700 (PDT)
Received: from ?IPV6:2001:1970:5b1f:ab00:d875:6297:4e81:e577? ([2001:1970:5b1f:ab00:d875:6297:4e81:e577])
        by smtp.gmail.com with ESMTPSA id h5-20020ac85485000000b004055d45e420sm5565535qtq.56.2023.08.02.12.23.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Aug 2023 12:23:04 -0700 (PDT)
Message-ID: <46176689-be43-820e-3d17-a4d749260388@baylibre.com>
Date: Wed, 2 Aug 2023 15:23:03 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [oe] [meta-python][PATCH 3/7] python3-m2crypto: upgrade 0.38.0 ->
 0.39.0
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20230725190947.660933-1-tgamblin@baylibre.com>
 <20230725190947.660933-3-tgamblin@baylibre.com>
 <CAMKF1soHg5oo-SbkFuqm-mZfPqqkxmiN5xNz+SeGUtL82Pp+Cg@mail.gmail.com>
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <CAMKF1soHg5oo-SbkFuqm-mZfPqqkxmiN5xNz+SeGUtL82Pp+Cg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Aug 2023 19:23:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104208


On 2023-07-30 21:03, Khem Raj wrote:
> Hi Trevor
>
> I am seeing a failure on qemux86 on ubuntu 22.04 host and its fairly regular.
>
> https://errors.yoctoproject.org/Errors/Details/729506/
>
> it seems rpmdeps is crashing with signal 9. I wonder if its something
> to do with rpm changes we might have
> got in core but, I can confirm that it was not an issue two weeks ago.
> It worked ok on Jul 17th but broke on
> Jul 27th CI builds.
Missed this until now. I see it's been merged; is this still an issue?
>
> On Tue, Jul 25, 2023 at 12:09 PM Trevor Gamblin <tgamblin@baylibre.com> wrote:
>> Remove the CVE-2020-25657 patch, as it is fixed in 0.39.0:
>>
>> [tgamblin@megalith m2crypto]$ git log --oneline --grep="CVE-2020-25657"
>> 84c5395 Mitigate the Bleichenbacher timing attacks in the RSA decryption API (CVE-2020-25657)
>> [tgamblin@megalith m2crypto]$ git tag --contains 84c53958def0f510e92119fca14d74f94215827a
>> 0.39.0
>>
>> Changelog (https://gitlab.com/m2crypto/m2crypto/-/blob/master/CHANGES?ref_type=heads):
>>
>> 0.39.0 - 2023-01-31
>> -------------------
>>
>> - SUPPORT FOR PYTHON 2 HAS BEEN DEPRECATED AND IT WILL BE
>>    COMPLETELY REMOVED IN THE NEXT RELEASE.
>> - Remove dependency on parameterized and use unittest.subTest
>>    instead.
>> - Upgrade embedded six.py module to 1.16.0 (really tiny
>>    inconsequential changes).
>> - Make tests working on MacOS again (test_bio_membuf: Use fork)
>> - Use OpenSSL_version_num() instead of unrealiable parsing of .h
>>    file.
>> - Mitigate the Bleichenbacher timing attacks in the RSA
>>    decryption API (CVE-2020-25657)
>> - Add functionality to extract EC key from public key + Update
>>    tests
>> - Worked around compatibility issues with OpenSSL 3.*
>> - Support for Twisted has been deprecated (they have their own
>>    SSL support anyway).
>> - Generate TAP while testing.
>> - Stop using GitHub for testing.
>> - Accept a small deviation from time in the testsuite (for
>>    systems with non-standard HZ kernel parameter).
>> - Use the default BIO.__del__ rather tha overriding in BIO.File
>>    (avoid a memleak).
>> - Resolve "X509_Name.as_der() method from X509.py -> class
>>    X509_Name caused segmentation fault"
>>
>> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
>> ---
>>   .../python3-m2crypto/CVE-2020-25657.patch     | 176 ------------------
>>   ...o_0.38.0.bb => python3-m2crypto_0.39.0.bb} |   3 +-
>>   2 files changed, 1 insertion(+), 178 deletions(-)
>>   delete mode 100644 meta-python/recipes-devtools/python/python3-m2crypto/CVE-2020-25657.patch
>>   rename meta-python/recipes-devtools/python/{python3-m2crypto_0.38.0.bb => python3-m2crypto_0.39.0.bb} (92%)
>>
>> diff --git a/meta-python/recipes-devtools/python/python3-m2crypto/CVE-2020-25657.patch b/meta-python/recipes-devtools/python/python3-m2crypto/CVE-2020-25657.patch
>> deleted file mode 100644
>> index 38ecd7a276..0000000000
>> --- a/meta-python/recipes-devtools/python/python3-m2crypto/CVE-2020-25657.patch
>> +++ /dev/null
>> @@ -1,176 +0,0 @@
>> -Backport patch to fix CVE-2020-25657.
>> -
>> -Upstream-Status: Backport [https://gitlab.com/m2crypto/m2crypto/-/commit/84c53958]
>> -
>> -Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> -
>> -From 84c53958def0f510e92119fca14d74f94215827a Mon Sep 17 00:00:00 2001
>> -From: =?UTF-8?q?Mat=C4=9Bj=20Cepl?= <mcepl@cepl.eu>
>> -Date: Tue, 28 Jun 2022 21:17:01 +0200
>> -Subject: [PATCH] Mitigate the Bleichenbacher timing attacks in the RSA
>> - decryption API (CVE-2020-25657)
>> -
>> -Fixes #282
>> ----
>> - src/SWIG/_m2crypto_wrap.c | 20 ++++++++++++--------
>> - src/SWIG/_rsa.i           | 20 ++++++++++++--------
>> - tests/test_rsa.py         | 15 +++++++--------
>> - 3 files changed, 31 insertions(+), 24 deletions(-)
>> -
>> -diff --git a/src/SWIG/_m2crypto_wrap.c b/src/SWIG/_m2crypto_wrap.c
>> -index aba9eb6d..a9f30da9 100644
>> ---- a/src/SWIG/_m2crypto_wrap.c
>> -+++ b/src/SWIG/_m2crypto_wrap.c
>> -@@ -7040,9 +7040,10 @@ PyObject *rsa_private_encrypt(RSA *rsa, PyObject *from, int padding) {
>> -     tlen = RSA_private_encrypt(flen, (unsigned char *)fbuf,
>> -         (unsigned char *)tbuf, rsa, padding);
>> -     if (tlen == -1) {
>> --        m2_PyErr_Msg(_rsa_err);
>> -+        ERR_clear_error();
>> -+        PyErr_Clear();
>> -         PyMem_Free(tbuf);
>> --        return NULL;
>> -+        Py_RETURN_NONE;
>> -     }
>> -
>> -     ret = PyBytes_FromStringAndSize((const char *)tbuf, tlen);
>> -@@ -7070,9 +7071,10 @@ PyObject *rsa_public_decrypt(RSA *rsa, PyObject *from, int padding) {
>> -     tlen = RSA_public_decrypt(flen, (unsigned char *)fbuf,
>> -         (unsigned char *)tbuf, rsa, padding);
>> -     if (tlen == -1) {
>> --        m2_PyErr_Msg(_rsa_err);
>> -+        ERR_clear_error();
>> -+        PyErr_Clear();
>> -         PyMem_Free(tbuf);
>> --        return NULL;
>> -+        Py_RETURN_NONE;
>> -     }
>> -
>> -     ret = PyBytes_FromStringAndSize((const char *)tbuf, tlen);
>> -@@ -7097,9 +7099,10 @@ PyObject *rsa_public_encrypt(RSA *rsa, PyObject *from, int padding) {
>> -     tlen = RSA_public_encrypt(flen, (unsigned char *)fbuf,
>> -         (unsigned char *)tbuf, rsa, padding);
>> -     if (tlen == -1) {
>> --        m2_PyErr_Msg(_rsa_err);
>> -+        ERR_clear_error();
>> -+        PyErr_Clear();
>> -         PyMem_Free(tbuf);
>> --        return NULL;
>> -+        Py_RETURN_NONE;
>> -     }
>> -
>> -     ret = PyBytes_FromStringAndSize((const char *)tbuf, tlen);
>> -@@ -7124,9 +7127,10 @@ PyObject *rsa_private_decrypt(RSA *rsa, PyObject *from, int padding) {
>> -     tlen = RSA_private_decrypt(flen, (unsigned char *)fbuf,
>> -         (unsigned char *)tbuf, rsa, padding);
>> -     if (tlen == -1) {
>> --        m2_PyErr_Msg(_rsa_err);
>> -+        ERR_clear_error();
>> -+        PyErr_Clear();
>> -         PyMem_Free(tbuf);
>> --        return NULL;
>> -+        Py_RETURN_NONE;
>> -     }
>> -     ret = PyBytes_FromStringAndSize((const char *)tbuf, tlen);
>> -
>> -diff --git a/src/SWIG/_rsa.i b/src/SWIG/_rsa.i
>> -index bc714e01..1377b8be 100644
>> ---- a/src/SWIG/_rsa.i
>> -+++ b/src/SWIG/_rsa.i
>> -@@ -239,9 +239,10 @@ PyObject *rsa_private_encrypt(RSA *rsa, PyObject *from, int padding) {
>> -     tlen = RSA_private_encrypt(flen, (unsigned char *)fbuf,
>> -         (unsigned char *)tbuf, rsa, padding);
>> -     if (tlen == -1) {
>> --        m2_PyErr_Msg(_rsa_err);
>> -+        ERR_clear_error();
>> -+        PyErr_Clear();
>> -         PyMem_Free(tbuf);
>> --        return NULL;
>> -+        Py_RETURN_NONE;
>> -     }
>> -
>> -     ret = PyBytes_FromStringAndSize((const char *)tbuf, tlen);
>> -@@ -269,9 +270,10 @@ PyObject *rsa_public_decrypt(RSA *rsa, PyObject *from, int padding) {
>> -     tlen = RSA_public_decrypt(flen, (unsigned char *)fbuf,
>> -         (unsigned char *)tbuf, rsa, padding);
>> -     if (tlen == -1) {
>> --        m2_PyErr_Msg(_rsa_err);
>> -+        ERR_clear_error();
>> -+        PyErr_Clear();
>> -         PyMem_Free(tbuf);
>> --        return NULL;
>> -+        Py_RETURN_NONE;
>> -     }
>> -
>> -     ret = PyBytes_FromStringAndSize((const char *)tbuf, tlen);
>> -@@ -296,9 +298,10 @@ PyObject *rsa_public_encrypt(RSA *rsa, PyObject *from, int padding) {
>> -     tlen = RSA_public_encrypt(flen, (unsigned char *)fbuf,
>> -         (unsigned char *)tbuf, rsa, padding);
>> -     if (tlen == -1) {
>> --        m2_PyErr_Msg(_rsa_err);
>> -+        ERR_clear_error();
>> -+        PyErr_Clear();
>> -         PyMem_Free(tbuf);
>> --        return NULL;
>> -+        Py_RETURN_NONE;
>> -     }
>> -
>> -     ret = PyBytes_FromStringAndSize((const char *)tbuf, tlen);
>> -@@ -323,9 +326,10 @@ PyObject *rsa_private_decrypt(RSA *rsa, PyObject *from, int padding) {
>> -     tlen = RSA_private_decrypt(flen, (unsigned char *)fbuf,
>> -         (unsigned char *)tbuf, rsa, padding);
>> -     if (tlen == -1) {
>> --        m2_PyErr_Msg(_rsa_err);
>> -+        ERR_clear_error();
>> -+        PyErr_Clear();
>> -         PyMem_Free(tbuf);
>> --        return NULL;
>> -+        Py_RETURN_NONE;
>> -     }
>> -     ret = PyBytes_FromStringAndSize((const char *)tbuf, tlen);
>> -
>> -diff --git a/tests/test_rsa.py b/tests/test_rsa.py
>> -index 7bb3af75..5e75d681 100644
>> ---- a/tests/test_rsa.py
>> -+++ b/tests/test_rsa.py
>> -@@ -109,8 +109,9 @@ class RSATestCase(unittest.TestCase):
>> -         # The other paddings.
>> -         for padding in self.s_padding_nok:
>> -             p = getattr(RSA, padding)
>> --            with self.assertRaises(RSA.RSAError):
>> --                priv.private_encrypt(self.data, p)
>> -+            # Exception disabled as a part of mitigation against CVE-2020-25657
>> -+            # with self.assertRaises(RSA.RSAError):
>> -+            priv.private_encrypt(self.data, p)
>> -         # Type-check the data to be encrypted.
>> -         with self.assertRaises(TypeError):
>> -             priv.private_encrypt(self.gen_callback, RSA.pkcs1_padding)
>> -@@ -127,10 +128,12 @@ class RSATestCase(unittest.TestCase):
>> -             self.assertEqual(ptxt, self.data)
>> -
>> -         # no_padding
>> --        with six.assertRaisesRegex(self, RSA.RSAError, 'data too small'):
>> --            priv.public_encrypt(self.data, RSA.no_padding)
>> -+        # Exception disabled as a part of mitigation against CVE-2020-25657
>> -+        # with six.assertRaisesRegex(self, RSA.RSAError, 'data too small'):
>> -+        priv.public_encrypt(self.data, RSA.no_padding)
>> -
>> -         # Type-check the data to be encrypted.
>> -+        # Exception disabled as a part of mitigation against CVE-2020-25657
>> -         with self.assertRaises(TypeError):
>> -             priv.public_encrypt(self.gen_callback, RSA.pkcs1_padding)
>> -
>> -@@ -146,10 +149,6 @@ class RSATestCase(unittest.TestCase):
>> -                          b'\000\000\000\003\001\000\001')  # aka 65537 aka 0xf4
>> -         with self.assertRaises(RSA.RSAError):
>> -             setattr(rsa, 'e', '\000\000\000\003\001\000\001')
>> --        with self.assertRaises(RSA.RSAError):
>> --            rsa.private_encrypt(1)
>> --        with self.assertRaises(RSA.RSAError):
>> --            rsa.private_decrypt(1)
>> -         assert rsa.check_key()
>> -
>> -     def test_loadpub_bad(self):
>> ---
>> -GitLab
>> -
>> diff --git a/meta-python/recipes-devtools/python/python3-m2crypto_0.38.0.bb b/meta-python/recipes-devtools/python/python3-m2crypto_0.39.0.bb
>> similarity index 92%
>> rename from meta-python/recipes-devtools/python/python3-m2crypto_0.38.0.bb
>> rename to meta-python/recipes-devtools/python/python3-m2crypto_0.39.0.bb
>> index 40e3bfb316..3a4a700bf7 100644
>> --- a/meta-python/recipes-devtools/python/python3-m2crypto_0.38.0.bb
>> +++ b/meta-python/recipes-devtools/python/python3-m2crypto_0.39.0.bb
>> @@ -10,9 +10,8 @@ SRC_URI += "file://0001-setup.py-link-in-sysroot-not-in-host-directories.patch \
>>               file://cross-compile-platform.patch \
>>               file://avoid-host-contamination.patch \
>>               file://0001-setup.py-address-openssl-3.x-build-issue.patch \
>> -            file://CVE-2020-25657.patch \
>>               "
>> -SRC_URI[sha256sum] = "99f2260a30901c949a8dc6d5f82cd5312ffb8abc92e76633baf231bbbcb2decb"
>> +SRC_URI[sha256sum] = "24c0f471358b8b19ad4c8aa9da12e868030b65c1fdb3279d006df60c9501338a"
>>
>>   PYPI_PACKAGE = "M2Crypto"
>>   inherit pypi siteinfo setuptools3
>> --
>> 2.41.0
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#104020): https://lists.openembedded.org/g/openembedded-devel/message/104020
>> Mute This Topic: https://lists.openembedded.org/mt/100356779/1997914
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

