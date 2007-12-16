Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <k.kooi@student.utwente.nl>) id 1J3rfB-00037I-NR
	for openembedded-devel@openembedded.org; Sun, 16 Dec 2007 12:28:05 +0100
Received: from Powerbook-2.local (vpn006053.vpn.utwente.nl [130.89.6.53])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	lBGBNIfr005805 for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Dec 2007 12:23:19 +0100
Message-ID: <47650AA7.6080806@student.utwente.nl>
Date: Sun, 16 Dec 2007 12:23:19 +0100
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.9 (Macintosh/20071031)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <4764EDFB.9000801@whitby.id.au>	<1323505412.20071216120459@gmail.com>
	<4764F92F.3090602@whitby.id.au>
In-Reply-To: <4764F92F.3090602@whitby.id.au>
X-Enigmail-Version: 0.95.5
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
Subject: Re: [ANN] New 'base-image' created (Was: [RFC] Add ipkg to minimal image)
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
X-List-Received-Date: Sun, 16 Dec 2007 11:28:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Rod Whitby schreef:
> Paul Sokolovsky wrote:
>> Sunday, December 16, 2007, 11:20:59 AM, you wrote:
>>> It is required to always be small enough to fit in the internal flash of
>>> an NSLU2 (as an example of the smaller end of flash sizes that OE
>>> supports).
>>   So, how little size did you achieve?
> 
> Not as small as I would like.  I did it using standard task-boot and a
> couple of task-base packages, rather than do a custom package set up-front.

I suspect the 'stretch' OE has to generate tiny rootfs images using
standard recipes has been a bit exhausted. We should have a look at the
packages themselves, e.g. slimming down busybox and uclibc, as well as
using busybox as init and login to remove the need to sysvinit and
tinylogin (security issues aside).
Once the OE testlab comes online we can see what certain images contain,
how big the individual packages are, and more importantly, how those
change over time.

regards,

Koen

- --
koen@dominion.kabel.utwente.nl will go go away in december 2007, please
use k.kooi@student.utwente.nl instead.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFHZQqnMkyGM64RGpERAuXIAJ0bsws9G4gIYKwSJuir2LP7SHWtCgCcDPaN
JIExyRh2Y7FWid5M74GVxI8=
=xY/D
-----END PGP SIGNATURE-----


