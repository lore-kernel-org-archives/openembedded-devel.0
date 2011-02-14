Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PosPS-0005Td-PO
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Feb 2011 07:59:47 +0100
Received: by iyj8 with SMTP id 8so4478884iyj.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Feb 2011 22:58:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=NvmMMLrpxpLGi2wy6zQr7Y/KWtxwAAE2k8a2Wm2kvW4=;
	b=tNv75o2sXZ+s35PepTjMMpHbIcVeYm9wAphy+3JTZBv6No0ij2V6w9i8ykSwH5TaHk
	iG04dLj6AdvrO3xX3hunVkLACB4JvLXrZkRW2HLTU3lYT+C/Qtz/Twgpc6UaLmYi6KRn
	gluKzB4NScO/t/AaGoReuYk5R/DPY4o/tO4Sw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=A+41O7EIq/6V9vOhU/rY98HzpdrgPfPbMe070fB91CNgyOu3hdECddRPqDfrUtx5jC
	wXLu0B+SEpGIiYedQOa5/hZXroeZ8bX/JR7j6rHcFppfaN42gWz0CcE/e7OfvuxZOapO
	53+8PGgaUgDAzpQu++iSJYlTvcF42DUA2aPHE=
MIME-Version: 1.0
Received: by 10.231.10.197 with SMTP id q5mr2626191ibq.197.1297666717431; Sun,
	13 Feb 2011 22:58:37 -0800 (PST)
Received: by 10.231.30.73 with HTTP; Sun, 13 Feb 2011 22:58:37 -0800 (PST)
In-Reply-To: <ij8d1t$cd9$1@dough.gmane.org>
References: <ij8d1t$cd9$1@dough.gmane.org>
Date: Mon, 14 Feb 2011 07:58:37 +0100
Message-ID: <AANLkTikRjr82BbGXksU=frfOw9owj0u66MkVQ2HFhOx7@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: TSC agenda items for the next meeting
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
X-List-Received-Date: Mon, 14 Feb 2011 06:59:47 -0000
Content-Type: text/plain; charset=ISO-8859-1

2011/2/13 Koen Kooi <k.kooi@student.utwente.nl>:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Hi,
>
> The new TSC is holding a meeting next week and we wanted to see if
> anyone wants to suggest items we put in the agenda for the meeting.
>
> If you have such items, please let us know by replying to this mail.
>

- come to a set of minimal quality requirements for our recipes/packages
(e.g. must fetch, minimal required headers etc).
My proposal would be to use the yocto requirements as a starter

- splitting our metadata into multiple layers
I can think of the following:
- oe core layer (shared with yocto
- oe layer (or oe extra's or whatever you want to call it; containing
recipes that are generic, not in oe-core and considered to be of
common use)
- maybe oe-old or so layer (recipes that are not maintained any more)
- layer per distro for distro specific stuff
- layer per machine (or maybe soc family, I can imagine it makes sense
to keep BB and BB-XM together; similarly for the kirkwoord variants)
- vendor specific layers (if needed), e.g. ti (although maybe that
stuff could also go into a machine layer)
Rationale is that users can pull in only those layers that they need.

- consider a version based release mechanism
yocto has a release model, intermediate versions are aiming to build
but are considered to be less mature.
If our core recipes follow this model, I can imagine it is a good
strategy to follow in oe too.

Frans


