Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B76D9CA5FBE
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 22:58:04 +0000 (UTC)
Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1496.1790722684183608116
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Sep 2026 15:58:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=MWXQzo0j;
 spf=pass (domain: gmail.com, ip: 74.125.229.41, mailfrom: raj.khem@gmail.com)
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-34bffc8105eso725261eec.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 29 Sep 2026 15:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790722683; x=1791327483; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VZxp3G8M0u19hKnDte3z2t0wRpVMeInDnih0L+jSBEI=;
        b=MWXQzo0jLN0xzX6dy+WkDmCf09qwWTi/0l48PY46T8e8IO+I+qBFeiqr8iRdtYh6ot
         7FS7cjixw1bGaOcUnsb7AafSZFZ75VqY9Uehm/OKyAceocAKJ3jFSIcZNVEep87lCSwR
         krKoqx1isQMKEkgYyaGvuYo3JrYC4WULDTaEnPEvJfqi69WTpw87wu2VsL9kLkgimpgS
         0NCilGEQ9S/Ki4I4iM7EWQ26hT+9OnMY65j6gQ+VgwGZlpHi8DYt0tdsOeou0nZoq94I
         0zL5up2tDdfOs3/xoePnKNyHPsEuTI/3QXRSD+Q/Bvpppnu8rJ6gUA5H26rXe5DbnBzt
         2Vxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790722683; x=1791327483;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VZxp3G8M0u19hKnDte3z2t0wRpVMeInDnih0L+jSBEI=;
        b=AXm8+34i54CHYHuRImfeNNbKekYi0SxDrja+bRV0mfHhIYUlJ45PjBnvZ3k4zSL31u
         Tv22Nlu7ij/umXJmrCuYRuP8L36tJPr7RLhIyGQ/WkZmjeBAvWROcPaJac1QWN8HFbT9
         q3dnqHW0VgVCRGmKW3PsHI0BPx8ZDXrPDroz+0Scd46jH6304j2xLmI6PuxFei/u/dYh
         ueaHApVdjE0Z0BBeHYfXC04i+fvi8tMLMTfunhvJye7Qcch2hZq5Uc7Ns6Kp6Un6pOVb
         nPOYt5luxxfSGa6ix1s4ySeQ9yS7KAft+0pdvy91eZ8of4L7/J4YRDc6f85i2fHbJ6kB
         3DWA==
X-Gm-Message-State: AFq9FYI7B1JBL+7da004+z0YF8nV+NCHsRT9L19PY7alankZ5BnowyBW
	K26Ldjfg+fPGvQGXMir5HvycwJT5ICgBaf6we7MgUE3HApeOkCYLmr7zsBpic20Hs58=
X-Gm-Gg: AYBFou2eTrvnMO+KiQLBirwUo10s3Y5Z+lzTKS3iWYFl+ny4k8lXX5bfKofoufByZHB
	QZnpPiU58QMaXTb1ATPMYM3RC7PMWAV0yRUNnWETszzqlmOQPaXJtTaQ4QKZZqkvk4mVc4dZZIL
	HDgiNtV86jCYlxGsQnLe3A/c5ej9MyV/2FX4Fu/zROpd2Z5VG60o/u+HfequhIvokYF3+6uhJM6
	w9R8fiYs6se2NWzXpx5noGdNrmDrApCPnLqkJOrqmPWNHHDnOkBW7iLeVRbrH4qU1+o0bOgja/y
	bcCSzQzryNSgVG8sw/UH96Je7Jh89zIUaHBzJYYc7N6W4HM1wX6lb2NPSJgZWekHWnC6c1qNu7x
	J6j1HOR2b+GmLLfJug71QQAD9YpAgp5/SiJLIKtpMwwyQmLb+pAKVWl04SmenwQKXi5npkl0rZF
	pIffbrzuGIZmpND9W3xCVuHrTq3JEf/Tww3HRtV1Go9TkBmLS5wmDMSxfGdcuAvQJmb8ydQ50sH
	3xKToMM8ifwrc9/0Z31CyHLJdY2igXN7WYTro9QEg2GR/LjatIWLGBU31lq6RC1nO0qRVZLi4U/
	zPbtWPCq9slregbNfY3UDJjcVoIjGGZQ6gfVCWYBfeRCXbJQsx8st/WMMWGTqyaeRsOq1/QdBoG
	335/MWNAUwOOlzVXsD7gpIeyKSvyBbpUGz/G04g6nlMMrrWdfWW6FNZ9llCpqT22k/l4RUh/rL9
	mTBfcik8O3+q+4ZsVRbweCjRvdG8HiH6EuJ+HzJA==
X-Received: by 2002:a05:7301:1401:b0:339:7675:18e with SMTP id 5a478bee46e88-34c63bfd10bmr862338eec.9.1790722683463;
        Tue, 29 Sep 2026 15:58:03 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34c38bf0948sm1595527eec.25.2026.09.29.15.58.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 15:58:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 25/26] sockperf: fix musl build (libexecinfo dependency, missing includes)
Date: Tue, 29 Sep 2026 15:57:22 -0700
Message-ID: <20260929225723.1046705-25-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929225723.1046705-1-khem.raj@oss.qualcomm.com>
References: <20260929225723.1046705-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Sep 2026 22:58:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130512

configure.ac's AC_SEARCH_LIBS([backtrace], [execinfo], ...) fails
with 'libexecinfo not found' on musl, which lacks glibc's
backtrace()/backtrace_symbols(); depend on the libexecinfo compat
library there.
Once configure succeeds, ticks.h's timeval2nsec() needs struct
timeval, which was only pulled in via <sys/time.h> under __FreeBSD__,
and vma-xlio-redirect.cpp calls sscanf()/sprintf() without including
<cstdio>; fix both for musl too.

AI-Generated: Uses Claude Code

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...-includes-for-musl-struct-timeval-ss.patch | 54 +++++++++++++++++++
 .../sockperf/sockperf_git.bb                  | 11 +++-
 2 files changed, 63 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-benchmark/sockperf/files/0001-src-fix-missing-includes-for-musl-struct-timeval-ss.patch

diff --git a/meta-oe/recipes-benchmark/sockperf/files/0001-src-fix-missing-includes-for-musl-struct-timeval-ss.patch b/meta-oe/recipes-benchmark/sockperf/files/0001-src-fix-missing-includes-for-musl-struct-timeval-ss.patch
new file mode 100644
index 0000000000..3a59a8dbbe
--- /dev/null
+++ b/meta-oe/recipes-benchmark/sockperf/files/0001-src-fix-missing-includes-for-musl-struct-timeval-ss.patch
@@ -0,0 +1,54 @@
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Tue, 29 Sep 2026 02:40:00 +0000
+Subject: [PATCH] src: fix missing includes for musl (struct timeval,
+ sscanf/sprintf)
+
+ticks.h's timeval2nsec() uses struct timeval, but the header only
+pulled in <sys/time.h> under __FreeBSD__ -- glibc's <time.h> happens
+to declare struct timeval as a side effect of other headers already
+included elsewhere in the build, but musl's does not, so building
+against musl fails:
+
+| ticks.h:115:30: error: member access into incomplete type 'const struct timeval'
+
+Always include <sys/time.h> instead of gating it on __FreeBSD__.
+
+vma-xlio-redirect.cpp uses sscanf()/sprintf() but never includes
+<cstdio>, relying on it being pulled in transitively. That doesn't
+happen on musl either:
+
+| vma-xlio-redirect.cpp:92:14: error: use of undeclared identifier 'sscanf'
+| vma-xlio-redirect.cpp:99:5: error: use of undeclared identifier 'sprintf'
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+diff --git a/src/ticks.h b/src/ticks.h
+index 679f3d9..6e38095 100644
+--- a/src/ticks.h
++++ b/src/ticks.h
+@@ -99,9 +99,10 @@ with simple integral values. The following describes these calculations:
+ #include <stdint.h> // for int64_t
+ #include <stdlib.h> // for qsort
+
+-#ifdef __FreeBSD__
++/* struct timeval is used below (timeval2nsec()); <time.h> alone doesn't
++ * guarantee it, so always pull in <sys/time.h> rather than just on
++ * __FreeBSD__. */
+ #include <sys/time.h>
+-#endif
+
+ #include "ticks_os.h"
+
+diff --git a/src/vma-xlio-redirect.cpp b/src/vma-xlio-redirect.cpp
+index 5554d4a..a54a6c1 100644
+--- a/src/vma-xlio-redirect.cpp
++++ b/src/vma-xlio-redirect.cpp
+@@ -28,6 +28,7 @@
+  */
+
+ #include "vma-xlio-redirect.h"
++#include <cstdio> /* sscanf(), sprintf() */
+ #include <dlfcn.h>
+
+ socket_fptr_t fn_socket = NULL;
diff --git a/meta-oe/recipes-benchmark/sockperf/sockperf_git.bb b/meta-oe/recipes-benchmark/sockperf/sockperf_git.bb
index ab0e35667e..fe285465e6 100644
--- a/meta-oe/recipes-benchmark/sockperf/sockperf_git.bb
+++ b/meta-oe/recipes-benchmark/sockperf/sockperf_git.bb
@@ -5,9 +5,16 @@ SECTION = "console/network"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://copying;md5=b4563b57c98bc23c8cecbc0b6d9546e9"
 
-SRC_URI = "git://github.com/Mellanox/sockperf;branch=sockperf_v2;protocol=https"
+SRC_URI = "git://github.com/Mellanox/sockperf;branch=sockperf_v2;protocol=https \
+           file://0001-src-fix-missing-includes-for-musl-struct-timeval-ss.patch \
+           "
 SRCREV = "3c65ad99cd385e18f8a2a655c19826e81a4d17e8"
 
 UPSTREAM_CHECK_COMMITS = "1"
 
-inherit autotools
\ No newline at end of file
+# musl lacks glibc's backtrace()/backtrace_symbols(); configure.ac uses
+# AC_SEARCH_LIBS([backtrace], [execinfo], ...) which errors out with
+# "libexecinfo not found" unless the compat library is available.
+DEPENDS:append:libc-musl = " libexecinfo"
+
+inherit autotools

