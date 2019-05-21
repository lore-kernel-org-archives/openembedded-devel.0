Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id BFCFE7E182
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 May 2019 06:55:36 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id t87so8556817pfa.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 May 2019 23:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=lSdVYJZYvqci+5AhkFLGk+IhIL2bbOBNtBHh+IJXa1Y=;
	b=bwaRY1txDRcc0e9DKDuaLfHu6fFAMxMpeGzLjKLQv+4S8lUnaoS+kcBBSGkuXTmL7+
	JrSwbfZNzUAqdZwDUetK6zIhYkzDBUY3dYB68u5kgDGaBdkzZZJPO4bq9rqoK/68X9AG
	4YuPHKN10ExXqrATJtFMlpYZUWgzgeqp/TFYvwKS/4gTCsmMVBdYC6EDzgCcX30twuos
	SKeI1lpRKUJ+6Qat5aDIbmyP1N8//lUtY8XSmDOH3rJUdGgRD1zW1jxLM7ieER/csxTZ
	Ohj6Y1/iJvtbInpoflJTK+xHbgxCKIVK6vBlGz7/58aPQYXmpl7q8eCuF132QITNd7X4
	BHQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=lSdVYJZYvqci+5AhkFLGk+IhIL2bbOBNtBHh+IJXa1Y=;
	b=av5qspdT0rXUfJipkzgiA/CQRnvmiL2x/unUSyOspAuCZ0KaXr+uaC7IAO9aON4a2+
	ugVjKCKb6CY1JtdA4hBfd4HZ0fHPGBNRAMLJI5nr97GZfBmSpVRUViX+unoDA278fcNQ
	1RhKeBvHb417Y/AwIIDHuBmOzTrNm67yyUQ8CZGWA9mtaFv1OkNr+g+a9POXmisKi3mY
	7rd2ddV1U/zEKcB2yPpDijYCpEvhI4NfntOQUSmMHoHhsFDeVlmj0EjH4iRDYa1yHgb8
	LXIJ4Jz8k3oB0jUhypGz+UVlzpayOOCkPD7+TF0tC+I3WyIx3w2Tc2fs9oEvEewChsMC
	fXjQ==
X-Gm-Message-State: APjAAAXwOOzKtJ6jndZCozRzq5oVSTUq4WbJ41pdFZ5ldXul/cI1lzvj
	Y2Y7UpYjlZewZHMUzhcNiw4gSfUK+rg=
X-Google-Smtp-Source: APXvYqzoEFO14sU/j3ayTw287U03Iu/cElJ5lFcmD5IAmqa3hubzvN/FKXDmhyd9P7ivz5uE4ps5OQ==
X-Received: by 2002:a63:2745:: with SMTP id n66mr79430793pgn.208.1558421736920;
	Mon, 20 May 2019 23:55:36 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::3506])
	by smtp.gmail.com with ESMTPSA id
	l21sm28100673pff.40.2019.05.20.23.55.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 May 2019 23:55:36 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 May 2019 23:55:28 -0700
Message-Id: <20190521065529.41647-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH V2 1/2] libnfc: Fix build with musl
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
X-List-Received-Date: Tue, 21 May 2019 06:55:37 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Pass _GNU_SOURCE on cmdline

 ...-usbbus-Include-stdint.h-for-uintX_t.patch | 24 +++++++++++++++++++
 meta-oe/recipes-core/libnfc/libnfc_git.bb     |  5 +++-
 2 files changed, 28 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-core/libnfc/libnfc/0001-usbbus-Include-stdint.h-for-uintX_t.patch

diff --git a/meta-oe/recipes-core/libnfc/libnfc/0001-usbbus-Include-stdint.h-for-uintX_t.patch b/meta-oe/recipes-core/libnfc/libnfc/0001-usbbus-Include-stdint.h-for-uintX_t.patch
new file mode 100644
index 0000000000..b8ed87aa0f
--- /dev/null
+++ b/meta-oe/recipes-core/libnfc/libnfc/0001-usbbus-Include-stdint.h-for-uintX_t.patch
@@ -0,0 +1,24 @@
+From cb2a3991545ba9e885704226ed3e831bd5e4cb27 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 20 May 2019 22:10:05 -0700
+Subject: [PATCH] usbbus: Include stdint.h for uintX_t
+
+stdint.h is needed for uintX_t typedefs which are
+used to replace u_intX_t in libusb API headers in the cmake files
+
+Upstream-Status: Submitted [https://github.com/nfc-tools/libnfc/pull/544]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ libnfc/buses/usbbus.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+--- a/libnfc/buses/usbbus.h
++++ b/libnfc/buses/usbbus.h
+@@ -35,6 +35,7 @@
+ 
+ #ifndef _WIN32
+ // Under POSIX system, we use libusb (>= 0.1.12)
++#include <stdint.h>
+ #include <usb.h>
+ #define USB_TIMEDOUT ETIMEDOUT
+ #define _usb_strerror( X ) strerror(-X)
diff --git a/meta-oe/recipes-core/libnfc/libnfc_git.bb b/meta-oe/recipes-core/libnfc/libnfc_git.bb
index d00733bf58..7efd3443dd 100644
--- a/meta-oe/recipes-core/libnfc/libnfc_git.bb
+++ b/meta-oe/recipes-core/libnfc/libnfc_git.bb
@@ -9,6 +9,9 @@ inherit autotools pkgconfig
 
 S = "${WORKDIR}/git"
 SRCREV = "c42e2502d4627d3ea62f83c32677b100bb3cebdc"
-SRC_URI = "git://github.com/nfc-tools/libnfc.git"
+SRC_URI = "git://github.com/nfc-tools/libnfc.git \
+           file://0001-usbbus-Include-stdint.h-for-uintX_t.patch \
+          "
 
+CFLAGS_append_libc-musl = " -D_GNU_SOURCE"
 DEPENDS = "libusb"
-- 
2.21.0


