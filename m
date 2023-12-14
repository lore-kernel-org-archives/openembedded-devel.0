Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96951C4167D
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 17:53:40 +0000 (UTC)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
 by mx.groups.io with SMTP id smtpd.web11.29546.1702576420132837245
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Dec 2023 09:53:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fGCxelfU;
 spf=pass (domain: gmail.com, ip: 209.85.167.178, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3ba00fe4e94so4273747b6e.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 09:53:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702576419; x=1703181219; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eMeIgnivfLhNTgCyoqwqnlRtmJfDdNBDfuhR0oLv100=;
        b=fGCxelfUxJrXj9qS8jdo1qFyC4upvYv7ylHSCQiUTKh1RHX/wVqd8AS9IffNFH5JdJ
         wbhVx7PXVZtLCO7r0PAnqZqUVIGYBzJt21m6eOQdy1ccr7pgpnGDGR7XO2laAQQc6Rr4
         i/aZ7HB/re3adgY77vE4OR3izSSz2mbghGA9C/rX46JHvZMqM5/D5QhH6+ZWZVf+W7Ev
         O2d1udXcu/3NU6iCLNm18kYv+gV/gBr+hdXIY5sewrpnruKrYmClL6aPWDAegtCr7Tkv
         UpHV9jm//eyMpRWHqShJh6bA64J3G6LGfiHtC32GT9d9dq0e8umecZdNeQLfS5EpQM8P
         KkbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702576419; x=1703181219;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eMeIgnivfLhNTgCyoqwqnlRtmJfDdNBDfuhR0oLv100=;
        b=mHXHwE5m0aa/gbDav3OhNmRt6l0vYv8MaQ9gpOeclsVt+nV9uNXvrc+hYQ710Fx1q2
         PT/qOSuyvRuoOE+JfAm9OG9YPmHhX4hvicfEX2yZOEmu0VurUDocUWh3mmL6jnkqUKQ3
         qoiDFOJiFILM1RGov3zgtFy4PHT6qSki8z3Cn5Hesd+c+MkUj74UniCd2ak+fSygylVe
         F6ZT29z+YE9mLabeI2HdMR1LN6uqIIRny/xiYf2/KBFj7S0pVIqMEq521aNSkydK3kU9
         aJhef5s3StVR/BhweipBQuAHep+Rn05aezM4IWazST7fiLMu9EpElb1KNuEEu3BC6ra3
         pmLw==
X-Gm-Message-State: AOJu0YzhVSzFohtyVn1x4mWnWG/GNfHJSsC61D5NWqKipxpeCjNH7KDC
	3KiQbG2wmIXTOeHePALnEgmrqlwPKLoJLXVbc/QkqqYOw/o=
X-Google-Smtp-Source: AGHT+IFlriWgvfzV0dj7u7i+XfSwBSsz5sfyoXr1/jVcYQNS1bnhQ7S8p4MLz72ZFooGJ47HtKMUn51RXiExiVi941w=
X-Received: by 2002:a05:6870:7029:b0:1fb:75b:2fd4 with SMTP id
 u41-20020a056870702900b001fb075b2fd4mr11884218oae.107.1702576419246; Thu, 14
 Dec 2023 09:53:39 -0800 (PST)
MIME-Version: 1.0
References: <1702543578-27508-1-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1702543578-27508-1-git-send-email-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 14 Dec 2023 09:53:13 -0800
Message-ID: <CAMKF1src7FOGZif8AqkEbqkjR_o5d4SnwOq=N2s4TMigS7m_oA@mail.gmail.com>
Subject: Re: [oe] [meta-python] [PATCH] python3-bandit: upgrade 1.7.5 -> 1.7.6
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 17:53:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107464

duplicate of https://patchwork.yoctoproject.org/project/oe/patch/2023121405=
1656.1206600-1-derek@asterius.io/

On Thu, Dec 14, 2023 at 12:47=E2=80=AFAM wangmy <wangmy@fujitsu.com> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Changelog:
>  https://github.com/PyCQA/bandit/releases/tag/1.7.6
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../python/{python3-bandit_1.7.5.bb =3D> python3-bandit_1.7.6.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-python/recipes-devtools/python/{python3-bandit_1.7.5.bb =3D>=
 python3-bandit_1.7.6.bb} (84%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-bandit_1.7.5.bb =
b/meta-python/recipes-devtools/python/python3-bandit_1.7.6.bb
> similarity index 84%
> rename from meta-python/recipes-devtools/python/python3-bandit_1.7.5.bb
> rename to meta-python/recipes-devtools/python/python3-bandit_1.7.6.bb
> index ede7f92e8..3cf927e10 100644
> --- a/meta-python/recipes-devtools/python/python3-bandit_1.7.5.bb
> +++ b/meta-python/recipes-devtools/python/python3-bandit_1.7.6.bb
> @@ -2,7 +2,7 @@ SUMMARY =3D "Security oriented static analyser for python=
 code."
>  LICENSE =3D "Apache-2.0"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D34400b68072d710fecd0a2940a0d1=
658"
>
> -SRC_URI[sha256sum] =3D "bdfc739baa03b880c2d15d0431b31c658ffc348e907fe197=
e54e0389dd59e11e"
> +SRC_URI[sha256sum] =3D "72ce7bc9741374d96fb2f1c9a8960829885f1243ffde743d=
e70a19cee353e8f3"
>
>  DEPENDS =3D "python3-pbr-native python3-git python3-pbr python3-pyyaml p=
ython3-six python3-stevedore"
>
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#107425): https://lists.openembedded.org/g/openembedde=
d-devel/message/107425
> Mute This Topic: https://lists.openembedded.org/mt/103166762/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

