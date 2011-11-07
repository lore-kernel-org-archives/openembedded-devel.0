Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RNOgD-0004KJ-4b for openembedded-devel@lists.openembedded.org;
	Mon, 07 Nov 2011 13:52:01 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RNOaC-0001oV-Lf for openembedded-devel@lists.openembedded.org;
	Mon, 07 Nov 2011 13:45:48 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Nov 2011 13:45:48 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Nov 2011 13:45:48 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 07 Nov 2011 13:45:36 +0100
Message-ID: <j98jtg$ban$1@dough.gmane.org>
References: <1320399536-9588-1-git-send-email-Martin.Jansa@gmail.com>
	<j915dk$4rp$1@dough.gmane.org>
	<20111107113426.GB4237@jama.jama.net>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
In-Reply-To: <20111107113426.GB4237@jama.jama.net>
X-Enigmail-Version: 1.3.2
Subject: Re: [PATCH] mplayer2: import from OE-classic
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
X-List-Received-Date: Mon, 07 Nov 2011 12:52:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 07-11-11 12:34, Martin Jansa schreef:
> On Fri, Nov 04, 2011 at 05:55:16PM +0100, Koen Kooi wrote:
>> -----BEGIN PGP SIGNED MESSAGE----- Hash: SHA1
>> 
>> Op 04-11-11 10:38, Martin Jansa schreef:
>>> * taken from 1a91fc4b705b0c4f45eb088a2f7aea01ebc9c98e * dropped
>>> V4L1, largefile, xvmc * added libass * added LIC_FILES_CHKSUM *
>>> upgraded to latest SRCREV * moved glamo patch to meta-openmoko layer
>> 
>> I did some more fixes, it still doesn't build for armv7a or if you use 
>> - --as-needed, but to get parsing to work again I pushed it, OE-core
>> style ;)
> 
> I had it built for armv4t (om-gta02), armv5te (spitz, qemuarm) and 
> armv7a-vfp-neon (nokia900, palmpre, palmpre2) and qemux86,qemux86-64 
> before sending this patch, but seems like something was wrong here even 
> with successfull build :/.
> 
> thanks for armv7a fixes, but there was also one typo introduced..
> 
> -SRC_URI_append_armv7a = " \ +SRC_URI_append_aarmv7a = " \

That's on purpose, since the code in that patch won't compile (drawXY is
gone from mplayer).



-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFOt9LwMkyGM64RGpERAiguAKCcx7S9vcN8Mj2AC7Qq+TqU5tRETwCfYM9s
at+JagJOiFwHa1ontngDuTM=
=9Oi4
-----END PGP SIGNATURE-----



