Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32AECC83F01
	for <webhook@archiver.kernel.org>; Wed, 30 Aug 2023 07:19:11 +0000 (UTC)
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
 by mx.groups.io with SMTP id smtpd.web10.8765.1693379946911022654
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Aug 2023 00:19:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=eeet8DEB;
 spf=pass (domain: gmail.com, ip: 209.85.161.45, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-573429f5874so2883277eaf.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 30 Aug 2023 00:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693379946; x=1693984746; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=29qyk1kNQR4N0nMPDWQyD9cEl8Hh93a7nsf00D3mBa8=;
        b=eeet8DEBFWKq1k7w7sNUNroh9VqdFreyvBQHMcY5P5smuLHGlc3Gl16k+0UeRtr2yP
         bSd8HGy63QeI6PRRZXi7GtFrSJAvDMCAPsnSHcrTY0G07s0q6AtVSPDBGl3BigAIvbl+
         qEYY6lOEJf0mY4XAP9wp5fmuq+OKAGrTOLssCb+VKApqUSE5xlan/kCGu0OsjHn6CBoE
         8tsAjEtMFJi1IotttixECI8z7jq7UZ7vjK82br8kZfqGN9XtiS2M3M+xWY6FbHgartDB
         0NWInVuWQf94clCTxoSlkVJYVUvrEdYI5TWe55hvPnuLU7nzqn22D2mOTUNrA1RZAUMX
         4nBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693379946; x=1693984746;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=29qyk1kNQR4N0nMPDWQyD9cEl8Hh93a7nsf00D3mBa8=;
        b=YNXu7G3oPODlRPh/Vqzha+NT8dGgogdaryC/EZdnQOPQY+nitat6N++Pb1UmF1rbWK
         NzYmMjHL0L8qIRhpRhwyuOtN8j4B1cJBKQvV8U6ZH+4NGnM7rFdySHkBh4i9uFf3ev2O
         IlP1D33cm9OVIjDXW+iM0GDHeoTllLZ9i5e+StF/o7e3nUjv7nesHAmOlCbq/yCgiTE5
         fOZSbKH2axV+LcKsgQKwlNvy54f+p12yipaPCvBLCKnpkjyJT/Tzqp6mJhEVz+oZLVzD
         AMOfOaG1ccVbRjdNZb+pSF1IEHK1wlyU+etodl8ZqFbZqSSaa/WG2MJCLHvKI/R0pOjq
         d3Gg==
X-Gm-Message-State: AOJu0Ywyran4Fy9WUQf+wTXo+DiLCfZt6vtY70RrxOOWen8jhNks4qnO
	vksvVkYzi8xAERLWDCbQkm7YUdsqoW03lAJjbejh/TFct8o=
X-Google-Smtp-Source: AGHT+IG1oQs6gQ1zoouiqSnUsNpOCtLt5BzLhOOCbPTUerKlYwNe+hl5xiGhfxUxqLEgMnFzREvCTpM0i3+Y9mAlew8=
X-Received: by 2002:a4a:91da:0:b0:571:2c9c:12ec with SMTP id
 e26-20020a4a91da000000b005712c9c12ecmr1117642ooh.2.1693379946095; Wed, 30 Aug
 2023 00:19:06 -0700 (PDT)
MIME-Version: 1.0
References: <09638366-0d5c-0f45-92f4-cfd213b38dbf@3mdeb.com>
In-Reply-To: <09638366-0d5c-0f45-92f4-cfd213b38dbf@3mdeb.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 30 Aug 2023 00:18:40 -0700
Message-ID: <CAMKF1src3PysdMQfEBc3m+5bs=dDhORKhnKgrTTt+19HrqZdmg@mail.gmail.com>
Subject: Re: [oe] [meta-python] [PATCH v4] python3-piccata: piccata - a simple
 CoAP toolkit added
To: Danik <daniil.klimuk@3mdeb.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Aug 2023 07:19:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104648

On Tue, Aug 29, 2023 at 11:40=E2=80=AFPM Danik <daniil.klimuk@3mdeb.com> wr=
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

recipe says 2.0.3 but here its overridden to 5.10.0, we need to
confirm one version and
it should be represented by recipe name.

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
> View/Reply Online (#104646): https://lists.openembedded.org/g/openembedde=
d-devel/message/104646
> Mute This Topic: https://lists.openembedded.org/mt/101047550/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

