Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1P6kb7-0005fa-GJ
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Oct 2010 15:45:36 +0200
Received: by fxm6 with SMTP id 6so403120fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Oct 2010 06:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=pF/Oo0N5jpQ8s2KEPb2e2i4uxccpuyGkskgb7pl41h4=;
	b=XPt2pp+Wn5sU/98cVDt+yrX7eRbJxbFCIBqbD/sxRbWDrM6EUG9navPWQ4Z066ZT1l
	BvltIJwoZ+VGVzut0VAiEnfY3hocJjnrn6DxyRgGWZRzd5rAqlH+2CNiqfhy0slvnRmE
	+J3RRIRHxvFfIcECDjfTZoHrXmrH8XZGAiEoI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=QYmI2qfbYMmPUvh9OUOt39cSxIjpOCu29UXMXYs6S6BhDm2tS0Xy/DacVfSBXIPRn7
	yU4lx/9eMxjdhz2uBsKyNsszq2yPyH7nLy3AOU+6r8W9as/82iH58z5YKVLQwhiZGhQY
	DCHzfoSMSVc/pM14NEXGI5u6z60RuhxjRCwiY=
Received: by 10.216.65.70 with SMTP id e48mr1602599wed.44.1287150292423; Fri,
	15 Oct 2010 06:44:52 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.0.142 with HTTP; Fri, 15 Oct 2010 06:44:30 -0700 (PDT)
In-Reply-To: <AANLkTim+-eUy6sZXMx7m+fJs8MUz0-1AqNtH8fd5akAE@mail.gmail.com>
References: <AANLkTimdcdr2mSBOzaKJ2FTuR=KBbropdvobucfQx5Wx@mail.gmail.com>
	<AANLkTi=9A-00vr+NZscVbeiZjbHO7eqaMoQF_pmabBtg@mail.gmail.com>
	<AANLkTim+-eUy6sZXMx7m+fJs8MUz0-1AqNtH8fd5akAE@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Fri, 15 Oct 2010 06:44:30 -0700
X-Google-Sender-Auth: 4b469j5Z3PHN2YiAJ3KRVIvuua0
Message-ID: <AANLkTi=+RMeT0R=5k33sKUNGrzivZzcWnsdB9opuh+NG@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Bitbaking while modifying recipes
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
X-List-Received-Date: Fri, 15 Oct 2010 13:45:36 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Oct 14, 2010 at 11:40 PM, Frans Meulenbroeks <
fransmeulenbroeks@gmail.com> wrote:

> 2010/10/14 Chris Larson <clarson@kergoth.com>:
> > On Thu, Oct 14, 2010 at 1:14 PM, Ash Charles <ashcharles@gmail.com>
> wrote:
> >
> >> Hi,
> >>
> >> At what point in bitbaking a recipe is it safe to start modifying the
> >> recipe without risk of messing up the current bitbake build?  I often
> >> find myself kicking off a bitbake and then wanting to do some git
> >> operations in my openembedded recipes tree.  Previously I've resisted
> >> the urge to mess around until whatever is being bitbaked is done but I
> >> suspect that I'd be fine to make changes as soon as the parse step is
> >> completed.  Is this correct?
> >
> >
> > Unfortunately not.  As things stand today, the upfront parsing phase is
> only
> > used to populate the cache / obtain the info necessary to construct the
> > runqueue.  The recipes are actually *reparsed* when each task is
> executed.
> >  The time taken by the parse is rather trivial, so its not much of an
> issue,
> > but I do have a patch in queue from a coworker to make it cache the
> parsed
> > recipe until the last task for that recipe is run.
> >
> > So, basically, continue to resist the urge :)
> >
> As far as I see it (and this seems not to contradict with what Chris
> wrote) it is ok to work on a recipe after the parsing has finished if
> it is a recipe that is not being build (either directly or indirectly
> through depends).
> E.g. if you are building busybox I feel you could still work on a qt
> recipe while the busybox build is in progress ((or even on another
> version of the busybox recipe (e.g. one with DEFAULT_PREFERENCE =
> "-1"))
>
> Chris, can you confirm?


Yeah, that's correct.  After the initial parse, the only recipes which get
parsed again are those involved in the build.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

