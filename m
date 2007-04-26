Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1HhC0Y-0001E6-DZ
	for openembedded-devel@openembedded.org; Fri, 27 Apr 2007 00:00:14 +0200
Received: from [172.20.1.5] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l3QLpGLr016207 for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Apr 2007 23:51:16 +0200
Message-ID: <46311ED5.7020909@dominion.kabel.utwente.nl>
Date: Thu, 26 Apr 2007 23:51:17 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.10 (Macintosh/20070221)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <c384c5ea0704261001x7756fd58yc637a6b1aec12440@mail.gmail.com>	<4630FBDF.2060004@dominion.kabel.utwente.nl>	<c384c5ea0704261258j74fae9c0m5a764ab356b6e139@mail.gmail.com>
	<c384c5ea0704261350h1e63e73cx7475aa512a4e21e6@mail.gmail.com>
In-Reply-To: <c384c5ea0704261350h1e63e73cx7475aa512a4e21e6@mail.gmail.com>
X-Enigmail-Version: 0.94.2.0
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: HEADS UP: insane.bbclass will now detect and stop the	build on wrong RPATHs.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 26 Apr 2007 22:00:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Leon Woestenberg schreef:
> After some work, I couldn't get chrpath-native nor chrpath-cross to
> deal with the target's ELF file (x86_64 host, i686 target):
> 
> ./chrpath -l /home/leon/sandbox/e520/openembedded/build/tmp/work/i686-angstrom-linux/glibc-2.5-r5/install/glibc-dbg/usr/bin/.debug/localedef
> `/home/leon/sandbox/e520/openembedded/build/tmp/work/i686-angstrom-linux/glibc-2.5-r5/install/glibc-dbg/usr/bin/.debug/localedef'
> probably isn't a 64-bit LSB-first ELF file.
> elf_open: Exec format error
> 
> although koen reported success with his host/target combo.

I suspect it will work if your bits are the same (32, 64, etc) and possibly endiannes.

> Now, for the moment, should we change insane.bbclass to indicate a
> warning instead of an error on illegal RPATHs?

IMO the question is "Do we want to subject (angstrom) users to insane.bbclass?". I don't
have an answer to that.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFGMR7VMkyGM64RGpERAkVNAJ0V87eLBTSzCac+FUflc5j7RNL6wACfTdfW
6/p6Nd25aTL2KB1LIj2sPmA=
=Bjiy
-----END PGP SIGNATURE-----


