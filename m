Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web12.11636.1620234588724051205
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 May 2021 10:09:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nLLqjgWi;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id y26so2917474eds.4
        for <openembedded-devel@lists.openembedded.org>; Wed, 05 May 2021 10:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ga8Hb8phVTbDHOQ6pajCT52tJNmDEevmYESTnwxZAjU=;
        b=nLLqjgWigNGUlkEp7X+F191swdgjvE4Ei7lsvfw7GMZMtfT3WIbwgyh2lhvDezC85O
         hBiMK6ss5N4zDTF9ckTuM9L4xOD1hqDoA/6R7Dw5usQrbYboljlYCwxI7zQnEN81NC1Z
         orQR9wzw/9dMgeSccaM/SKLmZ0fkBHrM6kjlQlE4GDF645Ay9M+AQfWXpFU5ekau2Exh
         Mw7AX8JSp2OWgvsxE2OMOJ+/pH2M33Nt0mL0HymfuhWQYGnLn/LprWhTza0u5yXhPj4C
         nd8nA4Wuz8rHW8URbsU7M4bFGIaS6cZ3qeWzPUFdE7/zb//2NATT4ICAcik/gFb6jl62
         EyPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ga8Hb8phVTbDHOQ6pajCT52tJNmDEevmYESTnwxZAjU=;
        b=FG28dNgPjPBt+O8jUC4bJ3Q/cgSAiHUFDGfU7P+w5jaY1+q9lSQ8xCz5nlCmCuQjmI
         opGzog6xFNzz1lG8VVdzZnwwVea2J5KTdCRmFaTOXe9k7FRMPGSw5rg4eXzKXlqLNxaz
         uIHuREIUjdEEvBlkRqyBdwaQxhuHEAoBrdVKvcKRLnkB3hOpvxKJ5rrcOlTeLXqw1yF9
         cc7zDgC4Cs8rkqCNAqokbIHMNViTBhIGwRMM7puVszNSJs5OvS3qI8QtnzaWinPWPgQK
         oauS//CPRL8LfEhiFdcxH0rs/Tgtf8UQqthri7Mfkqa+AL50497ooOdNbjrvTTo2htgw
         MwdA==
X-Gm-Message-State: AOAM530m6HFxhNcSQf6GZG4NzAHRkmYBBChwXpqxFcw7YAAe2eI3B9Xk
	AIFP7PW4fgBA2pxHMd8uTU1NoVoZ1PRQQM7om90=
X-Google-Smtp-Source: ABdhPJxYfStEBkKwbk6eKHVvdbV2CNtfJC9mXDBFCvbYNEfaLk7HD8h4f1wgabOZmjReR0Rd0zopm26FEPpcFgpqmCQ=
X-Received: by 2002:a05:6402:652:: with SMTP id u18mr59116edx.388.1620234587181;
 Wed, 05 May 2021 10:09:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210501190615.545087-1-raj.khem@gmail.com>
In-Reply-To: <20210501190615.545087-1-raj.khem@gmail.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Wed, 5 May 2021 19:09:36 +0200
Message-ID: <CA+chaQdwBJ7LQ4=75L_zT_gaqyw8V0nPCWo=UC+8TDY8U8RxMg@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-m2crypto: Upgrade to 0.37.1
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000005975005c198435c"

--00000000000005975005c198435c
Content-Type: text/plain; charset="UTF-8"

This upgrade seems to break the build for aarch64:
http://errors.yoctoproject.org/Errors/Details/580206/

On Sat, May 1, 2021 at 9:06 PM Khem Raj <raj.khem@gmail.com> wrote:

> Unifiy .inc into .bb
> Add patches to fix issues with openssl 1.1.x
> Remove m2crypto-0.26.4-gcc_macros patch, its no longer needed
> Refresh existing patches
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../m2crypto-0.26.4-gcc_macros.patch          | 35 --------------
>  ...verify_cb_-to-be-called-with-ok-True.patch | 47 +++++++++++++++++++
>  ...A_SSLV23_PADDING-has-been-deprecated.patch | 29 ++++++++++++
>  ...k-in-sysroot-not-in-host-directories.patch | 12 ++---
>  .../cross-compile-platform.patch              |  8 ++--
>  .../python/python3-m2crypto_0.30.1.bb         |  2 -
>  ...2crypto.inc => python3-m2crypto_0.37.1.bb} |  8 ++--
>  7 files changed, 88 insertions(+), 53 deletions(-)
>  delete mode 100644
> meta-python/recipes-devtools/python/python-m2crypto/m2crypto-0.26.4-gcc_macros.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-m2crypto/0001-Allow-verify_cb_-to-be-called-with-ok-True.patch
>  create mode 100644
> meta-python/recipes-devtools/python/python3-m2crypto/0001-Use-of-RSA_SSLV23_PADDING-has-been-deprecated.patch
>  rename meta-python/recipes-devtools/python/{python-m2crypto =>
> python3-m2crypto}/0001-setup.py-link-in-sysroot-not-in-host-directories.patch
> (75%)
>  rename meta-python/recipes-devtools/python/{python-m2crypto =>
> python3-m2crypto}/cross-compile-platform.patch (84%)
>  delete mode 100644 meta-python/recipes-devtools/python/
> python3-m2crypto_0.30.1.bb
>  rename meta-python/recipes-devtools/python/{python-m2crypto.inc =>
> python3-m2crypto_0.37.1.bb} (86%)
>
> diff --git
> a/meta-python/recipes-devtools/python/python-m2crypto/m2crypto-0.26.4-gcc_macros.patch
> b/meta-python/recipes-devtools/python/python-m2crypto/m2crypto-0.26.4-gcc_macros.patch
> deleted file mode 100644
> index 7f6dd29f8a..0000000000
> ---
> a/meta-python/recipes-devtools/python/python-m2crypto/m2crypto-0.26.4-gcc_macros.patch
> +++ /dev/null
> @@ -1,35 +0,0 @@
> -Imported from Fedora
> -
> -Index: M2Crypto-0.30.1/SWIG/_m2crypto.i
> -===================================================================
> ---- M2Crypto-0.30.1.orig/SWIG/_m2crypto.i
> -+++ M2Crypto-0.30.1/SWIG/_m2crypto.i
> -@@ -8,6 +8,11 @@
> -  *
> -  */
> -
> -+%import "gcc_macros.h"
> -+
> -+%ignore WCHAR_MAX;
> -+%ignore WCHAR_MIN;
> -+
> - %module(threads=1) m2crypto
> - /* We really don't need threadblock (PyGILState_Ensure() etc.) anywhere.
> -    Disable threadallow as well, only enable it for operations likely to
> -@@ -15,11 +20,6 @@
> - %nothreadblock;
> - %nothreadallow;
> -
> --#if SWIG_VERSION >= 0x030000
> --#define __WCHAR_MAX__ __WCHAR_MAX
> --#define __WCHAR_MIN__ __WCHAR_MIN
> --#endif
> --
> - %{
> - #ifdef _WIN32
> - #define _WINSOCKAPI_
> -@@ -95,4 +95,3 @@ static PyObject *x509_store_verify_cb_fu
> - %constant int encrypt = 1;
> - %constant int decrypt = 0;
> - #endif
> --
> diff --git
> a/meta-python/recipes-devtools/python/python3-m2crypto/0001-Allow-verify_cb_-to-be-called-with-ok-True.patch
> b/meta-python/recipes-devtools/python/python3-m2crypto/0001-Allow-verify_cb_-to-be-called-with-ok-True.patch
> new file mode 100644
> index 0000000000..3c836635a1
> --- /dev/null
> +++
> b/meta-python/recipes-devtools/python/python3-m2crypto/0001-Allow-verify_cb_-to-be-called-with-ok-True.patch
> @@ -0,0 +1,47 @@
> +From 73fbd1e646f6bbf202d4418bae80eb9941fbf552 Mon Sep 17 00:00:00 2001
> +From: Casey Deccio <casey@deccio.net>
> +Date: Fri, 8 Jan 2021 12:43:09 -0700
> +Subject: [PATCH] Allow verify_cb_* to be called with ok=True
> +
> +With
> https://github.com/openssl/openssl/commit/2e06150e3928daa06d5ff70c32bffad8088ebe58
> +OpenSSL allowed verificaton to continue on UNABLE_TO_VERIFY_LEAF_SIGNATURE
> +---
> + tests/test_ssl.py | 14 ++++++++++++--
> + 1 file changed, 12 insertions(+), 2 deletions(-)
> +
> +diff --git a/tests/test_ssl.py b/tests/test_ssl.py
> +index 92b6942..7a3271a 100644
> +--- a/tests/test_ssl.py
> ++++ b/tests/test_ssl.py
> +@@ -59,8 +59,13 @@ def allocate_srv_port():
> +
> +
> + def verify_cb_new_function(ok, store):
> +-    assert not ok
> +     err = store.get_error()
> ++    # If err is X509_V_ERR_UNABLE_TO_VERIFY_LEAF_SIGNATURE, then instead
> of
> ++    # aborting, this callback is called to retrieve additional error
> ++    # information.  In this case, ok might not be False.
> ++    # See
> https://github.com/openssl/openssl/commit/2e06150e3928daa06d5ff70c32bffad8088ebe58
> ++    if err != m2.X509_V_ERR_UNABLE_TO_VERIFY_LEAF_SIGNATURE:
> ++        assert not ok
> +     assert err in [m2.X509_V_ERR_DEPTH_ZERO_SELF_SIGNED_CERT,
> +                    m2.X509_V_ERR_UNABLE_TO_GET_ISSUER_CERT_LOCALLY,
> +                    m2.X509_V_ERR_CERT_UNTRUSTED,
> +@@ -618,7 +623,12 @@ class MiscSSLClientTestCase(BaseSSLClientTestCase):
> +
> +     def verify_cb_old(self, ctx_ptr, x509_ptr, err, depth, ok):
> +         try:
> +-            self.assertFalse(ok)
> ++            # If err is X509_V_ERR_UNABLE_TO_VERIFY_LEAF_SIGNATURE, then
> instead of
> ++            # aborting, this callback is called to retrieve additional
> error
> ++            # information.  In this case, ok might not be False.
> ++            # See
> https://github.com/openssl/openssl/commit/2e06150e3928daa06d5ff70c32bffad8088ebe58
> ++            if err != m2.X509_V_ERR_UNABLE_TO_VERIFY_LEAF_SIGNATURE:
> ++                self.assertFalse(ok)
> +             self.assertIn(err,
> +                           [m2.X509_V_ERR_DEPTH_ZERO_SELF_SIGNED_CERT,
> +
> m2.X509_V_ERR_UNABLE_TO_GET_ISSUER_CERT_LOCALLY,
> +--
> +2.29.2
> +
> diff --git
> a/meta-python/recipes-devtools/python/python3-m2crypto/0001-Use-of-RSA_SSLV23_PADDING-has-been-deprecated.patch
> b/meta-python/recipes-devtools/python/python3-m2crypto/0001-Use-of-RSA_SSLV23_PADDING-has-been-deprecated.patch
> new file mode 100644
> index 0000000000..2313a324a0
> --- /dev/null
> +++
> b/meta-python/recipes-devtools/python/python3-m2crypto/0001-Use-of-RSA_SSLV23_PADDING-has-been-deprecated.patch
> @@ -0,0 +1,29 @@
> +From d06eaa88a5f491827733f32027c46de3557fbd05 Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?Mat=C4=9Bj=20Cepl?= <mcepl@cepl.eu>
> +Date: Fri, 19 Feb 2021 15:53:02 +0100
> +Subject: [PATCH] Use of RSA_SSLV23_PADDING has been deprecated.
> +
> +Fixes #293.
> +---
> + tests/test_rsa.py | 5 -----
> + 1 file changed, 5 deletions(-)
> +
> +diff --git a/tests/test_rsa.py b/tests/test_rsa.py
> +index 3de5016..7299785 100644
> +--- a/tests/test_rsa.py
> ++++ b/tests/test_rsa.py
> +@@ -124,11 +124,6 @@ class RSATestCase(unittest.TestCase):
> +             ptxt = priv.private_decrypt(ctxt, p)
> +             self.assertEqual(ptxt, self.data)
> +
> +-        # sslv23_padding
> +-        ctxt = priv.public_encrypt(self.data, RSA.sslv23_padding)
> +-        res = priv.private_decrypt(ctxt, RSA.sslv23_padding)
> +-        self.assertEqual(res, self.data)
> +-
> +         # no_padding
> +         with six.assertRaisesRegex(self, RSA.RSAError, 'data too small'):
> +             priv.public_encrypt(self.data, RSA.no_padding)
> +--
> +2.29.2
> +
> diff --git
> a/meta-python/recipes-devtools/python/python-m2crypto/0001-setup.py-link-in-sysroot-not-in-host-directories.patch
> b/meta-python/recipes-devtools/python/python3-m2crypto/0001-setup.py-link-in-sysroot-not-in-host-directories.patch
> similarity index 75%
> rename from
> meta-python/recipes-devtools/python/python-m2crypto/0001-setup.py-link-in-sysroot-not-in-host-directories.patch
> rename to
> meta-python/recipes-devtools/python/python3-m2crypto/0001-setup.py-link-in-sysroot-not-in-host-directories.patch
> index b339d93f75..f4c74384f9 100644
> ---
> a/meta-python/recipes-devtools/python/python-m2crypto/0001-setup.py-link-in-sysroot-not-in-host-directories.patch
> +++
> b/meta-python/recipes-devtools/python/python3-m2crypto/0001-setup.py-link-in-sysroot-not-in-host-directories.patch
> @@ -10,19 +10,17 @@ Upstream-status: Unknown
>   setup.py | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> -Index: M2Crypto-0.30.1/setup.py
> -===================================================================
> ---- M2Crypto-0.30.1.orig/setup.py
> -+++ M2Crypto-0.30.1/setup.py
> -@@ -130,6 +130,7 @@ class _M2CryptoBuildExt(build_ext.build_
> +--- a/setup.py
> ++++ b/setup.py
> +@@ -135,6 +135,7 @@ class _M2CryptoBuildExt(build_ext.build_
>           self.set_undefined_options('build', ('bundledlls', 'bundledlls'))
>
>           self.libraries = ['ssl', 'crypto']
>  +        self.openssl = os.environ.get( "STAGING_DIR" )
>           if sys.platform == 'win32':
>               self.libraries = ['ssleay32', 'libeay32']
> -             if self.openssl and openssl_version(self.openssl,
> 0x10100000, True):
> -@@ -150,8 +151,8 @@ class _M2CryptoBuildExt(build_ext.build_
> +             if self.openssl and openssl_version(self.openssl,
> +@@ -159,8 +160,8 @@ class _M2CryptoBuildExt(build_ext.build_
>
>           if self.openssl is not None:
>               log.debug('self.openssl = %s', self.openssl)
> diff --git
> a/meta-python/recipes-devtools/python/python-m2crypto/cross-compile-platform.patch
> b/meta-python/recipes-devtools/python/python3-m2crypto/cross-compile-platform.patch
> similarity index 84%
> rename from
> meta-python/recipes-devtools/python/python-m2crypto/cross-compile-platform.patch
> rename to
> meta-python/recipes-devtools/python/python3-m2crypto/cross-compile-platform.patch
> index 4b64f4613c..f039ae8665 100644
> ---
> a/meta-python/recipes-devtools/python/python-m2crypto/cross-compile-platform.patch
> +++
> b/meta-python/recipes-devtools/python/python3-m2crypto/cross-compile-platform.patch
> @@ -4,11 +4,9 @@ since it pokes at the system for getting architecture
> values
>  Upstream-Status: Inappropriate
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
>
> -Index: M2Crypto-0.30.1/setup.py
> -===================================================================
> ---- M2Crypto-0.30.1.orig/setup.py
> -+++ M2Crypto-0.30.1/setup.py
> -@@ -160,22 +160,6 @@ class _M2CryptoBuildExt(build_ext.build_
> +--- a/setup.py
> ++++ b/setup.py
> +@@ -169,22 +169,6 @@ class _M2CryptoBuildExt(build_ext.build_
>               log.debug('self.include_dirs = %s', self.include_dirs)
>               log.debug('self.library_dirs = %s', self.library_dirs)
>
> diff --git a/meta-python/recipes-devtools/python/
> python3-m2crypto_0.30.1.bb b/meta-python/recipes-devtools/python/
> python3-m2crypto_0.30.1.bb
> deleted file mode 100644
> index 4d63d4bd3a..0000000000
> --- a/meta-python/recipes-devtools/python/python3-m2crypto_0.30.1.bb
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -inherit setuptools3
> -require python-m2crypto.inc
> diff --git a/meta-python/recipes-devtools/python/python-m2crypto.inc
> b/meta-python/recipes-devtools/python/python3-m2crypto_0.37.1.bb
> similarity index 86%
> rename from meta-python/recipes-devtools/python/python-m2crypto.inc
> rename to meta-python/recipes-devtools/python/python3-m2crypto_0.37.1.bb
> index 797a0354bf..896d9d2cc4 100644
> --- a/meta-python/recipes-devtools/python/python-m2crypto.inc
> +++ b/meta-python/recipes-devtools/python/python3-m2crypto_0.37.1.bb
> @@ -8,13 +8,13 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/python-m2crypto:"
>
>  SRC_URI +=
> "file://0001-setup.py-link-in-sysroot-not-in-host-directories.patch \
>              file://cross-compile-platform.patch \
> -            file://m2crypto-0.26.4-gcc_macros.patch \
> +            file://0001-Allow-verify_cb_-to-be-called-with-ok-True.patch \
> +
> file://0001-Use-of-RSA_SSLV23_PADDING-has-been-deprecated.patch \
>             "
> -SRC_URI[md5sum] = "7fce3cbf85eb84a669682892b935746b"
> -SRC_URI[sha256sum] =
> "a1b2751cdadc6afac3df8a5799676b7b7c67a6ad144bb62d38563062e7cd3fc6"
> +SRC_URI[sha256sum] =
> "e4e42f068b78ccbf113e5d0a72ae5f480f6c3ace4940b91e4fff5598cfff6fb3"
>
>  PYPI_PACKAGE = "M2Crypto"
> -inherit pypi siteinfo
> +inherit pypi siteinfo setuptools3
>
>  DEPENDS += "openssl swig-native"
>  RDEPENDS_${PN} += "\
> --
> 2.31.1
>
>
> 
>
>

--00000000000005975005c198435c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This upgrade seems to break the build for aarch64:<div><a =
href=3D"http://errors.yoctoproject.org/Errors/Details/580206/">http://error=
s.yoctoproject.org/Errors/Details/580206/</a><br></div></div><br><div class=
=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, May 1, 2021=
 at 9:06 PM Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gma=
il.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">Unifiy .inc into .bb<br>
Add patches to fix issues with openssl 1.1.x<br>
Remove m2crypto-0.26.4-gcc_macros patch, its no longer needed<br>
Refresh existing patches<br>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../m2crypto-0.26.4-gcc_macros.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 35 --------------<br>
=C2=A0...verify_cb_-to-be-called-with-ok-True.patch | 47 +++++++++++++++++=
++<br>
=C2=A0...A_SSLV23_PADDING-has-been-deprecated.patch | 29 ++++++++++++<br>
=C2=A0...k-in-sysroot-not-in-host-directories.patch | 12 ++---<br>
=C2=A0.../cross-compile-platform.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 8 ++--<br>
=C2=A0.../python/<a href=3D"http://python3-m2crypto_0.30.1.bb" rel=3D"nore=
ferrer" target=3D"_blank">python3-m2crypto_0.30.1.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 2 -<br>
=C2=A0...2crypto.inc =3D&gt; <a href=3D"http://python3-m2crypto_0.37.1.bb"=
 rel=3D"noreferrer" target=3D"_blank">python3-m2crypto_0.37.1.bb</a>} |=C2=
=A0 8 ++--<br>
=C2=A07 files changed, 88 insertions(+), 53 deletions(-)<br>
=C2=A0delete mode 100644 meta-python/recipes-devtools/python/python-m2cryp=
to/m2crypto-0.26.4-gcc_macros.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-m2cry=
pto/0001-Allow-verify_cb_-to-be-called-with-ok-True.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-m2cry=
pto/0001-Use-of-RSA_SSLV23_PADDING-has-been-deprecated.patch<br>
=C2=A0rename meta-python/recipes-devtools/python/{python-m2crypto =3D&gt; =
python3-m2crypto}/0001-setup.py-link-in-sysroot-not-in-host-directories.pat=
ch (75%)<br>
=C2=A0rename meta-python/recipes-devtools/python/{python-m2crypto =3D&gt; =
python3-m2crypto}/cross-compile-platform.patch (84%)<br>
=C2=A0delete mode 100644 meta-python/recipes-devtools/python/<a href=3D"ht=
tp://python3-m2crypto_0.30.1.bb" rel=3D"noreferrer" target=3D"_blank">pytho=
n3-m2crypto_0.30.1.bb</a><br>
=C2=A0rename meta-python/recipes-devtools/python/{python-m2crypto.inc =3D&=
gt; <a href=3D"http://python3-m2crypto_0.37.1.bb" rel=3D"noreferrer" target=
=
=3D"_blank">python3-m2crypto_0.37.1.bb</a>} (86%)<br>
<br>
diff --git a/meta-python/recipes-devtools/python/python-m2crypto/m2crypto-=
0.26.4-gcc_macros.patch b/meta-python/recipes-devtools/python/python-m2cryp=
to/m2crypto-0.26.4-gcc_macros.patch<br>
deleted file mode 100644<br>
index 7f6dd29f8a..0000000000<br>
--- a/meta-python/recipes-devtools/python/python-m2crypto/m2crypto-0.26.4-=
gcc_macros.patch<br>
+++ /dev/null<br>
@@ -1,35 +0,0 @@<br>
-Imported from Fedora<br>
-<br>
-Index: M2Crypto-0.30.1/SWIG/_m2crypto.i<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- M2Crypto-0.30.1.orig/SWIG/_m2crypto.i<br>
-+++ M2Crypto-0.30.1/SWIG/_m2crypto.i<br>
-@@ -8,6 +8,11 @@<br>
-=C2=A0 *<br>
-=C2=A0 */<br>
- <br>
-+%import &quot;gcc_macros.h&quot;<br>
-+<br>
-+%ignore WCHAR_MAX;<br>
-+%ignore WCHAR_MIN;<br>
-+<br>
- %module(threads=3D1) m2crypto<br>
- /* We really don&#39;t need threadblock (PyGILState_Ensure() etc.) anywh=
ere.<br>
-=C2=A0 =C2=A0 Disable threadallow as well, only enable it for operations =
likely to<br>
-@@ -15,11 +20,6 @@<br>
- %nothreadblock;<br>
- %nothreadallow;<br>
- <br>
--#if SWIG_VERSION &gt;=3D 0x030000<br>
--#define __WCHAR_MAX__ __WCHAR_MAX<br>
--#define __WCHAR_MIN__ __WCHAR_MIN<br>
--#endif<br>
--<br>
- %{<br>
- #ifdef _WIN32<br>
- #define _WINSOCKAPI_<br>
-@@ -95,4 +95,3 @@ static PyObject *x509_store_verify_cb_fu<br>
- %constant int encrypt =3D 1;<br>
- %constant int decrypt =3D 0;<br>
- #endif<br>
--=C2=A0 <br>
diff --git a/meta-python/recipes-devtools/python/python3-m2crypto/0001-All=
ow-verify_cb_-to-be-called-with-ok-True.patch b/meta-python/recipes-devtool=
s/python/python3-m2crypto/0001-Allow-verify_cb_-to-be-called-with-ok-True.p=
atch<br>
new file mode 100644<br>
index 0000000000..3c836635a1<br>
--- /dev/null<br>
+++ b/meta-python/recipes-devtools/python/python3-m2crypto/0001-Allow-veri=
fy_cb_-to-be-called-with-ok-True.patch<br>
@@ -0,0 +1,47 @@<br>
+From 73fbd1e646f6bbf202d4418bae80eb9941fbf552 Mon Sep 17 00:00:00 2001<br=
>
+From: Casey Deccio &lt;<a href=3D"mailto:casey@deccio.net" target=3D"_bla=
nk">casey@deccio.net</a>&gt;<br>
+Date: Fri, 8 Jan 2021 12:43:09 -0700<br>
+Subject: [PATCH] Allow verify_cb_* to be called with ok=3DTrue<br>
+<br>
+With <a href=3D"https://github.com/openssl/openssl/commit/2e06150e3928daa=
06d5ff70c32bffad8088ebe58" rel=3D"noreferrer" target=3D"_blank">https://git=
hub.com/openssl/openssl/commit/2e06150e3928daa06d5ff70c32bffad8088ebe58</a>=
<br>
+OpenSSL allowed verificaton to continue on UNABLE_TO_VERIFY_LEAF_SIGNATUR=
E<br>
+---<br>
+ tests/test_ssl.py | 14 ++++++++++++--<br>
+ 1 file changed, 12 insertions(+), 2 deletions(-)<br>
+<br>
+diff --git a/tests/test_ssl.py b/tests/test_ssl.py<br>
+index 92b6942..7a3271a 100644<br>
+--- a/tests/test_ssl.py<br>
++++ b/tests/test_ssl.py<br>
+@@ -59,8 +59,13 @@ def allocate_srv_port():<br>
+ <br>
+ <br>
+ def verify_cb_new_function(ok, store):<br>
+-=C2=A0 =C2=A0 assert not ok<br>
+=C2=A0 =C2=A0 =C2=A0err =3D store.get_error()<br>
++=C2=A0 =C2=A0 # If err is X509_V_ERR_UNABLE_TO_VERIFY_LEAF_SIGNATURE, th=
en instead of<br>
++=C2=A0 =C2=A0 # aborting, this callback is called to retrieve additional=
 error<br>
++=C2=A0 =C2=A0 # information.=C2=A0 In this case, ok might not be False.<=
br>
++=C2=A0 =C2=A0 # See <a href=3D"https://github.com/openssl/openssl/commit=
/2e06150e3928daa06d5ff70c32bffad8088ebe58" rel=3D"noreferrer" target=3D"_bl=
ank">https://github.com/openssl/openssl/commit/2e06150e3928daa06d5ff70c32bf=
fad8088ebe58</a><br>
++=C2=A0 =C2=A0 if err !=3D m2.X509_V_ERR_UNABLE_TO_VERIFY_LEAF_SIGNATURE:=
<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert not ok<br>
+=C2=A0 =C2=A0 =C2=A0assert err in [m2.X509_V_ERR_DEPTH_ZERO_SELF_SIGNED_C=
ERT,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 m2.=
X509_V_ERR_UNABLE_TO_GET_ISSUER_CERT_LOCALLY,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 m2.=
X509_V_ERR_CERT_UNTRUSTED,<br>
+@@ -618,7 +623,12 @@ class MiscSSLClientTestCase(BaseSSLClientTestCase):<=
br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0def verify_cb_old(self, ctx_ptr, x509_ptr, err, depth=
, ok):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0try:<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertFalse(ok)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # If err is X509_V_ERR_UNABLE_=
TO_VERIFY_LEAF_SIGNATURE, then instead of<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # aborting, this callback is c=
alled to retrieve additional error<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # information.=C2=A0 In this c=
ase, ok might not be False.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # See <a href=3D"https://githu=
b.com/openssl/openssl/commit/2e06150e3928daa06d5ff70c32bffad8088ebe58" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/openssl/openssl/commi=
t/2e06150e3928daa06d5ff70c32bffad8088ebe58</a><br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if err !=3D m2.X509_V_ERR_UNAB=
LE_TO_VERIFY_LEAF_SIGNATURE:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertFalse=
(ok)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.assertIn(err,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0[m2.X509_V_ERR_DEPTH_ZERO_SELF_SIGNED_CERT,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 m2.X509_V_ERR_UNABLE_TO_GET_ISSUER_CERT_LOCALLY,<=
br>
+-- <br>
+2.29.2<br>
+<br>
diff --git a/meta-python/recipes-devtools/python/python3-m2crypto/0001-Use=
-of-RSA_SSLV23_PADDING-has-been-deprecated.patch b/meta-python/recipes-devt=
ools/python/python3-m2crypto/0001-Use-of-RSA_SSLV23_PADDING-has-been-deprec=
ated.patch<br>
new file mode 100644<br>
index 0000000000..2313a324a0<br>
--- /dev/null<br>
+++ b/meta-python/recipes-devtools/python/python3-m2crypto/0001-Use-of-RSA=
_SSLV23_PADDING-has-been-deprecated.patch<br>
@@ -0,0 +1,29 @@<br>
+From d06eaa88a5f491827733f32027c46de3557fbd05 Mon Sep 17 00:00:00 2001<br=
>
+From: =3D?UTF-8?q?Mat=3DC4=3D9Bj=3D20Cepl?=3D &lt;<a href=3D"mailto:mcepl=
@cepl.eu" target=3D"_blank">mcepl@cepl.eu</a>&gt;<br>
+Date: Fri, 19 Feb 2021 15:53:02 +0100<br>
+Subject: [PATCH] Use of RSA_SSLV23_PADDING has been deprecated.<br>
+<br>
+Fixes #293.<br>
+---<br>
+ tests/test_rsa.py | 5 -----<br>
+ 1 file changed, 5 deletions(-)<br>
+<br>
+diff --git a/tests/test_rsa.py b/tests/test_rsa.py<br>
+index 3de5016..7299785 100644<br>
+--- a/tests/test_rsa.py<br>
++++ b/tests/test_rsa.py<br>
+@@ -124,11 +124,6 @@ class RSATestCase(unittest.TestCase):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ptxt =3D priv.private_dec=
rypt(ctxt, p)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.assertEqual(ptxt, se=
lf.data)<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # sslv23_padding<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 ctxt =3D priv.public_encrypt(self.data, RSA.=
sslv23_padding)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 res =3D priv.private_decrypt(ctxt, RSA.sslv2=
3_padding)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(res, self.data)<br>
+-<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# no_padding<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0with six.assertRaisesRegex(self, RSA.RS=
AError, &#39;data too small&#39;):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0priv.public_encrypt(self.=
data, RSA.no_padding)<br>
+-- <br>
+2.29.2<br>
+<br>
diff --git a/meta-python/recipes-devtools/python/python-m2crypto/0001-setu=
p.py-link-in-sysroot-not-in-host-directories.patch b/meta-python/recipes-de=
vtools/python/python3-m2crypto/0001-setup.py-link-in-sysroot-not-in-host-di=
rectories.patch<br>
similarity index 75%<br>
rename from meta-python/recipes-devtools/python/python-m2crypto/0001-setup=
.py-link-in-sysroot-not-in-host-directories.patch<br>
rename to meta-python/recipes-devtools/python/python3-m2crypto/0001-setup.=
py-link-in-sysroot-not-in-host-directories.patch<br>
index b339d93f75..f4c74384f9 100644<br>
--- a/meta-python/recipes-devtools/python/python-m2crypto/0001-setup.py-li=
nk-in-sysroot-not-in-host-directories.patch<br>
+++ b/meta-python/recipes-devtools/python/python3-m2crypto/0001-setup.py-l=
ink-in-sysroot-not-in-host-directories.patch<br>
@@ -10,19 +10,17 @@ Upstream-status: Unknown<br>
=C2=A0 setup.py | 6 +++---<br>
=C2=A0 1 file changed, 3 insertions(+), 3 deletions(-)<br>
<br>
-Index: M2Crypto-0.30.1/setup.py<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- M2Crypto-0.30.1.orig/setup.py<br>
-+++ M2Crypto-0.30.1/setup.py<br>
-@@ -130,6 +130,7 @@ class _M2CryptoBuildExt(build_ext.build_<br>
+--- a/setup.py<br>
++++ b/setup.py<br>
+@@ -135,6 +135,7 @@ class _M2CryptoBuildExt(build_ext.build_<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.set_undefined_options(&#39;build&#=
39;, (&#39;bundledlls&#39;, &#39;bundledlls&#39;))<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.libraries =3D [&#39;ssl&#39;, &#39=
;crypto&#39;]<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.openssl =3D os.environ.get( &quot;=
STAGING_DIR&quot; )<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if sys.platform =3D=3D &#39;win32&#39;:=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.libraries =3D [&#39;=
ssleay32&#39;, &#39;libeay32&#39;]<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if self.openssl and opens=
sl_version(self.openssl, 0x10100000, True):<br>
-@@ -150,8 +151,8 @@ class _M2CryptoBuildExt(build_ext.build_<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if self.openssl and opens=
sl_version(self.openssl,<br>
+@@ -159,8 +160,8 @@ class _M2CryptoBuildExt(build_ext.build_<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if self.openssl is not None:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 log.debug(&#39;self.opens=
sl =3D %s&#39;, self.openssl)<br>
diff --git a/meta-python/recipes-devtools/python/python-m2crypto/cross-com=
pile-platform.patch b/meta-python/recipes-devtools/python/python3-m2crypto/=
cross-compile-platform.patch<br>
similarity index 84%<br>
rename from meta-python/recipes-devtools/python/python-m2crypto/cross-comp=
ile-platform.patch<br>
rename to meta-python/recipes-devtools/python/python3-m2crypto/cross-compi=
le-platform.patch<br>
index 4b64f4613c..f039ae8665 100644<br>
--- a/meta-python/recipes-devtools/python/python-m2crypto/cross-compile-pl=
atform.patch<br>
+++ b/meta-python/recipes-devtools/python/python3-m2crypto/cross-compile-p=
latform.patch<br>
@@ -4,11 +4,9 @@ since it pokes at the system for getting architecture val=
ues<br>
=C2=A0Upstream-Status: Inappropriate<br>
=C2=A0Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" ta=
rget=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
<br>
-Index: M2Crypto-0.30.1/setup.py<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- M2Crypto-0.30.1.orig/setup.py<br>
-+++ M2Crypto-0.30.1/setup.py<br>
-@@ -160,22 +160,6 @@ class _M2CryptoBuildExt(build_ext.build_<br>
+--- a/setup.py<br>
++++ b/setup.py<br>
+@@ -169,22 +169,6 @@ class _M2CryptoBuildExt(build_ext.build_<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 log.debug(&#39;self.inclu=
de_dirs =3D %s&#39;, self.include_dirs)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 log.debug(&#39;self.libra=
ry_dirs =3D %s&#39;, self.library_dirs)<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3=
-m2crypto_0.30.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-m2crypto_=
0.30.1.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://pytho=
n3-m2crypto_0.30.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-m2crypt=
o_0.30.1.bb</a><br>
deleted file mode 100644<br>
index 4d63d4bd3a..0000000000<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-m2cryp=
to_0.30.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-m2crypto_0.30.1.=
bb</a><br>
+++ /dev/null<br>
@@ -1,2 +0,0 @@<br>
-inherit setuptools3<br>
-require python-m2crypto.inc<br>
diff --git a/meta-python/recipes-devtools/python/python-m2crypto.inc b/met=
a-python/recipes-devtools/python/<a href=3D"http://python3-m2crypto_0.37.1.=
bb" rel=3D"noreferrer" target=3D"_blank">python3-m2crypto_0.37.1.bb</a><br>
similarity index 86%<br>
rename from meta-python/recipes-devtools/python/python-m2crypto.inc<br>
rename to meta-python/recipes-devtools/python/<a href=3D"http://python3-m2=
crypto_0.37.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-m2crypto_0.3=
7.1.bb</a><br>
index 797a0354bf..896d9d2cc4 100644<br>
--- a/meta-python/recipes-devtools/python/python-m2crypto.inc<br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-m2cryp=
to_0.37.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-m2crypto_0.37.1.=
bb</a><br>
@@ -8,13 +8,13 @@ FILESEXTRAPATHS_prepend :=3D &quot;${THISDIR}/python-m2c=
rypto:&quot;<br>
<br>
=C2=A0SRC_URI +=3D &quot;file://0001-setup.py-link-in-sysroot-not-in-host-=
directories.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://cross-compile-platf=
orm.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://m2crypto-0.26.4-gcc_macr=
os.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Allow-verify_cb_-to=
-be-called-with-ok-True.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Use-of-RSA_SSLV23_P=
ADDING-has-been-deprecated.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
-SRC_URI[md5sum] =3D &quot;7fce3cbf85eb84a669682892b935746b&quot;<br>
-SRC_URI[sha256sum] =3D &quot;a1b2751cdadc6afac3df8a5799676b7b7c67a6ad144b=
b62d38563062e7cd3fc6&quot;<br>
+SRC_URI[sha256sum] =3D &quot;e4e42f068b78ccbf113e5d0a72ae5f480f6c3ace4940=
b91e4fff5598cfff6fb3&quot;<br>
<br>
=C2=A0PYPI_PACKAGE =3D &quot;M2Crypto&quot;<br>
-inherit pypi siteinfo<br>
+inherit pypi siteinfo setuptools3<br>
<br>
=C2=A0DEPENDS +=3D &quot;openssl swig-native&quot;<br>
=C2=A0RDEPENDS_${PN} +=3D &quot;\<br>
-- <br>
2.31.1<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--00000000000005975005c198435c--
