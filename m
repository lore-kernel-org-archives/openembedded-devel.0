Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1QVs9C-00079X-Q8
	for openembedded-devel@lists.openembedded.org;
	Sun, 12 Jun 2011 23:24:43 +0200
Received: by yxe1 with SMTP id 1so740727yxe.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Jun 2011 14:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=6lVKBRVk99B1H2F7hLDUQLaBUh+UdmtzPLS7J4LOoOc=;
	b=sNh9Ok5wNXGbUHy6klay3PK3usEO8to42udYO6hVJgJwwq5QsOKm9flzxz/d0/++7r
	wQ1kWVdGwnbtqz/FwTSzOHEbrrtQmPWSmfilRzBC2wYTAp4tcZsInw9XFP6cSBqDQQZN
	fJUfqOUwVjKFKbCbL9qWZJLKJPMCstCDVLyfw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=tYQqM50VQyhuq8sr7ObA8ol6hj6MoguGK9CSN2x8B6eFuIDxfzTJvKpSbCxtavAorm
	4T/2QcQKGlbXFOJxkRZuheoQXVHd8CCHZY43D0e5NvpT3/YpTVw0SLN0p4pW20/TOw6j
	aMejjvqwwASzyFgsJpwQ3l1l+EebGZbYuohsk=
MIME-Version: 1.0
Received: by 10.91.197.14 with SMTP id z14mr5510661agp.172.1307913678911; Sun,
	12 Jun 2011 14:21:18 -0700 (PDT)
Received: by 10.90.68.2 with HTTP; Sun, 12 Jun 2011 14:21:18 -0700 (PDT)
In-Reply-To: <4DF48491.6070901@dresearch-fe.de>
References: <4DF0C472.4030608@dresearch-fe.de> <4DF14C7E.7000701@gmail.com>
	<4DF48491.6070901@dresearch-fe.de>
Date: Sun, 12 Jun 2011 23:21:18 +0200
Message-ID: <BANLkTimz3W1447Q-WBL=d=4ZVvcbm=xAsQ@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Distros supporting older kernels?
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
X-List-Received-Date: Sun, 12 Jun 2011 21:24:43 -0000
Content-Type: text/plain; charset=ISO-8859-1

2011/6/12 Steffen Sledz <sledz@dresearch-fe.de>

> On 10.06.2011 00:43, Khem Raj wrote:
>
>> On 06/09/2011 06:02 AM, Steffen Sledz wrote:
>>
>>> Hi Distro Maintainers,
>>>
>>> as you could read in earlier messages of mine, we're forced to use an
>>> older kernel version (2.6.24) for our hardware. This brings a lot of
>>> problems as you can imagine (e.g. we're also bound to udev-141).
>>>
>>> Until now we've used angstrom-2008.1 with some own patches according to
>>> the linux-libc-headers and udev versions for our hardware which were
>>> reasonably not accepted by the Angstrom maintainers (see discussions [1]
>>> or [2]).
>>>
>>> In there current situation (angstrom-2008.1 is deprecated, the new layer
>>> concept will come up) we're looking for a new, better, less hacky
>>> solution.
>>>
>>> My first question therefor is if there are any distros explicitely
>>> supporting older kernels (pre 2.6.27) yet? Or are willing to work on it?
>>>
>>>
>> I guess a machine layer on top of oe-core could be something you can work
>> out and add/override needed recipes in this layer.
>>
>
> I think it's not that easy.
>
> For kernels prior to 2.6.27 you can't use a lot of core components (e.g.
> udev with versions higher than 141 or eggdbus) which *a lot of other
> components* depend on.
>
> The underlying problem are some kernel API functions like inotify_init1 or
> epoll_create1. Some distros (e.g. Angstrom) use linux-libc-headers 2.6.31
> which is higher then 2.6.27 (what in my opinion conflicts with [1]). So
> there's no chance to detect the mentioned kernel functions correctly at
> compile time. :(
>
> As a consequence you have to check this in *all* programs at runtime. This
> is a good wish but hard to realize. E.g. the udev maintainers itself
> rejected a related patch[2] and say that they are not willing to support
> older kernel versions.
>
> So in my opinion there are two possible ways:
>
> 1. Use only the old supported versions of the components (udev-141 and
> glib-dbus instead of eggdbus) with all the consequences for other programs.
>
> 2. Determine *all* critical kernel functions, look for *all* the places
> where these are used, and patch them.
>
> Both are a lot more than some override recipes. So i think this needs an
> own distro with all the maintenance and testing.
>
> Regards,
> Steffen
>
> [1] "but a program built against newer kernel headers may not work on an
> older kernel" <
> http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=blob_plain;f=Documentation/make/headers_install.txt;hb=HEAD
> >
> [2] <http://thread.gmane.org/gmane.linux.hotplug.devel/16590>
>
>
> Steffen, I feel it really depends on what you are aiming at. For our
products we typically freeze on a certain version; if there are bugs that
hurt us we either fix them (backporting a patch) or move to a newer version
of that specific recipe (and stick it in a local overlay).

E.g. some of our maintenance is done on a monotone revision that was frozen
a few years ago.
I feel if you have to use an older kernel and have a dedicated image (e.g.
because you are doing a real embedded control system) you might be better
off doing the same.
The newest packages are not necessarily better for you, and typically newer
versions tend not to become smaller (but ofc exceptions exist).

Frans

