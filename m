Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AB23CAC5B8
	for <webhook@archiver.kernel.org>; Mon,  6 Oct 2025 15:56:30 +0000 (UTC)
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
 by mx.groups.io with SMTP id smtpd.web10.37508.1759766184962206422
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Oct 2025 08:56:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Req4/kLz;
 spf=pass (domain: gmail.com, ip: 74.125.224.42, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-633b87e7b9fso4745369d50.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Oct 2025 08:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759766184; x=1760370984; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zJjE3M7HvGukZkIdwx867aq9KwkwAhUTuMkOb4rNKxw=;
        b=Req4/kLzKKgDdamODzFAgIno468uav37hP1WcprMmO2AuW7KpUai/0wxhcvf4Mioku
         NGiO5a2ifAPPdDpLpfdLBCzCReISwzd6E6pCXkTIJPu8ZibHt/Dh86TjqnA02sX4oHhC
         PTD4WP5cS9mL6O7Tmmg4FK+p7OKUtXd/HFoMS1JvsNHw3dYtz6lq9WubfAVHbNLLhPPm
         BUdYDYmP5rWvIquaW4PVadDo0eTSPVhI2rzUKmKXINuKGXzwU5K6DNLXUj4vRsHM1Jzi
         OiREwgeVrQiFCZmyLGtQAW3SZNeLh5+ODTAFQIa6gQFQi7iaXagykAYokA/DzBBzESV4
         iUQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759766184; x=1760370984;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zJjE3M7HvGukZkIdwx867aq9KwkwAhUTuMkOb4rNKxw=;
        b=k4cL/K2YjTCeaqp0uVLQoZ5knaWlxxCz8aw1G+y1woAxvEPbRSj0dlhPHnRf0OQTws
         3ZNUdkIo4Y/9oBKzMPuL+koQtjyi1yCx8ZrqSgYHn8MVqvjby+0SeROUQKlPQZcTm+3L
         Z0mzbi7g+5txBXY6+NL3Stl1GWCQJJ1ml0C9teOqbeswXmkMWdm/thYAfCo9jAncV4NO
         RXxEWnHw4cWyZi2wsTIJTNf9LkCVhovmnKtxECNp0mN5BbrbCYgSgJIduXB+CVN0+Zcq
         RxXyEG0E147KSm9BNGl3/saVSC60OUf7hjmiVIeqje+bDwXeMrhffj3AOoaw4VWPYyyn
         utow==
X-Gm-Message-State: AOJu0YzE2I2Yms2RDp9KkH5b1kIa8CZWhQYZ5s7Dj8NkvKppcR4Uy+Rw
	v7tvBWu68zlluzMP+ONTqyDQB/Eg1aJl0JXSPPlAbKyLOGg+OxAI/Z1a1GlAuCbXISxuq6AHrUu
	jMoxeP0O/E1OUXaNmZVTbCWARBV7+qMTaQfXqifk=
X-Gm-Gg: ASbGncsvenz5qKyvDgY4ijuO3wa6NBLLd3v4KRAqB9MAsxn+HELdzZLaBnTWdJaVJ76
	fnsaPGDFwzgi70aQ1b+xpl38v4g8f/H1cEB69q+fSvVTNgOvb6VlSnKOiJ/tw2JKjdux88P3j9t
	Ut7mPjC7h8ewjgFRRll7lY0f8o14ZS0gP63BXpBbENAqmg+75Ur3SgD9iNGMNGK4QiRFxH5GMR1
	Qr1gf0dtfNmX91sE3WvfVOEo2zAtl3S8taTKE/VIaEaRZZqNBll5UolusA3MPqgT3Wf810SkAoh
	q6a5UN8PAfcyqbjJjECoP0VZ4xGMXjQgurUseqWCL/RDLiWNGXQLX73iCNfV85l9LzG5WF8BwRN
	9IIZqcJegJ/PrlGEQ
X-Google-Smtp-Source: AGHT+IESewRahx5MdA56PUGEYk87oHb4Fp25vc49IvkhIiOVlf91s/BNxMbiP317WFuL62ZFss42/duN7eZXeNAdaj0=
X-Received: by 2002:a53:4203:0:b0:632:eae9:5cfb with SMTP id
 956f58d0204a3-63b9a0eccdfmr8344030d50.29.1759766183896; Mon, 06 Oct 2025
 08:56:23 -0700 (PDT)
MIME-Version: 1.0
References: <20251003100049.1695-1-joao.lima@hbkworld.com> <20251003100049.1695-2-joao.lima@hbkworld.com>
In-Reply-To: <20251003100049.1695-2-joao.lima@hbkworld.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 6 Oct 2025 08:55:57 -0700
X-Gm-Features: AS18NWC_SsxstDf8gcDg2OOqzASAa5IrjKUHE7pIZIESpfK5jdRXiPazUrE0SHY
Message-ID: <CAMKF1sp77Rzw-75wG3tMOLV_ANOGgTwK5XQGdVucPY1_Jt33ow@mail.gmail.com>
Subject: Re: [meta-oe][PATCH 1/2] openocd: bump the openocd, jimtcl versions
To: =?UTF-8?B?TGltYSwgSm/Do28=?= <joao.raul.434@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, joao.lima@hbkworld.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Oct 2025 15:56:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120302

This fails to fetch see
https://errors.yoctoproject.org/Errors/Details/884640/

maybe using GH mirror - https://github.com/openocd-org/openocd
using

MIRRORS +=3D "http://repo.or.cz/openocd.git/
https://github.com/openocd-org/openocd \n"

might be good to have for fall back.

On Fri, Oct 3, 2025 at 3:02=E2=80=AFAM Lima, Jo=C3=A3o <joao.raul.434@gmail=
.com> wrote:
>
> From: Joao Lima <joao.lima@hbkworld.com>
>
> Version bumps:
>    - openocd: 91bd431 -> 66ea461
>    - jimtcl: fcbb449 -> f160866
>    - libjaylink: 9aa7a59 -> 0d23921
>
> Signed-off-by: Joao Lima <joao.lima@hbkworld.com>
> ---
>  meta-oe/recipes-devtools/openocd/openocd_git.bb | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta-oe/recipes-devtools/openocd/openocd_git.bb b/meta-oe/re=
cipes-devtools/openocd/openocd_git.bb
> index 3bbe33ca1d..3b7705c41d 100644
> --- a/meta-oe/recipes-devtools/openocd/openocd_git.bb
> +++ b/meta-oe/recipes-devtools/openocd/openocd_git.bb
> @@ -13,10 +13,10 @@ SRC_URI =3D " \
>  "
>
>  SRCREV_FORMAT =3D "openocd"
> -SRCREV_openocd =3D "91bd4313444c5a949ce49d88ab487608df7d6c37"
> +SRCREV_openocd =3D "66ea461846a3a4a96687c9287c3f61ae8ce0b775"
>  SRCREV_git2cl =3D "8373c9f74993e218a08819cbcdbab3f3564bbeba"
> -SRCREV_jimtcl =3D "fcbb4499a6b46ef69e7a95da53e30796e20817f0"
> -SRCREV_libjaylink =3D "9aa7a5957c07bb6e862fc1a6d3153d109c7407e4"
> +SRCREV_jimtcl =3D "f160866171457474f7c4d6ccda70f9b77524407e"
> +SRCREV_libjaylink =3D "0d23921a05d5d427332a142d154c213d0c306eb1"
>
>  PV =3D "0.12+git"
>

