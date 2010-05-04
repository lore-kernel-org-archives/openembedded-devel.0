Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1O9G3o-0008Gj-0G
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 May 2010 13:13:11 +0200
Received: by fxm11 with SMTP id 11so2948736fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 May 2010 04:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=iAQXxSp3c0y1sBs/8zy/LsdOHmL6jW+Q8yvXJeO/6us=;
	b=OaQTBH/KomADWwhPsb4Mg3Sdu4+YIa+4t7Vgtmode9lBxGFtbUf9saNCAI2+9Ia9yf
	hti1ltG4ZXM/CKhkTIes2kfkA6zUilUz7Stka/JA/eWXeHIE+okhJiDzMIK+5F5/Sozu
	IlRWlc4vx3Katkoi6BviR5JKXcJS43beWPxFE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=m3KH79VRRkxkhPHaPLojD1Nc2VRYmJ2oDyR/q2FUT8FZdQAKcRUNmdzarmyVocvmk5
	FEp44BfbAJI45/57onK1VsSfYWZLwDtcWgPl97PMKyt6AehnBQZ4Lq8NBCo3LR86no63
	QPnArSodW+k+oRMnxlpoe1qYDgjEec7bJqDL4=
MIME-Version: 1.0
Received: by 10.239.133.130 with SMTP id 2mr63905hbv.18.1272971361357; Tue, 04 
	May 2010 04:09:21 -0700 (PDT)
Received: by 10.239.192.77 with HTTP; Tue, 4 May 2010 04:09:21 -0700 (PDT)
In-Reply-To: <4BCF2395.3000701@eric-weiss.de>
References: <4BCF2395.3000701@eric-weiss.de>
Date: Tue, 4 May 2010 13:09:21 +0200
Message-ID: <q2md1b08f941005040409u9d07a7dbpd2aaaeb6a84850d0@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS,
	UPPERCASE_50_75 autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Kernel for SHARP PC-Z1 netwalker
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
X-List-Received-Date: Tue, 04 May 2010 11:13:11 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

+1 from me if you promise you'll be the maintainer ;)

Andrea


On Wed, Apr 21, 2010 at 6:11 PM, eric weiss <eric@eric-weiss.de> wrote:
> hi
> and here comesthe kernel recipe
>
> I used the sources kernel provided my the ubuntu-comunity.
>
> recipes/linux-netwalker_2.8.28.bb
> ---------------------
> SECTION =3D "kernel"
> DESCRIPTION =3D "Linux kernel for Sharp Netwalker"
> LICENSE =3D "GPL"
> #PROVIDES =3D "linux-netwalker"
> PR =3D "r1"
> require linux.inc
> SRC_URI[md5sum] =3D "fa46cc8d17d67c0896626560824fde64"
> SRC_URI[sha256sum] =3D
> "5a2c88dfa5c0b6cd46290ca2f4ff2155500eb060ced97a7c2907ba5a0c7ff96b"
>
> SRC_URI =3D
> "http://netbook-remix.archive.canonical.com/updates/pool/public/l/linux-f=
sl-imx51/linux-fsl-imx51_2.6.28-15.50fsl1araneo7.tar.gz
> \
> =A0 =A0 =A0 =A0 =A0 file://defconfig"
> S =3D "${WORKDIR}/jaunty-arm"
> DEFAULT_PREFERENCE =3D "-1"
> DEFAULT_PREFERENCE_netwalker =3D "1"
> ----------------------------
> the defconfig ( attachment ) belongs into linux/linux-netwalker-2.6.28/
> directory.
> i have added support for tun/tap ( openvpn needs this ) and some
> additional HW support
> ( profilic usb , irda )
> of course there will be added some other stuff, but this confiuration
> boots the device properly =A0and allows access to the SDIO based wlan chi=
p.
>
>
> hilsen
>
>
> eric
>
>
>
>
>
> #
> # Automatically generated make config: don't edit
> # Linux kernel version: 2.6.28.10
> # Mon Apr 12 20:05:46 2010
> #
> CONFIG_ARM=3Dy
> CONFIG_SYS_SUPPORTS_APM_EMULATION=3Dy
> # CONFIG_GENERIC_GPIO is not set
> CONFIG_GENERIC_TIME=3Dy
> CONFIG_GENERIC_CLOCKEVENTS=3Dy
> CONFIG_MMU=3Dy
> # CONFIG_NO_IOPORT is not set
> CONFIG_GENERIC_HARDIRQS=3Dy
> CONFIG_STACKTRACE_SUPPORT=3Dy
> CONFIG_HAVE_LATENCYTOP_SUPPORT=3Dy
> CONFIG_LOCKDEP_SUPPORT=3Dy
> CONFIG_TRACE_IRQFLAGS_SUPPORT=3Dy
> CONFIG_HARDIRQS_SW_RESEND=3Dy
> CONFIG_GENERIC_IRQ_PROBE=3Dy
> CONFIG_RWSEM_GENERIC_SPINLOCK=3Dy
> # CONFIG_ARCH_HAS_ILOG2_U32 is not set
> # CONFIG_ARCH_HAS_ILOG2_U64 is not set
> CONFIG_GENERIC_HWEIGHT=3Dy
> CONFIG_GENERIC_CALIBRATE_DELAY=3Dy
> CONFIG_ZONE_DMA=3Dy
> CONFIG_ARCH_MTD_XIP=3Dy
> CONFIG_GENERIC_HARDIRQS_NO__DO_IRQ=3Dy
> CONFIG_VECTORS_BASE=3D0xffff0000
> CONFIG_DEFCONFIG_LIST=3D"/lib/modules/$UNAME_RELEASE/.config"
>
> #
> # General setup
> #
> CONFIG_EXPERIMENTAL=3Dy
> CONFIG_BROKEN_ON_SMP=3Dy
> CONFIG_LOCK_KERNEL=3Dy
> CONFIG_INIT_ENV_ARG_LIMIT=3D32
> CONFIG_LOCALVERSION=3D""
> # CONFIG_LOCALVERSION_AUTO is not set
> CONFIG_VERSION_SIGNATURE=3D""
> CONFIG_SWAP=3Dy
> CONFIG_SYSVIPC=3Dy
> CONFIG_SYSVIPC_SYSCTL=3Dy
> # CONFIG_POSIX_MQUEUE is not set
> # CONFIG_BSD_PROCESS_ACCT is not set
> # CONFIG_TASKSTATS is not set
> # CONFIG_AUDIT is not set
> CONFIG_IKCONFIG=3Dy
> CONFIG_IKCONFIG_PROC=3Dy
> CONFIG_LOG_BUF_SHIFT=3D14
> # CONFIG_CGROUPS is not set
> # CONFIG_GROUP_SCHED is not set
> # CONFIG_SYSFS_DEPRECATED_V2 is not set
> # CONFIG_RELAY is not set
> # CONFIG_NAMESPACES is not set
> # CONFIG_BLK_DEV_INITRD is not set
> CONFIG_CC_OPTIMIZE_FOR_SIZE=3Dy
> CONFIG_SYSCTL=3Dy
> CONFIG_ANON_INODES=3Dy
> CONFIG_EMBEDDED=3Dy
> CONFIG_UID16=3Dy
> CONFIG_SYSCTL_SYSCALL=3Dy
> CONFIG_KALLSYMS=3Dy
> # CONFIG_KALLSYMS_EXTRA_PASS is not set
> CONFIG_HOTPLUG=3Dy
> CONFIG_PRINTK=3Dy
> CONFIG_BUG=3Dy
> CONFIG_ELF_CORE=3Dy
> CONFIG_BASE_FULL=3Dy
> CONFIG_FUTEX=3Dy
> CONFIG_EPOLL=3Dy
> CONFIG_SIGNALFD=3Dy
> CONFIG_TIMERFD=3Dy
> CONFIG_EVENTFD=3Dy
> CONFIG_SHMEM=3Dy
> CONFIG_AIO=3Dy
> CONFIG_VM_EVENT_COUNTERS=3Dy
> CONFIG_SLUB_DEBUG=3Dy
> CONFIG_COMPAT_BRK=3Dy
> # CONFIG_SLAB is not set
> CONFIG_SLUB=3Dy
> # CONFIG_SLOB is not set
> # CONFIG_PROFILING is not set
> # CONFIG_MARKERS is not set
> CONFIG_HAVE_OPROFILE=3Dy
> # CONFIG_KPROBES is not set
> CONFIG_HAVE_KPROBES=3Dy
> CONFIG_HAVE_KRETPROBES=3Dy
> CONFIG_HAVE_GENERIC_DMA_COHERENT=3Dy
> CONFIG_SLABINFO=3Dy
> CONFIG_RT_MUTEXES=3Dy
> # CONFIG_TINY_SHMEM is not set
> CONFIG_BASE_SMALL=3D0
> CONFIG_MODULES=3Dy
> # CONFIG_MODULE_FORCE_LOAD is not set
> CONFIG_MODULE_UNLOAD=3Dy
> CONFIG_MODULE_FORCE_UNLOAD=3Dy
> CONFIG_MODVERSIONS=3Dy
> # CONFIG_MODULE_SRCVERSION_ALL is not set
> CONFIG_KMOD=3Dy
> CONFIG_BLOCK=3Dy
> # CONFIG_LBD is not set
> # CONFIG_BLK_DEV_IO_TRACE is not set
> # CONFIG_LSF is not set
> CONFIG_BLK_DEV_BSG=3Dy
> # CONFIG_BLK_DEV_INTEGRITY is not set
>
> #
> # IO Schedulers
> #
> CONFIG_IOSCHED_NOOP=3Dy
> CONFIG_IOSCHED_AS=3Dy
> CONFIG_IOSCHED_DEADLINE=3Dy
> CONFIG_IOSCHED_CFQ=3Dy
> # CONFIG_DEFAULT_AS is not set
> # CONFIG_DEFAULT_DEADLINE is not set
> CONFIG_DEFAULT_CFQ=3Dy
> # CONFIG_DEFAULT_NOOP is not set
> CONFIG_DEFAULT_IOSCHED=3D"cfq"
> CONFIG_CLASSIC_RCU=3Dy
> CONFIG_FREEZER=3Dy
>
> #
> # System Type
> #
> # CONFIG_ARCH_AAEC2000 is not set
> # CONFIG_ARCH_INTEGRATOR is not set
> # CONFIG_ARCH_REALVIEW is not set
> # CONFIG_ARCH_VERSATILE is not set
> # CONFIG_ARCH_AT91 is not set
> # CONFIG_ARCH_CLPS7500 is not set
> # CONFIG_ARCH_CLPS711X is not set
> # CONFIG_ARCH_EBSA110 is not set
> # CONFIG_ARCH_EP93XX is not set
> # CONFIG_ARCH_FOOTBRIDGE is not set
> # CONFIG_ARCH_NETX is not set
> # CONFIG_ARCH_H720X is not set
> # CONFIG_ARCH_IMX is not set
> # CONFIG_ARCH_IOP13XX is not set
> # CONFIG_ARCH_IOP32X is not set
> # CONFIG_ARCH_IOP33X is not set
> # CONFIG_ARCH_IXP23XX is not set
> # CONFIG_ARCH_IXP2000 is not set
> # CONFIG_ARCH_IXP4XX is not set
> # CONFIG_ARCH_L7200 is not set
> # CONFIG_ARCH_KIRKWOOD is not set
> # CONFIG_ARCH_KS8695 is not set
> # CONFIG_ARCH_NS9XXX is not set
> # CONFIG_ARCH_LOKI is not set
> # CONFIG_ARCH_MV78XX0 is not set
> CONFIG_ARCH_MXC=3Dy
> # CONFIG_ARCH_ORION5X is not set
> # CONFIG_ARCH_PNX4008 is not set
> # CONFIG_ARCH_PXA is not set
> # CONFIG_ARCH_RPC is not set
> # CONFIG_ARCH_SA1100 is not set
> # CONFIG_ARCH_S3C2410 is not set
> # CONFIG_ARCH_SHARK is not set
> # CONFIG_ARCH_LH7A40X is not set
> # CONFIG_ARCH_DAVINCI is not set
> # CONFIG_ARCH_OMAP is not set
> # CONFIG_ARCH_MSM is not set
> # CONFIG_ARCH_STMP3XXX is not set
>
> #
> # Boot options
> #
>
> #
> # Power management
> #
>
> #
> # Freescale MXC Implementations
> #
> # CONFIG_ARCH_MX37 is not set
> # CONFIG_ARCH_MX35 is not set
> CONFIG_ARCH_MX51=3Dy
> # CONFIG_ARCH_MX3 is not set
> # CONFIG_ARCH_MX27 is not set
> # CONFIG_ARCH_MX25 is not set
> CONFIG_I2C_MXC_SELECT1=3Dy
> CONFIG_I2C_MXC_SELECT2=3Dy
> CONFIG_MXC_SDMA_API=3Dy
> CONFIG_SDMA_IRAM=3Dy
> CONFIG_SDMA_IRAM_SIZE=3D0x1000
> # CONFIG_I2C_MXC_SELECT3 is not set
> CONFIG_FORCE_MAX_ZONEORDER=3D13
> CONFIG_ARCH_MXC_HAS_NFC_V3=3Dy
>
> #
> # MX51 Options
> #
> CONFIG_MX51_OPTIONS=3Dy
> # CONFIG_MACH_MX51_3DS is not set
> # CONFIG_MACH_MX51_BABBAGE is not set
> CONFIG_MACH_MX51_ERDOS=3Dy
> CONFIG_PRINTK_ERR_ONLY=3Dy
> CONFIG_ARCH_MXC_HAS_NFC_V3_2=3Dy
>
> #
> # SDMA options
> #
>
> #
> # Device options
> #
> CONFIG_MXC_TZIC=3Dy
> CONFIG_DMA_ZONE_SIZE=3D64
> CONFIG_UTMI_MXC=3Dy
>
> #
> # Processor Type
> #
> CONFIG_CPU_32=3Dy
> # CONFIG_CPU_ARM926T is not set
> # CONFIG_CPU_V6 is not set
> CONFIG_CPU_32v6K=3Dy
> CONFIG_CPU_V7=3Dy
> CONFIG_CPU_32v7=3Dy
> CONFIG_CPU_ABRT_EV7=3Dy
> CONFIG_CPU_PABRT_IFAR=3Dy
> CONFIG_CPU_CACHE_V7=3Dy
> CONFIG_CPU_CACHE_VIPT=3Dy
> CONFIG_CPU_COPY_V6=3Dy
> CONFIG_CPU_TLB_V7=3Dy
> CONFIG_CPU_HAS_ASID=3Dy
> CONFIG_CPU_CP15=3Dy
> CONFIG_CPU_CP15_MMU=3Dy
>
> #
> # Processor Features
> #
> CONFIG_ARM_THUMB=3Dy
> # CONFIG_ARM_THUMBEE is not set
> # CONFIG_CPU_ICACHE_DISABLE is not set
> # CONFIG_CPU_DCACHE_DISABLE is not set
> # CONFIG_CPU_BPREDICT_DISABLE is not set
> CONFIG_HAS_TLS_REG=3Dy
> # CONFIG_OUTER_CACHE is not set
>
> #
> # Bus support
> #
> # CONFIG_PCI_SYSCALL is not set
> # CONFIG_ARCH_SUPPORTS_MSI is not set
> # CONFIG_PCCARD is not set
>
> #
> # Kernel Features
> #
> CONFIG_TICK_ONESHOT=3Dy
> CONFIG_NO_HZ=3Dy
> CONFIG_HIGH_RES_TIMERS=3Dy
> CONFIG_GENERIC_CLOCKEVENTS_BUILD=3Dy
> CONFIG_VMSPLIT_3G=3Dy
> # CONFIG_VMSPLIT_2G is not set
> # CONFIG_VMSPLIT_1G is not set
> CONFIG_PAGE_OFFSET=3D0xC0000000
> CONFIG_PREEMPT=3Dy
> CONFIG_HZ=3D100
> CONFIG_AEABI=3Dy
> # CONFIG_OABI_COMPAT is not set
> CONFIG_ARCH_FLATMEM_HAS_HOLES=3Dy
> # CONFIG_ARCH_SPARSEMEM_DEFAULT is not set
> # CONFIG_ARCH_SELECT_MEMORY_MODEL is not set
> CONFIG_SELECT_MEMORY_MODEL=3Dy
> CONFIG_FLATMEM_MANUAL=3Dy
> # CONFIG_DISCONTIGMEM_MANUAL is not set
> # CONFIG_SPARSEMEM_MANUAL is not set
> CONFIG_FLATMEM=3Dy
> CONFIG_FLAT_NODE_MEM_MAP=3Dy
> CONFIG_PAGEFLAGS_EXTENDED=3Dy
> CONFIG_SPLIT_PTLOCK_CPUS=3D4
> # CONFIG_RESOURCES_64BIT is not set
> # CONFIG_PHYS_ADDR_T_64BIT is not set
> CONFIG_ZONE_DMA_FLAG=3D1
> CONFIG_BOUNCE=3Dy
> CONFIG_VIRT_TO_BUS=3Dy
> CONFIG_UNEVICTABLE_LRU=3Dy
> # CONFIG_LEDS is not set
> CONFIG_ALIGNMENT_TRAP=3Dy
>
> #
> # Boot options
> #
> CONFIG_ZBOOT_ROM_TEXT=3D0x0
> CONFIG_ZBOOT_ROM_BSS=3D0x0
> CONFIG_CMDLINE=3D" quiet "
> # CONFIG_XIP_KERNEL is not set
> CONFIG_KEXEC=3Dy
> CONFIG_ATAGS_PROC=3Dy
>
> #
> # CPU Power Management
> #
> CONFIG_CPU_FREQ=3Dy
> CONFIG_CPU_FREQ_TABLE=3Dy
> # CONFIG_CPU_FREQ_DEBUG is not set
> CONFIG_CPU_FREQ_STAT=3Dy
> # CONFIG_CPU_FREQ_STAT_DETAILS is not set
> # CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE is not set
> # CONFIG_CPU_FREQ_DEFAULT_GOV_POWERSAVE is not set
> CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE=3Dy
> # CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND is not set
> # CONFIG_CPU_FREQ_DEFAULT_GOV_CONSERVATIVE is not set
> CONFIG_CPU_FREQ_GOV_PERFORMANCE=3Dy
> CONFIG_CPU_FREQ_GOV_POWERSAVE=3Dy
> CONFIG_CPU_FREQ_GOV_USERSPACE=3Dy
> # CONFIG_CPU_FREQ_GOV_ONDEMAND is not set
> # CONFIG_CPU_FREQ_GOV_CONSERVATIVE is not set
> CONFIG_CPU_FREQ_IMX=3Dy
> # CONFIG_CPU_IDLE is not set
>
> #
> # Floating point emulation
> #
>
> #
> # At least one emulation must be selected
> #
> CONFIG_VFP=3Dy
> CONFIG_VFPv3=3Dy
> CONFIG_NEON=3Dy
>
> #
> # Userspace binary formats
> #
> CONFIG_BINFMT_ELF=3Dy
> # CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
> CONFIG_HAVE_AOUT=3Dy
> # CONFIG_BINFMT_AOUT is not set
> # CONFIG_BINFMT_MISC is not set
>
> #
> # Power management options
> #
> CONFIG_PM=3Dy
> # CONFIG_PM_DEBUG is not set
> CONFIG_PM_SLEEP=3Dy
> CONFIG_SUSPEND=3Dy
> CONFIG_SUSPEND_FREEZER=3Dy
> # CONFIG_PM_DISABLE_CONSOLE is not set
> CONFIG_APM_EMULATION=3Dy
> CONFIG_ARCH_SUSPEND_POSSIBLE=3Dy
> CONFIG_NET=3Dy
>
> #
> # Networking options
> #
> CONFIG_PACKET=3Dy
> CONFIG_PACKET_MMAP=3Dy
> CONFIG_UNIX=3Dy
> CONFIG_XFRM=3Dy
> # CONFIG_XFRM_USER is not set
> # CONFIG_XFRM_SUB_POLICY is not set
> # CONFIG_XFRM_MIGRATE is not set
> # CONFIG_XFRM_STATISTICS is not set
> CONFIG_NET_KEY=3Dm
> # CONFIG_NET_KEY_MIGRATE is not set
> CONFIG_INET=3Dy
> CONFIG_IP_MULTICAST=3Dy
> CONFIG_IP_ADVANCED_ROUTER=3Dy
> CONFIG_ASK_IP_FIB_HASH=3Dy
> # CONFIG_IP_FIB_TRIE is not set
> CONFIG_IP_FIB_HASH=3Dy
> CONFIG_IP_MULTIPLE_TABLES=3Dy
> # CONFIG_IP_ROUTE_MULTIPATH is not set
> # CONFIG_IP_ROUTE_VERBOSE is not set
> CONFIG_IP_PNP=3Dy
> CONFIG_IP_PNP_DHCP=3Dy
> CONFIG_IP_PNP_BOOTP=3Dy
> # CONFIG_IP_PNP_RARP is not set
> CONFIG_NET_IPIP=3Dm
> CONFIG_NET_IPGRE=3Dm
> CONFIG_NET_IPGRE_BROADCAST=3Dy
> # CONFIG_IP_MROUTE is not set
> CONFIG_ARPD=3Dy
> # CONFIG_SYN_COOKIES is not set
> # CONFIG_INET_AH is not set
> # CONFIG_INET_ESP is not set
> # CONFIG_INET_IPCOMP is not set
> # CONFIG_INET_XFRM_TUNNEL is not set
> CONFIG_INET_TUNNEL=3Dm
> CONFIG_INET_XFRM_MODE_TRANSPORT=3Dy
> CONFIG_INET_XFRM_MODE_TUNNEL=3Dy
> CONFIG_INET_XFRM_MODE_BEET=3Dy
> # CONFIG_INET_LRO is not set
> CONFIG_INET_DIAG=3Dy
> CONFIG_INET_TCP_DIAG=3Dy
> CONFIG_TCP_CONG_ADVANCED=3Dy
> CONFIG_TCP_CONG_BIC=3Dm
> CONFIG_TCP_CONG_CUBIC=3Dy
> CONFIG_TCP_CONG_WESTWOOD=3Dm
> CONFIG_TCP_CONG_HTCP=3Dm
> # CONFIG_TCP_CONG_HSTCP is not set
> # CONFIG_TCP_CONG_HYBLA is not set
> # CONFIG_TCP_CONG_VEGAS is not set
> # CONFIG_TCP_CONG_SCALABLE is not set
> # CONFIG_TCP_CONG_LP is not set
> # CONFIG_TCP_CONG_VENO is not set
> # CONFIG_TCP_CONG_YEAH is not set
> # CONFIG_TCP_CONG_ILLINOIS is not set
> # CONFIG_DEFAULT_BIC is not set
> CONFIG_DEFAULT_CUBIC=3Dy
> # CONFIG_DEFAULT_HTCP is not set
> # CONFIG_DEFAULT_VEGAS is not set
> # CONFIG_DEFAULT_WESTWOOD is not set
> # CONFIG_DEFAULT_RENO is not set
> CONFIG_DEFAULT_TCP_CONG=3D"cubic"
> # CONFIG_TCP_MD5SIG is not set
> CONFIG_IPV6=3Dm
> # CONFIG_IPV6_PRIVACY is not set
> # CONFIG_IPV6_ROUTER_PREF is not set
> # CONFIG_IPV6_OPTIMISTIC_DAD is not set
> # CONFIG_INET6_AH is not set
> # CONFIG_INET6_ESP is not set
> # CONFIG_INET6_IPCOMP is not set
> # CONFIG_IPV6_MIP6 is not set
> # CONFIG_INET6_XFRM_TUNNEL is not set
> # CONFIG_INET6_TUNNEL is not set
> CONFIG_INET6_XFRM_MODE_TRANSPORT=3Dm
> CONFIG_INET6_XFRM_MODE_TUNNEL=3Dm
> CONFIG_INET6_XFRM_MODE_BEET=3Dm
> # CONFIG_INET6_XFRM_MODE_ROUTEOPTIMIZATION is not set
> CONFIG_IPV6_SIT=3Dm
> CONFIG_IPV6_NDISC_NODETYPE=3Dy
> # CONFIG_IPV6_TUNNEL is not set
> # CONFIG_IPV6_MULTIPLE_TABLES is not set
> # CONFIG_IPV6_MROUTE is not set
> # CONFIG_NETWORK_SECMARK is not set
> CONFIG_NETFILTER=3Dy
> # CONFIG_NETFILTER_DEBUG is not set
> CONFIG_NETFILTER_ADVANCED=3Dy
>
> #
> # Core Netfilter Configuration
> #
> # CONFIG_NETFILTER_NETLINK_QUEUE is not set
> # CONFIG_NETFILTER_NETLINK_LOG is not set
> # CONFIG_NF_CONNTRACK is not set
> CONFIG_NETFILTER_XTABLES=3Dm
> # CONFIG_NETFILTER_XT_TARGET_CLASSIFY is not set
> # CONFIG_NETFILTER_XT_TARGET_MARK is not set
> # CONFIG_NETFILTER_XT_TARGET_NFLOG is not set
> # CONFIG_NETFILTER_XT_TARGET_NFQUEUE is not set
> # CONFIG_NETFILTER_XT_TARGET_RATEEST is not set
> # CONFIG_NETFILTER_XT_TARGET_TCPMSS is not set
> # CONFIG_NETFILTER_XT_MATCH_COMMENT is not set
> # CONFIG_NETFILTER_XT_MATCH_DCCP is not set
> # CONFIG_NETFILTER_XT_MATCH_DSCP is not set
> # CONFIG_NETFILTER_XT_MATCH_ESP is not set
> # CONFIG_NETFILTER_XT_MATCH_HASHLIMIT is not set
> # CONFIG_NETFILTER_XT_MATCH_IPRANGE is not set
> # CONFIG_NETFILTER_XT_MATCH_LENGTH is not set
> # CONFIG_NETFILTER_XT_MATCH_LIMIT is not set
> # CONFIG_NETFILTER_XT_MATCH_MAC is not set
> # CONFIG_NETFILTER_XT_MATCH_MARK is not set
> # CONFIG_NETFILTER_XT_MATCH_MULTIPORT is not set
> # CONFIG_NETFILTER_XT_MATCH_OWNER is not set
> # CONFIG_NETFILTER_XT_MATCH_POLICY is not set
> # CONFIG_NETFILTER_XT_MATCH_PKTTYPE is not set
> # CONFIG_NETFILTER_XT_MATCH_QUOTA is not set
> # CONFIG_NETFILTER_XT_MATCH_RATEEST is not set
> # CONFIG_NETFILTER_XT_MATCH_REALM is not set
> # CONFIG_NETFILTER_XT_MATCH_RECENT is not set
> # CONFIG_NETFILTER_XT_MATCH_SCTP is not set
> # CONFIG_NETFILTER_XT_MATCH_STATISTIC is not set
> # CONFIG_NETFILTER_XT_MATCH_STRING is not set
> # CONFIG_NETFILTER_XT_MATCH_TCPMSS is not set
> # CONFIG_NETFILTER_XT_MATCH_TIME is not set
> # CONFIG_NETFILTER_XT_MATCH_U32 is not set
> # CONFIG_IP_VS is not set
>
> #
> # IP: Netfilter Configuration
> #
> # CONFIG_NF_DEFRAG_IPV4 is not set
> # CONFIG_IP_NF_QUEUE is not set
> CONFIG_IP_NF_IPTABLES=3Dm
> # CONFIG_IP_NF_MATCH_ADDRTYPE is not set
> # CONFIG_IP_NF_MATCH_AH is not set
> # CONFIG_IP_NF_MATCH_ECN is not set
> # CONFIG_IP_NF_MATCH_TTL is not set
> # CONFIG_IP_NF_FILTER is not set
> # CONFIG_IP_NF_TARGET_LOG is not set
> CONFIG_IP_NF_TARGET_ULOG=3Dm
> # CONFIG_IP_NF_MANGLE is not set
> # CONFIG_IP_NF_RAW is not set
> # CONFIG_IP_NF_ARPTABLES is not set
>
> #
> # IPv6: Netfilter Configuration
> #
> # CONFIG_IP6_NF_QUEUE is not set
> # CONFIG_IP6_NF_IPTABLES is not set
> # CONFIG_IP_DCCP is not set
> # CONFIG_IP_SCTP is not set
> # CONFIG_TIPC is not set
> # CONFIG_ATM is not set
> # CONFIG_BRIDGE is not set
> # CONFIG_NET_DSA is not set
> # CONFIG_VLAN_8021Q is not set
> # CONFIG_DECNET is not set
> # CONFIG_LLC2 is not set
> # CONFIG_IPX is not set
> # CONFIG_ATALK is not set
> # CONFIG_X25 is not set
> # CONFIG_LAPB is not set
> # CONFIG_ECONET is not set
> # CONFIG_WAN_ROUTER is not set
> CONFIG_NET_SCHED=3Dy
>
> #
> # Queueing/Scheduling
> #
> CONFIG_NET_SCH_CBQ=3Dm
> CONFIG_NET_SCH_HTB=3Dm
> CONFIG_NET_SCH_HFSC=3Dm
> CONFIG_NET_SCH_PRIO=3Dm
> CONFIG_NET_SCH_MULTIQ=3Dm
> # CONFIG_NET_SCH_RED is not set
> CONFIG_NET_SCH_SFQ=3Dm
> # CONFIG_NET_SCH_TEQL is not set
> CONFIG_NET_SCH_TBF=3Dm
> # CONFIG_NET_SCH_GRED is not set
> # CONFIG_NET_SCH_DSMARK is not set
> # CONFIG_NET_SCH_NETEM is not set
>
> #
> # Classification
> #
> CONFIG_NET_CLS=3Dy
> CONFIG_NET_CLS_BASIC=3Dm
> CONFIG_NET_CLS_TCINDEX=3Dm
> CONFIG_NET_CLS_ROUTE4=3Dm
> CONFIG_NET_CLS_ROUTE=3Dy
> CONFIG_NET_CLS_FW=3Dm
> # CONFIG_NET_CLS_U32 is not set
> # CONFIG_NET_CLS_RSVP is not set
> # CONFIG_NET_CLS_RSVP6 is not set
> # CONFIG_NET_CLS_FLOW is not set
> # CONFIG_NET_EMATCH is not set
> # CONFIG_NET_CLS_ACT is not set
> # CONFIG_NET_CLS_IND is not set
> CONFIG_NET_SCH_FIFO=3Dy
>
> #
> # Network testing
> #
> CONFIG_NET_PKTGEN=3Dm
> # CONFIG_HAMRADIO is not set
> # CONFIG_CAN is not set
> CONFIG_IRDA=3Dm
>
> #
> # IrDA protocols
> #
> # CONFIG_IRLAN is not set
> # CONFIG_IRNET is not set
> # CONFIG_IRCOMM is not set
> # CONFIG_IRDA_ULTRA is not set
>
> #
> # IrDA options
> #
> # CONFIG_IRDA_CACHE_LAST_LSAP is not set
> # CONFIG_IRDA_FAST_RR is not set
> # CONFIG_IRDA_DEBUG is not set
>
> #
> # Infrared-port device drivers
> #
>
> #
> # SIR device drivers
> #
> # CONFIG_IRTTY_SIR is not set
>
> #
> # Dongle support
> #
> # CONFIG_KINGSUN_DONGLE is not set
> # CONFIG_KSDAZZLE_DONGLE is not set
> # CONFIG_KS959_DONGLE is not set
>
> #
> # FIR device drivers
> #
> # CONFIG_USB_IRDA is not set
> # CONFIG_SIGMATEL_FIR is not set
> # CONFIG_MCS_FIR is not set
> # CONFIG_MXC_FIR is not set
> CONFIG_BT=3Dm
> CONFIG_BT_L2CAP=3Dm
> CONFIG_BT_SCO=3Dm
> CONFIG_BT_RFCOMM=3Dm
> CONFIG_BT_RFCOMM_TTY=3Dy
> CONFIG_BT_BNEP=3Dm
> CONFIG_BT_BNEP_MC_FILTER=3Dy
> CONFIG_BT_BNEP_PROTO_FILTER=3Dy
> CONFIG_BT_HIDP=3Dm
>
> #
> # Bluetooth device drivers
> #
> CONFIG_BT_HCIBTUSB=3Dm
> CONFIG_BT_HCIBTSDIO=3Dm
> CONFIG_BT_HCIUART=3Dm
> CONFIG_BT_HCIUART_H4=3Dy
> CONFIG_BT_HCIUART_BCSP=3Dy
> CONFIG_BT_HCIUART_LL=3Dy
> CONFIG_BT_HCIBCM203X=3Dm
> CONFIG_BT_HCIBPA10X=3Dm
> CONFIG_BT_HCIBFUSB=3Dm
> CONFIG_BT_HCIVHCI=3Dm
> # CONFIG_AF_RXRPC is not set
> # CONFIG_PHONET is not set
> CONFIG_FIB_RULES=3Dy
> CONFIG_WIRELESS=3Dy
> # CONFIG_CFG80211 is not set
> CONFIG_WIRELESS_OLD_REGULATORY=3Dy
> CONFIG_WIRELESS_EXT=3Dy
> CONFIG_WIRELESS_EXT_SYSFS=3Dy
> # CONFIG_MAC80211 is not set
> CONFIG_IEEE80211=3Dy
> # CONFIG_IEEE80211_DEBUG is not set
> CONFIG_IEEE80211_CRYPT_WEP=3Dm
> CONFIG_IEEE80211_CRYPT_CCMP=3Dm
> CONFIG_IEEE80211_CRYPT_TKIP=3Dm
> CONFIG_RFKILL=3Dm
> CONFIG_RFKILL_INPUT=3Dm
> # CONFIG_NET_9P is not set
>
> #
> # Device Drivers
> #
>
> #
> # Generic Driver Options
> #
> CONFIG_UEVENT_HELPER_PATH=3D""
> CONFIG_STANDALONE=3Dy
> CONFIG_PREVENT_FIRMWARE_BUILD=3Dy
> CONFIG_FW_LOADER=3Dy
> CONFIG_FIRMWARE_IN_KERNEL=3Dy
> CONFIG_EXTRA_FIRMWARE=3D""
> # CONFIG_SYS_HYPERVISOR is not set
> CONFIG_CONNECTOR=3Dy
> CONFIG_PROC_EVENTS=3Dy
> CONFIG_MTD=3Dy
> # CONFIG_MTD_DEBUG is not set
> # CONFIG_MTD_CONCAT is not set
> CONFIG_MTD_PARTITIONS=3Dy
> # CONFIG_MTD_REDBOOT_PARTS is not set
> CONFIG_MTD_CMDLINE_PARTS=3Dy
> # CONFIG_MTD_AFS_PARTS is not set
> # CONFIG_MTD_AR7_PARTS is not set
>
> #
> # User Modules And Translation Layers
> #
> CONFIG_MTD_CHAR=3Dy
> CONFIG_MTD_BLKDEVS=3Dy
> CONFIG_MTD_BLOCK=3Dy
> # CONFIG_FTL is not set
> # CONFIG_NFTL is not set
> # CONFIG_INFTL is not set
> # CONFIG_RFD_FTL is not set
> # CONFIG_SSFDC is not set
> # CONFIG_MTD_OOPS is not set
>
> #
> # RAM/ROM/Flash chip drivers
> #
> CONFIG_MTD_CFI=3Dy
> # CONFIG_MTD_JEDECPROBE is not set
> CONFIG_MTD_GEN_PROBE=3Dy
> # CONFIG_MTD_CFI_ADV_OPTIONS is not set
> CONFIG_MTD_MAP_BANK_WIDTH_1=3Dy
> CONFIG_MTD_MAP_BANK_WIDTH_2=3Dy
> CONFIG_MTD_MAP_BANK_WIDTH_4=3Dy
> # CONFIG_MTD_MAP_BANK_WIDTH_8 is not set
> # CONFIG_MTD_MAP_BANK_WIDTH_16 is not set
> # CONFIG_MTD_MAP_BANK_WIDTH_32 is not set
> CONFIG_MTD_CFI_I1=3Dy
> CONFIG_MTD_CFI_I2=3Dy
> # CONFIG_MTD_CFI_I4 is not set
> # CONFIG_MTD_CFI_I8 is not set
> # CONFIG_MTD_CFI_INTELEXT is not set
> # CONFIG_MTD_CFI_AMDSTD is not set
> # CONFIG_MTD_CFI_STAA is not set
> CONFIG_MTD_CFI_UTIL=3Dy
> # CONFIG_MTD_RAM is not set
> # CONFIG_MTD_ROM is not set
> # CONFIG_MTD_ABSENT is not set
>
> #
> # Mapping drivers for chip access
> #
> # CONFIG_MTD_COMPLEX_MAPPINGS is not set
> # CONFIG_MTD_PHYSMAP is not set
> # CONFIG_MTD_ARM_INTEGRATOR is not set
> # CONFIG_MTD_PLATRAM is not set
> CONFIG_MTD_MXC=3Dy
>
> #
> # Self-contained MTD device drivers
> #
> # CONFIG_MTD_DATAFLASH is not set
> # CONFIG_MTD_M25P80 is not set
> # CONFIG_MTD_SLRAM is not set
> # CONFIG_MTD_PHRAM is not set
> # CONFIG_MTD_MTDRAM is not set
> # CONFIG_MTD_BLOCK2MTD is not set
>
> #
> # Disk-On-Chip Device Drivers
> #
> # CONFIG_MTD_DOC2000 is not set
> # CONFIG_MTD_DOC2001 is not set
> # CONFIG_MTD_DOC2001PLUS is not set
> CONFIG_MTD_NAND=3Dy
> CONFIG_MTD_NAND_VERIFY_WRITE=3Dy
> # CONFIG_MTD_NAND_ECC_SMC is not set
> # CONFIG_MTD_NAND_MUSEUM_IDS is not set
> CONFIG_MTD_NAND_IDS=3Dy
> # CONFIG_MTD_NAND_DISKONCHIP is not set
> # CONFIG_MTD_NAND_NANDSIM is not set
> CONFIG_MTD_NAND_MXC_V3=3Dy
> # CONFIG_MTD_NAND_MXC_SWECC is not set
> # CONFIG_MTD_NAND_MXC_FORCE_CE is not set
> # CONFIG_MXC_NAND_LOW_LEVEL_ERASE is not set
> # CONFIG_MTD_NAND_PLATFORM is not set
> # CONFIG_MTD_ALAUDA is not set
> # CONFIG_MTD_ONENAND is not set
>
> #
> # UBI - Unsorted block images
> #
> CONFIG_MTD_UBI=3Dy
> CONFIG_MTD_UBI_WL_THRESHOLD=3D256
> CONFIG_MTD_UBI_BEB_RESERVE=3D1
> CONFIG_MTD_UBI_GLUEBI=3Dy
>
> #
> # UBI debugging options
> #
> # CONFIG_MTD_UBI_DEBUG is not set
> # CONFIG_PARPORT is not set
> CONFIG_BLK_DEV=3Dy
> # CONFIG_BLK_DEV_COW_COMMON is not set
> CONFIG_BLK_DEV_LOOP=3Dy
> # CONFIG_BLK_DEV_CRYPTOLOOP is not set
> # CONFIG_BLK_DEV_NBD is not set
> # CONFIG_BLK_DEV_UB is not set
> # CONFIG_BLK_DEV_RAM is not set
> # CONFIG_CDROM_PKTCDVD is not set
> # CONFIG_ATA_OVER_ETH is not set
> # CONFIG_MISC_DEVICES is not set
> CONFIG_HAVE_IDE=3Dy
> # CONFIG_IDE is not set
>
> #
> # SCSI device support
> #
> # CONFIG_RAID_ATTRS is not set
> CONFIG_SCSI=3Dy
> CONFIG_SCSI_DMA=3Dy
> # CONFIG_SCSI_TGT is not set
> # CONFIG_SCSI_NETLINK is not set
> CONFIG_SCSI_PROC_FS=3Dy
>
> #
> # SCSI support type (disk, tape, CD-ROM)
> #
> CONFIG_BLK_DEV_SD=3Dy
> # CONFIG_CHR_DEV_ST is not set
> # CONFIG_CHR_DEV_OSST is not set
> CONFIG_BLK_DEV_SR=3Dm
> CONFIG_BLK_DEV_SR_VENDOR=3Dy
> CONFIG_CHR_DEV_SG=3Dm
> # CONFIG_CHR_DEV_SCH is not set
>
> #
> # Some SCSI devices (e.g. CD jukebox) support multiple LUNs
> #
> # CONFIG_SCSI_MULTI_LUN is not set
> # CONFIG_SCSI_CONSTANTS is not set
> # CONFIG_SCSI_LOGGING is not set
> # CONFIG_SCSI_SCAN_ASYNC is not set
> CONFIG_SCSI_WAIT_SCAN=3Dm
>
> #
> # SCSI Transports
> #
> # CONFIG_SCSI_SPI_ATTRS is not set
> # CONFIG_SCSI_FC_ATTRS is not set
> CONFIG_SCSI_ISCSI_ATTRS=3Dm
> # CONFIG_SCSI_SAS_ATTRS is not set
> # CONFIG_SCSI_SAS_LIBSAS is not set
> # CONFIG_SCSI_SRP_ATTRS is not set
> # CONFIG_SCSI_LOWLEVEL is not set
> # CONFIG_SCSI_DH is not set
> # CONFIG_ATA is not set
> # CONFIG_MD is not set
> CONFIG_NETDEVICES=3Dy
> # CONFIG_DUMMY is not set
> # CONFIG_BONDING is not set
> # CONFIG_MACVLAN is not set
> # CONFIG_EQUALIZER is not set
> CONFIG_TUN=3Dm
> CONFIG_VETH=3Dm
> # CONFIG_NET_ETHERNET is not set
> CONFIG_MII=3Dy
> # CONFIG_NETDEV_1000 is not set
> # CONFIG_NETDEV_10000 is not set
>
> #
> # Wireless LAN
> #
> # CONFIG_WLAN_PRE80211 is not set
> # CONFIG_WLAN_80211 is not set
> # CONFIG_KS7010_SDIO is not set
> # CONFIG_IWLWIFI_LEDS is not set
>
> #
> # USB Network Adapters
> #
> CONFIG_USB_CATC=3Dy
> CONFIG_USB_KAWETH=3Dy
> CONFIG_USB_PEGASUS=3Dy
> CONFIG_USB_RTL8150=3Dy
> CONFIG_USB_USBNET=3Dy
> CONFIG_USB_NET_AX8817X=3Dy
> CONFIG_USB_NET_CDCETHER=3Dy
> # CONFIG_USB_NET_DM9601 is not set
> # CONFIG_USB_NET_SMSC95XX is not set
> # CONFIG_USB_NET_GL620A is not set
> CONFIG_USB_NET_NET1080=3Dy
> CONFIG_USB_NET_PLUSB=3Dm
> # CONFIG_USB_NET_MCS7830 is not set
> CONFIG_USB_NET_RNDIS_HOST=3Dm
> CONFIG_USB_NET_CDC_SUBSET=3Dy
> # CONFIG_USB_ALI_M5632 is not set
> # CONFIG_USB_AN2720 is not set
> CONFIG_USB_BELKIN=3Dy
> CONFIG_USB_ARMLINUX=3Dy
> # CONFIG_USB_EPSON2888 is not set
> # CONFIG_USB_KC2190 is not set
> CONFIG_USB_NET_ZAURUS=3Dy
> CONFIG_USB_HSO=3Dm
> # CONFIG_WAN is not set
> CONFIG_PPP=3Dm
> CONFIG_PPP_MULTILINK=3Dy
> CONFIG_PPP_FILTER=3Dy
> CONFIG_PPP_ASYNC=3Dm
> CONFIG_PPP_SYNC_TTY=3Dm
> CONFIG_PPP_DEFLATE=3Dm
> CONFIG_PPP_BSDCOMP=3Dm
> CONFIG_PPP_MPPE=3Dm
> CONFIG_PPPOE=3Dm
> CONFIG_PPPOL2TP=3Dm
> # CONFIG_SLIP is not set
> CONFIG_SLHC=3Dm
> # CONFIG_NETCONSOLE is not set
> # CONFIG_NETPOLL is not set
> # CONFIG_NET_POLL_CONTROLLER is not set
> # CONFIG_ISDN is not set
>
> #
> # Input device support
> #
> CONFIG_INPUT=3Dy
> CONFIG_INPUT_FF_MEMLESS=3Dy
> CONFIG_INPUT_POLLDEV=3Dy
>
> #
> # Userland interfaces
> #
> CONFIG_INPUT_MOUSEDEV=3Dy
> CONFIG_INPUT_MOUSEDEV_PSAUX=3Dy
> CONFIG_INPUT_MOUSEDEV_SCREEN_X=3D1024
> CONFIG_INPUT_MOUSEDEV_SCREEN_Y=3D768
> # CONFIG_INPUT_JOYDEV is not set
> CONFIG_INPUT_EVDEV=3Dy
> # CONFIG_INPUT_EVBUG is not set
> # CONFIG_INPUT_APMPOWER is not set
> CONFIG_ALLOC_FUNC_KEY=3Dy
>
> #
> # Input Device Drivers
> #
> CONFIG_INPUT_KEYBOARD=3Dy
> CONFIG_KEYBOARD_ATKBD=3Dy
> # CONFIG_KEYBOARD_SUNKBD is not set
> # CONFIG_KEYBOARD_LKKBD is not set
> # CONFIG_KEYBOARD_XTKBD is not set
> # CONFIG_KEYBOARD_NEWTON is not set
> # CONFIG_KEYBOARD_STOWAWAY is not set
> # CONFIG_KEYBOARD_MXC is not set
> CONFIG_TOUCHKEY_MXC=3Dy
> # CONFIG_INPUT_MOUSE is not set
> CONFIG_INPUT_JOYSTICK=3Dy
> # CONFIG_JOYSTICK_ANALOG is not set
> # CONFIG_JOYSTICK_A3D is not set
> # CONFIG_JOYSTICK_ADI is not set
> # CONFIG_JOYSTICK_COBRA is not set
> # CONFIG_JOYSTICK_GF2K is not set
> # CONFIG_JOYSTICK_GRIP is not set
> # CONFIG_JOYSTICK_GRIP_MP is not set
> # CONFIG_JOYSTICK_GUILLEMOT is not set
> # CONFIG_JOYSTICK_INTERACT is not set
> # CONFIG_JOYSTICK_SIDEWINDER is not set
> # CONFIG_JOYSTICK_TMDC is not set
> # CONFIG_JOYSTICK_IFORCE is not set
> # CONFIG_JOYSTICK_WARRIOR is not set
> # CONFIG_JOYSTICK_MAGELLAN is not set
> # CONFIG_JOYSTICK_SPACEORB is not set
> # CONFIG_JOYSTICK_SPACEBALL is not set
> # CONFIG_JOYSTICK_STINGER is not set
> # CONFIG_JOYSTICK_TWIDJOY is not set
> # CONFIG_JOYSTICK_ZHENHUA is not set
> # CONFIG_JOYSTICK_JOYDUMP is not set
> # CONFIG_JOYSTICK_XPAD is not set
> CONFIG_JOYSTICK_OJ6SH=3Dy
> # CONFIG_INPUT_TABLET is not set
> CONFIG_INPUT_TOUCHSCREEN=3Dy
> # CONFIG_TOUCHSCREEN_ADS7846 is not set
> # CONFIG_TOUCHSCREEN_FUJITSU is not set
> # CONFIG_TOUCHSCREEN_GUNZE is not set
> # CONFIG_TOUCHSCREEN_ELO is not set
> # CONFIG_TOUCHSCREEN_MTOUCH is not set
> # CONFIG_TOUCHSCREEN_INEXIO is not set
> # CONFIG_TOUCHSCREEN_MK712 is not set
> CONFIG_TOUCHSCREEN_MXC=3Dy
> # CONFIG_TOUCHSCREEN_TSC2007 is not set
> # CONFIG_TOUCHSCREEN_PENMOUNT is not set
> # CONFIG_TOUCHSCREEN_TOUCHRIGHT is not set
> # CONFIG_TOUCHSCREEN_TOUCHWIN is not set
> CONFIG_TOUCHSCREEN_USB_COMPOSITE=3Dm
> CONFIG_TOUCHSCREEN_USB_EGALAX=3Dy
> CONFIG_TOUCHSCREEN_USB_PANJIT=3Dy
> CONFIG_TOUCHSCREEN_USB_3M=3Dy
> CONFIG_TOUCHSCREEN_USB_ITM=3Dy
> CONFIG_TOUCHSCREEN_USB_ETURBO=3Dy
> CONFIG_TOUCHSCREEN_USB_GUNZE=3Dy
> CONFIG_TOUCHSCREEN_USB_DMC_TSC10=3Dy
> CONFIG_TOUCHSCREEN_USB_IRTOUCH=3Dy
> CONFIG_TOUCHSCREEN_USB_IDEALTEK=3Dy
> CONFIG_TOUCHSCREEN_USB_GENERAL_TOUCH=3Dy
> CONFIG_TOUCHSCREEN_USB_GOTOP=3Dy
> # CONFIG_TOUCHSCREEN_TOUCHIT213 is not set
> CONFIG_INPUT_MISC=3Dy
> # CONFIG_INPUT_ATI_REMOTE is not set
> # CONFIG_INPUT_ATI_REMOTE2 is not set
> # CONFIG_INPUT_KEYSPAN_REMOTE is not set
> # CONFIG_INPUT_POWERMATE is not set
> # CONFIG_INPUT_YEALINK is not set
> # CONFIG_INPUT_CM109 is not set
> # CONFIG_INPUT_UINPUT is not set
> CONFIG_GPIO_SW=3Dy
>
> #
> # Hardware I/O ports
> #
> CONFIG_SERIO=3Dy
> CONFIG_SERIO_SERPORT=3Dy
> CONFIG_SERIO_LIBPS2=3Dy
> # CONFIG_SERIO_RAW is not set
> # CONFIG_GAMEPORT is not set
>
> #
> # Character devices
> #
> CONFIG_VT=3Dy
> CONFIG_CONSOLE_TRANSLATIONS=3Dy
> CONFIG_VT_CONSOLE=3Dy
> CONFIG_HW_CONSOLE=3Dy
> # CONFIG_VT_HW_CONSOLE_BINDING is not set
> CONFIG_DEVKMEM=3Dy
> # CONFIG_SERIAL_NONSTANDARD is not set
> CONFIG_MXC_IIM=3Dy
> # CONFIG_IMX_SIM is not set
>
> #
> # Serial drivers
> #
> # CONFIG_SERIAL_8250 is not set
>
> #
> # Non-8250 serial port support
> #
> CONFIG_SERIAL_MXC=3Dy
> CONFIG_SERIAL_MXC_CONSOLE=3Dy
> # CONFIG_SERIAL_IMX is not set
> CONFIG_SERIAL_CORE=3Dy
> CONFIG_SERIAL_CORE_CONSOLE=3Dy
> CONFIG_UNIX98_PTYS=3Dy
> CONFIG_LEGACY_PTYS=3Dy
> CONFIG_LEGACY_PTY_COUNT=3D256
> # CONFIG_IPMI_HANDLER is not set
> CONFIG_HW_RANDOM=3Dy
> # CONFIG_NVRAM is not set
> # CONFIG_R3964 is not set
> # CONFIG_RAW_DRIVER is not set
> # CONFIG_TCG_TPM is not set
> CONFIG_I2C=3Dy
> CONFIG_I2C_BOARDINFO=3Dy
> CONFIG_I2C_CHARDEV=3Dy
> CONFIG_I2C_HELPER_AUTO=3Dy
>
> #
> # I2C Hardware Bus support
> #
>
> #
> # I2C system bus drivers (mostly embedded / system-on-chip)
> #
> CONFIG_I2C_MXC=3Dy
> CONFIG_I2C_MXC_HS=3Dy
> # CONFIG_I2C_OCORES is not set
> # CONFIG_I2C_SIMTEC is not set
>
> #
> # External I2C/SMBus adapter drivers
> #
> # CONFIG_I2C_PARPORT_LIGHT is not set
> # CONFIG_I2C_TAOS_EVM is not set
> # CONFIG_I2C_TINY_USB is not set
>
> #
> # Other I2C/SMBus bus drivers
> #
> # CONFIG_I2C_PCA_PLATFORM is not set
> # CONFIG_I2C_STUB is not set
>
> #
> # Miscellaneous I2C Chip support
> #
> # CONFIG_DS1682 is not set
> # CONFIG_AT24 is not set
> # CONFIG_SENSORS_EEPROM is not set
> # CONFIG_SENSORS_PCF8574 is not set
> # CONFIG_PCF8575 is not set
> # CONFIG_SENSORS_PCA9539 is not set
> # CONFIG_SENSORS_PCF8591 is not set
> # CONFIG_SENSORS_MAX6875 is not set
> # CONFIG_SENSORS_TSL2550 is not set
> # CONFIG_I2C_DEBUG_CORE is not set
> # CONFIG_I2C_DEBUG_ALGO is not set
> # CONFIG_I2C_DEBUG_BUS is not set
> # CONFIG_I2C_DEBUG_CHIP is not set
> # CONFIG_I2C_SLAVE is not set
> CONFIG_SPI=3Dy
> CONFIG_SPI_MASTER=3Dy
>
> #
> # SPI Master Controller Drivers
> #
> CONFIG_SPI_BITBANG=3Dy
> CONFIG_SPI_MXC=3Dy
> # CONFIG_SPI_MXC_TEST_LOOPBACK is not set
> CONFIG_SPI_MXC_SELECT1=3Dy
> # CONFIG_SPI_MXC_SELECT2 is not set
> # CONFIG_SPI_MXC_SELECT3 is not set
>
> #
> # SPI Protocol Masters
> #
> # CONFIG_SPI_AT25 is not set
> # CONFIG_SPI_SPIDEV is not set
> # CONFIG_SPI_TLE62X0 is not set
> # CONFIG_W1 is not set
> CONFIG_POWER_SUPPLY=3Dy
> # CONFIG_POWER_SUPPLY_DEBUG is not set
> # CONFIG_PDA_POWER is not set
> CONFIG_APM_POWER=3Dy
> # CONFIG_BATTERY_DS2760 is not set
> # CONFIG_BATTERY_BQ27x00 is not set
> # CONFIG_HWMON is not set
> # CONFIG_THERMAL is not set
> # CONFIG_THERMAL_HWMON is not set
> CONFIG_WATCHDOG=3Dy
> CONFIG_WATCHDOG_NOWAYOUT=3Dy
>
> #
> # Watchdog Device Drivers
> #
> # CONFIG_SOFT_WATCHDOG is not set
> CONFIG_MXC_WATCHDOG=3Dy
>
> #
> # USB-based Watchdog Cards
> #
> # CONFIG_USBPCWATCHDOG is not set
> CONFIG_SSB_POSSIBLE=3Dy
>
> #
> # Sonics Silicon Backplane
> #
> # CONFIG_SSB is not set
>
> #
> # Multifunction device drivers
> #
> # CONFIG_MFD_CORE is not set
> # CONFIG_MFD_SM501 is not set
> # CONFIG_HTC_PASIC3 is not set
> # CONFIG_MFD_TMIO is not set
> # CONFIG_PMIC_DA903X is not set
> # CONFIG_MFD_WM8400 is not set
> # CONFIG_MFD_WM8350_I2C is not set
>
> #
> # Multimedia devices
> #
>
> #
> # Multimedia core support
> #
> CONFIG_VIDEO_DEV=3Dy
> CONFIG_VIDEO_V4L2_COMMON=3Dy
> CONFIG_VIDEO_ALLOW_V4L1=3Dy
> CONFIG_VIDEO_V4L1_COMPAT=3Dy
> # CONFIG_DVB_CORE is not set
> CONFIG_VIDEO_MEDIA=3Dy
>
> #
> # Multimedia drivers
> #
> # CONFIG_MEDIA_ATTACH is not set
> CONFIG_MEDIA_TUNER=3Dy
> CONFIG_MEDIA_TUNER_CUSTOMIZE=3Dy
> # CONFIG_MEDIA_TUNER_SIMPLE is not set
> # CONFIG_MEDIA_TUNER_TDA8290 is not set
> # CONFIG_MEDIA_TUNER_TDA827X is not set
> # CONFIG_MEDIA_TUNER_TDA18271 is not set
> # CONFIG_MEDIA_TUNER_TDA9887 is not set
> # CONFIG_MEDIA_TUNER_TEA5761 is not set
> # CONFIG_MEDIA_TUNER_TEA5767 is not set
> # CONFIG_MEDIA_TUNER_MT20XX is not set
> # CONFIG_MEDIA_TUNER_MT2060 is not set
> # CONFIG_MEDIA_TUNER_MT2266 is not set
> # CONFIG_MEDIA_TUNER_MT2131 is not set
> # CONFIG_MEDIA_TUNER_QT1010 is not set
> # CONFIG_MEDIA_TUNER_XC2028 is not set
> # CONFIG_MEDIA_TUNER_XC5000 is not set
> # CONFIG_MEDIA_TUNER_MXL5005S is not set
> # CONFIG_MEDIA_TUNER_MXL5007T is not set
> CONFIG_VIDEO_V4L2=3Dy
> CONFIG_VIDEO_V4L1=3Dy
> CONFIG_VIDEO_CAPTURE_DRIVERS=3Dy
> # CONFIG_VIDEO_ADV_DEBUG is not set
> # CONFIG_VIDEO_FIXED_MINOR_RANGES is not set
> # CONFIG_VIDEO_HELPER_CHIPS_AUTO is not set
>
> #
> # Encoders/decoders and other helper chips
> #
>
> #
> # Audio decoders
> #
> # CONFIG_VIDEO_TVAUDIO is not set
> # CONFIG_VIDEO_TDA7432 is not set
> # CONFIG_VIDEO_TDA9840 is not set
> # CONFIG_VIDEO_TDA9875 is not set
> # CONFIG_VIDEO_TEA6415C is not set
> # CONFIG_VIDEO_TEA6420 is not set
> # CONFIG_VIDEO_MSP3400 is not set
> # CONFIG_VIDEO_CS5345 is not set
> # CONFIG_VIDEO_CS53L32A is not set
> # CONFIG_VIDEO_M52790 is not set
> # CONFIG_VIDEO_TLV320AIC23B is not set
> # CONFIG_VIDEO_WM8775 is not set
> # CONFIG_VIDEO_WM8739 is not set
> # CONFIG_VIDEO_VP27SMPX is not set
>
> #
> # Video decoders
> #
> # CONFIG_VIDEO_BT819 is not set
> # CONFIG_VIDEO_BT856 is not set
> # CONFIG_VIDEO_BT866 is not set
> # CONFIG_VIDEO_KS0127 is not set
> # CONFIG_VIDEO_OV7670 is not set
> # CONFIG_VIDEO_TCM825X is not set
> # CONFIG_VIDEO_SAA7110 is not set
> # CONFIG_VIDEO_SAA7111 is not set
> # CONFIG_VIDEO_SAA7114 is not set
> # CONFIG_VIDEO_SAA711X is not set
> # CONFIG_VIDEO_SAA717X is not set
> # CONFIG_VIDEO_SAA7191 is not set
> # CONFIG_VIDEO_TVP5150 is not set
> # CONFIG_VIDEO_VPX3220 is not set
>
> #
> # Video and audio decoders
> #
> # CONFIG_VIDEO_CX25840 is not set
>
> #
> # MPEG video encoders
> #
> # CONFIG_VIDEO_CX2341X is not set
>
> #
> # Video encoders
> #
> # CONFIG_VIDEO_SAA7127 is not set
> # CONFIG_VIDEO_SAA7185 is not set
> # CONFIG_VIDEO_ADV7170 is not set
> # CONFIG_VIDEO_ADV7175 is not set
>
> #
> # Video improvement chips
> #
> # CONFIG_VIDEO_UPD64031A is not set
> # CONFIG_VIDEO_UPD64083 is not set
> # CONFIG_VIDEO_VIVI is not set
> # CONFIG_VIDEO_MXC_CAMERA is not set
> CONFIG_VIDEO_MXC_OUTPUT=3Dy
> CONFIG_VIDEO_MXC_IPU_OUTPUT=3Dy
> # CONFIG_VIDEO_MXC_IPUV1_WVGA_OUTPUT is not set
> # CONFIG_VIDEO_MXC_OPL is not set
> # CONFIG_VIDEO_CPIA is not set
> # CONFIG_VIDEO_CPIA2 is not set
> # CONFIG_VIDEO_SAA5246A is not set
> # CONFIG_VIDEO_SAA5249 is not set
> # CONFIG_SOC_CAMERA is not set
> # CONFIG_V4L_USB_DRIVERS is not set
> # CONFIG_RADIO_ADAPTERS is not set
> # CONFIG_DAB is not set
>
> #
> # Graphics support
> #
> # CONFIG_VGASTATE is not set
> # CONFIG_VIDEO_OUTPUT_CONTROL is not set
> CONFIG_FB=3Dy
> # CONFIG_FIRMWARE_EDID is not set
> # CONFIG_FB_DDC is not set
> # CONFIG_FB_BOOT_VESA_SUPPORT is not set
> CONFIG_FB_CFB_FILLRECT=3Dy
> CONFIG_FB_CFB_COPYAREA=3Dy
> CONFIG_FB_CFB_IMAGEBLIT=3Dy
> # CONFIG_FB_CFB_REV_PIXELS_IN_BYTE is not set
> # CONFIG_FB_SYS_FILLRECT is not set
> # CONFIG_FB_SYS_COPYAREA is not set
> # CONFIG_FB_SYS_IMAGEBLIT is not set
> # CONFIG_FB_FOREIGN_ENDIAN is not set
> # CONFIG_FB_SYS_FOPS is not set
> # CONFIG_FB_SVGALIB is not set
> # CONFIG_FB_MACMODES is not set
> # CONFIG_FB_BACKLIGHT is not set
> CONFIG_FB_MODE_HELPERS=3Dy
> # CONFIG_FB_TILEBLITTING is not set
>
> #
> # Frame buffer hardware drivers
> #
> CONFIG_FB_MXC=3Dy
> CONFIG_FB_MXC_SYNC_PANEL=3Dy
> # CONFIG_FB_MXC_EPSON_VGA_SYNC_PANEL is not set
> # CONFIG_FB_MXC_TVOUT_TVE is not set
> # CONFIG_FB_MXC_CLAA_WVGA_SYNC_PANEL is not set
> CONFIG_FB_MXC_SHARP_WSVGA_SYNC_PANEL=3Dy
> # CONFIG_FB_MXC_CH7026 is not set
> # CONFIG_FB_MXC_TVOUT is not set
> # CONFIG_FB_MXC_TVOUT_CH7024 is not set
> # CONFIG_FB_MXC_ASYNC_PANEL is not set
> # CONFIG_FB_UVESA is not set
> # CONFIG_FB_S1D13XXX is not set
> # CONFIG_FB_VIRTUAL is not set
> # CONFIG_FB_METRONOME is not set
> # CONFIG_FB_MB862XX is not set
> CONFIG_BACKLIGHT_LCD_SUPPORT=3Dy
> # CONFIG_LCD_CLASS_DEVICE is not set
> CONFIG_BACKLIGHT_CLASS_DEVICE=3Dy
> # CONFIG_BACKLIGHT_CORGI is not set
> CONFIG_BACKLIGHT_MXC=3Dy
> # CONFIG_BACKLIGHT_MXC_MC13892 is not set
> CONFIG_BACKLIGHT_MXC_PWM=3Dy
>
> #
> # Display device support
> #
> # CONFIG_DISPLAY_SUPPORT is not set
>
> #
> # Console display driver support
> #
> # CONFIG_VGA_CONSOLE is not set
> CONFIG_DUMMY_CONSOLE=3Dy
> CONFIG_FRAMEBUFFER_CONSOLE=3Dy
> # CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY is not set
> # CONFIG_FRAMEBUFFER_CONSOLE_ROTATION is not set
> # CONFIG_FONTS is not set
> CONFIG_FONT_8x8=3Dy
> CONFIG_FONT_8x16=3Dy
> # CONFIG_LOGO is not set
> CONFIG_SOUND=3Dy
> CONFIG_SOUND_OSS_CORE=3Dy
> CONFIG_SND=3Dy
> CONFIG_SND_TIMER=3Dy
> CONFIG_SND_PCM=3Dy
> CONFIG_SND_HWDEP=3Dm
> CONFIG_SND_RAWMIDI=3Dm
> # CONFIG_SND_SEQUENCER is not set
> CONFIG_SND_OSSEMUL=3Dy
> CONFIG_SND_MIXER_OSS=3Dy
> CONFIG_SND_PCM_OSS=3Dy
> CONFIG_SND_PCM_OSS_PLUGINS=3Dy
> # CONFIG_SND_DYNAMIC_MINORS is not set
> CONFIG_SND_SUPPORT_OLD_API=3Dy
> CONFIG_SND_VERBOSE_PROCFS=3Dy
> # CONFIG_SND_VERBOSE_PRINTK is not set
> # CONFIG_SND_DEBUG is not set
> # CONFIG_SND_DRIVERS is not set
> # CONFIG_SND_ARM is not set
> # CONFIG_SND_SPI is not set
> CONFIG_SND_USB=3Dy
> CONFIG_SND_USB_AUDIO=3Dm
> CONFIG_SND_USB_CAIAQ=3Dm
> CONFIG_SND_USB_CAIAQ_INPUT=3Dy
> CONFIG_SND_SOC=3Dy
> CONFIG_SND_MXC_SOC=3Dy
> CONFIG_SND_MXC_SOC_SSI=3Dy
> CONFIG_SND_MXC_SOC_IRAM=3Dy
> CONFIG_SND_SOC_IMX_3STACK_SGTL5000=3Dy
> # CONFIG_SND_SOC_IMX_3STACK_AK4647 is not set
> # CONFIG_SND_SOC_IMX_3STACK_WM8580 is not set
> # CONFIG_SND_SOC_IMX_3STACK_AK5702 is not set
> # CONFIG_SND_SOC_IMX_3STACK_BLUETOOTH is not set
> # CONFIG_SND_SOC_ALL_CODECS is not set
> CONFIG_SND_SOC_SGTL5000=3Dy
> # CONFIG_SOUND_PRIME is not set
> CONFIG_HID_SUPPORT=3Dy
> CONFIG_HID=3Dy
> # CONFIG_HID_DEBUG is not set
> CONFIG_HIDRAW=3Dy
>
> #
> # USB Input Devices
> #
> CONFIG_USB_HID=3Dy
> CONFIG_HID_PID=3Dy
> # CONFIG_USB_HIDDEV is not set
>
> #
> # Special HID drivers
> #
> CONFIG_HID_COMPAT=3Dy
> CONFIG_HID_A4TECH=3Dy
> CONFIG_HID_APPLE=3Dy
> CONFIG_HID_BELKIN=3Dy
> CONFIG_HID_BRIGHT=3Dy
> CONFIG_HID_CHERRY=3Dy
> CONFIG_HID_CHICONY=3Dy
> CONFIG_HID_CYPRESS=3Dy
> CONFIG_HID_DELL=3Dy
> CONFIG_HID_EZKEY=3Dy
> CONFIG_HID_GYRATION=3Dy
> CONFIG_HID_LOGITECH=3Dy
> # CONFIG_LOGITECH_FF is not set
> # CONFIG_LOGIRUMBLEPAD2_FF is not set
> CONFIG_HID_MICROSOFT=3Dy
> CONFIG_HID_MONTEREY=3Dy
> CONFIG_HID_PANTHERLORD=3Dy
> # CONFIG_PANTHERLORD_FF is not set
> CONFIG_HID_PETALYNX=3Dy
> CONFIG_HID_SAMSUNG=3Dy
> CONFIG_HID_SONY=3Dy
> CONFIG_HID_SUNPLUS=3Dy
> # CONFIG_THRUSTMASTER_FF is not set
> # CONFIG_ZEROPLUS_FF is not set
> CONFIG_USB_SUPPORT=3Dy
> CONFIG_USB_ARCH_HAS_HCD=3Dy
> # CONFIG_USB_ARCH_HAS_OHCI is not set
> CONFIG_USB_ARCH_HAS_EHCI=3Dy
> CONFIG_USB=3Dy
> # CONFIG_USB_DEBUG is not set
> # CONFIG_USB_ANNOUNCE_NEW_DEVICES is not set
>
> #
> # Miscellaneous USB options
> #
> CONFIG_USB_DEVICEFS=3Dy
> CONFIG_USB_DEVICE_CLASS=3Dy
> # CONFIG_USB_DYNAMIC_MINORS is not set
> CONFIG_USB_SUSPEND=3Dy
> # CONFIG_USB_OTG is not set
> # CONFIG_USB_OTG_WHITELIST is not set
> # CONFIG_USB_OTG_BLACKLIST_HUB is not set
> CONFIG_USB_MON=3Dy
> # CONFIG_USB_WUSB is not set
> # CONFIG_USB_WUSB_CBAF is not set
>
> #
> # USB Host Controller Drivers
> #
> # CONFIG_USB_C67X00_HCD is not set
> CONFIG_USB_EHCI_HCD=3Dy
> CONFIG_USB_EHCI_ARC=3Dy
> CONFIG_USB_EHCI_ARC_H1=3Dy
> # CONFIG_USB_EHCI_ARC_H2 is not set
> CONFIG_USB_EHCI_ARC_OTG=3Dy
> # CONFIG_USB_EHCI_ARC_OTG_WAKE_UP is not set
> # CONFIG_USB_STATIC_IRAM is not set
> # CONFIG_USB_EHCI_FSL_MC13783 is not set
> # CONFIG_USB_EHCI_FSL_1301 is not set
> # CONFIG_USB_EHCI_FSL_1504 is not set
> CONFIG_USB_EHCI_FSL_UTMI=3Dy
> CONFIG_USB_EHCI_ROOT_HUB_TT=3Dy
> CONFIG_USB_EHCI_TT_NEWSCHED=3Dy
> # CONFIG_USB_ISP116X_HCD is not set
> # CONFIG_USB_U132_HCD is not set
> # CONFIG_USB_SL811_HCD is not set
> # CONFIG_USB_R8A66597_HCD is not set
> # CONFIG_USB_HWA_HCD is not set
> # CONFIG_USB_GADGET_MUSB_HDRC is not set
>
> #
> # USB Device Class drivers
> #
> CONFIG_USB_ACM=3Dm
> CONFIG_USB_PRINTER=3Dm
> CONFIG_USB_WDM=3Dm
> CONFIG_USB_TMC=3Dm
>
> #
> # NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may also be needed;
> #
>
> #
> # see USB_STORAGE Help for more information
> #
> CONFIG_USB_STORAGE=3Dm
> # CONFIG_USB_STORAGE_DEBUG is not set
> CONFIG_USB_STORAGE_DATAFAB=3Dy
> CONFIG_USB_STORAGE_FREECOM=3Dy
> CONFIG_USB_STORAGE_ISD200=3Dy
> CONFIG_USB_STORAGE_DPCM=3Dy
> CONFIG_USB_STORAGE_USBAT=3Dy
> CONFIG_USB_STORAGE_SDDR09=3Dy
> CONFIG_USB_STORAGE_SDDR55=3Dy
> CONFIG_USB_STORAGE_JUMPSHOT=3Dy
> CONFIG_USB_STORAGE_ALAUDA=3Dy
> CONFIG_USB_STORAGE_ONETOUCH=3Dy
> CONFIG_USB_STORAGE_KARMA=3Dy
> CONFIG_USB_STORAGE_CYPRESS_ATACB=3Dy
> CONFIG_USB_LIBUSUAL=3Dy
>
> #
> # USB Imaging devices
> #
> CONFIG_USB_MDC800=3Dm
> # CONFIG_USB_MICROTEK is not set
>
> #
> # USB port drivers
> #
> CONFIG_USB_SERIAL=3Dm
> # CONFIG_USB_EZUSB is not set
> CONFIG_USB_SERIAL_GENERIC=3Dy
> # CONFIG_USB_SERIAL_AIRCABLE is not set
> # CONFIG_USB_SERIAL_ARK3116 is not set
> # CONFIG_USB_SERIAL_BELKIN is not set
> # CONFIG_USB_SERIAL_CH341 is not set
> # CONFIG_USB_SERIAL_WHITEHEAT is not set
> # CONFIG_USB_SERIAL_DIGI_ACCELEPORT is not set
> # CONFIG_USB_SERIAL_CP2101 is not set
> # CONFIG_USB_SERIAL_CYPRESS_M8 is not set
> # CONFIG_USB_SERIAL_EMPEG is not set
> CONFIG_USB_SERIAL_FTDI_SIO=3Dm
> # CONFIG_USB_SERIAL_FUNSOFT is not set
> # CONFIG_USB_SERIAL_VISOR is not set
> # CONFIG_USB_SERIAL_IPAQ is not set
> # CONFIG_USB_SERIAL_IR is not set
> # CONFIG_USB_SERIAL_EDGEPORT is not set
> # CONFIG_USB_SERIAL_EDGEPORT_TI is not set
> # CONFIG_USB_SERIAL_GARMIN is not set
> # CONFIG_USB_SERIAL_IPW is not set
> # CONFIG_USB_SERIAL_IUU is not set
> # CONFIG_USB_SERIAL_KEYSPAN_PDA is not set
> # CONFIG_USB_SERIAL_KEYSPAN is not set
> # CONFIG_USB_SERIAL_KLSI is not set
> # CONFIG_USB_SERIAL_KOBIL_SCT is not set
> # CONFIG_USB_SERIAL_MCT_U232 is not set
> # CONFIG_USB_SERIAL_MOS7720 is not set
> # CONFIG_USB_SERIAL_MOS7840 is not set
> # CONFIG_USB_SERIAL_MOTOROLA is not set
> # CONFIG_USB_SERIAL_NAVMAN is not set
> # CONFIG_USB_SERIAL_PL2303 is not set
> # CONFIG_USB_SERIAL_OTI6858 is not set
> # CONFIG_USB_SERIAL_SPCP8X5 is not set
> # CONFIG_USB_SERIAL_HP4X is not set
> # CONFIG_USB_SERIAL_SAFE is not set
> # CONFIG_USB_SERIAL_SIERRAWIRELESS is not set
> # CONFIG_USB_SERIAL_TI is not set
> # CONFIG_USB_SERIAL_CYBERJACK is not set
> # CONFIG_USB_SERIAL_XIRCOM is not set
> CONFIG_USB_SERIAL_OPTION=3Dm
> # CONFIG_USB_SERIAL_OMNINET is not set
> # CONFIG_USB_SERIAL_DEBUG is not set
>
> #
> # USB Miscellaneous drivers
> #
> CONFIG_USB_EMI62=3Dm
> CONFIG_USB_EMI26=3Dm
> CONFIG_USB_ADUTUX=3Dm
> CONFIG_USB_SEVSEG=3Dm
> CONFIG_USB_RIO500=3Dm
> CONFIG_USB_LEGOTOWER=3Dm
> CONFIG_USB_LCD=3Dm
> CONFIG_USB_BERRY_CHARGE=3Dm
> CONFIG_USB_LED=3Dm
> CONFIG_USB_CYPRESS_CY7C63=3Dm
> CONFIG_USB_CYTHERM=3Dm
> CONFIG_USB_PHIDGET=3Dm
> CONFIG_USB_PHIDGETKIT=3Dm
> CONFIG_USB_PHIDGETMOTORCONTROL=3Dm
> CONFIG_USB_PHIDGETSERVO=3Dm
> CONFIG_USB_IDMOUSE=3Dm
> CONFIG_USB_FTDI_ELAN=3Dm
> CONFIG_USB_APPLEDISPLAY=3Dm
> CONFIG_USB_SISUSBVGA=3Dm
> CONFIG_USB_SISUSBVGA_CON=3Dy
> CONFIG_USB_LD=3Dm
> CONFIG_USB_TRANCEVIBRATOR=3Dm
> CONFIG_USB_IOWARRIOR=3Dm
> CONFIG_USB_TEST=3Dm
> CONFIG_USB_ISIGHTFW=3Dm
> CONFIG_USB_VST=3Dm
> CONFIG_USB_GADGET=3Dm
> # CONFIG_USB_GADGET_DEBUG_FILES is not set
> CONFIG_USB_GADGET_VBUS_DRAW=3D2
> CONFIG_USB_GADGET_SELECTED=3Dy
> # CONFIG_USB_GADGET_AT91 is not set
> # CONFIG_USB_GADGET_ATMEL_USBA is not set
> # CONFIG_USB_GADGET_FSL_USB2 is not set
> # CONFIG_USB_GADGET_LH7A40X is not set
> # CONFIG_USB_GADGET_OMAP is not set
> # CONFIG_USB_GADGET_PXA25X is not set
> # CONFIG_USB_GADGET_PXA27X is not set
> # CONFIG_USB_GADGET_S3C2410 is not set
> CONFIG_USB_GADGET_M66592=3Dy
> CONFIG_USB_M66592=3Dm
> # CONFIG_USB_GADGET_AMD5536UDC is not set
> # CONFIG_USB_GADGET_FSL_QE is not set
> # CONFIG_USB_GADGET_NET2280 is not set
> # CONFIG_USB_GADGET_GOKU is not set
> # CONFIG_USB_GADGET_ARC is not set
> # CONFIG_USB_GADGET_DUMMY_HCD is not set
> CONFIG_USB_GADGET_DUALSPEED=3Dy
> CONFIG_USB_ZERO=3Dm
> CONFIG_USB_ETH=3Dm
> CONFIG_USB_ETH_RNDIS=3Dy
> CONFIG_USB_GADGETFS=3Dm
> CONFIG_USB_FILE_STORAGE=3Dm
> CONFIG_USB_FILE_STORAGE_TEST=3Dy
> CONFIG_USB_G_SERIAL=3Dm
> CONFIG_USB_MIDI_GADGET=3Dm
> CONFIG_USB_G_PRINTER=3Dm
> CONFIG_USB_CDC_COMPOSITE=3Dm
> CONFIG_MMC=3Dy
> # CONFIG_MMC_DEBUG is not set
> CONFIG_MMC_UNSAFE_RESUME=3Dy
>
> #
> # MMC/SD/SDIO Card Drivers
> #
> CONFIG_MMC_BLOCK=3Dy
> CONFIG_MMC_BLOCK_BOUNCE=3Dy
> # CONFIG_SDIO_UART is not set
> # CONFIG_MMC_TEST is not set
>
> #
> # MMC/SD/SDIO Host Controller Drivers
> #
> # CONFIG_MMC_SDHCI is not set
> # CONFIG_MMC_SPI is not set
> # CONFIG_MMC_MXC is not set
> CONFIG_MMC_IMX_ESDHCI=3Dy
> # CONFIG_MMC_IMX_ESDHCI_PIO_MODE is not set
> # CONFIG_MEMSTICK is not set
> # CONFIG_ACCESSIBILITY is not set
> # CONFIG_NEW_LEDS is not set
> CONFIG_RTC_LIB=3Dy
> CONFIG_RTC_CLASS=3Dy
> CONFIG_RTC_HCTOSYS=3Dy
> CONFIG_RTC_HCTOSYS_DEVICE=3D"rtc0"
> # CONFIG_RTC_DEBUG is not set
>
> #
> # RTC interfaces
> #
> CONFIG_RTC_INTF_SYSFS=3Dy
> CONFIG_RTC_INTF_PROC=3Dy
> CONFIG_RTC_INTF_DEV=3Dy
> CONFIG_RTC_INTF_DEV_UIE_EMUL=3Dy
> # CONFIG_RTC_DRV_TEST is not set
>
> #
> # I2C RTC drivers
> #
> # CONFIG_RTC_DRV_DS1307 is not set
> # CONFIG_RTC_DRV_DS1374 is not set
> # CONFIG_RTC_DRV_DS1672 is not set
> # CONFIG_RTC_DRV_MAX6900 is not set
> # CONFIG_RTC_DRV_RS5C372 is not set
> # CONFIG_RTC_DRV_ISL1208 is not set
> # CONFIG_RTC_DRV_X1205 is not set
> # CONFIG_RTC_DRV_PCF8563 is not set
> # CONFIG_RTC_DRV_PCF8583 is not set
> # CONFIG_RTC_DRV_M41T80 is not set
> # CONFIG_RTC_DRV_S35390A is not set
> # CONFIG_RTC_DRV_FM3130 is not set
> # CONFIG_RTC_DRV_RX8581 is not set
>
> #
> # SPI RTC drivers
> #
> # CONFIG_RTC_DRV_M41T94 is not set
> # CONFIG_RTC_DRV_DS1305 is not set
> # CONFIG_RTC_DRV_DS1390 is not set
> # CONFIG_RTC_DRV_MAX6902 is not set
> # CONFIG_RTC_DRV_R9701 is not set
> # CONFIG_RTC_DRV_RS5C348 is not set
> # CONFIG_RTC_DRV_DS3234 is not set
>
> #
> # Platform RTC drivers
> #
> # CONFIG_RTC_DRV_CMOS is not set
> # CONFIG_RTC_DRV_DS1286 is not set
> # CONFIG_RTC_DRV_DS1511 is not set
> # CONFIG_RTC_DRV_DS1553 is not set
> # CONFIG_RTC_DRV_DS1742 is not set
> # CONFIG_RTC_DRV_STK17TA8 is not set
> # CONFIG_RTC_DRV_M48T86 is not set
> # CONFIG_RTC_DRV_M48T35 is not set
> # CONFIG_RTC_DRV_M48T59 is not set
> # CONFIG_RTC_DRV_BQ4802 is not set
> # CONFIG_RTC_DRV_V3020 is not set
>
> #
> # on-CPU RTC drivers
> #
> # CONFIG_RTC_MXC is not set
> # CONFIG_RTC_DRV_MXC_V2 is not set
> # CONFIG_RTC_DRV_IMXDI is not set
> CONFIG_RTC_MC13892=3Dy
> # CONFIG_DMADEVICES is not set
> CONFIG_REGULATOR=3Dy
> # CONFIG_REGULATOR_DEBUG is not set
> # CONFIG_REGULATOR_FIXED_VOLTAGE is not set
> # CONFIG_REGULATOR_VIRTUAL_CONSUMER is not set
> # CONFIG_REGULATOR_BQ24022 is not set
> CONFIG_REGULATOR_MC13892=3Dy
> CONFIG_UIO=3Dm
> CONFIG_UIO_PDRV=3Dm
> CONFIG_UIO_PDRV_GENIRQ=3Dm
> # CONFIG_UIO_SMX is not set
> # CONFIG_UIO_SERCOS3 is not set
>
> #
> # MXC support drivers
> #
> CONFIG_MXC_IPU=3Dy
> CONFIG_MXC_IPU_V3=3Dy
>
> #
> # MXC SSI support
> #
> # CONFIG_MXC_SSI is not set
>
> #
> # MXC Digital Audio Multiplexer support
> #
> # CONFIG_MXC_DAM is not set
>
> #
> # MXC PMIC support
> #
> CONFIG_MXC_PMIC=3Dy
> # CONFIG_MXC_PMIC_MC13783 is not set
> CONFIG_MXC_PMIC_MC13892=3Dy
> CONFIG_MXC_PMIC_I2C=3Dy
> CONFIG_MXC_PMIC_SPI=3Dy
> # CONFIG_MXC_PMIC_MC34704 is not set
> # CONFIG_MXC_PMIC_MC9SDZ60 is not set
> CONFIG_MXC_PMIC_CHARDEV=3Dy
>
> #
> # MXC PMIC Client Drivers
> #
> CONFIG_MXC_MC13892_ADC=3Dy
> CONFIG_MXC_MC13892_RTC=3Dy
> CONFIG_MXC_MC13892_LIGHT=3Dy
> CONFIG_MXC_MC13892_BATTERY=3Dy
> CONFIG_MXC_MC13892_CONNECTIVITY=3Dy
> CONFIG_MXC_MC13892_POWER=3Dy
> # CONFIG_MXC_PMIC_MC9S08DZ60 is not set
>
> #
> # MXC Security Drivers
> #
> # CONFIG_MXC_SECURITY_SCC is not set
> # CONFIG_MXC_SECURITY_SCC2 is not set
> # CONFIG_MXC_SECURITY_RNG is not set
>
> #
> # SAHARA2 Security Hardware Support
> #
> # CONFIG_MXC_SAHARA is not set
>
> #
> # MXC MPEG4 Encoder Kernel module support
> #
> # CONFIG_MXC_HMP4E is not set
>
> #
> # MXC HARDWARE EVENT
> #
> # CONFIG_MXC_HWEVENT is not set
>
> #
> # MXC VPU(Video Processing Unit) support
> #
> CONFIG_MXC_VPU=3Dy
> CONFIG_MXC_VPU_IRAM=3Dy
> # CONFIG_MXC_VPU_DEBUG is not set
>
> #
> # MXC Asynchronous Sample Rate Converter support
> #
>
> #
> # MXC Bluetooth support
> #
>
> #
> # Broadcom GPS ioctrl support
> #
>
> #
> # MXC Media Local Bus Driver
> #
>
> #
> # i.MX ADC support
> #
> # CONFIG_IMX_ADC is not set
>
> #
> # File systems
> #
> CONFIG_EXT2_FS=3Dy
> CONFIG_EXT2_FS_XATTR=3Dy
> CONFIG_EXT2_FS_POSIX_ACL=3Dy
> CONFIG_EXT2_FS_SECURITY=3Dy
> # CONFIG_EXT2_FS_XIP is not set
> CONFIG_EXT3_FS=3Dy
> CONFIG_EXT3_FS_XATTR=3Dy
> CONFIG_EXT3_FS_POSIX_ACL=3Dy
> CONFIG_EXT3_FS_SECURITY=3Dy
> # CONFIG_EXT4_FS is not set
> CONFIG_JBD=3Dy
> CONFIG_FS_MBCACHE=3Dy
> # CONFIG_REISERFS_FS is not set
> # CONFIG_JFS_FS is not set
> CONFIG_FS_POSIX_ACL=3Dy
> CONFIG_FILE_LOCKING=3Dy
> # CONFIG_XFS_FS is not set
> # CONFIG_OCFS2_FS is not set
> CONFIG_DNOTIFY=3Dy
> CONFIG_INOTIFY=3Dy
> CONFIG_INOTIFY_USER=3Dy
> # CONFIG_QUOTA is not set
> # CONFIG_AUTOFS_FS is not set
> CONFIG_AUTOFS4_FS=3Dy
> CONFIG_FUSE_FS=3Dm
> CONFIG_GENERIC_ACL=3Dy
>
> #
> # CD-ROM/DVD Filesystems
> #
> CONFIG_ISO9660_FS=3Dm
> CONFIG_JOLIET=3Dy
> CONFIG_ZISOFS=3Dy
> CONFIG_UDF_FS=3Dm
> CONFIG_UDF_NLS=3Dy
>
> #
> # DOS/FAT/NT Filesystems
> #
> CONFIG_FAT_FS=3Dy
> CONFIG_MSDOS_FS=3Dy
> CONFIG_VFAT_FS=3Dy
> CONFIG_FAT_DEFAULT_CODEPAGE=3D437
> CONFIG_FAT_DEFAULT_IOCHARSET=3D"iso8859-1"
> # CONFIG_NTFS_FS is not set
>
> #
> # Pseudo filesystems
> #
> CONFIG_PROC_FS=3Dy
> CONFIG_PROC_SYSCTL=3Dy
> CONFIG_PROC_PAGE_MONITOR=3Dy
> CONFIG_SYSFS=3Dy
> CONFIG_TMPFS=3Dy
> CONFIG_TMPFS_POSIX_ACL=3Dy
> # CONFIG_HUGETLB_PAGE is not set
> # CONFIG_CONFIGFS_FS is not set
>
> #
> # Miscellaneous filesystems
> #
> # CONFIG_ADFS_FS is not set
> # CONFIG_AFFS_FS is not set
> # CONFIG_HFS_FS is not set
> # CONFIG_HFSPLUS_FS is not set
> # CONFIG_BEFS_FS is not set
> # CONFIG_BFS_FS is not set
> # CONFIG_EFS_FS is not set
> CONFIG_JFFS2_FS=3Dy
> CONFIG_JFFS2_FS_DEBUG=3D0
> CONFIG_JFFS2_FS_WRITEBUFFER=3Dy
> # CONFIG_JFFS2_FS_WBUF_VERIFY is not set
> # CONFIG_JFFS2_SUMMARY is not set
> # CONFIG_JFFS2_FS_XATTR is not set
> # CONFIG_JFFS2_COMPRESSION_OPTIONS is not set
> CONFIG_JFFS2_ZLIB=3Dy
> # CONFIG_JFFS2_LZO is not set
> CONFIG_JFFS2_RTIME=3Dy
> # CONFIG_JFFS2_RUBIN is not set
> CONFIG_UBIFS_FS=3Dy
> # CONFIG_UBIFS_FS_XATTR is not set
> # CONFIG_UBIFS_FS_ADVANCED_COMPR is not set
> CONFIG_UBIFS_FS_LZO=3Dy
> CONFIG_UBIFS_FS_ZLIB=3Dy
> # CONFIG_UBIFS_FS_DEBUG is not set
> CONFIG_CRAMFS=3Dy
> # CONFIG_VXFS_FS is not set
> # CONFIG_MINIX_FS is not set
> # CONFIG_OMFS_FS is not set
> # CONFIG_HPFS_FS is not set
> # CONFIG_QNX4FS_FS is not set
> # CONFIG_ROMFS_FS is not set
> # CONFIG_SYSV_FS is not set
> # CONFIG_UFS_FS is not set
> CONFIG_NETWORK_FILESYSTEMS=3Dy
> CONFIG_NFS_FS=3Dy
> CONFIG_NFS_V3=3Dy
> # CONFIG_NFS_V3_ACL is not set
> # CONFIG_NFS_V4 is not set
> CONFIG_ROOT_NFS=3Dy
> # CONFIG_NFSD is not set
> CONFIG_LOCKD=3Dy
> CONFIG_LOCKD_V4=3Dy
> CONFIG_NFS_COMMON=3Dy
> CONFIG_SUNRPC=3Dy
> # CONFIG_SUNRPC_REGISTER_V4 is not set
> # CONFIG_RPCSEC_GSS_KRB5 is not set
> # CONFIG_RPCSEC_GSS_SPKM3 is not set
> # CONFIG_SMB_FS is not set
> # CONFIG_CIFS is not set
> # CONFIG_NCP_FS is not set
> # CONFIG_CODA_FS is not set
> # CONFIG_AFS_FS is not set
>
> #
> # Partition Types
> #
> # CONFIG_PARTITION_ADVANCED is not set
> CONFIG_MSDOS_PARTITION=3Dy
> CONFIG_NLS=3Dy
> CONFIG_NLS_DEFAULT=3D"iso8859-1"
> CONFIG_NLS_CODEPAGE_437=3Dy
> # CONFIG_NLS_CODEPAGE_737 is not set
> # CONFIG_NLS_CODEPAGE_775 is not set
> # CONFIG_NLS_CODEPAGE_850 is not set
> # CONFIG_NLS_CODEPAGE_852 is not set
> # CONFIG_NLS_CODEPAGE_855 is not set
> # CONFIG_NLS_CODEPAGE_857 is not set
> # CONFIG_NLS_CODEPAGE_860 is not set
> # CONFIG_NLS_CODEPAGE_861 is not set
> # CONFIG_NLS_CODEPAGE_862 is not set
> # CONFIG_NLS_CODEPAGE_863 is not set
> # CONFIG_NLS_CODEPAGE_864 is not set
> # CONFIG_NLS_CODEPAGE_865 is not set
> # CONFIG_NLS_CODEPAGE_866 is not set
> # CONFIG_NLS_CODEPAGE_869 is not set
> # CONFIG_NLS_CODEPAGE_936 is not set
> # CONFIG_NLS_CODEPAGE_950 is not set
> # CONFIG_NLS_CODEPAGE_932 is not set
> # CONFIG_NLS_CODEPAGE_949 is not set
> # CONFIG_NLS_CODEPAGE_874 is not set
> # CONFIG_NLS_ISO8859_8 is not set
> # CONFIG_NLS_CODEPAGE_1250 is not set
> # CONFIG_NLS_CODEPAGE_1251 is not set
> CONFIG_NLS_ASCII=3Dy
> CONFIG_NLS_ISO8859_1=3Dy
> # CONFIG_NLS_ISO8859_2 is not set
> # CONFIG_NLS_ISO8859_3 is not set
> # CONFIG_NLS_ISO8859_4 is not set
> # CONFIG_NLS_ISO8859_5 is not set
> # CONFIG_NLS_ISO8859_6 is not set
> # CONFIG_NLS_ISO8859_7 is not set
> # CONFIG_NLS_ISO8859_9 is not set
> # CONFIG_NLS_ISO8859_13 is not set
> # CONFIG_NLS_ISO8859_14 is not set
> # CONFIG_NLS_ISO8859_15 is not set
> # CONFIG_NLS_KOI8_R is not set
> # CONFIG_NLS_KOI8_U is not set
> CONFIG_NLS_UTF8=3Dy
> # CONFIG_DLM is not set
>
> #
> # Kernel hacking
> #
> # CONFIG_PRINTK_TIME is not set
> CONFIG_ENABLE_WARN_DEPRECATED=3Dy
> CONFIG_ENABLE_MUST_CHECK=3Dy
> CONFIG_FRAME_WARN=3D1024
> # CONFIG_MAGIC_SYSRQ is not set
> # CONFIG_UNUSED_SYMBOLS is not set
> # CONFIG_DEBUG_FS is not set
> # CONFIG_HEADERS_CHECK is not set
> # CONFIG_DEBUG_KERNEL is not set
> # CONFIG_SLUB_DEBUG_ON is not set
> # CONFIG_SLUB_STATS is not set
> # CONFIG_DEBUG_BUGVERBOSE is not set
> # CONFIG_DEBUG_MEMORY_INIT is not set
> CONFIG_FRAME_POINTER=3Dy
> # CONFIG_RCU_CPU_STALL_DETECTOR is not set
> # CONFIG_LATENCYTOP is not set
> CONFIG_SYSCTL_SYSCALL_CHECK=3Dy
> CONFIG_HAVE_FUNCTION_TRACER=3Dy
>
> #
> # Tracers
> #
> # CONFIG_DYNAMIC_PRINTK_DEBUG is not set
> # CONFIG_SAMPLES is not set
> CONFIG_HAVE_ARCH_KGDB=3Dy
> # CONFIG_DEBUG_USER is not set
>
> #
> # Security options
> #
> # CONFIG_KEYS is not set
> # CONFIG_SECURITY is not set
> # CONFIG_SECURITYFS is not set
> # CONFIG_SECURITY_FILE_CAPABILITIES is not set
> CONFIG_CRYPTO=3Dy
>
> #
> # Crypto core or helper
> #
> # CONFIG_CRYPTO_FIPS is not set
> CONFIG_CRYPTO_ALGAPI=3Dy
> CONFIG_CRYPTO_ALGAPI2=3Dy
> CONFIG_CRYPTO_AEAD2=3Dy
> CONFIG_CRYPTO_BLKCIPHER=3Dm
> CONFIG_CRYPTO_BLKCIPHER2=3Dy
> CONFIG_CRYPTO_HASH2=3Dy
> CONFIG_CRYPTO_RNG2=3Dy
> CONFIG_CRYPTO_MANAGER=3Dm
> CONFIG_CRYPTO_MANAGER2=3Dy
> # CONFIG_CRYPTO_GF128MUL is not set
> # CONFIG_CRYPTO_NULL is not set
> # CONFIG_CRYPTO_CRYPTD is not set
> # CONFIG_CRYPTO_AUTHENC is not set
> # CONFIG_CRYPTO_TEST is not set
> # CONFIG_CRYPTO_CRYPTODEV is not set
>
> #
> # Authenticated Encryption with Associated Data
> #
> # CONFIG_CRYPTO_CCM is not set
> # CONFIG_CRYPTO_GCM is not set
> # CONFIG_CRYPTO_SEQIV is not set
>
> #
> # Block modes
> #
> # CONFIG_CRYPTO_CBC is not set
> # CONFIG_CRYPTO_CTR is not set
> # CONFIG_CRYPTO_CTS is not set
> CONFIG_CRYPTO_ECB=3Dm
> # CONFIG_CRYPTO_LRW is not set
> # CONFIG_CRYPTO_PCBC is not set
> # CONFIG_CRYPTO_XTS is not set
>
> #
> # Hash modes
> #
> # CONFIG_CRYPTO_HMAC is not set
> # CONFIG_CRYPTO_XCBC is not set
>
> #
> # Digest
> #
> # CONFIG_CRYPTO_CRC32C is not set
> # CONFIG_CRYPTO_MD4 is not set
> # CONFIG_CRYPTO_MD5 is not set
> CONFIG_CRYPTO_MICHAEL_MIC=3Dm
> # CONFIG_CRYPTO_RMD128 is not set
> # CONFIG_CRYPTO_RMD160 is not set
> # CONFIG_CRYPTO_RMD256 is not set
> # CONFIG_CRYPTO_RMD320 is not set
> CONFIG_CRYPTO_SHA1=3Dm
> # CONFIG_CRYPTO_SHA256 is not set
> # CONFIG_CRYPTO_SHA512 is not set
> # CONFIG_CRYPTO_TGR192 is not set
> # CONFIG_CRYPTO_WP512 is not set
>
> #
> # Ciphers
> #
> CONFIG_CRYPTO_AES=3Dm
> # CONFIG_CRYPTO_ANUBIS is not set
> CONFIG_CRYPTO_ARC4=3Dm
> # CONFIG_CRYPTO_BLOWFISH is not set
> # CONFIG_CRYPTO_CAMELLIA is not set
> # CONFIG_CRYPTO_CAST5 is not set
> # CONFIG_CRYPTO_CAST6 is not set
> # CONFIG_CRYPTO_DES is not set
> # CONFIG_CRYPTO_FCRYPT is not set
> # CONFIG_CRYPTO_KHAZAD is not set
> # CONFIG_CRYPTO_SALSA20 is not set
> # CONFIG_CRYPTO_SEED is not set
> # CONFIG_CRYPTO_SERPENT is not set
> # CONFIG_CRYPTO_TEA is not set
> # CONFIG_CRYPTO_TWOFISH is not set
>
> #
> # Compression
> #
> CONFIG_CRYPTO_DEFLATE=3Dy
> CONFIG_CRYPTO_LZO=3Dy
>
> #
> # Random Number Generation
> #
> # CONFIG_CRYPTO_ANSI_CPRNG is not set
> CONFIG_CRYPTO_HW=3Dy
>
> #
> # Library routines
> #
> CONFIG_BITREVERSE=3Dy
> CONFIG_CRC_CCITT=3Dy
> CONFIG_CRC16=3Dy
> # CONFIG_CRC_T10DIF is not set
> CONFIG_CRC_ITU_T=3Dm
> CONFIG_CRC32=3Dy
> # CONFIG_CRC7 is not set
> # CONFIG_LIBCRC32C is not set
> CONFIG_ZLIB_INFLATE=3Dy
> CONFIG_ZLIB_DEFLATE=3Dy
> CONFIG_LZO_COMPRESS=3Dy
> CONFIG_LZO_DECOMPRESS=3Dy
> CONFIG_PLIST=3Dy
> CONFIG_HAS_IOMEM=3Dy
> CONFIG_HAS_IOPORT=3Dy
> CONFIG_HAS_DMA=3Dy
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>


