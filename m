Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rpurdie@rpsys.net>) id 1HMAQO-0001wv-Tx
	for openembedded-devel@openembedded.org; Tue, 27 Feb 2007 23:03:57 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l1RM3r7j003784;
	Tue, 27 Feb 2007 22:03:53 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 03394-03; Tue, 27 Feb 2007 22:03:50 +0000 (GMT)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l1RM3m8E003776
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO);
	Tue, 27 Feb 2007 22:03:49 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: Paul Sokolovsky <pmiscml@gmail.com>
In-Reply-To: <1828813817.20070227233137@gmail.com>
References: <407130732.20070227223500@gmail.com>
	<1172609341.28406.169.camel@localhost.localdomain>
	<1828813817.20070227233137@gmail.com>
Date: Tue, 27 Feb 2007 22:03:50 +0000
Message-Id: <1172613830.28406.192.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-devel@openembedded.org
Subject: Re: [RFC] base_less_or_equal() for numerical value testing in OE
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
X-List-Received-Date: Tue, 27 Feb 2007 22:03:57 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2007-02-27 at 23:31 +0200, Paul Sokolovsky wrote:
> > So its not really a RFC, is it? ;-)
> 
>   Disapprove is easy if it's wrong.

That isn't a good justification. Please ask first if you intend for
comments, then commit after discussion.

>   If we started on this topic (handling machine features in consistent
> way, and establish best practices), let me dump another thing I ponder
> for long time, before I'll start to code something - screen size problem.
> 
>   IMHO, "smallscreen" and "bigscreen" heuristic designators we use now
> are the best thing we could have in our situation. There were
> proposals on adding absolute screen properties, but IMHO, that
> wouldn't give us much use, because 1) for most machines values will be
> still approximate at best, and 2) we'd quickly decide that it's cool that
> we have that info now, but bitbake sucks, and it's too inefficient to
> actually use those info, so we shouldn't use it.

I never said 2). I said we should keep in mind the impact on parsing
speed. We've gone to great lengths to improve it and I'm simply warning
there is a compromise. 

I don't want to see OE metadata turning into inlined python. If we find
we need to do that, something is wrong with the metadata format and we
should improve it.

The metadata format has been relatively static for a long time as the
bitbake developers have been conservative in certain areas. If we have a
need to improve it, I'm open to suggestions on that. Inlining python to
work around its limitations is not the correct solution.

>   And besides, simple "smallscreen" vs "bigscreen" dichotomy
> corresponds to what packages actually provides in real life - mostly,
> just 2 sets of icons, etc.
> 
>   What bothers me here however is that we uselessly package the same data
> over and over again in machine-specific packages, plus each such recipe
> must be modified for each new machine added to OE. Doesn't scale.

So automate those sites so they run off a machine specified variable.
You shouldn't have to hack the .bb's when adding a new machine (apart
from maybe things like fstab in base-files).

The actual packaging then becomes the only issue but that is only a
minor issue in the big picture.

I've slowly being try to remove machine specific packages too
(tslib-conf is no longer machine specific in the standard case).

> hx4700: PACKAGE_EXTRA_ARCHS = "armv4 armv4t armv5te iwmmxt bigscreen"
> h4000: PACKAGE_EXTRA_ARCHS = "armv4 armv4t armv5te iwmmxt smallscreen"
> 
>   Voila, matching of actual bigsreen/smallscreen package will be done by
> ipkg.

No. Adding architectures for every machine feature is just insane. You
need to find a better way to do it. Think about what you're suggesting
for a minute. 

Regards,

Richard



