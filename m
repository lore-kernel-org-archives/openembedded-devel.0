Return-Path: <max.oss.09@gmail.com>
Received: from mail-wg0-f48.google.com (mail-wg0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id EFE3F73E3B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jun 2015 20:18:22 +0000 (UTC)
Received: by wgbhy7 with SMTP id hy7so46261887wgb.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jun 2015 13:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:content-type:mime-version:content-transfer-encoding;
	bh=8PBeb4ZsHKBTdsuFOPVJAfFTJoivAB23hoOgUb84SzY=;
	b=AbpDR8oSxCnz68gZvtlubDbjU6XEPTU6vmnO79bmbn3bGWARtF91KYHu3Xyj9F3T82
	DxZloFZgVV8I1Tqe3CfWZXUFfFWmgp8rgNgcPhI5siWVkdpxtDxfiRFcOxDMdxfbT9IO
	Z0jfGs29zdq+IXJItTlY8/9HN/SbV9NTUKgNgKC5cv0FJFKNVYo1fv3ta9fAOCyhM2ah
	447C9EZ38u2c37XGyXjS1jXQtBLZgGePcnwsHb93c8IbahCgq8g1+GXvepzQF2VAtL1h
	eeKRCvtmC9qE38nn/incnUB6Qkm6C+R11zNAt8zw5tmVpPf31Omlx+e+gi9wdt2EzM56
	hwEQ==
X-Received: by 10.180.186.99 with SMTP id fj3mr58852610wic.10.1434572303634;
	Wed, 17 Jun 2015 13:18:23 -0700 (PDT)
Received: from [192.168.0.7] (212-41-67-159.adsl.solnet.ch. [212.41.67.159])
	by mx.google.com with ESMTPSA id m2sm27680132wiy.7.2015.06.17.13.18.22
	(version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128/128);
	Wed, 17 Jun 2015 13:18:22 -0700 (PDT)
Message-ID: <1434572301.2944.16.camel@Saturn.local.all>
From: Max Krummenacher <max.oss.09@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 17 Jun 2015 22:18:21 +0200
In-Reply-To: <55818938.3090405@mlbassoc.com>
References: <CALbNGRSo5g0ndeQTmrKYppX6g6-KTB2CrnDjJCs=d84PxnpQPQ@mail.gmail.com>
	<55818938.3090405@mlbassoc.com>
X-Mailer: Evolution 3.10.4 
Mime-Version: 1.0
Cc: Gary Thomas <gary@mlbassoc.com>
Subject: Re: [meta-browser] firefox not working for me (only)
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
X-List-Received-Date: Wed, 17 Jun 2015 20:18:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

> > * firefox fails with illeagal ARM instruction

That sounds familiar, I thought then that it was specific to our setup
with the binary Tegra X driver and the armv7a without neon setup, that's
why I did not upstream my patches.

> > On Wed, Jun 17, 2015 at 3:32 PM, Gary Thomas <gary@mlbassoc.com> wrote:
> >>> Hmm - I was wondering why nobody took care.
> >>>
> >>> All my plattforms fail:
> >>> * i.MX6 base
> >>> * gumstix
> >>> * raspberry Pi2
> >>>
> >>> I'll put this browser issue on my TODO currently I have no further
> >>> time to take care.
> >>
> >>
> >> BTW, I just tested both chromium and firefox on the i.MX6Q and RPi2
> >> and they worked just fine.  Built from meta-browser:0cc0419a
> >>
> > Thanks for information. Let's focus on firefox's illegal ARM
> > instruction crasher:
> >
> > * Last time I felt the only one facing a specific error it was caused
> > by angstrom enabling thumb(2) for ARM (long story @meta-fsl-arm).
> > Gary: I assume, you don't have thumb enabled - right?
> > * firefox doesn't crash with "--safe-mode"
> 
> I am not using thumb - off the shelf configurations for RaspberryPi2 and
> BoundaryDevices nitrogen6x built with $DISTRO=poky are the ones I've tested.
> 
Actually I use Angstrom with the instruction set defaulting to ARM.

> >
> > Looking into meta-browser I saw that firefox pins ARM_INSTRUCTION_SET
> > = "arm" but firefox-l10n does not. When having some time left over
> > (=never) I will test with thumb disabled for firefox-l10n and
> > chromium.
> >
> > Andreas

Have a look at
http://git.toradex.com/cgit/meta-toradex.git/tree/recipes-mozilla/firefox?h=V2.4-next

alignment.patch,
Prevent-SIGILL-crashes-on-ARMv6-builds-built-with-the-NDK_10.0esr.patch .

If usefull I could send a patch for meta-browser.

Regards,
Max


