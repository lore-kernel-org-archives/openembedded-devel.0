Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F7E5E6B27E
	for <webhook@archiver.kernel.org>; Sun,  3 Nov 2024 10:37:05 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web11.33608.1730630221983901183
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 03 Nov 2024 02:37:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GZa5fjcI;
 spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2fc968b3545so30704471fa.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 03 Nov 2024 02:37:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730630220; x=1731235020; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f1oHW6yhPXD+dtYaymqD3TmwQRwGw6W4rVxvN7FIAco=;
        b=GZa5fjcIRsjEGixcl6l74Pw0dhuNOJUPUOXDto63ijdQXvtALDukkvrX6Jma6pstvB
         2XCqKcmNgAedNQIhQr8Xxg1mqhpUnQAY3wh9fRB5ndSue8up54k6Y5jTm2vx83+YFs1C
         IysiIA0f8Xs9xE8UleMcij3Zf80p5YhzEvQ/wI2QUa4dtexwXsjEJBTUS0881cWbL6ex
         +ZdHASAQ8hESKCf29MlaYZNZuHRfXnZHpNUIPsXftj+qJtOOPXbVmpgxI9oj9VwssxNb
         IJg+CTd3SsjSY/s/A5n0jZHfT+5m4hkI+MJuTs1nVJnlpoBWNbCPVC+7zCHaTYwmzwrS
         xdxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730630220; x=1731235020;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f1oHW6yhPXD+dtYaymqD3TmwQRwGw6W4rVxvN7FIAco=;
        b=fVRbG+h21JgjUz0Mpfbf07wVgIVhLZvEO8tKhwhCYFELvZAMmaXWpEhESK1cD9mxJ1
         0dDByr7K0IdnMaCeRTc7cwF5sUOclNzV7U5ZgUHGoLY72v2ch32uiO7sB9r5M1CoxCG6
         2e0Yill5RvBoD0hizxaCCcTR3ZQTwDUXpPaOPJL4N7odsoIfZhjVit2iNxhwV4EPLIZ4
         RnOarjGI/Zk8i6LoeBJaXgO1ZCfIukEUHZW+TUtPKIhM0P1q4SZKwNvb/rBKdc0CpPsf
         EMb74UynqZwaEw6XcHsUqXVUaYRqjd/N+m5+SNjkt6YNfbAi8BrL6pPMICfIkozZ/iYH
         kA0A==
X-Forwarded-Encrypted: i=1; AJvYcCWX9KnCCucXebYaTNZYU0paViyyG2nxO+51VyD7uiodZN+wC4F5tHbDT8lPYIHqyKV8wlvlIVRsg9ORGgUh62Z2z2w=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx/IEu2hSyinPSoaDrkKI4pprTX2Fr0zG1YxVpx812v7GgV626X
	YviUjwpG71sbsFJmNI+AVtF0WHSBpzm4TZE8+k8Pmq/7/yAqmCY5qI0xS+gCteu1QZlXvCxNXV7
	eUWzZBJT/Ee9uPZbWR29a/PbrxL4=
X-Google-Smtp-Source: AGHT+IFx9jKDxb3y4kKyH3zwfb7QhBQfcxvrKrf2Y93Gdm6nToroGAj1y9I1vbeuA7s02UgHxdfF9euLaR4pitq1PZ8=
X-Received: by 2002:a2e:709:0:b0:2fb:351c:c3c9 with SMTP id
 38308e7fff4ca-2fdecc329femr40905581fa.44.1730630219509; Sun, 03 Nov 2024
 02:36:59 -0800 (PST)
MIME-Version: 1.0
References: <20241020150843.1068181-1-raj.khem@gmail.com> <CA+chaQcWf6gCEJbQX16zR=B3PUmaR78WCVorvrP4JvQsJAPDPw@mail.gmail.com>
 <JOE8MS.4DEF6FX7L6873@t-online.de> <18039C488E2C1344.6352@lists.openembedded.org>
 <CA+chaQevEQ2=G0Z0QG5FvZ4pSh0F7p-vOG69g1m95vQYPk364A@mail.gmail.com>
 <1803C5E0EFB35EE5.1077@lists.openembedded.org> <DIT9MS.I2UFW3U29ROC@t-online.de>
In-Reply-To: <DIT9MS.I2UFW3U29ROC@t-online.de>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 3 Nov 2024 11:36:48 +0100
Message-ID: <CA+chaQcpx_2O5O8Ca5p+03fVvejirAjLboyj-SBYHD36a8mpuQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v3] snapper: add recipe
To: Markus Volk <f_l_k@t-online.de>
Cc: raj.khem@gmail.com, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 03 Nov 2024 10:37:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113394

Sounds good enough to me and as you said simpler than patching it.

Thanks for looking into this.

On Fri, Nov 1, 2024 at 1:01=E2=80=AFPM Markus Volk <f_l_k@t-online.de> wrot=
e:
>
> I have now set up a multilib build environment to see exactly how that wo=
rks. If I haven't forgotten anything, it was easier than I thought. I added=
 the following to local.conf:
>
> require conf/multilib.conf
> MULTILIBS =3D =C4=81 multilib:lib32=C4=81
> DEFAULTTUNE:virtclass-multilib-lib32 =3D =C4=81 x86=C4=81
> IMAGE_INSTALL:append =3D =C4=81 lib32-glibc lib32-libgcc lib32-libstdc++ =
snapper lib32-snapper=C4=81
>
> Then set FILES:${PN} like this:
> FILES:${PN} +=3D =C4=81 ${nonarch_libdir} ${systemd_system_unitdir} ${dat=
adir}=C4=81
>
> And I was able to build core-image-minimal with both snapper and lib32-sn=
apper installed without facing any conflicts in do_rootfs
>
>
>
> On Fri, Nov 1 2024 at 07:59:35 AM +01:00:00, Markus Volk <f_l_k@t-online.=
de> wrote:
>
> On Thu, Oct 31 2024 at 11:45:59 PM +01:00:00, Martin Jansa <martin.jansa@=
gmail.com> wrote:
>
> Not sure if this was worth it :).
>
>
> An easy way to hack this might also be something like this ?
>
> # Did this just for testing purpose
> export nonarch_libdir =3D "/usr/lib32"
>
> do_install:append() {
>  if [ ! "${libdir}" =3D "${nonarch_libdir}" ]; then mkdir ${D}${nonarch_l=
ibdir};mv ${D}${libdir}/snapper ${D}${nonarch_libdir}/snapper; fi
> }
>
>
> FILES:${PN} +=3D "${nonarch_libdir}/snapper ${libdir}/pam_snapper ${syste=
md_system_unitdir} ${libdir}/security ${datadir}"
>
> Since I'm not building multilib, I just did an export for nonarch_libdir =
to have a difference here for testing. Kind of seemed to work.
> The 'mkdir' command is probably  only needed in my testcase, because if b=
uilding multilib the ${D}${nonarch_libdir} directory is presumably already =
present
>
> Not pretty but eventually less maintainance than a patch

