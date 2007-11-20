Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <k.kooi@student.utwente.nl>) id 1IuSEl-0002TJ-RT
	for openembedded-devel@openembedded.org; Tue, 20 Nov 2007 13:29:55 +0100
Received: from Powerbook-2.local (vpn006015.vpn.utwente.nl [130.89.6.15])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	lAKCRiZn020972 for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Nov 2007 13:27:44 +0100
Message-ID: <4742D2C0.7090805@student.utwente.nl>
Date: Tue, 20 Nov 2007 13:27:44 +0100
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.9 (Macintosh/20071031)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
References: <20071119120819.GA17788@lenovo>	<47419EA0.4030308@student.utwente.nl>	<4742217C.9060506@whitby.id.au>	<4742AFCC.1060000@student.utwente.nl>
	<4742C0FB.1010101@whitby.id.au>
In-Reply-To: <4742C0FB.1010101@whitby.id.au>
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
X-List-Received-Date: Tue, 20 Nov 2007 12:29:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Rod Whitby schreef:
> Koen Kooi wrote:
>> Rod Whitby schreef:
>>> Show how you can use bitbake such that you can cd into a build area, and
>>> type a *single* bitbake command to do a build, then cd into a different
>>> build area (with a different distro and machine)
>> Why are you using a different build area for that? That's unnecessary.
> 
> Um, when the MokoMakefile was created, it *was* necessary to have a
> different build area.  

No it wasn't. I've been using this setup since long before openmoko
existed. I started using it when I was comparing familiar and openzaurus
builds when Mickeyl was still OZ release master.

> Isn't the creator of the OpenMoko build environment an OE core team
> member?  Does the OpenMoko build environment setup documentation follow
> your prescription for TMPDIR and multimachine?

Mickey was and is an OE core developer, but all the other core members
have been appalled by the implementation of the OM env described in
their wiki (to mention a few: hardcoding BUILD_ARCH and replacing
/usr/bin/svn with a script).
As proven multiple times on the OE-devel list, the OM wiki has bad
practices for using OE. At the last OEDEM we coined 'Mo(c)kumentation'
to describe it.



- --
koen@dominion.kabel.utwente.nl will go go away in december 2007, please
use k.kooi@student.utwente.nl instead.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFHQtLAMkyGM64RGpERAimVAKCRGKb3XX5X3hK1OczvzMs16OAiEgCfbFfi
4QzzYg6Tzp+yXXoxkDfQRA0=
=6UN1
-----END PGP SIGNATURE-----


