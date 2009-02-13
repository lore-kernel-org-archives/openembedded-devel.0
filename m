Received: from [83.222.23.61] (helo=relay1.mail.masterhost.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <roman@khimov.ru>) id 1LXwju-0001SU-Hu
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Feb 2009 13:01:50 +0100
Received: from [UNAVAILABLE] ([80.246.246.162] helo=[192.168.1.116])
	by relay1.mail.masterhost.ru with esmtp 
	envelope from <roman@khimov.ru> authenticated with rik@osrc.info
	message id 1LXwiW-0009cN-0I
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Feb 2009 15:00:24 +0300
From: Roman I Khimov <roman@khimov.ru>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Feb 2009 14:59:56 +0300
User-Agent: KMail/1.9.9
References: <200902131326.19376.roman@khimov.ru> <gn3jhc$j0o$1@ger.gmane.org>
In-Reply-To: <gn3jhc$j0o$1@ger.gmane.org>
MIME-Version: 1.0
Message-Id: <200902131500.08034.roman@khimov.ru>
Subject: Re: [PATCH] glibc 2.7 fails to build
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
X-List-Received-Date: Fri, 13 Feb 2009 12:01:50 -0000
X-Groupsio-MsgNum: 7695
Content-Type: multipart/signed; boundary="nextPart1570200.odscKFG2I6";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart1570200.odscKFG2I6
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Koen Kooi:
> On 13-02-09 11:26, Roman I Khimov wrote:
> > /home/rik/work/altell/distro/oe/tmp/staging/i686-linux/usr/include/limi
> >ts.h:125:26:
>
> Set TARGET_VENDOR (or use angstrom, it does that for you) so the native
> system (i686-linux) and the target (i686-linux) don't share the same
> staging area.

Understood, thanks. We're building on x86_64, so they're not shared in this=
=20
case, but for our distro in general it is a bug.

=2D-=20
                            Roman
 http://roman.khimov.ru
mailto: roman@khimov.ru
gpg --keyserver hkp://subkeys.pgp.net --recv-keys 0xE5E055C3

--nextPart1570200.odscKFG2I6
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEABECAAYFAkmVYLwACgkQXJ70z+XgVcN9ggCfTyGuaNKO71L6voEQlGTq9PBN
OpEAoKTLsIp5QCAISjAUyoufpRgnHt9Z
=L8eT
-----END PGP SIGNATURE-----

--nextPart1570200.odscKFG2I6--
