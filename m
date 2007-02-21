Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1HJzwK-0006aB-Hv
	for openembedded-devel@openembedded.org; Wed, 21 Feb 2007 23:27:56 +0100
Received: from [172.20.1.5] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l1LMRsLr016799 for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Feb 2007 23:27:54 +0100
Message-ID: <45DCC76A.7000002@dominion.kabel.utwente.nl>
Date: Wed, 21 Feb 2007 23:27:54 +0100
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.9 (Macintosh/20061207)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@openembedded.org>
X-Enigmail-Version: 0.94.1.2
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: QA issues with pkgconfig files
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
X-List-Received-Date: Wed, 21 Feb 2007 22:27:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi,

I was trying to fix some of the problems insane.bbclass reported and noticed that the
problem was somewhere else. Lets look at the following:

NOTE: QA checking staging
ERROR: QA issue: xproto.pc failed sanity test (reference to /usr/include or workdir)

So, let's find the file .pc file, bitbake.conf says export PKG_CONFIG_PATH =
"${STAGING_DATADIR}/pkgconfig":

koen@bitbake:/data/build/koen/OE/build/tmp/angstrom/staging/powerpc-angstrom-linux$ cat
./share/pkgconfig/xproto.pc
prefix=/data/build/koen/OE/build/tmp/angstrom/staging/powerpc-angstrom-linux/lib/..
exec_prefix=/data/build/koen/OE/build/tmp/angstrom/staging/powerpc-angstrom-linux/lib/..
libdir=/data/build/koen/OE/build/tmp/angstrom/staging/powerpc-angstrom-linux/lib
includedir=/data/build/koen/OE/build/tmp/angstrom/staging/powerpc-angstrom-linux/include
includex11dir=/data/build/koen/OE/build/tmp/angstrom/staging/powerpc-angstrom-linux/include/X11

Name: Xproto
Description: Xproto headers
Version: 7.0.5
Cflags: -I${includedir}


Weird, that looks ok, why is insane.bbclass complaining? Lets search some more:


oen@bitbake:/data/build/koen/OE/build/tmp/angstrom/staging/powerpc-angstrom-linux$ find .
- -name xproto.pc
./lib/pkgconfig/xproto.pc
./share/pkgconfig/xproto.pc


Aha! xproto doesn't honour PKG_CONFIG_PATH and installs it in ${libdir}/pkgconfig. Lets
look at that file:

koen@bitbake:/data/build/koen/OE/build/tmp/angstrom/staging/powerpc-angstrom-linux$ cat
./lib/pkgconfig/xproto.pc
prefix=/usr
exec_prefix=/usr
libdir=/usr/lib
includedir=/usr/include
includex11dir=/usr/include/X11

Name: Xproto
Description: Xproto headers
Version: 7.0.5
Cflags: -I${includedir}

Gotcha! That's the culprit! Now, how should we fix this mess?

Possible solutions:

1) set PKG_CONFIG_PATH to ${STAGING_LIBDIR}/pkgconfig
   +easy fix
   -requires to re-run do_pupulate_staging for all packages
2) symlink one dir to the other
   +fixes hardcoded paths
   -requires manual intervention to fixup files present and/or complete rebuild
3) have pkgconfig.bbclass delete one dir each run
   -requires every packages that has .pc files to inherit pkgconfig
   -ugly
   -error-prone

Do you have any other solutions, and if not, which solution do you prefer?

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFF3MdqMkyGM64RGpERArytAKCGbcHVcRSzYG8v/mxH0mNdtkIIJgCfTpZA
VO3zSiJekWoJWe8DDWFmtRw=
=FvI8
-----END PGP SIGNATURE-----


