Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 331D0C3065D
	for <webhook@archiver.kernel.org>; Thu, 17 Aug 2023 15:50:56 +0000 (UTC)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
 by mx.groups.io with SMTP id smtpd.web11.404.1692287454584871757
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Aug 2023 08:50:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=j++WSg3G;
 spf=pass (domain: gmail.com, ip: 209.85.160.44, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-1c52dbc300bso1924739fac.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 17 Aug 2023 08:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692287454; x=1692892254;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xFiFt2el99HYU1UOFxIbuXx1NQNOdha+zP7I1ihKezU=;
        b=j++WSg3GskC1K2KTCxxqIpNY59eamIVpA1jMzPmmbfCp8rWGQbodjm1g2YQWHhHzSl
         Qu7QKKEO3y2Y7MEppcgX8SbRQ8dKjXCpkbUgAhdRUySEOgKTUJZ0ZXzneOgNyvEWm2Fc
         gzmDEU6zJ8UYmh8O8h2hMx4nLKm1MfFHrr42jiMqvFwy+X+mHhUJBnmYtQRzglldHGWv
         bEQ/HefTTMziZAFDk2GffPl1n+SSQQMwvVVOYsS78LZQaX/MkMG91u3rLhgfG9HoP9iL
         D9hGdaukpLCFA8kvqeWY+JxjvnMmnmd+5KZcXiM3LitZFoa8q9+5WR/W5KtjO7Vmh/6I
         6c4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692287454; x=1692892254;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xFiFt2el99HYU1UOFxIbuXx1NQNOdha+zP7I1ihKezU=;
        b=iGcHKVCPv7dpsZXPgAh8lpb73qNoDysch7fxFNCO1CjXkhPlqnPFfuouzEV658th7U
         q014PiHDf2fdQY9eJtDCOazniKXRdEONZ64uRvI+LgFNWNc9WynsMgkpjJxsODe/I+zU
         fnP+GKOx6iBeQRY2fYyRAonw0l4Glm91AeKRX4Smo7ceEWVv3PHIX7jstgpJi/0GDQ8Q
         /UJCOzToOJTCyXfUQIuTGALGCPKSXHj19Y/kn3FFI9H7QG0i4CDCT0+pqrpDjaL547OP
         08CNTiylUnG0v5ibX8connRLVSVpGYQ0FSl0w1vAwz1vsa5bXvi3Ipk1OuV4qKahaz+0
         gotg==
X-Gm-Message-State: AOJu0YxDUoMy1cF2nspCOyglcY/4JY6eoNULmClnAtZY5VXhILTNrGuL
	BbpNc57zF8CXlmKm1CAp0K2FkJ/VijaXOZMswR1l0jjzzX0=
X-Google-Smtp-Source: AGHT+IEE2vNLuYiVEWpfYZtvEuXYlewvEllZzVuBpm1BL6DCvW1E1OIqr0wJQ+ddFQxgRTrYWafEtkVvu7iFAmkHYHo=
X-Received: by 2002:a05:6870:1606:b0:1b7:8836:95c9 with SMTP id
 b6-20020a056870160600b001b7883695c9mr7146016oae.42.1692287453798; Thu, 17 Aug
 2023 08:50:53 -0700 (PDT)
MIME-Version: 1.0
References: <4d0dc582-50da-caf9-816e-414209242b31@3mdeb.com>
In-Reply-To: <4d0dc582-50da-caf9-816e-414209242b31@3mdeb.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 17 Aug 2023 08:50:27 -0700
Message-ID: <CAMKF1sq7AyzfgdCream4oAQr9Jgwa29CWsVjQDhM1EZx8ihf8w@mail.gmail.com>
Subject: Re: [oe] [meta-python] [PATCH v2] python3-piccata: piccata - a simple
 CoAP toolkit
To: Danik <daniil.klimuk@3mdeb.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Aug 2023 15:50:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104470

does not apply cleanly on master or master-next  please rebase and resend.

On Thu, Aug 17, 2023 at 12:27=E2=80=AFAM Danik <daniil.klimuk@3mdeb.com> wr=
ote:
>
> python3-piccata: piccata - a simple CoAP toolkit
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
> diff --git
> a/meta-python/recipes-devtools/python3-piccata/python3-piccata_2.0.3.bb
> b/meta-python/recipes-devtools/python3-piccata/python3-piccata_2.0.3.bb
> new file mode 100644
> index 000000000000..703df8cd3f57
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
> +PV =3D "5.10.0"
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
> View/Reply Online (#104448): https://lists.openembedded.org/g/openembedde=
d-devel/message/104448
> Mute This Topic: https://lists.openembedded.org/mt/100796229/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

