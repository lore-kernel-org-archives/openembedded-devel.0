Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id C87227BD9A
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Jul 2019 16:04:09 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id a93so26491994pla.7
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Jul 2019 09:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=28d1IDl2001hRXgb9etoA9b3fY+DEvl2dCuTroG3iQA=;
	b=nAecGqefe1FBh4OdRXPCTxJYqFwDkQiOlkEbSPz2H6JdTqZB46tsm11Z/KYfNFX1LG
	ykDVySL0m+AbytwQPVhVSda7wP3Eod+3ShRLRoLY69NV76Och5CTT5T5W+SyIcEFFbhg
	b2AGmSMNRPluD2fxlbkuuo/6T5wEnA+R91g2+bTSNCvrbuTeckmZFzQCYv8UQhq401V5
	QQ6tHFyJ7OIQVBrQWLLhRMvQckk0zaquDtCAyO3CVhYs5GWEtYRq56AtIFqsSar5N9gp
	YvrPN42v0aMFPfNrnOmREx6ewVHJd3/0peR5/F81syUEwHfTZ48mzPuhp3xWD+B6vdiZ
	n7mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=28d1IDl2001hRXgb9etoA9b3fY+DEvl2dCuTroG3iQA=;
	b=b6dZ9vFdagakOHw8xfha3GAjwgUru2va1FrVTlAO1IpQqUibeiZzXlr1EZ3LgJXxtp
	dfmH9JTt1DHbu37XzmrVvOnSUPfEYIntSGkIzz6kPsuJ2TSJY59CSpDOczkdXapku+z0
	mhnCeY4gue40yQLrabvjWJTbIOqAMGUUZL5aCt8+PzJfBuzHxyRpODbvYrTJUoLDdbIQ
	jVueGE+HjKfUANlOOe9mR560v3hfc9OrSz2f0KTAC0WkwvXegU5T866hAupZUhif/Va4
	rCVxiINpoXud0YJC5McmGqenkTVdcWMVfSMRKEiQ5ngJzNXK0vuMooSDmr8eHieYEkjm
	sdXg==
X-Gm-Message-State: APjAAAVxgBi0iczBCGwPEOllG7kQOxFPk5ADfrEqMVqf7oqwPpy9ULG6
	Bx21LS7MlfdGUwCa8CGGp3LPU6PN58M=
X-Google-Smtp-Source: APXvYqzk3KhI15EXJZQJnOVb7KzxTzsKUD9tqUIfSwU39/OWJoJRLy4GHQ+SoiDBbgGCuqnXKgjcFQ==
X-Received: by 2002:a17:902:1102:: with SMTP id
	d2mr105825455pla.149.1564329850713; 
	Sun, 28 Jul 2019 09:04:10 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	j1sm82508439pgl.12.2019.07.28.09.04.10
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sun, 28 Jul 2019 09:04:10 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 28 Jul 2019 09:04:01 -0700
Message-Id: <20190728160401.23849-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190728160401.23849-1-raj.khem@gmail.com>
References: <20190728160401.23849-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH v2 2/2] collectd: Fix build with glibc 2.30
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
X-List-Received-Date: Sun, 28 Jul 2019 16:04:10 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Apply the fix just for glibc based systems

 ...-sys-sysctl.h-on-glibc-based-systems.patch | 76 +++++++++++++++++++
 .../collectd/collectd_5.8.1.bb                |  1 +
 2 files changed, 77 insertions(+)
 create mode 100644 meta-oe/recipes-extended/collectd/collectd/0001-Remove-including-sys-sysctl.h-on-glibc-based-systems.patch

diff --git a/meta-oe/recipes-extended/collectd/collectd/0001-Remove-including-sys-sysctl.h-on-glibc-based-systems.patch b/meta-oe/recipes-extended/collectd/collectd/0001-Remove-including-sys-sysctl.h-on-glibc-based-systems.patch
new file mode 100644
index 0000000000..86a1a82cf7
--- /dev/null
+++ b/meta-oe/recipes-extended/collectd/collectd/0001-Remove-including-sys-sysctl.h-on-glibc-based-systems.patch
@@ -0,0 +1,76 @@
+From 090a17ca338a9311d682ecc5933b32bff67cf07f Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 27 Jul 2019 14:20:14 -0700
+Subject: [PATCH] Remove including sys/sysctl.h on glibc based systems
+
+Glibc 2.30 has added deprecation notice and collectd detects it as warning [1]
+
+Fixes
+sys/sysctl.h:21:2: error: "The <sys/sysctl.h> header is deprecated and will be removed." [-Werror,-W#warnings]
+
+[1] https://sourceware.org/git/?p=glibc.git;a=commit;h=744e829637162bb7d5029632aacf341c64b86990
+
+Upstream-Status: Submitted [https://github.com/collectd/collectd/pull/3234]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/contextswitch.c | 2 +-
+ src/memory.c        | 2 +-
+ src/swap.c          | 2 +-
+ src/uuid.c          | 2 +-
+ 4 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/src/contextswitch.c b/src/contextswitch.c
+index cf3d3dae..4711e66d 100644
+--- a/src/contextswitch.c
++++ b/src/contextswitch.c
+@@ -26,7 +26,7 @@
+ #include "plugin.h"
+ #include "utils/common/common.h"
+ 
+-#ifdef HAVE_SYS_SYSCTL_H
++#if defined(HAVE_SYS_SYSCTL_H) && !defined(__GLIBC__)
+ #include <sys/sysctl.h>
+ #endif
+ 
+diff --git a/src/memory.c b/src/memory.c
+index 10bccdee..50a80868 100644
+--- a/src/memory.c
++++ b/src/memory.c
+@@ -28,7 +28,7 @@
+ #include "plugin.h"
+ #include "utils/common/common.h"
+ 
+-#ifdef HAVE_SYS_SYSCTL_H
++#if defined(HAVE_SYS_SYSCTL_H) && !defined(__GLIBC__)
+ #include <sys/sysctl.h>
+ #endif
+ #ifdef HAVE_SYS_VMMETER_H
+diff --git a/src/swap.c b/src/swap.c
+index 61c9e284..5a475e4f 100644
+--- a/src/swap.c
++++ b/src/swap.c
+@@ -49,7 +49,7 @@
+ #if HAVE_SYS_PARAM_H
+ #include <sys/param.h>
+ #endif
+-#if HAVE_SYS_SYSCTL_H
++#if defined(HAVE_SYS_SYSCTL_H) && !defined(__GLIBC__)
+ #include <sys/sysctl.h>
+ #endif
+ #if HAVE_SYS_DKSTAT_H
+diff --git a/src/uuid.c b/src/uuid.c
+index 60d09b51..17e4dd81 100644
+--- a/src/uuid.c
++++ b/src/uuid.c
+@@ -29,7 +29,7 @@
+ #include "plugin.h"
+ #include "utils/common/common.h"
+ 
+-#if HAVE_SYS_SYSCTL_H
++#if defined(HAVE_SYS_SYSCTL_H) && !defined(__GLIBC__)
+ #include <sys/sysctl.h>
+ #endif
+ 
+-- 
+2.22.0
+
diff --git a/meta-oe/recipes-extended/collectd/collectd_5.8.1.bb b/meta-oe/recipes-extended/collectd/collectd_5.8.1.bb
index 6dff18c16b..0951ac076f 100644
--- a/meta-oe/recipes-extended/collectd/collectd_5.8.1.bb
+++ b/meta-oe/recipes-extended/collectd/collectd_5.8.1.bb
@@ -14,6 +14,7 @@ SRC_URI = "http://collectd.org/files/collectd-${PV}.tar.bz2 \
            file://0001-configure-Check-for-Wno-error-format-truncation-comp.patch \
            file://0005-Disable-new-gcc8-warnings.patch \
            file://0006-libcollectdclient-Fix-string-overflow-errors.patch \
+           file://0001-Remove-including-sys-sysctl.h-on-glibc-based-systems.patch \
            "
 SRC_URI[md5sum] = "bfce96c42cede5243028510bcc57c1e6"
 SRC_URI[sha256sum] = "e796fda27ce06377f491ad91aa286962a68c2b54076aa77a29673d53204453da"
-- 
2.22.0


