Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80DCCC001B0
	for <webhook@archiver.kernel.org>; Mon,  7 Aug 2023 18:25:24 +0000 (UTC)
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
 by mx.groups.io with SMTP id smtpd.web11.42580.1691432723768549632
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Aug 2023 11:25:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=EAe7qNvb;
 spf=pass (domain: gmail.com, ip: 209.85.167.176, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-3a426e70575so2655179b6e.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 07 Aug 2023 11:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691432723; x=1692037523;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FTtdgBHzbZefzo3cNxJ5vpL87+14KoIN/yH2Efh5CLI=;
        b=EAe7qNvbe4RpJ2dFNncYUutuV3Gy+nm1lSngo+MLB+iGVs+/Z721+EnGBs4HP14wzr
         5bbOZmzg+qJqkdhVCfG3FRYaG26fe5bvwuiSA0x7uCuukwr4gnpwy6isKCKxg4e4q55Q
         krvZRDHeCNSIoOI+QKJcxyBTujlH3vc6gJylj9PvwbxHFgtqKQtEUx4/zpk5ahRACSn0
         ApNQ7olmj40Gs4WmxfmWrHqwNPRtH95hlTJI+UjJD5y0Cz3uU1bUrpOlepT/E4Wq70D6
         oBGseOl0gchQ1If1SdSWINZ9srctarbWvFf3cXP0BezmIJsIRYKsDt/qpeN2EOlpDyF5
         FPeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691432723; x=1692037523;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FTtdgBHzbZefzo3cNxJ5vpL87+14KoIN/yH2Efh5CLI=;
        b=HQXJXwmHP4vmgzmzr/yyfy6Aq1IwO9pa1vD/S3Zi37Fk7q/eZ0Kd6nmqeXAshsbkNg
         ETqwf46wDCzWDxlIwobCG+UZyO39UfhTaHPNGvbwjFXFliMbyqUTOzhtseY5d5bgao56
         pg/vzFqtNEE452YxEETMm4UUmmS8Ne7Lz6yuHDZO1iRaJIimXLxuj+eL8HNHN3zZvX0n
         0u8pFFU0JDlViO/3OkIotDrj3th1ruH50ePacWAntPayVD3RsNfLhsehcqJBVbYiR5Px
         meHgp1yMg8PZa2ls7Zol3GowaLeZ5gUOpOTOyRwuNC2OGjpkw6HoPBkKz9jLxU6zUcH4
         dJsw==
X-Gm-Message-State: AOJu0Yx084EbrQNPsn7FNFsNPxEyD5DOaEf1bMWnuEj/ufIWu3zWablt
	WzkvpKjiy06cNRl1l6KGZw/eUt9gEDck3WbpPPU=
X-Google-Smtp-Source: AGHT+IFeHdP2t2EksZ2mJ0w4HWK0IFayiXjHg+Irem4B/U8Qd153kVZP5RRsXNyGSpmmP3QjRfoRUKNFh3eqX7DnKfY=
X-Received: by 2002:aca:1314:0:b0:3a4:6691:9340 with SMTP id
 e20-20020aca1314000000b003a466919340mr9019946oii.41.1691432722737; Mon, 07
 Aug 2023 11:25:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230725190947.660933-1-tgamblin@baylibre.com>
 <20230725190947.660933-3-tgamblin@baylibre.com> <CAMKF1soHg5oo-SbkFuqm-mZfPqqkxmiN5xNz+SeGUtL82Pp+Cg@mail.gmail.com>
 <46176689-be43-820e-3d17-a4d749260388@baylibre.com> <CAMKF1sqAzVfgx8gEH2hY5F=6pjQyzAyCRQNjbD2B92UJSzDbgA@mail.gmail.com>
 <0b698575-a155-fbfa-71c0-56e499e499e1@baylibre.com>
In-Reply-To: <0b698575-a155-fbfa-71c0-56e499e499e1@baylibre.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 7 Aug 2023 11:24:56 -0700
Message-ID: <CAMKF1spHM3XBaF=gFiz+jW8tTfrJERGSL0RdR42=T6YEX4YJog@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 3/7] python3-m2crypto: upgrade 0.38.0 -> 0.39.0
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Aug 2023 18:25:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104307

On Thu, Aug 3, 2023 at 7:07=E2=80=AFAM Trevor Gamblin <tgamblin@baylibre.co=
m> wrote:
>
>
> On 2023-08-02 16:44, Khem Raj wrote:
> > On Wed, Aug 2, 2023 at 12:23=E2=80=AFPM Trevor Gamblin <tgamblin@baylib=
re.com> wrote:
> >>
> >> On 2023-07-30 21:03, Khem Raj wrote:
> >>> Hi Trevor
> >>>
> >>> I am seeing a failure on qemux86 on ubuntu 22.04 host and its fairly =
regular.
> >>>
> >>> https://errors.yoctoproject.org/Errors/Details/729506/
> >>>
> >>> it seems rpmdeps is crashing with signal 9. I wonder if its something
> >>> to do with rpm changes we might have
> >>> got in core but, I can confirm that it was not an issue two weeks ago=
.
> >>> It worked ok on Jul 17th but broke on
> >>> Jul 27th CI builds.
> >> Missed this until now. I see it's been merged; is this still an issue?
> > yes it still is.
> Hmm, I can't seem to reproduce it yet. Do you want to revert the patch
> for now?

A reboot of the builder has fixed this issue. I am bemused.

> >>> On Tue, Jul 25, 2023 at 12:09=E2=80=AFPM Trevor Gamblin <tgamblin@bay=
libre.com> wrote:
> >>>> Remove the CVE-2020-25657 patch, as it is fixed in 0.39.0:
> >>>>
> >>>> [tgamblin@megalith m2crypto]$ git log --oneline --grep=3D"CVE-2020-2=
5657"
> >>>> 84c5395 Mitigate the Bleichenbacher timing attacks in the RSA decryp=
tion API (CVE-2020-25657)
> >>>> [tgamblin@megalith m2crypto]$ git tag --contains 84c53958def0f510e92=
119fca14d74f94215827a
> >>>> 0.39.0
> >>>>
> >>>> Changelog (https://gitlab.com/m2crypto/m2crypto/-/blob/master/CHANGE=
S?ref_type=3Dheads):
> >>>>
> >>>> 0.39.0 - 2023-01-31
> >>>> -------------------
> >>>>
> >>>> - SUPPORT FOR PYTHON 2 HAS BEEN DEPRECATED AND IT WILL BE
> >>>>     COMPLETELY REMOVED IN THE NEXT RELEASE.
> >>>> - Remove dependency on parameterized and use unittest.subTest
> >>>>     instead.
> >>>> - Upgrade embedded six.py module to 1.16.0 (really tiny
> >>>>     inconsequential changes).
> >>>> - Make tests working on MacOS again (test_bio_membuf: Use fork)
> >>>> - Use OpenSSL_version_num() instead of unrealiable parsing of .h
> >>>>     file.
> >>>> - Mitigate the Bleichenbacher timing attacks in the RSA
> >>>>     decryption API (CVE-2020-25657)
> >>>> - Add functionality to extract EC key from public key + Update
> >>>>     tests
> >>>> - Worked around compatibility issues with OpenSSL 3.*
> >>>> - Support for Twisted has been deprecated (they have their own
> >>>>     SSL support anyway).
> >>>> - Generate TAP while testing.
> >>>> - Stop using GitHub for testing.
> >>>> - Accept a small deviation from time in the testsuite (for
> >>>>     systems with non-standard HZ kernel parameter).
> >>>> - Use the default BIO.__del__ rather tha overriding in BIO.File
> >>>>     (avoid a memleak).
> >>>> - Resolve "X509_Name.as_der() method from X509.py -> class
> >>>>     X509_Name caused segmentation fault"
> >>>>
> >>>> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> >>>> ---
> >>>>    .../python3-m2crypto/CVE-2020-25657.patch     | 176 -------------=
-----
> >>>>    ...o_0.38.0.bb =3D> python3-m2crypto_0.39.0.bb} |   3 +-
> >>>>    2 files changed, 1 insertion(+), 178 deletions(-)
> >>>>    delete mode 100644 meta-python/recipes-devtools/python/python3-m2=
crypto/CVE-2020-25657.patch
> >>>>    rename meta-python/recipes-devtools/python/{python3-m2crypto_0.38=
.0.bb =3D> python3-m2crypto_0.39.0.bb} (92%)
> >>>>
> >>>> diff --git a/meta-python/recipes-devtools/python/python3-m2crypto/CV=
E-2020-25657.patch b/meta-python/recipes-devtools/python/python3-m2crypto/C=
VE-2020-25657.patch
> >>>> deleted file mode 100644
> >>>> index 38ecd7a276..0000000000
> >>>> --- a/meta-python/recipes-devtools/python/python3-m2crypto/CVE-2020-=
25657.patch
> >>>> +++ /dev/null
> >>>> @@ -1,176 +0,0 @@
> >>>> -Backport patch to fix CVE-2020-25657.
> >>>> -
> >>>> -Upstream-Status: Backport [https://gitlab.com/m2crypto/m2crypto/-/c=
ommit/84c53958]
> >>>> -
> >>>> -Signed-off-by: Kai Kang <kai.kang@windriver.com>
> >>>> -
> >>>> -From 84c53958def0f510e92119fca14d74f94215827a Mon Sep 17 00:00:00 2=
001
> >>>> -From: =3D?UTF-8?q?Mat=3DC4=3D9Bj=3D20Cepl?=3D <mcepl@cepl.eu>
> >>>> -Date: Tue, 28 Jun 2022 21:17:01 +0200
> >>>> -Subject: [PATCH] Mitigate the Bleichenbacher timing attacks in the =
RSA
> >>>> - decryption API (CVE-2020-25657)
> >>>> -
> >>>> -Fixes #282
> >>>> ----
> >>>> - src/SWIG/_m2crypto_wrap.c | 20 ++++++++++++--------
> >>>> - src/SWIG/_rsa.i           | 20 ++++++++++++--------
> >>>> - tests/test_rsa.py         | 15 +++++++--------
> >>>> - 3 files changed, 31 insertions(+), 24 deletions(-)
> >>>> -
> >>>> -diff --git a/src/SWIG/_m2crypto_wrap.c b/src/SWIG/_m2crypto_wrap.c
> >>>> -index aba9eb6d..a9f30da9 100644
> >>>> ---- a/src/SWIG/_m2crypto_wrap.c
> >>>> -+++ b/src/SWIG/_m2crypto_wrap.c
> >>>> -@@ -7040,9 +7040,10 @@ PyObject *rsa_private_encrypt(RSA *rsa, PyOb=
ject *from, int padding) {
> >>>> -     tlen =3D RSA_private_encrypt(flen, (unsigned char *)fbuf,
> >>>> -         (unsigned char *)tbuf, rsa, padding);
> >>>> -     if (tlen =3D=3D -1) {
> >>>> --        m2_PyErr_Msg(_rsa_err);
> >>>> -+        ERR_clear_error();
> >>>> -+        PyErr_Clear();
> >>>> -         PyMem_Free(tbuf);
> >>>> --        return NULL;
> >>>> -+        Py_RETURN_NONE;
> >>>> -     }
> >>>> -
> >>>> -     ret =3D PyBytes_FromStringAndSize((const char *)tbuf, tlen);
> >>>> -@@ -7070,9 +7071,10 @@ PyObject *rsa_public_decrypt(RSA *rsa, PyObj=
ect *from, int padding) {
> >>>> -     tlen =3D RSA_public_decrypt(flen, (unsigned char *)fbuf,
> >>>> -         (unsigned char *)tbuf, rsa, padding);
> >>>> -     if (tlen =3D=3D -1) {
> >>>> --        m2_PyErr_Msg(_rsa_err);
> >>>> -+        ERR_clear_error();
> >>>> -+        PyErr_Clear();
> >>>> -         PyMem_Free(tbuf);
> >>>> --        return NULL;
> >>>> -+        Py_RETURN_NONE;
> >>>> -     }
> >>>> -
> >>>> -     ret =3D PyBytes_FromStringAndSize((const char *)tbuf, tlen);
> >>>> -@@ -7097,9 +7099,10 @@ PyObject *rsa_public_encrypt(RSA *rsa, PyObj=
ect *from, int padding) {
> >>>> -     tlen =3D RSA_public_encrypt(flen, (unsigned char *)fbuf,
> >>>> -         (unsigned char *)tbuf, rsa, padding);
> >>>> -     if (tlen =3D=3D -1) {
> >>>> --        m2_PyErr_Msg(_rsa_err);
> >>>> -+        ERR_clear_error();
> >>>> -+        PyErr_Clear();
> >>>> -         PyMem_Free(tbuf);
> >>>> --        return NULL;
> >>>> -+        Py_RETURN_NONE;
> >>>> -     }
> >>>> -
> >>>> -     ret =3D PyBytes_FromStringAndSize((const char *)tbuf, tlen);
> >>>> -@@ -7124,9 +7127,10 @@ PyObject *rsa_private_decrypt(RSA *rsa, PyOb=
ject *from, int padding) {
> >>>> -     tlen =3D RSA_private_decrypt(flen, (unsigned char *)fbuf,
> >>>> -         (unsigned char *)tbuf, rsa, padding);
> >>>> -     if (tlen =3D=3D -1) {
> >>>> --        m2_PyErr_Msg(_rsa_err);
> >>>> -+        ERR_clear_error();
> >>>> -+        PyErr_Clear();
> >>>> -         PyMem_Free(tbuf);
> >>>> --        return NULL;
> >>>> -+        Py_RETURN_NONE;
> >>>> -     }
> >>>> -     ret =3D PyBytes_FromStringAndSize((const char *)tbuf, tlen);
> >>>> -
> >>>> -diff --git a/src/SWIG/_rsa.i b/src/SWIG/_rsa.i
> >>>> -index bc714e01..1377b8be 100644
> >>>> ---- a/src/SWIG/_rsa.i
> >>>> -+++ b/src/SWIG/_rsa.i
> >>>> -@@ -239,9 +239,10 @@ PyObject *rsa_private_encrypt(RSA *rsa, PyObje=
ct *from, int padding) {
> >>>> -     tlen =3D RSA_private_encrypt(flen, (unsigned char *)fbuf,
> >>>> -         (unsigned char *)tbuf, rsa, padding);
> >>>> -     if (tlen =3D=3D -1) {
> >>>> --        m2_PyErr_Msg(_rsa_err);
> >>>> -+        ERR_clear_error();
> >>>> -+        PyErr_Clear();
> >>>> -         PyMem_Free(tbuf);
> >>>> --        return NULL;
> >>>> -+        Py_RETURN_NONE;
> >>>> -     }
> >>>> -
> >>>> -     ret =3D PyBytes_FromStringAndSize((const char *)tbuf, tlen);
> >>>> -@@ -269,9 +270,10 @@ PyObject *rsa_public_decrypt(RSA *rsa, PyObjec=
t *from, int padding) {
> >>>> -     tlen =3D RSA_public_decrypt(flen, (unsigned char *)fbuf,
> >>>> -         (unsigned char *)tbuf, rsa, padding);
> >>>> -     if (tlen =3D=3D -1) {
> >>>> --        m2_PyErr_Msg(_rsa_err);
> >>>> -+        ERR_clear_error();
> >>>> -+        PyErr_Clear();
> >>>> -         PyMem_Free(tbuf);
> >>>> --        return NULL;
> >>>> -+        Py_RETURN_NONE;
> >>>> -     }
> >>>> -
> >>>> -     ret =3D PyBytes_FromStringAndSize((const char *)tbuf, tlen);
> >>>> -@@ -296,9 +298,10 @@ PyObject *rsa_public_encrypt(RSA *rsa, PyObjec=
t *from, int padding) {
> >>>> -     tlen =3D RSA_public_encrypt(flen, (unsigned char *)fbuf,
> >>>> -         (unsigned char *)tbuf, rsa, padding);
> >>>> -     if (tlen =3D=3D -1) {
> >>>> --        m2_PyErr_Msg(_rsa_err);
> >>>> -+        ERR_clear_error();
> >>>> -+        PyErr_Clear();
> >>>> -         PyMem_Free(tbuf);
> >>>> --        return NULL;
> >>>> -+        Py_RETURN_NONE;
> >>>> -     }
> >>>> -
> >>>> -     ret =3D PyBytes_FromStringAndSize((const char *)tbuf, tlen);
> >>>> -@@ -323,9 +326,10 @@ PyObject *rsa_private_decrypt(RSA *rsa, PyObje=
ct *from, int padding) {
> >>>> -     tlen =3D RSA_private_decrypt(flen, (unsigned char *)fbuf,
> >>>> -         (unsigned char *)tbuf, rsa, padding);
> >>>> -     if (tlen =3D=3D -1) {
> >>>> --        m2_PyErr_Msg(_rsa_err);
> >>>> -+        ERR_clear_error();
> >>>> -+        PyErr_Clear();
> >>>> -         PyMem_Free(tbuf);
> >>>> --        return NULL;
> >>>> -+        Py_RETURN_NONE;
> >>>> -     }
> >>>> -     ret =3D PyBytes_FromStringAndSize((const char *)tbuf, tlen);
> >>>> -
> >>>> -diff --git a/tests/test_rsa.py b/tests/test_rsa.py
> >>>> -index 7bb3af75..5e75d681 100644
> >>>> ---- a/tests/test_rsa.py
> >>>> -+++ b/tests/test_rsa.py
> >>>> -@@ -109,8 +109,9 @@ class RSATestCase(unittest.TestCase):
> >>>> -         # The other paddings.
> >>>> -         for padding in self.s_padding_nok:
> >>>> -             p =3D getattr(RSA, padding)
> >>>> --            with self.assertRaises(RSA.RSAError):
> >>>> --                priv.private_encrypt(self.data, p)
> >>>> -+            # Exception disabled as a part of mitigation against C=
VE-2020-25657
> >>>> -+            # with self.assertRaises(RSA.RSAError):
> >>>> -+            priv.private_encrypt(self.data, p)
> >>>> -         # Type-check the data to be encrypted.
> >>>> -         with self.assertRaises(TypeError):
> >>>> -             priv.private_encrypt(self.gen_callback, RSA.pkcs1_padd=
ing)
> >>>> -@@ -127,10 +128,12 @@ class RSATestCase(unittest.TestCase):
> >>>> -             self.assertEqual(ptxt, self.data)
> >>>> -
> >>>> -         # no_padding
> >>>> --        with six.assertRaisesRegex(self, RSA.RSAError, 'data too s=
mall'):
> >>>> --            priv.public_encrypt(self.data, RSA.no_padding)
> >>>> -+        # Exception disabled as a part of mitigation against CVE-2=
020-25657
> >>>> -+        # with six.assertRaisesRegex(self, RSA.RSAError, 'data too=
 small'):
> >>>> -+        priv.public_encrypt(self.data, RSA.no_padding)
> >>>> -
> >>>> -         # Type-check the data to be encrypted.
> >>>> -+        # Exception disabled as a part of mitigation against CVE-2=
020-25657
> >>>> -         with self.assertRaises(TypeError):
> >>>> -             priv.public_encrypt(self.gen_callback, RSA.pkcs1_paddi=
ng)
> >>>> -
> >>>> -@@ -146,10 +149,6 @@ class RSATestCase(unittest.TestCase):
> >>>> -                          b'\000\000\000\003\001\000\001')  # aka 6=
5537 aka 0xf4
> >>>> -         with self.assertRaises(RSA.RSAError):
> >>>> -             setattr(rsa, 'e', '\000\000\000\003\001\000\001')
> >>>> --        with self.assertRaises(RSA.RSAError):
> >>>> --            rsa.private_encrypt(1)
> >>>> --        with self.assertRaises(RSA.RSAError):
> >>>> --            rsa.private_decrypt(1)
> >>>> -         assert rsa.check_key()
> >>>> -
> >>>> -     def test_loadpub_bad(self):
> >>>> ---
> >>>> -GitLab
> >>>> -
> >>>> diff --git a/meta-python/recipes-devtools/python/python3-m2crypto_0.=
38.0.bb b/meta-python/recipes-devtools/python/python3-m2crypto_0.39.0.bb
> >>>> similarity index 92%
> >>>> rename from meta-python/recipes-devtools/python/python3-m2crypto_0.3=
8.0.bb
> >>>> rename to meta-python/recipes-devtools/python/python3-m2crypto_0.39.=
0.bb
> >>>> index 40e3bfb316..3a4a700bf7 100644
> >>>> --- a/meta-python/recipes-devtools/python/python3-m2crypto_0.38.0.bb
> >>>> +++ b/meta-python/recipes-devtools/python/python3-m2crypto_0.39.0.bb
> >>>> @@ -10,9 +10,8 @@ SRC_URI +=3D "file://0001-setup.py-link-in-sysroot=
-not-in-host-directories.patch \
> >>>>                file://cross-compile-platform.patch \
> >>>>                file://avoid-host-contamination.patch \
> >>>>                file://0001-setup.py-address-openssl-3.x-build-issue.=
patch \
> >>>> -            file://CVE-2020-25657.patch \
> >>>>                "
> >>>> -SRC_URI[sha256sum] =3D "99f2260a30901c949a8dc6d5f82cd5312ffb8abc92e=
76633baf231bbbcb2decb"
> >>>> +SRC_URI[sha256sum] =3D "24c0f471358b8b19ad4c8aa9da12e868030b65c1fdb=
3279d006df60c9501338a"
> >>>>
> >>>>    PYPI_PACKAGE =3D "M2Crypto"
> >>>>    inherit pypi siteinfo setuptools3
> >>>> --
> >>>> 2.41.0
> >>>>
> >>>>
> >>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>>> Links: You receive all messages sent to this group.
> >>>> View/Reply Online (#104020): https://lists.openembedded.org/g/openem=
bedded-devel/message/104020
> >>>> Mute This Topic: https://lists.openembedded.org/mt/100356779/1997914
> >>>> Group Owner: openembedded-devel+owner@lists.openembedded.org
> >>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/uns=
ub [raj.khem@gmail.com]
> >>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>>>

