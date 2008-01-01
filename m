Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <k.kooi@student.utwente.nl>) id 1J9kl9-00025F-8f
	for openembedded-devel@openembedded.org; Tue, 01 Jan 2008 18:18:35 +0100
Received: from Powerbook-2.local (vpn006027.vpn.utwente.nl [130.89.6.27])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	m01HC9fr027041 for <openembedded-devel@lists.openembedded.org>;
	Tue, 1 Jan 2008 18:12:11 +0100
Message-ID: <477A7469.4060904@student.utwente.nl>
Date: Tue, 01 Jan 2008 18:12:09 +0100
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.9 (Macintosh/20071031)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
References: <E1J9k05-00006v-OV@linuxtogo.org>
In-Reply-To: <E1J9k05-00006v-OV@linuxtogo.org>
X-Enigmail-Version: 0.95.5
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
Subject: Re: [oe-commits] org.oe.dev gpsd: Provide working default configuration and init-script for fic-gta01. This makes gpsd	device-specific for gta01, please check the feeds.
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
X-List-Received-Date: Tue, 01 Jan 2008 17:18:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

coredump2 commit schreef:
> gpsd: Provide working default configuration and init-script for fic-gta01. This makes gpsd device-specific for gta01, please check the feeds.

the (recently renamed) machine_id function exists for a reason. gta0* is
runtime detectable, so no reason to hardcode it at buildtime. And if
people insist on buildtime hardcodes, but the stuff in ${PN}-conf or
something.

- --
koen@dominion.kabel.utwente.nl will go go away in december 2007, please
use k.kooi@student.utwente.nl instead.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFHenRpMkyGM64RGpERAjztAJ4nPr9CmM7O3lBj8C/UOmrBDEdv3wCgsx6C
ViBarcTWDPu136ztHVCr178=
=m7d8
-----END PGP SIGNATURE-----


