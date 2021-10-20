Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B17EC433EF
	for <webhook@archiver.kernel.org>; Wed, 20 Oct 2021 22:13:39 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web08.1201.1634768018519992918
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Oct 2021 15:13:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bKeYEiem;
 spf=pass (domain: gmail.com, ip: 209.85.210.172,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id 187so4132668pfc.10
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Oct 2021 15:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RNTs2+OXfgb4wACORIfTSowTcGxPXNsXQcGdPs03iGs=;
        b=bKeYEiemmD04FcHZnm7ubgV0rNJc0jFyIPJpx7dEkAM9QuKi066VJFqBRdzCRVVtVU
         I4z3o8XXG7rQD33v00VghsT2xasX0wyr975jJl3Fz2i8FKGUVOLaWnLetQ9NhERiyS6O
         Yi/gcc4nzptQLMNZBCj85pmslW5zHe6pGylhy0WOXX+JhfvcHSzBafAsSKxLUSoK7eSg
         mWPWsbBgb2c1zE/z+GvT3HOSHu8crEi37sC4D2zsqeZUZqoDXYKQL6xV7QaqnsuGD/ar
         +p59cNMjiSuxStDwEAoWSFh4/VkkeHJkwItccHC/8jSXgGyFhso9XISGcypkhHyB49XO
         +YLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RNTs2+OXfgb4wACORIfTSowTcGxPXNsXQcGdPs03iGs=;
        b=lP7SFoZFJoz6bY3o0zGGNFBqQ+weDqE7N/XgpxacOjowImLNK45YagAW3mJDyNQYAz
         p57qYZZ0jOLobrAryRzdXUOKuhJ8PE5ofncgdBZ6kcPUyRb+43yWYi8C1C2RqWtXXAB0
         ytZbD/IiUxHGjZdJ6ncEz3WuIp5y/GqHhy7D5gLjdbQBHvb3KPQzUN63+wIVbpdgwX5J
         +wKHLJKvv45wsDF3r+HwG8aZUPnVVDXgVHj++gpOutHTg4QUY45M7IXLXxx0GbL9XWfD
         ZFhqiGgAdPDr+mOwGJIgcI5m3pxmWAuuBk503lxE8fTxkzKgW2vcjfC68pxTB+hY2ekw
         xImA==
X-Gm-Message-State: AOAM533UZpgWGA67TFoqCuKlrzJbs+vpdBzN+HH9IuO/hrvGsfeOYVsM
	Xubx0UbSYkVeFmnlNLujmBfOp/Ero7UrQQ==
X-Google-Smtp-Source: 
 ABdhPJyxU8U4AmOx/+d9Z9gXJFInwLG7PoEsFMJS7LRJognJdrYCzmaYbd12Ud3wP4Gc7v2MGeD8CA==
X-Received: by 2002:a63:2a97:: with SMTP id
 q145mr1478675pgq.217.1634768017316;
        Wed, 20 Oct 2021 15:13:37 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::8f6a])
        by smtp.gmail.com with ESMTPSA id
 x30sm3704260pfj.219.2021.10.20.15.13.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Oct 2021 15:13:36 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Marco Cavallini <m.cavallini@koansoftware.com>
Subject: [meta-networking][PATCH] bluepy: Fix permissions on tarball
Date: Wed, 20 Oct 2021 15:13:34 -0700
Message-Id: <20211020221334.586106-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Oct 2021 22:13:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93504

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Marco Cavallini <m.cavallini@koansoftware.com>
---
 ...epy-Fix-username-issue-with-tarballs.patch | 32 +++++++++++++++++++
 .../recipes-connectivity/bluepy/bluepy_git.bb |  4 ++-
 2 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-connectivity/bluepy/bluepy/0001-bluepy-Fix-username-issue-with-tarballs.patch

diff --git a/meta-networking/recipes-connectivity/bluepy/bluepy/0001-bluepy-Fix-username-issue-with-tarballs.patch b/meta-networking/recipes-connectivity/bluepy/bluepy/0001-bluepy-Fix-username-issue-with-tarballs.patch
new file mode 100644
index 0000000000..93b367a77b
--- /dev/null
+++ b/meta-networking/recipes-connectivity/bluepy/bluepy/0001-bluepy-Fix-username-issue-with-tarballs.patch
@@ -0,0 +1,32 @@
+From 318a0e7dfaa0f5f233a20c0b347948c8004cf6af Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 20 Oct 2021 14:02:09 -0700
+Subject: [PATCH] bluepy: Fix username issue with tarballs
+
+Fixes
+Cannot change ownership to uid 1000, gid 1000: Operation not permitted
+
+Upstream-Status: Submitted [https://github.com/IanHarvey/bluepy/pull/462]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ bluepy/Makefile | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+--- a/bluepy/Makefile
++++ b/bluepy/Makefile
+@@ -30,13 +30,13 @@ bluepy-helper: $(LOCAL_SRCS) $(IMPORT_SR
+ 	$(CC) -L. $(CFLAGS) $(CPPFLAGS) -o $@ $(LOCAL_SRCS) $(IMPORT_SRCS) $(LDLIBS)
+ 
+ $(IMPORT_SRCS): bluez-src.tgz
+-	tar xzf $<
++	tar xzf $< --no-same-owner
+ 	touch $(IMPORT_SRCS)
+ 
+ .PHONY: bluez-tarfile
+ 
+ bluez-tarfile:
+-	(cd ..; tar czf bluepy/bluez-src.tgz $(BLUEZ_PATH))
++	(cd ..; tar czf bluepy/bluez-src.tgz $(BLUEZ_PATH) --no-same-owner)
+ 
+ GET_SERVICES=get_services.py
+ 
diff --git a/meta-networking/recipes-connectivity/bluepy/bluepy_git.bb b/meta-networking/recipes-connectivity/bluepy/bluepy_git.bb
index bc1893eb08..887870fb78 100644
--- a/meta-networking/recipes-connectivity/bluepy/bluepy_git.bb
+++ b/meta-networking/recipes-connectivity/bluepy/bluepy_git.bb
@@ -7,7 +7,9 @@ DEPENDS = "glib-2.0"
 SRCREV = "7ad565231a97c304c0eff45f2649cd005e69db09"
 PV = "1.3.0+git${SRCPV}"
 
-SRC_URI = "git://github.com/IanHarvey/bluepy.git;protocol=https"
+SRC_URI = "git://github.com/IanHarvey/bluepy.git;protocol=https \
+           file://0001-bluepy-Fix-username-issue-with-tarballs.patch \
+          "
 
 S = "${WORKDIR}/git"
 
-- 
2.33.1


