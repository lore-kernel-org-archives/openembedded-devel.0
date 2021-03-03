Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web09.7933.1614784115294858125
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Mar 2021 07:08:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PLSA18Nu;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id 201so16486782pfw.5
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 Mar 2021 07:08:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OEDvyJ1YXbBlXN+urXpuugFFPLp0BsST4ddsxfKdCz8=;
        b=PLSA18Nu/g6Xb/cr09k9bOxxSbx88O1XpoudWqqorDgMZ5MNYRwoz2O4byqf+XjEqk
         cW0cNvCgf9A3SgBldILpEoU9015vw7ZbRXpVv11tIqBR8NmltyL5qYyd2FPFGcLapFD8
         fqJqm0mPahQL26N86sOQ+/fUjvlXFLlOrHD+zDYmlxaipnq3qZphUiXl9igTgmxBwz7k
         4GbONkEhyY1jVM/uFPThSUQziqCXG65SMHBtBqrqgyQDUNmC/2zg+ET8aixRycQanbIg
         eMx2tXHhVL317f8duqGWmqzc8wbfZf1DOS41hi24LeOekP8eMcYE55Y/31eBTI/HoXXF
         pcug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OEDvyJ1YXbBlXN+urXpuugFFPLp0BsST4ddsxfKdCz8=;
        b=W6SSm7+Xu3BfUvynSjBKWGE+XUaqcbimKe6hJzyv22F9Vk7zn+LgEWZJ2PmPFQaOnm
         5VSiXGMMWrIkNvVrdhxK0/Bk0b6HTDm7K8dbya5Q1TFgC3Lm/tI8o/TSfbkCO/P+Merq
         KgpsIh7ZrLQSgtzfBl9DOxrY7OMdeEKvFDpv8sPj67Wj6NuYzcqcKwIv6yKKCvQCtZaw
         ylnIO8f/GFuTZpJejvKk1+Odt7wXeKZGu0nvIqtXxEW7UFCnR95qk2LImLWiGpxuaKYf
         N/I9yCMQqDxMV4kJLYon1p6vjBrWWR210aoL3+Xf8n3yERqz4i1S2S2yT6F0v3DYl6V/
         EgQQ==
X-Gm-Message-State: AOAM532vRCyY10E7ME/M/bGJUGehPOcSxWs1KElVv1HMcq6RsW1AyFCD
	wAwgFL0mjDjEuM0GbaFFTQaEMGVTrRfIMQ==
X-Google-Smtp-Source: ABdhPJxB8w9whA2RJKmI8yAGJyF1NhE4vryj+pDc2b2PGs0EU1Rz4S9sl9Dnx88G+F6sWQvLBE+w3g==
X-Received: by 2002:a63:fa50:: with SMTP id g16mr24229224pgk.86.1614784114349;
        Wed, 03 Mar 2021 07:08:34 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::b3bf])
        by smtp.gmail.com with ESMTPSA id k16sm17806347pfp.161.2021.03.03.07.08.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Mar 2021 07:08:33 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Jose Quaresma <quaresma.jose@gmail.com>,
	=?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
Subject: [meta-multimedia][PATCH v2 1/2] mpich: Upgrade to 3.4.1
Date: Wed,  3 Mar 2021 07:08:29 -0800
Message-Id: <20210303150830.2471319-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add fixes to work with/with-out X

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Cc: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-oe/recipes-devtools/mpich/mpich_3.2.bb   | 47 ----------------
 meta-oe/recipes-devtools/mpich/mpich_3.4.1.bb | 54 +++++++++++++++++++
 2 files changed, 54 insertions(+), 47 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/mpich/mpich_3.2.bb
 create mode 100644 meta-oe/recipes-devtools/mpich/mpich_3.4.1.bb

diff --git a/meta-oe/recipes-devtools/mpich/mpich_3.2.bb b/meta-oe/recipes-devtools/mpich/mpich_3.2.bb
deleted file mode 100644
index 51b313cef4..0000000000
--- a/meta-oe/recipes-devtools/mpich/mpich_3.2.bb
+++ /dev/null
@@ -1,47 +0,0 @@
-SUMMARY = "Message Passing Interface (MPI) implementation"
-HOMEPAGE = "http://www.mpich.org/"
-SECTION = "devel"
-
-LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=2106f0435056f3dd9349747a766e5816"
-
-SRC_URI = " \
-    http://www.mpich.org/static/downloads/${PV}/mpich-${PV}.tar.gz \
-"
-
-SRC_URI[md5sum] = "f414cfa77099cd1fa1a5ae4e22db508a"
-SRC_URI[sha256sum] = "0778679a6b693d7b7caff37ff9d2856dc2bfc51318bf8373859bfa74253da3dc"
-
-RDEPENDS_${PN} += "bash perl libxml2"
-S = "${WORKDIR}/${BP}"
-
-EXTRA_OECONF = "--enable-debuginfo \
-    --enable-fast \
-    --enable-shared  \
-    --with-pm=gforker  \
-    --disable-rpath \
-    --disable-f77 \
-    --disable-fc \
-    --disable-fortran \
-    --disable-cxx \
-    BASH_SHELL='${USRBINPATH}/env bash' \
-    PERL='${USRBINPATH}/env perl' \
-"
-
-inherit autotools-brokensep gettext
-
-do_configure_prepend() {
-    for d in confdb test/mpi/confdb src/openpa/confdb src/pm/hydra/confdb src/pm/hydra/tools/topo/hwloc/hwloc/config src/pm/hydra/mpl/confdb src/mpl/confdb src/mpi/romio/confdb;  do
-        install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.guess ${S}/$d
-        install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.sub ${S}/$d
-    done
-
-    autoreconf --verbose --install --force -I . -I confdb/ -I maint/
-    oe_runconf
-    exit
-}
-
-do_install_append() {
-    sed -i 's,${S}/,,g' ${D}/${libdir}/libmpi.la
-    sed -i 's,${DEBUG_PREFIX_MAP},,g' ${D}/${libdir}/pkgconfig/mpich.pc
-}
diff --git a/meta-oe/recipes-devtools/mpich/mpich_3.4.1.bb b/meta-oe/recipes-devtools/mpich/mpich_3.4.1.bb
new file mode 100644
index 0000000000..77e080c8b8
--- /dev/null
+++ b/meta-oe/recipes-devtools/mpich/mpich_3.4.1.bb
@@ -0,0 +1,54 @@
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
+    BASH_SHELL='${USRBINPATH}/env bash' \
+    PERL='${USRBINPATH}/env perl' \
+    --with-device=ch3:nemesis \
+    --with-rdmacm=no \
+    --disable-numa \
+"
+
+PACKAGECONFIG += " \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
+"
+PACKAGECONFIG[x11] = "--with-x --x-includes=${STAGING_INCDIR} --x-libraries=${STAGING_LIBDIR},--without-x,virtual/libx11"
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
+#    cd ${S}
+#    autoupdate
+#    autoreconf --verbose --install --force
+#    cd ${B}
+    oe_runconf
+}
+
+do_install_append() {
+    sed -i 's,${S}/,,g' ${D}/${libdir}/libmpi.la
+    sed -i 's,${DEBUG_PREFIX_MAP},,g' ${D}/${libdir}/pkgconfig/mpich.pc
+}
-- 
2.30.1

