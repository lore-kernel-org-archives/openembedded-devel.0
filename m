Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EC33C433EF
	for <webhook@archiver.kernel.org>; Fri, 18 Feb 2022 17:03:07 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com
 [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web09.13558.1645203786182651062
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Feb 2022 09:03:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=micABRG9;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id o5so15932959qvm.3
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Feb 2022 09:03:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DxTt2+3JARDbRIGs0oECt+3sVheHFmLNyvEyg65CVOU=;
        b=micABRG9dJGTfqv2esGqsAccCmwP0hqN5agUSVlTVUJVq/2uJXpD0FOIOBwkHCtCum
         UYtUgxcTQw6mlgrpfFJzFlgonEl4IWB7DaOxD1eH+N/nVcz+YiDTsqN9R107Iayu4sPO
         eHr69+zXPH7zraSsuapSie84cllpXSGRXYv1nM5+az6qohLLjN6nwbKFQ1esIIRIZQkS
         CH1tLFyUW0YMed6bWhP1AGNIfO0VsTRR6ylBtgvkNDxVJSYlj75g6CMQFezZMiEfWTKa
         /aP7yYoc/2UNcsfooq+5rQ8Fp4H18cehO2+BUSdFw8JPauKk9yE99DPreSe/1MF/wJtA
         dchg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DxTt2+3JARDbRIGs0oECt+3sVheHFmLNyvEyg65CVOU=;
        b=wszltiNzXnNY8SRSVMGssybF0wA+UAkjEY62v1zwK9tSpGzOjSyKECPDf/nIEkPUCr
         UVDnDSd7zrm5CLPMbVkpUvzmJ0IRlB3+1wjEplCNefGoIrdTszokPxDhqFtuS34W3s3n
         j0cPVXuUpV6O1U+s9JfP/6qWNzNR4LLD7Mm3jPPM+PursvVsaeDd8NZ5HoVDp+jj9yBH
         gUrMJrH0Bx9hUL9og9VJJjrutRXc1XZO/Ol6yAS/JMPD6YwUsHxm+wJ41JkwadEN1AFW
         Wz/mkKcmLh4z0RH8KTSxRUdGAJe6Czy9E4QiJA3Sq4WjjMxbbQ+UxateYrNWdwT0Vu1N
         Y3Rw==
X-Gm-Message-State: AOAM53191hdPipecYMFGajcdwzVacnYX98d0J7wHnBswXmhxr+AJubMP
	gYk8SC7yjcX6gv1gcmaQouE39Sv6Os2vmRrW/Ck=
X-Google-Smtp-Source: 
 ABdhPJytiTe65X+5NchrjMRx85NHI6sI8cCfPTt8SnPgTz31nROK1BWQ+U8yt/235ZynU4PtnupkBOpMVGJjkwfIffk=
X-Received: by 2002:a05:622a:1046:b0:2dc:eb87:afd0 with SMTP id
 f6-20020a05622a104600b002dceb87afd0mr7490473qte.229.1645203785090; Fri, 18
 Feb 2022 09:03:05 -0800 (PST)
MIME-Version: 1.0
References: <20220218011204.5913-1-pkj@axis.com>
 <CAMKF1srXFHYf1bxDG5Cm74CU55bVgzcg3n690nJyqPWuavN6aQ@mail.gmail.com>
 <f9f5fd2b7e46412381fe3d40a383c78f@axis.com>
In-Reply-To: <f9f5fd2b7e46412381fe3d40a383c78f@axis.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 18 Feb 2022 09:02:38 -0800
Message-ID: 
 <CAMKF1spwJLxrkram32SqR211+QkUq2i09hzitkWD2SivgrmfLg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] syslog-ng: adjust control socket location
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Feb 2022 17:03:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95379

On Fri, Feb 18, 2022 at 8:32 AM Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>
> > -----Original Message-----
> > From: openembedded-devel@lists.openembedded.org <openembedded-
> > devel@lists.openembedded.org> On Behalf Of Khem Raj
> > Sent: den 18 februari 2022 03:19
> > To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> > Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
> > Subject: Re: [oe] [meta-oe][PATCH] syslog-ng: adjust control socket
> > location
> >
> > this is already applied in master via
> > b57d824fdf822a4c3fdb153b92063f88705e3a6b
>
> Duh. I apparently forgot the "[honister]" tag in the subject (see my
> original comment below).

I see thanks for update, maybe you want to resend it with that tag so
that Armin picks it


>
> > On Thu, Feb 17, 2022 at 5:12 PM Peter Kjellerstedt
> > <peter.kjellerstedt@axis.com> wrote:
> > >
> > > From: Ovidiu Panait <ovidiu.panait@windriver.com>
> > >
> > > Commit [1] changed the pidfile dir to /var/run/syslog-ng. This also
> > changed
> > > the location where the control socket is searched for, causing the
> > following
> > > error with systemd:
> > >
> > > root@qemux86-64:~# syslog-ng-ctl config
> > > Error connecting control socket, socket='/var/run/syslog-ng/syslog-
> > ng.ctl',
> > > error='No such file or directory'
> > >
> > > Update the systemd service file to point to the new location.
> > >
> > > [1] 00d1d63e4f7f ("syslog-ng: provide correct PID directory location to
> > >                    restart/stop syslog-ng daemon")
> > >
> > > Signed-off-by: lmorales <luisalejandro.moralespena@windriver.com>
> > > Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> > > ---
> > >
> > > This has already been backported to the hardknott branch, but is missing
> > > in honister...
> > >
> > >  .../files/syslog-ng.service-the-syslog-ng-service.patch         | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/meta-oe/recipes-support/syslog-ng/files/syslog-ng.service-
> > the-syslog-ng-service.patch b/meta-oe/recipes-support/syslog-
> > ng/files/syslog-ng.service-the-syslog-ng-service.patch
> > > index 0e1d09492..733480030 100644
> > > --- a/meta-oe/recipes-support/syslog-ng/files/syslog-ng.service-the-
> > syslog-ng-service.patch
> > > +++ b/meta-oe/recipes-support/syslog-ng/files/syslog-ng.service-the-
> > syslog-ng-service.patch
> > > @@ -38,7 +38,7 @@ index 0ccc2b9..7f08c0e 100644
> > >  -CONTROL_FILE=/var/run/syslog-ng.ctl
> > >  -PID_FILE=/var/run/syslog-ng.pid
> > >  +PERSIST_FILE=@LOCALSTATEDIR@/lib/syslog-ng/syslog-ng.persist
> > > -+CONTROL_FILE=@LOCALSTATEDIR@/lib/syslog-ng/syslog-ng.ctl
> > > ++CONTROL_FILE=@LOCALSTATEDIR@/run/syslog-ng/syslog-ng.ctl
> > >  +PID_FILE=@LOCALSTATEDIR@/run/syslog-ng.pid
> > >   OTHER_OPTIONS="--enable-core"
> > >  --
>
> //Peter
>

