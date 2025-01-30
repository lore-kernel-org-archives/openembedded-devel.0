Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1566C0218A
	for <webhook@archiver.kernel.org>; Thu, 30 Jan 2025 06:03:07 +0000 (UTC)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
 by mx.groups.io with SMTP id smtpd.web10.9995.1738216982220193599
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Jan 2025 22:03:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=d7EqzPds;
 spf=pass (domain: gmail.com, ip: 209.85.160.48, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-2b22c2f5103so195514fac.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 29 Jan 2025 22:03:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738216981; x=1738821781; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xj29bpo6YKIfGew7IB+glnBaZWEabPg9eKISVeFS9YI=;
        b=d7EqzPdsLjZI+tMe0BSJi24Hwy24Bq7LduuMK+wqSTNHliWkzhRxPqgtiVU368ogni
         SdVjKRlD5MnPk76dRe3aOptwNunnp4/71hYiaMrFmrUMUOHe5hovnH6VdfeMPmk92Fje
         15WcH/ejZk6vPAiljbghmWDInHy69ilggv6MZ4qyhqjzAQpcWCzLLa8al66rkAUPlEBl
         hubRJcU0tOBXPQm3uyNxAdFzL6kwePyudwBE6je+0w9HKlUmIkBGlmz8XSoSBz7WjjVH
         qAIXCfhidpa4jtvZwDjioeOJ1bq1hdCorKtC/TDEcgrIPTXu/tNpRD8j4yUddddMB64m
         XxpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738216981; x=1738821781;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xj29bpo6YKIfGew7IB+glnBaZWEabPg9eKISVeFS9YI=;
        b=eLzCEp+Zy0a6/PoPnRcbyF6NLZX783O0KYDocLmSeK/lgHkbbUTivKK5LxSteGY0wm
         qcDveSlu0pGEq3uuFCwkmDmnaFSqxbJdAzkBCkvXzKJ6Fk20/NcheFRKBX3pywk1sKfq
         hFsUJvfYrAgaqGKEuOKJxO9eNmCxfX9XGzjGIb6zLzoLeKg66Dglh7olDX1Ry550t5lo
         X15zzGCcINAg5vs8Mfepp0IfJp0UDarr77EfxQxl4jDdaVWbU1hHscwama39qoE9dw8J
         GcnKhwhDv5vnh5FBfqpVTjaw2VIRi7el3SWGoV/3/egGhAhpv5HCCi1v8iVDgEAVDTAu
         fDOw==
X-Gm-Message-State: AOJu0YzjPTrion/LLFx8JgqeGJq336L9misGhM9rfyvjCD0sK9o4YVik
	QhaHQc+q5vYfz5Aehi5owvZucu/PqK0Ax+8/6XPtCamhD07MuRSbOoFldShI7+YvDaEGRfqn191
	zk+Pq4KuaAxmHb/cCcpp3R5lOL+g=
X-Gm-Gg: ASbGncuRmVVw+XFhHMyQOzUWQEkLQ+cszGrlSUY/x4bwYwM4EbFd7yhzvi61ZCjzAqq
	ZfbDpHCBDLmNzMvzWDe+ikjMSIuAfAibsbYEJjj1vXcbr4DuhJhiPpnsPFI8Cqq/mMVVJti+x
X-Google-Smtp-Source: AGHT+IE5J7l1BefFjlzzvMHHypFouLukDhlOMBDfynY5w3goVioFSn2wdhPhCb36G60somZxGSgposGOdSA/k4ggfEM=
X-Received: by 2002:a05:6871:a6a1:b0:29d:c764:f873 with SMTP id
 586e51a60fabf-2b32f368b7cmr3430932fac.31.1738216981469; Wed, 29 Jan 2025
 22:03:01 -0800 (PST)
MIME-Version: 1.0
References: <20250130053941.1680181-1-alistair.francis@wdc.com>
In-Reply-To: <20250130053941.1680181-1-alistair.francis@wdc.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 29 Jan 2025 22:02:35 -0800
X-Gm-Features: AWEUYZl8vCgc8JHIcRrzHpFNuAL778hxdNRCfUvGlaBDEJQlkIgHDPe8eO3mB8A
Message-ID: <CAMKF1spkeZ07CJ4sB1gLzhHe4FfbkzoC5HAX33PK3BFP_yCdtQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v2] meta-oe: libspdm: Initial support for libspdm
To: alistair23@gmail.com
Cc: openembedded-devel@lists.openembedded.org, 
	Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Jan 2025 06:03:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115148

On Wed, Jan 29, 2025 at 9:39=E2=80=AFPM Alistair Francis via
lists.openembedded.org <alistair23=3Dgmail.com@lists.openembedded.org>
wrote:
>
> libspdm is DMTF's Reference Implementation of SPDM, it's a library that
> can be used to implement a SPDM requester or responder in userspace.
>
> This patch adds support for building libspdm, which can then be used to
> build applications depending on libspdm.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  .../recipes-support/libspdm/libspdm_3.6.0.bb  | 72 +++++++++++++++++++
>  1 file changed, 72 insertions(+)
>  create mode 100644 meta-oe/recipes-support/libspdm/libspdm_3.6.0.bb
>
> diff --git a/meta-oe/recipes-support/libspdm/libspdm_3.6.0.bb b/meta-oe/r=
ecipes-support/libspdm/libspdm_3.6.0.bb
> new file mode 100644
> index 0000000000..5f51730d12
> --- /dev/null
> +++ b/meta-oe/recipes-support/libspdm/libspdm_3.6.0.bb
> @@ -0,0 +1,72 @@
> +SUMMARY =3D "DMTF's Reference Implementation of SPDM"
> +DESCRIPTION =3D "libspdm is a reference implementation of the DMTF=E2=80=
=99s Security Protocols and \
> +Data Models (SPDM). This is used to enable authentication, attestation a=
nd key exchange to \
> +assist in providing infrastructure security enablement"
> +HOMEPAGE =3D "https://github.com/DMTF/libspdm"
> +BUGTRACKER =3D "https://github.com/DMTF/libspdm/issues"
> +LICENSE =3D "BSD-3-Clause"
> +LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3D8f9b59a81a88da8e812af43728=
b72dd7"
> +
> +DEPENDS =3D "openssl"
> +
> +SRC_URI =3D "git://github.com/DMTF/libspdm.git;branch=3Dmain;protocol=3D=
https"
> +SRCREV =3D "5ebe5e3946b9439928fa3a7548268c29cccc1b16"
> +
> +S =3D "${WORKDIR}/git"
> +
> +inherit cmake
> +
> +LIBSPDM_CFLAGS =3D "\
> +       ${TARGET_CFLAGS} \
> +       -DLIBSPDM_ENABLE_CAPABILITY_EVENT_CAP=3D0 \
> +       -DLIBSPDM_ENABLE_CAPABILITY_MEL_CAP=3D0 \
> +       -DLIBSPDM_ENABLE_CAPABILITY_GET_KEY_PAIR_INFO_CAP=3D0 \
> +       -DLIBSPDM_ENABLE_CAPABILITY_SET_KEY_PAIR_INFO_CAP=3D0 \
> +       -DLIBSPDM_HAL_PASS_SPDM_CONTEXT=3D1 \
> +       "
> +
> +def get_spdm_multiarch(bb, d):
> +    target_arch =3D d.getVar('TARGET_ARCH')
> +    multiarch_options =3D {
> +        "x86_64":  "x64",
> +        "i586":    "ia32",
> +        "i686":    "ia32",
> +        "arm":     "arm",
> +        "aarch64": "aarch64",
> +        "riscv32": "riscv32",
> +        "riscv64": "riscv64",
> +    }

I guess we need to set COMPATIBLE_HOST to null for ppc and mips so
keep world builds happy.

> +
> +    if target_arch in multiarch_options :
> +        return multiarch_options[target_arch]
> +
> +    bb.error("unsupported architecture '%s'" % target_arch)
> +
> +EXTRA_OECMAKE +=3D "\
> +    -DARCH=3D${@get_spdm_multiarch(bb, d)} \
> +       -DTOOLCHAIN=3DNONE \
> +       -DTARGET=3DRelease \
> +       -DCRYPTO=3Dopenssl \
> +       -DENABLE_BINARY_BUILD=3D1 \
> +       -DCOMPILED_LIBCRYPTO_PATH=3D${libdir} \
> +       -DCOMPILED_LIBSSL_PATH=3D${libdir} \
> +       -DDISABLE_TESTS=3D1 \
> +       -DDISABLE_EDDSA=3D1 \
> +       "
> +
> +do_install () {
> +    install -d ${D}/${libdir}
> +    install -m 0644 lib/* ${D}/${libdir}/
> +
> +    install -d ${D}/${includedir}/${BPN}/
> +    cp -rf ${S}/include/* ${D}/${includedir}/${BPN}/
> +
> +    install -d ${D}/${includedir}/${BPN}/os_stub/spdm_crypt_ext_lib
> +    cp -rf ${S}/os_stub/spdm_crypt_ext_lib/*.h ${D}/${includedir}/${BPN}=
/os_stub/spdm_crypt_ext_lib/
> +}
> +
> +FILES:${PN} +=3D "${libdir}/*.a"
> +FILES:${PN} +=3D "${includedir}/${BPN}/*.h"
> +FILES:${PN} +=3D "${includedir}/${BPN}/os_stub/spdm_crypt_ext_lib/*.h"
> +
> +BBCLASSEXTEND =3D "native nativesdk"
> --
> 2.47.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#115147): https://lists.openembedded.org/g/openembedde=
d-devel/message/115147
> Mute This Topic: https://lists.openembedded.org/mt/110892822/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

