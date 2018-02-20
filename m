Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f179.google.com (mail-wr0-f179.google.com
	[209.85.128.179])
	by mail.openembedded.org (Postfix) with ESMTP id 73CA37780A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Feb 2018 18:28:01 +0000 (UTC)
Received: by mail-wr0-f179.google.com with SMTP id 34so17107424wre.13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Feb 2018 10:28:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Bn3ZVREcv29xhNhom0P9Al5A5Guzg3R8mXOVWFlylo8=;
	b=EWGVsEmBdBj9YIOLVF+HmM9TsHwKYER9Z/7jDiPZFO+xpOjpIhQLtYnS81XcKN+6iz
	NtPow7q+ckGjeP4NOWKuW6trZH2J5nkjsBcMzLr5pr7seh/kmqP22uHum8vDobSX0RiG
	Zs/s0NF6hZjTgbC9/ValY1FHSjmK7TBntfJ5gM+sb/whGHGqc8zvlD9vA9gY/e4LknwB
	i+FQsyPVeEeN5FpN/r+5adxc3/YCLoq1ReUpCrrHLEuFRq+SBSwjxIlhAiKNBBmDUhQD
	vz7a6KkpITDONrOJnxHcaxnEOb97qFTkykLQCm+DJiHvNeLQnsv7z2bNtt/CsuJnCOIR
	WNrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Bn3ZVREcv29xhNhom0P9Al5A5Guzg3R8mXOVWFlylo8=;
	b=OAgoWOPDc6W7kyh6QTYbm7ffNRuhnUWz7ypr5Q6A/WvLzQpx32BlySalbQMMJgRtip
	DELCTh7uYJoI5yZ9/f5enNwDpVCTi0aiYrcPpqmt4FbWR0VDLfo50ZlUE46SEJB/tD1c
	l4/ld77ug6Nu7Cv9a1WX7e/0d/E/AohmHL38mF+ODWApbcnQfz4IMAN6O321vU91H4x6
	l6y2InEMTYMXdSExde3ctdFrJ3ylNqwwHE3b/Tqte+2OZPIcmA80CK2+5jLs2V5eZxaN
	NmyRQoLc2jtR77vMTW7bxOU/9i+ta4+33hTuAI2GuysTm5wnuyWbBTufeaG367MRHmMk
	NZ8w==
X-Gm-Message-State: APf1xPAuCzqNIV/gg0lweVvI9canQ2hVnDPnqmsbDtT/iBalFlsOioLd
	H70ek5RTs5JaJAlGlG2W98JKBnA7CsLdIvu8VPY=
X-Google-Smtp-Source: AH8x226tPSUFjfj9WwEJqscS1D96gY61zWCmHzavgDBAojYqBew6TinEPzm4xS6P8n1dh4mmUrLRtO7n3Sh4YETdJAs=
X-Received: by 10.28.196.200 with SMTP id u191mr1039943wmf.17.1519151283047;
	Tue, 20 Feb 2018 10:28:03 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.74.211 with HTTP; Tue, 20 Feb 2018 10:28:02 -0800 (PST)
In-Reply-To: <CANx9H-AioXLbdF=aZjuFSU3Ev3d131wFQbF1b-RH1PtMES3-3Q@mail.gmail.com>
References: <CAJTo0LYxqFFmUA9XcCO3_WO32NB4YLYy7pJK5ivyzPQYY5-hvQ@mail.gmail.com>
	<f808dcd5-82b9-b9c7-2c4a-b5b35b21fb42@gmail.com>
	<1519148811.24236.321.camel@linuxfoundation.org>
	<CANx9H-AioXLbdF=aZjuFSU3Ev3d131wFQbF1b-RH1PtMES3-3Q@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 20 Feb 2018 19:28:02 +0100
Message-ID: <CA+chaQfxKEBEzmFv7esKfz6r-p1G7HKuD0nAR4L8N1WAmpT1_w@mail.gmail.com>
To: Tim Orling <ticotimo@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
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
X-List-Received-Date: Tue, 20 Feb 2018 18:28:02 -0000
Content-Type: text/plain; charset="UTF-8"

I still fail to see how splitting the layers into separate repositories
will magically help with the quality of recipes stored there.

meta-python, meta-perl, meta-filesystems, meta-gnome, meta-networking,
meta-webserver, meta-xfce all depend on meta-oe layer.

Build testing fewer layers in "world" builds will probably lower the
overall quality of the layers (and their compatibility with each other).

Building the same set of layers in "world" builds just from different
repositories, won't make the build failures go away, it will just cause
more work for Armin or whoever will be willing to continue running those
builds.

Testing some layers like meta-python and meta-perl on YP auto builder would
be nice, but why do they need to be in separate repository for that?

Making meta-networking, meta-python and meta-perl not to depend on meta-oe
is also nice goal, but again not blocked by all these layers sharing the
same git repository. Creating new
meta-shared-stuff-nobody-knows-how-to-call-this-layer as common dependency
for these 3 is also possible in meta-oe git repository (even easier to
switch to then creating new repository for each of them).

Armin is still merging patches e.g. to meta-python even when last clean
"bitbake world" status was on 2017-05-03. So don't make it sound like
meta-gnome is blocking meta-python progress. FWIW: There is only one
failing recipe in meta-gnome and at least 7 failing in meta-networking (to
be fair 5 of them are caused by very recent kernel upgrade).

If the git repository has the reputation (not the layers you're using from
there), then I can say that oe-core git repository is quite bad, because it
has meta-skeleton which doesn't have anything useful for me and has only 4
commits in last 2 years.

Regards,

On Tue, Feb 20, 2018 at 7:00 PM, Tim Orling <ticotimo@gmail.com> wrote:

> The recent improvements to the Auto Upgrade Helper have made maintenance of
> meta-perl less effort and therefore you have seen an uptick in my updates
> to recipes. I also plan to mass-add ptest to all perl module recipes
> "sometime soon", which will further simplify my upgrade workflow and add to
> the confidence of said recipes. My upgrade workflow touches all recipes in
> oe-core, meta-oe and meta-perl that fit a lib*perl regex.
>
> I will note, however, that we are revisiting meta-cpan and that may
> ultimately be the preferred perl layer. If you really heavily on perl
> modules, please comment on whether meta-cpan would fit your needs.
>
> Derek and others have been doing a great job keeping meta-python up to
> date. I mostly jump in when there are trickier failures that need more
> concentrated effort. I would like to see increased testing (more packages
> with ptest), but that is trickier with python recipes as there are many
> more approaches to testing than there are in perl. I am happy with the
> current efforts to keep recipes up to date as a priority. I would like to
> see complete coverage of python3 for all recipes that are capable in
> meta-python.
>
> I am open to discussion about what direction we go. Individual layers that
> are curated and built together by YP auto builders sounds like an
> intriguing path. If this was coupled with increased ptest or testimage
> usage, our confidence in layer quality would go up dramatically.
>
> Cheers,
>
> --Tim
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

