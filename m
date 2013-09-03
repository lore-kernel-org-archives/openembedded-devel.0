Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f171.google.com (mail-lb0-f171.google.com
	[209.85.217.171])
	by mail.openembedded.org (Postfix) with ESMTP id BF63F6BBD8
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Sep 2013 13:04:16 +0000 (UTC)
Received: by mail-lb0-f171.google.com with SMTP id u14so4935489lbd.16
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Sep 2013 06:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=ABZFY70xWCPBB6IB5yy5v8Ip+yDS6I8ohNUh7JaPrmE=;
	b=byQ62PmyQI2LPJYZAsYhS2RN88bOIh7D+WPfHCMsxWLdXJzdLhQ/+mNNXQbRKaSksT
	E4cADpydC5AY/1WOfzB/b/YRZHM62Tbh3TKSXSCVy8RqvSbg8E3R946YTALPEHzqqgRR
	muZCfjX8jutCNmZjU4hllygUYddORcEjnA2anODMbTJGzCn9UQS9zr+G/UsS8Lk68m68
	QsuU9yzme1dKyaY55PUrpyYLoXCOGsaIjL1PByUydHcUAQwjMfmtx0drKZD4m+OTw/iH
	+EzVyCA8oF0p4y5IUK6wmf8ZUC7AGeEGEUdj4aWP7Q0wLA3Fm7+6iCfSYTo3fC+c2S/G
	fqoA==
MIME-Version: 1.0
X-Received: by 10.152.37.41 with SMTP id v9mr26730994laj.9.1378213456511; Tue,
	03 Sep 2013 06:04:16 -0700 (PDT)
Received: by 10.112.12.103 with HTTP; Tue, 3 Sep 2013 06:04:16 -0700 (PDT)
In-Reply-To: <CAOMwXhNV70uRZiL1T+gbguZnBrwUwdUzfGA30d6N-OvhSK__xA@mail.gmail.com>
References: <1378110051-8976-1-git-send-email-lpapp@kde.org>
	<CADkTA4NZ-M6XBYx2bBBW_QtMtsUnDNdyYggr1Wa=6Qu33EHvPQ@mail.gmail.com>
	<CAOMwXhNV70uRZiL1T+gbguZnBrwUwdUzfGA30d6N-OvhSK__xA@mail.gmail.com>
Date: Tue, 3 Sep 2013 09:04:16 -0400
Message-ID: <CADkTA4P-tyfnX5Dywf8Z+tSEVxjbrykio5tFg_UmhkrTvORdyw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Tue, 03 Sep 2013 13:04:18 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Sep 2, 2013 at 11:55 PM, Laszlo Papp <lpapp@kde.org> wrote:
> On Tue, Sep 3, 2013 at 2:56 AM, Bruce Ashfield <bruce.ashfield@gmail.com>wrote:
>
>> On Mon, Sep 2, 2013 at 4:20 AM, Laszlo Papp <lpapp@kde.org> wrote:
>> > 1) The version in meta-virtualization is quite old. It is basically from
>> 2009,
>> > and a lot of things has changed since then.
>>
>> And that was on purpose, there are some tight bindings to SDN and hence why
>> it is in meta-virtualization, and not a valid reason to not contact the
>> layer
>> maintainers directly, have a discussion and not set the update to the
>> current
>> layer.
>>
>
> I do not understand why I would need to contact a foo layer maintainer when
> I think a recipe has not much to do with foo.

really ? I honestly don't know what to say about that logic.

There's a recipe in another public layer, that is being updated, and was
put there for a reason. You grab a copy, send it to another layer and
don't even bother to cc' the originating layer's mailing list ?

You don't think the right thing to do would be to ask a few questions,
and agree to the path forward ?

>
>
>> If you would have asked, you would have been told that updates are pending
>> with bindings that need to stay in lock step with other parts of meta-virt.
>>
>
> Sorry, but how is this relevant? It is an extremely old recipe, and should
> not be used. Moreover, this should not block the non-ancient users at all,
> which is probably the majority.

The only difference between your recipe is a new SRCREV, of which there
was one already pending. And perhaps, if you asked, you would have found
out that there were dependent other layers and recipes on some particular
SRCREV.

In such a situation, we could have updated the recipe to create a new one
and kept the old revision around.

Instead, you copied it, updated the SRCREV with no reference to the original
layer, the authors and their contributions. So we have two copies in the
ecosystem.

>
>
>> > 2) More importantly, this software is more like for networking rather
>> than
>> > virtualization, so I think it was misplaced.
>>
>> I disagree, so for now meta-virt is going to keep it's variants of the
>> recipes and
>> we need to have an actual discussion to figure out the best way forward.
>>
>
> ,,, and I disagree with you. Read the specification for openflow, please. I

I've read the specification, but I don't understand why I'm being talked down
to here.

See above, there's enough reason to have a discussion or at least
follow some etiquette.

> fail to understand how it has anything to do with virtualization.
> Seriously, this is a software for networking devices. That is, exactly the
> main purpose what meta-networking is trying to achieve: aiding the
> development for networking devices. As for me, it is totally
> non-comprehensive why a networking specification and the relevant
> implementation would be in meta-virtualization rather than meta-networking.

There are different opinions on many things, that's the way things work.
I don't think branding those alternate opinions as invalid and "non
comprehensive"
is productive .. do you ?

openflow has control channels to openvswitch, openvswitch is tightly coupled
to the cloud and infrastructure work that happens in meta-virt. OpenDayLight
also has bindings to openvswitch, virtualization and more SDN components.
Having them all move in lockstep and not introduce incompatible SRCREVs
as they all update has proven tricky in the past, and will do so. Spreading
out across multiple layers will only make it more difficult.

I'm not arguing that openflow isn't networking, that wouldn't be logical. I'm
saying that it is where it is for a reason, there are multiple uses and we can't
simply wave a wand and invalidate those other uses because we don't agree
with them.

>
> Not to mention, I do not understand why you are trying to set a straw man
> in here. The discussion you are "requesting" is exactly what this thread is
> meant to be. So, I think you are simply incorrect IMHO. :-)

You didn't cc' the meta-vitualization mailing list. I happen to be on both, and
by chance this is happening, and shouldn't replace a more reasonable
workflow.

Cheers,

Bruce

>
> Cheers,
> Laszlo
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

