Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F30C7C369AB
	for <webhook@archiver.kernel.org>; Tue, 15 Apr 2025 20:57:58 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.4948.1744750674614522510
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Apr 2025 13:57:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=A10P3zrU;
 spf=pass (domain: smile.fr, ip: 209.85.221.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-39bf44be22fso3933995f8f.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 15 Apr 2025 13:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1744750673; x=1745355473; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JteseKAqBWZ+xTO6pOfmrko2QdWsFYnnNGSZNV66vwY=;
        b=A10P3zrU7rrch/xD9ttj/E+6rcZd913E2V1ZwJu87NdRNgOKIdGTJaloV40omSNVKP
         7gP+9YWtSznN0OOR9GSskJYarZNCej/RRYNhz7yIJ6Mqb+nVaH17dZjQ8vGwvGN/83m6
         mUA540XlhKFCaeZ5l26pqEoyHuzhaPys33USU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744750673; x=1745355473;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JteseKAqBWZ+xTO6pOfmrko2QdWsFYnnNGSZNV66vwY=;
        b=FwwHqMfrM1/lijJMzpY8/On9Icpw3IOi6IHkcQ+wUgYk3uJ67hg3XtqAj8FJi0/JpY
         9fGdJVMlNpShkBLUGfjkJ6WjdsuGsY1fJahdi6cnOP5dz38lFut4jCvmq+kC7yCl4/Ng
         uSPDDeK/GvYjBBl+K3qLMoUbCbC1AgMphkc/NVT9dDzH7bCbJWeRxr6i3t7bd2n5Zd6g
         4eLrDqVKzDPxkSWgZwi9XI8RQyoC0IYaJDqJWcGVpuoGpLDHDvweSN5m9QlVGk6QjuIH
         vWs8lIJSPaGLLDG7fK2seIkVm7dtagWIkmEGN/Xgfw6FeioVGBeHcATbO/7qe4tUQeUd
         gmYg==
X-Gm-Message-State: AOJu0YzO7ftxA+9tyH2hH1LGRFVElq8OlNehbVgc4GQ/CYAUnzeS2T/R
	UekpH+6pdxcB+xIqjnDbvtSiD40OduKcuCXQ2kwV73THuCUVdV2cWL37ZNuvTDipCXRVDfa/z0I
	Q/DSbVL2QIzAXQkExkvW0PnxCPzeglM4ME/gqXw==
X-Gm-Gg: ASbGncvHYf653opuYT0GN69WVQcX1/XlZv62+AmmyknmwIopGOFhiCarX4S9hGB2wwf
	6ooUNzE2FFCLHFH+lFulVCzLxoJSmV6MU63Jyu5D4iIMQQrTCB4BANlHhZAseHeNmcxtq0yn1CI
	Jyt6AAyOu8i4GiMA9+eNknfAyEMLEDLrntA575nxD8m2yh5ZDm+lsahvI=
X-Google-Smtp-Source: AGHT+IG/WsGKqQ3FZKv6oMgl/r6yLWfhvDK3Ii8ZDUZQHsF4Y1FO/sHJXiUs7XzRidCrG/9PpjgjDN9l6M2Fuhk9BcI=
X-Received: by 2002:a05:6000:2403:b0:391:ab2:9e71 with SMTP id
 ffacd0b85a97d-39ee2751ec7mr731876f8f.20.1744750672743; Tue, 15 Apr 2025
 13:57:52 -0700 (PDT)
MIME-Version: 1.0
References: <20250415180540.1327811-1-schonm@gmail.com> <CAMSfU+5-75-+T0XVCwSfboGggYU3qOvBXoP8VxjjCynU-_PY4Q@mail.gmail.com>
 <CABTo8gDXaUfLmCLtEbAj7HoNc04LOSkNaO9NqD7wdoFUnS3ucg@mail.gmail.com>
In-Reply-To: <CABTo8gDXaUfLmCLtEbAj7HoNc04LOSkNaO9NqD7wdoFUnS3ucg@mail.gmail.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Tue, 15 Apr 2025 22:57:26 +0200
X-Gm-Features: ATxdqUGFEzpX3rRuI49qJu-e19odQO-kT_9-OfmL24rSXVvouB-jXtX5bZvbq0E
Message-ID: <CAMSfU+5M3Z+Z29nBZcvvyFLVN9uhH_mLCqTOyvO4mFzV8GWEZw@mail.gmail.com>
Subject: Re: [oe] [meta-webserver][PATCH] monkey: Update project website
To: "J. S." <schonm@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Apr 2025 20:57:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116870

Le mar. 15 avr. 2025 =C3=A0 21:12, J. S. <schonm@gmail.com> a =C3=A9crit :
> I did consider that.  But I figured that since the existing webpage
> has been wrong for more than a year, the issue would eventually be
> updated with whatever address the projectet decided to register.

Ok, that is fair. Either way is fine with me.

Thanks!

>
> On Tue, Apr 15, 2025 at 2:47=E2=80=AFPM Yoann Congal <yoann.congal@smile.=
fr> wrote:
> >
> > Hello,
> >
> > Le mar. 15 avr. 2025 =C3=A0 20:05, J. S. via lists.openembedded.org
> > <schonm=3Dgmail.com@lists.openembedded.org> a =C3=A9crit :
> > >
> > > Signed-off-by: Jason Schonberg <schonm@gmail.com>
> > > ---
> > >  meta-webserver/recipes-httpd/monkey/monkey_1.6.9.bb | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/meta-webserver/recipes-httpd/monkey/monkey_1.6.9.bb b/me=
ta-webserver/recipes-httpd/monkey/monkey_1.6.9.bb
> > > index a11af8129a..cdb6fb605c 100644
> > > --- a/meta-webserver/recipes-httpd/monkey/monkey_1.6.9.bb
> > > +++ b/meta-webserver/recipes-httpd/monkey/monkey_1.6.9.bb
> > > @@ -1,5 +1,5 @@
> > >  SUMMARY =3D "Fast and Lightweight HTTP Server for Linux"
> > > -HOMEPAGE =3D "http://monkey-project.com"
> > > +HOMEPAGE =3D "https://github.com/monkey/monkey/issues/414"
> >
> > I would put "HOMEPAGE =3D "https://github.com/monkey/monkey" (the main
> > github page, not the issue) citing the issue in the commit message.
> >
> > Regards,
> >
> > >  BUGTRACKER =3D "https://github.com/monkey/monkey/issues"
> > >
> > >  LICENSE =3D "Apache-2.0"
> > > --
> > > 2.43.0
> > >
> > >
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#116865): https://lists.openembedded.org/g/openemb=
edded-devel/message/116865
> > > Mute This Topic: https://lists.openembedded.org/mt/112281725/4316185
> > > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsu=
b [yoann.congal@smile.fr]
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >
> >
> >
> > --
> > Yoann Congal
> > Smile ECS



--=20
Yoann Congal
Smile ECS

