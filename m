Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1OJD8I-00038Z-UQ
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Jun 2010 00:06:58 +0200
Received: by vws4 with SMTP id 4so1111519vws.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 May 2010 15:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=nmvfqiI05919mXKjcuul5X/ABmHvbHUUWUP8bBDoFqY=;
	b=p/4Z1TtRyyrArUWrug0MHyzNx7gUj+Gjw02wC3UKPLTs1mtGzAlTb+0fLGN3rX7mhh
	6NlWG9w0lUz3R/cCv1LdhrZwurB3oxOFfH11TQxSy2YQ6tda7sp9jAk+sMduFWQ5v+3H
	7ZpwuEewksQinOyO7BXQsU4dBmyPvLsESsP0o=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=TYAsaNuFMhhLmhJ5neAe6UOuiox012CmEnPmi5vL480qkHazHnj1qlOFjdyGNcUhIG
	xz4P35aTXs3vIyjpwA3iU0tziJYeg3kjHSdIaWsDbk4vdoxj+PgHjsCbe68xlTeF82IY
	YetNdTRFcZj9mIkOjqY3yGt6A8udajVyqdel0=
Received: by 10.224.34.135 with SMTP id l7mr1924064qad.341.1275343351229; Mon, 
	31 May 2010 15:02:31 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.217.136 with HTTP; Mon, 31 May 2010 15:02:11 -0700 (PDT)
In-Reply-To: <AANLkTinfdaWq9aYzYEoDAWztRypqhzOlgnEl4CQCnwq4@mail.gmail.com>
References: <AANLkTikSWC_FtAqHKBgX0bbiXHC52ClrAnLLg7Z7GYRs@mail.gmail.com> 
	<AANLkTinfdaWq9aYzYEoDAWztRypqhzOlgnEl4CQCnwq4@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Mon, 31 May 2010 15:02:11 -0700
X-Google-Sender-Auth: boHsGrx4hmk0MqM8bLMhFCzA4Lk
Message-ID: <AANLkTimCjoM8CkTkkNfzWM1AAXDyIgCRHIPcpHPRBCKV@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.212.47
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: gitver problems
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
X-List-Received-Date: Mon, 31 May 2010 22:06:59 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, May 31, 2010 at 2:54 PM, Cliff Brake <cliff.brake@gmail.com> wrote:

> As I continue to ponder this, it seem it makes sense to simple include
> the bitbake recipe directly in the application source.  This makes it
> very easy and consistent to set the source directory 'S'.  The big
> advantage with this is we easily know the location of the source tree
> -- its just the same place as the bitbake recipe.
>
> ============================
> # recipe to build the autotools-demo in the working tree
>
> inherit srctree autotools gitver
>
> PV = "${GITVER}"
> S = "${FILE_DIRNAME}"
> ============================
>
> Now, anyone can add this application to their recipe tree very simply by:
>
> cd <oe>/recipes
> git clone git://git.bec-systems.com/autotools-demo
> cd -
> bitbake autotools-demo
>
> Now, I no longer see the below errors, so that is good.  However, I
> see following problem:
>
> cbrake@happy:/scratch/oe/oe-build/oe$ bitbake autotools-demo
> NOTE: Handling BitBake files: \ (8385/8385) [100 %]
> Parsing of 8385 .bb files complete (7917 cached, 468 parsed). 8306
> targets, 333 skipped, 1 masked, 0 errors.
> NOTE: Resolving any missing task queue dependencies
> NOTE: Preparing runqueue
> NOTE: Executing runqueue
> NOTE: Running task 723 of 733 (ID: 0,
> /scratch/oe/oe-build/oe/openembedded.custom/recipes/autotools-demo/
> autotools-demo.bb,
> do_populate_sysroot)
> NOTE: Running task 724 of 733 (ID: 6,
> /scratch/oe/oe-build/oe/openembedded.custom/recipes/autotools-demo/
> autotools-demo.bb,
> do_distribute_sources)
> NOTE: package autotools-demo-1.0-1-ga33ef01-r0: task
> do_populate_sysroot: Started
> NOTE: autotools-demo-1.0-1-ga33ef01-r0: executing task do_configure
> NOTE: package autotools-demo-1.0-1-ga33ef01-r0: task do_configure: Started
> NOTE: package autotools-demo-1.0-1-ga33ef01-r0: task
> do_distribute_sources: Started
> NOTE: package autotools-demo-1.0-1-ga33ef01-r0: task
> do_distribute_sources: Succeeded
> NOTE: package autotools-demo-1.0-1-ga33ef01-r0: task do_configure:
> Succeeded
> NOTE: autotools-demo-1.0-1-ga33ef01-r0: executing task do_qa_configure
> NOTE: package autotools-demo-1.0-1-ga33ef01-r0: task do_qa_configure:
> Started
> NOTE: package autotools-demo-1.0-1-ga33ef01-r0: task do_qa_configure:
> Succeeded
> NOTE: autotools-demo-1.0-1-ga33ef01-r0: executing task do_compile
> NOTE: package autotools-demo-1.0-1-ga33ef01-r0: task do_compile: Started
> NOTE: package autotools-demo-1.0-1-ga33ef01-r0: task do_compile: Succeeded
> NOTE: autotools-demo-1.0-1-ga33ef01-r0: executing task do_install
> NOTE: package autotools-demo-1.0-1-ga33ef01-r0: task do_install: Started
> NOTE: package autotools-demo-1.0-1-ga33ef01-r0: task do_install: Succeeded
> FATAL: Unable to start to 'None' UI due to exception: 23634.
> ERROR: TaskFailed event exception, aborting
> ERROR: Build of
> /scratch/oe/oe-build/oe/openembedded.custom/recipes/autotools-demo/
> autotools-demo.bb
> do_qa_staging failed
> ERROR: TaskFailed event exception, aborting
> ERROR: Build of
> /scratch/oe/oe-build/oe/openembedded.custom/recipes/autotools-demo/
> autotools-demo.bb
> do_package failed
>
> If anyone is interested in reproducing this problem, it should be very
> simple by running the above instructions.
>
> This concept seems fairly useful to me in that it allows device
> developers to easily add their custom applications to an OE build, and
> everything is on one place.  I think the existing separation of recipe
> and work tree makes sense for canned stuff that OE provides, but
> device developers need an easier way to do iterative target
> development, and I think a working srctree/gitver gives us that.  The
> git submodule mechanism is very exciting in that it gives us a
> standard way to lock down versions of various submodules without
> reverting to manually specifying hash values in recipes, etc.
>

If you look at srctree, you'll see that it sets S to FILE_DIRNAME
automatically, so there's no need to do so in the recipe itself.  This is
the sort of thing I intended it to be used for.  submodule is a good idea as
one approach for it.  I have an old repository where I was able to
successfully build busybox, shasum-native, and linux from local source trees
with a '.bb' and '.native.bb' in each, and 'PN' set from the directory name.

I'll see if I can reproduce your issue with your instructions, hopefully we
can get this fixed.  Personally, I really like the idea of having an entire
bitbake/oe overlay where there's no fetch/unpack/patch involved at all, just
builds in local trees.  It would make it so much easier for someone to see
what's happening in a build, in my opinion.  Things aren't 42 levels deep in
TMPDIR.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

