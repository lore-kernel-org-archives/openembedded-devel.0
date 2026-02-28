Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B78ECFEE4F8
	for <webhook@archiver.kernel.org>; Sat, 28 Feb 2026 19:42:21 +0000 (UTC)
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.125540.1772307738639211683
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 28 Feb 2026 11:42:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Av2l3Jkc;
 spf=pass (domain: gmail.com, ip: 74.125.224.49, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-64ad8435f46so3191483d50.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 28 Feb 2026 11:42:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772307738; cv=none;
        d=google.com; s=arc-20240605;
        b=dyK+Qoj4cdrjW1g+VXWMltIMlxrHs0tMeK0wtf6/ovC38DtaRjJGuDWZmJukpTBOcB
         zir3ZRN/XbNR0RJ5kX7yG3ndH/QXfNwP0qRT+gXDYWSxWLst0xl/8yifOvY6Zq+OUzrD
         ppNv61UP+bwX56HFXCQVkMLhx5nufy4WZjyxlk3NuuZ2erKRDJD63kECZJ1rptlDWs30
         8i9GfjdvUVbMA5pefec192uJaL4/yCJ9IDBjoP4Bqvt8Bt6JjADDay7m5v2iqEIzLDpn
         EjhW6XSr3qPomelCSNUg3PB9IYaQ3eMoQbOPwhBhpMQh0dQys9os2MtnYmyPO5o0gLKx
         q4HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ZaDcyB5T/2fDbTZs0V8KIpl0/6EOkV1Y0TTSo+B7dpc=;
        fh=xc7Pw1C2r64/D3IAczFTr6Vs+3vKL6I7LfJKgO2Lfwc=;
        b=GbFQDFv0dEinSLDtfDUeDfKYgNWblVBsnfjyN4ZLlTCVbKnXnYLxKj2q2eKT99t4Sx
         Evvw/JjI2XNOd6JQOBD0q3idb8HX7wt+S8EFvHpC7ZSoCEZwEzT4aSKEl9sTZMU0HyaI
         kxYpZP37WczvSMLys1HT8vaJx4LnTQcdOuCBmqfRuPrCHzB5BtXN1RC63n9BPORL8Vfx
         SWgot8+ZGXGrC2mu9HSOGln3Xtlrgcl4BYQ7sw3K0DtcDkLCqFpljesBow81EWYcl+5a
         z0nYc9mbHs36zrRStcdR/XOMUrKDOLhTE64aqWzg9TVfskAHQccilFwpqz5VAad2NgYP
         +vCA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772307738; x=1772912538; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZaDcyB5T/2fDbTZs0V8KIpl0/6EOkV1Y0TTSo+B7dpc=;
        b=Av2l3JkcRPGOXi08+JByHfvlA+ehfnQvGQ+pFitRqpqams+aJibTdFusdZZNbMCUNt
         WgI+IOVWkYIT0tYX2joxNs7Wfm5pGRi/1HpFeiLQEH2VAPsVUnduZWEa3e+DBVfrBqKW
         44FN9geDynno56ONEnpQDIkEyCKb3vSDywq0VeMjBy8UQUCfEA12EHRYu7LfHPQFKYM7
         O/C0XR3dVx2AT7mjj67V1+QBmkOOFH0mFQ6wFK7yMA1DBxNAzs0Y10jJ7vcdOg/9Mx2S
         4lWD1wnEmaOzdpsJkGrGYDf8HbuvLE7IWsED0UFHgXCIdJJBVYLQtcsgPFlv6cJuVxxM
         HKjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772307738; x=1772912538;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZaDcyB5T/2fDbTZs0V8KIpl0/6EOkV1Y0TTSo+B7dpc=;
        b=MBsyoRkpKbIN9+1rWL/xagwN38TMCIgtCBeJkFPId29xsu1ESisqDmRpH9Zl0kjINE
         vBkHlx+nIHH4KuJW3GX+e1i8O69mvMMsM606BvH4aPdNjLaae7e2iWuH8tS+IKQFX5O2
         VAmp/15dBV6mirA8jqlnSP+8o7LDEx9M79yPozl37r8W7BCid/xTXWJsbZS5Koy7/3Wl
         b20kciO5u8JpXbimvhYiOwYKgNqPwag3jcMWeNk1Logs4fasrOyiFAOjCaHpTZmc08Xv
         H89lwO0XK5+ym7fhbOZ8uJc4CWMIA1ep7kKaiR9kO2qxXvsbecdEbjSwJbY11ggnmAWW
         Nx4w==
X-Gm-Message-State: AOJu0YxJb7XGQpP/c9xi3jb3AZB0jTFI/3YT0dOY1WT9U6zxcylyX9FA
	jD0KrvMQB6hRErJ9ecPmy9ib9bxX+rG9FlT1lKZh58ZZmbjpbTOnsgbXRE3PCAoUvIyCU/CR4+3
	Vv25UJsWWEADjSsGLwRURrd1YObOdDeZd85W6
X-Gm-Gg: ATEYQzz+6TqAsc3xt1t39UHew00bw716C1MdDMgtn+FXegMJwnl5oOdzy6toT966SCA
	easrlmmVl7i2Np5OWDAelsABJ+SzkyfkT2QfdqJNvilaC4HN4km/QesxXvzSwr+XjDwQr8u7Wtd
	sKea85mqUuAg9wHZyAtmpLmyhyYDkw4cEbVSG7LsSPPAQpX0HrPuCA3G8/cHSENo6YN0arfh7hG
	1C+iVTwakQxf8m32vsxOvGf8v6ZnYITYAlx2dd25PMW5SMeF0PnlNIJwL2+jeg46xkUiGKQ8xtM
	RsqXAri8aBNjCIivpJ8rwuzBab9pwNVn+E0sp5tIDoNrsoX7oHlp4ZZNMdjjLI4iFhVhvweIaAm
	6Lvp7OphYvPR3bEWROQKksmHg
X-Received: by 2002:a05:690e:24dc:b0:649:6830:2f5c with SMTP id
 956f58d0204a3-64cc207ebb5mr4524806d50.14.1772307737578; Sat, 28 Feb 2026
 11:42:17 -0800 (PST)
MIME-Version: 1.0
References: <20260227101327.1432-1-wangmy@fujitsu.com> <20260227101327.1432-18-wangmy@fujitsu.com>
In-Reply-To: <20260227101327.1432-18-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 28 Feb 2026 11:41:50 -0800
X-Gm-Features: AaiRm53eLkGtF8ZOpglvjqdIvxGgfX2DM06LNg8s9szEEbw43KflF6cTx3eoC9g
Message-ID: <CAMKF1sp8e+yikq7vj411ZktPGoNoq+FOp=CGk3o7-9_fmG-X1g@mail.gmail.com>
Subject: Re: [oe] [meta-python] [PATCH 18/52] python3-m2crypto: upgrade 0.46.2
 -> 0.47.0
To: wangmy@fujitsu.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000219068064be78d78"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 28 Feb 2026 19:42:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124783

--000000000000219068064be78d78
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

please rebase this patch on latest master-next and resend.

On Fri, Feb 27, 2026 at 2:14=E2=80=AFAM wangmy via lists.openembedded.org <=
wangmy=3D
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
> -Subject: [oe] [meta-python] [PATCH 1/2] fix: allow 64-bit time_t on
> 32-bit systems in
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
> View/Reply Online (#124718):
> https://lists.openembedded.org/g/openembedded-devel/message/124718
> Mute This Topic: https://lists.openembedded.org/mt/118027909/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000219068064be78d78
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">please rebase this patch on latest master-next and resend.=
</div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr"=
 class=3D"gmail_attr">On Fri, Feb 27, 2026 at 2:14=E2=80=AFAM wangmy via <a=
 href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;wang=
my=3D<a href=3D"mailto:fujitsu.com@lists.openembedded.org">fujitsu.com@list=
s.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">From: Wang Mingyu &lt;<a href=3D"mailto:wangmy@fujitsu.co=
m" target=3D"_blank">wangmy@fujitsu.com</a>&gt;<br>
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
-Subject: [oe] [meta-python] [PATCH 1/2] fix: allow 64-bit time_t on 32-bit=
 systems in<br>
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
View/Reply Online (#124718): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/124718" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/124718</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/118027909/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/118027909/1997914</a><br>
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

--000000000000219068064be78d78--

