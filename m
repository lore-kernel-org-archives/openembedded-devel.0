Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id 54E6F76F56
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  4 Oct 2015 22:59:28 +0000 (UTC)
Received: by ioii196 with SMTP id i196so168163047ioi.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 04 Oct 2015 15:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=BLZwycg+QqeHCk7wrG40w88pV98ZTji7sFkZiRqT8zE=;
	b=kEJnLRBcrkz/Cf4tR0jFEs4DKt3BP1WC7KA903yQJipqpsHJviEOGhlpohD1Zf/CBf
	ZJ7/jelqn1dywoa3RmZlQIQzNu9Pe59U0acV4CK7lAAz3wvG7AU3Ir41/tWV5QRwvY1c
	56wLnMQ3ZhjeOg6whnh6Y8KwxMeyCqxxBLnAS/qmD98rBT6yvq8FUnhn/rJKYdREFgHc
	DPrvZ4zQSx1mkVK9Hp3x6GLLTl8qJBEYUIh2409rYFyEm1u5ya1bUEQHsW2eO0bo8Ts2
	RWuR6DVACN6BUVQfgL1kVBfZY21PAgaXSwefe0ki1ic3Z0mgZMklpU17majGsNs1uhaF
	z76Q==
X-Received: by 10.107.3.14 with SMTP id 14mr96258iod.49.1443999568267; Sun, 04
	Oct 2015 15:59:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.142.130 with HTTP; Sun, 4 Oct 2015 15:58:58 -0700 (PDT)
In-Reply-To: <CAAQYJAvhhFfPjZWC2vLW=qewJO=AW-fTBJfJDD0sHf7hoytqwg@mail.gmail.com>
References: <1443047368-11176-1-git-send-email-andrea.adami@gmail.com>
	<CAMKF1srf0TeAhf_f0uNLOvr_Cyet9b5em-iiYrXygWPg+w6z4g@mail.gmail.com>
	<CAAQYJAuUpnCC8zapvzs7DM5t+v6xNDjz0TrKgJ5rSZWRsxsbHw@mail.gmail.com>
	<CAMKF1srQw2z-bbeVbs8UY4K_zVuZaQPPPvBwJON8Z-BPkFN2yQ@mail.gmail.com>
	<CAAQYJAvhhFfPjZWC2vLW=qewJO=AW-fTBJfJDD0sHf7hoytqwg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 4 Oct 2015 15:58:58 -0700
Message-ID: <CAMKF1so=My95YCJqEUhMpAjZADfbjgRCKjF=cK=LxxbxHk1XWw@mail.gmail.com>
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
X-List-Received-Date: Sun, 04 Oct 2015 22:59:31 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Oct 4, 2015 at 3:49 PM, Andrea Adami <andrea.adami@gmail.com> wrote:
> On Fri, Sep 25, 2015 at 6:38 AM, Khem Raj <raj.khem@gmail.com> wrote:
>
>> On Thu, Sep 24, 2015 at 2:11 PM, Andrea Adami <andrea.adami@gmail.com>
>> wrote:
>> > On Thu, Sep 24, 2015 at 6:55 AM, Khem Raj <raj.khem@gmail.com> wrote:
>> >
>> >> On Wed, Sep 23, 2015 at 3:29 PM, Andrea Adami <andrea.adami@gmail.com>
>> >> wrote:
>> >> > +-inline void
>> >> > ++extern inline void
>> >>
>> >> would it be better to make it static inline ?
>> >>
>> >
>> > Apparently not...
>>
>> well I meant to move the defintion of this function to header and not
>> just modify the declaration.
>>
>>
> Khem,
>
> what do you think if I simply modify the declaration from inline void to
> void? There is a single definition and it uses inline.
>
> Declaration in rgb.h
> + /* Convert RGBA uint32 to red/green/blue/alpha components */
> +-inline void
> ++void
> + rgba2comp(kx_rgba rgba, kx_ccomp *red, kx_ccomp *green,
> +               kx_ccomp *blue, kx_ccomp *alpha);
>
> Definition in rgb.c is
> ....
> #include "rgb.h"
> #include "rgbtab.h"
>
> inline void
> rgba2comp(kx_rgba rgba, kx_ccomp *red, kx_ccomp *green,
> kx_ccomp *blue, kx_ccomp *alpha)
> {
>         *alpha = (kx_ccomp) (rgba & 0x000000FF);
>         *blue =  (kx_ccomp)((rgba & 0x0000FF00) >> 8);
>         *green = (kx_ccomp)((rgba & 0x00FF0000) >> 16);
>         *red =   (kx_ccomp)((rgba & 0xFF000000) >> 24);
> }
>
> It compiles and if I understand correctly the function will be callable
> from other files. Do you see any drawbacks? This would be a minimal change
> for upstream.
>
> About 'static inline' I think I get what you mean but please note the
> function is only used in one source file so I guess I could just define it
> 'static inline' there (or in a header if it would be used more than once ).
> Do you suggest to modify all the occurrences in the sources?
>

remove the declaration from header if its only used in one source
file. and make the one in source file as static inline
is the function definition in same file as its use ?

> Thanks in advance
> Andrea
>
>
>
>> >
>> > rgba2comp is used in rgb.c and fb.c.
>> > Making it static inline leads to the following error:
>> >
>> > | In file included from
>> >
>> /tmp/build/tmp-glibc/work/poodle-oe-linux-gnueabi/kexecboot/0.6-r0/kexecboot-0.6/fb.h:39:0,
>> > |                  from
>> >
>> /tmp/build/tmp-glibc/work/poodle-oe-linux-gnueabi/kexecboot/0.6-r0/kexecboot-0.6/gui.h:25,
>> > |                  from
>> >
>> /tmp/build/tmp-glibc/work/poodle-oe-linux-gnueabi/kexecboot/0.6-r0/kexecboot-0.6/kexecboot.c:43:
>> > |
>> >
>> /tmp/build/tmp-glibc/work/poodle-oe-linux-gnueabi/kexecboot/0.6-r0/kexecboot-0.6/rgb.h:55:1:
>> > warning: 'rgba2comp' declared 'static' but never defined
>> [-Wunused-function]
>> > |  rgba2comp(kx_rgba rgba, kx_ccomp *red, kx_ccomp *green,
>> > |  ^
>> > | arm-oe-linux-gnueabi-gcc  -march=armv5e -marm  -mthumb-interwork
>> > --sysroot=/tmp/build/tmp-glibc/sysroots/poodle -Wall -O2 -pipe -g
>> > -feliminate-unused-debug-types  -Wl,-O1 -Wl,--hash-style=gnu
>> > -Wl,--as-needed -o kexecboot util.o cfgparser.o devicescan.o evdevs.o
>> fb.o
>> > gui.o menu.o xpm.o rgb.o tui.o kexecboot.o fstype/fstype.o
>> machine/zaurus.o
>> > | fb.o: In function `compose_color':
>> > |
>> >
>> /tmp/build/tmp-glibc/work/poodle-oe-linux-gnueabi/kexecboot/0.6-r0/kexecboot-0.6/fb.c:34:
>> > undefined reference to `rgba2comp'
>> > | collect2: error: ld returned 1 exit status
>> >
>> > BTW, I didn't test that patch compiling with gcc 4 yet. It is just meant
>> as
>> > a fix for gcc 5 w/out  touching much code.
>> > Thanks for your review, suggestions are appreciated!
>> >
>> > Cheers
>> > Andrea
>> > --
>> > _______________________________________________
>> > Openembedded-devel mailing list
>> > Openembedded-devel@lists.openembedded.org
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

