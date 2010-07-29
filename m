Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1OeJ3X-0006Ma-5d
	for openembedded-devel@lists.openembedded.org;
	Thu, 29 Jul 2010 04:41:12 +0200
Received: by ywe9 with SMTP id 9so44774ywe.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Jul 2010 19:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=I8+NAj7cVFoMLQDfOQ+c7A3y1jDBhLFGqxFbJs+se/Y=;
	b=pAEdVQMX9O9H4sL7HqGFtrIg47u2OefoEmfcPPed8O1KGzzzrdiQhVRO3Ab/YWSzbq
	fTpXxW1l/f1tjGdXQ63EaF607RKVDis5I+i/hi+2qUS5cd3S2Bmzrb37btOHaQHxo5Ws
	0EG4E4fXYXGiPqajUZD6gwwPwsZhfOowbGLYc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=C/uZWlcUUnU8ZZqdvXBc3fMx3OO8yiaEbClw1aA8dmzMdt8DD6bu86gALeALHRQSUx
	2QzQKSKJhTWqQX+H3aiSzkkNpfw9SpwGc5rrhSFHmexEeh29y142+bmQrdrcSqLR0LjE
	sl9WMDZiydFvN/zUImtRtYpkNzZlvi3cVvZbs=
Received: by 10.90.72.3 with SMTP id u3mr189364aga.100.1280371250698; Wed, 28 
	Jul 2010 19:40:50 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.236.80 with HTTP; Wed, 28 Jul 2010 19:40:30 -0700 (PDT)
In-Reply-To: <4C50DBF6.6040807@mentor.com>
References: <AANLkTin-WKHX0m7yU7pLGFV=g2X6kwcCdYEEUJ541SKq@mail.gmail.com> 
	<4C50DBF6.6040807@mentor.com>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 28 Jul 2010 19:40:30 -0700
X-Google-Sender-Auth: RKzOlk07-Fv7SSgnBpOXa96B3pQ
Message-ID: <AANLkTi=W8PNpkUGY6zVpOxQoC3emXpW1TEtoRzK270j2@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.47
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [RFC] recipe owners
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
X-List-Received-Date: Thu, 29 Jul 2010 02:41:12 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jul 28, 2010 at 6:40 PM, Tom Rini <tom_rini@mentor.com> wrote:

> Frans Meulenbroeks wrote:
>
>> 2010/7/27 Chris Larson <clarson@kergoth.com>
>>
>>  On Tue, Jul 27, 2010 at 3:19 AM, Frans Meulenbroeks <
>>> fransmeulenbroeks@gmail.com> wrote:
>>>
>>>  PS: I think part of the problem is that most recipes do not have a
>>>> well-defined owner who is responsible for maintaining them. I know we
>>>> use
>>>> to
>>>> have them  mentioned in the recipes. That had some issues, but at least
>>>>
>>> it
>>>
>>>> was more clear who felt responsible for what, and it was also more clear
>>>> who
>>>> to bother to fix a recipe (and it was more clear which recipes are
>>>>
>>> orphaned
>>>
>>>> or become orphaned when the maintainer leaves).
>>>>
>>>
>>> I very strongly agree with this, but there have been issues with it in
>>> the
>>> past, due to people leaving the project, vacations, hiatus, they become a
>>> bottleneck.  But conceptually, maintainership seems like a very good idea
>>> to
>>> me.  If I considered myself the maintainer of a set of recipes, I'd do my
>>> best to ensure that they're always buildable and the recipes are always
>>> up
>>> with current conventions.  *shrug*
>>>
>>>
>> Chris, thanks for your reply.
>> I've turned this into a separate thread.
>>
>> I'm well aware of the issues that caused us to leave recipe owners (and
>> move
>> to the MAINTAINERS file).
>> However for lots of recipes it is now completely in limbo who maintains
>> them
>> (if anyone).
>> As such the current solution seems to be less than the solution with
>> maintainer(s) per recipe.
>>
>> Wrt the issues you mention: I understand this. It is unavoidable that
>> people
>> e.g. leave, so we could take that into account.
>> Some ideas to tackle this:
>>  - still allow others to do small changes even if the maintainer cannot be
>> contacted (this is what to some  (this is similar to what we have in our
>> current commit policy:
>>
>>  * It's fine to fix a recipe you don't maintain, but its polite to talk to
>>   any else actively maintaining that recipe. Try to contact the maintainer
>>   or, if no maintainer is listed, send a note to the OE developer mailing
>> list.
>>
>> - if people maintain a recipe but they become non-responsive without known
>> cause (e.g. no holidays, known issues, business trips, ...) the recipe
>> becomes orphaned and someone can step up to become the new maintainer (I
>> assume that someone is interested in the recipe, otherwise the orphanage
>> of
>> the recipe would probably not be noticed). Btw: it is quite ok for me if a
>> recipe has >1 maintainer (and for core recipes I would even encourage
>> that).
>> We can define some terms to quantify non-responsiveness if needed (e.g.
>> not
>> responding to ML messages concerning your recipes for 3 weeks)
>>
>> What do others feel about this ?
>>
>
> I think this could help in some ways.  But here's the other problem I see.
>  There's a handful of complex recipes and a handful of complex classes that
> support recipes.  But by and large recipes are short and shouldn't be hard
> to understand.  So if there's a problem, fix a problem.  Most people, I
> hope, should feel OK editing most recipes.
>

I'd agree with that, for simple recipes, though I don't necessarily think
that precludes the maintainership concept.  I wouldn't mind just claiming
ownership of some recipes, and letting people fix things in them, and just
keeping an eye on it, reviewing the changes to them, making sure they don't
explode, whatever.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

