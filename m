Received: from 64.mail-out.ovh.net ([91.121.185.65])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1PYNf2-0007To-Ab
	for openembedded-devel@lists.openembedded.org;
	Thu, 30 Dec 2010 19:55:40 +0100
Received: (qmail 982 invoked by uid 503); 30 Dec 2010 18:37:55 -0000
Received: from b9.ovh.net (HELO mail413.ha.ovh.net) (213.186.33.59)
	by 64.mail-out.ovh.net with SMTP; 30 Dec 2010 18:37:54 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 30 Dec 2010 20:55:23 +0200
Received: from tal33-3-82-233-81-124.fbx.proxad.net (HELO ?192.168.2.15?)
	(ebenard%eukrea.com@82.233.81.124)
	by ns0.ovh.net with SMTP; 30 Dec 2010 20:55:23 +0200
Message-ID: <4D1CD597.70205@eukrea.com>
Date: Thu, 30 Dec 2010 19:55:19 +0100
From: =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.13) Gecko/20101209 Fedora/3.1.7-0.35.b3pre.fc14
	Lightning/1.0b3pre Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4D1C4E4A.5000705@eukrea.com> <ifhrie$a01$1@dough.gmane.org>
	<ifije4$p3n$1@dough.gmane.org>
In-Reply-To: <ifije4$p3n$1@dough.gmane.org>
X-Ovh-Tracer-Id: 15391896153449934153
X-Ovh-Remote: 82.233.81.124 (tal33-3-82-233-81-124.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
Subject: Re: ti-c6accel-1_01_00_01: link error
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
X-List-Received-Date: Thu, 30 Dec 2010 18:55:40 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30/12/2010 19:35, Koen Kooi wrote:
> FWIW, the full commandline is:
>
> | Linking c6accel_app from appMain.o c6accel_testfxns.o
> ../c6accelw/lib/c6accelw_omap3530.a470MV c6accel_app_config/linker.cmd..
> |
> /OE/angstrom-setup-scripts/build/tmp-angstrom_2008_1/sysroots/x86_64-linux/usr/armv7a/bin/arm-angstrom-linux-gnueabi-gcc
> -
> -L/OE/angstrom-setup-scripts/build/tmp-angstrom_2008_1/sysroots/armv7a-angstrom-linux-gnueabi/lib
> -
> -L/OE/angstrom-setup-scripts/build/tmp-angstrom_2008_1/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib
> - -Wl,-O1 -Wl,--hash-style=gnu -lm -lpthread -o c6accel_app appMain.o
> c6accel_testfxns.o ../c6accelw/lib/c6accelw_omap3530.a470MV
> c6accel_app_config/linker.cmd
> |
> /OE/angstrom-setup-scripts/build/tmp-angstrom_2008_1/sysroots/x86_64-linux/usr/armv7a/bin/arm-angstrom-linux-gnueabi-gcc
> -
> -L/OE/angstrom-setup-scripts/build/tmp-angstrom_2008_1/sysroots/armv7a-angstrom-linux-gnueabi/lib
> -
> -L/OE/angstrom-setup-scripts/build/tmp-angstrom_2008_1/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib
> - -Wl,-O1 -Wl,--hash-style=gnu -lm -lpthread -o c6accel_app appMain.o
> c6accel_testfxns.o ../c6accelw/lib/c6accelw_omap3530.a470MV
> c6accel_app_config/linker.cmd
> |
> /OE/angstrom-setup-scripts/build/tmp-angstrom_2008_1/sysroots/x86_64-linux/usr/armv7a/lib/gcc/arm-angstrom-linux-gnueabi/4.5.3/../../../../arm-angstrom-linux-gnueabi/bin/ld:
> warning: c6accel_app_config/linker.cmd contains output sections; did you
> forget -T?
> |
> /OE/angstrom-setup-scripts/build/tmp-angstrom_2008_1/sysroots/x86_64-linux/usr/armv7a/lib/gcc/arm-angstrom-linux-gnueabi/4.5.3/../../../../arm-angstrom-linux-gnueabi/bin/ld:
> .gnu.attributes not found for insert
>
>
> And the linkerscript is:
>
> INPUT(
>
> /OE/angstrom-setup-scripts/build/tmp-angstrom_2008_1/work/usrp-e1xx-angstrom-linux-gnueabi/ti-c6accel-1_01_00_03-r95a/c6accel_1_01_00_03/soc/app/c6accel_app_config/package/cfg/c6accel_app_xv5T.ov5T
>
> staging/usr/share/ti/ti-codec-engine-tree/packages/ti/sdo/ce/universal/lib/release/universal.av5T
>
> staging/usr/share/ti/ti-codec-engine-tree/packages/ti/sdo/ce/lib/release/ce.av5T
>
> staging/usr/share/ti/ti-codec-engine-tree/packages/ti/sdo/ce/alg/lib/release/Algorithm_noOS.av5T
>
> staging/usr/share/ti/ti-codec-engine-tree/packages/ti/sdo/ce/alg/lib/release/alg.av5T
>
> staging/usr/share/ti/ti-codec-engine-tree/packages/ti/sdo/ce/ipc/dsplink/lib/release/ipc_dsplink_3530.av5T
>
> staging/usr/share/ti/ti-codec-engine-tree/packages/ti/sdo/ce/osal/linux/lib/release/osal_linux_470.av5T
>
> staging/usr/share/ti/ti-framework-components-tree/packages/ti/sdo/fc/acpy3/lib/release/acpy3.a470MV
>
> staging/usr/share/ti/ti-framework-components-tree/packages/ti/sdo/fc/dman3/lib/release/dman3Cfg.a470MV
>
> staging/usr/share/ti/ti-framework-components-tree/packages/ti/sdo/fc/utils/lib/release/rmm.av5T
>
> staging/usr/share/ti/ti-framework-components-tree/packages/ti/sdo/fc/utils/lib/release/smgr.av5T
>
> staging/usr/share/ti/ti-framework-components-tree/packages/ti/sdo/fc/utils/lib/release/rmmp.av5T
>
> staging/usr/share/ti/ti-framework-components-tree/packages/ti/sdo/fc/utils/lib/release/smgrmp.av5T
>
> staging/usr/share/ti/ti-framework-components-tree/packages/ti/sdo/fc/utils/lib/release/shm.av5T
>
> staging/usr/share/ti/ti-framework-components-tree/packages/ti/sdo/fc/memutils/lib/release/memutils.av5T
>
> staging/usr/share/ti/ti-codec-engine-tree/packages/ti/sdo/ce/utils/xdm/lib/release/XdmUtils.av5T
>
> staging/usr/share/ti/ti-framework-components-tree/packages/ti/sdo/utils/trace/lib/release/gt.av5T
>
> staging/usr/share/ti/ti-codec-engine-tree/packages/ti/sdo/ce/node/lib/release/node.av5T
>
> staging/usr/share/ti/ti-local-power-manager-tree/packages/ti/bios/power/lib/release/lpm.av5T
>
> staging/usr/share/ti/ti-dsplink-tree/dsplink/gpp/export/BIN/Linux/OMAP3530/RELEASE/dsplink.lib
>
> staging/usr/share/ti/ti-framework-components-tree/packages/ti/sdo/fc/scpy/lib/release/scpy.av5T
>
> staging/usr/share/ti/ti-linuxutils-tree/packages/ti/sdo/linuxutils/cmem/lib/cmem.a470MV
>
> staging/usr/share/ti/ti-linuxutils-tree/packages/ti/sdo/linuxutils/sdma/lib/sdma.a470MV
>
> staging/usr/share/ti/ti-xdctools-tree/packages/gnu/targets/arm/rtsv5T/lib/gnu.targets.arm.rtsv5T.av5T
> )
>
> SECTIONS {
>      xdc.meta (COPY) : {*(xdc.meta)}
>
> }
>
> INSERT BEFORE .gnu.attributes
>
just back to this. I have the same logs here, removing SECTIONS & INSERT 
BEFORE in the linkerscript allows to finish the compilation but I don't know 
if the software still runs.

Eric


