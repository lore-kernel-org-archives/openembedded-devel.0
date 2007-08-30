Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1IQeLp-0004LH-Gd
	for openembedded-devel@openembedded.org; Thu, 30 Aug 2007 09:22:01 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l7U7K41R012680; Thu, 30 Aug 2007 09:20:05 +0200
Message-ID: <46D66FCB.2090308@dominion.kabel.utwente.nl>
Date: Thu, 30 Aug 2007 09:20:43 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 2.0.0.6 (Macintosh/20070728)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
X-Enigmail-Version: 0.95.3
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Commits from company keys
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
X-List-Received-Date: Thu, 30 Aug 2007 07:22:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi,

Since yesterday we have a key in our db for a company, so that their development team can
use to push patches without having to all have their personal key.

Since that clashes with our "one key maps to one person" policy from the past, people
using those keys _*MUST*_ use 'mtn commit <foo> --author "theirrealemail@address.com"'.
That way it is clear which _person_ made that commit.

If you forget it, you can always sign that revision with your personal key (-k
your@keyid.org) and push with the company key, since permission checks are based on _who_
pushes, not on the author of the commits.

If a company keeps refusing to use --author the OE core team should re-evaluate the
presence of the key.

regards,

Koen

PS: the diffs from said company itself look awesome at the moment, but aren't retracable
to a person.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFG1m/LMkyGM64RGpERAgzPAJ9/tYjOBcyA5gQ+kFebjZGb3HzxmwCgnDyM
d++z29jLmb0rLILdrQwy/S0=
=MjPO
-----END PGP SIGNATURE-----


