Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1IR3uo-0006xe-P3
	for openembedded-devel@openembedded.org; Fri, 31 Aug 2007 12:39:51 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l7VAbo1R010943 for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Aug 2007 12:37:51 +0200
Message-ID: <46D7EFA8.4000902@dominion.kabel.utwente.nl>
Date: Fri, 31 Aug 2007 12:38:32 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 2.0.0.6 (Macintosh/20070728)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <200708311033.06903.openembedded@hrw.one.pl>
In-Reply-To: <200708311033.06903.openembedded@hrw.one.pl>
X-Enigmail-Version: 0.95.3
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: disapproval of revision	'4fb1a7447c5d8ace96a5ac6358c7fe10f0d951c4'
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
X-List-Received-Date: Fri, 31 Aug 2007 10:39:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Marcin Juszkiewicz schreef:
> Koen Kooi added ARM Crunch patchset into GCC to get EP39xx FPU support. 
> Looks like it was not tested before commit as this change broke all ARM 
> builds with gcc produced "fatal error: internal consistency failure".
> 
> I reverted that addon and bumped gcc/gcc-cross PR so people will get 
> working toolchain again.

Yeah, sorry about that, I compiled some simple apps, which worked, but the patchset turned
out to mess with gcc internals as well, so you have beaten me by 2 hours with reverting
it. Sorry about the mess.

FWIW, angstrom-minimal-image for c7x0/glibc works[1] with crunch patches and gcc 4.2.1

regards,

Koen

[1] Okay it fails with 'ln: creating symbolic link
`/media/hda4/OE/build/tmp-new/angstrom/rootfs/usr/lib/ipkg/info' to `/usr/dpkg/info': No
such file or directory', but that's a rootfs_deb problem ;)

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFG1++oMkyGM64RGpERApSEAJ9du7AOVUHqsfwh59N17mutp4DA3ACbBQJt
DcpoAOnANU7c9BVYPEC2PkM=
=4Mlv
-----END PGP SIGNATURE-----


