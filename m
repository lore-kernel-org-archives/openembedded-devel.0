Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1NpPAy-0000oR-OR
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Mar 2010 17:54:34 +0100
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1NpP85-0001np-Ez from Tom_Rini@mentor.com ;
	Wed, 10 Mar 2010 08:51:29 -0800
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Wed, 10 Mar 2010 08:51:28 -0800
Received: from 172.30.33.172 ([172.30.33.172]) by NA1-MAIL.mgc.mentorg.com
	([147.34.98.181]) with Microsoft Exchange Server HTTP-DAV ; 
	Wed, 10 Mar 2010 16:51:03 +0000
Received: from trini-m4400 by na1-mail.mgc.mentorg.com;
	10 Mar 2010 09:51:00 -0700
From: Tom Rini <tom_rini@mentor.com>
To: Martyn Welch <martyn.welch@ge.com>
In-Reply-To: <20100310164706.26993.37539.stgit@ES-J7S4D2J.amer.consind.ge.com>
References: <20100310164706.26993.37539.stgit@ES-J7S4D2J.amer.consind.ge.com>
Organization: Mentor Graphics Corporation
Date: Wed, 10 Mar 2010 09:51:00 -0700
Message-ID: <1268239860.16526.200.camel@trini-m4400>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 10 Mar 2010 16:51:28.0982 (UTC)
	FILETIME=[EDF8BF60:01CAC071]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=AWL, BAYES_00, UPPERCASE_50_75
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] Add Freescale P2020DS Demo Board
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
X-List-Received-Date: Wed, 10 Mar 2010 16:54:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2010-03-10 at 16:47 +0000, Martyn Welch wrote:
> This patch adds the Freescale P2020DS demo board, which is based on the
> p2020 SOC.
>=20
> Signed-off-by: Martyn Welch <martyn.welch@gefanuc.com>

Acked-by: Tom Rini <tom_rini@mentor.com>

> ---
>=20
>  conf/machine/p2020ds.conf                    |   23=20
>  recipes/linux/linux-2.6.33/p2020ds/defconfig | 1986 ++++++++++++++++++++=
++++++
>  recipes/linux/linux.inc                      |    1=20
>  recipes/linux/linux_2.6.33.bb                |    1=20
>  recipes/u-boot/u-boot_git.bb                 |    1=20
>  5 files changed, 2012 insertions(+), 0 deletions(-)
>=20
> diff --git a/conf/machine/p2020ds.conf b/conf/machine/p2020ds.conf
> new file mode 100644
> index 0000000..996a3be
> --- /dev/null
> +++ b/conf/machine/p2020ds.conf
> @@ -0,0 +1,23 @@
> +#@TYPE: Machine
> +#@Name: P2020ds
> +#@DESCRIPTION: Machine configuration for the freescale p2020ds developme=
nt board
> +
> +TARGET_ARCH =3D "powerpc"
> +
> +PREFERRED_PROVIDER_virtual/kernel ?=3D "linux"
> +
> +MACHINE_FEATURES =3D "kernel26 usbhost pci ext2 vfat nfs uboot"
> +
> +KERNEL_IMAGETYPE =3D "uImage"
> +UBOOT_ENTRYPOINT =3D "0"
> +
> +UBOOT_MACHINE =3D "P2020DS_config"
> +
> +# Need to create jffs2 images with the correct endianess
> +EXTRA_IMAGECMD_jffs2 =3D " --big-endian -e 0x20000"
> +
> +#don't try to access tty1
> +USE_VT =3D "0"
> +
> +#setup serial console on Com1
> +SERIAL_CONSOLE =3D "-L 115200 ttyS0"
> diff --git a/recipes/linux/linux-2.6.33/p2020ds/defconfig b/recipes/linux=
/linux-2.6.33/p2020ds/defconfig
> new file mode 100644
> index 0000000..7d98bc6
> --- /dev/null
> +++ b/recipes/linux/linux-2.6.33/p2020ds/defconfig
> @@ -0,0 +1,1986 @@
> +#
> +# Automatically generated make config: don't edit
> +# Linux kernel version: 2.6.33-rc3
> +# Wed Jan  6 09:24:07 2010
> +#
> +# CONFIG_PPC64 is not set
> +
> +#
> +# Processor support
> +#
> +# CONFIG_PPC_BOOK3S_32 is not set
> +CONFIG_PPC_85xx=3Dy
> +# CONFIG_PPC_8xx is not set
> +# CONFIG_40x is not set
> +# CONFIG_44x is not set
> +# CONFIG_E200 is not set
> +CONFIG_E500=3Dy
> +# CONFIG_PPC_E500MC is not set
> +CONFIG_FSL_EMB_PERFMON=3Dy
> +CONFIG_BOOKE=3Dy
> +CONFIG_FSL_BOOKE=3Dy
> +# CONFIG_PHYS_64BIT is not set
> +CONFIG_SPE=3Dy
> +CONFIG_PPC_MMU_NOHASH=3Dy
> +CONFIG_PPC_MMU_NOHASH_32=3Dy
> +CONFIG_PPC_BOOK3E_MMU=3Dy
> +# CONFIG_PPC_MM_SLICES is not set
> +CONFIG_SMP=3Dy
> +CONFIG_NR_CPUS=3D8
> +CONFIG_PPC32=3Dy
> +CONFIG_WORD_SIZE=3D32
> +# CONFIG_ARCH_PHYS_ADDR_T_64BIT is not set
> +CONFIG_MMU=3Dy
> +CONFIG_GENERIC_CMOS_UPDATE=3Dy
> +CONFIG_GENERIC_TIME=3Dy
> +CONFIG_GENERIC_TIME_VSYSCALL=3Dy
> +CONFIG_GENERIC_CLOCKEVENTS=3Dy
> +CONFIG_GENERIC_HARDIRQS=3Dy
> +CONFIG_GENERIC_HARDIRQS_NO__DO_IRQ=3Dy
> +# CONFIG_HAVE_SETUP_PER_CPU_AREA is not set
> +# CONFIG_NEED_PER_CPU_EMBED_FIRST_CHUNK is not set
> +CONFIG_IRQ_PER_CPU=3Dy
> +CONFIG_NR_IRQS=3D512
> +CONFIG_STACKTRACE_SUPPORT=3Dy
> +CONFIG_HAVE_LATENCYTOP_SUPPORT=3Dy
> +CONFIG_TRACE_IRQFLAGS_SUPPORT=3Dy
> +CONFIG_LOCKDEP_SUPPORT=3Dy
> +CONFIG_RWSEM_XCHGADD_ALGORITHM=3Dy
> +CONFIG_ARCH_HAS_ILOG2_U32=3Dy
> +CONFIG_GENERIC_HWEIGHT=3Dy
> +CONFIG_GENERIC_FIND_NEXT_BIT=3Dy
> +CONFIG_GENERIC_GPIO=3Dy
> +# CONFIG_ARCH_NO_VIRT_TO_BUS is not set
> +CONFIG_PPC=3Dy
> +CONFIG_EARLY_PRINTK=3Dy
> +CONFIG_GENERIC_NVRAM=3Dy
> +CONFIG_SCHED_OMIT_FRAME_POINTER=3Dy
> +CONFIG_ARCH_MAY_HAVE_PC_FDC=3Dy
> +CONFIG_PPC_OF=3Dy
> +CONFIG_OF=3Dy
> +CONFIG_PPC_UDBG_16550=3Dy
> +CONFIG_GENERIC_TBSYNC=3Dy
> +CONFIG_AUDIT_ARCH=3Dy
> +CONFIG_GENERIC_BUG=3Dy
> +CONFIG_DTC=3Dy
> +CONFIG_DEFAULT_UIMAGE=3Dy
> +CONFIG_ARCH_HIBERNATION_POSSIBLE=3Dy
> +CONFIG_ARCH_SUSPEND_POSSIBLE=3Dy
> +# CONFIG_PPC_DCR_NATIVE is not set
> +# CONFIG_PPC_DCR_MMIO is not set
> +CONFIG_ARCH_SUPPORTS_DEBUG_PAGEALLOC=3Dy
> +CONFIG_DEFCONFIG_LIST=3D"/lib/modules/$UNAME_RELEASE/.config"
> +CONFIG_CONSTRUCTORS=3Dy
> +
> +#
> +# General setup
> +#
> +CONFIG_EXPERIMENTAL=3Dy
> +CONFIG_LOCK_KERNEL=3Dy
> +CONFIG_INIT_ENV_ARG_LIMIT=3D32
> +CONFIG_LOCALVERSION=3D""
> +CONFIG_LOCALVERSION_AUTO=3Dy
> +CONFIG_SWAP=3Dy
> +CONFIG_SYSVIPC=3Dy
> +CONFIG_SYSVIPC_SYSCTL=3Dy
> +CONFIG_POSIX_MQUEUE=3Dy
> +CONFIG_POSIX_MQUEUE_SYSCTL=3Dy
> +CONFIG_BSD_PROCESS_ACCT=3Dy
> +# CONFIG_BSD_PROCESS_ACCT_V3 is not set
> +# CONFIG_TASKSTATS is not set
> +CONFIG_AUDIT=3Dy
> +# CONFIG_AUDITSYSCALL is not set
> +
> +#
> +# RCU Subsystem
> +#
> +CONFIG_TREE_RCU=3Dy
> +# CONFIG_TREE_PREEMPT_RCU is not set
> +# CONFIG_TINY_RCU is not set
> +# CONFIG_RCU_TRACE is not set
> +CONFIG_RCU_FANOUT=3D32
> +# CONFIG_RCU_FANOUT_EXACT is not set
> +# CONFIG_TREE_RCU_TRACE is not set
> +CONFIG_IKCONFIG=3Dy
> +CONFIG_IKCONFIG_PROC=3Dy
> +CONFIG_LOG_BUF_SHIFT=3D14
> +CONFIG_GROUP_SCHED=3Dy
> +# CONFIG_FAIR_GROUP_SCHED is not set
> +# CONFIG_RT_GROUP_SCHED is not set
> +CONFIG_USER_SCHED=3Dy
> +# CONFIG_CGROUP_SCHED is not set
> +# CONFIG_CGROUPS is not set
> +CONFIG_SYSFS_DEPRECATED=3Dy
> +CONFIG_SYSFS_DEPRECATED_V2=3Dy
> +# CONFIG_RELAY is not set
> +# CONFIG_NAMESPACES is not set
> +CONFIG_BLK_DEV_INITRD=3Dy
> +CONFIG_INITRAMFS_SOURCE=3D""
> +CONFIG_RD_GZIP=3Dy
> +# CONFIG_RD_BZIP2 is not set
> +# CONFIG_RD_LZMA is not set
> +# CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
> +CONFIG_SYSCTL=3Dy
> +CONFIG_ANON_INODES=3Dy
> +CONFIG_EMBEDDED=3Dy
> +CONFIG_SYSCTL_SYSCALL=3Dy
> +CONFIG_KALLSYMS=3Dy
> +CONFIG_KALLSYMS_ALL=3Dy
> +CONFIG_KALLSYMS_EXTRA_PASS=3Dy
> +CONFIG_HOTPLUG=3Dy
> +CONFIG_PRINTK=3Dy
> +CONFIG_BUG=3Dy
> +CONFIG_ELF_CORE=3Dy
> +CONFIG_BASE_FULL=3Dy
> +CONFIG_FUTEX=3Dy
> +CONFIG_EPOLL=3Dy
> +CONFIG_SIGNALFD=3Dy
> +CONFIG_TIMERFD=3Dy
> +CONFIG_EVENTFD=3Dy
> +CONFIG_SHMEM=3Dy
> +CONFIG_AIO=3Dy
> +CONFIG_HAVE_PERF_EVENTS=3Dy
> +
> +#
> +# Kernel Performance Events And Counters
> +#
> +# CONFIG_PERF_EVENTS is not set
> +# CONFIG_PERF_COUNTERS is not set
> +CONFIG_VM_EVENT_COUNTERS=3Dy
> +CONFIG_PCI_QUIRKS=3Dy
> +CONFIG_SLUB_DEBUG=3Dy
> +CONFIG_COMPAT_BRK=3Dy
> +# CONFIG_SLAB is not set
> +CONFIG_SLUB=3Dy
> +# CONFIG_SLOB is not set
> +# CONFIG_PROFILING is not set
> +CONFIG_HAVE_OPROFILE=3Dy
> +# CONFIG_KPROBES is not set
> +CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS=3Dy
> +CONFIG_HAVE_IOREMAP_PROT=3Dy
> +CONFIG_HAVE_KPROBES=3Dy
> +CONFIG_HAVE_KRETPROBES=3Dy
> +CONFIG_HAVE_ARCH_TRACEHOOK=3Dy
> +CONFIG_HAVE_DMA_ATTRS=3Dy
> +CONFIG_USE_GENERIC_SMP_HELPERS=3Dy
> +CONFIG_HAVE_CLK=3Dy
> +CONFIG_HAVE_DMA_API_DEBUG=3Dy
> +
> +#
> +# GCOV-based kernel profiling
> +#
> +# CONFIG_GCOV_KERNEL is not set
> +# CONFIG_SLOW_WORK is not set
> +# CONFIG_HAVE_GENERIC_DMA_COHERENT is not set
> +CONFIG_SLABINFO=3Dy
> +CONFIG_RT_MUTEXES=3Dy
> +CONFIG_BASE_SMALL=3D0
> +CONFIG_MODULES=3Dy
> +# CONFIG_MODULE_FORCE_LOAD is not set
> +CONFIG_MODULE_UNLOAD=3Dy
> +CONFIG_MODULE_FORCE_UNLOAD=3Dy
> +CONFIG_MODVERSIONS=3Dy
> +# CONFIG_MODULE_SRCVERSION_ALL is not set
> +CONFIG_STOP_MACHINE=3Dy
> +CONFIG_BLOCK=3Dy
> +CONFIG_LBDAF=3Dy
> +# CONFIG_BLK_DEV_BSG is not set
> +# CONFIG_BLK_DEV_INTEGRITY is not set
> +
> +#
> +# IO Schedulers
> +#
> +CONFIG_IOSCHED_NOOP=3Dy
> +CONFIG_IOSCHED_DEADLINE=3Dy
> +CONFIG_IOSCHED_CFQ=3Dy
> +# CONFIG_DEFAULT_DEADLINE is not set
> +CONFIG_DEFAULT_CFQ=3Dy
> +# CONFIG_DEFAULT_NOOP is not set
> +CONFIG_DEFAULT_IOSCHED=3D"cfq"
> +# CONFIG_INLINE_SPIN_TRYLOCK is not set
> +# CONFIG_INLINE_SPIN_TRYLOCK_BH is not set
> +# CONFIG_INLINE_SPIN_LOCK is not set
> +# CONFIG_INLINE_SPIN_LOCK_BH is not set
> +# CONFIG_INLINE_SPIN_LOCK_IRQ is not set
> +# CONFIG_INLINE_SPIN_LOCK_IRQSAVE is not set
> +CONFIG_INLINE_SPIN_UNLOCK=3Dy
> +# CONFIG_INLINE_SPIN_UNLOCK_BH is not set
> +CONFIG_INLINE_SPIN_UNLOCK_IRQ=3Dy
> +# CONFIG_INLINE_SPIN_UNLOCK_IRQRESTORE is not set
> +# CONFIG_INLINE_READ_TRYLOCK is not set
> +# CONFIG_INLINE_READ_LOCK is not set
> +# CONFIG_INLINE_READ_LOCK_BH is not set
> +# CONFIG_INLINE_READ_LOCK_IRQ is not set
> +# CONFIG_INLINE_READ_LOCK_IRQSAVE is not set
> +CONFIG_INLINE_READ_UNLOCK=3Dy
> +# CONFIG_INLINE_READ_UNLOCK_BH is not set
> +CONFIG_INLINE_READ_UNLOCK_IRQ=3Dy
> +# CONFIG_INLINE_READ_UNLOCK_IRQRESTORE is not set
> +# CONFIG_INLINE_WRITE_TRYLOCK is not set
> +# CONFIG_INLINE_WRITE_LOCK is not set
> +# CONFIG_INLINE_WRITE_LOCK_BH is not set
> +# CONFIG_INLINE_WRITE_LOCK_IRQ is not set
> +# CONFIG_INLINE_WRITE_LOCK_IRQSAVE is not set
> +CONFIG_INLINE_WRITE_UNLOCK=3Dy
> +# CONFIG_INLINE_WRITE_UNLOCK_BH is not set
> +CONFIG_INLINE_WRITE_UNLOCK_IRQ=3Dy
> +# CONFIG_INLINE_WRITE_UNLOCK_IRQRESTORE is not set
> +CONFIG_MUTEX_SPIN_ON_OWNER=3Dy
> +# CONFIG_FREEZER is not set
> +CONFIG_PPC_MSI_BITMAP=3Dy
> +
> +#
> +# Platform support
> +#
> +# CONFIG_PPC_CELL is not set
> +# CONFIG_PPC_CELL_NATIVE is not set
> +# CONFIG_PQ2ADS is not set
> +CONFIG_FSL_SOC_BOOKE=3Dy
> +CONFIG_MPC8540_ADS=3Dy
> +CONFIG_MPC8560_ADS=3Dy
> +CONFIG_MPC85xx_CDS=3Dy
> +CONFIG_MPC85xx_MDS=3Dy
> +CONFIG_MPC8536_DS=3Dy
> +CONFIG_MPC85xx_DS=3Dy
> +CONFIG_MPC85xx_RDB=3Dy
> +CONFIG_SOCRATES=3Dy
> +CONFIG_KSI8560=3Dy
> +CONFIG_XES_MPC85xx=3Dy
> +CONFIG_STX_GP3=3Dy
> +CONFIG_TQM8540=3Dy
> +CONFIG_TQM8541=3Dy
> +CONFIG_TQM8548=3Dy
> +CONFIG_TQM8555=3Dy
> +CONFIG_TQM8560=3Dy
> +CONFIG_SBC8548=3Dy
> +# CONFIG_SBC8560 is not set
> +# CONFIG_P4080_DS is not set
> +CONFIG_TQM85xx=3Dy
> +# CONFIG_IPIC is not set
> +CONFIG_MPIC=3Dy
> +# CONFIG_MPIC_WEIRD is not set
> +CONFIG_PPC_I8259=3Dy
> +# CONFIG_PPC_RTAS is not set
> +# CONFIG_MMIO_NVRAM is not set
> +# CONFIG_PPC_MPC106 is not set
> +# CONFIG_PPC_970_NAP is not set
> +# CONFIG_PPC_INDIRECT_IO is not set
> +# CONFIG_GENERIC_IOMAP is not set
> +# CONFIG_CPU_FREQ is not set
> +CONFIG_QUICC_ENGINE=3Dy
> +CONFIG_QE_GPIO=3Dy
> +CONFIG_CPM2=3Dy
> +CONFIG_FSL_ULI1575=3Dy
> +CONFIG_CPM=3Dy
> +CONFIG_MPC8xxx_GPIO=3Dy
> +# CONFIG_SIMPLE_GPIO is not set
> +
> +#
> +# Kernel options
> +#
> +CONFIG_HIGHMEM=3Dy
> +CONFIG_TICK_ONESHOT=3Dy
> +CONFIG_NO_HZ=3Dy
> +CONFIG_HIGH_RES_TIMERS=3Dy
> +CONFIG_GENERIC_CLOCKEVENTS_BUILD=3Dy
> +# CONFIG_HZ_100 is not set
> +CONFIG_HZ_250=3Dy
> +# CONFIG_HZ_300 is not set
> +# CONFIG_HZ_1000 is not set
> +CONFIG_HZ=3D250
> +CONFIG_SCHED_HRTICK=3Dy
> +CONFIG_PREEMPT_NONE=3Dy
> +# CONFIG_PREEMPT_VOLUNTARY is not set
> +# CONFIG_PREEMPT is not set
> +CONFIG_BINFMT_ELF=3Dy
> +# CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
> +# CONFIG_HAVE_AOUT is not set
> +CONFIG_BINFMT_MISC=3Dm
> +CONFIG_MATH_EMULATION=3Dy
> +CONFIG_IOMMU_HELPER=3Dy
> +CONFIG_SWIOTLB=3Dy
> +CONFIG_ARCH_ENABLE_MEMORY_HOTPLUG=3Dy
> +CONFIG_ARCH_HAS_WALK_MEMORY=3Dy
> +CONFIG_ARCH_ENABLE_MEMORY_HOTREMOVE=3Dy
> +# CONFIG_IRQ_ALL_CPUS is not set
> +CONFIG_SPARSE_IRQ=3Dy
> +CONFIG_MAX_ACTIVE_REGIONS=3D32
> +CONFIG_ARCH_FLATMEM_ENABLE=3Dy
> +CONFIG_ARCH_POPULATES_NODE_MAP=3Dy
> +CONFIG_SELECT_MEMORY_MODEL=3Dy
> +CONFIG_FLATMEM_MANUAL=3Dy
> +# CONFIG_DISCONTIGMEM_MANUAL is not set
> +# CONFIG_SPARSEMEM_MANUAL is not set
> +CONFIG_FLATMEM=3Dy
> +CONFIG_FLAT_NODE_MEM_MAP=3Dy
> +CONFIG_PAGEFLAGS_EXTENDED=3Dy
> +CONFIG_SPLIT_PTLOCK_CPUS=3D4
> +CONFIG_MIGRATION=3Dy
> +# CONFIG_PHYS_ADDR_T_64BIT is not set
> +CONFIG_ZONE_DMA_FLAG=3D1
> +CONFIG_BOUNCE=3Dy
> +CONFIG_VIRT_TO_BUS=3Dy
> +# CONFIG_KSM is not set
> +CONFIG_DEFAULT_MMAP_MIN_ADDR=3D4096
> +CONFIG_PPC_4K_PAGES=3Dy
> +# CONFIG_PPC_16K_PAGES is not set
> +# CONFIG_PPC_64K_PAGES is not set
> +# CONFIG_PPC_256K_PAGES is not set
> +CONFIG_FORCE_MAX_ZONEORDER=3D11
> +CONFIG_PROC_DEVICETREE=3Dy
> +# CONFIG_CMDLINE_BOOL is not set
> +CONFIG_EXTRA_TARGETS=3D""
> +# CONFIG_PM is not set
> +CONFIG_SECCOMP=3Dy
> +CONFIG_ISA_DMA_API=3Dy
> +
> +#
> +# Bus options
> +#
> +CONFIG_ZONE_DMA=3Dy
> +CONFIG_GENERIC_ISA_DMA=3Dy
> +CONFIG_PPC_INDIRECT_PCI=3Dy
> +CONFIG_FSL_SOC=3Dy
> +CONFIG_FSL_PCI=3Dy
> +CONFIG_PPC_PCI_CHOICE=3Dy
> +CONFIG_PCI=3Dy
> +CONFIG_PCI_DOMAINS=3Dy
> +CONFIG_PCI_SYSCALL=3Dy
> +# CONFIG_PCIEPORTBUS is not set
> +CONFIG_ARCH_SUPPORTS_MSI=3Dy
> +CONFIG_PCI_MSI=3Dy
> +# CONFIG_PCI_LEGACY is not set
> +# CONFIG_PCI_DEBUG is not set
> +# CONFIG_PCI_STUB is not set
> +# CONFIG_PCI_IOV is not set
> +# CONFIG_PCCARD is not set
> +# CONFIG_HOTPLUG_PCI is not set
> +CONFIG_HAS_RAPIDIO=3Dy
> +CONFIG_RAPIDIO=3Dy
> +CONFIG_RAPIDIO_DISC_TIMEOUT=3D30
> +
> +#
> +# Advanced setup
> +#
> +# CONFIG_ADVANCED_OPTIONS is not set
> +
> +#
> +# Default settings for advanced configuration options are used
> +#
> +CONFIG_LOWMEM_SIZE=3D0x30000000
> +CONFIG_LOWMEM_CAM_NUM=3D3
> +CONFIG_PAGE_OFFSET=3D0xc0000000
> +CONFIG_KERNEL_START=3D0xc0000000
> +CONFIG_PHYSICAL_START=3D0x00000000
> +CONFIG_PHYSICAL_ALIGN=3D0x04000000
> +CONFIG_TASK_SIZE=3D0xc0000000
> +CONFIG_NET=3Dy
> +
> +#
> +# Networking options
> +#
> +CONFIG_PACKET=3Dy
> +# CONFIG_PACKET_MMAP is not set
> +CONFIG_UNIX=3Dy
> +CONFIG_XFRM=3Dy
> +CONFIG_XFRM_USER=3Dy
> +# CONFIG_XFRM_SUB_POLICY is not set
> +# CONFIG_XFRM_MIGRATE is not set
> +# CONFIG_XFRM_STATISTICS is not set
> +CONFIG_NET_KEY=3Dy
> +# CONFIG_NET_KEY_MIGRATE is not set
> +CONFIG_INET=3Dy
> +CONFIG_IP_MULTICAST=3Dy
> +CONFIG_IP_ADVANCED_ROUTER=3Dy
> +CONFIG_ASK_IP_FIB_HASH=3Dy
> +# CONFIG_IP_FIB_TRIE is not set
> +CONFIG_IP_FIB_HASH=3Dy
> +CONFIG_IP_MULTIPLE_TABLES=3Dy
> +CONFIG_IP_ROUTE_MULTIPATH=3Dy
> +CONFIG_IP_ROUTE_VERBOSE=3Dy
> +CONFIG_IP_PNP=3Dy
> +CONFIG_IP_PNP_DHCP=3Dy
> +CONFIG_IP_PNP_BOOTP=3Dy
> +CONFIG_IP_PNP_RARP=3Dy
> +CONFIG_NET_IPIP=3Dy
> +CONFIG_NET_IPGRE=3Dy
> +CONFIG_NET_IPGRE_BROADCAST=3Dy
> +CONFIG_IP_MROUTE=3Dy
> +CONFIG_IP_PIMSM_V1=3Dy
> +CONFIG_IP_PIMSM_V2=3Dy
> +CONFIG_ARPD=3Dy
> +# CONFIG_SYN_COOKIES is not set
> +# CONFIG_INET_AH is not set
> +CONFIG_INET_ESP=3Dy
> +# CONFIG_INET_IPCOMP is not set
> +# CONFIG_INET_XFRM_TUNNEL is not set
> +CONFIG_INET_TUNNEL=3Dy
> +CONFIG_INET_XFRM_MODE_TRANSPORT=3Dy
> +CONFIG_INET_XFRM_MODE_TUNNEL=3Dy
> +# CONFIG_INET_XFRM_MODE_BEET is not set
> +# CONFIG_INET_LRO is not set
> +CONFIG_INET_DIAG=3Dy
> +CONFIG_INET_TCP_DIAG=3Dy
> +# CONFIG_TCP_CONG_ADVANCED is not set
> +CONFIG_TCP_CONG_CUBIC=3Dy
> +CONFIG_DEFAULT_TCP_CONG=3D"cubic"
> +# CONFIG_TCP_MD5SIG is not set
> +CONFIG_IPV6=3Dy
> +# CONFIG_IPV6_PRIVACY is not set
> +# CONFIG_IPV6_ROUTER_PREF is not set
> +# CONFIG_IPV6_OPTIMISTIC_DAD is not set
> +# CONFIG_INET6_AH is not set
> +# CONFIG_INET6_ESP is not set
> +# CONFIG_INET6_IPCOMP is not set
> +# CONFIG_IPV6_MIP6 is not set
> +# CONFIG_INET6_XFRM_TUNNEL is not set
> +# CONFIG_INET6_TUNNEL is not set
> +CONFIG_INET6_XFRM_MODE_TRANSPORT=3Dy
> +CONFIG_INET6_XFRM_MODE_TUNNEL=3Dy
> +CONFIG_INET6_XFRM_MODE_BEET=3Dy
> +# CONFIG_INET6_XFRM_MODE_ROUTEOPTIMIZATION is not set
> +CONFIG_IPV6_SIT=3Dy
> +# CONFIG_IPV6_SIT_6RD is not set
> +CONFIG_IPV6_NDISC_NODETYPE=3Dy
> +# CONFIG_IPV6_TUNNEL is not set
> +# CONFIG_IPV6_MULTIPLE_TABLES is not set
> +# CONFIG_IPV6_MROUTE is not set
> +# CONFIG_NETWORK_SECMARK is not set
> +# CONFIG_NETFILTER is not set
> +# CONFIG_IP_DCCP is not set
> +CONFIG_IP_SCTP=3Dm
> +# CONFIG_SCTP_DBG_MSG is not set
> +# CONFIG_SCTP_DBG_OBJCNT is not set
> +# CONFIG_SCTP_HMAC_NONE is not set
> +# CONFIG_SCTP_HMAC_SHA1 is not set
> +CONFIG_SCTP_HMAC_MD5=3Dy
> +# CONFIG_RDS is not set
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
> +# CONFIG_PHONET is not set
> +# CONFIG_IEEE802154 is not set
> +# CONFIG_NET_SCHED is not set
> +# CONFIG_DCB is not set
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
> +CONFIG_FIB_RULES=3Dy
> +CONFIG_WIRELESS=3Dy
> +# CONFIG_CFG80211 is not set
> +# CONFIG_LIB80211 is not set
> +
> +#
> +# CFG80211 needs to be enabled for MAC80211
> +#
> +# CONFIG_WIMAX is not set
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
> +# CONFIG_DEVTMPFS is not set
> +CONFIG_STANDALONE=3Dy
> +CONFIG_PREVENT_FIRMWARE_BUILD=3Dy
> +CONFIG_FW_LOADER=3Dy
> +CONFIG_FIRMWARE_IN_KERNEL=3Dy
> +CONFIG_EXTRA_FIRMWARE=3D""
> +# CONFIG_DEBUG_DRIVER is not set
> +# CONFIG_DEBUG_DEVRES is not set
> +# CONFIG_SYS_HYPERVISOR is not set
> +# CONFIG_CONNECTOR is not set
> +CONFIG_MTD=3Dy
> +# CONFIG_MTD_DEBUG is not set
> +# CONFIG_MTD_TESTS is not set
> +CONFIG_MTD_CONCAT=3Dy
> +CONFIG_MTD_PARTITIONS=3Dy
> +# CONFIG_MTD_REDBOOT_PARTS is not set
> +# CONFIG_MTD_CMDLINE_PARTS is not set
> +CONFIG_MTD_OF_PARTS=3Dy
> +# CONFIG_MTD_AR7_PARTS is not set
> +
> +#
> +# User Modules And Translation Layers
> +#
> +CONFIG_MTD_CHAR=3Dy
> +CONFIG_MTD_BLKDEVS=3Dy
> +CONFIG_MTD_BLOCK=3Dy
> +# CONFIG_FTL is not set
> +# CONFIG_NFTL is not set
> +# CONFIG_INFTL is not set
> +# CONFIG_RFD_FTL is not set
> +# CONFIG_SSFDC is not set
> +# CONFIG_MTD_OOPS is not set
> +
> +#
> +# RAM/ROM/Flash chip drivers
> +#
> +CONFIG_MTD_CFI=3Dy
> +CONFIG_MTD_JEDECPROBE=3Dy
> +CONFIG_MTD_GEN_PROBE=3Dy
> +# CONFIG_MTD_CFI_ADV_OPTIONS is not set
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
> +CONFIG_MTD_CFI_INTELEXT=3Dy
> +CONFIG_MTD_CFI_AMDSTD=3Dy
> +# CONFIG_MTD_CFI_STAA is not set
> +CONFIG_MTD_CFI_UTIL=3Dy
> +# CONFIG_MTD_RAM is not set
> +# CONFIG_MTD_ROM is not set
> +# CONFIG_MTD_ABSENT is not set
> +
> +#
> +# Mapping drivers for chip access
> +#
> +# CONFIG_MTD_COMPLEX_MAPPINGS is not set
> +# CONFIG_MTD_PHYSMAP is not set
> +CONFIG_MTD_PHYSMAP_OF=3Dy
> +# CONFIG_MTD_INTEL_VR_NOR is not set
> +# CONFIG_MTD_PLATRAM is not set
> +
> +#
> +# Self-contained MTD device drivers
> +#
> +# CONFIG_MTD_PMC551 is not set
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
> +CONFIG_MTD_NAND_IDS=3Dy
> +# CONFIG_MTD_NAND_DISKONCHIP is not set
> +# CONFIG_MTD_NAND_CAFE is not set
> +# CONFIG_MTD_NAND_NANDSIM is not set
> +# CONFIG_MTD_NAND_PLATFORM is not set
> +# CONFIG_MTD_ALAUDA is not set
> +CONFIG_MTD_NAND_FSL_ELBC=3Dy
> +# CONFIG_MTD_NAND_FSL_UPM is not set
> +# CONFIG_MTD_ONENAND is not set
> +
> +#
> +# LPDDR flash memory drivers
> +#
> +# CONFIG_MTD_LPDDR is not set
> +
> +#
> +# UBI - Unsorted block images
> +#
> +# CONFIG_MTD_UBI is not set
> +CONFIG_OF_DEVICE=3Dy
> +CONFIG_OF_GPIO=3Dy
> +CONFIG_OF_I2C=3Dy
> +CONFIG_OF_MDIO=3Dy
> +# CONFIG_PARPORT is not set
> +CONFIG_BLK_DEV=3Dy
> +# CONFIG_BLK_DEV_FD is not set
> +# CONFIG_BLK_CPQ_DA is not set
> +# CONFIG_BLK_CPQ_CISS_DA is not set
> +# CONFIG_BLK_DEV_DAC960 is not set
> +# CONFIG_BLK_DEV_UMEM is not set
> +# CONFIG_BLK_DEV_COW_COMMON is not set
> +CONFIG_BLK_DEV_LOOP=3Dy
> +# CONFIG_BLK_DEV_CRYPTOLOOP is not set
> +
> +#
> +# DRBD disabled because PROC_FS, INET or CONNECTOR not selected
> +#
> +CONFIG_BLK_DEV_NBD=3Dy
> +# CONFIG_BLK_DEV_SX8 is not set
> +# CONFIG_BLK_DEV_UB is not set
> +CONFIG_BLK_DEV_RAM=3Dy
> +CONFIG_BLK_DEV_RAM_COUNT=3D16
> +CONFIG_BLK_DEV_RAM_SIZE=3D131072
> +# CONFIG_BLK_DEV_XIP is not set
> +# CONFIG_CDROM_PKTCDVD is not set
> +# CONFIG_ATA_OVER_ETH is not set
> +# CONFIG_BLK_DEV_HD is not set
> +CONFIG_MISC_DEVICES=3Dy
> +# CONFIG_AD525X_DPOT is not set
> +# CONFIG_PHANTOM is not set
> +# CONFIG_SGI_IOC4 is not set
> +# CONFIG_TIFM_CORE is not set
> +# CONFIG_ICS932S401 is not set
> +# CONFIG_ENCLOSURE_SERVICES is not set
> +# CONFIG_HP_ILO is not set
> +# CONFIG_ISL29003 is not set
> +# CONFIG_DS1682 is not set
> +# CONFIG_C2PORT is not set
> +
> +#
> +# EEPROM support
> +#
> +# CONFIG_EEPROM_AT24 is not set
> +CONFIG_EEPROM_LEGACY=3Dy
> +# CONFIG_EEPROM_MAX6875 is not set
> +# CONFIG_EEPROM_93CX6 is not set
> +# CONFIG_CB710_CORE is not set
> +CONFIG_HAVE_IDE=3Dy
> +# CONFIG_IDE is not set
> +
> +#
> +# SCSI device support
> +#
> +# CONFIG_RAID_ATTRS is not set
> +CONFIG_SCSI=3Dy
> +CONFIG_SCSI_DMA=3Dy
> +# CONFIG_SCSI_TGT is not set
> +# CONFIG_SCSI_NETLINK is not set
> +CONFIG_SCSI_PROC_FS=3Dy
> +
> +#
> +# SCSI support type (disk, tape, CD-ROM)
> +#
> +CONFIG_BLK_DEV_SD=3Dy
> +CONFIG_CHR_DEV_ST=3Dy
> +# CONFIG_CHR_DEV_OSST is not set
> +CONFIG_BLK_DEV_SR=3Dy
> +# CONFIG_BLK_DEV_SR_VENDOR is not set
> +CONFIG_CHR_DEV_SG=3Dy
> +# CONFIG_CHR_DEV_SCH is not set
> +CONFIG_SCSI_MULTI_LUN=3Dy
> +# CONFIG_SCSI_CONSTANTS is not set
> +CONFIG_SCSI_LOGGING=3Dy
> +# CONFIG_SCSI_SCAN_ASYNC is not set
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
> +# CONFIG_SCSI_CXGB3_ISCSI is not set
> +# CONFIG_SCSI_BNX2_ISCSI is not set
> +# CONFIG_BE2ISCSI is not set
> +# CONFIG_BLK_DEV_3W_XXXX_RAID is not set
> +# CONFIG_SCSI_HPSA is not set
> +# CONFIG_SCSI_3W_9XXX is not set
> +# CONFIG_SCSI_3W_SAS is not set
> +# CONFIG_SCSI_ACARD is not set
> +# CONFIG_SCSI_AACRAID is not set
> +# CONFIG_SCSI_AIC7XXX is not set
> +# CONFIG_SCSI_AIC7XXX_OLD is not set
> +# CONFIG_SCSI_AIC79XX is not set
> +# CONFIG_SCSI_AIC94XX is not set
> +# CONFIG_SCSI_MVSAS is not set
> +# CONFIG_SCSI_DPT_I2O is not set
> +# CONFIG_SCSI_ADVANSYS is not set
> +# CONFIG_SCSI_ARCMSR is not set
> +# CONFIG_MEGARAID_NEWGEN is not set
> +# CONFIG_MEGARAID_LEGACY is not set
> +# CONFIG_MEGARAID_SAS is not set
> +# CONFIG_SCSI_MPT2SAS is not set
> +# CONFIG_SCSI_HPTIOP is not set
> +# CONFIG_SCSI_BUSLOGIC is not set
> +# CONFIG_LIBFC is not set
> +# CONFIG_LIBFCOE is not set
> +# CONFIG_FCOE is not set
> +# CONFIG_SCSI_DMX3191D is not set
> +# CONFIG_SCSI_EATA is not set
> +# CONFIG_SCSI_FUTURE_DOMAIN is not set
> +# CONFIG_SCSI_GDTH is not set
> +# CONFIG_SCSI_IPS is not set
> +# CONFIG_SCSI_INITIO is not set
> +# CONFIG_SCSI_INIA100 is not set
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
> +# CONFIG_SCSI_PMCRAID is not set
> +# CONFIG_SCSI_PM8001 is not set
> +# CONFIG_SCSI_SRP is not set
> +# CONFIG_SCSI_BFA_FC is not set
> +# CONFIG_SCSI_DH is not set
> +# CONFIG_SCSI_OSD_INITIATOR is not set
> +CONFIG_ATA=3Dy
> +# CONFIG_ATA_NONSTANDARD is not set
> +CONFIG_ATA_VERBOSE_ERROR=3Dy
> +CONFIG_SATA_PMP=3Dy
> +CONFIG_SATA_AHCI=3Dy
> +# CONFIG_SATA_SIL24 is not set
> +CONFIG_SATA_FSL=3Dy
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
> +CONFIG_PATA_ALI=3Dy
> +# CONFIG_PATA_AMD is not set
> +# CONFIG_PATA_ARTOP is not set
> +# CONFIG_PATA_ATP867X is not set
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
> +# CONFIG_PATA_PDC2027X is not set
> +# CONFIG_PATA_PDC_OLD is not set
> +# CONFIG_PATA_RADISYS is not set
> +# CONFIG_PATA_RDC is not set
> +# CONFIG_PATA_RZ1000 is not set
> +# CONFIG_PATA_SC1200 is not set
> +# CONFIG_PATA_SERVERWORKS is not set
> +# CONFIG_PATA_SIL680 is not set
> +# CONFIG_PATA_SIS is not set
> +# CONFIG_PATA_TOSHIBA is not set
> +# CONFIG_PATA_VIA is not set
> +# CONFIG_PATA_WINBOND is not set
> +# CONFIG_PATA_PLATFORM is not set
> +# CONFIG_PATA_SCH is not set
> +# CONFIG_MD is not set
> +# CONFIG_FUSION is not set
> +
> +#
> +# IEEE 1394 (FireWire) support
> +#
> +
> +#
> +# You can enable one or both FireWire driver stacks.
> +#
> +
> +#
> +# The newer stack is recommended.
> +#
> +# CONFIG_FIREWIRE is not set
> +# CONFIG_IEEE1394 is not set
> +# CONFIG_I2O is not set
> +# CONFIG_MACINTOSH_DRIVERS is not set
> +CONFIG_NETDEVICES=3Dy
> +CONFIG_DUMMY=3Dy
> +# CONFIG_BONDING is not set
> +# CONFIG_MACVLAN is not set
> +# CONFIG_EQUALIZER is not set
> +# CONFIG_TUN is not set
> +# CONFIG_VETH is not set
> +# CONFIG_ARCNET is not set
> +CONFIG_PHYLIB=3Dy
> +
> +#
> +# MII PHY device drivers
> +#
> +CONFIG_MARVELL_PHY=3Dy
> +CONFIG_DAVICOM_PHY=3Dy
> +# CONFIG_QSEMI_PHY is not set
> +# CONFIG_LXT_PHY is not set
> +CONFIG_CICADA_PHY=3Dy
> +CONFIG_VITESSE_PHY=3Dy
> +# CONFIG_SMSC_PHY is not set
> +# CONFIG_BROADCOM_PHY is not set
> +# CONFIG_ICPLUS_PHY is not set
> +# CONFIG_REALTEK_PHY is not set
> +# CONFIG_NATIONAL_PHY is not set
> +# CONFIG_STE10XP is not set
> +# CONFIG_LSI_ET1011C_PHY is not set
> +CONFIG_FIXED_PHY=3Dy
> +# CONFIG_MDIO_BITBANG is not set
> +CONFIG_NET_ETHERNET=3Dy
> +CONFIG_MII=3Dy
> +# CONFIG_HAPPYMEAL is not set
> +# CONFIG_SUNGEM is not set
> +# CONFIG_CASSINI is not set
> +# CONFIG_NET_VENDOR_3COM is not set
> +# CONFIG_ETHOC is not set
> +# CONFIG_DNET is not set
> +# CONFIG_NET_TULIP is not set
> +# CONFIG_HP100 is not set
> +# CONFIG_IBM_NEW_EMAC_ZMII is not set
> +# CONFIG_IBM_NEW_EMAC_RGMII is not set
> +# CONFIG_IBM_NEW_EMAC_TAH is not set
> +# CONFIG_IBM_NEW_EMAC_EMAC4 is not set
> +# CONFIG_IBM_NEW_EMAC_NO_FLOW_CTRL is not set
> +# CONFIG_IBM_NEW_EMAC_MAL_CLR_ICINTSTAT is not set
> +# CONFIG_IBM_NEW_EMAC_MAL_COMMON_ERR is not set
> +# CONFIG_NET_PCI is not set
> +# CONFIG_B44 is not set
> +# CONFIG_KS8842 is not set
> +# CONFIG_KS8851_MLL is not set
> +# CONFIG_ATL2 is not set
> +# CONFIG_XILINX_EMACLITE is not set
> +CONFIG_FS_ENET=3Dy
> +CONFIG_FS_ENET_HAS_SCC=3Dy
> +CONFIG_FS_ENET_HAS_FCC=3Dy
> +# CONFIG_FS_ENET_MDIO_FCC is not set
> +CONFIG_NETDEV_1000=3Dy
> +# CONFIG_ACENIC is not set
> +# CONFIG_DL2K is not set
> +# CONFIG_E1000 is not set
> +# CONFIG_E1000E is not set
> +# CONFIG_IP1000 is not set
> +# CONFIG_IGB is not set
> +# CONFIG_IGBVF is not set
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
> +# CONFIG_CNIC is not set
> +CONFIG_FSL_PQ_MDIO=3Dy
> +CONFIG_GIANFAR=3Dy
> +CONFIG_UCC_GETH=3Dy
> +# CONFIG_UGETH_TX_ON_DEMAND is not set
> +# CONFIG_MV643XX_ETH is not set
> +# CONFIG_QLA3XXX is not set
> +# CONFIG_ATL1 is not set
> +# CONFIG_ATL1E is not set
> +# CONFIG_ATL1C is not set
> +# CONFIG_JME is not set
> +CONFIG_NETDEV_10000=3Dy
> +# CONFIG_CHELSIO_T1 is not set
> +CONFIG_CHELSIO_T3_DEPENDS=3Dy
> +# CONFIG_CHELSIO_T3 is not set
> +# CONFIG_ENIC is not set
> +# CONFIG_IXGBE is not set
> +# CONFIG_IXGB is not set
> +# CONFIG_S2IO is not set
> +# CONFIG_VXGE is not set
> +# CONFIG_MYRI10GE is not set
> +# CONFIG_NETXEN_NIC is not set
> +# CONFIG_NIU is not set
> +# CONFIG_MLX4_EN is not set
> +# CONFIG_MLX4_CORE is not set
> +# CONFIG_TEHUTI is not set
> +# CONFIG_BNX2X is not set
> +# CONFIG_QLGE is not set
> +# CONFIG_SFC is not set
> +# CONFIG_BE2NET is not set
> +# CONFIG_TR is not set
> +CONFIG_WLAN=3Dy
> +# CONFIG_AIRO is not set
> +# CONFIG_ATMEL is not set
> +# CONFIG_PRISM54 is not set
> +# CONFIG_USB_ZD1201 is not set
> +# CONFIG_HOSTAP is not set
> +
> +#
> +# Enable WiMAX (Networking options) to see the WiMAX drivers
> +#
> +
> +#
> +# USB Network Adapters
> +#
> +# CONFIG_USB_CATC is not set
> +# CONFIG_USB_KAWETH is not set
> +# CONFIG_USB_PEGASUS is not set
> +# CONFIG_USB_RTL8150 is not set
> +# CONFIG_USB_USBNET is not set
> +# CONFIG_WAN is not set
> +# CONFIG_RIONET is not set
> +# CONFIG_FDDI is not set
> +# CONFIG_HIPPI is not set
> +# CONFIG_PPP is not set
> +# CONFIG_SLIP is not set
> +# CONFIG_NET_FC is not set
> +# CONFIG_NETCONSOLE is not set
> +# CONFIG_NETPOLL is not set
> +# CONFIG_NET_POLL_CONTROLLER is not set
> +# CONFIG_VMXNET3 is not set
> +# CONFIG_ISDN is not set
> +# CONFIG_PHONE is not set
> +
> +#
> +# Input device support
> +#
> +CONFIG_INPUT=3Dy
> +CONFIG_INPUT_FF_MEMLESS=3Dm
> +# CONFIG_INPUT_POLLDEV is not set
> +# CONFIG_INPUT_SPARSEKMAP is not set
> +
> +#
> +# Userland interfaces
> +#
> +# CONFIG_INPUT_MOUSEDEV is not set
> +# CONFIG_INPUT_JOYDEV is not set
> +# CONFIG_INPUT_EVDEV is not set
> +# CONFIG_INPUT_EVBUG is not set
> +
> +#
> +# Input Device Drivers
> +#
> +# CONFIG_INPUT_KEYBOARD is not set
> +# CONFIG_INPUT_MOUSE is not set
> +# CONFIG_INPUT_JOYSTICK is not set
> +# CONFIG_INPUT_TABLET is not set
> +# CONFIG_INPUT_TOUCHSCREEN is not set
> +# CONFIG_INPUT_MISC is not set
> +
> +#
> +# Hardware I/O ports
> +#
> +CONFIG_SERIO=3Dy
> +CONFIG_SERIO_I8042=3Dy
> +CONFIG_SERIO_SERPORT=3Dy
> +# CONFIG_SERIO_PCIPS2 is not set
> +CONFIG_SERIO_LIBPS2=3Dy
> +# CONFIG_SERIO_RAW is not set
> +# CONFIG_SERIO_XILINX_XPS_PS2 is not set
> +# CONFIG_SERIO_ALTERA_PS2 is not set
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
> +CONFIG_SERIAL_8250_NR_UARTS=3D2
> +CONFIG_SERIAL_8250_RUNTIME_UARTS=3D2
> +CONFIG_SERIAL_8250_EXTENDED=3Dy
> +CONFIG_SERIAL_8250_MANY_PORTS=3Dy
> +CONFIG_SERIAL_8250_SHARE_IRQ=3Dy
> +CONFIG_SERIAL_8250_DETECT_IRQ=3Dy
> +CONFIG_SERIAL_8250_RSA=3Dy
> +
> +#
> +# Non-8250 serial port support
> +#
> +# CONFIG_SERIAL_UARTLITE is not set
> +CONFIG_SERIAL_CORE=3Dy
> +CONFIG_SERIAL_CORE_CONSOLE=3Dy
> +# CONFIG_SERIAL_CPM is not set
> +# CONFIG_SERIAL_JSM is not set
> +# CONFIG_SERIAL_OF_PLATFORM is not set
> +CONFIG_SERIAL_QE=3Dm
> +# CONFIG_SERIAL_GRLIB_GAISLER_APBUART is not set
> +CONFIG_UNIX98_PTYS=3Dy
> +# CONFIG_DEVPTS_MULTIPLE_INSTANCES is not set
> +CONFIG_LEGACY_PTYS=3Dy
> +CONFIG_LEGACY_PTY_COUNT=3D256
> +# CONFIG_HVC_UDBG is not set
> +# CONFIG_IPMI_HANDLER is not set
> +CONFIG_HW_RANDOM=3Dy
> +# CONFIG_HW_RANDOM_TIMERIOMEM is not set
> +CONFIG_NVRAM=3Dy
> +# CONFIG_R3964 is not set
> +# CONFIG_APPLICOM is not set
> +# CONFIG_RAW_DRIVER is not set
> +# CONFIG_TCG_TPM is not set
> +CONFIG_DEVPORT=3Dy
> +CONFIG_I2C=3Dy
> +CONFIG_I2C_BOARDINFO=3Dy
> +CONFIG_I2C_COMPAT=3Dy
> +# CONFIG_I2C_CHARDEV is not set
> +CONFIG_I2C_HELPER_AUTO=3Dy
> +
> +#
> +# I2C Hardware Bus support
> +#
> +
> +#
> +# PC SMBus host controller drivers
> +#
> +# CONFIG_I2C_ALI1535 is not set
> +# CONFIG_I2C_ALI1563 is not set
> +# CONFIG_I2C_ALI15X3 is not set
> +# CONFIG_I2C_AMD756 is not set
> +# CONFIG_I2C_AMD8111 is not set
> +# CONFIG_I2C_I801 is not set
> +# CONFIG_I2C_ISCH is not set
> +# CONFIG_I2C_PIIX4 is not set
> +# CONFIG_I2C_NFORCE2 is not set
> +# CONFIG_I2C_SIS5595 is not set
> +# CONFIG_I2C_SIS630 is not set
> +# CONFIG_I2C_SIS96X is not set
> +# CONFIG_I2C_VIA is not set
> +# CONFIG_I2C_VIAPRO is not set
> +
> +#
> +# I2C system bus drivers (mostly embedded / system-on-chip)
> +#
> +CONFIG_I2C_CPM=3Dm
> +# CONFIG_I2C_DESIGNWARE is not set
> +# CONFIG_I2C_GPIO is not set
> +CONFIG_I2C_MPC=3Dy
> +# CONFIG_I2C_OCORES is not set
> +# CONFIG_I2C_SIMTEC is not set
> +
> +#
> +# External I2C/SMBus adapter drivers
> +#
> +# CONFIG_I2C_PARPORT_LIGHT is not set
> +# CONFIG_I2C_TAOS_EVM is not set
> +# CONFIG_I2C_TINY_USB is not set
> +
> +#
> +# Other I2C/SMBus bus drivers
> +#
> +# CONFIG_I2C_PCA_PLATFORM is not set
> +# CONFIG_I2C_STUB is not set
> +
> +#
> +# Miscellaneous I2C Chip support
> +#
> +# CONFIG_SENSORS_TSL2550 is not set
> +# CONFIG_I2C_DEBUG_CORE is not set
> +# CONFIG_I2C_DEBUG_ALGO is not set
> +# CONFIG_I2C_DEBUG_BUS is not set
> +# CONFIG_I2C_DEBUG_CHIP is not set
> +# CONFIG_SPI is not set
> +
> +#
> +# PPS support
> +#
> +# CONFIG_PPS is not set
> +CONFIG_ARCH_WANT_OPTIONAL_GPIOLIB=3Dy
> +CONFIG_ARCH_REQUIRE_GPIOLIB=3Dy
> +CONFIG_GPIOLIB=3Dy
> +# CONFIG_DEBUG_GPIO is not set
> +# CONFIG_GPIO_SYSFS is not set
> +
> +#
> +# Memory mapped GPIO expanders:
> +#
> +# CONFIG_GPIO_XILINX is not set
> +
> +#
> +# I2C GPIO expanders:
> +#
> +# CONFIG_GPIO_MAX732X is not set
> +# CONFIG_GPIO_PCA953X is not set
> +# CONFIG_GPIO_PCF857X is not set
> +
> +#
> +# PCI GPIO expanders:
> +#
> +# CONFIG_GPIO_CS5535 is not set
> +# CONFIG_GPIO_BT8XX is not set
> +# CONFIG_GPIO_LANGWELL is not set
> +
> +#
> +# SPI GPIO expanders:
> +#
> +
> +#
> +# AC97 GPIO expanders:
> +#
> +# CONFIG_W1 is not set
> +# CONFIG_POWER_SUPPLY is not set
> +# CONFIG_HWMON is not set
> +# CONFIG_THERMAL is not set
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
> +# CONFIG_UCB1400_CORE is not set
> +# CONFIG_TPS65010 is not set
> +# CONFIG_TWL4030_CORE is not set
> +# CONFIG_MFD_TMIO is not set
> +# CONFIG_PMIC_DA903X is not set
> +# CONFIG_PMIC_ADP5520 is not set
> +# CONFIG_MFD_WM8400 is not set
> +# CONFIG_MFD_WM831X is not set
> +# CONFIG_MFD_WM8350_I2C is not set
> +# CONFIG_MFD_PCF50633 is not set
> +# CONFIG_AB3100_CORE is not set
> +# CONFIG_MFD_88PM8607 is not set
> +# CONFIG_REGULATOR is not set
> +# CONFIG_MEDIA_SUPPORT is not set
> +
> +#
> +# Graphics support
> +#
> +# CONFIG_AGP is not set
> +CONFIG_VGA_ARB=3Dy
> +# CONFIG_DRM is not set
> +# CONFIG_VGASTATE is not set
> +CONFIG_VIDEO_OUTPUT_CONTROL=3Dy
> +# CONFIG_FB is not set
> +# CONFIG_BACKLIGHT_LCD_SUPPORT is not set
> +
> +#
> +# Display device support
> +#
> +# CONFIG_DISPLAY_SUPPORT is not set
> +
> +#
> +# Console display driver support
> +#
> +CONFIG_VGA_CONSOLE=3Dy
> +# CONFIG_VGACON_SOFT_SCROLLBACK is not set
> +CONFIG_DUMMY_CONSOLE=3Dy
> +CONFIG_SOUND=3Dy
> +CONFIG_SOUND_OSS_CORE=3Dy
> +CONFIG_SOUND_OSS_CORE_PRECLAIM=3Dy
> +CONFIG_SND=3Dy
> +CONFIG_SND_TIMER=3Dy
> +CONFIG_SND_PCM=3Dy
> +# CONFIG_SND_SEQUENCER is not set
> +CONFIG_SND_OSSEMUL=3Dy
> +CONFIG_SND_MIXER_OSS=3Dy
> +CONFIG_SND_PCM_OSS=3Dy
> +CONFIG_SND_PCM_OSS_PLUGINS=3Dy
> +# CONFIG_SND_HRTIMER is not set
> +# CONFIG_SND_DYNAMIC_MINORS is not set
> +# CONFIG_SND_SUPPORT_OLD_API is not set
> +CONFIG_SND_VERBOSE_PROCFS=3Dy
> +# CONFIG_SND_VERBOSE_PRINTK is not set
> +# CONFIG_SND_DEBUG is not set
> +CONFIG_SND_VMASTER=3Dy
> +# CONFIG_SND_RAWMIDI_SEQ is not set
> +# CONFIG_SND_OPL3_LIB_SEQ is not set
> +# CONFIG_SND_OPL4_LIB_SEQ is not set
> +# CONFIG_SND_SBAWE_SEQ is not set
> +# CONFIG_SND_EMU10K1_SEQ is not set
> +CONFIG_SND_AC97_CODEC=3Dy
> +CONFIG_SND_DRIVERS=3Dy
> +# CONFIG_SND_DUMMY is not set
> +# CONFIG_SND_MTPAV is not set
> +# CONFIG_SND_SERIAL_U16550 is not set
> +# CONFIG_SND_MPU401 is not set
> +# CONFIG_SND_AC97_POWER_SAVE is not set
> +CONFIG_SND_PCI=3Dy
> +# CONFIG_SND_AD1889 is not set
> +# CONFIG_SND_ALS300 is not set
> +# CONFIG_SND_ALS4000 is not set
> +# CONFIG_SND_ALI5451 is not set
> +# CONFIG_SND_ATIIXP is not set
> +# CONFIG_SND_ATIIXP_MODEM is not set
> +# CONFIG_SND_AU8810 is not set
> +# CONFIG_SND_AU8820 is not set
> +# CONFIG_SND_AU8830 is not set
> +# CONFIG_SND_AW2 is not set
> +# CONFIG_SND_AZT3328 is not set
> +# CONFIG_SND_BT87X is not set
> +# CONFIG_SND_CA0106 is not set
> +# CONFIG_SND_CMIPCI is not set
> +# CONFIG_SND_OXYGEN is not set
> +# CONFIG_SND_CS4281 is not set
> +# CONFIG_SND_CS46XX is not set
> +# CONFIG_SND_CS5530 is not set
> +# CONFIG_SND_CS5535AUDIO is not set
> +# CONFIG_SND_CTXFI is not set
> +# CONFIG_SND_DARLA20 is not set
> +# CONFIG_SND_GINA20 is not set
> +# CONFIG_SND_LAYLA20 is not set
> +# CONFIG_SND_DARLA24 is not set
> +# CONFIG_SND_GINA24 is not set
> +# CONFIG_SND_LAYLA24 is not set
> +# CONFIG_SND_MONA is not set
> +# CONFIG_SND_MIA is not set
> +# CONFIG_SND_ECHO3G is not set
> +# CONFIG_SND_INDIGO is not set
> +# CONFIG_SND_INDIGOIO is not set
> +# CONFIG_SND_INDIGODJ is not set
> +# CONFIG_SND_INDIGOIOX is not set
> +# CONFIG_SND_INDIGODJX is not set
> +# CONFIG_SND_EMU10K1 is not set
> +# CONFIG_SND_EMU10K1X is not set
> +# CONFIG_SND_ENS1370 is not set
> +# CONFIG_SND_ENS1371 is not set
> +# CONFIG_SND_ES1938 is not set
> +# CONFIG_SND_ES1968 is not set
> +# CONFIG_SND_FM801 is not set
> +# CONFIG_SND_HDA_INTEL is not set
> +# CONFIG_SND_HDSP is not set
> +# CONFIG_SND_HDSPM is not set
> +# CONFIG_SND_HIFIER is not set
> +# CONFIG_SND_ICE1712 is not set
> +# CONFIG_SND_ICE1724 is not set
> +CONFIG_SND_INTEL8X0=3Dy
> +# CONFIG_SND_INTEL8X0M is not set
> +# CONFIG_SND_KORG1212 is not set
> +# CONFIG_SND_LX6464ES is not set
> +# CONFIG_SND_MAESTRO3 is not set
> +# CONFIG_SND_MIXART is not set
> +# CONFIG_SND_NM256 is not set
> +# CONFIG_SND_PCXHR is not set
> +# CONFIG_SND_RIPTIDE is not set
> +# CONFIG_SND_RME32 is not set
> +# CONFIG_SND_RME96 is not set
> +# CONFIG_SND_RME9652 is not set
> +# CONFIG_SND_SONICVIBES is not set
> +# CONFIG_SND_TRIDENT is not set
> +# CONFIG_SND_VIA82XX is not set
> +# CONFIG_SND_VIA82XX_MODEM is not set
> +# CONFIG_SND_VIRTUOSO is not set
> +# CONFIG_SND_VX222 is not set
> +# CONFIG_SND_YMFPCI is not set
> +CONFIG_SND_PPC=3Dy
> +CONFIG_SND_USB=3Dy
> +# CONFIG_SND_USB_AUDIO is not set
> +# CONFIG_SND_USB_USX2Y is not set
> +# CONFIG_SND_USB_CAIAQ is not set
> +# CONFIG_SND_SOC is not set
> +# CONFIG_SOUND_PRIME is not set
> +CONFIG_AC97_BUS=3Dy
> +CONFIG_HID_SUPPORT=3Dy
> +CONFIG_HID=3Dy
> +# CONFIG_HIDRAW is not set
> +
> +#
> +# USB Input Devices
> +#
> +CONFIG_USB_HID=3Dy
> +# CONFIG_HID_PID is not set
> +# CONFIG_USB_HIDDEV is not set
> +
> +#
> +# Special HID drivers
> +#
> +CONFIG_HID_A4TECH=3Dy
> +CONFIG_HID_APPLE=3Dy
> +CONFIG_HID_BELKIN=3Dy
> +CONFIG_HID_CHERRY=3Dy
> +CONFIG_HID_CHICONY=3Dy
> +CONFIG_HID_CYPRESS=3Dy
> +# CONFIG_HID_DRAGONRISE is not set
> +CONFIG_HID_EZKEY=3Dy
> +# CONFIG_HID_KYE is not set
> +CONFIG_HID_GYRATION=3Dy
> +# CONFIG_HID_TWINHAN is not set
> +# CONFIG_HID_KENSINGTON is not set
> +CONFIG_HID_LOGITECH=3Dy
> +# CONFIG_LOGITECH_FF is not set
> +# CONFIG_LOGIRUMBLEPAD2_FF is not set
> +CONFIG_HID_MICROSOFT=3Dy
> +CONFIG_HID_MONTEREY=3Dy
> +# CONFIG_HID_NTRIG is not set
> +CONFIG_HID_PANTHERLORD=3Dy
> +# CONFIG_PANTHERLORD_FF is not set
> +CONFIG_HID_PETALYNX=3Dy
> +CONFIG_HID_SAMSUNG=3Dy
> +CONFIG_HID_SONY=3Dy
> +CONFIG_HID_SUNPLUS=3Dy
> +# CONFIG_HID_GREENASIA is not set
> +# CONFIG_HID_SMARTJOYPLUS is not set
> +# CONFIG_HID_TOPSEED is not set
> +# CONFIG_HID_THRUSTMASTER is not set
> +# CONFIG_HID_ZEROPLUS is not set
> +CONFIG_USB_SUPPORT=3Dy
> +CONFIG_USB_ARCH_HAS_HCD=3Dy
> +CONFIG_USB_ARCH_HAS_OHCI=3Dy
> +CONFIG_USB_ARCH_HAS_EHCI=3Dy
> +CONFIG_USB=3Dy
> +# CONFIG_USB_DEBUG is not set
> +# CONFIG_USB_ANNOUNCE_NEW_DEVICES is not set
> +
> +#
> +# Miscellaneous USB options
> +#
> +CONFIG_USB_DEVICEFS=3Dy
> +CONFIG_USB_DEVICE_CLASS=3Dy
> +# CONFIG_USB_DYNAMIC_MINORS is not set
> +# CONFIG_USB_OTG is not set
> +# CONFIG_USB_OTG_WHITELIST is not set
> +# CONFIG_USB_OTG_BLACKLIST_HUB is not set
> +CONFIG_USB_MON=3Dy
> +# CONFIG_USB_WUSB is not set
> +# CONFIG_USB_WUSB_CBAF is not set
> +
> +#
> +# USB Host Controller Drivers
> +#
> +# CONFIG_USB_C67X00_HCD is not set
> +# CONFIG_USB_XHCI_HCD is not set
> +CONFIG_USB_EHCI_HCD=3Dy
> +CONFIG_USB_EHCI_ROOT_HUB_TT=3Dy
> +# CONFIG_USB_EHCI_TT_NEWSCHED is not set
> +# CONFIG_XPS_USB_HCD_XILINX is not set
> +CONFIG_USB_EHCI_FSL=3Dy
> +CONFIG_USB_EHCI_HCD_PPC_OF=3Dy
> +# CONFIG_USB_OXU210HP_HCD is not set
> +# CONFIG_USB_ISP116X_HCD is not set
> +# CONFIG_USB_ISP1760_HCD is not set
> +# CONFIG_USB_ISP1362_HCD is not set
> +CONFIG_USB_OHCI_HCD=3Dy
> +CONFIG_USB_OHCI_HCD_PPC_OF_BE=3Dy
> +CONFIG_USB_OHCI_HCD_PPC_OF_LE=3Dy
> +CONFIG_USB_OHCI_HCD_PPC_OF=3Dy
> +CONFIG_USB_OHCI_HCD_PCI=3Dy
> +CONFIG_USB_OHCI_BIG_ENDIAN_DESC=3Dy
> +CONFIG_USB_OHCI_BIG_ENDIAN_MMIO=3Dy
> +CONFIG_USB_OHCI_LITTLE_ENDIAN=3Dy
> +# CONFIG_USB_UHCI_HCD is not set
> +# CONFIG_USB_FHCI_HCD is not set
> +# CONFIG_USB_SL811_HCD is not set
> +# CONFIG_USB_R8A66597_HCD is not set
> +# CONFIG_USB_WHCI_HCD is not set
> +# CONFIG_USB_HWA_HCD is not set
> +
> +#
> +# USB Device Class drivers
> +#
> +# CONFIG_USB_ACM is not set
> +# CONFIG_USB_PRINTER is not set
> +# CONFIG_USB_WDM is not set
> +# CONFIG_USB_TMC is not set
> +
> +#
> +# NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may
> +#
> +
> +#
> +# also be needed; see USB_STORAGE Help for more info
> +#
> +CONFIG_USB_STORAGE=3Dy
> +# CONFIG_USB_STORAGE_DEBUG is not set
> +# CONFIG_USB_STORAGE_DATAFAB is not set
> +# CONFIG_USB_STORAGE_FREECOM is not set
> +# CONFIG_USB_STORAGE_ISD200 is not set
> +# CONFIG_USB_STORAGE_USBAT is not set
> +# CONFIG_USB_STORAGE_SDDR09 is not set
> +# CONFIG_USB_STORAGE_SDDR55 is not set
> +# CONFIG_USB_STORAGE_JUMPSHOT is not set
> +# CONFIG_USB_STORAGE_ALAUDA is not set
> +# CONFIG_USB_STORAGE_ONETOUCH is not set
> +# CONFIG_USB_STORAGE_KARMA is not set
> +# CONFIG_USB_STORAGE_CYPRESS_ATACB is not set
> +# CONFIG_USB_LIBUSUAL is not set
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
> +# CONFIG_USB_SERIAL is not set
> +
> +#
> +# USB Miscellaneous drivers
> +#
> +# CONFIG_USB_EMI62 is not set
> +# CONFIG_USB_EMI26 is not set
> +# CONFIG_USB_ADUTUX is not set
> +# CONFIG_USB_SEVSEG is not set
> +# CONFIG_USB_RIO500 is not set
> +# CONFIG_USB_LEGOTOWER is not set
> +# CONFIG_USB_LCD is not set
> +# CONFIG_USB_BERRY_CHARGE is not set
> +# CONFIG_USB_LED is not set
> +# CONFIG_USB_CYPRESS_CY7C63 is not set
> +# CONFIG_USB_CYTHERM is not set
> +# CONFIG_USB_IDMOUSE is not set
> +# CONFIG_USB_FTDI_ELAN is not set
> +# CONFIG_USB_APPLEDISPLAY is not set
> +# CONFIG_USB_SISUSBVGA is not set
> +# CONFIG_USB_LD is not set
> +# CONFIG_USB_TRANCEVIBRATOR is not set
> +# CONFIG_USB_IOWARRIOR is not set
> +# CONFIG_USB_TEST is not set
> +# CONFIG_USB_ISIGHTFW is not set
> +# CONFIG_USB_VST is not set
> +# CONFIG_USB_GADGET is not set
> +
> +#
> +# OTG and related infrastructure
> +#
> +# CONFIG_USB_GPIO_VBUS is not set
> +# CONFIG_NOP_USB_XCEIV is not set
> +# CONFIG_UWB is not set
> +# CONFIG_MMC is not set
> +# CONFIG_MEMSTICK is not set
> +# CONFIG_NEW_LEDS is not set
> +# CONFIG_ACCESSIBILITY is not set
> +# CONFIG_INFINIBAND is not set
> +CONFIG_EDAC=3Dy
> +
> +#
> +# Reporting subsystems
> +#
> +# CONFIG_EDAC_DEBUG is not set
> +CONFIG_EDAC_MM_EDAC=3Dy
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
> +# CONFIG_RTC_DRV_BQ32K is not set
> +# CONFIG_RTC_DRV_S35390A is not set
> +# CONFIG_RTC_DRV_FM3130 is not set
> +# CONFIG_RTC_DRV_RX8581 is not set
> +# CONFIG_RTC_DRV_RX8025 is not set
> +
> +#
> +# SPI RTC drivers
> +#
> +
> +#
> +# Platform RTC drivers
> +#
> +CONFIG_RTC_DRV_CMOS=3Dy
> +# CONFIG_RTC_DRV_DS1286 is not set
> +# CONFIG_RTC_DRV_DS1511 is not set
> +# CONFIG_RTC_DRV_DS1553 is not set
> +# CONFIG_RTC_DRV_DS1742 is not set
> +# CONFIG_RTC_DRV_STK17TA8 is not set
> +# CONFIG_RTC_DRV_M48T86 is not set
> +# CONFIG_RTC_DRV_M48T35 is not set
> +# CONFIG_RTC_DRV_M48T59 is not set
> +# CONFIG_RTC_DRV_MSM6242 is not set
> +# CONFIG_RTC_DRV_BQ4802 is not set
> +# CONFIG_RTC_DRV_RP5C01 is not set
> +# CONFIG_RTC_DRV_V3020 is not set
> +
> +#
> +# on-CPU RTC drivers
> +#
> +# CONFIG_RTC_DRV_GENERIC is not set
> +CONFIG_DMADEVICES=3Dy
> +
> +#
> +# DMA Devices
> +#
> +CONFIG_FSL_DMA=3Dy
> +CONFIG_DMA_ENGINE=3Dy
> +
> +#
> +# DMA Clients
> +#
> +# CONFIG_NET_DMA is not set
> +# CONFIG_ASYNC_TX_DMA is not set
> +# CONFIG_DMATEST is not set
> +# CONFIG_AUXDISPLAY is not set
> +# CONFIG_UIO is not set
> +
> +#
> +# TI VLYNQ
> +#
> +# CONFIG_STAGING is not set
> +
> +#
> +# File systems
> +#
> +CONFIG_EXT2_FS=3Dy
> +# CONFIG_EXT2_FS_XATTR is not set
> +# CONFIG_EXT2_FS_XIP is not set
> +CONFIG_EXT3_FS=3Dy
> +# CONFIG_EXT3_DEFAULTS_TO_ORDERED is not set
> +CONFIG_EXT3_FS_XATTR=3Dy
> +# CONFIG_EXT3_FS_POSIX_ACL is not set
> +# CONFIG_EXT3_FS_SECURITY is not set
> +# CONFIG_EXT4_FS is not set
> +CONFIG_JBD=3Dy
> +# CONFIG_JBD_DEBUG is not set
> +CONFIG_FS_MBCACHE=3Dy
> +# CONFIG_REISERFS_FS is not set
> +# CONFIG_JFS_FS is not set
> +# CONFIG_FS_POSIX_ACL is not set
> +# CONFIG_XFS_FS is not set
> +# CONFIG_GFS2_FS is not set
> +# CONFIG_OCFS2_FS is not set
> +# CONFIG_BTRFS_FS is not set
> +# CONFIG_NILFS2_FS is not set
> +CONFIG_FILE_LOCKING=3Dy
> +CONFIG_FSNOTIFY=3Dy
> +CONFIG_DNOTIFY=3Dy
> +CONFIG_INOTIFY=3Dy
> +CONFIG_INOTIFY_USER=3Dy
> +# CONFIG_QUOTA is not set
> +# CONFIG_AUTOFS_FS is not set
> +# CONFIG_AUTOFS4_FS is not set
> +# CONFIG_FUSE_FS is not set
> +
> +#
> +# Caches
> +#
> +# CONFIG_FSCACHE is not set
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
> +CONFIG_FAT_FS=3Dy
> +CONFIG_MSDOS_FS=3Dm
> +CONFIG_VFAT_FS=3Dy
> +CONFIG_FAT_DEFAULT_CODEPAGE=3D437
> +CONFIG_FAT_DEFAULT_IOCHARSET=3D"iso8859-1"
> +CONFIG_NTFS_FS=3Dy
> +# CONFIG_NTFS_DEBUG is not set
> +# CONFIG_NTFS_RW is not set
> +
> +#
> +# Pseudo filesystems
> +#
> +CONFIG_PROC_FS=3Dy
> +CONFIG_PROC_KCORE=3Dy
> +CONFIG_PROC_SYSCTL=3Dy
> +CONFIG_PROC_PAGE_MONITOR=3Dy
> +CONFIG_SYSFS=3Dy
> +CONFIG_TMPFS=3Dy
> +# CONFIG_TMPFS_POSIX_ACL is not set
> +# CONFIG_HUGETLB_PAGE is not set
> +# CONFIG_CONFIGFS_FS is not set
> +CONFIG_MISC_FILESYSTEMS=3Dy
> +CONFIG_ADFS_FS=3Dm
> +# CONFIG_ADFS_FS_RW is not set
> +CONFIG_AFFS_FS=3Dm
> +CONFIG_HFS_FS=3Dm
> +CONFIG_HFSPLUS_FS=3Dm
> +CONFIG_BEFS_FS=3Dm
> +# CONFIG_BEFS_DEBUG is not set
> +CONFIG_BFS_FS=3Dm
> +CONFIG_EFS_FS=3Dm
> +CONFIG_CRAMFS=3Dy
> +# CONFIG_SQUASHFS is not set
> +CONFIG_VXFS_FS=3Dm
> +# CONFIG_MINIX_FS is not set
> +# CONFIG_OMFS_FS is not set
> +CONFIG_HPFS_FS=3Dm
> +CONFIG_QNX4FS_FS=3Dm
> +# CONFIG_ROMFS_FS is not set
> +CONFIG_SYSV_FS=3Dm
> +CONFIG_UFS_FS=3Dm
> +# CONFIG_UFS_FS_WRITE is not set
> +# CONFIG_UFS_DEBUG is not set
> +CONFIG_NETWORK_FILESYSTEMS=3Dy
> +CONFIG_NFS_FS=3Dy
> +CONFIG_NFS_V3=3Dy
> +# CONFIG_NFS_V3_ACL is not set
> +CONFIG_NFS_V4=3Dy
> +# CONFIG_NFS_V4_1 is not set
> +CONFIG_ROOT_NFS=3Dy
> +CONFIG_NFSD=3Dy
> +# CONFIG_NFSD_V3 is not set
> +# CONFIG_NFSD_V4 is not set
> +CONFIG_LOCKD=3Dy
> +CONFIG_LOCKD_V4=3Dy
> +CONFIG_EXPORTFS=3Dy
> +CONFIG_NFS_COMMON=3Dy
> +CONFIG_SUNRPC=3Dy
> +CONFIG_SUNRPC_GSS=3Dy
> +CONFIG_RPCSEC_GSS_KRB5=3Dy
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
> +CONFIG_MAC_PARTITION=3Dy
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
> +# CONFIG_NLS_CODEPAGE_437 is not set
> +# CONFIG_NLS_CODEPAGE_737 is not set
> +# CONFIG_NLS_CODEPAGE_775 is not set
> +# CONFIG_NLS_CODEPAGE_850 is not set
> +# CONFIG_NLS_CODEPAGE_852 is not set
> +# CONFIG_NLS_CODEPAGE_855 is not set
> +# CONFIG_NLS_CODEPAGE_857 is not set
> +# CONFIG_NLS_CODEPAGE_860 is not set
> +# CONFIG_NLS_CODEPAGE_861 is not set
> +# CONFIG_NLS_CODEPAGE_862 is not set
> +# CONFIG_NLS_CODEPAGE_863 is not set
> +# CONFIG_NLS_CODEPAGE_864 is not set
> +# CONFIG_NLS_CODEPAGE_865 is not set
> +# CONFIG_NLS_CODEPAGE_866 is not set
> +# CONFIG_NLS_CODEPAGE_869 is not set
> +# CONFIG_NLS_CODEPAGE_936 is not set
> +# CONFIG_NLS_CODEPAGE_950 is not set
> +# CONFIG_NLS_CODEPAGE_932 is not set
> +# CONFIG_NLS_CODEPAGE_949 is not set
> +# CONFIG_NLS_CODEPAGE_874 is not set
> +# CONFIG_NLS_ISO8859_8 is not set
> +# CONFIG_NLS_CODEPAGE_1250 is not set
> +# CONFIG_NLS_CODEPAGE_1251 is not set
> +# CONFIG_NLS_ASCII is not set
> +# CONFIG_NLS_ISO8859_1 is not set
> +# CONFIG_NLS_ISO8859_2 is not set
> +# CONFIG_NLS_ISO8859_3 is not set
> +# CONFIG_NLS_ISO8859_4 is not set
> +# CONFIG_NLS_ISO8859_5 is not set
> +# CONFIG_NLS_ISO8859_6 is not set
> +# CONFIG_NLS_ISO8859_7 is not set
> +# CONFIG_NLS_ISO8859_9 is not set
> +# CONFIG_NLS_ISO8859_13 is not set
> +# CONFIG_NLS_ISO8859_14 is not set
> +# CONFIG_NLS_ISO8859_15 is not set
> +# CONFIG_NLS_KOI8_R is not set
> +# CONFIG_NLS_KOI8_U is not set
> +CONFIG_NLS_UTF8=3Dm
> +# CONFIG_DLM is not set
> +CONFIG_UCC_SLOW=3Dy
> +CONFIG_UCC_FAST=3Dy
> +CONFIG_UCC=3Dy
> +# CONFIG_BINARY_PRINTF is not set
> +
> +#
> +# Library routines
> +#
> +CONFIG_BITREVERSE=3Dy
> +CONFIG_GENERIC_FIND_LAST_BIT=3Dy
> +# CONFIG_CRC_CCITT is not set
> +# CONFIG_CRC16 is not set
> +CONFIG_CRC_T10DIF=3Dy
> +CONFIG_CRC_ITU_T=3Dm
> +CONFIG_CRC32=3Dy
> +# CONFIG_CRC7 is not set
> +CONFIG_LIBCRC32C=3Dm
> +CONFIG_ZLIB_INFLATE=3Dy
> +CONFIG_DECOMPRESS_GZIP=3Dy
> +CONFIG_HAS_IOMEM=3Dy
> +CONFIG_HAS_IOPORT=3Dy
> +CONFIG_HAS_DMA=3Dy
> +CONFIG_HAVE_LMB=3Dy
> +CONFIG_NLATTR=3Dy
> +CONFIG_GENERIC_ATOMIC64=3Dy
> +
> +#
> +# Kernel hacking
> +#
> +# CONFIG_PRINTK_TIME is not set
> +CONFIG_ENABLE_WARN_DEPRECATED=3Dy
> +CONFIG_ENABLE_MUST_CHECK=3Dy
> +CONFIG_FRAME_WARN=3D1024
> +# CONFIG_MAGIC_SYSRQ is not set
> +# CONFIG_STRIP_ASM_SYMS is not set
> +# CONFIG_UNUSED_SYMBOLS is not set
> +CONFIG_DEBUG_FS=3Dy
> +# CONFIG_HEADERS_CHECK is not set
> +CONFIG_DEBUG_KERNEL=3Dy
> +# CONFIG_DEBUG_SHIRQ is not set
> +CONFIG_DETECT_SOFTLOCKUP=3Dy
> +# CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC is not set
> +CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC_VALUE=3D0
> +CONFIG_DETECT_HUNG_TASK=3Dy
> +# CONFIG_BOOTPARAM_HUNG_TASK_PANIC is not set
> +CONFIG_BOOTPARAM_HUNG_TASK_PANIC_VALUE=3D0
> +CONFIG_SCHED_DEBUG=3Dy
> +# CONFIG_SCHEDSTATS is not set
> +# CONFIG_TIMER_STATS is not set
> +# CONFIG_DEBUG_OBJECTS is not set
> +# CONFIG_SLUB_DEBUG_ON is not set
> +# CONFIG_SLUB_STATS is not set
> +# CONFIG_DEBUG_KMEMLEAK is not set
> +# CONFIG_DEBUG_RT_MUTEXES is not set
> +# CONFIG_RT_MUTEX_TESTER is not set
> +# CONFIG_DEBUG_SPINLOCK is not set
> +# CONFIG_DEBUG_MUTEXES is not set
> +# CONFIG_DEBUG_LOCK_ALLOC is not set
> +# CONFIG_PROVE_LOCKING is not set
> +# CONFIG_LOCK_STAT is not set
> +# CONFIG_DEBUG_SPINLOCK_SLEEP is not set
> +# CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
> +# CONFIG_DEBUG_KOBJECT is not set
> +# CONFIG_DEBUG_HIGHMEM is not set
> +# CONFIG_DEBUG_BUGVERBOSE is not set
> +CONFIG_DEBUG_INFO=3Dy
> +# CONFIG_DEBUG_VM is not set
> +# CONFIG_DEBUG_WRITECOUNT is not set
> +# CONFIG_DEBUG_MEMORY_INIT is not set
> +# CONFIG_DEBUG_LIST is not set
> +# CONFIG_DEBUG_SG is not set
> +# CONFIG_DEBUG_NOTIFIERS is not set
> +# CONFIG_DEBUG_CREDENTIALS is not set
> +# CONFIG_RCU_TORTURE_TEST is not set
> +# CONFIG_RCU_CPU_STALL_DETECTOR is not set
> +# CONFIG_BACKTRACE_SELF_TEST is not set
> +# CONFIG_DEBUG_BLOCK_EXT_DEVT is not set
> +# CONFIG_DEBUG_FORCE_WEAK_PER_CPU is not set
> +# CONFIG_FAULT_INJECTION is not set
> +# CONFIG_LATENCYTOP is not set
> +CONFIG_SYSCTL_SYSCALL_CHECK=3Dy
> +# CONFIG_DEBUG_PAGEALLOC is not set
> +CONFIG_HAVE_FUNCTION_TRACER=3Dy
> +CONFIG_HAVE_FUNCTION_GRAPH_TRACER=3Dy
> +CONFIG_HAVE_DYNAMIC_FTRACE=3Dy
> +CONFIG_HAVE_FTRACE_MCOUNT_RECORD=3Dy
> +CONFIG_TRACING_SUPPORT=3Dy
> +CONFIG_FTRACE=3Dy
> +# CONFIG_FUNCTION_TRACER is not set
> +# CONFIG_IRQSOFF_TRACER is not set
> +# CONFIG_SCHED_TRACER is not set
> +# CONFIG_ENABLE_DEFAULT_TRACERS is not set
> +# CONFIG_BOOT_TRACER is not set
> +CONFIG_BRANCH_PROFILE_NONE=3Dy
> +# CONFIG_PROFILE_ANNOTATED_BRANCHES is not set
> +# CONFIG_PROFILE_ALL_BRANCHES is not set
> +# CONFIG_STACK_TRACER is not set
> +# CONFIG_KMEMTRACE is not set
> +# CONFIG_WORKQUEUE_TRACER is not set
> +# CONFIG_BLK_DEV_IO_TRACE is not set
> +# CONFIG_DYNAMIC_DEBUG is not set
> +# CONFIG_DMA_API_DEBUG is not set
> +# CONFIG_SAMPLES is not set
> +CONFIG_HAVE_ARCH_KGDB=3Dy
> +# CONFIG_KGDB is not set
> +# CONFIG_PPC_DISABLE_WERROR is not set
> +CONFIG_PPC_WERROR=3Dy
> +CONFIG_PRINT_STACK_DEPTH=3D64
> +# CONFIG_DEBUG_STACKOVERFLOW is not set
> +# CONFIG_DEBUG_STACK_USAGE is not set
> +# CONFIG_PPC_EMULATED_STATS is not set
> +# CONFIG_CODE_PATCHING_SELFTEST is not set
> +# CONFIG_FTR_FIXUP_SELFTEST is not set
> +# CONFIG_MSI_BITMAP_SELFTEST is not set
> +# CONFIG_XMON is not set
> +# CONFIG_IRQSTACKS is not set
> +CONFIG_VIRQ_DEBUG=3Dy
> +# CONFIG_BDI_SWITCH is not set
> +# CONFIG_PPC_EARLY_DEBUG is not set
> +
> +#
> +# Security options
> +#
> +# CONFIG_KEYS is not set
> +# CONFIG_SECURITY is not set
> +# CONFIG_SECURITYFS is not set
> +# CONFIG_DEFAULT_SECURITY_SELINUX is not set
> +# CONFIG_DEFAULT_SECURITY_SMACK is not set
> +# CONFIG_DEFAULT_SECURITY_TOMOYO is not set
> +CONFIG_DEFAULT_SECURITY_DAC=3Dy
> +CONFIG_DEFAULT_SECURITY=3D""
> +CONFIG_CRYPTO=3Dy
> +
> +#
> +# Crypto core or helper
> +#
> +CONFIG_CRYPTO_ALGAPI=3Dy
> +CONFIG_CRYPTO_ALGAPI2=3Dy
> +CONFIG_CRYPTO_AEAD=3Dy
> +CONFIG_CRYPTO_AEAD2=3Dy
> +CONFIG_CRYPTO_BLKCIPHER=3Dy
> +CONFIG_CRYPTO_BLKCIPHER2=3Dy
> +CONFIG_CRYPTO_HASH=3Dy
> +CONFIG_CRYPTO_HASH2=3Dy
> +CONFIG_CRYPTO_RNG2=3Dy
> +CONFIG_CRYPTO_PCOMP=3Dy
> +CONFIG_CRYPTO_MANAGER=3Dy
> +CONFIG_CRYPTO_MANAGER2=3Dy
> +# CONFIG_CRYPTO_GF128MUL is not set
> +# CONFIG_CRYPTO_NULL is not set
> +CONFIG_CRYPTO_WORKQUEUE=3Dy
> +# CONFIG_CRYPTO_CRYPTD is not set
> +CONFIG_CRYPTO_AUTHENC=3Dy
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
> +CONFIG_CRYPTO_CBC=3Dy
> +# CONFIG_CRYPTO_CTR is not set
> +# CONFIG_CRYPTO_CTS is not set
> +# CONFIG_CRYPTO_ECB is not set
> +# CONFIG_CRYPTO_LRW is not set
> +CONFIG_CRYPTO_PCBC=3Dm
> +# CONFIG_CRYPTO_XTS is not set
> +
> +#
> +# Hash modes
> +#
> +CONFIG_CRYPTO_HMAC=3Dy
> +# CONFIG_CRYPTO_XCBC is not set
> +# CONFIG_CRYPTO_VMAC is not set
> +
> +#
> +# Digest
> +#
> +CONFIG_CRYPTO_CRC32C=3Dm
> +# CONFIG_CRYPTO_GHASH is not set
> +# CONFIG_CRYPTO_MD4 is not set
> +CONFIG_CRYPTO_MD5=3Dy
> +# CONFIG_CRYPTO_MICHAEL_MIC is not set
> +# CONFIG_CRYPTO_RMD128 is not set
> +# CONFIG_CRYPTO_RMD160 is not set
> +# CONFIG_CRYPTO_RMD256 is not set
> +# CONFIG_CRYPTO_RMD320 is not set
> +CONFIG_CRYPTO_SHA1=3Dy
> +CONFIG_CRYPTO_SHA256=3Dy
> +CONFIG_CRYPTO_SHA512=3Dy
> +# CONFIG_CRYPTO_TGR192 is not set
> +# CONFIG_CRYPTO_WP512 is not set
> +
> +#
> +# Ciphers
> +#
> +CONFIG_CRYPTO_AES=3Dy
> +# CONFIG_CRYPTO_ANUBIS is not set
> +# CONFIG_CRYPTO_ARC4 is not set
> +# CONFIG_CRYPTO_BLOWFISH is not set
> +# CONFIG_CRYPTO_CAMELLIA is not set
> +# CONFIG_CRYPTO_CAST5 is not set
> +# CONFIG_CRYPTO_CAST6 is not set
> +CONFIG_CRYPTO_DES=3Dy
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
> +# CONFIG_CRYPTO_ZLIB is not set
> +# CONFIG_CRYPTO_LZO is not set
> +
> +#
> +# Random Number Generation
> +#
> +# CONFIG_CRYPTO_ANSI_CPRNG is not set
> +CONFIG_CRYPTO_HW=3Dy
> +# CONFIG_CRYPTO_DEV_HIFN_795X is not set
> +CONFIG_CRYPTO_DEV_TALITOS=3Dy
> +CONFIG_PPC_CLOCK=3Dy
> +CONFIG_PPC_LIB_RHEAP=3Dy
> +# CONFIG_VIRTUALIZATION is not set
> diff --git a/recipes/linux/linux.inc b/recipes/linux/linux.inc
> index 6c2ce31..803b856 100644
> --- a/recipes/linux/linux.inc
> +++ b/recipes/linux/linux.inc
> @@ -38,6 +38,7 @@ KERNEL_DEVICETREE_mpc8313e-rdb =3D "arch/${ARCH}/boot/d=
ts/mpc8313erdb.dts"
>  KERNEL_DEVICETREE_mpc8315e-rdb =3D "arch/${ARCH}/boot/dts/mpc8315erdb.dt=
s"
>  KERNEL_DEVICETREE_mpc8323e-rdb =3D "arch/${ARCH}/boot/dts/mpc832x_rdb.dt=
s"
>  KERNEL_DEVICETREE_sequoia =3D "arch/${ARCH}/boot/dts/sequoia.dts"
> +KERNEL_DEVICETREE_p2020ds =3D "arch/${ARCH}/boot/dts/p2020ds.dts"
> =20
>  KERNEL_DEVICETREE_FLAGS =3D "-R 8 -S 0x3000"
> =20
> diff --git a/recipes/linux/linux_2.6.33.bb b/recipes/linux/linux_2.6.33.b=
b
> index 68b4cf0..b90f23c 100644
> --- a/recipes/linux/linux_2.6.33.bb
> +++ b/recipes/linux/linux_2.6.33.bb
> @@ -2,6 +2,7 @@ require linux.inc
> =20
>  # Mark archs/machines that this kernel supports
>  DEFAULT_PREFERENCE =3D "-1"
> +DEFAULT_PREFERENCE_p2020ds =3D "1"
> =20
>  SRC_URI =3D "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/${P}.tar.bz2;name=
=3Dkernel \
>             file://defconfig"
> diff --git a/recipes/u-boot/u-boot_git.bb b/recipes/u-boot/u-boot_git.bb
> index b63edbd..6109561 100644
> --- a/recipes/u-boot/u-boot_git.bb
> +++ b/recipes/u-boot/u-boot_git.bb
> @@ -12,6 +12,7 @@ SRCREV_afeb9260 =3D "6b8edfde22acc574b5532e9f086e6a7287=
a9bc78"
>  SRCREV_afeb9260-180 =3D "6b8edfde22acc574b5532e9f086e6a7287a9bc78"
>  SRCREV_palmpre =3D "6b8edfde22acc574b5532e9f086e6a7287a9bc78"
>  SRCREV_cm-t35 =3D "3c014f1586d5bfe30dca7549396915c83f31cd30"
> +SRCREV_p2020ds =3D "f20393c5e787b3776c179d20f82a86bda124d651"
>  SRC_URI_append_afeb9260 =3D " file://AFEB9260-network-fix.patch;patch=3D=
1"
>  SRC_URI_append_afeb9260-180 =3D " file://AFEB9260-network-fix.patch;patc=
h=3D1"
>  SRC_URI_append_cm-t35 =3D "file://cm-t35/cm-t35.patch;patch=3D1"
>=20
>=20
> --
> Martyn Welch (Principal Software Engineer)   |   Registered in England an=
d
> GE Intelligent Platforms                     |   Wales (3828642) at 100
> T +44(0)127322748                            |   Barbirolli Square, Manch=
ester,
> E martyn.welch@ge.com                        |   M2 3AB  VAT:GB 927559189


--=20
Tom Rini <tom_rini@mentor.com>
Mentor Graphics Corporation


