Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35512C433EF
	for <webhook@archiver.kernel.org>; Wed, 16 Feb 2022 14:14:17 +0000 (UTC)
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com
 [209.85.167.176])
 by mx.groups.io with SMTP id smtpd.web11.12088.1645020856293383001
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Feb 2022 06:14:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=c8EnkWgn;
 spf=pass (domain: gmail.com, ip: 209.85.167.176,
 mailfrom: festevam@gmail.com)
Received: by mail-oi1-f176.google.com with SMTP id p15so1064493oip.3
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Feb 2022 06:14:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=I6ncrQIjPTFSfeR3qXD2/26SVKVZv0hBSYwaCjNtv6Y=;
        b=c8EnkWgnqX+DWcSPDHtTBZSGnEWvo9PzW7DT7DzZFTyQjaqwkq4K1+j7SwNrRCmMCi
         kj+brgcPzv0ZhtIu2/LPUgEDA/NtLrTyqT1WDRQUgVzppYA3vhF6ak/ZjkEctKyopgzo
         5uH7f+1IeAdzLp91F/oTDT99yFxK1BYPyZREUJ056A5NXRPJx1Rev1Iep71SoF4Rl5S3
         /xeA77OS0fqnNcqRJpe1hPCEP+bySaVyxlqRJVwFlPgm7KY3hiWun2dmcFpNKSdN6OCt
         se5etpoqyZq83e5JvR+PV5C/f0n4H6e/VPwc5IruIHr95+PMEu5OJNUo+n83Hwi2rE4Y
         49fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=I6ncrQIjPTFSfeR3qXD2/26SVKVZv0hBSYwaCjNtv6Y=;
        b=XFpLhzAQ/nMH6aevvBEenTK3IWZkIQOuxZoY/PP4ACsvoTLoRxcoUI//8YyGDqvq3Y
         bagvk81c8LCwRwnyrsEsGkEhLWHUwhofNKIoMmFuw5/AN22LAxiJdlcZv3I9H/OscdaK
         FedXGqDOeamdlAgfhn9hVR1dTFP+IxEI2WDpBXbcrApDI7YYOlKpjddLLZrICs2wYv1s
         oUCfMKZ7NlyjnB5X/KtXGLtdJfcZRXABplh/36uNxFLUoY9uZTC1vNaRUCeVyLxCMnmL
         nAlifQrxRFcD1B28rw/icVYG3NB7Ue9QhKYwv6gSQzn1ecegLmyr7ZDJOqRAHH8vzIVx
         /ATw==
X-Gm-Message-State: AOAM5330FX69fTneyulEV7LXcF7FY322jVXq4Ua2x8VvYrEWurqPb4BX
	1QA5wvPNdQelkQun3zdicbpUZl68yCA=
X-Google-Smtp-Source: 
 ABdhPJxdBMw+yat3A+uyjnCr2v3U7CLIu9wAdnXNHf6BCzauosk0OhkcsTXeKmDHokTXxW8B90V75w==
X-Received: by 2002:aca:3d8b:0:b0:2d0:3c63:ef6a with SMTP id
 k133-20020aca3d8b000000b002d03c63ef6amr712386oia.144.1645020855120;
        Wed, 16 Feb 2022 06:14:15 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:485:4b69:cb07:b5df:b2bf:2da8])
        by smtp.gmail.com with ESMTPSA id
 z4sm14588227otu.24.2022.02.16.06.14.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Feb 2022 06:14:14 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: raj.khem@gmail.com,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH] rtc-tools: Bump the recipe
Date: Wed, 16 Feb 2022 11:14:05 -0300
Message-Id: <20220216141405.2315276-1-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Feb 2022 14:14:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95336

From: Fabio Estevam <festevam@denx.de>

The patch that adds the rtc-tools Makefile has been accepted
upstream, so bump to the latest version and remove the local
Makefile patch.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 .../0001-rtc-tools-Add-a-Makefile.patch       | 39 -------------------
 .../rtc-tools/rtc-tools_1.0.0.bb              |  6 +--
 2 files changed, 2 insertions(+), 43 deletions(-)
 delete mode 100644 meta-oe/recipes-support/rtc-tools/rtc-tools/0001-rtc-tools-Add-a-Makefile.patch

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
diff --git a/meta-oe/recipes-support/rtc-tools/rtc-tools_1.0.0.bb b/meta-oe/recipes-support/rtc-tools/rtc-tools_1.0.0.bb
index 303585a6591d..d65f5da859af 100644
--- a/meta-oe/recipes-support/rtc-tools/rtc-tools_1.0.0.bb
+++ b/meta-oe/recipes-support/rtc-tools/rtc-tools_1.0.0.bb
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


