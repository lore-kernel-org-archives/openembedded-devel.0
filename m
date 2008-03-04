Received: from [130.89.2.12] (helo=mx.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <k.kooi@student.utwente.nl>) id 1JWaQV-0000fM-5s
	for openembedded-devel@openembedded.org; Tue, 04 Mar 2008 17:55:44 +0100
Received: from Powerbook-2.local (vpn006038.vpn.utwente.nl [130.89.6.38])
	by mx.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id m24GrNXs010824
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 4 Mar 2008 17:53:24 +0100
Message-ID: <47CD7E84.9010603@student.utwente.nl>
Date: Tue, 04 Mar 2008 17:53:24 +0100
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.12 (Macintosh/20080213)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
References: <1204303564.8126.38.camel@dax.rpnet.com>
In-Reply-To: <1204303564.8126.38.camel@dax.rpnet.com>
X-Enigmail-Version: 0.95.6
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	servicedesk@icts.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-SA-Exim-Connect-IP: 130.89.2.12
X-SA-Exim-Mail-From: k.kooi@student.utwente.nl
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: OE Staging ABI Change Warning
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
X-List-Received-Date: Tue, 04 Mar 2008 16:55:44 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Richard Purdie schreef:
| Hi,
|
| OE.dev is now just about ready to switch to using sysroot. The compilers
| have been updated to activate sysroot and the fixes I/Poky have for
| various pkgconfig issues have been committed. The final change is to
| actually change the layout.
|
| I've attached the patch I have locally for doing this. Since it changes
| the layout of staging I've gone for changing the ABI and warning users
| using the newly added mechanism.
|
| insane.bbclass will warn about potentially problematic .pc files and I
| suspect a few people will hit that since there are a lot of broken ones
| around. I'll give a summary of the problem and the way to solve it:

When are we going to make insane halt on .la files referring to
${WORKDIR}? Right now those are the biggest problem for packaged-staging
and rm_work.

regards,

Koen
- --
koen@dominion.kabel.utwente.nl will go go away in december 2007, please
use k.kooi@student.utwente.nl instead.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFHzX6DMkyGM64RGpERAuy8AJ4xZS1LJgLstnz6NjEg3Tw3QPkHXgCcDBUw
Ffldpcorfw2FpBT52t9YfWA=
=btjD
-----END PGP SIGNATURE-----


