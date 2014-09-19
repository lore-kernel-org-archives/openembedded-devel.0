Return-Path: <Pengyu.Ma@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 794BD6FE3B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Sep 2014 10:38:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s8JAc6j7019688
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Sep 2014 03:38:06 -0700 (PDT)
Received: from pek-bsp-build1.wrs.com (128.224.179.105) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.174.1; Fri, 19 Sep 2014 03:38:05 -0700
From: Pengyu Ma <pengyu.ma@windriver.com>
To: <pengyu.ma@windriver.com>, <Bruce.Ashfield@windriver.com>,
	<openembedded-devel@lists.openembedded.org>
Date: Fri, 19 Sep 2014 18:33:36 +0800
Message-ID: <1411122818-121055-2-git-send-email-pengyu.ma@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <1411122818-121055-1-git-send-email-pengyu.ma@windriver.com>
References: <1411122818-121055-1-git-send-email-pengyu.ma@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/3] intel-x86: add metadata for intel-x86 BSP
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 19 Sep 2014 10:38:10 -0000
Content-Type: text/plain

Signed-off-by: Pengyu Ma <pengyu.ma@windriver.com>
---
 meta/cfg/kernel-cache/arch/x86/x86.cfg             |  11 +
 meta/cfg/kernel-cache/arch/x86/x86.scc             |   5 +
 meta/cfg/kernel-cache/arch/x86_64/x86_64.cfg       |   7 +
 meta/cfg/kernel-cache/arch/x86_64/x86_64.scc       |   5 +
 .../bsp/intel-x86/intel-x86-32-preempt-rt.scc      |  10 +
 .../bsp/intel-x86/intel-x86-32-standard.scc        |   8 +
 .../kernel-cache/bsp/intel-x86/intel-x86-32.cfg    |  24 ++
 .../kernel-cache/bsp/intel-x86/intel-x86-32.scc    |   6 +
 .../bsp/intel-x86/intel-x86-64-preempt-rt.scc      |   9 +
 .../bsp/intel-x86/intel-x86-64-standard.scc        |   7 +
 .../kernel-cache/bsp/intel-x86/intel-x86-64.scc    |   7 +
 .../kernel-cache/bsp/intel-x86/intel-x86-acpi.cfg  |  17 +
 .../bsp/intel-x86/intel-x86-igb-overrides.cfg      |   1 +
 .../bsp/intel-x86/intel-x86-ixgbe-overrides.cfg    |   1 +
 .../kernel-cache/bsp/intel-x86/intel-x86-mga.cfg   |   3 +
 .../bsp/intel-x86/intel-x86-tigon3.cfg             |   2 +
 meta/cfg/kernel-cache/bsp/intel-x86/intel-x86.cfg  | 366 +++++++++++++++++++++
 meta/cfg/kernel-cache/bsp/intel-x86/intel-x86.scc  |  37 +++
 18 files changed, 526 insertions(+)
 create mode 100644 meta/cfg/kernel-cache/arch/x86/x86.cfg
 create mode 100644 meta/cfg/kernel-cache/arch/x86/x86.scc
 create mode 100644 meta/cfg/kernel-cache/arch/x86_64/x86_64.cfg
 create mode 100644 meta/cfg/kernel-cache/arch/x86_64/x86_64.scc
 create mode 100644 meta/cfg/kernel-cache/bsp/intel-x86/intel-x86-32-preempt-rt.scc
 create mode 100644 meta/cfg/kernel-cache/bsp/intel-x86/intel-x86-32-standard.scc
 create mode 100644 meta/cfg/kernel-cache/bsp/intel-x86/intel-x86-32.cfg
 create mode 100644 meta/cfg/kernel-cache/bsp/intel-x86/intel-x86-32.scc
 create mode 100644 meta/cfg/kernel-cache/bsp/intel-x86/intel-x86-64-preempt-rt.scc
 create mode 100644 meta/cfg/kernel-cache/bsp/intel-x86/intel-x86-64-standard.scc
 create mode 100644 meta/cfg/kernel-cache/bsp/intel-x86/intel-x86-64.scc
 create mode 100644 meta/cfg/kernel-cache/bsp/intel-x86/intel-x86-acpi.cfg
 create mode 100644 meta/cfg/kernel-cache/bsp/intel-x86/intel-x86-igb-overrides.cfg
 create mode 100644 meta/cfg/kernel-cache/bsp/intel-x86/intel-x86-ixgbe-overrides.cfg
 create mode 100644 meta/cfg/kernel-cache/bsp/intel-x86/intel-x86-mga.cfg
 create mode 100644 meta/cfg/kernel-cache/bsp/intel-x86/intel-x86-tigon3.cfg
 create mode 100644 meta/cfg/kernel-cache/bsp/intel-x86/intel-x86.cfg
 create mode 100644 meta/cfg/kernel-cache/bsp/intel-x86/intel-x86.scc

diff --git a/meta/cfg/kernel-cache/arch/x86/x86.cfg b/meta/cfg/kernel-cache/arch/x86/x86.cfg
new file mode 100644
index 0000000..473d399
--- /dev/null
+++ b/meta/cfg/kernel-cache/arch/x86/x86.cfg
@@ -0,0 +1,11 @@
+# Config settings specific to x86 and not in an existing cfg/foo.cfg
+CONFIG_X86_REROUTE_FOR_BROKEN_BOOT_IRQS=y
+CONFIG_X86_REBOOTFIXUPS=y
+CONFIG_MICROCODE_AMD=y
+CONFIG_HIGHPTE=y
+CONFIG_X86_CHECK_BIOS_CORRUPTION=y
+CONFIG_X86_BOOTPARAM_MEMORY_CORRUPTION_CHECK=y
+# CONFIG_MTRR_SANITIZER is not set
+CONFIG_HOTPLUG_PCI=y
+# CONFIG_HOTPLUG_PCI_PCIE is not set
+CONFIG_PCI_MSI=y
diff --git a/meta/cfg/kernel-cache/arch/x86/x86.scc b/meta/cfg/kernel-cache/arch/x86/x86.scc
new file mode 100644
index 0000000..4f6ede6
--- /dev/null
+++ b/meta/cfg/kernel-cache/arch/x86/x86.scc
@@ -0,0 +1,5 @@
+include cfg/efi.scc
+include cfg/smp.scc
+include cfg/timer/hpet.scc
+include cfg/timer/hz_1000.scc
+kconf hardware x86.cfg
diff --git a/meta/cfg/kernel-cache/arch/x86_64/x86_64.cfg b/meta/cfg/kernel-cache/arch/x86_64/x86_64.cfg
new file mode 100644
index 0000000..2050c22
--- /dev/null
+++ b/meta/cfg/kernel-cache/arch/x86_64/x86_64.cfg
@@ -0,0 +1,7 @@
+# Config settings specific to x86_64 and not in an existing cfg/foo.cfg
+CONFIG_X86_CHECK_BIOS_CORRUPTION=y
+CONFIG_X86_BOOTPARAM_MEMORY_CORRUPTION_CHECK=y
+# CONFIG_MTRR_SANITIZER is not set
+CONFIG_HOTPLUG_PCI=y
+# CONFIG_HOTPLUG_PCI_PCIE is not set
+CONFIG_PCI_MSI=y
diff --git a/meta/cfg/kernel-cache/arch/x86_64/x86_64.scc b/meta/cfg/kernel-cache/arch/x86_64/x86_64.scc
new file mode 100644
index 0000000..e003075
--- /dev/null
+++ b/meta/cfg/kernel-cache/arch/x86_64/x86_64.scc
@@ -0,0 +1,5 @@
+include cfg/efi.scc
+include cfg/smp.scc
+include cfg/timer/hpet.scc
+include cfg/timer/hz_1000.scc
+kconf hardware x86_64.cfg
diff --git a/meta/cfg/kernel-cache/bsp/intel-x86/intel-x86-32-preempt-rt.scc b/meta/cfg/kernel-cache/bsp/intel-x86/intel-x86-32-preempt-rt.scc
new file mode 100644
index 0000000..e1a1b3b
--- /dev/null
+++ b/meta/cfg/kernel-cache/bsp/intel-x86/intel-x86-32-preempt-rt.scc
@@ -0,0 +1,10 @@
+define KMACHINE intel-x86-32
+define KTYPE preempt-rt
+define KARCH x86
+
+include ktypes/preempt-rt
+branch intel-x86-32
+
+include intel-x86-32.scc
+
+patch pinctrl-Fix-the-bug-of-calltrace-on-preempt-rt-kerne.patch
diff --git a/meta/cfg/kernel-cache/bsp/intel-x86/intel-x86-32-standard.scc b/meta/cfg/kernel-cache/bsp/intel-x86/intel-x86-32-standard.scc
new file mode 100644
index 0000000..5d87c54
--- /dev/null
+++ b/meta/cfg/kernel-cache/bsp/intel-x86/intel-x86-32-standard.scc
@@ -0,0 +1,8 @@
+define KMACHINE intel-x86-32
+define KTYPE standard
+define KARCH x86
+
+include ktypes/standard
+branch intel-x86-32
+
+include intel-x86-32.scc
diff --git a/meta/cfg/kernel-cache/bsp/intel-x86/intel-x86-32.cfg b/meta/cfg/kernel-cache/bsp/intel-x86/intel-x86-32.cfg
new file mode 100644
index 0000000..0d2b248
--- /dev/null
+++ b/meta/cfg/kernel-cache/bsp/intel-x86/intel-x86-32.cfg
@@ -0,0 +1,24 @@
+#.........................................................................
+#                                WARNING
+#
+# This file is a kernel configuration fragment, and not a full kernel
+# configuration file.  The final kernel configuration is made up of
+# an assembly of processed fragments, each of which is designed to
+# capture a specific part of the final configuration (e.g. platform
+# configuration, feature configuration, and board specific hardware
+# configuration).  For more information on kernel configuration, please
+# consult the product documentation.
+#
+#.........................................................................
+
+# Switch back to x86-32 from x86-64
+CONFIG_X86_32=y
+# CONFIG_64BIT is not set
+# CONFIG_X86_64 is not set
+
+#
+# Processor type and features
+#
+CONFIG_X86_BIGSMP=y
+CONFIG_X86_GENERIC=y
+CONFIG_HIGHMEM64G=y
diff --git a/meta/cfg/kernel-cache/bsp/intel-x86/intel-x86-32.scc b/meta/cfg/kernel-cache/bsp/intel-x86/intel-x86-32.scc
new file mode 100644
index 0000000..6dc95d5
--- /dev/null
+++ b/meta/cfg/kernel-cache/bsp/intel-x86/intel-x86-32.scc
@@ -0,0 +1,6 @@
+# Core configuration settings for x86-32
+include arch/x86/x86.scc nopatch
+
+include intel-x86.scc
+
+kconf hardware intel-x86-32.cfg
diff --git a/meta/cfg/kernel-cache/bsp/intel-x86/intel-x86-64-preempt-rt.scc b/meta/cfg/kernel-cache/bsp/intel-x86/intel-x86-64-preempt-rt.scc
new file mode 100644
index 0000000..d08b7c9
--- /dev/null
+++ b/meta/cfg/kernel-cache/bsp/intel-x86/intel-x86-64-preempt-rt.scc
@@ -0,0 +1,9 @@
+define KMACHINE intel-x86-64
+define KTYPE preempt-rt
+define KARCH x86
+
+include ktypes/preempt-rt
+
+include intel-x86-64.scc
+
+patch pinctrl-Fix-the-bug-of-calltrace-on-preempt-rt-kerne.patch
diff --git a/meta/cfg/kernel-cache/bsp/intel-x86/intel-x86-64-standard.scc b/meta/cfg/kernel-cache/bsp/intel-x86/intel-x86-64-standard.scc
new file mode 100644
index 0000000..91c4b86
--- /dev/null
+++ b/meta/cfg/kernel-cache/bsp/intel-x86/intel-x86-64-standard.scc
@@ -0,0 +1,7 @@
+define KMACHINE intel-x86-64
+define KTYPE standard
+define KARCH x86
+
+include ktypes/standard
+
+include intel-x86-64.scc
diff --git a/meta/cfg/kernel-cache/bsp/intel-x86/intel-x86-64.scc b/meta/cfg/kernel-cache/bsp/intel-x86/intel-x86-64.scc
new file mode 100644
index 0000000..6acdceb
--- /dev/null
+++ b/meta/cfg/kernel-cache/bsp/intel-x86/intel-x86-64.scc
@@ -0,0 +1,7 @@
+branch intel-x86-64
+
+# Core configuration settings for x86_64
+include arch/x86_64/x86_64.scc nopatch
+
+
+include intel-x86.scc
diff --git a/meta/cfg/kernel-cache/bsp/intel-x86/intel-x86-acpi.cfg b/meta/cfg/kernel-cache/bsp/intel-x86/intel-x86-acpi.cfg
new file mode 100644
index 0000000..1c6a6ef
--- /dev/null
+++ b/meta/cfg/kernel-cache/bsp/intel-x86/intel-x86-acpi.cfg
@@ -0,0 +1,17 @@
+CONFIG_ACPI=y
+CONFIG_ACPI_PROCFS=y
+CONFIG_ACPI_PROCFS_POWER=y
+CONFIG_ACPI_EC_DEBUGFS=m
+CONFIG_ACPI_AC=m
+CONFIG_ACPI_BATTERY=m
+CONFIG_ACPI_FAN=m
+CONFIG_ACPI_PROCESSOR=y
+CONFIG_ACPI_THERMAL=m
+CONFIG_ACPI_CONTAINER=m
+CONFIG_ACPI_PROCESSOR_AGGREGATOR=m
+CONFIG_ACPI_PCI_SLOT=m
+CONFIG_ACPI_SBS=m
+CONFIG_ACPI_HED=y
+CONFIG_ACPI_CUSTOM_METHOD=m
+CONFIG_ACPI_BGRT=y
+CONFIG_ACPI_IPMI=m
diff --git a/meta/cfg/kernel-cache/bsp/intel-x86/intel-x86-igb-overrides.cfg b/meta/cfg/kernel-cache/bsp/intel-x86/intel-x86-igb-overrides.cfg
new file mode 100644
index 0000000..9d5329a
--- /dev/null
+++ b/meta/cfg/kernel-cache/bsp/intel-x86/intel-x86-igb-overrides.cfg
@@ -0,0 +1 @@
+CONFIG_IGB=y
diff --git a/meta/cfg/kernel-cache/bsp/intel-x86/intel-x86-ixgbe-overrides.cfg b/meta/cfg/kernel-cache/bsp/intel-x86/intel-x86-ixgbe-overrides.cfg
new file mode 100644
index 0000000..334437b
--- /dev/null
+++ b/meta/cfg/kernel-cache/bsp/intel-x86/intel-x86-ixgbe-overrides.cfg
@@ -0,0 +1 @@
+CONFIG_IXGBE=y
diff --git a/meta/cfg/kernel-cache/bsp/intel-x86/intel-x86-mga.cfg b/meta/cfg/kernel-cache/bsp/intel-x86/intel-x86-mga.cfg
new file mode 100644
index 0000000..5fd014c
--- /dev/null
+++ b/meta/cfg/kernel-cache/bsp/intel-x86/intel-x86-mga.cfg
@@ -0,0 +1,3 @@
+# for add-in MGA PCIe graphics card.
+CONFIG_FB_MATROX=m
+CONFIG_FB_MATROX_G=y
diff --git a/meta/cfg/kernel-cache/bsp/intel-x86/intel-x86-tigon3.cfg b/meta/cfg/kernel-cache/bsp/intel-x86/intel-x86-tigon3.cfg
new file mode 100644
index 0000000..327ce6a
--- /dev/null
+++ b/meta/cfg/kernel-cache/bsp/intel-x86/intel-x86-tigon3.cfg
@@ -0,0 +1,2 @@
+# for Broadcom Tigon3 network device
+CONFIG_TIGON3=y
diff --git a/meta/cfg/kernel-cache/bsp/intel-x86/intel-x86.cfg b/meta/cfg/kernel-cache/bsp/intel-x86/intel-x86.cfg
new file mode 100644
index 0000000..6d389ad
--- /dev/null
+++ b/meta/cfg/kernel-cache/bsp/intel-x86/intel-x86.cfg
@@ -0,0 +1,366 @@
+#.........................................................................
+#                                WARNING
+#
+# This file is a kernel configuration fragment, and not a full kernel
+# configuration file.  The final kernel configuration is made up of
+# an assembly of processed fragments, each of which is designed to
+# capture a specific part of the final configuration (e.g. platform
+# configuration, feature configuration, and board specific hardware
+# configuration).  For more information on kernel configuration, please
+# consult the product documentation.
+#
+#.........................................................................
+
+CONFIG_64BIT=y
+CONFIG_X86=y
+
+#
+# Processor type and features
+#
+CONFIG_MCORE2=y
+CONFIG_SMP=y
+CONFIG_SCHED_SMT=y
+CONFIG_NR_CPUS=256
+
+CONFIG_NUMA=y
+CONFIG_ACPI_NUMA=y
+CONFIG_X86_64_ACPI_NUMA=y
+CONFIG_NODES_SHIFT=2
+
+CONFIG_MICROCODE=y
+CONFIG_X86_MSR=y
+CONFIG_X86_CPUID=y
+CONFIG_PROCESSOR_SELECT=y
+CONFIG_CPU_SUP_INTEL=y
+CONFIG_X86_EXTENDED_PLATFORM=y
+CONFIG_KSM=y
+CONFIG_TRANSPARENT_HUGEPAGE=y
+CONFIG_TRANSPARENT_HUGEPAGE_ALWAYS=y
+CONFIG_CLEANCACHE=y
+CONFIG_X86_CHECK_BIOS_CORRUPTION=y
+CONFIG_X86_BOOTPARAM_MEMORY_CORRUPTION_CHECK=y
+
+CONFIG_X86_MCE=y
+CONFIG_X86_MCE_INTEL=y
+
+CONFIG_X86_INTEL_LPSS=y
+CONFIG_BYT_LPSS_BRD=y
+#
+# I2C options
+#
+CONFIG_I2C_DESIGNWARE_CORE=y
+CONFIG_I2C_DESIGNWARE_PLATFORM=y
+CONFIG_I2C_DESIGNWARE_PCI=y
+CONFIG_I2C_EG20T=m
+CONFIG_I2C_INTEL_MID=m
+
+#
+# PC SMBus host controller drivers
+#
+CONFIG_I2C_I801=m
+CONFIG_I2C_ISCH=m
+CONFIG_I2C_ISMT=m
+
+#
+# Power management and ACPI options
+#
+CONFIG_PM=y
+CONFIG_PM_RUNTIME=y
+
+CONFIG_HIBERNATION=y
+
+#
+# Multifunction device drivers
+#
+CONFIG_MFD_CORE=y
+CONFIG_LPC_ICH=m
+CONFIG_LPC_SCH=m
+
+#
+# GPIO drivers
+#
+CONFIG_GPIOLIB=y
+CONFIG_GPIO_SYSFS=y
+CONFIG_GPIO_SCH=m
+CONFIG_GPIO_ICH=m
+CONFIG_GPIO_LYNXPOINT=y
+CONFIG_GPIO_PCH=m
+
+#
+#PINCTRL drivers
+#
+CONFIG_PINCTRL=y
+CONFIG_PINCTRL_BAYTRAIL=y
+
+#
+# Memory power savings
+#
+CONFIG_I7300_IDLE=m
+
+#
+# x86 CPU frequency scaling drivers
+#
+CONFIG_X86_PCC_CPUFREQ=m
+CONFIG_X86_ACPI_CPUFREQ=m
+CONFIG_CPU_FREQ_GOV_POWERSAVE=m
+
+#
+# Bus options (PCI etc.)
+#
+CONFIG_PCI=y
+CONFIG_PCI_MMCONFIG=y
+CONFIG_PCI_MSI=y
+CONFIG_PCI_REALLOC_ENABLE_AUTO=y
+
+CONFIG_HOTPLUG_PCI=m
+CONFIG_HOTPLUG_PCI_ACPI=m
+
+CONFIG_PCIEPORTBUS=y
+CONFIG_PCIEASPM=y
+CONFIG_PCIEASPM_DEFAULT=y
+
+CONFIG_PCI_STUB=m
+CONFIG_PCI_IOV=y
+CONFIG_PCI_PRI=y
+CONFIG_PCI_PASID=y
+CONFIG_HOTPLUG_PCI_PCIE=m
+
+#
+# Executable file formats / Emulations
+#
+CONFIG_IA32_EMULATION=y
+CONFIG_X86_X32=y
+
+#
+#SD/MMC
+#
+CONFIG_MMC=y
+CONFIG_MMC_BLOCK=y
+CONFIG_MMC_BLOCK_MINORS=8
+CONFIG_MMC_BLOCK_BOUNCE=y
+CONFIG_MMC_SDHCI=y
+CONFIG_MMC_SDHCI_PCI=y
+CONFIG_MMC_SDHCI_PLTFM=y
+
+#
+# Serial ATA and Parallel ATA drivers
+#
+CONFIG_ATA=y
+CONFIG_ATA_PIIX=y
+CONFIG_ATA_GENERIC=m
+CONFIG_SATA_AHCI=y
+CONFIG_SATA_AHCI_PLATFORM=y
+
+#
+# SCSI Transports
+#
+CONFIG_SCSI_SPI_ATTRS=y
+CONFIG_SCSI_SAS_ATTRS=y
+CONFIG_SCSI_SAS_LIBSAS=y
+CONFIG_SCSI_SAS_ATA=y
+CONFIG_SCSI_SAS_HOST_SMP=y
+CONFIG_SCSI_ISCI=y
+CONFIG_SCSI_MPT2SAS=y
+
+#
+# EEPROM support
+#
+CONFIG_EEPROM_LEGACY=m
+
+#
+# Intel Wireless WiFi Next Gen AGN
+#
+CONFIG_IWLWIFI_DEBUG=y
+CONFIG_IWLWIFI_DEBUG_EXPERIMENTAL_UCODE=y
+CONFIG_IWLWIFI_P2P=y
+CONFIG_IWLDVM=m
+CONFIG_IWLMVM=m
+
+#
+# Intel devices
+#
+CONFIG_IXGB=y
+
+#
+# nvram support
+#
+CONFIG_NVRAM=m
+
+#
+# Multiple devices driver support
+#
+CONFIG_MD_RAID456=y
+CONFIG_MULTICORE_RAID456=y
+
+#
+# Hardware Monitoring support
+#
+CONFIG_HWMON=m
+CONFIG_SENSORS_ACPI_POWER=m
+CONFIG_SENSORS_CORETEMP=m
+
+#
+# Watchdog Device Drivers
+#
+CONFIG_I6300ESB_WDT=m
+CONFIG_IE6XX_WDT=m
+CONFIG_ITCO_WDT=m
+CONFIG_ITCO_VENDOR_SUPPORT=y
+
+#
+# Input device support
+#
+CONFIG_INPUT_MISC=y
+CONFIG_INPUT_PCSPKR=y
+CONFIG_INPUT_ATLAS_BTNS=y
+CONFIG_INPUT_MOUSE=y
+CONFIG_INPUT_EVDEV=y
+
+CONFIG_MOUSE_PS2=y
+
+#
+# PC SMBus host controller drivers
+#
+CONFIG_I2C=y
+CONFIG_I2C_CHARDEV=m
+CONFIG_I2C_I801=y
+
+#
+# Sound card support
+#
+CONFIG_SOUND=m
+CONFIG_SND=m
+CONFIG_SND_TIMER=m
+CONFIG_SND_PCM=m
+CONFIG_SND_HWDEP=m
+CONFIG_SND_JACK=y
+CONFIG_SND_DYNAMIC_MINORS=y
+CONFIG_SND_SUPPORT_OLD_API=y
+CONFIG_SND_VERBOSE_PROCFS=y
+CONFIG_SND_VMASTER=y
+CONFIG_SND_KCTL_JACK=y
+CONFIG_SND_DMA_SGBUF=y
+CONFIG_SND_PCI=y
+CONFIG_SND_HDA_INTEL=m
+CONFIG_SND_HDA_PREALLOC_SIZE=64
+CONFIG_SND_HDA_HWDEP=y
+CONFIG_SND_HDA_RECONFIG=y
+CONFIG_SND_HDA_INPUT_BEEP=y
+CONFIG_SND_HDA_INPUT_BEEP_MODE=1
+CONFIG_SND_HDA_INPUT_JACK=y
+CONFIG_SND_HDA_PATCH_LOADER=y
+CONFIG_SND_HDA_CODEC_REALTEK=y
+CONFIG_SND_HDA_ENABLE_REALTEK_QUIRKS=y
+CONFIG_SND_HDA_CODEC_ANALOG=y
+CONFIG_SND_HDA_CODEC_SIGMATEL=y
+CONFIG_SND_HDA_CODEC_VIA=y
+CONFIG_SND_HDA_CODEC_HDMI=y
+CONFIG_SND_HDA_CODEC_CIRRUS=y
+CONFIG_SND_HDA_CODEC_CONEXANT=y
+CONFIG_SND_HDA_CODEC_CA0110=y
+CONFIG_SND_HDA_CODEC_CA0132=y
+CONFIG_SND_HDA_CODEC_CMEDIA=y
+CONFIG_SND_HDA_CODEC_SI3054=y
+CONFIG_SND_HDA_GENERIC=y
+CONFIG_SND_HDA_POWER_SAVE=y
+CONFIG_SND_HDA_POWER_SAVE_DEFAULT=0
+
+#
+# USB Serial Converter support
+#
+CONFIG_USB_SERIAL=y
+CONFIG_USB_SERIAL_CONSOLE=y
+CONFIG_USB_SERIAL_PL2303=m
+CONFIG_USB_SERIAL_FTDI_SIO=m
+CONFIG_USB_SERIAL_CP210X=m
+CONFIG_USB_SERIAL_GENERIC=y
+
+#
+# Real Time Clock
+#
+CONFIG_RTC_CLASS=y
+CONFIG_RTC_DRV_CMOS=y
+CONFIG_RTC_INTF_DEV_UIE_EMUL=y
+
+#
+# DMA Engine support
+#
+CONFIG_NET_DMA=y
+CONFIG_ASYNC_TX_DMA=y
+CONFIG_DW_DMAC=y
+CONFIG_DW_DMAC_CORE=y
+CONFIG_DW_DMAC_PCI=y
+# CONFIG_INTEL_IOATDMA is not set
+
+#
+# X86 Platform Specific Device Drivers
+#
+CONFIG_INTEL_IPS=m
+
+#
+# Firmware Drivers
+#
+CONFIG_DMI_SYSFS=m
+
+#
+# Library routines
+#
+CONFIG_CRC_T10DIF=m
+
+#
+# Digest
+#
+CONFIG_CRYPTO_CRCT10DIF=m
+CONFIG_CRYPTO_CRCT10DIF_PCLMUL=m
+
+#
+# Ciphers
+#
+CONFIG_CRYPTO_AES_X86_64=m
+CONFIG_CRYPTO_AES_NI_INTEL=m
+CONFIG_CRYPTO_SHA1_SSSE3=m
+CONFIG_CRYPTO_SHA256_SSSE3=m
+CONFIG_CRYPTO_SHA512_SSSE3=m
+
+#
+# HID
+#
+CONFIG_HID=y
+CONFIG_I2C_HID=y
+CONFIG_HID_SENSOR_HUB=y
+
+#
+# Serial
+#
+CONFIG_SERIAL_8250_DW=y
+
+#
+#SPI
+#
+CONFIG_SPI_PXA2XX=y
+CONFIG_SPI_PXA2XX_PCI=y
+CONFIG_SPI_PXA2XX_DMA=y
+
+CONFIG_VT_HW_CONSOLE_BINDING=y
+
+# Bluetooth device drivers
+CONFIG_BT_HCIBTUSB=y
+
+# PWM Support
+CONFIG_PWM=y
+CONFIG_PWM_SYSFS=y
+CONFIG_PWM_LPSS=y
+CONFIG_PWM_LPSS_PCI=y
+
+# Realtek Network Driver
+CONFIG_R8169=y
+CONFIG_ASPM=y
+CONFIG_R8168=y
+
+# USB OTG
+CONFIG_USB_DWC3=m
+CONFIG_USB_DWC3_PCI=m
+CONFIG_USB_DWC3_DUAL_ROLE=y
+
+# NVMe support
+CONFIG_BLK_DEV_NVME=m
diff --git a/meta/cfg/kernel-cache/bsp/intel-x86/intel-x86.scc b/meta/cfg/kernel-cache/bsp/intel-x86/intel-x86.scc
new file mode 100644
index 0000000..1ae4592
--- /dev/null
+++ b/meta/cfg/kernel-cache/bsp/intel-x86/intel-x86.scc
@@ -0,0 +1,37 @@
+# Shared components for both x86_32 and x86_64
+
+include cfg/vesafb.scc
+include cfg/usb-mass-storage.scc
+include cfg/8250.scc
+include cfg/sound.scc
+include cfg/efi-ext.scc
+include cfg/boot-live.scc
+
+include features/netfilter/netfilter.scc
+include features/profiling/profiling.scc
+include features/hugetlb/hugetlb.scc
+include features/power/intel.scc
+include features/scsi/cdrom.scc
+include features/i915/i915.scc
+include features/intel-e1xxxx/intel-e1xxxx.scc
+include features/igb/igb.scc
+include features/ixgbe/ixgbe.scc
+include features/i40e/i40e.scc
+include features/iwlwifi/iwlwifi.scc
+include features/usb/uhci-hcd.scc
+include features/usb/ehci-hcd.scc
+include features/usb/xhci-hcd.scc
+include features/hostapd/hostapd.scc
+include features/latencytop/latencytop.scc
+include features/uio/uio.scc
+include features/spi/spi.scc
+include features/spi/spidev.scc
+include features/bluetooth/bluetooth.scc
+#include features/edac/edac-x86.scc
+
+kconf hardware intel-x86.cfg
+kconf hardware intel-x86-mga.cfg
+kconf hardware intel-x86-acpi.cfg
+kconf hardware intel-x86-igb-overrides.cfg
+kconf hardware intel-x86-ixgbe-overrides.cfg
+kconf hardware intel-x86-tigon3.cfg
-- 
1.8.1.2


