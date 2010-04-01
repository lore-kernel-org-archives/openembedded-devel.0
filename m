Received: from sencha.khimov.ru ([89.223.109.22])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <roman@khimov.ru>) id 1Nx8wg-0002gt-8n
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Apr 2010 03:11:43 +0200
Received: from [93.100.16.104] (helo=mate.localnet)
	by sencha.khimov.ru with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <roman@khimov.ru>) id 1Nx8tU-0007iD-Hp
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Apr 2010 05:08:28 +0400
From: Roman I Khimov <roman@khimov.ru>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 1 Apr 2010 05:05:23 +0400
User-Agent: KMail/1.12.4 (Linux/2.6.31.12-0.2-desktop; KDE/4.3.5; x86_64; ; )
References: <1270061972-5564-1-git-send-email-khimov@altell.ru>
	<1270061972-5564-2-git-send-email-khimov@altell.ru>
	<20100331202741.GB21433@gmail.com>
In-Reply-To: <20100331202741.GB21433@gmail.com>
MIME-Version: 1.0
Message-Id: <201004010505.26062.roman@khimov.ru>
X-SA-Exim-Connect-IP: 89.223.109.22
X-SA-Exim-Mail-From: roman@khimov.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 2/3] postfix: convert to BBCLASSEXTEND and new staging for native
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
X-List-Received-Date: Thu, 01 Apr 2010 01:11:43 -0000
X-Groupsio-MsgNum: 18316
Content-Type: multipart/signed; boundary="nextPart1595216.XbpjhNCIYq";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart1595216.XbpjhNCIYq
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

=D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=82 =
=D0=A7=D0=B5=D1=82=D0=B2=D0=B5=D1=80=D0=B3 01 =D0=B0=D0=BF=D1=80=D0=B5=D0=
=BB=D1=8F 2010 00:27:41 =D0=B0=D0=B2=D1=82=D0=BE=D1=80 Khem Raj =D0=BD=D0=
=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB:
> > diff --git a/recipes/postfix/postfix.inc b/recipes/postfix/postfix.inc
> > index 6a5f9bb..5b18cef 100644
> > --- a/recipes/postfix/postfix.inc
> > +++ b/recipes/postfix/postfix.inc
> > @@ -1,5 +1,6 @@
> >  SECTION =3D "console/network"
> >  DEPENDS =3D "virtual/db libpcre postfix-native"
> > +DEPENDS_virtclass-native =3D "virtual/db-native libpcre-native"
>=20
> Is this really needed. I thought BBCLASSEXTEND should have converted it f=
or
> you and if you wanted to get rid of postfix-native dependency then why is
> it that native wont need it and target recipe will.

Thought so too, but didn't work for some reason, got dependency loop of=20
python-native being dependent on python-native.

=2D-=20
 http://roman.khimov.ru
mailto: roman@khimov.ru
gpg --keyserver hkp://subkeys.pgp.net --recv-keys 0xE5E055C3

--nextPart1595216.XbpjhNCIYq
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.12 (GNU/Linux)

iEYEABECAAYFAkuz8VUACgkQXJ70z+XgVcMbmwCg58sltvaB5pkb3zL+wSEC+Ju9
FlIAoLL/0e5ZOS7HyFT9Fsw5URWIV05h
=cZhh
-----END PGP SIGNATURE-----

--nextPart1595216.XbpjhNCIYq--
