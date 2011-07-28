Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QmSuk-0004tr-N9 for openembedded-devel@lists.openembedded.org;
	Thu, 28 Jul 2011 17:54:23 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QmSqb-0007Si-O6 for openembedded-devel@lists.openembedded.org;
	Thu, 28 Jul 2011 17:50:05 +0200
Received: from 207.59.80.172 ([207.59.80.172])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Jul 2011 17:50:05 +0200
Received: from dpsmith by 207.59.80.172 with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Jul 2011 17:50:05 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Daniel Smith <dpsmith@praxiseng.com>
Date: Thu, 28 Jul 2011 11:47:28 -0400
Message-ID: <j0s0bb$brf$1@dough.gmane.org>
References: <F7C0AA5DD1508F4789E10B6CC9BB75DB04B7A25E@nzc-ap-xch-02.ap.trimblecorp.net>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: 207.59.80.172
User-Agent: Mozilla/5.0 (Windows NT 5.1; rv:5.0) Gecko/20110624 Thunderbird/5.0
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
X-List-Received-Date: Thu, 28 Jul 2011 15:54:23 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 7/27/2011 10:20 PM, Bernard Mentink wrote:
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
>
> Many Thanks,
> Bernie

For (A), I ran into a similar issue cns3xxx which has a similar core as 
your imx31. You can see the thread here (http://goo.gl/HEOVK). Basically 
go look in the Makefile.boot for your sub-arch and see what is set for 
the zreladdr. If it is different than 0x20008000, then in your kernel 
recipe you need to set the UBOOT_ENTRYPOINT and UBOOT_LOADADDRESS to 
your zreladdr.

Hope that helps!

V/r,
Daniel P. Smith



