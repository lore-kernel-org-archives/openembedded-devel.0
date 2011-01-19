Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PfgRu-0001TC-VP
	for openembedded-devel@lists.openembedded.org;
	Wed, 19 Jan 2011 23:24:19 +0100
Received: by gyh20 with SMTP id 20so639012gyh.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jan 2011 14:23:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=59b6Q/RF4WaOKOuJlT718g89zqbU1mfxVRS8QNBN2HE=;
	b=xu1i7iAnfreSh3PljEr6c7IXVYB9eGGL0Dwa1ZQNm1mUYWbO4yyeGmX1jrapotcbuD
	0aTdH+uLR4gQwYdUT5GhddAAP5llwd68wRPnvEdPDfu2zjM20eq5Gt6MMmlwDt9+vGlI
	rtr4rkkkVpFI9WTyqtKXatf6X9fyFFMvNzmws=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=IOzYsJ/AHoeeRT4c299iwUEDCna7xgD4qu6vyBgfBY3PceAh4eBi1tpU0qQqKHkMuu
	+toh8jiry6T3778mA4kba46/t9gPQ8QjCCnrYVv4FJEGl5Hl26ezEziar7XeElrNCPjx
	5VW2Qavco67G112yuavdngIbEeaywOYnGEJKc=
Received: by 10.90.1.2 with SMTP id 2mr1614814aga.58.1295475818435; Wed, 19
	Jan 2011 14:23:38 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.55.10 with HTTP; Wed, 19 Jan 2011 14:23:18 -0800 (PST)
In-Reply-To: <AANLkTimyPb-4pLrbF4ZeFwnh+9WyZtcPY1uXeYBnwUqQ@mail.gmail.com>
References: <1295027350.14388.6527.camel@rex>
	<AANLkTi=QXykmerKTJJgCNDbqSE18_3Jhqj1utKmf1Ynw@mail.gmail.com>
	<4D353F81.50301@xora.org.uk>
	<AANLkTi=WOr_395Tya3GOhyLpg1oj9stLxSWdgo--uAhz@mail.gmail.com>
	<4D35C5C3.60205@mentor.com> <ih4s84$gbj$1@dough.gmane.org>
	<4D35FC8B.1090404@mentor.com>
	<AANLkTinHP=9S6tAFdiWHfk8zZi0MhvfNTgW71Ugx++9w@mail.gmail.com>
	<AANLkTi=aMnnfnaQZNLpZW_8MUWq_jckou9tr_bA8NBY6@mail.gmail.com>
	<4D36A64E.9060804@xora.org.uk>
	<AANLkTi=8uKvujKLqG2cw3h3gLmmcU=KNfdmSwB5imfsH@mail.gmail.com>
	<1295436662.2540.14.camel@scimitar>
	<AANLkTik9-k_euvDGZd+CFfQ9LyxD_7mubpVxPqyEsEVU@mail.gmail.com>
	<4D36FE98.3070606@mwester.net>
	<AANLkTimMHd-eH9tEL1tUtoUKa+zwX4+9kUdT3k_NP9nG@mail.gmail.com>
	<AANLkTimyPb-4pLrbF4ZeFwnh+9WyZtcPY1uXeYBnwUqQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 19 Jan 2011 14:23:18 -0800
Message-ID: <AANLkTinRKmmzUT-6T6_cGR+HHrB6hYFYhdS4GuZHRS+Z@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Yocto Project and OE - Where now?
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
X-List-Received-Date: Wed, 19 Jan 2011 22:24:19 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jan 19, 2011 at 1:55 PM, C Michael Sundius <msundius@sundius.com> wrote:
> It seems to me that this is a bit of a battle between the package
> maintainers and the distro maintainers.. Looking at this from my managements
> side of things, we use OE as a tool and its really just a means to the end.
> our customers demand that we do not change things (versions of software),
> they demand stability and they view a change in busybox or anything else a
> threat to stability. our management has also made an edict that we can not
> use gplv3. For completely non technical reasons we simply cannot move to new
> package versions without a substantial business justification. I suspect
> that that there are many (more than you realize) folk out there who are
> using OE for their own distro. If you simply whack package versions because
> something newer came out you will have these people maintaining separate
> recipes and we'll be swamped with the load and this tool will loose one of
> its best attributes.
>
> The comment that disturbed me was that distros should just move ahead
> "because its making things hard for the package maintainer". That doesn't
> wash with me because if people are using your package then you should
> support it or let someone else be the maintainer.

I think keeping packages forever is not going to work either. If your
customer is someone with EOL of 20 years
OE should not keep versions you need just for you unless you invest
efforts in keeping that packages uptodate
thats why releases are for.

In essence the distro's
> use of that package are your customers and the reason you have a job. OE
> does not exist as a product, rather a tool that enables customers, you can't
> create this in a vacuum without understanding who is using it.
>

yes and assuming a package is being used by someone is also not the
right thing. IMO for products you should
base off on a release and maintain that for however long you wish and
give some space to OE to develop. Extreme on
both ends are unwanted thats why we are discussing what versions to
keep. Keeping every possible version around has
a cost and I believe if the recipe is not actively being tested its a
bit-rot. So we are trying to reduce that burden on OE devs
at the same time increase the quality of recipes.

> distro maintainers are not all dumb and if they are they'll be the last
> single one using an outdated version of the software. When that happens a
> smart package maintainer will call it out leave out the old package.
> Further, it would be nice for a warning to take place so that it might have
> a "depracated" tag associated with the recipe for one release cycle to see
> if anyone cribs.


recipes move into obsolete/ or nonworking/ dirs thats enough of a warning imo

>
> So I'm standing with the guy w/ asbestos short on. I'd like to see that OE
> err on the side of "do no harm" to existing users. Its hard enough to rally
> the troops to move to updated packages much less updated meta without you
> leaving perfectly reasonable versions of software out of oe-core.
>
> mike
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


