Return-Path: <andrea.adami@gmail.com>
Received: from mail-lb0-f176.google.com (mail-lb0-f176.google.com
	[209.85.217.176])
	by mail.openembedded.org (Postfix) with ESMTP id AFB09617B8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Aug 2014 09:36:34 +0000 (UTC)
Received: by mail-lb0-f176.google.com with SMTP id c11so1026457lbj.7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Aug 2014 02:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=HUX8hfRtg7zuUxel5Vqs1HBq5eAh46jLSByF+kd58ig=;
	b=DYojiCvuM6tR5mYZeSITH1RRR9bFkkdUhmITQ88w1fuBBGR0RV3DRU91DdDkxReYwN
	SJpdUEVN2AqCY/0oShgQFs8eTE65TP9zVrnmF+FyADvot5+bWIhQAErfPYDwSL0SNDYE
	Bw4wyzhijyoFSlmGTfM7FMwFL5UpZrEkP+cukaQv7ew7xszYQSchf9RiMCXEs/i4KebF
	/Bbwb5Yk1pAnvb9bGQpVlSdPretXqVEftjhpUr1AEa1ronjh0AevQ9wH8Mcrq1Tk9+aF
	gWR0jadOzmasdfVMMxr0dEwP81xxBFRDqJK8jJuvrQGEBWaNlaSZoMBhtdhM6jLCYLGB
	5uPg==
MIME-Version: 1.0
X-Received: by 10.152.28.67 with SMTP id z3mr27283312lag.12.1409045794220;
	Tue, 26 Aug 2014 02:36:34 -0700 (PDT)
Received: by 10.112.88.130 with HTTP; Tue, 26 Aug 2014 02:36:34 -0700 (PDT)
In-Reply-To: <CAAQYJAsPwYZSmpxbKJAX5wHexHK-EOEjsjrxLT_PT-MV6Y338w@mail.gmail.com>
References: <CAAQYJAsPwYZSmpxbKJAX5wHexHK-EOEjsjrxLT_PT-MV6Y338w@mail.gmail.com>
Date: Tue, 26 Aug 2014 11:36:34 +0200
Message-ID: <CAAQYJAuuvOz4mXJ7V3pbaSBpfABTc_gjuGTgW4BxQ0n2DtPZGA@mail.gmail.com>
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
X-List-Received-Date: Tue, 26 Aug 2014 09:36:35 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Aug 25, 2014 at 10:08 AM, Andrea Adami <andrea.adami@gmail.com> wrote:
> I've recently discovered that the static klibc binaries produced for
> armv4 contain Illegal instructions.
>
> Eglibc armv4 binaries are ok.
>
> I verified it happens to kexec-tools-klibc and kexecboot-klibc:
>
> andrea@mizar:/oe/oe-core/build/tmp-eglibc/sysroots/x86_64-linux/usr/bin/arm-oe-linux-gnueabi$
> ./arm-oe-linux-gnueabi-objdump -S ./kexecboot-armv4 | grep bx
>    110dc:       012fff1e        bxeq    lr
>    11154:       e12fff1e        bx      lr
>    11160:       e12fff1e        bx      lr
>    11170:       e12fff1e        bx      lr
>    1119c:       e12fff1e        bx      lr
>    11234:       e12fff1e        bx      lr
>    11240:       e12fff1e        bx      lr
>    11250:       e12fff1e        bx      lr
>    11268:       e12fff1e        bx      lr
>    11298:       e12fff1e        bx      lr
>    112b4:       e12fff1e        bx      lr
>    112f0:       e12fff1e        bx      lr
>    115f4:       e12fff1e        bx      lr
> andrea@mizar:/oe/oe-core/build/tmp-eglibc/sysroots/x86_64-linux/usr/bin/arm-oe-linux-gnueabi$
>
> The binaries end-up compiled with following flags:
>
> arm-oe-linux-gnueabi-klcc -march=armv4 -mthumb-interwork -Wall    -o
> kexecboot util.o cfgparser.o devicescan.o evdevs.o fb.o gui.o menu.o
> xpm.o rgb.o tui.o kexecboot.o fstype/fstype.o machine/zaurus.o
>
> This is rather unexpected because klibc carries one specific patch to fix that:
>
> http://cgit.openembedded.org/meta-openembedded/tree/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/armv4-fix-v4bx.patch
>
> and in fact looking at the produced klibc.config I see indeed LDFLAGS=
> --fix-v4bx and that goes in  *arm-oe-linux-gnueabi-klcc.
>
> There have been big toolchain changes recently so I suspect something
> got broken in oe-core.
> Then there is a patch touching armv4/thumb but it doesn't look
> suspicious at first:
>
> http://cgit.openembedded.org/openembedded-core/commit/meta/conf/machine/include?id=1250d3e009363d20f15bbfaced622c5912a7fb93
>

I guess that the problem is in the above commit...in klibc.bbclass we set:

export CC_armv4_linux-gnueabi = "${TARGET_PREFIX}klcc -march=armv4
-mthumb-interwork"

because we need interworking but no thumb code.

I'll try to further debug that.

Cheers

Andrea



> As for klibc sources, I see only minor changes in the last versions so
> I would say version is irrelevant.
>
> Any hint?
>
> Thanks in advance
>
> Andrea

