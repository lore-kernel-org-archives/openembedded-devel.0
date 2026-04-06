Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0CD2F46C5D
	for <webhook@archiver.kernel.org>; Mon,  6 Apr 2026 16:57:44 +0000 (UTC)
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.59808.1775494656637235599
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Apr 2026 09:57:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=UgG8gXHJ;
 spf=pass (domain: gmail.com, ip: 74.125.224.43, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-6501d242e2fso3753959d50.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Apr 2026 09:57:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775494656; cv=none;
        d=google.com; s=arc-20240605;
        b=RjC1Ag9/HAemUodqulH9uyVA4P5RmtsTBgiMdVotknR3CJX8e5VG9Evb2sddjd0tBA
         v0GqGWoTqxTV3Ne+Tu+iLBgF16mH++gZIwRfleIdC5JeEgBNSt4R9ewt0H5GK1QMxcuT
         qIjjZ5DP17j+LpTqm+160JN6H270O+bzRWSbPuSpO+q23NRx+FVsp/oLqKX/LCUOYOb1
         4axD8hbA8lQxatTCmbCSuqg2q2WSUtHbBT9/m7hfkbp6ST3cTow0v1IRjddr07jshtci
         egcUsgvKvP47xYcE4yPuuMSEqEZuvvUJ9tUSGwTv36evog6eYTNdHig+zMv2JswnmmGg
         QJdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=uRVoM7wOgcGHiKw9zxIrChzrTVk9xBnqz3vuawbBpAM=;
        fh=PqrvWOQDuMW7DBEZMtJk4sUef2SPa7RI/TJA4C6UjCM=;
        b=jEMghmhh976hvjgiPIHAFHBC8/cThU+Zl69UvLlXiC9TB4V8jPS1XmRB2cVqipmdo2
         NELd4RfY7fcWlxj/L7U0Ps8tx/ivm/Pe4c5tLv72ahh/kCDihVpU1qWAQXKlcKxit+S8
         01M+JBypNbBWjTW/S2XNTCz1AZfMz6DRLstQkUa7EYN89CqDEA34LWEqloNEIrpeoGdh
         ZNL1/m6FJX+rKZ5eeNaH2zleTgNAxfk17C0cggBH4jRMlHY/60TfJGqkylM/ftr76LQS
         p0/akALQVodSTWOTgEW+ZIlj0ncQLAtPcAFNMsGxYSNBqNronxXb8fG7A7rIuXTr9yYn
         lVAA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775494656; x=1776099456; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uRVoM7wOgcGHiKw9zxIrChzrTVk9xBnqz3vuawbBpAM=;
        b=UgG8gXHJOWwEyMY36IZ0kGU+huCqLVNDNCOg1pJv/3gZr0rjjGLMSSck7RXV+r1ks8
         vuwHQOtT+caJHbMCukHFDnxs1CdR8hY1IG/4sM+SYksFBN7mac1S8k7k/1AZcjcTmAXu
         xbBSSMk7Hmc49tQX9ee/Dql0RmVrgjLW3QEHGlXtIYqhvorbp1azIv5TlIOES7lC3Hdf
         Ei2oKGSd6ypojlHLxB0dFXt52BHDEkVQOSE7UAkYAPJeouKLEiC7r/xkDphzk3bde39h
         eXupLwaror0T7YkF4dC4SlrTAs0zFETxfNXGGcQHlTKjxm3f7EA5foFw1ZPA8sC1cMwk
         gy6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775494656; x=1776099456;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uRVoM7wOgcGHiKw9zxIrChzrTVk9xBnqz3vuawbBpAM=;
        b=CiitXVWcVvkWVvCM+JSFb5yxJLGUVvQ/lWNw2edzb2ZhrDnmVUzNinVDesKwTMYg7j
         Kkqp3DwVLfKajWve4yZPA+TZdr0VfjKn1XEvWDsTMVzKhcg+YDhD31q1FteWQJxnbGD4
         xCecyfCE2a+6hn2Jf6flqQmyLktM0JOFNO1eTVXyFzttlNfMrdOrf+UiuiQdOF+M8So0
         D3zgIvgcmyB0zSPa5Lld3nbsFbu3KpnEhQR1eXmNfx2fq3ffFgloviyVYYE5vTDpgmjn
         Gzt5+LqNbh5nePtbbASs3zZnoAoQk9yhrnc5x5az9WI8pyDNIDu8FcnfYgQJqfX0VWYc
         Vr1g==
X-Gm-Message-State: AOJu0Yxwn3YJZpauR6KotjdZg6J5xKY69Ya95VSJlX/fpWmfTtowXM7c
	rR6Gt3crFSb0codte4yeB9r4416UeJdiS426aP1WkgOiG80aPYqFWRfs8zMJU7Dj5sLvGqZyZmO
	iUBrIDRH4w3PMHLQtsF3ynfD20cgM5ys=
X-Gm-Gg: AeBDievz2EVCfPpxXhRObSbOSzrfr5dGrSdYmN5iWoU/5gZ5YkON9a3khiVa7UUIev1
	Mvadx99igh2AUb+Hs4kPcN/TokTX7wV7Qwy/L/r7XHw3j6bC2BgnpqhNhxkcVCiIL1dk482PjnG
	A6A/e1n6342c1KZJbXQKZkHaAizDB/1ib9/AEZ69EH7lvlHiWFpYZJUtUkEomssYi2mO9L3d9yd
	k+N6n/t5HI9emMu5ge8mHGPXuySq5hiXpk2jNkCLPXd55DnekEoAwWNcMxvKu5QYnOIKT8G/O9Y
	OcGrktY1UQMa0H1oNClsc7g1rRTqsaiADpKM/bW8eCd6eZhwG0N8wZoWpPgShKxd5C7FfTkOawK
	kI25rEGcXPnsFqfMmxCeoKzMG
X-Received: by 2002:a53:c048:0:10b0:64a:e000:a44a with SMTP id
 956f58d0204a3-650486b52acmr8654841d50.13.1775494655451; Mon, 06 Apr 2026
 09:57:35 -0700 (PDT)
MIME-Version: 1.0
References: <20260406141500.3557451-1-skandigraun@gmail.com>
In-Reply-To: <20260406141500.3557451-1-skandigraun@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 6 Apr 2026 09:57:08 -0700
X-Gm-Features: AQROBzD14d6gcQggAuDyzl8n1M5KVGwPfay1PN28S96IoJNy3qXA5_gfycpUmdo
Message-ID: <CAMKF1spYETBv05ax4eGpxW5==dY3DmAScE7tVMqLYiYHiqiVeQ@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH 1/2] mbedtls: drop recipe for v2
To: skandigraun@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000003d27f8064ecd906e"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Apr 2026 16:57:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126056

--0000000000003d27f8064ecd906e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I think we should drop it since upcoming release it LTS and carrying an EOL
package is not good. I also wonder if we should be adding recipe for 4.x
release, is it backward compatible to 3.x ? if not maybe a second recipe.

On Mon, Apr 6, 2026 at 7:15=E2=80=AFAM Gyorgy Sarvari via lists.openembedde=
d.org
<skandigraun=3Dgmail.com@lists.openembedded.org> wrote:

> It has been unmaintained/EOL for over a year - there is
> a recipe for a newer, still supported version.
>
> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> ---
>  .../mbedtls/mbedtls_2.28.10.bb                | 79 -------------------
>  1 file changed, 79 deletions(-)
>  delete mode 100644 meta-networking/recipes-connectivity/mbedtls/
> mbedtls_2.28.10.bb
>
> diff --git a/meta-networking/recipes-connectivity/mbedtls/
> mbedtls_2.28.10.bb b/meta-networking/recipes-connectivity/mbedtls/
> mbedtls_2.28.10.bb
> deleted file mode 100644
> index b126aee7db..0000000000
> --- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.10.bb
> +++ /dev/null
> @@ -1,79 +0,0 @@
> -SUMMARY =3D "Lightweight crypto and SSL/TLS library"
> -DESCRIPTION =3D "mbedtls is a lean open source crypto library          \
> -for providing SSL and TLS support in your programs. It offers        \
> -an intuitive API and documented header files, so you can actually    \
> -understand what the code does. It features:                          \
> -                                                                     \
> - - Symmetric algorithms, like AES, Blowfish, Triple-DES, DES, ARC4,  \
> -   Camellia and XTEA                                                 \
> - - Hash algorithms, like SHA-1, SHA-2, RIPEMD-160 and MD5            \
> - - Entropy pool and random generators, like CTR-DRBG and HMAC-DRBG   \
> - - Public key algorithms, like RSA, Elliptic Curves, Diffie-Hellman, \
> -   ECDSA and ECDH                                                    \
> - - SSL v3 and TLS 1.0, 1.1 and 1.2                                   \
> - - Abstraction layers for ciphers, hashes, public key operations,    \
> -   platform abstraction and threading                                \
> -"
> -
> -HOMEPAGE =3D "https://tls.mbed.org/"
> -
> -LICENSE =3D "Apache-2.0 | GPL-2.0-or-later"
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D379d5819937a6c2f1ef1630d341e0=
26d"
> -
> -SECTION =3D "libs"
> -
> -SRCREV =3D "2fc8413bfcb51354c8e679141b17b3f1a5942561"
> -SRC_URI =3D "git://
> github.com/Mbed-TLS/mbedtls.git;protocol=3Dhttps;branch=3Darchive/mbedtls=
-2.28;tag=3D${BPN}
> <http://github.com/Mbed-TLS/mbedtls.git;protocol=3Dhttps;branch=3Darchive=
/mbedtls-2.28;tag=3D$%7BBPN%7D>
> \
> -           file://run-ptest \
> -          "
> -
> -inherit cmake update-alternatives ptest
> -
> -PACKAGECONFIG ??=3D "shared-libs programs
> ${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)}"
> -PACKAGECONFIG[shared-libs] =3D
> "-DUSE_SHARED_MBEDTLS_LIBRARY=3DON,-DUSE_SHARED_MBEDTLS_LIBRARY=3DOFF"
> -PACKAGECONFIG[programs] =3D "-DENABLE_PROGRAMS=3DON,-DENABLE_PROGRAMS=3D=
OFF"
> -PACKAGECONFIG[werror] =3D
> "-DMBEDTLS_FATAL_WARNINGS=3DON,-DMBEDTLS_FATAL_WARNINGS=3DOFF"
> -# Make X.509 and TLS calls use PSA
> -#
> https://github.com/Mbed-TLS/mbedtls/blob/development/docs/use-psa-crypto.=
md
> -PACKAGECONFIG[psa]
> <https://github.com/Mbed-TLS/mbedtls/blob/development/docs/use-psa-crypto=
.md-PACKAGECONFIG%5Bpsa%5D>
> =3D ""
> -PACKAGECONFIG[tests] =3D "-DENABLE_TESTING=3DON,-DENABLE_TESTING=3DOFF"
> -
> -EXTRA_OECMAKE =3D "-DLIB_INSTALL_DIR:STRING=3D${libdir}"
> -
> -# For now the only way to enable PSA is to explicitly pass a -D via CFLA=
GS
> -CFLAGS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'psa', '
> -DMBEDTLS_USE_PSA_CRYPTO', '', d)}"
> -
> -PROVIDES +=3D "polarssl"
> -RPROVIDES:${PN} =3D "polarssl"
> -
> -PACKAGES =3D+ "${PN}-programs"
> -FILES:${PN}-programs =3D "${bindir}/"
> -
> -ALTERNATIVE:${PN}-programs =3D "${@bb.utils.contains('PACKAGECONFIG',
> 'programs', 'hello', '', d)}"
> -ALTERNATIVE_LINK_NAME[hello] =3D "${bindir}/hello"
> -
> -BBCLASSEXTEND =3D "native nativesdk"
> -
> -CVE_PRODUCT =3D "mbed_tls"
> -
> -CVE_STATUS[CVE-2021-43666] =3D "backported-patch: Fix merged upstream
> https://github.com/Mbed-TLS/mbedtls/pull/5310"
> -CVE_STATUS[CVE-2021-45451] =3D "backported-patch: Fix merged upstream
> https://github.com/Mbed-TLS/mbedtls/commit/9a4a9c66a48edfe9ece03c7e4a5331=
0adf73a86c
> "
> -
> -# Strip host paths from autogenerated test files
> -do_compile:append() {
> -       sed -i 's+${S}/++g' ${B}/tests/*.c 2>/dev/null || :
> -       sed -i 's+${B}/++g' ${B}/tests/*.c 2>/dev/null || :
> -}
> -
> -# Export source files/headers needed by Arm Trusted Firmware
> -sysroot_stage_all:append() {
> -       sysroot_stage_dir "${S}/library"
> "${SYSROOT_DESTDIR}/usr/share/mbedtls-source/library"
> -       sysroot_stage_dir "${S}/include"
> "${SYSROOT_DESTDIR}/usr/share/mbedtls-source/include"
> -}
> -
> -do_install_ptest () {
> -       install -d ${D}${PTEST_PATH}/tests
> -       cp -f ${B}/tests/test_suite_* ${D}${PTEST_PATH}/tests/
> -       find ${D}${PTEST_PATH}/tests/ -type f -name "*.c" -delete
> -       cp -fR ${S}/tests/data_files ${D}${PTEST_PATH}/tests/
> -}
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#126045):
> https://lists.openembedded.org/g/openembedded-devel/message/126045
> Mute This Topic: https://lists.openembedded.org/mt/118690748/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000003d27f8064ecd906e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I think we should drop it since upcoming release it LTS an=
d carrying an EOL package is not good. I also wonder if we should be adding=
 recipe for 4.x release, is it backward compatible to 3.x ? if not maybe a =
second recipe.</div><br><div class=3D"gmail_quote gmail_quote_container"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Mon, Apr 6, 2026 at 7:15=E2=80=AFAM =
Gyorgy Sarvari via <a href=3D"http://lists.openembedded.org">lists.openembe=
dded.org</a> &lt;skandigraun=3D<a href=3D"mailto:gmail.com@lists.openembedd=
ed.org">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">It has been unmaintained/EOL for ov=
er a year - there is<br>
a recipe for a newer, still supported version.<br>
<br>
Signed-off-by: Gyorgy Sarvari &lt;<a href=3D"mailto:skandigraun@gmail.com" =
target=3D"_blank">skandigraun@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../mbedtls/<a href=3D"http://mbedtls_2.28.10.bb" rel=3D"noreferrer" =
target=3D"_blank">mbedtls_2.28.10.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | 79 -------------------<br>
=C2=A01 file changed, 79 deletions(-)<br>
=C2=A0delete mode 100644 meta-networking/recipes-connectivity/mbedtls/<a hr=
ef=3D"http://mbedtls_2.28.10.bb" rel=3D"noreferrer" target=3D"_blank">mbedt=
ls_2.28.10.bb</a><br>
<br>
diff --git a/meta-networking/recipes-connectivity/mbedtls/<a href=3D"http:/=
/mbedtls_2.28.10.bb" rel=3D"noreferrer" target=3D"_blank">mbedtls_2.28.10.b=
b</a> b/meta-networking/recipes-connectivity/mbedtls/<a href=3D"http://mbed=
tls_2.28.10.bb" rel=3D"noreferrer" target=3D"_blank">mbedtls_2.28.10.bb</a>=
<br>
deleted file mode 100644<br>
index b126aee7db..0000000000<br>
--- a/meta-networking/recipes-connectivity/mbedtls/<a href=3D"http://mbedtl=
s_2.28.10.bb" rel=3D"noreferrer" target=3D"_blank">mbedtls_2.28.10.bb</a><b=
r>
+++ /dev/null<br>
@@ -1,79 +0,0 @@<br>
-SUMMARY =3D &quot;Lightweight crypto and SSL/TLS library&quot;<br>
-DESCRIPTION =3D &quot;mbedtls is a lean open source crypto library=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
-for providing SSL and TLS support in your programs. It offers=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 \<br>
-an intuitive API and documented header files, so you can actually=C2=A0 =
=C2=A0 \<br>
-understand what the code does. It features:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0\<br>
- - Symmetric algorithms, like AES, Blowfish, Triple-DES, DES, ARC4,=C2=A0 =
\<br>
-=C2=A0 =C2=A0Camellia and XTEA=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
- - Hash algorithms, like SHA-1, SHA-2, RIPEMD-160 and MD5=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
- - Entropy pool and random generators, like CTR-DRBG and HMAC-DRBG=C2=A0 =
=C2=A0\<br>
- - Public key algorithms, like RSA, Elliptic Curves, Diffie-Hellman, \<br>
-=C2=A0 =C2=A0ECDSA and ECDH=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
- - SSL v3 and TLS 1.0, 1.1 and 1.2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0\<br>
- - Abstraction layers for ciphers, hashes, public key operations,=C2=A0 =
=C2=A0 \<br>
-=C2=A0 =C2=A0platform abstraction and threading=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 \<br>
-&quot;<br>
-<br>
-HOMEPAGE =3D &quot;<a href=3D"https://tls.mbed.org/" rel=3D"noreferrer" ta=
rget=3D"_blank">https://tls.mbed.org/</a>&quot;<br>
-<br>
-LICENSE =3D &quot;Apache-2.0 | GPL-2.0-or-later&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D379d5819937a6c2f1ef1630d34=
1e026d&quot;<br>
-<br>
-SECTION =3D &quot;libs&quot;<br>
-<br>
-SRCREV =3D &quot;2fc8413bfcb51354c8e679141b17b3f1a5942561&quot;<br>
-SRC_URI =3D &quot;git://<a href=3D"http://github.com/Mbed-TLS/mbedtls.git;=
protocol=3Dhttps;branch=3Darchive/mbedtls-2.28;tag=3D$%7BBPN%7D" rel=3D"nor=
eferrer" target=3D"_blank">github.com/Mbed-TLS/mbedtls.git;protocol=3Dhttps=
;branch=3Darchive/mbedtls-2.28;tag=3D${BPN}</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://run-ptest \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
-<br>
-inherit cmake update-alternatives ptest<br>
-<br>
-PACKAGECONFIG ??=3D &quot;shared-libs programs ${@bb.utils.contains(&#39;P=
TEST_ENABLED&#39;, &#39;1&#39;, &#39;tests&#39;, &#39;&#39;, d)}&quot;<br>
-PACKAGECONFIG[shared-libs] =3D &quot;-DUSE_SHARED_MBEDTLS_LIBRARY=3DON,-DU=
SE_SHARED_MBEDTLS_LIBRARY=3DOFF&quot;<br>
-PACKAGECONFIG[programs] =3D &quot;-DENABLE_PROGRAMS=3DON,-DENABLE_PROGRAMS=
=3DOFF&quot;<br>
-PACKAGECONFIG[werror] =3D &quot;-DMBEDTLS_FATAL_WARNINGS=3DON,-DMBEDTLS_FA=
TAL_WARNINGS=3DOFF&quot;<br>
-# Make X.509 and TLS calls use PSA<br>
-# <a href=3D"https://github.com/Mbed-TLS/mbedtls/blob/development/docs/use=
-psa-crypto.md-PACKAGECONFIG%5Bpsa%5D" rel=3D"noreferrer" target=3D"_blank"=
>https://github.com/Mbed-TLS/mbedtls/blob/development/docs/use-psa-crypto.m=
d<br>
-PACKAGECONFIG[psa]</a> =3D &quot;&quot;<br>
-PACKAGECONFIG[tests] =3D &quot;-DENABLE_TESTING=3DON,-DENABLE_TESTING=3DOF=
F&quot;<br>
-<br>
-EXTRA_OECMAKE =3D &quot;-DLIB_INSTALL_DIR:STRING=3D${libdir}&quot;<br>
-<br>
-# For now the only way to enable PSA is to explicitly pass a -D via CFLAGS=
<br>
-CFLAGS:append =3D &quot;${@bb.utils.contains(&#39;PACKAGECONFIG&#39;, &#39=
;psa&#39;, &#39; -DMBEDTLS_USE_PSA_CRYPTO&#39;, &#39;&#39;, d)}&quot;<br>
-<br>
-PROVIDES +=3D &quot;polarssl&quot;<br>
-RPROVIDES:${PN} =3D &quot;polarssl&quot;<br>
-<br>
-PACKAGES =3D+ &quot;${PN}-programs&quot;<br>
-FILES:${PN}-programs =3D &quot;${bindir}/&quot;<br>
-<br>
-ALTERNATIVE:${PN}-programs =3D &quot;${@bb.utils.contains(&#39;PACKAGECONF=
IG&#39;, &#39;programs&#39;, &#39;hello&#39;, &#39;&#39;, d)}&quot;<br>
-ALTERNATIVE_LINK_NAME[hello] =3D &quot;${bindir}/hello&quot;<br>
-<br>
-BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
-<br>
-CVE_PRODUCT =3D &quot;mbed_tls&quot;<br>
-<br>
-CVE_STATUS[CVE-2021-43666] =3D &quot;backported-patch: Fix merged upstream=
 <a href=3D"https://github.com/Mbed-TLS/mbedtls/pull/5310" rel=3D"noreferre=
r" target=3D"_blank">https://github.com/Mbed-TLS/mbedtls/pull/5310</a>&quot=
;<br>
-CVE_STATUS[CVE-2021-45451] =3D &quot;backported-patch: Fix merged upstream=
 <a href=3D"https://github.com/Mbed-TLS/mbedtls/commit/9a4a9c66a48edfe9ece0=
3c7e4a53310adf73a86c" rel=3D"noreferrer" target=3D"_blank">https://github.c=
om/Mbed-TLS/mbedtls/commit/9a4a9c66a48edfe9ece03c7e4a53310adf73a86c</a>&quo=
t;<br>
-<br>
-# Strip host paths from autogenerated test files<br>
-do_compile:append() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i &#39;s+${S}/++g&#39; ${B}/tests/*.c 2&gt=
;/dev/null || :<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i &#39;s+${B}/++g&#39; ${B}/tests/*.c 2&gt=
;/dev/null || :<br>
-}<br>
-<br>
-# Export source files/headers needed by Arm Trusted Firmware<br>
-sysroot_stage_all:append() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0sysroot_stage_dir &quot;${S}/library&quot; &quo=
t;${SYSROOT_DESTDIR}/usr/share/mbedtls-source/library&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0sysroot_stage_dir &quot;${S}/include&quot; &quo=
t;${SYSROOT_DESTDIR}/usr/share/mbedtls-source/include&quot;<br>
-}<br>
-<br>
-do_install_ptest () {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${PTEST_PATH}/tests<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0cp -f ${B}/tests/test_suite_* ${D}${PTEST_PATH}=
/tests/<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0find ${D}${PTEST_PATH}/tests/ -type f -name &qu=
ot;*.c&quot; -delete<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0cp -fR ${S}/tests/data_files ${D}${PTEST_PATH}/=
tests/<br>
-}<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#126045): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/126045" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/126045</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/118690748/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/118690748/1997914</a><br>
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

--0000000000003d27f8064ecd906e--

