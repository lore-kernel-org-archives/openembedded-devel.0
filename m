Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QSDBW-00083L-5z for openembedded-devel@lists.openembedded.org;
	Thu, 02 Jun 2011 21:03:58 +0200
Received: from f053037130.adsl.alicedsl.de ([78.53.37.130]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QSD93-00053P-OO for openembedded-devel@lists.openembedded.org;
	Thu, 02 Jun 2011 19:01:26 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1307038832.4241.79.camel@mattotaupa>
References: <1306933759.5710.2.camel@mattotaupa>
	<1306940182.23523.23.camel@oct.suse.cz>
	<1307038832.4241.79.camel@mattotaupa>
Date: Thu, 02 Jun 2011 21:00:46 +0200
Message-ID: <1307041246.4241.103.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [solved] gammu: task compile fails with `/oe/build-angstrom-next/angstrom-dev/sysroots/i686-linux/usr/lib/libcurl.so: could not read symbols: File in wrong format`
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
X-List-Received-Date: Thu, 02 Jun 2011 19:03:58 -0000
X-Groupsio-MsgNum: 32485
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-EiK7egIRTSazPby7c7/I"

--=-EiK7egIRTSazPby7c7/I
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Donnerstag, den 02.06.2011, 20:20 +0200 schrieb Paul Menzel:
> Am Mittwoch, den 01.06.2011, 16:56 +0200 schrieb Stanislav Brabec:
> > Paul Menzel wrote:

> > > task compile of `gammu` fails with the following error message using
> > >         /oe/build-angstrom-next/angstrom-dev/sysroots/i686-linux/usr/=
lib/libcurl.so: could not read symbols: File in wrong format
> >=20
> > Could you try to add curl to DEPENDS and try again (note that you have
> > to include do_configure call again). Maybe I overseen this dependency.
>=20
> Adding `curl` to `DEPENDS` fixes this issue. It is strange that it is
> looking into the stanging area (=C2=BBFile in wrong format=C2=AB).
>=20
> I will commit the fix.

I committed it in 0fe0f7d5 [1].


Thanks,

Paul


[1] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3D0fe0f7d=
5629578839192153c012a05a192dc2b41

--=-EiK7egIRTSazPby7c7/I
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk3n3d4ACgkQPX1aK2wOHVjpbACghY0eQxRH/rq5w9g8/NiPeOvN
YSYAn3ctw4HpdeEYEi52YihqYCi7owQq
=A6kw
-----END PGP SIGNATURE-----

--=-EiK7egIRTSazPby7c7/I--
