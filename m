Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
	[209.85.216.66])
	by mail.openembedded.org (Postfix) with ESMTP id 7F08D7FF39
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Dec 2019 02:48:22 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id m13so164439pjb.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Dec 2019 18:48:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=oIi8WsjfBeHCmpqAwZoAS8yv8l0MttE6Rrbi4Fwo5kE=;
	b=A9UPJ0nr7p9VaurvzENZ0Y7PycDAGa71ehpGypX/ZwukS6PAasi36dsq+ZmK8bhge9
	dR/fK+udw58lAK4+5XyHFFiAYJUxpuxnq1XKlLXWj+AEsPwQM9UeuMXn26tfn3aUFuiT
	mSY2EgiT81iTE+bXHOQyHDyPcOsVRf9I0IiuGI9JdZRPqDemyrCNjDpeYE/OuuSkj7Ib
	81rS/xkwfJhky3IvE9yRgXhzAujKddtBgvL/RhPq+gsWy6QtVMDaAnZMvU/VfVZ+DuqY
	GyFHIHr3gzKZWBE28OmVVUG9oxigZQ/3bZeTIE6EgSXoPB2hT5k6nIvfUdCcqJKmvJNL
	ewkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=oIi8WsjfBeHCmpqAwZoAS8yv8l0MttE6Rrbi4Fwo5kE=;
	b=aok+f/6K0uSqEkNUNrkFWFhBzPzGv7X9dWNN677daNkj8KKgv9nHNEH7bzyHqqVmKo
	+S7odiphtPGIEGim0n8dq6Ao4SRHB2cNdME1Z4konLYoeKf1J2OG5TQwn9Y39xMrT6wo
	6dIdIGtXxlR8n/0bgGsrLqkIoleBpNBw1Gfhqky8hqZn+XmpsexXFAf22yKMABfW/8Mx
	umCDHVtHX004OaY5guRPMAZwVz7HivXGgWtN0EpMfUAJXNxEdL7g7R0XrsuAN6wLv0Ey
	5z1DlgppsvLE81RwT7BKtYNS9e01VY/vZf0eVgf3is33FVu52nwnsDlqiyfWgMQgWcz2
	cbqw==
X-Gm-Message-State: APjAAAUuUtA/ZwjNE9HetPt3III/L/t63m3FZSjWAsgE/fKlUvPKA+kR
	dOqHcYU+Vtvx9KuBKeepNnyZZNOtxP4=
X-Google-Smtp-Source: APXvYqyi8lX0r2+n/eyRiRqPvJvYrHqsY+N8uxWIwa2U5sCNdKQyNTfFJ/BuDR82JalhpXBKE6/b9w==
X-Received: by 2002:a17:902:9a04:: with SMTP id v4mr17230plp.192.1576637303052;
	Tue, 17 Dec 2019 18:48:23 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::2ebb])
	by smtp.gmail.com with ESMTPSA id o7sm506370pfg.138.2019.12.17.18.48.21
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 17 Dec 2019 18:48:21 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 Dec 2019 18:48:10 -0800
Message-Id: <20191218024810.2874990-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191218024810.2874990-1-raj.khem@gmail.com>
References: <20191218024810.2874990-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 3/3] lcdproc: Upgrade to latest top of tree
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
X-List-Received-Date: Wed, 18 Dec 2019 02:48:22 -0000
Content-Transfer-Encoding: 8bit

* Drop BASEPV, used only once
* serialVFD needs to use ioperm, inb and outb which are only on x86 32/64

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ld-fix-port-internal-make-dependenci.patch | 12 +++---
 ...ude-limits.h-for-PATH_MAX-definition.patch | 41 +++++++++++++++++++
 .../0003-Fix-non-x86-platforms-on-musl.patch  | 35 ++++++++++++++++
 .../recipes-extended/lcdproc/lcdproc_git.bb   | 17 ++++----
 4 files changed, 92 insertions(+), 13 deletions(-)
 create mode 100644 meta-oe/recipes-extended/lcdproc/lcdproc/0002-Include-limits.h-for-PATH_MAX-definition.patch
 create mode 100644 meta-oe/recipes-extended/lcdproc/lcdproc/0003-Fix-non-x86-platforms-on-musl.patch

diff --git a/meta-oe/recipes-extended/lcdproc/lcdproc/0001-Fix-parallel-build-fix-port-internal-make-dependenci.patch b/meta-oe/recipes-extended/lcdproc/lcdproc/0001-Fix-parallel-build-fix-port-internal-make-dependenci.patch
index 8505ea34c8..f6a7956db2 100644
--- a/meta-oe/recipes-extended/lcdproc/lcdproc/0001-Fix-parallel-build-fix-port-internal-make-dependenci.patch
+++ b/meta-oe/recipes-extended/lcdproc/lcdproc/0001-Fix-parallel-build-fix-port-internal-make-dependenci.patch
@@ -1,17 +1,17 @@
-From 67d808b8739817c122bed8ba1a8308d01cb5ad0b Mon Sep 17 00:00:00 2001
+From a20feee4963bc38975fbaf44bbe85a31825f59db Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 6 Apr 2019 17:28:28 -0700
-Subject: [PATCH] Fix parallel build (fix port-internal make dependencies) on
- many cores
+Subject: [PATCH 1/3] Fix parallel build (fix port-internal make dependencies)
+ on many cores
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://github.com/lcdproc/lcdproc/pull/142]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  server/drivers/Makefile.am | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/server/drivers/Makefile.am b/server/drivers/Makefile.am
-index 0c23a9b..6777047 100644
+index e08f2b2d..4fd2e3f1 100644
 --- a/server/drivers/Makefile.am
 +++ b/server/drivers/Makefile.am
 @@ -47,11 +47,11 @@ CwLnx_LDADD =        libLCD.a libbignum.a
@@ -29,5 +29,5 @@ index 0c23a9b..6777047 100644
  imon_LDADD =         libLCD.a libbignum.a
  imonlcd_LDADD =      libLCD.a
 -- 
-2.21.0
+2.24.1
 
diff --git a/meta-oe/recipes-extended/lcdproc/lcdproc/0002-Include-limits.h-for-PATH_MAX-definition.patch b/meta-oe/recipes-extended/lcdproc/lcdproc/0002-Include-limits.h-for-PATH_MAX-definition.patch
new file mode 100644
index 0000000000..eb866bf10a
--- /dev/null
+++ b/meta-oe/recipes-extended/lcdproc/lcdproc/0002-Include-limits.h-for-PATH_MAX-definition.patch
@@ -0,0 +1,41 @@
+From d447a05ee560ba5894d2ed4cd93d0475c2f3c08e Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 17 Dec 2019 17:39:32 -0800
+Subject: [PATCH 2/3] Include <limits.h> for PATH_MAX definition
+
+musl libc exposes the missing include
+
+Upstream-Status: Submitted [https://github.com/lcdproc/lcdproc/pull/142]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ server/drivers/hidraw_lib.c  | 1 +
+ server/drivers/linux_input.c | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/server/drivers/hidraw_lib.c b/server/drivers/hidraw_lib.c
+index 49b03f20..3b51f279 100644
+--- a/server/drivers/hidraw_lib.c
++++ b/server/drivers/hidraw_lib.c
+@@ -8,6 +8,7 @@
+ #include <dirent.h>
+ #include <errno.h>
+ #include <fcntl.h>
++#include <limits.h>
+ #include <stdlib.h>
+ #include <string.h>
+ #include <sys/ioctl.h>
+diff --git a/server/drivers/linux_input.c b/server/drivers/linux_input.c
+index 5b914d4c..6fcfc591 100644
+--- a/server/drivers/linux_input.c
++++ b/server/drivers/linux_input.c
+@@ -5,6 +5,7 @@
+ 
+ #include <dirent.h>
+ #include <errno.h>
++#include <limits.h>
+ #include <stdint.h>
+ #include <stdio.h>
+ #include <stdlib.h>
+-- 
+2.24.1
+
diff --git a/meta-oe/recipes-extended/lcdproc/lcdproc/0003-Fix-non-x86-platforms-on-musl.patch b/meta-oe/recipes-extended/lcdproc/lcdproc/0003-Fix-non-x86-platforms-on-musl.patch
new file mode 100644
index 0000000000..e39e9bda14
--- /dev/null
+++ b/meta-oe/recipes-extended/lcdproc/lcdproc/0003-Fix-non-x86-platforms-on-musl.patch
@@ -0,0 +1,35 @@
+From 7fd144f101fa5c9316d3468ed26f55629afe1305 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 17 Dec 2019 17:55:54 -0800
+Subject: [PATCH 3/3] Fix non x86 platforms on musl
+
+Musl only specifies in/outb for x86/x86. Use the fallback path in case
+musl is used.
+
+This should fail compilation during the linking stage but for some reason
+does not. Will do if -Werror=implicit-function-declaration is specified.
+
+Original here: https://github.com/openwrt/packages/blob/master/utils/lcdproc/patches/110-in-outb.patch
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ server/drivers/port.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/server/drivers/port.h b/server/drivers/port.h
+index c584cd4e..bde235b3 100644
+--- a/server/drivers/port.h
++++ b/server/drivers/port.h
+@@ -94,7 +94,7 @@ static inline int port_deny_multiple(unsigned short port, unsigned short count);
+ /*  ---------------------------- Linux ------------------------------------ */
+ /*  Use ioperm, inb and outb in <sys/io.h> (Linux) */
+ /*  And iopl for higher addresses of PCI LPT cards */
+-#if defined HAVE_IOPERM
++#if defined(__GLIBC__) || (defined(__x86__) || defined(__x86_64__))
+ 
+ /* Glibc2 and Glibc1 */
+ # ifdef HAVE_SYS_IO_H
+-- 
+2.24.1
+
diff --git a/meta-oe/recipes-extended/lcdproc/lcdproc_git.bb b/meta-oe/recipes-extended/lcdproc/lcdproc_git.bb
index 7ddc55f5e7..275b984e47 100644
--- a/meta-oe/recipes-extended/lcdproc/lcdproc_git.bb
+++ b/meta-oe/recipes-extended/lcdproc/lcdproc_git.bb
@@ -7,22 +7,25 @@ LICENSE = "GPLv2+"
 DEPENDS = "ncurses lirc"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=18810669f13b87348459e611d31ab760 \
-                    file://README.md;beginline=107;md5=5c927ce1742d6d5cddc45b7ad6230f75"
+                    file://README.md;beginline=107;md5=5db392f043253a2d64b1737068ce6b58"
 
-BASEPV = "0.5.9"
-PV = "${BASEPV}+git${SRCPV}"
-SRCREV = "e08546c13a4157ed98cd4a8e9086e7acd66f93c0"
+PV = "0.5.9+git${SRCPV}"
+SRCREV = "3a3d622d9bb74c44fa67bc20573751a207514134"
 SRC_URI = "git://github.com/lcdproc/lcdproc \
            file://0001-Fix-parallel-build-fix-port-internal-make-dependenci.patch \
+           file://0002-Include-limits.h-for-PATH_MAX-definition.patch \
+           file://0003-Fix-non-x86-platforms-on-musl.patch \
            "
 
 S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig update-rc.d
 
-LCD_DRIVERS ?= "all,!irman,!svga"
-LCD_DRIVERS_append_aarch64 = ",!serialVFD"
-LCD_DRIVERS_append_arm = ",!serialVFD"
+LCD_DRIVERS ?= "all,!irman,!svga${SERIALVFD}"
+SERIALVFD ?= ""
+SERIALVFD_libc-musl = ",!serialVFD"
+SERIALVFD_libc-musl_x86 = ""
+SERIALVFD_libc-musl_x86-64 = ""
 
 LCD_DEFAULT_DRIVER ?= "curses"
 
-- 
2.24.1


