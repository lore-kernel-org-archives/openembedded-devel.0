Return-Path: <b.hutchman@gmail.com>
Received: from mail-oa0-f49.google.com (mail-oa0-f49.google.com
	[209.85.219.49])
	by mail.openembedded.org (Postfix) with ESMTP id A51CE65E73
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Apr 2014 15:12:21 +0000 (UTC)
Received: by mail-oa0-f49.google.com with SMTP id o6so4539449oag.8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Apr 2014 08:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=+eczURQio8JGrmlpBAfBdZkQh1nl1XqXa0EijkOhqJk=;
	b=tluDcPuJM15fFKb13pRJtnqcOEG8YuxD5v1sM1VVc+vZNoFWRyoq9YnC18DSWoWcvE
	EAu06UoMC9HzS/O8vIv2ZZe9nlfsqwvtGwu9Rk+k3N4HKSm3hPD6JS3BdFqO9TNyyK3m
	t46vFbtXVIzsfQOTUZD33WHX0ZjEIlBgMhPgY/2Mg0h0G5oJpjUYXCht8//dpNaWx1qL
	LWr44r8/ThRl9mf6bnFhFRAxbY+ckh81yVt3Lae1Y5w06hdaiA6F8DdVZBxPC2UeW3vA
	9BTWgY7yq4TCui5sozNKtBUCEVlSRri3fEIRp0k5ZefRbfgPMzxrkSmVVUFL/16P1xlt
	nnig==
MIME-Version: 1.0
X-Received: by 10.60.74.195 with SMTP id w3mr14524598oev.28.1397142742630;
	Thu, 10 Apr 2014 08:12:22 -0700 (PDT)
Received: by 10.60.73.165 with HTTP; Thu, 10 Apr 2014 08:12:22 -0700 (PDT)
In-Reply-To: <li6b0g$9m6$1@ger.gmane.org>
References: <CAFZh4h8F5gbopRfU01t1U4LPW2g-amsnFJe0HkUptD9Xac60jA@mail.gmail.com>
	<CAFZh4h9SFyWK76jsumww+5JPbUzovK+wzcjYbGbAsaCxbmkCGw@mail.gmail.com>
	<li6b0g$9m6$1@ger.gmane.org>
Date: Thu, 10 Apr 2014 11:12:22 -0400
Message-ID: <CAFZh4h8oAnNZfswMF+6tf5Byxxc+B0weLLNMQeudLpcdRtmyUg@mail.gmail.com>
From: Brian Hutchinson <b.hutchman@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: udev auto-mount not doing fsck
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
X-List-Received-Date: Thu, 10 Apr 2014 15:12:22 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Apr 10, 2014 at 10:48 AM, Koen Kooi <koen@dominion.thruhere.net>wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Brian Hutchinson schreef op 10-04-14 15:10:
> > OK an update.  I decided to stub the automount.rules for the moment to
> > try and get things working the old way and I'm seeing some curious
> > behavior. The target is running Yocto 1.5 so it is a fairly recent
> > distro.
> >
> > I made an entry in /etc/fstab for my eUSB with the sixth column set to
> > 2. On reboot fsck doesn't run.  Hmmm, curious.  I still see the:
> >
> > EXT4-fs (sda1): warning: maximal mount count reached, running e2fsck is
> > recommended EXT4-fs (sda1): mounted filesystem with ordered data mode.
> > Opts: (null)
> >
> > ... messages at boot.
> >
> > So I do touch /forcefsck and reboot.   Same result. shutdown -rF ... same
> > result.
> >
> > I can't figure out why none of these methods is checking my eUSB drive.
>
> To ask the obvious question: is fsck.ext{2,3,4} present on your system?
>
>
Hey Koen,

Yes, I have the complete e2fsprogs package in the rootfs so I have e2fsck
etc.

I just did some tests where I modified the existing mount.sh to run fsck
first (which busybox passes through and calls the real e2fsck) an so using
udev rules with some ENV{ID_} type commands to identify my eUSB and then
call my "special" mount script via RUN appears to work so I guess I'll have
to continue going that route .... which is in keeping with the new udev way
of doing things.

I was just kind of puzzled as to why the older methods didn't work ... not
that I have ran into this kind of thing before.  Usually I'm using a raw
NOR or NAND and with a filesystem that deals with the FTL ... this is my
first time using a mass storage device that handles all the ECC, leveling
etc. behind the scenes and pretends to be a disk.

Regards,

Brian

