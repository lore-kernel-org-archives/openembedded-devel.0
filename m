Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QWpMS-00065w-7E for openembedded-devel@lists.openembedded.org;
	Wed, 15 Jun 2011 14:38:20 +0200
Received: from f053045092.adsl.alicedsl.de ([78.53.45.92]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QWpKE-0003G3-8O for openembedded-devel@lists.openembedded.org;
	Wed, 15 Jun 2011 12:36:02 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1308101171-20619-1-git-send-email-james@digitalmatter.com.au>
References: <1308101171-20619-1-git-send-email-james@digitalmatter.com.au>
Date: Wed, 15 Jun 2011 14:23:05 +0200
Message-ID: <1308140585.4304.20.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [PATCH] elfutils: Added recipe for elfutils-0.148 from oe-core.
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
X-List-Received-Date: Wed, 15 Jun 2011 12:38:20 -0000
X-Groupsio-MsgNum: 32689
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-xv5W5HtRQWOz7DLNZ4lB"

--=-xv5W5HtRQWOz7DLNZ4lB
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Mittwoch, den 15.06.2011, 09:26 +0800 schrieb James Limbouris:

=C2=BBelfutils: Add version 0.148 from oe-core=C2=AB would be good enough f=
or the
commit summary.

> This resolves a build issue with 0.143 in which strip.c
> uses stat64 without an appropriate header.
>=20
> Signed-off-by: James Limbouris <james@digitalmatter.com.au>
> ---
>  recipes/elfutils/elfutils-0.148/arm_backend.diff   |  449 +++++
>  recipes/elfutils/elfutils-0.148/do-autoreconf.diff |  339 ++++
>  recipes/elfutils/elfutils-0.148/elf_additions.diff |   71 +
>  .../elfutils/elfutils-0.148/elfutils-fsize.patch   |   39 +
>  recipes/elfutils/elfutils-0.148/hppa_backend.diff  |  801 +++++++++
>  recipes/elfutils/elfutils-0.148/i386_dis.h         | 1657 ++++++++++++++=
+++++
>  recipes/elfutils/elfutils-0.148/m68k_backend.diff  |  309 ++++
>  recipes/elfutils/elfutils-0.148/mempcpy.patch      |   25 +
>  recipes/elfutils/elfutils-0.148/mips_backend.diff  |  713 ++++++++
>  .../elfutils-0.148/redhat-portability.diff         | 1124 +++++++++++++
>  .../elfutils/elfutils-0.148/redhat-robustify.diff  | 1709 ++++++++++++++=
++++++
>  .../elfutils/elfutils-0.148/remove-unused.patch    |  154 ++
>  .../elfutils-0.148/testsuite-ignore-elflint.diff   |   21 +
>  .../elfutils/elfutils-0.148/uclibc-support.patch   |   91 ++
>  recipes/elfutils/elfutils-0.148/x86_64_dis.h       | 1632 ++++++++++++++=
+++++
>  recipes/elfutils/elfutils_0.148.bb                 |   61 +
>  16 files changed, 9195 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/elfutils/elfutils-0.148/arm_backend.diff
>  create mode 100644 recipes/elfutils/elfutils-0.148/do-autoreconf.diff
>  create mode 100644 recipes/elfutils/elfutils-0.148/elf_additions.diff
>  create mode 100644 recipes/elfutils/elfutils-0.148/elfutils-fsize.patch
>  create mode 100644 recipes/elfutils/elfutils-0.148/hppa_backend.diff
>  create mode 100644 recipes/elfutils/elfutils-0.148/i386_dis.h
>  create mode 100644 recipes/elfutils/elfutils-0.148/m68k_backend.diff
>  create mode 100644 recipes/elfutils/elfutils-0.148/mempcpy.patch
>  create mode 100644 recipes/elfutils/elfutils-0.148/mips_backend.diff
>  create mode 100644 recipes/elfutils/elfutils-0.148/redhat-portability.di=
ff
>  create mode 100644 recipes/elfutils/elfutils-0.148/redhat-robustify.diff
>  create mode 100644 recipes/elfutils/elfutils-0.148/remove-unused.patch
>  create mode 100644 recipes/elfutils/elfutils-0.148/testsuite-ignore-elfl=
int.diff
>  create mode 100644 recipes/elfutils/elfutils-0.148/uclibc-support.patch
>  create mode 100644 recipes/elfutils/elfutils-0.148/x86_64_dis.h
>  create mode 100644 recipes/elfutils/elfutils_0.148.bb

[=E2=80=A6]

> diff --git a/recipes/elfutils/elfutils_0.148.bb b/recipes/elfutils/elfuti=
ls_0.148.bb
> new file mode 100644
> index 0000000..c7ae6d5
> --- /dev/null
> +++ b/recipes/elfutils/elfutils_0.148.bb
> @@ -0,0 +1,61 @@
> +DESCRIPTION =3D "A collection of utilities and DSOs to handle compiled o=
bjects."
> +HOMEPAGE =3D "https://fedorahosted.org/elfutils"
> +SECTION =3D "base"
> +LICENSE =3D "OSL"
> +DEPENDS =3D "libtool bzip2 zlib"
> +
> +PR =3D "r2"

Since it is new in OE.dev it should start with r0.

> +
> +SRC_URI =3D "https://fedorahosted.org/releases/e/l/elfutils/elfutils-${P=
V}.tar.bz2"
> +
> +SRC_URI[md5sum] =3D "a0bed1130135f17ad27533b0034dba8d"
> +SRC_URI[sha256sum] =3D "8aebfa4a745db21cf5429c9541fe482729b62efc7e53e911=
0151b4169fe887da"
> +
> +# pick the patch from debian
> +# http://ftp.de.debian.org/debian/pool/main/e/elfutils/elfutils_0.148-1.=
debian.tar.gz

Remove the commented lines?

> +
> +SRC_URI +=3D "\
> +        file://redhat-portability.diff \
> +        file://redhat-robustify.diff \
> +        file://hppa_backend.diff \
> +        file://arm_backend.diff \
> +        file://mips_backend.diff \
> +        file://m68k_backend.diff \
> +        file://do-autoreconf.diff \
> +        file://testsuite-ignore-elflint.diff \
> +        file://elf_additions.diff \
> +	file://elfutils-fsize.patch \
> +	file://remove-unused.patch \
> +	file://mempcpy.patch \
> +"
> +
> +# The buildsystem wants to generate 2 .h files from source using a binar=
y it just built,
> +# which can not pass the cross compiling, so let's work around it by add=
ing 2 .h files
> +# along with the do_configure_prepend()
> +
> +SRC_URI +=3D "\
> +        file://i386_dis.h \
> +        file://x86_64_dis.h \
> +"
> +inherit autotools gettext
> +
> +do_configure_prepend() {
> +	sed -i 's:./i386_gendis:echo\ \#:g' ${S}/libcpu/Makefile.am
> +
> +	cp ${WORKDIR}/*dis.h ${S}/libcpu
> +}
> +
> +# Package utilities separately
> +PACKAGES =3D+ "${PN}-binutils"
> +FILES_${PN}-binutils =3D "\
> +    ${bindir}/eu-addr2line \
> +    ${bindir}/eu-ld \
> +    ${bindir}/eu-nm \
> +    ${bindir}/eu-readelf \
> +    ${bindir}/eu-size \
> +    ${bindir}/eu-strip"
> +# Fix library issues
> +FILES_${PN} =3D+ "${libdir}/*-${PV}.so"
> +
> +# The elfutils package contains symlinks that trip up insane
> +INSANE_SKIP_elfutils =3D "1"

Task compile is (still) failing for me using `minimal` for `MACHINE =3D
"beagleboard"`.

        arm-oe-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/oe/b=
uild-minimal-eglibc/minimal-dev/sysroots/armv7a-oe-linux-gnueabi -D_GNU_SOU=
RCE -DHAVE_CONFIG_H -DLOCALEDIR=3D'"/usr/share/locale"' -I. -I.. -I. -I. -I=
../lib -I..   -std=3Dgnu99 -Wall -Wshadow -Werror -Wunused -Wextra -fgnu89-=
inline -Wformat=3D2    -fexpensive-optimizations -fomit-frame-pointer -fren=
ame-registers -Os -g -MT elf_getbase.o -MD -MP -MF .deps/elf_getbase.Tpo -c=
 -o elf_getbase.o elf_getbase.c
        mv -f .deps/elf_end.Tpo .deps/elf_end.Po
        arm-oe-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/oe/b=
uild-minimal-eglibc/minimal-dev/sysroots/armv7a-oe-linux-gnueabi -D_GNU_SOU=
RERROR: Function 'do_compile' failed (see /oe/build-minimal-eglibc/minimal-=
dev/work/armv7a-oe-linux-gnueabi/elfutils-0.148-r2/temp/log.do_compile.2160=
4 for further information)
        CE -DHAVE_CONFIG_H -DLOCALEDIR=3D'"/usr/share/locale"' -I. -I.. -I.=
 -I. -I../lib -I..   -std=3Dgnu99 -Wall -Wshadow -Werror -Wunused -Wextra -=
fgnu89-inline -Wformat=3D2    -fexpensive-optimizations -fomit-frame-pointe=
r -frename-registers -Os -g -MT elf_getident.o -MD -MP -MF .deps/elf_getide=
nt.Tpo -c -o elf_getident.o elf_getident.c
        mv -f .deps/gelf_getclass.Tpo .deps/gelf_getclass.Po
        arm-oe-linux-gnueabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=
=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/oe/b=
uild-minimal-eglibc/minimal-dev/sysroot/minimal-dev/sysroots/armv7a-oe-linu=
x-gnueabi -D_GNU_SOURCE -DHAVE_CONFIG_H -DLOCALEDIR=3D'"/usr/share/locale"'=
 -I. -I.. -I. -I. -I../lib -I..   -std=3Dgnu99 -Wall -Wshadow -Werror -Wunu=
sed -Wextra -fgnu89-inline -Wformat=3D2    -fexpensive-optimizations -fomit=
-frame-pointer -frename-registers -Os -g -MT elf32_fsize.o -MD -MP -MF .dep=
s/elf32_fsize.Tpo -c -o elf32_fsize.o elf32_fsize.c
        elf_getbase.c:62:1: error: conflicting types for 'elf_getbase'
        ./libelf.h:207:15: note: previous declaration of 'elf_getbase' was =
here
        make[2]: *** [elf_getbase.o] Error 1


Thanks,

Paul

--=-xv5W5HtRQWOz7DLNZ4lB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk34pCkACgkQPX1aK2wOHViNcwCeLqg07V7SNk1eTnUebnipHQEo
5BAAnjq6aAJDUQniw2GUAJClXuAV8ci+
=nG8z
-----END PGP SIGNATURE-----

--=-xv5W5HtRQWOz7DLNZ4lB--
