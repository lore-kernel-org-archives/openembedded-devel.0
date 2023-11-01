Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B55DC4332F
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 22:33:23 +0000 (UTC)
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
 by mx.groups.io with SMTP id smtpd.web11.1723.1698877996061166685
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Nov 2023 15:33:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=P8DM8mHb;
 spf=pass (domain: gmail.com, ip: 209.85.210.50, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-6ce2bcb131fso168310a34.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 01 Nov 2023 15:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698877995; x=1699482795; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y1N088B5y3WKUApFq5EEg0HyhDb3HrxPBZFTRTxRkbE=;
        b=P8DM8mHbhKvMY3uvm2Ab1nqIIT4j0DDqiot7CIbaoISPyB+SaaU6/UGJG8ku6FLo77
         MnXLwLOQItrLZJY3P6u/TkSxm3jJUyxcwvYdmY4O/upN17MsN4gpP5zfy6cXU7NfwuXD
         2zVQUF6dTEpXfvI6UK9tTm/vkGyYDgLd/VnC9NRv3pGCLiH6yMIof4Z8vj6RcCnhA1NC
         YYYYbPzJvxa1Uv59K3leQx+jcLZSJB5S0y3TH8i3ij57tgj1YGh2RR8bkDLwOvV+oMnN
         9AlKPA5ZqPd123xFYtm3hj3Nfat6mIqYQ4Pgsnwu7BXFOLquQtSFbQcBaTpcRtFS/QgO
         6e6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698877995; x=1699482795;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y1N088B5y3WKUApFq5EEg0HyhDb3HrxPBZFTRTxRkbE=;
        b=sLxxF8ST5ZJxvsk+4bRPhum1MSRXm6ULKJ75vMaKLJt4UrLxToud8lDZSc7uir9jn6
         HCu6QQfFp2r+BCipagABcHv9hBfn5xLSAu/HHIpQbWnqsFux9kAjY8yp7tt6SHVNwWBs
         FvTAkq4YW29bdlQajDdei5k18ln8R1i5xGCWT4ZwFtsBbUjQ7v9vT3RnDJP/BMJKesJW
         60pjQM8DhWvS9K0DsD+KU0ZS5ibyumhY6W7q73InavBOcv8I2e9LGZYfkQW7IKkVRufx
         sNYtMTQG4HdyBn4bO1VjFG0R1R5iSnFiqiFNJ+8b8s2pFJBOiZ7bk9Bj+0PAdTArXfPV
         tDMg==
X-Gm-Message-State: AOJu0YwLnSJ2pnzCNAoXtndWbROYb0JC+7B0wvjg/mSI5fudFFPWp0o/
	SLUInoKEUlNgbk3h1oZ0SZ4XGC+nwLTV+VsWB48n9IYbm1ONfw==
X-Google-Smtp-Source: AGHT+IFZ78j9uEZPaq4KMygmw4Lo1CKwwEJItRlZYekroAo+xfnMQIQfekNZDUNNvaqESi6Fonk0U8E5wH6LuOs49ls=
X-Received: by 2002:a05:6870:a9a1:b0:1b0:649f:e68a with SMTP id
 ep33-20020a056870a9a100b001b0649fe68amr20802639oab.25.1698877995236; Wed, 01
 Nov 2023 15:33:15 -0700 (PDT)
MIME-Version: 1.0
References: <20231031203328.3372015-1-daiane.angolini@foundries.io>
In-Reply-To: <20231031203328.3372015-1-daiane.angolini@foundries.io>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 1 Nov 2023 15:32:49 -0700
Message-ID: <CAMKF1sonjev2Q5ApkNpS8mFkxykFF3OGJH5k-rFC_z+AgsN2sQ@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH] wireguard-tools: Use PACKAGECONFIG
 to select wg-quick and bashcompletion
To: daiane.angolini@foundries.io
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Nov 2023 22:33:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105828

this fails see
https://errors.yoctoproject.org/Errors/Details/741221/

On Tue, Oct 31, 2023 at 1:33=E2=80=AFPM Daiane Angolini via
lists.openembedded.org
<daiane.angolini=3Dfoundries.io@lists.openembedded.org> wrote:
>
> Condition the creation of sub-packages and their consequences to a
> PACKAGECONFIG, which can be overriden outside the metalayer.
>
> Signed-off-by: Daiane Angolini <daiane.angolini@foundries.io>
> ---
>  .../wireguard/wireguard-tools_1.0.20210914.bb          | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0=
.20210914.bb b/meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0=
.20210914.bb
> index 20435338c..44b9eb2f7 100644
> --- a/meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.202109=
14.bb
> +++ b/meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.202109=
14.bb
> @@ -11,11 +11,15 @@ do_install () {
>      oe_runmake DESTDIR=3D"${D}" PREFIX=3D"${prefix}" SYSCONFDIR=3D"${sys=
confdir}" \
>          SYSTEMDUNITDIR=3D"${systemd_system_unitdir}" \
>          WITH_SYSTEMDUNITS=3D${@bb.utils.contains('DISTRO_FEATURES', 'sys=
temd', 'yes', '', d)} \
> -        WITH_BASHCOMPLETION=3Dyes \
> -        WITH_WGQUICK=3Dyes \
> +        ${PACKAGECONFIG_ARGS} \
>          install
>  }
>
> +PACKAGECONFIG ??=3D "bashcompletion wgquick"
> +
> +PACKAGECONFIG[bashcompletion] =3D "WITH_BASHCOMPLETION=3Dyes, , , , , "
> +PACKAGECONFIG[wgquick] =3D "WITH_WGQUICK=3Dyes, , ,${PN} bash,${PN}-wg-q=
uick, "
> +
>  PACKAGES +=3D "${PN}-wg-quick"
>
>  FILES:${PN} =3D " \
> @@ -27,8 +31,6 @@ FILES:${PN}-wg-quick =3D " \
>      ${systemd_system_unitdir} \
>  "
>
> -RDEPENDS:${PN}-wg-quick =3D "${PN} bash"
>  RRECOMMENDS:${PN} =3D " \
>      kernel-module-wireguard \
> -    ${PN}-wg-quick \
>      "
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#105808): https://lists.openembedded.org/g/openembedde=
d-devel/message/105808
> Mute This Topic: https://lists.openembedded.org/mt/102306255/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

