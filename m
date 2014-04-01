Return-Path: <stephen.arnold42@gmail.com>
Received: from mail-wg0-f41.google.com (mail-wg0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id DC8A66E89C
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Apr 2014 15:47:08 +0000 (UTC)
Received: by mail-wg0-f41.google.com with SMTP id n12so7817838wgh.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Apr 2014 08:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=5A9yi0yf49f0VR6goweo0oMfWf8N0nnTR0froHdIqME=;
	b=lb1WN/oUBiuTErEQERTMVqQ+3y/ys7nM0u0mAP9hAKNcegaf7iud3TQqWHPpGLIOKB
	nFBxBxsQx8nzVHbDqfQRuu0WNXS3sAa9diN4BHAEzW9aAVR10NqGIIhd4M/LluSnah2r
	oPRMg3sSw75JzaQl46oKsd0aQUz8ylzQyNgEuKum+4sdgHShEJjnrPfVSuv4pk1Cd8hQ
	WThLNoBrZOTy6v7iblVOrGjxtw2VtHzvN9PU7L0meCcMq6TLFFpe1/Yd3HV813n1uu/7
	LiWVl0TinlOahZXI0HXnr2cGnnnaMOAkgCxWj1luJ3rn+lR0HUpTays7ahr8ZZyrN/lL
	5BLw==
MIME-Version: 1.0
X-Received: by 10.194.109.6 with SMTP id ho6mr23859438wjb.21.1396367229365;
	Tue, 01 Apr 2014 08:47:09 -0700 (PDT)
Received: by 10.216.117.6 with HTTP; Tue, 1 Apr 2014 08:47:09 -0700 (PDT)
In-Reply-To: <F48900D76F0D8349918584FEEFEB4BCA060CD0AD@SEXCHANGE0100.lpg.priv>
References: <45034856.Fj98ikVczS@localhost.localdomain>
	<F48900D76F0D8349918584FEEFEB4BCA060CB696@SEXCHANGE0100.lpg.priv>
	<F48900D76F0D8349918584FEEFEB4BCA060CBB48@SEXCHANGE0100.lpg.priv>
	<F48900D76F0D8349918584FEEFEB4BCA060CD0AD@SEXCHANGE0100.lpg.priv>
Date: Tue, 1 Apr 2014 08:47:09 -0700
Message-ID: <CAOLEWZXJvJv2LVo9wRRzcqBA+3aqXsm+E2TQ6XvTsJYDHd=jTA@mail.gmail.com>
From: Stephen Arnold <stephen.arnold42@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: USB wifi configuration
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
X-List-Received-Date: Tue, 01 Apr 2014 15:47:12 -0000
Content-Type: text/plain; charset=ISO-8859-1

It pretty much depends on your image recipe (and/or kernel recipe if you've
got a custom one).  It sounds like your custom kernel config is being used,
which is the first thing to check (there should be a kernel module package
with your driver).

Second is what gets installed to the image , so you would need to check
your image recipe (and any include files) to see whether anything installs
"kernel-modules" or a list of individual module packages (not sure if
there's a package_group).  I specifically include kernel-modules in my
image recipes so I get them all, but if you only want specific ones then
you probably need to list each one in your IMAGE_INSTALL.  So either add
"kernel-modules" or the package name to your image, or maybe just include
an image that already does that (eg, console-image).

Steve


On Tue, Apr 1, 2014 at 6:51 AM, MONDON Daniel
<Daniel.MONDON@lpgsystems.com>wrote:

>
> -------------------------------------------------------------------------------------
> Hi,
>
> I have a 3.2.30 kernel.
> With DISTRO = "angstrom" and DISTRO_VERSION = "v2012.05"
>
> I want to use USB wifi dongle.
>
> I do "bitbake -c menuconfig virtual/kernel" modifications and put the
> output file .config in the required directory (renamed in defconfig).
> /networking support / Wireless / ...
> And /Device Drivers/Network device support/Wireless LAN/...
> (I've got RTL8287L (and a netgear WG111v2) waiting for Belkin surf N150
> reception).
>
> But I have the error to "iw list" --> "nl80211 not found."
>
> What am I forgetting.
>
> Thanks
> Daniel.
>
> --------------------------------------------------------------------------------------------
> Hi,
>
> In fact, build is done and I have everything in the deploy directory.
>
> But I don't have new modules in the packaged system :(
> Isn't it automatic ? Where is the list to be updated ?
>
> Thanks
> Daniel.
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

