Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 050A6C433EF
	for <webhook@archiver.kernel.org>; Fri, 28 Jan 2022 19:55:18 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com
 [209.85.167.179])
 by mx.groups.io with SMTP id smtpd.web12.1361.1643399717535813903
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Jan 2022 11:55:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bCakx7nf;
 spf=pass (domain: gmail.com, ip: 209.85.167.179,
 mailfrom: festevam@gmail.com)
Received: by mail-oi1-f179.google.com with SMTP id s185so14380066oie.3
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Jan 2022 11:55:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UaDQcZ4/UUzY7tGx/K5eo6as0/7BeJcc8ClQFht/N84=;
        b=bCakx7nfyE0MEtrV1ENsEDM/WfW3WTUjNGmsWLLQoCsn1nW7aLy2XyLx0Uur7oFKDu
         STXi3VE9798DTg6Q+SyCnJdDoEMqw7lbqRfqqbt0zbmSGOi/olRduwnJe1hqQMZ99yMt
         dOpcG/4z9Rfl5FwVMMZ6ghxTf5xYL+q+RK0OrcqW8FZ9Mp+sCeryjJwWed4JnjD+/Xjj
         7kV0mKn3yMg2fDt5U9gjaNdkyF/2YaztDOzXbeVpY119cqJ+jo3Wa+9WAR1xo6I7maAn
         9Satr6oEachqS2cg9uMhwuS2bq8FkdpSxJm1movbD2+v24DyuFlMb22KUi8X5SPbbmlj
         jSog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UaDQcZ4/UUzY7tGx/K5eo6as0/7BeJcc8ClQFht/N84=;
        b=xgvkpsJEDwExGYmIs3WdNu6t+Icya9+zzwgTDSTxSALeYBDOJ3HRUfi2F3HdOefyhw
         STdAvxflZ+2+skEGqPFal1tZuqsu79XYVJD1vATvL6b1bAKGhqkOm5JjZEwa8//3Nu7D
         NryIJHH9rv52RQgOzgL4Kiu99ET+yLqDkpuzWczMxcjk6WjKrOVztKDMdcwl/zX2W+sQ
         iQ70bnKlUfyhQCww5Y6RwLMdlqE/jEkZAqLnd8tl26aVZb71m12BlvQWtnuw5QIKnMab
         2DtRPygrw3zmz8zdh2JTRUmHhO7zrkRdZcX5ZklscDt94vKvh4N79bN6xN6es48I1UNV
         pmUg==
X-Gm-Message-State: AOAM530ttRJnWqXUPkqRmfsLMxDbNPEqRou1Ft92PZQapgt6DHSxxXKe
	dj5RZtXE6iXtej4hvpRM1HMHAEKtqt0=
X-Google-Smtp-Source: 
 ABdhPJxiyNX7FxV4c0IriTVrI5ZSbVtFWHvFCULdWJ/lfq7ExEnYp2KsPHVG6k87cMoAh30J6Y9hwQ==
X-Received: by 2002:a54:4e06:: with SMTP id a6mr6060820oiy.224.1643399716506;
        Fri, 28 Jan 2022 11:55:16 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:485:4b69:95a2:6da9:5705:29a2])
        by smtp.gmail.com with ESMTPSA id
 v31sm5463071ott.25.2022.01.28.11.55.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jan 2022 11:55:15 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: otavio.salvador@ossystems.com.br,
	hs@denx.de,
	alexandre.belloni@bootlin.com,
	raj.khem@gmail.com,
	peter.kjellerstedt@axis.com,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH v4 meta-oe] rtc-tools: Add a recipe
Date: Fri, 28 Jan 2022 16:54:59 -0300
Message-Id: <20220128195459.216370-1-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Jan 2022 19:55:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95162

From: Fabio Estevam <festevam@denx.de>

rtc-tools is a useful utility developed by Alexandre Belloni
for testing RTC kernel drivers, such as y2038 support.

Based on the initial recipe from Heiko Schocher <hs@denx.de>.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
Changes since v3:
- Removed the TARGET_CC_ARCH line (Peter/Khem).

 .../0001-rtc-tools-Add-a-Makefile.patch       | 40 +++++++++++++++++++
 .../rtc-tools/rtc-tools_1.0.0.bb              | 16 ++++++++
 2 files changed, 56 insertions(+)
 create mode 100644 meta-oe/recipes-support/rtc-tools/rtc-tools/0001-rtc-tools-Add-a-Makefile.patch
 create mode 100644 meta-oe/recipes-support/rtc-tools/rtc-tools_1.0.0.bb

diff --git a/meta-oe/recipes-support/rtc-tools/rtc-tools/0001-rtc-tools-Add-a-Makefile.patch b/meta-oe/recipes-support/rtc-tools/rtc-tools/0001-rtc-tools-Add-a-Makefile.patch
new file mode 100644
index 000000000000..1f3b3b3b020e
--- /dev/null
+++ b/meta-oe/recipes-support/rtc-tools/rtc-tools/0001-rtc-tools-Add-a-Makefile.patch
@@ -0,0 +1,39 @@
+From 3e9dfc0f21191bdb3ab719479e9c1997a61c5044 Mon Sep 17 00:00:00 2001
+From: Fabio Estevam <festevam@denx.de>
+Date: Fri, 28 Jan 2022 13:34:45 -0300
+Subject: [PATCH] rtc-tools: Add a Makefile
+
+Add a Makefile to make installation and uninstallation
+process easier.
+
+Upstream-Status: Submitted [https://marc.info/?l=linux-rtc&m=164332426030004&w=2]
+Signed-off-by: Fabio Estevam <festevam@denx.de>
+---
+ Makefile | 16 ++++++++++++++++
+ 1 file changed, 16 insertions(+)
+ create mode 100644 Makefile
+
+diff --git a/Makefile b/Makefile
+new file mode 100644
+index 0000000..71a4c9c
+--- /dev/null
++++ b/Makefile
+@@ -0,0 +1,16 @@
++prefix ?= /usr
++bindir ?= $(prefix)/bin
++
++EXEC = rtc-range rtc rtc-sync
++
++all: $(EXEC)
++
++clean:
++	$(RM) $(EXEC)
++
++install:
++	install -d $(DESTDIR)$(bindir)
++	install $(EXEC) $(DESTDIR)$(bindir)
++
++uninstall:
++	$(RM) -r $(addprefix $(DESTDIR)$(bindir)/,$(EXEC))
+--
+2.25.1
diff --git a/meta-oe/recipes-support/rtc-tools/rtc-tools_1.0.0.bb b/meta-oe/recipes-support/rtc-tools/rtc-tools_1.0.0.bb
new file mode 100644
index 000000000000..303585a6591d
--- /dev/null
+++ b/meta-oe/recipes-support/rtc-tools/rtc-tools_1.0.0.bb
@@ -0,0 +1,16 @@
+SUMMARY = "Useful programs to test rtc drivers"
+LICENSE = "GPL-2.0-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=74274e8a218423e49eefdea80bc55038"
+
+SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/${BPN}.git;protocol=https;branch=master \
+           file://0001-rtc-tools-Add-a-Makefile.patch \
+           "
+SRCREV = "acc442e7af4e1e783432a43d37f1a7938c692659"
+
+S = "${WORKDIR}/git"
+
+EXTRA_OEMAKE = "DESTDIR=${D}"
+
+do_install() {
+	oe_runmake install
+}
-- 
2.25.1


