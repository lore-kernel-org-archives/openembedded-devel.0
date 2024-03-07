Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BD93C54E41
	for <webhook@archiver.kernel.org>; Thu,  7 Mar 2024 00:17:16 +0000 (UTC)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
 by mx.groups.io with SMTP id smtpd.web10.11670.1709770634984391669
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Mar 2024 16:17:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jf1VYpVS;
 spf=pass (domain: gmail.com, ip: 209.85.167.182, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3bbd6ea06f5so178991b6e.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 06 Mar 2024 16:17:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709770634; x=1710375434; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JdJYz4JMGiiV7+8GqtBLrGnIQhyjSRGNmm0N9ElEE/k=;
        b=jf1VYpVSnZa0PhK9ldVQF3bZTMXrqHnSAu/x+99kXeMiRTE8iKhTxSYD8+ImAxnYVv
         W+e1wH9Dx0BGi+HVXM3niYCwuMrxf8V0fIiBKa9/sBJ8Pkzl55aDiMbH76BkVeWusoIR
         PfdJAw2BNkH02dwmamtW4+BpWpmDBcqYN0RjjZ+JWhsSBG5HDnt56xcDNdZDpwii2ei8
         GqHMxXgZQRxyhJ6cg0VaeOGJcBXSMzkbJiB71GdaE3XpVV8rFWtnv7xkwq62W5uABaUV
         WcS/S4qMemj4LlSKO6Db0uGHYM7eG9QKkmd8zcq5cPzAlCL4KHrexqs5wUOT8SYOpw8D
         sHjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709770634; x=1710375434;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JdJYz4JMGiiV7+8GqtBLrGnIQhyjSRGNmm0N9ElEE/k=;
        b=KA6jjlytX75OuEITHC6BfhgkSAeVNYg3mzUmnz6VftxOugc1fNB/s2mD5FpH2Urm2V
         jJMdXtg8hjDKlZcXBwVSn9J7GxdjHUWU36lKE3LFIBrdkfwLJhfV+/gjpAuLfzFJRMUS
         iR+vdFXmLumYO0gybk7CSEvC5OMR8kzQXnSucZziJ0wbSnqCHNS2H51oLW+BDxrNJ9Bq
         9sjd0zSNwsZdPJlGxJSFtucn5oJNyf+ImGAJ49Ws15/L6hnZ3+J/rcQ1cophcy0ZTFjJ
         7wdCSvWrUikNdo8IjlAr7nrkovYBbCARnXf/FjDrJcxk5uDzxGIZJ7Ofr55GV/JSmaN9
         4P8g==
X-Gm-Message-State: AOJu0Yz3+32pVxMVWoa6/u/AixFduH5NNIi/OtG0eFrSz3cNeR77UIps
	5k95W71005uEHIOCG0dSaZ1EEV2rtajOc9ZvqQFgwmsIslRsTDHQUcRmmtO53+yQHvv4iB19Mci
	Q35y+QwZinvEUfDkk7Oq1plt9BRRfGa8O
X-Google-Smtp-Source: AGHT+IFKNIW1BCegOo37n27JonHEdwKllNJfu2iroG7eWeabbbdOihEmkzmB53ppGnXdUm4wI1hRMR9auIbPuV15iek=
X-Received: by 2002:a05:6808:21a0:b0:3c2:273e:867c with SMTP id
 be32-20020a05680821a000b003c2273e867cmr60602oib.15.1709770634123; Wed, 06 Mar
 2024 16:17:14 -0800 (PST)
MIME-Version: 1.0
References: <20240306222329.1876779-1-joe.slater@windriver.com>
In-Reply-To: <20240306222329.1876779-1-joe.slater@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 6 Mar 2024 16:16:48 -0800
Message-ID: <CAMKF1so-_ghCRcADLNWw-nfoLov2yD=XBFK-7VAjic22JoQVbg@mail.gmail.com>
Subject: Re: [oe] [v2][meta-oe][PATCH 1/1] googletest: allow for shared libraries
To: joe.slater@windriver.com
Cc: openembedded-devel@lists.openembedded.org, randy.macleod@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Mar 2024 00:17:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109183

I accepted v2, can you rebase this on top of master and resend the delta as=
 v2?

On Wed, Mar 6, 2024 at 2:23=E2=80=AFPM Joe Slater via lists.openembedded.or=
g
<joe.slater=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Joe Slater <joe.slater@windriver.com>
>
> Add a PACKAGECONFIG option to produce shared libraries.
> Change the -dev RDEPENDS because -staticdev is not created
> if shared libraries are built.
>
> Signed-off-by: Joe Slater <joe.slater@windriver.com>
> ---
>  meta-oe/recipes-test/googletest/googletest_1.14.0.bb | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/meta-oe/recipes-test/googletest/googletest_1.14.0.bb b/meta-=
oe/recipes-test/googletest/googletest_1.14.0.bb
> index 8c75f936de..e9df082d32 100644
> --- a/meta-oe/recipes-test/googletest/googletest_1.14.0.bb
> +++ b/meta-oe/recipes-test/googletest/googletest_1.14.0.bb
> @@ -10,12 +10,20 @@ S =3D "${WORKDIR}/git"
>  SRCREV =3D "f8d7d77c06936315286eb55f8de22cd23c188571"
>  SRC_URI =3D "git://github.com/google/googletest.git;branch=3Dmain;protoc=
ol=3Dhttps"
>
> -inherit cmake
> +inherit cmake pkgconfig
> +
> +# allow for shared libraries, but do not default to them
> +#
> +PACKAGECONFIG[shared] =3D "-DBUILD_SHARED_LIBS=3DON,-DBUILD_SHARED_LIBS=
=3DOFF,,"
> +
>
>  ALLOW_EMPTY:${PN} =3D "1"
>  ALLOW_EMPTY:${PN}-dbg =3D "1"
>
> -RDEPENDS:${PN}-dev +=3D "${PN}-staticdev"
> +# -staticdev will not be implicitly put into an SDK, so we add an rdepen=
d
> +# if we are not building shared libraries
> +#
> +RDEPENDS:${PN}-dev +=3D "${@bb.utils.contains("PACKAGECONFIG","shared","=
","${PN}-staticdev",d)}"
>
>  BBCLASSEXTEND =3D "native nativesdk"
>
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#109181): https://lists.openembedded.org/g/openembedde=
d-devel/message/109181
> Mute This Topic: https://lists.openembedded.org/mt/104776601/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

