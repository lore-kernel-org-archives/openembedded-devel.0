Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F264BC77B7C
	for <webhook@archiver.kernel.org>; Sat, 27 May 2023 01:36:37 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.3269.1685151395713669517
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 May 2023 18:36:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=GSwboHEQ;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1b025d26f4fso2359415ad.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 26 May 2023 18:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685151395; x=1687743395;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZoB79rr4HJZEBlbeJZdoK7d6jBEgGl3L8JR/QyKo9iM=;
        b=GSwboHEQ/z/DhImhl1vFA2xZYGXVtRLZIii4g0mN3F3i9ih9aRDEmCtC3yB9B3K5IA
         SGHiaH+NGUIP6HFU4gyBIbvlMZ9NzDxkpc3vi4hmwxSgYVuREVrpe386gk/uvawWaxIt
         jMVKZZ94bskp+Bqy1ESKz0qeJJajKgfqkDBtI0eJJ8srMSCIpYFUh8sz3iHAW3UrmV81
         bSG25fO9l4VwD5hzivqKzrwoSjnURNceSePFGSnKnuYSWYGlg4/Rx66fQ4F3IrA79BM3
         ATEcQvetQY07MjZZTKyFCpcNjLNPGRi+8HSWGrZWQPZKHpekzvPPV35xHxhGV7OFwC9Z
         o2WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685151395; x=1687743395;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZoB79rr4HJZEBlbeJZdoK7d6jBEgGl3L8JR/QyKo9iM=;
        b=EOZu9YD+CGOi+mi8zJ6arzuwh2It/QykimsbWRGWlAbZtvaWdB23LB1Uj/p1PdDKKR
         lqHwt4SBRFdMd2n2M9jlRCo9hJ6YGFnHJ6VA/MND2Yj7cXF12lWsL5jAAkSuM4R7Km13
         TSEUZb5/jdEEtXbgedGvNgqShJbFBJXhFqoCBvG9RKjwkq0ybl2HJUELl6XsR6ROjA3w
         dvES+OdHemC+SOMhyX43uOW5eFIkmjvNeMyEfijQnMVL27hZ9atMVwdfBtKdaRIxUlig
         39Ps5jJK8PbrLAj/bhbma6wjXhrPH8T2Farm38yDkb84MWhGCyS9ZaP5jZHsU+3NlXmO
         XyVQ==
X-Gm-Message-State: AC+VfDwv+udVt/O5m06569Gl3Nv2C0kpf4+sSlcBVHNZZXJkyM92kuGJ
	JckwFlxN9b56bKR++xY71mgGyghiHGk=
X-Google-Smtp-Source: ACHHUZ7Kqvrp3WxhFrfIg4PEIEtJSDYUhVsrcJfBmzCzGxFMf08F5OyA/3iLTsbFKCw3GBtBrFv6QA==
X-Received: by 2002:a17:902:7147:b0:1ac:4735:45d7 with SMTP id u7-20020a170902714700b001ac473545d7mr3059090plm.6.1685151394673;
        Fri, 26 May 2023 18:36:34 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::c4c0])
        by smtp.gmail.com with ESMTPSA id n24-20020a170902969800b001aafe4f9b8esm3802191plp.180.2023.05.26.18.36.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 May 2023 18:36:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 1/5] ipvsadm: Pass build environment cflags to compiler
Date: Fri, 26 May 2023 18:36:28 -0700
Message-Id: <20230527013632.96030-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 27 May 2023 01:36:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102874

This helps in avoiding absolute build time paths in binaries debug info

Fixes
WARNING: ipvsadm-1.31-r0 do_package_qa: QA Issue: File /usr/sbin/.debug/ipvsadm in package ipvsadm-dbg contains reference to TMPDIR [buildpaths]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../ipvsadm/0001-Add-CCFLAGS-to-cflags.patch  | 36 +++++++++++++++++++
 ...-libipvs-Include-missing-sys-types.h.patch | 28 +++++++++++++++
 .../recipes-support/ipvsadm/ipvsadm_1.31.bb   |  8 +++--
 3 files changed, 69 insertions(+), 3 deletions(-)
 create mode 100644 meta-networking/recipes-support/ipvsadm/ipvsadm/0001-Add-CCFLAGS-to-cflags.patch
 create mode 100644 meta-networking/recipes-support/ipvsadm/ipvsadm/0001-libipvs-Include-missing-sys-types.h.patch

diff --git a/meta-networking/recipes-support/ipvsadm/ipvsadm/0001-Add-CCFLAGS-to-cflags.patch b/meta-networking/recipes-support/ipvsadm/ipvsadm/0001-Add-CCFLAGS-to-cflags.patch
new file mode 100644
index 0000000000..a2923088e8
--- /dev/null
+++ b/meta-networking/recipes-support/ipvsadm/ipvsadm/0001-Add-CCFLAGS-to-cflags.patch
@@ -0,0 +1,36 @@
+From 1bc180ec333d90e1a11deff46b5639ab5d40408d Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 26 May 2023 09:29:23 -0700
+Subject: [PATCH] Add CCFLAGS to cflags
+
+This is to append the flags from build environment.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Makefile         | 1 +
+ libipvs/Makefile | 3 +++
+ 2 files changed, 4 insertions(+)
+
+--- a/Makefile
++++ b/Makefile
+@@ -50,6 +50,7 @@ else
+     CFLAGS = -Wall -Wunused -Wstrict-prototypes -g
+ endif
+ 
++CFLAGS += $(CCFLAGS)
+ 
+ #####################################
+ # No servicable parts below this line
+--- a/libipvs/Makefile
++++ b/libipvs/Makefile
+@@ -1,6 +1,9 @@
+ # Makefile for libipvs
+ 
+ CFLAGS		= -Wall -Wunused -Wstrict-prototypes -g -fPIC
++
++CFLAGS += $(CCFLAGS)
++
+ ifneq (0,$(HAVE_NL))
+ CFLAGS		+= -DLIBIPVS_USE_NL
+ CFLAGS		+= $(shell \
diff --git a/meta-networking/recipes-support/ipvsadm/ipvsadm/0001-libipvs-Include-missing-sys-types.h.patch b/meta-networking/recipes-support/ipvsadm/ipvsadm/0001-libipvs-Include-missing-sys-types.h.patch
new file mode 100644
index 0000000000..8b08482be7
--- /dev/null
+++ b/meta-networking/recipes-support/ipvsadm/ipvsadm/0001-libipvs-Include-missing-sys-types.h.patch
@@ -0,0 +1,28 @@
+From 4fc59f5733d187941e9a7ce5e9ea33714d85285c Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 26 May 2023 09:30:59 -0700
+Subject: [PATCH] libipvs: Include missing sys/types.h
+
+Its needed for u_intXX_t types
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ libipvs/ip_vs.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/libipvs/ip_vs.h b/libipvs/ip_vs.h
+index 2670c23..625b6cd 100644
+--- a/libipvs/ip_vs.h
++++ b/libipvs/ip_vs.h
+@@ -8,6 +8,7 @@
+ 
+ #include <netinet/in.h>
+ #include <sys/socket.h>
++#include <sys/types.h>
+ #include <arpa/inet.h>
+ #include <linux/types.h>	/* For __beXX types in userland */
+ 
+-- 
+2.40.1
+
diff --git a/meta-networking/recipes-support/ipvsadm/ipvsadm_1.31.bb b/meta-networking/recipes-support/ipvsadm/ipvsadm_1.31.bb
index 01bde4a68d..442e231ad4 100644
--- a/meta-networking/recipes-support/ipvsadm/ipvsadm_1.31.bb
+++ b/meta-networking/recipes-support/ipvsadm/ipvsadm_1.31.bb
@@ -20,6 +20,8 @@ SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/utils/kernel/ipvsadm/${BP}.
         file://0001-Modify-the-Makefile-for-cross-compile.patch \
         file://0003-ipvsadm-remove-dependency-on-bash.patch \
         file://makefile-add-ldflags.patch \
+        file://0001-Add-CCFLAGS-to-cflags.patch \
+        file://0001-libipvs-Include-missing-sys-types.h.patch \
 "
 
 SRC_URI[md5sum] = "f6d1707c5baf684b58fd33682d67871f"
@@ -27,10 +29,10 @@ SRC_URI[sha256sum] = "1a0a5e25b5a1226435d2fb76341656f83a710183aebb0d204db39c0ec3
 
 UPSTREAM_CHECK_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/ipvsadm"
 
+EXTRA_OEMAKE += "CCFLAGS='${CFLAGS}'"
+
 do_compile() {
-    oe_runmake \
-    CC="${CC} -I${STAGING_INCDIR} -I${STAGING_INCDIR}/libnl3 -L${STAGING_LIBDIR}" \
-    all
+    oe_runmake all
 }
 
 do_install() {
-- 
2.40.1


