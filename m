Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Ove4C-0007aR-S7 for openembedded-devel@lists.openembedded.org;
	Wed, 15 Sep 2010 00:33:37 +0200
Received: from f053037098.adsl.alicedsl.de ([78.53.37.98]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Ove3S-0004GF-Aw for openembedded-devel@lists.openembedded.org;
	Tue, 14 Sep 2010 22:32:46 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1284496155.3724.18.camel@mattotaupa>
References: <1284404613.4133.103.camel@mattotaupa>
	<AANLkTi=TNCakw39uSUHbVudgdJrxwaQPPZZHmpbO38zN@mail.gmail.com>
	<AANLkTi=ay75ZtCe7g5td8tAMwHki-Hk0_FWjYSkT+KoL@mail.gmail.com>
	<1284496155.3724.18.camel@mattotaupa>
Date: Wed, 15 Sep 2010 00:32:44 +0200
Message-ID: <1284503564.3724.52.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: pixman 0.18.4: `do_compile()` fails with minimal-uclibc: `../pixman/.libs/libpixman-1.so: undefined reference to `__tls_get_addr'` (was: Re: [PATCH] preferred-xorg-versions-X11R7.5-latest.inc: Use Pixman 0.18.4.)
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
X-List-Received-Date: Tue, 14 Sep 2010 22:33:47 -0000
X-Groupsio-MsgNum: 23578
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-vqkMO2S7x8x3XQrexD+T"

--=-vqkMO2S7x8x3XQrexD+T
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Dienstag, den 14.09.2010, 22:29 +0200 schrieb Paul Menzel:
> Am Dienstag, den 14.09.2010, 15:17 +0200 schrieb Frans Meulenbroeks:
> > 2010/9/13 Khem Raj <raj.khem@gmail.com>:
> > > On Mon, Sep 13, 2010 at 12:03 PM, Paul Menzel <paulepanter@users.sour=
ceforge.net> wrote:
> > >> Date: Mon, 13 Sep 2010 20:53:48 +0200
> > >>
> > >> Cairo 1.10.0 was added in 1d4c650b1d8dac6adee3d3d4208b81bc9b67bd3d [=
1] and requires Pixman 0.18.4. This fixes at least the distribution Minimal=
 which does not set the version of cairo explicitly.
> > >>
> > >>
> > >> [1] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3D=
1d4c650b1d8dac6adee3d3d4208b81bc9b67bd3d
> > >> [2] http://cgit.freedesktop.org/cairo/commit/?id=3D8127f1f5d52bb716d=
bd70efe096894f2a542f4a9
> > >>
> > >> Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
> > >
> > > Acked-by: Khem Raj <raj.khem@gmail.com>
> >=20
> > Paul, thanks for the fix!
> >=20
> > Acked-by: Frans Meulenbroeks <frans.meulenbroeks@gmail.com>
>=20
> Leon committed the same in f68f811ed20c32d3fb7c71fb41484ae6dd9908fc [3].

> [3] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3Df68f8=
11ed20c32d3fb7c71fb41484ae6dd9908fc

Unfortunately I just tested this patch with minimal-uclibc and it Pixman
0.18.4 fails with the following error when doing `bitbake
console-image`.

| [=E2=80=A6]
| /oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/i686-linux/usr/armv7=
a/lib/gcc/arm-oe-linux-uclibceabi/4.4.4/../../../../arm-oe-linux-uclibceabi=
/bin/ld: warning: libc.so, needed by /oe/build-minimal-uclibc/minimal-uclib=
c-dev/sysroots/i686-linux/usr/armv7a/lib/gcc/arm-oe-linux-uclibceabi/4.4.4/=
../../../../arm-oe-linux-uclibceabi/lib/libgcc_s.so.1, not found (try using=
 -rpath or -rpath-link)
| ../pixman/.libs/libpixman-1.so: undefined reference to `__tls_get_addr'
| collect2: ld returned 1 exit status
| make[2]: *** [a1-trap-test] Error 1
| make[2]: *** Waiting for unfinished jobs....
| /oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/i686-linux/usr/armv7=
a/lib/gcc/arm-oe-linux-uclibceabi/4.4.4/../../../../arm-oe-linux-uclibceabi=
/bin/ld: warning: libc.so, needed by /oe/build-minimal-uclibc/minimal-uclib=
c-dev/sysroots/i686-linux/usr/armv7a/lib/gcc/arm-oe-linux-uclibceabi/4.4.4/=
../../../../arm-oe-linux-uclibceabi/lib/libgcc_s.so.1, not found (try using=
 -rpath or -rpath-link)
| ../pixman/.libs/libpixman-1.so: undefined reference to `__tls_get_addr'
| collect2: ld returned 1 exit status
| make[2]: *** [region-test] Error 1
| [=E2=80=A6]


Please tell me, if I can provide more information. Thanks,

Paul

--=-vqkMO2S7x8x3XQrexD+T
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkyP+AwACgkQPX1aK2wOHVgK7ACeMBINt1xhXAdPBqlWtoOuOiPd
NBAAnA0drqKhoYUr3+jXrKqyjpKFtU7Y
=EcSp
-----END PGP SIGNATURE-----

--=-vqkMO2S7x8x3XQrexD+T--
