Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Ofoml-0006Hl-RD
	for openembedded-devel@lists.openembedded.org;
	Mon, 02 Aug 2010 08:46:13 +0200
Received: by bwz10 with SMTP id 10so1695311bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 01 Aug 2010 23:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=Th1vqkzLd80i3gwR+6cdv3xjxEyWHAKSZkQfcdCC2gg=;
	b=C920xKhPI0seMHBStZ/bImiL1WFkcto5zZmEySJY4QSNYIlFXQoaLWRJ9FsvJFe5tr
	fD7Qdd7aZGyceAFXi7HpuETYqOURDsErLhPzG/YWyjGKhpZf9d+uQ46Ev66BaVQUMUQs
	lQR4vBZUe7G3pzTSrn5Qk6J/yVK6LtYJExysE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=kBDzQOU/QgCkaWN3AP+W/cfRiXK1gFoK7Tpg2S/vsurAN6kXYzunZJ8G/qYR71I4q2
	URL6HGVk0KxDPpJB0clDmzJuAre1VucNOQxutTLU1uXkbBGAO/f9m79cRhpb5/Lpif27
	fsNJIogMNHDoaXgzEktXAR5JAeu+u355Kumyg=
MIME-Version: 1.0
Received: by 10.204.7.217 with SMTP id e25mr3897224bke.32.1280731545999; Sun, 
	01 Aug 2010 23:45:45 -0700 (PDT)
Received: by 10.204.60.208 with HTTP; Sun, 1 Aug 2010 23:45:45 -0700 (PDT)
In-Reply-To: <1280692612.1297.109.camel@rex>
References: <AANLkTikO742JLzxxxChmVAr6feBwJzzw9ikUEX+-g66v@mail.gmail.com>
	<1280692612.1297.109.camel@rex>
Date: Mon, 2 Aug 2010 08:45:45 +0200
Message-ID: <AANLkTimG8+MBwd2coUC_sEprq+s69CJ5+o91NnMsJsFb@mail.gmail.com>
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
Subject: Re: legacy staging: call for action
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
X-List-Received-Date: Mon, 02 Aug 2010 06:46:14 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/8/1 Richard Purdie <rpurdie@rpsys.net>

> On Sun, 2010-08-01 at 13:49 +0200, Frans Meulenbroeks wrote:
> > In the attached file (which I hope will pass the mailing list) you find
> the
> > results.
> > I've also uploaded the file to http://filebin.ca/xotgad/do_stage so if
> it is
> > not attached you can find it there.
>
> I'm a little dubious of doing it this way. It also includes some rather
> simple cases where do_stage does:
>
> do_stage () {
>        autotools_stage_all
> }
>

Yeah, I'm aware of these.
There are some 400 of them.
I think I can cook up a sed or awk script to filter them out and then
visually inspect the resulting diffs for correctness, but I am not sure if
that is a desired way forward.
(I don't think I can test all those changes, also I seem to recall that
someone already did something similar; but that needs committing, would be
kind of a massive commit anyway (with 400 or so files affected).

What i proposed is a starter to divide the work. Of course I will not keep
anyone from fixing the other recipes.
And of course there are some which are definitely orphaned (e.g. the
nslu2-linux owned ones, some 70 I think).
Then again I guess these are all pretty old.

But if you see a better way, please share.


>
> which are null operations and can be removed in pretty much all cases. I
> was surprised to only find myself listed for about 5% of that list :).
>
> In the spirit of helping:
>
>
> http://git.openembedded.net/cgit.cgi/openembedded/log/?h=rpurdie/for-testing
>
> but I've not tested this so I'm going to need some assistance. I've made
> the changes by a combination of inspection and knowledge of what Poky
> does. I concentrated on the cross components since people are perhaps
> more wary of them.
>

Thanks alot.
Guess Khem should have a peek at the gcc ones.

Wrt the binutils ones:
I see in your patch
binutils_2.14.90.0.6.bb
binutils_2.14.90.0.7.bb
binutils_2.16.91.0.6.bb
binutils_2.16.91.0.7.bb

Given that binutils is at 2.20 now and I expect the diff between the .6 and
.7 subversions to be very small, I would prefer to remove those .6 variants.

Frans

