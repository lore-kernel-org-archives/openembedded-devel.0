Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F822C5ACB8
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 00:00:15 +0000 (UTC)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
 by mx.groups.io with SMTP id smtpd.web11.1552.1700006415037364437
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Nov 2023 16:00:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aJE46Gsg;
 spf=pass (domain: gmail.com, ip: 209.85.160.48, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-1ef9f1640a5so3759057fac.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Nov 2023 16:00:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700006414; x=1700611214; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2j19wsaPOAstgpvkOAUL/RQbm/PqA/kVtcBGTNhvHEM=;
        b=aJE46GsgQtqzDPV/O8EJmrHeSTxElQVlKtm3OXsp8p9KgaDkXX+gITHrujpl9MtmZU
         /0hNzpqIvmGsNaaDRQje/kUukfoyDBODyRcTP9ds0HkC2GR+sMWGJvS9EPFBb8iQV6FW
         /QSiZnGtL6kwTxmjvJGmURqI1BDgSqLB8jFBXJZEwQ8uuB31UaTrNJ74DPS15A99c9hU
         toiCtFymVsiyrm+onDAXKzxIRJr1DpofBLBong+YWO8TbjU242TdVo/yU0yE4GkVibLw
         L307+VYi5/f1VL0nrZVP9xc9PwW8NCN9r/3SaOE1jPWSY1KX7aX+Hj7c/8W8/La1Uvvf
         jSeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700006414; x=1700611214;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2j19wsaPOAstgpvkOAUL/RQbm/PqA/kVtcBGTNhvHEM=;
        b=YIM0Bzjvd/PCgyQTaUqLxGCgqn7Haj+9VoV/vZinhKOnXhhSiXZ9mChGzLltT8AkfJ
         xE1pcLXwJJHS2/FZbp8lf5IhZsx+Xa/2VayU8HYUhL0M/Fnew/f5oBS9puwkBRWumvCZ
         k53V7JDyipu4JoLP85vO/o7EX17Qbt9GycnORTxGRA8W3Xg7zps8PJDdf+vzrvJ5TecO
         nkLubelcBivpZCK/RzPSJSOKMCAJEukRIRL1nmWcmj0F9HrKRgmvzP74iVATLtFpDq6Z
         loCBDVhCsI8/rvZ2XASWL/ygnt/rT1d8v3f2B5ofFWFYGC0LZWfxN1FDmOd/EqZcHVuH
         nNTA==
X-Gm-Message-State: AOJu0YzGokX4qoAf0Nut5/gzI0ZXkOSe7cQGqLb28PInoTXPU+P08VNB
	wDNctSLAU2seEtowmzNFcXN+amAHY7uGBZJ67IEe8KZbEfO9DA==
X-Google-Smtp-Source: AGHT+IGy5eYjWrKLiCxWP6whGgfGwf3uqRslYLHZusv/Li7jIL9O4WdPRw0MX/t/izsy9t7vkjLTWxLg2tQ1mk84dzg=
X-Received: by 2002:a05:6870:7e0f:b0:1ef:d2b2:fe56 with SMTP id
 wx15-20020a0568707e0f00b001efd2b2fe56mr13159501oab.0.1700006414289; Tue, 14
 Nov 2023 16:00:14 -0800 (PST)
MIME-Version: 1.0
References: <20231114234246.326099-1-f_l_k@t-online.de>
In-Reply-To: <20231114234246.326099-1-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 14 Nov 2023 15:59:48 -0800
Message-ID: <CAMKF1spBBp5wAbsOqqVabpU-Ksjj1iOgc7qkLG53=VTioXK=0Q@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] cups-filters: Try to fix possible Makefile
 race condition
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Nov 2023 00:00:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106730

On Tue, Nov 14, 2023 at 3:42=E2=80=AFPM Markus Volk <f_l_k@t-online.de> wro=
te:
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  meta-oe/recipes-printing/cups/cups-filters_2.0.0.bb | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta-oe/recipes-printing/cups/cups-filters_2.0.0.bb b/meta-o=
e/recipes-printing/cups/cups-filters_2.0.0.bb
> index 0370ae79d..4dfb5f612 100644
> --- a/meta-oe/recipes-printing/cups/cups-filters_2.0.0.bb
> +++ b/meta-oe/recipes-printing/cups/cups-filters_2.0.0.bb
> @@ -20,6 +20,10 @@ EXTRA_OECONF +=3D " \
>  PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'zeroconf',=
 'avahi', '', d)}"
>  PACKAGECONFIG[avahi] =3D "--enable-avahi,--disable-avahi,avahi"
>
> +do_compile() {
> +       oe_runmake -j1

to disable parallelism we should do
PARALLEL_MAKE =3D ""

However, I was hoping to find the root cause for the problem.

> +}
> +
>  FILES:${PN} +=3D "${datadir}"
>  FILES:${PN}-dev +=3D "${datadir}/ppdc"
>
> --
> 2.42.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#106727): https://lists.openembedded.org/g/openembedde=
d-devel/message/106727
> Mute This Topic: https://lists.openembedded.org/mt/102595472/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

