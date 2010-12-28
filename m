Received: from sencha.khimov.ru ([89.223.109.22])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <roman@khimov.ru>) id 1PXemf-0001lC-8a
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Dec 2010 20:00:33 +0100
Received: from [93.100.16.104] (helo=mate.localnet)
	by sencha.khimov.ru with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <roman@khimov.ru>) id 1PXemQ-0003cc-Vh
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Dec 2010 22:00:20 +0300
From: Roman I Khimov <roman@khimov.ru>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 28 Dec 2010 22:00:14 +0300
User-Agent: KMail/1.12.4 (Linux/2.6.31.14-0.4-desktop; KDE/4.3.5; x86_64; ; )
References: <1293469867-18737-1-git-send-email-fransmeulenbroeks@gmail.com>
	<201012272236.01404.roman@khimov.ru>
	<AANLkTi=P_dKFv4JiyU8_g_EoLK_Zn+HvNtVfUEccTA56@mail.gmail.com>
In-Reply-To: <AANLkTi=P_dKFv4JiyU8_g_EoLK_Zn+HvNtVfUEccTA56@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201012282200.18012.roman@khimov.ru>
Subject: Re: [PATCH v3] cpan_build.bbclass; added cc and ld flags to the perl Build.PL invocation
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
X-List-Received-Date: Tue, 28 Dec 2010 19:00:33 -0000
X-Groupsio-MsgNum: 27545
Content-Type: multipart/signed; boundary="nextPart2019149.eLBPp7AY5c";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart2019149.eLBPp7AY5c
Content-Type: Text/Plain;
  charset="koi8-r"
Content-Transfer-Encoding: quoted-printable

=F7 =D3=CF=CF=C2=DD=C5=CE=C9=C9 =CF=D4 =F7=D4=CF=D2=CE=C9=CB 28 =C4=C5=CB=
=C1=C2=D2=D1 2010 21:23:39 =C1=D7=D4=CF=D2 Frans Meulenbroeks=20
=CE=C1=D0=C9=D3=C1=CC:
> 2010/12/27 Roman I Khimov <roman@khimov.ru>:
> > rik@kettle:oe-arm$ cat
> > tmp/sysroots/armv5te-angstrom-linux-gnueabi/usr/lib/perl/config.sh | gr=
ep
> > -E "^(cc=3D|ld=3D|ldflags=3D)" cc=3D"arm-angstrom-linux-gnueabi-gcc
> > -march=3Darmv5te -mtune=3Darm926ej-s -mthumb-interwork -mno-thumb"
> > ld=3D"arm-angstrom-linux-gnueabi-gcc -march=3Darmv5te -mtune=3Darm926ej=
=2Ds
> > -mthumb-interwork -mno-thumb"
> > ldflags=3D"-L/storage/work/oe/oe-arm/tmp/sysroots/armv5te-angstrom-linu=
x-gn
> >ueabi/usr/lib
> > -Wl,-rpath-link,/storage/work/oe/oe-arm/tmp/sysroots/armv5te-angstrom-l=
in
> >ux-gnueabi/usr/lib -Wl,-O1 -Wl,--hash-style=3Dgnu"
>=20
> Comparing notes: I have:
>=20
> frans@linux-suse:~/oe> cat
> tmp_minimal/sysroots/armv5te-oe-linux-gnueabi/usr/lib/perl/config.sh |
> grep -E "^(cc=3D|ld=3D|ldflags=3D)"
> cc=3D"arm-oe-linux-gnueabi-gcc -march=3Darmv5te -mtune=3Darm926ej-s
> -mthumb-interwork -mthumb"
> ld=3D"arm-oe-linux-gnueabi-gcc -march=3Darmv5te -mtune=3Darm926ej-s
> -mthumb-interwork -mthumb"
> ldflags=3D"-Wl,-O1 -Wl,--hash-style=3Dgnu"
>=20
> Note the different definition of ldflags. (no -L ) and the -mthumb
> versus -mno-thumb.

We might have different targets for thumb things (mine is qemuarm), but "-L=
"=20
difference seems suspicious (my test build is for 'angstrom-2008.1' if that=
=20
matters).

> Btw I am using libtool 2.4 with systool support (should that matter)

Maybe, maybe. I should try some newer distro for my test builds.

> > Same definitions in Config_heavy. It should be working without that. I'=
ve
>=20
> Should I have this file in sysroots/armv5te....  ?
> I only have
> frans@linux-suse:~/oe/tmp_minimal/sysroots> find | grep heavy
> ./i686-linux/usr/lib/perl/5.10.1/Config_heavy.pl
> ./i686-linux/usr/lib/perl/5.10.1/utf8_heavy.pl
> ./i686-linux/usr/lib/perl/5.10.1/Config_heavy-target.pl
> ./i686-linux/usr/lib/perl/5.10.1/bytes_heavy.pl
> ./armv5te-oe-linux-gnueabi/usr/share/mysql/my-innodb-heavy-4G.cnf
> ./armv7a-oe-linux-gnueabi/usr/share/mysql/my-innodb-heavy-4G.cnf
>=20
> And Config_heavy.pl says:
> frans@linux-suse:~/oe/tmp_minimal/sysroots> grep -E
> "^(cc=3D|ld=3D|ldflags=3D)" ./i686-linux/usr/lib/perl/5.10.1/Config_heavy=
=2Epl

That's the wrong one, you're interested in Config_heavy-target.pl, or=20
Config_heavy-arm-angstrom-linux-gnueabi.pl after my recent patch series (th=
at=20
I'll push today).

=2D-=20
 http://roman.khimov.ru
mailto: roman@khimov.ru
gpg --keyserver hkp://subkeys.pgp.net --recv-keys 0xE5E055C3

--nextPart2019149.eLBPp7AY5c
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.12 (GNU/Linux)

iEYEABECAAYFAk0aM8IACgkQXJ70z+XgVcNM6ACgjevZtAunJuhW2/9w592sMphl
xeAAoKm5dwaKDETISevMpo5l5X0uEpGS
=F7FU
-----END PGP SIGNATURE-----

--nextPart2019149.eLBPp7AY5c--
