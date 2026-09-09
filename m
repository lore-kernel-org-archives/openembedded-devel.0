Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EAB0C79FB8
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 08:32:26 +0000 (UTC)
Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7117.1788942745790814258
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Sep 2026 01:32:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=EHpnIglh;
 spf=pass (domain: gmail.com, ip: 74.125.228.12, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cebcb8d7so553320a12.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Sep 2026 01:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788942745; x=1789547545; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b5eQs/cJU6umPsOYJkpRIBNMDQxqxysnOnR/ttBPP/c=;
        b=EHpnIglhnGn2vRAKlS256R8vbGExi3AzubdvBB0Yh0ieXFDAMogE/pUzTo3L0sqWzW
         E1yD8P/Gra80rJ2NiAVYpsP/apJzb9fybbg9cHuoLQsgC0urZerw9M9/3Nvh1CQXXBJl
         KkCGR+CdO9Fj6ILV3Qw7q6hHqoTT1VvwYhqRiQBL2VUBiTn4M3AjpXFVLtjahGfeX3tm
         H/OQgC3hlFSJfLO1AtyDi8ZAkv897zHoH6HQouPw7jfvBpoI0QJxnvb4Aw1O3FUtj4Ui
         KUm7ce07ciu3qfStUhBR1l66C+JhlCEMmPjkRoSmE3kdpDx6Hrto+5pGdKG9sS2jbdE4
         kHnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788942745; x=1789547545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=b5eQs/cJU6umPsOYJkpRIBNMDQxqxysnOnR/ttBPP/c=;
        b=RCLH+G/ZYR+37R1IbkbV4k/20PU4mz68U1Lo6380CNQPpS+9KQI94eYz9uomKgCff0
         qKyB3WJfdhIzuD2VLAwQFWZy6/gw26+EOsmo3YRO2g6Moim6T5gUa0AFUt070mZm1UXc
         6Q37htFekqOr/eMLadDi995aE0kBXWyNx6WynnkOPDWRDxunbiASuG+dRiIhCsFz+0F2
         HdqxFcHvfRvDLqs/dN7Ln7HAV32QiREclvGae3mnxaO25g6ihv6qglGYzSJ9Qx7OHfA1
         moo4ytt4qTEQryEVG+1mImfVvqnj7vT3KQ1n/DQNqSPt5zyfSRcCF585//DTswfdTF7E
         MiaQ==
X-Gm-Message-State: AFuF++lUd7R1BmkOJsYkqqoNMOtyay1iq/Acah/HDG6wIUr9tUBN+bZQ
	1q5TBM86nBnqxxuG3p5zJQor07k/MSbNy8ik5OqdEO1OX+vhw+vh9h2C9dZyE7A0
X-Gm-Gg: AYBFou2CVqUcVNeu3X/rhI1dJPIP2uPdjQ29TSclKEjQ3EvA3wtLO5azHUKR6E6CDS7
	IiGM99RtotWJrf6I1BrkQxNTr5BUTvx3PWPXFYe3zrQgBie8NnHCil0z3lasadR22qW31ynUQOs
	6aw/ZFrPSondmiQNxFsU0JJF7Q1DjOEfPXEZ7gRhDLSIc7SVveVI7LO47q2TJEyTbEeaf1Gpt+f
	1NZnwNi6QcKwTke62uvmkMB21VNvy9QwZdwvMsxK+N78cb4hoFxBdGB2cYTCGoAOQCHgSwNsPF0
	0Xa38vzwDLUocH95i88tOcOcoekcsFliG663LE7P2LupG8LrHayfNT1fwSauSSA/gdlSJTb775b
	beWgt7vr2t3KfhQ0DbKZgxgD8W/aVzSRQktrKvcWf9LixJEWMxG4P//Yyn3gp9wb073s5ZNkcDw
	3QOCk6fwKM/8hk8mWPzP/IcIxfqdfjouPd+5BM5dgJpVHp6qTl4k5l5M9HEJ5hLTKx8YXw7PKMb
	xTK0+BG8sVQbRfBUx6Emj0=
X-Received: by 2002:a17:90b:5743:b0:38e:c232:9d2c with SMTP id 98e67ed59e1d1-39b8bc9422emr8683507a91.2.1788942744990;
        Wed, 09 Sep 2026 01:32:24 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39cfa5c1d17sm788649a91.4.2026.09.09.01.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 01:32:24 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 12/15] freerdp3: patch CVE-2026-66401
Date: Wed,  9 Sep 2026 20:31:37 +1200
Message-ID: <20260909083140.2494932-12-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260909083140.2494932-1-ankur.tyagi85@gmail.com>
References: <20260909083140.2494932-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Sep 2026 08:32:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129883

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Backport commit matching GitHub advisory[1]

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-66401

[1]https://github.com/FreeRDP/FreeRDP/security/advisories/GHSA-8jj2-67pg-j6mg

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../freerdp/freerdp3/CVE-2026-66401.patch     | 86 +++++++++++++++++++
 .../freerdp/freerdp3_3.24.2.bb                |  1 +
 2 files changed, 87 insertions(+)
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-66401.patch

diff --git a/meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-66401.patch b/meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-66401.patch
new file mode 100644
index 0000000000..480db4836c
--- /dev/null
+++ b/meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-66401.patch
@@ -0,0 +1,86 @@
+From 60d0c34ad36ea163b5937d1c9ce657d23dac0f1e Mon Sep 17 00:00:00 2001
+From: Armin Novak <armin.novak@thincast.com>
+Date: Sun, 12 Jul 2026 11:45:50 +0200
+Subject: [PATCH] [channels,rdpecam] fix reading of config descriptor
+
+(cherry picked from commit 1d35ecb77e2469cbc29da14c180777eb514d70cd)
+
+CVE: CVE-2026-66401
+Upstream-Status: Backport [https://github.com/FreeRDP/FreeRDP/commit/1d35ecb77e2469cbc29da14c180777eb514d70cd]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ channels/rdpecam/client/v4l/uvc_h264.c | 49 +++++++++++++++++---------
+ 1 file changed, 33 insertions(+), 16 deletions(-)
+
+diff --git a/channels/rdpecam/client/v4l/uvc_h264.c b/channels/rdpecam/client/v4l/uvc_h264.c
+index 30f0cf4b4..a3c716478 100644
+--- a/channels/rdpecam/client/v4l/uvc_h264.c
++++ b/channels/rdpecam/client/v4l/uvc_h264.c
+@@ -23,6 +23,8 @@
+  * limitations under the License.
+  */
+ 
++#include <winpr/wtypes.h>
++
+ #include <sys/ioctl.h>
+ 
+ #include <linux/uvcvideo.h>
+@@ -347,26 +349,41 @@ static uint8_t get_guid_unit_id_from_config_descriptor(struct libusb_config_desc
+ 			if (interface->bInterfaceClass != LIBUSB_CLASS_VIDEO ||
+ 			    interface->bInterfaceSubClass != USB_VIDEO_CONTROL)
+ 				continue;
++			if (interface->extra_length < 0)
++				continue;
+ 
+-			const uint8_t* ptr = interface->extra;
+-			while (ptr < interface->extra + interface->extra_length)
++			size_t offset = 0;
++			const size_t extraLen = WINPR_ASSERTING_INT_CAST(size_t, interface->extra_length);
++			while (offset < extraLen)
+ 			{
+-				const xu_descriptor* desc = (const xu_descriptor*)ptr;
+-				if (desc->bDescriptorType == USB_VIDEO_CONTROL_INTERFACE &&
+-				    desc->bDescriptorSubType == USB_VIDEO_CONTROL_XU_TYPE &&
+-				    memcmp(desc->guidExtensionCode, guid, 16) == 0)
++				const size_t remaining = extraLen - offset;
++				if (remaining < 3)
++					break;
++				const xu_descriptor* desc = (const xu_descriptor*)&interface->extra[offset];
++
++				WINPR_STATIC_ASSERT(sizeof(xu_descriptor) == 16 + 4);
++				const size_t bLength = WINPR_ASSERTING_INT_CAST(size_t, desc->bLength);
++				if ((desc->bLength <= 0) || (bLength > remaining))
++					break;
++
++				if ((desc->bDescriptorType == USB_VIDEO_CONTROL_INTERFACE) &&
++				    (desc->bDescriptorSubType == USB_VIDEO_CONTROL_XU_TYPE) &&
++				    (bLength >= sizeof(xu_descriptor)))
+ 				{
+-					int8_t unit_id = desc->bUnitID;
+-
+-					WLog_DBG(TAG,
+-					         "For camera %04" PRIx16 ":%04" PRIx16
+-					         " found UVCX H264 UnitID %" PRId8,
+-					         ddesc->idVendor, ddesc->idProduct, unit_id);
+-					if (unit_id < 0)
+-						return 0;
+-					return WINPR_CXX_COMPAT_CAST(uint8_t, unit_id);
++					if (memcmp(desc->guidExtensionCode, guid, 16) == 0)
++					{
++						int8_t unit_id = desc->bUnitID;
++
++						WLog_DBG(TAG,
++						         "For camera %04" PRIx16 ":%04" PRIx16
++						         " found UVCX H264 UnitID %" PRId8,
++						         ddesc->idVendor, ddesc->idProduct, unit_id);
++						if (unit_id < 0)
++							return 0;
++						return WINPR_CXX_COMPAT_CAST(uint8_t, unit_id);
++					}
+ 				}
+-				ptr += desc->bLength;
++				offset += bLength;
+ 			}
+ 		}
+ 	}
diff --git a/meta-oe/recipes-support/freerdp/freerdp3_3.24.2.bb b/meta-oe/recipes-support/freerdp/freerdp3_3.24.2.bb
index 493fa94c4c..7051cbeacc 100644
--- a/meta-oe/recipes-support/freerdp/freerdp3_3.24.2.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp3_3.24.2.bb
@@ -23,6 +23,7 @@ SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;nobranch=1;protocol=https;tag=${
            file://CVE-2026-63652.patch \
            file://CVE-2026-64620.patch \
            file://CVE-2026-64621.patch \
+           file://CVE-2026-66401.patch \
 "
 
 

