Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 798CAC5321D
	for <webhook@archiver.kernel.org>; Mon, 26 Aug 2024 21:30:16 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.63515.1724707810281639895
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Aug 2024 14:30:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dfph801q;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7140ff4b1e9so3805102b3a.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 26 Aug 2024 14:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724707809; x=1725312609; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9Va/N9Pe2E7YppZufMJ3kk2EnJItgL0ei+66CoMG18E=;
        b=dfph801qqq2IuASWOu7OcmaWJcIlTaG74j2qVQ7olYGMHZil+FbCX3nndkZe1cSsK2
         pFKqj3Br1zqsZA63D+WLIOZWYxxa7FZRwvwFW05sZmZLGEyans3hgTDFS+VT8mG71Jzv
         259oWigbOhBRX/32y0lYOt1JqRdRRZ5s0/GZWBnRIZjhVM5io5oZMhtbJxT6VFTKhP2Z
         NgSA7tQGIrN00R4vbSylAxs3sES9kU/oJEjcRrkEixdveZ9pdfBmLQ9ODfAlYlmhvlTi
         eGKLcDA0Jk4vuctNLiM6+pyj5LsMRDlq3vbD//kJuzYsB+fujiwbT7mjadmPNWkW5eqr
         qAYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724707809; x=1725312609;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9Va/N9Pe2E7YppZufMJ3kk2EnJItgL0ei+66CoMG18E=;
        b=vOHez5TD/dm2+ov4J6iM85fewvDD0n9SpwqZAJ739EEjmbqjs89wdr3wnpbl3cs5yU
         Thc1CcORSe6emjow+TDwJwnzOE7We3bGeZ7OBX9zPncvyzeolrqaFPoU1iySjqImWzS8
         xgjdewHMO2Xc7Qjt17+9WEdqt40fw7lTldmm+M/83y8K5lHvyPhADwWwjw5Zby1Peu6K
         pkUoHuhFrolQQ27iBYSZyof49IkjLto7Zz9lViSlQr3DQpaKjuaD2GYkfXd/sAA2ock3
         9zvB8vUaT+U8WnD+EIMUSPMGSPYDablmf+MTX71eQXnmgE62jVBL72Vy7SaBe/84QBmQ
         ATrw==
X-Gm-Message-State: AOJu0YyqV5rMaLqyKC7t90T2ZYjEDfWBwjBWBspistGZO78FMPvOM1DB
	bCebK7SPJ3XJrxDPgwcYrOe7GvsvdXGNPzb9CgqF8riF7LgCDEpiaiLfCA==
X-Google-Smtp-Source: AGHT+IHCWPwQoAE08LhFLe4YtwZDT9KaI3heFB8xoN+/mqkYY3iX4IehsGKKf4XjIiE0OuU4+O53zg==
X-Received: by 2002:a05:6a20:e605:b0:1c8:92ed:7c5d with SMTP id adf61e73a8af0-1ccc09accdfmr941994637.54.1724707809195;
        Mon, 26 Aug 2024 14:30:09 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:9d80:4380::2696])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-714342fc0b0sm7681845b3a.141.2024.08.26.14.30.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 14:30:08 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH] bluealsa: Update cython patch to latest upstream patch
Date: Mon, 26 Aug 2024 14:30:05 -0700
Message-ID: <20240826213005.596061-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 26 Aug 2024 21:30:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111969

This patch reflects the latest revision submitted upstream

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...0001-meson-DO-not-emit-absolute-path-when-S-B.patch | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-networking/recipes-connectivity/blueman/blueman/0001-meson-DO-not-emit-absolute-path-when-S-B.patch b/meta-networking/recipes-connectivity/blueman/blueman/0001-meson-DO-not-emit-absolute-path-when-S-B.patch
index 10f89a124c..6e48b70243 100644
--- a/meta-networking/recipes-connectivity/blueman/blueman/0001-meson-DO-not-emit-absolute-path-when-S-B.patch
+++ b/meta-networking/recipes-connectivity/blueman/blueman/0001-meson-DO-not-emit-absolute-path-when-S-B.patch
@@ -1,7 +1,7 @@
-From 18af739fd96960bbc8c5db5dd290d2f9134cd347 Mon Sep 17 00:00:00 2001
+From 4947abc5ede2dc356f011b7c45f6760c9c2ce9f1 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 14 Aug 2024 21:26:24 -0700
-Subject: [PATCH] meson: DO not emit absolute path when S != B
+Subject: [PATCH] meson: Do not emit absolute path when S != B
 
 build systems like OE build outside sourcetree in such cases it works
 ok but cython resolves the input file to absolute path and that gets
@@ -17,14 +17,14 @@ See cython discussion on [1]
 
 [1] https://github.com/cython/cython/issues/5949
 
-Upstream-Status: Submitted [https://github.com/blueman-project/blueman/pull/2461]
+Upstream-Status: Submitted [https://github.com/blueman-project/blueman/pull/2461] 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  module/meson.build | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/module/meson.build b/module/meson.build
-index 096ad7c8..e3d96f17 100644
+index 096ad7c8..fddef547 100644
 --- a/module/meson.build
 +++ b/module/meson.build
 @@ -4,7 +4,7 @@ blueman_c = custom_target(
@@ -32,7 +32,7 @@ index 096ad7c8..e3d96f17 100644
      output: '_blueman.c',
      input: '_blueman.pyx',
 -    command: [cython, '--output-file', '@OUTPUT@', '@INPUT@'])
-+    command: [cython, '-w', meson.source_root(), '--output-file', meson.build_root() + '/' + '@OUTPUT@', '@INPUT@'])
++    command: [cython, '-w', meson.source_root(), '--output-file', join_paths(meson.build_root(), '@OUTPUT@'), join_paths(meson.build_root(), '@INPUT@')])
  
  sources = [
      blueman_c,

