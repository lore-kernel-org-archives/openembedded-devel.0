Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1HJGAy-0007QT-Hd
	for openembedded-devel@openembedded.org; Mon, 19 Feb 2007 22:36:00 +0100
Received: from [172.20.1.5] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l1JLZtLr006458 for <openembedded-devel@openembedded.org>;
	Mon, 19 Feb 2007 22:35:55 +0100
Message-ID: <45DA183B.1030303@dominion.kabel.utwente.nl>
Date: Mon, 19 Feb 2007 22:35:55 +0100
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.9 (Macintosh/20061207)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <F47741A9-D1BE-46CE-87C8-B146E956A280@gmx.net>
In-Reply-To: <F47741A9-D1BE-46CE-87C8-B146E956A280@gmx.net>
X-Enigmail-Version: 0.94.1.2
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-SpamScore: s
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: Let there be rock^insanity
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
X-List-Received-Date: Mon, 19 Feb 2007 21:36:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Holger Freyther schreef:
> Hi Freaks, Hi[1],


> The goal of this BitBake class, similiar to the fail-fast patchset  
> (remember CROSS COMPILE Badness?), is to increase quality and to find  
> issues at compile time before someone is shipping the first package  
> with easy and obvious issues.

> -) .la files
> 	All libtool file should under no circumstances point to the  
> $WORKDIR. This is a bug that should be fixed! And there is a lot to  
> be fixed. This can be either hacked with sed or some proper solution  
> I don't know.
> 
> 	For packaged and -native staged files installed should be set to yes  
> (installed=yes). E.g. installed=no is the wrong answer and shows an  
> error. So make sure that installed=yes is found
> 	For -native staged files there should be no trace to /usr/include
> 	For packaged files the libdir should be /usr/lib
> 
> 	Sadly there a lot of -native packages that need fixing, more than  
> one of us can handle alone.

A small sample of insanely broken .la files:

ERROR: QA issue: libltdl.la failed sanity test (reference to workdir or installed)
ERROR: QA issue: libSDL.la failed sanity test (reference to workdir or installed)
ERROR: QA issue: libgettextsrc.la failed sanity test (reference to workdir or installed)
ERROR: QA issue: libgettextpo.la failed sanity test (reference to workdir or installed)
ERROR: QA issue: libfreetype.la failed sanity test (reference to workdir or installed)
ERROR: QA issue: libglib-2.0.la failed sanity test (reference to workdir or installed)
ERROR: QA issue: libgmodule-2.0.la failed sanity test (reference to workdir or installed)
ERROR: QA issue: libgthread-2.0.la failed sanity test (reference to workdir or installed)
ERROR: QA issue: libgobject-2.0.la failed sanity test (reference to workdir or installed)
ERROR: QA issue: libdb-4.3.la failed sanity test (reference to workdir or installed)
ERROR: QA issue: libdbus-1.la failed sanity test (reference to workdir or installed)
ERROR: QA issue: libgdbm.la failed sanity test (reference to workdir or installed)
ERROR: QA issue: libORBitCosNaming-2.la failed sanity test (reference to workdir or installed)
ERROR: QA issue: libORBit-imodule-2.la failed sanity test (reference to workdir or installed)
ERROR: QA issue: libz.la failed sanity test (reference to workdir or installed)
ERROR: QA issue: libusbpp.la failed sanity test (reference to workdir or installed)
ERROR: QA issue: libfakeroot.la failed sanity test (reference to workdir or installed)
ERROR: QA issue: Everything_module.la failed sanity test (reference to workdir or installed)

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFF2hg7MkyGM64RGpERAsnXAKCy7qHDprSEKmg+bYrhuEN7YSXohQCghQ6Y
rH8wR2YzM4Q+wk9EKDDhc1k=
=KJk0
-----END PGP SIGNATURE-----


