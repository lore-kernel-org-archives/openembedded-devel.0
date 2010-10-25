Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PAJJ9-0001De-OI for openembedded-devel@lists.openembedded.org;
	Mon, 25 Oct 2010 11:25:42 +0200
Received: from f053043161.adsl.alicedsl.de ([78.53.43.161]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1PAJIU-0000st-Es; Mon, 25 Oct 2010 09:24:54 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: Michael Smith <msmith@cbnco.com>
Date: Mon, 25 Oct 2010 11:24:53 +0200
Message-ID: <1287998693.3793.30.camel@mattotaupa>
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
Cc: openembedded-devel@lists.openembedded.org
Subject: xdelta_3.0z.bb: `QA Issue with xdelta: No GNU_HASH in the elf binary`
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
X-List-Received-Date: Mon, 25 Oct 2010 09:25:53 -0000
X-Groupsio-MsgNum: 25443
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-tpYMpGvMG4ahohLtJ1Sl"

--=-tpYMpGvMG4ahohLtJ1Sl
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Michael,


`xdelta_3.0z.bb` you committed in 117024 [1] fails with the following
error when building it wtih `angstrom-2008.1` for `MACHINE =3D
"beagleboard"`.

        $ more angstrom-dev/work/armv7a-angstrom-linux-gnueabi/xdelta-3.0z-=
r0/temp/log.do_package*
        ::::::::::::::
        angstrom-dev/work/armv7a-angstrom-linux-gnueabi/xdelta-3.0z-r0/temp=
/log.do_package.1558
        ::::::::::::::
        ERROR: QA Issue with xdelta: No GNU_HASH in the elf binary: '/oe/bu=
ild/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/xdelta-3.0z-r0/packages=
-split/xdelta/usr/bin/xdelta
        3'
        FATAL: QA run found fatal errors. Please consider fixing them.
        ERROR: Error in executing python function in: /oe/openembedded/reci=
pes/xdelta/xdelta_3.0z.bb
        ERROR: Exception:<type 'exceptions.SystemExit'> Message:1
        ERROR: Printing the environment of the function
        ERROR: Function do_package_qa failed

There is no mention in the commit message, what distribution and machine
you tested this recipe with.

=C8=A6ngstr=C3=B6m includes `insane.bbclass` [2][3] and therefore breaks.

Could you please look into this.


Thanks,

Paul


[1] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3D117024c=
efa6d38753e3094b964b077aa7c0ce17f
[2] http://cgit.openembedded.org/cgit.cgi/openembedded/tree/conf/distro/inc=
lude/angstrom.inc?id=3D117024cefa6d38753e3094b964b077aa7c0ce17f#n88
[3] http://cgit.openembedded.org/cgit.cgi/openembedded/tree/classes/insane.=
bbclass?h=3D117024cefa6d38753e3094b964b077aa7c0ce17f#n273

--=-tpYMpGvMG4ahohLtJ1Sl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkzFTN8ACgkQPX1aK2wOHVgCPwCfSo+Op7+J5W55XSroxCDhTkI+
0A8AmwXS+Z1UWeDhbDJ/Mn+uQLw6lPHE
=do+x
-----END PGP SIGNATURE-----

--=-tpYMpGvMG4ahohLtJ1Sl--
