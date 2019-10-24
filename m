Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id F2B567F96C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 09:03:28 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id u184so22750521qkd.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 02:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=h99eRRHxbG1/EJV3qzh8bqcaTzZX8S4aUZz23eqqxeo=;
	b=gfqZuy7b0d8a3yOTNCBuZlABoAyjsOg2ccAY1G66dP8lqvKUi2cCTc/L2KEbMVeCBy
	QrZdBrTXjgAB/lLCLZ+eKv3LWSyDsDs5W73r9YmfJaLrFN61s3DdwQCJ7qDKDUeUaNKx
	H38KI7Eedx9fpbaxN2ierP82HRbyzpfdWdJ4xoFqRmXUrapgw+HU+NX26zY7kvVac4U6
	wI5tbannY/bvZ5jAPBAqyh5ZjpIRaJxNhf2fLtxrtYgt0pZtfYP5ABM/8huGevHHae94
	Mkvm8kmsfTknFNmagb+cpb2qlB5cUP3vPvWFbkez9+/qFSHJe8yPYb1li4f+DNoAhsOy
	zrBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=h99eRRHxbG1/EJV3qzh8bqcaTzZX8S4aUZz23eqqxeo=;
	b=Ef+CHMFqh8ejBKjOHKpKlHjOO1YCOLgjiSjz7PVZonZPXesAxrOvevSAjrQtrQ7SMY
	Od2+btMTE2DD2LyU84UZo3pOSsHXapBYP8IBQ18By1xbJxBc5UHXsPowO3Q72i0SxCIH
	V1lsNEhM5cb60Td261g3gzM9Sv6FWAbC19zgfUOov9TGrUQ0QlfIE8rq7VExOloWI8vP
	vIS3UUQRXfh1aTg1kWHb0ygS7VVEVRy8Etymj7R6KuR0EX9WZO/IbQRismdajLbeqk5v
	YUNCQX89Uni/xt0zmRdpjzQP/5EUTo0RVB9d7sx00MDWtBEo9S/7lWanvHHh3RVDLC9e
	9Vfw==
X-Gm-Message-State: APjAAAWNqxTjIuB33rMWBTV7uElU/fRvKtsSNCk4rFZ+b7Ba4r7X+L/j
	EmKJGVuWHwsfp8gvtGW1N5LPVqP2/7Zwb7GxROU=
X-Google-Smtp-Source: APXvYqxSiCcn2g5zEiQDJVqZuxbUXo0ndc4E+4ZneSe5pzn94QH7RVMmZbWjSolkf7Uq+VuDJlUZKV2DyCGzQY5I+Cs=
X-Received: by 2002:a05:620a:134b:: with SMTP id
	c11mr9952831qkl.71.1571907809537; 
	Thu, 24 Oct 2019 02:03:29 -0700 (PDT)
MIME-Version: 1.0
References: <CAJNJ+3e6C_gwQ7Oyq0xKTiDCo47SHcr5naChERq0wFrk+r7N9w@mail.gmail.com>
	<CAMKF1sr3YHNUOm=7AEU6VZJDSy-3CdeVgOXAiUvM0Z9e0n+4Sg@mail.gmail.com>
	<CAJNJ+3daY1os_VUtVg8AU+POUK+E6q6GF-FkMx9dWfOEAmygEw@mail.gmail.com>
In-Reply-To: <CAJNJ+3daY1os_VUtVg8AU+POUK+E6q6GF-FkMx9dWfOEAmygEw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 24 Oct 2019 10:03:02 +0100
Message-ID: <CAMKF1soZwpo0YewBPFJRqg6BQRkftPfcMLn91Vj=J538wox-2w@mail.gmail.com>
To: =?UTF-8?Q?Micha=C5=82_Lower?= <michal@pcb.red>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH] update python setuptools-scm from 2.1.0 to 3.3.3
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
X-List-Received-Date: Thu, 24 Oct 2019 09:03:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 24, 2019 at 9:48 AM Micha=C5=82 Lower <michal@pcb.red> wrote:
>
> > please use git format-patch to generate it
> This is exactly what I've did. Sadly it appears that Gmail inserts
> line breaks on its own. Can I send the patch as an attachment so it
> will be kept intact? I cannot use git send-email since it doesn't
> support gmail two actor authentication and my account doesn't allow
> for application passwords.

yeah I see. if you use github then send a pull request against
https://github.com/openembedded/meta-openembedded
I do process that as well.

>
> czw., 24 pa=C5=BA 2019 o 10:18 Khem Raj <no-reply@forwardemail.net> napis=
a=C5=82(a):
> >
> > Hi Micha=C5=82
> >
> > This patch appears malformed. So please use git format-patch to
> > generate it and git send-email to send it also rebase it on top of
> > latest master
> >
> > On Tue, Oct 22, 2019 at 9:03 AM Micha=C5=82 Lower <michal@pcb.red> wrot=
e:
> > >
> > > Previous version fails to compile for zeus branch. Upgrading fixes th=
at.
> > >
> > > Signed-off-by: Michal Lower <michal at pcb.red>
> > > ---
> > >  meta-python/recipes-devtools/python/python-setuptools-scm.inc | 4 ++=
--
> > >  ...setuptools-scm_2.1.0.bb =3D> python-setuptools-scm_3.3.3.bb} | 0
> > >  ...etuptools-scm_2.1.0.bb =3D> python3-setuptools-scm_3.3.3.bb} | 0
> > >  3 files changed, 2 insertions(+), 2 deletions(-)
> > >  rename meta-python/recipes-devtools/python/{python-setuptools-scm_2.=
1.0.bb
> > > =3D> python-setuptools-scm_3.3.3.bb} (100%)
> > >  rename meta-python/recipes-devtools/python/{python3-setuptools-scm_2=
.1.0.bb
> > > =3D> python3-setuptools-scm_3.3.3.bb} (100%)
> > >
> > > diff --git a/meta-python/recipes-devtools/python/python-setuptools-sc=
m.inc
> > > b/meta-python/recipes-devtools/python/python-setuptools-scm.inc
> > > index 98883ec39..a7e1bf6ad 100644
> > > --- a/meta-python/recipes-devtools/python/python-setuptools-scm.inc
> > > +++ b/meta-python/recipes-devtools/python/python-setuptools-scm.inc
> > > @@ -2,8 +2,8 @@ SUMMARY =3D "the blessed package to manage your versi=
ons
> > > by scm tags"
> > >  LICENSE =3D "MIT"
> > >  LIC_FILES_CHKSUM =3D
> > > "file://PKG-INFO;beginline=3D8;endline=3D8;md5=3D8227180126797a0148f9=
4f483f3e1489"
> > >
> > > -SRC_URI[md5sum] =3D "cfec5d2dbbd0a85c40066f79035b5878"
> > > -SRC_URI[sha256sum] =3D
> > > "a767141fecdab1c0b3c8e4c788ac912d7c94a0d6c452d40777ba84f918316379"
> > > +SRC_URI[md5sum] =3D "50b2199082fe808d032ec1710c9d7415"
> > > +SRC_URI[sha256sum] =3D
> > > "bd25e1fb5e4d603dcf490f1fde40fb4c595b357795674c3e5cb7f6217ab39ea5"
> > >
> > >  PYPI_PACKAGE =3D "setuptools_scm"
> > >  inherit pypi
> > > diff --git a/meta-python/recipes-devtools/python/python-setuptools-sc=
m_2.1.0.bb
> > > b/meta-python/recipes-devtools/python/python-setuptools-scm_3.3.3.bb
> > > similarity index 100%
> > > rename from meta-python/recipes-devtools/python/python-setuptools-scm=
_2.1.0.bb
> > > rename to meta-python/recipes-devtools/python/python-setuptools-scm_3=
.3.3.bb
> > > diff --git a/meta-python/recipes-devtools/python/python3-setuptools-s=
cm_2.1.0.bb
> > > b/meta-python/recipes-devtools/python/python3-setuptools-scm_3.3.3.bb
> > > similarity index 100%
> > > rename from meta-python/recipes-devtools/python/python3-setuptools-sc=
m_2.1.0.bb
> > > rename to meta-python/recipes-devtools/python/python3-setuptools-scm_=
3.3.3.bb
> > > --
> > > 2.17.1
> > > --
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel

