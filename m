Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <k.kooi@student.utwente.nl>) id 1J3UVY-0006AF-94
	for openembedded-devel@openembedded.org; Sat, 15 Dec 2007 11:44:36 +0100
Received: from Powerbook-2.local (vpn006059.vpn.utwente.nl [130.89.6.59])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	lBFAds0k030836 for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Dec 2007 11:39:54 +0100
Message-ID: <4763AEFA.5030707@student.utwente.nl>
Date: Sat, 15 Dec 2007 11:39:54 +0100
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.9 (Macintosh/20071031)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
X-Enigmail-Version: 0.95.5
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
Subject: Native vs cross confusion
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
X-List-Received-Date: Sat, 15 Dec 2007 10:44:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi,

The past few weeks we uncovered a few recipes (qmake2-native,
apache2-native) in OE that are arch specific, but inherit native instead
of cross. The problem with inheriting native.bbclass in such cases makes
the build multimachine unsafe.
There is not one solution for all of them, qmake2 can be fixed by
installing all the spec files or inheriting cross, apache2-native can be
fixed by installing to STAGING_BINDIR_NATIVE or inheriting cross, etc, etc.
This also means that the RFC for uboot-utils needs to get changed, as I
pointed out in my reply to that.

regards,

Koen

- --
koen@dominion.kabel.utwente.nl will go go away in december 2007, please
use k.kooi@student.utwente.nl instead.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFHY676MkyGM64RGpERApYnAKC4Lt5p1wYDIuAjan10z+HPOmAGAwCeIqul
Fr6KvG7AVu+mRgRtWJxSZVs=
=rkCE
-----END PGP SIGNATURE-----


