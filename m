Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <k.kooi@student.utwente.nl>) id 1IuPuT-0004Og-2J
	for openembedded-devel@openembedded.org; Tue, 20 Nov 2007 11:00:49 +0100
Received: from Powerbook-2.local (vpn006015.vpn.utwente.nl [130.89.6.15])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	lAK9wanH004030 for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Nov 2007 10:58:37 +0100
Message-ID: <4742AFCC.1060000@student.utwente.nl>
Date: Tue, 20 Nov 2007 10:58:36 +0100
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.9 (Macintosh/20071031)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <20071119120819.GA17788@lenovo>	<47419EA0.4030308@student.utwente.nl>
	<4742217C.9060506@whitby.id.au>
In-Reply-To: <4742217C.9060506@whitby.id.au>
X-Enigmail-Version: 0.95.5
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
Subject: Re: Getting Started -Makefile
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
X-List-Received-Date: Tue, 20 Nov 2007 10:00:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Rod Whitby schreef:

> Show how you can use bitbake such that you can cd into a build area, and
> type a *single* bitbake command to do a build, then cd into a different
> build area (with a different distro and machine)

Why are you using a different build area for that? That's unnecessary.
Just do something like

TMPDIR = "/OE/tmp/${DISTRO}"

in site.conf. If your distro is a bit behind the times and doesn't use
multimachine add:

INHERIT += "multimachine"

No need for seperate build areas. If you use angstrom you can even
switch C library ([e]glibc vs uclibc), as outlined in
http://www.angstrom-distribution.org/building-angstrom
You can even have per distro tweaks using include statements, but I'll
leave that as an exercise to the reader. No need for seperate build
areas. At all.


- --
koen@dominion.kabel.utwente.nl will go go away in december 2007, please
use k.kooi@student.utwente.nl instead.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFHQq/MMkyGM64RGpERApx4AJwLiQrVBbGDGlrdVfN8P6TzUl5u+wCfZIH8
YaWoQ3YzbtknQqu5sJ44Ito=
=PlQ1
-----END PGP SIGNATURE-----


