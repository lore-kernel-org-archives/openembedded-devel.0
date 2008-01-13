Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <k.kooi@student.utwente.nl>) id 1JE4sn-0006Io-NZ
	for openembedded-devel@openembedded.org; Sun, 13 Jan 2008 16:36:21 +0100
Received: from Powerbook-2.local (vpn006012.vpn.utwente.nl [130.89.6.12])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	m0DFZqfr015460 for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Jan 2008 16:35:52 +0100
Message-ID: <478A2FD8.5060103@student.utwente.nl>
Date: Sun, 13 Jan 2008 16:35:52 +0100
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.9 (Macintosh/20071031)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
References: <200801131718.55872.risto@wapice.com>
In-Reply-To: <200801131718.55872.risto@wapice.com>
X-Enigmail-Version: 0.95.6
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	servicedesk@icts.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
Subject: Re: large uImage size
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
X-List-Received-Date: Sun, 13 Jan 2008 15:36:21 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Risto Pajula schreef:
| Hello.
|
| I am getting very large kernel image size (~4,5 MB) when using the
| cross-compiler built with a recent version of openembedded. Normal kernel
| image size is around 1,5 MB. The large kernel image size only happens
when
| building the kernel outside the openembedded build environment, when
building
| with the normal OE build (bitbake minimal-image) the resulting kernel
image
| size is normal.
|
| This has however changed in some point of OE development. If I use an
old OE
| snapshot and build the crosscompiler with it the resulting kernel
image even
| when building outside OE environment is normal. (Both however use gcc
4.1.2).
|
| I have tried to figure what is different in the environment when
building the
| kernel within OE and outside it but any of the environment variables
and etc.
| have not solved the problem.
|
| Does anybody know any changes in the OE which could cause this different
| behaviour in the gcc cross-compiler built with it?

http://www.openembedded.org/repo/org.openembedded.dev/packages/linux/linux-2.6.23/binutils-buildid-arm.patch

|
| Machine: at91sam9263-ek.
| The kernel compilation ouside OE:
| make ARCH=arm
|
CROSS_COMPILE=/PATH_TO_OE_BUILD_DIR/tmp/cross/bin/arm-angstrom-linux-gnueabi-

| uImage
|
| I want to build the development kernel outside of openembedded
framewok for
| various reasons

any valid reasons?


- --
koen@dominion.kabel.utwente.nl will go go away in december 2007, please
use k.kooi@student.utwente.nl instead.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFHii/YMkyGM64RGpERAnUCAJ9SiBslj6zIdKOC1v8FapxmyPNi+gCgqJDP
zLSyPC/dzhhoh3KULKcA/Hw=
=V0yR
-----END PGP SIGNATURE-----


