Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
	[209.85.214.179])
	by mail.openembedded.org (Postfix) with ESMTP id 44B3B7F44E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Aug 2019 21:05:35 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id gn20so3901633plb.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Aug 2019 14:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=HfMBsba8SEjoRO1M2Hoz/2FKs3oWrBBFQ33BBhJRr7c=;
	b=ZNlNM1RKqwYjyg98Fxrolv6eTAsHrPRXZ2HCVej2y4SImoWmKT0Uo906Yps16vCmCH
	MFDmEZmcS5Zb6Q4IeYoJGRFG2+r0gy0X3wTae5SPCd8FDYAjY+sTMJgQzl8XqZn2ecZl
	m/yZ52+w72Js4bYjeRF+2o68QNFkr4/jGeJd3M9rUNVS+FxwlFMrFyEm5cGFHxrCu4gw
	aQ606Glx5lOamdpWm+nKt1T0lWuz5lHvEj3AI7FwK7lIf9v2USVk+vAze3UtmOH3947F
	iWcwmP2uc1WWuOBdlzv0NR5aVUr2QCiOFl6Av6TYgEQDdTdnkhmtK4Bp947UwFeQATKr
	V6Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=HfMBsba8SEjoRO1M2Hoz/2FKs3oWrBBFQ33BBhJRr7c=;
	b=h/CdsgEh/8eZ3PBoEU1y4Wx1rze4Cs46LsWW8NoL/wPAhu4updlwmLYvP5EdkSkfJJ
	SqdJSUB85NtgSjgjvY7370oQP26uK4hpz71tgiyKQ6OKM6k6jPJ5X+80GhdKTIB6qska
	661DBIYdHJfQ6aLa8jlKBAcJHN9dKGvMqidGHCfuJi40ZDH1zw2IiNFJ4QHcedwxmMLp
	xfX6TL037BSTw6YIMmWVKwS65cylLKIIrcuNvZRVcmu58QSoIdFLKrUAxTGH7LzL6lIz
	U3GmOpl1o8O7n0YKRIGbpVKzZ6oGjK5AxGmmP5jeJzrrNzzrow3CLyzi/G8rNWyQyguF
	tnyg==
X-Gm-Message-State: APjAAAXSliXjWlH1CzDZAdMf8S6JbuwDH4J/vElrEmj3hVyJe/JJLiJE
	7kefvMJAgjIiVLCDbG8XXxo/NnXBHfk=
X-Google-Smtp-Source: APXvYqzcrYKtXnhv3L4mP5rlyxX2TbWC+RFByrAdWts8iblgpHhJM34ure80r//PrRxT3AC7V2I7+A==
X-Received: by 2002:a17:902:7792:: with SMTP id
	o18mr1947009pll.73.1567199135323; 
	Fri, 30 Aug 2019 14:05:35 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	o35sm5492576pgm.29.2019.08.30.14.05.34
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 30 Aug 2019 14:05:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Aug 2019 14:05:26 -0700
Message-Id: <20190830210526.37048-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] ssiapi: Upgrade to 1.3.0
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
X-List-Received-Date: Fri, 30 Aug 2019 21:05:36 -0000
Content-Transfer-Encoding: 8bit

Fix out of tree builds
Fix build with clang as well as musl
Refresh and forward port patches as needed

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../ssiapi/0001-Don-t-use-__GNUC_PREREQ.patch |  116 ++
 .../ssiapi/ssiapi/0001-Include-libgen.h.patch |   32 +
 ...0001-Use-pragma-once-unconditionally.patch |  872 -------------
 ...oid-shadowing-functions-from-std-lib.patch |   57 +
 ...ordered-comparison-between-pointers-.patch |   39 -
 .../0002-Convert-macros-into-functions.patch  |  123 --
 .../ssiapi/0002-Use-stangard-int-types.patch  |   54 +
 .../0002-boost-Backport-clang-support.patch   | 1080 +++++++++++++++++
 ...nicalize_file_name-with-realpath-API.patch |   33 -
 ...scover-const-String-path-in-base-cla.patch |   47 +
 ...canonicalize_file_name-with-realpath.patch |   43 +
 ...-flags-coming-from-build-environment.patch |   33 +
 ...x-indentation-and-missing-semi-colon.patch |   54 -
 .../ssiapi/ssiapi/0004-include-limits.h.patch |   25 +
 ...005-enable-out-of-source-tree-builds.patch |  228 ++++
 .../ssiapi/0005-engine-Define-SENTINEL.patch  |   40 -
 ...g-includes-and-use-realpath-instead-.patch |   40 -
 .../ssiapi/ssiapi/configure-cflags.patch      |   21 -
 .../recipes-support/ssiapi/ssiapi_1.0.1.bb    |   35 -
 .../recipes-support/ssiapi/ssiapi_1.3.0.bb    |   36 +
 20 files changed, 1751 insertions(+), 1257 deletions(-)
 create mode 100644 meta-oe/recipes-support/ssiapi/ssiapi/0001-Don-t-use-__GNUC_PREREQ.patch
 create mode 100644 meta-oe/recipes-support/ssiapi/ssiapi/0001-Include-libgen.h.patch
 delete mode 100644 meta-oe/recipes-support/ssiapi/ssiapi/0001-Use-pragma-once-unconditionally.patch
 create mode 100644 meta-oe/recipes-support/ssiapi/ssiapi/0001-log-Avoid-shadowing-functions-from-std-lib.patch
 delete mode 100644 meta-oe/recipes-support/ssiapi/ssiapi/0001-ssieventmonitor-ordered-comparison-between-pointers-.patch
 delete mode 100644 meta-oe/recipes-support/ssiapi/ssiapi/0002-Convert-macros-into-functions.patch
 create mode 100644 meta-oe/recipes-support/ssiapi/ssiapi/0002-Use-stangard-int-types.patch
 create mode 100644 meta-oe/recipes-support/ssiapi/ssiapi/0002-boost-Backport-clang-support.patch
 delete mode 100644 meta-oe/recipes-support/ssiapi/ssiapi/0003-Replace-canonicalize_file_name-with-realpath-API.patch
 create mode 100644 meta-oe/recipes-support/ssiapi/ssiapi/0003-engine-Define-discover-const-String-path-in-base-cla.patch
 create mode 100644 meta-oe/recipes-support/ssiapi/ssiapi/0003-replace-canonicalize_file_name-with-realpath.patch
 create mode 100644 meta-oe/recipes-support/ssiapi/ssiapi/0004-Do-not-override-flags-coming-from-build-environment.patch
 delete mode 100644 meta-oe/recipes-support/ssiapi/ssiapi/0004-engine-Fix-indentation-and-missing-semi-colon.patch
 create mode 100644 meta-oe/recipes-support/ssiapi/ssiapi/0004-include-limits.h.patch
 create mode 100644 meta-oe/recipes-support/ssiapi/ssiapi/0005-enable-out-of-source-tree-builds.patch
 delete mode 100644 meta-oe/recipes-support/ssiapi/ssiapi/0005-engine-Define-SENTINEL.patch
 delete mode 100644 meta-oe/recipes-support/ssiapi/ssiapi/0006-tools-Add-missing-includes-and-use-realpath-instead-.patch
 delete mode 100644 meta-oe/recipes-support/ssiapi/ssiapi/configure-cflags.patch
 delete mode 100644 meta-oe/recipes-support/ssiapi/ssiapi_1.0.1.bb
 create mode 100644 meta-oe/recipes-support/ssiapi/ssiapi_1.3.0.bb

diff --git a/meta-oe/recipes-support/ssiapi/ssiapi/0001-Don-t-use-__GNUC_PREREQ.patch b/meta-oe/recipes-support/ssiapi/ssiapi/0001-Don-t-use-__GNUC_PREREQ.patch
new file mode 100644
index 0000000000..d9190e5bdf
--- /dev/null
+++ b/meta-oe/recipes-support/ssiapi/ssiapi/0001-Don-t-use-__GNUC_PREREQ.patch
@@ -0,0 +1,116 @@
+From dd6ad8ca447457c812809791ab8622da8646104c Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 30 Aug 2019 13:07:33 -0700
+Subject: [PATCH] Don't use __GNUC_PREREQ
+
+These are not official GCC predefined macros; they are macros defined
+by GNU libc and some versions of BSD libc for internal use by their
+own headers, and we shouldn't be using them without checking for their
+availability first
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lib/efi/efi.h           | 4 ++--
+ lib/engine/pragma.h     | 4 ++--
+ lib/log/log.h           | 4 ++--
+ lib/mpb/machine_bytes.h | 4 ++--
+ lib/mpb/mpb.h           | 4 ++--
+ lib/orom/orom.h         | 4 ++--
+ 6 files changed, 12 insertions(+), 12 deletions(-)
+
+diff --git a/lib/efi/efi.h b/lib/efi/efi.h
+index 0620d9c..c8358db 100644
+--- a/lib/efi/efi.h
++++ b/lib/efi/efi.h
+@@ -33,9 +33,9 @@
+ #include <features.h>
+ #include <ssi.h>
+ 
+-#if __GNUC_PREREQ(3, 4)
++#if ((defined __GNUC__ && __GNUC__ >= 3 && __GNUC_MINOR__ >= 4) || defined __clang__)
+ #pragma once
+-#endif /* __GNUC_PREREQ */
++#endif
+ 
+ #if defined(__cplusplus)
+ extern "C" {
+diff --git a/lib/engine/pragma.h b/lib/engine/pragma.h
+index 8205ed3..fa0b268 100644
+--- a/lib/engine/pragma.h
++++ b/lib/engine/pragma.h
+@@ -32,9 +32,9 @@
+ 
+ #include <features.h>
+ 
+-#if __GNUC_PREREQ(3, 4)
++#if ((defined __GNUC__ && __GNUC__ >= 3 && __GNUC_MINOR__ >= 4) || defined __clang__)
+ #define SSI_HAS_PRAGMA_ONCE
+-#endif /* __GNUC_PREREQ */
++#endif
+ 
+ #ifdef SSI_HAS_PRAGMA_ONCE
+ #pragma once
+diff --git a/lib/log/log.h b/lib/log/log.h
+index 66a707b..ca5000a 100644
+--- a/lib/log/log.h
++++ b/lib/log/log.h
+@@ -32,9 +32,9 @@
+ 
+ #include <features.h>
+ 
+-#if __GNUC_PREREQ(3, 4)
++#if ((defined __GNUC__ && __GNUC__ >= 3 && __GNUC_MINOR__ >= 4) || defined __clang__)
+ #pragma once
+-#endif /* __GNUC_PREREQ */
++#endif
+ 
+ #if defined(__cplusplus)
+ extern "C" {
+diff --git a/lib/mpb/machine_bytes.h b/lib/mpb/machine_bytes.h
+index 6cb81c9..807461f 100644
+--- a/lib/mpb/machine_bytes.h
++++ b/lib/mpb/machine_bytes.h
+@@ -27,9 +27,9 @@
+  * EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+  */
+ 
+-#if __GNUC_PREREQ(3, 4)
++#if ((defined __GNUC__ && __GNUC__ >= 3 && __GNUC_MINOR__ >= 4) || defined __clang__)
+ #pragma once
+-#endif /* __GNUC_PREREQ */
++#endif
+ 
+ #ifndef __ENDIAN_H__INCLUDED__
+ #define __ENDIAN_H__INCLUDED__
+diff --git a/lib/mpb/mpb.h b/lib/mpb/mpb.h
+index 32beb21..98f82fe 100644
+--- a/lib/mpb/mpb.h
++++ b/lib/mpb/mpb.h
+@@ -27,9 +27,9 @@
+  * EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+  */
+ 
+-#if __GNUC_PREREQ(3, 4)
++#if ((defined __GNUC__ && __GNUC__ >= 3 && __GNUC_MINOR__ >= 4) || defined __clang__)
+ #pragma once
+-#endif /* __GNUC_PREREQ */
++#endif
+ 
+ #ifndef __MPB_H__INCLUDED__
+ #define __MPB_H__INCLUDED__
+diff --git a/lib/orom/orom.h b/lib/orom/orom.h
+index 4492066..16b03a6 100644
+--- a/lib/orom/orom.h
++++ b/lib/orom/orom.h
+@@ -32,9 +32,9 @@
+ 
+ #include <features.h>
+ 
+-#if __GNUC_PREREQ(3, 4)
++#if ((defined __GNUC__ && __GNUC__ >= 3 && __GNUC_MINOR__ >= 4) || defined __clang__)
+ #pragma once
+-#endif /* __GNUC_PREREQ */
++#endif
+ 
+ #if defined(__cplusplus)
+ extern "C" {
diff --git a/meta-oe/recipes-support/ssiapi/ssiapi/0001-Include-libgen.h.patch b/meta-oe/recipes-support/ssiapi/ssiapi/0001-Include-libgen.h.patch
new file mode 100644
index 0000000000..fd44571b69
--- /dev/null
+++ b/meta-oe/recipes-support/ssiapi/ssiapi/0001-Include-libgen.h.patch
@@ -0,0 +1,32 @@
+From 258a1d128581f185a7a5070f47df06e5c29c9db8 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 30 Aug 2019 13:43:32 -0700
+Subject: [PATCH] Include libgen.h
+
+Use XPG version of basename on non gnu libc systems
+ideally posix version should be used everywhere but that
+would be upstreams choice to make
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ tools/ssieventmonitor.cpp | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/tools/ssieventmonitor.cpp b/tools/ssieventmonitor.cpp
+index 0d11975..af7e09c 100644
+--- a/tools/ssieventmonitor.cpp
++++ b/tools/ssieventmonitor.cpp
+@@ -39,7 +39,9 @@
+ #include <sys/select.h>
+ #include <sys/wait.h>
+ #include <sys/inotify.h>
+-
++#ifndef __GLIBC__
++#include <libgen.h>
++#endif
+ extern "C" {
+ #include "lib/safeclib/safe_str_lib.h"
+ }
+-- 
+2.23.0
+
diff --git a/meta-oe/recipes-support/ssiapi/ssiapi/0001-Use-pragma-once-unconditionally.patch b/meta-oe/recipes-support/ssiapi/ssiapi/0001-Use-pragma-once-unconditionally.patch
deleted file mode 100644
index ef6ae00e3d..0000000000
--- a/meta-oe/recipes-support/ssiapi/ssiapi/0001-Use-pragma-once-unconditionally.patch
+++ /dev/null
@@ -1,872 +0,0 @@
-From 3100e23c50e38bff0c2ec77bc30049c113c29414 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 16 Jun 2017 20:44:31 -0700
-Subject: [PATCH 1/6] Use pragma once unconditionally
-
-in OE we do not worry about supporting
-gcc 3.4 anyway
-
-Upstream-Status: Inappropriate[Bumps required gcc to be > 3.4]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- lib/efi/efi.h                     | 2 --
- lib/engine/ahci.h                 | 2 --
- lib/engine/ahci_cdrom.h           | 2 --
- lib/engine/ahci_disk.h            | 2 --
- lib/engine/ahci_multiplier.h      | 2 --
- lib/engine/ahci_multiplier_phy.h  | 2 --
- lib/engine/ahci_multiplier_port.h | 2 --
- lib/engine/ahci_phy.h             | 2 --
- lib/engine/ahci_port.h            | 2 --
- lib/engine/ahci_raid_info.h       | 2 --
- lib/engine/ahci_tape.h            | 2 --
- lib/engine/array.h                | 2 --
- lib/engine/block_device.h         | 2 --
- lib/engine/cache.h                | 2 --
- lib/engine/container.h            | 2 --
- lib/engine/context_manager.h      | 2 --
- lib/engine/controller.h           | 2 --
- lib/engine/enclosure.h            | 2 --
- lib/engine/end_device.h           | 2 --
- lib/engine/event.h                | 2 --
- lib/engine/event_manager.h        | 2 --
- lib/engine/exception.h            | 2 --
- lib/engine/filesystem.h           | 2 --
- lib/engine/isci.h                 | 2 --
- lib/engine/isci_cdrom.h           | 2 --
- lib/engine/isci_disk.h            | 2 --
- lib/engine/isci_expander.h        | 2 --
- lib/engine/isci_expander_phy.h    | 2 --
- lib/engine/isci_expander_port.h   | 2 --
- lib/engine/isci_phy.h             | 2 --
- lib/engine/isci_port.h            | 2 --
- lib/engine/isci_raid_info.h       | 2 --
- lib/engine/isci_tape.h            | 2 --
- lib/engine/list.h                 | 2 --
- lib/engine/mdadm_config.h         | 2 --
- lib/engine/multimedia_device.h    | 2 --
- lib/engine/nondisk_device.h       | 2 --
- lib/engine/object.h               | 2 --
- lib/engine/pci_header.h           | 2 --
- lib/engine/phy.h                  | 2 --
- lib/engine/port.h                 | 2 --
- lib/engine/raid_device.h          | 2 --
- lib/engine/raid_info.h            | 2 --
- lib/engine/remote_port.h          | 2 --
- lib/engine/routing_device.h       | 2 --
- lib/engine/session.h              | 2 --
- lib/engine/session_manager.h      | 2 --
- lib/engine/storage_device.h       | 2 --
- lib/engine/stream_device.h        | 2 --
- lib/engine/string.h               | 2 --
- lib/engine/unique_id_manager.h    | 2 --
- lib/engine/utils.h                | 2 --
- lib/engine/volume.h               | 2 --
- lib/log/log.h                     | 2 --
- lib/mpb/machine_bytes.h           | 2 --
- lib/mpb/mpb.h                     | 2 --
- lib/orom/orom.h                   | 2 --
- 57 files changed, 114 deletions(-)
-
-diff --git a/lib/efi/efi.h b/lib/efi/efi.h
-index 9e7e41b..804e567 100644
---- a/lib/efi/efi.h
-+++ b/lib/efi/efi.h
-@@ -15,9 +15,7 @@ THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
- 
- 
- 
--#if __GNUC_PREREQ(3, 4)
- #pragma once
--#endif /* __GNUC_PREREQ */
- 
- #ifndef __EFI_H__INCLUDED__
- #define __EFI_H__INCLUDED__
-diff --git a/lib/engine/ahci.h b/lib/engine/ahci.h
-index e883d1a..80a9699 100644
---- a/lib/engine/ahci.h
-+++ b/lib/engine/ahci.h
-@@ -15,9 +15,7 @@ THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
- 
- 
- 
--#if __GNUC_PREREQ(3, 4)
- #pragma once
--#endif /* __GNUC_PREREQ */
- 
- #ifndef __AHCI_H__INCLUDED__
- #define __AHCI_H__INCLUDED__
-diff --git a/lib/engine/ahci_cdrom.h b/lib/engine/ahci_cdrom.h
-index 442f301..d8ca042 100644
---- a/lib/engine/ahci_cdrom.h
-+++ b/lib/engine/ahci_cdrom.h
-@@ -15,9 +15,7 @@ THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
- 
- 
- 
--#if __GNUC_PREREQ(3, 4)
- #pragma once
--#endif /* __GNUC_PREREQ */
- 
- #ifndef __AHCI_CDROM_H__INCLUDED__
- #define __AHCI_CDROM_H__INCLUDED__
-diff --git a/lib/engine/ahci_disk.h b/lib/engine/ahci_disk.h
-index 7892a53..1bad9ad 100644
---- a/lib/engine/ahci_disk.h
-+++ b/lib/engine/ahci_disk.h
-@@ -15,9 +15,7 @@ THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
- 
- 
- 
--#if __GNUC_PREREQ(3, 4)
- #pragma once
--#endif /* __GNUC_PREREQ */
- 
- #ifndef __AHCI_DISK_H__INCLUDED__
- #define __AHCI_DISK_H__INCLUDED__
-diff --git a/lib/engine/ahci_multiplier.h b/lib/engine/ahci_multiplier.h
-index d63e9bc..1029af2 100644
---- a/lib/engine/ahci_multiplier.h
-+++ b/lib/engine/ahci_multiplier.h
-@@ -15,9 +15,7 @@ THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
- 
- 
- 
--#if __GNUC_PREREQ(3, 4)
- #pragma once
--#endif /* __GNUC_PREREQ */
- 
- #ifndef __AHCI_MULTIPLIER_H__INCLUDED__
- #define __AHCI_MULTIPLIER_H__INCLUDED__
-diff --git a/lib/engine/ahci_multiplier_phy.h b/lib/engine/ahci_multiplier_phy.h
-index 58ecebc..2132c23 100644
---- a/lib/engine/ahci_multiplier_phy.h
-+++ b/lib/engine/ahci_multiplier_phy.h
-@@ -15,9 +15,7 @@ THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
- 
- 
- 
--#if __GNUC_PREREQ(3, 4)
- #pragma once
--#endif /* __GNUC_PREREQ */
- 
- #ifndef __AHCI_MULTIPLIER_PHY_H__INCLUDED__
- #define __AHCI_MULTIPLIER_PHY_H__INCLUDED__
-diff --git a/lib/engine/ahci_multiplier_port.h b/lib/engine/ahci_multiplier_port.h
-index 5ff4cf7..2402473 100644
---- a/lib/engine/ahci_multiplier_port.h
-+++ b/lib/engine/ahci_multiplier_port.h
-@@ -15,9 +15,7 @@ THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
- 
- 
- 
--#if __GNUC_PREREQ(3, 4)
- #pragma once
--#endif /* __GNUC_PREREQ */
- 
- #ifndef __AHCI_MULTIPLIER_PORT_H__INCLUDED__
- #define __AHCI_MULTIPLIER_PORT_H__INCLUDED__
-diff --git a/lib/engine/ahci_phy.h b/lib/engine/ahci_phy.h
-index e2254e7..a44dae0 100644
---- a/lib/engine/ahci_phy.h
-+++ b/lib/engine/ahci_phy.h
-@@ -15,9 +15,7 @@ THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
- 
- 
- 
--#if __GNUC_PREREQ(3, 4)
- #pragma once
--#endif /* __GNUC_PREREQ */
- 
- #ifndef __AHCI_PHY_H__INCLUDED__
- #define __AHCI_PHY_H__INCLUDED__
-diff --git a/lib/engine/ahci_port.h b/lib/engine/ahci_port.h
-index f9e3308..03c109b 100644
---- a/lib/engine/ahci_port.h
-+++ b/lib/engine/ahci_port.h
-@@ -15,9 +15,7 @@ THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
- 
- 
- 
--#if __GNUC_PREREQ(3, 4)
- #pragma once
--#endif /* __GNUC_PREREQ */
- 
- #ifndef __AHCI_PORT_H__INCLUDED__
- #define __AHCI_PORT_H__INCLUDED__
-diff --git a/lib/engine/ahci_raid_info.h b/lib/engine/ahci_raid_info.h
-index e1c81ae..c70e63e 100644
---- a/lib/engine/ahci_raid_info.h
-+++ b/lib/engine/ahci_raid_info.h
-@@ -15,9 +15,7 @@ THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
- 
- 
- 
--#if __GNUC_PREREQ(3, 4)
- #pragma once
--#endif /* __GNUC_PREREQ */
- 
- #ifndef __AHCI_RAID_INFO_H__INCLUDED__
- #define __AHCI_RAID_INFO_H__INCLUDED__
-diff --git a/lib/engine/ahci_tape.h b/lib/engine/ahci_tape.h
-index cdd9f13..a91fd2c 100644
---- a/lib/engine/ahci_tape.h
-+++ b/lib/engine/ahci_tape.h
-@@ -15,9 +15,7 @@ THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
- 
- 
- 
--#if __GNUC_PREREQ(3, 4)
- #pragma once
--#endif /* __GNUC_PREREQ */
- 
- #ifndef __AHCI_TAPE_H__INCLUDED__
- #define __AHCI_TAPE_H__INCLUDED__
-diff --git a/lib/engine/array.h b/lib/engine/array.h
-index 36fb4a4..0986ce3 100644
---- a/lib/engine/array.h
-+++ b/lib/engine/array.h
-@@ -15,9 +15,7 @@ THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
- 
- 
- 
--#if __GNUC_PREREQ(3, 4)
- #pragma once
--#endif /* __GNUC_PREREQ */
- 
- #ifndef __ARRAY_H__INCLUDED__
- #define __ARRAY_H__INCLUDED__
-diff --git a/lib/engine/block_device.h b/lib/engine/block_device.h
-index 4503914..45dd3db 100644
---- a/lib/engine/block_device.h
-+++ b/lib/engine/block_device.h
-@@ -15,9 +15,7 @@ THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
- 
- 
- 
--#if __GNUC_PREREQ(3, 4)
- #pragma once
--#endif /* __GNUC_PREREQ */
- 
- #ifndef __BLOCK_DEVICE_H__INCLUDED__
- #define __BLOCK_DEVICE_H__INCLUDED__
-diff --git a/lib/engine/cache.h b/lib/engine/cache.h
-index 72cf521..72da20b 100644
---- a/lib/engine/cache.h
-+++ b/lib/engine/cache.h
-@@ -15,9 +15,7 @@ THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
- 
- 
- 
--#if __GNUC_PREREQ(3,4)
- #pragma once
--#endif /* __GNUC_PREREQ */
- 
- #ifndef __CACHE_H__INCLUDED__
- #define __CACHE_H__INCLUDED__
-diff --git a/lib/engine/container.h b/lib/engine/container.h
-index 53867b0..c71180c 100644
---- a/lib/engine/container.h
-+++ b/lib/engine/container.h
-@@ -15,9 +15,7 @@ THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
- 
- 
- 
--#if __GNUC_PREREQ(3,4)
- #pragma once
--#endif /* __GNUC_PREREQ */
- 
- #ifndef __CONTAINER_H__INCLUDED__
- #define __CONTAINER_H__INCLUDED__
-diff --git a/lib/engine/context_manager.h b/lib/engine/context_manager.h
-index fe9c256..6b4a2e7 100644
---- a/lib/engine/context_manager.h
-+++ b/lib/engine/context_manager.h
-@@ -15,9 +15,7 @@ THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
- 
- 
- 
--#if __GNUC_PREREQ(3,4)
- #pragma once
--#endif /* __GNUC_PREREQ */
- 
- #ifndef __CONTEXT_H__INCLUDED__
- #define __CONTEXT_H__INCLUDED__
-diff --git a/lib/engine/controller.h b/lib/engine/controller.h
-index a2f188a..6bd078f 100644
---- a/lib/engine/controller.h
-+++ b/lib/engine/controller.h
-@@ -15,9 +15,7 @@ THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
- 
- 
- 
--#if __GNUC_PREREQ(3, 4)
- #pragma once
--#endif /* __GNUC_PREREQ */
- 
- #ifndef __CONTROLLER_H__INCLUDED__
- #define __CONTROLLER_H__INCLUDED__
-diff --git a/lib/engine/enclosure.h b/lib/engine/enclosure.h
-index 3faef0c..f4b13cc 100644
---- a/lib/engine/enclosure.h
-+++ b/lib/engine/enclosure.h
-@@ -15,9 +15,7 @@ THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
- 
- 
- 
--#if __GNUC_PREREQ(3, 4)
- #pragma once
--#endif /* __GNUC_PREREQ */
- 
- #ifndef __ENCLOSURE_H__INCLUDED__
- #define __ENCLOSURE_H__INCLUDED__
-diff --git a/lib/engine/end_device.h b/lib/engine/end_device.h
-index f147e41..269b236 100644
---- a/lib/engine/end_device.h
-+++ b/lib/engine/end_device.h
-@@ -15,9 +15,7 @@ THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
- 
- 
- 
--#if __GNUC_PREREQ(3, 4)
- #pragma once
--#endif /* __GNUC_PREREQ */
- 
- #ifndef __END_DEVICE_H__INCLUDED__
- #define __END_DEVICE_H__INCLUDED__
-diff --git a/lib/engine/event.h b/lib/engine/event.h
-index cf9bb4f..11a4926 100644
---- a/lib/engine/event.h
-+++ b/lib/engine/event.h
-@@ -12,9 +12,7 @@ Redistribution and use in source and binary forms, with or without modification,
- THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
- */
- 
--#if __GNUC_PREREQ(3, 4)
- #pragma once
--#endif /* __GNUC_PREREQ */
- 
- #ifndef __EVENT_H__INCLUDED__
- #define __EVENT_H__INCLUDED__
-diff --git a/lib/engine/event_manager.h b/lib/engine/event_manager.h
-index 65007b9..a7a8fc3 100644
---- a/lib/engine/event_manager.h
-+++ b/lib/engine/event_manager.h
-@@ -15,9 +15,7 @@ THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
- 
- 
- 
--#if __GNUC_PREREQ(3, 4)
- #pragma once
--#endif /* __GNUC_PREREQ */
- 
- #ifndef __EVENT_MANAGER_H__INCLUDED__
- #define __EVENT_MANAGER_H__INCLUDED__
-diff --git a/lib/engine/exception.h b/lib/engine/exception.h
-index 171e45d..183ebb5 100644
---- a/lib/engine/exception.h
-+++ b/lib/engine/exception.h
-@@ -15,9 +15,7 @@ THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
- 
- 
- 
--#if __GNUC_PREREQ(3, 4)
- #pragma once
--#endif /* __GNUC_PREREQ */
- 
- #ifndef __EXCEPTION_H__INCLUDED__
- #define __EXCEPTION_H__INCLUDED__
-diff --git a/lib/engine/filesystem.h b/lib/engine/filesystem.h
-index 9c2ce39..b49df07 100644
---- a/lib/engine/filesystem.h
-+++ b/lib/engine/filesystem.h
-@@ -15,9 +15,7 @@ THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
- 
- 
- 
--#if __GNUC_PREREQ(3, 4)
- #pragma once
--#endif /* __GNUC_PREREQ */
- 
- #ifndef __FILESYSTEM_H__INCLUDED__
- #define __FILESYSTEM_H__INCLUDED__
-diff --git a/lib/engine/isci.h b/lib/engine/isci.h
-index ea35cd4..0fa602a 100644
---- a/lib/engine/isci.h
-+++ b/lib/engine/isci.h
-@@ -15,9 +15,7 @@ THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
- 
- 
- 
--#if __GNUC_PREREQ(3, 4)
- #pragma once
--#endif /* __GNUC_PREREQ */
- 
- #ifndef __ISCI_H__INCLUDED__
- #define __ISCI_H__INCLUDED__
-diff --git a/lib/engine/isci_cdrom.h b/lib/engine/isci_cdrom.h
-index 87b7e7b..25637f9 100644
---- a/lib/engine/isci_cdrom.h
-+++ b/lib/engine/isci_cdrom.h
-@@ -15,9 +15,7 @@ THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
- 
- 
- 
--#if __GNUC_PREREQ(3, 4)
- #pragma once
--#endif /* __GNUC_PREREQ */
- 
- #ifndef __ISCI_CDROM_H__INCLUDED__
- #define __ISCI_CDROM_H__INCLUDED__
-diff --git a/lib/engine/isci_disk.h b/lib/engine/isci_disk.h
-index 596c3cf..8dd0dae 100644
---- a/lib/engine/isci_disk.h
-+++ b/lib/engine/isci_disk.h
-@@ -15,9 +15,7 @@ THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
- 
- 
- 
--#if __GNUC_PREREQ(3, 4)
- #pragma once
--#endif /* __GNUC_PREREQ */
- 
- #ifndef __ISCI_DISK_H__INCLUDED__
- #define __ISCI_DISK_H__INCLUDED__
-diff --git a/lib/engine/isci_expander.h b/lib/engine/isci_expander.h
-index ca7c2f1..7dc1920 100644
---- a/lib/engine/isci_expander.h
-+++ b/lib/engine/isci_expander.h
-@@ -15,9 +15,7 @@ THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
- 
- 
- 
--#if __GNUC_PREREQ(3, 4)
- #pragma once
--#endif /* __GNUC_PREREQ */
- 
- #ifndef __ISCI_EXPANDER_H__INCLUDED__
- #define __ISCI_EXPANDER_H__INCLUDED__
-diff --git a/lib/engine/isci_expander_phy.h b/lib/engine/isci_expander_phy.h
-index c9cd770..d3d2832 100644
---- a/lib/engine/isci_expander_phy.h
-+++ b/lib/engine/isci_expander_phy.h
-@@ -15,9 +15,7 @@ THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
- 
- 
- 
--#if __GNUC_PREREQ(3, 4)
- #pragma once
--#endif /* __GNUC_PREREQ */
- 
- #ifndef __ISCI_EXPANDER_PHY_H__INCLUDED__
- #define __ISCI_EXPANDER_PHY_H__INCLUDED__
-diff --git a/lib/engine/isci_expander_port.h b/lib/engine/isci_expander_port.h
-index e65a124..4fc9310 100644
---- a/lib/engine/isci_expander_port.h
-+++ b/lib/engine/isci_expander_port.h
-@@ -15,9 +15,7 @@ THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
- 
- 
- 
--#if __GNUC_PREREQ(3, 4)
- #pragma once
--#endif /* __GNUC_PREREQ */
- 
- #ifndef __ISCI_EXPANDER_PORT_H__INCLUDED__
- #define __ISCI_EXPANDER_PORT_H__INCLUDED__
-diff --git a/lib/engine/isci_phy.h b/lib/engine/isci_phy.h
-index 767a5b2..105c697 100644
---- a/lib/engine/isci_phy.h
-+++ b/lib/engine/isci_phy.h
-@@ -15,9 +15,7 @@ THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
- 
- 
- 
--#if __GNUC_PREREQ(3, 4)
- #pragma once
--#endif /* __GNUC_PREREQ */
- 
- #ifndef __ISCI_PHY_H__INCLUDED__
- #define __ISCI_PHY_H__INCLUDED__
-diff --git a/lib/engine/isci_port.h b/lib/engine/isci_port.h
-index b80be7f..5ccc151 100644
---- a/lib/engine/isci_port.h
-+++ b/lib/engine/isci_port.h
-@@ -15,9 +15,7 @@ THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
- 
- 
- 
--#if __GNUC_PREREQ(3, 4)
- #pragma once
--#endif /* __GNUC_PREREQ */
- 
- #ifndef __ISCI_PORT_H__INCLUDED__
- #define __ISCI_PORT_H__INCLUDED__
-diff --git a/lib/engine/isci_raid_info.h b/lib/engine/isci_raid_info.h
-index 1df6477..b0b046a 100644
---- a/lib/engine/isci_raid_info.h
-+++ b/lib/engine/isci_raid_info.h
-@@ -15,9 +15,7 @@ THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
- 
- 
- 
--#if __GNUC_PREREQ(3, 4)
- #pragma once
--#endif /* __GNUC_PREREQ */
- 
- #ifndef __ISCI_RAID_INFO_H__INCLUDED__
- #define __ISCI_RAID_INFO_H__INCLUDED__
-diff --git a/lib/engine/isci_tape.h b/lib/engine/isci_tape.h
-index 985f767..a2cef2d 100644
---- a/lib/engine/isci_tape.h
-+++ b/lib/engine/isci_tape.h
-@@ -15,9 +15,7 @@ THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
- 
- 
- 
--#if __GNUC_PREREQ(3, 4)
- #pragma once
--#endif /* __GNUC_PREREQ */
- 
- #ifndef __ISCI_TAPE_H__INCLUDED__
- #define __ISCI_TAPE_H__INCLUDED__
-diff --git a/lib/engine/list.h b/lib/engine/list.h
-index 9a7c3c3..6395830 100644
---- a/lib/engine/list.h
-+++ b/lib/engine/list.h
-@@ -15,9 +15,7 @@ THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
- 
- 
- 
--#if __GNUC_PREREQ(3, 4)
- #pragma once
--#endif /* __GNUC_PREREQ */
- 
- #ifndef __LIST_H__INCLUDED__
- #define __LIST_H__INCLUDED__
-diff --git a/lib/engine/mdadm_config.h b/lib/engine/mdadm_config.h
-index c94020f..e415b4f 100644
---- a/lib/engine/mdadm_config.h
-+++ b/lib/engine/mdadm_config.h
-@@ -11,9 +11,7 @@ Redistribution and use in source and binary forms, with or without modification,
- THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
- */
- 
--#if __GNUC_PREREQ(3, 4)
- #pragma once
--#endif /* __GNUC_PREREQ */
- 
- #ifndef __MDADM_CONFIG_H__INCLUDED__
- #define __MDADM_CONFIG_H__INCLUDED__
-diff --git a/lib/engine/multimedia_device.h b/lib/engine/multimedia_device.h
-index 533370e..694e2a5 100644
---- a/lib/engine/multimedia_device.h
-+++ b/lib/engine/multimedia_device.h
-@@ -15,9 +15,7 @@ THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
- 
- 
- 
--#if __GNUC_PREREQ(3, 4)
- #pragma once
--#endif /* __GNUC_PREREQ */
- 
- #ifndef __MULTIMEDIA_DEVICE_H__INCLUDED__
- #define __MULTIMEDIA_DEVICE_H__INCLUDED__
-diff --git a/lib/engine/nondisk_device.h b/lib/engine/nondisk_device.h
-index 70ebb32..0f00e52 100644
---- a/lib/engine/nondisk_device.h
-+++ b/lib/engine/nondisk_device.h
-@@ -15,9 +15,7 @@ THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
- 
- 
- 
--#if __GNUC_PREREQ(3, 4)
- #pragma once
--#endif /* __GNUC_PREREQ */
- 
- #ifndef __CHARACTER_DEVICE_H__INCLUDED__
- #define __CHARACTER_DEVICE_H__INCLUDED__
-diff --git a/lib/engine/object.h b/lib/engine/object.h
-index b52d3d3..345d58c 100644
---- a/lib/engine/object.h
-+++ b/lib/engine/object.h
-@@ -15,9 +15,7 @@ THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
- 
- 
- 
--#if __GNUC_PREREQ(3, 4)
- #pragma once
--#endif /* __GNUC_PREREQ */
- 
- #ifndef __OBJECT_H__INCLUDED__
- #define __OBJECT_H__INCLUDED__
-diff --git a/lib/engine/pci_header.h b/lib/engine/pci_header.h
-index 376f296..c5129a0 100644
---- a/lib/engine/pci_header.h
-+++ b/lib/engine/pci_header.h
-@@ -15,9 +15,7 @@ THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
- 
- 
- 
--#if __GNUC_PREREQ(3, 4)
- #pragma once
--#endif /* __GNUC_PREREQ */
- 
- #ifndef __PCI_HEADER_H__INCLUDED__
- #define __PCI_HEADER_H__INCLUDED__
-diff --git a/lib/engine/phy.h b/lib/engine/phy.h
-index f5730a0..c59f7c8 100644
---- a/lib/engine/phy.h
-+++ b/lib/engine/phy.h
-@@ -15,9 +15,7 @@ THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
- 
- 
- 
--#if __GNUC_PREREQ(3, 4)
- #pragma once
--#endif /* __GNUC_PREREQ */
- 
- #ifndef __PHY_H__INCLUDED__
- #define __PHY_H__INCLUDED__
-diff --git a/lib/engine/port.h b/lib/engine/port.h
-index 2f33876..cc48c7c 100644
---- a/lib/engine/port.h
-+++ b/lib/engine/port.h
-@@ -15,9 +15,7 @@ THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
- 
- 
- 
--#if __GNUC_PREREQ(3,4)
- #pragma once
--#endif /* __GNUC_PREREQ */
- 
- #ifndef __PORT_H__INCLUDED__
- #define __PORT_H__INCLUDED__
-diff --git a/lib/engine/raid_device.h b/lib/engine/raid_device.h
-index 998e80c..2174162 100644
---- a/lib/engine/raid_device.h
-+++ b/lib/engine/raid_device.h
-@@ -15,9 +15,7 @@ THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
- 
- 
- 
--#if __GNUC_PREREQ(3, 4)
- #pragma once
--#endif /* __GNUC_PREREQ */
- 
- #ifndef __RAID_DEVICE_H__INCLUDED__
- #define __RAID_DEVICE_H__INCLUDED__
-diff --git a/lib/engine/raid_info.h b/lib/engine/raid_info.h
-index 174698a..302be9b 100644
---- a/lib/engine/raid_info.h
-+++ b/lib/engine/raid_info.h
-@@ -15,9 +15,7 @@ THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
- 
- 
- 
--#if __GNUC_PREREQ(3, 4)
- #pragma once
--#endif /* __GNUC_PREREQ */
- 
- #ifndef __RAID_INFO_H__INCLUDED__
- #define __RAID_INFO_H__INCLUDED__
-diff --git a/lib/engine/remote_port.h b/lib/engine/remote_port.h
-index c086656..4ddfee3 100644
---- a/lib/engine/remote_port.h
-+++ b/lib/engine/remote_port.h
-@@ -15,9 +15,7 @@ THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
- 
- 
- 
--#if __GNUC_PREREQ(3, 4)
- #pragma once
--#endif /* __GNUC_PREREQ */
- 
- #ifndef __REMOTE_PORT_H__INCLUDED__
- #define __REMOTE_PORT_H__INCLUDED__
-diff --git a/lib/engine/routing_device.h b/lib/engine/routing_device.h
-index 5f857a6..284621e 100644
---- a/lib/engine/routing_device.h
-+++ b/lib/engine/routing_device.h
-@@ -15,9 +15,7 @@ THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
- 
- 
- 
--#if __GNUC_PREREQ(3, 4)
- #pragma once
--#endif /* __GNUC_PREREQ */
- 
- #ifndef __ROUTING_DEVICE_H__INCLUDED__
- #define __ROUTING_DEVICE_H__INCLUDED__
-diff --git a/lib/engine/session.h b/lib/engine/session.h
-index a901d1c..3200da1 100644
---- a/lib/engine/session.h
-+++ b/lib/engine/session.h
-@@ -15,9 +15,7 @@ THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
- 
- 
- 
--#if __GNUC_PREREQ(3, 4)
- #pragma once
--#endif /* __GNUC_PREREQ */
- 
- #ifndef __SESSION_H__INCLUDED__
- #define __SESSION_H__INCLUDED__
-diff --git a/lib/engine/session_manager.h b/lib/engine/session_manager.h
-index 7177064..87e16c3 100644
---- a/lib/engine/session_manager.h
-+++ b/lib/engine/session_manager.h
-@@ -15,9 +15,7 @@ THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
- 
- 
- 
--#if __GNUC_PREREQ(3, 4)
- #pragma once
--#endif /* __GNUC_PREREQ */
- 
- #ifndef __SESSION_MANAGER_H__INCLUDED__
- #define __SESSION_MANAGER_H__INCLUDED__
-diff --git a/lib/engine/storage_device.h b/lib/engine/storage_device.h
-index ddeb66f..20bdab2 100644
---- a/lib/engine/storage_device.h
-+++ b/lib/engine/storage_device.h
-@@ -15,9 +15,7 @@ THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
- 
- 
- 
--#if __GNUC_PREREQ(3, 4)
- #pragma once
--#endif /* __GNUC_PREREQ */
- 
- #ifndef __STORAGE_DEVICE_H__INCLUDED__
- #define __STORAGE_DEVICE_H__INCLUDED__
-diff --git a/lib/engine/stream_device.h b/lib/engine/stream_device.h
-index 9bc111a..b29bd68 100644
---- a/lib/engine/stream_device.h
-+++ b/lib/engine/stream_device.h
-@@ -15,9 +15,7 @@ THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
- 
- 
- 
--#if __GNUC_PREREQ(3, 4)
- #pragma once
--#endif /* __GNUC_PREREQ */
- 
- #ifndef __STREAM_DEVICE_H__INCLUDED__
- #define __STREAM_DEVICE_H__INCLUDED__
-diff --git a/lib/engine/string.h b/lib/engine/string.h
-index 3007dc7..6f348c9 100644
---- a/lib/engine/string.h
-+++ b/lib/engine/string.h
-@@ -15,9 +15,7 @@ THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
- 
- 
- 
--#if __GNUC_PREREQ(3, 4)
- #pragma once
--#endif /* __GNUC_PREREQ */
- 
- #ifndef __STRING_H__INCLUDED__
- #define __STRING_H__INCLUDED__
-diff --git a/lib/engine/unique_id_manager.h b/lib/engine/unique_id_manager.h
-index fe79eac..4a13627 100644
---- a/lib/engine/unique_id_manager.h
-+++ b/lib/engine/unique_id_manager.h
-@@ -15,9 +15,7 @@ THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
- 
- 
- 
--#if __GNUC_PREREQ(3, 4)
- #pragma once
--#endif /* __GNUC_PREREQ */
- 
- #ifndef __UNIQUE_ID_MANAGER_H__INCLUDED__
- #define __UNIQUE_ID_MANAGER_H__INCLUDED__
-diff --git a/lib/engine/utils.h b/lib/engine/utils.h
-index 86c20cf..5525303 100644
---- a/lib/engine/utils.h
-+++ b/lib/engine/utils.h
-@@ -15,9 +15,7 @@ THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
- 
- 
- 
--#if __GNUC_PREREQ(3, 4)
- #pragma once
--#endif /* __GNUC_PREREQ */
- 
- #ifndef __UTILS_H__INCLUDED__
- #define __UTILS_H__INCLUDED__
-diff --git a/lib/engine/volume.h b/lib/engine/volume.h
-index 9a63cbf..3347b31 100644
---- a/lib/engine/volume.h
-+++ b/lib/engine/volume.h
-@@ -15,9 +15,7 @@ THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
- 
- 
- 
--#if __GNUC_PREREQ(3, 4)
- #pragma once
--#endif /* __GNUC_PREREQ */
- 
- // Forward declarations
- class Array;
-diff --git a/lib/log/log.h b/lib/log/log.h
-index c0bd63e..8b5f171 100644
---- a/lib/log/log.h
-+++ b/lib/log/log.h
-@@ -15,9 +15,7 @@ THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
- 
- 
- 
--#if __GNUC_PREREQ(3, 4)
- #pragma once
--#endif /* __GNUC_PREREQ */
- 
- #ifndef __LOG_H__INCLUDED__
- #define __LOG_H__INCLUDED__
-diff --git a/lib/mpb/machine_bytes.h b/lib/mpb/machine_bytes.h
-index 7fbb0e9..800b120 100644
---- a/lib/mpb/machine_bytes.h
-+++ b/lib/mpb/machine_bytes.h
-@@ -15,9 +15,7 @@ THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
- 
- 
- 
--#if __GNUC_PREREQ(3, 4)
- #pragma once
--#endif /* __GNUC_PREREQ */
- 
- #ifndef __ENDIAN_H__INCLUDED__
- #define __ENDIAN_H__INCLUDED__
-diff --git a/lib/mpb/mpb.h b/lib/mpb/mpb.h
-index 01782af..c42cdfb 100644
---- a/lib/mpb/mpb.h
-+++ b/lib/mpb/mpb.h
-@@ -15,9 +15,7 @@ THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
- 
- 
- 
--#if __GNUC_PREREQ(3, 4)
- #pragma once
--#endif /* __GNUC_PREREQ */
- 
- #ifndef __MPB_H__INCLUDED__
- #define __MPB_H__INCLUDED__
-diff --git a/lib/orom/orom.h b/lib/orom/orom.h
-index f76e3ee..e10311d 100644
---- a/lib/orom/orom.h
-+++ b/lib/orom/orom.h
-@@ -15,9 +15,7 @@ THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
- 
- 
- 
--#if __GNUC_PREREQ(3, 4)
- #pragma once
--#endif /* __GNUC_PREREQ */
- 
- #ifndef __OROM_H__INCLUDED__
- #define __OROM_H__INCLUDED__
--- 
-2.13.1
-
diff --git a/meta-oe/recipes-support/ssiapi/ssiapi/0001-log-Avoid-shadowing-functions-from-std-lib.patch b/meta-oe/recipes-support/ssiapi/ssiapi/0001-log-Avoid-shadowing-functions-from-std-lib.patch
new file mode 100644
index 0000000000..8fdbf3e60e
--- /dev/null
+++ b/meta-oe/recipes-support/ssiapi/ssiapi/0001-log-Avoid-shadowing-functions-from-std-lib.patch
@@ -0,0 +1,57 @@
+From 874da836bc857e5942675c59e19f4fd8ad09b13e Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 29 Aug 2019 14:08:19 -0700
+Subject: [PATCH 1/4] log: Avoid shadowing functions from std lib
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lib/log/log.c | 2 +-
+ lib/log/log.h | 8 ++++----
+ 2 files changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/lib/log/log.c b/lib/log/log.c
+index 7d8e17c..18b67a5 100644
+--- a/lib/log/log.c
++++ b/lib/log/log.c
+@@ -82,7 +82,7 @@ enum log_level log_get_level(void) {
+ }
+ 
+ /* */
+-void __log(enum log_level level, const char *message) {
++void _ssiap_log(enum log_level level, const char *message) {
+     struct tm tm;
+     struct timeval tv;
+ 
+diff --git a/lib/log/log.h b/lib/log/log.h
+index d94e482..66a707b 100644
+--- a/lib/log/log.h
++++ b/lib/log/log.h
+@@ -53,13 +53,13 @@ enum log_level {
+ };
+ 
+ /* */
+-#define log(__level, __message)                                 \
++#define ssiap_log(__level, __message)                           \
+     do { if (log_get_level() >= (enum log_level)(__level))      \
+-        __log(__level, __message);                              \
++        _ssiap_log(__level, __message);                              \
+     } while (0)
+ 
+ #define dlog(__message)                                 \
+-         log(LOG_DEBUG, __message);
++         ssiap_log(LOG_DEBUG, __message);
+ 
+ /* */
+ void log_init(enum log_level level, const char *path);
+@@ -68,7 +68,7 @@ void log_init(enum log_level level, const char *path);
+ void log_fini(void);
+ 
+ /* */
+-void __log(enum log_level level, const char *message);
++void _ssiap_log(enum log_level level, const char *message);
+ 
+ /* */
+ enum log_level log_get_level(void);
+-- 
+2.23.0
+
diff --git a/meta-oe/recipes-support/ssiapi/ssiapi/0001-ssieventmonitor-ordered-comparison-between-pointers-.patch b/meta-oe/recipes-support/ssiapi/ssiapi/0001-ssieventmonitor-ordered-comparison-between-pointers-.patch
deleted file mode 100644
index 27df9b5de3..0000000000
--- a/meta-oe/recipes-support/ssiapi/ssiapi/0001-ssieventmonitor-ordered-comparison-between-pointers-.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From ea9ecf4bf305f9509d5822b3823658a40162f43c Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 25 Jul 2017 19:08:21 -0700
-Subject: [PATCH] ssieventmonitor: ordered comparison between pointers and
- zero, actually with NULL
-
-Comparing which is large or small between a pointer and NULL
-however, looks completely illogical. Ordered comparison of
-two valid pointers is legit, but no pointer will be smaller
-than NULL , so comparing if a pointer is larger than NULL
-simply means if the pointer is not NULL.
-
-Fixes errors found with clang e.g.
-
-| ssieventmonitor.cpp:339:53: error: ordered comparison between pointer and zero ('char *' and 'int')
-|                 if (fgets(nextline, sizeof(nextline) - 1, mdstat) < 0) {
-|                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^ ~
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- tools/ssieventmonitor.cpp | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/tools/ssieventmonitor.cpp b/tools/ssieventmonitor.cpp
-index f04b8f0..7a00122 100644
---- a/tools/ssieventmonitor.cpp
-+++ b/tools/ssieventmonitor.cpp
-@@ -336,7 +336,7 @@ static int _read_mdstat(int fd)
- 	if (!strncmp(line, "md", 2)) {
- 	    if (strstr(line, INACTIVE_STR)) { /* possibly container */
- 		char nextline[1024];
--		if (fgets(nextline, sizeof(nextline) - 1, mdstat) < 0) {
-+		if (fgets(nextline, sizeof(nextline) - 1, mdstat) != (char *) NULL) {
- 		    fclose(mdstat);
- 		    return 1;
- 		}
--- 
-2.13.3
-
diff --git a/meta-oe/recipes-support/ssiapi/ssiapi/0002-Convert-macros-into-functions.patch b/meta-oe/recipes-support/ssiapi/ssiapi/0002-Convert-macros-into-functions.patch
deleted file mode 100644
index 351301cdc3..0000000000
--- a/meta-oe/recipes-support/ssiapi/ssiapi/0002-Convert-macros-into-functions.patch
+++ /dev/null
@@ -1,123 +0,0 @@
-From 1338ee4e69c465f8f381ec3bfe5058080236edba Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 16 Jun 2017 22:08:35 -0700
-Subject: [PATCH 2/6] Convert macros into functions
-
-This helps in fixing the security format warnings
-add -fno-builtin-log
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- lib/engine/Makefile.am |  3 ++-
- lib/log/Makefile.am    |  2 ++
- lib/log/log.h          | 34 +++++++++++++++++++++-------------
- src/Makefile.am        |  3 ++-
- 4 files changed, 27 insertions(+), 15 deletions(-)
-
-Index: ssiapi.1.0.1/lib/engine/Makefile.am
-===================================================================
---- ssiapi.1.0.1.orig/lib/engine/Makefile.am
-+++ ssiapi.1.0.1/lib/engine/Makefile.am
-@@ -113,4 +113,5 @@ libengine_la_SOURCES =          \
- libengine_la_CPPFLAGS =         \
-         -I$(top_srcdir)         \
-         -I$(top_srcdir)/include \
--        -I$(top_srcdir)/lib
-+        -I$(top_srcdir)/lib     \
-+        -fno-builtin-log
-Index: ssiapi.1.0.1/lib/log/Makefile.am
-===================================================================
---- ssiapi.1.0.1.orig/lib/log/Makefile.am
-+++ ssiapi.1.0.1/lib/log/Makefile.am
-@@ -5,3 +5,5 @@ noinst_LTLIBRARIES = liblog.la
- liblog_la_SOURCES =     \
-         log.c           \
-         log.h
-+
-+liblog_la_CPPFLAGS = -fno-builtin-log
-Index: ssiapi.1.0.1/lib/log/log.h
-===================================================================
---- ssiapi.1.0.1.orig/lib/log/log.h
-+++ ssiapi.1.0.1/lib/log/log.h
-@@ -23,7 +23,7 @@ THIS SOFTWARE IS PROVIDED BY THE COPYRIG
- #if defined(__cplusplus)
- extern "C" {
- #endif /* __cplusplus */
--
-+#include <stdarg.h>
- /* */
- enum log_level {
-     LOG_FIRST = 0,
-@@ -37,26 +37,34 @@ enum log_level {
- };
- 
- /* */
--#define log(__level, __format, ...)                             \
--    do { if (log_get_level() >= (enum log_level)(__level))      \
--        __log(__level, __format, ## __VA_ARGS__);               \
--    } while (0)
--
--#define dlog(__format, ...)                             \
--	log(LOG_DEBUG, __format, ## __VA_ARGS__);
-+void __log(enum log_level level, const char *format, ...)
-+    __attribute__((format(printf, 2, 3)));
- 
- /* */
--void log_init(enum log_level level, const char *path);
-+enum log_level log_get_level(void);
- 
- /* */
--void log_fini(void);
--
-+static inline void log(enum log_level __level, const char* __format, ...) {
-+    va_list ap;
-+    va_start(ap, __format);
-+    do {
-+         if (log_get_level() >= (enum log_level)(__level))
-+            __log(__level, __format, ap);
-+    } while (0);
-+    va_end(ap);
-+}
-+
-+static inline void dlog(const char* __format, ...) {
-+    va_list ap;
-+    va_start(ap, __format);
-+	log(LOG_DEBUG, __format, ap);
-+    va_end(ap);
-+}
- /* */
--void __log(enum log_level level, const char *format, ...)
--    __attribute__((format(printf, 2, 3)));
-+void log_init(enum log_level level, const char *path);
- 
- /* */
--enum log_level log_get_level(void);
-+void log_fini(void);
- 
- /* */
- void log_set_level(enum log_level level);
-Index: ssiapi.1.0.1/src/Makefile.am
-===================================================================
---- ssiapi.1.0.1.orig/src/Makefile.am
-+++ ssiapi.1.0.1/src/Makefile.am
-@@ -7,7 +7,8 @@ lib_LTLIBRARIES = libssi.la
- libssi_la_CPPFLAGS =                    \
-         -I$(top_srcdir)                 \
-         -I$(top_srcdir)/include         \
--        -I$(top_srcdir)/lib
-+        -I$(top_srcdir)/lib             \
-+        -fno-builtin-log
- 
- libssi_la_LDFLAGS =                     \
-         $(SGUTILS_LDFLAGS)              \
-Index: ssiapi.1.0.1/lib/efi/Makefile.am
-===================================================================
---- ssiapi.1.0.1.orig/lib/efi/Makefile.am
-+++ ssiapi.1.0.1/lib/efi/Makefile.am
-@@ -5,3 +5,4 @@ noinst_LTLIBRARIES = libefi.la
- libefi_la_SOURCES =             \
-     efi.cpp                       \
-     efi.h
-+libefi_la_CPPFLAGS = -fno-builtin-log
diff --git a/meta-oe/recipes-support/ssiapi/ssiapi/0002-Use-stangard-int-types.patch b/meta-oe/recipes-support/ssiapi/ssiapi/0002-Use-stangard-int-types.patch
new file mode 100644
index 0000000000..acc718d23d
--- /dev/null
+++ b/meta-oe/recipes-support/ssiapi/ssiapi/0002-Use-stangard-int-types.patch
@@ -0,0 +1,54 @@
+From 01a75b23382fd042673d1f00fce708ba6c67d05a Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 30 Aug 2019 13:12:54 -0700
+Subject: [PATCH] Use stangard int types
+
+__unitn_* are internal to GNU libc lets use portable types
+
+Fixes
+error: unknown type name '__uint8_t'
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lib/engine/end_device.cpp | 13 +++++++------
+ 1 file changed, 7 insertions(+), 6 deletions(-)
+
+diff --git a/lib/engine/end_device.cpp b/lib/engine/end_device.cpp
+index 5a66de9..da078bf 100644
+--- a/lib/engine/end_device.cpp
++++ b/lib/engine/end_device.cpp
+@@ -36,6 +36,7 @@
+ #include <sys/ioctl.h>
+ #include <fcntl.h>
+ #include <linux/hdreg.h>
++#include <stdint.h>
+ #include <unistd.h>
+ #include <linux/fs.h>
+ #include <climits>
+@@ -90,20 +91,20 @@ using boost::shared_ptr;
+ 
+ struct AtaCommand
+ {
+-    __uint8_t command;
+-    __uint8_t obsolete1;
+-    __uint8_t obsolete2;
+-    __uint8_t transportDependent;
++    uint8_t command;
++    uint8_t obsolete1;
++    uint8_t obsolete2;
++    uint8_t transportDependent;
+ };
+ 
+ struct AtaIdentifyCall
+ {
+     AtaCommand command;
+-    __uint16_t data[256];
++    uint16_t data[256];
+ };
+ 
+ namespace {
+-    __uint16_t swap(__uint16_t value)
++    uint16_t swap(uint16_t value)
+     {
+         return (value >> 8) | (value << 8);
+     }
diff --git a/meta-oe/recipes-support/ssiapi/ssiapi/0002-boost-Backport-clang-support.patch b/meta-oe/recipes-support/ssiapi/ssiapi/0002-boost-Backport-clang-support.patch
new file mode 100644
index 0000000000..9f4cd666f1
--- /dev/null
+++ b/meta-oe/recipes-support/ssiapi/ssiapi/0002-boost-Backport-clang-support.patch
@@ -0,0 +1,1080 @@
+From ef90544f8df369781a6ef094330c9cfa9f0ee1e4 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 29 Aug 2019 14:09:11 -0700
+Subject: [PATCH 2/4] boost: Backport clang support
+
+backport headers from boost 1.59
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lib/boost/config/compiler/clang.hpp           | 272 +++++++++
+ lib/boost/config/stdlib/libcpp.hpp            |  80 +++
+ lib/boost/cstdint.hpp                         | 542 ++++++++++++++++++
+ .../detail/sp_counted_base_clang.hpp          | 140 +++++
+ 4 files changed, 1034 insertions(+)
+ create mode 100644 lib/boost/config/compiler/clang.hpp
+ create mode 100644 lib/boost/config/stdlib/libcpp.hpp
+ create mode 100644 lib/boost/cstdint.hpp
+ create mode 100644 lib/boost/smart_ptr/detail/sp_counted_base_clang.hpp
+
+diff --git a/lib/boost/config/compiler/clang.hpp b/lib/boost/config/compiler/clang.hpp
+new file mode 100644
+index 0000000..52a55d4
+--- /dev/null
++++ b/lib/boost/config/compiler/clang.hpp
+@@ -0,0 +1,272 @@
++
++// (C) Copyright Douglas Gregor 2010
++//
++//  Use, modification and distribution are subject to the
++//  Boost Software License, Version 1.0. (See accompanying file
++//  LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)
++
++//  See http://www.boost.org for most recent version.
++
++// Clang compiler setup.
++
++#define BOOST_HAS_PRAGMA_ONCE
++
++// Detecting `-fms-extension` compiler flag assuming that _MSC_VER defined when that flag is used.
++#if defined (_MSC_VER) && (__clang_major__ > 3 || (__clang_major__ == 3 && __clang_minor__ >= 4))
++#   define BOOST_HAS_PRAGMA_DETECT_MISMATCH
++#endif
++
++// When compiling with clang before __has_extension was defined,
++// even if one writes 'defined(__has_extension) && __has_extension(xxx)',
++// clang reports a compiler error. So the only workaround found is:
++
++#ifndef __has_extension
++#define __has_extension __has_feature
++#endif
++
++#if !__has_feature(cxx_exceptions) && !defined(BOOST_NO_EXCEPTIONS)
++#  define BOOST_NO_EXCEPTIONS
++#endif
++
++#if !__has_feature(cxx_rtti) && !defined(BOOST_NO_RTTI)
++#  define BOOST_NO_RTTI
++#endif
++
++#if !__has_feature(cxx_rtti) && !defined(BOOST_NO_TYPEID)
++#  define BOOST_NO_TYPEID
++#endif
++
++#if defined(__int64) && !defined(__GNUC__)
++#  define BOOST_HAS_MS_INT64
++#endif
++
++#define BOOST_HAS_NRVO
++
++// Branch prediction hints
++#if defined(__has_builtin)
++#if __has_builtin(__builtin_expect)
++#define BOOST_LIKELY(x) __builtin_expect(x, 1)
++#define BOOST_UNLIKELY(x) __builtin_expect(x, 0)
++#endif
++#endif
++
++// Clang supports "long long" in all compilation modes.
++#define BOOST_HAS_LONG_LONG
++
++//
++// We disable this if the compiler is really nvcc as it
++// doesn't actually support __int128 as of CUDA_VERSION=5000
++// even though it defines __SIZEOF_INT128__.
++// See https://svn.boost.org/trac/boost/ticket/10418
++// Only re-enable this for nvcc if you're absolutely sure
++// of the circumstances under which it's supported:
++//
++#if defined(__SIZEOF_INT128__) && !defined(__CUDACC__)
++#  define BOOST_HAS_INT128
++#endif
++
++
++//
++// Dynamic shared object (DSO) and dynamic-link library (DLL) support
++//
++#if !defined(_WIN32) && !defined(__WIN32__) && !defined(WIN32)
++#  define BOOST_SYMBOL_EXPORT __attribute__((__visibility__("default")))
++#  define BOOST_SYMBOL_IMPORT
++#  define BOOST_SYMBOL_VISIBLE __attribute__((__visibility__("default")))
++#endif
++
++//
++// The BOOST_FALLTHROUGH macro can be used to annotate implicit fall-through
++// between switch labels.
++//
++#if __cplusplus >= 201103L && defined(__has_warning)
++#  if __has_feature(cxx_attributes) && __has_warning("-Wimplicit-fallthrough")
++#    define BOOST_FALLTHROUGH [[clang::fallthrough]]
++#  endif
++#endif
++
++#if !__has_feature(cxx_auto_type)
++#  define BOOST_NO_CXX11_AUTO_DECLARATIONS
++#  define BOOST_NO_CXX11_AUTO_MULTIDECLARATIONS
++#endif
++
++//
++// Currently clang on Windows using VC++ RTL does not support C++11's char16_t or char32_t
++//
++#if defined(_MSC_VER) || !(defined(__GXX_EXPERIMENTAL_CXX0X__) || __cplusplus >= 201103L)
++#  define BOOST_NO_CXX11_CHAR16_T
++#  define BOOST_NO_CXX11_CHAR32_T
++#endif
++
++#if !__has_feature(cxx_constexpr)
++#  define BOOST_NO_CXX11_CONSTEXPR
++#endif
++
++#if !__has_feature(cxx_decltype)
++#  define BOOST_NO_CXX11_DECLTYPE
++#endif
++
++#if !__has_feature(cxx_decltype_incomplete_return_types)
++#  define BOOST_NO_CXX11_DECLTYPE_N3276
++#endif
++
++#if !__has_feature(cxx_defaulted_functions)
++#  define BOOST_NO_CXX11_DEFAULTED_FUNCTIONS
++#endif
++
++#if !__has_feature(cxx_deleted_functions)
++#  define BOOST_NO_CXX11_DELETED_FUNCTIONS
++#endif
++
++#if !__has_feature(cxx_explicit_conversions)
++#  define BOOST_NO_CXX11_EXPLICIT_CONVERSION_OPERATORS
++#endif
++
++#if !__has_feature(cxx_default_function_template_args)
++#  define BOOST_NO_CXX11_FUNCTION_TEMPLATE_DEFAULT_ARGS
++#endif
++
++#if !__has_feature(cxx_generalized_initializers)
++#  define BOOST_NO_CXX11_HDR_INITIALIZER_LIST
++#endif
++
++#if !__has_feature(cxx_lambdas)
++#  define BOOST_NO_CXX11_LAMBDAS
++#endif
++
++#if !__has_feature(cxx_local_type_template_args)
++#  define BOOST_NO_CXX11_LOCAL_CLASS_TEMPLATE_PARAMETERS
++#endif
++
++#if !__has_feature(cxx_noexcept)
++#  define BOOST_NO_CXX11_NOEXCEPT
++#endif
++
++#if !__has_feature(cxx_nullptr)
++#  define BOOST_NO_CXX11_NULLPTR
++#endif
++
++#if !__has_feature(cxx_range_for)
++#  define BOOST_NO_CXX11_RANGE_BASED_FOR
++#endif
++
++#if !__has_feature(cxx_raw_string_literals)
++#  define BOOST_NO_CXX11_RAW_LITERALS
++#endif
++
++#if !__has_feature(cxx_reference_qualified_functions)
++#  define BOOST_NO_CXX11_REF_QUALIFIERS
++#endif
++
++#if !__has_feature(cxx_generalized_initializers)
++#  define BOOST_NO_CXX11_UNIFIED_INITIALIZATION_SYNTAX
++#endif
++
++#if !__has_feature(cxx_rvalue_references)
++#  define BOOST_NO_CXX11_RVALUE_REFERENCES
++#endif
++
++#if !__has_feature(cxx_strong_enums)
++#  define BOOST_NO_CXX11_SCOPED_ENUMS
++#endif
++
++#if !__has_feature(cxx_static_assert)
++#  define BOOST_NO_CXX11_STATIC_ASSERT
++#endif
++
++#if !__has_feature(cxx_alias_templates)
++#  define BOOST_NO_CXX11_TEMPLATE_ALIASES
++#endif
++
++#if !__has_feature(cxx_unicode_literals)
++#  define BOOST_NO_CXX11_UNICODE_LITERALS
++#endif
++
++#if !__has_feature(cxx_variadic_templates)
++#  define BOOST_NO_CXX11_VARIADIC_TEMPLATES
++#endif
++
++#if !__has_feature(cxx_user_literals)
++#  define BOOST_NO_CXX11_USER_DEFINED_LITERALS
++#endif
++
++#if !__has_feature(cxx_alignas)
++#  define BOOST_NO_CXX11_ALIGNAS
++#endif
++
++#if !__has_feature(cxx_trailing_return)
++#  define BOOST_NO_CXX11_TRAILING_RESULT_TYPES
++#endif
++
++#if !__has_feature(cxx_inline_namespaces)
++#  define BOOST_NO_CXX11_INLINE_NAMESPACES
++#endif
++
++#if !__has_feature(cxx_override_control)
++#  define BOOST_NO_CXX11_FINAL
++#endif
++
++#if !(__has_feature(__cxx_binary_literals__) || __has_extension(__cxx_binary_literals__))
++#  define BOOST_NO_CXX14_BINARY_LITERALS
++#endif
++
++#if !__has_feature(__cxx_decltype_auto__)
++#  define BOOST_NO_CXX14_DECLTYPE_AUTO
++#endif
++
++#if !__has_feature(__cxx_aggregate_nsdmi__)
++#  define BOOST_NO_CXX14_AGGREGATE_NSDMI
++#endif
++
++#if !__has_feature(__cxx_init_captures__)
++#  define BOOST_NO_CXX14_INITIALIZED_LAMBDA_CAPTURES
++#endif
++
++#if !__has_feature(__cxx_generic_lambdas__)
++#  define BOOST_NO_CXX14_GENERIC_LAMBDAS
++#endif
++
++// clang < 3.5 has a defect with dependent type, like following.
++//
++//  template <class T>
++//  constexpr typename enable_if<pred<T> >::type foo(T &)
++//  { } // error: no return statement in constexpr function
++//
++// This issue also affects C++11 mode, but C++11 constexpr requires return stmt.
++// Therefore we don't care such case.
++//
++// Note that we can't check Clang version directly as the numbering system changes depending who's
++// creating the Clang release (see https://github.com/boostorg/config/pull/39#issuecomment-59927873)
++// so instead verify that we have a feature that was introduced at the same time as working C++14
++// constexpr (generic lambda's in this case):
++//
++#if !__has_feature(__cxx_generic_lambdas__) || !__has_feature(__cxx_relaxed_constexpr__)
++#  define BOOST_NO_CXX14_CONSTEXPR
++#endif
++
++#if !__has_feature(__cxx_return_type_deduction__)
++#  define BOOST_NO_CXX14_RETURN_TYPE_DEDUCTION
++#endif
++
++#if !__has_feature(__cxx_variable_templates__)
++#  define BOOST_NO_CXX14_VARIABLE_TEMPLATES
++#endif
++
++#if __cplusplus < 201400
++// All versions with __cplusplus above this value seem to support this:
++#  define BOOST_NO_CXX14_DIGIT_SEPARATORS
++#endif
++
++
++// Unused attribute:
++#if defined(__GNUC__) && (__GNUC__ >= 4)
++#  define BOOST_ATTRIBUTE_UNUSED __attribute__((unused))
++#endif
++
++#ifndef BOOST_COMPILER
++#  define BOOST_COMPILER "Clang version " __clang_version__
++#endif
++
++// Macro used to identify the Clang compiler.
++#define BOOST_CLANG 1
++
+diff --git a/lib/boost/config/stdlib/libcpp.hpp b/lib/boost/config/stdlib/libcpp.hpp
+new file mode 100644
+index 0000000..ab5d123
+--- /dev/null
++++ b/lib/boost/config/stdlib/libcpp.hpp
+@@ -0,0 +1,80 @@
++//  (C) Copyright Christopher Jefferson 2011.
++//  Use, modification and distribution are subject to the
++//  Boost Software License, Version 1.0. (See accompanying file
++//  LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)
++
++//  See http://www.boost.org for most recent version.
++
++//  config for libc++
++//  Might need more in here later.
++
++#if !defined(_LIBCPP_VERSION)
++#  include <ciso646>
++#  if !defined(_LIBCPP_VERSION)
++#      error "This is not libc++!"
++#  endif
++#endif
++
++#define BOOST_STDLIB "libc++ version " BOOST_STRINGIZE(_LIBCPP_VERSION)
++
++#define BOOST_HAS_THREADS
++
++#ifdef _LIBCPP_HAS_NO_VARIADICS
++#    define BOOST_NO_CXX11_HDR_TUPLE
++#endif
++
++// BOOST_NO_CXX11_ALLOCATOR should imply no support for the C++11
++// allocator model. The C++11 allocator model requires a conforming
++// std::allocator_traits which is only possible with C++11 template
++// aliases since members rebind_alloc and rebind_traits require it.
++#if defined(_LIBCPP_HAS_NO_TEMPLATE_ALIASES)
++#    define BOOST_NO_CXX11_ALLOCATOR
++#endif
++
++#if __cplusplus < 201103
++#  define BOOST_NO_CXX11_HDR_ARRAY
++#  define BOOST_NO_CXX11_HDR_CODECVT
++#  define BOOST_NO_CXX11_HDR_CONDITION_VARIABLE
++#  define BOOST_NO_CXX11_HDR_FORWARD_LIST
++#  define BOOST_NO_CXX11_HDR_INITIALIZER_LIST
++#  define BOOST_NO_CXX11_HDR_MUTEX
++#  define BOOST_NO_CXX11_HDR_RANDOM
++#  define BOOST_NO_CXX11_HDR_RATIO
++#  define BOOST_NO_CXX11_HDR_REGEX
++#  define BOOST_NO_CXX11_HDR_SYSTEM_ERROR
++#  define BOOST_NO_CXX11_HDR_THREAD
++#  define BOOST_NO_CXX11_HDR_TUPLE
++#  define BOOST_NO_CXX11_HDR_TYPEINDEX
++#  define BOOST_NO_CXX11_HDR_UNORDERED_MAP
++#  define BOOST_NO_CXX11_HDR_UNORDERED_SET
++#  define BOOST_NO_CXX11_NUMERIC_LIMITS
++#  define BOOST_NO_CXX11_ALLOCATOR
++#  define BOOST_NO_CXX11_SMART_PTR
++#  define BOOST_NO_CXX11_HDR_FUNCTIONAL
++#  define BOOST_NO_CXX11_STD_ALIGN
++#  define BOOST_NO_CXX11_ADDRESSOF
++#endif
++
++//
++// These appear to be unusable/incomplete so far:
++//
++#  define BOOST_NO_CXX11_HDR_CHRONO
++#  define BOOST_NO_CXX11_HDR_FUTURE
++#  define BOOST_NO_CXX11_HDR_TYPE_TRAITS
++#  define BOOST_NO_CXX11_ATOMIC_SMART_PTR
++#  define BOOST_NO_CXX11_HDR_ATOMIC
++
++// libc++ uses a non-standard messages_base
++#define BOOST_NO_STD_MESSAGES
++
++#if defined(__has_include)
++#if !__has_include(<shared_mutex>)
++#  define BOOST_NO_CXX14_HDR_SHARED_MUTEX
++#elif __cplusplus <= 201103
++#  define BOOST_NO_CXX14_HDR_SHARED_MUTEX
++#endif
++#elif __cplusplus < 201402
++#  define BOOST_NO_CXX14_HDR_SHARED_MUTEX
++#endif
++
++//  --- end ---
+diff --git a/lib/boost/cstdint.hpp b/lib/boost/cstdint.hpp
+new file mode 100644
+index 0000000..6ab986d
+--- /dev/null
++++ b/lib/boost/cstdint.hpp
+@@ -0,0 +1,542 @@
++//  boost cstdint.hpp header file  ------------------------------------------//
++
++//  (C) Copyright Beman Dawes 1999.
++//  (C) Copyright Jens Mauer 2001
++//  (C) Copyright John Maddock 2001
++//  Distributed under the Boost
++//  Software License, Version 1.0. (See accompanying file
++//  LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)
++
++//  See http://www.boost.org/libs/integer for documentation.
++
++//  Revision History
++//   31 Oct 01  use BOOST_HAS_LONG_LONG to check for "long long" (Jens M.)
++//   16 Apr 01  check LONGLONG_MAX when looking for "long long" (Jens Maurer)
++//   23 Jan 01  prefer "long" over "int" for int32_t and intmax_t (Jens Maurer)
++//   12 Nov 00  Merged <boost/stdint.h> (Jens Maurer)
++//   23 Sep 00  Added INTXX_C macro support (John Maddock).
++//   22 Sep 00  Better 64-bit support (John Maddock)
++//   29 Jun 00  Reimplement to avoid including stdint.h within namespace boost
++//    8 Aug 99  Initial version (Beman Dawes)
++
++
++#ifndef BOOST_CSTDINT_HPP
++#define BOOST_CSTDINT_HPP
++
++//
++// Since we always define the INT#_C macros as per C++0x,
++// define __STDC_CONSTANT_MACROS so that <stdint.h> does the right
++// thing if possible, and so that the user knows that the macros
++// are actually defined as per C99.
++//
++#ifndef __STDC_CONSTANT_MACROS
++#  define __STDC_CONSTANT_MACROS
++#endif
++
++#include <boost/config.hpp>
++
++//
++// Note that GLIBC is a bit inconsistent about whether int64_t is defined or not
++// depending upon what headers happen to have been included first...
++// so we disable use of stdint.h when GLIBC does not define __GLIBC_HAVE_LONG_LONG.
++// See https://svn.boost.org/trac/boost/ticket/3548 and http://sources.redhat.com/bugzilla/show_bug.cgi?id=10990
++//
++#if defined(BOOST_HAS_STDINT_H)					\
++  && (!defined(__GLIBC__)					\
++      || defined(__GLIBC_HAVE_LONG_LONG)			\
++      || (defined(__GLIBC__) && ((__GLIBC__ > 2) || ((__GLIBC__ == 2) && (__GLIBC_MINOR__ >= 17)))))
++
++// The following #include is an implementation artifact; not part of interface.
++# ifdef __hpux
++// HP-UX has a vaguely nice <stdint.h> in a non-standard location
++#   include <inttypes.h>
++#   ifdef __STDC_32_MODE__
++      // this is triggered with GCC, because it defines __cplusplus < 199707L
++#     define BOOST_NO_INT64_T
++#   endif
++# elif defined(__FreeBSD__) || defined(__IBMCPP__) || defined(_AIX)
++#   include <inttypes.h>
++# else
++#   include <stdint.h>
++
++// There is a bug in Cygwin two _C macros
++#   if defined(__STDC_CONSTANT_MACROS) && defined(__CYGWIN__)
++#     undef INTMAX_C
++#     undef UINTMAX_C
++#     define INTMAX_C(c) c##LL
++#     define UINTMAX_C(c) c##ULL
++#   endif
++
++# endif
++
++#ifdef __QNX__
++
++// QNX (Dinkumware stdlib) defines these as non-standard names.
++// Reflect to the standard names.
++
++typedef ::intleast8_t int_least8_t;
++typedef ::intfast8_t int_fast8_t;
++typedef ::uintleast8_t uint_least8_t;
++typedef ::uintfast8_t uint_fast8_t;
++
++typedef ::intleast16_t int_least16_t;
++typedef ::intfast16_t int_fast16_t;
++typedef ::uintleast16_t uint_least16_t;
++typedef ::uintfast16_t uint_fast16_t;
++
++typedef ::intleast32_t int_least32_t;
++typedef ::intfast32_t int_fast32_t;
++typedef ::uintleast32_t uint_least32_t;
++typedef ::uintfast32_t uint_fast32_t;
++
++# ifndef BOOST_NO_INT64_T
++
++typedef ::intleast64_t int_least64_t;
++typedef ::intfast64_t int_fast64_t;
++typedef ::uintleast64_t uint_least64_t;
++typedef ::uintfast64_t uint_fast64_t;
++
++# endif
++
++#endif
++
++namespace boost
++{
++
++  using ::int8_t;
++  using ::int_least8_t;
++  using ::int_fast8_t;
++  using ::uint8_t;
++  using ::uint_least8_t;
++  using ::uint_fast8_t;
++
++  using ::int16_t;
++  using ::int_least16_t;
++  using ::int_fast16_t;
++  using ::uint16_t;
++  using ::uint_least16_t;
++  using ::uint_fast16_t;
++
++  using ::int32_t;
++  using ::int_least32_t;
++  using ::int_fast32_t;
++  using ::uint32_t;
++  using ::uint_least32_t;
++  using ::uint_fast32_t;
++
++# ifndef BOOST_NO_INT64_T
++
++  using ::int64_t;
++  using ::int_least64_t;
++  using ::int_fast64_t;
++  using ::uint64_t;
++  using ::uint_least64_t;
++  using ::uint_fast64_t;
++
++# endif
++
++  using ::intmax_t;
++  using ::uintmax_t;
++
++} // namespace boost
++
++#elif defined(__FreeBSD__) && (__FreeBSD__ <= 4) || defined(__osf__) || defined(__VMS) || defined(__SOLARIS9__) || defined(__NetBSD__)
++// FreeBSD and Tru64 have an <inttypes.h> that contains much of what we need.
++# include <inttypes.h>
++
++namespace boost {
++
++  using ::int8_t;
++  typedef int8_t int_least8_t;
++  typedef int8_t int_fast8_t;
++  using ::uint8_t;
++  typedef uint8_t uint_least8_t;
++  typedef uint8_t uint_fast8_t;
++
++  using ::int16_t;
++  typedef int16_t int_least16_t;
++  typedef int16_t int_fast16_t;
++  using ::uint16_t;
++  typedef uint16_t uint_least16_t;
++  typedef uint16_t uint_fast16_t;
++
++  using ::int32_t;
++  typedef int32_t int_least32_t;
++  typedef int32_t int_fast32_t;
++  using ::uint32_t;
++  typedef uint32_t uint_least32_t;
++  typedef uint32_t uint_fast32_t;
++
++# ifndef BOOST_NO_INT64_T
++
++  using ::int64_t;
++  typedef int64_t int_least64_t;
++  typedef int64_t int_fast64_t;
++  using ::uint64_t;
++  typedef uint64_t uint_least64_t;
++  typedef uint64_t uint_fast64_t;
++
++  typedef int64_t intmax_t;
++  typedef uint64_t uintmax_t;
++
++# else
++
++  typedef int32_t intmax_t;
++  typedef uint32_t uintmax_t;
++
++# endif
++
++} // namespace boost
++
++#else  // BOOST_HAS_STDINT_H
++
++# include <boost/limits.hpp> // implementation artifact; not part of interface
++# include <limits.h>         // needed for limits macros
++
++
++namespace boost
++{
++
++//  These are fairly safe guesses for some 16-bit, and most 32-bit and 64-bit
++//  platforms.  For other systems, they will have to be hand tailored.
++//
++//  Because the fast types are assumed to be the same as the undecorated types,
++//  it may be possible to hand tailor a more efficient implementation.  Such
++//  an optimization may be illusionary; on the Intel x86-family 386 on, for
++//  example, byte arithmetic and load/stores are as fast as "int" sized ones.
++
++//  8-bit types  ------------------------------------------------------------//
++
++# if UCHAR_MAX == 0xff
++     typedef signed char     int8_t;
++     typedef signed char     int_least8_t;
++     typedef signed char     int_fast8_t;
++     typedef unsigned char   uint8_t;
++     typedef unsigned char   uint_least8_t;
++     typedef unsigned char   uint_fast8_t;
++# else
++#    error defaults not correct; you must hand modify boost/cstdint.hpp
++# endif
++
++//  16-bit types  -----------------------------------------------------------//
++
++# if USHRT_MAX == 0xffff
++#  if defined(__crayx1)
++     // The Cray X1 has a 16-bit short, however it is not recommend
++     // for use in performance critical code.
++     typedef short           int16_t;
++     typedef short           int_least16_t;
++     typedef int             int_fast16_t;
++     typedef unsigned short  uint16_t;
++     typedef unsigned short  uint_least16_t;
++     typedef unsigned int    uint_fast16_t;
++#  else
++     typedef short           int16_t;
++     typedef short           int_least16_t;
++     typedef short           int_fast16_t;
++     typedef unsigned short  uint16_t;
++     typedef unsigned short  uint_least16_t;
++     typedef unsigned short  uint_fast16_t;
++#  endif
++# elif (USHRT_MAX == 0xffffffff) && defined(__MTA__)
++      // On MTA / XMT short is 32 bits unless the -short16 compiler flag is specified
++      // MTA / XMT does support the following non-standard integer types
++      typedef __short16           int16_t;
++      typedef __short16           int_least16_t;
++      typedef __short16           int_fast16_t;
++      typedef unsigned __short16  uint16_t;
++      typedef unsigned __short16  uint_least16_t;
++      typedef unsigned __short16  uint_fast16_t;
++# elif (USHRT_MAX == 0xffffffff) && defined(CRAY)
++     // no 16-bit types on Cray:
++     typedef short           int_least16_t;
++     typedef short           int_fast16_t;
++     typedef unsigned short  uint_least16_t;
++     typedef unsigned short  uint_fast16_t;
++# else
++#    error defaults not correct; you must hand modify boost/cstdint.hpp
++# endif
++
++//  32-bit types  -----------------------------------------------------------//
++
++# if UINT_MAX == 0xffffffff
++     typedef int             int32_t;
++     typedef int             int_least32_t;
++     typedef int             int_fast32_t;
++     typedef unsigned int    uint32_t;
++     typedef unsigned int    uint_least32_t;
++     typedef unsigned int    uint_fast32_t;
++# elif (USHRT_MAX == 0xffffffff)
++     typedef short             int32_t;
++     typedef short             int_least32_t;
++     typedef short             int_fast32_t;
++     typedef unsigned short    uint32_t;
++     typedef unsigned short    uint_least32_t;
++     typedef unsigned short    uint_fast32_t;
++# elif ULONG_MAX == 0xffffffff
++     typedef long            int32_t;
++     typedef long            int_least32_t;
++     typedef long            int_fast32_t;
++     typedef unsigned long   uint32_t;
++     typedef unsigned long   uint_least32_t;
++     typedef unsigned long   uint_fast32_t;
++# elif (UINT_MAX == 0xffffffffffffffff) && defined(__MTA__)
++      // Integers are 64 bits on the MTA / XMT
++      typedef __int32           int32_t;
++      typedef __int32           int_least32_t;
++      typedef __int32           int_fast32_t;
++      typedef unsigned __int32  uint32_t;
++      typedef unsigned __int32  uint_least32_t;
++      typedef unsigned __int32  uint_fast32_t;
++# else
++#    error defaults not correct; you must hand modify boost/cstdint.hpp
++# endif
++
++//  64-bit types + intmax_t and uintmax_t  ----------------------------------//
++
++# if defined(BOOST_HAS_LONG_LONG) && \
++   !defined(BOOST_MSVC) && !defined(__BORLANDC__) && \
++   (!defined(__GLIBCPP__) || defined(_GLIBCPP_USE_LONG_LONG)) && \
++   (defined(ULLONG_MAX) || defined(ULONG_LONG_MAX) || defined(ULONGLONG_MAX))
++#    if defined(__hpux)
++     // HP-UX's value of ULONG_LONG_MAX is unusable in preprocessor expressions
++#    elif (defined(ULLONG_MAX) && ULLONG_MAX == 18446744073709551615ULL) || (defined(ULONG_LONG_MAX) && ULONG_LONG_MAX == 18446744073709551615ULL) || (defined(ULONGLONG_MAX) && ULONGLONG_MAX == 18446744073709551615ULL)
++                                                                 // 2**64 - 1
++#    else
++#       error defaults not correct; you must hand modify boost/cstdint.hpp
++#    endif
++
++     typedef  ::boost::long_long_type            intmax_t;
++     typedef  ::boost::ulong_long_type   uintmax_t;
++     typedef  ::boost::long_long_type            int64_t;
++     typedef  ::boost::long_long_type            int_least64_t;
++     typedef  ::boost::long_long_type            int_fast64_t;
++     typedef  ::boost::ulong_long_type   uint64_t;
++     typedef  ::boost::ulong_long_type   uint_least64_t;
++     typedef  ::boost::ulong_long_type   uint_fast64_t;
++
++# elif ULONG_MAX != 0xffffffff
++
++#    if ULONG_MAX == 18446744073709551615 // 2**64 - 1
++     typedef long                 intmax_t;
++     typedef unsigned long        uintmax_t;
++     typedef long                 int64_t;
++     typedef long                 int_least64_t;
++     typedef long                 int_fast64_t;
++     typedef unsigned long        uint64_t;
++     typedef unsigned long        uint_least64_t;
++     typedef unsigned long        uint_fast64_t;
++#    else
++#       error defaults not correct; you must hand modify boost/cstdint.hpp
++#    endif
++# elif defined(__GNUC__) && defined(BOOST_HAS_LONG_LONG)
++     __extension__ typedef long long            intmax_t;
++     __extension__ typedef unsigned long long   uintmax_t;
++     __extension__ typedef long long            int64_t;
++     __extension__ typedef long long            int_least64_t;
++     __extension__ typedef long long            int_fast64_t;
++     __extension__ typedef unsigned long long   uint64_t;
++     __extension__ typedef unsigned long long   uint_least64_t;
++     __extension__ typedef unsigned long long   uint_fast64_t;
++# elif defined(BOOST_HAS_MS_INT64)
++     //
++     // we have Borland/Intel/Microsoft __int64:
++     //
++     typedef __int64             intmax_t;
++     typedef unsigned __int64    uintmax_t;
++     typedef __int64             int64_t;
++     typedef __int64             int_least64_t;
++     typedef __int64             int_fast64_t;
++     typedef unsigned __int64    uint64_t;
++     typedef unsigned __int64    uint_least64_t;
++     typedef unsigned __int64    uint_fast64_t;
++# else // assume no 64-bit integers
++#  define BOOST_NO_INT64_T
++     typedef int32_t              intmax_t;
++     typedef uint32_t             uintmax_t;
++# endif
++
++} // namespace boost
++
++
++#endif // BOOST_HAS_STDINT_H
++
++// intptr_t/uintptr_t are defined separately because they are optional and not universally available
++#if defined(BOOST_WINDOWS) && !defined(_WIN32_WCE) && !defined(BOOST_HAS_STDINT_H)
++// Older MSVC don't have stdint.h and have intptr_t/uintptr_t defined in stddef.h
++#include <stddef.h>
++#endif
++
++// PGI seems to not support intptr_t/uintptr_t properly. BOOST_HAS_STDINT_H is not defined for this compiler by Boost.Config.
++#if !defined(__PGIC__)
++
++#if (defined(BOOST_WINDOWS) && !defined(_WIN32_WCE)) \
++    || (defined(_XOPEN_UNIX) && (_XOPEN_UNIX+0 > 0) && !defined(__UCLIBC__)) \
++    || defined(__CYGWIN__) \
++    || defined(macintosh) || defined(__APPLE__) || defined(__APPLE_CC__) \
++    || defined(__FreeBSD__) || defined(__NetBSD__) || defined(__OpenBSD__) || defined(__DragonFly__) || defined(sun)
++
++namespace boost {
++    using ::intptr_t;
++    using ::uintptr_t;
++}
++#define BOOST_HAS_INTPTR_T
++
++// Clang pretends to be GCC, so it'll match this condition
++#elif defined(__GNUC__) && defined(__INTPTR_TYPE__) && defined(__UINTPTR_TYPE__)
++
++namespace boost {
++    typedef __INTPTR_TYPE__ intptr_t;
++    typedef __UINTPTR_TYPE__ uintptr_t;
++}
++#define BOOST_HAS_INTPTR_T
++
++#endif
++
++#endif // !defined(__PGIC__)
++
++#endif // BOOST_CSTDINT_HPP
++
++
++/****************************************************
++
++Macro definition section:
++
++Added 23rd September 2000 (John Maddock).
++Modified 11th September 2001 to be excluded when
++BOOST_HAS_STDINT_H is defined (John Maddock).
++Modified 11th Dec 2009 to always define the
++INT#_C macros if they're not already defined (John Maddock).
++
++******************************************************/
++
++#if !defined(BOOST__STDC_CONSTANT_MACROS_DEFINED) && \
++   (!defined(INT8_C) || !defined(INT16_C) || !defined(INT32_C) || !defined(INT64_C))
++//
++// For the following code we get several warnings along the lines of:
++//
++// boost/cstdint.hpp:428:35: error: use of C99 long long integer constant
++//
++// So we declare this a system header to suppress these warnings.
++//
++#if defined(__GNUC__) && (__GNUC__ >= 4)
++#pragma GCC system_header
++#endif
++
++#include <limits.h>
++# define BOOST__STDC_CONSTANT_MACROS_DEFINED
++# if defined(BOOST_HAS_MS_INT64)
++//
++// Borland/Intel/Microsoft compilers have width specific suffixes:
++//
++#ifndef INT8_C
++#  define INT8_C(value)     value##i8
++#endif
++#ifndef INT16_C
++#  define INT16_C(value)    value##i16
++#endif
++#ifndef INT32_C
++#  define INT32_C(value)    value##i32
++#endif
++#ifndef INT64_C
++#  define INT64_C(value)    value##i64
++#endif
++#  ifdef __BORLANDC__
++    // Borland bug: appending ui8 makes the type a signed char
++#   define UINT8_C(value)    static_cast<unsigned char>(value##u)
++#  else
++#   define UINT8_C(value)    value##ui8
++#  endif
++#ifndef UINT16_C
++#  define UINT16_C(value)   value##ui16
++#endif
++#ifndef UINT32_C
++#  define UINT32_C(value)   value##ui32
++#endif
++#ifndef UINT64_C
++#  define UINT64_C(value)   value##ui64
++#endif
++#ifndef INTMAX_C
++#  define INTMAX_C(value)   value##i64
++#  define UINTMAX_C(value)  value##ui64
++#endif
++
++# else
++//  do it the old fashioned way:
++
++//  8-bit types  ------------------------------------------------------------//
++
++#  if (UCHAR_MAX == 0xff) && !defined(INT8_C)
++#   define INT8_C(value) static_cast<boost::int8_t>(value)
++#   define UINT8_C(value) static_cast<boost::uint8_t>(value##u)
++#  endif
++
++//  16-bit types  -----------------------------------------------------------//
++
++#  if (USHRT_MAX == 0xffff) && !defined(INT16_C)
++#   define INT16_C(value) static_cast<boost::int16_t>(value)
++#   define UINT16_C(value) static_cast<boost::uint16_t>(value##u)
++#  endif
++
++//  32-bit types  -----------------------------------------------------------//
++#ifndef INT32_C
++#  if (UINT_MAX == 0xffffffff)
++#   define INT32_C(value) value
++#   define UINT32_C(value) value##u
++#  elif ULONG_MAX == 0xffffffff
++#   define INT32_C(value) value##L
++#   define UINT32_C(value) value##uL
++#  endif
++#endif
++
++//  64-bit types + intmax_t and uintmax_t  ----------------------------------//
++#ifndef INT64_C
++#  if defined(BOOST_HAS_LONG_LONG) && \
++    (defined(ULLONG_MAX) || defined(ULONG_LONG_MAX) || defined(ULONGLONG_MAX) || defined(_ULLONG_MAX) || defined(_LLONG_MAX))
++
++#    if defined(__hpux)
++        // HP-UX's value of ULONG_LONG_MAX is unusable in preprocessor expressions
++#       define INT64_C(value) value##LL
++#       define UINT64_C(value) value##uLL
++#    elif (defined(ULLONG_MAX) && ULLONG_MAX == 18446744073709551615ULL) ||  \
++        (defined(ULONG_LONG_MAX) && ULONG_LONG_MAX == 18446744073709551615ULL) ||  \
++        (defined(ULONGLONG_MAX) && ULONGLONG_MAX == 18446744073709551615ULL) || \
++        (defined(_ULLONG_MAX) && _ULLONG_MAX == 18446744073709551615ULL) || \
++        (defined(_LLONG_MAX) && _LLONG_MAX == 9223372036854775807LL)
++
++#       define INT64_C(value) value##LL
++#       define UINT64_C(value) value##uLL
++#    else
++#       error defaults not correct; you must hand modify boost/cstdint.hpp
++#    endif
++#  elif ULONG_MAX != 0xffffffff
++
++#    if ULONG_MAX == 18446744073709551615U // 2**64 - 1
++#       define INT64_C(value) value##L
++#       define UINT64_C(value) value##uL
++#    else
++#       error defaults not correct; you must hand modify boost/cstdint.hpp
++#    endif
++#  elif defined(BOOST_HAS_LONG_LONG)
++     // Usual macros not defined, work things out for ourselves:
++#    if(~0uLL == 18446744073709551615ULL)
++#       define INT64_C(value) value##LL
++#       define UINT64_C(value) value##uLL
++#    else
++#       error defaults not correct; you must hand modify boost/cstdint.hpp
++#    endif
++#  else
++#    error defaults not correct; you must hand modify boost/cstdint.hpp
++#  endif
++
++#  ifdef BOOST_NO_INT64_T
++#   define INTMAX_C(value) INT32_C(value)
++#   define UINTMAX_C(value) UINT32_C(value)
++#  else
++#   define INTMAX_C(value) INT64_C(value)
++#   define UINTMAX_C(value) UINT64_C(value)
++#  endif
++#endif
++# endif // Borland/Microsoft specific width suffixes
++
++#endif // INT#_C macros.
+diff --git a/lib/boost/smart_ptr/detail/sp_counted_base_clang.hpp b/lib/boost/smart_ptr/detail/sp_counted_base_clang.hpp
+new file mode 100644
+index 0000000..c66b985
+--- /dev/null
++++ b/lib/boost/smart_ptr/detail/sp_counted_base_clang.hpp
+@@ -0,0 +1,140 @@
++#ifndef BOOST_SMART_PTR_DETAIL_SP_COUNTED_BASE_CLANG_HPP_INCLUDED
++#define BOOST_SMART_PTR_DETAIL_SP_COUNTED_BASE_CLANG_HPP_INCLUDED
++
++// MS compatible compilers support #pragma once
++
++#if defined(_MSC_VER) && (_MSC_VER >= 1020)
++# pragma once
++#endif
++
++//  detail/sp_counted_base_clang.hpp - __c11 clang intrinsics
++//
++//  Copyright (c) 2007, 2013, 2015 Peter Dimov
++//
++//  Distributed under the Boost Software License, Version 1.0.
++//  See accompanying file LICENSE_1_0.txt or copy at
++//  http://www.boost.org/LICENSE_1_0.txt
++
++#include <boost/detail/sp_typeinfo.hpp>
++#include <boost/cstdint.hpp>
++
++namespace boost
++{
++
++namespace detail
++{
++
++typedef _Atomic( boost::int_least32_t ) atomic_int_least32_t;
++
++inline void atomic_increment( atomic_int_least32_t * pw )
++{
++    __c11_atomic_fetch_add( pw, 1, __ATOMIC_RELAXED );
++}
++
++inline boost::int_least32_t atomic_decrement( atomic_int_least32_t * pw )
++{
++    return __c11_atomic_fetch_sub( pw, 1, __ATOMIC_ACQ_REL );
++}
++
++inline boost::int_least32_t atomic_conditional_increment( atomic_int_least32_t * pw )
++{
++    // long r = *pw;
++    // if( r != 0 ) ++*pw;
++    // return r;
++
++    boost::int_least32_t r = __c11_atomic_load( pw, __ATOMIC_RELAXED );
++
++    for( ;; )
++    {
++        if( r == 0 )
++        {
++            return r;
++        }
++
++        if( __c11_atomic_compare_exchange_weak( pw, &r, r + 1, __ATOMIC_RELAXED, __ATOMIC_RELAXED ) )
++        {
++            return r;
++        }
++    }    
++}
++
++class sp_counted_base
++{
++private:
++
++    sp_counted_base( sp_counted_base const & );
++    sp_counted_base & operator= ( sp_counted_base const & );
++
++    atomic_int_least32_t use_count_;	// #shared
++    atomic_int_least32_t weak_count_;	// #weak + (#shared != 0)
++
++public:
++
++    sp_counted_base()
++    {
++        __c11_atomic_init( &use_count_, 1 );
++        __c11_atomic_init( &weak_count_, 1 );
++    }
++
++    virtual ~sp_counted_base() // nothrow
++    {
++    }
++
++    // dispose() is called when use_count_ drops to zero, to release
++    // the resources managed by *this.
++
++    virtual void dispose() = 0; // nothrow
++
++    // destroy() is called when weak_count_ drops to zero.
++
++    virtual void destroy() // nothrow
++    {
++        delete this;
++    }
++
++    virtual void * get_deleter( sp_typeinfo const & ti ) = 0;
++    virtual void * get_untyped_deleter() = 0;
++
++    void add_ref_copy()
++    {
++        atomic_increment( &use_count_ );
++    }
++
++    bool add_ref_lock() // true on success
++    {
++        return atomic_conditional_increment( &use_count_ ) != 0;
++    }
++
++    void release() // nothrow
++    {
++        if( atomic_decrement( &use_count_ ) == 1 )
++        {
++            dispose();
++            weak_release();
++        }
++    }
++
++    void weak_add_ref() // nothrow
++    {
++        atomic_increment( &weak_count_ );
++    }
++
++    void weak_release() // nothrow
++    {
++        if( atomic_decrement( &weak_count_ ) == 1 )
++        {
++            destroy();
++        }
++    }
++
++    long use_count() const // nothrow
++    {
++        return __c11_atomic_load( const_cast< atomic_int_least32_t* >( &use_count_ ), __ATOMIC_ACQUIRE );
++    }
++};
++
++} // namespace detail
++
++} // namespace boost
++
++#endif  // #ifndef BOOST_SMART_PTR_DETAIL_SP_COUNTED_BASE_CLANG_HPP_INCLUDED
+-- 
+2.23.0
+
diff --git a/meta-oe/recipes-support/ssiapi/ssiapi/0003-Replace-canonicalize_file_name-with-realpath-API.patch b/meta-oe/recipes-support/ssiapi/ssiapi/0003-Replace-canonicalize_file_name-with-realpath-API.patch
deleted file mode 100644
index 98cd40c84c..0000000000
--- a/meta-oe/recipes-support/ssiapi/ssiapi/0003-Replace-canonicalize_file_name-with-realpath-API.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 781288d6307002cce70ddafb6efb200b7f60294d Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 16 Jun 2017 22:12:43 -0700
-Subject: [PATCH 3/6] Replace canonicalize_file_name with realpath() API
-
-Fixed build on musl where canonicalize_file_name is not implemented
-
-filesystem.cpp:46:15: error: 'canonicalize_file_name' was not declared in this scope
-     char *p = canonicalize_file_name(path);
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- lib/engine/filesystem.cpp | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/lib/engine/filesystem.cpp b/lib/engine/filesystem.cpp
-index b99257e..6064837 100644
---- a/lib/engine/filesystem.cpp
-+++ b/lib/engine/filesystem.cpp
-@@ -43,7 +43,7 @@ void CanonicalPath::__canonicalize_path_name(const char *path)
-     if (path == 0) {
-         throw E_NULL_POINTER;
-     }
--    char *p = canonicalize_file_name(path);
-+    char *p = realpath(path, NULL);
-     assign(p);
-     if (p) {
-         free(p);
--- 
-2.13.1
-
diff --git a/meta-oe/recipes-support/ssiapi/ssiapi/0003-engine-Define-discover-const-String-path-in-base-cla.patch b/meta-oe/recipes-support/ssiapi/ssiapi/0003-engine-Define-discover-const-String-path-in-base-cla.patch
new file mode 100644
index 0000000000..261358459e
--- /dev/null
+++ b/meta-oe/recipes-support/ssiapi/ssiapi/0003-engine-Define-discover-const-String-path-in-base-cla.patch
@@ -0,0 +1,47 @@
+From 24e0f55c07080a59907c190a315e279f7b2355e5 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 29 Aug 2019 14:25:02 -0700
+Subject: [PATCH 3/4] engine: Define discover(const String &path) in base class
+
+this fixes the confusion that compiler may have when inheriting two
+different classes where each of them defines discover() virtual function
+but with different signatures
+
+Remove ununsed orom_vmd
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lib/engine/storage_object.h | 3 +++
+ lib/engine/vmd_raid_info.h  | 2 --
+ 2 files changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/lib/engine/storage_object.h b/lib/engine/storage_object.h
+index f1feb62..9c1d3d8 100644
+--- a/lib/engine/storage_object.h
++++ b/lib/engine/storage_object.h
+@@ -123,6 +123,9 @@ public:
+     virtual void discover() {
+         throw E_INVALID_OPERATION;
+     }
++    virtual void discover(const String &path) {
++        throw E_INVALID_OPERATION;
++    }
+     virtual void addToSession(const boost::shared_ptr<Session>& pSession) = 0;
+ };
+ 
+diff --git a/lib/engine/vmd_raid_info.h b/lib/engine/vmd_raid_info.h
+index 2bea839..cc6ffbe 100644
+--- a/lib/engine/vmd_raid_info.h
++++ b/lib/engine/vmd_raid_info.h
+@@ -53,8 +53,6 @@ public:
+         return SSI_ControllerTypeVMD;
+     }
+ 
+-private:
+-    struct orom_info orom_vmd;
+ };
+ 
+ #endif /* __VMD_RAID_INFO_H__INCLUDED__ */
+-- 
+2.23.0
+
diff --git a/meta-oe/recipes-support/ssiapi/ssiapi/0003-replace-canonicalize_file_name-with-realpath.patch b/meta-oe/recipes-support/ssiapi/ssiapi/0003-replace-canonicalize_file_name-with-realpath.patch
new file mode 100644
index 0000000000..848d38b223
--- /dev/null
+++ b/meta-oe/recipes-support/ssiapi/ssiapi/0003-replace-canonicalize_file_name-with-realpath.patch
@@ -0,0 +1,43 @@
+From c817db76bb63b872fe2069e3c2449ac18affe8c1 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 30 Aug 2019 13:17:38 -0700
+Subject: [PATCH] replace canonicalize_file_name with realpath
+
+Use 'realpath()' (BSD, POSIX) instead of
+'canonicalize_file_name()' (GNU extension).
+
+Fixes
+error: use of undeclared identifier 'canonicalize_file_name'
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lib/engine/filesystem.cpp | 2 +-
+ tools/ssieventmonitor.cpp | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/lib/engine/filesystem.cpp b/lib/engine/filesystem.cpp
+index bf5a776..194ab8a 100644
+--- a/lib/engine/filesystem.cpp
++++ b/lib/engine/filesystem.cpp
+@@ -54,7 +54,7 @@ void CanonicalPath::__canonicalize_path_name(const char *path)
+     if (path == NULL) {
+         throw E_NULL_POINTER;
+     }
+-    char *p = canonicalize_file_name(path);
++    char *p = realpath(path, (char *)0);
+     assign(p);
+     if (p) {
+         free(p);
+diff --git a/tools/ssieventmonitor.cpp b/tools/ssieventmonitor.cpp
+index 80791fd..3eed877 100644
+--- a/tools/ssieventmonitor.cpp
++++ b/tools/ssieventmonitor.cpp
+@@ -120,7 +120,7 @@ static int _exec_ssimsg(void)
+     int status;
+     switch (pid) {
+         case 0: {
+-            cp = canonicalize_file_name("/proc/self/exe");
++            cp = realpath("/proc/self/exe", (char *)0);
+             if (cp) {
+                 strcpy_s(buffer, sizeof(buffer), cp);
+                 free(cp);
diff --git a/meta-oe/recipes-support/ssiapi/ssiapi/0004-Do-not-override-flags-coming-from-build-environment.patch b/meta-oe/recipes-support/ssiapi/ssiapi/0004-Do-not-override-flags-coming-from-build-environment.patch
new file mode 100644
index 0000000000..ca2ffc56b1
--- /dev/null
+++ b/meta-oe/recipes-support/ssiapi/ssiapi/0004-Do-not-override-flags-coming-from-build-environment.patch
@@ -0,0 +1,33 @@
+From 98fad8128d0f3b65619827ee5d65f7767b080c4c Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 29 Aug 2019 14:35:16 -0700
+Subject: [PATCH 4/4] Do not override flags coming from build environment
+
+e.g. we need some optimization level turned on when security flags are enabled
+without this change, the build would fail
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 34e41ea..9bd0fe3 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -16,9 +16,9 @@ AM_INIT_AUTOMAKE(ssi, ${VERSION})
+ AM_CONFIG_HEADER(config.h)
+ 
+ dnl Set the language we use
+-CPPFLAGS="-g3 -gdwarf-2 -Wall -Werror -fvisibility=hidden -D_GNU_SOURCE -O3 -fstack-protector -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -fPIC"
+-CFLAGS="-std=gnu99 -fstack-protector -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -fPIC"
+-CXXFLAGS="-std=gnu++98 -fvisibility-inlines-hidden -O3 -fstack-protector -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -fPIC"
++#CPPFLAGS="-g3 -gdwarf-2 -Wall -Werror -fvisibility=hidden -D_GNU_SOURCE -O3 -fstack-protector -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -fPIC"
++#CFLAGS="-std=gnu99 -fstack-protector -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -fPIC"
++#CXXFLAGS="-std=gnu++98 -fvisibility-inlines-hidden -O3 -fstack-protector -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -fPIC"
+ 
+ dnl Automake 1.11 - silent build rules
+ m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])
+-- 
+2.23.0
+
diff --git a/meta-oe/recipes-support/ssiapi/ssiapi/0004-engine-Fix-indentation-and-missing-semi-colon.patch b/meta-oe/recipes-support/ssiapi/ssiapi/0004-engine-Fix-indentation-and-missing-semi-colon.patch
deleted file mode 100644
index 7dce0da40b..0000000000
--- a/meta-oe/recipes-support/ssiapi/ssiapi/0004-engine-Fix-indentation-and-missing-semi-colon.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From 04e8b99d8195a0e39982ecd27802421610633724 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 16 Jun 2017 22:18:31 -0700
-Subject: [PATCH 4/6] engine: Fix indentation and missing semi-colon
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- lib/engine/mdadm_config.cpp      | 5 +++--
- lib/engine/unique_id_manager.cpp | 2 +-
- 2 files changed, 4 insertions(+), 3 deletions(-)
-
-diff --git a/lib/engine/mdadm_config.cpp b/lib/engine/mdadm_config.cpp
-index 1914ddc..e40c2c7 100644
---- a/lib/engine/mdadm_config.cpp
-+++ b/lib/engine/mdadm_config.cpp
-@@ -118,9 +118,10 @@ void check_configuration()
-         attr >> config;
-         configOk = correct_config(config);
-     } catch (Exception ex) {
--        if (ex != E_NOT_FOUND)
-+        if (ex != E_NOT_FOUND) {
-             dlog("Warning: mdadm config file cannot be read, new one will be written");
-             backup = false;
-+        }
-     }
- 
-     if (configOk && monitor_running()) {
-@@ -134,7 +135,7 @@ void check_configuration()
-             dlog("Warning: failed to update mdadm.conf");
-     }
-     if (restart_monitor() == 0)
--        dlog("Monitor restarted successfully")
-+        dlog("Monitor restarted successfully");
-     else
-         dlog("Error starting Monitor");
- }
-diff --git a/lib/engine/unique_id_manager.cpp b/lib/engine/unique_id_manager.cpp
-index 99c153c..87d6ddc 100644
---- a/lib/engine/unique_id_manager.cpp
-+++ b/lib/engine/unique_id_manager.cpp
-@@ -185,7 +185,7 @@ void UniqueIdManager::refresh()
-         keyFile >> keyList;
-         keyList += "\n";
-     } catch (...) {
--        dlog("ssi.keys file missing")
-+        dlog("ssi.keys file missing");
-         /* no file? that's ok */
-     }
-     /* process the list to update IdCaches */
--- 
-2.13.1
-
diff --git a/meta-oe/recipes-support/ssiapi/ssiapi/0004-include-limits.h.patch b/meta-oe/recipes-support/ssiapi/ssiapi/0004-include-limits.h.patch
new file mode 100644
index 0000000000..d63eb50619
--- /dev/null
+++ b/meta-oe/recipes-support/ssiapi/ssiapi/0004-include-limits.h.patch
@@ -0,0 +1,25 @@
+From e90101128dfe75b9b1a0575a0179d211f677e6ad Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 30 Aug 2019 13:19:50 -0700
+Subject: [PATCH] include limits.h
+
+Fixes
+error: use of undeclared identifier 'PATH_MAX'
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ tools/ssieventmonitor.cpp | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/tools/ssieventmonitor.cpp b/tools/ssieventmonitor.cpp
+index 3eed877..0d11975 100644
+--- a/tools/ssieventmonitor.cpp
++++ b/tools/ssieventmonitor.cpp
+@@ -34,6 +34,7 @@
+ #include <unistd.h>
+ #include <dirent.h>
+ #include <errno.h>
++#include <limits.h>
+ #include <sys/fcntl.h>
+ #include <sys/select.h>
+ #include <sys/wait.h>
diff --git a/meta-oe/recipes-support/ssiapi/ssiapi/0005-enable-out-of-source-tree-builds.patch b/meta-oe/recipes-support/ssiapi/ssiapi/0005-enable-out-of-source-tree-builds.patch
new file mode 100644
index 0000000000..c516f65252
--- /dev/null
+++ b/meta-oe/recipes-support/ssiapi/ssiapi/0005-enable-out-of-source-tree-builds.patch
@@ -0,0 +1,228 @@
+From 3ec4eaf1688e413e8b5cb433148a3bc6e7987606 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 29 Aug 2019 15:10:03 -0700
+Subject: [PATCH] enable out of source tree builds
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lib/efi/Makefile.am      |  2 +-
+ lib/engine/Makefile.am   |  2 +-
+ lib/orom/Makefile.am     |  2 +-
+ lib/safeclib/Makefile.am |  2 +-
+ src/Makefile.am          | 16 ++++++++--------
+ tools/Makefile.am        | 10 +++++-----
+ ut/Makefile.am           | 36 ++++++++++++++++++------------------
+ 7 files changed, 35 insertions(+), 35 deletions(-)
+
+--- a/lib/efi/Makefile.am
++++ b/lib/efi/Makefile.am
+@@ -7,6 +7,6 @@ libefi_la_SOURCES =             \
+     efi.h
+ 
+ libefi_la_CPPFLAGS =            \
+-        -I$(top_srcdir)         \
++        -I$(top_builddir)       \
+         -I$(top_srcdir)/include \
+         -I$(top_srcdir)/lib
+--- a/lib/engine/Makefile.am
++++ b/lib/engine/Makefile.am
+@@ -123,6 +123,7 @@ libengine_la_SOURCES =          \
+         volume.h
+ 
+ libengine_la_CPPFLAGS =         \
++        -I$(top_builddir)       \
+         -I$(top_srcdir)         \
+         -I$(top_srcdir)/include \
+         -I$(top_srcdir)/lib
+--- a/lib/orom/Makefile.am
++++ b/lib/orom/Makefile.am
+@@ -7,6 +7,6 @@ liborom_la_SOURCES =            \
+     orom.h
+ 
+ liborom_la_CPPFLAGS =           \
+-        -I$(top_srcdir)         \
++        -I$(top_builddir)       \
+         -I$(top_srcdir)/include \
+         -I$(top_srcdir)/lib
+--- a/lib/safeclib/Makefile.am
++++ b/lib/safeclib/Makefile.am
+@@ -37,7 +37,7 @@ libsafec_la_SOURCES =		\
+ 	strtok_s.c
+ 
+ libsafec_la_CPPFLAGS =		\
+-        -I$(top_srcdir)			\
++        -I$(top_builddir)		\
+         -I$(top_srcdir)/include		\
+         -I$(top_srcdir)/lib		\
+ 	-Wno-unused-variable
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -5,7 +5,7 @@ AUTOMAKE_OPTIONS = nostdinc
+ lib_LTLIBRARIES = libssi.la
+ 
+ libssi_la_CPPFLAGS =                    \
+-        -I$(top_srcdir)                 \
++        -I$(top_builddir)               \
+         -I$(top_srcdir)/include         \
+         -I$(top_srcdir)/lib             \
+         -DBOOST_NO_USER_CONFIG
+@@ -46,10 +46,10 @@ libssi_la_SOURCES =
+         templates.h                     \
+         volume.cpp
+ 
+-libssi_la_LIBADD =                      \
+-        ../lib/efi/libefi.la            \
+-        ../lib/log/liblog.la            \
+-        ../lib/orom/liborom.la          \
+-        ../lib/mpb/libmpb.la            \
+-        ../lib/engine/libengine.la      \
+-        ../lib/safeclib/libsafec.la
++libssi_la_LIBADD =                                   \
++        $(top_builddir)/lib/efi/libefi.la            \
++        $(top_builddir)/lib/log/liblog.la            \
++        $(top_builddir)/lib/orom/liborom.la          \
++        $(top_builddir)/lib/mpb/libmpb.la            \
++        $(top_builddir)/lib/engine/libengine.la      \
++        $(top_builddir)/lib/safeclib/libsafec.la
+--- a/tools/Makefile.am
++++ b/tools/Makefile.am
+@@ -6,17 +6,18 @@ ssimsg_SOURCES =
+         ssimsg.cpp
+ 
+ ssimsg_CPPFLAGS =                       \
+-        -I$(top_srcdir)                 \
++        -I$(top_builddir)               \
+         -I$(top_srcdir)/include         \
+         -I$(top_srcdir)/lib
+ 
+-ssieventmonitor_SOURCES =                 \
++ssieventmonitor_SOURCES =               \
+         ssieventmonitor.cpp
+ 
+-ssieventmonitor_CPPFLAGS =                \
++ssieventmonitor_CPPFLAGS =              \
++        -I$(top_builddir)               \
+         -I$(top_srcdir)                 \
+         -I$(top_srcdir)/include         \
+         -I$(top_srcdir)/lib
+ 
+ ssieventmonitor_LDADD =			\
+-	$(top_srcdir)/lib/safeclib/libsafec.la
++	$(top_builddir)/lib/safeclib/libsafec.la
+--- a/ut/Makefile.am
++++ b/ut/Makefile.am
+@@ -8,81 +8,81 @@ ut_events_SOURCES = \
+ 	ut_events.cpp
+ 
+ ut_events_CPPFLAGS = \
+-	-I$(top_srcdir) \
++	-I$(top_builddir) \
+ 	-I$(top_srcdir)/include
+ 
+ ut_events_LDADD = \
+-	../src/libssi.la
++	$(top_builddir)/src/libssi.la
+ 
+ ut_volume_SOURCES = \
+ 	ut_volume.cpp
+ 
+ ut_volume_CPPFLAGS = \
+-	-I$(top_srcdir) \
++	-I$(top_builddir) \
+ 	-I$(top_srcdir)/include
+ 
+ ut_volume_LDADD = \
+-	../src/libssi.la
++	$(top_builddir)/src/libssi.la
+ 
+ ut_session_SOURCES = \
+ 	ut_session.cpp
+ 
+ ut_session_CPPFLAGS = \
+-	-g3 -I$(top_srcdir) \
++	-g3 -I$(top_builddir) \
+ 	-I$(top_srcdir)/include
+ 
+ ut_session_LDADD = \
+-	../src/libssi.la
++	$(top_builddir)/src/libssi.la
+ 
+ ut_info_SOURCES = \
+ 	ut_info.cpp
+ 
+ ut_info_CPPFLAGS = \
+-	-g3 -I$(top_srcdir) \
++	-g3 -I$(top_builddir) \
+ 	-I$(top_srcdir)/include
+ 
+ ut_info_LDADD = \
+-	../src/libssi.la
++	$(top_builddir)/src/libssi.la
+ 
+ ut_markasspare_SOURCES = \
+ 	ut_markasspare.cpp
+ 
+ ut_markasspare_CPPFLAGS = \
+-	-g3 -I$(top_srcdir) \
++	-g3 -I$(top_builddir) \
+ 	-I$(top_srcdir)/include
+ 
+ ut_markasspare_LDADD = \
+-	../src/libssi.la
++	$(top_builddir)/src/libssi.la
+ 
+ ut_migration_SOURCES = \
+ 	ut_migration.cpp
+ 
+ ut_migration_CPPFLAGS = \
+-	-g3 -I$(top_srcdir) \
++	-g3 -I$(top_builddir) \
+ 	-I$(top_srcdir)/include
+ 
+ ut_migration_LDADD = \
+-	../src/libssi.la
++	$(top_builddir)/src/libssi.la
+ 
+ ut_phy_SOURCES = \
+ 	ut_phy.cpp
+ 
+ ut_phy_CPPFLAGS = \
+-	-g3 -I$(top_srcdir) \
++	-g3 -I$(top_builddir) \
+ 	-I$(top_srcdir)/include
+ 
+ ut_phy_LDADD = \
+-	../src/libssi.la
++	$(top_builddir)/src/libssi.la
+ 
+ ut_initialize_volume_SOURCES = \
+ 	ut_initialize_volume.cpp
+ 
+ ut_initialize_volume_CPPFLAGS = \
+-	-g3 -I$(top_srcdir) \
++	-g3 -I$(top_builddir) \
+ 	-I$(top_srcdir)/include
+ 
+ ut_initialize_volume_LDADD = \
+-	../src/libssi.la
++	$(top_builddir)/src/libssi.la
+ 
+ ut_filesystem_SOURCES = \
+ 	ut_filesystem.cpp \
+@@ -92,7 +92,7 @@ ut_filesystem_SOURCES = \
+ 
+ ut_filesystem_CPPFLAGS = \
+ 	-iquote $(top_srcdir)/lib/engine \
+-	-I$(top_srcdir) \
++	-I$(top_builddir) \
+ 	-I$(top_srcdir)/include
+ 
+ ut_string_SOURCES = \
+@@ -103,6 +103,6 @@ ut_string_SOURCES = \
+ 
+ ut_string_CPPFLAGS = \
+ 	-iquote $(top_srcdir)/lib/engine \
+-	-I$(top_srcdir) \
++	-I$(top_builddir) \
+ 	-I$(top_srcdir)/include
+ 
diff --git a/meta-oe/recipes-support/ssiapi/ssiapi/0005-engine-Define-SENTINEL.patch b/meta-oe/recipes-support/ssiapi/ssiapi/0005-engine-Define-SENTINEL.patch
deleted file mode 100644
index 6f4dbf18e0..0000000000
--- a/meta-oe/recipes-support/ssiapi/ssiapi/0005-engine-Define-SENTINEL.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From a2e3a2e332c406ea3c56a8d74b61978107df68e6 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 16 Jun 2017 22:23:08 -0700
-Subject: [PATCH 5/6] engine: Define SENTINEL
-
-Fix warnings with gcc7
-test.cpp:12: warning: missing sentinel in function call
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- lib/engine/utils.cpp | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/lib/engine/utils.cpp b/lib/engine/utils.cpp
-index 44579a1..8812a8c 100644
---- a/lib/engine/utils.cpp
-+++ b/lib/engine/utils.cpp
-@@ -35,7 +35,7 @@ THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
- #include "filesystem.h"
- #include "utils.h"
- #include "log/log.h"
--
-+#define SENTINEL (const char *)0
- /**
-  * @brief capture shell output as binary data
-  *
-@@ -139,7 +139,7 @@ int shell(const String &s)
-          * Before switching into new executable close all non standard
-          * file handlers.*/
-         close_parent_fds();
--        execl("/bin/sh", "sh", "-c", cmd.get(), NULL);
-+        execl("/bin/sh", "sh", "-c", cmd.get(), SENTINEL);
-         /* If we're here then execl failed*/
-         exit(-1);
-         break;
--- 
-2.13.1
-
diff --git a/meta-oe/recipes-support/ssiapi/ssiapi/0006-tools-Add-missing-includes-and-use-realpath-instead-.patch b/meta-oe/recipes-support/ssiapi/ssiapi/0006-tools-Add-missing-includes-and-use-realpath-instead-.patch
deleted file mode 100644
index a7b70e3f49..0000000000
--- a/meta-oe/recipes-support/ssiapi/ssiapi/0006-tools-Add-missing-includes-and-use-realpath-instead-.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From df1d56d6b6a6b15d0137619eb8a4b623de6c9633 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 16 Jun 2017 22:28:59 -0700
-Subject: [PATCH 6/6] tools: Add missing includes and use realpath() instead of
- canonicalize_file_name
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- tools/ssieventmonitor.cpp | 6 ++++--
- 1 file changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/tools/ssieventmonitor.cpp b/tools/ssieventmonitor.cpp
-index 0553386..f04b8f0 100644
---- a/tools/ssieventmonitor.cpp
-+++ b/tools/ssieventmonitor.cpp
-@@ -18,7 +18,9 @@ THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
- #include <unistd.h>
- #include <dirent.h>
- #include <errno.h>
--#include <sys/fcntl.h>
-+#include <limits.h>
-+#include <fcntl.h>
-+#include <libgen.h>
- #include <sys/select.h>
- #include <sys/wait.h>
- #include <sys/inotify.h>
-@@ -99,7 +101,7 @@ static int _exec_ssimsg(void)
-     int status;
-     switch (pid) {
- 	case 0: {
--	    cp = canonicalize_file_name("/proc/self/exe");
-+	    cp = realpath("/proc/self/exe", NULL);
- 	    if (cp) {
- 		strcpy(buffer, cp);
- 		free(cp);
--- 
-2.13.1
-
diff --git a/meta-oe/recipes-support/ssiapi/ssiapi/configure-cflags.patch b/meta-oe/recipes-support/ssiapi/ssiapi/configure-cflags.patch
deleted file mode 100644
index d45be590c7..0000000000
--- a/meta-oe/recipes-support/ssiapi/ssiapi/configure-cflags.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-Do not override flags thereby respect the flags coming from environment,
-e.g. we need some optimization level turned on when security flags are enabled
-without this change, the build would fail
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Index: ssiapi.1.0.1/configure.ac
-===================================================================
---- ssiapi.1.0.1.orig/configure.ac
-+++ ssiapi.1.0.1/configure.ac
-@@ -15,11 +15,6 @@ AC_SUBST(VERSION)
- AM_INIT_AUTOMAKE(ssi, ${VERSION})
- AM_CONFIG_HEADER(config.h)
- 
--dnl Set the language we use
--CPPFLAGS="-g3 -gdwarf-2 -Wall -Werror -D_GNU_SOURCE"
--CFLAGS="-std=gnu99"
--CXXFLAGS="-std=gnu++98"
--
- dnl Automake 1.11 - silent build rules
- m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])
- 
diff --git a/meta-oe/recipes-support/ssiapi/ssiapi_1.0.1.bb b/meta-oe/recipes-support/ssiapi/ssiapi_1.0.1.bb
deleted file mode 100644
index 5eb4696b57..0000000000
--- a/meta-oe/recipes-support/ssiapi/ssiapi_1.0.1.bb
+++ /dev/null
@@ -1,35 +0,0 @@
-SUMMARY = "Intel RSTe with Linux OS SSI API Library"
-
-DESCRIPTION = "Intel Rapid Storage Technology enterprise with Linux OS* Standard Storage Interface API Library. \
-The library allows user to manage storage devices including creating and managing Raid arrays on systems with Intel chipset."
-
-HOMEPAGE = "http://irstessi.sourceforge.net/"
-
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=0413ff365e0bd733c4869a6797551c6f"
-
-DEPENDS += "sg3-utils"
-
-SRC_URI = "http://sourceforge.net/projects/irstessi/files/${BPN}.${PV}.tgz \
-           file://0001-Use-pragma-once-unconditionally.patch \
-           file://0002-Convert-macros-into-functions.patch \
-           file://0003-Replace-canonicalize_file_name-with-realpath-API.patch \
-           file://0004-engine-Fix-indentation-and-missing-semi-colon.patch \
-           file://0005-engine-Define-SENTINEL.patch \
-           file://0006-tools-Add-missing-includes-and-use-realpath-instead-.patch \
-           file://configure-cflags.patch \
-           file://0001-ssieventmonitor-ordered-comparison-between-pointers-.patch \
-           "
-SRC_URI[md5sum] = "02f16d7cbd30d28034093212906591f5"
-SRC_URI[sha256sum] = "e10d283b0f211afb8ebd0bde87c097769613d30a052cdf164753e35e803264c7"
-
-S ="${WORKDIR}/${BPN}.${PV}"
-
-inherit autotools-brokensep
-CXXFLAGS="-std=gnu++98 -D_GNU_SOURCE"
-
-do_configure_prepend(){
-    ./autogen.sh
-}
-
-RDEPENDS_${PN} += "mdadm"
diff --git a/meta-oe/recipes-support/ssiapi/ssiapi_1.3.0.bb b/meta-oe/recipes-support/ssiapi/ssiapi_1.3.0.bb
new file mode 100644
index 0000000000..eb086817ef
--- /dev/null
+++ b/meta-oe/recipes-support/ssiapi/ssiapi_1.3.0.bb
@@ -0,0 +1,36 @@
+SUMMARY = "Intel RSTe with Linux OS SSI API Library"
+
+DESCRIPTION = "Intel Rapid Storage Technology enterprise with Linux OS* Standard Storage Interface API Library. \
+The library allows user to manage storage devices including creating and managing Raid arrays on systems with Intel chipset."
+
+HOMEPAGE = "http://irstessi.sourceforge.net/"
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://COPYING;md5=9d701a2fbb56039fd64afb2262008ddb"
+
+DEPENDS += "sg3-utils"
+
+SRC_URI = "http://sourceforge.net/projects/irstessi/files/${BPN}.${PV}.tgz \
+           file://0001-log-Avoid-shadowing-functions-from-std-lib.patch \
+           file://0002-boost-Backport-clang-support.patch \
+           file://0003-engine-Define-discover-const-String-path-in-base-cla.patch \
+           file://0004-Do-not-override-flags-coming-from-build-environment.patch \
+           file://0005-enable-out-of-source-tree-builds.patch \
+           file://0001-Don-t-use-__GNUC_PREREQ.patch \
+           file://0002-Use-stangard-int-types.patch \
+           file://0003-replace-canonicalize_file_name-with-realpath.patch \
+           file://0004-include-limits.h.patch \
+           file://0001-Include-libgen.h.patch \
+           "
+SRC_URI[md5sum] = "d06c9b426437a7697d77266e9835b520"
+SRC_URI[sha256sum] = "59daab29363d6e9f07c524029c4239653cfbbee6b0e57fd75df62499728dad8a"
+
+S ="${WORKDIR}/${BPN}.${PV}"
+
+inherit autotools
+
+do_configure_prepend(){
+    ${S}/autogen.sh
+}
+
+RDEPENDS_${PN} += "mdadm"
-- 
2.23.0


