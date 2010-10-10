Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1P4zrX-0003td-Rb for openembedded-devel@lists.openembedded.org;
	Sun, 10 Oct 2010 19:39:09 +0200
Received: from f053041069.adsl.alicedsl.de ([78.53.41.69]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1P4zrB-0003ea-ER for openembedded-devel@lists.openembedded.org;
	Sun, 10 Oct 2010 17:38:45 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTikZquiw4kwdKipq7x++Efeerp1gdcvHmDYxW0Sj@mail.gmail.com>
References: <1286730309.3808.88.camel@mattotaupa>
	<AANLkTikZquiw4kwdKipq7x++Efeerp1gdcvHmDYxW0Sj@mail.gmail.com>
Date: Sun, 10 Oct 2010 19:38:43 +0200
Message-ID: <1286732323.3808.111.camel@mattotaupa>
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
X-List-Received-Date: Sun, 10 Oct 2010 17:39:09 -0000
X-Groupsio-MsgNum: 24618
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-GEuiG6iF1n6UG0RH8Ptx"

--=-GEuiG6iF1n6UG0RH8Ptx
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Sonntag, den 10.10.2010, 10:09 -0700 schrieb Chris Larson:
> On Sun, Oct 10, 2010 at 10:05 AM, Paul Menzel <
> paulepanter@users.sourceforge.net> wrote:
>=20
> > I stumbled upon several programs who call plain `pkg-config` [1][2].
> >
> > Is the following statement correct?
> >
> > To be able to cross compile programs correctly, the build files are
> > supposed to use the environment variable `PKG_CONFIG` and only call
> > pkg-config directly if `PKG_CONFIG` is empty.
> >
> >        if test -z "${PKG_CONFIG}"; then
> >            PKG_CONFIG=3D"pkg-config"
> >
> > If you agree I would note that somewhere in the Wiki, so that upstream
> > can be pointed to some documentation and search the Web will result in
> > some useful results.
> >
>=20
> Can you explain why running just 'pkg-config' is a problem?  It seems to
> work just fine..

Do you have a minimal build host. Some problems do not surface if some
files are installed locally on the build host.

Please take a look at [2] I forgot to add in my original message. I have
no clue why the staged(?) pkg-config behaves differently than the local
installed one. Does it search the paths in a different order?

Secondly I am having a similar problem with `gobject-introspection`
where [1]

	gir/Makefile.am:GLIB_INCLUDEDIR=3D$(shell pkg-config --variable=3Dincluded=
ir glib-2.0)/glib-2.0
	gir/Makefile.am:GLIB_LIBDIR=3D$(shell pkg-config --variable=3Dlibdir glib-=
2.0)

returns the wrong path.

        Making all in gir
        make[2]: Entering directory `/oe/build-minimal-libc/minimal-dev/wor=
k/armv7a-oe-linux-gnueabi/gobject-introspection-0.9.12-r0/gobject-introspec=
tion-0.9.12/gir'
        make[2]: *** No rule to make target `/usr/lib/glib-2.0/include/glib=
config.h', needed by `GLib-2.0.gir'.  Stop.
        make[2]: Leaving directory `/oe/build-minimal-libc/minimal-dev/work=
/armv7a-oe-linux-gnueabi/gobject-introspection-0.9.12-r0/gobject-introspect=
ion-0.9.12/gir'
        make[1]: *** [all-recursive] Error 1


Thanks,

Paul


[2] http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-August/023=
029.html

--=-GEuiG6iF1n6UG0RH8Ptx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkyx+iMACgkQPX1aK2wOHVitzACfUCsg84QEQmB5ruFRL17kOSGw
Ue0AnicqcKh77/avSOdOi5TZyswytGGz
=KeUY
-----END PGP SIGNATURE-----

--=-GEuiG6iF1n6UG0RH8Ptx--
