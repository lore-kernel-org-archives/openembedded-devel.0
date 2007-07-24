Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1IDL6T-0002zW-45
	for openembedded-devel@openembedded.org; Tue, 24 Jul 2007 16:11:09 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l6OE9uj1004458 for <openembedded-devel@openembedded.org>;
	Tue, 24 Jul 2007 16:09:57 +0200
Message-ID: <46A60832.30203@dominion.kabel.utwente.nl>
Date: Tue, 24 Jul 2007 16:09:54 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 2.0.0.5 (Macintosh/20070716)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <E1IDL1e-0002ro-9i@linuxtogo.org>
In-Reply-To: <E1IDL1e-0002ro-9i@linuxtogo.org>
X-Enigmail-Version: 0.95.2
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: mtn disapprove d7758e2637918ff4035244d64fb7227f6cf833ad, was Re: [oe-commits] org.oe.dev phoneserver: Add patch for FIC GTA01	support.
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
X-List-Received-Date: Tue, 24 Jul 2007 14:11:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

florian commit schreef:

> +PACKAGE_ARCH = "${MACHINE}"

This has to stop, OE is usable without setting MACHINE. The correct form is either

PACKAGE_ARCH = "${MACHINE_ARCH}"

or by setting SRC_URI_OVERRIDES_PACKAGE_ARCH (see base.bbclass) appropriately

regards,

Koen

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFGpggyMkyGM64RGpERAvw+AKCY9ytYPx1zFTw7aljuDG3cc50RLgCeLaEU
tWzfaAUTRB99Ls3CNcDAcbY=
=Vx2C
-----END PGP SIGNATURE-----


