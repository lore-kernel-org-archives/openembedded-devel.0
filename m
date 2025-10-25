Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43DAACCD1BF
	for <webhook@archiver.kernel.org>; Sat, 25 Oct 2025 03:40:24 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web11.955.1761363623442427288
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Oct 2025 20:40:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=F7o795Kq;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b6a73db16efso2502025a12.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 24 Oct 2025 20:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761363622; x=1761968422; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WquMLdq+/LOsaJSQyfYoI8mwBYiR9IEErOA8F9FoSV0=;
        b=F7o795KqabAQfRtEj2DAsVjKVjaNNqJiObYI4tqeU31gPIW18i6yA+Sx17mW6toLXk
         ekukG+SelJQUyxSWF0MKTH+Hb4xbiFfgjOlZba2YB53zdoU1m3ywYel6XQDLgwamzfxU
         URSMWpO2HwFJvYakmvn+HCMv7VOFbwH9SUtUTu0q6NGWAph8YXEbkU9YmaQyp1yHGuyp
         Kz/e9tD0ny5o3QuPvZ92BjEiroJ4T84QHQWscUdOVd+cwlPye2knvf8+ER3yv846p0ld
         Jy09UeMqJtXjRmn2c6Px91kMM6C8GUWa2U/T6EXEhRoZDFvgeu/qiom21FqFRIzvuLgZ
         V3IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761363622; x=1761968422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WquMLdq+/LOsaJSQyfYoI8mwBYiR9IEErOA8F9FoSV0=;
        b=PZ0YIyDBgLaJpFx9LBdELUbPDgZqCunihlxpuG2WsB5UsiXdDUF0VfIF8ku088d+rJ
         VUXNrus+bZpvWnIyiJtp4ljTBxwoB0QOKdKEW8DmDbGNmN5dX/Q9IMT6yZ26zKWs6krW
         AJeWAJvytuo579SMHcY1MttEiHgY1+VjWdrBLMebLUc4oUI+FlisDkvodH0fNoWH/RZR
         QWnwXp6JhLBRILIhDRYH+VP7HToClWrh5ZTYhLTzIYoj9a2v4rM8R8++FqqF+1JOhHfQ
         K51M7VrTW6zzemvLu+UvRJaqePHIPdThgIgqE4hKmF/hNAFzqFmRy1iSaZS4J/2WJ6r7
         +EjA==
X-Gm-Message-State: AOJu0YzAs48Jj219ofvT0iqT1SxQUuXnc2FFGKh9xb274pw6qgpK5orN
	wLDqKx84UAMsTEjOcoWkigj3L6IEpUUlzQeGySEeFqqlPEtnzLCgBHYRuCkiWgNz
X-Gm-Gg: ASbGncut4hwYL6dDoO3KriHznDtjL+HFoc9oQ9Jz8bfr4hlhYvShJaazGixvFvkfjq+
	w/+qQS/U6Z27xWLnuSXDJYDzdJBp9PIW+PNt5OW904mM95jMzyuO4G336MGHdAgh87VonNEOYKM
	O7iMdbpQP6Q5IkiJdHEdZLjR7AbwLwH7vmcj3tN85lWDZLBfQIeo7EL8+/oEr7thfRCchFGzLI7
	GP8EnfugjvaQ+z6HlG5fwRiIhPd9HI0p8zLVnIOXSc9zJjfnpA3qCrjkOIOrs+bsUap59k3+DxT
	WdWn7n5gzzUFgR1S3ehZrgKW4BQuIszp5LlcLZYIDfutauUwy/gS3ZQUoW3Xg0v5Nu/d/FkHvbN
	ypWrSGBgxDBYmUk1rqxcXE7oO9TGVY7j7lbbRs/4IgaqwWWVcMejyD12xLBYBsN51Yz0tuCgDYx
	YP+q7J4MidFwgAUQDp3uEq5mTS60xo4+kn9rnCxBPJZ/m4QFFR9pbmOcULPjVwhg==
X-Google-Smtp-Source: AGHT+IEBuble6zKix8NgW8KcPnyAtKdqd3xAgELKdXkbZBwYR0sPWrRwrjop0NJiakQLbWzIye95iQ==
X-Received: by 2002:a17:902:cec7:b0:272:f9c3:31f7 with SMTP id d9443c01a7336-2948ba5b3bamr55412185ad.50.1761363622454;
        Fri, 24 Oct 2025 20:40:22 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::9dbe])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a414012bf4sm808487b3a.1.2025.10.24.20.40.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 20:40:22 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 03/11] rocksdb: stdint.h needs to included in transaction_db_mutex.h
Date: Fri, 24 Oct 2025 20:40:08 -0700
Message-ID: <20251025034017.2071643-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251025034017.2071643-1-raj.khem@gmail.com>
References: <20251025034017.2071643-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 25 Oct 2025 03:40:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120987

It uses int64_t type

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...eckpoint.h-Add-missing-includes-cstdint.patch | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-dbs/rocksdb/files/0001-checkpoint.h-Add-missing-includes-cstdint.patch b/meta-oe/recipes-dbs/rocksdb/files/0001-checkpoint.h-Add-missing-includes-cstdint.patch
index a872be5b54..9950be4c90 100644
--- a/meta-oe/recipes-dbs/rocksdb/files/0001-checkpoint.h-Add-missing-includes-cstdint.patch
+++ b/meta-oe/recipes-dbs/rocksdb/files/0001-checkpoint.h-Add-missing-includes-cstdint.patch
@@ -27,10 +27,8 @@ Signed-off-by: mark.yang <mark.yang@lge.com>
  include/rocksdb/utilities/checkpoint.h | 1 +
  1 file changed, 1 insertion(+)

-Index: git/include/rocksdb/utilities/checkpoint.h
-===================================================================
---- git.orig/include/rocksdb/utilities/checkpoint.h
-+++ git/include/rocksdb/utilities/checkpoint.h
+--- a/include/rocksdb/utilities/checkpoint.h
++++ b/include/rocksdb/utilities/checkpoint.h
 @@ -7,6 +7,7 @@

  #pragma once
@@ -39,3 +37,13 @@ Index: git/include/rocksdb/utilities/checkpoint.h
  #include <string>
  #include <vector>

+--- a/include/rocksdb/utilities/transaction_db_mutex.h
++++ b/include/rocksdb/utilities/transaction_db_mutex.h
+@@ -5,6 +5,7 @@
+
+ #pragma once
+
++#include <cstdint>
+ #include <memory>
+
+ #include "rocksdb/status.h"

