Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.10717.1593562051405518079
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Jun 2020 17:07:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Sy0fHZ2X;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id u185so8118408pfu.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2020 17:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=EFcX5bwIQ8avHFLhJGq3gsRKU+ho+KnRjBLCckTBCcY=;
        b=Sy0fHZ2X1209EE2X4Uan72DcMqPAskr4XKaa9cO0/FKD6xzSU4XYSh0bCXvwi7qEyB
         xHKHXhTaU1nJ3PAyCUPmv6fMVNJ11csGUClpzkupXM8S/HlpeCYRjUYZ8IbQdGLEJVUo
         RKbyiEZh80uAvptd7KNS229iEbdQ0DUjD2hxVWQCzFk4v8BkHGjP+pMmmUdLBMVccq3g
         lNqONsey4lDm3I+5y9zbbd5SHXchmAWP8gMLut0xMk8CNFk+aTgf72xIFEzr2rWtwVCx
         E66rgwkgQjpRDWIoQ8Eu7mygUWd3gKm48FJh2n53kV4Xsb2+2weoQYZdYgR+t+tGmhC0
         6zvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=EFcX5bwIQ8avHFLhJGq3gsRKU+ho+KnRjBLCckTBCcY=;
        b=hyQTCcrbXq4SQC19jut//y8Oil3P41RdxCNXbXvWa+6AraOBvXbUQId8lGyVz/UtI+
         FO8lqVzg9CVOw6bWJjN63XhQr480jNfZVloE/Ukad9FnRCGswEPYs6Jyrq0WxgaKtdmM
         fEvify4NJ2RGKKslR/ihQxrE+FWuz7s3ztrfKOsJIh3Sg1/3l9tFlNwCO9kWvCcl0qx+
         kcjW4KcZrHrqPrFfloIiHPammWqVJu5TXi/cA+5MxANRYKpLig02volEH0PnT7Km1Hno
         gNz4vYe179FTUH5IPG8cL0hHPzQqbM3nLE3HkkELIpAORyT4sK//QwlFZNwM1LexuRfF
         PYNg==
X-Gm-Message-State: AOAM5301ba2zl0yueP05wa2lYBpz/p8ZYpHVFishe89A2z4JZ3thwsIU
	UnicYGV7Oq3frjkxnbv8Nk5Fx66OBm0=
X-Google-Smtp-Source: ABdhPJy7UsFP8YNd+b0BZ9EgNVGyKmQfQt4WJMew2FW6uUZkhiO3I1AhWVAWlcNJqND5t+EBKl0RFg==
X-Received: by 2002:a63:7f41:: with SMTP id p1mr17603899pgn.215.1593562050701;
        Tue, 30 Jun 2020 17:07:30 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:c85d:3ce:5443:9164])
        by smtp.gmail.com with ESMTPSA id z2sm3940544pff.36.2020.06.30.17.07.29
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2020 17:07:30 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfel 08/32] multipath-tools: Fix build with json-c 0.14 and newer
Date: Tue, 30 Jun 2020 17:06:53 -0700
Message-Id: <d345970f40c6f9caae869f048c358f598d37e109.1593561840.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1593561840.git.akuster808@gmail.com>
References: <cover.1593561840.git.akuster808@gmail.com>

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 1b0ce2ce1d388d223ff337e5683d9b026b7082ba)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
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
2.17.1

