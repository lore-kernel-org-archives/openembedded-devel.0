Received: from [209.85.223.198] (helo=mail-iw0-f198.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1N929c-0000lX-Mr
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Nov 2009 20:50:00 +0100
Received: by iwn36 with SMTP id 36so2792670iwn.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Nov 2009 11:48:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=vpQs2742vIfHsyn8pQdVQWZE0g6XLY1ZMYkGCH4NizA=;
	b=Z6XasianrCARJ8oMh9fZEylZBPed5teTUaOfGWpI9QduM+7zjzkJx5IC4S/g5ix+QQ
	NC3Lpeh/HN5OVE2NRmJJaBUtLFLAFGtaYri2KIWtirE4Mcjhz6qis7llKU0SuxcYIQzl
	7tWiZJNfuqtuafqB63Vf9spMGyHD+hQiL/ZD8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=E5mw9GrVXW5BD8yWDcbzCTucMk8wp16GZadQSmRjY1gElAYH9YblX6v0TeM1PTJy++
	iki+NjZQv36sAnBMzH21dyuV6ogk4nNvvk9K96/VRsdRUa+aAMb1ctAC5fjfPu4iwbGh
	quXSmJT3rRSKC75OEmV0jmHdCVP03TsYVF2KQ=
MIME-Version: 1.0
Received: by 10.231.148.135 with SMTP id p7mr2470340ibv.27.1258141715228; Fri, 
	13 Nov 2009 11:48:35 -0800 (PST)
In-Reply-To: <6ec4247d0911121316p41602634l75a789e752cc286f@mail.gmail.com>
References: <200911120457.39018.holger+oe@freyther.de>
	<6ec4247d0911112034v54f570ccn4c4334a1da094f0d@mail.gmail.com>
	<1258038869.4924.67.camel@conroy-linux>
	<1258039776.4924.69.camel@conroy-linux>
	<6ec4247d0911121316p41602634l75a789e752cc286f@mail.gmail.com>
Date: Fri, 13 Nov 2009 11:48:35 -0800
Message-ID: <19c1b8a90911131148g491c5f33qc629d45ed156ba1@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.198
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: meta-toolchain continues to woe
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
X-List-Received-Date: Fri, 13 Nov 2009 19:50:00 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Nov 12, 2009 at 1:16 PM, Graham Gower <graham.gower@gmail.com> wrote:
> Chris,
> The patch you submitted prints out an error from the lockf() function
> call. Which is fine, but its more common for the creat() call to fail
> before hand, meaning that the lockf() function would have be passed -1
> as the file descriptor.
>
> I made a small change to hopefully improve this.
> http://code.google.com/p/opkg/source/detail?r=288

creat could be replaced by open() as SUS says creat is redundant
 if creat fails it will still report Could not obtain administrative lock .....
that would be misleading too.

-Khem

>
> -Graham
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


