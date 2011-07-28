Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1QmOlS-0005cY-CE
	for openembedded-devel@lists.openembedded.org;
	Thu, 28 Jul 2011 13:28:37 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 999)
	id 3118916604B6; Thu, 28 Jul 2011 05:22:01 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by mail.chez-thomas.org (Postfix) with ESMTP id 256DE166046B;
	Thu, 28 Jul 2011 05:22:00 -0600 (MDT)
Message-ID: <4E314658.2040900@mlbassoc.com>
Date: Thu, 28 Jul 2011 05:22:00 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc15 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <F7C0AA5DD1508F4789E10B6CC9BB75DB04B7A25E@nzc-ap-xch-02.ap.trimblecorp.net>
In-Reply-To: <F7C0AA5DD1508F4789E10B6CC9BB75DB04B7A25E@nzc-ap-xch-02.ap.trimblecorp.net>
Subject: Re: Kernel boot problems
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
X-List-Received-Date: Thu, 28 Jul 2011 11:28:37 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2011-07-27 20:20, Bernard Mentink wrote:
>
> Hi Guys,
>
> I have got a bit further with my efforts to boot linux on an imx31 based
> platform using u-boot.
>
> My console output is now:
>
> ----------------------------------------------------------------
> uboot>  bootm 80100000
> ## Booting kernel from Legacy Image at 80100000 ...
>     Image Name:   Angstrom/2.6.36/mx31ads
>     Created:      2011-07-28   2:03:27 UTC
>     Image Type:   ARM Linux Kernel Image (uncompressed)
>     Data Size:    1586172 Bytes = 1.5 MiB
>     Load Address: 8f000000
>     Entry Point:  8f000000
>     Verifying Checksum ... OK
>     Loading Kernel Image ... OK
> OK
>
> Starting kernel ...
>
> Uncompressing Linux... done, booting the kernel.
> -------------------------------------------------------------------
>
> So it seems to be getting to the 1st part of the kernel boot process,
> then hangs (I presume the last line comes from kernel code.)
> I don't know if the kernel is hanging, or if I don't have any more
> serial out ....
> I am passing "console=ttymxc0,115200" to the kernel ..
> Can someone confirm:
> A) If I have the correct Entry point, or does this need to be offset
> into the kernel? ..
> B) Is the serial console parameters correct?
> C) What is the correct way to set up the memory map? (my ram starts at
> 0x80000000, ends at 0x8fffffff)
> D) Is there a way to debug initial kernel stuff with serial output?
> In the above, I have decompressed the kernel to the top of the 256M ram,
> but have only advertised 120M via the bootloader   ... for now, not
> knowing what is correct and not wanting the kernel
> to stomp all over itself running in ram.

Analyzing this failure can be hard.  If you have some sort of JTAG setup
you might be able to break in at this point, figure out where it's hanging
up, etc.

Even if you don't have JTAG, there might be some crumbs left around for
you to look at.  Linux keeps everything that goes to the "console" in
a circular buffer __log_buf[].  Look up that symbol in System.map (which
will be found in your linux build tree).  Here's the tricky part - the
map will show a logical address, but U-Boot only knows physical addresses.
Normally the mapping is pretty easy, e.g. on my OMAP/3530 I might see:
   $ grep __log_buf linux-2.6.37/System.map
   c0527058 b __log_buf
So in U-Boot, I would look at the buffer like this:
   U-Boot> md 0x80527058
   80527058: 4c3e353c 78756e69 72657620 6e6f6973    <5>Linux version
   80527068: 362e3220 2e37332e 67282033 6d6f6874     2.6.37.3 (gthom
   80527078: 74407361 6e617469 67282029 76206363    as@titan) (gcc v
   80527088: 69737265 34206e6f 312e362e 31303220    ersion 4.6.1 201
   80527098: 32363031 70282037 65726572 7361656c    10627 (prereleas
   805270a8: 28202965 29434347 23202920 72462031    e) (GCC) ) #1 Fr
   805270b8: 754a2069 3232206c 3a393020 303a3135    i Jul 22 09:51:0
      ...

Keep looking through this buffer until it stops with useful characters.
That may tell you where the kernel got hung up and why.  If you find
only garbage, it may be more difficult to tell.

Note: hopefully your board has a RESET button which you can use to
get back into U-Boot once the kernel boot process hangs.  Power cycling
to reset the board won't work as the contents of RAM will likely be
destroyed.


-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


