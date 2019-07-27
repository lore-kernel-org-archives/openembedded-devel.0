Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id 36B627F1E3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Jul 2019 20:06:23 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id f5so17491172pgu.5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Jul 2019 13:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=jQaJBnvHII11j6LmOTCYLqlBB5JvMA4tGTOx3duRlnw=;
	b=kgKfAHbg4K89bKXVz36lPP1IRCyMQfolmMqjKECHYYpM6+6KZF1IvOw9u34tUnvnEx
	hcjboQw7bOvjrVtJk6WSpOhV64CUCf0adRamxnCBM9TscMdHqZAsgn+Ji2/WmI/KVNGy
	mtTWPJaR2BH3gF3DI3FHTAxqPHplyTADeo0EWXDtJE1wq+5knO2kbFUJHs6vHEteeC3L
	H8t8wYs/3JLOxxxlObu02GQlmtac2V8ALaYcHxhzuh8ZoP0Uj1W2Y3gXJndVOIWPm6fR
	PTJgIqWrKui2HGn01qSeBv5wzVdrj9IGpLBGNH7Fl2oPO/gLRXuHNX8adXoJqP9jI6KK
	x5GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=jQaJBnvHII11j6LmOTCYLqlBB5JvMA4tGTOx3duRlnw=;
	b=QhTSuraIRBVKaqvV9TCifTGFOhyJZRymMKavuNuIHlLjnOSGo6ebpB+OeI7yhI2vx5
	A7Pbvpoy25az7Huu0xlO9Pl3sNzpNon3sKtVofnjpx9S+JsK7iEl3O74a7Ub7vRoRlXu
	WnWPtu8TCNQNOkoB2ZHU8huuUtd5dfj4OBW8It3UFCaWQqcP5GcfVRGCSaiPICjNGbd8
	tBshnk1lSSeYRxcQN8UQf1cu/Zahoq4CyNwnpxWvg/isXyt+CBq2iSbH6wS6Lfi51SiV
	Ua4jU69uXupCDTT1Gd49Jq2xbz2aO5jqRsbmeUyzqDf7GGnBVv/IuCZxu2zSiXGTNmdb
	gUhQ==
X-Gm-Message-State: APjAAAWzPQU1O5p4g04egSrxbFcCzxJPw0+tLbAiMO0sof6YIMhDOyJN
	4gKfoP09fdU+0NAiQBKeCZ0znkTvs4I=
X-Google-Smtp-Source: APXvYqzLdHFt691ybYMhCPHuWJfHgDoCfPt1VgVpWOICAtDpHL8CNr3xgmiJZboqxFHhkfdSre39vA==
X-Received: by 2002:a63:3148:: with SMTP id x69mr11512107pgx.300.1564257983580;
	Sat, 27 Jul 2019 13:06:23 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	q24sm50850554pjp.14.2019.07.27.13.06.22
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sat, 27 Jul 2019 13:06:23 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 27 Jul 2019 13:06:13 -0700
Message-Id: <20190727200614.5661-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/2] collectd: Fix build with glibc 2.30
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
X-List-Received-Date: Sat, 27 Jul 2019 20:06:23 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Remove-including-sys-sysctl.h.patch  | 81 +++++++++++++++++++
 .../collectd/collectd_5.8.1.bb                |  1 +
 2 files changed, 82 insertions(+)
 create mode 100644 meta-oe/recipes-extended/collectd/collectd/0001-Remove-including-sys-sysctl.h.patch

diff --git a/meta-oe/recipes-extended/collectd/collectd/0001-Remove-including-sys-sysctl.h.patch b/meta-oe/recipes-extended/collectd/collectd/0001-Remove-including-sys-sysctl.h.patch
new file mode 100644
index 0000000000..450cdd0e5f
--- /dev/null
+++ b/meta-oe/recipes-extended/collectd/collectd/0001-Remove-including-sys-sysctl.h.patch
@@ -0,0 +1,81 @@
+From e06c1b4259533ef7a396da841cbf950baccd8c11 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 27 Jul 2019 12:20:22 -0700
+Subject: [PATCH] Remove including sys/sysctl.h
+
+Glibc 2.30 has added deprecation notice and collectd detects it as
+warning
+
+Fixes
+sys/sysctl.h:21:2: error: "The <sys/sysctl.h> header is deprecated and will be removed." [-Werror,-W#warnings]
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/contextswitch.c | 4 ----
+ src/memory.c        | 3 ---
+ src/swap.c          | 3 ---
+ src/uuid.c          | 4 ----
+ 4 files changed, 14 deletions(-)
+
+diff --git a/src/contextswitch.c b/src/contextswitch.c
+index 461fb0a..75d42ae 100644
+--- a/src/contextswitch.c
++++ b/src/contextswitch.c
+@@ -26,10 +26,6 @@
+ #include "common.h"
+ #include "plugin.h"
+ 
+-#ifdef HAVE_SYS_SYSCTL_H
+-#include <sys/sysctl.h>
+-#endif
+-
+ #if HAVE_SYSCTLBYNAME
+ /* no global variables */
+ /* #endif HAVE_SYSCTLBYNAME */
+diff --git a/src/memory.c b/src/memory.c
+index e49fe84..41996d5 100644
+--- a/src/memory.c
++++ b/src/memory.c
+@@ -28,9 +28,6 @@
+ #include "common.h"
+ #include "plugin.h"
+ 
+-#ifdef HAVE_SYS_SYSCTL_H
+-#include <sys/sysctl.h>
+-#endif
+ #ifdef HAVE_SYS_VMMETER_H
+ #include <sys/vmmeter.h>
+ #endif
+diff --git a/src/swap.c b/src/swap.c
+index 78f05c5..2488a5b 100644
+--- a/src/swap.c
++++ b/src/swap.c
+@@ -49,9 +49,6 @@
+ #if HAVE_SYS_PARAM_H
+ #include <sys/param.h>
+ #endif
+-#if HAVE_SYS_SYSCTL_H
+-#include <sys/sysctl.h>
+-#endif
+ #if HAVE_SYS_DKSTAT_H
+ #include <sys/dkstat.h>
+ #endif
+diff --git a/src/uuid.c b/src/uuid.c
+index 1cb9027..1c6cdc6 100644
+--- a/src/uuid.c
++++ b/src/uuid.c
+@@ -29,10 +29,6 @@
+ #include "common.h"
+ #include "plugin.h"
+ 
+-#if HAVE_SYS_SYSCTL_H
+-#include <sys/sysctl.h>
+-#endif
+-
+ #define UUID_RAW_LENGTH 16
+ #define UUID_PRINTABLE_COMPACT_LENGTH (UUID_RAW_LENGTH * 2)
+ #define UUID_PRINTABLE_NORMAL_LENGTH (UUID_PRINTABLE_COMPACT_LENGTH + 4)
+-- 
+2.22.0
+
diff --git a/meta-oe/recipes-extended/collectd/collectd_5.8.1.bb b/meta-oe/recipes-extended/collectd/collectd_5.8.1.bb
index 6dff18c16b..ed8b8a5d2b 100644
--- a/meta-oe/recipes-extended/collectd/collectd_5.8.1.bb
+++ b/meta-oe/recipes-extended/collectd/collectd_5.8.1.bb
@@ -14,6 +14,7 @@ SRC_URI = "http://collectd.org/files/collectd-${PV}.tar.bz2 \
            file://0001-configure-Check-for-Wno-error-format-truncation-comp.patch \
            file://0005-Disable-new-gcc8-warnings.patch \
            file://0006-libcollectdclient-Fix-string-overflow-errors.patch \
+           file://0001-Remove-including-sys-sysctl.h.patch \
            "
 SRC_URI[md5sum] = "bfce96c42cede5243028510bcc57c1e6"
 SRC_URI[sha256sum] = "e796fda27ce06377f491ad91aa286962a68c2b54076aa77a29673d53204453da"
-- 
2.22.0


