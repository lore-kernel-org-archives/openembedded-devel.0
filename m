Received: from static.26.116.47.78.clients.your-server.de ([78.47.116.26]
	helo=drlauer-research.com) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1NUPTt-00072c-50
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Jan 2010 19:59:16 +0100
Received: from [192.168.1.105] (e180133168.adsl.alicedsl.de [85.180.133.168])
	by drlauer-research.com (Postfix) with ESMTP id E1BD3584142
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jan 2010 20:48:11 +0100 (CET)
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <18e217241001110959k4d346f05j7e00c36dfd18021d@mail.gmail.com>
References: <18e217241001110959k4d346f05j7e00c36dfd18021d@mail.gmail.com>
Organization: Vanille-Media
Date: Mon, 11 Jan 2010 19:58:10 +0100
Message-ID: <1263236290.22868.33.camel@andromeda>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-SA-Exim-Connect-IP: 78.47.116.26
X-SA-Exim-Mail-From: mickey@vanille-media.de
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
X-List-Received-Date: Mon, 11 Jan 2010 18:59:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Am Montag, den 11.01.2010, 09:59 -0800 schrieb C Michael Sundius:
> Some of our developers have been running into this problem and I'm wondering
> how others deal with it.
> 
> It seems if we have a recipe, (A) that depends upon header files staged by
> another recipe (B) then:
> 
> 1) if the source for recipe (B) is modified and recompiled with:
> 
>     bitbake -f -c compile B
>     bitbake B,
> 
> I would expect that when recipe A is run:
> 
>    bitbake A
> 
> It too would be recompiled, however that does not seem to be the case. In
> fact even if recipe B is cleaned up:
> 
>     bitbake -c clean B
> 
> and then we run recipe A
> 
>     bitbake A
> 
> only recipe B is run and recipe A is NOT rerun! the dependency is satisfied
> by rerunning recipe B and then bitbake stops..
> 
> is this expected behaviour? Is there away to force rerunning of recipes that
> would be "out of date" due to one of its dependent recipes being return and
> re-staging (potentially) new headers and libraries?

It is indeed expected behaviour, since there is no code in Bitbake that
would add any dependending packages and add them to your build.

Frans' suggestion is a workaround, however that only works with targets
that already include all the depending packages, usually a 'task',
'feed', or 'image' target.

I would welcome such a mode that automatically rebuilds all depending
packages, however as this could dramatically increase build time it
would need to be optional. BitBake hackers, what do you think?

-- 
:M:



