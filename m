Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PZ6VV-0003GX-9r
	for openembedded-devel@lists.openembedded.org;
	Sat, 01 Jan 2011 19:48:49 +0100
Received: by iwn8 with SMTP id 8so12805491iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 01 Jan 2011 10:48:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=9DBYLuoZgBuMnqrHdZg+SlgYH6tSSN7Q3ceuiyn2JGk=;
	b=rB+ruGOtGuQrauS8QgH+3OLhfYVTduL8UJYlDoKnD3oootyzW0UV1QEhYDxbLIlwD9
	aSmP1R+9BDvmEX7TETrLVjuqULhn0VXvD4OLgD5ycYLGNHVJHc4UmICCoAsiFSr3Tg6M
	4K8MCBZmoWpkQfZOkuyzBf1h+mSSoHA7cCBSs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=Jwr9nx77HrKiRxb7PQ64E5dh5BlGW7gDMYhb4uBkzEhL4S08B3915blmw9OrmKylDe
	GdXqikkm12tXMNfmo4pbOZBM/pbo9v/RU7K6RkpaHWwZJ/2QIBd319OywUD1LIf4AGNL
	I1ys16I8t8kw0mCQVGDPghJ1qHMdIGaYfAr1Q=
MIME-Version: 1.0
Received: by 10.231.14.74 with SMTP id f10mr19070436iba.119.1293907704843;
	Sat, 01 Jan 2011 10:48:24 -0800 (PST)
Received: by 10.231.38.11 with HTTP; Sat, 1 Jan 2011 10:48:24 -0800 (PST)
In-Reply-To: <4D1F718C.60601@balister.org>
References: <1293810428-31078-1-git-send-email-fransmeulenbroeks@gmail.com>
	<1293810428-31078-2-git-send-email-fransmeulenbroeks@gmail.com>
	<ifl85e$ets$1@dough.gmane.org>
	<AANLkTikBC4nhO1ZSkuYcyoEPNonS4YeXCP6vzKJ3d3Fr@mail.gmail.com>
	<iflbfm$rlm$1@dough.gmane.org>
	<AANLkTi=fQY0ovo=UU4+cJLSj4J68Nu2uiFne37zUBOQX@mail.gmail.com>
	<4D1F718C.60601@balister.org>
Date: Sat, 1 Jan 2011 19:48:24 +0100
Message-ID: <AANLkTi=swkavj97qSGR8rUkcJF=AVB-8=vQmv3jFEz4o@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 2/2] omap4430-panda: fix u-boot
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
X-List-Received-Date: Sat, 01 Jan 2011 18:48:49 -0000
Content-Type: text/plain; charset=ISO-8859-1

2011/1/1 Philip Balister <philip@balister.org>:
> On 01/01/2011 01:12 PM, Frans Meulenbroeks wrote:
>>
>> We have a broken recipe and I feel it should be fixed.
>
> Broken only for some OE use cases. Not broken for others.
>
> The wrong solution to the problem is to replace a recipe that works for the
> people who use it with a recipe that creates untested output. U-boot is a
> fiddly piece of software, updates should be tested on hardware before they
> are pushed.
>
> Let's keep the focus on the real issue here, disappearing sources versus
> recipes that produce untested output.
>
> Disappearing sources are an issue beyond just rebased git repos. Distros
> that provide binaries to end users must provide for this event to provide
> GPL compliance. So it really is not a big deal.
>
> Philip
>

I am not going to rehash what I wrote a few minutes ago.

What I want to say is that there are other ways to fix the problem,
but the recipe maintainer does not care to fix the problem in a
generic way.

I'm well aware that u-boot is a complex thing
And I am more than happy to test the recipe as soon as my board
arrives. (actually I bumped into this issue as I was already preparing
the image I want to run on it).

Disappearing sources is indeed an issue. We saw that with
handhelds.org last month. Distro specific source archives, leading to
broken recipes for other distros is probably not the best solution.

One other thing:
I feel the way Koen is acting and the tone of his emails is not really
desirable for an open source project where several developers
cooperate to achieve a common goal.
Actually this kind of behaviour may well drive away people (e.g. to
Yocto). I am not too sure if that is desired.

Frans. (who wants to take this opportunity to wish everyone a good
2011 with lots of fun).


