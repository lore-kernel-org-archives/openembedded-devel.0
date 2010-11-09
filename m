Received: from usps1.crhc.illinois.edu ([130.126.143.230]
	helo=usps.crhc.uiuc.edu) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <johnso87@crhc.illinois.edu>) id 1PFswa-0007Tc-4J
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Nov 2010 19:29:24 +0100
Received: from usps.crhc.uiuc.edu (localhost [127.0.0.1])
	by usps.crhc.uiuc.edu (Postfix) with ESMTP id 9AB0D3400472;
	Tue,  9 Nov 2010 12:28:23 -0600 (CST)
Received: from [192.168.1.198] (unknown [63.252.64.254])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested) (Authenticated sender: johnso87)
	by usps.crhc.uiuc.edu (Postfix) with ESMTPSA id 6FEC43400471;
	Tue,  9 Nov 2010 12:28:23 -0600 (CST)
Message-ID: <4CD992C6.8030105@crhc.illinois.edu>
Date: Tue, 09 Nov 2010 12:28:22 -0600
From: Matt Johnson <johnso87@crhc.illinois.edu>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.9pre) Gecko/20100217 Lightning/1.0b1 Shredder/3.0.3pre
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org, 
	angstrom-distro-devel@linuxtogo.org
References: <mailman.0.1289314919.16967.angstrom-distro-devel@linuxtogo.org>
	<4CD96384.70100@crhc.illinois.edu> <4CD98F98.90503@mlbassoc.com>
In-Reply-To: <4CD98F98.90503@mlbassoc.com>
X-Virus-Scanned: ClamAV using ClamSMTP
X-SA-Exim-Connect-IP: 130.126.143.230
X-SA-Exim-Mail-From: johnso87@crhc.illinois.edu
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	RCVD_IN_BL_SPAMCOP_NET autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Can't build gstreamer-ti
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
X-List-Received-Date: Tue, 09 Nov 2010 18:29:25 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit



On 11/09/2010 12:14 PM, Gary Thomas wrote:
> On 11/09/2010 08:06 AM, Matt Johnson wrote:
>>
>>
>> On 08/10/2010 04:58 AM, Gary Thomas wrote:
>>
>> On 08/09/2010 04:37 PM, Chethan Pandarinath wrote:
>>
>> This seems to be the same error:
>> http://e2e.ti.com/support/dsp/omap_applications_processors/f/42/t/42905.aspx 
>>
>>
>>
>>
>> With the problem being that the cl6x compiler isn't bundled with the
>> rest of
>> the toolchain, and has to be downloaded separately.
>>
>>
>> But I've downloaded those tools and was able to build this recipe just
>> a few weeks ago. I think something in the staged packaging has broken 
>> it.
>>
>> I worked past this problem by installing a symlink by hand to my DVSDK
>> installed tools.
>>
>> Next problem :-(
>>
>>
>> |
>> /local/Angstrom_BeagleBoard/tmp/sysroots/i686-linux/usr/armv7a/lib/gcc/arm-angstrom-linux-gnueabi/4.3.3/../../../../arm-angstrom-linux-gnueabi/bin/ld: 
>>
>>
>> warning: package/cfg/bin/ti_platforms_evm3530/app_remote_xv5T.xdl
>> contains output sections; did you forget -T? |
>> /local/Angstrom_BeagleBoard/tmp/work/beagleboard-angstrom-linux-gnueabi/ti-codec-engine-2_25_01_06-r5/codec_engine_2_25_01_06/packages/ti/sdo/ce/lib/release/ce.av5T(Engine.ov5T): 
>>
>>
>> In function `Engine_deleteNode':
>>
>> | Engine.c:(.text+0x19d4): undefined reference to `__aeabi_uidiv'
>>
>> |
>> /local/Angstrom_BeagleBoard/tmp/work/beagleboard-angstrom-linux-gnueabi/ti-codec-engine-2_25_01_06-r5/codec_engine_2_25_01_06/packages/ti/sdo/ce/osal/linux/lib/release/osal_linux_470.av5T(Global_noOS.ov5T): 
>>
>>
>> In function `Global_atexit':
>>
>> | Global_noOS.c:(.text+0x238): undefined reference to `atexit'
>>
>> |
>> /local/Angstrom_BeagleBoard/tmp/sysroots/beagleboard-angstrom-linux-gnueabi/usr/share/ti/ti-dsplink-tree/packages/dsplink/gpp/export/BIN/Linux/OMAP3530/RELEASE/dsplink.lib: 
>>
>>
>> In function `_RingIO_writerAcquire':
>>
>> | ringio.c:(.text+0x24e4): undefined reference to `__aeabi_uidivmod'
>> | ringio.c:(.text+0x261c): undefined reference to `__aeabi_uidivmod'
>> | ringio.c:(.text+0x2654): undefined reference to `__aeabi_uidivmod'
>>
>> |
>> /local/Angstrom_BeagleBoard/tmp/sysroots/beagleboard-angstrom-linux-gnueabi/usr/share/ti/ti-dsplink-tree/packages/dsplink/gpp/export/BIN/Linux/OMAP3530/RELEASE/dsplink.lib: 
>>
>>
>> In function `_RingIO_readerAcquire':
>>
>> | ringio.c:(.text+0x28ac): undefined reference to `__aeabi_uidivmod'
>> | ringio.c:(.text+0x2bd4): undefined reference to `__aeabi_uidivmod'
>>
>> |
>> /local/Angstrom_BeagleBoard/tmp/sysroots/beagleboard-angstrom-linux-gnueabi/usr/share/ti/ti-dsplink-tree/packages/dsplink/gpp/export/BIN/Linux/OMAP3530/RELEASE/dsplink.lib:ringio.c:(.text+0x2eb4): 
>>
>>
>> more undefined references to `__aeabi_uidivmod' follow |
>> /local/Angstrom_BeagleBoard/tmp/sysroots/beagleboard-angstrom-linux-gnueabi/usr/share/ti/ti-dsplink-tree/packages/dsplink/gpp/export/BIN/Linux/OMAP3530/RELEASE/dsplink.lib: 
>>
>>
>> In function `DRV_installCleanupRoutines':
>>
>> | ringio.c:(.text+0x9354): undefined reference to `atexit'
>> | collect2: ld returned 1 exit status
>> | make[1]: *** [bin/ti_platforms_evm3530/app_remote.xv5T] Error 1
>>
>> | gmake: ***
>> [/local/Angstrom_BeagleBoard/tmp/work/beagleboard-angstrom-linux-gnueabi/ti-codec-engine-2_25_01_06-r5/codec_engine_2_25_01_06/examples/ti/sdo/ce/examples/apps/speech,.executables] 
>>
>>
>> Error 2
>>
>> | make[1]: *** [all] Error 2
>>
>> | make[1]: Leaving directory
>> `/local/Angstrom_BeagleBoard/tmp/work/beagleboard-angstrom-linux-gnueabi/ti-codec-engine-2_25_01_06-r5/codec_engine_2_25_01_06/examples/ti/sdo/ce/examples/apps/speech'| 
>>
>>
>> make: *** [all] Error 2 NOTE: package ti-codec-engine-2_25_01_06-r5:
>> task do_compile: Failed ERROR: TaskFailed event exception, aborting
>> ERROR: Build of
>> /local/Angstrom_BeagleBoard/openembedded/recipes/ti/ti-codec-engine_2.25.01.06.bb 
>>
>>
>> do_compile failed
>>
>> I wasn't subscribed to the Angstrom-devel list when this was posted, so
>> please excuse the improper quoting.
>> I ran into this problem as well attempting to build ti-codec-engine with
>> binutils 2.20 (Angstrom 2010).
>> It turns out that the problem is a linker script generated by TI
>> XDCTools. The issue, and a workaround, is documented
>> here:http://www.eclipse.org/forums/index.php?t=tree&th=197704&S=bf2c36fb547f9973f300fdf573c34d81#page_top 
>>
>> <http://www.eclipse.org/forums/index.php?t=tree&th=197704&S=bf2c36fb547f9973f300fdf573c34d81#page_top> 
>>
>>
>> I tested the workaround in my OE tree and it worked fine. Thought I'd
>> post that in case others were still having trouble.
>> We can either make a patch in ti-xdctools to remove the offending lines
>> from the linker script generators, wait for XDCTools 3.21 to be released
>> and quickly get a recipe going for that, or both.
>> XDCTools 3.21 should be available here
>> (http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/rtsc/index.html 
>>
>> ) when it's released.
>
> Thanks for pointing this out - I'm anxious to move to more recent tools.
>
> How did you test this work around?  Do you have a patch to share?
>
I was a bit frustrated with this package and was a bit heavy-handed.  I 
looked for all files of the flavor packages/.../arm/.../linkcmd.xdt, and 
removed everything from the line:
var _utils = xdc.loadCapsule("gnu/targets/linkUtils.xs");
down to the end of the file (all the linkcmd.xdt's contained this line, 
thankfully).  I then re-ran "bitbake ti-xdctools -c populate_sysroot *" 
to copy those into sysroots/ .
I then re-ran "bitbake ti-codec-engine -c compile -f" then "bitbake 
ti-codec-engine", then rebuilt my rootfs, deployed it to my board, and 
tested a couple codecs.
I haven't worked that into a patch, but that should be enough to get you 
going if you're anxious.  If anyone else is interested in making the 
patch (which should only be applied if you're using xdctools < 3.21 and 
binutils >= 2.19), feel free; it may be a while before i get to it.

-Matt

-- 
Matt Johnson
Graduate Student
University of Illinois at Urbana-Champaign, Dept. of ECE
Coordinated Science Lab, Rm. 213


