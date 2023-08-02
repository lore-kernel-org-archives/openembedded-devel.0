Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11B22C001E0
	for <webhook@archiver.kernel.org>; Wed,  2 Aug 2023 20:44:38 +0000 (UTC)
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
 by mx.groups.io with SMTP id smtpd.web10.7474.1691009068482772594
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Aug 2023 13:44:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=U2EKryeg;
 spf=pass (domain: gmail.com, ip: 209.85.161.47, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-56ca9a337caso116369eaf.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 02 Aug 2023 13:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691009068; x=1691613868;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ogj+Ny/I4KxKR094IWREy1zeyFdWVCfkiqXLH0gCXZk=;
        b=U2EKryeger4xyCAle9Zwm4oEuBq43PV3r/9tYOlyYBO+TlUHW67WIgvkamLkb4Aa4S
         OR2ZJ3pA8U9JFPU1nVx9op6KkGGvjyMgbmGsEkR3tRnUM1v6zoajZCJO2ySJ6VAbNfbW
         AngU8+d1C8TwUqyoWN5j0X0fn7ujpAh/hJykAhwAlBxUXrw8i7jbB4Oy5Gpm8heGct2G
         pWwpuZ/SLfkX0FmCTJVt759CKSoMg0JDnehI77UKuVZxNjmzvAnEnEV7pjSnrTd72ruv
         W142ZOweP63hGurVp3iAWmJAJmMq1d+OY0P9wNncEDBxWH66+V7PEACbjD9igOORngWJ
         YYog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691009068; x=1691613868;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ogj+Ny/I4KxKR094IWREy1zeyFdWVCfkiqXLH0gCXZk=;
        b=g9EKLFuQRHRwcICWDj1TYsfWjZ8kEPfdHlpZg7PMWUg1sZzjUK9sTMxqI4QH8OHHeV
         REiYqqNGPuElJW8RkbrqcSdcwKu7T82Vrbe5Z7q7r6LPvUHziksAz6xkk1QomV5/Bnob
         TgRPXTkMxKmNDTSIr94asjDP6YexYl7dQ2krKKexIy/ORKTeqB7FinPVb1czUIpV1f09
         jRWXrqRjQApORrD8DXPWURmtxcxe6D6ueg5nAAECwHkF17KvVqdYOKv9lfwp6rf2vmKb
         mTEfgfucXEhWFt6eZK5A1rQOZp1/uEuesX451/m82BscJ8/lWTCNhDNrdx798IOVu/gE
         odmw==
X-Gm-Message-State: ABy/qLYZW3EPoSyXjSy1NQjSUEXWeAnN4zGnkwBrCmkQe3/SpNeGYbWm
	mpjgRiDTqhaMhap9Sl3zM/RyBWk944rfQe3GmAg=
X-Google-Smtp-Source: APBJJlEYL+z2SI/bD/SWFkIz8PWHqYqMTb37DSJ6Fo6Nw8s/RRltZHRsa7RHImzanYxMuGBkU5anWsZoqpFocctMTMk=
X-Received: by 2002:a4a:2402:0:b0:56c:7831:7dba with SMTP id
 m2-20020a4a2402000000b0056c78317dbamr12710972oof.6.1691009067412; Wed, 02 Aug
 2023 13:44:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230725190947.660933-1-tgamblin@baylibre.com>
 <20230725190947.660933-3-tgamblin@baylibre.com> <CAMKF1soHg5oo-SbkFuqm-mZfPqqkxmiN5xNz+SeGUtL82Pp+Cg@mail.gmail.com>
 <46176689-be43-820e-3d17-a4d749260388@baylibre.com>
In-Reply-To: <46176689-be43-820e-3d17-a4d749260388@baylibre.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 2 Aug 2023 13:44:01 -0700
Message-ID: <CAMKF1sqAzVfgx8gEH2hY5F=6pjQyzAyCRQNjbD2B92UJSzDbgA@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 3/7] python3-m2crypto: upgrade 0.38.0 -> 0.39.0
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Aug 2023 20:44:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104209

On Wed, Aug 2, 2023 at 12:23=E2=80=AFPM Trevor Gamblin <tgamblin@baylibre.c=
om> wrote:
>
>
> On 2023-07-30 21:03, Khem Raj wrote:
> > Hi Trevor
> >
> > I am seeing a failure on qemux86 on ubuntu 22.04 host and its fairly re=
gular.
> >
> > https://errors.yoctoproject.org/Errors/Details/729506/
> >
> > it seems rpmdeps is crashing with signal 9. I wonder if its something
> > to do with rpm changes we might have
> > got in core but, I can confirm that it was not an issue two weeks ago.
> > It worked ok on Jul 17th but broke on
> > Jul 27th CI builds.
> Missed this until now. I see it's been merged; is this still an issue?

yes it still is.

> >
> > On Tue, Jul 25, 2023 at 12:09=E2=80=AFPM Trevor Gamblin <tgamblin@bayli=
bre.com> wrote:
> >> Remove the CVE-2020-25657 patch, as it is fixed in 0.39.0:
> >>
> >> [tgamblin@megalith m2crypto]$ git log --oneline --grep=3D"CVE-2020-256=
57"
> >> 84c5395 Mitigate the Bleichenbacher timing attacks in the RSA decrypti=
on API (CVE-2020-25657)
> >> [tgamblin@megalith m2crypto]$ git tag --contains 84c53958def0f510e9211=
9fca14d74f94215827a
> >> 0.39.0
> >>
> >> Changelog (https://gitlab.com/m2crypto/m2crypto/-/blob/master/CHANGES?=
ref_type=3Dheads):
> >>
> >> 0.39.0 - 2023-01-31
> >> -------------------
> >>
> >> - SUPPORT FOR PYTHON 2 HAS BEEN DEPRECATED AND IT WILL BE
> >>    COMPLETELY REMOVED IN THE NEXT RELEASE.
> >> - Remove dependency on parameterized and use unittest.subTest
> >>    instead.
> >> - Upgrade embedded six.py module to 1.16.0 (really tiny
> >>    inconsequential changes).
> >> - Make tests working on MacOS again (test_bio_membuf: Use fork)
> >> - Use OpenSSL_version_num() instead of unrealiable parsing of .h
> >>    file.
> >> - Mitigate the Bleichenbacher timing attacks in the RSA
> >>    decryption API (CVE-2020-25657)
> >> - Add functionality to extract EC key from public key + Update
> >>    tests
> >> - Worked around compatibility issues with OpenSSL 3.*
> >> - Support for Twisted has been deprecated (they have their own
> >>    SSL support anyway).
> >> - Generate TAP while testing.
> >> - Stop using GitHub for testing.
> >> - Accept a small deviation from time in the testsuite (for
> >>    systems with non-standard HZ kernel parameter).
> >> - Use the default BIO.__del__ rather tha overriding in BIO.File
> >>    (avoid a memleak).
> >> - Resolve "X509_Name.as_der() method from X509.py -> class
> >>    X509_Name caused segmentation fault"
> >>
> >> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> >> ---
> >>   .../python3-m2crypto/CVE-2020-25657.patch     | 176 ----------------=
--
> >>   ...o_0.38.0.bb =3D> python3-m2crypto_0.39.0.bb} |   3 +-
> >>   2 files changed, 1 insertion(+), 178 deletions(-)
> >>   delete mode 100644 meta-python/recipes-devtools/python/python3-m2cry=
pto/CVE-2020-25657.patch
> >>   rename meta-python/recipes-devtools/python/{python3-m2crypto_0.38.0.=
bb =3D> python3-m2crypto_0.39.0.bb} (92%)
> >>
> >> diff --git a/meta-python/recipes-devtools/python/python3-m2crypto/CVE-=
2020-25657.patch b/meta-python/recipes-devtools/python/python3-m2crypto/CVE=
-2020-25657.patch
> >> deleted file mode 100644
> >> index 38ecd7a276..0000000000
> >> --- a/meta-python/recipes-devtools/python/python3-m2crypto/CVE-2020-25=
657.patch
> >> +++ /dev/null
> >> @@ -1,176 +0,0 @@
> >> -Backport patch to fix CVE-2020-25657.
> >> -
> >> -Upstream-Status: Backport [https://gitlab.com/m2crypto/m2crypto/-/com=
mit/84c53958]
> >> -
> >> -Signed-off-by: Kai Kang <kai.kang@windriver.com>
> >> -
> >> -From 84c53958def0f510e92119fca14d74f94215827a Mon Sep 17 00:00:00 200=
1
> >> -From: =3D?UTF-8?q?Mat=3DC4=3D9Bj=3D20Cepl?=3D <mcepl@cepl.eu>
> >> -Date: Tue, 28 Jun 2022 21:17:01 +0200
> >> -Subject: [PATCH] Mitigate the Bleichenbacher timing attacks in the RS=
A
> >> - decryption API (CVE-2020-25657)
> >> -
> >> -Fixes #282
> >> ----
> >> - src/SWIG/_m2crypto_wrap.c | 20 ++++++++++++--------
> >> - src/SWIG/_rsa.i           | 20 ++++++++++++--------
> >> - tests/test_rsa.py         | 15 +++++++--------
> >> - 3 files changed, 31 insertions(+), 24 deletions(-)
> >> -
> >> -diff --git a/src/SWIG/_m2crypto_wrap.c b/src/SWIG/_m2crypto_wrap.c
> >> -index aba9eb6d..a9f30da9 100644
> >> ---- a/src/SWIG/_m2crypto_wrap.c
> >> -+++ b/src/SWIG/_m2crypto_wrap.c
> >> -@@ -7040,9 +7040,10 @@ PyObject *rsa_private_encrypt(RSA *rsa, PyObje=
ct *from, int padding) {
> >> -     tlen =3D RSA_private_encrypt(flen, (unsigned char *)fbuf,
> >> -         (unsigned char *)tbuf, rsa, padding);
> >> -     if (tlen =3D=3D -1) {
> >> --        m2_PyErr_Msg(_rsa_err);
> >> -+        ERR_clear_error();
> >> -+        PyErr_Clear();
> >> -         PyMem_Free(tbuf);
> >> --        return NULL;
> >> -+        Py_RETURN_NONE;
> >> -     }
> >> -
> >> -     ret =3D PyBytes_FromStringAndSize((const char *)tbuf, tlen);
> >> -@@ -7070,9 +7071,10 @@ PyObject *rsa_public_decrypt(RSA *rsa, PyObjec=
t *from, int padding) {
> >> -     tlen =3D RSA_public_decrypt(flen, (unsigned char *)fbuf,
> >> -         (unsigned char *)tbuf, rsa, padding);
> >> -     if (tlen =3D=3D -1) {
> >> --        m2_PyErr_Msg(_rsa_err);
> >> -+        ERR_clear_error();
> >> -+        PyErr_Clear();
> >> -         PyMem_Free(tbuf);
> >> --        return NULL;
> >> -+        Py_RETURN_NONE;
> >> -     }
> >> -
> >> -     ret =3D PyBytes_FromStringAndSize((const char *)tbuf, tlen);
> >> -@@ -7097,9 +7099,10 @@ PyObject *rsa_public_encrypt(RSA *rsa, PyObjec=
t *from, int padding) {
> >> -     tlen =3D RSA_public_encrypt(flen, (unsigned char *)fbuf,
> >> -         (unsigned char *)tbuf, rsa, padding);
> >> -     if (tlen =3D=3D -1) {
> >> --        m2_PyErr_Msg(_rsa_err);
> >> -+        ERR_clear_error();
> >> -+        PyErr_Clear();
> >> -         PyMem_Free(tbuf);
> >> --        return NULL;
> >> -+        Py_RETURN_NONE;
> >> -     }
> >> -
> >> -     ret =3D PyBytes_FromStringAndSize((const char *)tbuf, tlen);
> >> -@@ -7124,9 +7127,10 @@ PyObject *rsa_private_decrypt(RSA *rsa, PyObje=
ct *from, int padding) {
> >> -     tlen =3D RSA_private_decrypt(flen, (unsigned char *)fbuf,
> >> -         (unsigned char *)tbuf, rsa, padding);
> >> -     if (tlen =3D=3D -1) {
> >> --        m2_PyErr_Msg(_rsa_err);
> >> -+        ERR_clear_error();
> >> -+        PyErr_Clear();
> >> -         PyMem_Free(tbuf);
> >> --        return NULL;
> >> -+        Py_RETURN_NONE;
> >> -     }
> >> -     ret =3D PyBytes_FromStringAndSize((const char *)tbuf, tlen);
> >> -
> >> -diff --git a/src/SWIG/_rsa.i b/src/SWIG/_rsa.i
> >> -index bc714e01..1377b8be 100644
> >> ---- a/src/SWIG/_rsa.i
> >> -+++ b/src/SWIG/_rsa.i
> >> -@@ -239,9 +239,10 @@ PyObject *rsa_private_encrypt(RSA *rsa, PyObject=
 *from, int padding) {
> >> -     tlen =3D RSA_private_encrypt(flen, (unsigned char *)fbuf,
> >> -         (unsigned char *)tbuf, rsa, padding);
> >> -     if (tlen =3D=3D -1) {
> >> --        m2_PyErr_Msg(_rsa_err);
> >> -+        ERR_clear_error();
> >> -+        PyErr_Clear();
> >> -         PyMem_Free(tbuf);
> >> --        return NULL;
> >> -+        Py_RETURN_NONE;
> >> -     }
> >> -
> >> -     ret =3D PyBytes_FromStringAndSize((const char *)tbuf, tlen);
> >> -@@ -269,9 +270,10 @@ PyObject *rsa_public_decrypt(RSA *rsa, PyObject =
*from, int padding) {
> >> -     tlen =3D RSA_public_decrypt(flen, (unsigned char *)fbuf,
> >> -         (unsigned char *)tbuf, rsa, padding);
> >> -     if (tlen =3D=3D -1) {
> >> --        m2_PyErr_Msg(_rsa_err);
> >> -+        ERR_clear_error();
> >> -+        PyErr_Clear();
> >> -         PyMem_Free(tbuf);
> >> --        return NULL;
> >> -+        Py_RETURN_NONE;
> >> -     }
> >> -
> >> -     ret =3D PyBytes_FromStringAndSize((const char *)tbuf, tlen);
> >> -@@ -296,9 +298,10 @@ PyObject *rsa_public_encrypt(RSA *rsa, PyObject =
*from, int padding) {
> >> -     tlen =3D RSA_public_encrypt(flen, (unsigned char *)fbuf,
> >> -         (unsigned char *)tbuf, rsa, padding);
> >> -     if (tlen =3D=3D -1) {
> >> --        m2_PyErr_Msg(_rsa_err);
> >> -+        ERR_clear_error();
> >> -+        PyErr_Clear();
> >> -         PyMem_Free(tbuf);
> >> --        return NULL;
> >> -+        Py_RETURN_NONE;
> >> -     }
> >> -
> >> -     ret =3D PyBytes_FromStringAndSize((const char *)tbuf, tlen);
> >> -@@ -323,9 +326,10 @@ PyObject *rsa_private_decrypt(RSA *rsa, PyObject=
 *from, int padding) {
> >> -     tlen =3D RSA_private_decrypt(flen, (unsigned char *)fbuf,
> >> -         (unsigned char *)tbuf, rsa, padding);
> >> -     if (tlen =3D=3D -1) {
> >> --        m2_PyErr_Msg(_rsa_err);
> >> -+        ERR_clear_error();
> >> -+        PyErr_Clear();
> >> -         PyMem_Free(tbuf);
> >> --        return NULL;
> >> -+        Py_RETURN_NONE;
> >> -     }
> >> -     ret =3D PyBytes_FromStringAndSize((const char *)tbuf, tlen);
> >> -
> >> -diff --git a/tests/test_rsa.py b/tests/test_rsa.py
> >> -index 7bb3af75..5e75d681 100644
> >> ---- a/tests/test_rsa.py
> >> -+++ b/tests/test_rsa.py
> >> -@@ -109,8 +109,9 @@ class RSATestCase(unittest.TestCase):
> >> -         # The other paddings.
> >> -         for padding in self.s_padding_nok:
> >> -             p =3D getattr(RSA, padding)
> >> --            with self.assertRaises(RSA.RSAError):
> >> --                priv.private_encrypt(self.data, p)
> >> -+            # Exception disabled as a part of mitigation against CVE=
-2020-25657
> >> -+            # with self.assertRaises(RSA.RSAError):
> >> -+            priv.private_encrypt(self.data, p)
> >> -         # Type-check the data to be encrypted.
> >> -         with self.assertRaises(TypeError):
> >> -             priv.private_encrypt(self.gen_callback, RSA.pkcs1_paddin=
g)
> >> -@@ -127,10 +128,12 @@ class RSATestCase(unittest.TestCase):
> >> -             self.assertEqual(ptxt, self.data)
> >> -
> >> -         # no_padding
> >> --        with six.assertRaisesRegex(self, RSA.RSAError, 'data too sma=
ll'):
> >> --            priv.public_encrypt(self.data, RSA.no_padding)
> >> -+        # Exception disabled as a part of mitigation against CVE-202=
0-25657
> >> -+        # with six.assertRaisesRegex(self, RSA.RSAError, 'data too s=
mall'):
> >> -+        priv.public_encrypt(self.data, RSA.no_padding)
> >> -
> >> -         # Type-check the data to be encrypted.
> >> -+        # Exception disabled as a part of mitigation against CVE-202=
0-25657
> >> -         with self.assertRaises(TypeError):
> >> -             priv.public_encrypt(self.gen_callback, RSA.pkcs1_padding=
)
> >> -
> >> -@@ -146,10 +149,6 @@ class RSATestCase(unittest.TestCase):
> >> -                          b'\000\000\000\003\001\000\001')  # aka 655=
37 aka 0xf4
> >> -         with self.assertRaises(RSA.RSAError):
> >> -             setattr(rsa, 'e', '\000\000\000\003\001\000\001')
> >> --        with self.assertRaises(RSA.RSAError):
> >> --            rsa.private_encrypt(1)
> >> --        with self.assertRaises(RSA.RSAError):
> >> --            rsa.private_decrypt(1)
> >> -         assert rsa.check_key()
> >> -
> >> -     def test_loadpub_bad(self):
> >> ---
> >> -GitLab
> >> -
> >> diff --git a/meta-python/recipes-devtools/python/python3-m2crypto_0.38=
.0.bb b/meta-python/recipes-devtools/python/python3-m2crypto_0.39.0.bb
> >> similarity index 92%
> >> rename from meta-python/recipes-devtools/python/python3-m2crypto_0.38.=
0.bb
> >> rename to meta-python/recipes-devtools/python/python3-m2crypto_0.39.0.=
bb
> >> index 40e3bfb316..3a4a700bf7 100644
> >> --- a/meta-python/recipes-devtools/python/python3-m2crypto_0.38.0.bb
> >> +++ b/meta-python/recipes-devtools/python/python3-m2crypto_0.39.0.bb
> >> @@ -10,9 +10,8 @@ SRC_URI +=3D "file://0001-setup.py-link-in-sysroot-n=
ot-in-host-directories.patch \
> >>               file://cross-compile-platform.patch \
> >>               file://avoid-host-contamination.patch \
> >>               file://0001-setup.py-address-openssl-3.x-build-issue.pat=
ch \
> >> -            file://CVE-2020-25657.patch \
> >>               "
> >> -SRC_URI[sha256sum] =3D "99f2260a30901c949a8dc6d5f82cd5312ffb8abc92e76=
633baf231bbbcb2decb"
> >> +SRC_URI[sha256sum] =3D "24c0f471358b8b19ad4c8aa9da12e868030b65c1fdb32=
79d006df60c9501338a"
> >>
> >>   PYPI_PACKAGE =3D "M2Crypto"
> >>   inherit pypi siteinfo setuptools3
> >> --
> >> 2.41.0
> >>
> >>
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#104020): https://lists.openembedded.org/g/openembe=
dded-devel/message/104020
> >> Mute This Topic: https://lists.openembedded.org/mt/100356779/1997914
> >> Group Owner: openembedded-devel+owner@lists.openembedded.org
> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub=
 [raj.khem@gmail.com]
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>

