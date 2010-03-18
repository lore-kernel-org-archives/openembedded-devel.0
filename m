Received: from sencha.khimov.ru ([89.223.109.22])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <roman@khimov.ru>) id 1NsOl8-0007CC-Tl
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Mar 2010 00:04:16 +0100
Received: from [93.100.16.104] (helo=mate.localnet)
	by sencha.khimov.ru with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <roman@khimov.ru>) id 1NsNEG-0000el-Ba
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Mar 2010 00:26:09 +0300
From: Roman I Khimov <roman@khimov.ru>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 19 Mar 2010 00:23:25 +0300
User-Agent: KMail/1.12.4 (Linux/2.6.31.12-0.1-desktop; KDE/4.3.5; x86_64; ; )
References: <201003182212.31873.roman@khimov.ru>
	<201003182347.06715.roman@khimov.ru>
	<201003190004.37865.roman@khimov.ru>
In-Reply-To: <201003190004.37865.roman@khimov.ru>
MIME-Version: 1.0
Message-Id: <201003190023.36525.roman@khimov.ru>
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
X-List-Received-Date: Thu, 18 Mar 2010 23:04:16 -0000
X-Groupsio-MsgNum: 17845
Content-Type: multipart/signed; boundary="nextPart7402615.uk5zOIS0lN";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart7402615.uk5zOIS0lN
Content-Type: Text/Plain;
  charset="windows-1251"
Content-Transfer-Encoding: quoted-printable

=C2 =F1=EE=EE=E1=F9=E5=ED=E8=E8 =EE=F2 =CF=FF=F2=ED=E8=F6=E0 19 =EC=E0=F0=
=F2=E0 2010 00:04:30 =E0=E2=F2=EE=F0 Roman I Khimov =ED=E0=EF=E8=F1=E0=EB:
> =C2 =F1=EE=EE=E1=F9=E5=ED=E8=E8 =EE=F2 =D7=E5=F2=E2=E5=F0=E3 18 =EC=E0=F0=
=F2=E0 2010 23:47:01 =E0=E2=F2=EE=F0 Roman I Khimov =ED=E0=EF=E8=F1=E0=EB:
> > No. You mean, this one?
> > http://git.pokylinux.org/cgit.cgi/poky/commit/?id=3Dca5f36ee6ad756e1e54=
0288
> >a5 6a504c1d8ecc7a3
> >
> > Looks like a good thing to have, so if Richard will push it to OE.dev I
> > can do a rebase of my patchset.
>=20
> Actually, the better sequence is
>  * drop 5.8.4 and 5.8.7
>  * bring in staging changes
>  * bring in 5.10.1
>=20
> I'll prepare 5.8.4/5.8.7 removal patch.

Updated rik/perl-5.10 branch with removal patch, please ACK.

BTW, if it's not intentional, the commit mentioned above has a bug in cpan-
base in

=2D    if is_new_perl(d) =3D=3D "yes":
=2D             libdirs =3D libdir + '/perl5'
=2D    else:
=2D                libdirs =3D libdir + '/*/*/perl5'
+    libdirs =3D libdir + '/*/*/perl5'

Shouldn't it be

+    libdirs =3D libdir + '/perl5'

as we're left with new perl only?

=2D-=20
 http://roman.khimov.ru
mailto: roman@khimov.ru
gpg --keyserver hkp://subkeys.pgp.net --recv-keys 0xE5E055C3

--nextPart7402615.uk5zOIS0lN
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.12 (GNU/Linux)

iEYEABECAAYFAkuimdgACgkQXJ70z+XgVcO/5gCdHc6IQITeslVlsfttsbVFhI8H
upgAoNZpoMglW2S0AuYIBE5O3YxOtx/Q
=TuHV
-----END PGP SIGNATURE-----

--nextPart7402615.uk5zOIS0lN--
