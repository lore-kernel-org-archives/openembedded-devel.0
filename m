Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1HoawM-0002IT-Ix
	for openembedded-devel@openembedded.org; Thu, 17 May 2007 10:02:28 +0200
Received: from [172.20.1.5] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l4H81uLr004701 for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 May 2007 10:01:57 +0200
Message-ID: <464C0BF1.60300@dominion.kabel.utwente.nl>
Date: Thu, 17 May 2007 10:01:53 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.10 (Macintosh/20070221)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
X-Enigmail-Version: 0.94.2.0
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Questions about SDK generation
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
X-List-Received-Date: Thu, 17 May 2007 08:02:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi,

During the build build of gcc-cross-sdk I noticed this:

NOTE: Running task 280 of 284 (ID: 5,
/home/koen/OE/monotone/org.openembedded.dev/packages/gcc/gcc-cross-sdk_4.1.2.bb, do_package)
NOTE: package gcc-cross-sdk-4.1.2: started
NOTE: package gcc-cross-sdk-4.1.2-r3: task do_package: started
NOTE: the following files were installed but not shipped in any package:
NOTE:   /usr/local/arm/oe/libexec/gcc/arm-angstrom-linux-gnueabi/4.1.2/install-tools/fixinc.sh
NOTE:   /usr/local/arm/oe/libexec/gcc/arm-angstrom-linux-gnueabi/4.1.2/install-tools/fixincl
NOTE:   /usr/local/arm/oe/libexec/gcc/arm-angstrom-linux-gnueabi/4.1.2/install-tools/mkheaders
NOTE:   /usr/local/arm/oe/lib/libiberty.a
NOTE:   /usr/local/arm/oe/lib/gcc/arm-angstrom-linux-gnueabi/4.1.2/install-tools/gsyslimits.h
NOTE:   /usr/local/arm/oe/lib/gcc/arm-angstrom-linux-gnueabi/4.1.2/install-tools/macro_list
NOTE:
/usr/local/arm/oe/lib/gcc/arm-angstrom-linux-gnueabi/4.1.2/install-tools/mkheaders.conf
NOTE:
/usr/local/arm/oe/lib/gcc/arm-angstrom-linux-gnueabi/4.1.2/install-tools/include/README
NOTE:
/usr/local/arm/oe/lib/gcc/arm-angstrom-linux-gnueabi/4.1.2/install-tools/include/float.h
NOTE:
/usr/local/arm/oe/lib/gcc/arm-angstrom-linux-gnueabi/4.1.2/install-tools/include/iso646.h
NOTE:
/usr/local/arm/oe/lib/gcc/arm-angstrom-linux-gnueabi/4.1.2/install-tools/include/stdarg.h
NOTE:
/usr/local/arm/oe/lib/gcc/arm-angstrom-linux-gnueabi/4.1.2/install-tools/include/stdbool.h
NOTE:
/usr/local/arm/oe/lib/gcc/arm-angstrom-linux-gnueabi/4.1.2/install-tools/include/stddef.h
NOTE:
/usr/local/arm/oe/lib/gcc/arm-angstrom-linux-gnueabi/4.1.2/install-tools/include/varargs.h
NOTE:
/usr/local/arm/oe/lib/gcc/arm-angstrom-linux-gnueabi/4.1.2/install-tools/include/mmintrin.h
NOTE:
/usr/local/arm/oe/lib/gcc/arm-angstrom-linux-gnueabi/4.1.2/install-tools/include/limits.h
NOTE:
/usr/local/arm/oe/lib/gcc/arm-angstrom-linux-gnueabi/4.1.2/install-tools/include/unwind.h
NOTE:   /usr/local/arm/oe/bin/arm-angstrom-linux-gnueabi-c++
NOTE:   /usr/local/arm/oe/bin/arm-angstrom-linux-gnueabi-gcc-4.1.2
NOTE:   /usr/local/arm/oe/include/mf-runtime.h
NOTE:   /usr/local/arm/oe/arm-angstrom-linux-gnueabi/lib/libsupc++.la
NOTE:   /usr/local/arm/oe/arm-angstrom-linux-gnueabi/lib/libsupc++.a
NOTE:   /usr/local/arm/oe/arm-angstrom-linux-gnueabi/lib/libstdc++_pic.a
NOTE:   /usr/local/arm/oe/arm-angstrom-linux-gnueabi/lib/libstdc++.la
NOTE:   /usr/local/arm/oe/arm-angstrom-linux-gnueabi/lib/libstdc++.a
NOTE:   /usr/local/arm/oe/arm-angstrom-linux-gnueabi/lib/libmudflap.so.0.0.0
NOTE:   /usr/local/arm/oe/arm-angstrom-linux-gnueabi/lib/libmudflap.la
NOTE:   /usr/local/arm/oe/arm-angstrom-linux-gnueabi/lib/libmudflap.a
NOTE:   /usr/local/arm/oe/arm-angstrom-linux-gnueabi/lib/libmudflapth.so.0.0.0
NOTE:   /usr/local/arm/oe/arm-angstrom-linux-gnueabi/lib/libmudflapth.la
NOTE:   /usr/local/arm/oe/arm-angstrom-linux-gnueabi/lib/libmudflapth.a
NOTE:   /usr/local/arm/oe/arm-angstrom-linux-gnueabi/lib/libiberty.a
NOTE:   /usr/local/arm/oe/arm-angstrom-linux-gnueabi/lib/libgcc_s.so
NOTE:   /usr/local/arm/oe/arm-angstrom-linux-gnueabi/lib/libstdc++.so
NOTE:   /usr/local/arm/oe/arm-angstrom-linux-gnueabi/lib/libmudflap.so.0
NOTE:   /usr/local/arm/oe/arm-angstrom-linux-gnueabi/lib/libmudflap.so
NOTE:   /usr/local/arm/oe/arm-angstrom-linux-gnueabi/lib/libmudflapth.so.0
NOTE:   /usr/local/arm/oe/arm-angstrom-linux-gnueabi/lib/libmudflapth.so

Is that intended?

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFGTAvxMkyGM64RGpERAmi6AJ4vD8WTFN8JxW3K+3F4PGS0xlv9wACgsB9T
zZFHohWjeI8dRPcnGyrWypY=
=+uw+
-----END PGP SIGNATURE-----


