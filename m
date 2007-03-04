Received: from [64.233.162.234] (helo=nz-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <pmiscml@gmail.com>) id 1HO0A9-0008Kb-Eq
	for openembedded-devel@lists.openembedded.org;
	Mon, 05 Mar 2007 00:30:48 +0100
Received: by nz-out-0506.google.com with SMTP id m22so1256081nzf
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 04 Mar 2007 15:30:44 -0800 (PST)
Received: by 10.65.122.20 with SMTP id z20mr8857205qbm.1173051043879;
	Sun, 04 Mar 2007 15:30:43 -0800 (PST)
Received: from cube ( [82.193.98.1])
	by mx.google.com with ESMTP id 7sm7858113nzo.2007.03.04.15.30.41;
	Sun, 04 Mar 2007 15:30:42 -0800 (PST)
Date: Mon, 5 Mar 2007 01:30:40 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Priority: 3 (Normal)
Message-ID: <794972911.20070305013040@gmail.com>
To: Richard Purdie <rpurdie@rpsys.net>
In-Reply-To: <1172613830.28406.192.camel@localhost.localdomain>
References: <407130732.20070227223500@gmail.com>
	<1172609341.28406.169.camel@localhost.localdomain>
	<1828813817.20070227233137@gmail.com>
	<1172613830.28406.192.camel@localhost.localdomain>
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
X-List-Received-Date: Sun, 04 Mar 2007 23:30:55 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Richard,

(sorry for delay with response, I had system stability issues)

Wednesday, February 28, 2007, 12:03:50 AM, you wrote:

> On Tue, 2007-02-27 at 23:31 +0200, Paul Sokolovsky wrote:
>> > So its not really a RFC, is it? ;-)
>> 
>>   Disapprove is easy if it's wrong.

> That isn't a good justification. Please ask first if you intend for
> comments, then commit after discussion.

  Ok. Sorry for being hasty this time.

>>   If we started on this topic (handling machine features in consistent
>> way, and establish best practices), let me dump another thing I ponder
>> for long time, before I'll start to code something - screen size problem.
>> 
>>   IMHO, "smallscreen" and "bigscreen" heuristic designators we use now
>> are the best thing we could have in our situation. There were
>> proposals on adding absolute screen properties, but IMHO, that
>> wouldn't give us much use, because 1) for most machines values will be
>> still approximate at best, and 2) we'd quickly decide that it's cool that
>> we have that info now, but bitbake sucks, and it's too inefficient to
>> actually use those info, so we shouldn't use it.

> I never said 2). I said we should keep in mind the impact on parsing
> speed. We've gone to great lengths to improve it and I'm simply warning
> there is a compromise. 

> I don't want to see OE metadata turning into inlined python. If we find
> we need to do that, something is wrong with the metadata format and we
> should improve it.

> The metadata format has been relatively static for a long time as the
> bitbake developers have been conservative in certain areas. If we have a
> need to improve it, I'm open to suggestions on that. Inlining python to
> work around its limitations is not the correct solution.

  Yes, I would think along that direction too. We have own bitbake
language/syntax and yet reduce to using cumbersome syntax for
conditionals, etc. Yet, I don't have any direct suggestions how to
handle that better. It's apparently depends more on high-level
usescases for OE/bitbake, and the change in question is just small
incremental step towards better support for high-level requirements
(like ability to build rootfs's limited to specific size).

>>   And besides, simple "smallscreen" vs "bigscreen" dichotomy
>> corresponds to what packages actually provides in real life - mostly,
>> just 2 sets of icons, etc.
>> 
>>   What bothers me here however is that we uselessly package the same data
>> over and over again in machine-specific packages, plus each such recipe
>> must be modified for each new machine added to OE. Doesn't scale.

> So automate those sites so they run off a machine specified variable.
> You shouldn't have to hack the .bb's when adding a new machine (apart
> from maybe things like fstab in base-files).

  Well, that's good idea to start with, I'll into this.

> The actual packaging then becomes the only issue but that is only a
> minor issue in the big picture.

  Yes, but the one easily identifiable as being unclean. I don't say
it's high-priority, but worth keeping in mind that such issue exists.

> I've slowly being try to remove machine specific packages too
> (tslib-conf is no longer machine specific in the standard case).

  Nice! Let's move this forward then, and think about guidelines how
to handle different cases of machine-specificity. One bold example is
udevd, which (at least last time I checked) was machine-specific only
because for h2200, there was adhoc rule file added to override PCMCIA
voltages settings for some cards. As it is only additional file,
there's really no need to contaminate base package, and instead I can
imagine following ways to resolve it:

1. Add that udevd rule to common machine config package, i.e.
base-files.
2. Go even more clean and granular, and create own package for this
rule, and MACHINE_EXTRA_RRECOMMEND it.

  What do you think?


>> hx4700: PACKAGE_EXTRA_ARCHS = "armv4 armv4t armv5te iwmmxt bigscreen"
>> h4000: PACKAGE_EXTRA_ARCHS = "armv4 armv4t armv5te iwmmxt smallscreen"
>> 
>>   Voila, matching of actual bigsreen/smallscreen package will be done by
>> ipkg.

> No. Adding architectures for every machine feature is just insane.

  Well, I understand that I raise few features at the same time, and
it may be a bit confusing to follow thru them, but actual topic of all
this - how to improve machine metadata handling in OE.

  So, I don't speak about adding virtual arch for every machine
feature, but *only* for the screen size. That's the machine feature
which seems as possibly calling for that - as it's not uncommon to
supply image resources for different resolutions (i.e. these
smallscreen/bigscreen arch packages won't be just for app), plus image
resources are usually big enough to warrant placement into own
package.

> You
> need to find a better way to do it. Think about what you're suggesting
> for a minute.

  Again, if limit that to screen size property only, it's not that
bad.

  But obviously, that's not the only possible solution. Other approach
would be to consider smallscreen/bigscreen distinction just as a kind
of app theming. So, there may be red color theme, blue color theme,
or smallscreen or bigscreen theme. I'm not sure if ipkg handles OR
dependencies, but we obviously can emulate them with Provides:

Package: foo
Depends: foo-data

Package: foo-data-smallscreen
Provides: foo-data

Package: foo-data-bigscreen
Provides: foo-data


  Drawback of this approach is complication of app installation - user
will need to explicitly select which data package to install, whereas
with "virtual arch" approach this would be handled by ipkg
automagically.

> Regards,

> Richard



-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



