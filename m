Received: from [202.173.155.195] (helo=birgitte.twibble.org)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <lenehan@twibble.org>) id 1HlEPq-0003JD-2D
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 May 2007 03:23:01 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by birgitte.twibble.org (Postfix) with ESMTP id 6A07310CA89;
	Tue,  8 May 2007 11:22:30 +1000 (EST)
Received: from birgitte.twibble.org ([127.0.0.1])
	by localhost (birgitte [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 21647-08; Tue, 8 May 2007 11:22:28 +1000 (EST)
Received: from nynaeve.twibble.org (nynaeve.twibble.org [202.173.155.194])
	by birgitte.twibble.org (Postfix) with ESMTP id E2CD1B90D3;
	Tue,  8 May 2007 11:22:28 +1000 (EST)
Received: by nynaeve.twibble.org (Postfix, from userid 500)
	id D9A22B70149; Tue,  8 May 2007 11:22:28 +1000 (EST)
Date: Tue, 8 May 2007 11:22:28 +1000
From: Jamie Lenehan <lenehan@twibble.org>
To: Rolf Leggewie <no2spam@nospam.arcornews.de>
Message-ID: <20070508012228.GA13161@twibble.org>
References: <20070427105722.GA4340@twibble.org> <f1nrnr$pal$1@sea.gmane.org>
MIME-Version: 1.0
In-Reply-To: <f1nrnr$pal$1@sea.gmane.org>
User-Agent: Mutt/1.5.12-2006-07-14
X-Virus-Scanned: by amavisd at twibble.org
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: perl 5.8.8 is ready
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
X-List-Received-Date: Tue, 08 May 2007 01:23:12 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 07, 2007 at 08:38:49PM +0200, Rolf Leggewie wrote:
> Perl has been recently broken for
> 
> a) MACHINE="qemuarm" on angstrom
> b) MACHINE="collie" on sharprom-compatible (worked two days prior)

A log or something about what was going wrong might have helped ;)

Looking at irc logs it looks like you having problems with the patching
failing which it doesn't seem to do for anyone else.

My first suspect would be that you added the patch in question
(letgcc-find-errno.patch) locally to test it (when I added it to
bugzilla) and left it in there. Then a recent mt update has resulted
in the change I pushed being included resulting in the patch being
applied twice in the perl recipe.

So can you do an mtn diff on perl_5.8.8.bb and make sure this isn't
the problem? If it isn't the problem I might need some more
information (although I can't really thing of what else this could be
and/or what would help figuring it out at the moment.)

-- 
 Jamie Lenehan <lenehan@twibble.org>


