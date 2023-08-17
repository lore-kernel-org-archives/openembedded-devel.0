Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06823C2FC0F
	for <webhook@archiver.kernel.org>; Thu, 17 Aug 2023 00:49:06 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web10.176852.1692233340579951631
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Aug 2023 17:49:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=sVcezz/y;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-26b2beae166so3162397a91.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 17:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692233340; x=1692838140;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4jcF+paSnnKM5kXzRSfDH5ofI/Cl6xpWFc1Us+C2EB0=;
        b=sVcezz/ywQLu70tI4MOOXZZcpUZB9S1nD8cl4Y98pE3RlHrzw47/OInnqfikSAyAkB
         7ZHk1PYaklEC354YFTL1Y4Y7QGhh1ztsJ8wgHuNQaaMXV/zdjla8xjsK7F7tFJPcy8+p
         EZd4i2lM1B43D4SfhEaf+F/+ftGaQDz576xlVHSvwbv0Y/0d4ILQsS3Bh0FXZMUWjFus
         lz+3KlvTtJDOiXhOvHCz+HeNWRPWT/b71eY5ykHwph8iFZZeSjHG/5/206PEarCLviVL
         HFFYTjCa2in6KpcxKHqCQyudR/3h5QlAWCdTF8A+Uae/fv0UYQJntpFfPDgwmBtnDIK5
         TEPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692233340; x=1692838140;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4jcF+paSnnKM5kXzRSfDH5ofI/Cl6xpWFc1Us+C2EB0=;
        b=ehQ+YQ0POjzV/VOfLZuq3YBqCNQu6PDiFKKSIiyIkaFDgmisT646HziFPq04k4pZeM
         vjSsxDGxDQFyH7erQvBkK/FGNfLOBUDw3cgAlWED62K2bza3awSz/b4EbPFNulqIpsyf
         oqc8WlZmRGBuylogbngrc4udNpsWK0388w/kicBH91w7+a07JVR7O98E0W+sP6M54FFM
         jE4AtNXIdrLxFKBnVPEfY0I72fKVv/rbk229Wq9VNHmFlwfQzHBvu4HNvgw2AruS8p8i
         i4Yo8n6l3bdMjGkn/41DYfSoWFEiJhE5cwSvwc555bOa325QM/w7/1o4le607IWNN/05
         uBhQ==
X-Gm-Message-State: AOJu0Yw91dzqoRUt8GSsiKmAkNy1zse2U2EOAFwdvllLE9NWFcSfd3OU
	MEHPvqjWyrdh/BxjyA36lRFdJy8wGxUqew==
X-Google-Smtp-Source: AGHT+IGC9GL97IvA06z5m8SnnSsMIq1BME6kMYb3LI0OGwzR3O7dfSb+gxzjxt2+AmOdkKirDNee+g==
X-Received: by 2002:a17:90b:189:b0:263:72c5:9ac6 with SMTP id t9-20020a17090b018900b0026372c59ac6mr2829086pjs.11.1692233339675;
        Wed, 16 Aug 2023 17:48:59 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::ed55])
        by smtp.gmail.com with ESMTPSA id bg23-20020a17090b0d9700b0026b70d2a8a2sm326688pjb.29.2023.08.16.17.48.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 17:48:59 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH] python3-protobuf: Fix build errors seen with clang
Date: Wed, 16 Aug 2023 17:48:57 -0700
Message-ID: <20230817004857.583272-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Aug 2023 00:49:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104445

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...st-uintptr_t-types-to-upb_MessageDef.patch | 57 +++++++++++++++++++
 .../python/python3-protobuf_4.24.0.bb         |  2 +-
 2 files changed, 58 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-protobuf/0001-message.c-Cast-uintptr_t-types-to-upb_MessageDef.patch

diff --git a/meta-python/recipes-devtools/python/python3-protobuf/0001-message.c-Cast-uintptr_t-types-to-upb_MessageDef.patch b/meta-python/recipes-devtools/python/python3-protobuf/0001-message.c-Cast-uintptr_t-types-to-upb_MessageDef.patch
new file mode 100644
index 0000000000..89315e3a7d
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-protobuf/0001-message.c-Cast-uintptr_t-types-to-upb_MessageDef.patch
@@ -0,0 +1,57 @@
+From 8ce4b50b210d3c0f8de40156d4ba7827bfe16b21 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 16 Aug 2023 17:36:19 -0700
+Subject: [PATCH] message.c: Cast uintptr_t types to upb_MessageDef
+
+This fixes build with clang
+
+python/message.c:1238:49: error: incompatible integer to pointer conversion passing 'uintptr_t' (aka 'unsigned long') to parameter of type 'const upb_MessageDef *' (aka 'const struct upb_MessageDef *') [-Wint-conversion]
+ 1238 |                        upb_MessageDef_MiniTable(other->def),
+      |                                                 ^~~~~~~~~~
+/mnt/b/yoe/master/build/tmp/work/cortexa72-cortexa53-crypto-yoe-linux/python3-protobuf/4.24.0/protobuf-4.24.0/upb/reflection/message_def.h:138:69: note: passing argument to parameter 'm' here
+  138 | const upb_MiniTable* upb_MessageDef_MiniTable(const upb_MessageDef* m);
+      |                                                                     ^
+python/message.c:1609:69: error: incompatible integer to pointer conversion passing 'uintptr_t' (aka 'unsigned long') to parameter of type 'const upb_MessageDef *' (aka 'const struct upb_MessageDef *') [-Wint-conversion]
+ 1609 |       upb_Message_DeepClone(self->ptr.msg, upb_MessageDef_MiniTable(self->def),
+      |                                                                     ^~~~~~~~~
+/mnt/b/yoe/master/build/tmp/work/cortexa72-cortexa53-crypto-yoe-linux/python3-protobuf/4.24.0/protobuf-4.24.0/upb/reflection/message_def.h:138:69: note: passing argument to parameter 'm' here
+  138 | const upb_MiniTable* upb_MessageDef_MiniTable(const upb_MessageDef* m);
+      |                                                                     ^
+python/message.c:1611:44: error: incompatible integer to pointer conversion passing 'uintptr_t' (aka 'unsigned long') to parameter of type 'const upb_MessageDef *' (aka 'const struct upb_MessageDef *') [-Wint-conversion]
+ 1611 |   PyObject* ret = PyUpb_Message_Get(clone, self->def, arena);
+      |                                            ^~~~~~~~~
+
+Upstream-Status: Submitted [https://github.com/protocolbuffers/upb/pull/1492]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ python/message.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/python/message.c b/python/message.c
+index a01ce16..c418b84 100644
+--- a/python/message.c
++++ b/python/message.c
+@@ -1235,7 +1235,7 @@ static PyObject* PyUpb_Message_CopyFrom(PyObject* _self, PyObject* arg) {
+   Py_DECREF(tmp);
+ 
+   upb_Message_DeepCopy(self->ptr.msg, other->ptr.msg,
+-                       upb_MessageDef_MiniTable(other->def),
++                       upb_MessageDef_MiniTable((const upb_MessageDef*)other->def),
+                        PyUpb_Arena_Get(self->arena));
+   PyUpb_Message_SyncSubobjs(self);
+ 
+@@ -1606,9 +1606,9 @@ PyObject* DeepCopy(PyObject* _self, PyObject* arg) {
+ 
+   PyObject* arena = PyUpb_Arena_New();
+   upb_Message* clone =
+-      upb_Message_DeepClone(self->ptr.msg, upb_MessageDef_MiniTable(self->def),
++      upb_Message_DeepClone(self->ptr.msg, upb_MessageDef_MiniTable((const upb_MessageDef*)self->def),
+                             PyUpb_Arena_Get(arena));
+-  PyObject* ret = PyUpb_Message_Get(clone, self->def, arena);
++  PyObject* ret = PyUpb_Message_Get(clone, (const upb_MessageDef*)self->def, arena);
+   Py_DECREF(arena);
+ 
+   return ret;
+-- 
+2.41.0
+
diff --git a/meta-python/recipes-devtools/python/python3-protobuf_4.24.0.bb b/meta-python/recipes-devtools/python/python3-protobuf_4.24.0.bb
index fdc80b7015..4f7fdf7599 100644
--- a/meta-python/recipes-devtools/python/python3-protobuf_4.24.0.bb
+++ b/meta-python/recipes-devtools/python/python3-protobuf_4.24.0.bb
@@ -6,7 +6,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=53dbfa56f61b90215a9f8f0d527c043d"
 
 inherit pypi setuptools3
-
+SRC_URI += "file://0001-message.c-Cast-uintptr_t-types-to-upb_MessageDef.patch"
 SRC_URI[sha256sum] = "5d0ceb9de6e08311832169e601d1fc71bd8e8c779f3ee38a97a78554945ecb85"
 
 # http://errors.yoctoproject.org/Errors/Details/184715/
-- 
2.41.0


