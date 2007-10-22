Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <k.kooi@student.utwente.nl>) id 1Ijvk5-00078o-Ty
	for openembedded-devel@openembedded.org; Mon, 22 Oct 2007 13:46:46 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l9MBdWUo016330 for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Oct 2007 13:39:33 +0200
Message-ID: <471C8BF4.1050206@student.utwente.nl>
Date: Mon, 22 Oct 2007 13:39:32 +0200
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.6 (Macintosh/20070728)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
References: <4510693243.20071017152524@vanille-media.de>	<471729ED.9080208@student.utwente.nl>
	<1192708743.6158.25.camel@localhost.localdomain>
In-Reply-To: <1192708743.6158.25.camel@localhost.localdomain>
X-Enigmail-Version: 0.95.3
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
Subject: Re: Cleaning up SDK/Toolchain
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
X-List-Received-Date: Mon, 22 Oct 2007 11:46:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Richard Purdie schreef:
> On Thu, 2007-10-18 at 11:39 +0200, Koen Kooi wrote:
>> Apart from the libc flaw I pointed out in another mail, the naming of the toolchains is
>> broken as well:
>>
>> angstrom-2007.9-test-20071017-arm-linux-gnueabi-toolchain.tar.bz2
>> angstrom-2007.9-test-20071017-arm-linux-uclibcgnueabi-toolchain.tar.bz2
>> angstrom-2007.9-test-20071018-powerpc-linux-toolchain.tar.bz2
>> angstrom-2007.9-test-20071018-powerpc-linux-uclibc-toolchain.tar.bz2
>>
>> There's no way to see if the arm ones are armv4t, armv5te or armv6 and the powerpc ones
>> ppc405, ppc440 or ppc603e. For compiling 'hello world' that doesn't matter, but libc6.so
>> and libgcc_s.so will contain instruction not available on other cpus of that arch (e.g.
>> clz is not in armv4t), so your binary will probably not work on your device.
>>
>> My idea is to use PACKAGE_ARCH (e.g. armv5te or ppc603e) instead of TARGET_ARCH.
>>
>> Comments/hints/ideas?
> 
> We actually have a bigger problem. Staging uses an arm directory, not an
> armv5te one so the armv5te binaries mix up with the armv4 ones etc.
> 
> This isn't a problem with images built from packages where everything
> dynamically links since the right packages are used. The moment someone
> tries to statically link an armv4 binary with armv5te in staging, game
> over though.
> 
> So both the meta-toolchain and staging need some thought (and are
> related since meta-toolchain has knowledge to rebuild bits of staging
> for use in its "shortcut an OE build by skipping the toolchain" mode.
> 
> I agreed we probably need to add in some PACKAGE_ARCHs in places but its
> yet another thing that needs some careful thought and we'll probably
> break people's existing builds. I hope to look at/think about it soon if
> nobody beats me too it...

Hopefully[1] it's as simple as:

#
# old_revision [95220d9f8a309c487f6d8da20ce7f8df8945bc0c]
#
# patch "conf/bitbake.conf"
#  from [f410a6b3af115612f2bd104814d1035583d3518a]
#    to [3391cfd9df2450e4090fa01879fab5f5e7b100a8]
#
============================================================
- --- conf/bitbake.conf   f410a6b3af115612f2bd104814d1035583d3518a
+++ conf/bitbake.conf   3391cfd9df2450e4090fa01879fab5f5e7b100a8
@@ -45,6 +45,7 @@ HOST_SYS = "${HOST_ARCH}${HOST_VENDOR}-$
 HOST_OS = "${TARGET_OS}"
 HOST_VENDOR = "${TARGET_VENDOR}"
 HOST_SYS = "${HOST_ARCH}${HOST_VENDOR}-${HOST_OS}"
+STAGING_SYS = "${PACKAGE_ARCH}${HOST_VENDOR}-${HOST_OS}"
 HOST_PREFIX = "${TARGET_PREFIX}"
 HOST_CC_ARCH = "${TARGET_CC_ARCH}"

@@ -167,16 +168,16 @@ STAGING_DIR = "${TMPDIR}/staging"
 B = "${S}"

 STAGING_DIR = "${TMPDIR}/staging"
- -STAGING_BINDIR = "${STAGING_DIR}/${HOST_SYS}/bin"
+STAGING_BINDIR = "${STAGING_DIR}/${STAGING_SYS}/bin"
 STAGING_BINDIR_CROSS = "${STAGING_DIR}/${BUILD_SYS}/bin/${HOST_SYS}"
 STAGING_BINDIR_NATIVE = "${STAGING_DIR}/${BUILD_SYS}/bin"
- -STAGING_LIBDIR = "${STAGING_DIR}/${HOST_SYS}/lib"
+STAGING_LIBDIR = "${STAGING_DIR}/${STAGING_SYS}/lib"
 STAGING_LIBDIR_NATIVE = "${STAGING_DIR}/${BUILD_SYS}/lib"
 STAGING_ETCDIR_NATIVE = "${STAGING_DIR}/${BUILD_SYS}/etc"
- -STAGING_INCDIR = "${STAGING_DIR}/${HOST_SYS}/include"
- -STAGING_DATADIR = "${STAGING_DIR}/${HOST_SYS}/share"
- -STAGING_LOADER_DIR = "${STAGING_DIR}/${HOST_SYS}/loader"
- -STAGING_FIRMWARE_DIR = "${STAGING_DIR}/${HOST_SYS}/firmware"
+STAGING_INCDIR = "${STAGING_DIR}/${STAGING_SYS}/include"
+STAGING_DATADIR = "${STAGING_DIR}/${STAGING_SYS}/share"
+STAGING_LOADER_DIR = "${STAGING_DIR}/${STAGING_SYS}/loader"
+STAGING_FIRMWARE_DIR = "${STAGING_DIR}/${STAGING_SYS}/firmware"
 STAGING_PYDIR = "${STAGING_DIR}/lib/python2.4"

regards,

Koen

[1] I suspect this 'breaks' machine specific packages, but we'll see

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFHHIv0MkyGM64RGpERAu2mAJ4uKSq0ikrAs+sDeHbXL/CpoJKhCACgtNRX
V3klBAJipI9EL0EJxVIOYdo=
=vHWK
-----END PGP SIGNATURE-----


