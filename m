Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OeMop-0007v9-1o
	for openembedded-devel@lists.openembedded.org;
	Thu, 29 Jul 2010 08:42:42 +0200
Received: by bwz10 with SMTP id 10so8192bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Jul 2010 23:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=by7/hgDrUp9AM2wx/BXGzx9YV+Og9o/rsoYO9cXNZFo=;
	b=BAtnTxuAMMu45LrF/EkkY3EM9yC2gBfWXTUoS0DsonQrvO38i/heFI3NaBVtZPg8Zx
	pxDVz0fSmQKZBK0xTitvXrEn/xoVWKIoROtGsZerijQdBkzMji8dc4PBDLnbuTCxqrv6
	13Fu0y0OhWJhlvjqrKL88gwc7C+kaNURYedok=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=YQgeH0ccUI10hCjSageVZ+3gHxyz2HhxGZsHDLXSANqYGCarFzhMJzYsQ0qigJZRdH
	7kJijQvEFFXyttgFI4CVT37i/tLnA5E1biBCMol2To6DYgkroEIMpHv0wrrgjjUSDj9E
	Gh6WC7Ngium38LcZncN8AyA6qoKQhm6pYYKrs=
MIME-Version: 1.0
Received: by 10.204.126.92 with SMTP id b28mr8776826bks.47.1280385717872; Wed, 
	28 Jul 2010 23:41:57 -0700 (PDT)
Received: by 10.204.60.208 with HTTP; Wed, 28 Jul 2010 23:41:57 -0700 (PDT)
In-Reply-To: <4C50DBF6.6040807@mentor.com>
References: <AANLkTin-WKHX0m7yU7pLGFV=g2X6kwcCdYEEUJ541SKq@mail.gmail.com>
	<4C50DBF6.6040807@mentor.com>
Date: Thu, 29 Jul 2010 08:41:57 +0200
Message-ID: <AANLkTik9Xp0Pjt-sPM7rwzrxDWO4_aqjv3WM3SgxLRpt@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
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
X-List-Received-Date: Thu, 29 Jul 2010 06:42:48 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/7/29 Tom Rini <tom_rini@mentor.com>

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

Agree mostly. Handful is probably an understatement (unless you have big
hands :-) ).
The issue for me is not that people feel uncomfortable fixing a recipe, the
issue is that there are a lot of recipes (and machines) that seem to be
orphaned.
No one looks after them so removing legacy staging , merging native and
target recipes, moving to a newer version  etc etc is not done. Actually
sometimes if you stumble upon such a recipe it does not even build any more.

(Challenge: try to do a bitbake world (for whatever machine/distro). I am
very sure it'll fail. Actually I even expect it to fail on stable.).

Apart from that sometimes some people have big toes when you change a recipe
they consider to be "theirs".

>
> That said, we shouldn't be too afraid to remove recipes.  We've got an scm
> and any given recipe shouldn't be more than a git revert <hash> along with a
> follow up commit to fix things from coming back.
>
> I wholehearty  agree with you. However I've tabled this issue more than
once and got very unfavourable reactions on that so I decided not to bring
up the topic again.
Apparently some popel do not understand the powers and way to use an SCM.
But yes, in my eyes it is time to make dev a way foward. People who want to
use legacy stuff are better off with a stable branch.

A step in the right direction could also be to move all legacy recipes to a
separate folder (and maybe  have a separate folder for unmaintained/orphaned
recipes).

BTW: also read Chris' reply after this one. I fully agree with it.

Frans

>
> --
> Tom Rini
> Mentor Graphics Corporation
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

