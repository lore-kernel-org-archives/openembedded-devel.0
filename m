Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P9IBh-0006zq-Hq
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Oct 2010 16:01:42 +0200
Received: by gyg13 with SMTP id 13so650038gyg.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Oct 2010 07:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=u6ZB8Mo0Z34ovCfmxkmkYg/2zn9lwquS6oDxSYL8DG0=;
	b=W8zgQvw528HyG7Htk1YLI6vtK7PUe7ZQ9C/uCiXlH5wtODn9SgvpE8C0ElXMIGDUIL
	g4X/Smw3QgUydt3q5I+5c7Ryx26sM2mSpmi5QbISmWBmqlGmYZsG61wbQi/vrP5p5Aey
	v6YKqoUBDp3MOOKoGFqs2jvvC912Orf9GZNu0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=to8Ksbjpi3Au11pYheWBj1NFlv2eXE3IgI19pO64gJoiXYG4Rdep2QtNlb5Qn9J1s5
	HxBUE17cW9wDusa1L7Ppjhje1AHehb3MDmIyBmkaL+2mFrOBq1H0AtBJNYklvNybEn+V
	+1ItsX3Njwq+ZeOXMzFFTV7zggqP3bVQkocrA=
MIME-Version: 1.0
Received: by 10.42.30.8 with SMTP id t8mr1829251icc.269.1287756062167; Fri, 22
	Oct 2010 07:01:02 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Fri, 22 Oct 2010 07:01:02 -0700 (PDT)
In-Reply-To: <4CC186CC.9070902@opendreambox.org>
References: <AANLkTin7MbMksEO7F4r3b-EAbCrx1ZG58OBu3ybHkNmG@mail.gmail.com>
	<i9rbsq$tad$1@dough.gmane.org> <20101022065559.GC3527@jama>
	<AANLkTi=-w36_=-iZz7QB6kjgQ8_nUfpyg9Jv3a+iHQVP@mail.gmail.com>
	<4CC186CC.9070902@opendreambox.org>
Date: Fri, 22 Oct 2010 16:01:02 +0200
Message-ID: <AANLkTimW0iYqri+QTS-KiyLnMFAVJ1f9Y3HCH-Siax7e@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
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
X-List-Received-Date: Fri, 22 Oct 2010 14:01:42 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/10/22 Andreas Oberritter <obi@opendreambox.org>:
> Hello Frans, hello all,
>
> you're describing the situation very well. I'd like to add some comments
> from the perspective of a new contributor.
>
> On 10/22/2010 09:32 AM, Frans Meulenbroeks wrote:
>> As far as I see it there are two often occurring situations:
>>
>> - a patch is submitted for review and gets zero feedback. I have quite
>> a few of these in patchwork. I once proposed that if a patch does not
>> get neg feedback in two weeks or so it could be pushed anyway. While
>> this got some positive response it was never really made a policy. But
>> I must say I'm becoming more and more inclined to push them anyway.
>>
>> - a patch is submitted by someone without commit access but no one
>> picks up the patch.
>
> Most of my patches got zero feedback. During the last 3-4 weeks, 20 of
> my patches were committed, 10 patches are still waiting in patchwork for
> a definitive ack or nack or for requests for changes. Of these 10
> patches, only 3 got (negative?) feedback:
>
> http://patchwork.openembedded.org/patch/3241/
> -> Nack, but no further reply received to my question. IMO, either my
> patch is OK or kernel.bbclass is wrong. One must be fixed, but which one
> and why?
>
> http://patchwork.openembedded.org/patch/3297/
> -> Changes requested. Could be resolved by a patch to
> lib_package.bbclass, but there were no further comments about how likely
> such a change would be accepted.
>
> http://patchwork.openembedded.org/patch/3338/
> -> Question about license raised, unknown state. If someone would like
> to look at the source, at least the header files and compat.c don't
> include license statements and compat.c looks like code which may be
> copied from a library. I guess this one could be committed with GPLv2
> and still be updated later if anyone cares enough and is sure about it.
>
> Of the 20 committed patches, only few received feedback either.
>
> I am happy whenever I see a new patch committed, but for me, as a new
> contributor, it seems impossible to predict a patch's fate until it
> finally gets merged.
>
> Btw., unfortunately, I fear that zero feedback is not limited to
> patches, but also happens to apply to questions regarding the
> preparation of patches, e.g.:
>
> http://article.gmane.org/gmane.comp.handhelds.openembedded/38203
>
> (2nd part, which I am working around now by (ab?)using ASSUME_PROVIDED)
>
> http://article.gmane.org/gmane.comp.handhelds.openembedded/38591
>
> I can understand that this happens, because the list has so much
> traffic. If I don't receive a reply to a mail within 24 hours, then I
> don't expect to get a reply at all, be it a patch or a question. Still,
> I don't know in which frequency I should ping my patches (or questions,
> if still important to me), without spamming or annoying the list.
>
>> In either case if patches just get archived without being looked at,
>> it'll probably have an adverse effects.
>> The person without commit access will probably stop submitting
>> patches, since they do not get accepted.
>> And a dev with commit access will stop to send in patches for review
>> as they will not get reviewed anyway, and only causes delay, and
>> instead push the patches directly.
>>
>> Wrt the suggested solutions:
>>
>> archiving the patches is just a way to discard them. No one is ever
>> going to pick them up from the archive. It'll probably lead to less
>> patches and disappointed submitters.
>>
>> spamming might help in the case where the submitter has commit access
>> and we decide that no feedback during some time is an implicit
>> permission to push.
>> However in the case the submitter has no commit access it will only
>> cause additional grief as the submitter becomes more aware that no one
>> bothered to do anything with his patch.
>>
>>
>> What would help a little bit is if there is an email on a status
>> change. E.g. I just noticed someone assigned two patches to me.
>> However, if I hadn't looked into patchwork while typing this message
>> it could have easily taken a week before I had noticed (actually it is
>> quite possible that they are already a week on my name).
>
> Yes, it would indeed be very helpful, if both the author and the
> assignee received emails about status updates by other developers.
>
>> What also would help is identified recipe maintainers. That way it
>> becomes clearer who should handle a patch.
>> (and I probably would not have gotten those 2 patches, as they are on
>> python related stuff and I am a python n00b, guess they should have
>> gone to Mickey or so)
>
> Actually, these two patches were delegated to Mickey for about a week
> before I delegated them to you. The reason for delegating them to you
> was that you stated that you had looked into them, showing some
> interest, hoping that you would either commit or redelegate them. ;-)
>
> The most difficult problem for delegation was, however, to find out
> nicknames used in patchwork, after searching for maintainers. One needs
> to become quite creative to solve this. :-)
>
>> And lastly it would help a little bit if it is stated somewhere if the
>> person who pushed it has commit access.
>> E.g. if someone without commit access posts a recipe or patch that
>> looks good and is not dangerous I sometimes pick it up and push them
>> after verifying that they build (e.g. the cd/dvd recipes from Andreas
>> Oberritter (sp?) ). If the person posting has commit access, I leave
>> it to them to push.
>>
>> But we of course still have the problems that
>> - people nak recipes but do not update patchwork
>> - patches receive improvement suggestions and are not updated in patchwork
>> - new versions are posted but patchwork is not updated.
>
> I try to keep patchwork updated, which means that I change states to one
> of accepted, rejected, changes requested, superseded or applied, if it's
> clear to me which one to choose. Otherwise the state stays at new.
>
> What's a good work flow for using patchwork as a patch submitter?
>
> Regards,
> Andreas
>

Hi Andreas,

Thanks for the feedback, and don't hesitate to bother people if you do
not get a reply.

To give some answers to your questions:
Wrt LICENSE: this will (quite likely) be discussed at the OE dev
meeting (OEDEM) next week fri/sat.

Wrt names: maybe we should indeed have a list somewhere. No idea if
people would want that., will try to raise it next week too.

As far as the patches concerns: I don't really feel too comfortable
when it comes to core .bbclass files; I'm not really a python wiz, so
I can't comment on them and as they influence the whole build system
I'm not going to push them without acks.

Your new cddb related patches, I've peeked into and pushed them.
Didn't really give feedback that I did. Then again if it got pushed
without comments, someone must have felt it was ok.

What also helps (and is a good source for answers) is irc.
If you join the #oe chatroom in irc there is often someone around who
can help you or point you in the right direction. Feel free to join us
over there.
(that also would help resolving names, if you've asked about me
definitely someone would have responded eFfeM. (which is actually
constructed from my initials but FM was already taken)

Best regards & thanks for your contributions! They are really valued
and (at least IMHO) of very good quality.

Frans


