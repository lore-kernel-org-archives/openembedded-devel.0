Return-Path: <stephen.arnold42@gmail.com>
Received: from mail-ob0-f193.google.com (mail-ob0-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id 4CA98731D3
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Jan 2016 21:55:43 +0000 (UTC)
Received: by mail-ob0-f193.google.com with SMTP id q2so24469728obl.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Jan 2016 13:55:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=I+x9C/J3TqvqCMGBWGTUa9221yMyBH9mWwKrldhcD2c=;
	b=TlZc3W5d3JMh45zj4dWgdpDHi3tYIpQZoDZrtPtgOjh+xjVNpFQf6x6d7/urd9KMVv
	eVvkLrg9oiawCOFDWebHp3UuDNGAa/RO0eXh84EQyN95HqTabwz3zOnn9KMLHPj4fiIF
	spFHE3q/G69GfvdaCyMcWnKIHtanXytDeI4nSTyZ8syQu7kbBOfaB2f/AD0+NZmzgcod
	g7QRybQ5krRVoecs0p+nz8v8syoyzcduu8JLt2BCKwyDEjC0+2JkZonqQ2IEK+ieEJFC
	yUegNYZJXgsiq79kZ2NHxykuYq8gxErFd5Cmq1huN6RUg7Xp3B5OXaLMiPy4XqB9Wc6F
	2gdw==
MIME-Version: 1.0
X-Received: by 10.60.159.72 with SMTP id xa8mr66083930oeb.25.1452030944097;
	Tue, 05 Jan 2016 13:55:44 -0800 (PST)
Received: by 10.182.165.230 with HTTP; Tue, 5 Jan 2016 13:55:44 -0800 (PST)
In-Reply-To: <9EE300C1-F57A-461C-8B5C-011C6750DF64@gmail.com>
References: <1450954209-2353-1-git-send-email-nate.karstens@garmin.com>
	<CAMKF1sqp0gM9VgvE8M1-HAsAapDsNdNfs0S+AnaROfqFWXFYNg@mail.gmail.com>
	<145451D4E6785E4DA4DFA353A58CB7B2F7E4E724@OLAWPA-EXMB03.ad.garmin.com>
	<9EE300C1-F57A-461C-8B5C-011C6750DF64@gmail.com>
Date: Tue, 5 Jan 2016 13:55:44 -0800
Message-ID: <CAOLEWZWrT7xz1de_tf-XvjQ342L_Tu1Wrm0VjJd4rXsF60gksg@mail.gmail.com>
From: Stephen Arnold <stephen.arnold42@gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] dhcpcd: add recipe for dhcpcd
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Jan 2016 21:55:47 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, 5 Jan 2016 13:37:35 +0000
"Karstens, Nate" <Nate.Karstens@garmin.com> wrote:

Me too, I sent this earlier from a non-subscribed address...

Steve

> Sorry for the delay. I contacted the author and he pointed me to
> the following page:
>
> http://roy.marples.name/projects/dhcpcd/wiki?name=history
>
> To summarize, this recipe is for a fork of the original project
> that has been entirely rewritten.
>
> Rather than removing the old recipe entirely, do you think it
> makes sense to move it to meta-networking and allow users to use
> PREFERRED_VERSION to choose which version of the program they
> want?

TBH, since I didn't put anything in the commit msg I don't remember
where I got that recipe (nor do I recognize the upstream).  OTOH,
we use Roy's dhcpcd as primary Gentoo package upstream, so I'm fine
with that (bonus it's maintained and has all the cool kid features).

Not sure why I didn't do it that way in the first place...

As for meta-networking dependency, I'm not sure about that one
either; I'm currently having network startup issues in a fresh image
(fsl+neo hacks) that I need to look into and it mostly seems to
point at dhcp so far (the default network config doesn't start on
boot but starts fine manually after that).  I didn't see that in my
last BBB or imx28 builds.

Note the neo minimal image started up dhcp/ssh as expected, but then
started going goofy with core-image-full-cmdline and some local.conf
tweaks.  But I still need to diagnose the OE neo image stuff; all I
can say is everything (network-wise) works fine on neo with my
Gentoo card.

My vote would be whatever is the most stable/reliable should be in
the core layers rather than an "extra" layer people need to add to
bblayers manually.

Steve

> I can submit a separate patch to move or delete the old recipe,
> depending on your preference. Do you want that done before
> proceeding with this patch?
>
> Nate
>
> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On
> Behalf Of Khem Raj Sent: Thursday, December 24, 2015 12:43 PM To:
> openembeded-devel <openembedded-devel@lists.openembedded.org>
> Subject: Re: [oe] [meta-oe][PATCH] dhcpcd: add recipe for dhcpcd
>
> On Thu, Dec 24, 2015 at 2:50 AM, Nate Karstens
> <nate.karstens@garmin.com> wrote:
> > Adds a new recipe for dhcpcd. Modifies the configure script to
> > keep the host system header files from being used instead of
> > the target system.
>
> Can you also see how you differ with
> https://github.com/sarnold/meta-alt-desktop-extras/blob/master/recipes-connectivity/dhcpcd/dhcpcd_1.3.22-pl4.bb
>
> and I would prefer you to send a removal patch to above layer and
> let it use it from meta-networking.
[snip]

