Received: from sencha.khimov.ru ([89.223.109.22])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <roman@khimov.ru>) id 1OBs2r-0000aa-VB
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 May 2010 18:11:04 +0200
Received: from [93.100.16.104] (helo=mate.localnet)
	by sencha.khimov.ru with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <roman@khimov.ru>) id 1OBrz7-0002iu-LV
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 May 2010 20:07:06 +0400
From: Roman I Khimov <roman@khimov.ru>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 May 2010 20:07:04 +0400
User-Agent: KMail/1.12.4 (Linux/2.6.31.12-0.2-desktop; KDE/4.3.5; x86_64; ; )
References: <201005111904.06230.khimov@altell.ru>
	<201005111910.21084.khimov@altell.ru>
In-Reply-To: <201005111910.21084.khimov@altell.ru>
MIME-Version: 1.0
Message-Id: <201005112007.05008.roman@khimov.ru>
X-SA-Exim-Connect-IP: 89.223.109.22
X-SA-Exim-Mail-From: roman@khimov.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] logrotate scripts policy
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
X-List-Received-Date: Tue, 11 May 2010 16:11:04 -0000
X-Groupsio-MsgNum: 19171
Content-Type: multipart/signed; boundary="nextPart3139255.3Z9XOQQhqA";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart3139255.3Z9XOQQhqA
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

=D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=82 =
=D0=92=D1=82=D0=BE=D1=80=D0=BD=D0=B8=D0=BA 11 =D0=BC=D0=B0=D1=8F 2010 19:10=
:21 =D0=B0=D0=B2=D1=82=D0=BE=D1=80 Roman I Khimov =D0=BD=D0=B0=D0=BF=D0=B8=
=D1=81=D0=B0=D0=BB:
> =D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=
=82 =D0=92=D1=82=D0=BE=D1=80=D0=BD=D0=B8=D0=BA 11 =D0=BC=D0=B0=D1=8F 2010 1=
9:04:05 =D0=B0=D0=B2=D1=82=D0=BE=D1=80 Roman I Khimov =D0=BD=D0=B0=D0=BF=D0=
=B8=D1=81=D0=B0=D0=BB:
> > Also, in org.oe.dev there is already callweaver, asterisk and cluster-
> > resource-agents that have logrotate scripts installed in /etc/logrotate=
=2Ed
> > (that legitimizes RRECOMMENDS for *-logrotate a bit) and callweaver
> > RRECOMMENDS logrotate (asterisk has that commented out, so it supports
> > RSUGGESTS approach to logrotate itself a bit).
>=20
> P.S. There are probably more that have /etc/logrotate.d installed and
>  packaged in ${PN} without specifically mentioning it anywhere.

P.P.S. And because of that (and to simplify things in general) if might be=
=20
easier to handle logrotate script packaging with respectful =20
rsuggests/rrecommends/whatever in bitbake.conf. By default.

=2D-=20
 http://roman.khimov.ru
mailto: roman@khimov.ru
gpg --keyserver hkp://subkeys.pgp.net --recv-keys 0xE5E055C3

--nextPart3139255.3Z9XOQQhqA
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.12 (GNU/Linux)

iEYEABECAAYFAkvpgKgACgkQXJ70z+XgVcPy3gCgpafJdI1goYBcH6BBKr88rmOc
cKAAn3lubNvMEltnXgGfTbVkAJGW14wC
=Jxm8
-----END PGP SIGNATURE-----

--nextPart3139255.3Z9XOQQhqA--
