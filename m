Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 4566C7477C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jun 2018 17:55:19 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id c10-v6so3284999pgu.9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jun 2018 10:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=kmb/rvdBqtsBQ/5vNte6OEAfJ0nUw1kOJgg9KjELcow=;
	b=NPiORQQ3g7bhNQQ1Hnzp8ezWCN1GzVJAC5GhsW+0SupXLw/11yQZbMO36qBaIXPOeG
	XKLs8u43sA85k0z91L6jUhzTbe/65r2AnOgcqC3rc9H1AimJCmJVjyG9i5J7eYT2r0Sy
	5mzoRtQVwpBh6huNWoiWp+PP1Lgj0ZdqzuxysXNSXQu3cldlWBRtscCWknn//J+DanTC
	sAyrVa9aHoHaLj2KDLkyCXxOgiCit4x5Mex8SzKJ/xIABYjDpKG4xqpoMk10f0s6o60w
	XNcAGNYoqPVfwRCJnVCUBwxXcEyC3TkEqdj1iJE291E8q06jS7n56vTQJtWnXWw9Woxl
	jmIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=kmb/rvdBqtsBQ/5vNte6OEAfJ0nUw1kOJgg9KjELcow=;
	b=O+z6NBawg+nCkpW6MhkZNXEBtmFMx75Gfw/Le66VpH2LBWGX87JnApp9VCJ3Ed9dJb
	QRNTNu3aWT+PzlTVX8tYsZKq91JmVj/dwHVTiLjndKN6nWRxouTrUkRRCBe/iTTSGL1d
	pIaRwQqG3SbGePpEGrLDAFzt86OsKEDlaL3Ybtmp1mQ4apJLGnCFgFtzUrNw0VhF7DnY
	Z8NAl8PAhty0eHbA8nJaZUz9h/+BgTuHFgd/HgvY/BauciYgaemONeaPVoiiAPKD1byy
	tBumMYzm5Wwc+OUWqs9BipdmRvPJBICxSvy45pzn1YCoJi7SBaUOLoYhCy+/nAlLkOVx
	S5xQ==
X-Gm-Message-State: APt69E1n/5ZTodiVlMIyPJ6Srs3KTn/9Fv5rUzpuuvjMUVBIyXB8mS8u
	v+cEgMujHIIx9SIZ7bCfiw5ksA==
X-Google-Smtp-Source: ADUXVKJbIh8Qo0AsOFt7/8sNg9gsBXtNVDWxLwfZbp4JJ8Qr7MgmISoqbHMMC4Tp1dHQip1eJcw7jA==
X-Received: by 2002:a63:6092:: with SMTP id
	u140-v6mr2275258pgb.433.1529690119624; 
	Fri, 22 Jun 2018 10:55:19 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::91a0])
	by smtp.gmail.com with ESMTPSA id
	n83-v6sm23758992pfi.147.2018.06.22.10.55.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Jun 2018 10:55:19 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 22 Jun 2018 10:55:17 -0700
Message-Id: <20180622175521.21628-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
Subject: [meta-oe][PATCH 1/5] upm: Upgrade to latest and fix build with musl
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
X-List-Received-Date: Fri, 22 Jun 2018 17:55:19 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...lude-sys-types.h-for-uint-definition.patch | 33 +++++++++++++++++++
 meta-oe/recipes-extended/upm/upm_git.bb       | 11 +++----
 2 files changed, 38 insertions(+), 6 deletions(-)
 create mode 100644 meta-oe/recipes-extended/upm/upm/0001-include-sys-types.h-for-uint-definition.patch

diff --git a/meta-oe/recipes-extended/upm/upm/0001-include-sys-types.h-for-uint-definition.patch b/meta-oe/recipes-extended/upm/upm/0001-include-sys-types.h-for-uint-definition.patch
new file mode 100644
index 0000000000..a0a47411d7
--- /dev/null
+++ b/meta-oe/recipes-extended/upm/upm/0001-include-sys-types.h-for-uint-definition.patch
@@ -0,0 +1,33 @@
+From 48a580bd402cf6a3ee9e42013653219bfeb3caf6 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 21 Jun 2018 18:39:16 -0700
+Subject: [PATCH] include sys/types.h for uint definition
+
+uint is defined in sys/types.h, therefore this
+header needs to be included, it gets exposed with
+musl where this header is not getting included indirectly
+as it is happening when building on glibc
+
+Fixes build errors on musl e.g.
+upm/src/kx122/kx122.hpp:456:31: error: 'uint' has not been declared
+|        void setBufferThreshold(uint samples);
+|                                ^~~~
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Submitted [https://github.com/intel-iot-devkit/upm/pull/656]
+ src/kx122/kx122.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/kx122/kx122.h b/src/kx122/kx122.h
+index 1622ed50..56e5215e 100644
+--- a/src/kx122/kx122.h
++++ b/src/kx122/kx122.h
+@@ -31,6 +31,7 @@ extern "C"{
+ #include <assert.h>
+ #include <unistd.h>
+ #include <math.h>
++#include <sys/types.h>
+ 
+ #include <mraa/i2c.h>
+ #include <mraa/spi.h>
diff --git a/meta-oe/recipes-extended/upm/upm_git.bb b/meta-oe/recipes-extended/upm/upm_git.bb
index 478aa0db1d..babe5f4893 100644
--- a/meta-oe/recipes-extended/upm/upm_git.bb
+++ b/meta-oe/recipes-extended/upm/upm_git.bb
@@ -7,13 +7,13 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=66493d54e65bfc12c7983ff2e884f37f"
 
 DEPENDS = "libjpeg-turbo mraa"
 
-SRCREV = "37642f3b0194f6ddd63f1e6b5d49b8cb689d5c81"
+SRCREV = "dc45cd78595c7c24c8a8574c63bb48b5bb99c5aa"
 PV = "1.6.0-git${SRCPV}"
 
-SRC_URI = " \
-    git://github.com/intel-iot-devkit/${BPN}.git;protocol=http \
-    file://0001-Replace-strncpy-with-memcpy.patch \
-"
+SRC_URI = "git://github.com/intel-iot-devkit/${BPN}.git;protocol=http \
+           file://0001-Replace-strncpy-with-memcpy.patch \
+           file://0001-include-sys-types.h-for-uint-definition.patch \
+           "
 
 S = "${WORKDIR}/git"
 
@@ -22,7 +22,6 @@ COMPATIBLE_HOST = "(x86_64.*|i.86.*|aarch64.*|arm.*)-linux"
 
 inherit distutils3-base cmake
 
-
 # override this in local.conf to get needed bindings.
 # BINDINGS_pn-upm="python"
 # will result in only the python bindings being built/packaged.
-- 
2.18.0


