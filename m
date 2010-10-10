Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1P54uv-0005RY-AO for openembedded-devel@lists.openembedded.org;
	Mon, 11 Oct 2010 01:02:58 +0200
Received: from g225080158.adsl.alicedsl.de ([92.225.80.158]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1P54uY-0004Pi-KY for openembedded-devel@lists.openembedded.org;
	Sun, 10 Oct 2010 23:02:34 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20101010224731.GA20158@thinky>
References: <1286730309.3808.88.camel@mattotaupa>
	<AANLkTikZquiw4kwdKipq7x++Efeerp1gdcvHmDYxW0Sj@mail.gmail.com>
	<1286732323.3808.111.camel@mattotaupa>
	<AANLkTinEX-Y65vR4KfRJOk6gSy6JkrwsuQSX4oQhw43J@mail.gmail.com>
	<1286748988.3808.140.camel@mattotaupa> <20101010224731.GA20158@thinky>
Date: Mon, 11 Oct 2010 01:02:33 +0200
Message-ID: <1286751753.9764.4.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: gobject-introspection: pkg-config does not pick correct paths (was: pkg-config does not honor `PKG_CONFIG_SYSROOT_DIR`)
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
X-List-Received-Date: Sun, 10 Oct 2010 23:02:58 -0000
X-Groupsio-MsgNum: 24632
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-iMwaZhRsTt+Ud4gNqlxf"

--=-iMwaZhRsTt+Ud4gNqlxf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Montag, den 11.10.2010, 00:47 +0200 schrieb Frederik Sdun:
> * Paul Menzel <paulepanter@users.sourceforge.net> [11.10.2010 00:17]:
> > Am Sonntag, den 10.10.2010, 11:11 -0700 schrieb Chris Larson:
> > > On Sun, Oct 10, 2010 at 10:38 AM, Paul Menzel wrote:
> > >=20
> > > > Am Sonntag, den 10.10.2010, 10:09 -0700 schrieb Chris Larson:
> > > > > On Sun, Oct 10, 2010 at 10:05 AM, Paul Menzel wrote:
> >=20
> > [=E2=80=A6]
> >=20
> > > > Secondly I am having a similar problem with `gobject-introspection`
> > > > where [1]
> > > >
> > > >        gir/Makefile.am:GLIB_INCLUDEDIR=3D$(shell pkg-config --varia=
ble=3Dincludedir glib-2.0)/glib-2.0
> > > >        gir/Makefile.am:GLIB_LIBDIR=3D$(shell pkg-config --variable=
=3Dlibdir glib-2.0)
> > > >
> > > > returns the wrong path.
> > > >
> > > >        Making all in gir
> > > >        make[2]: Entering directory
> > > > `/oe/build-minimal-libc/minimal-dev/work/armv7a-oe-linux-gnueabi/go=
bject-introspection-0.9.12-r0/gobject-introspection-0.9.12/gir'
> > > >        make[2]: *** No rule to make target
> > > > `/usr/lib/glib-2.0/include/glibconfig.h', needed by `GLib-2.0.gir'.=
  Stop.
> > > >        make[2]: Leaving directory
> > > > `/oe/build-minimal-libc/minimal-dev/work/armv7a-oe-linux-gnueabi/go=
bject-introspection-0.9.12-r0/gobject-introspection-0.9.12/gir'
> > > >        make[1]: *** [all-recursive] Error 1
> > >=20
> > > /usr/{lib,include} paths are mangled by pkg-config using
> > > PKG_CONFIG_SYSROOT_DIR.  If that's not happening here, that's a bug t=
hat
> > > should be investigated, but I fail to see how setting PKG_CONFIG is g=
oing to
> > > magically fix it.
> >=20
> > Unfortunately I could not figure out, what is going on. My suspicion is=
,
> > that the function `shell` of the Makefile does not honor the environmen=
t
> > variables.
> >=20
> > I tried to change the syntax to
> >=20
> >         GLIB_INCLUDEDIR :=3D `$(PKG_CONFIG) --variable=3Dincludedir gli=
b-2.0`/glib-2.0
> >         GLIB_LIBDIR :=3D `$(PKG_CONFIG) --variable=3Dlibdir glib-2.0`
> >=20
> > (`git grep PKG_CONFIG` to see that this is used in some places) or
> >=20
> >         GLIB_INCLUDEDIR=3D$(shell /oe/build-minimal-libc/minimal-dev/sy=
sroots/i686-linux/usr/bin/pkg-config --variable=3Dincludedir glib-2.0)/glib=
-2.0
> >         GLIB_LIBDIR :=3D $(shell /oe/build-minimal-libc/minimal-dev/sys=
roots/i686-linux/usr/bin/pkgconfig --variable=3Dlibdir glib-2.0)
> >=20
> > but although the second one worked on the command line, it did not work
> > and did not return any path at all. (I edited `Makefile` in `work` and
> > executed `run.do_compile.=E2=80=A6` manually.)
> >=20
> > I also looked at the changes of pkg-config [1] after 0.23, but could no=
t
> > find anything applicable to this problem.

> > [1] http://cgit.freedesktop.org/pkg-config/tree/NEWS
>
> I think the problem is, that pkg-config --variable is used here, which
> doesn't expand the paths.
> I try to provide a patch, which make it possible to specify the sysroot
> and uses pkg-config --cflags-only-I for the flags

That is a good idea. But remember that the staged package config files
have the full path included already.

        $ /oe/build-minimal-libc/minimal-dev/sysroots/i686-linux/usr/bin/pk=
g-config --variable=3Dlibdir glib-2.0=20
        /oe/build-minimal-libc/minimal-dev/sysroots/i686-linux/usr/lib

or

        $ PKG_CONFIG_DIR=3D"/home/paul/oe/build-minimal-libc/minimal-dev/sy=
sroots/armv7a-oe-linux-gnueabi/usr/lib/pkgconfig" ~/oe/build-minimal-libc/m=
inimal-dev/sysroots/i686-linux/usr/bin/pkg-config --variable=3Dlibdir glib-=
2.0
        /oe/build-minimal-libc/minimal-dev/sysroots/i686-linux/usr/lib


Thanks,

Paul

--=-iMwaZhRsTt+Ud4gNqlxf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkyyRfgACgkQPX1aK2wOHVhR2wCfVu8GkzrkhQnVTtMroOruvJK2
wvkAn1HtT3pfUW0otRMmLlK/fCYG0X+J
=rFYp
-----END PGP SIGNATURE-----

--=-iMwaZhRsTt+Ud4gNqlxf--
