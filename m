Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lf0-f54.google.com (mail-lf0-f54.google.com
	[209.85.215.54])
	by mail.openembedded.org (Postfix) with ESMTP id 4F925744D3
	for <Openembedded-devel@lists.openembedded.org>;
	Wed, 25 Apr 2018 14:46:13 +0000 (UTC)
Received: by mail-lf0-f54.google.com with SMTP id b23-v6so25907808lfg.4
	for <Openembedded-devel@lists.openembedded.org>;
	Wed, 25 Apr 2018 07:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=r6BvZMD8UAycJf0rA+Nub0+8j8Uo8A8ioRnVotx+ffw=;
	b=b62Du6mxJA97z6uoETev44+7kLCwTKWFqUYzFuhSjgXNf7ETYRhQEhhoQO/Ruauz5e
	3d5m7v0Q4Ma1sFjilYit9w7FS4kfoBOBw6CtqpVPAofeIHT+93/yja+5O2ieKwhelwFG
	0kMIH5kLuVdcKCewjFk2rA+uVKZpoIBJsQi6GbOw1QbdKvrlojGDUUzSuLXWZ+vHD6s1
	h+vSyJfWewM5+EcTj6imjiDkYJ0vQAHVirdaC97neLE4Na4cUN9imK0slDTmjwOCqlz8
	Ue+dNxeZ8f6zWNAdK8uzR0IBdhgIz1n2VQ+0oBZ4uwaWhCVaXqqfPrrPZYjoEqo7rIgG
	8xzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=r6BvZMD8UAycJf0rA+Nub0+8j8Uo8A8ioRnVotx+ffw=;
	b=q1O+o+4stV2uQ6qrg3tny0jirgsij+UMgJa5W02jUdZXAFPy7IEDWHSdCWdgf650F0
	KxN5wUcsi/b2OnC48xbMIE90dwGt31PCfTuNBIY24iW+ySBYjf11hi2mEJEuQ84nBMHM
	TIdedAoo8C6oAqvasYkwDy9+kgsDTtKwLC0FlGhpTw7u6I9HX+ls4OO4FM4KXOB2eVCB
	o5zsxA+xPCjA6Tu0drE+f+aQ/7/4OyrLicYi/31K/ulhD6HBGRfd+MPM4MCgrJD5ST2g
	uMpzL9uf6U7wh44DeEwLZIm4UHK/a8pEZ302uXqlBAJzZoLx3xTMGG/c3FBkeX7leAIs
	5Gxg==
X-Gm-Message-State: ALQs6tAvEI7fY9HcCHfjFKHE9ki+BsDQvwrLM9yQlmaOhLtWIZ8tIfeG
	5ArRrZsyfoNp2MeTFTViz0us99sqlrHe41jvLQo=
X-Google-Smtp-Source: AB8JxZp67jDFm2b6IynFbfnLWpoUBnUzlvpIJoBb3n49laiGb47yHGTMqgReZnFE1sJoGEpgfVz5Z/MR27mb9Fr9EZs=
X-Received: by 2002:a19:e583:: with SMTP id
	i3-v6mr13736863lfk.135.1524667573706; 
	Wed, 25 Apr 2018 07:46:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.2.22 with HTTP; Wed, 25 Apr 2018 07:46:13 -0700 (PDT)
In-Reply-To: <20180425023048.GA27713@linux-uys3>
References: <20180425023048.GA27713@linux-uys3>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 25 Apr 2018 10:46:13 -0400
Message-ID: <CADkTA4O8oVLXLA8aQ4hzOOS5-NMY2Ntx8XEkXWXzM466HgpqcQ@mail.gmail.com>
To: Trevor Woerner <twoerner@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <Openembedded-devel@lists.openembedded.org>
Subject: Re: meta-bsp
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
X-List-Received-Date: Wed, 25 Apr 2018 14:46:13 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Apr 24, 2018 at 10:30 PM, Trevor Woerner <twoerner@gmail.com> wrote:

> Hi,
>
> I'm tempted to reply to RP's "2.6 planning proposals and meeting" email
> thread
> to ask if there could be some support added for common BSP things, but I
> have
> a feeling it probably won't go down well. Also, I've been trying to get
> some
> traction on https://bugzilla.yoctoproject.org/show_bug.cgi?id=11881 for a
> while (i.e. since last August), but no dice.
>
> Basically, I believe there are a small number of basic, general things that
> many BSP layers could use (or need) and it'd be nice to see them available
> in
> one place so everyone could use them, instead of having everyone create
> their
> own, or copy+paste (I'm not sure which of those is worse).
>
> Bug 11881 is an example of one such thing, but others exist.
>
> Many embedded boards will come with repositories somewhere of that board's
> vendor kernel and vendor bootloader. Many BSP layers have recipes to make
> building with these repositories easier. However, we're seeing more and
> more
> boards getting upstream {kernel|u-boot} support. This means users are
> increasingly having a choice between using the vendor's repositories or
> upstream. But often the choice of bootloader, kernel, and graphics are tied
> together; if you want one, it means using or not using the others in
> specific
> combinations. Therefore it's not simply a matter of providing two kernel
> recipes and letting the user PREFERRED_PROVIDER_virtual/kernel one or the
> other. So bug 11881 points to a class (written by Otavio) that allows a
> BSP to
> offer different sets that the user then selects (either by doing nothing
> and
> selecting the default, or setting a one-liner in a configuration to choose
> the
> other).
>
> Another example of something that might be useful to various BSP
> layers is a common recipe for the upstream linux kernel itself
> (git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git). Many
> BSP
> layers provide a vendor recipe and an upstream recipe, but I believe it
> would
> be better if the upstream recipe were common instead of requiring every BSP
> layer to keep theirs current. Maybe the same is true for linux-next or
> linux-stable?
>

FWIW, I already have kernel recipes that I maintain that do this, and
"linux-yocto" is
now a single repository (versus one per version).  The korg recipes aren't
enangled
with anything extra (and can use fragments, once I re-submit my changes for
2.6
to move things into kernel.bbclass), so I could take something like that on
as part
of my existing workflow and try to get them into oe-core.

That being said, the reason that the upstream recipes vary so much is that
although
the repo is common, that is pretty much the only thing that is common.
There's no
agreement on versions, SRCREVs, etc, so it is nearly impossible to make the
recipe
actually useful, unless it is tied to a BSP.  You are saving a few lines of
a simple
recipe, that that is about it.

Cheers,

Bruce


>
> Also some common mali (or perhaps the upcoming lima) recipes might be nice?
>
> Since it seems unlikely I'll be able to convince openembedded-core to add
> these things, maybe meta-openembedded would be a better home?
>
> Best regards,
>         Trevor
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

