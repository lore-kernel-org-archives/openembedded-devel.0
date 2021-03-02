Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web11.1587.1614715774307780793
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Mar 2021 12:09:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iq2sBssu;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id u12so2773887pjr.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 02 Mar 2021 12:09:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=W1eaaTaiGjaOf5LfN+mYaGNiabGmC/MR+mNXGpKPW14=;
        b=iq2sBssuUVchpAAqesLK0LUVR1nswXekS5PKjp4iJnDJMy9ThIa2sbUs7GDsqFKPCv
         8HuFYma0URoXroVnapbRahZpnvpl8jBCKjqNFan/bF77I7NL9Qq+zTU/85b1dZ/LfvZ7
         +0C1ni8zV6S/nSUqE9aOzblVUBHDec0Exsq2FYBWhbQdepnz7+U85fIZi+xcNZO0yHny
         1qJKcZNpKDGwDYt2UJIT1ZdO00uFzQ9R1xmbCXd9xmGC5FACNMLOjgv3LoZqhWaQ6hI7
         7pu3pEDfYtPOQnffDbg/OTDLWzjimX7+9zvyg7EjZuZFA0tVnouLwjevksTkJM2fuiSK
         G8Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=W1eaaTaiGjaOf5LfN+mYaGNiabGmC/MR+mNXGpKPW14=;
        b=UVsf64ztegvO691yBTksySVuvSTTkNo+WcC3sVh0NYFdiXCKwC463dVoOfgwV1cHl4
         Uespp5157p5nC6iYdiET/TX6KWDRytwTlx/95kn8idsoX1KX3E6p2g9XP9kYUS1c8AaI
         sCOI/Sl2YL9eCuV1V3+yI1IyKhW7wQ0H15fFxd+vXoEI9/Y9d5BYN6Ud5t1AuKRHytrH
         X0sM1oMUiHmkJs3mn5XHE2KLXsXVDZ9VqOoEkOC7EvQEfLdstTbH6fGqGr+UsI63+UUq
         XQs6AxfwnyI8jwBi9wRsizTW5Sjs/Ra083CEB7P2ZB7aen2TUn++HrEqEGGvvnml7kV+
         WOWw==
X-Gm-Message-State: AOAM532sPy4BJJH7wgzI1EuuNRPRW1Befu5OogUrrImYU77Cb3TPewpq
	CGckKDXL8tdWGDmS48pkjibAeTz4+JIKtQ==
X-Google-Smtp-Source: ABdhPJwvSi+TplRpdklVw48G5w+rdse0/fA2LoQ8fiGp3KPj1UBUE8rRZedu7Vmd65J73HyelooPkQ==
X-Received: by 2002:a17:902:a518:b029:e4:777d:33dd with SMTP id s24-20020a170902a518b02900e4777d33ddmr20708586plq.16.1614715773356;
        Tue, 02 Mar 2021 12:09:33 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::b3bf])
        by smtp.gmail.com with ESMTPSA id f19sm21830455pgl.49.2021.03.02.12.09.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Mar 2021 12:09:32 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Jose Quaresma <quaresma.jose@gmail.com>,
	=?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
Subject: [meta-multimedia][PATCH] srt: Backport fix for missing <limits> header
Date: Tue,  2 Mar 2021 12:09:30 -0800
Message-Id: <20210302200930.544487-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Cc: Andreas Müller <schnitzeltony@gmail.com>
---
 ...001-core-Fix-build-with-GCC-11.-1806.patch | 26 +++++++++++
 .../recipes-support/srt/srt_1.4.2.bb          |  1 +
 meta-oe/recipes-devtools/mpich/mpich_3.4.1.bb | 46 +++++++++++++++++++
 3 files changed, 73 insertions(+)
 create mode 100644 meta-multimedia/recipes-support/srt/srt/0001-core-Fix-build-with-GCC-11.-1806.patch
 create mode 100644 meta-oe/recipes-devtools/mpich/mpich_3.4.1.bb

diff --git a/meta-multimedia/recipes-support/srt/srt/0001-core-Fix-build-with-GCC-11.-1806.patch b/meta-multimedia/recipes-support/srt/srt/0001-core-Fix-build-with-GCC-11.-1806.patch
new file mode 100644
index 0000000000..0cb6943ccb
--- /dev/null
+++ b/meta-multimedia/recipes-support/srt/srt/0001-core-Fix-build-with-GCC-11.-1806.patch
@@ -0,0 +1,26 @@
+From f1b35cbf5b9b42b031e9b119e4c802b5f744468c Mon Sep 17 00:00:00 2001
+From: Christophe Giboudeaux <krop@users.noreply.github.com>
+Date: Wed, 10 Feb 2021 12:42:45 +0000
+Subject: [PATCH] [core] Fix build with GCC 11. (#1806)
+
+The 'limits' header must be included explicitly.
+---
+Upstream-Status: Backport [https://github.com/haivision/srt/commit/f1b35cbf5b9b42b031e9b119e4c802b5f744468c]
+ srtcore/sync.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/srtcore/sync.h b/srtcore/sync.h
+index 59c125a7..9f01ca91 100644
+--- a/srtcore/sync.h
++++ b/srtcore/sync.h
+@@ -15,6 +15,7 @@
+ //#define ENABLE_CXX17
+ 
+ #include <cstdlib>
++#include <limits>
+ #ifdef ENABLE_STDCXX_SYNC
+ #include <chrono>
+ #include <thread>
+-- 
+2.30.1
+
diff --git a/meta-multimedia/recipes-support/srt/srt_1.4.2.bb b/meta-multimedia/recipes-support/srt/srt_1.4.2.bb
index 567ea68edf..f7dfda28f1 100644
--- a/meta-multimedia/recipes-support/srt/srt_1.4.2.bb
+++ b/meta-multimedia/recipes-support/srt/srt_1.4.2.bb
@@ -9,6 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=815ca599c9df247a0c7f619bab123dad"
 SRCREV = "50b7af06f3a0a456c172b4cb3aceafa8a5cc0036"
 SRC_URI = "git://github.com/Haivision/srt;protocol=https \
            file://0001-don-t-install-srt-ffplay.patch \
+           file://0001-core-Fix-build-with-GCC-11.-1806.patch \
            "
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 S = "${WORKDIR}/git"
diff --git a/meta-oe/recipes-devtools/mpich/mpich_3.4.1.bb b/meta-oe/recipes-devtools/mpich/mpich_3.4.1.bb
new file mode 100644
index 0000000000..e5f36a5140
--- /dev/null
+++ b/meta-oe/recipes-devtools/mpich/mpich_3.4.1.bb
@@ -0,0 +1,46 @@
+SUMMARY = "Message Passing Interface (MPI) implementation"
+HOMEPAGE = "http://www.mpich.org/"
+SECTION = "devel"
+
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=bd4d7ab13df98988b1ca2a4e01c8c163"
+
+SRC_URI = "http://www.mpich.org/static/downloads/${PV}/mpich-${PV}.tar.gz"
+SRC_URI[sha256sum] = "8836939804ef6d492bcee7d54abafd6477d2beca247157d92688654d13779727"
+
+RDEPENDS_${PN} += "bash perl libxml2"
+
+EXTRA_OECONF = "--enable-debuginfo \
+    --enable-fast \
+    --enable-shared  \
+    --with-pm=gforker  \
+    --disable-rpath \
+    --disable-f77 \
+    --disable-fc \
+    --disable-fortran \
+    --disable-cxx \
+    --with-device=ch4:ucx \
+    --disable-numa \
+"
+
+inherit autotools gettext pkgconfig
+
+do_configure() {
+    for d in confdb test/mpi test/mpi/confdb src/pm/hydra/confdb \
+        src/pm/hydra/tools/topo/hwloc/hwloc/config src/pm/hydra/mpl/confdb \
+        modules/yaksa/m4 modules/json-c modules/ucx test/mpi/dtpools/confdb \
+        src/mpl/confdb src/mpi/romio/confdb;  do
+        install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.guess ${S}/$d
+        install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.sub ${S}/$d
+    done
+    cd ${S}
+    autoupdate
+    autoreconf --verbose --install --force
+    cd ${B}
+    oe_runconf
+}
+
+do_install_append() {
+    sed -i 's,${S}/,,g' ${D}/${libdir}/libmpi.la
+    sed -i 's,${DEBUG_PREFIX_MAP},,g' ${D}/${libdir}/pkgconfig/mpich.pc
+}
-- 
2.30.1

