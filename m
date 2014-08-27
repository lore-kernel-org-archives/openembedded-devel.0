Return-Path: <andrea.adami@gmail.com>
Received: from mail-la0-f53.google.com (mail-la0-f53.google.com
	[209.85.215.53])
	by mail.openembedded.org (Postfix) with ESMTP id 8C82A60E49
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Aug 2014 20:53:13 +0000 (UTC)
Received: by mail-la0-f53.google.com with SMTP id s18so57633lam.26
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Aug 2014 13:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=ydCrdJPpcLP6rvqjKp0dIARZOaeODfDosh+Z+RCQGjk=;
	b=JD30tJB9Jm1ZkkqeCOJXntkWjOsfa13LC1+hokzE+IMFwP82OfCbA/xnWI+FnlEYvP
	w3fsx8nFHAyJOAtwAuvnlPzJVC9NOQx2lO2IPdsupzvsQDazVJ2i6uSE5bDuUsX1jf75
	he9hZWHAMbN9s56snXMIumiVt6Dli2KDf6nxjKzNE+3mubtEXEaLfz6xSPDj8kAy7wbT
	Uzhk0J+YJE48Z11aoA0EvXisqIqltGvrFz5MNMX3CIUFC2wzj3225Yh0xMEoLkPk9Aix
	nKBCJZABnBRFfUk/TzlCOPUa1jtbjBDWJV/Ykbie30Yl9RHQJaPrTDQhC6+jkz+R+Kjs
	gDrw==
MIME-Version: 1.0
X-Received: by 10.112.225.7 with SMTP id rg7mr34590916lbc.52.1409172794322;
	Wed, 27 Aug 2014 13:53:14 -0700 (PDT)
Received: by 10.112.88.130 with HTTP; Wed, 27 Aug 2014 13:53:14 -0700 (PDT)
In-Reply-To: <CAAQYJAsFYzohZV4NfcJbQeznOSGnhLcvbRbcAtXbdBi4KmB6zA@mail.gmail.com>
References: <CAAQYJAsPwYZSmpxbKJAX5wHexHK-EOEjsjrxLT_PT-MV6Y338w@mail.gmail.com>
	<CAAQYJAuuvOz4mXJ7V3pbaSBpfABTc_gjuGTgW4BxQ0n2DtPZGA@mail.gmail.com>
	<20140826164149.GC18989@haswell>
	<CAAQYJAsFYzohZV4NfcJbQeznOSGnhLcvbRbcAtXbdBi4KmB6zA@mail.gmail.com>
Date: Wed, 27 Aug 2014 22:53:14 +0200
Message-ID: <CAAQYJAvGgPVpA82j_4tq6yFUWEGcH6sB_R40XHWd3fPznpsSdA@mail.gmail.com>
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
X-List-Received-Date: Wed, 27 Aug 2014 20:53:22 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Aug 27, 2014 at 10:39 AM, Andrea Adami <andrea.adami@gmail.com> wrote:
> On Tue, Aug 26, 2014 at 6:41 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> On 14-08-26 11:36:34, Andrea Adami wrote:
>>> On Mon, Aug 25, 2014 at 10:08 AM, Andrea Adami <andrea.adami@gmail.com> wrote:
>>> > I've recently discovered that the static klibc binaries produced for
>>> > armv4 contain Illegal instructions.
>>> >
>>> > Eglibc armv4 binaries are ok.
>>> >
>>> > I verified it happens to kexec-tools-klibc and kexecboot-klibc:
>>> >
>>> > andrea@mizar:/oe/oe-core/build/tmp-eglibc/sysroots/x86_64-linux/usr/bin/arm-oe-linux-gnueabi$
>>> > ./arm-oe-linux-gnueabi-objdump -S ./kexecboot-armv4 | grep bx
>>> >    110dc:       012fff1e        bxeq    lr
>>> >    11154:       e12fff1e        bx      lr
>>> >    11160:       e12fff1e        bx      lr
>>> >    11170:       e12fff1e        bx      lr
>>> >    1119c:       e12fff1e        bx      lr
>>> >    11234:       e12fff1e        bx      lr
>>> >    11240:       e12fff1e        bx      lr
>>> >    11250:       e12fff1e        bx      lr
>>> >    11268:       e12fff1e        bx      lr
>>> >    11298:       e12fff1e        bx      lr
>>> >    112b4:       e12fff1e        bx      lr
>>> >    112f0:       e12fff1e        bx      lr
>>> >    115f4:       e12fff1e        bx      lr
>>> > andrea@mizar:/oe/oe-core/build/tmp-eglibc/sysroots/x86_64-linux/usr/bin/arm-oe-linux-gnueabi$
>>> >
>>> > The binaries end-up compiled with following flags:
>>> >
>>> > arm-oe-linux-gnueabi-klcc -march=armv4 -mthumb-interwork -Wall    -o
>>> > kexecboot util.o cfgparser.o devicescan.o evdevs.o fb.o gui.o menu.o
>>> > xpm.o rgb.o tui.o kexecboot.o fstype/fstype.o machine/zaurus.o
>>
>> what is content of arm-oe-linux-gnueabi-klcc ? is it also used at link
>> step ? the option
>>
>>> >
>>> > This is rather unexpected because klibc carries one specific patch to fix that:
>>> >
>>> > http://cgit.openembedded.org/meta-openembedded/tree/meta-initramfs/recipes-devtools/klibc/klibc-2.0.4/armv4-fix-v4bx.patch
>>> >
>>> > and in fact looking at the produced klibc.config I see indeed LDFLAGS=
>>> > --fix-v4bx and that goes in  *arm-oe-linux-gnueabi-klcc.
>>> >
>>> > There have been big toolchain changes recently so I suspect something
>>> > got broken in oe-core.
>>> > Then there is a patch touching armv4/thumb but it doesn't look
>>> > suspicious at first:
>>> >
>>> > http://cgit.openembedded.org/openembedded-core/commit/meta/conf/machine/include?id=1250d3e009363d20f15bbfaced622c5912a7fb93
>>> >
>>
>> for tests
>> can you use FIX_V4BX_ARMV4 in
>> meta-initramfs/recipes-devtools/klibc/klibc.inc
>> and see if it helps
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>
> Hi,
>
> I've added more output for klcc in klibc.bbclass
>
> -export CC_armv4_linux-gnueabi = "${TARGET_PREFIX}klcc -march=armv4
> -mthumb-interwork"
> +export CC_armv4_linux-gnueabi = "${TARGET_PREFIX}klcc -v -march=armv4
> -mthumb-interwork"
>
> The resulting log is  http://pastebin.com/rXQ0Vy1P
>
> I'm very surprised to see that  --with-gxx-include-dir, --with-sysroot
> and  --with-build-sysroot  are absolutely wrong, peeking at another
> machine sysroot.
> It mixes armv4 and armv5...how can that happen?
>
> I'll retry a build from scratch for the single armv4 arch asap.
>

Heh, unsurprisingly building from scratch for the armv4 target is flawless.

http://pastebin.com/MxWVPhd8

How klcc gets confused on multimachine builds is still unclear to me...

> Cheers
>
> Andrea

