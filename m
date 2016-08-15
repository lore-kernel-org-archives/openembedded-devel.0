Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id B510D77143
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Aug 2016 11:03:05 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id i138so10461187wmf.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Aug 2016 04:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=iWDJEnnB5KlM5lz16SNadU4yQCoj+mGxSeQwPRQce4U=;
	b=QyZewwNBE1fM4Ysv+u+PzaA7WjsDVmcojGxrT/mfmX69jNWADm5KMDsCuvXonioKho
	Bs5wMezpev9ujpEe/7WdRKxpFJpV6NwOpx2ssjGwLxNc8aaF/J/dK5xQe3N/8dHH5Ekh
	sHapCdPqTeUB87s5Hw5+/Bx9/aTrT3sQkcOdPy6/C9YSSj7GqluvD3Ulheuz5NVR2pPC
	cSUiP3H5tUcs4YmZBgdtjhILkaQiYSoABMh5aJg8MjDN02s9ykoGD7rlq5mpmj/6/nb6
	YUtvuGhU6enRvYgsZhkcJh8eLFdz8Elyi1PMN7stuaHzHkcYiLkdnikie5mbjG5S+suU
	GiLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=iWDJEnnB5KlM5lz16SNadU4yQCoj+mGxSeQwPRQce4U=;
	b=iAqHcaMWnMCeM+IdsyTO3XJ4AikCZy0Dhhm/Ue3HpbW2AKLu7e3st+f11do0EPOGuI
	M2qxKpPBp0arcpfkE+ENotCs21fjHWonog8gpApNfwAhFdDq4x43BhUdWIIIBicRm+Xp
	sseA3o2DTx+mrOWYuD3FNrA7HwtHuHtHLgb/WL57shaUImLwxDAF6Rmw9IZ3dtFHsSRW
	L6yc/t+ScUYqOkH+be4H4IhH3XnWt+f5nUUgUY3Nyy/y8i7eYtCq49cJmqTo9431M1JM
	b8ySbxd7tAa+neXfSgDPthrMPSnJMWVwaW7+P9klhWKd4MxVIsaxJSTETDE2R48SFAYd
	Hu0g==
X-Gm-Message-State: AEkoouvkp7VTsEAQvtpGot+kmnvuCvNX9DecUWoG9zS1SsaaDD7kl6chfCnvNS5aK2bUAw==
X-Received: by 10.194.222.168 with SMTP id qn8mr34504657wjc.172.1471258985564; 
	Mon, 15 Aug 2016 04:03:05 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	d7sm20984148wjg.13.2016.08.15.04.03.03
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 15 Aug 2016 04:03:04 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 15 Aug 2016 13:03:07 +0200
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Message-ID: <20160815110307.iezdfp7u4zh2mr6c@jama>
References: <1470789534-602-1-git-send-email-derek@asterius.io>
	<1470789534-602-2-git-send-email-derek@asterius.io>
	<20160810074526.giu3dvpnuyz6jo22@jama>
	<CADNbA1oa_g158axrUwT=H3_sZkpF59MdnhC-2rQb3_zuL+sH8Q@mail.gmail.com>
	<CA+chaQdNCbSVUaZC=OCJ-oyG+n9sJsRnFcj9gqA3eC770VzK4A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+chaQdNCbSVUaZC=OCJ-oyG+n9sJsRnFcj9gqA3eC770VzK4A@mail.gmail.com>
User-Agent: Mutt/1.6.2 (2016-06-11)
Subject: Re: [meta-oe][PATCH 2/3] libp11: update to version 0.4.0
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
X-List-Received-Date: Mon, 15 Aug 2016 11:03:06 -0000
X-Groupsio-MsgNum: 62632
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cbtucbrl6sr3b73l"
Content-Disposition: inline

--cbtucbrl6sr3b73l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 10, 2016 at 03:57:07PM +0200, Martin Jansa wrote:
> I've updated it also in engine-pkcs change, while resolving conflicts from
> those SRC_URI changes for krogoth and master.

There is one more issue:
cd .libs && ln -s -f pkcs11.so libpkcs11.so
/bin/bash: line 0: cd: .libs: No such file or directory
make[2]: *** [all-local] Error 1

http://errors.yoctoproject.org/Errors/Details/75462/

So keeping this in master-next with other 3 changes, until this is resolved.

> On Wed, Aug 10, 2016 at 3:32 PM, Derek Straka <derek@asterius.io> wrote:
>=20
> > Ah, excellent.  Thanks for the hint.
> >
> > -Derek
> >
> > On Wed, Aug 10, 2016 at 3:45 AM, Martin Jansa <martin.jansa@gmail.com>
> > wrote:
> >
> > > On Tue, Aug 09, 2016 at 08:38:53PM -0400, Derek Straka wrote:
> > > > Signed-off-by: Derek Straka <derek@asterius.io>
> > > > ---
> > > >  meta-oe/recipes-support/libp11/{libp11_0.3.0.bb =3D> libp11_0.4.0.=
bb} |
> > > 5 ++++-
> > > >  1 file changed, 4 insertions(+), 1 deletion(-)
> > > >  rename meta-oe/recipes-support/libp11/{libp11_0.3.0.bb =3D>
> > > libp11_0.4.0.bb} (81%)
> > > >
> > > > diff --git a/meta-oe/recipes-support/libp11/libp11_0.3.0.bb
> > > b/meta-oe/recipes-support/libp11/libp11_0.4.0.bb
> > > > similarity index 81%
> > > > rename from meta-oe/recipes-support/libp11/libp11_0.3.0.bb
> > > > rename to meta-oe/recipes-support/libp11/libp11_0.4.0.bb
> > > > index d97bfc6..a7e43be 100644
> > > > --- a/meta-oe/recipes-support/libp11/libp11_0.3.0.bb
> > > > +++ b/meta-oe/recipes-support/libp11/libp11_0.4.0.bb
> > > > @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D
> > > fad9b3332be894bab9bc501572864b29"
> > > >  DEPENDS =3D "libtool openssl"
> > > >
> > > >  SRC_URI =3D "git://github.com/OpenSC/libp11.git;protocol=3Dhttp"
> > > > -SRCREV =3D "6f71240991aa831f6fc2cc5431faf6ebec627ed2"
> > > > +SRCREV =3D "22de793340ab73cafc92f8238afb51a06d8411c3"
> > > >
> > > >  S =3D "${WORKDIR}/git"
> > > >
> > > > @@ -21,3 +21,6 @@ do_install_append () {
> > > >      rm -rf ${D}${libdir}/*.la
> > > >      rm -rf ${D}${docdir}/${BPN}
> > > >  }
> > > > +
> > > > +FILES_${PN} +=3D "${libdir}/pkcs11.so.0*"
> > > > +FILES_${PN}-dev +=3D "${libdir}/pkcs11.so"
> > >
> > > You can use following variables here:
> > >
> > > SOLIBS =3D ".so.*"
> > > SOLIBS_darwin =3D ".dylib"
> > >
> > > SOLIBSDEV =3D ".so"
> > > # Due to the ordering of PACKAGES and the naming of the dev symlinks =
on
> > > # darwin,
> > > # we can't make the symlinks end up in the -dev packages easily at th=
is
> > > # point. This hack
> > > # at least means builds aren't completely broken and symlinks don't t=
ake
> > > # up much space.
> > > SOLIBSDEV_darwin =3D ".dylibbroken"
> > >
> > > If I don't forget I'll update it when cherry-picking to master-next (=
if
> > > you don't send v2 before that).
> > >
> > > --
> > > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> > >
> > > --
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > >
> > >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--cbtucbrl6sr3b73l
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlexoWcACgkQN1Ujt2V2gByKggCeLVmTaFWJsVcwoG5z/nnO8OGN
vdIAoLZiX0XRZNheMauaImah5GhNCJ1i
=EQr1
-----END PGP SIGNATURE-----

--cbtucbrl6sr3b73l--
