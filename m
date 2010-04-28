Received: from ns0.zlo.nu ([85.17.141.90] helo=mzh.zlo.nu)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcolz@zlo.nu>) id 1O76pP-0002QL-Oa
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Apr 2010 14:57:26 +0200
Received: by mzh.zlo.nu (Postfix, from userid 1000)
	id BD9B0140B0; Wed, 28 Apr 2010 14:53:42 +0200 (CEST)
Date: Wed, 28 Apr 2010 14:53:42 +0200
From: Marc Olzheim <zlo@zlo.nu>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100428125342.GA31214@zlo.nu>
References: <201003301706.14340.khimov@altell.ru>
	<1269954391-16666-1-git-send-email-khimov@altell.ru>
MIME-Version: 1.0
In-Reply-To: <1269954391-16666-1-git-send-email-khimov@altell.ru>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 85.17.141.90
X-SA-Exim-Mail-From: marcolz@zlo.nu
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
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
X-List-Received-Date: Wed, 28 Apr 2010 12:57:26 -0000
X-Groupsio-MsgNum: 18859
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+HP7ph2BbKc20aGI"
Content-Disposition: inline

--+HP7ph2BbKc20aGI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 30, 2010 at 05:06:31PM +0400, Roman I Khimov wrote:
=2E..
>  recipes/openssl/openssl-1.0.0/debian.patch         |  630 ++++++++++++++=
++++++
=2E..
>  create mode 100644 recipes/openssl/openssl-1.0.0/debian.patch
=2E..
> diff --git a/recipes/openssl/openssl-1.0.0/configure-targets.patch b/reci=
pes/openssl/openssl-1.0.0/configure-targets.patch
> new file mode 100644
> index 0000000..b68123a
> --- /dev/null
> +++ b/recipes/openssl/openssl-1.0.0/configure-targets.patch
> @@ -0,0 +1,24 @@
> +
> +The number of colons are important :)
> +

Note the comment. :-)

> diff --git a/recipes/openssl/openssl-1.0.0/debian.patch b/recipes/openssl=
/openssl-1.0.0/debian.patch
=2E..
> +Index: openssl-1.0.0/Configure
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- openssl-1.0.0.orig/Configure	Usage: date [OPTION]... [+FORMAT]
> +Display the current time in the given FORMAT.
> +
> +  -d, --date=3DSTRING         display time described by STRING, not `now'
> +  -f, --file=3DDATEFILE       like --date once for each line of DATEFILE
> +  -R, --rfc-822             output RFC-822 compliant date string
> +  -u, --utc, --universal    print or set Coordinated Universal Time
> +      --help                display this help and exit
> ++++ openssl-1.0.0/Configure	Usage: date [OPTION]... [+FORMAT]
> +Display the current time in the given FORMAT.
> +
> +  -d, --date=3DSTRING         display time described by STRING, not `now'
> +  -f, --file=3DDATEFILE       like --date once for each line of DATEFILE
> +  -R, --rfc-822             output RFC-822 compliant date string
> +  -u, --utc, --universal    print or set Coordinated Universal Time
> +      --help                display this help and exit
> +@@ -1,4 +1,4 @@
> +-:
> ++#!/usr/local/bin/perl
> + eval 'exec perl -S $0 ${1+"$@"}'
> +     if $running_under_some_shell;
> + ##
> +@@ -331,6 +331,47 @@
> + "osf1-alpha-cc",  "cc:-std1 -tune host -O4 -readonly_strings::(unknown)=
:::SIXTY_FOUR_BIT_LONG RC4_CHUNK:${alpha_asm}:dlfcn:alpha-osf1-shared:::.so=
",
> + "tru64-alpha-cc", "cc:-std1 -tune host -fast -readonly_strings::-pthrea=
d:::SIXTY_FOUR_BIT_LONG RC4_CHUNK:${alpha_asm}:dlfcn:alpha-osf1-shared::-ms=
ym:.so",
> +=20
> ++# Debian GNU/* (various architectures)
> ++"debian-alpha","gcc:-DTERMIO -O3 -Wa,--noexecstack -g -Wall::-D_REENTRA=
NT::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHUNK DES_RISC1 DES_UNROLL:${no_asm}:dlfcn=
:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
> ++"debian-alpha-ev4","gcc:-DTERMIO -O3 -Wa,--noexecstack -mcpu=3Dev4 -g -=
Wall::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHUNK DES_RISC1 DES_UNROLL=
:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
> ++"debian-alpha-ev5","gcc:-DTERMIO -O3 -Wa,--noexecstack -mcpu=3Dev5 -g -=
Wall::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHUNK DES_RISC1 DES_UNROLL=
:${no_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
> ++"debian-arm","gcc:-DL_ENDIAN -DTERMIO -O2 -Wa,--noexecstack -g -Wall::-=
D_REENTRANT::-ldl:BN_LLONG DES_RISC1::::::::::::dlfcn:linux-shared:-fPIC::.=
so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
> ++"debian-armeb","gcc:-DB_ENDIAN -DTERMIO -O2 -Wa,--noexecstack -g -Wall:=
:-D_REENTRANT::-ldl:BN_LLONG DES_RISC1::::::::::::dlfcn:linux-shared:-fPIC:=
:.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
> ++"debian-armel","gcc:-DL_ENDIAN -DTERMIO -O2 -Wa,--noexecstack -g -Wall:=
:-D_REENTRANT::-ldl:BN_LLONG DES_RISC1::::::::::::dlfcn:linux-shared:-fPIC:=
:.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
> ++#"debian-amd64","gcc:-DL_ENDIAN -DTERMIO -O3 -Wa,--noexecstack -fomit-f=
rame-pointer -Wall::-D_REENTRANT::-ldl:BN_LLONG ${x86_gcc_des} ${x86_gcc_op=
ts}::::::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR=
)",
> ++"debian-amd64", "gcc:-m64 -DL_ENDIAN -DTERMIO -O3 -Wa,--noexecstack -g =
-Wall -DMD32_REG_T=3Dint::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHUNK =
RC4_CHAR BF_PTR2 DES_INT DES_UNROLL:${x86_64_asm}:dlfcn:linux-shared:-fPIC:=
-m64:.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
> ++"debian-kfreebsd-amd64","gcc:-m64 -DL_ENDIAN -DTERMIOS -O3 -Wa,--noexec=
stack -Wall -DMD32_REG_T=3Dint::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC4_=
CHUNK BF_PTR2 DES_INT DES_UNROLL:${x86_64_asm}:dlfcn:linux-shared:-fPIC:-m6=
4:.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
> ++#"debian-freebsd-alpha","gcc:-DTERMIOS -O -Wa,--noexecstack -fomit-fram=
e-pointer::(unknown):::SIXTY_FOUR_BIT_LONG RC4_CHUNK DES_INT DES_PTR DES_RI=
SC2::::::::::dlfcn:bsd-gcc-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR=
)",
> ++"debian-kfreebsd-i386","gcc:-DL_ENDIAN -DTERMIOS -O3 -Wa,--noexecstack =
-g -m486 -Wall::-D_REENTRANT::-ldl:BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:=
${x86_elf_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR=
)",
> ++"debian-hppa","gcc:-DB_ENDIAN -DTERMIO -O2 -Wa,--noexecstack -g -Wall::=
-D_REENTRANT::-ldl:BN_LLONG MD2_CHAR RC4_INDEX::::::::::::dlfcn:linux-share=
d:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
> ++"debian-hurd-i386","gcc:-DL_ENDIAN -DTERMIOS -O3 -Wa,--noexecstack -g -=
m486 -Wall::-D_REENTRANT::-ldl:BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:${x8=
6_elf_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
> ++"debian-ia64","gcc:-DTERMIO -O3 -Wa,--noexecstack -g -Wall::-D_REENTRAN=
T::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHUNK RC4_CHAR:${ia64_asm}:dlfcn:linux-shar=
ed:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
> ++#"debian-i386","gcc:-DL_ENDIAN -DTERMIO -O3 -Wa,--noexecstack -fomit-fr=
ame-pointer -m486 -Wall::-D_REENTRANT::-ldl:BN_LLONG ${x86_gcc_des} ${x86_g=
cc_opts}::::::::::dlfcn:linux-shared:-fPIC",
> ++"debian-i386","gcc:-DL_ENDIAN -DTERMIO -O3 -Wa,--noexecstack -g -Wall::=
-D_REENTRANT::-ldl:BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}::::::::::::dlfcn=
:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
> ++"debian-i386-i486","gcc:-DL_ENDIAN 	-DTERMIO -fexpensive-optimizations =
-frename-registers -fomit-frame-pointer -O2 -ggdb3 -Wall::-D_REENTRANT::-ld=
l:BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:${x86_elf_asm}:dlfcn:linux-shared=
:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
> ++"debian-i386-i586","gcc:-DL_ENDIAN -DTERMIO -O3 -march=3Di586 -Wa,--noe=
xecstack -g -Wall::-D_REENTRANT::-ldl:BN_LLONG ${x86_gcc_des} ${x86_gcc_opt=
s}:${x86_elf_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MI=
NOR)",
> ++"debian-i386-i686/cmov","gcc:-DL_ENDIAN -DTERMIO -O3 -march=3Di686 -Wa,=
--noexecstack -g -Wall::-D_REENTRANT::-ldl:BN_LLONG ${x86_gcc_des} ${x86_gc=
c_opts}:${x86_elf_asm}:dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHL=
IB_MINOR)",
> ++"debian-m68k","gcc:-DB_ENDIAN -DTERMIO -O2 -Wa,--noexecstack -g -Wall::=
-D_REENTRANT::-ldl:BN_LLONG MD2_CHAR RC4_INDEX::::::::::::dlfcn:linux-share=
d:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
> ++"debian-mips",   "gcc:-DB_ENDIAN -DTERMIO -O3 -Wa,--noexecstack -g -Wal=
l::-D_REENTRANT::-ldl:BN_LLONG RC2_CHAR RC4_INDEX DES_INT DES_UNROLL DES_RI=
SC2::::::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR=
)",
> ++"debian-mipsel",   "gcc:-DL_ENDIAN -DTERMIO -O3 -Wa,--noexecstack -g -W=
all::-D_REENTRANT::-ldl:BN_LLONG RC2_CHAR RC4_INDEX DES_INT DES_UNROLL DES_=
RISC2::::::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MIN=
OR)",
> ++"debian-netbsd-i386",	"gcc:-DL_ENDIAN -DTERMIOS -O3 -Wa,--noexecstack -=
g -m486 -Wall::(unknown):::BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:::::::::=
:::dlfcn:bsd-gcc-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
> ++"debian-netbsd-m68k",	"gcc:-DB_ENDIAN -DTERMIOS -O3 -Wa,--noexecstack -=
g -Wall::(unknown):::BN_LLONG MD2_CHAR RC4_INDEX DES_UNROLL::::::::::::dlfc=
n:bsd-gcc-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
> ++"debian-netbsd-sparc",	"gcc:-DB_ENDIAN -DTERMIOS -O3 -Wa,--noexecstack =
-g -mv8 -Wall::(unknown):::BN_LLONG MD2_CHAR RC4_INDEX DES_UNROLL::::::::::=
::dlfcn:bsd-gcc-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
> ++"debian-openbsd-alpha","gcc:-DTERMIOS -O3 -Wa,--noexecstack -g::(unknow=
n):::SIXTY_FOUR_BIT_LONG DES_INT DES_PTR DES_RISC2::::::::::::dlfcn:bsd-gcc=
-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
> ++"debian-openbsd-i386",  "gcc:-DL_ENDIAN -DTERMIOS -O3 -Wa,--noexecstack=
 -g -m486::(unknown):::BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}::dlfcn:bsd-g=
cc-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
> ++"debian-openbsd-mips","gcc:-O2 -Wa,--noexecstack -g -DL_ENDIAN::(unknow=
n)::BN_LLONG MD2_CHAR RC4_INDEX RC4_CHAR DES_UNROLL DES_RISC2 DES_PTR BF_PT=
R:::::::::::::dlfcn:bsd-gcc-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINO=
R)",
> ++"debian-powerpc","gcc:-DB_ENDIAN -DTERMIO -O3 -Wa,--noexecstack -g -Wal=
l::-D_REENTRANT::-ldl:BN_LLONG DES_UNROLL DES_RISC2 DES_PTR MD2_CHAR RC4_IN=
DEX::linux_ppc32.o::::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\=
$(SHLIB_MINOR)",
> ++"debian-ppc64","gcc:-m64 -DB_ENDIAN -DTERMIO -O3 -Wa,--noexecstack -g -=
Wall::-D_REENTRANT::-ldl:SIXTY_FOUR_BIT_LONG RC4_CHAR RC4_CHUNK DES_RISC1 D=
ES_UNROLL::linux_ppc64.o::::::::::dlfcn:linux-shared:-fPIC:-m64:.so.\$(SHLI=
B_MAJOR).\$(SHLIB_MINOR)",
> ++"debian-s390","gcc:-DB_ENDIAN -DTERMIO -O3 -Wa,--noexecstack -g -Wall::=
-D_REENTRANT::-ldl:BN_LLONG::::::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHL=
IB_MAJOR).\$(SHLIB_MINOR)",=20
> ++"debian-sh3",   "gcc:-DL_ENDIAN -DTERMIO -O3 -Wa,--noexecstack -g -Wall=
::-D_REENTRANT::-ldl:BN_LLONG::::::::::::dlfcn:linux-shared:-fPIC::.so.\$(S=
HLIB_MAJOR).\$(SHLIB_MINOR)",
> ++"debian-sh4",   "gcc:-DL_ENDIAN -DTERMIO -O3 -Wa,--noexecstack -g -Wall=
::-D_REENTRANT::-ldl:BN_LLONG::::::::::::dlfcn:linux-shared:-fPIC::.so.\$(S=
HLIB_MAJOR).\$(SHLIB_MINOR)",
> ++"debian-sh3eb",   "gcc:-DB_ENDIAN -DTERMIO -O3 -Wa,--noexecstack -g -Wa=
ll::-D_REENTRANT::-ldl:BN_LLONG::::::::::::dlfcn:linux-shared:-fPIC::.so.\$=
(SHLIB_MAJOR).\$(SHLIB_MINOR)",
> ++"debian-sh4eb",   "gcc:-DB_ENDIAN -DTERMIO -O3 -Wa,--noexecstack -g -Wa=
ll::-D_REENTRANT::-ldl:BN_LLONG::::::::::::dlfcn:linux-shared:-fPIC::.so.\$=
(SHLIB_MAJOR).\$(SHLIB_MINOR)",
> ++"debian-m32r","gcc:-DB_ENDIAN -DTERMIO -O3 -Wa,--noexecstack -g -Wall::=
-D_REENTRANT::-ldl:BN_LLONG::::::::::::dlfcn:linux-shared:-fPIC::.so.\$(SHL=
IB_MAJOR).\$(SHLIB_MINOR)",
> ++"debian-sparc","gcc:-DB_ENDIAN -DTERMIO -O3 -Wa,--noexecstack -g -Wall:=
:-D_REENTRANT::-ldl:BN_LLONG RC4_CHAR RC4_CHUNK DES_UNROLL BF_PTR::::::::::=
::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
> ++"debian-sparc-v8","gcc:-DB_ENDIAN -DTERMIO -O3 -Wa,--noexecstack -mcpu=
=3Dv8 -g -Wall -DBN_DIV2W::-D_REENTRANT::-ldl:BN_LLONG RC4_CHAR RC4_CHUNK D=
ES_UNROLL BF_PTR::sparcv8.o:des_enc-sparc.o fcrypt_b.o:::::::::dlfcn:linux-=
shared:-fPIC::.so.\$(SHLIB_MAJOR).\$(SHLIB_MINOR)",
> ++"debian-sparc-v9","gcc:-DB_ENDIAN -DTERMIO -O3 -mcpu=3Dv9 -Wa,--noexecs=
tack -Wa,-Av8plus -g -Wall -DULTRASPARC -DBN_DIV2W::-D_REENTRANT::-ldl:BN_L=
LONG RC4_CHAR RC4_CHUNK DES_UNROLL BF_PTR::sparcv8plus.o:des_enc-sparc.o fc=
rypt_b.o:::md5-sparcv8plus.o::::::dlfcn:linux-shared:-fPIC::.so.\$(SHLIB_MA=
JOR).\$(SHLIB_MINOR)",
> ++
> + ####
> + #### Variety of LINUX:-)
> + ####
> +@@ -529,7 +570,7 @@
> + # Cygwin
> + "Cygwin-pre1.3", "gcc:-DTERMIOS -DL_ENDIAN -fomit-frame-pointer -O3 -m4=
86 -Wall::(unknown):CYGWIN32::BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:${no_=
asm}:win32",
> + "Cygwin", "gcc:-DTERMIOS -DL_ENDIAN -fomit-frame-pointer -O3 -march=3Di=
486 -Wall:::CYGWIN32::BN_LLONG ${x86_gcc_des} ${x86_gcc_opts}:${x86_asm}:co=
ff:dlfcn:cygwin-shared:-D_WINDLL:-shared:.dll.a",
> +-"debug-Cygwin", "gcc:-DTERMIOS -DL_ENDIAN -march=3Di486 -Wall -DBN_DEBU=
G -DREF_CHECK -DCONF_DEBUG -DBN_CTX_DEBUG -DCRYPTO_MDEBUG -DOPENSSL_NO_ASM =
-g -Wformat -Wshadow -Wmissing-prototypes -Wmissing-declarations -Werror:::=
CYGWIN32:::${no_asm}:dlfcn:cygwin-shared:-D_WINDLL:-shared:.dll.a",
> ++-"debug-Cygwin", "gcc:-DTERMIOS -DL_ENDIAN -march=3Di486 -Wall -DBN_DEB=
UG -DREF_CHECK -DCONF_DEBUG -DBN_CTX_DEBUG -DCRYPTO_MDEBUG -DOPENSSL_NO_ASM=
 -g -Wformat -Wshadow -Wmissing-prototypes -Wmissing-declarations -Werror::=
:CYGWIN32:::${no_asm}:dlfcn:cygwin-shared:-D_WINDLL:-shared:.dll.a",
> +=20
> + # NetWare from David Ward (dsward@novell.com)
> + # requires either MetroWerks NLM development tools, or gcc / nlmconv

[snip]

The number of fields in the config-string has gone up by 3 from
openssl-0.9.8g to 1.0.0, so the debian.patch is no longer correct,
resulting in build failures for my non-native mipsel build:
| make[4]: *** No rule to make target `link_a..so.1.0.0'.  Stop.

Another thing: I do not know how that patch is generated, but the
"usage" output of date does not look good to me in the patch. ;-)

Marc

--+HP7ph2BbKc20aGI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkvYL9YACgkQezjnobFOgrE0oACbBxf+gYyM63sFI9a4Ir6hevj8
OrUAniqPvHnS3z2Z9RZbZy6LdKzPniKw
=/Dap
-----END PGP SIGNATURE-----

--+HP7ph2BbKc20aGI--
