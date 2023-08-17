Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C796C3065A
	for <webhook@archiver.kernel.org>; Thu, 17 Aug 2023 15:35:46 +0000 (UTC)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
 by mx.groups.io with SMTP id smtpd.web11.27.1692286540803658912
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Aug 2023 08:35:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=WZ0vL/M4;
 spf=pass (domain: gmail.com, ip: 209.85.167.173, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3a7556e4edcso576165b6e.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 17 Aug 2023 08:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692286540; x=1692891340;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E3GBvbqlizFTcFRpd6815lVHFcRj4eW8efKiruW1LSM=;
        b=WZ0vL/M42IlrkJPxao297mYm3ITQ9QcmGpTTbC+4Ol10IRjJigStDsW+81trzsCVDL
         mf9Nb07OfkiwTiu4hAwnQ+PZER9pdu7zYaKTGbngmikkAvD0TEWHkl9AVpwLnFbQTZGa
         e+swmkQ6mqZBv81xg2+yC7U1DurYtuu62a8zLO8DYGaT9SRAwi1KiloBvvuIUBTM8KRn
         K9fqhfm/Utkx/MPnpzk1P4yREXxxQWecIu8WKyMqkZ/FWe/qap/L1UYmvk7t0VMwnMeR
         WhDhdarrW0fgmbslryGxjAfI2iPbwBtjC0oMfPGgnfgY+CCK1WyXT+DGk6Czp2R/63xO
         1E2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692286540; x=1692891340;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E3GBvbqlizFTcFRpd6815lVHFcRj4eW8efKiruW1LSM=;
        b=UrmSdsYc8FzpM11i/kReIvd291SWiIRvAkfgJxK3eo/39B2ZVTPErai0x4C1hKAMqp
         0pcEhGICzu4otjotr17Fg0FUFro/yiqrW9xfVXnGPMrBJbmzUnDBtH7hmRXCpYDt0QOw
         6hAzbtbER8tDxYDifF3xVE15v+HGSUufJi1/TZ3pX0reJ2Ad4rxoFZh7+7Ku12Lby6ql
         i+POG8ZIPMcJYR7jgXmHU0Lbm/uBYLoKYusNRJAmdk5NlwiD0rGoOaQA2dE9anFA5+my
         YA10QUgUE8NUafk0jEsigiyZuR/f3LxzV3moVL3VJb7jyZXR7AHNgZr5fx6MUl2wGXTd
         oKew==
X-Gm-Message-State: AOJu0YwbU8Ou6Qv49dLWNCV1rrnbVIihUaRwmLFGqzGN/FC1VTXjwgfE
	GzlXmUGkzFsdqYZlhQLPEPVWl1cV1sxdqXyqZ0rU8uHwgPo=
X-Google-Smtp-Source: AGHT+IE7lLNKbymW4AeGVbAODC95AudN31pbJTQ8qtQtfBkXd/ym/rN3auXCaU9e4DTqJgDcAVAAQBblmZYaHP8E9mw=
X-Received: by 2002:a05:6808:f09:b0:3a7:4cf0:10c with SMTP id
 m9-20020a0568080f0900b003a74cf0010cmr2201489oiw.6.1692286540009; Thu, 17 Aug
 2023 08:35:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230816083418.1397949-1-pawel.langowski@3mdeb.com>
In-Reply-To: <20230816083418.1397949-1-pawel.langowski@3mdeb.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 17 Aug 2023 08:35:14 -0700
Message-ID: <CAMKF1sqxCm3gyJG+Y5rQxYbXdkCuHRQO4Bpb5Trg5HH=R+GBCg@mail.gmail.com>
Subject: Re: [oe] [PATCH] recipes-extended: add qcbor recipe
To: Pawel Langowski <pawel.langowski@3mdeb.com>
Cc: openembedded-devel@lists.openembedded.org, piotr.krol@3mdeb.com, 
	tomasz.zyjewski@3mdeb.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Aug 2023 15:35:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104468

sign-off-by is missing and subject/summary line of commit is still
same. Please rework.

On Thu, Aug 17, 2023 at 5:04=E2=80=AFAM Pawel Langowski
<pawel.langowski@3mdeb.com> wrote:
>
> ---
>  meta-oe/recipes-extended/qcbor/qcbor_git.bb | 32 +++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 meta-oe/recipes-extended/qcbor/qcbor_git.bb
>
> diff --git a/meta-oe/recipes-extended/qcbor/qcbor_git.bb b/meta-oe/recipe=
s-extended/qcbor/qcbor_git.bb
> new file mode 100644
> index 000000000000..6e87458c3a3e
> --- /dev/null
> +++ b/meta-oe/recipes-extended/qcbor/qcbor_git.bb
> @@ -0,0 +1,32 @@
> +DESCRIPTION =3D " \
> +    QCBOR is a powerful, commercial-quality CBOR encoder/decoder that \
> +    implements these RFCs: RFC8949, RFC7049, RFC8742, RFC8943 \
> +"
> +
> +HOMEPAGE =3D "https://github.com/laurencelundblade/QCBOR"
> +
> +LICENSE =3D "BSD-3-Clause"
> +LIC_FILES_CHKSUM =3D "file://README.md;beginline=3D442;endline=3D463;md5=
=3Db55643261d6d221dac2b7a395105af62"
> +
> +SRC_URI =3D "git://github.com/laurencelundblade/QCBOR;protocol=3Dhttps;b=
ranch=3Dmaster"
> +
> +SRCREV =3D "44754f738c6534a4304a83d4c6e97b3d3193d887"
> +
> +S =3D "${WORKDIR}/git"
> +
> +INSANE_SKIP:${PN}-dev +=3D "ldflags"
> +
> +inherit pkgconfig
> +
> +CFLAGS +=3D " \
> +    -DUSEFULBUF_DISABLE_ALL_FLOAT \
> +"
> +
> +do_install(){
> +    install -d ${D}${libdir}
> +    install -m 755 ${S}/libqcbor.a ${D}${libdir}/
> +    install -d ${D}${includedir}/qcbor
> +    install -m 644 ${S}/inc/*.h ${D}${includedir}
> +    install -m 644 ${S}/inc/qcbor/*.h ${D}${includedir}/qcbor
> +}
> +
> --
> 2.41.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#104460): https://lists.openembedded.org/g/openembedde=
d-devel/message/104460
> Mute This Topic: https://lists.openembedded.org/mt/100783405/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

