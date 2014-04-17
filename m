Return-Path: <b.hutchman@gmail.com>
Received: from mail-ob0-f174.google.com (mail-ob0-f174.google.com
	[209.85.214.174])
	by mail.openembedded.org (Postfix) with ESMTP id 394B765E61
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Apr 2014 01:28:04 +0000 (UTC)
Received: by mail-ob0-f174.google.com with SMTP id gq1so4988302obb.19
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Apr 2014 18:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=6gGwtXGslOKsq7vLnzbkm0citPuXyZ0oRpi+NEKbGFs=;
	b=O0Fp4Yx/XlHWF7cZeOQBgt9iVAt0QCjYrgaK1vZyq2LXHyuyh6+xILbAKw5WCoxTKQ
	4f9VbBrOTuRaELJTKYBYYClkO9vQkStRw11UZ7KGh2nRh3l49d/FtU+bat+oMyPVRgHs
	AA9LmBfpNo2OxnX5dEU/7zZcyV9b2lxp25qjsexo2WPlb+Vb5yDwygRfH9N25yEuw0T0
	6SmazX+JxmliLzbPonWbNBxhp1xK3s157TJtGwPGwMONRLdL40970ovaOB5VceRysGYs
	nVqN2NZvKnsD95rXGqbY944ENAameoof4W+tjAPUgqyS3mGaE/ei/8YjI0liaLXZVK+p
	G3oA==
MIME-Version: 1.0
X-Received: by 10.182.246.35 with SMTP id xt3mr4744060obc.39.1397698084878;
	Wed, 16 Apr 2014 18:28:04 -0700 (PDT)
Received: by 10.60.73.165 with HTTP; Wed, 16 Apr 2014 18:28:04 -0700 (PDT)
In-Reply-To: <CALYKT1jWHnv+Ja2kAj-UpHWngCNO3s5i88R6r5-ScNpmDDSnOg@mail.gmail.com>
References: <CALYKT1hsAOf+qKTPO_fNpBf1u0CJoXm0L2Nz6VCafbqckYY2oA@mail.gmail.com>
	<534E7151.5030504@balister.org>
	<CAP71WjzyBZ6ZhbaeOvYiqbuvbux8jYRXDMeg_K27LCrVHcUyJg@mail.gmail.com>
	<CALYKT1jWHnv+Ja2kAj-UpHWngCNO3s5i88R6r5-ScNpmDDSnOg@mail.gmail.com>
Date: Wed, 16 Apr 2014 21:28:04 -0400
Message-ID: <CAFZh4h9LwJkSjS-M8687ALRFdwAWYS2_DytOx3v3MGxj=Gte+A@mail.gmail.com>
From: Brian Hutchinson <b.hutchman@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: What is the relationship between Open Embedded for MSM and Yocto Project?
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
X-List-Received-Date: Thu, 17 Apr 2014 01:28:05 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Apr 16, 2014 at 7:51 PM, Journeyer J. Joh
<oosaprogrammer@gmail.com>wrote:

> Hi Denys Dmytriyenko,
>
> I would recommend you to talk to someone from your company who's more
> > familiar
> > with the code base that you are trying to look at and how it is derived
> > and/or
> > relates to OpenEmbedded and the Yocto Project.
>
>
> This is what exactly I am sorry for..
> I, in my team, the only one who works with linux.
> There are people who works with linux but, until now, I cannot meet them
> easily. I feel mail-list more kindly than them..
> And I am new to this company...
> Telling this story doesn't look fit to the purpose of this maillist but,
> this is just my story..
>
> And this is the reason why I thank you for your kindness..
> But I agree I should try to talk with people in my company.
>
> I don't know what "OE for MSM" is, that you keep referring, probably
> your company's
> > product based on OE.
>
>
> I think this might be the OE for MSM:
>
> https://www.codeaurora.org/xwiki/bin/QLBEP/WebHome
>
> Thank you ...
> Sincerely
> Journeyer
>
>
>
> Hi Journeyer,

After paying more attention to the platform you are using ... I'm doubtful
that the sdk instructions we mentioned to you before will actually work for
you especially seeing that the snapshot of OE at the links you provided are
2011/2012 vintage.  You may want to investigate the older bitbake
meta-toolchain recipes (meta-toolchain-sdk too).

So if the sdk instructions don't work, but you need to work with the latest
OE/Yocto releases ... you may have to do things like I've had to do in the
past for some platforms that aren't directly supported by OE, Yocto etc.
 I've had to use the kernel/u-boot that came from the silicon vendor (never
mainlined and probably never will and are frozen in time) and I build
u-boot and kernel source from vendor outside of bitbake (standalone). You
can use the toolchain that is probably provided with the MDM and setup OE
or Yocto to use that toolchain as an external toolchain to build current
released filesystem images and packages.  This way you have new
applications in the rootfs but may be stuck (if it isn't mainlined) with
old kernel.

Your mileage will vary if you decide to go down this road as there can be
land mines ... It is always best to keep toolchain, kernel, and root
filesystem moving forward (not necessarily using the latest but not lagging
too far behind it) and not let one of them get pinned being static but some
times you don't have much of a choice (I've been there).  Sometimes when
you try to build new filesystem images with old toolchains you run into
problems.  Building old kernels with new toolchains also causes problems.
 So if you are like me and have a product that needs new kernels and
filesystem images to keep up with security threats etc., ... you're going
to have a hard life for a while (ask me how I know).

You can also study the platform specific differences between what
codeaurora (the working example that supports your platform) provided and
what the latest releases of OE/yocto provide and make new recipies and
bsp's in the latest releases of OE or Yocto to support your platform which
is the right thing to do ... but requires the most knowledge of the build
system to do.

I hope I'm not confusing you ... just trying to give you ideas of what
options you have so you can best pick a solution that fits with what you
are trying to do.  You may have to pick a less than ideal solution to start
with and as you learn more move toward adding platform/BSP support for your
hardware to the latest version of OE, Yocto etc.

Regards,

Brian

