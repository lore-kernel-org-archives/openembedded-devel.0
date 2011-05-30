Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1QR97N-0005Gy-7Z
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 May 2011 22:31:17 +0200
Received: (qmail invoked by alias); 30 May 2011 20:28:08 -0000
Received: from p5B0A259C.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.37.156]
	by mail.gmx.net (mp024) with SMTP; 30 May 2011 22:28:08 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX18ZDr9nl0EZGj0Zgt44jhIv1BqHfUpgJAVo9/8C8I
	3H39p9Yay98UWS
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 30 May 2011 22:29:01 +0200
User-Agent: KMail/1.13.7 (Linux/2.6.35.13-91.fc14.x86_64; KDE/4.6.3; x86_64; ;
	)
References: <201105220001.36288.schnitzeltony@gmx.de>
	<201105220143.54594.schnitzeltony@gmx.de>
	<1306782978.4106.483.camel@mattotaupa>
In-Reply-To: <1306782978.4106.483.camel@mattotaupa>
MIME-Version: 1.0
Message-Id: <201105302229.01288.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: Re: [PATCH] Revert "perl-native: create_wrapper on perl${PV} too"
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
X-List-Received-Date: Mon, 30 May 2011 20:31:17 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Monday, May 30, 2011 09:16:18 PM Paul Menzel wrote:
> From: Paul Menzel <paulepanter@users.sourceforge.net>
> Date: Mon, 30 May 2011 21:08:24 +0200
>=20
> This reverts commit 1e255fbd296e95ff178d66c4a1fe4875a988d7e1.
>=20
> 	Author: Tom Rini <tom_rini@mentor.com>
> 	Date:   Mon May 16 13:06:33 2011 -0700
>=20
> 		  perl-native: create_wrapper on perl${PV} too
>=20
> 		  perl${PV} becomes hostperl when building for the target so we need a
> 		  wrapper on that too.
>=20
> 		  Signed-off-by: Tom Rini <tom_rini@mentor.com>
>=20
> It breaks task compile of perl using `angstrom-2010.x` or
> `minimal{,-uclibc}` for `MACHINE =3D "beagleboard"` [1].
>=20
> [=E2=80=A6]
>=20
> | mv -f miniperl miniperl-target
> | ln -s hostperl miniperl
> | LD_LIBRARY_PATH=3D/home/Superandy/tmp/work/armv7a-angstrom-linux-gnueab=
i/pe
> | rl-5.10.1-r22/perl-5.10.1${LD_LIBRARY_PATH:+:}$LD_LIBRARY_PATH ./minipe=
rl
> | -Ilib make_patchnum.pl env: ./perl5.10.1.real: No such file or directory
> | make[1]: *** [lib/Config_git.pl] Error 127
> | make[1]: Leaving directory
> | `/home/Superandy/tmp/work/armv7a-angstrom-linux-gnueabi/perl-5.10.1-r22/
> | perl-5.10.1' make[1]: Entering directory
> | `/home/Superandy/tmp/work/armv7a-angstrom-linux-gnueabi/perl-5.10.1-r22/
> | perl-5.10.1'
> | LD_LIBRARY_PATH=3D/home/Superandy/tmp/work/armv7a-angstrom-linux-gnueab=
i/p
> | erl-5.10.1-r22/perl-5.10.1${LD_LIBRARY_PATH:+:}$LD_LIBRARY_PATH
> | ./miniperl -Ilib autodoc.pl env: ./perl5.10.1.real: No such file or
> | directory
> | make[1]: *** [pod/perlapi.pod] Error 127
> | make[1]: Leaving directory
> | `/home/Superandy/tmp/work/armv7a-angstrom-linux-gnueabi/perl-5.10.1-r22/
> | perl-5.10.1' make: *** [perl] Error 2
>=20
> [=E2=80=A6]
>=20
> [1]
> http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-May/032981.ht
> ml
>=20
> Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
> CC: Tom Rini <tom_rini@mentor.com>
> ---
> A fix is preferred though. ;-) Probably `PR` needs to be updated somehow
> too. ---
>  recipes/perl/perl-native_5.10.1.bb |    3 +--
>  1 files changed, 1 insertions(+), 2 deletions(-)
>=20
> diff --git a/recipes/perl/perl-native_5.10.1.bb
> b/recipes/perl/perl-native_5.10.1.bb index fdbe055..3dafc10 100644
> --- a/recipes/perl/perl-native_5.10.1.bb
> +++ b/recipes/perl/perl-native_5.10.1.bb
> @@ -2,7 +2,7 @@ DESCRIPTION =3D "Perl is a popular scripting language."
>  HOMEPAGE =3D "http://www.perl.org/"
>  SECTION =3D "libs"
>  LICENSE =3D "Artistic|GPLv1+"
> -PR =3D "r11"
> +PR =3D "r10"
>  NATIVE_INSTALL_WORKS =3D "1"
>  INHIBIT_DEFAULT_DEPS =3D "1"
>  PATCHTOOL =3D "patch"
> @@ -108,7 +108,6 @@ do_install() {
>  	done
>=20
>  	create_wrapper ${D}${bindir}/perl
> PERL5LIB=3D'$PERL5LIB:${STAGING_LIBDIR}/perl/${PV}:${STAGING_LIBDIR}/perl=
/'
> -	create_wrapper ${D}${bindir}/perl${PV}
> PERL5LIB=3D'$PERL5LIB:${STAGING_LIBDIR}/perl/${PV}:${STAGING_LIBDIR}/perl=
/'
> }
>=20
>  do_install_append_nylon() {
Hello Paul,

Isn't that exactly what [1] wants to fix and was described in [2] (sorry fo=
r late=20
night english written there :-)

Andreas

[1] http://patches.openembedded.org/patch/4923/
[2] http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-May/032981=
=2Ehtml


