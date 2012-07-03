Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Slwka-00054N-Dr
	for openembedded-devel@lists.openembedded.org;
	Tue, 03 Jul 2012 08:38:16 +0200
Received: by weyr6 with SMTP id r6so715238wey.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Jul 2012 23:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=yIJ3iMCm7+7WZDsSolQiyyZkz3MCMGopNoigEV2K2hQ=;
	b=YIpSJ9EppMRVe7RK7jZC9a2VJr/YN8swgy9zKavKT8+oXbb5YuAdLDK9fAbwzYVeHJ
	uQLSQ9S7TII/Vl72u9GgyHoWXLf5N4Q+Giux2vqttrLXrHzIkyZKNTKM9RYp59EHltpN
	5Sx+Y8j+IGKhPRJF7Ji8Qc6rPYY+OFfFrXlGWrTFJ6qR6oS6v/fgndYHwIKhA980gZUd
	42K71P/MyLoM2/X733MFtu7SRvBY0VMbTd+Vf31vR/IjOldCAFQsGfgtYg2fYiLTRyo0
	jJzA+1Ufx49pgqoGlETWizyiIbwX9EQS+YP/80wH6Um2lyrxTotoe7FSgTKrqH/qpN0K
	4Y9w==
Received: by 10.180.86.106 with SMTP id o10mr2851906wiz.22.1341296834907;
	Mon, 02 Jul 2012 23:27:14 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n6sm53111713wie.7.2012.07.02.23.27.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 02 Jul 2012 23:27:13 -0700 (PDT)
Date: Tue, 3 Jul 2012 08:27:13 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120703062713.GA3771@jama.jama.net>
References: <1341280162-18161-1-git-send-email-dennis.yxun@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1341280162-18161-1-git-send-email-dennis.yxun@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [OE-core][PATCH v3] openjade-native: fix undefined Getopts error, use std namespace
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
X-List-Received-Date: Tue, 03 Jul 2012 06:38:16 -0000
X-Groupsio-MsgNum: 39463
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IS0zKkzwUGydFO0o"
Content-Disposition: inline

--IS0zKkzwUGydFO0o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 03, 2012 at 01:49:22AM +0000, Dennis Lan wrote:
> Using Gentoo Linux as the build host, it fails without this patch
> Use Getopt::Std in place of getopts.pl.

Hi,

missing PR bump in recipe and this time (in v3) wrong ML.

Cheers,

>=20
> https://bugs.gentoo.org/show_bug.cgi?id=3D420083
>=20
> which following error:
> /usr/bin/perl -w ./../msggen.pl -l jstyleModule InterpreterMessages.msg
> /usr/bin/perl -w ./../msggen.pl -l jstyleModule DssslAppMessages.msg
> Undefined subroutine &main::Getopts called at ./../msggen.pl line 22.
> make[2]: *** [InterpreterMessages.h] Error 2
> make[2]: *** Waiting for unfinished jobs....
> Undefined subroutine &main::Getopts called at ./../msggen.pl line 22.
> make[2]: *** [DssslAppMessages.h] Error 2
>=20
> Signed-off-by: Dennis Lan <dennis.yxun@gmail.com>
> ---
>  .../openjade/openjade-1.3.2/msggen.pl.patch        |   44 ++++++++++++++=
++++++
>  .../openjade/openjade-native_1.3.2.bb              |    1 +
>  2 files changed, 45 insertions(+), 0 deletions(-)
>  create mode 100644 meta/recipes-devtools/openjade/openjade-1.3.2/msggen.=
pl.patch
>=20
> diff --git a/meta/recipes-devtools/openjade/openjade-1.3.2/msggen.pl.patc=
h b/meta/recipes-devtools/openjade/openjade-1.3.2/msggen.pl.patch
> new file mode 100644
> index 0000000..b47fd46
> --- /dev/null
> +++ b/meta/recipes-devtools/openjade/openjade-1.3.2/msggen.pl.patch
> @@ -0,0 +1,44 @@
> +commit fcc5b94f118495b1a467edcda6c6f631691c3f69
> +Author: Dennis Lan <dennis.yxun@gmail.com>
> +Date:   Tue Jul 3 09:25:42 2012 +0800
> +
> +    openjade: fix undefined Getopts error, use std namespace
> +   =20
> +    Using Gentoo Linux as the build host, it fails without this patch
> +    Use Getopt::Std in place of getopts.pl.
> +   =20
> +    Upstream-Status: Inappropriate [no upstream]
> +    Original-Author-By: Mike Gilbert <floppym@gentoo.org>
> +    Signed-off-by: Dennis Lan <dennis.yxun@gmail.com>
> +
> +diff --git a/msggen.pl b/msggen.pl
> +index 0c33968..2ee3f66 100644
> +--- a/msggen.pl
> ++++ b/msggen.pl
> +@@ -4,6 +4,7 @@
> + # See the file COPYING for copying permission.
> +=20
> + use POSIX;
> ++use Getopt::Std;
> +=20
> + # Package and version.
> + $package =3D 'openjade';
> +@@ -18,8 +19,7 @@ $gen_c =3D 0;
> + undef $opt_l;
> + undef $opt_p;
> + undef $opt_t;
> +-do 'getopts.pl';
> +-&Getopts('l:p:t:');
> ++getopts('l:p:t:');
> + $module =3D $opt_l;
> + $pot_file =3D $opt_p;
> +=20
> +@@ -72,7 +72,7 @@ while (<DEF>) {
> +     else {
> + 	$field[0] =3D~ /^[IWQXE][0-9]$/ || &error("invalid first field");;
> + 	$type[$num] =3D substr($field[0], 0, 1);
> +-	$argc =3D int(substr($field[0], 1, 1));
> ++	$argc =3D substr($field[0], 1, 1);
> +     }
> +     $nargs[$num] =3D $argc;
> +     $field[1] =3D~ /^[a-zA-Z_][a-zA-Z0-9_]+$/ || &error("invalid tag");
> diff --git a/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb b/me=
ta/recipes-devtools/openjade/openjade-native_1.3.2.bb
> index 5b29c1f..efd1e11 100644
> --- a/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb
> +++ b/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb
> @@ -14,6 +14,7 @@ RDEPENDS_${PN} =3D "sgml-common-native"
> =20
>  SRC_URI =3D "${SOURCEFORGE_MIRROR}/openjade/openjade-${PV}.tar.gz \
>             file://makefile.patch \
> +           file://msggen.pl.patch \
>             file://reautoconf.patch \
>  	   file://user-declared-default-constructor.patch"
> =20
> --=20
> 1.7.9.rc2
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--IS0zKkzwUGydFO0o
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk/ykMEACgkQN1Ujt2V2gBwlawCglSfkYr4QUYgvcCGjq/M/ZN18
hI4AniCZ/XRTrGP5zkd4BYINDr92h7aB
=X6/a
-----END PGP SIGNATURE-----

--IS0zKkzwUGydFO0o--
