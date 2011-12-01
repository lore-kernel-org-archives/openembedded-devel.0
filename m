Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RVujQ-0006Dp-6l
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Dec 2011 01:42:32 +0100
Received: by bkbzv15 with SMTP id zv15so943792bkb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Nov 2011 16:35:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=YCmKhaM1czzYV4u9gg7AU8gvgWseZ/Ya/QR4E0GMmh8=;
	b=PrE6Gm2/a8z//RGG0ddp46wb5ZMW42UOxoFRiRKU0I+E7J/yOWueaUPqZOR254VTyM
	b31KqwD0E5iHiueCBnRt2ko5z3q9UfUTS0p7YjeRldLzKbYMBNz0qdH+UpNY1dwmIZrj
	w8XSpAWrggWJpSUbGfRm2j2smi+2JLV8V40/g=
Received: by 10.204.199.132 with SMTP id es4mr4780450bkb.4.1322699746851;
	Wed, 30 Nov 2011 16:35:46 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id cc2sm7609310bkb.8.2011.11.30.16.35.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 30 Nov 2011 16:35:45 -0800 (PST)
Date: Thu, 1 Dec 2011 01:35:33 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20111201003533.GD29875@jama.jama.net>
References: <20111130143236.2A06010331@opal>
	<CA+chaQctkMN+3h6zjmjXxYMvH_bqqL8UXc7akAE=cx7hnxH+kg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+chaQctkMN+3h6zjmjXxYMvH_bqqL8UXc7akAE=cx7hnxH+kg@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [oe-commits] Koen Kooi : pixman: update to 0.24.0
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
X-List-Received-Date: Thu, 01 Dec 2011 00:42:32 -0000
X-Groupsio-MsgNum: 35772
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rqzD5py0kzyFAOWN"
Content-Disposition: inline

--rqzD5py0kzyFAOWN
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 01, 2011 at 12:18:54AM +0100, Martin Jansa wrote:
> On Wed, Nov 30, 2011 at 3:32 PM,  <git@git.openembedded.org> wrote:
> > Module: meta-openembedded.git
> > Branch: master
> > Commit: 80e3a0c42db89fa2716b0a839b8ef71d6d6349db
> > URL: =A0 =A0http://git.openembedded.org/?p=3Dmeta-openembedded.git&a=3D=
commit;h=3D80e3a0c42db89fa2716b0a839b8ef71d6d6349db
> >
> > Author: Koen Kooi <koen@dominion.thruhere.net>
> > Date: =A0 Wed Nov 30 15:27:26 2011 +0100
> >
> > pixman: update to 0.24.0
> >
> > * All patches that went upstream are removed
> >
> > Tested on beagleboard/angstrom
> >
> > Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> >
>=20
> FYI: this break my armv5t build, I'll try to test pixman-0.24.0 from
> oe-core or debug it tomorrow.
>=20
> | arm-oe-linux-gnueabi-libtool: link: arm-oe-linux-gnueabi-gcc
> -march=3Darmv5te -mthumb -mthumb-interwork -mtune=3Dxscale
> --sysroot=3D/OE/shr-core/tmp-eglibc/sysroo
> ts/spitz -O2 -pipe -g -feliminate-unused-debug-types -Wall
> -fno-strict-aliasing -fvisibility=3Dhidden -Wl,-O1 -Wl,--hash-style=3Dgnu
> -Wl,--as-needed -o .libs/pdf-op-test pdf-op-test.o  ./.libs/libutils.a
> ../pixman/.libs/libpixman-1.so
> /OE/shr-core/tmp-eglibc/sysroots/spitz/usr/lib/libpng12.so
> /OE/shr-core/tmp-eglibc/sysroots/spitz/usr/lib/libz.so -lm
> | ../pixman/.libs/libpixman-1.so: undefined reference to `__builtin_arm_w=
slldi'
> | ../pixman/.libs/libpixman-1.so: undefined reference to `__builtin_arm_w=
or'
> | ../pixman/.libs/libpixman-1.so: undefined reference to
> `__builtin_arm_wunpckilb'
> | ../pixman/.libs/libpixman-1.so: undefined reference to `__builtin_arm_w=
srldi'
> | ../pixman/.libs/libpixman-1.so: undefined reference to `__builtin_arm_w=
addbus'
> | ../pixman/.libs/libpixman-1.so: undefined reference to `__builtin_arm_w=
addhus'
> | ../pixman/.libs/libpixman-1.so: undefined reference to `__builtin_arm_w=
srlhi'
> | ../pixman/.libs/libpixman-1.so: undefined reference to `__builtin_arm_w=
xor'
> | ../pixman/.libs/libpixman-1.so: undefined reference to
> `__builtin_arm_wpackhus'
> | ../pixman/.libs/libpixman-1.so: undefined reference to `__builtin_arm_w=
and'
> | ../pixman/.libs/libpixman-1.so: undefined reference to
> `__builtin_arm_wunpckihb'
> | ../pixman/.libs/libpixman-1.so: undefined reference to `__builtin_arm_w=
zero'
> | ../pixman/.libs/libpixman-1.so: undefined reference to `__builtin_arm_w=
align'
> | ../pixman/.libs/libpixman-1.so: undefined reference to `__builtin_arm_w=
mulul'
> | collect2: ld returned 1 exit status
> | make[2]: *** [a1-trap-test] Error 1
>=20
> The same for region-test and pdf-op-test.

Failed the same also for armv4t.. so for now I've added --disable-arm-iwmmx=
t and replaced .bb=20
with smaller .bbappend:

FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${P}:"

DEPENDS +=3D "perl-native"
BBCLASSEXTEND =3D "native"

PRINC =3D "6"

SRC_URI +=3D " file://0008-Generic-C-implementation-of-pixman_blt-with-over=
lapp.patch"

NEON =3D " --disable-arm-neon "
NEON_armv7a =3D " "
NEON_armv7a-vfp-neon =3D " "

IWMMXT =3D " --disable-arm-iwmmxt "

EXTRA_OECONF +=3D "${NEON} ${IWMMXT}"

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--rqzD5py0kzyFAOWN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk7Wy9UACgkQN1Ujt2V2gBwF8QCeJuQLjfGJSHpNRR1+YK2Wqb7c
DRQAn3LrQHcSM4N6OFfmRXxdyX3uhm/E
=4Brt
-----END PGP SIGNATURE-----

--rqzD5py0kzyFAOWN--
