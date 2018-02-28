Return-Path: <schnitzeltony@gmail.com>
Received: from mail-yb0-f176.google.com (mail-yb0-f176.google.com
	[209.85.213.176])
	by mail.openembedded.org (Postfix) with ESMTP id 47CFA788B9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Feb 2018 21:33:20 +0000 (UTC)
Received: by mail-yb0-f176.google.com with SMTP id u5-v6so1397937ybf.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Feb 2018 13:33:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=aWqkL6H04cQDkNFZPH3PhouNw9Z8zg1KK5gHVu2N/rU=;
	b=NlOrqbakERmtq/ZPInjOOVaJ1/o9G3n43tOJXsfwLr5LTdbFGbC1FMlApVvzw/x7mE
	8ygN/Ea2QkGVZyykdHN6+4KQ9HvXuF8YXnd34bEfXTMxEfB8wy+dz/1/0SjrcS47oc3Y
	VK6pqng8ThDgvQccHuk0K9tR3ILIYzroxpV4ylsz3qdGRvFKBMdzzpTRXYgxSBFOI6EL
	8JquRFuNaaHyX89TZ33aQK/gRGWLAbvnQJ+JomCUlm6BF4SBl4YIRIV0w2Tz23sQmEPM
	mCZghbC5wsdzh6PfZ5WnBwauohaTKaiyiCBOJVoB68rQVCSX5g7bzAp9STL8KSPgdpPl
	oUKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=aWqkL6H04cQDkNFZPH3PhouNw9Z8zg1KK5gHVu2N/rU=;
	b=i0pPgoro0cFngluIazImFx5uus+Ay8Lxy6Z8UK9N6hzlcZEbSKx9FMRqnuXcTMSCxl
	0d04eM1gHjCJ2QiGiIjExnAOMsa+MqxgOqbx22hE5egEjg46g3bLy2Vm6ElyMjwOnT2s
	ltPmdfxVaz4JK0RMKgwy0Z86AEihdqAkPX4jOz2+9WlEyDePkL6XN+Yq3KiKgLv2Weuy
	fERV2LnqEXA9l3iYXwtvLZBWg1gaVuwD6gCd7ROndPnvvheV5HhpzGYcYos/khoIE9vu
	va3ItHNOl1rYXwRTQoojAUtaJVkkPYP0neJbKMY1tA5BXF+GcCWWOtfL5wRha0C9hn/5
	Z6Bg==
X-Gm-Message-State: APf1xPARVuNZSRchcBIs7WT9shLNLR6eESE25nT/ck4oibdsqi7L4Dtz
	YJx73MQNUWLf6CTCofPapyKcXwZx8XFOI0bgK4M=
X-Google-Smtp-Source: AG47ELufW0/rgHNbGMxnKAaYU5j6y+8mbE7BC0IDSyNp/BKWVWe1bq/2DlxTZs6eYrIVTptYaQd9PIj11rY617cRxO8=
X-Received: by 2002:a25:2103:: with SMTP id
	h3-v6mr13194931ybh.180.1519853602130; 
	Wed, 28 Feb 2018 13:33:22 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a25:c787:0:0:0:0:0 with HTTP; Wed, 28 Feb 2018 13:33:21
	-0800 (PST)
In-Reply-To: <17c4a7f6-c188-1a8c-2371-74ec67ebfdac@linux.intel.com>
References: <CAJTo0LYxqFFmUA9XcCO3_WO32NB4YLYy7pJK5ivyzPQYY5-hvQ@mail.gmail.com>
	<17c4a7f6-c188-1a8c-2371-74ec67ebfdac@linux.intel.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Wed, 28 Feb 2018 22:33:21 +0100
Message-ID: <CALbNGRQ06WiqYyvXzfPuS+QYjU-304os4_Vk=sD+DCnfQ1RoXw@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
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
X-List-Received-Date: Wed, 28 Feb 2018 21:33:21 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 28, 2018 at 6:17 PM, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:
> On 02/20/2018 12:45 PM, Burton, Ross wrote:
>>
>> Is now a good time to talk about splitting up meta-oe?  Some layers are
>> actively developed and maintained (one example: meta-python), others are
>> basically bitrotting and only get touched when something else causes them
>> to break world builds (one example: meta-gnome).  I've long felt that
>> meta-oe should be split up and the high quality layers managed in their
>> own
>> repositories so patches to them don't get held up by breakage in other
>> sub-layers.
>>
>> Another advantage of splitting out the high quality layers is that we'd
>> like to look at running more community layers through the Yocto
>> autobuilder, and granular layers make that easier to manage.
>>
>> Comments?
>
>
> I just read the whole discussion (been on holiday), and while it seems that
> splitting layers is seen as too heavy-handed, there is still something that
> I believe should be done: a policy for blacklisting and removing
> unmaintained recipes. Such a policy should be:
>
> a) clearly defined;
> b) consistently applied.
>
> If that is in place, I, as an oe-core maintainer, would be a lot more
> willing to contribute to meta-oe, knowing that recipes I contribute to (for
> example by fixing issues caused by changes in oe-core) are, in fact, used
> and taken care of otherwise. However, me endlessly fixing well obsolete
> gnome2 stuff is just a fast track to not caring anymore.
Isn't there somebody outside willing/capable/having enough time to
move to gnome 3? This would be the best way to end the gnome2 bit-rott
discussion and we'd have a desktop which is commonly used and
addresses touch input. I tried that many years ago but the blocker at
that time was gobject-introspection. These times are over for long. I
wanted to start this during christmas-holiday but then my
music-machine turned into more efforts than expected... For those
still wanting what's left over from gnome2 currently (for me gedit - I
don't like gedit3 search..) there is at least the mate-project an
alternative.
>
> So, which recipes are unmaintained?
>
> 1. Badly out of date compared to upstream development. Say, one year or more
> between version provided by meta-oe master, and latest version released by
> upstream.
For example: What if something changes upstream that makes it very
difficult or impossible for us to follow? Have no recent example for
that but I think if gobject-introspection would have worked for us
years ago, gnome2 would not be an issue anymore. You mention below
that in this case a patch has to be sent out. A comment in the recipe
would be good enough?
> 2. Recipes which fail to build, and the situation hasn't been addressed, in,
> say, six months.
Yes: recipes not building are useless. Martin has done blacklisting in
the late phase of his maintainer-ship. The only question I have here:
Does not build mean for all archs or for just .. how many?
>
> Once either of these is established, the recipe enters a grace period before
> it is removed. Any objection to such removal should come with a patch that
> addresses the reason for it.
>
I remember the times of mass blacklisting (if I remember correct last
was recipe-specific-sysroot) this was

* kind of alarm for me for those recipes I need / take care of
* easy grep'able for those recipes I thought 'why not - I have some
spare cycles left over'

So my opinion:
* Recipes not building for a time to be defined: 1. blacklist and
after x month -> remove
* Recipes outdated: same 1.blacklist (undo if somebody complains with
patch commenting in the recipe why not to remove) 2. remove after a
time period to be defined

Problem/Challenge:
The way this was handled in the past was an extra duty put on
maintainer's shoulders. If somebody could create (or is there
something already?) a script for that and append it to world builds...

Andreas

