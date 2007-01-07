Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1H3dBZ-0000Q7-OF
	for openembedded-devel@openembedded.org; Sun, 07 Jan 2007 19:56:01 +0100
Received: from [172.20.1.5] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l07IsPox011758 for <openembedded-devel@lists.openembedded.org>;
	Sun, 7 Jan 2007 19:54:25 +0100
Message-ID: <45A141DF.40409@dominion.kabel.utwente.nl>
Date: Sun, 07 Jan 2007 19:54:23 +0100
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.9 (Macintosh/20061207)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <1168195833.5610.46.camel@localhost.localdomain>
In-Reply-To: <1168195833.5610.46.camel@localhost.localdomain>
X-Enigmail-Version: 0.94.1.2
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: Bitbake task dependency stamp handling
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
X-List-Received-Date: Sun, 07 Jan 2007 18:56:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Richard Purdie schreef:
> I had some interesting thoughts regarding tasks and their timestamps.
> Bitbake's current method of dealing with timestamps walks the task
> digraph structure which only knows about a single .bb file. The result
> is if you change an earlier task, say do_patch, later tasks like
> do_compile would rerun. If you rebuild gtk, the rest of your system
> linking to gtk doesn't rebuild though.
> 
> If we move away from the digraph which isn't really needed anymore,
> taskData has the complete dependency tree available to it and the option
> of rebuilding the whole system if you recompile gtk becomes possible.
> 
> At face value this sounds really useful. I'd guess that almost every OE
> developer would find it insanely annoying in practise though?

Annoying, maybe, correct behaviour, yes. Option for local.conf?

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFFoUHfMkyGM64RGpERApU6AKCHQ+UumH7Gw7rEbWbTb7fcW+wkzgCfRSbl
n/rabOe9dEZgkB4x617wYqo=
=jfo2
-----END PGP SIGNATURE-----


