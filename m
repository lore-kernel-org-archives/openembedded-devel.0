Received: from smtp2-g21.free.fr ([212.27.42.2])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1O7VGi-00083S-SM
	for openembedded-devel@lists.openembedded.org;
	Thu, 29 Apr 2010 17:03:20 +0200
Received: from smtp2-g21.free.fr (localhost [127.0.0.1])
	by smtp2-g21.free.fr (Postfix) with ESMTP id 2FEC24B00E4;
	Thu, 29 Apr 2010 16:59:29 +0200 (CEST)
Received: from localhost.localdomain (pac33-2-82-240-38-71.fbx.proxad.net
	[82.240.38.71])
	by smtp2-g21.free.fr (Postfix) with ESMTP id 10A804B0152;
	Thu, 29 Apr 2010 16:59:26 +0200 (CEST)
From: Eric Benard <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Apr 2010 17:01:01 +0200
Message-Id: <1272553261-22050-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <1264171888.14275.7.camel@mattotaupa.wohnung.familie-menzel.net>
References: <1264171888.14275.7.camel@mattotaupa.wohnung.familie-menzel.net>
X-SA-Exim-Connect-IP: 212.27.42.2
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] svgalib : add svgalib-1.9.25
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
X-List-Received-Date: Thu, 29 Apr 2010 15:03:22 -0000

- original recipe comes from :
http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-January/016607.html
- added fix for compilation against recent kernel
- updated and tested on x86
- disable helper module
- configuration file /etc/vga/libga.config is not included in any package

Signed-off-by: Eric Benard <eric@eukrea.com>
---
 recipes/svgalib/files/gtfcalc-round.patch          |   17 ++
 recipes/svgalib/files/makefiles-ldconfig.patch     |   26 ++
 .../svgalib/files/svgalib-1.9.25-linux2.6.patch    |  289 ++++++++++++++++++++
 recipes/svgalib/svgalib_1.9.25.bb                  |  129 +++++++++
 4 files changed, 461 insertions(+), 0 deletions(-)
 create mode 100644 recipes/svgalib/files/gtfcalc-round.patch
 create mode 100644 recipes/svgalib/files/makefiles-ldconfig.patch
 create mode 100644 recipes/svgalib/files/svgalib-1.9.25-linux2.6.patch
 create mode 100644 recipes/svgalib/svgalib_1.9.25.bb

diff --git a/recipes/svgalib/files/gtfcalc-round.patch b/recipes/svgalib/files/gtfcalc-round.patch
new file mode 100644
index 0000000..076c350
--- /dev/null
+++ b/recipes/svgalib/files/gtfcalc-round.patch
@@ -0,0 +1,17 @@
+Index: svgalib-1.9.25/utils/gtf/gtfcalc.c
+===================================================================
+--- svgalib-1.9.25.orig/utils/gtf/gtfcalc.c
++++ svgalib-1.9.25/utils/gtf/gtfcalc.c
+@@ -64,10 +64,12 @@ static GTF_constants GC = {
+ 
+ /*-------------------------- Implementation -------------------------------*/
+ 
++#ifndef HAVE_ROUND
+ static double round(double v)
+ {
+ 	return floor(v + 0.5);
+ }
++#endif
+ 
+ static void GetInternalConstants(GTF_constants *c)
+ /****************************************************************************
diff --git a/recipes/svgalib/files/makefiles-ldconfig.patch b/recipes/svgalib/files/makefiles-ldconfig.patch
new file mode 100644
index 0000000..2802f17
--- /dev/null
+++ b/recipes/svgalib/files/makefiles-ldconfig.patch
@@ -0,0 +1,26 @@
+Index: svgalib-1.9.25/Makefile
+===================================================================
+--- svgalib-1.9.25.orig/Makefile
++++ svgalib-1.9.25/Makefile
+@@ -100,7 +100,7 @@ installsharedlib: $(SHAREDLIBS) $(SVGALI
+ 		 ln -sf $$foo `echo $$foo | sed 's/\.so\..*/.so/'` ); \
+ 	done
+ 	@./fixldsoconf
+-	-ldconfig
++#	-ldconfig
+ 
+ installstaticlib: static
+ 	@echo Installing static libraries in $(libdir).
+Index: svgalib-1.9.25/threeDKit/Makefile
+===================================================================
+--- svgalib-1.9.25.orig/threeDKit/Makefile
++++ svgalib-1.9.25/threeDKit/Makefile
+@@ -58,7 +58,7 @@ lib3dkit.so.$(VERSION): $(OBJECTS)
+ $(sharedlibdir)/lib3dkit.so.$(VERSION): lib3dkit.so.$(VERSION)
+ 	$(INSTALL_SHLIB) $< $(sharedlibdir)/$<
+ 	(cd $(sharedlibdir); ln -sf lib3dkit.so.$(VERSION) `echo lib3dkit.so.$(VERSION) | sed 's/\.so\..*/.so/'` )
+-	-ldconfig
++#	-ldconfig
+ 
+ install: $(sharedlibdir)/lib3dkit.so.$(VERSION) installheaders
+ 
diff --git a/recipes/svgalib/files/svgalib-1.9.25-linux2.6.patch b/recipes/svgalib/files/svgalib-1.9.25-linux2.6.patch
new file mode 100644
index 0000000..20ab1fe
--- /dev/null
+++ b/recipes/svgalib/files/svgalib-1.9.25-linux2.6.patch
@@ -0,0 +1,289 @@
+        - get rid of warning when linux/device.h doesnt exist
+        - touch up the Makefile to let the ebuild handle the module details
+        - fix support with io remap stuff in newer kernels
+        - dont include headers that dont exist in 2.4.x kernels
+        - use module_param() for 2.6.x and MODULE_PARM() for all others
+        - dont declare all_devices as static since it is exported
+        - dont include <linux/config.h> as the build system does it for us
+        - in lrmi, map old flag names to new names for versions >= 2.6.26
+
+--- svgalib/kernel/svgalib_helper/Makefile
++++ svgalib/kernel/svgalib_helper/Makefile
+@@ -25,7 +25,7 @@
+ endif
+ 
+ 
+-CLASS_SIMPLE := $(shell grep class_simple_create $(KDIR)/include/linux/device.h)
++CLASS_SIMPLE := $(shell grep -s class_simple_create $(KDIR)/include/linux/device.h)
+ 
+ ifneq ($(CLASS_SIMPLE),)
+   CLASS_CFLAGS = -DCLASS_SIMPLE=1
+--- svgalib/kernel/svgalib_helper/Makefile.alt
++++ svgalib/kernel/svgalib_helper/Makefile.alt
+@@ -37,7 +37,7 @@
+ CFLAGS += -DSVGALIB_HELPER_MAJOR=$(SVGALIB_HELPER_MAJOR)
+ 
+ ifeq (1,$(findstring 1,$(MODVER)))
+-	CFLAGS += -DMODVERSIONS -include $(INCLUDEDIR)/linux/modversions.h
++	CFLAGS += -DMODVERSIONS -DCONFIG_MODVERSIONS=1
+ endif
+ 
+ TARGET = svgalib_helper
+@@ -50,7 +50,8 @@
+ 	endif
+ endif
+ 
+-all: .depend $(OBJS)
++modules: $(OBJS)
++all: .depend modules
+ 
+ $(TARGET).o: $(SRC:.c=.o)
+ 	$(LD) -r $^ -o $@
+@@ -61,8 +62,8 @@
+ install: device modules_install
+ 
+ modules_install: $(OBJS)
+-	mkdir -p /lib/modules/$(VER)/kernel/misc 
+-	install -m 0644 -c $(OBJS) /lib/modules/$(VER)/kernel/misc
++	mkdir -p $(TOPDIR)/lib/modules/$(VER)/kernel/misc
++	install -m 0644 -c $(OBJS) $(TOPDIR)/lib/modules/$(VER)/kernel/misc
+ 
+ device:
+ 	rm -f /dev/svgalib_helper* /dev/svga_helper* /dev/svga /dev/svga?
+--- svgalib/kernel/svgalib_helper/kernel26compat.h
++++ svgalib/kernel/svgalib_helper/kernel26compat.h
+@@ -10,7 +10,7 @@
+ # define PCI_GET_CLASS pci_find_class
+ # define PCI_GET_DEVICE pci_find_device
+ 
+-# if defined (PG_chainlock)
++# if LINUX_VERSION_CODE >= KERNEL_VERSION(2,5,3)
+ #  define my_io_remap_page_range(vma, start, ofs, len, prot) \
+ 		io_remap_page_range(vma,start,ofs,len,prot)
+ # else
+@@ -70,6 +70,7 @@
+ 
+ /* These are also not present in 2.6 kernels ... */
+ #if (!defined _LINUX_DEVFS_FS_KERNEL_H) || (defined KERNEL_2_6)
++#include <linux/fs.h>
+ static inline int devfs_register_chrdev (unsigned int major, const char *name,
+                                          struct file_operations *fops)
+ {
+@@ -77,7 +78,12 @@
+ }
+ static inline int devfs_unregister_chrdev (unsigned int major,const char *name)
+ {
+-    return unregister_chrdev (major, name);
++#if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,0)    
++   return unregister_chrdev (major, name);
++#else
++    unregister_chrdev (major, name);
++    return 0;
++#endif
+ }
+ #endif
+ 
+@@ -99,7 +105,8 @@
+      class_device_create(svgalib_helper_class,                      	\
+                              MKDEV(SVGALIB_HELPER_MAJOR, _minor),       \
+                              &sh_pci_devs[_minor]->dev->dev, _name);
+-#else /* 2.6.15 changed class_device_create */
++/* 2.6.15 changed class_device_create */
++#elif LINUX_VERSION_CODE < KERNEL_VERSION(2,6,26)
+ #  define SLH_SYSFS_ADD_CONTROL                                         \
+      class_device_create(svgalib_helper_class, NULL,                	\
+                              MKDEV(SVGALIB_HELPER_MAJOR, 0),            \
+@@ -109,7 +116,30 @@
+      class_device_create(svgalib_helper_class, NULL,                	\
+                              MKDEV(SVGALIB_HELPER_MAJOR, _minor),       \
+                              &sh_pci_devs[_minor]->dev->dev, _name);
+-#endif /* 2.6.15 */
++/* 2.6.26 changed class_device_create to device_create */
++#elif LINUX_VERSION_CODE < KERNEL_VERSION(2,6,27)
++#  define SLH_SYSFS_ADD_CONTROL                                          \
++     device_create(svgalib_helper_class, NULL,                           \
++                             MKDEV(SVGALIB_HELPER_MAJOR, 0),             \
++                             "svga");
++
++#  define SLH_SYSFS_ADD_DEVICE(_name, _minor)                            \
++     device_create(svgalib_helper_class, &sh_pci_devs[_minor]->dev->dev, \
++                             MKDEV(SVGALIB_HELPER_MAJOR, _minor),        \
++                             _name);
++/* 2.6.27 changed device_create to device_create_drvdata */
++#else
++#  define SLH_SYSFS_ADD_CONTROL                                          \
++     device_create_drvdata(svgalib_helper_class, NULL,                   \
++                           MKDEV(SVGALIB_HELPER_MAJOR, 0),               \
++                           "%s%d", "svga", 0);
++
++#  define SLH_SYSFS_ADD_DEVICE(_name, _minor)                            \
++     device_create_drvdata(svgalib_helper_class,                         \
++                           &sh_pci_devs[_minor]->dev->dev,               \
++                           MKDEV(SVGALIB_HELPER_MAJOR, _minor),          \
++                           "%s%d", _name, _minor);
++#endif
+ 
+ #  define SLH_SYSFS_REMOVE_DEVICE(i)                                    \
+      class_destroy(svgalib_helper_class);
+@@ -161,3 +191,7 @@
+ #ifndef PCI_VENDOR_ID_RENDITION 
+ #define PCI_VENDOR_ID_RENDITION               0x1163
+ #endif
++
++#ifndef IRQF_SHARED
++# define IRQF_SHARED SA_SHIRQ
++#endif
+--- svgalib/kernel/svgalib_helper/main.c
++++ svgalib/kernel/svgalib_helper/main.c
+@@ -1,5 +1,3 @@
+-#include <linux/config.h>
+-
+ #if defined (CONFIG_MODVERSIONS) && !defined (MODVERSIONS)
+ # define MODVERSIONS
+ #endif
+@@ -17,15 +15,22 @@
+ #include <linux/ioport.h>
+ #include <linux/interrupt.h>
+ #include <linux/pci.h>
++#include <linux/version.h>
++#if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,18)
+ #include <linux/devfs_fs_kernel.h>
++#endif
+ #include <linux/mm.h>
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,5,0)
+ #include <linux/thread_info.h>
++#endif
+ #include <linux/smp.h>
+ #include <linux/smp_lock.h>
+ 
+ #include <linux/sched.h>
+ #include <linux/wait.h>
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,5,0)
+ #include <linux/syscalls.h>
++#endif
+ 
+ #define __KERNEL_SYSCALLS__
+ #include <linux/unistd.h>
+@@ -50,7 +55,7 @@
+ #include "displaystart.h"
+ 
+ int debug=0;
+-static int all_devices=0;
++int all_devices=0;
+ int num_devices=0;
+ 
+ static char *sdev_id="svgalib_helper";
+@@ -98,7 +103,11 @@
+ static volatile int vsync=0;
+ static wait_queue_head_t vsync_wait;
+ 
+-static irqreturn_t vsync_interrupt(int irq, void *dev_id, struct pt_regs *regs)
++static irqreturn_t vsync_interrupt(int irq, void *dev_id
++#if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,19)
++, struct pt_regs *regs
++#endif
++)
+ {
+     struct sh_pci_device *dev = (struct sh_pci_device *)dev_id;
+ 
+@@ -355,7 +364,7 @@
+                 vsync=1;
+                 i=0;
+                 while(irqs[i]!=-1)
+-                    request_irq(irqs[i++], vsync_interrupt, SA_SHIRQ, "svgalib_helper", sdev_id);
++                    request_irq(irqs[i++], vsync_interrupt, IRQF_SHARED, "svgalib_helper", sdev_id);
+                 vga_enable_vsync((void *)sdev_id);
+ 				wait_event_interruptible(vsync_wait, !vsync);
+                 i=0;
+@@ -443,7 +452,7 @@
+ 		int i=sh_pci_devs[minor]->dev->irq;
+ 		sh_pci_devs[minor]->opencount++;
+ 		if(sh_pci_devs[minor]->opencount==1 && i!=0 && i!=-1 && i!=255)
+-			request_irq(i, vsync_interrupt, SA_SHIRQ, "svgalib_helper", sh_pci_devs[minor]);
++			request_irq(i, vsync_interrupt, IRQF_SHARED, "svgalib_helper", sh_pci_devs[minor]);
+ 	}
+ 
+ #ifndef KERNEL_2_6
+@@ -763,10 +772,15 @@
+ 
+ }
+ 
++#ifdef KERNEL_2_6
++module_param(debug, int, 0);
++module_param(all_devices, int, 0);
++#else
+ MODULE_PARM(debug, "i");
+-MODULE_PARM_DESC(debug, "Debug output level.");
+-
+ MODULE_PARM(all_devices, "i");
++#endif
++
++MODULE_PARM_DESC(debug, "Debug output level.");
+ MODULE_PARM_DESC(all_devices, "Give access to all PCI devices, regardless of class.");
+ 
+
+--- svgalib/src/lrmi.6.c
++++ svgalib/src/lrmi.6.c
+@@ -169,6 +169,13 @@
+ 		}
+ 	}
+ 
++#ifndef TF_MASK
++#define TF_MASK X86_EFLAGS_TF
++#define IF_MASK X86_EFLAGS_IF
++#define IOPL_MASK X86_EFLAGS_IOPL
++#define VIF_MASK X86_EFLAGS_VIF
++#define VIP_MASK X86_EFLAGS_VIP
++#endif
+ 
+ #define DEFAULT_VM86_FLAGS 	(IF_MASK | IOPL_MASK)
+ #define DEFAULT_STACK_SIZE 	0x1000
+--- svgalib/src/lrmi.9.c
++++ svgalib/src/lrmi.9.c
+@@ -206,6 +206,13 @@
+ 
+ 
+ #if defined(__linux__)
++#ifndef TF_MASK
++#define TF_MASK X86_EFLAGS_TF
++#define IF_MASK X86_EFLAGS_IF
++#define IOPL_MASK X86_EFLAGS_IOPL
++#define VIF_MASK X86_EFLAGS_VIF
++#define VIP_MASK X86_EFLAGS_VIP
++#endif
+ #define DEFAULT_VM86_FLAGS 	(IF_MASK | IOPL_MASK)
+ #elif defined(__NetBSD__) || defined(__FreeBSD__) || defined(__OpenBSD__)
+ #define DEFAULT_VM86_FLAGS  (PSL_I | PSL_IOPL)
+--- svgalib/lrmi-0.6m/lrmi.c
++++ svgalib/lrmi-0.6m/lrmi.c
+@@ -170,6 +170,14 @@
+ 	}
+ 
+ 
++#ifndef TF_MASK
++#define TF_MASK X86_EFLAGS_TF
++#define IF_MASK X86_EFLAGS_IF
++#define IOPL_MASK X86_EFLAGS_IOPL
++#define VIF_MASK X86_EFLAGS_VIF
++#define VIP_MASK X86_EFLAGS_VIP
++#endif
++
+ #define DEFAULT_VM86_FLAGS 	(IF_MASK | IOPL_MASK)
+ #define DEFAULT_STACK_SIZE 	0x1000
+ #define RETURN_TO_32_INT 	255
+--- svgalib/lrmi-0.9/lrmi.c
++++ svgalib/lrmi-0.9/lrmi.c
+@@ -203,6 +203,13 @@
+ 
+ 
+ #if defined(__linux__)
++#ifndef TF_MASK
++#define TF_MASK X86_EFLAGS_TF
++#define IF_MASK X86_EFLAGS_IF
++#define IOPL_MASK X86_EFLAGS_IOPL
++#define VIF_MASK X86_EFLAGS_VIF
++#define VIP_MASK X86_EFLAGS_VIP
++#endif
+ #define DEFAULT_VM86_FLAGS 	(IF_MASK | IOPL_MASK)
+ #elif defined(__NetBSD__) || defined(__FreeBSD__) || defined(__OpenBSD__)
+ #define DEFAULT_VM86_FLAGS  (PSL_I | PSL_IOPL)
diff --git a/recipes/svgalib/svgalib_1.9.25.bb b/recipes/svgalib/svgalib_1.9.25.bb
new file mode 100644
index 0000000..037eeb9
--- /dev/null
+++ b/recipes/svgalib/svgalib_1.9.25.bb
@@ -0,0 +1,129 @@
+#
+#  Created on: 25-Jul-2006
+#      Author: Christopher Lang, <christopher.lang@acurana.de>
+#      Copyright (C) 2006 acurana GmbH, http://www.acurana.de/
+#      All rights reserved.
+#
+#  Updated on 29-Apr-2010
+#	Eric Benard - <eric@eukrea.com>
+#
+#  Description: svgalib VGA graphics library
+#
+
+DESCRIPTION = "Linux Super VGA graphics library"
+AUTHOR = "The svgalib contributors"
+HOMEPAGE = "http://www.svgalib.org/"
+SECTION = "libs"
+PRIORITY = "optional"
+LICENSE = "LGPL"
+PR = "r0"
+
+PARALLEL_MAKE = ""
+
+SRC_URI = "http://my.arava.co.il/~matan/svgalib/svgalib-${PV}.tar.gz;name=tarball \
+	file://makefiles-ldconfig.patch;patch=1 \
+	file://gtfcalc-round.patch;patch=1 \
+	file://svgalib-1.9.25-linux2.6.patch;patch=1 \
+	"
+
+S = "${WORKDIR}/svgalib-${PV}"
+
+LEAD_SONAME = "libvga"
+
+PACKAGES += "${PN}-utils ${PN}-demos"
+
+FILES_${PN} = "${libdir}/*.so.*"
+
+FILES_${PN}-demos = "${bindir}/${PN}"
+FILES_${PN}-utils = "${sbindir}/${PN}"
+
+FILES_${PN}-dbg += "${bindir}/${PN}/.debug \
+    ${sbindir}/${PN}/.debug"
+
+TARGET_CC_ARCH += "${LDFLAGS}"
+LDFLAGS_append = " -L${D}/usr/lib"
+
+# this HAVE_ROUND thing is not ideal, but since svgalib doesn't use autoconf...
+# see also gtfcalc-round.patch
+CFLAGS_append = " -L${D}/usr/lib -DHAVE_ROUND "
+
+# see Makefile.cfg
+ADDITIONAL_SVGA_DRIVER_TESTS = "INCLUDE_FBDEV_DRIVER_TEST=y"
+
+EXTRA_OEMAKE = "install demoprogs \
+    prefix=${D}/usr \
+    TOPDIR=${D} \
+    INSTALL_PROGRAM='install -c -s -m 755' \
+    INSTALL_SCRIPT='install -c -m 755' \
+    INSTALL_SHLIB='install -c -m 755' \
+    INSTALL_DATA='install -c -m 644' \
+    NO_HELPER=y \
+    ${ADDITIONAL_SVGA_DRIVER_TESTS} \
+    INCLUDES='-I. -I../include -I../src -I../gl -I${STAGING_INCDIR}' \
+    mandir=${D}/usr/share/man \
+    SVGALIB_CONFIG_FILE=/etc/vga/libvga.config \
+    "
+
+do_compile_prepend () {
+    install -d ${D}/{usr/lib,etc}
+}
+
+do_install_append () {
+    oe_libinstall -C sharedlib -so libvga ${D}${libdir}
+    oe_libinstall -C sharedlib -so libvgagl ${D}${libdir}
+    oe_libinstall -C threeDKit -so lib3dkit ${D}${libdir}
+    install -d ${D}${includedir}
+    install -m 0644 ${S}/include/* ${D}${includedir}
+    install -m 0644 ${S}/gl/vgagl.h ${D}${includedir}
+
+    install -d ${D}${mandir}/man{1,3,5,6,7,8}
+
+    for files in `ls -1 ${S}/doc/man1` ; do gzip ${S}/doc/man1/$files ; done
+    install -m 0644 ${S}/doc/man1/* ${D}${mandir}/man1
+
+    for files in `ls -1 ${S}/doc/man3` ; do gzip ${S}/doc/man3/$files ; done
+    install -m 0644 ${S}/doc/man3/* ${D}${mandir}/man3
+
+    for files in `ls -1 ${S}/doc/man5` ; do gzip ${S}/doc/man5/$files ; done
+    install -m 0644 ${S}/doc/man5/* ${D}${mandir}/man5
+
+    for files in `ls -1 ${S}/doc/man6` ; do gzip ${S}/doc/man6/$files ; done
+    install -m 0644 ${S}/doc/man6/* ${D}${mandir}/man6
+
+    for files in `ls -1 ${S}/doc/man7` ; do gzip ${S}/doc/man7/$files ; done
+    install -m 0644 ${S}/doc/man7/* ${D}${mandir}/man7
+
+    for files in `ls -1 ${S}/doc/man8` ; do gzip ${S}/doc/man8/$files ; done
+    install -m 0644 ${S}/doc/man8/* ${D}${mandir}/man8
+
+    install -d ${D}${bindir}/${PN}
+    install -d ${D}${sbindir}/${PN}
+
+    for files in `find ${S}/demos -type d -o -executable -print` ; do \
+        install -m 755 $files ${D}${bindir}/${PN} ; \
+    done
+
+    install -m 755 ${S}/threeDKit/plane ${D}${bindir}/${PN}
+    install -m 755 ${S}/threeDKit/wrapdemo ${D}${bindir}/${PN}
+
+    for files in `find ${S}/utils -type d -o -executable -print` ; do \
+        install -m 755 $files ${D}${sbindir}/${PN} ; \
+    done
+
+    install -d ${D}${docdir}/${PN}
+
+    for files in `find ${S}/doc -maxdepth 1 -type f` ; do \
+        install -m 644 $files ${D}${docdir}/${PN} ; \
+    done
+}
+
+do_stage () {
+    install -m 0644 ${S}/include/* ${STAGING_INCDIR}/
+    install -m 0644 ${S}/gl/vgagl.h ${STAGING_INCDIR}/
+    oe_libinstall -C sharedlib -so libvga ${STAGING_LIBDIR}
+    oe_libinstall -C sharedlib -so libvgagl ${STAGING_LIBDIR}
+    oe_libinstall -C threeDKit -so lib3dkit ${STAGING_LIBDIR}
+}
+
+SRC_URI[tarball.md5sum] = "4dda7e779e550b7404cfe118f1d74222"
+SRC_URI[tarball.sha256sum] = "2ad5da713a6bd69622c483de4e4f448ed2b82f7b954db43dc477d5b6b12d8602"
-- 
1.6.3.3



