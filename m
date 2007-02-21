Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1HJxwm-0008CH-93
	for openembedded-devel@openembedded.org; Wed, 21 Feb 2007 21:20:17 +0100
Received: from [172.20.1.5] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l1LKKALr030219 for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Feb 2007 21:20:10 +0100
Message-ID: <45DCA97A.8000701@dominion.kabel.utwente.nl>
Date: Wed, 21 Feb 2007 21:20:10 +0100
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
Subject: RFC: stop mounting /dev/mtdblockX but mount mtdX (without /dev) instead
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
X-List-Received-Date: Wed, 21 Feb 2007 20:20:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi,

Chris Ball from the OLPC project was kind (and patient) enough to explain the first item
of http://www.linux-mtd.infradead.org/archive/tech/faq.html to me.

It seems that most machines in OE with MTD have something like:

/dev/mtdblock2  /               jffs2   defaults        1  1
/dev/mtdblock3  /home   	jffs2   defaults        1  1

in their fstab, which apparently is wrong. The trick to understanding the FAQ entry is not
to think in terms of actual devices and controllers, but in terms of fstab. So 'block
devices' translate to the emulated block devices present as /dev/mtdblockX and 'mtd'
refers to mtdX.

The correct fstab should be:

mtd2  /         jffs2   defaults        1  1
mtd3  /home   	jffs2   defaults        1  1

I don't know which kernel version introduced it, but it seems to work on 2.6.16.

What do you think?

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFF3Kl6MkyGM64RGpERAhiaAKCdBvq8lwBfM2lzzt+vGS28KcY1VwCeNgvN
Fyi+w99uUA+KF2bZOdDLBq0=
=bELj
-----END PGP SIGNATURE-----


