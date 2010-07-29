Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1OeI6q-0001v7-8z
	for openembedded-devel@lists.openembedded.org;
	Thu, 29 Jul 2010 03:40:33 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1OeI6W-0002m6-Ia from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Jul 2010 18:40:12 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Wed, 28 Jul 2010 18:40:12 -0700
Received: from [172.30.80.63] ([172.30.80.63]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 28 Jul 2010 19:40:11 -0600
Message-ID: <4C50DBF6.6040807@mentor.com>
Date: Wed, 28 Jul 2010 18:40:06 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTin-WKHX0m7yU7pLGFV=g2X6kwcCdYEEUJ541SKq@mail.gmail.com>
In-Reply-To: <AANLkTin-WKHX0m7yU7pLGFV=g2X6kwcCdYEEUJ541SKq@mail.gmail.com>
X-OriginalArrivalTime: 29 Jul 2010 01:40:11.0507 (UTC)
	FILETIME=[FBE6EC30:01CB2EBE]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
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
X-List-Received-Date: Thu, 29 Jul 2010 01:40:33 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Frans Meulenbroeks wrote:
> 2010/7/27 Chris Larson <clarson@kergoth.com>
> 
>> On Tue, Jul 27, 2010 at 3:19 AM, Frans Meulenbroeks <
>> fransmeulenbroeks@gmail.com> wrote:
>>
>>> PS: I think part of the problem is that most recipes do not have a
>>> well-defined owner who is responsible for maintaining them. I know we use
>>> to
>>> have them  mentioned in the recipes. That had some issues, but at least
>> it
>>> was more clear who felt responsible for what, and it was also more clear
>>> who
>>> to bother to fix a recipe (and it was more clear which recipes are
>> orphaned
>>> or become orphaned when the maintainer leaves).
>>
>> I very strongly agree with this, but there have been issues with it in the
>> past, due to people leaving the project, vacations, hiatus, they become a
>> bottleneck.  But conceptually, maintainership seems like a very good idea
>> to
>> me.  If I considered myself the maintainer of a set of recipes, I'd do my
>> best to ensure that they're always buildable and the recipes are always up
>> with current conventions.  *shrug*
>>
> 
> Chris, thanks for your reply.
> I've turned this into a separate thread.
> 
> I'm well aware of the issues that caused us to leave recipe owners (and move
> to the MAINTAINERS file).
> However for lots of recipes it is now completely in limbo who maintains them
> (if anyone).
> As such the current solution seems to be less than the solution with
> maintainer(s) per recipe.
> 
> Wrt the issues you mention: I understand this. It is unavoidable that people
> e.g. leave, so we could take that into account.
> Some ideas to tackle this:
>  - still allow others to do small changes even if the maintainer cannot be
> contacted (this is what to some  (this is similar to what we have in our
> current commit policy:
> 
>  * It's fine to fix a recipe you don't maintain, but its polite to talk to
>    any else actively maintaining that recipe. Try to contact the maintainer
>    or, if no maintainer is listed, send a note to the OE developer mailing list.
> 
> - if people maintain a recipe but they become non-responsive without known
> cause (e.g. no holidays, known issues, business trips, ...) the recipe
> becomes orphaned and someone can step up to become the new maintainer (I
> assume that someone is interested in the recipe, otherwise the orphanage of
> the recipe would probably not be noticed). Btw: it is quite ok for me if a
> recipe has >1 maintainer (and for core recipes I would even encourage that).
> We can define some terms to quantify non-responsiveness if needed (e.g. not
> responding to ML messages concerning your recipes for 3 weeks)
> 
> What do others feel about this ?

I think this could help in some ways.  But here's the other problem I 
see.  There's a handful of complex recipes and a handful of complex 
classes that support recipes.  But by and large recipes are short and 
shouldn't be hard to understand.  So if there's a problem, fix a 
problem.  Most people, I hope, should feel OK editing most recipes.

That said, we shouldn't be too afraid to remove recipes.  We've got an 
scm and any given recipe shouldn't be more than a git revert <hash> 
along with a follow up commit to fix things from coming back.

-- 
Tom Rini
Mentor Graphics Corporation



