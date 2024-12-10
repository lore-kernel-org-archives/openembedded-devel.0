Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2258DE7717F
	for <webhook@archiver.kernel.org>; Tue, 10 Dec 2024 12:45:49 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web11.9542.1733834743443490238
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Dec 2024 04:45:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dAPMUyLw;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5d0d32cd31aso6551677a12.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 10 Dec 2024 04:45:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733834742; x=1734439542; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V5K/2JqZURBt4lXzr0kkVxgd4N7tBCigmE4jix0mon0=;
        b=dAPMUyLw5aMvubPaYr2BKInAir/Y/jfF3QWYi67Q+SavO+SuxADpem9Y/PTgEnbRQE
         SdnxfRl0oLftFF1AdhB6Eq5AvHg50V4Fu2axpDgA30KjBz3NE1NNUMDVLVXAGICOWAgZ
         tvTvCqhp7rMHl2YxVgzwpaUN0rEBJAJIFjYStEXiI5Fj6A3zM9BGJUcJwgy8IsamCIXT
         feaKJVsD/l7mHQdreLGcgAKdSmQxDMtvaj7Tk79bAFf3Buh3mmTDUiwt0DqKX3HfiU/G
         FZUd9fqZagGrk/AZqiMzDcMUqd94FEmrxAklOjfeaClqQvL+ygAROTzr8rdIUS1HQhuc
         HkTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733834742; x=1734439542;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V5K/2JqZURBt4lXzr0kkVxgd4N7tBCigmE4jix0mon0=;
        b=DQgKA7npSD6YHQURX0OsjWXC8Ubx/XvkBbhXB4xGSfeo7ZKZErr0WRghM1YEe+6Bo6
         EBkd2GU+d8KxLyid40N8ahTc0neDoo0YRYMSmrCTueGE8WjGnTQBoeDYiwDAB/6IXtv+
         JBmmSezFfRLaVl6paQ93cLTaOy264mY53Z6snGDBxE9Sei1iyfq1IcDq8wBenkEoWRQ9
         ssZ/WJvGXuKtp9WtP9ZUOCfTu6bL8/rC/AGvhn98WTSh1yXPAwvM15A1f8nRUf9Z2jot
         Cyp+f2zKzeLwc0DxaoBAP/DrXsU3LF9RuPR64Ks4C1RK9z9G8CsZa/L+ai7fkyn2bcw/
         Reeg==
X-Gm-Message-State: AOJu0YwDprrKmDBosbVF2x2nE+P+/qTtIBBICSdKvq+lDyK6Sp2wuDwT
	Oxpcc+k/BIRDv0Fl2SE88IhR85hwLuKvuY4E5BaBOXuPrSiqsuCabFrK9w==
X-Gm-Gg: ASbGncvjNDzHgSpwqfwFZHenmn8qDbItAo4+OAAs9MuclcAjLpvj+z5J0kNKms9C4b4
	QR7EVJInNgp8EyfxGKfi4CzJwMkswYcirrq/fJYts6YNJBMAZ1VmArhbMw44m3xlrO78nnBUTPO
	ogdIsh7tAbHIu2zhD5imrDQrxgv3JPAGcYncIOlqGqRIrxQPatYZp2aOlY5a+PMC2pcflTGbYTV
	O3i/cEOP93e4bRAFNc6ODIiLbTAfQsDvLFip2P/OCYd7yNbfiK00c8fr4FRTiYFahTkTJ1MS/FE
	LFW/nxIfKhs=
X-Google-Smtp-Source: AGHT+IHMauEp8mF2gI7aNwMs8L75eo7QQmMi8d/ToalJd4BJvZEmMGKh4v+RVYUHfAAYUxBrRarWfA==
X-Received: by 2002:a05:6402:274d:b0:5d0:9054:b119 with SMTP id 4fb4d7f45d1cf-5d4185d5fb5mr10254930a12.21.1733834741581;
        Tue, 10 Dec 2024 04:45:41 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d149a25ce7sm7451844a12.5.2024.12.10.04.45.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 04:45:40 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: akuster808@gmail.com,
	Khem Raj <raj.khem@gmail.com>,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][kirkstone][PATCH] nspr: Fix build with clang16
Date: Tue, 10 Dec 2024 13:45:36 +0100
Message-ID: <20241210124536.3319728-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Dec 2024 12:45:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114262

From: Khem Raj <raj.khem@gmail.com>

* also needed for nspr-native build with gcc-14 on host

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 ...Wincompatible-function-pointer-types.patch | 39 +++++++++++++++++++
 meta-oe/recipes-support/nspr/nspr_4.29.bb     |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta-oe/recipes-support/nspr/nspr/0001-Fix-Wincompatible-function-pointer-types.patch

diff --git a/meta-oe/recipes-support/nspr/nspr/0001-Fix-Wincompatible-function-pointer-types.patch b/meta-oe/recipes-support/nspr/nspr/0001-Fix-Wincompatible-function-pointer-types.patch
new file mode 100644
index 0000000000..8515075fe0
--- /dev/null
+++ b/meta-oe/recipes-support/nspr/nspr/0001-Fix-Wincompatible-function-pointer-types.patch
@@ -0,0 +1,39 @@
+From d24dc9bebaefbd8abf32707bad5efc0c811c0cd4 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 18 Jan 2023 13:04:56 -0800
+Subject: [PATCH] Fix -Wincompatible-function-pointer-types
+
+Fixes warnings with clang16
+testfile.c:576:31: error: incompatible function pointer types passing 'PRInt32 (void *)' (aka 'int (void *)') to parameter of type 'void (*)(void *)' [-Wincompatible-function-pointe r-types]
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ pr/tests/testfile.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/pr/tests/testfile.c b/pr/tests/testfile.c
+index 79d8a05..42aa6a7 100644
+--- a/pr/tests/testfile.c
++++ b/pr/tests/testfile.c
+@@ -123,7 +123,7 @@ PRThread* create_new_thread(PRThreadType type,
+     if (native_thread) {
+ #if defined(_PR_PTHREADS)
+         pthread_t tid;
+-        if (!pthread_create(&tid, NULL, start, arg)) {
++        if (!pthread_create(&tid, NULL, (void*(*)(void*))start, arg)) {
+             return((PRThread *) tid);
+         }
+         else {
+@@ -573,7 +573,7 @@ static PRInt32 RunDirTest(void)
+ 
+         thrarg.done= 0;
+         t = create_new_thread(PR_USER_THREAD,
+-                              DirTest, &thrarg,
++                              (void (*)(void *))DirTest, &thrarg,
+                               PR_PRIORITY_NORMAL,
+                               PR_LOCAL_THREAD,
+                               PR_UNJOINABLE_THREAD,
+-- 
+2.39.1
+
diff --git a/meta-oe/recipes-support/nspr/nspr_4.29.bb b/meta-oe/recipes-support/nspr/nspr_4.29.bb
index b60de08d2a..c9215fc275 100644
--- a/meta-oe/recipes-support/nspr/nspr_4.29.bb
+++ b/meta-oe/recipes-support/nspr/nspr_4.29.bb
@@ -12,6 +12,7 @@ SRC_URI = "http://ftp.mozilla.org/pub/nspr/releases/v${PV}/src/nspr-${PV}.tar.gz
            file://0002-Add-nios2-support.patch \
            file://0001-md-Fix-build-with-musl.patch \
            file://Makefile.in-remove-_BUILD_STRING-and-_BUILD_TIME.patch \
+           file://0001-Fix-Wincompatible-function-pointer-types.patch \
            file://nspr.pc.in \
 "
 
-- 
2.47.1


