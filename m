Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Ovss0-00028W-Mt for openembedded-devel@lists.openembedded.org;
	Wed, 15 Sep 2010 16:22:17 +0200
Received: from g225082214.adsl.alicedsl.de ([92.225.82.214]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Ovsr3-0007Ks-I4 for openembedded-devel@lists.openembedded.org;
	Wed, 15 Sep 2010 14:20:57 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTimb4zC5NYMmt=0a1=ANMxHQDotimEW7TP5JPVqw@mail.gmail.com>
References: <1284404613.4133.103.camel@mattotaupa>
	<AANLkTi=TNCakw39uSUHbVudgdJrxwaQPPZZHmpbO38zN@mail.gmail.com>
	<AANLkTi=ay75ZtCe7g5td8tAMwHki-Hk0_FWjYSkT+KoL@mail.gmail.com>
	<1284496155.3724.18.camel@mattotaupa>
	<1284503564.3724.52.camel@mattotaupa>
	<AANLkTimb4zC5NYMmt=0a1=ANMxHQDotimEW7TP5JPVqw@mail.gmail.com>
Date: Wed, 15 Sep 2010 16:20:53 +0200
Message-ID: <1284560454.3890.3.camel@mattotaupa>
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
Subject: Re: pixman 0.18.4: `do_compile()` fails with minimal-uclibc: `../pixman/.libs/libpixman-1.so: undefined reference to `__tls_get_addr'`
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
X-List-Received-Date: Wed, 15 Sep 2010 14:22:17 -0000
X-Groupsio-MsgNum: 23593
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-oSQbb25iXtOD/F9rKW/a"

--=-oSQbb25iXtOD/F9rKW/a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Dienstag, den 14.09.2010, 15:49 -0700 schrieb Khem Raj:
> On Tue, Sep 14, 2010 at 3:32 PM, Paul Menzel wrote:
> > Am Dienstag, den 14.09.2010, 22:29 +0200 schrieb Paul Menzel:

[=E2=80=A6]

> >> Leon committed the same in f68f811ed20c32d3fb7c71fb41484ae6dd9908fc [3=
].
> >
> >> [3] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3Df6=
8f811ed20c32d3fb7c71fb41484ae6dd9908fc
> >
> > Unfortunately I just tested this patch with minimal-uclibc and it Pixma=
n
> > 0.18.4 fails with the following error when doing `bitbake
> > console-image`.
> >
> > | [=E2=80=A6]
> > | /oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/i686-linux/usr/a=
rmv7a/lib/gcc/arm-oe-linux-uclibceabi/4.4.4/../../../../arm-oe-linux-uclibc=
eabi/bin/ld: warning: libc.so, needed by /oe/build-minimal-uclibc/minimal-u=
clibc-dev/sysroots/i686-linux/usr/armv7a/lib/gcc/arm-oe-linux-uclibceabi/4.=
4.4/../../../../arm-oe-linux-uclibceabi/lib/libgcc_s.so.1, not found (try u=
sing -rpath or -rpath-link)
> > | ../pixman/.libs/libpixman-1.so: undefined reference to `__tls_get_add=
r'
> > | collect2: ld returned 1 exit status
> > | make[2]: *** [a1-trap-test] Error 1
> > | make[2]: *** Waiting for unfinished jobs....
> > | /oe/build-minimal-uclibc/minimal-uclibc-dev/sysroots/i686-linux/usr/a=
rmv7a/lib/gcc/arm-oe-linux-uclibceabi/4.4.4/../../../../arm-oe-linux-uclibc=
eabi/bin/ld: warning: libc.so, needed by /oe/build-minimal-uclibc/minimal-u=
clibc-dev/sysroots/i686-linux/usr/armv7a/lib/gcc/arm-oe-linux-uclibceabi/4.=
4.4/../../../../arm-oe-linux-uclibceabi/lib/libgcc_s.so.1, not found (try u=
sing -rpath or -rpath-link)
> > | ../pixman/.libs/libpixman-1.so: undefined reference to `__tls_get_add=
r'
> > | collect2: ld returned 1 exit status
> > | make[2]: *** [region-test] Error 1
> > | [=E2=80=A6]
>=20
> It seems that TLS is needed/enabled by default for pixman. You can explor=
e if
> you can disable tls during configure like --disable-tls or some such opti=
on
> if exists would be ideal then you can disable it for uclibc based builds.

I could not find a swith in the output of `./configure --help`.

> Otherwise we have to patch it to work without TLS.

On other option would be to pin an older cairo version for minimal until
uclibc is updated.

> As a workaround you can use uclibc-git recipes which have TLS/NPTL enable=
d
> by default and it should work with uclibc-git unmodified.

Yes this worked.

[=E2=80=A6]


Thanks,

Paul

--=-oSQbb25iXtOD/F9rKW/a
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkyQ1kUACgkQPX1aK2wOHVjVOACfbjCKyqjA114D/An/yJ3f8tn1
9aUAnA47otcvVDxcQ7EK1v3SOp7+pyF6
=CgTy
-----END PGP SIGNATURE-----

--=-oSQbb25iXtOD/F9rKW/a--
