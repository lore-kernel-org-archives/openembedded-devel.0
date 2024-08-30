Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8882ECA0EF7
	for <webhook@archiver.kernel.org>; Fri, 30 Aug 2024 08:57:37 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web10.8532.1725008255027013767
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 Aug 2024 01:57:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=LoC+PYxP;
 spf=pass (domain: linaro.org, ip: 209.85.167.43, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5343eeb4973so2395075e87.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 30 Aug 2024 01:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725008253; x=1725613053; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EDrNeA9Hiz5l/9v5OmaLwp/gaHBM+8GzC2lR41w9FSM=;
        b=LoC+PYxPXGBxx9Z43b/+1TPnL8hBDKrPeB1xgZ5sq33PiT9bofk+TK0+WRV995D6L0
         NECqbKR6+lm6l0XmSN7qhjiHuSJi4kNy16nkn1rzGVAj9r2yIY/GjFIxgQg7btaBQMnP
         nKnAYLKUyIOgBJ2v91QWz3xKtnpOHE11Ir+kzG7Vup4XpGgRk5RXXosxc9cFBfpqDuIG
         VfvC2ONjqt2utfj46dIxTjKp2VodW2NOKdthth047fgmv7sMi05A8/4EuxRIYgHFd14w
         U7Z24z4IV8xH+132TK7HE2ZlbUIq0fHwcepJ4X1lxghcHWQMa42OlQbo1wvhNRyIqF7n
         QgMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725008253; x=1725613053;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EDrNeA9Hiz5l/9v5OmaLwp/gaHBM+8GzC2lR41w9FSM=;
        b=HtNa7FBXjCqdKaHTEby4IRYUIQHVh7TGs0G6+nw3My8IyAUw0cxASc7fkCchJYuVfN
         OjHFYzCJWrLxqYd7SCa/iwxFMY3cCuAUGsDr3gSaFNlqZdodG636iR7j8dUuaqOKTfut
         O1H7GDFBnjS3TJ/fxr0OU+OJJ8lgyM+8nQ/yW9d7ycmyj7oAg+D/cDesepD6gE/GZPES
         B1y00vYDavfqZ1koKjb6ikrJQV2v1a5EHkciX+NQHbB8egPY11iYqTM3Leiks0e8Y5na
         d5ZgzxUma/41nu3lQ1rNUhwpc0PlhWQCb0XMCE/Z3yzSZ7YduNuuZY1eWELMKE9zTtKR
         LB1Q==
X-Gm-Message-State: AOJu0YzoZUT41Jki8wqtIUH82qGfNNINXP6oKz5dpkVwSYfYXvcjqoBJ
	KhMuf9X63QB+AtsNacqRJJBieRhfh6qWrS0LW9L8mTbb1MT6WXtmwQZw5e+lQR2g5mAkaYFUU0c
	m/oo=
X-Google-Smtp-Source: AGHT+IE1+0f1+KaaDe2mDRjOqCnsg6T8LMHJMGX0xgD1tfyJiYUSbJvYC7WIU06x2GOO8zw/09OaxA==
X-Received: by 2002:a05:6512:3d17:b0:533:4656:d4d6 with SMTP id 2adb3069b0e04-53546b1c2eamr1077427e87.5.1725008252357;
        Fri, 30 Aug 2024 01:57:32 -0700 (PDT)
Received: from nuoska (87-100-245-199.bb.dnainternet.fi. [87.100.245.199])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5354079b90fsm500905e87.60.2024.08.30.01.57.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 01:57:31 -0700 (PDT)
Date: Fri, 30 Aug 2024 11:57:29 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, akuster808@gmail.com
Subject: Re: [meta-oe][PATCH] gcab: keep buildpaths QA issue as a warning
Message-ID: <ZtGJeclX4BfJcU4R@nuoska>
References: <20240830081819.2635680-1-martin.jansa@gmail.com>
 <CA+chaQe_FmAQw8s6zyGdKrgBGAf=5ejCcWGYrRMkJe7csuaF6Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+chaQe_FmAQw8s6zyGdKrgBGAf=5ejCcWGYrRMkJe7csuaF6Q@mail.gmail.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 30 Aug 2024 08:57:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112053

Hi,

On Fri, Aug 30, 2024 at 10:40:53AM +0200, Martin Jansa wrote:
> Mikko: can you please explain why meson embeds absolute paths in
> glib-mkenum filename on purpose?
> 
> Or were you seeing any other buildpaths than these 2?
> 
> lib32-gcab/1.6/package $ grep -R styhead .
> ./usr/src/debug/lib32-gcab/1.6/libgcab/gcab-enums.c:#include
> "WORKDIR/build/../gcab-1.6/libgcab/gcab-file.h"
> ./usr/src/debug/lib32-gcab/1.6/libgcab/gcab-enums.c:#include
> "WORKDIR/build/../gcab-1.6/libgcab/gcab-folder.h"
> 
> glib-mkenum supports also @basename@ since 2.22 which would avoid this QA issue
>   @filename@            name of current input file
>   @basename@            base name of the current input file (Since: 2.22)
> if we update
> ./libgcab/gcab-enums.c.etemplate:#include "@filename@"

I was googling for this and found MRs and issues in meson github
which pointed to embedding build time absolute paths on purpose to
fix something.

Sadly my laptop crashes (Thinkpad T14 gen 3 crashes when plugging to power lid closed)
and I lost the browser tabs before writing the commit message.

Your proposal could be the correct fix, I hope it works.

Cheers,

-Mikko

> Cheers,
> 
> On Fri, Aug 30, 2024 at 10:18 AM Martin Jansa <martin.jansa@gmail.com> wrote:
> >
> > INSANE_SKIP:gcab-src doesn't work with multilib where the package is
> > named ${PN}-src (e.g. lib32-gcab-src) and it's better to just lower
> > buildpaths from ERROR_QA to WARN_QA instead of skipping it completely,
> > because it's still an issue which should be fixed (at least to improve
> > hashserv efficiency if you don't care about reproducibility itself)
> >
> > The backport to scarthgap from:
> > https://lists.openembedded.org/g/openembedded-devel/message/111739
> > should IMHO be just reverted there as buildpaths QA issues
> > aren't fatal in scarthgap.
> >
> > Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> > ---
> >  meta-oe/recipes-gnome/gcab/gcab_1.6.bb | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta-oe/recipes-gnome/gcab/gcab_1.6.bb b/meta-oe/recipes-gnome/gcab/gcab_1.6.bb
> > index 49c64f0ba6..0d9410b4d5 100644
> > --- a/meta-oe/recipes-gnome/gcab/gcab_1.6.bb
> > +++ b/meta-oe/recipes-gnome/gcab/gcab_1.6.bb
> > @@ -24,4 +24,6 @@ PACKAGECONFIG[tests] = "-Dtests=true -Dinstalled_tests=true,-Dtests=false -Dinst
> >  BBCLASSEXTEND = "native"
> >
> >  # meson embeds absolute paths to generated files on purpose
> > -INSANE_SKIP:gcab-src += "buildpaths"
> > +# ERROR: QA Issue: File /usr/src/debug/gcab/1.6/libgcab/gcab-enums.c in package gcab-src contains reference to TMPDIR [buildpaths]
> > +ERROR_QA:remove = "buildpaths"
> > +WARN_QA:append = " buildpaths"
> > --
> > 2.46.0
> >

