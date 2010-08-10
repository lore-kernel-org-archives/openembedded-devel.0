Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gary@mlbassoc.com>) id 1OioH6-0005ou-KZ
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Aug 2010 14:49:51 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 999)
	id DFE8A166088D; Tue, 10 Aug 2010 06:49:23 -0600 (MDT)
Received: from hermes.chez-thomas.org (hermes_local [192.168.1.101])
	by mail.chez-thomas.org (Postfix) with ESMTP id CAF701660892;
	Tue, 10 Aug 2010 06:48:55 -0600 (MDT)
Message-ID: <4C614AB7.2050709@mlbassoc.com>
Date: Tue, 10 Aug 2010 06:48:55 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.9) Gecko/20100430 Fedora/3.0.4-2.fc11 Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4C607E6C.2030104@mlbassoc.com>	<AANLkTi=zp9r7hoym3kFEx9hpCgoQ8iOBVNZ6FhN7F4q6@mail.gmail.com>
	<4C6130EC.9030602@mlbassoc.com>
In-Reply-To: <4C6130EC.9030602@mlbassoc.com>
X-SA-Exim-Connect-IP: 64.234.241.98
X-SA-Exim-Mail-From: gary@mlbassoc.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Discussion of the angstrom distribution development
	<angstrom-distro-devel@linuxtogo.org>
Subject: Re: [Angstrom-devel] Can't build gstreamer-ti
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
X-List-Received-Date: Tue, 10 Aug 2010 12:49:51 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/10/2010 04:58 AM, Gary Thomas wrote:
> On 08/09/2010 04:37 PM, Chethan Pandarinath wrote:
>> This seems to be the same error:
>> http://e2e.ti.com/support/dsp/omap_applications_processors/f/42/t/42905.aspx
>>
>>
>> With the problem being that the cl6x compiler isn't bundled with the
>> rest of
>> the toolchain, and has to be downloaded separately.
>>
>
> But I've downloaded those tools and was able to build this recipe just
> a few weeks ago. I think something in the staged packaging has broken it.

I worked past this problem by installing a symlink by hand to my DVSDK installed tools.

Next problem :-(

| /local/Angstrom_BeagleBoard/tmp/sysroots/i686-linux/usr/armv7a/lib/gcc/arm-angstrom-linux-gnueabi/4.3.3/../../../../arm-angstrom-linux-gnueabi/bin/ld: warning: 
package/cfg/bin/ti_platforms_evm3530/app_remote_xv5T.xdl contains output sections; did you forget -T?
| /local/Angstrom_BeagleBoard/tmp/work/beagleboard-angstrom-linux-gnueabi/ti-codec-engine-2_25_01_06-r5/codec_engine_2_25_01_06/packages/ti/sdo/ce/lib/release/ce.av5T(Engine.ov5T): 
In function `Engine_deleteNode':
| Engine.c:(.text+0x19d4): undefined reference to `__aeabi_uidiv'
| 
/local/Angstrom_BeagleBoard/tmp/work/beagleboard-angstrom-linux-gnueabi/ti-codec-engine-2_25_01_06-r5/codec_engine_2_25_01_06/packages/ti/sdo/ce/osal/linux/lib/release/osal_linux_470.av5T(Global_noOS.ov5T): 
In function `Global_atexit':
| Global_noOS.c:(.text+0x238): undefined reference to `atexit'
| /local/Angstrom_BeagleBoard/tmp/sysroots/beagleboard-angstrom-linux-gnueabi/usr/share/ti/ti-dsplink-tree/packages/dsplink/gpp/export/BIN/Linux/OMAP3530/RELEASE/dsplink.lib: In 
function `_RingIO_writerAcquire':
| ringio.c:(.text+0x24e4): undefined reference to `__aeabi_uidivmod'
| ringio.c:(.text+0x261c): undefined reference to `__aeabi_uidivmod'
| ringio.c:(.text+0x2654): undefined reference to `__aeabi_uidivmod'
| /local/Angstrom_BeagleBoard/tmp/sysroots/beagleboard-angstrom-linux-gnueabi/usr/share/ti/ti-dsplink-tree/packages/dsplink/gpp/export/BIN/Linux/OMAP3530/RELEASE/dsplink.lib: In 
function `_RingIO_readerAcquire':
| ringio.c:(.text+0x28ac): undefined reference to `__aeabi_uidivmod'
| ringio.c:(.text+0x2bd4): undefined reference to `__aeabi_uidivmod'
| 
/local/Angstrom_BeagleBoard/tmp/sysroots/beagleboard-angstrom-linux-gnueabi/usr/share/ti/ti-dsplink-tree/packages/dsplink/gpp/export/BIN/Linux/OMAP3530/RELEASE/dsplink.lib:ringio.c:(.text+0x2eb4): 
more undefined references to `__aeabi_uidivmod' follow
| /local/Angstrom_BeagleBoard/tmp/sysroots/beagleboard-angstrom-linux-gnueabi/usr/share/ti/ti-dsplink-tree/packages/dsplink/gpp/export/BIN/Linux/OMAP3530/RELEASE/dsplink.lib: In 
function `DRV_installCleanupRoutines':
| ringio.c:(.text+0x9354): undefined reference to `atexit'
| collect2: ld returned 1 exit status
| make[1]: *** [bin/ti_platforms_evm3530/app_remote.xv5T] Error 1
| gmake: *** 
[/local/Angstrom_BeagleBoard/tmp/work/beagleboard-angstrom-linux-gnueabi/ti-codec-engine-2_25_01_06-r5/codec_engine_2_25_01_06/examples/ti/sdo/ce/examples/apps/speech,.executables] 
Error 2
| make[1]: *** [all] Error 2
| make[1]: Leaving directory 
`/local/Angstrom_BeagleBoard/tmp/work/beagleboard-angstrom-linux-gnueabi/ti-codec-engine-2_25_01_06-r5/codec_engine_2_25_01_06/examples/ti/sdo/ce/examples/apps/speech'
| make: *** [all] Error 2
NOTE: package ti-codec-engine-2_25_01_06-r5: task do_compile: Failed
ERROR: TaskFailed event exception, aborting
ERROR: Build of /local/Angstrom_BeagleBoard/openembedded/recipes/ti/ti-codec-engine_2.25.01.06.bb do_compile failed

How were these packages built to be put on the Angstrom package feed?
Am I doing something wrong?

>
>> On Mon, Aug 9, 2010 at 6:17 PM, Gary Thomas<gary@mlbassoc.com> wrote:
>>
>>> Current org.openembedded.dev tree:
>>> commit 9b1a9d8fd143fdab0a169dfda77a5309d52f76a4
>>> Author: Stefan Schmidt<stefan@buglabs.net>
>>> Date: Mon Aug 9 17:26:00 2010 +0200
>>>
>>> firmware: Add recipe to work with the marvell-sdio-tf-fw
>>>
>>> MACHINE=beagleboard, DISTRO=angstrom, TARGET=gstreamer-ti
>>>
>>> | Compiling failure.c...
>>> |
>>> /local/Angstrom_BeagleBoard/tmp/sysroots/beagleboard-angstrom-linux-gnueabi/usr/share/ti/ti-cgt6x-tree/bin/cl6x
>>>
>>> -g -d"_DEBUG" --no_compress -dMAX_DSPS=1 -dMAX_PROCESSORS=2 -dID_GPP=1
>>> -dOMAP3530 -dPROC_COMPONENT -dPOOL_COMPONENT -dNOTIFY_COMPONENT
>>> -dMPCS_COMPONENT -dRINGIO_COMPONENT -dMPLIST_COMPONENT -dMSGQ_COMPONENT
>>> -dMSGQ_ZCPY_LINK -dCHNL_COMPONENT -dCHNL_ZCPY_LINK -dZCPY_LINK
>>> -dPROCID=0
>>> -dOMAP3530 -dOMAP3530_INTERFACE=SHMEM_INTERFACE
>>> -dPHYINTERFACE=SHMEM_INTERFACE -dDSP_SWI_MODE
>>> -I/local/Angstrom_BeagleBoard/tmp/work/beagleboard-angstrom-linux-gnueabi/ti-dsplink-1_1_64-r88h/dsplink_linux_1_64/dsplink/dsp/inc
>>>
>>> -I/local/Angstrom_BeagleBoard/tmp/work/beagleboard-angstrom-linux-gnueabi/ti-dsplink-1_1_64-r88h/dsplink_linux_1_64/dsplink/dsp/inc/DspBios
>>>
>>> -I/local/Angstrom_BeagleBoard/tmp/work/beagleboard-angstrom-linux-gnueabi/ti-dsplink-1_1_64-r88h/dsplink_linux_1_64/dsplink/dsp/inc/DspBios/5.XX
>>>
>>> -I/local/Angstrom_BeagleBoard/tmp/work/beagleboard-angstrom-linux-gnueabi/ti-dsplink-1_1_64-r88h/dsplink_linux_1_64/dsplink/dsp/inc/DspBios/5.XX/OMAP3530
>>>
>>> -I/local/Angstrom_BeagleBoard/tmp/work/beagleboard-angstrom-linux-gnueabi/ti-dsplink-1_1_64-r88h/dsplink_linux_1_64/dsplink/dsp/inc/OMAP3530
>>>
>>> -I/local/Angstrom_BeagleBoard/tmp/work/beagleboard-angstrom-linux-gnueabi/ti-dsplink-1_1_64-r88h/dsplink_linux_1_64/dsplink/dsp/inc/C64XX
>>>
>>> -I/local/Angstrom_BeagleBoard/tmp/work/beagleboard-angstrom-linux-gnueabi/ti-dsplink-1_1_64-r88h/dsplink_linux_1_64/dsplink/dsp/src/base/gen
>>>
>>> -I/local/Angstrom_BeagleBoard/tmp/work/beagleboard-angstrom-linux-gnueabi/ti-dsplink-1_1_64-r88h/dsplink_linux_1_64/dsplink/dsp/src/base/gen/DspBios
>>>
>>> -I/local/Angstrom_BeagleBoard/tmp/work/beagleboard-angstrom-linux-gnueabi/ti-dsplink-1_1_64-r88h/dsplink_linux_1_64/dsplink/dsp/src/base/gen/DspBios/
>>>
>>> -I/local/Angstrom_BeagleBoard/tmp/sysroots/beagleboard-angstrom-linux-gnueabi/usr/share/ti/ti-dspbios-tree/packages/ti/bios/include
>>>
>>> -I/local/Angstrom_BeagleBoard/tmp/sysroots/beagleboard-angstrom-linux-gnueabi/usr/share/ti/ti-cgt6x-tree/include
>>>
>>> -I/local/Angstrom_BeagleBoard/tmp/sysroots/beagleboard-angstrom-linux-gnueabi/usr/share/ti/ti-dspbios-tree/packages/ti/rtdx/include/c6000
>>>
>>> -I/local/Angstrom_BeagleBoard/tmp/sysroots/beagleboard-angstrom-linux-gnueabi/usr/share/ti/ti-dspbios-tree/packages/ti/psl/include
>>>
>>> -I/local/Angstrom_BeagleBoard/tmp/work/beagleboard-angstrom-linux-gnueabi/ti-dsplink-1_1_64-r88h/dsplink_linux_1_64/dsplink/dsp/BUILD/OMAP3530_0/INCLUDE
>>>
>>> -q -pdr -pdv -pden -ml3 -mv6400+ --disable:sploop
>>> -fr"/local/Angstrom_BeagleBoard/tmp/work/beagleboard-angstrom-linux-gnueabi/ti-dsplink-1_1_64-r88h/dsplink_linux_1_64/dsplink/dsp/BUILD/OMAP3530_0/GEN/OBJ/DEBUG"
>>>
>>> failure.c
>>> | /bin/sh:
>>> /local/Angstrom_BeagleBoard/tmp/sysroots/beagleboard-angstrom-linux-gnueabi/usr/share/ti/ti-cgt6x-tree/bin/cl6x:
>>>
>>> No such file or directory
>>> | make[3]: *** [failure.c.deb] Error 127
>>> | make[3]: Leaving directory
>>> `/local/Angstrom_BeagleBoard/tmp/work/beagleboard-angstrom-linux-gnueabi/ti-dsplink-1_1_64-r88h/dsplink_linux_1_64/dsplink/dsp/src/base/gen'
>>>
>>> | make[2]: *** [objdeb] Error 2
>>> | make[2]: Leaving directory
>>> `/local/Angstrom_BeagleBoard/tmp/work/beagleboard-angstrom-linux-gnueabi/ti-dsplink-1_1_64-r88h/dsplink_linux_1_64/dsplink/dsp/src/base/gen'
>>>
>>> | make[1]: *** [gen.objdeb] Error 2
>>> | make[1]: Leaving directory
>>> `/local/Angstrom_BeagleBoard/tmp/work/beagleboard-angstrom-linux-gnueabi/ti-dsplink-1_1_64-r88h/dsplink_linux_1_64/dsplink/dsp/src/base'
>>>
>>> | make: *** [base.objdeb] Error 2
>>> NOTE: package ti-dsplink-1_1_64-r88h: task do_compile: Failed
>>> ERROR: TaskFailed event exception, aborting
>>> ERROR: Build of /local/Angstrom_BeagleBoard/openembedded/recipes/ti/
>>> ti-dsplink_1.64.bb do_compile failed
>>>
>>> --
>>> ------------------------------------------------------------
>>> Gary Thomas | Consulting for the
>>> MLB Associates | Embedded world
>>> ------------------------------------------------------------
>>>
>>> _______________________________________________
>>> Angstrom-distro-devel mailing list
>>> Angstrom-distro-devel@linuxtogo.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/angstrom-distro-devel
>>>
>>>
>>
>>
>>
>

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


