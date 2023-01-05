Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C57AC3DA7A
	for <webhook@archiver.kernel.org>; Thu,  5 Jan 2023 12:01:41 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.11109.1672920099359137605
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Jan 2023 04:01:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FD2Cbk8j;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id bn26so16415392wrb.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Jan 2023 04:01:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hYObMkLAySUElExT04HHKNw7wfjX6ICzEOIlzurzgVM=;
        b=FD2Cbk8juF8QDP/ruY+1MLpmTawqel8UmGQ9gT0naDHleWlHtLByH7lwSHyOA+IVWt
         e7N9MoFYS5KtHluylaCdc2A2GK/ZcGgvgzzmY7uQMp9tjrThVH3eRVfA3IJHSGuiiSa3
         sFTGYaeVt8gcdMRcizouCq5fxYos+Pm3hxzm0XHodbsVhWySDUlTroN+DV8C6gj6tP7m
         2Ic6fKB4HjaEGL6YrljTqaL79pRtn8zl1uEB7Ghw/+YSrPHIhL7IUR/wLsZy5nGj9s0U
         D7oBjumnxOOHnU74Ufk7zNn1RPDSkV12qPOXDihcZD2MC9SXQZhJYYjdPAFVwroPWgGr
         Td8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hYObMkLAySUElExT04HHKNw7wfjX6ICzEOIlzurzgVM=;
        b=q/6Y0vwuOfTL9mfKvfz4KtHE889AXa+QKxTM6xCv7I9XK99TpxNfIGzQM44qePorn0
         Ll/9GkBZrEULS9/23ocYoFiIar96EDTkOIll5BvrIxpbNcS4gjxwcFr7UO0OfAGJNRoa
         JOJx0cDNi0wVIgaaJfb8/7aWBwyk9yxrMyXnlk9SUSqFYOoZAH62/pSeawIFtyXcW9qb
         THMmlthVAYtMt9aVmGJM0yYvY6SpyKl4V60uwPHtbvHrxgMBrdXRf3M5wHnyKfYTDIVZ
         w2uF+6wm5q2wB/tS0NvkcEGCPKFqtR1vhafAIIdKFCwMMrjqTKtPxpUYQFEsu5SmNELN
         7pTQ==
X-Gm-Message-State: AFqh2kpDGkTyUCHMaJsyIAYCDQeMvYJ2Kj1zyKUFNOrphNScaJOPlmHf
	38oQ+BUxZ5BizYx+lzUgBF+pQ+1mohe3tA==
X-Google-Smtp-Source: AMrXdXtWFvE09XnPhxRWU8pWCDnAdJQrRgts6e+LjY72kcDqOVvERLy/UebYfWQPqo5UBOC+m2/+1Q==
X-Received: by 2002:a5d:538a:0:b0:26f:dae9:2b1d with SMTP id d10-20020a5d538a000000b0026fdae92b1dmr31279870wrv.14.1672920097419;
        Thu, 05 Jan 2023 04:01:37 -0800 (PST)
Received: from og-worker-dev-01.infra.foundries.io.net (51-159-19-113.rev.poneytelecom.eu. [51.159.19.113])
        by smtp.gmail.com with ESMTPSA id c11-20020a5d4ccb000000b002b6bcc0b64dsm273152wrt.4.2023.01.05.04.01.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jan 2023 04:01:36 -0800 (PST)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-devel@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [meta-oe][PATCH] lshw: bump to 42fef565
Date: Thu,  5 Jan 2023 12:00:49 +0000
Message-Id: <20230105120049.3070935-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Jan 2023 12:01:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100413

* gettext is need for translation
* riscv64 machines are supported
* add packageconfig support for sqlite and zlib
  - add native pkgconfig
  - enable zlib as it will reduce considerable the data files sizes
* patches
  - add 0001-disable-docbook2man.patch to not build .sgml file
  - drop 0001-Fix-musl-build.patch as it is merged in:
   https://github.com/lyonel/lshw/commit/d3c66a6b2a0799d6982f4dc77b291934fcba80c9
   https://github.com/lyonel/lshw/commit/0140f7f28a09d33dc46531212d095da5e021b027

Changelog:
- PA-RISC: handle pushd failure
- make version check optional
- Github PR85  Set product name for all netdevs sharing the same PCI number
- Merge pull request 'Add Spanish translation' (#48) from alexhenrie/lshw:es into master
- Merge branch 'master' into es
- Merge pull request 'Fix mistakes in Catalan translation' (#47) from alexhenrie/lshw:ca into master
- Add Spanish translation
- Fix mistakes in Catalan translation
- Merge pull request 'Add Catalan translation' (#46) from alexhenrie/lshw:ca into master
- merge Github PR#77
- use max (9) Gzip compression
- Add Catalan translation
- Update POT file
- Add more network speeds
- Merge pull request 'Remove unnecessary space before closing parenthesis' (#45) from alexhenrie/lshw:punctuation into master
- Merge pull request 'Translate all words of a phrase together' (#44) from alexhenrie/lshw:legos into master
- Merge pull request 'Fix another typo' (#43) from alexhenrie/lshw:typos into master
- Merge branch 'master' of https://ezix.org/src/pkg/lshw
- add some includes
- fix typo
- cosmetic fixes
- support for new ethtool capabilities
- code clean-up
- code clean-up
- allow pkg-config override
- allow pkg-config override
- Remove unnecessary space before closing parenthesis
- Translate all words of a phrase together
- Fix another typo
- Merge pull request 'Fix typos in translatable messages' (#42) from alexhenrie/lshw:typos into master
- Fix typos in translatable messages
- Fix getting size of memory banks <32GiB
- Merge pull request 'devtree: Add UUID property' (#40) from hegdevasant/lshw:lpar-uuid into master
- devtree: Add UUID property
- code clean-up
- improve portability (esp. musl)
- fix potential crash
- add static target to Makefile
- Avoid crash on device-tree parsing
- Add JEDEC manufacturer
- Report correct memory size on SMBIOS < 2.7
- fix man page after previous update
- update man page
- Update 'docs/TODO'
- Update 'docs/TODO'
- Merge pull request 'Replace the about GtkDialog with a GtkAboutDialog' (#39) from linkmauve/lshw:better-about into master
- Replace the about GtkDialog with a GtkAboutDialog
- Merge pull request 'Move from GtkMenuBar to GMenu' (#38) from linkmauve/lshw:gmenu into master
- Move from GtkMenuBar to GMenu
- Merge pull request 'Switch to gtk3 by default for gtk-lshw' (#37) from linkmauve/lshw:gtk3 into master
- Enable/Disable GSimpleAction instead of button sensitivity
- Replace signals with GSimpleActions
- Move to GtkApplication
- Remove deprecated use_action_appearance property
- Remove deprecated widgets
- Replace the last GtkStock in overwrite dialog
- Replace deprecated GtkIconFactory with GHashTable
- Use GtkFileChooserNative instead of GtkFileChooserDialog
- Remove hack which is apparently not useful anymore
- Remove deprecated stock messages
- Build against gtk3 instead of gtk2
- Merge pull request 'Fix few memory leaks' (#34) from shivaprasadbhat/lshw:master into master
- Fix few memory leaks
- report product model on Power systems
- clean-up JSON output
- JSON output clean-up (list/object)
- code clean-up for read(3)
- Merge pull request 'devtree: Add capabilites to the OPAL Firmware' (#33) from shivaprasadbhat/lshw:master into master
- Merge pull request 'volumes: fix segfault in apfs volume code' (#32) from hjmallon/lshw:pr.segfault into master
- fix issue with logical names being truncated (`/dev/sda` → `sda`)
- devtree: Add capabilites to the OPAL Firmware
- merge Github PR #53
- volumes: fix segfault in apfs volume code
- Merge pull request 'devtree: Add chip-id from CPU node' (#31) from shivaprasadbhat/lshw:master into master
- devtree: Add chip-id from CPU node
- Merge pull request 'devtree: Add chip-id from the dimm module' (#30) from shivaprasadbhat/lshw:master into master
- devtree: Add chip-id from the dimm module
- try to connect input devices to the right parent
- detect framebuffers
- detect sound devices
- cosmetic fixes
- begin work on input devices
- cosmetic clean-up
- correctly format SMBIOS UUID
- move PnP devices to the ISA/LPC bridge
- report CPU family/model/stepping
- get rid of RPM's debug packages
- add debug flag to GUI build

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 .../lshw/files/0001-Fix-musl-build.patch      | 125 ------------------
 .../lshw/files/0001-disable-docbook2man.patch |  30 +++++
 meta-oe/recipes-devtools/lshw/lshw_02.19.2.bb |  23 +++-
 3 files changed, 47 insertions(+), 131 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/lshw/files/0001-Fix-musl-build.patch
 create mode 100644 meta-oe/recipes-devtools/lshw/files/0001-disable-docbook2man.patch

diff --git a/meta-oe/recipes-devtools/lshw/files/0001-Fix-musl-build.patch b/meta-oe/recipes-devtools/lshw/files/0001-Fix-musl-build.patch
deleted file mode 100644
index fa90aa121..000000000
--- a/meta-oe/recipes-devtools/lshw/files/0001-Fix-musl-build.patch
+++ /dev/null
@@ -1,125 +0,0 @@
-From a5a4bb4254b2109bd3e272174946f0bb36ee99a8 Mon Sep 17 00:00:00 2001
-From: Leon Anavi <leon.anavi@konsulko.com>
-Date: Tue, 25 Aug 2020 11:45:45 +0300
-Subject: [PATCH] Fix musl build
-
-Apply the following fixes for musl:
-
-- Fix basename() is in libgen.h
-- Fix wrong usage of LONG_BIT
-
-Same fixes have been submitted to the upstream of lshw by Sergio
-Prado but they have not been merged yet.
-
-Upstream-Status: Submitted
-
-Co-Authored-By: Sergio Prado <sergio.prado@e-labworks.com>
-Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
----
- src/core/abi.cc   |  4 +---
- src/core/sysfs.cc | 19 ++++++++++---------
- 2 files changed, 11 insertions(+), 12 deletions(-)
-
-diff --git a/src/core/abi.cc b/src/core/abi.cc
-index adff7b5..76c664c 100644
---- a/src/core/abi.cc
-+++ b/src/core/abi.cc
-@@ -20,9 +20,7 @@ __ID("@(#) $Id: mem.cc 1352 2006-05-27 23:54:13Z ezix $");
- bool scan_abi(hwNode & system)
- {
-   // are we compiled as 32- or 64-bit process ?
--  long sc = sysconf(LONG_BIT);
--  if(sc==-1) sc = sysconf(_SC_LONG_BIT);
--  if(sc!=-1) system.setWidth(sc);
-+  system.setWidth(LONG_BIT);
- 
-   pushd(PROC_SYS);
- 
-diff --git a/src/core/sysfs.cc b/src/core/sysfs.cc
-index 32d6564..c2fa84f 100644
---- a/src/core/sysfs.cc
-+++ b/src/core/sysfs.cc
-@@ -16,6 +16,7 @@
- #include <sys/stat.h>
- #include <sys/types.h>
- #include <sys/mount.h>
-+#include <libgen.h>
- 
- 
- __ID("@(#) $Id$");
-@@ -100,7 +101,7 @@ static string sysfs_getbustype(const string & path)
-   {
-     devname =
-       string(fs.path + "/bus/") + string(namelist[i]->d_name) +
--      "/devices/" + basename(path.c_str());
-+      "/devices/" + basename(const_cast<char*>(path.c_str()));
- 
-     if (samefile(devname, path))
-       return string(namelist[i]->d_name);
-@@ -140,7 +141,7 @@ static string sysfstobusinfo(const string & path)
- 
-   if (bustype == "usb")
-   {
--    string name = basename(path.c_str());
-+    string name = basename(const_cast<char*>(path.c_str()));
-     if (matches(name, "^[0-9]+-[0-9]+(\\.[0-9]+)*:[0-9]+\\.[0-9]+$"))
-     {
-       size_t colon = name.rfind(":");
-@@ -151,7 +152,7 @@ static string sysfstobusinfo(const string & path)
- 
-   if (bustype == "virtio")
-   {
--    string name = basename(path.c_str());
-+    string name = basename(const_cast<char*>(path.c_str()));
-     if (name.compare(0, 6, "virtio") == 0)
-       return "virtio@" + name.substr(6);
-     else
-@@ -159,10 +160,10 @@ static string sysfstobusinfo(const string & path)
-   }
- 
-   if (bustype == "vio")
--    return string("vio@") + basename(path.c_str());
-+    return string("vio@") + basename(const_cast<char*>(path.c_str()));
- 
-   if (bustype == "ccw")
--    return string("ccw@") + basename(path.c_str());
-+    return string("ccw@") + basename(const_cast<char*>(path.c_str()));
- 
-   if (bustype == "ccwgroup")
-   {
-@@ -240,7 +241,7 @@ string entry::driver() const
-   string driverlink = This->devpath + "/driver";
-   if (!exists(driverlink))
-     return "";
--  return basename(readlink(driverlink).c_str());
-+  return basename(const_cast<char*>(readlink(driverlink).c_str()));
- }
- 
- 
-@@ -328,7 +329,7 @@ string entry::name_in_class(const string & classname) const
- 
- string entry::name() const
- {
--  return basename(This->devpath.c_str());
-+  return basename(const_cast<char*>(This->devpath.c_str()));
- }
- 
- 
-@@ -340,12 +341,12 @@ entry entry::parent() const
- 
- string entry::classname() const
- {
--  return basename(dirname(This->devpath).c_str());
-+  return basename(const_cast<char*>(dirname(This->devpath).c_str()));
- }
- 
- bool entry::isvirtual() const
- {
--  return string(basename(dirname(dirname(This->devpath)).c_str())) == "virtual";
-+  return string(basename(const_cast<char*>(dirname(dirname(This->devpath)).c_str()))) == "virtual";
- }
- 
- string entry::string_attr(const string & name, const string & def) const
--- 
-2.17.1
-
diff --git a/meta-oe/recipes-devtools/lshw/files/0001-disable-docbook2man.patch b/meta-oe/recipes-devtools/lshw/files/0001-disable-docbook2man.patch
new file mode 100644
index 000000000..00f7b8674
--- /dev/null
+++ b/meta-oe/recipes-devtools/lshw/files/0001-disable-docbook2man.patch
@@ -0,0 +1,30 @@
+From 544df0f5fd99925a3ce568c777413e0c31cb0028 Mon Sep 17 00:00:00 2001
+From: Jose Quaresma <jose.quaresma@foundries.io>
+Date: Mon, 2 Jan 2023 15:32:39 +0000
+Subject: [PATCH] build: Do not build .sgml file
+
+It needs docbook2man tool which we do not have recipe for
+
+Upstream-Status: OE-Specific [needs native docbook2man tool]
+
+Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
+---
+ src/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/Makefile b/src/Makefile
+index ac726d0..af6281d 100644
+--- a/src/Makefile
++++ b/src/Makefile
+@@ -102,7 +102,7 @@ $(PACKAGENAME)-compressed: $(PACKAGENAME)-static
+ 	upx -9 -o $@ $<
+ 
+ $(PACKAGENAME).1: $(PACKAGENAME).sgml
+-	docbook2man $<
++	@echo "Needs docbook2man"
+ 
+ pci.ids:
+ 	wget http://pciids.sourceforge.net/pci.ids
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-devtools/lshw/lshw_02.19.2.bb b/meta-oe/recipes-devtools/lshw/lshw_02.19.2.bb
index 8b3608a24..f2de593cf 100644
--- a/meta-oe/recipes-devtools/lshw/lshw_02.19.2.bb
+++ b/meta-oe/recipes-devtools/lshw/lshw_02.19.2.bb
@@ -9,16 +9,27 @@ SECTION = "console/tools"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
+COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64|riscv64).*-linux"
 
+PV .= "+git${SRCPV}"
+SRCREV = "42fef565731411a784101de614a54bff79d1858e"
 SRC_URI = " \
-    http://ezix.org/software/files/lshw-B.${PV}.tar.gz \
-    file://0001-Fix-musl-build.patch \
+    git://github.com/lyonel/lshw.git;protocol=https;branch=master \
+    file://0001-disable-docbook2man.patch \
 "
-SRC_URI[md5sum] = "8c70d46e906688309095c73ecb9396e3"
-SRC_URI[sha256sum] = "9bb347ac87142339a366a1759ac845e3dbb337ec000aa1b99b50ac6758a80f80"
 
-S = "${WORKDIR}/lshw-B.${PV}"
+S = "${WORKDIR}/git"
+
+inherit pkgconfig
+
+DEPENDS = "gettext-native"
+
+PACKAGECONFIG ??= "zlib"
+PACKAGECONFIG[sqlite] = "SQLITE=1,SQLITE=0,sqlite3"
+PACKAGECONFIG[zlib]   = "ZLIB=1,ZLIB=0,zlib gzip-native"
+
+# use the PACKAGECONFIG configurations arguments
+EXTRA_OEMAKE = "${PACKAGECONFIG_CONFARGS}"
 
 do_compile() {
     # build core only - don't ship gui
-- 
2.34.1


