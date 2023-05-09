Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05E86C7EE22
	for <webhook@archiver.kernel.org>; Tue,  9 May 2023 04:04:59 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by mx.groups.io with SMTP id smtpd.web10.23815.1683605090633784767
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 May 2023 21:04:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=KQxH15ZW;
 spf=pass (domain: intel.com, ip: 134.134.136.100, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683605090; x=1715141090;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=U2FaNaZ+ZV4ihf9A3Lidh89wwaVh+QQje/95MFG+/UM=;
  b=KQxH15ZWVoZhOgotR7o6OU4zQdZKW1nPJ3uHOXz5/L/lQNuCwYtUHAuM
   rEC7B6nduagVUkUAWaFx64zdIwFHpRXg2BjgofzkutCsdf87P4JaElcvw
   AT7Z9bVfzZdUWBRKYfzceErCVLKWCRUjW7qBYpJZ1EPRdDd7JTnlgYu7u
   k5hX3HzR8TyOuhJeiRTr94FLBX8dWVJMjs7i6ezheZrSXyo2j/HT2etea
   TEHszRATJ5QkCCQJwboHPCnXI+RMIvR0Ucg/WEmf90P8dmiLzksH2PKif
   zVNzgBcu5Mo9CmZNRr0PI8fQw8R/URXPECsfNwhbXDIwtWd1mRSlozZ60
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="415369857"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; 
   d="scan'208";a="415369857"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2023 21:04:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="729317042"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; 
   d="scan'208";a="729317042"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by orsmga008.jf.intel.com with ESMTP; 08 May 2023 21:04:47 -0700
From: chee.yang.lee@intel.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone 1/2] freerdp: fix CVE-2022-39316/39318/39319
Date: Tue,  9 May 2023 11:53:08 +0800
Message-Id: <20230509035309.3773590-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 May 2023 04:04:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102461

From: Chee Yang Lee <chee.yang.lee@intel.com>

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
---
 .../freerdp/freerdp/CVE-2022-39316.patch      | 53 +++++++++++++++++++
 .../freerdp/CVE-2022-39318-39319.patch        | 41 ++++++++++++++
 .../recipes-support/freerdp/freerdp_2.6.1.bb  |  2 +
 3 files changed, 96 insertions(+)
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp/CVE-2022-39316.patch
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp/CVE-2022-39318-39319.patch

diff --git a/meta-oe/recipes-support/freerdp/freerdp/CVE-2022-39316.patch b/meta-oe/recipes-support/freerdp/freerdp/CVE-2022-39316.patch
new file mode 100644
index 0000000000..a60b2854c8
--- /dev/null
+++ b/meta-oe/recipes-support/freerdp/freerdp/CVE-2022-39316.patch
@@ -0,0 +1,53 @@
+https://github.com/FreeRDP/FreeRDP/commit/e865c24efc40ebc52e75979c94cdd4ee2c1495b0
+CVE: CVE-2022-39316
+Upstream-Status: Backport
+Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
+
+From e865c24efc40ebc52e75979c94cdd4ee2c1495b0 Mon Sep 17 00:00:00 2001
+From: akallabeth <akallabeth@posteo.net>
+Date: Thu, 13 Oct 2022 09:09:28 +0200
+Subject: [PATCH] Added missing length checks in zgfx_decompress_segment
+
+(cherry picked from commit 64716b335858109d14f27b51acc4c4d71a92a816)
+---
+ libfreerdp/codec/zgfx.c | 11 +++++++----
+ 1 file changed, 7 insertions(+), 4 deletions(-)
+
+diff --git a/libfreerdp/codec/zgfx.c b/libfreerdp/codec/zgfx.c
+index 20fbd354571..e260aa6e28a 100644
+--- a/libfreerdp/codec/zgfx.c
++++ b/libfreerdp/codec/zgfx.c
+@@ -230,19 +230,19 @@ static BOOL zgfx_decompress_segment(ZGFX_CONTEXT* zgfx, wStream* stream, size_t
+ 	BYTE* pbSegment;
+ 	size_t cbSegment;
+ 
+-	if (!zgfx || !stream)
++	if (!zgfx || !stream || (segmentSize < 2))
+ 		return FALSE;
+ 
+ 	cbSegment = segmentSize - 1;
+ 
+-	if ((Stream_GetRemainingLength(stream) < segmentSize) || (segmentSize < 1) ||
+-	    (segmentSize > UINT32_MAX))
++	if ((Stream_GetRemainingLength(stream) < segmentSize) || (segmentSize > UINT32_MAX))
+ 		return FALSE;
+ 
+ 	Stream_Read_UINT8(stream, flags); /* header (1 byte) */
+ 	zgfx->OutputCount = 0;
+ 	pbSegment = Stream_Pointer(stream);
+-	Stream_Seek(stream, cbSegment);
++	if (!Stream_SafeSeek(stream, cbSegment))
++		return FALSE;
+ 
+ 	if (!(flags & PACKET_COMPRESSED))
+ 	{
+@@ -346,6 +346,9 @@ static BOOL zgfx_decompress_segment(ZGFX_CONTEXT* zgfx, wStream* stream, size_t
+ 						if (count > sizeof(zgfx->OutputBuffer) - zgfx->OutputCount)
+ 							return FALSE;
+ 
++						if (count > zgfx->cBitsRemaining / 8)
++							return FALSE;
++
+ 						CopyMemory(&(zgfx->OutputBuffer[zgfx->OutputCount]), zgfx->pbInputCurrent,
+ 						           count);
+ 						zgfx_history_buffer_ring_write(zgfx, zgfx->pbInputCurrent, count);
diff --git a/meta-oe/recipes-support/freerdp/freerdp/CVE-2022-39318-39319.patch b/meta-oe/recipes-support/freerdp/freerdp/CVE-2022-39318-39319.patch
new file mode 100644
index 0000000000..76a9e00dd3
--- /dev/null
+++ b/meta-oe/recipes-support/freerdp/freerdp/CVE-2022-39318-39319.patch
@@ -0,0 +1,41 @@
+https://github.com/FreeRDP/FreeRDP/commit/80adde17ddc4b596ed1dae0922a0c54ab3d4b8ea
+CVE: CVE-2022-39318 CVE-2022-39319
+Upstream-Status: Backport
+Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
+
+From 80adde17ddc4b596ed1dae0922a0c54ab3d4b8ea Mon Sep 17 00:00:00 2001
+From: akallabeth <akallabeth@posteo.net>
+Date: Thu, 13 Oct 2022 08:27:41 +0200
+Subject: [PATCH] Fixed division by zero in urbdrc
+
+(cherry picked from commit 731f8419d04b481d7160de1f34062d630ed48765)
+---
+ channels/urbdrc/client/libusb/libusb_udevice.c | 12 +++++++++---
+ 1 file changed, 9 insertions(+), 3 deletions(-)
+
+diff --git a/channels/urbdrc/client/libusb/libusb_udevice.c b/channels/urbdrc/client/libusb/libusb_udevice.c
+index 505c31d7b55..ef87f195f38 100644
+--- a/channels/urbdrc/client/libusb/libusb_udevice.c
++++ b/channels/urbdrc/client/libusb/libusb_udevice.c
+@@ -1221,12 +1221,18 @@ static int libusb_udev_isoch_transfer(IUDEVICE* idev, URBDRC_CHANNEL_CALLBACK* c
+ 	if (!Buffer)
+ 		Stream_Seek(user_data->data, (NumberOfPackets * 12));
+ 
+-	iso_packet_size = BufferSize / NumberOfPackets;
+-	iso_transfer = libusb_alloc_transfer(NumberOfPackets);
++	if (NumberOfPackets > 0)
++	{
++		iso_packet_size = BufferSize / NumberOfPackets;
++		iso_transfer = libusb_alloc_transfer((int)NumberOfPackets);
++	}
+ 
+ 	if (iso_transfer == NULL)
+ 	{
+-		WLog_Print(urbdrc->log, WLOG_ERROR, "Error: libusb_alloc_transfer.");
++		WLog_Print(urbdrc->log, WLOG_ERROR,
++		           "Error: libusb_alloc_transfer [NumberOfPackets=%" PRIu32 ", BufferSize=%" PRIu32
++		           " ]",
++		           NumberOfPackets, BufferSize);
+ 		async_transfer_user_data_free(user_data);
+ 		return -1;
+ 	}
diff --git a/meta-oe/recipes-support/freerdp/freerdp_2.6.1.bb b/meta-oe/recipes-support/freerdp/freerdp_2.6.1.bb
index ece2f56960..9da8b27c0d 100644
--- a/meta-oe/recipes-support/freerdp/freerdp_2.6.1.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp_2.6.1.bb
@@ -16,6 +16,8 @@ PKGV = "${GITPKGVTAG}"
 SRCREV = "658a72980f6e93241d927c46cfa664bf2547b8b1"
 SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;branch=stable-2.0;protocol=https \
     file://winpr-makecert-Build-with-install-RPATH.patch \
+    file://CVE-2022-39316.patch \
+    file://CVE-2022-39318-39319.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
2.37.3


