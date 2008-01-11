Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <k.kooi@student.utwente.nl>) id 1JDERM-0005y6-PP
	for openembedded-devel@openembedded.org; Fri, 11 Jan 2008 08:36:32 +0100
Received: from Powerbook-2.local (vpn006012.vpn.utwente.nl [130.89.6.12])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	m0B7aHfr017180 for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Jan 2008 08:36:18 +0100
Message-ID: <47871C71.5020800@student.utwente.nl>
Date: Fri, 11 Jan 2008 08:36:17 +0100
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.9 (Macintosh/20071031)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
X-Enigmail-Version: 0.95.6
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	servicedesk@icts.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
Subject: mtn disapprove
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
X-List-Received-Date: Fri, 11 Jan 2008 07:36:33 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

~From the commit messages:

- --
Zaurus machine config: fix code for creation of installkit for collie
* remove the code from collie config.  It is present in collie-2.6.inc
- --

That is factually correct, however instead of collie-2.6.inc you mean
zaurus-2.6.inc. Lets see:

koen@bitbake:~/OE/.dev/conf/machine$ grep require collie.conf
require conf/machine/include/collie-${MACHINE_KERNEL_VERSION}.inc
require conf/machine/include/tune-strongarm.inc
koen@bitbake:~/OE/.dev/conf/machine$ grep include collie.conf
require conf/machine/include/collie-${MACHINE_KERNEL_VERSION}.inc
require conf/machine/include/tune-strongarm.inc
koen@bitbake:~/OE/.dev/conf/machine$ grep require include/collie-2.*
koen@bitbake:~/OE/.dev/conf/machine$ grep include include/collie-2.*
koen@bitbake:~/OE/.dev/conf/machine$

Collie doesn't include zaurus-2.6.inc, which is why I added the code to
collie-2.6.inc a while ago so it would actually make an installkit,
which you broke now. Since I want an installkit (I wrote the installkit
code for that reason) I disapproved that commit.


- --
koen@dominion.kabel.utwente.nl will go go away in december 2007, please
use k.kooi@student.utwente.nl instead.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFHhxxxMkyGM64RGpERAjMwAJ9hLuwaCm7LczNWhE6ZxfGuOTeP2wCfUlDB
QSKivkNms6TjC/7CFL2g43g=
=TAlG
-----END PGP SIGNATURE-----


