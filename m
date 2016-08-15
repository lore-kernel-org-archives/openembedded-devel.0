Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f68.google.com (mail-pa0-f68.google.com
	[209.85.220.68])
	by mail.openembedded.org (Postfix) with ESMTP id E507277042
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Aug 2016 05:04:44 +0000 (UTC)
Received: by mail-pa0-f68.google.com with SMTP id ez1so3030160pab.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Aug 2016 22:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=oov57M5vQaUige8juZQ5D0aFQjnnrEiuNVTqlLggF20=;
	b=gB97RjL3YumAU+h6G8EhourEPTTgAilnkzWAMjP1P5jPIPrtJM8hC/giQNVCGQ6TpB
	OrizOvPer9DX1WKOw4hgjJsfT3Z+7xK4CZj8x6BI0Tn9W0/oGu7fGwOm7hR5VyRGVHS/
	GDze7jXJo0rymF2kMqyQ4QP/wblxFhsYJvVEyPn7YOZ7HJ613celKgQE1cVGM4TBiRzC
	K/5pKv/p/8l5wsoJ9y8UpkA6jCDpPgRO1O7APps0iTyJgHCG/P8AlcTAwzEVR9bV/4aY
	gCzdllwwWuezsFmPyvzJLK5FiTepLG6skTlHYv+r5EpjrDJwmwIa22Ol7MMjHHNbGr23
	8m5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=oov57M5vQaUige8juZQ5D0aFQjnnrEiuNVTqlLggF20=;
	b=EF6uKKabR3T7hDIKphemmguxFheoGMSrGRqGbRTTCl442NvTqvEetTMgCBGGniJhlR
	YXjsVz2tMkK3ykuw1qU2Sup/Ycj2CIWNyUApYepURE0HgoxmEIsSRcPKK/2Qdf1/pFad
	sZ6rB3gutv3zj5fV1VGEzxBQqB/XhfKKJS0rpH4RPi0zHMkYVd3KI9mD7MXKLGAIOEKP
	7k/9rh6toZSUAbJvJbwe+VS4dNSKp9sYMoNRgScutseSpHruAR0qh0zEKLVxnafg84Ca
	+17IVbLpE3Hyc/iZ6kxfqPohD15VMWhiaa7KAyE9HOOtv2lmSCTfsS/V+YuBoDO15tzA
	jYPQ==
X-Gm-Message-State: AEkooushUtVyepvQiU16cfcN58X2E1R9SyRyx7QZbJayCV1mqEm5fK602aMi9kD/jV5IYA==
X-Received: by 10.66.161.225 with SMTP id xv1mr50613776pab.20.1471237485209;
	Sun, 14 Aug 2016 22:04:45 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	ty6sm29178421pac.18.2016.08.14.22.04.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 14 Aug 2016 22:04:44 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 14 Aug 2016 22:04:33 -0700
Message-Id: <20160815050434.20974-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20160815050434.20974-1-raj.khem@gmail.com>
References: <20160815050434.20974-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/3] udisks2: Update to 2.1.7
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
X-List-Received-Date: Mon, 15 Aug 2016 05:04:46 -0000

Fix below  build with musl while here

| ../../udisks-2.1.7/udisks/udisksclient.c:2004:6: warning: '__GNUC_PREREQ' is not defined, evaluates to 0 [-Wundef]
| # if __GNUC_PREREQ(4,6) || __clang__

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../udisks/udisks2/non-gnu-libc.patch              | 26 ++++++++++++++++++++++
 .../udisks/{udisks2_2.1.5.bb => udisks2_2.1.7.bb}  |  8 ++++---
 2 files changed, 31 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-support/udisks/udisks2/non-gnu-libc.patch
 rename meta-oe/recipes-support/udisks/{udisks2_2.1.5.bb => udisks2_2.1.7.bb} (84%)

diff --git a/meta-oe/recipes-support/udisks/udisks2/non-gnu-libc.patch b/meta-oe/recipes-support/udisks/udisks2/non-gnu-libc.patch
new file mode 100644
index 0000000..98e6c75
--- /dev/null
+++ b/meta-oe/recipes-support/udisks/udisks2/non-gnu-libc.patch
@@ -0,0 +1,26 @@
+musl does not define __GNUC_PREREQ therefore check for C library being glibc
+if not then define the macro
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Index: udisks-2.1.7/udisks/udisksclient.c
+===================================================================
+--- udisks-2.1.7.orig/udisks/udisksclient.c
++++ udisks-2.1.7/udisks/udisksclient.c
+@@ -27,8 +27,15 @@
+ #include "udisksobjectinfo.h"
+ 
+ /* For __GNUC_PREREQ usage below */
+-#ifdef __GNUC__
++#ifdef __GLIBC__
+ # include <features.h>
++#else
++#if defined(__GNUC__)
++#define	__GNUC_PREREQ(__maj, __min)	\
++	(__GNUC__ > (__maj) || __GNUC__ == (__maj) && __GNUC_MINOR__ >= (__min))
++#else
++#define	__GNUC_PREREQ(__maj, __min) 0
++#endif
+ #endif
+ 
+ /**
diff --git a/meta-oe/recipes-support/udisks/udisks2_2.1.5.bb b/meta-oe/recipes-support/udisks/udisks2_2.1.7.bb
similarity index 84%
rename from meta-oe/recipes-support/udisks/udisks2_2.1.5.bb
rename to meta-oe/recipes-support/udisks/udisks2_2.1.7.bb
index f365cfa..34762dd 100644
--- a/meta-oe/recipes-support/udisks/udisks2_2.1.5.bb
+++ b/meta-oe/recipes-support/udisks/udisks2_2.1.7.bb
@@ -7,9 +7,11 @@ DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)
 
 RDEPENDS_${PN} = "acl"
 
-SRC_URI = "http://udisks.freedesktop.org/releases/udisks-${PV}.tar.bz2"
-SRC_URI[md5sum] = "73632501002e6de8244f831e38b2b98e"
-SRC_URI[sha256sum] = "2cfcf560447ea44cba2a683342c7062aaaf35e4eb554bed64ac2dd55a70a5fb6"
+SRC_URI = "http://udisks.freedesktop.org/releases/udisks-${PV}.tar.bz2 \
+           file://non-gnu-libc.patch \
+"
+SRC_URI[md5sum] = "8bccd36573b75286538bd5bd2c424f45"
+SRC_URI[sha256sum] = "abae2bb3bdc691ca13c1e4c244630b8c881c4f3b35c207299f1b39b7bec83785"
 
 inherit autotools systemd gtk-doc gobject-introspection
 
-- 
2.9.3


