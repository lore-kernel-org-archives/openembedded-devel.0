Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpurdie@rpsys.net>)
	id 1Pf7hg-0001AS-1J; Tue, 18 Jan 2011 10:18:16 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p0I9Hc5F002783;
	Tue, 18 Jan 2011 09:17:38 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 02409-07; Tue, 18 Jan 2011 09:17:34 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p0I9HQSl002777
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 18 Jan 2011 09:17:29 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-members@lists.openembedded.org
In-Reply-To: <BF933EAB-DA94-4C5F-BC91-EF2B45B1B657@dominion.thruhere.net>
References: <1295027350.14388.6527.camel@rex>
	<AANLkTi=QXykmerKTJJgCNDbqSE18_3Jhqj1utKmf1Ynw@mail.gmail.com>
	<4D353F81.50301@xora.org.uk>
	<AANLkTi=WOr_395Tya3GOhyLpg1oj9stLxSWdgo--uAhz@mail.gmail.com>
	<BF933EAB-DA94-4C5F-BC91-EF2B45B1B657@dominion.thruhere.net>
Date: Tue, 18 Jan 2011 09:17:24 +0000
Message-ID: <1295342244.14388.17115.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Yocto Project and OE - Where now?
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
X-List-Received-Date: Tue, 18 Jan 2011 09:18:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-01-18 at 09:47 +0100, Koen Kooi wrote:
> Op 18 jan 2011, om 09:05 heeft Otavio Salvador het volgende geschreven:
> > Users of old distros ought to use a specific repository and branch.
> > Master ought to be kept clean for 'next distro release'.
> 
> I've been using yocto for a few months and I *&#(@$*$(*$($@#($@ hate
> their 1 version per recipe policy. Every monday I have a working image
> and every wednesday I have to rebuild from scratch and reevaluate
> because various things got removed and "upgraded". And since my distro
> pin file is in a layer, pinnings don't get noticed.
> So instead of "building on top" of the metadata I need to resort to
> "fork" the metadata. And I'm not the only one seeing this problem, the
> yocto autobuilder is almost perputally red :(

You will notice a change in behaviour from Feb 4th as we hit the release
"freeze" for Yocto's next release as per the schedule on the wiki. At
the moment the codebase is in development flux, then we go to the
stabilisation window. There is a well defined schedule for this and
everyone should have known expectations of what is happening.

The autobuilder has been a bit rough I agree. Saul correctly did call
for stabilisation of the known issues, we've done that, hit green builds
and because the freeze is coming and we've still some major work to
merge in, we're continuing to develop. I appreciated Saul's work in that
area.

So you can see that whilst we are making changes, we are also testing
what we're doing and fixing the regressions we can find. If that testing
is missing things that cause people problems, I'd suggest helping us
find new tests that cover them too.

> Having 10 versions is too much, but having 3 (oldstable, stable,
> development) shouldn't be a problem, especially if they use a
> common .inc file.
> 
> Just look at glib-2.0 in yocto. There's only one version, and that's
> 2.27.5, which is a development release (odd minor number). That's not
> what I want to use in a distro I need to support, especially looking
> at the huge API changes going into the 2.27 series.

Hmm, we should not be using an odd minor number gnome release component
I agree. That should not have happened something has gone wrong there.

> Similar thing for QT, I don't want 4.6.x to suddenly disappear and be
> forced to use 4.7.x. I also don't want to move 4.6.x to a distro
> layer, since QT is way too huge to support on your own.
> 
> Or eglibc or gcc or binuils

For components like these, Yocto aims to pick a version and run with
that for a given release. We want to try and stay reasonable current as
long as the version works. For something based on Yocto, it may be that
as the core moves forward, older versions move into layers if they're
still needed.

Yocto isn't going to make everyone happy or do everything right straight
out the box as we're learning. What I do intend to do is not be afraid
to try things differently but listen to the feedback, adapting
accordingly. OpenEmbedded is stagnating by comparison and I don't think
its healthy.

Cheers,

Richard



