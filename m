Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <theBohemian@gmx.net>) id 1LCsOf-0002Ad-Ox
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Dec 2008 10:08:49 +0100
Received: (qmail invoked by alias); 17 Dec 2008 09:04:17 -0000
Received: from e179038145.adsl.alicedsl.de (EHLO [192.168.4.110])
	[85.179.38.145]
	by mail.gmx.net (mp041) with SMTP; 17 Dec 2008 10:04:17 +0100
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX1+rM8F8ZMqra3gDOzM1+reyLP1MFYcioLhNstKU3j
	3FAYoopjqbCL1L
Message-ID: <4948C0C8.7010702@gmx.net>
Date: Wed, 17 Dec 2008 10:05:12 +0100
From: Robert Schuster <theBohemian@gmx.net>
User-Agent: Mozilla-Thunderbird 2.0.0.17 (X11/20081018)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Enigmail-Version: 0.95.0
X-Y-GMX-Trusted: 0
X-FuHaFi: 0.58
Subject: How to integrate this into OE?
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
X-List-Received-Date: Wed, 17 Dec 2008 09:08:50 -0000
X-Groupsio-MsgNum: 7008
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------enigC9959F37EBD27A7116A3996D"

--------------enigC9959F37EBD27A7116A3996D
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,
get 'notify-send' for your distro (libnotify-bin in Debian/Ubuntu) and
then try this bash script ->

sd ()
{
  local cmd=3D$@

  local app=3D$1
  shift
  ($app "$@")

  if [ $? =3D 0 ]
  then
    notify-send ":-) done: '$cmd'"
  else
    notify-send --urgency=3Dcritical ":'( <i>failed:</i> '$cmd'"
  fi
}

like this:
	sd make bla

or enjoy success:
	sd echo "Hello World"

If you do not want to try this out. This script uses freedesktop.org's
notify-send application to inform you whether the operation following sd
failed or not. It also prints the command and paints an appropriate
emoticon. I find this practical when I am working on OE and check my
mail, read blogs while a build is running.

At the moment I would use this for OE like this:

	sd bitbake foobar

and get a nice graphical notice whether my build failed or succeeded.
My question is how could we optionally put this into OE directly?
Ideally in some form of 'INHERIT +=3D notify-send'.

Regards
Robert


--------------enigC9959F37EBD27A7116A3996D
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iEYEAREIAAYFAklIwMwACgkQG9cfwmwwEtruNQCgmXGyriRX4GnN1qyFqURqAmK2
BbsAoJrizO8m80fjoSJVGL9z44SbZqan
=xe+U
-----END PGP SIGNATURE-----

--------------enigC9959F37EBD27A7116A3996D--
