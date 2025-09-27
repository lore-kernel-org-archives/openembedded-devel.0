Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9187ACAC5B0
	for <webhook@archiver.kernel.org>; Sat, 27 Sep 2025 12:41:58 +0000 (UTC)
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
 by mx.groups.io with SMTP id smtpd.web11.10969.1758976910162584225
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 27 Sep 2025 05:41:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mh6od+++;
 spf=pass (domain: gmail.com, ip: 209.85.210.44, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7abbdf3c476so1582063a34.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 27 Sep 2025 05:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758976909; x=1759581709; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/s4ge9tvKb8UySF2EXJ5YsSXE9EaIrbTKObX5+HNLrA=;
        b=mh6od+++X1AD+2rHLkhFPrgo2kHj3i3nEl2wQ/Fgpu2wU4bUNaXTdy8kiUQKOsqV3D
         dYKWNOHIvCoRaUP7InEuNm6FGzTHBlI2LSLzIsmx6F1IhYc1lytiUQ2dNu/prHHwheWa
         Ij8E2DbH4BrQ7DVb8/ZZyTH2Yc2L7O9Xyfhqg7zn0BijW18IS8fTXTbsWiLztCaC+0mq
         m49ZQZeXBuchoTMtEDc1IELzpjQnORIrnVTO/q9l8KGjQi4OeSe6bIPUuyoB0vW52R9E
         tcIDBu2eID0sP1VJHSMo/TGcaXck/jFzIdNo9VT5KwOxUTf7Q8vgmKTa7Mxnv/aEAnMC
         gHyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758976909; x=1759581709;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/s4ge9tvKb8UySF2EXJ5YsSXE9EaIrbTKObX5+HNLrA=;
        b=ODXRe2VSUQzgKjfnhniNPp5FBAZ/3wVi5KWA8qVCJ/UzB394RDebvm4XRs0RmdUxO4
         8H+bSBTQS4dVeVdC+7y7xMnWchg/Uoy0rl+ghiP/f0nFta1en2WdmrV3exrpIoWI0Okr
         n8fUNVPGWFvdBjlCjm0kENK5bB7UkGJUz5XLbc44+qreab8GLodw25KIhUcyFbaND7O/
         DLe5SOhf1kNYaAumQAoMC0sSFRRe9G/b9Tn4tf02gtt4aL9QLvLAP5xv3s2qwYQLrH92
         np9bb0JPV4G06uyYelqUJ40DWGB4XQI1/C/CFOmhE/JHrsJm0kJlyjfgpcHQHnJoP4en
         6PKQ==
X-Gm-Message-State: AOJu0Ywwz3TmltyEfvw4jJFN2ymftDKOQi3GGj770QZRFDu1f+knbcOs
	Teb2j12/X6khppUtdLi8Dik3iah8AMILr56bNylxitLimnXa4Ue1tDs9ymDPlQ6FiWCc5vQ0jro
	0lvDEOpcZknrRIq8jL8sVDIhmsl7ea2c=
X-Gm-Gg: ASbGnctBm7sj/KF/237UeHuBVvbqqYuastybCfUAKzM8UVzzQhM6j1zf+6DViWKIvoW
	0Y1VLxchCqAZbTm39MGOucLkIoLV8KZnId/a3H3B85Hy6C0WJ9Ti/iqCGyNQisqEiLYp/V2FYhC
	bXDyzbZmo8KAX8ch622NQJSf9PYih9SRvU2ISTWEJXiYwzEwyByvbPKCq8qULSI7S9zMdT3h9Wq
	MbylcUqWVtRwY9fBKA=
X-Google-Smtp-Source: AGHT+IGMgQYqrkox1EWgoOe39gH0IXemVD7jxYgUd2sns/SeF0pUYxYHNgDzFBiVBO/a60egjGflTPqLUfCjjzGG60k=
X-Received: by 2002:a05:6808:10d6:b0:439:af72:a13b with SMTP id
 5614622812f47-43f4cce1beemr5459629b6e.6.1758976909233; Sat, 27 Sep 2025
 05:41:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250927034420.13089-1-schonm@gmail.com>
In-Reply-To: <20250927034420.13089-1-schonm@gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Sun, 28 Sep 2025 00:41:38 +1200
X-Gm-Features: AS18NWB88jDI97f60AOZgj_xBL5DqhfYJuMxrOEsDrFva6MeuzVuB2HL3Nz4h14
Message-ID: <CADySD0E47fGGU9hWqLdGna2wAhrdqKQkWK-LFB6K4UmuCi8Y_Q@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] gsoap: upgrade 2.8.134 -> 2.8.135
To: schonm@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 27 Sep 2025 12:41:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119986

IMO, this can also be submitted to walnascar, scarthgap and kirkstone
branches as well.

On Sat, Sep 27, 2025 at 3:44=E2=80=AFPM J. S. via lists.openembedded.org
<schonm=3Dgmail.com@lists.openembedded.org> wrote:
>
> License-Change: update copywrite from 2015 to 2024.
>
> from the changelog.md file :
>
>   Version 2.8.135 (07/01/2024)
>   ---
>   - Updated `soap::http_extra_header` optional user-defined custom HTTP h=
eader string to
>     permit multiple HTTP headers in the specified string separated by new=
lines, the
>     specified headers are checked by the engine to conform to HTTP header=
 formats.
>
> Signed-off-by: Jason Schonberg <schonm@gmail.com>
> ---
>  .../gsoap/{gsoap_2.8.134.bb =3D> gsoap_2.8.135.bb}              | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-oe/recipes-support/gsoap/{gsoap_2.8.134.bb =3D> gsoap_2.8.13=
5.bb} (88%)
>
> diff --git a/meta-oe/recipes-support/gsoap/gsoap_2.8.134.bb b/meta-oe/rec=
ipes-support/gsoap/gsoap_2.8.135.bb
> similarity index 88%
> rename from meta-oe/recipes-support/gsoap/gsoap_2.8.134.bb
> rename to meta-oe/recipes-support/gsoap/gsoap_2.8.135.bb
> index 0956eb121c..8ce4f17075 100644
> --- a/meta-oe/recipes-support/gsoap/gsoap_2.8.134.bb
> +++ b/meta-oe/recipes-support/gsoap/gsoap_2.8.135.bb
> @@ -2,12 +2,12 @@ DESCRIPTION =3D "The gSOAP toolkit provides a unique SO=
AP-to-C/C++ language bindin
>  for the development of SOAP Web Services and clients."
>  SECTION =3D "devel"
>  LICENSE =3D "GPL-2.0-with-OpenSSL-exception"
> -LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D4f40a941379143186f9602242=
c3fb729 \
> +LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D7eaf5d4df67c0db38549ba3c7=
14a37d6 \
>                      file://GPLv2_license.txt;md5=3Da33672dbe491b6517750a=
0389063508b"
>
>  SRC_URI =3D "https://prdownloads.sourceforge.net/${BPN}2/${BPN}_${PV}.zi=
p \
>             file://0001-Provide-strtod_l-signature-on-non-glibc-linux-mus=
l-s.patch"
> -SRC_URI[sha256sum] =3D "63478e555c0ccde0164f055ff605b02805db0abc6712a04b=
cb14cb617b047218"
> +SRC_URI[sha256sum] =3D "b11757e405d55d4674dfbf88c4fa6d7e24155cf64ed8ed57=
8ccad2f2b555e98d"
>
>  inherit autotools
>
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#119950): https://lists.openembedded.org/g/openembedde=
d-devel/message/119950
> Mute This Topic: https://lists.openembedded.org/mt/115460648/3619737
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nkur.tyagi85@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

