Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1P6UXO-0006Ly-VF
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Oct 2010 22:36:32 +0200
Received: by ewy1 with SMTP id 1so2737997ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Oct 2010 13:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=MjvcbFzuMGFduiQl80bkdpvx6RaCgfLsW11BuoEaQLE=;
	b=jud/hsS66x6pK1Dy1kJbcVcKW0icZ9KKoSMgPZ3d4fUtmaCO4TFqGvx5dcJJgkhhsU
	VQriMNAW08d6aIz5W1JxXP478yifYmhFmlTjyTuu1tDleNUkTwofd28E7V2ux3RF7u5z
	7d6CCNRUBaPNV98PIvFH2sKkMHcnEeygjaINw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=K9kLKoP1CIOMGI9NxynLL8zB1JzTabtqoZXjMnjEE6FigjhOx26beUitGXDtCWUQIn
	y8NDyN6Y99WqyC+X6B59SN+lcywlG1XP+ZBldI/ebesOQT16An7enkbw5wfeYkQudQf5
	PZJuxLYmpG1a1IvekyEBx5QHXqNt3gMyc59yk=
Received: by 10.216.91.16 with SMTP id g16mr3577168wef.78.1287088563203; Thu,
	14 Oct 2010 13:36:03 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.0.142 with HTTP; Thu, 14 Oct 2010 13:35:42 -0700 (PDT)
In-Reply-To: <AANLkTimdcdr2mSBOzaKJ2FTuR=KBbropdvobucfQx5Wx@mail.gmail.com>
References: <AANLkTimdcdr2mSBOzaKJ2FTuR=KBbropdvobucfQx5Wx@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 14 Oct 2010 13:35:42 -0700
X-Google-Sender-Auth: tOvMuNwvr8a1xQXoVKWDqMSCaHc
Message-ID: <AANLkTi=9A-00vr+NZscVbeiZjbHO7eqaMoQF_pmabBtg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.215.47
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
X-List-Received-Date: Thu, 14 Oct 2010 20:36:32 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Oct 14, 2010 at 1:14 PM, Ash Charles <ashcharles@gmail.com> wrote:

> Hi,
>
> At what point in bitbaking a recipe is it safe to start modifying the
> recipe without risk of messing up the current bitbake build?  I often
> find myself kicking off a bitbake and then wanting to do some git
> operations in my openembedded recipes tree.  Previously I've resisted
> the urge to mess around until whatever is being bitbaked is done but I
> suspect that I'd be fine to make changes as soon as the parse step is
> completed.  Is this correct?


Unfortunately not.  As things stand today, the upfront parsing phase is only
used to populate the cache / obtain the info necessary to construct the
runqueue.  The recipes are actually *reparsed* when each task is executed.
 The time taken by the parse is rather trivial, so its not much of an issue,
but I do have a patch in queue from a coworker to make it cache the parsed
recipe until the last task for that recipe is run.

So, basically, continue to resist the urge :)
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

