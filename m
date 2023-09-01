Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B902CA0FEA
	for <webhook@archiver.kernel.org>; Fri,  1 Sep 2023 05:37:06 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web10.410.1693546616355394709
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 31 Aug 2023 22:36:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=GEll2hWg;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-569deb93999so1192796a12.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 31 Aug 2023 22:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693546615; x=1694151415; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e5msWkyBvzJlIM5yGdjj0f4+eONYnfW5Mkt8qajTEc4=;
        b=GEll2hWgsU42unJ/Vn1tBPzG9aTf/hUsO+z9QAQIQT+ABa1+BvZEa8SCQKK5Hf5SPc
         3HVkrxH3YlV8GXIM6IwkDvaeTd0StDX+MRvq3HSNSOyGI6Dirdx39j+QqHdQDcvCZ9+i
         987IK+4BK3Ggct39//9Lim9s0KgOvSQFEbbqkf99++vf1nhp0xjtrvg8ZjY7jjiAQmZi
         8D/ZE9YCKJTDuNaa8iXakIUBBvEY5hVR32d7DP1zq1Z6gmGFK/FATlkwnG0300RMcuJd
         4mXn5y/S5854gk/wt48puhMZqiW6JRVjTrOvRG9qetEGpQlrr5KFY5+AbpPvf2Ze6hrx
         oALg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693546615; x=1694151415;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e5msWkyBvzJlIM5yGdjj0f4+eONYnfW5Mkt8qajTEc4=;
        b=O8jC6J5rtZSVYc8JnrNKPe51hhiXAIlMs48EovP6ox99xHJqCgc6fvI1rWwvoRa7Ta
         LycHW8hK1jzJ+qf+VbHMetWxxHsE6KQmSKEg2hKj8O1zfzZ9L9wEBSbmr5XcQv/r16nE
         jfnJJACZ6+wKkYJDnXAp1LXxYBiy/qh+UJsEJMypTy0dktGblV2RiaAZrsw6hj0ngT3x
         mToedJsG8Fu6v3NaVm32gUwYRoxRJlva3uMSpbGqHkqt5tAWDqWA6jUS0Xqr8JvhwcsO
         kRasNqCoN4E4Yt/+Aq8peC8OsN5aXdFWTUYa7N7+eVjTf/uB+ik9DNrxCyuoQef50VBW
         cfzQ==
X-Gm-Message-State: AOJu0Yzebgi/Y88kTZh/VO4rUUlkx7dhN/3yxGVLVxgEsME0YFRjXfL+
	v0grTcCvtYnUOIUKEj3IHRpc7OrL0acuNw==
X-Google-Smtp-Source: AGHT+IELDMlrfNbnYMDUaM7dYAOXnszAOsj0WEdRMYr716pihqrTrEFwKyw8k+fzp5ag/GHHmX81qw==
X-Received: by 2002:a05:6a20:3d8b:b0:14c:fadb:4e5e with SMTP id s11-20020a056a203d8b00b0014cfadb4e5emr1999838pzi.5.1693546615325;
        Thu, 31 Aug 2023 22:36:55 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::71d2])
        by smtp.gmail.com with ESMTPSA id c11-20020aa78c0b000000b0068a538cc7adsm2143153pfd.52.2023.08.31.22.36.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Aug 2023 22:36:54 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH] networkmanager: Fix build on musl
Date: Thu, 31 Aug 2023 22:36:52 -0700
Message-ID: <20230901053652.1398681-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 01 Sep 2023 05:37:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104688

musl does not need _IO_stdin_used, since its not provided by toolchain
runtime ( crt files ) lld linker complains about undefined global symbol
on musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...scripts-Do-not-export-_IO_stdin_used.patch | 41 +++++++++++++++++++
 .../networkmanager/networkmanager_1.44.0.bb   |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-linker-scripts-Do-not-export-_IO_stdin_used.patch

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-linker-scripts-Do-not-export-_IO_stdin_used.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-linker-scripts-Do-not-export-_IO_stdin_used.patch
new file mode 100644
index 0000000000..71ad01f51c
--- /dev/null
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-linker-scripts-Do-not-export-_IO_stdin_used.patch
@@ -0,0 +1,41 @@
+From 3ee6967689b3da30cc4551885d8bcdd44a7a9b52 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 31 Aug 2023 21:16:55 -0700
+Subject: [PATCH] linker-scripts: Do not export _IO_stdin_used
+
+This is glibc specific and it is not needed with musl.
+See https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=835550
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ linker-script-binary.ver               | 1 -
+ tools/create-exports-NetworkManager.sh | 1 -
+ 2 files changed, 2 deletions(-)
+
+diff --git a/linker-script-binary.ver b/linker-script-binary.ver
+index a2780c0..f030d35 100644
+--- a/linker-script-binary.ver
++++ b/linker-script-binary.ver
+@@ -1,6 +1,5 @@
+ {
+ global:
+-	_IO_stdin_used;
+ local:
+ 	*;
+ };
+diff --git a/tools/create-exports-NetworkManager.sh b/tools/create-exports-NetworkManager.sh
+index ef4b381..60865ad 100755
+--- a/tools/create-exports-NetworkManager.sh
++++ b/tools/create-exports-NetworkManager.sh
+@@ -54,7 +54,6 @@ get_symbols_nm () {
+ 
+ get_symbols_explicit() {
+     cat <<EOF | _sort
+-_IO_stdin_used
+ EOF
+ }
+ 
+-- 
+2.42.0
+
diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.44.0.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.44.0.bb
index 9ecb2f12f6..84ef70c9af 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.44.0.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.44.0.bb
@@ -31,6 +31,7 @@ SRC_URI = " \
     file://enable-dhcpcd.conf \
     file://enable-iwd.conf \
 "
+SRC_URI:append:libc-musl = " file://0001-linker-scripts-Do-not-export-_IO_stdin_used.patch"
 
 SRC_URI[sha256sum] = "edca09637d182f806b3b12d8c5623d7badbd73ccca1ae63be20d2f298779fb9f"
 
-- 
2.42.0


