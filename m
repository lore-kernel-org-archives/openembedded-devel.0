Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <k.kooi@student.utwente.nl>) id 1JM0D9-0007qz-L9
	for openembedded-devel@openembedded.org; Mon, 04 Feb 2008 13:14:07 +0100
Received: from Powerbook-2.local (vpn006017.vpn.utwente.nl [130.89.6.17])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	m14CEDnr025871 for <openembedded-devel@lists.openembedded.org>;
	Mon, 4 Feb 2008 13:14:13 +0100
Message-ID: <47A70195.5060205@student.utwente.nl>
Date: Mon, 04 Feb 2008 13:14:13 +0100
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.9 (Macintosh/20071031)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
References: <47A3720F.1060303@miromico.ch>
In-Reply-To: <47A3720F.1060303@miromico.ch>
X-Enigmail-Version: 0.95.6
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	servicedesk@icts.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
Subject: Re: Solution for AVR32 kernel link problem
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
X-List-Received-Date: Mon, 04 Feb 2008 12:14:10 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Alex schreef:
| Hi
|
| I played around with OE for AVR32.
|
| I think I found a solution for the kernel linking problem.

<snip>

Great catch! This also fixes the build of alsa, it is applied in OE now.

|
| Finally, I couldn't test it, as I can't boot the kernel. Something is
| wrong with my load address and entry point. It is set to 0x20008000. I
| tried to
| add UBOOT_ENTRYPOINT = "90000000" to atngw100.conf and just recompile
| the kernel by "bitbake virtual/kernel -c clean" and "bitbake
| virtual/kernel".
| This didn't change the entry point, but maybe I have to recompile
| everything..

For my ngw with uboot from git (3 week old) the following works:

mkimage -A avr32 -O linux -T kernel -C none -a 0x10000000 -e 0x90000000
- -n 'koen 24rcgit' -d arch/avr32/boot/images/vmlinux.bin uImage

I changed linux.inc and atngw100.conf to allow the loadadress to be
different from the entry point.

regards,

Koen

- --
koen@dominion.kabel.utwente.nl will go go away in december 2007, please
use k.kooi@student.utwente.nl instead.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFHpwGVMkyGM64RGpERAtxkAKCnqnup+rV12sisqk8oMO7hkxYfogCdGTFG
zlIWKrqpDk8Tx8kQeoCvzE4=
=eIAw
-----END PGP SIGNATURE-----


