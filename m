Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 897B5C2BD09
	for <webhook@archiver.kernel.org>; Thu,  4 Jul 2024 03:20:32 +0000 (UTC)
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
 by mx.groups.io with SMTP id smtpd.web11.2178.1720063227460693640
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Jul 2024 20:20:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ICJgeJUW;
 spf=pass (domain: gmail.com, ip: 209.85.210.50, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-700cc366e0dso80707a34.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 Jul 2024 20:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720063226; x=1720668026; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4SHbH9FKQQ7AKdOPClYErdALMw5My72GlscJPz7Wrjk=;
        b=ICJgeJUW6uC7NS/JeL3+Y2fydJDjL73AT+yiCN1UHg6/gUiXDvdnoUYkCH4peEofPi
         1wN2Dw5hdX7hssasl7GdOB1/oJJ+OQEqlWxIraISJRePm2m/AYPUK5vVrrF5YwaY+DKL
         lJiSVhhVh+BICIJpbEuGCKJfbytb/Pe/w34sX+0ata3PhKbNdjbSP612pRM8kV2WEu/P
         FSIpCeTWMTLcItV4vP3NHl0EYgDNMpMLDrYfuoTcg5AonrUlzwVunJdQNO0++u74qLA5
         /bWxNI1NfZmKcIt0rNPodkf85Fs+OaFI5ALJ+X1VOtr8RXrRDJuB6S4L/tJw1apYe00R
         F4UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720063226; x=1720668026;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4SHbH9FKQQ7AKdOPClYErdALMw5My72GlscJPz7Wrjk=;
        b=K/RwGBRK6oAMlY+oFlCCEIzZfNURInS7yI4CI4IamAiAv4WgtMOK+oLCcgXLAUqsLU
         2wabcBk89O03gs6GcTOjGmS+NIcf4jgvp75VLUBXYgd7aq03bgVYWL6DM6uNki3WwjD2
         tKXYDRWapHrXMTdQvJQ2yLxr8XJJyJ5P7EKf97NfFw5QxlLksLLCSRUzuivlL4r2b6jq
         TfVyd2mV8E74YTmE8NSx15yhCmnkRWOreRl6eADO5Hc4MXtPqR6xVev53q+9CBF5s0km
         7o5FIDrpTDgGoJ75JeWwg6RRPntIOCpTD+zYN7+A1EZ3x90DTW2eMIYOmYPXiffNqY2z
         beJQ==
X-Gm-Message-State: AOJu0YySF40zCptK2RS7nkjVHNI0RfpNQCTLmexf+ycTX2UOvcbrc/9y
	MEj1tsTkrN5i/erWwk+zngb4JuypT/aZJRFuhX0UrbVfpbHguxlDaeeBrTIAOyg14SFzTGbgzu9
	gsEdL10dgfcm+BlKlF/slldhFQavHeBsW
X-Google-Smtp-Source: AGHT+IFLVhkAPTuaGiFX725X7als7MRRZ5Rf1dZ+9peKaz8TFVCLOAoheorzHQN0Fmo0G8OuW9iwxlJv2n9unK4Wipk=
X-Received: by 2002:a05:6870:8a0f:b0:254:aada:cc8b with SMTP id
 586e51a60fabf-25e2bd734bbmr341295fac.31.1720063226570; Wed, 03 Jul 2024
 20:20:26 -0700 (PDT)
MIME-Version: 1.0
References: <20240703093348.1152878-1-sean@geanix.com>
In-Reply-To: <20240703093348.1152878-1-sean@geanix.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 3 Jul 2024 20:20:00 -0700
Message-ID: <CAMKF1sojSu793Q0zsgqistzuDXEqtKRvA8dR15YmQwDSyQ3vcg@mail.gmail.com>
Subject: Re: [oe] [PATCH] openocd: Enable linuxgpiod build option
To: sean@geanix.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Jul 2024 03:20:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111249

seeing a build failure

https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/3961/step=
s/15/logs/stdio

On Wed, Jul 3, 2024 at 2:34=E2=80=AFAM Sean Nyekjaer via
lists.openembedded.org <sean=3Dgeanix.com@lists.openembedded.org> wrote:
>
> Enable the linuxgpiod via PACKAGECONFIG to allow to use swd via libgpiod
>
> Signed-off-by: Sean Nyekjaer <sean@geanix.com>
> ---
>  meta-oe/recipes-devtools/openocd/openocd_git.bb | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-devtools/openocd/openocd_git.bb b/meta-oe/re=
cipes-devtools/openocd/openocd_git.bb
> index 559fe29ff..2f27bb672 100644
> --- a/meta-oe/recipes-devtools/openocd/openocd_git.bb
> +++ b/meta-oe/recipes-devtools/openocd/openocd_git.bb
> @@ -51,9 +51,10 @@ FILES:${PN} =3D " \
>    ${bindir}/openocd \
>    "
>
> +PACKAGECONFIG[linuxgpiod] =3D "--enable-linuxgpiod,--disable-linuxgpiod,=
libgpiod"
>  PACKAGECONFIG[sysfsgpio] =3D "--enable-sysfsgpio,--disable-sysfsgpio"
>  PACKAGECONFIG[remote-bitbang] =3D "--enable-remote-bitbang,--disable-rem=
ote-bitbang"
> -PACKAGECONFIG ??=3D "sysfsgpio remote-bitbang"
> +PACKAGECONFIG ??=3D "linuxgpiod sysfsgpio remote-bitbang"
>
>  # Can't be built with ccache
>  CCACHE_DISABLE =3D "1"
> --
> 2.45.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#111223): https://lists.openembedded.org/g/openembedde=
d-devel/message/111223
> Mute This Topic: https://lists.openembedded.org/mt/107016479/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

