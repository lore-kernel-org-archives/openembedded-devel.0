Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <k.kooi@student.utwente.nl>) id 1JIIqA-0003SF-9d
	for openembedded-devel@openembedded.org; Fri, 25 Jan 2008 08:19:06 +0100
Received: from Powerbook-2.local (vpn006015.vpn.utwente.nl [130.89.6.15])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	m0P7J4nr016643 for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Jan 2008 08:19:04 +0100
Message-ID: <47998D68.2090607@student.utwente.nl>
Date: Fri, 25 Jan 2008 08:19:04 +0100
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.9 (Macintosh/20071031)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
References: <47977B09.2060107@dominion.kabel.utwente.nl>
	<47992AD2.7040805@kernelconcepts.de>
In-Reply-To: <47992AD2.7040805@kernelconcepts.de>
X-Enigmail-Version: 0.95.6
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	servicedesk@icts.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
Subject: Re: AVR32 branch merged
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
X-List-Received-Date: Fri, 25 Jan 2008 07:19:06 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Florian Boor schreef:
| Hi,
|
| Koen Kooi wrote:
|> The avr32 branch Stelios and I have worked on for the past year or so
|> has been merged to .dev.
|
| cool - that's great news. Many thanks to you guys!
|
|> Known problems:
|>
|> ~ * kernel fails to link (workaround: use ld from atmel binary toolchain)
|
| Uh nasty, we do not have the sources of that toolchain, right?

We have *a* source of that toolchain, but that removes the -nmo-pic
option from gcc, which the kernel still uses[1]. I also have tried to
the the latest atmel binutils code drop, but that refuses to build, and
I haven't worked up the motivation to start applying OE patches one by
one to see if those help.

|> This merge includes an avr32 optimized mplayer and a patched
|> xserver-kdrive for people with an lcd attached to their avr32 boards.
|
| Even better, I guess its time to get my LCD working :)

And for me to have the stk1000 unbricked :/

regards,

Koen

PS: uboot doesn't like jffs2+lzo, so be carefull where you load you
uImage from.

[1] http://dominion.thruhere.net/koen/cms/fun-with-vendor-patches-part-2

- --
koen@dominion.kabel.utwente.nl will go go away in december 2007, please
use k.kooi@student.utwente.nl instead.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFHmY1oMkyGM64RGpERArVYAJ0Tt8ENB/MnSmDyYE7suEr8BmgoJwCgp2KB
DSbUtgih65PlT+z1Uzn99Jw=
=54oF
-----END PGP SIGNATURE-----


