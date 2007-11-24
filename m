Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <k.kooi@student.utwente.nl>) id 1Ivycn-0002XU-Th
	for openembedded-devel@openembedded.org; Sat, 24 Nov 2007 18:17:01 +0100
Received: from Powerbook-2.local (vpn006010.vpn.utwente.nl [130.89.6.10])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	lAOHEOiq017053 for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Nov 2007 18:14:25 +0100
Message-ID: <47485BF2.8080404@student.utwente.nl>
Date: Sat, 24 Nov 2007 18:14:26 +0100
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.9 (Macintosh/20071031)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
References: <200711232126220000@3074922013>
In-Reply-To: <200711232126220000@3074922013>
X-Enigmail-Version: 0.95.5
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
Subject: Re: [oe-commits] org.oe.dev xserver-kdrive-common: use Xglamo for g ta02, remove some of the bogus Xserver checks
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
X-List-Received-Date: Sat, 24 Nov 2007 17:17:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Graeme Gregory schreef:
> Aaargh please dont do this, Xglamo isnt fit to be default yet.

Ok, I altered it slightly:

* Things runtime depending on ${XSERVER} (e.g. task-openmoko, x11-image)
get both Xglamo and Xfbdev
* Xfbdev is used by default, but one only needs to uncomment one line in
/etc/X11/Xserver to switch to Xglamo

This should give future users something stable and developers an easy
way to experiment with Xglamo.

regards,

Koen

- --
koen@dominion.kabel.utwente.nl will go go away in december 2007, please
use k.kooi@student.utwente.nl instead.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFHSFvyMkyGM64RGpERAsZ5AJ4k2xUYEZ2VRaCHnf/SqG2JoYZu2QCdHjaf
zXnvpytL8XCCcd+JhVt5UTA=
=+TF8
-----END PGP SIGNATURE-----


