Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Jkjrh-000331-Pa
	for openembedded-devel@openembedded.org; Sat, 12 Apr 2008 19:50:14 +0200
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1Jkjrb-0006SH-FH
	for openembedded-devel@openembedded.org; Sat, 12 Apr 2008 17:50:07 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sat, 12 Apr 2008 17:50:07 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sat, 12 Apr 2008 17:50:07 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sat, 12 Apr 2008 19:13:13 +0200
Message-ID: <ftqqja$qdg$1@ger.gmane.org>
References: <35a670560804100650w7de4cec0gae583d5ae73b8fad@mail.gmail.com>	<47FE2530.2@gmx.net>	<35a670560804101007m1d787b4ai97927bb42fcbfe5d@mail.gmail.com>
	<4800DC3B.9080007@gmx.net>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Thunderbird 2.0.0.12 (Macintosh/20080213)
In-Reply-To: <4800DC3B.9080007@gmx.net>
X-Enigmail-Version: 0.95.6
Sender: news <news@ger.gmane.org>
Subject: gcc 4.3.0 status, was: Re: Building ubuntu/gcc-4_2-branch to get GCJ for arm EABI
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
X-List-Received-Date: Sat, 12 Apr 2008 17:50:15 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Robert Schuster schreef:

| Which perhaps it makes sense then to get everything working from GCJ
| 4.3.0 onwards. AFAIK this release contains all the ARM GCJ stuff we need
| and we can ask Andrew Haley if important GCJ patches have been
| introduced after the 4.3.0 release.
|
| GCC 4.3.0 support in OE is still in its infancy and requires some
| workarounds. Keep an eye on this list for news about that.

I had a look at gcc 4.3.0 last week (I need it for armv7-a[1] support),
and the situation has improved a bit:

* armv4t works again
* all debian and fedora patches were imported into OE

Debian has a few libjava patches that I didn't apply (they use a mixture
of p0 and p1 patches which I was too lazy to sort out, they are in
packages/gcc/gcc-4.3.0/debian/), so you could have a look at those.

There are still a few problems, one of which is the includes-fixed
problem, the other that gcc refuses to find stdlib.h even when passed
the correct -I${STAGING_INCDIR}. Gcc also likes to ICE like crazy on
*_Load.c in libmikmod. It's also lacking the uclibc patches.

regards,

Koen

[1] Starting with armv7 gcc distinguishes between various modes (arm,
thumb, etc), so you need to pass -march=armv7-a (the cortex-a8 tunefile
does that for you) if you want regular ARM mode and set PACKAGE_ARCH to
armv7a (without any hyphen, the cortex-a8 tunefile does that for you as
well).
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFIAO2pMkyGM64RGpERAuafAJ9Vy39Qhs53IWBPww3PmBvyIPpsQQCfSTIC
NYTbeqatKb/vJL0RiQ8fbTI=
=rIdj
-----END PGP SIGNATURE-----



