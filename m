Received: from sencha.khimov.ru ([89.223.109.22])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <roman@khimov.ru>) id 1NsjJy-0007U8-Nd
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Mar 2010 22:01:35 +0100
Received: from [93.100.16.104] (helo=mate.localnet)
	by sencha.khimov.ru with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <roman@khimov.ru>) id 1NsjGz-00045c-As
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Mar 2010 23:58:26 +0300
From: Roman I Khimov <roman@khimov.ru>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 19 Mar 2010 23:55:47 +0300
User-Agent: KMail/1.12.4 (Linux/2.6.31.12-0.1-desktop; KDE/4.3.5; x86_64; ; )
References: <1239889359-13953-1-git-send-email-khimov@altell.ru>
	<1268769038-30979-1-git-send-email-khimov@altell.ru>
In-Reply-To: <1268769038-30979-1-git-send-email-khimov@altell.ru>
MIME-Version: 1.0
Message-Id: <201003192355.52441.roman@khimov.ru>
X-SA-Exim-Connect-IP: 89.223.109.22
X-SA-Exim-Mail-From: roman@khimov.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] cmake.bbclass: force CMAKE_INSTALL_SO_NO_EXE to be 0
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
X-List-Received-Date: Fri, 19 Mar 2010 21:01:35 -0000
X-Groupsio-MsgNum: 17878
Content-Type: multipart/signed; boundary="nextPart1391538.pnYR30RZqa";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart1391538.pnYR30RZqa
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

=D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=82 =
=D0=92=D1=82=D0=BE=D1=80=D0=BD=D0=B8=D0=BA 16 =D0=BC=D0=B0=D1=80=D1=82=D0=
=B0 2010 22:50:38 =D0=B0=D0=B2=D1=82=D0=BE=D1=80 Roman I Khimov =D0=BD=D0=
=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB:
> By default cmake guesses whether install shared libaries with exec
> permissions or not based on host distribution, so this behaviour
> changes from host to host. OpenEmbedded assumes shared libraries to
> be with exec permissions (reverse way brakes stripping, for example),
> so let's force this in cmake configure invocation.

So, I've rebased that to current, it looks like an obvious one and still no=
=20
one cares. As per policy, I need two ack's on this one. Should I break that=
=20
and push it or just wait another year till someone else interested in cmake=
=20
will ack it?

=2D-=20
 http://roman.khimov.ru
mailto: roman@khimov.ru
gpg --keyserver hkp://subkeys.pgp.net --recv-keys 0xE5E055C3

--nextPart1391538.pnYR30RZqa
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.12 (GNU/Linux)

iEYEABECAAYFAkuj5NgACgkQXJ70z+XgVcM06gCgwlhdVg/Yckff3xmwxByFDX6w
BhsAoLo8TpDLEpn2FkvTD6Bzg74gooxx
=rWhN
-----END PGP SIGNATURE-----

--nextPart1391538.pnYR30RZqa--
