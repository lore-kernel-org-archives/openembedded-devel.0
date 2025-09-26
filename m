Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 743CECAC5B9
	for <webhook@archiver.kernel.org>; Fri, 26 Sep 2025 14:19:42 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web11.18532.1758896378950723774
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Sep 2025 07:19:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=C/atV7Es;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-634b6f67742so1904973a12.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 07:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758896377; x=1759501177; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tYVI/pbJfCLO+SEEbhX/7KxR3gxTvBy3vvJGYMyopis=;
        b=C/atV7Es11URRQ16Ho2ar7zTrwJW41nZ3ahxCTZl0H89HS5PMM6cqvR8ZrjP61X51Z
         ME5qiDyOlBYnrVA4zJlhJupUc2b6tuzWIfuRIs/Rnc+tqgMgl0O2aAJoVEBmOYtm/MlV
         QuW4AdulS9K0aVFYEkmBv7GHZqNV6OTem4KcQ2Gi4M4PQcb8/3cDJGEr5k6263odHC1o
         aOaLTX5EcnYp0a/jicBlm7RJYiDlAt8VZbdZqh/Voz6NJDB4IMqc0ERm32smNCa+01+I
         IZlBJalqO9SYykemUhlBuC30yww+3aEDgr/8YHTgWe4MoEtC9yAByWe89pWyT0o94MgD
         vugQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758896377; x=1759501177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tYVI/pbJfCLO+SEEbhX/7KxR3gxTvBy3vvJGYMyopis=;
        b=nRpkk6x1rMEtEh6VfDfhi1RlqIoRgDxCYbB0ZYB2DOXaUgBO8XTqZCZu9HVNnPa0yE
         HEVGwsQKNGdcBy3pl5OGwt/yq1IHYoTIAJIbAZCWlvfxc0tjR8aFeTBIcRq2+Y+bj/VF
         o0AyPGIORxd/n3wWoZ0Txo4IuXsDpd9J8l8bB7OHu/XDxZTpt9ka8gdJUT3wM67xZ1fa
         WoEhIToKd4St0uiWKiL6r6zmQOBTXAabELz/b7FIRXrBx/BMTyM8J2xR6PkW4GVFwN0F
         iU0u2DGPEEFoEiH9MrnO1JI54qqth6XwIu4XiOAQQdUwt+6WsgJF6gSoupRr2q+xaPwT
         zF/g==
X-Gm-Message-State: AOJu0YxAwn77+nMk/4a/uoGB23rCFW/mxk7Xx90R3Egkl9LqhIjcq+Nl
	EwIBYdBpO8gNH7NeylWaQUKGPSFywDoaMudvFuJDsy92RV4xHBxqIQslxDmfvQ==
X-Gm-Gg: ASbGnctw2G6muc0vW7TZXLfdX06gfLWFyCGyuhI+D9/aeNWoa66alw7+8qPSLnf05ft
	BDbgAMp8P6b/JhthMtmh9EeJMho8Q5cIoXzZMgPQskdWNWnj5Jf0XVjOwR9fTHopB2+9NgVyOd2
	gLXRRibRx3e2Lmxw3on7wvRcuQwqkUEmqtSbWhpJtKmhvZWkO7Ro/cZ6R772/44zos+sWkWAXom
	S6MCUPM3/3oZxVhNqO69kvRqI+bsD/zLIXXuajKoPK+WqZG50Flx0x8NPoikV6JNpwiuGNfcQNV
	I96QI6ra1mI74cv5rT++TyXgd1C66VR9TYopNFMY4g+kijivtJa5Xi6ArA9Z2e4P4Dq3l1AtJTh
	FD8fLeegg/jDdGjMWKpyNNa2rrVH/DqA=
X-Google-Smtp-Source: AGHT+IHTohBvl6GMUAN2g2LyGjKa4sw8kAzkHioIfaOpL4gzI5Gseia3L6tcBnjC2nJsmEAmex7/Wg==
X-Received: by 2002:a05:6402:3d9:b0:633:d65a:af0e with SMTP id 4fb4d7f45d1cf-6349fa91fc3mr5441570a12.28.1758896377086;
        Fri, 26 Sep 2025 07:19:37 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-634a3ae321csm3001028a12.24.2025.09.26.07.19.35
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 07:19:35 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][kirkstone][PATCH 16/20] openflow: Include sys/stat.h for fchmod
Date: Fri, 26 Sep 2025 16:19:15 +0200
Message-ID: <20250926141919.2010846-17-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250926141919.2010846-1-skandigraun@gmail.com>
References: <20250926141919.2010846-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 14:19:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119925

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit e2b1b060b038ce26578e1672a1211b948f789bd6)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...t-util-Include-sys-stat.h-for-fchmod.patch | 23 +++++++++++++++++++
 .../openflow/openflow_git.bb                  |  4 ++--
 2 files changed, 25 insertions(+), 2 deletions(-)
 create mode 100644 meta-networking/recipes-protocols/openflow/openflow/0001-socket-util-Include-sys-stat.h-for-fchmod.patch

diff --git a/meta-networking/recipes-protocols/openflow/openflow/0001-socket-util-Include-sys-stat.h-for-fchmod.patch b/meta-networking/recipes-protocols/openflow/openflow/0001-socket-util-Include-sys-stat.h-for-fchmod.patch
new file mode 100644
index 0000000000..97e3422166
--- /dev/null
+++ b/meta-networking/recipes-protocols/openflow/openflow/0001-socket-util-Include-sys-stat.h-for-fchmod.patch
@@ -0,0 +1,23 @@
+From b875c6e264eaf7350ad4e4ebf427692d8fd3cd72 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 29 Aug 2022 12:58:53 -0700
+Subject: [PATCH] socket-util: Include sys/stat.h for fchmod
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lib/socket-util.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/lib/socket-util.c b/lib/socket-util.c
+index c7b5d6d..5b3d602 100644
+--- a/lib/socket-util.c
++++ b/lib/socket-util.c
+@@ -42,6 +42,7 @@
+ #include <stdio.h>
+ #include <string.h>
+ #include <sys/resource.h>
++#include <sys/stat.h>
+ #include <sys/un.h>
+ #include <unistd.h>
+ #include "fatal-signal.h"
diff --git a/meta-networking/recipes-protocols/openflow/openflow_git.bb b/meta-networking/recipes-protocols/openflow/openflow_git.bb
index b6cef0730a..1ac5dd4105 100644
--- a/meta-networking/recipes-protocols/openflow/openflow_git.bb
+++ b/meta-networking/recipes-protocols/openflow/openflow_git.bb
@@ -3,8 +3,8 @@ include ${BPN}.inc
 SRCREV = "c84f33f09d5dbcfc9b489f64cb30475bf36f653a"
 PV = "1.0+git${SRCPV}"
 
-SRC_URI += "\
-           file://0001-Check-and-use-strlcpy-from-libc-before-defining-own.patch \
+SRC_URI += "file://0001-Check-and-use-strlcpy-from-libc-before-defining-own.patch \
            file://0002-lib-netdev-Adjust-header-include-sequence.patch \
            file://0001-generate-not-static-get_dh-functions.patch \
+           file://0001-socket-util-Include-sys-stat.h-for-fchmod.patch \
            "

