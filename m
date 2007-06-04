Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1Hv95z-000566-FL
	for openembedded-devel@openembedded.org; Mon, 04 Jun 2007 11:43:27 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l549fGLr009626 for <openembedded-devel@openembedded.org>;
	Mon, 4 Jun 2007 11:41:16 +0200
Message-ID: <4663DE3E.3050507@dominion.kabel.utwente.nl>
Date: Mon, 04 Jun 2007 11:41:18 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 2.0.0.0 (Macintosh/20070326)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <eed7f0160706040138y6a777b6ay86b8237c3462373c@mail.gmail.com>
In-Reply-To: <eed7f0160706040138y6a777b6ay86b8237c3462373c@mail.gmail.com>
X-Enigmail-Version: 0.95.0
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: Gumstix machine support
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
X-List-Received-Date: Mon, 04 Jun 2007 09:43:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Tom Cooksey schreef:
> Over the last few months I've been looking for an alternative to
> buildroot for the gumstix devices (www.gumstix.com). After giving up
> on Gentoo, I thought I'd have a go with OpenEmbedded. After reading
> through the documentation I realized what I needed to do was create a
> gumstix.conf in conf/machine, only to find one already there!
> 
> So my question is, how far along is gumstix support in OE and is it
> being supported/maintained? 

Till 30 minutes ago it was pretty broken :) It should build if you set DISTRO=angstrom-2007.1
Someone with more experience with gumstix hardware should have a look at MACHINE_FEATURES
and decide if we need a seperate configs for the different gumstix boards.

> I've had a good look through the
> gumstix.conf which is there and it all looks right (although I'm an
> uber OE newbie at the moment!)
> 
> Finally, the bitbake manual seems to neglect to mention the "?="
> operator in chapter 2. A kind chap on irc confirmed that ?= assigns a
> value to a variable if one has not already been set. 

Right

regards,

Koen

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFGY94+MkyGM64RGpERAkL3AKC87DTAMlDDD99Zkg2LZ+dZPBNfngCghLCS
C6HtThVSz5CrZU5AIAh5tj8=
=+J/D
-----END PGP SIGNATURE-----


