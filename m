Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f53.google.com (mail-la0-f53.google.com
	[209.85.215.53])
	by mail.openembedded.org (Postfix) with ESMTP id 546CD6BB13
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 19:24:03 +0000 (UTC)
Received: by mail-la0-f53.google.com with SMTP id el20so739200lab.26
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 12:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=q6uPcmFUIn/KqSY33hFGD1njIyuQ36emUKmqSAw8Cs8=;
	b=Za0VBGE9iyKSIF8aVARXCRcFFwVRx091Gl32N1vcEjwdralY4T8OnP0S5CCHeWCIur
	MSb5x6FYrhlEiuFe0LMMzupwV3vlB+Z5oY4SE7xfyHUV9IqNID/lZXnbEE1dQCo3fp4l
	X/JjyVwWCulsnnobZ4kpYKY3Pc3d7VTmDYhkGlqhykWPOvLcdZcFubqEty2Qf800R/9A
	ECozNiaiQ5HMEJApIvGWm4XgIw7ectqr1AfP4ardolXUCsagO6tSI4fcHiUyoiAqtYrN
	6nZP/7qYVkfSx7qIPDTfKbwiEepFNDq17RPPCx+JTXOu+Yf3gCeiMHR/kXlhL6KfiKyr
	QVTg==
MIME-Version: 1.0
X-Received: by 10.152.115.242 with SMTP id jr18mr2703950lab.40.1377804243075; 
	Thu, 29 Aug 2013 12:24:03 -0700 (PDT)
Received: by 10.112.12.103 with HTTP; Thu, 29 Aug 2013 12:24:02 -0700 (PDT)
In-Reply-To: <1CD7EF41-C972-4088-B6CD-21975EEBB93B@gmail.com>
References: <20130829115339.a5c5c4a29245e5c988b774ab8f895ac5.53f04ab59e.wbe@email15.secureserver.net>
	<CADkTA4NWhz3rmAqH=yB_5H4V4f11w4qZdYUTOG73SNLyv6R-=A@mail.gmail.com>
	<1CD7EF41-C972-4088-B6CD-21975EEBB93B@gmail.com>
Date: Thu, 29 Aug 2013 15:24:02 -0400
Message-ID: <CADkTA4M=sOdCcYWXeoM5HTNDq8P661XZyGv8V+KHXgi=WZw5Vg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Elvis Dowson <elvis.dowson@gmail.com>
Cc: OpenEmbedded Developer Mailing List
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [OE-core] [oe-core] QEMU with ARM Cortex A9 with hard float configuration - Kernel panic
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
X-List-Received-Date: Thu, 29 Aug 2013 19:24:03 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Aug 29, 2013 at 3:15 PM, Elvis Dowson <elvis.dowson@gmail.com> wrote:
> HI Bruce,
>
> On Aug 29, 2013, at 10:58 PM, Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>
>> I have a vexpress A15 that works here as well, but I wouldn't mind comparing
>> configs. If you send it along, I'd have a look.
>
> Does this mean you've got vexpress-a9 and vexpress-a15, but you've never intentionally
> published or made these qemu configurations available, so that WindRiver has a commercial
> advantage when it comes to machine emulation for these machine architectures?

There's no commercial advantage to emulated machines. I've been using qemu since
it was bochs, and have booted and tried pretty much everything over
the years .. I
just like emulated platforms and machines.

The work that I did was hacks, that I had no interest in fully
supporting in Yocto. Everytime
we add a machine, there's a tax for every uprev cycle, and every
build. If you add it, you
can't let it bit rot.

I don't think I need to be accused of intentionally doing or not doing anything.

>
> I can't but help think of the discussions that we had over the meta-zynq layer, where
> the meta-zynq layer was not maintained, and WindRiver never released any of the
> updates to meta-zynq because of some "issues".
>
> At that time, you were pushing for linux-yocto and LTSI, and fast forward 1 year or more
> and the meta-zynq layer is still not updated or maintained, and it's only recently that
> Xilinx themselves added support to their meta-xilinx layer for linux-yocto.

You do realize that the entire reason that layer isn't updated, is that we
agreed with Xilinx and the other active contributors to merge all the
support into their layer, and kill off the old one. It simply took us a while to
get everyone up to speed and aligned.

>
> I've also observed that you're the only one maintaining linux-yocto!!

Clearly you aren't on the linux-yocto mailing list :)

>
> So, what I'm trying to get at it, it doesn't really help any one in the open source
> community if work that's useful for other is withheld for WindRiver gaining a commercial
> advantage (meta-zynq & xilinx case in point) and (versatile-a9 and versatile-a15)
> in point, especially when you're the sole maintainer for the linux-yocto kernel, which
> happened to mentioned qemuarma9 machine support.

Wind River works upstream first, we don't have any commercial support for any of
the emulations you are talking about. Simple because I say I've uses something,
doesn't mean that it is a commercial product.

I'd suggest toning down the conversation and accusations .. they
aren't productive
I'm just trying to help.

>
> I mean either you don't publish anything that Wind River chooses to keep proprietary
> or support the machine configurations defined in the linux-yocto meta branch.

I'm not following what you mean here  .. sorry.

Bruce

>
> Best regards,
>
> Elvis Dowson
>
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

