Received: from llsa987-a03.servidoresdns.net ([82.223.190.28])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jaume@fqingenieria.es>) id 1PG9br-0005Ua-EK
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Nov 2010 13:17:05 +0100
Received: from [192.168.1.22] (ip24258.vig.altecom.net [212.121.242.58])
	by smtp-03.servidoresdns.net (Postfix) with ESMTPA id 3ADC5503D6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Nov 2010 13:16:03 +0100 (CET)
Message-ID: <4CDA8DB9.4060002@fqingenieria.es>
Date: Wed, 10 Nov 2010 13:19:05 +0100
From: Jaume Ribot <jaume@fqingenieria.es>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-GB;
	rv:1.9.2.12) Gecko/20101027 Lightning/1.0b2 Thunderbird/3.1.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1270558697-19222-1-git-send-email-mchazaux@adeneo-embedded.com>
	<n2kbc36f8ed1004160804j3610d311k55c328811e1657e2@mail.gmail.com>
In-Reply-To: <n2kbc36f8ed1004160804j3610d311k55c328811e1657e2@mail.gmail.com>
X-SA-Exim-Connect-IP: 82.223.190.28
X-SA-Exim-Mail-From: jaume@fqingenieria.es
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL, BAYES_00, UPPERCASE_50_75
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] Add Freescale i.MX25 3stack support
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
X-List-Received-Date: Wed, 10 Nov 2010 12:17:05 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi,

It seems a patch have not been applied (conf/machine/mx25-3stack.conf )

Any reason for that?


On 16/04/2010 17:04, Mickael Chazaux wrote:
> 2010/4/6 Micka=C3=ABl Chazaux<mchazaux@adeneo-embedded.com>:
>> From: Micka=C3=ABl CHAZAUX<mchazaux@adeneo-embedded.com>
>>
>> This patch adds support for the i.MX25 3Stack platform.
>>         It is based on the patches released by Freescale as
>>         part of LTIB.
>> ---
>>   conf/machine/mx25-3stack.conf                    |   23 +
>>   recipes/linux/linux-2.6.31/mx25-3stack/defconfig | 1725 ++++++++++++=
++++++++++
>>   recipes/linux/linux_2.6.31.bb                    |    9 +
>>   recipes/u-boot/u-boot_2009.08.bb                 |    7 +
>>   4 files changed, 1764 insertions(+), 0 deletions(-)
>>   create mode 100644 conf/machine/mx25-3stack.conf
>>   create mode 100644 recipes/linux/linux-2.6.31/mx25-3stack/defconfig
>>
>> diff --git a/conf/machine/mx25-3stack.conf b/conf/machine/mx25-3stack.=
conf
>> new file mode 100644
>> index 0000000..89b12a5
>> --- /dev/null
>> +++ b/conf/machine/mx25-3stack.conf
>> @@ -0,0 +1,23 @@
>> +#@TYPE: Machine
>> +#@Name: Freescale i.MX25_3stack
>> +#@DESCRIPTION: Machine configuration for Freescale i.MX25_3stack
>> +#@Homepage: http://www.freescale.com/webapp/sps/site/prod_summary.jsp=
?code=3DIMX25PDK&fsrch=3D1
>> +
>> +TARGET_ARCH =3D "arm"
>> +
>> +MACHINE_FEATURES =3D "kernel26 apm alsa ext2 usbhost usbgadget touchs=
creen"
>> +
>> +GUI_MACHINE_CLASS =3D "smallscreen"
>> +
>> +PREFERRED_PROVIDER_virtual/kernel =3D "linux"
>> +PREFERRED_PROVIDER_virtual/bootloader =3D "u-boot"
>> +UBOOT_MACHINE=3D"mx25_3stack_config"
>> +
>> +UBOOT_ENTRYPOINT =3D "0x80008000"
>> +UBOOT_LOADADDRESS =3D "0x80008000"
>> +KERNEL_IMAGETYPE =3D "uImage"
>> +
>> +require conf/machine/include/tune-arm926ejs.inc
>> +
>> +SERIAL_CONSOLE =3D "115200 ttymxc0"
>> +
>> diff --git a/recipes/linux/linux-2.6.31/mx25-3stack/defconfig b/recipe=
s/linux/linux-2.6.31/mx25-3stack/defconfig
>> new file mode 100644
>> index 0000000..c1e08fd
>> --- /dev/null
>> +++ b/recipes/linux/linux-2.6.31/mx25-3stack/defconfig
>> @@ -0,0 +1,1725 @@
>> +#
>> +# Automatically generated make config: don't edit
>> +# Linux kernel version: 2.6.28
>> +# Mon Mar 15 10:11:06 2010
>> +#
>> +CONFIG_ARM=3Dy
>> +CONFIG_SYS_SUPPORTS_APM_EMULATION=3Dy
>> +# CONFIG_GENERIC_GPIO is not set
>> +CONFIG_GENERIC_TIME=3Dy
>> +CONFIG_GENERIC_CLOCKEVENTS=3Dy
>> +CONFIG_MMU=3Dy
>> +# CONFIG_NO_IOPORT is not set
>> +CONFIG_GENERIC_HARDIRQS=3Dy
>> +CONFIG_STACKTRACE_SUPPORT=3Dy
>> +CONFIG_HAVE_LATENCYTOP_SUPPORT=3Dy
>> +CONFIG_LOCKDEP_SUPPORT=3Dy
>> +CONFIG_TRACE_IRQFLAGS_SUPPORT=3Dy
>> +CONFIG_HARDIRQS_SW_RESEND=3Dy
>> +CONFIG_GENERIC_IRQ_PROBE=3Dy
>> +CONFIG_RWSEM_GENERIC_SPINLOCK=3Dy
>> +# CONFIG_ARCH_HAS_ILOG2_U32 is not set
>> +# CONFIG_ARCH_HAS_ILOG2_U64 is not set
>> +CONFIG_GENERIC_HWEIGHT=3Dy
>> +CONFIG_GENERIC_CALIBRATE_DELAY=3Dy
>> +CONFIG_ZONE_DMA=3Dy
>> +CONFIG_ARCH_MTD_XIP=3Dy
>> +CONFIG_GENERIC_HARDIRQS_NO__DO_IRQ=3Dy
>> +CONFIG_VECTORS_BASE=3D0xffff0000
>> +CONFIG_DEFCONFIG_LIST=3D"/lib/modules/$UNAME_RELEASE/.config"
>> +
>> +#
>> +# General setup
>> +#
>> +CONFIG_EXPERIMENTAL=3Dy
>> +CONFIG_BROKEN_ON_SMP=3Dy
>> +CONFIG_LOCK_KERNEL=3Dy
>> +CONFIG_INIT_ENV_ARG_LIMIT=3D32
>> +CONFIG_LOCALVERSION=3D""
>> +CONFIG_LOCALVERSION_AUTO=3Dy
>> +CONFIG_SWAP=3Dy
>> +CONFIG_SYSVIPC=3Dy
>> +CONFIG_SYSVIPC_SYSCTL=3Dy
>> +# CONFIG_POSIX_MQUEUE is not set
>> +# CONFIG_BSD_PROCESS_ACCT is not set
>> +# CONFIG_TASKSTATS is not set
>> +# CONFIG_AUDIT is not set
>> +CONFIG_IKCONFIG=3Dy
>> +CONFIG_IKCONFIG_PROC=3Dy
>> +CONFIG_LOG_BUF_SHIFT=3D14
>> +# CONFIG_CGROUPS is not set
>> +# CONFIG_GROUP_SCHED is not set
>> +CONFIG_SYSFS_DEPRECATED=3Dy
>> +CONFIG_SYSFS_DEPRECATED_V2=3Dy
>> +# CONFIG_RELAY is not set
>> +# CONFIG_NAMESPACES is not set
>> +# CONFIG_BLK_DEV_INITRD is not set
>> +CONFIG_CC_OPTIMIZE_FOR_SIZE=3Dy
>> +CONFIG_SYSCTL=3Dy
>> +CONFIG_EMBEDDED=3Dy
>> +CONFIG_UID16=3Dy
>> +CONFIG_SYSCTL_SYSCALL=3Dy
>> +CONFIG_KALLSYMS=3Dy
>> +# CONFIG_KALLSYMS_EXTRA_PASS is not set
>> +CONFIG_HOTPLUG=3Dy
>> +CONFIG_PRINTK=3Dy
>> +CONFIG_BUG=3Dy
>> +CONFIG_ELF_CORE=3Dy
>> +CONFIG_COMPAT_BRK=3Dy
>> +CONFIG_BASE_FULL=3Dy
>> +CONFIG_FUTEX=3Dy
>> +CONFIG_ANON_INODES=3Dy
>> +CONFIG_EPOLL=3Dy
>> +CONFIG_SIGNALFD=3Dy
>> +CONFIG_TIMERFD=3Dy
>> +CONFIG_EVENTFD=3Dy
>> +CONFIG_SHMEM=3Dy
>> +CONFIG_AIO=3Dy
>> +CONFIG_VM_EVENT_COUNTERS=3Dy
>> +CONFIG_SLAB=3Dy
>> +# CONFIG_SLUB is not set
>> +# CONFIG_SLOB is not set
>> +CONFIG_PROFILING=3Dy
>> +# CONFIG_MARKERS is not set
>> +CONFIG_OPROFILE=3Dy
>> +CONFIG_HAVE_OPROFILE=3Dy
>> +# CONFIG_KPROBES is not set
>> +CONFIG_HAVE_KPROBES=3Dy
>> +CONFIG_HAVE_KRETPROBES=3Dy
>> +CONFIG_HAVE_GENERIC_DMA_COHERENT=3Dy
>> +CONFIG_SLABINFO=3Dy
>> +CONFIG_RT_MUTEXES=3Dy
>> +# CONFIG_TINY_SHMEM is not set
>> +CONFIG_BASE_SMALL=3D0
>> +CONFIG_MODULES=3Dy
>> +# CONFIG_MODULE_FORCE_LOAD is not set
>> +CONFIG_MODULE_UNLOAD=3Dy
>> +CONFIG_MODULE_FORCE_UNLOAD=3Dy
>> +CONFIG_MODVERSIONS=3Dy
>> +# CONFIG_MODULE_SRCVERSION_ALL is not set
>> +CONFIG_KMOD=3Dy
>> +CONFIG_BLOCK=3Dy
>> +# CONFIG_LBD is not set
>> +# CONFIG_BLK_DEV_IO_TRACE is not set
>> +# CONFIG_LSF is not set
>> +# CONFIG_BLK_DEV_BSG is not set
>> +# CONFIG_BLK_DEV_INTEGRITY is not set
>> +
>> +#
>> +# IO Schedulers
>> +#
>> +CONFIG_IOSCHED_NOOP=3Dy
>> +CONFIG_IOSCHED_AS=3Dy
>> +CONFIG_IOSCHED_DEADLINE=3Dy
>> +CONFIG_IOSCHED_CFQ=3Dy
>> +# CONFIG_DEFAULT_AS is not set
>> +# CONFIG_DEFAULT_DEADLINE is not set
>> +CONFIG_DEFAULT_CFQ=3Dy
>> +# CONFIG_DEFAULT_NOOP is not set
>> +CONFIG_DEFAULT_IOSCHED=3D"cfq"
>> +CONFIG_CLASSIC_RCU=3Dy
>> +CONFIG_FREEZER=3Dy
>> +
>> +#
>> +# System Type
>> +#
>> +# CONFIG_ARCH_AAEC2000 is not set
>> +# CONFIG_ARCH_INTEGRATOR is not set
>> +# CONFIG_ARCH_REALVIEW is not set
>> +# CONFIG_ARCH_VERSATILE is not set
>> +# CONFIG_ARCH_AT91 is not set
>> +# CONFIG_ARCH_CLPS7500 is not set
>> +# CONFIG_ARCH_CLPS711X is not set
>> +# CONFIG_ARCH_EBSA110 is not set
>> +# CONFIG_ARCH_EP93XX is not set
>> +# CONFIG_ARCH_FOOTBRIDGE is not set
>> +# CONFIG_ARCH_NETX is not set
>> +# CONFIG_ARCH_H720X is not set
>> +# CONFIG_ARCH_IMX is not set
>> +# CONFIG_ARCH_IOP13XX is not set
>> +# CONFIG_ARCH_IOP32X is not set
>> +# CONFIG_ARCH_IOP33X is not set
>> +# CONFIG_ARCH_IXP23XX is not set
>> +# CONFIG_ARCH_IXP2000 is not set
>> +# CONFIG_ARCH_IXP4XX is not set
>> +# CONFIG_ARCH_L7200 is not set
>> +# CONFIG_ARCH_KIRKWOOD is not set
>> +# CONFIG_ARCH_KS8695 is not set
>> +# CONFIG_ARCH_NS9XXX is not set
>> +# CONFIG_ARCH_LOKI is not set
>> +# CONFIG_ARCH_MV78XX0 is not set
>> +CONFIG_ARCH_MXC=3Dy
>> +# CONFIG_ARCH_ORION5X is not set
>> +# CONFIG_ARCH_PNX4008 is not set
>> +# CONFIG_ARCH_PXA is not set
>> +# CONFIG_ARCH_RPC is not set
>> +# CONFIG_ARCH_SA1100 is not set
>> +# CONFIG_ARCH_S3C2410 is not set
>> +# CONFIG_ARCH_SHARK is not set
>> +# CONFIG_ARCH_LH7A40X is not set
>> +# CONFIG_ARCH_DAVINCI is not set
>> +# CONFIG_ARCH_OMAP is not set
>> +# CONFIG_ARCH_MSM is not set
>> +# CONFIG_ARCH_STMP3XXX is not set
>> +
>> +#
>> +# Boot options
>> +#
>> +
>> +#
>> +# Power management
>> +#
>> +
>> +#
>> +# Freescale MXC Implementations
>> +#
>> +# CONFIG_ARCH_MX37 is not set
>> +# CONFIG_ARCH_MX35 is not set
>> +# CONFIG_ARCH_MX51 is not set
>> +# CONFIG_ARCH_MX3 is not set
>> +# CONFIG_ARCH_MX27 is not set
>> +CONFIG_ARCH_MX25=3Dy
>> +CONFIG_I2C_MXC_SELECT1=3Dy
>> +# CONFIG_I2C_MXC_SELECT2 is not set
>> +
>> +#
>> +# MX25 Options
>> +#
>> +CONFIG_MX25_OPTIONS=3Dy
>> +CONFIG_MACH_MX25_3DS=3Dy
>> +# CONFIG_MX25_DOZE_DURING_IDLE is not set
>> +CONFIG_MXC_SDMA_API=3Dy
>> +
>> +#
>> +# SDMA options
>> +#
>> +CONFIG_SDMA_IRAM=3Dy
>> +CONFIG_SDMA_IRAM_SIZE=3D0x1000
>> +CONFIG_ARCH_MXC_HAS_NFC_V2=3Dy
>> +CONFIG_ARCH_MXC_HAS_NFC_V2_1=3Dy
>> +
>> +#
>> +# Device options
>> +#
>> +# CONFIG_I2C_MXC_SELECT3 is not set
>> +# CONFIG_FLEXCAN_MXC_SELECT1 is not set
>> +CONFIG_DMA_ZONE_SIZE=3D24
>> +CONFIG_UTMI_MXC=3Dy
>> +CONFIG_UTMI_MXC_OTG=3Dm
>> +# CONFIG_MXC_PWM is not set
>> +
>> +#
>> +# Processor Type
>> +#
>> +CONFIG_CPU_32=3Dy
>> +CONFIG_CPU_ARM926T=3Dy
>> +# CONFIG_CPU_V6 is not set
>> +# CONFIG_CPU_V7 is not set
>> +CONFIG_CPU_32v5=3Dy
>> +CONFIG_CPU_ABRT_EV5TJ=3Dy
>> +CONFIG_CPU_PABRT_NOIFAR=3Dy
>> +CONFIG_CPU_CACHE_VIVT=3Dy
>> +CONFIG_CPU_COPY_V4WB=3Dy
>> +CONFIG_CPU_TLB_V4WBI=3Dy
>> +CONFIG_CPU_CP15=3Dy
>> +CONFIG_CPU_CP15_MMU=3Dy
>> +
>> +#
>> +# Processor Features
>> +#
>> +CONFIG_ARM_THUMB=3Dy
>> +# CONFIG_CPU_ICACHE_DISABLE is not set
>> +# CONFIG_CPU_DCACHE_DISABLE is not set
>> +# CONFIG_CPU_DCACHE_WRITETHROUGH is not set
>> +# CONFIG_CPU_CACHE_ROUND_ROBIN is not set
>> +# CONFIG_OUTER_CACHE is not set
>> +
>> +#
>> +# Bus support
>> +#
>> +# CONFIG_PCI_SYSCALL is not set
>> +# CONFIG_ARCH_SUPPORTS_MSI is not set
>> +# CONFIG_PCCARD is not set
>> +
>> +#
>> +# Kernel Features
>> +#
>> +CONFIG_TICK_ONESHOT=3Dy
>> +CONFIG_NO_HZ=3Dy
>> +CONFIG_HIGH_RES_TIMERS=3Dy
>> +CONFIG_GENERIC_CLOCKEVENTS_BUILD=3Dy
>> +CONFIG_VMSPLIT_3G=3Dy
>> +# CONFIG_VMSPLIT_2G is not set
>> +# CONFIG_VMSPLIT_1G is not set
>> +CONFIG_PAGE_OFFSET=3D0xC0000000
>> +CONFIG_PREEMPT=3Dy
>> +CONFIG_HZ=3D100
>> +CONFIG_AEABI=3Dy
>> +# CONFIG_OABI_COMPAT is not set
>> +CONFIG_ARCH_FLATMEM_HAS_HOLES=3Dy
>> +# CONFIG_ARCH_SPARSEMEM_DEFAULT is not set
>> +# CONFIG_ARCH_SELECT_MEMORY_MODEL is not set
>> +CONFIG_SELECT_MEMORY_MODEL=3Dy
>> +CONFIG_FLATMEM_MANUAL=3Dy
>> +# CONFIG_DISCONTIGMEM_MANUAL is not set
>> +# CONFIG_SPARSEMEM_MANUAL is not set
>> +CONFIG_FLATMEM=3Dy
>> +CONFIG_FLAT_NODE_MEM_MAP=3Dy
>> +CONFIG_PAGEFLAGS_EXTENDED=3Dy
>> +CONFIG_SPLIT_PTLOCK_CPUS=3D4096
>> +# CONFIG_RESOURCES_64BIT is not set
>> +# CONFIG_PHYS_ADDR_T_64BIT is not set
>> +CONFIG_ZONE_DMA_FLAG=3D1
>> +CONFIG_BOUNCE=3Dy
>> +CONFIG_VIRT_TO_BUS=3Dy
>> +CONFIG_UNEVICTABLE_LRU=3Dy
>> +# CONFIG_LEDS is not set
>> +CONFIG_ALIGNMENT_TRAP=3Dy
>> +
>> +#
>> +# Boot options
>> +#
>> +CONFIG_ZBOOT_ROM_TEXT=3D0x0
>> +CONFIG_ZBOOT_ROM_BSS=3D0x0
>> +CONFIG_CMDLINE=3D"noinitrd console=3Dttymxc0,115200 root=3D/dev/mtdbl=
ock2 rw rootfstype=3Djffs2 ip=3Doff"
>> +# CONFIG_XIP_KERNEL is not set
>> +# CONFIG_KEXEC is not set
>> +
>> +#
>> +# CPU Power Management
>> +#
>> +CONFIG_CPU_FREQ=3Dy
>> +CONFIG_CPU_FREQ_TABLE=3Dy
>> +# CONFIG_CPU_FREQ_DEBUG is not set
>> +CONFIG_CPU_FREQ_STAT=3Dy
>> +# CONFIG_CPU_FREQ_STAT_DETAILS is not set
>> +# CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE is not set
>> +# CONFIG_CPU_FREQ_DEFAULT_GOV_POWERSAVE is not set
>> +CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE=3Dy
>> +# CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND is not set
>> +# CONFIG_CPU_FREQ_DEFAULT_GOV_CONSERVATIVE is not set
>> +CONFIG_CPU_FREQ_GOV_PERFORMANCE=3Dy
>> +CONFIG_CPU_FREQ_GOV_POWERSAVE=3Dy
>> +CONFIG_CPU_FREQ_GOV_USERSPACE=3Dy
>> +# CONFIG_CPU_FREQ_GOV_ONDEMAND is not set
>> +# CONFIG_CPU_FREQ_GOV_CONSERVATIVE is not set
>> +CONFIG_CPU_FREQ_IMX=3Dy
>> +# CONFIG_CPU_IDLE is not set
>> +
>> +#
>> +# Floating point emulation
>> +#
>> +
>> +#
>> +# At least one emulation must be selected
>> +#
>> +# CONFIG_VFP is not set
>> +
>> +#
>> +# Userspace binary formats
>> +#
>> +CONFIG_BINFMT_ELF=3Dy
>> +# CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
>> +CONFIG_HAVE_AOUT=3Dy
>> +# CONFIG_BINFMT_AOUT is not set
>> +# CONFIG_BINFMT_MISC is not set
>> +
>> +#
>> +# Power management options
>> +#
>> +CONFIG_PM=3Dy
>> +# CONFIG_PM_DEBUG is not set
>> +CONFIG_PM_SLEEP=3Dy
>> +CONFIG_SUSPEND=3Dy
>> +CONFIG_SUSPEND_FREEZER=3Dy
>> +# CONFIG_APM_EMULATION is not set
>> +CONFIG_ARCH_SUSPEND_POSSIBLE=3Dy
>> +CONFIG_NET=3Dy
>> +
>> +#
>> +# Networking options
>> +#
>> +CONFIG_PACKET=3Dy
>> +CONFIG_PACKET_MMAP=3Dy
>> +CONFIG_UNIX=3Dy
>> +CONFIG_XFRM=3Dy
>> +# CONFIG_XFRM_USER is not set
>> +# CONFIG_XFRM_SUB_POLICY is not set
>> +# CONFIG_XFRM_MIGRATE is not set
>> +# CONFIG_XFRM_STATISTICS is not set
>> +# CONFIG_NET_KEY is not set
>> +CONFIG_INET=3Dy
>> +CONFIG_IP_MULTICAST=3Dy
>> +# CONFIG_IP_ADVANCED_ROUTER is not set
>> +CONFIG_IP_FIB_HASH=3Dy
>> +CONFIG_IP_PNP=3Dy
>> +CONFIG_IP_PNP_DHCP=3Dy
>> +CONFIG_IP_PNP_BOOTP=3Dy
>> +# CONFIG_IP_PNP_RARP is not set
>> +# CONFIG_NET_IPIP is not set
>> +# CONFIG_NET_IPGRE is not set
>> +# CONFIG_IP_MROUTE is not set
>> +# CONFIG_ARPD is not set
>> +# CONFIG_SYN_COOKIES is not set
>> +# CONFIG_INET_AH is not set
>> +# CONFIG_INET_ESP is not set
>> +# CONFIG_INET_IPCOMP is not set
>> +# CONFIG_INET_XFRM_TUNNEL is not set
>> +# CONFIG_INET_TUNNEL is not set
>> +CONFIG_INET_XFRM_MODE_TRANSPORT=3Dy
>> +CONFIG_INET_XFRM_MODE_TUNNEL=3Dy
>> +CONFIG_INET_XFRM_MODE_BEET=3Dy
>> +# CONFIG_INET_LRO is not set
>> +CONFIG_INET_DIAG=3Dy
>> +CONFIG_INET_TCP_DIAG=3Dy
>> +# CONFIG_TCP_CONG_ADVANCED is not set
>> +CONFIG_TCP_CONG_CUBIC=3Dy
>> +CONFIG_DEFAULT_TCP_CONG=3D"cubic"
>> +# CONFIG_TCP_MD5SIG is not set
>> +# CONFIG_IPV6 is not set
>> +# CONFIG_NETWORK_SECMARK is not set
>> +# CONFIG_NETFILTER is not set
>> +# CONFIG_IP_DCCP is not set
>> +# CONFIG_IP_SCTP is not set
>> +# CONFIG_TIPC is not set
>> +# CONFIG_ATM is not set
>> +# CONFIG_BRIDGE is not set
>> +# CONFIG_NET_DSA is not set
>> +# CONFIG_VLAN_8021Q is not set
>> +# CONFIG_DECNET is not set
>> +# CONFIG_LLC2 is not set
>> +# CONFIG_IPX is not set
>> +# CONFIG_ATALK is not set
>> +# CONFIG_X25 is not set
>> +# CONFIG_LAPB is not set
>> +# CONFIG_ECONET is not set
>> +# CONFIG_WAN_ROUTER is not set
>> +# CONFIG_NET_SCHED is not set
>> +
>> +#
>> +# Network testing
>> +#
>> +# CONFIG_NET_PKTGEN is not set
>> +# CONFIG_HAMRADIO is not set
>> +CONFIG_CAN=3Dy
>> +CONFIG_CAN_RAW=3Dy
>> +# CONFIG_CAN_BCM is not set
>> +
>> +#
>> +# CAN Device Drivers
>> +#
>> +# CONFIG_CAN_VCAN is not set
>> +# CONFIG_CAN_DEBUG_DEVICES is not set
>> +CONFIG_CAN_FLEXCAN=3Dy
>> +CONFIG_IRDA=3Dm
>> +
>> +#
>> +# IrDA protocols
>> +#
>> +CONFIG_IRLAN=3Dm
>> +CONFIG_IRNET=3Dm
>> +CONFIG_IRCOMM=3Dm
>> +# CONFIG_IRDA_ULTRA is not set
>> +
>> +#
>> +# IrDA options
>> +#
>> +CONFIG_IRDA_CACHE_LAST_LSAP=3Dy
>> +CONFIG_IRDA_FAST_RR=3Dy
>> +# CONFIG_IRDA_DEBUG is not set
>> +
>> +#
>> +# Infrared-port device drivers
>> +#
>> +
>> +#
>> +# SIR device drivers
>> +#
>> +CONFIG_IRTTY_SIR=3Dm
>> +
>> +#
>> +# Dongle support
>> +#
>> +# CONFIG_DONGLE is not set
>> +# CONFIG_KINGSUN_DONGLE is not set
>> +# CONFIG_KSDAZZLE_DONGLE is not set
>> +# CONFIG_KS959_DONGLE is not set
>> +
>> +#
>> +# FIR device drivers
>> +#
>> +# CONFIG_USB_IRDA is not set
>> +# CONFIG_SIGMATEL_FIR is not set
>> +# CONFIG_MCS_FIR is not set
>> +# CONFIG_MXC_FIR is not set
>> +# CONFIG_BT is not set
>> +# CONFIG_AF_RXRPC is not set
>> +# CONFIG_PHONET is not set
>> +CONFIG_WIRELESS=3Dy
>> +# CONFIG_CFG80211 is not set
>> +CONFIG_WIRELESS_OLD_REGULATORY=3Dy
>> +CONFIG_WIRELESS_EXT=3Dy
>> +CONFIG_WIRELESS_EXT_SYSFS=3Dy
>> +# CONFIG_MAC80211 is not set
>> +CONFIG_IEEE80211=3Dy
>> +# CONFIG_IEEE80211_DEBUG is not set
>> +# CONFIG_IEEE80211_CRYPT_WEP is not set
>> +# CONFIG_IEEE80211_CRYPT_CCMP is not set
>> +# CONFIG_IEEE80211_CRYPT_TKIP is not set
>> +# CONFIG_RFKILL is not set
>> +# CONFIG_NET_9P is not set
>> +
>> +#
>> +# Device Drivers
>> +#
>> +
>> +#
>> +# Generic Driver Options
>> +#
>> +CONFIG_UEVENT_HELPER_PATH=3D"/sbin/hotplug"
>> +CONFIG_STANDALONE=3Dy
>> +CONFIG_PREVENT_FIRMWARE_BUILD=3Dy
>> +CONFIG_FW_LOADER=3Dy
>> +CONFIG_FIRMWARE_IN_KERNEL=3Dy
>> +CONFIG_EXTRA_FIRMWARE=3D""
>> +# CONFIG_SYS_HYPERVISOR is not set
>> +CONFIG_CONNECTOR=3Dy
>> +CONFIG_PROC_EVENTS=3Dy
>> +CONFIG_MTD=3Dy
>> +# CONFIG_MTD_DEBUG is not set
>> +# CONFIG_MTD_CONCAT is not set
>> +CONFIG_MTD_PARTITIONS=3Dy
>> +CONFIG_MTD_REDBOOT_PARTS=3Dy
>> +CONFIG_MTD_REDBOOT_DIRECTORY_BLOCK=3D-1
>> +# CONFIG_MTD_REDBOOT_PARTS_UNALLOCATED is not set
>> +# CONFIG_MTD_REDBOOT_PARTS_READONLY is not set
>> +CONFIG_MTD_CMDLINE_PARTS=3Dy
>> +# CONFIG_MTD_AFS_PARTS is not set
>> +# CONFIG_MTD_AR7_PARTS is not set
>> +
>> +#
>> +# User Modules And Translation Layers
>> +#
>> +CONFIG_MTD_CHAR=3Dy
>> +CONFIG_MTD_BLKDEVS=3Dy
>> +CONFIG_MTD_BLOCK=3Dy
>> +# CONFIG_FTL is not set
>> +# CONFIG_NFTL is not set
>> +# CONFIG_INFTL is not set
>> +# CONFIG_RFD_FTL is not set
>> +# CONFIG_SSFDC is not set
>> +# CONFIG_MTD_OOPS is not set
>> +
>> +#
>> +# RAM/ROM/Flash chip drivers
>> +#
>> +CONFIG_MTD_CFI=3Dy
>> +# CONFIG_MTD_JEDECPROBE is not set
>> +CONFIG_MTD_GEN_PROBE=3Dy
>> +CONFIG_MTD_CFI_ADV_OPTIONS=3Dy
>> +CONFIG_MTD_CFI_NOSWAP=3Dy
>> +# CONFIG_MTD_CFI_BE_BYTE_SWAP is not set
>> +# CONFIG_MTD_CFI_LE_BYTE_SWAP is not set
>> +CONFIG_MTD_CFI_GEOMETRY=3Dy
>> +# CONFIG_MTD_MAP_BANK_WIDTH_1 is not set
>> +CONFIG_MTD_MAP_BANK_WIDTH_2=3Dy
>> +# CONFIG_MTD_MAP_BANK_WIDTH_4 is not set
>> +# CONFIG_MTD_MAP_BANK_WIDTH_8 is not set
>> +# CONFIG_MTD_MAP_BANK_WIDTH_16 is not set
>> +# CONFIG_MTD_MAP_BANK_WIDTH_32 is not set
>> +CONFIG_MTD_CFI_I1=3Dy
>> +# CONFIG_MTD_CFI_I2 is not set
>> +# CONFIG_MTD_CFI_I4 is not set
>> +# CONFIG_MTD_CFI_I8 is not set
>> +# CONFIG_MTD_OTP is not set
>> +# CONFIG_MTD_CFI_INTELEXT is not set
>> +CONFIG_MTD_CFI_AMDSTD=3Dy
>> +# CONFIG_MTD_CFI_STAA is not set
>> +CONFIG_MTD_CFI_UTIL=3Dy
>> +CONFIG_MTD_RAM=3Dy
>> +# CONFIG_MTD_ROM is not set
>> +# CONFIG_MTD_ABSENT is not set
>> +# CONFIG_MTD_XIP is not set
>> +
>> +#
>> +# Mapping drivers for chip access
>> +#
>> +# CONFIG_MTD_COMPLEX_MAPPINGS is not set
>> +# CONFIG_MTD_PHYSMAP is not set
>> +# CONFIG_MTD_ARM_INTEGRATOR is not set
>> +# CONFIG_MTD_PLATRAM is not set
>> +# CONFIG_MTD_MXC is not set
>> +
>> +#
>> +# Self-contained MTD device drivers
>> +#
>> +# CONFIG_MTD_DATAFLASH is not set
>> +# CONFIG_MTD_M25P80 is not set
>> +# CONFIG_MTD_SLRAM is not set
>> +# CONFIG_MTD_PHRAM is not set
>> +# CONFIG_MTD_MTDRAM is not set
>> +# CONFIG_MTD_BLOCK2MTD is not set
>> +
>> +#
>> +# Disk-On-Chip Device Drivers
>> +#
>> +# CONFIG_MTD_DOC2000 is not set
>> +# CONFIG_MTD_DOC2001 is not set
>> +# CONFIG_MTD_DOC2001PLUS is not set
>> +CONFIG_MTD_NAND=3Dy
>> +# CONFIG_MTD_NAND_VERIFY_WRITE is not set
>> +# CONFIG_MTD_NAND_ECC_SMC is not set
>> +# CONFIG_MTD_NAND_MUSEUM_IDS is not set
>> +CONFIG_MTD_NAND_IDS=3Dy
>> +# CONFIG_MTD_NAND_DISKONCHIP is not set
>> +# CONFIG_MTD_NAND_NANDSIM is not set
>> +# CONFIG_MTD_NAND_IMX_NFC is not set
>> +CONFIG_MTD_NAND_MXC_V2=3Dy
>> +# CONFIG_MTD_NAND_MXC_SWECC is not set
>> +# CONFIG_MTD_NAND_MXC_FORCE_CE is not set
>> +# CONFIG_MXC_NAND_LOW_LEVEL_ERASE is not set
>> +# CONFIG_MTD_NAND_PLATFORM is not set
>> +# CONFIG_MTD_ALAUDA is not set
>> +# CONFIG_MTD_ONENAND is not set
>> +
>> +#
>> +# UBI - Unsorted block images
>> +#
>> +# CONFIG_MTD_UBI is not set
>> +# CONFIG_PARPORT is not set
>> +CONFIG_BLK_DEV=3Dy
>> +# CONFIG_BLK_DEV_COW_COMMON is not set
>> +CONFIG_BLK_DEV_LOOP=3Dy
>> +# CONFIG_BLK_DEV_CRYPTOLOOP is not set
>> +# CONFIG_BLK_DEV_NBD is not set
>> +# CONFIG_BLK_DEV_UB is not set
>> +CONFIG_BLK_DEV_RAM=3Dy
>> +CONFIG_BLK_DEV_RAM_COUNT=3D16
>> +CONFIG_BLK_DEV_RAM_SIZE=3D16384
>> +# CONFIG_BLK_DEV_XIP is not set
>> +# CONFIG_CDROM_PKTCDVD is not set
>> +# CONFIG_ATA_OVER_ETH is not set
>> +CONFIG_MISC_DEVICES=3Dy
>> +# CONFIG_EEPROM_93CX6 is not set
>> +# CONFIG_ICS932S401 is not set
>> +# CONFIG_ENCLOSURE_SERVICES is not set
>> +# CONFIG_C2PORT is not set
>> +CONFIG_HAVE_IDE=3Dy
>> +# CONFIG_IDE is not set
>> +
>> +#
>> +# SCSI device support
>> +#
>> +# CONFIG_RAID_ATTRS is not set
>> +CONFIG_SCSI=3Dy
>> +CONFIG_SCSI_DMA=3Dy
>> +# CONFIG_SCSI_TGT is not set
>> +# CONFIG_SCSI_NETLINK is not set
>> +CONFIG_SCSI_PROC_FS=3Dy
>> +
>> +#
>> +# SCSI support type (disk, tape, CD-ROM)
>> +#
>> +CONFIG_BLK_DEV_SD=3Dy
>> +# CONFIG_CHR_DEV_ST is not set
>> +# CONFIG_CHR_DEV_OSST is not set
>> +# CONFIG_BLK_DEV_SR is not set
>> +# CONFIG_CHR_DEV_SG is not set
>> +# CONFIG_CHR_DEV_SCH is not set
>> +
>> +#
>> +# Some SCSI devices (e.g. CD jukebox) support multiple LUNs
>> +#
>> +CONFIG_SCSI_MULTI_LUN=3Dy
>> +# CONFIG_SCSI_CONSTANTS is not set
>> +# CONFIG_SCSI_LOGGING is not set
>> +# CONFIG_SCSI_SCAN_ASYNC is not set
>> +CONFIG_SCSI_WAIT_SCAN=3Dm
>> +
>> +#
>> +# SCSI Transports
>> +#
>> +# CONFIG_SCSI_SPI_ATTRS is not set
>> +# CONFIG_SCSI_FC_ATTRS is not set
>> +# CONFIG_SCSI_ISCSI_ATTRS is not set
>> +# CONFIG_SCSI_SAS_LIBSAS is not set
>> +# CONFIG_SCSI_SRP_ATTRS is not set
>> +CONFIG_SCSI_LOWLEVEL=3Dy
>> +# CONFIG_ISCSI_TCP is not set
>> +# CONFIG_SCSI_DEBUG is not set
>> +# CONFIG_SCSI_DH is not set
>> +# CONFIG_ATA is not set
>> +# CONFIG_MD is not set
>> +CONFIG_NETDEVICES=3Dy
>> +# CONFIG_DUMMY is not set
>> +# CONFIG_BONDING is not set
>> +# CONFIG_MACVLAN is not set
>> +# CONFIG_EQUALIZER is not set
>> +# CONFIG_TUN is not set
>> +# CONFIG_VETH is not set
>> +# CONFIG_PHYLIB is not set
>> +CONFIG_NET_ETHERNET=3Dy
>> +CONFIG_MII=3Dy
>> +# CONFIG_AX88796 is not set
>> +# CONFIG_SMC91X is not set
>> +# CONFIG_DM9000 is not set
>> +# CONFIG_ENC28J60 is not set
>> +# CONFIG_SMC911X is not set
>> +CONFIG_SMSC911X=3Dy
>> +# CONFIG_IBM_NEW_EMAC_ZMII is not set
>> +# CONFIG_IBM_NEW_EMAC_RGMII is not set
>> +# CONFIG_IBM_NEW_EMAC_TAH is not set
>> +# CONFIG_IBM_NEW_EMAC_EMAC4 is not set
>> +# CONFIG_IBM_NEW_EMAC_NO_FLOW_CTRL is not set
>> +# CONFIG_IBM_NEW_EMAC_MAL_CLR_ICINTSTAT is not set
>> +# CONFIG_IBM_NEW_EMAC_MAL_COMMON_ERR is not set
>> +# CONFIG_B44 is not set
>> +# CONFIG_CS89x0 is not set
>> +CONFIG_FEC=3Dm
>> +# CONFIG_FEC2 is not set
>> +# CONFIG_NETDEV_1000 is not set
>> +# CONFIG_NETDEV_10000 is not set
>> +
>> +#
>> +# Wireless LAN
>> +#
>> +# CONFIG_WLAN_PRE80211 is not set
>> +# CONFIG_WLAN_80211 is not set
>> +# CONFIG_IWLWIFI_LEDS is not set
>> +
>> +#
>> +# USB Network Adapters
>> +#
>> +# CONFIG_USB_CATC is not set
>> +# CONFIG_USB_KAWETH is not set
>> +# CONFIG_USB_PEGASUS is not set
>> +CONFIG_USB_RTL8150=3Dm
>> +CONFIG_USB_USBNET=3Dm
>> +CONFIG_USB_NET_AX8817X=3Dm
>> +CONFIG_USB_NET_CDCETHER=3Dm
>> +# CONFIG_USB_NET_DM9601 is not set
>> +# CONFIG_USB_NET_SMSC95XX is not set
>> +# CONFIG_USB_NET_GL620A is not set
>> +# CONFIG_USB_NET_NET1080 is not set
>> +# CONFIG_USB_NET_PLUSB is not set
>> +# CONFIG_USB_NET_MCS7830 is not set
>> +# CONFIG_USB_NET_RNDIS_HOST is not set
>> +# CONFIG_USB_NET_CDC_SUBSET is not set
>> +# CONFIG_USB_NET_ZAURUS is not set
>> +# CONFIG_WAN is not set
>> +CONFIG_PPP=3Dm
>> +# CONFIG_PPP_MULTILINK is not set
>> +# CONFIG_PPP_FILTER is not set
>> +CONFIG_PPP_ASYNC=3Dm
>> +CONFIG_PPP_SYNC_TTY=3Dm
>> +CONFIG_PPP_DEFLATE=3Dm
>> +# CONFIG_PPP_BSDCOMP is not set
>> +# CONFIG_PPP_MPPE is not set
>> +# CONFIG_PPPOE is not set
>> +# CONFIG_PPPOL2TP is not set
>> +# CONFIG_SLIP is not set
>> +CONFIG_SLHC=3Dm
>> +# CONFIG_NETCONSOLE is not set
>> +# CONFIG_NETPOLL is not set
>> +# CONFIG_NET_POLL_CONTROLLER is not set
>> +# CONFIG_ISDN is not set
>> +
>> +#
>> +# Input device support
>> +#
>> +CONFIG_INPUT=3Dy
>> +# CONFIG_INPUT_FF_MEMLESS is not set
>> +# CONFIG_INPUT_POLLDEV is not set
>> +
>> +#
>> +# Userland interfaces
>> +#
>> +# CONFIG_INPUT_MOUSEDEV is not set
>> +# CONFIG_INPUT_JOYDEV is not set
>> +CONFIG_INPUT_EVDEV=3Dy
>> +# CONFIG_INPUT_EVBUG is not set
>> +
>> +#
>> +# Input Device Drivers
>> +#
>> +CONFIG_INPUT_KEYBOARD=3Dy
>> +# CONFIG_KEYBOARD_ATKBD is not set
>> +# CONFIG_KEYBOARD_SUNKBD is not set
>> +# CONFIG_KEYBOARD_LKKBD is not set
>> +# CONFIG_KEYBOARD_XTKBD is not set
>> +# CONFIG_KEYBOARD_NEWTON is not set
>> +# CONFIG_KEYBOARD_STOWAWAY is not set
>> +CONFIG_KEYBOARD_MXC=3Dy
>> +# CONFIG_INPUT_MOUSE is not set
>> +# CONFIG_INPUT_JOYSTICK is not set
>> +# CONFIG_INPUT_TABLET is not set
>> +CONFIG_INPUT_TOUCHSCREEN=3Dy
>> +# CONFIG_TOUCHSCREEN_ADS7846 is not set
>> +# CONFIG_TOUCHSCREEN_FUJITSU is not set
>> +# CONFIG_TOUCHSCREEN_GUNZE is not set
>> +# CONFIG_TOUCHSCREEN_ELO is not set
>> +# CONFIG_TOUCHSCREEN_MTOUCH is not set
>> +# CONFIG_TOUCHSCREEN_INEXIO is not set
>> +# CONFIG_TOUCHSCREEN_MK712 is not set
>> +CONFIG_TOUCHSCREEN_IMX_ADC=3Dy
>> +# CONFIG_TOUCHSCREEN_PENMOUNT is not set
>> +# CONFIG_TOUCHSCREEN_TOUCHRIGHT is not set
>> +# CONFIG_TOUCHSCREEN_TOUCHWIN is not set
>> +# CONFIG_TOUCHSCREEN_USB_COMPOSITE is not set
>> +# CONFIG_TOUCHSCREEN_TOUCHIT213 is not set
>> +# CONFIG_INPUT_MISC is not set
>> +
>> +#
>> +# Hardware I/O ports
>> +#
>> +# CONFIG_SERIO is not set
>> +# CONFIG_GAMEPORT is not set
>> +
>> +#
>> +# Character devices
>> +#
>> +CONFIG_VT=3Dy
>> +CONFIG_CONSOLE_TRANSLATIONS=3Dy
>> +CONFIG_VT_CONSOLE=3Dy
>> +CONFIG_HW_CONSOLE=3Dy
>> +# CONFIG_VT_HW_CONSOLE_BINDING is not set
>> +CONFIG_DEVKMEM=3Dy
>> +# CONFIG_SERIAL_NONSTANDARD is not set
>> +CONFIG_MXC_IIM=3Dy
>> +CONFIG_IMX_SIM=3Dm
>> +
>> +#
>> +# Serial drivers
>> +#
>> +# CONFIG_SERIAL_8250 is not set
>> +
>> +#
>> +# Non-8250 serial port support
>> +#
>> +CONFIG_SERIAL_MXC=3Dy
>> +CONFIG_SERIAL_MXC_CONSOLE=3Dy
>> +# CONFIG_SERIAL_IMX is not set
>> +CONFIG_SERIAL_CORE=3Dy
>> +CONFIG_SERIAL_CORE_CONSOLE=3Dy
>> +CONFIG_UNIX98_PTYS=3Dy
>> +CONFIG_LEGACY_PTYS=3Dy
>> +CONFIG_LEGACY_PTY_COUNT=3D256
>> +# CONFIG_IPMI_HANDLER is not set
>> +CONFIG_HW_RANDOM=3Dy
>> +# CONFIG_NVRAM is not set
>> +# CONFIG_R3964 is not set
>> +# CONFIG_RAW_DRIVER is not set
>> +# CONFIG_TCG_TPM is not set
>> +CONFIG_I2C=3Dy
>> +CONFIG_I2C_BOARDINFO=3Dy
>> +# CONFIG_I2C_CHARDEV is not set
>> +CONFIG_I2C_HELPER_AUTO=3Dy
>> +
>> +#
>> +# I2C Hardware Bus support
>> +#
>> +
>> +#
>> +# I2C system bus drivers (mostly embedded / system-on-chip)
>> +#
>> +CONFIG_I2C_MXC=3Dy
>> +# CONFIG_I2C_MXC_HS is not set
>> +# CONFIG_I2C_OCORES is not set
>> +# CONFIG_I2C_SIMTEC is not set
>> +
>> +#
>> +# External I2C/SMBus adapter drivers
>> +#
>> +# CONFIG_I2C_PARPORT_LIGHT is not set
>> +# CONFIG_I2C_TAOS_EVM is not set
>> +# CONFIG_I2C_TINY_USB is not set
>> +
>> +#
>> +# Other I2C/SMBus bus drivers
>> +#
>> +# CONFIG_I2C_PCA_PLATFORM is not set
>> +# CONFIG_I2C_STUB is not set
>> +
>> +#
>> +# Miscellaneous I2C Chip support
>> +#
>> +# CONFIG_DS1682 is not set
>> +# CONFIG_AT24 is not set
>> +# CONFIG_SENSORS_EEPROM is not set
>> +# CONFIG_SENSORS_PCF8574 is not set
>> +# CONFIG_PCF8575 is not set
>> +# CONFIG_SENSORS_PCA9539 is not set
>> +# CONFIG_SENSORS_PCF8591 is not set
>> +# CONFIG_SENSORS_MAX6875 is not set
>> +# CONFIG_SENSORS_TSL2550 is not set
>> +# CONFIG_I2C_DEBUG_CORE is not set
>> +# CONFIG_I2C_DEBUG_ALGO is not set
>> +# CONFIG_I2C_DEBUG_BUS is not set
>> +# CONFIG_I2C_DEBUG_CHIP is not set
>> +# CONFIG_I2C_SLAVE is not set
>> +CONFIG_SPI=3Dy
>> +CONFIG_SPI_MASTER=3Dy
>> +
>> +#
>> +# SPI Master Controller Drivers
>> +#
>> +CONFIG_SPI_BITBANG=3Dy
>> +CONFIG_SPI_MXC=3Dy
>> +# CONFIG_SPI_MXC_TEST_LOOPBACK is not set
>> +CONFIG_SPI_MXC_SELECT1=3Dy
>> +# CONFIG_SPI_MXC_SELECT2 is not set
>> +# CONFIG_SPI_MXC_SELECT3 is not set
>> +
>> +#
>> +# SPI Protocol Masters
>> +#
>> +# CONFIG_SPI_AT25 is not set
>> +# CONFIG_SPI_SPIDEV is not set
>> +# CONFIG_SPI_TLE62X0 is not set
>> +# CONFIG_W1 is not set
>> +# CONFIG_POWER_SUPPLY is not set
>> +# CONFIG_HWMON is not set
>> +# CONFIG_THERMAL is not set
>> +# CONFIG_THERMAL_HWMON is not set
>> +CONFIG_WATCHDOG=3Dy
>> +CONFIG_WATCHDOG_NOWAYOUT=3Dy
>> +
>> +#
>> +# Watchdog Device Drivers
>> +#
>> +# CONFIG_SOFT_WATCHDOG is not set
>> +# CONFIG_MXC_WATCHDOG is not set
>> +
>> +#
>> +# USB-based Watchdog Cards
>> +#
>> +# CONFIG_USBPCWATCHDOG is not set
>> +CONFIG_SSB_POSSIBLE=3Dy
>> +
>> +#
>> +# Sonics Silicon Backplane
>> +#
>> +# CONFIG_SSB is not set
>> +
>> +#
>> +# Multifunction device drivers
>> +#
>> +# CONFIG_MFD_CORE is not set
>> +# CONFIG_MFD_SM501 is not set
>> +# CONFIG_HTC_PASIC3 is not set
>> +# CONFIG_MFD_TMIO is not set
>> +# CONFIG_PMIC_DA903X is not set
>> +# CONFIG_MFD_WM8400 is not set
>> +# CONFIG_MFD_WM8350_I2C is not set
>> +
>> +#
>> +# Multimedia devices
>> +#
>> +
>> +#
>> +# Multimedia core support
>> +#
>> +CONFIG_VIDEO_DEV=3Dy
>> +CONFIG_VIDEO_V4L2_COMMON=3Dy
>> +CONFIG_VIDEO_ALLOW_V4L1=3Dy
>> +CONFIG_VIDEO_V4L1_COMPAT=3Dy
>> +# CONFIG_DVB_CORE is not set
>> +CONFIG_VIDEO_MEDIA=3Dy
>> +
>> +#
>> +# Multimedia drivers
>> +#
>> +# CONFIG_MEDIA_ATTACH is not set
>> +CONFIG_MEDIA_TUNER=3Dy
>> +# CONFIG_MEDIA_TUNER_CUSTOMIZE is not set
>> +CONFIG_MEDIA_TUNER_SIMPLE=3Dy
>> +CONFIG_MEDIA_TUNER_TDA8290=3Dy
>> +CONFIG_MEDIA_TUNER_TDA9887=3Dy
>> +CONFIG_MEDIA_TUNER_TEA5761=3Dy
>> +CONFIG_MEDIA_TUNER_TEA5767=3Dy
>> +CONFIG_MEDIA_TUNER_MT20XX=3Dy
>> +CONFIG_MEDIA_TUNER_XC2028=3Dy
>> +CONFIG_MEDIA_TUNER_XC5000=3Dy
>> +CONFIG_VIDEO_V4L2=3Dy
>> +CONFIG_VIDEO_V4L1=3Dy
>> +CONFIG_VIDEO_CAPTURE_DRIVERS=3Dy
>> +# CONFIG_VIDEO_ADV_DEBUG is not set
>> +# CONFIG_VIDEO_FIXED_MINOR_RANGES is not set
>> +CONFIG_VIDEO_HELPER_CHIPS_AUTO=3Dy
>> +# CONFIG_VIDEO_VIVI is not set
>> +CONFIG_VIDEO_MXC_CAMERA=3Dm
>> +
>> +#
>> +# MXC Camera/V4L2 PRP Features support
>> +#
>> +CONFIG_VIDEO_MXC_CSI_CAMERA=3Dm
>> +# CONFIG_MXC_CAMERA_MC521DA is not set
>> +# CONFIG_MXC_EMMA_CAMERA_MICRON111 is not set
>> +# CONFIG_MXC_CAMERA_OV2640_EMMA is not set
>> +# CONFIG_MXC_CAMERA_MICRON111 is not set
>> +CONFIG_MXC_CAMERA_OV2640=3Dm
>> +# CONFIG_MXC_CAMERA_OV3640 is not set
>> +# CONFIG_MXC_TVIN_ADV7180 is not set
>> +# CONFIG_VIDEO_MXC_OUTPUT is not set
>> +# CONFIG_VIDEO_MXC_OPL is not set
>> +# CONFIG_VIDEO_CPIA is not set
>> +# CONFIG_VIDEO_CPIA2 is not set
>> +# CONFIG_VIDEO_SAA5246A is not set
>> +# CONFIG_VIDEO_SAA5249 is not set
>> +# CONFIG_SOC_CAMERA is not set
>> +# CONFIG_V4L_USB_DRIVERS is not set
>> +CONFIG_RADIO_ADAPTERS=3Dy
>> +# CONFIG_USB_DSBR is not set
>> +# CONFIG_USB_SI470X is not set
>> +# CONFIG_USB_MR800 is not set
>> +CONFIG_DAB=3Dy
>> +# CONFIG_USB_DABUSB is not set
>> +
>> +#
>> +# Graphics support
>> +#
>> +# CONFIG_VGASTATE is not set
>> +# CONFIG_VIDEO_OUTPUT_CONTROL is not set
>> +CONFIG_FB=3Dy
>> +# CONFIG_FIRMWARE_EDID is not set
>> +# CONFIG_FB_DDC is not set
>> +# CONFIG_FB_BOOT_VESA_SUPPORT is not set
>> +CONFIG_FB_CFB_FILLRECT=3Dy
>> +CONFIG_FB_CFB_COPYAREA=3Dy
>> +CONFIG_FB_CFB_IMAGEBLIT=3Dy
>> +# CONFIG_FB_CFB_REV_PIXELS_IN_BYTE is not set
>> +# CONFIG_FB_SYS_FILLRECT is not set
>> +# CONFIG_FB_SYS_COPYAREA is not set
>> +# CONFIG_FB_SYS_IMAGEBLIT is not set
>> +# CONFIG_FB_FOREIGN_ENDIAN is not set
>> +# CONFIG_FB_SYS_FOPS is not set
>> +# CONFIG_FB_SVGALIB is not set
>> +# CONFIG_FB_MACMODES is not set
>> +# CONFIG_FB_BACKLIGHT is not set
>> +CONFIG_FB_MODE_HELPERS=3Dy
>> +# CONFIG_FB_TILEBLITTING is not set
>> +
>> +#
>> +# Frame buffer hardware drivers
>> +#
>> +CONFIG_FB_MXC=3Dy
>> +CONFIG_FB_MXC_SYNC_PANEL=3Dy
>> +# CONFIG_FB_MXC_EPSON_VGA_SYNC_PANEL is not set
>> +# CONFIG_FB_MXC_CLAA_WVGA_SYNC_PANEL is not set
>> +# CONFIG_FB_MXC_CH7026 is not set
>> +# CONFIG_FB_MXC_TVOUT is not set
>> +# CONFIG_FB_MXC_TVOUT_CH7024 is not set
>> +# CONFIG_FB_MXC_ASYNC_PANEL is not set
>> +# CONFIG_FB_UVESA is not set
>> +# CONFIG_FB_S1D13XXX is not set
>> +# CONFIG_FB_VIRTUAL is not set
>> +# CONFIG_FB_METRONOME is not set
>> +# CONFIG_FB_MB862XX is not set
>> +CONFIG_BACKLIGHT_LCD_SUPPORT=3Dy
>> +# CONFIG_LCD_CLASS_DEVICE is not set
>> +CONFIG_BACKLIGHT_CLASS_DEVICE=3Dy
>> +# CONFIG_BACKLIGHT_CORGI is not set
>> +CONFIG_BACKLIGHT_MXC=3Dy
>> +CONFIG_BACKLIGHT_MXC_LCDC=3Dy
>> +
>> +#
>> +# Display device support
>> +#
>> +# CONFIG_DISPLAY_SUPPORT is not set
>> +
>> +#
>> +# Console display driver support
>> +#
>> +# CONFIG_VGA_CONSOLE is not set
>> +CONFIG_DUMMY_CONSOLE=3Dy
>> +CONFIG_FRAMEBUFFER_CONSOLE=3Dy
>> +# CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY is not set
>> +# CONFIG_FRAMEBUFFER_CONSOLE_ROTATION is not set
>> +# CONFIG_FONTS is not set
>> +CONFIG_FONT_8x8=3Dy
>> +CONFIG_FONT_8x16=3Dy
>> +CONFIG_LOGO=3Dy
>> +# CONFIG_LOGO_LINUX_MONO is not set
>> +# CONFIG_LOGO_LINUX_VGA16 is not set
>> +CONFIG_LOGO_LINUX_CLUT224=3Dy
>> +CONFIG_SOUND=3Dy
>> +CONFIG_SOUND_OSS_CORE=3Dy
>> +CONFIG_SND=3Dy
>> +CONFIG_SND_TIMER=3Dy
>> +CONFIG_SND_PCM=3Dy
>> +# CONFIG_SND_SEQUENCER is not set
>> +CONFIG_SND_OSSEMUL=3Dy
>> +CONFIG_SND_MIXER_OSS=3Dy
>> +CONFIG_SND_PCM_OSS=3Dy
>> +CONFIG_SND_PCM_OSS_PLUGINS=3Dy
>> +# CONFIG_SND_DYNAMIC_MINORS is not set
>> +CONFIG_SND_SUPPORT_OLD_API=3Dy
>> +CONFIG_SND_VERBOSE_PROCFS=3Dy
>> +# CONFIG_SND_VERBOSE_PRINTK is not set
>> +# CONFIG_SND_DEBUG is not set
>> +CONFIG_SND_DRIVERS=3Dy
>> +# CONFIG_SND_DUMMY is not set
>> +# CONFIG_SND_MTPAV is not set
>> +# CONFIG_SND_SERIAL_U16550 is not set
>> +# CONFIG_SND_MPU401 is not set
>> +CONFIG_SND_ARM=3Dy
>> +# CONFIG_SND_MXC_SPDIF is not set
>> +CONFIG_SND_SPI=3Dy
>> +CONFIG_SND_USB=3Dy
>> +# CONFIG_SND_USB_AUDIO is not set
>> +# CONFIG_SND_USB_CAIAQ is not set
>> +CONFIG_SND_SOC=3Dy
>> +CONFIG_SND_MXC_SOC=3Dy
>> +CONFIG_SND_MXC_SOC_SSI=3Dy
>> +CONFIG_SND_MXC_SOC_ESAI=3Dm
>> +CONFIG_SND_MXC_SOC_IRAM=3Dy
>> +CONFIG_SND_SOC_IMX_3STACK_SGTL5000=3Dy
>> +# CONFIG_SND_SOC_IMX_3STACK_AK4647 is not set
>> +CONFIG_SND_SOC_IMX_3STACK_WM8580=3Dm
>> +CONFIG_SND_SOC_IMX_3STACK_AK5702=3Dm
>> +# CONFIG_SND_SOC_IMX_3STACK_BLUETOOTH is not set
>> +# CONFIG_SND_SOC_ALL_CODECS is not set
>> +CONFIG_SND_SOC_AK5702=3Dm
>> +CONFIG_SND_SOC_WM8580=3Dm
>> +CONFIG_SND_SOC_SGTL5000=3Dy
>> +# CONFIG_SOUND_PRIME is not set
>> +CONFIG_HID_SUPPORT=3Dy
>> +CONFIG_HID=3Dy
>> +# CONFIG_HID_DEBUG is not set
>> +# CONFIG_HIDRAW is not set
>> +
>> +#
>> +# USB Input Devices
>> +#
>> +CONFIG_USB_HID=3Dy
>> +# CONFIG_HID_PID is not set
>> +# CONFIG_USB_HIDDEV is not set
>> +
>> +#
>> +# Special HID drivers
>> +#
>> +CONFIG_HID_COMPAT=3Dy
>> +CONFIG_HID_A4TECH=3Dy
>> +CONFIG_HID_APPLE=3Dy
>> +CONFIG_HID_BELKIN=3Dy
>> +CONFIG_HID_BRIGHT=3Dy
>> +CONFIG_HID_CHERRY=3Dy
>> +CONFIG_HID_CHICONY=3Dy
>> +CONFIG_HID_CYPRESS=3Dy
>> +CONFIG_HID_DELL=3Dy
>> +CONFIG_HID_EZKEY=3Dy
>> +CONFIG_HID_GYRATION=3Dy
>> +CONFIG_HID_LOGITECH=3Dy
>> +# CONFIG_LOGITECH_FF is not set
>> +# CONFIG_LOGIRUMBLEPAD2_FF is not set
>> +CONFIG_HID_MICROSOFT=3Dy
>> +CONFIG_HID_MONTEREY=3Dy
>> +CONFIG_HID_PANTHERLORD=3Dy
>> +# CONFIG_PANTHERLORD_FF is not set
>> +CONFIG_HID_PETALYNX=3Dy
>> +CONFIG_HID_SAMSUNG=3Dy
>> +CONFIG_HID_SONY=3Dy
>> +CONFIG_HID_SUNPLUS=3Dy
>> +# CONFIG_THRUSTMASTER_FF is not set
>> +# CONFIG_ZEROPLUS_FF is not set
>> +CONFIG_USB_SUPPORT=3Dy
>> +CONFIG_USB_ARCH_HAS_HCD=3Dy
>> +# CONFIG_USB_ARCH_HAS_OHCI is not set
>> +CONFIG_USB_ARCH_HAS_EHCI=3Dy
>> +CONFIG_USB=3Dy
>> +# CONFIG_USB_DEBUG is not set
>> +CONFIG_USB_ANNOUNCE_NEW_DEVICES=3Dy
>> +
>> +#
>> +# Miscellaneous USB options
>> +#
>> +CONFIG_USB_DEVICEFS=3Dy
>> +# CONFIG_USB_DEVICE_CLASS is not set
>> +# CONFIG_USB_DYNAMIC_MINORS is not set
>> +CONFIG_USB_SUSPEND=3Dy
>> +CONFIG_USB_OTG=3Dy
>> +# CONFIG_USB_OTG_WHITELIST is not set
>> +# CONFIG_USB_OTG_BLACKLIST_HUB is not set
>> +# CONFIG_USB_MON is not set
>> +# CONFIG_USB_WUSB is not set
>> +# CONFIG_USB_WUSB_CBAF is not set
>> +
>> +#
>> +# USB Host Controller Drivers
>> +#
>> +# CONFIG_USB_C67X00_HCD is not set
>> +CONFIG_USB_EHCI_HCD=3Dm
>> +CONFIG_USB_EHCI_ARC=3Dy
>> +CONFIG_USB_EHCI_ARC_H2=3Dy
>> +CONFIG_USB_EHCI_ARC_OTG=3Dy
>> +# CONFIG_USB_STATIC_IRAM is not set
>> +# CONFIG_USB_EHCI_FSL_MC13783 is not set
>> +# CONFIG_USB_EHCI_FSL_1301 is not set
>> +# CONFIG_USB_EHCI_FSL_1504 is not set
>> +CONFIG_USB_EHCI_FSL_UTMI=3Dy
>> +CONFIG_USB_EHCI_ROOT_HUB_TT=3Dy
>> +# CONFIG_USB_EHCI_TT_NEWSCHED is not set
>> +# CONFIG_USB_ISP116X_HCD is not set
>> +# CONFIG_USB_SL811_HCD is not set
>> +# CONFIG_USB_R8A66597_HCD is not set
>> +# CONFIG_USB_HWA_HCD is not set
>> +# CONFIG_USB_GADGET_MUSB_HDRC is not set
>> +
>> +#
>> +# USB Device Class drivers
>> +#
>> +# CONFIG_USB_ACM is not set
>> +# CONFIG_USB_PRINTER is not set
>> +# CONFIG_USB_WDM is not set
>> +# CONFIG_USB_TMC is not set
>> +
>> +#
>> +# NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may also be needed=
;
>> +#
>> +
>> +#
>> +# see USB_STORAGE Help for more information
>> +#
>> +CONFIG_USB_STORAGE=3Dy
>> +# CONFIG_USB_STORAGE_DEBUG is not set
>> +# CONFIG_USB_STORAGE_DATAFAB is not set
>> +# CONFIG_USB_STORAGE_FREECOM is not set
>> +# CONFIG_USB_STORAGE_ISD200 is not set
>> +# CONFIG_USB_STORAGE_DPCM is not set
>> +# CONFIG_USB_STORAGE_USBAT is not set
>> +# CONFIG_USB_STORAGE_SDDR09 is not set
>> +# CONFIG_USB_STORAGE_SDDR55 is not set
>> +# CONFIG_USB_STORAGE_JUMPSHOT is not set
>> +# CONFIG_USB_STORAGE_ALAUDA is not set
>> +# CONFIG_USB_STORAGE_ONETOUCH is not set
>> +# CONFIG_USB_STORAGE_KARMA is not set
>> +# CONFIG_USB_STORAGE_CYPRESS_ATACB is not set
>> +# CONFIG_USB_LIBUSUAL is not set
>> +
>> +#
>> +# USB Imaging devices
>> +#
>> +# CONFIG_USB_MDC800 is not set
>> +# CONFIG_USB_MICROTEK is not set
>> +
>> +#
>> +# USB port drivers
>> +#
>> +# CONFIG_USB_SERIAL is not set
>> +
>> +#
>> +# USB Miscellaneous drivers
>> +#
>> +# CONFIG_USB_EMI62 is not set
>> +# CONFIG_USB_EMI26 is not set
>> +# CONFIG_USB_ADUTUX is not set
>> +# CONFIG_USB_SEVSEG is not set
>> +# CONFIG_USB_RIO500 is not set
>> +# CONFIG_USB_LEGOTOWER is not set
>> +# CONFIG_USB_LCD is not set
>> +# CONFIG_USB_BERRY_CHARGE is not set
>> +# CONFIG_USB_LED is not set
>> +# CONFIG_USB_CYPRESS_CY7C63 is not set
>> +# CONFIG_USB_CYTHERM is not set
>> +# CONFIG_USB_PHIDGET is not set
>> +# CONFIG_USB_IDMOUSE is not set
>> +# CONFIG_USB_FTDI_ELAN is not set
>> +# CONFIG_USB_APPLEDISPLAY is not set
>> +# CONFIG_USB_SISUSBVGA is not set
>> +# CONFIG_USB_LD is not set
>> +# CONFIG_USB_TRANCEVIBRATOR is not set
>> +# CONFIG_USB_IOWARRIOR is not set
>> +# CONFIG_USB_TEST is not set
>> +# CONFIG_USB_ISIGHTFW is not set
>> +# CONFIG_USB_VST is not set
>> +CONFIG_USB_GADGET=3Dm
>> +# CONFIG_USB_GADGET_DEBUG_FILES is not set
>> +CONFIG_USB_GADGET_VBUS_DRAW=3D2
>> +CONFIG_USB_GADGET_SELECTED=3Dy
>> +# CONFIG_USB_GADGET_AT91 is not set
>> +# CONFIG_USB_GADGET_ATMEL_USBA is not set
>> +# CONFIG_USB_GADGET_FSL_USB2 is not set
>> +# CONFIG_USB_GADGET_LH7A40X is not set
>> +# CONFIG_USB_GADGET_OMAP is not set
>> +# CONFIG_USB_GADGET_PXA25X is not set
>> +# CONFIG_USB_GADGET_PXA27X is not set
>> +# CONFIG_USB_GADGET_S3C2410 is not set
>> +# CONFIG_USB_GADGET_M66592 is not set
>> +# CONFIG_USB_GADGET_AMD5536UDC is not set
>> +# CONFIG_USB_GADGET_FSL_QE is not set
>> +# CONFIG_USB_GADGET_NET2280 is not set
>> +# CONFIG_USB_GADGET_GOKU is not set
>> +CONFIG_USB_GADGET_ARC=3Dy
>> +CONFIG_USB_STATIC_IRAM_PPH=3Dy
>> +CONFIG_USB_ARC=3Dm
>> +# CONFIG_USB_GADGET_DUMMY_HCD is not set
>> +CONFIG_USB_GADGET_DUALSPEED=3Dy
>> +CONFIG_USB_GADGET_ARC_OTG=3Dy
>> +# CONFIG_USB_GADGET_FSL_MC13783 is not set
>> +# CONFIG_USB_GADGET_FSL_1301 is not set
>> +# CONFIG_USB_GADGET_FSL_1504 is not set
>> +CONFIG_USB_GADGET_FSL_UTMI=3Dy
>> +# CONFIG_USB_ZERO is not set
>> +CONFIG_USB_ETH=3Dm
>> +CONFIG_USB_ETH_RNDIS=3Dy
>> +# CONFIG_USB_GADGETFS is not set
>> +CONFIG_USB_FILE_STORAGE=3Dm
>> +# CONFIG_USB_FILE_STORAGE_TEST is not set
>> +CONFIG_USB_G_SERIAL=3Dm
>> +# CONFIG_USB_MIDI_GADGET is not set
>> +# CONFIG_USB_G_PRINTER is not set
>> +# CONFIG_USB_CDC_COMPOSITE is not set
>> +CONFIG_MMC=3Dy
>> +# CONFIG_MMC_DEBUG is not set
>> +CONFIG_MMC_UNSAFE_RESUME=3Dy
>> +
>> +#
>> +# MMC/SD/SDIO Card Drivers
>> +#
>> +CONFIG_MMC_BLOCK=3Dy
>> +CONFIG_MMC_BLOCK_BOUNCE=3Dy
>> +# CONFIG_SDIO_UART is not set
>> +# CONFIG_MMC_TEST is not set
>> +
>> +#
>> +# MMC/SD/SDIO Host Controller Drivers
>> +#
>> +# CONFIG_MMC_SDHCI is not set
>> +# CONFIG_MMC_SPI is not set
>> +# CONFIG_MMC_MXC is not set
>> +CONFIG_MMC_IMX_ESDHCI=3Dy
>> +# CONFIG_MMC_IMX_ESDHCI_SELECT2 is not set
>> +# CONFIG_MMC_IMX_ESDHCI_PIO_MODE is not set
>> +# CONFIG_MEMSTICK is not set
>> +# CONFIG_ACCESSIBILITY is not set
>> +# CONFIG_NEW_LEDS is not set
>> +CONFIG_RTC_LIB=3Dy
>> +CONFIG_RTC_CLASS=3Dy
>> +CONFIG_RTC_HCTOSYS=3Dy
>> +CONFIG_RTC_HCTOSYS_DEVICE=3D"rtc0"
>> +# CONFIG_RTC_DEBUG is not set
>> +
>> +#
>> +# RTC interfaces
>> +#
>> +CONFIG_RTC_INTF_SYSFS=3Dy
>> +CONFIG_RTC_INTF_PROC=3Dy
>> +CONFIG_RTC_INTF_DEV=3Dy
>> +# CONFIG_RTC_INTF_DEV_UIE_EMUL is not set
>> +# CONFIG_RTC_DRV_TEST is not set
>> +
>> +#
>> +# I2C RTC drivers
>> +#
>> +# CONFIG_RTC_DRV_DS1307 is not set
>> +# CONFIG_RTC_DRV_DS1374 is not set
>> +# CONFIG_RTC_DRV_DS1672 is not set
>> +# CONFIG_RTC_DRV_MAX6900 is not set
>> +# CONFIG_RTC_DRV_RS5C372 is not set
>> +# CONFIG_RTC_DRV_ISL1208 is not set
>> +# CONFIG_RTC_DRV_X1205 is not set
>> +# CONFIG_RTC_DRV_PCF8563 is not set
>> +# CONFIG_RTC_DRV_PCF8583 is not set
>> +# CONFIG_RTC_DRV_M41T80 is not set
>> +# CONFIG_RTC_DRV_S35390A is not set
>> +# CONFIG_RTC_DRV_FM3130 is not set
>> +# CONFIG_RTC_DRV_RX8581 is not set
>> +
>> +#
>> +# SPI RTC drivers
>> +#
>> +# CONFIG_RTC_DRV_M41T94 is not set
>> +# CONFIG_RTC_DRV_DS1305 is not set
>> +# CONFIG_RTC_DRV_DS1390 is not set
>> +# CONFIG_RTC_DRV_MAX6902 is not set
>> +# CONFIG_RTC_DRV_R9701 is not set
>> +# CONFIG_RTC_DRV_RS5C348 is not set
>> +# CONFIG_RTC_DRV_DS3234 is not set
>> +
>> +#
>> +# Platform RTC drivers
>> +#
>> +# CONFIG_RTC_DRV_CMOS is not set
>> +# CONFIG_RTC_DRV_DS1286 is not set
>> +# CONFIG_RTC_DRV_DS1511 is not set
>> +# CONFIG_RTC_DRV_DS1553 is not set
>> +# CONFIG_RTC_DRV_DS1742 is not set
>> +# CONFIG_RTC_DRV_STK17TA8 is not set
>> +# CONFIG_RTC_DRV_M48T86 is not set
>> +# CONFIG_RTC_DRV_M48T35 is not set
>> +# CONFIG_RTC_DRV_M48T59 is not set
>> +# CONFIG_RTC_DRV_BQ4802 is not set
>> +# CONFIG_RTC_DRV_V3020 is not set
>> +
>> +#
>> +# on-CPU RTC drivers
>> +#
>> +# CONFIG_RTC_MXC is not set
>> +# CONFIG_RTC_DRV_MXC_V2 is not set
>> +CONFIG_RTC_DRV_IMXDI=3Dy
>> +# CONFIG_DMADEVICES is not set
>> +CONFIG_REGULATOR=3Dy
>> +# CONFIG_REGULATOR_DEBUG is not set
>> +# CONFIG_REGULATOR_FIXED_VOLTAGE is not set
>> +# CONFIG_REGULATOR_VIRTUAL_CONSUMER is not set
>> +# CONFIG_REGULATOR_BQ24022 is not set
>> +CONFIG_REGULATOR_MC34704=3Dy
>> +# CONFIG_UIO is not set
>> +
>> +#
>> +# MXC support drivers
>> +#
>> +
>> +#
>> +# MXC SSI support
>> +#
>> +# CONFIG_MXC_SSI is not set
>> +
>> +#
>> +# MXC Digital Audio Multiplexer support
>> +#
>> +# CONFIG_MXC_DAM is not set
>> +
>> +#
>> +# MXC PMIC support
>> +#
>> +CONFIG_MXC_PMIC=3Dy
>> +# CONFIG_MXC_PMIC_MC13783 is not set
>> +# CONFIG_MXC_PMIC_MC13892 is not set
>> +CONFIG_MXC_PMIC_MC34704=3Dy
>> +# CONFIG_MXC_PMIC_MC9SDZ60 is not set
>> +CONFIG_MXC_PMIC_CHARDEV=3Dy
>> +
>> +#
>> +# MXC PMIC Client Drivers
>> +#
>> +# CONFIG_MXC_PMIC_MC9S08DZ60 is not set
>> +
>> +#
>> +# MXC Security Drivers
>> +#
>> +# CONFIG_MXC_SECURITY_SCC is not set
>> +# CONFIG_MXC_SECURITY_RNG is not set
>> +# CONFIG_MXC_DRYICE is not set
>> +
>> +#
>> +# MXC MPEG4 Encoder Kernel module support
>> +#
>> +# CONFIG_MXC_HMP4E is not set
>> +
>> +#
>> +# MXC HARDWARE EVENT
>> +#
>> +# CONFIG_MXC_HWEVENT is not set
>> +
>> +#
>> +# MXC VPU(Video Processing Unit) support
>> +#
>> +
>> +#
>> +# MXC Asynchronous Sample Rate Converter support
>> +#
>> +
>> +#
>> +# MXC Bluetooth support
>> +#
>> +
>> +#
>> +# Broadcom GPS ioctrl support
>> +#
>> +
>> +#
>> +# MXC Media Local Bus Driver
>> +#
>> +
>> +#
>> +# i.MX ADC support
>> +#
>> +CONFIG_IMX_ADC=3Dy
>> +
>> +#
>> +# File systems
>> +#
>> +CONFIG_EXT2_FS=3Dy
>> +# CONFIG_EXT2_FS_XATTR is not set
>> +# CONFIG_EXT2_FS_XIP is not set
>> +# CONFIG_EXT3_FS is not set
>> +# CONFIG_EXT4_FS is not set
>> +# CONFIG_REISERFS_FS is not set
>> +# CONFIG_JFS_FS is not set
>> +# CONFIG_FS_POSIX_ACL is not set
>> +CONFIG_FILE_LOCKING=3Dy
>> +# CONFIG_XFS_FS is not set
>> +# CONFIG_OCFS2_FS is not set
>> +CONFIG_DNOTIFY=3Dy
>> +CONFIG_INOTIFY=3Dy
>> +CONFIG_INOTIFY_USER=3Dy
>> +# CONFIG_QUOTA is not set
>> +# CONFIG_AUTOFS_FS is not set
>> +CONFIG_AUTOFS4_FS=3Dm
>> +# CONFIG_FUSE_FS is not set
>> +
>> +#
>> +# CD-ROM/DVD Filesystems
>> +#
>> +# CONFIG_ISO9660_FS is not set
>> +# CONFIG_UDF_FS is not set
>> +
>> +#
>> +# DOS/FAT/NT Filesystems
>> +#
>> +CONFIG_FAT_FS=3Dy
>> +CONFIG_MSDOS_FS=3Dy
>> +CONFIG_VFAT_FS=3Dy
>> +CONFIG_FAT_DEFAULT_CODEPAGE=3D437
>> +CONFIG_FAT_DEFAULT_IOCHARSET=3D"iso8859-1"
>> +# CONFIG_NTFS_FS is not set
>> +
>> +#
>> +# Pseudo filesystems
>> +#
>> +CONFIG_PROC_FS=3Dy
>> +CONFIG_PROC_SYSCTL=3Dy
>> +CONFIG_PROC_PAGE_MONITOR=3Dy
>> +CONFIG_SYSFS=3Dy
>> +CONFIG_TMPFS=3Dy
>> +# CONFIG_TMPFS_POSIX_ACL is not set
>> +# CONFIG_HUGETLB_PAGE is not set
>> +# CONFIG_CONFIGFS_FS is not set
>> +
>> +#
>> +# Miscellaneous filesystems
>> +#
>> +# CONFIG_ADFS_FS is not set
>> +# CONFIG_AFFS_FS is not set
>> +# CONFIG_HFS_FS is not set
>> +# CONFIG_HFSPLUS_FS is not set
>> +# CONFIG_BEFS_FS is not set
>> +# CONFIG_BFS_FS is not set
>> +# CONFIG_EFS_FS is not set
>> +CONFIG_JFFS2_FS=3Dy
>> +CONFIG_JFFS2_FS_DEBUG=3D0
>> +CONFIG_JFFS2_FS_WRITEBUFFER=3Dy
>> +# CONFIG_JFFS2_FS_WBUF_VERIFY is not set
>> +# CONFIG_JFFS2_SUMMARY is not set
>> +# CONFIG_JFFS2_FS_XATTR is not set
>> +# CONFIG_JFFS2_COMPRESSION_OPTIONS is not set
>> +CONFIG_JFFS2_ZLIB=3Dy
>> +# CONFIG_JFFS2_LZO is not set
>> +CONFIG_JFFS2_RTIME=3Dy
>> +# CONFIG_JFFS2_RUBIN is not set
>> +CONFIG_CRAMFS=3Dy
>> +# CONFIG_VXFS_FS is not set
>> +# CONFIG_MINIX_FS is not set
>> +# CONFIG_OMFS_FS is not set
>> +# CONFIG_HPFS_FS is not set
>> +# CONFIG_QNX4FS_FS is not set
>> +# CONFIG_ROMFS_FS is not set
>> +# CONFIG_SYSV_FS is not set
>> +# CONFIG_UFS_FS is not set
>> +CONFIG_NETWORK_FILESYSTEMS=3Dy
>> +CONFIG_NFS_FS=3Dy
>> +CONFIG_NFS_V3=3Dy
>> +# CONFIG_NFS_V3_ACL is not set
>> +# CONFIG_NFS_V4 is not set
>> +CONFIG_ROOT_NFS=3Dy
>> +# CONFIG_NFSD is not set
>> +CONFIG_LOCKD=3Dy
>> +CONFIG_LOCKD_V4=3Dy
>> +CONFIG_NFS_COMMON=3Dy
>> +CONFIG_SUNRPC=3Dy
>> +# CONFIG_SUNRPC_REGISTER_V4 is not set
>> +# CONFIG_RPCSEC_GSS_KRB5 is not set
>> +# CONFIG_RPCSEC_GSS_SPKM3 is not set
>> +# CONFIG_SMB_FS is not set
>> +# CONFIG_CIFS is not set
>> +# CONFIG_NCP_FS is not set
>> +# CONFIG_CODA_FS is not set
>> +# CONFIG_AFS_FS is not set
>> +
>> +#
>> +# Partition Types
>> +#
>> +# CONFIG_PARTITION_ADVANCED is not set
>> +CONFIG_MSDOS_PARTITION=3Dy
>> +CONFIG_NLS=3Dy
>> +CONFIG_NLS_DEFAULT=3D"iso8859-1"
>> +CONFIG_NLS_CODEPAGE_437=3Dy
>> +# CONFIG_NLS_CODEPAGE_737 is not set
>> +# CONFIG_NLS_CODEPAGE_775 is not set
>> +# CONFIG_NLS_CODEPAGE_850 is not set
>> +# CONFIG_NLS_CODEPAGE_852 is not set
>> +# CONFIG_NLS_CODEPAGE_855 is not set
>> +# CONFIG_NLS_CODEPAGE_857 is not set
>> +# CONFIG_NLS_CODEPAGE_860 is not set
>> +# CONFIG_NLS_CODEPAGE_861 is not set
>> +# CONFIG_NLS_CODEPAGE_862 is not set
>> +# CONFIG_NLS_CODEPAGE_863 is not set
>> +# CONFIG_NLS_CODEPAGE_864 is not set
>> +# CONFIG_NLS_CODEPAGE_865 is not set
>> +# CONFIG_NLS_CODEPAGE_866 is not set
>> +# CONFIG_NLS_CODEPAGE_869 is not set
>> +# CONFIG_NLS_CODEPAGE_936 is not set
>> +# CONFIG_NLS_CODEPAGE_950 is not set
>> +# CONFIG_NLS_CODEPAGE_932 is not set
>> +# CONFIG_NLS_CODEPAGE_949 is not set
>> +# CONFIG_NLS_CODEPAGE_874 is not set
>> +# CONFIG_NLS_ISO8859_8 is not set
>> +# CONFIG_NLS_CODEPAGE_1250 is not set
>> +# CONFIG_NLS_CODEPAGE_1251 is not set
>> +CONFIG_NLS_ASCII=3Dm
>> +CONFIG_NLS_ISO8859_1=3Dy
>> +# CONFIG_NLS_ISO8859_2 is not set
>> +# CONFIG_NLS_ISO8859_3 is not set
>> +# CONFIG_NLS_ISO8859_4 is not set
>> +# CONFIG_NLS_ISO8859_5 is not set
>> +# CONFIG_NLS_ISO8859_6 is not set
>> +# CONFIG_NLS_ISO8859_7 is not set
>> +# CONFIG_NLS_ISO8859_9 is not set
>> +# CONFIG_NLS_ISO8859_13 is not set
>> +# CONFIG_NLS_ISO8859_14 is not set
>> +# CONFIG_NLS_ISO8859_15 is not set
>> +# CONFIG_NLS_KOI8_R is not set
>> +# CONFIG_NLS_KOI8_U is not set
>> +CONFIG_NLS_UTF8=3Dm
>> +# CONFIG_DLM is not set
>> +
>> +#
>> +# Kernel hacking
>> +#
>> +# CONFIG_PRINTK_TIME is not set
>> +CONFIG_ENABLE_WARN_DEPRECATED=3Dy
>> +CONFIG_ENABLE_MUST_CHECK=3Dy
>> +CONFIG_FRAME_WARN=3D1024
>> +# CONFIG_MAGIC_SYSRQ is not set
>> +# CONFIG_UNUSED_SYMBOLS is not set
>> +# CONFIG_DEBUG_FS is not set
>> +# CONFIG_HEADERS_CHECK is not set
>> +# CONFIG_DEBUG_KERNEL is not set
>> +# CONFIG_DEBUG_BUGVERBOSE is not set
>> +# CONFIG_DEBUG_MEMORY_INIT is not set
>> +CONFIG_FRAME_POINTER=3Dy
>> +# CONFIG_RCU_CPU_STALL_DETECTOR is not set
>> +# CONFIG_LATENCYTOP is not set
>> +CONFIG_SYSCTL_SYSCALL_CHECK=3Dy
>> +CONFIG_HAVE_FUNCTION_TRACER=3Dy
>> +
>> +#
>> +# Tracers
>> +#
>> +# CONFIG_DYNAMIC_PRINTK_DEBUG is not set
>> +# CONFIG_SAMPLES is not set
>> +CONFIG_HAVE_ARCH_KGDB=3Dy
>> +# CONFIG_DEBUG_USER is not set
>> +
>> +#
>> +# Security options
>> +#
>> +# CONFIG_KEYS is not set
>> +# CONFIG_SECURITY is not set
>> +# CONFIG_SECURITYFS is not set
>> +# CONFIG_SECURITY_FILE_CAPABILITIES is not set
>> +CONFIG_CRYPTO=3Dy
>> +
>> +#
>> +# Crypto core or helper
>> +#
>> +# CONFIG_CRYPTO_FIPS is not set
>> +# CONFIG_CRYPTO_MANAGER is not set
>> +# CONFIG_CRYPTO_MANAGER2 is not set
>> +# CONFIG_CRYPTO_GF128MUL is not set
>> +# CONFIG_CRYPTO_NULL is not set
>> +# CONFIG_CRYPTO_CRYPTD is not set
>> +# CONFIG_CRYPTO_AUTHENC is not set
>> +# CONFIG_CRYPTO_TEST is not set
>> +# CONFIG_CRYPTO_CRYPTODEV is not set
>> +
>> +#
>> +# Authenticated Encryption with Associated Data
>> +#
>> +# CONFIG_CRYPTO_CCM is not set
>> +# CONFIG_CRYPTO_GCM is not set
>> +# CONFIG_CRYPTO_SEQIV is not set
>> +
>> +#
>> +# Block modes
>> +#
>> +# CONFIG_CRYPTO_CBC is not set
>> +# CONFIG_CRYPTO_CTR is not set
>> +# CONFIG_CRYPTO_CTS is not set
>> +# CONFIG_CRYPTO_ECB is not set
>> +# CONFIG_CRYPTO_LRW is not set
>> +# CONFIG_CRYPTO_PCBC is not set
>> +# CONFIG_CRYPTO_XTS is not set
>> +
>> +#
>> +# Hash modes
>> +#
>> +# CONFIG_CRYPTO_HMAC is not set
>> +# CONFIG_CRYPTO_XCBC is not set
>> +
>> +#
>> +# Digest
>> +#
>> +# CONFIG_CRYPTO_CRC32C is not set
>> +# CONFIG_CRYPTO_MD4 is not set
>> +# CONFIG_CRYPTO_MD5 is not set
>> +# CONFIG_CRYPTO_MICHAEL_MIC is not set
>> +# CONFIG_CRYPTO_RMD128 is not set
>> +# CONFIG_CRYPTO_RMD160 is not set
>> +# CONFIG_CRYPTO_RMD256 is not set
>> +# CONFIG_CRYPTO_RMD320 is not set
>> +# CONFIG_CRYPTO_SHA1 is not set
>> +# CONFIG_CRYPTO_SHA256 is not set
>> +# CONFIG_CRYPTO_SHA512 is not set
>> +# CONFIG_CRYPTO_TGR192 is not set
>> +# CONFIG_CRYPTO_WP512 is not set
>> +
>> +#
>> +# Ciphers
>> +#
>> +# CONFIG_CRYPTO_AES is not set
>> +# CONFIG_CRYPTO_ANUBIS is not set
>> +# CONFIG_CRYPTO_ARC4 is not set
>> +# CONFIG_CRYPTO_BLOWFISH is not set
>> +# CONFIG_CRYPTO_CAMELLIA is not set
>> +# CONFIG_CRYPTO_CAST5 is not set
>> +# CONFIG_CRYPTO_CAST6 is not set
>> +# CONFIG_CRYPTO_DES is not set
>> +# CONFIG_CRYPTO_FCRYPT is not set
>> +# CONFIG_CRYPTO_KHAZAD is not set
>> +# CONFIG_CRYPTO_SALSA20 is not set
>> +# CONFIG_CRYPTO_SEED is not set
>> +# CONFIG_CRYPTO_SERPENT is not set
>> +# CONFIG_CRYPTO_TEA is not set
>> +# CONFIG_CRYPTO_TWOFISH is not set
>> +
>> +#
>> +# Compression
>> +#
>> +# CONFIG_CRYPTO_DEFLATE is not set
>> +# CONFIG_CRYPTO_LZO is not set
>> +
>> +#
>> +# Random Number Generation
>> +#
>> +# CONFIG_CRYPTO_ANSI_CPRNG is not set
>> +CONFIG_CRYPTO_HW=3Dy
>> +
>> +#
>> +# Library routines
>> +#
>> +CONFIG_BITREVERSE=3Dy
>> +CONFIG_CRC_CCITT=3Dm
>> +# CONFIG_CRC16 is not set
>> +# CONFIG_CRC_T10DIF is not set
>> +# CONFIG_CRC_ITU_T is not set
>> +CONFIG_CRC32=3Dy
>> +# CONFIG_CRC7 is not set
>> +# CONFIG_LIBCRC32C is not set
>> +CONFIG_ZLIB_INFLATE=3Dy
>> +CONFIG_ZLIB_DEFLATE=3Dy
>> +CONFIG_PLIST=3Dy
>> +CONFIG_HAS_IOMEM=3Dy
>> +CONFIG_HAS_IOPORT=3Dy
>> +CONFIG_HAS_DMA=3Dy
>> diff --git a/recipes/linux/linux_2.6.31.bb b/recipes/linux/linux_2.6.3=
1.bb
>> index 532f08a..32ead89 100644
>> --- a/recipes/linux/linux_2.6.31.bb
>> +++ b/recipes/linux/linux_2.6.31.bb
>> @@ -12,6 +12,7 @@ DEFAULT_PREFERENCE_db1200 =3D "1"
>>   DEFAULT_PREFERENCE_qemumips =3D "1"
>>   DEFAULT_PREFERENCE_qemux86 =3D "1"
>>   DEFAULT_PREFERENCE_iei-nanogx-466 =3D "1"
>> +DEFAULT_PREFERENCE_mx25-3stack =3D "1"
>>
>>   SRC_URI =3D "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.t=
ar.bz2 \
>>             ${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/patch-${PV}.12.b=
z2;patch=3D1 \
>> @@ -66,6 +67,14 @@ SRC_URI_append_ep93xx =3D " \
>>             file://edb9301-fix-machine-id.patch;patch=3D1 \
>>             "
>>
>> +SRC_URI_append_mx25-3stack =3D " \
>> +           http://download.berlios.de/mx25patches/linux-2.6.31.12-imx=
-09.12.00.patch.bz2;patch=3D1;name=3Dpatchmx25 \
>> +           file://defconfig \
>> +           "
>> +
>> +SRC_URI[patchmx25.md5sum] =3D "a1687104ac3654a3a91cdeb039281369"
>> +SRC_URI[patchmx25.sha256] =3D "2ecbc311e2887165f8d8327f8c7ff118c16d4c=
9554b281b733bb0d7619139779"
>> +
>>   do_devicetree_image_append_boc01() {
>>         dtc -I dts -O dtb ${KERNEL_DEVICETREE_FLAGS} -o devicetree.v1 =
${KERNEL_DEVICETREE}.v1
>>         install -m 0644 devicetree.v1 ${D}/boot/devicetree-${KERNEL_VE=
RSION}.v1
>> diff --git a/recipes/u-boot/u-boot_2009.08.bb b/recipes/u-boot/u-boot_=
2009.08.bb
>> index 21715a0..b72caea 100644
>> --- a/recipes/u-boot/u-boot_2009.08.bb
>> +++ b/recipes/u-boot/u-boot_2009.08.bb
>> @@ -5,6 +5,7 @@ DEFAULT_PREFERENCE =3D "-1"
>>   DEFAULT_PREFERENCE_at91sam9g20ek =3D "1"
>>   DEFAULT_PREFERENCE_at91sam9g45ek =3D "1"
>>   DEFAULT_PREFERENCE_igep0020 =3D "1"
>> +DEFAULT_PREFERENCE_mx25-3stack  =3D "1"
>>
>>   SRC_URI =3D "ftp://ftp.denx.de/pub/u-boot/u-boot-${PV}.tar.bz2 "
>>
>> @@ -12,6 +13,12 @@ SRC_URI_append_igep0020 =3D " \
>>         file://update-mach-types.patch;patch=3D1 \
>>         file://add-board-support-for-IGEP-v2-series-rev-B.patch;patch=3D=
1 \
>>   "
>> +SRC_URI_append_mx25-3stack =3D"\
>> +           http://download.berlios.de/mx25patches/u-boot-v2009.08-imx=
-09.12.00.patch.bz2;patch=3D1;name=3Dubootmx25patch \
>> +           "
>> +
>> +SRC_URI[ubootmx25patch.md5sum] =3D "b7bc4870b647de422b983ea3acc367a5"
>> +SRC_URI[ubootmx25patch.sha256sum] =3D "c65baf791f987126251dfcb5fa100f=
fef6cf6b668b71d57c2ca4e1128870ff9b"
>>
>>   TARGET_LDFLAGS =3D ""
>>
>> --
>> 1.6.3.3
>>
>>
> Hi,
>
> Any comments on this patch?
>
> Regards,
>
> Mickael Chazaux
>
> Adeneo Embedded - Adetel Group
> 2, chemin du Ruisseau
> 69134 ECULLY - FRANCE
> T=C3=A9l. : +33 (0)4 72 18 08 40 - Fax : +33 (0)4 72 18 08 41
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


--=20
Jaume Ribot Caner
R&D Engineer

FQ Ingenier=C3=ADa Electr=C3=B3nica, SA
Avda. de les Roquetes, 9
Pol. Industrial Vilanoveta
08812 Sant Pere de Ribes ( SPAIN )
www.fqingenieria.es

Tf  + 34 93 208 02 58
Fx  + 34 93 459 28 93
E-mail: jaume@fqingenieria.es



