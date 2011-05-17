Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QMFj0-0005dS-OA for openembedded-devel@lists.openembedded.org;
	Tue, 17 May 2011 10:33:54 +0200
Received: from f053033076.adsl.alicedsl.de ([78.53.33.76]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QMFgG-0003yC-3V; Tue, 17 May 2011 08:31:04 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1304951256.3791.61.camel@mattotaupa>
References: <1304951256.3791.61.camel@mattotaupa>
Date: Tue, 17 May 2011 10:31:01 +0200
Message-ID: <1305621062.4065.20.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: gs_9.01: task configure fails with `./base/gp_unix.c:25:37: error: fontconfig/fontconfig.h: No such file or directory`
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
X-List-Received-Date: Tue, 17 May 2011 08:33:54 -0000
X-Groupsio-MsgNum: 32133
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-QgfsMxo8VN+4T0X7X1ro"

--=-QgfsMxo8VN+4T0X7X1ro
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Montag, den 09.05.2011, 16:27 +0200 schrieb Paul Menzel:
> Dear Steve, dear Koen,
>=20
>=20
> task configure of GS 9.01 committed in 49a0baba [1] fails with the
> following error message using `angstrom-2010.x` for `MACHINE =3D
> "beagleboard"`.
>=20
>         gcc   -DHAVE_MKSTEMP -DHAVE_HYPOT -DHAVE_FILE64 -DHAVE_MKSTEMP64 =
-DHAVE_FONTCONFIG  -DHAVE_SETLOCALE -O2 -Wall -Wstrict-prototypes -Wundef -=
Wmissing-declarations -Wmissing-prototypes -Wwrite-strings -Wno-strict-alia=
sing -Wdeclaration-after-statement -fno-builtin -fno-common -DHAVE_STDINT_H=
 -DGX_COLOR_INDEX_TYPE=3D"unsigned long long" -fexpensive-optimizations -fo=
mit-frame-pointer -frename-registers -O2 -ggdb2  -I./obj -I./base  -fexpens=
ive-optimizations -fomit-frame-pointer -frename-registers -O2 -ggdb2   -o .=
/obj/gp_unix.o -c ./base/gp_unix.c
>         In file included from ./base/gp_unix.c:17:
>         ./base/pipe_.h:39: warning: function declaration isn't a prototyp=
e
>         ./base/gp_unix.c:25:37: error: fontconfig/fontconfig.h: No such f=
ile or directory
>         ./base/gp_unix.c: In function 'makePSFontName':
>         ./base/gp_unix.c:245: error: 'FC_SLANT_ROMAN' undeclared (first u=
se in this function)
>         ./base/gp_unix.c:245: error: (Each undeclared identifier is repor=
ted only once
>         ./base/gp_unix.c:245: error: for each function it appears in.)
>         ./base/gp_unix.c:246: error: 'FC_SLANT_OBLIQUE' undeclared (first=
 use in this function)
>         ./base/gp_unix.c:247: error: 'FC_SLANT_ITALIC' undeclared (first =
use in this function)
>         ./base/gp_unix.c:252: error: 'FC_WEIGHT_MEDIUM' undeclared (first=
 use in this function)
>         ./base/gp_unix.c:253: error: 'FC_WEIGHT_LIGHT' undeclared (first =
use in this function)
>         ./base/gp_unix.c:254: error: 'FC_WEIGHT_DEMIBOLD' undeclared (fir=
st use in this function)
>         ./base/gp_unix.c:255: error: 'FC_WEIGHT_BOLD' undeclared (first u=
se in this function)
>         ./base/gp_unix.c:256: error: 'FC_WEIGHT_BLACK' undeclared (first =
use in this function)
>         ./base/gp_unix.c: At top level:
>         ./base/gp_unix.c:300: error: expected specifier-qualifier-list be=
fore 'FcConfig'
>         ./base/gp_unix.c: In function 'gp_enumerate_fonts_init':
>         ./base/gp_unix.c:310: error: 'FcPattern' undeclared (first use in=
 this function)
>         ./base/gp_unix.c:310: error: 'pat' undeclared (first use in this =
function)
>         ./base/gp_unix.c:311: error: 'FcObjectSet' undeclared (first use =
in this function)
>         ./base/gp_unix.c:311: error: 'os' undeclared (first use in this f=
unction)
>         ./base/gp_unix.c:318: error: 'unix_fontenum_t' has no member name=
d 'fc'
>         ./base/gp_unix.c:319: error: 'unix_fontenum_t' has no member name=
d 'font_list'
>         ./base/gp_unix.c:322: error: 'unix_fontenum_t' has no member name=
d 'fc'
>         ./base/gp_unix.c:322: warning: implicit declaration of function '=
FcInitLoadConfigAndFonts'
>         ./base/gp_unix.c:323: error: 'unix_fontenum_t' has no member name=
d 'fc'
>         ./base/gp_unix.c:331: warning: implicit declaration of function '=
FcPatternBuild'
>         ./base/gp_unix.c:332: error: 'FC_OUTLINE' undeclared (first use i=
n this function)
>         ./base/gp_unix.c:332: error: 'FcTypeBool' undeclared (first use i=
n this function)
>         ./base/gp_unix.c:333: error: 'FC_SCALABLE' undeclared (first use =
in this function)
>         ./base/gp_unix.c:335: warning: implicit declaration of function '=
FcObjectSetBuild'
>         ./base/gp_unix.c:335: error: 'FC_FILE' undeclared (first use in t=
his function)
>         ./base/gp_unix.c:336: error: 'FC_FAMILY' undeclared (first use in=
 this function)
>         ./base/gp_unix.c:336: error: 'FC_WEIGHT' undeclared (first use in=
 this function)
>         ./base/gp_unix.c:336: error: 'FC_SLANT' undeclared (first use in =
this function)
>         ./base/gp_unix.c:338: error: 'unix_fontenum_t' has no member name=
d 'font_list'
>         ./base/gp_unix.c:338: warning: implicit declaration of function '=
FcFontList'
>         ./base/gp_unix.c:339: warning: implicit declaration of function '=
FcPatternDestroy'
>         ./base/gp_unix.c:340: warning: implicit declaration of function '=
FcObjectSetDestroy'
>         ./base/gp_unix.c:341: error: 'unix_fontenum_t' has no member name=
d 'font_list'
>         ./base/gp_unix.c: In function 'gp_enumerate_fonts_next':
>         ./base/gp_unix.c:356: error: 'FcChar8' undeclared (first use in t=
his function)
>         ./base/gp_unix.c:356: error: 'file_fc' undeclared (first use in t=
his function)
>         ./base/gp_unix.c:357: error: 'family_fc' undeclared (first use in=
 this function)
>         ./base/gp_unix.c:358: warning: ISO C90 forbids mixed declarations=
 and code
>         ./base/gp_unix.c:359: error: 'FcPattern' undeclared (first use in=
 this function)
>         ./base/gp_unix.c:359: error: 'font' undeclared (first use in this=
 function)
>         ./base/gp_unix.c:360: error: 'FcResult' undeclared (first use in =
this function)
>         ./base/gp_unix.c:360: error: expected ';' before 'result'
>         ./base/gp_unix.c:366: error: 'unix_fontenum_t' has no member name=
d 'font_list'
>         ./base/gp_unix.c:372: error: 'unix_fontenum_t' has no member name=
d 'font_list'
>         ./base/gp_unix.c:374: error: 'result' undeclared (first use in th=
is function)
>         ./base/gp_unix.c:374: warning: implicit declaration of function '=
FcPatternGetString'
>         ./base/gp_unix.c:374: error: 'FC_FAMILY' undeclared (first use in=
 this function)
>         ./base/gp_unix.c:375: error: 'FcResultMatch' undeclared (first us=
e in this function)
>         ./base/gp_unix.c:380: error: 'FC_FILE' undeclared (first use in t=
his function)
>         ./base/gp_unix.c:386: warning: implicit declaration of function '=
FcPatternGetBool'
>         ./base/gp_unix.c:386: error: 'FC_OUTLINE' undeclared (first use i=
n this function)
>         ./base/gp_unix.c:392: warning: implicit declaration of function '=
FcPatternGetInteger'
>         ./base/gp_unix.c:392: error: 'FC_SLANT' undeclared (first use in =
this function)
>         ./base/gp_unix.c:398: error: 'FC_WEIGHT' undeclared (first use in=
 this function)
>         ./base/gp_unix.c:408: error: 'unix_fontenum_t' has no member name=
d 'name'
>         ./base/gp_unix.c:408: error: 'unix_fontenum_t' has no member name=
d 'name'
>         ./base/gp_unix.c:409: error: 'unix_fontenum_t' has no member name=
d 'name'
>         ./base/gp_unix.c: In function 'gp_enumerate_fonts_free':
>         ./base/gp_unix.c:426: error: 'unix_fontenum_t' has no member name=
d 'font_list'
>         ./base/gp_unix.c:427: warning: implicit declaration of function '=
FcFontSetDestroy'
>         ./base/gp_unix.c:427: error: 'unix_fontenum_t' has no member name=
d 'font_list'
>         make: *** [obj/gp_unix.o] Error 1
>=20
> The header files are there
>=20
>         $ find . -name 'fontconfig.h'
>         ./angstrom-dev/sysroots/i686-linux/usr/include/fontconfig/fontcon=
fig.h
>         ./angstrom-dev/sysroots/armv7a-angstrom-linux-gnueabi/usr/include=
/fontconfig/fontconfig.h
>=20
> and
>=20
>         bitbake fontconfig-native
>=20
> beforehand does not help either. So I guess somehow the include flags
> are not passed correctly and indeed the `gcc` call does not have any
> `-I` option.
>=20
> Any idea on how to fix this most elegantly?

The main problem seems to be that in `do_configure_prepend()` `make` is
called and not `oe_runmake` and therefore the correct paths are not set.

I have two problems with this commit though.

1. According to the build logs from Steve [2][3] this recipe fails for
him with the same error message.
2. The recipe of `gs_8.64` was improved beforehand [4] and the above
mentioned problem fixed (it still does not work though). Why was the new
version not based on the old one?


Thanks,

Paul


> [1] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3D49a0b=
abada7f58fc583d299cfc16c22fc3e42fc2
[2] http://build.sakoman.com/packages/11697/
[3] http://build.sakoman.com/public/logs/task/82709.txt
[4] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3D74d7b8e=
7a0c52178a8a111415586eb15d802a88b

--=-QgfsMxo8VN+4T0X7X1ro
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk3SMkUACgkQPX1aK2wOHVhg5gCfTb7FDl7oGLgaVvs1BHz0zVRm
gsgAnRYkZo/XLUzLPyz3GiIaZtXdYMka
=LNMb
-----END PGP SIGNATURE-----

--=-QgfsMxo8VN+4T0X7X1ro--
