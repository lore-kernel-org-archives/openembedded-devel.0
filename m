Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <k.kooi@student.utwente.nl>) id 1J1MiO-0005lr-Fw
	for openembedded-devel@openembedded.org; Sun, 09 Dec 2007 15:01:04 +0100
Received: from Powerbook-2.local (vpn006014.vpn.utwente.nl [130.89.6.14])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	lB9Dut0k002217 for <openembedded-devel@lists.openembedded.org>;
	Sun, 9 Dec 2007 14:56:56 +0100
Message-ID: <475BF427.6090302@student.utwente.nl>
Date: Sun, 09 Dec 2007 14:56:55 +0100
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.9 (Macintosh/20071031)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
X-Enigmail-Version: 0.95.5
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
Subject: RFC: unbreaking meta-toolchain naming
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 09 Dec 2007 14:01:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi,

Currently meta-toolchain uses TARGET_ARCH as naming which causes a few
problems:

* armv4t/armv5te/armv6 machines will generate identically named
tarballs, while the contents differ. Anyone using static libs will get
SIGILL'ed when trying to run compiled binaries
* ppc405 and ppc603e machines will generate identically named tarballs,
while there is one is softfloat, and the other hardfloat.

The following patch will generate a correctly named tarball on angstrom:

- --- packages/meta/meta-toolchain.bb
6a7cecb31e297844a67f19888a2e7489e81d948c
+++ packages/meta/meta-toolchain.bb
3fe2673a61b591aed4f247f8201896a640d5ed35
@@ -8,6 +8,8 @@ SDK_DEPLOY = "${TMPDIR}/deploy/sdk"
 SDK_OUTPUT = "${SDK_DIR}/image"
 SDK_DEPLOY = "${TMPDIR}/deploy/sdk"

+FEED_ARCH ?= "${TARGET_ARCH}"
+
 IPKG_HOST = "ipkg-cl -f ${IPKGCONF_SDK} -o ${SDK_OUTPUT}"
 IPKG_TARGET = "ipkg-cl -f ${IPKGCONF_TARGET} -o ${SDK_OUTPUT}/${prefix}"

@@ -118,7 +120,7 @@ do_populate_sdk() {
        # package it up
        mkdir -p ${SDK_DEPLOY}
        cd ${SDK_OUTPUT}
- -       fakeroot tar cfj
${SDK_DEPLOY}/${DISTRO}-${DISTRO_VERSION}-${TARGET_ARCH}-${TARGET_OS}-toolchain.tar.bz2
.
+       fakeroot tar cfj
${SDK_DEPLOY}/${DISTRO}-${DISTRO_VERSION}-${FEED_ARCH}-${TARGET_OS}-toolchain.tar.bz2
.
 }

On other distros it will fall back to TARGET_ARCH.

Any objections to applying this?

regards,

Koen

- --
koen@dominion.kabel.utwente.nl will go go away in december 2007, please
use k.kooi@student.utwente.nl instead.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFHW/QnMkyGM64RGpERAkkSAKCotGh549mm9BDIq149AUkpj+kIyQCaApC1
wPZTQB6Gqt0NFwnPrZjLBco=
=y3cV
-----END PGP SIGNATURE-----


