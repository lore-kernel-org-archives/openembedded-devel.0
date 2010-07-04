Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OVTPr-0004P0-PW
	for openembedded-devel@lists.openembedded.org;
	Sun, 04 Jul 2010 19:56:00 +0200
Received: by iwn34 with SMTP id 34so4852877iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 04 Jul 2010 10:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=rN9CbU6Nt5YyL6tZzUkk2EsHht2vv8l5DfSjbAc4qHA=;
	b=YZ+oT2c+acLAZk7QgIbGwrKHNlf2MuJymw5V1tIfXmZglW1Dwm0SAGnWvR0iMGqUan
	1aaK51Gt7dEp7hMBKB94O+QOjmGMzmbRyvQjFX/s/RR7omJi7Vw6Rh5HL7xMk3X83ugj
	Hw6OsktuJGPmjP/IL0ciyGelY7kVXe9SL1QzE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=LluU5OfK6Xhj714rfvqcTUUmo47J/wFiXgOd4FXmoUyTtTBz/3lf0nSUernuQn3IAs
	rUYvBSt8IH73dR/s4HIX8TDngoeDUYS4AJ+WokuwCs6ijjaWTPuvxQ6p9JJra18PZPao
	gFkXvdAwxOI33dP5MVeUW0j0z+LDHuDyOFMH4=
Received: by 10.231.177.25 with SMTP id bg25mr2060304ibb.154.1278265857164; 
	Sun, 04 Jul 2010 10:50:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.14.131 with HTTP; Sun, 4 Jul 2010 10:50:37 -0700 (PDT)
In-Reply-To: <06442837-6CA2-4468-BD5F-125499888D90@keylevel.com>
References: <06442837-6CA2-4468-BD5F-125499888D90@keylevel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 4 Jul 2010 10:50:37 -0700
Message-ID: <AANLkTil2kTGN8P9AcSnnlLBcRN9xcWiwLjb9wJGhLaFD@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Where is my root fs?
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
X-List-Received-Date: Sun, 04 Jul 2010 17:56:00 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sun, Jul 4, 2010 at 3:34 AM, Chris Tapp <dokuwiki@keylevel.com> wrote:
> I've built an i586-generic/minimal console image and can boot this by
> passing the following kernel options:
>
> bzImage initrd=initrd.gz ramdisk_size=100000 root=/dev/ram1 init=/sbin/init
>
> However, if I build an alix/minimal console image and boot using the same
> options, then I get a kernel panic saying that root couldn't be mounted.
>
> The initrd has a /dev/ram0 device node, so why does the boot fail? I'm
> assuming it gets loaded under a different device, but I can I find out what
> it is?
>

look at the kernel .config differences
are you using same kernel for both machine configs ?

> Chris
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


