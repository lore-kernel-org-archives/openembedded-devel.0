Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f180.google.com (mail-lb0-f180.google.com
	[209.85.217.180])
	by mail.openembedded.org (Postfix) with ESMTP id BD9C76BC8D
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Sep 2013 13:38:52 +0000 (UTC)
Received: by mail-lb0-f180.google.com with SMTP id q8so5018506lbi.11
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Sep 2013 06:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=j15voCUlRuH+2Cpq/og1urcNhIo/ps0H+oo7fgdUZgc=;
	b=bevjES61ajGJDDvKBsz8uHPlza3UfXOXeVuHnM9E6No7gvy0ce42XVs9NvHWLaTOlu
	np6EuDYz/SPgBYMiAWcLZS6Rgpgi2y5STmDIwmn09RGzhl4tdvsHFL9OIEDpt9fg4yxG
	mN+vbizNbflcpJdRDZtCS71RnqEGw+ertkE/1aD8RS7m+Oz2lBOJvNF/5+EvfF5P2gWS
	BbcPD8NATtg4d063PeCfJTYuefc3zG/okU38k4wFiQHgxhmo7wIszaPaSBR+uBNMw9l3
	SpuQE7Fd93KQKxaxMsfYOONctA2hsM1bkWubbrIW96F6Ir6Rzmy7bERRm2r3PYluZZzc
	z2NA==
MIME-Version: 1.0
X-Received: by 10.152.8.115 with SMTP id q19mr26838654laa.16.1378215532473;
	Tue, 03 Sep 2013 06:38:52 -0700 (PDT)
Received: by 10.112.12.103 with HTTP; Tue, 3 Sep 2013 06:38:52 -0700 (PDT)
In-Reply-To: <CAOMwXhNp0w=1=QW=e+82Q135wECMROUdcJ3aEaLUFKOu_68DEQ@mail.gmail.com>
References: <1378110051-8976-1-git-send-email-lpapp@kde.org>
	<CADkTA4NZ-M6XBYx2bBBW_QtMtsUnDNdyYggr1Wa=6Qu33EHvPQ@mail.gmail.com>
	<CAOMwXhNV70uRZiL1T+gbguZnBrwUwdUzfGA30d6N-OvhSK__xA@mail.gmail.com>
	<CADkTA4P-tyfnX5Dywf8Z+tSEVxjbrykio5tFg_UmhkrTvORdyw@mail.gmail.com>
	<CAOMwXhNp0w=1=QW=e+82Q135wECMROUdcJ3aEaLUFKOu_68DEQ@mail.gmail.com>
Date: Tue, 3 Sep 2013 09:38:52 -0400
Message-ID: <CADkTA4PUf5ce5B206zP+7i4hZ0LWN_YD1VuooSZLkC4j-nmuJw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>, 
	Joe MacDonald <joe@deserted.net>
Subject: Re: [meta-networking][PATCH] openflow: Add latest from git
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 03 Sep 2013 13:38:53 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Sep 3, 2013 at 9:13 AM, Laszlo Papp <lpapp@kde.org> wrote:
> IMO, most of this email is red herring, and the main topic is a networking
> specification should be in meta-networking. Why would I (or anyone for that
> matter) need *any* virtualization layer when I am working on a network
> device?

Ah, so I see we won't address the fact that the mailing list should have
been consulted and that the goals of the oe-layers should be to reduce
duplication and get everyone working together. I promise, I won't mention
this again, but it is a key point I want to make.

I understand where this is going, and I'll try to engage at a technical
level, it's all that I can do.

>
> I am sorry for your historical misplacement, but it is not an excuse for
> future mistakes IMHO. If your virtualization depends on network stuff, you
> should *not* force others for virtualization whatever that is. If you need
> that, build on top of networking or use own recipes maintained by you.

I don't agree with that characterization, since it is very black and white.

Having a binding to the larger meta-oe universe (at least for some recipes),
isn't always a good thing, and having self contained layers is also something
that is a goal at times. I'm not saying this is the case here, just that what
you describe above about networking devices not wanting virtualization,
is at times flipped around from other layers when looking at meta-oe.

meta-virt and meta-networking are very similar in age and the group of
recipes to start meta-virt were a merging of two existing layers (a good
collaboration) and a lot contributed by ENEA, it was a good effort and I
don't think it's right to drop all traces of that effort or describe it as a
mistake.

Again, opinions vary, that's part of the fun.

>
> I fail to see how it is a problem. Even more, the recipe was completely
> broken like virtual/libc, *ancient* version, wrong rm'f stuff, bad
> description IMHO, etc for meta-networking.

Patches would have been accepted :)

>
> I do not personally mind if you keep your clone because it is your
> business, but surely, networking devices should use a network layer, and
> that is exactly the point of meta-networking.

I'll agree to disagree, I've tried to say that we should look at what the two
layers need, come up with a plan, keep the credit to the original authors
and then decide how to move forward. i.e. if there are multiple users of the
recipe, maybe see about getting it into oe-core, etc. But I see that isn't on
the menu today.

I'll ping Joe and we'll see what we can figure out as timing for a path forward.

Cheers,

Bruce

>
>
> On Tue, Sep 3, 2013 at 2:04 PM, Bruce Ashfield <bruce.ashfield@gmail.com>wrote:
>
>> On Mon, Sep 2, 2013 at 11:55 PM, Laszlo Papp <lpapp@kde.org> wrote:
>> > On Tue, Sep 3, 2013 at 2:56 AM, Bruce Ashfield <bruce.ashfield@gmail.com
>> >wrote:
>> >
>> >> On Mon, Sep 2, 2013 at 4:20 AM, Laszlo Papp <lpapp@kde.org> wrote:
>> >> > 1) The version in meta-virtualization is quite old. It is basically
>> from
>> >> 2009,
>> >> > and a lot of things has changed since then.
>> >>
>> >> And that was on purpose, there are some tight bindings to SDN and hence
>> why
>> >> it is in meta-virtualization, and not a valid reason to not contact the
>> >> layer
>> >> maintainers directly, have a discussion and not set the update to the
>> >> current
>> >> layer.
>> >>
>> >
>> > I do not understand why I would need to contact a foo layer maintainer
>> when
>> > I think a recipe has not much to do with foo.
>>
>> really ? I honestly don't know what to say about that logic.
>>
>> There's a recipe in another public layer, that is being updated, and was
>> put there for a reason. You grab a copy, send it to another layer and
>> don't even bother to cc' the originating layer's mailing list ?
>>
>> You don't think the right thing to do would be to ask a few questions,
>> and agree to the path forward ?
>>
>> >
>> >
>> >> If you would have asked, you would have been told that updates are
>> pending
>> >> with bindings that need to stay in lock step with other parts of
>> meta-virt.
>> >>
>> >
>> > Sorry, but how is this relevant? It is an extremely old recipe, and
>> should
>> > not be used. Moreover, this should not block the non-ancient users at
>> all,
>> > which is probably the majority.
>>
>> The only difference between your recipe is a new SRCREV, of which there
>> was one already pending. And perhaps, if you asked, you would have found
>> out that there were dependent other layers and recipes on some particular
>> SRCREV.
>>
>> In such a situation, we could have updated the recipe to create a new one
>> and kept the old revision around.
>>
>> Instead, you copied it, updated the SRCREV with no reference to the
>> original
>> layer, the authors and their contributions. So we have two copies in the
>> ecosystem.
>>
>> >
>> >
>> >> > 2) More importantly, this software is more like for networking rather
>> >> than
>> >> > virtualization, so I think it was misplaced.
>> >>
>> >> I disagree, so for now meta-virt is going to keep it's variants of the
>> >> recipes and
>> >> we need to have an actual discussion to figure out the best way forward.
>> >>
>> >
>> > ,,, and I disagree with you. Read the specification for openflow,
>> please. I
>>
>> I've read the specification, but I don't understand why I'm being talked
>> down
>> to here.
>>
>> See above, there's enough reason to have a discussion or at least
>> follow some etiquette.
>>
>> > fail to understand how it has anything to do with virtualization.
>> > Seriously, this is a software for networking devices. That is, exactly
>> the
>> > main purpose what meta-networking is trying to achieve: aiding the
>> > development for networking devices. As for me, it is totally
>> > non-comprehensive why a networking specification and the relevant
>> > implementation would be in meta-virtualization rather than
>> meta-networking.
>>
>> There are different opinions on many things, that's the way things work.
>> I don't think branding those alternate opinions as invalid and "non
>> comprehensive"
>> is productive .. do you ?
>>
>> openflow has control channels to openvswitch, openvswitch is tightly
>> coupled
>> to the cloud and infrastructure work that happens in meta-virt.
>> OpenDayLight
>> also has bindings to openvswitch, virtualization and more SDN components.
>> Having them all move in lockstep and not introduce incompatible SRCREVs
>> as they all update has proven tricky in the past, and will do so. Spreading
>> out across multiple layers will only make it more difficult.
>>
>> I'm not arguing that openflow isn't networking, that wouldn't be logical.
>> I'm
>> saying that it is where it is for a reason, there are multiple uses and we
>> can't
>> simply wave a wand and invalidate those other uses because we don't agree
>> with them.
>>
>> >
>> > Not to mention, I do not understand why you are trying to set a straw man
>> > in here. The discussion you are "requesting" is exactly what this thread
>> is
>> > meant to be. So, I think you are simply incorrect IMHO. :-)
>>
>> You didn't cc' the meta-vitualization mailing list. I happen to be on
>> both, and
>> by chance this is happening, and shouldn't replace a more reasonable
>> workflow.
>>
>> Cheers,
>>
>> Bruce
>>
>> >
>> > Cheers,
>> > Laszlo
>> > _______________________________________________
>> > Openembedded-devel mailing list
>> > Openembedded-devel@lists.openembedded.org
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>>
>>
>> --
>> "Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end"
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

