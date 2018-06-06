Return-Path: <krzk@kernel.org>
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by mail.openembedded.org (Postfix) with ESMTP id 2653F77170
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Jun 2018 18:33:50 +0000 (UTC)
Received: from localhost.localdomain (adsl-84-227-236-43.adslplus.ch
	[84.227.236.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 5A42C204EE;
	Wed,  6 Jun 2018 18:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1528310032;
	bh=ptD5DyVxqhO7uBfhBJKDOAwRAMv/NOgjOfYZVYODoik=;
	h=From:To:Cc:Subject:Date:From;
	b=dD0hMFAJwvkdbREUmx1ynGFOCrpTjllKYPK+EmEDkejA3niiQf1cotzB4e6F2mh+m
	Ofg9Jy+BKGURNwwv/VWphcuJBCQv5aOPU74DUV3ymnxv36N1A8R1NWT1n2Y1xFF4+4
	+R0JhuVyzkZvaNFXlG4/FcmiSdqdj7txkWQnMjAw=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  6 Jun 2018 20:33:24 +0200
Message-Id: <20180606183324.28518-1-krzk@kernel.org>
X-Mailer: git-send-email 2.14.1
Subject: [meta-oe][PATCH v3] lshw: Add new recipe with B.02.18 version
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
X-List-Received-Date: Wed, 06 Jun 2018 18:33:51 -0000

Add new recipe for lshw B.02.18 version - a small tool to provide
detailed information on the hardware configuration of the machine.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Changes since v2:
1. Fix build with musl libc (suggested by Khem Raj),
2. Refresh patches, extend changelog and fix signed-off by to account
   used.

Changes since v1:
1. Drop dependency on pciutils and usbutils and use pci.ids and usb.ids
   bundled with lshw.  Recent usbutils do not provide usb.ids (moved to
   udev-hwdb).
   pciutils do provide pci.ids... but in gzipped form which is not yet
   supported by lshw (next release should support it).

Changes since meta-linaro recipe:
The recipe is based on existing meta-linaro:
https://layers.openembedded.org/layerindex/recipe/5446/

with changes:
1. Bump to 02.18,
2. Fix QA issue with GNU_HASH,
3. Minor recipe styling fixes.
---
 .../0001-Makefile-Fix-cross-compilation.patch      | 57 ++++++++++++++
 ...e-supplied-LDFLAGS-to-silence-OE-GNU_HASH.patch | 34 ++++++++
 .../0003-sysfs-Fix-basename-build-with-musl.patch  | 92 ++++++++++++++++++++++
 meta-oe/recipes-devtools/lshw/lshw_02.18.bb        | 32 ++++++++
 4 files changed, 215 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/lshw/files/0001-Makefile-Fix-cross-compilation.patch
 create mode 100644 meta-oe/recipes-devtools/lshw/files/0002-Makefile-Use-supplied-LDFLAGS-to-silence-OE-GNU_HASH.patch
 create mode 100644 meta-oe/recipes-devtools/lshw/files/0003-sysfs-Fix-basename-build-with-musl.patch
 create mode 100644 meta-oe/recipes-devtools/lshw/lshw_02.18.bb

diff --git a/meta-oe/recipes-devtools/lshw/files/0001-Makefile-Fix-cross-compilation.patch b/meta-oe/recipes-devtools/lshw/files/0001-Makefile-Fix-cross-compilation.patch
new file mode 100644
index 000000000000..6db6ab95ee8f
--- /dev/null
+++ b/meta-oe/recipes-devtools/lshw/files/0001-Makefile-Fix-cross-compilation.patch
@@ -0,0 +1,57 @@
+From 62f9ed95b5d0feab426bff452be793c62a6b795a Mon Sep 17 00:00:00 2001
+From: Krzysztof Kozlowski <krzk@kernel.org>
+Date: Wed, 6 Jun 2018 12:49:21 +0200
+Subject: [PATCH 1/2] Makefile: Fix cross compilation
+
+Allow building on ARMv7 and ARMv8.
+
+Upstream-Status: Submitted
+Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
+---
+ src/Makefile      | 2 +-
+ src/core/Makefile | 2 +-
+ src/gui/Makefile  | 4 ++--
+ 3 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/src/Makefile b/src/Makefile
+index b50586bc9234..654b786dd899 100644
+--- a/src/Makefile
++++ b/src/Makefile
+@@ -18,7 +18,7 @@ export MANDIR
+ export DATADIR
+ export SQLITE
+ 
+-CXX?=c++
++CXX?=$(CROSS_COMPILE)c++
+ INCLUDES=-I./core/
+ DEFINES=-DPREFIX=\"$(PREFIX)\" -DSBINDIR=\"$(SBINDIR)\" -DMANDIR=\"$(MANDIR)\" -DDATADIR=\"$(DATADIR)\"
+ CXXFLAGS=-g -Wall -g $(INCLUDES) $(DEFINES) $(RPM_OPT_FLAGS)
+diff --git a/src/core/Makefile b/src/core/Makefile
+index 5bf5a69cc6a6..2bd1b94c4175 100644
+--- a/src/core/Makefile
++++ b/src/core/Makefile
+@@ -1,6 +1,6 @@
+ PACKAGENAME?=lshw
+ 
+-CXX=c++
++CXX?=$(CROSS_COMPILE)c++
+ INCLUDES=
+ DEFINES=-DPREFIX=\"$(PREFIX)\" -DSBINDIR=\"$(SBINDIR)\" -DMANDIR=\"$(MANDIR)\" -DDATADIR=\"$(DATADIR)\"
+ CXXFLAGS?=-g -Wall $(INCLUDES) $(DEFINES) $(RPM_OPT_FLAGS)
+diff --git a/src/gui/Makefile b/src/gui/Makefile
+index 332ce5704819..b0f925490356 100644
+--- a/src/gui/Makefile
++++ b/src/gui/Makefile
+@@ -1,7 +1,7 @@
+ PACKAGENAME?=lshw
+ 
+-CXX?=c++
+-CC?=cc
++CXX?=$(CROSS_COMPILE)c++
++CC?=$(CROSS_COMPILE)cc
+ STRIP?=strip
+ OBJCOPY?=objcopy
+ 
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-devtools/lshw/files/0002-Makefile-Use-supplied-LDFLAGS-to-silence-OE-GNU_HASH.patch b/meta-oe/recipes-devtools/lshw/files/0002-Makefile-Use-supplied-LDFLAGS-to-silence-OE-GNU_HASH.patch
new file mode 100644
index 000000000000..d3da01b40302
--- /dev/null
+++ b/meta-oe/recipes-devtools/lshw/files/0002-Makefile-Use-supplied-LDFLAGS-to-silence-OE-GNU_HASH.patch
@@ -0,0 +1,34 @@
+From 75667f8a0ae4f1689ff03eb1768b1ee8cdfbf00d Mon Sep 17 00:00:00 2001
+From: Krzysztof Kozlowski <krzk@kernel.org>
+Date: Wed, 6 Jun 2018 12:49:30 +0200
+Subject: [PATCH 2/2] Makefile: Use supplied LDFLAGS to silence OE GNU_HASH QA
+ warning
+
+Fix OpenEmbedded/Yocto QA warning:
+
+    ERROR: lshw-02.16-r1 do_package_qa: QA Issue: No GNU_HASH in the elf binary: 'build/tmp/work/cortexa5hf-neon-poky-linux-gnueabi/lshw/02.16-r1/packages-split/lshw/usr/sbin/lshw' [ldflags]
+    ERROR: lshw-02.16-r1 do_package_qa: QA run found fatal errors. Please consider fixing them.
+    ERROR: lshw-02.16-r1 do_package_qa: Function failed: do_package_qa
+
+Upstream-Status: Submitted
+Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
+---
+ src/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/Makefile b/src/Makefile
+index 654b786dd899..a441ba2bb666 100644
+--- a/src/Makefile
++++ b/src/Makefile
+@@ -25,7 +25,7 @@ CXXFLAGS=-g -Wall -g $(INCLUDES) $(DEFINES) $(RPM_OPT_FLAGS)
+ ifeq ($(SQLITE), 1)
+ 	CXXFLAGS+= -DSQLITE $(shell pkg-config --cflags sqlite3)
+ endif
+-LDFLAGS=-L./core/ -g
++LDFLAGS+=-L./core/ -g
+ ifneq ($(shell $(LD) --help 2| grep -- --as-needed), )
+ 	LDFLAGS+= -Wl,--as-needed
+ endif
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-devtools/lshw/files/0003-sysfs-Fix-basename-build-with-musl.patch b/meta-oe/recipes-devtools/lshw/files/0003-sysfs-Fix-basename-build-with-musl.patch
new file mode 100644
index 000000000000..34924939de48
--- /dev/null
+++ b/meta-oe/recipes-devtools/lshw/files/0003-sysfs-Fix-basename-build-with-musl.patch
@@ -0,0 +1,92 @@
+From a89f2ba8496994c8b5e28a89202df15d64c648f9 Mon Sep 17 00:00:00 2001
+From: Krzysztof Kozlowski <krzk@kernel.org>
+Date: Wed, 6 Jun 2018 12:47:02 +0200
+Subject: [PATCH] sysfs: Fix basename() build with musl
+
+musl provides only standard basename() which accepts non-const string.
+This fixes build error with musl C library:
+
+    | sysfs.cc: In function 'std::__cxx11::string sysfs_getbustype(const string&)':
+    | sysfs.cc:102:21: error: 'basename' was not declared in this scope
+    |        "/devices/" + basename(path.c_str());
+    |                      ^~~~~~~~
+
+Upstream-Status: Submitted
+Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
+---
+ src/core/dasd.cc  | 3 ++-
+ src/core/sysfs.cc | 9 +++++----
+ 2 files changed, 7 insertions(+), 5 deletions(-)
+
+diff --git a/src/core/dasd.cc b/src/core/dasd.cc
+index 626b8a872b0f..b27844215cc4 100644
+--- a/src/core/dasd.cc
++++ b/src/core/dasd.cc
+@@ -2,6 +2,7 @@
+ #include "osutils.h"
+ #include "dasd.h"
+ #include <glob.h>
++#include <libgen.h>
+ #include <string.h>
+ #include <fcntl.h>
+ #include <unistd.h>
+@@ -42,7 +43,7 @@ bool scan_dasd(hwNode & n)
+   {
+     for(dev_num=0;dev_num<devices.gl_pathc;dev_num++)
+     {
+-      dev_name = basename(devices.gl_pathv[dev_num]);
++      dev_name = basename(const_cast<char *>(devices.gl_pathv[dev_num]));
+       for (std::vector<std::string>::iterator it = sysfs_attribs.begin(); it != sysfs_attribs.end(); ++it)
+       {
+         std::string attrib_fname = std::string(SYSFS_PREFIX) + dev_name + "/device/" + *it;
+diff --git a/src/core/sysfs.cc b/src/core/sysfs.cc
+index acc9d0056d5e..c56bab7b3b9f 100644
+--- a/src/core/sysfs.cc
++++ b/src/core/sysfs.cc
+@@ -7,6 +7,7 @@
+ #include "version.h"
+ #include "sysfs.h"
+ #include "osutils.h"
++#include <libgen.h>
+ #include <limits.h>
+ #include <unistd.h>
+ #include <stdlib.h>
+@@ -99,7 +100,7 @@ static string sysfs_getbustype(const string & path)
+   {
+     devname =
+       string(fs.path + "/bus/") + string(namelist[i]->d_name) +
+-      "/devices/" + basename(path.c_str());
++      "/devices/" + basename(const_cast<char *>(path.c_str()));
+ 
+     if (samefile(devname, path))
+       return string(namelist[i]->d_name);
+@@ -139,7 +140,7 @@ static string sysfstobusinfo(const string & path)
+ 
+   if (bustype == "virtio")
+   {
+-    string name = basename(path.c_str());
++    string name = basename(const_cast<char *>(path.c_str()));
+     if (name.compare(0, 6, "virtio") == 0)
+       return "virtio@" + name.substr(6);
+     else
+@@ -207,7 +208,7 @@ string entry::driver() const
+   string driverlink = This->devpath + "/driver";
+   if (!exists(driverlink))
+     return "";
+-  return basename(readlink(driverlink).c_str());
++  return basename(const_cast<char *>(readlink(driverlink).c_str()));
+ }
+ 
+ 
+@@ -288,7 +289,7 @@ string entry::name_in_class(const string & classname) const
+ 
+ string entry::name() const
+ {
+-  return basename(This->devpath.c_str());
++  return basename(const_cast<char *>(This->devpath.c_str()));
+ }
+ 
+ 
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-devtools/lshw/lshw_02.18.bb b/meta-oe/recipes-devtools/lshw/lshw_02.18.bb
new file mode 100644
index 000000000000..b344fbf32651
--- /dev/null
+++ b/meta-oe/recipes-devtools/lshw/lshw_02.18.bb
@@ -0,0 +1,32 @@
+DESCRIPTION = "A small tool to provide detailed information on the hardware \
+configuration of the machine. It can report exact memory configuration, \
+firmware version, mainboard configuration, CPU version and speed, cache \
+configuration, bus speed, etc. on DMI-capable or EFI systems."
+SUMMARY = "Hardware lister"
+HOMEPAGE = "http://ezix.org/project/wiki/HardwareLiSter"
+SECTION = "console/tools"
+
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
+
+SRC_URI = " \
+    http://ezix.org/software/files/lshw-B.${PV}.tar.gz \
+    file://0001-Makefile-Fix-cross-compilation.patch \
+    file://0002-Makefile-Use-supplied-LDFLAGS-to-silence-OE-GNU_HASH.patch \
+    file://0003-sysfs-Fix-basename-build-with-musl.patch \
+"
+SRC_URI[md5sum] = "8671c6d94d6324a744b7f21f1bfecfd2"
+SRC_URI[sha256sum] = "ae22ef11c934364be4fd2a0a1a7aadf4495a0251ec6979da280d342a89ca3c2f"
+
+S = "${WORKDIR}/lshw-B.${PV}"
+
+do_compile() {
+    # build core only - don't ship gui
+    oe_runmake -C src core
+}
+
+do_install() {
+    oe_runmake install DESTDIR=${D}
+}
-- 
2.14.1


