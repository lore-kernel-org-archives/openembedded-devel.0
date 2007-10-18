Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <k.kooi@student.utwente.nl>) id 1IiRxf-0005yx-7q
	for openembedded-devel@openembedded.org; Thu, 18 Oct 2007 11:46:40 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l9I9dsUx001573 for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Oct 2007 11:39:54 +0200
Message-ID: <471729ED.9080208@student.utwente.nl>
Date: Thu, 18 Oct 2007 11:39:57 +0200
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.6 (Macintosh/20070728)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
References: <4510693243.20071017152524@vanille-media.de>
In-Reply-To: <4510693243.20071017152524@vanille-media.de>
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
X-List-Received-Date: Thu, 18 Oct 2007 09:46:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Michael 'Mickey' Lauer schreef:
> On OEDEM we talked about SDK and Toolchain issues. Richard Purdie
> recently merged Poky's meta-toolchain package plus the infrastructure
> that enables OE building external toolchains for usage with or without
> OpenEmbedded.
> 
> In order to make this a bit more clean, we'd like to remove some of
> the older meta-sdk packages, if no one objects. If you are still using
> the meta-sdk packages, could you merge them towards using
> meta-toolchain?
> 
> Adding custom packages to the meta-toolchain should just be a matter
> of overriding TOOLCHAIN_TARGET_TASK now.

Apart from the libc flaw I pointed out in another mail, the naming of the toolchains is
broken as well:

angstrom-2007.9-test-20071017-arm-linux-gnueabi-toolchain.tar.bz2
angstrom-2007.9-test-20071017-arm-linux-uclibcgnueabi-toolchain.tar.bz2
angstrom-2007.9-test-20071018-powerpc-linux-toolchain.tar.bz2
angstrom-2007.9-test-20071018-powerpc-linux-uclibc-toolchain.tar.bz2

There's no way to see if the arm ones are armv4t, armv5te or armv6 and the powerpc ones
ppc405, ppc440 or ppc603e. For compiling 'hello world' that doesn't matter, but libc6.so
and libgcc_s.so will contain instruction not available on other cpus of that arch (e.g.
clz is not in armv4t), so your binary will probably not work on your device.

My idea is to use PACKAGE_ARCH (e.g. armv5te or ppc603e) instead of TARGET_ARCH.

Comments/hints/ideas?

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFHFyntMkyGM64RGpERAm+UAJsHn+2oCOjJoHlTxJ0o9SmSTP5bjQCffUcx
fNmkEs0chQ5uAtVAoxOsZ7c=
=gywh
-----END PGP SIGNATURE-----


