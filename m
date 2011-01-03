Received: from sencha.khimov.ru ([89.223.109.22])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <roman@khimov.ru>) id 1PZr3C-00060l-Jf
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 Jan 2011 21:30:42 +0100
Received: from [93.100.16.104] (helo=mate.localnet)
	by sencha.khimov.ru with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <roman@khimov.ru>) id 1PZr2s-0004xj-9E
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 Jan 2011 23:30:22 +0300
From: Roman I Khimov <roman@khimov.ru>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 3 Jan 2011 23:30:21 +0300
User-Agent: KMail/1.12.4 (Linux/2.6.31.14-0.4-desktop; KDE/4.3.5; x86_64; ; )
References: <1294084926-3115-1-git-send-email-rep.dot.nop@gmail.com>
	<1294084926-3115-10-git-send-email-rep.dot.nop@gmail.com>
In-Reply-To: <1294084926-3115-10-git-send-email-rep.dot.nop@gmail.com>
MIME-Version: 1.0
Message-Id: <201101032330.21527.roman@khimov.ru>
Subject: Re: [PATCH 10/12] busybox: simplify update-rc.d OPT handling
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
X-List-Received-Date: Mon, 03 Jan 2011 20:30:43 -0000
X-Groupsio-MsgNum: 27671
Content-Type: multipart/signed; boundary="nextPart1431232.ZaiS8CPMjj";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart1431232.ZaiS8CPMjj
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

=D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=82 =
=D0=9F=D0=BE=D0=BD=D0=B5=D0=B4=D0=B5=D0=BB=D1=8C=D0=BD=D0=B8=D0=BA 03 =D1=
=8F=D0=BD=D0=B2=D0=B0=D1=80=D1=8F 2011 23:02:04 =D0=B0=D0=B2=D1=82=D0=BE=D1=
=80 Bernhard Reutner-
=46ischer =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB:
> -	if test "x$D" !=3D "x"; then
> -		OPT=3D"-r $D"
> -	else
> -		OPT=3D"-s"
> -	fi
> +	[ -n "$D" ] && OPT=3D"-r $D" || OPT=3D"-s"

I have a strong feeling that this is wrong. Yeah, the first one takes up fi=
ve=20
times more lines but to me it's about five times easier to parse glancing o=
ver=20
the recipe.

Also, from what I heard '"x$D" !=3D "x"' tests are the most portable ones.

=2D-=20
 http://roman.khimov.ru
mailto: roman@khimov.ru
gpg --keyserver hkp://subkeys.pgp.net --recv-keys 0xE5E055C3

--nextPart1431232.ZaiS8CPMjj
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.12 (GNU/Linux)

iEYEABECAAYFAk0iMd0ACgkQXJ70z+XgVcPHVQCfdqQVR8rsrjlYj6UVfcW4vMjV
kpIAoOOG7RerOYQfVTIeoGx+gpq6Jr3H
=MSzi
-----END PGP SIGNATURE-----

--nextPart1431232.ZaiS8CPMjj--
