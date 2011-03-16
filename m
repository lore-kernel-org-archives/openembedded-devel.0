Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Pzqy9-0000Ua-KR for openembedded-devel@lists.openembedded.org;
	Wed, 16 Mar 2011 14:40:57 +0100
Received: from f053032013.adsl.alicedsl.de ([78.53.32.13]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1PzqwW-000227-PF for openembedded-devel@lists.openembedded.org;
	Wed, 16 Mar 2011 13:39:16 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1300269370.2132.13010.camel@phil-desktop>
References: <1300264546.3840.9.camel@mattotaupa>
	<4D80791E.2040803@gmail.com>  <1300265560.3840.10.camel@mattotaupa>
	<1300269370.2132.13010.camel@phil-desktop>
Date: Wed, 16 Mar 2011 14:39:15 +0100
Message-ID: <1300282755.3840.69.camel@mattotaupa>
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
X-List-Received-Date: Wed, 16 Mar 2011 13:40:57 -0000
X-Groupsio-MsgNum: 30267
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-KNPpZhUTGchdc6dldXhh"

--=-KNPpZhUTGchdc6dldXhh
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Mittwoch, den 16.03.2011, 09:56 +0000 schrieb Phil Blundell:
> On Wed, 2011-03-16 at 09:52 +0100, Paul Menzel wrote:
> > I am sorry. But I could not find an error message anywhere in
> > `log.do_compile`. Please find the log file attached.
>=20
> One of libtool's less endearing features is that it runs the compiler
> for shared objects with errors directed to /dev/null.  I guess this is
> to avoid getting repeated warnings for objects that are compiled both
> shared and nonshared, but it does make it more tedious to debug this
> kind of crash.

Thank you for the explanation and the following advise.

> Anyway, the line in question is this one from your log file:
>=20
> arm-oe-linux-uclibceabi-libtool: compile:  arm-oe-linux-uclibceabi-gcc -m=
arch=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb=
-interwork -mno-thumb --sysroot=3D/oe/build-minimal-uclibc/minimal-uclibc-d=
ev/sysroots/armv7a-oe-linux-uclibceabi -DHAVE_CONFIG_H -I. -I.. -DASN1_BUIL=
DING -I./../gl -I./../gl -I./.. -fexpensive-optimizations -fomit-frame-poin=
ter -frename-registers -Os -pipe -g -MT coding.lo -MD -MP -MF .deps/coding.=
Tpo -c coding.c -o coding.o >/dev/null 2>&1
>=20
> If you run that compile command manually with the ">/dev/null 2>&1" bit
> removed then you should be able to see the errors.  Given that it's
> apparently happening only with -fPIC enabled I would suspect that it's
> an ice of some kind, rather than being uclibc's fault directly, but once
> we have the error message it should be fairly obvious what's gone wrong.

        arm-oe-linux-uclibceabi-gcc -march=3Darmv7-a -mtune=3Dcortex-a8 -mf=
pu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb --sysroot=3D/oe=
/build-minimal-uclibc/minimal-uclibc-dev/sysroots/armv7a-oe-linux-uclibceab=
i -DHAVE_CONFIG_H -I. -I.. -DASN1_BUILDING -I./../gl -I./../gl -I./.. -fexp=
ensive-optimizations -fomit-frame-pointer -frename-registers -Os -pipe -g -=
MT coding.lo -MD -MP -MF .deps/coding.Tpo -c coding.c -o coding.o
        coding.c: In function 'asn1_length_der':
        coding.c:101:1: internal compiler error: in dwarf2out_frame_debug_e=
xpr, at dwarf2out.c:2221
        Please submit a full bug report,
        with preprocessed source if appropriate.
        See <http://gcc.gnu.org/bugs.html> for instructions.
        {standard input}: Assembler messages:

I am wondering if the latest GCC 4.5 changes are causing this, but as
always this is just an uneducated guess.

        commit 21ce5641f8c993aefeefd8febd210f41dbf1d442
        Author: Khem Raj <raj.khem@gmail.com>
        Date:   Fri Mar 11 15:47:23 2011 -0800
       =20
            gcc-4.5: Fix ICE on i586
           =20
            Upgrade to latest svnrev
            Get new linaro patches
            Delete patches that are not applied
           =20
            Signed-off-by: Khem Raj <raj.khem@gmail.com>
            Tested-by: Yuri Bushmelev <jay4mail@gmail.com>

Searching for the error message just returned a bug report for GCC 3.4 [1].


Thanks,

Paul


[1] http://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D10695

--=-KNPpZhUTGchdc6dldXhh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk2AvYMACgkQPX1aK2wOHVj3wgCgi+w/FG6PiaGKpKfc2TvsPoU7
8wMAnjAwn5JkOTwxwRQ6/uTFaZRiB/e9
=4Tah
-----END PGP SIGNATURE-----

--=-KNPpZhUTGchdc6dldXhh--
