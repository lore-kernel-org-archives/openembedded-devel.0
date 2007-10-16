Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <k.kooi@student.utwente.nl>) id 1Ihna5-00061Z-N4
	for openembedded-devel@openembedded.org; Tue, 16 Oct 2007 16:39:37 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l9GDuc98012822 for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Oct 2007 15:56:41 +0200
Message-ID: <4714C315.9000508@student.utwente.nl>
Date: Tue, 16 Oct 2007 15:56:37 +0200
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.6 (Macintosh/20070728)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
X-Enigmail-Version: 0.95.3
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
Subject: no-distro goal and SRCREV=1 in bitbake.conf
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
X-List-Received-Date: Tue, 16 Oct 2007 14:39:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi,

SRCREV=1 in bitbake.conf forces people to use a distro, which is bad(TM) according to the
OEDEM minutes.

My short term solution:

* SRCREV = "${@bb.fetch.get_srcrev(d)}" in bitbake.conf
* SRCREV ?= <foo> in recipes
* SRCREV_pn-baz ?= <bar> in distro includes or local.conf

For the medium and long term we should consider adding snapshot recipes for 'proven'
revisions next to the 'floating' ones, even if Richard thinks it's a waste of space.
Having a host of 'unbreak me' includes is also against our 'sane defaults' goal we decided
on at OEDEM.

Comments/ideas/flames?

regards.

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFHFMMVMkyGM64RGpERAnjyAJ4qhiSNb0dO0XofGTXLikEl0/S/7ACfbyh/
i/npADW1CSXewDrpG7UqYuI=
=uV5n
-----END PGP SIGNATURE-----


