Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1SIQ4q-0000Ih-6l
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Apr 2012 21:53:08 +0200
Received: by wgbdr12 with SMTP id dr12so1976339wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Apr 2012 12:43:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:date
	:message-id:subject:from:to:content-type:x-gm-message-state;
	bh=MC4RbNrAJefGMxSVqbOH9lZCZ7dGQYzHI8pKawJb7WU=;
	b=VGf+5cWNI5KU85zjlA/vTdFAi6Z3zIfhHTM5s8jISz6g3N24rYF7AlhpGpmUxaHOW/
	PdZO/xLWhFEnpgkTtlwISqlFSh2SQHcvHbVxIgSzmsIqNWnTSSIRvaDPCxdSrAmP8Iko
	HNl8yCuJuh50uaqUf4PaCaqGSFXrXZjVD7YxoPHZ8k9lcVkrSpIDeaRBwt8abKCnd3uH
	kLQ9j2RNxe2nD8hPs+vcSErEAcMDQ5A3N5uGR0phnJZfcs9lCYkYtwJ15u5G4fmVzJtB
	IFB3BjlekhRMyRmaV2fIo5FYUWTv990kD87vaJWbI+91rQ4mkCfkyFPvl5kYhrCkao8H
	njwg==
MIME-Version: 1.0
Received: by 10.180.24.66 with SMTP id s2mr8739105wif.7.1334259827768; Thu, 12
	Apr 2012 12:43:47 -0700 (PDT)
Received: by 10.227.158.16 with HTTP; Thu, 12 Apr 2012 12:43:47 -0700 (PDT)
X-Originating-IP: [93.114.75.57]
Received: by 10.227.158.16 with HTTP; Thu, 12 Apr 2012 12:43:47 -0700 (PDT)
In-Reply-To: <CAHTvVMen9K_AGfn8O7GMgKvY0XZ-oiDg3oOmSz_sBK6GSGChtQ@mail.gmail.com>
References: <CAHTvVMen9K_AGfn8O7GMgKvY0XZ-oiDg3oOmSz_sBK6GSGChtQ@mail.gmail.com>
Date: Thu, 12 Apr 2012 22:43:47 +0300
Message-ID: <CAK18fxEdrbDY+-be7v9rxOB2tEScHx71BjbfxDnk2eqMiQTpiA@mail.gmail.com>
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQkBtoEztcpDJ8/ZIf/s0SvYQDT0pdQ14ZxWzOrYDMtSxvBgki+7ICdleVRMe1YRY7ZhFoJB
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Hard floating point support for armv7a wmmx2 processor in oe-core
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 12 Apr 2012 19:53:08 -0000
Content-Type: text/plain; charset=ISO-8859-1

Cubox as in that 2cm^3 board?
On Apr 12, 2012 8:39 PM, "Nicolas Aguirre" <aguirre.nicolas@gmail.com>
wrote:

> Hi,
>
> I'm building an oe-core minimal image and toolchain for the cubox[1]
> which has a Marvell Armada 510 SoC, also known as Dove.
> It's a armv7 Arm processor with wmmx2 instruction set [2].
>
> I setup a new machine for the cubox and added :
> require conf/machine/include/arm/arch-armv7a.inc
> in my cubox.conf file
>
> I also added
> ARM_FP_MODE = "hardfp"
> TARGET_FPU = "hardfp"
> in my local.conf file.
>
> It finished the build sucessfully for angstrom efl-nodm-image.
>
> I don't know exactly which option enable and where to add it to enable
> hard floating point.
> I see in meta-oe/meta/conf/machine/include/arm/arch-armv7a.inc
> references to the armv7ahf architecture but without idea how to
> activate it.
>
> Btw is the 'a' after armv7 important for me ? As it seems that this
> arm core is an armv7 and not armv7a. I dont find arch-armv7.inc file
> in oe-core.
>
> Another problem is, how to add support for wmmx2 instruction set ?
> There is tune-iwmmxt.inc but it seems to refer to armv5 arch. There is
> a way to enable this instruction set ?
>
> Any help would be appreciate :)
>
> [1] http://www.solid-run.com/products/cubox
> [2] http://www.marvell.com/application-processors/armada-500/
>
> regards,
> --
> Nicolas Aguirre
> Mail: aguirre.nicolas@gmail.com
> Web: http://enna.geexbox.org
> Blog: http://dev.enlightenment.fr/~captainigloo/
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

