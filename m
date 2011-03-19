Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Q0rXh-0002Kn-OO
	for openembedded-devel@lists.openembedded.org;
	Sat, 19 Mar 2011 09:30:06 +0100
Received: by iwn10 with SMTP id 10so4879000iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Mar 2011 01:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=qe3msQU6xgoEhL/yHqKUE6vpPQFuuJmKAmo0491DYfo=;
	b=bvwC2TZexeGHesZiZk/yPYOivDvKv6Lk58lNwClCAQzUAg/boDyvWVNpHp0Sb8p6cY
	xpsuN+RCGACDyxmB5CzeTt+5hlqtTSm6Jxb69r22450xerhXsQ9WvPozeOZYPxKF45FI
	iMRvAh1jlmTIqPnXnqrU+uPsRouFoz46GE6b0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=qyCT8duYajD/77osSOiBet6XLQsF4qJKDfasfvIZlRmHpkp5bp94qDZhZcU68+zmtU
	bxUF7yQIhi37kHoJESz0JubrglIM7d+m15tocBlXwHB2VqxeVtE3EMrTwVJVmMKv7MCk
	SO9ECAM5+fhBWHgeKFndbPqoMvkzH3Oskfv44=
MIME-Version: 1.0
Received: by 10.231.117.129 with SMTP id r1mr1802668ibq.195.1300523282590;
	Sat, 19 Mar 2011 01:28:02 -0700 (PDT)
Received: by 10.231.13.69 with HTTP; Sat, 19 Mar 2011 01:28:02 -0700 (PDT)
In-Reply-To: <1300496638.30423.2249.camel@rex>
References: <20110311081950.GG7353@excalibur.local>
	<1300385432.2298.33.camel@saphir> <1300396447.30423.2113.camel@rex>
	<AANLkTi=9DUeh3eyaW=fQciA_Qk51yvqbBP_792n8fwQD@mail.gmail.com>
	<1300443329.9054.53.camel@phil-desktop>
	<1300496638.30423.2249.camel@rex>
Date: Sat, 19 Mar 2011 09:28:02 +0100
Message-ID: <AANLkTi=s9L+Q8k9ds3BiSZj7MC1BOe8=1jWoObi2qu02@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: OE Bugzilla Future
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
X-List-Received-Date: Sat, 19 Mar 2011 08:31:07 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2011/3/19 Richard Purdie <richard.purdie@linuxfoundation.org>:
> On Fri, 2011-03-18 at 10:15 +0000, Phil Blundell wrote:
>> On Fri, 2011-03-18 at 08:57 +0100, Frans Meulenbroeks wrote:
>> > 2011/3/17 Richard Purdie <richard.purdie@linuxfoundation.org>:
>> > > On Thu, 2011-03-17 at 19:10 +0100, Michael 'Mickey' Lauer wrote:
>> > >> I'm in favor of keeping it, cleaning it up, and improve
>> > >> the integration with patchwork / git. Throwing it away
>> > >> would be a very bad sign to all those countless people
>> > >> who've gone through the pains of actually working with
>> > >> the bugtracker.
>> > >
>> > > The simple question is who is actually going to sort out the mess it=
s
>> > > in?
>> > >
>> > > Who is going to look after it on a continuing basis?
>> > >
>> > > If there isn't ownership, nothing is going to change.
>> >
>> > Actually I feel the real problem is that:
>> > - people did not want to get bugs assigned to them (at least that was
>> > what someone told me in the past)
>> > - we're lacking a good notion of package or recipe ownership, so even
>> > if we had someone acting as a bug manager, (s)he would have a hard
>> > time to find out who to assign an issue to.
>>
>> Yes, agreed. =A0A few people have tried in the past to take responsibili=
ty
>> for bugzilla itself (in infrastructure terms) and I would be happy
>> enough to do that for the future. =A0But it clearly is not reasonable to
>> expect the Bugzilla maintainer(s) to be personally responsible for
>> fixing every bug that gets reported.
>
> This is the key question. Who is responsible for fixing bugs?
>
> The recipe's original author?
> The maintainer?
> The reporter?
> The bugzilla maintainer?
> The TSC?
>
> The answer in general is whoever has time and an interest in it and none
> of the above.

Well, I do feel it is one of them, and that is the maintainer of the
package (who might be the original author).

To me being the maintainer of a recipe says that one cares about a
recipe and tries to maintain it (as the word says :-) )
Maintainership comes with responsibilities. If people do not want to
take these responsibilities then they should not list themselves as
maintainer.
I have seen too many incidents where someone does not care about a
package or bugs submitted to it, but if someone else steps in and
fixes things, then suddenly the original author or maintainer feels
they are stepped onto their toes, and react hostile.

Btw this is the main reason I stopped trying to fix bugs that do not
affect me (apart from the recipes I maintain).
>
>> As you say, the real issue here seems to be that someone (presumably the
>> TSC) needs to determine the workflow that OE is going to use and then
>> convince the developers to stick to it.
>
> Here lies the problem. All OE's developers are effectively volunteers.
> We have no means to convince developers to stick to anything. Volunteer
> developers have a tendency to rebel as soon as it even remotely looks
> like someone might "force" them to do something :).

Sorry but  I have to disagree with this.
Even if you volunteer for something, it may (and most often will) come
with responsibilities.

In my view if you volunteer to maintain a recipe, that carries some
obligations and responsibilities.
If you do not want them, fine, don't step up as maintainer.
If you do, act according to them.

I feel a good way would be to define the role of a maintaner.
And eventually recipes fall apart into two groups. The ones with a
maintainer and the ones without.

That does not outrule others form contributing. If you want to
contribute say a new recipe, you still can. It'll be an unmaintained
recipe in that case.

And if people want to apply a patch, well if it is an unmaintained
recipe, I'd say that is fine (if someone really cared about the recipe
so much that he does not want this, he should take up the maintainer
role for that recipe).
And if it is a patch for a maintaned recipe, it passes the recipe maintaine=
r.

Note that I am not saying that it is the responsibility of the
maintainer to dig and resolve every issue reported.
Very specific issues can still be left as is (to give a weird example:
someone reports that recipe X does not build under cygwin :-) ).

>
> I put the smile in as I don't mean this in a bad way but I do think we
> need to understand that few people have the time to dive into other
> people's problems. This is the underlying issue and I don't think
> anything has changed for OE. I don't think there is anything magic the
> TSC can do either.
>
> Yocto has different dynamics and I think those could be useful for some
> of this and can help improve things for the better but its never a free
> for all. Yocto has, can and will look at certain bugs but the scope
> needs to be constrained, certainly to OE-Core.

Best regards, Frans.


