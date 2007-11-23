Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <k.kooi@student.utwente.nl>) id 1IvXUw-0002hE-0g
	for openembedded-devel@openembedded.org; Fri, 23 Nov 2007 13:19:06 +0100
Received: from Powerbook-2.local (vpn006010.vpn.utwente.nl [130.89.6.10])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	lANCGank012815 for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Nov 2007 13:16:37 +0100
Message-ID: <4746C4A5.6040501@student.utwente.nl>
Date: Fri, 23 Nov 2007 13:16:37 +0100
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.9 (Macintosh/20071031)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
References: <E1Iv6U0-0003D9-3S@linuxtogo.org>
In-Reply-To: <E1Iv6U0-0003D9-3S@linuxtogo.org>
X-Enigmail-Version: 0.95.5
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
Subject: Re: [oe-commits] org.oe.dev SlugOS: ixp4xx-kernel - added 2.6.23.8 recipe and supporting files. (Note that
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
X-List-Received-Date: Fri, 23 Nov 2007 12:19:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

mwester commit schreef:
> SlugOS: ixp4xx-kernel - added 2.6.23.8 recipe and supporting files.  (Note that
> SlugOS still selects 2.6.21 as the preferred version for now.)

Why am I forced to download a 40MB 2.6.23.8 tarball instead of the small
2.6.23.8 patch? I already have 2.6.23 in DL_DIR.

It's as easy as doing:

VANILLA_VERSION = "2.6.23"
KERNEL_VERSION = "2.6.23.8"


SRC_URI = "
${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${VANILLA_VERSION}.tar.bz2
\
${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/patch-${KERNEL_VERSION}.bz2;patch=1
\
"

in the recipe. I would have fixed it myself, but the huge block of
python magic in ixp4xx-kernel.inc scared me away.

- --
koen@dominion.kabel.utwente.nl will go go away in december 2007, please
use k.kooi@student.utwente.nl instead.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFHRsSlMkyGM64RGpERAv/KAJ0aMNK4ltbFd0ABHJKEYiezTHGJRQCgvODH
cZUTZIWcrGcSAFDURB7KtPU=
=V2AA
-----END PGP SIGNATURE-----


