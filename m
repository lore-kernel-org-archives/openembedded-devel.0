Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1NHiIg-0005iR-Vn for openembedded-devel@lists.openembedded.org;
	Mon, 07 Dec 2009 19:27:14 +0100
Received: from f053037079.adsl.alicedsl.de ([78.53.37.79]
	helo=[192.168.178.25])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1NHiHf-00053B-Fu for openembedded-devel@lists.openembedded.org;
	Mon, 07 Dec 2009 18:26:07 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20091204210112.GA22210@rhein.zuhause.netz>
References: <1259880334.25344.7.camel@mattotaupa.wohnung.familie-menzel.net>
	<1259939828.4859.1456.camel@pblack-ubuntu>
	<20091204210112.GA22210@rhein.zuhause.netz>
Date: Mon, 07 Dec 2009 19:25:44 +0100
Message-ID: <1260210344.3403.13.camel@mattotaupa.wohnung.familie-menzel.net>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [abiword] CROSS COMPILE Badness: /usr/include in INCLUDEPATH: /usr/include/freetype2
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
X-List-Received-Date: Mon, 07 Dec 2009 18:27:14 -0000
X-Groupsio-MsgNum: 14934
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-gouTAak3cMhakn5W946r"

--=-gouTAak3cMhakn5W946r
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Freitag, den 04.12.2009, 22:01 +0100 schrieb Henning Heinold:
> The problem here is the libwmf plugin, which is enabled to auto. OE hasnt=
 packed
> libwmf yet(besides the lib was last updated 2002). So if you have libwmf-=
dev package
> installed on your hostmachine the autotools will find libwmf-config from =
host
> and set CLFAGS for the host libwmf, which is infect /usr/include.

Based on my tests, that analysis seems to be correct. Thank you!

> There are 3 solutions:
>=20
> - package libwmf into oe

I have never done something like this. I hope I will have some time in
the further.

> - run abiword configure with --enbale-plugin "list of all plugins without=
 libwmf"

Somehow I did not find the right way to just disable libwmf. The output
of `./configure --help` only has `--with-libwmf-config` mentioned
concerting libwmf.

I did also not know what plugins are available. So I removed
`--enable-plugins` all together from `recipes/abiword/abiword_2.8.1.bb`.

> - edit .m4 files so it dont includes wmf plugin

Did not need to do this.

Should I open a ticket for this issue, so that it will not be forgotten?


Thank you and bests,

Paul

--=-gouTAak3cMhakn5W946r
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAksdSKgACgkQPX1aK2wOHVic4ACgjMm49n4y5RGvUuPW5K1yX1VX
KGUAn3TFrlDwMlG/QxZgfC+oGDMZcM80
=CcLN
-----END PGP SIGNATURE-----

--=-gouTAak3cMhakn5W946r--
