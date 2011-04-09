Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Q8eos-0005Ug-8e for openembedded-devel@lists.openembedded.org;
	Sat, 09 Apr 2011 22:31:46 +0200
Received: from f053040093.adsl.alicedsl.de ([78.53.40.93]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Q8emv-0004qw-Gj for openembedded-devel@lists.openembedded.org;
	Sat, 09 Apr 2011 20:29:45 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1302376412.3131.9.camel@lenovo.internal.reciva.com>
References: <1301660208-31105-1-git-send-email-otavio@ossystems.com.br>
	<1301660208-31105-3-git-send-email-otavio@ossystems.com.br>
	<in4lhs$326$1@dough.gmane.org>
	<AANLkTimRF7Q3=XeF1EOHgPNAGfJwnp5PmjHGyjUhTyef@mail.gmail.com>
	<CC5D751E-FF84-40C2-B184-4C813C49F5E4@dominion.thruhere.net>
	<AANLkTimS+CcrB7cHUF+ao=XwD0aXeFqt4r1N4erHoKFs@mail.gmail.com>
	<1302330816.15056.15.camel@leto>
	<1302340789.3131.7.camel@lenovo.internal.reciva.com>
	<BANLkTinKJf85aenJia6nrVBaOdANdM44oA@mail.gmail.com>
	<4DA0A13A.1090406@mentor.com>
	<1302376412.3131.9.camel@lenovo.internal.reciva.com>
Date: Sat, 09 Apr 2011 22:29:36 +0200
Message-ID: <1302380976.15868.16.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: Re: [PATCH 3/6] xorg-xserver-common.inc: drop .la files from packages
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
X-List-Received-Date: Sat, 09 Apr 2011 20:31:46 -0000
X-Groupsio-MsgNum: 31075
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-laiyqhoXPG8yRZKtcP3f"

--=-laiyqhoXPG8yRZKtcP3f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Samstag, den 09.04.2011, 20:13 +0100 schrieb Phil Blundell:
> On Sat, 2011-04-09 at 11:11 -0700, Tom Rini wrote:
> > On 04/09/2011 10:36 AM, Otavio Salvador wrote:
> > > On Sat, Apr 9, 2011 at 06:19, Phil Blundell <philb@gnu.org> wrote:
> > >> What would be the use case for having them there?  Nothing ever link=
s
> > >> against them.  I think Otavio is right, they're better off deleted.
> > >=20
> > > AFAIK .la files are used for in project linking not when linking with
> > > system or sdk libraries. So I'd prefer to remove them.
> >=20
> > .la files have a defined purpose in a development area.  Until / unless
> > we move to globally killing .la files (see Richard talking about this o=
n
> > the poky list a few weeks ago), we should ship these in the -dev
> > package.  If they're broken that probably means something isn't
> > inherit'ing the right class that should be fixing them.
>=20
> Well, the point about these particular .la files is that they relate to
> dlopen()ed modules, not to shared libraries that one would wish to link
> against.  So the "defined purpose" doesn't apply to this situation.
>=20
> I don't think the files in question are broken, just useless.  It seems
> silly to waste space in the -dev package with them.

I just want to add that Debian is also removed (and is still removing)
*.la files [1] as far as I can see.

Sorry if that does not belong here.


Thanks,

Paul


[1] http://wiki.debian.org/ReleaseGoals/LAFileRemoval

--=-laiyqhoXPG8yRZKtcP3f
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk2gwakACgkQPX1aK2wOHVhExACeNZdJMNWiNdU/i+PmyiwEEoBq
IgYAniKoJ+tsS0sFpigTA3SFz6vfZn/m
=4zFJ
-----END PGP SIGNATURE-----

--=-laiyqhoXPG8yRZKtcP3f--
