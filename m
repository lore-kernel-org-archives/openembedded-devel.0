Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A57BC54794
	for <webhook@archiver.kernel.org>; Sat, 21 Jan 2023 18:01:47 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.2070.1674324098542295303
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 21 Jan 2023 10:01:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qiFVLJbn;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id g23so7941015plq.12
        for <openembedded-devel@lists.openembedded.org>; Sat, 21 Jan 2023 10:01:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jb05g9PJW9t4tuOdTDVkNr09sttP1dEG7ShiZEJtz6I=;
        b=qiFVLJbn+tEKASmMO3s3bl+xydB8Ghg6Z3ojOvqMwhruGRNI+QUDCb0Uu6ByRdpatN
         XkgBHpJ0t5S6qKa1u+4NgBzZMJ/1Svtwn0kiYe8uVE5TqoyRI4/igtzSbitAq3Ry9PPz
         zuWyfQI7LzLvvpwy5eqTvaovxanU3PE8wg9nt+B4fKUmoWKpWbKb+BwzlpkQzNV1Ivlk
         T+oK2lFojJtuCNzSr284BZs8BmdQnL3W823BuCiLWcTNBZsOIs/LHgeL+q5rEoQOoNvL
         Sqksh2uOg6/w1moTz4p3deic+SjaF5mUc56P8kdfS/Zn0iVrONJPWV6Al9Y7zA7XD+nf
         8uog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jb05g9PJW9t4tuOdTDVkNr09sttP1dEG7ShiZEJtz6I=;
        b=FCtxMaOfmqX2k9zTNVO261xWMu93XkJoiV5DShXqkl1uVfH8ILezWvhc/9xomR7Hcf
         Ig3JQblmWvfGBRMXBd/HvEkXMf1FRG2CGqqSKZg2BYQWcMI/Gz+7Wrh7A11+AlgLJq5E
         GE00jxgMnalRAEJdD5WCqomwvhEz5M/f5QGingh6y+dB6hwCfziEiebvB6wbmgZReD/Y
         IkjPsltG3odhV9Iw9alpugzQqRqqOpIwIMf4cSM5zW0zAjoczWF+S0F9S2SnnRt0mn3A
         XcI+WjIuQnNOW3rCU53wxPeKHG5+A5QI5sdyEQwKTz4Ya7fbNO8TSkVGpa+z/3yUuctS
         Yzyg==
X-Gm-Message-State: AFqh2kob96JHeozbPlZQ4V+oqW2umsx1TBn05srcjsv6IGSmq6c/v0Na
	y7MahDUP1Gw9sjsBzCNqfYjoUg9NYbASqA==
X-Google-Smtp-Source: AMrXdXtogWT1qAIGNm8963BDFfVy+e+K+02yKBSiQFK/PB5WtVZm2Fr88K3aEZ6o6GYDpgYlQlzonA==
X-Received: by 2002:a17:90a:5793:b0:229:1f6d:47fc with SMTP id g19-20020a17090a579300b002291f6d47fcmr20226207pji.41.1674324097721;
        Sat, 21 Jan 2023 10:01:37 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::aee3])
        by smtp.gmail.com with ESMTPSA id d15-20020a17090a02cf00b00226c2d90c04sm3623583pjd.38.2023.01.21.10.01.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jan 2023 10:01:37 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 17/30] nspr: Fix build with clang16
Date: Sat, 21 Jan 2023 10:01:08 -0800
Message-Id: <20230121180121.1229895-17-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230121180121.1229895-1-raj.khem@gmail.com>
References: <20230121180121.1229895-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 21 Jan 2023 18:01:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100684

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...Wincompatible-function-pointer-types.patch | 39 +++++++++++++++++++
 meta-oe/recipes-support/nspr/nspr_4.35.bb     |  1 +
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
diff --git a/meta-oe/recipes-support/nspr/nspr_4.35.bb b/meta-oe/recipes-support/nspr/nspr_4.35.bb
index c8cb618bc9..f8d329398b 100644
--- a/meta-oe/recipes-support/nspr/nspr_4.35.bb
+++ b/meta-oe/recipes-support/nspr/nspr_4.35.bb
@@ -12,6 +12,7 @@ SRC_URI = "http://ftp.mozilla.org/pub/nspr/releases/v${PV}/src/nspr-${PV}.tar.gz
            file://0001-md-Fix-build-with-musl.patch \
            file://Makefile.in-remove-_BUILD_STRING-and-_BUILD_TIME.patch \
            file://0001-config-nspr-config.in-don-t-pass-LDFLAGS.patch \
+           file://0001-Fix-Wincompatible-function-pointer-types.patch \
            file://nspr.pc.in \
            "
 
-- 
2.39.1


