Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <k.kooi@student.utwente.nl>) id 1IcdaE-0004Q4-BG
	for openembedded-devel@openembedded.org; Tue, 02 Oct 2007 10:58:26 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l928rF98000407 for <openembedded-devel@openembedded.org>;
	Tue, 2 Oct 2007 10:53:15 +0200
Message-ID: <470206FD.5090508@student.utwente.nl>
Date: Tue, 02 Oct 2007 10:53:17 +0200
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.6 (Macintosh/20070728)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <47008E79.6020502@compulab.co.il>	<19c1b8a90710010049y49effab8j739ecd884686199@mail.gmail.com>
	<4700B47F.4090802@student.utwente.nl>
In-Reply-To: <4700B47F.4090802@student.utwente.nl>
X-Enigmail-Version: 0.95.3
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
Subject: Re: tune-iwmmx vs tune-xscale
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
X-List-Received-Date: Tue, 02 Oct 2007 08:58:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Koen Kooi schreef:
> Khem Raj schreef:
>> tune-iwmmx.conf would be more appropriate
> 
> Actually, no. There are still problems left with things randomly segfaulting when
> compiling everything with iwmmxt, so in OE we only activate iwmmxt for packages that
> benefit from and and prove to be stable (e.g. mplayer).

For added whitespace-damaged google-juice:

#build with support for the iwmmxt instruction support (pxa270 and up)
MY_ARCH := "${PACKAGE_ARCH}"
PACKAGE_ARCH = "${@base_contains('MACHINE_FEATURES', 'iwmmxt', 'iwmmxt', '${MY_ARCH}',d)}"

MY_TARGET_CC_ARCH := "${TARGET_CC_ARCH}"
TARGET_CC_ARCH = "${@base_contains('MACHINE_FEATURES', 'iwmmxt', '-march=iwmmxt
- -mtune=iwmmxt', '${MY_TARGET_CC_ARCH}',d)}"
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFHAgb9MkyGM64RGpERArUnAJ9NgWjgkuebxm99tbeNOPPG97NsKwCgnE25
aRFsayv73s/QenRMOmHs3VQ=
=aXBX
-----END PGP SIGNATURE-----


