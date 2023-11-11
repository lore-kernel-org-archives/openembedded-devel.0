Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFE07C4332F
	for <webhook@archiver.kernel.org>; Sat, 11 Nov 2023 19:12:16 +0000 (UTC)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
 by mx.groups.io with SMTP id smtpd.web11.2083.1699729929999237257
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Nov 2023 11:12:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ihq+OxKd;
 spf=pass (domain: gmail.com, ip: 209.85.160.47, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-1ef370c2e1aso1866130fac.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 11 Nov 2023 11:12:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699729929; x=1700334729; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eNH6K90R5tqdz4wOjCcAymUPBQnGfAYq7aIrIX/ToyI=;
        b=ihq+OxKdoBOqJvQ+Q+R3FVKf4lYfBeCh7I4MDg9q5HgoqDqqU0VGkeEEN/2meFNva1
         xpDxJG0XdqQ2OiWQNG7yABRQfK0S9kBTVDhL32QPcNSnGoOkhHJSwN6gXIjcKvxMEFCZ
         Gqz4yGH661yWNpNnN/s6noEN6ScU7BvOuF96UdfhqiPCHpl5ZjXcL3ro4J0G4mBwRDnE
         WfHYmrPVGjl3wHv6I/aIGr/Wl7L8nutTPBB4diWGYk9k5mY7vpGNv3GjIKTSSBBjtCZj
         GLhQsj5mvsnCSsmSZiE/BxpFCepR6mNpC93bMwN7CfA7iDOTlCENpF172bmAjhTWRgkC
         v64A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699729929; x=1700334729;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eNH6K90R5tqdz4wOjCcAymUPBQnGfAYq7aIrIX/ToyI=;
        b=REcYxAJZEsCaYIU2x+oIubl80TFPsbsaSLIhMjFW78xBmVOcG/Y7oVs+gheTJmfB9O
         AU7UyCjZv57GPzwkF3Kbo3yMkT4tM75cVtXcGMbPg7MvE9olHBLNPK3OWrGxuzVBfj0q
         j575jRvG1/SvF+jrP/PWgNbyBLqX25NTj42ZAsTn9HvtxKrGJfOQh80/DdE0Fg+T9ZXg
         4hWozrnPURtC+U6nZrUpM6hymHUjlThZSUcUJ4DDA4BPz7asNKxSW+6rX72knujnJBj0
         W/lG3uXeq6yRqO6wALLHNSz5vMXacwh/GVhTChF9ewOZCOM0ok+qlXn61c1j4DzxK24y
         vsxg==
X-Gm-Message-State: AOJu0YzjYzmmLm62Bga0NVjRwRgbxpXJ1LgN/N3zvbosZ9/GHNIPXKWV
	HfA6l28F4oiaRwDSYCqHVa0l2Ehr7socyRLBHyM=
X-Google-Smtp-Source: AGHT+IESZ/p6RnN8LENpY+Zt85eu6yuA2wnun26gkBeqUvmfzoSosooLTIwXz15uqQ/8mh4tMvL5jCZxbihz7S5+CxA=
X-Received: by 2002:a05:6871:6185:b0:1e9:a770:61eb with SMTP id
 rb5-20020a056871618500b001e9a77061ebmr3197877oab.29.1699729929260; Sat, 11
 Nov 2023 11:12:09 -0800 (PST)
MIME-Version: 1.0
References: <20231111185745.3414221-1-alperyasinak1@gmail.com>
In-Reply-To: <20231111185745.3414221-1-alperyasinak1@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 11 Nov 2023 11:11:43 -0800
Message-ID: <CAMKF1sp7DCehayBBsqcb0kYMNwFiBW5790wGq_bowMkZ1mis3A@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] tuna: upgrade 0.18 -> 0.19
To: Alper Ak <alperyasinak1@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 11 Nov 2023 19:12:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106567

On Sat, Nov 11, 2023 at 10:58=E2=80=AFAM Alper Ak <alperyasinak1@gmail.com>=
 wrote:
>
> Signed-off-by: alperak <alperyasinak1@gmail.com>
> ---
>  meta-python/recipes-extended/tuna/tuna_git.bb | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/meta-python/recipes-extended/tuna/tuna_git.bb b/meta-python/=
recipes-extended/tuna/tuna_git.bb
> index a49341240..0d71a3124 100644
> --- a/meta-python/recipes-extended/tuna/tuna_git.bb
> +++ b/meta-python/recipes-extended/tuna/tuna_git.bb
> @@ -3,9 +3,11 @@ HOMEPAGE =3D "https://rt.wiki.kernel.org/index.php/Tuna"
>  LICENSE =3D "GPL-2.0-only"
>  LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/GPL-2.0-only;md5=3D80=
1f80980d171dd6425610833a22dbe6"
>
> +PV =3D "0.19"
> +

Perhaps its better to rename recipe to reflect the PV like this
rename tuna_git.bb -> tuna_0.19.bb

>  SRC_URI =3D "git://git.kernel.org/pub/scm/utils/tuna/tuna.git;branch=3Dm=
ain"
>
> -SRCREV =3D "0681906e75e1c8166126bbfc2f3055e7507bfcb5"
> +SRCREV =3D "b972b8ce386c29bcbcd45029a617db3db9e5b6ca"
>
>  S =3D "${WORKDIR}/git"
>
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#106564): https://lists.openembedded.org/g/openembedde=
d-devel/message/106564
> Mute This Topic: https://lists.openembedded.org/mt/102530913/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

