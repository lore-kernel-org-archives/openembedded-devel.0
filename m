Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1I1cko-00050i-8b
	for openembedded-devel@openembedded.org; Fri, 22 Jun 2007 08:36:22 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l5M6WQUg020062; Fri, 22 Jun 2007 08:32:27 +0200
Message-ID: <467B6CFB.6050600@dominion.kabel.utwente.nl>
Date: Fri, 22 Jun 2007 08:32:27 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 2.0.0.4 (Macintosh/20070604)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
References: <E1I1arL-0003eT-FM@linuxtogo.org>
In-Reply-To: <E1I1arL-0003eT-FM@linuxtogo.org>
X-Enigmail-Version: 0.95.0
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Cc: Michael Lauer <mickey@vanille-media.de>
Subject: Re: [oe-commits] org.oe.dev uboot-gta01:
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
X-List-Received-Date: Fri, 22 Jun 2007 06:36:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

mickeyl commit schreef:
> uboot-gta01:
> * remove tools build


> packages/uboot/u-boot-mkimage-gta01-native_oe.bb

Could you please add this one back? It's a static version that has all needed patches in
OE *and* is needed by various non-openmoko recipes. The linux_*.bb recipes now don't build
anymore because they are depending in u-boot-mkimage-gta01-native_oe.bb.
u-boot-mkimage-gta01-native_oe.bb is the only recipe that can reliably create a
uboot-mkimage since uboot-utils is broken beyond repair....


regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFGe2z7MkyGM64RGpERAmN5AKCEG9pfCd6YocX9Jai0TeKm7Fw9MwCeJR0v
049EvO5qYi8l1FAyiOrw8hs=
=xwMw
-----END PGP SIGNATURE-----


