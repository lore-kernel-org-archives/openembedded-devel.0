Received: from [82.208.49.253] (helo=mengele.ibawizard.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ynezz@mengele.ibawizard.net>) id 1N6UiN-0002nr-LD
	for openembedded-devel@openembedded.org; Fri, 06 Nov 2009 20:43:22 +0100
Received: by mengele.ibawizard.net (Postfix, from userid 1002)
	id 308671D36076; Fri,  6 Nov 2009 20:42:03 +0100 (CET)
From: =?utf-8?q?Petr=20=C5=A0tetiar?= <ynezz@true.cz>
To: openembedded-devel@openembedded.org
Date: Fri,  6 Nov 2009 20:42:01 +0100
Message-Id: <1257536522-11924-2-git-send-email-ynezz@true.cz>
X-Mailer: git-send-email 1.5.6.5
In-Reply-To: <1257536522-11924-1-git-send-email-ynezz@true.cz>
References: <1257536522-11924-1-git-send-email-ynezz@true.cz>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 82.208.49.253
X-SA-Exim-Mail-From: ynezz@mengele.ibawizard.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] linux: Linux 2.6.31.5 for IEI Nano GX-466
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
X-List-Received-Date: Fri, 06 Nov 2009 19:43:23 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>
---
 conf/checksums.ini                                 |    4 +
 .../linux/linux-2.6.31.5/iei-nanogx-466/defconfig  | 1688 ++++++++++++++=
++++++
 recipes/linux/linux_2.6.31.5.bb                    |   12 +
 3 files changed, 1704 insertions(+), 0 deletions(-)
 create mode 100644 recipes/linux/linux-2.6.31.5/iei-nanogx-466/defconfig
 create mode 100644 recipes/linux/linux_2.6.31.5.bb

diff --git a/conf/checksums.ini b/conf/checksums.ini
index 225a6f8..29c063a 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -16958,6 +16958,10 @@ sha256=3D0acd83f7b85db7ee18c2b0b7505e1ba6fd722c3=
6f49a8870a831c851660e3512
 md5=3Dae7fde9fd0ae0d8ac12a1e1536d6d3ce
 sha256=3De63041db1ef666ca43293762c8aaec27bd4b54b6d86aee68ebb090c1b66584f=
4
=20
+[http://kernel.org/pub/linux/kernel/v2.6/linux-2.6.31.5.tar.bz2]
+md5=3D926bff46d24e2f303e4ee92234e394d8
+sha256=3D3988b645a9350267de5768cc8f41c966c26d8ebfffb31519bf6c8874258603b=
b
+
 [http://kernel.org//pub/linux/kernel/v2.6/linux-2.6.9.tar.bz2]
 md5=3De921200f074ca97184e150ef5a4af825
 sha256=3Df5dba6366e87e91234d1b0069cfea655b0a4cb37ea97f899226f16998e6ab9f=
1
diff --git a/recipes/linux/linux-2.6.31.5/iei-nanogx-466/defconfig b/reci=
pes/linux/linux-2.6.31.5/iei-nanogx-466/defconfig
new file mode 100644
index 0000000..5084958
--- /dev/null
+++ b/recipes/linux/linux-2.6.31.5/iei-nanogx-466/defconfig
@@ -0,0 +1,1688 @@
+#
+# Automatically generated make config: don't edit
+# Linux kernel version: 2.6.31.5
+# Tue Oct 27 00:08:58 2009
+#
+# CONFIG_64BIT is not set
+CONFIG_X86_32=3Dy
+# CONFIG_X86_64 is not set
+CONFIG_X86=3Dy
+CONFIG_OUTPUT_FORMAT=3D"elf32-i386"
+CONFIG_ARCH_DEFCONFIG=3D"arch/x86/configs/i386_defconfig"
+CONFIG_GENERIC_TIME=3Dy
+CONFIG_GENERIC_CMOS_UPDATE=3Dy
+CONFIG_CLOCKSOURCE_WATCHDOG=3Dy
+CONFIG_GENERIC_CLOCKEVENTS=3Dy
+CONFIG_LOCKDEP_SUPPORT=3Dy
+CONFIG_STACKTRACE_SUPPORT=3Dy
+CONFIG_HAVE_LATENCYTOP_SUPPORT=3Dy
+CONFIG_FAST_CMPXCHG_LOCAL=3Dy
+CONFIG_MMU=3Dy
+CONFIG_ZONE_DMA=3Dy
+CONFIG_GENERIC_ISA_DMA=3Dy
+CONFIG_GENERIC_IOMAP=3Dy
+CONFIG_GENERIC_BUG=3Dy
+CONFIG_GENERIC_HWEIGHT=3Dy
+CONFIG_ARCH_MAY_HAVE_PC_FDC=3Dy
+# CONFIG_RWSEM_GENERIC_SPINLOCK is not set
+CONFIG_RWSEM_XCHGADD_ALGORITHM=3Dy
+CONFIG_ARCH_HAS_CPU_IDLE_WAIT=3Dy
+CONFIG_GENERIC_CALIBRATE_DELAY=3Dy
+# CONFIG_GENERIC_TIME_VSYSCALL is not set
+CONFIG_ARCH_HAS_CPU_RELAX=3Dy
+CONFIG_ARCH_HAS_DEFAULT_IDLE=3Dy
+CONFIG_ARCH_HAS_CACHE_LINE_SIZE=3Dy
+CONFIG_HAVE_SETUP_PER_CPU_AREA=3Dy
+CONFIG_HAVE_DYNAMIC_PER_CPU_AREA=3Dy
+# CONFIG_HAVE_CPUMASK_OF_CPU_MAP is not set
+CONFIG_ARCH_HIBERNATION_POSSIBLE=3Dy
+CONFIG_ARCH_SUSPEND_POSSIBLE=3Dy
+# CONFIG_ZONE_DMA32 is not set
+CONFIG_ARCH_POPULATES_NODE_MAP=3Dy
+# CONFIG_AUDIT_ARCH is not set
+CONFIG_ARCH_SUPPORTS_OPTIMIZED_INLINING=3Dy
+CONFIG_ARCH_SUPPORTS_DEBUG_PAGEALLOC=3Dy
+CONFIG_GENERIC_HARDIRQS=3Dy
+CONFIG_GENERIC_HARDIRQS_NO__DO_IRQ=3Dy
+CONFIG_GENERIC_IRQ_PROBE=3Dy
+CONFIG_X86_32_LAZY_GS=3Dy
+CONFIG_KTIME_SCALAR=3Dy
+CONFIG_DEFCONFIG_LIST=3D"/lib/modules/$UNAME_RELEASE/.config"
+CONFIG_CONSTRUCTORS=3Dy
+
+#
+# General setup
+#
+CONFIG_EXPERIMENTAL=3Dy
+CONFIG_BROKEN_ON_SMP=3Dy
+CONFIG_INIT_ENV_ARG_LIMIT=3D32
+CONFIG_LOCALVERSION=3D""
+# CONFIG_LOCALVERSION_AUTO is not set
+CONFIG_HAVE_KERNEL_GZIP=3Dy
+CONFIG_HAVE_KERNEL_BZIP2=3Dy
+CONFIG_HAVE_KERNEL_LZMA=3Dy
+CONFIG_KERNEL_GZIP=3Dy
+# CONFIG_KERNEL_BZIP2 is not set
+# CONFIG_KERNEL_LZMA is not set
+CONFIG_SWAP=3Dy
+CONFIG_SYSVIPC=3Dy
+CONFIG_SYSVIPC_SYSCTL=3Dy
+# CONFIG_POSIX_MQUEUE is not set
+# CONFIG_BSD_PROCESS_ACCT is not set
+# CONFIG_TASKSTATS is not set
+# CONFIG_AUDIT is not set
+
+#
+# RCU Subsystem
+#
+# CONFIG_CLASSIC_RCU is not set
+CONFIG_TREE_RCU=3Dy
+# CONFIG_PREEMPT_RCU is not set
+# CONFIG_RCU_TRACE is not set
+CONFIG_RCU_FANOUT=3D32
+# CONFIG_RCU_FANOUT_EXACT is not set
+# CONFIG_TREE_RCU_TRACE is not set
+# CONFIG_PREEMPT_RCU_TRACE is not set
+# CONFIG_IKCONFIG is not set
+CONFIG_LOG_BUF_SHIFT=3D18
+CONFIG_HAVE_UNSTABLE_SCHED_CLOCK=3Dy
+# CONFIG_GROUP_SCHED is not set
+# CONFIG_CGROUPS is not set
+# CONFIG_SYSFS_DEPRECATED_V2 is not set
+CONFIG_RELAY=3Dy
+CONFIG_NAMESPACES=3Dy
+# CONFIG_UTS_NS is not set
+# CONFIG_IPC_NS is not set
+# CONFIG_USER_NS is not set
+# CONFIG_PID_NS is not set
+# CONFIG_NET_NS is not set
+CONFIG_BLK_DEV_INITRD=3Dy
+CONFIG_INITRAMFS_SOURCE=3D""
+CONFIG_RD_GZIP=3Dy
+CONFIG_RD_BZIP2=3Dy
+CONFIG_RD_LZMA=3Dy
+CONFIG_CC_OPTIMIZE_FOR_SIZE=3Dy
+CONFIG_SYSCTL=3Dy
+CONFIG_ANON_INODES=3Dy
+CONFIG_EMBEDDED=3Dy
+CONFIG_UID16=3Dy
+CONFIG_SYSCTL_SYSCALL=3Dy
+CONFIG_KALLSYMS=3Dy
+CONFIG_KALLSYMS_EXTRA_PASS=3Dy
+CONFIG_HOTPLUG=3Dy
+CONFIG_PRINTK=3Dy
+CONFIG_BUG=3Dy
+CONFIG_ELF_CORE=3Dy
+CONFIG_PCSPKR_PLATFORM=3Dy
+CONFIG_BASE_FULL=3Dy
+CONFIG_FUTEX=3Dy
+CONFIG_EPOLL=3Dy
+CONFIG_SIGNALFD=3Dy
+CONFIG_TIMERFD=3Dy
+CONFIG_EVENTFD=3Dy
+CONFIG_SHMEM=3Dy
+CONFIG_AIO=3Dy
+CONFIG_HAVE_PERF_COUNTERS=3Dy
+
+#
+# Performance Counters
+#
+# CONFIG_PERF_COUNTERS is not set
+# CONFIG_VM_EVENT_COUNTERS is not set
+CONFIG_PCI_QUIRKS=3Dy
+# CONFIG_SLUB_DEBUG is not set
+# CONFIG_STRIP_ASM_SYMS is not set
+# CONFIG_COMPAT_BRK is not set
+# CONFIG_SLAB is not set
+CONFIG_SLUB=3Dy
+# CONFIG_SLOB is not set
+# CONFIG_PROFILING is not set
+CONFIG_TRACEPOINTS=3Dy
+CONFIG_MARKERS=3Dy
+CONFIG_HAVE_OPROFILE=3Dy
+# CONFIG_KPROBES is not set
+CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS=3Dy
+CONFIG_HAVE_IOREMAP_PROT=3Dy
+CONFIG_HAVE_KPROBES=3Dy
+CONFIG_HAVE_KRETPROBES=3Dy
+CONFIG_HAVE_ARCH_TRACEHOOK=3Dy
+CONFIG_HAVE_DMA_ATTRS=3Dy
+CONFIG_HAVE_DMA_API_DEBUG=3Dy
+
+#
+# GCOV-based kernel profiling
+#
+# CONFIG_GCOV_KERNEL is not set
+# CONFIG_SLOW_WORK is not set
+CONFIG_HAVE_GENERIC_DMA_COHERENT=3Dy
+CONFIG_RT_MUTEXES=3Dy
+CONFIG_BASE_SMALL=3D0
+CONFIG_MODULES=3Dy
+CONFIG_MODULE_FORCE_LOAD=3Dy
+CONFIG_MODULE_UNLOAD=3Dy
+CONFIG_MODULE_FORCE_UNLOAD=3Dy
+# CONFIG_MODVERSIONS is not set
+# CONFIG_MODULE_SRCVERSION_ALL is not set
+CONFIG_BLOCK=3Dy
+# CONFIG_LBDAF is not set
+# CONFIG_BLK_DEV_BSG is not set
+# CONFIG_BLK_DEV_INTEGRITY is not set
+
+#
+# IO Schedulers
+#
+CONFIG_IOSCHED_NOOP=3Dy
+CONFIG_IOSCHED_AS=3Dy
+CONFIG_IOSCHED_DEADLINE=3Dy
+CONFIG_IOSCHED_CFQ=3Dy
+# CONFIG_DEFAULT_AS is not set
+# CONFIG_DEFAULT_DEADLINE is not set
+CONFIG_DEFAULT_CFQ=3Dy
+# CONFIG_DEFAULT_NOOP is not set
+CONFIG_DEFAULT_IOSCHED=3D"cfq"
+# CONFIG_FREEZER is not set
+
+#
+# Processor type and features
+#
+CONFIG_TICK_ONESHOT=3Dy
+CONFIG_NO_HZ=3Dy
+# CONFIG_HIGH_RES_TIMERS is not set
+CONFIG_GENERIC_CLOCKEVENTS_BUILD=3Dy
+# CONFIG_SMP is not set
+# CONFIG_X86_EXTENDED_PLATFORM is not set
+# CONFIG_SCHED_OMIT_FRAME_POINTER is not set
+# CONFIG_PARAVIRT_GUEST is not set
+# CONFIG_MEMTEST is not set
+# CONFIG_M386 is not set
+# CONFIG_M486 is not set
+# CONFIG_M586 is not set
+# CONFIG_M586TSC is not set
+# CONFIG_M586MMX is not set
+# CONFIG_M686 is not set
+# CONFIG_MPENTIUMII is not set
+# CONFIG_MPENTIUMIII is not set
+# CONFIG_MPENTIUMM is not set
+# CONFIG_MPENTIUM4 is not set
+# CONFIG_MK6 is not set
+# CONFIG_MK7 is not set
+# CONFIG_MK8 is not set
+# CONFIG_MCRUSOE is not set
+# CONFIG_MEFFICEON is not set
+# CONFIG_MWINCHIPC6 is not set
+# CONFIG_MWINCHIP3D is not set
+# CONFIG_MGEODEGX1 is not set
+CONFIG_MGEODE_LX=3Dy
+# CONFIG_MCYRIXIII is not set
+# CONFIG_MVIAC3_2 is not set
+# CONFIG_MVIAC7 is not set
+# CONFIG_MPSC is not set
+# CONFIG_MCORE2 is not set
+# CONFIG_GENERIC_CPU is not set
+CONFIG_X86_GENERIC=3Dy
+CONFIG_X86_CPU=3Dy
+CONFIG_X86_L1_CACHE_BYTES=3D64
+CONFIG_X86_INTERNODE_CACHE_BYTES=3D64
+CONFIG_X86_CMPXCHG=3Dy
+CONFIG_X86_L1_CACHE_SHIFT=3D5
+CONFIG_X86_XADD=3Dy
+CONFIG_X86_WP_WORKS_OK=3Dy
+CONFIG_X86_INVLPG=3Dy
+CONFIG_X86_BSWAP=3Dy
+CONFIG_X86_POPAD_OK=3Dy
+CONFIG_X86_INTEL_USERCOPY=3Dy
+CONFIG_X86_USE_PPRO_CHECKSUM=3Dy
+CONFIG_X86_USE_3DNOW=3Dy
+CONFIG_X86_TSC=3Dy
+CONFIG_X86_MINIMUM_CPU_FAMILY=3D4
+CONFIG_X86_DEBUGCTLMSR=3Dy
+CONFIG_PROCESSOR_SELECT=3Dy
+# CONFIG_CPU_SUP_INTEL is not set
+# CONFIG_CPU_SUP_CYRIX_32 is not set
+CONFIG_CPU_SUP_AMD=3Dy
+# CONFIG_CPU_SUP_CENTAUR is not set
+# CONFIG_CPU_SUP_TRANSMETA_32 is not set
+# CONFIG_CPU_SUP_UMC_32 is not set
+# CONFIG_X86_DS is not set
+# CONFIG_HPET_TIMER is not set
+CONFIG_DMI=3Dy
+# CONFIG_IOMMU_HELPER is not set
+# CONFIG_IOMMU_API is not set
+CONFIG_NR_CPUS=3D1
+# CONFIG_PREEMPT_NONE is not set
+CONFIG_PREEMPT_VOLUNTARY=3Dy
+# CONFIG_PREEMPT is not set
+# CONFIG_X86_UP_APIC is not set
+CONFIG_X86_MCE=3Dy
+# CONFIG_X86_OLD_MCE is not set
+CONFIG_X86_NEW_MCE=3Dy
+# CONFIG_X86_ANCIENT_MCE is not set
+# CONFIG_X86_MCE_INJECT is not set
+# CONFIG_VM86 is not set
+# CONFIG_TOSHIBA is not set
+# CONFIG_I8K is not set
+CONFIG_X86_REBOOTFIXUPS=3Dy
+CONFIG_MICROCODE=3Dy
+CONFIG_MICROCODE_INTEL=3Dy
+# CONFIG_MICROCODE_AMD is not set
+CONFIG_MICROCODE_OLD_INTERFACE=3Dy
+CONFIG_X86_MSR=3Dy
+CONFIG_X86_CPUID=3Dy
+# CONFIG_X86_CPU_DEBUG is not set
+CONFIG_NOHIGHMEM=3Dy
+# CONFIG_HIGHMEM4G is not set
+# CONFIG_HIGHMEM64G is not set
+# CONFIG_VMSPLIT_3G is not set
+# CONFIG_VMSPLIT_3G_OPT is not set
+# CONFIG_VMSPLIT_2G is not set
+# CONFIG_VMSPLIT_2G_OPT is not set
+CONFIG_VMSPLIT_1G=3Dy
+CONFIG_PAGE_OFFSET=3D0x40000000
+# CONFIG_X86_PAE is not set
+# CONFIG_ARCH_PHYS_ADDR_T_64BIT is not set
+CONFIG_ARCH_FLATMEM_ENABLE=3Dy
+CONFIG_ARCH_SPARSEMEM_ENABLE=3Dy
+CONFIG_ARCH_SELECT_MEMORY_MODEL=3Dy
+CONFIG_SELECT_MEMORY_MODEL=3Dy
+CONFIG_FLATMEM_MANUAL=3Dy
+# CONFIG_DISCONTIGMEM_MANUAL is not set
+# CONFIG_SPARSEMEM_MANUAL is not set
+CONFIG_FLATMEM=3Dy
+CONFIG_FLAT_NODE_MEM_MAP=3Dy
+CONFIG_SPARSEMEM_STATIC=3Dy
+CONFIG_PAGEFLAGS_EXTENDED=3Dy
+CONFIG_SPLIT_PTLOCK_CPUS=3D4
+# CONFIG_PHYS_ADDR_T_64BIT is not set
+CONFIG_ZONE_DMA_FLAG=3D1
+CONFIG_BOUNCE=3Dy
+CONFIG_VIRT_TO_BUS=3Dy
+CONFIG_HAVE_MLOCK=3Dy
+CONFIG_HAVE_MLOCKED_PAGE_BIT=3Dy
+CONFIG_DEFAULT_MMAP_MIN_ADDR=3D4096
+# CONFIG_X86_CHECK_BIOS_CORRUPTION is not set
+CONFIG_X86_RESERVE_LOW_64K=3Dy
+# CONFIG_MATH_EMULATION is not set
+# CONFIG_MTRR is not set
+# CONFIG_SECCOMP is not set
+# CONFIG_CC_STACKPROTECTOR is not set
+# CONFIG_HZ_100 is not set
+# CONFIG_HZ_250 is not set
+# CONFIG_HZ_300 is not set
+CONFIG_HZ_1000=3Dy
+CONFIG_HZ=3D1000
+# CONFIG_SCHED_HRTICK is not set
+# CONFIG_KEXEC is not set
+CONFIG_PHYSICAL_START=3D0x1000000
+# CONFIG_RELOCATABLE is not set
+CONFIG_PHYSICAL_ALIGN=3D0x1000000
+# CONFIG_COMPAT_VDSO is not set
+# CONFIG_CMDLINE_BOOL is not set
+
+#
+# Power management and ACPI options
+#
+# CONFIG_PM is not set
+
+#
+# CPU Frequency scaling
+#
+# CONFIG_CPU_FREQ is not set
+# CONFIG_CPU_IDLE is not set
+
+#
+# Bus options (PCI etc.)
+#
+CONFIG_PCI=3Dy
+# CONFIG_PCI_GOBIOS is not set
+# CONFIG_PCI_GOMMCONFIG is not set
+# CONFIG_PCI_GODIRECT is not set
+# CONFIG_PCI_GOOLPC is not set
+CONFIG_PCI_GOANY=3Dy
+CONFIG_PCI_BIOS=3Dy
+CONFIG_PCI_DIRECT=3Dy
+CONFIG_PCI_DOMAINS=3Dy
+CONFIG_PCIEPORTBUS=3Dy
+CONFIG_PCIEAER=3Dy
+# CONFIG_PCIE_ECRC is not set
+# CONFIG_PCIEAER_INJECT is not set
+# CONFIG_PCIEASPM is not set
+# CONFIG_ARCH_SUPPORTS_MSI is not set
+# CONFIG_PCI_LEGACY is not set
+# CONFIG_PCI_STUB is not set
+# CONFIG_PCI_IOV is not set
+CONFIG_ISA_DMA_API=3Dy
+# CONFIG_ISA is not set
+# CONFIG_MCA is not set
+# CONFIG_SCx200 is not set
+# CONFIG_GEODE_MFGPT_TIMER is not set
+# CONFIG_OLPC is not set
+# CONFIG_PCCARD is not set
+# CONFIG_HOTPLUG_PCI is not set
+
+#
+# Executable file formats / Emulations
+#
+CONFIG_BINFMT_ELF=3Dy
+CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS=3Dy
+CONFIG_HAVE_AOUT=3Dy
+# CONFIG_BINFMT_AOUT is not set
+CONFIG_BINFMT_MISC=3Dy
+CONFIG_HAVE_ATOMIC_IOMAP=3Dy
+CONFIG_NET=3Dy
+
+#
+# Networking options
+#
+CONFIG_PACKET=3Dy
+CONFIG_PACKET_MMAP=3Dy
+CONFIG_UNIX=3Dy
+# CONFIG_NET_KEY is not set
+CONFIG_INET=3Dy
+# CONFIG_IP_MULTICAST is not set
+# CONFIG_IP_ADVANCED_ROUTER is not set
+CONFIG_IP_FIB_HASH=3Dy
+CONFIG_IP_PNP=3Dy
+CONFIG_IP_PNP_DHCP=3Dy
+# CONFIG_IP_PNP_BOOTP is not set
+# CONFIG_IP_PNP_RARP is not set
+# CONFIG_NET_IPIP is not set
+# CONFIG_NET_IPGRE is not set
+# CONFIG_ARPD is not set
+# CONFIG_SYN_COOKIES is not set
+# CONFIG_INET_AH is not set
+# CONFIG_INET_ESP is not set
+# CONFIG_INET_IPCOMP is not set
+# CONFIG_INET_XFRM_TUNNEL is not set
+# CONFIG_INET_TUNNEL is not set
+# CONFIG_INET_XFRM_MODE_TRANSPORT is not set
+# CONFIG_INET_XFRM_MODE_TUNNEL is not set
+# CONFIG_INET_XFRM_MODE_BEET is not set
+# CONFIG_INET_LRO is not set
+# CONFIG_INET_DIAG is not set
+CONFIG_TCP_CONG_ADVANCED=3Dy
+CONFIG_TCP_CONG_BIC=3Dm
+CONFIG_TCP_CONG_CUBIC=3Dy
+CONFIG_TCP_CONG_WESTWOOD=3Dm
+CONFIG_TCP_CONG_HTCP=3Dm
+# CONFIG_TCP_CONG_HSTCP is not set
+# CONFIG_TCP_CONG_HYBLA is not set
+# CONFIG_TCP_CONG_VEGAS is not set
+# CONFIG_TCP_CONG_SCALABLE is not set
+# CONFIG_TCP_CONG_LP is not set
+# CONFIG_TCP_CONG_VENO is not set
+# CONFIG_TCP_CONG_YEAH is not set
+# CONFIG_TCP_CONG_ILLINOIS is not set
+# CONFIG_DEFAULT_BIC is not set
+CONFIG_DEFAULT_CUBIC=3Dy
+# CONFIG_DEFAULT_HTCP is not set
+# CONFIG_DEFAULT_VEGAS is not set
+# CONFIG_DEFAULT_WESTWOOD is not set
+# CONFIG_DEFAULT_RENO is not set
+CONFIG_DEFAULT_TCP_CONG=3D"cubic"
+# CONFIG_TCP_MD5SIG is not set
+# CONFIG_IPV6 is not set
+# CONFIG_NETWORK_SECMARK is not set
+# CONFIG_NETFILTER is not set
+# CONFIG_IP_DCCP is not set
+# CONFIG_IP_SCTP is not set
+# CONFIG_TIPC is not set
+# CONFIG_ATM is not set
+# CONFIG_BRIDGE is not set
+# CONFIG_NET_DSA is not set
+# CONFIG_VLAN_8021Q is not set
+# CONFIG_DECNET is not set
+# CONFIG_LLC2 is not set
+# CONFIG_IPX is not set
+# CONFIG_ATALK is not set
+# CONFIG_X25 is not set
+# CONFIG_LAPB is not set
+# CONFIG_ECONET is not set
+# CONFIG_WAN_ROUTER is not set
+# CONFIG_PHONET is not set
+# CONFIG_IEEE802154 is not set
+# CONFIG_NET_SCHED is not set
+# CONFIG_DCB is not set
+
+#
+# Network testing
+#
+# CONFIG_NET_PKTGEN is not set
+# CONFIG_NET_DROP_MONITOR is not set
+# CONFIG_HAMRADIO is not set
+# CONFIG_CAN is not set
+# CONFIG_IRDA is not set
+# CONFIG_BT is not set
+# CONFIG_AF_RXRPC is not set
+# CONFIG_WIRELESS is not set
+# CONFIG_WIMAX is not set
+# CONFIG_RFKILL is not set
+# CONFIG_NET_9P is not set
+
+#
+# Device Drivers
+#
+
+#
+# Generic Driver Options
+#
+CONFIG_UEVENT_HELPER_PATH=3D"/sbin/hotplug"
+CONFIG_STANDALONE=3Dy
+CONFIG_PREVENT_FIRMWARE_BUILD=3Dy
+CONFIG_FW_LOADER=3Dy
+CONFIG_FIRMWARE_IN_KERNEL=3Dy
+CONFIG_EXTRA_FIRMWARE=3D""
+# CONFIG_SYS_HYPERVISOR is not set
+# CONFIG_CONNECTOR is not set
+# CONFIG_MTD is not set
+# CONFIG_PARPORT is not set
+CONFIG_BLK_DEV=3Dy
+# CONFIG_BLK_DEV_FD is not set
+# CONFIG_BLK_CPQ_DA is not set
+# CONFIG_BLK_CPQ_CISS_DA is not set
+# CONFIG_BLK_DEV_DAC960 is not set
+# CONFIG_BLK_DEV_UMEM is not set
+# CONFIG_BLK_DEV_COW_COMMON is not set
+CONFIG_BLK_DEV_LOOP=3Dy
+# CONFIG_BLK_DEV_CRYPTOLOOP is not set
+# CONFIG_BLK_DEV_NBD is not set
+# CONFIG_BLK_DEV_SX8 is not set
+# CONFIG_BLK_DEV_UB is not set
+CONFIG_BLK_DEV_RAM=3Dy
+CONFIG_BLK_DEV_RAM_COUNT=3D16
+CONFIG_BLK_DEV_RAM_SIZE=3D16384
+# CONFIG_BLK_DEV_XIP is not set
+# CONFIG_CDROM_PKTCDVD is not set
+# CONFIG_ATA_OVER_ETH is not set
+# CONFIG_BLK_DEV_HD is not set
+# CONFIG_MISC_DEVICES is not set
+CONFIG_HAVE_IDE=3Dy
+CONFIG_IDE=3Dy
+
+#
+# Please see Documentation/ide/ide.txt for help/info on IDE drives
+#
+CONFIG_IDE_XFER_MODE=3Dy
+# CONFIG_BLK_DEV_IDE_SATA is not set
+CONFIG_IDE_GD=3Dy
+CONFIG_IDE_GD_ATA=3Dy
+# CONFIG_IDE_GD_ATAPI is not set
+# CONFIG_BLK_DEV_IDECD is not set
+# CONFIG_BLK_DEV_IDETAPE is not set
+# CONFIG_IDE_TASK_IOCTL is not set
+# CONFIG_IDE_PROC_FS is not set
+
+#
+# IDE chipset support/bugfixes
+#
+CONFIG_IDE_GENERIC=3Dy
+CONFIG_BLK_DEV_PLATFORM=3Dy
+# CONFIG_BLK_DEV_CMD640 is not set
+CONFIG_BLK_DEV_IDEDMA_SFF=3Dy
+
+#
+# PCI IDE chipsets support
+#
+CONFIG_BLK_DEV_IDEPCI=3Dy
+# CONFIG_IDEPCI_PCIBUS_ORDER is not set
+# CONFIG_BLK_DEV_GENERIC is not set
+# CONFIG_BLK_DEV_OPTI621 is not set
+# CONFIG_BLK_DEV_RZ1000 is not set
+CONFIG_BLK_DEV_IDEDMA_PCI=3Dy
+# CONFIG_BLK_DEV_AEC62XX is not set
+# CONFIG_BLK_DEV_ALI15X3 is not set
+# CONFIG_BLK_DEV_AMD74XX is not set
+# CONFIG_BLK_DEV_ATIIXP is not set
+# CONFIG_BLK_DEV_CMD64X is not set
+# CONFIG_BLK_DEV_TRIFLEX is not set
+# CONFIG_BLK_DEV_CS5520 is not set
+# CONFIG_BLK_DEV_CS5530 is not set
+# CONFIG_BLK_DEV_CS5535 is not set
+CONFIG_BLK_DEV_CS5536=3Dy
+# CONFIG_BLK_DEV_HPT366 is not set
+# CONFIG_BLK_DEV_JMICRON is not set
+# CONFIG_BLK_DEV_SC1200 is not set
+# CONFIG_BLK_DEV_PIIX is not set
+# CONFIG_BLK_DEV_IT8172 is not set
+# CONFIG_BLK_DEV_IT8213 is not set
+# CONFIG_BLK_DEV_IT821X is not set
+# CONFIG_BLK_DEV_NS87415 is not set
+# CONFIG_BLK_DEV_PDC202XX_OLD is not set
+# CONFIG_BLK_DEV_PDC202XX_NEW is not set
+# CONFIG_BLK_DEV_SVWKS is not set
+# CONFIG_BLK_DEV_SIIMAGE is not set
+# CONFIG_BLK_DEV_SIS5513 is not set
+# CONFIG_BLK_DEV_SLC90E66 is not set
+# CONFIG_BLK_DEV_TRM290 is not set
+# CONFIG_BLK_DEV_VIA82CXXX is not set
+# CONFIG_BLK_DEV_TC86C001 is not set
+CONFIG_BLK_DEV_IDEDMA=3Dy
+
+#
+# SCSI device support
+#
+# CONFIG_RAID_ATTRS is not set
+CONFIG_SCSI=3Dy
+CONFIG_SCSI_DMA=3Dy
+# CONFIG_SCSI_TGT is not set
+# CONFIG_SCSI_NETLINK is not set
+# CONFIG_SCSI_PROC_FS is not set
+
+#
+# SCSI support type (disk, tape, CD-ROM)
+#
+# CONFIG_BLK_DEV_SD is not set
+# CONFIG_CHR_DEV_ST is not set
+# CONFIG_CHR_DEV_OSST is not set
+# CONFIG_BLK_DEV_SR is not set
+# CONFIG_CHR_DEV_SG is not set
+# CONFIG_CHR_DEV_SCH is not set
+# CONFIG_SCSI_MULTI_LUN is not set
+# CONFIG_SCSI_CONSTANTS is not set
+# CONFIG_SCSI_LOGGING is not set
+# CONFIG_SCSI_SCAN_ASYNC is not set
+CONFIG_SCSI_WAIT_SCAN=3Dm
+
+#
+# SCSI Transports
+#
+# CONFIG_SCSI_SPI_ATTRS is not set
+# CONFIG_SCSI_FC_ATTRS is not set
+# CONFIG_SCSI_ISCSI_ATTRS is not set
+# CONFIG_SCSI_SAS_LIBSAS is not set
+# CONFIG_SCSI_SRP_ATTRS is not set
+# CONFIG_SCSI_LOWLEVEL is not set
+# CONFIG_SCSI_DH is not set
+# CONFIG_SCSI_OSD_INITIATOR is not set
+# CONFIG_ATA is not set
+CONFIG_MD=3Dy
+# CONFIG_BLK_DEV_MD is not set
+# CONFIG_BLK_DEV_DM is not set
+# CONFIG_FUSION is not set
+
+#
+# IEEE 1394 (FireWire) support
+#
+
+#
+# You can enable one or both FireWire driver stacks.
+#
+
+#
+# See the help texts for more information.
+#
+# CONFIG_FIREWIRE is not set
+# CONFIG_IEEE1394 is not set
+# CONFIG_I2O is not set
+# CONFIG_MACINTOSH_DRIVERS is not set
+CONFIG_NETDEVICES=3Dy
+# CONFIG_DUMMY is not set
+# CONFIG_BONDING is not set
+# CONFIG_MACVLAN is not set
+# CONFIG_EQUALIZER is not set
+# CONFIG_TUN is not set
+# CONFIG_VETH is not set
+# CONFIG_ARCNET is not set
+CONFIG_PHYLIB=3Dy
+
+#
+# MII PHY device drivers
+#
+# CONFIG_MARVELL_PHY is not set
+# CONFIG_DAVICOM_PHY is not set
+# CONFIG_QSEMI_PHY is not set
+# CONFIG_LXT_PHY is not set
+# CONFIG_CICADA_PHY is not set
+# CONFIG_VITESSE_PHY is not set
+# CONFIG_SMSC_PHY is not set
+# CONFIG_BROADCOM_PHY is not set
+# CONFIG_ICPLUS_PHY is not set
+CONFIG_REALTEK_PHY=3Dy
+# CONFIG_NATIONAL_PHY is not set
+# CONFIG_STE10XP is not set
+# CONFIG_LSI_ET1011C_PHY is not set
+# CONFIG_FIXED_PHY is not set
+# CONFIG_MDIO_BITBANG is not set
+CONFIG_NET_ETHERNET=3Dy
+CONFIG_MII=3Dy
+# CONFIG_HAPPYMEAL is not set
+# CONFIG_SUNGEM is not set
+# CONFIG_CASSINI is not set
+# CONFIG_NET_VENDOR_3COM is not set
+# CONFIG_ETHOC is not set
+# CONFIG_DNET is not set
+# CONFIG_NET_TULIP is not set
+# CONFIG_HP100 is not set
+# CONFIG_IBM_NEW_EMAC_ZMII is not set
+# CONFIG_IBM_NEW_EMAC_RGMII is not set
+# CONFIG_IBM_NEW_EMAC_TAH is not set
+# CONFIG_IBM_NEW_EMAC_EMAC4 is not set
+# CONFIG_IBM_NEW_EMAC_NO_FLOW_CTRL is not set
+# CONFIG_IBM_NEW_EMAC_MAL_CLR_ICINTSTAT is not set
+# CONFIG_IBM_NEW_EMAC_MAL_COMMON_ERR is not set
+CONFIG_NET_PCI=3Dy
+# CONFIG_PCNET32 is not set
+# CONFIG_AMD8111_ETH is not set
+# CONFIG_ADAPTEC_STARFIRE is not set
+# CONFIG_B44 is not set
+# CONFIG_FORCEDETH is not set
+# CONFIG_E100 is not set
+# CONFIG_FEALNX is not set
+# CONFIG_NATSEMI is not set
+# CONFIG_NE2K_PCI is not set
+# CONFIG_8139CP is not set
+CONFIG_8139TOO=3Dy
+# CONFIG_8139TOO_PIO is not set
+# CONFIG_8139TOO_TUNE_TWISTER is not set
+# CONFIG_8139TOO_8129 is not set
+# CONFIG_8139_OLD_RX_RESET is not set
+# CONFIG_R6040 is not set
+# CONFIG_SIS900 is not set
+# CONFIG_EPIC100 is not set
+# CONFIG_SMSC9420 is not set
+# CONFIG_SUNDANCE is not set
+# CONFIG_TLAN is not set
+# CONFIG_KS8842 is not set
+# CONFIG_VIA_RHINE is not set
+# CONFIG_SC92031 is not set
+# CONFIG_ATL2 is not set
+# CONFIG_NETDEV_1000 is not set
+# CONFIG_NETDEV_10000 is not set
+# CONFIG_TR is not set
+
+#
+# Wireless LAN
+#
+# CONFIG_WLAN_PRE80211 is not set
+CONFIG_WLAN_80211=3Dy
+# CONFIG_LIBERTAS is not set
+# CONFIG_AIRO is not set
+# CONFIG_ATMEL is not set
+# CONFIG_PRISM54 is not set
+# CONFIG_USB_ZD1201 is not set
+# CONFIG_IPW2100 is not set
+# CONFIG_IPW2200 is not set
+# CONFIG_HOSTAP is not set
+# CONFIG_HERMES is not set
+
+#
+# Enable WiMAX (Networking options) to see the WiMAX drivers
+#
+
+#
+# USB Network Adapters
+#
+# CONFIG_USB_CATC is not set
+# CONFIG_USB_KAWETH is not set
+# CONFIG_USB_PEGASUS is not set
+# CONFIG_USB_RTL8150 is not set
+# CONFIG_USB_USBNET is not set
+# CONFIG_WAN is not set
+# CONFIG_FDDI is not set
+# CONFIG_HIPPI is not set
+# CONFIG_PPP is not set
+# CONFIG_SLIP is not set
+# CONFIG_NET_FC is not set
+# CONFIG_NETCONSOLE is not set
+# CONFIG_NETPOLL is not set
+# CONFIG_NET_POLL_CONTROLLER is not set
+# CONFIG_ISDN is not set
+# CONFIG_PHONE is not set
+
+#
+# Input device support
+#
+CONFIG_INPUT=3Dy
+CONFIG_INPUT_FF_MEMLESS=3Dy
+CONFIG_INPUT_POLLDEV=3Dy
+
+#
+# Userland interfaces
+#
+CONFIG_INPUT_MOUSEDEV=3Dy
+# CONFIG_INPUT_MOUSEDEV_PSAUX is not set
+CONFIG_INPUT_MOUSEDEV_SCREEN_X=3D1024
+CONFIG_INPUT_MOUSEDEV_SCREEN_Y=3D768
+# CONFIG_INPUT_JOYDEV is not set
+CONFIG_INPUT_EVDEV=3Dy
+# CONFIG_INPUT_EVBUG is not set
+
+#
+# Input Device Drivers
+#
+CONFIG_INPUT_KEYBOARD=3Dy
+CONFIG_KEYBOARD_ATKBD=3Dy
+# CONFIG_KEYBOARD_LKKBD is not set
+# CONFIG_KEYBOARD_NEWTON is not set
+# CONFIG_KEYBOARD_STOWAWAY is not set
+# CONFIG_KEYBOARD_SUNKBD is not set
+# CONFIG_KEYBOARD_XTKBD is not set
+CONFIG_INPUT_MOUSE=3Dy
+CONFIG_MOUSE_PS2=3Dy
+CONFIG_MOUSE_PS2_ALPS=3Dy
+CONFIG_MOUSE_PS2_LOGIPS2PP=3Dy
+CONFIG_MOUSE_PS2_SYNAPTICS=3Dy
+CONFIG_MOUSE_PS2_LIFEBOOK=3Dy
+CONFIG_MOUSE_PS2_TRACKPOINT=3Dy
+# CONFIG_MOUSE_PS2_ELANTECH is not set
+# CONFIG_MOUSE_PS2_TOUCHKIT is not set
+# CONFIG_MOUSE_SERIAL is not set
+# CONFIG_MOUSE_APPLETOUCH is not set
+# CONFIG_MOUSE_BCM5974 is not set
+# CONFIG_MOUSE_VSXXXAA is not set
+CONFIG_INPUT_JOYSTICK=3Dy
+# CONFIG_JOYSTICK_ANALOG is not set
+# CONFIG_JOYSTICK_A3D is not set
+# CONFIG_JOYSTICK_ADI is not set
+# CONFIG_JOYSTICK_COBRA is not set
+# CONFIG_JOYSTICK_GF2K is not set
+# CONFIG_JOYSTICK_GRIP is not set
+# CONFIG_JOYSTICK_GRIP_MP is not set
+# CONFIG_JOYSTICK_GUILLEMOT is not set
+# CONFIG_JOYSTICK_INTERACT is not set
+# CONFIG_JOYSTICK_SIDEWINDER is not set
+# CONFIG_JOYSTICK_TMDC is not set
+# CONFIG_JOYSTICK_IFORCE is not set
+# CONFIG_JOYSTICK_WARRIOR is not set
+# CONFIG_JOYSTICK_MAGELLAN is not set
+# CONFIG_JOYSTICK_SPACEORB is not set
+# CONFIG_JOYSTICK_SPACEBALL is not set
+# CONFIG_JOYSTICK_STINGER is not set
+# CONFIG_JOYSTICK_TWIDJOY is not set
+# CONFIG_JOYSTICK_ZHENHUA is not set
+# CONFIG_JOYSTICK_JOYDUMP is not set
+# CONFIG_JOYSTICK_XPAD is not set
+CONFIG_INPUT_TABLET=3Dy
+# CONFIG_TABLET_USB_ACECAD is not set
+# CONFIG_TABLET_USB_AIPTEK is not set
+# CONFIG_TABLET_USB_GTCO is not set
+# CONFIG_TABLET_USB_KBTAB is not set
+# CONFIG_TABLET_USB_WACOM is not set
+CONFIG_INPUT_TOUCHSCREEN=3Dy
+# CONFIG_TOUCHSCREEN_AD7879 is not set
+# CONFIG_TOUCHSCREEN_FUJITSU is not set
+# CONFIG_TOUCHSCREEN_GUNZE is not set
+# CONFIG_TOUCHSCREEN_ELO is not set
+# CONFIG_TOUCHSCREEN_WACOM_W8001 is not set
+# CONFIG_TOUCHSCREEN_MTOUCH is not set
+# CONFIG_TOUCHSCREEN_INEXIO is not set
+# CONFIG_TOUCHSCREEN_MK712 is not set
+# CONFIG_TOUCHSCREEN_PENMOUNT is not set
+# CONFIG_TOUCHSCREEN_TOUCHRIGHT is not set
+# CONFIG_TOUCHSCREEN_TOUCHWIN is not set
+# CONFIG_TOUCHSCREEN_WM97XX is not set
+# CONFIG_TOUCHSCREEN_USB_COMPOSITE is not set
+# CONFIG_TOUCHSCREEN_TOUCHIT213 is not set
+# CONFIG_TOUCHSCREEN_W90X900 is not set
+CONFIG_INPUT_MISC=3Dy
+# CONFIG_INPUT_PCSPKR is not set
+# CONFIG_INPUT_WISTRON_BTNS is not set
+# CONFIG_INPUT_ATI_REMOTE is not set
+# CONFIG_INPUT_ATI_REMOTE2 is not set
+# CONFIG_INPUT_KEYSPAN_REMOTE is not set
+# CONFIG_INPUT_POWERMATE is not set
+# CONFIG_INPUT_YEALINK is not set
+# CONFIG_INPUT_CM109 is not set
+# CONFIG_INPUT_UINPUT is not set
+
+#
+# Hardware I/O ports
+#
+CONFIG_SERIO=3Dy
+CONFIG_SERIO_I8042=3Dy
+CONFIG_SERIO_SERPORT=3Dy
+# CONFIG_SERIO_CT82C710 is not set
+# CONFIG_SERIO_PCIPS2 is not set
+CONFIG_SERIO_LIBPS2=3Dy
+# CONFIG_SERIO_RAW is not set
+# CONFIG_GAMEPORT is not set
+
+#
+# Character devices
+#
+CONFIG_VT=3Dy
+CONFIG_CONSOLE_TRANSLATIONS=3Dy
+CONFIG_VT_CONSOLE=3Dy
+CONFIG_HW_CONSOLE=3Dy
+CONFIG_VT_HW_CONSOLE_BINDING=3Dy
+CONFIG_DEVKMEM=3Dy
+CONFIG_SERIAL_NONSTANDARD=3Dy
+# CONFIG_COMPUTONE is not set
+# CONFIG_ROCKETPORT is not set
+# CONFIG_CYCLADES is not set
+# CONFIG_DIGIEPCA is not set
+# CONFIG_MOXA_INTELLIO is not set
+# CONFIG_MOXA_SMARTIO is not set
+# CONFIG_ISI is not set
+# CONFIG_SYNCLINK is not set
+# CONFIG_SYNCLINKMP is not set
+# CONFIG_SYNCLINK_GT is not set
+# CONFIG_N_HDLC is not set
+# CONFIG_RISCOM8 is not set
+# CONFIG_SPECIALIX is not set
+# CONFIG_SX is not set
+# CONFIG_RIO is not set
+# CONFIG_STALDRV is not set
+# CONFIG_NOZOMI is not set
+
+#
+# Serial drivers
+#
+CONFIG_SERIAL_8250=3Dy
+CONFIG_SERIAL_8250_CONSOLE=3Dy
+CONFIG_FIX_EARLYCON_MEM=3Dy
+CONFIG_SERIAL_8250_PCI=3Dy
+CONFIG_SERIAL_8250_NR_UARTS=3D32
+CONFIG_SERIAL_8250_RUNTIME_UARTS=3D4
+CONFIG_SERIAL_8250_EXTENDED=3Dy
+CONFIG_SERIAL_8250_MANY_PORTS=3Dy
+CONFIG_SERIAL_8250_SHARE_IRQ=3Dy
+CONFIG_SERIAL_8250_DETECT_IRQ=3Dy
+CONFIG_SERIAL_8250_RSA=3Dy
+
+#
+# Non-8250 serial port support
+#
+CONFIG_SERIAL_CORE=3Dy
+CONFIG_SERIAL_CORE_CONSOLE=3Dy
+# CONFIG_SERIAL_JSM is not set
+CONFIG_UNIX98_PTYS=3Dy
+# CONFIG_DEVPTS_MULTIPLE_INSTANCES is not set
+# CONFIG_LEGACY_PTYS is not set
+# CONFIG_IPMI_HANDLER is not set
+CONFIG_HW_RANDOM=3Dy
+# CONFIG_HW_RANDOM_TIMERIOMEM is not set
+# CONFIG_HW_RANDOM_INTEL is not set
+# CONFIG_HW_RANDOM_AMD is not set
+CONFIG_HW_RANDOM_GEODE=3Dy
+# CONFIG_HW_RANDOM_VIA is not set
+# CONFIG_NVRAM is not set
+# CONFIG_R3964 is not set
+# CONFIG_APPLICOM is not set
+# CONFIG_SONYPI is not set
+# CONFIG_MWAVE is not set
+# CONFIG_PC8736x_GPIO is not set
+# CONFIG_NSC_GPIO is not set
+# CONFIG_CS5535_GPIO is not set
+# CONFIG_RAW_DRIVER is not set
+# CONFIG_HANGCHECK_TIMER is not set
+# CONFIG_TCG_TPM is not set
+# CONFIG_TELCLOCK is not set
+CONFIG_DEVPORT=3Dy
+# CONFIG_I2C is not set
+# CONFIG_SPI is not set
+
+#
+# PPS support
+#
+# CONFIG_PPS is not set
+CONFIG_ARCH_WANT_OPTIONAL_GPIOLIB=3Dy
+# CONFIG_GPIOLIB is not set
+# CONFIG_W1 is not set
+# CONFIG_POWER_SUPPLY is not set
+CONFIG_HWMON=3Dy
+CONFIG_HWMON_VID=3Dy
+# CONFIG_SENSORS_ABITUGURU is not set
+# CONFIG_SENSORS_ABITUGURU3 is not set
+# CONFIG_SENSORS_K8TEMP is not set
+# CONFIG_SENSORS_I5K_AMB is not set
+# CONFIG_SENSORS_F71805F is not set
+# CONFIG_SENSORS_F71882FG is not set
+# CONFIG_SENSORS_CORETEMP is not set
+# CONFIG_SENSORS_IT87 is not set
+# CONFIG_SENSORS_PC87360 is not set
+# CONFIG_SENSORS_PC87427 is not set
+# CONFIG_SENSORS_SIS5595 is not set
+# CONFIG_SENSORS_SMSC47M1 is not set
+# CONFIG_SENSORS_SMSC47B397 is not set
+# CONFIG_SENSORS_VIA686A is not set
+# CONFIG_SENSORS_VT1211 is not set
+# CONFIG_SENSORS_VT8231 is not set
+# CONFIG_SENSORS_W83627HF is not set
+CONFIG_SENSORS_W83627EHF=3Dy
+# CONFIG_SENSORS_HDAPS is not set
+# CONFIG_SENSORS_APPLESMC is not set
+# CONFIG_HWMON_DEBUG_CHIP is not set
+# CONFIG_THERMAL is not set
+# CONFIG_THERMAL_HWMON is not set
+CONFIG_WATCHDOG=3Dy
+# CONFIG_WATCHDOG_NOWAYOUT is not set
+
+#
+# Watchdog Device Drivers
+#
+# CONFIG_SOFT_WATCHDOG is not set
+# CONFIG_ACQUIRE_WDT is not set
+# CONFIG_ADVANTECH_WDT is not set
+# CONFIG_ALIM1535_WDT is not set
+# CONFIG_ALIM7101_WDT is not set
+# CONFIG_GEODE_WDT is not set
+# CONFIG_SC520_WDT is not set
+# CONFIG_EUROTECH_WDT is not set
+# CONFIG_IB700_WDT is not set
+# CONFIG_IBMASR is not set
+# CONFIG_WAFER_WDT is not set
+# CONFIG_I6300ESB_WDT is not set
+# CONFIG_ITCO_WDT is not set
+# CONFIG_IT8712F_WDT is not set
+# CONFIG_IT87_WDT is not set
+# CONFIG_HP_WATCHDOG is not set
+# CONFIG_SC1200_WDT is not set
+# CONFIG_PC87413_WDT is not set
+# CONFIG_60XX_WDT is not set
+# CONFIG_SBC8360_WDT is not set
+# CONFIG_SBC7240_WDT is not set
+# CONFIG_CPU5_WDT is not set
+# CONFIG_SMSC_SCH311X_WDT is not set
+# CONFIG_SMSC37B787_WDT is not set
+CONFIG_W83627HF_WDT=3Dy
+# CONFIG_W83697HF_WDT is not set
+# CONFIG_W83697UG_WDT is not set
+# CONFIG_W83877F_WDT is not set
+# CONFIG_W83977F_WDT is not set
+# CONFIG_MACHZ_WDT is not set
+# CONFIG_SBC_EPX_C3_WATCHDOG is not set
+
+#
+# PCI-based Watchdog Cards
+#
+# CONFIG_PCIPCWATCHDOG is not set
+# CONFIG_WDTPCI is not set
+
+#
+# USB-based Watchdog Cards
+#
+# CONFIG_USBPCWATCHDOG is not set
+CONFIG_SSB_POSSIBLE=3Dy
+
+#
+# Sonics Silicon Backplane
+#
+# CONFIG_SSB is not set
+
+#
+# Multifunction device drivers
+#
+# CONFIG_MFD_CORE is not set
+# CONFIG_MFD_SM501 is not set
+# CONFIG_HTC_PASIC3 is not set
+# CONFIG_MFD_TMIO is not set
+# CONFIG_REGULATOR is not set
+# CONFIG_MEDIA_SUPPORT is not set
+
+#
+# Graphics support
+#
+# CONFIG_AGP is not set
+# CONFIG_DRM is not set
+# CONFIG_VGASTATE is not set
+# CONFIG_VIDEO_OUTPUT_CONTROL is not set
+CONFIG_FB=3Dy
+# CONFIG_FIRMWARE_EDID is not set
+# CONFIG_FB_DDC is not set
+# CONFIG_FB_BOOT_VESA_SUPPORT is not set
+CONFIG_FB_CFB_FILLRECT=3Dy
+CONFIG_FB_CFB_COPYAREA=3Dy
+CONFIG_FB_CFB_IMAGEBLIT=3Dy
+# CONFIG_FB_CFB_REV_PIXELS_IN_BYTE is not set
+# CONFIG_FB_SYS_FILLRECT is not set
+# CONFIG_FB_SYS_COPYAREA is not set
+# CONFIG_FB_SYS_IMAGEBLIT is not set
+# CONFIG_FB_FOREIGN_ENDIAN is not set
+# CONFIG_FB_SYS_FOPS is not set
+# CONFIG_FB_SVGALIB is not set
+# CONFIG_FB_MACMODES is not set
+# CONFIG_FB_BACKLIGHT is not set
+CONFIG_FB_MODE_HELPERS=3Dy
+# CONFIG_FB_TILEBLITTING is not set
+
+#
+# Frame buffer hardware drivers
+#
+# CONFIG_FB_CIRRUS is not set
+# CONFIG_FB_PM2 is not set
+# CONFIG_FB_CYBER2000 is not set
+# CONFIG_FB_ARC is not set
+# CONFIG_FB_ASILIANT is not set
+# CONFIG_FB_IMSTT is not set
+# CONFIG_FB_VGA16 is not set
+# CONFIG_FB_VESA is not set
+# CONFIG_FB_N411 is not set
+# CONFIG_FB_HGA is not set
+# CONFIG_FB_S1D13XXX is not set
+# CONFIG_FB_NVIDIA is not set
+# CONFIG_FB_RIVA is not set
+# CONFIG_FB_LE80578 is not set
+# CONFIG_FB_MATROX is not set
+# CONFIG_FB_RADEON is not set
+# CONFIG_FB_ATY128 is not set
+# CONFIG_FB_ATY is not set
+# CONFIG_FB_S3 is not set
+# CONFIG_FB_SAVAGE is not set
+# CONFIG_FB_SIS is not set
+# CONFIG_FB_VIA is not set
+# CONFIG_FB_NEOMAGIC is not set
+# CONFIG_FB_KYRO is not set
+# CONFIG_FB_3DFX is not set
+# CONFIG_FB_VOODOO1 is not set
+# CONFIG_FB_VT8623 is not set
+# CONFIG_FB_TRIDENT is not set
+# CONFIG_FB_ARK is not set
+# CONFIG_FB_PM3 is not set
+# CONFIG_FB_CARMINE is not set
+CONFIG_FB_GEODE=3Dy
+# CONFIG_FB_GEODE_LX is not set
+CONFIG_FB_GEODE_GX=3Dy
+# CONFIG_FB_GEODE_GX1 is not set
+# CONFIG_FB_VIRTUAL is not set
+# CONFIG_FB_METRONOME is not set
+# CONFIG_FB_MB862XX is not set
+# CONFIG_FB_BROADSHEET is not set
+# CONFIG_BACKLIGHT_LCD_SUPPORT is not set
+
+#
+# Display device support
+#
+CONFIG_DISPLAY_SUPPORT=3Dy
+
+#
+# Display hardware drivers
+#
+
+#
+# Console display driver support
+#
+# CONFIG_VGA_CONSOLE is not set
+CONFIG_DUMMY_CONSOLE=3Dy
+CONFIG_FRAMEBUFFER_CONSOLE=3Dy
+CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY=3Dy
+# CONFIG_FRAMEBUFFER_CONSOLE_ROTATION is not set
+CONFIG_FONTS=3Dy
+CONFIG_FONT_8x8=3Dy
+CONFIG_FONT_8x16=3Dy
+# CONFIG_FONT_6x11 is not set
+# CONFIG_FONT_7x14 is not set
+CONFIG_FONT_PEARL_8x8=3Dy
+CONFIG_FONT_ACORN_8x8=3Dy
+CONFIG_FONT_MINI_4x6=3Dy
+# CONFIG_FONT_SUN8x16 is not set
+# CONFIG_FONT_SUN12x22 is not set
+CONFIG_FONT_10x18=3Dy
+# CONFIG_LOGO is not set
+CONFIG_SOUND=3Dy
+CONFIG_SOUND_OSS_CORE=3Dy
+CONFIG_SND=3Dy
+CONFIG_SND_TIMER=3Dy
+CONFIG_SND_PCM=3Dy
+CONFIG_SND_JACK=3Dy
+# CONFIG_SND_SEQUENCER is not set
+CONFIG_SND_OSSEMUL=3Dy
+CONFIG_SND_MIXER_OSS=3Dy
+CONFIG_SND_PCM_OSS=3Dy
+CONFIG_SND_PCM_OSS_PLUGINS=3Dy
+CONFIG_SND_DYNAMIC_MINORS=3Dy
+CONFIG_SND_SUPPORT_OLD_API=3Dy
+# CONFIG_SND_VERBOSE_PROCFS is not set
+CONFIG_SND_VERBOSE_PRINTK=3Dy
+# CONFIG_SND_DEBUG is not set
+CONFIG_SND_VMASTER=3Dy
+# CONFIG_SND_RAWMIDI_SEQ is not set
+# CONFIG_SND_OPL3_LIB_SEQ is not set
+# CONFIG_SND_OPL4_LIB_SEQ is not set
+# CONFIG_SND_SBAWE_SEQ is not set
+# CONFIG_SND_EMU10K1_SEQ is not set
+CONFIG_SND_AC97_CODEC=3Dy
+CONFIG_SND_DRIVERS=3Dy
+# CONFIG_SND_DUMMY is not set
+# CONFIG_SND_MTPAV is not set
+# CONFIG_SND_SERIAL_U16550 is not set
+# CONFIG_SND_MPU401 is not set
+# CONFIG_SND_AC97_POWER_SAVE is not set
+CONFIG_SND_PCI=3Dy
+# CONFIG_SND_AD1889 is not set
+# CONFIG_SND_ALS300 is not set
+# CONFIG_SND_ALS4000 is not set
+# CONFIG_SND_ALI5451 is not set
+# CONFIG_SND_ATIIXP is not set
+# CONFIG_SND_ATIIXP_MODEM is not set
+# CONFIG_SND_AU8810 is not set
+# CONFIG_SND_AU8820 is not set
+# CONFIG_SND_AU8830 is not set
+# CONFIG_SND_AW2 is not set
+# CONFIG_SND_AZT3328 is not set
+# CONFIG_SND_BT87X is not set
+# CONFIG_SND_CA0106 is not set
+# CONFIG_SND_CMIPCI is not set
+# CONFIG_SND_OXYGEN is not set
+# CONFIG_SND_CS4281 is not set
+# CONFIG_SND_CS46XX is not set
+# CONFIG_SND_CS5530 is not set
+CONFIG_SND_CS5535AUDIO=3Dy
+# CONFIG_SND_CTXFI is not set
+# CONFIG_SND_DARLA20 is not set
+# CONFIG_SND_GINA20 is not set
+# CONFIG_SND_LAYLA20 is not set
+# CONFIG_SND_DARLA24 is not set
+# CONFIG_SND_GINA24 is not set
+# CONFIG_SND_LAYLA24 is not set
+# CONFIG_SND_MONA is not set
+# CONFIG_SND_MIA is not set
+# CONFIG_SND_ECHO3G is not set
+# CONFIG_SND_INDIGO is not set
+# CONFIG_SND_INDIGOIO is not set
+# CONFIG_SND_INDIGODJ is not set
+# CONFIG_SND_INDIGOIOX is not set
+# CONFIG_SND_INDIGODJX is not set
+# CONFIG_SND_EMU10K1 is not set
+# CONFIG_SND_EMU10K1X is not set
+# CONFIG_SND_ENS1370 is not set
+# CONFIG_SND_ENS1371 is not set
+# CONFIG_SND_ES1938 is not set
+# CONFIG_SND_ES1968 is not set
+# CONFIG_SND_FM801 is not set
+# CONFIG_SND_HDA_INTEL is not set
+# CONFIG_SND_HDSP is not set
+# CONFIG_SND_HDSPM is not set
+# CONFIG_SND_HIFIER is not set
+# CONFIG_SND_ICE1712 is not set
+# CONFIG_SND_ICE1724 is not set
+# CONFIG_SND_INTEL8X0 is not set
+# CONFIG_SND_INTEL8X0M is not set
+# CONFIG_SND_KORG1212 is not set
+# CONFIG_SND_LX6464ES is not set
+# CONFIG_SND_MAESTRO3 is not set
+# CONFIG_SND_MIXART is not set
+# CONFIG_SND_NM256 is not set
+# CONFIG_SND_PCXHR is not set
+# CONFIG_SND_RIPTIDE is not set
+# CONFIG_SND_RME32 is not set
+# CONFIG_SND_RME96 is not set
+# CONFIG_SND_RME9652 is not set
+# CONFIG_SND_SIS7019 is not set
+# CONFIG_SND_SONICVIBES is not set
+# CONFIG_SND_TRIDENT is not set
+# CONFIG_SND_VIA82XX is not set
+# CONFIG_SND_VIA82XX_MODEM is not set
+# CONFIG_SND_VIRTUOSO is not set
+# CONFIG_SND_VX222 is not set
+# CONFIG_SND_YMFPCI is not set
+# CONFIG_SND_USB is not set
+CONFIG_SND_SOC=3Dy
+# CONFIG_SND_SOC_ALL_CODECS is not set
+# CONFIG_SOUND_PRIME is not set
+CONFIG_AC97_BUS=3Dy
+CONFIG_HID_SUPPORT=3Dy
+CONFIG_HID=3Dy
+# CONFIG_HID_DEBUG is not set
+# CONFIG_HIDRAW is not set
+
+#
+# USB Input Devices
+#
+CONFIG_USB_HID=3Dy
+# CONFIG_HID_PID is not set
+# CONFIG_USB_HIDDEV is not set
+
+#
+# Special HID drivers
+#
+CONFIG_HID_A4TECH=3Dy
+CONFIG_HID_APPLE=3Dy
+CONFIG_HID_BELKIN=3Dy
+CONFIG_HID_CHERRY=3Dy
+CONFIG_HID_CHICONY=3Dy
+CONFIG_HID_CYPRESS=3Dy
+# CONFIG_HID_DRAGONRISE is not set
+CONFIG_HID_EZKEY=3Dy
+CONFIG_HID_KYE=3Dy
+CONFIG_HID_GYRATION=3Dy
+CONFIG_HID_KENSINGTON=3Dy
+CONFIG_HID_LOGITECH=3Dy
+CONFIG_LOGITECH_FF=3Dy
+# CONFIG_LOGIRUMBLEPAD2_FF is not set
+CONFIG_HID_MICROSOFT=3Dy
+CONFIG_HID_MONTEREY=3Dy
+CONFIG_HID_NTRIG=3Dy
+CONFIG_HID_PANTHERLORD=3Dy
+CONFIG_PANTHERLORD_FF=3Dy
+CONFIG_HID_PETALYNX=3Dy
+CONFIG_HID_SAMSUNG=3Dy
+CONFIG_HID_SONY=3Dy
+CONFIG_HID_SUNPLUS=3Dy
+# CONFIG_HID_GREENASIA is not set
+# CONFIG_HID_SMARTJOYPLUS is not set
+CONFIG_HID_TOPSEED=3Dy
+# CONFIG_HID_THRUSTMASTER is not set
+# CONFIG_HID_ZEROPLUS is not set
+CONFIG_USB_SUPPORT=3Dy
+CONFIG_USB_ARCH_HAS_HCD=3Dy
+CONFIG_USB_ARCH_HAS_OHCI=3Dy
+CONFIG_USB_ARCH_HAS_EHCI=3Dy
+CONFIG_USB=3Dy
+CONFIG_USB_DEBUG=3Dy
+CONFIG_USB_ANNOUNCE_NEW_DEVICES=3Dy
+
+#
+# Miscellaneous USB options
+#
+CONFIG_USB_DEVICEFS=3Dy
+# CONFIG_USB_DEVICE_CLASS is not set
+# CONFIG_USB_DYNAMIC_MINORS is not set
+# CONFIG_USB_OTG is not set
+# CONFIG_USB_OTG_WHITELIST is not set
+# CONFIG_USB_OTG_BLACKLIST_HUB is not set
+# CONFIG_USB_MON is not set
+# CONFIG_USB_WUSB is not set
+# CONFIG_USB_WUSB_CBAF is not set
+
+#
+# USB Host Controller Drivers
+#
+# CONFIG_USB_C67X00_HCD is not set
+# CONFIG_USB_XHCI_HCD is not set
+CONFIG_USB_EHCI_HCD=3Dy
+# CONFIG_USB_EHCI_ROOT_HUB_TT is not set
+# CONFIG_USB_EHCI_TT_NEWSCHED is not set
+# CONFIG_USB_OXU210HP_HCD is not set
+# CONFIG_USB_ISP116X_HCD is not set
+# CONFIG_USB_ISP1760_HCD is not set
+CONFIG_USB_OHCI_HCD=3Dy
+# CONFIG_USB_OHCI_BIG_ENDIAN_DESC is not set
+# CONFIG_USB_OHCI_BIG_ENDIAN_MMIO is not set
+CONFIG_USB_OHCI_LITTLE_ENDIAN=3Dy
+CONFIG_USB_UHCI_HCD=3Dy
+# CONFIG_USB_SL811_HCD is not set
+# CONFIG_USB_R8A66597_HCD is not set
+# CONFIG_USB_WHCI_HCD is not set
+# CONFIG_USB_HWA_HCD is not set
+
+#
+# USB Device Class drivers
+#
+CONFIG_USB_ACM=3Dy
+CONFIG_USB_PRINTER=3Dy
+# CONFIG_USB_WDM is not set
+# CONFIG_USB_TMC is not set
+
+#
+# NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may
+#
+
+#
+# also be needed; see USB_STORAGE Help for more info
+#
+CONFIG_USB_STORAGE=3Dy
+# CONFIG_USB_STORAGE_DEBUG is not set
+# CONFIG_USB_STORAGE_DATAFAB is not set
+# CONFIG_USB_STORAGE_FREECOM is not set
+# CONFIG_USB_STORAGE_ISD200 is not set
+# CONFIG_USB_STORAGE_USBAT is not set
+# CONFIG_USB_STORAGE_SDDR09 is not set
+# CONFIG_USB_STORAGE_SDDR55 is not set
+# CONFIG_USB_STORAGE_JUMPSHOT is not set
+# CONFIG_USB_STORAGE_ALAUDA is not set
+# CONFIG_USB_STORAGE_ONETOUCH is not set
+# CONFIG_USB_STORAGE_KARMA is not set
+# CONFIG_USB_STORAGE_CYPRESS_ATACB is not set
+CONFIG_USB_LIBUSUAL=3Dy
+
+#
+# USB Imaging devices
+#
+# CONFIG_USB_MDC800 is not set
+# CONFIG_USB_MICROTEK is not set
+
+#
+# USB port drivers
+#
+# CONFIG_USB_SERIAL is not set
+
+#
+# USB Miscellaneous drivers
+#
+# CONFIG_USB_EMI62 is not set
+# CONFIG_USB_EMI26 is not set
+# CONFIG_USB_ADUTUX is not set
+# CONFIG_USB_SEVSEG is not set
+# CONFIG_USB_RIO500 is not set
+# CONFIG_USB_LEGOTOWER is not set
+# CONFIG_USB_LCD is not set
+# CONFIG_USB_BERRY_CHARGE is not set
+# CONFIG_USB_LED is not set
+# CONFIG_USB_CYPRESS_CY7C63 is not set
+# CONFIG_USB_CYTHERM is not set
+# CONFIG_USB_IDMOUSE is not set
+# CONFIG_USB_FTDI_ELAN is not set
+# CONFIG_USB_APPLEDISPLAY is not set
+# CONFIG_USB_SISUSBVGA is not set
+# CONFIG_USB_LD is not set
+# CONFIG_USB_TRANCEVIBRATOR is not set
+# CONFIG_USB_IOWARRIOR is not set
+# CONFIG_USB_TEST is not set
+# CONFIG_USB_ISIGHTFW is not set
+# CONFIG_USB_VST is not set
+# CONFIG_USB_GADGET is not set
+
+#
+# OTG and related infrastructure
+#
+# CONFIG_NOP_USB_XCEIV is not set
+# CONFIG_UWB is not set
+# CONFIG_MMC is not set
+# CONFIG_MEMSTICK is not set
+# CONFIG_NEW_LEDS is not set
+# CONFIG_ACCESSIBILITY is not set
+# CONFIG_INFINIBAND is not set
+CONFIG_EDAC=3Dy
+
+#
+# Reporting subsystems
+#
+# CONFIG_EDAC_DEBUG is not set
+# CONFIG_EDAC_MM_EDAC is not set
+CONFIG_RTC_LIB=3Dy
+CONFIG_RTC_CLASS=3Dy
+CONFIG_RTC_HCTOSYS=3Dy
+CONFIG_RTC_HCTOSYS_DEVICE=3D"rtc0"
+# CONFIG_RTC_DEBUG is not set
+
+#
+# RTC interfaces
+#
+CONFIG_RTC_INTF_SYSFS=3Dy
+CONFIG_RTC_INTF_PROC=3Dy
+CONFIG_RTC_INTF_DEV=3Dy
+# CONFIG_RTC_INTF_DEV_UIE_EMUL is not set
+# CONFIG_RTC_DRV_TEST is not set
+
+#
+# SPI RTC drivers
+#
+
+#
+# Platform RTC drivers
+#
+CONFIG_RTC_DRV_CMOS=3Dy
+# CONFIG_RTC_DRV_DS1286 is not set
+# CONFIG_RTC_DRV_DS1511 is not set
+# CONFIG_RTC_DRV_DS1553 is not set
+# CONFIG_RTC_DRV_DS1742 is not set
+# CONFIG_RTC_DRV_STK17TA8 is not set
+# CONFIG_RTC_DRV_M48T86 is not set
+# CONFIG_RTC_DRV_M48T35 is not set
+# CONFIG_RTC_DRV_M48T59 is not set
+# CONFIG_RTC_DRV_BQ4802 is not set
+# CONFIG_RTC_DRV_V3020 is not set
+
+#
+# on-CPU RTC drivers
+#
+CONFIG_DMADEVICES=3Dy
+
+#
+# DMA Devices
+#
+# CONFIG_INTEL_IOATDMA is not set
+# CONFIG_AUXDISPLAY is not set
+# CONFIG_UIO is not set
+
+#
+# TI VLYNQ
+#
+# CONFIG_STAGING is not set
+CONFIG_X86_PLATFORM_DEVICES=3Dy
+
+#
+# Firmware Drivers
+#
+# CONFIG_EDD is not set
+# CONFIG_FIRMWARE_MEMMAP is not set
+# CONFIG_DELL_RBU is not set
+# CONFIG_DCDBAS is not set
+# CONFIG_DMIID is not set
+# CONFIG_ISCSI_IBFT_FIND is not set
+
+#
+# File systems
+#
+CONFIG_EXT2_FS=3Dy
+# CONFIG_EXT2_FS_XATTR is not set
+# CONFIG_EXT2_FS_XIP is not set
+CONFIG_EXT3_FS=3Dy
+# CONFIG_EXT3_DEFAULTS_TO_ORDERED is not set
+CONFIG_EXT3_FS_XATTR=3Dy
+CONFIG_EXT3_FS_POSIX_ACL=3Dy
+CONFIG_EXT3_FS_SECURITY=3Dy
+# CONFIG_EXT4_FS is not set
+CONFIG_JBD=3Dy
+# CONFIG_JBD_DEBUG is not set
+CONFIG_FS_MBCACHE=3Dy
+# CONFIG_REISERFS_FS is not set
+# CONFIG_JFS_FS is not set
+CONFIG_FS_POSIX_ACL=3Dy
+# CONFIG_XFS_FS is not set
+# CONFIG_OCFS2_FS is not set
+# CONFIG_BTRFS_FS is not set
+CONFIG_FILE_LOCKING=3Dy
+CONFIG_FSNOTIFY=3Dy
+CONFIG_DNOTIFY=3Dy
+CONFIG_INOTIFY=3Dy
+CONFIG_INOTIFY_USER=3Dy
+# CONFIG_QUOTA is not set
+# CONFIG_AUTOFS_FS is not set
+CONFIG_AUTOFS4_FS=3Dy
+CONFIG_FUSE_FS=3Dy
+CONFIG_CUSE=3Dy
+CONFIG_GENERIC_ACL=3Dy
+
+#
+# Caches
+#
+# CONFIG_FSCACHE is not set
+
+#
+# CD-ROM/DVD Filesystems
+#
+CONFIG_ISO9660_FS=3Dy
+CONFIG_JOLIET=3Dy
+CONFIG_ZISOFS=3Dy
+# CONFIG_UDF_FS is not set
+
+#
+# DOS/FAT/NT Filesystems
+#
+CONFIG_FAT_FS=3Dy
+CONFIG_MSDOS_FS=3Dy
+CONFIG_VFAT_FS=3Dy
+CONFIG_FAT_DEFAULT_CODEPAGE=3D437
+CONFIG_FAT_DEFAULT_IOCHARSET=3D"iso8859-1"
+CONFIG_NTFS_FS=3Dy
+# CONFIG_NTFS_DEBUG is not set
+# CONFIG_NTFS_RW is not set
+
+#
+# Pseudo filesystems
+#
+CONFIG_PROC_FS=3Dy
+# CONFIG_PROC_KCORE is not set
+CONFIG_PROC_SYSCTL=3Dy
+CONFIG_PROC_PAGE_MONITOR=3Dy
+CONFIG_SYSFS=3Dy
+CONFIG_TMPFS=3Dy
+CONFIG_TMPFS_POSIX_ACL=3Dy
+# CONFIG_HUGETLBFS is not set
+# CONFIG_HUGETLB_PAGE is not set
+# CONFIG_CONFIGFS_FS is not set
+CONFIG_MISC_FILESYSTEMS=3Dy
+# CONFIG_ADFS_FS is not set
+# CONFIG_AFFS_FS is not set
+# CONFIG_HFS_FS is not set
+# CONFIG_HFSPLUS_FS is not set
+# CONFIG_BEFS_FS is not set
+# CONFIG_BFS_FS is not set
+# CONFIG_EFS_FS is not set
+# CONFIG_CRAMFS is not set
+# CONFIG_SQUASHFS is not set
+# CONFIG_VXFS_FS is not set
+# CONFIG_MINIX_FS is not set
+# CONFIG_OMFS_FS is not set
+# CONFIG_HPFS_FS is not set
+# CONFIG_QNX4FS_FS is not set
+# CONFIG_ROMFS_FS is not set
+# CONFIG_SYSV_FS is not set
+# CONFIG_UFS_FS is not set
+# CONFIG_NILFS2_FS is not set
+# CONFIG_NETWORK_FILESYSTEMS is not set
+
+#
+# Partition Types
+#
+CONFIG_PARTITION_ADVANCED=3Dy
+# CONFIG_ACORN_PARTITION is not set
+CONFIG_OSF_PARTITION=3Dy
+CONFIG_AMIGA_PARTITION=3Dy
+# CONFIG_ATARI_PARTITION is not set
+CONFIG_MAC_PARTITION=3Dy
+CONFIG_MSDOS_PARTITION=3Dy
+CONFIG_BSD_DISKLABEL=3Dy
+CONFIG_MINIX_SUBPARTITION=3Dy
+CONFIG_SOLARIS_X86_PARTITION=3Dy
+CONFIG_UNIXWARE_DISKLABEL=3Dy
+# CONFIG_LDM_PARTITION is not set
+CONFIG_SGI_PARTITION=3Dy
+# CONFIG_ULTRIX_PARTITION is not set
+CONFIG_SUN_PARTITION=3Dy
+CONFIG_KARMA_PARTITION=3Dy
+CONFIG_EFI_PARTITION=3Dy
+# CONFIG_SYSV68_PARTITION is not set
+CONFIG_NLS=3Dy
+CONFIG_NLS_DEFAULT=3D"utf8"
+CONFIG_NLS_CODEPAGE_437=3Dy
+# CONFIG_NLS_CODEPAGE_737 is not set
+# CONFIG_NLS_CODEPAGE_775 is not set
+# CONFIG_NLS_CODEPAGE_850 is not set
+# CONFIG_NLS_CODEPAGE_852 is not set
+# CONFIG_NLS_CODEPAGE_855 is not set
+# CONFIG_NLS_CODEPAGE_857 is not set
+# CONFIG_NLS_CODEPAGE_860 is not set
+# CONFIG_NLS_CODEPAGE_861 is not set
+# CONFIG_NLS_CODEPAGE_862 is not set
+# CONFIG_NLS_CODEPAGE_863 is not set
+# CONFIG_NLS_CODEPAGE_864 is not set
+# CONFIG_NLS_CODEPAGE_865 is not set
+# CONFIG_NLS_CODEPAGE_866 is not set
+# CONFIG_NLS_CODEPAGE_869 is not set
+# CONFIG_NLS_CODEPAGE_936 is not set
+# CONFIG_NLS_CODEPAGE_950 is not set
+# CONFIG_NLS_CODEPAGE_932 is not set
+# CONFIG_NLS_CODEPAGE_949 is not set
+# CONFIG_NLS_CODEPAGE_874 is not set
+# CONFIG_NLS_ISO8859_8 is not set
+# CONFIG_NLS_CODEPAGE_1250 is not set
+# CONFIG_NLS_CODEPAGE_1251 is not set
+CONFIG_NLS_ASCII=3Dy
+CONFIG_NLS_ISO8859_1=3Dy
+# CONFIG_NLS_ISO8859_2 is not set
+# CONFIG_NLS_ISO8859_3 is not set
+# CONFIG_NLS_ISO8859_4 is not set
+# CONFIG_NLS_ISO8859_5 is not set
+# CONFIG_NLS_ISO8859_6 is not set
+# CONFIG_NLS_ISO8859_7 is not set
+# CONFIG_NLS_ISO8859_9 is not set
+# CONFIG_NLS_ISO8859_13 is not set
+# CONFIG_NLS_ISO8859_14 is not set
+# CONFIG_NLS_ISO8859_15 is not set
+# CONFIG_NLS_KOI8_R is not set
+# CONFIG_NLS_KOI8_U is not set
+CONFIG_NLS_UTF8=3Dy
+# CONFIG_DLM is not set
+
+#
+# Kernel hacking
+#
+CONFIG_TRACE_IRQFLAGS_SUPPORT=3Dy
+CONFIG_PRINTK_TIME=3Dy
+# CONFIG_ENABLE_WARN_DEPRECATED is not set
+# CONFIG_ENABLE_MUST_CHECK is not set
+CONFIG_FRAME_WARN=3D2048
+CONFIG_MAGIC_SYSRQ=3Dy
+# CONFIG_UNUSED_SYMBOLS is not set
+CONFIG_DEBUG_FS=3Dy
+# CONFIG_HEADERS_CHECK is not set
+# CONFIG_DEBUG_KERNEL is not set
+# CONFIG_DEBUG_BUGVERBOSE is not set
+# CONFIG_DEBUG_MEMORY_INIT is not set
+CONFIG_ARCH_WANT_FRAME_POINTERS=3Dy
+# CONFIG_FRAME_POINTER is not set
+# CONFIG_RCU_CPU_STALL_DETECTOR is not set
+# CONFIG_LATENCYTOP is not set
+# CONFIG_SYSCTL_SYSCALL_CHECK is not set
+CONFIG_USER_STACKTRACE_SUPPORT=3Dy
+CONFIG_HAVE_FUNCTION_TRACER=3Dy
+CONFIG_HAVE_FUNCTION_GRAPH_TRACER=3Dy
+CONFIG_HAVE_FUNCTION_GRAPH_FP_TEST=3Dy
+CONFIG_HAVE_FUNCTION_TRACE_MCOUNT_TEST=3Dy
+CONFIG_HAVE_DYNAMIC_FTRACE=3Dy
+CONFIG_HAVE_FTRACE_MCOUNT_RECORD=3Dy
+CONFIG_HAVE_FTRACE_SYSCALLS=3Dy
+CONFIG_TRACING_SUPPORT=3Dy
+# CONFIG_FTRACE is not set
+# CONFIG_PROVIDE_OHCI1394_DMA_INIT is not set
+# CONFIG_DYNAMIC_DEBUG is not set
+# CONFIG_DMA_API_DEBUG is not set
+# CONFIG_SAMPLES is not set
+CONFIG_HAVE_ARCH_KGDB=3Dy
+CONFIG_HAVE_ARCH_KMEMCHECK=3Dy
+# CONFIG_STRICT_DEVMEM is not set
+CONFIG_X86_VERBOSE_BOOTUP=3Dy
+CONFIG_EARLY_PRINTK=3Dy
+CONFIG_EARLY_PRINTK_DBGP=3Dy
+# CONFIG_4KSTACKS is not set
+# CONFIG_DOUBLEFAULT is not set
+# CONFIG_IOMMU_STRESS is not set
+CONFIG_HAVE_MMIOTRACE_SUPPORT=3Dy
+CONFIG_IO_DELAY_TYPE_0X80=3D0
+CONFIG_IO_DELAY_TYPE_0XED=3D1
+CONFIG_IO_DELAY_TYPE_UDELAY=3D2
+CONFIG_IO_DELAY_TYPE_NONE=3D3
+CONFIG_IO_DELAY_0X80=3Dy
+# CONFIG_IO_DELAY_0XED is not set
+# CONFIG_IO_DELAY_UDELAY is not set
+# CONFIG_IO_DELAY_NONE is not set
+CONFIG_DEFAULT_IO_DELAY_TYPE=3D0
+CONFIG_OPTIMIZE_INLINING=3Dy
+
+#
+# Security options
+#
+# CONFIG_KEYS is not set
+# CONFIG_SECURITY is not set
+# CONFIG_SECURITYFS is not set
+CONFIG_SECURITY_FILE_CAPABILITIES=3Dy
+# CONFIG_CRYPTO is not set
+CONFIG_HAVE_KVM=3Dy
+CONFIG_HAVE_KVM_IRQCHIP=3Dy
+# CONFIG_VIRTUALIZATION is not set
+# CONFIG_BINARY_PRINTF is not set
+
+#
+# Library routines
+#
+CONFIG_BITREVERSE=3Dy
+CONFIG_GENERIC_FIND_FIRST_BIT=3Dy
+CONFIG_GENERIC_FIND_NEXT_BIT=3Dy
+CONFIG_GENERIC_FIND_LAST_BIT=3Dy
+# CONFIG_CRC_CCITT is not set
+# CONFIG_CRC16 is not set
+CONFIG_CRC_T10DIF=3Dy
+# CONFIG_CRC_ITU_T is not set
+CONFIG_CRC32=3Dy
+# CONFIG_CRC7 is not set
+# CONFIG_LIBCRC32C is not set
+CONFIG_ZLIB_INFLATE=3Dy
+CONFIG_DECOMPRESS_GZIP=3Dy
+CONFIG_DECOMPRESS_BZIP2=3Dy
+CONFIG_DECOMPRESS_LZMA=3Dy
+CONFIG_HAS_IOMEM=3Dy
+CONFIG_HAS_IOPORT=3Dy
+CONFIG_HAS_DMA=3Dy
+CONFIG_NLATTR=3Dy
diff --git a/recipes/linux/linux_2.6.31.5.bb b/recipes/linux/linux_2.6.31=
.5.bb
new file mode 100644
index 0000000..e47002a
--- /dev/null
+++ b/recipes/linux/linux_2.6.31.5.bb
@@ -0,0 +1,12 @@
+require linux.inc
+
+PR =3D "r0"
+
+S =3D "${WORKDIR}/linux-${PV}"
+
+# Mark archs/machines that this kernel supports
+DEFAULT_PREFERENCE =3D "-1"
+DEFAULT_PREFERENCE_iei-nanogx-466 =3D "1"
+
+SRC_URI =3D "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar.b=
z2 \
+           file://defconfig"
--=20
1.5.6.3



