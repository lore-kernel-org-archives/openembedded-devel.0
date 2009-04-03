Received: from [209.85.132.250] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1Lpq0s-0006YR-Ky
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 Apr 2009 22:29:23 +0200
Received: by an-out-0708.google.com with SMTP id b2so1587196ana.42
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 Apr 2009 13:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=+hfDdnGhUdNrY+iov+b4gLPLF60XDU3p81q9tIDnuJk=;
	b=p1/1wPkQ5szqm+rVTjT0mn31C+bRLhbUpg8FLYUdN9OsRiKM+Ap25fqjutzB+EqvJA
	ro1BSm5p1PqCPMJYwkwXC0CG9rI7V6PGEst5OL0HcP3skDQV/nJgGPcqQnDP2D2h9+r8
	sGkxt45paWHCw/mSdRQX55iUQIxjn7mDKJCxY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=kawbrgSnPPtvYBv2ky0ZhHB943bN0taFb8LXn3MRvYLumqhbkpEVIgBOmcrk9bCUy0
	j3m5FIMdEk+uvodGbnpYt7QMuscaz+clgkxr0wSL+zn+Bulz7ZGWpmvP0PmFkuL4DzwC
	OItcQ+y2xZZtS+9pkJA9fiuztswo1xKmlZ4vs=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.101.71.3 with SMTP id y3mr3559578ank.62.1238790404826; Fri, 03 
	Apr 2009 13:26:44 -0700 (PDT)
In-Reply-To: <alpine.DEB.1.00.0903270937550.19091@localhost.localdomain>
References: <alpine.DEB.1.00.0903270937550.19091@localhost.localdomain>
Date: Fri, 3 Apr 2009 17:26:44 -0300
X-Google-Sender-Auth: 16afe6433ed625f2
Message-ID: <be7a9f3d0904031326h246c57c3gc3ba0c23f5bff1c4@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.132.250
X-SA-Exim-Mail-From: otavio.salvador@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=AWL,BAYES_50,RDNS_NONE,
	SPF_PASS,UPPERCASE_50_75 autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] Add machine support for TS7800 boards.
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
X-List-Received-Date: Fri, 03 Apr 2009 20:29:24 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

On Fri, Mar 27, 2009 at 1:41 PM, Theodore A. Roth <taroth@gmail.com> wrote:
>
>
> Signed-off-by: Theodore A. Roth <troth@openavr.org>
> ---
> =A0conf/machine/ts7800.conf =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =
18 +
> =A0recipes/linux/linux-2.6.28/ts7800/defconfig | 1926 +++++++++++++++++++=
++++++++
> =A0recipes/linux/linux_2.6.28.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =A01 +
> =A03 files changed, 1945 insertions(+), 0 deletions(-)
> =A0create mode 100644 conf/machine/ts7800.conf
> =A0create mode 100644 recipes/linux/linux-2.6.28/ts7800/defconfig
>
> diff --git a/conf/machine/ts7800.conf b/conf/machine/ts7800.conf
> new file mode 100644
> index 0000000..3cad5e0
> --- /dev/null
> +++ b/conf/machine/ts7800.conf
> @@ -0,0 +1,18 @@
> +#@TYPE: Machine
> +#@Name: Technologic Systems TS-7800 SBC
> +#@DESCRIPTION: Machine configuration for Technologic Systems TS-7800 SBC
> +
> +TARGET_ARCH =3D "arm"
> +
> +PREFERRED_PROVIDER_virtual/kernel =3D "linux"
> +PREFERRED_VERSION_linux =3D "2.6.28"
> +
> +MACHINE_FEATURES =3D "kernel26 ext2 usbhost"
> +
> +SERIAL_CONSOLE =3D "115200 ttyS0"
> +USE_VT =3D "0"
> +CMDLINE ?=3D "root=3D/dev/ram0 rw lpj=3D1662976 init=3D/linuxrc console=
=3DttyS0,115200n8"
> +
> +require conf/machine/include/tune-arm926ejs.inc
> +
> +ARM_KEEP_OABI_ts7800 =3D "1"
> diff --git a/recipes/linux/linux-2.6.28/ts7800/defconfig b/recipes/linux/=
linux-2.6.28/ts7800/defconfig
> new file mode 100644
> index 0000000..0f15903
> --- /dev/null
> +++ b/recipes/linux/linux-2.6.28/ts7800/defconfig
> @@ -0,0 +1,1926 @@
> +#
> +# Automatically generated make config: don't edit
> +# Linux kernel version: 2.6.28-tr
> +# Wed Feb 11 15:45:13 2009
> +#
> +CONFIG_ARM=3Dy
> +CONFIG_SYS_SUPPORTS_APM_EMULATION=3Dy
> +CONFIG_GENERIC_GPIO=3Dy
> +CONFIG_GENERIC_TIME=3Dy
> +CONFIG_GENERIC_CLOCKEVENTS=3Dy
> +CONFIG_MMU=3Dy
> +# CONFIG_NO_IOPORT is not set
> +CONFIG_GENERIC_HARDIRQS=3Dy
> +CONFIG_STACKTRACE_SUPPORT=3Dy
> +CONFIG_HAVE_LATENCYTOP_SUPPORT=3Dy
> +CONFIG_LOCKDEP_SUPPORT=3Dy
> +CONFIG_TRACE_IRQFLAGS_SUPPORT=3Dy
> +CONFIG_HARDIRQS_SW_RESEND=3Dy
> +CONFIG_GENERIC_IRQ_PROBE=3Dy
> +CONFIG_RWSEM_GENERIC_SPINLOCK=3Dy
> +# CONFIG_ARCH_HAS_ILOG2_U32 is not set
> +# CONFIG_ARCH_HAS_ILOG2_U64 is not set
> +CONFIG_GENERIC_HWEIGHT=3Dy
> +CONFIG_GENERIC_CALIBRATE_DELAY=3Dy
> +CONFIG_GENERIC_HARDIRQS_NO__DO_IRQ=3Dy
> +CONFIG_VECTORS_BASE=3D0xffff0000
> +CONFIG_DEFCONFIG_LIST=3D"/lib/modules/$UNAME_RELEASE/.config"
> +
> +#
> +# General setup
> +#
> +CONFIG_EXPERIMENTAL=3Dy
> +CONFIG_BROKEN_ON_SMP=3Dy
> +CONFIG_LOCK_KERNEL=3Dy
> +CONFIG_INIT_ENV_ARG_LIMIT=3D32
> +CONFIG_LOCALVERSION=3D""
> +# CONFIG_LOCALVERSION_AUTO is not set
> +CONFIG_SWAP=3Dy
> +CONFIG_SYSVIPC=3Dy
> +CONFIG_SYSVIPC_SYSCTL=3Dy
> +# CONFIG_POSIX_MQUEUE is not set
> +# CONFIG_BSD_PROCESS_ACCT is not set
> +# CONFIG_TASKSTATS is not set
> +# CONFIG_AUDIT is not set
> +CONFIG_IKCONFIG=3Dy
> +CONFIG_IKCONFIG_PROC=3Dy
> +CONFIG_LOG_BUF_SHIFT=3D14
> +# CONFIG_CGROUPS is not set
> +# CONFIG_GROUP_SCHED is not set
> +CONFIG_SYSFS_DEPRECATED=3Dy
> +CONFIG_SYSFS_DEPRECATED_V2=3Dy
> +# CONFIG_RELAY is not set
> +CONFIG_NAMESPACES=3Dy
> +# CONFIG_UTS_NS is not set
> +# CONFIG_IPC_NS is not set
> +# CONFIG_USER_NS is not set
> +# CONFIG_PID_NS is not set
> +CONFIG_BLK_DEV_INITRD=3Dy
> +CONFIG_INITRAMFS_SOURCE=3D""
> +CONFIG_CC_OPTIMIZE_FOR_SIZE=3Dy
> +CONFIG_SYSCTL=3Dy
> +# CONFIG_EMBEDDED is not set
> +CONFIG_UID16=3Dy
> +CONFIG_SYSCTL_SYSCALL=3Dy
> +CONFIG_KALLSYMS=3Dy
> +CONFIG_KALLSYMS_ALL=3Dy
> +# CONFIG_KALLSYMS_EXTRA_PASS is not set
> +CONFIG_HOTPLUG=3Dy
> +CONFIG_PRINTK=3Dy
> +CONFIG_BUG=3Dy
> +CONFIG_ELF_CORE=3Dy
> +CONFIG_COMPAT_BRK=3Dy
> +CONFIG_BASE_FULL=3Dy
> +CONFIG_FUTEX=3Dy
> +CONFIG_ANON_INODES=3Dy
> +CONFIG_EPOLL=3Dy
> +CONFIG_SIGNALFD=3Dy
> +CONFIG_TIMERFD=3Dy
> +CONFIG_EVENTFD=3Dy
> +CONFIG_SHMEM=3Dy
> +CONFIG_AIO=3Dy
> +CONFIG_VM_EVENT_COUNTERS=3Dy
> +CONFIG_PCI_QUIRKS=3Dy
> +CONFIG_SLAB=3Dy
> +# CONFIG_SLUB is not set
> +# CONFIG_SLOB is not set
> +# CONFIG_PROFILING is not set
> +# CONFIG_MARKERS is not set
> +CONFIG_HAVE_OPROFILE=3Dy
> +# CONFIG_KPROBES is not set
> +CONFIG_HAVE_KPROBES=3Dy
> +CONFIG_HAVE_KRETPROBES=3Dy
> +CONFIG_HAVE_GENERIC_DMA_COHERENT=3Dy
> +CONFIG_SLABINFO=3Dy
> +CONFIG_RT_MUTEXES=3Dy
> +# CONFIG_TINY_SHMEM is not set
> +CONFIG_BASE_SMALL=3D0
> +CONFIG_MODULES=3Dy
> +# CONFIG_MODULE_FORCE_LOAD is not set
> +CONFIG_MODULE_UNLOAD=3Dy
> +# CONFIG_MODULE_FORCE_UNLOAD is not set
> +# CONFIG_MODVERSIONS is not set
> +# CONFIG_MODULE_SRCVERSION_ALL is not set
> +CONFIG_KMOD=3Dy
> +CONFIG_BLOCK=3Dy
> +# CONFIG_LBD is not set
> +# CONFIG_BLK_DEV_IO_TRACE is not set
> +# CONFIG_LSF is not set
> +# CONFIG_BLK_DEV_BSG is not set
> +# CONFIG_BLK_DEV_INTEGRITY is not set
> +
> +#
> +# IO Schedulers
> +#
> +CONFIG_IOSCHED_NOOP=3Dy
> +CONFIG_IOSCHED_AS=3Dy
> +CONFIG_IOSCHED_DEADLINE=3Dm
> +CONFIG_IOSCHED_CFQ=3Dm
> +CONFIG_DEFAULT_AS=3Dy
> +# CONFIG_DEFAULT_DEADLINE is not set
> +# CONFIG_DEFAULT_CFQ is not set
> +# CONFIG_DEFAULT_NOOP is not set
> +CONFIG_DEFAULT_IOSCHED=3D"anticipatory"
> +CONFIG_CLASSIC_RCU=3Dy
> +# CONFIG_FREEZER is not set
> +
> +#
> +# System Type
> +#
> +# CONFIG_ARCH_AAEC2000 is not set
> +# CONFIG_ARCH_INTEGRATOR is not set
> +# CONFIG_ARCH_REALVIEW is not set
> +# CONFIG_ARCH_VERSATILE is not set
> +# CONFIG_ARCH_AT91 is not set
> +# CONFIG_ARCH_CLPS7500 is not set
> +# CONFIG_ARCH_CLPS711X is not set
> +# CONFIG_ARCH_EBSA110 is not set
> +# CONFIG_ARCH_EP93XX is not set
> +# CONFIG_ARCH_FOOTBRIDGE is not set
> +# CONFIG_ARCH_NETX is not set
> +# CONFIG_ARCH_H720X is not set
> +# CONFIG_ARCH_IMX is not set
> +# CONFIG_ARCH_IOP13XX is not set
> +# CONFIG_ARCH_IOP32X is not set
> +# CONFIG_ARCH_IOP33X is not set
> +# CONFIG_ARCH_IXP23XX is not set
> +# CONFIG_ARCH_IXP2000 is not set
> +# CONFIG_ARCH_IXP4XX is not set
> +# CONFIG_ARCH_L7200 is not set
> +# CONFIG_ARCH_KIRKWOOD is not set
> +# CONFIG_ARCH_KS8695 is not set
> +# CONFIG_ARCH_NS9XXX is not set
> +# CONFIG_ARCH_LOKI is not set
> +# CONFIG_ARCH_MV78XX0 is not set
> +# CONFIG_ARCH_MXC is not set
> +CONFIG_ARCH_ORION5X=3Dy
> +# CONFIG_ARCH_PNX4008 is not set
> +# CONFIG_ARCH_PXA is not set
> +# CONFIG_ARCH_RPC is not set
> +# CONFIG_ARCH_SA1100 is not set
> +# CONFIG_ARCH_S3C2410 is not set
> +# CONFIG_ARCH_SHARK is not set
> +# CONFIG_ARCH_LH7A40X is not set
> +# CONFIG_ARCH_DAVINCI is not set
> +# CONFIG_ARCH_OMAP is not set
> +# CONFIG_ARCH_MSM is not set
> +
> +#
> +# Orion Implementations
> +#
> +# CONFIG_MACH_DB88F5281 is not set
> +# CONFIG_MACH_RD88F5182 is not set
> +# CONFIG_MACH_KUROBOX_PRO is not set
> +# CONFIG_MACH_DNS323 is not set
> +# CONFIG_MACH_TS209 is not set
> +# CONFIG_MACH_TERASTATION_PRO2 is not set
> +# CONFIG_MACH_LINKSTATION_PRO is not set
> +# CONFIG_MACH_LINKSTATION_MINI is not set
> +# CONFIG_MACH_TS409 is not set
> +# CONFIG_MACH_WRT350N_V2 is not set
> +CONFIG_MACH_TS78XX=3Dy
> +# CONFIG_MACH_MV2120 is not set
> +# CONFIG_MACH_EDMINI_V2 is not set
> +# CONFIG_MACH_MSS2 is not set
> +# CONFIG_MACH_WNR854T is not set
> +# CONFIG_MACH_RD88F5181L_GE is not set
> +# CONFIG_MACH_RD88F5181L_FXO is not set
> +# CONFIG_MACH_RD88F6183AP_GE is not set
> +
> +#
> +# Boot options
> +#
> +
> +#
> +# Power management
> +#
> +CONFIG_PLAT_ORION=3Dy
> +
> +#
> +# Processor Type
> +#
> +CONFIG_CPU_32=3Dy
> +CONFIG_CPU_FEROCEON=3Dy
> +CONFIG_CPU_FEROCEON_OLD_ID=3Dy
> +CONFIG_CPU_32v5=3Dy
> +CONFIG_CPU_ABRT_EV5T=3Dy
> +CONFIG_CPU_PABRT_NOIFAR=3Dy
> +CONFIG_CPU_CACHE_VIVT=3Dy
> +CONFIG_CPU_COPY_FEROCEON=3Dy
> +CONFIG_CPU_TLB_FEROCEON=3Dy
> +CONFIG_CPU_CP15=3Dy
> +CONFIG_CPU_CP15_MMU=3Dy
> +
> +#
> +# Processor Features
> +#
> +CONFIG_ARM_THUMB=3Dy
> +# CONFIG_CPU_ICACHE_DISABLE is not set
> +# CONFIG_CPU_DCACHE_DISABLE is not set
> +# CONFIG_OUTER_CACHE is not set
> +
> +#
> +# Bus support
> +#
> +CONFIG_PCI=3Dy
> +CONFIG_PCI_SYSCALL=3Dy
> +# CONFIG_ARCH_SUPPORTS_MSI is not set
> +CONFIG_PCI_LEGACY=3Dy
> +# CONFIG_PCI_DEBUG is not set
> +# CONFIG_PCCARD is not set
> +
> +#
> +# Kernel Features
> +#
> +# CONFIG_NO_HZ is not set
> +# CONFIG_HIGH_RES_TIMERS is not set
> +CONFIG_GENERIC_CLOCKEVENTS_BUILD=3Dy
> +CONFIG_VMSPLIT_3G=3Dy
> +# CONFIG_VMSPLIT_2G is not set
> +# CONFIG_VMSPLIT_1G is not set
> +CONFIG_PAGE_OFFSET=3D0xC0000000
> +CONFIG_PREEMPT=3Dy
> +CONFIG_HZ=3D100
> +CONFIG_AEABI=3Dy
> +CONFIG_OABI_COMPAT=3Dy
> +CONFIG_ARCH_FLATMEM_HAS_HOLES=3Dy
> +# CONFIG_ARCH_SPARSEMEM_DEFAULT is not set
> +# CONFIG_ARCH_SELECT_MEMORY_MODEL is not set
> +CONFIG_SELECT_MEMORY_MODEL=3Dy
> +CONFIG_FLATMEM_MANUAL=3Dy
> +# CONFIG_DISCONTIGMEM_MANUAL is not set
> +# CONFIG_SPARSEMEM_MANUAL is not set
> +CONFIG_FLATMEM=3Dy
> +CONFIG_FLAT_NODE_MEM_MAP=3Dy
> +CONFIG_PAGEFLAGS_EXTENDED=3Dy
> +CONFIG_SPLIT_PTLOCK_CPUS=3D4096
> +# CONFIG_RESOURCES_64BIT is not set
> +# CONFIG_PHYS_ADDR_T_64BIT is not set
> +CONFIG_ZONE_DMA_FLAG=3D0
> +CONFIG_VIRT_TO_BUS=3Dy
> +CONFIG_UNEVICTABLE_LRU=3Dy
> +CONFIG_ALIGNMENT_TRAP=3Dy
> +
> +#
> +# Boot options
> +#
> +CONFIG_ZBOOT_ROM_TEXT=3D0x0
> +CONFIG_ZBOOT_ROM_BSS=3D0x0
> +CONFIG_CMDLINE=3D"root=3D/dev/ram0 rw lpj=3D1662976 init=3D/linuxrc cons=
ole=3DttyS0,115200n8 debug"
> +# CONFIG_XIP_KERNEL is not set
> +# CONFIG_KEXEC is not set
> +
> +#
> +# CPU Power Management
> +#
> +# CONFIG_CPU_IDLE is not set
> +
> +#
> +# Floating point emulation
> +#
> +
> +#
> +# At least one emulation must be selected
> +#
> +CONFIG_FPE_NWFPE=3Dy
> +CONFIG_FPE_NWFPE_XP=3Dy
> +# CONFIG_FPE_FASTFPE is not set
> +# CONFIG_VFP is not set
> +
> +#
> +# Userspace binary formats
> +#
> +CONFIG_BINFMT_ELF=3Dy
> +# CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
> +CONFIG_HAVE_AOUT=3Dy
> +# CONFIG_BINFMT_AOUT is not set
> +# CONFIG_BINFMT_MISC is not set
> +
> +#
> +# Power management options
> +#
> +# CONFIG_PM is not set
> +CONFIG_ARCH_SUSPEND_POSSIBLE=3Dy
> +CONFIG_NET=3Dy
> +
> +#
> +# Networking options
> +#
> +CONFIG_PACKET=3Dy
> +CONFIG_PACKET_MMAP=3Dy
> +CONFIG_UNIX=3Dy
> +# CONFIG_NET_KEY is not set
> +CONFIG_INET=3Dy
> +CONFIG_IP_MULTICAST=3Dy
> +# CONFIG_IP_ADVANCED_ROUTER is not set
> +CONFIG_IP_FIB_HASH=3Dy
> +CONFIG_IP_PNP=3Dy
> +CONFIG_IP_PNP_DHCP=3Dy
> +# CONFIG_IP_PNP_BOOTP is not set
> +# CONFIG_IP_PNP_RARP is not set
> +# CONFIG_NET_IPIP is not set
> +# CONFIG_NET_IPGRE is not set
> +# CONFIG_IP_MROUTE is not set
> +# CONFIG_ARPD is not set
> +# CONFIG_SYN_COOKIES is not set
> +# CONFIG_INET_AH is not set
> +# CONFIG_INET_ESP is not set
> +# CONFIG_INET_IPCOMP is not set
> +# CONFIG_INET_XFRM_TUNNEL is not set
> +# CONFIG_INET_TUNNEL is not set
> +# CONFIG_INET_XFRM_MODE_TRANSPORT is not set
> +# CONFIG_INET_XFRM_MODE_TUNNEL is not set
> +# CONFIG_INET_XFRM_MODE_BEET is not set
> +# CONFIG_INET_LRO is not set
> +# CONFIG_INET_DIAG is not set
> +# CONFIG_TCP_CONG_ADVANCED is not set
> +CONFIG_TCP_CONG_CUBIC=3Dy
> +CONFIG_DEFAULT_TCP_CONG=3D"cubic"
> +# CONFIG_TCP_MD5SIG is not set
> +# CONFIG_IPV6 is not set
> +# CONFIG_NETWORK_SECMARK is not set
> +# CONFIG_NETFILTER is not set
> +# CONFIG_IP_DCCP is not set
> +# CONFIG_IP_SCTP is not set
> +# CONFIG_TIPC is not set
> +# CONFIG_ATM is not set
> +# CONFIG_BRIDGE is not set
> +# CONFIG_NET_DSA is not set
> +# CONFIG_VLAN_8021Q is not set
> +# CONFIG_DECNET is not set
> +# CONFIG_LLC2 is not set
> +# CONFIG_IPX is not set
> +# CONFIG_ATALK is not set
> +# CONFIG_X25 is not set
> +# CONFIG_LAPB is not set
> +# CONFIG_ECONET is not set
> +# CONFIG_WAN_ROUTER is not set
> +# CONFIG_NET_SCHED is not set
> +
> +#
> +# Network testing
> +#
> +# CONFIG_NET_PKTGEN is not set
> +# CONFIG_HAMRADIO is not set
> +# CONFIG_CAN is not set
> +# CONFIG_IRDA is not set
> +# CONFIG_BT is not set
> +# CONFIG_AF_RXRPC is not set
> +# CONFIG_PHONET is not set
> +CONFIG_WIRELESS=3Dy
> +CONFIG_CFG80211=3Dm
> +CONFIG_NL80211=3Dy
> +CONFIG_WIRELESS_OLD_REGULATORY=3Dy
> +CONFIG_WIRELESS_EXT=3Dy
> +CONFIG_WIRELESS_EXT_SYSFS=3Dy
> +CONFIG_MAC80211=3Dm
> +
> +#
> +# Rate control algorithm selection
> +#
> +CONFIG_MAC80211_RC_PID=3Dy
> +# CONFIG_MAC80211_RC_MINSTREL is not set
> +CONFIG_MAC80211_RC_DEFAULT_PID=3Dy
> +# CONFIG_MAC80211_RC_DEFAULT_MINSTREL is not set
> +CONFIG_MAC80211_RC_DEFAULT=3D"pid"
> +# CONFIG_MAC80211_MESH is not set
> +# CONFIG_MAC80211_LEDS is not set
> +# CONFIG_MAC80211_DEBUG_MENU is not set
> +CONFIG_IEEE80211=3Dm
> +# CONFIG_IEEE80211_DEBUG is not set
> +CONFIG_IEEE80211_CRYPT_WEP=3Dm
> +CONFIG_IEEE80211_CRYPT_CCMP=3Dm
> +CONFIG_IEEE80211_CRYPT_TKIP=3Dm
> +# CONFIG_RFKILL is not set
> +# CONFIG_NET_9P is not set
> +
> +#
> +# Device Drivers
> +#
> +
> +#
> +# Generic Driver Options
> +#
> +CONFIG_UEVENT_HELPER_PATH=3D"/sbin/hotplug"
> +# CONFIG_STANDALONE is not set
> +# CONFIG_PREVENT_FIRMWARE_BUILD is not set
> +CONFIG_FW_LOADER=3Dy
> +CONFIG_FIRMWARE_IN_KERNEL=3Dy
> +CONFIG_EXTRA_FIRMWARE=3D""
> +CONFIG_DEBUG_DRIVER=3Dy
> +# CONFIG_DEBUG_DEVRES is not set
> +# CONFIG_SYS_HYPERVISOR is not set
> +# CONFIG_CONNECTOR is not set
> +CONFIG_MTD=3Dy
> +# CONFIG_MTD_DEBUG is not set
> +# CONFIG_MTD_CONCAT is not set
> +CONFIG_MTD_PARTITIONS=3Dy
> +# CONFIG_MTD_REDBOOT_PARTS is not set
> +# CONFIG_MTD_CMDLINE_PARTS is not set
> +# CONFIG_MTD_AFS_PARTS is not set
> +# CONFIG_MTD_AR7_PARTS is not set
> +
> +#
> +# User Modules And Translation Layers
> +#
> +CONFIG_MTD_CHAR=3Dy
> +CONFIG_MTD_BLKDEVS=3Dy
> +CONFIG_MTD_BLOCK=3Dy
> +CONFIG_FTL=3Dm
> +CONFIG_NFTL=3Dm
> +# CONFIG_NFTL_RW is not set
> +CONFIG_INFTL=3Dm
> +CONFIG_RFD_FTL=3Dm
> +CONFIG_SSFDC=3Dm
> +CONFIG_MTD_OOPS=3Dm
> +
> +#
> +# RAM/ROM/Flash chip drivers
> +#
> +# CONFIG_MTD_CFI is not set
> +# CONFIG_MTD_JEDECPROBE is not set
> +CONFIG_MTD_MAP_BANK_WIDTH_1=3Dy
> +CONFIG_MTD_MAP_BANK_WIDTH_2=3Dy
> +CONFIG_MTD_MAP_BANK_WIDTH_4=3Dy
> +# CONFIG_MTD_MAP_BANK_WIDTH_8 is not set
> +# CONFIG_MTD_MAP_BANK_WIDTH_16 is not set
> +# CONFIG_MTD_MAP_BANK_WIDTH_32 is not set
> +CONFIG_MTD_CFI_I1=3Dy
> +CONFIG_MTD_CFI_I2=3Dy
> +# CONFIG_MTD_CFI_I4 is not set
> +# CONFIG_MTD_CFI_I8 is not set
> +# CONFIG_MTD_RAM is not set
> +# CONFIG_MTD_ROM is not set
> +# CONFIG_MTD_ABSENT is not set
> +
> +#
> +# Mapping drivers for chip access
> +#
> +# CONFIG_MTD_COMPLEX_MAPPINGS is not set
> +# CONFIG_MTD_INTEL_VR_NOR is not set
> +# CONFIG_MTD_PLATRAM is not set
> +
> +#
> +# Self-contained MTD device drivers
> +#
> +# CONFIG_MTD_PMC551 is not set
> +# CONFIG_MTD_DATAFLASH is not set
> +# CONFIG_MTD_M25P80 is not set
> +# CONFIG_MTD_SLRAM is not set
> +# CONFIG_MTD_PHRAM is not set
> +# CONFIG_MTD_MTDRAM is not set
> +# CONFIG_MTD_BLOCK2MTD is not set
> +
> +#
> +# Disk-On-Chip Device Drivers
> +#
> +# CONFIG_MTD_DOC2000 is not set
> +# CONFIG_MTD_DOC2001 is not set
> +# CONFIG_MTD_DOC2001PLUS is not set
> +CONFIG_MTD_NAND=3Dy
> +# CONFIG_MTD_NAND_VERIFY_WRITE is not set
> +# CONFIG_MTD_NAND_ECC_SMC is not set
> +# CONFIG_MTD_NAND_MUSEUM_IDS is not set
> +# CONFIG_MTD_NAND_GPIO is not set
> +CONFIG_MTD_NAND_IDS=3Dy
> +# CONFIG_MTD_NAND_DISKONCHIP is not set
> +# CONFIG_MTD_NAND_CAFE is not set
> +# CONFIG_MTD_NAND_NANDSIM is not set
> +# CONFIG_MTD_NAND_PLATFORM is not set
> +# CONFIG_MTD_ALAUDA is not set
> +# CONFIG_MTD_NAND_ORION is not set
> +# CONFIG_MTD_ONENAND is not set
> +
> +#
> +# UBI - Unsorted block images
> +#
> +# CONFIG_MTD_UBI is not set
> +# CONFIG_PARPORT is not set
> +CONFIG_BLK_DEV=3Dy
> +# CONFIG_BLK_CPQ_DA is not set
> +# CONFIG_BLK_CPQ_CISS_DA is not set
> +# CONFIG_BLK_DEV_DAC960 is not set
> +# CONFIG_BLK_DEV_UMEM is not set
> +# CONFIG_BLK_DEV_COW_COMMON is not set
> +CONFIG_BLK_DEV_LOOP=3Dy
> +# CONFIG_BLK_DEV_CRYPTOLOOP is not set
> +# CONFIG_BLK_DEV_NBD is not set
> +# CONFIG_BLK_DEV_SX8 is not set
> +# CONFIG_BLK_DEV_UB is not set
> +CONFIG_BLK_DEV_RAM=3Dy
> +CONFIG_BLK_DEV_RAM_COUNT=3D2
> +CONFIG_BLK_DEV_RAM_SIZE=3D4096
> +# CONFIG_BLK_DEV_XIP is not set
> +# CONFIG_CDROM_PKTCDVD is not set
> +# CONFIG_ATA_OVER_ETH is not set
> +CONFIG_MISC_DEVICES=3Dy
> +# CONFIG_PHANTOM is not set
> +# CONFIG_EEPROM_93CX6 is not set
> +# CONFIG_SGI_IOC4 is not set
> +CONFIG_TIFM_CORE=3Dm
> +CONFIG_TIFM_7XX1=3Dm
> +# CONFIG_ICS932S401 is not set
> +# CONFIG_ENCLOSURE_SERVICES is not set
> +# CONFIG_HP_ILO is not set
> +# CONFIG_C2PORT is not set
> +CONFIG_HAVE_IDE=3Dy
> +CONFIG_IDE=3Dm
> +
> +#
> +# Please see Documentation/ide/ide.txt for help/info on IDE drives
> +#
> +# CONFIG_BLK_DEV_IDE_SATA is not set
> +CONFIG_IDE_GD=3Dm
> +CONFIG_IDE_GD_ATA=3Dy
> +# CONFIG_IDE_GD_ATAPI is not set
> +# CONFIG_BLK_DEV_IDECD is not set
> +# CONFIG_BLK_DEV_IDETAPE is not set
> +# CONFIG_BLK_DEV_IDESCSI is not set
> +# CONFIG_IDE_TASK_IOCTL is not set
> +CONFIG_IDE_PROC_FS=3Dy
> +
> +#
> +# IDE chipset support/bugfixes
> +#
> +# CONFIG_BLK_DEV_PLATFORM is not set
> +
> +#
> +# PCI IDE chipsets support
> +#
> +# CONFIG_BLK_DEV_GENERIC is not set
> +# CONFIG_BLK_DEV_OPTI621 is not set
> +# CONFIG_BLK_DEV_AEC62XX is not set
> +# CONFIG_BLK_DEV_ALI15X3 is not set
> +# CONFIG_BLK_DEV_CMD64X is not set
> +# CONFIG_BLK_DEV_TRIFLEX is not set
> +# CONFIG_BLK_DEV_CS5520 is not set
> +# CONFIG_BLK_DEV_CS5530 is not set
> +# CONFIG_BLK_DEV_HPT366 is not set
> +# CONFIG_BLK_DEV_JMICRON is not set
> +# CONFIG_BLK_DEV_SC1200 is not set
> +# CONFIG_BLK_DEV_PIIX is not set
> +# CONFIG_BLK_DEV_IT8213 is not set
> +# CONFIG_BLK_DEV_IT821X is not set
> +# CONFIG_BLK_DEV_NS87415 is not set
> +# CONFIG_BLK_DEV_PDC202XX_OLD is not set
> +# CONFIG_BLK_DEV_PDC202XX_NEW is not set
> +# CONFIG_BLK_DEV_SVWKS is not set
> +# CONFIG_BLK_DEV_SIIMAGE is not set
> +# CONFIG_BLK_DEV_SL82C105 is not set
> +# CONFIG_BLK_DEV_SLC90E66 is not set
> +# CONFIG_BLK_DEV_TRM290 is not set
> +# CONFIG_BLK_DEV_VIA82CXXX is not set
> +# CONFIG_BLK_DEV_TC86C001 is not set
> +# CONFIG_BLK_DEV_IDEDMA is not set
> +
> +#
> +# SCSI device support
> +#
> +# CONFIG_RAID_ATTRS is not set
> +CONFIG_SCSI=3Dm
> +CONFIG_SCSI_DMA=3Dy
> +# CONFIG_SCSI_TGT is not set
> +# CONFIG_SCSI_NETLINK is not set
> +# CONFIG_SCSI_PROC_FS is not set
> +
> +#
> +# SCSI support type (disk, tape, CD-ROM)
> +#
> +CONFIG_BLK_DEV_SD=3Dm
> +# CONFIG_CHR_DEV_ST is not set
> +# CONFIG_CHR_DEV_OSST is not set
> +# CONFIG_BLK_DEV_SR is not set
> +CONFIG_CHR_DEV_SG=3Dm
> +# CONFIG_CHR_DEV_SCH is not set
> +
> +#
> +# Some SCSI devices (e.g. CD jukebox) support multiple LUNs
> +#
> +CONFIG_SCSI_MULTI_LUN=3Dy
> +# CONFIG_SCSI_CONSTANTS is not set
> +# CONFIG_SCSI_LOGGING is not set
> +CONFIG_SCSI_SCAN_ASYNC=3Dy
> +CONFIG_SCSI_WAIT_SCAN=3Dm
> +
> +#
> +# SCSI Transports
> +#
> +# CONFIG_SCSI_SPI_ATTRS is not set
> +# CONFIG_SCSI_FC_ATTRS is not set
> +# CONFIG_SCSI_ISCSI_ATTRS is not set
> +# CONFIG_SCSI_SAS_LIBSAS is not set
> +# CONFIG_SCSI_SRP_ATTRS is not set
> +CONFIG_SCSI_LOWLEVEL=3Dy
> +# CONFIG_ISCSI_TCP is not set
> +# CONFIG_BLK_DEV_3W_XXXX_RAID is not set
> +# CONFIG_SCSI_3W_9XXX is not set
> +# CONFIG_SCSI_ACARD is not set
> +# CONFIG_SCSI_AACRAID is not set
> +# CONFIG_SCSI_AIC7XXX is not set
> +# CONFIG_SCSI_AIC7XXX_OLD is not set
> +# CONFIG_SCSI_AIC79XX is not set
> +# CONFIG_SCSI_AIC94XX is not set
> +# CONFIG_SCSI_DPT_I2O is not set
> +# CONFIG_SCSI_ADVANSYS is not set
> +# CONFIG_SCSI_ARCMSR is not set
> +# CONFIG_MEGARAID_NEWGEN is not set
> +# CONFIG_MEGARAID_LEGACY is not set
> +# CONFIG_MEGARAID_SAS is not set
> +# CONFIG_SCSI_HPTIOP is not set
> +# CONFIG_SCSI_DMX3191D is not set
> +# CONFIG_SCSI_FUTURE_DOMAIN is not set
> +# CONFIG_SCSI_IPS is not set
> +# CONFIG_SCSI_INITIO is not set
> +# CONFIG_SCSI_INIA100 is not set
> +# CONFIG_SCSI_MVSAS is not set
> +# CONFIG_SCSI_STEX is not set
> +# CONFIG_SCSI_SYM53C8XX_2 is not set
> +# CONFIG_SCSI_IPR is not set
> +# CONFIG_SCSI_QLOGIC_1280 is not set
> +# CONFIG_SCSI_QLA_FC is not set
> +# CONFIG_SCSI_QLA_ISCSI is not set
> +# CONFIG_SCSI_LPFC is not set
> +# CONFIG_SCSI_DC395x is not set
> +# CONFIG_SCSI_DC390T is not set
> +# CONFIG_SCSI_NSP32 is not set
> +# CONFIG_SCSI_DEBUG is not set
> +# CONFIG_SCSI_SRP is not set
> +# CONFIG_SCSI_DH is not set
> +CONFIG_ATA=3Dm
> +# CONFIG_ATA_NONSTANDARD is not set
> +CONFIG_SATA_PMP=3Dy
> +# CONFIG_SATA_AHCI is not set
> +# CONFIG_SATA_SIL24 is not set
> +CONFIG_ATA_SFF=3Dy
> +# CONFIG_SATA_SVW is not set
> +# CONFIG_ATA_PIIX is not set
> +# CONFIG_SATA_MV is not set
> +# CONFIG_SATA_NV is not set
> +# CONFIG_PDC_ADMA is not set
> +# CONFIG_SATA_QSTOR is not set
> +# CONFIG_SATA_PROMISE is not set
> +# CONFIG_SATA_SX4 is not set
> +# CONFIG_SATA_SIL is not set
> +# CONFIG_SATA_SIS is not set
> +# CONFIG_SATA_ULI is not set
> +# CONFIG_SATA_VIA is not set
> +# CONFIG_SATA_VITESSE is not set
> +# CONFIG_SATA_INIC162X is not set
> +# CONFIG_PATA_ALI is not set
> +# CONFIG_PATA_AMD is not set
> +# CONFIG_PATA_ARTOP is not set
> +# CONFIG_PATA_ATIIXP is not set
> +# CONFIG_PATA_CMD640_PCI is not set
> +# CONFIG_PATA_CMD64X is not set
> +# CONFIG_PATA_CS5520 is not set
> +# CONFIG_PATA_CS5530 is not set
> +# CONFIG_PATA_CYPRESS is not set
> +# CONFIG_PATA_EFAR is not set
> +# CONFIG_ATA_GENERIC is not set
> +# CONFIG_PATA_HPT366 is not set
> +# CONFIG_PATA_HPT37X is not set
> +# CONFIG_PATA_HPT3X2N is not set
> +# CONFIG_PATA_HPT3X3 is not set
> +# CONFIG_PATA_IT821X is not set
> +# CONFIG_PATA_IT8213 is not set
> +# CONFIG_PATA_JMICRON is not set
> +# CONFIG_PATA_TRIFLEX is not set
> +# CONFIG_PATA_MARVELL is not set
> +# CONFIG_PATA_MPIIX is not set
> +# CONFIG_PATA_OLDPIIX is not set
> +# CONFIG_PATA_NETCELL is not set
> +# CONFIG_PATA_NINJA32 is not set
> +# CONFIG_PATA_NS87410 is not set
> +# CONFIG_PATA_NS87415 is not set
> +# CONFIG_PATA_OPTI is not set
> +# CONFIG_PATA_OPTIDMA is not set
> +# CONFIG_PATA_PDC_OLD is not set
> +# CONFIG_PATA_RADISYS is not set
> +# CONFIG_PATA_RZ1000 is not set
> +# CONFIG_PATA_SC1200 is not set
> +# CONFIG_PATA_SERVERWORKS is not set
> +# CONFIG_PATA_PDC2027X is not set
> +# CONFIG_PATA_SIL680 is not set
> +# CONFIG_PATA_SIS is not set
> +# CONFIG_PATA_VIA is not set
> +# CONFIG_PATA_WINBOND is not set
> +# CONFIG_PATA_SCH is not set
> +CONFIG_MD=3Dy
> +CONFIG_BLK_DEV_MD=3Dm
> +CONFIG_MD_LINEAR=3Dm
> +CONFIG_MD_RAID0=3Dm
> +CONFIG_MD_RAID1=3Dm
> +# CONFIG_MD_RAID10 is not set
> +# CONFIG_MD_RAID456 is not set
> +# CONFIG_MD_MULTIPATH is not set
> +# CONFIG_MD_FAULTY is not set
> +# CONFIG_BLK_DEV_DM is not set
> +# CONFIG_FUSION is not set
> +
> +#
> +# IEEE 1394 (FireWire) support
> +#
> +
> +#
> +# Enable only one of the two stacks, unless you know what you are doing
> +#
> +# CONFIG_FIREWIRE is not set
> +# CONFIG_IEEE1394 is not set
> +# CONFIG_I2O is not set
> +CONFIG_NETDEVICES=3Dy
> +CONFIG_DUMMY=3Dm
> +# CONFIG_BONDING is not set
> +# CONFIG_MACVLAN is not set
> +# CONFIG_EQUALIZER is not set
> +CONFIG_TUN=3Dm
> +# CONFIG_VETH is not set
> +# CONFIG_ARCNET is not set
> +CONFIG_PHYLIB=3Dy
> +
> +#
> +# MII PHY device drivers
> +#
> +CONFIG_MARVELL_PHY=3Dy
> +# CONFIG_DAVICOM_PHY is not set
> +# CONFIG_QSEMI_PHY is not set
> +# CONFIG_LXT_PHY is not set
> +# CONFIG_CICADA_PHY is not set
> +# CONFIG_VITESSE_PHY is not set
> +# CONFIG_SMSC_PHY is not set
> +# CONFIG_BROADCOM_PHY is not set
> +# CONFIG_ICPLUS_PHY is not set
> +# CONFIG_REALTEK_PHY is not set
> +# CONFIG_FIXED_PHY is not set
> +# CONFIG_MDIO_BITBANG is not set
> +# CONFIG_NET_ETHERNET is not set
> +CONFIG_MII=3Dm
> +CONFIG_NETDEV_1000=3Dy
> +# CONFIG_ACENIC is not set
> +# CONFIG_DL2K is not set
> +# CONFIG_E1000 is not set
> +# CONFIG_E1000E is not set
> +# CONFIG_IP1000 is not set
> +# CONFIG_IGB is not set
> +# CONFIG_NS83820 is not set
> +# CONFIG_HAMACHI is not set
> +# CONFIG_YELLOWFIN is not set
> +# CONFIG_R8169 is not set
> +# CONFIG_SIS190 is not set
> +# CONFIG_SKGE is not set
> +# CONFIG_SKY2 is not set
> +# CONFIG_VIA_VELOCITY is not set
> +# CONFIG_TIGON3 is not set
> +# CONFIG_BNX2 is not set
> +CONFIG_MV643XX_ETH=3Dy
> +# CONFIG_QLA3XXX is not set
> +# CONFIG_ATL1 is not set
> +# CONFIG_ATL1E is not set
> +# CONFIG_JME is not set
> +# CONFIG_NETDEV_10000 is not set
> +# CONFIG_TR is not set
> +
> +#
> +# Wireless LAN
> +#
> +# CONFIG_WLAN_PRE80211 is not set
> +CONFIG_WLAN_80211=3Dy
> +# CONFIG_IPW2100 is not set
> +# CONFIG_IPW2200 is not set
> +# CONFIG_LIBERTAS is not set
> +# CONFIG_LIBERTAS_THINFIRM is not set
> +# CONFIG_HERMES is not set
> +# CONFIG_ATMEL is not set
> +# CONFIG_PRISM54 is not set
> +CONFIG_USB_ZD1201=3Dm
> +# CONFIG_USB_NET_RNDIS_WLAN is not set
> +# CONFIG_RTL8180 is not set
> +# CONFIG_RTL8187 is not set
> +# CONFIG_ADM8211 is not set
> +# CONFIG_MAC80211_HWSIM is not set
> +# CONFIG_P54_COMMON is not set
> +# CONFIG_ATH5K is not set
> +# CONFIG_ATH9K is not set
> +# CONFIG_IWLCORE is not set
> +# CONFIG_IWLWIFI_LEDS is not set
> +# CONFIG_IWLAGN is not set
> +# CONFIG_IWL3945 is not set
> +# CONFIG_HOSTAP is not set
> +# CONFIG_B43 is not set
> +# CONFIG_B43LEGACY is not set
> +CONFIG_ZD1211RW=3Dm
> +# CONFIG_ZD1211RW_DEBUG is not set
> +# CONFIG_RT2X00 is not set
> +
> +#
> +# USB Network Adapters
> +#
> +CONFIG_USB_CATC=3Dm
> +CONFIG_USB_KAWETH=3Dm
> +CONFIG_USB_PEGASUS=3Dm
> +CONFIG_USB_RTL8150=3Dm
> +CONFIG_USB_USBNET=3Dm
> +CONFIG_USB_NET_AX8817X=3Dm
> +CONFIG_USB_NET_CDCETHER=3Dm
> +CONFIG_USB_NET_DM9601=3Dm
> +CONFIG_USB_NET_SMSC95XX=3Dm
> +CONFIG_USB_NET_GL620A=3Dm
> +CONFIG_USB_NET_NET1080=3Dm
> +CONFIG_USB_NET_PLUSB=3Dm
> +CONFIG_USB_NET_MCS7830=3Dm
> +CONFIG_USB_NET_RNDIS_HOST=3Dm
> +CONFIG_USB_NET_CDC_SUBSET=3Dm
> +# CONFIG_USB_ALI_M5632 is not set
> +# CONFIG_USB_AN2720 is not set
> +CONFIG_USB_BELKIN=3Dy
> +CONFIG_USB_ARMLINUX=3Dy
> +# CONFIG_USB_EPSON2888 is not set
> +# CONFIG_USB_KC2190 is not set
> +CONFIG_USB_NET_ZAURUS=3Dm
> +# CONFIG_WAN is not set
> +# CONFIG_FDDI is not set
> +# CONFIG_HIPPI is not set
> +CONFIG_PPP=3Dm
> +# CONFIG_PPP_MULTILINK is not set
> +CONFIG_PPP_FILTER=3Dy
> +CONFIG_PPP_ASYNC=3Dm
> +CONFIG_PPP_SYNC_TTY=3Dm
> +CONFIG_PPP_DEFLATE=3Dm
> +CONFIG_PPP_BSDCOMP=3Dm
> +CONFIG_PPP_MPPE=3Dm
> +CONFIG_PPPOE=3Dm
> +CONFIG_PPPOL2TP=3Dm
> +CONFIG_SLIP=3Dm
> +# CONFIG_SLIP_COMPRESSED is not set
> +CONFIG_SLHC=3Dm
> +# CONFIG_SLIP_SMART is not set
> +# CONFIG_SLIP_MODE_SLIP6 is not set
> +# CONFIG_NET_FC is not set
> +# CONFIG_NETCONSOLE is not set
> +# CONFIG_NETPOLL is not set
> +# CONFIG_NET_POLL_CONTROLLER is not set
> +# CONFIG_ISDN is not set
> +
> +#
> +# Input device support
> +#
> +CONFIG_INPUT=3Dy
> +# CONFIG_INPUT_FF_MEMLESS is not set
> +# CONFIG_INPUT_POLLDEV is not set
> +
> +#
> +# Userland interfaces
> +#
> +CONFIG_INPUT_MOUSEDEV=3Dy
> +CONFIG_INPUT_MOUSEDEV_PSAUX=3Dy
> +CONFIG_INPUT_MOUSEDEV_SCREEN_X=3D1024
> +CONFIG_INPUT_MOUSEDEV_SCREEN_Y=3D768
> +# CONFIG_INPUT_JOYDEV is not set
> +# CONFIG_INPUT_EVDEV is not set
> +# CONFIG_INPUT_EVBUG is not set
> +
> +#
> +# Input Device Drivers
> +#
> +CONFIG_INPUT_KEYBOARD=3Dy
> +CONFIG_KEYBOARD_ATKBD=3Dm
> +# CONFIG_KEYBOARD_SUNKBD is not set
> +# CONFIG_KEYBOARD_LKKBD is not set
> +# CONFIG_KEYBOARD_XTKBD is not set
> +# CONFIG_KEYBOARD_NEWTON is not set
> +# CONFIG_KEYBOARD_STOWAWAY is not set
> +# CONFIG_KEYBOARD_GPIO is not set
> +CONFIG_INPUT_MOUSE=3Dy
> +CONFIG_MOUSE_PS2=3Dm
> +CONFIG_MOUSE_PS2_ALPS=3Dy
> +CONFIG_MOUSE_PS2_LOGIPS2PP=3Dy
> +CONFIG_MOUSE_PS2_SYNAPTICS=3Dy
> +CONFIG_MOUSE_PS2_LIFEBOOK=3Dy
> +CONFIG_MOUSE_PS2_TRACKPOINT=3Dy
> +# CONFIG_MOUSE_PS2_ELANTECH is not set
> +# CONFIG_MOUSE_PS2_TOUCHKIT is not set
> +CONFIG_MOUSE_SERIAL=3Dm
> +# CONFIG_MOUSE_APPLETOUCH is not set
> +# CONFIG_MOUSE_BCM5974 is not set
> +# CONFIG_MOUSE_VSXXXAA is not set
> +# CONFIG_MOUSE_GPIO is not set
> +# CONFIG_INPUT_JOYSTICK is not set
> +# CONFIG_INPUT_TABLET is not set
> +CONFIG_INPUT_TOUCHSCREEN=3Dy
> +# CONFIG_TOUCHSCREEN_ADS7846 is not set
> +# CONFIG_TOUCHSCREEN_FUJITSU is not set
> +# CONFIG_TOUCHSCREEN_GUNZE is not set
> +# CONFIG_TOUCHSCREEN_ELO is not set
> +# CONFIG_TOUCHSCREEN_MTOUCH is not set
> +# CONFIG_TOUCHSCREEN_INEXIO is not set
> +# CONFIG_TOUCHSCREEN_MK712 is not set
> +# CONFIG_TOUCHSCREEN_PENMOUNT is not set
> +# CONFIG_TOUCHSCREEN_TOUCHRIGHT is not set
> +# CONFIG_TOUCHSCREEN_TOUCHWIN is not set
> +# CONFIG_TOUCHSCREEN_USB_COMPOSITE is not set
> +# CONFIG_TOUCHSCREEN_TOUCHIT213 is not set
> +# CONFIG_INPUT_MISC is not set
> +
> +#
> +# Hardware I/O ports
> +#
> +CONFIG_SERIO=3Dm
> +CONFIG_SERIO_SERPORT=3Dm
> +# CONFIG_SERIO_PCIPS2 is not set
> +CONFIG_SERIO_LIBPS2=3Dm
> +# CONFIG_SERIO_RAW is not set
> +# CONFIG_GAMEPORT is not set
> +
> +#
> +# Character devices
> +#
> +CONFIG_VT=3Dy
> +CONFIG_CONSOLE_TRANSLATIONS=3Dy
> +CONFIG_VT_CONSOLE=3Dy
> +CONFIG_HW_CONSOLE=3Dy
> +# CONFIG_VT_HW_CONSOLE_BINDING is not set
> +CONFIG_DEVKMEM=3Dy
> +# CONFIG_SERIAL_NONSTANDARD is not set
> +# CONFIG_NOZOMI is not set
> +
> +#
> +# Serial drivers
> +#
> +CONFIG_SERIAL_8250=3Dy
> +CONFIG_SERIAL_8250_CONSOLE=3Dy
> +CONFIG_SERIAL_8250_PCI=3Dy
> +CONFIG_SERIAL_8250_NR_UARTS=3D8
> +CONFIG_SERIAL_8250_RUNTIME_UARTS=3D8
> +# CONFIG_SERIAL_8250_EXTENDED is not set
> +
> +#
> +# Non-8250 serial port support
> +#
> +CONFIG_SERIAL_CORE=3Dy
> +CONFIG_SERIAL_CORE_CONSOLE=3Dy
> +# CONFIG_SERIAL_JSM is not set
> +CONFIG_UNIX98_PTYS=3Dy
> +CONFIG_LEGACY_PTYS=3Dy
> +CONFIG_LEGACY_PTY_COUNT=3D16
> +# CONFIG_IPMI_HANDLER is not set
> +# CONFIG_HW_RANDOM is not set
> +# CONFIG_NVRAM is not set
> +# CONFIG_R3964 is not set
> +# CONFIG_APPLICOM is not set
> +# CONFIG_RAW_DRIVER is not set
> +# CONFIG_TCG_TPM is not set
> +CONFIG_DEVPORT=3Dy
> +CONFIG_I2C=3Dm
> +CONFIG_I2C_BOARDINFO=3Dy
> +CONFIG_I2C_CHARDEV=3Dm
> +# CONFIG_I2C_HELPER_AUTO is not set
> +
> +#
> +# I2C Algorithms
> +#
> +CONFIG_I2C_ALGOBIT=3Dm
> +CONFIG_I2C_ALGOPCF=3Dm
> +CONFIG_I2C_ALGOPCA=3Dm
> +
> +#
> +# I2C Hardware Bus support
> +#
> +
> +#
> +# PC SMBus host controller drivers
> +#
> +CONFIG_I2C_ALI1535=3Dm
> +CONFIG_I2C_ALI1563=3Dm
> +CONFIG_I2C_ALI15X3=3Dm
> +CONFIG_I2C_AMD756=3Dm
> +CONFIG_I2C_AMD8111=3Dm
> +CONFIG_I2C_I801=3Dm
> +CONFIG_I2C_ISCH=3Dm
> +CONFIG_I2C_PIIX4=3Dm
> +CONFIG_I2C_NFORCE2=3Dm
> +CONFIG_I2C_SIS5595=3Dm
> +CONFIG_I2C_SIS630=3Dm
> +CONFIG_I2C_SIS96X=3Dm
> +CONFIG_I2C_VIA=3Dm
> +CONFIG_I2C_VIAPRO=3Dm
> +
> +#
> +# I2C system bus drivers (mostly embedded / system-on-chip)
> +#
> +CONFIG_I2C_GPIO=3Dm
> +CONFIG_I2C_MV64XXX=3Dm
> +CONFIG_I2C_OCORES=3Dm
> +CONFIG_I2C_SIMTEC=3Dm
> +
> +#
> +# External I2C/SMBus adapter drivers
> +#
> +CONFIG_I2C_PARPORT_LIGHT=3Dm
> +CONFIG_I2C_TAOS_EVM=3Dm
> +CONFIG_I2C_TINY_USB=3Dm
> +
> +#
> +# Graphics adapter I2C/DDC channel drivers
> +#
> +CONFIG_I2C_VOODOO3=3Dm
> +
> +#
> +# Other I2C/SMBus bus drivers
> +#
> +CONFIG_I2C_PCA_PLATFORM=3Dm
> +CONFIG_I2C_STUB=3Dm
> +
> +#
> +# Miscellaneous I2C Chip support
> +#
> +CONFIG_DS1682=3Dm
> +CONFIG_AT24=3Dm
> +CONFIG_SENSORS_EEPROM=3Dm
> +CONFIG_SENSORS_PCF8574=3Dm
> +CONFIG_PCF8575=3Dm
> +CONFIG_SENSORS_PCA9539=3Dm
> +CONFIG_SENSORS_PCF8591=3Dm
> +CONFIG_SENSORS_MAX6875=3Dm
> +CONFIG_SENSORS_TSL2550=3Dm
> +# CONFIG_I2C_DEBUG_CORE is not set
> +# CONFIG_I2C_DEBUG_ALGO is not set
> +# CONFIG_I2C_DEBUG_BUS is not set
> +# CONFIG_I2C_DEBUG_CHIP is not set
> +CONFIG_SPI=3Dy
> +# CONFIG_SPI_DEBUG is not set
> +CONFIG_SPI_MASTER=3Dy
> +
> +#
> +# SPI Master Controller Drivers
> +#
> +CONFIG_SPI_BITBANG=3Dm
> +CONFIG_SPI_ORION=3Dm
> +
> +#
> +# SPI Protocol Masters
> +#
> +CONFIG_SPI_AT25=3Dm
> +CONFIG_SPI_SPIDEV=3Dm
> +CONFIG_SPI_TLE62X0=3Dm
> +# CONFIG_W1 is not set
> +# CONFIG_POWER_SUPPLY is not set
> +# CONFIG_HWMON is not set
> +# CONFIG_THERMAL is not set
> +# CONFIG_THERMAL_HWMON is not set
> +# CONFIG_WATCHDOG is not set
> +CONFIG_SSB_POSSIBLE=3Dy
> +
> +#
> +# Sonics Silicon Backplane
> +#
> +# CONFIG_SSB is not set
> +
> +#
> +# Multifunction device drivers
> +#
> +# CONFIG_MFD_CORE is not set
> +# CONFIG_MFD_SM501 is not set
> +# CONFIG_HTC_PASIC3 is not set
> +# CONFIG_MFD_TMIO is not set
> +# CONFIG_MFD_WM8400 is not set
> +# CONFIG_MFD_WM8350_I2C is not set
> +
> +#
> +# Multimedia devices
> +#
> +
> +#
> +# Multimedia core support
> +#
> +CONFIG_VIDEO_DEV=3Dm
> +CONFIG_VIDEO_V4L2_COMMON=3Dm
> +# CONFIG_VIDEO_ALLOW_V4L1 is not set
> +CONFIG_VIDEO_V4L1_COMPAT=3Dy
> +# CONFIG_DVB_CORE is not set
> +CONFIG_VIDEO_MEDIA=3Dm
> +
> +#
> +# Multimedia drivers
> +#
> +# CONFIG_MEDIA_ATTACH is not set
> +CONFIG_MEDIA_TUNER=3Dm
> +# CONFIG_MEDIA_TUNER_CUSTOMIZE is not set
> +CONFIG_MEDIA_TUNER_SIMPLE=3Dm
> +CONFIG_MEDIA_TUNER_TDA8290=3Dm
> +CONFIG_MEDIA_TUNER_TDA9887=3Dm
> +CONFIG_MEDIA_TUNER_TEA5761=3Dm
> +CONFIG_MEDIA_TUNER_TEA5767=3Dm
> +CONFIG_MEDIA_TUNER_MT20XX=3Dm
> +CONFIG_MEDIA_TUNER_XC2028=3Dm
> +CONFIG_MEDIA_TUNER_XC5000=3Dm
> +CONFIG_VIDEO_V4L2=3Dm
> +CONFIG_VIDEOBUF_GEN=3Dm
> +CONFIG_VIDEOBUF_VMALLOC=3Dm
> +CONFIG_VIDEO_IR=3Dm
> +CONFIG_VIDEO_TVEEPROM=3Dm
> +CONFIG_VIDEO_TUNER=3Dm
> +CONFIG_VIDEO_CAPTURE_DRIVERS=3Dy
> +# CONFIG_VIDEO_ADV_DEBUG is not set
> +# CONFIG_VIDEO_FIXED_MINOR_RANGES is not set
> +CONFIG_VIDEO_HELPER_CHIPS_AUTO=3Dy
> +CONFIG_VIDEO_IR_I2C=3Dm
> +CONFIG_VIDEO_MSP3400=3Dm
> +CONFIG_VIDEO_CS53L32A=3Dm
> +CONFIG_VIDEO_WM8775=3Dm
> +CONFIG_VIDEO_SAA711X=3Dm
> +CONFIG_VIDEO_TVP5150=3Dm
> +CONFIG_VIDEO_CX25840=3Dm
> +CONFIG_VIDEO_CX2341X=3Dm
> +# CONFIG_VIDEO_VIVI is not set
> +# CONFIG_VIDEO_BT848 is not set
> +# CONFIG_VIDEO_SAA5246A is not set
> +# CONFIG_VIDEO_SAA5249 is not set
> +# CONFIG_VIDEO_SAA7134 is not set
> +# CONFIG_VIDEO_HEXIUM_ORION is not set
> +# CONFIG_VIDEO_HEXIUM_GEMINI is not set
> +# CONFIG_VIDEO_CX88 is not set
> +# CONFIG_VIDEO_IVTV is not set
> +# CONFIG_VIDEO_CAFE_CCIC is not set
> +# CONFIG_SOC_CAMERA is not set
> +CONFIG_V4L_USB_DRIVERS=3Dy
> +CONFIG_USB_VIDEO_CLASS=3Dm
> +CONFIG_USB_VIDEO_CLASS_INPUT_EVDEV=3Dy
> +CONFIG_USB_GSPCA=3Dm
> +CONFIG_USB_M5602=3Dm
> +CONFIG_USB_GSPCA_CONEX=3Dm
> +CONFIG_USB_GSPCA_ETOMS=3Dm
> +CONFIG_USB_GSPCA_FINEPIX=3Dm
> +CONFIG_USB_GSPCA_MARS=3Dm
> +CONFIG_USB_GSPCA_OV519=3Dm
> +CONFIG_USB_GSPCA_PAC207=3Dm
> +CONFIG_USB_GSPCA_PAC7311=3Dm
> +CONFIG_USB_GSPCA_SONIXB=3Dm
> +CONFIG_USB_GSPCA_SONIXJ=3Dm
> +CONFIG_USB_GSPCA_SPCA500=3Dm
> +CONFIG_USB_GSPCA_SPCA501=3Dm
> +CONFIG_USB_GSPCA_SPCA505=3Dm
> +CONFIG_USB_GSPCA_SPCA506=3Dm
> +CONFIG_USB_GSPCA_SPCA508=3Dm
> +CONFIG_USB_GSPCA_SPCA561=3Dm
> +CONFIG_USB_GSPCA_STK014=3Dm
> +CONFIG_USB_GSPCA_SUNPLUS=3Dm
> +CONFIG_USB_GSPCA_T613=3Dm
> +CONFIG_USB_GSPCA_TV8532=3Dm
> +CONFIG_USB_GSPCA_VC032X=3Dm
> +CONFIG_USB_GSPCA_ZC3XX=3Dm
> +CONFIG_VIDEO_PVRUSB2=3Dm
> +CONFIG_VIDEO_PVRUSB2_SYSFS=3Dy
> +# CONFIG_VIDEO_PVRUSB2_DEBUGIFC is not set
> +CONFIG_VIDEO_EM28XX=3Dm
> +CONFIG_VIDEO_USBVISION=3Dm
> +CONFIG_USB_ET61X251=3Dm
> +CONFIG_USB_SN9C102=3Dm
> +CONFIG_USB_ZC0301=3Dm
> +CONFIG_USB_ZR364XX=3Dm
> +CONFIG_USB_STKWEBCAM=3Dm
> +CONFIG_USB_S2255=3Dm
> +CONFIG_RADIO_ADAPTERS=3Dy
> +# CONFIG_RADIO_GEMTEK_PCI is not set
> +# CONFIG_RADIO_MAXIRADIO is not set
> +CONFIG_RADIO_MAESTRO=3Dm
> +CONFIG_USB_DSBR=3Dm
> +CONFIG_USB_SI470X=3Dm
> +CONFIG_USB_MR800=3Dm
> +# CONFIG_DAB is not set
> +
> +#
> +# Graphics support
> +#
> +# CONFIG_DRM is not set
> +# CONFIG_VGASTATE is not set
> +CONFIG_VIDEO_OUTPUT_CONTROL=3Dm
> +# CONFIG_FB is not set
> +# CONFIG_BACKLIGHT_LCD_SUPPORT is not set
> +
> +#
> +# Display device support
> +#
> +CONFIG_DISPLAY_SUPPORT=3Dy
> +
> +#
> +# Display hardware drivers
> +#
> +
> +#
> +# Console display driver support
> +#
> +# CONFIG_VGA_CONSOLE is not set
> +CONFIG_DUMMY_CONSOLE=3Dy
> +# CONFIG_SOUND is not set
> +CONFIG_HID_SUPPORT=3Dy
> +CONFIG_HID=3Dy
> +# CONFIG_HID_DEBUG is not set
> +CONFIG_HIDRAW=3Dy
> +
> +#
> +# USB Input Devices
> +#
> +CONFIG_USB_HID=3Dm
> +# CONFIG_HID_PID is not set
> +# CONFIG_USB_HIDDEV is not set
> +
> +#
> +# USB HID Boot Protocol drivers
> +#
> +# CONFIG_USB_KBD is not set
> +# CONFIG_USB_MOUSE is not set
> +
> +#
> +# Special HID drivers
> +#
> +CONFIG_HID_COMPAT=3Dy
> +CONFIG_HID_A4TECH=3Dm
> +CONFIG_HID_APPLE=3Dm
> +CONFIG_HID_BELKIN=3Dm
> +CONFIG_HID_BRIGHT=3Dm
> +CONFIG_HID_CHERRY=3Dm
> +CONFIG_HID_CHICONY=3Dm
> +CONFIG_HID_CYPRESS=3Dm
> +CONFIG_HID_DELL=3Dm
> +CONFIG_HID_EZKEY=3Dm
> +CONFIG_HID_GYRATION=3Dm
> +CONFIG_HID_LOGITECH=3Dm
> +# CONFIG_LOGITECH_FF is not set
> +# CONFIG_LOGIRUMBLEPAD2_FF is not set
> +CONFIG_HID_MICROSOFT=3Dm
> +CONFIG_HID_MONTEREY=3Dm
> +CONFIG_HID_PANTHERLORD=3Dm
> +# CONFIG_PANTHERLORD_FF is not set
> +CONFIG_HID_PETALYNX=3Dm
> +CONFIG_HID_SAMSUNG=3Dm
> +CONFIG_HID_SONY=3Dm
> +CONFIG_HID_SUNPLUS=3Dm
> +# CONFIG_THRUSTMASTER_FF is not set
> +# CONFIG_ZEROPLUS_FF is not set
> +CONFIG_USB_SUPPORT=3Dy
> +CONFIG_USB_ARCH_HAS_HCD=3Dy
> +CONFIG_USB_ARCH_HAS_OHCI=3Dy
> +CONFIG_USB_ARCH_HAS_EHCI=3Dy
> +CONFIG_USB=3Dm
> +# CONFIG_USB_DEBUG is not set
> +# CONFIG_USB_ANNOUNCE_NEW_DEVICES is not set
> +
> +#
> +# Miscellaneous USB options
> +#
> +CONFIG_USB_DEVICEFS=3Dy
> +# CONFIG_USB_DEVICE_CLASS is not set
> +# CONFIG_USB_DYNAMIC_MINORS is not set
> +# CONFIG_USB_OTG is not set
> +CONFIG_USB_MON=3Dy
> +CONFIG_USB_WUSB=3Dm
> +CONFIG_USB_WUSB_CBAF=3Dm
> +# CONFIG_USB_WUSB_CBAF_DEBUG is not set
> +
> +#
> +# USB Host Controller Drivers
> +#
> +# CONFIG_USB_C67X00_HCD is not set
> +CONFIG_USB_EHCI_HCD=3Dm
> +CONFIG_USB_EHCI_ROOT_HUB_TT=3Dy
> +# CONFIG_USB_EHCI_TT_NEWSCHED is not set
> +# CONFIG_USB_ISP116X_HCD is not set
> +# CONFIG_USB_ISP1760_HCD is not set
> +CONFIG_USB_OHCI_HCD=3Dm
> +# CONFIG_USB_OHCI_BIG_ENDIAN_DESC is not set
> +# CONFIG_USB_OHCI_BIG_ENDIAN_MMIO is not set
> +CONFIG_USB_OHCI_LITTLE_ENDIAN=3Dy
> +CONFIG_USB_UHCI_HCD=3Dm
> +# CONFIG_USB_U132_HCD is not set
> +# CONFIG_USB_SL811_HCD is not set
> +# CONFIG_USB_R8A66597_HCD is not set
> +# CONFIG_USB_WHCI_HCD is not set
> +# CONFIG_USB_HWA_HCD is not set
> +
> +#
> +# Enable Host or Gadget support to see Inventra options
> +#
> +
> +#
> +# USB Device Class drivers
> +#
> +CONFIG_USB_ACM=3Dm
> +CONFIG_USB_PRINTER=3Dm
> +CONFIG_USB_WDM=3Dm
> +CONFIG_USB_TMC=3Dm
> +
> +#
> +# NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may also be needed;
> +#
> +
> +#
> +# see USB_STORAGE Help for more information
> +#
> +CONFIG_USB_STORAGE=3Dm
> +# CONFIG_USB_STORAGE_DEBUG is not set
> +# CONFIG_USB_STORAGE_DATAFAB is not set
> +# CONFIG_USB_STORAGE_FREECOM is not set
> +# CONFIG_USB_STORAGE_ISD200 is not set
> +# CONFIG_USB_STORAGE_DPCM is not set
> +# CONFIG_USB_STORAGE_USBAT is not set
> +# CONFIG_USB_STORAGE_SDDR09 is not set
> +# CONFIG_USB_STORAGE_SDDR55 is not set
> +# CONFIG_USB_STORAGE_JUMPSHOT is not set
> +# CONFIG_USB_STORAGE_ALAUDA is not set
> +# CONFIG_USB_STORAGE_ONETOUCH is not set
> +# CONFIG_USB_STORAGE_KARMA is not set
> +# CONFIG_USB_STORAGE_CYPRESS_ATACB is not set
> +CONFIG_USB_LIBUSUAL=3Dy
> +
> +#
> +# USB Imaging devices
> +#
> +# CONFIG_USB_MDC800 is not set
> +# CONFIG_USB_MICROTEK is not set
> +
> +#
> +# USB port drivers
> +#
> +CONFIG_USB_SERIAL=3Dm
> +CONFIG_USB_EZUSB=3Dy
> +# CONFIG_USB_SERIAL_GENERIC is not set
> +CONFIG_USB_SERIAL_AIRCABLE=3Dm
> +CONFIG_USB_SERIAL_ARK3116=3Dm
> +CONFIG_USB_SERIAL_BELKIN=3Dm
> +CONFIG_USB_SERIAL_CH341=3Dm
> +CONFIG_USB_SERIAL_WHITEHEAT=3Dm
> +CONFIG_USB_SERIAL_DIGI_ACCELEPORT=3Dm
> +CONFIG_USB_SERIAL_CP2101=3Dm
> +CONFIG_USB_SERIAL_CYPRESS_M8=3Dm
> +CONFIG_USB_SERIAL_EMPEG=3Dm
> +CONFIG_USB_SERIAL_FTDI_SIO=3Dm
> +CONFIG_USB_SERIAL_FUNSOFT=3Dm
> +CONFIG_USB_SERIAL_VISOR=3Dm
> +CONFIG_USB_SERIAL_IPAQ=3Dm
> +CONFIG_USB_SERIAL_IR=3Dm
> +CONFIG_USB_SERIAL_EDGEPORT=3Dm
> +CONFIG_USB_SERIAL_EDGEPORT_TI=3Dm
> +CONFIG_USB_SERIAL_GARMIN=3Dm
> +CONFIG_USB_SERIAL_IPW=3Dm
> +CONFIG_USB_SERIAL_IUU=3Dm
> +CONFIG_USB_SERIAL_KEYSPAN_PDA=3Dm
> +CONFIG_USB_SERIAL_KEYSPAN=3Dm
> +# CONFIG_USB_SERIAL_KEYSPAN_MPR is not set
> +# CONFIG_USB_SERIAL_KEYSPAN_USA28 is not set
> +# CONFIG_USB_SERIAL_KEYSPAN_USA28X is not set
> +# CONFIG_USB_SERIAL_KEYSPAN_USA28XA is not set
> +# CONFIG_USB_SERIAL_KEYSPAN_USA28XB is not set
> +# CONFIG_USB_SERIAL_KEYSPAN_USA19 is not set
> +# CONFIG_USB_SERIAL_KEYSPAN_USA18X is not set
> +# CONFIG_USB_SERIAL_KEYSPAN_USA19W is not set
> +# CONFIG_USB_SERIAL_KEYSPAN_USA19QW is not set
> +# CONFIG_USB_SERIAL_KEYSPAN_USA19QI is not set
> +# CONFIG_USB_SERIAL_KEYSPAN_USA49W is not set
> +# CONFIG_USB_SERIAL_KEYSPAN_USA49WLC is not set
> +CONFIG_USB_SERIAL_KLSI=3Dm
> +CONFIG_USB_SERIAL_KOBIL_SCT=3Dm
> +CONFIG_USB_SERIAL_MCT_U232=3Dm
> +CONFIG_USB_SERIAL_MOS7720=3Dm
> +CONFIG_USB_SERIAL_MOS7840=3Dm
> +CONFIG_USB_SERIAL_MOTOROLA=3Dm
> +CONFIG_USB_SERIAL_NAVMAN=3Dm
> +CONFIG_USB_SERIAL_PL2303=3Dm
> +CONFIG_USB_SERIAL_OTI6858=3Dm
> +CONFIG_USB_SERIAL_SPCP8X5=3Dm
> +CONFIG_USB_SERIAL_HP4X=3Dm
> +CONFIG_USB_SERIAL_SAFE=3Dm
> +# CONFIG_USB_SERIAL_SAFE_PADDED is not set
> +CONFIG_USB_SERIAL_SIERRAWIRELESS=3Dm
> +CONFIG_USB_SERIAL_TI=3Dm
> +CONFIG_USB_SERIAL_CYBERJACK=3Dm
> +CONFIG_USB_SERIAL_XIRCOM=3Dm
> +CONFIG_USB_SERIAL_OPTION=3Dm
> +CONFIG_USB_SERIAL_OMNINET=3Dm
> +CONFIG_USB_SERIAL_DEBUG=3Dm
> +
> +#
> +# USB Miscellaneous drivers
> +#
> +CONFIG_USB_EMI62=3Dm
> +CONFIG_USB_EMI26=3Dm
> +CONFIG_USB_ADUTUX=3Dm
> +CONFIG_USB_SEVSEG=3Dm
> +CONFIG_USB_RIO500=3Dm
> +CONFIG_USB_LEGOTOWER=3Dm
> +CONFIG_USB_LCD=3Dm
> +CONFIG_USB_BERRY_CHARGE=3Dm
> +CONFIG_USB_LED=3Dm
> +CONFIG_USB_CYPRESS_CY7C63=3Dm
> +CONFIG_USB_CYTHERM=3Dm
> +CONFIG_USB_PHIDGET=3Dm
> +CONFIG_USB_PHIDGETKIT=3Dm
> +CONFIG_USB_PHIDGETMOTORCONTROL=3Dm
> +CONFIG_USB_PHIDGETSERVO=3Dm
> +CONFIG_USB_IDMOUSE=3Dm
> +CONFIG_USB_FTDI_ELAN=3Dm
> +# CONFIG_USB_APPLEDISPLAY is not set
> +CONFIG_USB_SISUSBVGA=3Dm
> +# CONFIG_USB_SISUSBVGA_CON is not set
> +CONFIG_USB_LD=3Dm
> +# CONFIG_USB_TRANCEVIBRATOR is not set
> +# CONFIG_USB_IOWARRIOR is not set
> +# CONFIG_USB_TEST is not set
> +# CONFIG_USB_ISIGHTFW is not set
> +# CONFIG_USB_VST is not set
> +# CONFIG_USB_GADGET is not set
> +CONFIG_UWB=3Dm
> +# CONFIG_UWB_HWA is not set
> +# CONFIG_UWB_WHCI is not set
> +# CONFIG_UWB_WLP is not set
> +CONFIG_MMC=3Dm
> +# CONFIG_MMC_DEBUG is not set
> +# CONFIG_MMC_UNSAFE_RESUME is not set
> +
> +#
> +# MMC/SD/SDIO Card Drivers
> +#
> +CONFIG_MMC_BLOCK=3Dm
> +CONFIG_MMC_BLOCK_BOUNCE=3Dy
> +CONFIG_SDIO_UART=3Dm
> +# CONFIG_MMC_TEST is not set
> +
> +#
> +# MMC/SD/SDIO Host Controller Drivers
> +#
> +CONFIG_MMC_SDHCI=3Dm
> +# CONFIG_MMC_SDHCI_PCI is not set
> +# CONFIG_MMC_TIFM_SD is not set
> +CONFIG_MMC_SPI=3Dm
> +CONFIG_MEMSTICK=3Dm
> +# CONFIG_MEMSTICK_DEBUG is not set
> +
> +#
> +# MemoryStick drivers
> +#
> +# CONFIG_MEMSTICK_UNSAFE_RESUME is not set
> +CONFIG_MSPRO_BLOCK=3Dm
> +
> +#
> +# MemoryStick Host Controller Drivers
> +#
> +CONFIG_MEMSTICK_TIFM_MS=3Dm
> +CONFIG_MEMSTICK_JMICRON_38X=3Dm
> +# CONFIG_ACCESSIBILITY is not set
> +CONFIG_NEW_LEDS=3Dy
> +# CONFIG_LEDS_CLASS is not set
> +
> +#
> +# LED drivers
> +#
> +
> +#
> +# LED Triggers
> +#
> +# CONFIG_LEDS_TRIGGERS is not set
> +CONFIG_RTC_LIB=3Dy
> +CONFIG_RTC_CLASS=3Dy
> +CONFIG_RTC_HCTOSYS=3Dy
> +CONFIG_RTC_HCTOSYS_DEVICE=3D"rtc0"
> +# CONFIG_RTC_DEBUG is not set
> +
> +#
> +# RTC interfaces
> +#
> +CONFIG_RTC_INTF_SYSFS=3Dy
> +CONFIG_RTC_INTF_PROC=3Dy
> +CONFIG_RTC_INTF_DEV=3Dy
> +# CONFIG_RTC_INTF_DEV_UIE_EMUL is not set
> +# CONFIG_RTC_DRV_TEST is not set
> +
> +#
> +# I2C RTC drivers
> +#
> +# CONFIG_RTC_DRV_DS1307 is not set
> +# CONFIG_RTC_DRV_DS1374 is not set
> +# CONFIG_RTC_DRV_DS1672 is not set
> +# CONFIG_RTC_DRV_MAX6900 is not set
> +# CONFIG_RTC_DRV_RS5C372 is not set
> +# CONFIG_RTC_DRV_ISL1208 is not set
> +# CONFIG_RTC_DRV_X1205 is not set
> +# CONFIG_RTC_DRV_PCF8563 is not set
> +# CONFIG_RTC_DRV_PCF8583 is not set
> +# CONFIG_RTC_DRV_M41T80 is not set
> +# CONFIG_RTC_DRV_S35390A is not set
> +# CONFIG_RTC_DRV_FM3130 is not set
> +# CONFIG_RTC_DRV_RX8581 is not set
> +
> +#
> +# SPI RTC drivers
> +#
> +# CONFIG_RTC_DRV_M41T94 is not set
> +# CONFIG_RTC_DRV_DS1305 is not set
> +# CONFIG_RTC_DRV_DS1390 is not set
> +# CONFIG_RTC_DRV_MAX6902 is not set
> +# CONFIG_RTC_DRV_R9701 is not set
> +# CONFIG_RTC_DRV_RS5C348 is not set
> +# CONFIG_RTC_DRV_DS3234 is not set
> +
> +#
> +# Platform RTC drivers
> +#
> +# CONFIG_RTC_DRV_CMOS is not set
> +# CONFIG_RTC_DRV_DS1286 is not set
> +# CONFIG_RTC_DRV_DS1511 is not set
> +# CONFIG_RTC_DRV_DS1553 is not set
> +# CONFIG_RTC_DRV_DS1742 is not set
> +# CONFIG_RTC_DRV_STK17TA8 is not set
> +CONFIG_RTC_DRV_M48T86=3Dy
> +# CONFIG_RTC_DRV_M48T35 is not set
> +# CONFIG_RTC_DRV_M48T59 is not set
> +# CONFIG_RTC_DRV_BQ4802 is not set
> +# CONFIG_RTC_DRV_V3020 is not set
> +
> +#
> +# on-CPU RTC drivers
> +#
> +CONFIG_DMADEVICES=3Dy
> +
> +#
> +# DMA Devices
> +#
> +# CONFIG_MV_XOR is not set
> +# CONFIG_REGULATOR is not set
> +CONFIG_UIO=3Dm
> +# CONFIG_UIO_CIF is not set
> +# CONFIG_UIO_PDRV is not set
> +# CONFIG_UIO_PDRV_GENIRQ is not set
> +# CONFIG_UIO_SMX is not set
> +# CONFIG_UIO_SERCOS3 is not set
> +
> +#
> +# File systems
> +#
> +CONFIG_EXT2_FS=3Dy
> +# CONFIG_EXT2_FS_XATTR is not set
> +# CONFIG_EXT2_FS_XIP is not set
> +CONFIG_EXT3_FS=3Dm
> +# CONFIG_EXT3_FS_XATTR is not set
> +# CONFIG_EXT4_FS is not set
> +CONFIG_JBD=3Dm
> +# CONFIG_REISERFS_FS is not set
> +CONFIG_JFS_FS=3Dy
> +# CONFIG_JFS_POSIX_ACL is not set
> +# CONFIG_JFS_SECURITY is not set
> +# CONFIG_JFS_DEBUG is not set
> +# CONFIG_JFS_STATISTICS is not set
> +CONFIG_FS_POSIX_ACL=3Dy
> +CONFIG_FILE_LOCKING=3Dy
> +# CONFIG_XFS_FS is not set
> +# CONFIG_OCFS2_FS is not set
> +CONFIG_DNOTIFY=3Dy
> +CONFIG_INOTIFY=3Dy
> +CONFIG_INOTIFY_USER=3Dy
> +# CONFIG_QUOTA is not set
> +# CONFIG_AUTOFS_FS is not set
> +# CONFIG_AUTOFS4_FS is not set
> +CONFIG_FUSE_FS=3Dm
> +
> +#
> +# CD-ROM/DVD Filesystems
> +#
> +CONFIG_ISO9660_FS=3Dm
> +CONFIG_JOLIET=3Dy
> +CONFIG_ZISOFS=3Dy
> +CONFIG_UDF_FS=3Dm
> +CONFIG_UDF_NLS=3Dy
> +
> +#
> +# DOS/FAT/NT Filesystems
> +#
> +CONFIG_FAT_FS=3Dm
> +CONFIG_MSDOS_FS=3Dm
> +CONFIG_VFAT_FS=3Dm
> +CONFIG_FAT_DEFAULT_CODEPAGE=3D437
> +CONFIG_FAT_DEFAULT_IOCHARSET=3D"utf8"
> +CONFIG_NTFS_FS=3Dm
> +# CONFIG_NTFS_DEBUG is not set
> +# CONFIG_NTFS_RW is not set
> +
> +#
> +# Pseudo filesystems
> +#
> +CONFIG_PROC_FS=3Dy
> +CONFIG_PROC_SYSCTL=3Dy
> +CONFIG_PROC_PAGE_MONITOR=3Dy
> +CONFIG_SYSFS=3Dy
> +CONFIG_TMPFS=3Dy
> +# CONFIG_TMPFS_POSIX_ACL is not set
> +# CONFIG_HUGETLB_PAGE is not set
> +# CONFIG_CONFIGFS_FS is not set
> +
> +#
> +# Miscellaneous filesystems
> +#
> +# CONFIG_ADFS_FS is not set
> +# CONFIG_AFFS_FS is not set
> +# CONFIG_HFS_FS is not set
> +# CONFIG_HFSPLUS_FS is not set
> +# CONFIG_BEFS_FS is not set
> +# CONFIG_BFS_FS is not set
> +# CONFIG_EFS_FS is not set
> +CONFIG_JFFS2_FS=3Dm
> +CONFIG_JFFS2_FS_DEBUG=3D0
> +CONFIG_JFFS2_FS_WRITEBUFFER=3Dy
> +# CONFIG_JFFS2_FS_WBUF_VERIFY is not set
> +# CONFIG_JFFS2_SUMMARY is not set
> +# CONFIG_JFFS2_FS_XATTR is not set
> +# CONFIG_JFFS2_COMPRESSION_OPTIONS is not set
> +CONFIG_JFFS2_ZLIB=3Dy
> +# CONFIG_JFFS2_LZO is not set
> +CONFIG_JFFS2_RTIME=3Dy
> +# CONFIG_JFFS2_RUBIN is not set
> +CONFIG_CRAMFS=3Dm
> +# CONFIG_VXFS_FS is not set
> +# CONFIG_MINIX_FS is not set
> +# CONFIG_OMFS_FS is not set
> +# CONFIG_HPFS_FS is not set
> +# CONFIG_QNX4FS_FS is not set
> +# CONFIG_ROMFS_FS is not set
> +# CONFIG_SYSV_FS is not set
> +# CONFIG_UFS_FS is not set
> +CONFIG_NETWORK_FILESYSTEMS=3Dy
> +CONFIG_NFS_FS=3Dy
> +CONFIG_NFS_V3=3Dy
> +CONFIG_NFS_V3_ACL=3Dy
> +# CONFIG_NFS_V4 is not set
> +CONFIG_ROOT_NFS=3Dy
> +CONFIG_NFSD=3Dm
> +CONFIG_NFSD_V2_ACL=3Dy
> +CONFIG_NFSD_V3=3Dy
> +CONFIG_NFSD_V3_ACL=3Dy
> +CONFIG_NFSD_V4=3Dy
> +CONFIG_LOCKD=3Dy
> +CONFIG_LOCKD_V4=3Dy
> +CONFIG_EXPORTFS=3Dm
> +CONFIG_NFS_ACL_SUPPORT=3Dy
> +CONFIG_NFS_COMMON=3Dy
> +CONFIG_SUNRPC=3Dy
> +CONFIG_SUNRPC_GSS=3Dm
> +# CONFIG_SUNRPC_REGISTER_V4 is not set
> +CONFIG_RPCSEC_GSS_KRB5=3Dm
> +# CONFIG_RPCSEC_GSS_SPKM3 is not set
> +# CONFIG_SMB_FS is not set
> +# CONFIG_CIFS is not set
> +# CONFIG_NCP_FS is not set
> +# CONFIG_CODA_FS is not set
> +# CONFIG_AFS_FS is not set
> +
> +#
> +# Partition Types
> +#
> +CONFIG_PARTITION_ADVANCED=3Dy
> +# CONFIG_ACORN_PARTITION is not set
> +# CONFIG_OSF_PARTITION is not set
> +# CONFIG_AMIGA_PARTITION is not set
> +# CONFIG_ATARI_PARTITION is not set
> +# CONFIG_MAC_PARTITION is not set
> +CONFIG_MSDOS_PARTITION=3Dy
> +# CONFIG_BSD_DISKLABEL is not set
> +# CONFIG_MINIX_SUBPARTITION is not set
> +# CONFIG_SOLARIS_X86_PARTITION is not set
> +# CONFIG_UNIXWARE_DISKLABEL is not set
> +# CONFIG_LDM_PARTITION is not set
> +# CONFIG_SGI_PARTITION is not set
> +# CONFIG_ULTRIX_PARTITION is not set
> +# CONFIG_SUN_PARTITION is not set
> +# CONFIG_KARMA_PARTITION is not set
> +# CONFIG_EFI_PARTITION is not set
> +# CONFIG_SYSV68_PARTITION is not set
> +CONFIG_NLS=3Dy
> +CONFIG_NLS_DEFAULT=3D"iso8859-1"
> +CONFIG_NLS_CODEPAGE_437=3Dy
> +CONFIG_NLS_CODEPAGE_737=3Dm
> +CONFIG_NLS_CODEPAGE_775=3Dm
> +CONFIG_NLS_CODEPAGE_850=3Dm
> +CONFIG_NLS_CODEPAGE_852=3Dm
> +CONFIG_NLS_CODEPAGE_855=3Dm
> +CONFIG_NLS_CODEPAGE_857=3Dm
> +CONFIG_NLS_CODEPAGE_860=3Dm
> +CONFIG_NLS_CODEPAGE_861=3Dm
> +CONFIG_NLS_CODEPAGE_862=3Dm
> +CONFIG_NLS_CODEPAGE_863=3Dm
> +CONFIG_NLS_CODEPAGE_864=3Dm
> +CONFIG_NLS_CODEPAGE_865=3Dm
> +CONFIG_NLS_CODEPAGE_866=3Dm
> +CONFIG_NLS_CODEPAGE_869=3Dm
> +CONFIG_NLS_CODEPAGE_936=3Dm
> +CONFIG_NLS_CODEPAGE_950=3Dm
> +CONFIG_NLS_CODEPAGE_932=3Dm
> +CONFIG_NLS_CODEPAGE_949=3Dm
> +CONFIG_NLS_CODEPAGE_874=3Dm
> +CONFIG_NLS_ISO8859_8=3Dm
> +CONFIG_NLS_CODEPAGE_1250=3Dm
> +CONFIG_NLS_CODEPAGE_1251=3Dm
> +CONFIG_NLS_ASCII=3Dy
> +CONFIG_NLS_ISO8859_1=3Dy
> +CONFIG_NLS_ISO8859_2=3Dm
> +CONFIG_NLS_ISO8859_3=3Dm
> +CONFIG_NLS_ISO8859_4=3Dm
> +CONFIG_NLS_ISO8859_5=3Dm
> +CONFIG_NLS_ISO8859_6=3Dm
> +CONFIG_NLS_ISO8859_7=3Dm
> +CONFIG_NLS_ISO8859_9=3Dm
> +CONFIG_NLS_ISO8859_13=3Dm
> +CONFIG_NLS_ISO8859_14=3Dm
> +CONFIG_NLS_ISO8859_15=3Dm
> +CONFIG_NLS_KOI8_R=3Dm
> +CONFIG_NLS_KOI8_U=3Dm
> +CONFIG_NLS_UTF8=3Dy
> +# CONFIG_DLM is not set
> +
> +#
> +# Kernel hacking
> +#
> +# CONFIG_PRINTK_TIME is not set
> +CONFIG_ENABLE_WARN_DEPRECATED=3Dy
> +# CONFIG_ENABLE_MUST_CHECK is not set
> +CONFIG_FRAME_WARN=3D1024
> +CONFIG_MAGIC_SYSRQ=3Dy
> +# CONFIG_UNUSED_SYMBOLS is not set
> +# CONFIG_DEBUG_FS is not set
> +# CONFIG_HEADERS_CHECK is not set
> +CONFIG_DEBUG_KERNEL=3Dy
> +# CONFIG_DEBUG_SHIRQ is not set
> +CONFIG_DETECT_SOFTLOCKUP=3Dy
> +# CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC is not set
> +CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC_VALUE=3D0
> +# CONFIG_SCHED_DEBUG is not set
> +# CONFIG_SCHEDSTATS is not set
> +# CONFIG_TIMER_STATS is not set
> +CONFIG_DEBUG_OBJECTS=3Dy
> +# CONFIG_DEBUG_OBJECTS_SELFTEST is not set
> +# CONFIG_DEBUG_OBJECTS_FREE is not set
> +# CONFIG_DEBUG_OBJECTS_TIMERS is not set
> +CONFIG_DEBUG_SLAB=3Dy
> +CONFIG_DEBUG_SLAB_LEAK=3Dy
> +CONFIG_DEBUG_PREEMPT=3Dy
> +# CONFIG_DEBUG_RT_MUTEXES is not set
> +# CONFIG_RT_MUTEX_TESTER is not set
> +CONFIG_DEBUG_SPINLOCK=3Dy
> +# CONFIG_DEBUG_MUTEXES is not set
> +# CONFIG_DEBUG_LOCK_ALLOC is not set
> +# CONFIG_PROVE_LOCKING is not set
> +# CONFIG_LOCK_STAT is not set
> +# CONFIG_DEBUG_SPINLOCK_SLEEP is not set
> +# CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
> +# CONFIG_DEBUG_KOBJECT is not set
> +CONFIG_DEBUG_BUGVERBOSE=3Dy
> +CONFIG_DEBUG_INFO=3Dy
> +# CONFIG_DEBUG_VM is not set
> +# CONFIG_DEBUG_WRITECOUNT is not set
> +CONFIG_DEBUG_MEMORY_INIT=3Dy
> +# CONFIG_DEBUG_LIST is not set
> +# CONFIG_DEBUG_SG is not set
> +CONFIG_FRAME_POINTER=3Dy
> +# CONFIG_BOOT_PRINTK_DELAY is not set
> +# CONFIG_RCU_TORTURE_TEST is not set
> +# CONFIG_RCU_CPU_STALL_DETECTOR is not set
> +# CONFIG_BACKTRACE_SELF_TEST is not set
> +# CONFIG_DEBUG_BLOCK_EXT_DEVT is not set
> +# CONFIG_FAULT_INJECTION is not set
> +# CONFIG_LATENCYTOP is not set
> +# CONFIG_SYSCTL_SYSCALL_CHECK is not set
> +CONFIG_HAVE_FUNCTION_TRACER=3Dy
> +
> +#
> +# Tracers
> +#
> +# CONFIG_FUNCTION_TRACER is not set
> +# CONFIG_IRQSOFF_TRACER is not set
> +# CONFIG_PREEMPT_TRACER is not set
> +# CONFIG_SCHED_TRACER is not set
> +# CONFIG_CONTEXT_SWITCH_TRACER is not set
> +# CONFIG_BOOT_TRACER is not set
> +# CONFIG_STACK_TRACER is not set
> +CONFIG_DYNAMIC_PRINTK_DEBUG=3Dy
> +# CONFIG_SAMPLES is not set
> +CONFIG_HAVE_ARCH_KGDB=3Dy
> +# CONFIG_KGDB is not set
> +CONFIG_DEBUG_USER=3Dy
> +CONFIG_DEBUG_ERRORS=3Dy
> +CONFIG_DEBUG_STACK_USAGE=3Dy
> +# CONFIG_DEBUG_LL is not set
> +
> +#
> +# Security options
> +#
> +# CONFIG_KEYS is not set
> +# CONFIG_SECURITY is not set
> +# CONFIG_SECURITYFS is not set
> +# CONFIG_SECURITY_FILE_CAPABILITIES is not set
> +CONFIG_CRYPTO=3Dy
> +
> +#
> +# Crypto core or helper
> +#
> +# CONFIG_CRYPTO_FIPS is not set
> +CONFIG_CRYPTO_ALGAPI=3Dy
> +CONFIG_CRYPTO_ALGAPI2=3Dy
> +CONFIG_CRYPTO_AEAD2=3Dy
> +CONFIG_CRYPTO_BLKCIPHER=3Dy
> +CONFIG_CRYPTO_BLKCIPHER2=3Dy
> +CONFIG_CRYPTO_HASH=3Dm
> +CONFIG_CRYPTO_HASH2=3Dy
> +CONFIG_CRYPTO_RNG2=3Dy
> +CONFIG_CRYPTO_MANAGER=3Dy
> +CONFIG_CRYPTO_MANAGER2=3Dy
> +# CONFIG_CRYPTO_GF128MUL is not set
> +# CONFIG_CRYPTO_NULL is not set
> +# CONFIG_CRYPTO_CRYPTD is not set
> +# CONFIG_CRYPTO_AUTHENC is not set
> +# CONFIG_CRYPTO_TEST is not set
> +
> +#
> +# Authenticated Encryption with Associated Data
> +#
> +# CONFIG_CRYPTO_CCM is not set
> +# CONFIG_CRYPTO_GCM is not set
> +# CONFIG_CRYPTO_SEQIV is not set
> +
> +#
> +# Block modes
> +#
> +CONFIG_CRYPTO_CBC=3Dm
> +# CONFIG_CRYPTO_CTR is not set
> +# CONFIG_CRYPTO_CTS is not set
> +CONFIG_CRYPTO_ECB=3Dy
> +# CONFIG_CRYPTO_LRW is not set
> +# CONFIG_CRYPTO_PCBC is not set
> +# CONFIG_CRYPTO_XTS is not set
> +
> +#
> +# Hash modes
> +#
> +# CONFIG_CRYPTO_HMAC is not set
> +# CONFIG_CRYPTO_XCBC is not set
> +
> +#
> +# Digest
> +#
> +CONFIG_CRYPTO_CRC32C=3Dm
> +# CONFIG_CRYPTO_MD4 is not set
> +CONFIG_CRYPTO_MD5=3Dm
> +CONFIG_CRYPTO_MICHAEL_MIC=3Dm
> +# CONFIG_CRYPTO_RMD128 is not set
> +# CONFIG_CRYPTO_RMD160 is not set
> +# CONFIG_CRYPTO_RMD256 is not set
> +# CONFIG_CRYPTO_RMD320 is not set
> +CONFIG_CRYPTO_SHA1=3Dm
> +# CONFIG_CRYPTO_SHA256 is not set
> +# CONFIG_CRYPTO_SHA512 is not set
> +# CONFIG_CRYPTO_TGR192 is not set
> +# CONFIG_CRYPTO_WP512 is not set
> +
> +#
> +# Ciphers
> +#
> +CONFIG_CRYPTO_AES=3Dm
> +# CONFIG_CRYPTO_ANUBIS is not set
> +CONFIG_CRYPTO_ARC4=3Dm
> +CONFIG_CRYPTO_BLOWFISH=3Dm
> +# CONFIG_CRYPTO_CAMELLIA is not set
> +# CONFIG_CRYPTO_CAST5 is not set
> +# CONFIG_CRYPTO_CAST6 is not set
> +CONFIG_CRYPTO_DES=3Dm
> +# CONFIG_CRYPTO_FCRYPT is not set
> +# CONFIG_CRYPTO_KHAZAD is not set
> +# CONFIG_CRYPTO_SALSA20 is not set
> +# CONFIG_CRYPTO_SEED is not set
> +# CONFIG_CRYPTO_SERPENT is not set
> +# CONFIG_CRYPTO_TEA is not set
> +# CONFIG_CRYPTO_TWOFISH is not set
> +
> +#
> +# Compression
> +#
> +# CONFIG_CRYPTO_DEFLATE is not set
> +# CONFIG_CRYPTO_LZO is not set
> +
> +#
> +# Random Number Generation
> +#
> +# CONFIG_CRYPTO_ANSI_CPRNG is not set
> +CONFIG_CRYPTO_HW=3Dy
> +# CONFIG_CRYPTO_DEV_HIFN_795X is not set
> +
> +#
> +# Library routines
> +#
> +CONFIG_BITREVERSE=3Dy
> +CONFIG_CRC_CCITT=3Dm
> +CONFIG_CRC16=3Dm
> +CONFIG_CRC_T10DIF=3Dm
> +CONFIG_CRC_ITU_T=3Dm
> +CONFIG_CRC32=3Dy
> +CONFIG_CRC7=3Dm
> +CONFIG_LIBCRC32C=3Dm
> +CONFIG_ZLIB_INFLATE=3Dm
> +CONFIG_ZLIB_DEFLATE=3Dm
> +CONFIG_PLIST=3Dy
> +CONFIG_HAS_IOMEM=3Dy
> +CONFIG_HAS_IOPORT=3Dy
> +CONFIG_HAS_DMA=3Dy
> diff --git a/recipes/linux/linux_2.6.28.bb b/recipes/linux/linux_2.6.28.b=
b
> index 7ce1238..2d1cb3f 100644
> --- a/recipes/linux/linux_2.6.28.bb
> +++ b/recipes/linux/linux_2.6.28.bb
> @@ -12,6 +12,7 @@ DEFAULT_PREFERENCE_collie =3D "1"
> =A0DEFAULT_PREFERENCE_tosa =3D "1"
> =A0DEFAULT_PREFERENCE_gamecube =3D "1"
> =A0DEFAULT_PREFERENCE_wrap =3D "1"
> +DEFAULT_PREFERNECE_ts7800 =3D "1"
>
> =A0SRC_URI =3D "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-2.6.28.ta=
r.bz2 \
> =A0 =A0 =A0 =A0 =A0 =A0file://defconfig"
> --
> 1.5.4.3
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



--=20
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


