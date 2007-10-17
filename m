Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <k.kooi@student.utwente.nl>) id 1IiCIL-0006QX-No
	for openembedded-devel@openembedded.org; Wed, 17 Oct 2007 19:02:59 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l9HGuDUx010325 for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Oct 2007 18:56:14 +0200
Message-ID: <47163EAF.7040000@student.utwente.nl>
Date: Wed, 17 Oct 2007 18:56:15 +0200
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
Subject: COMPILE_FEATURES?
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
X-List-Received-Date: Wed, 17 Oct 2007 17:03:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

[18:50] koen: hrw: MACHINE_FEATURES = "thumb", yes or no?
[18:50] koen: ehm
[18:51] hrw: koen: arm-thumb you mean?
[18:51] koen: COMBINED_FEATURES
[18:51] koen: afaik there is only one thumb
[18:51] koen: like iwmmxt
[18:51] hrw: koen: and all arms newer then arm4 supports it...
[18:51] koen: armv4
[18:52] koen: my goal is to be able to flag certain package (e.g. samba) to build with
thumb like we do with iwmmxt now
[18:53] hrw: time for COMPILE_FEATURES maybe?
[18:53] hrw: COMPILE_FEATURES = "thumb iwmmxt"
[18:53] hrw: or ARCH_FEATURES
[18:53] koen: that starts to look an awfull lot like use flags, though

any ideas how we can draft a standard way to solve problems like this both compile time
and package time?

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFHFj6uMkyGM64RGpERAjF1AJ9Mcag6hqeZPTUS845IpFNNxXB1rgCeM1hI
ceuQr0BTK+4CA8wHedroSl0=
=CajS
-----END PGP SIGNATURE-----


