Received: from [68.230.241.43] (helo=fed1rmmtao103.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1L7vwh-0001b6-Qr
	for openembedded-devel@openembedded.org; Wed, 03 Dec 2008 18:55:32 +0100
Received: from fed1rmimpo01.cox.net ([70.169.32.71]) by fed1rmmtao103.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20081203175135.CRLC12838.fed1rmmtao103.cox.net@fed1rmimpo01.cox.net>
	for <openembedded-devel@openembedded.org>;
	Wed, 3 Dec 2008 12:51:35 -0500
Received: from localhost ([68.230.61.57]) by fed1rmimpo01.cox.net with bizsmtp
	id mhra1a00Q1E665w03hrapF; Wed, 03 Dec 2008 12:51:34 -0500
X-Authority-Analysis: v=1.0 c=1 a=rIhnTQz5QLcA:10 a=AyNhsvkp5bwA:10
	a=0cS649ZSRVXvxhylX3IA:9 a=AwkJGiG5RH_yUmfttqTY1qGNsdkA:4
	a=ZTO6GbLbXZoA:10 a=MSl-tDqOz04A:10 a=LY0hPdMaydYA:10
X-CM-Score: 0.00
Date: Wed, 3 Dec 2008 10:51:43 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20081203175143.GK16628@smtp.west.cox.net>
References: <c384c5ea0812030846n604eccf0pe47d15f7122f0435@mail.gmail.com>
	<b6ebd0a50812030900r593d6bb0me3a35316907b21ab@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <b6ebd0a50812030900r593d6bb0me3a35316907b21ab@mail.gmail.com>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [RFC Wild Ideas Department] create soft-links from	<pkg>/<src>/patches/some_local.patch to	<oe.git>/packages/<pkg>/files/some_local.patch
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
X-List-Received-Date: Wed, 03 Dec 2008 17:55:32 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Dec 03, 2008 at 10:00:13AM -0700, Chris Larson wrote:
> On Wed, Dec 3, 2008 at 9:46 AM, Leon Woestenberg
> <leon.woestenberg@gmail.com> wrote:
> > Hello,
> >
> > during maintenance of our local set of OE patches, it would be handy
> > not having to copy patches back into the repository.
> >
> > i.e. the patch fetcher could instead of copy the patch to the work
> > directory, soft-link from the repo.
> 
> I can see why you want it.   The file:// fetcher copies everything,
> not just patches, they aren't fetched differently currently.  You
> could introduce regressions if it were to affect anything but patches,
> so you'd have to add a special case for uris with patch=1 in the
> file:// fetcher to link instead of copy, and possibly make it optional
> via a variable.  I take it you do a lot of patch alterations in the
> workdir to fix problems?

A lot? No.  But for everyone working from a fixed OE snapshot, this
would be a nice timesaver.  Heck, soft-linking all of the file URIs
would be nice here.  Perhaps a variable to control doing it always
(default to off) ?

-- 
Tom Rini


