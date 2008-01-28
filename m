Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <k.kooi@student.utwente.nl>) id 1JJPne-00026R-AX
	for openembedded-devel@openembedded.org; Mon, 28 Jan 2008 09:57:06 +0100
Received: from Powerbook-2.local (vpn006010.vpn.utwente.nl [130.89.6.10])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	m0S8v6tS031368 for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Jan 2008 09:57:07 +0100
Message-ID: <479D98E1.2030608@student.utwente.nl>
Date: Mon, 28 Jan 2008 09:57:05 +0100
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.9 (Macintosh/20071031)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
References: <200801280845.40636.openembedded@haerwu.biz>
In-Reply-To: <200801280845.40636.openembedded@haerwu.biz>
X-Enigmail-Version: 0.95.6
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	servicedesk@icts.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
Subject: Re: Official list of OE monotone servers?
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
X-List-Received-Date: Mon, 28 Jan 2008 08:57:06 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Marcin Juszkiewicz schreef:
| During problems with DNS (which I really hope were last time) Mickeyl(?)
| made use of openembedded.net domain. This gave nasty problem for me.
|
| I was pulling from monotone.openembedded.net and pushing to it. The
| problem is that this machine was *not* synchronizing changes back to
| other servers.
|
| We need a list of *OFFICIAL* monotone servers which synchronize each
| other. And as a list I think of:

| 4. Server fingerprint (used by monotone)

That's the fingerprint of the private key you are running it with.
Official OE servers all have the same fingerprint (oe@ key).

| If someone know how to force monotone to not allow to pull/push against
| not listed servers please share that knowledge too.

Don't allow pushed to untrusted servers? Monotone give a warning about
that, and you can make a lua hook for that.

regards,

Koen

- --
koen@dominion.kabel.utwente.nl will go go away in december 2007, please
use k.kooi@student.utwente.nl instead.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFHnZjhMkyGM64RGpERAiGDAKCozRlvXvXGoiZmR1xr+PvP3f/m/QCdFp2/
ntyoXm9u6SKFaDIT8iKTmo8=
=YNPs
-----END PGP SIGNATURE-----


