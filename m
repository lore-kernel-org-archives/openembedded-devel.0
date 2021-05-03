Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web12.98.1620071969444788794
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 May 2021 12:59:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QwRfoSYy;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id g17so1364941qvl.9
        for <openembedded-devel@lists.openembedded.org>; Mon, 03 May 2021 12:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XeQ7Ia0qhp/MwkGkn+UVnVYqX+d8yraop7gYmE4Jtfs=;
        b=QwRfoSYyFbwz/94jmnD97jwYcBARhIOSmL/e4/Fp5lZNZt2+49nkHM6gdMBbuJBFtH
         zwPDFWM5oPgAM/ESfvbUfesBihtusBycl/LiD6VuUVjsKKXtZTASbbgArj1b3bUPtd2y
         5U/6DoeUQZXWiIPZOLpHG4QtGD/gPGgcJs2nigWn52nphTMbCaudUJ5OFb8sC59+hT7H
         G/g74sGjkFwUnhQUqB/Ri9WPDU6GrEuijUf2zd0ZoSaVBFXcSiqjYXpZj9MKKjPHhLGS
         xnGHETQevztorw0hzo1JK5lrR2B9vijtwzL+q7u+PtHTeSKGJb66UPvOnn8IXgfzgzlb
         LXWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XeQ7Ia0qhp/MwkGkn+UVnVYqX+d8yraop7gYmE4Jtfs=;
        b=aFh5dBgJRiTk4MA8VgrIVRi0M9rGF0PwmBGpp0BAV5B05i4kNG/mjz5PPcIPc6m0kn
         fJXEvuLwjNRO/7+S6GpGr6LS2GfLBI5xF+NQpxPzpjuBmF5H+S5E6mfE3eafUC5Xdxy9
         g6MhhMtRY92apTP9CJKnzNHWWtquSt7Q8kVHVknwWC2wntjPU62hvnJVPzOV1eS2FxOq
         t8eXi6VChQEdS55Kp5Vh2g3kVsO+WMsVfTSa6ONqIUIKcdH4HiQg1edt/e5EU8k3CH8m
         qYy+rFFo/g0orm9Q/m7c5Vux3yEs7YeJ6A7asyRN644PO3geRH9KvIIPxN+Wqq7Cg+qa
         RXEQ==
X-Gm-Message-State: AOAM532ArRrGklsRkVynEdHOqZY0fxZh7Gx1ZRTZpr9W/zix43K6UhX+
	1dPEkfvVfyowMoPoViWMjtqzdKybrLO+FsNjmrDtZHxZIq8=
X-Google-Smtp-Source: ABdhPJypfxVly3iay/H2kdfCoCa2NzAU53LdI6g69ATb31kxsT2wUKKmgnzGXje/K1MoXWwxK1w+yiUBHzX2Xn1wZz8=
X-Received: by 2002:ad4:4dc8:: with SMTP id cw8mr7803405qvb.16.1620071968501;
 Mon, 03 May 2021 12:59:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210503154248.2359344-1-saul.wold@windriver.com>
 <20210503154248.2359344-2-saul.wold@windriver.com> <56aac87e-556a-dfba-4aca-70644a8fcd9a@gmail.com>
In-Reply-To: <56aac87e-556a-dfba-4aca-70644a8fcd9a@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 3 May 2021 12:59:02 -0700
Message-ID: <CAMKF1sqgwU5-KtiepOD-ct5dP=HV464Wis+1vQSXnXWVf6v=aQ@mail.gmail.com>
Subject: Re: [oe] [PATCH] tbb: Disable PPC as COMPATIBLE_MACHINE
To: akuster808 <akuster808@gmail.com>
Cc: Saul Wold <Saul.Wold@windriver.com>, 
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, May 3, 2021 at 12:07 PM akuster808 <akuster808@gmail.com> wrote:
>
>
>
> On 5/3/21 8:42 AM, Saul Wold wrote:
> > From: Saul Wold <Saul.Wold@windriver.com>
> >
> > The latest version does not support PPC architecture, so disable
> > the it. Otherwise the following error occurs:
> >
> > /srv/nvme/yocto/hardknott/builds/tbb/tmp/work/ppc7400-poky-linux/tbb/2021.2.0-r0/git/src/tbb/tools_api/ittnotify_config.h:338:12: error: '__TBB_machine_fetchadd4' was not declared in this scope
> >   338 |     return __TBB_machine_fetchadd4(ptr, 1) + 1L;
> >       |            ^~~~~~~~~~~~~~~~~~~~~~~
> >
> > Signed-off-by: Saul Wold <saul.wold@windriver.com>
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta-oe/recipes-support/tbb/tbb_2021.2.0.bb | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/meta-oe/recipes-support/tbb/tbb_2021.2.0.bb b/meta-oe/recipes-support/tbb/tbb_2021.2.0.bb
> > index b05a59dc7..d8a18866c 100644
> > --- a/meta-oe/recipes-support/tbb/tbb_2021.2.0.bb
> > +++ b/meta-oe/recipes-support/tbb/tbb_2021.2.0.bb
> > @@ -43,3 +43,6 @@ LDFLAGS_append_mips = " -latomic"
> >  LDFLAGS_append_mipsel = " -latomic"
> >
> >  LDFLAGS_append_libc-musl = " -lucontext"
> > +
> > +# The latest version of oneTBB does not support PPC
> > +COMPATIBLE_MACHINE_powerpc = "(!.*ppc).*"
>
> Should we also exclude including that package for ppc in
> packagegroup-meta-oe.bb?
>
> RDEPENDS_packagegroup-meta-oe-support_remove_powerpc = "ssiapi tbb"  <<<---?

yes it should be.

>
> >
> > 
> >
>
