Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1HXD0F-0000JS-Do
	for openembedded-devel@openembedded.org; Fri, 30 Mar 2007 11:02:35 +0200
Received: from [130.89.137.166] (wlan137166.mobiel.utwente.nl [130.89.137.166])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l2U92ULr012417 for <openembedded-devel@openembedded.org>;
	Fri, 30 Mar 2007 11:02:30 +0200
Message-ID: <460CD224.7050005@dominion.kabel.utwente.nl>
Date: Fri, 30 Mar 2007 11:02:28 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.10 (Macintosh/20070221)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <18310385162.20070330115222@gmail.com>
In-Reply-To: <18310385162.20070330115222@gmail.com>
X-Enigmail-Version: 0.94.2.0
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: [RFC] Solving ipkg-utils issues
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
X-List-Received-Date: Fri, 30 Mar 2007 09:02:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Paul Sokolovsky schreef:
> Hello openembedded-devel,
> 
>   For quite some time bugs in ipkg-utils package (mostly in
> ipkg-make-index tool) plagued image creation process in OE. Many of
> them are known to old-time developers, and being (manually) worked
> around. I was working on resolving them for some time, and guess now
> finally have both clear picture of the issues and their interaction
> with each other, and fixes for them. So, I would like to push these
> fixes to mainline, and am opening this thread for review of
> them, as well as to collect any other concerns about ipkg-utils.
> 
>   In my list, there're 3 major issues:
> 
> 1. Broken version comparison logic in ipkg-utils (note that this is
> exactly ipkg-utils issues, nether bitbake nor ipkg is affected).
> 
> 2. Inability of ipkg-make-index to detect packages which were updated,
> while version stays the same.

It's hard to distinguish between 'update' and 'data corruption' without knowing if someone
rebuilt the package.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFGDNIkMkyGM64RGpERAhhLAKCN5l2e+MELHVIBsMfLNujKTVM3hwCeJLzu
M5vId3I51zd6AaX98qwWAmI=
=/GV6
-----END PGP SIGNATURE-----


