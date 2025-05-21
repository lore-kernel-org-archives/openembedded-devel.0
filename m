Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B15A5C54E65
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 07:17:34 +0000 (UTC)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
 by mx.groups.io with SMTP id smtpd.web11.5359.1747811849786818390
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 May 2025 00:17:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Kqx0sTe9;
 spf=pass (domain: gmail.com, ip: 209.85.160.43, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-2d4e91512b4so2347901fac.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 00:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747811849; x=1748416649; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f3JPOzoU1XconRiY+1ia2gH0S05dOzBascyBCwLnMCY=;
        b=Kqx0sTe99ukwZtOrP9GUTw3mJ+HG4MU33YnhZlj9UXQmzffElmgi/LVvMxR5+BVaCy
         qT9HKiRo/D/UvfNkVMUMLoVh8YC1VaR0hCBCi/v9C9j1IQhXiyX4ql83mD5KR1JLfTWE
         NGwjKL0tZ0nq5DK+uZ7AYgTH6vaCrbQkWkZXXwg5XhCa9i24R1BrqZXWv9DqdQ7CFRBi
         lOD/DrmjHch1e6mgg4x1Hdl9S2U5xS1Bet59NZ4Qxaz0lrr6Q6GJPvc/SzXmAMUNxY2O
         q6ETdrH7N4KNRdJObaJACYhy+pm+clnlmxOqG7f/CE+k73DOPp1mreoPsfFVoVF1sG2X
         rsXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747811849; x=1748416649;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f3JPOzoU1XconRiY+1ia2gH0S05dOzBascyBCwLnMCY=;
        b=kDQmqgs231vIpBo2nKJSszHO6ppS+Y/tD7ff7IGL/+huRD2GgWEJAZ7VBZdSJJ21jU
         ILZoQ83zpEMIgPrY3ona39uyJEz91Be9ZzUiTxbNSYQrYUO1DbBvZG6rXaELxjF9zuHq
         BreYnufMzfXB9zd72Vl9Foe8BOu3E5nqAhzeVv0F55sPTpNXxClEYwRSwxMsxvkh3I8Q
         Ue3k+XcVojPk8kLDUKOtVujRenGJj934O2TMoRZpXcQaMs2ia/ubOf6n29q+yFEBgLCq
         WXM1QhX7TNV9CHZujOG51pqgPufsKAasGI/r0aur8AUY5qv7NQFp6evQvTTTOd1uV4EP
         +tOw==
X-Gm-Message-State: AOJu0YyowhQ8APIdfByB7EV6eao7rtH123sy4GbZVSQsC9TVLGlj/3O+
	M4pt1Gf5TWfb+XxvIHZgLh4BtRl/C5YR4CinkEmT57HbkW1BrIhaYTq9o098M6ZqnC+mN8E25pO
	i+XrClUYlmnJb/N0xmBrRxGnQNtqfZBo=
X-Gm-Gg: ASbGncteBKKnRqJXlrdwBj0dG0Jgmk6YxYAiGrFrygptHU+RRQ87D0CDDzbzc8huvD1
	rhcBBGHCQZWCJzb7cQXeCAVyTfA7EY76RBpM9st1iMd7h1i6EjI7R29RrSSerJuhMbkt523CJ2k
	LnW7HiifEutI7wo5qgQR/kGaOvCXILHFP1
X-Google-Smtp-Source: AGHT+IFJEMD1jYgSYWQxpXp6XU/BOcSXWQs+ShNllsWbxRmZcGav0ExxY+ZD+Gm6a6Yr1+brwgDCqVc7YNnTc8BXPXs=
X-Received: by 2002:a05:6871:7b81:b0:2d4:ce45:6987 with SMTP id
 586e51a60fabf-2e3c81f8f20mr11803864fac.9.1747811848957; Wed, 21 May 2025
 00:17:28 -0700 (PDT)
MIME-Version: 1.0
References: <20250519141525.3708957-1-jeroen@myspectrum.nl> <20250519141525.3708957-2-jeroen@myspectrum.nl>
In-Reply-To: <20250519141525.3708957-2-jeroen@myspectrum.nl>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 21 May 2025 00:17:03 -0700
X-Gm-Features: AX0GCFt2BlGbETo6XhfjIyXLOpZnSR6kbWNmQhXxbohJjTqOO3PHAn9VSsRkddY
Message-ID: <CAMKF1sr_Ss+P2XnuwnJZ+5ZoJY_68+q-5Q0UwJfpR6XBaxsEbw@mail.gmail.com>
Subject: Re: [oe][meta-oe][PATCH 2/2] socketcand: add recipe
To: jeroen@myspectrum.nl
Cc: openembedded-devel@lists.openembedded.org, 
	marc Kleine-Budde <mkl@pengutronix.de>, Jeroen Hofstee <jhofstee@victronenergy.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 07:17:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117526

Fails to build with gcc-15 -
https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/2442453/raw_inlin=
e

On Mon, May 19, 2025 at 1:34=E2=80=AFPM jeroen via lists.openembedded.org
<jeroen=3Dmyspectrum.nl@lists.openembedded.org> wrote:
>
> From: Jeroen Hofstee <jhofstee@victronenergy.com>
>
> Socketcand allows to transfer socketcan messages over tcp/ip.
>
> Signed-off-by: Jeroen Hofstee <jhofstee@victronenergy.com>
> ---
>  .../recipes-extended/socketcan/socketcand_git.bb | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>  create mode 100644 meta-oe/recipes-extended/socketcan/socketcand_git.bb
>
> diff --git a/meta-oe/recipes-extended/socketcan/socketcand_git.bb b/meta-=
oe/recipes-extended/socketcan/socketcand_git.bb
> new file mode 100644
> index 0000000000..764a87f874
> --- /dev/null
> +++ b/meta-oe/recipes-extended/socketcan/socketcand_git.bb
> @@ -0,0 +1,16 @@
> +SUMMARY =3D "Socketcand, socketcan over tcp/ip"
> +LICENSE =3D "GPL-2.0-only | BSD-3-Clause"
> +LIC_FILES_CHKSUM =3D " \
> +    file://LICENSES/BSD-3-Clause;md5=3D4c00cf8b0a04a9441d8fa24850231d00 =
\
> +    file://LICENSES/GPL-2.0-only.txt;md5=3Df9d20a453221a1b7e32ae84694da2=
c37 \
> +"
> +
> +SRC_URI =3D "git://github.com/linux-can/socketcand;branch=3Dmaster;proto=
col=3Dhttps"
> +SRCREV =3D "7b5e91ec656b33c325db2f9136daebb9e357bb65"
> +S =3D "${WORKDIR}/git"
> +
> +inherit meson pkgconfig
> +
> +PACKAGECONFIG ?=3D "libconfig libsocketcan"
> +PACKAGECONFIG[libconfig] =3D "-Dlibconfig=3Dtrue,-Dlibconfig=3Dfalse,lib=
config"
> +PACKAGECONFIG[libsocketcan] =3D "-Dlibsocketcan=3Dtrue,-Dlibsocketcan=3D=
false,libsocketcan"
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#117480): https://lists.openembedded.org/g/openembedde=
d-devel/message/117480
> Mute This Topic: https://lists.openembedded.org/mt/113200001/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

