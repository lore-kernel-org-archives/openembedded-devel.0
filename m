Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 516E9C4332F
	for <webhook@archiver.kernel.org>; Mon, 23 May 2022 17:43:36 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web12.30904.1653327810932917090
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 May 2022 10:43:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GZTd1zq+;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: uvv.mail@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id p10so3792939wrg.12
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 May 2022 10:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GK0SWtSCG0ORiw7jZ6QBODooVehvwSpeM9Nyn3fHM1M=;
        b=GZTd1zq+vv9NogT38j08gHS+BrJ0sh09GoGKe6SWdmwhSOQFxVQtViIw+uKR4EJVT+
         /PDzJKK2gTl29YgDHpuBxn3v1Yl9aK1TziftYy4WTdcXv9zJel1aNfMYZoH7Hzqx9gP6
         IyK47wLlOBcR68DyLMKs1AuQ322Dd7MeMamTeatvfCwVAuSpaXDbfBa0DDfYMsXIGZ7A
         IBV6wUPCLtHuzlxfrMg+5FYLCG6XWgyk7CheYkBf3gV6X+1CNDMpeARmQDMkO9ZacuOB
         qZkSLT5uAxBfdpeW9XzwrLT0rKdCy3wslgh8ccAw8MiREkzskD5QWGW+wzmKfDzCtNx0
         01rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GK0SWtSCG0ORiw7jZ6QBODooVehvwSpeM9Nyn3fHM1M=;
        b=f7y0qP3aeW7UEeLBHNKVEvPC1likm+qjnmF25LkW6L2b/VEL/PL9YXOfrZSJhem66T
         ylYHDOOs3lD8G4wpqRpBhWW7H1ZZdUKgDfxbrtqU3DIRdcCTXV4MlHvGhvtC/9B2wWan
         tb7k5INbzzCw5e2Gz7Mqd2WV9J24XdS4SUipVuDe2FNDc7qo1ZSJyUJs9CcctPwunJU7
         FJP6hYr86iaaQEb+wkWe1V5ih8ShjJtrQ/rNeKX8U3YPlywrGeYL3MvYoHbPNP9jyzmP
         j9cl8/xLDw3HBDsu10v9SIHvgTuRmPVPLl/QS16nCXS+egIlD08SpH+5kjfquzCXFF9Y
         0q2g==
X-Gm-Message-State: AOAM533S/ZD9nJROl6AA2W5brTSl9Jk56oh6DpbAVZd3oTJ3/ZGRzpp/
	fBtPaDYheL9wyPMhWF143JD92f/58M9snw==
X-Google-Smtp-Source: 
 ABdhPJytkaMjo9kT5hkVkaPkjw+TqSPGi04oYDghupgRO3NMytojCUS2SRZzEe+i22bqtEGm7PntAw==
X-Received: by 2002:a05:6000:1449:b0:20f:d130:d217 with SMTP id
 v9-20020a056000144900b0020fd130d217mr7798367wrx.451.1653327808991;
        Mon, 23 May 2022 10:43:28 -0700 (PDT)
Received: from uvv-2004-vm.localdomain
 (dslb-178-000-219-184.178.000.pools.vodafone-ip.de. [178.0.219.184])
        by smtp.gmail.com with ESMTPSA id
 x1-20020a1c7c01000000b00397122e63b6sm9338227wmc.29.2022.05.23.10.43.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 May 2022 10:43:28 -0700 (PDT)
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
Subject: [meta-filesystems][PATCH v2] overlayfs-progs: add new recipe
Date: Mon, 23 May 2022 19:43:10 +0200
Message-Id: <20220523174310.2485640-1-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 May 2022 17:43:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97235

From: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>

overlayfs-progs contains fsck.overlay, which is used to check and optionally
repair underlying directories of overlay-filesystem.

Signed-off-by: Vyacheslav Yurkov <Vyacheslav.Yurkov@bruker.com>
---
 ...-Makefile-proper-location-of-LDFLAGS.patch | 30 +++++++++++++++++
 .../overlayfs/overlayfs-progs_git.bb          | 33 +++++++++++++++++++
 2 files changed, 63 insertions(+)
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
index 000000000..bc3cc64e7
--- /dev/null
+++ b/meta-filesystems/recipes-utils/overlayfs/overlayfs-progs_git.bb
@@ -0,0 +1,33 @@
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
+#LDLIBS:append:libc-musl = " -lfts"
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


