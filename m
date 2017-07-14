Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 6CF9278152
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Jul 2017 05:40:45 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id j186so9397089pge.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Jul 2017 22:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=XvlLMqRHLjboD0CmTcx97WLvWdj6KdMhdcwT+J8YnHY=;
	b=M3RKlkxycaG88H8NS2e0BI38oj6CTMF9IYhjvJJFnFyFwKQAJdyjHfWXbU+2pbvJqt
	HZxQlw+7vgZT01DUQ8Lzsvfs37+vB5MbZ6+o+LRsxzdS+9cyIdZgDV7uBSSXJqfU+9DJ
	2aKHam+pduG7hUBMkU8W/iFTLSNEfPDMhdpph5mJlfIDx53ax4wnO2Gx9lLhpDPDJYc+
	SwmvXzF+qOjchwYBVXbzdITwi3+zA00QUSa+QTt8yx6JqOgB5kTtVq+7N5mp+cQlz85R
	xbVuk8Bswg2hojLhiQlm3RpcoOewh5vLO+IJsldbOQ5K/8EmFQ86Fdc2B4mrRrIeCJ2L
	wKhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=XvlLMqRHLjboD0CmTcx97WLvWdj6KdMhdcwT+J8YnHY=;
	b=O38lMSq1TQtHT9iwM3pKPSqM8tsSy8oBXmPq5YLhosF6SKs53uGql3GosMy8Pa1uIv
	oNfIjXQhLlomWBikJ+OQdwTVnJReKfYVm0YYSmo4cW95CG1xc7OommRhdu342A/23lDp
	ag6Vm2iyQ9RsOdhjhiqpbYpO05eugkJ/HF9BsY0SmwhAxPZ1JNaFu11DjoGfy/Z0NSFo
	NfBKe47HuEJYGZ2F8Ekzt+5oFA4/XKgDW48nDydQi5wsCg329ki7MrvCQkOkA9DtfQGW
	ZHOpQrmKlFKqqAvmHlb8MGraie14x/mL2QUck56AAhWDioGDP8XuOUKdVpTbB2jtsgkK
	gpGw==
X-Gm-Message-State: AIVw113TL7oZqz8uYOdoI0+EQUsPva3GKk+FcT0x+oOnsroN/fNNtSKO
	SF9eiChD269f+Ele
X-Received: by 10.101.72.130 with SMTP id n2mr12908926pgs.198.1500010846747;
	Thu, 13 Jul 2017 22:40:46 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::7028])
	by smtp.gmail.com with ESMTPSA id
	z86sm17519420pfl.40.2017.07.13.22.40.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Jul 2017 22:40:45 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Jul 2017 22:40:11 -0700
Message-Id: <20170714054013.34458-16-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20170714054013.34458-1-raj.khem@gmail.com>
References: <20170714054013.34458-1-raj.khem@gmail.com>
Subject: [meta-initramfs][PATCH 16/18] dracut: Upgrade to 045
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
X-List-Received-Date: Fri, 14 Jul 2017 05:40:45 -0000

Fix build on musl while here

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-util.h-include-sys-reg.h-when-libc-glibc.patch | 33 ++++++++++++++++++++++
 .../recipes-devtools/dracut/dracut_git.bb          | 19 +++++++++----
 2 files changed, 46 insertions(+), 6 deletions(-)
 create mode 100644 meta-initramfs/recipes-devtools/dracut/dracut/0001-util.h-include-sys-reg.h-when-libc-glibc.patch

diff --git a/meta-initramfs/recipes-devtools/dracut/dracut/0001-util.h-include-sys-reg.h-when-libc-glibc.patch b/meta-initramfs/recipes-devtools/dracut/dracut/0001-util.h-include-sys-reg.h-when-libc-glibc.patch
new file mode 100644
index 000000000..32714038b
--- /dev/null
+++ b/meta-initramfs/recipes-devtools/dracut/dracut/0001-util.h-include-sys-reg.h-when-libc-glibc.patch
@@ -0,0 +1,33 @@
+From 06011ce55b1e892e863568a73d64eebc6389544f Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 13 Jul 2017 17:14:05 -0700
+Subject: [PATCH] util.h: include <sys/reg.h> when libc != glibc
+
+For musl libc it is required to include <sys/reg.h> to
+have __WORDSIZE defined to e.g. 32 for arm*-musl.
+
+Taken from void-linux
+https://github.com/voidlinux/void-packages/blob/master/srcpkgs/dracut/patches/musl-__wordsize.patch
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ install/util.h | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/install/util.h b/install/util.h
+index 2ad3254d..062626ec 100644
+--- a/install/util.h
++++ b/install/util.h
+@@ -36,6 +36,9 @@
+ #include <sys/stat.h>
+ #include <dirent.h>
+ #include <sys/resource.h>
++#if !defined(__GLIBC__)
++#include <sys/reg.h>
++#endif
+ 
+ #include "macro.h"
+ 
+-- 
+2.13.2
+
diff --git a/meta-initramfs/recipes-devtools/dracut/dracut_git.bb b/meta-initramfs/recipes-devtools/dracut/dracut_git.bb
index b91f3fae2..09c86d0b7 100644
--- a/meta-initramfs/recipes-devtools/dracut/dracut_git.bb
+++ b/meta-initramfs/recipes-devtools/dracut/dracut_git.bb
@@ -5,13 +5,18 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 PE = "1"
-PV = "044+git${SRCREV}"
+PV = "045+git${SRCREV}"
 
-# v044 tag
-SRCREV = "1bc3e733f96033a508841e97fe08da7a12851782"
-SRC_URI = "git://git.kernel.org/pub/scm/boot/dracut/dracut.git;protocol=http"
+# v045 tag
+SRCREV = "39c9b67f86145953aa30def9d77c68597a4ccfe8"
+SRC_URI = "git://git.kernel.org/pub/scm/boot/dracut/dracut.git;protocol=http \
+           file://0001-util.h-include-sys-reg.h-when-libc-glibc.patch \
+           "
 
-inherit bash-completion
+DEPENDS += "kmod"
+DEPENDS_append_libc-musl = " fts"
+
+inherit bash-completion pkgconfig
 
 S = "${WORKDIR}/git"
 
@@ -30,7 +35,9 @@ EXTRA_OECONF = "--prefix=${prefix} \
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
 PACKAGECONFIG[systemd] = "--with-systemdsystemunitdir=${systemd_unitdir}/system/,,,systemd"
 
-EXTRA_OEMAKE += 'libdir=${prefix}/lib'
+EXTRA_OEMAKE += 'libdir=${prefix}/lib LDLIBS="${LDLIBS}"'
+
+LDLIBS_append_libc-musl = " -lfts"
 
 do_configure() {
     ./configure ${EXTRA_OECONF}
-- 
2.13.2


