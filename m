Received: from sencha.khimov.ru ([89.223.109.22])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <roman@khimov.ru>) id 1PXIss-0001JZ-C3
	for openembedded-devel@lists.openembedded.org;
	Mon, 27 Dec 2010 20:38:35 +0100
Received: from [93.100.16.104] (helo=mate.localnet)
	by sencha.khimov.ru with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <roman@khimov.ru>) id 1PXIrT-0001t0-5R
	for openembedded-devel@lists.openembedded.org;
	Mon, 27 Dec 2010 22:36:05 +0300
From: Roman I Khimov <roman@khimov.ru>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 27 Dec 2010 22:35:57 +0300
User-Agent: KMail/1.12.4 (Linux/2.6.31.14-0.4-desktop; KDE/4.3.5; x86_64; ; )
References: <1293469867-18737-1-git-send-email-fransmeulenbroeks@gmail.com>
In-Reply-To: <1293469867-18737-1-git-send-email-fransmeulenbroeks@gmail.com>
MIME-Version: 1.0
Message-Id: <201012272236.01404.roman@khimov.ru>
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
X-List-Received-Date: Mon, 27 Dec 2010 19:38:35 -0000
X-Groupsio-MsgNum: 27533
Content-Type: multipart/signed; boundary="nextPart3351123.AtqrRJPlDW";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart3351123.AtqrRJPlDW
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

=D0=92 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B8 =D0=BE=D1=82 =
=D0=9F=D0=BE=D0=BD=D0=B5=D0=B4=D0=B5=D0=BB=D1=8C=D0=BD=D0=B8=D0=BA 27 =D0=
=B4=D0=B5=D0=BA=D0=B0=D0=B1=D1=80=D1=8F 2010 20:11:07 =D0=B0=D0=B2=D1=82=D0=
=BE=D1=80 Frans Meulenbroeks =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB:
> Without these gcc would be used which resolves to /usr/bin/gcc
> and one gets an intel exe.
> This showed up with libparams-validate-perl and libdatetime-perl
> The LDFLAGS are added to resolve the GNU_HASH QA error
>=20
> Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
> ---
>  classes/cpan_build.bbclass     |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
>=20
> diff --git a/classes/cpan_build.bbclass b/classes/cpan_build.bbclass
> index d1bbc4f..070e061 100644
> --- a/classes/cpan_build.bbclass
> +++ b/classes/cpan_build.bbclass
> @@ -26,6 +26,7 @@ cpan_build_do_configure () {
>  		# build for target
>  		. ${STAGING_LIBDIR}/perl/config.sh
>  		perl Build.PL --installdirs vendor \
> +		        --config cc=3D"${CC} ${LDFLAGS}" --config ld=3D"${CCLD} ${LDFL=
AGS}"
>  \ --destdir ${D} \
>  			--install_path lib=3D"${datadir}/perl5" \
>  			--install_path arch=3D"${libdir}/perl5" \
>=20

Seems strange to me. ${STAGING_LIBDIR}/perl/config.sh for example:

rik@kettle:oe-arm$ cat tmp/sysroots/armv5te-angstrom-linux-gnueabi/usr/lib/=
perl/config.sh | grep -E "^(cc=3D|ld=3D|ldflags=3D)"
cc=3D"arm-angstrom-linux-gnueabi-gcc -march=3Darmv5te -mtune=3Darm926ej-s -=
mthumb-interwork -mno-thumb"
ld=3D"arm-angstrom-linux-gnueabi-gcc -march=3Darmv5te -mtune=3Darm926ej-s -=
mthumb-interwork -mno-thumb"
ldflags=3D"-L/storage/work/oe/oe-arm/tmp/sysroots/armv5te-angstrom-linux-gn=
ueabi/usr/lib -Wl,-rpath-link,/storage/work/oe/oe-arm/tmp/sysroots/armv5te-=
angstrom-linux-gnueabi/usr/lib -Wl,-O1 -Wl,--hash-style=3Dgnu"

Same definitions in Config_heavy. It should be working without that. I've
just built it here for qemuarm (with Angstrom distro) and seems to be OK:

rik@kettle:oe-arm$ ./tmp/sysroots/x86_64-linux/usr/armv5te/bin/arm-angstrom=
=2Dlinux-gnueabi-objdump -f tmp/work/armv5te-angstrom-linux-gnueabi/libdate=
time-perl-0.61-r1/image/usr/lib/perl5/auto/DateTime/DateTime.so

tmp/work/armv5te-angstrom-linux-gnueabi/libdatetime-perl-0.61-r1/image/usr/=
lib/perl5/auto/DateTime/DateTime.so:     file format elf32-littlearm
architecture: arm, flags 0x00000150:
HAS_SYMS, DYNAMIC, D_PAGED
start address 0x00000c94


=2D-=20
 http://roman.khimov.ru
mailto: roman@khimov.ru
gpg --keyserver hkp://subkeys.pgp.net --recv-keys 0xE5E055C3

--nextPart3351123.AtqrRJPlDW
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.12 (GNU/Linux)

iEYEABECAAYFAk0Y6qEACgkQXJ70z+XgVcOQWACgiH9gjxTATyyp2DwQ75XCrqDO
XzwAn1SjXn+dEFq9AzvYHw51MR+CPVMO
=GN4e
-----END PGP SIGNATURE-----

--nextPart3351123.AtqrRJPlDW--
