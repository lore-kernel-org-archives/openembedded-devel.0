Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P9C7Z-0003FS-Ki
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Oct 2010 09:33:02 +0200
Received: by gyg13 with SMTP id 13so379195gyg.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Oct 2010 00:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=tBwXjNVnJSw305NA5Wwn7ciEQBsn5rBwxxLMhw7JcV0=;
	b=eOQyySmshMEz4EjWCR1K3rliqYpoWk9mDzG2K/r+aNTKbhYnDG7QzssqznGG4YvDZb
	VubsUVl/auD8Ade7EVVWCOpPk+cx2R6x6djcK/kVP0PuxbkLVnhbLbS97o10VFp1taTx
	Dtu6TMI3xhD/OVJ5y3t68XJEjL2lRHtKE6coM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=LSYa+gTrh1I6+lSnyvnPY8p2IR/w2EjvXIhXYMQIH7zqdVLv483TfHmpvTefUzMgDG
	5CthE6P/Am7GvnriDPlTozyfN6ITxmmxVwx1MqBmW9Ae+52kQzhdO0D+YerEzSUu5vp/
	7IyYkFcVJ90scZP/jGlVmjw9wI4FVYBbcNC/U=
MIME-Version: 1.0
Received: by 10.42.178.65 with SMTP id bl1mr266768icb.184.1287732739561; Fri,
	22 Oct 2010 00:32:19 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Fri, 22 Oct 2010 00:32:19 -0700 (PDT)
In-Reply-To: <20101022065559.GC3527@jama>
References: <AANLkTin7MbMksEO7F4r3b-EAbCrx1ZG58OBu3ybHkNmG@mail.gmail.com>
	<i9rbsq$tad$1@dough.gmane.org> <20101022065559.GC3527@jama>
Date: Fri, 22 Oct 2010 09:32:19 +0200
Message-ID: <AANLkTi=-w36_=-iZz7QB6kjgQ8_nUfpyg9Jv3a+iHQVP@mail.gmail.com>
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
X-List-Received-Date: Fri, 22 Oct 2010 07:33:02 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/10/22 Martin Jansa <martin.jansa@gmail.com>:
> On Fri, Oct 22, 2010 at 08:44:42AM +0200, Koen Kooi wrote:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> On 21-10-10 22:58, Khem Raj wrote:
>> > Hello OE'ers
>> >
>> > We have accumulated quite a bit of mails in patchwork. Patches that
>> > are send to OE ml are nicely captured by
>> > patchwork and shown when one visits http://patchwork.openembedded.org
>> >
>> > It would be nice if committers,reviewers and authors update the patch
>> > status when they deal with the patch
>> >
>> > So please spare few minutes and have a look at the patchlist and see
>> > if there is a patch authored or committed by you and update the status
>> > accordingly.
>> >
>> > I regularly use this tool to pick up patches and this exercise will
>> > help to remove the stale patch states
>>
>> We can do as we did in the past and say "On the first of november we're
>> archiving all patches older than october 2010" to give people a bit more
>> incentive.
>
> Would be nice to have spam feature in patchwork.
>
> Just sending state query to every Submitter email for patches in some
> state (in this case not archived, "Action Required"), with link to it's
> patchwork entry.
>
> Maybe someone with better patchwork knowledge or pwclient can get the
> list of Submitters easier than parsing html?
>
> Regards,

Nice ideas, but....

As far as I see it there are two often occurring situations:

- a patch is submitted for review and gets zero feedback. I have quite
a few of these in patchwork. I once proposed that if a patch does not
get neg feedback in two weeks or so it could be pushed anyway. While
this got some positive response it was never really made a policy. But
I must say I'm becoming more and more inclined to push them anyway.

- a patch is submitted by someone without commit access but no one
picks up the patch.

In either case if patches just get archived without being looked at,
it'll probably have an adverse effects.
The person without commit access will probably stop submitting
patches, since they do not get accepted.
And a dev with commit access will stop to send in patches for review
as they will not get reviewed anyway, and only causes delay, and
instead push the patches directly.

Wrt the suggested solutions:

archiving the patches is just a way to discard them. No one is ever
going to pick them up from the archive. It'll probably lead to less
patches and disappointed submitters.

spamming might help in the case where the submitter has commit access
and we decide that no feedback during some time is an implicit
permission to push.
However in the case the submitter has no commit access it will only
cause additional grief as the submitter becomes more aware that no one
bothered to do anything with his patch.


What would help a little bit is if there is an email on a status
change. E.g. I just noticed someone assigned two patches to me.
However, if I hadn't looked into patchwork while typing this message
it could have easily taken a week before I had noticed (actually it is
quite possible that they are already a week on my name).

What also would help is identified recipe maintainers. That way it
becomes clearer who should handle a patch.
(and I probably would not have gotten those 2 patches, as they are on
python related stuff and I am a python n00b, guess they should have
gone to Mickey or so)

And lastly it would help a little bit if it is stated somewhere if the
person who pushed it has commit access.
E.g. if someone without commit access posts a recipe or patch that
looks good and is not dangerous I sometimes pick it up and push them
after verifying that they build (e.g. the cd/dvd recipes from Andreas
Oberritter (sp?) ). If the person posting has commit access, I leave
it to them to push.

But we of course still have the problems that
- people nak recipes but do not update patchwork
- patches receive improvement suggestions and are not updated in patchwork
- new versions are posted but patchwork is not updated.

Guess we could discuss this at OEDEM.
Also I would not mind to have a session at OEDEM (fri evening?) where
we go through the list and decide per patch what to do with it, or
whom to assign it to.

Best regards, Frans


