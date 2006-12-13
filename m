Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1GudEM-0008MW-PT
	for openembedded-devel@openembedded.org; Thu, 14 Dec 2006 00:09:42 +0100
Received: from [172.20.1.5] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	kBDN7tox005599 for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Dec 2006 00:07:56 +0100
Message-ID: <458087C8.4010208@dominion.kabel.utwente.nl>
Date: Thu, 14 Dec 2006 00:07:52 +0100
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.8 (Macintosh/20061025)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <20061213152259.GR5148@stygia.hyboria>
In-Reply-To: <20061213152259.GR5148@stygia.hyboria>
X-Enigmail-Version: 0.94.1.2
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: [RFC] Correct the .la files produced by gcc cross
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
X-List-Received-Date: Wed, 13 Dec 2006 23:09:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Graeme Gregory schreef:
> In my libstdc++.la file in tmp/cross/${TARGET_SYS}/lib/
> 
> The following badness occurs.
> 
> dependency_libs='
> -L/home/gg/zaurus/build-terrier-ang/tmp/work/armv5te-angstrom-linux-gnueabi/gcc-cross-4.1.1-r8/gcc-4.1.1/build.x86_64-linux.arm-angstrom-linux-gnueabi/arm-angstrom-linux-gnueabi/libstdc++-v3/src
> -L/home/gg/zaurus/build-terrier-ang/tmp/work/armv5te-angstrom-linux-gnueabi/gcc-cross-4.1.1-r8/gcc-4.1.1/build.x86_64-linux.arm-angstrom-linux-gnueabi/arm-angstrom-linux-gnueabi/libstdc++-v3/src/.libs
> -lm -lm -lm
> -L/home/gg/zaurus/build-terrier-ang/tmp/work/armv5te-angstrom-linux-gnueabi/gcc-cross-4.1.1-r8/gcc-4.1.1/build.x86_64-linux.arm-angstrom-linux-gnueabi/./gcc
> -L/home/gg/zaurus/build-terrier-ang/tmp/cross/arm-angstrom-linux-gnueabi/bin
> -L/home/gg/zaurus/build-terrier-ang/tmp/cross/arm-angstrom-linux-gnueabi/lib
> -L/home/gg/zaurus/build-terrier-ang/tmp/cross/lib/gcc/arm-angstrom-linux-gnueabi/4.1.1
> -L/home/gg/zaurus/build-terrier-ang/tmp/cross/lib/gcc/arm-angstrom-linux-gnueabi/4.1.1/../../../../arm-angstrom-linux-gnueabi/lib
> -lgcc_s -lc -lgcc_s -lm -lgcc_s -lc -lgcc_s  '
> 
> Which you will note leads the linker to start using
> tmp/staging/${BUILD_SYS}/lib which is not a compatible architecure in
> most cases. And for me causes libtool linking to fail when it looks at
> x86_64 .so files while linking for arm executables.
> 
> I think this line should be sed magiced to something along the lines of
> 
> dependency_libs='
> -L/home/gg/zaurus/build-terrier-ang/tmp/cross/${TARGET_SYS}/lib
> -lgcc_s -lc -lm'
> 
> What are the clever peoples thoughts on this.

I'm seeing the same with powerpc:

| powerpc-angstrom-linux-g++ -mcpu=603e -shared -nostdlib
/data/build/koen/OE/build/tmp/angstrom/cross/lib/gcc/powerpc-angstrom-linux/4.1.1/../../../../powerpc-angstrom-linux/lib/crti.o
/data/build/koen/OE/build/tmp/angstrom/cross/lib/gcc/powerpc-angstrom-linux/4.1.1/crtbeginS.o
 .libs/usbpp.o  -Wl,--rpath
- -Wl,/data/build/koen/OE/build/tmp/angstrom/staging/powerpc-angstrom-linux/lib -Wl,--rpath
-
-Wl,/data/build/koen/OE/build/tmp/angstrom/cross/lib/gcc/powerpc-angstrom-linux/4.1.1/../../../../powerpc-angstrom-linux/lib
- -Wl,--rpath
-
-Wl,/data/build/koen/OE/build/tmp/angstrom/cross/lib/gcc/powerpc-angstrom-linux/4.1.1/../../../../powerpc-angstrom-linux/lib
- -L/data/build/koen/OE/build/tmp/angstrom/cross/powerpc-angstrom-linux/lib
- -L/data/build/koen/OE/build/tmp/angstrom/cross/powerpc-angstrom-linux/bin
-
-L/data/build/koen/OE/build/tmp/angstrom/work/ppc603e-angstrom-linux/gcc-cross-4.1.1-r8/gcc-4.1.1/build.i686-linux.powerpc-angstrom-linux/./gcc
- -L/data/build/koen/OE/build/tmp/angstrom/staging/i686-linux/lib
-
-L/data/build/koen/OE/build/tmp/angstrom/work/ppc603e-angstrom-linux/gcc-cross-4.1.1-r8/gcc-4.1.1/build.i686-linux.powerpc-angstrom-linux/powerpc-angstrom-linux/libstdc++-v3/src/.libs
-
-L/data/build/koen/OE/build/tmp/angstrom/work/ppc603e-angstrom-linux/gcc-cross-4.1.1-r8/gcc-4.1.1/build.i686-linux.powerpc-angstrom-linux/powerpc-angstrom-linux/libstdc++-v3/src
- -L/data/build/koen/OE/build/tmp/angstrom/staging/powerpc-angstrom-linux/lib
/data/build/koen/OE/build/tmp/angstrom/staging/powerpc-angstrom-linux/lib/libusb.so
- -L/data/build/koen/OE/build/tmp/angstrom/cross/lib/gcc/powerpc-angstrom-linux/4.1.1
-
-L/data/build/koen/OE/build/tmp/angstrom/cross/lib/gcc/powerpc-angstrom-linux/4.1.1/../../../../powerpc-angstrom-linux/lib
/data/build/koen/OE/build/tmp/angstrom/cross/lib/gcc/powerpc-angstrom-linux/4.1.1/../../../../powerpc-angstrom-linux/lib/libstdc++.so
- -lm -lc -lgcc_s
/data/build/koen/OE/build/tmp/angstrom/cross/lib/gcc/powerpc-angstrom-linux/4.1.1/crtsavres.o
/data/build/koen/OE/build/tmp/angstrom/cross/lib/gcc/powerpc-angstrom-linux/4.1.1/crtendS.o
/data/build/koen/OE/build/tmp/angstrom/cross/lib/gcc/powerpc-angstrom-linux/4.1.1/../../../../powerpc-angstrom-linux/lib/crtn.o
 -mcpu=603e -Wl,-rpath-link
- -Wl,/data/build/koen/OE/build/tmp/angstrom/staging/powerpc-angstrom-linux/lib -Wl,-O1
- -Wl,-soname -Wl,libusbpp-0.1.so.4 -o .libs/libusbpp-0.1.so.4.4.4


The sed trick sounds like a good idea.

regards,

Koen.

PS: when will we rewrite bitbake in sed?
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFFgIfIMkyGM64RGpERAom/AJ9XPCnlrnjCnDW+LLOdHVNjq7TcTgCdGxEv
fWa+ZfeCNLrphkozFfXBLac=
=e+iL
-----END PGP SIGNATURE-----


