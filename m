Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.10320.1598349261044904117
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Aug 2020 02:54:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=54770 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kAVej-0003Eu-NJ; Tue, 25 Aug 2020 12:54:19 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-oe][PATCH 2/3] lshw: Upgrade 2.18 -> 2.19
Date: Tue, 25 Aug 2020 12:54:06 +0300
Message-Id: <20200825095407.18867-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200825095407.18867-1-leon.anavi@konsulko.com>
References: <20200825095407.18867-1-leon.anavi@konsulko.com>
X-OutGoing-Spam-Status: No, score=-0.2
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - voyager.icnhost.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - konsulko.com
X-Get-Message-Sender-Via: voyager.icnhost.net: authenticated_id: leon@anavi.org
X-Authenticated-Sender: voyager.icnhost.net: leon@anavi.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Upgrade to release B.02.19:

- detection of NVMe disks
- detection of SD/MMC and SDIO devices
- bug fixes
- code cleanup
- updated data files

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../lshw/files/0001-Fix-musl-build.patch      | 125 ++++++++++++++++++
 .../0001-Makefile-Fix-cross-compilation.patch |  57 --------
 ...plied-LDFLAGS-to-silence-OE-GNU_HASH.patch |  34 -----
 ...3-sysfs-Fix-basename-build-with-musl.patch |  92 -------------
 .../lshw/{lshw_02.18.bb => lshw_02.19.2.bb}   |   8 +-
 5 files changed, 128 insertions(+), 188 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/lshw/files/0001-Fix-musl-build.patch
 delete mode 100644 meta-oe/recipes-devtools/lshw/files/0001-Makefile-Fix-cross-compilation.patch
 delete mode 100644 meta-oe/recipes-devtools/lshw/files/0002-Makefile-Use-supplied-LDFLAGS-to-silence-OE-GNU_HASH.patch
 delete mode 100644 meta-oe/recipes-devtools/lshw/files/0003-sysfs-Fix-basename-build-with-musl.patch
 rename meta-oe/recipes-devtools/lshw/{lshw_02.18.bb => lshw_02.19.2.bb} (71%)

diff --git a/meta-oe/recipes-devtools/lshw/files/0001-Fix-musl-build.patch b/meta-oe/recipes-devtools/lshw/files/0001-Fix-musl-build.patch
new file mode 100644
index 000000000..fa90aa121
--- /dev/null
+++ b/meta-oe/recipes-devtools/lshw/files/0001-Fix-musl-build.patch
@@ -0,0 +1,125 @@
+From a5a4bb4254b2109bd3e272174946f0bb36ee99a8 Mon Sep 17 00:00:00 2001
+From: Leon Anavi <leon.anavi@konsulko.com>
+Date: Tue, 25 Aug 2020 11:45:45 +0300
+Subject: [PATCH] Fix musl build
+
+Apply the following fixes for musl:
+
+- Fix basename() is in libgen.h
+- Fix wrong usage of LONG_BIT
+
+Same fixes have been submitted to the upstream of lshw by Sergio
+Prado but they have not been merged yet.
+
+Upstream-Status: Submitted
+
+Co-Authored-By: Sergio Prado <sergio.prado@e-labworks.com>
+Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
+---
+ src/core/abi.cc   |  4 +---
+ src/core/sysfs.cc | 19 ++++++++++---------
+ 2 files changed, 11 insertions(+), 12 deletions(-)
+
+diff --git a/src/core/abi.cc b/src/core/abi.cc
+index adff7b5..76c664c 100644
+--- a/src/core/abi.cc
++++ b/src/core/abi.cc
+@@ -20,9 +20,7 @@ __ID("@(#) $Id: mem.cc 1352 2006-05-27 23:54:13Z ezix $");
+ bool scan_abi(hwNode & system)
+ {
+   // are we compiled as 32- or 64-bit process ?
+-  long sc = sysconf(LONG_BIT);
+-  if(sc==-1) sc = sysconf(_SC_LONG_BIT);
+-  if(sc!=-1) system.setWidth(sc);
++  system.setWidth(LONG_BIT);
+ 
+   pushd(PROC_SYS);
+ 
+diff --git a/src/core/sysfs.cc b/src/core/sysfs.cc
+index 32d6564..c2fa84f 100644
+--- a/src/core/sysfs.cc
++++ b/src/core/sysfs.cc
+@@ -16,6 +16,7 @@
+ #include <sys/stat.h>
+ #include <sys/types.h>
+ #include <sys/mount.h>
++#include <libgen.h>
+ 
+ 
+ __ID("@(#) $Id$");
+@@ -100,7 +101,7 @@ static string sysfs_getbustype(const string & path)
+   {
+     devname =
+       string(fs.path + "/bus/") + string(namelist[i]->d_name) +
+-      "/devices/" + basename(path.c_str());
++      "/devices/" + basename(const_cast<char*>(path.c_str()));
+ 
+     if (samefile(devname, path))
+       return string(namelist[i]->d_name);
+@@ -140,7 +141,7 @@ static string sysfstobusinfo(const string & path)
+ 
+   if (bustype == "usb")
+   {
+-    string name = basename(path.c_str());
++    string name = basename(const_cast<char*>(path.c_str()));
+     if (matches(name, "^[0-9]+-[0-9]+(\\.[0-9]+)*:[0-9]+\\.[0-9]+$"))
+     {
+       size_t colon = name.rfind(":");
+@@ -151,7 +152,7 @@ static string sysfstobusinfo(const string & path)
+ 
+   if (bustype == "virtio")
+   {
+-    string name = basename(path.c_str());
++    string name = basename(const_cast<char*>(path.c_str()));
+     if (name.compare(0, 6, "virtio") == 0)
+       return "virtio@" + name.substr(6);
+     else
+@@ -159,10 +160,10 @@ static string sysfstobusinfo(const string & path)
+   }
+ 
+   if (bustype == "vio")
+-    return string("vio@") + basename(path.c_str());
++    return string("vio@") + basename(const_cast<char*>(path.c_str()));
+ 
+   if (bustype == "ccw")
+-    return string("ccw@") + basename(path.c_str());
++    return string("ccw@") + basename(const_cast<char*>(path.c_str()));
+ 
+   if (bustype == "ccwgroup")
+   {
+@@ -240,7 +241,7 @@ string entry::driver() const
+   string driverlink = This->devpath + "/driver";
+   if (!exists(driverlink))
+     return "";
+-  return basename(readlink(driverlink).c_str());
++  return basename(const_cast<char*>(readlink(driverlink).c_str()));
+ }
+ 
+ 
+@@ -328,7 +329,7 @@ string entry::name_in_class(const string & classname) const
+ 
+ string entry::name() const
+ {
+-  return basename(This->devpath.c_str());
++  return basename(const_cast<char*>(This->devpath.c_str()));
+ }
+ 
+ 
+@@ -340,12 +341,12 @@ entry entry::parent() const
+ 
+ string entry::classname() const
+ {
+-  return basename(dirname(This->devpath).c_str());
++  return basename(const_cast<char*>(dirname(This->devpath).c_str()));
+ }
+ 
+ bool entry::isvirtual() const
+ {
+-  return string(basename(dirname(dirname(This->devpath)).c_str())) == "virtual";
++  return string(basename(const_cast<char*>(dirname(dirname(This->devpath)).c_str()))) == "virtual";
+ }
+ 
+ string entry::string_attr(const string & name, const string & def) const
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-devtools/lshw/files/0001-Makefile-Fix-cross-compilation.patch b/meta-oe/recipes-devtools/lshw/files/0001-Makefile-Fix-cross-compilation.patch
deleted file mode 100644
index 6db6ab95e..000000000
--- a/meta-oe/recipes-devtools/lshw/files/0001-Makefile-Fix-cross-compilation.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From 62f9ed95b5d0feab426bff452be793c62a6b795a Mon Sep 17 00:00:00 2001
-From: Krzysztof Kozlowski <krzk@kernel.org>
-Date: Wed, 6 Jun 2018 12:49:21 +0200
-Subject: [PATCH 1/2] Makefile: Fix cross compilation
-
-Allow building on ARMv7 and ARMv8.
-
-Upstream-Status: Submitted
-Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
----
- src/Makefile      | 2 +-
- src/core/Makefile | 2 +-
- src/gui/Makefile  | 4 ++--
- 3 files changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/src/Makefile b/src/Makefile
-index b50586bc9234..654b786dd899 100644
---- a/src/Makefile
-+++ b/src/Makefile
-@@ -18,7 +18,7 @@ export MANDIR
- export DATADIR
- export SQLITE
- 
--CXX?=c++
-+CXX?=$(CROSS_COMPILE)c++
- INCLUDES=-I./core/
- DEFINES=-DPREFIX=\"$(PREFIX)\" -DSBINDIR=\"$(SBINDIR)\" -DMANDIR=\"$(MANDIR)\" -DDATADIR=\"$(DATADIR)\"
- CXXFLAGS=-g -Wall -g $(INCLUDES) $(DEFINES) $(RPM_OPT_FLAGS)
-diff --git a/src/core/Makefile b/src/core/Makefile
-index 5bf5a69cc6a6..2bd1b94c4175 100644
---- a/src/core/Makefile
-+++ b/src/core/Makefile
-@@ -1,6 +1,6 @@
- PACKAGENAME?=lshw
- 
--CXX=c++
-+CXX?=$(CROSS_COMPILE)c++
- INCLUDES=
- DEFINES=-DPREFIX=\"$(PREFIX)\" -DSBINDIR=\"$(SBINDIR)\" -DMANDIR=\"$(MANDIR)\" -DDATADIR=\"$(DATADIR)\"
- CXXFLAGS?=-g -Wall $(INCLUDES) $(DEFINES) $(RPM_OPT_FLAGS)
-diff --git a/src/gui/Makefile b/src/gui/Makefile
-index 332ce5704819..b0f925490356 100644
---- a/src/gui/Makefile
-+++ b/src/gui/Makefile
-@@ -1,7 +1,7 @@
- PACKAGENAME?=lshw
- 
--CXX?=c++
--CC?=cc
-+CXX?=$(CROSS_COMPILE)c++
-+CC?=$(CROSS_COMPILE)cc
- STRIP?=strip
- OBJCOPY?=objcopy
- 
--- 
-2.7.4
-
diff --git a/meta-oe/recipes-devtools/lshw/files/0002-Makefile-Use-supplied-LDFLAGS-to-silence-OE-GNU_HASH.patch b/meta-oe/recipes-devtools/lshw/files/0002-Makefile-Use-supplied-LDFLAGS-to-silence-OE-GNU_HASH.patch
deleted file mode 100644
index d3da01b40..000000000
--- a/meta-oe/recipes-devtools/lshw/files/0002-Makefile-Use-supplied-LDFLAGS-to-silence-OE-GNU_HASH.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 75667f8a0ae4f1689ff03eb1768b1ee8cdfbf00d Mon Sep 17 00:00:00 2001
-From: Krzysztof Kozlowski <krzk@kernel.org>
-Date: Wed, 6 Jun 2018 12:49:30 +0200
-Subject: [PATCH 2/2] Makefile: Use supplied LDFLAGS to silence OE GNU_HASH QA
- warning
-
-Fix OpenEmbedded/Yocto QA warning:
-
-    ERROR: lshw-02.16-r1 do_package_qa: QA Issue: No GNU_HASH in the elf binary: 'build/tmp/work/cortexa5hf-neon-poky-linux-gnueabi/lshw/02.16-r1/packages-split/lshw/usr/sbin/lshw' [ldflags]
-    ERROR: lshw-02.16-r1 do_package_qa: QA run found fatal errors. Please consider fixing them.
-    ERROR: lshw-02.16-r1 do_package_qa: Function failed: do_package_qa
-
-Upstream-Status: Submitted
-Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
----
- src/Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/Makefile b/src/Makefile
-index 654b786dd899..a441ba2bb666 100644
---- a/src/Makefile
-+++ b/src/Makefile
-@@ -25,7 +25,7 @@ CXXFLAGS=-g -Wall -g $(INCLUDES) $(DEFINES) $(RPM_OPT_FLAGS)
- ifeq ($(SQLITE), 1)
- 	CXXFLAGS+= -DSQLITE $(shell pkg-config --cflags sqlite3)
- endif
--LDFLAGS=-L./core/ -g
-+LDFLAGS+=-L./core/ -g
- ifneq ($(shell $(LD) --help 2| grep -- --as-needed), )
- 	LDFLAGS+= -Wl,--as-needed
- endif
--- 
-2.7.4
-
diff --git a/meta-oe/recipes-devtools/lshw/files/0003-sysfs-Fix-basename-build-with-musl.patch b/meta-oe/recipes-devtools/lshw/files/0003-sysfs-Fix-basename-build-with-musl.patch
deleted file mode 100644
index 34924939d..000000000
--- a/meta-oe/recipes-devtools/lshw/files/0003-sysfs-Fix-basename-build-with-musl.patch
+++ /dev/null
@@ -1,92 +0,0 @@
-From a89f2ba8496994c8b5e28a89202df15d64c648f9 Mon Sep 17 00:00:00 2001
-From: Krzysztof Kozlowski <krzk@kernel.org>
-Date: Wed, 6 Jun 2018 12:47:02 +0200
-Subject: [PATCH] sysfs: Fix basename() build with musl
-
-musl provides only standard basename() which accepts non-const string.
-This fixes build error with musl C library:
-
-    | sysfs.cc: In function 'std::__cxx11::string sysfs_getbustype(const string&)':
-    | sysfs.cc:102:21: error: 'basename' was not declared in this scope
-    |        "/devices/" + basename(path.c_str());
-    |                      ^~~~~~~~
-
-Upstream-Status: Submitted
-Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
----
- src/core/dasd.cc  | 3 ++-
- src/core/sysfs.cc | 9 +++++----
- 2 files changed, 7 insertions(+), 5 deletions(-)
-
-diff --git a/src/core/dasd.cc b/src/core/dasd.cc
-index 626b8a872b0f..b27844215cc4 100644
---- a/src/core/dasd.cc
-+++ b/src/core/dasd.cc
-@@ -2,6 +2,7 @@
- #include "osutils.h"
- #include "dasd.h"
- #include <glob.h>
-+#include <libgen.h>
- #include <string.h>
- #include <fcntl.h>
- #include <unistd.h>
-@@ -42,7 +43,7 @@ bool scan_dasd(hwNode & n)
-   {
-     for(dev_num=0;dev_num<devices.gl_pathc;dev_num++)
-     {
--      dev_name = basename(devices.gl_pathv[dev_num]);
-+      dev_name = basename(const_cast<char *>(devices.gl_pathv[dev_num]));
-       for (std::vector<std::string>::iterator it = sysfs_attribs.begin(); it != sysfs_attribs.end(); ++it)
-       {
-         std::string attrib_fname = std::string(SYSFS_PREFIX) + dev_name + "/device/" + *it;
-diff --git a/src/core/sysfs.cc b/src/core/sysfs.cc
-index acc9d0056d5e..c56bab7b3b9f 100644
---- a/src/core/sysfs.cc
-+++ b/src/core/sysfs.cc
-@@ -7,6 +7,7 @@
- #include "version.h"
- #include "sysfs.h"
- #include "osutils.h"
-+#include <libgen.h>
- #include <limits.h>
- #include <unistd.h>
- #include <stdlib.h>
-@@ -99,7 +100,7 @@ static string sysfs_getbustype(const string & path)
-   {
-     devname =
-       string(fs.path + "/bus/") + string(namelist[i]->d_name) +
--      "/devices/" + basename(path.c_str());
-+      "/devices/" + basename(const_cast<char *>(path.c_str()));
- 
-     if (samefile(devname, path))
-       return string(namelist[i]->d_name);
-@@ -139,7 +140,7 @@ static string sysfstobusinfo(const string & path)
- 
-   if (bustype == "virtio")
-   {
--    string name = basename(path.c_str());
-+    string name = basename(const_cast<char *>(path.c_str()));
-     if (name.compare(0, 6, "virtio") == 0)
-       return "virtio@" + name.substr(6);
-     else
-@@ -207,7 +208,7 @@ string entry::driver() const
-   string driverlink = This->devpath + "/driver";
-   if (!exists(driverlink))
-     return "";
--  return basename(readlink(driverlink).c_str());
-+  return basename(const_cast<char *>(readlink(driverlink).c_str()));
- }
- 
- 
-@@ -288,7 +289,7 @@ string entry::name_in_class(const string & classname) const
- 
- string entry::name() const
- {
--  return basename(This->devpath.c_str());
-+  return basename(const_cast<char *>(This->devpath.c_str()));
- }
- 
- 
--- 
-2.7.4
-
diff --git a/meta-oe/recipes-devtools/lshw/lshw_02.18.bb b/meta-oe/recipes-devtools/lshw/lshw_02.19.2.bb
similarity index 71%
rename from meta-oe/recipes-devtools/lshw/lshw_02.18.bb
rename to meta-oe/recipes-devtools/lshw/lshw_02.19.2.bb
index d1a733424..a26fac992 100644
--- a/meta-oe/recipes-devtools/lshw/lshw_02.18.bb
+++ b/meta-oe/recipes-devtools/lshw/lshw_02.19.2.bb
@@ -13,12 +13,10 @@ COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
 
 SRC_URI = " \
     http://ezix.org/software/files/lshw-B.${PV}.tar.gz \
-    file://0001-Makefile-Fix-cross-compilation.patch \
-    file://0002-Makefile-Use-supplied-LDFLAGS-to-silence-OE-GNU_HASH.patch \
-    file://0003-sysfs-Fix-basename-build-with-musl.patch \
+    file://0001-Fix-musl-build.patch \
 "
-SRC_URI[md5sum] = "8671c6d94d6324a744b7f21f1bfecfd2"
-SRC_URI[sha256sum] = "ae22ef11c934364be4fd2a0a1a7aadf4495a0251ec6979da280d342a89ca3c2f"
+SRC_URI[md5sum] = "8c70d46e906688309095c73ecb9396e3"
+SRC_URI[sha256sum] = "9bb347ac87142339a366a1759ac845e3dbb337ec000aa1b99b50ac6758a80f80"
 
 S = "${WORKDIR}/lshw-B.${PV}"
 
-- 
2.17.1

