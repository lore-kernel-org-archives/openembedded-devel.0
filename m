Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6276F36B96
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 23:35:03 +0000 (UTC)
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.145519.1775777695442629190
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Apr 2026 16:34:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=gcwtbErz;
 spf=pass (domain: gmail.com, ip: 74.125.82.51, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-12c19d23b19so1451588c88.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 16:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775777694; x=1776382494; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NVVhZP8RFGN6BZlvllTL3mAkOs9j0swYE3pjtkv2AUg=;
        b=gcwtbErzBTSkeiJEG7gyeB0NCuCbZFC2y+GxjlKL871QGskY8Z+mzkPlAM/yZJgQ3q
         wJYSlDVkZ7ItXEW1Oqdcpc9F3aNEEtKrIyeTYZHc3ngqUbTvTE690nReLqNjI4PFf2Rz
         oPx+B/chPr+wCeLMu+D7npCcCl5el57L/1v3VGElzBBAD5L/p8YCVsh0ezj0Hvl8XKyS
         QGZAFQpdm56FpRLrK6lB+aoGl5WpRk3o3+5DUCDGA9bWqhkr+Vb0nguOMlI4jBV0D8Lv
         Fpt3X0w1SJqJJ0FKIA732WhRLCs7iQmypmhsXpJ12gH2E801yR7AHU4utQ1EFPspGvNQ
         bq5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775777694; x=1776382494;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NVVhZP8RFGN6BZlvllTL3mAkOs9j0swYE3pjtkv2AUg=;
        b=nSS/mKAWZ6yNU4IOiNrQOJDn1A6nqOvKPaWSZ8SPxsaeiYTutJ86keOn9whJee+rIL
         qG3eiKO2jt/c5FwuECKAaxSh8kY87KQ01+4TV8SED+reqzYryTr47h5xC3mgEoncQExI
         4VQXeUiNe+10RFC2ALR7cJhcVSbfqGrP6ILK3OS5gRnvSp+3W94VvsbBklnQD7A3ZE7n
         rISf3yOQh/BGhmk8h9AtJUOputajBs6hp4OWHvXIu6yUBhcaiOi5XkcnTczJZi1GrP2R
         PAIUokkJAb02EGpAYBe7aSq/ike4SF9iYG3iW5BzIFoCJz3ASsEqwDqP7+HArC5OOAKf
         k+tQ==
X-Gm-Message-State: AOJu0Yw1kx/mGJX2o8cV0ZiukrZ0flkM2IwGM5UuILxLmZglTE1LdJG2
	xdRbRaUEaV60/IBxmSYDcIIQAi0rOh2Y/QXTfH1KHUXg04IGwwMCtlnxONdDNA==
X-Gm-Gg: AeBDievflRuaem7A/5X4nLLGNuHrmaQ1hcjS04LGEIZULuLN9qc/mXVqFnOLn7fYMHE
	lrMPpOlkSvlTjDiYXjlNbuvzm6EmG5sCBoVU/QiezB1uteIJuXoN8v6LubcFwjSTrNAJw+qlptA
	u7IOG+DFrr2AzrL44nCVOvidJgQCR6k5OHM5rf9XQicdAy3ANlarHHl1Eo49ZHXdIiaw+bvAxyB
	Mhzmm9oBIsNKRF4zA8zPhmsz7H5hlazV+S5+liBmVLXdgzk3A3AONVwsUVjRkXwt4iPpH1dsjXL
	E6B8fK6LIKvHap8/DGIBPVSy2a9wdbzTNLJ+uYht+D/sH/VtBa0OEmpPhxyxwkUZxi5pUz3fMWR
	djudoTL+B5ZGOOZgECgLk4chYpgbvHERmlEEe9XLflFLwW6ErEv/En3W1KxVf+HiJYsB9Senffs
	56cqPvMOX9CseauKtRLL6zUIwp6FvCF5DxuJXmkwbpgGh1jyG9/BG5IWKMLfxIjl6ldBfC4gpv+
	0gIwaBuPnRcpWZwJs0TeY3vPYX62ftd3QZkGoe3iepKbL3qbvaHTh7vpsNJ
X-Received: by 2002:a05:7022:43a2:b0:12a:6fb7:87e7 with SMTP id a92af1059eb24-12c34db3093mr616054c88.0.1775777694133;
        Thu, 09 Apr 2026 16:34:54 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c3459faa7sm1649500c88.2.2026.04.09.16.34.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 16:34:53 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH] ostree: Fix build with C23/glibc-2.43
Date: Thu,  9 Apr 2026 16:34:51 -0700
Message-ID: <20260409233451.2555380-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 23:35:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126207

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...x-const-correctness-of-slash-pointer.patch | 29 +++++++++++++++++++
 .../recipes-extended/ostree/ostree_2025.7.bb  |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta-oe/recipes-extended/ostree/ostree/0001-trivial-httpd-Fix-const-correctness-of-slash-pointer.patch

diff --git a/meta-oe/recipes-extended/ostree/ostree/0001-trivial-httpd-Fix-const-correctness-of-slash-pointer.patch b/meta-oe/recipes-extended/ostree/ostree/0001-trivial-httpd-Fix-const-correctness-of-slash-pointer.patch
new file mode 100644
index 0000000000..cc0c3d1318
--- /dev/null
+++ b/meta-oe/recipes-extended/ostree/ostree/0001-trivial-httpd-Fix-const-correctness-of-slash-pointer.patch
@@ -0,0 +1,29 @@
+From 3b8255e24d0785d6049d473471da53b0c5fd52c1 Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Thu, 9 Apr 2026 16:28:07 -0700
+Subject: [PATCH] trivial-httpd: Fix const-correctness of slash pointer
+
+strrchr() returns a 'const char *' when passed a 'const char *'
+argument. Declare the local 'slash' variable as 'const char *'
+to match, fixing a build failure with clang when
+-Werror,-Wincompatible-pointer-types-discards-qualifiers is active.
+
+Upstream-Status: Submitted [https://github.com/ostreedev/ostree/pull/3579]
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ src/ostree/ostree-trivial-httpd.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/ostree/ostree-trivial-httpd.c b/src/ostree/ostree-trivial-httpd.c
+index 4a0c6b00..b5a52e61 100644
+--- a/src/ostree/ostree-trivial-httpd.c
++++ b/src/ostree/ostree-trivial-httpd.c
+@@ -281,7 +281,7 @@ do_get (OtTrivialHttpd *self, SoupServer *server, SoupServerMessage *msg, const
+ do_get (OtTrivialHttpd *self, SoupServer *server, SoupServerMessage *msg, const char *path)
+ #endif
+ {
+-  char *slash;
++  const char *slash;
+   int ret;
+   struct stat stbuf;
+
diff --git a/meta-oe/recipes-extended/ostree/ostree_2025.7.bb b/meta-oe/recipes-extended/ostree/ostree_2025.7.bb
index a2094f68c3..363210b452 100644
--- a/meta-oe/recipes-extended/ostree/ostree_2025.7.bb
+++ b/meta-oe/recipes-extended/ostree/ostree_2025.7.bb
@@ -21,6 +21,7 @@ DEPENDS = " \
 GITHUB_BASE_URI = "https://github.com/ostreedev/ostree/releases"
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/libostree-${PV}.tar.xz \
            file://run-ptest \
+           file://0001-trivial-httpd-Fix-const-correctness-of-slash-pointer.patch \
            "
 SRC_URI[sha256sum] = "af8d080b9585e7fd1faba8f022967e1c268ae62e20ecf32ee7b364c1e307570b"


