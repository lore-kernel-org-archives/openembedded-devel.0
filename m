Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
	[209.85.216.68])
	by mail.openembedded.org (Postfix) with ESMTP id 466CE61B85
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Mar 2020 00:06:40 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id l36so7251664pjb.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Mar 2020 17:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=L/zx2sioXGr5FHVvHKIuhKSHjY6OkbFNBUNnb1MQf/A=;
	b=EHFqfz9unaJ5D+ebFLpUR1ErtZBlHDddsoXRdSoU798/g45XjbK7YzQ4aF3oyNzC1P
	hziG0tx+lIQzDdYPJkU3v9s9CKejPW+LpWGx+0kNU9pVPzCN2SEJQkQMdLRHuf/VZ2U5
	mq0+9jDlJWO5rOIRxq0TjQQI15o9E8iXLoNOlleYudxWpQtNNxxiOC3IwZz5uv0VWCdZ
	3tG/BTmF9LnM2bDdvtc7u6zSvPo+mW/ztKx+pXmALr4xMzk1y5gHCNktTkrhyjxM9OYm
	qUmLTLP7PjIQsyt8Lu6zYwWL41w8m5q5cGRRT9uazGwnNPJKjpEGNxAMaEUHlImYcdhs
	TOiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=L/zx2sioXGr5FHVvHKIuhKSHjY6OkbFNBUNnb1MQf/A=;
	b=BwKx85usJxnQ+rPSaOfwocMks+nW0Vc3wzGeG0QoQ/gPmxR83FAymk65N0+6KMZVk6
	fYY5j5sN07e+Lm+6xlHx5/soJJsmIdDGSNJq68BrScepwj3SFSyb792UJR4W7LU2CHtX
	TjLsG4d1pQGS41zfL7Z2CbwvgepAk8Z7PMHEAVRQ5IxEMuENitFsBkf/nMcubA95zd9n
	YsR1/T2bM8XJh6TVrz0huHp94b1QuO1VcPU8PZDseaLGUvFygwz3u5py4swHZmM0shgf
	KxUmdirdj3bVldqIK3JF5ThnqD1FTTHDOX/UwweJPK8BrKGBrlYNs7WyQF32dJSnFiOF
	Cwog==
X-Gm-Message-State: ANhLgQ1eANGQnFbY0QvQKq5jBdtAt0QmUlrFewj99ivwEid52H4x85QX
	q2CB6FoWVrCAuKzfSu0bEvCVV8PfAfY=
X-Google-Smtp-Source: ADFU+vv+Uh+Nc4xV2m4t+aI5I34QGT2vxhmKOfrn/x2vn2Td+ZCcBO5mjpxyoJObIfC/EljlDsC+jg==
X-Received: by 2002:a17:902:74c2:: with SMTP id
	f2mr22686304plt.318.1584317201663; 
	Sun, 15 Mar 2020 17:06:41 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::af11])
	by smtp.gmail.com with ESMTPSA id
	i72sm35775587pgd.88.2020.03.15.17.06.40
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 15 Mar 2020 17:06:40 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 15 Mar 2020 17:06:54 -0700
Message-Id: <20200316000654.1093220-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] flashrom: Fix build with clang
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
X-List-Received-Date: Mon, 16 Mar 2020 00:06:41 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...typecast-enum-conversions-explicitly.patch | 69 +++++++++++++++++++
 meta-oe/recipes-bsp/flashrom/flashrom_1.2.bb  |  1 +
 2 files changed, 70 insertions(+)
 create mode 100644 meta-oe/recipes-bsp/flashrom/flashrom/0001-typecast-enum-conversions-explicitly.patch

diff --git a/meta-oe/recipes-bsp/flashrom/flashrom/0001-typecast-enum-conversions-explicitly.patch b/meta-oe/recipes-bsp/flashrom/flashrom/0001-typecast-enum-conversions-explicitly.patch
new file mode 100644
index 0000000000..7ac53650f2
--- /dev/null
+++ b/meta-oe/recipes-bsp/flashrom/flashrom/0001-typecast-enum-conversions-explicitly.patch
@@ -0,0 +1,69 @@
+From 8a236330f2af56bde21e9f69208ea3e59f529f0c Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 15 Mar 2020 17:02:30 -0700
+Subject: [PATCH] typecast enum conversions explicitly
+
+clang complains like below
+
+libflashrom.c:191:43: error: implicit conversion from enumeration type 'const enum test_state' to different enumeration type 'enum flashrom_test_state' [-Werror,-Wenum-conversion]
+                        supported_boards[i].working = binfo[i].working;
+                                                    ~ ~~~~~~~~~^~~~~~~
+libflashrom.c:229:46: error: implicit conversion from enumeration type 'const enum test_state' to different enumeration type 'enum flashrom_test_state' [-Werror,-Wenum-conversion]
+                        supported_chipsets[i].status = chipset[i].status;
+                                                     ~ ~~~~~~~~~~~^~~~~~
+
+However these enums are exactly same so they can be typecasted
+
+libflashrom.h
+
+/** @ingroup flashrom-query */
+enum flashrom_test_state {
+        FLASHROM_TESTED_OK  = 0,
+        FLASHROM_TESTED_NT  = 1,
+        FLASHROM_TESTED_BAD = 2,
+        FLASHROM_TESTED_DEP = 3,
+        FLASHROM_TESTED_NA  = 4,
+};
+
+flash.h
+
+enum test_state {
+          OK = 0,
+          NT = 1, /* Not tested */
+          BAD,    /* Known to not work */
+          DEP,    /* Support depends on configuration (e.g. Intel flash descriptor) */
+          NA,     /* Not applicable (e.g. write support on ROM chips) */
+  };
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ libflashrom.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/libflashrom.c b/libflashrom.c
+index 0dec22e..7956685 100644
+--- a/libflashrom.c
++++ b/libflashrom.c
+@@ -188,7 +188,7 @@ struct flashrom_board_info *flashrom_supported_boards(void)
+ 		for (; i < boards_known_size; ++i) {
+ 			supported_boards[i].vendor = binfo[i].vendor;
+ 			supported_boards[i].name = binfo[i].name;
+-			supported_boards[i].working = binfo[i].working;
++			supported_boards[i].working = (enum flashrom_test_state)binfo[i].working;
+ 		}
+ 	} else {
+ 		msg_gerr("Memory allocation error!\n");
+@@ -226,7 +226,7 @@ struct flashrom_chipset_info *flashrom_supported_chipsets(void)
+ 			supported_chipsets[i].chipset = chipset[i].device_name;
+ 			supported_chipsets[i].vendor_id = chipset[i].vendor_id;
+ 			supported_chipsets[i].chipset_id = chipset[i].device_id;
+-			supported_chipsets[i].status = chipset[i].status;
++			supported_chipsets[i].status = (enum flashrom_test_state)chipset[i].status;
+ 	  }
+ 	} else {
+ 		msg_gerr("Memory allocation error!\n");
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-bsp/flashrom/flashrom_1.2.bb b/meta-oe/recipes-bsp/flashrom/flashrom_1.2.bb
index 17445ac2da..642cec1598 100644
--- a/meta-oe/recipes-bsp/flashrom/flashrom_1.2.bb
+++ b/meta-oe/recipes-bsp/flashrom/flashrom_1.2.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 DEPENDS = "pciutils libusb libusb-compat"
 
 SRC_URI = "https://download.flashrom.org/releases/flashrom-v${PV}.tar.bz2 \
+           file://0001-typecast-enum-conversions-explicitly.patch \
            "
 SRC_URI[md5sum] = "7f8e4b87087eb12ecee0fcc5445b4956"
 SRC_URI[sha256sum] = "e1f8d95881f5a4365dfe58776ce821dfcee0f138f75d0f44f8a3cd032d9ea42b"
-- 
2.25.1


