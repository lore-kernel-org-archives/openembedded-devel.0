Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vk0-f68.google.com (mail-vk0-f68.google.com
	[209.85.213.68])
	by mail.openembedded.org (Postfix) with ESMTP id 9CD4C71A5A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Feb 2017 20:54:29 +0000 (UTC)
Received: by mail-vk0-f68.google.com with SMTP id r136so4580513vke.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Feb 2017 12:54:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=lwBmffiYBGA/VTfH4ipqFHSSoetC4a8OaTsFjJOj6bE=;
	b=BdTpxgPlFbO++HoEPaseVd7n0U/IF1OfN4rkeyCNu7bacQd3psGirSDhqoankCGcel
	+xg4A5w8+xE5tTD4IzlpDNTU9uQ4gHs4kv+hrUJ3ZBBX9yLDqcJBcaXEN3tq+ZTFbiCu
	YIqRDsswFvYeE4SqnkWuDVgYDmsDoV+gAvDDffTGtggNTAY0c6XxD8YOv6/qJiF/a/Ds
	6EEdav3Nvjpi5q1IKO4+knKOKZ9lcKIpE8iIo5KDqUWBYf5R/+7aYVj4QI2if5P2J58U
	o+Mhy81FDnCDGyWq9TxDpdnjj8rh109GSLD+xIiW2z9CyJ9D6/bSNH8vsbvMwOkG4n9a
	WYBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-transfer-encoding;
	bh=lwBmffiYBGA/VTfH4ipqFHSSoetC4a8OaTsFjJOj6bE=;
	b=HjFNV2aHynEu3KpC2v1AfCzvJvvWTwXnymOBGAoyiBnr7ZAY4NT0qRYRkplj5qkDXM
	8bL0EG5oGZNJDE65Bt0n5OTjv6Cz00UnXbeJte94wTM0uWTtC+CZZoua0cInkGS4XRvZ
	8SJYCSw4wQY3RD4HoKGKOk7TMOVJ/LnyiWgpr75k6+kLQQI+ZyqjIJKxvzvjdJ+64wXo
	KLsdVgm3JbAGo6g3rc5n4F20S3DjU0vsZ7Cp8NXIOm1CH83TVthKpT29clGib72WvBSL
	3ZdvxcuoJtHEXhgh4dYr+0IcsoJry7M8Tz8KDThBYdexIjzq/aiFsmQn4FmbKv7uaCrq
	MfMA==
X-Gm-Message-State: AMke39kO7zKA+VWy9VB5+Kl9arE7JvTuPRl17/w03CDKIwRKPhBGpAmXkzEwluw45PXhq4ox1oBBH9p6g7EVWQ==
X-Received: by 10.31.3.83 with SMTP id 80mr4237189vkd.64.1487364869612; Fri,
	17 Feb 2017 12:54:29 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.91.68 with HTTP; Fri, 17 Feb 2017 12:54:29 -0800 (PST)
In-Reply-To: <20170217182816.GD8436@mentor.com>
References: <CAJTo0LZRyFFJC8nSTa=xDiAPFcOYGU5MHW04nEoPezydBz+3oA@mail.gmail.com>
	<CALbNGRSPZw+LL3JXv4+D+k2C3DAV=5_U=44M8fcSU50V_-7KEw@mail.gmail.com>
	<20170217180254.GA3276@jama> <20170217182816.GD8436@mentor.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Fri, 17 Feb 2017 21:54:29 +0100
Message-ID: <CALbNGRRFQd7duFQZzx5tMv-yqgQt+Ch8LDxKPUh3gY2QU=M-1Q@mail.gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Fri, 17 Feb 2017 20:54:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 17, 2017 at 7:28 PM, Joe MacDonald <Joe_MacDonald@mentor.com> w=
rote:
> [Re: [oe] Splitting meta-oe?] On 17.02.17 (Fri 19:02) Martin Jansa wrote:
>
>> On Fri, Feb 17, 2017 at 06:24:09PM +0100, Andreas M=C3=BCller wrote:
>> > On Fri, Feb 17, 2017 at 6:07 PM, Burton, Ross <ross.burton@intel.com> =
wrote:
>> > > The recent storm of breakage in meta-oe caused by recipe specific sy=
sroots
>> > > was quite dramatic:
>> > >
>> > > ross@flashheart ~/Yocto/meta-oe ((044e518...))
>> > > $ git grep PNBLACKLIST| wc -l
>> > > 320
>> > >
>> > > Is it time to talk about splitting meta-oe into smaller real reposit=
ories
>> > > so they can be maintained at their own pace by more maintainers?
>> > >
>> > > Ross
>> > What exactly gets better by splitting?
>>
>> I agree with Andreas.
>
> And I agree with both of you.
>
>> 1) RSS is good thing.
>>
>> 2) The breakage wasn't caused by lack of maintainers (at least I don't
>>    think that I or Joe were the bottleneck for integrating the fixes).
>
> My schedule is highly variable but I do try to be responsive to
> breakages and I do my best to watch and digest the state of the world
> messages, those are extremely valuable IMO.
>
>> 3) More maintainers doesn't mean more contributions from people actually
>>    using now broken components, it's actually easier to just send a fix
>>    than to be a maintainer of some layer just to be able to also merge
>>    your fix yourself.
>>
>> 4) It doesn't look so dramatic if it turns out that 200 of those
>>    blacklisted recipes weren't actually used by anyone still active in
>>    OE ecosystem.
>
> Agreed.  And if those blacklisted recipes are something that someone
> in the ecosystem cares about, they really should be sending fixes back
> upstream.  Breaking meta-oe up into smaller parts doesn't seem likely to
> make them more likely to send patches, AFAICT.  Probably won't make them
> less-so, either, but I don't see changing the structure to be a
> significant win.
>
> And do note that when we first created meta-networking I was proposing
> it be separate from meta-oe, I'm now completely on the other side of
> that argument, for what that's worth.
>
>> 5) If someone wants to replace me as meta-oe maintainer, go ahead, it
>>    stopped being fun for me long time ago, now it's just slightly annoyi=
ng
>>    routine which takes my free time I would rather invest in something
>>    cooler
>
> I frankly think that'd be a loss for everyone, but it's understandable.
> That's a big, largely thankless job you've taken on.  Obviously I can't
> offer to take on more of the job than I already have with
> meta-networking or I would, but maybe someone else with a similarly "big
> picture" view will be able to share some of the workload.
Agreed. Martin you are doing a great job and without you projects
would break into 'private' layers. This cannot be the target. Coming
to blacklisting: This is the only way for you to force people start
fixing things. Nobody expects you fixing things out of your interest.

From my personal perspective as 'maintainer' of e.g
meta-xfce/meta-office/meta-qt5-extra:

* there is only very limited community - I take care for these layers
more or less myself (ok meta-xfce has seen more than the others)

* due to many oddities as
    * Cmake is cross mess
    * Qt-people write small C++ tools for each and every build-job
    * libreoffice has more or less tailored build system and builds take ag=
es
  caused me to use dirty hacks. Most of those are terribly broken now
- I need to rethink a lot and that takes time.

Coming back to Ross' suggestion: Why panic and break things apart? As
soon as somebody needs an environment requiring current oe-core and
blacklisted recipes in meta-openembedded that person will (hopefully)
send patches. If that lasts - so be it. If there is some pressing for
release cycle - feel free to send patches.

One final note on splitting - has anybody taken a look on layer index
in recent past? I think that shows what will happen if we split.
People come 'yeah I have a great layer', publish that in layer index
and leave after a while. How shall a newbie get into that?

Andreas

