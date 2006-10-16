Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1GZWiP-0000zS-Jc
	for openembedded-devel@openembedded.org; Mon, 16 Oct 2006 19:57:29 +0200
Received: from [172.20.1.6] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	k9GHoaZS017868 for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Oct 2006 19:50:39 +0200
Message-ID: <4533C686.8020600@dominion.kabel.utwente.nl>
Date: Mon, 16 Oct 2006 19:51:02 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.7 (Macintosh/20060909)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <1810005940.20061016180005@gmail.com>
	<1161020143.1649.80.camel@gandalf.tm.informatik.uni-frankfurt.de>
In-Reply-To: <1161020143.1649.80.camel@gandalf.tm.informatik.uni-frankfurt.de>
X-Enigmail-Version: 0.94.1.0
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: [RFC] Annotate machines with amount of RAM
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 16 Oct 2006 17:57:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Michael 'Mickey' Lauer schreef:

> Which features do we need to describe? At first glance, I could think
> about
> 
> VOLATILE_STORAGE_SIZE (RAM)
> NON_VOLATILE_STORAGE_SIZE (Flash, HD, etc.)
> DISPLAY_TYPE (Touchscreen or not)
> DISPLAY_RESOLUTION

and please let us not fall in to the same trap over and over again by ignoring DPI. My
a780 and h2200 are both qvga, but it's 100dpi versus 160dpi, which makes a huge difference.

> 
> We shouldn't stop here. With several groups working on device daemon
> standards towards interoperable platforms, it could make sense to
> describe
> 
> INPUT_METHODS
> 
> as well (buttons, keyboard, touchscreen, microphone).

MACHINE_FEATURES = "keyboard" exists :)

> 
> Last but not least GSM and (A)GPS should make its way into
> MACHINE_FEATURES pretty soon as well...

Right, I nuked smartphone-common.conf today and I was thinking how to funnel it into
task-base :)

regards,

Koen

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (Darwin)

iD8DBQFFM8aGMkyGM64RGpERAh9TAKCpyAJ33NZ66rfd5rl1qu7aQOZJ2QCeNgN7
OImzQ9bzBfcmsO6cF+v4DRM=
=sxZi
-----END PGP SIGNATURE-----


