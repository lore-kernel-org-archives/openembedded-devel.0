Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Q0i23-0007ji-CV for openembedded-devel@lists.openembedded.org;
	Fri, 18 Mar 2011 23:20:31 +0100
Received: from f053044006.adsl.alicedsl.de ([78.53.44.6] helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Q0i0N-0007mz-It for openembedded-devel@lists.openembedded.org;
	Fri, 18 Mar 2011 22:18:47 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20110318151435.GA31039@mail.familie-heinold.de>
References: <1293311973.4089.26.camel@mattotaupa>
	<1300451882.3830.54.camel@mattotaupa>
	<20110318151435.GA31039@mail.familie-heinold.de>
Date: Fri, 18 Mar 2011 23:18:46 +0100
Message-ID: <1300486726.3759.9.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: Re: [PATCH] xbmc: add `libass` to `DEPENDS`
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
X-List-Received-Date: Fri, 18 Mar 2011 22:20:31 -0000
X-Groupsio-MsgNum: 30424
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-1aveCI8xH4Ujim29rqTc"

--=-1aveCI8xH4Ujim29rqTc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Henning,


Am Freitag, den 18.03.2011, 16:14 +0100 schrieb Henning Heinold:
> Hi Paul,
>=20
> the problem is this
>=20
> do_configure() {
>         if [ -e bootstrap.angstrom ] ; then
>                 sh bootstrap.angstrom
>         else
>                 sh bootstrap
>         fi
>         oe_runconf
> }
>=20
>=20
> which prevents the autoreconf run and so the regenerating of libtool stuf=
f, which results
> in that the configure option --with-sysrootdir is not available. I cannt =
see how
> your patch is fixing that.

I think the following goes on. XBMC=E2=80=99s configure script detects that=
 the
external libass is available and just uses that. XBMC ships all used
libraries with it, so it is buildable without downloading additional
stuff (which is of course bad for maintainability reasons). So
beforehand the configure script set up compilation of the internal
libass which failed for the reason you pointed out above.

I build tested this, so it should be fine?


Thanks,

Paul

--=-1aveCI8xH4Ujim29rqTc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk2D2jIACgkQPX1aK2wOHVgKBQCfYrAIzDZpzQQkvbhz05RiwAsw
cYoAni48MDKlteqAn3EkjrLaN5eegZQW
=Zppi
-----END PGP SIGNATURE-----

--=-1aveCI8xH4Ujim29rqTc--
