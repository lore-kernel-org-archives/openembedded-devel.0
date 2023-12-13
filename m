Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B24F0C4332F
	for <webhook@archiver.kernel.org>; Wed, 13 Dec 2023 18:47:04 +0000 (UTC)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
 by mx.groups.io with SMTP id smtpd.web10.44748.1702493221529896704
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Dec 2023 10:47:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TD0vdCv4;
 spf=pass (domain: gmail.com, ip: 209.85.210.51, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-6d9d209c9bbso5838728a34.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 13 Dec 2023 10:47:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702493221; x=1703098021; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JyQjkU5OjPRj6gt3Q1aD1bQk5qiHuBIpocxRpMCyahU=;
        b=TD0vdCv4E9PFhW2/MKlBKfvfLJ0L2YnBWeVrA1y8drpq+H/bqol7S+GLMdpGv72PUS
         eRRS0zm87v8F8GpMENzIFfY1gSBD7MCCeH+vrSWTVPUSHU+8MMgwGFcjBadrBEfOmkWL
         B9nBp8OhDJPxWNF+ppOkwMYI/56SKUVMvWFMqC6u8tsB+dSH2HMfoErljxPcTF/BQm20
         4HSzb4hDVgxyHayopMkyd5f/4+kjhNax1VjemPj95jpTG29pnmn4/1tWuoAWqDVFXpjD
         ZX9ETDmmsqav8ExvvgnLo8pcqO5setrEXEVkcMabuOruQnEtqNHGNmUcFa7QrIUEQM/5
         8WoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702493221; x=1703098021;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JyQjkU5OjPRj6gt3Q1aD1bQk5qiHuBIpocxRpMCyahU=;
        b=BStIIEhEVJdUCc/r35o4480lyVwQhB8fBvjLrdtgeI9B/iqX6CwsDQjFk6nCCcsc3a
         xm1WlwH34Xl/wgK5u/BTa7P/SxzFVULBT6J7WhtBv6QMVs3m8njLdLOEj0znHKeqEtgR
         m1A0RMVhcYdAmynHH88EP4TPnZDQJcT7gccE9+wYS9nkPb9IDeaj+8wg9PDze26tKDqN
         w8JsCDJ+XI3pB6Bqx3oxkE3qvDoPLMKljQQsntGpSj7HikLMntJOAljt5NHiaUVMmN3U
         4ywdFqTMcLQiC4BljtHiIE+jZtf6Wf8pfvM0H+t7nSmWyhRI82EghBhJqkCML61Cx2g+
         sw2A==
X-Gm-Message-State: AOJu0YwlX8mANV54B3bRW9k+eJ4QU19Bli8nxW1Rh9wbdusU0W3wCYs/
	oKMbN9EMLD8jvPvbu2FsX0JihRPHEGim+cpJ3O4=
X-Google-Smtp-Source: AGHT+IGI60E43UP+m0Jj+PPp6grJ75SvxoqPqvR489izUorvWUhUE02GuVpLTYE9pZX6cmsJLc6BmsRCSpcNIXq4MCA=
X-Received: by 2002:a05:6870:9f14:b0:1fb:75a:de6f with SMTP id
 xl20-20020a0568709f1400b001fb075ade6fmr11031020oab.93.1702493220678; Wed, 13
 Dec 2023 10:47:00 -0800 (PST)
MIME-Version: 1.0
References: <20231211131938.127747-1-alexandre.belloni@bootlin.com>
In-Reply-To: <20231211131938.127747-1-alexandre.belloni@bootlin.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 13 Dec 2023 10:46:34 -0800
Message-ID: <CAMKF1souk89CZBBCjM3W=-cZYYmyvyrtV-U8t2i0Zs26fwJOcA@mail.gmail.com>
Subject: Re: [meta-oe][PATCH] poco: fix branch
To: alexandre.belloni@bootlin.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 Dec 2023 18:47:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107396

Hi Alex,

Thanks for the patch. I did not take it since there already was
another upgrade patch [1] proposed which fixed this issue as well.
Please report if this issue still persists

[1] https://git.openembedded.org/meta-openembedded/commit/?id=3Dbcc76585519=
c98a753cf90fa16b497be2c11f2d1

On Mon, Dec 11, 2023 at 5:19=E2=80=AFAM <alexandre.belloni@bootlin.com> wro=
te:
>
> From: Alexandre Belloni <alexandre.belloni@bootlin.com>
>
> The current SRCREV is not on any branch anymore, switch to the 1.12.4
> branch HEAD which is similar and the only change is irrelevant.
>
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> ---
>  meta-oe/recipes-support/poco/poco_1.12.4.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-oe/recipes-support/poco/poco_1.12.4.bb b/meta-oe/recipe=
s-support/poco/poco_1.12.4.bb
> index 12532e4ef1b8..96817c140e76 100644
> --- a/meta-oe/recipes-support/poco/poco_1.12.4.bb
> +++ b/meta-oe/recipes-support/poco/poco_1.12.4.bb
> @@ -8,13 +8,13 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D4267f48fc738=
f50380cbeeb76f95cebc"
>  # These dependencies are required by Foundation
>  DEPENDS =3D "libpcre2 zlib"
>
> -SRC_URI =3D "git://github.com/pocoproject/poco.git;branch=3Dmaster;proto=
col=3Dhttps \
> +SRC_URI =3D "git://github.com/pocoproject/poco.git;branch=3D1.12.4;proto=
col=3Dhttps \
>             file://0001-Use-std-atomic-int-instead-of-std-atomic-bool.pat=
ch \
>             file://0001-cppignore.lnx-Ignore-PKCS12-and-testLaunch-test.p=
atch \
>             file://0001-Fix-data-race-when-create-POSIX-thread.patch \
>             file://run-ptest \
>             "
> -SRCREV =3D "1211613642269b7d53bea58b02de7fcd25ece3b9"
> +SRCREV =3D "3572a1fb981672e2cd1d2533ffd836da7db0f414"
>
>  UPSTREAM_CHECK_GITTAGREGEX =3D "poco-(?P<pver>\d+(\.\d+)+)"
>
> --
> 2.43.0
>

