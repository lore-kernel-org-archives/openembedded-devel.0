Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C620C197BF
	for <webhook@archiver.kernel.org>; Thu, 27 Feb 2025 20:02:42 +0000 (UTC)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
 by mx.groups.io with SMTP id smtpd.web11.20494.1740686552139545247
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Feb 2025 12:02:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gyHBl/iG;
 spf=pass (domain: gmail.com, ip: 209.85.167.169, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3f40b12520eso914073b6e.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 27 Feb 2025 12:02:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740686551; x=1741291351; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SuxTp/zktLXlGeHsXqqwXNY3cn0pdw7VoKM8C8Rht/4=;
        b=gyHBl/iGlePjxjGWXhHGXE/vaEavu9M/jhkO7I94uLvn7iSdaxRxXYGJvYQSNZxVg1
         aqNsqrVzTBrc6iP+pXGxQ88aJmYjDedjix9gRAUrHq1Pob8v79Ck2SyC8m1gXgr/1YHT
         FM4m3QRN66H4GHeZqoLnTZF5LuHjGg7XjHNPCPHlF1khxDy1JBCgauyWqVYZSvCcwrU3
         F6OhFwKdcFu4XCA6pDNV+LR/sC758e5H5KQ4U2mwxG3PEwzRq8TdPTlFsQMe9W848y7M
         pTRn4U2OvM6ASt5MlaQI0zDJ0Ja1EinLf0c5lMGRpYYkAZWsNijPLj8DcXudHsgDJ558
         NQwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740686551; x=1741291351;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SuxTp/zktLXlGeHsXqqwXNY3cn0pdw7VoKM8C8Rht/4=;
        b=GSwGAMoik8nt/Pe52TXCdfhvf3YSsfi+VeIj2P8A9oZ9+WPQEP7/BqKoRu2bQbT60U
         fhiLrr+lFrOSotx5dyz6Ba2pVfs3gGzNJtSmnq/5DEzD7us6FFGTbAxdE0afqcBd04gY
         sGcK+HDwI93gNfLYrt8hgLT/TmXU7yvdMRCVT91YeqsRbUXUX+SqIxwWDJ345VkiFQER
         BI+cdcfhHrC0BodJdM+T4buSkGcsBjggvQ81lUVvW5Qp1c7PIPDOEmn+XDF4Dl6q8gCQ
         JcCAtNprBEpWAo383A8R9ApCWZBjBwrRXZBCBhdWHEpLlEEwf2yxatK2+Y8GK77wmC/A
         5DZA==
X-Gm-Message-State: AOJu0YzaS/k9PkthLLc2+WNrsPCaGJoFqDnNkeTDPZnyt7vGIdArVZ+/
	nXXgEN0DSd3k/S/SwzMqahziqc1a7zE6FomUZ1FumcO13hV84NEghIzlsoYg17E2mV+IB2LL/tq
	9RoqvTZyEPoyEZY4GaUDBWTDdIL0=
X-Gm-Gg: ASbGnctu9gjcugWkqA3lAOtxu8ggnci59yL0gv1N+3wv9/oSzOJVVhi4BvM9BY+fBS5
	8h6SyqkFxrh4399Sbx+RK4khCzX4Q4HrlKs9AG4ec3X/aDTxrbHysDAEPY+14ysP4WThmnrBwP3
	ZsAmDDN+pbkBPzoJuHo2z+NB40QBWTu4jipnbB
X-Google-Smtp-Source: AGHT+IGA/uC38i0FGxs9ruU8+o8aTupizb+oZ+fol2UnkdUy9xIcTCP6LDVkkdW9RbOohRpsi34bHuoBNftCvWPAjrE=
X-Received: by 2002:a05:6808:1388:b0:3f4:2290:5a66 with SMTP id
 5614622812f47-3f55850065dmr442236b6e.4.1740686551368; Thu, 27 Feb 2025
 12:02:31 -0800 (PST)
MIME-Version: 1.0
References: <20250227183238.1909597-1-skandigraun@gmail.com>
In-Reply-To: <20250227183238.1909597-1-skandigraun@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 27 Feb 2025 12:02:03 -0800
X-Gm-Features: AQ5f1Jofm0JoCh2MUL__GmcyQBtCVHXKKzC5mfkjPqWgQByB2vMVSZmDMMXBQ6o
Message-ID: <CAMKF1sry2Eb4EGJi4hU6OJxgiA2yzkrFrJxnqHf9dp+UH5qzrA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v3] thin-provisioning-tools: add target and
 sysroot to bindgen flags
To: skandigraun@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Feb 2025 20:02:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115701

On Thu, Feb 27, 2025 at 10:32=E2=80=AFAM Gyorgy Sarvari via
lists.openembedded.org <skandigraun=3Dgmail.com@lists.openembedded.org>
wrote:
>
> BUILD_CFLAGS doesn't contain information about the recipe sysroot nor abo=
ut the target
> system - and in case these are not specified for bindgen, then it builds =
against
> the build system's headers, using the build system's arch.
>
> Instead of BUILD_CFLAGS pass HOST_CC_ARCH and TOOLCHAIN_OPTIONS, which co=
ntain the sysroot
> and the requred cross-compiling flags, beside passing the target flag als=
o.
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
> index bb4b53c28b..d0241c7016 100644
> --- a/meta-oe/dynamic-layers/clang-layer/recipes-support/thin-provisionin=
g-tools/thin-provisioning-tools_1.1.0.bb
> +++ b/meta-oe/dynamic-layers/clang-layer/recipes-support/thin-provisionin=
g-tools/thin-provisioning-tools_1.1.0.bb
> @@ -21,7 +21,7 @@ inherit pkgconfig
>  DEPENDS +=3D "udev libdevmapper libdevmapper-native clang-native"
>
>  export LIBCLANG_PATH =3D "${WORKDIR}/recipe-sysroot-native${libdir}"
> -export BINDGEN_EXTRA_CLANG_ARGS =3D "${BUILD_CFLAGS}"
> +export BINDGEN_EXTRA_CLANG_ARGS =3D "${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}=
 --target=3D${TARGET_SYS}"
>

we do not need -target anymore its part of HOST_CCARCH

>  require ${BPN}-crates.inc
>  require ${BPN}-git-crates.inc
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#115699): https://lists.openembedded.org/g/openembedde=
d-devel/message/115699
> Mute This Topic: https://lists.openembedded.org/mt/111420486/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

