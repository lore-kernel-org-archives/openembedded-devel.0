Received: from sencha.khimov.ru ([89.223.109.22])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <roman@khimov.ru>) id 1OiA2D-0003Ai-UN
	for openembedded-devel@lists.openembedded.org;
	Sun, 08 Aug 2010 19:55:44 +0200
Received: from [93.100.16.104] (helo=mate.localnet)
	by sencha.khimov.ru with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <roman@khimov.ru>) id 1Oi9zh-0002Yw-PQ
	for openembedded-devel@lists.openembedded.org;
	Sun, 08 Aug 2010 21:51:27 +0400
From: Roman I Khimov <roman@khimov.ru>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 8 Aug 2010 21:48:53 +0400
User-Agent: KMail/1.12.4 (Linux/2.6.31.12-0.2-desktop; KDE/4.3.5; x86_64; ; )
References: <AANLkTikqC4jZ2YrjVUiibof1vCOMUhr4=uq4UWFGtdo0@mail.gmail.com>
In-Reply-To: <AANLkTikqC4jZ2YrjVUiibof1vCOMUhr4=uq4UWFGtdo0@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201008082148.56554.roman@khimov.ru>
X-SA-Exim-Connect-IP: 89.223.109.22
X-SA-Exim-Mail-From: roman@khimov.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] pkgconfig.bbclass: Remove spurious rpaths and -isystem includes from pkgconfig files.
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
X-List-Received-Date: Sun, 08 Aug 2010 17:55:45 -0000
X-Groupsio-MsgNum: 21973
Content-Type: multipart/signed; boundary="nextPart5156106.Lm6uZpcHL0";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart5156106.Lm6uZpcHL0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

=D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=82 =
=D0=92=D0=BE=D1=81=D0=BA=D1=80=D0=B5=D1=81=D0=B5=D0=BD=D1=8C=D0=B5 08 =D0=
=B0=D0=B2=D0=B3=D1=83=D1=81=D1=82=D0=B0 2010 07:14:49 =D0=B0=D0=B2=D1=82=D0=
=BE=D1=80 Ash Charles =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB:
> -                       -e 's:-I${STAGING_INCDIR}::g' \
> +                       -e 's:-rpath-link,${STAGING_LIBDIR}::g' \
> +                       -e 's:-I${STAGING_INCDIR}:-I${prefix}/include:g' \
> +                       -e 's:-isystem${STAGING_INCDIR}::g' \

I have "-isystem..." change in my own patch queue and rpath-link should be=
=20
fine also. I'm not so sure about incdir or libdir change though.

=2D-=20
 http://roman.khimov.ru
mailto: roman@khimov.ru
gpg --keyserver hkp://subkeys.pgp.net --recv-keys 0xE5E055C3

--nextPart5156106.Lm6uZpcHL0
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.12 (GNU/Linux)

iEYEABECAAYFAkxe7ggACgkQXJ70z+XgVcP7gwCfT77QIRyvItstT2cCcYJmm2d3
eIkAoNPIAusFd2W+XsSOrIlj0i3IQr6g
=8Hc2
-----END PGP SIGNATURE-----

--nextPart5156106.Lm6uZpcHL0--
