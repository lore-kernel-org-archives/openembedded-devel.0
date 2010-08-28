Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1OpNad-0005iX-DD
	for openembedded-devel@lists.openembedded.org;
	Sat, 28 Aug 2010 17:45:09 +0200
Received: by wwb31 with SMTP id 31so4556183wwb.24
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Aug 2010 08:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=jb6Cos+EsLKnGc69lEsWprISel4Fho9axVt0Q4hv3Uk=;
	b=mVT0FHSYFUM7UjeLoDmpBuZXjF1fm7zTszyj/yiMXg7Zl4wEbMb0w9RGLkhFYFKk/y
	eY6gGfEI4i5fMcHYSDnVOOCDevIahEhzE1ZfHi+Eeg0MTHBhtfzkeeyqquBFn4d3SmMN
	udR5SzXfjUrBpXlg2IwFgRRZ0t7U0BsumZyMs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=OGz77pIdeUyK/rOUBff4HvSxHJ1GdUBJcbv0kJb3gDf3tIcRtWTohV9469H3hKgDWT
	CezqNltSB6Kxi6fpeRJ4uoeV15IlztBfzQulfHMB2u24cKHMDNAlO71/+yU65ysL0vus
	NEZMatj7sf1C6BZdETDhdAEUnNS2/tnna7w2M=
Received: by 10.227.127.194 with SMTP id h2mr2405996wbs.74.1283010273285; Sat,
	28 Aug 2010 08:44:33 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.237.167 with HTTP; Sat, 28 Aug 2010 08:44:13 -0700 (PDT)
In-Reply-To: <4C79253F.7010504@balister.org>
References: <1282896714-3167-1-git-send-email-raj.khem@gmail.com>
	<1282896714-3167-3-git-send-email-raj.khem@gmail.com>
	<i586bt$t12$1@dough.gmane.org>
	<AANLkTikWe-88_U7FmV2mi4=J6XV-A3-nYUqJdjDNzOA9@mail.gmail.com>
	<i5aoas$sja$2@dough.gmane.org>
	<AANLkTi=stV1ahzagn-7Fzq73pL3xYDDBZpAsfRUbA86v@mail.gmail.com>
	<4C790CCD.9060403@balister.org>
	<AANLkTinMWegmS0vGvqXnkrPPqHXnDh+YkB-sxJ95KcTp@mail.gmail.com>
	<4C79253F.7010504@balister.org>
From: Chris Larson <clarson@kergoth.com>
Date: Sat, 28 Aug 2010 08:44:13 -0700
X-Google-Sender-Auth: lXI-lvifxn2--yYCQpMFWeWAjbQ
Message-ID: <AANLkTi=qHjTPQ6rqFAP8OpTHnYHS+K0R9vjkBCs0SW5=@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH 2/2] recipes: Update recipes to get 'bitbake world' parse and calculate runqueue successfully.
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
X-List-Received-Date: Sat, 28 Aug 2010 15:45:09 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Aug 28, 2010 at 8:03 AM, Philip Balister <philip@balister.org>wrote:

> On 08/28/2010 10:39 AM, Chris Larson wrote:
>
>> On Sat, Aug 28, 2010 at 6:19 AM, Philip Balister<philip@balister.org
>> >wrote:
>>
>>  On 08/28/2010 07:51 AM, Frans Meulenbroeks wrote:
>>>
>>>  2010/8/28 Koen Kooi<k.kooi@student.utwente.nl>:
>>>>
>>>>  -----BEGIN PGP SIGNED MESSAGE-----
>>>>> Hash: SHA1
>>>>>
>>>>> Your patch does too many things at once, to recipes I maintain, so
>>>>> please split it up per recipe and I'll ack/nack the seperate patches.
>>>>> I'm getting suck of such jumbo patches that can't be reverted cleanly.
>>>>> I'm still dealing with the fallout from the crappy deletions frans did,
>>>>> so patches like this aren't helping.
>>>>>
>>>>>
>>>> Ehm, I did not see a request to revert any of the deletions.
>>>> There have been two issues (openssl and docbook-sgml-dtd, and both
>>>> have been reverted in 16 hrs or so. (and later on one or two other
>>>> deletions have been reverted on request of the recipe owners, but
>>>> these did not cause any breakage afaik).
>>>> So I really don't know what fallout you are dealing with.
>>>> And my deletions were not exactly jumbo patches and were very easy to
>>>> revert if needed.
>>>>
>>>> And as I already wrote before: dev head is bleeding edge, so sometimes
>>>> things go wrong. Can happen. No big deal if resolved quickly. That is
>>>> the risk of living on the edge. If you can't live with that use the
>>>> stable branch or create your own branch where you are in full control.
>>>> The root cause is that you do what can be considered production work
>>>> on dev head. Most seasoned software engineers will agree that that is
>>>> not very wise and
>>>>
>>>> BTW apparently your perception on my work apparently is a minority
>>>> viewpoint. If I recall correctly two people complained to me and at
>>>> least 5 mentioned to me that they appreciated my activity.
>>>>
>>>>
>>> Add my voice to the "minority". You've been pushing some large patches
>>> that
>>> work for you, but may not for others. There is always work in progress in
>>> .dev, so all recipes may not meet your standards.
>>>
>>
>>
>> *Every* patch that gets proposed is a patch that "works for you, but may
>> not
>> for others".  You simply can't test every combination for every change you
>> make, it's not possible.  As long as these sorts of patches go the list
>> for
>> review, as they now seem to be, I don't see the problem.
>>
>
> Yes, but 99% of patches are small enough that they are easily fixable as
> problems come up, and the impact is limited.
>
> I'd also question the wisdom of doing changes with broad impact during
> July/August. It seems like a large number of people are on extended
> vacations during this time period.


Are we going to block off every other part of the year where people take
vacations too?  Please.  We'd better never do any real development during
Christmas or New Years either.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

