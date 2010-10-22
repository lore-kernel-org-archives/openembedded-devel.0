Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1P9JDv-0006St-9M
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Oct 2010 17:08:04 +0200
Received: by ywa8 with SMTP id 8so789843ywa.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Oct 2010 08:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=bIE23Ypa3QWg8f4jkRSTXIo99x8rosxhr+WT0kYhSbU=;
	b=UVe57kbeDGPP8d/hBB+KSLWntIu+rheoZJIQSkTXpDVbVy6BDJSSAhFwpiYsYmA5jn
	AJLTFssSUzlGU8PkC243a0ycbjC6lOIMHpleKGb2yubqfGklVLUVY1dNqpL0gtlrcWT+
	VlgxzjxHQgg2jIBYsqpOK3rugsAmuh4gA9ZTk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=ZoKu3X/BUpfp7a9OVKBQ11Q56MFhBNJ5jKPG1j/YGMJMJJrmgJsfkQZS31KI2CZDZY
	AunrQCHN9tC4MGTLx09Mws0+HuWu8RG4+5cxZQrI6HhL+WUf7oEGf1kQu33Tu5McrJz1
	R66T7BLMtw4xUrMAqzt/3FW8356rji5DRZAd4=
Received: by 10.90.54.1 with SMTP id c1mr2357389aga.25.1287760044894; Fri, 22
	Oct 2010 08:07:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.90.86.6 with HTTP; Fri, 22 Oct 2010 08:07:04 -0700 (PDT)
In-Reply-To: <4CC186CC.9070902@opendreambox.org>
References: <AANLkTin7MbMksEO7F4r3b-EAbCrx1ZG58OBu3ybHkNmG@mail.gmail.com>
	<i9rbsq$tad$1@dough.gmane.org> <20101022065559.GC3527@jama>
	<AANLkTi=-w36_=-iZz7QB6kjgQ8_nUfpyg9Jv3a+iHQVP@mail.gmail.com>
	<4CC186CC.9070902@opendreambox.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 22 Oct 2010 08:07:04 -0700
Message-ID: <AANLkTikrfGNs2Dvwzmms8rPH0WB=YA8-qSkKaMsmZ977@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
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
X-List-Received-Date: Fri, 22 Oct 2010 15:08:04 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Oct 22, 2010 at 5:42 AM, Andreas Oberritter
<obi@opendreambox.org> wrote:
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

well you submit your patches and start the counter. If it does not get
attention then there could be many reasons
and you have to keep reminding the list. But getting patches to list
and reviewed is absolutely a step towards
good quality. OE is relatively OK in applying them. Developers need to
help a bit and it takes time to test them out.

> Regards,
> Andreas
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


