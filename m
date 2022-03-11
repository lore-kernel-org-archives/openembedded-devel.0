Return-Path: <macpaul.lin@mediatek.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BA63C433F5
	for <webhook@archiver.kernel.org>; Fri, 11 Mar 2022 07:57:38 +0000 (UTC)
Received: from mailgw01.mediatek.com (mailgw01.mediatek.com [60.244.123.138])
 by mx.groups.io with SMTP id smtpd.web10.3304.1646985456948451255
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Mar 2022 23:57:37 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: mediatek.com, ip: 60.244.123.138, mailfrom: macpaul.lin@mediatek.com)
X-UUID: f461dfee1a534be2b5e9a55a5576fbd9-20220311
X-UUID: f461dfee1a534be2b5e9a55a5576fbd9-20220311
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw01.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1155209436; Fri, 11 Mar 2022 15:57:19 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Fri, 11 Mar 2022 15:57:18 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 11 Mar 2022 15:57:18 +0800
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: <openembedded-devel@lists.openembedded.org>, <raj.khem@gmail.com>
CC: Miles Chen <miles.chen@mediatek.com>, Bear Wang <bear.wang@mediatek.com>,
	Pablo Sun <pablo.sun@mediatek.com>, Fabien Parent <fparent@baylibre.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>, Macpaul Lin <macpaul@gmail.com>,
	Jiacheng Liu <jiacheng.liu@mediatek.com>
Subject: [meta-oe][PATCH] android-tools: adb: add u3 ss descriptor support
Date: Fri, 11 Mar 2022 15:57:10 +0800
Message-ID: <20220311075710.29970-1-macpaul.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Mar 2022 07:57:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95948

Porting u3 Superspeed descriptor support to open-embedded android-tools package.
This patch origins from the the patch in android project [1], but has been
modified for backporting to android-tools_5.1.1.r37.

[1] https://android.googlesource.com/platform/system/core/+/d6ee9f26a5163af4121f4380264fcbd4e6851a17%5E%21

Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
Signed-off-by: Jiacheng Liu <jiacheng.liu@mediatek.com>
---
 ...add-u3-ss-descriptor-support-for-adb.patch | 342 ++++++++++++++++++
 .../android-tools/android-tools_5.1.1.r37.bb  |   1 +
 2 files changed, 343 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/core/0014-add-u3-ss-descriptor-support-for-adb.patch

diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/core/0014-add-u3-ss-descriptor-support-for-adb.patch b/meta-oe/recipes-devtools/android-tools/android-tools/core/0014-add-u3-ss-descriptor-support-for-adb.patch
new file mode 100644
index 000000000..05973aaaf
--- /dev/null
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/core/0014-add-u3-ss-descriptor-support-for-adb.patch
@@ -0,0 +1,342 @@
+From dae9a11f3a158357966399aef97c48b5f16934d9 Mon Sep 17 00:00:00 2001
+From: Jiacheng Liu <jiacheng.liu@mediatek.com>
+Date: Sat, 24 Jul 2021 11:01:18 +0800
+Subject: [PATCH] android-tools: adb: add u3 ss descriptor support
+
+Porting u3 Superspeed descriptor support to open-embedded android-tools package.
+This patch origins from the the patch in android project [1], but has been
+modified for backporting to android-tools_5.1.1.r37.
+
+[1] https://android.googlesource.com/platform/system/core/+/d6ee9f26a5163af4121f4380264fcbd4e6851a17%5E%21
+
+Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
+Signed-off-by: Jiacheng Liu <jiacheng.liu@mediatek.com>
+---
+ adb/usb_linux_client.c | 275 +++++++++++++++++++++++++++++++----------
+ 1 file changed, 207 insertions(+), 68 deletions(-)
+
+diff --git a/adb/usb_linux_client.c b/adb/usb_linux_client.c
+index 6e8b5bb..884e85e 100644
+--- a/adb/usb_linux_client.c
++++ b/adb/usb_linux_client.c
+@@ -31,8 +31,10 @@
+ #define   TRACE_TAG  TRACE_USB
+ #include "adb.h"
+ 
++#define USB_EXT_PROP_UNICODE    1
+ #define MAX_PACKET_SIZE_FS	64
+ #define MAX_PACKET_SIZE_HS	512
++#define MAX_PACKET_SIZE_SS	1024
+ 
+ #if __BYTE_ORDER == __LITTLE_ENDIAN
+ # define cpu_to_le16(x) (x)
+@@ -62,74 +64,185 @@ struct usb_handle
+     int bulk_in;  /* "in" from the host's perspective => sink for adbd */
+ };
+ 
+-static const struct {
+-    struct usb_functionfs_descs_head header;
+-    struct {
+-        struct usb_interface_descriptor intf;
+-        struct usb_endpoint_descriptor_no_audio source;
+-        struct usb_endpoint_descriptor_no_audio sink;
+-    } __attribute__((packed)) fs_descs, hs_descs;
+-} __attribute__((packed)) descriptors = {
+-    .header = {
+-        .magic = cpu_to_le32(FUNCTIONFS_DESCRIPTORS_MAGIC),
+-        .length = cpu_to_le32(sizeof(descriptors)),
+-        .fs_count = 3,
+-        .hs_count = 3,
++struct func_desc {
++    struct usb_interface_descriptor intf;
++    struct usb_endpoint_descriptor_no_audio source;
++    struct usb_endpoint_descriptor_no_audio sink;
++} __attribute__((packed));
++
++struct ss_func_desc {
++    struct usb_interface_descriptor intf;
++    struct usb_endpoint_descriptor_no_audio source;
++    struct usb_ss_ep_comp_descriptor source_comp;
++    struct usb_endpoint_descriptor_no_audio sink;
++    struct usb_ss_ep_comp_descriptor sink_comp;
++} __attribute__((packed));
++
++struct desc_v1 {
++    struct usb_functionfs_descs_head_v1 {
++        __le32 magic;
++        __le32 length;
++        __le32 fs_count;
++        __le32 hs_count;
++    } __attribute__((packed)) header;
++    struct func_desc fs_descs, hs_descs;
++} __attribute__((packed));
++
++struct usb_os_desc_ext_prop {
++    uint32_t dwSize;
++    uint32_t dwPropertyDataType;
++
++    // Property name and value are transmitted as UTF-16, but the kernel only
++    // accepts ASCII values and performs the conversion for us.
++    uint16_t wPropertyNameLength;
++    char bPropertyName[20];
++
++    uint32_t dwPropertyDataLength;
++    char bProperty[39];
++} __attribute__((packed)) os_desc_guid = {
++    .dwSize = sizeof(struct usb_os_desc_ext_prop),
++    .dwPropertyDataType = cpu_to_le32(USB_EXT_PROP_UNICODE),
++    .wPropertyNameLength = cpu_to_le16(20),
++    .bPropertyName = "DeviceInterfaceGUID",
++    .dwPropertyDataLength = cpu_to_le32(39),
++    .bProperty = "{F72FE0D4-CBCB-407D-8814-9ED673D0DD6B}",
++};
++
++struct usb_ext_prop_values {
++    struct usb_os_desc_ext_prop guid;
++} __attribute__((packed));
++
++struct desc_v2 {
++    struct usb_functionfs_descs_head_v2 header;
++    // The rest of the structure depends on the flags in the header.
++    __le32 fs_count;
++    __le32 hs_count;
++    __le32 ss_count;
++    __le32 os_count;
++    struct func_desc fs_descs, hs_descs;
++    struct ss_func_desc ss_descs;
++    struct usb_os_desc_header os_header;
++    struct usb_ext_compat_desc os_desc;
++    struct usb_os_desc_header os_prop_header;
++    struct usb_ext_prop_values os_prop_values;
++} __attribute__((packed));
++
++static struct func_desc fs_descriptors = {
++    .intf = {
++        .bLength = sizeof(fs_descriptors.intf),
++        .bDescriptorType = USB_DT_INTERFACE,
++        .bInterfaceNumber = 0,
++        .bNumEndpoints = 2,
++        .bInterfaceClass = ADB_CLASS,
++        .bInterfaceSubClass = ADB_SUBCLASS,
++        .bInterfaceProtocol = ADB_PROTOCOL,
++        .iInterface = 1, /* first string from the provided table */
++    },
++    .source = {
++        .bLength = sizeof(fs_descriptors.source),
++        .bDescriptorType = USB_DT_ENDPOINT,
++        .bEndpointAddress = 1 | USB_DIR_OUT,
++        .bmAttributes = USB_ENDPOINT_XFER_BULK,
++        .wMaxPacketSize = MAX_PACKET_SIZE_FS,
++    },
++    .sink = {
++        .bLength = sizeof(fs_descriptors.sink),
++        .bDescriptorType = USB_DT_ENDPOINT,
++        .bEndpointAddress = 2 | USB_DIR_IN,
++        .bmAttributes = USB_ENDPOINT_XFER_BULK,
++        .wMaxPacketSize = MAX_PACKET_SIZE_FS,
++    },
++};
++
++static struct func_desc hs_descriptors = {
++    .intf = {
++        .bLength = sizeof(hs_descriptors.intf),
++        .bDescriptorType = USB_DT_INTERFACE,
++        .bInterfaceNumber = 0,
++        .bNumEndpoints = 2,
++        .bInterfaceClass = ADB_CLASS,
++        .bInterfaceSubClass = ADB_SUBCLASS,
++        .bInterfaceProtocol = ADB_PROTOCOL,
++        .iInterface = 1, /* first string from the provided table */
++    },
++    .source = {
++        .bLength = sizeof(hs_descriptors.source),
++        .bDescriptorType = USB_DT_ENDPOINT,
++        .bEndpointAddress = 1 | USB_DIR_OUT,
++        .bmAttributes = USB_ENDPOINT_XFER_BULK,
++        .wMaxPacketSize = MAX_PACKET_SIZE_HS,
++    },
++    .sink = {
++        .bLength = sizeof(hs_descriptors.sink),
++        .bDescriptorType = USB_DT_ENDPOINT,
++        .bEndpointAddress = 2 | USB_DIR_IN,
++        .bmAttributes = USB_ENDPOINT_XFER_BULK,
++        .wMaxPacketSize = MAX_PACKET_SIZE_HS,
++    },
++};
++
++static struct ss_func_desc ss_descriptors = {
++    .intf = {
++        .bLength = sizeof(ss_descriptors.intf),
++        .bDescriptorType = USB_DT_INTERFACE,
++        .bInterfaceNumber = 0,
++        .bNumEndpoints = 2,
++        .bInterfaceClass = ADB_CLASS,
++        .bInterfaceSubClass = ADB_SUBCLASS,
++        .bInterfaceProtocol = ADB_PROTOCOL,
++        .iInterface = 1, /* first string from the provided table */
++    },
++    .source = {
++        .bLength = sizeof(ss_descriptors.source),
++        .bDescriptorType = USB_DT_ENDPOINT,
++        .bEndpointAddress = 1 | USB_DIR_OUT,
++        .bmAttributes = USB_ENDPOINT_XFER_BULK,
++        .wMaxPacketSize = MAX_PACKET_SIZE_SS,
++    },
++    .source_comp = {
++        .bLength = sizeof(ss_descriptors.source_comp),
++        .bDescriptorType = USB_DT_SS_ENDPOINT_COMP,
++        .bMaxBurst = 4,
+     },
+-    .fs_descs = {
+-        .intf = {
+-            .bLength = sizeof(descriptors.fs_descs.intf),
+-            .bDescriptorType = USB_DT_INTERFACE,
+-            .bInterfaceNumber = 0,
+-            .bNumEndpoints = 2,
+-            .bInterfaceClass = ADB_CLASS,
+-            .bInterfaceSubClass = ADB_SUBCLASS,
+-            .bInterfaceProtocol = ADB_PROTOCOL,
+-            .iInterface = 1, /* first string from the provided table */
+-        },
+-        .source = {
+-            .bLength = sizeof(descriptors.fs_descs.source),
+-            .bDescriptorType = USB_DT_ENDPOINT,
+-            .bEndpointAddress = 1 | USB_DIR_OUT,
+-            .bmAttributes = USB_ENDPOINT_XFER_BULK,
+-            .wMaxPacketSize = MAX_PACKET_SIZE_FS,
+-        },
+-        .sink = {
+-            .bLength = sizeof(descriptors.fs_descs.sink),
+-            .bDescriptorType = USB_DT_ENDPOINT,
+-            .bEndpointAddress = 2 | USB_DIR_IN,
+-            .bmAttributes = USB_ENDPOINT_XFER_BULK,
+-            .wMaxPacketSize = MAX_PACKET_SIZE_FS,
+-        },
++    .sink = {
++        .bLength = sizeof(ss_descriptors.sink),
++        .bDescriptorType = USB_DT_ENDPOINT,
++        .bEndpointAddress = 2 | USB_DIR_IN,
++        .bmAttributes = USB_ENDPOINT_XFER_BULK,
++        .wMaxPacketSize = MAX_PACKET_SIZE_SS,
+     },
+-    .hs_descs = {
+-        .intf = {
+-            .bLength = sizeof(descriptors.hs_descs.intf),
+-            .bDescriptorType = USB_DT_INTERFACE,
+-            .bInterfaceNumber = 0,
+-            .bNumEndpoints = 2,
+-            .bInterfaceClass = ADB_CLASS,
+-            .bInterfaceSubClass = ADB_SUBCLASS,
+-            .bInterfaceProtocol = ADB_PROTOCOL,
+-            .iInterface = 1, /* first string from the provided table */
+-        },
+-        .source = {
+-            .bLength = sizeof(descriptors.hs_descs.source),
+-            .bDescriptorType = USB_DT_ENDPOINT,
+-            .bEndpointAddress = 1 | USB_DIR_OUT,
+-            .bmAttributes = USB_ENDPOINT_XFER_BULK,
+-            .wMaxPacketSize = MAX_PACKET_SIZE_HS,
+-        },
+-        .sink = {
+-            .bLength = sizeof(descriptors.hs_descs.sink),
+-            .bDescriptorType = USB_DT_ENDPOINT,
+-            .bEndpointAddress = 2 | USB_DIR_IN,
+-            .bmAttributes = USB_ENDPOINT_XFER_BULK,
+-            .wMaxPacketSize = MAX_PACKET_SIZE_HS,
+-        },
++    .sink_comp = {
++        .bLength = sizeof(ss_descriptors.sink_comp),
++        .bDescriptorType = USB_DT_SS_ENDPOINT_COMP,
++        .bMaxBurst = 4,
+     },
+ };
+ 
++struct usb_ext_compat_desc os_desc_compat = {
++    .bFirstInterfaceNumber = 0,
++    .Reserved1 = cpu_to_le32(1),
++    .CompatibleID = { 'W', 'I', 'N', 'U', 'S', 'B', '\0', '\0'},
++    .SubCompatibleID = {0},
++    .Reserved2 = {0},
++};
++
++static struct usb_os_desc_header os_desc_header = {
++    .interface = cpu_to_le32(0),
++    .dwLength = cpu_to_le32(sizeof(os_desc_header) + sizeof(os_desc_compat)),
++    .bcdVersion = cpu_to_le32(1),
++    .wIndex = cpu_to_le32(4),
++    .bCount = cpu_to_le32(1),
++    .Reserved = cpu_to_le32(0),
++};
++
++static struct usb_os_desc_header os_prop_header = {
++    .interface = cpu_to_le32(0),
++    .dwLength = cpu_to_le32(sizeof(os_desc_header) + sizeof(struct usb_ext_prop_values)),
++    .bcdVersion = cpu_to_le32(1),
++    .wIndex = cpu_to_le32(5),
++    .wCount = cpu_to_le16(1),
++};
++
+ #define STR_INTERFACE_ "ADB Interface"
+ 
+ static const struct {
+@@ -151,8 +264,6 @@ static const struct {
+     },
+ };
+ 
+-
+-
+ static void *usb_adb_open_thread(void *x)
+ {
+     struct usb_handle *usb = (struct usb_handle *)x;
+@@ -270,6 +381,24 @@ static void usb_adb_init()
+ static void init_functionfs(struct usb_handle *h)
+ {
+     ssize_t ret;
++    struct desc_v1 v1_descriptor = {};
++    struct desc_v2 v2_descriptor = {};
++
++    v2_descriptor.header.magic = cpu_to_le32(FUNCTIONFS_DESCRIPTORS_MAGIC_V2);
++    v2_descriptor.header.length = cpu_to_le32(sizeof(v2_descriptor));
++    v2_descriptor.header.flags = FUNCTIONFS_HAS_FS_DESC | FUNCTIONFS_HAS_HS_DESC |
++                                 FUNCTIONFS_HAS_SS_DESC | FUNCTIONFS_HAS_MS_OS_DESC;
++    v2_descriptor.fs_count = 3;
++    v2_descriptor.hs_count = 3;
++    v2_descriptor.ss_count = 5;
++    v2_descriptor.os_count = 2;
++    v2_descriptor.fs_descs = fs_descriptors;
++    v2_descriptor.hs_descs = hs_descriptors;
++    v2_descriptor.ss_descs = ss_descriptors;
++    v2_descriptor.os_header = os_desc_header;
++    v2_descriptor.os_desc = os_desc_compat;
++    v2_descriptor.os_prop_header = os_prop_header;
++    v2_descriptor.os_prop_values.guid = os_desc_guid;
+ 
+     if (h->control < 0) { // might have already done this before
+         D("OPENING %s\n", USB_FFS_ADB_EP0);
+@@ -279,10 +408,20 @@ static void init_functionfs(struct usb_handle *h)
+             goto err;
+         }
+ 
+-        ret = adb_write(h->control, &descriptors, sizeof(descriptors));
++        ret = adb_write(h->control, &v2_descriptor, sizeof(v2_descriptor));
+         if (ret < 0) {
+-            D("[ %s: write descriptors failed: errno=%d ]\n", USB_FFS_ADB_EP0, errno);
+-            goto err;
++            D("[ %s: write v2_descriptor failed: errno=%d ]\n", USB_FFS_ADB_EP0, errno);
++            v1_descriptor.header.magic = cpu_to_le32(FUNCTIONFS_DESCRIPTORS_MAGIC);
++            v1_descriptor.header.length = cpu_to_le32(sizeof(v1_descriptor));
++            v1_descriptor.header.fs_count = 3;
++            v1_descriptor.header.hs_count = 3;
++            v1_descriptor.fs_descs = fs_descriptors;
++            v1_descriptor.hs_descs = hs_descriptors;
++	    ret = adb_write(h->control, &v1_descriptor, sizeof(v1_descriptor));
++	    if (ret < 0) {
++		D("[ %s: failed to write USB descriptors]\n", USB_FFS_ADB_EP0);
++		goto err;
++	    }
+         }
+ 
+         ret = adb_write(h->control, &strings, sizeof(strings));
+-- 
+2.18.0
+
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb b/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
index ef440471b..b6c788388 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
+++ b/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
@@ -40,6 +40,7 @@ SRC_URI = " \
     file://core/0012-Fix-implicit-declaration-of-stlcat-strlcopy-function.patch;patchdir=system/core \
     file://core/adb_libssl_11.diff;patchdir=system/core \
     file://core/0013-adb-Support-riscv64.patch;patchdir=system/core \
+    file://core/0014-add-u3-ss-descriptor-support-for-adb.patch;patchdir=system/core \
     file://extras/0001-ext4_utils-remove-selinux-extensions.patch;patchdir=system/extras \
     file://extras/0002-ext4_utils-add-o-argument-to-preserve-ownership.patch;patchdir=system/extras \
     file://libselinux/0001-Remove-bionic-specific-calls.patch;patchdir=external/libselinux \
-- 
2.18.0


