Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38E50E77188
	for <webhook@archiver.kernel.org>; Tue, 31 Dec 2024 20:29:01 +0000 (UTC)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
 by mx.groups.io with SMTP id smtpd.web10.2574.1735676931712104845
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 31 Dec 2024 12:28:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DTAfr+TX;
 spf=pass (domain: gmail.com, ip: 209.85.160.50, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-29fe7ff65e6so3747294fac.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 31 Dec 2024 12:28:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735676931; x=1736281731; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pnz4NO9TtBut9luovNwlsi1I7TDMhubAF2k7i2+I10o=;
        b=DTAfr+TX114nBHcwYAyN86Er42C2hAgxhGhSDLdnrbQEwd5PjwiRa7wSQnCBmdxrNu
         vFtHsevRliZn4rl+Dof9uQg1J92xfvhptc6e4hOb6nhpAqhr8vq12wwjPI9DgFuK4fAc
         R9tXRaTQA6G0vtAhr30BfqSePIAE4orhG+xuw5sEfz/cWaVDX41iDYutejHUVGWkqb+n
         9juxeiYdKG0r/APemwBCM+WfKy2U8vVVIbxMjalsLhgMIlnpt2f4v43ysaFV0Jo/oIxw
         zAa6Fql5zxVOx+FiN1HNJVvnGIUHiyE+nSAtuWDoe0W/bt3JYtvbk+g64NnLvBSd6s0x
         MBcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735676931; x=1736281731;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pnz4NO9TtBut9luovNwlsi1I7TDMhubAF2k7i2+I10o=;
        b=BbR74hi1PtTQSS+6aw216O///DEEBdtOaKRjrbsuPMWbJnmLH265z//8wSYNtgY9hD
         16HDUgLTglWpSuXLmBsYOmSmasNFLSFLm1ni2eyTz2N2Dl19Lq5oQTHRzDrBYjuFFASF
         1NLMpWP/m0/VbHThqhUCOkCI1JTt6apPDXu1rdj0qd2iGvGMeVuD1xkjODZr7yScocW+
         w1avgVqiYfo0PYaWodmOBxYopjwxjksRv9HqnLChg+4osu40ic6vuC43c5cIdIgsYUh9
         sbkRWOYemvcEB8zBsEaQu9ZP+JWNGOb8nbu+AxTAnVHt/B5EMwUr6Vt4HAli0H7wgvMS
         /oHg==
X-Gm-Message-State: AOJu0Yyll89VdCdTaHaWECc+PSqOpxRmvGfd0A7knd+bX0Hzju4nypVE
	iVLY4jnlwr6v3zcAeS/dmWggBRiFGeBL6QCI/nbpc7q9ZNAAXo77x4LjcqYXJzN9XmXdqvUf930
	DZ7Kg7r3YKH8tIjmAcx2ER+odb2URtib3
X-Gm-Gg: ASbGnctQYMiA55k8gJP7CKNENKUHrd6xrEmVqDrYdbh9+RJEW6nfZyNMvqB7mO5/Gga
	uqHJ2wbJBEqf9u2DtyR85oDDSK1MVGw5lVgBE
X-Google-Smtp-Source: AGHT+IHJ2+Ni4qroUlUFYScAP+NHfoLbF8M9J5NvYehQhyDBVcJbiVdFX6zOOMVkQuLp90MluGnFAqq7lttL/bULUII=
X-Received: by 2002:a05:6871:a113:b0:29e:76d1:db3b with SMTP id
 586e51a60fabf-2a7fb002220mr25215928fac.5.1735676930972; Tue, 31 Dec 2024
 12:28:50 -0800 (PST)
MIME-Version: 1.0
References: <1735543836-2512-1-git-send-email-wangmy@fujitsu.com> <1735543836-2512-8-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1735543836-2512-8-git-send-email-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 31 Dec 2024 12:28:25 -0800
Message-ID: <CAMKF1srEnG33FCXXCQDnBv14trH2Mf6smdg7rqXjzYa7AXOTdg@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH 08/18] pocketpy: upgrade 2.0.3 -> 2.0.4
To: wangmy@fujitsu.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 31 Dec 2024 20:29:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114608

this fails to link with lld linker see

https://errors.yoctoproject.org/Errors/Details/839120/

On Sun, Dec 29, 2024 at 11:30=E2=80=AFPM wangmy via lists.openembedded.org
<wangmy=3Dfujitsu.com@lists.openembedded.org> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../pocketpy/{pocketpy_2.0.3.bb =3D> pocketpy_2.0.4.bb}           | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-oe/recipes-devtools/pocketpy/{pocketpy_2.0.3.bb =3D> pocketp=
y_2.0.4.bb} (95%)
>
> diff --git a/meta-oe/recipes-devtools/pocketpy/pocketpy_2.0.3.bb b/meta-o=
e/recipes-devtools/pocketpy/pocketpy_2.0.4.bb
> similarity index 95%
> rename from meta-oe/recipes-devtools/pocketpy/pocketpy_2.0.3.bb
> rename to meta-oe/recipes-devtools/pocketpy/pocketpy_2.0.4.bb
> index 2c0ecf0e60..3544247b8c 100644
> --- a/meta-oe/recipes-devtools/pocketpy/pocketpy_2.0.3.bb
> +++ b/meta-oe/recipes-devtools/pocketpy/pocketpy_2.0.4.bb
> @@ -14,7 +14,7 @@ LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D8cdfa87bc5e09bc07f8cf64135026=
d91"
>
>  SRC_URI =3D "git://github.com/pocketpy/pocketpy.git;protocol=3Dhttps;bra=
nch=3Dmain"
> -SRCREV =3D "3be557f95dbc706716b9a9947e41c1f2db92e251"
> +SRCREV =3D "416ee069fdd275b141e3b292fcfe913c8abfa194"
>
>  S =3D "${WORKDIR}/git"
>
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#114587): https://lists.openembedded.org/g/openembedde=
d-devel/message/114587
> Mute This Topic: https://lists.openembedded.org/mt/110339904/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

