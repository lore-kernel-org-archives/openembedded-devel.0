Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id E064060125
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Oct 2015 10:47:03 +0000 (UTC)
Received: by wicfx3 with SMTP id fx3so22151673wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Oct 2015 03:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ABqZr68GJVehVZpgeGQVO8BIl9JRFzu+13bMBmNr3WA=;
	b=R+UBfpt2ut7lFXmgYPeLNfqnG4xNynbmOtNqGaqUxcu2j2bPzDezq4ok+oYl9erlyX
	OLCMkXRsLdhEG5yqC7eBlwRAOaXJryYgsQ3l9mZKP9SenCNStPALMmsSTcJb5Cpw9/4m
	Ykxa7cHwUIzU0cHrKnM2vVfresAXI/D4eZv7+B+YXGHb+pTRkeZY4a+ht3UPH19YbPEI
	FPKELhb1aSZ3n64xtd0YLQIAeJiEEmNkNYVAAV8OvsyCDYXyuxf/y9YI2R+Frvg5VQe1
	BidnAAmVFe16o2XGIOtx0tgs5xc5KhgVXvUdckec35d9nFEZDmqkb6SV/4ZOtysbQdFv
	jLZA==
X-Received: by 10.180.198.109 with SMTP id jb13mr3231458wic.17.1444301223502; 
	Thu, 08 Oct 2015 03:47:03 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	gl4sm45367068wjb.29.2015.10.08.03.47.01
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 08 Oct 2015 03:47:01 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 8 Oct 2015 12:47:14 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151008104714.GK2385@jama>
References: <1443907359-22569-1-git-send-email-manuel.bachmann@iot.bzh>
	<20151008100330.GB2385@jama>
	<CANTDXNe25Maj_vYu2MGW=VoFUcAhyhokDE06ZsMtP1McX+1aqw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANTDXNe25Maj_vYu2MGW=VoFUcAhyhokDE06ZsMtP1McX+1aqw@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [PATCH v3][meta-multimedia] mkvtoolnix: fix Boost 1.58 build, update to 7.9.0
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
X-List-Received-Date: Thu, 08 Oct 2015 10:47:05 -0000
X-Groupsio-MsgNum: 57737
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="08ATZu8fEq0x2T3M"
Content-Disposition: inline

--08ATZu8fEq0x2T3M
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 08, 2015 at 12:14:57PM +0200, Manuel Bachmann wrote:
> Hmm, interesting, didn't try with meta-qt.
> I guess it can be done ; will try and let you know.

At least make it explicitly disabled, so that it doesn't fail when
auto-detected from sysroot.

>=20
> Regards,
>=20
> *Manuel Bachmann, Graphics Engineer www.iot.bzh <http://iot.bzh> *
>=20
>=20
> 2015-10-08 12:03 GMT+02:00 Martin Jansa <martin.jansa@gmail.com>:
>=20
> > On Sat, Oct 03, 2015 at 11:22:39PM +0200, Manuel Bachmann wrote:
> > > mkvtoolnix does not compile with newest Boost 1.58, mostly
> > > due to the following bugs :
> > > https://github.com/mbunkus/mkvtoolnix/issues/1172
> > > https://github.com/mbunkus/mkvtoolnix/issues/1176
> > >
> > > Update to the version immediately subsequent to their
> > > fixes, and adapt configure steps accordingly.
> > >
> > > Signed-off-by: Manuel Bachmann <manuel.bachmann@iot.bzh>
> > > ---
> > >  meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_git.bb | 15
> > +++++++++++----
> > >  1 file changed, 11 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_git.bb
> > b/meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_git.bb
> > > index dd613b3..da10153 100644
> > > --- a/meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_git.bb
> > > +++ b/meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_git.bb
> > > @@ -6,9 +6,16 @@ LIC_FILES_CHKSUM =3D
> > "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263"
> > >
> > >  DEPENDS =3D "curl boost expat zlib libebml libmatroska libogg libvor=
bis
> > bzip2 lzo file ruby-native"
> > >
> > > -PV =3D "7.1.0+git${SRCPV}"
> > > -SRCREV =3D "0c89ff941bfdd9f3378312f293a84f13cf3e2a96"
> > > -SRC_URI =3D "git://github.com/mbunkus/mkvtoolnix.git"
> > > +PV =3D "7.9.0+git${SRCPV}"
> > > +SRCREV_mkvtoolnix =3D "1a8b23b1e82ed180a5aaeb43537f2426be252985"
> > > +SRCREV_libebml =3D "04b34b0dbded40e0cec93cafa6a4f4c8e90c3206"
> > > +SRCREV_libmatroska =3D "db5d627b5bf48516c9e0b540254c0d36595760c3"
> > > +SRCREV_FORMAT =3D "mkvtoolnix"
> > > +SRC_URI =3D " \
> > > +           git://github.com/mbunkus/mkvtoolnix.git;name=3Dmkvtoolnix=
 \
> > > +           git://
> > github.com/Matroska-Org/libebml.git;name=3Dlibebml;destsuffix=3Dgit/lib=
/libebml
> > \
> > > +           git://
> > github.com/Matroska-Org/libmatroska.git;name=3Dlibmatroska;destsuffix=
=3Dgit/lib/libmatroska
> > \
> > > +          "
> > >
> > >  S =3D "${WORKDIR}/git"
> > >
> > > @@ -28,7 +35,7 @@ EXTRA_OECONF =3D " --with-boost-libdir=3D${STAGING_=
LIBDIR}
> > \
> > >
> > >  # remove some hardcoded searchpaths
> > >  do_configure_prepend() {
> > > -    sed -i -e s:/usr/local/lib:${STAGING_LIBDIR}:g -e
> > s:/usr/local/include:${STAGING_INCDIR}:g ${S}/ac/ebml.m4
> > > +    sed -i -e s:/usr/local/lib:${STAGING_LIBDIR}:g -e
> > s:/usr/local/include:${STAGING_INCDIR}:g ${S}/ac/qt5.m4
> >
> > It still fails in do_configure
> > configure:8231: checking for the Qt version
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/bin=
/moc
> > uses
> > configure:8239: result: too old: 4.8.7
> >
> > Can we use some PACKAGECONFIGs to disable qt{4,5}?
> >
> > >  }
> > >
> > >  # Yeah, no makefile
> > > --
> > > 1.8.3.1
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
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--08ATZu8fEq0x2T3M
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlYWSbEACgkQN1Ujt2V2gByyCwCfe3ZZ5viJwxE+UsxsrkrV63pE
qBAAn0CoZl+zN1WePtXQ14GcQaWOoO6C
=qEPh
-----END PGP SIGNATURE-----

--08ATZu8fEq0x2T3M--
