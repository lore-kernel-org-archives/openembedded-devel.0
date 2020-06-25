Received: from mail-io1-f67.google.com (mail-io1-f67.google.com [209.85.166.67])
 by mx.groups.io with SMTP id smtpd.web11.1950.1593125362485673952
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Jun 2020 15:49:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=c8igXLNG;
 spf=pass (domain: gmail.com, ip: 209.85.166.67, mailfrom: schnitzeltony@gmail.com)
Received: by mail-io1-f67.google.com with SMTP id k23so7826782iom.10
        for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2020 15:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ZZ3JYhRxZZznPea+8QrpuKZ8TgokvkqeVf2jlh/Lm7w=;
        b=c8igXLNGNxoojsA2je10Sxhb5+wxwBZAe9Eg6mnBihVoYiEK5rMm23jacaQTmSLDPl
         d5a7ehF0VqGEQZYETkyDOvTZBV8Z3F+RMx7yEhy/l29bl2fkBlSu10HBeZ7xTD1y5kTJ
         rpEScZ+Q0JPkup4hDi4p5bn/QA3cz4k+Wv5VIMuziahN6NkIXoYkapL6yDHdCbiuK73E
         XnpWK4i0I+69629ZPrxQasfd1d5qB1GFG8k674MCadi7D9SaZdHL+0OOAMTcVaMvF4+T
         gayr2wFBFC3YDTffEOR58ovSFnL63OiFFJyfJg+XjB0jOae7MgN2/DHrT5fgzU2mBEBl
         nTGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ZZ3JYhRxZZznPea+8QrpuKZ8TgokvkqeVf2jlh/Lm7w=;
        b=d9YFFJ+cIV874FQz2/wjyaWzy+Dyv50SIuC4koycKp3HucvoqD9+i/W7cV/XOzNmCd
         /YZnVm9wjHGezPlJjscV/AsL6JC78ZJaTQtwF8v7bcwP3nLZeCH4acn2AMJvj9vEz2zt
         iEUB9Pansw6bodEc7AcQHLfkcyClQKgQauFk1NfizOQCLlHU0tZRl22+kZetgspcATEA
         Qvd0okM1hmi7AS3DpEsDpRcTdsi6NqBXHshBLBtTcyWzomt2aYVa0sd192vduppcQKD6
         8sHX/upvs/gdlEdFAfZ0WU8ng8ehHF7zu8n971EkxfnYYd9e9r7yOzWKoRK6JOjPvToH
         12oA==
X-Gm-Message-State: AOAM531aeNlXn4TfDwpmtx4K+Wg0XqmCRSIekbwNG899xdE4Ppsywxlh
	2TDQVsKc10YJ+RhUdjSkYijgzENVUHGZL63JbBc=
X-Google-Smtp-Source: ABdhPJywMAclDXRdCM+5SUCbg8xWKXxCiXTv9VYTnh4hTBMeYAn7UVGc9kN+verD7Zj/4pLzCXgCYkZkHjSdlP2Xh1w=
X-Received: by 2002:a6b:c910:: with SMTP id z16mr418234iof.120.1593125361792;
 Thu, 25 Jun 2020 15:49:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200625064921.4060827-1-schnitzeltony@gmail.com> <2d898deb-9e9f-3c13-2775-1b5f663140ff@gmail.com>
In-Reply-To: <2d898deb-9e9f-3c13-2775-1b5f663140ff@gmail.com>
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
Date: Fri, 26 Jun 2020 00:49:10 +0200
Message-ID: <CALbNGRTweD2-JpGGEwYfib+1ss+H=L334qeR5_o3ReKaGBGE9w@mail.gmail.com>
Subject: Re: [oe] [PATCH v2] Revert "packagegroup-xfce-base: add RDEPEND packagegroup-core-x11"
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 25, 2020 at 6:01 PM Khem Raj <raj.khem@gmail.com> wrote:
>
>
>
> On 6/24/20 11:49 PM, Andreas M=C3=BCller wrote:
> > packagegroup-core-x11 drags stuff not everybody needs e.g xserver-nodm=
-init and
> > that's not what everybody wants. packagegroup-core-x11 is something to=
 add into
> > images.
> >
> > This reverts commit 394567c0078c627642e7b80b722f147da5a6f376:
> >
> >     packagegroup-xfce-base: add RDEPEND packagegroup-core-x11
> >
> >     without packagegroup-core-x11, after boot target, and run
> >     startx, it will report error like:
> >
> >     /usr/bin/startx: line 203: xauth: command not found
> >
> >     xinit: unable to run server "/usr/bin/X": No such file or director=
y
> >     Use the -- option, or make sure that /usr/bin is in your path and
> >     that "/usr/bin/X" is a program or a link to the right type of serv=
er
> >     for your display.  Possible server names include:
>
>
> will these issues resurface if we revert it ?
No but creating a running image is not the use case of this
packagegroup. I created this packagegroup long time ago as a
collection of XFCE recipes necessary for a XFCE session. Anything
around it is optional by design. This is a packagegroup and not an
image - and by the way meta-xfce has images including necessary X11
packages.
By this patch loads of packages unrelated to XFCE are dragged in. If
one does not want them, the only chance to get around is to get a copy
of this packagegroup as it was before this patch. To make it clear:
This patch is totally wrong and should have never been applied.

Andreas
>
> >
> >         Xorg        Common X server for most displays
> >         Xvfb        Virtual frame buffer
> >         Xfake       kdrive-based virtual frame buffer
> >         Xnest       X server nested in a window on anot
> >
> >     Signed-off-by: Changqing Li <changqing.li@windriver.com>
> >     Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >
> > Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> > ---
> > V1 -> V2:
> > * Add commit message of patch reverted
> > * Add Signed-off-by
> >
> >  meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-base.bb | 1 -
> >  1 file changed, 1 deletion(-)
> >
> > diff --git a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-ba=
se.bb b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-base.bb
> > index 6ddf8ee91..70ef909ef 100644
> > --- a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-base.bb
> > +++ b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-base.bb
> > @@ -7,7 +7,6 @@ inherit packagegroup features_check
> >  REQUIRED_DISTRO_FEATURES =3D "x11"
> >
> >  RDEPENDS_${PN} =3D " \
> > -    packagegroup-core-x11 \
> >      xfwm4 \
> >      xfce4-session \
> >      xfconf \
> >
> >
> >=20
> >
