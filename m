Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1P54CL-0000BS-T2 for openembedded-devel@lists.openembedded.org;
	Mon, 11 Oct 2010 00:16:55 +0200
Received: from g225080158.adsl.alicedsl.de ([92.225.80.158]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1P54Bz-0001Sd-4O for openembedded-devel@lists.openembedded.org;
	Sun, 10 Oct 2010 22:16:31 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTinEX-Y65vR4KfRJOk6gSy6JkrwsuQSX4oQhw43J@mail.gmail.com>
References: <1286730309.3808.88.camel@mattotaupa>
	<AANLkTikZquiw4kwdKipq7x++Efeerp1gdcvHmDYxW0Sj@mail.gmail.com>
	<1286732323.3808.111.camel@mattotaupa>
	<AANLkTinEX-Y65vR4KfRJOk6gSy6JkrwsuQSX4oQhw43J@mail.gmail.com>
Date: Mon, 11 Oct 2010 00:16:28 +0200
Message-ID: <1286748988.3808.140.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: gobject-introspection: pkg-config does not honor `PKG_CONFIG_SYSROOT_DIR` (was: Preferred handling of pkg-config in cross compile environments.)
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
X-List-Received-Date: Sun, 10 Oct 2010 22:16:55 -0000
X-Groupsio-MsgNum: 24630
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-8EfefQ85sjolicQkyYVJ"

--=-8EfefQ85sjolicQkyYVJ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Sonntag, den 10.10.2010, 11:11 -0700 schrieb Chris Larson:
> On Sun, Oct 10, 2010 at 10:38 AM, Paul Menzel wrote:
>=20
> > Am Sonntag, den 10.10.2010, 10:09 -0700 schrieb Chris Larson:
> > > On Sun, Oct 10, 2010 at 10:05 AM, Paul Menzel wrote:

[=E2=80=A6]

> > Secondly I am having a similar problem with `gobject-introspection`
> > where [1]
> >
> >        gir/Makefile.am:GLIB_INCLUDEDIR=3D$(shell pkg-config --variable=
=3Dincludedir glib-2.0)/glib-2.0
> >        gir/Makefile.am:GLIB_LIBDIR=3D$(shell pkg-config --variable=3Dli=
bdir glib-2.0)
> >
> > returns the wrong path.
> >
> >        Making all in gir
> >        make[2]: Entering directory
> > `/oe/build-minimal-libc/minimal-dev/work/armv7a-oe-linux-gnueabi/gobjec=
t-introspection-0.9.12-r0/gobject-introspection-0.9.12/gir'
> >        make[2]: *** No rule to make target
> > `/usr/lib/glib-2.0/include/glibconfig.h', needed by `GLib-2.0.gir'.  St=
op.
> >        make[2]: Leaving directory
> > `/oe/build-minimal-libc/minimal-dev/work/armv7a-oe-linux-gnueabi/gobjec=
t-introspection-0.9.12-r0/gobject-introspection-0.9.12/gir'
> >        make[1]: *** [all-recursive] Error 1
>=20
> /usr/{lib,include} paths are mangled by pkg-config using
> PKG_CONFIG_SYSROOT_DIR.  If that's not happening here, that's a bug that
> should be investigated, but I fail to see how setting PKG_CONFIG is going=
 to
> magically fix it.

Unfortunately I could not figure out, what is going on. My suspicion is,
that the function `shell` of the Makefile does not honor the environment
variables.

I tried to change the syntax to

        GLIB_INCLUDEDIR :=3D `$(PKG_CONFIG) --variable=3Dincludedir glib-2.=
0`/glib-2.0
        GLIB_LIBDIR :=3D `$(PKG_CONFIG) --variable=3Dlibdir glib-2.0`

(`git grep PKG_CONFIG` to see that this is used in some places) or

        GLIB_INCLUDEDIR=3D$(shell /oe/build-minimal-libc/minimal-dev/sysroo=
ts/i686-linux/usr/bin/pkg-config --variable=3Dincludedir glib-2.0)/glib-2.0
        GLIB_LIBDIR :=3D $(shell /oe/build-minimal-libc/minimal-dev/sysroot=
s/i686-linux/usr/bin/pkgconfig --variable=3Dlibdir glib-2.0)

but although the second one worked on the command line, it did not work
and did not return any path at all. (I edited `Makefile` in `work` and
executed `run.do_compile.=E2=80=A6` manually.)

I also looked at the changes of pkg-config [1] after 0.23, but could not
find anything applicable to this problem.


Thanks,

Paul


[1] http://cgit.freedesktop.org/pkg-config/tree/NEWS

--=-8EfefQ85sjolicQkyYVJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkyyOzwACgkQPX1aK2wOHVjZdgCcCstIY/zdfstES6P3j1ISbmfP
zCgAn01vPdPz/JxFfmVTa/v0LHyKFS6M
=iLw3
-----END PGP SIGNATURE-----

--=-8EfefQ85sjolicQkyYVJ--
