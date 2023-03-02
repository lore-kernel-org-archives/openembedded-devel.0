Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57D4FC7EE32
	for <webhook@archiver.kernel.org>; Thu,  2 Mar 2023 04:22:07 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web10.7561.1677730920429052731
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Mar 2023 20:22:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=aEs0XYOf;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id 6-20020a17090a190600b00237c5b6ecd7so1545995pjg.4
        for <openembedded-devel@lists.openembedded.org>; Wed, 01 Mar 2023 20:22:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dxeLT+UJkLBqN/hlmc8PclJ6qZkbJCF+Tnbel5pK0hk=;
        b=aEs0XYOfTq5dfYLQuM7p3rOYqX+7MSJCwCOsJqPbW3YPJjcIIO6xP8kZoxzFTimVBw
         SGc/0F3YJADIDO1mGC17ZrnF4eWb797XIwVG8yZW4o7rQOttjfxZDlKx2JiDsnJq7DUR
         /rzAg87IhMYLmxosYLJbDEC8zwalQ5rEnT0uB301dDQqLgp1lp+gnbg8LW0RKQ09RUNU
         /nihhKinQzRalCR4LnmNPLP/CgQc6WoGm1T3/JSqIqQL81aCGWV4MfqD243oYXK+eir/
         SlmERlc96jeqN+b1keX4eGjkWP40iju+Oj7Yc3CrnyWpCJPD1HiVIjEQGSXqNRlGcALp
         JMww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dxeLT+UJkLBqN/hlmc8PclJ6qZkbJCF+Tnbel5pK0hk=;
        b=LwAzepgrik/aywsY+NCPXDcRdTSclERlC5ZN2rimmnkKmCxLcQgoGaTtVph7Gg1jlh
         dm04aVF8O/+SPJAKTZ2oLZBd6M2ToArsKXjyvpiF4l1oTUj8L9UfE9P2cnACkPzKN43M
         vB3SWZJHIoaeUHdJIrPXp5bjqrHeCmFFjFciCvRu5EJ7C9BzBwLYlJVoHvB/ShCgrfcs
         9IU9aUR1R3fu8qO+UmFZzw5ggA55JsEbkeGtwK7mnW51sSKNS2N3mhUbTB9pscO7/AKY
         vVC783Y1HCRvElIk642Dv2+JKqSkqblPrIXW7llqRF3zsXm3kYuBlptS8bzBXjXPxRd2
         NTnw==
X-Gm-Message-State: AO0yUKWX6Nb3Prp+x/Unjd79m8FRFeh0QCId1XdLNIKTx8FjI+Q20sGN
	5s9QxYOI+BOixLwkcIVMRujPjIG+hZo=
X-Google-Smtp-Source: AK7set+Te1K8bUw74YOyFN636bE48txaD+pGEmmQw6oVuoMpjnS6o4WMoV0D+AbUrHKmw/4LN9cG4g==
X-Received: by 2002:a17:902:e842:b0:19a:8ce1:2c55 with SMTP id t2-20020a170902e84200b0019a8ce12c55mr11945630plg.8.1677730919255;
        Wed, 01 Mar 2023 20:21:59 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::1ac4])
        by smtp.gmail.com with ESMTPSA id g3-20020a1709026b4300b00198e346c35dsm9223782plt.9.2023.03.01.20.21.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Mar 2023 20:21:58 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 1/3] python3-lru-dict: Fix function pointer mismatch
Date: Wed,  1 Mar 2023 20:21:54 -0800
Message-Id: <20230302042156.1107335-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Mar 2023 04:22:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101321

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ion-instead-of-PyCFunctionWithKeywor.patch | 37 +++++++++++++++++++
 .../python/python3-lru-dict_1.1.8.bb          |  2 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-lru-dict/0001-lru-Use-PyCFunction-instead-of-PyCFunctionWithKeywor.patch

diff --git a/meta-python/recipes-devtools/python/python3-lru-dict/0001-lru-Use-PyCFunction-instead-of-PyCFunctionWithKeywor.patch b/meta-python/recipes-devtools/python/python3-lru-dict/0001-lru-Use-PyCFunction-instead-of-PyCFunctionWithKeywor.patch
new file mode 100644
index 0000000000..b93d1594da
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-lru-dict/0001-lru-Use-PyCFunction-instead-of-PyCFunctionWithKeywor.patch
@@ -0,0 +1,37 @@
+From 5013406c409a0a143a315146df388281bfb2172d Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 1 Mar 2023 19:53:36 -0800
+Subject: [PATCH] lru: Use PyCFunction instead of PyCFunctionWithKeywords
+
+PyMethodDef uses PyMethodDef and not PyCFunctionWithKeywords and when
+callback is specified as PyCFunctionWithKeywords, clang 16+ is able to
+detect function signature mismatch in function pointers now.
+
+Fixes
+lru.c:629:17: error: incompatible function pointer types initializing 'PyCFunction' (aka 'struct _object *(*)(struct _object *, struct _object *)') with an expression of type 'PyCFunctionWithKeywords' (aka 'struct _object *(*)(struct _object *, struct _object *, struct _object *)') [-Wincompatible-function-pointer-types]
+    {"popitem", (PyCFunctionWithKeywords)LRU_popitem, METH_VARARGS | METH_KEYWORDS,
+                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+1 error generated.
+
+Upstream-Status: Submitted [https://github.com/amitdev/lru-dict/pull/45]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lru.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lru.c b/lru.c
+index 8adcb4b..33c18ab 100644
+--- a/lru.c
++++ b/lru.c
+@@ -626,7 +626,7 @@ static PyMethodDef LRU_methods[] = {
+                     PyDoc_STR("L.setdefault(key, default=None) -> If L has key return its value, otherwise insert key with a value of default and return default")},
+     {"pop", (PyCFunction)LRU_pop, METH_VARARGS,
+                     PyDoc_STR("L.pop(key[, default]) -> If L has key return its value and remove it from L, otherwise return default. If default is not given and key is not in L, a KeyError is raised.")},
+-    {"popitem", (PyCFunctionWithKeywords)LRU_popitem, METH_VARARGS | METH_KEYWORDS,
++    {"popitem", (PyCFunction)LRU_popitem, METH_VARARGS | METH_KEYWORDS,
+                     PyDoc_STR("L.popitem([least_recent=True]) -> Returns and removes a (key, value) pair. The pair returned is the least-recently used if least_recent is true, or the most-recently used if false.")},
+     {"set_size", (PyCFunction)LRU_set_size, METH_VARARGS,
+                     PyDoc_STR("L.set_size() -> set size of LRU")},
+-- 
+2.39.2
+
diff --git a/meta-python/recipes-devtools/python/python3-lru-dict_1.1.8.bb b/meta-python/recipes-devtools/python/python3-lru-dict_1.1.8.bb
index b870bc0889..e825e43dfe 100644
--- a/meta-python/recipes-devtools/python/python3-lru-dict_1.1.8.bb
+++ b/meta-python/recipes-devtools/python/python3-lru-dict_1.1.8.bb
@@ -7,3 +7,5 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=9d10a486ee04034fdef5162fd791f153"
 SRC_URI[sha256sum] = "878bc8ef4073e5cfb953dfc1cf4585db41e8b814c0106abde34d00ee0d0b3115"
 
 inherit pypi setuptools3
+
+SRC_URI += "file://0001-lru-Use-PyCFunction-instead-of-PyCFunctionWithKeywor.patch"
-- 
2.39.2


