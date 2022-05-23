Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42F79C433F5
	for <webhook@archiver.kernel.org>; Mon, 23 May 2022 17:44:56 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web12.30924.1653327887072060309
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 May 2022 10:44:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jkan0cgN;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: uvv.mail@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id
 i20-20020a05600c355400b0039456976dcaso106631wmq.1
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 May 2022 10:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=24OlbqBvvqMj4mTq5riiPmk68oVLpybiNvMOFiblYJk=;
        b=jkan0cgNL5kycsqZJrBjk+QJHazUrg6nIDkmz0xzKXjefeLnAvWW3Xgqpkdwjpy6P4
         O5goxHlkbe5ZtC5MY6SyfPnD5V8WhXvyULoq2SQTUgOvQTaWcMro2qYT8obdsFxwmTUV
         JUAXGgVg6JBIbkRbdYCUv8A7rdwNNYyUrCPqrB3oJ+W66s1SiIOIEmFcBUySmrtGO7iX
         gstFHtHyI41cjyi9hLfkAcatmMBW0qPylBcPjb4mqq7+2lGrMkRAoyFICi1fFflfJZgT
         c39h6IwvVcZt/TGkSytxxq6etZuaW3NLWWzeOYBuk7dwCVm/xNMCiYFBoSfN8N0vmoel
         CD+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=24OlbqBvvqMj4mTq5riiPmk68oVLpybiNvMOFiblYJk=;
        b=xhtU+j3v/mk9qwiacyY/im1W7+bV7EAPIJ5odqm/qbH3wOFS04MDYeC1IBfcocbq10
         v6pAnCU9sK5vVHhwUO7CUsr7l20L1mDmEoGjnW0E2DCUUD5fcm3cK7GSMxDGQvxA4/JZ
         Lb7NR4AAQdwye3ts35wRz9K7pS4IprOXqYYcIXiIPWJf/dfeyPOuSEd2Qz3T2Hptzkx6
         8UAHBK2CiD6hmEgUMBul+jsq1q13DjDGU2XJjqXJ6Tv4H5YJ2CiXnUgKQkh/u7sbmFqs
         LCvmnekoI+Uvxz/6J1n8IGA7FSE7O5q7jRvasqEym7JeueWYnh6rDyxLbQJpsmsbtfSZ
         sAcw==
X-Gm-Message-State: AOAM533dn78tsq2ebB/awFEZV1XTvpHSq7hkEVs6cCKRnGV0O2Q7yftB
	0tz1ZdTcIHlChRszkE7cGpbz+06/x7zBcA==
X-Google-Smtp-Source: 
 ABdhPJzSCtrGFl6rFDW5TVVkVicTwrQYslRvVdTdzz8i5ww7dCbpGgiA+aCK4b6KgFji54/1PVGLyw==
X-Received: by 2002:a05:600c:3515:b0:394:8c7e:fbde with SMTP id
 h21-20020a05600c351500b003948c7efbdemr112159wmq.165.1653327885248;
        Mon, 23 May 2022 10:44:45 -0700 (PDT)
Received: from uvv-2004-vm.localdomain
 (dslb-178-000-219-184.178.000.pools.vodafone-ip.de. [178.0.219.184])
        by smtp.gmail.com with ESMTPSA id
 y16-20020a05600c17d000b003942a244ebfsm9142342wmo.4.2022.05.23.10.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 May 2022 10:44:44 -0700 (PDT)
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
Subject: [meta-filesystems][PATCH v3] overlayfs-progs: add new recipe
Date: Mon, 23 May 2022 19:44:30 +0200
Message-Id: <20220523174430.2485833-1-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 May 2022 17:44:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97236

From: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>

overlayfs-progs contains fsck.overlay, which is used to check and optionally
repair underlying directories of overlay-filesystem.

Signed-off-by: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
---
 ...-Makefile-proper-location-of-LDFLAGS.patch | 30 +++++++++++++++++
 .../overlayfs/overlayfs-progs_git.bb          | 32 +++++++++++++++++++
 2 files changed, 62 insertions(+)
 create mode 100644 meta-filesystems/recipes-utils/overlayfs/overlayfs-progs/0001-Makefile-proper-location-of-LDFLAGS.patch
 create mode 100644 meta-filesystems/recipes-utils/overlayfs/overlayfs-progs_git.bb

diff --git a/meta-filesystems/recipes-utils/overlayfs/overlayfs-progs/0001-Makefile-proper-location-of-LDFLAGS.patch b/meta-filesystems/recipes-utils/overlayfs/overlayfs-progs/0001-Makefile-proper-location-of-LDFLAGS.patch
new file mode 100644
index 000000000..d9f285d94
--- /dev/null
+++ b/meta-filesystems/recipes-utils/overlayfs/overlayfs-progs/0001-Makefile-proper-location-of-LDFLAGS.patch
@@ -0,0 +1,30 @@
+From 8eeaee82dcfdf47f16ad880e416b722827f41bdb Mon Sep 17 00:00:00 2001
+From: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
+Date: Mon, 23 May 2022 19:37:32 +0200
+Subject: [PATCH] Makefile: proper location of LDFLAGS
+
+Signed-off-by: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
+---
+ Makefile | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index e3c5207..14b155e 100644
+--- a/Makefile
++++ b/Makefile
+@@ -1,5 +1,5 @@
+ CFLAGS = -Wall -g
+-LFLAGS = -lm
++LDFLAGS = -lm
+ CC = gcc
+ 
+ all: overlay
+@@ -7,7 +7,7 @@ all: overlay
+ objects = fsck.o common.o lib.o check.o mount.o path.o overlayfs.o
+ 
+ overlay: $(objects)
+-	$(CC) $(LFLAGS) $(objects) -o fsck.overlay
++	$(CC) $(objects) -o fsck.overlay $(LDFLAGS) 
+ 
+ .c.o:
+ 	$(CC) $(CFLAGS) -c $<
diff --git a/meta-filesystems/recipes-utils/overlayfs/overlayfs-progs_git.bb b/meta-filesystems/recipes-utils/overlayfs/overlayfs-progs_git.bb
new file mode 100644
index 000000000..9d58b9a63
--- /dev/null
+++ b/meta-filesystems/recipes-utils/overlayfs/overlayfs-progs_git.bb
@@ -0,0 +1,32 @@
+SUMMARY = "File system check utility for OverlayFS"
+HOMEPAGE = "https://github.com/hisilicon/overlayfs-progs"
+LICENSE = "PD"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/PD;md5=b3597d12946881e13cb3b548d1173851"
+
+SRC_URI = "\
+    git://github.com/hisilicon/overlayfs-progs.git;protocol=https;branch=master \
+    file://0001-Makefile-proper-location-of-LDFLAGS.patch \
+"
+
+PV = "1.0+git${SRCPV}"
+SRCREV = "e10ef686570d9c7eff42f52461593a5c15da56bd"
+
+S = "${WORKDIR}/git"
+B = "${S}"
+
+# Required to have the fts.h header for musl
+DEPENDS:append:libc-musl = " fts"
+# Fix the missing fts libs when using musl
+EXTRA_OEMAKE:append:libc-musl = " LDFLAGS='-lfts'"
+
+EXTRA_OEMAKE += "'CC=${CC} -O2' "
+TARGET_CC_ARCH += "${LDFLAGS}"
+
+do_compile () {
+    oe_runmake
+}
+
+do_install () {
+    install -d ${D}${bindir}
+    install -m 0755 ${B}/fsck.overlay ${D}${bindir}
+}
-- 
2.25.1


