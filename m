Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QUxh4-0006Ka-Dz for openembedded-devel@lists.openembedded.org;
	Fri, 10 Jun 2011 11:07:54 +0200
Received: from f053035141.adsl.alicedsl.de ([78.53.35.141]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QUxek-0002jp-T1 for openembedded-devel@lists.openembedded.org;
	Fri, 10 Jun 2011 09:05:31 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4DF0A343.6040608@sirius-es.it>
References: <1307541389-2401-1-git-send-email-matteo.facchinetti@sirius-es.it>
	<1307551786.4193.25.camel@mattotaupa> <4DF0A343.6040608@sirius-es.it>
Date: Fri, 10 Jun 2011 11:04:34 +0200
Message-ID: <1307696674.4148.7.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [PATCH v2] wxbase_2.8.9: fix includepath for SDL dependency
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
X-List-Received-Date: Fri, 10 Jun 2011 09:07:54 -0000
X-Groupsio-MsgNum: 32609
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-dAgKjzKBwsNUzQOLb0nj"

--=-dAgKjzKBwsNUzQOLb0nj
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Donnerstag, den 09.06.2011, 12:41 +0200 schrieb Matteo Facchinetti:
> On 06/08/2011 06:49 PM, Paul Menzel wrote:
> > Am Mittwoch, den 08.06.2011, 15:56 +0200 schrieb Matteo Facchinetti:
> >> From: Matteo Facchinetti<engineering@sirius-es.it>
> >>
> >> Compile task fail with error:
> >> | CROSS COMPILE Badness: /usr/include in INCLUDEPATH: /usr/include/SDL
> >> | cc1plus: internal compiler error: in add_path, at c-incpath.c:425
> >>
> >> Fix it forcing right path in configuration.
> > It builds fine for me without this patch using `minimal` for `MACHINE =
=3D
> > "beagleboard"`. How can I reproduce your build error?
>=20
> wx_base configure script checks the presence of sdl-config in your host=
=20
> system (and not in your cross-build system) Then use it to know SDL=20
> include PATH. (sdlconfig --cflags).
> this path is wrong for your cross-compiling ( usually -I/usr/include/SDL =
).
>=20
> At first, to reproduce the problem you have to install SDL lib in your=
=20
> host system.

Ok, I do not have it installed.

> I don't know if you could reproduce exactly the same crash.
>   (however I'm using a IA64 64bit host system and my target is powerpc=
=20
> 32 (e300c3 core).)
>=20
> If you doesn't have SDL lib in your host, problem disappear because=20
> wx_base configure doesn't use it.
>=20
> After apply this patch, your cross_compile system start check and use=20
> the right sdl-config (for me located in=20
> "$BUILDDIR"/sysroots/x86_64-linux/usr/ppce300c3/bin/sdl-config ).
>=20
> For compile wx_base with SDL you have to create an image with this=20
> dependency.
> I don't know if the `minimal` one is sufficient. I'm using `console-image=
`.

Thank you for the explanation. I think it is generally discourage to
have arbitrary build behavior in OE recipes.

Do you need to use SDL? Is it generally needed when using wxbase? If yes
the dependency to sdl should be added and `--with-sdl` passed to
configure.


Thanks,

Paul

--=-dAgKjzKBwsNUzQOLb0nj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk3x3iIACgkQPX1aK2wOHVjW7gCeIhhMbb37SQ+OK2PtgwcCyJOx
xV8An1oI11hcrG3gPnwYDh124GF6/11b
=BHFb
-----END PGP SIGNATURE-----

--=-dAgKjzKBwsNUzQOLb0nj--
