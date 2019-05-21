Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id 22F7F7E15F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 May 2019 05:21:11 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id f25so1398014pgv.10
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 May 2019 22:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=LgSKN9Ib0niMUsJmnT3Qakw5Kb5CosqX3T/cwUlUQsI=;
	b=DJqFLFqkDu2v9mKc37M/PEZidUAFTBqkE+qf4NqEXySVUW700fPtSLB7nokDjD2uAI
	aONHe3kVLTW0LWdtS1geRl7Cng/m/c7/6mZKU0ziuYeWFsIHtDNji3eyAZ5Ahk3O/2VV
	ao6ZZcGzko1q3G9WQEzXXkarzU7AJE6TAe7XxA7AuVEMGlV/6P5v/8p5Wo6yHkJEFUog
	K/xME2EqsvRvQ5aM9WKG2jAornp6KkcMToHRmu6OApwR8jQcAJt25nxomGNvMWCprasI
	+bIufY5v3bKkw6smQikk50lE5OVXzqIPTnctczS1K7faeOhl6ed6NHSc5JhYRJXg0Yp7
	1vXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=LgSKN9Ib0niMUsJmnT3Qakw5Kb5CosqX3T/cwUlUQsI=;
	b=Do9ZyToPD9agATVAyuRqM2YtCCxCqpUMdCB721EopTCOfUAJyH34tbH9UxBC8CcPw/
	/aJzAThdWO24TY3Ni7XzYlhYUxPdCYJYCLhxZBqIdFA0o3svRVy10ZSfGXefyGKfKCeB
	arSiNRVbe8ek1ruy6UhIAT//k42CgIgoxQ+dU50ficwVGxMlK/u65X6qz0/gRtnPZDZv
	xSQHvZjSFumkIvqiEutSknPlvrDY49SzqVgCs7o0Df4HKI4VdhOrVdz7Mk0j3fHaCief
	w9hJCZ8fVMgiJZPHTFmtm9X1YnGHbqRgGJn8B7KpyBDW1IiuOXIYByC6Ej1xCkWvKzeC
	+uzA==
X-Gm-Message-State: APjAAAVL1KfmxWa+vQ+fL/8iKx131LsWnjEM/gzNanBQAfSo4g6NgCfE
	wL6XtEebrCgKksNyMIzANb9oSg2UzQA=
X-Google-Smtp-Source: APXvYqzvMsoEPNXFaoEvb38FhHT6TcR+hFWT1rFE1xcOL5I+hGNyPdG3XGbW00HOZPCg+mrjCsBMNg==
X-Received: by 2002:a63:1650:: with SMTP id 16mr80584927pgw.164.1558416072530; 
	Mon, 20 May 2019 22:21:12 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::3506])
	by smtp.gmail.com with ESMTPSA id
	s28sm30056075pgl.88.2019.05.20.22.21.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 May 2019 22:21:11 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 May 2019 22:21:03 -0700
Message-Id: <20190521052103.2096-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] libnfc: Fix build with musl
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
X-List-Received-Date: Tue, 21 May 2019 05:21:12 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-usbbus-Include-stdint.h-for-uintX_t.patch | 33 +++++++++++++++++++
 meta-oe/recipes-core/libnfc/libnfc_git.bb     |  4 ++-
 2 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-core/libnfc/libnfc/0001-usbbus-Include-stdint.h-for-uintX_t.patch

diff --git a/meta-oe/recipes-core/libnfc/libnfc/0001-usbbus-Include-stdint.h-for-uintX_t.patch b/meta-oe/recipes-core/libnfc/libnfc/0001-usbbus-Include-stdint.h-for-uintX_t.patch
new file mode 100644
index 0000000000..b1e9be7c35
--- /dev/null
+++ b/meta-oe/recipes-core/libnfc/libnfc/0001-usbbus-Include-stdint.h-for-uintX_t.patch
@@ -0,0 +1,33 @@
+From cb2a3991545ba9e885704226ed3e831bd5e4cb27 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 20 May 2019 22:10:05 -0700
+Subject: [PATCH] usbbus: Include stdint.h for uintX_t
+
+stdint.h is needed for uintX_t typedefs which are
+used to replace u_intX_t in libusb API headers in the cmake files
+
+Define _GNU_SOURCE since thats not defined by default for musl
+C library on linux
+
+Upstream-Status: Submitted [https://github.com/nfc-tools/libnfc/pull/544]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ libnfc/buses/usbbus.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/libnfc/buses/usbbus.h b/libnfc/buses/usbbus.h
+index 87f6a85..d18bf8b 100644
+--- a/libnfc/buses/usbbus.h
++++ b/libnfc/buses/usbbus.h
+@@ -35,6 +35,8 @@
+ 
+ #ifndef _WIN32
+ // Under POSIX system, we use libusb (>= 0.1.12)
++#define _GNU_SOURCE
++#include <stdint.h>
+ #include <usb.h>
+ #define USB_TIMEDOUT ETIMEDOUT
+ #define _usb_strerror( X ) strerror(-X)
+-- 
+2.21.0
+
diff --git a/meta-oe/recipes-core/libnfc/libnfc_git.bb b/meta-oe/recipes-core/libnfc/libnfc_git.bb
index d00733bf58..040ac2145c 100644
--- a/meta-oe/recipes-core/libnfc/libnfc_git.bb
+++ b/meta-oe/recipes-core/libnfc/libnfc_git.bb
@@ -9,6 +9,8 @@ inherit autotools pkgconfig
 
 S = "${WORKDIR}/git"
 SRCREV = "c42e2502d4627d3ea62f83c32677b100bb3cebdc"
-SRC_URI = "git://github.com/nfc-tools/libnfc.git"
+SRC_URI = "git://github.com/nfc-tools/libnfc.git \
+           file://0001-usbbus-Include-stdint.h-for-uintX_t.patch \
+          "
 
 DEPENDS = "libusb"
-- 
2.21.0


