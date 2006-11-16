Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1GkhFK-0001oX-Vn
	for openembedded-devel@openembedded.org; Thu, 16 Nov 2006 14:25:39 +0100
Received: from [172.20.0.22] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	kAGDNHLr018595 for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Nov 2006 14:23:18 +0100
Message-ID: <455C6643.1020607@dominion.kabel.utwente.nl>
Date: Thu, 16 Nov 2006 14:23:15 +0100
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.8 (Macintosh/20061025)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@openembedded.org>
X-Enigmail-Version: 0.94.1.2
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: perl tries to run './miniperl' on cross builds
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
X-List-Received-Date: Thu, 16 Nov 2006 13:25:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi,

Since (approx.) yesterday the perl build fails with:

|
LD_LIBRARY_PATH=/data/build/koen/OE/build/tmp/angstrom/work/armv4t-angstrom-linux-gnueabi/perl-5.8.7-r21/perl-5.8.7
./miniperl -Ilib configpm --heavy=lib/Config_heavy.pl configpm.tmp
| /bin/sh: ./miniperl: cannot execute binary file

Which isn't a surprise:
miniperl: ELF 32-bit LSB executable, ARM, version 1 (SYSV), for GNU/Linux 2.6.14,
dynamically linked (uses shared libs), not stripped

Before I go off filing a bug, has anyone else seen this?

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFFXGZDMkyGM64RGpERArGGAJ9pMaJAbPwa0fcc5BzUdPjJIOzgygCgp2XF
sottjzHbHyhUQcv++Hgr5GM=
=Cpe9
-----END PGP SIGNATURE-----


