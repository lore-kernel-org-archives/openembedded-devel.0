Return-Path: <fathi.boudra@linaro.org>
Received: from mail-lf0-f47.google.com (mail-lf0-f47.google.com
	[209.85.215.47])
	by mail.openembedded.org (Postfix) with ESMTP id 45D3877777
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Sep 2016 09:58:51 +0000 (UTC)
Received: by mail-lf0-f47.google.com with SMTP id l131so6987271lfl.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Sep 2016 02:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=p349ocBZqnrJnsU3NXamceUrq2DmVadhzZE0PRLmGy0=;
	b=VpzWQY+GhTwNEyUBhf/Y4uLTv12ugnChqsUcFsKcOVIKR+zErEhdRt27FY1vkfyxLT
	2uXb7sJJisA/pPoxR7FIp4h8CoEAHbs/88Zmwj5fGRTEuz3P3VCTuewd5qKQxE1UAOnH
	rjaToyQOTQi09Oie+DawlwnPX/IoLBOxqPo+k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=p349ocBZqnrJnsU3NXamceUrq2DmVadhzZE0PRLmGy0=;
	b=KlxshNc1Bf4zLI6B0mEgi/OD/ulETmoxXOLq6cO5WrySUpJE1H/W+/4HNcxuBDDnWH
	Ta45ohmuelQ5WHMZg6w/LP87yFMyDFWKKrBgICggcdNKkBQk26+RxDHaQYldAxz5jG7k
	KP+vtZLcK7S2Se8iKC0QVjbkuL57cSBo3Z+ZIkHheUrdyjwiwzU6CP1xeOvmykQz6Je4
	nH/OGEp+th9Mg/zHDoQx5p2XnLlsevqAD5QL1pxqIU7PLnCCl9X/E85cCz9o7mggSUq4
	KWRbMtOZcAGNeTtEp2BC/v4+sWi6nNI8XHdAK6LzUlCstIhX1++kEBxr3CesLCndFoFL
	gxCg==
X-Gm-Message-State: AE9vXwNm+vy6lRvhMJgtQd3LNkgdUGVMeDete38qg0keVotGMUqFF442/2IRk5e9wfV8/2NG
X-Received: by 10.25.209.204 with SMTP id i195mr4233837lfg.20.1473242331864;
	Wed, 07 Sep 2016 02:58:51 -0700 (PDT)
Received: from localhost.localdomain (a91-156-68-16.elisa-laajakaista.fi.
	[91.156.68.16]) by smtp.gmail.com with ESMTPSA id
	u70sm6323982lja.15.2016.09.07.02.58.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 07 Sep 2016 02:58:50 -0700 (PDT)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  7 Sep 2016 12:58:47 +0300
Message-Id: <20160907095847.32480-1-fathi.boudra@linaro.org>
X-Mailer: git-send-email 2.9.3
MIME-Version: 1.0
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 1/1] android-tools: add recipe from AOSP tag android-5.1.1_r37
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 07 Sep 2016 09:58:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Android tools offer filsystem tools for creating sparse images,
so package them in package of its own.

This recipe is re-worked and not a straight import from meta-shr.

It's built from AOSP source. I've dropped the ubuntu-ism which will
never be upstreamed.

The intent is to be closer to the upstream AOSP source code and be able
to update the recipe regularly.

Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
---
 .../android-tools-conf/android-gadget-setup        |  25 ++++
 .../android-tools/android-tools-conf_1.0.bb        |  13 ++
 .../android-tools/android-tools/.gitignore         |  57 +++++++
 .../android-tools/android-tools/adb.mk             |  72 +++++++++
 .../android-tools/android-tools/adbd.mk            | 163 +++++++++++++++++++++
 .../android-tools/android-tools-adbd.service       |  12 ++
 .../android-tools/define-shell-command.patch       |  23 +++
 .../android-tools/android-tools/ext4_utils.mk      | 103 +++++++++++++
 .../android-tools/android-tools/fastboot.mk        |  89 +++++++++++
 ...cit-declaration-function-strlcat-strlcopy.patch |  42 ++++++
 ...timg-Add-dt-parameter-to-specify-DT-image.patch | 108 ++++++++++++++
 .../android-tools/android-tools/mkbootimg.mk       |  29 ++++
 .../android-tools/preserve-ownership.patch         |  72 +++++++++
 .../android-tools/remove-bionic-android.patch      |  67 +++++++++
 .../android-tools/remove-selinux-android.patch     |  56 +++++++
 .../android-tools/use-capability.patch             |  19 +++
 .../android-tools/use-local-socket.patch           |  62 ++++++++
 .../android-tools/android-tools_5.1.1.r37.bb       | 136 +++++++++++++++++
 18 files changed, 1148 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/android-tools/android-tools-conf/android-gadget-setup
 create mode 100644 meta-oe/recipes-devtools/android-tools/android-tools-conf_1.0.bb
 create mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/.gitignore
 create mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/adb.mk
 create mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/adbd.mk
 create mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/android-tools-adbd.service
 create mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/define-shell-command.patch
 create mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/ext4_utils.mk
 create mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/fastboot.mk
 create mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/implicit-declaration-function-strlcat-strlcopy.patch
 create mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/mkbootimg-Add-dt-parameter-to-specify-DT-image.patch
 create mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/mkbootimg.mk
 create mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/preserve-ownership.patch
 create mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/remove-bionic-android.patch
 create mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/remove-selinux-android.patch
 create mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/use-capability.patch
 create mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/use-local-socket.patch
 create mode 100644 meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb

diff --git a/meta-oe/recipes-devtools/android-tools/android-tools-conf/android-gadget-setup b/meta-oe/recipes-devtools/android-tools/android-tools-conf/android-gadget-setup
new file mode 100644
index 0000000..f7d9973
--- /dev/null
+++ b/meta-oe/recipes-devtools/android-tools/android-tools-conf/android-gadget-setup
@@ -0,0 +1,25 @@
+#!/bin/sh
+
+# TODO enable the lines below once we have support for getprop
+# retrieve the product info from Android
+# manufacturer=$(getprop ro.product.manufacturer Android)
+# model=$(getprop ro.product.model Android)
+# serial=$(getprop ro.serialno 0123456789ABCDEF)
+
+manufacturer="$(cat /system/build.prop | grep -o 'ro.product.manufacturer=.*' | cut -d'=' -f 2)"
+model="$(cat /system/build.prop | grep -o 'ro.product.model=.*' | cut -d'=' -f 2)"
+# get the device serial number from /proc/cmdline directly(since we have no getprop on
+# GNU/Linux)
+serial="$(cat /proc/cmdline | sed 's/.*androidboot.serialno=//' | sed 's/ .*//')"
+
+echo $serial > /sys/class/android_usb/android0/iSerial
+echo $manufacturer > /sys/class/android_usb/android0/iManufacturer
+echo $model > /sys/class/android_usb/android0/iProduct
+
+echo "0" > /sys/class/android_usb/android0/enable
+echo "18d1" > /sys/class/android_usbid_usb/android0/idVendor
+echo "D002" > /sys/class/android_usb/android0/idProduct
+echo "adb" > /sys/class/android_usb/android0/functions
+echo "1" >  /sys/class/android_usb/android0/enable
+
+sleep 4
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools-conf_1.0.bb b/meta-oe/recipes-devtools/android-tools/android-tools-conf_1.0.bb
new file mode 100644
index 0000000..af98f92
--- /dev/null
+++ b/meta-oe/recipes-devtools/android-tools/android-tools-conf_1.0.bb
@@ -0,0 +1,13 @@
+DESCRIPTION = "Different utilities from Android - corressponding configuration files"
+SECTION = "console/utils"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
+
+SRC_URI = "file://android-gadget-setup"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+do_install() {
+    install -d ${D}${bindir}
+    install -m 0755 ${WORKDIR}/android-gadget-setup ${D}${bindir}
+}
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/.gitignore b/meta-oe/recipes-devtools/android-tools/android-tools/.gitignore
new file mode 100644
index 0000000..b8a08f8
--- /dev/null
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/.gitignore
@@ -0,0 +1,57 @@
+*
+!.gitignore
+!*.indirectionsymlink
+!*.[ch]
+!*.mk
+!NOTICE
+!MODULE_LICENSE_*
+!/system/
+!/system/core/
+!/system/core/adb/
+!/system/core/fastboot/
+!/system/core/fs_mgr/
+!/system/core/fs_mgr/include/
+!/system/core/include/
+!/system/core/include/android/
+!/system/core/include/cutils/
+!/system/core/include/log/
+!/system/core/include/mincrypt/
+!/system/core/include/private/
+!/system/core/include/utils/
+!/system/core/include/zipfile/
+!/system/core/liblog/
+!/system/core/liblog/tests/
+!/system/core/libcutils/
+!/system/core/libmincrypt/
+!/system/core/libzipfile/
+!/system/core/libsparse/
+!/system/core/libsparse/include/
+!/system/core/libsparse/include/sparse/
+!/system/core/libsparse/simg_dump.py
+!/system/core/mkbootimg/
+!/system/extras/
+!/system/extras/ext4_utils/
+!/system/extras/ext4_utils/mkuserimg.sh
+!/system/extras/ext4_utils/test_ext4fixup
+!/system/extras/f2fs_utils/
+!/hardware/
+!/hardware/libhardware/
+!/hardware/libhardware/include/
+!/hardware/libhardware/include/hardware/
+!/external/
+!/external/libselinux/
+!/external/libselinux/include/
+!/external/libselinux/include/selinux/
+!/external/libselinux/src/
+!/external/f2fs-tools/
+!/external/f2fs-tools/include/
+!/external/f2fs-tools/lib/
+!/external/f2fs-tools/mkfs/
+!/build/
+!/build/core/
+!/build/core/version_defaults.mk
+!/build/core/combo/
+!/build/core/combo/include/
+!/build/core/combo/include/arch/
+!/build/core/combo/include/arch/linux-*/
+!/build/core/combo/include/arch/linux-*/AndroidConfig.h
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/adb.mk b/meta-oe/recipes-devtools/android-tools/android-tools/adb.mk
new file mode 100644
index 0000000..0687c22
--- /dev/null
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/adb.mk
@@ -0,0 +1,72 @@
+# Makefile for adb
+
+SRCDIR ?= $(S)
+
+VPATH += $(SRCDIR)/system/core/adb
+adb_SRC_FILES += adb.c
+adb_SRC_FILES += console.c
+adb_SRC_FILES += transport.c
+adb_SRC_FILES += transport_local.c
+adb_SRC_FILES += transport_usb.c
+adb_SRC_FILES += commandline.c
+adb_SRC_FILES += adb_client.c
+adb_SRC_FILES += adb_auth_host.c
+adb_SRC_FILES += sockets.c
+adb_SRC_FILES += services.c
+adb_SRC_FILES += file_sync_client.c
+adb_SRC_FILES += get_my_path_linux.c
+adb_SRC_FILES += usb_linux.c
+adb_SRC_FILES += usb_vendors.c
+adb_SRC_FILES += fdevent.c
+adb_OBJS := $(adb_SRC_FILES:.c=.o)
+
+VPATH += $(SRCDIR)/system/core/libcutils
+libcutils_SRC_FILES += atomic.c
+libcutils_SRC_FILES += hashmap.c
+libcutils_SRC_FILES += native_handle.c
+libcutils_SRC_FILES += config_utils.c
+libcutils_SRC_FILES += cpu_info.c
+libcutils_SRC_FILES += load_file.c
+# libcutils_SRC_FILES += open_memstream.c
+# libcutils_SRC_FILES += strdup16to8.c
+# libcutils_SRC_FILES += strdup8to16.c
+# libcutils_SRC_FILES += record_stream.c
+# libcutils_SRC_FILES += process_name.c
+# libcutils_SRC_FILES += threads.c
+# libcutils_SRC_FILES += sched_policy.c
+# libcutils_SRC_FILES += iosched_policy.c
+libcutils_SRC_FILES += str_parms.c
+libcutils_SRC_FILES += fs.c
+libcutils_SRC_FILES += multiuser.c
+libcutils_SRC_FILES += socket_inaddr_any_server.c
+libcutils_SRC_FILES += socket_local_client.c
+libcutils_SRC_FILES += socket_local_server.c
+libcutils_SRC_FILES += socket_loopback_client.c
+libcutils_SRC_FILES += socket_loopback_server.c
+libcutils_SRC_FILES += socket_network_client.c
+libcutils_SRC_FILES += sockets.c
+libcutils_SRC_FILES += ashmem-host.c
+libcutils_SRC_FILES += dlmalloc_stubs.c
+libcutils_OBJS := $(libcutils_SRC_FILES:.c=.o)
+
+CFLAGS += -DANDROID
+CFLAGS += -DWORKAROUND_BUG6558362
+CFLAGS += -DADB_HOST=1
+CFLAGS += -D_XOPEN_SOURCE -D_GNU_SOURCE
+CFLAGS += -DANDROID_SMP=0
+CFLAGS += -I$(SRCDIR)/system/core/adb
+CFLAGS += -I$(SRCDIR)/system/core/include
+CFLAGS += -include $(SRCDIR)/build/core/combo/include/arch/$(android_arch)/AndroidConfig.h
+
+LIBS += libcutils.a -lpthread -lcrypto
+
+all: adb
+
+adb: libcutils.a $(adb_OBJS)
+	$(CC) -o $@ $(LDFLAGS) $(adb_OBJS) $(LIBS)
+
+libcutils.a: $(libcutils_OBJS)
+	$(AR) rcs $@ $(libcutils_OBJS)
+
+clean:
+	$(RM) $(adb_OBJS) $(libcutils_OBJS) adb *.a
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/adbd.mk b/meta-oe/recipes-devtools/android-tools/android-tools/adbd.mk
new file mode 100644
index 0000000..84cd06b
--- /dev/null
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/adbd.mk
@@ -0,0 +1,163 @@
+# Makefile for adbd
+
+SRCDIR ?= $(S)
+
+VPATH += $(SRCDIR)/system/core/adb
+adbd_SRC_FILES += adb.c
+adbd_SRC_FILES += fdevent.c
+adbd_SRC_FILES += transport.c
+adbd_SRC_FILES += transport_local.c
+adbd_SRC_FILES += transport_usb.c
+adbd_SRC_FILES += adb_auth_client.c
+adbd_SRC_FILES += sockets.c
+adbd_SRC_FILES += services.c
+adbd_SRC_FILES += file_sync_service.c
+adbd_SRC_FILES += jdwp_service.c
+adbd_SRC_FILES += framebuffer_service.c
+adbd_SRC_FILES += remount_service.c
+adbd_SRC_FILES += disable_verity_service.c
+adbd_SRC_FILES += usb_linux_client.c
+adbd_OBJS := $(adbd_SRC_FILES:.c=.o)
+
+VPATH += $(SRCDIR)/system/core/liblog
+liblog_SRC_FILES += logd_write.c
+liblog_SRC_FILES += log_event_write.c
+liblog_SRC_FILES += logprint.c
+liblog_SRC_FILES += event_tag_map.c
+liblog_SRC_FILES += fake_log_device.c
+liblog_OBJS := $(liblog_SRC_FILES:.c=.o)
+
+VPATH += $(SRCDIR)/system/core/fs_mgr
+fs_mgr_SRC_FILES += fs_mgr_fstab.c
+fs_mgr_OBJS := $(fs_mgr_SRC_FILES:.c=.o)
+
+VPATH += $(SRCDIR)/system/core/libcutils
+libcutils_SRC_FILES += atomic.c
+libcutils_SRC_FILES += hashmap.c
+libcutils_SRC_FILES += native_handle.c
+libcutils_SRC_FILES += config_utils.c
+libcutils_SRC_FILES += cpu_info.c
+libcutils_SRC_FILES += load_file.c
+# libcutils_SRC_FILES += open_memstream.c
+# libcutils_SRC_FILES += strdup16to8.c
+# libcutils_SRC_FILES += strdup8to16.c
+# libcutils_SRC_FILES += record_stream.c
+# libcutils_SRC_FILES += process_name.c
+# libcutils_SRC_FILES += threads.c
+# libcutils_SRC_FILES += sched_policy.c
+# libcutils_SRC_FILES += iosched_policy.c
+libcutils_SRC_FILES += str_parms.c
+libcutils_SRC_FILES += fs.c
+libcutils_SRC_FILES += multiuser.c
+libcutils_SRC_FILES += socket_inaddr_any_server.c
+libcutils_SRC_FILES += socket_local_client.c
+libcutils_SRC_FILES += socket_local_server.c
+libcutils_SRC_FILES += socket_loopback_client.c
+libcutils_SRC_FILES += socket_loopback_server.c
+libcutils_SRC_FILES += socket_network_client.c
+libcutils_SRC_FILES += sockets.c
+libcutils_SRC_FILES += ashmem-host.c
+libcutils_SRC_FILES += dlmalloc_stubs.c
+libcutils_SRC_FILES += klog.c
+libcutils_SRC_FILES += properties.c
+libcutils_OBJS := $(libcutils_SRC_FILES:.c=.o)
+
+VPATH += $(SRCDIR)/external/libselinux/src
+libselinux_SRC_FILES += booleans.c
+libselinux_SRC_FILES += canonicalize_context.c
+libselinux_SRC_FILES += disable.c
+libselinux_SRC_FILES += enabled.c
+libselinux_SRC_FILES += fgetfilecon.c
+libselinux_SRC_FILES += fsetfilecon.c
+libselinux_SRC_FILES += getenforce.c
+libselinux_SRC_FILES += getfilecon.c
+libselinux_SRC_FILES += getpeercon.c
+libselinux_SRC_FILES += lgetfilecon.c
+libselinux_SRC_FILES += load_policy.c
+libselinux_SRC_FILES += lsetfilecon.c
+libselinux_SRC_FILES += policyvers.c
+libselinux_SRC_FILES += procattr.c
+libselinux_SRC_FILES += setenforce.c
+libselinux_SRC_FILES += setfilecon.c
+libselinux_SRC_FILES += context.c
+libselinux_SRC_FILES += mapping.c
+libselinux_SRC_FILES += stringrep.c
+libselinux_SRC_FILES += compute_create.c
+libselinux_SRC_FILES += compute_av.c
+libselinux_SRC_FILES += avc.c
+libselinux_SRC_FILES += avc_internal.c
+libselinux_SRC_FILES += avc_sidtab.c
+libselinux_SRC_FILES += get_initial_context.c
+libselinux_SRC_FILES += checkAccess.c
+libselinux_SRC_FILES += sestatus.c
+libselinux_SRC_FILES += deny_unknown.c
+
+libselinux_SRC_FILES += callbacks.c
+libselinux_SRC_FILES += check_context.c
+libselinux_SRC_FILES += freecon.c
+libselinux_SRC_FILES += init.c
+libselinux_SRC_FILES += label.c
+libselinux_SRC_FILES += label_file.c
+libselinux_SRC_FILES += label_android_property.c
+libselinux_OBJS := $(libselinux_SRC_FILES:.c=.o)
+
+VPATH += $(SRCDIR)/system/extras/ext4_utils
+libext4_utils_SRC_FILES += make_ext4fs.c
+libext4_utils_SRC_FILES += ext4fixup.c
+libext4_utils_SRC_FILES += ext4_utils.c
+libext4_utils_SRC_FILES += allocate.c
+libext4_utils_SRC_FILES += contents.c
+libext4_utils_SRC_FILES += extent.c
+libext4_utils_SRC_FILES += indirect.c
+libext4_utils_SRC_FILES += uuid.c
+libext4_utils_SRC_FILES += sha1.c
+libext4_utils_SRC_FILES += wipe.c
+libext4_utils_SRC_FILES += crc16.c
+libext4_utils_SRC_FILES += ext4_sb.c
+libext4_utils_OBJS := $(libext4_utils_SRC_FILES:.c=.o)
+
+CFLAGS += -std=gnu11
+CFLAGS += -DANDROID
+CFLAGS += -DADB_HOST=0
+CFLAGS += -D_XOPEN_SOURCE -D_GNU_SOURCE
+CFLAGS += -DALLOW_ADBD_ROOT=1
+CFLAGS += -DALLOW_ADBD_DISABLE_VERITY=1
+CFLAGS += -DPROP_NAME_MAX=32
+CFLAGS += -DPROP_VALUE_MAX=92
+CFLAGS += -DAUDITD_LOG_TAG=1003
+# CFLAGS += -DHOST
+CFLAGS += -DANDROID_SMP=0
+CFLAGS += -I$(SRCDIR)/system/core/adb
+CFLAGS += -I$(SRCDIR)/system/core/include
+CFLAGS += -I$(SRCDIR)/system/core/libsparse/include
+CFLAGS += -I$(SRCDIR)/system/extras/ext4_utils
+CFLAGS += -I$(SRCDIR)/system/core/fs_mgr/include
+CFLAGS += -I$(SRCDIR)/hardware/libhardware/include
+CFLAGS += -I$(SRCDIR)/external/libselinux/include
+CFLAGS += -include $(SRCDIR)/build/core/combo/include/arch/$(android_arch)/AndroidConfig.h
+
+LIBS += liblog.a libfs_mgr.a libcutils.a libselinux.a libext4_utils.a -lpthread -lbsd -lpcre -lresolv -lcrypto
+
+all: adbd
+
+adbd: liblog.a libfs_mgr.a libcutils.a libselinux.a libext4_utils.a $(adbd_OBJS)
+	$(CC) -o $@ $(LDFLAGS) $(adbd_OBJS) $(LIBS)
+
+liblog.a: $(liblog_OBJS)
+	$(AR) rcs $@ $(liblog_OBJS)
+
+libfs_mgr.a: $(fs_mgr_OBJS)
+	$(AR) rcs $@ $(fs_mgr_OBJS)
+
+libcutils.a: $(libcutils_OBJS)
+	$(AR) rcs $@ $(libcutils_OBJS)
+
+libselinux.a: $(libselinux_OBJS)
+	export CFLAGS="-DANDROID -DHOST"
+	$(AR) rcs $@ $(libselinux_OBJS)
+
+libext4_utils.a: $(libext4_utils_OBJS)
+	$(AR) rcs $@ $(libext4_utils_OBJS)
+
+clean:
+	$(RM) *.o *.a adbd
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/android-tools-adbd.service b/meta-oe/recipes-devtools/android-tools/android-tools/android-tools-adbd.service
new file mode 100644
index 0000000..88ed687
--- /dev/null
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/android-tools-adbd.service
@@ -0,0 +1,12 @@
+[Unit]
+Description=Android Debug Bridge
+
+[Service]
+Type=simple
+Restart=on-failure
+ExecStartPre=/usr/bin/android-gadget-setup adb
+ExecStart=/usr/bin/adbd
+StandardOutput=null
+
+[Install]
+WantedBy=basic.target
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/define-shell-command.patch b/meta-oe/recipes-devtools/android-tools/android-tools/define-shell-command.patch
new file mode 100644
index 0000000..8381967
--- /dev/null
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/define-shell-command.patch
@@ -0,0 +1,23 @@
+Description: we intend to run on Linux system so the shell is always /bin/sh,
+             for the host or the target.
+Author: Fathi Boudra <fabo@debian.org>
+
+Upstream-Status: Inappropriate
+---
+ system/core/adb/services.c |    4 ----
+ 1 file changed, 4 deletions(-)
+
+--- a/system/core/adb/services.c
++++ b/system/core/adb/services.c
+@@ -299,11 +299,7 @@ static int create_subproc_raw(const char
+ }
+ #endif  /* !ABD_HOST */
+ 
+-#if ADB_HOST
+ #define SHELL_COMMAND "/bin/sh"
+-#else
+-#define SHELL_COMMAND "/system/bin/sh"
+-#endif
+ 
+ #if !ADB_HOST
+ static void subproc_waiter_service(int fd, void *cookie)
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/ext4_utils.mk b/meta-oe/recipes-devtools/android-tools/android-tools/ext4_utils.mk
new file mode 100644
index 0000000..c18aa9c
--- /dev/null
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/ext4_utils.mk
@@ -0,0 +1,103 @@
+# Makefile for ext4_utils
+
+SRCDIR ?= $(S)
+
+VPATH += $(SRCDIR)/system/extras/ext4_utils
+make_ext4fs_SRC_FILES += make_ext4fs_main.c
+make_ext4fs_SRC_FILES += canned_fs_config.c
+make_ext4fs_OBJS := $(make_ext4fs_SRC_FILES:.c=.o)
+
+ext2simg_SRC_FILES += ext2simg.c
+ext2simg_OBJS := $(ext2simg_SRC_FILES:.c=.o)
+
+ext4fixup_SRC_FILES += ext4fixup_main.c
+ext4fixup_OBJS := $(ext4fixup_SRC_FILES:.c=.o)
+
+libext4_utils_SRC_FILES += make_ext4fs.c
+libext4_utils_SRC_FILES += ext4fixup.c
+libext4_utils_SRC_FILES += ext4_utils.c
+libext4_utils_SRC_FILES += allocate.c
+libext4_utils_SRC_FILES += contents.c
+libext4_utils_SRC_FILES += extent.c
+libext4_utils_SRC_FILES += indirect.c
+libext4_utils_SRC_FILES += uuid.c
+libext4_utils_SRC_FILES += sha1.c
+libext4_utils_SRC_FILES += wipe.c
+libext4_utils_SRC_FILES += crc16.c
+libext4_utils_SRC_FILES += ext4_sb.c
+libext4_utils_OBJS := $(libext4_utils_SRC_FILES:.c=.o)
+
+VPATH += $(SRCDIR)/system/core/libsparse
+simg2img_SRC_FILES += simg2img.c
+simg2img_SRC_FILES += sparse_crc32.c
+simg2img_OBJS := $(simg2img_SRC_FILES:.c=.o)
+
+img2simg_SRC_FILES += img2simg.c
+img2simg_OBJS := $(img2simg_SRC_FILES:.c=.o)
+
+simg2simg_SRC_FILES += simg2simg.c
+simg2simg_SRC_FILES += sparse_crc32.c
+simg2simg_OBJS := $(simg2simg_SRC_FILES:.c=.o)
+
+libsparse_SRC_FILES += backed_block.c
+libsparse_SRC_FILES += output_file.c
+libsparse_SRC_FILES += sparse.c
+libsparse_SRC_FILES += sparse_crc32.c
+libsparse_SRC_FILES += sparse_err.c
+libsparse_SRC_FILES += sparse_read.c
+libsparse_OBJS := $(libsparse_SRC_FILES:.c=.o)
+
+VPATH += $(SRCDIR)/external/libselinux/src
+libselinux_SRC_FILES += callbacks.c
+libselinux_SRC_FILES += check_context.c
+libselinux_SRC_FILES += freecon.c
+libselinux_SRC_FILES += init.c
+libselinux_SRC_FILES += label.c
+libselinux_SRC_FILES += label_file.c
+libselinux_SRC_FILES += label_android_property.c
+libselinux_OBJS := $(libselinux_SRC_FILES:.c=.o)
+
+CFLAGS += -DANDROID
+CFLAGS += -DHOST
+CFLAGS += -I$(SRCDIR)/system/extras/ext4_utils
+CFLAGS += -I$(SRCDIR)/system/core/include
+CFLAGS += -I$(SRCDIR)/system/core/libsparse/include
+CFLAGS += -I$(SRCDIR)/external/libselinux/include
+CFLAGS += -include $(SRCDIR)/build/core/combo/include/arch/$(android_arch)/AndroidConfig.h
+
+all: make_ext4fs ext2simg ext4fixup simg2img img2simg simg2simg
+
+make_ext4fs: libext4_utils.a libsparse.a libselinux.a $(make_ext4fs_OBJS)
+	$(CC) -o $@ $(LDFLAGS) $(make_ext4fs_OBJS) \
+		libext4_utils.a libsparse.a libselinux.a -lz -lpcre
+
+ext2simg: libext4_utils.a libselinux.a libsparse.a $(ext2simg_OBJS)
+	$(CC) -o $@ $(LDFLAGS) $(ext2simg_OBJS) \
+		libext4_utils.a libselinux.a libsparse.a -lz -lpcre
+
+ext4fixup: libext4_utils.a libsparse.a $(ext4fixup_OBJS)
+	$(CC) -o $@ $(LDFLAGS) $(ext4fixup_OBJS) libext4_utils.a libsparse.a -lz
+
+simg2img: libsparse.a $(simg2img_OBJS)
+	$(CC) -o $@ $(LDFLAGS) $(simg2img_OBJS) libsparse.a -lz
+
+img2simg: libsparse.a $(img2simg_OBJS)
+	$(CC) -o $@ $(LDFLAGS) $(img2simg_OBJS) libsparse.a -lz
+
+simg2simg: libsparse.a $(simg2simg_OBJS)
+	$(CC) -o $@ $(LDFLAGS) $(simg2simg_OBJS) libsparse.a -lz
+
+libext4_utils.a: $(libext4_utils_OBJS)
+	$(AR) rcs $@ $(libext4_utils_OBJS)
+
+libsparse.a: $(libsparse_OBJS)
+	$(AR) rcs $@ $(libsparse_OBJS)
+
+libselinux.a: $(libselinux_OBJS)
+	$(AR) rcs $@ $(libselinux_OBJS)
+
+clean:
+	$(RM) $(make_ext4fs_OBJS) $(ext2simg_OBJS) $(ext4fixup_OBJS) \
+		$(simg2img_OBJS) $(img2simg_OBJS) $(simg2simg_OBJS) \
+		$(libext4_utils_OBJS) $(libsparse_OBJS) $(libselinux_OBJS) \
+		make_ext4fs ext2simg ext4fixup simg2img img2simg simg2simg *.a
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/fastboot.mk b/meta-oe/recipes-devtools/android-tools/android-tools/fastboot.mk
new file mode 100644
index 0000000..b9ba95f
--- /dev/null
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/fastboot.mk
@@ -0,0 +1,89 @@
+# Makefile for fastboot
+
+SRCDIR ?= $(S)
+
+VPATH += $(SRCDIR)/system/core/fastboot
+fastboot_SRC_FILES += protocol.c
+fastboot_SRC_FILES += engine.c
+fastboot_SRC_FILES += bootimg.c
+fastboot_SRC_FILES += fastboot.c
+fastboot_SRC_FILES += util.c
+fastboot_SRC_FILES += fs.c
+fastboot_SRC_FILES += usb_linux.c
+fastboot_SRC_FILES += util_linux.c
+fastboot_OBJS := $(fastboot_SRC_FILES:.c=.o)
+
+VPATH += $(SRCDIR)/system/core/libzipfile
+libzipfile_SRC_FILES += centraldir.c
+libzipfile_SRC_FILES += zipfile.c
+libzipfile_OBJS := $(libzipfile_SRC_FILES:.c=.o)
+
+VPATH += $(SRCDIR)/system/extras/ext4_utils
+libext4_utils_SRC_FILES += make_ext4fs.c
+libext4_utils_SRC_FILES += ext4fixup.c
+libext4_utils_SRC_FILES += ext4_utils.c
+libext4_utils_SRC_FILES += allocate.c
+libext4_utils_SRC_FILES += contents.c
+libext4_utils_SRC_FILES += extent.c
+libext4_utils_SRC_FILES += indirect.c
+libext4_utils_SRC_FILES += uuid.c
+libext4_utils_SRC_FILES += sha1.c
+libext4_utils_SRC_FILES += wipe.c
+libext4_utils_SRC_FILES += crc16.c
+libext4_utils_SRC_FILES += ext4_sb.c
+libext4_utils_OBJS := $(libext4_utils_SRC_FILES:.c=.o)
+
+VPATH += $(SRCDIR)/system/core/libsparse
+libsparse_SRC_FILES += backed_block.c
+libsparse_SRC_FILES += output_file.c
+libsparse_SRC_FILES += sparse.c
+libsparse_SRC_FILES += sparse_crc32.c
+libsparse_SRC_FILES += sparse_err.c
+libsparse_SRC_FILES += sparse_read.c
+libsparse_OBJS := $(libsparse_SRC_FILES:.c=.o)
+
+VPATH += $(SRCDIR)/external/libselinux/src
+libselinux_SRC_FILES += callbacks.c
+libselinux_SRC_FILES += check_context.c
+libselinux_SRC_FILES += freecon.c
+libselinux_SRC_FILES += init.c
+libselinux_SRC_FILES += label.c
+libselinux_SRC_FILES += label_file.c
+libselinux_SRC_FILES += label_android_property.c
+libselinux_OBJS := $(libselinux_SRC_FILES:.c=.o)
+
+CFLAGS += -std=gnu11
+CFLAGS += -DANDROID
+# CFLAGS += -DUSE_F2FS
+CFLAGS += -DHOST
+CFLAGS += -I$(SRCDIR)/system/core/fastboot
+CFLAGS += -I$(SRCDIR)/system/core/include
+CFLAGS += -I$(SRCDIR)/system/core/mkbootimg
+CFLAGS += -I$(SRCDIR)/system/extras/ext4_utils
+CFLAGS += -I$(SRCDIR)/system/extras/f2fs_utils
+CFLAGS += -I$(SRCDIR)/system/core/libsparse/include
+CFLAGS += -I$(SRCDIR)/external/libselinux/include
+CFLAGS += -include $(SRCDIR)/build/core/combo/include/arch/$(android_arch)/AndroidConfig.h
+
+LIBS += libzipfile.a libext4_utils.a libsparse.a libselinux.a -lz -lpcre
+
+all: fastboot
+
+fastboot: libzipfile.a libext4_utils.a libsparse.a libselinux.a $(fastboot_OBJS)
+	$(CC) -o $@ $(LDFLAGS) $(fastboot_OBJS) $(LIBS)
+
+libzipfile.a: $(libzipfile_OBJS)
+	$(AR) rcs $@ $(libzipfile_OBJS)
+
+libext4_utils.a: $(libext4_utils_OBJS)
+	$(AR) rcs $@ $(libext4_utils_OBJS)
+
+libsparse.a: $(libsparse_OBJS)
+	$(AR) rcs $@ $(libsparse_OBJS)
+
+libselinux.a: $(libselinux_OBJS)
+	$(AR) rcs $@ $(libselinux_OBJS)
+
+clean:
+	$(RM) $(fastboot_OBJS) $(libzipfile_OBJS) $(libext4_utils_OBJS) \
+		$(libsparse_OBJS) $(libselinux_OBJS) fastboot *.a
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/implicit-declaration-function-strlcat-strlcopy.patch b/meta-oe/recipes-devtools/android-tools/android-tools/implicit-declaration-function-strlcat-strlcopy.patch
new file mode 100644
index 0000000..64db616
--- /dev/null
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/implicit-declaration-function-strlcat-strlcopy.patch
@@ -0,0 +1,42 @@
+Description: fix implicit declaration of stlcat/strlcopy functions.
+Author: Fathi Boudra <fabo@debian.org>
+
+Upstream-Status: Inappropriate
+---
+ system/core/adb/adb.c                |    1 +
+ system/core/fs_mgr/fs_mgr_fstab.c    |    2 +-
+ system/core/include/cutils/sockets.h |    2 +-
+ 3 files changed, 3 insertions(+), 2 deletions(-)
+
+--- a/system/core/fs_mgr/fs_mgr_fstab.c
++++ b/system/core/fs_mgr/fs_mgr_fstab.c
+@@ -17,7 +17,7 @@
+ #include <ctype.h>
+ #include <stdio.h>
+ #include <stdlib.h>
+-#include <string.h>
++#include <bsd/string.h>
+ #include <sys/mount.h>
+ 
+ #include "fs_mgr_priv.h"
+--- a/system/core/include/cutils/sockets.h
++++ b/system/core/include/cutils/sockets.h
+@@ -19,7 +19,7 @@
+ 
+ #include <errno.h>
+ #include <stdlib.h>
+-#include <string.h>
++#include <bsd/string.h>
+ #include <stdbool.h>
+ 
+ #ifdef HAVE_WINSOCK
+--- a/system/core/adb/adb.c
++++ b/system/core/adb/adb.c
+@@ -41,6 +41,7 @@
+ #include <sys/prctl.h>
+ #include <getopt.h>
+ #include <selinux/selinux.h>
++#include <grp.h>
+ #else
+ #include "usb_vendors.h"
+ #endif
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/mkbootimg-Add-dt-parameter-to-specify-DT-image.patch b/meta-oe/recipes-devtools/android-tools/android-tools/mkbootimg-Add-dt-parameter-to-specify-DT-image.patch
new file mode 100644
index 0000000..35bb766
--- /dev/null
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/mkbootimg-Add-dt-parameter-to-specify-DT-image.patch
@@ -0,0 +1,108 @@
+From cc5e7b02a3be57709a1aed6e34be100b82a71620 Mon Sep 17 00:00:00 2001
+From: David Ng <dave@codeaurora.org>
+Date: Fri, 27 Jul 2012 17:15:03 -0700
+Subject: [PATCH 1/2] mkbootimg: Add --dt parameter to specify DT image
+
+New optional --dt parameter to specify a kernel device
+tree image.
+
+Change-Id: Ie29a11cbf4138426bfd19ae486d69a5fcbd8f442
+
+Upstream-Status: Inappropriate
+---
+ system/core/mkbootimg/bootimg.h   |    7 +++++--
+ system/core/mkbootimg/mkbootimg.c |   21 +++++++++++++++++++++
+ 2 files changed, 26 insertions(+), 2 deletions(-)
+
+--- a/system/core/mkbootimg/bootimg.h
++++ b/system/core/mkbootimg/bootimg.h
+@@ -41,8 +41,8 @@ struct boot_img_hdr
+ 
+     unsigned tags_addr;    /* physical addr for kernel tags */
+     unsigned page_size;    /* flash page size we assume */
+-    unsigned unused[2];    /* future expansion: should be 0 */
+-
++    unsigned dt_size;      /* device tree in bytes */
++    unsigned unused;       /* future expansion: should be 0 */
+     unsigned char name[BOOT_NAME_SIZE]; /* asciiz product name */
+ 
+     unsigned char cmdline[BOOT_ARGS_SIZE];
+@@ -64,10 +64,13 @@ struct boot_img_hdr
+ ** +-----------------+
+ ** | second stage    | o pages
+ ** +-----------------+
++** | device tree     | p pages
++** +-----------------+
+ **
+ ** n = (kernel_size + page_size - 1) / page_size
+ ** m = (ramdisk_size + page_size - 1) / page_size
+ ** o = (second_size + page_size - 1) / page_size
++** p = (dt_size + page_size - 1) / page_size
+ **
+ ** 0. all entities are page_size aligned in flash
+ ** 1. kernel and ramdisk are required (size != 0)
+--- a/system/core/mkbootimg/mkbootimg.c
++++ b/system/core/mkbootimg/mkbootimg.c
+@@ -65,6 +65,7 @@ int usage(void)
+             "       [ --board <boardname> ]\n"
+             "       [ --base <address> ]\n"
+             "       [ --pagesize <pagesize> ]\n"
++            "       [ --dt <filename> ]\n"
+             "       -o|--output <filename>\n"
+             );
+     return 1;
+@@ -105,6 +106,8 @@ int main(int argc, char **argv)
+     char *cmdline = "";
+     char *bootimg = 0;
+     char *board = "";
++    char *dt_fn = 0;
++    void *dt_data = 0;
+     unsigned pagesize = 2048;
+     int fd;
+     SHA_CTX ctx;
+@@ -158,6 +161,8 @@ int main(int argc, char **argv)
+                 fprintf(stderr,"error: unsupported page size %d\n", pagesize);
+                 return -1;
+             }
++        } else if(!strcmp(arg, "--dt")) {
++            dt_fn = val;
+         } else {
+             return usage();
+         }
+@@ -232,6 +237,14 @@ int main(int argc, char **argv)
+         }
+     }
+ 
++    if(dt_fn) {
++        dt_data = load_file(dt_fn, &hdr.dt_size);
++        if (dt_data == 0) {
++            fprintf(stderr,"error: could not load device tree image '%s'\n", dt_fn);
++            return 1;
++        }
++    }
++
+     /* put a hash of the contents in the header so boot images can be
+      * differentiated based on their first 2k.
+      */
+@@ -242,6 +255,10 @@ int main(int argc, char **argv)
+     SHA_update(&ctx, &hdr.ramdisk_size, sizeof(hdr.ramdisk_size));
+     SHA_update(&ctx, second_data, hdr.second_size);
+     SHA_update(&ctx, &hdr.second_size, sizeof(hdr.second_size));
++    if(dt_data) {
++        SHA_update(&ctx, dt_data, hdr.dt_size);
++        SHA_update(&ctx, &hdr.dt_size, sizeof(hdr.dt_size));
++    }
+     sha = SHA_final(&ctx);
+     memcpy(hdr.id, sha,
+            SHA_DIGEST_SIZE > sizeof(hdr.id) ? sizeof(hdr.id) : SHA_DIGEST_SIZE);
+@@ -266,6 +283,10 @@ int main(int argc, char **argv)
+         if(write_padding(fd, pagesize, hdr.second_size)) goto fail;
+     }
+ 
++    if(dt_data) {
++        if(write(fd, dt_data, hdr.dt_size) != (ssize_t) hdr.dt_size) goto fail;
++        if(write_padding(fd, pagesize, hdr.dt_size)) goto fail;
++    }
+     return 0;
+ 
+ fail:
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/mkbootimg.mk b/meta-oe/recipes-devtools/android-tools/android-tools/mkbootimg.mk
new file mode 100644
index 0000000..519f609
--- /dev/null
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/mkbootimg.mk
@@ -0,0 +1,29 @@
+# Makefile for mkbootimg
+
+SRCDIR ?= $(S)
+
+VPATH += $(SRCDIR)/system/core/mkbootimg
+mkbootimg_SRC_FILES += mkbootimg.c
+mkbootimg_OBJS := $(mkbootimg_SRC_FILES:.c=.o)
+
+VPATH += $(SRCDIR)/system/core/libmincrypt
+libmincrypt_SRC_FILES := dsa_sig.c p256.c p256_ec.c p256_ecdsa.c rsa.c sha.c sha256.c
+libmincrypt_OBJS := $(libmincrypt_SRC_FILES:.c=.o)
+
+CFLAGS += -DANDROID
+CFLAGS += -I$(SRCDIR)/system/core/mkbootimg
+CFLAGS += -I$(SRCDIR)/system/core/include
+CFLAGS += -include $(SRCDIR)/build/core/combo/include/arch/$(android_arch)/AndroidConfig.h
+
+LIBS += libmincrypt.a
+
+all: mkbootimg
+
+mkbootimg: libmincrypt.a $(mkbootimg_OBJS)
+	$(CC) -o $@ $(LDFLAGS) $(mkbootimg_OBJS) $(LIBS)
+
+libmincrypt.a: $(libmincrypt_OBJS)
+	$(AR) rcs $@ $(libmincrypt_OBJS)
+
+clean:
+	$(RM) $(mkbootimg_OBJS) $(libmincrypt_OBJS) mkbootimg *.a
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/preserve-ownership.patch b/meta-oe/recipes-devtools/android-tools/android-tools/preserve-ownership.patch
new file mode 100644
index 0000000..85af81f
--- /dev/null
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/preserve-ownership.patch
@@ -0,0 +1,72 @@
+Description: add -o argument to preserve ownership
+Author: Markus Mayer <mmayer@mmayer.net>
+
+See also https://android-review.googlesource.com/#/c/100312/
+
+Upstream-Status: Inappropriate
+---
+ system/extras/ext4_utils/make_ext4fs.c      |    6 ++++++
+ system/extras/ext4_utils/make_ext4fs_main.c |   10 ++++++++--
+ 2 files changed, 14 insertions(+), 2 deletions(-)
+
+--- a/system/extras/ext4_utils/make_ext4fs_main.c
++++ b/system/extras/ext4_utils/make_ext4fs_main.c
+@@ -49,13 +49,15 @@ extern struct fs_info info;
+ 
+ extern struct selabel_handle* selinux_android_file_context_handle(void);
+ 
++extern int preserve_owner;
++
+ static void usage(char *path)
+ {
+ 	fprintf(stderr, "%s [ -l <len> ] [ -j <journal size> ] [ -b <block_size> ]\n", basename(path));
+ 	fprintf(stderr, "    [ -g <blocks per group> ] [ -i <inodes> ] [ -I <inode size> ]\n");
+ 	fprintf(stderr, "    [ -L <label> ] [ -f ] [ -a <android mountpoint> ]\n");
+ 	fprintf(stderr, "    [ -S file_contexts ] [ -C fs_config ] [ -T timestamp ]\n");
+-	fprintf(stderr, "    [ -z | -s ] [ -w ] [ -c ] [ -J ] [ -v ] [ -B <block_list_file> ]\n");
++	fprintf(stderr, "    [ -z | -s ] [ -w ] [ -c ] [ -J ] [ -o ] [ -v ] [ -B <block_list_file> ]\n");
+ 	fprintf(stderr, "    <filename> [<directory>]\n");
+ }
+ 
+@@ -81,7 +83,7 @@ int main(int argc, char **argv)
+ 	struct selinux_opt seopts[] = { { SELABEL_OPT_PATH, "" } };
+ #endif
+ 
+-	while ((opt = getopt(argc, argv, "l:j:b:g:i:I:L:a:S:T:C:B:fwzJsctv")) != -1) {
++	while ((opt = getopt(argc, argv, "l:j:b:g:i:I:L:a:S:T:C:B:fwzJsctov")) != -1) {
+ 		switch (opt) {
+ 		case 'l':
+ 			info.len = parse_num(optarg);
+@@ -144,6 +146,10 @@ int main(int argc, char **argv)
+ 			}
+ #endif
+ 			break;
++		case 'o':
++			preserve_owner = 1;
++			printf("Warning: Enabling 'preserve ownership', this is an unofficial feature!\n");
++			break;
+ 		case 'v':
+ 			verbose = 1;
+ 			break;
+--- a/system/extras/ext4_utils/make_ext4fs.c
++++ b/system/extras/ext4_utils/make_ext4fs.c
+@@ -67,6 +67,8 @@
+ 
+ #endif
+ 
++int preserve_owner = 0;
++
+ /* TODO: Not implemented:
+    Allocating blocks in the same block group as the file inode
+    Hash or binary tree directories
+@@ -185,6 +187,10 @@ static u32 build_directory_structure(con
+ 		} else {
+ 			dentries[i].mtime = fixed_time;
+ 		}
++		if (preserve_owner) {
++			dentries[i].uid = stat.st_uid;
++			dentries[i].gid = stat.st_gid;
++		}
+ 		uint64_t capabilities;
+ 		if (fs_config_func != NULL) {
+ #ifdef ANDROID
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/remove-bionic-android.patch b/meta-oe/recipes-devtools/android-tools/android-tools/remove-bionic-android.patch
new file mode 100644
index 0000000..e933724
--- /dev/null
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/remove-bionic-android.patch
@@ -0,0 +1,67 @@
+Description: remove bionic specific calls
+Author: Fathi Boudra <fabo@debian.org>
+
+Upstream-Status: Inappropriate
+---
+ system/core/include/cutils/properties.h |    1 -
+ system/core/libcutils/properties.c      |    2 +-
+ system/core/liblog/logd_write.c         |    5 +++++
+ 3 files changed, 6 insertions(+), 2 deletions(-)
+
+--- a/system/core/include/cutils/properties.h
++++ b/system/core/include/cutils/properties.h
+@@ -19,7 +19,6 @@
+ 
+ #include <sys/cdefs.h>
+ #include <stddef.h>
+-#include <sys/system_properties.h>
+ #include <stdint.h>
+ 
+ #ifdef __cplusplus
+--- a/system/core/liblog/logd_write.c
++++ b/system/core/liblog/logd_write.c
+@@ -23,6 +23,7 @@
+ #include <stdlib.h>
+ #include <string.h>
+ #include <sys/stat.h>
++#include <sys/syscall.h>
+ #include <sys/types.h>
+ #if (FAKE_LOG_DEVICE == 0)
+ #include <sys/socket.h>
+@@ -205,7 +206,11 @@ static int __write_to_log_kernel(log_id_
+     realtime_ts.tv_nsec = ts.tv_nsec;
+ 
+     log_id_buf = log_id;
++#ifdef __BIONIC__
+     tid = gettid();
++#else
++    tid = (pid_t) syscall(__NR_gettid);
++#endif
+ 
+     newVec[0].iov_base   = (unsigned char *) &log_id_buf;
+     newVec[0].iov_len    = sizeof_log_id_t;
+--- a/system/core/libcutils/properties.c
++++ b/system/core/libcutils/properties.c
+@@ -104,10 +104,10 @@ int32_t property_get_int32(const char *k
+     return (int32_t)property_get_imax(key, INT32_MIN, INT32_MAX, default_value);
+ }
+ 
++#undef HAVE_LIBC_SYSTEM_PROPERTIES
+ #ifdef HAVE_LIBC_SYSTEM_PROPERTIES
+ 
+ #define _REALLY_INCLUDE_SYS__SYSTEM_PROPERTIES_H_
+-#include <sys/_system_properties.h>
+ 
+ int property_set(const char *key, const char *value)
+ {
+--- a/external/libselinux/src/procattr.c
++++ b/external/libselinux/src/procattr.c
+@@ -8,7 +8,7 @@
+ #include "selinux_internal.h"
+ #include "policy.h"
+ 
+-#ifdef HOST
++#ifndef __BIONIC__
+ static pid_t gettid(void)
+ {
+ 	return syscall(__NR_gettid);
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/remove-selinux-android.patch b/meta-oe/recipes-devtools/android-tools/android-tools/remove-selinux-android.patch
new file mode 100644
index 0000000..d4a37f8
--- /dev/null
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/remove-selinux-android.patch
@@ -0,0 +1,56 @@
+Subject: drop useless includes of Android SELINUX extensions; avoids having to clone another module; this should be sent upstream
+Author: Sergio Schvezov <sergio.schvezov@canonical.com>
+
+Upstream-Status: Inappropriate
+---
+ system/core/adb/file_sync_service.c         |    3 ---
+ system/extras/ext4_utils/make_ext4fs.c      |    1 -
+ system/extras/ext4_utils/make_ext4fs_main.c |    1 -
+ 3 files changed, 5 deletions(-)
+
+--- a/system/extras/ext4_utils/make_ext4fs.c
++++ b/system/extras/ext4_utils/make_ext4fs.c
+@@ -62,7 +62,6 @@
+ 
+ #include <selinux/selinux.h>
+ #include <selinux/label.h>
+-#include <selinux/android.h>
+ 
+ #define O_BINARY 0
+ 
+--- a/system/extras/ext4_utils/make_ext4fs_main.c
++++ b/system/extras/ext4_utils/make_ext4fs_main.c
+@@ -32,7 +32,6 @@
+ #ifndef USE_MINGW
+ #include <selinux/selinux.h>
+ #include <selinux/label.h>
+-#include <selinux/android.h>
+ #else
+ struct selabel_handle;
+ #endif
+--- a/system/core/adb/file_sync_service.c
++++ b/system/core/adb/file_sync_service.c
+@@ -26,7 +26,6 @@
+ 
+ #include <errno.h>
+ #include <private/android_filesystem_config.h>
+-#include <selinux/android.h>
+ #include "sysdeps.h"
+ 
+ #define TRACE_TAG  TRACE_SYNC
+@@ -73,7 +72,6 @@ static int mkdirs(char *name)
+                 *x = '/';
+                 return ret;
+             }
+-            selinux_android_restorecon(name, 0);
+         }
+         *x++ = '/';
+     }
+@@ -251,7 +249,6 @@ static int handle_send_file(int s, char
+     if(fd >= 0) {
+         struct utimbuf u;
+         adb_close(fd);
+-        selinux_android_restorecon(path, 0);
+         u.actime = timestamp;
+         u.modtime = timestamp;
+         utime(path, &u);
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/use-capability.patch b/meta-oe/recipes-devtools/android-tools/android-tools/use-capability.patch
new file mode 100644
index 0000000..b8ebe09
--- /dev/null
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/use-capability.patch
@@ -0,0 +1,19 @@
+Subject: use linux/capability.h on linux systems too
+Author: Loïc Minier <loic.minier@ubuntu.com>
+
+Upstream-Status: Inappropriate
+---
+ system/core/include/private/android_filesystem_config.h |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+--- a/system/core/include/private/android_filesystem_config.h
++++ b/system/core/include/private/android_filesystem_config.h
+@@ -27,7 +27,7 @@
+ #include <sys/types.h>
+ #include <stdint.h>
+ 
+-#ifdef HAVE_ANDROID_OS
++#if defined(HAVE_ANDROID_OS) || defined(__linux__)
+ #include <linux/capability.h>
+ #else
+ #include "android_filesystem_capability.h"
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/use-local-socket.patch b/meta-oe/recipes-devtools/android-tools/android-tools/use-local-socket.patch
new file mode 100644
index 0000000..7facd61
--- /dev/null
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/use-local-socket.patch
@@ -0,0 +1,62 @@
+Subject: adb: Use local sockets where appropriate
+Author: Hilko Bengen <bengen@debian.org>
+
+Upstream-Status: Inappropriate
+---
+ system/core/adb/adb.c             |    6 +++++-
+ system/core/adb/adb_client.c      |    5 +++--
+ system/core/adb/transport_local.c |    3 ++-
+ 3 files changed, 10 insertions(+), 4 deletions(-)
+
+--- a/system/core/adb/adb.c
++++ b/system/core/adb/adb.c
+@@ -1230,7 +1230,11 @@ int launch_server(int server_port)
+  */
+ void build_local_name(char* target_str, size_t target_size, int server_port)
+ {
+-  snprintf(target_str, target_size, "tcp:%d", server_port);
++  if (gListenAll > 0) {
++    snprintf(target_str, target_size, "tcp:%d", server_port);
++  } else {
++    snprintf(target_str, target_size, "local:%d", server_port);
++  }
+ }
+ 
+ #if !ADB_HOST
+--- a/system/core/adb/adb_client.c
++++ b/system/core/adb/adb_client.c
+@@ -185,12 +185,12 @@ int _adb_connect(const char *service)
+         strcpy(__adb_error, "service name too long");
+         return -1;
+     }
+-    snprintf(tmp, sizeof tmp, "%04x", len);
++    snprintf(tmp, sizeof tmp, "%d", __adb_server_port);
+ 
+     if (__adb_server_name)
+         fd = socket_network_client(__adb_server_name, __adb_server_port, SOCK_STREAM);
+     else
+-        fd = socket_loopback_client(__adb_server_port, SOCK_STREAM);
++        fd = socket_local_client(tmp, ANDROID_SOCKET_NAMESPACE_ABSTRACT, SOCK_STREAM);
+ 
+     if(fd < 0) {
+         strcpy(__adb_error, "cannot connect to daemon");
+@@ -201,6 +201,7 @@ int _adb_connect(const char *service)
+         return -1;
+     }
+ 
++    snprintf(tmp, sizeof tmp, "%04x", len);
+     if(writex(fd, tmp, 4) || writex(fd, service, len)) {
+         strcpy(__adb_error, "write failure during connection");
+         adb_close(fd);
+--- a/system/core/adb/transport_local.c
++++ b/system/core/adb/transport_local.c
+@@ -121,7 +121,8 @@ int local_connect_arbitrary_ports(int co
+     }
+ #endif
+     if (fd < 0) {
+-        fd = socket_loopback_client(adb_port, SOCK_STREAM);
++        snprintf(buf, sizeof buf, "%d", adb_port);
++        fd = socket_local_client(buf, ANDROID_SOCKET_NAMESPACE_ABSTRACT, SOCK_STREAM);
+     }
+ 
+     if (fd >= 0) {
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb b/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
new file mode 100644
index 0000000..2dbddf1
--- /dev/null
+++ b/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
@@ -0,0 +1,136 @@
+DESCRIPTION = "Different utilities from Android"
+SECTION = "console/utils"
+LICENSE = "Apache-2.0 & GPL-2.0 & BSD-2-Clause & BSD-3-Clause"
+LIC_FILES_CHKSUM = " \
+    file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10 \
+    file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6 \
+    file://${COMMON_LICENSE_DIR}/BSD-2-Clause;md5=8bef8e6712b1be5aa76af1ebde9d6378 \
+    file://${COMMON_LICENSE_DIR}/BSD-3-Clause;md5=550794465ba0ec5312d6919e203a55f9 \
+"
+DEPENDS = "libbsd libpcre openssl zlib"
+
+ANDROID_TAG = "android-5.1.1_r37"
+ANDROID_MIRROR = "android.googlesource.com"
+CORE_REPO = "${ANDROID_MIRROR}/platform/system/core"
+EXTRAS_REPO = "${ANDROID_MIRROR}/platform/system/extras"
+LIBHARDWARE_REPO = "${ANDROID_MIRROR}/platform/hardware/libhardware"
+LIBSELINUX_REPO = "${ANDROID_MIRROR}/platform/external/libselinux"
+BUILD_REPO = "${ANDROID_MIRROR}/platform/build"
+
+SRC_URI = " \
+    git://${CORE_REPO};name=core;protocol=https;nobranch=1;destsuffix=git/system/core;tag=${ANDROID_TAG} \
+    git://${EXTRAS_REPO};name=extras;protocol=https;nobranch=1;destsuffix=git/system/extras;tag=${ANDROID_TAG} \
+    git://${LIBHARDWARE_REPO};name=libhardware;protocol=https;nobranch=1;destsuffix=git/hardware/libhardware;tag=${ANDROID_TAG} \
+    git://${LIBSELINUX_REPO};name=libselinux;protocol=https;nobranch=1;destsuffix=git/external/libselinux;tag=${ANDROID_TAG} \
+    git://${BUILD_REPO};name=build;protocol=https;nobranch=1;destsuffix=git/build;tag=${ANDROID_TAG} \
+    file://remove-selinux-android.patch;apply=yes \
+    file://use-capability.patch;apply=yes \
+    file://use-local-socket.patch;apply=yes \
+    file://preserve-ownership.patch;apply=yes \
+    file://mkbootimg-Add-dt-parameter-to-specify-DT-image.patch;apply=yes \
+    file://remove-bionic-android.patch;apply=yes \
+    file://define-shell-command.patch;apply=yes \
+    file://implicit-declaration-function-strlcat-strlcopy.patch;apply=yes \
+    file://android-tools-adbd.service \
+    file://.gitignore;subdir=git \
+    file://adb.mk;subdir=${BPN} \
+    file://adbd.mk;subdir=${BPN} \
+    file://ext4_utils.mk;subdir=${BPN} \
+    file://fastboot.mk;subdir=${BPN} \
+    file://mkbootimg.mk;subdir=${BPN} \
+"
+
+S = "${WORKDIR}/git"
+B = "${WORKDIR}/${BPN}"
+
+inherit systemd
+
+SYSTEMD_SERVICE_${PN} = "android-tools-adbd.service"
+
+# Get rid of files uneeded to build Android tools
+do_unpack_extra() {
+    cd ${S}
+    rm -rf \
+      system/core/.git \
+      system/extras/.git \
+      hardware/libhardware/.git \
+      external/libselinux/.git \
+      build/.git
+    git init
+    git add .
+    git commit -m \
+      "Initial import - committed ${ANDROID_TAG}"
+    git clean -fdx
+}
+
+addtask unpack_extra after do_unpack before do_patch
+
+do_compile() {
+    # Setting both variables below causing our makefiles to not work with
+    # implicit make rules
+    unset CFLAGS
+    unset CPPFLAGS
+
+    export SRCDIR=${S}
+
+    case "${HOST_ARCH}" in
+      arm)
+        export android_arch=linux-arm
+      ;;
+      aarch64)
+        export android_arch=linux-arm64
+      ;;
+      mips|mipsel)
+        export android_arch=linux-mips
+      ;;
+      powerpc|powerpc64)
+        export android_arch=linux-ppc
+      ;;
+      i586|x86_64)
+        export android_arch=linux-x86
+      ;;
+    esac
+
+    tools="adb fastboot ext4_utils mkbootimg adbd"
+    for tool in ${tools}; do
+      mkdir -p ${B}/${tool}
+      oe_runmake -f ${B}/${tool}.mk -C ${B}/${tool}
+    done
+}
+
+do_install() {
+    install -D -p -m0755 ${S}/system/core/libsparse/simg_dump.py ${D}${bindir}/simg_dump
+    install -D -p -m0755 ${S}/system/extras/ext4_utils/mkuserimg.sh ${D}${bindir}/mkuserimg
+
+    install -m0755 ${B}/ext4_utils/ext2simg ${D}${bindir}
+    install -m0755 ${B}/ext4_utils/ext4fixup ${D}${bindir}
+    install -m0755 ${B}/ext4_utils/img2simg ${D}${bindir}
+    install -m0755 ${B}/ext4_utils/make_ext4fs ${D}${bindir}
+    install -m0755 ${B}/ext4_utils/simg2img ${D}${bindir}
+    install -m0755 ${B}/ext4_utils/simg2simg ${D}${bindir}
+
+    install -m0755 ${B}/adb/adb ${D}${bindir}
+    install -m0755 ${B}/adbd/adbd ${D}${bindir}
+    install -m0755 ${B}/fastboot/fastboot ${D}${bindir}
+    install -m0755 ${B}/mkbootimg/mkbootimg ${D}${bindir}
+
+    install -D -p -m0644 ${WORKDIR}/android-tools-adbd.service \
+      ${D}${systemd_unitdir}/system/android-tools-adbd.service
+}
+
+PACKAGES += "${PN}-fstools"
+
+RDEPENDS_${BPN} = "${BPN}-conf bash"
+
+FILES_${PN}-fstools = "\
+    ${bindir}/ext2simg \
+    ${bindir}/ext4fixup \
+    ${bindir}/img2simg \
+    ${bindir}/make_ext4fs \
+    ${bindir}/simg2img \
+    ${bindir}/simg2simg \
+    ${bindir}/simg_dump \
+    ${bindir}/mkuserimg \
+"
+
+BBCLASSEXTEND += "native"
-- 
2.9.3


