Received: from sencha.khimov.ru ([89.223.109.22])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <roman@khimov.ru>) id 1O91sD-0007B7-I1
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 May 2010 22:04:14 +0200
Received: from [93.100.16.104] (helo=mate.localnet)
	by sencha.khimov.ru with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <roman@khimov.ru>) id 1O91oY-0000gP-C0
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 May 2010 00:00:28 +0400
From: Roman I Khimov <roman@khimov.ru>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 3 May 2010 23:59:30 +0400
User-Agent: KMail/1.12.4 (Linux/2.6.31.12-0.2-desktop; KDE/4.3.5; x86_64; ; )
References: <201003301706.14340.khimov@altell.ru>
	<20100428125342.GA31214@zlo.nu>
	<201004290930.00901.roman@khimov.ru>
In-Reply-To: <201004290930.00901.roman@khimov.ru>
MIME-Version: 1.0
Message-Id: <201005040000.00002.roman@khimov.ru>
X-SA-Exim-Connect-IP: 89.223.109.22
X-SA-Exim-Mail-From: roman@khimov.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] openssl: add version 1.0.0
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
X-List-Received-Date: Mon, 03 May 2010 20:04:14 -0000
X-Groupsio-MsgNum: 18956
Content-Type: multipart/signed; boundary="nextPart3075416.F8XvGrsjjK";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart3075416.F8XvGrsjjK
Content-Type: Text/Plain;
  charset="windows-1251"
Content-Transfer-Encoding: quoted-printable

=C2 =F1=EE=EE=E1=F9=E5=ED=E8=E8 =EE=F2 =D7=E5=F2=E2=E5=F0=E3 29 =E0=EF=F0=
=E5=EB=FF 2010 09:29:58 =E0=E2=F2=EE=F0 Roman I Khimov =ED=E0=EF=E8=F1=E0=
=EB:
> =C2 =F1=EE=EE=E1=F9=E5=ED=E8=E8 =EE=F2 =D1=F0=E5=E4=E0 28 =E0=EF=F0=E5=EB=
=FF 2010 16:53:42 =E0=E2=F2=EE=F0 Marc Olzheim =ED=E0=EF=E8=F1=E0=EB:
> > On Tue, Mar 30, 2010 at 05:06:31PM +0400, Roman I Khimov wrote:
> > > --- /dev/null
> > > +++ b/recipes/openssl/openssl-1.0.0/configure-targets.patch
> > > @@ -0,0 +1,24 @@
> > > +
> > > +The number of colons are important :)
> > > +
> >
> > Note the comment. :-)
> >
> > [snip]
> >
> > The number of fields in the config-string has gone up by 3 from
> > openssl-0.9.8g to 1.0.0, so the debian.patch is no longer correct,
> >
> > resulting in build failures for my non-native mipsel build:
> > | make[4]: *** No rule to make target `link_a..so.1.0.0'.  Stop.
>=20
> OK, it works fine there (i386 and amd64 uclibc, both via cross), so I
>  didn't notice that it might be a problem. Care to do a patch? It'll take
>  me some time to create mipsel build setup and try it out.

Just pushed the fix, please try it out.

=2D-=20
 http://roman.khimov.ru
mailto: roman@khimov.ru
gpg --keyserver hkp://subkeys.pgp.net --recv-keys 0xE5E055C3

--nextPart3075416.F8XvGrsjjK
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.12 (GNU/Linux)

iEYEABECAAYFAkvfKz8ACgkQXJ70z+XgVcOULgCdHI1hgmbkalQW0enDdoP8zl9n
mggAnjjssGU9FxYqZF7CGm1ps6NS+8H9
=Azgr
-----END PGP SIGNATURE-----

--nextPart3075416.F8XvGrsjjK--
