Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <rpurdie@rpsys.net>) id 1J3qjZ-0005zD-2v
	for openembedded-devel@openembedded.org; Sun, 16 Dec 2007 11:28:33 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id lBGANm0h015796;
	Sun, 16 Dec 2007 10:23:48 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 15504-07; Sun, 16 Dec 2007 10:23:45 +0000 (GMT)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id lBGANfWK015787
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO);
	Sun, 16 Dec 2007 10:23:41 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <316414004.20071215175505@gmail.com>
References: <20071215151907.d0e45e41.raster@openmoko.org>
	<1910714040.20071215125524@vanille-media.de>
	<316414004.20071215175505@gmail.com>
Date: Sun, 16 Dec 2007 10:23:40 +0000
Message-Id: <1197800620.4653.19.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Carsten Haitzler <raster@openmoko.org>
Subject: Re: AAAARGH! openembedded..... pcmciautils. SOLVED!
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
X-List-Received-Date: Sun, 16 Dec 2007 10:28:33 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sat, 2007-12-15 at 17:55 +0200, Paul Sokolovsky wrote:
> Thought about this too:
>    
> >> any good reason OE doesn't entirely clear ALL
> >> environment variables from the user EXCEPT ones known to be desirable on build
> >> so you have a clean and fresh environment that is known and fixed?

Bitbake reads all variables from the environment into its variable space
when run. Any variable loaded from the original environment are marked
as an export so it gets passed to executed tasks. More recently we added
an "unexport" flag so you could actually stop it from doing this in
cases known to cause problems (e.g. MACHINE). This is a long established
behaviour of bitbake and changing it would probably break the way people
use bitbake and break backwards compatibility.

Loading variables from the environment is a really useful feature which
I personally, Poky and I suspect others make heavy use of. It implies
you should have a relatively clean environment and perhaps that needs to
be more predominately documented.

Exporting those variables makes things more visible. Even if not
exported, we would still have potentially weird build failures for users
with dirty environments since it does affect the variable space quite
significantly.

So yes, bitbake could stop exporting all variables but it would just
hide more subtle problems rather than solving them.

In some cases we need to unexport. In the MACHINE case, setting from the
environment is useful but we need to stop it getting passed to the task
environment as it breaks things like binutils. In general I'd prefer the
bitbake environment init scripts sanity check or clean the environment
or something like sanity.bbclass could check for known bad exports and
error asking the user to fix their environment rather than just blindly
adding to the list of unexports...

Cheers,

Richard








