Received: from static.26.116.47.78.clients.your-server.de ([78.47.116.26]
	helo=drlauer-research.com) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1NT2po-0005xN-Bc
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Jan 2010 01:36:15 +0100
Received: from [192.168.1.105] (e180140219.adsl.alicedsl.de [85.180.140.219])
	by drlauer-research.com (Postfix) with ESMTP id E7B5D5841A5
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Jan 2010 02:24:54 +0100 (CET)
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1262896003.2553.266.camel@lenovo.internal.reciva.com>
References: <hi5b61$f7h$1@ger.gmane.org>
	<1262892164.2553.230.camel@lenovo.internal.reciva.com>
	<c384c5ea1001071148h770db2a7p10f6a7b51582fea5@mail.gmail.com>
	<1262896003.2553.266.camel@lenovo.internal.reciva.com>
Organization: Vanille-Media
Date: Fri, 08 Jan 2010 01:34:31 +0100
Message-ID: <1262910871.22868.17.camel@andromeda>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-SA-Exim-Connect-IP: 78.47.116.26
X-SA-Exim-Mail-From: mickey@vanille-media.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: RFC: Bump default version for gtk+ to 2.18.3
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
X-List-Received-Date: Fri, 08 Jan 2010 00:36:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Am Donnerstag, den 07.01.2010, 20:26 +0000 schrieb Phil Blundell:
> On Thu, 2010-01-07 at 20:48 +0100, Leon Woestenberg wrote:
> > What should that responsibility involve?
> > 
> > I usually "test" on one or two machines but still set a DEFAULT_PREFERENCE "-1".
> > 
> > It's very hard for the committer to collect enough testing evidence
> > for all the use cases / variables.
> 
> It seems fairly clear that no individual committer is going to be able
> to test all the possible permutations for even moderately complicated
> packages.  If we require exhaustive testing before anything can land in
> the tree then development will just grind to a halt.  And, as I
> mentioned in my previous email, the primary responsibility for
> integration lies with the DISTRO maintainers, who can use tools like
> PREFERRED_VERSION to limit the amount of unexpected churn in their
> configurations.
> 
> It's probably a job for the TSC to come up with a definitive policy in
> this area.  But, for myself, I would consider someone checking in a new
> version to have discharged their duties in a responsible manner if:
> 
>  - the new version has the same, or at least an equivalent, default
> configuration as the old one (i.e. no gratuitous changes to EXTRA_OECONF
> or the like); and
> 
>  - all the patches that were applied to the old version are either still
> applied to the new version, or have been established to be unnecessary;
> and
> 
>  - the new package has been successfully compiled, and ideally tested,
> in at least one configuration; and
> 
>  - once we have a functioning waterfall view in tinderbox, the checkin
> doesn't cause any of our primary MACHINE/DISTRO combinations to burst
> into flames
> 
> I guess the key thing is not to make committers feel that they will be
> held to account for things that are outside their realistic control
> (i.e. bugs that have been introduced upstream in the new version), while
> still expecting them to take reasonable steps to avoid introducing
> unnecessary breakage.
> 
> Automatically adding new versions with a negative DEFAULT_PREFERENCE
> doesn't scale: if everybody did this then, eventually, we would end up
> with virtually the whole tree being D_P -1.  And it sends a confusing
> message to other users, since people tend to assume that a recipe with a
> negative D_P is broken or harmful in some way rather than merely
> untested or untrusted.  I would also propose that, in future, any
> setting of DEFAULT_PREFERENCE in a recipe must be accompanied by a
> comment explaining why it was set, and (if it is set negatively) under
> what conditions it can or should be removed.

Agreed, I think that's a sensible way to deal with it.

:M:




