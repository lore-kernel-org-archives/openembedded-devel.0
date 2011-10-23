Received: from sencha.khimov.ru ([89.223.109.22])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <roman@khimov.ru>) id 1RI2YX-0005Lu-U6
	for openembedded-devel@lists.openembedded.org;
	Sun, 23 Oct 2011 20:13:58 +0200
Received: from [93.100.16.104] (helo=mate.hex)
	by sencha.khimov.ru with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <roman@khimov.ru>) id 1RI2CG-0003c8-Us
	for openembedded-devel@lists.openembedded.org;
	Sun, 23 Oct 2011 21:51:01 +0400
From: Roman Khimov <roman@khimov.ru>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 Oct 2011 21:50:43 +0400
User-Agent: KMail/1.13.6 (Linux/2.6.37.6-0.7-desktop; KDE/4.6.0; x86_64; ; )
References: <4E9C93AB.7090705@telia.com> <4E9CA882.7080107@gmail.com>
	<4E9D16AD.7040403@telia.com>
In-Reply-To: <4E9D16AD.7040403@telia.com>
MIME-Version: 1.0
Message-Id: <201110232150.53072.roman@khimov.ru>
Subject: Re: Performance measurement: Building openembedded-core with and without overclocking on C-i7 2600K
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
X-List-Received-Date: Sun, 23 Oct 2011 18:13:58 -0000
X-Groupsio-MsgNum: 34988
Content-Type: multipart/signed; boundary="nextPart1890086.Wi8TAq8cAK";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart1890086.Wi8TAq8cAK
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

=D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=82 =
18 =D0=BE=D0=BA=D1=82=D1=8F=D0=B1=D1=80=D1=8F 2011 10:03:25 =D0=B0=D0=B2=D1=
=82=D0=BE=D1=80 Ulf Samuelsson =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB:
> Also what happens if it it built on a fast SSD, or even a RAMdisk?

Our main build server has two Xeons X5670 with 96 GB of RAM. It's running 2=
4=C3=977=20
cyclicly doing clean isolated builds of all our OE projects (currently five=
).=20
"Isolated" means that the the actual build is done inside a container (LXC)=
=20
with no network available at all, that is a requirement for all our builds,=
 to=20
be able to take one tarball of sources, one tarball of OE tree and build th=
e=20
project somewhere in a nuclear bunker.

The system is configured in such way that container is located on tmpfs (wi=
th=20
size of 50 GB). The most complex build takes about hour and a half on this=
=20
system occupying about 45 GB of space in a ramdisk.

So today I tried to get some RAM vs. Linux cache statistics and switched th=
is=20
mount point over to newly created 60 GB LVM partition with ext4 on RAID0 ar=
ray=20
consisting of two SAS 15K drives.

The system made builds for three projects is this configuration and I see n=
o=20
difference at all, usual 1-2 minutes deviation. Granted, the system has qui=
te=20
powerful disks (RAID array gives about 380 MB/sec on hdparm) and things mig=
ht=20
be a little different on plain SATA drives, but frankly I'd expected to see=
=20
the difference anyway since there are lots of small files involved in a bui=
ld.

Maybe I should try to further degrade the disk system by creating some=20
encrypted volume inside LVM, but still from what I see Linux caching and=20
buffering works good enough, just give it as much RAM as you can.

But then also what you'll get from RAM or disk or even CPU upgrade depends =
on=20
what type of build you have. Upgrading developers build servers from pair o=
f=20
4-core Opterons (don't remember exact model) with 8 GB of RAM to pair of Xe=
ons=20
E5620 with 24 GB of RAM with comparable disks gave about 20-30% of build ti=
me=20
reduction for one project and 50% for another. But that builds are not=20
isolated and use icecc cluster with all build servers available to the=20
cluster, maybe that helps also in our situation.

=2D-=20
 http://roman.khimov.ru
mailto: roman@khimov.ru
gpg --keyserver hkp://subkeys.pgp.net --recv-keys 0xE5E055C3

--nextPart1890086.Wi8TAq8cAK
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.16 (GNU/Linux)

iEYEABECAAYFAk6kU/wACgkQXJ70z+XgVcPFDQCeMNhg7MSge+lFHhxucss8uvU/
SWUAn11yB9uqhao7lg5h5f6Vql+xaQEB
=27gp
-----END PGP SIGNATURE-----

--nextPart1890086.Wi8TAq8cAK--
