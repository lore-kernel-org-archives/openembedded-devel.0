Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <openembedded@haerwu.biz>) id 1Lcdmh-0007Tn-VT
	for openembedded-devel@openembedded.org; Thu, 26 Feb 2009 11:48:11 +0100
Received: (qmail 11683 invoked by uid 813007); 26 Feb 2009 10:44:49 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 26 Feb 2009 10:44:49 -0000
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 26 Feb 2009 11:44:17 +0100
User-Agent: KMail/1.11.0 (Linux/2.6.29-rc2; KDE/4.2.0; x86_64; ; )
References: <go498c$bqq$1@ger.gmane.org>
In-Reply-To: <go498c$bqq$1@ger.gmane.org>
MIME-Version: 1.0
Message-Id: <200902261144.46548.openembedded@haerwu.biz>
Subject: Re: [RFC] renaming packages/ to recipes/
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
X-List-Received-Date: Thu, 26 Feb 2009 10:48:30 -0000
X-Groupsio-MsgNum: 8003
Content-Type: multipart/signed; boundary="nextPart1394076.S96bjhZ58b";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart1394076.S96bjhZ58b
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Wednesday 25 of February 2009 21:21:32 Koen Kooi wrote:
> Proposal:
>
> mv packages recipes ; git commit .

+1 from me

My addition to this:

mkdir recipes-broken
git add  recipes-broken
git mv recipes/obsolete recipes-broken/obsolete
git mv recipes/nonworking recipes-broken/nonworking

As this will allow users to set:

BBFILES =3D "/somewhere/oe/recipes/"

which is supported by BitBake for years.

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz

--nextPart1394076.S96bjhZ58b
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEABECAAYFAkmmcpsACgkQeQ6MlGH/2qtpxgCfXDfFUS9ikY26q2gzzchamBHE
Ld8An2we0HNEJe4rsgNZbQoEhpR+QzkN
=LJUO
-----END PGP SIGNATURE-----

--nextPart1394076.S96bjhZ58b--
