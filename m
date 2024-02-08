Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD496C4828F
	for <webhook@archiver.kernel.org>; Thu,  8 Feb 2024 07:54:44 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.13205.1707378883039097160
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Feb 2024 23:54:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DZUPanjU;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-6e067ececb1so931165b3a.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Feb 2024 23:54:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707378882; x=1707983682; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0uYCBRKlv97qk6v0Ixj3eAYn5URRtzjGPLH1WyAFJRI=;
        b=DZUPanjU6Qich62VmNEg61b0J/pguyiMXtJOB0EwG9htHtdxtWOWA9iEU85c+9qGG0
         H4RwAxxMCTmnIof3WPHrAk1/7+vZlvKnxK2bAP6znM++KTPiaJ8lY/aNLZ1gXNCIZnEN
         7owOgytSYXIVvDC8OlkjkEOk9NZ0zyVvDZcowUrFzqr+kDOp5n/x7Jn7Tzmid/u351EV
         wQe5q0mc1kcFkaBiFD8M6C6iJ7tTUoLwHuScX7zB1lrCvKRLDGvQQHLfDZ9BT23EJTh/
         9RyDNyDozuUeojFLqwxjwgTDMmmf+kTVv7JtQgo359XFvXEMCyzk+6ZyyTpywFO/En9q
         MXLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707378882; x=1707983682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0uYCBRKlv97qk6v0Ixj3eAYn5URRtzjGPLH1WyAFJRI=;
        b=wpuF2Z1bDdajERoFObUh09Q1nOXqIzPWtTm2E2LjnztBhyJGzXacjNUOgtu+/DzcqD
         y8XQJzeEu1XR8lYwilfNvUa3v42vhFBqPIrhbW/BeLDqH0sLpxoTnPc0hwi30cfwXdeF
         e7zubWwvrRx8optoPRWtsZ3+eQT+UeLdcaSZ30ZgrnMDkWj/77lAHHf1ySXQEWvhacOs
         EnjaffKLVN8FQ4bMLh6dmkIX1C1L/GjxaN7CKl91qv669D99kTiD31dxspjSgcoPoAk+
         lyiX/dwwOd72T4NFjXiAYQ2AcfAmwACTLyyYsLJPspKO1SSc8FxkVafFu+jxsDXyzhYe
         GuiQ==
X-Gm-Message-State: AOJu0YwVfgeuKDYjKWfA84Z9GLTbRjdFmS9yEFKjWi0ZI0tUCaFlNPeD
	wWnzNCbKx/pxgOyqY10GmypAJ437GfNgNYdfvdKFo6xjLnTOhVKhh8VFRk1gau8=
X-Google-Smtp-Source: AGHT+IH/4x9JoBN4mSj7033MLimhr8/OTSYvHIoA4eweJeAWi/v0lrlScK6yp1oQX+beuQUT4ubOKA==
X-Received: by 2002:a05:6a00:1788:b0:6e0:503f:f506 with SMTP id s8-20020a056a00178800b006e0503ff506mr6682551pfg.7.1707378881921;
        Wed, 07 Feb 2024 23:54:41 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::c29d])
        by smtp.gmail.com with ESMTPSA id p17-20020a056a0026d100b006dde1781800sm2390539pfw.94.2024.02.07.23.54.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Feb 2024 23:54:41 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 2/4] openflow: Switch SRC_URI to github mirror
Date: Wed,  7 Feb 2024 23:54:36 -0800
Message-ID: <20240208075438.1045660-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240208075438.1045660-1-raj.khem@gmail.com>
References: <20240208075438.1045660-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Feb 2024 07:54:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108658

Original repo seems to be not accessible.
Fix build with clang-18

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-protocols/openflow/openflow.inc   |  2 +-
 ...ify-export-dynamic-directly-to-linke.patch | 30 +++++++++++++++++++
 .../openflow/openflow_git.bb                  |  3 +-
 3 files changed, 33 insertions(+), 2 deletions(-)
 create mode 100644 meta-networking/recipes-protocols/openflow/openflow/0001-Makefile.am-Specify-export-dynamic-directly-to-linke.patch

diff --git a/meta-networking/recipes-protocols/openflow/openflow.inc b/meta-networking/recipes-protocols/openflow/openflow.inc
index 7062d21462..7b404f5408 100644
--- a/meta-networking/recipes-protocols/openflow/openflow.inc
+++ b/meta-networking/recipes-protocols/openflow/openflow.inc
@@ -11,7 +11,7 @@ LICENSE = "GPL-2.0-only"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=e870c934e2c3d6ccf085fd7cf0a1e2e2"
 
-SRC_URI = "git://gitosis.stanford.edu/openflow.git;protocol=git;branch=master"
+SRC_URI = "git://github.com/mininet/openflow;protocol=https;branch=master"
 
 CVE_STATUS[CVE-2015-1611] = "not-applicable-config: Not referred to our implementation of openflow"
 CVE_STATUS[CVE-2015-1612] = "not-applicable-config: Not referred to our implementation of openflow"
diff --git a/meta-networking/recipes-protocols/openflow/openflow/0001-Makefile.am-Specify-export-dynamic-directly-to-linke.patch b/meta-networking/recipes-protocols/openflow/openflow/0001-Makefile.am-Specify-export-dynamic-directly-to-linke.patch
new file mode 100644
index 0000000000..27fc05f09d
--- /dev/null
+++ b/meta-networking/recipes-protocols/openflow/openflow/0001-Makefile.am-Specify-export-dynamic-directly-to-linke.patch
@@ -0,0 +1,30 @@
+From 12bba388719c425d9b5cd970d4fabf01edf56aa4 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 7 Feb 2024 22:33:12 -0800
+Subject: [PATCH] Makefile.am: Specify export-dynamic directly to linker
+
+Fixes build with clang-18+
+| riscv64-yoe-linux-clang: error: unknown argument: '-export-dynamic'
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 97ac1f0..e557fe7 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -23,7 +23,7 @@ if NDEBUG
+ AM_CPPFLAGS += -DNDEBUG
+ AM_CFLAGS += -fomit-frame-pointer
+ else
+-AM_LDFLAGS = -export-dynamic
++AM_LDFLAGS = -Wl,--export-dynamic
+ endif
+ 
+ CLEANFILES =
+-- 
+2.43.0
+
diff --git a/meta-networking/recipes-protocols/openflow/openflow_git.bb b/meta-networking/recipes-protocols/openflow/openflow_git.bb
index f39888e8f1..c86c811cc8 100644
--- a/meta-networking/recipes-protocols/openflow/openflow_git.bb
+++ b/meta-networking/recipes-protocols/openflow/openflow_git.bb
@@ -1,10 +1,11 @@
 include ${BPN}.inc
 
-SRCREV = "c84f33f09d5dbcfc9b489f64cb30475bf36f653a"
+SRCREV = "82ad07d997b0b2ee70e1b2c7e82fcc6d0ccf23ea"
 PV = "1.0+git"
 
 SRC_URI += "file://0001-Check-and-use-strlcpy-from-libc-before-defining-own.patch \
            file://0002-lib-netdev-Adjust-header-include-sequence.patch \
            file://0001-generate-not-static-get_dh-functions.patch \
            file://0001-socket-util-Include-sys-stat.h-for-fchmod.patch \
+           file://0001-Makefile.am-Specify-export-dynamic-directly-to-linke.patch \
            "
-- 
2.43.0


