Received: from [83.222.23.61] (helo=relay1.mail.masterhost.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <roman@khimov.ru>) id 1LXe0i-00022V-Ek
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Feb 2009 17:01:57 +0100
Received: from [UNAVAILABLE] ([80.246.246.162] helo=[192.168.1.116])
	by relay1.mail.masterhost.ru with esmtp 
	envelope from <roman@khimov.ru> authenticated with rik@osrc.info
	message id 1LXdzR-000G06-Ab
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Feb 2009 19:00:37 +0300
From: Roman I Khimov <roman@khimov.ru>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Feb 2009 19:00:22 +0300
User-Agent: KMail/1.9.9
References: <200902121727.21796.roman@khimov.ru> <gn1evn$adf$1@ger.gmane.org>
In-Reply-To: <gn1evn$adf$1@ger.gmane.org>
MIME-Version: 1.0
Message-Id: <200902121900.27264.roman@khimov.ru>
Subject: Re: [PATCH] icecc: base fix for cross and native builds
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
X-List-Received-Date: Thu, 12 Feb 2009 16:01:57 -0000
X-Groupsio-MsgNum: 7643
Content-Type: multipart/signed; boundary="nextPart4629075.QAdnVavilK";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart4629075.QAdnVavilK
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Koen Kooi:
> On 12-02-09 15:27, Roman I Khimov wrote:
> > Hello all.
> >
> > There are severe problems with icecc builds currently in OE.
> > Cross-compiler tarball created wrong, PATH set incorrectly, etc.
> >
> > So, here is a patch that fixes some basic things, like:
> > 1) ICECC_ENV_EXEC variable expansion. Currently you can only use
> > absolute path here, something like "${TOP}/create-icecc-env.sh" won't
> > work.
>
> ${TOP} is dangerous to use, IIRC openssl uses it in its buildsystem, so
> people that have TOP set (hi Raster & Steve) see all kind of weird
> failures.

I'm not using "${TOP}" anywhere in production, it's just an example, still=
=20
it's the case that ${ANY_VARIABLE} in ICECC_ENV_EXEC will breake icecc.

=2D-=20
                            Roman
 http://roman.khimov.ru
mailto: roman@khimov.ru
gpg --keyserver hkp://subkeys.pgp.net --recv-keys 0xE5E055C3

--nextPart4629075.QAdnVavilK
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEABECAAYFAkmUR5YACgkQXJ70z+XgVcO+HwCg3zVNgafiM5LVqeu+g7+p2sjr
1v4AoMcZLZKBHBnBwgrxyCXExZLACzY1
=jrin
-----END PGP SIGNATURE-----

--nextPart4629075.QAdnVavilK--
