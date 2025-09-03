Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E660CA1009
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 18:12:54 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.web10.20090.1756923169102515027
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Sep 2025 11:12:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bK1ke7T+;
 spf=pass (domain: gmail.com, ip: 209.85.128.182, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-72267c05111so2288017b3.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 Sep 2025 11:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756923168; x=1757527968; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pGjJJ67MExfxwfmmZEliHdPb0GbSXFds6u9t96wp2SA=;
        b=bK1ke7T+hpmRgfbFlTUp+F9Tfuh3j+pWKtwgXEX+DlGWq8bpSIiYjuSjIm/zRWx1Rk
         2QqWxxu9wC0e7RmsquSdr4wHo3lVuHPDA0E2U1fTG7qdRR8t+JYoBp2YAWjsx337IcNI
         sOMOZsVE6jEwmFqwEz7voHNHAR4qhVdDtyrCqchMRumAH3d2G3tYO61Jk9KUcR4mp2Nc
         /GICgrQNOsmRklQO7tdoSooCj0/1NrRX5QUIpe2SsNt92wVvjBTIYeBae+CMbT2MpaEA
         HkC0ulg/78OwL5o0Uxs79Fj60a3bLoZzZ5CEbyTQhmIrM2vZ4Kzjn+yXkYWAg+JCIIeD
         q5Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756923168; x=1757527968;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pGjJJ67MExfxwfmmZEliHdPb0GbSXFds6u9t96wp2SA=;
        b=R6Kxrjhu0mERoLRSieR6RYn05ED1MMPLaNb/EcIcjAqpH24qFh5E6YjOdnLerJZnU8
         G9C8esBu3a1Q9ex1Yj6X2zRbrFhZH9F/D15UDcCcXKcxdtDuH5K4H+PxnXBDqokeVCHs
         9MSiicbukNG+uGXe039zEvTW0eH3N/+negNHpso7q4HNGxuDD8jlEJO0Q+yMDJvgTj28
         a7B3RRMH/aSeqIagoglmi0gldp0UNO0NNqsh4AEvZ8dFL1ZnoFrEneyIQxqsjpwGBDXt
         JtH1uhWu1vUS780yr3/YZ4jhoj1W9KHFUb3IdYPVbQ16G3+VWoZhDe7bHrhMyxKO9bnK
         h1Ng==
X-Gm-Message-State: AOJu0Yz32gL9V5d1a9KEAzROUoobtijNKbVgMcSgwkFp/11DgGhSkrAV
	B1s0OkY1JTzCtOwfL9aBvOiXplxZZLgYg/g8e8zgsRkyrmaiuU7QqryTe1EtZqPneX4+IQzVNzA
	S64Qn3dO+mMxC+goMfdvWGhEumSr488OrDxOD
X-Gm-Gg: ASbGncub5Lfg98oAIBlwsdBLHzYrUqbPuzCh5HG0eV5OFz4/9LVPpYCY82yTIrG2K3l
	ZnUBQqPoP7/tSG9T8QZNOSi94DAvRPYcU7fQ4Wnx5DSjbwCfoA7p8AaaYNAiE/p5n04Rck/aTSx
	2d0J6W/0sSrZR3mKZuvogN6AFT6kDo6eEqYJjGuU/Jz2dsF+iVXwNhBNt1bw1SsvlvmPskOVi4q
	lSqx9nOeturf0v2FytBxCuqA2HsPeDLDLlIyPoC/eiCJzHb2PYf6B8ZhnYNnIZdAxT7ySVqMjVc
	1NNJxbHEaAxcvZV3c9p5K4H77hXC6xRm64a1uBVQMFIbTfSf+NO/gWRjVf3ONw+U
X-Google-Smtp-Source: AGHT+IH9aUM8VV44SWtqaunAtoPoVvEDKJgv+qIYk49zkB1MTJXteRpt0GfknhYPiLhKsZ8Q7YB7AihLXgs5Az8dk3k=
X-Received: by 2002:a05:690c:4a06:b0:724:b868:d543 with SMTP id
 00721157ae682-724b868f9ecmr17758817b3.41.1756923168048; Wed, 03 Sep 2025
 11:12:48 -0700 (PDT)
MIME-Version: 1.0
References: <20250903180932.3069839-1-mail@michael-fitzmayer.de>
In-Reply-To: <20250903180932.3069839-1-mail@michael-fitzmayer.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 3 Sep 2025 11:12:22 -0700
X-Gm-Features: Ac12FXxTI3r5d2B-nTqjdSXLLMKRhNg8169VyUsSTd7FYgWJthPS2UwtiyyKUyM
Message-ID: <CAMKF1sq-jwOYHSYbfAyDgZFAbwFTAYps1OQCbT5a0rpNsn2fRg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] pocketpy: Upgrade to 2.1.1
To: mail@michael-fitzmayer.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Sep 2025 18:12:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119264

On Wed, Sep 3, 2025 at 11:10=E2=80=AFAM Michael Fitzmayer via
lists.openembedded.org
<mail=3Dmichael-fitzmayer.de@lists.openembedded.org> wrote:
>
> Signed-off-by: Michael Fitzmayer <mail@michael-fitzmayer.de>
> ---
>  .../pocketpy/{pocketpy_2.0.6.bb =3D> pocketpy_2.1.1.bb}     | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>  rename meta-oe/recipes-devtools/pocketpy/{pocketpy_2.0.6.bb =3D> pocketp=
y_2.1.1.bb} (86%)
>
> diff --git a/meta-oe/recipes-devtools/pocketpy/pocketpy_2.0.6.bb b/meta-o=
e/recipes-devtools/pocketpy/pocketpy_2.1.1.bb
> similarity index 86%
> rename from meta-oe/recipes-devtools/pocketpy/pocketpy_2.0.6.bb
> rename to meta-oe/recipes-devtools/pocketpy/pocketpy_2.1.1.bb
> index f3ffccf626..c5fc4f0f6e 100644
> --- a/meta-oe/recipes-devtools/pocketpy/pocketpy_2.0.6.bb
> +++ b/meta-oe/recipes-devtools/pocketpy/pocketpy_2.1.1.bb
> @@ -11,14 +11,18 @@ HOMEPAGE =3D "https://pocketpy.dev/"
>  BUGTRACKER =3D "https://github.com/pocketpy/pocketpy/issues"
>
>  LICENSE =3D "MIT"
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D8cdfa87bc5e09bc07f8cf64135026=
d91"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc292beb20a17db07c359b0cc2c039=
027"

Please describe what changed here, in License-Update: tag in commit msg.

>
>  SRC_URI =3D "git://github.com/pocketpy/pocketpy.git;protocol=3Dhttps;bra=
nch=3Dmain"
> -SRCREV =3D "8a3bdd7e0a43b44e3b32548543128d95e68a3802"
> +SRCREV =3D "b6a6aa85a6cbfe0427b48e523d53ee3832bf5bd2"
>
>
>  inherit cmake
>
> +EXTRA_OECMAKE =3D "\
> +    -DPK_ENABLE_OS=3DON \

why is this change needed?

> +"
> +
>  CFLAGS +=3D "-fPIC"
>
>  do_install() {
> --
> 2.47.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#119263): https://lists.openembedded.org/g/openembedde=
d-devel/message/119263
> Mute This Topic: https://lists.openembedded.org/mt/115050209/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

