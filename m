Received: from [202.4.237.240] (helo=kirsty.vergenet.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raster@vergenet.net>) id 1Kw1xr-0007Cc-9L
	for openembedded-devel@lists.openembedded.org;
	Fri, 31 Oct 2008 22:55:31 +0100
Received: by kirsty.vergenet.net (Postfix, from userid 1001)
	id 1222D240AC; Sat,  1 Nov 2008 08:54:22 +1100 (EST)
Date: Sat, 1 Nov 2008 08:53:34 +1100
From: Carsten Haitzler (The Rasterman) <raster@rasterman.com>
To: openembedded-devel@lists.openembedded.org
Message-Id: <20081101085334.8afcd730.raster@rasterman.com>
In-Reply-To: <gef9q7$o65$1@ger.gmane.org>
References: <20081031110045.7EF89189333@amethyst.openembedded.net>
	<20081031233753.43f5f09d.raster@rasterman.com>
	<gef9q7$o65$1@ger.gmane.org>
Organization: You expect me to be organized?
X-Mailer: Sylpheed 2.4.8 (GTK+ 2.12.9; i486-pc-linux-gnu)
X-Pants: on
X-Cluestick: Get jiggy with it!
Mime-Version: 1.0
Cc: openembedded-devel@openembedded.org, Koen Kooi <k.kooi@student.utwente.nl>
Subject: Re: [oe-commits] Koen Kooi : initscripts: only run ldconfig on boot when ld.so. conf is present
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
X-List-Received-Date: Fri, 31 Oct 2008 21:55:33 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 31 Oct 2008 16:55:50 +0100 Koen Kooi <k.kooi@student.utwente.nl>
babbled:

> On 31-10-2008 13:37, Carsten Haitzler (The Rasterman) wrote:
> > On Fri, 31 Oct 2008 12:00:45 +0100 (CET) git@amethyst.openembedded.net (GIT
> > User account) babbled:
> >
> > is there any reason to run ldconfig on boot? this should be handled by opkg
> > on package install/upgrade or by the flash image creation (this slows boot
> > significantly and i've patched out/disabled ldconfig run in bootmisc.sh
> > with no ill effects).
> 
> Not all images have a package management tool inside, so depending on 
> that is a no-go. Recently OE stopped shipping ld.so.conf so the ldconfig 
> on boot won't get run. Doing it this way seemed to me the safest way to 
> get a nice speedup and keep things working for the funky people needing 
> ld.so.conf without a package manager :)

no package manager? gads. well - i'd lean to the "then you're on your own
buddy" line there - u install libs, you remember to run ldconfig, or suffer :)
maybe i'm just too harsh :) though your way is clean. why don't we make it

if [ ! -e /etc/ld.handled ]; then
  /sbin/ldconfig
fi

and opkg adds a /etc/ld.handled to its package?

similar effect to what you did butbasically if someone knows they will handle
ldconfig then they just need to throw in that file into their system one way or
another?

-- 
------------- Codito, ergo sum - "I code, therefore I am" --------------
The Rasterman (Carsten Haitzler)    raster@rasterman.com



