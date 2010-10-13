Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1P601u-00050Z-Jl for openembedded-devel@lists.openembedded.org;
	Wed, 13 Oct 2010 14:01:59 +0200
Received: from f053040062.adsl.alicedsl.de ([78.53.40.62]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1P601U-0003Yn-Md for openembedded-devel@lists.openembedded.org;
	Wed, 13 Oct 2010 12:01:32 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 Oct 2010 14:01:30 +0200
Message-ID: <1286971290.3904.6.camel@mattotaupa>
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
Subject: eglibc-initial-2.12-r15.6+svnr11762: commit d8ce8a: `do_install` fails with `cannot remove `/usr/include/limits.h': Permission denied`
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
X-List-Received-Date: Wed, 13 Oct 2010 12:02:00 -0000
X-Groupsio-MsgNum: 24768
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-+sztvyhQDZYEMyQ4prL7"

--=-+sztvyhQDZYEMyQ4prL7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear OE folks,


        $ bitbake console-image
        [=E2=80=A6]
        | make[1]: Leaving directory `/oe/build-minimal-eglibc/minimal-dev/=
work/armv7a-oe-linux-gnueabi/eglibc-initial-2.12-r15.6+svnr11762/eglibc-2_1=
2/libc'
        | make[1]: Entering directory `/oe/build-minimal-eglibc/minimal-dev=
/work/armv7a-oe-linux-gnueabi/eglibc-initial-2.12-r15.6+svnr11762/eglibc-2_=
12/libc'
        | /oe/build-minimal-eglibc/minimal-dev/sysroots/i686-linux/usr/bin/=
install -c -m 644 include/limits.h /usr/include/limits.h
        | /oe/build-minimal-eglibc/minimal-dev/sysroots/i686-linux/usr/bin/=
install: cannot remove `/usr/include/limits.h': Permission denied
        | make[1]: *** [/usr/include/limits.h] Error 1
        | make[1]: Leaving directory `/oe/build-minimal-eglibc/minimal-dev/=
work/armv7a-oe-linux-gnueabi/eglibc-initial-2.12-r15.6+svnr11762/eglibc-2_1=
2/libc'
        | make: *** [install-headers] Error 2
        | FATAL: oe_runmake failed
        | ERROR: Function do_install failed
        NOTE: package eglibc-initial-2.12-r15.6+svnr11762: task do_install:=
 Failed

with `minimal-eglibc` for `MACHINE =3D "beagleboard"`.

It tries to delete a file of the build system. I guess the Makefile was
changed in the latest version bump in d8ce8a [1].

Should I CC the eglibc folks when experiencing such problems?


Thanks,

Paul


[1] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3Dd8ce8ac=
ea72b7e7e5512accce434aa4b892cf0a8

--=-+sztvyhQDZYEMyQ4prL7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAky1n5UACgkQPX1aK2wOHVgIUACfZnatiSAaPRnBpQ89S2PJprJH
uEQAn3JTvG2Wmya703wPt7uDll8g1e9Z
=ZwMT
-----END PGP SIGNATURE-----

--=-+sztvyhQDZYEMyQ4prL7--
