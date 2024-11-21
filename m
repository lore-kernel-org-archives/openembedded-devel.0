Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51221E6400B
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 19:26:20 +0000 (UTC)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
 by mx.groups.io with SMTP id smtpd.web10.7053.1732217177093943826
 for <Openembedded-devel@lists.openembedded.org>;
 Thu, 21 Nov 2024 11:26:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ToFT663A;
 spf=pass (domain: gmail.com, ip: 209.85.210.53, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7180a400238so692126a34.0
        for <Openembedded-devel@lists.openembedded.org>; Thu, 21 Nov 2024 11:26:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732217176; x=1732821976; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0YplLTxu9KIa7CHrasHiDjc+RtwPK72abk2MW1qkjBk=;
        b=ToFT663AukCMN+K4SAwEq6A0KKo8nKfrGiqemmtqNPbecGZbUbWmuDyDF8qzZ9tRei
         6lwOKbWCriL1QyOm65+fLHWGS4Bz1Dy6V+Y9mM0LmnvBbVtPR59OYYOo5Rnss5qLxk0P
         zIhHI0GtPjfh/SlysRRq/UnlZy37vPDHjBdAwiY2gypUedLNJQhAQhGqjwBrPYoqZbTa
         nhj6NmvAIaBB9eOm3ZGteQIqCFeWaB/T3T/bZX1LEUIvW1DE8/qe48/SRiz2x499cPlE
         +peEd0BYG3u/iSgnvSiRhJ7Zt/aolfsscEgmZ/yNbMsjYqrj4VQ2GiweSGuxNJuDQhtG
         zmdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732217176; x=1732821976;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0YplLTxu9KIa7CHrasHiDjc+RtwPK72abk2MW1qkjBk=;
        b=HI0DaJ7V0768Ja9fo66XGZYdvjEkGHmXIiaL+KOB6Znk9OtNjwXsVRyp7HZ+Ch63Qv
         3GBoFW7feE7yMhsc4Og2pH59GlY2uKinipZDlFbhb2UCwb8TcvvHUhEA06k48HuV4Wvt
         R6fo1oJzDfAT9Ikqgto/5nizKNMh3Nu2fJS2AZBJ3Gbb15o4Y6TW+nAizSAbKrVdUI3K
         IB2eH9lvb45d9xvJeXMZdehNukgJ/bvHJFpbe1qpMxvEawFA6/OSXAAc1aee4M3JNgma
         YuNm8tHldLZidRmp7IAs2ZF0RIpelN2XuIcARhDvmh4LXtEWX/WW60NXadK8B+t3G3Qu
         baTQ==
X-Gm-Message-State: AOJu0YzcaULGW/gA24XJ4OknaF/1aQ9sy3SLRc9t2J5rO+mlaXI8BUuN
	nDOVD+MwYXTd4dZL1kmXNmcLzGBeAugjJp8V5ruFr/yLv6krSG4AuREJHZz7ni1pRExiPmhNpIw
	bmiuCkUrg/mYAuQVcUFuh8jonWZ0JFaVS
X-Gm-Gg: ASbGncsDKL4ZJ6U6o7+zWCmQMJE1VgXiauVgITdqknbF8qQkXjmNV+97QkVlRKp2UOB
	03vCXLY/vPwwsQ/9vnKKiiYagdx74JQ==
X-Google-Smtp-Source: AGHT+IF27F21vTU359UTD9EzaVrxCsAOA4bOICBa1ypY3/S4tAc6PIF78R+LQBdalY9okKQg21lUhdSTdR4DYENS8PQ=
X-Received: by 2002:a9d:7358:0:b0:718:8652:fdaa with SMTP id
 46e09a7af769-71b0e5999b7mr2723567a34.12.1732217176182; Thu, 21 Nov 2024
 11:26:16 -0800 (PST)
MIME-Version: 1.0
References: <20241121190440.2685646-1-mail@michael-fitzmayer.de>
In-Reply-To: <20241121190440.2685646-1-mail@michael-fitzmayer.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 21 Nov 2024 11:25:50 -0800
Message-ID: <CAMKF1sqJ15FYzLHUbFfB1mRq6tbH=gzhwAn07kx85TQobsFX0A@mail.gmail.com>
Subject: Re: [oe] [PATCH] add recipes: canopenterm 1.0.8, pocketpy 2.0.2
To: mail@michael-fitzmayer.de
Cc: Openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Nov 2024 19:26:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113976

On Thu, Nov 21, 2024 at 11:08=E2=80=AFAM Michael Fitzmayer via
lists.openembedded.org
<mail=3Dmichael-fitzmayer.de@lists.openembedded.org> wrote:
>
> CANopenTerm is a versatile software tool to analyse and configure CANopen
> devices.  It extends its capabilities to support other CAN CC protocols,
> including SAE J1939 and OBD-II.
>
> pocketpy is a portable Python 3.x interpreter in modern C.  CANopenTerm
> depends on it.
>
> Signed-off-by: Michael Fitzmayer <mail@michael-fitzmayer.de>
> ---
>  .../pocketpy/pocketpy_2.0.2.bb                | 25 +++++++++++++++++++
>  .../canopenterm/canopenterm_1.0.8.bb          | 23 +++++++++++++++++
>  2 files changed, 48 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/pocketpy/pocketpy_2.0.2.bb
>  create mode 100644 meta-oe/recipes-extended/canopenterm/canopenterm_1.0.=
8.bb
>
> diff --git a/meta-oe/recipes-devtools/pocketpy/pocketpy_2.0.2.bb b/meta-o=
e/recipes-devtools/pocketpy/pocketpy_2.0.2.bb
> new file mode 100644
> index 000000000..4bbef91d5
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/pocketpy/pocketpy_2.0.2.bb
> @@ -0,0 +1,25 @@
> +SUMMARY     =3D "pocketpy"

This seems too terse, infact the DESCRIPTION below is apt for summary.

> +DESCRIPTION =3D "A Portable Python 3.x Interpreter in Modern C"
> +HOMEPAGE    =3D "https://pocketpy.dev/"
> +BUGTRACKER  =3D "https://github.com/pocketpy/pocketpy/issues"
> +
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D8cdfa87bc5e09bc07f8cf64135026=
d91"
> +
> +SRC_URI =3D "git://github.com/pocketpy/pocketpy.git;protocol=3Dhttps;bra=
nch=3Dmain;tag=3Dv${PV}"

lets not use tag here, they may not work when the network is disabled
since they act as floating labels, please set
SRCREV instead.

> +S       =3D "${WORKDIR}/git"

additional space after S are unusual, just use one space.

> +
> +inherit cmake
> +
> +do_install() {
> +    install -d ${D}${libdir}
> +    install -m 0644 ${B}/libpocketpy.so ${D}${libdir}/
> +    install -d ${D}${includedir}/pocketpy
> +    cp -r ${S}/include/* ${D}${includedir}/pocketpy/
> +}
> +
> +PACKAGES =3D "${PN} ${PN}-dev ${PN}-dbg"

It seems unnecessary to redefine PACKAGES here. Just remove it.

> +
> +FILES:${PN}      =3D "${libdir}/libpocketpy.so"
> +FILES:${PN}-dev  =3D "${includedir}/pocketpy"
> +FILES:${PN}-dbg +=3D "${libdir}/.debug/libpocketpy.so"
> diff --git a/meta-oe/recipes-extended/canopenterm/canopenterm_1.0.8.bb b/=
meta-oe/recipes-extended/canopenterm/canopenterm_1.0.8.bb
> new file mode 100644
> index 000000000..82295303d
> --- /dev/null
> +++ b/meta-oe/recipes-extended/canopenterm/canopenterm_1.0.8.bb
> @@ -0,0 +1,23 @@
> +
> +SUMMARY     =3D "CANopenTerm"

Too terse like recipe above

> +DESCRIPTION =3D "A versatile software tool to analyse and configure CANo=
pen devices"
> +HOMEPAGE    =3D "https://canopenterm.de"
> +BUGTRACKER  =3D "https://github.com/CANopenTerm/CANopenTerm/issues"
> +
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3D10e84ea70e8c3a1fbc462f5424=
806474"
> +
> +DEPENDS =3D "libinih libsdl2 lua libsocketcan pocketpy readline"
> +
> +SRC_URI =3D "git://github.com/CANopenTerm/CANopenTerm.git;protocol=3Dhtt=
ps;branch=3Dmain;tag=3Dv${PV}"

Hmm, same comment as above

> +S       =3D "${WORKDIR}/git"
> +
remove additional spaces

> +inherit cmake
> +
> +EXTRA_OECMAKE +=3D "-DBUILD_YOCTO=3DON"
> +
> +FILES:${PN} +=3D "/usr/bin/CANopenTerm \
> +                /usr/share/CANopenTerm \
> +               "

Use ${bindir} and ${datadir} variables instead of hardcoding /usr/bin
and /usr/share

> +
> +RDEPENDS:${PN} =3D "libinih libsdl2 lua libsocketcan pocketpy readline"
> --
> 2.39.5
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#113975): https://lists.openembedded.org/g/openembedde=
d-devel/message/113975
> Mute This Topic: https://lists.openembedded.org/mt/109709776/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

