Received: from [130.89.2.12] (helo=mx.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <k.kooi@student.utwente.nl>) id 1JWrup-0002sg-VI
	for openembedded-devel@openembedded.org; Wed, 05 Mar 2008 12:36:09 +0100
Received: from Powerbook-2.local (vpn006013.vpn.utwente.nl [130.89.6.13])
	by mx.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id m25BYYXs005919
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 5 Mar 2008 12:34:39 +0100
Message-ID: <47CE854A.7060200@student.utwente.nl>
Date: Wed, 05 Mar 2008 12:34:34 +0100
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.12 (Macintosh/20080213)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <47CBAD93.3080005@student.utwente.nl>
In-Reply-To: <47CBAD93.3080005@student.utwente.nl>
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
Subject: Re: [RFC] upgrading webkit-gtk SRCREV and switch to autotools
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
X-List-Received-Date: Wed, 05 Mar 2008 11:36:09 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Koen Kooi schreef:
| Hi,
|
| For some months now I have a patch that switches webkit-gtk to use
| autotools instead of qmake, enable svg features and prepares it for
| video and gps support. I also have recipes ready for newer versions of
| Midori and Epiphany, and want to add one for web-webkit as well.
|
| To get all that to work, webkit-gtk needs a newer SRCREV.
|
| The problem with that is that two unmaintained[1], but widely used
| applications will break: openmoko-browser2 and openmoko-feedreader2
|
| So my proposal is this:
|
| * update webkit SRCREV
| * switch to autofoo
| * remove openmoko-{browser, feedreader}2 from task-*
|
| If noone objects I'll implement this tomorrow.

Webkit has been updated and switched to autotools, midori, epiphany and
openmoko-browser2 have been updated to build against it, feed-reader2
has been removed from task-openmoko-pim.bb till it gets updated.
All needed patched have either come from upstream or have been sent there.

regards,

Koen

- --
koen@dominion.kabel.utwente.nl will go go away in december 2007, please
use k.kooi@student.utwente.nl instead.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFHzoVJMkyGM64RGpERAhMXAJ9LycgHhNLTxl15n1PK23j9X6j9+wCgl+bF
g8046Gy1g19DH1yUt6GP9bE=
=HTL5
-----END PGP SIGNATURE-----


