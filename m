Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91CB6CA0EF9
	for <webhook@archiver.kernel.org>; Fri, 30 Aug 2024 09:10:57 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web10.8734.1725009054763793324
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 Aug 2024 02:10:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dO6JYy7Y;
 spf=pass (domain: gmail.com, ip: 209.85.208.171, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2f3f163e379so25297541fa.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 30 Aug 2024 02:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725009053; x=1725613853; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1pBy+F258StIJDtjrLbID3rL03z872ZPnsq52EpGV7o=;
        b=dO6JYy7Y/3wJjWezF1m4/UKEzziLTMsS9ThidXVVRk1oDkXtdWO9qCYPgYkstgr+Qj
         6TWtsPnH8sDV5OjJditZMGLv6xaUeYTKQjcc1mXlu5qQu+jNInmU23p2hee2sAsTKoIu
         yEJq1owuVqJaeWBwUwQyUjB+ALpG55mkLJLQ7/0y8kJsHVAZmMLhAWntSyaWfO7avqxY
         AAzfrMAZINc0Np/FRF4BkUv9dv502szX7olhhIbD7CEVBSkdgKxK/FIF5hkSPsb8rJvA
         9RUdwGOX20ArQgQze8igV0EWrIH7B5pkfXKg+40dxBTh0f44XCL+6ai/XI9/iVVNw3J9
         ot1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725009053; x=1725613853;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1pBy+F258StIJDtjrLbID3rL03z872ZPnsq52EpGV7o=;
        b=kjrWLGzcsjatzPhVaPxfW5JTTU94NlzLzqQlV4eWQMwga35TzRdUmQ+Oh+a8sLlpfC
         kOmJI0mFcWNKgzFvmK0zZVhwZNavUHfgOyffhZtceda3a6dlS/48X2Sn7Syt3Pg/aYh5
         RZ9ozKhLE0q975drDpeMxEJkRrz4cLcJTWUEi4LYUblrGgQafeiC2JXFKRHB9lEPfBW9
         iU16gQRMnEzHpblEc5jSLTeF7JD0GWvfoClqc4qhzo0o8wm2/VbWkuB/n2BhwNsqLUYD
         7DX6BV97Lr7RWOAgXe6pkkIp8ZhawbEqDklqx7ekuSp7JMAvfBeOH3zkwgMQUr3N/PoB
         Q6LA==
X-Gm-Message-State: AOJu0YyYiaRZOrmT6xMAW9LQC450RpWh9KfZaLBS2X2Ne9L0PvWqbtWJ
	KUhGuS32PqxTBesQY1HPaeFPJpi8Tm5GB9LW/S0EfPOrhO/FZt2+Ip3+axz/+/iEidmkEoLzofu
	99QUPb+NLknh2IBzt/UNqHjRvhEk=
X-Google-Smtp-Source: AGHT+IFnERWMwHPvtNoX84a2t0ScPISaby/lmKpcQC3Y9sJksj5Sb/fzUqJZq4bK5soDyO5vhP9BTbAxxjStqYB3n90=
X-Received: by 2002:a2e:4611:0:b0:2ef:22a6:d90d with SMTP id
 38308e7fff4ca-2f6108aef13mr41790601fa.47.1725009052120; Fri, 30 Aug 2024
 02:10:52 -0700 (PDT)
MIME-Version: 1.0
References: <20240830081819.2635680-1-martin.jansa@gmail.com>
 <CA+chaQe_FmAQw8s6zyGdKrgBGAf=5ejCcWGYrRMkJe7csuaF6Q@mail.gmail.com> <ZtGJeclX4BfJcU4R@nuoska>
In-Reply-To: <ZtGJeclX4BfJcU4R@nuoska>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 30 Aug 2024 11:10:36 +0200
Message-ID: <CA+chaQdzkJwGdOv=jWm4ZiZZggAOhZHcGDFDOBxq12Peq0Wqvg@mail.gmail.com>
Subject: Re: [meta-oe][PATCH] gcab: keep buildpaths QA issue as a warning
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: openembedded-devel@lists.openembedded.org, akuster808@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 30 Aug 2024 09:10:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112054

> Your proposal could be the correct fix, I hope it works.

It builds without the QA issue, I haven't tested it in runtime as I
don't use gcab anywhere it was just one of buildpaths failures in my
world builds.

On Fri, Aug 30, 2024 at 10:57=E2=80=AFAM Mikko Rapeli <mikko.rapeli@linaro.=
org> wrote:
>
> Hi,
>
> On Fri, Aug 30, 2024 at 10:40:53AM +0200, Martin Jansa wrote:
> > Mikko: can you please explain why meson embeds absolute paths in
> > glib-mkenum filename on purpose?
> >
> > Or were you seeing any other buildpaths than these 2?
> >
> > lib32-gcab/1.6/package $ grep -R styhead .
> > ./usr/src/debug/lib32-gcab/1.6/libgcab/gcab-enums.c:#include
> > "WORKDIR/build/../gcab-1.6/libgcab/gcab-file.h"
> > ./usr/src/debug/lib32-gcab/1.6/libgcab/gcab-enums.c:#include
> > "WORKDIR/build/../gcab-1.6/libgcab/gcab-folder.h"
> >
> > glib-mkenum supports also @basename@ since 2.22 which would avoid this =
QA issue
> >   @filename@            name of current input file
> >   @basename@            base name of the current input file (Since: 2.2=
2)
> > if we update
> > ./libgcab/gcab-enums.c.etemplate:#include "@filename@"
>
> I was googling for this and found MRs and issues in meson github
> which pointed to embedding build time absolute paths on purpose to
> fix something.
>
> Sadly my laptop crashes (Thinkpad T14 gen 3 crashes when plugging to powe=
r lid closed)
> and I lost the browser tabs before writing the commit message.
>
> Your proposal could be the correct fix, I hope it works.
>
> Cheers,
>
> -Mikko
>
> > Cheers,
> >
> > On Fri, Aug 30, 2024 at 10:18=E2=80=AFAM Martin Jansa <martin.jansa@gma=
il.com> wrote:
> > >
> > > INSANE_SKIP:gcab-src doesn't work with multilib where the package is
> > > named ${PN}-src (e.g. lib32-gcab-src) and it's better to just lower
> > > buildpaths from ERROR_QA to WARN_QA instead of skipping it completely=
,
> > > because it's still an issue which should be fixed (at least to improv=
e
> > > hashserv efficiency if you don't care about reproducibility itself)
> > >
> > > The backport to scarthgap from:
> > > https://lists.openembedded.org/g/openembedded-devel/message/111739
> > > should IMHO be just reverted there as buildpaths QA issues
> > > aren't fatal in scarthgap.
> > >
> > > Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> > > ---
> > >  meta-oe/recipes-gnome/gcab/gcab_1.6.bb | 4 +++-
> > >  1 file changed, 3 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/meta-oe/recipes-gnome/gcab/gcab_1.6.bb b/meta-oe/recipes=
-gnome/gcab/gcab_1.6.bb
> > > index 49c64f0ba6..0d9410b4d5 100644
> > > --- a/meta-oe/recipes-gnome/gcab/gcab_1.6.bb
> > > +++ b/meta-oe/recipes-gnome/gcab/gcab_1.6.bb
> > > @@ -24,4 +24,6 @@ PACKAGECONFIG[tests] =3D "-Dtests=3Dtrue -Dinstalle=
d_tests=3Dtrue,-Dtests=3Dfalse -Dinst
> > >  BBCLASSEXTEND =3D "native"
> > >
> > >  # meson embeds absolute paths to generated files on purpose
> > > -INSANE_SKIP:gcab-src +=3D "buildpaths"
> > > +# ERROR: QA Issue: File /usr/src/debug/gcab/1.6/libgcab/gcab-enums.c=
 in package gcab-src contains reference to TMPDIR [buildpaths]
> > > +ERROR_QA:remove =3D "buildpaths"
> > > +WARN_QA:append =3D " buildpaths"
> > > --
> > > 2.46.0
> > >

