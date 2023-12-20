Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52397C3DA6E
	for <webhook@archiver.kernel.org>; Wed, 20 Dec 2023 23:01:24 +0000 (UTC)
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
 by mx.groups.io with SMTP id smtpd.web10.34955.1703113280022598514
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Dec 2023 15:01:20 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.45, mailfrom: straka.derek@gmail.com)
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-7ba737ee9b5so9555839f.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 20 Dec 2023 15:01:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703113278; x=1703718078;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1+y2Rqhrv6mRBjBlXChtlMgKvQIx+Mv1FppeCDZ2Mc8=;
        b=koErr/Rnj0DAmbHvLuJudV2YLGuZJUjX2juVT6Y7+2krF3mekh/EC0/fxVBRGTgZrU
         TocGfQ3T0QizXj6aCigRYnkre0DJ6VuoHNvLP31xC+um8Fgm3U64dRsPlRA+QQQidxz/
         6NvTKu26DaGlB/iXGi1EHCy42rckPv80haoSPqUiRHcHHMvf+49z8lblyE5pn7wT9rmI
         oUht/rvS4sdcU9dn1YTUZNhrYIghZSJpbRhSxzLhl9fOyNFA61MGup29AApc8dC/9FTP
         RlTYtNorb5e6z3ejoFOGJWOFOUFeubO8v1+oD2X3tAe0bykt7DfDYhR5sCtN/srNz/9k
         gKrg==
X-Gm-Message-State: AOJu0YzZrQQIPsl4vYcs/LtOWuAK8TJXhJ0k5aLouFnL+Eya/D4kEAav
	D9TRrU0wYgMiU6PIcmIIt8VMyIAjtHY1Ww==
X-Google-Smtp-Source: AGHT+IG3saz8HJTwFcdEohX+IaKIIm11XEkNS0Q+VmmOp8kvOPaI5b/JEMFhLmH9z/VG3WNrZlMnzw==
X-Received: by 2002:a5d:9f4a:0:b0:7b7:720d:3d95 with SMTP id u10-20020a5d9f4a000000b007b7720d3d95mr15564759iot.17.1703113278376;
        Wed, 20 Dec 2023 15:01:18 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id n7-20020a05663831c700b0046ce91ff457sm14154jav.6.2023.12.20.15.01.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 15:01:18 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-protobuf: update to version 4.25.1
Date: Wed, 20 Dec 2023 23:01:09 +0000
Message-Id: <20231220230109.3827292-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Dec 2023 23:01:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107686

Remove patch 0001-message.c-Cast-uintptr_t-types-to-upb_MessageDef.patch
that was incorporated upstream and released in 4.25.1

Signed-off-by: Derek Straka <derek@asterius.io>
---
 ...st-uintptr_t-types-to-upb_MessageDef.patch | 57 -------------------
 ...f_4.24.4.bb => python3-protobuf_4.25.1.bb} |  3 +-
 2 files changed, 1 insertion(+), 59 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-protobuf/0001-message.c-Cast-uintptr_t-types-to-upb_MessageDef.patch
 rename meta-python/recipes-devtools/python/{python3-protobuf_4.24.4.bb => python3-protobuf_4.25.1.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-protobuf/0001-message.c-Cast-uintptr_t-types-to-upb_MessageDef.patch b/meta-python/recipes-devtools/python/python3-protobuf/0001-message.c-Cast-uintptr_t-types-to-upb_MessageDef.patch
deleted file mode 100644
index 89315e3a7..000000000
--- a/meta-python/recipes-devtools/python/python3-protobuf/0001-message.c-Cast-uintptr_t-types-to-upb_MessageDef.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From 8ce4b50b210d3c0f8de40156d4ba7827bfe16b21 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 16 Aug 2023 17:36:19 -0700
-Subject: [PATCH] message.c: Cast uintptr_t types to upb_MessageDef
-
-This fixes build with clang
-
-python/message.c:1238:49: error: incompatible integer to pointer conversion passing 'uintptr_t' (aka 'unsigned long') to parameter of type 'const upb_MessageDef *' (aka 'const struct upb_MessageDef *') [-Wint-conversion]
- 1238 |                        upb_MessageDef_MiniTable(other->def),
-      |                                                 ^~~~~~~~~~
-/mnt/b/yoe/master/build/tmp/work/cortexa72-cortexa53-crypto-yoe-linux/python3-protobuf/4.24.0/protobuf-4.24.0/upb/reflection/message_def.h:138:69: note: passing argument to parameter 'm' here
-  138 | const upb_MiniTable* upb_MessageDef_MiniTable(const upb_MessageDef* m);
-      |                                                                     ^
-python/message.c:1609:69: error: incompatible integer to pointer conversion passing 'uintptr_t' (aka 'unsigned long') to parameter of type 'const upb_MessageDef *' (aka 'const struct upb_MessageDef *') [-Wint-conversion]
- 1609 |       upb_Message_DeepClone(self->ptr.msg, upb_MessageDef_MiniTable(self->def),
-      |                                                                     ^~~~~~~~~
-/mnt/b/yoe/master/build/tmp/work/cortexa72-cortexa53-crypto-yoe-linux/python3-protobuf/4.24.0/protobuf-4.24.0/upb/reflection/message_def.h:138:69: note: passing argument to parameter 'm' here
-  138 | const upb_MiniTable* upb_MessageDef_MiniTable(const upb_MessageDef* m);
-      |                                                                     ^
-python/message.c:1611:44: error: incompatible integer to pointer conversion passing 'uintptr_t' (aka 'unsigned long') to parameter of type 'const upb_MessageDef *' (aka 'const struct upb_MessageDef *') [-Wint-conversion]
- 1611 |   PyObject* ret = PyUpb_Message_Get(clone, self->def, arena);
-      |                                            ^~~~~~~~~
-
-Upstream-Status: Submitted [https://github.com/protocolbuffers/upb/pull/1492]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- python/message.c | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/python/message.c b/python/message.c
-index a01ce16..c418b84 100644
---- a/python/message.c
-+++ b/python/message.c
-@@ -1235,7 +1235,7 @@ static PyObject* PyUpb_Message_CopyFrom(PyObject* _self, PyObject* arg) {
-   Py_DECREF(tmp);
- 
-   upb_Message_DeepCopy(self->ptr.msg, other->ptr.msg,
--                       upb_MessageDef_MiniTable(other->def),
-+                       upb_MessageDef_MiniTable((const upb_MessageDef*)other->def),
-                        PyUpb_Arena_Get(self->arena));
-   PyUpb_Message_SyncSubobjs(self);
- 
-@@ -1606,9 +1606,9 @@ PyObject* DeepCopy(PyObject* _self, PyObject* arg) {
- 
-   PyObject* arena = PyUpb_Arena_New();
-   upb_Message* clone =
--      upb_Message_DeepClone(self->ptr.msg, upb_MessageDef_MiniTable(self->def),
-+      upb_Message_DeepClone(self->ptr.msg, upb_MessageDef_MiniTable((const upb_MessageDef*)self->def),
-                             PyUpb_Arena_Get(arena));
--  PyObject* ret = PyUpb_Message_Get(clone, self->def, arena);
-+  PyObject* ret = PyUpb_Message_Get(clone, (const upb_MessageDef*)self->def, arena);
-   Py_DECREF(arena);
- 
-   return ret;
--- 
-2.41.0
-
diff --git a/meta-python/recipes-devtools/python/python3-protobuf_4.24.4.bb b/meta-python/recipes-devtools/python/python3-protobuf_4.25.1.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-protobuf_4.24.4.bb
rename to meta-python/recipes-devtools/python/python3-protobuf_4.25.1.bb
index 4b530c3b1..3c770e41d 100644
--- a/meta-python/recipes-devtools/python/python3-protobuf_4.24.4.bb
+++ b/meta-python/recipes-devtools/python/python3-protobuf_4.25.1.bb
@@ -6,8 +6,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=53dbfa56f61b90215a9f8f0d527c043d"
 
 inherit pypi setuptools3
-SRC_URI += "file://0001-message.c-Cast-uintptr_t-types-to-upb_MessageDef.patch"
-SRC_URI[sha256sum] = "5a70731910cd9104762161719c3d883c960151eea077134458503723b60e3667"
+SRC_URI[sha256sum] = "57d65074b4f5baa4ab5da1605c02be90ac20c8b40fb137d6a8df9f416b0d0ce2"
 
 # http://errors.yoctoproject.org/Errors/Details/184715/
 # Can't find required file: ../src/google/protobuf/descriptor.proto
-- 
2.34.1


