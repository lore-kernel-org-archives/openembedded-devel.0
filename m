Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id 6FBFF78F72
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Oct 2018 03:03:26 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id p3-v6so1898994qkb.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Oct 2018 20:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=DKS8st92HB+0UpUY7LEageASW19vFlpJe2BgmYtj/+o=;
	b=X8td0+jmRjCmAnTWsa5L3oT1L34tyCyYaKqcSICzUyefulJYNc8qRmrQvv8tpUhm9b
	Zg04vsgJiW/q5ow39vvGkdkaQZSu4ZPx8CCzKZB0fnAPCEyFmLtLOeb+dCkUvN4w1gKE
	q37yJnDWbmyDQgx3sduWKCwOx1mq42Mtstl9aOfZtkYOP5Lil1uMxNVmDtUoIHuNFWCk
	ueneZ4H2+aeXIJy7jMhseKg3PE0Kz6+gMEXS0msJ3Kw56YVgWRIpuu//ZgoqKFqQlO6d
	2FV1kJmFHI8zCFWq9iYBidmuwhD1OAHfilw/8Bq6FtXihhrZlU8/yu21mN1Rj08VDY5m
	WFhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=DKS8st92HB+0UpUY7LEageASW19vFlpJe2BgmYtj/+o=;
	b=jmSbwmfNRj0wA8RkVcK+3eX34KqdLU0+BFnqEsYyUsC9queix8qguMVM1h/yAYN/Uh
	VvtWgQDcdUzeKK70UMkMKAnMBckYoyPtiVAbGkwvt2huOnitr01ato7rtExi6jRW1Biv
	O37ppt8rMgei3cHu9lF7P14oK7DRDaw6/HEdbEP3mW/z+Dmx8aPO7fLnVh4Ud6omHeea
	qmVanHRvlIZkziF56IOylkEpZUj82Dzkv2oFEGoyV8dBUk7pkCRmv12McYWtstVGomBW
	eDVljAClnVSDkV2DHGjkLjCKoaW/ckgWl1h9ZzxWvQBf72EOuv0jCLFq+feaQ2710Sin
	Ljpw==
X-Gm-Message-State: AGRZ1gK6hvSmk50TvMLI/TBgYsBnFahaUHYVX2YMGI+mFxyXyHe9ogdX
	2OAPr39bj0ktlNzplJMfiFahei2C6S5jfDlJ95M=
X-Google-Smtp-Source: AJdET5fMmNR7T1I2LV1shBLiPX6Rgaq5facUWoUuNUbCClg46TWqaL4XAcZEKlk3vFFL0ihwny4TaBuVnaNib4L2Y1U=
X-Received: by 2002:a37:a84b:: with SMTP id r72mr5276553qke.2.1540609407047;
	Fri, 26 Oct 2018 20:03:27 -0700 (PDT)
MIME-Version: 1.0
References: <20181026104857.32142-1-schnitzeltony@gmail.com>
	<20181026104857.32142-3-schnitzeltony@gmail.com>
	<CAMKF1srLRF6KCLRycLHHTzAC8nAbF-QGtxMHxBUSwdFO--qYtQ@mail.gmail.com>
	<CALbNGRQ8Fik4GK92cPC1SZG1o0Ys_eOtBzoYciMzbGMuJt-NDw@mail.gmail.com>
In-Reply-To: <CALbNGRQ8Fik4GK92cPC1SZG1o0Ys_eOtBzoYciMzbGMuJt-NDw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 26 Oct 2018 20:03:00 -0700
Message-ID: <CAMKF1soeS=+cZkgi=EcNomrZy-7UnoSKMx_stxBk4cpZC0wE6g@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
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
X-List-Received-Date: Sat, 27 Oct 2018 03:03:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 26, 2018 at 6:59 AM Andreas M=C3=BCller <schnitzeltony@gmail.co=
m> wrote:
>
> On Fri, Oct 26, 2018 at 2:47 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On Fri, Oct 26, 2018 at 11:49 AM Andreas M=C3=BCller <schnitzeltony@gma=
il.com> wrote:
> > >
> > > Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> > > ---
> > >  meta-xfce/recipes-apps/catfish/catfish_1.4.6.bb | 17 +++++++++++++++=
++
> > >  1 file changed, 17 insertions(+)
> > >  create mode 100644 meta-xfce/recipes-apps/catfish/catfish_1.4.6.bb
> > >
> > > diff --git a/meta-xfce/recipes-apps/catfish/catfish_1.4.6.bb b/meta-x=
fce/recipes-apps/catfish/catfish_1.4.6.bb
> > > new file mode 100644
> > > index 000000000..229f882d0
> > > --- /dev/null
> > > +++ b/meta-xfce/recipes-apps/catfish/catfish_1.4.6.bb
> > > @@ -0,0 +1,17 @@
> > > +SUMMARY =3D "Catfish is a handy file searching tool for linux and un=
ix"
> > > +SECTION =3D "x11/application"
> > > +LICENSE =3D "GPLv2"
> > > +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4325afd396febcb659c36b495=
33135d4"
> > > +
> > > +inherit xfce-app distutils3 gtk-icon-cache
> > > +
> > > +DEPENDS +=3D "python3-distutils-extra-native"
> > > +
> > > +B =3D "${S}"
> >
> > perhaps, inheriting autotools-brokensep is aligned here.
>
> I decided not to use autotools-brokensep to avoid impression this is
> build by autotools - it is build by distutils.
>

I see. however its inheriting xfce-app -> xfce -> autotools

> Andreas

