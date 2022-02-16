Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9769DC433F5
	for <webhook@archiver.kernel.org>; Wed, 16 Feb 2022 17:10:16 +0000 (UTC)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com
 [209.85.167.175])
 by mx.groups.io with SMTP id smtpd.web11.1916.1645031415724921366
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Feb 2022 09:10:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hWnhCelB;
 spf=pass (domain: gmail.com, ip: 209.85.167.175,
 mailfrom: festevam@gmail.com)
Received: by mail-oi1-f175.google.com with SMTP id ay7so3111200oib.8
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Feb 2022 09:10:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cnxCBU5ql5NXp5Kr/xAf1vfyHVgO6nuIy9n4U1ZD8ho=;
        b=hWnhCelBg8Rb7elfLO8AVWq/QZJGfnkorG8VvZ5Ox84eT6ZtE0xU7hrWg+R5JlC6QJ
         4m1a9alr8G2+KxSBdbTW6NsoXxgDGwLv9MqB/fTZrpQMc02P+lkwtHmt0eDZaHSEqWa4
         A1cLZdKaSM4s+i5RhrrSHZPUI520FdY6Z66ZYR9NkHZoTInj+Jrav+xnSaCB7rVTls/A
         ZO+UCcQ4Dcj4LhMEVDrCRwnXxGZeDvB4V/gmlIRu9h4gb9p7WStohuKNH0res6FDHdSe
         +kbro9lfsbUDcBeEQYUVyjo4Pefi0rfjcsMavd9j8Qr6f9J/LO6CyUrTDZOnH/K5dNPb
         yvGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cnxCBU5ql5NXp5Kr/xAf1vfyHVgO6nuIy9n4U1ZD8ho=;
        b=zP5RnZPVxsCZNJwKh8RyvzPa3Da1MetjRb1M/XYCTPJL69YB/JkE1IqciovP2sbv6d
         TR8J9L8jG9H6bl5S3xTa4Ywwf/ZXpsBWadrzrvAAtuC8MfZoiNCO0qzoBgj3HI1jmsci
         ItNkWkDtM0OCx9wDwnOim0ryO2S+Ds7vxeBtPF+eYmAp0cV8lDvTS5FoGT3bG+ty6zFK
         Lqgp8RqEaof8KMVtAarASzpmOor3EXRmjFR9TfN6KsXsgaT1fnJ7Kx1gejGye0BXw7P7
         sfW5DT05Y3GUzEza7JwJTCc42grpu6/XCjQANEAhCqMI9wShUALmmIE5bxFnM83qtvkH
         TIuQ==
X-Gm-Message-State: AOAM53150+13PPPmIqiYuCf9KZRw36NWt+wIZubRIyxDK8bi4LSQvNbl
	uMCihi7VM7ZpXXMWy64kYEzSVi7hgHU=
X-Google-Smtp-Source: 
 ABdhPJxHhFJqiKctE5CQyMhx/9+oRXohtcwKgCO36ZVSRpzg74FPGy1k123Oe3Vmc7GAo3YbAuTy8g==
X-Received: by 2002:a05:6808:124f:b0:2cd:199d:ee01 with SMTP id
 o15-20020a056808124f00b002cd199dee01mr1157402oiv.101.1645031414671;
        Wed, 16 Feb 2022 09:10:14 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:485:4b69:e2a7:a07c:c522:98a9])
        by smtp.gmail.com with ESMTPSA id
 o1sm16378874oik.0.2022.02.16.09.10.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Feb 2022 09:10:14 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: raj.khem@gmail.com,
	peter.kjellerstedt@axis.com,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH v2] rtc-tools: Update to 2022.02
Date: Wed, 16 Feb 2022 14:10:02 -0300
Message-Id: <20220216171002.2338962-1-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Feb 2022 17:10:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95341

From: Fabio Estevam <festevam@denx.de>

The patch that adds the rtc-tools Makefile has been accepted
upstream, so update to the latest 2022.02 version and remove the
local Makefile patch.

Also, rename the recipe to reflect the new version.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
Changes since v1:
- Use the 2022.02 tag (Peter)

 .../0001-rtc-tools-Add-a-Makefile.patch       | 39 -------------------
 ...tc-tools_1.0.0.bb => rtc-tools_2022.02.bb} |  6 +--
 2 files changed, 2 insertions(+), 43 deletions(-)
 delete mode 100644 meta-oe/recipes-support/rtc-tools/rtc-tools/0001-rtc-tools-Add-a-Makefile.patch
 rename meta-oe/recipes-support/rtc-tools/{rtc-tools_1.0.0.bb => rtc-tools_2022.02.bb} (64%)

diff --git a/meta-oe/recipes-support/rtc-tools/rtc-tools/0001-rtc-tools-Add-a-Makefile.patch b/meta-oe/recipes-support/rtc-tools/rtc-tools/0001-rtc-tools-Add-a-Makefile.patch
deleted file mode 100644
index 1d16a66088e8..000000000000
--- a/meta-oe/recipes-support/rtc-tools/rtc-tools/0001-rtc-tools-Add-a-Makefile.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 3e9dfc0f21191bdb3ab719479e9c1997a61c5044 Mon Sep 17 00:00:00 2001
-From: Fabio Estevam <festevam@denx.de>
-Date: Fri, 28 Jan 2022 13:34:45 -0300
-Subject: [PATCH] rtc-tools: Add a Makefile
-
-Add a Makefile to make installation and uninstallation
-process easier.
-
-Upstream-Status: Submitted [https://marc.info/?l=linux-rtc&m=164332426030004&w=2]
-Signed-off-by: Fabio Estevam <festevam@denx.de>
----
- Makefile | 16 ++++++++++++++++
- 1 file changed, 16 insertions(+)
- create mode 100644 Makefile
-
-diff --git a/Makefile b/Makefile
-new file mode 100644
-index 0000000..71a4c9c
---- /dev/null
-+++ b/Makefile
-@@ -0,0 +1,16 @@
-+prefix ?= /usr
-+bindir ?= $(prefix)/bin
-+
-+EXEC = rtc-range rtc rtc-sync
-+
-+all: $(EXEC)
-+
-+clean:
-+	$(RM) $(EXEC)
-+
-+install:
-+	install -d $(DESTDIR)$(bindir)
-+	install $(EXEC) $(DESTDIR)$(bindir)
-+
-+uninstall:
-+	$(RM) -r $(addprefix $(DESTDIR)$(bindir)/,$(EXEC))
---
-2.25.1
diff --git a/meta-oe/recipes-support/rtc-tools/rtc-tools_1.0.0.bb b/meta-oe/recipes-support/rtc-tools/rtc-tools_2022.02.bb
similarity index 64%
rename from meta-oe/recipes-support/rtc-tools/rtc-tools_1.0.0.bb
rename to meta-oe/recipes-support/rtc-tools/rtc-tools_2022.02.bb
index 303585a6591d..d65f5da859af 100644
--- a/meta-oe/recipes-support/rtc-tools/rtc-tools_1.0.0.bb
+++ b/meta-oe/recipes-support/rtc-tools/rtc-tools_2022.02.bb
@@ -2,10 +2,8 @@ SUMMARY = "Useful programs to test rtc drivers"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=74274e8a218423e49eefdea80bc55038"
 
-SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/${BPN}.git;protocol=https;branch=master \
-           file://0001-rtc-tools-Add-a-Makefile.patch \
-           "
-SRCREV = "acc442e7af4e1e783432a43d37f1a7938c692659"
+SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/${BPN}.git;protocol=https;branch=master"
+SRCREV = "61839777afedcc7bdb68ea4628c5ce5ca72c2ac8"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


