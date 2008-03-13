Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1JZv5l-0008O3-2P
	for openembedded-devel@openembedded.org; Thu, 13 Mar 2008 22:36:03 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m2DLXnGi014909
	for <openembedded-devel@openembedded.org>; Thu, 13 Mar 2008 21:33:49 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 14619-07 for <openembedded-devel@openembedded.org>;
	Thu, 13 Mar 2008 21:33:41 +0000 (GMT)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m2DLXbDR014892
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>; Thu, 13 Mar 2008 21:33:37 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel <openembedded-devel@openembedded.org>
Date: Thu, 13 Mar 2008 21:33:39 +0000
Message-Id: <1205444019.4547.192.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 194.106.48.114
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Packaged Staging - 'Current' Status
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
X-List-Received-Date: Thu, 13 Mar 2008 21:36:03 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

As has been mentioned, I'm working on integrating packaged staging and
its about time I mentioned the current status. I say 'current' as it
applies to what I have offline, not what's in OE.dev. I aim to commit
some of it tomorrow but I also have some changes which should first be
discussed, more on that below.

Basically the current status is good. I've extended the class to:

* Cover -cross and -native packages apart from a list of core native
dependencies. This only applies if tmpdir didn't change between the
builds but the code takes care of checking that.
* Have a StampUpdate event handler which catches and corrects cases
where a user tries to -c compile -f some package and no workdir exists,
like the handler recently added for rm_work.

A lot of the work is actually needed outside the core class too:

I've fixed some bugs in stage-manager (it mishandled symlinks and didn't
notice files being removed).

Fixed stamp handling in bitbake so the stamps created by packages
staging are noticed. I had to rewrite the new stamp handling code in
bitbake again to get this right :/.

Also, recrdeptask handling in bitbake has some broken edge cases where
dependencies aren't pulled in. Fixing this slows down the runqueue
operations but I can't see any other way and the existing handling is
broken and badly affects packaged staging.

I've also noticed some bugs in things like the perl native package
install vs. stage functions which I'm working on fixes for.

With this code, a build of a standard image with a tmp directory empty
apart from staging packages took 4.5 minutes. That time includes
installing all the staging packages and building all the core native
dependencies. I've also been able to build new packages against a
populated staging directory although the perl native breakage shows up
since intltool-native needs perl working in staging.

What are the issues that need discussion?

First, some background. In order to build staging packages we need to
know whats in staging and from which package. Sounds simple enough until
you try :).

The current approach is to make do_populate_staging single threaded so
only on task can run at once. We take a snapshot of cross/ and staging/,
run do_stage and then take another snapshot. We can then see whats
changed. This has two problems:

1. It assumes everything going into staging goes there in do_stage
2. It makes do_populate_staging single threaded - a bottleneck

At present I plan to ignore the second issue, I have ideas about how we
can overcome that but making it work at all would be good before we
think about optimisations.

The first issue is more problematic, we also touch files in staging from
do_package, specifically the pkgdata and shlibs code. I haven't found
any other cases but I'm still fixing bugs which could be hiding things.
I'm also aware of mono.bbclass having shlibs like code.

Based on these being the main problems to fix, there are a few ways we
could make it work:

1. We add locking around these accesses increasing the bottleneck and
track which files were touched so we can add them to the staging
package. I have the latter bit working, adding the locking is trivial.
Its extremely ugly code though.
2. As per 1 but have the snapshot code ignore the pkgdata and shlibs
directories so locking isn't needed. I really don't fancy the special
cases this entails.
3. We move the pkgdata and shlibs directories to a directory alongside
staging, nothing actually mandates they should be in staging. Thanks to
ongoing efforts to abstract things, this amounts to changing the
definition of PKGDATADIR and SHLIBSDIR but that changes staging ABI. In
this case an automatic conversion is possible and our new ABI checking
code supports inline upgrades though so in theory there would be no
disruption.

I'm currently leaning in favour of option 3...

We also place parts of deploy under control of the package manager. This
means that badly versioned ipk files can be ejected with an uninstall of
the staging package, a problem most developers have probably hit at some
point and been frustrated by. The packages aren't a problem, we can
predict where they are and can package them, the problem is the
unpredictable things that are staged, specifically from custom
do_deploy() tasks.

Why are they a problem? Currently we have things like image generation
of installkits which depends on being able to find deployed data.

So we either make installkit generation optional, or put the output from
do_deploy tasks under control of the stage manager. If we do that, do we
do it with the snapshot approach or do we add a special function call
deploy tasks are mandated to use which makes sure the staging package
gets taken care of too?

Since snapshots require locking and multiple things can write to
deploy/images, I'm probably in favour of modifying do_deploy tasks to
use something like oe_libinstall (oe_deployfile?).

Sorry this is as long, hopefully this shows people things are moving
forward :) Feedback is welcome on the two changes proposed above.

Cheers,

Richard



