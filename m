Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D55F7C3DA6E
	for <webhook@archiver.kernel.org>; Tue,  9 Jan 2024 03:42:57 +0000 (UTC)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
 by mx.groups.io with SMTP id smtpd.web10.9619.1704771771881551968
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Jan 2024 19:42:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bRw9Npmu;
 spf=pass (domain: gmail.com, ip: 209.85.160.47, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-2044ecf7035so1834715fac.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 08 Jan 2024 19:42:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704771771; x=1705376571; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dUfxt/HAneBjHtMZZLpi9kXjJU8y8ZNAh+rjmEosSp0=;
        b=bRw9Npmu4SmxswVaptJywYn6YVDleFyEzRs3g8dbwmEPudHnqW7vEkEYAEmXFzD8uK
         LmiOMX9ZIDhXrE/2M/55z74gf42Qpyx06ydkRv01G19SK3M1anttc8tMGEgvdBiVgYiS
         y8s+Aa9OGNl5MkB4eqPfbx5EVr5QdUvg2IRjeE49DZRSKpjkdsFdRyF5RqPMqoqFYzxf
         m+NOpvwXC67j8pC+H+mhI9olkI34JhHRMNxB6drRaPv5TOOsbT7VAxVrfpatmPFdXCB0
         /7WNO79c0Dm2jt34EMoarOwQYhb8ahcGvSiTMGjYxKPjoXuqC9dt4RKeIcZkyJnB9xLq
         JHDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704771771; x=1705376571;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dUfxt/HAneBjHtMZZLpi9kXjJU8y8ZNAh+rjmEosSp0=;
        b=luTCPTpMzk7qjS0NNDRrw83dyKIMCIdpYdGOnA2Cz7eQTW5TVKuy72YzPNx7et3aGc
         4YGsLyDPJOrFVr+065IJKd8910SezGnkgSdbla1lPhxNLkkeZY4uNS76xmiaGal/6etn
         PUEF/VhpUlf9rM3ENWgmXfZzLCG603SvxdurNgXyEghFLMXg/fNo6qqul8yb+jv8rUtQ
         BtyvzsAIgwp+zDh2VEVn67vgxBzWbjhmVEpHnoDCoHmSlvUjZST4ztwiOrRguyFICEP8
         taATcerq3WDq1O0rTlsVk+uAd6bWOQQxLltaVv11LKTj4ReRsfvgPOnI0KiE6uAtkcp6
         Obmw==
X-Gm-Message-State: AOJu0YzlTWSQ1nxKfIUQ9lsxAzHrclIswGjFTNm66puSc5VkFurNBsfM
	Zzx3jVt4c+gBQCYdBcQ0zJjmUMNgNVDgiAo/QOkPi0wz0Sg=
X-Google-Smtp-Source: AGHT+IFXSuvMVMCHEP2ho7vf8W2UV9hoaRLXKFhoCT0DYNUeF0ELSTplpr/B0w9mDWjGJNDTiSwHOVrFbZS0p9BumaM=
X-Received: by 2002:a05:6870:5d8e:b0:205:c8c9:4688 with SMTP id
 fu14-20020a0568705d8e00b00205c8c94688mr6043921oab.119.1704771770971; Mon, 08
 Jan 2024 19:42:50 -0800 (PST)
MIME-Version: 1.0
References: <1704720414-30159-1-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1704720414-30159-1-git-send-email-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 8 Jan 2024 19:42:25 -0800
Message-ID: <CAMKF1sqTOPDcL6miyj-8v+bkmRyZdASNLhTjw5G7VA3V7yT0yg@mail.gmail.com>
Subject: Re: [oe] [meta-networking] [PATCH] networkmanager: upgrade 1.44.0 -> 1.44.2
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Jan 2024 03:42:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108179

Failed to compile on musl

http://sprunge.us/qADsVp

On Mon, Jan 8, 2024 at 5:27=E2=80=AFAM wangmy <wangmy@fujitsu.com> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Changelog
> =3D=3D=3D=3D=3D=3D=3D=3D
> * Better log IPv4 Address Conflict Detection (ACD) conflicts
> * Remove the upper limit of 65535 for PIDs read from the PID file
> * Allow missing default gateway with oFono
> * Honor the CLICOLOR_FORCE environment variable
> * Fix generating connection with IPv6 method disabled vs ignored
> * Fix possible segmentation fault when doing a checkpoint rollback
> * Documentation improvements
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../{networkmanager_1.44.0.bb =3D> networkmanager_1.44.2.bb}      | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-networking/recipes-connectivity/networkmanager/{networkmanag=
er_1.44.0.bb =3D> networkmanager_1.44.2.bb} (99%)
>
> diff --git a/meta-networking/recipes-connectivity/networkmanager/networkm=
anager_1.44.0.bb b/meta-networking/recipes-connectivity/networkmanager/netw=
orkmanager_1.44.2.bb
> similarity index 99%
> rename from meta-networking/recipes-connectivity/networkmanager/networkma=
nager_1.44.0.bb
> rename to meta-networking/recipes-connectivity/networkmanager/networkmana=
ger_1.44.2.bb
> index 07a85b68a..a2c65f61d 100644
> --- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_=
1.44.0.bb
> +++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_=
1.44.2.bb
> @@ -42,7 +42,7 @@ SRC_URI =3D " \
>  "
>  SRC_URI:append:libc-musl =3D "${@bb.utils.contains('DISTRO_FEATURES', 'l=
d-is-lld', ' file://0001-linker-scripts-Do-not-export-_IO_stdin_used.patch'=
, '', d)}"
>
> -SRC_URI[sha256sum] =3D "edca09637d182f806b3b12d8c5623d7badbd73ccca1ae63b=
e20d2f298779fb9f"
> +SRC_URI[sha256sum] =3D "4b58bf3ac57e2cefb5652efd0945eb0b4bc36a63d92a61ab=
471d8bb2c9a420e1"
>
>  S =3D "${WORKDIR}/NetworkManager-${PV}"
>
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#108140): https://lists.openembedded.org/g/openembedde=
d-devel/message/108140
> Mute This Topic: https://lists.openembedded.org/mt/103596558/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

