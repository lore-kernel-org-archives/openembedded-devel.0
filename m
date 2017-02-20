Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2DA4471BA0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 12:17:53 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id v77so14048263wmv.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 04:17:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=aL9tt57WZkZgC9YEflXmILuQmpYTC2C4EV8obsrUHzE=;
	b=RXRSSTPT1xohckc6ZP9p9MaIpNXcPXcGxoPBnzDWk5awhsYSsq1KCLvwst9Q1Ezywy
	e3zKpJK0HyePdkDU2ba+UjUmn3vqCvdF88YK/Dc6lGKrfgZRnTihQm5r5fvlmkFPXery
	6Mu39OQTn597muFxHi09KDKRhkNm5c4FswCZvSUqFpF+lyjfN7uWmFW1idd0U4SIXcsU
	7ebDAICUWraBEcmm+IxJNvNMwy16FdZNpLXkF+UtfXF6mmes/9D3SbviqOHv5xI9BOyd
	4RIs3tK/HUD+P6JTfQehmC3UQsTON+nFdSqHIZys4V/T/bpPIHBvS/DZ55U6H+VERIPV
	s8Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=aL9tt57WZkZgC9YEflXmILuQmpYTC2C4EV8obsrUHzE=;
	b=DE4GVeJQ3VxkCOE0Pg+DAvpPn9dc4XZKwIv3Hy3MlYiRSDZe6TChcVhWqYGgKeKZ0e
	FkrAa2hAvmFldH/JUAryYRw1f0509s+HRS0emJtIUjJ20Te2c/hJvgnc9n96JbA32F7z
	PqpHbAfoEhPwWPdayBahFpjGXNdKF8Xa7iFCKiCsDk4vR0p68IB+QGOa8t8kRuZyVi2a
	+n0+q54U7WoXiM4VlsF/0fSqQdFPrXPRwhfeBeHONcqUN5qpLScvUgNTqvoyZ0xOg7u0
	V/eY41P3opE6J6yKIytnfOOYz6pmPNDKfRgxFaiT9myOwUqyJiLBfiCpvb7R6dhE5LhD
	E4Yw==
X-Gm-Message-State: AMke39m/tChRawLOLnzlyXYlC9+6ZFGlOszYcstdJpf29bHHr2fE3zLidxBfIqjjt2GKZw==
X-Received: by 10.28.103.3 with SMTP id b3mr17252561wmc.99.1487593073504;
	Mon, 20 Feb 2017 04:17:53 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	m29sm24605643wrm.38.2017.02.20.04.17.52
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 20 Feb 2017 04:17:52 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 20 Feb 2017 13:17:52 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20170220121752.GB3266@jama>
References: <20170211141745.3380-1-gyurco@freemail.hu>
	<CALbNGRQ9c=JeSRA2r5xWhpHB+fSf2JKQbjp=S4HmGJjdyJKV5A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRQ9c=JeSRA2r5xWhpHB+fSf2JKQbjp=S4HmGJjdyJKV5A@mail.gmail.com>
User-Agent: Mutt/1.7.2 (2016-11-26)
Subject: Re: [meta-networking][PATCH v2] Samba: use built-in libtevent
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
X-List-Received-Date: Mon, 20 Feb 2017 12:17:55 -0000
X-Groupsio-MsgNum: 65338
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="SkvwRMAIpAhPCcCJ"
Content-Disposition: inline

--SkvwRMAIpAhPCcCJ
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 20, 2017 at 01:04:58PM +0100, Andreas M=FCller wrote:
> On Sat, Feb 11, 2017 at 3:17 PM, Gyorgy Szombathelyi <gyurco@freemail.hu>=
 wrote:
> > Since Samba uses libtevent-internal.h in some places, it is
> > incompatible with external libtevent versions if they're not
> > the same as the built-in, and just crashes.
> >
> > Signed-off-by: Gyorgy Szombathelyi <gyurco@freemail.hu>
> > ---
> >  meta-networking/recipes-connectivity/samba/samba_4.4.5.bb | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb =
b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
> > index 0ba59c7..754455e 100644
> > --- a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
> > +++ b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
> > @@ -33,7 +33,7 @@ inherit systemd waf-samba cpan-base perlnative update=
-rc.d
> >  # remove default added RDEPENDS on perl
> >  RDEPENDS_${PN}_remove =3D "perl"
> >
> > -DEPENDS +=3D "readline virtual/libiconv zlib popt libtalloc libtdb lib=
tevent libldb krb5 libbsd libaio libpam"
> > +DEPENDS +=3D "readline virtual/libiconv zlib popt libtalloc libtdb lib=
ldb krb5 libbsd libaio libpam"
> >  DEPENDS_append_libc-musl =3D " libtirpc"
> >  CFLAGS_append_libc-musl =3D " -I${STAGING_INCDIR}/tirpc"
> >  LDFLAGS_append_libc-musl =3D " -ltirpc"
> > @@ -74,7 +74,7 @@ SAMBA4_PDB_MODULES=3D"pdb_tdbsam,${@bb.utils.contains=
('PACKAGECONFIG', 'ldap', 'pd
> >  SAMBA4_AUTH_MODULES=3D"auth_unix,auth_wbc,auth_server,auth_netlogond,a=
uth_script,auth_samba4"
> >  SAMBA4_MODULES=3D"${SAMBA4_IDMAP_MODULES},${SAMBA4_PDB_MODULES},${SAMB=
A4_AUTH_MODULES}"
> >
> > -SAMBA4_LIBS=3D"heimdal,!zlib,!popt,!talloc,!pytalloc,!pytalloc-util,!t=
event,!pytevent,!tdb,!pytdb,!ldb,!pyldb"
> > +SAMBA4_LIBS=3D"heimdal,!zlib,!popt,!talloc,!pytalloc,!pytalloc-util,te=
vent,!pytevent,!tdb,!pytdb,!ldb,!pyldb"
> >
> >  EXTRA_OECONF +=3D "--enable-fhs \
> >                   --with-piddir=3D/run \
> > --
> > 2.9.3
> >
> This one causes conflict with libldb. Unfortunately these kind of
> conflicts remain undetected (I had error with gvfs but that isn't
> build in Martins's world - I guess) [1]. Without RSS I get:

In last build I've noticed only this new issue related to samba:

ctdb-2.5.6: ctdb rdepends on samba, but it isn't a build dependency, missin=
g samba in DEPENDS or PACKAGECONFIG? [build-deps]

Maybe this dependency was created from samba being libldb provider in
this build.

gvfs and whole meta-gnome layers is still included in my world, maybe it
didn't fail because some gvfs dependency was already failing or one of
samba related changes in master-next is fixing this one.

Regards,

>=20
> ERROR: samba-4.4.5-r0 do_populate_sysroot: The recipe samba is trying
> to install files into a shared area when those files already exist.
> Those files and their manifest location are:
>    /home/a.mueller/tmp/oe-core-glibc/sysroots/raspberrypi2/usr/lib/python=
2.7/site-packages/_ldb_text.py
>  Matched in b'manifest-raspberrypi2-libldb.populate_sysroot'
>  /home/a.mueller/tmp/oe-core-glibc/sysroots/raspberrypi2/usr/lib/python2.=
7/site-packages/ldb.so
>  Matched in b'manifest-raspberrypi2-libldb.populate_sysroot'
>  /home/a.mueller/tmp/oe-core-glibc/sysroots/raspberrypi2/usr/lib/python2.=
7/site-packages/_tevent.so
>  Matched in b'manifest-raspberrypi2-libtevent.populate_sysroot'
>  /home/a.mueller/tmp/oe-core-glibc/sysroots/raspberrypi2/usr/lib/python2.=
7/site-packages/tevent.py
>  Matched in b'manifest-raspberrypi2-libtevent.populate_sysroot'
> Please verify which recipe should provide the above files.
> The build has stopped as continuing in this scenario WILL break
> things, if not now, possibly in the future (we've seen builds fail
> several months later). If the system knew how to recover from this
> automatically it would however there are several different scenarios
> which can result in this and we don't know which one this is. It may
> be you have switched providers of something like virtual/kernel (e.g.
> from linux-yocto to linux-yocto-dev), in that case you need to execute
> the clean task for both recipes and it will resolve this error. It may
> be you changed DISTRO_FEATURES from systemd to udev or vice versa.
> Cleaning those recipes should again resolve this error however
> switching DISTRO_FEATURES on an existing build directory is not
> supported, you should really clean out tmp and rebuild (reusing sstate
> should be safe). It could be the overlapping files detected are
> harmless in which case adding them to SSTATE_DUPWHITELIST may be the
> correct solution. It could also be your build is including two
> different conflicting versions of things (e.g. bluez 4 and bluez 5 and
> the correct solution for that would be to resolve the conflict. If in
> doubt, please ask on the mailing list, sharing the error and filelist
> above.
> ERROR: samba-4.4.5-r0 do_populate_sysroot: If the above message is too
> much, the simpler version is you're advised to wipe out tmp and
> rebuild (reusing sstate is fine). That will likely fix things in most
> (but not all) cases.
> ERROR: samba-4.4.5-r0 do_populate_sysroot: Function failed: sstate_task_p=
ostfunc
>=20
> [1] http://lists.openembedded.org/pipermail/openembedded-core/2017-Februa=
ry/132938.html
>=20
> Andreas
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--SkvwRMAIpAhPCcCJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWKrebwAKCRA3VSO3ZXaA
HJLSAKCDs/3TlcviNhXdhcyaGPs5uWCwuwCghmZXkH/R3NZJ8/34CSIOKqmwYA0=
=4sEg
-----END PGP SIGNATURE-----

--SkvwRMAIpAhPCcCJ--
