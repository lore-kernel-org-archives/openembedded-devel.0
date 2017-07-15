Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 9B42A78245
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Jul 2017 01:55:47 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id d193so12308175pgc.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Jul 2017 18:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=9e3QtWEqeKPgelXmsKac2md+Ikpdsh1pYFkkQGgnfnY=;
	b=g2nZ0ErpjxfNCrF6AhOjCzdZBrMqFQY8C8od1Rp0O3qrWiq2U2fqQg1qWYgpmf9xN9
	/fS7JM8qjAMg29YhQmLJ/Bc/aYNP+XIStWFIUPQNs4z/2XMoNJ2aDwBt5HKdg9P6WNCp
	EY2eOAPI9tnbuCAMUlabtU9u/uBb2qGwgdtVFgZsoBml5SzhQiw+5wckkACVvRbyCO4x
	34M0pewB/nhXLJH3qJDTCdlbb5njNjbuBj9BrENbirFcGi1Gt8SAaQHE86RNvJurvg1n
	K2JDJxKfP7PxSr5MapgWgG0ex874zE8RC7N/gLMHtq+F9/M0Mqu6ZoIyxrb6ZRj984OF
	IXXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=9e3QtWEqeKPgelXmsKac2md+Ikpdsh1pYFkkQGgnfnY=;
	b=cZCh7ci/78QCagPlQO3xphMKm/bHmza81FFf/aZKIE/t2TlH802CIq3IAOp+68+gVU
	RAZuHeGfSU4sq1q025rqXANB2T4+XHFXqCYZZCLwcrVWlfhfbv71hAxZvc+ksGwv6mEI
	IquUI5IIx9EVq5nFmnYmfJ+5XsQL4zDRP0L5BFXscYPbfTjuJ5BQDHJS4wiPWYNbgQLI
	Z+jtBKxnaO69n/ngVRMu6pjFXw33ByQfYFrkgUHMX8YPXx98kL77ElloKYD9RdhHlP5I
	RMQWjZRmKoiwDxxYk56LTgisQhUS57681xEn4Ce6KoEXmHoQTY4ehU5V3dLAZsua8RxB
	TzwA==
X-Gm-Message-State: AIVw113AQGVEEFCGuLCimxTxAIIdI0Jpmx9/YfP4zoP9HMAR33nHAVmc
	2GCtnVHNpNTSJ/oO
X-Received: by 10.99.44.206 with SMTP id s197mr17754122pgs.116.1500083747942; 
	Fri, 14 Jul 2017 18:55:47 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::7028])
	by smtp.gmail.com with ESMTPSA id
	l4sm18189589pgr.21.2017.07.14.18.55.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 14 Jul 2017 18:55:47 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 14 Jul 2017 18:55:34 -0700
Message-Id: <20170715015539.31584-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.3
Subject: [meta-oe][PATCH 1/6] iperf3: Fix missing stdint.h and do not link with -pg
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
X-List-Received-Date: Sat, 15 Jul 2017 01:55:48 -0000

Helps compile with musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...de-stdint.h-for-various-std-c99-int-types.patch | 39 ++++++++++++++++++++++
 .../0002-Remove-pg-from-profile_CFLAGS.patch       | 31 +++++++++++++++++
 meta-oe/recipes-benchmark/iperf3/iperf3_git.bb     | 11 +++---
 3 files changed, 77 insertions(+), 4 deletions(-)
 create mode 100644 meta-oe/recipes-benchmark/iperf3/iperf3/0001-include-stdint.h-for-various-std-c99-int-types.patch
 create mode 100644 meta-oe/recipes-benchmark/iperf3/iperf3/0002-Remove-pg-from-profile_CFLAGS.patch

diff --git a/meta-oe/recipes-benchmark/iperf3/iperf3/0001-include-stdint.h-for-various-std-c99-int-types.patch b/meta-oe/recipes-benchmark/iperf3/iperf3/0001-include-stdint.h-for-various-std-c99-int-types.patch
new file mode 100644
index 000000000..ae3620800
--- /dev/null
+++ b/meta-oe/recipes-benchmark/iperf3/iperf3/0001-include-stdint.h-for-various-std-c99-int-types.patch
@@ -0,0 +1,39 @@
+From be653711fb92d2430b3ecc546b4e3ad927d19ec5 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 14 Jul 2017 12:59:42 -0700
+Subject: [PATCH 1/2] include stdint.h for various std c99 int types
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/cjson.h | 2 ++
+ src/timer.h | 1 +
+ 2 files changed, 3 insertions(+)
+
+diff --git a/src/cjson.h b/src/cjson.h
+index fb8cd3b..69cd272 100644
+--- a/src/cjson.h
++++ b/src/cjson.h
+@@ -23,6 +23,8 @@
+ #ifndef cJSON__h
+ #define cJSON__h
+ 
++#include <stdint.h>
++
+ #ifdef __cplusplus
+ extern "C"
+ {
+diff --git a/src/timer.h b/src/timer.h
+index 0f9c5eb..0b195be 100644
+--- a/src/timer.h
++++ b/src/timer.h
+@@ -31,6 +31,7 @@
+ #define __TIMER_H
+ 
+ #include <sys/time.h>
++#include <stdint.h>
+ 
+ /* TimerClientData is an opaque value that tags along with a timer.  The
+ ** client can use it for whatever, and it gets passed to the callback when
+-- 
+2.13.3
+
diff --git a/meta-oe/recipes-benchmark/iperf3/iperf3/0002-Remove-pg-from-profile_CFLAGS.patch b/meta-oe/recipes-benchmark/iperf3/iperf3/0002-Remove-pg-from-profile_CFLAGS.patch
new file mode 100644
index 000000000..06eb41ac0
--- /dev/null
+++ b/meta-oe/recipes-benchmark/iperf3/iperf3/0002-Remove-pg-from-profile_CFLAGS.patch
@@ -0,0 +1,31 @@
+From 6db0e28f906bc3784019dfb5bb011237a8034fda Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 14 Jul 2017 13:00:16 -0700
+Subject: [PATCH 2/2] Remove -pg from profile_CFLAGS
+
+musl fails to link with missing gcrt1.o
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/Makefile.am | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/Makefile.am b/src/Makefile.am
+index 23b0c72..6268145 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -49,9 +49,9 @@ iperf3_LDFLAGS          = -g
+ iperf3_profile_SOURCES  = main.c \
+ 						  $(libiperf_la_SOURCES)
+ 
+-iperf3_profile_CFLAGS   = -pg -g
++iperf3_profile_CFLAGS   = -g
+ iperf3_profile_LDADD    = libiperf.la
+-iperf3_profile_LDFLAGS  = -pg -g
++iperf3_profile_LDFLAGS  = -g
+ 
+ # Specify the sources and various flags for the test cases
+ t_timer_SOURCES         = t_timer.c
+-- 
+2.13.3
+
diff --git a/meta-oe/recipes-benchmark/iperf3/iperf3_git.bb b/meta-oe/recipes-benchmark/iperf3/iperf3_git.bb
index d19aa1ec4..4a01896ca 100644
--- a/meta-oe/recipes-benchmark/iperf3/iperf3_git.bb
+++ b/meta-oe/recipes-benchmark/iperf3/iperf3_git.bb
@@ -11,10 +11,11 @@ AUTHOR = "ESNET <info@es.net>, Lawrence Berkeley National Laboratory <websupport
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3434c5a9a53c78c7739f0bc9e5adda"
 
-SRC_URI = "\
-    git://github.com/esnet/iperf.git \
-    file://automake-foreign.patch \
-"
+SRC_URI = "git://github.com/esnet/iperf.git \
+           file://automake-foreign.patch \
+           file://0001-include-stdint.h-for-various-std-c99-int-types.patch \
+           file://0002-Remove-pg-from-profile_CFLAGS.patch \
+           "
 
 PV = "3.1.3+gitr${SRCPV}"
 SRCREV = "099244ec686b620393e9845478a554b1c7ca5c8b"
@@ -25,4 +26,6 @@ inherit autotools
 
 PACKAGECONFIG[lksctp] = "ac_cv_header_netinet_sctp_h=yes,ac_cv_header_netinet_sctp_h=no,lksctp-tools"
 
+CFLAGS += "-D_GNU_SOURCE"
+
 BBCLASSEXTEND = "native"
-- 
2.13.3


