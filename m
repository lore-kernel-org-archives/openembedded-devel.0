Return-Path: <andrea.adami@gmail.com>
Received: from mail-wr0-f173.google.com (mail-wr0-f173.google.com
	[209.85.128.173])
	by mail.openembedded.org (Postfix) with ESMTP id 74C79786EA
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Feb 2018 09:48:06 +0000 (UTC)
Received: by mail-wr0-f173.google.com with SMTP id l43so2624852wrc.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Feb 2018 01:48:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Y6+DaI9SH3Jjv3I+IFpeu0KD+c5CJzDUH7mMNhXH+fM=;
	b=Vk2Bo/c9hd5oFLVLTjQ9H9XsW/7c7WYkI6UIJD6fa7crAWhx/jY4Q0YfxcrLtWxTvc
	4Kc/Y1/ZCeEyQphiLfL2wsdlTgg2KHpZUde5SmZO29KxNFpE6cThDxhH5DvIoDq0rKKQ
	bhr4+KQKpA1KzqRC7GZdvK/nkhwB5re70tZcQkj6scZ9hxXJy0bvO8ddxMjfre3R6QPN
	5EWCa3PsvAP8cJKwtlbH7Gen96AqS8w2JUEGPV/KtHJmbpm80yhM0gAaXaHs+bJse6G8
	OKSkv0AhSxOMgLOAWoBUEwtmlAyRSpb88AkxnLB/P9ZrG/tN84odWlrIk6nEzl0iF0yd
	yeBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Y6+DaI9SH3Jjv3I+IFpeu0KD+c5CJzDUH7mMNhXH+fM=;
	b=HeuDQbEN1Y2A5L1s2pAR05x5SEuJS+Vg34cOdfckDj1bZdnUyNew7CDDjhMc6qtGXH
	++6/1M13CexymaeoayuYg3D9aONdUjhP+xGfiZrCvsXDfYffTcuiPr4XdyA+FWJ11uj8
	fjdBJ74vYYpYBdXxxajm8aI0mvzyd/zsHrjOiiknSxCrDEX4Ica77i7FsECPTbm+Y3cp
	xD7VDNNKLttkOGsZTK/quMbxzdrxgmusZzqJ8qQ1aqJcUfJBJQi8rROOJESP1PTs84VT
	PSdgwEOayGsJJbd5s1nKCD6dkdRiGUnXXVkgAq6aa7xoJuoBtzJONfnuvBNxodCRR2w2
	Yd+A==
X-Gm-Message-State: APf1xPCuhu4pj1oFG/UGun/6Hl1amddgmI06Ly2clyMRgaIjmTkx+EWH
	UEJw3joSuBUwSkdl353frXYxwgjDW8wqVpjRB7ynfg==
X-Google-Smtp-Source: AH8x2243JEko0xwegjErtHXLnbYwH5KhKUZ/nVIaDtsAa6qb7wZ42yZ4L8v8jOpInMkz5hHb7YcnFcTtQXfhdHDagbk=
X-Received: by 10.80.247.133 with SMTP id h5mr2368519edn.275.1519206487085;
	Wed, 21 Feb 2018 01:48:07 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.168.1 with HTTP; Wed, 21 Feb 2018 01:48:06 -0800 (PST)
In-Reply-To: <CA+chaQfpXBL3=z3QwTKQ6MNBKUVhbMjA6G+nADz562zFuYUTUw@mail.gmail.com>
References: <CAJTo0LYxqFFmUA9XcCO3_WO32NB4YLYy7pJK5ivyzPQYY5-hvQ@mail.gmail.com>
	<f808dcd5-82b9-b9c7-2c4a-b5b35b21fb42@gmail.com>
	<CADkTA4MdQgigdN+hSsyZjk=1nfDB3M2799Pf-jy4WYt=6PdXyA@mail.gmail.com>
	<8d5be4e4-3fd9-a0f2-c5cf-b967cf428416@gmail.com>
	<CADkTA4P46zCdHEUeAdsC7Ej+N3gp7-6Rxx=UTTYN7U91fL3Z1w@mail.gmail.com>
	<CA+chaQd=LFUw8wV0h6O2O_RvH2R9APE=X3Mn+DarPSwxefs6bg@mail.gmail.com>
	<CA+chaQfpXBL3=z3QwTKQ6MNBKUVhbMjA6G+nADz562zFuYUTUw@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
Date: Wed, 21 Feb 2018 10:48:06 +0100
Message-ID: <CAAQYJAsOFo6md-ZCRg+KmGQtC9O+pwFzVjpEMOXOFVFWzr4iMw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: Splitting meta-oe?
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
X-List-Received-Date: Wed, 21 Feb 2018 09:48:06 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 21, 2018 at 10:06 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
>> I'm actually very worried about these (re)tired maintainers. If the
> layers were more independent it would allow some of the patch handling
> responsibilities and testing responsibilities to move to other people,
> reducing the load on those maintainers.
>
> Armin can update his own view, but for me the main issue wasn't the "patch
> handling" part, but actually the lack of patches for the new issues (often
> caused by new changes in oe-core).
>

That's one point.
If I may add my experience as maintainer of two minor layers
(meta-handheld and meta-initramfs), I have to say there have been many
cases where an upgrade to oe-core did break one of these layers.
Just a variable rename for example...this fall-outs could have been
avoided if the oe-core dev would have spent a minute grepping the
repository,
Heh..now we have to define what is the public repository, which layers
have to be checked...

And about layer interdependencies...well..it is very delicate.
For example meta-handheld, a BSP layer, must depend since some time on
meta-oe. Why? Because tslib was removed from oe-core.
This is ugly...here a more separated layering structure would help

So I somehow feel we should refine what is in the repository but
absolutely not split it around.
Even, I think we should host all public layers (definition lacks
today) in the OpenEmbedded Git Repository .

My 2 cents
Andrea

> Yes, the "patch handling" part was the most boring piece, but patches from
> regular contributors or co-maintainers were always easy to handle and
> rarely caused any extra work.
>
> The untested drive-by contributions from people who don't even reply to
> review comments are completely different category, but separate git
> repositories won't drive those away (until it gets so confusing that these
> people will even fail to find correct repository and just gave up trying to
> contribute anything at all). Nothing is blocking more people to collect,
> fix, test these drive-by contributions and then send consolidated
> pull-request which will be easily merged to shared repository - but I never
> seen this happen and I don't know how separate git repositories will help
> with this.
>
> In the end after spending a lot of own time doing this boring part, I
> always felt responsible for fixing as many build failures detected in world
> build as I could, but that's never-ending uphill battle where very few
> people ever help (big thanks to those exceptions who sometimes help). And
> what you get for that extra afford to get it building as much as possible
> in spare time? Comments about how garbage meta-oe layers are.
>
> We need patches not more git repos!
>
> On Wed, Feb 21, 2018 at 9:49 AM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
>
>> > I need an updated python-<foo> package for an unrelated package
>>
>> And how far will you go?
>>
>> If you want just newer python-<foo> and nothing else, will you take other
>> changes to other python-* recipes from meta-python layer? There is a lot of
>> recipes there, if you're so picky about updates, then you shouldn't update
>> whole oe-core as well.
>>
>> On Wed, Feb 21, 2018 at 1:51 AM, Bruce Ashfield <bruce.ashfield@gmail.com>
>> wrote:
>>
>>> On Tue, Feb 20, 2018 at 1:52 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>> > On 2/20/18 9:13 AM, Bruce Ashfield wrote:
>>> >> On Tue, Feb 20, 2018 at 11:50 AM, akuster808 <akuster808@gmail.com>
>>> wrote:
>>> >>>
>>> >>>
>>> >>> On 02/20/2018 02:45 AM, Burton, Ross wrote:
>>> >>>> Hi,
>>> >>>>
>>> >>>> Is now a good time to talk about splitting up meta-oe?  Some layers
>>> are
>>> >>>> actively developed and maintained (one example: meta-python), others
>>> are
>>> >>>> basically bitrotting and only get touched when something else causes
>>> them
>>> >>>> to break world builds (one example: meta-gnome).  I've long felt that
>>> >>>> meta-oe should be split up and the high quality layers managed in
>>> their own
>>> >>>> repositories so patches to them don't get held up by breakage in
>>> other
>>> >>>> sub-layers.
>>> >>> You make it sound like meta-oe is not a high quality layer.  I could
>>> >>> make the same claim about oe-core master.
>>> >>>
>>> >>> I don't see the connection in patches being held up due to breakage in
>>> >>> other sub layers. This only happens if the dependency fail to build.
>>> >>>
>>> >>> You lose control over the quality in current layers that reside in
>>> >>> meta-openbedded just like you have no control over all the other
>>> layers
>>> >>> residing in the community. It makes maintaining stable versions very
>>> >>> difficult. Well, unless The Yocto Project takes over them.. I guess
>>> that
>>> >>> would work then.
>>> >>>
>>> >>>>
>>> >>>> Another advantage of splitting out the high quality layers is that
>>> we'd
>>> >>>> like to look at running more community layers through the Yocto
>>> >>>> autobuilder, and granular layers make that easier to manage.
>>> >>>  I thought not including layers in bblayers.conf was easy enough.
>>> >>>>
>>> >>>> Comments?
>>> >>>
>>> >>> What problem do you thing you are trying to solve here?
>>> >>
>>> >> My unrelated issues are that I can't update one layer, without getting
>>> >> all of the updates.
>>> >> .. but that is both a good thing (i.e. they are all tested together,
>>> >> so you know that the
>>> >> single SRCREV update is good for all layers), and a bad thing (when
>>> >> you just want a
>>> >> new python recipe update from meta-python, but don't want other
>>> changes).
>>> >>
>>> >
>>> > if you dont include the layers in your BBLAYERS and they become
>>> > effectively non existent, unless you are on metered internet connection,
>>> > where downloading unused stuff would save you bandwidth, it should be
>>> > ok.  No ?
>>>
>>> Its not that.
>>>
>>> I *am* building the different layers, but say I have a stable set of
>>> packages
>>> and working images .. but for whatever reason, I need an updated
>>> python-<foo>
>>> package for an unrelated package, or some other layer that needs a newer
>>> version, etc.
>>>
>>> How do I get that, without taking updates to all the layers ? .. and
>>> layers that
>>> I really didn't want to update. I have to do some sort of combo-layer,
>>> carry
>>> my own copy of the recipe, etc.
>>>
>>> So there are definitely ways to do it, I'm just pointing out that I
>>> end up taking
>>> some build failures/issues from time to time on packages I didn't really
>>> need to update.
>>>
>>> The flip side of that argument is that all of the layers and sub layers
>>> have
>>> gone through some sort of global build, and hence I know that they all
>>> have
>>> worked together for someone. If I can update pieces individually, I break
>>> that .. and I own the broken bits after that .. which again, goes to
>>> my point that
>>> fixing one workflow/issue can break another :D
>>>
>>> Bruce
>>>
>>> >
>>> >> It is very likely that splitting the layer would help one issue, but
>>> >> make the other worse.
>>> >>
>>> >> So no solution from me, just an observation about potential issue.
>>> >>
>>> >> Cheers,
>>> >>
>>> >> Bruce
>>> >>
>>> >>>
>>> >>> - armin
>>> >>>>
>>> >>>> Ross
>>> >>>
>>> >>>
>>> >>> --
>>> >>> _______________________________________________
>>> >>> Openembedded-devel mailing list
>>> >>> Openembedded-devel@lists.openembedded.org
>>> >>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>> >>
>>> >>
>>> >>
>>> >
>>>
>>>
>>>
>>> --
>>> "Thou shalt not follow the NULL pointer, for chaos and madness await
>>> thee at its end"
>>> --
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>>
>>
>>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

