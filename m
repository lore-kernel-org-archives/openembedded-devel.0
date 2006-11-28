Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1Gp7oP-0000xy-1e
	for openembedded-devel@openembedded.org; Tue, 28 Nov 2006 19:36:09 +0100
Received: from [172.20.1.5] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	kASIZpLr024046 for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Nov 2006 19:35:51 +0100
Message-ID: <456C8186.3060007@dominion.kabel.utwente.nl>
Date: Tue, 28 Nov 2006 19:35:50 +0100
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.8 (Macintosh/20061025)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <20061127200352.B109E4014BB@tinman.treke.net>
In-Reply-To: <20061127200352.B109E4014BB@tinman.treke.net>
X-Enigmail-Version: 0.94.1.2
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: [oe-issues] [Bug 1583] hostap-fw-load doesn't work with bash
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
X-List-Received-Date: Tue, 28 Nov 2006 18:36:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

[bugtracker is having troubles with the rainy weather]

bugzilla-daemon@tinman.treke.net schreef:
> http://bugs.openembedded.org/show_bug.cgi?id=1583
> 
> 
> 
> 
> 
> ------- Comment #1 from openembedded@hrw.one.pl  2006-11-27 12:03 -------
> Can you try with bash 3.2 which I pushed into .dev?
> 
> Similar script works on my desktop with bash 3.1.

It doesn't:

root@h2200:~# ifup wlan0
/etc/network/if-pre-up.d/hostap-fw-load: line 4: [: too many arguments
[snip]
root@h2200:~# sh --version
GNU bash, version 3.2.5(1)-release (arm-angstrom-linux-gnueabi)
Copyright (C) 2005 Free Software Foundation, Inc.
root@h2200:~#

But changing line 4 to:

if [ -n "`cat /proc/net/wireless|grep $IFACE`" ]; then

silences the error message (extra quotes around ``)

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFFbIGGMkyGM64RGpERAoKnAJ9a/PHZhdWlNorHfP0gSNgYq+pPzwCfZ/G+
RXCS/IsvRIfWqJUm5lFzuv4=
=2Vj4
-----END PGP SIGNATURE-----


