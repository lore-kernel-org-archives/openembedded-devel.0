Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PazSm-00047K-3n
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 Jan 2011 00:41:48 +0100
Received: by gwaa12 with SMTP id a12so4419444gwa.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Jan 2011 15:41:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:cc:content-type;
	bh=s8wAQdI7xqbDqoiVSPQfNTqDoMZ2ppj2esdcLXiuTco=;
	b=c+bKAfaFaOKCNgXW0TGtqgcGqzrTcGcLgKKUXu9/jvClNretP1QNz7HXZjEdc3MmBz
	ToHStKvdok3RDJivXG3KUvlxWgCP/y1UVp7RsJ7l87ieU5t/HBDZpwz0zJEHLBbiTuo6
	xbmz1MaNHHaAi5m/fpxq9vvVqMjB/5m0184PU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	b=pJJK45sCAvZNS0VinVO0Dc3poy6i3jqoZpi06CknymGKrG7YjP5Blfl33NA901PIvR
	wO9MhQOvBuKPpnLxLCEdTndeB6sgkdhtp98N+WENn3yUVgPXc88L596JDaT8zwjeSlp0
	WcfIUBVFk2/C+e2tt8seR1q41qHYojkKov31A=
Received: by 10.90.10.21 with SMTP id 21mr2595954agj.112.1294357281883; Thu,
	06 Jan 2011 15:41:21 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.86.4 with HTTP; Thu, 6 Jan 2011 15:41:01 -0800 (PST)
In-Reply-To: <201101062040.16993.anarsoul@gmail.com>
References: <1294253374472299500@rkmorris.us>
	<201101061832.25160.anarsoul@gmail.com>
	<1294332628528842500@rkmorris.us>
	<201101062040.16993.anarsoul@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 6 Jan 2011 15:41:01 -0800
Message-ID: <AANLkTimxeuB_MOvkDdee-GddQk9vWzXc5A0sxD-nm4Tg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: H1940 Boot Issues -> Executable Build Problems?
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
X-List-Received-Date: Thu, 06 Jan 2011 23:41:48 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jan 6, 2011 at 10:40 AM, Vasily Khoruzhick <anarsoul@gmail.com> wrote:
> On Thursday 06 January 2011 18:50:28 Russell Morris wrote:
>
>> The kernel I used is from OE (targeting the h1940).
>
> AFAIK it's pretty old. I'm using self-built kernel, linux-next tree with some
> extra patches. I can share it, so you can test if kernel is guilty :)
>

yeah that would be nice. May be the way aux vectors are passed to
application could mean
that libc tried to use wrong AT_HWCAPS which could mean that it tries
to access cp15 which is absent on this
processor can result in illegal instrs or it enables things like VFP
which again is absent so many things
can cause this problem. So I think finding if auxiliary vector is
passed correctly is important.

> Regards
> Vasily
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


