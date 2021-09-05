Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web10.10819.1630855971477149725
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Sep 2021 08:32:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MiScpg7J;
 spf=pass (domain: gmail.com, ip: 209.85.222.181, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id t4so4372466qkb.9
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Sep 2021 08:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3iEGgazAF8onNDSZPWXq9+ODuLa+LyeG9fHIQQBBOs8=;
        b=MiScpg7JU5U9V5r9a4D+vIRJqR0BJcB4KQCSvqzMkrQKOLCpsXpl3WVL9H+oyZQtlV
         jRgfTakhYpy5fpydAFz+U7A81oUwoSnfM7uqsXd2eWD8c17p7ZioZmuXAdGPM4s0KRoi
         m43XulZzEqxkbwN/PuQuRm6cRI0ErbvU0QWdGt2Jc0MVUDB7eOg9qf7zXFtBgIG8uJ9q
         i6IHw5tl4v8lYciOBb3zGLxbDGdQq9SVWHypdrKSzM+4jAyINXx/h0IN5nmewjzvWopG
         gBSdCl4QJizww4Fz1CzV84koBghaJy3qgg58iIdOcpbLhkOf+ATJLjx20s9CNPHMdPXY
         j/2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3iEGgazAF8onNDSZPWXq9+ODuLa+LyeG9fHIQQBBOs8=;
        b=EOSRjeVvO5YKLj9GHzUNpVkbMlAeBFFSrxU/ULYHQ+GkyLWdKp/86792xaILrjeWjv
         GfHou8MzdYJIWM1x8LMCBwWyzH16WsHMRWNhlWly2GfE1soLdRbdkYOPOejfgjYnOCbW
         godc5nxqV8lLL977cSRvKw0hgmo2R+d8MGUD8WmwUYBko3jJl4H0vNo7Hv4t6abLFjA4
         XBtom9Mclk6tuzdVVy6dDtUTRiXtAqUm98dCc2BdvWN9h1nkDtumbs3Km2fWO93sApZw
         vgs3NHlgy1f+vnHY6DcDrABXdFtwTJKgflc4ZV60T5sjMKJpR0JZBoNUvkTsjyi3PdwR
         xvhQ==
X-Gm-Message-State: AOAM5300pVtAIoALlFBnJNqTk+pbRTh1qL9/6WoGS+Yoq/B0ZwYE311L
	gpBk0eMLIg9ZMKDEwzCSFRU91zpJEdfaZJqE5SD+L6DsNaY=
X-Google-Smtp-Source: ABdhPJwXc0sTed0eXDjZfpJ7ZKWhsSU2Xjwzgo3i71EX55YosdP7douVFYTR7ZlOxbqD6wC+smXp4JfRo9L6V/SSTGg=
X-Received: by 2002:a37:ac19:: with SMTP id e25mr7226161qkm.47.1630855970571;
 Sun, 05 Sep 2021 08:32:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210904234839.2689048-1-raj.khem@gmail.com> <f02146dd4ad14777a0352d28d72d463a@axis.com>
In-Reply-To: <f02146dd4ad14777a0352d28d72d463a@axis.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sun, 5 Sep 2021 08:32:23 -0700
Message-ID: <CAMKF1spKMDHZcZDyc4LRXZ6Z_Ox91JjVaaH0hnhyGr3NFnKARA@mail.gmail.com>
Subject: Re: [meta-oe][PATCH] toybox-inittab: Use 0BSD for LIC_FILES_CHKSUM
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, Sep 5, 2021 at 1:43 AM Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>
> > -----Original Message-----
> > From: Khem Raj <raj.khem@gmail.com>
> > Sent: den 5 september 2021 01:49
> > To: openembedded-devel@lists.openembedded.org
> > Cc: Khem Raj <raj.khem@gmail.com>; Peter Kjellerstedt
> > <peter.kjellerstedt@axis.com>
> > Subject: [meta-oe][PATCH] toybox-inittab: Use 0BSD for LIC_FILES_CHKSUM
> >
> > BSD-0-Clause has been deleted from common licenses
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> > ---
> >  meta-oe/recipes-core/toybox/toybox-inittab_0.8.2.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta-oe/recipes-core/toybox/toybox-inittab_0.8.2.bb b/meta-
> > oe/recipes-core/toybox/toybox-inittab_0.8.2.bb
> > index b91a1d864e..21d4dcc19f 100644
> > --- a/meta-oe/recipes-core/toybox/toybox-inittab_0.8.2.bb
> > +++ b/meta-oe/recipes-core/toybox/toybox-inittab_0.8.2.bb
> > @@ -1,6 +1,6 @@
> >  SUMMARY = "Toybox Inittab Configuration"
> >  LICENSE = "BSD-0-Clause"
>
> Might as well change to use 0BSD for LICENSE as well then.
>
right, staged this change as well on master-next

> > -LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/BSD-0-Clause;md5=81eeb0083e31f11ab1e33ded846d521c"
> > +LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/0BSD;md5=f667a3c3830a55a17ec3067709f4526c"
> >
> >  # Unpack to ${S}/orig
> >  #
> > --
> > 2.33.0
>
> //Peter
>
