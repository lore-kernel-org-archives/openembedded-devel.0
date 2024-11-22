Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61282E69182
	for <webhook@archiver.kernel.org>; Fri, 22 Nov 2024 16:33:27 +0000 (UTC)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
 by mx.groups.io with SMTP id smtpd.web10.28571.1732293204120734552
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Nov 2024 08:33:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SFjbs89b;
 spf=pass (domain: gmail.com, ip: 209.85.167.170, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-3e5f533e1c2so1093596b6e.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 22 Nov 2024 08:33:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732293203; x=1732898003; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lTI1Z4qmX+/Yyxv8EfOF8yN+5kQKqIzgdYmUZFPYdBQ=;
        b=SFjbs89bvJvPI6ZuCQ9VHJ1Tv8FjlhJnlW8Xo1O76bViKCmMlrz5vWXy14Xv+lU4GI
         b4Lf3GiFQWRyvBwT6zVBgrJUPMCwnxiFvEhPX9iDVfVqmTidEo1QFo6HpadLrZKz4TYi
         lDKv44zIrwouTCxH2HY0H8tD5hX1bf5GRwixjRWMvCC8FEUteZSu9s6PHYBmNToPySKK
         vwlWpmStaffy+xvfyLIHc3n/fZedsAX8d9H0+D3WtwERsi2FpsbpxinGfm3Ceh4wZKYc
         9HRwqjHGknGWQnUuTE4iOS9QRYAOF/hXPZTpOq3vCOaEohuD9svpcvXFmvsAz4ed46ee
         92fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732293203; x=1732898003;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lTI1Z4qmX+/Yyxv8EfOF8yN+5kQKqIzgdYmUZFPYdBQ=;
        b=BmnjGhLdMIBxH9NgWF/7G5qVbSFe+fRbR7dkFgDjP4f19nxruDymdz7qo3pzeP4MjO
         rxRrJbVxqOp3OeKA7jXOnCIQD8Kb5dntVamCYHSUH6wtzyEXRuush0A7WPs1sfm5jnuI
         2pWHwwSF6RL+yMcT7a4Dzuc2YQv0RPtonZHF8VEMz1xokre7JwlOEJ4kzH7ZNzXd2YiR
         cTRuQQEovmAYKBLmUZDltCU0dDaTbYs/me4+Xcjwxn3Y7LZGAihq4xlKNOtDstdElrq6
         HFW0gdh6JXk45fs0giAUi9Xs1bAX7dF6y1JwHZndM/Xj+q+W4jGBbJJanbUzU/Dazh/N
         cNeA==
X-Gm-Message-State: AOJu0YwBq6B50Og/dkK0NdAXRDXP6HpPxn5IRM5SQlWXo1jkBSM/EDVC
	/xU62d0g1AhIn8BUbO/I0HVGcAQwo2iTBiE3C8XjJ5FG+NFKQJ6RyK9EcFYJP/O3zt2KpjxP/dY
	ftinaUVcgd8oSPluP7NJoUPDHcuHBFA==
X-Gm-Gg: ASbGncsMdtDHoTauxFHz2uOkWwlb8fSvQg2EcEvB49SCRD/F/ewfxzXfYO+KBisaDYx
	Q+uJYqS2n5yX9drSJxEUzVx0JOUaZCvyx4VAPwDs2vvoMYgMCaPY7Ek4xRdd6tH+L
X-Google-Smtp-Source: AGHT+IFZpmYcorPA592KbjpN4b2kP/XorqYAVFI/zXRTAZtaiG4NtQNNS07YJXtiiK0W1zByCOSPzK5QkCXqzgyW6xM=
X-Received: by 2002:a05:6808:308a:b0:3e7:644e:3ca2 with SMTP id
 5614622812f47-3e9159d6455mr3683124b6e.29.1732293201896; Fri, 22 Nov 2024
 08:33:21 -0800 (PST)
MIME-Version: 1.0
References: <20241122-add-cryptopp-v2-1-19456062f791@bootlin.com>
In-Reply-To: <20241122-add-cryptopp-v2-1-19456062f791@bootlin.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 22 Nov 2024 08:32:55 -0800
Message-ID: <CAMKF1sq=SUX2ZUxoduOc3QLgMk8_24KGsq481ABOXOv4558XWw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v2] cryptopp: add a recipe for version 8.9.0
To: antonin.godard@bootlin.com
Cc: openembedded-devel@lists.openembedded.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Nov 2024 16:33:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114004

On Fri, Nov 22, 2024 at 6:11=E2=80=AFAM Antonin Godard via
lists.openembedded.org
<antonin.godard=3Dbootlin.com@lists.openembedded.org> wrote:
>
> Cryptopp is a library of cryptographic schemes written in C++.
>
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
> I had issues compiling for qemuarm64, which are close to
> https://github.com/weidai11/cryptopp/issues/565. One of the solution is
> to disable ASM, so do that for aarch64. I don't observe the issue with
> qemuarm.
> ---
> Changes in v2:
> - WORKDIR -> UNPACKDIR in S
> - remove bb.utils.contains in CXXFLAGS:append:aarch64 (forgot to remove
>   after adding aarch64 override)
> - Link to v1: https://lore.kernel.org/r/20241121-add-cryptopp-v1-1-36382a=
60cecb@bootlin.com
> ---
>  meta-oe/recipes-crypto/cryptopp/cryptopp_8.9.0.bb | 45 +++++++++++++++++=
++++++
>  1 file changed, 45 insertions(+)
>
> diff --git a/meta-oe/recipes-crypto/cryptopp/cryptopp_8.9.0.bb b/meta-oe/=
recipes-crypto/cryptopp/cryptopp_8.9.0.bb
> new file mode 100644
> index 0000000000000000000000000000000000000000..a3d4fedb2f67c0111dcd26208=
1b622cfbdd40b57
> --- /dev/null
> +++ b/meta-oe/recipes-crypto/cryptopp/cryptopp_8.9.0.bb
> @@ -0,0 +1,45 @@
> +SUMMARY =3D "A C++ class library of cryptographic schemes"
> +DESCRIPTION =3D "Crypto++ Library is a C++ class library of cryptographi=
c schemes"
> +CVE_PRODUCT =3D "cryptopp"
> +HOMEPAGE =3D "http://www.cryptopp.com/"
> +SECTION =3D "libs"
> +LICENSE =3D "BSL-1.0"
> +LIC_FILES_CHKSUM =3D "file://License.txt;md5=3Dca6dacb7ef68b1ab5dfa3bed2=
4c12003"
> +
> +SRC_URI =3D "git://github.com/weidai11/cryptopp.git;protocol=3Dhttps;bra=
nch=3Dmaster"
> +SRCREV =3D "843d74c7c97f9e19a615b8ff3c0ca06599ca501b"
> +
> +S =3D "${UNPACKDIR}/git"

This should be WORKDIR/git here.

> +
> +inherit pkgconfig
> +
> +CXXFLAGS:append =3D " -fPIC"

maybe use +=3D here.

> +# Avoid target mismatch error
> +CXXFLAGS:append:aarch64 =3D " -DCRYPTOPP_DISABLE_ASM=3D1"

This will build suboptimally. It would be better to fix the issue in
Makefile to use compatible options.

> +EXTRA_OEMAKE +=3D "HAS_SOLIB_VERSION=3D1"
> +
> +do_compile () {
> +    oe_runmake -f GNUmakefile-cross libcryptopp.a libcryptopp.so cryptes=
t.exe
> +}
> +
> +do_install () {
> +    DESTDIR=3D"${D}" \
> +        BINDIR=3D"${bindir}" \
> +        DATADIR=3D"${datadir}" \
> +        INCLUDEDIR=3D"${includedir}" \
> +        LIBDIR=3D"${libdir}" \
> +        oe_runmake install
> +
> +    # Rename cryptest.exe to cryptest
> +    if [ -f "${D}${bindir}/cryptest.exe" ]; then
> +        mv "${D}${bindir}/cryptest.exe" "${D}${bindir}/cryptest"
> +    fi
> +}
> +
> +PACKAGE_BEFORE_PN +=3D "${PN}-cryptest ${PN}-testdata ${PN}-testvectors"
> +
> +FILES:${PN}-cryptest =3D "${bindir}/cryptest"
> +FILES:${PN}-testdata =3D "${datadir}/cryptopp/TestData"
> +FILES:${PN}-testvectors =3D "${datadir}/cryptopp/TestVectors"
> +
> +BBCLASSEXTEND =3D "native nativesdk"
>
> ---
> base-commit: 71ffb63f60b233722ec9d8b50bfe0488997fbcfa
> change-id: 20241121-add-cryptopp-f78794be963c
>
> Best regards,
> --
> Antonin Godard <antonin.godard@bootlin.com>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#114001): https://lists.openembedded.org/g/openembedde=
d-devel/message/114001
> Mute This Topic: https://lists.openembedded.org/mt/109722638/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

