Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A40AC10F16
	for <webhook@archiver.kernel.org>; Mon,  6 May 2024 14:38:15 +0000 (UTC)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
 by mx.groups.io with SMTP id smtpd.web10.22303.1715006288900548746
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 May 2024 07:38:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=i8txIkFk;
 spf=pass (domain: gmail.com, ip: 209.85.160.48, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-23fb052ca41so503167fac.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 May 2024 07:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715006288; x=1715611088; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fFVoV82h5X6lXvJ9GJkbUOk06XJfz4SoMCp6vYvhehY=;
        b=i8txIkFk5iCqCalqEnkRVCS4gFXtm5wN/WDaRrydd6lArASoISlsMe5hX1rqP73mIU
         ntRVknkYrhUXm6tAM71GDBpzsHdXl2yp5zi7sgeJenSAWC73wqjog1x0gDJChMeiLOWw
         S/HFLWfI5cbvTN/mXVsw37aBw3ZNfFhn6SAtKTPtaNQfbZy8VkE1qO2RBXJ1tcxD44AF
         i1gC+p9TdqKQeB8flsoTLb4mmCEVwCQJ1SD36cAhbWCqBjce4urZjxaWejvOYtnM095O
         kDSy8hZj1iHlyLYiBRq6h4+dvHsa0WAoht+jVlhoNbrPpgRIKqK1YN40bzWuYIPBE2VI
         gAdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715006288; x=1715611088;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fFVoV82h5X6lXvJ9GJkbUOk06XJfz4SoMCp6vYvhehY=;
        b=vfTLZB6ZQj9vuLE0Z88Wrg4kTufFBDdnQGwqM+Y02PISjttvxOBCx8uA4JSXXg/8k8
         luUGnMPbS4fWWc8JM/Lc/Wjmnha9XmVxw+xRlL460+76c2UEG4IZ+SpSzxdjw2d34KWi
         zSzpfkPmONjrMeaIUfo7DR2GmSUNAMxR9UuBYPwUo3EQpYBRMoB/iyHTtTtAQezwi3Oi
         TmZx8Q9PDywBzxdGvb6dLywD1Vd5uJZAgvsUSWQ0vwiJtn3WnhnZ8LoK/84hsqnSAb+p
         sBQCNG6qcuegLsHM+9ZGg5X+nLhGrqqtd+qZfOSf4/9EBQyW+bBzOT6rPZG4xGNie73j
         EMsA==
X-Gm-Message-State: AOJu0Yw155QLsTiismxTsKxrRE5FVMa0quYF3E4ib7LRaQbNqx2nGhOT
	xdcLyx60UwBWGMJHqXroEUwZ1cOSfVCZIjaOvDAgaw3ppKJNBb7qjNqAg4VVr6PDSfmUhtEUrZm
	KQhKbJVy8OJPoEsubozoBt9s4Dh4=
X-Google-Smtp-Source: AGHT+IHMVZMgxGBvEc70OzbdQyO0WVscUAgjD7TYMkD+9uhC/H+MHlLbQWwKgyvmavKhXnMsPvrYkdceF51fvPyXRM4=
X-Received: by 2002:a05:6871:7297:b0:23c:e5e3:8771 with SMTP id
 mm23-20020a056871729700b0023ce5e38771mr12928892oac.42.1715006288001; Mon, 06
 May 2024 07:38:08 -0700 (PDT)
MIME-Version: 1.0
References: <20240503094232.2114574-1-martin@geanix.com> <8ce0bdc0aa421a9685b740a8cca4c93801e049ad.camel@geanix.com>
In-Reply-To: <8ce0bdc0aa421a9685b740a8cca4c93801e049ad.camel@geanix.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 6 May 2024 07:37:42 -0700
Message-ID: <CAMKF1so10fduO3FksorrkVw6wUGNLWXqZM5gjf1ucEkZvNbdbg@mail.gmail.com>
Subject: Re: [oe] [PATCH] nodejs-oe-cache: fix offline install of dependencies
To: martin@geanix.com, Armin Kuster <akuster808@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, 
	Martin Jansa <martin.jansa@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 May 2024 14:38:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110260

+Armin. as Armin is already preparing first batch of changes for scarthgap.

On Mon, May 6, 2024 at 12:15=E2=80=AFAM Martin Hundeb?ll via
lists.openembedded.org <martin=3Dgeanix.com@lists.openembedded.org>
wrote:
>
> Hi Khem,
>
> Please pick this patch for scarthgap too.
>
> Thanks,
> Martin
>
> On Fri, 2024-05-03 at 11:42 +0200, Martin Hundeb=C3=B8ll wrote:
> > Apparently, npm has changed its request accept header, so that cache
> > lookup misses. This causes an ENOTCACHED error when doing the offline
> > install in do_compile() from npm.bbclass.
> >
> > Fix it by updating the fake cache entry to match the newest behaviour
> > from npm.
> >
> > Note that npm doesn't agree with itself, as it still uses the
> > previous
> > header value when doing `npm cache add <pkg>`, but the new value when
> > doing `npm install <pkg>`.
> >
> > Bug submitted upstream:
> > https://github.com/npm/cli/issues/7465
> >
> > Signed-off-by: Martin Hundeb=C3=B8ll <martin@geanix.com>
> > ---
> >  .../recipes-devtools/nodejs/nodejs-oe-cache-20.12/oe-npm-cache  | 2
> > +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-
> > 20.12/oe-npm-cache b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-
> > 20.12/oe-npm-cache
> > index f59620764..eb0f143ea 100755
> > --- a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-20.12/oe-npm-
> > cache
> > +++ b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-20.12/oe-npm-
> > cache
> > @@ -30,7 +30,7 @@ const xlate =3D {
> >               time: Date.now(),
> >               url:  key,
> >               reqHeaders: {
> > -                 'accept': 'application/vnd.npm.install-v1+json;
> > q=3D1.0, application/json; q=3D0.8, */*',
> > +                 'accept': 'application/json',
> >               },
> >               resHeaders: {
> >                   "content-type": "application/json",
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#110259): https://lists.openembedded.org/g/openembedde=
d-devel/message/110259
> Mute This Topic: https://lists.openembedded.org/mt/105884883/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

