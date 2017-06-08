Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 6D2FE71A76
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Jun 2017 05:11:23 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id v18so3396072pgb.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Jun 2017 22:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=aZgE5bnV6BvFgDHolLsQ0SaW7P3Xk63tZZrC+c8e0Q0=;
	b=Gccl31XpyUHfyzQ+VV8doCRNjYwIdZjtFfuHurnr2Le6LGoBfFzJFBNf1SloBEmk9Q
	rpqLFG+bfa40Qo8wdi2aVeX3WFm3k/MKFd1QZu/o3CoM86jdHw+MiyTi7vpuPZLj4BxT
	HZfHyMptZ/lwyyiiqp1Xcnj9SCSaTrTNuEhncO2dUBRUW8R0yKGKxbe8HL8VBIIh5qCt
	MXTTUefuLaauKjdTom+CwMHoh6IjUJS+hRROA70t3rgfiORKEQ8G+LN3HY8ulxe1QmlM
	2d2hSGjsu/1mhMs10uI9KXdXB4UbV+GpAEyV+9QAk3ehllAfbkSTgKuyS9CBknfDZSPy
	99+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=aZgE5bnV6BvFgDHolLsQ0SaW7P3Xk63tZZrC+c8e0Q0=;
	b=I3543SZAabF1m+zwv+4NcvKVYMA4KQrrTdJWxSTq2x6gj/d4dQVMm3D/SC6dnuaWhg
	K715mqNH/Onx4uY0uISTrVWgf73ih7xyvBu4XPNDkL56OTnHVgNhwJ28f9iYLx6cvll0
	6XWsvKclPY/uWRGZ+70GCFUMZiFuLzLUh6/NAAGvdvKbMkRJ0lMTg5Kzj8AeCyKhBJ8/
	OOItLBKfY1geKoqp+hzn30CdWqxGoFc32jAeIGU7eIUVxpomR6ZPaNMdA8+zo3hPbMWi
	3e+DXCD3vu7TImm5SFMytPvXQV6SVVjU4uFeDqY++RU+dft4hLEFUklOq5qsWXQyvxf+
	wiNg==
X-Gm-Message-State: AODbwcACGormRFTY4PBdoeLqQ5XecEqdPLMgWkJM6FrEc3IfsXiLO3xi
	fYRoZ/eByAgIDN0N
X-Received: by 10.84.129.1 with SMTP id 1mr28760627plb.134.1496898684994;
	Wed, 07 Jun 2017 22:11:24 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::748])
	by smtp.gmail.com with ESMTPSA id 81sm6146471pge.46.2017.06.07.22.11.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 07 Jun 2017 22:11:23 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  7 Jun 2017 22:11:11 -0700
Message-Id: <20170608051111.28630-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.1
Subject: [meta-oe][PATCH V3] fwts: Bump SRCREV to latest past 17.03.00 release
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
X-List-Received-Date: Thu, 08 Jun 2017 05:11:25 -0000

Helps fixing build issues with gcc7

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2 -> v3
- move the LDFLAGS after CFLAGS

 ...e-poll.h-instead-of-deprecated-sys-poll.h.patch | 48 ++++++++++++++++++++++
 ...efine-__SWORD_TYPE-if-not-defined-by-libc.patch | 33 +++++++++++++++
 .../fwts/fwts/0003-Undefine-PAGE_SIZE.patch        | 30 ++++++++++++++
 meta-oe/recipes-test/fwts/fwts_git.bb              |  9 +++-
 4 files changed, 118 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-test/fwts/fwts/0001-Include-poll.h-instead-of-deprecated-sys-poll.h.patch
 create mode 100644 meta-oe/recipes-test/fwts/fwts/0002-Define-__SWORD_TYPE-if-not-defined-by-libc.patch
 create mode 100644 meta-oe/recipes-test/fwts/fwts/0003-Undefine-PAGE_SIZE.patch

diff --git a/meta-oe/recipes-test/fwts/fwts/0001-Include-poll.h-instead-of-deprecated-sys-poll.h.patch b/meta-oe/recipes-test/fwts/fwts/0001-Include-poll.h-instead-of-deprecated-sys-poll.h.patch
new file mode 100644
index 000000000..8ad078936
--- /dev/null
+++ b/meta-oe/recipes-test/fwts/fwts/0001-Include-poll.h-instead-of-deprecated-sys-poll.h.patch
@@ -0,0 +1,48 @@
+From 100a107a53d5dc9b0554252ac5dbf2c9330615e9 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 6 Jun 2017 07:25:09 -0700
+Subject: [PATCH 1/3] Include poll.h instead of deprecated sys/poll.h
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/lib/src/fwts_ipmi.c   | 3 ++-
+ src/lib/src/fwts_pipeio.c | 2 +-
+ 2 files changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/src/lib/src/fwts_ipmi.c b/src/lib/src/fwts_ipmi.c
+index cbb27611..70d11cfa 100644
+--- a/src/lib/src/fwts_ipmi.c
++++ b/src/lib/src/fwts_ipmi.c
+@@ -18,10 +18,11 @@
+  *
+  */
+ 
++#include <poll.h>
++
+ #include <sys/types.h>
+ #include <sys/stat.h>
+ #include <fcntl.h>
+-#include <sys/poll.h>
+ #include <sys/ioctl.h>
+ #include <linux/ipmi.h>
+ 
+diff --git a/src/lib/src/fwts_pipeio.c b/src/lib/src/fwts_pipeio.c
+index fd719640..bdc5b2ea 100644
+--- a/src/lib/src/fwts_pipeio.c
++++ b/src/lib/src/fwts_pipeio.c
+@@ -30,9 +30,9 @@
+ #include <stdlib.h>
+ #include <string.h>
+ #include <paths.h>
++#include <poll.h>
+ 
+ #include <sys/param.h>
+-#include <sys/poll.h>
+ #include <sys/types.h>
+ #include <sys/wait.h>
+ #include <errno.h>
+-- 
+2.13.0
+
diff --git a/meta-oe/recipes-test/fwts/fwts/0002-Define-__SWORD_TYPE-if-not-defined-by-libc.patch b/meta-oe/recipes-test/fwts/fwts/0002-Define-__SWORD_TYPE-if-not-defined-by-libc.patch
new file mode 100644
index 000000000..3b83ca57c
--- /dev/null
+++ b/meta-oe/recipes-test/fwts/fwts/0002-Define-__SWORD_TYPE-if-not-defined-by-libc.patch
@@ -0,0 +1,33 @@
+From 0e89127cd02ecd5ea4506b935cb2b59eb94107d2 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 6 Jun 2017 07:37:20 -0700
+Subject: [PATCH 2/3] Define __SWORD_TYPE if not defined by libc
+
+__SWORD_TYPE is internal to glibc, therefore
+check and define it if needed e.g. on musl
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/lib/src/fwts_uefi.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/lib/src/fwts_uefi.c b/src/lib/src/fwts_uefi.c
+index 1f9d31fa..2d925f8d 100644
+--- a/src/lib/src/fwts_uefi.c
++++ b/src/lib/src/fwts_uefi.c
+@@ -59,6 +59,10 @@ typedef struct {
+ #define UEFI_IFACE_SYSFS		(2)	/* sysfs */
+ #define UEFI_IFACE_EFIVARS		(3)	/* efivar fs */
+ 
++#ifndef __SWORD_TYPE
++typedef __typeof__( ((struct statfs *)0)->f_type )	__SWORD_TYPE;
++#endif
++
+ /* File system magic numbers */
+ #define PSTOREFS_MAGIC          ((__SWORD_TYPE)0x6165676C)
+ #define EFIVARFS_MAGIC          ((__SWORD_TYPE)0xde5e81e4)
+-- 
+2.13.0
+
diff --git a/meta-oe/recipes-test/fwts/fwts/0003-Undefine-PAGE_SIZE.patch b/meta-oe/recipes-test/fwts/fwts/0003-Undefine-PAGE_SIZE.patch
new file mode 100644
index 000000000..f84fbffd8
--- /dev/null
+++ b/meta-oe/recipes-test/fwts/fwts/0003-Undefine-PAGE_SIZE.patch
@@ -0,0 +1,30 @@
+From 0857269d5a053b5b4c31cfa01b6501526b24035f Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 6 Jun 2017 07:39:28 -0700
+Subject: [PATCH 3/3] Undefine PAGE_SIZE
+
+musl defines PAGE_SIZE and build complains
+of multiple definitions
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/lib/src/fwts_acpi_tables.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/lib/src/fwts_acpi_tables.c b/src/lib/src/fwts_acpi_tables.c
+index 1d4fc705..71023ad2 100644
+--- a/src/lib/src/fwts_acpi_tables.c
++++ b/src/lib/src/fwts_acpi_tables.c
+@@ -42,6 +42,7 @@
+ #define BIOS_START	(0x000e0000)		/* Start of BIOS memory */
+ #define BIOS_END  	(0x000fffff)		/* End of BIOS memory */
+ #define BIOS_LENGTH	(BIOS_END - BIOS_START)	/* Length of BIOS memory */
++#undef PAGE_SIZE
+ #define PAGE_SIZE	(4096)
+ 
+ static fwts_acpi_table_info	tables[ACPI_MAX_TABLES];
+-- 
+2.13.0
+
diff --git a/meta-oe/recipes-test/fwts/fwts_git.bb b/meta-oe/recipes-test/fwts/fwts_git.bb
index 4c4ae66d6..d00aefbf8 100644
--- a/meta-oe/recipes-test/fwts/fwts_git.bb
+++ b/meta-oe/recipes-test/fwts/fwts_git.bb
@@ -5,11 +5,14 @@ HOMEPAGE = "https://wiki.ubuntu.com/Kernel/Reference/fwts"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://src/main.c;beginline=1;endline=16;md5=31da590f3e9f3bd34dcdb9e4db568519"
 
-PV = "17.03.00"
+PV = "17.03.00+git${SRCPV}"
 
-SRCREV = "e3e9d1442b4cc70f5b30199f584cec8e25aeaad4"
+SRCREV = "0153ea51cb648b3067a1b327eee6a075b6cfa330"
 SRC_URI = "git://kernel.ubuntu.com/hwe/fwts.git \
            file://0001-ignore-constant-logical-operand-warning-with-clang.patch \
+           file://0001-Include-poll.h-instead-of-deprecated-sys-poll.h.patch \
+           file://0002-Define-__SWORD_TYPE-if-not-defined-by-libc.patch \
+           file://0003-Undefine-PAGE_SIZE.patch \
            "
 
 S = "${WORKDIR}/git"
@@ -17,10 +20,12 @@ S = "${WORKDIR}/git"
 COMPATIBLE_HOST = "(i.86|x86_64|aarch64|powerpc64).*-linux"
 
 DEPENDS = "libpcre json-c glib-2.0 dtc"
+DEPENDS_append_libc-musl = " libexecinfo"
 
 inherit autotools pkgconfig
 
 CFLAGS += "-I${STAGING_INCDIR}/json-c -Wno-error=unknown-pragmas"
+LDFLAGS_append_libc-musl = " -lexecinfo"
 
 FILES_${PN} += "${libdir}/fwts/lib*${SOLIBS}"
 FILES_${PN}-dev += "${libdir}/fwts/lib*${SOLIBSDEV} ${libdir}/fwts/lib*.la"
-- 
2.13.1


