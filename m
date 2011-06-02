Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QSCYZ-0005AT-MO for openembedded-devel@lists.openembedded.org;
	Thu, 02 Jun 2011 20:23:43 +0200
Received: from f053037130.adsl.alicedsl.de ([78.53.37.130]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QSCW7-0003lv-P9 for openembedded-devel@lists.openembedded.org;
	Thu, 02 Jun 2011 18:21:11 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1306940182.23523.23.camel@oct.suse.cz>
References: <1306933759.5710.2.camel@mattotaupa>
	<1306940182.23523.23.camel@oct.suse.cz>
Date: Thu, 02 Jun 2011 20:20:32 +0200
Message-ID: <1307038832.4241.79.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: gammu: task compile fails with `/oe/build-angstrom-next/angstrom-dev/sysroots/i686-linux/usr/lib/libcurl.so: could not read symbols: File in wrong format`
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
X-List-Received-Date: Thu, 02 Jun 2011 18:23:43 -0000
X-Groupsio-MsgNum: 32481
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-DZ1OlWhbWqqsBADGLiHq"

--=-DZ1OlWhbWqqsBADGLiHq
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Mittwoch, den 01.06.2011, 16:56 +0200 schrieb Stanislav Brabec:
> Paul Menzel wrote:
> > Dear Stanislav,
> > task compile of `gammu` fails with the following error message using
> >         /oe/build-angstrom-next/angstrom-dev/sysroots/i686-linux/usr/li=
b/libcurl.so: could not read symbols: File in wrong format
>=20
> Could you try to add curl to DEPENDS and try again (note that you have
> to include do_configure call again). Maybe I overseen this dependency.

Adding `curl` to `DEPENDS` fixes this issue. It is strange that it is
looking into the stanging area (=C2=BBFile in wrong format=C2=AB).

I will commit the fix.

> Well, the recipe contains one ugly FIXME. If somebody would be able to
> locate target python includes better, feel free to fix it.

I am just having time for build tests right now. :(


Thanks,

Paul


--=-DZ1OlWhbWqqsBADGLiHq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk3n1HAACgkQPX1aK2wOHVgfwgCfXk0F85WZEKqeNitw1+zFnVwW
M/8An2JxgdezmjiRsJ3qc0UWfYpkwKSU
=xDZt
-----END PGP SIGNATURE-----

--=-DZ1OlWhbWqqsBADGLiHq--
