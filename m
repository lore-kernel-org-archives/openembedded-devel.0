Received: from sencha.khimov.ru ([89.223.109.22])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <roman@khimov.ru>) id 1NtHRL-00074U-Hg
	for openembedded-devel@lists.openembedded.org;
	Sun, 21 Mar 2010 10:27:29 +0100
Received: from [93.100.16.104] (helo=mate.localnet)
	by sencha.khimov.ru with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <roman@khimov.ru>) id 1NtHOH-00076D-KG
	for openembedded-devel@lists.openembedded.org;
	Sun, 21 Mar 2010 12:24:16 +0300
From: Roman I Khimov <roman@khimov.ru>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 21 Mar 2010 12:21:30 +0300
User-Agent: KMail/1.12.4 (Linux/2.6.31.12-0.1-desktop; KDE/4.3.5; x86_64; ; )
References: <1269004282-10732-1-git-send-email-khimov@altell.ru>
	<201003200008.19821.roman@khimov.ru>
	<19c1b8a91003210002y23da07e8q345cc0304190caaa@mail.gmail.com>
In-Reply-To: <19c1b8a91003210002y23da07e8q345cc0304190caaa@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201003211221.34013.roman@khimov.ru>
X-SA-Exim-Connect-IP: 89.223.109.22
X-SA-Exim-Mail-From: roman@khimov.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] squid: move potentially reusable in other versions parts to .inc files
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
X-List-Received-Date: Sun, 21 Mar 2010 09:27:31 -0000
X-Groupsio-MsgNum: 17900
Content-Type: multipart/signed; boundary="nextPart2141065.BBnrKxX4VU";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart2141065.BBnrKxX4VU
Content-Type: Text/Plain;
  charset="koi8-r"
Content-Transfer-Encoding: quoted-printable

=F7 =D3=CF=CF=C2=DD=C5=CE=C9=C9 =CF=D4 =F7=CF=D3=CB=D2=C5=D3=C5=CE=D8=C5 21=
 =CD=C1=D2=D4=C1 2010 10:02:53 =C1=D7=D4=CF=D2 Khem Raj =CE=C1=D0=C9=D3=C1=
=CC:
> On Fri, Mar 19, 2010 at 2:08 PM, Roman I Khimov <roman@khimov.ru> wrote:
> > =F7 =D3=CF=CF=C2=DD=C5=CE=C9=C9 =CF=D4 =F0=D1=D4=CE=C9=C3=C1 19 =CD=C1=
=D2=D4=C1 2010 16:11:15 =C1=D7=D4=CF=D2 Roman I Khimov=20
=CE=C1=D0=C9=D3=C1=CC:
> >> Signed-off-by: Roman I Khimov <khimov@altell.ru>
> >
> > If there are no objections, I'm pushing the series tomorrow.
>=20
> you could also move it to using BBCLASSEXTEND when you are at it.

Native here is not that much of a native squid, it stages cf_gen program on=
ly=20
(which is not installed by default) that is used for config file generation=
=2E=20
Probably, it should be renamed to something like squid-cf-gen-native and=20
optimized to build only cf_gen.

=2D-=20
 http://roman.khimov.ru
mailto: roman@khimov.ru
gpg --keyserver hkp://subkeys.pgp.net --recv-keys 0xE5E055C3

--nextPart2141065.BBnrKxX4VU
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.12 (GNU/Linux)

iEYEABECAAYFAkul5R0ACgkQXJ70z+XgVcMtPQCgiTE1H6MkJO3+L+6E/hYn4SNY
wtkAn0lnJoOD10YO8ZGaEx9OAbwVBqEE
=KNsF
-----END PGP SIGNATURE-----

--nextPart2141065.BBnrKxX4VU--
