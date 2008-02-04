Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <k.kooi@student.utwente.nl>) id 1JLxwd-0004nK-7K
	for openembedded-devel@openembedded.org; Mon, 04 Feb 2008 10:48:55 +0100
Received: from Powerbook-2.local (vpn006017.vpn.utwente.nl [130.89.6.17])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	m149mttS005412 for <openembedded-devel@lists.openembedded.org>;
	Mon, 4 Feb 2008 10:48:56 +0100
Message-ID: <47A6DF88.7010204@student.utwente.nl>
Date: Mon, 04 Feb 2008 10:48:56 +0100
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.9 (Macintosh/20071031)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <1201823499.20311.26.camel@localhost.localdomain>	<20080203210353.438dffaf@cimmeria>	<47A6D3C2.10304@kernelconcepts.de>
	<47A6D6E6.4030700@whitby.id.au>
In-Reply-To: <47A6D6E6.4030700@whitby.id.au>
X-Enigmail-Version: 0.95.6
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	servicedesk@icts.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
Subject: Re: Monotone issues
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
X-List-Received-Date: Mon, 04 Feb 2008 09:48:55 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Rod Whitby schreef:
|> Graeme Gregory schrieb:
|>> Sounds like it is time for our regular re-assessment of the use
|>> of monotone. Maybe we should start another round of testing other
|>> SCM systems again.
|
| Let's just cut to the chase and discuss why we're not using git ...

1) git couldn't import the flat-file OE tree, neither could cogito
2) git 1.4 just threw away your local changes on what git calls a 'merge'
3) it has no sense of 'time' inside commits
4) it is lossy
5) it has no guarantee against man-in-the-middle or filesystem corruption.
6) You can't attach attributes (e.g. QA results) to revisions
7) You can't store empty directories in git (ask Holger about the pain)

To expand on 5: Monotone uses rsa to ensure two things:

1) the tree is uncorrupted (in the sense of bad disks)
2) the tree is trusted

With git you say 'my tree has 6767e' and I say 'my tree has 9090d' and
we have no idea of what went wrong or where it went wrong, just that our
trees don't match.

To expand on 4:

Git was designed to cater people that send each other patches over a
mailinglist that rot for a few weeks till a new 'merge window' opens,
the current tree is basically thrown away and you have to put your
patches on top of a new release.

That is why we didn't use git in the past, things could be very
different now.

And we all have to keep in mind that OE is the odd one out in the SCM
worlds, since we have about 25 small commits per day on files that have
a really short lifetime, not 1 change per week to main.c. This is one of
the reasons why monotone is so slow for us.

regards,

Koen

- --
koen@dominion.kabel.utwente.nl will go go away in december 2007, please
use k.kooi@student.utwente.nl instead.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFHpt+IMkyGM64RGpERAsDVAKCOrlpxiTzFtejCzGugXH46fP3PYACgnYnC
GPIwcaUXvaClKDVDb5GGLog=
=K0S+
-----END PGP SIGNATURE-----


