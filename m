Received: from mail.reciva.com ([82.71.203.194] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1NGUGu-0005Ac-S0
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Dec 2009 10:16:20 +0100
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1NGUFM-00066g-Lo
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Dec 2009 09:14:40 +0000
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <philb@gnu.org>) id 1NGUFM-0005P9-Hx
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Dec 2009 09:14:40 +0000
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4B18BA2B.40602@SSpaeth.de>
References: <1259911168-19992-1-git-send-email-Sebastian@SSpaeth.de>
	<1259911168-19992-2-git-send-email-Sebastian@SSpaeth.de>
	<4B18BA2B.40602@SSpaeth.de>
Date: Fri, 04 Dec 2009 09:14:37 +0000
Message-Id: <1259918077.779.11.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.3 
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH 2/2] task-base: Introduce DISTRO_apm and convert recipes to use it.
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
X-List-Received-Date: Fri, 04 Dec 2009 09:16:20 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2009-12-04 at 08:28 +0100, Sebastian Spaeth wrote:
> This is my take on solving our problem that we want a different "apm"
> provider. Koen outlined this solution, so this way I went.
> 
> All recipes that RDPEND on "apm" basically get a
> 
> DISTRO_apm ?= "apm"
> RDEPEND    += ${DISTRO_apm}
> 
> This could also be done with a virtual/apm package, and a
> PREFERED_PROVIDER set to apm for all distros. Which would even be
> cleaner I think, with the downside that all other distros would need to
> set a prefered provider too.

The latter approach does sound rather better to me.  This is exactly
what virtuals are for, and I'm not sure that we want a massive
proliferation of DISTRO_foo variables that effectively shadow
PREFERRED_PROVIDER. 

You're right that there is a bit of an issue with adding new virtuals,
in that old distros need to remain pinned to the provider they were
getting previously rather than being left to flap in the wind.  Your
proposal of adding a new include file sounds like a reasonable way to
address that, though I'm not completely enamoured of the "sane-"
terminology.  I think something like "compatibility-providers.inc" or
even "legacy-providers.inc" would better capture what the file is for.

p.




