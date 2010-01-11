Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NUR8J-0007vt-3x for openembedded-devel@lists.openembedded.org;
	Mon, 11 Jan 2010 21:45:06 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NUR6E-0008C1-8h
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Jan 2010 21:42:54 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jan 2010 21:42:54 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jan 2010 21:42:54 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 11 Jan 2010 21:42:23 +0100
Message-ID: <hig2fe$ui2$1@ger.gmane.org>
References: <18e217241001110959k4d346f05j7e00c36dfd18021d@mail.gmail.com>
	<1263236290.22868.33.camel@andromeda>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.7) Gecko/20100104 Shredder/3.0.1pre
In-Reply-To: <1263236290.22868.33.camel@andromeda>
X-Enigmail-Version: 1.0
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: dependencies between packages
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 11 Jan 2010 20:45:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 11-01-10 19:58, Michael 'Mickey' Lauer wrote:

> I would welcome such a mode that automatically rebuilds all depending
> packages, however as this could dramatically increase build time it
> would need to be optional. BitBake hackers, what do you think?

Bitbake already has such a mechanism and like I mentioned earlier in
this thread, it's of limited use, since the PRs won't get changed, so
from a DISTRO POV you still need to manually increment each affected PR
or bump DISTRO_PR, which will rebuild everything.
And even if we could bump PR automatically, we need a way to distribute
that too all buildhosts.

And yes, I'm cranky because I need exactly this to deal with the bzip2
SOVERSION fallout :/

regards,

Koen

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLS40vMkyGM64RGpERAvo9AKCJENnNSjDBNKTZ63ufo/g+qwja/wCgvNIm
FKkq1RuyaSHHXVq+g1H+QN4=
=kv/H
-----END PGP SIGNATURE-----



