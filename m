Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42A1BCD1284
	for <webhook@archiver.kernel.org>; Tue,  2 Apr 2024 18:24:24 +0000 (UTC)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
 by mx.groups.io with SMTP id smtpd.web10.2685.1712082259406408314
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Apr 2024 11:24:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QmhyF8UE;
 spf=pass (domain: gmail.com, ip: 209.85.160.45, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-2282597eff5so4147104fac.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 02 Apr 2024 11:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712082258; x=1712687058; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nLFOu/3B8bl8mrKKTwqOx0+68hKJbqBubLBFUD8UYNw=;
        b=QmhyF8UExu5o0dUF1sbkKQyHOs0xIJe711nO4pODjaJVrGkLBD6reRe1OjIpBpgfcJ
         H++TkMxOufYsiENoiVT5Ms5kfLTTJwyG7pFb6IScL+lfvdKuVOljvRYucZ5kl4mr/ahy
         +J6WHI+ZOPTQiyhKW+IKi1LV+nHSZoyLWy2QlwmmxgMCRlLbZzVE82aWUWTe8QlnuEQl
         yGp3UvPPC0iticzTLUunNCDwlgIcX2W+jFfsY7sCd3o3+k266Oq9jKXpR8CTvBXVR7iy
         Jby5ukwWH5RGgn//d7jsbLrZ6y467hLIv2x7OZpn2UChJZ+Vh4drijqAJWEQ3xzGNWMW
         U1QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712082258; x=1712687058;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nLFOu/3B8bl8mrKKTwqOx0+68hKJbqBubLBFUD8UYNw=;
        b=bTNl59F/sVU+XWzLmByQFzODqqfBlSpM4aquXdYYiq1W8xqX8cQB5l2XRKTCDrDm1Q
         W0T/gzb79bl2tHr+y/wTg3urkf2AlY2YmniyitlC0I6MWzdhXQuTCziDhTJmEZl02RX0
         WCGnEKgYVOoJH5mH6lsyWXiPp587OL61xE5VhiH3IepPzFq1aVlR/1hwJS2rUwF0K3Pm
         OmTu5saKRCrRqRGiHE/MgXsSX605jZa87wydDBk6B3neJB77/t8Ee5UjHCZ5k37M2Jdi
         PMjUZ5OF7/INeI5j/1u1UudEKoQ4fgLpB1gmrU5iDcNzolqYqt2HulU7akeXAui+bAnx
         eA3w==
X-Gm-Message-State: AOJu0Yynu9ZKsVhi/A4nQWKKD8eHYm4tBVxIv838Vr7j5aufNmPJp7MR
	JKQ2FFyayL1zKTBF1y17uOFxgKb8JA7lzxiwsxe2UmcH3wE+klM779eXu88E3eCMOPyIRz12fOb
	CDdyoUgEXPhhVHouYfZZ+rQp3wX4=
X-Google-Smtp-Source: AGHT+IEUz4+IwqyeDaC+gUeLqpjHjay5HwS/sxLfpi7S6esb+w0GGxmyXby5zId3cMXPlw5wKGmgJIHXKB9F8hAl4yU=
X-Received: by 2002:a05:6870:858b:b0:22a:516b:2284 with SMTP id
 f11-20020a056870858b00b0022a516b2284mr14152424oal.30.1712082258628; Tue, 02
 Apr 2024 11:24:18 -0700 (PDT)
MIME-Version: 1.0
References: <20240402080426.28248-1-f_l_k@t-online.de>
In-Reply-To: <20240402080426.28248-1-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 2 Apr 2024 11:23:52 -0700
Message-ID: <CAMKF1soKVnqALOdcWcjOrfNddJSbSxAJk9ja6-M6eJOwzVtM-Q@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] highway: add recipe
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Apr 2024 18:24:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109788

On Tue, Apr 2, 2024 at 1:04=E2=80=AFAM Markus Volk <f_l_k@t-online.de> wrot=
e:
>
> add google highway as a dependency for libjxl
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  meta-oe/recipes-extended/highway/highway.1.1.0.bb | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>  create mode 100644 meta-oe/recipes-extended/highway/highway.1.1.0.bb
>
> diff --git a/meta-oe/recipes-extended/highway/highway.1.1.0.bb b/meta-oe/=
recipes-extended/highway/highway.1.1.0.bb
> new file mode 100644
> index 000000000..ec9d8f742
> --- /dev/null
> +++ b/meta-oe/recipes-extended/highway/highway.1.1.0.bb
> @@ -0,0 +1,15 @@
> +SUMMARY =3D "Highway is a C++ library for SIMD (Single Instruction, Mult=
iple Data)"
> +HOMEPAGE =3D "https://github.com/google/highway/"
> +
> +LICENSE =3D "Apache-2.0"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D2b42edef8fa55315f34f2370b4715=
ca9"
> +
> +inherit cmake
> +
> +SRC_URI =3D "git://github.com/google/highway.git;protocol=3Dhttps;branch=
=3Dmaster"
> +
> +SRCREV =3D "58b52a717469e62b2d9b8eaa2f5dddb44d4a4cbf"
> +S =3D "${WORKDIR}/git"
> +
> +EXTRA_OECMAKE =3D "-DBUILD_TESTING=3D0 -DCMAKE_BUILD_TYPE=3DRelease"
> +CXXFLAGS:append:arm =3D " -mfp16-format=3Dieee"

This is a gcc specific option and not supported by clang, however
clang defaults to ieee format for
__fp16 so this works without specifying this option in case of clang.

> --
> 2.44.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#109777): https://lists.openembedded.org/g/openembedde=
d-devel/message/109777
> Mute This Topic: https://lists.openembedded.org/mt/105283871/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

