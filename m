Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1HNmHV-0007T1-RI
	for openembedded-devel@openembedded.org; Sun, 04 Mar 2007 09:41:25 +0100
Received: from [172.20.1.5] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l248fELr011641 for <openembedded-devel@openembedded.org>;
	Sun, 4 Mar 2007 09:41:17 +0100
Message-ID: <45EA8629.8080804@dominion.kabel.utwente.nl>
Date: Sun, 04 Mar 2007 09:41:13 +0100
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.9 (Macintosh/20061207)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <1172977637.29516@gatekeeper.stellarwerx.com>
In-Reply-To: <1172977637.29516@gatekeeper.stellarwerx.com>
X-Enigmail-Version: 0.94.1.2
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: Fixing QA Errors?
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
X-List-Received-Date: Sun, 04 Mar 2007 08:41:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Mark Gollahon schreef:
> A question for the insane.bbclass developers - how do I go about fixing these errors?  Do we have any generalized information about what they mean (I can't find any on the wiki or via google...)?

There's not one definitive doc I can point you too. I can however show you an example on
how to solve the errors you are seeing.

> ERROR: QA Issue: non -dev package contains symlink .so: libqtaux2 path '/work/armv5te-angstrom-linux-gnueabi/libqtaux2-1.2.2-r0/install/libqtaux2/opt/QtPalmtop/lib/libqtaux2.so'

FILES_${PN}-dev += "/opt/QtPalmtop/lib/*.so"

> ERROR: QA Issue: non debug package contains .debug directory: libqtaux2 path /work/armv5te-angstrom-linux-gnueabi/libqtaux2-1.2.2-r0/install/libqtaux2/opt/QtPalmtop/lib/.debug/libqtaux2.so.1.0.0

FILES_${PN}-dbg += "/opt/QtPalmtop/lib/.debug"

I'm not sure if the first FILES statement is correct, since I don't know about qtopia
details, but the second one is correct.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFF6oYpMkyGM64RGpERAk03AJ46ZBPW0OOD9lRe0R0G0t1TF5I8JgCgpL3D
tbiDHrz0k37RqfzXAAU1csg=
=OzEM
-----END PGP SIGNATURE-----


