Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <obi@opendreambox.org>) id 1P9Gy7-00046I-UI
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Oct 2010 14:43:37 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id 176C3314A075
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Oct 2010 14:43:00 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id a0ivDri6tI45
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Oct 2010 14:42:53 +0200 (CEST)
Received: from [172.22.22.60] (ip-109-90-189-193.unitymediagroup.de
	[109.90.189.193])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.multimedia-labs.de (Postfix) with ESMTPSA id 09BEB314A080
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Oct 2010 14:42:53 +0200 (CEST)
Message-ID: <4CC186CC.9070902@opendreambox.org>
Date: Fri, 22 Oct 2010 14:42:52 +0200
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.14) Gecko/20101006 Thunderbird/3.0.9
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTin7MbMksEO7F4r3b-EAbCrx1ZG58OBu3ybHkNmG@mail.gmail.com>	<i9rbsq$tad$1@dough.gmane.org>
	<20101022065559.GC3527@jama>
	<AANLkTi=-w36_=-iZz7QB6kjgQ8_nUfpyg9Jv3a+iHQVP@mail.gmail.com>
In-Reply-To: <AANLkTi=-w36_=-iZz7QB6kjgQ8_nUfpyg9Jv3a+iHQVP@mail.gmail.com>
X-SA-Exim-Connect-IP: 82.149.226.172
X-SA-Exim-Mail-From: obi@opendreambox.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: patchwork cleanup call
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
X-List-Received-Date: Fri, 22 Oct 2010 12:43:37 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello Frans, hello all,

you're describing the situation very well. I'd like to add some comments
from the perspective of a new contributor.

On 10/22/2010 09:32 AM, Frans Meulenbroeks wrote:
> As far as I see it there are two often occurring situations:
> 
> - a patch is submitted for review and gets zero feedback. I have quite
> a few of these in patchwork. I once proposed that if a patch does not
> get neg feedback in two weeks or so it could be pushed anyway. While
> this got some positive response it was never really made a policy. But
> I must say I'm becoming more and more inclined to push them anyway.
> 
> - a patch is submitted by someone without commit access but no one
> picks up the patch.

Most of my patches got zero feedback. During the last 3-4 weeks, 20 of
my patches were committed, 10 patches are still waiting in patchwork for
a definitive ack or nack or for requests for changes. Of these 10
patches, only 3 got (negative?) feedback:

http://patchwork.openembedded.org/patch/3241/
-> Nack, but no further reply received to my question. IMO, either my
patch is OK or kernel.bbclass is wrong. One must be fixed, but which one
and why?

http://patchwork.openembedded.org/patch/3297/
-> Changes requested. Could be resolved by a patch to
lib_package.bbclass, but there were no further comments about how likely
such a change would be accepted.

http://patchwork.openembedded.org/patch/3338/
-> Question about license raised, unknown state. If someone would like
to look at the source, at least the header files and compat.c don't
include license statements and compat.c looks like code which may be
copied from a library. I guess this one could be committed with GPLv2
and still be updated later if anyone cares enough and is sure about it.

Of the 20 committed patches, only few received feedback either.

I am happy whenever I see a new patch committed, but for me, as a new
contributor, it seems impossible to predict a patch's fate until it
finally gets merged.

Btw., unfortunately, I fear that zero feedback is not limited to
patches, but also happens to apply to questions regarding the
preparation of patches, e.g.:

http://article.gmane.org/gmane.comp.handhelds.openembedded/38203

(2nd part, which I am working around now by (ab?)using ASSUME_PROVIDED)

http://article.gmane.org/gmane.comp.handhelds.openembedded/38591

I can understand that this happens, because the list has so much
traffic. If I don't receive a reply to a mail within 24 hours, then I
don't expect to get a reply at all, be it a patch or a question. Still,
I don't know in which frequency I should ping my patches (or questions,
if still important to me), without spamming or annoying the list.

> In either case if patches just get archived without being looked at,
> it'll probably have an adverse effects.
> The person without commit access will probably stop submitting
> patches, since they do not get accepted.
> And a dev with commit access will stop to send in patches for review
> as they will not get reviewed anyway, and only causes delay, and
> instead push the patches directly.
> 
> Wrt the suggested solutions:
> 
> archiving the patches is just a way to discard them. No one is ever
> going to pick them up from the archive. It'll probably lead to less
> patches and disappointed submitters.
> 
> spamming might help in the case where the submitter has commit access
> and we decide that no feedback during some time is an implicit
> permission to push.
> However in the case the submitter has no commit access it will only
> cause additional grief as the submitter becomes more aware that no one
> bothered to do anything with his patch.
> 
> 
> What would help a little bit is if there is an email on a status
> change. E.g. I just noticed someone assigned two patches to me.
> However, if I hadn't looked into patchwork while typing this message
> it could have easily taken a week before I had noticed (actually it is
> quite possible that they are already a week on my name).

Yes, it would indeed be very helpful, if both the author and the
assignee received emails about status updates by other developers.

> What also would help is identified recipe maintainers. That way it
> becomes clearer who should handle a patch.
> (and I probably would not have gotten those 2 patches, as they are on
> python related stuff and I am a python n00b, guess they should have
> gone to Mickey or so)

Actually, these two patches were delegated to Mickey for about a week
before I delegated them to you. The reason for delegating them to you
was that you stated that you had looked into them, showing some
interest, hoping that you would either commit or redelegate them. ;-)

The most difficult problem for delegation was, however, to find out
nicknames used in patchwork, after searching for maintainers. One needs
to become quite creative to solve this. :-)

> And lastly it would help a little bit if it is stated somewhere if the
> person who pushed it has commit access.
> E.g. if someone without commit access posts a recipe or patch that
> looks good and is not dangerous I sometimes pick it up and push them
> after verifying that they build (e.g. the cd/dvd recipes from Andreas
> Oberritter (sp?) ). If the person posting has commit access, I leave
> it to them to push.
> 
> But we of course still have the problems that
> - people nak recipes but do not update patchwork
> - patches receive improvement suggestions and are not updated in patchwork
> - new versions are posted but patchwork is not updated.

I try to keep patchwork updated, which means that I change states to one
of accepted, rejected, changes requested, superseded or applied, if it's
clear to me which one to choose. Otherwise the state stays at new.

What's a good work flow for using patchwork as a patch submitter?

Regards,
Andreas


