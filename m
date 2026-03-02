Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31102EA4E25
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 15:31:16 +0000 (UTC)
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.163285.1772465471887175518
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Mar 2026 07:31:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=N/amT5LL;
 spf=pass (domain: gmail.com, ip: 74.125.224.46, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-64ca09f2170so4599532d50.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 02 Mar 2026 07:31:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772465471; cv=none;
        d=google.com; s=arc-20240605;
        b=YsYIxeNh3JrOSBsdqvZ2fp4AK9P3Loiv7eBdh2J23eqryf6oFjbuzuR2o1up1etUoT
         yJkA2Lfa4Rb7a94pCPIqagF5jRxiplOm+Z6cyReQ72IiUYZCa/Ky+2wa8PqHKBuyCqJy
         fTsujQmJmxpEmH4EJyRB6tNo/XHMtql+a9Z9/yvduI+/J1QFlLwFPf69YruxaUpmwMkr
         3c1TNzRqtKkjb4rqSPMbx9gi4j1ZGdeGh5B/7bYGVU2x1S0ZVz3GU+X0GWlQzmiLKZEu
         CJA3DoJbKHEwC1VE/EyWuBk5FCVJhSoQJ7X1IJyRJCxQHf2EhV7NiBXXaSghNTteqYu3
         9xMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=07Rhfd1KQzE23QER7CGgRHeKo/6ZW0bYJ4p2nqdGoG4=;
        fh=xc7Pw1C2r64/D3IAczFTr6Vs+3vKL6I7LfJKgO2Lfwc=;
        b=GCQR2lbtfhuT7ZtUR69U6k5pgEofsyGcyht8iTUO2jlz5ih0kXL9dlRYgbU2UyjJ4B
         0AA1VQnPfiDLEOI2KopiTnXnjVQMJgIQ+YzTDOFJ/rLlBu8UY1/nVF+RlYXlcVAzLuEp
         Roufv5iyIYJBFAMzqLv3YjGDcMh1xBQCDnEj3kfq0m5Du/oocDM3h5fJv6IV8vFIW2JJ
         9fS7arjLVqYglu39e5oOmhfSY/JlTGyG/iXaYrma20M2Q/Q9tHvGnV+PjXOWJ5wQQpfX
         j1ZSfEWf36CtOS5KbNfyfkN6sqxAr9mfHU7vabNZgiew7aNSy7wY3AxEzZEtkQMq1H5j
         bOXg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772465471; x=1773070271; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=07Rhfd1KQzE23QER7CGgRHeKo/6ZW0bYJ4p2nqdGoG4=;
        b=N/amT5LLXepTKlvU/qyBvxB/AuSJk4PXRTvDApHII4ro5ZrGjqGxQcONrYuWHpYPmX
         cc7iRac3I8q6plRvePKvm5gDwTG1djXVzlUSBFQRDLT6WieFSzz9ZZkrVckIZpqflXdr
         UhYFzgY5GCuj4CYeq8in207Lh7TR3seXP088S2Ej2TdlyeEuJiZxuS+bUfI5aZ4PJDzS
         uR6XdL7aNj5pv/9ywlcbfRhE5Y6ezeWkdNotXRyZPvgUbvzxOvMVoSQylH1zEFn5jQch
         WHniLozj962xGk7d+1GhKcZrY6siqK8sQU7yqS2x1tei7MQEU0xiJWfzpHk7jiFnYfIV
         0XZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772465471; x=1773070271;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=07Rhfd1KQzE23QER7CGgRHeKo/6ZW0bYJ4p2nqdGoG4=;
        b=gGe8j1/2NmQeKk2A6BiiBfC6OckG2qRvNAOGTnZjPbt2uRdL41v9z0lLmx528qlxcE
         iNptD8QZbt4tPTtmxpwGlInQeyMhROba9EJcFeIqsoW+LPv3f8nQ7jMwZQBHIkxRdGf0
         5Wz9QVcac1DvxwIOyFGzJZisMuNM1H1R/EQj5Hm4lL+ihYjdA+SrIzBf1+v+EtGLFIbr
         8EAs5ockemyJa6CNdZItH8hbIxYp//hobYY4Y6VCigq1Q8gpD9KXY24W78oRY1NUQiT3
         cHzDqrxQu+i/D5VkSDjxBmqdgI9UIW8iZnAPLiEzw0iyg7jMfHXVuwUko6pK8BJE9tSF
         aWsQ==
X-Gm-Message-State: AOJu0YyWqCnd3qeaLwLhaxrYQ6OPtcnvs3Mn73b+cTfHtvmBLoxi+xJ/
	SwZxVsTBoNuJd9DGyHOT70ufTm12sofEqO8D6qzFrg3me30F2ZLE83ZaIRE6tWp4NBHT9r6bMUD
	ANPT3zlzJydbnmsvuNvSxdwUJ9V4eE5KHNdOpUlE=
X-Gm-Gg: ATEYQzxdWhN1RY5lrm2f6EYeT2pVw7dR7tKlgjab4ktCt5F7IcYt50okp4qv1Z0v9ve
	mtogbJgNln0USVMVCMl7cL22fxKh4XZovz0G26iVREMm10d/h8ghykVZEQEyFltsznvYkXBENI5
	VS8Gs0NM0OIo9qts4OeSNxG1CX9tosaFQp2cQDABRy6KALCdwffi3CbSjB8JUcewDkD5dYaMQi5
	K2W15V56xZIVclC4DQiCZa+EHzgHQtwsdZsR8y1LRnqfamRgPPacNYkUBPLypSKgV13jarze3P4
	cD/Ai1qNhXZllZkjnKsA7rUezZUklzCJAAQCUEWAYp8Bwsgd0hchUGu2G2hbr46jCewbAsPYDWq
	ghfNiEgyFxY1day+Vn43nXXZ3
X-Received: by 2002:a05:690e:d53:b0:64a:efa9:8e64 with SMTP id
 956f58d0204a3-64cc237cd51mr9689681d50.77.1772465470224; Mon, 02 Mar 2026
 07:31:10 -0800 (PST)
MIME-Version: 1.0
References: <20260302055650.1478-1-wangmy@fujitsu.com>
In-Reply-To: <20260302055650.1478-1-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 2 Mar 2026 07:30:43 -0800
X-Gm-Features: AaiRm53rfob0n5k2fdnMsS-xmI6DMqV4oSo3Y5D1451KHH8K0EWXrShVZ_XJeKk
Message-ID: <CAMKF1sqE_R8Gi_+0KL93c0HhoSMy6V7MZxtnjbmE3bVM7CCpDw@mail.gmail.com>
Subject: Re: [oe] [meta-python] [PATCH v2] python3-m2crypto: upgrade 0.46.2 -> 0.47.0
To: wangmy@fujitsu.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000babfb1064c0c463d"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 Mar 2026 15:31:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124816

--000000000000babfb1064c0c463d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

fails to build now using clang

| INFO:mkpath:creating build/temp.linux-aarch64-cpython-314/src/SWIG
| INFO:spawn:aarch64-yoe-linux-clang -mcpu=3Dcortex-a57+crc
--dyld-prefix=3D/usr -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=3D2
-Wformat -Wformat-security -Werror=3Dformat-security -fstack-protector-stro=
ng
-O2 -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-secur=
ity
--sysroot=3D/srv/build/yoe/build/tmp/work/cortexa57-yoe-linux/python3-m2cry=
pto/0.47.0/recipe-sysroot
-O2 -g
-ffile-prefix-map=3D/srv/build/yoe/build/tmp/work/cortexa57-yoe-linux/pytho=
n3-m2crypto/0.47.0/sources/m2crypto-0.47.0=3D/usr/src/debug/python3-m2crypt=
o/0.47.0
-ffile-prefix-map=3D/srv/build/yoe/build/tmp/work/cortexa57-yoe-linux/pytho=
n3-m2crypto/0.47.0/sources/m2crypto-0.47.0=3D/usr/src/debug/python3-m2crypt=
o/0.47.0
-ffile-prefix-map=3D/srv/build/yoe/build/tmp/work/cortexa57-yoe-linux/pytho=
n3-m2crypto/0.47.0/recipe-sysroot=3D
-ffile-prefix-map=3D/srv/build/yoe/build/tmp/work/cortexa57-yoe-linux/pytho=
n3-m2crypto/0.47.0/recipe-sysroot-native=3D
-pipe -fPIC
-I/srv/build/yoe/build/tmp/work/cortexa57-yoe-linux/python3-m2crypto/0.47.0=
/recipe-sysroot/usr/include/python3.14
-I/srv/build/yoe/build/tmp/work/cortexa57-yoe-linux/python3-m2crypto/0.47.0=
/sources/m2crypto-0.47.0/src/SWIG
-c src/SWIG/_m2crypto_wrap.c -o
build/temp.linux-aarch64-cpython-314/src/SWIG/_m2crypto_wrap.o -DTHREADING
-Wno-deprecated-declarations
| src/SWIG/_m2crypto_wrap.c:4455:1: error: unknown type name
'PRAGMA_IGNORE_UNUSED_LABEL'
|  4455 | PRAGMA_IGNORE_UNUSED_LABEL
|       | ^
| src/SWIG/_m2crypto_wrap.c:4456:30: error: expected ';' after top level
declarator
|  4456 | PRAGMA_WARN_STRICT_PROTOTYPES
|       |                              ^
|       |                              ;
| 2 errors generated.

On Sun, Mar 1, 2026 at 9:57=E2=80=AFPM wangmy via lists.openembedded.org <w=
angmy=3D
fujitsu.com@lists.openembedded.org> wrote:

> From: Wang Mingyu <wangmy@fujitsu.com>
>
> 0001-fix-allow-64-bit-time_t-on-32-bit-systems-in-test_is.patch
> 0002-fix-correct-struct-packing-on-32-bit-with-_TIME_BITS.patch
> removed since they're included in 0.47.0
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  ...-time_t-on-32-bit-systems-in-test_is.patch | 40 -----------
>  ...ct-packing-on-32-bit-with-_TIME_BITS.patch | 72 -------------------
>  ...o_0.46.2.bb =3D> python3-m2crypto_0.47.0.bb} |  8 +--
>  3 files changed, 2 insertions(+), 118 deletions(-)
>  delete mode 100644
> meta-python/recipes-devtools/python/python3-m2crypto/0001-fix-allow-64-bi=
t-time_t-on-32-bit-systems-in-test_is.patch
>  delete mode 100644
> meta-python/recipes-devtools/python/python3-m2crypto/0002-fix-correct-str=
uct-packing-on-32-bit-with-_TIME_BITS.patch
>  rename meta-python/recipes-devtools/python/{python3-m2crypto_0.46.2.bb
> =3D> python3-m2crypto_0.47.0.bb} (84%)
>
> diff --git
> a/meta-python/recipes-devtools/python/python3-m2crypto/0001-fix-allow-64-=
bit-time_t-on-32-bit-systems-in-test_is.patch
> b/meta-python/recipes-devtools/python/python3-m2crypto/0001-fix-allow-64-=
bit-time_t-on-32-bit-systems-in-test_is.patch
> deleted file mode 100644
> index d49950074f..0000000000
> ---
> a/meta-python/recipes-devtools/python/python3-m2crypto/0001-fix-allow-64-=
bit-time_t-on-32-bit-systems-in-test_is.patch
> +++ /dev/null
> @@ -1,40 +0,0 @@
> -From d123b4ddce99c44f2c290fb3d6cc887de98778e6 Mon Sep 17 00:00:00 2001
> -From: Haixiao Yan <haixiao.yan.cn@windriver.com>
> -Date: Wed, 22 Oct 2025 15:23:56 +0800
> -Subject: [PATCH 1/2] fix: allow 64-bit time_t on 32-bit systems in
> - test_is32bit
> -
> -Some modern 32-bit Linux systems (e.g. with glibc >=3D 2.34 or musl time=
64
> ABI)
> -use 64-bit time_t by default when _TIME_BITS=3D64 is enabled. The origin=
al
> test
> -assumed time_t was always 32-bit on 32-bit architectures, which is no
> longer
> -true.
> -
> -Relax the check to accept both 32-bit and 64-bit time_t values:
> -
> -    self.assertIn(bit32, (32, 64))
> -
> -This makes the test compatible with both legacy and time64 ABIs.
> -
> -Upstream-Status: Backport [
> https://gitlab.com/m2crypto/m2crypto/-/commit/818c3dfda6ea]
> -
> -Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
> ----
> - tests/test_util.py | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/tests/test_util.py b/tests/test_util.py
> -index e925d03b090c..233fb7a099d9 100644
> ---- a/tests/test_util.py
> -+++ b/tests/test_util.py
> -@@ -26,7 +26,7 @@ class UtilTestCase(unittest.TestCase):
> -                 not in ["true", "1", "yes"]
> -             )
> -         ):
> --            self.assertEqual(bit32, 32)
> -+            self.assertIn(bit32, (32, 64))
> -         else:
> -             self.assertNotEqual(bit32, 32)
> -         self.assertIsInstance(bit32, int)
> ---
> -2.34.1
> -
> diff --git
> a/meta-python/recipes-devtools/python/python3-m2crypto/0002-fix-correct-s=
truct-packing-on-32-bit-with-_TIME_BITS.patch
> b/meta-python/recipes-devtools/python/python3-m2crypto/0002-fix-correct-s=
truct-packing-on-32-bit-with-_TIME_BITS.patch
> deleted file mode 100644
> index c36afa5cc0..0000000000
> ---
> a/meta-python/recipes-devtools/python/python3-m2crypto/0002-fix-correct-s=
truct-packing-on-32-bit-with-_TIME_BITS.patch
> +++ /dev/null
> @@ -1,72 +0,0 @@
> -From b5dbfca23986429853ccb15a38cc526d9df0dd40 Mon Sep 17 00:00:00 2001
> -From: Haixiao Yan <haixiao.yan.cn@windriver.com>
> -Date: Wed, 22 Oct 2025 15:23:57 +0800
> -Subject: [PATCH 2/2] fix: correct struct packing on 32-bit with
> _TIME_BITS=3D64
> -
> -On 32-bit platforms with glibc time64 ABI, time_t is 64-bit wide while
> -`long` remains 32-bit. This causes struct timeval to use two 64-bit fiel=
ds
> -(tv_sec, tv_usec). The previous code incorrectly packed timeout as "ll",
> -leading to EINVAL in setsockopt(SO_RCVTIMEO).
> -
> -Use "qq" instead when m2.time_t_bits() =3D=3D 64 to match the actual ABI=
.
> -
> -Fixes: https://todo.sr.ht/~mcepl/m2crypto/374
> -
> -Upstream-Status: Backport [
> https://gitlab.com/m2crypto/m2crypto/-/commit/473de659f78e]
> -
> -Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
> ----
> - src/M2Crypto/SSL/timeout.py | 24 ++++++++++++++++++++----
> - 1 file changed, 20 insertions(+), 4 deletions(-)
> -
> -diff --git a/src/M2Crypto/SSL/timeout.py b/src/M2Crypto/SSL/timeout.py
> -index b45f38b1cbdb..5ba52283b6f8 100644
> ---- a/src/M2Crypto/SSL/timeout.py
> -+++ b/src/M2Crypto/SSL/timeout.py
> -@@ -33,10 +33,14 @@ class timeout(object):
> -             millisec =3D int(self.sec * 1000 + round(float(self.microse=
c)
> / 1000))
> -             binstr =3D struct.pack("l", millisec)
> -         else:
> --            if m2.time_t_bits() =3D=3D 32:
> -+            bits =3D m2.time_t_bits()
> -+            if bits =3D=3D 32:
> -                 binstr =3D struct.pack("ii", self.sec, self.microsec)
> -+            elif bits =3D=3D 64:
> -+                # handle both 64-bit and 32-bit+TIME_BITS=3D64
> -+                binstr =3D struct.pack("qq", self.sec, self.microsec)
> -             else:
> --                binstr =3D struct.pack("ll", self.sec, self.microsec)
> -+                raise ValueError(f"Unsupported time_t_bits: {bits}")
> -         return binstr
> -
> -
> -@@ -48,7 +52,13 @@ def struct_to_timeout(binstr: bytes) -> timeout:
> -         sec =3D int(millisec / 1000)
> -         microsec =3D (millisec % 1000) * 1000
> -     else:
> --        (sec, microsec) =3D struct.unpack("ll", binstr)
> -+        bits =3D m2.time_t_bits()
> -+        if bits =3D=3D 32:
> -+            (sec, microsec) =3D struct.unpack("ii", binstr)
> -+        elif bits =3D=3D 64:
> -+            (sec, microsec) =3D struct.unpack("qq", binstr)
> -+        else:
> -+            raise ValueError(f"Unsupported time_t_bits: {bits}")
> -     return timeout(sec, microsec)
> -
> -
> -@@ -56,4 +66,10 @@ def struct_size() -> int:
> -     if sys.platform =3D=3D "win32":
> -         return struct.calcsize("l")
> -     else:
> --        return struct.calcsize("ll")
> -+        bits =3D m2.time_t_bits()
> -+        if bits =3D=3D 32:
> -+            return struct.calcsize("ii")
> -+        elif bits =3D=3D 64:
> -+            return struct.calcsize("qq")
> -+        else:
> -+            raise ValueError(f"Unsupported time_t_bits: {bits}")
> ---
> -2.34.1
> -
> diff --git a/meta-python/recipes-devtools/python/
> python3-m2crypto_0.46.2.bb b/meta-python/recipes-devtools/python/
> python3-m2crypto_0.47.0.bb
> similarity index 84%
> rename from meta-python/recipes-devtools/python/python3-m2crypto_0.46.2.b=
b
> rename to meta-python/recipes-devtools/python/python3-m2crypto_0.47.0.bb
> index abe79671d2..ba7bd9b8e3 100644
> --- a/meta-python/recipes-devtools/python/python3-m2crypto_0.46.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-m2crypto_0.47.0.bb
> @@ -4,13 +4,9 @@ HOMEPAGE =3D "https://gitlab.com/m2crypto/m2crypto"
>  LICENSE =3D "BSD-2-Clause"
>  LIC_FILES_CHKSUM =3D
> "file://LICENSES/BSD-2-Clause.txt;md5=3D8099b0e569f862ece05740aef06c82a2"
>
> -SRC_URI[sha256sum] =3D
> "13c2fa89562f7b8af40cc74b55f490be5e2ab8ccfb739f11c16d3ce6221a61ba"
> +SRC_URI[sha256sum] =3D
> "9256300be1e0412be802aa1f827e0ce7f94deb1099b8ccdcfd9867a7f0f975bf"
>
> -SRC_URI +=3D " \
> -          file://0001-setup.py-Make-the-cmd-available.patch \
> -
> file://0001-fix-allow-64-bit-time_t-on-32-bit-systems-in-test_is.patch \
> -
> file://0002-fix-correct-struct-packing-on-32-bit-with-_TIME_BITS.patch \
> -"
> +SRC_URI +=3D "file://0001-setup.py-Make-the-cmd-available.patch"
>
>  CVE_STATUS[CVE-2009-0127] =3D "disputed: upstream claims there is no bug=
"
>  CVE_STATUS[CVE-2020-25657] =3D "fixed-version: the used version (0.46.2)
> contains the fix already"
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#124799):
> https://lists.openembedded.org/g/openembedded-devel/message/124799
> Mute This Topic: https://lists.openembedded.org/mt/118089528/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000babfb1064c0c463d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">fails to build now using clang=C2=A0<div><br></div><div>| =
INFO:mkpath:creating build/temp.linux-aarch64-cpython-314/src/SWIG<br>| INF=
O:spawn:aarch64-yoe-linux-clang -mcpu=3Dcortex-a57+crc --dyld-prefix=3D/usr=
 -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-secur=
ity -Werror=3Dformat-security -fstack-protector-strong -O2 -D_FORTIFY_SOURC=
E=3D2 -Wformat -Wformat-security -Werror=3Dformat-security --sysroot=3D/srv=
/build/yoe/build/tmp/work/cortexa57-yoe-linux/python3-m2crypto/0.47.0/recip=
e-sysroot -O2 -g -ffile-prefix-map=3D/srv/build/yoe/build/tmp/work/cortexa5=
7-yoe-linux/python3-m2crypto/0.47.0/sources/m2crypto-0.47.0=3D/usr/src/debu=
g/python3-m2crypto/0.47.0 -ffile-prefix-map=3D/srv/build/yoe/build/tmp/work=
/cortexa57-yoe-linux/python3-m2crypto/0.47.0/sources/m2crypto-0.47.0=3D/usr=
/src/debug/python3-m2crypto/0.47.0 -ffile-prefix-map=3D/srv/build/yoe/build=
/tmp/work/cortexa57-yoe-linux/python3-m2crypto/0.47.0/recipe-sysroot=3D -ff=
ile-prefix-map=3D/srv/build/yoe/build/tmp/work/cortexa57-yoe-linux/python3-=
m2crypto/0.47.0/recipe-sysroot-native=3D -pipe -fPIC -I/srv/build/yoe/build=
/tmp/work/cortexa57-yoe-linux/python3-m2crypto/0.47.0/recipe-sysroot/usr/in=
clude/python3.14 -I/srv/build/yoe/build/tmp/work/cortexa57-yoe-linux/python=
3-m2crypto/0.47.0/sources/m2crypto-0.47.0/src/SWIG -c src/SWIG/_m2crypto_wr=
ap.c -o build/temp.linux-aarch64-cpython-314/src/SWIG/_m2crypto_wrap.o -DTH=
READING -Wno-deprecated-declarations<br>| src/SWIG/_m2crypto_wrap.c:4455:1:=
 error: unknown type name &#39;PRAGMA_IGNORE_UNUSED_LABEL&#39;<br>| =C2=A04=
455 | PRAGMA_IGNORE_UNUSED_LABEL<br>| =C2=A0 =C2=A0 =C2=A0 | ^<br>| src/SWI=
G/_m2crypto_wrap.c:4456:30: error: expected &#39;;&#39; after top level dec=
larator<br>| =C2=A04456 | PRAGMA_WARN_STRICT_PROTOTYPES<br>| =C2=A0 =C2=A0 =
=C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^<br>| =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0;<br>| 2 errors generated.</div></div><br><div clas=
s=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_att=
r">On Sun, Mar 1, 2026 at 9:57=E2=80=AFPM wangmy via <a href=3D"http://list=
s.openembedded.org">lists.openembedded.org</a> &lt;wangmy=3D<a href=3D"mail=
to:fujitsu.com@lists.openembedded.org">fujitsu.com@lists.openembedded.org</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Fr=
om: Wang Mingyu &lt;<a href=3D"mailto:wangmy@fujitsu.com" target=3D"_blank"=
>wangmy@fujitsu.com</a>&gt;<br>
<br>
0001-fix-allow-64-bit-time_t-on-32-bit-systems-in-test_is.patch<br>
0002-fix-correct-struct-packing-on-32-bit-with-_TIME_BITS.patch<br>
removed since they&#39;re included in 0.47.0<br>
<br>
Signed-off-by: Wang Mingyu &lt;<a href=3D"mailto:wangmy@fujitsu.com" target=
=3D"_blank">wangmy@fujitsu.com</a>&gt;<br>
---<br>
=C2=A0...-time_t-on-32-bit-systems-in-test_is.patch | 40 -----------<br>
=C2=A0...ct-packing-on-32-bit-with-_TIME_BITS.patch | 72 ------------------=
-<br>
=C2=A0...<a href=3D"http://o_0.46.2.bb" rel=3D"noreferrer" target=3D"_blank=
">o_0.46.2.bb</a> =3D&gt; <a href=3D"http://python3-m2crypto_0.47.0.bb" rel=
=3D"noreferrer" target=3D"_blank">python3-m2crypto_0.47.0.bb</a>} |=C2=A0 8=
 +--<br>
=C2=A03 files changed, 2 insertions(+), 118 deletions(-)<br>
=C2=A0delete mode 100644 meta-python/recipes-devtools/python/python3-m2cryp=
to/0001-fix-allow-64-bit-time_t-on-32-bit-systems-in-test_is.patch<br>
=C2=A0delete mode 100644 meta-python/recipes-devtools/python/python3-m2cryp=
to/0002-fix-correct-struct-packing-on-32-bit-with-_TIME_BITS.patch<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python3=
-m2crypto_0.46.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-m2crypto_=
0.46.2.bb</a> =3D&gt; <a href=3D"http://python3-m2crypto_0.47.0.bb" rel=3D"=
noreferrer" target=3D"_blank">python3-m2crypto_0.47.0.bb</a>} (84%)<br>
<br>
diff --git a/meta-python/recipes-devtools/python/python3-m2crypto/0001-fix-=
allow-64-bit-time_t-on-32-bit-systems-in-test_is.patch b/meta-python/recipe=
s-devtools/python/python3-m2crypto/0001-fix-allow-64-bit-time_t-on-32-bit-s=
ystems-in-test_is.patch<br>
deleted file mode 100644<br>
index d49950074f..0000000000<br>
--- a/meta-python/recipes-devtools/python/python3-m2crypto/0001-fix-allow-6=
4-bit-time_t-on-32-bit-systems-in-test_is.patch<br>
+++ /dev/null<br>
@@ -1,40 +0,0 @@<br>
-From d123b4ddce99c44f2c290fb3d6cc887de98778e6 Mon Sep 17 00:00:00 2001<br>
-From: Haixiao Yan &lt;<a href=3D"mailto:haixiao.yan.cn@windriver.com" targ=
et=3D"_blank">haixiao.yan.cn@windriver.com</a>&gt;<br>
-Date: Wed, 22 Oct 2025 15:23:56 +0800<br>
-Subject: [PATCH 1/2] fix: allow 64-bit time_t on 32-bit systems in<br>
- test_is32bit<br>
-<br>
-Some modern 32-bit Linux systems (e.g. with glibc &gt;=3D 2.34 or musl tim=
e64 ABI)<br>
-use 64-bit time_t by default when _TIME_BITS=3D64 is enabled. The original=
 test<br>
-assumed time_t was always 32-bit on 32-bit architectures, which is no long=
er<br>
-true.<br>
-<br>
-Relax the check to accept both 32-bit and 64-bit time_t values:<br>
-<br>
-=C2=A0 =C2=A0 self.assertIn(bit32, (32, 64))<br>
-<br>
-This makes the test compatible with both legacy and time64 ABIs.<br>
-<br>
-Upstream-Status: Backport [<a href=3D"https://gitlab.com/m2crypto/m2crypto=
/-/commit/818c3dfda6ea" rel=3D"noreferrer" target=3D"_blank">https://gitlab=
.com/m2crypto/m2crypto/-/commit/818c3dfda6ea</a>]<br>
-<br>
-Signed-off-by: Haixiao Yan &lt;<a href=3D"mailto:haixiao.yan.cn@windriver.=
com" target=3D"_blank">haixiao.yan.cn@windriver.com</a>&gt;<br>
----<br>
- tests/test_util.py | 2 +-<br>
- 1 file changed, 1 insertion(+), 1 deletion(-)<br>
-<br>
-diff --git a/tests/test_util.py b/tests/test_util.py<br>
-index e925d03b090c..233fb7a099d9 100644<br>
---- a/tests/test_util.py<br>
-+++ b/tests/test_util.py<br>
-@@ -26,7 +26,7 @@ class UtilTestCase(unittest.TestCase):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0not in [&quo=
t;true&quot;, &quot;1&quot;, &quot;yes&quot;]<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0):<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(bit32, 32)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertIn(bit32, (32, 64))<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.assertNotEqual(bit32,=
 32)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.assertIsInstance(bit32, int)<br>
--- <br>
-2.34.1<br>
-<br>
diff --git a/meta-python/recipes-devtools/python/python3-m2crypto/0002-fix-=
correct-struct-packing-on-32-bit-with-_TIME_BITS.patch b/meta-python/recipe=
s-devtools/python/python3-m2crypto/0002-fix-correct-struct-packing-on-32-bi=
t-with-_TIME_BITS.patch<br>
deleted file mode 100644<br>
index c36afa5cc0..0000000000<br>
--- a/meta-python/recipes-devtools/python/python3-m2crypto/0002-fix-correct=
-struct-packing-on-32-bit-with-_TIME_BITS.patch<br>
+++ /dev/null<br>
@@ -1,72 +0,0 @@<br>
-From b5dbfca23986429853ccb15a38cc526d9df0dd40 Mon Sep 17 00:00:00 2001<br>
-From: Haixiao Yan &lt;<a href=3D"mailto:haixiao.yan.cn@windriver.com" targ=
et=3D"_blank">haixiao.yan.cn@windriver.com</a>&gt;<br>
-Date: Wed, 22 Oct 2025 15:23:57 +0800<br>
-Subject: [PATCH 2/2] fix: correct struct packing on 32-bit with _TIME_BITS=
=3D64<br>
-<br>
-On 32-bit platforms with glibc time64 ABI, time_t is 64-bit wide while<br>
-`long` remains 32-bit. This causes struct timeval to use two 64-bit fields=
<br>
-(tv_sec, tv_usec). The previous code incorrectly packed timeout as &quot;l=
l&quot;,<br>
-leading to EINVAL in setsockopt(SO_RCVTIMEO).<br>
-<br>
-Use &quot;qq&quot; instead when m2.time_t_bits() =3D=3D 64 to match the ac=
tual ABI.<br>
-<br>
-Fixes: <a href=3D"https://todo.sr.ht/~mcepl/m2crypto/374" rel=3D"noreferre=
r" target=3D"_blank">https://todo.sr.ht/~mcepl/m2crypto/374</a><br>
-<br>
-Upstream-Status: Backport [<a href=3D"https://gitlab.com/m2crypto/m2crypto=
/-/commit/473de659f78e" rel=3D"noreferrer" target=3D"_blank">https://gitlab=
.com/m2crypto/m2crypto/-/commit/473de659f78e</a>]<br>
-<br>
-Signed-off-by: Haixiao Yan &lt;<a href=3D"mailto:haixiao.yan.cn@windriver.=
com" target=3D"_blank">haixiao.yan.cn@windriver.com</a>&gt;<br>
----<br>
- src/M2Crypto/SSL/timeout.py | 24 ++++++++++++++++++++----<br>
- 1 file changed, 20 insertions(+), 4 deletions(-)<br>
-<br>
-diff --git a/src/M2Crypto/SSL/timeout.py b/src/M2Crypto/SSL/timeout.py<br>
-index b45f38b1cbdb..5ba52283b6f8 100644<br>
---- a/src/M2Crypto/SSL/timeout.py<br>
-+++ b/src/M2Crypto/SSL/timeout.py<br>
-@@ -33,10 +33,14 @@ class timeout(object):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0millisec =3D int(self.sec =
* 1000 + round(float(self.microsec) / 1000))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0binstr =3D struct.pack(&qu=
ot;l&quot;, millisec)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else:<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if m2.time_t_bits() =3D=3D 32:<=
br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bits =3D m2.time_t_bits()<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if bits =3D=3D 32:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0binstr =3D s=
truct.pack(&quot;ii&quot;, self.sec, self.microsec)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif bits =3D=3D 64:<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # handle both 64-=
bit and 32-bit+TIME_BITS=3D64<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 binstr =3D struct=
.pack(&quot;qq&quot;, self.sec, self.microsec)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else:<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 binstr =3D struct=
.pack(&quot;ll&quot;, self.sec, self.microsec)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise ValueError(=
f&quot;Unsupported time_t_bits: {bits}&quot;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return binstr<br>
- <br>
- <br>
-@@ -48,7 +52,13 @@ def struct_to_timeout(binstr: bytes) -&gt; timeout:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sec =3D int(millisec / 1000)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0microsec =3D (millisec % 1000) * 1000<br=
>
-=C2=A0 =C2=A0 =C2=A0else:<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 (sec, microsec) =3D struct.unpack(&quot;ll&qu=
ot;, binstr)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bits =3D m2.time_t_bits()<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if bits =3D=3D 32:<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (sec, microsec) =3D struct.unpa=
ck(&quot;ii&quot;, binstr)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 elif bits =3D=3D 64:<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (sec, microsec) =3D struct.unpa=
ck(&quot;qq&quot;, binstr)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise ValueError(f&quot;Unsuppo=
rted time_t_bits: {bits}&quot;)<br>
-=C2=A0 =C2=A0 =C2=A0return timeout(sec, microsec)<br>
- <br>
- <br>
-@@ -56,4 +66,10 @@ def struct_size() -&gt; int:<br>
-=C2=A0 =C2=A0 =C2=A0if sys.platform =3D=3D &quot;win32&quot;:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return struct.calcsize(&quot;l&quot;)<br=
>
-=C2=A0 =C2=A0 =C2=A0else:<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 return struct.calcsize(&quot;ll&quot;)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bits =3D m2.time_t_bits()<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if bits =3D=3D 32:<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return struct.calcsize(&quot;ii=
&quot;)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 elif bits =3D=3D 64:<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return struct.calcsize(&quot;qq=
&quot;)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 raise ValueError(f&quot;Unsuppo=
rted time_t_bits: {bits}&quot;)<br>
--- <br>
-2.34.1<br>
-<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
m2crypto_0.46.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-m2crypto_0=
.46.2.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python=
3-m2crypto_0.47.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-m2crypto=
_0.47.0.bb</a><br>
similarity index 84%<br>
rename from meta-python/recipes-devtools/python/<a href=3D"http://python3-m=
2crypto_0.46.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-m2crypto_0.=
46.2.bb</a><br>
rename to meta-python/recipes-devtools/python/<a href=3D"http://python3-m2c=
rypto_0.47.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-m2crypto_0.47=
.0.bb</a><br>
index abe79671d2..ba7bd9b8e3 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-m2crypt=
o_0.46.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-m2crypto_0.46.2.b=
b</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-m2crypt=
o_0.47.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-m2crypto_0.47.0.b=
b</a><br>
@@ -4,13 +4,9 @@ HOMEPAGE =3D &quot;<a href=3D"https://gitlab.com/m2crypto/=
m2crypto" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/m2crypto/=
m2crypto</a>&quot;<br>
=C2=A0LICENSE =3D &quot;BSD-2-Clause&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSES/BSD-2-Clause.txt;md5=3D809=
9b0e569f862ece05740aef06c82a2&quot;<br>
<br>
-SRC_URI[sha256sum] =3D &quot;13c2fa89562f7b8af40cc74b55f490be5e2ab8ccfb739=
f11c16d3ce6221a61ba&quot;<br>
+SRC_URI[sha256sum] =3D &quot;9256300be1e0412be802aa1f827e0ce7f94deb1099b8c=
cdcfd9867a7f0f975bf&quot;<br>
<br>
-SRC_URI +=3D &quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-setup.py-Make-the-cmd-avail=
able.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-fix-allow-64-bit-time_t-on-=
32-bit-systems-in-test_is.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0002-fix-correct-struct-packing-=
on-32-bit-with-_TIME_BITS.patch \<br>
-&quot;<br>
+SRC_URI +=3D &quot;file://0001-setup.py-Make-the-cmd-available.patch&quot;=
<br>
<br>
=C2=A0CVE_STATUS[CVE-2009-0127] =3D &quot;disputed: upstream claims there i=
s no bug&quot;<br>
=C2=A0CVE_STATUS[CVE-2020-25657] =3D &quot;fixed-version: the used version =
(0.46.2) contains the fix already&quot;<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#124799): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/124799" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/124799</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/118089528/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/118089528/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000babfb1064c0c463d--

