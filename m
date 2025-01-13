Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66EBBC02180
	for <webhook@archiver.kernel.org>; Mon, 13 Jan 2025 19:29:28 +0000 (UTC)
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
 by mx.groups.io with SMTP id smtpd.web11.26830.1736796562837348823
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Jan 2025 11:29:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nMN7rmsl;
 spf=pass (domain: gmail.com, ip: 209.85.161.52, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-5f2e370bb3aso1157573eaf.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Jan 2025 11:29:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736796559; x=1737401359; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yBvlWmtDhK1KffdxI+y2pkLUf4WSeGr/hYtTrSTnYwY=;
        b=nMN7rmsl8SZTBuLbLKhzScG3oB/nzzvEiKxZTtYx7iQFfUvgw0C5JKUwa6NWcJC6nC
         u8crCUIH3+rHdYIg1utYbwE9DJiOPZobxAAQgQUTrs0iHYqPplr+dgUttESwpkxHdD1a
         0Y6zTbOVjQsJtlAdt310qHndAoLO4egen2NjbR/ysmtB5JhOdzJoiNguML9K4BjNg4Z8
         Zd3wHuKf/oV5nooKMy3rLrPBFA0v1RAGn8ezgit36XHnqRKzT418QlTs8e+NVpCXf2f9
         cmlgnyAgf7UrVHADu2tUK7o1rjrnK066uIqPDauF9/0z4at0fGpK0FfC8eRT7Kz3p4hC
         3v3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736796559; x=1737401359;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yBvlWmtDhK1KffdxI+y2pkLUf4WSeGr/hYtTrSTnYwY=;
        b=t1mz5NemKTY8yGItImc9ETzcIlkQsPCJ3naemog6PZN7lg7ow6PskmPmJ3cLfNS4t6
         wpg6MlBt2sTsLFBF7PCCiaW6jDZaB45sXLa19sPbaz8xWRzK9RZZn29oT2yYE/XmphTN
         ngxSmo5GdjNbjwwft5qcxvYcYQyZSHZ7iBbiNrkY3ZQF9q6rs+c8rWIRnHAlKtqVrBn9
         z/CSUW1Y5L7yrD3ooVdeolSmwYlN+qUJhC0BnkgiuR/dvM+l8oDpa1pp+cZGo9dPp/Ht
         O8aMTYspnqvWfrul0DFyA7YRI1TQ1mcCNijl/kwpE6CLYJ+Af+VpY2lWZMaajoFHBrnx
         PptA==
X-Gm-Message-State: AOJu0YyPKs7N3buBmeUme1/pXtVqL3QfiqpL5nOFKCBZ6Ewi5a/iRz8f
	5rQAFwtHu4sPFlcdXv6SL3GxKZtK15U8k6ZpFix9QR2joGmpwgz8lrbPBqkOhSxHrgUdWOrxqiR
	yMbuw7Mzizw08HeIb6TBI6GnvWlY=
X-Gm-Gg: ASbGnctPE0XSorICaX1jLVgdIL6Sa4QlU1xUTicjvKmwWQrZSM15e+GKtuKUNQB5UGD
	00RwJBWIAl6oXvIJQ2wOsDgXbdwKp457KcXNC8xM/4sSB07a+XSqeushBm7eZKz4LA6c=
X-Google-Smtp-Source: AGHT+IFKmuuY/FrEeapg1L6K+bw2kygRnnVy7mNG6qSckg8dzFFqAjHxBCWcCs3+8XPhsBtY5A/DUcB6sQu6wGbXDIo=
X-Received: by 2002:a05:6871:7886:b0:297:2763:18d4 with SMTP id
 586e51a60fabf-2aa066b74e5mr11638696fac.15.1736796558125; Mon, 13 Jan 2025
 11:29:18 -0800 (PST)
MIME-Version: 1.0
References: <20250113044603.3467963-1-raj.khem@gmail.com> <20250113044603.3467963-3-raj.khem@gmail.com>
 <CA+chaQdYBu-RsV1ekg6m-Bs6xX69g6_sRm3vU+VbAYk2Vf3Y2g@mail.gmail.com>
In-Reply-To: <CA+chaQdYBu-RsV1ekg6m-Bs6xX69g6_sRm3vU+VbAYk2Vf3Y2g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 13 Jan 2025 11:28:51 -0800
X-Gm-Features: AbW1kvZ52wGF1dY1NqiBtlPcT-Ubp6TA-N9KAmhMdv-XtehZjLOuDtuDHYP8Lek
Message-ID: <CAMKF1sobMGyi+1X=9QH+XjS74qN3R3EWkdUJ1SO6jJcwkKeESw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 3/5] cpp-netlib: Skip recipe, not buildable
 with boost >= 1.87
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Jan 2025 19:29:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114841

yeah makes sense. I have fixed it in master-next.

On Sun, Jan 12, 2025 at 10:59=E2=80=AFPM Martin Jansa <martin.jansa@gmail.c=
om> wrote:
>
> Hi Khem,
>
> can we use ?=3D for SKIP_RECIPE? I was asked to do that before, because
> it makes it easier to un-skip it locally (hopefully when someone is
> preparing the fix for you to merge). e.g.
> https://git.openembedded.org/meta-openembedded/commit/?id=3D96a92761c0a1b=
b2317fa4ea422c32e4473405103
> https://git.openembedded.org/meta-openembedded/commit/?id=3Dd7f5367b53f6f=
d410e1ebb270f52c2d9f4b3435a
>
> All current SKIP_RECIPE except vlc are using ?=3D.
>
> Thanks
>
> On Mon, Jan 13, 2025 at 5:46=E2=80=AFAM Khem Raj via lists.openembedded.o=
rg
> <raj.khem=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta-oe/recipes-support/cpp-netlib/cpp-netlib_git.bb | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/meta-oe/recipes-support/cpp-netlib/cpp-netlib_git.bb b/met=
a-oe/recipes-support/cpp-netlib/cpp-netlib_git.bb
> > index bda5177fc4..3cf166bd4a 100644
> > --- a/meta-oe/recipes-support/cpp-netlib/cpp-netlib_git.bb
> > +++ b/meta-oe/recipes-support/cpp-netlib/cpp-netlib_git.bb
> > @@ -28,3 +28,5 @@ do_install:append() {
> >      sed -i -e 's|${RECIPE_SYSROOT}||g' ${D}${libdir}/cmake/cppnetlib/c=
ppnetlibConfig.cmake
> >      sed -i -e 's|${RECIPE_SYSROOT}||g' ${D}${libdir}/cmake/cppnetlib/c=
ppnetlibTargets-noconfig.cmake
> >  }
> > +
> > +SKIP_RECIPE[cpp-netlib] =3D "Does not work with boost >=3D 1.87"
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#114823): https://lists.openembedded.org/g/openembed=
ded-devel/message/114823
> > Mute This Topic: https://lists.openembedded.org/mt/110582198/3617156
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[martin.jansa@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

