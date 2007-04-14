Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1HceJy-0001ki-BL
	for openembedded-devel@openembedded.org; Sat, 14 Apr 2007 11:13:26 +0200
Received: from [172.20.1.5] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l3E9DMox022438 for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Apr 2007 11:13:22 +0200
Message-ID: <46209B2D.4060902@dominion.kabel.utwente.nl>
Date: Sat, 14 Apr 2007 11:13:17 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.10 (Macintosh/20070221)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
X-Enigmail-Version: 0.94.2.0
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Cairo 1.4.4
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
X-List-Received-Date: Sat, 14 Apr 2007 09:13:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi,

Cairo 1.4.4 was just released containing a ton of bugfixes, but I urge you not to add it
to OE. We applied Jorn's surface-cache patch throughout the 1.3.x and 1.4.x series to get
a big performance boost on most of our platforms, but with cairo 1.4.4 the patch breaks
compilation.

But there's hope! Behdad sent this email to cairo-dev last night:
http://lists.freedesktop.org/archives/cairo/2007-April/010348.html

So it looks like 1.4.6 will have a surface-cache that will give us about the same
performance as 1.4.2 + patch.

So in order to avoid surprised for unsuspecting users, I propose to skip 1.4.4 and wait
for 1.4.6.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFGIJsiMkyGM64RGpERAh9oAKCFUWQAztm/DGj5WFCpVDsLDPV4CACcCee5
KfYwB7v3y3deAkzjVFJPrpE=
=QuGK
-----END PGP SIGNATURE-----


