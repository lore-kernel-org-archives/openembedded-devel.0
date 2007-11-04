Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <k.kooi@student.utwente.nl>) id 1Ioaia-00026Q-0V
	for openembedded-devel@openembedded.org; Sun, 04 Nov 2007 09:20:28 +0100
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	lA48JoUx005654 for <openembedded-devel@lists.openembedded.org>;
	Sun, 4 Nov 2007 09:19:51 +0100
Message-ID: <472D80A7.7010508@student.utwente.nl>
Date: Sun, 04 Nov 2007 09:19:51 +0100
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.6 (Macintosh/20070728)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
References: <472D296B.5020506@gmx.net>
In-Reply-To: <472D296B.5020506@gmx.net>
X-Enigmail-Version: 0.95.5
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
Subject: Re: debian package names with deb packaging
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
X-List-Received-Date: Sun, 04 Nov 2007 08:20:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Robert Schuster schreef:
> Hi,
> when I build a recipe whose package needs gtk+ at runtime I would expect
> that the depends line in the control file says libgtk2.0-0 when using
> the debian.bbclass (as well as package_deb.bbclass). Instead the line
> contains an entry saying "gtk+ (>= some version)".
> 
> Is this a known issue? File a bug? More info needed?

The gtk+ recipe in OE generate a gtk+ packages, not a libgtk+ package:
http://www.angstrom-distribution.org/repo/?name=gtk%2B&arch=&action=search

It's only a bug if you want 1:1 mapping with debian instead of
debian-style renaming :)

regards,

Koen

> 
> Regards
> Robert
> 
> 
> 
> ------------------------------------------------------------------------
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


- --
koen@dominion.kabel.utwente.nl will go go away in december 2007, please
use k.kooi@student.utwente.nl instead.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFHLYBpMkyGM64RGpERAouaAKCXgduErNEiUl1A9fQc55ceCpaNagCff34y
uacNUML7MpaaeAqXUUFYniU=
=2SLb
-----END PGP SIGNATURE-----


