Return-Path: <alistair23@gmail.com>
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
	[209.85.167.68])
	by mail.openembedded.org (Postfix) with ESMTP id C70D479DED
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jan 2019 18:43:08 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id u18so8567926lff.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jan 2019 10:43:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=R92d/Y0bibGnBzWEktc015mbA/IZY8LqLVQIjByOthU=;
	b=DEsmRisqh9EfkkwVYxKZW2vOCmTb0nN43l5y1u/iNJGP/WnW/6n/e9FYV+Nxn1w+wB
	u9Tk1mSxR58QYV4SwtDBkSlSPlR4/2YGD03JnLIPa3fhDxcztvFjI9J95jUNldDZCaPX
	0tnz0JCqc5UTbus4Sy++6V9mMCMjjXTTxoSuEA39x7K5xMDHapjaUDdU6PomB7tF4bAQ
	ze3PAuwWIFR7XxeKNFHLQRDZ0Gu4cg2CkMzt4gnL5NUWfRTQ4Wd6bLLKbEDoFO37MMLC
	gsHwlC/o6b5n//s45OAPMFpOYZwGwkEqn11Nh4AHBcqcFKBVLG5RGzHIkIAxDhz1Td5r
	3DzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=R92d/Y0bibGnBzWEktc015mbA/IZY8LqLVQIjByOthU=;
	b=paMWNS0sYeOwiMldiDOtln+OJ2H721hxg1HEh5ENJCL5wznNZ4Kah9MtXmGnbn4MIz
	0SR0Yg1bI5cC5uLKbxThja/ZW17Jic+locWjI/QwUnD2xLleu23GxkTXZHS620hrmQhJ
	s2LeYfasQK1TEEBjbsNwDl/wEldu0w7zT6TyZyDUgqwjhhowWWLD+ZhyAprR+jy9Sg/N
	341ov3Zg2M2hHJn0xClRwI3tP2HbcS2s+zx7rWDbvsHv5pR6E0eS0XyGABwNNpdNq+bz
	YVt4+kB54c/bblDpe7i1VfVBJayBdb4nxscVLm17dK7eWg5yY3rbExCHqIUaQWS3TF5J
	ja1w==
X-Gm-Message-State: AJcUuke1rhHr1v1KH/f1RwZzg5AR9zadc3vxc/x5ulIHiRu2uDAmwmS4
	gYTvsO9+N7uR/+bRmi118tjMv2cKupKomgRu7Xs=
X-Google-Smtp-Source: ALg8bN6O6/msPPbYArra8I645OuI9my2aiORJETY+y+YalidSKp+PyKdJvoRp3eZbJ+6nbatNUoGm61Gebwko2x5wPI=
X-Received: by 2002:ac2:53bc:: with SMTP id j28mr11328282lfh.86.1547750588591; 
	Thu, 17 Jan 2019 10:43:08 -0800 (PST)
MIME-Version: 1.0
References: <20190117183314.23139-1-alistair.francis@wdc.com>
	<CAMKF1sqwxU7bVBhVHb=s9DuJZpyMe-WzM=N0aBLHJNuPHnh4cg@mail.gmail.com>
In-Reply-To: <CAMKF1sqwxU7bVBhVHb=s9DuJZpyMe-WzM=N0aBLHJNuPHnh4cg@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 17 Jan 2019 10:42:41 -0800
Message-ID: <CAKmqyKOxu=2GA4NwRno=4UfpcT=39gFj0_iYJ04G=0e-brDtXg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] xorg-driver: xf86-video-ati: Add RISCV to COMPATIBLE_MACHINE
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
X-List-Received-Date: Thu, 17 Jan 2019 18:43:09 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 17, 2019 at 10:41 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Thu, Jan 17, 2019 at 10:33 AM Alistair Francis
> <Alistair.Francis@wdc.com> wrote:
> >
> > The ATI drivers can work on non-x86 platforms such as RISC-V, add RISC-V
> > as an option in the COMPATIBLE_MACHINE requirement.
> >
>
> surprisingly, the v1 built ok on all testing platforms I have
> so I have merged that one.

Great! I think that makes the most sense. If it builds for RISC-V it
must build for anything :)

Alistair

>
> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > ---
> >  meta-oe/recipes-graphics/xorg-driver/xf86-video-ati_18.0.1.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-ati_18.0.1.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-video-ati_18.0.1.bb
> > index 969c1a0a6..efd76c92c 100644
> > --- a/meta-oe/recipes-graphics/xorg-driver/xf86-video-ati_18.0.1.bb
> > +++ b/meta-oe/recipes-graphics/xorg-driver/xf86-video-ati_18.0.1.bb
> > @@ -12,7 +12,7 @@ DEPENDS += "virtual/libx11 libxvmc drm \
> >  inherit distro_features_check
> >  REQUIRED_DISTRO_FEATURES += "opengl"
> >
> > -COMPATIBLE_HOST = '(i.86|x86_64).*-linux'
> > +COMPATIBLE_HOST = '(i.86|x86_64|riscv).*-linux'
> >
> >  SRC_URI[md5sum] = "40e7c0a5a69aba3d84e0958f58705ea7"
> >  SRC_URI[sha256sum] = "72ea3b8127d4550b64f797457f5a7851a541fa4ee2cc3f345b6c1886b81714a0"
> > --
> > 2.19.1
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

