Received: from sencha.khimov.ru ([89.223.109.22])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <roman@khimov.ru>) id 1NsLlD-0007Xa-QZ
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Mar 2010 20:52:08 +0100
Received: from [93.100.16.104] (helo=mate.localnet)
	by sencha.khimov.ru with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <roman@khimov.ru>) id 1NsLiG-0000WU-BL
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Mar 2010 22:49:01 +0300
From: Roman I Khimov <roman@khimov.ru>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 18 Mar 2010 22:46:23 +0300
User-Agent: KMail/1.12.4 (Linux/2.6.31.12-0.1-desktop; KDE/4.3.5; x86_64; ; )
References: <201003182212.31873.roman@khimov.ru>
	<ac9c93b11003181236u5d7701ebiaa778519b0013700@mail.gmail.com>
In-Reply-To: <ac9c93b11003181236u5d7701ebiaa778519b0013700@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201003182246.27013.roman@khimov.ru>
X-SA-Exim-Connect-IP: 89.223.109.22
X-SA-Exim-Mail-From: roman@khimov.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC/PATCH] Perl 5.10.1 and a bunch of modules
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
X-List-Received-Date: Thu, 18 Mar 2010 19:52:08 -0000
X-Groupsio-MsgNum: 17833
Content-Type: multipart/signed; boundary="nextPart10778756.qILKzOBHnO";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart10778756.qILKzOBHnO
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

=D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=82 =
=D0=A7=D0=B5=D1=82=D0=B2=D0=B5=D1=80=D0=B3 18 =D0=BC=D0=B0=D1=80=D1=82=D0=
=B0 2010 22:36:57 =D0=B0=D0=B2=D1=82=D0=BE=D1=80 Frans Meulenbroeks=20
=D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB:
> 2010/3/18 Roman I Khimov <roman@khimov.ru>:
> > Hello all.
> >
> > As perl 5.10.1 is a big patch by itself and series overall is 42 patches
> > and I don't want to banned from list for spam ;), I've commited that to
> > the "rik/perl-5.10" branch of OE repo.
> >
> > In general, the most interesting and the most requiring review are the
> > first 4, all the other are just various modules. So, please
> > review/try/test/ack/nack.
>=20
> Nice work Roman!

Thanks.

> Any particular reason not to go to 5.11?

AFAIK, 5.11 is development branch and we're more interested in stable.

> Also I'm not sure whether all the native recipes we have now are really
>  needed. Perhaps the new staging will take care of that. Do you have any
>  idea?

Most of -native were converted to BBCLASSEXTEND and those are at least=20
harmless, I think. And then some modules check for dependencies when=20
configuring, so -native version is needed for those checks to succeed.

=2D-=20
 http://roman.khimov.ru
mailto: roman@khimov.ru
gpg --keyserver hkp://subkeys.pgp.net --recv-keys 0xE5E055C3

--nextPart10778756.qILKzOBHnO
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.12 (GNU/Linux)

iEYEABECAAYFAkuigxIACgkQXJ70z+XgVcMhlwCePCFknbmVTHgTSfur1aiszUWb
oDAAni9jfJlgUT8scsrbtd4W7jvR7/op
=E8HP
-----END PGP SIGNATURE-----

--nextPart10778756.qILKzOBHnO--
