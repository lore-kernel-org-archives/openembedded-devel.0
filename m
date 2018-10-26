Return-Path: <schnitzeltony@gmail.com>
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
	[209.85.210.67])
	by mail.openembedded.org (Postfix) with ESMTP id 708977458D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Oct 2018 13:59:08 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id x4so1149572otg.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Oct 2018 06:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=Uj4387WDAviLsFzn4BZtkzjpMqrVtxfKsbSKSQlDQYA=;
	b=gy3pxLZnB930sYI0IjyFRUaZd76GS1KFVPnPymVnqch1uSECBCWKKMqjj7GiutJmLM
	Fydu+hk6Fd4U/3uybkwWlyADkR1IL+FkAvRLXjSTL1zzvj1C04i8BiXQXEZI53SO5+G4
	IEVxaZNSl+UJVPJH/1Z2zypz24OUaIxVZjiPhE6S4s5uX1M/w3D/fhBzoU+jxCG49lxR
	3VSU5B/69Qcz1jbAA3AR0ESxTkJot/mhpiMFYlx2THHTl+n3Cvu8ha0aF4klKhsvQw5U
	cqxwDrQbMCYiMBeA10Z2hLr6M3f3YhKx2wc0vJ8U8jNmd1w8oh99YN+3gFFSEUAZlAIr
	Ki1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=Uj4387WDAviLsFzn4BZtkzjpMqrVtxfKsbSKSQlDQYA=;
	b=ILyxju2wvmDb74vrnRKjjjSW6wD0PEBhXhUSFKJh4owiLqYHAe+pGlb1TKLzIAIcfm
	aEiO9eWGPo4TwlTRlzrY5BfrjBB/MDpd82oOFvjrBLgJHsyzC3z5ob3nLyGmEF0P5lxv
	xsyEsKeFKGvhMsJIwPgImirj81ReLCrVynGk0IZrpNEKFQspZOPwlxh1rvWKYxLaoNi4
	ZthIruqPjE9PMSrSOYXGF4MSkKqHKNd4T06ADqbYdozd2N1HsZquevj7KRe/jq0Zre/B
	oObmwIVlTJzS0SU7pMxlr+MesZSNxVzhat6rRE9G4heeVzucvIjfNGHmZ3mlH5RKaylO
	dxjA==
X-Gm-Message-State: AGRZ1gIM4MAW7g8RdQBkch0KZV/bneW5bVr5atExG6gp5mqU4OudqWvE
	d5dHkyB2CCImhrvCNxge+BWGkNgb9MT+QZCXyrE=
X-Google-Smtp-Source: AJdET5dOO59XtijgNfLiyfy/xamlvcJtlEioXYVwbmhUZ58OU01HhnOv7XA2ixxApA+i50gGEppp4sN+Hu/m3a3WUCM=
X-Received: by 2002:a9d:d52:: with SMTP id 76mr2323888oti.326.1540562349362;
	Fri, 26 Oct 2018 06:59:09 -0700 (PDT)
MIME-Version: 1.0
References: <20181026104857.32142-1-schnitzeltony@gmail.com>
	<20181026104857.32142-3-schnitzeltony@gmail.com>
	<CAMKF1srLRF6KCLRycLHHTzAC8nAbF-QGtxMHxBUSwdFO--qYtQ@mail.gmail.com>
In-Reply-To: <CAMKF1srLRF6KCLRycLHHTzAC8nAbF-QGtxMHxBUSwdFO--qYtQ@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Fri, 26 Oct 2018 15:58:56 +0200
Message-ID: <CALbNGRQ8Fik4GK92cPC1SZG1o0Ys_eOtBzoYciMzbGMuJt-NDw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 3/8] catfish: initial add 1.4.6
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 26 Oct 2018 13:59:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 26, 2018 at 2:47 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Fri, Oct 26, 2018 at 11:49 AM Andreas M=C3=BCller <schnitzeltony@gmail=
.com> wrote:
> >
> > Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> > ---
> >  meta-xfce/recipes-apps/catfish/catfish_1.4.6.bb | 17 +++++++++++++++++
> >  1 file changed, 17 insertions(+)
> >  create mode 100644 meta-xfce/recipes-apps/catfish/catfish_1.4.6.bb
> >
> > diff --git a/meta-xfce/recipes-apps/catfish/catfish_1.4.6.bb b/meta-xfc=
e/recipes-apps/catfish/catfish_1.4.6.bb
> > new file mode 100644
> > index 000000000..229f882d0
> > --- /dev/null
> > +++ b/meta-xfce/recipes-apps/catfish/catfish_1.4.6.bb
> > @@ -0,0 +1,17 @@
> > +SUMMARY =3D "Catfish is a handy file searching tool for linux and unix=
"
> > +SECTION =3D "x11/application"
> > +LICENSE =3D "GPLv2"
> > +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4325afd396febcb659c36b49533=
135d4"
> > +
> > +inherit xfce-app distutils3 gtk-icon-cache
> > +
> > +DEPENDS +=3D "python3-distutils-extra-native"
> > +
> > +B =3D "${S}"
>
> perhaps, inheriting autotools-brokensep is aligned here.

I decided not to use autotools-brokensep to avoid impression this is
build by autotools - it is build by distutils.

Andreas

