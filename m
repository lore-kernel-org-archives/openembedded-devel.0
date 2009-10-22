Received: from [82.192.226.27] (helo=mail.o2s.ch)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <david.lanzendoerfer@o2s.ch>) id 1N15MY-0000Fp-Di
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Oct 2009 23:38:30 +0200
Received: from dizzy-6.localnet ([::ffff:192.168.2.122])
	(TLS: TLSv1/SSLv3,256bits,AES256-SHA)
	by koffein with esmtp; Thu, 22 Oct 2009 22:13:29 +0200
	id 0000000000013E09.000000004AE0BCE9.0000454A
From: David =?iso-8859-1?q?Lanzend=F6rfer?= <david.lanzendoerfer@o2s.ch>
Organization: OpenSourceSupport GmbH
To: openembedded-devel@lists.openembedded.org
Date: Thu, 22 Oct 2009 23:39:29 +0200
User-Agent: KMail/1.12.1 (Linux/2.6.31.1; KDE/4.3.1; x86_64; ; )
X-Face: a023Y#Om+E(<|Tkz7Ae>YeJ\rvY,eXDn^g66`NiaNQ"#xRJ=gr'!V}V#{MN6!YO{s{{); h
	=s@Vv%T)fi>gJrAHvijw^ZG9{b1rtf~mn$V^b`:3m>yH=o$Eo')Ul8f}F%1vdg9|52W=Xs
	rR^/E/SPo^{-R22[a}c?@tgfp<I#oOW7r}0We&3g5"2>N5r/Vu|>kWs"|J'XppA; *0A,6>
	*GY(0=H@>@^vEy]!m\)I42Lu@k~_=:U@/kf8{AO4'F7:Hy_*"5Xf9Vvkqr4E(32pVlT:=&
	i4l[3%?Z<zzP~wGSke?1VJj\cd~Z(,Upc;nOR|pqK@<j(`EYFSn,jN)A(~`YwM2nIv,
Mime-Version: 1.0
Message-Id: <200910222339.32881.david.lanzendoerfer@o2s.ch>
X-SA-Exim-Connect-IP: 82.192.226.27
X-SA-Exim-Mail-From: david.lanzendoerfer@o2s.ch
X-SA-Exim-Scanned: No (on linuxtogo.org);
	Message bigger than SAmaxbody (256000)
Subject: Patches
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
X-List-Received-Date: Thu, 22 Oct 2009 21:38:30 -0000
X-Groupsio-MsgNum: 13558
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg=pgp-sha1; boundary="=_koffein-17740-1256242409-0001-2"

--=_koffein-17740-1256242409-0001-2
Content-Type: multipart/mixed;
  boundary="Boundary-01=_REN4Kp3e0FT0FMj"
Content-Transfer-Encoding: 7bit

--Boundary-01=_REN4Kp3e0FT0FMj
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi
Here are some patches to fix building of OpenMoko images.

commit-9cd10ef:
Fixed build issue with openmoko and guile

commit-dfe43d6:
Changed desired kernel to linux-replicant
(htc-dream)

commit-daf15a0:
Added replicants kernel from http://gitorious.org/replicant/gnulinuxkernel

I hope, I'll see it soon in the next pull.
Greatings
	leviathan

--Boundary-01=_REN4Kp3e0FT0FMj
Content-Type: text/plain;
  charset="ISO-8859-1";
  name="commit-9cd10ef"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="commit-9cd10ef"

commit 9cd10ef2d83b5cd6d0d55f587bf961acc48d413b
Author: David Lanzend=F6rfer <david.lanzendoerfer@o2s.ch>
Date:   Thu Oct 22 20:38:28 2009 +0200

    Fixed build issue with openmoko and guile

diff --git a/conf/distro/openmoko.conf b/conf/distro/openmoko.conf
index 81d7075..687cac3 100644
--- a/conf/distro/openmoko.conf
+++ b/conf/distro/openmoko.conf
@@ -4,7 +4,7 @@
 #@DESCRIPTION: Linux Distribution Configuration for the Openmoko Platform
 #-------------------------------------------------------------------------=
----
=20
-require conf/distro/include/preferred-om-2008-versions.inc
+require conf/distro/include/preferred-om-2009-versions.inc
 require conf/distro/include/angstrom-2007-for-openmoko.inc
=20
 #

--Boundary-01=_REN4Kp3e0FT0FMj
Content-Type: text/plain;
  charset="ISO-8859-1";
  name="commit-dfe43d6"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="commit-dfe43d6"

commit dfe43d636b6a3c9b44e85ff4028acb735e4286e2
Author: David Lanzend=F6rfer <david.lanzendoerfer@o2s.ch>
Date:   Thu Oct 22 20:42:05 2009 +0200

    Changed desired kernel to linux-replicant

diff --git a/conf/machine/htcdream.conf b/conf/machine/htcdream.conf
index 7f7680a..623901c 100644
--- a/conf/machine/htcdream.conf
+++ b/conf/machine/htcdream.conf
@@ -9,5 +9,5 @@ MACHINE_DISPLAY_HEIGHT_PIXELS =3D "480"
=20
 MACHINE_FEATURES =3D "kernel26 touchscreen screen phone gps usbgadget blue=
tooth keyboard ext2"=20
=20
-PREFERRED_PROVIDER_virtual/kernel =3D "linux-msm7xxxx"
+PREFERRED_PROVIDER_virtual/kernel =3D "linux-replicant"
=20

--Boundary-01=_REN4Kp3e0FT0FMj
Content-Type: text/plain;
  charset="ISO-8859-1";
  name="commit-daf15a0"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="commit-daf15a0"

commit daf15a098595faf957828adab0758d7abbcfe2d1
Author: David Lanzend=F6rfer <david.lanzendoerfer@o2s.ch>
Date:   Thu Oct 22 20:40:27 2009 +0200

    Added replicants kernel from http://gitorious.org/replicant/gnulinuxker=
nel

diff --git a/recipes/linux/linux-replicant/htcblackstone/defconfig b/recipe=
s/linux/linux-replicant/htcblackstone/defconfig
new file mode 100644
index 0000000..81e8cf9
--- /dev/null
+++ b/recipes/linux/linux-replicant/htcblackstone/defconfig
@@ -0,0 +1,1139 @@
+#
+# Automatically generated make config: don't edit
+# Linux kernel version: 2.6.27
+# Sun Mar  8 15:57:38 2009
+#
+CONFIG_ARM=3Dy
+CONFIG_SYS_SUPPORTS_APM_EMULATION=3Dy
+CONFIG_GENERIC_GPIO=3Dy
+CONFIG_GENERIC_TIME=3Dy
+CONFIG_GENERIC_CLOCKEVENTS=3Dy
+CONFIG_MMU=3Dy
+# CONFIG_NO_IOPORT is not set
+CONFIG_GENERIC_HARDIRQS=3Dy
+CONFIG_STACKTRACE_SUPPORT=3Dy
+CONFIG_HAVE_LATENCYTOP_SUPPORT=3Dy
+CONFIG_LOCKDEP_SUPPORT=3Dy
+CONFIG_TRACE_IRQFLAGS_SUPPORT=3Dy
+CONFIG_HARDIRQS_SW_RESEND=3Dy
+CONFIG_GENERIC_IRQ_PROBE=3Dy
+CONFIG_RWSEM_GENERIC_SPINLOCK=3Dy
+# CONFIG_ARCH_HAS_ILOG2_U32 is not set
+# CONFIG_ARCH_HAS_ILOG2_U64 is not set
+CONFIG_GENERIC_HWEIGHT=3Dy
+CONFIG_GENERIC_CALIBRATE_DELAY=3Dy
+CONFIG_ARCH_SUPPORTS_AOUT=3Dy
+CONFIG_ZONE_DMA=3Dy
+CONFIG_GENERIC_HARDIRQS_NO__DO_IRQ=3Dy
+CONFIG_VECTORS_BASE=3D0xffff0000
+CONFIG_DEFCONFIG_LIST=3D"/lib/modules/$UNAME_RELEASE/.config"
+
+#
+# General setup
+#
+CONFIG_EXPERIMENTAL=3Dy
+CONFIG_BROKEN_ON_SMP=3Dy
+CONFIG_LOCK_KERNEL=3Dy
+CONFIG_INIT_ENV_ARG_LIMIT=3D32
+CONFIG_LOCALVERSION=3D""
+CONFIG_LOCALVERSION_AUTO=3Dy
+CONFIG_SWAP=3Dy
+# CONFIG_SYSVIPC is not set
+# CONFIG_POSIX_MQUEUE is not set
+# CONFIG_BSD_PROCESS_ACCT is not set
+# CONFIG_TASKSTATS is not set
+# CONFIG_AUDIT is not set
+CONFIG_IKCONFIG=3Dy
+CONFIG_IKCONFIG_PROC=3Dy
+CONFIG_LOG_BUF_SHIFT=3D17
+# CONFIG_CGROUPS is not set
+CONFIG_GROUP_SCHED=3Dy
+# CONFIG_FAIR_GROUP_SCHED is not set
+# CONFIG_RT_GROUP_SCHED is not set
+CONFIG_USER_SCHED=3Dy
+# CONFIG_CGROUP_SCHED is not set
+CONFIG_SYSFS_DEPRECATED=3Dy
+CONFIG_SYSFS_DEPRECATED_V2=3Dy
+# CONFIG_RELAY is not set
+CONFIG_NAMESPACES=3Dy
+# CONFIG_UTS_NS is not set
+# CONFIG_USER_NS is not set
+# CONFIG_PID_NS is not set
+CONFIG_BLK_DEV_INITRD=3Dy
+CONFIG_INITRAMFS_SOURCE=3D""
+CONFIG_CC_OPTIMIZE_FOR_SIZE=3Dy
+CONFIG_SYSCTL=3Dy
+CONFIG_PANIC_TIMEOUT=3D3
+# CONFIG_EMBEDDED is not set
+CONFIG_UID16=3Dy
+CONFIG_SYSCTL_SYSCALL=3Dy
+CONFIG_KALLSYMS=3Dy
+# CONFIG_KALLSYMS_ALL is not set
+# CONFIG_KALLSYMS_EXTRA_PASS is not set
+CONFIG_HOTPLUG=3Dy
+CONFIG_PRINTK=3Dy
+CONFIG_BUG=3Dy
+CONFIG_ELF_CORE=3Dy
+CONFIG_COMPAT_BRK=3Dy
+CONFIG_BASE_FULL=3Dy
+CONFIG_FUTEX=3Dy
+CONFIG_ANON_INODES=3Dy
+CONFIG_EPOLL=3Dy
+CONFIG_SIGNALFD=3Dy
+CONFIG_TIMERFD=3Dy
+CONFIG_EVENTFD=3Dy
+CONFIG_SHMEM=3Dy
+CONFIG_ASHMEM=3Dy
+CONFIG_VM_EVENT_COUNTERS=3Dy
+CONFIG_SLAB=3Dy
+# CONFIG_SLUB is not set
+# CONFIG_SLOB is not set
+# CONFIG_PROFILING is not set
+# CONFIG_MARKERS is not set
+CONFIG_HAVE_OPROFILE=3Dy
+# CONFIG_KPROBES is not set
+# CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS is not set
+# CONFIG_HAVE_IOREMAP_PROT is not set
+CONFIG_HAVE_KPROBES=3Dy
+CONFIG_HAVE_KRETPROBES=3Dy
+# CONFIG_HAVE_ARCH_TRACEHOOK is not set
+# CONFIG_HAVE_DMA_ATTRS is not set
+# CONFIG_USE_GENERIC_SMP_HELPERS is not set
+# CONFIG_HAVE_CLK is not set
+CONFIG_PROC_PAGE_MONITOR=3Dy
+CONFIG_HAVE_GENERIC_DMA_COHERENT=3Dy
+CONFIG_SLABINFO=3Dy
+CONFIG_RT_MUTEXES=3Dy
+# CONFIG_TINY_SHMEM is not set
+CONFIG_BASE_SMALL=3D0
+CONFIG_MODULES=3Dy
+# CONFIG_MODULE_FORCE_LOAD is not set
+CONFIG_MODULE_UNLOAD=3Dy
+CONFIG_MODULE_FORCE_UNLOAD=3Dy
+# CONFIG_MODVERSIONS is not set
+# CONFIG_MODULE_SRCVERSION_ALL is not set
+CONFIG_KMOD=3Dy
+CONFIG_BLOCK=3Dy
+# CONFIG_LBD is not set
+# CONFIG_BLK_DEV_IO_TRACE is not set
+# CONFIG_LSF is not set
+# CONFIG_BLK_DEV_BSG is not set
+# CONFIG_BLK_DEV_INTEGRITY is not set
+
+#
+# IO Schedulers
+#
+CONFIG_IOSCHED_NOOP=3Dy
+CONFIG_IOSCHED_AS=3Dy
+# CONFIG_IOSCHED_DEADLINE is not set
+# CONFIG_IOSCHED_CFQ is not set
+CONFIG_DEFAULT_AS=3Dy
+# CONFIG_DEFAULT_DEADLINE is not set
+# CONFIG_DEFAULT_CFQ is not set
+# CONFIG_DEFAULT_NOOP is not set
+CONFIG_DEFAULT_IOSCHED=3D"anticipatory"
+CONFIG_CLASSIC_RCU=3Dy
+
+#
+# System Type
+#
+# CONFIG_ARCH_AAEC2000 is not set
+# CONFIG_ARCH_INTEGRATOR is not set
+# CONFIG_ARCH_REALVIEW is not set
+# CONFIG_ARCH_VERSATILE is not set
+# CONFIG_ARCH_AT91 is not set
+# CONFIG_ARCH_CLPS7500 is not set
+# CONFIG_ARCH_CLPS711X is not set
+# CONFIG_ARCH_EBSA110 is not set
+# CONFIG_ARCH_EP93XX is not set
+# CONFIG_ARCH_FOOTBRIDGE is not set
+# CONFIG_ARCH_NETX is not set
+# CONFIG_ARCH_H720X is not set
+# CONFIG_ARCH_IMX is not set
+# CONFIG_ARCH_IOP13XX is not set
+# CONFIG_ARCH_IOP32X is not set
+# CONFIG_ARCH_IOP33X is not set
+# CONFIG_ARCH_IXP23XX is not set
+# CONFIG_ARCH_IXP2000 is not set
+# CONFIG_ARCH_IXP4XX is not set
+# CONFIG_ARCH_L7200 is not set
+# CONFIG_ARCH_KIRKWOOD is not set
+# CONFIG_ARCH_KS8695 is not set
+# CONFIG_ARCH_NS9XXX is not set
+# CONFIG_ARCH_LOKI is not set
+# CONFIG_ARCH_MV78XX0 is not set
+# CONFIG_ARCH_MXC is not set
+# CONFIG_ARCH_ORION5X is not set
+# CONFIG_ARCH_PNX4008 is not set
+# CONFIG_ARCH_PXA is not set
+# CONFIG_ARCH_RPC is not set
+# CONFIG_ARCH_SA1100 is not set
+# CONFIG_ARCH_S3C2410 is not set
+# CONFIG_ARCH_SHARK is not set
+# CONFIG_ARCH_LH7A40X is not set
+# CONFIG_ARCH_DAVINCI is not set
+# CONFIG_ARCH_OMAP is not set
+CONFIG_ARCH_MSM=3Dy
+
+#
+# Boot options
+#
+
+#
+# Power management
+#
+CONFIG_MSM_AMSS_VERSION=3D7000
+# CONFIG_MSM_AMSS_VERSION_6210 is not set
+# CONFIG_MSM_AMSS_VERSION_6220 is not set
+# CONFIG_MSM_AMSS_VERSION_6225 is not set
+CONFIG_MSM_AMSS_VERSION_WINCE=3Dy
+CONFIG_MSM_DEBUG_UART_NONE=3Dy
+# CONFIG_MSM_DEBUG_UART1 is not set
+# CONFIG_MSM_DEBUG_UART2 is not set
+# CONFIG_MSM_DEBUG_UART3 is not set
+
+#
+# MSM Board Type
+#
+# CONFIG_MACH_HALIBUT is not set
+# CONFIG_MACH_TROUT is not set
+# CONFIG_MACH_HTCRAPHAEL is not set
+# CONFIG_MACH_HTCRAPHAEL_CDMA is not set
+# CONFIG_MACH_HTCDIAMOND is not set
+# CONFIG_MACH_HTCDIAMOND_CDMA is not set
+CONFIG_MACH_HTCBLACKSTONE=3Dy
+# CONFIG_TROUT_H2W is not set
+CONFIG_TROUT_PWRSINK=3Dy
+CONFIG_MSM7X00A_USE_GP_TIMER=3Dy
+# CONFIG_MSM7X00A_USE_DG_TIMER is not set
+CONFIG_MSM7X00A_SLEEP_MODE_POWER_COLLAPSE_SUSPEND=3Dy
+# CONFIG_MSM7X00A_SLEEP_MODE_POWER_COLLAPSE is not set
+# CONFIG_MSM7X00A_SLEEP_MODE_APPS_SLEEP is not set
+# CONFIG_MSM7X00A_SLEEP_MODE_RAMP_DOWN_AND_WAIT_FOR_INTERRUPT is not set
+# CONFIG_MSM7X00A_SLEEP_WAIT_FOR_INTERRUPT is not set
+CONFIG_MSM7X00A_SLEEP_MODE=3D0
+# CONFIG_MSM7X00A_IDLE_SLEEP_MODE_POWER_COLLAPSE_SUSPEND is not set
+CONFIG_MSM7X00A_IDLE_SLEEP_MODE_POWER_COLLAPSE=3Dy
+# CONFIG_MSM7X00A_IDLE_SLEEP_MODE_APPS_SLEEP is not set
+# CONFIG_MSM7X00A_IDLE_SLEEP_MODE_RAMP_DOWN_AND_WAIT_FOR_INTERRUPT is not =
set
+# CONFIG_MSM7X00A_IDLE_SLEEP_WAIT_FOR_INTERRUPT is not set
+CONFIG_MSM7X00A_IDLE_SLEEP_MODE=3D1
+CONFIG_MSM7X00A_IDLE_SLEEP_MIN_TIME=3D20000000
+CONFIG_MSM7X00A_IDLE_SPIN_TIME=3D80000
+CONFIG_MSM_IDLE_STATS=3Dy
+CONFIG_MSM_IDLE_STATS_FIRST_BUCKET=3D62500
+CONFIG_MSM_IDLE_STATS_BUCKET_SHIFT=3D2
+CONFIG_MSM_IDLE_STATS_BUCKET_COUNT=3D10
+CONFIG_MSM_FIQ_SUPPORT=3Dy
+# CONFIG_MSM_SERIAL_DEBUGGER is not set
+CONFIG_MSM_SMD=3Dy
+# CONFIG_MSM_SMD_7500 is not set
+# CONFIG_MSM_ONCRPCROUTER is not set
+CONFIG_MSM_CPU_FREQ=3Dy
+# CONFIG_MSM_CPU_FREQ_ONDEMAND is not set
+CONFIG_MSM_CPU_FREQ_SCREEN=3Dy
+CONFIG_MSM_CPU_FREQ_SCREEN_OFF=3D245760
+CONFIG_MSM_CPU_FREQ_SCREEN_ON=3D384000
+CONFIG_MSM_HW3D=3Dy
+# CONFIG_MSM_ADSP is not set
+# CONFIG_HTC_FB_CONSOLE is not set
+# CONFIG_WIFI_CONTROL_FUNC is not set
+
+#
+# Processor Type
+#
+CONFIG_CPU_32=3Dy
+CONFIG_CPU_V6=3Dy
+# CONFIG_CPU_32v6K is not set
+CONFIG_CPU_32v6=3Dy
+CONFIG_CPU_ABRT_EV6=3Dy
+CONFIG_CPU_PABRT_NOIFAR=3Dy
+CONFIG_CPU_CACHE_V6=3Dy
+CONFIG_CPU_CACHE_VIPT=3Dy
+CONFIG_CPU_COPY_V6=3Dy
+CONFIG_CPU_TLB_V6=3Dy
+CONFIG_CPU_HAS_ASID=3Dy
+CONFIG_CPU_CP15=3Dy
+CONFIG_CPU_CP15_MMU=3Dy
+
+#
+# Processor Features
+#
+CONFIG_ARM_THUMB=3Dy
+# CONFIG_CPU_ICACHE_DISABLE is not set
+# CONFIG_CPU_DCACHE_DISABLE is not set
+# CONFIG_CPU_BPREDICT_DISABLE is not set
+# CONFIG_OUTER_CACHE is not set
+
+#
+# Bus support
+#
+# CONFIG_PCI_SYSCALL is not set
+# CONFIG_ARCH_SUPPORTS_MSI is not set
+# CONFIG_PCCARD is not set
+
+#
+# Kernel Features
+#
+CONFIG_TICK_ONESHOT=3Dy
+CONFIG_NO_HZ=3Dy
+CONFIG_HIGH_RES_TIMERS=3Dy
+CONFIG_GENERIC_CLOCKEVENTS_BUILD=3Dy
+CONFIG_PREEMPT=3Dy
+CONFIG_HZ=3D100
+CONFIG_AEABI=3Dy
+# CONFIG_OABI_COMPAT is not set
+CONFIG_ARCH_FLATMEM_HAS_HOLES=3Dy
+# CONFIG_ARCH_DISCONTIGMEM_ENABLE is not set
+CONFIG_SELECT_MEMORY_MODEL=3Dy
+CONFIG_FLATMEM_MANUAL=3Dy
+# CONFIG_DISCONTIGMEM_MANUAL is not set
+# CONFIG_SPARSEMEM_MANUAL is not set
+CONFIG_FLATMEM=3Dy
+CONFIG_FLAT_NODE_MEM_MAP=3Dy
+# CONFIG_SPARSEMEM_STATIC is not set
+# CONFIG_SPARSEMEM_VMEMMAP_ENABLE is not set
+CONFIG_PAGEFLAGS_EXTENDED=3Dy
+CONFIG_SPLIT_PTLOCK_CPUS=3D4
+CONFIG_RESOURCES_64BIT=3Dy
+CONFIG_ZONE_DMA_FLAG=3D1
+CONFIG_BOUNCE=3Dy
+CONFIG_VIRT_TO_BUS=3Dy
+CONFIG_ALIGNMENT_TRAP=3Dy
+
+#
+# Boot options
+#
+CONFIG_ZBOOT_ROM_TEXT=3D0x0
+CONFIG_ZBOOT_ROM_BSS=3D0x0
+CONFIG_CMDLINE=3D"mem=3D76M console=3DttyMSM2,115200n8"
+# CONFIG_XIP_KERNEL is not set
+# CONFIG_KEXEC is not set
+
+#
+# CPU Frequency scaling
+#
+# CONFIG_CPU_FREQ is not set
+
+#
+# Floating point emulation
+#
+
+#
+# At least one emulation must be selected
+#
+# CONFIG_VFP is not set
+
+#
+# Userspace binary formats
+#
+CONFIG_BINFMT_ELF=3Dy
+# CONFIG_BINFMT_AOUT is not set
+# CONFIG_BINFMT_MISC is not set
+
+#
+# Power management options
+#
+CONFIG_PM=3Dy
+# CONFIG_PM_DEBUG is not set
+CONFIG_PM_SLEEP=3Dy
+CONFIG_SUSPEND=3Dy
+CONFIG_SUSPEND_FREEZER=3Dy
+CONFIG_HAS_WAKELOCK=3Dy
+CONFIG_HAS_EARLYSUSPEND=3Dy
+CONFIG_WAKELOCK=3Dy
+# CONFIG_WAKELOCK_STAT is not set
+CONFIG_USER_WAKELOCK=3Dy
+CONFIG_EARLYSUSPEND=3Dy
+# CONFIG_NO_USER_SPACE_SCREEN_ACCESS_CONTROL is not set
+CONFIG_CONSOLE_EARLYSUSPEND=3Dy
+# CONFIG_FB_EARLYSUSPEND is not set
+# CONFIG_APM_EMULATION is not set
+CONFIG_ARCH_SUSPEND_POSSIBLE=3Dy
+CONFIG_NET=3Dy
+
+#
+# Networking options
+#
+CONFIG_PACKET=3Dy
+# CONFIG_PACKET_MMAP is not set
+CONFIG_UNIX=3Dy
+# CONFIG_NET_KEY is not set
+CONFIG_INET=3Dy
+# CONFIG_IP_MULTICAST is not set
+# CONFIG_IP_ADVANCED_ROUTER is not set
+CONFIG_IP_FIB_HASH=3Dy
+# CONFIG_IP_PNP is not set
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
+# CONFIG_TCP_CONG_ADVANCED is not set
+CONFIG_TCP_CONG_CUBIC=3Dy
+CONFIG_DEFAULT_TCP_CONG=3D"cubic"
+# CONFIG_TCP_MD5SIG is not set
+# CONFIG_IPV6 is not set
+CONFIG_ANDROID_PARANOID_NETWORK=3Dy
+# CONFIG_NETWORK_SECMARK is not set
+# CONFIG_NETFILTER is not set
+# CONFIG_IP_DCCP is not set
+# CONFIG_IP_SCTP is not set
+# CONFIG_TIPC is not set
+# CONFIG_ATM is not set
+# CONFIG_BRIDGE is not set
+# CONFIG_VLAN_8021Q is not set
+# CONFIG_DECNET is not set
+# CONFIG_LLC2 is not set
+# CONFIG_IPX is not set
+# CONFIG_ATALK is not set
+# CONFIG_X25 is not set
+# CONFIG_LAPB is not set
+# CONFIG_ECONET is not set
+# CONFIG_WAN_ROUTER is not set
+# CONFIG_NET_SCHED is not set
+
+#
+# Network testing
+#
+# CONFIG_NET_PKTGEN is not set
+# CONFIG_HAMRADIO is not set
+# CONFIG_CAN is not set
+# CONFIG_IRDA is not set
+# CONFIG_BT is not set
+# CONFIG_AF_RXRPC is not set
+
+#
+# Wireless
+#
+# CONFIG_CFG80211 is not set
+CONFIG_WIRELESS_EXT=3Dy
+CONFIG_WIRELESS_EXT_SYSFS=3Dy
+# CONFIG_MAC80211 is not set
+CONFIG_IEEE80211=3Dy
+# CONFIG_IEEE80211_DEBUG is not set
+# CONFIG_IEEE80211_CRYPT_WEP is not set
+# CONFIG_IEEE80211_CRYPT_CCMP is not set
+# CONFIG_IEEE80211_CRYPT_TKIP is not set
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
+CONFIG_UEVENT_HELPER_PATH=3D""
+CONFIG_STANDALONE=3Dy
+CONFIG_PREVENT_FIRMWARE_BUILD=3Dy
+CONFIG_FW_LOADER=3Dy
+CONFIG_FIRMWARE_IN_KERNEL=3Dy
+CONFIG_EXTRA_FIRMWARE=3D""
+# CONFIG_DEBUG_DRIVER is not set
+# CONFIG_DEBUG_DEVRES is not set
+# CONFIG_SYS_HYPERVISOR is not set
+# CONFIG_CONNECTOR is not set
+# CONFIG_MTD is not set
+# CONFIG_PARPORT is not set
+CONFIG_BLK_DEV=3Dy
+# CONFIG_BLK_DEV_COW_COMMON is not set
+CONFIG_BLK_DEV_LOOP=3Dy
+# CONFIG_BLK_DEV_CRYPTOLOOP is not set
+# CONFIG_BLK_DEV_NBD is not set
+# CONFIG_BLK_DEV_RAM is not set
+# CONFIG_CDROM_PKTCDVD is not set
+# CONFIG_ATA_OVER_ETH is not set
+CONFIG_MISC_DEVICES=3Dy
+CONFIG_ANDROID_PMEM=3Dy
+CONFIG_TIMED_OUTPUT=3Dy
+CONFIG_TIMED_GPIO=3Dy
+CONFIG_BINDER_IPC=3Dy
+# CONFIG_EEPROM_93CX6 is not set
+# CONFIG_ENCLOSURE_SERVICES is not set
+CONFIG_KERNEL_DEBUGGER_CORE=3Dy
+CONFIG_LOW_MEMORY_KILLER=3Dy
+CONFIG_LOGGER=3Dy
+# CONFIG_UID_STAT is not set
+# CONFIG_ANDROID_RAM_CONSOLE is not set
+CONFIG_HAVE_IDE=3Dy
+# CONFIG_IDE is not set
+
+#
+# SCSI device support
+#
+# CONFIG_RAID_ATTRS is not set
+# CONFIG_SCSI is not set
+# CONFIG_SCSI_DMA is not set
+# CONFIG_SCSI_NETLINK is not set
+# CONFIG_ATA is not set
+# CONFIG_MD is not set
+CONFIG_NETDEVICES=3Dy
+CONFIG_DUMMY=3Dy
+# CONFIG_BONDING is not set
+# CONFIG_MACVLAN is not set
+# CONFIG_EQUALIZER is not set
+# CONFIG_TUN is not set
+# CONFIG_VETH is not set
+# CONFIG_PHYLIB is not set
+CONFIG_NET_ETHERNET=3Dy
+CONFIG_MII=3Dy
+# CONFIG_AX88796 is not set
+# CONFIG_SMC91X is not set
+# CONFIG_DM9000 is not set
+# CONFIG_IBM_NEW_EMAC_ZMII is not set
+# CONFIG_IBM_NEW_EMAC_RGMII is not set
+# CONFIG_IBM_NEW_EMAC_TAH is not set
+# CONFIG_IBM_NEW_EMAC_EMAC4 is not set
+# CONFIG_B44 is not set
+CONFIG_NETDEV_1000=3Dy
+CONFIG_NETDEV_10000=3Dy
+
+#
+# Wireless LAN
+#
+# CONFIG_WLAN_PRE80211 is not set
+CONFIG_WLAN_80211=3Dy
+# CONFIG_LIBERTAS is not set
+# CONFIG_IWLWIFI_LEDS is not set
+# CONFIG_HOSTAP is not set
+# CONFIG_WAN is not set
+CONFIG_PPP=3Dy
+# CONFIG_PPP_MULTILINK is not set
+# CONFIG_PPP_FILTER is not set
+CONFIG_PPP_ASYNC=3Dy
+# CONFIG_PPP_SYNC_TTY is not set
+CONFIG_PPP_DEFLATE=3Dy
+CONFIG_PPP_BSDCOMP=3Dy
+# CONFIG_PPP_MPPE is not set
+# CONFIG_PPPOE is not set
+# CONFIG_PPPOL2TP is not set
+# CONFIG_SLIP is not set
+CONFIG_SLHC=3Dy
+# CONFIG_NETCONSOLE is not set
+CONFIG_MSM_RMNET=3Dy
+# CONFIG_NETPOLL is not set
+# CONFIG_NET_POLL_CONTROLLER is not set
+# CONFIG_ISDN is not set
+
+#
+# Input device support
+#
+CONFIG_INPUT=3Dy
+# CONFIG_INPUT_FF_MEMLESS is not set
+# CONFIG_INPUT_POLLDEV is not set
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
+# CONFIG_INPUT_KEYRESET is not set
+
+#
+# Input Device Drivers
+#
+CONFIG_INPUT_KEYBOARD=3Dy
+# CONFIG_KEYBOARD_ATKBD is not set
+# CONFIG_KEYBOARD_SUNKBD is not set
+# CONFIG_KEYBOARD_LKKBD is not set
+# CONFIG_KEYBOARD_XTKBD is not set
+# CONFIG_KEYBOARD_NEWTON is not set
+# CONFIG_KEYBOARD_STOWAWAY is not set
+CONFIG_KEYBOARD_GPIO=3Dy
+CONFIG_KEYBOARD_MICROP_KEYPAD=3Dy
+# CONFIG_INPUT_MOUSE is not set
+# CONFIG_INPUT_JOYSTICK is not set
+# CONFIG_INPUT_TABLET is not set
+CONFIG_INPUT_TOUCHSCREEN=3Dy
+# CONFIG_TOUCHSCREEN_FUJITSU is not set
+# CONFIG_TOUCHSCREEN_GUNZE is not set
+# CONFIG_TOUCHSCREEN_ELAN_I2C_8232 is not set
+# CONFIG_TOUCHSCREEN_ELO is not set
+# CONFIG_TOUCHSCREEN_MTOUCH is not set
+# CONFIG_TOUCHSCREEN_INEXIO is not set
+# CONFIG_TOUCHSCREEN_MK712 is not set
+# CONFIG_TOUCHSCREEN_PENMOUNT is not set
+CONFIG_TOUCHSCREEN_SYNAPTICS_I2C_RMI=3Dy
+# CONFIG_TOUCHSCREEN_TOUCHRIGHT is not set
+# CONFIG_TOUCHSCREEN_TOUCHWIN is not set
+# CONFIG_TOUCHSCREEN_UCB1400 is not set
+# CONFIG_TOUCHSCREEN_USB_COMPOSITE is not set
+# CONFIG_TOUCHSCREEN_TOUCHIT213 is not set
+CONFIG_TOUCHSCREEN_MSM=3Dy
+CONFIG_MSM_VIRTUAL_KEYBOARD=3Dy
+CONFIG_MSM_BLACKSTONE_PAD=3Dy
+CONFIG_INPUT_MISC=3Dy
+# CONFIG_INPUT_ATI_REMOTE is not set
+# CONFIG_INPUT_ATI_REMOTE2 is not set
+# CONFIG_INPUT_KEYSPAN_REMOTE is not set
+# CONFIG_INPUT_POWERMATE is not set
+# CONFIG_INPUT_YEALINK is not set
+# CONFIG_INPUT_UINPUT is not set
+CONFIG_INPUT_GPIO=3Dy
+# CONFIG_INPUT_KEYCHORD is not set
+
+#
+# Hardware I/O ports
+#
+# CONFIG_SERIO is not set
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
+# CONFIG_DEVMEM is not set
+CONFIG_DEVKMEM=3Dy
+# CONFIG_SERIAL_NONSTANDARD is not set
+
+#
+# Serial drivers
+#
+# CONFIG_SERIAL_8250 is not set
+
+#
+# Non-8250 serial port support
+#
+CONFIG_SERIAL_CORE=3Dy
+CONFIG_SERIAL_CORE_CONSOLE=3Dy
+CONFIG_SERIAL_MSM=3Dy
+CONFIG_SERIAL_MSM_CONSOLE=3Dy
+CONFIG_SERIAL_MSM_CLOCK_CONTROL=3Dy
+CONFIG_SERIAL_MSM_RX_WAKEUP=3Dy
+# CONFIG_SERIAL_MSM_HS is not set
+CONFIG_UNIX98_PTYS=3Dy
+# CONFIG_LEGACY_PTYS is not set
+# CONFIG_IPMI_HANDLER is not set
+# CONFIG_HW_RANDOM is not set
+# CONFIG_NVRAM is not set
+# CONFIG_R3964 is not set
+# CONFIG_RAW_DRIVER is not set
+# CONFIG_TCG_TPM is not set
+# CONFIG_DCC_TTY is not set
+CONFIG_I2C=3Dy
+CONFIG_I2C_BOARDINFO=3Dy
+# CONFIG_I2C_CHARDEV is not set
+CONFIG_I2C_HELPER_AUTO=3Dy
+
+#
+# I2C Hardware Bus support
+#
+
+#
+# I2C system bus drivers (mostly embedded / system-on-chip)
+#
+# CONFIG_I2C_GPIO is not set
+CONFIG_I2C_MSM=3Dy
+# CONFIG_I2C_OCORES is not set
+# CONFIG_I2C_SIMTEC is not set
+
+#
+# External I2C/SMBus adapter drivers
+#
+# CONFIG_I2C_PARPORT_LIGHT is not set
+# CONFIG_I2C_TAOS_EVM is not set
+
+#
+# Other I2C/SMBus bus drivers
+#
+# CONFIG_I2C_PCA_PLATFORM is not set
+# CONFIG_I2C_STUB is not set
+
+#
+# Miscellaneous I2C Chip support
+#
+# CONFIG_DS1682 is not set
+# CONFIG_AT24 is not set
+# CONFIG_SENSORS_EEPROM is not set
+# CONFIG_SENSORS_PCF8574 is not set
+# CONFIG_PCF8575 is not set
+# CONFIG_SENSORS_PCA9539 is not set
+# CONFIG_SENSORS_PCF8591 is not set
+# CONFIG_SENSORS_MAX6875 is not set
+# CONFIG_SENSORS_TSL2550 is not set
+# CONFIG_SENSORS_AKM8976 is not set
+CONFIG_SENSORS_PCA963X=3Dy
+# CONFIG_SENSORS_MT9T013 is not set
+CONFIG_SENSORS_MICROP_KSC=3Dy
+CONFIG_SENSORS_MICROP_KLT=3Dy
+# CONFIG_I2C_DEBUG_CORE is not set
+# CONFIG_I2C_DEBUG_ALGO is not set
+# CONFIG_I2C_DEBUG_BUS is not set
+# CONFIG_I2C_DEBUG_CHIP is not set
+# CONFIG_SPI is not set
+# CONFIG_W1 is not set
+CONFIG_POWER_SUPPLY=3Dy
+# CONFIG_POWER_SUPPLY_DEBUG is not set
+# CONFIG_PDA_POWER is not set
+# CONFIG_BATTERY_DS2760 is not set
+# CONFIG_HWMON is not set
+# CONFIG_WATCHDOG is not set
+
+#
+# Sonics Silicon Backplane
+#
+CONFIG_SSB_POSSIBLE=3Dy
+# CONFIG_SSB is not set
+
+#
+# Multifunction device drivers
+#
+# CONFIG_MFD_CORE is not set
+# CONFIG_MFD_SM501 is not set
+# CONFIG_HTC_PASIC3 is not set
+# CONFIG_MFD_TMIO is not set
+# CONFIG_MFD_T7L66XB is not set
+# CONFIG_MFD_TC6387XB is not set
+
+#
+# Multimedia devices
+#
+
+#
+# Multimedia core support
+#
+# CONFIG_VIDEO_DEV is not set
+# CONFIG_DVB_CORE is not set
+# CONFIG_VIDEO_MEDIA is not set
+
+#
+# Multimedia drivers
+#
+CONFIG_DAB=3Dy
+
+#
+# Graphics support
+#
+# CONFIG_VGASTATE is not set
+CONFIG_VIDEO_OUTPUT_CONTROL=3Dy
+CONFIG_FB=3Dy
+# CONFIG_FIRMWARE_EDID is not set
+# CONFIG_FB_DDC is not set
+CONFIG_FB_CFB_FILLRECT=3Dy
+CONFIG_FB_CFB_COPYAREA=3Dy
+CONFIG_FB_CFB_IMAGEBLIT=3Dy
+# CONFIG_FB_CFB_REV_PIXELS_IN_BYTE is not set
+# CONFIG_FB_SYS_FILLRECT is not set
+# CONFIG_FB_SYS_COPYAREA is not set
+# CONFIG_FB_SYS_IMAGEBLIT is not set
+# CONFIG_FB_FOREIGN_ENDIAN is not set
+# CONFIG_FB_SYS_FOPS is not set
+CONFIG_FB_MSM=3Dy
+CONFIG_FB_MSM_REFRESH=3Dy
+# CONFIG_FB_SVGALIB is not set
+# CONFIG_FB_MACMODES is not set
+# CONFIG_FB_BACKLIGHT is not set
+CONFIG_FB_MODE_HELPERS=3Dy
+CONFIG_FB_TILEBLITTING=3Dy
+
+#
+# Frame buffer hardware drivers
+#
+# CONFIG_FB_S1D13XXX is not set
+# CONFIG_FB_VIRTUAL is not set
+# CONFIG_BACKLIGHT_LCD_SUPPORT is not set
+
+#
+# Display device support
+#
+# CONFIG_DISPLAY_SUPPORT is not set
+
+#
+# Console display driver support
+#
+# CONFIG_VGA_CONSOLE is not set
+CONFIG_DUMMY_CONSOLE=3Dy
+CONFIG_FRAMEBUFFER_CONSOLE=3Dy
+# CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY is not set
+# CONFIG_FRAMEBUFFER_CONSOLE_ROTATION is not set
+CONFIG_FONTS=3Dy
+CONFIG_FONT_8x8=3Dy
+# CONFIG_FONT_8x16 is not set
+# CONFIG_FONT_6x11 is not set
+# CONFIG_FONT_7x14 is not set
+# CONFIG_FONT_PEARL_8x8 is not set
+# CONFIG_FONT_ACORN_8x8 is not set
+# CONFIG_FONT_MINI_4x6 is not set
+# CONFIG_FONT_SUN8x16 is not set
+# CONFIG_FONT_SUN12x22 is not set
+# CONFIG_FONT_10x18 is not set
+CONFIG_LOGO=3Dy
+# CONFIG_LOGO_LINUX_MONO is not set
+# CONFIG_LOGO_LINUX_VGA16 is not set
+CONFIG_LOGO_LINUX_CLUT224=3Dy
+# CONFIG_LOGO_DIAMRAPH_CLUT224 is not set
+# CONFIG_SOUND is not set
+CONFIG_HID_SUPPORT=3Dy
+CONFIG_HID=3Dy
+# CONFIG_HID_DEBUG is not set
+# CONFIG_HIDRAW is not set
+CONFIG_USB_SUPPORT=3Dy
+CONFIG_USB_ARCH_HAS_HCD=3Dy
+# CONFIG_USB_ARCH_HAS_OHCI is not set
+# CONFIG_USB_ARCH_HAS_EHCI is not set
+# CONFIG_USB is not set
+
+#
+# Enable Host or Gadget support to see Inventra options
+#
+
+#
+# NOTE: USB_STORAGE enables SCSI, and 'SCSI disk support'
+#
+# CONFIG_USB_GADGET is not set
+
+#
+# USB Function Support
+#
+CONFIG_USB_FUNCTION=3Dy
+CONFIG_USB_FUNCTION_MSM_HSUSB=3Dy
+# CONFIG_USB_FUNCTION_NULL is not set
+# CONFIG_USB_FUNCTION_ZERO is not set
+# CONFIG_USB_FUNCTION_LOOPBACK is not set
+CONFIG_USB_FUNCTION_ADB=3Dy
+# CONFIG_USB_FUNCTION_UMS is not set
+CONFIG_USB_FUNCTION_MASS_STORAGE=3Dy
+CONFIG_USB_FUNCTION_DIAG=3Dy
+CONFIG_USB_FUNCTION_ETHER=3Dy
+CONFIG_MMC=3Dy
+# CONFIG_MMC_DEBUG is not set
+CONFIG_MMC_UNSAFE_RESUME=3Dy
+CONFIG_MMC_EMBEDDED_SDIO=3Dy
+# CONFIG_MMC_PARANOID_SD_INIT is not set
+
+#
+# MMC/SD Card Drivers
+#
+CONFIG_MMC_BLOCK=3Dy
+# CONFIG_MMC_BLOCK_BOUNCE is not set
+CONFIG_MMC_BLOCK_PARANOID_RESUME=3Dy
+# CONFIG_SDIO_UART is not set
+# CONFIG_MMC_TEST is not set
+
+#
+# MMC/SD Host Controller Drivers
+#
+CONFIG_MMC_SDHCI=3Dy
+CONFIG_MMC_MSM7X00A=3Dy
+# CONFIG_MMC_MSM7X00A_RESUME_IN_WQ is not set
+CONFIG_NEW_LEDS=3Dy
+CONFIG_LEDS_CLASS=3Dy
+
+#
+# LED drivers
+#
+# CONFIG_LEDS_PCA9532 is not set
+CONFIG_LEDS_GPIO=3Dy
+# CONFIG_LEDS_PCA955X is not set
+
+#
+# LED Triggers
+#
+CONFIG_LEDS_TRIGGERS=3Dy
+CONFIG_LEDS_TRIGGER_TIMER=3Dy
+CONFIG_LEDS_TRIGGER_HEARTBEAT=3Dy
+# CONFIG_LEDS_TRIGGER_DEFAULT_ON is not set
+# CONFIG_LEDS_TRIGGER_SLEEP is not set
+CONFIG_SWITCH=3Dy
+CONFIG_SWITCH_GPIO=3Dy
+CONFIG_RTC_LIB=3Dy
+CONFIG_RTC_CLASS=3Dy
+CONFIG_RTC_HCTOSYS=3Dy
+CONFIG_RTC_HCTOSYS_DEVICE=3D"rtc0"
+# CONFIG_RTC_DEBUG is not set
+
+#
+# RTC interfaces
+#
+# CONFIG_RTC_INTF_SYSFS is not set
+# CONFIG_RTC_INTF_PROC is not set
+# CONFIG_RTC_INTF_DEV is not set
+CONFIG_RTC_INTF_ALARM=3Dy
+# CONFIG_RTC_DRV_TEST is not set
+
+#
+# I2C RTC drivers
+#
+# CONFIG_RTC_DRV_DS1307 is not set
+# CONFIG_RTC_DRV_DS1374 is not set
+# CONFIG_RTC_DRV_DS1672 is not set
+# CONFIG_RTC_DRV_MAX6900 is not set
+# CONFIG_RTC_DRV_RS5C372 is not set
+# CONFIG_RTC_DRV_ISL1208 is not set
+# CONFIG_RTC_DRV_X1205 is not set
+# CONFIG_RTC_DRV_PCF8563 is not set
+# CONFIG_RTC_DRV_PCF8583 is not set
+# CONFIG_RTC_DRV_M41T80 is not set
+# CONFIG_RTC_DRV_S35390A is not set
+# CONFIG_RTC_DRV_FM3130 is not set
+
+#
+# SPI RTC drivers
+#
+
+#
+# Platform RTC drivers
+#
+# CONFIG_RTC_DRV_CMOS is not set
+# CONFIG_RTC_DRV_DS1511 is not set
+# CONFIG_RTC_DRV_DS1553 is not set
+# CONFIG_RTC_DRV_DS1742 is not set
+# CONFIG_RTC_DRV_STK17TA8 is not set
+# CONFIG_RTC_DRV_M48T86 is not set
+# CONFIG_RTC_DRV_M48T59 is not set
+# CONFIG_RTC_DRV_V3020 is not set
+
+#
+# on-CPU RTC drivers
+#
+# CONFIG_RTC_DRV_MSM7X00A is not set
+CONFIG_RTC_DRV_MSM7X01A=3Dy
+# CONFIG_DMADEVICES is not set
+
+#
+# Voltage and Current regulators
+#
+# CONFIG_REGULATOR is not set
+# CONFIG_REGULATOR_FIXED_VOLTAGE is not set
+# CONFIG_REGULATOR_VIRTUAL_CONSUMER is not set
+# CONFIG_REGULATOR_BQ24022 is not set
+# CONFIG_UIO is not set
+
+#
+# File systems
+#
+CONFIG_EXT2_FS=3Dy
+# CONFIG_EXT2_FS_XATTR is not set
+# CONFIG_EXT2_FS_XIP is not set
+CONFIG_EXT3_FS=3Dy
+CONFIG_EXT3_FS_XATTR=3Dy
+# CONFIG_EXT3_FS_POSIX_ACL is not set
+# CONFIG_EXT3_FS_SECURITY is not set
+# CONFIG_EXT4DEV_FS is not set
+CONFIG_JBD=3Dy
+# CONFIG_JBD_DEBUG is not set
+CONFIG_FS_MBCACHE=3Dy
+# CONFIG_REISERFS_FS is not set
+# CONFIG_JFS_FS is not set
+# CONFIG_FS_POSIX_ACL is not set
+# CONFIG_XFS_FS is not set
+# CONFIG_OCFS2_FS is not set
+# CONFIG_DNOTIFY is not set
+CONFIG_INOTIFY=3Dy
+CONFIG_INOTIFY_USER=3Dy
+# CONFIG_QUOTA is not set
+# CONFIG_AUTOFS_FS is not set
+# CONFIG_AUTOFS4_FS is not set
+# CONFIG_FUSE_FS is not set
+
+#
+# CD-ROM/DVD Filesystems
+#
+# CONFIG_ISO9660_FS is not set
+# CONFIG_UDF_FS is not set
+
+#
+# DOS/FAT/NT Filesystems
+#
+CONFIG_FAT_FS=3Dy
+# CONFIG_MSDOS_FS is not set
+CONFIG_VFAT_FS=3Dy
+CONFIG_FAT_DEFAULT_CODEPAGE=3D437
+CONFIG_FAT_DEFAULT_IOCHARSET=3D"iso8859-1"
+# CONFIG_NTFS_FS is not set
+
+#
+# Pseudo filesystems
+#
+CONFIG_PROC_FS=3Dy
+CONFIG_PROC_SYSCTL=3Dy
+CONFIG_SYSFS=3Dy
+CONFIG_TMPFS=3Dy
+# CONFIG_TMPFS_POSIX_ACL is not set
+# CONFIG_HUGETLB_PAGE is not set
+# CONFIG_CONFIGFS_FS is not set
+
+#
+# Miscellaneous filesystems
+#
+# CONFIG_ADFS_FS is not set
+# CONFIG_AFFS_FS is not set
+# CONFIG_HFS_FS is not set
+# CONFIG_HFSPLUS_FS is not set
+# CONFIG_BEFS_FS is not set
+# CONFIG_BFS_FS is not set
+# CONFIG_EFS_FS is not set
+# CONFIG_CRAMFS is not set
+# CONFIG_VXFS_FS is not set
+# CONFIG_MINIX_FS is not set
+# CONFIG_OMFS_FS is not set
+# CONFIG_HPFS_FS is not set
+# CONFIG_QNX4FS_FS is not set
+# CONFIG_ROMFS_FS is not set
+# CONFIG_SYSV_FS is not set
+# CONFIG_UFS_FS is not set
+CONFIG_NETWORK_FILESYSTEMS=3Dy
+# CONFIG_NFS_FS is not set
+# CONFIG_NFSD is not set
+# CONFIG_SMB_FS is not set
+# CONFIG_CIFS is not set
+# CONFIG_NCP_FS is not set
+# CONFIG_CODA_FS is not set
+# CONFIG_AFS_FS is not set
+
+#
+# Partition Types
+#
+# CONFIG_PARTITION_ADVANCED is not set
+CONFIG_MSDOS_PARTITION=3Dy
+CONFIG_NLS=3Dy
+CONFIG_NLS_DEFAULT=3D"iso8859-1"
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
+# CONFIG_NLS_ASCII is not set
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
+# CONFIG_NLS_UTF8 is not set
+# CONFIG_DLM is not set
+
+#
+# Kernel hacking
+#
+CONFIG_PRINTK_TIME=3Dy
+CONFIG_ENABLE_WARN_DEPRECATED=3Dy
+CONFIG_ENABLE_MUST_CHECK=3Dy
+CONFIG_FRAME_WARN=3D1024
+CONFIG_MAGIC_SYSRQ=3Dy
+# CONFIG_UNUSED_SYMBOLS is not set
+CONFIG_DEBUG_FS=3Dy
+# CONFIG_HEADERS_CHECK is not set
+CONFIG_DEBUG_KERNEL=3Dy
+# CONFIG_DEBUG_SHIRQ is not set
+CONFIG_DETECT_SOFTLOCKUP=3Dy
+# CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC is not set
+CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC_VALUE=3D0
+CONFIG_SCHED_DEBUG=3Dy
+CONFIG_SCHEDSTATS=3Dy
+# CONFIG_TIMER_STATS is not set
+# CONFIG_DEBUG_OBJECTS is not set
+# CONFIG_DEBUG_SLAB is not set
+CONFIG_DEBUG_PREEMPT=3Dy
+# CONFIG_DEBUG_RT_MUTEXES is not set
+# CONFIG_RT_MUTEX_TESTER is not set
+# CONFIG_DEBUG_SPINLOCK is not set
+CONFIG_DEBUG_MUTEXES=3Dy
+# CONFIG_DEBUG_LOCK_ALLOC is not set
+# CONFIG_PROVE_LOCKING is not set
+# CONFIG_LOCK_STAT is not set
+CONFIG_DEBUG_SPINLOCK_SLEEP=3Dy
+# CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
+# CONFIG_DEBUG_KOBJECT is not set
+CONFIG_DEBUG_BUGVERBOSE=3Dy
+CONFIG_DEBUG_INFO=3Dy
+# CONFIG_DEBUG_VM is not set
+# CONFIG_DEBUG_WRITECOUNT is not set
+CONFIG_DEBUG_MEMORY_INIT=3Dy
+# CONFIG_DEBUG_LIST is not set
+# CONFIG_DEBUG_SG is not set
+CONFIG_FRAME_POINTER=3Dy
+# CONFIG_BOOT_PRINTK_DELAY is not set
+# CONFIG_RCU_TORTURE_TEST is not set
+# CONFIG_BACKTRACE_SELF_TEST is not set
+# CONFIG_FAULT_INJECTION is not set
+# CONFIG_LATENCYTOP is not set
+# CONFIG_SYSCTL_SYSCALL_CHECK is not set
+CONFIG_HAVE_FTRACE=3Dy
+CONFIG_HAVE_DYNAMIC_FTRACE=3Dy
+# CONFIG_FTRACE is not set
+# CONFIG_IRQSOFF_TRACER is not set
+# CONFIG_PREEMPT_TRACER is not set
+# CONFIG_SCHED_TRACER is not set
+# CONFIG_CONTEXT_SWITCH_TRACER is not set
+# CONFIG_SAMPLES is not set
+CONFIG_HAVE_ARCH_KGDB=3Dy
+# CONFIG_KGDB is not set
+# CONFIG_DEBUG_USER is not set
+# CONFIG_DEBUG_ERRORS is not set
+# CONFIG_DEBUG_STACK_USAGE is not set
+CONFIG_DEBUG_LL=3Dy
+# CONFIG_DEBUG_ICEDCC is not set
+
+#
+# Security options
+#
+# CONFIG_KEYS is not set
+# CONFIG_SECURITY is not set
+# CONFIG_SECURITY_FILE_CAPABILITIES is not set
+# CONFIG_CRYPTO is not set
+
+#
+# Library routines
+#
+CONFIG_BITREVERSE=3Dy
+# CONFIG_GENERIC_FIND_FIRST_BIT is not set
+# CONFIG_GENERIC_FIND_NEXT_BIT is not set
+CONFIG_CRC_CCITT=3Dy
+# CONFIG_CRC16 is not set
+# CONFIG_CRC_T10DIF is not set
+# CONFIG_CRC_ITU_T is not set
+CONFIG_CRC32=3Dy
+# CONFIG_CRC7 is not set
+# CONFIG_LIBCRC32C is not set
+CONFIG_ZLIB_INFLATE=3Dy
+CONFIG_ZLIB_DEFLATE=3Dy
+CONFIG_PLIST=3Dy
+CONFIG_HAS_IOMEM=3Dy
+CONFIG_HAS_IOPORT=3Dy
+CONFIG_HAS_DMA=3Dy
diff --git a/recipes/linux/linux-replicant/htcdiamond/defconfig b/recipes/l=
inux/linux-replicant/htcdiamond/defconfig
new file mode 100644
index 0000000..64a6044
--- /dev/null
+++ b/recipes/linux/linux-replicant/htcdiamond/defconfig
@@ -0,0 +1,1130 @@
+#
+# Automatically generated make config: don't edit
+# Linux kernel version: 2.6.27
+# Wed Feb 25 00:43:45 2009
+#
+CONFIG_ARM=3Dy
+CONFIG_SYS_SUPPORTS_APM_EMULATION=3Dy
+CONFIG_GENERIC_GPIO=3Dy
+CONFIG_GENERIC_TIME=3Dy
+CONFIG_GENERIC_CLOCKEVENTS=3Dy
+CONFIG_MMU=3Dy
+# CONFIG_NO_IOPORT is not set
+CONFIG_GENERIC_HARDIRQS=3Dy
+CONFIG_STACKTRACE_SUPPORT=3Dy
+CONFIG_HAVE_LATENCYTOP_SUPPORT=3Dy
+CONFIG_LOCKDEP_SUPPORT=3Dy
+CONFIG_TRACE_IRQFLAGS_SUPPORT=3Dy
+CONFIG_HARDIRQS_SW_RESEND=3Dy
+CONFIG_GENERIC_IRQ_PROBE=3Dy
+CONFIG_RWSEM_GENERIC_SPINLOCK=3Dy
+# CONFIG_ARCH_HAS_ILOG2_U32 is not set
+# CONFIG_ARCH_HAS_ILOG2_U64 is not set
+CONFIG_GENERIC_HWEIGHT=3Dy
+CONFIG_GENERIC_CALIBRATE_DELAY=3Dy
+CONFIG_ARCH_SUPPORTS_AOUT=3Dy
+CONFIG_ZONE_DMA=3Dy
+CONFIG_GENERIC_HARDIRQS_NO__DO_IRQ=3Dy
+CONFIG_VECTORS_BASE=3D0xffff0000
+CONFIG_DEFCONFIG_LIST=3D"/lib/modules/$UNAME_RELEASE/.config"
+
+#
+# General setup
+#
+CONFIG_EXPERIMENTAL=3Dy
+CONFIG_BROKEN_ON_SMP=3Dy
+CONFIG_LOCK_KERNEL=3Dy
+CONFIG_INIT_ENV_ARG_LIMIT=3D32
+CONFIG_LOCALVERSION=3D""
+CONFIG_LOCALVERSION_AUTO=3Dy
+CONFIG_SWAP=3Dy
+# CONFIG_SYSVIPC is not set
+# CONFIG_POSIX_MQUEUE is not set
+# CONFIG_BSD_PROCESS_ACCT is not set
+# CONFIG_TASKSTATS is not set
+# CONFIG_AUDIT is not set
+CONFIG_IKCONFIG=3Dy
+CONFIG_IKCONFIG_PROC=3Dy
+CONFIG_LOG_BUF_SHIFT=3D17
+# CONFIG_CGROUPS is not set
+CONFIG_GROUP_SCHED=3Dy
+# CONFIG_FAIR_GROUP_SCHED is not set
+# CONFIG_RT_GROUP_SCHED is not set
+CONFIG_USER_SCHED=3Dy
+# CONFIG_CGROUP_SCHED is not set
+CONFIG_SYSFS_DEPRECATED=3Dy
+CONFIG_SYSFS_DEPRECATED_V2=3Dy
+# CONFIG_RELAY is not set
+CONFIG_NAMESPACES=3Dy
+# CONFIG_UTS_NS is not set
+# CONFIG_USER_NS is not set
+# CONFIG_PID_NS is not set
+CONFIG_BLK_DEV_INITRD=3Dy
+CONFIG_INITRAMFS_SOURCE=3D""
+CONFIG_CC_OPTIMIZE_FOR_SIZE=3Dy
+CONFIG_SYSCTL=3Dy
+CONFIG_PANIC_TIMEOUT=3D3
+# CONFIG_EMBEDDED is not set
+CONFIG_UID16=3Dy
+CONFIG_SYSCTL_SYSCALL=3Dy
+CONFIG_KALLSYMS=3Dy
+# CONFIG_KALLSYMS_ALL is not set
+# CONFIG_KALLSYMS_EXTRA_PASS is not set
+CONFIG_HOTPLUG=3Dy
+CONFIG_PRINTK=3Dy
+CONFIG_BUG=3Dy
+CONFIG_ELF_CORE=3Dy
+CONFIG_COMPAT_BRK=3Dy
+CONFIG_BASE_FULL=3Dy
+CONFIG_FUTEX=3Dy
+CONFIG_ANON_INODES=3Dy
+CONFIG_EPOLL=3Dy
+CONFIG_SIGNALFD=3Dy
+CONFIG_TIMERFD=3Dy
+CONFIG_EVENTFD=3Dy
+CONFIG_SHMEM=3Dy
+CONFIG_ASHMEM=3Dy
+CONFIG_VM_EVENT_COUNTERS=3Dy
+CONFIG_SLAB=3Dy
+# CONFIG_SLUB is not set
+# CONFIG_SLOB is not set
+# CONFIG_PROFILING is not set
+# CONFIG_MARKERS is not set
+CONFIG_HAVE_OPROFILE=3Dy
+# CONFIG_KPROBES is not set
+# CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS is not set
+# CONFIG_HAVE_IOREMAP_PROT is not set
+CONFIG_HAVE_KPROBES=3Dy
+CONFIG_HAVE_KRETPROBES=3Dy
+# CONFIG_HAVE_ARCH_TRACEHOOK is not set
+# CONFIG_HAVE_DMA_ATTRS is not set
+# CONFIG_USE_GENERIC_SMP_HELPERS is not set
+# CONFIG_HAVE_CLK is not set
+CONFIG_PROC_PAGE_MONITOR=3Dy
+CONFIG_HAVE_GENERIC_DMA_COHERENT=3Dy
+CONFIG_SLABINFO=3Dy
+CONFIG_RT_MUTEXES=3Dy
+# CONFIG_TINY_SHMEM is not set
+CONFIG_BASE_SMALL=3D0
+CONFIG_MODULES=3Dy
+# CONFIG_MODULE_FORCE_LOAD is not set
+CONFIG_MODULE_UNLOAD=3Dy
+CONFIG_MODULE_FORCE_UNLOAD=3Dy
+# CONFIG_MODVERSIONS is not set
+# CONFIG_MODULE_SRCVERSION_ALL is not set
+CONFIG_KMOD=3Dy
+CONFIG_BLOCK=3Dy
+# CONFIG_LBD is not set
+# CONFIG_BLK_DEV_IO_TRACE is not set
+# CONFIG_LSF is not set
+# CONFIG_BLK_DEV_BSG is not set
+# CONFIG_BLK_DEV_INTEGRITY is not set
+
+#
+# IO Schedulers
+#
+CONFIG_IOSCHED_NOOP=3Dy
+CONFIG_IOSCHED_AS=3Dy
+# CONFIG_IOSCHED_DEADLINE is not set
+# CONFIG_IOSCHED_CFQ is not set
+CONFIG_DEFAULT_AS=3Dy
+# CONFIG_DEFAULT_DEADLINE is not set
+# CONFIG_DEFAULT_CFQ is not set
+# CONFIG_DEFAULT_NOOP is not set
+CONFIG_DEFAULT_IOSCHED=3D"anticipatory"
+CONFIG_CLASSIC_RCU=3Dy
+
+#
+# System Type
+#
+# CONFIG_ARCH_AAEC2000 is not set
+# CONFIG_ARCH_INTEGRATOR is not set
+# CONFIG_ARCH_REALVIEW is not set
+# CONFIG_ARCH_VERSATILE is not set
+# CONFIG_ARCH_AT91 is not set
+# CONFIG_ARCH_CLPS7500 is not set
+# CONFIG_ARCH_CLPS711X is not set
+# CONFIG_ARCH_EBSA110 is not set
+# CONFIG_ARCH_EP93XX is not set
+# CONFIG_ARCH_FOOTBRIDGE is not set
+# CONFIG_ARCH_NETX is not set
+# CONFIG_ARCH_H720X is not set
+# CONFIG_ARCH_IMX is not set
+# CONFIG_ARCH_IOP13XX is not set
+# CONFIG_ARCH_IOP32X is not set
+# CONFIG_ARCH_IOP33X is not set
+# CONFIG_ARCH_IXP23XX is not set
+# CONFIG_ARCH_IXP2000 is not set
+# CONFIG_ARCH_IXP4XX is not set
+# CONFIG_ARCH_L7200 is not set
+# CONFIG_ARCH_KIRKWOOD is not set
+# CONFIG_ARCH_KS8695 is not set
+# CONFIG_ARCH_NS9XXX is not set
+# CONFIG_ARCH_LOKI is not set
+# CONFIG_ARCH_MV78XX0 is not set
+# CONFIG_ARCH_MXC is not set
+# CONFIG_ARCH_ORION5X is not set
+# CONFIG_ARCH_PNX4008 is not set
+# CONFIG_ARCH_PXA is not set
+# CONFIG_ARCH_RPC is not set
+# CONFIG_ARCH_SA1100 is not set
+# CONFIG_ARCH_S3C2410 is not set
+# CONFIG_ARCH_SHARK is not set
+# CONFIG_ARCH_LH7A40X is not set
+# CONFIG_ARCH_DAVINCI is not set
+# CONFIG_ARCH_OMAP is not set
+CONFIG_ARCH_MSM=3Dy
+
+#
+# Boot options
+#
+
+#
+# Power management
+#
+CONFIG_MSM_AMSS_VERSION=3D7000
+# CONFIG_MSM_AMSS_VERSION_6210 is not set
+# CONFIG_MSM_AMSS_VERSION_6220 is not set
+# CONFIG_MSM_AMSS_VERSION_6225 is not set
+CONFIG_MSM_AMSS_VERSION_WINCE=3Dy
+CONFIG_MSM_DEBUG_UART_NONE=3Dy
+# CONFIG_MSM_DEBUG_UART1 is not set
+# CONFIG_MSM_DEBUG_UART2 is not set
+# CONFIG_MSM_DEBUG_UART3 is not set
+
+#
+# MSM Board Type
+#
+# CONFIG_MACH_HALIBUT is not set
+# CONFIG_MACH_TROUT is not set
+CONFIG_MACH_HTCRAPHAEL=3Dy
+CONFIG_MACH_HTCRAPHAEL_CDMA=3Dy
+CONFIG_MACH_HTCDIAMOND=3Dy
+CONFIG_MACH_HTCDIAMOND_CDMA=3Dy
+# CONFIG_TROUT_H2W is not set
+# CONFIG_TROUT_PWRSINK is not set
+CONFIG_MSM7X00A_USE_GP_TIMER=3Dy
+# CONFIG_MSM7X00A_USE_DG_TIMER is not set
+CONFIG_MSM7X00A_SLEEP_MODE_POWER_COLLAPSE_SUSPEND=3Dy
+# CONFIG_MSM7X00A_SLEEP_MODE_POWER_COLLAPSE is not set
+# CONFIG_MSM7X00A_SLEEP_MODE_APPS_SLEEP is not set
+# CONFIG_MSM7X00A_SLEEP_MODE_RAMP_DOWN_AND_WAIT_FOR_INTERRUPT is not set
+# CONFIG_MSM7X00A_SLEEP_WAIT_FOR_INTERRUPT is not set
+CONFIG_MSM7X00A_SLEEP_MODE=3D0
+# CONFIG_MSM7X00A_IDLE_SLEEP_MODE_POWER_COLLAPSE_SUSPEND is not set
+CONFIG_MSM7X00A_IDLE_SLEEP_MODE_POWER_COLLAPSE=3Dy
+# CONFIG_MSM7X00A_IDLE_SLEEP_MODE_APPS_SLEEP is not set
+# CONFIG_MSM7X00A_IDLE_SLEEP_MODE_RAMP_DOWN_AND_WAIT_FOR_INTERRUPT is not =
set
+# CONFIG_MSM7X00A_IDLE_SLEEP_WAIT_FOR_INTERRUPT is not set
+CONFIG_MSM7X00A_IDLE_SLEEP_MODE=3D1
+CONFIG_MSM7X00A_IDLE_SLEEP_MIN_TIME=3D20000000
+CONFIG_MSM7X00A_IDLE_SPIN_TIME=3D80000
+CONFIG_MSM_IDLE_STATS=3Dy
+CONFIG_MSM_IDLE_STATS_FIRST_BUCKET=3D62500
+CONFIG_MSM_IDLE_STATS_BUCKET_SHIFT=3D2
+CONFIG_MSM_IDLE_STATS_BUCKET_COUNT=3D10
+CONFIG_MSM_FIQ_SUPPORT=3Dy
+# CONFIG_MSM_SERIAL_DEBUGGER is not set
+CONFIG_MSM_SMD=3Dy
+# CONFIG_MSM_ONCRPCROUTER is not set
+# CONFIG_MSM_CPU_FREQ_ONDEMAND is not set
+# CONFIG_MSM_CPU_FREQ_SCREEN is not set
+CONFIG_MSM_HW3D=3Dy
+# CONFIG_MSM_ADSP is not set
+CONFIG_HTC_FB_CONSOLE=3Dy
+# CONFIG_HTC_FB_CONSOLE_DELAY is not set
+CONFIG_HTC_FB_CONSOLE_BOOT=3Dy
+# CONFIG_WIFI_CONTROL_FUNC is not set
+
+#
+# Processor Type
+#
+CONFIG_CPU_32=3Dy
+CONFIG_CPU_V6=3Dy
+# CONFIG_CPU_32v6K is not set
+CONFIG_CPU_32v6=3Dy
+CONFIG_CPU_ABRT_EV6=3Dy
+CONFIG_CPU_PABRT_NOIFAR=3Dy
+CONFIG_CPU_CACHE_V6=3Dy
+CONFIG_CPU_CACHE_VIPT=3Dy
+CONFIG_CPU_COPY_V6=3Dy
+CONFIG_CPU_TLB_V6=3Dy
+CONFIG_CPU_HAS_ASID=3Dy
+CONFIG_CPU_CP15=3Dy
+CONFIG_CPU_CP15_MMU=3Dy
+
+#
+# Processor Features
+#
+CONFIG_ARM_THUMB=3Dy
+# CONFIG_CPU_ICACHE_DISABLE is not set
+# CONFIG_CPU_DCACHE_DISABLE is not set
+# CONFIG_CPU_BPREDICT_DISABLE is not set
+# CONFIG_OUTER_CACHE is not set
+
+#
+# Bus support
+#
+# CONFIG_PCI_SYSCALL is not set
+# CONFIG_ARCH_SUPPORTS_MSI is not set
+# CONFIG_PCCARD is not set
+
+#
+# Kernel Features
+#
+CONFIG_TICK_ONESHOT=3Dy
+CONFIG_NO_HZ=3Dy
+CONFIG_HIGH_RES_TIMERS=3Dy
+CONFIG_GENERIC_CLOCKEVENTS_BUILD=3Dy
+CONFIG_PREEMPT=3Dy
+CONFIG_HZ=3D100
+CONFIG_AEABI=3Dy
+# CONFIG_OABI_COMPAT is not set
+CONFIG_ARCH_FLATMEM_HAS_HOLES=3Dy
+# CONFIG_ARCH_DISCONTIGMEM_ENABLE is not set
+CONFIG_SELECT_MEMORY_MODEL=3Dy
+CONFIG_FLATMEM_MANUAL=3Dy
+# CONFIG_DISCONTIGMEM_MANUAL is not set
+# CONFIG_SPARSEMEM_MANUAL is not set
+CONFIG_FLATMEM=3Dy
+CONFIG_FLAT_NODE_MEM_MAP=3Dy
+# CONFIG_SPARSEMEM_STATIC is not set
+# CONFIG_SPARSEMEM_VMEMMAP_ENABLE is not set
+CONFIG_PAGEFLAGS_EXTENDED=3Dy
+CONFIG_SPLIT_PTLOCK_CPUS=3D4
+CONFIG_RESOURCES_64BIT=3Dy
+CONFIG_ZONE_DMA_FLAG=3D1
+CONFIG_BOUNCE=3Dy
+CONFIG_VIRT_TO_BUS=3Dy
+CONFIG_ALIGNMENT_TRAP=3Dy
+
+#
+# Boot options
+#
+CONFIG_ZBOOT_ROM_TEXT=3D0x0
+CONFIG_ZBOOT_ROM_BSS=3D0x0
+CONFIG_CMDLINE=3D"mem=3D76M console=3DttyMSM2,115200n8"
+# CONFIG_XIP_KERNEL is not set
+# CONFIG_KEXEC is not set
+
+#
+# CPU Frequency scaling
+#
+# CONFIG_CPU_FREQ is not set
+
+#
+# Floating point emulation
+#
+
+#
+# At least one emulation must be selected
+#
+# CONFIG_VFP is not set
+
+#
+# Userspace binary formats
+#
+CONFIG_BINFMT_ELF=3Dy
+# CONFIG_BINFMT_AOUT is not set
+# CONFIG_BINFMT_MISC is not set
+
+#
+# Power management options
+#
+CONFIG_PM=3Dy
+# CONFIG_PM_DEBUG is not set
+CONFIG_PM_SLEEP=3Dy
+CONFIG_SUSPEND=3Dy
+CONFIG_SUSPEND_FREEZER=3Dy
+CONFIG_HAS_WAKELOCK=3Dy
+CONFIG_WAKELOCK=3Dy
+# CONFIG_WAKELOCK_STAT is not set
+CONFIG_USER_WAKELOCK=3Dy
+# CONFIG_EARLYSUSPEND is not set
+# CONFIG_APM_EMULATION is not set
+CONFIG_ARCH_SUSPEND_POSSIBLE=3Dy
+CONFIG_NET=3Dy
+
+#
+# Networking options
+#
+CONFIG_PACKET=3Dy
+# CONFIG_PACKET_MMAP is not set
+CONFIG_UNIX=3Dy
+# CONFIG_NET_KEY is not set
+CONFIG_INET=3Dy
+# CONFIG_IP_MULTICAST is not set
+# CONFIG_IP_ADVANCED_ROUTER is not set
+CONFIG_IP_FIB_HASH=3Dy
+# CONFIG_IP_PNP is not set
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
+# CONFIG_TCP_CONG_ADVANCED is not set
+CONFIG_TCP_CONG_CUBIC=3Dy
+CONFIG_DEFAULT_TCP_CONG=3D"cubic"
+# CONFIG_TCP_MD5SIG is not set
+# CONFIG_IPV6 is not set
+CONFIG_ANDROID_PARANOID_NETWORK=3Dy
+# CONFIG_NETWORK_SECMARK is not set
+# CONFIG_NETFILTER is not set
+# CONFIG_IP_DCCP is not set
+# CONFIG_IP_SCTP is not set
+# CONFIG_TIPC is not set
+# CONFIG_ATM is not set
+# CONFIG_BRIDGE is not set
+# CONFIG_VLAN_8021Q is not set
+# CONFIG_DECNET is not set
+# CONFIG_LLC2 is not set
+# CONFIG_IPX is not set
+# CONFIG_ATALK is not set
+# CONFIG_X25 is not set
+# CONFIG_LAPB is not set
+# CONFIG_ECONET is not set
+# CONFIG_WAN_ROUTER is not set
+# CONFIG_NET_SCHED is not set
+
+#
+# Network testing
+#
+# CONFIG_NET_PKTGEN is not set
+# CONFIG_HAMRADIO is not set
+# CONFIG_CAN is not set
+# CONFIG_IRDA is not set
+# CONFIG_BT is not set
+# CONFIG_AF_RXRPC is not set
+
+#
+# Wireless
+#
+# CONFIG_CFG80211 is not set
+CONFIG_WIRELESS_EXT=3Dy
+CONFIG_WIRELESS_EXT_SYSFS=3Dy
+# CONFIG_MAC80211 is not set
+CONFIG_IEEE80211=3Dy
+# CONFIG_IEEE80211_DEBUG is not set
+# CONFIG_IEEE80211_CRYPT_WEP is not set
+# CONFIG_IEEE80211_CRYPT_CCMP is not set
+# CONFIG_IEEE80211_CRYPT_TKIP is not set
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
+CONFIG_UEVENT_HELPER_PATH=3D""
+CONFIG_STANDALONE=3Dy
+CONFIG_PREVENT_FIRMWARE_BUILD=3Dy
+CONFIG_FW_LOADER=3Dy
+CONFIG_FIRMWARE_IN_KERNEL=3Dy
+CONFIG_EXTRA_FIRMWARE=3D""
+# CONFIG_DEBUG_DRIVER is not set
+# CONFIG_DEBUG_DEVRES is not set
+# CONFIG_SYS_HYPERVISOR is not set
+# CONFIG_CONNECTOR is not set
+# CONFIG_MTD is not set
+# CONFIG_PARPORT is not set
+CONFIG_BLK_DEV=3Dy
+# CONFIG_BLK_DEV_COW_COMMON is not set
+CONFIG_BLK_DEV_LOOP=3Dy
+# CONFIG_BLK_DEV_CRYPTOLOOP is not set
+# CONFIG_BLK_DEV_NBD is not set
+# CONFIG_BLK_DEV_RAM is not set
+# CONFIG_CDROM_PKTCDVD is not set
+# CONFIG_ATA_OVER_ETH is not set
+CONFIG_MISC_DEVICES=3Dy
+CONFIG_ANDROID_PMEM=3Dy
+CONFIG_TIMED_OUTPUT=3Dy
+CONFIG_TIMED_GPIO=3Dy
+CONFIG_BINDER_IPC=3Dy
+# CONFIG_EEPROM_93CX6 is not set
+# CONFIG_ENCLOSURE_SERVICES is not set
+CONFIG_KERNEL_DEBUGGER_CORE=3Dy
+CONFIG_LOW_MEMORY_KILLER=3Dy
+CONFIG_LOGGER=3Dy
+# CONFIG_UID_STAT is not set
+# CONFIG_ANDROID_RAM_CONSOLE is not set
+CONFIG_HAVE_IDE=3Dy
+# CONFIG_IDE is not set
+
+#
+# SCSI device support
+#
+# CONFIG_RAID_ATTRS is not set
+# CONFIG_SCSI is not set
+# CONFIG_SCSI_DMA is not set
+# CONFIG_SCSI_NETLINK is not set
+# CONFIG_ATA is not set
+# CONFIG_MD is not set
+CONFIG_NETDEVICES=3Dy
+CONFIG_DUMMY=3Dy
+# CONFIG_BONDING is not set
+# CONFIG_MACVLAN is not set
+# CONFIG_EQUALIZER is not set
+# CONFIG_TUN is not set
+# CONFIG_VETH is not set
+# CONFIG_PHYLIB is not set
+CONFIG_NET_ETHERNET=3Dy
+CONFIG_MII=3Dy
+# CONFIG_AX88796 is not set
+# CONFIG_SMC91X is not set
+# CONFIG_DM9000 is not set
+# CONFIG_IBM_NEW_EMAC_ZMII is not set
+# CONFIG_IBM_NEW_EMAC_RGMII is not set
+# CONFIG_IBM_NEW_EMAC_TAH is not set
+# CONFIG_IBM_NEW_EMAC_EMAC4 is not set
+# CONFIG_B44 is not set
+CONFIG_NETDEV_1000=3Dy
+CONFIG_NETDEV_10000=3Dy
+
+#
+# Wireless LAN
+#
+# CONFIG_WLAN_PRE80211 is not set
+CONFIG_WLAN_80211=3Dy
+# CONFIG_LIBERTAS is not set
+# CONFIG_IWLWIFI_LEDS is not set
+# CONFIG_HOSTAP is not set
+# CONFIG_WAN is not set
+CONFIG_PPP=3Dy
+# CONFIG_PPP_MULTILINK is not set
+# CONFIG_PPP_FILTER is not set
+CONFIG_PPP_ASYNC=3Dy
+# CONFIG_PPP_SYNC_TTY is not set
+CONFIG_PPP_DEFLATE=3Dy
+CONFIG_PPP_BSDCOMP=3Dy
+# CONFIG_PPP_MPPE is not set
+# CONFIG_PPPOE is not set
+# CONFIG_PPPOL2TP is not set
+# CONFIG_SLIP is not set
+CONFIG_SLHC=3Dy
+# CONFIG_NETCONSOLE is not set
+CONFIG_MSM_RMNET=3Dy
+# CONFIG_NETPOLL is not set
+# CONFIG_NET_POLL_CONTROLLER is not set
+# CONFIG_ISDN is not set
+
+#
+# Input device support
+#
+CONFIG_INPUT=3Dy
+# CONFIG_INPUT_FF_MEMLESS is not set
+# CONFIG_INPUT_POLLDEV is not set
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
+# CONFIG_INPUT_KEYRESET is not set
+
+#
+# Input Device Drivers
+#
+CONFIG_INPUT_KEYBOARD=3Dy
+# CONFIG_KEYBOARD_ATKBD is not set
+# CONFIG_KEYBOARD_SUNKBD is not set
+# CONFIG_KEYBOARD_LKKBD is not set
+# CONFIG_KEYBOARD_XTKBD is not set
+# CONFIG_KEYBOARD_NEWTON is not set
+# CONFIG_KEYBOARD_STOWAWAY is not set
+# CONFIG_KEYBOARD_GPIO is not set
+CONFIG_KEYBOARD_MICROP_KEYPAD=3Dy
+# CONFIG_INPUT_MOUSE is not set
+# CONFIG_INPUT_JOYSTICK is not set
+# CONFIG_INPUT_TABLET is not set
+CONFIG_INPUT_TOUCHSCREEN=3Dy
+# CONFIG_TOUCHSCREEN_FUJITSU is not set
+# CONFIG_TOUCHSCREEN_GUNZE is not set
+# CONFIG_TOUCHSCREEN_ELAN_I2C_8232 is not set
+# CONFIG_TOUCHSCREEN_ELO is not set
+# CONFIG_TOUCHSCREEN_MTOUCH is not set
+# CONFIG_TOUCHSCREEN_INEXIO is not set
+# CONFIG_TOUCHSCREEN_MK712 is not set
+# CONFIG_TOUCHSCREEN_PENMOUNT is not set
+CONFIG_TOUCHSCREEN_SYNAPTICS_I2C_RMI=3Dy
+# CONFIG_TOUCHSCREEN_TOUCHRIGHT is not set
+# CONFIG_TOUCHSCREEN_TOUCHWIN is not set
+# CONFIG_TOUCHSCREEN_UCB1400 is not set
+# CONFIG_TOUCHSCREEN_USB_COMPOSITE is not set
+# CONFIG_TOUCHSCREEN_TOUCHIT213 is not set
+CONFIG_TOUCHSCREEN_MSM=3Dy
+# CONFIG_MSM_VIRTUAL_KEYBOARD is not set
+CONFIG_INPUT_MISC=3Dy
+# CONFIG_INPUT_ATI_REMOTE is not set
+# CONFIG_INPUT_ATI_REMOTE2 is not set
+# CONFIG_INPUT_KEYSPAN_REMOTE is not set
+# CONFIG_INPUT_POWERMATE is not set
+# CONFIG_INPUT_YEALINK is not set
+# CONFIG_INPUT_UINPUT is not set
+CONFIG_INPUT_GPIO=3Dy
+# CONFIG_INPUT_KEYCHORD is not set
+
+#
+# Hardware I/O ports
+#
+# CONFIG_SERIO is not set
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
+# CONFIG_DEVMEM is not set
+CONFIG_DEVKMEM=3Dy
+# CONFIG_SERIAL_NONSTANDARD is not set
+
+#
+# Serial drivers
+#
+# CONFIG_SERIAL_8250 is not set
+
+#
+# Non-8250 serial port support
+#
+CONFIG_SERIAL_CORE=3Dy
+CONFIG_SERIAL_CORE_CONSOLE=3Dy
+CONFIG_SERIAL_MSM=3Dy
+CONFIG_SERIAL_MSM_CONSOLE=3Dy
+CONFIG_SERIAL_MSM_CLOCK_CONTROL=3Dy
+CONFIG_SERIAL_MSM_RX_WAKEUP=3Dy
+# CONFIG_SERIAL_MSM_HS is not set
+CONFIG_UNIX98_PTYS=3Dy
+# CONFIG_LEGACY_PTYS is not set
+# CONFIG_IPMI_HANDLER is not set
+# CONFIG_HW_RANDOM is not set
+# CONFIG_NVRAM is not set
+# CONFIG_R3964 is not set
+# CONFIG_RAW_DRIVER is not set
+# CONFIG_TCG_TPM is not set
+# CONFIG_DCC_TTY is not set
+CONFIG_I2C=3Dy
+CONFIG_I2C_BOARDINFO=3Dy
+# CONFIG_I2C_CHARDEV is not set
+CONFIG_I2C_HELPER_AUTO=3Dy
+
+#
+# I2C Hardware Bus support
+#
+
+#
+# I2C system bus drivers (mostly embedded / system-on-chip)
+#
+# CONFIG_I2C_GPIO is not set
+CONFIG_I2C_MSM=3Dy
+# CONFIG_I2C_OCORES is not set
+# CONFIG_I2C_SIMTEC is not set
+
+#
+# External I2C/SMBus adapter drivers
+#
+# CONFIG_I2C_PARPORT_LIGHT is not set
+# CONFIG_I2C_TAOS_EVM is not set
+
+#
+# Other I2C/SMBus bus drivers
+#
+# CONFIG_I2C_PCA_PLATFORM is not set
+# CONFIG_I2C_STUB is not set
+
+#
+# Miscellaneous I2C Chip support
+#
+# CONFIG_DS1682 is not set
+# CONFIG_AT24 is not set
+# CONFIG_SENSORS_EEPROM is not set
+# CONFIG_SENSORS_PCF8574 is not set
+# CONFIG_PCF8575 is not set
+# CONFIG_SENSORS_PCA9539 is not set
+# CONFIG_SENSORS_PCF8591 is not set
+# CONFIG_SENSORS_MAX6875 is not set
+# CONFIG_SENSORS_TSL2550 is not set
+# CONFIG_SENSORS_AKM8976 is not set
+CONFIG_SENSORS_PCA963X=3Dy
+# CONFIG_SENSORS_MT9T013 is not set
+CONFIG_SENSORS_MICROP_KSC=3Dy
+CONFIG_SENSORS_MICROP_KLT=3Dy
+# CONFIG_I2C_DEBUG_CORE is not set
+# CONFIG_I2C_DEBUG_ALGO is not set
+# CONFIG_I2C_DEBUG_BUS is not set
+# CONFIG_I2C_DEBUG_CHIP is not set
+# CONFIG_SPI is not set
+# CONFIG_W1 is not set
+CONFIG_POWER_SUPPLY=3Dy
+# CONFIG_POWER_SUPPLY_DEBUG is not set
+# CONFIG_PDA_POWER is not set
+# CONFIG_BATTERY_DS2760 is not set
+# CONFIG_HWMON is not set
+# CONFIG_WATCHDOG is not set
+
+#
+# Sonics Silicon Backplane
+#
+CONFIG_SSB_POSSIBLE=3Dy
+# CONFIG_SSB is not set
+
+#
+# Multifunction device drivers
+#
+# CONFIG_MFD_CORE is not set
+# CONFIG_MFD_SM501 is not set
+# CONFIG_HTC_PASIC3 is not set
+# CONFIG_MFD_TMIO is not set
+# CONFIG_MFD_T7L66XB is not set
+# CONFIG_MFD_TC6387XB is not set
+
+#
+# Multimedia devices
+#
+
+#
+# Multimedia core support
+#
+# CONFIG_VIDEO_DEV is not set
+# CONFIG_DVB_CORE is not set
+# CONFIG_VIDEO_MEDIA is not set
+
+#
+# Multimedia drivers
+#
+CONFIG_DAB=3Dy
+
+#
+# Graphics support
+#
+# CONFIG_VGASTATE is not set
+CONFIG_VIDEO_OUTPUT_CONTROL=3Dy
+CONFIG_FB=3Dy
+# CONFIG_FIRMWARE_EDID is not set
+# CONFIG_FB_DDC is not set
+CONFIG_FB_CFB_FILLRECT=3Dy
+CONFIG_FB_CFB_COPYAREA=3Dy
+CONFIG_FB_CFB_IMAGEBLIT=3Dy
+# CONFIG_FB_CFB_REV_PIXELS_IN_BYTE is not set
+# CONFIG_FB_SYS_FILLRECT is not set
+# CONFIG_FB_SYS_COPYAREA is not set
+# CONFIG_FB_SYS_IMAGEBLIT is not set
+# CONFIG_FB_FOREIGN_ENDIAN is not set
+# CONFIG_FB_SYS_FOPS is not set
+CONFIG_FB_MSM=3Dy
+CONFIG_FB_MSM_REFRESH=3Dy
+# CONFIG_FB_SVGALIB is not set
+# CONFIG_FB_MACMODES is not set
+# CONFIG_FB_BACKLIGHT is not set
+CONFIG_FB_MODE_HELPERS=3Dy
+CONFIG_FB_TILEBLITTING=3Dy
+
+#
+# Frame buffer hardware drivers
+#
+# CONFIG_FB_S1D13XXX is not set
+# CONFIG_FB_VIRTUAL is not set
+# CONFIG_BACKLIGHT_LCD_SUPPORT is not set
+
+#
+# Display device support
+#
+# CONFIG_DISPLAY_SUPPORT is not set
+
+#
+# Console display driver support
+#
+# CONFIG_VGA_CONSOLE is not set
+CONFIG_DUMMY_CONSOLE=3Dy
+CONFIG_FRAMEBUFFER_CONSOLE=3Dy
+# CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY is not set
+# CONFIG_FRAMEBUFFER_CONSOLE_ROTATION is not set
+CONFIG_FONTS=3Dy
+CONFIG_FONT_8x8=3Dy
+# CONFIG_FONT_8x16 is not set
+# CONFIG_FONT_6x11 is not set
+# CONFIG_FONT_7x14 is not set
+# CONFIG_FONT_PEARL_8x8 is not set
+# CONFIG_FONT_ACORN_8x8 is not set
+# CONFIG_FONT_MINI_4x6 is not set
+# CONFIG_FONT_SUN8x16 is not set
+# CONFIG_FONT_SUN12x22 is not set
+# CONFIG_FONT_10x18 is not set
+CONFIG_LOGO=3Dy
+# CONFIG_LOGO_LINUX_MONO is not set
+# CONFIG_LOGO_LINUX_VGA16 is not set
+# CONFIG_LOGO_LINUX_CLUT224 is not set
+CONFIG_LOGO_DIAMRAPH_CLUT224=3Dy
+# CONFIG_SOUND is not set
+CONFIG_HID_SUPPORT=3Dy
+CONFIG_HID=3Dy
+# CONFIG_HID_DEBUG is not set
+# CONFIG_HIDRAW is not set
+CONFIG_USB_SUPPORT=3Dy
+CONFIG_USB_ARCH_HAS_HCD=3Dy
+# CONFIG_USB_ARCH_HAS_OHCI is not set
+# CONFIG_USB_ARCH_HAS_EHCI is not set
+# CONFIG_USB is not set
+
+#
+# Enable Host or Gadget support to see Inventra options
+#
+
+#
+# NOTE: USB_STORAGE enables SCSI, and 'SCSI disk support'
+#
+# CONFIG_USB_GADGET is not set
+
+#
+# USB Function Support
+#
+CONFIG_USB_FUNCTION=3Dy
+CONFIG_USB_FUNCTION_MSM_HSUSB=3Dy
+# CONFIG_USB_FUNCTION_NULL is not set
+# CONFIG_USB_FUNCTION_ZERO is not set
+# CONFIG_USB_FUNCTION_LOOPBACK is not set
+CONFIG_USB_FUNCTION_ADB=3Dy
+# CONFIG_USB_FUNCTION_UMS is not set
+CONFIG_USB_FUNCTION_MASS_STORAGE=3Dy
+CONFIG_USB_FUNCTION_DIAG=3Dy
+CONFIG_USB_FUNCTION_ETHER=3Dy
+CONFIG_MMC=3Dy
+# CONFIG_MMC_DEBUG is not set
+CONFIG_MMC_UNSAFE_RESUME=3Dy
+CONFIG_MMC_EMBEDDED_SDIO=3Dy
+# CONFIG_MMC_PARANOID_SD_INIT is not set
+
+#
+# MMC/SD Card Drivers
+#
+CONFIG_MMC_BLOCK=3Dy
+# CONFIG_MMC_BLOCK_BOUNCE is not set
+CONFIG_MMC_BLOCK_PARANOID_RESUME=3Dy
+# CONFIG_SDIO_UART is not set
+# CONFIG_MMC_TEST is not set
+
+#
+# MMC/SD Host Controller Drivers
+#
+# CONFIG_MMC_SDHCI is not set
+CONFIG_MMC_MSM7X00A=3Dy
+# CONFIG_MMC_MSM7X00A_RESUME_IN_WQ is not set
+CONFIG_NEW_LEDS=3Dy
+CONFIG_LEDS_CLASS=3Dy
+
+#
+# LED drivers
+#
+# CONFIG_LEDS_PCA9532 is not set
+CONFIG_LEDS_GPIO=3Dy
+# CONFIG_LEDS_PCA955X is not set
+
+#
+# LED Triggers
+#
+CONFIG_LEDS_TRIGGERS=3Dy
+CONFIG_LEDS_TRIGGER_TIMER=3Dy
+CONFIG_LEDS_TRIGGER_HEARTBEAT=3Dy
+# CONFIG_LEDS_TRIGGER_DEFAULT_ON is not set
+CONFIG_SWITCH=3Dy
+CONFIG_SWITCH_GPIO=3Dy
+CONFIG_RTC_LIB=3Dy
+CONFIG_RTC_CLASS=3Dy
+CONFIG_RTC_HCTOSYS=3Dy
+CONFIG_RTC_HCTOSYS_DEVICE=3D"rtc0"
+# CONFIG_RTC_DEBUG is not set
+
+#
+# RTC interfaces
+#
+# CONFIG_RTC_INTF_SYSFS is not set
+# CONFIG_RTC_INTF_PROC is not set
+# CONFIG_RTC_INTF_DEV is not set
+CONFIG_RTC_INTF_ALARM=3Dy
+# CONFIG_RTC_DRV_TEST is not set
+
+#
+# I2C RTC drivers
+#
+# CONFIG_RTC_DRV_DS1307 is not set
+# CONFIG_RTC_DRV_DS1374 is not set
+# CONFIG_RTC_DRV_DS1672 is not set
+# CONFIG_RTC_DRV_MAX6900 is not set
+# CONFIG_RTC_DRV_RS5C372 is not set
+# CONFIG_RTC_DRV_ISL1208 is not set
+# CONFIG_RTC_DRV_X1205 is not set
+# CONFIG_RTC_DRV_PCF8563 is not set
+# CONFIG_RTC_DRV_PCF8583 is not set
+# CONFIG_RTC_DRV_M41T80 is not set
+# CONFIG_RTC_DRV_S35390A is not set
+# CONFIG_RTC_DRV_FM3130 is not set
+
+#
+# SPI RTC drivers
+#
+
+#
+# Platform RTC drivers
+#
+# CONFIG_RTC_DRV_CMOS is not set
+# CONFIG_RTC_DRV_DS1511 is not set
+# CONFIG_RTC_DRV_DS1553 is not set
+# CONFIG_RTC_DRV_DS1742 is not set
+# CONFIG_RTC_DRV_STK17TA8 is not set
+# CONFIG_RTC_DRV_M48T86 is not set
+# CONFIG_RTC_DRV_M48T59 is not set
+# CONFIG_RTC_DRV_V3020 is not set
+
+#
+# on-CPU RTC drivers
+#
+# CONFIG_RTC_DRV_MSM7X00A is not set
+CONFIG_RTC_DRV_MSM7X01A=3Dy
+# CONFIG_DMADEVICES is not set
+
+#
+# Voltage and Current regulators
+#
+# CONFIG_REGULATOR is not set
+# CONFIG_REGULATOR_FIXED_VOLTAGE is not set
+# CONFIG_REGULATOR_VIRTUAL_CONSUMER is not set
+# CONFIG_REGULATOR_BQ24022 is not set
+# CONFIG_UIO is not set
+
+#
+# File systems
+#
+CONFIG_EXT2_FS=3Dy
+# CONFIG_EXT2_FS_XATTR is not set
+# CONFIG_EXT2_FS_XIP is not set
+CONFIG_EXT3_FS=3Dy
+CONFIG_EXT3_FS_XATTR=3Dy
+# CONFIG_EXT3_FS_POSIX_ACL is not set
+# CONFIG_EXT3_FS_SECURITY is not set
+# CONFIG_EXT4DEV_FS is not set
+CONFIG_JBD=3Dy
+# CONFIG_JBD_DEBUG is not set
+CONFIG_FS_MBCACHE=3Dy
+# CONFIG_REISERFS_FS is not set
+# CONFIG_JFS_FS is not set
+# CONFIG_FS_POSIX_ACL is not set
+# CONFIG_XFS_FS is not set
+# CONFIG_OCFS2_FS is not set
+# CONFIG_DNOTIFY is not set
+CONFIG_INOTIFY=3Dy
+CONFIG_INOTIFY_USER=3Dy
+# CONFIG_QUOTA is not set
+# CONFIG_AUTOFS_FS is not set
+# CONFIG_AUTOFS4_FS is not set
+# CONFIG_FUSE_FS is not set
+
+#
+# CD-ROM/DVD Filesystems
+#
+# CONFIG_ISO9660_FS is not set
+# CONFIG_UDF_FS is not set
+
+#
+# DOS/FAT/NT Filesystems
+#
+CONFIG_FAT_FS=3Dy
+# CONFIG_MSDOS_FS is not set
+CONFIG_VFAT_FS=3Dy
+CONFIG_FAT_DEFAULT_CODEPAGE=3D437
+CONFIG_FAT_DEFAULT_IOCHARSET=3D"iso8859-1"
+# CONFIG_NTFS_FS is not set
+
+#
+# Pseudo filesystems
+#
+CONFIG_PROC_FS=3Dy
+CONFIG_PROC_SYSCTL=3Dy
+CONFIG_SYSFS=3Dy
+CONFIG_TMPFS=3Dy
+# CONFIG_TMPFS_POSIX_ACL is not set
+# CONFIG_HUGETLB_PAGE is not set
+# CONFIG_CONFIGFS_FS is not set
+
+#
+# Miscellaneous filesystems
+#
+# CONFIG_ADFS_FS is not set
+# CONFIG_AFFS_FS is not set
+# CONFIG_HFS_FS is not set
+# CONFIG_HFSPLUS_FS is not set
+# CONFIG_BEFS_FS is not set
+# CONFIG_BFS_FS is not set
+# CONFIG_EFS_FS is not set
+# CONFIG_CRAMFS is not set
+# CONFIG_VXFS_FS is not set
+# CONFIG_MINIX_FS is not set
+# CONFIG_OMFS_FS is not set
+# CONFIG_HPFS_FS is not set
+# CONFIG_QNX4FS_FS is not set
+# CONFIG_ROMFS_FS is not set
+# CONFIG_SYSV_FS is not set
+# CONFIG_UFS_FS is not set
+CONFIG_NETWORK_FILESYSTEMS=3Dy
+# CONFIG_NFS_FS is not set
+# CONFIG_NFSD is not set
+# CONFIG_SMB_FS is not set
+# CONFIG_CIFS is not set
+# CONFIG_NCP_FS is not set
+# CONFIG_CODA_FS is not set
+# CONFIG_AFS_FS is not set
+
+#
+# Partition Types
+#
+# CONFIG_PARTITION_ADVANCED is not set
+CONFIG_MSDOS_PARTITION=3Dy
+CONFIG_NLS=3Dy
+CONFIG_NLS_DEFAULT=3D"iso8859-1"
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
+# CONFIG_NLS_ASCII is not set
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
+# CONFIG_NLS_UTF8 is not set
+# CONFIG_DLM is not set
+
+#
+# Kernel hacking
+#
+CONFIG_PRINTK_TIME=3Dy
+CONFIG_ENABLE_WARN_DEPRECATED=3Dy
+CONFIG_ENABLE_MUST_CHECK=3Dy
+CONFIG_FRAME_WARN=3D1024
+CONFIG_MAGIC_SYSRQ=3Dy
+# CONFIG_UNUSED_SYMBOLS is not set
+CONFIG_DEBUG_FS=3Dy
+# CONFIG_HEADERS_CHECK is not set
+CONFIG_DEBUG_KERNEL=3Dy
+# CONFIG_DEBUG_SHIRQ is not set
+CONFIG_DETECT_SOFTLOCKUP=3Dy
+# CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC is not set
+CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC_VALUE=3D0
+CONFIG_SCHED_DEBUG=3Dy
+CONFIG_SCHEDSTATS=3Dy
+# CONFIG_TIMER_STATS is not set
+# CONFIG_DEBUG_OBJECTS is not set
+# CONFIG_DEBUG_SLAB is not set
+CONFIG_DEBUG_PREEMPT=3Dy
+# CONFIG_DEBUG_RT_MUTEXES is not set
+# CONFIG_RT_MUTEX_TESTER is not set
+# CONFIG_DEBUG_SPINLOCK is not set
+CONFIG_DEBUG_MUTEXES=3Dy
+# CONFIG_DEBUG_LOCK_ALLOC is not set
+# CONFIG_PROVE_LOCKING is not set
+# CONFIG_LOCK_STAT is not set
+CONFIG_DEBUG_SPINLOCK_SLEEP=3Dy
+# CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
+# CONFIG_DEBUG_KOBJECT is not set
+CONFIG_DEBUG_BUGVERBOSE=3Dy
+CONFIG_DEBUG_INFO=3Dy
+# CONFIG_DEBUG_VM is not set
+# CONFIG_DEBUG_WRITECOUNT is not set
+CONFIG_DEBUG_MEMORY_INIT=3Dy
+# CONFIG_DEBUG_LIST is not set
+# CONFIG_DEBUG_SG is not set
+CONFIG_FRAME_POINTER=3Dy
+# CONFIG_BOOT_PRINTK_DELAY is not set
+# CONFIG_RCU_TORTURE_TEST is not set
+# CONFIG_BACKTRACE_SELF_TEST is not set
+# CONFIG_FAULT_INJECTION is not set
+# CONFIG_LATENCYTOP is not set
+# CONFIG_SYSCTL_SYSCALL_CHECK is not set
+CONFIG_HAVE_FTRACE=3Dy
+CONFIG_HAVE_DYNAMIC_FTRACE=3Dy
+# CONFIG_FTRACE is not set
+# CONFIG_IRQSOFF_TRACER is not set
+# CONFIG_PREEMPT_TRACER is not set
+# CONFIG_SCHED_TRACER is not set
+# CONFIG_CONTEXT_SWITCH_TRACER is not set
+# CONFIG_SAMPLES is not set
+CONFIG_HAVE_ARCH_KGDB=3Dy
+# CONFIG_KGDB is not set
+# CONFIG_DEBUG_USER is not set
+# CONFIG_DEBUG_ERRORS is not set
+# CONFIG_DEBUG_STACK_USAGE is not set
+CONFIG_DEBUG_LL=3Dy
+# CONFIG_DEBUG_ICEDCC is not set
+
+#
+# Security options
+#
+# CONFIG_KEYS is not set
+# CONFIG_SECURITY is not set
+# CONFIG_SECURITY_FILE_CAPABILITIES is not set
+# CONFIG_CRYPTO is not set
+
+#
+# Library routines
+#
+CONFIG_BITREVERSE=3Dy
+# CONFIG_GENERIC_FIND_FIRST_BIT is not set
+# CONFIG_GENERIC_FIND_NEXT_BIT is not set
+CONFIG_CRC_CCITT=3Dy
+# CONFIG_CRC16 is not set
+# CONFIG_CRC_T10DIF is not set
+# CONFIG_CRC_ITU_T is not set
+CONFIG_CRC32=3Dy
+# CONFIG_CRC7 is not set
+# CONFIG_LIBCRC32C is not set
+CONFIG_ZLIB_INFLATE=3Dy
+CONFIG_ZLIB_DEFLATE=3Dy
+CONFIG_PLIST=3Dy
+CONFIG_HAS_IOMEM=3Dy
+CONFIG_HAS_IOPORT=3Dy
+CONFIG_HAS_DMA=3Dy
diff --git a/recipes/linux/linux-replicant/htcdream/defconfig b/recipes/lin=
ux/linux-replicant/htcdream/defconfig
new file mode 100644
index 0000000..5e1dd65
--- /dev/null
+++ b/recipes/linux/linux-replicant/htcdream/defconfig
@@ -0,0 +1,1671 @@
+#
+# Automatically generated make config: don't edit
+# Linux kernel version: 2.6.29
+# Sat Oct 17 23:18:47 2009
+#
+CONFIG_ARM=3Dy
+CONFIG_SYS_SUPPORTS_APM_EMULATION=3Dy
+CONFIG_GENERIC_GPIO=3Dy
+CONFIG_GENERIC_TIME=3Dy
+CONFIG_GENERIC_CLOCKEVENTS=3Dy
+CONFIG_MMU=3Dy
+# CONFIG_NO_IOPORT is not set
+CONFIG_GENERIC_HARDIRQS=3Dy
+CONFIG_STACKTRACE_SUPPORT=3Dy
+CONFIG_HAVE_LATENCYTOP_SUPPORT=3Dy
+CONFIG_LOCKDEP_SUPPORT=3Dy
+CONFIG_TRACE_IRQFLAGS_SUPPORT=3Dy
+CONFIG_HARDIRQS_SW_RESEND=3Dy
+CONFIG_GENERIC_IRQ_PROBE=3Dy
+CONFIG_RWSEM_GENERIC_SPINLOCK=3Dy
+# CONFIG_ARCH_HAS_ILOG2_U32 is not set
+# CONFIG_ARCH_HAS_ILOG2_U64 is not set
+CONFIG_GENERIC_HWEIGHT=3Dy
+CONFIG_GENERIC_CALIBRATE_DELAY=3Dy
+CONFIG_GENERIC_HARDIRQS_NO__DO_IRQ=3Dy
+CONFIG_VECTORS_BASE=3D0xffff0000
+CONFIG_DEFCONFIG_LIST=3D"/lib/modules/$UNAME_RELEASE/.config"
+
+#
+# General setup
+#
+CONFIG_EXPERIMENTAL=3Dy
+CONFIG_BROKEN_ON_SMP=3Dy
+CONFIG_LOCK_KERNEL=3Dy
+CONFIG_INIT_ENV_ARG_LIMIT=3D32
+CONFIG_LOCALVERSION=3D"-openmoko-msm"
+# CONFIG_LOCALVERSION_AUTO is not set
+CONFIG_SWAP=3Dy
+# CONFIG_SYSVIPC is not set
+# CONFIG_POSIX_MQUEUE is not set
+# CONFIG_BSD_PROCESS_ACCT is not set
+# CONFIG_TASKSTATS is not set
+# CONFIG_AUDIT is not set
+
+#
+# RCU Subsystem
+#
+CONFIG_CLASSIC_RCU=3Dy
+# CONFIG_TREE_RCU is not set
+# CONFIG_PREEMPT_RCU is not set
+# CONFIG_TREE_RCU_TRACE is not set
+# CONFIG_PREEMPT_RCU_TRACE is not set
+CONFIG_IKCONFIG=3Dy
+CONFIG_IKCONFIG_PROC=3Dy
+CONFIG_LOG_BUF_SHIFT=3D17
+CONFIG_GROUP_SCHED=3Dy
+CONFIG_FAIR_GROUP_SCHED=3Dy
+CONFIG_RT_GROUP_SCHED=3Dy
+# CONFIG_USER_SCHED is not set
+CONFIG_CGROUP_SCHED=3Dy
+CONFIG_CGROUPS=3Dy
+CONFIG_CGROUP_DEBUG=3Dy
+# CONFIG_CGROUP_NS is not set
+CONFIG_CGROUP_FREEZER=3Dy
+# CONFIG_CGROUP_DEVICE is not set
+CONFIG_CGROUP_CPUACCT=3Dy
+CONFIG_RESOURCE_COUNTERS=3Dy
+# CONFIG_CGROUP_MEM_RES_CTLR is not set
+# CONFIG_SYSFS_DEPRECATED_V2 is not set
+# CONFIG_RELAY is not set
+CONFIG_NAMESPACES=3Dy
+CONFIG_UTS_NS=3Dy
+CONFIG_USER_NS=3Dy
+CONFIG_PID_NS=3Dy
+CONFIG_NET_NS=3Dy
+# CONFIG_BLK_DEV_INITRD is not set
+CONFIG_CC_OPTIMIZE_FOR_SIZE=3Dy
+CONFIG_SYSCTL=3Dy
+CONFIG_ANON_INODES=3Dy
+CONFIG_PANIC_TIMEOUT=3D5
+CONFIG_EMBEDDED=3Dy
+CONFIG_UID16=3Dy
+# CONFIG_SYSCTL_SYSCALL is not set
+CONFIG_KALLSYMS=3Dy
+# CONFIG_KALLSYMS_EXTRA_PASS is not set
+CONFIG_HOTPLUG=3Dy
+CONFIG_PRINTK=3Dy
+CONFIG_BUG=3Dy
+# CONFIG_ELF_CORE is not set
+CONFIG_BASE_FULL=3Dy
+CONFIG_FUTEX=3Dy
+CONFIG_EPOLL=3Dy
+CONFIG_SIGNALFD=3Dy
+CONFIG_TIMERFD=3Dy
+CONFIG_EVENTFD=3Dy
+CONFIG_SHMEM=3Dy
+CONFIG_AIO=3Dy
+CONFIG_ASHMEM=3Dy
+CONFIG_VM_EVENT_COUNTERS=3Dy
+CONFIG_COMPAT_BRK=3Dy
+CONFIG_SLAB=3Dy
+# CONFIG_SLUB is not set
+# CONFIG_SLOB is not set
+# CONFIG_PROFILING is not set
+CONFIG_HAVE_OPROFILE=3Dy
+# CONFIG_KPROBES is not set
+CONFIG_HAVE_KPROBES=3Dy
+CONFIG_HAVE_KRETPROBES=3Dy
+CONFIG_HAVE_GENERIC_DMA_COHERENT=3Dy
+CONFIG_SLABINFO=3Dy
+CONFIG_RT_MUTEXES=3Dy
+CONFIG_BASE_SMALL=3D0
+CONFIG_MODULES=3Dy
+CONFIG_MODULE_FORCE_LOAD=3Dy
+CONFIG_MODULE_UNLOAD=3Dy
+CONFIG_MODULE_FORCE_UNLOAD=3Dy
+CONFIG_MODVERSIONS=3Dy
+# CONFIG_MODULE_SRCVERSION_ALL is not set
+CONFIG_BLOCK=3Dy
+# CONFIG_LBD is not set
+# CONFIG_BLK_DEV_IO_TRACE is not set
+# CONFIG_BLK_DEV_BSG is not set
+# CONFIG_BLK_DEV_INTEGRITY is not set
+
+#
+# IO Schedulers
+#
+CONFIG_IOSCHED_NOOP=3Dy
+CONFIG_IOSCHED_AS=3Dy
+# CONFIG_IOSCHED_DEADLINE is not set
+# CONFIG_IOSCHED_CFQ is not set
+CONFIG_DEFAULT_AS=3Dy
+# CONFIG_DEFAULT_DEADLINE is not set
+# CONFIG_DEFAULT_CFQ is not set
+# CONFIG_DEFAULT_NOOP is not set
+CONFIG_DEFAULT_IOSCHED=3D"anticipatory"
+CONFIG_FREEZER=3Dy
+
+#
+# System Type
+#
+# CONFIG_ARCH_AAEC2000 is not set
+# CONFIG_ARCH_INTEGRATOR is not set
+# CONFIG_ARCH_REALVIEW is not set
+# CONFIG_ARCH_VERSATILE is not set
+# CONFIG_ARCH_AT91 is not set
+# CONFIG_ARCH_CLPS711X is not set
+# CONFIG_ARCH_EBSA110 is not set
+# CONFIG_ARCH_EP93XX is not set
+# CONFIG_ARCH_FOOTBRIDGE is not set
+# CONFIG_ARCH_NETX is not set
+# CONFIG_ARCH_H720X is not set
+# CONFIG_ARCH_IMX is not set
+# CONFIG_ARCH_IOP13XX is not set
+# CONFIG_ARCH_IOP32X is not set
+# CONFIG_ARCH_IOP33X is not set
+# CONFIG_ARCH_IXP23XX is not set
+# CONFIG_ARCH_IXP2000 is not set
+# CONFIG_ARCH_IXP4XX is not set
+# CONFIG_ARCH_L7200 is not set
+# CONFIG_ARCH_KIRKWOOD is not set
+# CONFIG_ARCH_KS8695 is not set
+# CONFIG_ARCH_NS9XXX is not set
+# CONFIG_ARCH_LOKI is not set
+# CONFIG_ARCH_MV78XX0 is not set
+# CONFIG_ARCH_MXC is not set
+# CONFIG_ARCH_ORION5X is not set
+# CONFIG_ARCH_PNX4008 is not set
+# CONFIG_ARCH_PXA is not set
+# CONFIG_ARCH_RPC is not set
+# CONFIG_ARCH_SA1100 is not set
+# CONFIG_ARCH_S3C2410 is not set
+# CONFIG_ARCH_S3C64XX is not set
+# CONFIG_ARCH_SHARK is not set
+# CONFIG_ARCH_LH7A40X is not set
+# CONFIG_ARCH_DAVINCI is not set
+# CONFIG_ARCH_OMAP is not set
+CONFIG_ARCH_MSM=3Dy
+# CONFIG_ARCH_W90X900 is not set
+CONFIG_MSM_AMSS_VERSION=3D6225
+# CONFIG_MSM_AMSS_VERSION_6210 is not set
+# CONFIG_MSM_AMSS_VERSION_6220 is not set
+CONFIG_MSM_AMSS_VERSION_6225=3Dy
+# CONFIG_MSM_AMSS_VERSION_6350 is not set
+CONFIG_MSM_DEBUG_UART_NONE=3Dy
+# CONFIG_MSM_DEBUG_UART1 is not set
+# CONFIG_MSM_DEBUG_UART2 is not set
+# CONFIG_MSM_DEBUG_UART3 is not set
+
+#
+# MSM Board Type
+#
+CONFIG_MACH_HALIBUT=3Dy
+CONFIG_MACH_TROUT=3Dy
+CONFIG_MACH_SAPPHIRE=3Dy
+CONFIG_HTC_HEADSET=3Dy
+CONFIG_TROUT_BATTCHG=3Dy
+CONFIG_TROUT_WIFI=3Dm
+CONFIG_HTC_PWRSINK=3Dy
+CONFIG_CACHE_FLUSH_RANGE_LIMIT=3D0x40000
+CONFIG_MSM7X00A_USE_GP_TIMER=3Dy
+# CONFIG_MSM7X00A_USE_DG_TIMER is not set
+CONFIG_MSM7X00A_SLEEP_MODE_POWER_COLLAPSE_SUSPEND=3Dy
+# CONFIG_MSM7X00A_SLEEP_MODE_POWER_COLLAPSE is not set
+# CONFIG_MSM7X00A_SLEEP_MODE_APPS_SLEEP is not set
+# CONFIG_MSM7X00A_SLEEP_MODE_RAMP_DOWN_AND_WAIT_FOR_INTERRUPT is not set
+# CONFIG_MSM7X00A_SLEEP_WAIT_FOR_INTERRUPT is not set
+CONFIG_MSM7X00A_SLEEP_MODE=3D0
+# CONFIG_MSM7X00A_IDLE_SLEEP_MODE_POWER_COLLAPSE_SUSPEND is not set
+CONFIG_MSM7X00A_IDLE_SLEEP_MODE_POWER_COLLAPSE=3Dy
+# CONFIG_MSM7X00A_IDLE_SLEEP_MODE_APPS_SLEEP is not set
+# CONFIG_MSM7X00A_IDLE_SLEEP_MODE_RAMP_DOWN_AND_WAIT_FOR_INTERRUPT is not =
set
+# CONFIG_MSM7X00A_IDLE_SLEEP_WAIT_FOR_INTERRUPT is not set
+CONFIG_MSM7X00A_IDLE_SLEEP_MODE=3D1
+CONFIG_MSM7X00A_IDLE_SLEEP_MIN_TIME=3D20000000
+CONFIG_MSM7X00A_IDLE_SPIN_TIME=3D80000
+CONFIG_MSM_IDLE_STATS=3Dy
+CONFIG_MSM_IDLE_STATS_FIRST_BUCKET=3D62500
+CONFIG_MSM_IDLE_STATS_BUCKET_SHIFT=3D2
+CONFIG_MSM_IDLE_STATS_BUCKET_COUNT=3D10
+CONFIG_MSM_FIQ_SUPPORT=3Dy
+CONFIG_MSM_SERIAL_DEBUGGER=3Dy
+# CONFIG_MSM_SERIAL_DEBUGGER_CONSOLE is not set
+CONFIG_MSM_SMD=3Dy
+CONFIG_MSM_ONCRPCROUTER=3Dy
+CONFIG_MSM_RPCSERVERS=3Dy
+CONFIG_MSM_CPU_FREQ=3Dy
+CONFIG_MSM_CPU_FREQ_ONDEMAND=3Dy
+# CONFIG_MSM_CPU_FREQ_SCREEN is not set
+CONFIG_MSM_CPU_FREQ_ONDEMAND_MAX=3D384000
+CONFIG_MSM_CPU_FREQ_ONDEMAND_MIN=3D245760
+# CONFIG_MSM_HW3D is not set
+CONFIG_MSM_ADSP=3Dy
+# CONFIG_MSM_ADSP_REPORT_EVENTS is not set
+CONFIG_WIFI_CONTROL_FUNC=3Dy
+CONFIG_WIFI_MEM_PREALLOC=3Dy
+# CONFIG_VIRTUAL_KPANIC_PARTITION is not set
+
+#
+# Processor Type
+#
+CONFIG_CPU_32=3Dy
+CONFIG_CPU_V6=3Dy
+CONFIG_CPU_32v6K=3Dy
+CONFIG_CPU_32v6=3Dy
+CONFIG_CPU_ABRT_EV6=3Dy
+CONFIG_CPU_PABRT_NOIFAR=3Dy
+CONFIG_CPU_CACHE_V6=3Dy
+CONFIG_CPU_CACHE_VIPT=3Dy
+CONFIG_CPU_COPY_V6=3Dy
+CONFIG_CPU_TLB_V6=3Dy
+CONFIG_CPU_HAS_ASID=3Dy
+CONFIG_CPU_CP15=3Dy
+CONFIG_CPU_CP15_MMU=3Dy
+
+#
+# Processor Features
+#
+CONFIG_ARM_THUMB=3Dy
+# CONFIG_CPU_ICACHE_DISABLE is not set
+# CONFIG_CPU_DCACHE_DISABLE is not set
+# CONFIG_CPU_BPREDICT_DISABLE is not set
+# CONFIG_OUTER_CACHE is not set
+
+#
+# Bus support
+#
+# CONFIG_PCI_SYSCALL is not set
+# CONFIG_ARCH_SUPPORTS_MSI is not set
+# CONFIG_PCCARD is not set
+
+#
+# Kernel Features
+#
+CONFIG_TICK_ONESHOT=3Dy
+CONFIG_NO_HZ=3Dy
+CONFIG_HIGH_RES_TIMERS=3Dy
+CONFIG_GENERIC_CLOCKEVENTS_BUILD=3Dy
+CONFIG_VMSPLIT_3G=3Dy
+# CONFIG_VMSPLIT_2G is not set
+# CONFIG_VMSPLIT_1G is not set
+CONFIG_PAGE_OFFSET=3D0xC0000000
+CONFIG_PREEMPT=3Dy
+CONFIG_HZ=3D100
+CONFIG_AEABI=3Dy
+# CONFIG_OABI_COMPAT is not set
+CONFIG_ARCH_FLATMEM_HAS_HOLES=3Dy
+# CONFIG_ARCH_SPARSEMEM_DEFAULT is not set
+# CONFIG_ARCH_SELECT_MEMORY_MODEL is not set
+CONFIG_SELECT_MEMORY_MODEL=3Dy
+CONFIG_FLATMEM_MANUAL=3Dy
+# CONFIG_DISCONTIGMEM_MANUAL is not set
+# CONFIG_SPARSEMEM_MANUAL is not set
+CONFIG_FLATMEM=3Dy
+CONFIG_FLAT_NODE_MEM_MAP=3Dy
+CONFIG_PAGEFLAGS_EXTENDED=3Dy
+CONFIG_SPLIT_PTLOCK_CPUS=3D4
+# CONFIG_PHYS_ADDR_T_64BIT is not set
+CONFIG_ZONE_DMA_FLAG=3D0
+CONFIG_VIRT_TO_BUS=3Dy
+CONFIG_UNEVICTABLE_LRU=3Dy
+CONFIG_DEFAULT_MMAP_MIN_ADDR=3D4096
+CONFIG_ALIGNMENT_TRAP=3Dy
+
+#
+# Boot options
+#
+CONFIG_ZBOOT_ROM_TEXT=3D0x0
+CONFIG_ZBOOT_ROM_BSS=3D0x0
+CONFIG_CMDLINE=3D"mem=3D64M console=3DttyMSM,115200n8"
+# CONFIG_XIP_KERNEL is not set
+# CONFIG_KEXEC is not set
+
+#
+# CPU Power Management
+#
+CONFIG_CPU_FREQ=3Dy
+CONFIG_CPU_FREQ_TABLE=3Dy
+# CONFIG_CPU_FREQ_DEBUG is not set
+# CONFIG_CPU_FREQ_STAT is not set
+# CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE is not set
+# CONFIG_CPU_FREQ_DEFAULT_GOV_POWERSAVE is not set
+# CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE is not set
+CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND=3Dy
+# CONFIG_CPU_FREQ_DEFAULT_GOV_CONSERVATIVE is not set
+CONFIG_CPU_FREQ_GOV_PERFORMANCE=3Dy
+# CONFIG_CPU_FREQ_GOV_POWERSAVE is not set
+# CONFIG_CPU_FREQ_GOV_USERSPACE is not set
+CONFIG_CPU_FREQ_GOV_ONDEMAND=3Dy
+# CONFIG_CPU_FREQ_GOV_CONSERVATIVE is not set
+CONFIG_CPU_FREQ_MIN_TICKS=3D1
+CONFIG_CPU_FREQ_SAMPLING_LATENCY_MULTIPLIER=3D500
+# CONFIG_CPU_IDLE is not set
+
+#
+# Floating point emulation
+#
+
+#
+# At least one emulation must be selected
+#
+# CONFIG_VFP is not set
+
+#
+# Userspace binary formats
+#
+CONFIG_BINFMT_ELF=3Dy
+CONFIG_HAVE_AOUT=3Dy
+CONFIG_BINFMT_AOUT=3Dy
+CONFIG_BINFMT_MISC=3Dy
+
+#
+# Power management options
+#
+CONFIG_PM=3Dy
+# CONFIG_PM_DEBUG is not set
+CONFIG_PM_SLEEP=3Dy
+CONFIG_SUSPEND=3Dy
+CONFIG_SUSPEND_FREEZER=3Dy
+CONFIG_HAS_WAKELOCK=3Dy
+CONFIG_HAS_EARLYSUSPEND=3Dy
+CONFIG_WAKELOCK=3Dy
+CONFIG_WAKELOCK_STAT=3Dy
+CONFIG_USER_WAKELOCK=3Dy
+CONFIG_EARLYSUSPEND=3Dy
+# CONFIG_NO_USER_SPACE_SCREEN_ACCESS_CONTROL is not set
+# CONFIG_CONSOLE_EARLYSUSPEND is not set
+CONFIG_FB_EARLYSUSPEND=3Dy
+CONFIG_APM_EMULATION=3Dy
+CONFIG_ARCH_SUSPEND_POSSIBLE=3Dy
+CONFIG_NET=3Dy
+
+#
+# Networking options
+#
+CONFIG_COMPAT_NET_DEV_OPS=3Dy
+CONFIG_PACKET=3Dy
+# CONFIG_PACKET_MMAP is not set
+CONFIG_UNIX=3Dy
+CONFIG_XFRM=3Dy
+# CONFIG_XFRM_USER is not set
+# CONFIG_XFRM_SUB_POLICY is not set
+# CONFIG_XFRM_MIGRATE is not set
+# CONFIG_XFRM_STATISTICS is not set
+CONFIG_XFRM_IPCOMP=3Dm
+CONFIG_NET_KEY=3Dy
+# CONFIG_NET_KEY_MIGRATE is not set
+CONFIG_INET=3Dy
+# CONFIG_IP_MULTICAST is not set
+# CONFIG_IP_ADVANCED_ROUTER is not set
+CONFIG_IP_FIB_HASH=3Dy
+# CONFIG_IP_PNP is not set
+# CONFIG_NET_IPIP is not set
+# CONFIG_NET_IPGRE is not set
+# CONFIG_ARPD is not set
+# CONFIG_SYN_COOKIES is not set
+# CONFIG_INET_AH is not set
+CONFIG_INET_ESP=3Dy
+# CONFIG_INET_IPCOMP is not set
+# CONFIG_INET_XFRM_TUNNEL is not set
+CONFIG_INET_TUNNEL=3Dm
+CONFIG_INET_XFRM_MODE_TRANSPORT=3Dy
+# CONFIG_INET_XFRM_MODE_TUNNEL is not set
+# CONFIG_INET_XFRM_MODE_BEET is not set
+# CONFIG_INET_LRO is not set
+# CONFIG_INET_DIAG is not set
+# CONFIG_TCP_CONG_ADVANCED is not set
+CONFIG_TCP_CONG_CUBIC=3Dy
+CONFIG_DEFAULT_TCP_CONG=3D"cubic"
+# CONFIG_TCP_MD5SIG is not set
+CONFIG_IPV6=3Dm
+CONFIG_IPV6_PRIVACY=3Dy
+CONFIG_IPV6_ROUTER_PREF=3Dy
+CONFIG_IPV6_ROUTE_INFO=3Dy
+CONFIG_IPV6_OPTIMISTIC_DAD=3Dy
+CONFIG_INET6_AH=3Dm
+CONFIG_INET6_ESP=3Dm
+CONFIG_INET6_IPCOMP=3Dm
+CONFIG_IPV6_MIP6=3Dm
+CONFIG_INET6_XFRM_TUNNEL=3Dm
+CONFIG_INET6_TUNNEL=3Dm
+CONFIG_INET6_XFRM_MODE_TRANSPORT=3Dm
+CONFIG_INET6_XFRM_MODE_TUNNEL=3Dm
+CONFIG_INET6_XFRM_MODE_BEET=3Dm
+CONFIG_INET6_XFRM_MODE_ROUTEOPTIMIZATION=3Dm
+CONFIG_IPV6_SIT=3Dm
+CONFIG_IPV6_NDISC_NODETYPE=3Dy
+CONFIG_IPV6_TUNNEL=3Dm
+CONFIG_IPV6_MULTIPLE_TABLES=3Dy
+CONFIG_IPV6_SUBTREES=3Dy
+CONFIG_IPV6_MROUTE=3Dy
+CONFIG_IPV6_PIMSM_V2=3Dy
+CONFIG_ANDROID_PARANOID_NETWORK=3Dy
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
+CONFIG_NET_SCHED=3Dy
+
+#
+# Queueing/Scheduling
+#
+# CONFIG_NET_SCH_CBQ is not set
+# CONFIG_NET_SCH_HTB is not set
+# CONFIG_NET_SCH_HFSC is not set
+# CONFIG_NET_SCH_PRIO is not set
+# CONFIG_NET_SCH_MULTIQ is not set
+# CONFIG_NET_SCH_RED is not set
+# CONFIG_NET_SCH_SFQ is not set
+# CONFIG_NET_SCH_TEQL is not set
+# CONFIG_NET_SCH_TBF is not set
+# CONFIG_NET_SCH_GRED is not set
+# CONFIG_NET_SCH_DSMARK is not set
+# CONFIG_NET_SCH_NETEM is not set
+# CONFIG_NET_SCH_DRR is not set
+
+#
+# Classification
+#
+# CONFIG_NET_CLS_BASIC is not set
+# CONFIG_NET_CLS_TCINDEX is not set
+# CONFIG_NET_CLS_ROUTE4 is not set
+# CONFIG_NET_CLS_FW is not set
+# CONFIG_NET_CLS_U32 is not set
+# CONFIG_NET_CLS_RSVP is not set
+# CONFIG_NET_CLS_RSVP6 is not set
+# CONFIG_NET_CLS_FLOW is not set
+# CONFIG_NET_CLS_CGROUP is not set
+# CONFIG_NET_EMATCH is not set
+# CONFIG_NET_CLS_ACT is not set
+CONFIG_NET_SCH_FIFO=3Dy
+# CONFIG_DCB is not set
+
+#
+# Network testing
+#
+# CONFIG_NET_PKTGEN is not set
+# CONFIG_HAMRADIO is not set
+# CONFIG_CAN is not set
+# CONFIG_IRDA is not set
+CONFIG_BT=3Dy
+CONFIG_BT_L2CAP=3Dy
+CONFIG_BT_SCO=3Dy
+CONFIG_BT_RFCOMM=3Dy
+CONFIG_BT_RFCOMM_TTY=3Dy
+CONFIG_BT_BNEP=3Dy
+# CONFIG_BT_BNEP_MC_FILTER is not set
+# CONFIG_BT_BNEP_PROTO_FILTER is not set
+CONFIG_BT_HIDP=3Dy
+
+#
+# Bluetooth device drivers
+#
+# CONFIG_BT_HCIBTSDIO is not set
+CONFIG_BT_HCIUART=3Dy
+CONFIG_BT_HCIUART_H4=3Dy
+# CONFIG_BT_HCIUART_BCSP is not set
+CONFIG_BT_HCIUART_LL=3Dy
+# CONFIG_BT_HCIVHCI is not set
+# CONFIG_AF_RXRPC is not set
+# CONFIG_PHONET is not set
+CONFIG_FIB_RULES=3Dy
+CONFIG_WIRELESS=3Dy
+CONFIG_CFG80211=3Dm
+CONFIG_CFG80211_REG_DEBUG=3Dy
+CONFIG_NL80211=3Dy
+CONFIG_WIRELESS_OLD_REGULATORY=3Dy
+CONFIG_WIRELESS_EXT=3Dy
+CONFIG_WIRELESS_EXT_SYSFS=3Dy
+# CONFIG_LIB80211 is not set
+CONFIG_MAC80211=3Dm
+
+#
+# Rate control algorithm selection
+#
+# CONFIG_MAC80211_RC_PID is not set
+CONFIG_MAC80211_RC_MINSTREL=3Dy
+# CONFIG_MAC80211_RC_DEFAULT_PID is not set
+CONFIG_MAC80211_RC_DEFAULT_MINSTREL=3Dy
+CONFIG_MAC80211_RC_DEFAULT=3D"minstrel"
+CONFIG_MAC80211_MESH=3Dy
+CONFIG_MAC80211_LEDS=3Dy
+CONFIG_MAC80211_DEBUGFS=3Dy
+CONFIG_MAC80211_DEBUG_MENU=3Dy
+CONFIG_MAC80211_DEBUG_PACKET_ALIGNMENT=3Dy
+# CONFIG_MAC80211_NOINLINE is not set
+CONFIG_MAC80211_VERBOSE_DEBUG=3Dy
+CONFIG_MAC80211_HT_DEBUG=3Dy
+CONFIG_MAC80211_TKIP_DEBUG=3Dy
+CONFIG_MAC80211_IBSS_DEBUG=3Dy
+CONFIG_MAC80211_VERBOSE_PS_DEBUG=3Dy
+CONFIG_MAC80211_VERBOSE_MPL_DEBUG=3Dy
+CONFIG_MAC80211_DEBUG_COUNTERS=3Dy
+CONFIG_MAC80211_VERBOSE_SPECT_MGMT_DEBUG=3Dy
+# CONFIG_WIMAX is not set
+CONFIG_RFKILL=3Dy
+# CONFIG_RFKILL_PM is not set
+# CONFIG_RFKILL_INPUT is not set
+CONFIG_RFKILL_LEDS=3Dy
+# CONFIG_NET_9P is not set
+
+#
+# Device Drivers
+#
+
+#
+# Generic Driver Options
+#
+CONFIG_UEVENT_HELPER_PATH=3D""
+CONFIG_STANDALONE=3Dy
+CONFIG_PREVENT_FIRMWARE_BUILD=3Dy
+CONFIG_FW_LOADER=3Dy
+# CONFIG_FIRMWARE_IN_KERNEL is not set
+CONFIG_EXTRA_FIRMWARE=3D""
+# CONFIG_SYS_HYPERVISOR is not set
+# CONFIG_CONNECTOR is not set
+CONFIG_MTD=3Dy
+# CONFIG_MTD_DEBUG is not set
+# CONFIG_MTD_CONCAT is not set
+CONFIG_MTD_PARTITIONS=3Dy
+# CONFIG_MTD_TESTS is not set
+# CONFIG_MTD_REDBOOT_PARTS is not set
+CONFIG_MTD_CMDLINE_PARTS=3Dy
+# CONFIG_MTD_AFS_PARTS is not set
+# CONFIG_MTD_AR7_PARTS is not set
+
+#
+# User Modules And Translation Layers
+#
+CONFIG_MTD_CHAR=3Dy
+CONFIG_MTD_BLKDEVS=3Dy
+CONFIG_MTD_BLOCK=3Dy
+# CONFIG_FTL is not set
+# CONFIG_NFTL is not set
+# CONFIG_INFTL is not set
+# CONFIG_RFD_FTL is not set
+# CONFIG_SSFDC is not set
+# CONFIG_MTD_OOPS is not set
+
+#
+# RAM/ROM/Flash chip drivers
+#
+# CONFIG_MTD_CFI is not set
+# CONFIG_MTD_JEDECPROBE is not set
+CONFIG_MTD_MAP_BANK_WIDTH_1=3Dy
+CONFIG_MTD_MAP_BANK_WIDTH_2=3Dy
+CONFIG_MTD_MAP_BANK_WIDTH_4=3Dy
+# CONFIG_MTD_MAP_BANK_WIDTH_8 is not set
+# CONFIG_MTD_MAP_BANK_WIDTH_16 is not set
+# CONFIG_MTD_MAP_BANK_WIDTH_32 is not set
+CONFIG_MTD_CFI_I1=3Dy
+CONFIG_MTD_CFI_I2=3Dy
+# CONFIG_MTD_CFI_I4 is not set
+# CONFIG_MTD_CFI_I8 is not set
+# CONFIG_MTD_RAM is not set
+# CONFIG_MTD_ROM is not set
+# CONFIG_MTD_ABSENT is not set
+
+#
+# Mapping drivers for chip access
+#
+# CONFIG_MTD_COMPLEX_MAPPINGS is not set
+# CONFIG_MTD_PLATRAM is not set
+
+#
+# Self-contained MTD device drivers
+#
+CONFIG_MTD_MSM_NAND=3Dy
+# CONFIG_MTD_DATAFLASH is not set
+# CONFIG_MTD_M25P80 is not set
+# CONFIG_MTD_SLRAM is not set
+# CONFIG_MTD_PHRAM is not set
+# CONFIG_MTD_MTDRAM is not set
+# CONFIG_MTD_BLOCK2MTD is not set
+
+#
+# Disk-On-Chip Device Drivers
+#
+# CONFIG_MTD_DOC2000 is not set
+# CONFIG_MTD_DOC2001 is not set
+# CONFIG_MTD_DOC2001PLUS is not set
+# CONFIG_MTD_NAND is not set
+# CONFIG_MTD_ONENAND is not set
+
+#
+# LPDDR flash memory drivers
+#
+# CONFIG_MTD_LPDDR is not set
+
+#
+# UBI - Unsorted block images
+#
+# CONFIG_MTD_UBI is not set
+# CONFIG_PARPORT is not set
+CONFIG_BLK_DEV=3Dy
+# CONFIG_BLK_DEV_COW_COMMON is not set
+CONFIG_BLK_DEV_LOOP=3Dy
+# CONFIG_BLK_DEV_CRYPTOLOOP is not set
+# CONFIG_BLK_DEV_NBD is not set
+# CONFIG_BLK_DEV_RAM is not set
+# CONFIG_CDROM_PKTCDVD is not set
+# CONFIG_ATA_OVER_ETH is not set
+CONFIG_MISC_DEVICES=3Dy
+# CONFIG_ANDROID_PMEM is not set
+# CONFIG_ICS932S401 is not set
+# CONFIG_ENCLOSURE_SERVICES is not set
+CONFIG_KERNEL_DEBUGGER_CORE=3Dy
+CONFIG_UID_STAT=3Dy
+# CONFIG_WL127X_RFKILL is not set
+# CONFIG_APANIC is not set
+CONFIG_APANIC_PLABEL=3D"kpanic"
+# CONFIG_C2PORT is not set
+
+#
+# EEPROM support
+#
+# CONFIG_EEPROM_AT24 is not set
+# CONFIG_EEPROM_AT25 is not set
+# CONFIG_EEPROM_LEGACY is not set
+# CONFIG_EEPROM_93CX6 is not set
+CONFIG_HAVE_IDE=3Dy
+# CONFIG_IDE is not set
+
+#
+# SCSI device support
+#
+# CONFIG_RAID_ATTRS is not set
+# CONFIG_SCSI is not set
+# CONFIG_SCSI_DMA is not set
+# CONFIG_SCSI_NETLINK is not set
+# CONFIG_ATA is not set
+CONFIG_MD=3Dy
+# CONFIG_BLK_DEV_MD is not set
+CONFIG_BLK_DEV_DM=3Dy
+CONFIG_DM_DEBUG=3Dy
+CONFIG_DM_CRYPT=3Dy
+# CONFIG_DM_SNAPSHOT is not set
+# CONFIG_DM_MIRROR is not set
+# CONFIG_DM_ZERO is not set
+# CONFIG_DM_MULTIPATH is not set
+# CONFIG_DM_DELAY is not set
+CONFIG_DM_UEVENT=3Dy
+CONFIG_NETDEVICES=3Dy
+CONFIG_DUMMY=3Dy
+# CONFIG_BONDING is not set
+# CONFIG_MACVLAN is not set
+# CONFIG_EQUALIZER is not set
+CONFIG_TUN=3Dy
+# CONFIG_VETH is not set
+# CONFIG_PHYLIB is not set
+CONFIG_NET_ETHERNET=3Dy
+CONFIG_MII=3Dy
+# CONFIG_AX88796 is not set
+CONFIG_SMC91X=3Dy
+# CONFIG_DM9000 is not set
+# CONFIG_ENC28J60 is not set
+# CONFIG_SMC911X is not set
+# CONFIG_SMSC911X is not set
+# CONFIG_DNET is not set
+# CONFIG_IBM_NEW_EMAC_ZMII is not set
+# CONFIG_IBM_NEW_EMAC_RGMII is not set
+# CONFIG_IBM_NEW_EMAC_TAH is not set
+# CONFIG_IBM_NEW_EMAC_EMAC4 is not set
+# CONFIG_IBM_NEW_EMAC_NO_FLOW_CTRL is not set
+# CONFIG_IBM_NEW_EMAC_MAL_CLR_ICINTSTAT is not set
+# CONFIG_IBM_NEW_EMAC_MAL_COMMON_ERR is not set
+# CONFIG_B44 is not set
+CONFIG_NETDEV_1000=3Dy
+CONFIG_NETDEV_10000=3Dy
+
+#
+# Wireless LAN
+#
+# CONFIG_WLAN_PRE80211 is not set
+CONFIG_WLAN_80211=3Dy
+# CONFIG_LIBERTAS is not set
+# CONFIG_LIBERTAS_THINFIRM is not set
+# CONFIG_MAC80211_HWSIM is not set
+# CONFIG_P54_COMMON is not set
+# CONFIG_IWLWIFI_LEDS is not set
+# CONFIG_HOSTAP is not set
+# CONFIG_B43 is not set
+# CONFIG_B43LEGACY is not set
+# CONFIG_RT2X00 is not set
+
+#
+# Enable WiMAX (Networking options) to see the WiMAX drivers
+#
+# CONFIG_WAN is not set
+CONFIG_PPP=3Dy
+# CONFIG_PPP_MULTILINK is not set
+# CONFIG_PPP_FILTER is not set
+CONFIG_PPP_ASYNC=3Dy
+# CONFIG_PPP_SYNC_TTY is not set
+CONFIG_PPP_DEFLATE=3Dy
+CONFIG_PPP_BSDCOMP=3Dy
+CONFIG_PPP_MPPE=3Dy
+# CONFIG_PPPOE is not set
+# CONFIG_PPPOL2TP is not set
+CONFIG_PPPOLAC=3Dy
+CONFIG_PPPOPNS=3Dy
+# CONFIG_SLIP is not set
+CONFIG_SLHC=3Dy
+# CONFIG_NETCONSOLE is not set
+# CONFIG_MSM_RMNET is not set
+# CONFIG_NETPOLL is not set
+# CONFIG_NET_POLL_CONTROLLER is not set
+# CONFIG_ISDN is not set
+
+#
+# Input device support
+#
+CONFIG_INPUT=3Dy
+# CONFIG_INPUT_FF_MEMLESS is not set
+CONFIG_INPUT_POLLDEV=3Dy
+
+#
+# Userland interfaces
+#
+CONFIG_INPUT_MOUSEDEV=3Dy
+CONFIG_INPUT_MOUSEDEV_PSAUX=3Dy
+CONFIG_INPUT_MOUSEDEV_SCREEN_X=3D480
+CONFIG_INPUT_MOUSEDEV_SCREEN_Y=3D320
+# CONFIG_INPUT_JOYDEV is not set
+CONFIG_INPUT_EVDEV=3Dy
+# CONFIG_INPUT_EVBUG is not set
+# CONFIG_INPUT_APMPOWER is not set
+CONFIG_INPUT_KEYRESET=3Dy
+
+#
+# Input Device Drivers
+#
+# CONFIG_INPUT_KEYBOARD is not set
+CONFIG_INPUT_MOUSE=3Dy
+# CONFIG_MOUSE_PS2 is not set
+# CONFIG_MOUSE_SERIAL is not set
+# CONFIG_MOUSE_APPLETOUCH is not set
+# CONFIG_MOUSE_BCM5974 is not set
+# CONFIG_MOUSE_VSXXXAA is not set
+CONFIG_MOUSE_GPIO=3Dy
+# CONFIG_INPUT_JOYSTICK is not set
+# CONFIG_INPUT_TABLET is not set
+CONFIG_INPUT_TOUCHSCREEN=3Dy
+# CONFIG_TOUCHSCREEN_ADS7846 is not set
+# CONFIG_TOUCHSCREEN_FUJITSU is not set
+# CONFIG_TOUCHSCREEN_GUNZE is not set
+CONFIG_TOUCHSCREEN_ELAN_I2C_8232=3Dy
+# CONFIG_TOUCHSCREEN_ELO is not set
+# CONFIG_TOUCHSCREEN_WACOM_W8001 is not set
+# CONFIG_TOUCHSCREEN_MTOUCH is not set
+# CONFIG_TOUCHSCREEN_INEXIO is not set
+# CONFIG_TOUCHSCREEN_MK712 is not set
+# CONFIG_TOUCHSCREEN_PENMOUNT is not set
+CONFIG_TOUCHSCREEN_SYNAPTICS_I2C_RMI=3Dy
+# CONFIG_TOUCHSCREEN_TOUCHRIGHT is not set
+# CONFIG_TOUCHSCREEN_TOUCHWIN is not set
+# CONFIG_TOUCHSCREEN_USB_COMPOSITE is not set
+# CONFIG_TOUCHSCREEN_TOUCHIT213 is not set
+# CONFIG_TOUCHSCREEN_TSC2007 is not set
+CONFIG_INPUT_MISC=3Dy
+# CONFIG_INPUT_ATI_REMOTE is not set
+# CONFIG_INPUT_ATI_REMOTE2 is not set
+# CONFIG_INPUT_KEYSPAN_REMOTE is not set
+# CONFIG_INPUT_POWERMATE is not set
+# CONFIG_INPUT_YEALINK is not set
+# CONFIG_INPUT_CM109 is not set
+CONFIG_INPUT_UINPUT=3Dy
+CONFIG_INPUT_GPIO=3Dy
+CONFIG_INPUT_KEYCHORD=3Dy
+
+#
+# Hardware I/O ports
+#
+CONFIG_SERIO=3Dy
+CONFIG_SERIO_SERPORT=3Dy
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
+CONFIG_DEVMEM=3Dy
+CONFIG_DEVKMEM=3Dy
+# CONFIG_SERIAL_NONSTANDARD is not set
+
+#
+# Serial drivers
+#
+# CONFIG_SERIAL_8250 is not set
+
+#
+# Non-8250 serial port support
+#
+CONFIG_SERIAL_CORE=3Dy
+CONFIG_SERIAL_MSM=3Dy
+# CONFIG_SERIAL_MSM_CONSOLE is not set
+CONFIG_SERIAL_MSM_CLOCK_CONTROL=3Dy
+CONFIG_SERIAL_MSM_RX_WAKEUP=3Dy
+CONFIG_SERIAL_MSM_HS=3Dy
+CONFIG_UNIX98_PTYS=3Dy
+CONFIG_DEVPTS_MULTIPLE_INSTANCES=3Dy
+# CONFIG_LEGACY_PTYS is not set
+# CONFIG_IPMI_HANDLER is not set
+# CONFIG_HW_RANDOM is not set
+# CONFIG_R3964 is not set
+# CONFIG_RAW_DRIVER is not set
+# CONFIG_TCG_TPM is not set
+# CONFIG_DCC_TTY is not set
+CONFIG_I2C=3Dy
+CONFIG_I2C_BOARDINFO=3Dy
+# CONFIG_I2C_CHARDEV is not set
+CONFIG_I2C_HELPER_AUTO=3Dy
+
+#
+# I2C Hardware Bus support
+#
+
+#
+# I2C system bus drivers (mostly embedded / system-on-chip)
+#
+# CONFIG_I2C_GPIO is not set
+CONFIG_I2C_MSM=3Dy
+# CONFIG_I2C_OCORES is not set
+# CONFIG_I2C_SIMTEC is not set
+
+#
+# External I2C/SMBus adapter drivers
+#
+# CONFIG_I2C_PARPORT_LIGHT is not set
+# CONFIG_I2C_TAOS_EVM is not set
+
+#
+# Other I2C/SMBus bus drivers
+#
+# CONFIG_I2C_PCA_PLATFORM is not set
+# CONFIG_I2C_STUB is not set
+
+#
+# Miscellaneous I2C Chip support
+#
+# CONFIG_DS1682 is not set
+# CONFIG_SENSORS_PCF8574 is not set
+# CONFIG_PCF8575 is not set
+# CONFIG_SENSORS_PCA9539 is not set
+# CONFIG_SENSORS_PCF8591 is not set
+# CONFIG_SENSORS_MAX6875 is not set
+# CONFIG_SENSORS_TSL2550 is not set
+CONFIG_SENSORS_AKM8976=3Dy
+CONFIG_SENSORS_PCA963X=3Dy
+# CONFIG_SENSORS_MT9T013 is not set
+# CONFIG_I2C_DEBUG_CORE is not set
+# CONFIG_I2C_DEBUG_ALGO is not set
+# CONFIG_I2C_DEBUG_BUS is not set
+# CONFIG_I2C_DEBUG_CHIP is not set
+CONFIG_SPI=3Dy
+CONFIG_SPI_MASTER=3Dy
+
+#
+# SPI Master Controller Drivers
+#
+CONFIG_SPI_BITBANG=3Dy
+# CONFIG_SPI_GPIO is not set
+
+#
+# SPI Protocol Masters
+#
+# CONFIG_SPI_SPIDEV is not set
+# CONFIG_SPI_TLE62X0 is not set
+# CONFIG_W1 is not set
+CONFIG_POWER_SUPPLY=3Dy
+# CONFIG_POWER_SUPPLY_DEBUG is not set
+# CONFIG_PDA_POWER is not set
+# CONFIG_APM_POWER is not set
+# CONFIG_BATTERY_DS2760 is not set
+# CONFIG_BATTERY_BQ27x00 is not set
+# CONFIG_HWMON is not set
+# CONFIG_THERMAL is not set
+# CONFIG_THERMAL_HWMON is not set
+# CONFIG_WATCHDOG is not set
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
+# CONFIG_TWL4030_CORE is not set
+# CONFIG_MFD_TMIO is not set
+# CONFIG_PMIC_DA903X is not set
+# CONFIG_MFD_WM8400 is not set
+# CONFIG_MFD_WM8350_I2C is not set
+# CONFIG_MFD_PCF50633 is not set
+
+#
+# Multimedia devices
+#
+
+#
+# Multimedia core support
+#
+CONFIG_VIDEO_DEV=3Dy
+CONFIG_VIDEO_V4L2_COMMON=3Dy
+# CONFIG_VIDEO_ALLOW_V4L1 is not set
+CONFIG_VIDEO_V4L1_COMPAT=3Dy
+# CONFIG_DVB_CORE is not set
+CONFIG_VIDEO_MEDIA=3Dy
+
+#
+# Multimedia drivers
+#
+# CONFIG_MEDIA_ATTACH is not set
+CONFIG_MEDIA_TUNER=3Dy
+# CONFIG_MEDIA_TUNER_CUSTOMIZE is not set
+CONFIG_MEDIA_TUNER_SIMPLE=3Dy
+CONFIG_MEDIA_TUNER_TDA8290=3Dy
+CONFIG_MEDIA_TUNER_TDA9887=3Dy
+CONFIG_MEDIA_TUNER_TEA5761=3Dy
+CONFIG_MEDIA_TUNER_TEA5767=3Dy
+CONFIG_MEDIA_TUNER_MT20XX=3Dy
+CONFIG_MEDIA_TUNER_XC2028=3Dy
+CONFIG_MEDIA_TUNER_XC5000=3Dy
+CONFIG_VIDEO_V4L2=3Dy
+CONFIG_VIDEO_CAPTURE_DRIVERS=3Dy
+# CONFIG_VIDEO_ADV_DEBUG is not set
+# CONFIG_VIDEO_FIXED_MINOR_RANGES is not set
+CONFIG_VIDEO_HELPER_CHIPS_AUTO=3Dy
+# CONFIG_VIDEO_VIVI is not set
+# CONFIG_VIDEO_SAA5246A is not set
+# CONFIG_VIDEO_SAA5249 is not set
+# CONFIG_SOC_CAMERA is not set
+
+#
+# Qualcomm MSM Camera And Video
+#
+CONFIG_MSM_CAMERA=3Dy
+# CONFIG_MSM_CAMERA_DEBUG is not set
+# CONFIG_MSM_CAMERA_FLASH is not set
+
+#
+# Camera Sensor Selection
+#
+CONFIG_MT9T013=3Dy
+# CONFIG_MT9D112 is not set
+# CONFIG_MT9P012 is not set
+# CONFIG_S5K3E2FX is not set
+CONFIG_RADIO_ADAPTERS=3Dy
+# CONFIG_RADIO_TEA5764 is not set
+CONFIG_DAB=3Dy
+
+#
+# Graphics support
+#
+# CONFIG_VGASTATE is not set
+CONFIG_VIDEO_OUTPUT_CONTROL=3Dy
+CONFIG_FB=3Dy
+CONFIG_FIRMWARE_EDID=3Dy
+# CONFIG_FB_DDC is not set
+# CONFIG_FB_BOOT_VESA_SUPPORT is not set
+CONFIG_FB_CFB_FILLRECT=3Dy
+CONFIG_FB_CFB_COPYAREA=3Dy
+CONFIG_FB_CFB_IMAGEBLIT=3Dy
+# CONFIG_FB_CFB_REV_PIXELS_IN_BYTE is not set
+CONFIG_FB_SYS_FILLRECT=3Dy
+CONFIG_FB_SYS_COPYAREA=3Dy
+CONFIG_FB_SYS_IMAGEBLIT=3Dy
+CONFIG_FB_FOREIGN_ENDIAN=3Dy
+CONFIG_FB_BOTH_ENDIAN=3Dy
+# CONFIG_FB_BIG_ENDIAN is not set
+# CONFIG_FB_LITTLE_ENDIAN is not set
+CONFIG_FB_SYS_FOPS=3Dy
+CONFIG_FB_DEFERRED_IO=3Dy
+# CONFIG_FB_SVGALIB is not set
+# CONFIG_FB_MACMODES is not set
+# CONFIG_FB_BACKLIGHT is not set
+CONFIG_FB_MODE_HELPERS=3Dy
+CONFIG_FB_TILEBLITTING=3Dy
+
+#
+# Frame buffer hardware drivers
+#
+CONFIG_FB_S1D13XXX=3Dy
+# CONFIG_FB_VIRTUAL is not set
+CONFIG_FB_METRONOME=3Dy
+CONFIG_FB_MB862XX=3Dy
+CONFIG_FB_MSM=3Dy
+CONFIG_FB_MSM_REFRESH=3Dy
+CONFIG_BACKLIGHT_LCD_SUPPORT=3Dy
+CONFIG_LCD_CLASS_DEVICE=3Dm
+CONFIG_LCD_LTV350QV=3Dm
+CONFIG_LCD_ILI9320=3Dm
+CONFIG_LCD_TDO24M=3Dm
+CONFIG_LCD_VGG2432A4=3Dm
+CONFIG_LCD_PLATFORM=3Dm
+CONFIG_BACKLIGHT_CLASS_DEVICE=3Dm
+CONFIG_BACKLIGHT_GENERIC=3Dm
+
+#
+# Display device support
+#
+# CONFIG_DISPLAY_SUPPORT is not set
+
+#
+# Console display driver support
+#
+# CONFIG_VGA_CONSOLE is not set
+CONFIG_DUMMY_CONSOLE=3Dy
+CONFIG_FRAMEBUFFER_CONSOLE=3Dy
+CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY=3Dy
+CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=3Dy
+# CONFIG_FONTS is not set
+CONFIG_FONT_8x8=3Dy
+CONFIG_FONT_8x16=3Dy
+CONFIG_LOGO=3Dy
+# CONFIG_LOGO_LINUX_MONO is not set
+# CONFIG_LOGO_LINUX_VGA16 is not set
+CONFIG_LOGO_LINUX_CLUT224=3Dy
+CONFIG_SOUND=3Dm
+CONFIG_SOUND_OSS_CORE=3Dy
+CONFIG_SND=3Dm
+CONFIG_SND_TIMER=3Dm
+CONFIG_SND_PCM=3Dm
+CONFIG_SND_SEQUENCER=3Dm
+CONFIG_SND_SEQ_DUMMY=3Dm
+CONFIG_SND_OSSEMUL=3Dy
+CONFIG_SND_MIXER_OSS=3Dm
+CONFIG_SND_PCM_OSS=3Dm
+CONFIG_SND_PCM_OSS_PLUGINS=3Dy
+CONFIG_SND_SEQUENCER_OSS=3Dy
+# CONFIG_SND_HRTIMER is not set
+# CONFIG_SND_DYNAMIC_MINORS is not set
+CONFIG_SND_SUPPORT_OLD_API=3Dy
+CONFIG_SND_VERBOSE_PROCFS=3Dy
+# CONFIG_SND_VERBOSE_PRINTK is not set
+# CONFIG_SND_DEBUG is not set
+CONFIG_SND_DRIVERS=3Dy
+# CONFIG_SND_DUMMY is not set
+# CONFIG_SND_VIRMIDI is not set
+# CONFIG_SND_MTPAV is not set
+# CONFIG_SND_SERIAL_U16550 is not set
+# CONFIG_SND_MPU401 is not set
+CONFIG_SND_ARM=3Dy
+CONFIG_SND_SPI=3Dy
+CONFIG_SND_SOC=3Dm
+
+#
+# MSM SoC Audio support
+#
+CONFIG_SND_MSM_SOC=3Dm
+CONFIG_SND_MSM_DAI_SOC=3Dm
+CONFIG_SND_MSM_SOC_MSM7K=3Dm
+CONFIG_SND_SOC_I2C_AND_SPI=3Dm
+CONFIG_SND_SOC_ALL_CODECS=3Dm
+CONFIG_SND_SOC_AD73311=3Dm
+CONFIG_SND_SOC_AK4535=3Dm
+CONFIG_SND_SOC_CS4270=3Dm
+CONFIG_SND_SOC_L3=3Dm
+CONFIG_SND_SOC_PCM3008=3Dm
+CONFIG_SND_SOC_SSM2602=3Dm
+CONFIG_SND_SOC_TLV320AIC23=3Dm
+CONFIG_SND_SOC_TLV320AIC26=3Dm
+CONFIG_SND_SOC_TLV320AIC3X=3Dm
+CONFIG_SND_SOC_UDA134X=3Dm
+CONFIG_SND_SOC_UDA1380=3Dm
+CONFIG_SND_SOC_WM8510=3Dm
+CONFIG_SND_SOC_WM8580=3Dm
+CONFIG_SND_SOC_WM8728=3Dm
+CONFIG_SND_SOC_WM8731=3Dm
+CONFIG_SND_SOC_WM8750=3Dm
+CONFIG_SND_SOC_WM8753=3Dm
+CONFIG_SND_SOC_WM8900=3Dm
+CONFIG_SND_SOC_WM8903=3Dm
+CONFIG_SND_SOC_WM8971=3Dm
+CONFIG_SND_SOC_WM8990=3Dm
+# CONFIG_SOUND_PRIME is not set
+CONFIG_HID_SUPPORT=3Dy
+CONFIG_HID=3Dy
+# CONFIG_HID_DEBUG is not set
+# CONFIG_HIDRAW is not set
+# CONFIG_HID_PID is not set
+
+#
+# Special HID drivers
+#
+CONFIG_HID_COMPAT=3Dy
+# CONFIG_HID_APPLE is not set
+CONFIG_USB_SUPPORT=3Dy
+CONFIG_USB_ARCH_HAS_HCD=3Dy
+# CONFIG_USB_ARCH_HAS_OHCI is not set
+# CONFIG_USB_ARCH_HAS_EHCI is not set
+# CONFIG_USB is not set
+# CONFIG_USB_OTG_WHITELIST is not set
+# CONFIG_USB_OTG_BLACKLIST_HUB is not set
+# CONFIG_USB_GADGET_MUSB_HDRC is not set
+
+#
+# NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may also be needed;
+#
+CONFIG_USB_GADGET=3Dy
+# CONFIG_USB_GADGET_DEBUG_FILES is not set
+# CONFIG_USB_GADGET_DEBUG_FS is not set
+CONFIG_USB_GADGET_VBUS_DRAW=3D2
+CONFIG_USB_GADGET_SELECTED=3Dy
+# CONFIG_USB_GADGET_AT91 is not set
+# CONFIG_USB_GADGET_ATMEL_USBA is not set
+# CONFIG_USB_GADGET_FSL_USB2 is not set
+# CONFIG_USB_GADGET_LH7A40X is not set
+# CONFIG_USB_GADGET_OMAP is not set
+# CONFIG_USB_GADGET_PXA25X is not set
+# CONFIG_USB_GADGET_PXA27X is not set
+# CONFIG_USB_GADGET_S3C2410 is not set
+# CONFIG_USB_GADGET_IMX is not set
+# CONFIG_USB_GADGET_M66592 is not set
+# CONFIG_USB_GADGET_AMD5536UDC is not set
+# CONFIG_USB_GADGET_FSL_QE is not set
+# CONFIG_USB_GADGET_CI13XXX is not set
+# CONFIG_USB_GADGET_NET2280 is not set
+# CONFIG_USB_GADGET_GOKU is not set
+CONFIG_USB_GADGET_MSM_72K=3Dy
+CONFIG_USB_MSM_72K=3Dy
+# CONFIG_USB_GADGET_DUMMY_HCD is not set
+CONFIG_USB_GADGET_DUALSPEED=3Dy
+# CONFIG_USB_ZERO is not set
+CONFIG_USB_ETH=3Dm
+# CONFIG_USB_ETH_RNDIS is not set
+# CONFIG_USB_GADGETFS is not set
+# CONFIG_USB_FILE_STORAGE is not set
+# CONFIG_USB_G_SERIAL is not set
+# CONFIG_USB_MIDI_GADGET is not set
+# CONFIG_USB_G_PRINTER is not set
+# CONFIG_USB_ANDROID is not set
+# CONFIG_USB_CDC_COMPOSITE is not set
+
+#
+# OTG and related infrastructure
+#
+# CONFIG_USB_GPIO_VBUS is not set
+
+#
+# USB Function Support
+#
+# CONFIG_USB_FUNCTION is not set
+CONFIG_MMC=3Dy
+# CONFIG_MMC_DEBUG is not set
+CONFIG_MMC_UNSAFE_RESUME=3Dy
+CONFIG_MMC_EMBEDDED_SDIO=3Dy
+CONFIG_MMC_PARANOID_SD_INIT=3Dy
+
+#
+# MMC/SD/SDIO Card Drivers
+#
+CONFIG_MMC_BLOCK=3Dy
+# CONFIG_MMC_BLOCK_BOUNCE is not set
+# CONFIG_MMC_BLOCK_DEFERRED_RESUME is not set
+# CONFIG_SDIO_UART is not set
+# CONFIG_MMC_TEST is not set
+
+#
+# MMC/SD/SDIO Host Controller Drivers
+#
+# CONFIG_MMC_SDHCI is not set
+# CONFIG_MMC_SPI is not set
+CONFIG_MMC_MSM7X00A=3Dy
+# CONFIG_MMC_MSM7X00A_RESUME_IN_WQ is not set
+# CONFIG_MEMSTICK is not set
+# CONFIG_ACCESSIBILITY is not set
+CONFIG_NEW_LEDS=3Dy
+CONFIG_LEDS_CLASS=3Dy
+
+#
+# LED drivers
+#
+# CONFIG_LEDS_PCA9532 is not set
+CONFIG_LEDS_GPIO=3Dy
+CONFIG_LEDS_CPLD=3Dy
+# CONFIG_LEDS_PCA955X is not set
+
+#
+# LED Triggers
+#
+CONFIG_LEDS_TRIGGERS=3Dy
+CONFIG_LEDS_TRIGGER_TIMER=3Dy
+CONFIG_LEDS_TRIGGER_HEARTBEAT=3Dy
+# CONFIG_LEDS_TRIGGER_BACKLIGHT is not set
+# CONFIG_LEDS_TRIGGER_DEFAULT_ON is not set
+CONFIG_LEDS_TRIGGER_SLEEP=3Dy
+CONFIG_SWITCH=3Dy
+CONFIG_SWITCH_GPIO=3Dy
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
+CONFIG_RTC_INTF_DEV_UIE_EMUL=3Dy
+CONFIG_RTC_INTF_ALARM=3Dy
+# CONFIG_RTC_DRV_TEST is not set
+
+#
+# I2C RTC drivers
+#
+# CONFIG_RTC_DRV_DS1307 is not set
+# CONFIG_RTC_DRV_DS1374 is not set
+# CONFIG_RTC_DRV_DS1672 is not set
+# CONFIG_RTC_DRV_MAX6900 is not set
+# CONFIG_RTC_DRV_RS5C372 is not set
+# CONFIG_RTC_DRV_ISL1208 is not set
+# CONFIG_RTC_DRV_X1205 is not set
+# CONFIG_RTC_DRV_PCF8563 is not set
+# CONFIG_RTC_DRV_PCF8583 is not set
+# CONFIG_RTC_DRV_M41T80 is not set
+# CONFIG_RTC_DRV_S35390A is not set
+# CONFIG_RTC_DRV_FM3130 is not set
+# CONFIG_RTC_DRV_RX8581 is not set
+
+#
+# SPI RTC drivers
+#
+# CONFIG_RTC_DRV_M41T94 is not set
+# CONFIG_RTC_DRV_DS1305 is not set
+# CONFIG_RTC_DRV_DS1390 is not set
+# CONFIG_RTC_DRV_MAX6902 is not set
+# CONFIG_RTC_DRV_R9701 is not set
+# CONFIG_RTC_DRV_RS5C348 is not set
+# CONFIG_RTC_DRV_DS3234 is not set
+
+#
+# Platform RTC drivers
+#
+# CONFIG_RTC_DRV_CMOS is not set
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
+CONFIG_RTC_DRV_MSM7X00A=3Dy
+# CONFIG_DMADEVICES is not set
+# CONFIG_REGULATOR is not set
+# CONFIG_UIO is not set
+CONFIG_STAGING=3Dy
+# CONFIG_STAGING_EXCLUDE_BUILD is not set
+# CONFIG_MEILHAUS is not set
+# CONFIG_ECHO is not set
+# CONFIG_AGNX is not set
+# CONFIG_COMEDI is not set
+
+#
+# Android
+#
+CONFIG_ANDROID=3Dy
+# CONFIG_ANDROID_BINDER_IPC is not set
+# CONFIG_ANDROID_LOGGER is not set
+# CONFIG_ANDROID_RAM_CONSOLE is not set
+CONFIG_ANDROID_TIMED_OUTPUT=3Dy
+CONFIG_ANDROID_TIMED_GPIO=3Dy
+# CONFIG_ANDROID_LOW_MEMORY_KILLER is not set
+
+#
+# File systems
+#
+CONFIG_EXT2_FS=3Dy
+CONFIG_EXT2_FS_XATTR=3Dy
+CONFIG_EXT2_FS_POSIX_ACL=3Dy
+CONFIG_EXT2_FS_SECURITY=3Dy
+CONFIG_EXT2_FS_XIP=3Dy
+CONFIG_EXT3_FS=3Dm
+CONFIG_EXT3_FS_XATTR=3Dy
+CONFIG_EXT3_FS_POSIX_ACL=3Dy
+CONFIG_EXT3_FS_SECURITY=3Dy
+CONFIG_EXT4_FS=3Dm
+CONFIG_EXT4DEV_COMPAT=3Dy
+CONFIG_EXT4_FS_XATTR=3Dy
+CONFIG_EXT4_FS_POSIX_ACL=3Dy
+CONFIG_EXT4_FS_SECURITY=3Dy
+CONFIG_FS_XIP=3Dy
+CONFIG_JBD=3Dm
+CONFIG_JBD_DEBUG=3Dy
+CONFIG_JBD2=3Dm
+CONFIG_JBD2_DEBUG=3Dy
+CONFIG_FS_MBCACHE=3Dy
+# CONFIG_REISERFS_FS is not set
+# CONFIG_JFS_FS is not set
+CONFIG_FS_POSIX_ACL=3Dy
+CONFIG_FILE_LOCKING=3Dy
+# CONFIG_XFS_FS is not set
+# CONFIG_OCFS2_FS is not set
+# CONFIG_BTRFS_FS is not set
+# CONFIG_DNOTIFY is not set
+CONFIG_INOTIFY=3Dy
+CONFIG_INOTIFY_USER=3Dy
+# CONFIG_QUOTA is not set
+# CONFIG_AUTOFS_FS is not set
+# CONFIG_AUTOFS4_FS is not set
+# CONFIG_FUSE_FS is not set
+
+#
+# CD-ROM/DVD Filesystems
+#
+# CONFIG_ISO9660_FS is not set
+# CONFIG_UDF_FS is not set
+
+#
+# DOS/FAT/NT Filesystems
+#
+CONFIG_FAT_FS=3Dy
+# CONFIG_MSDOS_FS is not set
+CONFIG_VFAT_FS=3Dy
+CONFIG_FAT_DEFAULT_CODEPAGE=3D437
+CONFIG_FAT_DEFAULT_IOCHARSET=3D"iso8859-1"
+# CONFIG_NTFS_FS is not set
+
+#
+# Pseudo filesystems
+#
+CONFIG_PROC_FS=3Dy
+CONFIG_PROC_SYSCTL=3Dy
+CONFIG_PROC_PAGE_MONITOR=3Dy
+CONFIG_SYSFS=3Dy
+CONFIG_TMPFS=3Dy
+# CONFIG_TMPFS_POSIX_ACL is not set
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
+CONFIG_YAFFS_FS=3Dy
+CONFIG_YAFFS_YAFFS1=3Dy
+# CONFIG_YAFFS_9BYTE_TAGS is not set
+# CONFIG_YAFFS_DOES_ECC is not set
+CONFIG_YAFFS_YAFFS2=3Dy
+CONFIG_YAFFS_AUTO_YAFFS2=3Dy
+# CONFIG_YAFFS_DISABLE_LAZY_LOAD is not set
+# CONFIG_YAFFS_DISABLE_WIDE_TNODES is not set
+# CONFIG_YAFFS_ALWAYS_CHECK_CHUNK_ERASED is not set
+CONFIG_YAFFS_SHORT_NAMES_IN_RAM=3Dy
+CONFIG_JFFS2_FS=3Dy
+CONFIG_JFFS2_FS_DEBUG=3D0
+CONFIG_JFFS2_FS_WRITEBUFFER=3Dy
+CONFIG_JFFS2_FS_WBUF_VERIFY=3Dy
+CONFIG_JFFS2_SUMMARY=3Dy
+CONFIG_JFFS2_FS_XATTR=3Dy
+CONFIG_JFFS2_FS_POSIX_ACL=3Dy
+CONFIG_JFFS2_FS_SECURITY=3Dy
+CONFIG_JFFS2_COMPRESSION_OPTIONS=3Dy
+CONFIG_JFFS2_ZLIB=3Dy
+CONFIG_JFFS2_LZO=3Dy
+CONFIG_JFFS2_RTIME=3Dy
+CONFIG_JFFS2_RUBIN=3Dy
+# CONFIG_JFFS2_CMODE_NONE is not set
+CONFIG_JFFS2_CMODE_PRIORITY=3Dy
+# CONFIG_JFFS2_CMODE_SIZE is not set
+# CONFIG_JFFS2_CMODE_FAVOURLZO is not set
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
+CONFIG_NETWORK_FILESYSTEMS=3Dy
+CONFIG_NFS_FS=3Dm
+CONFIG_NFS_V3=3Dy
+CONFIG_NFS_V3_ACL=3Dy
+CONFIG_NFS_V4=3Dy
+# CONFIG_NFSD is not set
+CONFIG_LOCKD=3Dm
+CONFIG_LOCKD_V4=3Dy
+CONFIG_NFS_ACL_SUPPORT=3Dm
+CONFIG_NFS_COMMON=3Dy
+CONFIG_SUNRPC=3Dm
+CONFIG_SUNRPC_GSS=3Dm
+# CONFIG_SUNRPC_REGISTER_V4 is not set
+CONFIG_RPCSEC_GSS_KRB5=3Dm
+# CONFIG_RPCSEC_GSS_SPKM3 is not set
+# CONFIG_SMB_FS is not set
+CONFIG_CIFS=3Dm
+CONFIG_CIFS_STATS=3Dy
+CONFIG_CIFS_STATS2=3Dy
+CONFIG_CIFS_WEAK_PW_HASH=3Dy
+CONFIG_CIFS_XATTR=3Dy
+CONFIG_CIFS_POSIX=3Dy
+CONFIG_CIFS_DEBUG2=3Dy
+CONFIG_CIFS_EXPERIMENTAL=3Dy
+# CONFIG_NCP_FS is not set
+# CONFIG_CODA_FS is not set
+# CONFIG_AFS_FS is not set
+
+#
+# Partition Types
+#
+# CONFIG_PARTITION_ADVANCED is not set
+CONFIG_MSDOS_PARTITION=3Dy
+CONFIG_NLS=3Dy
+CONFIG_NLS_DEFAULT=3D"iso8859-1"
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
+# CONFIG_NLS_ASCII is not set
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
+# CONFIG_NLS_UTF8 is not set
+# CONFIG_DLM is not set
+
+#
+# Kernel hacking
+#
+CONFIG_PRINTK_TIME=3Dy
+CONFIG_ENABLE_WARN_DEPRECATED=3Dy
+CONFIG_ENABLE_MUST_CHECK=3Dy
+CONFIG_FRAME_WARN=3D1024
+CONFIG_MAGIC_SYSRQ=3Dy
+# CONFIG_UNUSED_SYMBOLS is not set
+CONFIG_DEBUG_FS=3Dy
+# CONFIG_HEADERS_CHECK is not set
+# CONFIG_DEBUG_KERNEL is not set
+# CONFIG_DEBUG_BUGVERBOSE is not set
+# CONFIG_DEBUG_MEMORY_INIT is not set
+CONFIG_FRAME_POINTER=3Dy
+# CONFIG_RCU_CPU_STALL_DETECTOR is not set
+# CONFIG_LATENCYTOP is not set
+CONFIG_HAVE_FUNCTION_TRACER=3Dy
+
+#
+# Tracers
+#
+# CONFIG_DYNAMIC_PRINTK_DEBUG is not set
+# CONFIG_SAMPLES is not set
+CONFIG_HAVE_ARCH_KGDB=3Dy
+# CONFIG_DEBUG_USER is not set
+
+#
+# Security options
+#
+# CONFIG_KEYS is not set
+# CONFIG_SECURITY is not set
+# CONFIG_SECURITYFS is not set
+# CONFIG_SECURITY_FILE_CAPABILITIES is not set
+CONFIG_CRYPTO=3Dy
+
+#
+# Crypto core or helper
+#
+# CONFIG_CRYPTO_FIPS is not set
+CONFIG_CRYPTO_ALGAPI=3Dy
+CONFIG_CRYPTO_ALGAPI2=3Dy
+CONFIG_CRYPTO_AEAD=3Dy
+CONFIG_CRYPTO_AEAD2=3Dy
+CONFIG_CRYPTO_BLKCIPHER=3Dy
+CONFIG_CRYPTO_BLKCIPHER2=3Dy
+CONFIG_CRYPTO_HASH=3Dy
+CONFIG_CRYPTO_HASH2=3Dy
+CONFIG_CRYPTO_RNG2=3Dy
+CONFIG_CRYPTO_MANAGER=3Dy
+CONFIG_CRYPTO_MANAGER2=3Dy
+# CONFIG_CRYPTO_GF128MUL is not set
+# CONFIG_CRYPTO_NULL is not set
+# CONFIG_CRYPTO_CRYPTD is not set
+CONFIG_CRYPTO_AUTHENC=3Dy
+# CONFIG_CRYPTO_TEST is not set
+
+#
+# Authenticated Encryption with Associated Data
+#
+# CONFIG_CRYPTO_CCM is not set
+# CONFIG_CRYPTO_GCM is not set
+# CONFIG_CRYPTO_SEQIV is not set
+
+#
+# Block modes
+#
+CONFIG_CRYPTO_CBC=3Dy
+# CONFIG_CRYPTO_CTR is not set
+# CONFIG_CRYPTO_CTS is not set
+CONFIG_CRYPTO_ECB=3Dy
+# CONFIG_CRYPTO_LRW is not set
+# CONFIG_CRYPTO_PCBC is not set
+# CONFIG_CRYPTO_XTS is not set
+
+#
+# Hash modes
+#
+CONFIG_CRYPTO_HMAC=3Dy
+# CONFIG_CRYPTO_XCBC is not set
+
+#
+# Digest
+#
+# CONFIG_CRYPTO_CRC32C is not set
+# CONFIG_CRYPTO_MD4 is not set
+CONFIG_CRYPTO_MD5=3Dy
+# CONFIG_CRYPTO_MICHAEL_MIC is not set
+# CONFIG_CRYPTO_RMD128 is not set
+# CONFIG_CRYPTO_RMD160 is not set
+# CONFIG_CRYPTO_RMD256 is not set
+# CONFIG_CRYPTO_RMD320 is not set
+CONFIG_CRYPTO_SHA1=3Dy
+# CONFIG_CRYPTO_SHA256 is not set
+# CONFIG_CRYPTO_SHA512 is not set
+# CONFIG_CRYPTO_TGR192 is not set
+# CONFIG_CRYPTO_WP512 is not set
+
+#
+# Ciphers
+#
+CONFIG_CRYPTO_AES=3Dy
+# CONFIG_CRYPTO_ANUBIS is not set
+CONFIG_CRYPTO_ARC4=3Dy
+# CONFIG_CRYPTO_BLOWFISH is not set
+# CONFIG_CRYPTO_CAMELLIA is not set
+# CONFIG_CRYPTO_CAST5 is not set
+# CONFIG_CRYPTO_CAST6 is not set
+CONFIG_CRYPTO_DES=3Dy
+# CONFIG_CRYPTO_FCRYPT is not set
+# CONFIG_CRYPTO_KHAZAD is not set
+# CONFIG_CRYPTO_SALSA20 is not set
+# CONFIG_CRYPTO_SEED is not set
+# CONFIG_CRYPTO_SERPENT is not set
+# CONFIG_CRYPTO_TEA is not set
+CONFIG_CRYPTO_TWOFISH=3Dy
+CONFIG_CRYPTO_TWOFISH_COMMON=3Dy
+
+#
+# Compression
+#
+CONFIG_CRYPTO_DEFLATE=3Dm
+# CONFIG_CRYPTO_LZO is not set
+
+#
+# Random Number Generation
+#
+# CONFIG_CRYPTO_ANSI_CPRNG is not set
+CONFIG_CRYPTO_HW=3Dy
+
+#
+# Library routines
+#
+CONFIG_BITREVERSE=3Dy
+CONFIG_GENERIC_FIND_LAST_BIT=3Dy
+CONFIG_CRC_CCITT=3Dy
+CONFIG_CRC16=3Dm
+# CONFIG_CRC_T10DIF is not set
+# CONFIG_CRC_ITU_T is not set
+CONFIG_CRC32=3Dy
+CONFIG_CRC7=3Dm
+# CONFIG_LIBCRC32C is not set
+CONFIG_ZLIB_INFLATE=3Dy
+CONFIG_ZLIB_DEFLATE=3Dy
+CONFIG_LZO_COMPRESS=3Dy
+CONFIG_LZO_DECOMPRESS=3Dy
+CONFIG_PLIST=3Dy
+CONFIG_HAS_IOMEM=3Dy
+CONFIG_HAS_IOPORT=3Dy
+CONFIG_HAS_DMA=3Dy
diff --git a/recipes/linux/linux-replicant/htcdream/msm_snd.patch b/recipes=
/linux/linux-replicant/htcdream/msm_snd.patch
new file mode 100644
index 0000000..cdc354d
--- /dev/null
+++ b/recipes/linux/linux-replicant/htcdream/msm_snd.patch
@@ -0,0 +1,3160 @@
+commit 92945ccd0921e940fc2675dc394141db0f7c1386
+Author: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
+Date:   Sat Oct 17 23:37:16 2009 +0200
+
+    Sound: MSM soc : imported alsa for the MSM from codeaurora
+   =20
+    I had to make two little change to make it compile:
+    snd_ep =3D msm_rpc_connect_compatible(snd_rpc_ids.prog,
+    became:
+    snd_ep =3D msm_rpc_connect(snd_rpc_ids.prog,
+    and I also changed snd_rpc_ids.vers(with ifdefs)
+    to a known and working magick number:
+   =20
+    it still has serious runtime problems such as:
+    *can produce kernel oops under theses conditions:
+    start alsamixer and if the second bar is on 0 or 4 it can play music w=
ith aplay
+    increase the routing alsamixer bar to the max
+    decrease the routing bar to 4 or less
+    then It may have a null pointer problem
+    That bug could be because it tries to route to route to speakers and h=
andset
+    at the same time(SND_DEVICE_HEADSET_AND_SPEAKER in android)
+    that is to say it could be the same bug than here:
+    http://gitorious.org/replicant/msm7k/commit/370d37a088368ca8cc478e76c9=
28a1ce6589495e
+    but I need time to verify that
+    *can pannick if you send things to /dev/dsp when the oss emulation is =
activated
+    *only aplay works(mplayer,gstreamer don't work)
+    for mplayer an ioctl didn't return...so it get stuck before playing
+    I traced it until
+    rc =3D wait_event_interruptible(the_locks.read_wait,(prtd->in_count > =
0)|| prtd->stopped);
+    in msm-pcm.c
+
+diff --git a/sound/soc/Kconfig b/sound/soc/Kconfig
+index ef025c6..4b1a48f 100644
+--- a/sound/soc/Kconfig
++++ b/sound/soc/Kconfig
+@@ -32,6 +32,7 @@ source "sound/soc/omap/Kconfig"
+ source "sound/soc/pxa/Kconfig"
+ source "sound/soc/s3c24xx/Kconfig"
+ source "sound/soc/sh/Kconfig"
++source "sound/soc/msm/Kconfig"
+=20
+ # Supported codecs
+ source "sound/soc/codecs/Kconfig"
+diff --git a/sound/soc/Makefile b/sound/soc/Makefile
+index 86a9b1f..ea754e5 100644
+--- a/sound/soc/Makefile
++++ b/sound/soc/Makefile
+@@ -11,3 +11,4 @@ obj-$(CONFIG_SND_SOC)	+=3D omap/
+ obj-$(CONFIG_SND_SOC)	+=3D pxa/
+ obj-$(CONFIG_SND_SOC)	+=3D s3c24xx/
+ obj-$(CONFIG_SND_SOC)	+=3D sh/
++obj-$(CONFIG_SND_SOC)	+=3D msm/
+diff --git a/sound/soc/msm/Kconfig b/sound/soc/msm/Kconfig
+new file mode 100644
+index 0000000..7df1a40
+--- /dev/null
++++ b/sound/soc/msm/Kconfig
+@@ -0,0 +1,37 @@
++menu "MSM SoC Audio support"
++
++config SND_MSM_SOC
++	tristate "SoC Audio for the MSM series chips"
++	depends on ARCH_MSM_ARM11 && SND_SOC
++	select MSM_ADSP
++	help
++	  To add support for ALSA PCM driver for MSM board.
++
++config SND_QSD_SOC
++	tristate "SoC Audio for the QSD8x50 chip"
++	depends on ARCH_QSD8X50 && SND_SOC && QSD_AUDIO
++	default y
++	help
++	  To add support for ALSA PCM driver for QSD8k board.
++
++
++config SND_MSM_DAI_SOC
++	tristate "SoC CPU/CODEC DAI for the MSM chip"
++	depends on SND_MSM_SOC || SND_QSD_SOC
++	help
++	 To add support for ALSA PCM driver for MSM board.
++
++config SND_MSM_SOC_MSM7K
++        tristate "SoC Audio support for MSM7K"
++        depends on SND_MSM_SOC
++        help
++	 To add support for SoC audio on msm7k for msm72x1 or msm7x27
++
++config SND_QSD_SOC_QSD8K
++	tristate "SoC Audio support for QSD8K"
++	depends on SND_QSD_SOC
++	help
++	 To add support for SoC audio on qsd8k.
++
++
++endmenu
+diff --git a/sound/soc/msm/Makefile b/sound/soc/msm/Makefile
+new file mode 100644
+index 0000000..fbfce6d
+--- /dev/null
++++ b/sound/soc/msm/Makefile
+@@ -0,0 +1,17 @@
++# MSM CPU/CODEC DAI Support
++snd-soc-msm-dai-objs :=3D msm-dai.o
++obj-$(CONFIG_SND_MSM_DAI_SOC) +=3D snd-soc-msm-dai.o
++
++# MSM Platform Support
++snd-soc-msm-objs :=3D msm-pcm.o msm7k-pcm.o
++obj-$(CONFIG_SND_MSM_SOC) +=3D snd-soc-msm.o
++
++snd-soc-qsd-objs :=3D qsd8k-pcm.o
++obj-$(CONFIG_SND_QSD_SOC) +=3D snd-soc-qsd.o
++
++# MSM Machine Support
++snd-soc-msm7k-objs :=3D msm7201.o
++obj-$(CONFIG_SND_MSM_SOC_MSM7K) +=3D snd-soc-msm7k.o
++
++snd-soc-qsd8k-objs :=3D qsd8k.o
++obj-$(CONFIG_SND_QSD_SOC_QSD8K) +=3D snd-soc-qsd8k.o
+diff --git a/sound/soc/msm/msm-dai.c b/sound/soc/msm/msm-dai.c
+new file mode 100644
+index 0000000..564e7fe
+--- /dev/null
++++ b/sound/soc/msm/msm-dai.c
+@@ -0,0 +1,143 @@
++/* sound/soc/msm/msm-dai.c
++ *
++ * Copyright (C) 2008 Google, Inc.
++ * Copyright (C) 2008 HTC Corporation
++ * Copyright (c) 2008-2009, Code Aurora Forum. All rights reserved.
++ *
++ * Derived from msm-pcm.c and msm7201.c.
++ *
++ * This software is licensed under the terms of the GNU General Public
++ * License version 2, as published by the Free Software Foundation, and
++ * may be copied, distributed, and modified under those terms.
++ *
++ * This program is distributed in the hope that it will be useful,
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
++ *
++ * See the GNU General Public License for more details.
++ * You should have received a copy of the GNU General Public License
++ * along with this program; if not, you can find it at http://www.fsf.org=
.
++ */
++
++#include <linux/init.h>
++#include <linux/module.h>
++#include <linux/device.h>
++#include <linux/delay.h>
++#include <linux/clk.h>
++#include <linux/platform_device.h>
++#include <sound/core.h>
++#include <sound/pcm.h>
++#include <sound/initval.h>
++#include <sound/soc.h>
++#include "msm-pcm.h"
++
++struct snd_soc_dai msm_dais[] =3D {
++{
++	.name =3D "CODEC_DAI",
++	.playback =3D {
++		.stream_name =3D "Playback",
++		.channels_min =3D USE_CHANNELS_MIN,
++		.channels_max =3D USE_CHANNELS_MAX,
++		.rates =3D USE_RATE,
++		.rate_min =3D USE_RATE_MIN,
++		.rate_max =3D USE_RATE_MAX,
++		.formats =3D USE_FORMATS,
++	},
++	.capture =3D {
++		.stream_name =3D "Capture",
++		.channels_min =3D USE_CHANNELS_MIN,
++		.channels_max =3D USE_CHANNELS_MAX,
++		.rate_min =3D USE_RATE_MIN,
++		.rates =3D USE_RATE,
++		.formats =3D USE_FORMATS,
++	},
++},
++{
++	.name =3D "CPU_DAI",
++	.id =3D 0,
++	.playback =3D {
++		.channels_min =3D USE_CHANNELS_MIN,
++		.channels_max =3D USE_CHANNELS_MAX,
++		.rates =3D USE_RATE,
++		.rate_min =3D USE_RATE_MIN,
++		.rate_max =3D USE_RATE_MAX,
++		.formats =3D USE_FORMATS,
++	},
++	.capture =3D {
++		.channels_min =3D USE_CHANNELS_MIN,
++		.channels_max =3D USE_CHANNELS_MAX,
++		.rate_min =3D USE_RATE_MIN,
++		.rates =3D USE_RATE,
++		.formats =3D USE_FORMATS,
++	},
++},
++};
++EXPORT_SYMBOL_GPL(msm_dais);
++
++int msm_pcm_probe(struct platform_device *devptr)
++{
++	struct snd_card *card;
++	struct snd_soc_codec *codec;
++	int ret;
++
++	struct snd_soc_device *socdev =3D platform_get_drvdata(devptr);
++
++	printk(KERN_ERR "msm_soc: create pcms\n");
++	codec =3D kzalloc(sizeof(struct snd_soc_codec), GFP_KERNEL);
++	if (codec =3D=3D NULL)
++		return -ENOMEM;
++
++	codec->name =3D "MSM-CARD";
++	codec->owner =3D THIS_MODULE;
++	socdev->codec =3D codec;
++	mutex_init(&codec->mutex);
++
++	INIT_LIST_HEAD(&codec->dapm_widgets);
++	INIT_LIST_HEAD(&codec->dapm_paths);
++
++	/* register pcms */
++	ret =3D snd_soc_new_pcms(socdev, SNDRV_DEFAULT_IDX1, SNDRV_DEFAULT_STR1)=
;
++	if (ret < 0) {
++		printk(KERN_ERR "msm_soc: failed to create pcms\n");
++		goto __nopcm;
++	}
++
++	card =3D socdev->codec->card;
++
++	ret =3D snd_soc_init_card(socdev);
++	if (ret < 0) {
++		printk(KERN_ERR "msm_soc: failed to register card\n");
++		goto __nodev;
++	}
++
++	return 0;
++
++__nodev:
++	snd_soc_free_pcms(socdev);
++__nopcm:
++	kfree(codec);
++	return ret;
++}
++
++struct snd_soc_codec_device soc_codec_dev_msm =3D {
++	.probe          =3D msm_pcm_probe,
++};
++EXPORT_SYMBOL_GPL(soc_codec_dev_msm);
++
++
++static int __init msm_dai_init(void)
++{
++	return snd_soc_register_dais(msm_dais, ARRAY_SIZE(msm_dais));
++}
++
++static void __exit msm_dai_exit(void)
++{
++	snd_soc_unregister_dais(msm_dais, ARRAY_SIZE(msm_dais));
++}
++
++module_init(msm_dai_init);
++module_exit(msm_dai_exit);
++
++/* Module information */
++MODULE_DESCRIPTION("MSM Codec/Cpu Dai driver");
++MODULE_LICENSE("GPL v2");
+diff --git a/sound/soc/msm/msm-pcm.c b/sound/soc/msm/msm-pcm.c
+new file mode 100644
+index 0000000..90e200d
+--- /dev/null
++++ b/sound/soc/msm/msm-pcm.c
+@@ -0,0 +1,643 @@
++/* sound/soc/msm/msm-pcm.c
++ *
++ * Copyright (C) 2008 Google, Inc.
++ * Copyright (C) 2008 HTC Corporation
++ * Copyright (c) 2008-2009, Code Aurora Forum. All rights reserved.
++ *
++ * This software is licensed under the terms of the GNU General Public
++ * License version 2, as published by the Free Software Foundation, and
++ * may be copied, distributed, and modified under those terms.
++ *
++ * This program is distributed in the hope that it will be useful,
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
++ *
++ * See the GNU General Public License for more details.
++ * You should have received a copy of the GNU General Public License
++ * along with this program; if not, you can find it at http://www.fsf.org=
.
++ */
++
++
++#include <linux/init.h>
++#include <linux/err.h>
++#include <linux/module.h>
++#include <linux/moduleparam.h>
++#include <linux/time.h>
++#include <linux/wait.h>
++#include <linux/platform_device.h>
++#include <sound/core.h>
++#include <sound/soc.h>
++#include <sound/pcm.h>
++#include <sound/initval.h>
++#include <asm/dma.h>
++#include <linux/dma-mapping.h>
++
++#include "msm-pcm.h"
++
++#define MAX_DATA_SIZE 496
++#define AUDPP_ALSA_DECODER	(-1)
++
++#define DB_TABLE_INDEX		(50)
++
++#define audio_send_queue_recbs(prtd, cmd, len) \
++	msm_adsp_write(prtd->audrec, QDSP_uPAudRecBitStreamQueue, cmd, len)
++#define audio_send_queue_rec(prtd, cmd, len) \
++	msm_adsp_write(prtd->audrec, QDSP_uPAudRecCmdQueue, cmd, len)
++
++int intcnt;
++static int audio_dsp_send_buffer(struct msm_audio *prtd,
++			unsigned idx, unsigned len);
++
++struct audio_frame {
++	uint16_t count_low;
++	uint16_t count_high;
++	uint16_t bytes;
++	uint16_t unknown;
++	unsigned char samples[];
++} __attribute__ ((packed));
++
++/* Table contains dB to raw value mapping */
++static const unsigned decoder_db_table[] =3D {
++
++      31 , /* -50 dB */
++      35 ,      39 ,      44 ,      50 ,      56 ,
++      63 ,      70 ,      79 ,      89 ,      99 ,
++     112 ,     125 ,     141 ,     158 ,     177 ,
++     199 ,     223 ,     251 ,     281 ,     316 ,
++     354 ,     398 ,     446 ,     501 ,     562 ,
++     630 ,     707 ,     794 ,     891 ,     999 ,
++    1122 ,    1258 ,    1412 ,    1584 ,    1778 ,
++    1995 ,    2238 ,    2511 ,    2818 ,    3162 ,
++    3548 ,    3981 ,    4466 ,    5011 ,    5623 ,
++    6309 ,    7079 ,    7943 ,    8912 ,   10000 ,
++   11220 ,   12589 ,   14125 ,   15848 ,   17782 ,
++   19952 ,   22387 ,   25118 ,   28183 ,   31622 ,
++   35481 ,   39810 ,   44668 ,   50118 ,   56234 ,
++   63095 ,   70794 ,   79432 ,   89125 ,  100000 ,
++  112201 ,  125892 ,  141253 ,  158489 ,  177827 ,
++  199526 ,  223872 ,  251188 ,  281838 ,  316227 ,
++  354813 ,  398107 ,  446683 ,  501187 ,  562341 ,
++  630957 ,  707945 ,  794328 ,  891250 , 1000000 ,
++ 1122018 , 1258925 , 1412537 , 1584893 , 1778279 ,
++ 1995262 , 2238721 , 2511886 , 2818382 , 3162277 ,
++ 3548133   /*  51 dB */
++
++};
++
++static unsigned compute_db_raw(int db)
++{
++	unsigned reg_val =3D 0;        /* Computed result for correspondent db *=
/
++	/* Check if the given db is out of range */
++	if (db <=3D MIN_DB)
++		return 0;
++	else if (db > MAX_DB)
++		db =3D MAX_DB;       /* If db is too high then set to max    */
++	reg_val =3D decoder_db_table[DB_TABLE_INDEX+db];
++	return reg_val;
++}
++
++int msm_audio_volume_update(unsigned id,
++				int volume, int pan)
++{
++	unsigned vol_raw;
++
++	vol_raw =3D compute_db_raw(volume);
++	printk(KERN_INFO "volume: %8x vol_raw: %8x \n", volume, vol_raw);
++	return audpp_set_volume_and_pan(id, vol_raw, pan);
++}
++EXPORT_SYMBOL(msm_audio_volume_update);
++
++void alsa_dsp_event(void *data, unsigned id, uint16_t *msg)
++{
++	struct msm_audio *prtd =3D data;
++	struct buffer *frame;
++	unsigned long flag;
++
++	switch (id) {
++	case AUDPP_MSG_STATUS_MSG:
++		break;
++	case AUDPP_MSG_SPA_BANDS:
++		break;
++	case AUDPP_MSG_HOST_PCM_INTF_MSG:{
++			unsigned id =3D msg[2];
++			unsigned idx =3D msg[3] - 1;
++			if (id !=3D AUDPP_MSG_HOSTPCM_ID_ARM_RX) {
++				printk(KERN_ERR "bogus id\n");
++				break;
++			}
++			if (idx > 1) {
++				printk(KERN_ERR "bogus buffer idx\n");
++				break;
++			}
++			/* Update with actual sent buffer size */
++			if (prtd->out[idx].used !=3D BUF_INVALID_LEN)
++				prtd->pcm_irq_pos +=3D prtd->out[idx].used;
++
++			if (prtd->pcm_irq_pos > prtd->pcm_size)
++				prtd->pcm_irq_pos =3D prtd->pcm_count;
++
++			if (prtd->ops->playback)
++				prtd->ops->playback(prtd);
++
++			spin_lock_irqsave(&the_locks.write_dsp_lock, flag);
++			if (prtd->running) {
++				prtd->out[idx].used =3D 0;
++				frame =3D prtd->out + prtd->out_tail;
++				if (frame->used) {
++					audio_dsp_send_buffer(prtd,
++							      prtd->out_tail,
++							      frame->used);
++					prtd->out_tail ^=3D 1;
++				} else {
++					prtd->out_needed++;
++				}
++				wake_up(&the_locks.write_wait);
++			}
++			spin_unlock_irqrestore(&the_locks.write_dsp_lock, flag);
++			break;
++		}
++	case AUDPP_MSG_PCMDMAMISSED:
++		printk(KERN_ERR "alsa_dsp_event: PCMDMAMISSED %d\n", msg[0]);
++		break;
++	case AUDPP_MSG_CFG_MSG:
++		if (msg[0] =3D=3D AUDPP_MSG_ENA_ENA) {
++			prtd->out_needed =3D 0;
++			prtd->running =3D 1;
++			audio_dsp_out_enable(prtd, 1);
++		} else if (msg[0] =3D=3D AUDPP_MSG_ENA_DIS) {
++			prtd->running =3D 0;
++		} else {
++			printk(KERN_ERR "alsa_dsp_event:CFG_MSG=3D%d\n", msg[0]);
++		}
++		break;
++	case EVENT_MSG_ID:
++		printk(KERN_INFO"alsa_dsp_event: arm9 event\n");
++		break;
++	default:
++		printk(KERN_ERR "alsa_dsp_event: UNKNOWN (%d)\n", id);
++	}
++}
++
++void alsa_audpre_dsp_event(void *data, unsigned id, size_t len,
++		      void (*getevent) (void *ptr, size_t len))
++{
++	uint16_t msg[MAX_DATA_SIZE/2];
++
++	if (len > MAX_DATA_SIZE) {
++		printk(KERN_ERR"audpre: event too large(%d bytes)\n", len);
++		return;
++	}
++	getevent(msg, len);
++
++	switch (id) {
++	case AUDPREPROC_MSG_CMD_CFG_DONE_MSG:
++		break;
++	case AUDPREPROC_MSG_ERROR_MSG_ID:
++		printk(KERN_ERR "audpre: err_index %d\n", msg[0]);
++		break;
++	case EVENT_MSG_ID:
++		printk(KERN_INFO"audpre: arm9 event\n");
++		break;
++	default:
++		printk(KERN_ERR "audpre: unknown event %d\n", id);
++	}
++}
++
++void audrec_dsp_event(void *data, unsigned id, size_t len,
++		      void (*getevent) (void *ptr, size_t len))
++{
++	struct msm_audio *prtd =3D data;
++	unsigned long flag;
++	uint16_t msg[MAX_DATA_SIZE/2];
++
++	if (len > MAX_DATA_SIZE) {
++		printk(KERN_ERR"audrec: event/msg too large(%d bytes)\n", len);
++		return;
++	}
++	getevent(msg, len);
++
++	switch (id) {
++	case AUDREC_MSG_CMD_CFG_DONE_MSG:
++		if (msg[0] & AUDREC_MSG_CFG_DONE_TYPE_0_UPDATE) {
++			if (msg[0] & AUDREC_MSG_CFG_DONE_TYPE_0_ENA)
++				audrec_encoder_config(prtd);
++			else
++				prtd->running =3D 0;
++		}
++		break;
++	case AUDREC_MSG_CMD_AREC_PARAM_CFG_DONE_MSG:{
++			prtd->running =3D 1;
++			break;
++		}
++	case AUDREC_MSG_FATAL_ERR_MSG:
++		printk(KERN_ERR "audrec: ERROR %x\n", msg[0]);
++		break;
++	case AUDREC_MSG_PACKET_READY_MSG:
++		alsa_get_dsp_frames(prtd);
++		++intcnt;
++		if (prtd->channel_mode =3D=3D 1) {
++			spin_lock_irqsave(&the_locks.read_dsp_lock, flag);
++			prtd->pcm_irq_pos +=3D prtd->pcm_count;
++			if (prtd->pcm_irq_pos >=3D prtd->pcm_size)
++				prtd->pcm_irq_pos =3D 0;
++			spin_unlock_irqrestore(&the_locks.read_dsp_lock, flag);
++
++			if (prtd->ops->capture)
++				prtd->ops->capture(prtd);
++		} else if ((prtd->channel_mode =3D=3D 0) && (intcnt % 2 =3D=3D 0)) {
++			spin_lock_irqsave(&the_locks.read_dsp_lock, flag);
++			prtd->pcm_irq_pos +=3D prtd->pcm_count;
++			if (prtd->pcm_irq_pos >=3D prtd->pcm_size)
++				prtd->pcm_irq_pos =3D 0;
++			spin_unlock_irqrestore(&the_locks.read_dsp_lock, flag);
++			if (prtd->ops->capture)
++				prtd->ops->capture(prtd);
++		}
++		break;
++	case EVENT_MSG_ID:
++		printk(KERN_INFO"audrec: arm9 event\n");
++		break;
++	default:
++		printk(KERN_ERR "audrec: unknown event %d\n", id);
++	}
++}
++
++struct msm_adsp_ops aud_pre_adsp_ops =3D {
++	.event =3D alsa_audpre_dsp_event,
++};
++
++struct msm_adsp_ops aud_rec_adsp_ops =3D {
++	.event =3D audrec_dsp_event,
++};
++
++int alsa_adsp_configure(struct msm_audio *prtd)
++{
++	int ret, i;
++
++	if (prtd->dir =3D=3D SNDRV_PCM_STREAM_PLAYBACK) {
++		prtd->data =3D prtd->playback_substream->dma_buffer.area;
++		prtd->phys =3D prtd->playback_substream->dma_buffer.addr;
++	}
++	if (prtd->dir =3D=3D SNDRV_PCM_STREAM_CAPTURE) {
++		prtd->data =3D prtd->capture_substream->dma_buffer.area;
++		prtd->phys =3D prtd->capture_substream->dma_buffer.addr;
++	}
++	if (!prtd->data) {
++		ret =3D -ENOMEM;
++		goto err1;
++	}
++
++	ret =3D audmgr_open(&prtd->audmgr);
++	if (ret)
++		goto err2;
++	if (prtd->dir =3D=3D SNDRV_PCM_STREAM_PLAYBACK) {
++		prtd->out_buffer_size =3D PLAYBACK_DMASZ;
++		prtd->out_sample_rate =3D 44100;
++		prtd->out_channel_mode =3D AUDPP_CMD_PCM_INTF_STEREO_V;
++		prtd->out_weight =3D 100;
++
++		prtd->out[0].data =3D prtd->data + 0;
++		prtd->out[0].addr =3D prtd->phys + 0;
++		prtd->out[0].size =3D BUFSZ;
++		prtd->out[1].data =3D prtd->data + BUFSZ;
++		prtd->out[1].addr =3D prtd->phys + BUFSZ;
++		prtd->out[1].size =3D BUFSZ;
++	}
++	if (prtd->dir =3D=3D SNDRV_PCM_STREAM_CAPTURE) {
++		prtd->samp_rate =3D RPC_AUD_DEF_SAMPLE_RATE_44100;
++		prtd->samp_rate_index =3D AUDREC_CMD_SAMP_RATE_INDX_44100;
++		prtd->channel_mode =3D AUDREC_CMD_STEREO_MODE_STEREO;
++		prtd->buffer_size =3D STEREO_DATA_SIZE;
++		prtd->type =3D AUDREC_CMD_TYPE_0_INDEX_WAV;
++		prtd->tx_agc_cfg.cmd_id =3D AUDPREPROC_CMD_CFG_AGC_PARAMS;
++		prtd->ns_cfg.cmd_id =3D AUDPREPROC_CMD_CFG_NS_PARAMS;
++		prtd->iir_cfg.cmd_id =3D
++		    AUDPREPROC_CMD_CFG_IIR_TUNING_FILTER_PARAMS;
++
++		ret =3D msm_adsp_get("AUDPREPROCTASK",
++				   &prtd->audpre, &aud_pre_adsp_ops, prtd);
++		if (ret)
++			goto err3;
++		ret =3D msm_adsp_get("AUDRECTASK",
++				   &prtd->audrec, &aud_rec_adsp_ops, prtd);
++		if (ret) {
++			msm_adsp_put(prtd->audpre);
++			goto err3;
++		}
++		prtd->dsp_cnt =3D 0;
++		prtd->in_head =3D 0;
++		prtd->in_tail =3D 0;
++		prtd->in_count =3D 0;
++		for (i =3D 0; i < FRAME_NUM; i++) {
++			prtd->in[i].size =3D 0;
++			prtd->in[i].read =3D 0;
++		}
++	}
++
++	return 0;
++
++err3:
++	audmgr_close(&prtd->audmgr);
++
++err2:
++	prtd->data =3D NULL;
++err1:
++	return ret;
++}
++EXPORT_SYMBOL(alsa_adsp_configure);
++
++int alsa_audio_configure(struct msm_audio *prtd)
++{
++	struct audmgr_config cfg;
++	int rc;
++
++	if (prtd->enabled)
++		return 0;
++
++	/* refuse to start if we're not ready with first buffer */
++	if (!prtd->out[0].used)
++		return -EIO;
++
++	cfg.tx_rate =3D 0;
++	cfg.rx_rate =3D RPC_AUD_DEF_SAMPLE_RATE_48000;
++	cfg.def_method =3D RPC_AUD_DEF_METHOD_HOST_PCM;
++	cfg.codec =3D RPC_AUD_DEF_CODEC_PCM;
++	cfg.snd_method =3D RPC_SND_METHOD_MIDI;
++	rc =3D audmgr_enable(&prtd->audmgr, &cfg);
++	if (rc < 0)
++		return rc;
++
++	if (audpp_enable(AUDPP_ALSA_DECODER, alsa_dsp_event, prtd)) {
++		printk(KERN_ERR "audio: audpp_enable() failed\n");
++		audmgr_disable(&prtd->audmgr);
++		return -ENODEV;
++	}
++
++	prtd->enabled =3D 1;
++	return 0;
++}
++EXPORT_SYMBOL(alsa_audio_configure);
++
++ssize_t alsa_send_buffer(struct msm_audio *prtd, const char __user *buf,
++			  size_t count, loff_t *pos)
++{
++	unsigned long flag;
++	const char __user *start =3D buf;
++	struct buffer *frame;
++	size_t xfer;
++	int rc =3D 0;
++
++	mutex_lock(&the_locks.write_lock);
++	while (count > 0) {
++		frame =3D prtd->out + prtd->out_head;
++		rc =3D wait_event_interruptible(the_locks.write_wait,
++					      (frame->used =3D=3D 0)
++					      || (prtd->stopped));
++		if (rc < 0)
++			break;
++		if (prtd->stopped) {
++			rc =3D -EBUSY;
++			break;
++		}
++		xfer =3D count > frame->size ? frame->size : count;
++		if (copy_from_user(frame->data, buf, xfer)) {
++			rc =3D -EFAULT;
++			break;
++		}
++		frame->used =3D xfer;
++		prtd->out_head ^=3D 1;
++		count -=3D xfer;
++		buf +=3D xfer;
++
++		spin_lock_irqsave(&the_locks.write_dsp_lock, flag);
++		frame =3D prtd->out + prtd->out_tail;
++		if (frame->used && prtd->out_needed) {
++			audio_dsp_send_buffer(prtd, prtd->out_tail,
++					      frame->used);
++			prtd->out_tail ^=3D 1;
++			prtd->out_needed--;
++		}
++		spin_unlock_irqrestore(&the_locks.write_dsp_lock, flag);
++	}
++	mutex_unlock(&the_locks.write_lock);
++	if (buf > start)
++		return buf - start;
++	return rc;
++}
++EXPORT_SYMBOL(alsa_send_buffer);
++
++int alsa_audio_disable(struct msm_audio *prtd)
++{
++	if (prtd->enabled) {
++		mutex_lock(&the_locks.lock);
++		prtd->enabled =3D 0;
++		audio_dsp_out_enable(prtd, 0);
++		wake_up(&the_locks.write_wait);
++		audpp_disable(AUDPP_ALSA_DECODER, prtd);
++		audmgr_disable(&prtd->audmgr);
++		prtd->out_needed =3D 0;
++		mutex_unlock(&the_locks.lock);
++	}
++	return 0;
++}
++EXPORT_SYMBOL(alsa_audio_disable);
++
++int alsa_audrec_disable(struct msm_audio *prtd)
++{
++	if (prtd->enabled) {
++		mutex_lock(&the_locks.lock);
++		prtd->enabled =3D 0;
++		alsa_rec_dsp_enable(prtd, 0);
++		wake_up(&the_locks.read_wait);
++		msm_adsp_disable(prtd->audpre);
++		msm_adsp_disable(prtd->audrec);
++		audmgr_disable(&prtd->audmgr);
++		prtd->out_needed =3D 0;
++		prtd->opened =3D 0;
++		mutex_unlock(&the_locks.lock);
++	}
++	return 0;
++}
++EXPORT_SYMBOL(alsa_audrec_disable);
++
++static int audio_dsp_read_buffer(struct msm_audio *prtd, uint32_t read_cn=
t)
++{
++	audrec_cmd_packet_ext_ptr cmd;
++
++	memset(&cmd, 0, sizeof(cmd));
++	cmd.cmd_id =3D AUDREC_CMD_PACKET_EXT_PTR;
++	/* Both WAV and AAC use AUDREC_CMD_TYPE_0 */
++	cmd.type =3D AUDREC_CMD_TYPE_0;
++	cmd.curr_rec_count_msw =3D read_cnt >> 16;
++	cmd.curr_rec_count_lsw =3D read_cnt;
++
++	return audio_send_queue_recbs(prtd, &cmd, sizeof(cmd));
++}
++
++int audrec_encoder_config(struct msm_audio *prtd)
++{
++	audrec_cmd_arec0param_cfg cmd;
++	uint16_t *data =3D (void *)prtd->data;
++	unsigned n;
++
++	memset(&cmd, 0, sizeof(cmd));
++	cmd.cmd_id =3D AUDREC_CMD_AREC0PARAM_CFG;
++	cmd.ptr_to_extpkt_buffer_msw =3D prtd->phys >> 16;
++	cmd.ptr_to_extpkt_buffer_lsw =3D prtd->phys;
++	cmd.buf_len =3D FRAME_NUM;	/* Both WAV and AAC use 8 frames */
++	cmd.samp_rate_index =3D prtd->samp_rate_index;
++	/* 0 for mono, 1 for stereo */
++	cmd.stereo_mode =3D prtd->channel_mode;
++	cmd.rec_quality =3D 0x1C00;
++
++	/* prepare buffer pointers:
++	 * Mono: 1024 samples + 4 halfword header
++	 * Stereo: 2048 samples + 4 halfword header
++	 */
++
++	for (n =3D 0; n < FRAME_NUM; n++) {
++		prtd->in[n].data =3D data + 4;
++		data +=3D (4 + (prtd->channel_mode ? 2048 : 1024));
++	}
++
++	return audio_send_queue_rec(prtd, &cmd, sizeof(cmd));
++}
++
++int audio_dsp_out_enable(struct msm_audio *prtd, int yes)
++{
++	audpp_cmd_pcm_intf cmd;
++	memset(&cmd, 0, sizeof(cmd));
++	cmd.cmd_id =3D AUDPP_CMD_PCM_INTF_2;
++	cmd.object_num =3D AUDPP_CMD_PCM_INTF_OBJECT_NUM;
++	cmd.config =3D AUDPP_CMD_PCM_INTF_CONFIG_CMD_V;
++	cmd.intf_type =3D AUDPP_CMD_PCM_INTF_RX_ENA_ARMTODSP_V;
++
++	if (yes) {
++		cmd.write_buf1LSW =3D prtd->out[0].addr;
++		cmd.write_buf1MSW =3D prtd->out[0].addr >> 16;
++		cmd.write_buf1_len =3D 0;
++		cmd.write_buf2LSW =3D prtd->out[1].addr;
++		cmd.write_buf2MSW =3D prtd->out[1].addr >> 16;
++		cmd.write_buf2_len =3D prtd->out[1].used;
++		cmd.arm_to_rx_flag =3D AUDPP_CMD_PCM_INTF_ENA_V;
++		cmd.weight_decoder_to_rx =3D prtd->out_weight;
++		cmd.weight_arm_to_rx =3D 1;
++		cmd.partition_number_arm_to_dsp =3D 0;
++		cmd.sample_rate =3D prtd->out_sample_rate;
++		cmd.channel_mode =3D prtd->out_channel_mode;
++	}
++	return audpp_send_queue2(&cmd, sizeof(cmd));
++}
++
++int alsa_buffer_read(struct msm_audio *prtd, void __user *buf,
++		      size_t count, loff_t *pos)
++{
++	unsigned long flag;
++	void *data;
++	uint32_t index;
++	uint32_t size;
++	int rc =3D 0;
++
++	mutex_lock(&the_locks.read_lock);
++	while (count > 0) {
++		rc =3D wait_event_interruptible(the_locks.read_wait,
++					      (prtd->in_count > 0)
++					      || prtd->stopped);
++		if (rc < 0)
++			break;
++
++		if (prtd->stopped) {
++			rc =3D -EBUSY;
++			break;
++		}
++
++		index =3D prtd->in_tail;
++		data =3D (uint8_t *) prtd->in[index].data;
++		size =3D prtd->in[index].size;
++		if (count >=3D size) {
++			if (copy_to_user(buf, data, size)) {
++				rc =3D -EFAULT;
++				break;
++			}
++			spin_lock_irqsave(&the_locks.read_dsp_lock, flag);
++			if (index !=3D prtd->in_tail) {
++				/* overrun: data is invalid, we need to retry */
++				spin_unlock_irqrestore(&the_locks.read_dsp_lock,
++						       flag);
++				continue;
++			}
++			prtd->in[index].size =3D 0;
++			prtd->in_tail =3D (prtd->in_tail + 1) & (FRAME_NUM - 1);
++			prtd->in_count--;
++			spin_unlock_irqrestore(&the_locks.read_dsp_lock, flag);
++			count -=3D size;
++			buf +=3D size;
++		} else {
++			break;
++		}
++	}
++	mutex_unlock(&the_locks.read_lock);
++	return rc;
++}
++EXPORT_SYMBOL(alsa_buffer_read);
++
++static int audio_dsp_send_buffer(struct msm_audio *prtd,
++					unsigned idx, unsigned len)
++{
++	audpp_cmd_pcm_intf_send_buffer cmd;
++	cmd.cmd_id =3D AUDPP_CMD_PCM_INTF_2;
++	cmd.host_pcm_object =3D AUDPP_CMD_PCM_INTF_OBJECT_NUM;
++	cmd.config =3D AUDPP_CMD_PCM_INTF_BUFFER_CMD_V;
++	cmd.intf_type =3D AUDPP_CMD_PCM_INTF_RX_ENA_ARMTODSP_V;
++	cmd.dsp_to_arm_buf_id =3D 0;
++	cmd.arm_to_dsp_buf_id =3D idx + 1;
++	cmd.arm_to_dsp_buf_len =3D len;
++	return audpp_send_queue2(&cmd, sizeof(cmd));
++}
++
++int alsa_rec_dsp_enable(struct msm_audio *prtd, int enable)
++{
++	audrec_cmd_cfg cmd;
++
++	memset(&cmd, 0, sizeof(cmd));
++	cmd.cmd_id =3D AUDREC_CMD_CFG;
++	cmd.type_0 =3D enable ? AUDREC_CMD_TYPE_0_ENA : AUDREC_CMD_TYPE_0_DIS;
++	cmd.type_0 |=3D (AUDREC_CMD_TYPE_0_UPDATE | prtd->type);
++	cmd.type_1 =3D 0;
++
++	return audio_send_queue_rec(prtd, &cmd, sizeof(cmd));
++}
++EXPORT_SYMBOL(alsa_rec_dsp_enable);
++
++void alsa_get_dsp_frames(struct msm_audio *prtd)
++{
++	struct audio_frame *frame;
++	uint32_t index =3D 0;
++	unsigned long flag;
++
++	if (prtd->type =3D=3D AUDREC_CMD_TYPE_0_INDEX_WAV) {
++		index =3D prtd->in_head;
++
++		frame =3D
++		    (void *)(((char *)prtd->in[index].data) - sizeof(*frame));
++
++		spin_lock_irqsave(&the_locks.read_dsp_lock, flag);
++		prtd->in[index].size =3D frame->bytes;
++
++		prtd->in_head =3D (prtd->in_head + 1) & (FRAME_NUM - 1);
++
++		/* If overflow, move the tail index foward. */
++		if (prtd->in_head =3D=3D prtd->in_tail)
++			prtd->in_tail =3D (prtd->in_tail + 1) & (FRAME_NUM - 1);
++		else
++			prtd->in_count++;
++
++		audio_dsp_read_buffer(prtd, prtd->dsp_cnt++);
++		spin_unlock_irqrestore(&the_locks.read_dsp_lock, flag);
++
++		wake_up(&the_locks.read_wait);
++	} else {
++		/* TODO AAC not supported yet. */
++	}
++}
++EXPORT_SYMBOL(alsa_get_dsp_frames);
+diff --git a/sound/soc/msm/msm-pcm.h b/sound/soc/msm/msm-pcm.h
+new file mode 100644
+index 0000000..7563ef0
+--- /dev/null
++++ b/sound/soc/msm/msm-pcm.h
+@@ -0,0 +1,200 @@
++/* sound/soc/msm/msm-pcm.h
++ *
++ * Copyright (C) 2008 Google, Inc.
++ * Copyright (C) 2008 HTC Corporation
++ * Copyright (c) 2008-2009, Code Aurora Forum. All rights reserved.
++ *
++ * This software is licensed under the terms of the GNU General Public
++ * License version 2, as published by the Free Software Foundation, and
++ * may be copied, distributed, and modified under those terms.
++ *
++ * This program is distributed in the hope that it will be useful,
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
++ *
++ * See the GNU General Public License for more details.
++ * You should have received a copy of the GNU General Public License
++ * along with this program; if not, you can find it at http://www.fsf.org=
.
++ */
++
++#ifndef _MSM_PCM_H
++#define _MSM_PCM_H
++
++
++#include <mach/qdsp5/qdsp5audppcmdi.h>
++#include <mach/qdsp5/qdsp5audppmsg.h>
++#include <mach/qdsp5/qdsp5audreccmdi.h>
++#include <mach/qdsp5/qdsp5audrecmsg.h>
++#include <mach/qdsp5/qdsp5audpreproccmdi.h>
++#include <mach/qdsp5/qdsp5audpreprocmsg.h>
++
++#include <../arch/arm/mach-msm/qdsp5/adsp.h>
++#include <../arch/arm/mach-msm/qdsp5/audmgr.h>
++
++
++#define FRAME_NUM               (8)
++#define FRAME_SIZE              (2052 * 2)
++#define MONO_DATA_SIZE          (2048)
++#define STEREO_DATA_SIZE        (MONO_DATA_SIZE * 2)
++#define CAPTURE_DMASZ           (FRAME_SIZE * FRAME_NUM)
++
++#define BUFSZ			(960 * 5)
++#define PLAYBACK_DMASZ 		(BUFSZ * 2)
++
++#define MSM_PLAYBACK_DEFAULT_VOLUME 0 /* 0dB */
++#define MSM_PLAYBACK_DEFAULT_PAN 0
++
++#define USE_FORMATS             SNDRV_PCM_FMTBIT_S16_LE
++#define USE_CHANNELS_MIN        1
++#define USE_CHANNELS_MAX        2
++/* Support unconventional sample rates 12000, 24000 as well */
++#define USE_RATE                \
++			(SNDRV_PCM_RATE_8000_48000 | SNDRV_PCM_RATE_KNOT)
++#define USE_RATE_MIN            8000
++#define USE_RATE_MAX            48000
++#define MAX_BUFFER_PLAYBACK_SIZE \
++				(4800*4)
++/* 2048 frames (Mono), 1024 frames (Stereo) */
++#define CAPTURE_SIZE		4096
++#define MAX_BUFFER_CAPTURE_SIZE (4096*4)
++#define MAX_PERIOD_SIZE         BUFSZ
++#define USE_PERIODS_MAX         1024
++#define USE_PERIODS_MIN		1
++
++
++#define MAX_DB			(16)
++#define MIN_DB			(-50)
++#define PCMPLAYBACK_DECODERID   5
++
++/* 0xFFFFFFFF Indicates not to be used for audio data copy */
++#define	BUF_INVALID_LEN		0xFFFFFFFF
++
++extern int copy_count;
++extern int intcnt;
++
++struct msm_volume {
++	bool update;
++	int volume; /* Volume parameter, in dB Scale */
++	int pan;
++};
++
++struct buffer {
++	void *data;
++	unsigned size;
++	unsigned used;
++	unsigned addr;
++};
++
++struct buffer_rec {
++	void *data;
++	unsigned int size;
++	unsigned int read;
++	unsigned int addr;
++};
++
++struct audio_locks {
++	struct mutex lock;
++	struct mutex write_lock;
++	struct mutex read_lock;
++	spinlock_t read_dsp_lock;
++	spinlock_t write_dsp_lock;
++	spinlock_t mixer_lock;
++	wait_queue_head_t read_wait;
++	wait_queue_head_t write_wait;
++};
++
++extern struct audio_locks the_locks;
++
++struct msm_audio_event_callbacks {
++	/* event is called from interrupt context when a message
++	 * arrives from the DSP.
++	*/
++	void (*playback)(void *);
++	void (*capture)(void *);
++};
++
++
++struct msm_audio {
++	struct buffer out[2];
++	struct buffer_rec in[8];
++
++	uint8_t out_head;
++	uint8_t out_tail;
++	uint8_t out_needed; /* number of buffers the dsp is waiting for */
++	atomic_t out_bytes;
++
++	/* configuration to use on next enable */
++	uint32_t out_sample_rate;
++	uint32_t out_channel_mode;
++	uint32_t out_weight;
++	uint32_t out_buffer_size;
++
++	struct audmgr audmgr;
++	struct snd_pcm_substream *playback_substream;
++	struct snd_pcm_substream *capture_substream;
++
++	/* data allocated for various buffers */
++	char *data;
++	dma_addr_t phys;
++
++	unsigned int pcm_size;
++	unsigned int pcm_count;
++	unsigned int pcm_irq_pos;       /* IRQ position */
++	unsigned int pcm_buf_pos;       /* position in buffer */
++
++	struct msm_adsp_module *audpre;
++	struct msm_adsp_module *audrec;
++
++	/* configuration to use on next enable */
++	uint32_t samp_rate;
++	uint32_t channel_mode;
++	uint32_t buffer_size; /* 2048 for mono, 4096 for stereo */
++	uint32_t type; /* 0 for PCM ,1 for AAC */
++	uint32_t dsp_cnt;
++	uint32_t in_head; /* next buffer dsp will write */
++	uint32_t in_tail; /* next buffer read() will read */
++	uint32_t in_count; /* number of buffers available to read() */
++
++	unsigned short samp_rate_index;
++
++	/* audpre settings */
++	audpreproc_cmd_cfg_agc_params tx_agc_cfg;
++	audpreproc_cmd_cfg_ns_params ns_cfg;
++	/* For different sample rate, the coeff might be different. *
++	* All the coeff should be passed from user space           */
++	audpreproc_cmd_cfg_iir_tuning_filter_params iir_cfg;
++
++	struct  msm_audio_event_callbacks *ops;
++
++	int dir;
++	int opened;
++	int enabled;
++	int running;
++	int stopped; /* set when stopped, cleared on flush */
++};
++
++
++
++/* platform data */
++extern int audio_dsp_out_enable(struct msm_audio *prtd, int yes);
++extern struct snd_soc_platform msm_soc_platform;
++extern struct snd_soc_dai msm_dais[2];
++extern struct snd_soc_codec_device soc_codec_dev_msm;
++
++int audrec_encoder_config(struct msm_audio *prtd);
++extern void alsa_get_dsp_frames(struct msm_audio *prtd);
++extern int alsa_rec_dsp_enable(struct msm_audio *prtd, int enable);
++extern int alsa_audrec_disable(struct msm_audio *prtd);
++extern int alsa_audio_configure(struct msm_audio *prtd);
++extern int alsa_audio_disable(struct msm_audio *prtd);
++extern int alsa_adsp_configure(struct msm_audio *prtd);
++extern int alsa_buffer_read(struct msm_audio *prtd, void __user *buf,
++					size_t count, loff_t *pos);
++ssize_t alsa_send_buffer(struct msm_audio *prtd, const char __user *buf,
++					size_t count, loff_t *pos);
++int msm_audio_volume_update(unsigned id,
++				int volume, int pan);
++extern struct audio_locks the_locks;
++extern struct msm_volume msm_vol_ctl;
++
++#endif /*_MSM_PCM_H*/
+diff --git a/sound/soc/msm/msm7201.c b/sound/soc/msm/msm7201.c
+new file mode 100644
+index 0000000..977fbac
+--- /dev/null
++++ b/sound/soc/msm/msm7201.c
+@@ -0,0 +1,337 @@
++/* linux/sound/soc/msm/msm7201.c
++ *
++ * Copyright (c) 2008-2009, Code Aurora Forum. All rights reserved.
++ *
++ * All source code in this file is licensed under the following license e=
xcept
++ * where indicated.
++ *
++ * This program is free software; you can redistribute it and/or modify i=
t
++ * under the terms of the GNU General Public License version 2 as publish=
ed
++ * by the Free Software Foundation.
++ *
++ * This program is distributed in the hope that it will be useful,
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
++ *
++ * See the GNU General Public License for more details.
++ * You should have received a copy of the GNU General Public License
++ * along with this program; if not, you can find it at http://www.fsf.org=
.
++ */
++
++#include <linux/init.h>
++#include <linux/err.h>
++#include <linux/module.h>
++#include <linux/moduleparam.h>
++#include <linux/time.h>
++#include <linux/wait.h>
++#include <linux/platform_device.h>
++#include <sound/core.h>
++#include <sound/soc.h>
++#include <sound/soc-dapm.h>
++#include <sound/pcm.h>
++#include <sound/tlv.h>
++#include <sound/initval.h>
++#include <sound/control.h>
++#include <asm/dma.h>
++#include <linux/dma-mapping.h>
++
++#include "msm-pcm.h"
++#include <asm/mach-types.h>
++#include <mach/msm_rpcrouter.h>
++
++static struct msm_rpc_endpoint *snd_ep;
++
++struct msm_snd_rpc_ids {
++	unsigned long   prog;
++	unsigned long   vers;
++	unsigned long   rpc_set_snd_device;
++	int device;
++};
++
++static struct msm_snd_rpc_ids snd_rpc_ids;
++
++static struct platform_device *msm_audio_snd_device;
++
++static int snd_msm_volume_info(struct snd_kcontrol *kcontrol,
++				struct snd_ctl_elem_info *uinfo)
++{
++	uinfo->type =3D SNDRV_CTL_ELEM_TYPE_INTEGER;
++	uinfo->count =3D 1; /* Volume Param, in dB */
++	uinfo->value.integer.min =3D MIN_DB;
++	uinfo->value.integer.max =3D MAX_DB;
++	return 0;
++}
++
++static int snd_msm_volume_get(struct snd_kcontrol *kcontrol,
++				struct snd_ctl_elem_value *ucontrol)
++{
++	spin_lock_irq(&the_locks.mixer_lock);
++	ucontrol->value.integer.value[0] =3D msm_vol_ctl.volume;
++	spin_unlock_irq(&the_locks.mixer_lock);
++	return 0;
++}
++
++static int snd_msm_volume_put(struct snd_kcontrol *kcontrol,
++				struct snd_ctl_elem_value *ucontrol)
++{
++	int change;
++	int volume;
++
++	volume =3D ucontrol->value.integer.value[0];
++	spin_lock_irq(&the_locks.mixer_lock);
++	change =3D (msm_vol_ctl.volume !=3D volume);
++	if (change) {
++		msm_vol_ctl.update =3D 1;
++		msm_vol_ctl.volume =3D volume;
++	}
++	spin_unlock_irq(&the_locks.mixer_lock);
++	return change;
++}
++
++static int snd_msm_device_info(struct snd_kcontrol *kcontrol,
++				struct snd_ctl_elem_info *uinfo)
++{
++	uinfo->type =3D SNDRV_CTL_ELEM_TYPE_INTEGER;
++	uinfo->count =3D 1; /* Device */
++
++	/*
++	 * The number of devices supported is 26 (0 to 25)
++	 */
++	uinfo->value.integer.min =3D 0;
++	uinfo->value.integer.max =3D 25;
++	return 0;
++}
++
++static int snd_msm_device_get(struct snd_kcontrol *kcontrol,
++				struct snd_ctl_elem_value *ucontrol)
++{
++	ucontrol->value.integer.value[0] =3D (uint32_t)snd_rpc_ids.device;
++	return 0;
++}
++
++int msm_snd_init_rpc_ids(void)
++{
++	snd_rpc_ids.prog	=3D 0x30000002;
++#ifdef CONFIG_MSM_AMSS_VERSION_6225
++	//TODO: complete for other versions
++	snd_rpc_ids.vers	=3D 0xaa2b1a44;
++#else
++	//seem a new magich number...not in arch/arm/mach-msm and it seem to be =
for a new amss version
++	snd_rpc_ids.vers	=3D 0x00020001;
++#endif
++	/*
++	 * The magic number 2 corresponds to the rpc call
++	 * index for snd_set_device
++	 */
++	snd_rpc_ids.rpc_set_snd_device =3D 2;
++	return 0;
++}
++
++int msm_snd_rpc_connect(void)
++{
++	if (snd_ep) {
++		printk(KERN_INFO "%s: snd_ep already connected\n", __func__);
++		return 0;
++	}
++
++	/* Initialize rpc ids */
++	if (msm_snd_init_rpc_ids()) {
++		printk(KERN_ERR "%s: snd rpc ids initialization failed\n"
++			, __func__);
++		return -ENODATA;
++	}
++
++	snd_ep =3D msm_rpc_connect(snd_rpc_ids.prog,
++				snd_rpc_ids.vers, 0);
++	if (IS_ERR(snd_ep)) {
++		printk(KERN_ERR "%s: failed (compatible VERS =3D %ld)\n",
++				__func__, snd_rpc_ids.vers);
++		snd_ep =3D NULL;
++		return -EAGAIN;
++	}
++	return 0;
++}
++
++int msm_snd_rpc_close(void)
++{
++	int rc =3D 0;
++
++	if (IS_ERR(snd_ep)) {
++		printk(KERN_ERR "%s: snd handle unavailable, rc =3D %ld\n",
++				__func__, PTR_ERR(snd_ep));
++		return -EAGAIN;
++	}
++
++	rc =3D msm_rpc_close(snd_ep);
++	snd_ep =3D NULL;
++
++	if (rc < 0) {
++		printk(KERN_ERR "%s: close rpc failed! rc =3D %d\n",
++				__func__, rc);
++		return -EAGAIN;
++	} else
++		printk(KERN_INFO "rpc close success\n");
++
++	return rc;
++}
++
++static int snd_msm_device_put(struct snd_kcontrol *kcontrol,
++			struct snd_ctl_elem_value *ucontrol)
++{
++	int rc =3D 0;
++	struct snd_start_req {
++		struct rpc_request_hdr hdr;
++		uint32_t rpc_snd_device;
++		uint32_t snd_mute_ear_mute;
++		uint32_t snd_mute_mic_mute;
++		uint32_t callback_ptr;
++		uint32_t client_data;
++	} req;
++
++	snd_rpc_ids.device =3D (int)ucontrol->value.integer.value[0];
++	req.hdr.type =3D 0;
++	req.hdr.rpc_vers =3D 2;
++
++	req.rpc_snd_device =3D cpu_to_be32(snd_rpc_ids.device);
++	req.snd_mute_ear_mute =3D cpu_to_be32(1);
++	req.snd_mute_mic_mute =3D cpu_to_be32(0);
++	req.callback_ptr =3D -1;
++	req.client_data =3D cpu_to_be32(0);
++
++	req.hdr.prog =3D snd_rpc_ids.prog;
++	req.hdr.vers =3D snd_rpc_ids.vers;
++
++	rc =3D msm_rpc_call(snd_ep, snd_rpc_ids.rpc_set_snd_device ,
++			&req, sizeof(req), 5 * HZ);
++
++	if (rc < 0) {
++		printk(KERN_ERR "%s: snd rpc call failed! rc =3D %d\n",
++			__func__, rc);
++	} else
++		printk(KERN_INFO "snd device connected \n");
++
++	return rc;
++}
++
++/* Supported range -50dB to 18dB */
++static const DECLARE_TLV_DB_LINEAR(db_scale_linear, -5000, 1800);
++
++#define MSM_EXT(xname, xindex, fp_info, fp_get, fp_put, addr) \
++{ .iface =3D SNDRV_CTL_ELEM_IFACE_MIXER, \
++  .access =3D SNDRV_CTL_ELEM_ACCESS_READWRITE, \
++  .name =3D xname, .index =3D xindex, \
++  .info =3D fp_info,\
++  .get =3D fp_get, .put =3D fp_put, \
++  .private_value =3D addr, \
++}
++
++#define MSM_EXT_TLV(xname, xindex, fp_info, fp_get, fp_put, addr, tlv_arr=
ay) \
++{ .iface =3D SNDRV_CTL_ELEM_IFACE_MIXER, \
++  .access =3D (SNDRV_CTL_ELEM_ACCESS_TLV_READ | \
++		SNDRV_CTL_ELEM_ACCESS_READWRITE), \
++  .name =3D xname, .index =3D xindex, \
++  .info =3D fp_info,\
++  .get =3D fp_get, .put =3D fp_put, .tlv.p =3D tlv_array, \
++  .private_value =3D addr, \
++}
++
++static struct snd_kcontrol_new snd_msm_controls[] =3D {
++	MSM_EXT_TLV("PCM Playback Volume", 0, snd_msm_volume_info, \
++	snd_msm_volume_get, snd_msm_volume_put, 0, db_scale_linear),
++	MSM_EXT("device", 1, snd_msm_device_info, snd_msm_device_get, \
++						 snd_msm_device_put, 0),
++};
++
++static int msm_new_mixer(struct snd_card *card)
++{
++	unsigned int idx;
++	int err;
++
++	printk(KERN_ERR "msm_soc:ALSA MSM Mixer Setting");
++	strcpy(card->mixername, "MSM Mixer");
++	for (idx =3D 0; idx < ARRAY_SIZE(snd_msm_controls); idx++) {
++		err =3D snd_ctl_add(card,
++				snd_ctl_new1(&snd_msm_controls[idx], NULL));
++		if (err < 0)
++			return err;
++	}
++	return 0;
++}
++
++static int msm_soc_dai_init(struct snd_soc_codec *codec)
++{
++
++	int ret =3D 0;
++	ret =3D msm_new_mixer(codec->card);
++	if (ret < 0) {
++		printk(KERN_ERR "msm_soc:ALSA MSM Mixer Fail");
++	}
++
++	return ret;
++}
++
++
++static struct snd_soc_dai_link msm_dai =3D {
++	.name =3D "ASOC",
++	.stream_name =3D "ASOC",
++	.codec_dai =3D &msm_dais[0],
++	.cpu_dai =3D &msm_dais[1],
++	.init	=3D msm_soc_dai_init,
++};
++
++struct snd_soc_card snd_soc_card_msm =3D {
++	.name 		=3D "msm-audio",
++	.dai_link	=3D &msm_dai,
++	.num_links =3D 1,
++	.platform =3D &msm_soc_platform,
++};
++
++/* msm_audio audio subsystem */
++static struct snd_soc_device msm_audio_snd_devdata =3D {
++	.card =3D &snd_soc_card_msm,
++	.codec_dev =3D &soc_codec_dev_msm,
++};
++
++
++static int __init msm_audio_init(void)
++{
++	int ret;
++
++	msm_audio_snd_device =3D platform_device_alloc("soc-audio", -1);
++	if (!msm_audio_snd_device)
++		return -ENOMEM;
++
++	platform_set_drvdata(msm_audio_snd_device, &msm_audio_snd_devdata);
++	msm_audio_snd_devdata.dev =3D &msm_audio_snd_device->dev;
++	ret =3D platform_device_add(msm_audio_snd_device);
++	if (ret) {
++		platform_device_put(msm_audio_snd_device);
++		return ret;
++	}
++	mutex_init(&the_locks.lock);
++	mutex_init(&the_locks.write_lock);
++	mutex_init(&the_locks.read_lock);
++	spin_lock_init(&the_locks.read_dsp_lock);
++	spin_lock_init(&the_locks.write_dsp_lock);
++	spin_lock_init(&the_locks.mixer_lock);
++	init_waitqueue_head(&the_locks.write_wait);
++	init_waitqueue_head(&the_locks.read_wait);
++	msm_vol_ctl.volume =3D MSM_PLAYBACK_DEFAULT_VOLUME;
++	msm_vol_ctl.pan =3D MSM_PLAYBACK_DEFAULT_PAN;
++
++	ret =3D msm_snd_rpc_connect();
++
++	return ret;
++}
++
++static void __exit msm_audio_exit(void)
++{
++	msm_snd_rpc_close();
++	platform_device_unregister(msm_audio_snd_device);
++}
++
++module_init(msm_audio_init);
++module_exit(msm_audio_exit);
++
++MODULE_DESCRIPTION("PCM module");
++MODULE_LICENSE("GPL v2");
+diff --git a/sound/soc/msm/msm7k-pcm.c b/sound/soc/msm/msm7k-pcm.c
+new file mode 100644
+index 0000000..38e8283
+--- /dev/null
++++ b/sound/soc/msm/msm7k-pcm.c
+@@ -0,0 +1,574 @@
++/* linux/sound/soc/msm/msm7k-pcm.c
++ *
++ * Copyright (c) 2008-2009, Code Aurora Forum. All rights reserved.
++ *
++ * All source code in this file is licensed under the following license e=
xcept
++ * where indicated.
++ *
++ * This program is free software; you can redistribute it and/or modify i=
t
++ * under the terms of the GNU General Public License version 2 as publish=
ed
++ * by the Free Software Foundation.
++ *
++ * This program is distributed in the hope that it will be useful,
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
++ *
++ * See the GNU General Public License for more details.
++ * You should have received a copy of the GNU General Public License
++ * along with this program; if not, you can find it at http://www.fsf.org=
.
++ */
++
++
++
++#include <linux/init.h>
++#include <linux/err.h>
++#include <linux/module.h>
++#include <linux/moduleparam.h>
++#include <linux/time.h>
++#include <linux/wait.h>
++#include <linux/platform_device.h>
++#include <sound/core.h>
++#include <sound/soc.h>
++#include <sound/soc-dapm.h>
++#include <sound/pcm.h>
++#include <sound/initval.h>
++#include <sound/control.h>
++#include <asm/dma.h>
++#include <linux/dma-mapping.h>
++
++#include "msm-pcm.h"
++
++#define SND_DRIVER        "snd_msm"
++#define MAX_PCM_DEVICES	SNDRV_CARDS
++#define MAX_PCM_SUBSTREAMS 1
++
++struct snd_msm {
++	struct snd_card *card;
++	struct snd_pcm *pcm;
++};
++
++int copy_count;
++
++struct audio_locks the_locks;
++EXPORT_SYMBOL(the_locks);
++struct msm_volume msm_vol_ctl;
++EXPORT_SYMBOL(msm_vol_ctl);
++
++
++static unsigned convert_dsp_samp_index(unsigned index)
++{
++	switch (index) {
++	case 48000:
++		return AUDREC_CMD_SAMP_RATE_INDX_48000;
++	case 44100:
++		return AUDREC_CMD_SAMP_RATE_INDX_44100;
++	case 32000:
++		return AUDREC_CMD_SAMP_RATE_INDX_32000;
++	case 24000:
++		return AUDREC_CMD_SAMP_RATE_INDX_24000;
++	case 22050:
++		return AUDREC_CMD_SAMP_RATE_INDX_22050;
++	case 16000:
++		return AUDREC_CMD_SAMP_RATE_INDX_16000;
++	case 12000:
++		return AUDREC_CMD_SAMP_RATE_INDX_12000;
++	case 11025:
++		return AUDREC_CMD_SAMP_RATE_INDX_11025;
++	case 8000:
++		return AUDREC_CMD_SAMP_RATE_INDX_8000;
++	default:
++		return AUDREC_CMD_SAMP_RATE_INDX_44100;
++	}
++}
++
++static unsigned convert_samp_rate(unsigned hz)
++{
++	switch (hz) {
++	case 48000:
++		return RPC_AUD_DEF_SAMPLE_RATE_48000;
++	case 44100:
++		return RPC_AUD_DEF_SAMPLE_RATE_44100;
++	case 32000:
++		return RPC_AUD_DEF_SAMPLE_RATE_32000;
++	case 24000:
++		return RPC_AUD_DEF_SAMPLE_RATE_24000;
++	case 22050:
++		return RPC_AUD_DEF_SAMPLE_RATE_22050;
++	case 16000:
++		return RPC_AUD_DEF_SAMPLE_RATE_16000;
++	case 12000:
++		return RPC_AUD_DEF_SAMPLE_RATE_12000;
++	case 11025:
++		return RPC_AUD_DEF_SAMPLE_RATE_11025;
++	case 8000:
++		return RPC_AUD_DEF_SAMPLE_RATE_8000;
++	default:
++		return RPC_AUD_DEF_SAMPLE_RATE_44100;
++	}
++}
++
++static struct snd_pcm_hardware msm_pcm_playback_hardware =3D {
++	.info =3D                 SNDRV_PCM_INFO_INTERLEAVED,
++	.formats =3D              USE_FORMATS,
++	.rates =3D                USE_RATE,
++	.rate_min =3D             USE_RATE_MIN,
++	.rate_max =3D             USE_RATE_MAX,
++	.channels_min =3D         USE_CHANNELS_MIN,
++	.channels_max =3D         USE_CHANNELS_MAX,
++	.buffer_bytes_max =3D     MAX_BUFFER_PLAYBACK_SIZE,
++	.period_bytes_min =3D     64,
++	.period_bytes_max =3D     MAX_PERIOD_SIZE,
++	.periods_min =3D          USE_PERIODS_MIN,
++	.periods_max =3D          USE_PERIODS_MAX,
++	.fifo_size =3D            0,
++};
++
++static struct snd_pcm_hardware msm_pcm_capture_hardware =3D {
++	.info =3D                 SNDRV_PCM_INFO_INTERLEAVED,
++	.formats =3D		USE_FORMATS,
++	.rates =3D		USE_RATE,
++	.rate_min =3D		USE_RATE_MIN,
++	.rate_max =3D		USE_RATE_MAX,
++	.channels_min =3D		USE_CHANNELS_MIN,
++	.channels_max =3D		USE_CHANNELS_MAX,
++	.buffer_bytes_max =3D	MAX_BUFFER_CAPTURE_SIZE,
++	.period_bytes_min =3D	CAPTURE_SIZE,
++	.period_bytes_max =3D	CAPTURE_SIZE,
++	.periods_min =3D		USE_PERIODS_MIN,
++	.periods_max =3D		USE_PERIODS_MAX,
++	.fifo_size =3D		0,
++};
++
++/* Conventional and unconventional sample rate supported */
++static unsigned int supported_sample_rates[] =3D {
++	8000, 11025, 12000, 16000, 22050, 24000, 32000, 44100, 48000
++};
++
++static struct snd_pcm_hw_constraint_list constraints_sample_rates =3D {
++	.count =3D ARRAY_SIZE(supported_sample_rates),
++	.list =3D supported_sample_rates,
++	.mask =3D 0,
++};
++
++static void playback_event_handler(void *data)
++{
++	struct msm_audio *prtd =3D data;
++	snd_pcm_period_elapsed(prtd->playback_substream);
++}
++
++static void capture_event_handler(void *data)
++{
++	struct msm_audio *prtd =3D data;
++	snd_pcm_period_elapsed(prtd->capture_substream);
++}
++
++static int msm_pcm_playback_prepare(struct snd_pcm_substream *substream)
++{
++	struct snd_pcm_runtime *runtime =3D substream->runtime;
++	struct msm_audio *prtd =3D runtime->private_data;
++
++	prtd->pcm_size =3D snd_pcm_lib_buffer_bytes(substream);
++	prtd->pcm_count =3D snd_pcm_lib_period_bytes(substream);
++	prtd->pcm_irq_pos =3D 0;
++	prtd->pcm_buf_pos =3D 0;
++
++	/* rate and channels are sent to audio driver */
++	prtd->out_sample_rate =3D runtime->rate;
++	prtd->out_channel_mode =3D runtime->channels;
++
++	return 0;
++}
++
++static int msm_pcm_capture_prepare(struct snd_pcm_substream *substream)
++{
++	struct snd_pcm_runtime *runtime =3D substream->runtime;
++	struct msm_audio *prtd =3D runtime->private_data;
++	struct audmgr_config cfg;
++	int rc;
++
++	prtd->pcm_size =3D snd_pcm_lib_buffer_bytes(substream);
++	prtd->pcm_count =3D snd_pcm_lib_period_bytes(substream);
++	prtd->pcm_irq_pos =3D 0;
++	prtd->pcm_buf_pos =3D 0;
++
++	/* rate and channels are sent to audio driver */
++	prtd->samp_rate =3D convert_samp_rate(runtime->rate);
++	prtd->samp_rate_index =3D convert_dsp_samp_index(runtime->rate);
++	prtd->channel_mode =3D (runtime->channels - 1);
++	prtd->buffer_size =3D prtd->channel_mode ? STEREO_DATA_SIZE : \
++							MONO_DATA_SIZE;
++
++	if (prtd->enabled =3D=3D 1)
++		return 0;
++
++	prtd->type =3D AUDREC_CMD_TYPE_0_INDEX_WAV;
++
++	cfg.tx_rate =3D convert_samp_rate(runtime->rate);
++	cfg.rx_rate =3D RPC_AUD_DEF_SAMPLE_RATE_NONE;
++	cfg.def_method =3D RPC_AUD_DEF_METHOD_RECORD;
++	cfg.codec =3D RPC_AUD_DEF_CODEC_PCM;
++	cfg.snd_method =3D RPC_SND_METHOD_MIDI;
++
++	rc =3D audmgr_enable(&prtd->audmgr, &cfg);
++	if (rc < 0)
++		return rc;
++
++	if (msm_adsp_enable(prtd->audpre)) {
++		audmgr_disable(&prtd->audmgr);
++		return -ENODEV;
++	}
++	if (msm_adsp_enable(prtd->audrec)) {
++		msm_adsp_disable(prtd->audpre);
++		audmgr_disable(&prtd->audmgr);
++		return -ENODEV;
++	}
++	prtd->enabled =3D 1;
++	alsa_rec_dsp_enable(prtd, 1);
++
++	return 0;
++}
++
++static int msm_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
++{
++	int ret =3D 0;
++
++	switch (cmd) {
++	case SNDRV_PCM_TRIGGER_START:
++	case SNDRV_PCM_TRIGGER_RESUME:
++	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
++		break;
++	case SNDRV_PCM_TRIGGER_STOP:
++	case SNDRV_PCM_TRIGGER_SUSPEND:
++	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
++		break;
++	default:
++		ret =3D -EINVAL;
++	}
++
++	return ret;
++}
++
++static snd_pcm_uframes_t
++msm_pcm_playback_pointer(struct snd_pcm_substream *substream)
++{
++	struct snd_pcm_runtime *runtime =3D substream->runtime;
++	struct msm_audio *prtd =3D runtime->private_data;
++
++	if (prtd->pcm_irq_pos =3D=3D prtd->pcm_size)
++		prtd->pcm_irq_pos =3D 0;
++	return bytes_to_frames(runtime, (prtd->pcm_irq_pos));
++}
++
++static int msm_pcm_capture_copy(struct snd_pcm_substream *substream,
++		 int channel, snd_pcm_uframes_t hwoff, void __user *buf,
++						 snd_pcm_uframes_t frames)
++{
++	int rc =3D 0, rc1 =3D 0, rc2 =3D 0;
++	int fbytes =3D 0;
++	struct snd_pcm_runtime *runtime =3D substream->runtime;
++	struct msm_audio *prtd =3D substream->runtime->private_data;
++
++	int monofbytes =3D 0;
++	char *bufferp =3D NULL;
++
++	fbytes =3D frames_to_bytes(runtime, frames);
++	monofbytes =3D fbytes / 2;
++	if (runtime->channels =3D=3D 2) {
++		rc =3D alsa_buffer_read(prtd, buf, fbytes, NULL);
++	} else {
++		bufferp =3D buf;
++		rc1 =3D alsa_buffer_read(prtd, bufferp, monofbytes, NULL);
++		bufferp =3D buf + monofbytes ;
++		rc2 =3D alsa_buffer_read(prtd, bufferp, monofbytes, NULL);
++		rc =3D rc1 + rc2;
++	}
++	prtd->pcm_buf_pos +=3D fbytes;
++	return rc;
++}
++
++static snd_pcm_uframes_t
++msm_pcm_capture_pointer(struct snd_pcm_substream *substream)
++{
++	struct snd_pcm_runtime *runtime =3D substream->runtime;
++	struct msm_audio *prtd =3D runtime->private_data;
++
++	return bytes_to_frames(runtime, (prtd->pcm_irq_pos));
++}
++
++static int msm_pcm_capture_close(struct snd_pcm_substream *substream)
++{
++	struct snd_pcm_runtime *runtime =3D substream->runtime;
++	struct msm_audio *prtd =3D runtime->private_data;
++
++	alsa_audrec_disable(prtd);
++	audmgr_close(&prtd->audmgr);
++	msm_adsp_put(prtd->audrec);
++	msm_adsp_put(prtd->audpre);
++	kfree(prtd);
++
++	return 0;
++}
++
++struct  msm_audio_event_callbacks snd_msm_audio_ops =3D {
++	.playback =3D playback_event_handler,
++	.capture =3D capture_event_handler,
++};
++
++static int msm_pcm_open(struct snd_pcm_substream *substream)
++{
++	struct snd_pcm_runtime *runtime =3D substream->runtime;
++	struct msm_audio *prtd;
++	int ret =3D 0;
++
++	prtd =3D kzalloc(sizeof(struct msm_audio), GFP_KERNEL);
++	if (prtd =3D=3D NULL) {
++		ret =3D -ENOMEM;
++		return ret;
++	}
++	if (substream->stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK) {
++		msm_vol_ctl.update =3D 1; /* Update Volume, with Cached value */
++		runtime->hw =3D msm_pcm_playback_hardware;
++		prtd->dir =3D SNDRV_PCM_STREAM_PLAYBACK;
++		prtd->playback_substream =3D substream;
++	} else if (substream->stream =3D=3D SNDRV_PCM_STREAM_CAPTURE) {
++		runtime->hw =3D msm_pcm_capture_hardware;
++		prtd->dir =3D SNDRV_PCM_STREAM_CAPTURE;
++		prtd->capture_substream =3D substream;
++	}
++	ret =3D snd_pcm_hw_constraint_list(runtime, 0,
++						SNDRV_PCM_HW_PARAM_RATE,
++						&constraints_sample_rates);
++	if (ret < 0)
++		goto out;
++	/* Ensure that buffer size is a multiple of period size */
++	ret =3D snd_pcm_hw_constraint_integer(runtime,
++					    SNDRV_PCM_HW_PARAM_PERIODS);
++	if (ret < 0)
++		goto out;
++
++	prtd->ops =3D &snd_msm_audio_ops;
++	prtd->out[0].used =3D BUF_INVALID_LEN;
++	prtd->out_head =3D 1; /* point to second buffer on startup */
++	runtime->private_data =3D prtd;
++
++	ret =3D alsa_adsp_configure(prtd);
++	if (ret)
++		goto out;
++	copy_count =3D 0;
++	return 0;
++
++ out:
++	kfree(prtd);
++	return ret;
++}
++
++static int msm_pcm_playback_copy(struct snd_pcm_substream *substream, int=
 a,
++	snd_pcm_uframes_t hwoff, void __user *buf, snd_pcm_uframes_t frames)
++{
++	int rc =3D 1;
++	int fbytes =3D 0;
++
++	struct snd_pcm_runtime *runtime =3D substream->runtime;
++	struct msm_audio *prtd =3D runtime->private_data;
++
++	fbytes =3D frames_to_bytes(runtime, frames);
++	rc =3D alsa_send_buffer(prtd, buf, fbytes, NULL);
++	++copy_count;
++	prtd->pcm_buf_pos +=3D fbytes;
++	if (copy_count =3D=3D 1) {
++		mutex_lock(&the_locks.lock);
++		alsa_audio_configure(prtd);
++		mutex_unlock(&the_locks.lock);
++	}
++	if ((prtd->running) && (msm_vol_ctl.update)) {
++		rc =3D msm_audio_volume_update(PCMPLAYBACK_DECODERID,
++				msm_vol_ctl.volume, msm_vol_ctl.pan);
++		msm_vol_ctl.update =3D 0;
++	}
++
++	return  rc;
++}
++
++static int msm_pcm_playback_close(struct snd_pcm_substream *substream)
++{
++	struct snd_pcm_runtime *runtime =3D substream->runtime;
++	struct msm_audio *prtd =3D runtime->private_data;
++
++	alsa_audio_disable(prtd);
++	audmgr_close(&prtd->audmgr);
++	kfree(prtd);
++
++	return 0;
++}
++
++
++static int msm_pcm_copy(struct snd_pcm_substream *substream, int a,
++	 snd_pcm_uframes_t hwoff, void __user *buf, snd_pcm_uframes_t frames)
++{
++	int ret =3D 0;
++
++	if (substream->stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK)
++		ret =3D msm_pcm_playback_copy(substream, a, hwoff, buf, frames);
++	else if (substream->stream =3D=3D SNDRV_PCM_STREAM_CAPTURE)
++		ret =3D msm_pcm_capture_copy(substream, a, hwoff, buf, frames);
++	return ret;
++}
++
++static int msm_pcm_close(struct snd_pcm_substream *substream)
++{
++	int ret =3D 0;
++
++	if (substream->stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK)
++		ret =3D msm_pcm_playback_close(substream);
++	else if (substream->stream =3D=3D SNDRV_PCM_STREAM_CAPTURE)
++		ret =3D msm_pcm_capture_close(substream);
++	return ret;
++}
++static int msm_pcm_prepare(struct snd_pcm_substream *substream)
++{
++	int ret =3D 0;
++
++	if (substream->stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK)
++		ret =3D msm_pcm_playback_prepare(substream);
++	else if (substream->stream =3D=3D SNDRV_PCM_STREAM_CAPTURE)
++		ret =3D msm_pcm_capture_prepare(substream);
++	return ret;
++}
++
++static snd_pcm_uframes_t msm_pcm_pointer(struct snd_pcm_substream *substr=
eam)
++{
++	snd_pcm_uframes_t ret =3D 0;
++
++	if (substream->stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK)
++		ret =3D msm_pcm_playback_pointer(substream);
++	else if (substream->stream =3D=3D SNDRV_PCM_STREAM_CAPTURE)
++		ret =3D msm_pcm_capture_pointer(substream);
++	return ret;
++}
++
++int msm_pcm_hw_params(struct snd_pcm_substream *substream,
++				struct snd_pcm_hw_params *params)
++{
++	struct snd_pcm_runtime *runtime =3D substream->runtime;
++
++	if (substream->pcm->device & 1) {
++		runtime->hw.info &=3D ~SNDRV_PCM_INFO_INTERLEAVED;
++		runtime->hw.info |=3D SNDRV_PCM_INFO_NONINTERLEAVED;
++	}
++	return 0;
++
++}
++
++static struct snd_pcm_ops msm_pcm_ops =3D {
++	.open           =3D msm_pcm_open,
++	.copy		=3D msm_pcm_copy,
++	.hw_params	=3D msm_pcm_hw_params,
++	.close          =3D msm_pcm_close,
++	.ioctl          =3D snd_pcm_lib_ioctl,
++	.prepare        =3D msm_pcm_prepare,
++	.trigger        =3D msm_pcm_trigger,
++	.pointer        =3D msm_pcm_pointer,
++};
++
++
++
++static int msm_pcm_remove(struct platform_device *devptr)
++{
++	struct snd_soc_device *socdev =3D platform_get_drvdata(devptr);
++	snd_soc_free_pcms(socdev);
++	kfree(socdev->codec);
++	platform_set_drvdata(devptr, NULL);
++	return 0;
++}
++
++static int pcm_preallocate_dma_buffer(struct snd_pcm *pcm,
++	int stream)
++{
++	struct snd_pcm_substream *substream =3D pcm->streams[stream].substream;
++	struct snd_dma_buffer *buf =3D &substream->dma_buffer;
++	size_t size;
++	if (!stream)
++		size =3D PLAYBACK_DMASZ;
++	else
++		size =3D CAPTURE_DMASZ;
++
++	buf->dev.type =3D SNDRV_DMA_TYPE_DEV;
++	buf->dev.dev =3D pcm->card->dev;
++	buf->private_data =3D NULL;
++	buf->area =3D dma_alloc_coherent(pcm->card->dev, size,
++					   &buf->addr, GFP_KERNEL);
++	if (!buf->area)
++		return -ENOMEM;
++
++	buf->bytes =3D size;
++	return 0;
++}
++
++static void msm_pcm_free_dma_buffers(struct snd_pcm *pcm)
++{
++	struct snd_pcm_substream *substream;
++	struct snd_dma_buffer *buf;
++	int stream;
++
++	for (stream =3D 0; stream < 2; stream++) {
++		substream =3D pcm->streams[stream].substream;
++		if (!substream)
++			continue;
++
++		buf =3D &substream->dma_buffer;
++		if (!buf->area)
++			continue;
++
++		dma_free_coherent(pcm->card->dev, buf->bytes,
++				      buf->area, buf->addr);
++		buf->area =3D NULL;
++	}
++}
++
++static int msm_pcm_new(struct snd_card *card,
++			struct snd_soc_dai *codec_dai,
++			struct snd_pcm *pcm)
++{
++	int ret;
++	if (!card->dev->coherent_dma_mask)
++		card->dev->coherent_dma_mask =3D DMA_32BIT_MASK;
++
++	if (codec_dai->playback.channels_min) {
++		ret =3D pcm_preallocate_dma_buffer(pcm,
++			SNDRV_PCM_STREAM_PLAYBACK);
++		if (ret)
++			return ret;
++	}
++
++	if (codec_dai->capture.channels_min) {
++		ret =3D pcm_preallocate_dma_buffer(pcm,
++			SNDRV_PCM_STREAM_CAPTURE);
++		if (ret)
++			msm_pcm_free_dma_buffers(pcm);
++	}
++	return ret;
++}
++
++struct snd_soc_platform msm_soc_platform =3D {
++	.name		=3D "msm-audio",
++	.remove         =3D msm_pcm_remove,
++	.pcm_ops 	=3D &msm_pcm_ops,
++	.pcm_new	=3D msm_pcm_new,
++	.pcm_free	=3D msm_pcm_free_dma_buffers,
++};
++EXPORT_SYMBOL(msm_soc_platform);
++
++static int __init msm_soc_platform_init(void)
++{
++	return snd_soc_register_platform(&msm_soc_platform);
++}
++module_init(msm_soc_platform_init);
++
++static void __exit msm_soc_platform_exit(void)
++{
++	snd_soc_unregister_platform(&msm_soc_platform);
++}
++module_exit(msm_soc_platform_exit);
++
++MODULE_DESCRIPTION("PCM module platform driver");
++MODULE_LICENSE("GPL v2");
+diff --git a/sound/soc/msm/qsd-pcm.h b/sound/soc/msm/qsd-pcm.h
+new file mode 100644
+index 0000000..6d919c4
+--- /dev/null
++++ b/sound/soc/msm/qsd-pcm.h
+@@ -0,0 +1,97 @@
++/* linux/sound/soc/msm/qsd-pcm.h
++ *
++ * Copyright (C) 2008 Google, Inc.
++ * Copyright (C) 2008 HTC Corporation
++ * Copyright (c) 2008-2009, Code Aurora Forum. All rights reserved.
++ *
++ * This software is licensed under the terms of the GNU General Public
++ * License version 2, as published by the Free Software Foundation, and
++ * may be copied, distributed, and modified under those terms.
++ *
++ * This program is distributed in the hope that it will be useful,
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
++ *
++ * See the GNU General Public License for more details.
++ * You should have received a copy of the GNU General Public License
++ * along with this program; if not, you can find it at http://www.fsf.org=
.
++ */
++
++#ifndef _QSD_PCM_H
++#define _QSD_PCM_H
++
++#include <linux/msm_audio.h>
++
++#include <mach/qdsp6/msm8k_ard.h>
++#include <mach/qdsp6/msm8k_cad_write_pcm_format.h>
++#include <mach/qdsp6/msm8k_cad_devices.h>
++#include <mach/qdsp6/msm8k_cad.h>
++#include <mach/qdsp6/msm8k_cad_ioctl.h>
++#include <mach/qdsp6/msm8k_cad_volume.h>
++
++extern void register_cb(void *);
++
++#define USE_FORMATS             (SNDRV_PCM_FMTBIT_S16_LE)
++#define USE_CHANNELS_MIN        1
++#define USE_CHANNELS_MAX        2
++#define USE_RATE                (SNDRV_PCM_RATE_8000_48000 \
++				| SNDRV_PCM_RATE_CONTINUOUS)
++#define USE_RATE_MIN            8000
++#define USE_RATE_MAX            48000
++#define MAX_BUFFER_SIZE         (4096*4)
++#define MAX_PERIOD_SIZE         4096
++#define MIN_PERIOD_SIZE         40
++#define USE_PERIODS_MAX         1024
++#define USE_PERIODS_MIN         1
++
++struct audio_locks {
++	struct mutex lock;
++	struct mutex mixer_lock;
++};
++
++struct qsd_ctl {
++	uint16_t tx_volume; /* Volume parameter */
++	uint16_t rx_volume; /* Volume parameter */
++	int32_t strm_volume; /* stream volume*/
++	uint16_t update;
++	int16_t pan;
++	uint16_t capture_device; /* Device parameter */
++	uint16_t playback_device; /* Device  parameter */
++	uint16_t tx_mute;		 /* Mute  parameter */
++	uint16_t rx_mute;		 /* Mute  parameter */
++};
++
++extern struct audio_locks the_locks;
++extern struct snd_pcm_ops qsd_pcm_ops;
++
++struct qsd_audio {
++	struct snd_pcm_substream *playback_substream;
++	struct snd_pcm_substream *capture_substream;
++
++	/* data allocated for various buffers */
++	char *data;
++	dma_addr_t phys;
++
++	unsigned int pcm_size;
++	unsigned int pcm_count;
++	unsigned int pcm_irq_pos;	/* IRQ position */
++	unsigned int pcm_buf_pos;	/* position in buffer */
++
++	int dir;
++	int opened;
++	int enabled;
++	int running;
++	int stopped;		/* set when stopped, cleared on flush */
++
++	struct cad_open_struct_type cos;
++	uint32_t cad_w_handle;
++	struct cad_buf_struct_type cbs;
++};
++
++extern struct qsd_ctl qsd_glb_ctl;
++
++extern struct snd_soc_dai msm_dais[2];
++extern struct snd_soc_codec_device soc_codec_dev_msm;
++extern struct snd_soc_platform qsd_soc_platform;
++
++#endif /*_QSD_PCM_H*/
+diff --git a/sound/soc/msm/qsd8k-pcm.c b/sound/soc/msm/qsd8k-pcm.c
+new file mode 100644
+index 0000000..afba42d
+--- /dev/null
++++ b/sound/soc/msm/qsd8k-pcm.c
+@@ -0,0 +1,618 @@
++/* linux/sound/soc/msm/qsd8k-pcm.c
++ *
++ * Copyright (c) 2009, Code Aurora Forum. All rights reserved.
++ *
++ * All source code in this file is licensed under the following license e=
xcept
++ * where indicated.
++ *
++ * This program is free software; you can redistribute it and/or modify i=
t
++ * under the terms of the GNU General Public License version 2 as publish=
ed
++ * by the Free Software Foundation.
++ *
++ * This program is distributed in the hope that it will be useful,
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
++ *
++ * See the GNU General Public License for more details.
++ * You should have received a copy of the GNU General Public License
++ * along with this program; if not, you can find it at http://www.fsf.org=
.
++ */
++
++#include <linux/init.h>
++#include <linux/err.h>
++#include <linux/module.h>
++#include <linux/moduleparam.h>
++#include <linux/time.h>
++#include <linux/wait.h>
++#include <linux/platform_device.h>
++#include <sound/core.h>
++#include <sound/soc.h>
++#include <sound/soc-dapm.h>
++#include <sound/pcm.h>
++#include <sound/initval.h>
++#include <sound/control.h>
++#include <asm/dma.h>
++#include <linux/dma-mapping.h>
++
++#include "qsd-pcm.h"
++
++struct snd_pcm_runtime *runtime_dummy;
++static int rc =3D 1;
++
++#define SND_DRIVER        "snd_qsd"
++#define MAX_PCM_DEVICES	SNDRV_CARDS
++#define MAX_PCM_SUBSTREAMS 1
++
++struct snd_qsd {
++	struct snd_card *card;
++	struct snd_pcm *pcm;
++};
++
++struct qsd_ctl qsd_glb_ctl;
++EXPORT_SYMBOL(qsd_glb_ctl);
++struct audio_locks the_locks;
++EXPORT_SYMBOL(the_locks);
++
++static unsigned convert_dsp_samp_index(unsigned index)
++{
++	switch (index) {
++	case 48000:
++		return 3;
++	case 44100:
++		return 4;
++	case 32000:
++		return 5;
++	case 24000:
++		return 6;
++	case 22050:
++		return 7;
++	case 16000:
++		return 8;
++	case 12000:
++		return 9;
++	case 11025:
++		return 10;
++	case 8000:
++		return 11;
++	default:
++		return 3;
++	}
++}
++
++static struct snd_pcm_hardware qsd_pcm_playback_hardware =3D {
++	.info =3D SNDRV_PCM_INFO_INTERLEAVED,
++	.formats =3D USE_FORMATS,
++	.rates =3D USE_RATE,
++	.rate_min =3D USE_RATE_MIN,
++	.rate_max =3D USE_RATE_MAX,
++	.channels_min =3D USE_CHANNELS_MIN,
++	.channels_max =3D USE_CHANNELS_MAX,
++	.buffer_bytes_max =3D MAX_BUFFER_SIZE,
++	.period_bytes_min =3D MIN_PERIOD_SIZE,
++	.period_bytes_max =3D MAX_PERIOD_SIZE,
++	.periods_min =3D USE_PERIODS_MIN,
++	.periods_max =3D USE_PERIODS_MAX,
++	.fifo_size =3D 0,
++};
++
++static struct snd_pcm_hardware qsd_pcm_capture_hardware =3D {
++	.info =3D SNDRV_PCM_INFO_INTERLEAVED,
++	.formats =3D USE_FORMATS,
++	.rates =3D USE_RATE,
++	.rate_min =3D USE_RATE_MIN,
++	.rate_max =3D USE_RATE_MAX,
++	.channels_min =3D USE_CHANNELS_MIN,
++	.channels_max =3D USE_CHANNELS_MAX,
++	.buffer_bytes_max =3D MAX_BUFFER_SIZE,
++	.period_bytes_min =3D MIN_PERIOD_SIZE,
++	.period_bytes_max =3D MAX_PERIOD_SIZE,
++	.periods_min =3D USE_PERIODS_MIN,
++	.periods_max =3D USE_PERIODS_MAX,
++	.fifo_size =3D 0,
++};
++
++int qsd_audio_volume_update(struct qsd_audio *prtd)
++{
++
++	int rc =3D 0;
++	struct cad_flt_cfg_strm_vol cad_strm_volume;
++	struct cad_filter_struct flt;
++
++	printk(KERN_INFO "qsd_audio_volume_update: updating volume");
++	memset(&cad_strm_volume, 0, sizeof(struct cad_flt_cfg_strm_vol));
++	memset(&flt, 0, sizeof(struct cad_filter_struct));
++
++	cad_strm_volume.volume =3D qsd_glb_ctl.strm_volume;
++	flt.filter_type =3D CAD_DEVICE_FILTER_TYPE_VOL;
++	flt.format_block =3D &cad_strm_volume;
++	flt.cmd =3D CAD_FILTER_CONFIG_STREAM_VOLUME;
++	flt.format_block_len =3D sizeof(struct cad_flt_cfg_strm_vol);
++
++	rc =3D cad_ioctl(prtd->cad_w_handle,
++		CAD_IOCTL_CMD_SET_STREAM_FILTER_CONFIG,
++		&flt,
++		sizeof(struct cad_filter_struct));
++	if (rc)
++		printk(KERN_ERR "cad_ioctl() set volume failed\n");
++	return rc;
++}
++
++static int qsd_pcm_playback_prepare(struct snd_pcm_substream *substream)
++{
++	struct snd_pcm_runtime *runtime =3D substream->runtime;
++	struct qsd_audio *prtd =3D runtime->private_data;
++
++	struct cad_stream_device_struct_type cad_stream_dev;
++	struct cad_stream_info_struct_type cad_stream_info;
++	struct cad_write_pcm_format_struct_type cad_write_pcm_fmt;
++	u32 stream_device[1];
++
++	if (prtd->enabled)
++		return 0;
++
++	prtd->pcm_size =3D snd_pcm_lib_buffer_bytes(substream);
++	prtd->pcm_count =3D snd_pcm_lib_period_bytes(substream);
++	prtd->pcm_irq_pos =3D 0;
++	prtd->pcm_buf_pos =3D 0;
++
++	cad_stream_info.app_type =3D CAD_STREAM_APP_PLAYBACK;
++	cad_stream_info.priority =3D 0;
++	cad_stream_info.buf_mem_type =3D CAD_STREAM_BUF_MEM_HEAP;
++	cad_stream_info.ses_buf_max_size =3D prtd->pcm_count;
++
++	mutex_lock(&the_locks.lock);
++	rc =3D cad_ioctl(prtd->cad_w_handle, CAD_IOCTL_CMD_SET_STREAM_INFO,
++		       &cad_stream_info,
++		       sizeof(struct cad_stream_info_struct_type));
++	mutex_unlock(&the_locks.lock);
++	if (rc)
++		printk(KERN_ERR "cad ioctl failed\n");
++
++	stream_device[0] =3D CAD_HW_DEVICE_ID_DEFAULT_RX ;
++	cad_stream_dev.device =3D (u32 *) &stream_device[0];
++	cad_stream_dev.device_len =3D 1;
++	mutex_lock(&the_locks.lock);
++
++	rc =3D cad_ioctl(prtd->cad_w_handle, CAD_IOCTL_CMD_SET_STREAM_DEVICE,
++		       &cad_stream_dev,
++		       sizeof(struct cad_stream_device_struct_type));
++	mutex_unlock(&the_locks.lock);
++	if (rc)
++		printk(KERN_ERR "cad ioctl  failed\n");
++
++	cad_write_pcm_fmt.us_ver_id =3D CAD_WRITE_PCM_VERSION_10;
++	cad_write_pcm_fmt.pcm.us_sample_rate =3D
++	    convert_dsp_samp_index(runtime->rate);
++	cad_write_pcm_fmt.pcm.us_channel_config =3D runtime->channels;
++	cad_write_pcm_fmt.pcm.us_width =3D 1;
++	cad_write_pcm_fmt.pcm.us_sign =3D 0;
++
++	mutex_lock(&the_locks.lock);
++	rc =3D cad_ioctl(prtd->cad_w_handle, CAD_IOCTL_CMD_SET_STREAM_CONFIG,
++		       &cad_write_pcm_fmt,
++		       sizeof(struct cad_write_pcm_format_struct_type));
++	mutex_unlock(&the_locks.lock);
++	if (rc)
++		printk(KERN_ERR "cad ioctl failed\n");
++
++	mutex_lock(&the_locks.lock);
++	rc =3D cad_ioctl(prtd->cad_w_handle, CAD_IOCTL_CMD_STREAM_START,
++		NULL, 0);
++	mutex_unlock(&the_locks.lock);
++	if (rc)
++		printk(KERN_ERR "cad ioctl failed\n");
++	else {
++		prtd->enabled =3D 1;
++		mutex_lock(&the_locks.mixer_lock);
++		qsd_glb_ctl.update =3D 1; /* Update Volume, with Cached value */
++		mutex_unlock(&the_locks.mixer_lock);
++	}
++	return rc;
++}
++
++static int qsd_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
++{
++	int ret =3D 0;
++
++	switch (cmd) {
++	case SNDRV_PCM_TRIGGER_START:
++	case SNDRV_PCM_TRIGGER_RESUME:
++	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
++		break;
++	case SNDRV_PCM_TRIGGER_STOP:
++	case SNDRV_PCM_TRIGGER_SUSPEND:
++	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
++		break;
++	default:
++		ret =3D -EINVAL;
++	}
++
++	return ret;
++}
++
++static snd_pcm_uframes_t
++qsd_pcm_playback_pointer(struct snd_pcm_substream *substream)
++{
++	struct snd_pcm_runtime *runtime =3D substream->runtime;
++	struct qsd_audio *prtd =3D runtime->private_data;
++
++	if (prtd->pcm_irq_pos =3D=3D prtd->pcm_size)
++		prtd->pcm_irq_pos =3D 0;
++	return bytes_to_frames(runtime, (prtd->pcm_irq_pos));
++}
++
++void alsa_event_cb_playback(void)
++{
++	if (runtime_dummy) {
++		struct qsd_audio *prtd =3D runtime_dummy->private_data;
++		prtd->pcm_irq_pos +=3D prtd->pcm_count;
++		snd_pcm_period_elapsed(prtd->playback_substream);
++	}
++}
++void alsa_event_cb_capture(u32 event, void *evt_packet,
++			u32 evt_packet_len, void *client_data)
++{
++	struct qsd_audio *prtd =3D client_data;
++	prtd->pcm_irq_pos +=3D prtd->pcm_count;
++	snd_pcm_period_elapsed(prtd->capture_substream);
++}
++
++
++static int qsd_pcm_open(struct snd_pcm_substream *substream)
++{
++	struct snd_pcm_runtime *runtime =3D substream->runtime;
++	struct qsd_audio *prtd;
++	struct cad_event_struct_type alsa_event;
++	int ret =3D 0;
++
++	prtd =3D kzalloc(sizeof(struct qsd_audio), GFP_KERNEL);
++	if (prtd =3D=3D NULL) {
++		ret =3D -ENOMEM;
++		return ret;
++	}
++	if (substream->stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK) {
++		runtime_dummy =3D runtime;
++		printk(KERN_INFO "Stream =3D SNDRV_PCM_STREAM_PLAYBACK\n");
++		runtime->hw =3D qsd_pcm_playback_hardware;
++		prtd->dir =3D SNDRV_PCM_STREAM_PLAYBACK;
++		prtd->playback_substream =3D substream;
++		prtd->cos.op_code =3D CAD_OPEN_OP_WRITE;
++	} else {
++		printk(KERN_INFO "Stream =3D SNDRV_PCM_STREAM_CAPTURE\n");
++		runtime->hw =3D qsd_pcm_capture_hardware;
++		prtd->dir =3D SNDRV_PCM_STREAM_CAPTURE;
++		prtd->capture_substream =3D substream;
++		prtd->cos.op_code =3D CAD_OPEN_OP_READ;
++	}
++
++	/* Ensure that buffer size is a multiple of period size */
++	ret =3D snd_pcm_hw_constraint_integer(runtime,
++					    SNDRV_PCM_HW_PARAM_PERIODS);
++	if (ret < 0) {
++		kfree(prtd);
++		return ret;
++	}
++
++	runtime->private_data =3D prtd;
++
++	prtd->cos.format =3D CAD_FORMAT_PCM;
++
++	mutex_lock(&the_locks.lock);
++	prtd->cad_w_handle =3D cad_open(&prtd->cos);
++	mutex_unlock(&the_locks.lock);
++
++	mutex_lock(&the_locks.lock);
++	if  (substream->stream =3D=3D SNDRV_PCM_STREAM_CAPTURE) {
++		alsa_event.callback =3D &alsa_event_cb_capture;
++		alsa_event.client_data =3D prtd;
++
++		ret =3D cad_ioctl(prtd->cad_w_handle,
++			CAD_IOCTL_CMD_SET_STREAM_EVENT_LSTR,
++			&alsa_event, sizeof(struct cad_event_struct_type));
++		if (ret) {
++			mutex_unlock(&the_locks.lock);
++			cad_close(prtd->cad_w_handle);
++			kfree(prtd);
++			return ret;
++		}
++	} else
++		register_cb(&alsa_event_cb_playback);
++	mutex_unlock(&the_locks.lock);
++	prtd->enabled =3D 0;
++
++	return 0;
++}
++
++static int qsd_pcm_playback_copy(struct snd_pcm_substream *substream, int=
 a,
++				 snd_pcm_uframes_t hwoff, void __user *buf,
++				 snd_pcm_uframes_t frames)
++{
++	int fbytes =3D 0;
++	size_t xfer;
++	int rc;
++
++	struct snd_pcm_runtime *runtime =3D substream->runtime;
++	struct qsd_audio *prtd =3D runtime->private_data;
++
++	fbytes =3D frames_to_bytes(runtime, frames);
++	prtd->cbs.buffer =3D (void *)buf;
++	prtd->cbs.phys_addr =3D 0;
++	prtd->cbs.max_size =3D fbytes;
++	prtd->cbs.actual_size =3D fbytes;
++
++	prtd->pcm_buf_pos +=3D fbytes;
++	mutex_lock(&the_locks.lock);
++	xfer =3D cad_write(prtd->cad_w_handle, &prtd->cbs);
++	mutex_unlock(&the_locks.lock);
++
++	mutex_lock(&the_locks.mixer_lock);
++	if (qsd_glb_ctl.update) {
++		rc =3D qsd_audio_volume_update(prtd);
++		qsd_glb_ctl.update =3D 0;
++	}
++	mutex_unlock(&the_locks.mixer_lock);
++
++	return 0;
++}
++
++static int qsd_pcm_playback_close(struct snd_pcm_substream *substream)
++{
++	struct snd_pcm_runtime *runtime =3D substream->runtime;
++	struct qsd_audio *prtd =3D runtime->private_data;
++
++	mutex_lock(&the_locks.lock);
++	cad_close(prtd->cad_w_handle);
++	mutex_unlock(&the_locks.lock);
++	prtd->enabled =3D 0;
++
++	/*
++	 * TODO: Deregister the async callback handler.
++	 * Currently cad provides no interface to do so.
++	 */
++	register_cb(NULL);
++	kfree(prtd);
++
++	return 0;
++}
++
++static int qsd_pcm_capture_copy(struct snd_pcm_substream *substream, int =
a,
++				 snd_pcm_uframes_t hwoff, void __user *buf,
++				 snd_pcm_uframes_t frames)
++{
++	int fbytes =3D 0;
++	size_t xfer;
++	int rc =3D 0;
++
++	struct snd_pcm_runtime *runtime =3D substream->runtime;
++	struct qsd_audio *prtd =3D runtime->private_data;
++
++	fbytes =3D frames_to_bytes(runtime, frames);
++	fbytes =3D fbytes;
++
++	prtd->cbs.buffer =3D (void *)buf;
++	prtd->cbs.phys_addr =3D 0;
++	prtd->cbs.max_size =3D fbytes;
++	prtd->cbs.actual_size =3D fbytes;
++
++	mutex_lock(&the_locks.lock);
++	xfer =3D cad_read(prtd->cad_w_handle, &prtd->cbs);
++	mutex_unlock(&the_locks.lock);
++
++	prtd->pcm_buf_pos +=3D fbytes;
++	mutex_lock(&the_locks.mixer_lock);
++	if (qsd_glb_ctl.update) {
++		rc =3D qsd_audio_volume_update(prtd);
++		qsd_glb_ctl.update =3D 0;
++	}
++	mutex_unlock(&the_locks.mixer_lock);
++
++	if (xfer < fbytes)
++		return -EIO;
++
++	return rc;
++}
++
++static snd_pcm_uframes_t
++qsd_pcm_capture_pointer(struct snd_pcm_substream *substream)
++{
++	struct snd_pcm_runtime *runtime =3D substream->runtime;
++	struct qsd_audio *prtd =3D runtime->private_data;
++
++	return bytes_to_frames(runtime, (prtd->pcm_irq_pos));
++}
++
++static int qsd_pcm_capture_close(struct snd_pcm_substream *substream)
++{
++	struct snd_pcm_runtime *runtime =3D substream->runtime;
++	struct qsd_audio *prtd =3D runtime->private_data;
++
++	mutex_lock(&the_locks.lock);
++	cad_close(prtd->cad_w_handle);
++	mutex_unlock(&the_locks.lock);
++
++	/*
++	 * TODO: Deregister the async callback handler.
++	 * Currently cad provides no interface to do so.
++	 */
++	kfree(prtd);
++
++	return 0;
++}
++
++static int qsd_pcm_capture_prepare(struct snd_pcm_substream *substream)
++{
++	struct snd_pcm_runtime *runtime =3D substream->runtime;
++	struct qsd_audio *prtd =3D runtime->private_data;
++	int rc =3D 0;
++
++	struct cad_stream_device_struct_type cad_stream_dev;
++	struct cad_stream_info_struct_type cad_stream_info;
++	struct cad_write_pcm_format_struct_type cad_write_pcm_fmt;
++	u32 stream_device[1];
++
++	prtd->pcm_size =3D snd_pcm_lib_buffer_bytes(substream);
++	prtd->pcm_count =3D snd_pcm_lib_period_bytes(substream);
++	prtd->pcm_irq_pos =3D 0;
++	prtd->pcm_buf_pos =3D 0;
++
++	cad_stream_info.app_type =3D CAD_STREAM_APP_RECORD;
++	cad_stream_info.priority =3D 0;
++	cad_stream_info.buf_mem_type =3D CAD_STREAM_BUF_MEM_HEAP;
++	cad_stream_info.ses_buf_max_size =3D prtd->pcm_count;
++
++	if (prtd->enabled)
++		return 0;
++
++	mutex_lock(&the_locks.lock);
++	rc =3D cad_ioctl(prtd->cad_w_handle, CAD_IOCTL_CMD_SET_STREAM_INFO,
++		&cad_stream_info,
++		sizeof(struct cad_stream_info_struct_type));
++	if (rc) {
++		mutex_unlock(&the_locks.lock);
++		return rc;
++	}
++
++	stream_device[0] =3D CAD_HW_DEVICE_ID_DEFAULT_TX ;
++	cad_stream_dev.device =3D (u32 *) &stream_device[0];
++	cad_stream_dev.device_len =3D 1;
++
++	rc =3D cad_ioctl(prtd->cad_w_handle, CAD_IOCTL_CMD_SET_STREAM_DEVICE,
++	       &cad_stream_dev,
++	       sizeof(struct cad_stream_device_struct_type));
++	if (rc) {
++		mutex_unlock(&the_locks.lock);
++		return rc;
++	}
++
++	cad_write_pcm_fmt.us_ver_id =3D CAD_WRITE_PCM_VERSION_10;
++	cad_write_pcm_fmt.pcm.us_sample_rate =3D
++	    convert_dsp_samp_index(runtime->rate);
++	cad_write_pcm_fmt.pcm.us_channel_config =3D runtime->channels;
++	cad_write_pcm_fmt.pcm.us_width =3D 1;
++	cad_write_pcm_fmt.pcm.us_sign =3D 0;
++
++	rc =3D cad_ioctl(prtd->cad_w_handle, CAD_IOCTL_CMD_SET_STREAM_CONFIG,
++	       &cad_write_pcm_fmt,
++	       sizeof(struct cad_write_pcm_format_struct_type));
++	if (rc) {
++		mutex_unlock(&the_locks.lock);
++		return rc;
++	}
++	rc =3D cad_ioctl(prtd->cad_w_handle, CAD_IOCTL_CMD_STREAM_START,
++			NULL, 0);
++	mutex_unlock(&the_locks.lock);
++	if (!rc)
++		prtd->enabled =3D 1;
++	return rc;
++}
++
++
++static int qsd_pcm_copy(struct snd_pcm_substream *substream, int a,
++			snd_pcm_uframes_t hwoff, void __user *buf,
++			snd_pcm_uframes_t frames)
++{
++	int ret =3D 0;
++
++	if (substream->stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK)
++		ret =3D qsd_pcm_playback_copy(substream, a, hwoff, buf, frames);
++	else if (substream->stream =3D=3D SNDRV_PCM_STREAM_CAPTURE)
++		ret =3D qsd_pcm_capture_copy(substream, a, hwoff, buf, frames);
++	return ret;
++}
++
++static int qsd_pcm_close(struct snd_pcm_substream *substream)
++{
++	int ret =3D 0;
++
++	if (substream->stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK)
++		ret =3D qsd_pcm_playback_close(substream);
++	else if (substream->stream =3D=3D SNDRV_PCM_STREAM_CAPTURE)
++		ret =3D qsd_pcm_capture_close(substream);
++	return ret;
++}
++static int qsd_pcm_prepare(struct snd_pcm_substream *substream)
++{
++	int ret =3D 0;
++	if (substream->stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK)
++		ret =3D qsd_pcm_playback_prepare(substream);
++	else if (substream->stream =3D=3D SNDRV_PCM_STREAM_CAPTURE)
++		ret =3D qsd_pcm_capture_prepare(substream);
++	return ret;
++}
++
++static snd_pcm_uframes_t qsd_pcm_pointer(struct snd_pcm_substream *substr=
eam)
++{
++	snd_pcm_uframes_t ret =3D 0;
++
++	if (substream->stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK)
++		ret =3D qsd_pcm_playback_pointer(substream);
++	else if (substream->stream =3D=3D SNDRV_PCM_STREAM_CAPTURE)
++		ret =3D qsd_pcm_capture_pointer(substream);
++	return ret;
++}
++
++int qsd_pcm_hw_params(struct snd_pcm_substream *substream,
++		      struct snd_pcm_hw_params *params)
++{
++	struct snd_pcm_runtime *runtime =3D substream->runtime;
++
++	if (substream->pcm->device & 1) {
++		runtime->hw.info &=3D ~SNDRV_PCM_INFO_INTERLEAVED;
++		runtime->hw.info |=3D SNDRV_PCM_INFO_NONINTERLEAVED;
++	}
++	return 0;
++}
++
++struct snd_pcm_ops qsd_pcm_ops =3D {
++	.open =3D qsd_pcm_open,
++	.copy =3D qsd_pcm_copy,
++	.hw_params =3D qsd_pcm_hw_params,
++	.close =3D qsd_pcm_close,
++	.ioctl =3D snd_pcm_lib_ioctl,
++	.prepare =3D qsd_pcm_prepare,
++	.trigger =3D qsd_pcm_trigger,
++	.pointer =3D qsd_pcm_pointer,
++};
++EXPORT_SYMBOL_GPL(qsd_pcm_ops);
++
++static int qsd_pcm_remove(struct platform_device *devptr)
++{
++	struct snd_soc_device *socdev =3D platform_get_drvdata(devptr);
++	snd_soc_free_pcms(socdev);
++	kfree(socdev->codec);
++	platform_set_drvdata(devptr, NULL);
++	return 0;
++}
++
++static int qsd_pcm_new(struct snd_card *card,
++			struct snd_soc_dai *codec_dai,
++			struct snd_pcm *pcm)
++{
++	if (!card->dev->coherent_dma_mask)
++		card->dev->coherent_dma_mask =3D DMA_32BIT_MASK;
++
++	return 0;
++}
++
++struct snd_soc_platform qsd_soc_platform =3D {
++	.name		=3D "qsd-audio",
++	.remove         =3D qsd_pcm_remove,
++	.pcm_ops 	=3D &qsd_pcm_ops,
++	.pcm_new	=3D qsd_pcm_new,
++};
++EXPORT_SYMBOL(qsd_soc_platform);
++
++static int __init qsd_soc_platform_init(void)
++{
++	return snd_soc_register_platform(&qsd_soc_platform);
++}
++module_init(qsd_soc_platform_init);
++
++static void __exit qsd_soc_platform_exit(void)
++{
++	snd_soc_unregister_platform(&qsd_soc_platform);
++}
++module_exit(qsd_soc_platform_exit);
++
++MODULE_DESCRIPTION("PCM module platform driver");
++MODULE_LICENSE("GPL v2");
+diff --git a/sound/soc/msm/qsd8k.c b/sound/soc/msm/qsd8k.c
+new file mode 100644
+index 0000000..979fde7
+--- /dev/null
++++ b/sound/soc/msm/qsd8k.c
+@@ -0,0 +1,382 @@
++/* linux/sound/soc/msm/qsd8k.c
++ *
++ * Copyright (c) 2009, Code Aurora Forum. All rights reserved.
++ *
++ * All source code in this file is licensed under the following license e=
xcept
++ * where indicated.
++ *
++ * This program is free software; you can redistribute it and/or modify i=
t
++ * under the terms of the GNU General Public License version 2 as publish=
ed
++ * by the Free Software Foundation.
++ *
++ * This program is distributed in the hope that it will be useful,
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
++ *
++ * See the GNU General Public License for more details.
++ * You should have received a copy of the GNU General Public License
++ * along with this program; if not, you can find it at http://www.fsf.org=
.
++ */
++
++#include <linux/init.h>
++#include <linux/err.h>
++#include <linux/module.h>
++#include <linux/moduleparam.h>
++#include <linux/time.h>
++#include <linux/wait.h>
++#include <linux/platform_device.h>
++#include <sound/core.h>
++#include <sound/soc.h>
++#include <sound/soc-dapm.h>
++#include <sound/pcm.h>
++#include <sound/initval.h>
++#include <sound/control.h>
++#include <asm/dma.h>
++#include <linux/dma-mapping.h>
++
++#include "qsd-pcm.h"
++
++static struct platform_device *qsd_audio_snd_device;
++
++static int snd_qsd_route_info(struct snd_kcontrol *kcontrol,
++				struct snd_ctl_elem_info *uinfo)
++{
++	uinfo->type =3D SNDRV_CTL_ELEM_TYPE_INTEGER;
++	uinfo->count =3D 1; /* Device */
++	uinfo->value.integer.min =3D CAD_HW_DEVICE_ID_HANDSET_MIC;
++	uinfo->value.integer.max =3D CAD_HW_DEVICE_ID_DEFAULT_RX;
++	return 0;
++}
++
++static int snd_qsd_route_get(struct snd_kcontrol *kcontrol,
++				struct snd_ctl_elem_value *ucontrol)
++{
++	ucontrol->value.integer.value[0] =3D
++			(uint32_t) qsd_glb_ctl.playback_device;
++	ucontrol->value.integer.value[1] =3D
++			(uint32_t) qsd_glb_ctl.capture_device;
++	return 0;
++}
++
++static int snd_get_device_type(int device)
++{
++	switch (device) {
++	case CAD_HW_DEVICE_ID_HANDSET_MIC:
++	case CAD_HW_DEVICE_ID_HEADSET_MIC:
++	case CAD_HW_DEVICE_ID_BT_SCO_MIC:
++	case CAD_HW_DEVICE_ID_DEFAULT_TX:
++		return CAD_TX_DEVICE;
++	case CAD_HW_DEVICE_ID_HANDSET_SPKR:
++	case CAD_HW_DEVICE_ID_HEADSET_SPKR_MONO:
++	case CAD_HW_DEVICE_ID_HEADSET_SPKR_STEREO:
++	case CAD_HW_DEVICE_ID_SPKR_PHONE_MIC:
++	case CAD_HW_DEVICE_ID_SPKR_PHONE_MONO:
++	case CAD_HW_DEVICE_ID_SPKR_PHONE_STEREO:
++	case CAD_HW_DEVICE_ID_BT_SCO_SPKR:
++	case CAD_HW_DEVICE_ID_BT_A2DP_SPKR:
++	case CAD_HW_DEVICE_ID_DEFAULT_RX:
++		return CAD_RX_DEVICE;
++	default:
++		return -ENODEV;
++	}
++}
++
++static int snd_qsd_route_put(struct snd_kcontrol *kcontrol,
++			struct snd_ctl_elem_value *ucontrol)
++{
++	int rc =3D 0;
++	int device, direction;
++
++	device =3D ucontrol->value.integer.value[0];
++	direction =3D snd_get_device_type(device);
++
++	if (direction < 0)
++		return direction;
++
++	rc =3D audio_switch_device(device);
++	if (rc < 0) {
++		printk(KERN_ERR "audio_switch_device  failed\n");
++		return rc;
++	}
++
++	if (CAD_RX_DEVICE =3D=3D direction)
++		qsd_glb_ctl.playback_device =3D device;
++	else /* CAD_TX_DEVICE */
++		qsd_glb_ctl.capture_device =3D device;
++
++	return 0;
++}
++
++static int snd_vol_info(struct snd_kcontrol *kcontrol,
++				struct snd_ctl_elem_info *uinfo)
++{
++	uinfo->type =3D SNDRV_CTL_ELEM_TYPE_INTEGER;
++	uinfo->count =3D 1; /* Volume */
++	uinfo->value.integer.min =3D 0;
++	uinfo->value.integer.max =3D 100;
++	return 0;
++}
++
++static int snd_rx_vol_get(struct snd_kcontrol *kcontrol,
++				struct snd_ctl_elem_value *ucontrol)
++{
++	ucontrol->value.integer.value[0] =3D (uint32_t) qsd_glb_ctl.rx_volume;
++	return 0;
++}
++
++static int snd_rx_vol_put(struct snd_kcontrol *kcontrol,
++			struct snd_ctl_elem_value *ucontrol)
++{
++	struct msm_vol_info vi;
++	int rc =3D 0;
++
++	vi.vol =3D ucontrol->value.integer.value[0];
++	vi.path =3D CAD_RX_DEVICE;
++
++	rc =3D audio_set_device_volume_path(&vi);
++
++	if (rc)
++		printk(KERN_ERR "audio_set_device_volume failed\n");
++	else
++		qsd_glb_ctl.rx_volume =3D ucontrol->value.integer.value[0];
++
++	return rc;
++}
++
++static int snd_tx_vol_get(struct snd_kcontrol *kcontrol,
++				struct snd_ctl_elem_value *ucontrol)
++{
++	ucontrol->value.integer.value[0] =3D (uint32_t) qsd_glb_ctl.tx_volume;
++	return 0;
++}
++
++static int snd_tx_vol_put(struct snd_kcontrol *kcontrol,
++			struct snd_ctl_elem_value *ucontrol)
++{
++	struct msm_vol_info vi;
++	int rc =3D 0;
++
++	vi.vol =3D ucontrol->value.integer.value[0];
++	vi.path =3D CAD_TX_DEVICE;
++
++	rc =3D audio_set_device_volume_path(&vi);
++
++	if (rc)
++		printk(KERN_ERR "audio_set_device_volume failed\n");
++	else
++		qsd_glb_ctl.tx_volume =3D ucontrol->value.integer.value[0];
++
++	return rc;
++}
++
++static int snd_tx_mute_info(struct snd_kcontrol *kcontrol,
++				struct snd_ctl_elem_info *uinfo)
++{
++	uinfo->type =3D SNDRV_CTL_ELEM_TYPE_INTEGER;
++	uinfo->count =3D 1; /* MUTE */
++	uinfo->value.integer.min =3D 0;
++	uinfo->value.integer.max =3D 1;
++	return 0;
++}
++
++static int snd_tx_mute_get(struct snd_kcontrol *kcontrol,
++				struct snd_ctl_elem_value *ucontrol)
++{
++	ucontrol->value.integer.value[0] =3D (uint32_t) qsd_glb_ctl.tx_mute;
++	return 0;
++}
++
++static int snd_tx_mute_put(struct snd_kcontrol *kcontrol,
++			struct snd_ctl_elem_value *ucontrol)
++{
++	int rc =3D 0;
++	struct msm_mute_info m;
++
++	m.path =3D CAD_TX_DEVICE;
++	m.mute =3D ucontrol->value.integer.value[0];
++
++	rc =3D audio_set_device_mute(&m);
++	if (rc)
++		printk(KERN_ERR "Capture device mute failed\n");
++	else
++		qsd_glb_ctl.tx_mute =3D ucontrol->value.integer.value[0];
++	return rc;
++}
++
++static int snd_rx_mute_info(struct snd_kcontrol *kcontrol,
++				struct snd_ctl_elem_info *uinfo)
++{
++	uinfo->type =3D SNDRV_CTL_ELEM_TYPE_INTEGER;
++	uinfo->count =3D 1; /* MUTE */
++	uinfo->value.integer.min =3D 0;
++	uinfo->value.integer.max =3D 1;
++	return 0;
++}
++
++static int snd_rx_mute_get(struct snd_kcontrol *kcontrol,
++				struct snd_ctl_elem_value *ucontrol)
++{
++	ucontrol->value.integer.value[0] =3D (uint32_t) qsd_glb_ctl.rx_mute;
++	return 0;
++}
++
++static int snd_rx_mute_put(struct snd_kcontrol *kcontrol,
++			struct snd_ctl_elem_value *ucontrol)
++{
++	int rc =3D 0;
++	struct msm_mute_info m;
++
++	m.path =3D CAD_RX_DEVICE;
++	m.mute =3D ucontrol->value.integer.value[0];
++
++	rc =3D audio_set_device_mute(&m);
++	if (rc)
++		printk(KERN_ERR "Playback device mute failed\n");
++	else
++		qsd_glb_ctl.rx_mute =3D ucontrol->value.integer.value[0];
++	return rc;
++}
++
++static int snd_strm_vol_info(struct snd_kcontrol *kcontrol,
++				struct snd_ctl_elem_info *uinfo)
++{
++	uinfo->type =3D SNDRV_CTL_ELEM_TYPE_INTEGER;
++	uinfo->count =3D 1; /* Volume Param, in gain */
++	uinfo->value.integer.min =3D CAD_STREAM_MIN_GAIN;
++	uinfo->value.integer.max =3D CAD_STREAM_MAX_GAIN;
++	return 0;
++}
++
++static int snd_strm_vol_get(struct snd_kcontrol *kcontrol,
++				struct snd_ctl_elem_value *ucontrol)
++{
++	ucontrol->value.integer.value[0] =3D qsd_glb_ctl.strm_volume;
++	return 0;
++}
++
++static int snd_strm_vol_put(struct snd_kcontrol *kcontrol,
++				struct snd_ctl_elem_value *ucontrol)
++{
++	int change;
++	int volume;
++
++	if (ucontrol->value.integer.value[0] > CAD_STREAM_MAX_GAIN)
++		ucontrol->value.integer.value[0] =3D CAD_STREAM_MAX_GAIN;
++	if (ucontrol->value.integer.value[0] < CAD_STREAM_MIN_GAIN)
++		ucontrol->value.integer.value[0] =3D CAD_STREAM_MIN_GAIN;
++
++	volume =3D ucontrol->value.integer.value[0];
++	change =3D (qsd_glb_ctl.strm_volume !=3D volume);
++	mutex_lock(&the_locks.mixer_lock);
++	if (change) {
++		qsd_glb_ctl.strm_volume =3D volume;
++		qsd_glb_ctl.update =3D 1;
++	}
++	mutex_unlock(&the_locks.mixer_lock);
++	return 0;
++}
++
++#define QSD_EXT(xname, xindex, fp_info, fp_get, fp_put, addr) \
++{ .iface =3D SNDRV_CTL_ELEM_IFACE_MIXER, \
++  .access =3D SNDRV_CTL_ELEM_ACCESS_READWRITE, \
++  .name =3D xname, .index =3D xindex, \
++  .info =3D fp_info,\
++  .get =3D fp_get, .put =3D fp_put, \
++  .private_value =3D addr, \
++}
++
++static struct snd_kcontrol_new snd_qsd_controls[] =3D {
++	QSD_EXT("Master Route", 1, snd_qsd_route_info, \
++			 snd_qsd_route_get, snd_qsd_route_put, 0),
++	QSD_EXT("Master Volume Playback", 2, snd_vol_info, \
++			 snd_rx_vol_get, snd_rx_vol_put, 0),
++	QSD_EXT("Master Volume Capture", 3, snd_vol_info, \
++			 snd_tx_vol_get, snd_tx_vol_put, 0),
++	QSD_EXT("Master Mute Playback", 4, snd_rx_mute_info, \
++			 snd_rx_mute_get, snd_rx_mute_put, 0),
++	QSD_EXT("Master Mute Capture", 5, snd_tx_mute_info, \
++			 snd_tx_mute_get, snd_tx_mute_put, 0),
++	QSD_EXT("Stream Volume", 6, snd_strm_vol_info, \
++			 snd_strm_vol_get, snd_strm_vol_put, 0),
++};
++
++static int qsd_new_mixer(struct snd_card *card)
++{
++	unsigned int idx;
++	int err;
++
++	strcpy(card->mixername, "MSM Mixer");
++	for (idx =3D 0; idx < ARRAY_SIZE(snd_qsd_controls); idx++) {
++		err =3D snd_ctl_add(card,
++				snd_ctl_new1(&snd_qsd_controls[idx], NULL));
++		if (err < 0)
++			return err;
++	}
++	return 0;
++}
++
++static int qsd_soc_dai_init(struct snd_soc_codec *codec)
++{
++
++	int ret =3D 0;
++	ret =3D qsd_new_mixer(codec->card);
++	if (ret < 0) {
++		printk(KERN_ERR "msm_soc:ALSA MSM Mixer Fail");
++	}
++
++	return ret;
++}
++
++static struct snd_soc_dai_link qsd_dai =3D {
++	.name =3D "ASOC",
++	.stream_name =3D "ASOC",
++	.codec_dai =3D &msm_dais[0],
++	.cpu_dai =3D &msm_dais[1],
++	.init   =3D qsd_soc_dai_init,
++};
++
++struct snd_soc_card snd_soc_card_qsd =3D {
++	.name 		=3D "qsd-audio",
++	.dai_link	=3D &qsd_dai,
++	.num_links 	=3D 1,
++	.platform =3D &qsd_soc_platform,
++};
++
++/* qsd_audio audio subsystem */
++static struct snd_soc_device qsd_audio_snd_devdata =3D {
++	.card =3D &snd_soc_card_qsd,
++	.codec_dev =3D &soc_codec_dev_msm,
++};
++
++static int __init qsd_audio_init(void)
++{
++	int ret;
++
++	qsd_audio_snd_device =3D platform_device_alloc("soc-audio", -1);
++	if (!qsd_audio_snd_device)
++		return -ENOMEM;
++
++	platform_set_drvdata(qsd_audio_snd_device, &qsd_audio_snd_devdata);
++	qsd_audio_snd_devdata.dev =3D &qsd_audio_snd_device->dev;
++	ret =3D platform_device_add(qsd_audio_snd_device);
++	if (ret) {
++		platform_device_put(qsd_audio_snd_device);
++		return ret;
++	}
++	mutex_init(&the_locks.lock);
++	mutex_init(&the_locks.mixer_lock);
++
++	return ret;
++}
++
++static void __exit qsd_audio_exit(void)
++{
++	kfree(qsd_audio_snd_devdata.codec_dev);
++	platform_device_unregister(qsd_audio_snd_device);
++}
++
++module_init(qsd_audio_init);
++module_exit(qsd_audio_exit);
++
++MODULE_DESCRIPTION("PCM module");
++MODULE_LICENSE("GPL v2");
diff --git a/recipes/linux/linux-replicant/htcdream/msm_wifi.patch b/recipe=
s/linux/linux-replicant/htcdream/msm_wifi.patch
new file mode 100644
index 0000000..d172e10
--- /dev/null
+++ b/recipes/linux/linux-replicant/htcdream/msm_wifi.patch
@@ -0,0 +1,136 @@
+From a96d158a5e2e8d0f6dc73e0d5ae90c6c02b78fef Mon Sep 17 00:00:00 2001
+From: Bob Copeland <me@bobcopeland.com>
+Date: Sun, 7 Jun 2009 16:31:23 -0400
+Subject: [PATCH] msm: add platform driver for sdio-based wifi
+
+Add a platform device driver for the msm_wifi platform device.  The
+driver initializes the gpios to power the device for subsequent
+probing by the SDIO bus.
+
+Signed-off-by: Bob Copeland <me@bobcopeland.com>
+---
+ arch/arm/mach-msm/Kconfig    |    5 ++
+ arch/arm/mach-msm/Makefile   |    2 +
+ arch/arm/mach-msm/msm_wifi.c |   84 +++++++++++++++++++++++++++++++++++++=
+++++
+ 3 files changed, 91 insertions(+), 0 deletions(-)
+ create mode 100644 arch/arm/mach-msm/msm_wifi.c
+
+diff --git a/arch/arm/mach-msm/Kconfig b/arch/arm/mach-msm/Kconfig
+index 176cb73..74be8cd 100644
+--- a/arch/arm/mach-msm/Kconfig
++++ b/arch/arm/mach-msm/Kconfig
+@@ -78,6 +78,11 @@ config TROUT_BATTCHG
+ 	default y
+ 	bool "Trout battery / charger driver"
+=20
++config TROUT_WIFI
++	depends on ARCH_MSM
++	default m
++	tristate "Trout Wifi Gpio driver (rfkill)"
++
+ config HTC_PWRSINK
+ 	depends on MSM_SMD
+ 	default y
+diff --git a/arch/arm/mach-msm/Makefile b/arch/arm/mach-msm/Makefile
+index 9371f99..fb9954a 100644
+--- a/arch/arm/mach-msm/Makefile
++++ b/arch/arm/mach-msm/Makefile
+@@ -36,3 +36,5 @@ obj-$(CONFIG_TROUT_BATTCHG) +=3D htc_battery.o
+=20
+ obj-$(CONFIG_HTC_PWRSINK) +=3D htc_pwrsink.o
+ obj-$(CONFIG_HTC_HEADSET) +=3D htc_headset.o
++
++obj-$(CONFIG_TROUT_WIFI) +=3D msm_wifi.o
+diff --git a/arch/arm/mach-msm/msm_wifi.c b/arch/arm/mach-msm/msm_wifi.c
+new file mode 100644
+index 0000000..501ed45
+--- /dev/null
++++ b/arch/arm/mach-msm/msm_wifi.c
+@@ -0,0 +1,84 @@
++/*
++ * platform driver for msm_wifi device
++ *
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License version 2 as
++ * published by the Free Software Foundation.
++ *
++ * This program is distributed in the hope that it will be useful, but
++ * WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++ * General Public License for more details.
++ *
++ * You should have received a copy of the GNU General Public License
++ * along with this program; if not, write to the Free Software
++ * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA
++ * 02110-1301 USA
++ *
++ * Copyright (C) 2008 Google Inc
++ */
++#include <linux/platform_device.h>
++#include <linux/wifi_tiwlan.h>
++
++static int wifi_probe(struct platform_device *pdev)
++{
++	struct wifi_platform_data *wifi_ctrl =3D
++		(struct wifi_platform_data *)(pdev->dev.platform_data);
++
++	printk(KERN_DEBUG "wifi probe start\n");
++
++	if (!wifi_ctrl)
++		return -ENODEV;
++
++	if (wifi_ctrl->set_power)
++		wifi_ctrl->set_power(1);	/* Power On */
++	if (wifi_ctrl->set_reset)
++		wifi_ctrl->set_reset(0);	/* Reset clear */
++	if (wifi_ctrl->set_carddetect)
++		wifi_ctrl->set_carddetect(1);	/* CardDetect (0->1) */
++
++	printk(KERN_DEBUG "wifi probe done\n");
++	return 0;
++}
++
++static int wifi_remove(struct platform_device *pdev)
++{
++	struct wifi_platform_data *wifi_ctrl =3D
++		(struct wifi_platform_data *)(pdev->dev.platform_data);
++
++	printk(KERN_DEBUG "wifi remove start\n");
++	if (!wifi_ctrl)
++		return -ENODEV;
++
++	if (wifi_ctrl->set_carddetect)
++		wifi_ctrl->set_carddetect(0);	/* CardDetect (1->0) */
++	if (wifi_ctrl->set_reset)
++		wifi_ctrl->set_reset(1);	/* Reset active */
++	if (wifi_ctrl->set_power)
++		wifi_ctrl->set_power(0);	/* Power Off */
++
++	printk(KERN_DEBUG "wifi remove end\n");
++	return 0;
++}
++
++static struct platform_driver wifi_device =3D {
++	.probe		=3D wifi_probe,
++	.remove		=3D wifi_remove,
++	.driver		=3D {
++		.name   =3D "msm_wifi",
++	},
++};
++
++static int __init msm_wifi_sdio_init(void)
++{
++	return platform_driver_register(&wifi_device);
++}
++
++static void __exit msm_wifi_sdio_exit(void)
++{
++	platform_driver_unregister(&wifi_device);
++}
++
++module_init(msm_wifi_sdio_init);
++module_exit(msm_wifi_sdio_exit);
++MODULE_LICENSE("GPL");
+--=20
+1.6.2.5
+
diff --git a/recipes/linux/linux-replicant/htckaiser/defconfig b/recipes/li=
nux/linux-replicant/htckaiser/defconfig
new file mode 100644
index 0000000..c1f3084
--- /dev/null
+++ b/recipes/linux/linux-replicant/htckaiser/defconfig
@@ -0,0 +1,1026 @@
+#
+# Automatically generated make config: don't edit
+# Linux kernel version: 2.6.25
+# Thu Apr  9 20:12:53 2009
+#
+CONFIG_ARM=3Dy
+CONFIG_SYS_SUPPORTS_APM_EMULATION=3Dy
+# CONFIG_GENERIC_GPIO is not set
+CONFIG_GENERIC_TIME=3Dy
+CONFIG_GENERIC_CLOCKEVENTS=3Dy
+CONFIG_MMU=3Dy
+# CONFIG_NO_IOPORT is not set
+CONFIG_GENERIC_HARDIRQS=3Dy
+CONFIG_STACKTRACE_SUPPORT=3Dy
+CONFIG_HAVE_LATENCYTOP_SUPPORT=3Dy
+CONFIG_LOCKDEP_SUPPORT=3Dy
+CONFIG_TRACE_IRQFLAGS_SUPPORT=3Dy
+CONFIG_HARDIRQS_SW_RESEND=3Dy
+CONFIG_GENERIC_IRQ_PROBE=3Dy
+CONFIG_RWSEM_GENERIC_SPINLOCK=3Dy
+# CONFIG_ARCH_HAS_ILOG2_U32 is not set
+# CONFIG_ARCH_HAS_ILOG2_U64 is not set
+CONFIG_GENERIC_HWEIGHT=3Dy
+CONFIG_GENERIC_CALIBRATE_DELAY=3Dy
+CONFIG_ARCH_SUPPORTS_AOUT=3Dy
+CONFIG_ZONE_DMA=3Dy
+CONFIG_VECTORS_BASE=3D0xffff0000
+CONFIG_DEFCONFIG_LIST=3D"/lib/modules/$UNAME_RELEASE/.config"
+
+#
+# General setup
+#
+CONFIG_EXPERIMENTAL=3Dy
+CONFIG_BROKEN_ON_SMP=3Dy
+CONFIG_LOCK_KERNEL=3Dy
+CONFIG_INIT_ENV_ARG_LIMIT=3D32
+CONFIG_LOCALVERSION=3D""
+CONFIG_LOCALVERSION_AUTO=3Dy
+CONFIG_SWAP=3Dy
+# CONFIG_SYSVIPC is not set
+# CONFIG_POSIX_MQUEUE is not set
+# CONFIG_BSD_PROCESS_ACCT is not set
+# CONFIG_TASKSTATS is not set
+# CONFIG_AUDIT is not set
+CONFIG_IKCONFIG=3Dy
+CONFIG_IKCONFIG_PROC=3Dy
+CONFIG_LOG_BUF_SHIFT=3D17
+# CONFIG_CGROUPS is not set
+# CONFIG_GROUP_SCHED is not set
+CONFIG_SYSFS_DEPRECATED=3Dy
+CONFIG_SYSFS_DEPRECATED_V2=3Dy
+# CONFIG_RELAY is not set
+# CONFIG_NAMESPACES is not set
+CONFIG_BLK_DEV_INITRD=3Dy
+CONFIG_INITRAMFS_SOURCE=3D""
+CONFIG_CC_OPTIMIZE_FOR_SIZE=3Dy
+CONFIG_SYSCTL=3Dy
+CONFIG_PANIC_TIMEOUT=3D3
+CONFIG_EMBEDDED=3Dy
+CONFIG_UID16=3Dy
+CONFIG_SYSCTL_SYSCALL=3Dy
+CONFIG_KALLSYMS=3Dy
+# CONFIG_KALLSYMS_ALL is not set
+# CONFIG_KALLSYMS_EXTRA_PASS is not set
+CONFIG_HOTPLUG=3Dy
+CONFIG_PRINTK=3Dy
+CONFIG_BUG=3Dy
+CONFIG_ELF_CORE=3Dy
+CONFIG_COMPAT_BRK=3Dy
+CONFIG_BASE_FULL=3Dy
+CONFIG_FUTEX=3Dy
+CONFIG_ANON_INODES=3Dy
+CONFIG_EPOLL=3Dy
+CONFIG_SIGNALFD=3Dy
+CONFIG_TIMERFD=3Dy
+CONFIG_EVENTFD=3Dy
+CONFIG_SHMEM=3Dy
+CONFIG_ASHMEM=3Dy
+CONFIG_VM_EVENT_COUNTERS=3Dy
+CONFIG_SLAB=3Dy
+# CONFIG_SLUB is not set
+# CONFIG_SLOB is not set
+# CONFIG_PROFILING is not set
+# CONFIG_MARKERS is not set
+CONFIG_HAVE_OPROFILE=3Dy
+# CONFIG_KPROBES is not set
+CONFIG_HAVE_KPROBES=3Dy
+CONFIG_HAVE_KRETPROBES=3Dy
+CONFIG_PROC_PAGE_MONITOR=3Dy
+CONFIG_SLABINFO=3Dy
+CONFIG_RT_MUTEXES=3Dy
+# CONFIG_TINY_SHMEM is not set
+CONFIG_BASE_SMALL=3D0
+CONFIG_MODULES=3Dy
+CONFIG_MODULE_UNLOAD=3Dy
+CONFIG_MODULE_FORCE_UNLOAD=3Dy
+# CONFIG_MODVERSIONS is not set
+# CONFIG_MODULE_SRCVERSION_ALL is not set
+# CONFIG_KMOD is not set
+CONFIG_BLOCK=3Dy
+# CONFIG_LBD is not set
+# CONFIG_BLK_DEV_IO_TRACE is not set
+# CONFIG_LSF is not set
+# CONFIG_BLK_DEV_BSG is not set
+
+#
+# IO Schedulers
+#
+CONFIG_IOSCHED_NOOP=3Dy
+CONFIG_IOSCHED_AS=3Dy
+# CONFIG_IOSCHED_DEADLINE is not set
+# CONFIG_IOSCHED_CFQ is not set
+CONFIG_DEFAULT_AS=3Dy
+# CONFIG_DEFAULT_DEADLINE is not set
+# CONFIG_DEFAULT_CFQ is not set
+# CONFIG_DEFAULT_NOOP is not set
+CONFIG_DEFAULT_IOSCHED=3D"anticipatory"
+CONFIG_CLASSIC_RCU=3Dy
+
+#
+# System Type
+#
+# CONFIG_ARCH_AAEC2000 is not set
+# CONFIG_ARCH_GOLDFISH is not set
+# CONFIG_ARCH_INTEGRATOR is not set
+# CONFIG_ARCH_REALVIEW is not set
+# CONFIG_ARCH_VERSATILE is not set
+# CONFIG_ARCH_AT91 is not set
+# CONFIG_ARCH_CLPS7500 is not set
+# CONFIG_ARCH_CLPS711X is not set
+# CONFIG_ARCH_CO285 is not set
+# CONFIG_ARCH_EBSA110 is not set
+# CONFIG_ARCH_EP93XX is not set
+# CONFIG_ARCH_FOOTBRIDGE is not set
+# CONFIG_ARCH_NETX is not set
+# CONFIG_ARCH_H720X is not set
+# CONFIG_ARCH_IMX is not set
+# CONFIG_ARCH_IOP13XX is not set
+# CONFIG_ARCH_IOP32X is not set
+# CONFIG_ARCH_IOP33X is not set
+# CONFIG_ARCH_IXP23XX is not set
+# CONFIG_ARCH_IXP2000 is not set
+# CONFIG_ARCH_IXP4XX is not set
+# CONFIG_ARCH_L7200 is not set
+# CONFIG_ARCH_KS8695 is not set
+# CONFIG_ARCH_NS9XXX is not set
+# CONFIG_ARCH_MXC is not set
+# CONFIG_ARCH_ORION is not set
+# CONFIG_ARCH_PNX4008 is not set
+# CONFIG_ARCH_PXA is not set
+# CONFIG_ARCH_RPC is not set
+# CONFIG_ARCH_SA1100 is not set
+# CONFIG_ARCH_S3C2410 is not set
+# CONFIG_ARCH_SHARK is not set
+# CONFIG_ARCH_LH7A40X is not set
+# CONFIG_ARCH_DAVINCI is not set
+# CONFIG_ARCH_OMAP is not set
+CONFIG_ARCH_MSM7X00A=3Dy
+
+#
+# Boot options
+#
+
+#
+# Power management
+#
+CONFIG_MSM_AMSS_VERSION=3D6210
+CONFIG_MSM_AMSS_VERSION_6210=3Dy
+# CONFIG_MSM_AMSS_VERSION_6220 is not set
+# CONFIG_MSM_AMSS_VERSION_6225 is not set
+# CONFIG_MACH_HALIBUT is not set
+CONFIG_MACH_HTCVOGUE=3Dy
+CONFIG_MACH_HTCKAISER=3Dy
+CONFIG_MACH_HTCPOLARIS=3Dy
+CONFIG_MACH_HTCNIKE=3Dy
+CONFIG_MACH_HTCTITAN=3Dy
+CONFIG_VOGUE_TS=3Dy
+CONFIG_MSM_VOGUESMD=3Dy
+# CONFIG_MSM_LL_DEBUG_UART1 is not set
+# CONFIG_MSM_LL_DEBUG_UART2 is not set
+# CONFIG_MSM_LL_DEBUG_UART3 is not set
+CONFIG_MSM_LL_DEBUG_NONE=3Dy
+CONFIG_MSM7X00A_IDLE=3Dy
+CONFIG_MSM7X00A_USE_GP_TIMER=3Dy
+# CONFIG_MSM7X00A_USE_DG_TIMER is not set
+# CONFIG_MSM7X00A_SLEEP_MODE_POWER_COLLAPSE_SUSPEND is not set
+CONFIG_MSM7X00A_SLEEP_MODE_POWER_COLLAPSE=3Dy
+# CONFIG_MSM7X00A_SLEEP_MODE_APPS_SLEEP is not set
+# CONFIG_MSM7X00A_SLEEP_MODE_RAMP_DOWN_AND_WAIT_FOR_INTERRUPT is not set
+# CONFIG_MSM7X00A_SLEEP_WAIT_FOR_INTERRUPT is not set
+CONFIG_MSM7X00A_SLEEP_MODE=3D1
+# CONFIG_MSM7X00A_IDLE_SLEEP_MODE_POWER_COLLAPSE_SUSPEND is not set
+# CONFIG_MSM7X00A_IDLE_SLEEP_MODE_POWER_COLLAPSE is not set
+# CONFIG_MSM7X00A_IDLE_SLEEP_MODE_APPS_SLEEP is not set
+CONFIG_MSM7X00A_IDLE_SLEEP_MODE_RAMP_DOWN_AND_WAIT_FOR_INTERRUPT=3Dy
+# CONFIG_MSM7X00A_IDLE_SLEEP_WAIT_FOR_INTERRUPT is not set
+CONFIG_MSM7X00A_IDLE_SLEEP_MODE=3D3
+CONFIG_MSM7X00A_IDLE_SLEEP_MIN_TIME=3D20000000
+CONFIG_MSM7X00A_IDLE_SPIN_TIME=3D80000
+# CONFIG_MSM_IDLE_STATS is not set
+# CONFIG_MSM_FIQ_SUPPORT is not set
+# CONFIG_MSM_SERIAL_DEBUGGER is not set
+# CONFIG_MSM_SMD is not set
+# CONFIG_MSM_ONCRPCROUTER is not set
+# CONFIG_MSM_HW3D is not set
+CONFIG_MSM_ADSP=3Dy
+# CONFIG_MSM_PERF is not set
+
+#
+# Processor Type
+#
+CONFIG_CPU_32=3Dy
+CONFIG_CPU_V6=3Dy
+# CONFIG_CPU_32v6K is not set
+CONFIG_CPU_32v6=3Dy
+CONFIG_CPU_ABRT_EV6=3Dy
+CONFIG_CPU_CACHE_V6=3Dy
+CONFIG_CPU_CACHE_VIPT=3Dy
+CONFIG_CPU_COPY_V6=3Dy
+CONFIG_CPU_TLB_V6=3Dy
+CONFIG_CPU_HAS_ASID=3Dy
+CONFIG_CPU_CP15=3Dy
+CONFIG_CPU_CP15_MMU=3Dy
+
+#
+# Processor Features
+#
+CONFIG_ARM_THUMB=3Dy
+# CONFIG_CPU_ICACHE_DISABLE is not set
+# CONFIG_CPU_DCACHE_DISABLE is not set
+# CONFIG_CPU_BPREDICT_DISABLE is not set
+# CONFIG_OUTER_CACHE is not set
+
+#
+# Bus support
+#
+# CONFIG_PCI_SYSCALL is not set
+# CONFIG_ARCH_SUPPORTS_MSI is not set
+# CONFIG_PCCARD is not set
+
+#
+# Kernel Features
+#
+CONFIG_TICK_ONESHOT=3Dy
+CONFIG_NO_HZ=3Dy
+CONFIG_HIGH_RES_TIMERS=3Dy
+CONFIG_GENERIC_CLOCKEVENTS_BUILD=3Dy
+CONFIG_PREEMPT=3Dy
+CONFIG_HZ=3D100
+CONFIG_AEABI=3Dy
+# CONFIG_OABI_COMPAT is not set
+# CONFIG_ARCH_DISCONTIGMEM_ENABLE is not set
+CONFIG_SELECT_MEMORY_MODEL=3Dy
+CONFIG_FLATMEM_MANUAL=3Dy
+# CONFIG_DISCONTIGMEM_MANUAL is not set
+# CONFIG_SPARSEMEM_MANUAL is not set
+CONFIG_FLATMEM=3Dy
+CONFIG_FLAT_NODE_MEM_MAP=3Dy
+# CONFIG_SPARSEMEM_STATIC is not set
+# CONFIG_SPARSEMEM_VMEMMAP_ENABLE is not set
+CONFIG_SPLIT_PTLOCK_CPUS=3D4
+CONFIG_RESOURCES_64BIT=3Dy
+CONFIG_ZONE_DMA_FLAG=3D1
+CONFIG_BOUNCE=3Dy
+CONFIG_VIRT_TO_BUS=3Dy
+CONFIG_ALIGNMENT_TRAP=3Dy
+
+#
+# Boot options
+#
+CONFIG_ZBOOT_ROM_TEXT=3D0x0
+CONFIG_ZBOOT_ROM_BSS=3D0x0
+CONFIG_CMDLINE=3D""
+# CONFIG_XIP_KERNEL is not set
+# CONFIG_KEXEC is not set
+
+#
+# CPU Frequency scaling
+#
+# CONFIG_CPU_FREQ is not set
+
+#
+# Floating point emulation
+#
+
+#
+# At least one emulation must be selected
+#
+# CONFIG_VFP is not set
+
+#
+# Userspace binary formats
+#
+CONFIG_BINFMT_ELF=3Dy
+# CONFIG_BINFMT_AOUT is not set
+# CONFIG_BINFMT_MISC is not set
+
+#
+# Power management options
+#
+CONFIG_PM=3Dy
+# CONFIG_PM_LEGACY is not set
+# CONFIG_PM_DEBUG is not set
+CONFIG_PM_SLEEP=3Dy
+CONFIG_SUSPEND=3Dy
+CONFIG_SUSPEND_FREEZER=3Dy
+# CONFIG_APM_EMULATION is not set
+CONFIG_ARCH_SUSPEND_POSSIBLE=3Dy
+
+#
+# Networking
+#
+CONFIG_NET=3Dy
+
+#
+# Networking options
+#
+CONFIG_PACKET=3Dy
+# CONFIG_PACKET_MMAP is not set
+CONFIG_UNIX=3Dy
+# CONFIG_NET_KEY is not set
+CONFIG_INET=3Dy
+# CONFIG_IP_MULTICAST is not set
+# CONFIG_IP_ADVANCED_ROUTER is not set
+CONFIG_IP_FIB_HASH=3Dy
+# CONFIG_IP_PNP is not set
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
+# CONFIG_TCP_CONG_ADVANCED is not set
+CONFIG_TCP_CONG_CUBIC=3Dy
+CONFIG_DEFAULT_TCP_CONG=3D"cubic"
+# CONFIG_TCP_MD5SIG is not set
+# CONFIG_IPV6 is not set
+# CONFIG_INET6_XFRM_TUNNEL is not set
+# CONFIG_INET6_TUNNEL is not set
+# CONFIG_NETWORK_SECMARK is not set
+# CONFIG_NETFILTER is not set
+# CONFIG_IP_DCCP is not set
+# CONFIG_IP_SCTP is not set
+# CONFIG_TIPC is not set
+# CONFIG_ATM is not set
+# CONFIG_BRIDGE is not set
+# CONFIG_VLAN_8021Q is not set
+# CONFIG_DECNET is not set
+# CONFIG_LLC2 is not set
+# CONFIG_IPX is not set
+# CONFIG_ATALK is not set
+# CONFIG_X25 is not set
+# CONFIG_LAPB is not set
+# CONFIG_ECONET is not set
+# CONFIG_WAN_ROUTER is not set
+# CONFIG_NET_SCHED is not set
+
+#
+# Network testing
+#
+# CONFIG_NET_PKTGEN is not set
+# CONFIG_HAMRADIO is not set
+# CONFIG_CAN is not set
+# CONFIG_IRDA is not set
+CONFIG_BT=3Dy
+# CONFIG_BT_L2CAP is not set
+# CONFIG_BT_SCO is not set
+
+#
+# Bluetooth device drivers
+#
+# CONFIG_BT_HCIBTSDIO is not set
+CONFIG_BT_HCIUART=3Dy
+CONFIG_BT_HCIUART_H4=3Dy
+# CONFIG_BT_HCIUART_BCSP is not set
+CONFIG_BT_HCIUART_LL=3Dy
+CONFIG_BT_HCIUART_LL_USE_MSM_SERIAL_CLOCK_CONTROL=3Dy
+# CONFIG_BT_HCIVHCI is not set
+# CONFIG_AF_RXRPC is not set
+
+#
+# Wireless
+#
+# CONFIG_CFG80211 is not set
+# CONFIG_WIRELESS_EXT is not set
+# CONFIG_MAC80211 is not set
+# CONFIG_IEEE80211 is not set
+CONFIG_RFKILL=3Dy
+# CONFIG_RFKILL_INPUT is not set
+CONFIG_RFKILL_LEDS=3Dy
+# CONFIG_NET_9P is not set
+
+#
+# Device Drivers
+#
+
+#
+# Generic Driver Options
+#
+CONFIG_UEVENT_HELPER_PATH=3D""
+CONFIG_STANDALONE=3Dy
+CONFIG_PREVENT_FIRMWARE_BUILD=3Dy
+CONFIG_FW_LOADER=3Dy
+# CONFIG_DEBUG_DRIVER is not set
+# CONFIG_DEBUG_DEVRES is not set
+# CONFIG_SYS_HYPERVISOR is not set
+# CONFIG_CONNECTOR is not set
+# CONFIG_MTD is not set
+# CONFIG_PARPORT is not set
+CONFIG_BLK_DEV=3Dy
+# CONFIG_BLK_DEV_COW_COMMON is not set
+CONFIG_BLK_DEV_LOOP=3Dy
+# CONFIG_BLK_DEV_CRYPTOLOOP is not set
+# CONFIG_BLK_DEV_NBD is not set
+# CONFIG_BLK_DEV_RAM is not set
+# CONFIG_CDROM_PKTCDVD is not set
+# CONFIG_ATA_OVER_ETH is not set
+CONFIG_MISC_DEVICES=3Dy
+# CONFIG_EEPROM_93CX6 is not set
+CONFIG_LOW_MEMORY_KILLER=3Dy
+CONFIG_KERNEL_DEBUGGER_CORE=3Dy
+# CONFIG_ENCLOSURE_SERVICES is not set
+# CONFIG_HAVE_IDE is not set
+
+#
+# SCSI device support
+#
+# CONFIG_RAID_ATTRS is not set
+# CONFIG_SCSI is not set
+# CONFIG_SCSI_DMA is not set
+# CONFIG_SCSI_NETLINK is not set
+# CONFIG_ATA is not set
+# CONFIG_MD is not set
+CONFIG_NETDEVICES=3Dy
+# CONFIG_NETDEVICES_MULTIQUEUE is not set
+CONFIG_DUMMY=3Dy
+# CONFIG_BONDING is not set
+# CONFIG_MACVLAN is not set
+# CONFIG_EQUALIZER is not set
+# CONFIG_TUN is not set
+# CONFIG_VETH is not set
+# CONFIG_PHYLIB is not set
+CONFIG_NET_ETHERNET=3Dy
+CONFIG_MII=3Dy
+# CONFIG_AX88796 is not set
+# CONFIG_SMC91X is not set
+# CONFIG_DM9000 is not set
+# CONFIG_IBM_NEW_EMAC_ZMII is not set
+# CONFIG_IBM_NEW_EMAC_RGMII is not set
+# CONFIG_IBM_NEW_EMAC_TAH is not set
+# CONFIG_IBM_NEW_EMAC_EMAC4 is not set
+# CONFIG_B44 is not set
+CONFIG_NETDEV_1000=3Dy
+# CONFIG_E1000E_ENABLED is not set
+CONFIG_NETDEV_10000=3Dy
+
+#
+# Wireless LAN
+#
+# CONFIG_WLAN_PRE80211 is not set
+# CONFIG_WLAN_80211 is not set
+# CONFIG_WAN is not set
+CONFIG_PPP=3Dy
+# CONFIG_PPP_MULTILINK is not set
+# CONFIG_PPP_FILTER is not set
+CONFIG_PPP_ASYNC=3Dy
+# CONFIG_PPP_SYNC_TTY is not set
+CONFIG_PPP_DEFLATE=3Dy
+CONFIG_PPP_BSDCOMP=3Dy
+# CONFIG_PPP_MPPE is not set
+# CONFIG_PPPOE is not set
+# CONFIG_PPPOL2TP is not set
+# CONFIG_SLIP is not set
+CONFIG_SLHC=3Dy
+# CONFIG_NETCONSOLE is not set
+# CONFIG_MSM_RMNET is not set
+# CONFIG_NETPOLL is not set
+# CONFIG_NET_POLL_CONTROLLER is not set
+# CONFIG_ISDN is not set
+
+#
+# Input device support
+#
+CONFIG_INPUT=3Dy
+# CONFIG_INPUT_FF_MEMLESS is not set
+# CONFIG_INPUT_POLLDEV is not set
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
+# CONFIG_KEYBOARD_ATKBD is not set
+# CONFIG_KEYBOARD_SUNKBD is not set
+# CONFIG_KEYBOARD_LKKBD is not set
+# CONFIG_KEYBOARD_XTKBD is not set
+# CONFIG_KEYBOARD_NEWTON is not set
+# CONFIG_KEYBOARD_STOWAWAY is not set
+# CONFIG_KEYBOARD_GOLDFISH_EVENTS is not set
+# CONFIG_INPUT_MOUSE is not set
+# CONFIG_INPUT_JOYSTICK is not set
+# CONFIG_INPUT_TABLET is not set
+# CONFIG_INPUT_TOUCHSCREEN is not set
+CONFIG_INPUT_MISC=3Dy
+# CONFIG_INPUT_ATI_REMOTE is not set
+# CONFIG_INPUT_ATI_REMOTE2 is not set
+# CONFIG_INPUT_KEYSPAN_REMOTE is not set
+# CONFIG_INPUT_POWERMATE is not set
+# CONFIG_INPUT_YEALINK is not set
+# CONFIG_INPUT_UINPUT is not set
+CONFIG_INPUT_GPIO=3Dy
+
+#
+# Hardware I/O ports
+#
+# CONFIG_SERIO is not set
+# CONFIG_GAMEPORT is not set
+
+#
+# Character devices
+#
+CONFIG_VT=3Dy
+CONFIG_VT_CONSOLE=3Dy
+CONFIG_HW_CONSOLE=3Dy
+CONFIG_VT_HW_CONSOLE_BINDING=3Dy
+# CONFIG_SERIAL_NONSTANDARD is not set
+
+#
+# Serial drivers
+#
+# CONFIG_SERIAL_8250 is not set
+
+#
+# Non-8250 serial port support
+#
+CONFIG_SERIAL_CORE=3Dy
+CONFIG_SERIAL_CORE_CONSOLE=3Dy
+CONFIG_SERIAL_MSM=3Dy
+CONFIG_SERIAL_MSM_CONSOLE=3Dy
+CONFIG_SERIAL_MSM_CLOCK_CONTROL=3Dy
+CONFIG_SERIAL_MSM_RX_WAKEUP=3Dy
+CONFIG_UNIX98_PTYS=3Dy
+# CONFIG_LEGACY_PTYS is not set
+# CONFIG_IPMI_HANDLER is not set
+# CONFIG_HW_RANDOM is not set
+# CONFIG_NVRAM is not set
+# CONFIG_R3964 is not set
+# CONFIG_RAW_DRIVER is not set
+# CONFIG_TCG_TPM is not set
+CONFIG_DEVMEM=3Dy
+# CONFIG_GOLDFISH_TTY is not set
+# CONFIG_DCC_TTY is not set
+CONFIG_I2C=3Dy
+CONFIG_I2C_BOARDINFO=3Dy
+# CONFIG_I2C_CHARDEV is not set
+
+#
+# I2C Algorithms
+#
+# CONFIG_I2C_ALGOBIT is not set
+# CONFIG_I2C_ALGOPCF is not set
+# CONFIG_I2C_ALGOPCA is not set
+
+#
+# I2C Hardware Bus support
+#
+CONFIG_I2C_MSM=3Dy
+# CONFIG_I2C_OCORES is not set
+# CONFIG_I2C_PARPORT_LIGHT is not set
+# CONFIG_I2C_SIMTEC is not set
+# CONFIG_I2C_TAOS_EVM is not set
+# CONFIG_I2C_STUB is not set
+
+#
+# Miscellaneous I2C Chip support
+#
+# CONFIG_DS1682 is not set
+# CONFIG_SENSORS_EEPROM is not set
+# CONFIG_SENSORS_PCF8574 is not set
+# CONFIG_PCF8575 is not set
+# CONFIG_SENSORS_PCF8591 is not set
+# CONFIG_TPS65010 is not set
+# CONFIG_SENSORS_MAX6875 is not set
+# CONFIG_SENSORS_TSL2550 is not set
+CONFIG_S5K4B1FX=3Dy
+# CONFIG_I2C_DEBUG_CORE is not set
+# CONFIG_I2C_DEBUG_ALGO is not set
+# CONFIG_I2C_DEBUG_BUS is not set
+# CONFIG_I2C_DEBUG_CHIP is not set
+
+#
+# SPI support
+#
+# CONFIG_SPI is not set
+# CONFIG_SPI_MASTER is not set
+# CONFIG_W1 is not set
+CONFIG_POWER_SUPPLY=3Dy
+# CONFIG_POWER_SUPPLY_DEBUG is not set
+# CONFIG_PDA_POWER is not set
+# CONFIG_BATTERY_DS2760 is not set
+# CONFIG_BATTERY_GOLDFISH is not set
+# CONFIG_HWMON is not set
+# CONFIG_WATCHDOG is not set
+
+#
+# Sonics Silicon Backplane
+#
+CONFIG_SSB_POSSIBLE=3Dy
+# CONFIG_SSB is not set
+
+#
+# Multifunction device drivers
+#
+# CONFIG_MFD_SM501 is not set
+# CONFIG_HTC_EGPIO is not set
+
+#
+# Multimedia devices
+#
+# CONFIG_VIDEO_DEV is not set
+# CONFIG_DVB_CORE is not set
+CONFIG_DAB=3Dy
+
+#
+# Graphics support
+#
+# CONFIG_VGASTATE is not set
+CONFIG_VIDEO_OUTPUT_CONTROL=3Dy
+CONFIG_FB=3Dy
+# CONFIG_FIRMWARE_EDID is not set
+# CONFIG_FB_DDC is not set
+CONFIG_FB_CFB_FILLRECT=3Dy
+CONFIG_FB_CFB_COPYAREA=3Dy
+CONFIG_FB_CFB_IMAGEBLIT=3Dy
+# CONFIG_FB_CFB_REV_PIXELS_IN_BYTE is not set
+# CONFIG_FB_SYS_FILLRECT is not set
+# CONFIG_FB_SYS_COPYAREA is not set
+# CONFIG_FB_SYS_IMAGEBLIT is not set
+# CONFIG_FB_SYS_FOPS is not set
+CONFIG_FB_DEFERRED_IO=3Dy
+# CONFIG_FB_SVGALIB is not set
+# CONFIG_FB_MACMODES is not set
+# CONFIG_FB_BACKLIGHT is not set
+CONFIG_FB_MODE_HELPERS=3Dy
+CONFIG_FB_TILEBLITTING=3Dy
+
+#
+# Frame buffer hardware drivers
+#
+# CONFIG_FB_S1D13XXX is not set
+# CONFIG_FB_GOLDFISH is not set
+CONFIG_FB_MSM=3Dy
+# CONFIG_FB_MSM_LOGO is not set
+CONFIG_FB_MSM_REFRESH=3Dy
+# CONFIG_FB_VIRTUAL is not set
+# CONFIG_BACKLIGHT_LCD_SUPPORT is not set
+
+#
+# Display device support
+#
+# CONFIG_DISPLAY_SUPPORT is not set
+
+#
+# Console display driver support
+#
+# CONFIG_VGA_CONSOLE is not set
+CONFIG_DUMMY_CONSOLE=3Dy
+CONFIG_FRAMEBUFFER_CONSOLE=3Dy
+CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY=3Dy
+CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=3Dy
+CONFIG_FONTS=3Dy
+# CONFIG_FONT_8x8 is not set
+# CONFIG_FONT_8x16 is not set
+# CONFIG_FONT_6x11 is not set
+# CONFIG_FONT_7x14 is not set
+# CONFIG_FONT_PEARL_8x8 is not set
+# CONFIG_FONT_ACORN_8x8 is not set
+CONFIG_FONT_MINI_4x6=3Dy
+# CONFIG_FONT_SUN8x16 is not set
+# CONFIG_FONT_SUN12x22 is not set
+# CONFIG_FONT_10x18 is not set
+# CONFIG_LOGO is not set
+
+#
+# Sound
+#
+# CONFIG_SOUND is not set
+CONFIG_HID_SUPPORT=3Dy
+CONFIG_HID=3Dy
+# CONFIG_HID_DEBUG is not set
+# CONFIG_HIDRAW is not set
+CONFIG_USB_SUPPORT=3Dy
+CONFIG_USB_ARCH_HAS_HCD=3Dy
+# CONFIG_USB_ARCH_HAS_OHCI is not set
+# CONFIG_USB_ARCH_HAS_EHCI is not set
+# CONFIG_USB is not set
+
+#
+# NOTE: USB_STORAGE enables SCSI, and 'SCSI disk support'
+#
+# CONFIG_USB_GADGET is not set
+
+#
+# USB Function Support
+#
+CONFIG_USB_FUNCTION=3Dy
+CONFIG_USB_FUNCTION_MSM_HSUSB=3Dy
+# CONFIG_USB_FUNCTION_NULL is not set
+# CONFIG_USB_FUNCTION_ZERO is not set
+# CONFIG_USB_FUNCTION_LOOPBACK is not set
+CONFIG_USB_FUNCTION_ADB=3Dy
+# CONFIG_USB_FUNCTION_UMS is not set
+CONFIG_USB_FUNCTION_MASS_STORAGE=3Dy
+# CONFIG_USB_FUNCTION_DIAG is not set
+CONFIG_USB_FUNCTION_ETHER=3Dy
+CONFIG_MMC=3Dy
+# CONFIG_MMC_DEBUG is not set
+# CONFIG_MMC_UNSAFE_RESUME is not set
+CONFIG_MMC_EMBEDDED_SDIO=3Dy
+
+#
+# MMC/SD Card Drivers
+#
+CONFIG_MMC_BLOCK=3Dy
+# CONFIG_MMC_BLOCK_BOUNCE is not set
+# CONFIG_SDIO_UART is not set
+# CONFIG_MMC_TEST is not set
+
+#
+# MMC/SD Host Controller Drivers
+#
+CONFIG_MMC_MSM7X00A=3Dy
+CONFIG_NEW_LEDS=3Dy
+CONFIG_LEDS_CLASS=3Dy
+
+#
+# LED drivers
+#
+
+#
+# LED Triggers
+#
+CONFIG_LEDS_TRIGGERS=3Dy
+CONFIG_LEDS_TRIGGER_TIMER=3Dy
+CONFIG_LEDS_TRIGGER_HEARTBEAT=3Dy
+CONFIG_SWITCH=3Dy
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
+# I2C RTC drivers
+#
+# CONFIG_RTC_DRV_DS1307 is not set
+# CONFIG_RTC_DRV_DS1374 is not set
+# CONFIG_RTC_DRV_DS1672 is not set
+# CONFIG_RTC_DRV_MAX6900 is not set
+# CONFIG_RTC_DRV_RS5C372 is not set
+# CONFIG_RTC_DRV_ISL1208 is not set
+# CONFIG_RTC_DRV_X1205 is not set
+# CONFIG_RTC_DRV_PCF8563 is not set
+# CONFIG_RTC_DRV_PCF8583 is not set
+# CONFIG_RTC_DRV_M41T80 is not set
+# CONFIG_RTC_DRV_S35390A is not set
+
+#
+# SPI RTC drivers
+#
+
+#
+# Platform RTC drivers
+#
+# CONFIG_RTC_DRV_CMOS is not set
+# CONFIG_RTC_DRV_DS1511 is not set
+# CONFIG_RTC_DRV_DS1553 is not set
+# CONFIG_RTC_DRV_DS1742 is not set
+# CONFIG_RTC_DRV_STK17TA8 is not set
+# CONFIG_RTC_DRV_M48T86 is not set
+# CONFIG_RTC_DRV_M48T59 is not set
+# CONFIG_RTC_DRV_V3020 is not set
+
+#
+# on-CPU RTC drivers
+#
+# CONFIG_RTC_DRV_GOLDFISH is not set
+# CONFIG_RTC_DRV_MSM7X00A is not set
+CONFIG_RTC_DRV_MSM7X00=3Dy
+
+#
+# Android
+#
+# CONFIG_ANDROID_BINDER_IPC is not set
+# CONFIG_ANDROID_PMEM is not set
+# CONFIG_ANDROID_POWER is not set
+# CONFIG_ANDROID_LOGGER is not set
+# CONFIG_ANDROID_RAM_CONSOLE is not set
+# CONFIG_ANDROID_PARANOID_NETWORK is not set
+
+#
+# File systems
+#
+CONFIG_EXT2_FS=3Dy
+CONFIG_EXT2_FS_XATTR=3Dy
+# CONFIG_EXT2_FS_POSIX_ACL is not set
+# CONFIG_EXT2_FS_SECURITY is not set
+# CONFIG_EXT2_FS_XIP is not set
+CONFIG_EXT3_FS=3Dy
+CONFIG_EXT3_FS_XATTR=3Dy
+# CONFIG_EXT3_FS_POSIX_ACL is not set
+# CONFIG_EXT3_FS_SECURITY is not set
+# CONFIG_EXT4DEV_FS is not set
+CONFIG_JBD=3Dy
+CONFIG_FS_MBCACHE=3Dy
+# CONFIG_REISERFS_FS is not set
+# CONFIG_JFS_FS is not set
+# CONFIG_FS_POSIX_ACL is not set
+# CONFIG_XFS_FS is not set
+# CONFIG_GFS2_FS is not set
+# CONFIG_OCFS2_FS is not set
+CONFIG_DNOTIFY=3Dy
+CONFIG_INOTIFY=3Dy
+CONFIG_INOTIFY_USER=3Dy
+# CONFIG_QUOTA is not set
+# CONFIG_AUTOFS_FS is not set
+# CONFIG_AUTOFS4_FS is not set
+# CONFIG_FUSE_FS is not set
+
+#
+# CD-ROM/DVD Filesystems
+#
+# CONFIG_ISO9660_FS is not set
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
+# CONFIG_NTFS_FS is not set
+
+#
+# Pseudo filesystems
+#
+CONFIG_PROC_FS=3Dy
+CONFIG_PROC_SYSCTL=3Dy
+CONFIG_SYSFS=3Dy
+CONFIG_TMPFS=3Dy
+# CONFIG_TMPFS_POSIX_ACL is not set
+# CONFIG_HUGETLB_PAGE is not set
+# CONFIG_CONFIGFS_FS is not set
+
+#
+# Miscellaneous filesystems
+#
+# CONFIG_ADFS_FS is not set
+# CONFIG_AFFS_FS is not set
+# CONFIG_HFS_FS is not set
+# CONFIG_HFSPLUS_FS is not set
+# CONFIG_BEFS_FS is not set
+# CONFIG_BFS_FS is not set
+# CONFIG_EFS_FS is not set
+CONFIG_CRAMFS=3Dy
+# CONFIG_VXFS_FS is not set
+# CONFIG_MINIX_FS is not set
+# CONFIG_HPFS_FS is not set
+# CONFIG_QNX4FS_FS is not set
+# CONFIG_ROMFS_FS is not set
+# CONFIG_SYSV_FS is not set
+# CONFIG_UFS_FS is not set
+CONFIG_NETWORK_FILESYSTEMS=3Dy
+# CONFIG_NFS_FS is not set
+# CONFIG_NFSD is not set
+# CONFIG_SMB_FS is not set
+# CONFIG_CIFS is not set
+# CONFIG_NCP_FS is not set
+# CONFIG_CODA_FS is not set
+# CONFIG_AFS_FS is not set
+
+#
+# Partition Types
+#
+# CONFIG_PARTITION_ADVANCED is not set
+CONFIG_MSDOS_PARTITION=3Dy
+CONFIG_NLS=3Dy
+CONFIG_NLS_DEFAULT=3D"iso8859-1"
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
+# CONFIG_NLS_ASCII is not set
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
+# CONFIG_NLS_UTF8 is not set
+# CONFIG_DLM is not set
+
+#
+# Kernel hacking
+#
+CONFIG_PRINTK_TIME=3Dy
+CONFIG_ENABLE_WARN_DEPRECATED=3Dy
+CONFIG_ENABLE_MUST_CHECK=3Dy
+CONFIG_MAGIC_SYSRQ=3Dy
+# CONFIG_UNUSED_SYMBOLS is not set
+# CONFIG_DEBUG_FS is not set
+# CONFIG_HEADERS_CHECK is not set
+CONFIG_DEBUG_KERNEL=3Dy
+# CONFIG_DEBUG_SHIRQ is not set
+CONFIG_DETECT_SOFTLOCKUP=3Dy
+CONFIG_SCHED_DEBUG=3Dy
+CONFIG_SCHEDSTATS=3Dy
+# CONFIG_TIMER_STATS is not set
+# CONFIG_DEBUG_SLAB is not set
+CONFIG_DEBUG_PREEMPT=3Dy
+# CONFIG_DEBUG_RT_MUTEXES is not set
+# CONFIG_RT_MUTEX_TESTER is not set
+# CONFIG_DEBUG_SPINLOCK is not set
+CONFIG_DEBUG_MUTEXES=3Dy
+# CONFIG_DEBUG_LOCK_ALLOC is not set
+# CONFIG_PROVE_LOCKING is not set
+# CONFIG_LOCK_STAT is not set
+CONFIG_DEBUG_SPINLOCK_SLEEP=3Dy
+# CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
+# CONFIG_DEBUG_KOBJECT is not set
+CONFIG_DEBUG_BUGVERBOSE=3Dy
+CONFIG_DEBUG_INFO=3Dy
+# CONFIG_DEBUG_VM is not set
+# CONFIG_DEBUG_LIST is not set
+# CONFIG_DEBUG_SG is not set
+CONFIG_FRAME_POINTER=3Dy
+# CONFIG_BOOT_PRINTK_DELAY is not set
+# CONFIG_RCU_TORTURE_TEST is not set
+# CONFIG_BACKTRACE_SELF_TEST is not set
+# CONFIG_FAULT_INJECTION is not set
+# CONFIG_LATENCYTOP is not set
+# CONFIG_SAMPLES is not set
+# CONFIG_DEBUG_USER is not set
+# CONFIG_DEBUG_ERRORS is not set
+# CONFIG_DEBUG_STACK_USAGE is not set
+# CONFIG_DEBUG_LL is not set
+
+#
+# Security options
+#
+# CONFIG_KEYS is not set
+# CONFIG_SECURITY is not set
+# CONFIG_SECURITY_FILE_CAPABILITIES is not set
+# CONFIG_CRYPTO is not set
+
+#
+# Library routines
+#
+CONFIG_BITREVERSE=3Dy
+CONFIG_CRC_CCITT=3Dy
+# CONFIG_CRC16 is not set
+# CONFIG_CRC_ITU_T is not set
+CONFIG_CRC32=3Dy
+# CONFIG_CRC7 is not set
+# CONFIG_LIBCRC32C is not set
+CONFIG_ZLIB_INFLATE=3Dy
+CONFIG_ZLIB_DEFLATE=3Dy
+CONFIG_PLIST=3Dy
+CONFIG_HAS_IOMEM=3Dy
+CONFIG_HAS_IOPORT=3Dy
+CONFIG_HAS_DMA=3Dy
diff --git a/recipes/linux/linux-replicant/htcnike/defconfig b/recipes/linu=
x/linux-replicant/htcnike/defconfig
new file mode 100644
index 0000000..eb0979c
--- /dev/null
+++ b/recipes/linux/linux-replicant/htcnike/defconfig
@@ -0,0 +1,1009 @@
+#
+# Automatically generated make config: don't edit
+# Linux kernel version: 2.6.25
+# Wed Feb 25 00:39:08 2009
+#
+CONFIG_ARM=3Dy
+CONFIG_SYS_SUPPORTS_APM_EMULATION=3Dy
+# CONFIG_GENERIC_GPIO is not set
+CONFIG_GENERIC_TIME=3Dy
+CONFIG_GENERIC_CLOCKEVENTS=3Dy
+CONFIG_MMU=3Dy
+# CONFIG_NO_IOPORT is not set
+CONFIG_GENERIC_HARDIRQS=3Dy
+CONFIG_STACKTRACE_SUPPORT=3Dy
+CONFIG_HAVE_LATENCYTOP_SUPPORT=3Dy
+CONFIG_LOCKDEP_SUPPORT=3Dy
+CONFIG_TRACE_IRQFLAGS_SUPPORT=3Dy
+CONFIG_HARDIRQS_SW_RESEND=3Dy
+CONFIG_GENERIC_IRQ_PROBE=3Dy
+CONFIG_RWSEM_GENERIC_SPINLOCK=3Dy
+# CONFIG_ARCH_HAS_ILOG2_U32 is not set
+# CONFIG_ARCH_HAS_ILOG2_U64 is not set
+CONFIG_GENERIC_HWEIGHT=3Dy
+CONFIG_GENERIC_CALIBRATE_DELAY=3Dy
+CONFIG_ARCH_SUPPORTS_AOUT=3Dy
+CONFIG_ZONE_DMA=3Dy
+CONFIG_VECTORS_BASE=3D0xffff0000
+CONFIG_DEFCONFIG_LIST=3D"/lib/modules/$UNAME_RELEASE/.config"
+
+#
+# General setup
+#
+CONFIG_EXPERIMENTAL=3Dy
+CONFIG_BROKEN_ON_SMP=3Dy
+CONFIG_LOCK_KERNEL=3Dy
+CONFIG_INIT_ENV_ARG_LIMIT=3D32
+CONFIG_LOCALVERSION=3D""
+CONFIG_LOCALVERSION_AUTO=3Dy
+CONFIG_SWAP=3Dy
+# CONFIG_SYSVIPC is not set
+# CONFIG_POSIX_MQUEUE is not set
+# CONFIG_BSD_PROCESS_ACCT is not set
+# CONFIG_TASKSTATS is not set
+# CONFIG_AUDIT is not set
+CONFIG_IKCONFIG=3Dy
+CONFIG_IKCONFIG_PROC=3Dy
+CONFIG_LOG_BUF_SHIFT=3D17
+# CONFIG_CGROUPS is not set
+CONFIG_GROUP_SCHED=3Dy
+CONFIG_FAIR_GROUP_SCHED=3Dy
+# CONFIG_RT_GROUP_SCHED is not set
+CONFIG_USER_SCHED=3Dy
+# CONFIG_CGROUP_SCHED is not set
+CONFIG_SYSFS_DEPRECATED=3Dy
+CONFIG_SYSFS_DEPRECATED_V2=3Dy
+# CONFIG_RELAY is not set
+# CONFIG_NAMESPACES is not set
+CONFIG_BLK_DEV_INITRD=3Dy
+CONFIG_INITRAMFS_SOURCE=3D""
+# CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
+CONFIG_SYSCTL=3Dy
+CONFIG_PANIC_TIMEOUT=3D0
+CONFIG_EMBEDDED=3Dy
+CONFIG_UID16=3Dy
+CONFIG_SYSCTL_SYSCALL=3Dy
+CONFIG_KALLSYMS=3Dy
+# CONFIG_KALLSYMS_ALL is not set
+# CONFIG_KALLSYMS_EXTRA_PASS is not set
+CONFIG_HOTPLUG=3Dy
+CONFIG_PRINTK=3Dy
+CONFIG_BUG=3Dy
+CONFIG_ELF_CORE=3Dy
+CONFIG_COMPAT_BRK=3Dy
+CONFIG_BASE_FULL=3Dy
+CONFIG_FUTEX=3Dy
+CONFIG_ANON_INODES=3Dy
+CONFIG_EPOLL=3Dy
+CONFIG_SIGNALFD=3Dy
+CONFIG_TIMERFD=3Dy
+CONFIG_EVENTFD=3Dy
+CONFIG_SHMEM=3Dy
+CONFIG_ASHMEM=3Dy
+CONFIG_VM_EVENT_COUNTERS=3Dy
+CONFIG_SLAB=3Dy
+# CONFIG_SLUB is not set
+# CONFIG_SLOB is not set
+# CONFIG_PROFILING is not set
+# CONFIG_MARKERS is not set
+CONFIG_HAVE_OPROFILE=3Dy
+# CONFIG_KPROBES is not set
+CONFIG_HAVE_KPROBES=3Dy
+CONFIG_HAVE_KRETPROBES=3Dy
+CONFIG_PROC_PAGE_MONITOR=3Dy
+CONFIG_SLABINFO=3Dy
+CONFIG_RT_MUTEXES=3Dy
+# CONFIG_TINY_SHMEM is not set
+CONFIG_BASE_SMALL=3D0
+CONFIG_MODULES=3Dy
+CONFIG_MODULE_UNLOAD=3Dy
+# CONFIG_MODULE_FORCE_UNLOAD is not set
+CONFIG_MODVERSIONS=3Dy
+# CONFIG_MODULE_SRCVERSION_ALL is not set
+# CONFIG_KMOD is not set
+CONFIG_BLOCK=3Dy
+# CONFIG_LBD is not set
+# CONFIG_BLK_DEV_IO_TRACE is not set
+# CONFIG_LSF is not set
+# CONFIG_BLK_DEV_BSG is not set
+
+#
+# IO Schedulers
+#
+CONFIG_IOSCHED_NOOP=3Dy
+CONFIG_IOSCHED_AS=3Dy
+# CONFIG_IOSCHED_DEADLINE is not set
+# CONFIG_IOSCHED_CFQ is not set
+CONFIG_DEFAULT_AS=3Dy
+# CONFIG_DEFAULT_DEADLINE is not set
+# CONFIG_DEFAULT_CFQ is not set
+# CONFIG_DEFAULT_NOOP is not set
+CONFIG_DEFAULT_IOSCHED=3D"anticipatory"
+CONFIG_CLASSIC_RCU=3Dy
+
+#
+# System Type
+#
+# CONFIG_ARCH_AAEC2000 is not set
+# CONFIG_ARCH_GOLDFISH is not set
+# CONFIG_ARCH_INTEGRATOR is not set
+# CONFIG_ARCH_REALVIEW is not set
+# CONFIG_ARCH_VERSATILE is not set
+# CONFIG_ARCH_AT91 is not set
+# CONFIG_ARCH_CLPS7500 is not set
+# CONFIG_ARCH_CLPS711X is not set
+# CONFIG_ARCH_CO285 is not set
+# CONFIG_ARCH_EBSA110 is not set
+# CONFIG_ARCH_EP93XX is not set
+# CONFIG_ARCH_FOOTBRIDGE is not set
+# CONFIG_ARCH_NETX is not set
+# CONFIG_ARCH_H720X is not set
+# CONFIG_ARCH_IMX is not set
+# CONFIG_ARCH_IOP13XX is not set
+# CONFIG_ARCH_IOP32X is not set
+# CONFIG_ARCH_IOP33X is not set
+# CONFIG_ARCH_IXP23XX is not set
+# CONFIG_ARCH_IXP2000 is not set
+# CONFIG_ARCH_IXP4XX is not set
+# CONFIG_ARCH_L7200 is not set
+# CONFIG_ARCH_KS8695 is not set
+# CONFIG_ARCH_NS9XXX is not set
+# CONFIG_ARCH_MXC is not set
+# CONFIG_ARCH_ORION is not set
+# CONFIG_ARCH_PNX4008 is not set
+# CONFIG_ARCH_PXA is not set
+# CONFIG_ARCH_RPC is not set
+# CONFIG_ARCH_SA1100 is not set
+# CONFIG_ARCH_S3C2410 is not set
+# CONFIG_ARCH_SHARK is not set
+# CONFIG_ARCH_LH7A40X is not set
+# CONFIG_ARCH_DAVINCI is not set
+# CONFIG_ARCH_OMAP is not set
+CONFIG_ARCH_MSM7X00A=3Dy
+
+#
+# Boot options
+#
+
+#
+# Power management
+#
+CONFIG_MSM_AMSS_VERSION=3D6210
+CONFIG_MSM_AMSS_VERSION_6210=3Dy
+# CONFIG_MSM_AMSS_VERSION_6220 is not set
+# CONFIG_MSM_AMSS_VERSION_6225 is not set
+# CONFIG_MACH_HALIBUT is not set
+CONFIG_MACH_HTCVOGUE=3Dy
+CONFIG_MACH_HTCKAISER=3Dy
+CONFIG_MACH_HTCPOLARIS=3Dy
+CONFIG_MACH_HTCNIKE=3Dy
+# CONFIG_HTCTITAN is not set
+CONFIG_VOGUE_TS=3Dy
+CONFIG_MSM_VOGUESMD=3Dy
+# CONFIG_MSM_LL_DEBUG_UART1 is not set
+# CONFIG_MSM_LL_DEBUG_UART2 is not set
+# CONFIG_MSM_LL_DEBUG_UART3 is not set
+CONFIG_MSM_LL_DEBUG_NONE=3Dy
+CONFIG_MSM7X00A_IDLE=3Dy
+# CONFIG_MSM7X00A_USE_GP_TIMER is not set
+CONFIG_MSM7X00A_USE_DG_TIMER=3Dy
+# CONFIG_MSM7X00A_SLEEP_MODE_POWER_COLLAPSE_SUSPEND is not set
+CONFIG_MSM7X00A_SLEEP_MODE_POWER_COLLAPSE=3Dy
+# CONFIG_MSM7X00A_SLEEP_MODE_APPS_SLEEP is not set
+# CONFIG_MSM7X00A_SLEEP_MODE_RAMP_DOWN_AND_WAIT_FOR_INTERRUPT is not set
+# CONFIG_MSM7X00A_SLEEP_WAIT_FOR_INTERRUPT is not set
+CONFIG_MSM7X00A_SLEEP_MODE=3D1
+# CONFIG_MSM7X00A_IDLE_SLEEP_MODE_POWER_COLLAPSE_SUSPEND is not set
+# CONFIG_MSM7X00A_IDLE_SLEEP_MODE_POWER_COLLAPSE is not set
+# CONFIG_MSM7X00A_IDLE_SLEEP_MODE_APPS_SLEEP is not set
+CONFIG_MSM7X00A_IDLE_SLEEP_MODE_RAMP_DOWN_AND_WAIT_FOR_INTERRUPT=3Dy
+# CONFIG_MSM7X00A_IDLE_SLEEP_WAIT_FOR_INTERRUPT is not set
+CONFIG_MSM7X00A_IDLE_SLEEP_MODE=3D3
+CONFIG_MSM7X00A_IDLE_SLEEP_MIN_TIME=3D20000000
+CONFIG_MSM7X00A_IDLE_SPIN_TIME=3D80000
+# CONFIG_MSM_IDLE_STATS is not set
+# CONFIG_MSM_FIQ_SUPPORT is not set
+# CONFIG_MSM_SERIAL_DEBUGGER is not set
+# CONFIG_MSM_SMD is not set
+# CONFIG_MSM_ONCRPCROUTER is not set
+# CONFIG_MSM_HW3D is not set
+CONFIG_MSM_ADSP=3Dy
+# CONFIG_MSM_PERF is not set
+
+#
+# Processor Type
+#
+CONFIG_CPU_32=3Dy
+CONFIG_CPU_V6=3Dy
+# CONFIG_CPU_32v6K is not set
+CONFIG_CPU_32v6=3Dy
+CONFIG_CPU_ABRT_EV6=3Dy
+CONFIG_CPU_CACHE_V6=3Dy
+CONFIG_CPU_CACHE_VIPT=3Dy
+CONFIG_CPU_COPY_V6=3Dy
+CONFIG_CPU_TLB_V6=3Dy
+CONFIG_CPU_HAS_ASID=3Dy
+CONFIG_CPU_CP15=3Dy
+CONFIG_CPU_CP15_MMU=3Dy
+
+#
+# Processor Features
+#
+CONFIG_ARM_THUMB=3Dy
+# CONFIG_CPU_ICACHE_DISABLE is not set
+# CONFIG_CPU_DCACHE_DISABLE is not set
+# CONFIG_CPU_BPREDICT_DISABLE is not set
+# CONFIG_OUTER_CACHE is not set
+
+#
+# Bus support
+#
+# CONFIG_PCI_SYSCALL is not set
+# CONFIG_ARCH_SUPPORTS_MSI is not set
+# CONFIG_PCCARD is not set
+
+#
+# Kernel Features
+#
+CONFIG_TICK_ONESHOT=3Dy
+CONFIG_NO_HZ=3Dy
+CONFIG_HIGH_RES_TIMERS=3Dy
+CONFIG_GENERIC_CLOCKEVENTS_BUILD=3Dy
+CONFIG_PREEMPT=3Dy
+CONFIG_HZ=3D100
+CONFIG_AEABI=3Dy
+# CONFIG_OABI_COMPAT is not set
+# CONFIG_ARCH_DISCONTIGMEM_ENABLE is not set
+CONFIG_SELECT_MEMORY_MODEL=3Dy
+CONFIG_FLATMEM_MANUAL=3Dy
+# CONFIG_DISCONTIGMEM_MANUAL is not set
+# CONFIG_SPARSEMEM_MANUAL is not set
+CONFIG_FLATMEM=3Dy
+CONFIG_FLAT_NODE_MEM_MAP=3Dy
+# CONFIG_SPARSEMEM_STATIC is not set
+# CONFIG_SPARSEMEM_VMEMMAP_ENABLE is not set
+CONFIG_SPLIT_PTLOCK_CPUS=3D4
+CONFIG_RESOURCES_64BIT=3Dy
+CONFIG_ZONE_DMA_FLAG=3D1
+CONFIG_BOUNCE=3Dy
+CONFIG_VIRT_TO_BUS=3Dy
+CONFIG_ALIGNMENT_TRAP=3Dy
+
+#
+# Boot options
+#
+CONFIG_ZBOOT_ROM_TEXT=3D0x0
+CONFIG_ZBOOT_ROM_BSS=3D0x0
+CONFIG_CMDLINE=3D""
+# CONFIG_XIP_KERNEL is not set
+# CONFIG_KEXEC is not set
+
+#
+# CPU Frequency scaling
+#
+# CONFIG_CPU_FREQ is not set
+
+#
+# Floating point emulation
+#
+
+#
+# At least one emulation must be selected
+#
+# CONFIG_VFP is not set
+
+#
+# Userspace binary formats
+#
+CONFIG_BINFMT_ELF=3Dy
+# CONFIG_BINFMT_AOUT is not set
+# CONFIG_BINFMT_MISC is not set
+
+#
+# Power management options
+#
+CONFIG_PM=3Dy
+# CONFIG_PM_LEGACY is not set
+CONFIG_PM_DEBUG=3Dy
+# CONFIG_PM_VERBOSE is not set
+CONFIG_CAN_PM_TRACE=3Dy
+CONFIG_PM_SLEEP=3Dy
+CONFIG_SUSPEND=3Dy
+CONFIG_SUSPEND_FREEZER=3Dy
+# CONFIG_APM_EMULATION is not set
+CONFIG_ARCH_SUSPEND_POSSIBLE=3Dy
+
+#
+# Networking
+#
+CONFIG_NET=3Dy
+
+#
+# Networking options
+#
+# CONFIG_PACKET is not set
+CONFIG_UNIX=3Dy
+# CONFIG_NET_KEY is not set
+CONFIG_INET=3Dy
+# CONFIG_IP_MULTICAST is not set
+# CONFIG_IP_ADVANCED_ROUTER is not set
+CONFIG_IP_FIB_HASH=3Dy
+# CONFIG_IP_PNP is not set
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
+# CONFIG_TCP_CONG_ADVANCED is not set
+CONFIG_TCP_CONG_CUBIC=3Dy
+CONFIG_DEFAULT_TCP_CONG=3D"cubic"
+# CONFIG_TCP_MD5SIG is not set
+# CONFIG_IPV6 is not set
+# CONFIG_INET6_XFRM_TUNNEL is not set
+# CONFIG_INET6_TUNNEL is not set
+# CONFIG_NETWORK_SECMARK is not set
+# CONFIG_NETFILTER is not set
+# CONFIG_IP_DCCP is not set
+# CONFIG_IP_SCTP is not set
+# CONFIG_TIPC is not set
+# CONFIG_ATM is not set
+# CONFIG_BRIDGE is not set
+# CONFIG_VLAN_8021Q is not set
+# CONFIG_DECNET is not set
+# CONFIG_LLC2 is not set
+# CONFIG_IPX is not set
+# CONFIG_ATALK is not set
+# CONFIG_X25 is not set
+# CONFIG_LAPB is not set
+# CONFIG_ECONET is not set
+# CONFIG_WAN_ROUTER is not set
+# CONFIG_NET_SCHED is not set
+
+#
+# Network testing
+#
+# CONFIG_NET_PKTGEN is not set
+# CONFIG_HAMRADIO is not set
+# CONFIG_CAN is not set
+# CONFIG_IRDA is not set
+CONFIG_BT=3Dy
+# CONFIG_BT_L2CAP is not set
+# CONFIG_BT_SCO is not set
+
+#
+# Bluetooth device drivers
+#
+# CONFIG_BT_HCIBTSDIO is not set
+CONFIG_BT_HCIUART=3Dy
+CONFIG_BT_HCIUART_H4=3Dy
+# CONFIG_BT_HCIUART_BCSP is not set
+# CONFIG_BT_HCIUART_LL is not set
+# CONFIG_BT_HCIUART_LL_USE_MSM_SERIAL_CLOCK_CONTROL is not set
+# CONFIG_BT_HCIVHCI is not set
+# CONFIG_AF_RXRPC is not set
+
+#
+# Wireless
+#
+# CONFIG_CFG80211 is not set
+# CONFIG_WIRELESS_EXT is not set
+# CONFIG_MAC80211 is not set
+# CONFIG_IEEE80211 is not set
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
+# CONFIG_DEBUG_DRIVER is not set
+# CONFIG_DEBUG_DEVRES is not set
+# CONFIG_SYS_HYPERVISOR is not set
+# CONFIG_CONNECTOR is not set
+# CONFIG_MTD is not set
+# CONFIG_PARPORT is not set
+CONFIG_BLK_DEV=3Dy
+# CONFIG_BLK_DEV_COW_COMMON is not set
+CONFIG_BLK_DEV_LOOP=3Dy
+# CONFIG_BLK_DEV_CRYPTOLOOP is not set
+# CONFIG_BLK_DEV_NBD is not set
+# CONFIG_BLK_DEV_RAM is not set
+# CONFIG_CDROM_PKTCDVD is not set
+# CONFIG_ATA_OVER_ETH is not set
+CONFIG_MISC_DEVICES=3Dy
+# CONFIG_EEPROM_93CX6 is not set
+CONFIG_LOW_MEMORY_KILLER=3Dy
+CONFIG_KERNEL_DEBUGGER_CORE=3Dy
+# CONFIG_ENCLOSURE_SERVICES is not set
+# CONFIG_HAVE_IDE is not set
+
+#
+# SCSI device support
+#
+# CONFIG_RAID_ATTRS is not set
+# CONFIG_SCSI is not set
+# CONFIG_SCSI_DMA is not set
+# CONFIG_SCSI_NETLINK is not set
+# CONFIG_ATA is not set
+# CONFIG_MD is not set
+CONFIG_NETDEVICES=3Dy
+# CONFIG_NETDEVICES_MULTIQUEUE is not set
+# CONFIG_DUMMY is not set
+# CONFIG_BONDING is not set
+# CONFIG_MACVLAN is not set
+# CONFIG_EQUALIZER is not set
+# CONFIG_TUN is not set
+# CONFIG_VETH is not set
+# CONFIG_NET_ETHERNET is not set
+# CONFIG_NETDEV_1000 is not set
+# CONFIG_NETDEV_10000 is not set
+
+#
+# Wireless LAN
+#
+# CONFIG_WLAN_PRE80211 is not set
+# CONFIG_WLAN_80211 is not set
+# CONFIG_WAN is not set
+CONFIG_PPP=3Dy
+# CONFIG_PPP_MULTILINK is not set
+# CONFIG_PPP_FILTER is not set
+CONFIG_PPP_ASYNC=3Dy
+# CONFIG_PPP_SYNC_TTY is not set
+CONFIG_PPP_DEFLATE=3Dy
+CONFIG_PPP_BSDCOMP=3Dy
+# CONFIG_PPP_MPPE is not set
+# CONFIG_PPPOE is not set
+# CONFIG_PPPOL2TP is not set
+# CONFIG_SLIP is not set
+CONFIG_SLHC=3Dy
+# CONFIG_NETCONSOLE is not set
+# CONFIG_MSM_RMNET is not set
+# CONFIG_NETPOLL is not set
+# CONFIG_NET_POLL_CONTROLLER is not set
+# CONFIG_ISDN is not set
+
+#
+# Input device support
+#
+CONFIG_INPUT=3Dy
+# CONFIG_INPUT_FF_MEMLESS is not set
+# CONFIG_INPUT_POLLDEV is not set
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
+# CONFIG_KEYBOARD_ATKBD is not set
+# CONFIG_KEYBOARD_SUNKBD is not set
+# CONFIG_KEYBOARD_LKKBD is not set
+# CONFIG_KEYBOARD_XTKBD is not set
+# CONFIG_KEYBOARD_NEWTON is not set
+# CONFIG_KEYBOARD_STOWAWAY is not set
+# CONFIG_KEYBOARD_GOLDFISH_EVENTS is not set
+# CONFIG_INPUT_MOUSE is not set
+# CONFIG_INPUT_JOYSTICK is not set
+# CONFIG_INPUT_TABLET is not set
+# CONFIG_INPUT_TOUCHSCREEN is not set
+CONFIG_INPUT_MISC=3Dy
+# CONFIG_INPUT_UINPUT is not set
+CONFIG_INPUT_GPIO=3Dy
+
+#
+# Hardware I/O ports
+#
+# CONFIG_SERIO is not set
+# CONFIG_GAMEPORT is not set
+
+#
+# Character devices
+#
+CONFIG_VT=3Dy
+CONFIG_VT_CONSOLE=3Dy
+CONFIG_HW_CONSOLE=3Dy
+CONFIG_VT_HW_CONSOLE_BINDING=3Dy
+# CONFIG_SERIAL_NONSTANDARD is not set
+
+#
+# Serial drivers
+#
+# CONFIG_SERIAL_8250 is not set
+
+#
+# Non-8250 serial port support
+#
+CONFIG_SERIAL_CORE=3Dy
+CONFIG_SERIAL_CORE_CONSOLE=3Dy
+CONFIG_SERIAL_MSM=3Dy
+CONFIG_SERIAL_MSM_CONSOLE=3Dy
+CONFIG_SERIAL_MSM_CLOCK_CONTROL=3Dy
+# CONFIG_SERIAL_MSM_RX_WAKEUP is not set
+CONFIG_UNIX98_PTYS=3Dy
+# CONFIG_LEGACY_PTYS is not set
+# CONFIG_IPMI_HANDLER is not set
+# CONFIG_HW_RANDOM is not set
+# CONFIG_NVRAM is not set
+# CONFIG_R3964 is not set
+# CONFIG_RAW_DRIVER is not set
+# CONFIG_TCG_TPM is not set
+CONFIG_DEVMEM=3Dy
+# CONFIG_GOLDFISH_TTY is not set
+# CONFIG_DCC_TTY is not set
+CONFIG_I2C=3Dy
+CONFIG_I2C_BOARDINFO=3Dy
+# CONFIG_I2C_CHARDEV is not set
+
+#
+# I2C Algorithms
+#
+# CONFIG_I2C_ALGOBIT is not set
+# CONFIG_I2C_ALGOPCF is not set
+# CONFIG_I2C_ALGOPCA is not set
+
+#
+# I2C Hardware Bus support
+#
+CONFIG_I2C_MSM=3Dy
+# CONFIG_I2C_OCORES is not set
+# CONFIG_I2C_PARPORT_LIGHT is not set
+# CONFIG_I2C_SIMTEC is not set
+# CONFIG_I2C_TAOS_EVM is not set
+# CONFIG_I2C_STUB is not set
+
+#
+# Miscellaneous I2C Chip support
+#
+# CONFIG_DS1682 is not set
+# CONFIG_SENSORS_EEPROM is not set
+# CONFIG_SENSORS_PCF8574 is not set
+# CONFIG_PCF8575 is not set
+# CONFIG_SENSORS_PCF8591 is not set
+# CONFIG_TPS65010 is not set
+# CONFIG_SENSORS_MAX6875 is not set
+# CONFIG_SENSORS_TSL2550 is not set
+CONFIG_S5K4B1FX=3Dy
+# CONFIG_I2C_DEBUG_CORE is not set
+# CONFIG_I2C_DEBUG_ALGO is not set
+# CONFIG_I2C_DEBUG_BUS is not set
+# CONFIG_I2C_DEBUG_CHIP is not set
+
+#
+# SPI support
+#
+# CONFIG_SPI is not set
+# CONFIG_SPI_MASTER is not set
+# CONFIG_W1 is not set
+CONFIG_POWER_SUPPLY=3Dy
+# CONFIG_POWER_SUPPLY_DEBUG is not set
+# CONFIG_PDA_POWER is not set
+# CONFIG_BATTERY_DS2760 is not set
+# CONFIG_BATTERY_GOLDFISH is not set
+# CONFIG_HWMON is not set
+# CONFIG_WATCHDOG is not set
+
+#
+# Sonics Silicon Backplane
+#
+CONFIG_SSB_POSSIBLE=3Dy
+# CONFIG_SSB is not set
+
+#
+# Multifunction device drivers
+#
+# CONFIG_MFD_SM501 is not set
+# CONFIG_HTC_EGPIO is not set
+
+#
+# Multimedia devices
+#
+# CONFIG_VIDEO_DEV is not set
+# CONFIG_DVB_CORE is not set
+CONFIG_DAB=3Dy
+
+#
+# Graphics support
+#
+# CONFIG_VGASTATE is not set
+CONFIG_VIDEO_OUTPUT_CONTROL=3Dy
+CONFIG_FB=3Dy
+# CONFIG_FIRMWARE_EDID is not set
+# CONFIG_FB_DDC is not set
+CONFIG_FB_CFB_FILLRECT=3Dy
+CONFIG_FB_CFB_COPYAREA=3Dy
+CONFIG_FB_CFB_IMAGEBLIT=3Dy
+# CONFIG_FB_CFB_REV_PIXELS_IN_BYTE is not set
+# CONFIG_FB_SYS_FILLRECT is not set
+# CONFIG_FB_SYS_COPYAREA is not set
+# CONFIG_FB_SYS_IMAGEBLIT is not set
+# CONFIG_FB_SYS_FOPS is not set
+CONFIG_FB_DEFERRED_IO=3Dy
+# CONFIG_FB_SVGALIB is not set
+# CONFIG_FB_MACMODES is not set
+# CONFIG_FB_BACKLIGHT is not set
+CONFIG_FB_MODE_HELPERS=3Dy
+CONFIG_FB_TILEBLITTING=3Dy
+
+#
+# Frame buffer hardware drivers
+#
+# CONFIG_FB_S1D13XXX is not set
+# CONFIG_FB_GOLDFISH is not set
+CONFIG_FB_MSM=3Dy
+# CONFIG_FB_MSM_LOGO is not set
+# CONFIG_FB_MSM_REFRESH is not set
+# CONFIG_FB_VIRTUAL is not set
+# CONFIG_BACKLIGHT_LCD_SUPPORT is not set
+
+#
+# Display device support
+#
+# CONFIG_DISPLAY_SUPPORT is not set
+
+#
+# Console display driver support
+#
+# CONFIG_VGA_CONSOLE is not set
+CONFIG_DUMMY_CONSOLE=3Dy
+CONFIG_FRAMEBUFFER_CONSOLE=3Dy
+CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY=3Dy
+CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=3Dy
+CONFIG_FONTS=3Dy
+CONFIG_FONT_8x8=3Dy
+# CONFIG_FONT_8x16 is not set
+# CONFIG_FONT_6x11 is not set
+# CONFIG_FONT_7x14 is not set
+# CONFIG_FONT_PEARL_8x8 is not set
+# CONFIG_FONT_ACORN_8x8 is not set
+# CONFIG_FONT_MINI_4x6 is not set
+# CONFIG_FONT_SUN8x16 is not set
+# CONFIG_FONT_SUN12x22 is not set
+# CONFIG_FONT_10x18 is not set
+CONFIG_LOGO=3Dy
+# CONFIG_LOGO_LINUX_MONO is not set
+# CONFIG_LOGO_LINUX_VGA16 is not set
+CONFIG_LOGO_LINUX_CLUT224=3Dy
+
+#
+# Sound
+#
+# CONFIG_SOUND is not set
+# CONFIG_HID_SUPPORT is not set
+# CONFIG_USB_SUPPORT is not set
+CONFIG_MMC=3Dy
+# CONFIG_MMC_DEBUG is not set
+# CONFIG_MMC_UNSAFE_RESUME is not set
+CONFIG_MMC_EMBEDDED_SDIO=3Dy
+
+#
+# MMC/SD Card Drivers
+#
+CONFIG_MMC_BLOCK=3Dy
+# CONFIG_MMC_BLOCK_BOUNCE is not set
+# CONFIG_SDIO_UART is not set
+# CONFIG_MMC_TEST is not set
+
+#
+# MMC/SD Host Controller Drivers
+#
+CONFIG_MMC_MSM7X00A=3Dy
+CONFIG_NEW_LEDS=3Dy
+CONFIG_LEDS_CLASS=3Dy
+
+#
+# LED drivers
+#
+
+#
+# LED Triggers
+#
+# CONFIG_LEDS_TRIGGERS is not set
+# CONFIG_SWITCH is not set
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
+# I2C RTC drivers
+#
+# CONFIG_RTC_DRV_DS1307 is not set
+# CONFIG_RTC_DRV_DS1374 is not set
+# CONFIG_RTC_DRV_DS1672 is not set
+# CONFIG_RTC_DRV_MAX6900 is not set
+# CONFIG_RTC_DRV_RS5C372 is not set
+# CONFIG_RTC_DRV_ISL1208 is not set
+# CONFIG_RTC_DRV_X1205 is not set
+# CONFIG_RTC_DRV_PCF8563 is not set
+# CONFIG_RTC_DRV_PCF8583 is not set
+# CONFIG_RTC_DRV_M41T80 is not set
+# CONFIG_RTC_DRV_S35390A is not set
+
+#
+# SPI RTC drivers
+#
+
+#
+# Platform RTC drivers
+#
+# CONFIG_RTC_DRV_CMOS is not set
+# CONFIG_RTC_DRV_DS1511 is not set
+# CONFIG_RTC_DRV_DS1553 is not set
+# CONFIG_RTC_DRV_DS1742 is not set
+# CONFIG_RTC_DRV_STK17TA8 is not set
+# CONFIG_RTC_DRV_M48T86 is not set
+# CONFIG_RTC_DRV_M48T59 is not set
+# CONFIG_RTC_DRV_V3020 is not set
+
+#
+# on-CPU RTC drivers
+#
+# CONFIG_RTC_DRV_GOLDFISH is not set
+# CONFIG_RTC_DRV_MSM7X00A is not set
+CONFIG_RTC_DRV_MSM7X00=3Dy
+
+#
+# Android
+#
+CONFIG_ANDROID_BINDER_IPC=3Dy
+# CONFIG_ANDROID_PMEM is not set
+CONFIG_ANDROID_POWER=3Dy
+CONFIG_ANDROID_POWER_STAT=3Dy
+CONFIG_ANDROID_POWER_ALARM=3Dy
+CONFIG_ANDROID_LOGGER=3Dy
+CONFIG_ANDROID_RAM_CONSOLE=3Dy
+CONFIG_ANDROID_RAM_CONSOLE_ENABLE_VERBOSE=3Dy
+# CONFIG_ANDROID_RAM_CONSOLE_ERROR_CORRECTION is not set
+# CONFIG_ANDROID_RAM_CONSOLE_EARLY_INIT is not set
+CONFIG_ANDROID_PARANOID_NETWORK=3Dy
+
+#
+# File systems
+#
+CONFIG_EXT2_FS=3Dy
+CONFIG_EXT2_FS_XATTR=3Dy
+# CONFIG_EXT2_FS_POSIX_ACL is not set
+# CONFIG_EXT2_FS_SECURITY is not set
+# CONFIG_EXT2_FS_XIP is not set
+CONFIG_EXT3_FS=3Dy
+CONFIG_EXT3_FS_XATTR=3Dy
+# CONFIG_EXT3_FS_POSIX_ACL is not set
+# CONFIG_EXT3_FS_SECURITY is not set
+# CONFIG_EXT4DEV_FS is not set
+CONFIG_JBD=3Dy
+CONFIG_FS_MBCACHE=3Dy
+# CONFIG_REISERFS_FS is not set
+# CONFIG_JFS_FS is not set
+# CONFIG_FS_POSIX_ACL is not set
+# CONFIG_XFS_FS is not set
+# CONFIG_GFS2_FS is not set
+# CONFIG_OCFS2_FS is not set
+CONFIG_DNOTIFY=3Dy
+CONFIG_INOTIFY=3Dy
+CONFIG_INOTIFY_USER=3Dy
+# CONFIG_QUOTA is not set
+# CONFIG_AUTOFS_FS is not set
+# CONFIG_AUTOFS4_FS is not set
+# CONFIG_FUSE_FS is not set
+
+#
+# CD-ROM/DVD Filesystems
+#
+# CONFIG_ISO9660_FS is not set
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
+# CONFIG_NTFS_FS is not set
+
+#
+# Pseudo filesystems
+#
+CONFIG_PROC_FS=3Dy
+CONFIG_PROC_SYSCTL=3Dy
+CONFIG_SYSFS=3Dy
+CONFIG_TMPFS=3Dy
+# CONFIG_TMPFS_POSIX_ACL is not set
+# CONFIG_HUGETLB_PAGE is not set
+# CONFIG_CONFIGFS_FS is not set
+
+#
+# Miscellaneous filesystems
+#
+# CONFIG_ADFS_FS is not set
+# CONFIG_AFFS_FS is not set
+# CONFIG_HFS_FS is not set
+# CONFIG_HFSPLUS_FS is not set
+# CONFIG_BEFS_FS is not set
+# CONFIG_BFS_FS is not set
+# CONFIG_EFS_FS is not set
+CONFIG_CRAMFS=3Dy
+# CONFIG_VXFS_FS is not set
+# CONFIG_MINIX_FS is not set
+# CONFIG_HPFS_FS is not set
+# CONFIG_QNX4FS_FS is not set
+# CONFIG_ROMFS_FS is not set
+# CONFIG_SYSV_FS is not set
+# CONFIG_UFS_FS is not set
+CONFIG_NETWORK_FILESYSTEMS=3Dy
+# CONFIG_NFS_FS is not set
+# CONFIG_NFSD is not set
+# CONFIG_SMB_FS is not set
+# CONFIG_CIFS is not set
+# CONFIG_NCP_FS is not set
+# CONFIG_CODA_FS is not set
+# CONFIG_AFS_FS is not set
+
+#
+# Partition Types
+#
+CONFIG_PARTITION_ADVANCED=3Dy
+# CONFIG_ACORN_PARTITION is not set
+# CONFIG_OSF_PARTITION is not set
+# CONFIG_AMIGA_PARTITION is not set
+# CONFIG_ATARI_PARTITION is not set
+# CONFIG_MAC_PARTITION is not set
+CONFIG_MSDOS_PARTITION=3Dy
+# CONFIG_BSD_DISKLABEL is not set
+# CONFIG_MINIX_SUBPARTITION is not set
+# CONFIG_SOLARIS_X86_PARTITION is not set
+# CONFIG_UNIXWARE_DISKLABEL is not set
+# CONFIG_LDM_PARTITION is not set
+# CONFIG_SGI_PARTITION is not set
+# CONFIG_ULTRIX_PARTITION is not set
+# CONFIG_SUN_PARTITION is not set
+# CONFIG_KARMA_PARTITION is not set
+# CONFIG_EFI_PARTITION is not set
+# CONFIG_SYSV68_PARTITION is not set
+CONFIG_NLS=3Dy
+CONFIG_NLS_DEFAULT=3D"iso8859-1"
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
+# CONFIG_NLS_UTF8 is not set
+# CONFIG_DLM is not set
+
+#
+# Kernel hacking
+#
+CONFIG_PRINTK_TIME=3Dy
+CONFIG_ENABLE_WARN_DEPRECATED=3Dy
+CONFIG_ENABLE_MUST_CHECK=3Dy
+CONFIG_MAGIC_SYSRQ=3Dy
+# CONFIG_UNUSED_SYMBOLS is not set
+# CONFIG_DEBUG_FS is not set
+# CONFIG_HEADERS_CHECK is not set
+CONFIG_DEBUG_KERNEL=3Dy
+# CONFIG_DEBUG_SHIRQ is not set
+CONFIG_DETECT_SOFTLOCKUP=3Dy
+CONFIG_SCHED_DEBUG=3Dy
+# CONFIG_SCHEDSTATS is not set
+# CONFIG_TIMER_STATS is not set
+# CONFIG_DEBUG_SLAB is not set
+CONFIG_DEBUG_PREEMPT=3Dy
+# CONFIG_DEBUG_RT_MUTEXES is not set
+# CONFIG_RT_MUTEX_TESTER is not set
+# CONFIG_DEBUG_SPINLOCK is not set
+# CONFIG_DEBUG_MUTEXES is not set
+# CONFIG_DEBUG_LOCK_ALLOC is not set
+# CONFIG_PROVE_LOCKING is not set
+# CONFIG_LOCK_STAT is not set
+# CONFIG_DEBUG_SPINLOCK_SLEEP is not set
+# CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
+# CONFIG_DEBUG_KOBJECT is not set
+# CONFIG_DEBUG_BUGVERBOSE is not set
+# CONFIG_DEBUG_INFO is not set
+# CONFIG_DEBUG_VM is not set
+# CONFIG_DEBUG_LIST is not set
+# CONFIG_DEBUG_SG is not set
+CONFIG_FRAME_POINTER=3Dy
+# CONFIG_BOOT_PRINTK_DELAY is not set
+# CONFIG_RCU_TORTURE_TEST is not set
+# CONFIG_BACKTRACE_SELF_TEST is not set
+# CONFIG_FAULT_INJECTION is not set
+# CONFIG_LATENCYTOP is not set
+# CONFIG_SAMPLES is not set
+CONFIG_DEBUG_USER=3Dy
+# CONFIG_DEBUG_ERRORS is not set
+# CONFIG_DEBUG_STACK_USAGE is not set
+# CONFIG_DEBUG_LL is not set
+
+#
+# Security options
+#
+# CONFIG_KEYS is not set
+# CONFIG_SECURITY is not set
+# CONFIG_SECURITY_FILE_CAPABILITIES is not set
+# CONFIG_CRYPTO is not set
+
+#
+# Library routines
+#
+CONFIG_BITREVERSE=3Dy
+CONFIG_CRC_CCITT=3Dy
+# CONFIG_CRC16 is not set
+# CONFIG_CRC_ITU_T is not set
+CONFIG_CRC32=3Dy
+# CONFIG_CRC7 is not set
+# CONFIG_LIBCRC32C is not set
+CONFIG_ZLIB_INFLATE=3Dy
+CONFIG_ZLIB_DEFLATE=3Dy
+CONFIG_PLIST=3Dy
+CONFIG_HAS_IOMEM=3Dy
+CONFIG_HAS_IOPORT=3Dy
+CONFIG_HAS_DMA=3Dy
diff --git a/recipes/linux/linux-replicant/htcpolaris/defconfig b/recipes/l=
inux/linux-replicant/htcpolaris/defconfig
new file mode 100644
index 0000000..eb0979c
--- /dev/null
+++ b/recipes/linux/linux-replicant/htcpolaris/defconfig
@@ -0,0 +1,1009 @@
+#
+# Automatically generated make config: don't edit
+# Linux kernel version: 2.6.25
+# Wed Feb 25 00:39:08 2009
+#
+CONFIG_ARM=3Dy
+CONFIG_SYS_SUPPORTS_APM_EMULATION=3Dy
+# CONFIG_GENERIC_GPIO is not set
+CONFIG_GENERIC_TIME=3Dy
+CONFIG_GENERIC_CLOCKEVENTS=3Dy
+CONFIG_MMU=3Dy
+# CONFIG_NO_IOPORT is not set
+CONFIG_GENERIC_HARDIRQS=3Dy
+CONFIG_STACKTRACE_SUPPORT=3Dy
+CONFIG_HAVE_LATENCYTOP_SUPPORT=3Dy
+CONFIG_LOCKDEP_SUPPORT=3Dy
+CONFIG_TRACE_IRQFLAGS_SUPPORT=3Dy
+CONFIG_HARDIRQS_SW_RESEND=3Dy
+CONFIG_GENERIC_IRQ_PROBE=3Dy
+CONFIG_RWSEM_GENERIC_SPINLOCK=3Dy
+# CONFIG_ARCH_HAS_ILOG2_U32 is not set
+# CONFIG_ARCH_HAS_ILOG2_U64 is not set
+CONFIG_GENERIC_HWEIGHT=3Dy
+CONFIG_GENERIC_CALIBRATE_DELAY=3Dy
+CONFIG_ARCH_SUPPORTS_AOUT=3Dy
+CONFIG_ZONE_DMA=3Dy
+CONFIG_VECTORS_BASE=3D0xffff0000
+CONFIG_DEFCONFIG_LIST=3D"/lib/modules/$UNAME_RELEASE/.config"
+
+#
+# General setup
+#
+CONFIG_EXPERIMENTAL=3Dy
+CONFIG_BROKEN_ON_SMP=3Dy
+CONFIG_LOCK_KERNEL=3Dy
+CONFIG_INIT_ENV_ARG_LIMIT=3D32
+CONFIG_LOCALVERSION=3D""
+CONFIG_LOCALVERSION_AUTO=3Dy
+CONFIG_SWAP=3Dy
+# CONFIG_SYSVIPC is not set
+# CONFIG_POSIX_MQUEUE is not set
+# CONFIG_BSD_PROCESS_ACCT is not set
+# CONFIG_TASKSTATS is not set
+# CONFIG_AUDIT is not set
+CONFIG_IKCONFIG=3Dy
+CONFIG_IKCONFIG_PROC=3Dy
+CONFIG_LOG_BUF_SHIFT=3D17
+# CONFIG_CGROUPS is not set
+CONFIG_GROUP_SCHED=3Dy
+CONFIG_FAIR_GROUP_SCHED=3Dy
+# CONFIG_RT_GROUP_SCHED is not set
+CONFIG_USER_SCHED=3Dy
+# CONFIG_CGROUP_SCHED is not set
+CONFIG_SYSFS_DEPRECATED=3Dy
+CONFIG_SYSFS_DEPRECATED_V2=3Dy
+# CONFIG_RELAY is not set
+# CONFIG_NAMESPACES is not set
+CONFIG_BLK_DEV_INITRD=3Dy
+CONFIG_INITRAMFS_SOURCE=3D""
+# CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
+CONFIG_SYSCTL=3Dy
+CONFIG_PANIC_TIMEOUT=3D0
+CONFIG_EMBEDDED=3Dy
+CONFIG_UID16=3Dy
+CONFIG_SYSCTL_SYSCALL=3Dy
+CONFIG_KALLSYMS=3Dy
+# CONFIG_KALLSYMS_ALL is not set
+# CONFIG_KALLSYMS_EXTRA_PASS is not set
+CONFIG_HOTPLUG=3Dy
+CONFIG_PRINTK=3Dy
+CONFIG_BUG=3Dy
+CONFIG_ELF_CORE=3Dy
+CONFIG_COMPAT_BRK=3Dy
+CONFIG_BASE_FULL=3Dy
+CONFIG_FUTEX=3Dy
+CONFIG_ANON_INODES=3Dy
+CONFIG_EPOLL=3Dy
+CONFIG_SIGNALFD=3Dy
+CONFIG_TIMERFD=3Dy
+CONFIG_EVENTFD=3Dy
+CONFIG_SHMEM=3Dy
+CONFIG_ASHMEM=3Dy
+CONFIG_VM_EVENT_COUNTERS=3Dy
+CONFIG_SLAB=3Dy
+# CONFIG_SLUB is not set
+# CONFIG_SLOB is not set
+# CONFIG_PROFILING is not set
+# CONFIG_MARKERS is not set
+CONFIG_HAVE_OPROFILE=3Dy
+# CONFIG_KPROBES is not set
+CONFIG_HAVE_KPROBES=3Dy
+CONFIG_HAVE_KRETPROBES=3Dy
+CONFIG_PROC_PAGE_MONITOR=3Dy
+CONFIG_SLABINFO=3Dy
+CONFIG_RT_MUTEXES=3Dy
+# CONFIG_TINY_SHMEM is not set
+CONFIG_BASE_SMALL=3D0
+CONFIG_MODULES=3Dy
+CONFIG_MODULE_UNLOAD=3Dy
+# CONFIG_MODULE_FORCE_UNLOAD is not set
+CONFIG_MODVERSIONS=3Dy
+# CONFIG_MODULE_SRCVERSION_ALL is not set
+# CONFIG_KMOD is not set
+CONFIG_BLOCK=3Dy
+# CONFIG_LBD is not set
+# CONFIG_BLK_DEV_IO_TRACE is not set
+# CONFIG_LSF is not set
+# CONFIG_BLK_DEV_BSG is not set
+
+#
+# IO Schedulers
+#
+CONFIG_IOSCHED_NOOP=3Dy
+CONFIG_IOSCHED_AS=3Dy
+# CONFIG_IOSCHED_DEADLINE is not set
+# CONFIG_IOSCHED_CFQ is not set
+CONFIG_DEFAULT_AS=3Dy
+# CONFIG_DEFAULT_DEADLINE is not set
+# CONFIG_DEFAULT_CFQ is not set
+# CONFIG_DEFAULT_NOOP is not set
+CONFIG_DEFAULT_IOSCHED=3D"anticipatory"
+CONFIG_CLASSIC_RCU=3Dy
+
+#
+# System Type
+#
+# CONFIG_ARCH_AAEC2000 is not set
+# CONFIG_ARCH_GOLDFISH is not set
+# CONFIG_ARCH_INTEGRATOR is not set
+# CONFIG_ARCH_REALVIEW is not set
+# CONFIG_ARCH_VERSATILE is not set
+# CONFIG_ARCH_AT91 is not set
+# CONFIG_ARCH_CLPS7500 is not set
+# CONFIG_ARCH_CLPS711X is not set
+# CONFIG_ARCH_CO285 is not set
+# CONFIG_ARCH_EBSA110 is not set
+# CONFIG_ARCH_EP93XX is not set
+# CONFIG_ARCH_FOOTBRIDGE is not set
+# CONFIG_ARCH_NETX is not set
+# CONFIG_ARCH_H720X is not set
+# CONFIG_ARCH_IMX is not set
+# CONFIG_ARCH_IOP13XX is not set
+# CONFIG_ARCH_IOP32X is not set
+# CONFIG_ARCH_IOP33X is not set
+# CONFIG_ARCH_IXP23XX is not set
+# CONFIG_ARCH_IXP2000 is not set
+# CONFIG_ARCH_IXP4XX is not set
+# CONFIG_ARCH_L7200 is not set
+# CONFIG_ARCH_KS8695 is not set
+# CONFIG_ARCH_NS9XXX is not set
+# CONFIG_ARCH_MXC is not set
+# CONFIG_ARCH_ORION is not set
+# CONFIG_ARCH_PNX4008 is not set
+# CONFIG_ARCH_PXA is not set
+# CONFIG_ARCH_RPC is not set
+# CONFIG_ARCH_SA1100 is not set
+# CONFIG_ARCH_S3C2410 is not set
+# CONFIG_ARCH_SHARK is not set
+# CONFIG_ARCH_LH7A40X is not set
+# CONFIG_ARCH_DAVINCI is not set
+# CONFIG_ARCH_OMAP is not set
+CONFIG_ARCH_MSM7X00A=3Dy
+
+#
+# Boot options
+#
+
+#
+# Power management
+#
+CONFIG_MSM_AMSS_VERSION=3D6210
+CONFIG_MSM_AMSS_VERSION_6210=3Dy
+# CONFIG_MSM_AMSS_VERSION_6220 is not set
+# CONFIG_MSM_AMSS_VERSION_6225 is not set
+# CONFIG_MACH_HALIBUT is not set
+CONFIG_MACH_HTCVOGUE=3Dy
+CONFIG_MACH_HTCKAISER=3Dy
+CONFIG_MACH_HTCPOLARIS=3Dy
+CONFIG_MACH_HTCNIKE=3Dy
+# CONFIG_HTCTITAN is not set
+CONFIG_VOGUE_TS=3Dy
+CONFIG_MSM_VOGUESMD=3Dy
+# CONFIG_MSM_LL_DEBUG_UART1 is not set
+# CONFIG_MSM_LL_DEBUG_UART2 is not set
+# CONFIG_MSM_LL_DEBUG_UART3 is not set
+CONFIG_MSM_LL_DEBUG_NONE=3Dy
+CONFIG_MSM7X00A_IDLE=3Dy
+# CONFIG_MSM7X00A_USE_GP_TIMER is not set
+CONFIG_MSM7X00A_USE_DG_TIMER=3Dy
+# CONFIG_MSM7X00A_SLEEP_MODE_POWER_COLLAPSE_SUSPEND is not set
+CONFIG_MSM7X00A_SLEEP_MODE_POWER_COLLAPSE=3Dy
+# CONFIG_MSM7X00A_SLEEP_MODE_APPS_SLEEP is not set
+# CONFIG_MSM7X00A_SLEEP_MODE_RAMP_DOWN_AND_WAIT_FOR_INTERRUPT is not set
+# CONFIG_MSM7X00A_SLEEP_WAIT_FOR_INTERRUPT is not set
+CONFIG_MSM7X00A_SLEEP_MODE=3D1
+# CONFIG_MSM7X00A_IDLE_SLEEP_MODE_POWER_COLLAPSE_SUSPEND is not set
+# CONFIG_MSM7X00A_IDLE_SLEEP_MODE_POWER_COLLAPSE is not set
+# CONFIG_MSM7X00A_IDLE_SLEEP_MODE_APPS_SLEEP is not set
+CONFIG_MSM7X00A_IDLE_SLEEP_MODE_RAMP_DOWN_AND_WAIT_FOR_INTERRUPT=3Dy
+# CONFIG_MSM7X00A_IDLE_SLEEP_WAIT_FOR_INTERRUPT is not set
+CONFIG_MSM7X00A_IDLE_SLEEP_MODE=3D3
+CONFIG_MSM7X00A_IDLE_SLEEP_MIN_TIME=3D20000000
+CONFIG_MSM7X00A_IDLE_SPIN_TIME=3D80000
+# CONFIG_MSM_IDLE_STATS is not set
+# CONFIG_MSM_FIQ_SUPPORT is not set
+# CONFIG_MSM_SERIAL_DEBUGGER is not set
+# CONFIG_MSM_SMD is not set
+# CONFIG_MSM_ONCRPCROUTER is not set
+# CONFIG_MSM_HW3D is not set
+CONFIG_MSM_ADSP=3Dy
+# CONFIG_MSM_PERF is not set
+
+#
+# Processor Type
+#
+CONFIG_CPU_32=3Dy
+CONFIG_CPU_V6=3Dy
+# CONFIG_CPU_32v6K is not set
+CONFIG_CPU_32v6=3Dy
+CONFIG_CPU_ABRT_EV6=3Dy
+CONFIG_CPU_CACHE_V6=3Dy
+CONFIG_CPU_CACHE_VIPT=3Dy
+CONFIG_CPU_COPY_V6=3Dy
+CONFIG_CPU_TLB_V6=3Dy
+CONFIG_CPU_HAS_ASID=3Dy
+CONFIG_CPU_CP15=3Dy
+CONFIG_CPU_CP15_MMU=3Dy
+
+#
+# Processor Features
+#
+CONFIG_ARM_THUMB=3Dy
+# CONFIG_CPU_ICACHE_DISABLE is not set
+# CONFIG_CPU_DCACHE_DISABLE is not set
+# CONFIG_CPU_BPREDICT_DISABLE is not set
+# CONFIG_OUTER_CACHE is not set
+
+#
+# Bus support
+#
+# CONFIG_PCI_SYSCALL is not set
+# CONFIG_ARCH_SUPPORTS_MSI is not set
+# CONFIG_PCCARD is not set
+
+#
+# Kernel Features
+#
+CONFIG_TICK_ONESHOT=3Dy
+CONFIG_NO_HZ=3Dy
+CONFIG_HIGH_RES_TIMERS=3Dy
+CONFIG_GENERIC_CLOCKEVENTS_BUILD=3Dy
+CONFIG_PREEMPT=3Dy
+CONFIG_HZ=3D100
+CONFIG_AEABI=3Dy
+# CONFIG_OABI_COMPAT is not set
+# CONFIG_ARCH_DISCONTIGMEM_ENABLE is not set
+CONFIG_SELECT_MEMORY_MODEL=3Dy
+CONFIG_FLATMEM_MANUAL=3Dy
+# CONFIG_DISCONTIGMEM_MANUAL is not set
+# CONFIG_SPARSEMEM_MANUAL is not set
+CONFIG_FLATMEM=3Dy
+CONFIG_FLAT_NODE_MEM_MAP=3Dy
+# CONFIG_SPARSEMEM_STATIC is not set
+# CONFIG_SPARSEMEM_VMEMMAP_ENABLE is not set
+CONFIG_SPLIT_PTLOCK_CPUS=3D4
+CONFIG_RESOURCES_64BIT=3Dy
+CONFIG_ZONE_DMA_FLAG=3D1
+CONFIG_BOUNCE=3Dy
+CONFIG_VIRT_TO_BUS=3Dy
+CONFIG_ALIGNMENT_TRAP=3Dy
+
+#
+# Boot options
+#
+CONFIG_ZBOOT_ROM_TEXT=3D0x0
+CONFIG_ZBOOT_ROM_BSS=3D0x0
+CONFIG_CMDLINE=3D""
+# CONFIG_XIP_KERNEL is not set
+# CONFIG_KEXEC is not set
+
+#
+# CPU Frequency scaling
+#
+# CONFIG_CPU_FREQ is not set
+
+#
+# Floating point emulation
+#
+
+#
+# At least one emulation must be selected
+#
+# CONFIG_VFP is not set
+
+#
+# Userspace binary formats
+#
+CONFIG_BINFMT_ELF=3Dy
+# CONFIG_BINFMT_AOUT is not set
+# CONFIG_BINFMT_MISC is not set
+
+#
+# Power management options
+#
+CONFIG_PM=3Dy
+# CONFIG_PM_LEGACY is not set
+CONFIG_PM_DEBUG=3Dy
+# CONFIG_PM_VERBOSE is not set
+CONFIG_CAN_PM_TRACE=3Dy
+CONFIG_PM_SLEEP=3Dy
+CONFIG_SUSPEND=3Dy
+CONFIG_SUSPEND_FREEZER=3Dy
+# CONFIG_APM_EMULATION is not set
+CONFIG_ARCH_SUSPEND_POSSIBLE=3Dy
+
+#
+# Networking
+#
+CONFIG_NET=3Dy
+
+#
+# Networking options
+#
+# CONFIG_PACKET is not set
+CONFIG_UNIX=3Dy
+# CONFIG_NET_KEY is not set
+CONFIG_INET=3Dy
+# CONFIG_IP_MULTICAST is not set
+# CONFIG_IP_ADVANCED_ROUTER is not set
+CONFIG_IP_FIB_HASH=3Dy
+# CONFIG_IP_PNP is not set
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
+# CONFIG_TCP_CONG_ADVANCED is not set
+CONFIG_TCP_CONG_CUBIC=3Dy
+CONFIG_DEFAULT_TCP_CONG=3D"cubic"
+# CONFIG_TCP_MD5SIG is not set
+# CONFIG_IPV6 is not set
+# CONFIG_INET6_XFRM_TUNNEL is not set
+# CONFIG_INET6_TUNNEL is not set
+# CONFIG_NETWORK_SECMARK is not set
+# CONFIG_NETFILTER is not set
+# CONFIG_IP_DCCP is not set
+# CONFIG_IP_SCTP is not set
+# CONFIG_TIPC is not set
+# CONFIG_ATM is not set
+# CONFIG_BRIDGE is not set
+# CONFIG_VLAN_8021Q is not set
+# CONFIG_DECNET is not set
+# CONFIG_LLC2 is not set
+# CONFIG_IPX is not set
+# CONFIG_ATALK is not set
+# CONFIG_X25 is not set
+# CONFIG_LAPB is not set
+# CONFIG_ECONET is not set
+# CONFIG_WAN_ROUTER is not set
+# CONFIG_NET_SCHED is not set
+
+#
+# Network testing
+#
+# CONFIG_NET_PKTGEN is not set
+# CONFIG_HAMRADIO is not set
+# CONFIG_CAN is not set
+# CONFIG_IRDA is not set
+CONFIG_BT=3Dy
+# CONFIG_BT_L2CAP is not set
+# CONFIG_BT_SCO is not set
+
+#
+# Bluetooth device drivers
+#
+# CONFIG_BT_HCIBTSDIO is not set
+CONFIG_BT_HCIUART=3Dy
+CONFIG_BT_HCIUART_H4=3Dy
+# CONFIG_BT_HCIUART_BCSP is not set
+# CONFIG_BT_HCIUART_LL is not set
+# CONFIG_BT_HCIUART_LL_USE_MSM_SERIAL_CLOCK_CONTROL is not set
+# CONFIG_BT_HCIVHCI is not set
+# CONFIG_AF_RXRPC is not set
+
+#
+# Wireless
+#
+# CONFIG_CFG80211 is not set
+# CONFIG_WIRELESS_EXT is not set
+# CONFIG_MAC80211 is not set
+# CONFIG_IEEE80211 is not set
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
+# CONFIG_DEBUG_DRIVER is not set
+# CONFIG_DEBUG_DEVRES is not set
+# CONFIG_SYS_HYPERVISOR is not set
+# CONFIG_CONNECTOR is not set
+# CONFIG_MTD is not set
+# CONFIG_PARPORT is not set
+CONFIG_BLK_DEV=3Dy
+# CONFIG_BLK_DEV_COW_COMMON is not set
+CONFIG_BLK_DEV_LOOP=3Dy
+# CONFIG_BLK_DEV_CRYPTOLOOP is not set
+# CONFIG_BLK_DEV_NBD is not set
+# CONFIG_BLK_DEV_RAM is not set
+# CONFIG_CDROM_PKTCDVD is not set
+# CONFIG_ATA_OVER_ETH is not set
+CONFIG_MISC_DEVICES=3Dy
+# CONFIG_EEPROM_93CX6 is not set
+CONFIG_LOW_MEMORY_KILLER=3Dy
+CONFIG_KERNEL_DEBUGGER_CORE=3Dy
+# CONFIG_ENCLOSURE_SERVICES is not set
+# CONFIG_HAVE_IDE is not set
+
+#
+# SCSI device support
+#
+# CONFIG_RAID_ATTRS is not set
+# CONFIG_SCSI is not set
+# CONFIG_SCSI_DMA is not set
+# CONFIG_SCSI_NETLINK is not set
+# CONFIG_ATA is not set
+# CONFIG_MD is not set
+CONFIG_NETDEVICES=3Dy
+# CONFIG_NETDEVICES_MULTIQUEUE is not set
+# CONFIG_DUMMY is not set
+# CONFIG_BONDING is not set
+# CONFIG_MACVLAN is not set
+# CONFIG_EQUALIZER is not set
+# CONFIG_TUN is not set
+# CONFIG_VETH is not set
+# CONFIG_NET_ETHERNET is not set
+# CONFIG_NETDEV_1000 is not set
+# CONFIG_NETDEV_10000 is not set
+
+#
+# Wireless LAN
+#
+# CONFIG_WLAN_PRE80211 is not set
+# CONFIG_WLAN_80211 is not set
+# CONFIG_WAN is not set
+CONFIG_PPP=3Dy
+# CONFIG_PPP_MULTILINK is not set
+# CONFIG_PPP_FILTER is not set
+CONFIG_PPP_ASYNC=3Dy
+# CONFIG_PPP_SYNC_TTY is not set
+CONFIG_PPP_DEFLATE=3Dy
+CONFIG_PPP_BSDCOMP=3Dy
+# CONFIG_PPP_MPPE is not set
+# CONFIG_PPPOE is not set
+# CONFIG_PPPOL2TP is not set
+# CONFIG_SLIP is not set
+CONFIG_SLHC=3Dy
+# CONFIG_NETCONSOLE is not set
+# CONFIG_MSM_RMNET is not set
+# CONFIG_NETPOLL is not set
+# CONFIG_NET_POLL_CONTROLLER is not set
+# CONFIG_ISDN is not set
+
+#
+# Input device support
+#
+CONFIG_INPUT=3Dy
+# CONFIG_INPUT_FF_MEMLESS is not set
+# CONFIG_INPUT_POLLDEV is not set
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
+# CONFIG_KEYBOARD_ATKBD is not set
+# CONFIG_KEYBOARD_SUNKBD is not set
+# CONFIG_KEYBOARD_LKKBD is not set
+# CONFIG_KEYBOARD_XTKBD is not set
+# CONFIG_KEYBOARD_NEWTON is not set
+# CONFIG_KEYBOARD_STOWAWAY is not set
+# CONFIG_KEYBOARD_GOLDFISH_EVENTS is not set
+# CONFIG_INPUT_MOUSE is not set
+# CONFIG_INPUT_JOYSTICK is not set
+# CONFIG_INPUT_TABLET is not set
+# CONFIG_INPUT_TOUCHSCREEN is not set
+CONFIG_INPUT_MISC=3Dy
+# CONFIG_INPUT_UINPUT is not set
+CONFIG_INPUT_GPIO=3Dy
+
+#
+# Hardware I/O ports
+#
+# CONFIG_SERIO is not set
+# CONFIG_GAMEPORT is not set
+
+#
+# Character devices
+#
+CONFIG_VT=3Dy
+CONFIG_VT_CONSOLE=3Dy
+CONFIG_HW_CONSOLE=3Dy
+CONFIG_VT_HW_CONSOLE_BINDING=3Dy
+# CONFIG_SERIAL_NONSTANDARD is not set
+
+#
+# Serial drivers
+#
+# CONFIG_SERIAL_8250 is not set
+
+#
+# Non-8250 serial port support
+#
+CONFIG_SERIAL_CORE=3Dy
+CONFIG_SERIAL_CORE_CONSOLE=3Dy
+CONFIG_SERIAL_MSM=3Dy
+CONFIG_SERIAL_MSM_CONSOLE=3Dy
+CONFIG_SERIAL_MSM_CLOCK_CONTROL=3Dy
+# CONFIG_SERIAL_MSM_RX_WAKEUP is not set
+CONFIG_UNIX98_PTYS=3Dy
+# CONFIG_LEGACY_PTYS is not set
+# CONFIG_IPMI_HANDLER is not set
+# CONFIG_HW_RANDOM is not set
+# CONFIG_NVRAM is not set
+# CONFIG_R3964 is not set
+# CONFIG_RAW_DRIVER is not set
+# CONFIG_TCG_TPM is not set
+CONFIG_DEVMEM=3Dy
+# CONFIG_GOLDFISH_TTY is not set
+# CONFIG_DCC_TTY is not set
+CONFIG_I2C=3Dy
+CONFIG_I2C_BOARDINFO=3Dy
+# CONFIG_I2C_CHARDEV is not set
+
+#
+# I2C Algorithms
+#
+# CONFIG_I2C_ALGOBIT is not set
+# CONFIG_I2C_ALGOPCF is not set
+# CONFIG_I2C_ALGOPCA is not set
+
+#
+# I2C Hardware Bus support
+#
+CONFIG_I2C_MSM=3Dy
+# CONFIG_I2C_OCORES is not set
+# CONFIG_I2C_PARPORT_LIGHT is not set
+# CONFIG_I2C_SIMTEC is not set
+# CONFIG_I2C_TAOS_EVM is not set
+# CONFIG_I2C_STUB is not set
+
+#
+# Miscellaneous I2C Chip support
+#
+# CONFIG_DS1682 is not set
+# CONFIG_SENSORS_EEPROM is not set
+# CONFIG_SENSORS_PCF8574 is not set
+# CONFIG_PCF8575 is not set
+# CONFIG_SENSORS_PCF8591 is not set
+# CONFIG_TPS65010 is not set
+# CONFIG_SENSORS_MAX6875 is not set
+# CONFIG_SENSORS_TSL2550 is not set
+CONFIG_S5K4B1FX=3Dy
+# CONFIG_I2C_DEBUG_CORE is not set
+# CONFIG_I2C_DEBUG_ALGO is not set
+# CONFIG_I2C_DEBUG_BUS is not set
+# CONFIG_I2C_DEBUG_CHIP is not set
+
+#
+# SPI support
+#
+# CONFIG_SPI is not set
+# CONFIG_SPI_MASTER is not set
+# CONFIG_W1 is not set
+CONFIG_POWER_SUPPLY=3Dy
+# CONFIG_POWER_SUPPLY_DEBUG is not set
+# CONFIG_PDA_POWER is not set
+# CONFIG_BATTERY_DS2760 is not set
+# CONFIG_BATTERY_GOLDFISH is not set
+# CONFIG_HWMON is not set
+# CONFIG_WATCHDOG is not set
+
+#
+# Sonics Silicon Backplane
+#
+CONFIG_SSB_POSSIBLE=3Dy
+# CONFIG_SSB is not set
+
+#
+# Multifunction device drivers
+#
+# CONFIG_MFD_SM501 is not set
+# CONFIG_HTC_EGPIO is not set
+
+#
+# Multimedia devices
+#
+# CONFIG_VIDEO_DEV is not set
+# CONFIG_DVB_CORE is not set
+CONFIG_DAB=3Dy
+
+#
+# Graphics support
+#
+# CONFIG_VGASTATE is not set
+CONFIG_VIDEO_OUTPUT_CONTROL=3Dy
+CONFIG_FB=3Dy
+# CONFIG_FIRMWARE_EDID is not set
+# CONFIG_FB_DDC is not set
+CONFIG_FB_CFB_FILLRECT=3Dy
+CONFIG_FB_CFB_COPYAREA=3Dy
+CONFIG_FB_CFB_IMAGEBLIT=3Dy
+# CONFIG_FB_CFB_REV_PIXELS_IN_BYTE is not set
+# CONFIG_FB_SYS_FILLRECT is not set
+# CONFIG_FB_SYS_COPYAREA is not set
+# CONFIG_FB_SYS_IMAGEBLIT is not set
+# CONFIG_FB_SYS_FOPS is not set
+CONFIG_FB_DEFERRED_IO=3Dy
+# CONFIG_FB_SVGALIB is not set
+# CONFIG_FB_MACMODES is not set
+# CONFIG_FB_BACKLIGHT is not set
+CONFIG_FB_MODE_HELPERS=3Dy
+CONFIG_FB_TILEBLITTING=3Dy
+
+#
+# Frame buffer hardware drivers
+#
+# CONFIG_FB_S1D13XXX is not set
+# CONFIG_FB_GOLDFISH is not set
+CONFIG_FB_MSM=3Dy
+# CONFIG_FB_MSM_LOGO is not set
+# CONFIG_FB_MSM_REFRESH is not set
+# CONFIG_FB_VIRTUAL is not set
+# CONFIG_BACKLIGHT_LCD_SUPPORT is not set
+
+#
+# Display device support
+#
+# CONFIG_DISPLAY_SUPPORT is not set
+
+#
+# Console display driver support
+#
+# CONFIG_VGA_CONSOLE is not set
+CONFIG_DUMMY_CONSOLE=3Dy
+CONFIG_FRAMEBUFFER_CONSOLE=3Dy
+CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY=3Dy
+CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=3Dy
+CONFIG_FONTS=3Dy
+CONFIG_FONT_8x8=3Dy
+# CONFIG_FONT_8x16 is not set
+# CONFIG_FONT_6x11 is not set
+# CONFIG_FONT_7x14 is not set
+# CONFIG_FONT_PEARL_8x8 is not set
+# CONFIG_FONT_ACORN_8x8 is not set
+# CONFIG_FONT_MINI_4x6 is not set
+# CONFIG_FONT_SUN8x16 is not set
+# CONFIG_FONT_SUN12x22 is not set
+# CONFIG_FONT_10x18 is not set
+CONFIG_LOGO=3Dy
+# CONFIG_LOGO_LINUX_MONO is not set
+# CONFIG_LOGO_LINUX_VGA16 is not set
+CONFIG_LOGO_LINUX_CLUT224=3Dy
+
+#
+# Sound
+#
+# CONFIG_SOUND is not set
+# CONFIG_HID_SUPPORT is not set
+# CONFIG_USB_SUPPORT is not set
+CONFIG_MMC=3Dy
+# CONFIG_MMC_DEBUG is not set
+# CONFIG_MMC_UNSAFE_RESUME is not set
+CONFIG_MMC_EMBEDDED_SDIO=3Dy
+
+#
+# MMC/SD Card Drivers
+#
+CONFIG_MMC_BLOCK=3Dy
+# CONFIG_MMC_BLOCK_BOUNCE is not set
+# CONFIG_SDIO_UART is not set
+# CONFIG_MMC_TEST is not set
+
+#
+# MMC/SD Host Controller Drivers
+#
+CONFIG_MMC_MSM7X00A=3Dy
+CONFIG_NEW_LEDS=3Dy
+CONFIG_LEDS_CLASS=3Dy
+
+#
+# LED drivers
+#
+
+#
+# LED Triggers
+#
+# CONFIG_LEDS_TRIGGERS is not set
+# CONFIG_SWITCH is not set
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
+# I2C RTC drivers
+#
+# CONFIG_RTC_DRV_DS1307 is not set
+# CONFIG_RTC_DRV_DS1374 is not set
+# CONFIG_RTC_DRV_DS1672 is not set
+# CONFIG_RTC_DRV_MAX6900 is not set
+# CONFIG_RTC_DRV_RS5C372 is not set
+# CONFIG_RTC_DRV_ISL1208 is not set
+# CONFIG_RTC_DRV_X1205 is not set
+# CONFIG_RTC_DRV_PCF8563 is not set
+# CONFIG_RTC_DRV_PCF8583 is not set
+# CONFIG_RTC_DRV_M41T80 is not set
+# CONFIG_RTC_DRV_S35390A is not set
+
+#
+# SPI RTC drivers
+#
+
+#
+# Platform RTC drivers
+#
+# CONFIG_RTC_DRV_CMOS is not set
+# CONFIG_RTC_DRV_DS1511 is not set
+# CONFIG_RTC_DRV_DS1553 is not set
+# CONFIG_RTC_DRV_DS1742 is not set
+# CONFIG_RTC_DRV_STK17TA8 is not set
+# CONFIG_RTC_DRV_M48T86 is not set
+# CONFIG_RTC_DRV_M48T59 is not set
+# CONFIG_RTC_DRV_V3020 is not set
+
+#
+# on-CPU RTC drivers
+#
+# CONFIG_RTC_DRV_GOLDFISH is not set
+# CONFIG_RTC_DRV_MSM7X00A is not set
+CONFIG_RTC_DRV_MSM7X00=3Dy
+
+#
+# Android
+#
+CONFIG_ANDROID_BINDER_IPC=3Dy
+# CONFIG_ANDROID_PMEM is not set
+CONFIG_ANDROID_POWER=3Dy
+CONFIG_ANDROID_POWER_STAT=3Dy
+CONFIG_ANDROID_POWER_ALARM=3Dy
+CONFIG_ANDROID_LOGGER=3Dy
+CONFIG_ANDROID_RAM_CONSOLE=3Dy
+CONFIG_ANDROID_RAM_CONSOLE_ENABLE_VERBOSE=3Dy
+# CONFIG_ANDROID_RAM_CONSOLE_ERROR_CORRECTION is not set
+# CONFIG_ANDROID_RAM_CONSOLE_EARLY_INIT is not set
+CONFIG_ANDROID_PARANOID_NETWORK=3Dy
+
+#
+# File systems
+#
+CONFIG_EXT2_FS=3Dy
+CONFIG_EXT2_FS_XATTR=3Dy
+# CONFIG_EXT2_FS_POSIX_ACL is not set
+# CONFIG_EXT2_FS_SECURITY is not set
+# CONFIG_EXT2_FS_XIP is not set
+CONFIG_EXT3_FS=3Dy
+CONFIG_EXT3_FS_XATTR=3Dy
+# CONFIG_EXT3_FS_POSIX_ACL is not set
+# CONFIG_EXT3_FS_SECURITY is not set
+# CONFIG_EXT4DEV_FS is not set
+CONFIG_JBD=3Dy
+CONFIG_FS_MBCACHE=3Dy
+# CONFIG_REISERFS_FS is not set
+# CONFIG_JFS_FS is not set
+# CONFIG_FS_POSIX_ACL is not set
+# CONFIG_XFS_FS is not set
+# CONFIG_GFS2_FS is not set
+# CONFIG_OCFS2_FS is not set
+CONFIG_DNOTIFY=3Dy
+CONFIG_INOTIFY=3Dy
+CONFIG_INOTIFY_USER=3Dy
+# CONFIG_QUOTA is not set
+# CONFIG_AUTOFS_FS is not set
+# CONFIG_AUTOFS4_FS is not set
+# CONFIG_FUSE_FS is not set
+
+#
+# CD-ROM/DVD Filesystems
+#
+# CONFIG_ISO9660_FS is not set
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
+# CONFIG_NTFS_FS is not set
+
+#
+# Pseudo filesystems
+#
+CONFIG_PROC_FS=3Dy
+CONFIG_PROC_SYSCTL=3Dy
+CONFIG_SYSFS=3Dy
+CONFIG_TMPFS=3Dy
+# CONFIG_TMPFS_POSIX_ACL is not set
+# CONFIG_HUGETLB_PAGE is not set
+# CONFIG_CONFIGFS_FS is not set
+
+#
+# Miscellaneous filesystems
+#
+# CONFIG_ADFS_FS is not set
+# CONFIG_AFFS_FS is not set
+# CONFIG_HFS_FS is not set
+# CONFIG_HFSPLUS_FS is not set
+# CONFIG_BEFS_FS is not set
+# CONFIG_BFS_FS is not set
+# CONFIG_EFS_FS is not set
+CONFIG_CRAMFS=3Dy
+# CONFIG_VXFS_FS is not set
+# CONFIG_MINIX_FS is not set
+# CONFIG_HPFS_FS is not set
+# CONFIG_QNX4FS_FS is not set
+# CONFIG_ROMFS_FS is not set
+# CONFIG_SYSV_FS is not set
+# CONFIG_UFS_FS is not set
+CONFIG_NETWORK_FILESYSTEMS=3Dy
+# CONFIG_NFS_FS is not set
+# CONFIG_NFSD is not set
+# CONFIG_SMB_FS is not set
+# CONFIG_CIFS is not set
+# CONFIG_NCP_FS is not set
+# CONFIG_CODA_FS is not set
+# CONFIG_AFS_FS is not set
+
+#
+# Partition Types
+#
+CONFIG_PARTITION_ADVANCED=3Dy
+# CONFIG_ACORN_PARTITION is not set
+# CONFIG_OSF_PARTITION is not set
+# CONFIG_AMIGA_PARTITION is not set
+# CONFIG_ATARI_PARTITION is not set
+# CONFIG_MAC_PARTITION is not set
+CONFIG_MSDOS_PARTITION=3Dy
+# CONFIG_BSD_DISKLABEL is not set
+# CONFIG_MINIX_SUBPARTITION is not set
+# CONFIG_SOLARIS_X86_PARTITION is not set
+# CONFIG_UNIXWARE_DISKLABEL is not set
+# CONFIG_LDM_PARTITION is not set
+# CONFIG_SGI_PARTITION is not set
+# CONFIG_ULTRIX_PARTITION is not set
+# CONFIG_SUN_PARTITION is not set
+# CONFIG_KARMA_PARTITION is not set
+# CONFIG_EFI_PARTITION is not set
+# CONFIG_SYSV68_PARTITION is not set
+CONFIG_NLS=3Dy
+CONFIG_NLS_DEFAULT=3D"iso8859-1"
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
+# CONFIG_NLS_UTF8 is not set
+# CONFIG_DLM is not set
+
+#
+# Kernel hacking
+#
+CONFIG_PRINTK_TIME=3Dy
+CONFIG_ENABLE_WARN_DEPRECATED=3Dy
+CONFIG_ENABLE_MUST_CHECK=3Dy
+CONFIG_MAGIC_SYSRQ=3Dy
+# CONFIG_UNUSED_SYMBOLS is not set
+# CONFIG_DEBUG_FS is not set
+# CONFIG_HEADERS_CHECK is not set
+CONFIG_DEBUG_KERNEL=3Dy
+# CONFIG_DEBUG_SHIRQ is not set
+CONFIG_DETECT_SOFTLOCKUP=3Dy
+CONFIG_SCHED_DEBUG=3Dy
+# CONFIG_SCHEDSTATS is not set
+# CONFIG_TIMER_STATS is not set
+# CONFIG_DEBUG_SLAB is not set
+CONFIG_DEBUG_PREEMPT=3Dy
+# CONFIG_DEBUG_RT_MUTEXES is not set
+# CONFIG_RT_MUTEX_TESTER is not set
+# CONFIG_DEBUG_SPINLOCK is not set
+# CONFIG_DEBUG_MUTEXES is not set
+# CONFIG_DEBUG_LOCK_ALLOC is not set
+# CONFIG_PROVE_LOCKING is not set
+# CONFIG_LOCK_STAT is not set
+# CONFIG_DEBUG_SPINLOCK_SLEEP is not set
+# CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
+# CONFIG_DEBUG_KOBJECT is not set
+# CONFIG_DEBUG_BUGVERBOSE is not set
+# CONFIG_DEBUG_INFO is not set
+# CONFIG_DEBUG_VM is not set
+# CONFIG_DEBUG_LIST is not set
+# CONFIG_DEBUG_SG is not set
+CONFIG_FRAME_POINTER=3Dy
+# CONFIG_BOOT_PRINTK_DELAY is not set
+# CONFIG_RCU_TORTURE_TEST is not set
+# CONFIG_BACKTRACE_SELF_TEST is not set
+# CONFIG_FAULT_INJECTION is not set
+# CONFIG_LATENCYTOP is not set
+# CONFIG_SAMPLES is not set
+CONFIG_DEBUG_USER=3Dy
+# CONFIG_DEBUG_ERRORS is not set
+# CONFIG_DEBUG_STACK_USAGE is not set
+# CONFIG_DEBUG_LL is not set
+
+#
+# Security options
+#
+# CONFIG_KEYS is not set
+# CONFIG_SECURITY is not set
+# CONFIG_SECURITY_FILE_CAPABILITIES is not set
+# CONFIG_CRYPTO is not set
+
+#
+# Library routines
+#
+CONFIG_BITREVERSE=3Dy
+CONFIG_CRC_CCITT=3Dy
+# CONFIG_CRC16 is not set
+# CONFIG_CRC_ITU_T is not set
+CONFIG_CRC32=3Dy
+# CONFIG_CRC7 is not set
+# CONFIG_LIBCRC32C is not set
+CONFIG_ZLIB_INFLATE=3Dy
+CONFIG_ZLIB_DEFLATE=3Dy
+CONFIG_PLIST=3Dy
+CONFIG_HAS_IOMEM=3Dy
+CONFIG_HAS_IOPORT=3Dy
+CONFIG_HAS_DMA=3Dy
diff --git a/recipes/linux/linux-replicant/htcraphael/defconfig b/recipes/l=
inux/linux-replicant/htcraphael/defconfig
new file mode 100644
index 0000000..88f9cd8
--- /dev/null
+++ b/recipes/linux/linux-replicant/htcraphael/defconfig
@@ -0,0 +1,1173 @@
+#
+# Automatically generated make config: don't edit
+# Linux kernel version: 2.6.27
+# Sat Mar 28 01:05:54 2009
+#
+CONFIG_ARM=3Dy
+CONFIG_SYS_SUPPORTS_APM_EMULATION=3Dy
+CONFIG_GENERIC_GPIO=3Dy
+CONFIG_GENERIC_TIME=3Dy
+CONFIG_GENERIC_CLOCKEVENTS=3Dy
+CONFIG_MMU=3Dy
+# CONFIG_NO_IOPORT is not set
+CONFIG_GENERIC_HARDIRQS=3Dy
+CONFIG_STACKTRACE_SUPPORT=3Dy
+CONFIG_HAVE_LATENCYTOP_SUPPORT=3Dy
+CONFIG_LOCKDEP_SUPPORT=3Dy
+CONFIG_TRACE_IRQFLAGS_SUPPORT=3Dy
+CONFIG_HARDIRQS_SW_RESEND=3Dy
+CONFIG_GENERIC_IRQ_PROBE=3Dy
+CONFIG_RWSEM_GENERIC_SPINLOCK=3Dy
+# CONFIG_ARCH_HAS_ILOG2_U32 is not set
+# CONFIG_ARCH_HAS_ILOG2_U64 is not set
+CONFIG_GENERIC_HWEIGHT=3Dy
+CONFIG_GENERIC_CALIBRATE_DELAY=3Dy
+CONFIG_ARCH_SUPPORTS_AOUT=3Dy
+CONFIG_ZONE_DMA=3Dy
+CONFIG_GENERIC_HARDIRQS_NO__DO_IRQ=3Dy
+CONFIG_VECTORS_BASE=3D0xffff0000
+CONFIG_DEFCONFIG_LIST=3D"/lib/modules/$UNAME_RELEASE/.config"
+
+#
+# General setup
+#
+CONFIG_EXPERIMENTAL=3Dy
+CONFIG_BROKEN_ON_SMP=3Dy
+CONFIG_LOCK_KERNEL=3Dy
+CONFIG_INIT_ENV_ARG_LIMIT=3D32
+CONFIG_LOCALVERSION=3D""
+CONFIG_LOCALVERSION_AUTO=3Dy
+CONFIG_SWAP=3Dy
+CONFIG_SYSVIPC=3Dy
+CONFIG_SYSVIPC_SYSCTL=3Dy
+CONFIG_POSIX_MQUEUE=3Dy
+# CONFIG_BSD_PROCESS_ACCT is not set
+# CONFIG_TASKSTATS is not set
+# CONFIG_AUDIT is not set
+CONFIG_IKCONFIG=3Dy
+CONFIG_IKCONFIG_PROC=3Dy
+CONFIG_LOG_BUF_SHIFT=3D17
+# CONFIG_CGROUPS is not set
+CONFIG_GROUP_SCHED=3Dy
+# CONFIG_FAIR_GROUP_SCHED is not set
+# CONFIG_RT_GROUP_SCHED is not set
+CONFIG_USER_SCHED=3Dy
+# CONFIG_CGROUP_SCHED is not set
+CONFIG_SYSFS_DEPRECATED=3Dy
+CONFIG_SYSFS_DEPRECATED_V2=3Dy
+# CONFIG_RELAY is not set
+CONFIG_NAMESPACES=3Dy
+# CONFIG_UTS_NS is not set
+# CONFIG_IPC_NS is not set
+# CONFIG_USER_NS is not set
+# CONFIG_PID_NS is not set
+CONFIG_BLK_DEV_INITRD=3Dy
+CONFIG_INITRAMFS_SOURCE=3D""
+CONFIG_CC_OPTIMIZE_FOR_SIZE=3Dy
+CONFIG_SYSCTL=3Dy
+CONFIG_PANIC_TIMEOUT=3D3
+# CONFIG_EMBEDDED is not set
+CONFIG_UID16=3Dy
+CONFIG_SYSCTL_SYSCALL=3Dy
+CONFIG_KALLSYMS=3Dy
+# CONFIG_KALLSYMS_ALL is not set
+# CONFIG_KALLSYMS_EXTRA_PASS is not set
+CONFIG_HOTPLUG=3Dy
+CONFIG_PRINTK=3Dy
+CONFIG_BUG=3Dy
+CONFIG_ELF_CORE=3Dy
+CONFIG_COMPAT_BRK=3Dy
+CONFIG_BASE_FULL=3Dy
+CONFIG_FUTEX=3Dy
+CONFIG_ANON_INODES=3Dy
+CONFIG_EPOLL=3Dy
+CONFIG_SIGNALFD=3Dy
+CONFIG_TIMERFD=3Dy
+CONFIG_EVENTFD=3Dy
+CONFIG_SHMEM=3Dy
+CONFIG_ASHMEM=3Dy
+CONFIG_VM_EVENT_COUNTERS=3Dy
+CONFIG_SLAB=3Dy
+# CONFIG_SLUB is not set
+# CONFIG_SLOB is not set
+# CONFIG_PROFILING is not set
+# CONFIG_MARKERS is not set
+CONFIG_HAVE_OPROFILE=3Dy
+# CONFIG_KPROBES is not set
+# CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS is not set
+# CONFIG_HAVE_IOREMAP_PROT is not set
+CONFIG_HAVE_KPROBES=3Dy
+CONFIG_HAVE_KRETPROBES=3Dy
+# CONFIG_HAVE_ARCH_TRACEHOOK is not set
+# CONFIG_HAVE_DMA_ATTRS is not set
+# CONFIG_USE_GENERIC_SMP_HELPERS is not set
+# CONFIG_HAVE_CLK is not set
+CONFIG_PROC_PAGE_MONITOR=3Dy
+CONFIG_HAVE_GENERIC_DMA_COHERENT=3Dy
+CONFIG_SLABINFO=3Dy
+CONFIG_RT_MUTEXES=3Dy
+# CONFIG_TINY_SHMEM is not set
+CONFIG_BASE_SMALL=3D0
+CONFIG_MODULES=3Dy
+# CONFIG_MODULE_FORCE_LOAD is not set
+CONFIG_MODULE_UNLOAD=3Dy
+CONFIG_MODULE_FORCE_UNLOAD=3Dy
+# CONFIG_MODVERSIONS is not set
+# CONFIG_MODULE_SRCVERSION_ALL is not set
+CONFIG_KMOD=3Dy
+CONFIG_BLOCK=3Dy
+# CONFIG_LBD is not set
+# CONFIG_BLK_DEV_IO_TRACE is not set
+# CONFIG_LSF is not set
+# CONFIG_BLK_DEV_BSG is not set
+# CONFIG_BLK_DEV_INTEGRITY is not set
+
+#
+# IO Schedulers
+#
+CONFIG_IOSCHED_NOOP=3Dy
+CONFIG_IOSCHED_AS=3Dy
+# CONFIG_IOSCHED_DEADLINE is not set
+# CONFIG_IOSCHED_CFQ is not set
+CONFIG_DEFAULT_AS=3Dy
+# CONFIG_DEFAULT_DEADLINE is not set
+# CONFIG_DEFAULT_CFQ is not set
+# CONFIG_DEFAULT_NOOP is not set
+CONFIG_DEFAULT_IOSCHED=3D"anticipatory"
+CONFIG_CLASSIC_RCU=3Dy
+
+#
+# System Type
+#
+# CONFIG_ARCH_AAEC2000 is not set
+# CONFIG_ARCH_INTEGRATOR is not set
+# CONFIG_ARCH_REALVIEW is not set
+# CONFIG_ARCH_VERSATILE is not set
+# CONFIG_ARCH_AT91 is not set
+# CONFIG_ARCH_CLPS7500 is not set
+# CONFIG_ARCH_CLPS711X is not set
+# CONFIG_ARCH_EBSA110 is not set
+# CONFIG_ARCH_EP93XX is not set
+# CONFIG_ARCH_FOOTBRIDGE is not set
+# CONFIG_ARCH_NETX is not set
+# CONFIG_ARCH_H720X is not set
+# CONFIG_ARCH_IMX is not set
+# CONFIG_ARCH_IOP13XX is not set
+# CONFIG_ARCH_IOP32X is not set
+# CONFIG_ARCH_IOP33X is not set
+# CONFIG_ARCH_IXP23XX is not set
+# CONFIG_ARCH_IXP2000 is not set
+# CONFIG_ARCH_IXP4XX is not set
+# CONFIG_ARCH_L7200 is not set
+# CONFIG_ARCH_KIRKWOOD is not set
+# CONFIG_ARCH_KS8695 is not set
+# CONFIG_ARCH_NS9XXX is not set
+# CONFIG_ARCH_LOKI is not set
+# CONFIG_ARCH_MV78XX0 is not set
+# CONFIG_ARCH_MXC is not set
+# CONFIG_ARCH_ORION5X is not set
+# CONFIG_ARCH_PNX4008 is not set
+# CONFIG_ARCH_PXA is not set
+# CONFIG_ARCH_RPC is not set
+# CONFIG_ARCH_SA1100 is not set
+# CONFIG_ARCH_S3C2410 is not set
+# CONFIG_ARCH_SHARK is not set
+# CONFIG_ARCH_LH7A40X is not set
+# CONFIG_ARCH_DAVINCI is not set
+# CONFIG_ARCH_OMAP is not set
+CONFIG_ARCH_MSM=3Dy
+
+#
+# Boot options
+#
+
+#
+# Power management
+#
+CONFIG_MSM_AMSS_VERSION=3D7000
+# CONFIG_MSM_AMSS_VERSION_6210 is not set
+# CONFIG_MSM_AMSS_VERSION_6220 is not set
+# CONFIG_MSM_AMSS_VERSION_6225 is not set
+CONFIG_MSM_AMSS_VERSION_WINCE=3Dy
+CONFIG_MSM_DEBUG_UART_NONE=3Dy
+# CONFIG_MSM_DEBUG_UART1 is not set
+# CONFIG_MSM_DEBUG_UART2 is not set
+# CONFIG_MSM_DEBUG_UART3 is not set
+
+#
+# MSM Board Type
+#
+# CONFIG_MACH_HALIBUT is not set
+# CONFIG_MACH_TROUT is not set
+CONFIG_MACH_HTCRAPHAEL=3Dy
+CONFIG_MACH_HTCRAPHAEL_CDMA=3Dy
+CONFIG_MACH_HTCDIAMOND=3Dy
+CONFIG_MACH_HTCDIAMOND_CDMA=3Dy
+# CONFIG_TROUT_H2W is not set
+# CONFIG_TROUT_PWRSINK is not set
+CONFIG_MSM7X00A_USE_GP_TIMER=3Dy
+# CONFIG_MSM7X00A_USE_DG_TIMER is not set
+CONFIG_MSM7X00A_SLEEP_MODE_POWER_COLLAPSE_SUSPEND=3Dy
+# CONFIG_MSM7X00A_SLEEP_MODE_POWER_COLLAPSE is not set
+# CONFIG_MSM7X00A_SLEEP_MODE_APPS_SLEEP is not set
+# CONFIG_MSM7X00A_SLEEP_MODE_RAMP_DOWN_AND_WAIT_FOR_INTERRUPT is not set
+# CONFIG_MSM7X00A_SLEEP_WAIT_FOR_INTERRUPT is not set
+CONFIG_MSM7X00A_SLEEP_MODE=3D0
+# CONFIG_MSM7X00A_IDLE_SLEEP_MODE_POWER_COLLAPSE_SUSPEND is not set
+CONFIG_MSM7X00A_IDLE_SLEEP_MODE_POWER_COLLAPSE=3Dy
+# CONFIG_MSM7X00A_IDLE_SLEEP_MODE_APPS_SLEEP is not set
+# CONFIG_MSM7X00A_IDLE_SLEEP_MODE_RAMP_DOWN_AND_WAIT_FOR_INTERRUPT is not =
set
+# CONFIG_MSM7X00A_IDLE_SLEEP_WAIT_FOR_INTERRUPT is not set
+CONFIG_MSM7X00A_IDLE_SLEEP_MODE=3D1
+CONFIG_MSM7X00A_IDLE_SLEEP_MIN_TIME=3D20000000
+CONFIG_MSM7X00A_IDLE_SPIN_TIME=3D80000
+CONFIG_MSM_IDLE_STATS=3Dy
+CONFIG_MSM_IDLE_STATS_FIRST_BUCKET=3D62500
+CONFIG_MSM_IDLE_STATS_BUCKET_SHIFT=3D2
+CONFIG_MSM_IDLE_STATS_BUCKET_COUNT=3D10
+CONFIG_MSM_FIQ_SUPPORT=3Dy
+# CONFIG_MSM_SERIAL_DEBUGGER is not set
+CONFIG_MSM_SMD=3Dy
+# CONFIG_MSM_SMD_7500 is not set
+# CONFIG_MSM_ONCRPCROUTER is not set
+# CONFIG_MSM_CPU_FREQ_ONDEMAND is not set
+# CONFIG_MSM_CPU_FREQ_SCREEN is not set
+CONFIG_MSM_HW3D=3Dy
+# CONFIG_MSM_ADSP is not set
+CONFIG_HTC_FB_CONSOLE=3Dy
+# CONFIG_HTC_FB_CONSOLE_DELAY is not set
+CONFIG_HTC_FB_CONSOLE_BOOT=3Dy
+# CONFIG_WIFI_CONTROL_FUNC is not set
+
+#
+# Processor Type
+#
+CONFIG_CPU_32=3Dy
+CONFIG_CPU_V6=3Dy
+# CONFIG_CPU_32v6K is not set
+CONFIG_CPU_32v6=3Dy
+CONFIG_CPU_ABRT_EV6=3Dy
+CONFIG_CPU_PABRT_NOIFAR=3Dy
+CONFIG_CPU_CACHE_V6=3Dy
+CONFIG_CPU_CACHE_VIPT=3Dy
+CONFIG_CPU_COPY_V6=3Dy
+CONFIG_CPU_TLB_V6=3Dy
+CONFIG_CPU_HAS_ASID=3Dy
+CONFIG_CPU_CP15=3Dy
+CONFIG_CPU_CP15_MMU=3Dy
+
+#
+# Processor Features
+#
+CONFIG_ARM_THUMB=3Dy
+# CONFIG_CPU_ICACHE_DISABLE is not set
+# CONFIG_CPU_DCACHE_DISABLE is not set
+# CONFIG_CPU_BPREDICT_DISABLE is not set
+# CONFIG_OUTER_CACHE is not set
+
+#
+# Bus support
+#
+# CONFIG_PCI_SYSCALL is not set
+# CONFIG_ARCH_SUPPORTS_MSI is not set
+# CONFIG_PCCARD is not set
+
+#
+# Kernel Features
+#
+CONFIG_TICK_ONESHOT=3Dy
+CONFIG_NO_HZ=3Dy
+CONFIG_HIGH_RES_TIMERS=3Dy
+CONFIG_GENERIC_CLOCKEVENTS_BUILD=3Dy
+CONFIG_PREEMPT=3Dy
+CONFIG_HZ=3D100
+CONFIG_AEABI=3Dy
+# CONFIG_OABI_COMPAT is not set
+CONFIG_ARCH_FLATMEM_HAS_HOLES=3Dy
+# CONFIG_ARCH_DISCONTIGMEM_ENABLE is not set
+CONFIG_SELECT_MEMORY_MODEL=3Dy
+CONFIG_FLATMEM_MANUAL=3Dy
+# CONFIG_DISCONTIGMEM_MANUAL is not set
+# CONFIG_SPARSEMEM_MANUAL is not set
+CONFIG_FLATMEM=3Dy
+CONFIG_FLAT_NODE_MEM_MAP=3Dy
+# CONFIG_SPARSEMEM_STATIC is not set
+# CONFIG_SPARSEMEM_VMEMMAP_ENABLE is not set
+CONFIG_PAGEFLAGS_EXTENDED=3Dy
+CONFIG_SPLIT_PTLOCK_CPUS=3D4
+CONFIG_RESOURCES_64BIT=3Dy
+CONFIG_ZONE_DMA_FLAG=3D1
+CONFIG_BOUNCE=3Dy
+CONFIG_VIRT_TO_BUS=3Dy
+CONFIG_ALIGNMENT_TRAP=3Dy
+
+#
+# Boot options
+#
+CONFIG_ZBOOT_ROM_TEXT=3D0x0
+CONFIG_ZBOOT_ROM_BSS=3D0x0
+CONFIG_CMDLINE=3D" debug "
+# CONFIG_XIP_KERNEL is not set
+# CONFIG_KEXEC is not set
+
+#
+# CPU Frequency scaling
+#
+CONFIG_CPU_FREQ=3Dy
+CONFIG_CPU_FREQ_TABLE=3Dy
+# CONFIG_CPU_FREQ_DEBUG is not set
+CONFIG_CPU_FREQ_STAT=3Dy
+CONFIG_CPU_FREQ_STAT_DETAILS=3Dy
+# CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE is not set
+# CONFIG_CPU_FREQ_DEFAULT_GOV_POWERSAVE is not set
+CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE=3Dy
+# CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND is not set
+# CONFIG_CPU_FREQ_DEFAULT_GOV_CONSERVATIVE is not set
+# CONFIG_CPU_FREQ_GOV_PERFORMANCE is not set
+# CONFIG_CPU_FREQ_GOV_POWERSAVE is not set
+CONFIG_CPU_FREQ_GOV_USERSPACE=3Dy
+# CONFIG_CPU_FREQ_GOV_ONDEMAND is not set
+# CONFIG_CPU_FREQ_GOV_CONSERVATIVE is not set
+
+#
+# Floating point emulation
+#
+
+#
+# At least one emulation must be selected
+#
+# CONFIG_VFP is not set
+
+#
+# Userspace binary formats
+#
+CONFIG_BINFMT_ELF=3Dy
+# CONFIG_BINFMT_AOUT is not set
+# CONFIG_BINFMT_MISC is not set
+
+#
+# Power management options
+#
+CONFIG_PM=3Dy
+# CONFIG_PM_DEBUG is not set
+CONFIG_PM_SLEEP=3Dy
+CONFIG_SUSPEND=3Dy
+CONFIG_SUSPEND_FREEZER=3Dy
+# CONFIG_WAKELOCK is not set
+# CONFIG_APM_EMULATION is not set
+CONFIG_ARCH_SUSPEND_POSSIBLE=3Dy
+CONFIG_NET=3Dy
+
+#
+# Networking options
+#
+CONFIG_PACKET=3Dy
+# CONFIG_PACKET_MMAP is not set
+CONFIG_UNIX=3Dy
+# CONFIG_NET_KEY is not set
+CONFIG_INET=3Dy
+# CONFIG_IP_MULTICAST is not set
+# CONFIG_IP_ADVANCED_ROUTER is not set
+CONFIG_IP_FIB_HASH=3Dy
+# CONFIG_IP_PNP is not set
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
+# CONFIG_TCP_CONG_ADVANCED is not set
+CONFIG_TCP_CONG_CUBIC=3Dy
+CONFIG_DEFAULT_TCP_CONG=3D"cubic"
+# CONFIG_TCP_MD5SIG is not set
+# CONFIG_IPV6 is not set
+CONFIG_ANDROID_PARANOID_NETWORK=3Dy
+# CONFIG_NETWORK_SECMARK is not set
+# CONFIG_NETFILTER is not set
+# CONFIG_IP_DCCP is not set
+# CONFIG_IP_SCTP is not set
+# CONFIG_TIPC is not set
+# CONFIG_ATM is not set
+# CONFIG_BRIDGE is not set
+# CONFIG_VLAN_8021Q is not set
+# CONFIG_DECNET is not set
+# CONFIG_LLC2 is not set
+# CONFIG_IPX is not set
+# CONFIG_ATALK is not set
+# CONFIG_X25 is not set
+# CONFIG_LAPB is not set
+# CONFIG_ECONET is not set
+# CONFIG_WAN_ROUTER is not set
+# CONFIG_NET_SCHED is not set
+
+#
+# Network testing
+#
+# CONFIG_NET_PKTGEN is not set
+# CONFIG_HAMRADIO is not set
+# CONFIG_CAN is not set
+# CONFIG_IRDA is not set
+# CONFIG_BT is not set
+# CONFIG_AF_RXRPC is not set
+
+#
+# Wireless
+#
+# CONFIG_CFG80211 is not set
+CONFIG_WIRELESS_EXT=3Dy
+CONFIG_WIRELESS_EXT_SYSFS=3Dy
+# CONFIG_MAC80211 is not set
+CONFIG_IEEE80211=3Dy
+# CONFIG_IEEE80211_DEBUG is not set
+# CONFIG_IEEE80211_CRYPT_WEP is not set
+# CONFIG_IEEE80211_CRYPT_CCMP is not set
+# CONFIG_IEEE80211_CRYPT_TKIP is not set
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
+CONFIG_UEVENT_HELPER_PATH=3D""
+CONFIG_STANDALONE=3Dy
+CONFIG_PREVENT_FIRMWARE_BUILD=3Dy
+CONFIG_FW_LOADER=3Dy
+CONFIG_FIRMWARE_IN_KERNEL=3Dy
+CONFIG_EXTRA_FIRMWARE=3D""
+# CONFIG_DEBUG_DRIVER is not set
+# CONFIG_DEBUG_DEVRES is not set
+# CONFIG_SYS_HYPERVISOR is not set
+# CONFIG_CONNECTOR is not set
+# CONFIG_MTD is not set
+# CONFIG_PARPORT is not set
+CONFIG_BLK_DEV=3Dy
+# CONFIG_BLK_DEV_COW_COMMON is not set
+CONFIG_BLK_DEV_LOOP=3Dy
+# CONFIG_BLK_DEV_CRYPTOLOOP is not set
+# CONFIG_BLK_DEV_NBD is not set
+# CONFIG_BLK_DEV_RAM is not set
+# CONFIG_CDROM_PKTCDVD is not set
+# CONFIG_ATA_OVER_ETH is not set
+CONFIG_MISC_DEVICES=3Dy
+CONFIG_ANDROID_PMEM=3Dy
+CONFIG_TIMED_OUTPUT=3Dy
+CONFIG_TIMED_GPIO=3Dy
+CONFIG_BINDER_IPC=3Dy
+# CONFIG_EEPROM_93CX6 is not set
+# CONFIG_ENCLOSURE_SERVICES is not set
+CONFIG_KERNEL_DEBUGGER_CORE=3Dy
+CONFIG_LOW_MEMORY_KILLER=3Dy
+CONFIG_LOGGER=3Dy
+# CONFIG_UID_STAT is not set
+# CONFIG_ANDROID_RAM_CONSOLE is not set
+CONFIG_HAVE_IDE=3Dy
+# CONFIG_IDE is not set
+
+#
+# SCSI device support
+#
+# CONFIG_RAID_ATTRS is not set
+# CONFIG_SCSI is not set
+# CONFIG_SCSI_DMA is not set
+# CONFIG_SCSI_NETLINK is not set
+# CONFIG_ATA is not set
+# CONFIG_MD is not set
+CONFIG_NETDEVICES=3Dy
+CONFIG_DUMMY=3Dy
+# CONFIG_BONDING is not set
+# CONFIG_MACVLAN is not set
+# CONFIG_EQUALIZER is not set
+# CONFIG_TUN is not set
+# CONFIG_VETH is not set
+# CONFIG_PHYLIB is not set
+CONFIG_NET_ETHERNET=3Dy
+CONFIG_MII=3Dy
+# CONFIG_AX88796 is not set
+# CONFIG_SMC91X is not set
+# CONFIG_DM9000 is not set
+# CONFIG_IBM_NEW_EMAC_ZMII is not set
+# CONFIG_IBM_NEW_EMAC_RGMII is not set
+# CONFIG_IBM_NEW_EMAC_TAH is not set
+# CONFIG_IBM_NEW_EMAC_EMAC4 is not set
+# CONFIG_B44 is not set
+CONFIG_NETDEV_1000=3Dy
+CONFIG_NETDEV_10000=3Dy
+
+#
+# Wireless LAN
+#
+# CONFIG_WLAN_PRE80211 is not set
+CONFIG_WLAN_80211=3Dy
+# CONFIG_LIBERTAS is not set
+# CONFIG_IWLWIFI_LEDS is not set
+# CONFIG_HOSTAP is not set
+# CONFIG_WAN is not set
+CONFIG_PPP=3Dy
+# CONFIG_PPP_MULTILINK is not set
+# CONFIG_PPP_FILTER is not set
+CONFIG_PPP_ASYNC=3Dy
+# CONFIG_PPP_SYNC_TTY is not set
+CONFIG_PPP_DEFLATE=3Dy
+CONFIG_PPP_BSDCOMP=3Dy
+# CONFIG_PPP_MPPE is not set
+# CONFIG_PPPOE is not set
+# CONFIG_PPPOL2TP is not set
+# CONFIG_SLIP is not set
+CONFIG_SLHC=3Dy
+# CONFIG_NETCONSOLE is not set
+CONFIG_MSM_RMNET=3Dy
+# CONFIG_NETPOLL is not set
+# CONFIG_NET_POLL_CONTROLLER is not set
+# CONFIG_ISDN is not set
+
+#
+# Input device support
+#
+CONFIG_INPUT=3Dy
+# CONFIG_INPUT_FF_MEMLESS is not set
+# CONFIG_INPUT_POLLDEV is not set
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
+# CONFIG_INPUT_KEYRESET is not set
+
+#
+# Input Device Drivers
+#
+CONFIG_INPUT_KEYBOARD=3Dy
+# CONFIG_KEYBOARD_ATKBD is not set
+# CONFIG_KEYBOARD_SUNKBD is not set
+# CONFIG_KEYBOARD_LKKBD is not set
+# CONFIG_KEYBOARD_XTKBD is not set
+# CONFIG_KEYBOARD_NEWTON is not set
+# CONFIG_KEYBOARD_STOWAWAY is not set
+# CONFIG_KEYBOARD_GPIO is not set
+CONFIG_KEYBOARD_MICROP_KEYPAD=3Dy
+# CONFIG_INPUT_MOUSE is not set
+# CONFIG_INPUT_JOYSTICK is not set
+# CONFIG_INPUT_TABLET is not set
+CONFIG_INPUT_TOUCHSCREEN=3Dy
+# CONFIG_TOUCHSCREEN_FUJITSU is not set
+# CONFIG_TOUCHSCREEN_GUNZE is not set
+# CONFIG_TOUCHSCREEN_ELAN_I2C_8232 is not set
+# CONFIG_TOUCHSCREEN_ELO is not set
+# CONFIG_TOUCHSCREEN_MTOUCH is not set
+# CONFIG_TOUCHSCREEN_INEXIO is not set
+# CONFIG_TOUCHSCREEN_MK712 is not set
+# CONFIG_TOUCHSCREEN_PENMOUNT is not set
+CONFIG_TOUCHSCREEN_SYNAPTICS_I2C_RMI=3Dy
+# CONFIG_TOUCHSCREEN_TOUCHRIGHT is not set
+# CONFIG_TOUCHSCREEN_TOUCHWIN is not set
+# CONFIG_TOUCHSCREEN_UCB1400 is not set
+# CONFIG_TOUCHSCREEN_USB_COMPOSITE is not set
+# CONFIG_TOUCHSCREEN_TOUCHIT213 is not set
+CONFIG_TOUCHSCREEN_MSM=3Dy
+# CONFIG_MSM_VIRTUAL_KEYBOARD is not set
+CONFIG_INPUT_MISC=3Dy
+# CONFIG_INPUT_ATI_REMOTE is not set
+# CONFIG_INPUT_ATI_REMOTE2 is not set
+# CONFIG_INPUT_KEYSPAN_REMOTE is not set
+# CONFIG_INPUT_POWERMATE is not set
+# CONFIG_INPUT_YEALINK is not set
+# CONFIG_INPUT_UINPUT is not set
+CONFIG_INPUT_GPIO=3Dy
+# CONFIG_INPUT_KEYCHORD is not set
+
+#
+# Hardware I/O ports
+#
+# CONFIG_SERIO is not set
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
+# CONFIG_DEVMEM is not set
+CONFIG_DEVKMEM=3Dy
+# CONFIG_SERIAL_NONSTANDARD is not set
+
+#
+# Serial drivers
+#
+# CONFIG_SERIAL_8250 is not set
+
+#
+# Non-8250 serial port support
+#
+CONFIG_SERIAL_CORE=3Dy
+CONFIG_SERIAL_CORE_CONSOLE=3Dy
+CONFIG_SERIAL_MSM=3Dy
+CONFIG_SERIAL_MSM_CONSOLE=3Dy
+CONFIG_SERIAL_MSM_CLOCK_CONTROL=3Dy
+CONFIG_SERIAL_MSM_RX_WAKEUP=3Dy
+# CONFIG_SERIAL_MSM_HS is not set
+CONFIG_UNIX98_PTYS=3Dy
+# CONFIG_LEGACY_PTYS is not set
+# CONFIG_IPMI_HANDLER is not set
+# CONFIG_HW_RANDOM is not set
+# CONFIG_NVRAM is not set
+# CONFIG_R3964 is not set
+# CONFIG_RAW_DRIVER is not set
+# CONFIG_TCG_TPM is not set
+# CONFIG_DCC_TTY is not set
+CONFIG_I2C=3Dy
+CONFIG_I2C_BOARDINFO=3Dy
+# CONFIG_I2C_CHARDEV is not set
+CONFIG_I2C_HELPER_AUTO=3Dy
+
+#
+# I2C Hardware Bus support
+#
+
+#
+# I2C system bus drivers (mostly embedded / system-on-chip)
+#
+# CONFIG_I2C_GPIO is not set
+CONFIG_I2C_MSM=3Dy
+# CONFIG_I2C_OCORES is not set
+# CONFIG_I2C_SIMTEC is not set
+
+#
+# External I2C/SMBus adapter drivers
+#
+# CONFIG_I2C_PARPORT_LIGHT is not set
+# CONFIG_I2C_TAOS_EVM is not set
+
+#
+# Other I2C/SMBus bus drivers
+#
+# CONFIG_I2C_PCA_PLATFORM is not set
+# CONFIG_I2C_STUB is not set
+
+#
+# Miscellaneous I2C Chip support
+#
+# CONFIG_DS1682 is not set
+# CONFIG_AT24 is not set
+# CONFIG_SENSORS_EEPROM is not set
+# CONFIG_SENSORS_PCF8574 is not set
+# CONFIG_PCF8575 is not set
+# CONFIG_SENSORS_PCA9539 is not set
+# CONFIG_SENSORS_PCF8591 is not set
+# CONFIG_SENSORS_MAX6875 is not set
+# CONFIG_SENSORS_TSL2550 is not set
+# CONFIG_SENSORS_AKM8976 is not set
+CONFIG_SENSORS_PCA963X=3Dy
+# CONFIG_SENSORS_MT9T013 is not set
+CONFIG_SENSORS_MICROP_KSC=3Dy
+CONFIG_SENSORS_MICROP_KLT=3Dy
+# CONFIG_I2C_DEBUG_CORE is not set
+# CONFIG_I2C_DEBUG_ALGO is not set
+# CONFIG_I2C_DEBUG_BUS is not set
+# CONFIG_I2C_DEBUG_CHIP is not set
+# CONFIG_SPI is not set
+# CONFIG_W1 is not set
+# CONFIG_POWER_SUPPLY is not set
+# CONFIG_HWMON is not set
+# CONFIG_WATCHDOG is not set
+
+#
+# Sonics Silicon Backplane
+#
+CONFIG_SSB_POSSIBLE=3Dy
+# CONFIG_SSB is not set
+
+#
+# Multifunction device drivers
+#
+# CONFIG_MFD_CORE is not set
+# CONFIG_MFD_SM501 is not set
+# CONFIG_HTC_PASIC3 is not set
+# CONFIG_MFD_TMIO is not set
+# CONFIG_MFD_T7L66XB is not set
+# CONFIG_MFD_TC6387XB is not set
+
+#
+# Multimedia devices
+#
+
+#
+# Multimedia core support
+#
+# CONFIG_VIDEO_DEV is not set
+# CONFIG_DVB_CORE is not set
+# CONFIG_VIDEO_MEDIA is not set
+
+#
+# Multimedia drivers
+#
+CONFIG_DAB=3Dy
+
+#
+# Graphics support
+#
+# CONFIG_VGASTATE is not set
+CONFIG_VIDEO_OUTPUT_CONTROL=3Dy
+CONFIG_FB=3Dy
+# CONFIG_FIRMWARE_EDID is not set
+# CONFIG_FB_DDC is not set
+CONFIG_FB_CFB_FILLRECT=3Dy
+CONFIG_FB_CFB_COPYAREA=3Dy
+CONFIG_FB_CFB_IMAGEBLIT=3Dy
+# CONFIG_FB_CFB_REV_PIXELS_IN_BYTE is not set
+# CONFIG_FB_SYS_FILLRECT is not set
+# CONFIG_FB_SYS_COPYAREA is not set
+# CONFIG_FB_SYS_IMAGEBLIT is not set
+# CONFIG_FB_FOREIGN_ENDIAN is not set
+# CONFIG_FB_SYS_FOPS is not set
+CONFIG_FB_MSM=3Dy
+CONFIG_FB_MSM_REFRESH=3Dy
+# CONFIG_FB_SVGALIB is not set
+# CONFIG_FB_MACMODES is not set
+# CONFIG_FB_BACKLIGHT is not set
+CONFIG_FB_MODE_HELPERS=3Dy
+CONFIG_FB_TILEBLITTING=3Dy
+
+#
+# Frame buffer hardware drivers
+#
+# CONFIG_FB_S1D13XXX is not set
+# CONFIG_FB_VIRTUAL is not set
+# CONFIG_BACKLIGHT_LCD_SUPPORT is not set
+
+#
+# Display device support
+#
+# CONFIG_DISPLAY_SUPPORT is not set
+
+#
+# Console display driver support
+#
+# CONFIG_VGA_CONSOLE is not set
+CONFIG_DUMMY_CONSOLE=3Dy
+CONFIG_FRAMEBUFFER_CONSOLE=3Dy
+# CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY is not set
+CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=3Dy
+CONFIG_FONTS=3Dy
+CONFIG_FONT_8x8=3Dy
+# CONFIG_FONT_8x16 is not set
+# CONFIG_FONT_6x11 is not set
+# CONFIG_FONT_7x14 is not set
+# CONFIG_FONT_PEARL_8x8 is not set
+# CONFIG_FONT_ACORN_8x8 is not set
+# CONFIG_FONT_MINI_4x6 is not set
+# CONFIG_FONT_SUN8x16 is not set
+# CONFIG_FONT_SUN12x22 is not set
+# CONFIG_FONT_10x18 is not set
+# CONFIG_LOGO is not set
+# CONFIG_SOUND is not set
+CONFIG_HID_SUPPORT=3Dy
+CONFIG_HID=3Dy
+# CONFIG_HID_DEBUG is not set
+# CONFIG_HIDRAW is not set
+CONFIG_USB_SUPPORT=3Dy
+CONFIG_USB_ARCH_HAS_HCD=3Dy
+# CONFIG_USB_ARCH_HAS_OHCI is not set
+# CONFIG_USB_ARCH_HAS_EHCI is not set
+# CONFIG_USB is not set
+
+#
+# Enable Host or Gadget support to see Inventra options
+#
+
+#
+# NOTE: USB_STORAGE enables SCSI, and 'SCSI disk support'
+#
+# CONFIG_USB_GADGET is not set
+
+#
+# USB Function Support
+#
+CONFIG_USB_FUNCTION=3Dy
+CONFIG_USB_FUNCTION_MSM_HSUSB=3Dy
+# CONFIG_USB_FUNCTION_NULL is not set
+# CONFIG_USB_FUNCTION_ZERO is not set
+# CONFIG_USB_FUNCTION_LOOPBACK is not set
+CONFIG_USB_FUNCTION_ADB=3Dy
+# CONFIG_USB_FUNCTION_UMS is not set
+CONFIG_USB_FUNCTION_MASS_STORAGE=3Dy
+CONFIG_USB_FUNCTION_DIAG=3Dy
+CONFIG_USB_FUNCTION_ETHER=3Dy
+CONFIG_MMC=3Dy
+# CONFIG_MMC_DEBUG is not set
+CONFIG_MMC_UNSAFE_RESUME=3Dy
+CONFIG_MMC_EMBEDDED_SDIO=3Dy
+# CONFIG_MMC_PARANOID_SD_INIT is not set
+
+#
+# MMC/SD Card Drivers
+#
+CONFIG_MMC_BLOCK=3Dy
+# CONFIG_MMC_BLOCK_BOUNCE is not set
+CONFIG_MMC_BLOCK_PARANOID_RESUME=3Dy
+# CONFIG_SDIO_UART is not set
+# CONFIG_MMC_TEST is not set
+
+#
+# MMC/SD Host Controller Drivers
+#
+# CONFIG_MMC_SDHCI is not set
+CONFIG_MMC_MSM7X00A=3Dy
+# CONFIG_MMC_MSM7X00A_RESUME_IN_WQ is not set
+CONFIG_NEW_LEDS=3Dy
+CONFIG_LEDS_CLASS=3Dy
+
+#
+# LED drivers
+#
+# CONFIG_LEDS_PCA9532 is not set
+CONFIG_LEDS_GPIO=3Dy
+# CONFIG_LEDS_PCA955X is not set
+
+#
+# LED Triggers
+#
+CONFIG_LEDS_TRIGGERS=3Dy
+CONFIG_LEDS_TRIGGER_TIMER=3Dy
+CONFIG_LEDS_TRIGGER_HEARTBEAT=3Dy
+# CONFIG_LEDS_TRIGGER_DEFAULT_ON is not set
+CONFIG_SWITCH=3Dy
+CONFIG_SWITCH_GPIO=3Dy
+CONFIG_RTC_LIB=3Dy
+CONFIG_RTC_CLASS=3Dy
+CONFIG_RTC_HCTOSYS=3Dy
+CONFIG_RTC_HCTOSYS_DEVICE=3D"rtc0"
+# CONFIG_RTC_DEBUG is not set
+
+#
+# RTC interfaces
+#
+# CONFIG_RTC_INTF_SYSFS is not set
+# CONFIG_RTC_INTF_PROC is not set
+# CONFIG_RTC_INTF_DEV is not set
+CONFIG_RTC_INTF_ALARM=3Dy
+# CONFIG_RTC_DRV_TEST is not set
+
+#
+# I2C RTC drivers
+#
+# CONFIG_RTC_DRV_DS1307 is not set
+# CONFIG_RTC_DRV_DS1374 is not set
+# CONFIG_RTC_DRV_DS1672 is not set
+# CONFIG_RTC_DRV_MAX6900 is not set
+# CONFIG_RTC_DRV_RS5C372 is not set
+# CONFIG_RTC_DRV_ISL1208 is not set
+# CONFIG_RTC_DRV_X1205 is not set
+# CONFIG_RTC_DRV_PCF8563 is not set
+# CONFIG_RTC_DRV_PCF8583 is not set
+# CONFIG_RTC_DRV_M41T80 is not set
+# CONFIG_RTC_DRV_S35390A is not set
+# CONFIG_RTC_DRV_FM3130 is not set
+
+#
+# SPI RTC drivers
+#
+
+#
+# Platform RTC drivers
+#
+# CONFIG_RTC_DRV_CMOS is not set
+# CONFIG_RTC_DRV_DS1511 is not set
+# CONFIG_RTC_DRV_DS1553 is not set
+# CONFIG_RTC_DRV_DS1742 is not set
+# CONFIG_RTC_DRV_STK17TA8 is not set
+# CONFIG_RTC_DRV_M48T86 is not set
+# CONFIG_RTC_DRV_M48T59 is not set
+# CONFIG_RTC_DRV_V3020 is not set
+
+#
+# on-CPU RTC drivers
+#
+# CONFIG_RTC_DRV_MSM7X00A is not set
+CONFIG_RTC_DRV_MSM7X01A=3Dy
+# CONFIG_DMADEVICES is not set
+
+#
+# Voltage and Current regulators
+#
+# CONFIG_REGULATOR is not set
+# CONFIG_REGULATOR_FIXED_VOLTAGE is not set
+# CONFIG_REGULATOR_VIRTUAL_CONSUMER is not set
+# CONFIG_REGULATOR_BQ24022 is not set
+# CONFIG_UIO is not set
+
+#
+# File systems
+#
+CONFIG_EXT2_FS=3Dy
+# CONFIG_EXT2_FS_XATTR is not set
+# CONFIG_EXT2_FS_XIP is not set
+CONFIG_EXT3_FS=3Dy
+CONFIG_EXT3_FS_XATTR=3Dy
+# CONFIG_EXT3_FS_POSIX_ACL is not set
+# CONFIG_EXT3_FS_SECURITY is not set
+# CONFIG_EXT4DEV_FS is not set
+CONFIG_JBD=3Dy
+# CONFIG_JBD_DEBUG is not set
+CONFIG_FS_MBCACHE=3Dy
+# CONFIG_REISERFS_FS is not set
+# CONFIG_JFS_FS is not set
+CONFIG_FS_POSIX_ACL=3Dy
+# CONFIG_XFS_FS is not set
+# CONFIG_OCFS2_FS is not set
+# CONFIG_DNOTIFY is not set
+CONFIG_INOTIFY=3Dy
+CONFIG_INOTIFY_USER=3Dy
+# CONFIG_QUOTA is not set
+# CONFIG_AUTOFS_FS is not set
+# CONFIG_AUTOFS4_FS is not set
+# CONFIG_FUSE_FS is not set
+
+#
+# CD-ROM/DVD Filesystems
+#
+# CONFIG_ISO9660_FS is not set
+# CONFIG_UDF_FS is not set
+
+#
+# DOS/FAT/NT Filesystems
+#
+CONFIG_FAT_FS=3Dy
+# CONFIG_MSDOS_FS is not set
+CONFIG_VFAT_FS=3Dy
+CONFIG_FAT_DEFAULT_CODEPAGE=3D437
+CONFIG_FAT_DEFAULT_IOCHARSET=3D"iso8859-1"
+# CONFIG_NTFS_FS is not set
+
+#
+# Pseudo filesystems
+#
+CONFIG_PROC_FS=3Dy
+CONFIG_PROC_SYSCTL=3Dy
+CONFIG_SYSFS=3Dy
+CONFIG_TMPFS=3Dy
+# CONFIG_TMPFS_POSIX_ACL is not set
+# CONFIG_HUGETLB_PAGE is not set
+# CONFIG_CONFIGFS_FS is not set
+
+#
+# Miscellaneous filesystems
+#
+# CONFIG_ADFS_FS is not set
+# CONFIG_AFFS_FS is not set
+# CONFIG_HFS_FS is not set
+# CONFIG_HFSPLUS_FS is not set
+# CONFIG_BEFS_FS is not set
+# CONFIG_BFS_FS is not set
+# CONFIG_EFS_FS is not set
+# CONFIG_CRAMFS is not set
+# CONFIG_VXFS_FS is not set
+# CONFIG_MINIX_FS is not set
+# CONFIG_OMFS_FS is not set
+# CONFIG_HPFS_FS is not set
+# CONFIG_QNX4FS_FS is not set
+# CONFIG_ROMFS_FS is not set
+# CONFIG_SYSV_FS is not set
+# CONFIG_UFS_FS is not set
+CONFIG_NETWORK_FILESYSTEMS=3Dy
+CONFIG_NFS_FS=3Dy
+CONFIG_NFS_V3=3Dy
+CONFIG_NFS_V3_ACL=3Dy
+# CONFIG_NFS_V4 is not set
+CONFIG_NFSD=3Dm
+CONFIG_NFSD_V2_ACL=3Dy
+CONFIG_NFSD_V3=3Dy
+CONFIG_NFSD_V3_ACL=3Dy
+# CONFIG_NFSD_V4 is not set
+CONFIG_LOCKD=3Dy
+CONFIG_LOCKD_V4=3Dy
+CONFIG_EXPORTFS=3Dm
+CONFIG_NFS_ACL_SUPPORT=3Dy
+CONFIG_NFS_COMMON=3Dy
+CONFIG_SUNRPC=3Dy
+# CONFIG_RPCSEC_GSS_KRB5 is not set
+# CONFIG_RPCSEC_GSS_SPKM3 is not set
+# CONFIG_SMB_FS is not set
+CONFIG_CIFS=3Dy
+CONFIG_CIFS_STATS=3Dy
+# CONFIG_CIFS_STATS2 is not set
+# CONFIG_CIFS_WEAK_PW_HASH is not set
+CONFIG_CIFS_XATTR=3Dy
+CONFIG_CIFS_POSIX=3Dy
+# CONFIG_CIFS_DEBUG2 is not set
+# CONFIG_CIFS_EXPERIMENTAL is not set
+# CONFIG_NCP_FS is not set
+# CONFIG_CODA_FS is not set
+# CONFIG_AFS_FS is not set
+
+#
+# Partition Types
+#
+CONFIG_PARTITION_ADVANCED=3Dy
+# CONFIG_ACORN_PARTITION is not set
+# CONFIG_OSF_PARTITION is not set
+# CONFIG_AMIGA_PARTITION is not set
+# CONFIG_ATARI_PARTITION is not set
+# CONFIG_MAC_PARTITION is not set
+CONFIG_MSDOS_PARTITION=3Dy
+# CONFIG_BSD_DISKLABEL is not set
+# CONFIG_MINIX_SUBPARTITION is not set
+# CONFIG_SOLARIS_X86_PARTITION is not set
+# CONFIG_UNIXWARE_DISKLABEL is not set
+# CONFIG_LDM_PARTITION is not set
+# CONFIG_SGI_PARTITION is not set
+# CONFIG_ULTRIX_PARTITION is not set
+# CONFIG_SUN_PARTITION is not set
+# CONFIG_KARMA_PARTITION is not set
+# CONFIG_EFI_PARTITION is not set
+# CONFIG_SYSV68_PARTITION is not set
+CONFIG_NLS=3Dy
+CONFIG_NLS_DEFAULT=3D"iso8859-1"
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
+# CONFIG_NLS_ASCII is not set
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
+# CONFIG_NLS_UTF8 is not set
+# CONFIG_DLM is not set
+
+#
+# Kernel hacking
+#
+CONFIG_PRINTK_TIME=3Dy
+CONFIG_ENABLE_WARN_DEPRECATED=3Dy
+CONFIG_ENABLE_MUST_CHECK=3Dy
+CONFIG_FRAME_WARN=3D1024
+CONFIG_MAGIC_SYSRQ=3Dy
+# CONFIG_UNUSED_SYMBOLS is not set
+CONFIG_DEBUG_FS=3Dy
+# CONFIG_HEADERS_CHECK is not set
+CONFIG_DEBUG_KERNEL=3Dy
+# CONFIG_DEBUG_SHIRQ is not set
+CONFIG_DETECT_SOFTLOCKUP=3Dy
+# CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC is not set
+CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC_VALUE=3D0
+CONFIG_SCHED_DEBUG=3Dy
+CONFIG_SCHEDSTATS=3Dy
+CONFIG_TIMER_STATS=3Dy
+# CONFIG_DEBUG_OBJECTS is not set
+# CONFIG_DEBUG_SLAB is not set
+CONFIG_DEBUG_PREEMPT=3Dy
+# CONFIG_DEBUG_RT_MUTEXES is not set
+# CONFIG_RT_MUTEX_TESTER is not set
+# CONFIG_DEBUG_SPINLOCK is not set
+# CONFIG_DEBUG_MUTEXES is not set
+# CONFIG_DEBUG_LOCK_ALLOC is not set
+# CONFIG_PROVE_LOCKING is not set
+# CONFIG_LOCK_STAT is not set
+# CONFIG_DEBUG_SPINLOCK_SLEEP is not set
+# CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
+# CONFIG_DEBUG_KOBJECT is not set
+CONFIG_DEBUG_BUGVERBOSE=3Dy
+CONFIG_DEBUG_INFO=3Dy
+# CONFIG_DEBUG_VM is not set
+# CONFIG_DEBUG_WRITECOUNT is not set
+CONFIG_DEBUG_MEMORY_INIT=3Dy
+# CONFIG_DEBUG_LIST is not set
+# CONFIG_DEBUG_SG is not set
+CONFIG_FRAME_POINTER=3Dy
+# CONFIG_BOOT_PRINTK_DELAY is not set
+# CONFIG_RCU_TORTURE_TEST is not set
+# CONFIG_BACKTRACE_SELF_TEST is not set
+# CONFIG_FAULT_INJECTION is not set
+# CONFIG_LATENCYTOP is not set
+# CONFIG_SYSCTL_SYSCALL_CHECK is not set
+CONFIG_HAVE_FTRACE=3Dy
+CONFIG_HAVE_DYNAMIC_FTRACE=3Dy
+# CONFIG_FTRACE is not set
+# CONFIG_IRQSOFF_TRACER is not set
+# CONFIG_PREEMPT_TRACER is not set
+# CONFIG_SCHED_TRACER is not set
+# CONFIG_CONTEXT_SWITCH_TRACER is not set
+# CONFIG_SAMPLES is not set
+CONFIG_HAVE_ARCH_KGDB=3Dy
+# CONFIG_KGDB is not set
+# CONFIG_DEBUG_USER is not set
+# CONFIG_DEBUG_ERRORS is not set
+# CONFIG_DEBUG_STACK_USAGE is not set
+# CONFIG_DEBUG_LL is not set
+
+#
+# Security options
+#
+# CONFIG_KEYS is not set
+# CONFIG_SECURITY is not set
+# CONFIG_SECURITY_FILE_CAPABILITIES is not set
+# CONFIG_CRYPTO is not set
+
+#
+# Library routines
+#
+CONFIG_BITREVERSE=3Dy
+# CONFIG_GENERIC_FIND_FIRST_BIT is not set
+# CONFIG_GENERIC_FIND_NEXT_BIT is not set
+CONFIG_CRC_CCITT=3Dy
+# CONFIG_CRC16 is not set
+# CONFIG_CRC_T10DIF is not set
+# CONFIG_CRC_ITU_T is not set
+CONFIG_CRC32=3Dy
+# CONFIG_CRC7 is not set
+# CONFIG_LIBCRC32C is not set
+CONFIG_ZLIB_INFLATE=3Dy
+CONFIG_ZLIB_DEFLATE=3Dy
+CONFIG_PLIST=3Dy
+CONFIG_HAS_IOMEM=3Dy
+CONFIG_HAS_IOPORT=3Dy
+CONFIG_HAS_DMA=3Dy
diff --git a/recipes/linux/linux-replicant/htctitan/defconfig b/recipes/lin=
ux/linux-replicant/htctitan/defconfig
new file mode 100644
index 0000000..a72f00d
--- /dev/null
+++ b/recipes/linux/linux-replicant/htctitan/defconfig
@@ -0,0 +1,1009 @@
+#
+# Automatically generated make config: don't edit
+# Linux kernel version: 2.6.25
+# Wed Feb 25 00:41:59 2009
+#
+CONFIG_ARM=3Dy
+CONFIG_SYS_SUPPORTS_APM_EMULATION=3Dy
+# CONFIG_GENERIC_GPIO is not set
+CONFIG_GENERIC_TIME=3Dy
+CONFIG_GENERIC_CLOCKEVENTS=3Dy
+CONFIG_MMU=3Dy
+# CONFIG_NO_IOPORT is not set
+CONFIG_GENERIC_HARDIRQS=3Dy
+CONFIG_STACKTRACE_SUPPORT=3Dy
+CONFIG_HAVE_LATENCYTOP_SUPPORT=3Dy
+CONFIG_LOCKDEP_SUPPORT=3Dy
+CONFIG_TRACE_IRQFLAGS_SUPPORT=3Dy
+CONFIG_HARDIRQS_SW_RESEND=3Dy
+CONFIG_GENERIC_IRQ_PROBE=3Dy
+CONFIG_RWSEM_GENERIC_SPINLOCK=3Dy
+# CONFIG_ARCH_HAS_ILOG2_U32 is not set
+# CONFIG_ARCH_HAS_ILOG2_U64 is not set
+CONFIG_GENERIC_HWEIGHT=3Dy
+CONFIG_GENERIC_CALIBRATE_DELAY=3Dy
+CONFIG_ARCH_SUPPORTS_AOUT=3Dy
+CONFIG_ZONE_DMA=3Dy
+CONFIG_VECTORS_BASE=3D0xffff0000
+CONFIG_DEFCONFIG_LIST=3D"/lib/modules/$UNAME_RELEASE/.config"
+
+#
+# General setup
+#
+CONFIG_EXPERIMENTAL=3Dy
+CONFIG_BROKEN_ON_SMP=3Dy
+CONFIG_LOCK_KERNEL=3Dy
+CONFIG_INIT_ENV_ARG_LIMIT=3D32
+CONFIG_LOCALVERSION=3D""
+CONFIG_LOCALVERSION_AUTO=3Dy
+CONFIG_SWAP=3Dy
+# CONFIG_SYSVIPC is not set
+# CONFIG_POSIX_MQUEUE is not set
+# CONFIG_BSD_PROCESS_ACCT is not set
+# CONFIG_TASKSTATS is not set
+# CONFIG_AUDIT is not set
+CONFIG_IKCONFIG=3Dy
+CONFIG_IKCONFIG_PROC=3Dy
+CONFIG_LOG_BUF_SHIFT=3D17
+# CONFIG_CGROUPS is not set
+CONFIG_GROUP_SCHED=3Dy
+CONFIG_FAIR_GROUP_SCHED=3Dy
+# CONFIG_RT_GROUP_SCHED is not set
+CONFIG_USER_SCHED=3Dy
+# CONFIG_CGROUP_SCHED is not set
+CONFIG_SYSFS_DEPRECATED=3Dy
+CONFIG_SYSFS_DEPRECATED_V2=3Dy
+# CONFIG_RELAY is not set
+# CONFIG_NAMESPACES is not set
+CONFIG_BLK_DEV_INITRD=3Dy
+CONFIG_INITRAMFS_SOURCE=3D""
+# CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
+CONFIG_SYSCTL=3Dy
+CONFIG_PANIC_TIMEOUT=3D0
+CONFIG_EMBEDDED=3Dy
+CONFIG_UID16=3Dy
+CONFIG_SYSCTL_SYSCALL=3Dy
+CONFIG_KALLSYMS=3Dy
+# CONFIG_KALLSYMS_ALL is not set
+# CONFIG_KALLSYMS_EXTRA_PASS is not set
+CONFIG_HOTPLUG=3Dy
+CONFIG_PRINTK=3Dy
+CONFIG_BUG=3Dy
+CONFIG_ELF_CORE=3Dy
+CONFIG_COMPAT_BRK=3Dy
+CONFIG_BASE_FULL=3Dy
+CONFIG_FUTEX=3Dy
+CONFIG_ANON_INODES=3Dy
+CONFIG_EPOLL=3Dy
+CONFIG_SIGNALFD=3Dy
+CONFIG_TIMERFD=3Dy
+CONFIG_EVENTFD=3Dy
+CONFIG_SHMEM=3Dy
+CONFIG_ASHMEM=3Dy
+CONFIG_VM_EVENT_COUNTERS=3Dy
+CONFIG_SLAB=3Dy
+# CONFIG_SLUB is not set
+# CONFIG_SLOB is not set
+# CONFIG_PROFILING is not set
+# CONFIG_MARKERS is not set
+CONFIG_HAVE_OPROFILE=3Dy
+# CONFIG_KPROBES is not set
+CONFIG_HAVE_KPROBES=3Dy
+CONFIG_HAVE_KRETPROBES=3Dy
+CONFIG_PROC_PAGE_MONITOR=3Dy
+CONFIG_SLABINFO=3Dy
+CONFIG_RT_MUTEXES=3Dy
+# CONFIG_TINY_SHMEM is not set
+CONFIG_BASE_SMALL=3D0
+CONFIG_MODULES=3Dy
+CONFIG_MODULE_UNLOAD=3Dy
+# CONFIG_MODULE_FORCE_UNLOAD is not set
+CONFIG_MODVERSIONS=3Dy
+# CONFIG_MODULE_SRCVERSION_ALL is not set
+# CONFIG_KMOD is not set
+CONFIG_BLOCK=3Dy
+# CONFIG_LBD is not set
+# CONFIG_BLK_DEV_IO_TRACE is not set
+# CONFIG_LSF is not set
+# CONFIG_BLK_DEV_BSG is not set
+
+#
+# IO Schedulers
+#
+CONFIG_IOSCHED_NOOP=3Dy
+CONFIG_IOSCHED_AS=3Dy
+# CONFIG_IOSCHED_DEADLINE is not set
+# CONFIG_IOSCHED_CFQ is not set
+CONFIG_DEFAULT_AS=3Dy
+# CONFIG_DEFAULT_DEADLINE is not set
+# CONFIG_DEFAULT_CFQ is not set
+# CONFIG_DEFAULT_NOOP is not set
+CONFIG_DEFAULT_IOSCHED=3D"anticipatory"
+CONFIG_CLASSIC_RCU=3Dy
+
+#
+# System Type
+#
+# CONFIG_ARCH_AAEC2000 is not set
+# CONFIG_ARCH_GOLDFISH is not set
+# CONFIG_ARCH_INTEGRATOR is not set
+# CONFIG_ARCH_REALVIEW is not set
+# CONFIG_ARCH_VERSATILE is not set
+# CONFIG_ARCH_AT91 is not set
+# CONFIG_ARCH_CLPS7500 is not set
+# CONFIG_ARCH_CLPS711X is not set
+# CONFIG_ARCH_CO285 is not set
+# CONFIG_ARCH_EBSA110 is not set
+# CONFIG_ARCH_EP93XX is not set
+# CONFIG_ARCH_FOOTBRIDGE is not set
+# CONFIG_ARCH_NETX is not set
+# CONFIG_ARCH_H720X is not set
+# CONFIG_ARCH_IMX is not set
+# CONFIG_ARCH_IOP13XX is not set
+# CONFIG_ARCH_IOP32X is not set
+# CONFIG_ARCH_IOP33X is not set
+# CONFIG_ARCH_IXP23XX is not set
+# CONFIG_ARCH_IXP2000 is not set
+# CONFIG_ARCH_IXP4XX is not set
+# CONFIG_ARCH_L7200 is not set
+# CONFIG_ARCH_KS8695 is not set
+# CONFIG_ARCH_NS9XXX is not set
+# CONFIG_ARCH_MXC is not set
+# CONFIG_ARCH_ORION is not set
+# CONFIG_ARCH_PNX4008 is not set
+# CONFIG_ARCH_PXA is not set
+# CONFIG_ARCH_RPC is not set
+# CONFIG_ARCH_SA1100 is not set
+# CONFIG_ARCH_S3C2410 is not set
+# CONFIG_ARCH_SHARK is not set
+# CONFIG_ARCH_LH7A40X is not set
+# CONFIG_ARCH_DAVINCI is not set
+# CONFIG_ARCH_OMAP is not set
+CONFIG_ARCH_MSM7X00A=3Dy
+
+#
+# Boot options
+#
+
+#
+# Power management
+#
+CONFIG_MSM_AMSS_VERSION=3D6210
+CONFIG_MSM_AMSS_VERSION_6210=3Dy
+# CONFIG_MSM_AMSS_VERSION_6220 is not set
+# CONFIG_MSM_AMSS_VERSION_6225 is not set
+# CONFIG_MACH_HALIBUT is not set
+CONFIG_MACH_HTCVOGUE=3Dy
+CONFIG_MACH_HTCKAISER=3Dy
+CONFIG_MACH_HTCPOLARIS=3Dy
+CONFIG_MACH_HTCNIKE=3Dy
+CONFIG_HTCTITAN=3Dy
+CONFIG_VOGUE_TS=3Dy
+CONFIG_MSM_VOGUESMD=3Dy
+# CONFIG_MSM_LL_DEBUG_UART1 is not set
+# CONFIG_MSM_LL_DEBUG_UART2 is not set
+# CONFIG_MSM_LL_DEBUG_UART3 is not set
+CONFIG_MSM_LL_DEBUG_NONE=3Dy
+CONFIG_MSM7X00A_IDLE=3Dy
+# CONFIG_MSM7X00A_USE_GP_TIMER is not set
+CONFIG_MSM7X00A_USE_DG_TIMER=3Dy
+# CONFIG_MSM7X00A_SLEEP_MODE_POWER_COLLAPSE_SUSPEND is not set
+CONFIG_MSM7X00A_SLEEP_MODE_POWER_COLLAPSE=3Dy
+# CONFIG_MSM7X00A_SLEEP_MODE_APPS_SLEEP is not set
+# CONFIG_MSM7X00A_SLEEP_MODE_RAMP_DOWN_AND_WAIT_FOR_INTERRUPT is not set
+# CONFIG_MSM7X00A_SLEEP_WAIT_FOR_INTERRUPT is not set
+CONFIG_MSM7X00A_SLEEP_MODE=3D1
+# CONFIG_MSM7X00A_IDLE_SLEEP_MODE_POWER_COLLAPSE_SUSPEND is not set
+# CONFIG_MSM7X00A_IDLE_SLEEP_MODE_POWER_COLLAPSE is not set
+# CONFIG_MSM7X00A_IDLE_SLEEP_MODE_APPS_SLEEP is not set
+CONFIG_MSM7X00A_IDLE_SLEEP_MODE_RAMP_DOWN_AND_WAIT_FOR_INTERRUPT=3Dy
+# CONFIG_MSM7X00A_IDLE_SLEEP_WAIT_FOR_INTERRUPT is not set
+CONFIG_MSM7X00A_IDLE_SLEEP_MODE=3D3
+CONFIG_MSM7X00A_IDLE_SLEEP_MIN_TIME=3D20000000
+CONFIG_MSM7X00A_IDLE_SPIN_TIME=3D80000
+# CONFIG_MSM_IDLE_STATS is not set
+# CONFIG_MSM_FIQ_SUPPORT is not set
+# CONFIG_MSM_SERIAL_DEBUGGER is not set
+# CONFIG_MSM_SMD is not set
+# CONFIG_MSM_ONCRPCROUTER is not set
+# CONFIG_MSM_HW3D is not set
+CONFIG_MSM_ADSP=3Dy
+# CONFIG_MSM_PERF is not set
+
+#
+# Processor Type
+#
+CONFIG_CPU_32=3Dy
+CONFIG_CPU_V6=3Dy
+# CONFIG_CPU_32v6K is not set
+CONFIG_CPU_32v6=3Dy
+CONFIG_CPU_ABRT_EV6=3Dy
+CONFIG_CPU_CACHE_V6=3Dy
+CONFIG_CPU_CACHE_VIPT=3Dy
+CONFIG_CPU_COPY_V6=3Dy
+CONFIG_CPU_TLB_V6=3Dy
+CONFIG_CPU_HAS_ASID=3Dy
+CONFIG_CPU_CP15=3Dy
+CONFIG_CPU_CP15_MMU=3Dy
+
+#
+# Processor Features
+#
+CONFIG_ARM_THUMB=3Dy
+# CONFIG_CPU_ICACHE_DISABLE is not set
+# CONFIG_CPU_DCACHE_DISABLE is not set
+# CONFIG_CPU_BPREDICT_DISABLE is not set
+# CONFIG_OUTER_CACHE is not set
+
+#
+# Bus support
+#
+# CONFIG_PCI_SYSCALL is not set
+# CONFIG_ARCH_SUPPORTS_MSI is not set
+# CONFIG_PCCARD is not set
+
+#
+# Kernel Features
+#
+CONFIG_TICK_ONESHOT=3Dy
+CONFIG_NO_HZ=3Dy
+CONFIG_HIGH_RES_TIMERS=3Dy
+CONFIG_GENERIC_CLOCKEVENTS_BUILD=3Dy
+CONFIG_PREEMPT=3Dy
+CONFIG_HZ=3D100
+CONFIG_AEABI=3Dy
+# CONFIG_OABI_COMPAT is not set
+# CONFIG_ARCH_DISCONTIGMEM_ENABLE is not set
+CONFIG_SELECT_MEMORY_MODEL=3Dy
+CONFIG_FLATMEM_MANUAL=3Dy
+# CONFIG_DISCONTIGMEM_MANUAL is not set
+# CONFIG_SPARSEMEM_MANUAL is not set
+CONFIG_FLATMEM=3Dy
+CONFIG_FLAT_NODE_MEM_MAP=3Dy
+# CONFIG_SPARSEMEM_STATIC is not set
+# CONFIG_SPARSEMEM_VMEMMAP_ENABLE is not set
+CONFIG_SPLIT_PTLOCK_CPUS=3D4
+CONFIG_RESOURCES_64BIT=3Dy
+CONFIG_ZONE_DMA_FLAG=3D1
+CONFIG_BOUNCE=3Dy
+CONFIG_VIRT_TO_BUS=3Dy
+CONFIG_ALIGNMENT_TRAP=3Dy
+
+#
+# Boot options
+#
+CONFIG_ZBOOT_ROM_TEXT=3D0x0
+CONFIG_ZBOOT_ROM_BSS=3D0x0
+CONFIG_CMDLINE=3D""
+# CONFIG_XIP_KERNEL is not set
+# CONFIG_KEXEC is not set
+
+#
+# CPU Frequency scaling
+#
+# CONFIG_CPU_FREQ is not set
+
+#
+# Floating point emulation
+#
+
+#
+# At least one emulation must be selected
+#
+# CONFIG_VFP is not set
+
+#
+# Userspace binary formats
+#
+CONFIG_BINFMT_ELF=3Dy
+# CONFIG_BINFMT_AOUT is not set
+# CONFIG_BINFMT_MISC is not set
+
+#
+# Power management options
+#
+CONFIG_PM=3Dy
+# CONFIG_PM_LEGACY is not set
+CONFIG_PM_DEBUG=3Dy
+# CONFIG_PM_VERBOSE is not set
+CONFIG_CAN_PM_TRACE=3Dy
+CONFIG_PM_SLEEP=3Dy
+CONFIG_SUSPEND=3Dy
+CONFIG_SUSPEND_FREEZER=3Dy
+# CONFIG_APM_EMULATION is not set
+CONFIG_ARCH_SUSPEND_POSSIBLE=3Dy
+
+#
+# Networking
+#
+CONFIG_NET=3Dy
+
+#
+# Networking options
+#
+# CONFIG_PACKET is not set
+CONFIG_UNIX=3Dy
+# CONFIG_NET_KEY is not set
+CONFIG_INET=3Dy
+# CONFIG_IP_MULTICAST is not set
+# CONFIG_IP_ADVANCED_ROUTER is not set
+CONFIG_IP_FIB_HASH=3Dy
+# CONFIG_IP_PNP is not set
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
+# CONFIG_TCP_CONG_ADVANCED is not set
+CONFIG_TCP_CONG_CUBIC=3Dy
+CONFIG_DEFAULT_TCP_CONG=3D"cubic"
+# CONFIG_TCP_MD5SIG is not set
+# CONFIG_IPV6 is not set
+# CONFIG_INET6_XFRM_TUNNEL is not set
+# CONFIG_INET6_TUNNEL is not set
+# CONFIG_NETWORK_SECMARK is not set
+# CONFIG_NETFILTER is not set
+# CONFIG_IP_DCCP is not set
+# CONFIG_IP_SCTP is not set
+# CONFIG_TIPC is not set
+# CONFIG_ATM is not set
+# CONFIG_BRIDGE is not set
+# CONFIG_VLAN_8021Q is not set
+# CONFIG_DECNET is not set
+# CONFIG_LLC2 is not set
+# CONFIG_IPX is not set
+# CONFIG_ATALK is not set
+# CONFIG_X25 is not set
+# CONFIG_LAPB is not set
+# CONFIG_ECONET is not set
+# CONFIG_WAN_ROUTER is not set
+# CONFIG_NET_SCHED is not set
+
+#
+# Network testing
+#
+# CONFIG_NET_PKTGEN is not set
+# CONFIG_HAMRADIO is not set
+# CONFIG_CAN is not set
+# CONFIG_IRDA is not set
+CONFIG_BT=3Dy
+# CONFIG_BT_L2CAP is not set
+# CONFIG_BT_SCO is not set
+
+#
+# Bluetooth device drivers
+#
+# CONFIG_BT_HCIBTSDIO is not set
+CONFIG_BT_HCIUART=3Dy
+CONFIG_BT_HCIUART_H4=3Dy
+# CONFIG_BT_HCIUART_BCSP is not set
+# CONFIG_BT_HCIUART_LL is not set
+# CONFIG_BT_HCIUART_LL_USE_MSM_SERIAL_CLOCK_CONTROL is not set
+# CONFIG_BT_HCIVHCI is not set
+# CONFIG_AF_RXRPC is not set
+
+#
+# Wireless
+#
+# CONFIG_CFG80211 is not set
+# CONFIG_WIRELESS_EXT is not set
+# CONFIG_MAC80211 is not set
+# CONFIG_IEEE80211 is not set
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
+# CONFIG_DEBUG_DRIVER is not set
+# CONFIG_DEBUG_DEVRES is not set
+# CONFIG_SYS_HYPERVISOR is not set
+# CONFIG_CONNECTOR is not set
+# CONFIG_MTD is not set
+# CONFIG_PARPORT is not set
+CONFIG_BLK_DEV=3Dy
+# CONFIG_BLK_DEV_COW_COMMON is not set
+CONFIG_BLK_DEV_LOOP=3Dy
+# CONFIG_BLK_DEV_CRYPTOLOOP is not set
+# CONFIG_BLK_DEV_NBD is not set
+# CONFIG_BLK_DEV_RAM is not set
+# CONFIG_CDROM_PKTCDVD is not set
+# CONFIG_ATA_OVER_ETH is not set
+CONFIG_MISC_DEVICES=3Dy
+# CONFIG_EEPROM_93CX6 is not set
+CONFIG_LOW_MEMORY_KILLER=3Dy
+CONFIG_KERNEL_DEBUGGER_CORE=3Dy
+# CONFIG_ENCLOSURE_SERVICES is not set
+# CONFIG_HAVE_IDE is not set
+
+#
+# SCSI device support
+#
+# CONFIG_RAID_ATTRS is not set
+# CONFIG_SCSI is not set
+# CONFIG_SCSI_DMA is not set
+# CONFIG_SCSI_NETLINK is not set
+# CONFIG_ATA is not set
+# CONFIG_MD is not set
+CONFIG_NETDEVICES=3Dy
+# CONFIG_NETDEVICES_MULTIQUEUE is not set
+# CONFIG_DUMMY is not set
+# CONFIG_BONDING is not set
+# CONFIG_MACVLAN is not set
+# CONFIG_EQUALIZER is not set
+# CONFIG_TUN is not set
+# CONFIG_VETH is not set
+# CONFIG_NET_ETHERNET is not set
+# CONFIG_NETDEV_1000 is not set
+# CONFIG_NETDEV_10000 is not set
+
+#
+# Wireless LAN
+#
+# CONFIG_WLAN_PRE80211 is not set
+# CONFIG_WLAN_80211 is not set
+# CONFIG_WAN is not set
+CONFIG_PPP=3Dy
+# CONFIG_PPP_MULTILINK is not set
+# CONFIG_PPP_FILTER is not set
+CONFIG_PPP_ASYNC=3Dy
+# CONFIG_PPP_SYNC_TTY is not set
+CONFIG_PPP_DEFLATE=3Dy
+CONFIG_PPP_BSDCOMP=3Dy
+# CONFIG_PPP_MPPE is not set
+# CONFIG_PPPOE is not set
+# CONFIG_PPPOL2TP is not set
+# CONFIG_SLIP is not set
+CONFIG_SLHC=3Dy
+# CONFIG_NETCONSOLE is not set
+# CONFIG_MSM_RMNET is not set
+# CONFIG_NETPOLL is not set
+# CONFIG_NET_POLL_CONTROLLER is not set
+# CONFIG_ISDN is not set
+
+#
+# Input device support
+#
+CONFIG_INPUT=3Dy
+# CONFIG_INPUT_FF_MEMLESS is not set
+# CONFIG_INPUT_POLLDEV is not set
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
+# CONFIG_KEYBOARD_ATKBD is not set
+# CONFIG_KEYBOARD_SUNKBD is not set
+# CONFIG_KEYBOARD_LKKBD is not set
+# CONFIG_KEYBOARD_XTKBD is not set
+# CONFIG_KEYBOARD_NEWTON is not set
+# CONFIG_KEYBOARD_STOWAWAY is not set
+# CONFIG_KEYBOARD_GOLDFISH_EVENTS is not set
+# CONFIG_INPUT_MOUSE is not set
+# CONFIG_INPUT_JOYSTICK is not set
+# CONFIG_INPUT_TABLET is not set
+# CONFIG_INPUT_TOUCHSCREEN is not set
+CONFIG_INPUT_MISC=3Dy
+# CONFIG_INPUT_UINPUT is not set
+CONFIG_INPUT_GPIO=3Dy
+
+#
+# Hardware I/O ports
+#
+# CONFIG_SERIO is not set
+# CONFIG_GAMEPORT is not set
+
+#
+# Character devices
+#
+CONFIG_VT=3Dy
+CONFIG_VT_CONSOLE=3Dy
+CONFIG_HW_CONSOLE=3Dy
+CONFIG_VT_HW_CONSOLE_BINDING=3Dy
+# CONFIG_SERIAL_NONSTANDARD is not set
+
+#
+# Serial drivers
+#
+# CONFIG_SERIAL_8250 is not set
+
+#
+# Non-8250 serial port support
+#
+CONFIG_SERIAL_CORE=3Dy
+CONFIG_SERIAL_CORE_CONSOLE=3Dy
+CONFIG_SERIAL_MSM=3Dy
+CONFIG_SERIAL_MSM_CONSOLE=3Dy
+CONFIG_SERIAL_MSM_CLOCK_CONTROL=3Dy
+# CONFIG_SERIAL_MSM_RX_WAKEUP is not set
+CONFIG_UNIX98_PTYS=3Dy
+# CONFIG_LEGACY_PTYS is not set
+# CONFIG_IPMI_HANDLER is not set
+# CONFIG_HW_RANDOM is not set
+# CONFIG_NVRAM is not set
+# CONFIG_R3964 is not set
+# CONFIG_RAW_DRIVER is not set
+# CONFIG_TCG_TPM is not set
+CONFIG_DEVMEM=3Dy
+# CONFIG_GOLDFISH_TTY is not set
+# CONFIG_DCC_TTY is not set
+CONFIG_I2C=3Dy
+CONFIG_I2C_BOARDINFO=3Dy
+# CONFIG_I2C_CHARDEV is not set
+
+#
+# I2C Algorithms
+#
+# CONFIG_I2C_ALGOBIT is not set
+# CONFIG_I2C_ALGOPCF is not set
+# CONFIG_I2C_ALGOPCA is not set
+
+#
+# I2C Hardware Bus support
+#
+CONFIG_I2C_MSM=3Dy
+# CONFIG_I2C_OCORES is not set
+# CONFIG_I2C_PARPORT_LIGHT is not set
+# CONFIG_I2C_SIMTEC is not set
+# CONFIG_I2C_TAOS_EVM is not set
+# CONFIG_I2C_STUB is not set
+
+#
+# Miscellaneous I2C Chip support
+#
+# CONFIG_DS1682 is not set
+# CONFIG_SENSORS_EEPROM is not set
+# CONFIG_SENSORS_PCF8574 is not set
+# CONFIG_PCF8575 is not set
+# CONFIG_SENSORS_PCF8591 is not set
+# CONFIG_TPS65010 is not set
+# CONFIG_SENSORS_MAX6875 is not set
+# CONFIG_SENSORS_TSL2550 is not set
+CONFIG_S5K4B1FX=3Dy
+# CONFIG_I2C_DEBUG_CORE is not set
+# CONFIG_I2C_DEBUG_ALGO is not set
+# CONFIG_I2C_DEBUG_BUS is not set
+# CONFIG_I2C_DEBUG_CHIP is not set
+
+#
+# SPI support
+#
+# CONFIG_SPI is not set
+# CONFIG_SPI_MASTER is not set
+# CONFIG_W1 is not set
+CONFIG_POWER_SUPPLY=3Dy
+# CONFIG_POWER_SUPPLY_DEBUG is not set
+# CONFIG_PDA_POWER is not set
+# CONFIG_BATTERY_DS2760 is not set
+# CONFIG_BATTERY_GOLDFISH is not set
+# CONFIG_HWMON is not set
+# CONFIG_WATCHDOG is not set
+
+#
+# Sonics Silicon Backplane
+#
+CONFIG_SSB_POSSIBLE=3Dy
+# CONFIG_SSB is not set
+
+#
+# Multifunction device drivers
+#
+# CONFIG_MFD_SM501 is not set
+# CONFIG_HTC_EGPIO is not set
+
+#
+# Multimedia devices
+#
+# CONFIG_VIDEO_DEV is not set
+# CONFIG_DVB_CORE is not set
+CONFIG_DAB=3Dy
+
+#
+# Graphics support
+#
+# CONFIG_VGASTATE is not set
+CONFIG_VIDEO_OUTPUT_CONTROL=3Dy
+CONFIG_FB=3Dy
+# CONFIG_FIRMWARE_EDID is not set
+# CONFIG_FB_DDC is not set
+CONFIG_FB_CFB_FILLRECT=3Dy
+CONFIG_FB_CFB_COPYAREA=3Dy
+CONFIG_FB_CFB_IMAGEBLIT=3Dy
+# CONFIG_FB_CFB_REV_PIXELS_IN_BYTE is not set
+# CONFIG_FB_SYS_FILLRECT is not set
+# CONFIG_FB_SYS_COPYAREA is not set
+# CONFIG_FB_SYS_IMAGEBLIT is not set
+# CONFIG_FB_SYS_FOPS is not set
+CONFIG_FB_DEFERRED_IO=3Dy
+# CONFIG_FB_SVGALIB is not set
+# CONFIG_FB_MACMODES is not set
+# CONFIG_FB_BACKLIGHT is not set
+CONFIG_FB_MODE_HELPERS=3Dy
+CONFIG_FB_TILEBLITTING=3Dy
+
+#
+# Frame buffer hardware drivers
+#
+# CONFIG_FB_S1D13XXX is not set
+# CONFIG_FB_GOLDFISH is not set
+CONFIG_FB_MSM=3Dy
+# CONFIG_FB_MSM_LOGO is not set
+# CONFIG_FB_MSM_REFRESH is not set
+# CONFIG_FB_VIRTUAL is not set
+# CONFIG_BACKLIGHT_LCD_SUPPORT is not set
+
+#
+# Display device support
+#
+# CONFIG_DISPLAY_SUPPORT is not set
+
+#
+# Console display driver support
+#
+# CONFIG_VGA_CONSOLE is not set
+CONFIG_DUMMY_CONSOLE=3Dy
+CONFIG_FRAMEBUFFER_CONSOLE=3Dy
+CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY=3Dy
+CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=3Dy
+CONFIG_FONTS=3Dy
+CONFIG_FONT_8x8=3Dy
+# CONFIG_FONT_8x16 is not set
+# CONFIG_FONT_6x11 is not set
+# CONFIG_FONT_7x14 is not set
+# CONFIG_FONT_PEARL_8x8 is not set
+# CONFIG_FONT_ACORN_8x8 is not set
+# CONFIG_FONT_MINI_4x6 is not set
+# CONFIG_FONT_SUN8x16 is not set
+# CONFIG_FONT_SUN12x22 is not set
+# CONFIG_FONT_10x18 is not set
+CONFIG_LOGO=3Dy
+# CONFIG_LOGO_LINUX_MONO is not set
+# CONFIG_LOGO_LINUX_VGA16 is not set
+CONFIG_LOGO_LINUX_CLUT224=3Dy
+
+#
+# Sound
+#
+# CONFIG_SOUND is not set
+# CONFIG_HID_SUPPORT is not set
+# CONFIG_USB_SUPPORT is not set
+CONFIG_MMC=3Dy
+# CONFIG_MMC_DEBUG is not set
+# CONFIG_MMC_UNSAFE_RESUME is not set
+CONFIG_MMC_EMBEDDED_SDIO=3Dy
+
+#
+# MMC/SD Card Drivers
+#
+CONFIG_MMC_BLOCK=3Dy
+# CONFIG_MMC_BLOCK_BOUNCE is not set
+# CONFIG_SDIO_UART is not set
+# CONFIG_MMC_TEST is not set
+
+#
+# MMC/SD Host Controller Drivers
+#
+CONFIG_MMC_MSM7X00A=3Dy
+CONFIG_NEW_LEDS=3Dy
+CONFIG_LEDS_CLASS=3Dy
+
+#
+# LED drivers
+#
+
+#
+# LED Triggers
+#
+# CONFIG_LEDS_TRIGGERS is not set
+# CONFIG_SWITCH is not set
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
+# I2C RTC drivers
+#
+# CONFIG_RTC_DRV_DS1307 is not set
+# CONFIG_RTC_DRV_DS1374 is not set
+# CONFIG_RTC_DRV_DS1672 is not set
+# CONFIG_RTC_DRV_MAX6900 is not set
+# CONFIG_RTC_DRV_RS5C372 is not set
+# CONFIG_RTC_DRV_ISL1208 is not set
+# CONFIG_RTC_DRV_X1205 is not set
+# CONFIG_RTC_DRV_PCF8563 is not set
+# CONFIG_RTC_DRV_PCF8583 is not set
+# CONFIG_RTC_DRV_M41T80 is not set
+# CONFIG_RTC_DRV_S35390A is not set
+
+#
+# SPI RTC drivers
+#
+
+#
+# Platform RTC drivers
+#
+# CONFIG_RTC_DRV_CMOS is not set
+# CONFIG_RTC_DRV_DS1511 is not set
+# CONFIG_RTC_DRV_DS1553 is not set
+# CONFIG_RTC_DRV_DS1742 is not set
+# CONFIG_RTC_DRV_STK17TA8 is not set
+# CONFIG_RTC_DRV_M48T86 is not set
+# CONFIG_RTC_DRV_M48T59 is not set
+# CONFIG_RTC_DRV_V3020 is not set
+
+#
+# on-CPU RTC drivers
+#
+# CONFIG_RTC_DRV_GOLDFISH is not set
+# CONFIG_RTC_DRV_MSM7X00A is not set
+CONFIG_RTC_DRV_MSM7X00=3Dy
+
+#
+# Android
+#
+CONFIG_ANDROID_BINDER_IPC=3Dy
+# CONFIG_ANDROID_PMEM is not set
+CONFIG_ANDROID_POWER=3Dy
+CONFIG_ANDROID_POWER_STAT=3Dy
+CONFIG_ANDROID_POWER_ALARM=3Dy
+CONFIG_ANDROID_LOGGER=3Dy
+CONFIG_ANDROID_RAM_CONSOLE=3Dy
+CONFIG_ANDROID_RAM_CONSOLE_ENABLE_VERBOSE=3Dy
+# CONFIG_ANDROID_RAM_CONSOLE_ERROR_CORRECTION is not set
+# CONFIG_ANDROID_RAM_CONSOLE_EARLY_INIT is not set
+CONFIG_ANDROID_PARANOID_NETWORK=3Dy
+
+#
+# File systems
+#
+CONFIG_EXT2_FS=3Dy
+CONFIG_EXT2_FS_XATTR=3Dy
+# CONFIG_EXT2_FS_POSIX_ACL is not set
+# CONFIG_EXT2_FS_SECURITY is not set
+# CONFIG_EXT2_FS_XIP is not set
+CONFIG_EXT3_FS=3Dy
+CONFIG_EXT3_FS_XATTR=3Dy
+# CONFIG_EXT3_FS_POSIX_ACL is not set
+# CONFIG_EXT3_FS_SECURITY is not set
+# CONFIG_EXT4DEV_FS is not set
+CONFIG_JBD=3Dy
+CONFIG_FS_MBCACHE=3Dy
+# CONFIG_REISERFS_FS is not set
+# CONFIG_JFS_FS is not set
+# CONFIG_FS_POSIX_ACL is not set
+# CONFIG_XFS_FS is not set
+# CONFIG_GFS2_FS is not set
+# CONFIG_OCFS2_FS is not set
+CONFIG_DNOTIFY=3Dy
+CONFIG_INOTIFY=3Dy
+CONFIG_INOTIFY_USER=3Dy
+# CONFIG_QUOTA is not set
+# CONFIG_AUTOFS_FS is not set
+# CONFIG_AUTOFS4_FS is not set
+# CONFIG_FUSE_FS is not set
+
+#
+# CD-ROM/DVD Filesystems
+#
+# CONFIG_ISO9660_FS is not set
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
+# CONFIG_NTFS_FS is not set
+
+#
+# Pseudo filesystems
+#
+CONFIG_PROC_FS=3Dy
+CONFIG_PROC_SYSCTL=3Dy
+CONFIG_SYSFS=3Dy
+CONFIG_TMPFS=3Dy
+# CONFIG_TMPFS_POSIX_ACL is not set
+# CONFIG_HUGETLB_PAGE is not set
+# CONFIG_CONFIGFS_FS is not set
+
+#
+# Miscellaneous filesystems
+#
+# CONFIG_ADFS_FS is not set
+# CONFIG_AFFS_FS is not set
+# CONFIG_HFS_FS is not set
+# CONFIG_HFSPLUS_FS is not set
+# CONFIG_BEFS_FS is not set
+# CONFIG_BFS_FS is not set
+# CONFIG_EFS_FS is not set
+CONFIG_CRAMFS=3Dy
+# CONFIG_VXFS_FS is not set
+# CONFIG_MINIX_FS is not set
+# CONFIG_HPFS_FS is not set
+# CONFIG_QNX4FS_FS is not set
+# CONFIG_ROMFS_FS is not set
+# CONFIG_SYSV_FS is not set
+# CONFIG_UFS_FS is not set
+CONFIG_NETWORK_FILESYSTEMS=3Dy
+# CONFIG_NFS_FS is not set
+# CONFIG_NFSD is not set
+# CONFIG_SMB_FS is not set
+# CONFIG_CIFS is not set
+# CONFIG_NCP_FS is not set
+# CONFIG_CODA_FS is not set
+# CONFIG_AFS_FS is not set
+
+#
+# Partition Types
+#
+CONFIG_PARTITION_ADVANCED=3Dy
+# CONFIG_ACORN_PARTITION is not set
+# CONFIG_OSF_PARTITION is not set
+# CONFIG_AMIGA_PARTITION is not set
+# CONFIG_ATARI_PARTITION is not set
+# CONFIG_MAC_PARTITION is not set
+CONFIG_MSDOS_PARTITION=3Dy
+# CONFIG_BSD_DISKLABEL is not set
+# CONFIG_MINIX_SUBPARTITION is not set
+# CONFIG_SOLARIS_X86_PARTITION is not set
+# CONFIG_UNIXWARE_DISKLABEL is not set
+# CONFIG_LDM_PARTITION is not set
+# CONFIG_SGI_PARTITION is not set
+# CONFIG_ULTRIX_PARTITION is not set
+# CONFIG_SUN_PARTITION is not set
+# CONFIG_KARMA_PARTITION is not set
+# CONFIG_EFI_PARTITION is not set
+# CONFIG_SYSV68_PARTITION is not set
+CONFIG_NLS=3Dy
+CONFIG_NLS_DEFAULT=3D"iso8859-1"
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
+# CONFIG_NLS_UTF8 is not set
+# CONFIG_DLM is not set
+
+#
+# Kernel hacking
+#
+CONFIG_PRINTK_TIME=3Dy
+CONFIG_ENABLE_WARN_DEPRECATED=3Dy
+CONFIG_ENABLE_MUST_CHECK=3Dy
+CONFIG_MAGIC_SYSRQ=3Dy
+# CONFIG_UNUSED_SYMBOLS is not set
+# CONFIG_DEBUG_FS is not set
+# CONFIG_HEADERS_CHECK is not set
+CONFIG_DEBUG_KERNEL=3Dy
+# CONFIG_DEBUG_SHIRQ is not set
+CONFIG_DETECT_SOFTLOCKUP=3Dy
+CONFIG_SCHED_DEBUG=3Dy
+# CONFIG_SCHEDSTATS is not set
+# CONFIG_TIMER_STATS is not set
+# CONFIG_DEBUG_SLAB is not set
+CONFIG_DEBUG_PREEMPT=3Dy
+# CONFIG_DEBUG_RT_MUTEXES is not set
+# CONFIG_RT_MUTEX_TESTER is not set
+# CONFIG_DEBUG_SPINLOCK is not set
+# CONFIG_DEBUG_MUTEXES is not set
+# CONFIG_DEBUG_LOCK_ALLOC is not set
+# CONFIG_PROVE_LOCKING is not set
+# CONFIG_LOCK_STAT is not set
+# CONFIG_DEBUG_SPINLOCK_SLEEP is not set
+# CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
+# CONFIG_DEBUG_KOBJECT is not set
+# CONFIG_DEBUG_BUGVERBOSE is not set
+# CONFIG_DEBUG_INFO is not set
+# CONFIG_DEBUG_VM is not set
+# CONFIG_DEBUG_LIST is not set
+# CONFIG_DEBUG_SG is not set
+CONFIG_FRAME_POINTER=3Dy
+# CONFIG_BOOT_PRINTK_DELAY is not set
+# CONFIG_RCU_TORTURE_TEST is not set
+# CONFIG_BACKTRACE_SELF_TEST is not set
+# CONFIG_FAULT_INJECTION is not set
+# CONFIG_LATENCYTOP is not set
+# CONFIG_SAMPLES is not set
+CONFIG_DEBUG_USER=3Dy
+# CONFIG_DEBUG_ERRORS is not set
+# CONFIG_DEBUG_STACK_USAGE is not set
+# CONFIG_DEBUG_LL is not set
+
+#
+# Security options
+#
+# CONFIG_KEYS is not set
+# CONFIG_SECURITY is not set
+# CONFIG_SECURITY_FILE_CAPABILITIES is not set
+# CONFIG_CRYPTO is not set
+
+#
+# Library routines
+#
+CONFIG_BITREVERSE=3Dy
+CONFIG_CRC_CCITT=3Dy
+# CONFIG_CRC16 is not set
+# CONFIG_CRC_ITU_T is not set
+CONFIG_CRC32=3Dy
+# CONFIG_CRC7 is not set
+# CONFIG_LIBCRC32C is not set
+CONFIG_ZLIB_INFLATE=3Dy
+CONFIG_ZLIB_DEFLATE=3Dy
+CONFIG_PLIST=3Dy
+CONFIG_HAS_IOMEM=3Dy
+CONFIG_HAS_IOPORT=3Dy
+CONFIG_HAS_DMA=3Dy
diff --git a/recipes/linux/linux-replicant/htcvogue/defconfig b/recipes/lin=
ux/linux-replicant/htcvogue/defconfig
new file mode 100644
index 0000000..c1f3084
--- /dev/null
+++ b/recipes/linux/linux-replicant/htcvogue/defconfig
@@ -0,0 +1,1026 @@
+#
+# Automatically generated make config: don't edit
+# Linux kernel version: 2.6.25
+# Thu Apr  9 20:12:53 2009
+#
+CONFIG_ARM=3Dy
+CONFIG_SYS_SUPPORTS_APM_EMULATION=3Dy
+# CONFIG_GENERIC_GPIO is not set
+CONFIG_GENERIC_TIME=3Dy
+CONFIG_GENERIC_CLOCKEVENTS=3Dy
+CONFIG_MMU=3Dy
+# CONFIG_NO_IOPORT is not set
+CONFIG_GENERIC_HARDIRQS=3Dy
+CONFIG_STACKTRACE_SUPPORT=3Dy
+CONFIG_HAVE_LATENCYTOP_SUPPORT=3Dy
+CONFIG_LOCKDEP_SUPPORT=3Dy
+CONFIG_TRACE_IRQFLAGS_SUPPORT=3Dy
+CONFIG_HARDIRQS_SW_RESEND=3Dy
+CONFIG_GENERIC_IRQ_PROBE=3Dy
+CONFIG_RWSEM_GENERIC_SPINLOCK=3Dy
+# CONFIG_ARCH_HAS_ILOG2_U32 is not set
+# CONFIG_ARCH_HAS_ILOG2_U64 is not set
+CONFIG_GENERIC_HWEIGHT=3Dy
+CONFIG_GENERIC_CALIBRATE_DELAY=3Dy
+CONFIG_ARCH_SUPPORTS_AOUT=3Dy
+CONFIG_ZONE_DMA=3Dy
+CONFIG_VECTORS_BASE=3D0xffff0000
+CONFIG_DEFCONFIG_LIST=3D"/lib/modules/$UNAME_RELEASE/.config"
+
+#
+# General setup
+#
+CONFIG_EXPERIMENTAL=3Dy
+CONFIG_BROKEN_ON_SMP=3Dy
+CONFIG_LOCK_KERNEL=3Dy
+CONFIG_INIT_ENV_ARG_LIMIT=3D32
+CONFIG_LOCALVERSION=3D""
+CONFIG_LOCALVERSION_AUTO=3Dy
+CONFIG_SWAP=3Dy
+# CONFIG_SYSVIPC is not set
+# CONFIG_POSIX_MQUEUE is not set
+# CONFIG_BSD_PROCESS_ACCT is not set
+# CONFIG_TASKSTATS is not set
+# CONFIG_AUDIT is not set
+CONFIG_IKCONFIG=3Dy
+CONFIG_IKCONFIG_PROC=3Dy
+CONFIG_LOG_BUF_SHIFT=3D17
+# CONFIG_CGROUPS is not set
+# CONFIG_GROUP_SCHED is not set
+CONFIG_SYSFS_DEPRECATED=3Dy
+CONFIG_SYSFS_DEPRECATED_V2=3Dy
+# CONFIG_RELAY is not set
+# CONFIG_NAMESPACES is not set
+CONFIG_BLK_DEV_INITRD=3Dy
+CONFIG_INITRAMFS_SOURCE=3D""
+CONFIG_CC_OPTIMIZE_FOR_SIZE=3Dy
+CONFIG_SYSCTL=3Dy
+CONFIG_PANIC_TIMEOUT=3D3
+CONFIG_EMBEDDED=3Dy
+CONFIG_UID16=3Dy
+CONFIG_SYSCTL_SYSCALL=3Dy
+CONFIG_KALLSYMS=3Dy
+# CONFIG_KALLSYMS_ALL is not set
+# CONFIG_KALLSYMS_EXTRA_PASS is not set
+CONFIG_HOTPLUG=3Dy
+CONFIG_PRINTK=3Dy
+CONFIG_BUG=3Dy
+CONFIG_ELF_CORE=3Dy
+CONFIG_COMPAT_BRK=3Dy
+CONFIG_BASE_FULL=3Dy
+CONFIG_FUTEX=3Dy
+CONFIG_ANON_INODES=3Dy
+CONFIG_EPOLL=3Dy
+CONFIG_SIGNALFD=3Dy
+CONFIG_TIMERFD=3Dy
+CONFIG_EVENTFD=3Dy
+CONFIG_SHMEM=3Dy
+CONFIG_ASHMEM=3Dy
+CONFIG_VM_EVENT_COUNTERS=3Dy
+CONFIG_SLAB=3Dy
+# CONFIG_SLUB is not set
+# CONFIG_SLOB is not set
+# CONFIG_PROFILING is not set
+# CONFIG_MARKERS is not set
+CONFIG_HAVE_OPROFILE=3Dy
+# CONFIG_KPROBES is not set
+CONFIG_HAVE_KPROBES=3Dy
+CONFIG_HAVE_KRETPROBES=3Dy
+CONFIG_PROC_PAGE_MONITOR=3Dy
+CONFIG_SLABINFO=3Dy
+CONFIG_RT_MUTEXES=3Dy
+# CONFIG_TINY_SHMEM is not set
+CONFIG_BASE_SMALL=3D0
+CONFIG_MODULES=3Dy
+CONFIG_MODULE_UNLOAD=3Dy
+CONFIG_MODULE_FORCE_UNLOAD=3Dy
+# CONFIG_MODVERSIONS is not set
+# CONFIG_MODULE_SRCVERSION_ALL is not set
+# CONFIG_KMOD is not set
+CONFIG_BLOCK=3Dy
+# CONFIG_LBD is not set
+# CONFIG_BLK_DEV_IO_TRACE is not set
+# CONFIG_LSF is not set
+# CONFIG_BLK_DEV_BSG is not set
+
+#
+# IO Schedulers
+#
+CONFIG_IOSCHED_NOOP=3Dy
+CONFIG_IOSCHED_AS=3Dy
+# CONFIG_IOSCHED_DEADLINE is not set
+# CONFIG_IOSCHED_CFQ is not set
+CONFIG_DEFAULT_AS=3Dy
+# CONFIG_DEFAULT_DEADLINE is not set
+# CONFIG_DEFAULT_CFQ is not set
+# CONFIG_DEFAULT_NOOP is not set
+CONFIG_DEFAULT_IOSCHED=3D"anticipatory"
+CONFIG_CLASSIC_RCU=3Dy
+
+#
+# System Type
+#
+# CONFIG_ARCH_AAEC2000 is not set
+# CONFIG_ARCH_GOLDFISH is not set
+# CONFIG_ARCH_INTEGRATOR is not set
+# CONFIG_ARCH_REALVIEW is not set
+# CONFIG_ARCH_VERSATILE is not set
+# CONFIG_ARCH_AT91 is not set
+# CONFIG_ARCH_CLPS7500 is not set
+# CONFIG_ARCH_CLPS711X is not set
+# CONFIG_ARCH_CO285 is not set
+# CONFIG_ARCH_EBSA110 is not set
+# CONFIG_ARCH_EP93XX is not set
+# CONFIG_ARCH_FOOTBRIDGE is not set
+# CONFIG_ARCH_NETX is not set
+# CONFIG_ARCH_H720X is not set
+# CONFIG_ARCH_IMX is not set
+# CONFIG_ARCH_IOP13XX is not set
+# CONFIG_ARCH_IOP32X is not set
+# CONFIG_ARCH_IOP33X is not set
+# CONFIG_ARCH_IXP23XX is not set
+# CONFIG_ARCH_IXP2000 is not set
+# CONFIG_ARCH_IXP4XX is not set
+# CONFIG_ARCH_L7200 is not set
+# CONFIG_ARCH_KS8695 is not set
+# CONFIG_ARCH_NS9XXX is not set
+# CONFIG_ARCH_MXC is not set
+# CONFIG_ARCH_ORION is not set
+# CONFIG_ARCH_PNX4008 is not set
+# CONFIG_ARCH_PXA is not set
+# CONFIG_ARCH_RPC is not set
+# CONFIG_ARCH_SA1100 is not set
+# CONFIG_ARCH_S3C2410 is not set
+# CONFIG_ARCH_SHARK is not set
+# CONFIG_ARCH_LH7A40X is not set
+# CONFIG_ARCH_DAVINCI is not set
+# CONFIG_ARCH_OMAP is not set
+CONFIG_ARCH_MSM7X00A=3Dy
+
+#
+# Boot options
+#
+
+#
+# Power management
+#
+CONFIG_MSM_AMSS_VERSION=3D6210
+CONFIG_MSM_AMSS_VERSION_6210=3Dy
+# CONFIG_MSM_AMSS_VERSION_6220 is not set
+# CONFIG_MSM_AMSS_VERSION_6225 is not set
+# CONFIG_MACH_HALIBUT is not set
+CONFIG_MACH_HTCVOGUE=3Dy
+CONFIG_MACH_HTCKAISER=3Dy
+CONFIG_MACH_HTCPOLARIS=3Dy
+CONFIG_MACH_HTCNIKE=3Dy
+CONFIG_MACH_HTCTITAN=3Dy
+CONFIG_VOGUE_TS=3Dy
+CONFIG_MSM_VOGUESMD=3Dy
+# CONFIG_MSM_LL_DEBUG_UART1 is not set
+# CONFIG_MSM_LL_DEBUG_UART2 is not set
+# CONFIG_MSM_LL_DEBUG_UART3 is not set
+CONFIG_MSM_LL_DEBUG_NONE=3Dy
+CONFIG_MSM7X00A_IDLE=3Dy
+CONFIG_MSM7X00A_USE_GP_TIMER=3Dy
+# CONFIG_MSM7X00A_USE_DG_TIMER is not set
+# CONFIG_MSM7X00A_SLEEP_MODE_POWER_COLLAPSE_SUSPEND is not set
+CONFIG_MSM7X00A_SLEEP_MODE_POWER_COLLAPSE=3Dy
+# CONFIG_MSM7X00A_SLEEP_MODE_APPS_SLEEP is not set
+# CONFIG_MSM7X00A_SLEEP_MODE_RAMP_DOWN_AND_WAIT_FOR_INTERRUPT is not set
+# CONFIG_MSM7X00A_SLEEP_WAIT_FOR_INTERRUPT is not set
+CONFIG_MSM7X00A_SLEEP_MODE=3D1
+# CONFIG_MSM7X00A_IDLE_SLEEP_MODE_POWER_COLLAPSE_SUSPEND is not set
+# CONFIG_MSM7X00A_IDLE_SLEEP_MODE_POWER_COLLAPSE is not set
+# CONFIG_MSM7X00A_IDLE_SLEEP_MODE_APPS_SLEEP is not set
+CONFIG_MSM7X00A_IDLE_SLEEP_MODE_RAMP_DOWN_AND_WAIT_FOR_INTERRUPT=3Dy
+# CONFIG_MSM7X00A_IDLE_SLEEP_WAIT_FOR_INTERRUPT is not set
+CONFIG_MSM7X00A_IDLE_SLEEP_MODE=3D3
+CONFIG_MSM7X00A_IDLE_SLEEP_MIN_TIME=3D20000000
+CONFIG_MSM7X00A_IDLE_SPIN_TIME=3D80000
+# CONFIG_MSM_IDLE_STATS is not set
+# CONFIG_MSM_FIQ_SUPPORT is not set
+# CONFIG_MSM_SERIAL_DEBUGGER is not set
+# CONFIG_MSM_SMD is not set
+# CONFIG_MSM_ONCRPCROUTER is not set
+# CONFIG_MSM_HW3D is not set
+CONFIG_MSM_ADSP=3Dy
+# CONFIG_MSM_PERF is not set
+
+#
+# Processor Type
+#
+CONFIG_CPU_32=3Dy
+CONFIG_CPU_V6=3Dy
+# CONFIG_CPU_32v6K is not set
+CONFIG_CPU_32v6=3Dy
+CONFIG_CPU_ABRT_EV6=3Dy
+CONFIG_CPU_CACHE_V6=3Dy
+CONFIG_CPU_CACHE_VIPT=3Dy
+CONFIG_CPU_COPY_V6=3Dy
+CONFIG_CPU_TLB_V6=3Dy
+CONFIG_CPU_HAS_ASID=3Dy
+CONFIG_CPU_CP15=3Dy
+CONFIG_CPU_CP15_MMU=3Dy
+
+#
+# Processor Features
+#
+CONFIG_ARM_THUMB=3Dy
+# CONFIG_CPU_ICACHE_DISABLE is not set
+# CONFIG_CPU_DCACHE_DISABLE is not set
+# CONFIG_CPU_BPREDICT_DISABLE is not set
+# CONFIG_OUTER_CACHE is not set
+
+#
+# Bus support
+#
+# CONFIG_PCI_SYSCALL is not set
+# CONFIG_ARCH_SUPPORTS_MSI is not set
+# CONFIG_PCCARD is not set
+
+#
+# Kernel Features
+#
+CONFIG_TICK_ONESHOT=3Dy
+CONFIG_NO_HZ=3Dy
+CONFIG_HIGH_RES_TIMERS=3Dy
+CONFIG_GENERIC_CLOCKEVENTS_BUILD=3Dy
+CONFIG_PREEMPT=3Dy
+CONFIG_HZ=3D100
+CONFIG_AEABI=3Dy
+# CONFIG_OABI_COMPAT is not set
+# CONFIG_ARCH_DISCONTIGMEM_ENABLE is not set
+CONFIG_SELECT_MEMORY_MODEL=3Dy
+CONFIG_FLATMEM_MANUAL=3Dy
+# CONFIG_DISCONTIGMEM_MANUAL is not set
+# CONFIG_SPARSEMEM_MANUAL is not set
+CONFIG_FLATMEM=3Dy
+CONFIG_FLAT_NODE_MEM_MAP=3Dy
+# CONFIG_SPARSEMEM_STATIC is not set
+# CONFIG_SPARSEMEM_VMEMMAP_ENABLE is not set
+CONFIG_SPLIT_PTLOCK_CPUS=3D4
+CONFIG_RESOURCES_64BIT=3Dy
+CONFIG_ZONE_DMA_FLAG=3D1
+CONFIG_BOUNCE=3Dy
+CONFIG_VIRT_TO_BUS=3Dy
+CONFIG_ALIGNMENT_TRAP=3Dy
+
+#
+# Boot options
+#
+CONFIG_ZBOOT_ROM_TEXT=3D0x0
+CONFIG_ZBOOT_ROM_BSS=3D0x0
+CONFIG_CMDLINE=3D""
+# CONFIG_XIP_KERNEL is not set
+# CONFIG_KEXEC is not set
+
+#
+# CPU Frequency scaling
+#
+# CONFIG_CPU_FREQ is not set
+
+#
+# Floating point emulation
+#
+
+#
+# At least one emulation must be selected
+#
+# CONFIG_VFP is not set
+
+#
+# Userspace binary formats
+#
+CONFIG_BINFMT_ELF=3Dy
+# CONFIG_BINFMT_AOUT is not set
+# CONFIG_BINFMT_MISC is not set
+
+#
+# Power management options
+#
+CONFIG_PM=3Dy
+# CONFIG_PM_LEGACY is not set
+# CONFIG_PM_DEBUG is not set
+CONFIG_PM_SLEEP=3Dy
+CONFIG_SUSPEND=3Dy
+CONFIG_SUSPEND_FREEZER=3Dy
+# CONFIG_APM_EMULATION is not set
+CONFIG_ARCH_SUSPEND_POSSIBLE=3Dy
+
+#
+# Networking
+#
+CONFIG_NET=3Dy
+
+#
+# Networking options
+#
+CONFIG_PACKET=3Dy
+# CONFIG_PACKET_MMAP is not set
+CONFIG_UNIX=3Dy
+# CONFIG_NET_KEY is not set
+CONFIG_INET=3Dy
+# CONFIG_IP_MULTICAST is not set
+# CONFIG_IP_ADVANCED_ROUTER is not set
+CONFIG_IP_FIB_HASH=3Dy
+# CONFIG_IP_PNP is not set
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
+# CONFIG_TCP_CONG_ADVANCED is not set
+CONFIG_TCP_CONG_CUBIC=3Dy
+CONFIG_DEFAULT_TCP_CONG=3D"cubic"
+# CONFIG_TCP_MD5SIG is not set
+# CONFIG_IPV6 is not set
+# CONFIG_INET6_XFRM_TUNNEL is not set
+# CONFIG_INET6_TUNNEL is not set
+# CONFIG_NETWORK_SECMARK is not set
+# CONFIG_NETFILTER is not set
+# CONFIG_IP_DCCP is not set
+# CONFIG_IP_SCTP is not set
+# CONFIG_TIPC is not set
+# CONFIG_ATM is not set
+# CONFIG_BRIDGE is not set
+# CONFIG_VLAN_8021Q is not set
+# CONFIG_DECNET is not set
+# CONFIG_LLC2 is not set
+# CONFIG_IPX is not set
+# CONFIG_ATALK is not set
+# CONFIG_X25 is not set
+# CONFIG_LAPB is not set
+# CONFIG_ECONET is not set
+# CONFIG_WAN_ROUTER is not set
+# CONFIG_NET_SCHED is not set
+
+#
+# Network testing
+#
+# CONFIG_NET_PKTGEN is not set
+# CONFIG_HAMRADIO is not set
+# CONFIG_CAN is not set
+# CONFIG_IRDA is not set
+CONFIG_BT=3Dy
+# CONFIG_BT_L2CAP is not set
+# CONFIG_BT_SCO is not set
+
+#
+# Bluetooth device drivers
+#
+# CONFIG_BT_HCIBTSDIO is not set
+CONFIG_BT_HCIUART=3Dy
+CONFIG_BT_HCIUART_H4=3Dy
+# CONFIG_BT_HCIUART_BCSP is not set
+CONFIG_BT_HCIUART_LL=3Dy
+CONFIG_BT_HCIUART_LL_USE_MSM_SERIAL_CLOCK_CONTROL=3Dy
+# CONFIG_BT_HCIVHCI is not set
+# CONFIG_AF_RXRPC is not set
+
+#
+# Wireless
+#
+# CONFIG_CFG80211 is not set
+# CONFIG_WIRELESS_EXT is not set
+# CONFIG_MAC80211 is not set
+# CONFIG_IEEE80211 is not set
+CONFIG_RFKILL=3Dy
+# CONFIG_RFKILL_INPUT is not set
+CONFIG_RFKILL_LEDS=3Dy
+# CONFIG_NET_9P is not set
+
+#
+# Device Drivers
+#
+
+#
+# Generic Driver Options
+#
+CONFIG_UEVENT_HELPER_PATH=3D""
+CONFIG_STANDALONE=3Dy
+CONFIG_PREVENT_FIRMWARE_BUILD=3Dy
+CONFIG_FW_LOADER=3Dy
+# CONFIG_DEBUG_DRIVER is not set
+# CONFIG_DEBUG_DEVRES is not set
+# CONFIG_SYS_HYPERVISOR is not set
+# CONFIG_CONNECTOR is not set
+# CONFIG_MTD is not set
+# CONFIG_PARPORT is not set
+CONFIG_BLK_DEV=3Dy
+# CONFIG_BLK_DEV_COW_COMMON is not set
+CONFIG_BLK_DEV_LOOP=3Dy
+# CONFIG_BLK_DEV_CRYPTOLOOP is not set
+# CONFIG_BLK_DEV_NBD is not set
+# CONFIG_BLK_DEV_RAM is not set
+# CONFIG_CDROM_PKTCDVD is not set
+# CONFIG_ATA_OVER_ETH is not set
+CONFIG_MISC_DEVICES=3Dy
+# CONFIG_EEPROM_93CX6 is not set
+CONFIG_LOW_MEMORY_KILLER=3Dy
+CONFIG_KERNEL_DEBUGGER_CORE=3Dy
+# CONFIG_ENCLOSURE_SERVICES is not set
+# CONFIG_HAVE_IDE is not set
+
+#
+# SCSI device support
+#
+# CONFIG_RAID_ATTRS is not set
+# CONFIG_SCSI is not set
+# CONFIG_SCSI_DMA is not set
+# CONFIG_SCSI_NETLINK is not set
+# CONFIG_ATA is not set
+# CONFIG_MD is not set
+CONFIG_NETDEVICES=3Dy
+# CONFIG_NETDEVICES_MULTIQUEUE is not set
+CONFIG_DUMMY=3Dy
+# CONFIG_BONDING is not set
+# CONFIG_MACVLAN is not set
+# CONFIG_EQUALIZER is not set
+# CONFIG_TUN is not set
+# CONFIG_VETH is not set
+# CONFIG_PHYLIB is not set
+CONFIG_NET_ETHERNET=3Dy
+CONFIG_MII=3Dy
+# CONFIG_AX88796 is not set
+# CONFIG_SMC91X is not set
+# CONFIG_DM9000 is not set
+# CONFIG_IBM_NEW_EMAC_ZMII is not set
+# CONFIG_IBM_NEW_EMAC_RGMII is not set
+# CONFIG_IBM_NEW_EMAC_TAH is not set
+# CONFIG_IBM_NEW_EMAC_EMAC4 is not set
+# CONFIG_B44 is not set
+CONFIG_NETDEV_1000=3Dy
+# CONFIG_E1000E_ENABLED is not set
+CONFIG_NETDEV_10000=3Dy
+
+#
+# Wireless LAN
+#
+# CONFIG_WLAN_PRE80211 is not set
+# CONFIG_WLAN_80211 is not set
+# CONFIG_WAN is not set
+CONFIG_PPP=3Dy
+# CONFIG_PPP_MULTILINK is not set
+# CONFIG_PPP_FILTER is not set
+CONFIG_PPP_ASYNC=3Dy
+# CONFIG_PPP_SYNC_TTY is not set
+CONFIG_PPP_DEFLATE=3Dy
+CONFIG_PPP_BSDCOMP=3Dy
+# CONFIG_PPP_MPPE is not set
+# CONFIG_PPPOE is not set
+# CONFIG_PPPOL2TP is not set
+# CONFIG_SLIP is not set
+CONFIG_SLHC=3Dy
+# CONFIG_NETCONSOLE is not set
+# CONFIG_MSM_RMNET is not set
+# CONFIG_NETPOLL is not set
+# CONFIG_NET_POLL_CONTROLLER is not set
+# CONFIG_ISDN is not set
+
+#
+# Input device support
+#
+CONFIG_INPUT=3Dy
+# CONFIG_INPUT_FF_MEMLESS is not set
+# CONFIG_INPUT_POLLDEV is not set
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
+# CONFIG_KEYBOARD_ATKBD is not set
+# CONFIG_KEYBOARD_SUNKBD is not set
+# CONFIG_KEYBOARD_LKKBD is not set
+# CONFIG_KEYBOARD_XTKBD is not set
+# CONFIG_KEYBOARD_NEWTON is not set
+# CONFIG_KEYBOARD_STOWAWAY is not set
+# CONFIG_KEYBOARD_GOLDFISH_EVENTS is not set
+# CONFIG_INPUT_MOUSE is not set
+# CONFIG_INPUT_JOYSTICK is not set
+# CONFIG_INPUT_TABLET is not set
+# CONFIG_INPUT_TOUCHSCREEN is not set
+CONFIG_INPUT_MISC=3Dy
+# CONFIG_INPUT_ATI_REMOTE is not set
+# CONFIG_INPUT_ATI_REMOTE2 is not set
+# CONFIG_INPUT_KEYSPAN_REMOTE is not set
+# CONFIG_INPUT_POWERMATE is not set
+# CONFIG_INPUT_YEALINK is not set
+# CONFIG_INPUT_UINPUT is not set
+CONFIG_INPUT_GPIO=3Dy
+
+#
+# Hardware I/O ports
+#
+# CONFIG_SERIO is not set
+# CONFIG_GAMEPORT is not set
+
+#
+# Character devices
+#
+CONFIG_VT=3Dy
+CONFIG_VT_CONSOLE=3Dy
+CONFIG_HW_CONSOLE=3Dy
+CONFIG_VT_HW_CONSOLE_BINDING=3Dy
+# CONFIG_SERIAL_NONSTANDARD is not set
+
+#
+# Serial drivers
+#
+# CONFIG_SERIAL_8250 is not set
+
+#
+# Non-8250 serial port support
+#
+CONFIG_SERIAL_CORE=3Dy
+CONFIG_SERIAL_CORE_CONSOLE=3Dy
+CONFIG_SERIAL_MSM=3Dy
+CONFIG_SERIAL_MSM_CONSOLE=3Dy
+CONFIG_SERIAL_MSM_CLOCK_CONTROL=3Dy
+CONFIG_SERIAL_MSM_RX_WAKEUP=3Dy
+CONFIG_UNIX98_PTYS=3Dy
+# CONFIG_LEGACY_PTYS is not set
+# CONFIG_IPMI_HANDLER is not set
+# CONFIG_HW_RANDOM is not set
+# CONFIG_NVRAM is not set
+# CONFIG_R3964 is not set
+# CONFIG_RAW_DRIVER is not set
+# CONFIG_TCG_TPM is not set
+CONFIG_DEVMEM=3Dy
+# CONFIG_GOLDFISH_TTY is not set
+# CONFIG_DCC_TTY is not set
+CONFIG_I2C=3Dy
+CONFIG_I2C_BOARDINFO=3Dy
+# CONFIG_I2C_CHARDEV is not set
+
+#
+# I2C Algorithms
+#
+# CONFIG_I2C_ALGOBIT is not set
+# CONFIG_I2C_ALGOPCF is not set
+# CONFIG_I2C_ALGOPCA is not set
+
+#
+# I2C Hardware Bus support
+#
+CONFIG_I2C_MSM=3Dy
+# CONFIG_I2C_OCORES is not set
+# CONFIG_I2C_PARPORT_LIGHT is not set
+# CONFIG_I2C_SIMTEC is not set
+# CONFIG_I2C_TAOS_EVM is not set
+# CONFIG_I2C_STUB is not set
+
+#
+# Miscellaneous I2C Chip support
+#
+# CONFIG_DS1682 is not set
+# CONFIG_SENSORS_EEPROM is not set
+# CONFIG_SENSORS_PCF8574 is not set
+# CONFIG_PCF8575 is not set
+# CONFIG_SENSORS_PCF8591 is not set
+# CONFIG_TPS65010 is not set
+# CONFIG_SENSORS_MAX6875 is not set
+# CONFIG_SENSORS_TSL2550 is not set
+CONFIG_S5K4B1FX=3Dy
+# CONFIG_I2C_DEBUG_CORE is not set
+# CONFIG_I2C_DEBUG_ALGO is not set
+# CONFIG_I2C_DEBUG_BUS is not set
+# CONFIG_I2C_DEBUG_CHIP is not set
+
+#
+# SPI support
+#
+# CONFIG_SPI is not set
+# CONFIG_SPI_MASTER is not set
+# CONFIG_W1 is not set
+CONFIG_POWER_SUPPLY=3Dy
+# CONFIG_POWER_SUPPLY_DEBUG is not set
+# CONFIG_PDA_POWER is not set
+# CONFIG_BATTERY_DS2760 is not set
+# CONFIG_BATTERY_GOLDFISH is not set
+# CONFIG_HWMON is not set
+# CONFIG_WATCHDOG is not set
+
+#
+# Sonics Silicon Backplane
+#
+CONFIG_SSB_POSSIBLE=3Dy
+# CONFIG_SSB is not set
+
+#
+# Multifunction device drivers
+#
+# CONFIG_MFD_SM501 is not set
+# CONFIG_HTC_EGPIO is not set
+
+#
+# Multimedia devices
+#
+# CONFIG_VIDEO_DEV is not set
+# CONFIG_DVB_CORE is not set
+CONFIG_DAB=3Dy
+
+#
+# Graphics support
+#
+# CONFIG_VGASTATE is not set
+CONFIG_VIDEO_OUTPUT_CONTROL=3Dy
+CONFIG_FB=3Dy
+# CONFIG_FIRMWARE_EDID is not set
+# CONFIG_FB_DDC is not set
+CONFIG_FB_CFB_FILLRECT=3Dy
+CONFIG_FB_CFB_COPYAREA=3Dy
+CONFIG_FB_CFB_IMAGEBLIT=3Dy
+# CONFIG_FB_CFB_REV_PIXELS_IN_BYTE is not set
+# CONFIG_FB_SYS_FILLRECT is not set
+# CONFIG_FB_SYS_COPYAREA is not set
+# CONFIG_FB_SYS_IMAGEBLIT is not set
+# CONFIG_FB_SYS_FOPS is not set
+CONFIG_FB_DEFERRED_IO=3Dy
+# CONFIG_FB_SVGALIB is not set
+# CONFIG_FB_MACMODES is not set
+# CONFIG_FB_BACKLIGHT is not set
+CONFIG_FB_MODE_HELPERS=3Dy
+CONFIG_FB_TILEBLITTING=3Dy
+
+#
+# Frame buffer hardware drivers
+#
+# CONFIG_FB_S1D13XXX is not set
+# CONFIG_FB_GOLDFISH is not set
+CONFIG_FB_MSM=3Dy
+# CONFIG_FB_MSM_LOGO is not set
+CONFIG_FB_MSM_REFRESH=3Dy
+# CONFIG_FB_VIRTUAL is not set
+# CONFIG_BACKLIGHT_LCD_SUPPORT is not set
+
+#
+# Display device support
+#
+# CONFIG_DISPLAY_SUPPORT is not set
+
+#
+# Console display driver support
+#
+# CONFIG_VGA_CONSOLE is not set
+CONFIG_DUMMY_CONSOLE=3Dy
+CONFIG_FRAMEBUFFER_CONSOLE=3Dy
+CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY=3Dy
+CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=3Dy
+CONFIG_FONTS=3Dy
+# CONFIG_FONT_8x8 is not set
+# CONFIG_FONT_8x16 is not set
+# CONFIG_FONT_6x11 is not set
+# CONFIG_FONT_7x14 is not set
+# CONFIG_FONT_PEARL_8x8 is not set
+# CONFIG_FONT_ACORN_8x8 is not set
+CONFIG_FONT_MINI_4x6=3Dy
+# CONFIG_FONT_SUN8x16 is not set
+# CONFIG_FONT_SUN12x22 is not set
+# CONFIG_FONT_10x18 is not set
+# CONFIG_LOGO is not set
+
+#
+# Sound
+#
+# CONFIG_SOUND is not set
+CONFIG_HID_SUPPORT=3Dy
+CONFIG_HID=3Dy
+# CONFIG_HID_DEBUG is not set
+# CONFIG_HIDRAW is not set
+CONFIG_USB_SUPPORT=3Dy
+CONFIG_USB_ARCH_HAS_HCD=3Dy
+# CONFIG_USB_ARCH_HAS_OHCI is not set
+# CONFIG_USB_ARCH_HAS_EHCI is not set
+# CONFIG_USB is not set
+
+#
+# NOTE: USB_STORAGE enables SCSI, and 'SCSI disk support'
+#
+# CONFIG_USB_GADGET is not set
+
+#
+# USB Function Support
+#
+CONFIG_USB_FUNCTION=3Dy
+CONFIG_USB_FUNCTION_MSM_HSUSB=3Dy
+# CONFIG_USB_FUNCTION_NULL is not set
+# CONFIG_USB_FUNCTION_ZERO is not set
+# CONFIG_USB_FUNCTION_LOOPBACK is not set
+CONFIG_USB_FUNCTION_ADB=3Dy
+# CONFIG_USB_FUNCTION_UMS is not set
+CONFIG_USB_FUNCTION_MASS_STORAGE=3Dy
+# CONFIG_USB_FUNCTION_DIAG is not set
+CONFIG_USB_FUNCTION_ETHER=3Dy
+CONFIG_MMC=3Dy
+# CONFIG_MMC_DEBUG is not set
+# CONFIG_MMC_UNSAFE_RESUME is not set
+CONFIG_MMC_EMBEDDED_SDIO=3Dy
+
+#
+# MMC/SD Card Drivers
+#
+CONFIG_MMC_BLOCK=3Dy
+# CONFIG_MMC_BLOCK_BOUNCE is not set
+# CONFIG_SDIO_UART is not set
+# CONFIG_MMC_TEST is not set
+
+#
+# MMC/SD Host Controller Drivers
+#
+CONFIG_MMC_MSM7X00A=3Dy
+CONFIG_NEW_LEDS=3Dy
+CONFIG_LEDS_CLASS=3Dy
+
+#
+# LED drivers
+#
+
+#
+# LED Triggers
+#
+CONFIG_LEDS_TRIGGERS=3Dy
+CONFIG_LEDS_TRIGGER_TIMER=3Dy
+CONFIG_LEDS_TRIGGER_HEARTBEAT=3Dy
+CONFIG_SWITCH=3Dy
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
+# I2C RTC drivers
+#
+# CONFIG_RTC_DRV_DS1307 is not set
+# CONFIG_RTC_DRV_DS1374 is not set
+# CONFIG_RTC_DRV_DS1672 is not set
+# CONFIG_RTC_DRV_MAX6900 is not set
+# CONFIG_RTC_DRV_RS5C372 is not set
+# CONFIG_RTC_DRV_ISL1208 is not set
+# CONFIG_RTC_DRV_X1205 is not set
+# CONFIG_RTC_DRV_PCF8563 is not set
+# CONFIG_RTC_DRV_PCF8583 is not set
+# CONFIG_RTC_DRV_M41T80 is not set
+# CONFIG_RTC_DRV_S35390A is not set
+
+#
+# SPI RTC drivers
+#
+
+#
+# Platform RTC drivers
+#
+# CONFIG_RTC_DRV_CMOS is not set
+# CONFIG_RTC_DRV_DS1511 is not set
+# CONFIG_RTC_DRV_DS1553 is not set
+# CONFIG_RTC_DRV_DS1742 is not set
+# CONFIG_RTC_DRV_STK17TA8 is not set
+# CONFIG_RTC_DRV_M48T86 is not set
+# CONFIG_RTC_DRV_M48T59 is not set
+# CONFIG_RTC_DRV_V3020 is not set
+
+#
+# on-CPU RTC drivers
+#
+# CONFIG_RTC_DRV_GOLDFISH is not set
+# CONFIG_RTC_DRV_MSM7X00A is not set
+CONFIG_RTC_DRV_MSM7X00=3Dy
+
+#
+# Android
+#
+# CONFIG_ANDROID_BINDER_IPC is not set
+# CONFIG_ANDROID_PMEM is not set
+# CONFIG_ANDROID_POWER is not set
+# CONFIG_ANDROID_LOGGER is not set
+# CONFIG_ANDROID_RAM_CONSOLE is not set
+# CONFIG_ANDROID_PARANOID_NETWORK is not set
+
+#
+# File systems
+#
+CONFIG_EXT2_FS=3Dy
+CONFIG_EXT2_FS_XATTR=3Dy
+# CONFIG_EXT2_FS_POSIX_ACL is not set
+# CONFIG_EXT2_FS_SECURITY is not set
+# CONFIG_EXT2_FS_XIP is not set
+CONFIG_EXT3_FS=3Dy
+CONFIG_EXT3_FS_XATTR=3Dy
+# CONFIG_EXT3_FS_POSIX_ACL is not set
+# CONFIG_EXT3_FS_SECURITY is not set
+# CONFIG_EXT4DEV_FS is not set
+CONFIG_JBD=3Dy
+CONFIG_FS_MBCACHE=3Dy
+# CONFIG_REISERFS_FS is not set
+# CONFIG_JFS_FS is not set
+# CONFIG_FS_POSIX_ACL is not set
+# CONFIG_XFS_FS is not set
+# CONFIG_GFS2_FS is not set
+# CONFIG_OCFS2_FS is not set
+CONFIG_DNOTIFY=3Dy
+CONFIG_INOTIFY=3Dy
+CONFIG_INOTIFY_USER=3Dy
+# CONFIG_QUOTA is not set
+# CONFIG_AUTOFS_FS is not set
+# CONFIG_AUTOFS4_FS is not set
+# CONFIG_FUSE_FS is not set
+
+#
+# CD-ROM/DVD Filesystems
+#
+# CONFIG_ISO9660_FS is not set
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
+# CONFIG_NTFS_FS is not set
+
+#
+# Pseudo filesystems
+#
+CONFIG_PROC_FS=3Dy
+CONFIG_PROC_SYSCTL=3Dy
+CONFIG_SYSFS=3Dy
+CONFIG_TMPFS=3Dy
+# CONFIG_TMPFS_POSIX_ACL is not set
+# CONFIG_HUGETLB_PAGE is not set
+# CONFIG_CONFIGFS_FS is not set
+
+#
+# Miscellaneous filesystems
+#
+# CONFIG_ADFS_FS is not set
+# CONFIG_AFFS_FS is not set
+# CONFIG_HFS_FS is not set
+# CONFIG_HFSPLUS_FS is not set
+# CONFIG_BEFS_FS is not set
+# CONFIG_BFS_FS is not set
+# CONFIG_EFS_FS is not set
+CONFIG_CRAMFS=3Dy
+# CONFIG_VXFS_FS is not set
+# CONFIG_MINIX_FS is not set
+# CONFIG_HPFS_FS is not set
+# CONFIG_QNX4FS_FS is not set
+# CONFIG_ROMFS_FS is not set
+# CONFIG_SYSV_FS is not set
+# CONFIG_UFS_FS is not set
+CONFIG_NETWORK_FILESYSTEMS=3Dy
+# CONFIG_NFS_FS is not set
+# CONFIG_NFSD is not set
+# CONFIG_SMB_FS is not set
+# CONFIG_CIFS is not set
+# CONFIG_NCP_FS is not set
+# CONFIG_CODA_FS is not set
+# CONFIG_AFS_FS is not set
+
+#
+# Partition Types
+#
+# CONFIG_PARTITION_ADVANCED is not set
+CONFIG_MSDOS_PARTITION=3Dy
+CONFIG_NLS=3Dy
+CONFIG_NLS_DEFAULT=3D"iso8859-1"
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
+# CONFIG_NLS_ASCII is not set
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
+# CONFIG_NLS_UTF8 is not set
+# CONFIG_DLM is not set
+
+#
+# Kernel hacking
+#
+CONFIG_PRINTK_TIME=3Dy
+CONFIG_ENABLE_WARN_DEPRECATED=3Dy
+CONFIG_ENABLE_MUST_CHECK=3Dy
+CONFIG_MAGIC_SYSRQ=3Dy
+# CONFIG_UNUSED_SYMBOLS is not set
+# CONFIG_DEBUG_FS is not set
+# CONFIG_HEADERS_CHECK is not set
+CONFIG_DEBUG_KERNEL=3Dy
+# CONFIG_DEBUG_SHIRQ is not set
+CONFIG_DETECT_SOFTLOCKUP=3Dy
+CONFIG_SCHED_DEBUG=3Dy
+CONFIG_SCHEDSTATS=3Dy
+# CONFIG_TIMER_STATS is not set
+# CONFIG_DEBUG_SLAB is not set
+CONFIG_DEBUG_PREEMPT=3Dy
+# CONFIG_DEBUG_RT_MUTEXES is not set
+# CONFIG_RT_MUTEX_TESTER is not set
+# CONFIG_DEBUG_SPINLOCK is not set
+CONFIG_DEBUG_MUTEXES=3Dy
+# CONFIG_DEBUG_LOCK_ALLOC is not set
+# CONFIG_PROVE_LOCKING is not set
+# CONFIG_LOCK_STAT is not set
+CONFIG_DEBUG_SPINLOCK_SLEEP=3Dy
+# CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
+# CONFIG_DEBUG_KOBJECT is not set
+CONFIG_DEBUG_BUGVERBOSE=3Dy
+CONFIG_DEBUG_INFO=3Dy
+# CONFIG_DEBUG_VM is not set
+# CONFIG_DEBUG_LIST is not set
+# CONFIG_DEBUG_SG is not set
+CONFIG_FRAME_POINTER=3Dy
+# CONFIG_BOOT_PRINTK_DELAY is not set
+# CONFIG_RCU_TORTURE_TEST is not set
+# CONFIG_BACKTRACE_SELF_TEST is not set
+# CONFIG_FAULT_INJECTION is not set
+# CONFIG_LATENCYTOP is not set
+# CONFIG_SAMPLES is not set
+# CONFIG_DEBUG_USER is not set
+# CONFIG_DEBUG_ERRORS is not set
+# CONFIG_DEBUG_STACK_USAGE is not set
+# CONFIG_DEBUG_LL is not set
+
+#
+# Security options
+#
+# CONFIG_KEYS is not set
+# CONFIG_SECURITY is not set
+# CONFIG_SECURITY_FILE_CAPABILITIES is not set
+# CONFIG_CRYPTO is not set
+
+#
+# Library routines
+#
+CONFIG_BITREVERSE=3Dy
+CONFIG_CRC_CCITT=3Dy
+# CONFIG_CRC16 is not set
+# CONFIG_CRC_ITU_T is not set
+CONFIG_CRC32=3Dy
+# CONFIG_CRC7 is not set
+# CONFIG_LIBCRC32C is not set
+CONFIG_ZLIB_INFLATE=3Dy
+CONFIG_ZLIB_DEFLATE=3Dy
+CONFIG_PLIST=3Dy
+CONFIG_HAS_IOMEM=3Dy
+CONFIG_HAS_IOPORT=3Dy
+CONFIG_HAS_DMA=3Dy
diff --git a/recipes/linux/linux-replicant_git.bb b/recipes/linux/linux-rep=
licant_git.bb
new file mode 100644
index 0000000..7919694
--- /dev/null
+++ b/recipes/linux/linux-replicant_git.bb
@@ -0,0 +1,28 @@
+require linux.inc
+
+PV =3D "2.6.25+${PR}+gitr${SRCREV}"
+PV_htcraphael =3D "2.6.27+${PR}+gitr${SRCREV}"
+PV_htcdiamond =3D "2.6.27+${PR}+gitr${SRCREV}"
+PV_htcdream =3D "2.6.29+${PR}+gitr${SRCREV}"
+PR =3D "r13"
+
+COMPATIBLE_MACHINE =3D "htckaiser|htcpolaris|htcvogue|htctitan|htcnike|htc=
raphael|htcdiamond|htcblackstone|htcdream"
+
+SRCREV =3D "d2fc2471ba384dabad1c9a4126e2e2372349d34c"
+SRCREV_htcraphael =3D "905eb169a7d659c221aad5c38aac443065178c4c"
+SRCREV_htcdiamond =3D "905eb169a7d659c221aad5c38aac443065178c4c"
+SRCREV_htcblackstone =3D "905eb169a7d659c221aad5c38aac443065178c4c"
+SRCREV_htcdream =3D "31f124b5a67f6b2da2354e76a01bcc9ca9526f63"
+
+SRC_BRANCH =3D "htc-vogue"
+SRC_BRANCH_htcraphael =3D "htc-msm-2.6.27"
+SRC_BRANCH_htcdiamond =3D "htc-msm-2.6.27"
+SRC_BRANCH_htcblackstone =3D "htc-msm-2.6.27"
+SRC_BRANCH_htcdream =3D "leviathan"
+
+SRC_URI =3D "\
+	git://gitorious.org/replicant/gnulinuxkernel.git;branch=3D${SRC_BRANCH};p=
rotocol=3Dgit \
+	file://defconfig \
+"
+
+S =3D "${WORKDIR}/git"

--Boundary-01=_REN4Kp3e0FT0FMj--

--=_koffein-17740-1256242409-0001-2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Transfer-Encoding: 7bit
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.11 (GNU/Linux)

iEYEABECAAYFAkrg0RQACgkQAeZw77btGjpF+QCgh9dmyezkBXVj+GikAoIWHOGj
71cAoKw4oxj4gSkEVqJgy5VlK9hZMDhi
=npH1
-----END PGP SIGNATURE-----

--=_koffein-17740-1256242409-0001-2--
