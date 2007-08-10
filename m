Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1IJaXc-0000fw-5O
	for openembedded-devel@openembedded.org; Fri, 10 Aug 2007 21:53:00 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l7AJo31R016579 for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Aug 2007 21:50:03 +0200
Message-ID: <46BCC163.8000906@dominion.kabel.utwente.nl>
Date: Fri, 10 Aug 2007 21:49:55 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 2.0.0.6 (Macintosh/20070728)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
X-Enigmail-Version: 0.95.3
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: [RFC] improving binutils-cross staging
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
X-List-Received-Date: Fri, 10 Aug 2007 19:53:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi,

For blackfin I need to build elf2flt and that needs some extra files from binutils:

- --- packages/binutils/binutils-cross_2.17.50.0.5.bb
d60bed4e513253708d05f83d02aecf9ca9441369
+++ packages/binutils/binutils-cross_2.17.50.0.5.bb
208e1b60a5e66b05df64de9964cfdce963a37190
@@ -21,6 +21,15 @@ do_stage () {
        rmdir ${CROSS_DIR}/${libdir} || :
        rmdir ${CROSS_DIR}/${prefix} || :

+        oe_libinstall -a -C opcodes libopcodes ${CROSS_DIR}/${TARGET_SYS}/lib
+        oe_libinstall -a -C bfd libbfd ${CROSS_DIR}/${TARGET_SYS}/lib
+
+        install -d ${CROSS_DIR}/${TARGET_SYS}/include
+        install -d ${CROSS_DIR}/${TARGET_SYS}/include/elf
+
+        install -m 0644 bfd/bfd.h ${CROSS_DIR}/${TARGET_SYS}/include
+        install -m 0644 ${WORKDIR}/binutils-${PV}/include/elf/*.h
${CROSS_DIR}/${TARGET_SYS}/include/elf/
+
        # We want to move this into the target specific location
        mkdir -p ${CROSS_DIR}/${TARGET_SYS}/lib
        mv -f ${CROSS_DIR}/lib/libiberty.a ${CROSS_DIR}/${TARGET_SYS}/lib

It looks a bit ugly to me, does anyone have a better suggestion?

regards,

Koen

PS:

elf2flt_svn.bb:
PV = "0.0+svnr${SRCREV}"
inherit autotools cross
SRC_URI = "svn://sources.blackfin.uclinux.org/toolchain/trunk;module=${PN}"
S = "${WORKDIR}/${PN}"
EXTRA_OECONF = " --with-libbfd=${CROSS_DIR}/${TARGET_SYS}/lib/libbfd.a \
                 --with-libiberty=${CROSS_DIR}/${TARGET_SYS}/lib/libiberty.a \
                 --with-bfd-include-dir=${CROSS_DIR}/${TARGET_SYS}/include \
               "
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFGvMFjMkyGM64RGpERAm7sAJ9/aEYcxAhXKd7Z79IivGFQ9lxZpACghyBy
qF+s0qRfgCTelH3Q/LXZSlo=
=4q6O
-----END PGP SIGNATURE-----


