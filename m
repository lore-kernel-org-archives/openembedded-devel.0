Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12BD4E732E0
	for <webhook@archiver.kernel.org>; Thu, 28 Sep 2023 15:01:38 +0000 (UTC)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
 by mx.groups.io with SMTP id smtpd.web10.15806.1695913295624841861
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Sep 2023 08:01:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LBBpMqxa;
 spf=pass (domain: gmail.com, ip: 209.85.160.45, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-1dc863efb61so6723438fac.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 28 Sep 2023 08:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695913295; x=1696518095; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uUtB1T5QdvJg9WRXXES8asOY2gzC3SvyVbNYdFG3P1Q=;
        b=LBBpMqxaMjM09krTbX1eg1TSeXiVuggpnB7Mc4nFPkbCuTs1koUgZe0BhHNSHsI3Dx
         AG/WtM8maSkz+sEhcn5LNYAwfxJ1Wr9+9bPpSrw8YiiZqkenutAZGKSttjHVLRjzeU6i
         +WPXivTN5y2xqaITXrKDSM7fhLFaLkUXe5EYb09VnK8AnUrZF1cFgN9CMMqz7f4rcdXm
         et3cDq6sryIN+i2TsJdvpit6Id6W/KpmTJSGoW7VXTA9UcE+3r/rpFlxc3VfJJAbd0Ug
         cTGoE1EXB9pYqI/a5FsZI6y9srdbPCiBGDfyft3jD8t2/BkFL1wvUzSidL4OsXxyzGvw
         IT4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695913295; x=1696518095;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uUtB1T5QdvJg9WRXXES8asOY2gzC3SvyVbNYdFG3P1Q=;
        b=h+c/C1ZeS4/UvfsjF0zAPtGCV9TgarQp0iIseoSrjFo20uHXSzkXFy6jnu35yNk3QN
         NIeneqNLSgwRlSmqKRl9jZ9ca5/HFxPs/fTNoYZlNVySHeXkAZURCZkRE+S39kON23Vv
         FE+ZzIRKqdQQNwy53iEu+FSwcel9i6JiT+eXqY3FLxcMtr9B0sjkQKy2fO8neFxiv2ZX
         dB7H+Rc2cUZkJVPML3JRk6RuEBMYA0sxqbk8XzzhnmbnIKpQRBnckBhgaz+8Kfjiocbb
         6dk8KxYcY8OE1Xw2girb+zVqR8y2ubph/z/G+45CTPj2Zvm2X+76FrKAJTfcq8z2H9VO
         cw3A==
X-Gm-Message-State: AOJu0YyMsX00V4DPCK6UvFiOB5nOI6TDTicl4trGouodqsVVAooX10Bg
	Pr9nJGFS4lmlgFc3UZ1j9dwvbeZsg7vW1myrerU=
X-Google-Smtp-Source: AGHT+IED7QPhJrBu6xgCHJbxmFR0yP4COzxQ4FUPHQUs3dLj1Ric15fKaXFAFfGMURoIA5tAtlTOB4GK21RoM2UP0Eg=
X-Received: by 2002:a05:6871:70f:b0:1d6:8b7f:ce89 with SMTP id
 f15-20020a056871070f00b001d68b7fce89mr1479943oap.51.1695913294691; Thu, 28
 Sep 2023 08:01:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230928093808.545770-1-costamagnagianfranco@yahoo.it>
In-Reply-To: <20230928093808.545770-1-costamagnagianfranco@yahoo.it>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 28 Sep 2023 08:01:08 -0700
Message-ID: <CAMKF1sp82ZNx=+2V-YX=+u_PWOESjmXT2MtfZWrMC5-HhXJYyA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/2] dlt-daemon:
To: Gianfranco <costamagna.gianfranco@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, 
	Gianfranco Costamagna <costamagnagianfranco@yahoo.it>, Federico Briata <federicobriata@gmail.com>, 
	Andrea Reali <andrea.reali@cnhind.com>, Gianfranco Costamagna <locutusofborg@debian.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 28 Sep 2023 15:01:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105223

I have staged it with some modified commit msg summary please check
master-next and see if it looks ok.

On Thu, Sep 28, 2023 at 2:38=E2=80=AFAM Gianfranco
<costamagna.gianfranco@gmail.com> wrote:
>
> Make sure also without systemd enabled as default, the tools can be built=
 and installed,
> such as dlt-adaptor, dlt-adaptor-stdin, dlt-adaptor-udp, dlt-examples and=
 dlt-console.
> They have stub functionalities when systemd is not default, but they can =
still be used with
> limited functionalities
>
> Reported-By: Federico Briata <federicobriata@gmail.com>
> Reported-By: Andrea Reali <andrea.reali@cnhind.com>
> Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
> Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
> ---
>  .../dlt-daemon/dlt-daemon_2.18.10.bb                | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
>
> diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.10.bb b/=
meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.10.bb
> index 33fae0619..3811772a7 100644
> --- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.10.bb
> +++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.10.bb
> @@ -22,12 +22,13 @@ SRCREV =3D "0f2d4cfffada6f8448a2cb27995b38eb4271044f"
>
>  S =3D "${WORKDIR}/git"
>
> -PACKAGECONFIG ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '=
 systemd systemd-watchdog systemd-journal dlt-examples dlt-adaptor dlt-adap=
tor-stdin dlt-adaptor-udp dlt-console ', '', d)} \
> +PACKAGECONFIG ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '=
 systemd systemd-watchdog systemd-journal ', '', d)} \
> + dlt-examples dlt-adaptor dlt-adaptor-stdin dlt-adaptor-udp dlt-console =
\
>   udp-connection dlt-system dlt-filetransfer "
>  # dlt-dbus
>
>  # General options
> -PACKAGECONFIG[dlt-examples] =3D "-DWITH_DLT_EXAMPLES=3DON,-DWITH_DLT_EXA=
MPLES=3DOFF,,dlt-daemon-systemd"
> +PACKAGECONFIG[dlt-examples] =3D "-DWITH_DLT_EXAMPLES=3DON,-DWITH_DLT_EXA=
MPLES=3DOFF"
>
>  # Linux options
>  PACKAGECONFIG[systemd] =3D "-DWITH_SYSTEMD=3DON,-DWITH_SYSTEMD=3DOFF -DW=
ITH_DLT_SYSTEM=3DOFF,systemd"
> @@ -38,11 +39,11 @@ PACKAGECONFIG[udp-connection] =3D "-DWITH_UDP_CONNECT=
ION=3DON,-DWITH_UDP_CONNECTION=3D
>
>  # Command line options
>  PACKAGECONFIG[dlt-system] =3D "-DWITH_DLT_SYSTEM=3DON,-DWITH_DLT_SYSTEM=
=3DOFF"
> -PACKAGECONFIG[dlt-adaptor] =3D "-DWITH_DLT_ADAPTOR=3DON,-DWITH_DLT_ADAPT=
OR=3DOFF,,dlt-daemon-systemd"
> -PACKAGECONFIG[dlt-adaptor-stdin] =3D "-DWITH_DLT_ADAPTOR_STDIN=3DON,-DWI=
TH_DLT_ADAPTOR_STDIN=3DOFF,,dlt-daemon-systemd"
> -PACKAGECONFIG[dlt-adaptor-udp] =3D "-DWITH_DLT_ADAPTOR_UDP=3DON,-DWITH_D=
LT_ADAPTOR_UDP=3DOFF,,dlt-daemon-systemd"
> +PACKAGECONFIG[dlt-adaptor] =3D "-DWITH_DLT_ADAPTOR=3DON,-DWITH_DLT_ADAPT=
OR=3DOFF"
> +PACKAGECONFIG[dlt-adaptor-stdin] =3D "-DWITH_DLT_ADAPTOR_STDIN=3DON,-DWI=
TH_DLT_ADAPTOR_STDIN=3DOFF"
> +PACKAGECONFIG[dlt-adaptor-udp] =3D "-DWITH_DLT_ADAPTOR_UDP=3DON,-DWITH_D=
LT_ADAPTOR_UDP=3DOFF"
>  PACKAGECONFIG[dlt-filetransfer] =3D "-DWITH_DLT_FILETRANSFER=3DON,-DWITH=
_DLT_FILETRANSFER=3DOFF"
> -PACKAGECONFIG[dlt-console] =3D "-DWITH_DLT_CONSOLE=3DON,-DWITH_DLT_CONSO=
LE=3DOFF,,dlt-daemon-systemd"
> +PACKAGECONFIG[dlt-console] =3D "-DWITH_DLT_CONSOLE=3DON,-DWITH_DLT_CONSO=
LE=3DOFF"
>
>  inherit autotools gettext cmake pkgconfig systemd
>
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#105219): https://lists.openembedded.org/g/openembedde=
d-devel/message/105219
> Mute This Topic: https://lists.openembedded.org/mt/101634559/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

