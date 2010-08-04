Received: from asmtpout030.mac.com ([17.148.16.105])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <elvis.dowson@mac.com>) id 1OgY1a-0004ml-NS
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Aug 2010 09:04:45 +0200
MIME-version: 1.0
Received: from [192.168.1.103] ([87.201.169.38])
	by asmtp030.mac.com (Sun Java(tm) System Messaging Server 6.3-8.01
	(built Dec
	16 2008; 32bit)) with ESMTPSA id <0L6M0060R8Y2ZM40@asmtp030.mac.com> for
	openembedded-devel@lists.openembedded.org; Wed,
	04 Aug 2010 00:03:48 -0700 (PDT)
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
	ipscore=0 phishscore=0 bulkscore=0 adultscore=0 classifier=spam
	adjust=0
	reason=mlx engine=6.0.2-1004200000 definitions=main-1008030262
X-Proofpoint-Virus-Version: vendor=fsecure
	engine=2.50.10432:5.0.10011,1.0.148,0.0.0000
	definitions=2010-08-04_03:2010-08-04, 2010-08-04,
	1970-01-01 signatures=0
From: Elvis Dowson <elvis.dowson@mac.com>
Date: Wed, 04 Aug 2010 11:03:18 +0400
In-reply-to: <764E1214-84B1-42BB-996C-676D194F7208@mac.com>
To: OpenEmbedded Developer <openembedded-devel@lists.openembedded.org>
References: <764E1214-84B1-42BB-996C-676D194F7208@mac.com>
Message-id: <AF469154-F66D-4DD9-B344-23E6F0C15677@mac.com>
X-Mailer: Apple Mail (2.1081)
X-SA-Exim-Connect-IP: 17.148.16.105
X-SA-Exim-Mail-From: elvis.dowson@mac.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.4 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Error building libgles-omap3
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
X-List-Received-Date: Wed, 04 Aug 2010 07:04:46 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

Hi,
       I managed to fix the checksum error by modifying the =
conf/checksum.ini file and adding the following entries

=
[http://install.source.dir.local/OMAP35x_Graphics_SDK_setuplinux_3_01_00_0=
6.bin]
md5=3D7aa37ca72f34011d353e72cc67f8aac1
sha256=3D02276bc728699c36b0d2411c60f23030aa066ca6b8ed5adb7a40204563a227fb


but now I get a slew of errors:


ERROR: function do_compile failed
ERROR: log data follows =
(/tool/overo-oe/tmp/work/beagleboard-angstrom-linux-gnueabi/omap3-sgx-modu=
les-1.4.14.2616-r51b/temp/log.do_compile.29401)
| NOTE: make -j 6 -e MAKEFLAGS=3D =
KERNEL_PATH=3D/tool/overo-oe/tmp/staging/beagleboard-angstrom-linux-gnueab=
i/kernel =
KERNEL_SRC=3D/tool/overo-oe/tmp/staging/beagleboard-angstrom-linux-gnueabi=
/kernel =
KDIR=3D/tool/overo-oe/tmp/staging/beagleboard-angstrom-linux-gnueabi/kerne=
l =
KERNELDIR=3D/tool/overo-oe/tmp/staging/beagleboard-angstrom-linux-gnueabi/=
kernel KERNEL_VERSION=3D2.6.35 CC=3Dccache =
arm-angstrom-linux-gnueabi-gcc  LD=3Darm-angstrom-linux-gnueabi-ld  =
AR=3Darm-angstrom-linux-gnueabi-ar  BUILD=3Drelease TI_PLATFORM=3Domap3630=

| make -C =
/tool/overo-oe/tmp/staging/beagleboard-angstrom-linux-gnueabi/kernel =
M=3D`pwd`
| make[1]: Entering directory =
`/tool/overo-oe/tmp/staging/beagleboard-angstrom-linux-gnueabi/kernel'
|=20
|   ERROR: Kernel configuration is invalid.
|          include/generated/autoconf.h or include/config/auto.conf are =
missing.
|          Run 'make oldconfig && make prepare' on kernel src to fix it.
|=20
|   LD      =
/tool/overo-oe/tmp/work/beagleboard-angstrom-linux-gnueabi/omap3-sgx-modul=
es-1.4.14.2616-r51b/OMAP35x_Graphics_SDK_3_01_00_06/GFX_Linux_KM/services4=
/3rdparty/bufferclass_ti/built-in.o
|   CC [M]  =
/tool/overo-oe/tmp/work/beagleboard-angstrom-linux-gnueabi/omap3-sgx-modul=
es-1.4.14.2616-r51b/OMAP35x_Graphics_SDK_3_01_00_06/GFX_Linux_KM/services4=
/3rdparty/bufferclass_ti/bc_cat.o
| cc1: error: include/generated/autoconf.h: No such file or directory
| In file included from =
/tool/overo-oe/tmp/staging/beagleboard-angstrom-linux-gnueabi/kernel/arch/=
arm/include/asm/system.h:328,
|                  from =
/tool/overo-oe/tmp/staging/beagleboard-angstrom-linux-gnueabi/kernel/arch/=
arm/include/asm/bitops.h:27,
|                  from include/linux/bitops.h:22,
|                  from include/linux/kernel.h:17,
|                  from =
/tool/overo-oe/tmp/work/beagleboard-angstrom-linux-gnueabi/omap3-sgx-modul=
es-1.4.14.2616-r51b/OMAP35x_Graphics_SDK_3_01_00_06/GFX_Linux_KM/services4=
/3rdparty/bufferclass_ti/bc_cat.c:28:
| include/asm-generic/cmpxchg-local.h: In function =
=91__cmpxchg_local_generic=92:
| include/asm-generic/cmpxchg-local.h:23: error: implicit declaration of =
function =91local_irq_save=92
| include/asm-generic/cmpxchg-local.h:44: error: implicit declaration of =
function =91local_irq_restore=92
| In file included from include/linux/list.h:6,
|                  from include/linux/module.h:9,
|                  from =
/tool/overo-oe/tmp/work/beagleboard-angstrom-linux-gnueabi/omap3-sgx-modul=
es-1.4.14.2616-r51b/OMAP35x_Graphics_SDK_3_01_00_06/GFX_Linux_KM/services4=
/3rdparty/bufferclass_ti/bc_cat.c:29:
| include/linux/prefetch.h: In function =91prefetch_range=92:
| include/linux/prefetch.h:59: error: =91CONFIG_ARM_L1_CACHE_SHIFT=92 =
undeclared (first use in this function)
| include/linux/prefetch.h:59: error: (Each undeclared identifier is =
reported only once
| include/linux/prefetch.h:59: error: for each function it appears in.)
| In file included from include/linux/seqlock.h:29,
|                  from include/linux/time.h:8,
|                  from include/linux/stat.h:60,
|                  from include/linux/module.h:10,
|                  from =
/tool/overo-oe/tmp/work/beagleboard-angstrom-linux-gnueabi/omap3-sgx-modul=
es-1.4.14.2616-r51b/OMAP35x_Graphics_SDK_3_01_00_06/GFX_Linux_KM/services4=
/3rdparty/bufferclass_ti/bc_cat.c:29:
| include/linux/spinlock.h: In function =91spin_lock_irq=92:
| include/linux/spinlock.h:309: error: implicit declaration of function =
=91local_irq_disable=92
| include/linux/spinlock.h: In function =91spin_unlock_irq=92:
| include/linux/spinlock.h:334: error: implicit declaration of function =
=91local_irq_enable=92
| In file included from include/linux/gfp.h:4,
|                  from include/linux/kmod.h:22,
|                  from include/linux/module.h:13,
|                  from =
/tool/overo-oe/tmp/work/beagleboard-angstrom-linux-gnueabi/omap3-sgx-modul=
es-1.4.14.2616-r51b/OMAP35x_Graphics_SDK_3_01_00_06/GFX_Linux_KM/services4=
/3rdparty/bufferclass_ti/bc_cat.c:29:
| include/linux/mmzone.h:18:30: error: generated/bounds.h: No such file =
or directory
| include/linux/mmzone.h:252:5: warning: "MAX_NR_ZONES" is not defined
| In file included from include/linux/gfp.h:4,
|                  from include/linux/kmod.h:22,
|                  from include/linux/module.h:13,
|                  from =
/tool/overo-oe/tmp/work/beagleboard-angstrom-linux-gnueabi/omap3-sgx-modul=
es-1.4.14.2616-r51b/OMAP35x_Graphics_SDK_3_01_00_06/GFX_Linux_KM/services4=
/3rdparty/bufferclass_ti/bc_cat.c:29:
| include/linux/mmzone.h: At top level:
| include/linux/mmzone.h:294: error: =91MAX_NR_ZONES=92 undeclared here =
(not in a function)
| In file included from include/linux/notifier.h:14,
|                  from include/linux/memory_hotplug.h:6,
|                  from include/linux/mmzone.h:651,
|                  from include/linux/gfp.h:4,
|                  from include/linux/kmod.h:22,
|                  from include/linux/module.h:13,
|                  from =
/tool/overo-oe/tmp/work/beagleboard-angstrom-linux-gnueabi/omap3-sgx-modul=
es-1.4.14.2616-r51b/OMAP35x_Graphics_SDK_3_01_00_06/GFX_Linux_KM/services4=
/3rdparty/bufferclass_ti/bc_cat.c:29:
| include/linux/rwsem.h:22:65: error: asm/rwsem.h: No such file or =
directory
| In file included from include/linux/memory_hotplug.h:6,
|                  from include/linux/mmzone.h:651,
|                  from include/linux/gfp.h:4,
|                  from include/linux/kmod.h:22,
|                  from include/linux/module.h:13,
|                  from =
/tool/overo-oe/tmp/work/beagleboard-angstrom-linux-gnueabi/omap3-sgx-modul=
es-1.4.14.2616-r51b/OMAP35x_Graphics_SDK_3_01_00_06/GFX_Linux_KM/services4=
/3rdparty/bufferclass_ti/bc_cat.c:29:
| include/linux/notifier.h:62: error: field =91rwsem=92 has incomplete =
type
| In file included from include/linux/ktime.h:25,
|                  from include/linux/timer.h:5,
|                  from include/linux/workqueue.h:8,
|                  from include/linux/kmod.h:26,
|                  from include/linux/module.h:13,
|                  from =
/tool/overo-oe/tmp/work/beagleboard-angstrom-linux-gnueabi/omap3-sgx-modul=
es-1.4.14.2616-r51b/OMAP35x_Graphics_SDK_3_01_00_06/GFX_Linux_KM/services4=
/3rdparty/bufferclass_ti/bc_cat.c:29:
| include/linux/jiffies.h:18:5: warning: "CONFIG_HZ" is not defined
| include/linux/jiffies.h:20:7: warning: "CONFIG_HZ" is not defined
| include/linux/jiffies.h:22:7: warning: "CONFIG_HZ" is not defined
| include/linux/jiffies.h:24:7: warning: "CONFIG_HZ" is not defined
| include/linux/jiffies.h:26:7: warning: "CONFIG_HZ" is not defined
| include/linux/jiffies.h:28:7: warning: "CONFIG_HZ" is not defined
| include/linux/jiffies.h:30:7: warning: "CONFIG_HZ" is not defined
| include/linux/jiffies.h:32:7: warning: "CONFIG_HZ" is not defined
| include/linux/jiffies.h:34:7: warning: "CONFIG_HZ" is not defined
| include/linux/jiffies.h:36:7: warning: "CONFIG_HZ" is not defined
| include/linux/jiffies.h:39:3: error: #error Invalid value of HZ.
| include/linux/jiffies.h:257:31: warning: "CONFIG_HZ" is not defined
| include/linux/jiffies.h:257:31: warning: "CONFIG_HZ" is not defined
| include/linux/jiffies.h:257:31: warning: "CONFIG_HZ" is not defined
| include/linux/jiffies.h:257:31: warning: "CONFIG_HZ" is not defined
| include/linux/jiffies.h:257:31: error: division by zero in #if
| include/linux/jiffies.h:257:31: error: division by zero in #if
| include/linux/jiffies.h:257:31: warning: "CONFIG_HZ" is not defined
| include/linux/jiffies.h:257:31: warning: "CONFIG_HZ" is not defined
| include/linux/jiffies.h:257:31: warning: "CONFIG_HZ" is not defined
| include/linux/jiffies.h:257:31: warning: "CONFIG_HZ" is not defined
| include/linux/jiffies.h:257:31: error: division by zero in #if
| include/linux/jiffies.h:257:31: error: division by zero in #if
| include/linux/jiffies.h:257:31: warning: "CONFIG_HZ" is not defined
| include/linux/jiffies.h:257:31: warning: "CONFIG_HZ" is not defined
| include/linux/jiffies.h:257:31: warning: "CONFIG_HZ" is not defined
| include/linux/jiffies.h:257:31: error: division by zero in #if
| include/linux/jiffies.h:257:31: warning: "CONFIG_HZ" is not defined
| include/linux/jiffies.h:257:31: warning: "CONFIG_HZ" is not defined
| include/linux/jiffies.h:257:31: warning: "CONFIG_HZ" is not defined
| include/linux/jiffies.h:257:31: error: division by zero in #if
| include/linux/jiffies.h:257:31: error: division by zero in #if
| include/linux/jiffies.h:257:31: error: division by zero in #if
| include/linux/jiffies.h:257:31: warning: "CONFIG_HZ" is not defined
| include/linux/jiffies.h:257:31: warning: "CONFIG_HZ" is not defined
| include/linux/jiffies.h:257:31: warning: "CONFIG_HZ" is not defined
| include/linux/jiffies.h:257:31: warning: "CONFIG_HZ" is not defined
| include/linux/jiffies.h:257:31: error: division by zero in #if
| include/linux/jiffies.h:257:31: error: division by zero in #if
| include/linux/jiffies.h:257:31: warning: "CONFIG_HZ" is not defined
| include/linux/jiffies.h:257:31: warning: "CONFIG_HZ" is not defined
| include/linux/jiffies.h:257:31: warning: "CONFIG_HZ" is not defined
| include/linux/jiffies.h:257:31: warning: "CONFIG_HZ" is not defined
| include/linux/jiffies.h:257:31: error: division by zero in #if
| include/linux/jiffies.h:257:31: error: division by zero in #if
| include/linux/jiffies.h:257:31: warning: "CONFIG_HZ" is not defined
| include/linux/jiffies.h:257:31: warning: "CONFIG_HZ" is not defined
| include/linux/jiffies.h:257:31: warning: "CONFIG_HZ" is not defined
| include/linux/jiffies.h:257:31: error: division by zero in #if
| include/linux/jiffies.h:257:31: warning: "CONFIG_HZ" is not defined
| include/linux/jiffies.h:257:31: warning: "CONFIG_HZ" is not defined
| include/linux/jiffies.h:257:31: warning: "CONFIG_HZ" is not defined
| include/linux/jiffies.h:257:31: error: division by zero in #if
| include/linux/jiffies.h:257:31: error: division by zero in #if
| include/linux/jiffies.h:257:31: error: division by zero in #if
| include/linux/jiffies.h:257:31: warning: "CONFIG_HZ" is not defined
| include/linux/jiffies.h:257:31: warning: "CONFIG_HZ" is not defined
| include/linux/jiffies.h:257:31: warning: "CONFIG_HZ" is not defined
| include/linux/jiffies.h:257:31: warning: "CONFIG_HZ" is not defined
| include/linux/jiffies.h:257:31: error: division by zero in #if
| include/linux/jiffies.h:257:31: error: division by zero in #if
| include/linux/jiffies.h:257:31: warning: "CONFIG_HZ" is not defined
| include/linux/jiffies.h:257:31: warning: "CONFIG_HZ" is not defined
| include/linux/jiffies.h:257:31: warning: "CONFIG_HZ" is not defined
| include/linux/jiffies.h:257:31: warning: "CONFIG_HZ" is not defined
| include/linux/jiffies.h:257:31: error: division by zero in #if
| include/linux/jiffies.h:257:31: error: division by zero in #if
| include/linux/jiffies.h:257:31: warning: "CONFIG_HZ" is not defined
| include/linux/jiffies.h:257:31: warning: "CONFIG_HZ" is not defined
| include/linux/jiffies.h:257:31: warning: "CONFIG_HZ" is not defined
| include/linux/jiffies.h:257:31: error: division by zero in #if
| include/linux/jiffies.h:257:31: warning: "CONFIG_HZ" is not defined
| include/linux/jiffies.h:257:31: warning: "CONFIG_HZ" is not defined
| include/linux/jiffies.h:257:31: warning: "CONFIG_HZ" is not defined
| include/linux/jiffies.h:257:31: error: division by zero in #if
| include/linux/jiffies.h:257:31: error: division by zero in #if
| include/linux/jiffies.h:257:31: warning: "CONFIG_HZ" is not defined
| include/linux/jiffies.h:257:31: warning: "CONFIG_HZ" is not defined
| include/linux/jiffies.h:257:31: warning: "CONFIG_HZ" is not defined
| include/linux/jiffies.h:257:31: warning: "CONFIG_HZ" is not defined
| include/linux/jiffies.h:257:31: error: division by zero in #if
| include/linux/jiffies.h:257:31: error: division by zero in #if
| include/linux/jiffies.h:257:31: warning: "CONFIG_HZ" is not defined
| include/linux/jiffies.h:257:31: warning: "CONFIG_HZ" is not defined
| include/linux/jiffies.h:257:31: warning: "CONFIG_HZ" is not defined
| include/linux/jiffies.h:257:31: warning: "CONFIG_HZ" is not defined
| include/linux/jiffies.h:257:31: error: division by zero in #if
| include/linux/jiffies.h:257:31: error: division by zero in #if
| include/linux/jiffies.h:257:31: warning: "CONFIG_HZ" is not defined
| include/linux/jiffies.h:257:31: warning: "CONFIG_HZ" is not defined
| include/linux/jiffies.h:257:31: warning: "CONFIG_HZ" is not defined
| include/linux/jiffies.h:257:31: error: division by zero in #if
| include/linux/jiffies.h:257:31: warning: "CONFIG_HZ" is not defined
| include/linux/jiffies.h:257:31: warning: "CONFIG_HZ" is not defined
| include/linux/jiffies.h:257:31: warning: "CONFIG_HZ" is not defined
| include/linux/jiffies.h:257:31: error: division by zero in #if
| include/linux/jiffies.h:257:31: error: division by zero in #if
| include/linux/jiffies.h:257:31: error: division by zero in #if
| include/linux/jiffies.h:257:46: warning: "SHIFT_HZ" is not defined
| In file included from include/linux/tracepoint.h:19,
|                  from include/linux/module.h:18,
|                  from =
/tool/overo-oe/tmp/work/beagleboard-angstrom-linux-gnueabi/omap3-sgx-modul=
es-1.4.14.2616-r51b/OMAP35x_Graphics_SDK_3_01_00_06/GFX_Linux_KM/services4=
/3rdparty/bufferclass_ti/bc_cat.c:29:
| include/linux/rcupdate.h:73:2: error: #error "Unknown RCU =
implementation specified to kernel configuration"
| In file included from include/linux/tracepoint.h:19,
|                  from include/linux/module.h:18,
|                  from =
/tool/overo-oe/tmp/work/beagleboard-angstrom-linux-gnueabi/omap3-sgx-modul=
es-1.4.14.2616-r51b/OMAP35x_Graphics_SDK_3_01_00_06/GFX_Linux_KM/services4=
/3rdparty/bufferclass_ti/bc_cat.c:29:
| include/linux/rcupdate.h: In function =91rcu_read_lock=92:
| include/linux/rcupdate.h:312: error: implicit declaration of function =
=91__rcu_read_lock=92
| include/linux/rcupdate.h: In function =91rcu_read_unlock=92:
| include/linux/rcupdate.h:336: error: implicit declaration of function =
=91__rcu_read_unlock=92
| include/linux/rcupdate.h: In function =91rcu_read_lock_bh=92:
| include/linux/rcupdate.h:352: error: implicit declaration of function =
=91__rcu_read_lock_bh=92
| include/linux/rcupdate.h: In function =91rcu_read_unlock_bh=92:
| include/linux/rcupdate.h:366: error: implicit declaration of function =
=91__rcu_read_unlock_bh=92
| In file included from include/linux/module.h:18,
|                  from =
/tool/overo-oe/tmp/work/beagleboard-angstrom-linux-gnueabi/omap3-sgx-modul=
es-1.4.14.2616-r51b/OMAP35x_Graphics_SDK_3_01_00_06/GFX_Linux_KM/services4=
/3rdparty/bufferclass_ti/bc_cat.c:29:
| include/linux/tracepoint.h: In function =
=91tracepoint_synchronize_unregister=92:
| include/linux/tracepoint.h:80: error: implicit declaration of function =
=91synchronize_sched=92
| In file included from include/linux/fs.h:472,
|                  from =
/tool/overo-oe/tmp/work/beagleboard-angstrom-linux-gnueabi/omap3-sgx-modul=
es-1.4.14.2616-r51b/OMAP35x_Graphics_SDK_3_01_00_06/GFX_Linux_KM/services4=
/3rdparty/bufferclass_ti/bc_cat.c:30:
| include/linux/quota.h: At top level:
| include/linux/quota.h:396: error: field =91dqptr_sem=92 has incomplete =
type
| In file included from =
/tool/overo-oe/tmp/work/beagleboard-angstrom-linux-gnueabi/omap3-sgx-modul=
es-1.4.14.2616-r51b/OMAP35x_Graphics_SDK_3_01_00_06/GFX_Linux_KM/services4=
/3rdparty/bufferclass_ti/bc_cat.c:30:
| include/linux/fs.h:750: error: field =91i_alloc_sem=92 has incomplete =
type
| In file included from =
/tool/overo-oe/tmp/work/beagleboard-angstrom-linux-gnueabi/omap3-sgx-modul=
es-1.4.14.2616-r51b/OMAP35x_Graphics_SDK_3_01_00_06/GFX_Linux_KM/services4=
/3rdparty/bufferclass_ti/bc_cat.c:30:
| include/linux/fs.h:1334: error: field =91s_umount=92 has incomplete =
type
| In file included from include/linux/mm.h:14,
|                  from include/linux/scatterlist.h:6,
|                  from include/linux/dma-mapping.h:7,
|                  from =
/tool/overo-oe/tmp/work/beagleboard-angstrom-linux-gnueabi/omap3-sgx-modul=
es-1.4.14.2616-r51b/OMAP35x_Graphics_SDK_3_01_00_06/GFX_Linux_KM/services4=
/3rdparty/bufferclass_ti/bc_cat.c:38:
| include/linux/mm_types.h:65:5: warning: "CONFIG_SPLIT_PTLOCK_CPUS" is =
not defined
| include/linux/mm_types.h:206:5: warning: "CONFIG_SPLIT_PTLOCK_CPUS" is =
not defined
| In file included from include/linux/mm.h:14,
|                  from include/linux/scatterlist.h:6,
|                  from include/linux/dma-mapping.h:7,
|                  from =
/tool/overo-oe/tmp/work/beagleboard-angstrom-linux-gnueabi/omap3-sgx-modul=
es-1.4.14.2616-r51b/OMAP35x_Graphics_SDK_3_01_00_06/GFX_Linux_KM/services4=
/3rdparty/bufferclass_ti/bc_cat.c:38:
| include/linux/mm_types.h:240: error: field =91mmap_sem=92 has =
incomplete type
| In file included from include/linux/slab_def.h:168,
|                  from include/linux/slab.h:172,
|                  from =
/tool/overo-oe/tmp/staging/beagleboard-angstrom-linux-gnueabi/kernel/arch/=
arm/include/asm/pgtable-nommu.h:16,
|                  from =
/tool/overo-oe/tmp/staging/beagleboard-angstrom-linux-gnueabi/kernel/arch/=
arm/include/asm/pgtable.h:18,
|                  from include/linux/mm.h:40,
|                  from include/linux/scatterlist.h:6,
|                  from include/linux/dma-mapping.h:7,
|                  from =
/tool/overo-oe/tmp/work/beagleboard-angstrom-linux-gnueabi/omap3-sgx-modul=
es-1.4.14.2616-r51b/OMAP35x_Graphics_SDK_3_01_00_06/GFX_Linux_KM/services4=
/3rdparty/bufferclass_ti/bc_cat.c:38:
| include/linux/kmalloc_sizes.h:5:5: warning: =
"CONFIG_ARM_L1_CACHE_SHIFT" is not defined
| include/linux/kmalloc_sizes.h:9:5: warning: =
"CONFIG_ARM_L1_CACHE_SHIFT" is not defined
| In file included from include/linux/scatterlist.h:6,
|                  from include/linux/dma-mapping.h:7,
|                  from =
/tool/overo-oe/tmp/work/beagleboard-angstrom-linux-gnueabi/omap3-sgx-modul=
es-1.4.14.2616-r51b/OMAP35x_Graphics_SDK_3_01_00_06/GFX_Linux_KM/services4=
/3rdparty/bufferclass_ti/bc_cat.c:38:
| include/linux/mm.h: In function =91virt_to_head_page=92:
| include/linux/mm.h:324: error: implicit declaration of function =
=91__pfn_to_page=92
| include/linux/mm.h:324: warning: initialization makes pointer from =
integer without a cast
| In file included from include/linux/scatterlist.h:6,
|                  from include/linux/dma-mapping.h:7,
|                  from =
/tool/overo-oe/tmp/work/beagleboard-angstrom-linux-gnueabi/omap3-sgx-modul=
es-1.4.14.2616-r51b/OMAP35x_Graphics_SDK_3_01_00_06/GFX_Linux_KM/services4=
/3rdparty/bufferclass_ti/bc_cat.c:38:
| include/linux/mm.h:461:63: warning: "NR_PAGEFLAGS" is not defined
| include/linux/mm.h:509:62: warning: "NR_PAGEFLAGS" is not defined
| In file included from include/linux/scatterlist.h:6,
|                  from include/linux/dma-mapping.h:7,
|                  from =
/tool/overo-oe/tmp/work/beagleboard-angstrom-linux-gnueabi/omap3-sgx-modul=
es-1.4.14.2616-r51b/OMAP35x_Graphics_SDK_3_01_00_06/GFX_Linux_KM/services4=
/3rdparty/bufferclass_ti/bc_cat.c:38:
| include/linux/mm.h: In function =91lowmem_page_address=92:
| include/linux/mm.h:599: error: implicit declaration of function =
=91__page_to_pfn=92
| include/linux/mm.h:1058:5: warning: "CONFIG_SPLIT_PTLOCK_CPUS" is not =
defined
| In file included from include/linux/dma-mapping.h:7,
|                  from =
/tool/overo-oe/tmp/work/beagleboard-angstrom-linux-gnueabi/omap3-sgx-modul=
es-1.4.14.2616-r51b/OMAP35x_Graphics_SDK_3_01_00_06/GFX_Linux_KM/services4=
/3rdparty/bufferclass_ti/bc_cat.c:38:
| include/linux/scatterlist.h: In function =91sg_set_buf=92:
| include/linux/scatterlist.h:112: warning: passing argument 2 of =
=91sg_set_page=92 makes pointer from integer without a cast
| =
/tool/overo-oe/tmp/work/beagleboard-angstrom-linux-gnueabi/omap3-sgx-modul=
es-1.4.14.2616-r51b/OMAP35x_Graphics_SDK_3_01_00_06/GFX_Linux_KM/services4=
/3rdparty/bufferclass_ti/bc_cat.c: In function =91bc_cat_init=92:
| =
/tool/overo-oe/tmp/work/beagleboard-angstrom-linux-gnueabi/omap3-sgx-modul=
es-1.4.14.2616-r51b/OMAP35x_Graphics_SDK_3_01_00_06/GFX_Linux_KM/services4=
/3rdparty/bufferclass_ti/bc_cat.c:490: error: implicit declaration of =
function =91omap_rev_lt_3_0=92
| make[3]: *** =
[/tool/overo-oe/tmp/work/beagleboard-angstrom-linux-gnueabi/omap3-sgx-modu=
les-1.4.14.2616-r51b/OMAP35x_Graphics_SDK_3_01_00_06/GFX_Linux_KM/services=
4/3rdparty/bufferclass_ti/bc_cat.o] Error 1
| make[2]: *** =
[/tool/overo-oe/tmp/work/beagleboard-angstrom-linux-gnueabi/omap3-sgx-modu=
les-1.4.14.2616-r51b/OMAP35x_Graphics_SDK_3_01_00_06/GFX_Linux_KM/services=
4/3rdparty/bufferclass_ti] Error 2
| make[1]: *** =
[_module_/tool/overo-oe/tmp/work/beagleboard-angstrom-linux-gnueabi/omap3-=
sgx-modules-1.4.14.2616-r51b/OMAP35x_Graphics_SDK_3_01_00_06/GFX_Linux_KM]=
 Error 2
| make[1]: Leaving directory =
`/tool/overo-oe/tmp/staging/beagleboard-angstrom-linux-gnueabi/kernel'
| make: *** [all] Error 2
| FATAL: oe_runmake failed
NOTE: Task failed: =
/tool/overo-oe/tmp/work/beagleboard-angstrom-linux-gnueabi/omap3-sgx-modul=
es-1.4.14.2616-r51b/temp/log.do_compile.29401
ERROR: TaskFailed event exception, aborting
ERROR: Build of =
/tool/overo-oe/user.collection/recipes/powervr-drivers/omap3-sgx-modules_1=
.4.14.2616.bb do_compile failed
ERROR: Task 916 =
(/tool/overo-oe/user.collection/recipes/powervr-drivers/omap3-sgx-modules_=
1.4.14.2616.bb, do_compile) failed
NOTE: Waiting for 1 active tasks to finish
NOTE: 1: =
/tool/overo-oe/user.collection/recipes/powervr-drivers/libgles-omap3_3.01.=
00.06.bb, do_configure (28495)
NOTE: Tasks Summary: Attempted 3201 tasks of which 3189 didn't need to =
be rerun and 1 failed.
ERROR: =
'/tool/overo-oe/user.collection/recipes/powervr-drivers/omap3-sgx-modules_=
1.4.14.2616.bb' failed

Best regards,

Elvis Dowson







