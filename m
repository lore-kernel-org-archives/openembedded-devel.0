Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web11.2426.1620245637324564323
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 May 2021 13:13:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GOVruIQw;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a4so4838264ejk.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 05 May 2021 13:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=g8oIY7xUTXo38eq1SS/yE2tbsz3E3l991KGoxx84fSo=;
        b=GOVruIQwiSgQxzqBvSA5DuA6iqz91fziVl/b2pqnNAosJ0RpzTamEFxxylWvcF6Svj
         LBVyLK8cbLjXXWfXVW5W2Marh6Nf60xK5lMRK+RJt+8Rl7FNkiJe2bJKENOjd1JD6h8g
         z2fxZnkSObNTuUH9WSJsqGp/YUFlaM/zPUX26mxyMvZz263sXGyfThL/OfcUVyw31ZlM
         cdDVfjdxijiJJYJNjr4dQI/iIQskjW/R7jtUVtiDTScfslLvN4GCNuWS+q1Q6DfMdsaa
         iSSSaF+g8665UFeE5qooads/F4tUYAiSmzFAujYI7ZWM/Dr2o1wFUR/WUJoAy5G0jsT6
         wBbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=g8oIY7xUTXo38eq1SS/yE2tbsz3E3l991KGoxx84fSo=;
        b=qwUl2X7RSdZMHljVEmMYoYRtWleshxwNRvMtv4/ithlGLgvbloxbQeK2mnNsV0X9aF
         7jkgQGM0p5yZ7p22PGuRZ0hv/NmyV+qZFC3yU8LP5ULrT+/gEqwctru5R9b/rWjrEh/H
         Mj+LB+NVaxqVb4HGwlUGlqe4dyKQOJaJKUr2ceCe3aEa/ihokiTVtS9aZCcZzBk2pHJU
         M+7ChXVdsBmsBN4kjWF5BZsP5ssmV4SWkGZKnZlM8IZJgjqY9ulGCDjNDhl1tQVbPK7U
         D4fF2Dkzl3rYwBhkb1+iATOBHINiZ7NToSvt1Lk1v/Eawt9mDzTsc0blGNHdQnD8Lbgq
         QGbg==
X-Gm-Message-State: AOAM533hPIL3IDklxcarJz5A9ceCqHiI1sAf33/PNYlTeZOZ7mqNUy5Z
	wL3oIf9p9bk0+7hE5omk5WaK5fm35fyyaYy8XuI=
X-Google-Smtp-Source: ABdhPJx4A/13p9I+oSq/EYetmzHI7005WOUITAuePjNtp5uTmr7z7IaoaHcvpEVPV2J+9fGXMSUesbQOdpTWmT7LMaw=
X-Received: by 2002:a17:906:53d1:: with SMTP id p17mr515480ejo.470.1620245635620;
 Wed, 05 May 2021 13:13:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210501190615.545087-1-raj.khem@gmail.com> <CA+chaQdwBJ7LQ4=75L_zT_gaqyw8V0nPCWo=UC+8TDY8U8RxMg@mail.gmail.com>
 <CAMKF1sqFrwS5R4fOwwVf4-xzhF4BAX6ZArR3p04d+sYrLpWTfA@mail.gmail.com>
In-Reply-To: <CAMKF1sqFrwS5R4fOwwVf4-xzhF4BAX6ZArR3p04d+sYrLpWTfA@mail.gmail.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Wed, 5 May 2021 22:13:44 +0200
Message-ID: <CA+chaQdkP3V2NYN9meJD_LFfJeNNB=UnbtLXH2WataHZicwNnA@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-m2crypto: Upgrade to 0.37.1
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000008f625505c19ad531"

--0000000000008f625505c19ad531
Content-Type: text/plain; charset="UTF-8"

It doesn't seem to be missing header file as opensslconf-32.h doesn't exist
in either of them.

oe-core$ find tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/ -name
opensslconf\*
tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/0.37.1-r0/recipe-sysroot-native/usr/include/openssl/opensslconf.h
tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/0.37.1-r0/recipe-sysroot/usr/include/openssl/opensslconf-64.h
tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/0.37.1-r0/recipe-sysroot/usr/include/openssl/opensslconf.h
tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/0.30.1-r0-copy/recipe-sysroot-native/usr/include/openssl/opensslconf.h
tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/0.30.1-r0-copy/recipe-sysroot/usr/include/openssl/opensslconf-64.h
tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/0.30.1-r0-copy/recipe-sysroot/usr/include/openssl/opensslconf.h

and the swig call seems to be similar, but with the new version the -I
flags are different, I wonder if that caused wrong header to be read from
native sysroot or from host (ubuntu-21.04), will try to get some
preprocessed output from swig to see which headers it really read:

oe-core$ grep swig
tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/0.*/temp/log.do_compile
tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/0.30.1-r0-copy/temp/log.do_compile:swigging
SWIG/_m2crypto.i to SWIG/_m2crypto_wrap.c
tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/0.30.1-r0-copy/temp/log.do_compile:swig
-python -py3
-I/OE/build/oe-core/tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/0.30.1-r0/recipe-sysroot/usr/include
-I/OE/build/oe-core/tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/0.30.1-r0/recipe-sysroot/usr/include/python3.9
-I/usr/include/openssl
-I/usr/lib/gcc/x86_64-linux-gnu/10/include
-I/usr/local/include
-I/usr/include/x86_64-linux-gnu
-I/usr/include
-includeall -modern -builtin -outdir
/OE/build/oe-core/tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/0.30.1-r0/M2Crypto-0.30.1/M2Crypto
-o SWIG/_m2crypto_wrap.c SWIG/_m2crypto.i

tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/0.37.1-r0/temp/log.do_compile:swigging
SWIG/_m2crypto.i to SWIG/_m2crypto_wrap.c
tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/0.37.1-r0/temp/log.do_compile:swig
-python -py3
-I/OE/build/oe-core/tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/0.37.1-r0/recipe-sysroot-native/usr/bin/aarch64-oe-linux/../../lib/aarch64-oe-linux/gcc/aarch64-oe-linux/11.1.0/include
-I/OE/build/oe-core/tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/0.37.1-r0/recipe-sysroot-native/usr/bin/aarch64-oe-linux/../../lib/aarch64-oe-linux/gcc/aarch64-oe-linux/11.1.0/include-fixed
-I/OE/build/oe-core/tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/0.37.1-r0/recipe-sysroot/usr/lib/aarch64-oe-linux/11.1.0/include
-I/OE/build/oe-core/tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/0.37.1-r0/recipe-sysroot/usr/include
-I/OE/build/oe-core/tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/0.37.1-r0/recipe-sysroot/usr/include
-I/OE/build/oe-core/tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/0.37.1-r0/recipe-sysroot/usr/include/python3.9
-I/usr/include/openssl
-includeall -modern -builtin -outdir
/OE/build/oe-core/tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/0.37.1-r0/M2Crypto-0.37.1/M2Crypto
-o SWIG/_m2crypto_wrap.c SWIG/_m2crypto.i

On Wed, May 5, 2021 at 7:41 PM Khem Raj <raj.khem@gmail.com> wrote:

> hmmm I use
>
>
> https://github.com/YoeDistro/openembedded-core/commit/bbb5e56c6db0fc7997a093bb400021edce6c7639
>
> and i wonder thats why I do not see this ?
>
> On Wed, May 5, 2021 at 10:09 AM Martin Jansa <martin.jansa@gmail.com>
> wrote:
> >
> > This upgrade seems to break the build for aarch64:
> > http://errors.yoctoproject.org/Errors/Details/580206/
> >
> > On Sat, May 1, 2021 at 9:06 PM Khem Raj <raj.khem@gmail.com> wrote:
> >>
> >> Unifiy .inc into .bb
> >> Add patches to fix issues with openssl 1.1.x
> >> Remove m2crypto-0.26.4-gcc_macros patch, its no longer needed
> >> Refresh existing patches
> >>
> >> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> ---
> >>  .../m2crypto-0.26.4-gcc_macros.patch          | 35 --------------
> >>  ...verify_cb_-to-be-called-with-ok-True.patch | 47 +++++++++++++++++++
> >>  ...A_SSLV23_PADDING-has-been-deprecated.patch | 29 ++++++++++++
> >>  ...k-in-sysroot-not-in-host-directories.patch | 12 ++---
> >>  .../cross-compile-platform.patch              |  8 ++--
> >>  .../python/python3-m2crypto_0.30.1.bb         |  2 -
> >>  ...2crypto.inc => python3-m2crypto_0.37.1.bb} |  8 ++--
> >>  7 files changed, 88 insertions(+), 53 deletions(-)
> >>  delete mode 100644
> meta-python/recipes-devtools/python/python-m2crypto/m2crypto-0.26.4-gcc_macros.patch
> >>  create mode 100644
> meta-python/recipes-devtools/python/python3-m2crypto/0001-Allow-verify_cb_-to-be-called-with-ok-True.patch
> >>  create mode 100644
> meta-python/recipes-devtools/python/python3-m2crypto/0001-Use-of-RSA_SSLV23_PADDING-has-been-deprecated.patch
> >>  rename meta-python/recipes-devtools/python/{python-m2crypto =>
> python3-m2crypto}/0001-setup.py-link-in-sysroot-not-in-host-directories.patch
> (75%)
> >>  rename meta-python/recipes-devtools/python/{python-m2crypto =>
> python3-m2crypto}/cross-compile-platform.patch (84%)
> >>  delete mode 100644 meta-python/recipes-devtools/python/
> python3-m2crypto_0.30.1.bb
> >>  rename meta-python/recipes-devtools/python/{python-m2crypto.inc =>
> python3-m2crypto_0.37.1.bb} (86%)
> >>
> >> diff --git
> a/meta-python/recipes-devtools/python/python-m2crypto/m2crypto-0.26.4-gcc_macros.patch
> b/meta-python/recipes-devtools/python/python-m2crypto/m2crypto-0.26.4-gcc_macros.patch
> >> deleted file mode 100644
> >> index 7f6dd29f8a..0000000000
> >> ---
> a/meta-python/recipes-devtools/python/python-m2crypto/m2crypto-0.26.4-gcc_macros.patch
> >> +++ /dev/null
> >> @@ -1,35 +0,0 @@
> >> -Imported from Fedora
> >> -
> >> -Index: M2Crypto-0.30.1/SWIG/_m2crypto.i
> >> -===================================================================
> >> ---- M2Crypto-0.30.1.orig/SWIG/_m2crypto.i
> >> -+++ M2Crypto-0.30.1/SWIG/_m2crypto.i
> >> -@@ -8,6 +8,11 @@
> >> -  *
> >> -  */
> >> -
> >> -+%import "gcc_macros.h"
> >> -+
> >> -+%ignore WCHAR_MAX;
> >> -+%ignore WCHAR_MIN;
> >> -+
> >> - %module(threads=1) m2crypto
> >> - /* We really don't need threadblock (PyGILState_Ensure() etc.)
> anywhere.
> >> -    Disable threadallow as well, only enable it for operations likely
> to
> >> -@@ -15,11 +20,6 @@
> >> - %nothreadblock;
> >> - %nothreadallow;
> >> -
> >> --#if SWIG_VERSION >= 0x030000
> >> --#define __WCHAR_MAX__ __WCHAR_MAX
> >> --#define __WCHAR_MIN__ __WCHAR_MIN
> >> --#endif
> >> --
> >> - %{
> >> - #ifdef _WIN32
> >> - #define _WINSOCKAPI_
> >> -@@ -95,4 +95,3 @@ static PyObject *x509_store_verify_cb_fu
> >> - %constant int encrypt = 1;
> >> - %constant int decrypt = 0;
> >> - #endif
> >> --
> >> diff --git
> a/meta-python/recipes-devtools/python/python3-m2crypto/0001-Allow-verify_cb_-to-be-called-with-ok-True.patch
> b/meta-python/recipes-devtools/python/python3-m2crypto/0001-Allow-verify_cb_-to-be-called-with-ok-True.patch
> >> new file mode 100644
> >> index 0000000000..3c836635a1
> >> --- /dev/null
> >> +++
> b/meta-python/recipes-devtools/python/python3-m2crypto/0001-Allow-verify_cb_-to-be-called-with-ok-True.patch
> >> @@ -0,0 +1,47 @@
> >> +From 73fbd1e646f6bbf202d4418bae80eb9941fbf552 Mon Sep 17 00:00:00 2001
> >> +From: Casey Deccio <casey@deccio.net>
> >> +Date: Fri, 8 Jan 2021 12:43:09 -0700
> >> +Subject: [PATCH] Allow verify_cb_* to be called with ok=True
> >> +
> >> +With
> https://github.com/openssl/openssl/commit/2e06150e3928daa06d5ff70c32bffad8088ebe58
> >> +OpenSSL allowed verificaton to continue on
> UNABLE_TO_VERIFY_LEAF_SIGNATURE
> >> +---
> >> + tests/test_ssl.py | 14 ++++++++++++--
> >> + 1 file changed, 12 insertions(+), 2 deletions(-)
> >> +
> >> +diff --git a/tests/test_ssl.py b/tests/test_ssl.py
> >> +index 92b6942..7a3271a 100644
> >> +--- a/tests/test_ssl.py
> >> ++++ b/tests/test_ssl.py
> >> +@@ -59,8 +59,13 @@ def allocate_srv_port():
> >> +
> >> +
> >> + def verify_cb_new_function(ok, store):
> >> +-    assert not ok
> >> +     err = store.get_error()
> >> ++    # If err is X509_V_ERR_UNABLE_TO_VERIFY_LEAF_SIGNATURE, then
> instead of
> >> ++    # aborting, this callback is called to retrieve additional error
> >> ++    # information.  In this case, ok might not be False.
> >> ++    # See
> https://github.com/openssl/openssl/commit/2e06150e3928daa06d5ff70c32bffad8088ebe58
> >> ++    if err != m2.X509_V_ERR_UNABLE_TO_VERIFY_LEAF_SIGNATURE:
> >> ++        assert not ok
> >> +     assert err in [m2.X509_V_ERR_DEPTH_ZERO_SELF_SIGNED_CERT,
> >> +                    m2.X509_V_ERR_UNABLE_TO_GET_ISSUER_CERT_LOCALLY,
> >> +                    m2.X509_V_ERR_CERT_UNTRUSTED,
> >> +@@ -618,7 +623,12 @@ class
> MiscSSLClientTestCase(BaseSSLClientTestCase):
> >> +
> >> +     def verify_cb_old(self, ctx_ptr, x509_ptr, err, depth, ok):
> >> +         try:
> >> +-            self.assertFalse(ok)
> >> ++            # If err is X509_V_ERR_UNABLE_TO_VERIFY_LEAF_SIGNATURE,
> then instead of
> >> ++            # aborting, this callback is called to retrieve
> additional error
> >> ++            # information.  In this case, ok might not be False.
> >> ++            # See
> https://github.com/openssl/openssl/commit/2e06150e3928daa06d5ff70c32bffad8088ebe58
> >> ++            if err != m2.X509_V_ERR_UNABLE_TO_VERIFY_LEAF_SIGNATURE:
> >> ++                self.assertFalse(ok)
> >> +             self.assertIn(err,
> >> +                           [m2.X509_V_ERR_DEPTH_ZERO_SELF_SIGNED_CERT,
> >> +
> m2.X509_V_ERR_UNABLE_TO_GET_ISSUER_CERT_LOCALLY,
> >> +--
> >> +2.29.2
> >> +
> >> diff --git
> a/meta-python/recipes-devtools/python/python3-m2crypto/0001-Use-of-RSA_SSLV23_PADDING-has-been-deprecated.patch
> b/meta-python/recipes-devtools/python/python3-m2crypto/0001-Use-of-RSA_SSLV23_PADDING-has-been-deprecated.patch
> >> new file mode 100644
> >> index 0000000000..2313a324a0
> >> --- /dev/null
> >> +++
> b/meta-python/recipes-devtools/python/python3-m2crypto/0001-Use-of-RSA_SSLV23_PADDING-has-been-deprecated.patch
> >> @@ -0,0 +1,29 @@
> >> +From d06eaa88a5f491827733f32027c46de3557fbd05 Mon Sep 17 00:00:00 2001
> >> +From: =?UTF-8?q?Mat=C4=9Bj=20Cepl?= <mcepl@cepl.eu>
> >> +Date: Fri, 19 Feb 2021 15:53:02 +0100
> >> +Subject: [PATCH] Use of RSA_SSLV23_PADDING has been deprecated.
> >> +
> >> +Fixes #293.
> >> +---
> >> + tests/test_rsa.py | 5 -----
> >> + 1 file changed, 5 deletions(-)
> >> +
> >> +diff --git a/tests/test_rsa.py b/tests/test_rsa.py
> >> +index 3de5016..7299785 100644
> >> +--- a/tests/test_rsa.py
> >> ++++ b/tests/test_rsa.py
> >> +@@ -124,11 +124,6 @@ class RSATestCase(unittest.TestCase):
> >> +             ptxt = priv.private_decrypt(ctxt, p)
> >> +             self.assertEqual(ptxt, self.data)
> >> +
> >> +-        # sslv23_padding
> >> +-        ctxt = priv.public_encrypt(self.data, RSA.sslv23_padding)
> >> +-        res = priv.private_decrypt(ctxt, RSA.sslv23_padding)
> >> +-        self.assertEqual(res, self.data)
> >> +-
> >> +         # no_padding
> >> +         with six.assertRaisesRegex(self, RSA.RSAError, 'data too
> small'):
> >> +             priv.public_encrypt(self.data, RSA.no_padding)
> >> +--
> >> +2.29.2
> >> +
> >> diff --git
> a/meta-python/recipes-devtools/python/python-m2crypto/0001-setup.py-link-in-sysroot-not-in-host-directories.patch
> b/meta-python/recipes-devtools/python/python3-m2crypto/0001-setup.py-link-in-sysroot-not-in-host-directories.patch
> >> similarity index 75%
> >> rename from
> meta-python/recipes-devtools/python/python-m2crypto/0001-setup.py-link-in-sysroot-not-in-host-directories.patch
> >> rename to
> meta-python/recipes-devtools/python/python3-m2crypto/0001-setup.py-link-in-sysroot-not-in-host-directories.patch
> >> index b339d93f75..f4c74384f9 100644
> >> ---
> a/meta-python/recipes-devtools/python/python-m2crypto/0001-setup.py-link-in-sysroot-not-in-host-directories.patch
> >> +++
> b/meta-python/recipes-devtools/python/python3-m2crypto/0001-setup.py-link-in-sysroot-not-in-host-directories.patch
> >> @@ -10,19 +10,17 @@ Upstream-status: Unknown
> >>   setup.py | 6 +++---
> >>   1 file changed, 3 insertions(+), 3 deletions(-)
> >>
> >> -Index: M2Crypto-0.30.1/setup.py
> >> -===================================================================
> >> ---- M2Crypto-0.30.1.orig/setup.py
> >> -+++ M2Crypto-0.30.1/setup.py
> >> -@@ -130,6 +130,7 @@ class _M2CryptoBuildExt(build_ext.build_
> >> +--- a/setup.py
> >> ++++ b/setup.py
> >> +@@ -135,6 +135,7 @@ class _M2CryptoBuildExt(build_ext.build_
> >>           self.set_undefined_options('build', ('bundledlls',
> 'bundledlls'))
> >>
> >>           self.libraries = ['ssl', 'crypto']
> >>  +        self.openssl = os.environ.get( "STAGING_DIR" )
> >>           if sys.platform == 'win32':
> >>               self.libraries = ['ssleay32', 'libeay32']
> >> -             if self.openssl and openssl_version(self.openssl,
> 0x10100000, True):
> >> -@@ -150,8 +151,8 @@ class _M2CryptoBuildExt(build_ext.build_
> >> +             if self.openssl and openssl_version(self.openssl,
> >> +@@ -159,8 +160,8 @@ class _M2CryptoBuildExt(build_ext.build_
> >>
> >>           if self.openssl is not None:
> >>               log.debug('self.openssl = %s', self.openssl)
> >> diff --git
> a/meta-python/recipes-devtools/python/python-m2crypto/cross-compile-platform.patch
> b/meta-python/recipes-devtools/python/python3-m2crypto/cross-compile-platform.patch
> >> similarity index 84%
> >> rename from
> meta-python/recipes-devtools/python/python-m2crypto/cross-compile-platform.patch
> >> rename to
> meta-python/recipes-devtools/python/python3-m2crypto/cross-compile-platform.patch
> >> index 4b64f4613c..f039ae8665 100644
> >> ---
> a/meta-python/recipes-devtools/python/python-m2crypto/cross-compile-platform.patch
> >> +++
> b/meta-python/recipes-devtools/python/python3-m2crypto/cross-compile-platform.patch
> >> @@ -4,11 +4,9 @@ since it pokes at the system for getting architecture
> values
> >>  Upstream-Status: Inappropriate
> >>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>
> >> -Index: M2Crypto-0.30.1/setup.py
> >> -===================================================================
> >> ---- M2Crypto-0.30.1.orig/setup.py
> >> -+++ M2Crypto-0.30.1/setup.py
> >> -@@ -160,22 +160,6 @@ class _M2CryptoBuildExt(build_ext.build_
> >> +--- a/setup.py
> >> ++++ b/setup.py
> >> +@@ -169,22 +169,6 @@ class _M2CryptoBuildExt(build_ext.build_
> >>               log.debug('self.include_dirs = %s', self.include_dirs)
> >>               log.debug('self.library_dirs = %s', self.library_dirs)
> >>
> >> diff --git a/meta-python/recipes-devtools/python/
> python3-m2crypto_0.30.1.bb b/meta-python/recipes-devtools/python/
> python3-m2crypto_0.30.1.bb
> >> deleted file mode 100644
> >> index 4d63d4bd3a..0000000000
> >> --- a/meta-python/recipes-devtools/python/python3-m2crypto_0.30.1.bb
> >> +++ /dev/null
> >> @@ -1,2 +0,0 @@
> >> -inherit setuptools3
> >> -require python-m2crypto.inc
> >> diff --git a/meta-python/recipes-devtools/python/python-m2crypto.inc
> b/meta-python/recipes-devtools/python/python3-m2crypto_0.37.1.bb
> >> similarity index 86%
> >> rename from meta-python/recipes-devtools/python/python-m2crypto.inc
> >> rename to meta-python/recipes-devtools/python/
> python3-m2crypto_0.37.1.bb
> >> index 797a0354bf..896d9d2cc4 100644
> >> --- a/meta-python/recipes-devtools/python/python-m2crypto.inc
> >> +++ b/meta-python/recipes-devtools/python/python3-m2crypto_0.37.1.bb
> >> @@ -8,13 +8,13 @@ FILESEXTRAPATHS_prepend :=
> "${THISDIR}/python-m2crypto:"
> >>
> >>  SRC_URI +=
> "file://0001-setup.py-link-in-sysroot-not-in-host-directories.patch \
> >>              file://cross-compile-platform.patch \
> >> -            file://m2crypto-0.26.4-gcc_macros.patch \
> >> +
> file://0001-Allow-verify_cb_-to-be-called-with-ok-True.patch \
> >> +
> file://0001-Use-of-RSA_SSLV23_PADDING-has-been-deprecated.patch \
> >>             "
> >> -SRC_URI[md5sum] = "7fce3cbf85eb84a669682892b935746b"
> >> -SRC_URI[sha256sum] =
> "a1b2751cdadc6afac3df8a5799676b7b7c67a6ad144bb62d38563062e7cd3fc6"
> >> +SRC_URI[sha256sum] =
> "e4e42f068b78ccbf113e5d0a72ae5f480f6c3ace4940b91e4fff5598cfff6fb3"
> >>
> >>  PYPI_PACKAGE = "M2Crypto"
> >> -inherit pypi siteinfo
> >> +inherit pypi siteinfo setuptools3
> >>
> >>  DEPENDS += "openssl swig-native"
> >>  RDEPENDS_${PN} += "\
> >> --
> >> 2.31.1
> >>
> >>
> >> 
> >>
>

--0000000000008f625505c19ad531
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>It doesn&#39;t seem to be missing header file as open=
sslconf-32.h doesn&#39;t exist in either of them.</div><div><br></div>oe-co=
re$ find tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/ -name opensslc=
onf\*<br>tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/0.37.1-r0/recip=
e-sysroot-native/usr/include/openssl/opensslconf.h<br>tmp-glibc/work/cortex=
a57-oe-linux/python3-m2crypto/0.37.1-r0/recipe-sysroot/usr/include/openssl/=
opensslconf-64.h<br>tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/0.37=
.1-r0/recipe-sysroot/usr/include/openssl/opensslconf.h<br>tmp-glibc/work/co=
rtexa57-oe-linux/python3-m2crypto/0.30.1-r0-copy/recipe-sysroot-native/usr/=
include/openssl/opensslconf.h<br>tmp-glibc/work/cortexa57-oe-linux/python3-=
m2crypto/0.30.1-r0-copy/recipe-sysroot/usr/include/openssl/opensslconf-64.h=
<br>tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/0.30.1-r0-copy/recip=
e-sysroot/usr/include/openssl/opensslconf.h<br><div><br></div><div>and the =
swig call seems to be similar, but with the new version the -I flags are di=
fferent, I wonder if that caused wrong header to be read from native sysroo=
t or from host (ubuntu-21.04), will try to get some preprocessed output fro=
m swig to see which headers it really read:</div><div><br></div><div>oe-cor=
e$ grep swig tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/0.*/temp/lo=
g.do_compile<br>tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/0.30.1-r=
0-copy/temp/log.do_compile:swigging SWIG/_m2crypto.i to SWIG/_m2crypto_wrap=
.c<br>tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/0.30.1-r0-copy/tem=
p/log.do_compile:swig -python -py3</div><div>-I/OE/build/oe-core/tmp-glibc/=
work/cortexa57-oe-linux/python3-m2crypto/0.30.1-r0/recipe-sysroot/usr/inclu=
de</div><div>-I/OE/build/oe-core/tmp-glibc/work/cortexa57-oe-linux/python3-=
m2crypto/0.30.1-r0/recipe-sysroot/usr/include/python3.9</div><div>-I/usr/in=
clude/openssl</div><div>-I/usr/lib/gcc/x86_64-linux-gnu/10/include</div><di=
v>-I/usr/local/include</div><div>-I/usr/include/x86_64-linux-gnu</div><div>=
-I/usr/include</div><div>-includeall -modern -builtin -outdir /OE/build/oe-=
core/tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/0.30.1-r0/M2Crypto-=
0.30.1/M2Crypto -o SWIG/_m2crypto_wrap.c SWIG/_m2crypto.i</div><div><br>tmp=
-glibc/work/cortexa57-oe-linux/python3-m2crypto/0.37.1-r0/temp/log.do_compi=
le:swigging SWIG/_m2crypto.i to SWIG/_m2crypto_wrap.c<br>tmp-glibc/work/cor=
texa57-oe-linux/python3-m2crypto/0.37.1-r0/temp/log.do_compile:swig -python=
 -py3</div><div>-I/OE/build/oe-core/tmp-glibc/work/cortexa57-oe-linux/pytho=
n3-m2crypto/0.37.1-r0/recipe-sysroot-native/usr/bin/aarch64-oe-linux/../../=
lib/aarch64-oe-linux/gcc/aarch64-oe-linux/11.1.0/include<br>-I/OE/build/oe-=
core/tmp-glibc/work/cortexa57-oe-linux/python3-m2crypto/0.37.1-r0/recipe-sy=
sroot-native/usr/bin/aarch64-oe-linux/../../lib/aarch64-oe-linux/gcc/aarch6=
4-oe-linux/11.1.0/include-fixed</div><div>-I/OE/build/oe-core/tmp-glibc/wor=
k/cortexa57-oe-linux/python3-m2crypto/0.37.1-r0/recipe-sysroot/usr/lib/aarc=
h64-oe-linux/11.1.0/include</div><div>-I/OE/build/oe-core/tmp-glibc/work/co=
rtexa57-oe-linux/python3-m2crypto/0.37.1-r0/recipe-sysroot/usr/include</div=
><div>-I/OE/build/oe-core/tmp-glibc/work/cortexa57-oe-linux/python3-m2crypt=
o/0.37.1-r0/recipe-sysroot/usr/include</div><div>-I/OE/build/oe-core/tmp-gl=
ibc/work/cortexa57-oe-linux/python3-m2crypto/0.37.1-r0/recipe-sysroot/usr/i=
nclude/python3.9</div><div>-I/usr/include/openssl</div><div>-includeall -mo=
dern -builtin -outdir /OE/build/oe-core/tmp-glibc/work/cortexa57-oe-linux/p=
ython3-m2crypto/0.37.1-r0/M2Crypto-0.37.1/M2Crypto -o SWIG/_m2crypto_wrap.c=
 SWIG/_m2crypto.i<br></div></div><br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">On Wed, May 5, 2021 at 7:41 PM Khem Raj &lt;<a h=
ref=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">hmmm I use<br>
<br>
<a href=3D"https://github.com/YoeDistro/openembedded-core/commit/bbb5e56c6=
db0fc7997a093bb400021edce6c7639" rel=3D"noreferrer" target=3D"_blank">https=
://github.com/YoeDistro/openembedded-core/commit/bbb5e56c6db0fc7997a093bb40=
0021edce6c7639</a><br>
<br>
and i wonder thats why I do not see this ?<br>
<br>
On Wed, May 5, 2021 at 10:09 AM Martin Jansa &lt;<a href=3D"mailto:martin.=
jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt; wrote:<br=
>
&gt;<br>
&gt; This upgrade seems to break the build for aarch64:<br>
&gt; <a href=3D"http://errors.yoctoproject.org/Errors/Details/580206/" rel=
=
=3D"noreferrer" target=3D"_blank">http://errors.yoctoproject.org/Errors/De=
tails/580206/</a><br>
&gt;<br>
&gt; On Sat, May 1, 2021 at 9:06 PM Khem Raj &lt;<a href=3D"mailto:raj.khe=
m@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; Unifiy .inc into .bb<br>
&gt;&gt; Add patches to fix issues with openssl 1.1.x<br>
&gt;&gt; Remove m2crypto-0.26.4-gcc_macros patch, its no longer needed<br>
&gt;&gt; Refresh existing patches<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com"=
 target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 .../m2crypto-0.26.4-gcc_macros.patch=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 35 --------------<br>
&gt;&gt;=C2=A0 ...verify_cb_-to-be-called-with-ok-True.patch | 47 ++++++++=
+++++++++++<br>
&gt;&gt;=C2=A0 ...A_SSLV23_PADDING-has-been-deprecated.patch | 29 ++++++++=
++++<br>
&gt;&gt;=C2=A0 ...k-in-sysroot-not-in-host-directories.patch | 12 ++---<br=
>
&gt;&gt;=C2=A0 .../cross-compile-platform.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 8 ++--<br>
&gt;&gt;=C2=A0 .../python/<a href=3D"http://python3-m2crypto_0.30.1.bb" re=
l=3D"noreferrer" target=3D"_blank">python3-m2crypto_0.30.1.bb</a>=C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 -<br>
&gt;&gt;=C2=A0 ...2crypto.inc =3D&gt; <a href=3D"http://python3-m2crypto_0=
.37.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-m2crypto_0.37.1.bb</=
a>} |=C2=A0 8 ++--<br>
&gt;&gt;=C2=A0 7 files changed, 88 insertions(+), 53 deletions(-)<br>
&gt;&gt;=C2=A0 delete mode 100644 meta-python/recipes-devtools/python/pyth=
on-m2crypto/m2crypto-0.26.4-gcc_macros.patch<br>
&gt;&gt;=C2=A0 create mode 100644 meta-python/recipes-devtools/python/pyth=
on3-m2crypto/0001-Allow-verify_cb_-to-be-called-with-ok-True.patch<br>
&gt;&gt;=C2=A0 create mode 100644 meta-python/recipes-devtools/python/pyth=
on3-m2crypto/0001-Use-of-RSA_SSLV23_PADDING-has-been-deprecated.patch<br>
&gt;&gt;=C2=A0 rename meta-python/recipes-devtools/python/{python-m2crypto=
 =3D&gt; python3-m2crypto}/0001-setup.py-link-in-sysroot-not-in-host-direct=
ories.patch (75%)<br>
&gt;&gt;=C2=A0 rename meta-python/recipes-devtools/python/{python-m2crypto=
 =3D&gt; python3-m2crypto}/cross-compile-platform.patch (84%)<br>
&gt;&gt;=C2=A0 delete mode 100644 meta-python/recipes-devtools/python/<a h=
ref=3D"http://python3-m2crypto_0.30.1.bb" rel=3D"noreferrer" target=3D"_bla=
nk">python3-m2crypto_0.30.1.bb</a><br>
&gt;&gt;=C2=A0 rename meta-python/recipes-devtools/python/{python-m2crypto=
.inc =3D&gt; <a href=3D"http://python3-m2crypto_0.37.1.bb" rel=3D"noreferre=
r" target=3D"_blank">python3-m2crypto_0.37.1.bb</a>} (86%)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta-python/recipes-devtools/python/python-m2crypto/=
m2crypto-0.26.4-gcc_macros.patch b/meta-python/recipes-devtools/python/pyth=
on-m2crypto/m2crypto-0.26.4-gcc_macros.patch<br>
&gt;&gt; deleted file mode 100644<br>
&gt;&gt; index 7f6dd29f8a..0000000000<br>
&gt;&gt; --- a/meta-python/recipes-devtools/python/python-m2crypto/m2crypt=
o-0.26.4-gcc_macros.patch<br>
&gt;&gt; +++ /dev/null<br>
&gt;&gt; @@ -1,35 +0,0 @@<br>
&gt;&gt; -Imported from Fedora<br>
&gt;&gt; -<br>
&gt;&gt; -Index: M2Crypto-0.30.1/SWIG/_m2crypto.i<br>
&gt;&gt; -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt;&gt; ---- M2Crypto-0.30.1.orig/SWIG/_m2crypto.i<br>
&gt;&gt; -+++ M2Crypto-0.30.1/SWIG/_m2crypto.i<br>
&gt;&gt; -@@ -8,6 +8,11 @@<br>
&gt;&gt; -=C2=A0 *<br>
&gt;&gt; -=C2=A0 */<br>
&gt;&gt; -<br>
&gt;&gt; -+%import &quot;gcc_macros.h&quot;<br>
&gt;&gt; -+<br>
&gt;&gt; -+%ignore WCHAR_MAX;<br>
&gt;&gt; -+%ignore WCHAR_MIN;<br>
&gt;&gt; -+<br>
&gt;&gt; - %module(threads=3D1) m2crypto<br>
&gt;&gt; - /* We really don&#39;t need threadblock (PyGILState_Ensure() et=
c.) anywhere.<br>
&gt;&gt; -=C2=A0 =C2=A0 Disable threadallow as well, only enable it for op=
erations likely to<br>
&gt;&gt; -@@ -15,11 +20,6 @@<br>
&gt;&gt; - %nothreadblock;<br>
&gt;&gt; - %nothreadallow;<br>
&gt;&gt; -<br>
&gt;&gt; --#if SWIG_VERSION &gt;=3D 0x030000<br>
&gt;&gt; --#define __WCHAR_MAX__ __WCHAR_MAX<br>
&gt;&gt; --#define __WCHAR_MIN__ __WCHAR_MIN<br>
&gt;&gt; --#endif<br>
&gt;&gt; --<br>
&gt;&gt; - %{<br>
&gt;&gt; - #ifdef _WIN32<br>
&gt;&gt; - #define _WINSOCKAPI_<br>
&gt;&gt; -@@ -95,4 +95,3 @@ static PyObject *x509_store_verify_cb_fu<br>
&gt;&gt; - %constant int encrypt =3D 1;<br>
&gt;&gt; - %constant int decrypt =3D 0;<br>
&gt;&gt; - #endif<br>
&gt;&gt; --<br>
&gt;&gt; diff --git a/meta-python/recipes-devtools/python/python3-m2crypto=
/0001-Allow-verify_cb_-to-be-called-with-ok-True.patch b/meta-python/recipe=
s-devtools/python/python3-m2crypto/0001-Allow-verify_cb_-to-be-called-with-=
ok-True.patch<br>
&gt;&gt; new file mode 100644<br>
&gt;&gt; index 0000000000..3c836635a1<br>
&gt;&gt; --- /dev/null<br>
&gt;&gt; +++ b/meta-python/recipes-devtools/python/python3-m2crypto/0001-A=
llow-verify_cb_-to-be-called-with-ok-True.patch<br>
&gt;&gt; @@ -0,0 +1,47 @@<br>
&gt;&gt; +From 73fbd1e646f6bbf202d4418bae80eb9941fbf552 Mon Sep 17 00:00:0=
0 2001<br>
&gt;&gt; +From: Casey Deccio &lt;<a href=3D"mailto:casey@deccio.net" targe=
t=3D"_blank">casey@deccio.net</a>&gt;<br>
&gt;&gt; +Date: Fri, 8 Jan 2021 12:43:09 -0700<br>
&gt;&gt; +Subject: [PATCH] Allow verify_cb_* to be called with ok=3DTrue<b=
r>
&gt;&gt; +<br>
&gt;&gt; +With <a href=3D"https://github.com/openssl/openssl/commit/2e0615=
0e3928daa06d5ff70c32bffad8088ebe58" rel=3D"noreferrer" target=3D"_blank">ht=
tps://github.com/openssl/openssl/commit/2e06150e3928daa06d5ff70c32bffad8088=
ebe58</a><br>
&gt;&gt; +OpenSSL allowed verificaton to continue on UNABLE_TO_VERIFY_LEAF=
_SIGNATURE<br>
&gt;&gt; +---<br>
&gt;&gt; + tests/test_ssl.py | 14 ++++++++++++--<br>
&gt;&gt; + 1 file changed, 12 insertions(+), 2 deletions(-)<br>
&gt;&gt; +<br>
&gt;&gt; +diff --git a/tests/test_ssl.py b/tests/test_ssl.py<br>
&gt;&gt; +index 92b6942..7a3271a 100644<br>
&gt;&gt; +--- a/tests/test_ssl.py<br>
&gt;&gt; ++++ b/tests/test_ssl.py<br>
&gt;&gt; +@@ -59,8 +59,13 @@ def allocate_srv_port():<br>
&gt;&gt; +<br>
&gt;&gt; +<br>
&gt;&gt; + def verify_cb_new_function(ok, store):<br>
&gt;&gt; +-=C2=A0 =C2=A0 assert not ok<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0err =3D store.get_error()<br>
&gt;&gt; ++=C2=A0 =C2=A0 # If err is X509_V_ERR_UNABLE_TO_VERIFY_LEAF_SIGN=
ATURE, then instead of<br>
&gt;&gt; ++=C2=A0 =C2=A0 # aborting, this callback is called to retrieve a=
dditional error<br>
&gt;&gt; ++=C2=A0 =C2=A0 # information.=C2=A0 In this case, ok might not b=
e False.<br>
&gt;&gt; ++=C2=A0 =C2=A0 # See <a href=3D"https://github.com/openssl/opens=
sl/commit/2e06150e3928daa06d5ff70c32bffad8088ebe58" rel=3D"noreferrer" targ=
et=3D"_blank">https://github.com/openssl/openssl/commit/2e06150e3928daa06d5=
ff70c32bffad8088ebe58</a><br>
&gt;&gt; ++=C2=A0 =C2=A0 if err !=3D m2.X509_V_ERR_UNABLE_TO_VERIFY_LEAF_S=
IGNATURE:<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert not ok<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0assert err in [m2.X509_V_ERR_DEPTH_ZERO_SELF=
_SIGNED_CERT,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 m2.X509_V_ERR_UNABLE_TO_GET_ISSUER_CERT_LOCALLY,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 m2.X509_V_ERR_CERT_UNTRUSTED,<br>
&gt;&gt; +@@ -618,7 +623,12 @@ class MiscSSLClientTestCase(BaseSSLClientTe=
stCase):<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0def verify_cb_old(self, ctx_ptr, x509_ptr, e=
rr, depth, ok):<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0try:<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertFalse(ok)<=
br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # If err is X509_V_ER=
R_UNABLE_TO_VERIFY_LEAF_SIGNATURE, then instead of<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # aborting, this call=
back is called to retrieve additional error<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # information.=C2=A0 =
In this case, ok might not be False.<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # See <a href=3D"http=
s://github.com/openssl/openssl/commit/2e06150e3928daa06d5ff70c32bffad8088eb=
e58" rel=3D"noreferrer" target=3D"_blank">https://github.com/openssl/openss=
l/commit/2e06150e3928daa06d5ff70c32bffad8088ebe58</a><br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if err !=3D m2.X509_V=
_ERR_UNABLE_TO_VERIFY_LEAF_SIGNATURE:<br>
&gt;&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.as=
sertFalse(ok)<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.assertIn(er=
r,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[m2.X509_V_ERR_DEPTH_ZERO_SELF_SIGNED_CE=
RT,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 m2.X509_V_ERR_UNABLE_TO_GET_ISSUER_CERT=
_LOCALLY,<br>
&gt;&gt; +--<br>
&gt;&gt; +2.29.2<br>
&gt;&gt; +<br>
&gt;&gt; diff --git a/meta-python/recipes-devtools/python/python3-m2crypto=
/0001-Use-of-RSA_SSLV23_PADDING-has-been-deprecated.patch b/meta-python/rec=
ipes-devtools/python/python3-m2crypto/0001-Use-of-RSA_SSLV23_PADDING-has-be=
en-deprecated.patch<br>
&gt;&gt; new file mode 100644<br>
&gt;&gt; index 0000000000..2313a324a0<br>
&gt;&gt; --- /dev/null<br>
&gt;&gt; +++ b/meta-python/recipes-devtools/python/python3-m2crypto/0001-U=
se-of-RSA_SSLV23_PADDING-has-been-deprecated.patch<br>
&gt;&gt; @@ -0,0 +1,29 @@<br>
&gt;&gt; +From d06eaa88a5f491827733f32027c46de3557fbd05 Mon Sep 17 00:00:0=
0 2001<br>
&gt;&gt; +From: =3D?UTF-8?q?Mat=3DC4=3D9Bj=3D20Cepl?=3D &lt;<a href=3D"mai=
lto:mcepl@cepl.eu" target=3D"_blank">mcepl@cepl.eu</a>&gt;<br>
&gt;&gt; +Date: Fri, 19 Feb 2021 15:53:02 +0100<br>
&gt;&gt; +Subject: [PATCH] Use of RSA_SSLV23_PADDING has been deprecated.<=
br>
&gt;&gt; +<br>
&gt;&gt; +Fixes #293.<br>
&gt;&gt; +---<br>
&gt;&gt; + tests/test_rsa.py | 5 -----<br>
&gt;&gt; + 1 file changed, 5 deletions(-)<br>
&gt;&gt; +<br>
&gt;&gt; +diff --git a/tests/test_rsa.py b/tests/test_rsa.py<br>
&gt;&gt; +index 3de5016..7299785 100644<br>
&gt;&gt; +--- a/tests/test_rsa.py<br>
&gt;&gt; ++++ b/tests/test_rsa.py<br>
&gt;&gt; +@@ -124,11 +124,6 @@ class RSATestCase(unittest.TestCase):<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ptxt =3D priv.pr=
ivate_decrypt(ctxt, p)<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.assertEqual=
(ptxt, self.data)<br>
&gt;&gt; +<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # sslv23_padding<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 ctxt =3D priv.public_encrypt(self.d=
ata, RSA.sslv23_padding)<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 res =3D priv.private_decrypt(ctxt, =
RSA.sslv23_padding)<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(res, self.data)<br=
>
&gt;&gt; +-<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# no_padding<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0with six.assertRaisesRegex(sel=
f, RSA.RSAError, &#39;data too small&#39;):<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0priv.public_encr=
ypt(self.data, RSA.no_padding)<br>
&gt;&gt; +--<br>
&gt;&gt; +2.29.2<br>
&gt;&gt; +<br>
&gt;&gt; diff --git a/meta-python/recipes-devtools/python/python-m2crypto/=
0001-setup.py-link-in-sysroot-not-in-host-directories.patch b/meta-python/r=
ecipes-devtools/python/python3-m2crypto/0001-setup.py-link-in-sysroot-not-i=
n-host-directories.patch<br>
&gt;&gt; similarity index 75%<br>
&gt;&gt; rename from meta-python/recipes-devtools/python/python-m2crypto/0=
001-setup.py-link-in-sysroot-not-in-host-directories.patch<br>
&gt;&gt; rename to meta-python/recipes-devtools/python/python3-m2crypto/00=
01-setup.py-link-in-sysroot-not-in-host-directories.patch<br>
&gt;&gt; index b339d93f75..f4c74384f9 100644<br>
&gt;&gt; --- a/meta-python/recipes-devtools/python/python-m2crypto/0001-se=
tup.py-link-in-sysroot-not-in-host-directories.patch<br>
&gt;&gt; +++ b/meta-python/recipes-devtools/python/python3-m2crypto/0001-s=
etup.py-link-in-sysroot-not-in-host-directories.patch<br>
&gt;&gt; @@ -10,19 +10,17 @@ Upstream-status: Unknown<br>
&gt;&gt;=C2=A0 =C2=A0setup.py | 6 +++---<br>
&gt;&gt;=C2=A0 =C2=A01 file changed, 3 insertions(+), 3 deletions(-)<br>
&gt;&gt;<br>
&gt;&gt; -Index: M2Crypto-0.30.1/setup.py<br>
&gt;&gt; -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt;&gt; ---- M2Crypto-0.30.1.orig/setup.py<br>
&gt;&gt; -+++ M2Crypto-0.30.1/setup.py<br>
&gt;&gt; -@@ -130,6 +130,7 @@ class _M2CryptoBuildExt(build_ext.build_<br>
&gt;&gt; +--- a/setup.py<br>
&gt;&gt; ++++ b/setup.py<br>
&gt;&gt; +@@ -135,6 +135,7 @@ class _M2CryptoBuildExt(build_ext.build_<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.set_undefined_option=
s(&#39;build&#39;, (&#39;bundledlls&#39;, &#39;bundledlls&#39;))<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.libraries =3D [&#39;=
ssl&#39;, &#39;crypto&#39;]<br>
&gt;&gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.openssl =3D os.environ.ge=
t( &quot;STAGING_DIR&quot; )<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if sys.platform =3D=3D &#=
39;win32&#39;:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.librar=
ies =3D [&#39;ssleay32&#39;, &#39;libeay32&#39;]<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if self.openssl =
and openssl_version(self.openssl, 0x10100000, True):<br>
&gt;&gt; -@@ -150,8 +151,8 @@ class _M2CryptoBuildExt(build_ext.build_<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if self.openssl =
and openssl_version(self.openssl,<br>
&gt;&gt; +@@ -159,8 +160,8 @@ class _M2CryptoBuildExt(build_ext.build_<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if self.openssl is not No=
ne:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0log.debug(&=
#39;self.openssl =3D %s&#39;, self.openssl)<br>
&gt;&gt; diff --git a/meta-python/recipes-devtools/python/python-m2crypto/=
cross-compile-platform.patch b/meta-python/recipes-devtools/python/python3-=
m2crypto/cross-compile-platform.patch<br>
&gt;&gt; similarity index 84%<br>
&gt;&gt; rename from meta-python/recipes-devtools/python/python-m2crypto/c=
ross-compile-platform.patch<br>
&gt;&gt; rename to meta-python/recipes-devtools/python/python3-m2crypto/cr=
oss-compile-platform.patch<br>
&gt;&gt; index 4b64f4613c..f039ae8665 100644<br>
&gt;&gt; --- a/meta-python/recipes-devtools/python/python-m2crypto/cross-c=
ompile-platform.patch<br>
&gt;&gt; +++ b/meta-python/recipes-devtools/python/python3-m2crypto/cross-=
compile-platform.patch<br>
&gt;&gt; @@ -4,11 +4,9 @@ since it pokes at the system for getting archite=
cture values<br>
&gt;&gt;=C2=A0 Upstream-Status: Inappropriate<br>
&gt;&gt;=C2=A0 Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmai=
l.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; -Index: M2Crypto-0.30.1/setup.py<br>
&gt;&gt; -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt;&gt; ---- M2Crypto-0.30.1.orig/setup.py<br>
&gt;&gt; -+++ M2Crypto-0.30.1/setup.py<br>
&gt;&gt; -@@ -160,22 +160,6 @@ class _M2CryptoBuildExt(build_ext.build_<br=
>
&gt;&gt; +--- a/setup.py<br>
&gt;&gt; ++++ b/setup.py<br>
&gt;&gt; +@@ -169,22 +169,6 @@ class _M2CryptoBuildExt(build_ext.build_<br=
>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0log.debug(&=
#39;self.include_dirs =3D %s&#39;, self.include_dirs)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0log.debug(&=
#39;self.library_dirs =3D %s&#39;, self.library_dirs)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta-python/recipes-devtools/python/<a href=3D"http:=
//python3-m2crypto_0.30.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-=
m2crypto_0.30.1.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"htt=
p://python3-m2crypto_0.30.1.bb" rel=3D"noreferrer" target=3D"_blank">python=
3-m2crypto_0.30.1.bb</a><br>
&gt;&gt; deleted file mode 100644<br>
&gt;&gt; index 4d63d4bd3a..0000000000<br>
&gt;&gt; --- a/meta-python/recipes-devtools/python/<a href=3D"http://pytho=
n3-m2crypto_0.30.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-m2crypt=
o_0.30.1.bb</a><br>
&gt;&gt; +++ /dev/null<br>
&gt;&gt; @@ -1,2 +0,0 @@<br>
&gt;&gt; -inherit setuptools3<br>
&gt;&gt; -require python-m2crypto.inc<br>
&gt;&gt; diff --git a/meta-python/recipes-devtools/python/python-m2crypto.=
inc b/meta-python/recipes-devtools/python/<a href=3D"http://python3-m2crypt=
o_0.37.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-m2crypto_0.37.1.b=
b</a><br>
&gt;&gt; similarity index 86%<br>
&gt;&gt; rename from meta-python/recipes-devtools/python/python-m2crypto.i=
nc<br>
&gt;&gt; rename to meta-python/recipes-devtools/python/<a href=3D"http://p=
ython3-m2crypto_0.37.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-m2c=
rypto_0.37.1.bb</a><br>
&gt;&gt; index 797a0354bf..896d9d2cc4 100644<br>
&gt;&gt; --- a/meta-python/recipes-devtools/python/python-m2crypto.inc<br>
&gt;&gt; +++ b/meta-python/recipes-devtools/python/<a href=3D"http://pytho=
n3-m2crypto_0.37.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-m2crypt=
o_0.37.1.bb</a><br>
&gt;&gt; @@ -8,13 +8,13 @@ FILESEXTRAPATHS_prepend :=3D &quot;${THISDIR}/p=
ython-m2crypto:&quot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 SRC_URI +=3D &quot;file://0001-setup.py-link-in-sysroot-not=
-in-host-directories.patch \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://cross-comp=
ile-platform.patch \<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://m2crypto-0.26.4=
-gcc_macros.patch \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Allow-veri=
fy_cb_-to-be-called-with-ok-True.patch \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Use-of-RSA=
_SSLV23_PADDING-has-been-deprecated.patch \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;&gt; -SRC_URI[md5sum] =3D &quot;7fce3cbf85eb84a669682892b935746b&quot;=
<br>
&gt;&gt; -SRC_URI[sha256sum] =3D &quot;a1b2751cdadc6afac3df8a5799676b7b7c6=
7a6ad144bb62d38563062e7cd3fc6&quot;<br>
&gt;&gt; +SRC_URI[sha256sum] =3D &quot;e4e42f068b78ccbf113e5d0a72ae5f480f6=
c3ace4940b91e4fff5598cfff6fb3&quot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 PYPI_PACKAGE =3D &quot;M2Crypto&quot;<br>
&gt;&gt; -inherit pypi siteinfo<br>
&gt;&gt; +inherit pypi siteinfo setuptools3<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 DEPENDS +=3D &quot;openssl swig-native&quot;<br>
&gt;&gt;=C2=A0 RDEPENDS_${PN} +=3D &quot;\<br>
&gt;&gt; --<br>
&gt;&gt; 2.31.1<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; <br>
&gt;&gt;<br>
</blockquote></div>

--0000000000008f625505c19ad531--
