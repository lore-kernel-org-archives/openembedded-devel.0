Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1P5cXc-0007ad-VO for openembedded-devel@lists.openembedded.org;
	Tue, 12 Oct 2010 12:57:10 +0200
Received: from f053038011.adsl.alicedsl.de ([78.53.38.11]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1P5cXE-00029L-Ge for openembedded-devel@lists.openembedded.org;
	Tue, 12 Oct 2010 10:56:44 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4CB4391E.6030909@cam.ac.uk>
References: <4CB4391E.6030909@cam.ac.uk>
Date: Tue, 12 Oct 2010 12:56:42 +0200
Message-ID: <1286881002.3731.1.camel@mattotaupa>
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
Subject: Re: testing branch 2010-10-08: Udev 151 issues.
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
X-List-Received-Date: Tue, 12 Oct 2010 10:57:10 -0000
X-Groupsio-MsgNum: 24721
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-TEvFrfHEAz9jdPDNVOGn"

--=-TEvFrfHEAz9jdPDNVOGn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Jonathan,


Am Dienstag, den 12.10.2010, 11:31 +0100 schrieb Jonathan Cameron:

> I'm getting,=20
>=20
> NOTE: make
> mkdir -p extras/keymap
>   GEN    extras/keymap/keys.txt
>   GEN    extras/keymap/keys-from-name.gperf
>   GEN    extras/keymap/keys-from-name.h
>   GEN    extras/keymap/keys-to-name.h
> make --no-print-directory all-recursive
> Making all in .
>   CC     libudev/libudev.lo
>   CC     libudev/libudev-list.lo
>   CC     libudev/libudev-util.lo
>   CC     libudev/libudev-device.lo
>   CC     libudev/libudev-enumerate.lo
>   CC     libudev/libudev-monitor.lo
>   CC     libudev/libudev-queue.lo
> libudev/libudev-queue.c: In function 'udev_queue_skip_devpath':
> libudev/libudev-queue.c:185:1: internal compiler error: in cond_exec_proc=
ess_insns, at ifcvt.c:273
> Please submit a full bug report,
> with preprocessed source if appropriate.
> See <http://gcc.gnu.org/bugs.html> for instructions.
> make[2]: *** [libudev/libudev-queue.lo] Error 1
> make[1]: *** [all-recursive] Error 1
> make: *** [all] Error 2
> FATAL: oe_runmake failed
>=20
>=20
> in udev 151 and have been since 2010-10-04 (worked previously though I gu=
ess udev may
> have changed).
>=20
> Building imote2-image
> =20
> MACHINE =3D "imote2"
> DISTRO =3D "angstrom-2010.x"
>=20
> Anyone seeing anything similar?

I am having the same problem and everything is already documented on the
WWW, for example [1].


Thanks,

Paul


[1] https://bugs.launchpad.net/gcc-linaro/+bug/653316

--=-TEvFrfHEAz9jdPDNVOGn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAky0PuQACgkQPX1aK2wOHVjkwQCbB1kcpOuXqDVm9WyZn8cvf1Dq
NUkAn3qq9kVK4no3ydAbDKl6TNzNUH0M
=TeVe
-----END PGP SIGNATURE-----

--=-TEvFrfHEAz9jdPDNVOGn--
