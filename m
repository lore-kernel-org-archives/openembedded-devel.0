Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 6CD8277E88
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jul 2017 03:10:34 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id q85so1025670pfq.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Jul 2017 20:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=j9PcXtK9nVRWaDGS3bsbZyOCiUQF/Bk0LRLqBE6VdfE=;
	b=ByLw4x1lwhnsGJksdKf+65meF/qYfTvTJZnPYa6eVkGol6xD/vVzKYSz+QiqY306nV
	iFQS9HO8kzcRw+Wa2zwVgm9KQZhbEXGKgPJg+o0f5YAakbgREnH7o2Xwi1XP3UPYQi0f
	hq1I2Dpsyroj0bFDVLmQIzaTIZYbP9XvcEQAMgaTzkO3KW7rMMZBC3BEco3S4dj0Hh5R
	7Hh6k0l7D33ne2ReXQr1cVSk5FwIbaOpWjU5D2r0euwnygeoncVMn8Nn7xS25D2ebwkG
	NJTBTaM9ENS3wEM4tj7pO07fFmX5jAIiehOKfsAOkm9zgQBzYdIu6hsb0Ty3Xns3JSYd
	b8og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=j9PcXtK9nVRWaDGS3bsbZyOCiUQF/Bk0LRLqBE6VdfE=;
	b=nkbWlrVhgZS6fwf8HhKaYFhuY5hVTY3LHanN0GHg/1fHwLub0KnerPjQ0u5L/DOT/j
	Ux8j6nIwsmhmyVKDH6k8ovsiZ9pkkfuJd9e+znPkU9K3xkmUcd8zP1QB3uWyojsY5FVC
	FeCvDsFR8wShNXiqDASNb2cMCkSgM5TO6cOCmMuJSEc3bs/2VfhUw4tqnlEHcNaPViXu
	R/sWQnPWPo+wyR+ASYMQsoSkSPdwNRCPDQesea+06ML8j13/cr09s9r+fP4puUqykbjR
	bL+Ipp1jrqEeeiJnDgVIFL/rPeRSophHKMfNy/FdOgMOiNGTE+GwyGkKEr9WzF+TR0SO
	OSYw==
X-Gm-Message-State: AIVw113SWwGHqAHPUez3MprKYMkg5jJpWqLiWKLpcbN+wmlhwJCZ1794
	JV5I6nc4AGV8RRJv
X-Received: by 10.84.128.14 with SMTP id 14mr839351pla.285.1500347435268;
	Mon, 17 Jul 2017 20:10:35 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	w85sm1086674pfj.115.2017.07.17.20.10.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 17 Jul 2017 20:10:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Jul 2017 20:10:04 -0700
Message-Id: <20170718031013.44536-8-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170718031013.44536-1-raj.khem@gmail.com>
References: <20170718031013.44536-1-raj.khem@gmail.com>
Subject: [meta-initramfs][PATCH 08/17] grubby: Link with libexecinfo on musl
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
X-List-Received-Date: Tue, 18 Jul 2017 03:10:34 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-variable-LIBS-to-provides-libraries-from.patch | 26 ++++++++++++++++++++++
 .../0002-include-paths.h-for-_PATH_MOUNTED.patch   | 25 +++++++++++++++++++++
 .../recipes-devtools/grubby/grubby_8.40.bb         |  9 ++++++--
 3 files changed, 58 insertions(+), 2 deletions(-)
 create mode 100644 meta-initramfs/recipes-devtools/grubby/grubby/0001-Add-another-variable-LIBS-to-provides-libraries-from.patch
 create mode 100644 meta-initramfs/recipes-devtools/grubby/grubby/0002-include-paths.h-for-_PATH_MOUNTED.patch

diff --git a/meta-initramfs/recipes-devtools/grubby/grubby/0001-Add-another-variable-LIBS-to-provides-libraries-from.patch b/meta-initramfs/recipes-devtools/grubby/grubby/0001-Add-another-variable-LIBS-to-provides-libraries-from.patch
new file mode 100644
index 000000000..1b1a993a0
--- /dev/null
+++ b/meta-initramfs/recipes-devtools/grubby/grubby/0001-Add-another-variable-LIBS-to-provides-libraries-from.patch
@@ -0,0 +1,26 @@
+From 22afaa21b4b258082be591e54c99e1ba6fbd7748 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 15 Jul 2017 10:19:22 -0700
+Subject: [PATCH 1/2] Add another variable LIBS to provides libraries from env
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index ac14404..92a8e73 100644
+--- a/Makefile
++++ b/Makefile
+@@ -27,7 +27,7 @@ RPM_OPT_FLAGS ?= -O2 -g -pipe -Wp,-D_FORTIFY_SOURCE=2 -fstack-protector
+ CFLAGS += $(RPM_OPT_FLAGS) -std=gnu99 -Wall -Werror -Wno-error=unused-function -Wno-unused-function -ggdb
+ LDFLAGS := 
+ 
+-grubby_LIBS = -lblkid -lpopt
++grubby_LIBS = -lblkid -lpopt ${LIBS}
+ 
+ all: grubby
+ 
+-- 
+2.13.3
+
diff --git a/meta-initramfs/recipes-devtools/grubby/grubby/0002-include-paths.h-for-_PATH_MOUNTED.patch b/meta-initramfs/recipes-devtools/grubby/grubby/0002-include-paths.h-for-_PATH_MOUNTED.patch
new file mode 100644
index 000000000..de8133a3a
--- /dev/null
+++ b/meta-initramfs/recipes-devtools/grubby/grubby/0002-include-paths.h-for-_PATH_MOUNTED.patch
@@ -0,0 +1,25 @@
+From 8f844ac7f44b8dc428d06cd6958c5f32d383d01c Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 15 Jul 2017 10:19:50 -0700
+Subject: [PATCH 2/2] include paths.h for _PATH_MOUNTED
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ grubby.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/grubby.c b/grubby.c
+index 47a1a15..59f74a9 100644
+--- a/grubby.c
++++ b/grubby.c
+@@ -34,6 +34,7 @@
+ #include <libgen.h>
+ #include <execinfo.h>
+ #include <signal.h>
++#include <paths.h>
+ #include <blkid/blkid.h>
+ 
+ #include "log.h"
+-- 
+2.13.3
+
diff --git a/meta-initramfs/recipes-devtools/grubby/grubby_8.40.bb b/meta-initramfs/recipes-devtools/grubby/grubby_8.40.bb
index 0e9379085..5a998248c 100644
--- a/meta-initramfs/recipes-devtools/grubby/grubby_8.40.bb
+++ b/meta-initramfs/recipes-devtools/grubby/grubby_8.40.bb
@@ -9,11 +9,14 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=892f569a555ba9c07a568a7c0c4fa63a"
 
 DEPENDS = "popt util-linux"
+DEPENDS_append_libc-musl = " libexecinfo"
 
 SRC_URI = "https://github.com/rhinstaller/${BPN}/archive/${PV}-1.tar.gz;downloadfilename=${BPN}-${PV}-1.tar.gz \
            file://grubby-rename-grub2-editenv-to-grub-editenv.patch \
            file://run-ptest \
-"
+           file://0001-Add-another-variable-LIBS-to-provides-libraries-from.patch \
+           file://0002-include-paths.h-for-_PATH_MOUNTED.patch \
+           "
 
 SRC_URI[md5sum] = "1005907b275d6d93368d045274537d86"
 SRC_URI[sha256sum] = "85f1c678484f74c8978e8643451594967defce463a86c35cb1ee56d12767a9df"
@@ -24,8 +27,10 @@ RDEPENDS_${PN} += "dracut"
 
 inherit autotools-brokensep ptest
 
-EXTRA_OEMAKE = "-e 'CC=${CC}' 'LDFLAGS=${LDFLAGS}'"
+EXTRA_OEMAKE = "-e 'CC=${CC}' 'LDFLAGS=${LDFLAGS}' LIBS='${LIBS}'"
 
+LIBS_libc-musl = "-lexecinfo"
+LIBS ?= ""
 do_install_ptest() {
     install -d ${D}${PTEST_PATH}
     cp -r ${S}/test ${S}/test.sh ${D}${PTEST_PATH}
-- 
2.13.3


