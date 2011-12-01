Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RW1vK-0003t8-DH
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Dec 2011 09:23:18 +0100
Received: by eaad13 with SMTP id d13so1838227eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Dec 2011 00:16:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=q3V0hn8D5mFZ9oVSQTHyMSiitrbok8MBzFDNK2l2C1w=;
	b=E3DMyXJnNMf7Uw2DYUBzks5QX5TKTCewaXPuj/lDnKA5ze9+geasS5VDiQZSUdQVM6
	3tY/RUXr+6tT5AUNvHmoVDL5uPzgkNF2NCaavxCw+YzhXsukmDhGJUWTruHMFydwKyPW
	qkQTkcuSpWpZlkMjWrxcgJFjNbWG4znvD9XHk=
Received: by 10.213.110.8 with SMTP id l8mr399962ebp.85.1322727396105;
	Thu, 01 Dec 2011 00:16:36 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id d6sm15000821eec.10.2011.12.01.00.16.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 01 Dec 2011 00:16:34 -0800 (PST)
Date: Thu, 1 Dec 2011 09:16:33 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20111201081633.GG29875@jama.jama.net>
References: <20111130143236.2A06010331@opal>
	<CA+chaQctkMN+3h6zjmjXxYMvH_bqqL8UXc7akAE=cx7hnxH+kg@mail.gmail.com>
	<20111201003533.GD29875@jama.jama.net>
	<jb7cun$3n6$1@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <jb7cun$3n6$1@dough.gmane.org>
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
X-List-Received-Date: Thu, 01 Dec 2011 08:23:18 -0000
X-Groupsio-MsgNum: 35776
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+1TulI7fc0PCHNy3"
Content-Disposition: inline

--+1TulI7fc0PCHNy3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 01, 2011 at 09:13:10AM +0100, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> Op 01-12-11 01:35, Martin Jansa schreef:
> > On Thu, Dec 01, 2011 at 12:18:54AM +0100, Martin Jansa wrote:
> >> On Wed, Nov 30, 2011 at 3:32 PM,  <git@git.openembedded.org> wrote:
> >>> Module: meta-openembedded.git Branch: master Commit:
> >>> 80e3a0c42db89fa2716b0a839b8ef71d6d6349db URL:
> >>> http://git.openembedded.org/?p=3Dmeta-openembedded.git&a=3Dcommit;h=
=3D80e3a0c42db89fa2716b0a839b8ef71d6d6349db
> >>>
> >>>
> >>>=20
> Author: Koen Kooi <koen@dominion.thruhere.net>
> >>> Date:   Wed Nov 30 15:27:26 2011 +0100
> >>>=20
> >>> pixman: update to 0.24.0
> >>>=20
> >>> * All patches that went upstream are removed
> >>>=20
> >>> Tested on beagleboard/angstrom
> >>>=20
> >>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> >>>=20
> >>=20
> >> FYI: this break my armv5t build, I'll try to test pixman-0.24.0 from=
=20
> >> oe-core or debug it tomorrow.
> >>=20
> >> | arm-oe-linux-gnueabi-libtool: link: arm-oe-linux-gnueabi-gcc=20
> >> -march=3Darmv5te -mthumb -mthumb-interwork -mtune=3Dxscale=20
> >> --sysroot=3D/OE/shr-core/tmp-eglibc/sysroo ts/spitz -O2 -pipe -g
> >> -feliminate-unused-debug-types -Wall -fno-strict-aliasing
> >> -fvisibility=3Dhidden -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -o
> >> .libs/pdf-op-test pdf-op-test.o  ./.libs/libutils.a=20
> >> ../pixman/.libs/libpixman-1.so=20
> >> /OE/shr-core/tmp-eglibc/sysroots/spitz/usr/lib/libpng12.so=20
> >> /OE/shr-core/tmp-eglibc/sysroots/spitz/usr/lib/libz.so -lm |
> >> ../pixman/.libs/libpixman-1.so: undefined reference to
> >> `__builtin_arm_wslldi' | ../pixman/.libs/libpixman-1.so: undefined
> >> reference to `__builtin_arm_wor' | ../pixman/.libs/libpixman-1.so:
> >> undefined reference to `__builtin_arm_wunpckilb' |
> >> ../pixman/.libs/libpixman-1.so: undefined reference to
> >> `__builtin_arm_wsrldi' | ../pixman/.libs/libpixman-1.so: undefined
> >> reference to `__builtin_arm_waddbus' | ../pixman/.libs/libpixman-1.so:
> >> undefined reference to `__builtin_arm_waddhus' |
> >> ../pixman/.libs/libpixman-1.so: undefined reference to
> >> `__builtin_arm_wsrlhi' | ../pixman/.libs/libpixman-1.so: undefined
> >> reference to `__builtin_arm_wxor' | ../pixman/.libs/libpixman-1.so:
> >> undefined reference to `__builtin_arm_wpackhus' |
> >> ../pixman/.libs/libpixman-1.so: undefined reference to
> >> `__builtin_arm_wand' | ../pixman/.libs/libpixman-1.so: undefined
> >> reference to `__builtin_arm_wunpckihb' |
> >> ../pixman/.libs/libpixman-1.so: undefined reference to
> >> `__builtin_arm_wzero' | ../pixman/.libs/libpixman-1.so: undefined
> >> reference to `__builtin_arm_walign' | ../pixman/.libs/libpixman-1.so:
> >> undefined reference to `__builtin_arm_wmulul' | collect2: ld returned 1
> >> exit status | make[2]: *** [a1-trap-test] Error 1
> >>=20
> >> The same for region-test and pdf-op-test.
> >=20
> > Failed the same also for armv4t.. so for now I've added
> > --disable-arm-iwmmxt and replaced .bb with smaller .bbappend:
> >=20
> > FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${P}:"
> >=20
> > DEPENDS +=3D "perl-native" BBCLASSEXTEND =3D "native"
> >=20
> > PRINC =3D "6"
> >=20
> > SRC_URI +=3D "
> > file://0008-Generic-C-implementation-of-pixman_blt-with-overlapp.patch"
> >=20
> > NEON =3D " --disable-arm-neon " NEON_armv7a =3D " " NEON_armv7a-vfp-neo=
n =3D "
> > "
> >=20
> > IWMMXT =3D " --disable-arm-iwmmxt "
> >=20
> > EXTRA_OECONF +=3D "${NEON} ${IWMMXT}"
>=20
> Do you want to send a patch for that?

I'll after more test

>=20
>=20
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.11 (Darwin)
> Comment: GPGTools - http://gpgtools.org
>=20
> iEYEARECAAYFAk7XNxYACgkQMkyGM64RGpFMPQCfdUSdwDedEIoZVd0sDwFHoE+/
> bekAnjd6YDJhN2+1Do4Q3UVmJ/PWRhy1
> =3DH0/4
> -----END PGP SIGNATURE-----
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--+1TulI7fc0PCHNy3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk7XN+EACgkQN1Ujt2V2gBygMwCfXvesHoErOn5gPap6lvRLWVdw
DuYAniFCMgOQnXzaAXDuJB1hrLIY4SKl
=KlYX
-----END PGP SIGNATURE-----

--+1TulI7fc0PCHNy3--
