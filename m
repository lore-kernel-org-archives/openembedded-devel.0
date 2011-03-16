Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PzuPN-0004GU-T7 for openembedded-devel@lists.openembedded.org;
	Wed, 16 Mar 2011 18:21:17 +0100
Received: from f053032013.adsl.alicedsl.de ([78.53.32.13]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1PzuNk-0003I0-K7 for openembedded-devel@lists.openembedded.org;
	Wed, 16 Mar 2011 17:19:36 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4D80EA9E.5080207@gmail.com>
References: <1300264546.3840.9.camel@mattotaupa>
	<4D80791E.2040803@gmail.com> <1300265560.3840.10.camel@mattotaupa>
	<4D80EA9E.5080207@gmail.com>
Date: Wed, 16 Mar 2011 18:19:35 +0100
Message-ID: <1300295975.3840.88.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: Re: minimal-uclibc: gnutls-2.10.4-r11.0: task compile fails with `make[4]: *** [coding.lo] Error 1`
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
X-List-Received-Date: Wed, 16 Mar 2011 17:21:18 -0000
X-Groupsio-MsgNum: 30285
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-g7CxlmSOBuMcgBNIgAeT"

--=-g7CxlmSOBuMcgBNIgAeT
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Mittwoch, den 16.03.2011, 09:51 -0700 schrieb Khem Raj:
> On 3/16/2011 1:52 AM, Paul Menzel wrote:
> > Am Mittwoch, den 16.03.2011, 01:47 -0700 schrieb Khem Raj:
> >> On 3/16/2011 1:35 AM, Paul Menzel wrote:
> >>> Dear OE folks,
> >>>
> >>>
> >>> using the following configuration
> >>>
> >>>           Build Configuration:
> >>>           BB_VERSION        =3D "1.12.0"
> >>>           METADATA_BRANCH   =3D "<unknown>"
> >>>           METADATA_REVISION =3D "f621e5e"
> >>>           TARGET_ARCH       =3D "arm"
> >>>           TARGET_OS         =3D "linux-uclibceabi"
> >>>           MACHINE           =3D "beagleboard"
> >>>           DISTRO            =3D "minimal-uclibc"
> >>>           DISTRO_VERSION    =3D "dev-snapshot-20110316"
> >>>           TARGET_FPU        =3D "soft"
> >>>
> >>> task compile of `gnutls_2.10.4.bb` fails with the following error.
> >>>
> >>>           arm-oe-linux-uclibceabi-libtool: compile:  arm-oe-linux-ucl=
ibceabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3D=
softfp -mthumb-interwork -mno-thumb --sysroot=3D/oe/build-minimal-uclibc/mi=
nimal-uclibc-dev/sysroots/armv7a-oe-linux-uclibceabi -DHAVE_CONFIG_H -I. -I=
.. -DASN1_BUILDING -I./../gl -I./../gl -I./.. -fexpensive-optimizations -fo=
mit-frame-pointer -frename-registers -Os -pipe -g -MT element.lo -MD -MP -M=
F .deps/element.Tpo -c element.c  -fPIC -DPIC -o .libs/element.o
> >>>           mv -f .deps/parser_aux.Tpo .deps/parser_aux.Plo
> >>>           /bin/sh ../arm-oe-linux-uclibceabi-libtool --tag=3DCC   --m=
ode=3Dcompile arm-oe-linux-uclibceabi-gcc -march=3Darmv7-a -mtune=3Dcortex-=
a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=
=3D/oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-ucl=
ibceabi -DHAVE_CONFIG_H -I. -I..  -DASN1_BUILDING -I./../gl -I./../gl -I./.=
.   -fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os -=
pipe -g -MT coding.lo -MD -MP -MF .deps/coding.Tpo -c -o coding.lo coding.c
> >>>           arm-oe-linux-uclibceabi-libtool: compile:  arm-oe-linux-ucl=
ibceabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3D=
softfp -mthumb-interwork -mno-thumb --sysroot=3D/oe/build-minimal-uclibc/mi=
nimal-uclibc-dev/sysroots/armv7a-oe-linux-uclibceabi -DHAVE_CONFIG_H -I. -I=
.. -DASN1_BUILDING -I./../gl -I./../gl -I./.. -fexpensive-optimizations -fo=
mit-frame-pointer -frename-registers -Os -pipe -g -MT coding.lo -MD -MP -MF=
 .deps/coding.Tpo -c coding.c  -fPIC -DPIC -o .libs/coding.o
> >>>           arm-oe-linux-uclibceabi-libtool: compile:  arm-oe-linux-ucl=
ibceabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3D=
softfp -mthumb-interwork -mno-thumb --sysroot=3D/oe/build-minimal-uclibc/mi=
nimal-uclibc-dev/sysroots/armv7a-oe-linux-uclibceabi -DHAVE_CONFIG_H -I. -I=
.. -DASN1_BUILDING -I./../gl -I./../gl -I./.. -fexpensive-optimizations -fo=
mit-frame-pointer -frename-registers -Os -pipe -g -MT element.lo -MD -MP -M=
F .deps/element.Tpo -c element.c -o element.o>/dev/null 2>&1
> >>>           arm-oe-linux-uclibceabi-libtool: compile:  arm-oe-linux-ucl=
ibceabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3D=
softfp -mthumb-interwork -mno-thumb --sysroot=3D/oe/build-minimal-uclibc/mi=
nimal-uclibc-dev/sysroots/armv7a-oe-linux-uclibceabi -DHAVE_CONFIG_H -I. -I=
.. -DASN1_BUILDING -I./../gl -I./../gl -I./.. -fexpensive-optimizations -fo=
mit-frame-pointer -frename-registers -Os -pipe -g -MT structure.lo -MD -MP =
-MF .deps/structure.Tpo -c structure.c -o structure.o>/dev/null 2>&1
> >>>           arm-oe-linux-uclibceabi-libtool: compile:  arm-oe-linux-ucl=
ibceabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3D=
softfp -mthumb-interwork -mno-thumb --sysroot=3D/oe/build-minimal-uclibc/mi=
nimal-uclibc-dev/sysroots/armv7a-oe-linux-uclibceabi -DHAVE_CONFIG_H -I. -I=
.. -DASN1_BUILDING -I./../gl -I./../gl -I./.. -fexpensive-optimizations -fo=
mit-frame-pointer -frename-registers -Os -pipe -g -MT coding.lo -MD -MP -MF=
 .deps/coding.Tpo -c coding.c -o coding.o>/dev/null 2>&1
> >>>           mv -f .deps/element.Tpo .deps/element.Plo
> >>>           /bin/sh ../arm-oe-linux-uclibceabi-libtool --tag=3DCC   --m=
ode=3Dcompile arm-oe-linux-uclibceabi-gcc -march=3Darmv7-a -mtune=3Dcortex-=
a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=
=3D/oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-ucl=
ibceabi -DHAVE_CONFIG_H -I. -I..  -DASN1_BUILDING -I./../gl -I./../gl -I./.=
.   -fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os -=
pipe -g -MT version.lo -MD -MP -MF .deps/version.Tpo -c -o version.lo versi=
on.c
> >>>           arm-oe-linux-uclibceabi-libtool: compile:  arm-oe-linux-ucl=
ibceabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3D=
softfp -mthumb-interwork -mno-thumb --sysroot=3D/oe/build-minimal-uclibc/mi=
nimal-uclibc-dev/sysroots/armv7a-oe-linux-uclibceabi -DHAVE_CONFIG_H -I. -I=
.. -DASN1_BUILDING -I./../gl -I./../gl -I./.. -fexpensive-optimizations -fo=
mit-frame-pointer -frename-registers -Os -pipe -g -MT version.lo -MD -MP -M=
F .deps/version.Tpo -c version.c  -fPIC -DPIC -o .libs/version.o
> >>>           make[4]: *** [coding.lo] Error 1
> >>>
> >>> I guess this has to do with the following commit [1], since it builds
> >>> fine using `minimal` using EGLIBC.
> >>>
> >>>           commit f3ef166dca255f2e8518bb03655332273b1ef074
> >>>           Author: Khem Raj<raj.khem@gmail.com>
> >>>           Date:   Mon Mar 14 22:47:46 2011 -0700
> >>>
> >>>               uclibc_git: Upgrade to latest 0.9.32 snapshot
> >>>
> >>>               Signed-off-by: Khem Raj<raj.khem@gmail.com>
> >>>
> >>
> >> and where/what is the error message ? what you posted does not help
> >
> > I am sorry. But I could not find an error message anywhere in
> > `log.do_compile`. Please find the log file attached.
>=20
> there is no explicit error mentioned in log.do_compile too. It could be=
=20
> a gcc ICE thats somehow being consumed by libtool. Can you execute
>=20
>=20
> /bin/sh ../arm-oe-linux-uclibceabi-libtool --tag=3DCC   --mode=3Dcompile=
=20
> arm-oe-linux-uclibceabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dn=
eon=20
> -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb=20
> --sysroot=3D/oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-o=
e-linux-uclibceabi=20
> -DHAVE_CONFIG_H -I. -I..  -DASN1_BUILDING -I./../gl -I./../gl -I./..=20
> -fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os=20
> -pipe -g -MT decoding.lo -MD -MP -MF .deps/decoding.Tpo -c -o=20
> decoding.lo decoding.c
>=20
>=20
> inside this directory
> /oe/build-minimal-uclibc/minimal-uclibc-dev/work/armv7a-oe-linux-uclibcea=
bi/gnutls-2.10.4-r11.0/gnutls-2.10.4/lib/minitasn1

Thanks. I already did that and pasted the output in the reply to Phil
[1]. It looks like mail delivery is pretty slow for some messages in the
past few days.


Thanks,

Paul


[1] http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-March/0310=
06.html

--=-g7CxlmSOBuMcgBNIgAeT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk2A8ScACgkQPX1aK2wOHVg7mgCeOORUqlV4KDLQjfuGnF+mwfJ8
M6oAniNOcQ+oiOvNbBY7tqrFmXqPgIP7
=dy25
-----END PGP SIGNATURE-----

--=-g7CxlmSOBuMcgBNIgAeT--
