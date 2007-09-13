Received: from [209.242.60.150] (helo=demolition.dls.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <mwester@dls.net>) id 1IVdaV-0003Kk-7z
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Sep 2007 03:33:47 +0200
Received: by demolition.dls.net (Postfix, from userid 67)
	id B552C9684C7; Wed, 12 Sep 2007 20:30:35 -0500 (CDT)
From: <mwester@dls.net>
To: openembedded-devel@lists.openembedded.org,
	openembedded-devel <openembedded-devel@openembedded.org>
Date: Wed, 12 Sep 2007 20:30:35 -0500
X-SentFrom: 12.47.40.226
X-SentAddr: 4675c051ba9e8885d6e5a82457605098ccf0a84b
User-Agent: DLS.net Webmail
References: <1189638097.6480.132.camel@localhost.localdomain>
In-Reply-To: <1189638097.6480.132.camel@localhost.localdomain>
Message-Id: <20070913013035.B552C9684C7@demolition.dls.net>
Cc: Michael 'Mickey' Lauer <mickey@openmoko.org>
Subject: Re: The ongoing SRCREV saga
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
X-List-Received-Date: Thu, 13 Sep 2007 01:33:47 -0000
Content-Type: text/plain; charset=us-ascii; format=flowed

...
> I'm therefore proposing we change bitbake.conf to read:
> 
> SRCREV = "1"
> 
> This puts an end to network access when a SRCREV hasn't been set in
> sane-srcrevs.inc. Anyone wishing to default to svn head in these cases
> can add this to local.conf (or their distro):
> 
> SRCREV = "${AUTOREV}"
> 
> I propose keeping sane-srcrevs.inc for distros to include to have
> meaningful revisions for srcrev based packages.
> 
> If a distro like openmoko wants to make cutting edge development
> possible I suggest creating a .inc file which sets
> 
> SRCREV-pn-whatever = "${AUTOREV}"
> 
> for the packages they want to make floating.
> 
> I firmly believe that floating SRCREVs should be opt in and these
> changes allow that whilst still letting distros or users make use of
> floating versions. I'd also advise openmoko against making SRCREV =
> "${AUTOREV}" the default and to only make the packages they need
> floating but thats not my call to make :).
> 
> Are there any objections to the above? I'll probably commit this fairly
> quickly if the openmoko devs are agreeable.

I firmly vote "YES" on this proposal!

To amplify some of the comments already stated, the principle of "least surprise" suggests strongly that even a very highly-skilled user unfamiliar with OE would expect that any particular OE build environment would remain stable unless the user of that environment explicitly requested otherwise, or unless it is the (preferably formally stated and documented) policy of the specific distro.

This simple change will set the default behavior correctly.  I would further argue that any inconvenience to any particular distro should be minor, as each distro should know exactly what dependencies they have on non-specific SRCREVs, and if they don't, they should want to.  I'll happily fix any issues this might cause for the Unslung and SlugOS distros.    

I look forward to deterministic builds -- luck is for card games, not builds!

Thanks,
Mike (mwester)


