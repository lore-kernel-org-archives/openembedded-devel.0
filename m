Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <thebohemian@gmx.net>) id 1PwVcH-0001lp-JW
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Mar 2011 09:16:33 +0100
Received: (qmail invoked by alias); 07 Mar 2011 08:14:57 -0000
Received: from 168.163.71-86.rev.gaoland.net (EHLO [192.168.42.71])
	[86.71.163.168]
	by mail.gmx.net (mp016) with SMTP; 07 Mar 2011 09:14:57 +0100
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX1+eXxEYlIiey9gOutBCropXBLwYGXFo57jlrpI4uk
	iT4Ez4mSH68Lvk
Message-ID: <4D7493FB.2040906@gmx.net>
Date: Mon, 07 Mar 2011 09:14:51 +0100
From: Robert Schuster <thebohemian@gmx.net>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.14) Gecko/20110223 Thunderbird/3.1.8
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Enigmail-Version: 1.1.2
X-Y-GMX-Trusted: 0
Subject: openssl-native 1.0.0d fails to build
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
X-List-Received-Date: Mon, 07 Mar 2011 08:16:33 -0000
X-Groupsio-MsgNum: 29948
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enigD3D1B4BDA74BA235EF093D33"

--------------enigD3D1B4BDA74BA235EF093D33
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable

Hi,
I'm building angstrom-2010.x for omapp4430-panda on an amd64 box running
Ubunutu 10.04. While building the console-image it gets to the point
where openssl-native has to be compiled and there is see strange errors.
do_configure completes without error but the log.do_configure looks like
this:

Configuring for linux-x86_64
    no-gmp          [default]  OPENSSL_NO_GMP (skip dir)
    no-jpake        [experimental] OPENSSL_NO_JPAKE (skip dir)
    no-krb5         [krb5-flavor not specified] OPENSSL_NO_KRB5
    no-md2          [default]  OPENSSL_NO_MD2 (skip dir)
    no-rc5          [default]  OPENSSL_NO_RC5 (skip dir)
    no-rfc3779      [default]  OPENSSL_NO_RFC3779 (skip dir)
    no-store        [experimental] OPENSSL_NO_STORE (skip dir)
    no-zlib         [default]
    no-zlib-dynamic [default]
IsMK1MF=3D0
CC            =3Dgcc
CFLAG         =3D-fPIC -DOPENSSL_PIC -DOPENSSL_THREADS -D_REENTRANT
-DDSO_DLFCN -DHAVE_DLFCN_H -DL_ENDIAN 	-DTERMIO   -Wall
-Wa,--noexecstack -DOPENSSL_IA32_SSE2 -DOPENSSL_BN_ASM_MONT -DSHA1_ASM
-DSHA256_ASM -DSHA512_ASM -DMD5_ASM -DAES_ASM -DWHIRLPOOL_ASM
EX_LIBS       =3D-ldl
CPUID_OBJ     =3Dx86_64cpuid.o
BN_ASM        =3Dx86_64-gcc.o x86_64-mont.o
DES_ENC       =3Ddes_enc.o fcrypt_b.o
AES_ENC       =3Daes-x86_64.o
BF_ENC        =3Dbf_enc.o
CAST_ENC      =3Dc_enc.o
RC4_ENC       =3Drc4-x86_64.o
RC5_ENC       =3Drc5_enc.o
MD5_OBJ_ASM   =3Dmd5-x86_64.o
SHA1_OBJ_ASM  =3Dsha1-x86_64.o sha256-x86_64.o sha512-x86_64.o
RMD160_OBJ_ASM=3D
CMLL_ENC=3D     =3Dcmll-x86_64.o cmll_misc.o
PROCESSOR     =3D
RANLIB        =3Dranlib
ARFLAGS       =3D
PERL          =3D/home/rschus/oe/panda/tmp/sysroots/x86_64-linux/usr/bin/=
perl
SIXTY_FOUR_BIT_LONG mode
DES_UNROLL used
DES_INT used
RC4_CHUNK is unsigned long
Makefile is older than Makefile.org, Configure or config.
Reconfigure the source tree (via './config' or 'perl Configure'), please.=

make: *** [Makefile] Error 1

Since the error at the end does not show up in bitbake the build
continues (=3D it goes into do_compile). However the compilation stops
immediately and the log only contains this output:

NOTE: make -e MAKEFLAGS=3D
Makefile is older than Makefile.org, Configure or config.
Reconfigure the source tree (via './config' or 'perl Configure'), please.=

make: *** [Makefile] Error 1
FATAL: oe_runmake failed
ERROR: Function do_compile failed

Manual workaround is to go into the workdir and run 'touch Makefile'.
After that the build continues just fine.

I did not investigate the problem further yet but would do so if nobody
has an idea of what the problem in the recipe might be. Does this
problem occur on other's machines too?

Regards,
Robert


--------------enigD3D1B4BDA74BA235EF093D33
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAk10k/4ACgkQG9cfwmwwEtqoQgCgnQpcTetmOMe4Mh61jveYuSID
oscAn0vdVR2TiT3/+rCllbEBStZ5qg6A
=C9J8
-----END PGP SIGNATURE-----

--------------enigD3D1B4BDA74BA235EF093D33--
