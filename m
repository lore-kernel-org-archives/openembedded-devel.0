Received: from mail-gx0-f213.google.com ([209.85.217.213])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1NlplO-0001jl-VD
	for openembedded-devel@lists.openembedded.org;
	Sun, 28 Feb 2010 21:29:19 +0100
Received: by gxk5 with SMTP id 5so966289gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Feb 2010 12:26:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=b66FzcxbJmD/COGdao80Fg178f5d+wB516AM7cFrZm0=;
	b=TrjMEOv7jFTjIA2jdOXOH1mtYrbTfShG/HJC0Y2hjhZ0CxmSJrDYpajkCepB3GaPxt
	LK9UEAwfre/n20AGu+WzD3S7EXMty7ERuAGIPpVFDn/xSQmi6OJaGb8D3mJkQxZYOuRk
	QMac3lQ8PTtbNpf25HAgW3thqFwQFqORFG2Ao=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=e+Ritqvm1k2WBdKfyXGb0xOcOnKq3TBHeFlYBo7/aNAuaDXl06XISPFwqnCibRsLIO
	6YTkLgAsI4bMVrcuLSYvytzvqnjqoVkV2XlRK+3V4VnJJx/NER7wqJG7iEAYhXZnjdGy
	SX0I2NxEGHmkK3aImCUUcJjmJbIy4Xioc6Bu8=
MIME-Version: 1.0
Received: by 10.100.235.38 with SMTP id i38mr4587273anh.178.1267388789422; 
	Sun, 28 Feb 2010 12:26:29 -0800 (PST)
In-Reply-To: <hmeia3$p6c$1@dough.gmane.org>
References: <ac9c93b11002281139g6963e753w970c97002611c78c@mail.gmail.com>
	<hmeia3$p6c$1@dough.gmane.org>
Date: Sun, 28 Feb 2010 21:26:29 +0100
Message-ID: <ac9c93b11002281226w3b73d9ebo6c3169dedd1b74c5@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.217.213
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_PASS autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC} glib-2.0 cleanup
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
X-List-Received-Date: Sun, 28 Feb 2010 20:29:19 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/2/28 Koen Kooi <k.kooi@student.utwente.nl>:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> How do you know that some versions aren't used at all? Did you check all
> external overlays?

No. I have no access to them.
But if someone decides to pin an old version in an external overlay,
then I think it is their responsibility to also keep a copy of that
recipe.
And note that they are not gone, they are still in the git if someone
needs them.

Btw if external overlays are a concern then we should never ever
delete a recipe.
>
> But more importantly, what harm do the recipes do to you? Does it offend
> you that there are 26 recipes?

Somewhat yes. Frankly I don't see a use for 26 recipes for all kind of
different versions, some of which are very outdated.

And as you can see from my other message, this is just the tip of the iceberg.
We have about 8000 recipes, but less than 5000 unique ones.
By having less recipes, the parsing time decreases too
(and I am quite aware that there might be some variants needed for some recipes)

And of course with the unused recipes also a lot of outdated patches
go so it will also free some storage space (my recipes directory is
almost 500 M, not that dramatic, but still)

>
> What are you trying to accomplish?
>
> If a recipe isn't doing any harm, just leave it alone. Deleting recipes
> just to please someones sense of aesthetics is the wrong thing to do.

Your opinion has been noted.

>
> What would be a lot better is to fix the latest version for each minor
> release to use things like new style staging, bbclassextend, etc and
> *after* that clean up ask to remove the recipes that weren't updated.
> That way there is a recipe for each minor version so we can check
> regressions quite easily. But the real bonus is that the remaining
> recipes are of good quality. Your proposal doesn't address any QA
> concerns, it just makes the mess a bit smaller

By removing unused versions at least it is clear which recipes need to
be improved and focus can go to those versions.
But if you feel that things like new style staging and bbclassextend
have priority, be my guest.

(actually I found the proposed procedure to convert to new style
staging so cumbersome and time consuming that I gave up on it).

>
> And even then I would rather move recipe + associated patches to
> obsolete than delete it. When we start doing tarball releases
> recipes/obsolete will be a lot more important than it is now.

I'm unaware of plans to do tarball releases (and actually I am not too
sure that it is useful; if you want to, you can download a tarball
from git at every point in time).

Frans


