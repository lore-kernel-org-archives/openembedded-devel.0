Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.2313.1612941207794756489
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Feb 2021 23:13:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RV8W1F68;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: rfried.dev@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id f16so894191wmq.5
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 Feb 2021 23:13:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=kkw8Gxw/XVF7uGsvTjcGGkdSvEr+Q5mX5dmGT0Cv72A=;
        b=RV8W1F68v37S5Ivvkj/JT+tu2TSUbLCmzqzj8SOayQaEQM3rqicHPuc/WaCyVm1ry+
         NUBCP3vVjmLv1cNE5/xB4cXWQA03CTfmi4me5nZYTXNRjanUz/wA/EWIRSKfalo8WSa+
         rZ3wjcLjVV40hWBnMMyZWTu7s5cHiq67W/LSC2jXcg8b0z9d14OpaSu70YlEDjZ+LBgw
         sSmEJ8Xu+PGqMPk3Wt7DdJ5CDNxYDESuzycYaoh7vJCm86vjcbXx/RL4OEpUMMOXeaez
         Itc4BAgEgqesv/9hKrdY+GtNTeTENzVIp914Ms1/3RCEVFVWDXF7QPDmAjCqWYSrXkS/
         fZgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=kkw8Gxw/XVF7uGsvTjcGGkdSvEr+Q5mX5dmGT0Cv72A=;
        b=YQEJDx4uaSVaAWlunnqX13tW0w852mdg+vL/9JhpR1hqjhCqCSq0CHwinkV9OlnQZX
         luXu7pveN7g1A0QtzsUarPosFqv0awYzpFW8aIfBT9o+UPkIBNR63Nx4Q+f5QTuXnsrQ
         aV7kfF7wB2U0z3nTbocxpRRpqndBpX3nhuI1W1iUx/TgUv0pIRE1eaZS2SX6WYPF1EC/
         QvwmZl74ZzSHEjlXBqIXPZH9pwtqXqEERKAcPKqoajRYhbBMK+OwjarL1aW/WvDX15fJ
         kosQST9aMcVhwycLa61MSyCjLi8sPqQFS/XePAz+0dl6PGSTqz9bxeb2K6Ez1fyWMBg8
         HeCw==
X-Gm-Message-State: AOAM531/igW7m3LXNNRJdZqNUMqjfMnec03GZodjLgfxVGTWX9u6H+H7
	JB5yMn2FUYyhBc3wc2jA+r8ISUNM14E6KQ==
X-Google-Smtp-Source: ABdhPJyOGswamz6gyV7qzUDdWVhNmKpuFu9K+Mw5xdZlE0HyNuVpkkjwsublMS0rCf9WBvvUBnEyow==
X-Received: by 2002:a1c:a553:: with SMTP id o80mr1577581wme.20.1612941205908;
        Tue, 09 Feb 2021 23:13:25 -0800 (PST)
Return-Path: <rfried.dev@gmail.com>
Received: from lotus.nr.ent (82.166.25.98.fix.netvision.net.il. [82.166.25.98])
        by smtp.gmail.com with ESMTPSA id 9sm1722350wra.80.2021.02.09.23.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Feb 2021 23:13:25 -0800 (PST)
From: "Ramon Fried" <rfried.dev@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ramon Fried <rfried.dev@gmail.com>
Subject: [meta-oe][PATCH v2 2/2] fluentbit: Fix SIGSEGV caused by using flb_free instead of mk_mem_free
Date: Wed, 10 Feb 2021 09:15:22 +0200
Message-Id: <20210210071522.30482-2-rfried.dev@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210210071522.30482-1-rfried.dev@gmail.com>
References: <20210210071522.30482-1-rfried.dev@gmail.com>

Signed-off-by: Ramon Fried <rfried.dev@gmail.com>
---
v2: No changes

 ...caused-by-using-flb_free-instead-of-.patch | 43 ++++++++++
 ...GV-caused-by-using-flb_free-instead-.patch | 82 +++++++++++++++++++
 .../fluentbit/fluentbit_1.3.5.bb              |  4 +-
 3 files changed, 128 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit/0001-bin-fix-SIGSEGV-caused-by-using-flb_free-instead-of-.patch
 create mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit/0002-parser-Fix-SIGSEGV-caused-by-using-flb_free-instead-.patch

diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0001-bin-fix-SIGSEGV-caused-by-using-flb_free-instead-of-.patch b/meta-oe/recipes-extended/fluentbit/fluentbit/0001-bin-fix-SIGSEGV-caused-by-using-flb_free-instead-of-.patch
new file mode 100644
index 000000000..a6ff5991c
--- /dev/null
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit/0001-bin-fix-SIGSEGV-caused-by-using-flb_free-instead-of-.patch
@@ -0,0 +1,43 @@
+From 3d7390c89c2205d1eed0384be0bb65adb675e60d Mon Sep 17 00:00:00 2001
+From: Ramon Fried <ramon@neureality.ai>
+Date: Tue, 9 Feb 2021 18:59:59 +0200
+Subject: [PATCH] bin: fix SIGSEGV caused by using flb_free instead of
+ mk_mem_free
+
+Upstream-Status: Accepted
+Signed-off-by: Ramon Fried <ramon@neureality.ai>
+---
+ src/fluent-bit.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/fluent-bit.c b/src/fluent-bit.c
+index c0c73b4..989cfde 100644
+--- a/src/fluent-bit.c
++++ b/src/fluent-bit.c
+@@ -289,7 +289,7 @@ static int input_set_property(struct flb_input_instance *in, char *kv)
+                 in->p->name, key);
+     }
+ 
+-    flb_free(key);
++    mk_mem_free(key);
+     return ret;
+ }
+ 
+@@ -314,7 +314,7 @@ static int output_set_property(struct flb_output_instance *out, char *kv)
+     }
+ 
+     ret = flb_output_set_property(out, key, value);
+-    flb_free(key);
++    mk_mem_free(key);
+     return ret;
+ }
+ 
+@@ -340,7 +340,7 @@ static int filter_set_property(struct flb_filter_instance *filter, char *kv)
+     }
+ 
+     ret = flb_filter_set_property(filter, key, value);
+-    flb_free(key);
++    mk_mem_free(key);
+     return ret;
+ }
+ 
diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0002-parser-Fix-SIGSEGV-caused-by-using-flb_free-instead-.patch b/meta-oe/recipes-extended/fluentbit/fluentbit/0002-parser-Fix-SIGSEGV-caused-by-using-flb_free-instead-.patch
new file mode 100644
index 000000000..91675dfc6
--- /dev/null
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit/0002-parser-Fix-SIGSEGV-caused-by-using-flb_free-instead-.patch
@@ -0,0 +1,82 @@
+From 7c3b1dfb174312594d3317c24ed71c60398f653f Mon Sep 17 00:00:00 2001
+From: Ramon Fried <ramon@neureality.ai>
+Date: Wed, 10 Feb 2021 04:23:36 +0200
+Subject: [PATCH] parser: Fix SIGSEGV caused by using flb_free instead of
+ mk_mem_free
+
+Upstream-Status: Backport (fix only for 1.3.5)
+Signed-off-by: Ramon Fried <ramon@neureality.ai>
+---
+ src/flb_parser.c | 28 ++++++++++++++--------------
+ 1 file changed, 14 insertions(+), 14 deletions(-)
+
+diff --git a/src/flb_parser.c b/src/flb_parser.c
+index d35c568..7c20e12 100644
+--- a/src/flb_parser.c
++++ b/src/flb_parser.c
+@@ -490,7 +490,7 @@ int flb_parser_conf_file(const char *file, struct flb_config *config)
+                                        MK_RCONF_STR);
+         if (str) {
+             time_keep = flb_utils_bool(str);
+-            flb_free(str);
++            mk_mem_free(str);
+         }
+         else {
+             time_keep = FLB_FALSE;
+@@ -522,23 +522,23 @@ int flb_parser_conf_file(const char *file, struct flb_config *config)
+ 
+         flb_debug("[parser] new parser registered: %s", name);
+ 
+-        flb_free(name);
+-        flb_free(format);
++        mk_mem_free(name);
++        mk_mem_free(format);
+ 
+         if (regex) {
+-            flb_free(regex);
++            mk_mem_free(regex);
+         }
+         if (time_fmt) {
+-            flb_free(time_fmt);
++            mk_mem_free(time_fmt);
+         }
+         if (time_key) {
+-            flb_free(time_key);
++            mk_mem_free(time_key);
+         }
+         if (time_offset) {
+-            flb_free(time_offset);
++            mk_mem_free(time_offset);
+         }
+         if (types_str) {
+-            flb_free(types_str);
++            mk_mem_free(types_str);
+         }
+ 
+         decoders = NULL;
+@@ -548,19 +548,19 @@ int flb_parser_conf_file(const char *file, struct flb_config *config)
+     return 0;
+ 
+  fconf_error:
+-    flb_free(name);
+-    flb_free(format);
++    mk_mem_free(name);
++    mk_mem_free(format);
+     if (regex) {
+-        flb_free(regex);
++        mk_mem_free(regex);
+     }
+     if (time_fmt) {
+-        flb_free(time_fmt);
++        mk_mem_free(time_fmt);
+     }
+     if (time_key) {
+-        flb_free(time_key);
++        mk_mem_free(time_key);
+     }
+     if (types_str) {
+-        flb_free(types_str);
++        mk_mem_free(types_str);
+     }
+     if (decoders) {
+         flb_parser_decoder_list_destroy(decoders);
diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit_1.3.5.bb b/meta-oe/recipes-extended/fluentbit/fluentbit_1.3.5.bb
index 0b7d11e16..eac267041 100644
--- a/meta-oe/recipes-extended/fluentbit/fluentbit_1.3.5.bb
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit_1.3.5.bb
@@ -16,7 +16,9 @@ SRC_URI = "http://fluentbit.io/releases/1.3/fluent-bit-${PV}.tar.gz \
            file://cross-build-init-system-detection.patch \
            file://builtin-nan.patch \
            file://0001-ppc-Fix-signature-for-co_create-API.patch \
-          "
+           file://0001-bin-fix-SIGSEGV-caused-by-using-flb_free-instead-of-.patch \
+           file://0002-parser-Fix-SIGSEGV-caused-by-using-flb_free-instead-.patch \
+           "
 SRC_URI[md5sum] = "6eae6dfd0a874e5dd270c36e9c68f747"
 SRC_URI[sha256sum] = "e037c76c89269c8dc4027a08e442fefd2751b0f1e0f9c38f9a4b12d781a9c789"
 
-- 
2.17.1

