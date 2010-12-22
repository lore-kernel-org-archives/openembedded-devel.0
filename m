Received: from asmtpout027.mac.com ([17.148.16.102])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@mac.com>) id 1PVVfk-0007MJ-Fl
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Dec 2010 21:52:32 +0100
MIME-version: 1.0
Received: from [192.168.1.30] ([87.201.169.175])
	by asmtp027.mac.com (Oracle Communications Messaging Exchange Server
	7u4-18.01 64bit (built Jul 15 2010)) with ESMTPSA id
	<0LDU00JS1HUN3P70@asmtp027.mac.com>
	for openembedded-devel@lists.openembedded.org; Wed,
	22 Dec 2010 11:52:04 -0800 (PST)
X-Proofpoint-Virus-Version: vendor=fsecure
	engine=2.50.10432:5.2.15,1.0.148,0.0.0000
	definitions=2010-12-22_09:2010-12-22, 2010-12-22,
	1970-01-01 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
	ipscore=0 suspectscore=0 phishscore=0 bulkscore=23 adultscore=0
	classifier=spam adjust=0 reason=mlx engine=6.0.2-1010190000
	definitions=main-1012220104
From: Elvis Dowson <elvis.dowson@mac.com>
Date: Wed, 22 Dec 2010 23:51:45 +0400
Message-id: <ABD557DA-5595-4CD8-AE87-C5FCC45F41BF@mac.com>
To: OpenEmbedded Developer Mailing List
	<openembedded-devel@lists.openembedded.org>
X-Mailer: Apple Mail (2.1082)
Subject: compat-wireless recipe
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
X-List-Received-Date: Wed, 22 Dec 2010 20:52:32 -0000
Content-type: text/plain; charset=windows-1252
Content-transfer-encoding: quoted-printable

Hi,
      Is there a recipe for compat-wireless?=20

http://linuxwireless.org/en/users/Download/stable/

Support for the TI wl1271 wlan module is only available in mainline =
kernel 2.6.37-rc6 onwards, and the compat-wireless package provides =
backports of the wl1271 driver for android-kernel-2.6.32.

http://linuxwireless.org/en/users/Drivers/wl12xx

I just need a recipe to incorporate it into my root file system build.=20=


Here is the full logical flow to replicating the process, if someone =
could help me write a recipe for this, it would be great. I can write =
simple recipes based off git and local file repos, but I don't know how =
to handle and process the compat-wireless ways of dealing with things.

Best regards,

Elvis


Technote android-2.6.32-009: How to backport wl12xx drivers from =
linux-2.6.37-rc6 kernel to android-rowboat-eclair-2.6.32 kernel


Overview

This document describes how to backport the wl12xx drivers from the =
linux-2.6.37-rc6 kernel to the android-rowboat-eclair-2.6.32 kernel.


Procedure


Step 01.00: Download the compat-wireless package.

=
http://www.orbit-lab.org/kernel/compat-wireless-2.6-stable/v2.6.37/compat-=
wireless-2.6.37-rc6-3.tar.bz2

Step 02.00: Configure and build the wl12xx driver.

Step 02.01: Modify environment variables in .bashrc

#
# Environment setup for u-boot and linux kernel
#

export ARCH=3Darm
export CROSS_COMPILE=3Darm-angstrom-linux-gnueabi-
export CROSSCOMPILER=3Darmv7a
export =
CROSSTOOLCHAIN=3D${OVEROTOP}/tmp/sysroots/x86_64-linux/usr/${CROSSCOMPILER=
}
export =
KERNEL_DIR=3D"/tool/patches/android-rowboat-2.6.32-kernel-patchwork"
export UIMAGE_DIR=3D"${KERNEL_DIR}/arch/arm/boot"
export KLIB=3D"${KERNEL_DIR}"
export KLIB_BUILD=3D"${KERNEL_DIR}"


Step 02.02: Select the driver

$ cd /tool/patches/compat-wireless-2.6.37-rc6-3-patchwork
$ ./scripts/driver-select wl12xx

Step 02.03: Apply patches to fix various compilation errors.

 Problem 01: error: redefinition of =91netdev_alloc_skb_ip_align=92

$ make
./scripts/gen-compat-autoconf.sh config.mk > =
include/linux/compat_autoconf.h
make -C /tool/patches/android-rowboat-2.6.32-kernel-patchwork =
M=3D/tool/patches/compat-wireless-2.6.37-rc6-3-patchwork modules
make[1]: Entering directory =
`/tool/patches/android-rowboat-2.6.32-kernel-patchwork'
 CC [M]  =
/tool/patches/compat-wireless-2.6.37-rc6-3-patchwork/compat/main.o
In file included from =
/tool/patches/compat-wireless-2.6.37-rc6-3-patchwork/include/linux/compat-=
2.6.h:28,
                from <command-line>:0:
=
/tool/patches/compat-wireless-2.6.37-rc6-3-patchwork/include/linux/compat-=
2.6.33.h:56:1: warning: "NETDEV_POST_INIT" redefined
In file included from include/linux/memory_hotplug.h:6,
                from include/linux/mmzone.h:653,
                from include/linux/gfp.h:4,
                from include/linux/kmod.h:22,
                from include/linux/module.h:13,
                from include/linux/textsearch.h:7,
                from include/linux/skbuff.h:27,
                from include/linux/if_ether.h:124,
                from include/linux/netdevice.h:29,
                from =
/tool/patches/compat-wireless-2.6.37-rc6-3-patchwork/include/linux/compat-=
2.6.29.h:5,
                from =
/tool/patches/compat-wireless-2.6.37-rc6-3-patchwork/include/linux/compat-=
2.6.h:24,
                from <command-line>:0:
include/linux/notifier.h:204:1: warning: this is the location of the =
previous definition
In file included from =
/tool/patches/compat-wireless-2.6.37-rc6-3-patchwork/include/linux/compat-=
2.6.h:28,
                from <command-line>:0:
=
/tool/patches/compat-wireless-2.6.37-rc6-3-patchwork/include/linux/compat-=
2.6.33.h:58: error: redefinition of =91netdev_alloc_skb_ip_align=92
include/linux/skbuff.h:1487: error: previous definition of =
=91netdev_alloc_skb_ip_align=92 was here
make[3]: *** =
[/tool/patches/compat-wireless-2.6.37-rc6-3-patchwork/compat/main.o] =
Error 1
make[2]: *** =
[/tool/patches/compat-wireless-2.6.37-rc6-3-patchwork/compat] Error 2
make[1]: *** =
[_module_/tool/patches/compat-wireless-2.6.37-rc6-3-patchwork] Error 2
make[1]: Leaving directory =
`/tool/patches/android-rowboat-2.6.32-kernel-patchwork'
make: *** [modules] Error 2

Solution: Apply the following patch.

diff --git a/include/linux/compat-2.6.33.h =
b/include/linux/compat-2.6.33.h
index c2dbc1b..468a074 100644
--- a/include/linux/compat-2.6.33.h
+++ b/include/linux/compat-2.6.33.h
@@ -52,19 +52,6 @@ static inline void compat_release_firmware(const =
struct firmware *fw)
#define IFF_DONT_BRIDGE 0x800          /* disallow bridging this ether =
dev */
/* source: include/linux/if.h */

-/* this will never happen on older kernels */
-#define NETDEV_POST_INIT 0xffff
-
-static inline struct sk_buff *netdev_alloc_skb_ip_align(struct =
net_device *dev,
-                unsigned int length)
-{
-       struct sk_buff *skb =3D netdev_alloc_skb(dev, length + =
NET_IP_ALIGN);
-
-       if (NET_IP_ALIGN && skb)
-               skb_reserve(skb, NET_IP_ALIGN);
-       return skb;
-}
-
#if defined(CONFIG_PCCARD) || defined(CONFIG_PCCARD_MODULE)

#if defined(CONFIG_PCMCIA) || defined(CONFIG_PCMCIA_MODULE)


 Problem 02: Multiple errors in function =91ieee80211_led_init=92:

CC [M]  =
/tool/patches/compat-wireless-2.6.37-rc6-3-patchwork/net/mac80211/led.o
/tool/patches/compat-wireless-2.6.37-rc6-3-patchwork/net/mac80211/led.c: =
In function =91ieee80211_led_init=92:
=
/tool/patches/compat-wireless-2.6.37-rc6-3-patchwork/net/mac80211/led.c:59=
: error: invalid application of =91sizeof=92 to incomplete type =91struct =
led_trigger=92=20
=
/tool/patches/compat-wireless-2.6.37-rc6-3-patchwork/net/mac80211/led.c:63=
: error: dereferencing pointer to incomplete type
=
/tool/patches/compat-wireless-2.6.37-rc6-3-patchwork/net/mac80211/led.c:64=
: error: implicit declaration of function =91led_trigger_register=92
=
/tool/patches/compat-wireless-2.6.37-rc6-3-patchwork/net/mac80211/led.c:70=
: error: invalid application of =91sizeof=92 to incomplete type =91struct =
led_trigger=92=20
=
/tool/patches/compat-wireless-2.6.37-rc6-3-patchwork/net/mac80211/led.c:74=
: error: dereferencing pointer to incomplete type
=
/tool/patches/compat-wireless-2.6.37-rc6-3-patchwork/net/mac80211/led.c:81=
: error: invalid application of =91sizeof=92 to incomplete type =91struct =
led_trigger=92=20
=
/tool/patches/compat-wireless-2.6.37-rc6-3-patchwork/net/mac80211/led.c:85=
: error: dereferencing pointer to incomplete type
=
/tool/patches/compat-wireless-2.6.37-rc6-3-patchwork/net/mac80211/led.c:92=
: error: invalid application of =91sizeof=92 to incomplete type =91struct =
led_trigger=92=20
=
/tool/patches/compat-wireless-2.6.37-rc6-3-patchwork/net/mac80211/led.c:96=
: error: dereferencing pointer to incomplete type
/tool/patches/compat-wireless-2.6.37-rc6-3-patchwork/net/mac80211/led.c: =
In function =91ieee80211_led_exit=92:
=
/tool/patches/compat-wireless-2.6.37-rc6-3-patchwork/net/mac80211/led.c:10=
7: error: implicit declaration of function =91led_trigger_unregister=92
make[3]: *** =
[/tool/patches/compat-wireless-2.6.37-rc6-3-patchwork/net/mac80211/led.o] =
Error 1
make[2]: *** =
[/tool/patches/compat-wireless-2.6.37-rc6-3-patchwork/net/mac80211] =
Error 2
make[1]: *** =
[_module_/tool/patches/compat-wireless-2.6.37-rc6-3-patchwork] Error 2
make[1]: Leaving directory =
`/tool/patches/android-rowboat-2.6.32-kernel-patchwork'
make: *** [modules] Error 2

Solution: In the kernel config, CONFIG_LEDS_TRIGGERS is probably unset =
and net/mac80211/led.c should not be build at all.=20

In the kernel CONFIG_MAC80211_LEDS will select CONFIG_LEDS_TRIGGERS, but =
in compat-wireless this should just be disabled.

Apply the following patch to fix the problem.

=46rom 47d9c7d253a7b2a78af69f0d8177ee55df74ea0e Mon Sep 17 00:00:00 2001
From: Hauke Mehrtens <hauke@hauke-m.de>
Date: Wed, 22 Dec 2010 19:10:34 +0100
Subject: [PATCH] compat-wireless: build led support conditionally

Do not build compat-wireless with LED support when the kernel does not
contain a led subsystem.
This fixes some compile problems when CONFIG_LEDS_TRIGGERS is not set.

Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
Signed-off-by: Luis R. Rodriguez <lrodriguez@atheros.com>
---
config.mk |   36 +++++++++++++++++++++++++++---------
1 files changed, 27 insertions(+), 9 deletions(-)

diff --git a/config.mk b/config.mk
index 964c646..3a38d34 100644
--- a/config.mk
+++ b/config.mk
@@ -133,7 +133,9 @@ CONFIG_COMPAT_MAC80211_RC_DEFAULT=3Dminstrel_ht
CONFIG_MAC80211_RC_PID=3Dy
CONFIG_MAC80211_RC_MINSTREL=3Dy
CONFIG_MAC80211_RC_MINSTREL_HT=3Dy
-CONFIG_MAC80211_LEDS=3Dy
+ifdef CONFIG_LEDS_TRIGGERS
+ CONFIG_MAC80211_LEDS=3Dy
+endif #CONFIG_LEDS_TRIGGERS

# enable mesh networking too
CONFIG_MAC80211_MESH=3Dy
@@ -243,7 +245,9 @@ CONFIG_B43_PCI_AUTOSELECT=3Dy
ifdef CONFIG_PCMCIA
CONFIG_B43_PCMCIA=3Dy
endif #CONFIG_PCMCIA
-CONFIG_B43_LEDS=3Dy
+ifdef CONFIG_MAC80211_LEDS
+ CONFIG_B43_LEDS=3Dy
+endif #CONFIG_MAC80211_LEDS
CONFIG_B43_PHY_LP=3Dy
CONFIG_B43_PHY_N=3Dy
# CONFIG_B43_FORCE_PIO=3Dy
@@ -252,7 +256,9 @@ CONFIG_B43_PHY_N=3Dy
CONFIG_B43LEGACY=3Dm
CONFIG_B43LEGACY_HWRNG=3Dy
CONFIG_B43LEGACY_PCI_AUTOSELECT=3Dy
-CONFIG_B43LEGACY_LEDS=3Dy
+ifdef CONFIG_MAC80211_LEDS
+ CONFIG_B43LEGACY_LEDS=3Dy
+endif #CONFIG_MAC80211_LEDS
# CONFIG_B43LEGACY_DEBUG=3Dy
CONFIG_B43LEGACY_DMA=3Dy
CONFIG_B43LEGACY_PIO=3Dy
@@ -408,18 +414,24 @@ endif #CONFIG_COMPAT_KERNEL_29

CONFIG_P54_USB=3Dm
CONFIG_RTL8187=3Dm
-CONFIG_RTL8187_LEDS=3Dy
+ifdef CONFIG_MAC80211_LEDS
+ CONFIG_RTL8187_LEDS=3Dy
+endif #CONFIG_MAC80211_LEDS

CONFIG_AT76C50X_USB=3Dm

ifndef CONFIG_COMPAT_KERNEL_28
CONFIG_AR9170_USB=3Dm
-CONFIG_AR9170_LEDS=3Dy
+ifdef CONFIG_MAC80211_LEDS
+ CONFIG_AR9170_LEDS=3Dy
+endif #CONFIG_MAC80211_LEDS
endif #CONFIG_COMPAT_KERNEL_28

ifndef CONFIG_COMPAT_KERNEL_29
CONFIG_CARL9170=3Dm
-CONFIG_CARL9170_LEDS=3Dy
+ifdef CONFIG_MAC80211_LEDS
+ CONFIG_CARL9170_LEDS=3Dy
+endif #CONFIG_MAC80211_LEDS
# CONFIG_CARL9170_DEBUGFS=3Dy
# CONFIG_CARL9170_WPC=3Dy
endif #CONFIG_COMPAT_KERNEL_29
@@ -559,7 +571,9 @@ CONFIG_RT2X00_LIB_CRYPTO=3Dy
ifdef CONFIG_COMPAT_KERNEL_25
CONFIG_RT2X00_LIB_LEDS=3Dn
else #CONFIG_COMPAT_KERNEL_25
-CONFIG_RT2X00_LIB_LEDS=3Dy
+ifdef CONFIG_LEDS_CLASS
+ CONFIG_RT2X00_LIB_LEDS=3Dy
+endif #CONFIG_LEDS_CLASS
endif #CONFIG_COMPAT_KERNEL_25
# CONFIG_RT2X00_DEBUG=3Dy
# CONFIG_RT2X00_LIB_DEBUGFS
@@ -567,7 +581,9 @@ endif

# p54
CONFIG_P54_COMMON=3Dm
-CONFIG_P54_LEDS=3Dy
+ifdef CONFIG_MAC80211_LEDS
+ CONFIG_P54_LEDS=3Dy
+endif #CONFIG_MAC80211_LEDS

# Atheros
CONFIG_ATH_COMMON=3Dm
@@ -594,7 +610,9 @@ endif #CONFIG_COMPAT_KERNEL_27
# In more recent kernel versions use the in kernel rfkill module.
ifdef CONFIG_COMPAT_KERNEL_31
CONFIG_RFKILL_BACKPORT=3Dm
-CONFIG_RFKILL_BACKPORT_LEDS=3Dy
+ifdef CONFIG_LEDS_TRIGGERS
+ CONFIG_RFKILL_BACKPORT_LEDS=3Dy
+endif #CONFIG_LEDS_TRIGGERS
CONFIG_RFKILL_BACKPORT_INPUT=3Dy
endif #CONFIG_COMPAT_KERNEL_31

--=20
1.7.3.2.90.gd4c43

--


Step 02.03: Build the driver

$ make=20


Additional patches to be added to the mainline kernel:

01. http://www.spinics.net/lists/linux-mmc/msg03966.html

02. =
http://permalink.gmane.org/gmane.linux.power-management.general/21579







