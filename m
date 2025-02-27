Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C0E2C197BF
	for <webhook@archiver.kernel.org>; Thu, 27 Feb 2025 20:15:52 +0000 (UTC)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
 by mx.groups.io with SMTP id smtpd.web11.20705.1740687344273194196
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Feb 2025 12:15:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Zr5nDp4f;
 spf=pass (domain: gmail.com, ip: 209.85.167.181, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3f556b90790so156274b6e.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 27 Feb 2025 12:15:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740687343; x=1741292143; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9XbaLmMtmPaR6Q7IOHT57FsMNeOQLrgP/pIcYBZ8ukY=;
        b=Zr5nDp4fdegY5IROHxMeZDq4qHPsNdWhD79hSHIg3ju4ydSfuKC+80dQmph208LQhi
         elhQzXBwvOKP0Ct3hvGcAs2Ishdfoi+DySgVP02ZLn/oA3pgQ+a9A+3hvn9RVaLyRUzt
         1reVByvz0lVav+BubPWsadFLcj28T2OnWRv/hwbatEBxlitbXZSbheYQxICyhsGd78XZ
         ZyTX/4O3P80maHuhhtDFnMiMYazC6aAcveEuebMQfsFa8Gu5mYDAb8bN9uW5h+P+939C
         hD/pvU+zxmUwmgwKc6iIJVJBC8pGDQBcguHz9Bt69SxlqrZ4lNznM0k/ZkPyJyqO73qM
         2Zsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740687343; x=1741292143;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9XbaLmMtmPaR6Q7IOHT57FsMNeOQLrgP/pIcYBZ8ukY=;
        b=EilWPDbn20GpYgFT2UgwJ5/IXrc5mvOkIwAKmrSynNhvQjbZFTL3eY+U7Vf0PhZGdi
         ai89Y2WzyS8TgQ/hiNvuE00Xoc7R8qMdKAZR2QieKLEyX6ck5arAZYSbciX5IcJJVTwp
         J4ZDomkxBVjDM+fFYPEqXo/9H1XtKOKLoZZCjOTz8G1z6jozggPTGFKC5FFAj7oki8T2
         wu+HmW154DGTE+DhWEb1ETiOB6mx/wFXvC/+nMCV5L2fNMsN/jnFmYlDYXVqaJUkSm/2
         CCZvcIbpnkil97mfVwD79Yim9QSjou8MmDY8NfrIbrPQ1b1QlQfMHX9CQUj37jlp+bCa
         iBRQ==
X-Gm-Message-State: AOJu0YyXueaV/u257sgwZIC1pGFPISIeAeOzmxS9I2nbYXNc5sBZZm64
	2wFBdl+PIeZVRgngSxkdbM9dd8T8HmVZ54pb+yeJ9UP2hVkSiNbw162+qI5n0j41mrCk2mvjtLd
	VmbGf6VStb7mZpzQS1LFPI4ifv2dHzbUM
X-Gm-Gg: ASbGncuhZ62EP2Ll0olhT0tYHzp7/5yHsuuEnd58dWRUrKWzsnqTRxLzhEiwj8QoMKp
	tTHl6nAMGC+GoGjBc4M1XoCHzrxmFn8FvQzlAR9X91me5Z7JP7Uxj4M3t233HcQfE55J8DtgFoD
	WGp7bmk66no63Qh1OSuzxcq/OKgN7idFm/6RXR
X-Google-Smtp-Source: AGHT+IFepXRxCf8cfVyeJWONH4KSh6aBSoHvz6ue6fTyoX4iIUatzqn+8JZWvycmkPBje9IAD9VpMNBUdDpjvY3W1/c=
X-Received: by 2002:a05:6808:11c7:b0:3f4:af3:74c0 with SMTP id
 5614622812f47-3f5585e80dcmr431139b6e.29.1740687343433; Thu, 27 Feb 2025
 12:15:43 -0800 (PST)
MIME-Version: 1.0
References: <20250227183238.1909597-1-skandigraun@gmail.com>
 <CAMKF1sry2Eb4EGJi4hU6OJxgiA2yzkrFrJxnqHf9dp+UH5qzrA@mail.gmail.com> <ba566c7e-9bdc-4e5e-8891-cb096a703daa@gmail.com>
In-Reply-To: <ba566c7e-9bdc-4e5e-8891-cb096a703daa@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 27 Feb 2025 12:15:17 -0800
X-Gm-Features: AQ5f1JrvuOOYvx0GPdcR1Gx9MXo-HbHL9A_J8EBdW-My_tMXlL921UqTit0At70
Message-ID: <CAMKF1sr5L6qjCbr7RZj-UCDqKTUy8=x1PwkHg+yuG+i-78V6=Q@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v3] thin-provisioning-tools: add target and
 sysroot to bindgen flags
To: Gyorgy Sarvari <skandigraun@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Feb 2025 20:15:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115703

On Thu, Feb 27, 2025 at 12:08=E2=80=AFPM Gyorgy Sarvari <skandigraun@gmail.=
com> wrote:
>
>
> On 27.02.25 21:02, Khem Raj wrote:
> > On Thu, Feb 27, 2025 at 10:32=E2=80=AFAM Gyorgy Sarvari via
> > lists.openembedded.org <skandigraun=3Dgmail.com@lists.openembedded.org>
> > wrote:
> >> BUILD_CFLAGS doesn't contain information about the recipe sysroot nor =
about the target
> >> system - and in case these are not specified for bindgen, then it buil=
ds against
> >> the build system's headers, using the build system's arch.
> >>
> >> Instead of BUILD_CFLAGS pass HOST_CC_ARCH and TOOLCHAIN_OPTIONS, which=
 contain the sysroot
> >> and the requred cross-compiling flags, beside passing the target flag =
also.
> >>
> >> Fixes the following do_compile error:
> >>
> >> |   /usr/include/linux/types.h:5:10: fatal error: 'asm/types.h' file n=
ot found
> >> |   thread 'main' panicked at /yocto/sandbox/build/tmp/work/cortexa72-=
poky-linux/thin-provisioning-tools/1.1.0/sources-unpack/cargo_home/bitbake/=
devicemapper-sys-0.3.0/build.rs:24:10:
> >> |   Could not generate dm.h bindings: ClangDiagnostic("/usr/include/li=
nux/types.h:5:10: fatal error: 'asm/types.h' file not found\n")
> >>
> >> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> >> ---
> >>  .../thin-provisioning-tools/thin-provisioning-tools_1.1.0.bb    | 2 +=
-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/meta-oe/dynamic-layers/clang-layer/recipes-support/thin-p=
rovisioning-tools/thin-provisioning-tools_1.1.0.bb b/meta-oe/dynamic-layers=
/clang-layer/recipes-support/thin-provisioning-tools/thin-provisioning-tool=
s_1.1.0.bb
> >> index bb4b53c28b..d0241c7016 100644
> >> --- a/meta-oe/dynamic-layers/clang-layer/recipes-support/thin-provisio=
ning-tools/thin-provisioning-tools_1.1.0.bb
> >> +++ b/meta-oe/dynamic-layers/clang-layer/recipes-support/thin-provisio=
ning-tools/thin-provisioning-tools_1.1.0.bb
> >> @@ -21,7 +21,7 @@ inherit pkgconfig
> >>  DEPENDS +=3D "udev libdevmapper libdevmapper-native clang-native"
> >>
> >>  export LIBCLANG_PATH =3D "${WORKDIR}/recipe-sysroot-native${libdir}"
> >> -export BINDGEN_EXTRA_CLANG_ARGS =3D "${BUILD_CFLAGS}"
> >> +export BINDGEN_EXTRA_CLANG_ARGS =3D "${HOST_CC_ARCH}${TOOLCHAIN_OPTIO=
NS} --target=3D${TARGET_SYS}"
> >>
> > we do not need -target anymore its part of HOST_CCARCH
>
> It is not:
>
> $ bitbake -e thin-provisioning-tools | grep ^HOST_CC_ARCH
> HOST_CC_ARCH=3D" -mcpu=3Dcortex-a72+crc -mbranch-protection=3Dstandard
> -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-
> security -Werror=3Dformat-security"
>
> If I remove it, it gets unhappy:
>
> |   error: unsupported option '-mcpu=3D' for target 'x86_64-unknown-linux=
-gnu'
> |   error: unsupported option '-mbranch-protection=3D' for target
> 'x86_64-unknown-linux-gnu'
> (etc..)
>

Yeah, I see when clang is used at default compiler then its added but
for gcc defaults it is not. I will take v3

>
> >
> >>  require ${BPN}-crates.inc
> >>  require ${BPN}-git-crates.inc
> >>
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#115699): https://lists.openembedded.org/g/openembe=
dded-devel/message/115699
> >> Mute This Topic: https://lists.openembedded.org/mt/111420486/1997914
> >> Group Owner: openembedded-devel+owner@lists.openembedded.org
> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub=
 [raj.khem@gmail.com]
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>

