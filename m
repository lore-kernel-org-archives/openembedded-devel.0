Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23E8FC3DA40
	for <webhook@archiver.kernel.org>; Thu, 17 Aug 2023 15:51:06 +0000 (UTC)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
 by mx.groups.io with SMTP id smtpd.web10.399.1692287463716724239
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Aug 2023 08:51:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=OVSpVp2X;
 spf=pass (domain: gmail.com, ip: 209.85.160.45, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-1c4c6717e61so3866739fac.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 17 Aug 2023 08:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692287463; x=1692892263;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dARoZdNbofYUVPPt++oURusRSlISMXRADnwi6MjiFQA=;
        b=OVSpVp2XisXe6HuRLwRkZh9IzoCBf91jZ9Xg9n0Xj5FeBUUK8/BcT6+BHiHy1IxEB0
         5cQmnGTwBOSHxu67LtCdkJ2YPNBTOZvvLTJ40F70XD4KgWdF68T/aPZ28NcRfqdfxiCi
         6JsTCwWC2RhiDD+8v/ON6xuEfMOn0iAvY+sdO088w/bRsxPU5n0wEKIow/3lztY+z7by
         wmqn3/95LOYmGpgAE2iwdZhi77AAirt+uJEeb6ICYVX28N2QshIw17QRrFr9mSTHbSWj
         f534p4ph/5MAnmpnz/DbyaourAg6QGMGoNUHB8IP0z+jvQi7JvqkrumqOgvo5n5m/mrP
         qVzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692287463; x=1692892263;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dARoZdNbofYUVPPt++oURusRSlISMXRADnwi6MjiFQA=;
        b=kVLggN18x2y2nHYGOV/qdHwiYswSS9k/RCND3cfsr5N2womfpFd6wPYE2SfT9z6qrH
         S5MfqgSbAoVJB5grnkg47ZOAFbFMXh0i3HQeXI8nd/B2vYSz/4IZswI3vYE3Kuh45yLN
         YQ0KBG+LQkGFak7MpYIhAq7iKhrpvp2VOiEVhQOW+oKxyKlvWE4uy6IK7N/Qd0zu18og
         2pME9X4UMvTVXQeKF8fmoQGDHBCdpPU7EEpNeNN1asTJbmdmaWSMl7HSlXkohCH2h+lV
         fzy6YFzj4fiG6fBfgJx4CBtThPgqOeVMqbIWBgOfs7RY/rjUkjEsRnwEG+tGEC5Ab1x9
         Kx2g==
X-Gm-Message-State: AOJu0YzbT1jq7ta4xgm+7YMn7TZyuDT8ruBHOvbfBq64U6qTGNMDm0AG
	TijpdV7Nymhn2aG13Hs8bO2VxkddQ+LsrySwUAIi04Tiys2o5w==
X-Google-Smtp-Source: AGHT+IGMccPeCqFkl1wm22ZZj0D8SSSgooGqSiuk5PNzC78BcF6+ePEfvUzdH/i1eIqnXz+fEmyBvaXjKLiOs0Y9tqs=
X-Received: by 2002:a05:6871:6a5:b0:1bb:70be:5061 with SMTP id
 l37-20020a05687106a500b001bb70be5061mr5877308oao.5.1692287462906; Thu, 17 Aug
 2023 08:51:02 -0700 (PDT)
MIME-Version: 1.0
References: <23ea8ba5-7d80-44c9-86a3-c527bb935cf5@3mdeb.com>
In-Reply-To: <23ea8ba5-7d80-44c9-86a3-c527bb935cf5@3mdeb.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 17 Aug 2023 08:50:36 -0700
Message-ID: <CAMKF1sp0OpYSjLF9uh=RcpzU1aXV_gzm47e2_1BuDwtf8pVS-g@mail.gmail.com>
Subject: Re: [oe] [meta-python] [PATCH v2] python3-gspread: interface for
 google spreadsheet
To: Danik <daniil.klimuk@3mdeb.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Aug 2023 15:51:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104471

does not apply cleanly on master or master-next  please rebase and resend.

On Thu, Aug 17, 2023 at 12:25=E2=80=AFAM Danik <daniil.klimuk@3mdeb.com> wr=
ote:
>
> python3-gspread: interface for google spreadsheet
>
> Adds simple interface for working with Google Sheets.
>
> Signed-off-by: Daniil Klimuk <daniil.klimuk@3mdeb.com>
>
> diff --git
> a/meta-python/recipes-devtools/python3-gspread/python3-gspread_5.10.0.bb
> b/meta-python/recipes-devtools/python3-gspread/python3-gspread_5.10.0.bb
> new file mode 100644
> index 000000000000..0c8fb648e701
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python3-gspread/python3-gspread_5.10.0=
.bb
> @@ -0,0 +1,15 @@
> +SUMMARY =3D "Google Spreadsheets Python API"
> +HOMEPAGE =3D "https://github.com/burnash/gspread"
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D
> "file://LICENSE.txt;md5=3D9488e21983675fa56dc05af558b83e2f"
> +
> +SRC_URI =3D
> "https://files.pythonhosted.org/packages/b4/4f/033ebf34778745061b67b104ef=
212ed5b05fa65a530f345f88c4355fdcc3/gspread-5.10.0.tar.gz"
> +SRC_URI[sha256sum] =3D
> "2b6bba6dc111580170346a9bcd1893e0e8c52f67a9e537caec7b7a1e27c14435"
> +
> +PV =3D "5.10.0"
> +
> +S =3D "${WORKDIR}/gspread-${PV}"
> +
> +RDEPENDS:${PN} =3D "python3-requests"
> +
> +inherit python_poetry_core
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#104447): https://lists.openembedded.org/g/openembedde=
d-devel/message/104447
> Mute This Topic: https://lists.openembedded.org/mt/100796205/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

