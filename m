Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1NZie9-0002zV-MR for openembedded-devel@lists.openembedded.org;
	Tue, 26 Jan 2010 11:27:48 +0100
Received: from f053039019.adsl.alicedsl.de ([78.53.39.19]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1NZibu-00077j-Ih for openembedded-devel@lists.openembedded.org;
	Tue, 26 Jan 2010 10:25:26 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20100113110257.GA3243@gmail.com>
References: <1263109998.16109.11.camel@mattotaupa.wohnung.familie-menzel.net>
	<20100110123923.GB6363@rhein.zuhause.netz>
	<1263156477.3423.6.camel@mattotaupa.wohnung.familie-menzel.net>
	<1263249767.3308.236.camel@mattotaupa.wohnung.familie-menzel.net>
	<1263296160.20557.136.camel@mattotaupa.wohnung.familie-menzel.net>
	<20100113102738.GA15906@gmail.com>
	<1263379487.3228.23.camel@mattotaupa.wohnung.familie-menzel.net>
	<20100113110257.GA3243@gmail.com>
Date: Tue, 26 Jan 2010 11:25:24 +0100
Message-ID: <1264501524.3709.13.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.2 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [vdr] TARGET_CXXFLAGS do not include CXX_FLAGS from Makefile
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
X-List-Received-Date: Tue, 26 Jan 2010 10:27:48 -0000
X-Groupsio-MsgNum: 16233
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-YUvPAbdYDHQTWgtwai3B"

--=-YUvPAbdYDHQTWgtwai3B
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Mittwoch, den 13.01.2010, 03:02 -0800 schrieb Khem Raj:

[=E2=80=A6]

> > > > Looking at `run.do_install.28829` I cannot see find the `-fPIC` in
> > > > there. So my question is, why is it not included. Is it because of =
=C2=BB?=3D=C2=AB?
> > > > How do I get it included?
> > >=20
> > > you could do CXXFLAGS_append =3D ... in the recipe.
> >=20
> > Is that the recommended behavior?=20
>=20
> yes.

I just tried your suggestion. The problem is, that `-fPIC` is just need
during `do_install` since strangely that is when the plugins get
compiled.

        do_install () {
              oe_runmake 'DESTDIR=3D${D}' \
                         'PREFIX=3D${prefix}' \
                         'CONFDIR=3D${sysconfdir}/vdr' \
                         'VIDEODIR=3D/var/lib/vdr/video' \
                         'PLUGINLIBDIR=3D${PLUGINDIR}' \
                         'LOCDIR=3D${datadir}/locale' \
                         install
        }

Using `CXXFLAGS_append =3D " -fPIC` in `do_install` gives me this error.

        + do_install
        + CXXFLAGS_append +=3D ' -fPIC'
        /srv/filme/oe/tangstrom-dev/work/armv7a-angstrom-linux-gnueabi/vdr-=
1.7.10-r3/temp/run.do_install.17984: line 540: CXXFLAGS_append: command not=
 found
        ERROR: function do_install failed

Adding `-fPIC` to the global `CXXFLAGS` is not desired, since the main
binary should not be compiled with this flag.

What solution is recommended in such a situation besides patching the
Makefiles? Add 'CXXFLAGS+=3D${CXXFLAGS}' to `oe_runmake`?

[=E2=80=A6]


Thanks,

Paul

--=-YUvPAbdYDHQTWgtwai3B
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAktewxMACgkQPX1aK2wOHVh01wCeKjA/2NRbrisRtrD4k9cUwNJ2
oEMAn0XDeiUrpQWO7HnkB4mORcnQfteS
=EFQ+
-----END PGP SIGNATURE-----

--=-YUvPAbdYDHQTWgtwai3B--
