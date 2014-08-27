Return-Path: <andrea.adami@gmail.com>
Received: from mail-lb0-f176.google.com (mail-lb0-f176.google.com
	[209.85.217.176])
	by mail.openembedded.org (Postfix) with ESMTP id F00DD70EE6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Aug 2014 08:39:14 +0000 (UTC)
Received: by mail-lb0-f176.google.com with SMTP id c11so2739681lbj.35
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Aug 2014 01:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=oZA1JvxIMqGWn/63mwwYxCQ/uI6iDImrY7yHD00iY1A=;
	b=x4jHpBuDfie1koELMcxzAk2f0N1AxsA55UhsVvInFhfWl54HdEgV4+Tb0A4nUhsT0r
	xQZoTauICo2afkYb9371LiyS025pW0fGmIEDsbADXZ8XjzwvAQIMgtqEMiA/nhELzVxg
	7VEvY8UkZR87iEBcR3+ba7NgjaQBpKftFOMVQEEwjzGCXXCsNQHNte0yctwAUh16GxCA
	WlBCqsGgwSw72ccr3SuclPvMNJxSH4atnqiL+EvNFJInmpTQtg1sOkz1/t3qwHstxCY1
	chLXhEnYfdl4QD6DqqJYf9Q5s4Pf3YdUNeUA1xIFPnSNqqUS25hpXJ1pJwPpk2v3KyWw
	UZUA==
MIME-Version: 1.0
X-Received: by 10.152.6.193 with SMTP id d1mr621705laa.69.1409128755061; Wed,
	27 Aug 2014 01:39:15 -0700 (PDT)
Received: by 10.112.88.130 with HTTP; Wed, 27 Aug 2014 01:39:15 -0700 (PDT)
In-Reply-To: <20140826164149.GC18989@haswell>
References: <CAAQYJAsPwYZSmpxbKJAX5wHexHK-EOEjsjrxLT_PT-MV6Y338w@mail.gmail.com>
	<CAAQYJAuuvOz4mXJ7V3pbaSBpfABTc_gjuGTgW4BxQ0n2DtPZGA@mail.gmail.com>
	<20140826164149.GC18989@haswell>
Date: Wed, 27 Aug 2014 10:39:15 +0200
Message-ID: <CAAQYJAsFYzohZV4NfcJbQeznOSGnhLcvbRbcAtXbdBi4KmB6zA@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: klibc: armv4 bx strikes again
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
X-List-Received-Date: Wed, 27 Aug 2014 08:39:15 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Aug 26, 2014 at 6:41 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On 14-08-26 11:36:34, Andrea Adami wrote:
>> On Mon, Aug 25, 2014 at 10:08 AM, Andrea Adami <andrea.adami@gmail.com> wrote:
>> > I've recently discovered that the static klibc binaries produced for
>> > armv4 contain Illegal instructions.
>> >
>> > Eglibc armv4 binaries are ok.
>> >
>> > I verified it happens to kexec-tools-klibc and kexecboot-klibc:
>> >
>> > andrea@mizar:/oe/oe-core/build/tmp-eglibc/sysroots/x86_64-linux/usr/bin/arm-oe-linux-gnueabi$
>> > ./arm-oe-linux-gnueabi-objdump -S ./kexecboot-armv4 | grep bx
>> >    110dc:       012fff1e        bxeq    lr
>> >    11154:       e12fff1e        bx      lr
>> >    11160:       e12fff1e        bx      lr
>> >    11170:       e12fff1e        bx      lr
>> >    1119c:       e12fff1e        bx      lr
>> >    11234:       e12fff1e        bx      lr
>> >    11240:       e12fff1e        bx      lr
>> >    11250:       e12fff1e        bx      lr
>> >    11268:       e12fff1e        bx      lr
>> >    11298:       e12fff1e        bx      lr
>> >    112b4:       e12fff1e        bx      lr
>> >    112f0:       e12fff1e        bx      lr
>> >    115f4:       e12fff1e        bx      lr
>> > andrea@mizar:/oe/oe-core/build/tmp-eglibc/sysroots/x86_64-linux/usr/bin/arm-oe-linux-gnueabi$
>> >
>> > The binaries end-up compiled with following flags:
>> >
>> > arm-oe-linux-gnueabi-klcc -march=armv4 -mthumb-interwork -Wall    -o
>> > kexecboot util.o cfgparser.o devicescan.o evdevs.o fb.o gui.o menu.o
>> > xpm.o rgb.o tui.o kexecboot.o fstype/fstype.o machine/zaurus.o
>
> what is content of arm-oe-linux-gnueabi-klcc ? is it also used at link
> step ? the option
>
>> >
>> > This is rather unexpected because klibc carries one specific patch to fix that:
>> >
>> > http://cgit.openembedded.org/meta-openembedded/tree/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/armv4-fix-v4bx.patch
>> >
>> > and in fact looking at the produced klibc.config I see indeed LDFLAGS=
>> > --fix-v4bx and that goes in  *arm-oe-linux-gnueabi-klcc.
>> >
>> > There have been big toolchain changes recently so I suspect something
>> > got broken in oe-core.
>> > Then there is a patch touching armv4/thumb but it doesn't look
>> > suspicious at first:
>> >
>> > http://cgit.openembedded.org/openembedded-core/commit/meta/conf/machine/include?id=1250d3e009363d20f15bbfaced622c5912a7fb93
>> >
>
> for tests
> can you use FIX_V4BX_ARMV4 in
> meta-initramfs/recipes-devtools/klibc/klibc.inc
> and see if it helps
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


Hi,

I've added more output for klcc in klibc.bbclass

-export CC_armv4_linux-gnueabi = "${TARGET_PREFIX}klcc -march=armv4
-mthumb-interwork"
+export CC_armv4_linux-gnueabi = "${TARGET_PREFIX}klcc -v -march=armv4
-mthumb-interwork"

The resulting log is  http://pastebin.com/rXQ0Vy1P

I'm very surprised to see that  --with-gxx-include-dir, --with-sysroot
and  --with-build-sysroot  are absolutely wrong, peeking at another
machine sysroot.
It mixes armv4 and armv5...how can that happen?

I'll retry a build from scratch for the single armv4 arch asap.

Cheers

Andrea

