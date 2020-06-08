Received: from koncepto.io (koncepto.io [195.154.119.111])
 by mx.groups.io with SMTP id smtpd.web11.27344.1591613626514696912
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Jun 2020 03:53:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@koncepto.io header.s=default header.b=GWO5ne2J;
 spf=pass (domain: koncepto.io, ip: 195.154.119.111, mailfrom: pjtexier@koncepto.io)
Received: from menoah.home (lfbn-bor-1-1500-88.w193-250.abo.wanadoo.fr [193.250.66.88])
	by koncepto.io (Postfix) with ESMTPSA id 8472A60250;
	Mon,  8 Jun 2020 12:53:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1591613624;
	bh=waR8W6nq+sZWMYVbdv1fgxRHIddDYyquy3DC87Qpzlg=;
	h=From:To:Cc:Subject:Date:From;
	b=GWO5ne2J+jKjUVCISmN1nB3Ma8krH4b3PEpW+dQDDjsliOIhDtFqjr3alFuqdOhiu
	 CCI3sRl4flkWiIfAtomT7Pxu2mQbRK7u1wpEMyRVRO1Srkj1+uIvgxtj4suc8i87jZ
	 QjLFxoOIud8zuUQv3mp4DToOv5ZEyfIkB9mHbwVBdVT/cFtiMAcOp+huMEtevM/Hi1
	 ulKyJ3euJjAp7WDP1ca0LQNOcJ5cZ04/qsrB8r+FCdVLHYUTui5JWi0qicDn+qwTEY
	 9O5zzGZlWf0pFQibB9UniuhPJx8zpAbPsjUvRUnRUGhxayd3rAAyOnlCTyUL0HS917
	 XlXXEUGevfvMg==
From: "Pierre-Jean Texier" <pjtexier@koncepto.io>
To: openembedded-devel@lists.openembedded.org
Cc: Pierre-Jean Texier <pjtexier@koncepto.io>
Subject: [meta-oe][PATCH] libnfc: upgrade 1.7.1 -> 1.8.0
Date: Mon,  8 Jun 2020 12:52:56 +0200
Message-Id: <1591613576-15268-1-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4

See full changelog https://github.com/nfc-tools/libnfc/blob/master/ChangeLog#L1

Also remove patch applied upstream

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 .../0001-usbbus-Include-stdint.h-for-uintX_t.patch | 24 ----------------------
 meta-oe/recipes-core/libnfc/libnfc_git.bb          |  8 +++-----
 2 files changed, 3 insertions(+), 29 deletions(-)
 delete mode 100644 meta-oe/recipes-core/libnfc/libnfc/0001-usbbus-Include-stdint.h-for-uintX_t.patch

diff --git a/meta-oe/recipes-core/libnfc/libnfc/0001-usbbus-Include-stdint.h-for-uintX_t.patch b/meta-oe/recipes-core/libnfc/libnfc/0001-usbbus-Include-stdint.h-for-uintX_t.patch
deleted file mode 100644
index b8ed87a..0000000
--- a/meta-oe/recipes-core/libnfc/libnfc/0001-usbbus-Include-stdint.h-for-uintX_t.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-From cb2a3991545ba9e885704226ed3e831bd5e4cb27 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 20 May 2019 22:10:05 -0700
-Subject: [PATCH] usbbus: Include stdint.h for uintX_t
-
-stdint.h is needed for uintX_t typedefs which are
-used to replace u_intX_t in libusb API headers in the cmake files
-
-Upstream-Status: Submitted [https://github.com/nfc-tools/libnfc/pull/544]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- libnfc/buses/usbbus.h | 2 ++
- 1 file changed, 2 insertions(+)
-
---- a/libnfc/buses/usbbus.h
-+++ b/libnfc/buses/usbbus.h
-@@ -35,6 +35,7 @@
- 
- #ifndef _WIN32
- // Under POSIX system, we use libusb (>= 0.1.12)
-+#include <stdint.h>
- #include <usb.h>
- #define USB_TIMEDOUT ETIMEDOUT
- #define _usb_strerror( X ) strerror(-X)
diff --git a/meta-oe/recipes-core/libnfc/libnfc_git.bb b/meta-oe/recipes-core/libnfc/libnfc_git.bb
index 2851ecf..9e602f1 100644
--- a/meta-oe/recipes-core/libnfc/libnfc_git.bb
+++ b/meta-oe/recipes-core/libnfc/libnfc_git.bb
@@ -7,13 +7,11 @@ SECTION = "libs"
 
 inherit autotools pkgconfig
 
-PV = "1.7.1+git${SRCPV}"
+PV = "1.8.0+git${SRCPV}"
 
 S = "${WORKDIR}/git"
-SRCREV = "2d4543673e9b76c02679ca8b89259659f1afd932"
-SRC_URI = "git://github.com/nfc-tools/libnfc.git \
-           file://0001-usbbus-Include-stdint.h-for-uintX_t.patch \
-          "
+SRCREV = "f02ff51449240102c27a97173dc495e8e7789046"
+SRC_URI = "git://github.com/nfc-tools/libnfc.git"
 
 CFLAGS_append_libc-musl = " -D_GNU_SOURCE"
 DEPENDS = "libusb"
-- 
2.7.4

