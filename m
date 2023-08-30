Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EE6AC83F01
	for <webhook@archiver.kernel.org>; Wed, 30 Aug 2023 07:33:31 +0000 (UTC)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
 by mx.groups.io with SMTP id smtpd.web11.8816.1693380807208266005
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Aug 2023 00:33:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=Kzs96IOS;
 spf=pass (domain: gmail.com, ip: 209.85.167.171, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-3a76d882080so3842099b6e.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 30 Aug 2023 00:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693380806; x=1693985606; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2t2JOnAW/NGvr8ribUSetWiFt9ZM3HhLcbBD9iAH3Qg=;
        b=Kzs96IOSYF8FjQY21KMMZUhxyCzKB3cJ19262bVVGJtJIFju+cquaKoT1pjwU0L9Yi
         dxH7XqJeRNRmJFSL2+v3wTgbKugSJoVWqY2zkof1xj3ocoSAg8UuwxMeZpXc3a8b9QlX
         BGFXKh4WwRnVV1lS2mpRQit2gKenZgy3ndUob+GbWNm6HZnrR54t63+mr0pojEGMJ0Td
         W8XE0P0h6a2VKgIfqnrzLcWiq8Gjjy7igt/GMqBZMJF1WREuOmJvHcxzM1DiI5uxtSpN
         i0OeoU5f0vVgXsxcjEVsZKN7R+vVcXs1MdPvZQUq8xG/jgOgAxQeZCvigccW2/2dZWf7
         tCtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693380806; x=1693985606;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2t2JOnAW/NGvr8ribUSetWiFt9ZM3HhLcbBD9iAH3Qg=;
        b=XB3C1t6QEGIIsjdymPrsxxz3FN3dq3i8NGk39ZmS1PcQ9l4YTs1hd61411NXzdVCFw
         hr0msKXTdldX6YZJXx1lsxnimoul18iJJoqfYCrRptFt0OXGrVUR5ivAIKoer5GcJktS
         9/l/aVu2xGM0d2t59FgrtSDmyGJtYzQtEV7LdYZ9gL1PxGUULLoqDURjIuvdQlkuRmhA
         fGqiMqIjfs6xdSvjO6uhdrgSi77OAzxTK9/Mhoj3tOo2tgbx6Xo/7PXW9XpCIDqMkBy+
         YbliMA3eMUZMBZn5UI9v4GvIxpOBQh6mXEt3iBtTDP08c0zsVq0hvYHF+r2umxpr4ZZl
         lChg==
X-Gm-Message-State: AOJu0Yw7idcMDWGPdlqBCV3bgmyYT8Rr5lwU7XhFW2zd7XAor9E8nGau
	qIMSSCEKHgRUtZ+4PBP2ssdhmMIMf2aAlLMA8Q0=
X-Google-Smtp-Source: AGHT+IFETiKyHBvziIONueunGXYIXuBysdUDyJ1gtjdtkbYbUXxu3MU0NZoKM1V1UZXSBKHIEX7uilscStW9CMREtV8=
X-Received: by 2002:a05:6808:10d5:b0:3a8:6abe:8380 with SMTP id
 s21-20020a05680810d500b003a86abe8380mr1739487ois.53.1693380806237; Wed, 30
 Aug 2023 00:33:26 -0700 (PDT)
MIME-Version: 1.0
References: <1bda00e8-dd34-743e-b875-a9cf1e9dc739@3mdeb.com>
In-Reply-To: <1bda00e8-dd34-743e-b875-a9cf1e9dc739@3mdeb.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 30 Aug 2023 00:33:00 -0700
Message-ID: <CAMKF1soSUqrXwbeYTAxoFxeXuN5eJuR1JaTuUpKQFbdDMCafDA@mail.gmail.com>
Subject: Re: [oe] [meta-python] [PATCH v5] python3-piccata: piccata - a simple
 CoAP toolkit added
To: Danik <daniil.klimuk@3mdeb.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Aug 2023 07:33:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104655

On Wed, Aug 30, 2023 at 12:32=E2=80=AFAM Danik <daniil.klimuk@3mdeb.com> wr=
ote:
>
> python3-piccata: piccata - a simple CoAP toolkit added
>
> piccata is a simple CoAP (RFC7252) toolkit compatible with Python 2.7.
>
> The toolkit provides basic building blocks for using CoAP in an
> application. piccata handles messaging between endpoints
> (retransmission, deduplication) and request/response matching.
>
> Handling and matching resources, blockwise transfers, etc. is left to
> the application but functions to faciliate this are provided.
>
> piccata uses a transport abstraction to faciliate using the toolkit for
> communication over different link types. Transport for a UDP socket is
> provided.
>
> Signed-off-by: Daniil Klimuk <daniil.klimuk@3mdeb.com>
>
>
> diff --git
> a/meta-python/recipes-devtools/python3-piccata/python3-piccata_2.0.3.bb
> b/meta-python/recipes-devtools/python3-piccata/python3-piccata_2.0.3.bb
> new file mode 100644
> index 000000000000..b625a038298f
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python3-piccata/python3-piccata_2.0.3.=
bb
> @@ -0,0 +1,14 @@
> +SUMMARY =3D "Python CoAP Toolkit"
> +HOMEPAGE =3D "https://github.com/NordicSemiconductor/piccata"
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3De664eb75e2791c2e505e6e1c274e6=
d4f"
> +
> +SRCREV =3D "218d310e3d840715b1c8e67cefd5b6d71a2d7a1a"
> +PV =3D "2.0.3"

this is redundant

> +SRC_URI =3D
> "git://github.com/NordicSemiconductor/piccata.git;protocol=3Dhttp;branch=
=3Dmaster"
> +
> +S =3D "${WORKDIR}/git"
> +
> +inherit setuptools3
> +
> +RDEPENDS:${PN} +=3D "python3-core python3-datetime python3-io
> python3-logging python3-math"
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#104654): https://lists.openembedded.org/g/openembedde=
d-devel/message/104654
> Mute This Topic: https://lists.openembedded.org/mt/101047967/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

