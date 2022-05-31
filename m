Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7778DC433EF
	for <webhook@archiver.kernel.org>; Tue, 31 May 2022 15:44:08 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.web12.51458.1654011843548738737
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 31 May 2022 08:44:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fWqTrt0N;
 spf=pass (domain: gmail.com, ip: 209.85.160.170,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f170.google.com with SMTP id k6so4027659qtq.3
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 31 May 2022 08:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=soozeyLDyrvjoGgm+63pRt4cgBmOMJ5o8RMsf3cAlsU=;
        b=fWqTrt0NCASqukKlJlfKF5hrmEInTEier4V/sOPoyNVCr4FtnIapjiaL8uuqZULTU5
         iA4n4IHzvzatepsnsom6cktvqNHin3mYoaTl4qO5Wa6MfC1b1qZLiF+8mqLqfRziAxhO
         SdF6mYHH4icUCrGEXoRCEFAhUs5+n8d2mmbUm2Hr4/41t2dSHP8xsya7TBWx3Ys6yc2q
         0uauAqQJcm/hxVIFK1EtpjBnp085k2oyCtpsU7aIDrBZtlBAQOj9ZmJe6hRabOZmOS17
         jkOrpYzA6dNWOyB8ucgzcVS4HITnM74x17ATf8pOWk0sPWzB9hJdLYYexzEjy63LqwkZ
         HJxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=soozeyLDyrvjoGgm+63pRt4cgBmOMJ5o8RMsf3cAlsU=;
        b=Z5HW+LLnqPp+vlHTXM4C4zyHgkNvMEILKJR3dGdYedc4ni4Fclu8O7hqaa9xqwwhDB
         YSzNKhvdzdkyLJfRxy5/c5Dz9yLQLwc+T7j4Ap2gOG3tlURf8kU1JYK0IUFzFms3QoPi
         +9pJsFqi7mnDRxL7fwJwnxuUjEUEO7h6qNoTVT9kko2llh90jenEGc4LU7zRakewYETa
         wc2of4pRNqatC94ENPdcrm5nWIyHruLilsWrtmKXGS2RsCNcfnhuhe690ktKvNDtw2bL
         vVNhSIdB4xURt2SdUDXM+6zapR9wgakSzP+CX1c8PW0qz42X4g7oiJGhJ/r2UBtdEWxK
         VtNg==
X-Gm-Message-State: AOAM533HJqcrDldJ8TmzjjmeU+BGtFqJ3NG1WcAFjnpyuDFrhIKG7b3d
	T7lnMsP7wVx/fQIJQ9bj30EjuFk5Dzbq07XYL0o=
X-Google-Smtp-Source: 
 ABdhPJzoDvxovZkmxZh6UoESDKF8nonYwefBJTaIOrC3JDCTv3IapKZ7i/DZ7LrPEsYOaJgt2nhY63f57DWGGxCGCoQ=
X-Received: by 2002:a05:622a:4c9:b0:304:b650:683d with SMTP id
 q9-20020a05622a04c900b00304b650683dmr5883431qtx.229.1654011842479; Tue, 31
 May 2022 08:44:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220530122952.2715776-1-samuli.piippo@qt.io>
 <9881391e-a6d9-beb4-14a4-de636795c22@spiteful.org>
 <CABXoSoVEMV4xPWmftuJcX63QCV5ZPcxObLzmF+kzY7kH1F=h2A@mail.gmail.com>
 <ca74cd1d-f065-9e29-8445-242f917e6d8@spiteful.org>
In-Reply-To: <ca74cd1d-f065-9e29-8445-242f917e6d8@spiteful.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 31 May 2022 08:43:36 -0700
Message-ID: 
 <CAMKF1sqXUJUth0Ap0a=fqrUJTsrx8+koMUMDpykDXuKc=yxCLQ@mail.gmail.com>
Subject: Re: [oe] [meta-multimedia][PATCH] flite: add recipe
To: Scott Murray <scott.murray@konsulko.com>
Cc: Samuli Piippo <samuli.piippo@gmail.com>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 31 May 2022 15:44:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97354

On Tue, May 31, 2022 at 8:35 AM Scott Murray <scott.murray@konsulko.com> wrote:
>
> On Tue, 31 May 2022, Samuli Piippo wrote:
>
> > On Mon, 30 May 2022 at 17:43, Scott Murray <scott.murray@konsulko.com>
> > wrote:
> >
> > > On Mon, 30 May 2022, Samuli Piippo wrote:
> > >
> > > > CMU Flite (festival-lite) is a small, fast run-time open source
> > > > text to speech synthesis engine developed at CMU and primarily
> > > > designed for small embedded machines.
> > > >
> > > > Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
> > > > ---
> > > >  .../recipes-multimedia/flite/flite_2.2.bb     | 19 +++++++++++++++++++
> > > >  1 file changed, 19 insertions(+)
> > > >  create mode 100644 meta-multimedia/recipes-multimedia/flite/
> > > flite_2.2.bb
> > > >
> > > > diff --git a/meta-multimedia/recipes-multimedia/flite/flite_2.2.bb
> > > b/meta-multimedia/recipes-multimedia/flite/flite_2.2.bb
> > > > new file mode 100644
> > > > index 000000000..9ab9c0208
> > > > --- /dev/null
> > > > +++ b/meta-multimedia/recipes-multimedia/flite/flite_2.2.bb
> > > > @@ -0,0 +1,19 @@
> > > > +SUMMARY = "Flite: a small run-time speech synthesis engine"
> > > > +HOMEPAGE = "http://cmuflite.org"
> > > > +SECTION = "libs/multimedia"
> > > > +LICENSE = "BSD-3-Clause"
> > > > +LIC_FILES_CHKSUM = "file://COPYING;md5=b3b732d1349633a53e69356607fd2d6c"
> > > > +
> > > > +inherit autotools-brokensep
> > > > +
> > > > +SRC_URI = "git://
> > > github.com/festvox/flite.git;protocol=https;branch=master"
> > > > +
> > > > +SRCREV = "e9e2e37c329dbe98bfeb27a1828ef9a71fa84f88"
> > > [snip]
> > >
> > > There's no 2.3 tag, but the README.md and Makefile imply that 2.3 was
> > > released in March 2022 (see commit 530060de), and the current voice files
> > > on http://festvox.org/flite/packed/ are "flite-2.3".  So perhaps this
> > > should be building that instead of the ~2 years old 2.2?
> >
> > Hard to say if there's a specific revision that was meant to be the
> > release, but I could update this to 2.3 and just use the latest revision?
>
> I'd be in favor of a _git recipe that set PV = "2.3+git${SRCPV}", but Khem
> might have a different opinion.

yeah if there is no tag then this is a better approach.

>
> > > > +
> > > > +S = "${WORKDIR}/git"
> > > > +
> > > > +EXTRA_OECONF += "--enable-shared"
> > > > +
> > > > +do_install:append() {
> > > > +    chown -R root:root ${D}${libdir}/*
> > >
> > > This seems a bit odd, I'm curious what prompted adding it?
> >
> > The installed files had local user and group IDs that caused host
> > contamination error.
>
> Hrm, that suggests upstream have a broken Makefile using "cp -p", it could
> be worthwhile to poke them about it.  We have had a recipe for an older
> version in AGL for quite a while and didn't see it, so it seems like
> something changed.

right, its perhaps in install target of makefile where it maybe the
better place to fix
it and also upstream it.

>
> Scott
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#97353): https://lists.openembedded.org/g/openembedded-devel/message/97353
> Mute This Topic: https://lists.openembedded.org/mt/91429478/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

