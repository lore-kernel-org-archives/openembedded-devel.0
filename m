Received: from smtp-4.concepts.nl ([213.197.30.111])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pieterg@gmx.com>) id 1OK5SI-0001yS-5V
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Jun 2010 10:07:15 +0200
Received: from c3404277.ftth.concepts.nl ([195.64.66.119]
	helo=mx1.grimmerink.nl) by smtp-4.concepts.nl with esmtp (Exim 4.69)
	(envelope-from <pieterg@gmx.com>) id 1OK5O1-0006OX-Jc
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Jun 2010 10:02:45 +0200
Received: from [10.9.0.12] (unknown [10.9.0.12])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.grimmerink.nl (Postfix) with ESMTPSA id 2CB896A11A
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Jun 2010 10:02:41 +0200 (CEST)
From: pieterg <pieterg@gmx.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 3 Jun 2010 10:02:31 +0200
User-Agent: KMail/1.9.9
References: <201006022351.38129.pieterg@gmx.com>
	<201006030915.57362.pieterg@gmx.com> <20100603073717.GK16035@jama>
In-Reply-To: <20100603073717.GK16035@jama>
MIME-Version: 1.0
Message-Id: <201006031002.31685.pieterg@gmx.com>
X-Concepts-MailScanner-Information: Please contact abuse@concepts.nl for more
	information
X-Concepts-MailScanner-ID: 1OK5O1-0006OX-Jc
X-Concepts-MailScanner: Found to be clean
X-Concepts-MailScanner-SpamCheck: 
X-Concepts-MailScanner-From: pieterg@gmx.com
X-SA-Exim-Connect-IP: 213.197.30.111
X-SA-Exim-Mail-From: pieterg@gmx.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_FAIL autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: AUTOREV and SRCPV
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
X-List-Received-Date: Thu, 03 Jun 2010 08:07:15 -0000
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thursday 03 June 2010 09:37:17 Martin Jansa wrote:
> On Thu, Jun 03, 2010 at 09:15:56AM +0200, pieterg wrote:
> > On Thursday 03 June 2010 06:35:05 Martin Jansa wrote:

<snip>

> > > If you use bitbake-1.10 it will do it just once for git revision (it
> > > will cache the result of "git list-rev | wc -l" which is used by
> > > BB_GIT_CLONE_FOR_SRCREV.
> >
> > Probably, but I don't get that far, bitbake quits at the end, with
> > several parsing errors (problems with git repositories which I have no
> > control over, and which I don't even want anything to do with)
>
> I'm aware of this problem and was discussed in that thread half a year
> ago, pity that you didn't join the discussion back then :/. But FYI all
> recipes with SRCPV builds OK here (without BB_GIT_CLONE_FOR_SRCREV but
> git servers are accessible for me).

Yes, I know I'm too late now ;)
We were way behind with our oe merges back then, and only recently I started 
to get back uptodate again. So I didn't even realise the impact it would 
have for us untill now.

> > There are two sorts of people, those with BB_GIT_CLONE_FOR_SRCREV, and
> > those without.
> > (or in my case, this is controlled by the distro, an 'unstable',
> > or 'release').
> > As long as the versioning is consistent for each group of people (or in
> > my case, each distro), I don't need the versioning to stay consistent
> > when toggling BB_GIT_CLONE_FOR_SRCREV.
>
> What about toggling AUTOREV and fixed revision? Which is imho more
> common change (ie when development gets slower and there is stable
> version in git and you don't need/want it AUTOREV). That's exacly the
> case when SRCPV is really handy.

But if you then decide to remove BB_GIT_CLONE_FOR_SRCREV again because you 
no longer need it, and somebody starts a clean build, the LOCALCOUNT would 
start at 0 again I guess.
So the versioning isn't consistent anyway when toggling 
BB_GIT_CLONE_FOR_SRCREV.

> The other is when you change SRCREV in recipe without updating PV. Then
> SRCPV will give you newer PV which will upgrade resulting package on
> target.

Yes, but only if you stick to the same buildserver, and as soon as the hdd 
crashes for instance and you have to start with a clean build, everybody is 
in trouble.
So personally, I would never even want to use SRCPV, unless it's for 
AUTOREV.

Would it be an idea to be able to only have BB_GIT_CLONE_FOR_SRCREV for 
those packages which have SRCREV = ${AUTOREV}?

Rgds, Pieter


