Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QffV8-0005zQ-6u for openembedded-devel@lists.openembedded.org;
	Sat, 09 Jul 2011 23:55:50 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QffRH-0001WV-PR for openembedded-devel@lists.openembedded.org;
	Sat, 09 Jul 2011 23:51:51 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Jul 2011 23:51:51 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Jul 2011 23:51:51 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Sat, 09 Jul 2011 23:51:33 +0200
Message-ID: <ivaih9$8c8$1@dough.gmane.org>
References: <1310170909-3533-1-git-send-email-agnel.joel@gmail.com>
	<1310206150.4123.94.camel@mattotaupa>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:5.0) Gecko/20110624 Thunderbird/5.0
In-Reply-To: <1310206150.4123.94.camel@mattotaupa>
X-Enigmail-Version: 1.2
Subject: Re: [PATCH] pulseaudio: Switch to version version 0.9.22 for Angstrom 2011.03
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
X-List-Received-Date: Sat, 09 Jul 2011 21:55:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 09-07-11 12:09, Paul Menzel schreef:

> 1. Package PA 0.9.23 for oe-dev.

That could work, apart from oe-dev being a dead-end. OE-core has .23 already

> 2. Prefer PA 0.9.23 for Ȧngström and other distributions. 3. Remove
> older PA versions. 4. Cherry pick these changes into branch
> 2011.03-maintenance.

That won't work, the gcc 4.3.x angstrom is using in maintenance lacks
the needed atomic ops (even after the merge from buglabs) to build it
for !armv7a. To keep things single I'd recommend the following:

 * enable .22 for armv7a, leave the rest as-is
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFOGM1lMkyGM64RGpERAjjzAJ9KvJaiB0ypsZFQwChE3PV6Q7Ph7wCdEXpO
zofD3v8F8h1/xzgpFvNFnJw=
=a6bP
-----END PGP SIGNATURE-----



