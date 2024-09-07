Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DFE5ECE571
	for <webhook@archiver.kernel.org>; Sat,  7 Sep 2024 20:48:40 +0000 (UTC)
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
 by mx.groups.io with SMTP id smtpd.web10.16688.1725742112838152397
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 07 Sep 2024 13:48:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QrMGkqSB;
 spf=pass (domain: gmail.com, ip: 209.85.161.46, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-5e1baf317c7so545865eaf.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 07 Sep 2024 13:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725742112; x=1726346912; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NwW2oeFCP781BXfJXDvonnzN2tN9MFeOBhEv5ibwLLI=;
        b=QrMGkqSB+hyX7wiKBnGvKionzNthcfU3YupAkK3NdD53IrwwmsqiQa3Jy2oXgcJifp
         czKeSll2qsF+G3Rr880XhQPTqoIW+X5KO266i4wBYXfnIwxs8uUfJD3TS4gttJUYgs2a
         xqy1aAZeYsagpWkTd3gcniUTRG6I+W7/G5uEtDYoug2SeYjN04vcJH1v/5ovvVSND5OE
         6u9rVcqJkt6/zgA+rEglMBGqdASpK6RmX9MFhZHthz8T5ZOn9tEJ04subE2PeLT1b4Tl
         S3pvHpfA+6lKqf8kk7SD7PmEKZ4ob+UrAmmmwxlpHGt7aI6+X2o0o6vPQjodIBZu8HYN
         KfFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725742112; x=1726346912;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NwW2oeFCP781BXfJXDvonnzN2tN9MFeOBhEv5ibwLLI=;
        b=T3J70Xrmiwf923OOP1OGCaFqwxIngOYLSlUHcQRtgWQZ7GG4rk9Pk++pdS/dPx8r9a
         Yf3CVQ7jbee/SfPPlzI5ahzqFOeBD4NwhctS5fO7IOiQPI/8PinK0yZEsw+YvB9mJQGG
         lLq0T6QTa+H99ImmiO+znmVh0hT/fVXzD9i/kMXxPFDsQjWthgtHhaUEFAP9xg5fvOhf
         Hk94WGTWNGSSqUIGc9zz0qF/QGEwOLpf/RI7r4EQFTRSBO+BhNnMkqdJ2tI1YF7kuS2J
         JjmCg+er3fVd4SGHvpwlrw82Sa3vqgg1TMri5mIKWFfNy4ZgwrKsMUbq3Cy3dNeVL1bX
         vHlA==
X-Gm-Message-State: AOJu0YzGcpR1n6CTGEPRhiMdHzt//0tivfkyEj8x0Pquc5Vec7Q+JTaY
	o54yU24lxJxBKD4KTZid+6B0EyGf55H3yO6hrBrtK5sRIz1JFIYARKGh4tTPEQdtpanPuSBDa/O
	PgP4c7A30gUg7c0Wk1bdFWu460HI=
X-Google-Smtp-Source: AGHT+IFr1t1bbWRca4zCF1NezuMREc+3w1tHroZiwAvrL1HYQtt4c45okIk85knmE8VV476EOIbWApt8qVatlM4W3LY=
X-Received: by 2002:a05:6820:430e:b0:5e1:c377:f5c2 with SMTP id
 006d021491bc7-5e1c377fa00mr1205791eaf.5.1725742111899; Sat, 07 Sep 2024
 13:48:31 -0700 (PDT)
MIME-Version: 1.0
References: <20240906184711.3654693-1-festevam@gmail.com>
In-Reply-To: <20240906184711.3654693-1-festevam@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 7 Sep 2024 13:48:06 -0700
Message-ID: <CAMKF1spUuXBtPQtPyx-3Mh3JXy_-RanRXjpotWB2k3agAi8Rdw@mail.gmail.com>
Subject: Re: [oe] [PATCH] imx-cst: Add recipe
To: festevam@gmail.com
Cc: openembedded-devel@lists.openembedded.org, otavio@ossystems.com.br, 
	Fabio Estevam <festevam@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 07 Sep 2024 20:48:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112121

On Fri, Sep 6, 2024 at 11:47=E2=80=AFAM Fabio Estevam via
lists.openembedded.org <festevam=3Dgmail.com@lists.openembedded.org>
wrote:
>
> From: Fabio Estevam <festevam@denx.de>
>
> Add a recipe for the i.MX CST (Code Signing Tool) version 3.4.0.
>

what's the rationale for proposing this to include in meta-oe ? is it
used for non-imx platforms ?

> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---
>  .../recipes-support/imx-cst/imx-cst_3.4.0.bb  | 39 +++++++++++++++++++
>  1 file changed, 39 insertions(+)
>  create mode 100644 meta-oe/recipes-support/imx-cst/imx-cst_3.4.0.bb
>
> diff --git a/meta-oe/recipes-support/imx-cst/imx-cst_3.4.0.bb b/meta-oe/r=
ecipes-support/imx-cst/imx-cst_3.4.0.bb
> new file mode 100644
> index 000000000..b558ce619
> --- /dev/null
> +++ b/meta-oe/recipes-support/imx-cst/imx-cst_3.4.0.bb
> @@ -0,0 +1,39 @@
> +SUMMARY =3D "i.MX code signing tool"
> +DESCRIPTION =3D "Code signing support that integrates the HABv4 and AHAB=
 library for i.MX processors"
> +LICENSE =3D "BSD-3-Clause & Apache-2.0"
> +
> +LIC_FILES_CHKSUM =3D "\
> +    file://LICENSE.bsd3;md5=3D14aba05f9fa6c25527297c8aac95fcf6 \
> +    file://LICENSE.hidapi;md5=3De0ea014f523f64f0adb13409055ee59e \
> +    file://LICENSE.openssl;md5=3D3441526b1df5cc01d812c7dfc218cea6 \
> +"
> +
> +DEPENDS =3D "byacc-native flex-native openssl"
> +
> +# debian: 3.4.0+dfsg-2
> +DEBIAN_PGK_NAME =3D "imx-code-signing-tool"
> +DEBIAN_PGK_VERSION =3D "${PV}+dfsg"
> +
> +SRC_URI =3D "\
> +    ${DEBIAN_MIRROR}/main/i/${DEBIAN_PGK_NAME}/${DEBIAN_PGK_NAME}_${DEBI=
AN_PGK_VERSION}.orig.tar.xz \
> +"
> +
> +SRC_URI[sha256sum] =3D "52ee3cee3bc500a42095f73c4584e223b4b9d2dfc1cd3e5d=
f965c5952eba8c8d"
> +
> +S =3D "${WORKDIR}/${DEBIAN_PGK_NAME}-${DEBIAN_PGK_VERSION}"
> +
> +EXTRA_OEMAKE =3D 'CC=3D"${CC}" LD=3D"${CC}" AR=3D"${AR}" OBJCOPY=3D"${OB=
JCOPY}"'
> +
> +do_compile() {
> +    oe_runmake -C code/obj.linux64 OSTYPE=3Dlinux64 ENCRYPTION=3Dyes COP=
TIONS=3D"${CFLAGS} ${CPPFLAGS}" LDOPTIONS=3D"${LDFLAGS}"
> +    oe_runmake -C add-ons/hab_csf_parser COPTS=3D"${CFLAGS} ${CPPFLAGS} =
${LDFLAGS}"
> +}
> +
> +do_install () {
> +    install -d ${D}${bindir}
> +    install -m 755 ${S}/code/obj.linux64/cst ${D}${bindir}/
> +    install -m 755 ${S}/code/obj.linux64/srktool ${D}${bindir}
> +    install -m 755 ${S}/add-ons/hab_csf_parser/csf_parser ${D}${bindir}
> +}
> +
> +BBCLASSEXTEND =3D "native nativesdk"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#112110): https://lists.openembedded.org/g/openembedde=
d-devel/message/112110
> Mute This Topic: https://lists.openembedded.org/mt/108310763/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

