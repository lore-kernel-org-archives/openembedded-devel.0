Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1GLyXn-0001aJ-Lt
	for openembedded-devel@openembedded.org; Sat, 09 Sep 2006 10:50:31 +0200
Received: from [172.20.1.6] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	k898lIkO022602 for <openembedded-devel@openembedded.org>;
	Sat, 9 Sep 2006 10:47:19 +0200
Message-ID: <45027F94.5080705@dominion.kabel.utwente.nl>
Date: Sat, 09 Sep 2006 10:47:16 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.5 (Macintosh/20060719)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@openembedded.org>
References: <200609062324.33029.christopher.lang@plus.cablesurf.de>
	<20060909025533.GA4524@twibble.org>
In-Reply-To: <20060909025533.GA4524@twibble.org>
X-Enigmail-Version: 0.94.0.0
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: error: #error "TLS support is required." while building glibc-initial-2.4 on x86_64
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 09 Sep 2006 08:50:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Jamie Lenehan schreef:
> On Wed, Sep 06, 2006 at 11:24:32PM +0200, Christopher Lang wrote:
>> I tried to start a fully renewed oe build system today with bitbake 1.6 and up 
>> to date oe checkout. I am using minimal distro/machine files. 
>> While building bootstrap-image/glibc-initial-2.4 on an x86_64 (AMD X2) machine 
>> for TARGET_ARCH = "i586" I get the following error:
> 
> You need to use make 3.81 to build glibc 2.4 for x86 targets on x86_64.
> 
> I've added make 3.81 to OE (by copying all the 3.80 releated make
> files to 3.81 versions - no changes necessary) and then do a "bitbake
> make-native" prior to building rather than update the host version of
> make.

Are there any nasty side-effects of update to 3.81? If not, could you commit it?

regards,

Koen

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (Darwin)

iD8DBQFFAn+UMkyGM64RGpERAhY9AJwJwaK3y+6e7uS3zoAZLv54lFNRvgCgslGZ
pOtvGXFNV/JOxnAwFHQwKyI=
=QrH5
-----END PGP SIGNATURE-----


