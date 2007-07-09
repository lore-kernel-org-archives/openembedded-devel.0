Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1I7zox-0002br-7N
	for openembedded-devel@openembedded.org; Mon, 09 Jul 2007 22:26:59 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1I7zjW-0000HU-Kf
	for openembedded-devel@openembedded.org; Mon, 09 Jul 2007 22:21:22 +0200
Received: from host86-131-236-115.range86-131.btcentralplus.com
	([86.131.236.115]) by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 09 Jul 2007 22:21:22 +0200
Received: from koen by host86-131-236-115.range86-131.btcentralplus.com with
	local (Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Mon, 09 Jul 2007 22:21:22 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
Date: Mon, 09 Jul 2007 21:21:14 +0100
Message-ID: <f6u5bq$ht5$1@sea.gmane.org>
References: <513012886.20070708041151@gmail.com>
	<f6q30v$s2$1@sea.gmane.org>	<128309124.20070709154303@gmail.com>	<1183996538.5757.55.camel@localhost.localdomain>
	<849361116.20070709220136@vanille-media.de>
Mime-Version: 1.0
X-Complaints-To: usenet@sea.gmane.org
X-Gmane-NNTP-Posting-Host: host86-131-236-115.range86-131.btcentralplus.com
User-Agent: Thunderbird 2.0.0.4 (Macintosh/20070604)
In-Reply-To: <849361116.20070709220136@vanille-media.de>
X-Enigmail-Version: 0.95.2
Sender: news <news@sea.gmane.org>
Subject: Re: [RFC] Adding screen dimensions to machine configs
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
X-List-Received-Date: Mon, 09 Jul 2007 20:26:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Dr. Michael Lauer schreef:
> To summarize:
> 
> It looks like we can agree to adding information to the
> MACHINE_DISPLAY_ namespace.
> 
> However, we're undecided regarding the semantics. Some of think the
> physical hardware information need to be there, some of us want the
> logical (including kernel-level gfx hardware rotation), some of us
> want a high-level meaning.

and how about linux kernel 2.4 and 2.6 (or even 2.6.ancient and 2.6.recent) having
different opinions on rotation, or maybe worse, having rotation specified via CMDLINE?

I think OE should specify the hardware (since it's in the MACHINE namespace anyway) and
have userspace deal with rotation and stuff.

The main question remains: what are people going to (ab)use this for? If it's just for
opie backgrounds I don't see why adding 3 or more lines to each and every machine is less
work than adding one machine override to the background package.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD4DBQFGkpi6MkyGM64RGpERAq/AAJi6NzXwnUoFlVytANkXA8voyPaTAJ4mWblB
DuMuNnxqg1h/cn7GBORPkw==
=Pq/i
-----END PGP SIGNATURE-----



