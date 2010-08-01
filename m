Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OfQpU-0004Y7-Cx
	for openembedded-devel@lists.openembedded.org;
	Sun, 01 Aug 2010 07:11:21 +0200
Received: by bwz10 with SMTP id 10so1401031bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 31 Jul 2010 22:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=rOF6FfDnfLBAL4TZ76E9b5qjvC59qPbni8Q1sifvt3c=;
	b=NniwVA7PWlkZVQwJGgTbrBM8lPsGHsBppsf63MlMcU/YIxnMWFfsz/ZzS41uGxuv4Y
	uCaclzl0kZ6Xghw7Z/1SSnxcfp/2b7eWGtq1/PmN7MNqMPMQvnIzeaJbLpwPjjRMUe/3
	x0XdOpavCEu8KzEtH/F24VFshr9bL3SlmP7pY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=qCU410tDv8LYxzGl3GjK9EXvkuYqp340yZ8T1pe9kBNP/yWNa7XgKlz4lOYMThnig3
	jVHSJkIOhtKul+41r6acS3e0lnJG3ZBaI+wSrsAFYCyg1p5zZYqPvDrKlg8upsHYT2KX
	DNsx1IxpuBqiv/0U6SbID6c/g95k23V9SFVIc=
MIME-Version: 1.0
Received: by 10.204.103.199 with SMTP id l7mr2823064bko.18.1280639455809; Sat, 
	31 Jul 2010 22:10:55 -0700 (PDT)
Received: by 10.204.60.208 with HTTP; Sat, 31 Jul 2010 22:10:55 -0700 (PDT)
In-Reply-To: <1280617976.1297.85.camel@rex>
References: <AANLkTimk_y-ntnLZpXfa_biLEcX_vO_Lk5PQXWPJcuec@mail.gmail.com>
	<i2rik7$ds1$1@dough.gmane.org> <4C516EF8.3080804@balister.org>
	<AANLkTikZQB39U7kUv9-0v-3gysX=tYFuwUiq3ygXJzAL@mail.gmail.com>
	<i2u23e$97d$1@dough.gmane.org>
	<AANLkTimUYuJBUa5Hz=N_dM-DOe6qPoCDbqCEs2LHTpab@mail.gmail.com>
	<1280617976.1297.85.camel@rex>
Date: Sun, 1 Aug 2010 07:10:55 +0200
Message-ID: <AANLkTinSR6_bi8ACzz1_45Gsa8PvYi1XD=37pwjqXtoF@mail.gmail.com>
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
Subject: Re: OE recipe tree quality
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
X-List-Received-Date: Sun, 01 Aug 2010 05:11:21 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/8/1 Richard Purdie <rpurdie@rpsys.net>

>
>
> "world" is used by Poky quite successfully. In Poky we expect everything
> to build with a known list of things that don't. Our aim is to have that
> list consisting of zero items and I intend to see that happens :).
>

I would love the see this happen for OE as well.

>
> I don't think many people have been watching Poky recently but we've
> been quietly having a massive quality control effort on the metadata in
> there. This has included:
>
> a) Removal of legacy staging
> b) Using BBCLASSEXTEND = native where it makes sense
> c) Using nativesdk (no sdk class)
> d) Upgrading everything to modern versions of the package concerned
> e) Only allowing sane pkgconfig files
> f) Enhancing the metadata with licence and other information
>

Cool. I'll peek into it.

>
> Its possible to contemplate this due to Poky's version policy and size
> and its still taking significant effort. OE has always been pulled in
> many directions and this is both a good and a bad thing. The only ways I
> can think of to make a dramatic improvement to OE in this area would be
> disliked by some of its users so I don't know what the solution is.
>

*Any* solution (including the current status) will be disliked by some
users.
We need to set a direction. I hope and suggest the TSC will provide some
guidance here.

We can e.g. keep complaining about legacy staging, but if there is no action
nothing will change.

I'm trying to create awareness and do suggestions on how to resolve things.
Unfortunately these are rejected by some, but at the same time these very
same persons fail to provide an alternative scenario (apart from that
*others* need to work on this.

>
> There are other good things happening in Poky as well as the above too
> btw :)
>

I'll keep an eye on it!

Frans

