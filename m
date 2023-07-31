Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 129D7EB64DD
	for <webhook@archiver.kernel.org>; Mon, 31 Jul 2023 01:03:54 +0000 (UTC)
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
 by mx.groups.io with SMTP id smtpd.web10.85125.1690765423677998886
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Jul 2023 18:03:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=j12MG4/Z;
 spf=pass (domain: gmail.com, ip: 209.85.161.48, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-56cc3453e31so348136eaf.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 30 Jul 2023 18:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690765423; x=1691370223;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uMvrVupC8cclQvT+jlLaNSnOt/gIkcs925rvBotBIH4=;
        b=j12MG4/ZYB4WqxKfh7oK5iV9KLns3bIU7S3NBZziY/5B5rloXYKRi2svEuAmjJ8JO0
         Xf1JDLM586OOdLVFulBfmy821VAychQbMaBad1Rmzqn1aYSdmYbB7YJ/UevMO5Ogepe/
         iKeZuDquDDSH41v/kkiPgqNJH+7WPvi+RGBWo82C2c5AL626r4orTb7xMnlDd7MaJi5v
         Fdn58LOBaZkfmBFhV2Xtr0JmgvAAS+VWo+/HL0Qfqz/BJg0AjCPN5/TH61Eex13s1ufO
         6oT75M+CN0w0INQolUh5zT5i7uObW23LB1d/oUcAFgCIh0Jsv8Z98S/cWgzG70Lg5EQZ
         tCkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690765423; x=1691370223;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uMvrVupC8cclQvT+jlLaNSnOt/gIkcs925rvBotBIH4=;
        b=hyyxHOblqKAUKyTrdlS25xRWTh7IMIX69bPrJSNyQAhO5BGtcn+xchuNC4GYJRksmQ
         HQlJMXG71urdNBHiI9rrRxvuvAPL/mNdQBNxo5DywheZ1ymWst8thjLQKySkxKCZkKNj
         85WPD5O5sHvO5UxEVbfkU6Myebg9yt8NK3Cqjeq38VXceXY0ey0bSjdOK4mAIerH/ZJz
         v6Jq+60SmItvb1A3y+JA4wr/0P5UyGdeXA9iW6Al1N9LDbgzBSIRSsfT/Y7cQDnaw5nT
         pMRBrxKwaKnSVQQMUt7UCVWG5a3Dgi4JCBp62+JmVunDnMaqsxekX9gXKiC3YLwHNbgf
         NHsA==
X-Gm-Message-State: ABy/qLbb4NeHa/ahw16i02UA+giSdHbnleAMZY7Ej4TxHJp3flWc2OB6
	IuBAErCNMkm4zx0LDRdbfk912x/iXdgMXddmswfRpegGufPIsQ==
X-Google-Smtp-Source: APBJJlGk6ea84brSU2x+d3Mb9Ct/fdGmdJFJVOl6OaO1PcNE/1T5m79ZdNvE1pk4r8xOZY29t78ARwEc3oi06tVtKMg=
X-Received: by 2002:a4a:9b46:0:b0:56c:a41c:f264 with SMTP id
 e6-20020a4a9b46000000b0056ca41cf264mr2780282ook.8.1690765422628; Sun, 30 Jul
 2023 18:03:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230725190947.660933-1-tgamblin@baylibre.com> <20230725190947.660933-3-tgamblin@baylibre.com>
In-Reply-To: <20230725190947.660933-3-tgamblin@baylibre.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 30 Jul 2023 18:03:16 -0700
Message-ID: <CAMKF1soHg5oo-SbkFuqm-mZfPqqkxmiN5xNz+SeGUtL82Pp+Cg@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 3/7] python3-m2crypto: upgrade 0.38.0 -> 0.39.0
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 31 Jul 2023 01:03:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104077

Hi Trevor

I am seeing a failure on qemux86 on ubuntu 22.04 host and its fairly regula=
r.

https://errors.yoctoproject.org/Errors/Details/729506/

it seems rpmdeps is crashing with signal 9. I wonder if its something
to do with rpm changes we might have
got in core but, I can confirm that it was not an issue two weeks ago.
It worked ok on Jul 17th but broke on
Jul 27th CI builds.

On Tue, Jul 25, 2023 at 12:09=E2=80=AFPM Trevor Gamblin <tgamblin@baylibre.=
com> wrote:
>
> Remove the CVE-2020-25657 patch, as it is fixed in 0.39.0:
>
> [tgamblin@megalith m2crypto]$ git log --oneline --grep=3D"CVE-2020-25657"
> 84c5395 Mitigate the Bleichenbacher timing attacks in the RSA decryption =
API (CVE-2020-25657)
> [tgamblin@megalith m2crypto]$ git tag --contains 84c53958def0f510e92119fc=
a14d74f94215827a
> 0.39.0
>
> Changelog (https://gitlab.com/m2crypto/m2crypto/-/blob/master/CHANGES?ref=
_type=3Dheads):
>
> 0.39.0 - 2023-01-31
> -------------------
>
> - SUPPORT FOR PYTHON 2 HAS BEEN DEPRECATED AND IT WILL BE
>   COMPLETELY REMOVED IN THE NEXT RELEASE.
> - Remove dependency on parameterized and use unittest.subTest
>   instead.
> - Upgrade embedded six.py module to 1.16.0 (really tiny
>   inconsequential changes).
> - Make tests working on MacOS again (test_bio_membuf: Use fork)
> - Use OpenSSL_version_num() instead of unrealiable parsing of .h
>   file.
> - Mitigate the Bleichenbacher timing attacks in the RSA
>   decryption API (CVE-2020-25657)
> - Add functionality to extract EC key from public key + Update
>   tests
> - Worked around compatibility issues with OpenSSL 3.*
> - Support for Twisted has been deprecated (they have their own
>   SSL support anyway).
> - Generate TAP while testing.
> - Stop using GitHub for testing.
> - Accept a small deviation from time in the testsuite (for
>   systems with non-standard HZ kernel parameter).
> - Use the default BIO.__del__ rather tha overriding in BIO.File
>   (avoid a memleak).
> - Resolve "X509_Name.as_der() method from X509.py -> class
>   X509_Name caused segmentation fault"
>
> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> ---
>  .../python3-m2crypto/CVE-2020-25657.patch     | 176 ------------------
>  ...o_0.38.0.bb =3D> python3-m2crypto_0.39.0.bb} |   3 +-
>  2 files changed, 1 insertion(+), 178 deletions(-)
>  delete mode 100644 meta-python/recipes-devtools/python/python3-m2crypto/=
CVE-2020-25657.patch
>  rename meta-python/recipes-devtools/python/{python3-m2crypto_0.38.0.bb =
=3D> python3-m2crypto_0.39.0.bb} (92%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-m2crypto/CVE-202=
0-25657.patch b/meta-python/recipes-devtools/python/python3-m2crypto/CVE-20=
20-25657.patch
> deleted file mode 100644
> index 38ecd7a276..0000000000
> --- a/meta-python/recipes-devtools/python/python3-m2crypto/CVE-2020-25657=
.patch
> +++ /dev/null
> @@ -1,176 +0,0 @@
> -Backport patch to fix CVE-2020-25657.
> -
> -Upstream-Status: Backport [https://gitlab.com/m2crypto/m2crypto/-/commit=
/84c53958]
> -
> -Signed-off-by: Kai Kang <kai.kang@windriver.com>
> -
> -From 84c53958def0f510e92119fca14d74f94215827a Mon Sep 17 00:00:00 2001
> -From: =3D?UTF-8?q?Mat=3DC4=3D9Bj=3D20Cepl?=3D <mcepl@cepl.eu>
> -Date: Tue, 28 Jun 2022 21:17:01 +0200
> -Subject: [PATCH] Mitigate the Bleichenbacher timing attacks in the RSA
> - decryption API (CVE-2020-25657)
> -
> -Fixes #282
> ----
> - src/SWIG/_m2crypto_wrap.c | 20 ++++++++++++--------
> - src/SWIG/_rsa.i           | 20 ++++++++++++--------
> - tests/test_rsa.py         | 15 +++++++--------
> - 3 files changed, 31 insertions(+), 24 deletions(-)
> -
> -diff --git a/src/SWIG/_m2crypto_wrap.c b/src/SWIG/_m2crypto_wrap.c
> -index aba9eb6d..a9f30da9 100644
> ---- a/src/SWIG/_m2crypto_wrap.c
> -+++ b/src/SWIG/_m2crypto_wrap.c
> -@@ -7040,9 +7040,10 @@ PyObject *rsa_private_encrypt(RSA *rsa, PyObject =
*from, int padding) {
> -     tlen =3D RSA_private_encrypt(flen, (unsigned char *)fbuf,
> -         (unsigned char *)tbuf, rsa, padding);
> -     if (tlen =3D=3D -1) {
> --        m2_PyErr_Msg(_rsa_err);
> -+        ERR_clear_error();
> -+        PyErr_Clear();
> -         PyMem_Free(tbuf);
> --        return NULL;
> -+        Py_RETURN_NONE;
> -     }
> -
> -     ret =3D PyBytes_FromStringAndSize((const char *)tbuf, tlen);
> -@@ -7070,9 +7071,10 @@ PyObject *rsa_public_decrypt(RSA *rsa, PyObject *=
from, int padding) {
> -     tlen =3D RSA_public_decrypt(flen, (unsigned char *)fbuf,
> -         (unsigned char *)tbuf, rsa, padding);
> -     if (tlen =3D=3D -1) {
> --        m2_PyErr_Msg(_rsa_err);
> -+        ERR_clear_error();
> -+        PyErr_Clear();
> -         PyMem_Free(tbuf);
> --        return NULL;
> -+        Py_RETURN_NONE;
> -     }
> -
> -     ret =3D PyBytes_FromStringAndSize((const char *)tbuf, tlen);
> -@@ -7097,9 +7099,10 @@ PyObject *rsa_public_encrypt(RSA *rsa, PyObject *=
from, int padding) {
> -     tlen =3D RSA_public_encrypt(flen, (unsigned char *)fbuf,
> -         (unsigned char *)tbuf, rsa, padding);
> -     if (tlen =3D=3D -1) {
> --        m2_PyErr_Msg(_rsa_err);
> -+        ERR_clear_error();
> -+        PyErr_Clear();
> -         PyMem_Free(tbuf);
> --        return NULL;
> -+        Py_RETURN_NONE;
> -     }
> -
> -     ret =3D PyBytes_FromStringAndSize((const char *)tbuf, tlen);
> -@@ -7124,9 +7127,10 @@ PyObject *rsa_private_decrypt(RSA *rsa, PyObject =
*from, int padding) {
> -     tlen =3D RSA_private_decrypt(flen, (unsigned char *)fbuf,
> -         (unsigned char *)tbuf, rsa, padding);
> -     if (tlen =3D=3D -1) {
> --        m2_PyErr_Msg(_rsa_err);
> -+        ERR_clear_error();
> -+        PyErr_Clear();
> -         PyMem_Free(tbuf);
> --        return NULL;
> -+        Py_RETURN_NONE;
> -     }
> -     ret =3D PyBytes_FromStringAndSize((const char *)tbuf, tlen);
> -
> -diff --git a/src/SWIG/_rsa.i b/src/SWIG/_rsa.i
> -index bc714e01..1377b8be 100644
> ---- a/src/SWIG/_rsa.i
> -+++ b/src/SWIG/_rsa.i
> -@@ -239,9 +239,10 @@ PyObject *rsa_private_encrypt(RSA *rsa, PyObject *f=
rom, int padding) {
> -     tlen =3D RSA_private_encrypt(flen, (unsigned char *)fbuf,
> -         (unsigned char *)tbuf, rsa, padding);
> -     if (tlen =3D=3D -1) {
> --        m2_PyErr_Msg(_rsa_err);
> -+        ERR_clear_error();
> -+        PyErr_Clear();
> -         PyMem_Free(tbuf);
> --        return NULL;
> -+        Py_RETURN_NONE;
> -     }
> -
> -     ret =3D PyBytes_FromStringAndSize((const char *)tbuf, tlen);
> -@@ -269,9 +270,10 @@ PyObject *rsa_public_decrypt(RSA *rsa, PyObject *fr=
om, int padding) {
> -     tlen =3D RSA_public_decrypt(flen, (unsigned char *)fbuf,
> -         (unsigned char *)tbuf, rsa, padding);
> -     if (tlen =3D=3D -1) {
> --        m2_PyErr_Msg(_rsa_err);
> -+        ERR_clear_error();
> -+        PyErr_Clear();
> -         PyMem_Free(tbuf);
> --        return NULL;
> -+        Py_RETURN_NONE;
> -     }
> -
> -     ret =3D PyBytes_FromStringAndSize((const char *)tbuf, tlen);
> -@@ -296,9 +298,10 @@ PyObject *rsa_public_encrypt(RSA *rsa, PyObject *fr=
om, int padding) {
> -     tlen =3D RSA_public_encrypt(flen, (unsigned char *)fbuf,
> -         (unsigned char *)tbuf, rsa, padding);
> -     if (tlen =3D=3D -1) {
> --        m2_PyErr_Msg(_rsa_err);
> -+        ERR_clear_error();
> -+        PyErr_Clear();
> -         PyMem_Free(tbuf);
> --        return NULL;
> -+        Py_RETURN_NONE;
> -     }
> -
> -     ret =3D PyBytes_FromStringAndSize((const char *)tbuf, tlen);
> -@@ -323,9 +326,10 @@ PyObject *rsa_private_decrypt(RSA *rsa, PyObject *f=
rom, int padding) {
> -     tlen =3D RSA_private_decrypt(flen, (unsigned char *)fbuf,
> -         (unsigned char *)tbuf, rsa, padding);
> -     if (tlen =3D=3D -1) {
> --        m2_PyErr_Msg(_rsa_err);
> -+        ERR_clear_error();
> -+        PyErr_Clear();
> -         PyMem_Free(tbuf);
> --        return NULL;
> -+        Py_RETURN_NONE;
> -     }
> -     ret =3D PyBytes_FromStringAndSize((const char *)tbuf, tlen);
> -
> -diff --git a/tests/test_rsa.py b/tests/test_rsa.py
> -index 7bb3af75..5e75d681 100644
> ---- a/tests/test_rsa.py
> -+++ b/tests/test_rsa.py
> -@@ -109,8 +109,9 @@ class RSATestCase(unittest.TestCase):
> -         # The other paddings.
> -         for padding in self.s_padding_nok:
> -             p =3D getattr(RSA, padding)
> --            with self.assertRaises(RSA.RSAError):
> --                priv.private_encrypt(self.data, p)
> -+            # Exception disabled as a part of mitigation against CVE-20=
20-25657
> -+            # with self.assertRaises(RSA.RSAError):
> -+            priv.private_encrypt(self.data, p)
> -         # Type-check the data to be encrypted.
> -         with self.assertRaises(TypeError):
> -             priv.private_encrypt(self.gen_callback, RSA.pkcs1_padding)
> -@@ -127,10 +128,12 @@ class RSATestCase(unittest.TestCase):
> -             self.assertEqual(ptxt, self.data)
> -
> -         # no_padding
> --        with six.assertRaisesRegex(self, RSA.RSAError, 'data too small'=
):
> --            priv.public_encrypt(self.data, RSA.no_padding)
> -+        # Exception disabled as a part of mitigation against CVE-2020-2=
5657
> -+        # with six.assertRaisesRegex(self, RSA.RSAError, 'data too smal=
l'):
> -+        priv.public_encrypt(self.data, RSA.no_padding)
> -
> -         # Type-check the data to be encrypted.
> -+        # Exception disabled as a part of mitigation against CVE-2020-2=
5657
> -         with self.assertRaises(TypeError):
> -             priv.public_encrypt(self.gen_callback, RSA.pkcs1_padding)
> -
> -@@ -146,10 +149,6 @@ class RSATestCase(unittest.TestCase):
> -                          b'\000\000\000\003\001\000\001')  # aka 65537 =
aka 0xf4
> -         with self.assertRaises(RSA.RSAError):
> -             setattr(rsa, 'e', '\000\000\000\003\001\000\001')
> --        with self.assertRaises(RSA.RSAError):
> --            rsa.private_encrypt(1)
> --        with self.assertRaises(RSA.RSAError):
> --            rsa.private_decrypt(1)
> -         assert rsa.check_key()
> -
> -     def test_loadpub_bad(self):
> ---
> -GitLab
> -
> diff --git a/meta-python/recipes-devtools/python/python3-m2crypto_0.38.0.=
bb b/meta-python/recipes-devtools/python/python3-m2crypto_0.39.0.bb
> similarity index 92%
> rename from meta-python/recipes-devtools/python/python3-m2crypto_0.38.0.b=
b
> rename to meta-python/recipes-devtools/python/python3-m2crypto_0.39.0.bb
> index 40e3bfb316..3a4a700bf7 100644
> --- a/meta-python/recipes-devtools/python/python3-m2crypto_0.38.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-m2crypto_0.39.0.bb
> @@ -10,9 +10,8 @@ SRC_URI +=3D "file://0001-setup.py-link-in-sysroot-not-=
in-host-directories.patch \
>              file://cross-compile-platform.patch \
>              file://avoid-host-contamination.patch \
>              file://0001-setup.py-address-openssl-3.x-build-issue.patch \
> -            file://CVE-2020-25657.patch \
>              "
> -SRC_URI[sha256sum] =3D "99f2260a30901c949a8dc6d5f82cd5312ffb8abc92e76633=
baf231bbbcb2decb"
> +SRC_URI[sha256sum] =3D "24c0f471358b8b19ad4c8aa9da12e868030b65c1fdb3279d=
006df60c9501338a"
>
>  PYPI_PACKAGE =3D "M2Crypto"
>  inherit pypi siteinfo setuptools3
> --
> 2.41.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#104020): https://lists.openembedded.org/g/openembedde=
d-devel/message/104020
> Mute This Topic: https://lists.openembedded.org/mt/100356779/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

