Return-Path: <b.hutchman@gmail.com>
Received: from mail-oa0-f52.google.com (mail-oa0-f52.google.com
	[209.85.219.52])
	by mail.openembedded.org (Postfix) with ESMTP id 280FF65D78
	for <Openembedded-devel@lists.openembedded.org>;
	Thu, 10 Apr 2014 13:10:15 +0000 (UTC)
Received: by mail-oa0-f52.google.com with SMTP id l6so4432072oag.11
	for <Openembedded-devel@lists.openembedded.org>;
	Thu, 10 Apr 2014 06:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=UXfL5M18F8YPsne/Ih+6PEUDck+Sjqw8/FtMIHjvhnk=;
	b=Y3ct73eMts4l0pv9ZNdooq727jdBMD4+B0YH3+BBMKNV0ZaW5awg86Dk91JOFXhCXR
	Oo6NfKgUYF5ZrOSajjTitraXDMgUDsy7ZTABalxL3AgTCxxs5xq8dHfgMqoZsDGphs4v
	Js4DsfwNF3g/6FK+ObVioX75Ds6QlP3Q5FyOSBSbhlUTO/CeQ1STrCCdWZB1BZOPzuWz
	uykdDQQLz3J8rJiAvbxRxHumt4o/H7sSPlEXcKj0svXG61DcaeY3bLkEUCAkNCVHeVkE
	TtP+Y0a6OdLJxU2OZ6U6Z8M5wQQFQ497K3Q/JqPZ4dZcMbriEwsZzyCNmpoDomBR4SOv
	gvcg==
MIME-Version: 1.0
X-Received: by 10.60.65.1 with SMTP id t1mr13046974oes.7.1397135414730; Thu,
	10 Apr 2014 06:10:14 -0700 (PDT)
Received: by 10.60.73.165 with HTTP; Thu, 10 Apr 2014 06:10:14 -0700 (PDT)
In-Reply-To: <CAFZh4h8F5gbopRfU01t1U4LPW2g-amsnFJe0HkUptD9Xac60jA@mail.gmail.com>
References: <CAFZh4h8F5gbopRfU01t1U4LPW2g-amsnFJe0HkUptD9Xac60jA@mail.gmail.com>
Date: Thu, 10 Apr 2014 09:10:14 -0400
Message-ID: <CAFZh4h9SFyWK76jsumww+5JPbUzovK+wzcjYbGbAsaCxbmkCGw@mail.gmail.com>
From: Brian Hutchinson <b.hutchman@gmail.com>
To: Openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Thu, 10 Apr 2014 13:10:16 -0000
Content-Type: text/plain; charset=ISO-8859-1

OK an update.  I decided to stub the automount.rules for the moment to try
and get things working the old way and I'm seeing some curious behavior.
The target is running Yocto 1.5 so it is a fairly recent distro.

I made an entry in /etc/fstab for my eUSB with the sixth column set to 2.
On reboot fsck doesn't run.  Hmmm, curious.  I still see the:

EXT4-fs (sda1): warning: maximal mount count reached, running e2fsck is
recommended
EXT4-fs (sda1): mounted filesystem with ordered data mode. Opts: (null)

... messages at boot.

So I do touch /forcefsck and reboot.   Same result.
shutdown -rF ... same result.

I can't figure out why none of these methods is checking my eUSB drive.

Regards,

Brian



On Wed, Apr 9, 2014 at 4:53 PM, Brian Hutchinson <b.hutchman@gmail.com>wrote:

> Hi,
>
> I have a custom board that has a eUSB NAND attached (its a little circuit
> board with a header Micron e230).
>
> With the udev-extraconf package installed, udev looks like it
> automatically mounts my device via the automount.rules (calling mount.sh)
> on boot.
>
> I'd like udev to fsck this device before it auto mounts it.  Should I
> just make or modify a udev rule to get this behavior or is there already
> another package out there I'm missing that already has rules to do this
> that I can use?  Don't want to reinvent the wheel if I'm just missing
> something.
>
> The eUSB NAND has an ext4 filesystem on it but I'm starting to see some
> corruption ... possibly from the journal getting messed up from too many
> improper shutdowns etc.
>
> Regards,
>
> Brian
>
> <http://layers.openembedded.org/layerindex/recipe/629/>
>

