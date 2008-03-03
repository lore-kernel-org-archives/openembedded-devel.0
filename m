Received: from [130.89.2.13] (helo=mx.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <k.kooi@student.utwente.nl>) id 1JW5S3-0005G3-W9
	for openembedded-devel@openembedded.org; Mon, 03 Mar 2008 08:51:21 +0100
Received: from Powerbook-2.local (vpn006015.vpn.utwente.nl [130.89.6.15])
	by mx.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id m237neQp010001
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 3 Mar 2008 08:49:44 +0100
Message-ID: <47CBAD93.3080005@student.utwente.nl>
Date: Mon, 03 Mar 2008 08:49:39 +0100
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.12 (Macintosh/20080213)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
X-Enigmail-Version: 0.95.6
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	servicedesk@icts.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-SA-Exim-Connect-IP: 130.89.2.13
X-SA-Exim-Mail-From: k.kooi@student.utwente.nl
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [RFC] upgrading webkit-gtk SRCREV and switch to autotools
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
X-List-Received-Date: Mon, 03 Mar 2008 07:51:22 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi,

For some months now I have a patch that switches webkit-gtk to use
autotools instead of qmake, enable svg features and prepares it for
video and gps support. I also have recipes ready for newer versions of
Midori and Epiphany, and want to add one for web-webkit as well.

To get all that to work, webkit-gtk needs a newer SRCREV.

The problem with that is that two unmaintained[1], but widely used
applications will break: openmoko-browser2 and openmoko-feedreader2

So my proposal is this:

* update webkit SRCREV
* switch to autofoo
* remove openmoko-{browser, feedreader}2 from task-*

If noone objects I'll implement this tomorrow.

regards,

Koen

[1] I've mailed Holger at least twice (starting 20071208) asking him to
update them, but no response.

- --
koen@dominion.kabel.utwente.nl will go go away in december 2007, please
use k.kooi@student.utwente.nl instead.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFHy62TMkyGM64RGpERAtcCAJ9r9JFjEi2nCg0VAyrp8i0v7PnhZQCgkrlB
5YuaKCo+4Edd2t4bexh11b4=
=vO5d
-----END PGP SIGNATURE-----


