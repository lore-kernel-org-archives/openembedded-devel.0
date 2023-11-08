Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8DEDC4332F
	for <webhook@archiver.kernel.org>; Wed,  8 Nov 2023 07:08:44 +0000 (UTC)
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
 by mx.groups.io with SMTP id smtpd.web11.8636.1699427318675235004
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Nov 2023 23:08:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eTve7ZVh;
 spf=pass (domain: gmail.com, ip: 209.85.161.51, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-5872b8323faso3570891eaf.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 07 Nov 2023 23:08:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699427318; x=1700032118; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J7VzRaE8nyxMdmXDKZ2HtWfD42WiZAPmDaBofWDRReA=;
        b=eTve7ZVhWIr9oND3BtUoIc+k2EANnr0s3+ZkI+EGg2LmnapeWLwgdpYdJfiuf522W5
         3cJ0iuqPrqXw/chWqNnTW8fY5kxXeFiUnmPP46RuEwFDIx4Xmqr2FoMEA8E4W6E0DHD8
         KXxTvv6Oy8eXCMQxh3CyfJjikZ1JexLWWCylrgY/HwkA3rVfxuLk8uCDe+NpZUZbvu+3
         jJesqccFV/bQGBkdR+fcUst+S+OVZaZ1B3Uhmp+q+q2gwFDy3IQjiN6B4/MWkUGFMUqa
         TFe+ECRJdMNIXbInYVjWUsnlS1J4uc5BiYH+VgMHZNt33yiZqXPsyKKTxalkC/LhF2r+
         YjlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699427318; x=1700032118;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J7VzRaE8nyxMdmXDKZ2HtWfD42WiZAPmDaBofWDRReA=;
        b=CehpinQs8l9bbQHZxBK/RUmXybkCgILJz+6wCLbXsuu3SsO/GnYxaMC2EOaKUlIwO6
         hGYpUg/WEUDeijIbsJikZesn6NtgKtn9r88kzHusO+ahduC0dcEvWG8uiJx+oHIa43IH
         IWWGro3PaAn0wW2mQjzQrU+U8+0CHapaIHGkhoRBquXoVmh2RZObNEwgzxUU1W9aP8jx
         zOAxoF0ZRxPqNJGDpxi3CZFYr17TwUjvfYclQOasGAEdK1uVnApNwaxgbKp8/8i4hbBi
         DWD6oj5i8XV3xDpKLyr5U4ybo3dtNeWwivqgGOnGi4Z5h+49a/y9g3Kh/WEigQ/s0n8L
         lugg==
X-Gm-Message-State: AOJu0Yx7uBfYlR9KhxPTghMpshICiaNW2GczSzpnMEVMt0uCSTHJBK/a
	I0TaxCS2Dl3h+5o3aIc77CqiBSLXpLbD/PzzA5flhQvmktmTSg==
X-Google-Smtp-Source: AGHT+IGrLIO+ZkFYBOtunrpaeB9wyzwf1UMnuZH5r4S/uhRc//B07IZsBQmiPZJn2VouW5J0Pj4Lmh+nBC6H+WSl32k=
X-Received: by 2002:a05:6871:e70c:b0:1d6:5b09:1584 with SMTP id
 qa12-20020a056871e70c00b001d65b091584mr1375096oac.5.1699427317726; Tue, 07
 Nov 2023 23:08:37 -0800 (PST)
MIME-Version: 1.0
References: <20231107152239.2219002-1-leon.anavi@konsulko.com> <20231107152239.2219002-2-leon.anavi@konsulko.com>
In-Reply-To: <20231107152239.2219002-2-leon.anavi@konsulko.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 7 Nov 2023 23:08:11 -0800
Message-ID: <CAMKF1sqvRNDFV7gi9Z1N_EeOJHX6MQJLxQYHpQ_DkV5b6D+c-A@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 2/3] qpdf: Update 10.6.3 -> 11.6.3
To: Leon Anavi <leon.anavi@konsulko.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Nov 2023 07:08:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106465

seeing this error

WARNING: qpdf-11.6.3-r0 do_package_qa: QA Issue: File
/usr/lib/cmake/qpdf/libqpdfTargets.cmake in package qpdf-dev contains
reference to TMPDIR [bu
ildpaths]
ERROR: qpdf-11.6.3-r0 do_package_qa: QA Issue:
/usr/lib/libqpdf.so.29.6.3 contained in package libqpdf requires
libgnutls.so.30(GNUTLS_3_4)(64bit),
 but no providers found in RDEPENDS:libqpdf? [file-rdeps]
ERROR: qpdf-11.6.3-r0 do_package_qa: QA Issue:
/usr/lib/libqpdf.so.29.6.3 contained in package libqpdf requires
libgnutls.so.30()(64bit), but no pr
oviders found in RDEPENDS:libqpdf? [file-rdeps]
ERROR: qpdf-11.6.3-r0 do_package_qa: Fatal QA errors were found, failing ta=
sk.
ERROR: Logfile of failure stored in:
/mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux/qpdf/11.6.3/temp/log.do=
_package_qa.3501227

On Tue, Nov 7, 2023 at 7:22=E2=80=AFAM Leon Anavi <leon.anavi@konsulko.com>=
 wrote:
>
> Update to version 11.6.3:
>
> - Fix a bug in which qpdf could potentially discard a character
>   in a binary string if that character was preceded by an octal
>   escaped string with fewer than three digits. This bug was
>   introduced in the 11.0.0 release. The bug would not apply to
>   content streams with default settings.
> - The linearization specification precludes linearized files that
>   require offets past the 4 GB mark. A bug in qpdf was preventing
>   it from working when offsets had to pass the 2 GB mark. This has
>   been corrected.
>
> Switch to cmake. Use /dev/random to perform encryption securely.
> Change the fully defined path on the target to about buildpaths
> QA issues with libqpdfTargets.cmake.
>
> This work was sponsored by GOVCERT.LU.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> ---
>  .../qpdf/{qpdf_10.6.3.bb =3D> qpdf_11.6.3.bb}         | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
>  rename meta-oe/recipes-printing/qpdf/{qpdf_10.6.3.bb =3D> qpdf_11.6.3.bb=
} (67%)
>
> diff --git a/meta-oe/recipes-printing/qpdf/qpdf_10.6.3.bb b/meta-oe/recip=
es-printing/qpdf/qpdf_11.6.3.bb
> similarity index 67%
> rename from meta-oe/recipes-printing/qpdf/qpdf_10.6.3.bb
> rename to meta-oe/recipes-printing/qpdf/qpdf_11.6.3.bb
> index fa33daf52..17a65acc6 100644
> --- a/meta-oe/recipes-printing/qpdf/qpdf_10.6.3.bb
> +++ b/meta-oe/recipes-printing/qpdf/qpdf_11.6.3.bb
> @@ -2,14 +2,14 @@ DESCRIPTION =3D "PDF transformation/inspection software=
"
>  HOMEPAGE =3D "http://qpdf.sourceforge.net"
>  LICENSE =3D "Artistic-2.0"
>  SECTION =3D "libs"
> -DEPENDS =3D "libpcre zlib libjpeg-turbo"
> +DEPENDS =3D "libpcre zlib libjpeg-turbo openssl"
>
>  SRC_URI =3D "${SOURCEFORGE_MIRROR}/qpdf/qpdf-${PV}.tar.gz"
> -SRC_URI[sha256sum] =3D "e8fc23b2a584ea68c963a897515d3eb3129186741dd19d13=
c86d31fa33493811"
> +SRC_URI[sha256sum] =3D "c394b1b0cff4cd9d13b0f5e16bdf3cf54da424dc434f9d40=
264b7fe67acd90bc"
>
>  LIC_FILES_CHKSUM =3D "file://Artistic-2.0;md5=3D7806296b9fae874361e6fb10=
072b7ee3"
>
> -inherit autotools-brokensep gettext
> +inherit cmake gettext
>
>  # disable random file detection for cross-compile
>  EXTRA_OECONF =3D "--without-random \
> @@ -17,11 +17,18 @@ EXTRA_OECONF =3D "--without-random \
>                  --disable-check-autofiles \
>                  "
>
> +EXTRA_OECMAKE =3D '-DRANDOM_DEVICE=3D"/dev/random"'
> +
>  LDFLAGS:append:mipsarch =3D " -latomic"
>  LDFLAGS:append:riscv32 =3D " -latomic"
>
>  S=3D"${WORKDIR}/${BPN}-${PV}"
>
> +do_install:append() {
> +    # Change the fully defined path on the target
> +    sed -i -e 's|${STAGING_LIBDIR}|${libdir}|g' ${D}${libdir}/cmake/${BP=
N}/libqpdfTargets.cmake
> +}
> +
>  # avoid Makefile returning error on 'make clean' before configure was ru=
n
>  CLEANBROKEN =3D "1"
>
> --
> 2.39.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#106455): https://lists.openembedded.org/g/openembedde=
d-devel/message/106455
> Mute This Topic: https://lists.openembedded.org/mt/102444518/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

