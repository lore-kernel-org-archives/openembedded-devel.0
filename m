Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1JZvbi-0000Xq-Km
	for openembedded-devel@openembedded.org; Thu, 13 Mar 2008 23:09:04 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1JZvZV-0000Bu-8R
	for openembedded-devel@openembedded.org; Thu, 13 Mar 2008 22:06:45 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 13 Mar 2008 22:06:45 +0000
Received: from koen by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 13 Mar 2008 22:06:45 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
Date: Thu, 13 Mar 2008 23:06:32 +0100
Message-ID: <frc8h9$auq$1@ger.gmane.org>
References: <1205444019.4547.192.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Thunderbird 2.0.0.12 (Macintosh/20080213)
In-Reply-To: <1205444019.4547.192.camel@dax.rpnet.com>
X-Enigmail-Version: 0.95.6
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.2
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Packaged Staging - 'Current' Status
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
X-List-Received-Date: Thu, 13 Mar 2008 22:09:04 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Richard Purdie schreef:
| As has been mentioned, I'm working on integrating packaged staging and
| its about time I mentioned the current status. I say 'current' as it
| applies to what I have offline, not what's in OE.dev.

I have a few questions that I can't deduce an answer to from your
description:

~ * How does packaged-staging handle switching ANGSTROM_MODE?

If the packaged-staging-packages (p-s-ps) get seperated by target tuple
it should be ok, and if the p-s-ps dir can be overriden (e.g.
PS_STAGING_DIR = foo/bar/${ANGSTROM_MODE}) we should be safe as well.

~ * do we have 'one' staging dir as we have now, or can each package have
its own staging dir built from its DEPENDS?

I know that this largely depends on how fast/well we debug sysroot
stuff, but I'm curious how this is in your current design.

~ * will p-s.bbclass be package format agnostic, or are we going to
insist on opkg?

I know from experience that making it format agnostic isn't hard, only
tedious, but most of all subject to combinatorial explosion for
unit-testing. It also doesn't really matter, since p-s-ps are orthogonal
to the ones in deploy, but I can image OE-newbies freaking out over this.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFH2aVoMkyGM64RGpERAor2AKC2XM/v+c6hQFsZTZdv5F2dtMRFawCgpgAD
ZT5JM2KOiqUyTLNY3A6n4Io=
=T4cR
-----END PGP SIGNATURE-----



