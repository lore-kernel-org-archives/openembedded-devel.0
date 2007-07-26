Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1IE4bL-0001pw-Or
	for openembedded-devel@openembedded.org; Thu, 26 Jul 2007 16:46:03 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l6QEid1R015219 for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Jul 2007 16:44:39 +0200
Message-ID: <46A8B354.1010204@dominion.kabel.utwente.nl>
Date: Thu, 26 Jul 2007 16:44:36 +0200
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
Subject: [RFC] use packages/linux/linux-ezx-2.6.21/update_patches.sh for openmoko kernels
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
X-List-Received-Date: Thu, 26 Jul 2007 14:46:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi,

Currently openmoko kernel pull patches from svn and manually apply them with quilt. We've
seen numerous breakages in the past with this method, so I would like to suggest using
something like update_patches.sh to pull a patchset from svn, add them to OE and
automagically write out a SRC_URI.

This would have the following benefits:

1) patches don't suddenly change
2) less breakage due to typos in commits upstream
3) less work than continuously checking if recipe and svn patchset match
4) less surprises when using a global SRCDATE

And since it's a script, it's not more work than the status quo.

what do you think?

regards,

Koen

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFGqLNUMkyGM64RGpERAlC6AJ0btokth/4QsBlCEjMr1NEhN/p7KACfTUrj
o81SXUP+yWRuBVDO0HmADhI=
=+Yu8
-----END PGP SIGNATURE-----


