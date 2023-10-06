Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3F65E92FD2
	for <webhook@archiver.kernel.org>; Fri,  6 Oct 2023 01:06:33 +0000 (UTC)
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
 by mx.groups.io with SMTP id smtpd.web11.3112.1696554386236748919
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Oct 2023 18:06:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BWAjrmOb;
 spf=pass (domain: gmail.com, ip: 209.85.160.42, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-1dceaa7aeffso1422955fac.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Oct 2023 18:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696554385; x=1697159185; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zu85qMQtX66i3RaO2/BU7UXRVPzhq5zQLIh86nj4E4Q=;
        b=BWAjrmObM7CNEL1ZpouExtSafzV4fmTmdLsopvIcpRIlM+chEFk2MEvVMBJb/5fa24
         VHnuqOgufr+eH+J8vU3C9BwGzS4ifXFx3vW+Dm8I6gERszC6rhdnVqbHh3+PPd8N01IM
         TzH289t7/JAZ9d9Qwic67a/tJXiYamtEloMCd5hJpx9NvrQ3GDVYQnFhLCcHdMqSwbNF
         1K0enHmL0T7GUkF6QnoAMyzy4RyX5piEKIYb4JMDlOlBHAQNquSIzaiaj3seM1p7QzSA
         RKO+U2I4BaqhgEASCbZdLOYC0zGeAnbPjIwi2JUJxIcx8XiaRdBrnGUD2D7bsaAFfQYP
         ZIMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696554385; x=1697159185;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zu85qMQtX66i3RaO2/BU7UXRVPzhq5zQLIh86nj4E4Q=;
        b=IHTOFJrh+bjBQ8joKczIfvuNCAWdKKZnkNQlyUy+NTt37Wed0qW9/sLH0hNmWEQWCq
         0bQL5f0as7DigRv1b7YpSvcfNDNduFHgVTYho6H3dTCybz3y9r42K+YYhzJN8XLJbEVd
         S1JZ05NS0D+Aa6CQXU/JOzx/oVi4p8y8u41wv0Yp/nHwUHUwaObnmje6qHf+lnnQBtbF
         Os7/CHMzulY+wuD1GFOEgXnOeXuggGi2WZnKX8xi/C0vDJuFdEkAvbT6mgem1NiJA3tA
         Qcctqjcjd8fAUcpFhK8CQeiiMyXO6728TzgBXdr1F94vNskCu7cqWe4T33jZn0myv/OJ
         0+1Q==
X-Gm-Message-State: AOJu0YwME8cLdKK0egVgElwRzn4DNelrE7EVOcaKj7Dq4icEZhUlAQrX
	kv48fDZpqR2jl7kemcAQ1A6UeOzxfSXIIqgfCEI=
X-Google-Smtp-Source: AGHT+IGJXAvKTe8JbZmxi5wZAam4NGyXr57HbfSGSHj14C8acz1qPZyQoP8SS+13H6UWgBJ3AnkSYWe7PTwwsmZgntg=
X-Received: by 2002:a05:6870:5ba4:b0:1d5:8d6a:18f0 with SMTP id
 em36-20020a0568705ba400b001d58d6a18f0mr2340509oab.27.1696554385283; Thu, 05
 Oct 2023 18:06:25 -0700 (PDT)
MIME-Version: 1.0
References: <20231002091534.963730-1-costamagnagianfranco@yahoo.it> <CAMKF1so3TeHf5J_wMqZg2s8xVJiqTo3GEWzsPOMyMbF6aakKEw@mail.gmail.com>
In-Reply-To: <CAMKF1so3TeHf5J_wMqZg2s8xVJiqTo3GEWzsPOMyMbF6aakKEw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 5 Oct 2023 18:05:59 -0700
Message-ID: <CAMKF1spEZ6B7zywyq238CAhOPHYPq-j28n1cBiWJQz1iRUz2TQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/2] dlt-daemon: update patch 544.patch
To: Gianfranco <costamagna.gianfranco@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, 
	Gianfranco Costamagna <costamagnagianfranco@yahoo.it>, 
	Gianfranco Costamagna <locutusofborg@debian.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 06 Oct 2023 01:06:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105364

seeing build failures on non-systemd distros see

https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/3217/step=
s/14/logs/stdio

    ybuild/yocto-worker/meta-oe/build/build/tmp/work/core2-64-poky-linux/dl=
t-daemon/2.18.10/git/src/system/dlt-system.h:57:10:
fatal error: systemd/sd-journal.h: No such file or directory
     include <systemd/sd-journal.h>
             ^~~~~~~~~~~~~~~~~~~~~~

On Mon, Oct 2, 2023 at 12:27=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote=
:
>
> Gianfranco
>
> I have staged some of your patches on master-next,  please check and
> if you have anything pending, let me know
>
> On Mon, Oct 2, 2023 at 2:15=E2=80=AFAM Gianfranco
> <costamagna.gianfranco@gmail.com> wrote:
> >
> > Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
> > Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
> > ---
> >  meta-oe/recipes-extended/dlt-daemon/dlt-daemon/544.patch | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/544.patch b=
/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/544.patch
> > index 550493351..3699b8c83 100644
> > --- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/544.patch
> > +++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/544.patch
> > @@ -1,6 +1,6 @@
> >  Upstream-Status: Submitted [https://github.com/COVESA/dlt-daemon/pull/=
544]
> >
> > -From 5db28a4b85cf0ec3e128cfc7c9b71d12ec543695 Mon Sep 17 00:00:00 2001
> > +From 8121a979026d5fcb05bd4e5d3a0647f321b56106 Mon Sep 17 00:00:00 2001
> >  From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
> >  Date: Thu, 28 Sep 2023 12:54:23 +0200
> >  Subject: [PATCH] Add common dlt_cdh_cpuinfo.c to unblock build on non =
amd64
> > @@ -28,7 +28,7 @@ index d572ecf3..8608c6c4 100644
> >
> >  diff --git a/src/core_dump_handler/dlt_cdh_cpuinfo.c b/src/core_dump_h=
andler/dlt_cdh_cpuinfo.c
> >  new file mode 100644
> > -index 00000000..d6fc3905
> > +index 00000000..03509fda
> >  --- /dev/null
> >  +++ b/src/core_dump_handler/dlt_cdh_cpuinfo.c
> >  @@ -0,0 +1,33 @@
> > @@ -62,8 +62,8 @@ index 00000000..d6fc3905
> >  +{
> >  +/*    struct user_regs_struct *ptr_reg =3D (struct user_regs_struct *=
)prstatus->pr_reg;
> >  +
> > -+    registers->pc =3D ptr_reg->pc; /* [REG_PROC_COUNTER]; */
> > -+*/
> > ++    registers->pc =3D ptr_reg->pc;*/ /* [REG_PROC_COUNTER]; */
> > ++
> >  +}
> >  diff --git a/src/core_dump_handler/dlt_cdh_crashid.c b/src/core_dump_h=
andler/dlt_cdh_crashid.c
> >  index bca44e0e..8dd98d70 100644
> > --
> > 2.34.1
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#105301): https://lists.openembedded.org/g/openembed=
ded-devel/message/105301
> > Mute This Topic: https://lists.openembedded.org/mt/101708265/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

