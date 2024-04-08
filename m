Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77777C67861
	for <webhook@archiver.kernel.org>; Mon,  8 Apr 2024 14:18:12 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.107669.1712585887381338136
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Apr 2024 07:18:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CVgvo3iR;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-343bccc0b2cso3305783f8f.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 08 Apr 2024 07:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712585886; x=1713190686; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RET35iD3h0RUAEIe3rzWBhAiPcrOMb1aXxTiDinigew=;
        b=CVgvo3iRX+xJbnspGjzcLhsDOINXWng6YbymXMpfGzffmm/Rf/mHNT6Zx4vndXcu6e
         9EB5rlRWwUkXFjDR8H+jyR4jezCt9HPVgoa0/UPrQnuXIcm5E07v6cBMTlmNSE3Fx2K3
         YrjRJ/yRZEodBf22D/vZB360Ly5oDmljbL5Ll29IC5WtXfr40JzoXorD8ROubeIHtHwD
         oaKI/k6u3y8GgldKtTdbgofatwgG9jAKZ376P18/UbU1OuRFQlncWTCpG9+ifqzttulL
         CV/5Sjrp6gSW06o14MbyRpwW5RvhX0gxLnDsEi0cKB45sF74Gv+uvwP2dkcdewaoJPqd
         3tsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712585886; x=1713190686;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RET35iD3h0RUAEIe3rzWBhAiPcrOMb1aXxTiDinigew=;
        b=QPKG8gD98z//wVWKu+aTpRu27xI8rbc/8JZerlnOgRgYPU2Gmi5IQ2BUCw+FeuS4iz
         77q8ZH1SCg835DFG2xIZ6Vjdb1/RxkAsiSPYWKnIni9CbWRenVNQI7MMeY6C0SVdB5XJ
         Ofl+vfnchyCM5hlIDcVL5ePmTiHuPvOcGY2XzHyAu1nJD8hmNG5JlVHhVGZwYuya7ld4
         bASCFpt+pJdjS4GrAvNWekUgLStHJbNbXHh7uE/yuCZINcIf/KMAV2DYP2IaTcVdTHnk
         4CAV+vrcHpSARGre+iPTMpwLPfF+ItXYQ63DBjDQ/KotcjBgjTT9SnHSkLSd/22S9Cz8
         e3cw==
X-Forwarded-Encrypted: i=1; AJvYcCWXXgHTygoQpJ2ZL+rOXMkUOdCjIJchIYuJjDSEeMvcn3jgeK53eI80Q+pCysLckEv8SEEtXm40h15r5VM+UpW5dGALXsHg38mR60vginIhrY/85TMtJlQJew==
X-Gm-Message-State: AOJu0Yz4BqvaernuuVUhozVN2so2BGTr9sdTgV4feFur8jcAcM5cU6+I
	4JZAWKUvEwApoLNSwd9KnOVWcgGQ2L8h7uOe43vP82/vGiG5KmULoa0tr2T9j0qXFnyiJkw7jPE
	2AMgshv7RMLVCblHb936lul4y37Q=
X-Google-Smtp-Source: AGHT+IEAx+Y+XOso6wT7cJ8+Rl81hYe11vmFdIIfXQblHohLIb6wJAvfG6793O77pjRprJYRx5uOm8AUd47OTj68xY8=
X-Received: by 2002:a5d:4acc:0:b0:33d:44d8:eacc with SMTP id
 y12-20020a5d4acc000000b0033d44d8eaccmr6889911wrs.39.1712585885617; Mon, 08
 Apr 2024 07:18:05 -0700 (PDT)
MIME-Version: 1.0
References: <20240405162459.1286945-1-fathi.boudra@linaro.org>
 <CAMKF1soBViCDq1i8+ZS8k32U3rV5Hb4DbqPCXZy-+qeEgaMPtg@mail.gmail.com> <CAGNsrLBXGFP01o43JG8DKaLWhV9vr+cJUFaMYr=E9i5=010Cgw@mail.gmail.com>
In-Reply-To: <CAGNsrLBXGFP01o43JG8DKaLWhV9vr+cJUFaMYr=E9i5=010Cgw@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 8 Apr 2024 16:17:43 +0200
Message-ID: <CA+chaQeG4kwGjZOi4VNmk_sjQijwX_fq0s+vpZCWrqi9CXjv_g@mail.gmail.com>
Subject: Re: [oe][meta-oe][PATCH] composefs: add a new recipe
To: Fathi Boudra <fathi.boudra@linaro.org>
Cc: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Apr 2024 14:18:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109865

On Mon, Apr 8, 2024 at 3:50=E2=80=AFPM Fathi Boudra <fathi.boudra@linaro.or=
g> wrote:
>
> Hi Khem,
>
> On Sat, 6 Apr 2024 at 03:04, Khem Raj <raj.khem@gmail.com> wrote:
> >
> > fails with latest musl
> >
> > https://errors.yoctoproject.org/Errors/Details/761688/
>
> I tried to reproduce:
>
> local.conf:
> MACHINE =3D "qemuarm64"
> TCLIBC =3D "musl"
> TOOLCHAIN =3D "clang"
>
> $ bitbake -e musl |grep "^PV=3D"
> PV=3D"1.2.4+git"
>
> Build Configuration:
> BB_VERSION           =3D "2.7.3"
> BUILD_SYS            =3D "x86_64-linux"
> NATIVELSBSTRING      =3D "debian"
> TARGET_SYS           =3D "aarch64-oe-linux-musl"
> MACHINE              =3D "qemuarm64"
> DISTRO               =3D "nodistro"
> DISTRO_VERSION       =3D "nodistro.0"
> TUNE_FEATURES        =3D "aarch64 crc cortexa57"
> TARGET_FPU           =3D ""
> meta                 =3D "master:486ed69939f1b7572f121960c2dde246032686e7=
"
> meta-clang           =3D "master:13dcab852c5bcd51fd75ae84ace9eddd99254653=
"
> meta-filesystems
> meta-networking
> meta-oe
> meta-python          =3D "master:5a02b76b82d1f48986212c33dddf7986385c79ef=
"
>
> I couldn't reproduce the build failure. What am I missing?

removing meta-filesystems from your bblayers.conf

