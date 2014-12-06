Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id 50627723A8
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  6 Dec 2014 06:51:12 +0000 (UTC)
Received: by mail-wi0-f178.google.com with SMTP id em10so593052wid.17
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Dec 2014 22:51:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=lmZ55b1qHHNKktvf9vc8MWI6Y4vUQuWjsZie7FanJoo=;
	b=l8Encgdv5Ty1Mgz8IEfr1FxlP6Awr9NMQsdhCeaTH9v1elmgjU5vUZEmAMJIJZ8qR+
	IaP/Az3wkjrNnKovUKAOpxfLWYCntsXM1PBclxv89bn/FQS0/J9WN0RCtnUo+3PuUJ/Y
	uXMnJL488xFJLjFSGFOASmbwtblilC9G93Ynkfd9nJUjP4EYbXhGZ+jKx2JgdQJ29Xz6
	LcQyV+HdxXuJ7yY0LZTGMNgjfCuISSN17CAaEbP/pFaVRsMAcc22t2usKMlvLaJ6OJ8K
	CuFaxZHqs69IlE2z7eZ91WyAVkpUwMEfAOMhsRoDI7XAU68yY9YFOwOqTfV3tlCYPtpf
	ZiPw==
X-Received: by 10.194.222.34 with SMTP id qj2mr30892537wjc.80.1417848672102;
	Fri, 05 Dec 2014 22:51:12 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id s9sm801505wiz.12.2014.12.05.22.51.11
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 05 Dec 2014 22:51:11 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sat, 6 Dec 2014 07:51:16 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20141206065116.GA2448@jama>
References: <1417801829-2363-1-git-send-email-rapphil@gmail.com>
	<20141205225538.GB2446@jama>
	<CAENGNhd1fzx8SOchN1oYi5VJYyAujDwwNmHx81XpdOu66GGXxA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAENGNhd1fzx8SOchN1oYi5VJYyAujDwwNmHx81XpdOu66GGXxA@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH] libftdi: update to 1.1
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 06 Dec 2014 06:51:14 -0000
X-Groupsio-MsgNum: 53211
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="EVF5PPMfhYS0aIcm"
Content-Disposition: inline

--EVF5PPMfhYS0aIcm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 05, 2014 at 11:15:56PM -0200, Raphael Philipe wrote:
> Hi Martin,
> do you mean to use the -M40 parameter for git format-patch?
>=20
> I did that, but the produced patch was exacly the same as without it.

It was supposed to better detect renamed file and sent easier to review
patch, you can experiment a bit more with the number, but don't worry
too much.

> Please noticed that I deleted libftdi_0.19.bb and created libftdi_1.1.bb.

Yes that's correct and why I was expecting git to show smaller diff.

> Can you help me?
>=20
>=20
>=20
> On Fri, Dec 5, 2014 at 8:55 PM, Martin Jansa <martin.jansa@gmail.com> wro=
te:
> > On Fri, Dec 05, 2014 at 03:50:29PM -0200, Raphael Silva wrote:
> >> Previous version was 0.19, but it had a failing recipe due to
> >> the fact that libusb was not detect during do_configure.
> >> This problem does not happen in version 1.1.
> >
> > Please resend with -M40
> >
> >> Signed-off-by: Mario Goulart <mario.goulart@gmail.com>
> >> Signed-off-by: Raphael Silva <rapphil@gmail.com>
> >> ---
> >>  meta-oe/recipes-support/libftdi/libftdi_0.19.bb | 31 ----------------=
---------
> >>  meta-oe/recipes-support/libftdi/libftdi_1.1.bb  | 29 ++++++++++++++++=
+++++++
> >>  2 files changed, 29 insertions(+), 31 deletions(-)
> >>  delete mode 100644 meta-oe/recipes-support/libftdi/libftdi_0.19.bb
> >>  create mode 100644 meta-oe/recipes-support/libftdi/libftdi_1.1.bb
> >>
> >> diff --git a/meta-oe/recipes-support/libftdi/libftdi_0.19.bb b/meta-oe=
/recipes-support/libftdi/libftdi_0.19.bb
> >> deleted file mode 100644
> >> index 773b791..0000000
> >> --- a/meta-oe/recipes-support/libftdi/libftdi_0.19.bb
> >> +++ /dev/null
> >> @@ -1,31 +0,0 @@
> >> -DESCRIPTION =3D "libftdi is a library to talk to FTDI chips.\
> >> -FT232BM/245BM, FT2232C/D and FT232/245R using libusb,\
> >> -including the popular bitbang mode."
> >> -HOMEPAGE =3D "http://www.intra2net.com/en/developer/libftdi/"
> >> -SECTION =3D "libs"
> >> -
> >> -PR =3D "r1"
> >> -
> >> -LICENSE =3D "LGPLv2.1 GPLv2"
> >> -LIC_FILES_CHKSUM=3D "file://COPYING.GPL;md5=3D751419260aa954499f7abaa=
baa882bbe \
> >> -                   file://COPYING.LIB;md5=3Ddb979804f025cf55aabec7129=
cb671ed \
> >> -"
> >> -
> >> -PNBLACKLIST[libftdi] =3D "BROKEN: needs to be updated to detect libus=
b with pkg-config instead of libusb-config"
> >> -
> >> -DEPENDS =3D "virtual/libusb0"
> >> -DEPENDS_virtclass-native =3D "virtual/libusb0-native"
> >> -
> >> -SRC_URI =3D "http://www.intra2net.com/en/developer/libftdi/download/l=
ibftdi-${PV}.tar.gz \
> >> -           file://libtool-m4.patch \
> >> -"
> >> -SRC_URI[md5sum] =3D "e6e25f33b4327b1b7aa1156947da45f3"
> >> -SRC_URI[sha256sum] =3D "567c9d2c42d92fc401c5aba2deed45ffb2433990984e8=
16bcdf31e441aef06be"
> >> -
> >> -PACKAGECONFIG ??=3D ""
> >> -PACKAGECONFIG[cpp-wrapper] =3D "--enable-libftdipp,--disable-libftdip=
p,boost"
> >> -
> >> -inherit autotools binconfig pkgconfig
> >> -
> >> -BBCLASSEXTEND =3D "native"
> >> -
> >> diff --git a/meta-oe/recipes-support/libftdi/libftdi_1.1.bb b/meta-oe/=
recipes-support/libftdi/libftdi_1.1.bb
> >> new file mode 100644
> >> index 0000000..641e5a7
> >> --- /dev/null
> >> +++ b/meta-oe/recipes-support/libftdi/libftdi_1.1.bb
> >> @@ -0,0 +1,29 @@
> >> +DESCRIPTION =3D "libftdi is a library to talk to FTDI chips.\
> >> +FT232BM/245BM, FT2232C/D and FT232/245R using libusb,\
> >> +including the popular bitbang mode."
> >> +HOMEPAGE =3D "http://www.intra2net.com/en/developer/libftdi/"
> >> +SECTION =3D "libs"
> >> +
> >> +LICENSE =3D "LGPLv2.1 GPLv2"
> >> +LIC_FILES_CHKSUM=3D "\
> >> +    file://COPYING.GPL;md5=3D751419260aa954499f7abaabaa882bbe \
> >> +    file://COPYING.LIB;md5=3Ddb979804f025cf55aabec7129cb671ed \
> >> +"
> >> +
> >> +DEPENDS =3D "libusb1"
> >> +
> >> +SRC_URI =3D "http://www.intra2net.com/en/developer/${BPN}/download/${=
BPN}1-${PV}.tar.bz2"
> >> +
> >> +SRC_URI[md5sum] =3D "b79a6356978aa8e69f8eecc3a720ff79"
> >> +SRC_URI[sha256sum] =3D "c0b1af1a13e2c6682a1d8041e5b164a1e0d90267cd378=
bb51e059bd62f821e21"
> >> +
> >> +S =3D "${WORKDIR}/${BPN}1-${PV}"
> >> +
> >> +PACKAGECONFIG ??=3D ""
> >> +PACKAGECONFIG[cpp-wrapper] =3D "-DFTDI_BUILD_CPP=3Don,-DFTDI_BUILD_CP=
P=3Doff,boost"
> >> +
> >> +inherit cmake binconfig pkgconfig
> >> +
> >> +FILES_${PN}-dev +=3D "${libdir}/cmake"
> >> +
> >> +BBCLASSEXTEND =3D "native"
> >> --
> >> 2.2.0
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
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
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--EVF5PPMfhYS0aIcm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlSCp2QACgkQN1Ujt2V2gBwocACfeq3aAzB/UeXYskZSemHeBYTI
RJsAn0Bj/Rq+xb0nk+lhwsPvND48AtxW
=elyA
-----END PGP SIGNATURE-----

--EVF5PPMfhYS0aIcm--
