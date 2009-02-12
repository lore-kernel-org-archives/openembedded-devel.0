Received: from [83.222.24.104] (helo=smtp-4.masterhost.ru)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <roman@khimov.ru>) id 1LXau7-0005v1-Dv
	for openembedded-devel@openembedded.org; Thu, 12 Feb 2009 13:42:55 +0100
Received: (qmail 16061 invoked from network); 12 Feb 2009 12:41:14 -0000
Received: from unknown (HELO ?192.168.1.116?) (rik@osrc.info@80.246.246.162)
	by smtp1.masterhost.ru with SMTP; 12 Feb 2009 12:41:16 -0000
From: Roman I Khimov <roman@khimov.ru>
To: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 12 Feb 2009 15:41:06 +0300
User-Agent: KMail/1.9.9
References: <200902121426.26727.roman@khimov.ru> <gn12ij$ssf$1@ger.gmane.org>
In-Reply-To: <gn12ij$ssf$1@ger.gmane.org>
MIME-Version: 1.0
Message-Id: <200902121541.09495.roman@khimov.ru>
Cc: openembedded-devel@openembedded.org
Subject: Re: [PATCH] Fix rpm2cio sums
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
X-List-Received-Date: Thu, 12 Feb 2009 12:42:56 -0000
X-Groupsio-MsgNum: 7629
Content-Type: multipart/signed; boundary="nextPart1439382.0GuSuFFuDX";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart1439382.0GuSuFFuDX
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Koen Kooi:
> On 12-02-09 12:26, Roman I Khimov wrote:
> > Don't know why, but rpm2cpio tarball checksums are wrong, so here is
> > the fix:
>
> If they are wrong we want to see the diff between the old and new
> tarballs, replacing checksums as soon as upstream changes defeats the
> purpose of us adding them.

If I've had old one anywhere around, I'd show the diff, but the problem is =
I=20
don't have it.

=46rom what I see most probably it's some meta-data changes as we have=20
ready-to-install FreeBSD tarball there with all=20
its "+COMMENT", "+CONTENTS", "+DESC", "+MTREE_DIRS" files. So=20
the 'rpm2cpio.pl' itself should be the same.

Now another question is why OE package uses such tarball as source at all.=
=20
So, probably we can change the source to something like

http://www.freebsd.org/cgi/cvsweb.cgi/%7Echeckout%7E/ports/archivers/rpm2cp=
io/files/rpm2cpio?rev=3D1.2;content-type=3Dtext%2Fplain;only_with_tag=3DREL=
EASE_7_1_0

which is the only file we need and it's rev'd tagged should-be-non-volatile.

=2D-=20
                            Roman
 http://roman.khimov.ru
mailto: roman@khimov.ru
gpg --keyserver hkp://subkeys.pgp.net --recv-keys 0xE5E055C3

--nextPart1439382.0GuSuFFuDX
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEABECAAYFAkmUGOIACgkQXJ70z+XgVcMNhgCgsJNA/VKLa0NqN6UrVP3Dycze
X8MAoJvLPZVL+Ky9SYNc9qHFkV7N1nQa
=kRYS
-----END PGP SIGNATURE-----

--nextPart1439382.0GuSuFFuDX--
