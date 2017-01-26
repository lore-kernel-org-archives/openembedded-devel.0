Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id ECD12700F3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Jan 2017 18:54:51 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id r144so52436846wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Jan 2017 10:54:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=bGPFYTaFYVP1hho/O+3IUZAfFThoGCAplq7AfxJ/qao=;
	b=W3cX1+QYOINUdi0wA7fmPRLPDgqTEGRVsPsk3/F77py8WjE8Svc1+tctDBfhkNtvo9
	G6bteGFYObUTnZ3kmv4lBozbiaPloLRMVjaxpCmtMznff1zJkA8JhLQsUiy1SG5RAsYy
	3uMySDpldE3r2lndpijoGV9UWqmpX9BVjUG/QEKCG0YOBxlZh1+eFZYzopQpU1Y9+pmb
	H3vg+rJixv3austcPddGZOLjSmeXrFWitL39FFmbXRHaW7E54AhY3Eb4SxZKqXjTaIRr
	gPIB6LeWrsbdG0ju+v8deyJfOi9KD3fBcVF9C8hsZA2sBBJTtp26ZUaH57VzWDHE/5NK
	6Lsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=bGPFYTaFYVP1hho/O+3IUZAfFThoGCAplq7AfxJ/qao=;
	b=Hr4n2oQ4KbhiYUB9LOF6Ryh5TZmnajOAQic1/jVI4I4mSLdjDvXO3lzNydrPZguZIu
	aiuEZJfMC/nv0c0U3N1FHFM297rKrYjVJ39rkFYZZXjaw/PTgdQF3p7pN5mDGbmiD+q3
	8h7YPlltEUxSUOyHJmUcv2l9nnwtJI7ca6prWMEOh/7NhWa9yVMi58uUNlvhggLyQsqu
	YJFwgl/03h3axOkI32eXK23PhPqzEGgZxwk+EAw7Lb11OXoV2rB6kU76jwTjmO8VB/KU
	dXApndVRAVIxcK2MeAkpkUOGONzWq5vvZFewguSuZF0Lir6/aMv8OwsmAbQpNcuLlPAO
	Q3Cg==
X-Gm-Message-State: AIkVDXJsied6I6kZr0IDALMaWzqdYK1bB7pj+KfFB22gqTsKKhmzVDGyCtGo/qm9LpIgRw==
X-Received: by 10.223.129.163 with SMTP id 32mr4030537wra.140.1485456890057;
	Thu, 26 Jan 2017 10:54:50 -0800 (PST)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id o2sm3906349wra.42.2017.01.26.10.54.48
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 26 Jan 2017 10:54:48 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 26 Jan 2017 19:54:49 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20170126185449.GB3016@jama>
References: <1484134588-15143-1-git-send-email-oleksandr.kravchuk@pelagicore.com>
	<20170125145422.GB3260@jama>
	<CAKuJqM-N4+vnast8zJZGyY3kn0R1R3ThEiU8OnnVbHxoe3_Rmw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAKuJqM-N4+vnast8zJZGyY3kn0R1R3ThEiU8OnnVbHxoe3_Rmw@mail.gmail.com>
User-Agent: Mutt/1.7.2 (2016-11-26)
Subject: Re: [meta-oe][PATCH] nano: upgrade to 2.7.4
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
X-List-Received-Date: Thu, 26 Jan 2017 18:54:52 -0000
X-Groupsio-MsgNum: 64878
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lEGEL1/lMxI0MVQ2"
Content-Disposition: inline

--lEGEL1/lMxI0MVQ2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 26, 2017 at 07:24:31PM +0100, Oleksandr Kravchuk wrote:
> Martin -
>=20
> May I ask you how it was built? I cannot reproduce this with poky 2.2 and
> oe's 'master' and 'master-next' branches. The package builds perfectly
> fine, without any errors or warnings.

The build setup is described here:
http://www.openembedded.org/wiki/Bitbake_World_Status

but what the message means is that nano now autodetects file as
dependency, so you should be able to reproduce that warning in almost
any build environment if you do:

bitbake file

bitbake -c cleansstate nano

bitbake nano

>=20
> Thanks.
>=20
> On 25 January 2017 at 15:54, Martin Jansa <martin.jansa@gmail.com> wrote:
>=20
> > On Wed, Jan 11, 2017 at 12:36:28PM +0100, Oleksandr Kravchuk wrote:
> > > Signed-off-by: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
> >
> > nano-2.7.4: nano rdepends on file, but it isn't a build dependency,
> > missing file in DEPENDS or PACKAGECONFIG? [build-deps]
> >
> > > ---
> > >  .../nano/nano-2.2.5/ncursesw.includedir.patch                | 12
> > ------------
> > >  meta-oe/recipes-support/nano/nano.inc                        |  6
> > +++---
> > >  meta-oe/recipes-support/nano/nano_2.2.5.bb                   |  8
> > --------
> > >  meta-oe/recipes-support/nano/nano_2.7.4.bb                   |  6
> > ++++++
> > >  4 files changed, 9 insertions(+), 23 deletions(-)
> > >  delete mode 100644 meta-oe/recipes-support/nano/nano-2.2.5/ncursesw.
> > includedir.patch
> > >  delete mode 100644 meta-oe/recipes-support/nano/nano_2.2.5.bb
> > >  create mode 100644 meta-oe/recipes-support/nano/nano_2.7.4.bb
> > >
> > > diff --git a/meta-oe/recipes-support/nano/nano-2.2.5/ncursesw.include=
dir.patch
> > b/meta-oe/recipes-support/nano/nano-2.2.5/ncursesw.includedir.patch
> > > deleted file mode 100644
> > > index 0f224be..0000000
> > > --- a/meta-oe/recipes-support/nano/nano-2.2.5/ncursesw.includedir.pat=
ch
> > > +++ /dev/null
> > > @@ -1,12 +0,0 @@
> > > -diff -uNr nano-2.2.5.orig//configure.ac nano-2.2.5/configure.ac
> > > ---- nano-2.2.5.orig//configure.ac    2010-08-06 03:00:51.000000000
> > +0200
> > > -+++ nano-2.2.5/configure.ac  2010-08-10 14:11:52.000000000 +0200
> > > -@@ -442,7 +442,7 @@
> > > -     AC_CHECK_HEADERS(ncurses.h)
> > > -
> > > -     if test x$enable_utf8 !=3D xno; then
> > > --    AC_CHECK_LIB(ncursesw, get_wch, [CURSES_LIB=3D"-lncursesw"
> > CPPFLAGS=3D"-I/usr/include/ncursesw $CPPFLAGS" CURSES_LIB_NAME=3Dncurse=
sw
> > CURSES_LIB_WIDE=3Dyes])
> > > -+    AC_CHECK_LIB(ncursesw, get_wch, [CURSES_LIB=3D"-lncursesw"
> > CURSES_LIB_NAME=3Dncursesw CURSES_LIB_WIDE=3Dyes])
> > > -     fi
> > > -
> > > -     if eval "test x$CURSES_LIB_NAME =3D x"; then
> > > diff --git a/meta-oe/recipes-support/nano/nano.inc
> > b/meta-oe/recipes-support/nano/nano.inc
> > > index 0f31c6c..8a9f1e8 100644
> > > --- a/meta-oe/recipes-support/nano/nano.inc
> > > +++ b/meta-oe/recipes-support/nano/nano.inc
> > > @@ -12,8 +12,8 @@ INC_PR =3D "r3"
> > >
> > >  PV_MAJOR =3D "${@d.getVar('PV',1).split('.')[0]}.${@d.getVar('PV',1).
> > split('.')[1]}"
> > >
> > > -SRC_URI =3D "https://nano-editor.org/dist/v${PV_MAJOR}/nano-${PV}.ta=
r.gz"
> > > +SRC_URI =3D "https://nano-editor.org/dist/v${PV_MAJOR}/nano-${PV}.ta=
r.xz"
> > >
> > > -inherit autotools gettext
> > > +inherit autotools gettext pkgconfig
> > >
> > > -PACKAGECONFIG[tiny] =3D "--enable-tiny,--enable-all,"
> > > +PACKAGECONFIG[tiny] =3D "--enable-tiny,"
> > > diff --git a/meta-oe/recipes-support/nano/nano_2.2.5.bb
> > b/meta-oe/recipes-support/nano/nano_2.2.5.bb
> > > deleted file mode 100644
> > > index e656f46..0000000
> > > --- a/meta-oe/recipes-support/nano/nano_2.2.5.bb
> > > +++ /dev/null
> > > @@ -1,8 +0,0 @@
> > > -include nano.inc
> > > -
> > > -PR =3D "${INC_PR}.0"
> > > -
> > > -SRC_URI +=3D "file://ncursesw.includedir.patch"
> > > -
> > > -SRC_URI[md5sum] =3D "77a10a49589f975ce98350a4527a2ebf"
> > > -SRC_URI[sha256sum] =3D "9015945d1badabbada203b37c4779d
> > 3dd1066234235c714deb439989c5cd7d9e"
> > > diff --git a/meta-oe/recipes-support/nano/nano_2.7.4.bb
> > b/meta-oe/recipes-support/nano/nano_2.7.4.bb
> > > new file mode 100644
> > > index 0000000..5016f2e
> > > --- /dev/null
> > > +++ b/meta-oe/recipes-support/nano/nano_2.7.4.bb
> > > @@ -0,0 +1,6 @@
> > > +include nano.inc
> > > +
> > > +PR =3D "${INC_PR}.0"
> > > +
> > > +SRC_URI[md5sum] =3D "c011c7f9e47cb1da27d4e7cc8b56ec6a"
> > > +SRC_URI[sha256sum] =3D "752170643039e2c95a433de357f0c7
> > 0a8c4c4c561a90a7e7259a63e225b659b9"
> > > --
> > > 2.7.4
> > >
> > > --
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> > --
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> >
>=20
>=20
> --=20
> Yes, this is my signature
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--lEGEL1/lMxI0MVQ2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWIpF7gAKCRA3VSO3ZXaA
HNmyAKCD0vH1HHCujeBMYtqgBsrK/xW22QCeORPRyUsIw06NM2cUyAnVFPi0bJk=
=tBzk
-----END PGP SIGNATURE-----

--lEGEL1/lMxI0MVQ2--
