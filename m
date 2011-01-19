Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PfSmE-0003R6-FJ
	for openembedded-devel@lists.openembedded.org;
	Wed, 19 Jan 2011 08:48:22 +0100
Received: by iyj18 with SMTP id 18so532373iyj.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jan 2011 23:47:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=gE0sM+66NZE89LWQsQM2/WjKn9M6G25YK5lvBVaVXR8=;
	b=YSmPW5KuFDu6y/b08bnjrRR39oRje1O54VwlSDRSB1jBLPngeaQiSXg1pyRMVj4Alx
	JHn6rTIfP1DaBqV6WPrGyjPoIAHdCcpqs3jrnmrFS+A6msUs/davyYUg4+cU0fE9s7Y2
	7mcL13FllEgs27L3nEsr2zfu4zSCSJdtpKbUI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=beSlNuhTZk/Tk6xzHCPb6zB7i00stjLPrx9sfvFEnLNpNJW1MF/dDeqNSdOEwKDH2A
	PMVNQsKXsovRagMaNjUBvCGXhKbywaT3ZqL+mLrjDK595yC32+DfMqEsIuHRMrHgUprD
	A0SqgD0FB92JJgc+DGu7IWnh3WIzd3NMWKLpw=
MIME-Version: 1.0
Received: by 10.231.34.65 with SMTP id k1mr405760ibd.9.1295423262452; Tue, 18
	Jan 2011 23:47:42 -0800 (PST)
Received: by 10.231.213.234 with HTTP; Tue, 18 Jan 2011 23:47:42 -0800 (PST)
In-Reply-To: <ih4s84$gbj$1@dough.gmane.org>
References: <1295027350.14388.6527.camel@rex>
	<AANLkTi=QXykmerKTJJgCNDbqSE18_3Jhqj1utKmf1Ynw@mail.gmail.com>
	<4D353F81.50301@xora.org.uk>
	<AANLkTi=WOr_395Tya3GOhyLpg1oj9stLxSWdgo--uAhz@mail.gmail.com>
	<4D35C5C3.60205@mentor.com> <ih4s84$gbj$1@dough.gmane.org>
Date: Wed, 19 Jan 2011 08:47:42 +0100
Message-ID: <AANLkTinDtgCiqeRPk4PgnUSZb_V5ryTH-LgzNk2bSoGu@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
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
X-List-Received-Date: Wed, 19 Jan 2011 07:48:22 -0000
Content-Type: text/plain; charset=ISO-8859-1

2011/1/18 Koen Kooi <k.kooi@student.utwente.nl>:
> But in the end if boils down to "Does OE wants to make life hard for
> DISTROs or easy". Frans is firmly in the "make it hard" camp, I hope
> others have a saner point of view.

I don't want to make it hard for the distro's but I feel the distro's
should not make it hard for the package maintainers (which happens if
every distro pins its favourite version of recipe foo).
You're just pushing the burden of the distro choices onto the package
maintainer.
(and frankly, I feel the package maintainer has a much harder job than
the distro maintainers)

But then again you already clearly exhibited on several occasions in
the past how much you care about other users and distros. :-(

Root cause of your problem is that angstrom wants to provide a live
binary feed of git head. Something that is bound to encounter problems
on occasions. Git head it bleeding edge, so sometimes it bleeds. That
is an effect of moving forward. The alternative is reduce pace and
loose momentum (which is what you are doing right now).
And anyone with some sense of quality can explain you that publishing
untested binary packages is not really a good idea quality wise.

I think the angstrom users would be better off with releases.
>
> If you're forcing 90% of your users to put e.g. udev_162.bb in their
> layer you're doing it wrong. But you're also doing it wrong if you have
> 20 udev recipes :)

We fully agree on both cases. Then again hardly anyone seems to be
willing to clean up, and those who do only face headwind.
And frankly speaking a good package maintainer would have prevented
those 20 (well actually about 10) recipes to happen, keeping just one
or a few versions (that are kept for good reasons).

Frans


