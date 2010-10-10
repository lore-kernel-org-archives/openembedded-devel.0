Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <frederik.sdun@googlemail.com>) id 1P54gj-0004qh-FR
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Oct 2010 00:48:18 +0200
Received: by bwz9 with SMTP id 9so346853bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Oct 2010 15:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=domainkey-signature:received:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=9ILPVgEcK5tDOmQmHbGUQhGYcGjRZYLjs1ZPVIXWt3Q=;
	b=kEk6GHeaOimi1MU45B62qBSsSO0zcQ2U98H7+8Xegvw7hM8gxI3Y7b3M13EbU+bQvV
	o/wID/DAIMG4BTx1zdIk5wl+2XOGQk8tAmD+9nqRhvRWqtQ84XQkQeA5LBNl4TpOESTp
	/SCeDY1Ilv9nwBNj/VWRjRBLCH+uRTVgLb2Gc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=googlemail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=wnqgP+3xVWiYZe7ZsGPnIJzu635M/P/pEL5oxKlQoHqCio4qKE7hmKb4BUVVWq12hi
	CgOaHtgCzkmokXRnVAqXvPyazDH0smyr6AA5mnyg7lZqvoz4/VPW+fqju937GdO2+T8/
	OVHOOeiDI3cTmKBODSQUxX4cmXozSYHRJ3lmk=
Received: by 10.204.50.194 with SMTP id a2mr4410923bkg.183.1286750859120;
	Sun, 10 Oct 2010 15:47:39 -0700 (PDT)
Received: from smtp.googlemail.com ([93.216.238.58])
	by mx.google.com with ESMTPS id l14sm3605844bkb.7.2010.10.10.15.47.37
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 10 Oct 2010 15:47:38 -0700 (PDT)
Received: by smtp.googlemail.com (nbSMTP-1.00) for uid 1000
	(using TLSv1/SSLv3 with cipher RC4-MD5 (128/128 bits))
	frederik.sdun@googlemail.com; Mon, 11 Oct 2010 00:47:34 +0200 (CEST)
Date: Mon, 11 Oct 2010 00:47:32 +0200
From: Frederik Sdun <frederik.sdun@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101010224731.GA20158@thinky>
References: <1286730309.3808.88.camel@mattotaupa>
	<AANLkTikZquiw4kwdKipq7x++Efeerp1gdcvHmDYxW0Sj@mail.gmail.com>
	<1286732323.3808.111.camel@mattotaupa>
	<AANLkTinEX-Y65vR4KfRJOk6gSy6JkrwsuQSX4oQhw43J@mail.gmail.com>
	<1286748988.3808.140.camel@mattotaupa>
MIME-Version: 1.0
In-Reply-To: <1286748988.3808.140.camel@mattotaupa>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: frederik.sdun@googlemail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: gobject-introspection: pkg-config does not honor `PKG_CONFIG_SYSROOT_DIR` (was: Preferred handling of pkg-config in cross compile environments.)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 10 Oct 2010 22:48:18 -0000
X-Groupsio-MsgNum: 24631
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xHFwDpU9dbj6ez1V"
Content-Disposition: inline

--xHFwDpU9dbj6ez1V
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* Paul Menzel <paulepanter@users.sourceforge.net> [11.10.2010 00:17]:
> Am Sonntag, den 10.10.2010, 11:11 -0700 schrieb Chris Larson:
> > On Sun, Oct 10, 2010 at 10:38 AM, Paul Menzel wrote:
> >=20
> > > Am Sonntag, den 10.10.2010, 10:09 -0700 schrieb Chris Larson:
> > > > On Sun, Oct 10, 2010 at 10:05 AM, Paul Menzel wrote:
>=20
> [=E2=80=A6]
>=20
> > > Secondly I am having a similar problem with `gobject-introspection`
> > > where [1]
> > >
> > >        gir/Makefile.am:GLIB_INCLUDEDIR=3D$(shell pkg-config --variabl=
e=3Dincludedir glib-2.0)/glib-2.0
> > >        gir/Makefile.am:GLIB_LIBDIR=3D$(shell pkg-config --variable=3D=
libdir glib-2.0)
> > >
> > > returns the wrong path.
> > >
> > >        Making all in gir
> > >        make[2]: Entering directory
> > > `/oe/build-minimal-libc/minimal-dev/work/armv7a-oe-linux-gnueabi/gobj=
ect-introspection-0.9.12-r0/gobject-introspection-0.9.12/gir'
> > >        make[2]: *** No rule to make target
> > > `/usr/lib/glib-2.0/include/glibconfig.h', needed by `GLib-2.0.gir'.  =
Stop.
> > >        make[2]: Leaving directory
> > > `/oe/build-minimal-libc/minimal-dev/work/armv7a-oe-linux-gnueabi/gobj=
ect-introspection-0.9.12-r0/gobject-introspection-0.9.12/gir'
> > >        make[1]: *** [all-recursive] Error 1
> >=20
> > /usr/{lib,include} paths are mangled by pkg-config using
> > PKG_CONFIG_SYSROOT_DIR.  If that's not happening here, that's a bug that
> > should be investigated, but I fail to see how setting PKG_CONFIG is goi=
ng to
> > magically fix it.
>=20
> Unfortunately I could not figure out, what is going on. My suspicion is,
> that the function `shell` of the Makefile does not honor the environment
> variables.
>=20
> I tried to change the syntax to
>=20
>         GLIB_INCLUDEDIR :=3D `$(PKG_CONFIG) --variable=3Dincludedir glib-=
2.0`/glib-2.0
>         GLIB_LIBDIR :=3D `$(PKG_CONFIG) --variable=3Dlibdir glib-2.0`
>=20
> (`git grep PKG_CONFIG` to see that this is used in some places) or
>=20
>         GLIB_INCLUDEDIR=3D$(shell /oe/build-minimal-libc/minimal-dev/sysr=
oots/i686-linux/usr/bin/pkg-config --variable=3Dincludedir glib-2.0)/glib-2=
=2E0
>         GLIB_LIBDIR :=3D $(shell /oe/build-minimal-libc/minimal-dev/sysro=
ots/i686-linux/usr/bin/pkgconfig --variable=3Dlibdir glib-2.0)
>=20
> but although the second one worked on the command line, it did not work
> and did not return any path at all. (I edited `Makefile` in `work` and
> executed `run.do_compile.=E2=80=A6` manually.)
>=20
> I also looked at the changes of pkg-config [1] after 0.23, but could not
> find anything applicable to this problem.
>=20
>=20
> Thanks,
>=20
> Paul
>=20
>=20
> [1] http://cgit.freedesktop.org/pkg-config/tree/NEWS
I think the problem is, that pkg-config --variable is used here, which
doesn't expand the paths.
I try to provide a patch, which make it possible to specify the sysroot
and uses pkg-config --cflags-only-I for the flags


> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


--=20
IRC: playya @ Freenode, Gimpnet
xmpp: playya@draugr.de
identi.ca: playya

--xHFwDpU9dbj6ez1V
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkyyQoIACgkQvbwBzXsbjyqRGwCeJBlPdKcn3z6ZYtSgsgvxib0y
d9MAoJuUXjVmQPoM759I2niWoIQq/fB6
=eeJ5
-----END PGP SIGNATURE-----

--xHFwDpU9dbj6ez1V--
