Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id 33BB66E5DC
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  2 Nov 2014 13:41:20 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 5840BF81199; Sun,  2 Nov 2014 06:41:19 -0700 (MST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id B1E41F81188;
	Sun,  2 Nov 2014 06:41:17 -0700 (MST)
Message-ID: <54563488.7050607@mlbassoc.com>
Date: Sun, 02 Nov 2014 06:41:28 -0700
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <5454132F.9080305@mlbassoc.com> <5454552E.3060806@pabigot.com>
In-Reply-To: <5454552E.3060806@pabigot.com>
Subject: Re: [meta-browser] Problem building chromium
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
X-List-Received-Date: Sun, 02 Nov 2014 13:41:24 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2014-10-31 21:36, Peter A. Bigot wrote:
> On 10/31/2014 05:54 PM, Gary Thomas wrote:
>> I just tried to build chromium on the Raspberry-Pi.  All repos
>> are up to date as of 2014-10-31.  Here's the error I got:
>>
>> | lib/libcontent.so: undefined reference to `WebRtc_GetCPUFeaturesARM'
>> | collect2: error: ld returned 1 exit status
>> | ninja: build stopped: subcommand failed.
>> | WARNING: /home/local/rpi-latest_2014-10-30/tmp/work/armv6-vfp-amltd-linux-gnueabi/chromium/38.0.2125.101-r0/temp/run.do_compile.10091:1 exit 1 from
>> |   ninja -C /home/local/rpi-latest_2014-10-30/tmp/work/armv6-vfp-amltd-linux-gnueabi/chromium/38.0.2125.101-r0/chromium-38.0.2125.101/out/Release chrome chrome_sandbox
>> | ERROR: Function failed: do_compile (log file is located at
>> /home/local/rpi-latest_2014-10-30/tmp/work/armv6-vfp-amltd-linux-gnueabi/chromium/38.0.2125.101-r0/temp/log.do_compile.10091)
>> ERROR: Task 592 (/home/local/poky-latest/meta-browser/recipes-browser/chromium/chromium_38.0.2125.101.bb, do_compile) failed with exit code '1'
>>
>> Note: I was able to build this same recipe just fine for my
>> i.MX6 platforms, so it must be something to do with armv6 vs
>> armv7a/cortex.  I've not found it yet but thought someone might
>> have ideas.
>>
>> Thanks
>>
>
> As noted at http://lists.openembedded.org/pipermail/openembedded-core/2014-August/096568.html and related messages, raspi configures (or at that time configured) gcc to build for
> armv6 but it's actually armv6zk.  It's entirely possible chromium doesn't support armv6 without armv6k features being enabled. My best guess is meta-raspberrypi needs to be fixed,
> which might require some enhancements in oe-core's gcc.

While what you say may be true or even relevant, chromium
used to build and run fine for the RaspberryPi.  That said,
I don't see how an instruction set choice/mixup explains
a missing symbol.

Following up, I stubbed out this missing symbol.  Now I can
get it to link, but it gets an illegal instruction immediately :-(
I tried debugging using GDB, but for some reason the library that
it fails in has no symbols:

(gdb) tar rem 192.168.1.150:9000
Remote debugging using 192.168.1.150:9000
Reading symbols from tmp/work/raspberrypi-amltd-linux-gnueabi/amltd-x11-image/1.0-r0/rootfs/lib/ld-linux.so.3...Reading symbols from 
tmp/work/raspberrypi-amltd-linux-gnueabi/amltd-x11-image/1.0-r0/rootfs/lib/.debug/ld-2.20.so...done.
done.
Loaded symbols for tmp/work/raspberrypi-amltd-linux-gnueabi/amltd-x11-image/1.0-r0/rootfs/lib/ld-linux.so.3
0xb6fd8d10 in _start () from tmp/work/raspberrypi-amltd-linux-gnueabi/amltd-x11-image/1.0-r0/rootfs/lib/ld-linux.so.3
(gdb) c
Continuing.

Program received signal SIGILL, Illegal instruction.
0xb61f60ba in ?? ()
    from tmp/work/raspberrypi-amltd-linux-gnueabi/amltd-x11-image/1.0-r0/rootfs/usr/lib/chrome/libbase.so
(gdb) x/10i 0xb61f60a8
    0xb61f60a8:  bkpt    0x006c
    0xb61f60aa:  movs    r6, r0
    0xb61f60ac:  ldr     r3, [pc, #12]   ; (0xb61f60bc)
    0xb61f60ae:  ldr     r2, [pc, #16]   ; (0xb61f60c0)
    0xb61f60b0:  add     r3, pc
    0xb61f60b2:  movs    r1, #0
    0xb61f60b4:  ldr     r0, [r3, r2]
    0xb61f60b6:  b.w     0xb61f24d4
=> 0xb61f60ba:  nop
    0xb61f60bc:  b.n     0xb61f61d8
(gdb) x/x 0xb61f60ba
0xb61f60ba:     0xe08cbf00

Anyone have any ideas what might be illegal here (and how to
figure out where this code is in the source tree)?

This platform seems a bit shaky when using Poky/Yocto :-(
I tried other web browsers without much joy - firefox seems
to work OK but midori also dies quickly in its javascript
engine...

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

