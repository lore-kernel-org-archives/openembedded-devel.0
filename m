Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PjDCa-0004BR-0o for openembedded-devel@lists.openembedded.org;
	Sat, 29 Jan 2011 16:59:04 +0100
Received: from f053042056.adsl.alicedsl.de ([78.53.42.56]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1PjDBm-00060e-Rz; Sat, 29 Jan 2011 15:58:14 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 29 Jan 2011 16:58:13 +0100
Message-ID: <1296316693.5925.10.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: [REGRESSION] omap3-sgx-modules: `NOTE: Runtime target 'kernel-' is unbuildable, removing...`
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
X-List-Received-Date: Sat, 29 Jan 2011 15:59:04 -0000
X-Groupsio-MsgNum: 28614
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-/ejZ5pNIt1f49cg1vBTB"

--=-/ejZ5pNIt1f49cg1vBTB
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Andreas and OE folks,


        commit 2dac84b9a7b820466ed626420fec120093b56e16
        Author: Andreas Oberritter <obi@opendreambox.org>
        Date:   Sat Jan 29 00:51:25 2011 +0000
       =20
            module.bbclass: depend on kernel-${KERNEL_VERSION} instead of k=
ernel (=3D ${KERNEL_VERSION})
           =20
            * As a special case, kernel modules must depend on
              kernel-${KERNEL_VERSION}, which gets runtime provided by the =
kernel
              package. The reason is, that the package version can be diffe=
rent
              from ${KERNEL_VERSION}, because the latter depends on the ker=
nel
              configuration, e.g. CONFIG_LOCALVERSION.
           =20
            Signed-off-by: Andreas Oberritter <obi@opendreambox.org>

[1] seems to have broken `omap3-sgx-modules`.

        $ bitbake -k omap3-sgx-modules
        NOTE: Handling BitBake files: - (7083/7083) [100 %]
        Parsing of 7083 .bb files complete (6644 cached, 439 parsed). 7395 =
targets, 304=20
        skipped, 0 masked, 0 errors.  =20
        ERROR: '['/oe/openembedded/recipes/powervr-drivers/omap3-sgx-module=
s_1.4.14.2616.bb']' RDEPENDS/RRECOMMENDS or otherwise requires the runtime =
entity 'kernel-' but it wasn't found in any PACKAGE or RPROVIDES variables
        NOTE: Resolving any missing task queue dependencies
        ERROR: '['/oe/openembedded/recipes/powervr-drivers/omap3-sgx-module=
s_1.4.14.2616.bb']' RDEPENDS/RRECOMMENDS or otherwise requires the runtime =
entity 'kernel-' but it wasn't found in any PACKAGE or RPROVIDES variables
        Unknown Event: <bb.event.NoProvider instance at 0x10964eac>
        NOTE: Runtime target 'kernel-' is unbuildable, removing...
        Missing or unbuildable dependency chain was: ['kernel-']
        NOTE: Runtime target 'omap3-sgx-modules' is unbuildable, removing..=
.
        Missing or unbuildable dependency chain was: ['omap3-sgx-modules', =
'kernel-']
        FATAL: All buildable tasks have been run but the build is incomplet=
e (--continue mode). Errors for the tasks that failed will have been printe=
d above.


Thanks,

Paul


[1] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3D2dac84b=
9a7b820466ed626420fec120093b56e16

--=-/ejZ5pNIt1f49cg1vBTB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAk1EOQAACgkQPX1aK2wOHViAjACfbTHmR0zGdbnohNNjZlIYUuvU
PloAn2jrBLxciXPf3C3k96Q8gWWGD2dI
=CYva
-----END PGP SIGNATURE-----

--=-/ejZ5pNIt1f49cg1vBTB--
