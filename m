Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1P50lu-0002XN-9E for openembedded-devel@lists.openembedded.org;
	Sun, 10 Oct 2010 20:37:23 +0200
Received: from f053041069.adsl.alicedsl.de ([78.53.41.69]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1P50lX-0006So-N1 for openembedded-devel@lists.openembedded.org;
	Sun, 10 Oct 2010 18:36:59 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTinEX-Y65vR4KfRJOk6gSy6JkrwsuQSX4oQhw43J@mail.gmail.com>
References: <1286730309.3808.88.camel@mattotaupa>
	<AANLkTikZquiw4kwdKipq7x++Efeerp1gdcvHmDYxW0Sj@mail.gmail.com>
	<1286732323.3808.111.camel@mattotaupa>
	<AANLkTinEX-Y65vR4KfRJOk6gSy6JkrwsuQSX4oQhw43J@mail.gmail.com>
Date: Sun, 10 Oct 2010 20:36:59 +0200
Message-ID: <1286735819.3808.115.camel@mattotaupa>
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
Subject: Re: Preferred handling of pkg-config in cross compile environments.
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
X-List-Received-Date: Sun, 10 Oct 2010 18:37:23 -0000
X-Groupsio-MsgNum: 24620
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-XgoKrJ9WUciVXQ3HKbw1"

--=-XgoKrJ9WUciVXQ3HKbw1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Sonntag, den 10.10.2010, 11:11 -0700 schrieb Chris Larson:
> On Sun, Oct 10, 2010 at 10:38 AM, Paul Menzel wrote:
>=20
> > Am Sonntag, den 10.10.2010, 10:09 -0700 schrieb Chris Larson:
> > > On Sun, Oct 10, 2010 at 10:05 AM, Paul Menzel <
> > > paulepanter@users.sourceforge.net> wrote:
> > >
> > > > I stumbled upon several programs who call plain `pkg-config` [1][2]=
.
> > > >
> > > > Is the following statement correct?
> > > >
> > > > To be able to cross compile programs correctly, the build files are
> > > > supposed to use the environment variable `PKG_CONFIG` and only call
> > > > pkg-config directly if `PKG_CONFIG` is empty.
> > > >
> > > >        if test -z "${PKG_CONFIG}"; then
> > > >            PKG_CONFIG=3D"pkg-config"
> > > >
> > > > If you agree I would note that somewhere in the Wiki, so that upstr=
eam
> > > > can be pointed to some documentation and search the Web will result=
 in
> > > > some useful results.
> > > >
> > >
> > > Can you explain why running just 'pkg-config' is a problem?  It seems=
 to
> > > work just fine..
> >
> > Do you have a minimal build host. Some problems do not surface if some
> > files are installed locally on the build host.
> >
> > Please take a look at [2] I forgot to add in my original message. I hav=
e
> > no clue why the staged(?) pkg-config behaves differently than the local
> > installed one. Does it search the paths in a different order?
>=20
> pkgconfig-native searches its own built in path (the one in the native
> sysroot) along with the paths in PKG_CONFIG_PATH.  None of those are outs=
ide
> of the sysroots.

Well obviously something is not working then, since the bug is there as
documented in [2].

> > Secondly I am having a similar problem with `gobject-introspection`
> > where [1]
> >
> >        gir/Makefile.am:GLIB_INCLUDEDIR=3D$(shell pkg-config
> > --variable=3Dincludedir glib-2.0)/glib-2.0
> >        gir/Makefile.am:GLIB_LIBDIR=3D$(shell pkg-config --variable=3Dli=
bdir
> > glib-2.0)
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
>
> /usr/{lib,include} paths are mangled by pkg-config using
> PKG_CONFIG_SYSROOT_DIR.  If that's not happening here, that's a bug that
> should be investigated, but I fail to see how setting PKG_CONFIG is going=
 to
> magically fix it.

I do not see it either. But Khem=E2=80=99s patch helped [2].


Thanks,

Paul

--=-XgoKrJ9WUciVXQ3HKbw1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkyyB8sACgkQPX1aK2wOHVjJpACdGB8Txk2NJG8s3Oq/XlS+thZG
xFgAn0JDlidwCyyr2oxLW57SOuZuEPyz
=pz+q
-----END PGP SIGNATURE-----

--=-XgoKrJ9WUciVXQ3HKbw1--
