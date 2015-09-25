Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id 3C2C7757AC
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Sep 2015 04:39:21 +0000 (UTC)
Received: by iofh134 with SMTP id h134so99319007iof.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Sep 2015 21:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=iz7+mFjcm4BsM1h88BCEBZl4OAFX3ZzMaKhYcg8cCNQ=;
	b=whgFePGxihrUa5A3xtaNCFBEPPvg7d8bunvBF/+zFh53iLFdKzLZGub53FlWiFlCgY
	zPtUUTg+tjM4Hqixn8ai9mr8+CoJn4xvklzr0x05NbbFjmpsNKXWOXQtoNXm92tw4B9U
	W+WWeHfUzIbQz3bHTwDpqqdRo5j0s87gS2TFGFlIZzOdUiC1s2sUskko5hqW8hxhex3R
	wn9g7eN8Tcb5yAGXXD+FmF4SVoO42/XgQNBM5JaeXUGXRJAnn27yjt4F+DD82n0q6eFG
	54TuUlCcxmrH3/RcZcuYGcf1pyPs3Wqic3ek3nEyafRk6KUXh9sLu98tAeQWq54msNYa
	/sDw==
X-Received: by 10.107.4.131 with SMTP id 125mr4015274ioe.49.1443155961556;
	Thu, 24 Sep 2015 21:39:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.142.130 with HTTP; Thu, 24 Sep 2015 21:38:52 -0700 (PDT)
In-Reply-To: <CAAQYJAuUpnCC8zapvzs7DM5t+v6xNDjz0TrKgJ5rSZWRsxsbHw@mail.gmail.com>
References: <1443047368-11176-1-git-send-email-andrea.adami@gmail.com>
	<CAMKF1srf0TeAhf_f0uNLOvr_Cyet9b5em-iiYrXygWPg+w6z4g@mail.gmail.com>
	<CAAQYJAuUpnCC8zapvzs7DM5t+v6xNDjz0TrKgJ5rSZWRsxsbHw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 24 Sep 2015 21:38:52 -0700
Message-ID: <CAMKF1srQw2z-bbeVbs8UY4K_zVuZaQPPPvBwJON8Z-BPkFN2yQ@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-initramfs][PATCH] kexecboot_0.6: fix build with gcc 5
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
X-List-Received-Date: Fri, 25 Sep 2015 04:39:22 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Sep 24, 2015 at 2:11 PM, Andrea Adami <andrea.adami@gmail.com> wrote:
> On Thu, Sep 24, 2015 at 6:55 AM, Khem Raj <raj.khem@gmail.com> wrote:
>
>> On Wed, Sep 23, 2015 at 3:29 PM, Andrea Adami <andrea.adami@gmail.com>
>> wrote:
>> > +-inline void
>> > ++extern inline void
>>
>> would it be better to make it static inline ?
>>
>
> Apparently not...

well I meant to move the defintion of this function to header and not
just modify the declaration.

>
> rgba2comp is used in rgb.c and fb.c.
> Making it static inline leads to the following error:
>
> | In file included from
> /tmp/build/tmp-glibc/work/poodle-oe-linux-gnueabi/kexecboot/0.6-r0/kexecboot-0.6/fb.h:39:0,
> |                  from
> /tmp/build/tmp-glibc/work/poodle-oe-linux-gnueabi/kexecboot/0.6-r0/kexecboot-0.6/gui.h:25,
> |                  from
> /tmp/build/tmp-glibc/work/poodle-oe-linux-gnueabi/kexecboot/0.6-r0/kexecboot-0.6/kexecboot.c:43:
> |
> /tmp/build/tmp-glibc/work/poodle-oe-linux-gnueabi/kexecboot/0.6-r0/kexecboot-0.6/rgb.h:55:1:
> warning: 'rgba2comp' declared 'static' but never defined [-Wunused-function]
> |  rgba2comp(kx_rgba rgba, kx_ccomp *red, kx_ccomp *green,
> |  ^
> | arm-oe-linux-gnueabi-gcc  -march=armv5e -marm  -mthumb-interwork
> --sysroot=/tmp/build/tmp-glibc/sysroots/poodle -Wall -O2 -pipe -g
> -feliminate-unused-debug-types  -Wl,-O1 -Wl,--hash-style=gnu
> -Wl,--as-needed -o kexecboot util.o cfgparser.o devicescan.o evdevs.o fb.o
> gui.o menu.o xpm.o rgb.o tui.o kexecboot.o fstype/fstype.o machine/zaurus.o
> | fb.o: In function `compose_color':
> |
> /tmp/build/tmp-glibc/work/poodle-oe-linux-gnueabi/kexecboot/0.6-r0/kexecboot-0.6/fb.c:34:
> undefined reference to `rgba2comp'
> | collect2: error: ld returned 1 exit status
>
> BTW, I didn't test that patch compiling with gcc 4 yet. It is just meant as
> a fix for gcc 5 w/out  touching much code.
> Thanks for your review, suggestions are appreciated!
>
> Cheers
> Andrea
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

