Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1GxRhY-0000O1-F5
	for openembedded-devel@openembedded.org; Thu, 21 Dec 2006 18:27:28 +0100
Received: from [172.20.1.5] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	kBLHOsox029041 for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Dec 2006 18:24:55 +0100
Message-ID: <458AC366.3030405@dominion.kabel.utwente.nl>
Date: Thu, 21 Dec 2006 18:24:54 +0100
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
Subject: [RFC] Enable tune-thumb.inc for all armv5t and armv6t machines
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
X-List-Received-Date: Thu, 21 Dec 2006 17:27:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi,

Today I seperated the thumb bits from conf/machine/include/ipx4xx.conf into
conf/machine/include/. I'd like to enable for all >=v5t machines, but I'm unsure about
using positive or negative logic.

* positive logic: might break for (soft)fpa distros that don't disable it, no problem for
EABI distros
* negative logic: no difference to status quo, but having negative logic in tune-* files
feels a bit wrong.

If you need numbers: http://ewi546.ewi.utwente.nl/tmp/thumb/comparison.txt (package:
<thumb size> <regular size> (<unit>))

what do you all think?

regards,

Koen

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFFisNmMkyGM64RGpERAuh4AKC8UlGx15HTLJFrqRY9HKJoM1iKXACdEznx
VN+VBxsPrhMx8p6cOVGIgwg=
=tUsi
-----END PGP SIGNATURE-----


