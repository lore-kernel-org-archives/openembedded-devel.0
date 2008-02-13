Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <k.kooi@student.utwente.nl>) id 1JPH6r-0006Jt-Fi
	for openembedded-devel@openembedded.org; Wed, 13 Feb 2008 13:53:09 +0100
Received: from Powerbook-2.local (vpn006035.vpn.utwente.nl [130.89.6.35])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	m1DCrJnr021297 for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Feb 2008 13:53:20 +0100
Message-ID: <47B2E83E.9090209@student.utwente.nl>
Date: Wed, 13 Feb 2008 13:53:18 +0100
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.9 (Macintosh/20071031)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
References: <200802131340.02616.mickey@vanille-media.de>
In-Reply-To: <200802131340.02616.mickey@vanille-media.de>
X-Enigmail-Version: 0.95.6
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	servicedesk@icts.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
Subject: Re: tinylogin vs. busybox
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
X-List-Received-Date: Wed, 13 Feb 2008 12:53:09 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Michael 'Mickey' Lauer schreef:
| I just realized that we are still using tinylogin which has bugs and
is dead.
| Newer busybox releases contain all the functionality. Anyone know a
| compelling reason to keep using tinylogin as the default in task-base? If
| not, I'd like to switch to busybox (after changing its defconfig) soon.

Using busybox as login requires it being setuid root, with all the nasty
security implications stemming from that. I don't think OE should force
people to only have one user ('root') on their systems, since that is
exactly what your proposed change would mean.
However, I have no objection to enabling login functionality in busybox.

So:

* keep tinylogin
* don't make busybox setuid root
* update defconfig

regards,

Koen

- --
koen@dominion.kabel.utwente.nl will go go away in december 2007, please
use k.kooi@student.utwente.nl instead.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFHsug+MkyGM64RGpERAihfAKCn2Vlva94cL6G/+eYLezttWkhADwCfYtgC
s8GPomq+b0MqLThl2ZVjxUQ=
=t8V1
-----END PGP SIGNATURE-----


