Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41C66E6FE39
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 14:14:37 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web11.22666.1695392074867559187
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Sep 2023 07:14:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Q5HF+S3L;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-530ce262ab2so2470667a12.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 22 Sep 2023 07:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695392073; x=1695996873; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XcwZ2spV2ao9RTG8mUqTFLd9BtGD8uQIbIsI990cOZY=;
        b=Q5HF+S3Lx7Sx0+PsrQfhGcEI2zdmHetl31QK34/sc0hW/ZqmHwcPICKl1NaYuueRF6
         PUzboECbrDhYkMp43pAEA3ibLL9EHS4TfMthDZ0BJlM2y9kfCVCcvlneSeA3A94HJlIE
         7tA2TMm2f8CnGW72JHBit0F6Vws0l2szYROWNGKy3OSafMwtvt82cVoB/+tWn74m28CD
         sO9myZjmC8NiAgm2wZGJvLD0xYuQCXJpmbWIQ1YL71pnujVmJXEO288VS4vzDCOki4N3
         OsYWnYzUTrd4iKA8OVmn48vFFkSwsgblBOLgA5xc4HqkIQujGZ8Y61UiTJ7JBUfvmzS0
         xLVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695392073; x=1695996873;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XcwZ2spV2ao9RTG8mUqTFLd9BtGD8uQIbIsI990cOZY=;
        b=UQXVTPOhpmw01b64N1HmA6G38Nm3ooy8h/r3H/AzKSu3OqKO/S7X53C5OPMznD2hrS
         IrS9Qbow9MvaT6GQKlafJnRvsvsKp2FvpbEaN7Mkp9WfdRnBW5AzNT4nimvNnxIolHis
         n3SXZXutQ/Xopbjf5gFyFq04beY0pqkT9psw6JZUcBBxu9NHOQv0vITkwgpqpqJAYcUu
         QeF9qMM4FHVDel6Y8qnLaepbQ8pDEmxt9tagSSDScCVY/n7E69IhgDYkAkslpmOOccVY
         oSqapZ2q2XfsoGgvSG5DxJ89kWkc/eVQKpGH1I282JKyTb8leBlfm8RQTYocoQD5m4SM
         3lWA==
X-Gm-Message-State: AOJu0YyWfU0ho4J5idWui06Q5YkkdBrt8uN7wBFZCw6udMvw7OeuMbWh
	5smI5xyXaMVnPW8fhHwSVS6Nyk6uki4=
X-Google-Smtp-Source: AGHT+IELzg+FwXt+WIGhnG9lC1strX4MRqg2XeEs/nQ+dgGOoJ3v76Zwu/YjEClBUXSUVYDOsNR6Ng==
X-Received: by 2002:aa7:c407:0:b0:51a:3159:53c7 with SMTP id j7-20020aa7c407000000b0051a315953c7mr8462843edq.30.1695392073057;
        Fri, 22 Sep 2023 07:14:33 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id m26-20020aa7c49a000000b00530a0ceb4a0sm2356464edq.37.2023.09.22.07.14.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 07:14:32 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH 2/2] mongodb: Fix build on 32bit
Date: Fri, 22 Sep 2023 16:14:23 +0200
Message-ID: <20230922141423.2672238-2-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230922141423.2672238-1-martin.jansa@gmail.com>
References: <20230922141423.2672238-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Sep 2023 14:14:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105070

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 .../mongodb/0001-Fix-build-on-32bit.patch     | 38 +++++++++++++++++++
 .../recipes-dbs/mongodb/mongodb_git.bb        |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Fix-build-on-32bit.patch

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Fix-build-on-32bit.patch b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Fix-build-on-32bit.patch
new file mode 100644
index 0000000000..4abc044151
--- /dev/null
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Fix-build-on-32bit.patch
@@ -0,0 +1,38 @@
+From b172ebe7e709b10338c1b260310dacc15c557cff Mon Sep 17 00:00:00 2001
+From: Martin Jansa <martin.jansa@gmail.com>
+Date: Fri, 22 Sep 2023 15:37:29 +0200
+Subject: [PATCH] Fix build on 32bit
+
+* fixes:
+  src/mongo/util/net/http_client_curl.cpp: In function 'size_t mongo::{anonymous}::ReadMemoryCallback(char*, size_t, size_t, void*)':
+  src/mongo/util/net/http_client_curl.cpp:172:21: error: no matching function for call to 'min(size_t, long unsigned int)'
+    172 |             std::min(size * nitems, static_cast<unsigned long>(bufReader->remaining()));
+        |             ~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+* reported in:
+  https://jira.mongodb.org/browse/SERVER-73007
+  but will probably get closed like:
+  mongodb/0001-Fix-type-mismatch-on-32bit-arches.patch
+  submitted in:
+  https://jira.mongodb.org/browse/SERVER-74633
+  as they don't support 32bit builds
+
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+Upstream-Status: Pending
+---
+ src/mongo/util/net/http_client_curl.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/mongo/util/net/http_client_curl.cpp b/src/mongo/util/net/http_client_curl.cpp
+index 57290d0f8ed..f251fe2a550 100644
+--- a/src/mongo/util/net/http_client_curl.cpp
++++ b/src/mongo/util/net/http_client_curl.cpp
+@@ -169,7 +169,7 @@ size_t ReadMemoryCallback(char* buffer, size_t size, size_t nitems, void* instre
+ 
+     if (bufReader->remaining() > 0) {
+         size_t readSize =
+-            std::min(size * nitems, static_cast<unsigned long>(bufReader->remaining()));
++            std::min(size * nitems, static_cast<size_t>(bufReader->remaining()));
+         auto buf = bufReader->readBytes(readSize);
+         memcpy(buffer, buf.rawData(), readSize);
+         ret = readSize;
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
index f1a508f3f2..037d58cf17 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
@@ -35,6 +35,7 @@ SRC_URI = "git://github.com/mongodb/mongo.git;branch=v4.4;protocol=https \
            file://0001-free_mon-Include-missing-cstdint.patch \
            file://0001-apply-msvc-workaround-for-clang-16.patch \
            file://0001-Fix-type-mismatch-on-32bit-arches.patch \
+           file://0001-Fix-build-on-32bit.patch \
            "
 SRC_URI:append:libc-musl ="\
            file://0001-Mark-one-of-strerror_r-implementation-glibc-specific.patch \
-- 
2.42.0


