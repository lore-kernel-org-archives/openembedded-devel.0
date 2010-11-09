Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PFxfd-0000Lp-OD
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Nov 2010 00:32:15 +0100
Received: by yxe42 with SMTP id 42so17668yxe.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Nov 2010 15:31:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=DseXnWzVP9YPR8vXkUJdilmIESAtPmUPuEJo+pOb2rM=;
	b=wE3tcADSbNBT8k0pQT3M0UCW1ouAZb2BxaMTSfFCZwirRojwiLC0FI6aPVqz+L0MZz
	23DofZCpRZmEr2S8tX0ZjJAEcHIhJZRFvk3CKeiQWLHshuSwXvcJAbwwoIvlsMWqaX40
	kZnrrkxF7I1RzNNutlcmncPOAblE02lwuFpq8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=OIJW8OKpra6dVt8LglzRlUp8jeT7WzTAhE+6wz06z+h5CRBPPuAWXSzWTJFW8+6TJ+
	M9Ah61ZBJDjfb5RQYZlSCzPi2O1QY0a8tS8c7T35ByOtGToV7LDaB4HGfU43Lci4FDmz
	9DSqWF0FImAIsasYq5VOPnzjUA6KZSkGO4qA8=
Received: by 10.90.20.1 with SMTP id 1mr419406agt.145.1289345461618; Tue, 09
	Nov 2010 15:31:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.86.4 with HTTP; Tue, 9 Nov 2010 15:30:41 -0800 (PST)
In-Reply-To: <AANLkTiniF0VTUKNW9frOLmuwL=UHn6r3xo=aNt9d2F4W@mail.gmail.com>
References: <4CD731A8.3020809@gmail.com>
	<AANLkTi=Rk8Fm_Xq08J89J-s4bx=QQeTHfMan4HZknYWs@mail.gmail.com>
	<AANLkTi=JbmuXAXPD=8jNS2kTsuC9SS=UL4vepkHw1Wqt@mail.gmail.com>
	<AANLkTiniF0VTUKNW9frOLmuwL=UHn6r3xo=aNt9d2F4W@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 9 Nov 2010 15:30:41 -0800
Message-ID: <AANLkTinaKWEBwVZbQv8MB4QinFyorErpt5fgVmJAsq+d@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: bitbake weirdness during -k world
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
X-List-Received-Date: Tue, 09 Nov 2010 23:32:15 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Nov 9, 2010 at 3:16 PM, Graham Gower <graham.gower@gmail.com> wrote:
> Problem(s) fixed by these commits.
> http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=b6d7a41d8ae0c916b217264b135998ac2d8bce4c
> http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=fe0b4102c33f7300aaf8b139ee2d73820e12d635
>
> Thanks to Chris for pointing it out once I'd narrowed it down to a
> particular recipe.

hmmm I think we need to fix recipes/kaeilos/kaeilos-version.bb and
recipes/distro-version/distro-version.bb
too. Care to create a patch ?

>
> -Graham
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


