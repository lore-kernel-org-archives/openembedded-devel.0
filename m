Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <k.kooi@student.utwente.nl>) id 1JDFPx-0007gD-LK
	for openembedded-devel@openembedded.org; Fri, 11 Jan 2008 09:39:11 +0100
Received: from Powerbook-2.local (vpn006012.vpn.utwente.nl [130.89.6.12])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	m0B8cp0k004126 for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Jan 2008 09:38:52 +0100
Message-ID: <47872B1A.9010400@student.utwente.nl>
Date: Fri, 11 Jan 2008 09:38:50 +0100
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.9 (Macintosh/20071031)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
References: <47871C71.5020800@student.utwente.nl> <fm79ef$hak$1@ger.gmane.org>
In-Reply-To: <fm79ef$hak$1@ger.gmane.org>
X-Enigmail-Version: 0.95.6
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	servicedesk@icts.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
Subject: Re: mtn disapprove
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
X-List-Received-Date: Fri, 11 Jan 2008 08:39:13 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Rolf Leggewie schreef:
| Koen Kooi schrieb:
|> however instead of collie-2.6.inc you mean zaurus-2.6.inc.
|
| of course.  Sorry about the glitch.  I believe I have made the correct
| change in 6794aa0dd1ca646be71cc57651a883ac99f55985, now.  Thanks for
| spotting it.
|
| While we are at it, let's try and clean the situation up a bit.
|
| * Is there any reason not to let zaurus-2.6.inc do what it suggests to
|   be doing and delegate all clamshell stuff to zaurus-clamshell.inc?
|   poodle.conf already requires zaurus-2.6.inc despite not being a
|   clamshell model.  Let's make the changes necessary so that collie
|   can require it as well and then delete the double entry for the
|   installkit code from collie-2.6.inc.
| * I am pretty sure the poodle line in collie.conf is incorrect.
| * poodle-2.6.inc seems to be unused, can it be dropped?
|
| Koen, are these basically sane proposals?

It's the thing I had in mind, but never worked up the motivation of
doing :) Copy/pasting it into collie-2.6.conf was never meant as a
long-term solution.

| If so, I would prepare an mtn diff for inspection before committing.

Yeah, since Richard and Marcin need to see it first.

regards

Koen

- --
koen@dominion.kabel.utwente.nl will go go away in december 2007, please
use k.kooi@student.utwente.nl instead.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFHhysaMkyGM64RGpERAk+CAJ0byZDw9/ChfIX8ix0rIgiOMYsO/wCgksb1
se8EgVkLjsnEppGQbCa7rzI=
=BeZ2
-----END PGP SIGNATURE-----


