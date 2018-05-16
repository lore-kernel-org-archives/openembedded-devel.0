Return-Path: <twoerner@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 2E3116E650
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 May 2018 17:32:52 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id a8-v6so3327123wmg.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 May 2018 10:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=wpmeUys5ZomVqE+7d13i9DhMRdJIn/+dRrn/Ama8gGI=;
	b=pNsSNhRE1mXK6QubJSYeqIAP3Ry3QewV/vti3UDy1ycKhuJzU7z6g3EvfgeJtb8erp
	Tu371K0G6xcDsXe30dw8aZOAs/eqNYt95o4NIr94FJnQTGAGr8/P193IAnV4yIchFRdV
	1heuu1wneoOdu51QFcwGxXBYteohOoZ4TMNe6As9egqfgBg/2A1GZRz7JC0rSGU9kHI2
	kOjFJPVhWKyMTPKd60m9JxShQSk9JyI4dJPjzZ3KpU9GpIdHlR/0wbWgcuB/zkz04d+x
	NN3uPVnRfbo1Q0fOn/woHLrbRXWMJrDxc+hqPllJQgWxw7Nfbv5VTKIUvDC/IEVQ7r07
	y2Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=wpmeUys5ZomVqE+7d13i9DhMRdJIn/+dRrn/Ama8gGI=;
	b=flF28KWDCwJ5J/ykIKalhjPF5d5fLNHoUZ6mygkc+oqnYnUzEsPZQkUnbpxfk4Q8ba
	2dbKGVqedz4IQe1VY6hSI+WbCTARK10V7zQx+q8TihshQ7jwj2CaNGIX6FAdQLSsgv6z
	V+/x9xE3/+B1mW2bv8urPsm/i2bivoZUZtwdYSEwmfmnW+/lH76UPEyEovWZhx9vbfSa
	xxITkVIA3yBa2+777d+aybReVLZUKmc75Mc3fNKM43zN+/atzTawMMHrOd8pY8r10gpn
	6Aj4tADHwuuHoVXmqufa4WCH/STvDPK3qu8uJJw9GJu+5B03wNygq39TF0MnT/PQy7K1
	g0+A==
X-Gm-Message-State: ALKqPwcEVMvbjAvCx9GPNqDjzo93+ad4aj2ktHt9EDj0/lxIOdp/pCyo
	LYBRZuCj/8hyeCcByXSoQJUT6o7pMH2cDboMW64=
X-Google-Smtp-Source: AB8JxZowYb+qNoUK15Yrn6CrDJ0RQ2r2jRr1LSOrxy/6b4PQ1/Gzz4QIzm0XvM2mdnnYEd0AYXxvNhRi0yIAtsFpMAw=
X-Received: by 2002:a2e:594e:: with SMTP id
	n75-v6mr1097902ljb.139.1526491973753; 
	Wed, 16 May 2018 10:32:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a19:17a1:0:0:0:0:0 with HTTP; Wed, 16 May 2018 10:32:53
	-0700 (PDT)
In-Reply-To: <CAMKF1sqAWHSmiphAcc6GvgmJaOybVVVSOB0HG_9GrU=gGmSVkw@mail.gmail.com>
References: <20180516170632.15614-1-twoerner@gmail.com>
	<CAMKF1sqAWHSmiphAcc6GvgmJaOybVVVSOB0HG_9GrU=gGmSVkw@mail.gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
Date: Wed, 16 May 2018 13:32:53 -0400
Message-ID: <CAHUNapSxvc4LhyfuR-VNeAaApxv0ujRddwavFCdpH59LLb+0qA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-multimedia][PATCH v2 1/2] openh264: fix build for 32-bit intel arch
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
X-List-Received-Date: Wed, 16 May 2018 17:32:53 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, May 16, 2018 at 1:10 PM, Khem Raj <raj.khem@gmail.com> wrote:

> On Wed, May 16, 2018 at 10:06 AM, Trevor Woerner <twoerner@gmail.com>
> wrote:
> > Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> > ---
> >  .../recipes-multimedia/openh264/openh264_1.7.0.bb        | 9 ++++-----
> >  1 file changed, 4 insertions(+), 5 deletions(-)
> >
> > diff --git a/meta-multimedia/recipes-multimedia/openh264/openh264_
> 1.7.0.bb b/meta-multimedia/recipes-multimedia/openh264/openh264_1.7.0.bb
> > index a7aaab3623..d77de2876b 100644
> > --- a/meta-multimedia/recipes-multimedia/openh264/openh264_1.7.0.bb
> > +++ b/meta-multimedia/recipes-multimedia/openh264/openh264_1.7.0.bb
> > @@ -3,9 +3,8 @@ decoding. It is suitable for use in real time
> applications such as WebRTC."
> >  HOMEPAGE = "http://www.openh264.org/"
> >  SECTION = "libs/multimedia"
> >
> > -DEPENDS = "${@oe.utils.conditional('TARGET_ARCH', 'i386',
> 'nasm-native', \
> > -              oe.utils.conditional('TARGET_ARCH', 'x86_64',
> 'nasm-native', \
> > -             '', d), d)}"
> > +DEPENDS_x86 += "nasm-native"
> > +DEPENDS_x86-64 += "nasm-native"
> >
>
> if using overrides, perhaps using _append instead of += is better.
>
>
ok


> >  LICENSE = "BSD-2-Clause"
> >  LICENSE_FLAGS = "commercial"
> > @@ -17,14 +16,14 @@ SRC_URI[sha256sum] = "9c07c38d7de00046c9c52b12c76a2a
> f7648b70d05bd5460c8b67f68957
> >
> >  COMPATIBLE_MACHINE_armv7a = "(.*)"
> >  COMPATIBLE_MACHINE_aarch64 = "(.*)"
> > -COMPATIBLE_MACHINE_i386 = "(.*)"
> > +COMPATIBLE_MACHINE_x86 = "(.*)"
> >  COMPATIBLE_MACHINE_x86-64 = "(.*)"
> >  COMPATIBLE_MACHINE_mips = "(.*)"
> >  COMPATIBLE_MACHINE_mips64 = "(.*)"
> >
> >  EXTRA_OEMAKE_armv7a = "ARCH=arm"
> >  EXTRA_OEMAKE_aarch64 = "ARCH=arm64"
> > -EXTRA_OEMAKE_i386 = "ARCH=i386"
> > +EXTRA_OEMAKE_x86 = "ARCH=i386"
>
> can you take another look if there are other options eg. i686 ?
> if in literal sense it means i386 then we should not be using it
> for newer i*86 arches.
>

i'll take a look

