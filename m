Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
	[209.85.216.41])
	by mail.openembedded.org (Postfix) with ESMTP id E51D77F817
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Dec 2019 03:42:13 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id r11so2339453pjp.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Dec 2019 19:42:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Zd/eDzVCau/hG0MdVrW9gA1WO9Os06OpI6jvBnwgm6I=;
	b=fGyi+eah+BgvwLGChDsUPQ9uw86skDrdSxzo9BeebI6s/Xj1WVlPBQ/G1V55/FNhfX
	YVEWjReN/WyQpwQadKgqW6JE6I9yQMJecP5dzpOnnlBkHZSZKlJVTVSkPt+J+iZ/SrND
	AsIUgL97dRxOtlVApXekRti6HPH0lXexrmjw+D/8zB9IOf7LwordZcH4OPmG4NsdNOzU
	DOjFLP+X+bLjrvb+hVcYXJJwU8EGEfPK3s0MxfIby56WhomV/bFiMMX224HBDAjQHk8C
	exz/cLY6AE2RKCROdibFmygEj+m7qCGPwwNA9au/q3qmkyayoMsinFRE1yeTnoR6YzI1
	tztQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Zd/eDzVCau/hG0MdVrW9gA1WO9Os06OpI6jvBnwgm6I=;
	b=B2rD4VfcEA8fZ5A2NuTzBnudOBf8i1ZZsOP/TT6aVn+FfAPhjAYuzf2abC93xJPUro
	XA9VqMoiL1l97p2RrNHp2w7mLbOgNlY3zTNiKoTg/annUjLcXS2SDd1qW9PYjUuNBWCg
	EsXvnLKPwkyRsHKgDjvXESfabMVuUQD9xL16WG4iSY4kd2+fqlEhPFRGJZA2FOXHX1wH
	E+4sVksGBHLXuoPVrVAXNUJKnRx9Ax+wIRCENPwbQbBXTrG4QRhzwD1Wfz4p1N+160/o
	gd6owsadMz5PaXSK+JpbF0MTH3XIiGQydowIikdFv6gcDM7KU1jqoWtfsweZlMf0xXhS
	VFvQ==
X-Gm-Message-State: APjAAAVtslE/W01S/rE01bdjhemcoccQuHjciJcte5XjXcKC/tTKnAoj
	Kc3Bt0YwdlmCcxGCz9zKhASD11XgTMU=
X-Google-Smtp-Source: APXvYqz0b98bq6Ue0S9r0WZGYooPN8iNyG0NUjRAWs6NLuz+xBCNgHsfE+cgttNzE1xOo5Y3/vMk8w==
X-Received: by 2002:a17:90a:230b:: with SMTP id
	f11mr15265503pje.124.1576467734512; 
	Sun, 15 Dec 2019 19:42:14 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::6563])
	by smtp.gmail.com with ESMTPSA id
	a22sm21336106pfk.108.2019.12.15.19.42.12
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 15 Dec 2019 19:42:13 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 15 Dec 2019 19:41:55 -0800
Message-Id: <20191216034155.2675900-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191216034155.2675900-1-raj.khem@gmail.com>
References: <20191216034155.2675900-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 5/5] libpfm4: Moved here from oe-core
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
X-List-Received-Date: Mon, 16 Dec 2019 03:42:14 -0000
Content-Transfer-Encoding: 8bit

Upgrade to 4.10.1 while here
oprofile/ppc64 still depends on it

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...Include-poll.h-instead-of-sys-poll.h.patch | 86 +++++++++++++++++++
 .../recipes-kernel/libpfm/libpfm4_4.10.1.bb   | 31 +++++++
 2 files changed, 117 insertions(+)
 create mode 100644 meta-oe/recipes-kernel/libpfm/libpfm4/0001-Include-poll.h-instead-of-sys-poll.h.patch
 create mode 100644 meta-oe/recipes-kernel/libpfm/libpfm4_4.10.1.bb

diff --git a/meta-oe/recipes-kernel/libpfm/libpfm4/0001-Include-poll.h-instead-of-sys-poll.h.patch b/meta-oe/recipes-kernel/libpfm/libpfm4/0001-Include-poll.h-instead-of-sys-poll.h.patch
new file mode 100644
index 0000000000..fe13df2b53
--- /dev/null
+++ b/meta-oe/recipes-kernel/libpfm/libpfm4/0001-Include-poll.h-instead-of-sys-poll.h.patch
@@ -0,0 +1,86 @@
+From f62b629c1e1e968f90aafbc0cf9116b49eea9d8e Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 15 Dec 2019 16:24:37 -0800
+Subject: [PATCH] Include poll.h instead of sys/poll.h
+
+Fixes
+error: redirecting incorrect #include <sys/poll.h> to <poll.h> [-Werror,-W#warnings]
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ perf_examples/branch_smpl.c         | 2 +-
+ perf_examples/syst_smpl.c           | 2 +-
+ perf_examples/task_attach_timeout.c | 2 +-
+ perf_examples/task_smpl.c           | 2 +-
+ perf_examples/x86/bts_smpl.c        | 2 +-
+ 5 files changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/perf_examples/branch_smpl.c b/perf_examples/branch_smpl.c
+index 87cd303..4d16b04 100644
+--- a/perf_examples/branch_smpl.c
++++ b/perf_examples/branch_smpl.c
+@@ -32,7 +32,7 @@
+ #include <getopt.h>
+ #include <setjmp.h>
+ #include <sys/wait.h>
+-#include <sys/poll.h>
++#include <poll.h>
+ #include <sys/mman.h>
+ #include <locale.h>
+ #include <sys/ioctl.h>
+diff --git a/perf_examples/syst_smpl.c b/perf_examples/syst_smpl.c
+index 04580fd..d059c08 100755
+--- a/perf_examples/syst_smpl.c
++++ b/perf_examples/syst_smpl.c
+@@ -33,7 +33,7 @@
+ #include <setjmp.h>
+ #include <sys/ptrace.h>
+ #include <sys/wait.h>
+-#include <sys/poll.h>
++#include <poll.h>
+ #include <sys/ioctl.h>
+ #include <sys/mman.h>
+ #include <fcntl.h>
+diff --git a/perf_examples/task_attach_timeout.c b/perf_examples/task_attach_timeout.c
+index 7fc5524..a0367c8 100644
+--- a/perf_examples/task_attach_timeout.c
++++ b/perf_examples/task_attach_timeout.c
+@@ -36,7 +36,7 @@
+ #include <stdarg.h>
+ #include <sys/wait.h>
+ #include <err.h>
+-#include <sys/poll.h>
++#include <poll.h>
+ 
+ #include "perf_util.h"
+ 
+diff --git a/perf_examples/task_smpl.c b/perf_examples/task_smpl.c
+index dcb7481..95c432c 100644
+--- a/perf_examples/task_smpl.c
++++ b/perf_examples/task_smpl.c
+@@ -37,7 +37,7 @@
+ #include <getopt.h>
+ #include <setjmp.h>
+ #include <sys/wait.h>
+-#include <sys/poll.h>
++#include <poll.h>
+ #include <sys/mman.h>
+ #include <locale.h>
+ #include <sys/ioctl.h>
+diff --git a/perf_examples/x86/bts_smpl.c b/perf_examples/x86/bts_smpl.c
+index 6498776..d66d5e6 100644
+--- a/perf_examples/x86/bts_smpl.c
++++ b/perf_examples/x86/bts_smpl.c
+@@ -41,7 +41,7 @@
+ #include <sys/time.h>
+ #include <sys/ptrace.h>
+ #include <sys/wait.h>
+-#include <sys/poll.h>
++#include <poll.h>
+ #include <sys/mman.h>
+ #include <sys/resource.h>
+ #include <err.h>
+-- 
+2.24.1
+
diff --git a/meta-oe/recipes-kernel/libpfm/libpfm4_4.10.1.bb b/meta-oe/recipes-kernel/libpfm/libpfm4_4.10.1.bb
new file mode 100644
index 0000000000..9b43b4a975
--- /dev/null
+++ b/meta-oe/recipes-kernel/libpfm/libpfm4_4.10.1.bb
@@ -0,0 +1,31 @@
+SUMMARY = "Monitoring tools exploiting the performance monitoring events"
+DESCRIPTION = "This package provides a library, called libpfm4 which is used to develop \
+monitoring tools exploiting the performance monitoring events such as those \
+provided by the Performance Monitoring Unit (PMU) of modern processors."
+HOMEPAGE = "http://perfmon2.sourceforge.net/"
+BUGTRACKER = "http://sourceforge.net/tracker/?group_id=144822&atid=759953&source=navbar"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=0de488f3bd4424e308e2e399cb99c788"
+
+SECTION = "devel"
+
+COMPATIBLE_HOST = "powerpc64"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/perfmon2/${BPN}/libpfm-${PV}.tar.gz \
+           file://0001-Include-poll.h-instead-of-sys-poll.h.patch \
+          "
+SRC_URI[md5sum] = "d8f66cb9bfa7e1434434e0de6409db5b"
+SRC_URI[sha256sum] = "c61c575378b5c17ccfc5806761e4038828610de76e2e34fac9f7fa73ba844b49"
+
+UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/perfmon2/files/libpfm4/"
+
+EXTRA_OEMAKE = "DESTDIR=\"${D}\" PREFIX=\"${prefix}\" LIBDIR=\"${libdir}\" LDCONFIG=\"true\""
+EXTRA_OEMAKE_append_powerpc = " ARCH=\"powerpc\""
+EXTRA_OEMAKE_append_powerpc64 = " ARCH=\"powerpc\" BITMODE=\"64\""
+
+S = "${WORKDIR}/libpfm-${PV}"
+
+do_install () {
+	oe_runmake install
+}
-- 
2.24.1


