Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
 by mx.groups.io with SMTP id smtpd.web11.11050.1586531997957993741
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Apr 2020 08:19:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KuAKfuW1;
 spf=pass (domain: gmail.com, ip: 209.85.222.194, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f194.google.com with SMTP id l25so2449390qkk.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 10 Apr 2020 08:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=PYJVuMOuVizYqkQpqEDfRpFMAQlbf0/N2AVAbmqYSQI=;
        b=KuAKfuW17wpTTLvACJAXcEaCjmpYuRA4Ld5jC0LcvtQPJyy7nfre+kGTpNzXkx2Mez
         s/rtYIZQDBEu8OYPjARZbaTkeRTAYhdqA7HVtdE0PtfOmRaF9RPCQ67AX8ySvM9jEMwH
         kHf7pNBMMI0iHDQ4pSH41IXiulVsJPfDrlW1Y8VjoYlAbFokDSCJr3EEl7dtoEgci8HV
         v5hwA2QbF7PnibImC1DDMX6euxbPLCKZUq3QwkENiN0kjmPsu2MHRCMVniqwQyCel+1x
         85wnrTLz9258gkzRZJLsdMYVOwl7WWe+bWEHnYsyEOvW5pq7CVq2XvZApq6YSt4nPwWr
         tQqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=PYJVuMOuVizYqkQpqEDfRpFMAQlbf0/N2AVAbmqYSQI=;
        b=bJjG7gVxB/ykaGUN0TK8JB/DIeMT+EMpaRFF51eK1n2aEcsmRbqj3BuQp6E5w9Z1rM
         tzBvy0QpOHc+0pmhCvBpJJjZF8W++mGTN4RVe5TIM3Ys4ExmK2SKayOjMN935Itn9BJk
         f4vW0BW3CwvoO13X6hTpuMM+x7yGtkLHf1bmTeFG4pRxjtgRjPEyFqv7rTlgmeORBq13
         h6cvgba8YG3c83vehyydBUk2Xytv0ezo9TUmeOP0E4k9TLaOC4+Kj1bSonU/529Xyyky
         kOlxKpPEnpTFYKNai9KDVpk6YIShDvMRvS1clbwFuq+hilYmIiAqgUXGvCzjLmBPxLRi
         qO+w==
X-Gm-Message-State: AGi0PuY9yPDXMDoawrxZGPgCDzTJw0Ka9d7/PLCXblJSKrvbvqdxOl0S
	uX8ydBc0hvwB8pPFcmlHsX5dyT26fkCoZJQrFZY=
X-Google-Smtp-Source: APiQypKuU6dGibJVXVBnli1/Z9sQvbbGSWe2QVGMM631evHh19xAdyTwN/Fsj3AdAr/jKh5r6xzjZ6Q+LURi+ww96dI=
X-Received: by 2002:a05:620a:1eb:: with SMTP id x11mr4518684qkn.225.1586531996844;
 Fri, 10 Apr 2020 08:19:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200410011113.1300661-1-raj.khem@gmail.com> <CALbNGRRoooGE7vzTb-Gq9GgN+i=--3BWmDyV6dDw0EBkqT=LxA@mail.gmail.com>
In-Reply-To: <CALbNGRRoooGE7vzTb-Gq9GgN+i=--3BWmDyV6dDw0EBkqT=LxA@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Fri, 10 Apr 2020 08:19:30 -0700
Message-ID: <CAMKF1spE5etZaJeQi+mL2FPCW9-ijU7UzEd0JPBQw5vrXWhSEA@mail.gmail.com>
Subject: Re: [meta-gnome][PATCH] gimp: Disable vector icons generation on mips/armv7a
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 9, 2020 at 11:50 PM Andreas M=C3=BCller <schnitzeltony@gmail.co=
m> wrote:
>
> On Fri, Apr 10, 2020 at 3:11 AM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > Fixes errors like
> >
> > make[3]: *** [Makefile:2395: 24/document-print.svg] Segmentation fault =
(core dumped)
> > make[3]: *** [Makefile:2395: 24/gimp-center.svg] Segmentation fault (co=
re dumped)
> > make[3]: *** [Makefile:2395: 24/media-optical.svg] Segmentation fault (=
core dumped)
> > make[3]: *** [Makefile:2395: 24/gimp-channel-gray.svg] Segmentation fau=
lt (core dumped)
> > make[3]: *** [Makefile:2395: 24/gimp-channel-blue.svg] Segmentation fau=
lt (core dumped)
> > make[3]: *** [Makefile:2395: 24/gtk-select-color.svg] Segmentation faul=
t (core dumped)
> > make[3]: *** [Makefile:2395: 24/gimp-channel-alpha.svg] Segmentation fa=
ult (core dumped)
> > make[3]: *** [Makefile:2395: 24/media-floppy.svg] Segmentation fault (c=
ore dumped)
> > make[3]: *** [Makefile:2395: 24/gimp-business-card.svg] Segmentation fa=
ult (core dumped)
> > make[3]: *** [Makefile:2395: 24/gimp-channel.svg] Segmentation fault (c=
ore dumped)
> > make[3]: *** [Makefile:2395: 24/dialog-information.svg] Segmentation fa=
ult (core dumped)
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > Cc: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> > ---
> >  meta-gnome/recipes-gimp/gimp/gimp_2.10.18.bb | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/meta-gnome/recipes-gimp/gimp/gimp_2.10.18.bb b/meta-gnome/=
recipes-gimp/gimp/gimp_2.10.18.bb
> > index 838bd374a1..5a58f48ec3 100644
> > --- a/meta-gnome/recipes-gimp/gimp/gimp_2.10.18.bb
> > +++ b/meta-gnome/recipes-gimp/gimp/gimp_2.10.18.bb
> > @@ -45,6 +45,9 @@ EXTRA_OECONF =3D "--disable-python \
> >                  --without-webkit \
> >                  --without-wmf"
> >
> > +EXTRA_OECONF_append_libc-musl_mipsarch =3D " --disable-vector-icons"
> > +EXTRA_OECONF_append_libc-musl_armv7a =3D " --disable-vector-icons"
> Maybe you should mention musl in commit message?
>

yes, I edited the commit message to state that in master-next

> Andreas
