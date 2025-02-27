Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8069C282C5
	for <webhook@archiver.kernel.org>; Thu, 27 Feb 2025 18:10:41 +0000 (UTC)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
 by mx.groups.io with SMTP id smtpd.web10.17973.1740679832759692778
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Feb 2025 10:10:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=a/z8/aJU;
 spf=pass (domain: gmail.com, ip: 209.85.167.181, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3f3fa7ba7f4so1359413b6e.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 27 Feb 2025 10:10:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740679832; x=1741284632; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rKIc4xaq7dqd00RYbUBnDlc/YsgrrNTsdROQZ1EsETI=;
        b=a/z8/aJU3+5cEfA78N1aCV3f/x1BXjw/XUfVEwk85ceoA/QsnxI+ssr3cuqWtJ/8qG
         JZy/V/ZIEzxrJmwaud3EVIeloK3xUFw3j2hEQT2C2B6Yth30bpCeR5X77ZC8udPOOFdC
         ffOPIcrZGCK6UPqYPiOZ6B3QUECkLLJgkQ2/nIEQ3ik52FInpQhCNgvtvd40dTcIxXHO
         CsYqBJMaHOVYBpMuNULgKaVHnH+ofTL4wGszBufDIu6VSVcCJhfwegl4upSHBsfqqz4b
         qxiYpaWjaKNfE+9Q8jIIWpKnyjYK1JFVeqtYlYdsF+hTmz/ld+wchJmLT9O/ga2ZGBgL
         0OWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740679832; x=1741284632;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rKIc4xaq7dqd00RYbUBnDlc/YsgrrNTsdROQZ1EsETI=;
        b=cRCE+5v6iNgN4FbTBmB/c2G+B+fJWn8sPRQ3iy1RKwc4nv9qQzWLzLhY1tstiTmlFG
         EBJTjzKoMR/n0bBr51POytpKbgmjwSvmQWrpRqG4p+bpDnZHSuMH0rWkdnOL8GeqmkaN
         IEOEbrzI5nWT/pmAtTrvfdqLIKojRXHD/gPymIAqIbNfm+rcQe9o81NYL80tut490zTh
         gpK9LF3ZDv2W47YM/YNhq1WTRZRPj97anORTVn+rKOQYVwHDBcW5kPAhJy8m/Z0hZUSe
         8B/yrXTXcnbmPHR1du8Bpk/FAHLizwZe1v14/H9ZW40BUNgJ2xyGqqDDRfKd+8njfylT
         gUrQ==
X-Gm-Message-State: AOJu0YzvkDS9Qr13ykGiksbyUjVC8XRmmQCxAEnC5R1nB2TBCPINb0Iq
	spOsOB4vB61zC0Wv9sRbSSElTwwBQ/Gkd4j5Q4vwWWKpVQvx3BnDg3dOdiJN6OlpR/yf8M2wWHf
	+HPSwUvXsmiLsfXnkjAmOd8QDLdrf5YEOk9o=
X-Gm-Gg: ASbGncuun91qjvUtr3O5vGC8ieT7g2oi9KpqveWQH+AK8TNeIFW+Nqr4VEQkapx51lz
	EsyTqlHO+alIS4jT0L+jRdVBBiNob1Ox/v+YVE+B5He8DIxyskuEIv9O8CdCOamP4aZ6cSW+2kf
	hyfCWjrnF6ACeekndlxBCg9YK7hQQFsdOsL97f
X-Google-Smtp-Source: AGHT+IEWTCRsjiJfMnJpetF5QkC6RSyg3yf0SPrl0YI3qOCixE+HQrCf/6WM4S5j/CgAYEyk0eZIuHOdi/EAS7w0+rc=
X-Received: by 2002:a05:6808:198c:b0:3e7:e38a:722b with SMTP id
 5614622812f47-3f558003ddcmr310530b6e.14.1740679832010; Thu, 27 Feb 2025
 10:10:32 -0800 (PST)
MIME-Version: 1.0
References: <20250227165742.1727454-1-skandigraun@gmail.com>
In-Reply-To: <20250227165742.1727454-1-skandigraun@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 27 Feb 2025 10:10:05 -0800
X-Gm-Features: AQ5f1Jq9IWYjh1NI5OzE5V24iI7AVekchstEJB41fwM12JhZ_a8CZCp8AYWTDME
Message-ID: <CAMKF1sp7D_bxH7SoTDHvRTGUfQDvrMccJ7TgDDido5_7S=CPiA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v2] thin-provisioning-tools: add target and
 sysroot to bindgen flags
To: skandigraun@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Feb 2025 18:10:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115697

On Thu, Feb 27, 2025 at 8:57=E2=80=AFAM Gyorgy Sarvari via
lists.openembedded.org <skandigraun=3Dgmail.com@lists.openembedded.org>
wrote:
>
> BUILD_CFLAGS doesn't contain information about the recipe sysroot nor abo=
ut the target
> system - and in case these are not specified for bindgen, then it builds =
against
> the build system's headers, using the build system's arch.
>
> Instead of BUILD_CFLAGS pass TOOLCHAIN_OPTIONS, which has the contains th=
e sysroot
> already, and pass the target flag.
>
> Fixes the following do_compile error:
>
> |   /usr/include/linux/types.h:5:10: fatal error: 'asm/types.h' file not =
found
> |   thread 'main' panicked at /yocto/sandbox/build/tmp/work/cortexa72-pok=
y-linux/thin-provisioning-tools/1.1.0/sources-unpack/cargo_home/bitbake/dev=
icemapper-sys-0.3.0/build.rs:24:10:
> |   Could not generate dm.h bindings: ClangDiagnostic("/usr/include/linux=
/types.h:5:10: fatal error: 'asm/types.h' file not found\n")
>
> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> ---
>  .../thin-provisioning-tools/thin-provisioning-tools_1.1.0.bb    | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/dynamic-layers/clang-layer/recipes-support/thin-prov=
isioning-tools/thin-provisioning-tools_1.1.0.bb b/meta-oe/dynamic-layers/cl=
ang-layer/recipes-support/thin-provisioning-tools/thin-provisioning-tools_1=
.1.0.bb
> index bb4b53c28b..1526a33f8d 100644
> --- a/meta-oe/dynamic-layers/clang-layer/recipes-support/thin-provisionin=
g-tools/thin-provisioning-tools_1.1.0.bb
> +++ b/meta-oe/dynamic-layers/clang-layer/recipes-support/thin-provisionin=
g-tools/thin-provisioning-tools_1.1.0.bb
> @@ -21,7 +21,7 @@ inherit pkgconfig
>  DEPENDS +=3D "udev libdevmapper libdevmapper-native clang-native"
>
>  export LIBCLANG_PATH =3D "${WORKDIR}/recipe-sysroot-native${libdir}"
> -export BINDGEN_EXTRA_CLANG_ARGS =3D "${BUILD_CFLAGS}"
> +export BINDGEN_EXTRA_CLANG_ARGS =3D "${TOOLCHAIN_OPTIONS} --target=3D${T=
ARGET_SYS}"

We need --target too yes, lets use ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}
here that should replicate
target cross compiler options

>
>  require ${BPN}-crates.inc
>  require ${BPN}-git-crates.inc
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#115695): https://lists.openembedded.org/g/openembedde=
d-devel/message/115695
> Mute This Topic: https://lists.openembedded.org/mt/111418497/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

