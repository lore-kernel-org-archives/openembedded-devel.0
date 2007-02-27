Received: from [64.233.182.187] (helo=nf-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <pmiscml@gmail.com>) id 1HM9uz-0001QF-EJ
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Feb 2007 22:31:29 +0100
Received: by nf-out-0910.google.com with SMTP id l24so312611nfc
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Feb 2007 13:31:28 -0800 (PST)
Received: by 10.49.13.14 with SMTP id q14mr1941886nfi.1172611888306;
	Tue, 27 Feb 2007 13:31:28 -0800 (PST)
Received: from CUBE ( [82.193.98.4])
	by mx.google.com with ESMTP id l32sm3295602nfa.2007.02.27.13.31.26;
	Tue, 27 Feb 2007 13:31:27 -0800 (PST)
Date: Tue, 27 Feb 2007 23:31:37 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Priority: 3 (Normal)
Message-ID: <1828813817.20070227233137@gmail.com>
To: Richard Purdie <rpurdie@rpsys.net>
In-Reply-To: <1172609341.28406.169.camel@localhost.localdomain>
References: <407130732.20070227223500@gmail.com>
	<1172609341.28406.169.camel@localhost.localdomain>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Tue, 27 Feb 2007 21:31:30 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Richard,

Tuesday, February 27, 2007, 10:49:01 PM, you wrote:

> On Tue, 2007-02-27 at 22:35 +0200, Paul Sokolovsky wrote:
>> This code was committed, as it doesn't affect any existing aspect of
>> OE. Please feel free to tweak it, and of course use!

> So its not really a RFC, is it? ;-)

  Disapprove is easy if it's wrong.

> I think base_conditional was added but left pretty dumb since we worried
> that if it was too generic it might get too many users. Inline python in
> the variables hits bitbake and parsing hard and its not something I'd
> like to encourage. Holger might have more specific comments. There are
> usually better ways to achieve the end result in a more bitbake like
> way. Also, personally I find the inline python really hard to read too.

> If we are going to do it, I'd prefer to see a set functions in their own
> class inherited by base.

> Yes, I realise I was guilty of adding a couple of these functions with
> task-base. They're mainly used in a couple of specific .bb files rather
> than the core classes and hopefully their usefulness outweights any
> speed penalty though...

  Well, that's good explanation from the point of view of birbake's
limitation we (still) have, but I'd like to approach from another side -
of what usecases we face. So, there was one case when
base_conditional() was used for checking ROM size too, but Marcin
replaced it with checks for specific machine models, exactly because
we had only ==, and not < or <=. And here's another case of fitting
angstrom-gpe-image into 16Mb (actual target is h3600, but I'd like
this time to do it in more scalable way then proliferate *_<machine>
stuff).

  I can quickly hand out 2 alternative solutions for this image size
problem: 1) define *-micro, *-normal, *-maxi bunch of images, 2)
assign each package a numeric priority, and package image based on
that (this "solution" is mentioned mostly for fun, of course).

  Well, both of them are more effortful than adding few base_*() at
right places. Solution #1 is still seems the most correct, of course,
but using conditionals may be seen as incremental step towards it.


  If we started on this topic (handling machine features in consistent
way, and establish best practices), let me dump another thing I ponder
for long time, before I'll start to code something - screen size problem.

  IMHO, "smallscreen" and "bigscreen" heuristic designators we use now
are the best thing we could have in our situation. There were
proposals on adding absolute screen properties, but IMHO, that
wouldn't give us much use, because 1) for most machines values will be
still approximate at best, and 2) we'd quickly decide that it's cool that
we have that info now, but bitbake sucks, and it's too inefficient to
actually use those info, so we shouldn't use it.

  And besides, simple "smallscreen" vs "bigscreen" dichotomy
corresponds to what packages actually provides in real life - mostly,
just 2 sets of icons, etc.

  What bothers me here however is that we uselessly package the same data
over and over again in machine-specific packages, plus each such recipe
must be modified for each new machine added to OE. Doesn't scale.

  What about following solution: define 2 "virtual" *archs* -
smallscreen and bigscreen. Make a convention that such archs can be
applied only to "data" ipk's. Then, a machine will just specify to
which virtual screen arch it belongs, like:

hx4700: PACKAGE_EXTRA_ARCHS = "armv4 armv4t armv5te iwmmxt bigscreen"
h4000: PACKAGE_EXTRA_ARCHS = "armv4 armv4t armv5te iwmmxt smallscreen"

  Voila, matching of actual bigsreen/smallscreen package will be done by
ipkg.

> Cheers,

> Richard 




-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



