Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61D81C25B78
	for <webhook@archiver.kernel.org>; Tue, 28 May 2024 15:42:33 +0000 (UTC)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
 by mx.groups.io with SMTP id smtpd.web10.25555.1716910950827601299
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 May 2024 08:42:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IgHQxCal;
 spf=pass (domain: gmail.com, ip: 209.85.210.46, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-6f264d5dadaso556870a34.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 08:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716910950; x=1717515750; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZG5+P++eRC4u8jzRYV50hIwY84DDhrw3PFWFLXbIzyc=;
        b=IgHQxCalUvsHHVRco4xRH6hJHysOba9cAahCkKmI8NiEDvzylYWro1PC+TjnOdHY6G
         L7hywUbs/naMQTI5MtVLEEJEwkZI3Yn8t/ElYsLrCTXFxx6wW358FxixzOF7raxHQD0a
         KcuLoNI8eVSycRgxlUFEYKTTNUsK903SzSD0YOL59hIwqBoTTZwJDr7AYtvb7cC3mXVO
         fvUwMpRCf2aYLY+I7AmOoG59rklb5MnefC8pY6hBYHT+NqjgxH3sKCf/Oo7F2m4fge5Y
         YW9bHWagbesCq5symfmtjWHWtFdAQ7d6XIhWh3HRU/ClyaI6WYUUnktp1PDhyg6Xlsr2
         a3bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716910950; x=1717515750;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZG5+P++eRC4u8jzRYV50hIwY84DDhrw3PFWFLXbIzyc=;
        b=EUZ6mEB1qC7tIZLJkNXvxqZYGUlvnGlMN9DaHDVOEIVaP/uL6de4M6avu5jSlMSlYs
         LcxEQ9wIi3sGZ4QMo2YGX2QTPG657ALGRSWaVoZuxjGFv4cCiR8NZnPh093ssY1snVr2
         76uqUHADTQRqJUKTNkhc8RYZ8YpvgTzwthCGiZCa1Ef2P7Sv/4YI6uXsKoXSVBMSZumb
         PJ+yzhlE9BS31fmX2eRy8xB9AuIhL26z51TDuCkHeJVLMloL0DKRns7TVaN5uy6K3qFe
         LW83h7z99edjwff0TY09iQWDKLoItA/js5O8lTPf9j3tX1nE6W5TCuKQ1ozIKCFyuP54
         YmXQ==
X-Gm-Message-State: AOJu0YzUC/kO3BcfMO4M551y5eDCMrTI2K7CLNXTeI/FfhAXsI54A3vx
	BdIUOlmErt+9mL01KD2YwZv248oaeAL57zRSf4bCydge6ER5ki6iwvzEV6g1hGCmdzx6yxVrrCo
	jgsuammZuQk8CE+JJmvButq3OMYw=
X-Google-Smtp-Source: AGHT+IEW4bf+6c3GAltFdu8pxx+JHN7kQemo0Rdepli4ENxdgEUvJgVw+/cLmtboerR6NncDsAjHpwOJ5pvHidKpPmc=
X-Received: by 2002:a05:6870:3927:b0:250:16f8:87b4 with SMTP id
 586e51a60fabf-25016f887fbmr3551482fac.15.1716910949805; Tue, 28 May 2024
 08:42:29 -0700 (PDT)
MIME-Version: 1.0
References: <20240528091459.3885623-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20240528091459.3885623-1-dmitry.baryshkov@linaro.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 28 May 2024 08:42:02 -0700
Message-ID: <CAMKF1sqd_8++4Z6orBcD8-jJ+72=WyOJ0kJ5typvXcoeSoGyYQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] android-tools-configfs: point S to UNPACKDIR
To: dbaryshkov@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 15:42:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110591

On Tue, May 28, 2024 at 2:15=E2=80=AFAM Dmitry Baryshkov via
lists.openembedded.org <dbaryshkov=3Dgmail.com@lists.openembedded.org>
wrote:
>
> android-tools-configfs doesn't have any checked out source files, which
> results in a warning regarding S not existing. Fix the warning by
> pointing S to UNPACKDIR.
>
> The warning text:
>
> WARNING: android-tools-conf-configfs-1.0-r0 do_unpack:
> android-tools-conf-configfs: the directory ${WORKDIR}/${BP} (<scrubbed>)
> pointed to by the S variable doesn't exist - please set S within the
> recipe to point to where the source has been unpacked to
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../android-tools/android-tools-conf-configfs_1.0.bb            | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta-oe/recipes-devtools/android-tools/android-tools-conf-co=
nfigfs_1.0.bb b/meta-oe/recipes-devtools/android-tools/android-tools-conf-c=
onfigfs_1.0.bb
> index 430b53c4d0cf..b50437615ebf 100644
> --- a/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs_=
1.0.bb
> +++ b/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs_=
1.0.bb
> @@ -3,6 +3,8 @@ SECTION =3D "console/utils"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/MIT;md5=3D0835ade698e=
0bcf8506ecda2f7b4f302"
>
> +S =3D "${UNPACKDIR}"
> +

perhaps follow the pattern we are using elsewhere

S =3D "${WORKDIR}/sources"
UNPACKDIR =3D "${S}"

>  SRC_URI =3D " \
>      file://android-gadget-setup \
>      file://android-gadget-start \
> --
> 2.39.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#110579): https://lists.openembedded.org/g/openembedde=
d-devel/message/110579
> Mute This Topic: https://lists.openembedded.org/mt/106345437/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

