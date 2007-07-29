Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1IF4dl-0001JW-8W
	for openembedded-devel@openembedded.org; Sun, 29 Jul 2007 11:00:47 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l6T8x0j1015489 for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Jul 2007 10:59:01 +0200
Message-ID: <46AC56D0.80004@dominion.kabel.utwente.nl>
Date: Sun, 29 Jul 2007 10:58:56 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 2.0.0.5 (Macintosh/20070716)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
X-Enigmail-Version: 0.95.2
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Packaged-staging v2
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
X-List-Received-Date: Sun, 29 Jul 2007 09:00:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi,

Last year we had a google SoC to implement packaged-staging. The resulting .bbclass worked
for the small subset of recipes in the branch, but not for .dev. After a while we realised
that multithreaded bitbake kills the current implementation.

During last OEDEM, FOSDEM and GUADEC Richard and I discussed the problems at hand:

a) the 'extra' data in staging (shlibs, pkgdata, etc) needs to get packaged as well
b) fake stamps need to get injected
c) recipes should have a way to mark which entries from PACKAGES are needed when there are
heavily granulated
d) staging needs to be locked during packaging and population
e) cross/ needs to get packaged as well

Preferably package format agnostic :)

Poky recently gained support building an sdk toolchain and using that as the OE cross
toolchain later on ("Poor mans packaged-staging"). We can solve e) using that.

I'd like to ask for some advice and input on how to solve the problems in a clean way.

regards,

Koen

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFGrFbQMkyGM64RGpERAtUmAJwN1dBqoRac1FH+bKnn6Ul2UqCj8gCfVEDL
p7qwFWZaGgMB7k1otTLXSRk=
=6RDJ
-----END PGP SIGNATURE-----


