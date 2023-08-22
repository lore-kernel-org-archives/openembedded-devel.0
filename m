Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 139CBEE4996
	for <webhook@archiver.kernel.org>; Tue, 22 Aug 2023 15:20:19 +0000 (UTC)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
 by mx.groups.io with SMTP id smtpd.web11.10771.1692717615286465526
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Aug 2023 08:20:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=HEddq0W+;
 spf=pass (domain: gmail.com, ip: 209.85.222.48, mailfrom: raj.khem@gmail.com)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-79aa1f24ba2so1535296241.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 22 Aug 2023 08:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692717614; x=1693322414;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d7YCfHdl2nVk5gjsNLW14z6LCbIsKB7APfesHa3v2ao=;
        b=HEddq0W+0tpiLf+sIpa7gHfsi8Aljbu1baLsct5xctl4xjsKnFGG0I0dGteUDfxoa9
         Qs3//pQpYnTZvKTXNj1h7+2OX/V2MzT2VvKPHuvdFDhNasDNnjyoKodPKkLkOVTaOn11
         ty+k+oLS78360UTiFbdggj2mlYebqMgGdJ+cLKeHEVf6SpWjm3PCaZx3uzNTVuwXBVQF
         kyVoxkMq2klSdD4zOS9E5Kd8renJquOQHCUl27pft1YB7Ny7SSidNxsa6zJaX9/afX38
         5AhkOdX6hPqToF93EXrkWBwwmOuwrxRSznxyivkPnqMrJ+jF+/xjPutoVB5fmQtO34FV
         5sNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692717614; x=1693322414;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d7YCfHdl2nVk5gjsNLW14z6LCbIsKB7APfesHa3v2ao=;
        b=Wi7FqeYi6y9Yj8RsfYJfqNyO1EvxGb/uQ0YyDwNxH8THpT6uoyYpsHJlYzCRlhEryZ
         ivY8jva1GEYHXgdbnGXYFvAo3RNfqizgTc6WcWL6juzMi0hm3ExtxMCE9yQz1luEAq6Y
         EN8eXk9FkH1KP3Qe6xdMzdxn/ojg9XXv7L/9+QmucJBAQZuQgfGnDgGJq4QJ3kJlMu7L
         bMnHfIFIuy0T1kQu6lz6vK+/MPvuuw7bYPNOI/BI+n4AQdHTsHmaAhejXK/bc2pmn/IK
         Jh4JrTGYU3ZMfdFZmoqCwHUV7BfSt4is2OqNdOIcWCxcI0cHUiMRkzIvos/aV+mV6hWD
         I+zg==
X-Gm-Message-State: AOJu0YwDFKwrU0rtvCOCAEcAVcQM63Ro5Y7RrQ0Zpi4nnP4ZzKNVKxvG
	qhZVknQA7/EhQfTtooXgyzaQX1FqEHXok0XMSx4=
X-Google-Smtp-Source: AGHT+IG6qGc7WJcjIjtonDtAMJl/AnSHWU+GptU/taU0bip0I740pyqiKAkDlxKhCIbmf0DNrdKYi+z/LwxVvBfKN3M=
X-Received: by 2002:a67:fd46:0:b0:44d:482a:5444 with SMTP id
 g6-20020a67fd46000000b0044d482a5444mr5458001vsr.21.1692717614121; Tue, 22 Aug
 2023 08:20:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230822063213.10060-1-pawel.langowski@3mdeb.com>
In-Reply-To: <20230822063213.10060-1-pawel.langowski@3mdeb.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 22 Aug 2023 08:19:47 -0700
Message-ID: <CAMKF1spqMuFKvYWTe9uyVXqWzhe8Xk-o_kvBZA7NKQRGWDrmcw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v3] qcbor: add recipe
To: Pawel Langowski <pawel.langowski@3mdeb.com>
Cc: openembedded-devel@lists.openembedded.org, piotr.krol@3mdeb.com, 
	tomasz.zyjewski@3mdeb.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Aug 2023 15:20:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104518

On Mon, Aug 21, 2023 at 11:32=E2=80=AFPM Pawel Langowski
<pawel.langowski@3mdeb.com> wrote:
>
> This adds QCBOR - a CBOR encoder/decoder library
>

looking at https://github.com/laurencelundblade/QCBOR/releases
there has been few releases so I think  this recipe should reflect that via=
 PV

set PV =3D "1.2+git${SRCPV}"

> Signed-off-by: Pawel Langowski <pawel.langowski@3mdeb.com>
> ---
>  meta-oe/recipes-extended/qcbor/qcbor_git.bb | 30 +++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>  create mode 100644 meta-oe/recipes-extended/qcbor/qcbor_git.bb
>
> diff --git a/meta-oe/recipes-extended/qcbor/qcbor_git.bb b/meta-oe/recipe=
s-extended/qcbor/qcbor_git.bb
> new file mode 100644
> index 000000000000..a1bdf069936e
> --- /dev/null
> +++ b/meta-oe/recipes-extended/qcbor/qcbor_git.bb
> @@ -0,0 +1,30 @@
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
> View/Reply Online (#104516): https://lists.openembedded.org/g/openembedde=
d-devel/message/104516
> Mute This Topic: https://lists.openembedded.org/mt/100889583/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

