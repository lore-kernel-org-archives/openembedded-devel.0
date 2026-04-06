Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCBFFF46C62
	for <webhook@archiver.kernel.org>; Mon,  6 Apr 2026 17:21:14 +0000 (UTC)
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.60360.1775496070467712447
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Apr 2026 10:21:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=IAZRfweq;
 spf=pass (domain: gmail.com, ip: 74.125.224.53, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-6501c9903edso3975819d50.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Apr 2026 10:21:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775496069; cv=none;
        d=google.com; s=arc-20240605;
        b=g4c3i+Y5mWYRoh04spw9eH6Kr6jj7xwUyMlNAebfr36bZcNeTz4CzI75BSRcjF4/LU
         tn3+HjI5e0CZRvQt9goZGuzaaAoHdVz0IabxDWrhrc5/be08gI88fu73PTtfkWQA2RaT
         VOukt3rbe38n0ioizRDysRdeMWv2QBXJiY9UbS2nCPpXEvRtH4/pDiNVeo4GzXcDLIgW
         4CwEws1e2orcDunCz8DMQlE5O6oTFneQz1XLk8s5qgY5c7mz9DmwxFzTuSWbTkmnInKB
         H6EWCpHVfKuhK1IrchY5uO5liBycawy5VJGZEug8TQqE62qoe/6hTCrWgvCqIcZw+tY3
         4VJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=DDjtQ/1bXmZIFAOTA6nnkg4fJLuSe9qSFyW5sJD6HuU=;
        fh=/Zfoi4o9G9NEfOtGJ0LSUrfiVhZcuLLzOVZQmzCL8qM=;
        b=SGAQ3b5+XN2Xil1jyUuxbgHRfy2dvo3v4Bjzxcig6Y1P4elGqORT6qRvzUYJJ0VR9a
         OOWQltfCNfKAxwq2ctANZDtzy75Lt47SoqS5W4Mwd6Gh6WvjCW8S0epAZ6jycvvutPk4
         HfXTfozNkhHRlW0g6iPkcAxse5flkaXgFRDCmqqcJJonxjprm1BpsNqI+NdMkQQt61FH
         NdoSA4j6kT2ZwMSdVAcRqwB/50wYdyydwr/pWfp/J5aHZFAZK1uipa0MLpN6+cAjXkIW
         DK0EfM3n3H5YAH5xBgwNYqV8jFXK3v9S/qqvIsP09YA7m0lOIT9Km0J1gSPHz69DKxqH
         NfcA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775496069; x=1776100869; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DDjtQ/1bXmZIFAOTA6nnkg4fJLuSe9qSFyW5sJD6HuU=;
        b=IAZRfweqOn9SeBOEsEGmUxVAE99rXx7atnol+cme1yu3Gt7ChaFICsj5OrSDgxIcez
         kZZyLMs2/ItNrzccQsh9xsQz7EvTwXQ9ec2yCMzTUfonQ8RptBE8UWYwr45b/jh28/Y9
         PMcO2+PzV+8YNtqM6bWAJ6/fTSUHEEz7FYgTVJOJgorXqb22gxzU4MBZELVFt4bdd5xT
         uMF3y5EZ5HBAAn8t3dZC2TjHKje0US6IZPxdGfSLu2mYf61a6SnPlLKwB+ywFPIOGjdc
         AzhNYx7bqdsZv5ks3GriLsuHJNHvlDr/8EnTSsaBsS0CBHkEqoLt7KWT1Jq7+FwvFomz
         uqKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775496069; x=1776100869;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DDjtQ/1bXmZIFAOTA6nnkg4fJLuSe9qSFyW5sJD6HuU=;
        b=Qnw66YX3ErjDEoFY9E5FakRDebvaorshcz/KjcCqOUUCKu5JGcweS3WTVadOg/212M
         AHOPEfp0QD2LggMirD+doqqFdu7ncE3u7HYUknPV/NRSFtb4rgVK8HACbC2k5RkBsaxy
         HA9XFIAf0wA/NIP+jRGIpctcWRYTV5RjleFuDrs04OddYkEp6VAqAK3hnkVlh2vj2GfC
         m6S/ws0UEa/wqIrZXAGLUiRcv5FCdEqIVjFCHT2jkDjYx6rUAGJON6WUaZLA8ghcc0v1
         MQXuW+03B/bvDd1pBVRiC47891AUGjx8yx1Gi7ECeB8Uqm5cKi9JCZIyYp4ALaLKEGtf
         WpNA==
X-Gm-Message-State: AOJu0Yx6HHuvPD46GXO5dBPQ30vceie80TRimEWwTJyhkNuYBEMKhYZu
	RCH5WZmL4fozU/6cOYXyZfH1GvgNYygdZ2QueQi52HLTGHL9OkELz87yetQ5f5cW4pcgVLH879e
	p/4o1fn74eOdyR9Dz+q0Lvh8nfzX4j/Q=
X-Gm-Gg: AeBDietMaT4cLs4Z2cr1bsZRmGf8ZqWR6pgrKJeAVMJCKygijYpDqjieV/n4+QJuQVD
	aeMxCE2vp3udfL9Otkc5kEyaNsbeYBxCP6tF7pEmDS5akTuKvH+dK02wUXS1GKHeZXS21oEAFxT
	mBNzaA5F4PPfh4a6f0bqm5b4poQJbEq19oqhU0sZPtuD6coas36DBqywV+CQBpYF4j0LFbVKMKE
	CQ99Q1bnjqp8TjyhbB43u/fcfdQqLQ+BautGKApPScyR8FeWNq4e0iFcu6z8p3VRb/UvA3tPCSu
	2zLKjkUQuTWEQBrT/Owps45gkeSbN9k7yCr49tfyFxs1lBDUfz1eIiU8K/DDTq6lsNMr9EMBshD
	RVL9im38wECxp7UDhvViZtxa9Xuzu4WfPFPs=
X-Received: by 2002:a53:ba89:0:b0:64e:c5a5:3a5a with SMTP id
 956f58d0204a3-65048814f8amr10578563d50.46.1775496069156; Mon, 06 Apr 2026
 10:21:09 -0700 (PDT)
MIME-Version: 1.0
References: <20260406141500.3557451-1-skandigraun@gmail.com>
 <CAMKF1spYETBv05ax4eGpxW5==dY3DmAScE7tVMqLYiYHiqiVeQ@mail.gmail.com> <e9d4e5d2-37b3-4cd5-9c5f-28b9e8a00824@gmail.com>
In-Reply-To: <e9d4e5d2-37b3-4cd5-9c5f-28b9e8a00824@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 6 Apr 2026 10:20:38 -0700
X-Gm-Features: AQROBzC0ZoNcSObed0roRfXvPCR_97CzFrMX5HDk2qdTDLb30w3P-gKc4kEtmuo
Message-ID: <CAMKF1so_ubJCn_yTVF5Hu5z=UevUPG2GTb62_cBzqDNHna047g@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH 1/2] mbedtls: drop recipe for v2
To: Gyorgy Sarvari <skandigraun@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000080937a064ecde40b"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Apr 2026 17:21:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126058

--00000000000080937a064ecde40b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 6, 2026 at 10:06=E2=80=AFAM Gyorgy Sarvari <skandigraun@gmail.c=
om>
wrote:

>
> On 4/6/26 18:57, Khem Raj wrote:
> > I think we should drop it since upcoming release it LTS and carrying an
> > EOL package is not good. I also wonder if we should be adding recipe fo=
r
> > 4.x release, is it backward compatible to 3.x ? if not maybe a second
> > recipe.
> >
>
>
> Yes, I started to look at 4.x, I also think it would be nice to get in,
> because 3.x has only a year of support left. I was thinking leaving 3.x,
> but making the new one the default. It was giving me some errors that I
> managed to solve, and then it gave me some new very weird errors... plan
> to try again soon, unless someone else is faster.
>

yeah 4.x could spin up some errors which is ok since they will be solved
over time
 please post your WIP patches somewhere if you like some more eyes on them

>
>
> > On Mon, Apr 6, 2026 at 7:15=E2=80=AFAM Gyorgy Sarvari via lists.openemb=
edded.org
> > <http://lists.openembedded.org>
> > <skandigraun=3Dgmail.com@lists.openembedded.org
> > <mailto:gmail.com@lists.openembedded.org>> wrote:
> >
> >     It has been unmaintained/EOL for over a year - there is
> >     a recipe for a newer, still supported version.
> >
> >     Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com
> >     <mailto:skandigraun@gmail.com>>
> >     ---
> >      .../mbedtls/mbedtls_2.28.10.bb <http://mbedtls_2.28.10.bb>
> >           | 79 -------------------
> >      1 file changed, 79 deletions(-)
> >      delete mode 100644 meta-networking/recipes-connectivity/mbedtls/
> >     mbedtls_2.28.10.bb <http://mbedtls_2.28.10.bb>
> >
> >     diff --git a/meta-networking/recipes-connectivity/mbedtls/
> >     mbedtls_2.28.10.bb <http://mbedtls_2.28.10.bb> b/meta-networking/
> >     recipes-connectivity/mbedtls/mbedtls_2.28.10.bb <http://
> >     mbedtls_2.28.10.bb>
> >     deleted file mode 100644
> >     index b126aee7db..0000000000
> >     --- a/meta-networking/recipes-connectivity/mbedtls/
> >     mbedtls_2.28.10.bb <http://mbedtls_2.28.10.bb>
> >     +++ /dev/null
> >     @@ -1,79 +0,0 @@
> >     -SUMMARY =3D "Lightweight crypto and SSL/TLS library"
> >     -DESCRIPTION =3D "mbedtls is a lean open source crypto library
>   \
> >     -for providing SSL and TLS support in your programs. It offers
>   \
> >     -an intuitive API and documented header files, so you can actually
>   \
> >     -understand what the code does. It features:
>   \
> >     -
>  \
> >     - - Symmetric algorithms, like AES, Blowfish, Triple-DES, DES,
> ARC4,  \
> >     -   Camellia and XTEA
>  \
> >     - - Hash algorithms, like SHA-1, SHA-2, RIPEMD-160 and MD5
>   \
> >     - - Entropy pool and random generators, like CTR-DRBG and HMAC-DRBG
>  \
> >     - - Public key algorithms, like RSA, Elliptic Curves,
> Diffie-Hellman, \
> >     -   ECDSA and ECDH
>   \
> >     - - SSL v3 and TLS 1.0, 1.1 and 1.2
>  \
> >     - - Abstraction layers for ciphers, hashes, public key operations,
>   \
> >     -   platform abstraction and threading
>   \
> >     -"
> >     -
> >     -HOMEPAGE =3D "https://tls.mbed.org/ <https://tls.mbed.org/>"
> >     -
> >     -LICENSE =3D "Apache-2.0 | GPL-2.0-or-later"
> >     -LIC_FILES_CHKSUM =3D "file://
> >     LICENSE;md5=3D379d5819937a6c2f1ef1630d341e026d"
> >     -
> >     -SECTION =3D "libs"
> >     -
> >     -SRCREV =3D "2fc8413bfcb51354c8e679141b17b3f1a5942561"
> >     -SRC_URI =3D "git://github.com/Mbed-TLS/
> >     mbedtls.git;protocol=3Dhttps;branch=3Darchive/mbedtls-2.28;tag=3D${=
BPN}
> >     <http://github.com/Mbed-TLS/
> >
>  mbedtls.git;protocol=3Dhttps;branch=3Darchive/mbedtls-2.28;tag=3D$%7BBPN=
%7D> \
> >     -           file://run-ptest \
> >     -          "
> >     -
> >     -inherit cmake update-alternatives ptest
> >     -
> >     -PACKAGECONFIG ??=3D "shared-libs programs
> >     ${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)}"
> >     -PACKAGECONFIG[shared-libs] =3D "-DUSE_SHARED_MBEDTLS_LIBRARY=3DON,=
-
> >     DUSE_SHARED_MBEDTLS_LIBRARY=3DOFF"
> >     -PACKAGECONFIG[programs] =3D
> "-DENABLE_PROGRAMS=3DON,-DENABLE_PROGRAMS=3DOFF"
> >     -PACKAGECONFIG[werror] =3D "-DMBEDTLS_FATAL_WARNINGS=3DON,-
> >     DMBEDTLS_FATAL_WARNINGS=3DOFF"
> >     -# Make X.509 and TLS calls use PSA
> >     -# https://github.com/Mbed-TLS/mbedtls/blob/development/docs/use-
> >     psa-crypto.md
> >     -PACKAGECONFIG[psa] <https://github.com/Mbed-TLS/mbedtls/blob/
> >     development/docs/use-psa-crypto.md-PACKAGECONFIG%5Bpsa%5D> =3D ""
> >     -PACKAGECONFIG[tests] =3D "-DENABLE_TESTING=3DON,-DENABLE_TESTING=
=3DOFF"
> >     -
> >     -EXTRA_OECMAKE =3D "-DLIB_INSTALL_DIR:STRING=3D${libdir}"
> >     -
> >     -# For now the only way to enable PSA is to explicitly pass a -D vi=
a
> >     CFLAGS
> >     -CFLAGS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'psa', ' =
-
> >     DMBEDTLS_USE_PSA_CRYPTO', '', d)}"
> >     -
> >     -PROVIDES +=3D "polarssl"
> >     -RPROVIDES:${PN} =3D "polarssl"
> >     -
> >     -PACKAGES =3D+ "${PN}-programs"
> >     -FILES:${PN}-programs =3D "${bindir}/"
> >     -
> >     -ALTERNATIVE:${PN}-programs =3D "${@bb.utils.contains('PACKAGECONFI=
G',
> >     'programs', 'hello', '', d)}"
> >     -ALTERNATIVE_LINK_NAME[hello] =3D "${bindir}/hello"
> >     -
> >     -BBCLASSEXTEND =3D "native nativesdk"
> >     -
> >     -CVE_PRODUCT =3D "mbed_tls"
> >     -
> >     -CVE_STATUS[CVE-2021-43666] =3D "backported-patch: Fix merged upstr=
eam
> >     https://github.com/Mbed-TLS/mbedtls/pull/5310 <https://github.com/
> >     Mbed-TLS/mbedtls/pull/5310>"
> >     -CVE_STATUS[CVE-2021-45451] =3D "backported-patch: Fix merged upstr=
eam
> >     https://github.com/Mbed-TLS/mbedtls/
> >     commit/9a4a9c66a48edfe9ece03c7e4a53310adf73a86c <https://github.com=
/
> >     Mbed-TLS/mbedtls/commit/9a4a9c66a48edfe9ece03c7e4a53310adf73a86c>"
> >     -
> >     -# Strip host paths from autogenerated test files
> >     -do_compile:append() {
> >     -       sed -i 's+${S}/++g' ${B}/tests/*.c 2>/dev/null || :
> >     -       sed -i 's+${B}/++g' ${B}/tests/*.c 2>/dev/null || :
> >     -}
> >     -
> >     -# Export source files/headers needed by Arm Trusted Firmware
> >     -sysroot_stage_all:append() {
> >     -       sysroot_stage_dir "${S}/library" "${SYSROOT_DESTDIR}/usr/
> >     share/mbedtls-source/library"
> >     -       sysroot_stage_dir "${S}/include" "${SYSROOT_DESTDIR}/usr/
> >     share/mbedtls-source/include"
> >     -}
> >     -
> >     -do_install_ptest () {
> >     -       install -d ${D}${PTEST_PATH}/tests
> >     -       cp -f ${B}/tests/test_suite_* ${D}${PTEST_PATH}/tests/
> >     -       find ${D}${PTEST_PATH}/tests/ -type f -name "*.c" -delete
> >     -       cp -fR ${S}/tests/data_files ${D}${PTEST_PATH}/tests/
> >     -}
> >
> >     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >     Links: You receive all messages sent to this group.
> >     View/Reply Online (#126045): https://lists.openembedded.org/g/
> >     openembedded-devel/message/126045 <https://lists.openembedded.org/g=
/
> >     openembedded-devel/message/126045>
> >     Mute This Topic: https://lists.openembedded.org/mt/118690748/199791=
4
> >     <https://lists.openembedded.org/mt/118690748/1997914>
> >     Group Owner: openembedded-devel+owner@lists.openembedded.org
> >     <mailto:openembedded-devel%2Bowner@lists.openembedded.org>
> >     Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/
> >     unsub <https://lists.openembedded.org/g/openembedded-devel/unsub>
> >     [raj.khem@gmail.com <mailto:raj.khem@gmail.com>]
> >     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>

--00000000000080937a064ecde40b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Apr 6, =
2026 at 10:06=E2=80=AFAM Gyorgy Sarvari &lt;<a href=3D"mailto:skandigraun@g=
mail.com">skandigraun@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><br>
On 4/6/26 18:57, Khem Raj wrote:<br>
&gt; I think we should drop it since upcoming release it LTS and carrying a=
n<br>
&gt; EOL package is not good. I also wonder if we should be adding recipe f=
or<br>
&gt; 4.x release, is it backward compatible to 3.x ? if not maybe a second<=
br>
&gt; recipe.<br>
&gt; <br>
<br>
<br>
Yes, I started to look at 4.x, I also think it would be nice to get in,<br>
because 3.x has only a year of support left. I was thinking leaving 3.x,<br=
>
but making the new one the default. It was giving me some errors that I<br>
managed to solve, and then it gave me some new very weird errors... plan<br=
>
to try again soon, unless someone else is faster.<br></blockquote><div><br>=
</div><div>yeah 4.x could spin up some errors which is ok since they will b=
e solved over time</div><div>=C2=A0please post your WIP patches somewhere i=
f you=C2=A0like some more eyes on them=C2=A0</div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">
<br>
<br>
&gt; On Mon, Apr 6, 2026 at 7:15=E2=80=AFAM Gyorgy Sarvari via <a href=3D"h=
ttp://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.op=
enembedded.org</a><br>
&gt; &lt;<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" targe=
t=3D"_blank">http://lists.openembedded.org</a>&gt;<br>
&gt; &lt;skandigraun=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" =
target=3D"_blank">gmail.com@lists.openembedded.org</a><br>
&gt; &lt;mailto:<a href=3D"mailto:gmail.com@lists.openembedded.org" target=
=3D"_blank">gmail.com@lists.openembedded.org</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0It has been unmaintained/EOL for over a year - ther=
e is<br>
&gt;=C2=A0 =C2=A0 =C2=A0a recipe for a newer, still supported version.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Signed-off-by: Gyorgy Sarvari &lt;<a href=3D"mailto=
:skandigraun@gmail.com" target=3D"_blank">skandigraun@gmail.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:skandigraun@gmail.com"=
 target=3D"_blank">skandigraun@gmail.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0---<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0.../mbedtls/<a href=3D"http://mbedtls_2.28.10=
.bb" rel=3D"noreferrer" target=3D"_blank">mbedtls_2.28.10.bb</a> &lt;<a hre=
f=3D"http://mbedtls_2.28.10.bb" rel=3D"noreferrer" target=3D"_blank">http:/=
/mbedtls_2.28.10.bb</a>&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 | 79 -------------------<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A01 file changed, 79 deletions(-)<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0delete mode 100644 meta-networking/recipes-co=
nnectivity/mbedtls/<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"http://mbedtls_2.28.10.bb" rel=3D"norefe=
rrer" target=3D"_blank">mbedtls_2.28.10.bb</a> &lt;<a href=3D"http://mbedtl=
s_2.28.10.bb" rel=3D"noreferrer" target=3D"_blank">http://mbedtls_2.28.10.b=
b</a>&gt;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0diff --git a/meta-networking/recipes-connectivity/m=
bedtls/<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"http://mbedtls_2.28.10.bb" rel=3D"norefe=
rrer" target=3D"_blank">mbedtls_2.28.10.bb</a> &lt;<a href=3D"http://mbedtl=
s_2.28.10.bb" rel=3D"noreferrer" target=3D"_blank">http://mbedtls_2.28.10.b=
b</a>&gt; b/meta-networking/<br>
&gt;=C2=A0 =C2=A0 =C2=A0recipes-connectivity/mbedtls/<a href=3D"http://mbed=
tls_2.28.10.bb" rel=3D"noreferrer" target=3D"_blank">mbedtls_2.28.10.bb</a>=
 &lt;http://<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"http://mbedtls_2.28.10.bb" rel=3D"norefe=
rrer" target=3D"_blank">mbedtls_2.28.10.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0deleted file mode 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0index b126aee7db..0000000000<br>
&gt;=C2=A0 =C2=A0 =C2=A0--- a/meta-networking/recipes-connectivity/mbedtls/=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"http://mbedtls_2.28.10.bb" rel=3D"norefe=
rrer" target=3D"_blank">mbedtls_2.28.10.bb</a> &lt;<a href=3D"http://mbedtl=
s_2.28.10.bb" rel=3D"noreferrer" target=3D"_blank">http://mbedtls_2.28.10.b=
b</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+++ /dev/null<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -1,79 +0,0 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0-SUMMARY =3D &quot;Lightweight crypto and SSL/TLS l=
ibrary&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-DESCRIPTION =3D &quot;mbedtls is a lean open sourc=
e crypto library=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0-for providing SSL and TLS support in your programs=
. It offers=C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0-an intuitive API and documented header files, so y=
ou can actually=C2=A0 =C2=A0 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0-understand what the code does. It features:=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;=C2=A0 =C2=A0 =C2=A0- - Symmetric algorithms, like AES, Blowfish, Tripl=
e-DES, DES, ARC4,=C2=A0 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0Camellia and XTEA=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0\<br>
&gt;=C2=A0 =C2=A0 =C2=A0- - Hash algorithms, like SHA-1, SHA-2, RIPEMD-160 =
and MD5=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0- - Entropy pool and random generators, like CTR-DR=
BG and HMAC-DRBG=C2=A0 =C2=A0\<br>
&gt;=C2=A0 =C2=A0 =C2=A0- - Public key algorithms, like RSA, Elliptic Curve=
s, Diffie-Hellman, \<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0ECDSA and ECDH=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0- - SSL v3 and TLS 1.0, 1.1 and 1.2=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;=C2=A0 =C2=A0 =C2=A0- - Abstraction layers for ciphers, hashes, public =
key operations,=C2=A0 =C2=A0 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0platform abstraction and threading=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0-&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-<br>
&gt;=C2=A0 =C2=A0 =C2=A0-HOMEPAGE =3D &quot;<a href=3D"https://tls.mbed.org=
/" rel=3D"noreferrer" target=3D"_blank">https://tls.mbed.org/</a> &lt;<a hr=
ef=3D"https://tls.mbed.org/" rel=3D"noreferrer" target=3D"_blank">https://t=
ls.mbed.org/</a>&gt;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-<br>
&gt;=C2=A0 =C2=A0 =C2=A0-LICENSE =3D &quot;Apache-2.0 | GPL-2.0-or-later&qu=
ot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-LIC_FILES_CHKSUM =3D &quot;file://<br>
&gt;=C2=A0 =C2=A0 =C2=A0LICENSE;md5=3D379d5819937a6c2f1ef1630d341e026d&quot=
;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-<br>
&gt;=C2=A0 =C2=A0 =C2=A0-SECTION =3D &quot;libs&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-<br>
&gt;=C2=A0 =C2=A0 =C2=A0-SRCREV =3D &quot;2fc8413bfcb51354c8e679141b17b3f1a=
5942561&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-SRC_URI =3D &quot;git://<a href=3D"http://github.c=
om/Mbed-TLS/" rel=3D"noreferrer" target=3D"_blank">github.com/Mbed-TLS/</a>=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0mbedtls.git;protocol=3Dhttps;branch=3Darchive/mbedt=
ls-2.28;tag=3D${BPN}<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://github.com/Mbed-TLS/" rel=3D"=
noreferrer" target=3D"_blank">http://github.com/Mbed-TLS/</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0mbedtls.git;protocol=3Dhttps;branch=3Darchive/mbedt=
ls-2.28;tag=3D$%7BBPN%7D&gt; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://ru=
n-ptest \<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-<br>
&gt;=C2=A0 =C2=A0 =C2=A0-inherit cmake update-alternatives ptest<br>
&gt;=C2=A0 =C2=A0 =C2=A0-<br>
&gt;=C2=A0 =C2=A0 =C2=A0-PACKAGECONFIG ??=3D &quot;shared-libs programs<br>
&gt;=C2=A0 =C2=A0 =C2=A0${@bb.utils.contains(&#39;PTEST_ENABLED&#39;, &#39;=
1&#39;, &#39;tests&#39;, &#39;&#39;, d)}&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-PACKAGECONFIG[shared-libs] =3D &quot;-DUSE_SHARED_=
MBEDTLS_LIBRARY=3DON,-<br>
&gt;=C2=A0 =C2=A0 =C2=A0DUSE_SHARED_MBEDTLS_LIBRARY=3DOFF&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-PACKAGECONFIG[programs] =3D &quot;-DENABLE_PROGRAM=
S=3DON,-DENABLE_PROGRAMS=3DOFF&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-PACKAGECONFIG[werror] =3D &quot;-DMBEDTLS_FATAL_WA=
RNINGS=3DON,-<br>
&gt;=C2=A0 =C2=A0 =C2=A0DMBEDTLS_FATAL_WARNINGS=3DOFF&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-# Make X.509 and TLS calls use PSA<br>
&gt;=C2=A0 =C2=A0 =C2=A0-# <a href=3D"https://github.com/Mbed-TLS/mbedtls/b=
lob/development/docs/use-" rel=3D"noreferrer" target=3D"_blank">https://git=
hub.com/Mbed-TLS/mbedtls/blob/development/docs/use-</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0psa-crypto.md<br>
&gt;=C2=A0 =C2=A0 =C2=A0-PACKAGECONFIG[psa] &lt;<a href=3D"https://github.c=
om/Mbed-TLS/mbedtls/blob/" rel=3D"noreferrer" target=3D"_blank">https://git=
hub.com/Mbed-TLS/mbedtls/blob/</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0development/docs/use-psa-crypto.md-PACKAGECONFIG%5B=
psa%5D&gt; =3D &quot;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-PACKAGECONFIG[tests] =3D &quot;-DENABLE_TESTING=3D=
ON,-DENABLE_TESTING=3DOFF&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-<br>
&gt;=C2=A0 =C2=A0 =C2=A0-EXTRA_OECMAKE =3D &quot;-DLIB_INSTALL_DIR:STRING=
=3D${libdir}&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-<br>
&gt;=C2=A0 =C2=A0 =C2=A0-# For now the only way to enable PSA is to explici=
tly pass a -D via<br>
&gt;=C2=A0 =C2=A0 =C2=A0CFLAGS<br>
&gt;=C2=A0 =C2=A0 =C2=A0-CFLAGS:append =3D &quot;${@bb.utils.contains(&#39;=
PACKAGECONFIG&#39;, &#39;psa&#39;, &#39; -<br>
&gt;=C2=A0 =C2=A0 =C2=A0DMBEDTLS_USE_PSA_CRYPTO&#39;, &#39;&#39;, d)}&quot;=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0-<br>
&gt;=C2=A0 =C2=A0 =C2=A0-PROVIDES +=3D &quot;polarssl&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-RPROVIDES:${PN} =3D &quot;polarssl&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-<br>
&gt;=C2=A0 =C2=A0 =C2=A0-PACKAGES =3D+ &quot;${PN}-programs&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-FILES:${PN}-programs =3D &quot;${bindir}/&quot;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0-<br>
&gt;=C2=A0 =C2=A0 =C2=A0-ALTERNATIVE:${PN}-programs =3D &quot;${@bb.utils.c=
ontains(&#39;PACKAGECONFIG&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&#39;programs&#39;, &#39;hello&#39;, &#39;&#39;, d)=
}&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-ALTERNATIVE_LINK_NAME[hello] =3D &quot;${bindir}/h=
ello&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-<br>
&gt;=C2=A0 =C2=A0 =C2=A0-BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-<br>
&gt;=C2=A0 =C2=A0 =C2=A0-CVE_PRODUCT =3D &quot;mbed_tls&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-<br>
&gt;=C2=A0 =C2=A0 =C2=A0-CVE_STATUS[CVE-2021-43666] =3D &quot;backported-pa=
tch: Fix merged upstream<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://github.com/Mbed-TLS/mbedtls/pull=
/5310" rel=3D"noreferrer" target=3D"_blank">https://github.com/Mbed-TLS/mbe=
dtls/pull/5310</a> &lt;<a href=3D"https://github.com/" rel=3D"noreferrer" t=
arget=3D"_blank">https://github.com/</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0Mbed-TLS/mbedtls/pull/5310&gt;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-CVE_STATUS[CVE-2021-45451] =3D &quot;backported-pa=
tch: Fix merged upstream<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://github.com/Mbed-TLS/mbedtls/" re=
l=3D"noreferrer" target=3D"_blank">https://github.com/Mbed-TLS/mbedtls/</a>=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0commit/9a4a9c66a48edfe9ece03c7e4a53310adf73a86c &lt=
;<a href=3D"https://github.com/" rel=3D"noreferrer" target=3D"_blank">https=
://github.com/</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0Mbed-TLS/mbedtls/commit/9a4a9c66a48edfe9ece03c7e4a5=
3310adf73a86c&gt;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-<br>
&gt;=C2=A0 =C2=A0 =C2=A0-# Strip host paths from autogenerated test files<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0-do_compile:append() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i &#39;s+${S}/++g&=
#39; ${B}/tests/*.c 2&gt;/dev/null || :<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i &#39;s+${B}/++g&=
#39; ${B}/tests/*.c 2&gt;/dev/null || :<br>
&gt;=C2=A0 =C2=A0 =C2=A0-}<br>
&gt;=C2=A0 =C2=A0 =C2=A0-<br>
&gt;=C2=A0 =C2=A0 =C2=A0-# Export source files/headers needed by Arm Truste=
d Firmware<br>
&gt;=C2=A0 =C2=A0 =C2=A0-sysroot_stage_all:append() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0sysroot_stage_dir &quot=
;${S}/library&quot; &quot;${SYSROOT_DESTDIR}/usr/<br>
&gt;=C2=A0 =C2=A0 =C2=A0share/mbedtls-source/library&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0sysroot_stage_dir &quot=
;${S}/include&quot; &quot;${SYSROOT_DESTDIR}/usr/<br>
&gt;=C2=A0 =C2=A0 =C2=A0share/mbedtls-source/include&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-}<br>
&gt;=C2=A0 =C2=A0 =C2=A0-<br>
&gt;=C2=A0 =C2=A0 =C2=A0-do_install_ptest () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${PTEST_=
PATH}/tests<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0cp -f ${B}/tests/test_s=
uite_* ${D}${PTEST_PATH}/tests/<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0find ${D}${PTEST_PATH}/=
tests/ -type f -name &quot;*.c&quot; -delete<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0cp -fR ${S}/tests/data_=
files ${D}${PTEST_PATH}/tests/<br>
&gt;=C2=A0 =C2=A0 =C2=A0-}<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;=C2=A0 =C2=A0 =C2=A0Links: You receive all messages sent to this group.=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0View/Reply Online (#126045): <a href=3D"https://lis=
ts.openembedded.org/g/" rel=3D"noreferrer" target=3D"_blank">https://lists.=
openembedded.org/g/</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0openembedded-devel/message/126045 &lt;<a href=3D"ht=
tps://lists.openembedded.org/g/" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0openembedded-devel/message/126045&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Mute This Topic: <a href=3D"https://lists.openembed=
ded.org/mt/118690748/1997914" rel=3D"noreferrer" target=3D"_blank">https://=
lists.openembedded.org/mt/118690748/1997914</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://lists.openembedded.org/mt/11=
8690748/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.openemb=
edded.org/mt/118690748/1997914</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Group Owner: <a href=3D"mailto:openembedded-devel%2=
Bowner@lists.openembedded.org" target=3D"_blank">openembedded-devel+owner@l=
ists.openembedded.org</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:openembedded-devel%252=
Bowner@lists.openembedded.org" target=3D"_blank">openembedded-devel%2Bowner=
@lists.openembedded.org</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Unsubscribe: <a href=3D"https://lists.openembedded.=
org/g/openembedded-devel/" rel=3D"noreferrer" target=3D"_blank">https://lis=
ts.openembedded.org/g/openembedded-devel/</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0unsub &lt;<a href=3D"https://lists.openembedded.org=
/g/openembedded-devel/unsub" rel=3D"noreferrer" target=3D"_blank">https://l=
ists.openembedded.org/g/openembedded-devel/unsub</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0[<a href=3D"mailto:raj.khem@gmail.com" target=3D"_b=
lank">raj.khem@gmail.com</a> &lt;mailto:<a href=3D"mailto:raj.khem@gmail.co=
m" target=3D"_blank">raj.khem@gmail.com</a>&gt;]<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
<br>
</blockquote></div></div>

--00000000000080937a064ecde40b--

