Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1IJxbO-0004q7-Se
	for openembedded-devel@openembedded.org; Sat, 11 Aug 2007 22:30:27 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l7BKUH1R023378 for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Aug 2007 22:30:19 +0200
Message-ID: <46BE1C53.5060003@dominion.kabel.utwente.nl>
Date: Sat, 11 Aug 2007 22:30:11 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 2.0.0.6 (Macintosh/20070728)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
X-Enigmail-Version: 0.95.3
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Using a compiler for a different target_os
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
X-List-Received-Date: Sat, 11 Aug 2007 20:30:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi,

The official[1] way of building a blackfin toolchain is:

* build a bfin-elf gcc (TARGET_ARCH = bfin, TARGET_OS = elf)
* use bfin-elf to compile a uclinux-uclibc uclibc (TARGET_ARCH = bfin, TARGET_OS =
uclinux-uclibc)

Is there a clean way (assuming multimachine has been inherited) to reuse the 'wrong'
toolchain for the uclibc build?

regards,

Koen

[1] According to various blackfin.uclinux.org gurus, but I have a feeling it can be done
otherwise (i.e. I have a static-flat uclibc build done the OE way).
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFGvhxTMkyGM64RGpERAqXvAJ9kJo1Sd8mSEmFX3jLkHLpNuNCLogCffUsE
ISH0XQBdRVCjqrmhBngcxVQ=
=WwNs
-----END PGP SIGNATURE-----


