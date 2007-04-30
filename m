Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1HiQtd-0002Ct-Lz
	for openembedded-devel@openembedded.org; Mon, 30 Apr 2007 10:06:10 +0200
Received: from [172.20.1.5] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l3U7utLr006029 for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Apr 2007 09:56:56 +0200
Message-ID: <4635A147.70203@dominion.kabel.utwente.nl>
Date: Mon, 30 Apr 2007 09:56:55 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.10 (Macintosh/20070221)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
References: <c384c5ea0704291440w16f8890cy29dbf336f26e850a@mail.gmail.com>
In-Reply-To: <c384c5ea0704291440w16f8890cy29dbf336f26e850a@mail.gmail.com>
X-Enigmail-Version: 0.94.2.0
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: RFC: Recent insane.bbclass / RPATH issues need attention
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
X-List-Received-Date: Mon, 30 Apr 2007 08:06:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Leon Woestenberg schreef:
> Hello,
> 
> the current insane.bbclass *behaviour* is bad (insane.bbclass itself is good!):
> 
> - insane.bbclass will detect invalid rpath and error (bitbake will bail out).
> - *however*, on a new bitbake run, no errors are reported and the
> build happily continues, *but* the invalid file is never
> staged/installed.

This is not limited to rpath issues or insane.bbclass, but happens with every class that
fiddles with PACKAGE_FUNCS.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFGNaFGMkyGM64RGpERAn8cAKCEmrZr0W/XJVENdYXrDTdLfiFyUQCbBqok
lQgL1qCchydp4umvc3XZm5o=
=+8nf
-----END PGP SIGNATURE-----


