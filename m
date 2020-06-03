Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
 by mx.groups.io with SMTP id smtpd.web12.2351.1591225718344570853
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Jun 2020 16:08:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=p2ZMPe63;
 spf=pass (domain: gmail.com, ip: 209.85.210.196, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f196.google.com with SMTP id b201so2486968pfb.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 Jun 2020 16:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hYQWSjBRGd6fH5ZX6lVosi/OavkznuiSXIFA3J5dvYI=;
        b=p2ZMPe63ROQAe2PcdRsAa7e4qVXNSiG16HLbUQKsTNd6IcBcJyKgZRO0oON7C++g4l
         mI9UkLgbLMvscHAPWWnbUYeBNzcWdCos08PJALI00rZhqpVcyMN7Y6zB5k4NBTuXvSqw
         clLlqX2DaIXPuC7k5iqbi4jF8no37KOTz26242F43jx1X7RNZTGwJOhjesECK1SILqN7
         SqGtvWoP+K+Kd34xaVNh2PCmqE/oDa3A7qw77H3FTNkJslV1tj2+B/E4w1vXyRphij6N
         lioKAnB5D0hSPrVosxj7araVXoqgCcX29puOx1vviK8iE3GxlDyUERcuBN3i4HbD9xGY
         ZL/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hYQWSjBRGd6fH5ZX6lVosi/OavkznuiSXIFA3J5dvYI=;
        b=cDN34NqwFfV0G2eEv0vJNpoUAjixSVqw3QBjyQdffsMJs5ied4nkv9fQMLPxbhOit5
         Q3pr0uvG7Zx/gA9N4lC7tb5przmDAyDr+zcEt1HiN443Ei7hUolDT6v9o5jnuT66NCqJ
         HrQCC2IM0cQTC4HLjT5cjIWqm3WfUlArbqeXSR86EPEtmpCVKZcjc3VK5hhHISvgTFaV
         6wrD+osU2WjcfZXIjixS9zS2CCQa0BS13UZbJ1TggkaEd3HGxPwOzki4NEqmknaZIXRX
         ku56Pau9/KG5Vgco8BfRDEKBsWECUVSGLqOxZcNfkVN96KelmSlA/ujvB+GJXHJzf/+W
         KM7A==
X-Gm-Message-State: AOAM532HlGYDvHOO15wImQ6adbSRmEYh2Kegpx47THsYs+Be7DCP3AnQ
	v9ZqRFlsoy2ThFOykmvKFGyHYKIUjB8=
X-Google-Smtp-Source: ABdhPJxABWXDaxXp6xK6ZWEKDoBy8/oMumdd3UoRBBzzGqlxSaWENUnpsSN9oezTo6GouijVcuKjGg==
X-Received: by 2002:aa7:868f:: with SMTP id d15mr1471477pfo.166.1591225717307;
        Wed, 03 Jun 2020 16:08:37 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net (c-73-63-224-124.hsd1.ca.comcast.net. [73.63.224.124])
        by smtp.gmail.com with ESMTPSA id nl5sm3777863pjb.36.2020.06.03.16.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2020 16:08:36 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] multipath-tools: Fix build with json-c 0.14 and newer
Date: Wed,  3 Jun 2020 16:08:32 -0700
Message-Id: <20200603230832.2322617-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...1-fix-boolean-value-with-json-c-0.14.patch | 42 +++++++++++++++++++
 .../multipath-tools/multipath-tools_0.8.4.bb  |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta-oe/recipes-support/multipath-tools/files/0001-fix-boolean-value-with-json-c-0.14.patch

diff --git a/meta-oe/recipes-support/multipath-tools/files/0001-fix-boolean-value-with-json-c-0.14.patch b/meta-oe/recipes-support/multipath-tools/files/0001-fix-boolean-value-with-json-c-0.14.patch
new file mode 100644
index 0000000000..cf97b491e1
--- /dev/null
+++ b/meta-oe/recipes-support/multipath-tools/files/0001-fix-boolean-value-with-json-c-0.14.patch
@@ -0,0 +1,42 @@
+From 5ae81386a8cfea4180738c261cd3f7944a631199 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 3 Jun 2020 16:03:56 -0700
+Subject: [PATCH] fix boolean value with json-c 0.14
+
+Patch from Christian Hesse posted here
+https://www.spinics.net/lists/dm-devel/msg40646.html
+
+Upstream json-c 0.14+ removed the TRUE and FALSE defines in commit
+0992aac61f8b087efd7094e9ac2b84fa9c040fcd.
+
+Upstream-Status: Submitted [https://www.spinics.net/lists/dm-devel/msg40646.html]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ libdmmp/libdmmp_private.h | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/libdmmp/libdmmp_private.h b/libdmmp/libdmmp_private.h
+index ac85b63f..29400826 100644
+--- a/libdmmp/libdmmp_private.h
++++ b/libdmmp/libdmmp_private.h
+@@ -82,7 +82,7 @@ static out_type func_name(struct dmmp_context *ctx, const char *var_name) { \
+ do { \
+ 	json_type j_type = json_type_null; \
+ 	json_object *j_obj_tmp = NULL; \
+-	if (json_object_object_get_ex(j_obj, key, &j_obj_tmp) != TRUE) { \
++	if (json_object_object_get_ex(j_obj, key, &j_obj_tmp) != 1) { \
+ 		_error(ctx, "Invalid JSON output from multipathd IPC: " \
+ 		       "key '%s' not found", key); \
+ 		rc = DMMP_ERR_IPC_ERROR; \
+@@ -90,7 +90,7 @@ do { \
+ 	} \
+ 	if (j_obj_tmp == NULL) { \
+ 		_error(ctx, "BUG: Got NULL j_obj_tmp from " \
+-		       "json_object_object_get_ex() while it return TRUE"); \
++		       "json_object_object_get_ex() while it return 1"); \
+ 		rc = DMMP_ERR_BUG; \
+ 		goto out; \
+ 	} \
+-- 
+2.27.0
+
diff --git a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.4.bb b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.4.bb
index af34a4b392..0d03191373 100644
--- a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.4.bb
+++ b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.4.bb
@@ -45,6 +45,7 @@ SRC_URI = "git://git.opensvc.com/multipath-tools/.git;protocol=http \
            file://0031-Always-use-devmapper-for-kpartx.patch \
            file://0001-fix-bug-of-do_compile-and-do_install.patch \
            file://0001-add-explicit-dependency-on-libraries.patch \
+           file://0001-fix-boolean-value-with-json-c-0.14.patch \
            "
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
-- 
2.27.0

