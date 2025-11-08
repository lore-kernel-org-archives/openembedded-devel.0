Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD4D9CD1297
	for <webhook@archiver.kernel.org>; Sat,  8 Nov 2025 19:32:19 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12370.1762630334328672433
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 08 Nov 2025 11:32:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KBMcXuvQ;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4775638d819so10067065e9.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 08 Nov 2025 11:32:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762630333; x=1763235133; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J6l6IwG8x99RjvbL8zn/zC8bILL17e3kY49TwhQLKk4=;
        b=KBMcXuvQbE0Jgy/hP7WsESbXA+3OxCunodbYnCvavnTc1QuOfnIz9oU8VlhIf+s8nY
         d1zS03nrbQcJ4HCOrN/dpz5B4FYrjJIYLuhZj0vTW8h6LS/8l9B1yUaKadp+dBdJNoPd
         lnTd2pJEMNmQwoJ6GbVJrPkM57otxTeOHab9O8BBkxRFF3dyeC59jhK+pGnR2lS08fZH
         ulpX8IZ5YYeeO/he0CzOsDzcO0sL5/WxyWMIylNGez0NweQGPnm5XyV7fXp1s80xJF5u
         x04/JPr24Gxoa+E4Fy+UcLDdyQZfJwAkfOcWd6dCSRwia+26m0RxZ6uyJ3d1iDNZnWnZ
         0EKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762630333; x=1763235133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=J6l6IwG8x99RjvbL8zn/zC8bILL17e3kY49TwhQLKk4=;
        b=cRZwk/tWvZLcUn4yJturbzn6pbP3KMjU4jZrUQ/k9D6iLvwCmXG4Nxvd6FZKcxgFsZ
         UZ93zzwylJchBQCQL7/D6Znl6fRbdeT3Bkh6x60Or9IUC6bkBu2Vr/aYHMFe4L+zNNFr
         z0z1XPXC4j4DQKBacgAYeshAq21sKXehyb+koNjhmeflOaW8Ci8bXWeO8FKqge3XpM7E
         zU+w7NVmpnjFB2XgxZfSBvmZtJjaxCzB2reMoPkvOH11jVJWHrcmBy2nP2beUc7WDgFO
         WRKhv2XN1E1JEqefNmfy1be61YscSOUsSjTtjyigOMENGufELryWrvNxkU5szx33ECKb
         uG5A==
X-Gm-Message-State: AOJu0Yw7+rnKCYvfmWDYPzdkeCd4QAxTk7qHXp5S5v1E+A/yv2VrzEEy
	njCYor/hXs9HsLJM9ncXfnAvHa62+867pVKMZF6hBZbWwFaKo7wcR/bFyk3IoVw5
X-Gm-Gg: ASbGncs7SPtCkfKcdxmX/PF3rmYdTH+nAf4rCjPOq1YSEM3KqESbyK5KYi4eRWnCFBX
	Pjrs0sOEPYINrETOlWQ9Yewb3dUvZJr6V8sDDaS7JWRGxH4WSUcuPD++GZO6wGX+aZ6pnsr5rGc
	wF7kjhfoAM32Un0nL90lK41EbWKGxaJsf/hQwTMAmjyVzGt4ExX1ahw7KrU4w8Wb3IYEMbGIdDN
	IKu6kJOgEOegt2d0C1wnzt3pcM6hAOOlUv07tE6iPIGTNjB1ReXKmqYHNJeCXMZ2xTO5sIiVAxA
	aeqzyH8O7qeZR3KtAXUz6tXoOt2JvaN9k0j4fOKXTg1hFV4MZK+ofwPMTZy71Dj/4uZ8JnoKk3Z
	mli7nxE8M+Hz93Kgjx50U3LLwtQ7128KYuSazb+6905LIzx4YtNb5mlUPljb4tjy7VFV6Ls5Svt
	anuHL/4OZH
X-Google-Smtp-Source: AGHT+IG8FgsF4YsYLzzcsIgRbMbbIWf6bJ6pHJp5upbBqubN6Ja+wCM0+kOdRHzsET4iMli49gAggg==
X-Received: by 2002:a05:600c:458d:b0:46e:74cc:42b8 with SMTP id 5b1f17b1804b1-4777325bab3mr24383085e9.17.1762630332636;
        Sat, 08 Nov 2025 11:32:12 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4776bcfd021sm150455725e9.11.2025.11.08.11.32.12
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Nov 2025 11:32:12 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 5/5] netsniff-ng: upgarde 0.6.8 -> 0.6.9
Date: Sat,  8 Nov 2025 20:32:08 +0100
Message-ID: <20251108193208.3465135-5-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251108193208.3465135-1-skandigraun@gmail.com>
References: <20251108193208.3465135-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 08 Nov 2025 19:32:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121405

Source branch was renamed from master to main.
Drop patch that was incorporated in this release.

Changelog:
Use GitHub actions for CI
Allow to manually define CPUs for trafgen
Fix make install and output netsniff-ng stats on stderr
trafgen: Fix for ipv6 header generation when L3-only devices are present
mausezahn: use getopt_long instead of getopt
build: fix install dependencies in Makefile template
trafgen: move cpu stats temp file to /tmp
ring_tx: handle EINTR from sendto

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...001-Cmds-automatically-create-folder.patch | 28 -------------------
 ...sniff-ng_0.6.8.bb => netsniff-ng_0.6.9.bb} |  7 ++---
 2 files changed, 2 insertions(+), 33 deletions(-)
 delete mode 100644 meta-networking/recipes-support/netsniff-ng/files/0001-Cmds-automatically-create-folder.patch
 rename meta-networking/recipes-support/netsniff-ng/{netsniff-ng_0.6.8.bb => netsniff-ng_0.6.9.bb} (76%)

diff --git a/meta-networking/recipes-support/netsniff-ng/files/0001-Cmds-automatically-create-folder.patch b/meta-networking/recipes-support/netsniff-ng/files/0001-Cmds-automatically-create-folder.patch
deleted file mode 100644
index 490990d29d..0000000000
--- a/meta-networking/recipes-support/netsniff-ng/files/0001-Cmds-automatically-create-folder.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 7c00d75d16da18a9998fc4cca28d3c953dd54ceb Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
-Date: Mon, 14 Feb 2022 18:37:22 +0100
-Subject: [PATCH] Cmds: automatically create folder
-
----
-Upstream-Status: Pending
-
- Cmds | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/Cmds b/Cmds
-index e590b38..3df23b8 100644
---- a/Cmds
-+++ b/Cmds
-@@ -44,7 +44,8 @@ ifeq ("$(origin PREFIX)", "$(filter $(origin PREFIX), file command line)")
-   INSTX = echo -e "  INST\t$(1)" && install -d $(2) && \
- 	install -C $(1) $(2)/$(shell basename $(1))
- else
--  INSTX = echo -e "  INST\t$(1)" && install -C $(1) $(2)/$(shell basename $(1))
-+  INSTX = echo -e "  INST\t$(1)" && install -d $(2) && \
-+	install -C $(1) $(2)/$(shell basename $(1))
- endif
- 
- MKDIR = echo -e  "  MKDIR\t$(1)" && mkdir -p $(1)
--- 
-2.32.0
-
diff --git a/meta-networking/recipes-support/netsniff-ng/netsniff-ng_0.6.8.bb b/meta-networking/recipes-support/netsniff-ng/netsniff-ng_0.6.9.bb
similarity index 76%
rename from meta-networking/recipes-support/netsniff-ng/netsniff-ng_0.6.8.bb
rename to meta-networking/recipes-support/netsniff-ng/netsniff-ng_0.6.9.bb
index 58ace6263d..6da17c7668 100644
--- a/meta-networking/recipes-support/netsniff-ng/netsniff-ng_0.6.8.bb
+++ b/meta-networking/recipes-support/netsniff-ng/netsniff-ng_0.6.9.bb
@@ -4,11 +4,8 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=9dd40dfb621eed702c0775577fbb7011"
 DEPENDS = "libpcap"
 
-SRCREV = "be3e706f00295024ebc199e70177343fdaebbc9e"
-SRC_URI = " \
-	git://github.com/netsniff-ng/netsniff-ng.git;protocol=https;branch=master \
-	file://0001-Cmds-automatically-create-folder.patch \
-	"
+SRCREV = "fb6183fe03b6eaa6c47b18de03b1745fa78633e4"
+SRC_URI = "git://github.com/netsniff-ng/netsniff-ng.git;protocol=https;branch=main;tag=v${PV}"
 
 
 inherit pkgconfig

