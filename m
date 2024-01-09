Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE0A4C3DA6E
	for <webhook@archiver.kernel.org>; Tue,  9 Jan 2024 03:33:07 +0000 (UTC)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
 by mx.groups.io with SMTP id smtpd.web11.9283.1704771178590815145
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Jan 2024 19:32:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IrGSqoD/;
 spf=pass (domain: gmail.com, ip: 209.85.160.50, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-204dfd7a89aso1207809fac.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 08 Jan 2024 19:32:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704771178; x=1705375978; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ndz7yb/bdoi9HbH8Fpyz8RBeQqZZqoTw8hTCtfcksSY=;
        b=IrGSqoD/c1VyiExIcHp3ioNSvsolie0eWtQuPp3c00ab4o1YgYGhMTH625AOAuvx1Y
         JgeMhNjO92x7kcPG6yE0riwwh/wDN5AeOkr/Af8XV9D8ljhzSTpG0VkXJU5PvzZDSqqu
         sIbpZqsEm+iXPMrCfNlOBgRzaMjF0uTDeaxJ35qWa7G+4/zNX2WtnH17ynLOXmwb2lb+
         kgGgifUWoCXEztOfeaYPmiO/ej+7WCxtbt0odWVK0+Obm+i/I23XlNmEO3pYOgDAtsXB
         3sXyc/q6Psv6xowiSOYo7pejjRYMAcukoWDSnHrh+60dptNRcGhzLHKrsxlNFvJzRGfN
         R9rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704771178; x=1705375978;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ndz7yb/bdoi9HbH8Fpyz8RBeQqZZqoTw8hTCtfcksSY=;
        b=o4Y4hE5XUzED1Yee7mvIfn/1/A3KrlJ9EJFAZME0YcD0BEViDPBNytoqZitqC7IH44
         UwVYfo9bR+RgXGF0z9LPggbHSnJvRwu0tavo+RaPcMLXhf1In+e66oJKy+9EkkP3sov/
         LBEponT8Sr8xkfzePAwac0zgXMwYkz9kodz6nCNXgmZ3rfJeMjjj5QeF1YR4DTgcDyeu
         bHtvgjpMIqKBWLpS96HtBwcJ7h03M9MtAAxjl4yUH3bo+hXuvW6JwXEZpvNanESO93lE
         xlAVfYiapOIb4GemeYPbClDpPCvPd0nM8GeEIoJ0hYY75Sn0rdwfkt58IHSm8f7DEUzs
         o8eQ==
X-Gm-Message-State: AOJu0YzRyy+a5rrd0cRNsaInktHRGubt0LoDBx2+VMiEpWRWmCvrMNZ2
	i1HEnPOgxcp2emCp+ks9fOZBpWaTkCIx1e8mqD8=
X-Google-Smtp-Source: AGHT+IE2kDBbXcam68S1kUBSzF30egxhx7WEassnuCmszRY9PmzgACldVGy6a9om2FTMUni+PqZxiR8yKYGMIV2DT3Q=
X-Received: by 2002:a05:6870:a2ce:b0:206:8cf:71cd with SMTP id
 w14-20020a056870a2ce00b0020608cf71cdmr35647oak.8.1704771177744; Mon, 08 Jan
 2024 19:32:57 -0800 (PST)
MIME-Version: 1.0
References: <20240105133611.3018041-1-alex@linutronix.de> <20240105133611.3018041-2-alex@linutronix.de>
In-Reply-To: <20240105133611.3018041-2-alex@linutronix.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 8 Jan 2024 19:32:31 -0800
Message-ID: <CAMKF1srDmU9h8xP2JGX=6otiRGqVPKr4ZNX00bicU-R=C9ipmQ@mail.gmail.com>
Subject: Re: [oe] [PATCH 2/2] python3-kivy: update 2.2.1 -> 2.3.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Jan 2024 03:33:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108176

this fails to build here ( maybe its clang finding additional problems )

https://sprunge.us/lq5PKS

On Fri, Jan 5, 2024 at 5:36=E2=80=AFAM Alexander Kanavin <alex.kanavin@gmai=
l.com> wrote:
>
> License-Update: years, mention that it is MIT at the start.
>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  .../python/{python3-kivy_2.2.1.bb =3D> python3-kivy_2.3.0.bb} | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename meta-python/recipes-devtools/python/{python3-kivy_2.2.1.bb =3D> p=
ython3-kivy_2.3.0.bb} (93%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-kivy_2.2.1.bb b/=
meta-python/recipes-devtools/python/python3-kivy_2.3.0.bb
> similarity index 93%
> rename from meta-python/recipes-devtools/python/python3-kivy_2.2.1.bb
> rename to meta-python/recipes-devtools/python/python3-kivy_2.3.0.bb
> index a72ee14f6..0d4a1207f 100644
> --- a/meta-python/recipes-devtools/python/python3-kivy_2.2.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-kivy_2.3.0.bb
> @@ -2,7 +2,7 @@ SUMMARY =3D "Open source Python library for rapid develop=
ment of applications \
>      that make use of innovative user interfaces, such as multi-touch app=
s."
>  HOMEPAGE =3D "https://kivy.org/"
>  LICENSE =3D "MIT"
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Ded5cd0f2cfda42852c332e3b88c85=
fea"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D6d3bc49400e35d5a2279d14c40dcf=
b09"
>
>  inherit setuptools3 pkgconfig features_check
>  PIP_INSTALL_PACKAGE =3D "Kivy"
> @@ -11,11 +11,11 @@ PIP_INSTALL_PACKAGE =3D "Kivy"
>  # and mali-based OS's. We need to patch the setup file to tell Kivy setu=
p
>  # that our machine has GLES libaries installed as well
>  # Also, if using SDL2 as backend, SDL2 needs to be configured with gles
> -SRC_URI =3D "git://github.com/kivy/kivy.git;protocol=3Dhttps;branch=3Dst=
able \
> +SRC_URI =3D "git://github.com/kivy/kivy.git;protocol=3Dhttps;branch=3Dma=
ster \
>             file://0001-add-support-for-glesv2.patch \
>             "
>
> -SRCREV =3D "344768bfefd2e8f5302cc9dfb8ca41991ce6f7e7"
> +SRCREV =3D "9ef218027178115a66b417ae34b21f488bdd3617"
>
>  S =3D "${WORKDIR}/git"
>
> --
> 2.39.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#108048): https://lists.openembedded.org/g/openembedde=
d-devel/message/108048
> Mute This Topic: https://lists.openembedded.org/mt/103542151/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

