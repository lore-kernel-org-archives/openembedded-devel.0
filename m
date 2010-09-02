Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vwyodapink@gmail.com>) id 1Or3Yq-0006KQ-0F
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Sep 2010 08:46:13 +0200
Received: by wwb31 with SMTP id 31so253535wwb.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Sep 2010 23:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=1gZYxoQXYNC4DPxpIcy+s5Wz8ew+uqOXABJ9e8lmhRw=;
	b=oel8h2OhSs58l/SbN6r9vd2sDSWGZ8hh9U2tB/eJbEDYUkK4IEiYaPYUls5O8iJipP
	QrOJKBvfyF+/JUP6T3ZPoV1sU/VHj0O3xPnXRF36AppLx3nW+fV7MkAulKvZYUEiRBZ7
	C1s/a9nQXI3aBeY/OMCb/B8GQjAKEaXxPyf1o=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=rWxGptZzp0BTUkTF6p3DMQTPafARKs1wW/taaQ5RLzpAD9VKWO38yKEhnDiymp+DOB
	sEKN0GyPD3Z8pnWJZd0gCQTHFG0qOFqgi2KN7ikknPvI5uCFeN4I39AkFrUPkwQkOkck
	Nr0antabl52IS6//4SXCbeD4FN8lMr0E+/m64=
MIME-Version: 1.0
Received: by 10.216.159.6 with SMTP id r6mr945231wek.55.1283409937014; Wed, 01
	Sep 2010 23:45:37 -0700 (PDT)
Received: by 10.216.179.76 with HTTP; Wed, 1 Sep 2010 23:45:36 -0700 (PDT)
In-Reply-To: <AANLkTi=OQ5tAiPObaex4c2qUof_buQpB6PrOn=QGRxa0@mail.gmail.com>
References: <AANLkTimeV1FbwQCMYL7WH3tuo_zwcYX1o9cs1H66VPhu@mail.gmail.com>
	<AANLkTinqVEs+Uh6jNJJVzqjE2SXMbM1ni60nUx+qtXka@mail.gmail.com>
	<AANLkTimamK0_tQw32zWAuANT2fBTDgSHUdPZPWbe-E-3@mail.gmail.com>
	<AANLkTimEE4VSR3C6XSQUCYXTgbA1m=Zdw1f8w9vm76_X@mail.gmail.com>
	<AANLkTimwWFkDscFgDvQQzNbXm+t4SXKnCbWQobK2nu9U@mail.gmail.com>
	<4C7EC5B2.5090202@mentor.com>
	<AANLkTi=OQ5tAiPObaex4c2qUof_buQpB6PrOn=QGRxa0@mail.gmail.com>
Date: Wed, 1 Sep 2010 23:45:36 -0700
Message-ID: <AANLkTikHe7GJy8H1ne0hkdMqOe-2u3Ma+sPZvCzdvdgR@mail.gmail.com>
From: "J. L. " <vwyodapink@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: vwyodapink@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: libxml-namespacesupport-perl stuck in do configure
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
X-List-Received-Date: Thu, 02 Sep 2010 06:46:14 -0000
Content-Type: text/plain; charset=ISO-8859-1

I am building on the overo branch and its as updated as can be.

Version number was namespace_1.10

I verified the patch is in there and exactly the same as the one you
linked to. So that means it had to be there before I tried to build
this since I git pull'ed before starting this series of builds.

Build machine is Ubuntu 9.10, I am also running into other issues
installing Perl modules other than this one as well with different
issues but I am sorting through them to make sure as much as possible
its not me to the best of my knowledge causing them before posting
them. Also 3-4 days ago I started doing the tinderbox results on my
builds in case that would help you anymore in seeing more information.
I am willing on anything I post to the board to give as much info and
look for what ever or anything to help out as much as I can until I
can actually be more of a help than an annoyance on here.

Again thanks

On Wed, Sep 1, 2010 at 11:29 PM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> 2010/9/1 Tom Rini <tom_rini@mentor.com>:
>> Frans Meulenbroeks wrote:
>>>
>>> 2010/9/1 J. L. <vwyodapink@gmail.com>:
>>>>
>>>> Thanks Frans that fixed it by setting up CPAN on the build machine :)
>>>
>>> J.L, thanks for reporting this back.
>>>
>>> Actually we do need a real fix for this.
>>> any perl wizards that can take this up?
>>
>> I'm confused since I thought I had done this already with
>> 71a16be679041bb042c02f0f59c56141d963562c
>>
>> --
>> Tom Rini
>> Mentor Graphics Corporation
>
> J.L. what version were you building?
> Did you have this patch? (url:
> http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=71a16be679041bb042c02f0f59c56141d963562c
> )
> I must say I haven't seen the problem recently but once you've
> configured cpan the problem is away. Not sure on how to test/reproduce
> this.
>
> Frans
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


