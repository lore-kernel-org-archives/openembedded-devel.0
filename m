Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PDYxw-0000gX-5F for openembedded-devel@lists.openembedded.org;
	Wed, 03 Nov 2010 09:45:08 +0100
Received: from f053043217.adsl.alicedsl.de ([78.53.43.217]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1PDYx9-00082a-FO; Wed, 03 Nov 2010 08:44:19 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org, Roman I Khimov
	<khimov@altell.ru>
Date: Wed, 03 Nov 2010 09:44:18 +0100
Message-ID: <1288773858.3980.10.camel@mattotaupa>
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
Subject: libprelude: angstrom-2010.x: task `compile` fails with `./include/prelude-plugin.h:66:20: error: conflicting types for 'lt__PROGRAM__LTX_preloaded_symbols'`
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
X-List-Received-Date: Wed, 03 Nov 2010 08:45:08 -0000
X-Groupsio-MsgNum: 25767
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-s/pes1vcja4NypOs91A9"

--=-s/pes1vcja4NypOs91A9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear OE folks, dear Roman,


Build Configuration:
BB_VERSION        =3D "1.10.0"
METADATA_BRANCH   =3D "org.openembedded.dev"
METADATA_REVISION =3D "54d1ab587326543390e8ae55e9f7945a3a4ebdd1"
TARGET_ARCH       =3D "arm"
TARGET_OS         =3D "linux-gnueabi"
MACHINE           =3D "beagleboard"
DISTRO            =3D "angstrom"
DISTRO_VERSION    =3D "next"
TARGET_FPU        =3D "hard"

testing to build `suricata_1.0.2` (commit f85795) [1] the build fails in
the task `compile` of the dependency `libprelude_1.0.0` (commit 577889)
[2].

        | In file included from prelude-plugin.c:56:0:
        | ./include/prelude-plugin.h:66:20: error: conflicting types for 'l=
t__PROGRAM__LTX_preloaded_symbols'
        | /oe/build-angstrom-next/angstrom-dev/sysroots/armv7a-angstrom-lin=
ux-gnueabi/usr/include/ltdl.h:106:36: note: previous declaration of 'lt__PR=
OGRAM__LTX_preloaded_symbols' was here
        | make[4]: *** [prelude-plugin.lo] Error 1

Could you take a look and/or report that upstream.


Thanks,

Paul


[1] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3Df857958=
0b47ea2e9022e7d9a375827fa750b71f1
[2] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3D5778891=
6d7a3675260267ac1e043efd367806253


--=-s/pes1vcja4NypOs91A9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkzRIOIACgkQPX1aK2wOHVhATwCfb4Z03CwcBFzDqJWeBzqM4GvF
vyUAn3NCc7H8W03Ur/n+72pPB/Aexuj9
=Cfi4
-----END PGP SIGNATURE-----

--=-s/pes1vcja4NypOs91A9--
