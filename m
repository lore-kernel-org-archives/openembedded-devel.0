Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1HItS5-0000AV-5T
	for openembedded-devel@openembedded.org; Sun, 18 Feb 2007 22:20:11 +0100
Received: from [172.20.1.5] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l1ILK3ox014135 for <openembedded-devel@openembedded.org>;
	Sun, 18 Feb 2007 22:20:03 +0100
Message-ID: <45D8C301.200@dominion.kabel.utwente.nl>
Date: Sun, 18 Feb 2007 22:20:01 +0100
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.9 (Macintosh/20061207)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <2accc2ff0702181229p739ebee1ke3ea6c6264cf9b0f@mail.gmail.com>
In-Reply-To: <2accc2ff0702181229p739ebee1ke3ea6c6264cf9b0f@mail.gmail.com>
X-Enigmail-Version: 0.94.1.2
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: Trying to package Appweb 2.1.0
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
X-List-Received-Date: Sun, 18 Feb 2007 21:20:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Nelson Castillo schreef:
> Hi.
> 
> We've been trying to package Appweb 2.1.0. This package works
> (We haven't thought of PHP5).
> 
> We tried to get rid of /usr/mime.types in the commented code that
> follows but we could not.
> 
> #FILES_${PN} += " /etc/appWeb/appWeb.conf /etc/appWeb/mime.types"
> FILES_${PN} += " /usr/appWeb.conf /usr/mime.types"

/etc (or rather ${sysconfdir}) always gets includes, so you need to override FILES_${PN}
('=') instead of appending to it ('+=').

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFF2MMBMkyGM64RGpERAj2WAKCaIJjJKJiObVDVBoNifK+gnz17YACgklt5
7e6iiJ1pwUMJ8+vCIL/6PWo=
=TIdH
-----END PGP SIGNATURE-----


