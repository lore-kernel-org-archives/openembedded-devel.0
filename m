Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1P6Jaf-0007Co-1h for openembedded-devel@lists.openembedded.org;
	Thu, 14 Oct 2010 10:55:12 +0200
Received: from f053038002.adsl.alicedsl.de ([78.53.38.2] helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1P6JaE-0003Uz-H5 for openembedded-devel@lists.openembedded.org;
	Thu, 14 Oct 2010 08:54:42 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTimanta=-eaEnYmx1J9XSfwm2QzrfbdjB8-51tNr@mail.gmail.com>
References: <1286971290.3904.6.camel@mattotaupa>
	<AANLkTimanta=-eaEnYmx1J9XSfwm2QzrfbdjB8-51tNr@mail.gmail.com>
Date: Thu, 14 Oct 2010 10:54:41 +0200
Message-ID: <1287046481.4039.3.camel@mattotaupa>
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
Subject: Re: eglibc-initial-2.12-r15.6+svnr11762: commit d8ce8a: `do_install` fails with `cannot remove `/usr/include/limits.h': Permission denied`
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
X-List-Received-Date: Thu, 14 Oct 2010 08:55:12 -0000
X-Groupsio-MsgNum: 24832
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-fbuxfAdnEBm7WN1guFIC"

--=-fbuxfAdnEBm7WN1guFIC
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Mittwoch, den 13.10.2010, 09:23 -0700 schrieb Khem Raj:
> On Wed, Oct 13, 2010 at 5:01 AM, Paul Menzel wrote:

> >        $ bitbake console-image
> >        [=E2=80=A6]
> >        | make[1]: Leaving directory `/oe/build-minimal-eglibc/minimal-d=
ev/work/armv7a-oe-linux-gnueabi/eglibc-initial-2.12-r15.6+svnr11762/eglibc-=
2_12/libc'
> >        | make[1]: Entering directory `/oe/build-minimal-eglibc/minimal-=
dev/work/armv7a-oe-linux-gnueabi/eglibc-initial-2.12-r15.6+svnr11762/eglibc=
-2_12/libc'
> >        | /oe/build-minimal-eglibc/minimal-dev/sysroots/i686-linux/usr/b=
in/install -c -m 644 include/limits.h /usr/include/limits.h
> >        | /oe/build-minimal-eglibc/minimal-dev/sysroots/i686-linux/usr/b=
in/install: cannot remove `/usr/include/limits.h': Permission denied
> >        | make[1]: *** [/usr/include/limits.h] Error 1
> >        | make[1]: Leaving directory `/oe/build-minimal-eglibc/minimal-d=
ev/work/armv7a-oe-linux-gnueabi/eglibc-initial-2.12-r15.6+svnr11762/eglibc-=
2_12/libc'
> >        | make: *** [install-headers] Error 2
> >        | FATAL: oe_runmake failed
> >        | ERROR: Function do_install failed
> >        NOTE: package eglibc-initial-2.12-r15.6+svnr11762: task do_insta=
ll: Failed
> >
> > with `minimal-eglibc` for `MACHINE =3D "beagleboard"`.
> >
> > It tries to delete a file of the build system. I guess the Makefile was
> > changed in the latest version bump in d8ce8a [1].
> >
> > Should I CC the eglibc folks when experiencing such problems?
>=20
> hmm whats your host make version ?

        $ make --version
        make: getcwd: No such file or directory
        GNU Make 3.81
        Copyright (C) 2006  Free Software Foundation, Inc.
        This is free software; see the source for copying conditions.
        There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A
        PARTICULAR PURPOSE.
       =20
        This program built for i486-pc-linux-gnu

> I do not see this problem on ubuntu 10.10

The build host is running Debian Squeeze.

I am doing another test build now.


Thanks,

Paul


> > [1] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3Dd8c=
e8acea72b7e7e5512accce434aa4b892cf0a8

--=-fbuxfAdnEBm7WN1guFIC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAky2xT8ACgkQPX1aK2wOHVjjPwCghNkbCPxuF1CFYDufHdonGVRs
tIYAni+oZWWaBc7FNKu5lFKe20UcBlA5
=2zpj
-----END PGP SIGNATURE-----

--=-fbuxfAdnEBm7WN1guFIC--
